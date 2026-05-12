// 결제 수단별 결제 조회 (완료)

unit SalePayShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, ImgList, Menus, ExtCtrls, cxContainer,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxButtonEdit, cxDropDownEdit, cxTextEdit,
  cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton, AdvToolBarStylers,
  cxDBData, cxGridDBTableView, cxGridCardView, SHDocVw,
  StdCtrls, cxRadioGroup, dxmdaset, StrUtils, Math, OleCtrls,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, MaskUtils, cxProgressBar,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  AdvSplitter, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TSalePayShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewSaleDate: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewCashCnt: TcxGridBandedColumn;
    GridBandedTableViewCashAmt: TcxGridBandedColumn;
    GridBandedTableViewCashReceiptCnt: TcxGridBandedColumn;
    GridBandedTableViewCashReceiptAmt: TcxGridBandedColumn;
    GridBandedTableViewCardCnt: TcxGridBandedColumn;
    GridBandedTableViewCardAmt: TcxGridBandedColumn;
    GridBandedTableViewCheckCnt: TcxGridBandedColumn;
    GridBandedTableViewCheckAmt: TcxGridBandedColumn;
    GridBandedTableViewCreditCnt: TcxGridBandedColumn;
    GridBandedTableViewCreditAmt: TcxGridBandedColumn;
    GridBandedTableViewGiftCardCnt: TcxGridBandedColumn;
    GridBandedTableViewGiftCardAmt: TcxGridBandedColumn;
    GridBandedTableViewSaleNotAmt: TcxGridBandedColumn;
    GridBandedTableViewSaleNetAmt: TcxGridBandedColumn;
    GridBandedTableViewSaleVatAmt: TcxGridBandedColumn;
    GridBandedTableViewCashReceiptNetAmt: TcxGridBandedColumn;
    GridBandedTableViewCashReceiptTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewCardNetAmt: TcxGridBandedColumn;
    GridBandedTableViewCardTaxAmt: TcxGridBandedColumn;
    ChartPanel: TPanel;
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridLevel3: TcxGridLevel;
    GridLevel5: TcxGridLevel;
    GridLevel8: TcxGridLevel;
    GridDBTableView: TcxGridDBTableView;
    GridSubDBTableView: TcxGridDBTableView;
    GridTableCashReceiptView: TcxGridTableView;
    GridTableCreditView: TcxGridTableView;
    GridDBTableViewCardCompany: TcxGridDBColumn;
    GridDBTableViewApprovalQty: TcxGridDBColumn;
    GridDBTableViewApprovalAmt: TcxGridDBColumn;
    GridDBTableViewCancelQty: TcxGridDBColumn;
    GridDBTableViewCancelAmt: TcxGridDBColumn;
    GridDBTableViewTotalQty: TcxGridDBColumn;
    GridDBTableViewTotalAmt: TcxGridDBColumn;
    GridSubDBTableViewSaleDate: TcxGridDBColumn;
    GridSubDBTableViewPosNo: TcxGridDBColumn;
    GridSubDBTableViewBillNo: TcxGridDBColumn;
    GridSubDBTableViewType: TcxGridDBColumn;
    GridSubDBTableViewCardNo: TcxGridDBColumn;
    GridSubDBTableViewApprovalAmt: TcxGridDBColumn;
    GridSubDBTableViewApprovalNo: TcxGridDBColumn;
    GridSubDBTableViewHalbu: TcxGridDBColumn;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewBillNo: TcxGridColumn;
    GridTableViewType: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewApprovalAmt: TcxGridColumn;
    GridTableViewApprovalNetAmt: TcxGridColumn;
    GridTableViewApprovalVatAmt: TcxGridColumn;
    GridTableViewApprovalNo: TcxGridColumn;
    GridTableViewCardCompany: TcxGridColumn;
    GridTableViewHalbu: TcxGridColumn;
    GridTableViewApprovalType: TcxGridColumn;
    GridTableViewJoinNo: TcxGridColumn;
    GridTableCashReceiptViewColumn1: TcxGridColumn;
    GridTableCashReceiptViewColumn2: TcxGridColumn;
    GridTableCashReceiptViewColumn3: TcxGridColumn;
    GridTableCashReceiptViewColumn4: TcxGridColumn;
    GridTableCashReceiptViewColumn5: TcxGridColumn;
    GridTableCashReceiptViewCardNo: TcxGridColumn;
    GridTableCashReceiptViewApprovalAmt: TcxGridColumn;
    GridTableCashReceiptViewColumn9: TcxGridColumn;
    GridTableCashReceiptViewColumn10: TcxGridColumn;
    GridTableCashReceiptViewApprovalNo: TcxGridColumn;
    GridTableCreditViewSaleDate: TcxGridColumn;
    GridTableCreditViewColumn3: TcxGridColumn;
    GridTableCreditViewColumn4: TcxGridColumn;
    GridTableCreditViewMemberCode: TcxGridColumn;
    GridTableCreditViewMemberName: TcxGridColumn;
    GridTableCreditViewCreditAmt: TcxGridColumn;
    GridTableCreditViewColumn9: TcxGridColumn;
    GridTableCreditViewColumn10: TcxGridColumn;
    DataSource: TDataSource;
    SubDataSource: TDataSource;
    GridDBTableViewRate: TcxGridDBColumn;
    GridBandedTableViewBankCnt: TcxGridBandedColumn;
    GridBandedTableViewBankAmt: TcxGridBandedColumn;
    GridDBTableViewCardFee: TcxGridDBColumn;
    GridTableViewApprovalDate: TcxGridColumn;
    GridTableViewApprovalTime: TcxGridColumn;
    GridTableCashReceiptViewApprovalDate: TcxGridColumn;
    GridBandedTableViewPointCnt: TcxGridBandedColumn;
    GridBandedTableViewPointAmt: TcxGridBandedColumn;
    GridLevel6: TcxGridLevel;
    GridTablePointView: TcxGridTableView;
    GridTablePointViewSaleDate: TcxGridColumn;
    GridTablePointViewPosNo: TcxGridColumn;
    GridTablePointViewRcpNo: TcxGridColumn;
    GridTablePointViewSaleAmt: TcxGridColumn;
    GridTablePointViewMemberCode: TcxGridColumn;
    GridTablePointViewMembrerName: TcxGridColumn;
    GridTablePointViewCardNo: TcxGridColumn;
    GridTablePointViewPointAmt: TcxGridColumn;
    GridTablePointViewTelNo: TcxGridColumn;
    GridTableViewCorner: TcxGridColumn;
    GridTableViewIssueName: TcxGridColumn;
    GridSubDBTableViewIssueName: TcxGridDBColumn;
    GridTableViewDcAmt: TcxGridColumn;
    PosSplitter: TAdvSplitter;
    GridLevel4: TcxGridLevel;
    GridTableLetsOrderView: TcxGridTableView;
    GridTableLetsOrderViewColumn1: TcxGridColumn;
    GridTableLetsOrderViewColumn2: TcxGridColumn;
    GridTableLetsOrderViewColumn3: TcxGridColumn;
    GridTableLetsOrderViewType: TcxGridColumn;
    GridTableLetsOrderViewColumn5: TcxGridColumn;
    GridTableLetsOrderViewColumn6: TcxGridColumn;
    GridTableLetsOrderViewColumn7: TcxGridColumn;
    GridTableLetsOrderViewColumn8: TcxGridColumn;
    GridTableLetsOrderViewColumn9: TcxGridColumn;
    GridTableLetsOrderViewColumn10: TcxGridColumn;
    GridBandedTableViewLetsOrderCount: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderAmt: TcxGridBandedColumn;
    GridTableLetsOrderViewColumn4: TcxGridColumn;
    GridTableLetsOrderViewCancelAmt: TcxGridColumn;
    GridBandedTableViewCashNetAmt: TcxGridBandedColumn;
    GridBandedTableViewCashDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewCashTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewCashReceiptDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewCardDutyFreeAmt: TcxGridBandedColumn;
    GridBandedTableViewCheckNetAmt: TcxGridBandedColumn;
    GridBandedTableViewCheckDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewCheckTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderNetAmt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewTrustNetAmt: TcxGridBandedColumn;
    GridBandedTableViewTrustDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewTrustTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewGiftNetAmt: TcxGridBandedColumn;
    GridBandedTableViewGiftDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewGiftTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewBankNetAmt: TcxGridBandedColumn;
    GridBandedTableViewBankDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewBankTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewPointNetAmt: TcxGridBandedColumn;
    GridBandedTableViewPointDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewPointTaxAmt: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridBandedTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableCashReceiptViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure GridSubDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
    procedure GridTableLetsOrderViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormResize(Sender: TObject);

  private
    FusionChart: TWebBrowser;
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  SalePayShowForm: TSalePayShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TSalePayShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    DoSearch;
  end;

end;

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSalePayShowForm.FormCreate(Sender: TObject);
  procedure SetColum(aBands:Integer);
  var vIndex : Integer;
  begin
    for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
    begin
      if GridBandedTableView.Columns[vIndex].Position.BandIndex = aBands then
      begin
        GridBandedTableView.Columns[vIndex].Tag     := 99;
        GridBandedTableView.Columns[vIndex].Visible := false;
      end;
    end;

  end;
var vTemp :String;
begin
  if GetOption(249) = '0' then
  begin
    GridTableViewCorner.Visible := false;
    GridTableViewCorner.Tag     := 99;
  end;

  if GetOption(60) = '0' then
  begin
    GridTableViewCorner.Visible := false;
    GridTableViewCorner.Tag     := 99;
  end;

  vTemp := HexToBin(GetOption(383))+HexToBin(GetOption(384));

  if Copy(vTemp,1,1) = '0' then
  begin
    GridBandedTableView.Bands[7].Visible := false;
    SetColum(7);
  end;
  //포인트
  if Copy(vTemp,2,1) = '0' then
  begin
    GridBandedTableView.Bands[9].Visible := false;
    SetColum(9);
    GridLevel6.Visible := false;
  end;
  if Copy(vTemp,3,1) = '0' then
  begin
    GridBandedTableView.Bands[6].Visible := false;
    SetColum(6);
    GridLevel5.Visible := false;
  end;
  if Copy(vTemp,4,1) = '0' then
  begin
    GridBandedTableView.Bands[8].Visible := false;
    SetColum(8);
  end;
  if Copy(vTemp,5,1) = '0' then
  begin
    GridBandedTableView.Bands[5].Visible := false;
    SetColum(5);
  end;

  if GetStoreOption(9) = '0' then
  begin
    GridBandedTableView.Bands[4].Visible := false;
    SetColum(4);
    GridLevel4.Visible := false;
  end;


  inherited;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet    := MemData;
  SubDataSource.DataSet := SubMemData;

  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;

end;
procedure TSalePayShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure TSalePayShowForm.FormResize(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSalePayShowForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;

procedure TSalePayShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

procedure TSalePayShowForm.ClearGrid;
begin
  isLoading := true;
  GridSubDBTableView.DataController.RecordCount := 0;
  GridDBTableView.DataController.DataSource := nil;
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    FusionChart.Visible := false;
end;

procedure TSalePayShowForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ConditionToolbarTodayRadioButton.Visible := ConditionToolBarComboBox.ItemIndex = 0;
  ConditionToolbarWeekRadioButton.Visible  := ConditionToolBarComboBox.ItemIndex = 0;
  ConditionToolbarMonthRadioButton.Visible := ConditionToolBarComboBox.ItemIndex = 0;
  if ConditionToolBarComboBox.ItemIndex = 0 then
    GridBandedTableViewSaleDate.Caption := '판매일자'
  else
    GridBandedTableViewSaleDate.Caption := '판매월';
  GridBandedTableView.DataController.RecordCount := 0;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TSalePayShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드 표시 시 새로 그리기
procedure TSalePayShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ChartPanel.Visible := (Grid.ActiveLevel = GridLevel1) or (Grid.ActiveLevel = GridLevel);
  ConditionToolBarEditLabel.Visible := Grid.ActiveLevel = GridLevel;
  ConditionToolBarComboBox.Visible  := Grid.ActiveLevel = GridLevel;
  if Grid.ActiveLevel <> GridLevel then
  begin
    ConditionToolbarTodayRadioButton.Visible := true;
    ConditionToolbarWeekRadioButton.Visible  := true;
    ConditionToolbarMonthRadioButton.Visible := true;
  end
  else
  begin
    ConditionToolbarTodayRadioButton.Visible := ConditionToolBarComboBox.ItemIndex = 0;
    ConditionToolbarWeekRadioButton.Visible  := ConditionToolBarComboBox.ItemIndex = 0;
    ConditionToolbarMonthRadioButton.Visible := ConditionToolBarComboBox.ItemIndex = 0;
  end;
  DoSearch;
end;

procedure TSalePayShowForm.GridBandedTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

  // 보조적인 금액(부가세 등)은 회색으로 표시
//  ACanvas.Font.Color := clGray;
end;

procedure TSalePayShowForm.GridSubDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridSubDBTableViewType.Index] = '취소' then
    AStyle := StyleFontRed;
end;

procedure TSalePayShowForm.GridTableCashReceiptViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableCashReceiptView.DataController.RecordCount = 0 then Exit;

  // 취소는 빨간색으로 표시
  if (AItem <> nil) and (AItem.Index = GridTableCashReceiptViewColumn4.Index) then
    if ARecord.Values[GridTableCashReceiptViewColumn4.Index] = '취소' then
      AStyle := StyleFontRed;
end;

procedure TSalePayShowForm.GridTableLetsOrderViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableLetsOrderView.DataController.RecordCount = 0 then Exit;

  // 취소는 빨간색으로 표시
  if (AItem <> nil) and (AItem.Index = GridTableLetsOrderViewType.Index) then
    if ARecord.Values[GridTableLetsOrderViewType.Index] = '취소' then
      AStyle := StyleFontRed;
end;

procedure TSalePayShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  // 취소는 빨간색으로 표시
  if (AItem <> nil) and (AItem.Index = GridTableViewType.Index) then
    if ARecord.Values[GridTableViewType.Index] = '취소' then
      AStyle := StyleFontRed;
 end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSalePayShowForm.DoSearch:Boolean;
var  vChartXml :String;
     vIndex    :Integer;
begin
//  inherited;
  Result := false;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select  '+Ifthen(ConditionToolBarComboBox.ItemIndex = 0, 'StoDW(t.YMD_SALE) as YMD_SALE, ','ConCat(Left(t.YMD_SALE,4),''-'',Substring(t.YMD_SALE,5,2)) as YMD_SALE, ')
             +'        Sum(AMT_SALE)               as AMT_SALE, '
             +'        Sum(AMT_DUTYFREE)           as AMT_DUTYFREE, '
             +'        Sum(AMT_NET)                as AMT_NET, '
             +'        Sum(AMT_TAX)                as AMT_TAX, '
             +'        Sum(AMT_CASH)               as AMT_CASH, '
             +'        Sum(CNT_CASH)               as CNT_CASH, '
             +'        Sum(AMT_CASH_NET)           as AMT_CASH_NET, '
             +'        Sum(AMT_CASH_DUTYFREE)      as AMT_CASH_DUTYFREE, '
             +'        Sum(AMT_CASH_TAX)           as AMT_CASH_TAX, '
             +'        Sum(AMT_CASHRCP)            as AMT_CASHRCP, '
             +'        Sum(CNT_CASHRCP)            as CNT_CASHRCP, '
             +'        Sum(AMT_CASHRCP_NET)        as AMT_CASHRCP_NET, '
             +'        Sum(AMT_CASHRCP_DUTYFREE)   as AMT_CASHRCP_DUTYFREE, '
             +'        Sum(AMT_CASHRCP_TAX)        as AMT_CASHRCP_TAX, '
             +'        Sum(AMT_CARD)               as AMT_CARD, '
             +'        Ifnull(b.CNT_CARD,0)        as CNT_CARD, '//Sum(CNT_CARD)           as CNT_CARD, '
             +'        Sum(AMT_CARD_NET)           as AMT_CARD_NET, '
             +'        Sum(AMT_CARD_DUTYFREE)      as AMT_CARD_DUTYFREE, '
             +'        Sum(AMT_CARD_TAX)           as AMT_CARD_TAX, '
             +'        Sum(AMT_CHECK)              as AMT_CHECK, '
             +'        Sum(CNT_CHECK)              as CNT_CHECK, '
             +'        Sum(AMT_CHECK_NET)          as AMT_CHECK_NET, '
             +'        Sum(AMT_CHECK_DUTYFREE)     as AMT_CHECK_DUTYFREE, '
             +'        Sum(AMT_CHECK_TAX)          as AMT_CHECK_TAX, '
             +'        Sum(AMT_TRUST)              as AMT_TRUST, '
             +'        Sum(CNT_TRUST)              as CNT_TRUST, '
             +'        Sum(AMT_TRUST_NET)          as AMT_TRUST_NET, '
             +'        Sum(AMT_TRUST_DUTYFREE)     as AMT_TRUST_DUTYFREE, '
             +'        Sum(AMT_TRUST_TAX)          as AMT_TRUST_TAX, '
             +'        Sum(AMT_GIFT)               as AMT_GIFT, '
             +'        Sum(CNT_GIFT)               as CNT_GIFT, '
             +'        Sum(AMT_GIFT_NET)           as AMT_GIFT_NET, '
             +'        Sum(AMT_GIFT_DUTYFREE)      as AMT_GIFT_DUTYFREE, '
             +'        Sum(AMT_GIFT_TAX)           as AMT_GIFT_TAX, '
             +'        Sum(AMT_POINT)              as AMT_POINT, '
             +'        Sum(CNT_POINT)              as CNT_POINT, '
             +'        Sum(AMT_POINT_NET)          as AMT_POINT_NET, '
             +'        Sum(AMT_POINT_DUTYFREE)     as AMT_POINT_DUTYFREE, '
             +'        Sum(AMT_POINT_TAX)          as AMT_POINT_TAX, '
             +'        Sum(AMT_BANK)               as AMT_BANK, '
             +'        Sum(CNT_BANK)               as CNT_BANK, '
             +'        Sum(AMT_BANK_NET)           as AMT_BANK_NET, '
             +'        Sum(AMT_BANK_DUTYFREE)      as AMT_BANK_DUTYFREE, '
             +'        Sum(AMT_BANK_TAX)           as AMT_BANK_TAX, '
             +'        Sum(AMT_LETSORDER)          as AMT_LETSORDER, '
             +'        Sum(CNT_LETSORDER)          as CNT_LETSORDER, '
             +'        Sum(AMT_LETSORDER_NET)      as AMT_LETSORDER_NET, '
             +'        Sum(AMT_LETSORDER_DUTYFREE) as AMT_LETSORDER_DUTYFREE, '
             +'        Sum(AMT_LETSORDER_TAX)      as AMT_LETSORDER_TAX '
             +'  from (select a.YMD_SALE, '
             +'               a.NO_POS, '
             +'               a.NO_RCP, '
             +'               a.AMT_SALE           as AMT_SALE, '
             +'               a.AMT_DUTYFREE       as AMT_DUTYFREE, '
             +'               a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX as AMT_NET, '
             +'               a.AMT_TAX            as AMT_TAX, '
             +'               a.AMT_CASH, '
             +'               case when (a.AMT_SALE > 0) and (a.AMT_CASH < 0) then 0 else case when a.AMT_CASH = 0 then 0 else 1 end end as CNT_CASH, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CASH / a.AMT_SALE end * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX)  as AMT_CASH_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CASH / a.AMT_SALE end * a.AMT_DUTYFREE          as AMT_CASH_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CASH / a.AMT_SALE end * a.AMT_TAX               as AMT_CASH_TAX, '
             +'               a.AMT_CASHRCP, '
             +'               case when a.AMT_CASHRCP = 0 then 0 else 1 end as CNT_CASHRCP, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CASHRCP / a.AMT_SALE end  * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX) as AMT_CASHRCP_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CASHRCP / a.AMT_SALE end * a.AMT_DUTYFREE         as AMT_CASHRCP_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CASHRCP / a.AMT_SALE end * a.AMT_TAX              as AMT_CASHRCP_TAX, '
             +'               a.AMT_CARD as AMT_CARD, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else (a.AMT_CARD) / a.AMT_SALE end  * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX) as AMT_CARD_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else (a.AMT_CARD) / a.AMT_SALE end * a.AMT_DUTYFREE         as AMT_CARD_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else (a.AMT_CARD) / a.AMT_SALE end * a.AMT_TAX              as AMT_CARD_TAX, '
             +'               a.AMT_CHECK, '
             +'               case when a.AMT_CHECK = 0 then 0 else 1 end as CNT_CHECK, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CHECK / a.AMT_SALE end * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX)  as AMT_CHECK_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CHECK / a.AMT_SALE end * a.AMT_DUTYFREE          as AMT_CHECK_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_CHECK / a.AMT_SALE end * a.AMT_TAX               as AMT_CHECK_TAX, '
             +'               a.AMT_TRUST, '
             +'               case when a.AMT_TRUST = 0 then 0 else 1 end as CNT_TRUST, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_TRUST / a.AMT_SALE end * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX) as AMT_TRUST_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_TRUST / a.AMT_SALE end * a.AMT_DUTYFREE         as AMT_TRUST_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_TRUST / a.AMT_SALE end * a.AMT_TAX              as AMT_TRUST_TAX, '
             +'               a.AMT_GIFT, '
             +'               case when a.AMT_GIFT = 0 then 0 else 1 end as CNT_GIFT, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_GIFT / a.AMT_SALE end * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX)  as AMT_GIFT_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_GIFT / a.AMT_SALE end * a.AMT_DUTYFREE          as AMT_GIFT_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_GIFT / a.AMT_SALE end * a.AMT_TAX               as AMT_GIFT_TAX, '
             +'               a.AMT_POINT, '
             +'               case when a.AMT_POINT = 0 then 0 else 1 end as CNT_POINT, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_POINT / a.AMT_SALE end * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX)  as AMT_POINT_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_POINT / a.AMT_SALE end * a.AMT_DUTYFREE          as AMT_POINT_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_POINT / a.AMT_SALE end * a.AMT_TAX               as AMT_POINT_TAX, '
             +'               a.AMT_BANK, '
             +'               case when a.AMT_BANK = 0 then 0 else 1 end as CNT_BANK, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_BANK / a.AMT_SALE end * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX)  as AMT_BANK_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_BANK / a.AMT_SALE end * a.AMT_DUTYFREE          as AMT_BANK_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_BANK / a.AMT_SALE end * a.AMT_TAX               as AMT_BANK_TAX, '
             +'               a.AMT_LETSORDER, '
             +'               case when a.AMT_LETSORDER = 0 then 0 else 1 end as CNT_LETSORDER, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_LETSORDER / a.AMT_SALE end * (a.AMT_DUTY-a.AMT_DUTYFREE+a.AMT_TAX)  as AMT_LETSORDER_NET, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_LETSORDER / a.AMT_SALE end * a.AMT_DUTYFREE          as AMT_LETSORDER_DUTYFREE, '
             +'               case when a.AMT_SALE = 0 then a.AMT_SALE else a.AMT_LETSORDER / a.AMT_SALE end * a.AMT_TAX               as AMT_LETSORDER_TAX '
             +'         from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a')
             +'        where  a.CD_HEAD  =:P0 '
             +'          and  a.CD_STORE =:P1 '
             +'          and  a.YMD_SALE between :P2 and :P3 '
             +'          and  a.DS_SALE <> ''V'' '
             +'       ) as t left outer join '
             +'       (select YMD_SALE, '
             +'               Sum(case when DS_TRD = ''A'' then 1 else -1 end) as CNT_CARD '
             +'          from  '+GetPartitionTable('SL_CARD', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'         where CD_HEAD  =:P0 '
             +'           and CD_STORE =:P1 '
             +'           and YMD_SALE between :P2 and :P3 '
             +'         group by YMD_SALE) as b on b.YMD_SALE = t.YMD_SALE '
             +' group by '+Ifthen(ConditionToolBarComboBox.ItemIndex = 0, 't.YMD_SALE ','Left(t.YMD_SALE,6)')
             +' order by 1',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);


    DM.ReadQuery(Query, GridBandedTableView);
    Result := GridBandedTableView.DataController.RecordCount > 0;

    vChartXml := '<chart caption=''결제수단별 매출현황'' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';


    vChartXml := vChartXml + '<set label="현금" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[5],0)
                                                                  +NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[25],0))+'" />';
    vChartXml := vChartXml + '<set label="신용카드" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[15],0))+'" />';
    if NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[20],0) <> 0 then
      vChartXml := vChartXml + '<set label="렛츠오더" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[20],0))+'" />';
    if NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[30],0) <> 0 then
      vChartXml := vChartXml + '<set label="외상" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[30],0))+'" />';
    if NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[35],0) <> 0 then
      vChartXml := vChartXml + '<set label="상품권" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[35],0))+'" />';
    if NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[40],0) <> 0 then
      vChartXml := vChartXml + '<set label="계좌입금" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[40],0))+'" />';
    if NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[45],0) <> 0 then
      vChartXml := vChartXml + '<set label="포인트" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[45],0))+'" />';

    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
  end
  //신용카드 매입사별
  else if Grid.ActiveLevel = GridLevel1 then
  begin
      OpenQuery('select t.NM_CARD_BUY, '
               +'       Sum(t.CNT_APPROVAL)        as CNT_APPROVAL, '
               +'       Sum(t.AMT_APPROVAL)        as AMT_APPROVAL, '
               +'       Sum(t.CNT_CANCEL)          as CNT_CANCEL, '
               +'       Sum(t.AMT_CANCEL)          as AMT_CANCEL, '
               +'       Sum(t.CNT_TOTAL)           as CNT_TOTAL, '
               +'       Sum(t.AMT_TOTAL)           as AMT_TOTAL, '
               +'       Ifnull(Sum(t.RATE_FEE),0)  as RATE_FEE, '
               +'       case when Sum(t.AMT_TOTAL) = 0 then 0 else Round(Sum(t.AMT_TOTAL) / Max(s.AMT_CARD) * 100, 0) end as RATE '
               +' from (select  case when Ifnull(b.NM_CODE1,'''') = '''' then case when Ifnull(a.NM_CARD_BUY, '''') = '''' then ''단말기'' else Ifnull(a.NM_CARD_BUY,''단말기'') end else b.NM_CODE1 end AS NM_CARD_BUY, '
               +'               Sum(case when a.DS_TRD = ''A'' then 1 else 0 end) as CNT_APPROVAL, '
               +'               Sum(case when a.DS_TRD = ''A'' then a.AMT_APPROVAL else 0 end)  as AMT_APPROVAL, '
               +'               Sum(case when a.DS_TRD = ''A'' then 0 else 1 end) as CNT_CANCEL, '
               +'               Sum(case when a.DS_TRD = ''A'' then 0 else - a.AMT_APPROVAL end) as AMT_CANCEL, '
               +'               Sum(case when a.DS_TRD = ''A'' then AMT_APPROVAL else - a.AMT_APPROVAL end) * DivFlt(Cast(Max(b.NM_CODE3) as Double), 100) as RATE_FEE, '
               +'               Count(*) as CNT_TOTAL, '
               +'               Sum(case when a.DS_TRD = ''A'' then a.AMT_APPROVAL else - a.AMT_APPROVAL end) as AMT_TOTAL '
               +'        from   SL_CARD  a  left outer join '
               +'               MS_CODE  b  on a.CD_HEAD    = b.CD_HEAD '
               +'                          and a.CD_STORE   = b.CD_STORE '
               +'                          and a.NO_CHAINPL = b.NM_CODE2 '
               +'                          and b.CD_KIND    = ''06'' '
               +'       where   a.CD_HEAD  =:P0 '
               +'         and   a.CD_STORE =:P1 '
               +'         and   a.YMD_SALE between :P2 and :P3 '
               +'         and   a.DS_CARD <> ''P'' '
               +'       group by a.CD_STORE, a.NM_CARD_BUY, b.NM_CODE1) as t,  '
               +'      (select Sum(AMT_CARD) as AMT_CARD '
               +'         from SL_SALE_H_SUM '
               +'        where CD_HEAD  =:P0 '
               +'          and CD_STORE =:P1 '
               +'          and YMD_SALE between :P2 and :P3) as s '
               +'group by NM_CARD_BUY '
               +'order by NM_CARD_BUY ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    GridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MemData);
    GridDBTableView.DataController.DataSource := DataSource;
    Result := GridDBTableView.DataController.RecordCount > 0;

    OpenQuery('select   StoDW(a.YMD_SALE) as YMD_SALE, '
             +'         a.NO_POS, '
             +'         ConCat(a.NO_RCP,''-'',Cast(a.SEQ as Char)) as NO_RCP, '
             +'         case when a.DS_TRD = ''A'' then ''승인'' else ''취소'' end as DS_TRD, '
             +'         GetCardNo(Replace(a.NO_CARD,''-'',''''),''N'') as NO_CARD, '
             +'         a.NM_CARDPL, '
             +'         case when a.DS_TRD = ''A'' then a.AMT_APPROVAL else - a.AMT_APPROVAL end as AMT_APPROVAL, '
             +'         a.NO_APPROVAL, '
             +'         case when Cast(GetOnlyNumber(a.TERM_HALBU) as int) < 2 then ''일시불'' else ConCat(a.TERM_HALBU,''개월'') end as TERM_HALBU, '
             +'         case when Ifnull(b.NM_CODE1,'''') = '''' then case when Ifnull(a.NM_CARD_BUY, '''') = '''' then ''단말기'' else Ifnull(a.NM_CARD_BUY,''단말기'') end else b.NM_CODE1 end as NM_CARD_BUY '
             +'from     SL_CARD as a  left outer join '
             +'         MS_CODE as b  on a.CD_HEAD    = b.CD_HEAD '
             +'                      and a.CD_STORE   = b.CD_STORE '
             +'                      and a.NO_CHAINPL = b.NM_CODE2 '
             +'                      and b.CD_KIND    = ''06'' '
             +'where    a.CD_HEAD  =:P0 '
             +'  and    a.CD_STORE =:P1 '
             +'  and    a.YMD_SALE between :P2 and :P3 '
             +'  and    a.DS_CARD <> ''P'' '
             +'order by a.NM_CARD_BUY, a.YMD_SALE, a.NO_POS, a.NO_RCP',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;


    inherited;

    vChartXml := '<chart caption=''매입사별 매출현황'' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    for vIndex := 0 to GridDBTableView.DataController.RecordCount - 1 do
    begin
      vChartXml := vChartXml + '<set label="'+GridDBTableView.DataController.Values[vIndex,0]+'" value="'+FloatToStr(GridDBTableView.DataController.Values[vIndex,GridDBTableViewTotalAmt.Index])+'" />'
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
    FusionChart.Visible := true;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    OpenQuery('select  StoDW(s.YMD_SALE) as YMD_SALE, '
            +'         s.NO_POS, '
            +'         case s.DS_TRD when ''C'' then ConCat(s.NO_RCP, s.SEQ) else ConCat(s.NO_RCP,''-'', s.SEQ) end as NO_RCP, '
            +'         case s.DS_TRD when ''C'' then ''취소'' else ''승인'' end as DS_TRD, '
            +'         s.NO_CARD, '
            +'         case s.DS_TRD when ''C'' then -s.AMT_APPROVAL         else s.AMT_APPROVAL         end as AMT_APPROVAL, '
            +'         case s.DS_TRD when ''C'' then -s.AMT_APPROVAL+AMT_VAT else s.AMT_APPROVAL-AMT_VAT end as AMT_NET, '
            +'         case s.DS_TRD when ''C'' then -s.AMT_VAT              else s.AMT_VAT              end as AMT_TAX, '
            +'         s.NO_APPROVAL, '
            +'         case s.DS_TRD when ''C'' then -s.AMT_DC else s.AMT_DC end as AMT_DC, '
            +'         case when Ifnull(c.NM_CODE1,'''') = '''' then case when Ifnull(s.NM_CARD_BUY, '''') = '''' then ''단말기'' else Ifnull(s.NM_CARD_BUY,''단말기'') end else c.NM_CODE1 end as NM_CARD_BUY, '
            +'         case when Cast(GetOnlyNumber(s.TERM_HALBU) as int) < 2 then ''일시불'' else ConCat(s.TERM_HALBU,''개월'') end as TERM_HALBU, '
            +'         case s.TYPE_TRD when ''K'' then ''키 인'' when ''C'' then ''단말기'' else ''카드리딩'' end as TYPE_TRD, '
            +'         s.NO_CHAINPL, '
            +'         s.NM_CARDPL, '
            +'         StoD(s.TRD_DATE) as YMD_APPROVAL, '
            +'         case when Length(s.TRD_TIME)=4 then ConCat(Left(s.TRD_TIME,2),'':'',Right(s.TRD_TIME,2)) else '''' end as TIME_APPROVAL, '
            +'         ConCat(s.CD_CORNER,''-'',t.NM_TRDPL) as CORNER '
            +'  from   SL_CARD  as s  left outer join '
            +'         MS_TRD   as t  on t.CD_HEAD = s.CD_HEAD '
            +'                       and t.CD_STORE = s.CD_STORE '
            +'                       and t.CD_TRDPL = s.CD_CORNER left outer join '
            +'         MS_CODE  as c  on c.CD_HEAD  = s.CD_HEAD '
            +'                       and c.CD_STORE = s.CD_STORE '
            +'                       and c.NM_CODE2 = s.NO_CHAINPL '
            +'                       and c.CD_KIND  = ''06'' '
            +' where   s.CD_HEAD  =:P0 '
            +'   and   s.CD_STORE =:P1 '
            +'   and   s.YMD_SALE between :P2 and :P3 '
            +'   and   s.DS_CARD <> ''P'' '
            +'order by s.YMD_SALE, s.NO_POS, s.NO_RCP, s.SEQ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView, nil);
  end
  else if Grid.ActiveLevel = GridLevel3 then
  begin
    OpenQuery('select  StoDW(YMD_SALE) as YMD_SALE, '
            +'         NO_POS, '
            +'         ConCat(NO_RCP,''-'', SEQ) as NO_RCP, '
            +'         case DS_TRD  when ''C'' then ''취소'' else ''승인'' end as DS_TRD, '
            +'         case DS_KIND when ''1'' then ''지출증빙'' else ''소득공제'' end as DS_KIND, '
            +'         GetCashNo(NO_CARD) as NO_CARD, '
            +'         case DS_TRD  when ''C'' then -AMT_APPROVAL else AMT_APPROVAL end as AMT_APPROVAL, '
            +'         case DS_TRD  when ''C'' then (AMT_APPROVAL-AMT_VAT) * -1 else AMT_APPROVAL-AMT_VAT end as AMT_NET, '
            +'         case DS_TRD  when ''C'' then -AMT_VAT else AMT_VAT end as AMT_VAT, '
            +'         NO_APPROVAL, '
            +'         StoD(TRD_DATE) as YMD_APPROVAL '
            +'from     SL_CASH   '
            +'where    CD_HEAD  =:P0 '
            +'  and    CD_STORE =:P1 '
            +'  and    YMD_SALE between :P2 and :P3 '
            +'order by YMD_SALE, NO_POS, NO_RCP, SEQ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableCashReceiptView);
  end
  else if Grid.ActiveLevel = GridLevel5 then
  begin
    OpenQuery('select   StoDW(a.YMD_SALE) as YMD_SALE, '
             +'         c.NM_CODE1 as DS_MEMBER, '
             +'         a.CD_MEMBER, '
             +'         b.NM_MEMBER, '
             +'         b.NO_CARD, '
             +'         GetPhoneNo(AES_Decrypt(b.TEL_MOBILE, 71483)) as TEL_MOBILE, '
             +'         a.AMT_TRUST, '
             +'         ConCat(a.NO_POS,''-'',a.NO_RCP) as NO_RCP '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'         MS_MEMBER as b on b.CD_HEAD  = a.CD_HEAD '
             +'                       and b.CD_STORE = :P4 '
             +'                       and a.CD_MEMBER = b.CD_MEMBER left outer join '
             +'         MS_CODE   as c on c.CD_HEAD  = a.CD_HEAD '
             +'                       and c.CD_STORE = b.CD_STORE '
             +'                       and c.CD_CODE  = b.DS_MEMBER '
             +'                       and c.CD_KIND  = ''05'' '
             +' where   a.CD_HEAD  =:P0 '
             +'   and   a.CD_STORE =:P1 '
             +'   and   a.YMD_SALE between :P2 and :P3 '
             +'   and   a.DS_SALE <> ''V'' '
             +'   and   a.CD_MEMBER <> ''''  '
             +'   and   a.AMT_TRUST <> 0 '
             +' order by a.YMD_SALE, a.NO_POS, a.NO_RCP',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               Ifthen(GetStoreOption(1)='1',StandardStore, Storecode)]);

    Result := DM.ReadQuery(Query, GridTableCreditView);
  end
  else if Grid.ActiveLevel = GridLevel6 then
  begin
    OpenQuery('select StoDW(a.YMD_SALE) as YMD_SALE, '
             +'       a.NO_POS, '
             +'       a.NO_RCP, '
             +'       a.AMT_SALE, '
             +'       a.CD_MEMBER, '
             +'       b.NM_MEMBER, '
             +'       b.NO_CARD, '
             +'       GetPhoneNo(AES_Decrypt(b.TEL_MOBILE, 71483)) as NO_TEL, '
             +'       a.AMT_POINT + a.DC_POINT as AMT_POINT '
             +'  from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'       MS_MEMBER as b on b.CD_HEAD   = a.CD_HEAD '
             +'                     and b.CD_STORE  = :P4 '
             +'                     and a.CD_MEMBER = b.CD_MEMBER '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'   and a.DS_SALE <> ''V'' '
             +'   and a.CD_MEMBER <> ''''  '
             +'   and (a.AMT_POINT + a.DC_POINT) <> 0 '
             +' order by a.YMD_SALE, a.NO_POS, a.NO_RCP',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               Ifthen(GetStoreOption(5)='1',StandardStore, Storecode)]);

    Result := DM.ReadQuery(Query, GridTablePointView);
  end
  else if Grid.ActiveLevel = GridLevel4 then
  begin
    OpenQuery('select  StoDW(YMD_SALE) as YMD_SALE, '
            +'         NO_POS, '
            +'         NO_RCP, '
            +'         case DS_TRD when ''C'' then ''취소'' else ''승인'' end as DS_TRD, '
            +'         case TYPE_TRD when ''0'' then ''신용카드'' when ''S'' then ''신용카드'' when ''4'' then ''계좌이체'' end as TYPE_TRD, '
            +'         NO_CARD, '
            +'         case DS_TRD when ''C'' then -AMT_APPROVAL+AMT_CANCEL else AMT_APPROVAL-AMT_CANCEL         end as AMT_APPROVAL, '
            +'         AMT_CANCEL, '
            +'         NO_APPROVAL, '
            +'         case when Cast(GetOnlyNumber(TERM_HALBU) as int) < 2 then ''일시불'' else ConCat(TERM_HALBU,''개월'') end as TERM_HALBU, '
            +'         NM_CARDPL, '
            +'         ConCat(StoD(TRD_DATE),'' '',case when Length(TRD_TIME)=4 then ConCat(Left(TRD_TIME,2),'':'',Right(TRD_TIME,2)) else '''' end) as DT_APPROVAL '
            +'  from   SL_CARD  '
            +' where   CD_HEAD  =:P0 '
            +'   and   CD_STORE =:P1 '
            +'   and   YMD_SALE between :P2 and :P3 '
            +'   and   DS_CARD = ''P'' '
            +'order by YMD_SALE, NO_POS, NO_RCP, SEQ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableLetsOrderView, nil);
  end

end;

procedure TSalePayShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  if Grid.ActiveLevel.Index = 4 then Exit;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  case Grid.ActiveLevel.Index of
    0 : vPrintData := rptSizeBoth + rptAlignCenter + '결제수단별 매출현황'+#13;
    1 :
    begin
      vPrintData := rptSizeBoth + rptAlignCenter + '신용카드 매출현황'+#13;
      vPrintData := vPrintData + rptSizeNormal + rptAlignCenter + '(매입사별)'+#13;
    end;
    2 : vPrintData := rptSizeBoth + rptAlignCenter + '신용카드(건별)내역'+#13;
    3 : vPrintData := rptSizeBoth + rptAlignCenter + '현금영수증 매출현황'+#13;
    4 : vPrintData := rptSizeBoth + rptAlignCenter + '외상 매출현황'+#13;
    5 : vPrintData := rptSizeBoth + rptAlignCenter + '포인트 매출현황'+#13;
  end;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  case Grid.ActiveLevel.Index of
    0 :
    with GridBandedTableView do
    begin
      for vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + rptAlignCenter;
        vPrintData := vPrintData + Format('[ %s ]',[DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewSaleDate.Index]]) + #13;
        vPrintData := vPrintData + rptAlignLeft;
        vPrintData := vPrintData + Format('     매출금액 : %s원', [LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewSaleAmt.Index]),22)]) + #13;
        vPrintData := vPrintData + Format('         현금 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCashCnt.Index]),8),        LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCashAmt.Index]),11)]) + #13;
        vPrintData := vPrintData + Format('   현금영수증 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCashReceiptCnt.Index]),8), LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCashReceiptAmt.Index]),11)]) + #13;
        vPrintData := vPrintData + Format('     신용카드 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCardCnt.Index]),8),        LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCardAmt.Index]),11)]) + #13;
        vPrintData := vPrintData + Format('         수표 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCheckCnt.Index]),8),       LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCheckAmt.Index]),11)]) + #13;
        vPrintData := vPrintData + Format('         외상 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCreditCnt.Index]),8),      LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewCreditAmt.Index]),11)]) + #13;
        vPrintData := vPrintData + Format('       상품권 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewGiftCardCnt.Index]),8),    LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewGiftCardAmt.Index]),11)]) + #13;
        vPrintData := vPrintData + Format('     계좌입금 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewBankCnt.Index]),8),        LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewBankAmt.Index]),11)]) + #13;
        vPrintData := vPrintData + Format('       포인트 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewPointCnt.Index]),8),       LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableViewPointAmt.Index]),11)]) + #13;
        if vIndex < DataController.RecordCount-1 then
          vPrintData := vPrintData +  rptOneLine+#13;
      end;

      //합계출력
      if DataController.FilteredRecordCount > 1 then
      begin
        vPrintData := vPrintData +  rptTwoLine+#13;
        vPrintData := vPrintData +  rptCharBold;
        vPrintData := vPrintData + rptAlignCenter;
        vPrintData := vPrintData + '[  합  계  ]'+#13;
        vPrintData := vPrintData + rptAlignLeft;
        vPrintData := vPrintData + Format('     매출금액 : %s원', [LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[0]),22)]) + #13;
        vPrintData := vPrintData + Format('         현금 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[1]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[2]),11)]) + #13;
        vPrintData := vPrintData + Format('   현금영수증 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[3]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[4]),11)]) + #13;
        vPrintData := vPrintData + Format('     신용카드 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[5]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[6]),11)]) + #13;
        vPrintData := vPrintData + Format('         수표 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[7]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[8]),11)]) + #13;
        vPrintData := vPrintData + Format('         외상 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[9]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[10]),11)]) + #13;
        vPrintData := vPrintData + Format('       상품권 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[13]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[14]),11)]) + #13;
        vPrintData := vPrintData + Format('     계좌입금 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[26]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[27]),11)]) + #13;
        vPrintData := vPrintData + Format('       포인트 : %s건 %s원', [LPad(FormatFloat('#,0',DataController.Summary.FooterSummaryValues[28]),8), LPad(FormatFloat('#,0', DataController.Summary.FooterSummaryValues[29]),11)]) + #13;
      end;
    end;
    1 :
    with GridDBTableView do
    begin
      vPrintData := vPrintData +  '    카드 매입사           건수        금액'+#13;
      for vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridDBTableViewCardCompany.Index] ,1,16),24,' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridDBTableViewTotalQty.Index], 6, ' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridDBTableViewTotalAmt.Index]),12, ' ')+#13;
      end;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData + Format('     합    계 : %s원', [LPad(FormatFloat('#,0', NVL(DataController.Summary.FooterSummaryValues[5],0)),22)]) + #13;
    end;
    2 :
    with GridTableView do
    begin
      vPrintData := vPrintData +  '      카드번호         승인금액   승인번호'+#13;
      for vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        if Length(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewCardNo.Index]) = 16 then
          vPrintData := vPrintData + FormatMaskText('!0000-0000-0000-0000;0;', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewCardNo.Index])
                                   + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewApprovalAmt.Index]), 12, ' ')
                                   + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewApprovalNo.Index],11, ' ')+#13
        else
          vPrintData := vPrintData + RPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewCardNo.Index],19,' ')
                                   + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewApprovalAmt.Index]), 12, ' ')
                                   + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewApprovalNo.Index],11, ' ')+#13;

      end;
    end;
    3 :
    with GridTableCashReceiptView do
    begin
      vPrintData := vPrintData +  '     식별번호         승인금액   승인번호'+#13;
      for vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + RPad(GetPhoneNo(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableCashReceiptViewCardNo.Index]), 19, ' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableCashReceiptViewApprovalAmt.Index]), 11, ' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableCashReceiptViewApprovalNo.Index],11, ' ')+#13;
      end;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData + Format('     합    계 : %s원', [LPad(FormatFloat('#,0', NVL(DataController.Summary.FooterSummaryValues[0],0)),22)]) + #13;
    end;
    4 :
    with GridTableCreditView do
    begin
      vPrintData := vPrintData +  '  회원코드       회원이름         외상금액'+#13;
      for vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + ' '+GetPhoneNo(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableCreditViewMemberCode.Index])
                                 + ' '+RPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableCreditViewMemberName.Index], 20, ' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableCreditViewCreditAmt.Index]),10, ' ')+#13;
      end;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData + Format('     합    계 : %s원', [LPad(FormatFloat('#,0', NVL(DataController.Summary.FooterSummaryValues[0],0)),22)]) + #13;
    end;
    5 :
    with GridTablePointView do
    begin
      vPrintData := vPrintData +  '  회원코드       회원이름       사용포인트'+#13;
      for vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + ' '+GetPhoneNo(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTablePointViewMemberCode.Index])
                                 + ' '+RPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTablePointViewMembrerName.Index], 20, ' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTablePointViewPointAmt.Index]),10, ' ')+#13;
      end;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData + Format('     합    계 : %s원', [LPad(FormatFloat('#,0', NVL(DataController.Summary.FooterSummaryValues[0],0)),22)]) + #13;
    end;

  end;
  vPrintData := vPrintData +  rptTwoLine+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

end.
