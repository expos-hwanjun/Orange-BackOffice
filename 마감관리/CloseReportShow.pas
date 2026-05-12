{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
// 영업일보 (완료)

//##### 다른 폼에서 부를 때 메시지 처리
//##### 조회 시 날짜가 바뀌었는데도 차트 업데이트 안되는 문제 수정

unit CloseReportShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ExtCtrls, DateUtils, cxGridBandedTableView,
  AdvSplitter, ImgList, Menus, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, StrUtils, AdvToolBarStylers,
  StdCtrls, cxRadioGroup, OleCtrls, SHDocVw,
  frxClass, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCloseReportShowForm = class(TInheritShowForm)
    SalePanel: TPanel;
    SaleGrid: TcxGrid;
    SaleGridLevel: TcxGridLevel;
    SaleGridTableView: TcxGridTableView;
    SaleGridTableViewType: TcxGridColumn;
    SaleGridTableViewAmt: TcxGridColumn;
    SaleGridTableViewDCAmt: TcxGridColumn;
    SaleGridTableViewSaleAmt: TcxGridColumn;
    SaleGridTableViewTaxNetAmt: TcxGridColumn;
    SaleGridTableViewNoTaxNetAmt: TcxGridColumn;
    SaleGridTableViewVatAmt: TcxGridColumn;
    SaleGridTableViewCustomerQty: TcxGridColumn;
    SaleGridTableViewCustomerAmt: TcxGridColumn;
    SaleSplitter: TAdvSplitter;
    SumChartPanel: TPanel;
    PayGrid: TcxGrid;
    PayGridLevel: TcxGridLevel;
    PayGridBandedTableView: TcxGridBandedTableView;
    PayGridBandedTableViewType: TcxGridBandedColumn;
    PayGridBandedTableViewCashQty: TcxGridBandedColumn;
    PayGridBandedTableViewCashAmt: TcxGridBandedColumn;
    PayGridBandedTableViewCashReceiptQty: TcxGridBandedColumn;
    PayGridBandedTableViewCashReceiptAmt: TcxGridBandedColumn;
    PayGridBandedTableViewCardQty: TcxGridBandedColumn;
    PayGridBandedTableViewCardAmt: TcxGridBandedColumn;
    PayGridBandedTableViewCreditQty: TcxGridBandedColumn;
    PayGridBandedTableViewCreditAmt: TcxGridBandedColumn;
    PayGridBandedTableViewGiftCardQty: TcxGridBandedColumn;
    PayGridBandedTableViewGiftCardAmt: TcxGridBandedColumn;
    PaySplitter: TAdvSplitter;
    PosGrid: TcxGrid;
    PosGridLevel: TcxGridLevel;
    PosGridBandedTableView: TcxGridBandedTableView;
    PosGridBandedTableViewPosNo: TcxGridBandedColumn;
    PosGridBandedTableViewCashierName: TcxGridBandedColumn;
    PosGridBandedTableViewReserveAmt: TcxGridBandedColumn;
    PosGridBandedTableViewDepositAmt: TcxGridBandedColumn;
    PosGridBandedTableViewCashAmt: TcxGridBandedColumn;
    PosGridBandedTableViewOverShortAmt: TcxGridBandedColumn;
    PosGridBandedTableViewSaleAmt: TcxGridBandedColumn;
    PosGridBandedTableViewReturnQty: TcxGridBandedColumn;
    PosGridBandedTableViewReturnAmt: TcxGridBandedColumn;
    PosGridBandedTableViewVoidQty: TcxGridBandedColumn;
    PosGridBandedTableViewVoidAmt: TcxGridBandedColumn;
    PosGridBandedTableViewCancelQty: TcxGridBandedColumn;
    PosGridBandedTableViewCancelAmt: TcxGridBandedColumn;
    PosSplitter: TAdvSplitter;
    ChartPanel: TPanel;
    FastReport: TfrxReport;
    FastReportSaleDataSet: TfrxUserDataSet;
    FastReportPayDataSet: TfrxUserDataSet;
    FastReportPosDataSet: TfrxUserDataSet;
    FastReportDCDataSet: TfrxUserDataSet;
    DCGridLevel: TcxGridLevel;
    DCGridTableView: TcxGridTableView;
    DCGridTableViewType: TcxGridColumn;
    DCGridTableViewDCQty: TcxGridColumn;
    DCGridTableViewDCAmt: TcxGridColumn;
    SaleGridTableViewDeliveryCount: TcxGridColumn;
    SaleGridTableViewDeliveryAmt: TcxGridColumn;
    SaleGridTableViewDeliveryRate: TcxGridColumn;
    FastReportClassDataSet: TfrxUserDataSet;
    ClassGridLevel: TcxGridLevel;
    ClassGridTableView: TcxGridTableView;
    ClassGridTableViewColumn1: TcxGridColumn;
    ClassGridTableViewColumn2: TcxGridColumn;
    ClassGridTableViewColumn3: TcxGridColumn;
    SaleGridTableViewDutyAmt: TcxGridColumn;
    CompanyChartPanel: TPanel;
    ClassChartPanel: TPanel;
    PayChartPanel: TPanel;
    SaleGridTableViewEventSaleAmt: TcxGridColumn;
    WorkGridLevel: TcxGridLevel;
    WorkGridTableView: TcxGridTableView;
    AcctGridLevel: TcxGridLevel;
    AcctGridTableView: TcxGridTableView;
    WorkGridTableViewSawonCode: TcxGridColumn;
    WorkGridTableViewSawonName: TcxGridColumn;
    WorkGridTableViewComeTime: TcxGridColumn;
    WorkGridTableViewLeaveTime: TcxGridColumn;
    WorkGridTableViewWorkTime: TcxGridColumn;
    AcctGridTableViewAcctName: TcxGridColumn;
    AcctGridTableViewInAmt: TcxGridColumn;
    AcctGridTableViewOutAmt: TcxGridColumn;
    AcctGridTableViewRemark: TcxGridColumn;
    FastReportWorkDataSet: TfrxUserDataSet;
    FastReportAcctDataSet: TfrxUserDataSet;
    PayGridBandedTableViewBankQty: TcxGridBandedColumn;
    PayGridBandedTableViewBankAmt: TcxGridBandedColumn;
    SaleGridTableViewServiceAmt: TcxGridColumn;
    SaleGridTableViewProfitAmt: TcxGridColumn;
    SaleGridTableViewProfitRate: TcxGridColumn;
    PayGridBandedTableViewPointQty: TcxGridBandedColumn;
    PayGridBandedTableViewPointAmt: TcxGridBandedColumn;
    PayGridBandedTableViewStampQty: TcxGridBandedColumn;
    PayGridBandedTableViewStampAmt: TcxGridBandedColumn;
    PayGridBandedTableViewLetsOrderQty: TcxGridBandedColumn;
    PayGridBandedTableViewLetsOrderAmt: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FastReportSaleDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
    procedure FastReportSaleDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportPayDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
    procedure FastReportPayDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportPosDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
    procedure FastReportPosDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportDCDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
    procedure FastReportDCDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportCompanyDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
    procedure FastReportCompanyDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FastReportClassDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
    procedure FastReportClassDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure ButtonToolBarPrintButtonPopupMenuPrint2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FastReportWorkDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure FastReportAcctDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure FastReportWorkDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportAcctDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure ChartPanelResize(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    SummeryChart,
    CompanyChart,
    PayChart,
    ClassChart  : TWebBrowser;

    Report2Sale,
    Report2Cash,
    Report2Card,
    Report2Cancel: TList;

    procedure Print(aPrint: Boolean = true);
    procedure GetPrintData;
  protected
    function  DoSearch:Boolean; override;
    procedure DoPrint;   override;
    procedure DoPreview; override;
  end;

var
  CloseReportShowForm: TCloseReportShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCloseReportShowForm.FormCreate(Sender: TObject);
var
  vPay  : string;
  vIndex: Integer;
begin
  inherited;
  PrintMode   := pmPrintPreview;
  DefaultDate := ddToday;

  // 각 차트를 만든다
  SummeryChart  := TWebBrowser.Create(Self);
  TWinControl(SummeryChart).Parent := SumChartPanel;
  SummeryChart.Align := alClient;

  PayChart      := TWebBrowser.Create(Self);
  TWinControl(PayChart).Parent := PayChartPanel;
  PayChart.Align := alClient;

  ClassChart     := TWebBrowser.Create(Self);
  TWinControl(ClassChart).Parent := ClassChartPanel;
  ClassChart.Align := alClient;

  CompanyChart     := TWebBrowser.Create(Self);
  TWinControl(CompanyChart).Parent := CompanyChartPanel;
  CompanyChart.Align := alClient;


  Report2Sale         := TList.Create;
  Report2Cash         := TList.Create;
  Report2Card         := TList.Create;
  Report2Cancel       := TList.Create;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TCloseReportShowForm.FormDestroy(Sender: TObject);
begin
  Report2Sale.Free;
  Report2Cash.Free;
  Report2Card.Free;
  Report2Cancel.Free;

  inherited;

  SummeryChart.Free;
  PayChart.Free;
  ClassChart.Free;
  CompanyChart.Free;
end;
//------------------------------------------------------------------------------
// 폼 크기가 변경될 때
procedure TCloseReportShowForm.FormResize(Sender: TObject);
begin
  inherited;
  if Assigned(ClassChart) and (ChartPanel.Tag = 0) then
  begin
    ChartPanel.Tag          := 1;
    CompanyChartPanel.Width := ChartPanel.Width div 3-10;
    ClassChartPanel.Width   := ChartPanel.Width div 3-10;
    PayChartPanel.Width     := ChartPanel.Width div 3-10;
  end;

end;

procedure TCloseReportShowForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//######
procedure TCloseReportShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    Exec_Timer.Enabled := True;
  end;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TCloseReportShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(CompanyChart) and (CompanyChart.Hint <> '') then
    ShowChart(CompanyChart, 'CompanyChart', 'column3d', CompanyChart.Hint);
  if Assigned(ClassChart) and (ClassChart.Hint <> '') then
    ShowChart(ClassChart, 'ClassChart', 'column3d', ClassChart.Hint);
  if Assigned(PayChart) and (PayChart.Hint <> '') then
    ShowChart(PayChart, 'CompanyChart', 'pie3d', PayChart.Hint);
end;

procedure TCloseReportShowForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 미리보기 버튼
procedure TCloseReportShowForm.ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
begin
//inherited;

  if not ButtonToolBarPrintButtonPopupMenuPreview.Visible or not ButtonToolBarPrintButtonPopupMenuPreview.Enabled then
    Exit;

  if PosGridBandedTableView.DataController.RecordCount = 0 then
    ShowMsg(msgNoPrintData)
  else
    DoPreview;
end;
//------------------------------------------------------------------------------
// 출력 버튼
procedure TCloseReportShowForm.ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
begin
//inherited;

  if not ButtonToolBarPrintButtonPopupMenuPrint.Visible or not ButtonToolBarPrintButtonPopupMenuPrint.Enabled then
    Exit;

  if PosGridBandedTableView.DataController.RecordCount = 0 then
    ShowMsg(msgNoPrintData)
  else
    DoPrint;
end;
procedure TCloseReportShowForm.ButtonToolBarPrintButtonPopupMenuPrint2Click(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 출력
//------------------------------------------------------------------------------
// 판매 데이터 얻기
procedure TCloseReportShowForm.FastReportSaleDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to SaleGridTableView.ColumnCount-1 do
    if SaleGridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := SaleGridTableView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex];
      break;
    end;
end;
//------------------------------------------------------------------------------
// 판매 EOF
procedure TCloseReportShowForm.FastReportSaleDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  inherited;

  if SaleGridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportSaleDataSet.RecNo >= SaleGridTableView.DataController.RecordCount;
end;
//------------------------------------------------------------------------------
// 할인 데이터 얻기
procedure TCloseReportShowForm.FastReportDCDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to DCGridTableView.ColumnCount-1 do
    if DCGridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := DCGridTableView.DataController.Values[FastReportDCDataSet.RecNo, vIndex];
      break;
    end;
end;
//------------------------------------------------------------------------------
// 할인 EOF
procedure TCloseReportShowForm.FastReportDCDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  inherited;

  if DCGridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportDCDataSet.RecNo >= DCGridTableView.DataController.RecordCount;
end;
//------------------------------------------------------------------------------
// 결제 데이터 얻기
procedure TCloseReportShowForm.FastReportPayDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to PayGridBandedTableView.ColumnCount-1 do
    if PayGridBandedTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := PayGridBandedTableView.DataController.Values[FastReportPayDataSet.RecNo, vIndex];
      break;
    end;
end;
//------------------------------------------------------------------------------
// 결제 EOF
procedure TCloseReportShowForm.FastReportPayDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  inherited;

  if PayGridBandedTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportPayDataSet.RecNo >= PayGridBandedTableView.DataController.RecordCount;
end;
//------------------------------------------------------------------------------
// 계산원 데이터 얻기
procedure TCloseReportShowForm.FastReportPosDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to PosGridBandedTableView.ColumnCount-1 do
    if PosGridBandedTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := PosGridBandedTableView.DataController.Values[FastReportPosDataSet.RecNo, vIndex];
      break;
    end;
end;
//------------------------------------------------------------------------------
// 계산원 EOF
procedure TCloseReportShowForm.FastReportPosDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  inherited;

  if PosGridBandedTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportPosDataSet.RecNo >= PosGridBandedTableView.DataController.RecordCount;
end;
procedure TCloseReportShowForm.FastReportCompanyDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

end;
//------------------------------------------------------------------------------
// 임대업장 EOF
procedure TCloseReportShowForm.FastReportCompanyDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 분류 데이터 얻기
procedure TCloseReportShowForm.FastReportClassDataSetNewGetValue(
  Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to ClassGridTableView.ColumnCount-1 do
    if ClassGridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := ClassGridTableView.DataController.Values[FastReportClassDataSet.RecNo, vIndex];
      break;
    end;
end;
//------------------------------------------------------------------------------
// 분류 EOF
procedure TCloseReportShowForm.FastReportClassDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;

  if ClassGridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportClassDataSet.RecNo >= ClassGridTableView.DataController.RecordCount;
end;
procedure TCloseReportShowForm.FastReportWorkDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if WorkGridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportWorkDataSet.RecNo >= WorkGridTableView.DataController.RecordCount;

end;

procedure TCloseReportShowForm.FastReportWorkDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to WorkGridTableView.ColumnCount-1 do
    if WorkGridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := WorkGridTableView.DataController.Values[FastReportWorkDataSet.RecNo, vIndex];
      break;
    end;
end;

procedure TCloseReportShowForm.FastReportAcctDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if AcctGridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportAcctDataSet.RecNo >= AcctGridTableView.DataController.RecordCount;

end;

procedure TCloseReportShowForm.FastReportAcctDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to AcctGridTableView.ColumnCount-1 do
    if AcctGridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := AcctGridTableView.DataController.Values[FastReportAcctDataSet.RecNo, vIndex];
      break;
    end;
end;

//==============================================================================
// 타이머
//------------------------------------------------------------------------------
// 반복 조회 타이머
procedure TCloseReportShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;

  Exec_Timer.Enabled := false;
  DoSearch;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TCloseReportShowForm.DoSearch:Boolean;
var
  vDateToday, vDateYesterday, vDateLastWeek, vDateLastMonth, vDateLastYear: string;
  vIndex   : Integer;
  vValue   : Currency;
  vChartXml: string;
begin
//inherited;
  FormResize(nil);
  Result := true;
  vDateToday     := DtoS(ConditionToolBarFromDateEdit.Date);
  vDateYesterday := DtoS(ConditionToolBarFromDateEdit.Date-1);
  vDateLastWeek  := DtoS(IncWeek(ConditionToolBarFromDateEdit.Date, -1));
  vDateLastMonth := DtoS(IncMonth(ConditionToolBarFromDateEdit.Date,-1));
  vDateLastYear  := DtoS(IncYear(ConditionToolBarFromDateEdit.Date, -1));

  try
    // 매출자료 조회
    OpenQuery('select   GUBUN, '
             +'         AMT_TOT, '
             +'         DC_TOT, '
             +'         AMT_SERVICE, '
             +'         AMT_SALE, '
             +'         AMT_NET - AMT_TAX as AMT_NET_SUPPLY, '
             +'         AMT_DUTYFREE, '
             +'         AMT_TAX, '
             +'         AMT_NET, '
             +'         QTY_CUST, '
             +'         AMT_CUST, '
             +'         CNT_DELIVERY, '
             +'         AMT_DELIVERY, '
             +'         Round(AMT_DELIVERY / case when AMT_SALE = 0 then 1 else AMT_SALE end * 100, 2) as RATE_DELIVERY, '
             +'         AMT_SALE - AMT_BUY as AMT_PROFIT, '
             +'         RATE_PROFIT '
             +'from    (select   case h.YMD_SALE when :P2 then 1        when :P3 then 2        when :P4 then 3        when :P5 then 4        when :P6 then 5        end as SEQ, '
             +'                  case h.YMD_SALE when :P2 then ''당일'' when :P3 then ''전일'' when :P4 then ''전주'' when :P5 then ''전월'' when :P6 then ''전년'' end as GUBUN, '
             +'                  Sum(h.AMT_SALE + h.DC_TOT + h.AMT_SERVICE) as AMT_TOT, '
             +'                  Sum(h.DC_TOT)              as DC_TOT, '
             +'                  Sum(h.AMT_SERVICE)         as AMT_SERVICE, '
             +'                  Sum(h.AMT_SALE)            as AMT_SALE, '
             +'                  Sum(h.AMT_SALE-h.AMT_DUTYFREE) as AMT_NET, '
             +'                  Sum(h.AMT_DUTYFREE) as AMT_DUTYFREE, '
             +'                  Sum(h.AMT_TAX)             as AMT_TAX, '
             +'                  Sum(h.CNT_CUSTOMER) as QTY_CUST, '
             +'                  case when Sum(h.CNT_CUSTOMER) = 0 then Sum(h.AMT_SALE) else Round(Sum(h.AMT_SALE) / Sum(h.CNT_CUSTOMER), 0) end as AMT_CUST, '
             +'                  Sum(h.AMT_EVENT)  as AMT_SALE_EVENT, '
             +'                  Sum(h.CNT_DELIVERY) as CNT_DELIVERY, '
             +'                  Sum(h.AMT_DELIVERY) as AMT_DELIVERY, '
             +'                  Sum(h.AMT_BUY) as AMT_BUY, '
             +'                  GetProfitRate(Sum(h.AMT_BUY), Sum(h.AMT_SALE)) as RATE_PROFIT '
             +'         from     SL_SALE_H_SUM as h  '
             +'         where    h.CD_HEAD  =:P0 '
             +'           and    h.CD_STORE =:P1 '
             +'           and    h.YMD_SALE in (:P2, :P3, :P4, :P5, :P6) '
             +'         group by h.YMD_SALE '
             +'         union all '
             +'         select   6        as SEQ, '
             +'                  ''월계'' as GUBUN, '
             +'                  Sum(h.AMT_SALE + h.DC_TOT + h.AMT_SERVICE) as AMT_TOT, '
             +'                  Sum(h.DC_TOT)              as DC_TOT, '
             +'                  Sum(h.AMT_SERVICE)         as AMT_SERVICE, '
             +'                  Sum(h.AMT_SALE)            as AMT_SALE, '
             +'                  Sum(h.AMT_SALE-h.AMT_DUTYFREE) as AMT_NET, '
             +'                  Sum(h.AMT_DUTYFREE) as AMT_DUTYFREE, '
             +'                  Sum(h.AMT_TAX)             as AMT_TAX, '
             +'                  Sum(h.CNT_CUSTOMER) as QTY_CUST, '
             +'                  case when Sum(h.CNT_CUSTOMER) = 0 then Sum(h.AMT_SALE) else Round(Sum(h.AMT_SALE) / Sum(h.CNT_CUSTOMER), 0) end as AMT_CUST, '
             +'                  Sum(h.AMT_EVENT)    as AMT_SALE_EVENT, '
             +'                  Sum(h.CNT_DELIVERY) as CNT_DELIVERY, '
             +'                  Sum(h.AMT_DELIVERY) as AMT_DELIVERY, '
             +'                  Sum(h.AMT_BUY) as AMT_BUY, '
             +'                  GetProfitRate(Sum(h.AMT_BUY), Sum(h.AMT_SALE)) as RATE_PROFIT '
             +'         from     SL_SALE_H_SUM as h   '
             +'         where    h.CD_HEAD  =:P0 '
             +'           and    h.CD_STORE =:P1 '
             +'           and    h.YMD_SALE between ConCat(Left(:P2, 6),''01'') and :P2 '
             +'      ) as t '
             +'order by SEQ',
              [HeadStoreCode,
               StoreCode,
               vDateToday,
               vDateYesterday,
               vDateLastWeek,
               vDateLastMonth,
               vDateLastYear]);
    DM.ReadQuery(Query, SaleGridTableView);

    // 매출자료 차트 표시
    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''0'' rotatevalues=''0'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
    for vIndex := SaleGridTableView.DataController.RecordCount-2 downto 0 do
      vChartXml := vChartXml + '<set label="'+SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewType.Index]+'" value="'+FloatToStr(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewSaleAmt.Index])+'" /> ';
    vChartXml   := vChartXml + '</chart>';
    ShowChart(SummeryChart, 'SummeryChart', 'column3d', vChartXml);

    // 입금자료 조회
    OpenQuery('select   ''일계''                                         as GUBUN, '
             +'         Sum(case when AMT_CASH+AMT_CHECK    = 0 then 0 else 1 end) as QTY_CASH, '
             +'         Sum(AMT_CASH+AMT_CHECK)                                    as AMT_CASH, '
             +'         (select count(YMD_SALE) from SL_CASH where CD_HEAD  = :P0 and CD_STORE = :P1 and YMD_SALE = :P2 ) as QTY_CASHRCP, '
             +'         Sum(AMT_CASHRCP)                                 as AMT_CASHRCP, '
             +'         (select count(YMD_SALE) from SL_CARD where CD_HEAD  = :P0 and CD_STORE = :P1 and YMD_SALE = :P2 ) as QTY_CARD, '
             +'         Sum(AMT_CARD)                                    as AMT_CARD, '
             +'         Sum(case when AMT_TRUST   = 0 then 0 else 1 end) as QTY_TRUST, '
             +'         Sum(AMT_TRUST)                                   as AMT_TRUST, '
             +'         Sum(case when AMT_GIFT    = 0 then 0 else 1 end) as QTY_GIFT, '
             +'         Sum(AMT_GIFT)                                    as AMT_GIFT, '
             +'         Sum(case when AMT_BANK    = 0 then 0 else 1 end) as QTY_BANK, '
             +'         Sum(AMT_BANK)                                    as AMT_BANK, '
             +'         Sum(case when AMT_POINT + DC_POINT = 0 then 0 else 1 end) as QTY_POINT, '
             +'         Sum(AMT_POINT+DC_POINT)                                  as AMT_POINT, '
             +'         Sum(case when DC_STAMP   = 0 then 0 else 1 end) as QTY_STAMP, '
             +'         Sum(DC_STAMP)                                    as AMT_STAMP, '
             +'         Sum(case when AMT_LETSORDER = 0 then 0 else 1 end) as QTY_LETSORDER, '
             +'         Sum(AMT_LETSORDER)                                    as AMT_LETSORDER '
             +'from     SL_SALE_H_SUM '
             +'where    CD_HEAD  = :P0 '
             +'  and    CD_STORE = :P1 '
             +'  and    YMD_SALE = :P2 '
             +'union all '
             +'select   ''월계''                                         as GUBUN, '
             +'         Sum(case when AMT_CASH+AMT_CHECK    = 0 then 0 else 1 end) as QTY_CASH, '
             +'         Sum(AMT_CASH+AMT_CHECK)                                    as AMT_CASH, '
             +'         (select count(YMD_SALE) from SL_CASH where CD_HEAD =:P0 and CD_STORE = :P1 and YMD_SALE between ConCat(Left(:P2, 6),''01'') and :P2 ) as QTY_CASHRCP, '
             +'         Sum(AMT_CASHRCP)                                 as AMT_CASHRCP, '
             +'         (select count(YMD_SALE) from SL_CARD where CD_HEAD =:P0 and CD_STORE = :P1 and YMD_SALE between ConCat(Left(:P2, 6),''01'') and :P2 ) as QTY_CARD, '
             +'         Sum(AMT_CARD)                                    as AMT_CARD, '
             +'         Sum(case when AMT_TRUST   = 0 then 0 else 1 end) as QTY_TRUST, '
             +'         Sum(AMT_TRUST)                                   as AMT_TRUST, '
             +'         Sum(case when AMT_GIFT    = 0 then 0 else 1 end) as QTY_GIFT, '
             +'         Sum(AMT_GIFT)                                    as AMT_GIFT, '
             +'         Sum(case when AMT_BANK    = 0 then 0 else 1 end) as QTY_BANK, '
             +'         Sum(AMT_BANK)                                    as AMT_BANK, '
             +'         Sum(case when AMT_POINT + DC_POINT = 0 then 0 else 1 end) as QTY_POINT, '
             +'         Sum(AMT_POINT+DC_POINT)                                  as AMT_POINT, '
             +'         Sum(case when DC_STAMP   = 0 then 0 else 1 end) as QTY_STAMP, '
             +'         Sum(DC_STAMP)                                    as AMT_STAMP, '
             +'         Sum(case when AMT_LETSORDER = 0 then 0 else 1 end) as QTY_LETSORDER, '
             +'         Sum(AMT_LETSORDER)                                    as AMT_LETSORDER '
             +'from     SL_SALE_H_SUM  '
             +'where    CD_HEAD  = :P0 '
             +'  and    CD_STORE = :P1 '
             +'  and    YMD_SALE between ConCat(Left(:P2, 6),''01'') and :P2 ',
              [HeadStoreCode,
               StoreCode,
               vDateToday]);
    DM.ReadQuery(Query, PayGridBandedTableView);
    PayGrid.Height := (PayGridBandedTableView.DataController.RecordCount+2) * 23;

    // 마감자료 조회
    OpenQuery('select   c.NO_POS, '
             +'         c.NM_SAWON, '
             +'         c.AMT_READY, '
             +'         c.AMT_MID, '
             +'         c.AMT_CASH, '
             +'         c.AMT_LACK, '
             +'         c.AMT_SALE, '
             +'         d.QTY_RETURN, '
             +'         d.AMT_RETURN, '
             +'         c.CNT_VOID, '
             +'         c.AMT_VOID, '
             +'         e.QTY_CANCEL, '
             +'         e.AMT_CANCEL '
             +'from    (select   a.NO_POS, '
             +'                  a.CD_SAWON, '
             +'                  b.NM_SAWON, '
             +'                  a.AMT_READY, '
             +'                  a.AMT_MID, '
             +'                  a.AMT_SALE, '
             +'                  a.AMT_LACK, '
             +'                  a.CNT_VOID, '
             +'                  a.AMT_VOID, '
             +'                  a.AMT_CASH + a.AMT_CHECK as AMT_CASH '
             +'         from     SL_CASHIER_MGM as a  inner join '
             +'                  MS_SAWON       as b  on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
             +'         where    a.CD_HEAD  =  :P0 '
             +'           and    a.CD_STORE  = :P1 '
             +'           and    a.YMD_CLOSE = :P2 '
             +'           and    a.YN_CLOSE  = ''Y'') as c left outer join '
             +'        (select   NO_POS, '
             +'                  CD_SAWON, '
             +'                  Sum(case when DS_SALE = ''B'' then 1        else 0                     end) as QTY_RETURN, '
             +'                  Sum(case when DS_SALE = ''B'' then AMT_SALE else 0                     end) as AMT_RETURN  '
             +'          from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'         where    CD_HEAD  = :P0 '
             +'           and    CD_STORE = :P1 '
             +'           and    YMD_SALE = :P2 '
             +'         group by NO_POS, CD_SAWON) as d on c.NO_POS = d.NO_POS and c.CD_SAWON = d.CD_SAWON left outer join '
             +'        (select   a.NO_POS, '
             +'                  a.CD_SAWON, '
             +'                  Sum(case when a.SEQ = 1 then 1 else 0 end) as QTY_CANCEL, '
             +'                  Sum(b.PR_SALE)                              as AMT_CANCEL '
             +'         from     SL_SALE_C as a  inner join '
             +'                  MS_MENU   as b  on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU '
             +'         where    a.CD_HEAD  = :P0 '
             +'           and    a.CD_STORE = :P1 '
             +'           and    a.YMD_SALE = :P2 '
             +'         group by a.NO_POS, a.CD_SAWON) as e on c.NO_POS = e.NO_POS and c.CD_SAWON = e.CD_SAWON  '
             +'order by c.NO_POS',
              [HeadStoreCode,
               StoreCode,
               vDateToday]);
    DM.ReadQuery(Query, PosGridBandedTableView);
    PosGrid.Height := (PosGridBandedTableView.DataController.RecordCount+2) * 23;


    // 결제수단별 차트 조회
    if (PayGridBandedTableView.DataController.RecordCount > 0) and
       (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewType.Index] = '일계') then
    begin
      vChartXml := '<chart caption=''결제수단별 매출'' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCashAmt.Index]        <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCashAmt.Index]        <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[1].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCashAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCashReceiptAmt.Index] <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCashReceiptAmt.Index] <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[2].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCashReceiptAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCardAmt.Index]        <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCardAmt.Index]        <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[3].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCardAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewLetsOrderAmt.Index]   <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewLetsOrderAmt.Index]   <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[4].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewLetsOrderAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCreditAmt.Index]      <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCreditAmt.Index]      <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[5].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewCreditAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewGiftCardAmt.Index]    <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewGiftCardAmt.Index]    <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[6].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewGiftCardAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewBankAmt.Index]   <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewBankAmt.Index]   <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[7].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewBankAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewPointAmt.Index]   <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewPointAmt.Index]   <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[8].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewPointAmt.Index])+'" /> ';
      if (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewStampAmt.Index]   <> null) and (PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewStampAmt.Index]   <> 0) then
        vChartXml := vChartXml + '<set label="'+PayGridBandedTableView.Bands[9].Caption+'" value="'+FloatToStr(PayGridBandedTableView.DataController.Values[0, PayGridBandedTableViewStampAmt.Index])+'" /> ';
      vChartXml   := vChartXml + '</chart>';
      ShowChart(PayChart, 'PayChart', 'pie3d', vChartXml);
    end;
  finally
    FinishQuery;
  end;

  // 일자별매출 차트 조회
  OpenQuery('select  Right(YMD_SALE,2) as DAY_SALE, '
           +'        AMT_SALE '
           +'  from  SL_SALE_H_SUM  '
           +' where  CD_HEAD  = :P0 '
           +'   and  CD_STORE = :P1 '
           +'   and  YMD_SALE between :P2 and :P3 ',
            [HeadStoreCode,
             StoreCode,
             LeftStr(vDateToday,6)+'01',
             vDateToday]);
    try
      vIndex := 1;
      vValue := 0;
      vChartXml := '<chart caption=''일별 매출'' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
      while not Query.Eof do
      begin
        vChartXml := vChartXml + '<set label="'+Query.Fields[0].AsString+'" value="'+Query.Fields[1].AsString+'" /> ';
        Query.Next;
      end;
      vChartXml   := vChartXml + '</chart>';
      ShowChart(CompanyChart, 'CompanyChart', 'column3d', vChartXml);
    finally
      FinishQuery;
    end;


    // 상품 분류별 차트 조회
    OpenQuery('select   a.CD_CLASS, '
             +'         case when Ifnull(a.NM_CLASS,'''') = '''' then ''(미지정)'' else a.NM_CLASS end as NM_CLASS, '
             +'         a.AMT_SALE, '
             +'         case when b.AMT_TOTAL = 0 then 0 else Round(a.AMT_SALE / b.AMT_TOTAL * 100, 2) end as RATE '
             +'from    (select   Left(Ifnull(g.CD_CLASS,''''),2) as CD_CLASS, '
             +'                  Max(c.NM_CLASS)    as NM_CLASS, '
             +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'                  GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
             +'         from     SL_SALE_D_SUM   as d  inner join '
             +'                  MS_MENU         as g  on d.CD_HEAD  = g.CD_HEAD '
             +'                                       and d.CD_STORE = g.CD_STORE '
             +'                                       and d.CD_MENU  = g.CD_MENU left outer join '
             +'                  MS_MENU_CLASS   as c  on g.CD_HEAD = c.CD_HEAD '
             +'                                       and g.CD_STORE = c.CD_STORE '
             +'                                       and Left(g.CD_CLASS,2) = c.CD_CLASS '
             +'         where    d.CD_HEAD  = :P0 '
             +'           and    d.CD_STORE = :P1 '
             +'           and    d.YMD_SALE = :P2 '
             +'         group by Left(Ifnull(g.CD_CLASS,''''),2)) as a, '
             +'        (select   Sum(AMT_SALE) as AMT_TOTAL '
             +'         from     SL_SALE_H_SUM  '
             +'         where    CD_HEAD  = :P0 '
             +'           and    CD_STORE = :P1 '
             +'           and    YMD_SALE = :P2 ) as b '
             +' order by a.CD_CLASS',
              [HeadStoreCode,
               StoreCode,
               vDateToday]);

    try
      vChartXml := '<chart caption=''분류별 매출'' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
      while not Query.Eof do
      begin
        vChartXml := vChartXml + '<set label="'+Query.Fields[1].AsString+'" value="'+Query.Fields[2].AsString+'" /> ';
        Query.Next;
      end;
      vChartXml   := vChartXml + '</chart>';
      ShowChart(ClassChart, 'ClassChart', 'column3d', vChartXml);
    finally
      DM.ReadQuery(Query, ClassGridTableView);
    end;
end;
//------------------------------------------------------------------------------
// 미리보기
procedure TCloseReportShowForm.DoPreview;
begin
//inherited;
  Print(false);
end;
//------------------------------------------------------------------------------
// 출력
procedure TCloseReportShowForm.DoPrint;
begin
//inherited;
  Print;
end;
//------------------------------------------------------------------------------
// 출력
procedure TCloseReportShowForm.Print(aPrint: Boolean);
var
  vMemo: TfrxMemoView;
begin
  GetPrintData;
  // 날짜
  vMemo := TfrxMemoView(FastReport.FindObject('DateLabel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatDateTime('yyyy-mm-dd(ddd)', ConditionToolBarFromDateEdit.Date);
  // 푸터 제목
  vMemo := TfrxMemoView(FastReport.FindObject('ProgramNameLabel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Caption;

  // 출력
  if aPrint then
  begin
    FastReport.PrepareReport();
    FastReport.Print;
  end
  else
    FastReport.ShowReport;
end;
//------------------------------------------------------------------------------
// 출력할 자료 조회
procedure TCloseReportShowForm.GetPrintData;
var vDateToday : String;
begin
  vDateToday     := DtoS(ConditionToolBarFromDateEdit.Date);
  try
    // 할인 조회 (출력용)
    OpenQuery('select     ''행사 할인''    as GUBUN, '
             +'            Count(DC_SPC)    as QTY_DC, '
             +'            Sum(DC_SPC)      as AMT_DC '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_SPC  <> 0 '
             +'  having Count(DC_SPC) > 0 '
             +'   union all '
             +'   select   ''부가세 할인'', '
             +'            Count(DC_VAT), '
             +'            Sum(DC_VAT) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_VAT  <> 0 '
             +'  having Count(DC_VAT) > 0 '
             +'   union all '
             +'   select   ''영수증 할인'', '
             +'            Count(DC_RECEIPT), '
             +'            Sum(DC_RECEIPT) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_RECEIPT  <> 0 '
             +'  having Count(DC_RECEIPT) > 0 '
             +'   union all '
             +'   select   ''메뉴 할인'', '
             +'            Count(DC_MENU), '
             +'            Sum(DC_MENU) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_MENU  <> 0 '
             +'  having Count(DC_MENU) > 0 '
             +'   union all '
             +'   select   ''회원 할인'', '
             +'            Count(DC_MEMBER), '
             +'            Sum(DC_MEMBER) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_MEMBER  <> 0 '
             +'  having Count(DC_MEMBER) > 0 '
             +'   union all '
             +'   select   ''포인트 할인'', '
             +'            Count(DC_POINT), '
             +'            Sum(DC_POINT) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_POINT  <> 0 '
             +'  having Count(DC_POINT) > 0 '
             +'   union all '
             +'   select   ''스템프 할인'', '
             +'            Count(DC_STAMP), '
             +'            Sum(DC_STAMP) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_STAMP  <> 0 '
             +'  having Count(DC_STAMP) > 0 '
             +'   union all '
             +'   select   ''TaxFree 할인'', '
             +'            Count(DC_TAXFREE), '
             +'            Sum(DC_TAXFREE) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_TAXFREE  <> 0 '
             +'  having Count(DC_TAXFREE) > 0 '
             +'   union all '
             +'   select   ''절사 할인'', '
             +'            Count(DC_CUT), '
             +'            Sum(DC_CUT) '
             +'    from  '+GetPartitionTable('SL_SALE_H', StoD(vDateToday), '')
             +'   where    CD_HEAD  = :P0 '
             +'     and    CD_STORE = :P1 '
             +'     and    YMD_SALE = :P2 '
             +'     and    DS_SALE <> ''V'' '
             +'     and    DC_CUT  <> 0  '
             +'  having Count(DC_CUT) > 0 ',
              [HeadStoreCode,
               StoreCode,
               vDateToday]);
    DM.ReadQuery(Query, DCGridTableView);
  finally
    FinishQuery;
  end;

  //출납내역
  try
    OpenQuery('select b.NM_CODE1 as NM_ACCT, '
             +'       a.AMT_PAYIN, '
             +'       a.AMT_OUT, '
             +'       a.REMARK '
             +'  from SL_ACCT a left outer join '
             +'       MS_CODE b on a.CD_HEAD  = b.CD_HEAD '
             +'                and a.CD_STORE = b.CD_STORE '
             +'                and a.CD_ACCT  = b.CD_CODE '
             +'                and b.CD_KIND  = ''11'' '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.YMD_OCCUR =:P2 '
             +' order by a.NO_ACCT ',
             [HeadStoreCode,
              StoreCode,
              vDateToDay]);
    DM.ReadQuery(Query, AcctGridTableView);
  finally
    FinishQuery;
  end;

  //근태내역
  try
    OpenQuery('select a.CD_SAWON, '
             +'       b.NM_SAWON, '
             +'       a.SETTLE_IN, '
             +'       a.SETTLE_OUT, '
             +'       ConCat(Cast(DivInt(TIMESTAMPDIFF(minute, a.SETTLE_IN, a.SETTLE_OUT),60) as Char) ,''시간'', '
             +'              Cast(TIMESTAMPDIFF(minute, a.SETTLE_IN, a.SETTLE_OUT) % 60 as Char) ,''분'') AS WORK_TIME '
             +'  from SL_SAWONWORK a left outer join '
             +'       MS_SAWON     b on a.CD_HEAD  = b.CD_HEAD '
             +'                     and a.CD_STORE = b.CD_STORE '
             +'                     and a.CD_SAWON = b.CD_SAWON '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and Date_Format(a.SETTLE_IN, ''%Y%m%d'') = :P2 '
             +' order by a.SETTLE_IN ',
             [HeadStoreCode,
              StoreCode,
              vDateToDay]);
    DM.ReadQuery(Query, WorkGridTableView);
  finally
    FinishQuery;
  end;
end;


end.
