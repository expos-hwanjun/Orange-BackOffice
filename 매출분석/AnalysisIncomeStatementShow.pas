unit AnalysisIncomeStatementShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, Math,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TAnalysisIncomeStatementShowForm = class(TInheritShowForm)
    GridTableViewContent: TcxGridColumn;
    GridTableViewContentAmt: TcxGridColumn;
    GridTableViewAmt: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisIncomeStatementShowForm: TAnalysisIncomeStatementShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TAnalysisIncomeStatementShowForm }
procedure TAnalysisIncomeStatementShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매출분석/손익계산서/손익계산서.htm';
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TAnalysisIncomeStatementShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
//  Exit;
  if GridTableView.DataController.RecordCount = 0 then Exit;
  if (ARecord = nil) or (AItem = nil) then Exit;

  case StoI(Copy(NVL(ARecord.Values[0],'0'),1,1)) of
    1,6   : AStyle := StyleFontBlue;  //수익
    2,4,7 : AStyle := StyleFontRed;   //비용
    8     : AStyle := StyleFontBlackBold;
  end;
end;

function TAnalysisIncomeStatementShowForm.DoSearch: Boolean;
var vCardFee : Double;
    vCardAmt, vCol, vRow, vTotalAmt :Integer;
begin
  try
    OpenQuery('select CARD_FEE '
             +'  from MS_STORE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [HeadStoreCode,
              StoreCode]);
    vCardFee := Query.Fields[0].AsFloat / 100;
  finally
    FinishQuery;
  end;
  try
    OpenQuery('select ''1'' as seq, '
             +'       ''1. 매출액'' as NM_ACCT, '
             +'       sum(AMT_SALE) as AMT_SALE, '
             +'       '''' as remark '
             +'   from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
             +'  where CD_HEAD  =:P0 '
             +'    and CD_STORE =:P1 '
             +'    and DS_SALE <> ''v'' '
             +'    and YMD_SALE between :P2 and :P3 '
             +' union all '
             +' select ''2'', '
             +'        ''2. 매입액'', '
             +'        Ifnull(sum(AMT_BUY-AMT_DC),0), '
             +'        ''''  '
             +'   from SL_BUY_H '
             +'  where CD_HEAD  =:P0 '
             +'    and CD_STORE =:P1 '
             +'    and YMD_BUY between :P2 and :P3 '
             +' union all '
             +' select ''3'', '
             +'        ''4. 판매비와 관리비'', '
             +'        Ifnull(sum(AMT_OUT),0), '
             +'        '''' '
             +'   from SL_ACCT a inner join '
             +'        MS_CODE b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ACCT = b.CD_CODE '
             +'  where a.CD_HEAD   =:P0 '
             +'    and a.CD_STORE = :P1'
             +'    and b.CD_KIND   =''11'' '
             +'    and b.NM_CODE2 = ''1'' '
             +'    and b.NM_CODE3 = ''0'' '
             +'    and a.YMD_OCCUR between :P2 and :P3 '
             +' union all '
             +' select ''4'' , '
             +'        ''6. 영업외 수익'', '
             +'        Ifnull(sum(AMT_PAYIN),0), '
             +'        '''' '
             +'   from SL_ACCT a inner join '
             +'        MS_CODE b on a.CD_HEAD  = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ACCT  = b.CD_CODE '
             +'  where a.CD_HEAD   =:P0 '
             +'    and a.CD_STORE  =:P1 '
             +'    and b.CD_KIND   =''11'' '
             +'    and b.NM_CODE2 = ''0'' '
             +'    and b.NM_CODE3 = ''4'' '
             +'    and a.YMD_OCCUR between :P2 and :P3 '
             +' union all '
             +' select ''5'', '
             +'        ''7. 영업외 비용'', '
             +'        Ifnull(sum(AMT_OUT),0), '
             +'        '''' '
             +'   from SL_ACCT a inner join '
             +'        MS_CODE b on a.CD_HEAD  = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ACCT  = b.CD_CODE'
             +'  where a.CD_HEAD   =:P0 '
             +'    and a.CD_STORE  =:P1 '
             +'    and b.CD_KIND   =''11'' '
             +'    and b.NM_CODE2 = ''1'' '
             +'    and b.NM_CODE3 = ''4'' '
             +'    and a.YMD_OCCUR between :P2 and :P3 ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);

    GridTableView.DataController.RecordCount := 0;
    vCardAmt  := 0;
    vTotalAmt := 0;
    while not Query.Eof do
    begin
      with GridTableView.DataController do
      begin
        AppendRecord;
        Values[RecordCount-1, GridTableViewContent.Index]    := Query.Fields[1].AsString;
        Values[RecordCount-1, GridTableViewContentAmt.Index] := 0;

        if Query.Fields[0].AsInteger = 5 then
          Values[RecordCount-1, GridTableViewAmt.Index] := Query.Fields[2].AsInteger + Ceil(RoundNumber(vCardAmt * vCardFee))
        else
          Values[RecordCount-1, GridTableViewAmt.Index] := Query.Fields[2].AsInteger;
        Values[RecordCount-1, GridTableViewRemark.Index] := Query.Fields[3].AsString;

        case Query.Fields[0].AsInteger of
          1 :
          begin
            vTotalAmt := Query.Fields[2].AsInteger;
            try
              DM.OpenQuery('select Sum(AMT_CASH+AMT_CHECK+AMT_BANK), '
                          +'       Sum(AMT_CARD), '
                          +'       Sum(AMT_GIFT), '
                          +'       Sum(AMT_TRUST), '
                          +'       Sum(AMT_BANK), '
                          +'       Sum(AMT_POINT) '
                          +'  from SL_SALE_H_SUM '
                          +' where CD_HEAD  =:P0 '
                          +'   and CD_STORE =:P1 '
                          +'   and YMD_SALE between :P2 and :P3 ',
                          [HeadStoreCode,
                           StoreCode,
                           DtoS(ConditionToolBarFromDateEdit.Date),
                           DtoS(ConditionToolBarToDateEdit.Date)]);
              if not DM.Query.Eof then
              begin
                for vCol := 1 to 6 do
                begin
                  AppendRecord;
                  case vCol of
                    1 : Values[RecordCount-1, GridTableViewContent.Index]    := ' - 현금매출';
                    2 : Values[RecordCount-1, GridTableViewContent.Index]    := ' - 카드매출';
                    3 : Values[RecordCount-1, GridTableViewContent.Index]    := ' - 상품권매출';
                    4 : Values[RecordCount-1, GridTableViewContent.Index]    := ' - 외상매출';
                    5 : Values[RecordCount-1, GridTableViewContent.Index]    := ' - 계좌이체';
                    6 : Values[RecordCount-1, GridTableViewContent.Index]    := ' - 포인트매출';
                  end;
                  if vCol = 2 then
                    vCardAmt := vCardAmt + DM.Query.Fields[1].AsInteger;

                  Values[RecordCount-1, GridTableViewContentAmt.Index] := DM.Query.Fields[vCol-1].AsInteger;
                  Values[RecordCount-1, GridTableViewAmt.Index]        := 0;
                end;
              end;
            finally
              DM.FinishQuery;
            end;
          end;
          2 :  //총영업이익
          begin
            vTotalAmt := vTotalAmt - Query.Fields[2].AsInteger;
            AppendRecord;
            Values[RecordCount-1, GridTableViewContent.Index]        := '3. 총영업이익';
            Values[RecordCount-1, GridTableViewContentAmt.Index]     := 0;
            Values[RecordCount-1, GridTableViewAmt.Index]            := vTotalAmt;
            Values[RecordCount-1, GridTableViewRemark.Index]         := '매출액 - 매입액';
          end;
          3 : //판매비와 관리비
          begin
            vTotalAmt := vTotalAmt - Query.Fields[2].AsInteger;
            try
              DM.OpenQuery('select b.NM_CODE1, '
                          +'       Sum(a.AMT_OUT) '
                          +'  from SL_ACCT a inner join '
                          +'       MS_CODE b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ACCT = b.CD_CODE '
                          +' where a.CD_HEAD  =:P0 '
                          +'   and a.CD_STORE =:P1 '
                          +'   and b.CD_KIND  =''11'' '
                          +'   and b.NM_CODE2 =''1'' '
                          +'   and b.NM_CODE3 =''0'' '
                          +'   and a.YMD_OCCUR between :P2 and :P3 '
                          +' group by b.NM_CODE1 ',
                          [HeadStoreCode,
                           StoreCode,
                           DtoS(ConditionToolBarFromDateEdit.Date),
                           DtoS(ConditionToolBarToDateEdit.Date)]);
              while not DM.Query.Eof do
              begin
                AppendRecord;
                Values[RecordCount-1, GridTableViewContent.Index]        := ' - '+DM.Query.Fields[0].AsString;
                Values[RecordCount-1, GridTableViewContentAmt.Index]     := DM.Query.Fields[1].AsInteger;
                Values[RecordCount-1, GridTableViewAmt.Index]            := 0;
                DM.Query.Next;
              end;
              AppendRecord;
              Values[RecordCount-1, GridTableViewContent.Index]        := '5. 영업이익';
              Values[RecordCount-1, GridTableViewContentAmt.Index]     := 0;
              Values[RecordCount-1, GridTableViewAmt.Index]            := vTotalAmt;
              Values[RecordCount-1, GridTableViewRemark.Index]         := '매출액 - 매입액 - 판매비와 관리비';
            finally
              DM.FinishQuery;
            end;
          end;
          4 : //영업외 수익
          begin
            vTotalAmt := vTotalAmt + Query.Fields[2].AsInteger;
            try
              DM.OpenQuery('select b.NM_CODE1, '
                          +'       Sum(a.AMT_PAYIN) '
                          +'  from SL_ACCT a inner join '
                          +'       MS_CODE b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ACCT = b.CD_CODE '
                          +' where a.CD_HEAD  =:P0 '
                          +'   and a.CD_STORE =:P1 '
                          +'   and b.CD_KIND  =''11'' '
                          +'   and b.NM_CODE2 =''0'' '
                          +'   and b.NM_CODE3 =''4'' '
                          +'   and a.YMD_OCCUR between :P2 and :P3 '
                          +' group by b.NM_CODE1 ',
                          [HeadStoreCode,
                           StoreCode,
                           DtoS(ConditionToolBarFromDateEdit.Date),
                           DtoS(ConditionToolBarToDateEdit.Date)]);
              while not DM.Query.Eof do
              begin
                AppendRecord;
                Values[RecordCount-1, GridTableViewContent.Index]        := ' - '+DM.Query.Fields[0].AsString;
                Values[RecordCount-1, GridTableViewContentAmt.Index]     := DM.Query.Fields[1].AsInteger;
                Values[RecordCount-1, GridTableViewAmt.Index]            := 0;
                DM.Query.Next;
              end;
            finally
              DM.FinishQuery;
            end;
          end;
          5 :  //영업외 비용
          begin
            vTotalAmt := vTotalAmt - Query.Fields[2].AsInteger - Ceil(RoundNumber(vCardAmt * vCardFee));
            AppendRecord;
            Values[RecordCount-1, GridTableViewContent.Index]        := ' - 카드수수료';
            Values[RecordCount-1, GridTableViewContentAmt.Index]     := vCardAmt * vCardFee;
            Values[RecordCount-1, GridTableViewAmt.Index]            := 0;
            Values[RecordCount-1, GridTableViewRemark.Index]         := FloatToStr(vCardFee * 100) + ' %';

            try
              DM.OpenQuery('select b.NM_CODE1, '
                          +'       Sum(a.AMT_OUT) '
                          +'  from SL_ACCT a inner join '
                          +'       MS_CODE b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ACCT = b.CD_CODE'
                          +' where a.CD_HEAD  =:P0 '
                          +'   and a.CD_STORE =:P1 '
                          +'   and b.CD_KIND  = ''11'' '
                          +'   and b.NM_CODE2 = ''1'' '
                          +'   and b.NM_CODE3 = ''4'' '
                          +'   and a.YMD_OCCUR between :P2 and :P3 '
                          +' group by b.NM_CODE1 ',
                          [HeadStoreCode,
                           StoreCode,
                           DtoS(ConditionToolBarFromDateEdit.Date),
                           DtoS(ConditionToolBarToDateEdit.Date)]);
              while not DM.Query.Eof do
              begin
                AppendRecord;
                Values[RecordCount-1, GridTableViewContent.Index]        := ' - '+DM.Query.Fields[0].AsString;
                Values[RecordCount-1, GridTableViewContentAmt.Index]     := DM.Query.Fields[1].AsInteger;
                Values[RecordCount-1, GridTableViewAmt.Index]            := 0;
                DM.Query.Next;
              end;
            finally
              DM.FinishQuery;
            end;

            AppendRecord;
            Values[RecordCount-1, GridTableViewContent.Index]        := '8. 세금 차감전 순이익';
            Values[RecordCount-1, GridTableViewContentAmt.Index]     := 0;
            Values[RecordCount-1, GridTableViewAmt.Index]            := vTotalAmt;
            Values[RecordCount-1, GridTableViewRemark.Index]         := '매출액-매입액-판매비와 관리비+영업외수익-영업외비용';
          end;
        end;
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
    Result := true;
  end;
end;



end.
