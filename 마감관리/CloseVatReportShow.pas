unit CloseVatReportShow;

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
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCloseVatReportShowForm = class(TInheritShowForm)
    GridTableViewCardName: TcxGridColumn;
    GridTableViewCount: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewVatAmt: TcxGridColumn;
    GridTableViewTipAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
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
  CloseVatReportShowForm: TCloseVatReportShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

function TCloseVatReportShowForm.DoSearch: Boolean;
var nCol, nRow, vCnt, vDutyAmt, vVatAmt, vTipAmt, vTotAmt :Integer;
    vCnt1, vDutyAmt1, vVatAmt1, vTipAmt1, vTotAmt1 :Integer;
    vCardFee : Double;
    vTemp    : String;
begin
  try
    vCnt  := 0; vDutyAmt  := 0; vVatAmt  := 0; vTipAmt  := 0; vTotAmt  := 0;
    vCnt1 := 0; vDutyAmt1 := 0; vVatAmt1 := 0; vTipAmt1 := 0; vTotAmt1 := 0;
    OpenQuery('select case when Ifnull(Max(b.NM_CODE1),'''') = '''' then case when Ifnull(a.NM_CARD_BUY, '''') = '''' then ''단말기'' else Ifnull(Max(a.NM_CARD_BUY),''단말기'') end else Max(b.NM_CODE1) end AS NM_CARD_BUY, '
            +'        Sum(case when  a.DS_TRD = ''A''  then 1 else -1 end )  as CNT_TOTAL, '
            +'        Sum(Ifnull(case a.DS_TRD when ''A'' then Ifnull(a.AMT_APPROVAL-a.AMT_VAT,0) else Ifnull(a.AMT_APPROVAL-a.AMT_VAT,0) * -1 end, 0)) as AMT_DUTY, '
            +'        Sum(Ifnull(case a.DS_TRD when ''A'' then Ifnull(a.AMT_VAT,0) else Ifnull(a.AMT_VAT,0) * -1 end, 0)) as AMT_TAX, '
            +'        Sum(Ifnull(case a.DS_TRD when ''A'' THEN Ifnull(a.AMT_TIP,0) ELSE Ifnull(a.AMT_TIP,0) * -1 end, 0)) as AMT_TIP, '
            +'        Sum(Ifnull(case a.DS_TRD when ''A'' then Ifnull(a.AMT_APPROVAL,0) else Ifnull(a.AMT_APPROVAL,0) * -1 end, 0)) as AMT_TOTAL, '
            +'        '''' as BIGO '
            +'  from  '+GetPartitionTable('SL_CARD', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'a left outer join')
            +'        MS_CODE   b on a.CD_HEAD    = b.CD_HEAD '
            +'                   and a.CD_STORE   = b.CD_STORE '
            +'                   and a.NO_CHAINPL = b.NM_CODE2 '
            +'                   and b.CD_KIND    = ''06'' inner join '
            +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'c')
            +'                    on a.CD_HEAD  = c.CD_HEAD '
            +'                   and a.CD_STORE = c.CD_STORE '
            +'                   and a.YMD_SALE = c.YMD_SALE '
            +'                   and a.NO_POS   = c.NO_POS '
            +'                   and a.NO_RCP   = c.NO_RCP '
            +' where a.CD_HEAD  =:P0 '
            +'   and a.CD_STORE =:P1 '
            +Ifthen(ConditionToolBarComboBox.ItemIndex=0,' and Date_Format(c.DT_SALE, ''%Y%m%d'') Between :P2 and :P3 ',' and a.YMD_SALE between :P2 and :P3 ')
            +'   and c.DS_SALE <> ''V'' '
            +' group by a.CD_STORE, a.NM_CARD_BUY '
            +' union all '
            +'select ''      [ 소계 ]'', '
            +'       Sum(case WHEN a.DS_TRD = ''A''  then 1 else -1 end )  as CNT_TOTAL, '
            +'       Sum(Ifnull(case a.DS_TRD when ''A'' then Ifnull(a.AMT_APPROVAL-a.AMT_VAT,0) else Ifnull(a.AMT_APPROVAL-a.AMT_VAT,0) * -1 end, 0)) as AMT_DUTY, '
            +'       Sum(Ifnull(case a.DS_TRD when ''A'' then Ifnull(a.AMT_VAT,0) else Ifnull(a.AMT_VAT,0) * -1 end, 0)) as AMT_TAX, '
            +'       Sum(Ifnull(case a.DS_TRD when ''A'' then Ifnull(a.AMT_TIP,0) else Ifnull(a.AMT_TIP,0) * -1 end, 0)) as AMT_TIP, '
            +'       Sum(Ifnull(case a.DS_TRD when ''A'' then Ifnull(a.AMT_APPROVAL,0) else Ifnull(a.AMT_APPROVAL,0) * -1 end, 0)) as AMT_TOTAL, '
            +'       '''' '
            +'  from  '+GetPartitionTable('SL_CARD', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'a left outer join')
            +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'b')
            +'                   on a.CD_HEAD  = b.CD_HEAD '
            +'                  and a.CD_STORE = b.CD_STORE '
            +'                  and a.YMD_SALE = b.YMD_SALE '
            +'                  and a.NO_POS   = b.NO_POS '
            +'                  and a.NO_RCP   = b.NO_RCP '
            +' where a.CD_HEAD  =:P0 '
            +'   and a.CD_STORE =:P1 '
            +Ifthen(ConditionToolBarComboBox.ItemIndex=0,'   and Date_Format(b.DT_SALE, ''%Y%m%d'') Between :P2 and :P3 ','and a.YMD_SALE between :P2 and :P3 ')
            +'   and b.DS_SALE <> ''V'' '
            +' group by a.CD_STORE '
            +' union all '
            +'select ''현금영수증'', '
            +'       Sum(case when a.DS_TRD = ''A''  then 1 else -1 end )  as CNT_TOTAL,  '
            +'       Sum(Ifnull(a.AMT_APPROVAL-a.AMT_VAT,0)) as AMT_DUTY, '
            +'       Sum(Ifnull(a.AMT_VAT,0)) as AMT_TAX, '
            +'       0 as AMT_TIP, '
            +'       Sum(Ifnull(a.AMT_APPROVAL,0)) as AMT_TOTAL,  '
            +'       '''' '
            +'  from SL_CASH   a inner join '
            +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'b')
            +'                   on a.CD_HEAD  = b.CD_HEAD '
            +'                  and a.CD_STORE = b.CD_STORE '
            +'                  and a.YMD_SALE = b.YMD_SALE '
            +'                  and a.NO_POS   = b.NO_POS '
            +'                  and a.NO_RCP   = b.NO_RCP '
            +' where a.CD_HEAD  =:P0 '
            +'   and a.CD_STORE =:P1 '
            +Ifthen(ConditionToolBarComboBox.ItemIndex=0,' and Date_Format(b.DT_SALE, ''%Y%m%d'') Between :P2 and :P3 ',' and a.YMD_SALE between :P2 and :P3 ')
            +'   and b.DS_SALE <> ''V'' '
            +' group by a.CD_STORE '
            +' union all '
            +' select ''현금'', '
            +'        Count(h.YMD_SALE) as CNT_TOTAL, '
            +'        Ceil(DivFlt(SUM(d.AMT_NET+d.AMT_DUTYFREE), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) '
            +'        - DivInt(Ceil(DivFlt(SUM(d.AMT_NET), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)), 11) as AMT_DUTY, '
            +'        DivInt(Ceil(DivFlt(SUM(d.AMT_NET), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)), 11) as AMT_TAX, '
            +'        0 as AMT_TIP, '
            +'        Ceil(DivFlt(SUM(d.AMT_NET+d.AMT_DUTYFREE), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) as AMT_TOTAL, '
            +'        '''' '
            +'   from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h inner join')
            +'        (select a.YMD_SALE, '
            +'                a.NO_POS, '
            +'                a.NO_RCP, '
            +'                case when Max(a.AMT_VAT)  = 0 then Sum(a.AMT_SALE-a.DC_TOT) else 0 end AMT_DUTYFREE, '
            +'                case when Max(a.AMT_VAT) <> 0 then Sum(a.AMT_SALE-a.DC_TOT) else 0 end AMT_NET '
            +'           from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a')
            +Ifthen(ConditionToolBarComboBox.ItemIndex=0,'inner join '
            +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'b')
            +'                              on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.YMD_SALE = a.YMD_SALE and b.NO_POS = a.NO_POS and b.NO_RCP = a.NO_RCP ','')
            +'          where a.CD_HEAD  = :P0 '
            +'            and a.CD_STORE = :P1 '
            +Ifthen(ConditionToolBarComboBox.ItemIndex=0,' and Date_Format(b.DT_SALE, ''%Y%m%d'') Between :P2 and :P3  ',' and a.YMD_SALE between :P2 and :P3 ')
//            +'            and DS_SALE  <> ''V'' '
            +'          group by a.YMD_SALE, a.NO_POS, a.NO_RCP '
            +'         ) as d on h.YMD_SALE = d.YMD_SALE and h.NO_POS = d.NO_POS and h.NO_RCP = d.NO_RCP '
            +'  where h.CD_HEAD  =:P0 '
            +'    and h.CD_STORE =:P1 '
            +'    and h.DS_SALE  <> ''V'' '
            +Ifthen(ConditionToolBarComboBox.ItemIndex=0,' and Date_Format(h.DT_SALE, ''%Y%m%d'') Between :P2 and :P3  ','and h.YMD_SALE between :P2 and :P3 ')
            +'    and (h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP) <> 0 ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarfromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);

    GridTableView.DataController.RecordCount := 0;
    GridTableView.DataController.BeginUpdate;
    while not Query.Eof do
    begin
      GridTableView.DataController.AppendRecord;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := Query.Fields[0].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := Query.Fields[1].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 2] := Query.Fields[2].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 3] := Query.Fields[3].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 4] := Query.Fields[4].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 5] := Query.Fields[5].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 6] := Query.Fields[6].AsString;

     if (Query.Fields[0].AsString = '      [ 소계 ]') or (Query.Fields[0].AsString = '현금영수증') or (Query.Fields[0].AsString = '현금') then
     begin
       vCnt     := vCnt     +  Query.Fields[1].AsInteger;
       vDutyAmt := vDutyAmt +  Query.Fields[2].AsInteger;
       vVatAmt  := vVatAmt  +  Query.Fields[3].AsInteger;
       vTipAmt  := vTipAmt  +  Query.Fields[4].AsInteger;
       vTotAmt  := vTotAmt  +  Query.Fields[5].AsInteger;
     end;

     if (Query.Fields[0].AsString = '현금영수증') or (Query.Fields[0].AsString = '현금') then
     begin
       vCnt1     := vCnt1     +  Query.Fields[1].AsInteger;
       vDutyAmt1 := vDutyAmt1 +  Query.Fields[2].AsInteger;
       vVatAmt1  := vVatAmt1  +  Query.Fields[3].AsInteger;
       vTipAmt1  := vTipAmt1  +  Query.Fields[4].AsInteger;
       vTotAmt1  := vTotAmt1  +  Query.Fields[5].AsInteger;
     end;
      Query.Next;
    end;

    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := '      [ 소계 ]';
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := vCnt1;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 2] := vDutyAmt1;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 3] := vVatAmt1;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 4] := vTipAmt1;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 5] := vTotAmt1;

    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := '      [ 합계 ]';
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := vCnt;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 2] := vDutyAmt;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 3] := vVatAmt;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 4] := vTipAmt;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 5] := vTotAmt;
  finally
    GridTableView.DataController.EndUpdate;
    FinishQuery;
  end;
  Result := true;
end;

procedure TCloseVatReportShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/마감관련/부가세신고자료조회/부가세신고자료조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TCloseVatReportShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if Trim(ARecord.Values[GridTableViewCardName.Index]) = '[ 소계 ]' then
    AStyle := StyleFontBlue
  else if Trim(ARecord.Values[GridTableViewCardName.Index]) = '[ 합계 ]' then
    AStyle := StyleFontRedBold;

end;

end.
