// 출납 내역 조회 (New완료)

unit ReserveAcctShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, ExtCtrls, AdvToolBarStylers,
  StdCtrls, cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  StrUtils, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess, dxPScxGridLnk, dxmdaset,
  dxPScxGridLayoutViewLnk, MaskUtils, Math, cxDBData, cxGridDBTableView,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TReserveAcctShowForm = class(TInheritShowForm)
    GridTableViewAcctDate: TcxGridColumn;
    GridTableViewAcctCode: TcxGridColumn;
    GridTableViewAcctName: TcxGridColumn;
    GridTableViewType: TcxGridColumn;
    GridTableViewGetAmt: TcxGridColumn;
    GridTableViewPayAmt: TcxGridColumn;
    GridTableViewDCAmt: TcxGridColumn;
    GridTableViewBank: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1AcctName: TcxGridColumn;
    GridTableView1AcctType: TcxGridColumn;
    GridTableView1GetAmt: TcxGridColumn;
    GridTableView1PayAmt: TcxGridColumn;
    GridTableView1AcctCount: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewDsAcct: TcxGridColumn;
    GridLevel2: TcxGridLevel;
    GridDBTableView: TcxGridDBTableView;
    GridSubDBTableView: TcxGridDBTableView;
    GridDBTableViewAcctDate: TcxGridDBColumn;
    GridDBTableViewAcctCode: TcxGridDBColumn;
    GridDBTableViewAcctName: TcxGridDBColumn;
    GridDBTableViewType: TcxGridDBColumn;
    GridDBTableViewAcctType: TcxGridDBColumn;
    GridDBTableViewInAmt: TcxGridDBColumn;
    GridDBTableViewOutAmt: TcxGridDBColumn;
    GridDBTableViewDcAmt: TcxGridDBColumn;
    GridDBTableViewRemark: TcxGridDBColumn;
    GridDBTableViewPos: TcxGridDBColumn;
    GridDBTableViewBank: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    GridSubDBTableViewColumn7: TcxGridDBColumn;
    GridSubDBTableViewColumn8: TcxGridDBColumn;
    GridSubDBTableViewColumn9: TcxGridDBColumn;
    GridDBTableViewColumn1: TcxGridDBColumn;
    DataSource: TDataSource;
    SubDataSource: TDataSource;
    GridDBTableViewAcctNo: TcxGridDBColumn;
    GridDBTableViewColumn2: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);

  private
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
  protected
    function DoSearch:Boolean; override;
  end;

var
  ReserveAcctShowForm: TReserveAcctShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TReserveAcctShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet := MemData;
  SubDataSource.DataSet := SubMemData;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TReserveAcctShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TReserveAcctShowForm.DoSearch:Boolean;
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   StoD(a.YMD_OCCUR) as YMD_OCCUR, '
             +'         a.NO_ACCT, '
             +'         a.CD_ACCT, '
             +'         b.NM_CODE1 as NM_ACCT, '
             +'         case b.NM_CODE2 when ''0'' then ''수입'' else ''지출'' end as TYPE, '
             +'         case a.DS_ACCT when ''0'' then ''현금'' when ''1'' then ''카드''  when ''2'' then ''현금영수증'' when ''3'' then ''계좌'' end as DS_ACCT, '
             +'         a.AMT_PAYIN, '
             +'         a.AMT_OUT, '
             +'         Ifnull(a.AMT_DC,0) as AMT_DC, '
             +'         e.NM_CODE1 as BANK, '
             +'         ConCat(case when Length(a.CD_MEMBER)=10 then ConCat(''['',a.CD_MEMBER,'']'') else '''' end, a.REMARK) as REMARK, '
             +'         a.NO_POS, '
             +'         a.DT_CHANGE, '
             +'         ConCat(a.YMD_OCCUR,a.NO_POS,a.NO_ACCT) as LINK '
             +'  from   SL_ACCT   as a inner join '
             +'         MS_CODE   as b on a.CD_HEAD  = b.CD_HEAD  and a.CD_STORE = b.CD_STORE and a.CD_ACCT   = b.CD_CODE and b.CD_KIND = ''11'' left outer join '
             +'         MS_TRD    as c on a.CD_HEAD  = c.CD_HEAD  and a.CD_STORE = c.CD_STORE and a.CD_TRDPL  = c.CD_TRDPL  left outer join '
             +'         MS_MEMBER as d on a.CD_HEAD  = c.CD_HEAD  and a.CD_STORE = d.CD_STORE and a.CD_MEMBER = d.CD_MEMBER left outer join '
             +'         MS_CODE   as e on a.CD_HEAD  = e.CD_HEAD  and a.CD_STORE = e.CD_STORE and a.CD_BANK   = e.CD_CODE and e.CD_KIND = ''19'' '
             +' where   a.CD_HEAD   =:P0 '
             +'   and   a.CD_STORE  =:P1 '
             +'   and   a.YMD_OCCUR between :P2 and :P3 '
             +'order by a.YMD_OCCUR, a.NO_ACCT',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);

    GridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MemData);
    GridDBTableView.DataController.DataSource := DataSource;

    OpenQuery('select  case when DS_TRD = ''A'' then ''승인'' else ''취소'' end DS_TRD, '
            +'         NO_CARD, '
            +'         NO_APPROVAL, '
            +'         NM_CARDPL, '
            +'         AMT_APPROVAL, '
            +'         NO_CHAINPL, '
            +'         ConCat(TRD_DATE,'' '',TRD_TIME) as DT_APPROVAL, '
            +'         TERM_HALBU, '
            +'         ConCat(YMD_SALE,NO_POS,NO_ACCT) as LINK '
            +'  from   SL_ACCT_CARD '
            +' where   CD_HEAD  =:P0 '
            +'   and   CD_STORE =:P1 '
            +'   and   YMD_SALE between :P2 and :P3 '
            +' order by YMD_SALE, NO_ACCT',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);

    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;
  end
  else
  begin
    OpenQuery('select b.NM_CODE1 as NM_ACCT, '
             +'       case when b.NM_CODE2 = ''0'' then ''수입'' else ''지출'' end DS_ACCT, '
             +'       Count(*) as CNT_ACCT, '
             +'       Sum(a.AMT_PAYIN) as AMT_IN, '
             +'       Sum(a.AMT_OUT)   as AMT_OUT '
             +'  from SL_ACCT a inner join '
             +'       MS_CODE b on b.CD_HEAD  = a.CD_HEAD  and  b.CD_STORE = a.CD_STORE and b.CD_CODE = a.CD_ACCT and b.CD_KIND = ''11'' '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_OCCUR between :P2 and :P3 '
             +' group by b.NM_CODE1, b.NM_CODE2 '
             +' order by b.NM_CODE2 ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end;
end;

procedure TReserveAcctShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex :Integer;
begin
  inherited;
  if GridLevel.Active then
  begin
    if GridDBTableView.DataController.RecordCount = 0 then Exit;

    vPrintData := rptSizeBoth + rptAlignCenter + '출납현황(건별)'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  ' 출납일자   '+rptpStr+'      출 납 명 '+rptpStr+'       출납금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;

    with GridDBTableView do
    begin
      For vIndex := 0 to DataController.RecordCount-1 do
      begin
        vPrintData := vPrintData + DataController.Values[vIndex, GridDBTableViewAcctDate.Index]
                     + ' '+RPad(DataController.Values[vIndex, GridDBTableViewAcctName.Index]+'('+DataController.Values[vIndex, GridDBTableViewType.Index]+')',21+PrintBlank,' ');
        if DataController.Values[vIndex, GridTableViewType.Index] = '수입' then
          vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridDBTableViewInAmt.Index]),10,' ')+#13
        else
          vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridDBTableViewOutAmt.Index]),10,' ')+#13;

        if Trim(DataController.Values[vIndex, GridDBTableViewRemark.Index]) <> '' then
          vPrintData := vPrintData + '  ' +DataController.Values[vIndex, GridDBTableViewRemark.Index] + #13;
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  '      수입합계    '+ LPad(FormatFloat('#,0',GridDBTableView.DataController.Summary.FooterSummaryValues[0]), 24+PrintBlank,' ') + #13;
    vPrintData := vPrintData +  '      지출합계    '+ LPad(FormatFloat('#,0',GridDBTableView.DataController.Summary.FooterSummaryValues[1]), 24+PrintBlank,' ') + #13;
    vPrintData := vPrintData +  '      합계금액    '+ LPad(FormatFloat('#,0',GridDBTableView.DataController.Summary.FooterSummaryValues[0]
                                                                            -GridDBTableView.DataController.Summary.FooterSummaryValues[1]), 24+PrintBlank,' ') + #13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
  end
  else
  begin
    if GridTableView1.DataController.RecordCount = 0 then Exit;

    vPrintData := rptSizeBoth + rptAlignCenter + '출납현황(계정별)'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  '       출납명      '+rptpStr+rptpStr+'구분  건수     출납금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;

    with GridTableView1 do
    begin
      For vIndex := 0 to DataController.RecordCount-1 do
      begin
        vPrintData := vPrintData + RPad(DataController.Values[vIndex, GridTableView1AcctName.Index],19+PrintBlank,' ');
        vPrintData := vPrintData + DataController.Values[vIndex, GridTableView1AcctType.Index];
        vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableView1AcctCount.Index]),6,' ');

        if DataController.Values[vIndex, 1] = '수입' then
          vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableView1GetAmt.Index]),13,' ')+#13
        else
          vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableView1PayAmt.Index]),13,' ')+#13;
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  '      수입합계    '+ LPad(FormatFloat('#,0',GridTableView1.DataController.Summary.FooterSummaryValues[0]), 24+PrintBlank,' ') + #13;
    vPrintData := vPrintData +  '      지출합계    '+ LPad(FormatFloat('#,0',GridTableView1.DataController.Summary.FooterSummaryValues[1]), 24+PrintBlank,' ') + #13;
    vPrintData := vPrintData +  '      차    액    '+ LPad(FormatFloat('#,0',GridTableView1.DataController.Summary.FooterSummaryValues[0] - GridTableView1.DataController.Summary.FooterSummaryValues[1]), 24+PrintBlank,' ') + #13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
  end;

  PrintPrinter(vPrintData);
end;
end.
