// 매출속보 조회 (완료)

unit HeadSaleQuickShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, ExtCtrls, cxContainer, cxEdit,
  Uni, DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxControls, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvToolBar, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, AdvSplitter,
  cxGridBandedTableView, cxCurrencyEdit, cxProgressBar, AdvToolBarStylers,
  StrUtils, cxCheckBox, Contnrs, StdCtrls,DateUtils, Menus,
  AdvPanel, IniFiles, OleCtrls, SHDocVw,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, datelbl, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadSaleQuickShowForm = class(TInheritEditForm)
    RefreshTimer: TTimer;
    cxLabel2: TcxLabel;
    RefreshToolBarComboBox: TcxComboBox;
    BackGroundPopupMenu: TPopupMenu;
    mnuAutoArrange: TMenuItem;
    TimePanel: TAdvPanel;
    TimeGrid: TcxGrid;
    TimeGridBandedTableView: TcxGridBandedTableView;
    TimeGridBandedTableViewTimeZome: TcxGridBandedColumn;
    imeGridBandedTableViewYSaleAmt: TcxGridBandedColumn;
    imeGridBandedTableViewYCustomerCnt: TcxGridBandedColumn;
    TimeGridBandedTableViewSaleAmt: TcxGridBandedColumn;
    TimeGridBandedTableViewCustomerCnt: TcxGridBandedColumn;
    imeGridBandedTableViewCustomerAmt: TcxGridBandedColumn;
    TimeGridLevel: TcxGridLevel;
    PayChartPanel: TAdvPanel;
    ClassPanel: TAdvPanel;
    PricePanel: TAdvPanel;
    ClassGrid: TcxGrid;
    ClassGridBandedTableView: TcxGridBandedTableView;
    ClassGridBandedTableViewClass: TcxGridBandedColumn;
    ClassGridBandedTableViewClassName: TcxGridBandedColumn;
    ClassGridBandedTableViewSaleAmt: TcxGridBandedColumn;
    ClassGridBandedTableViewRate: TcxGridBandedColumn;
    ClassGridLevel: TcxGridLevel;
    MoneyGrid: TcxGrid;
    MoneyGridBandedTableView: TcxGridBandedTableView;
    MoneyGridBandedTableViewMoenyZone: TcxGridBandedColumn;
    MoneyGridBandedTableViewCustomerCnt: TcxGridBandedColumn;
    MoneyGridLevel: TcxGridLevel;
    SummeryPanel: TAdvPanel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewType: TcxGridColumn;
    GridTableViewYmdSale: TcxGridColumn;
    GridTableViewTotalAmt: TcxGridColumn;
    GridTableViewDCAmt: TcxGridColumn;
    GridTableViewVatAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCustomerQty: TcxGridColumn;
    GridTableViewCustomerAmt: TcxGridColumn;
    GridLevel: TcxGridLevel;
    N1: TMenuItem;
    mnuVisibleSummery: TMenuItem;
    mnuVisibleClass: TMenuItem;
    mnuVisiblePrice: TMenuItem;
    mnuVisibleTime: TMenuItem;
    mnuVisiblePayChart: TMenuItem;
    TimeChartPanel: TAdvPanel;
    mnuVisibleTimeChart: TMenuItem;
    GridTableViewDutySaleAmt: TcxGridColumn;
    GridTableViewDutyFreeSaleAmt: TcxGridColumn;
    SummeryChartPanel: TPanel;
    GridTableViewDeliveryCount: TcxGridColumn;
    GridTableViewDeliveryAmt: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    mnuVisibleStore: TMenuItem;
    GridTableViewColumn1: TcxGridColumn;
    mnuVisibleMenu: TMenuItem;
    MenuPanel: TAdvPanel;
    MenuGrid: TcxGrid;
    MenuGridTableView: TcxGridTableView;
    cxGridColumn5: TcxGridColumn;
    cxGridColumn6: TcxGridColumn;
    cxGridColumn7: TcxGridColumn;
    MenuGridLevel: TcxGridLevel;
    StorePanel: TAdvPanel;
    StoreGrid: TcxGrid;
    StoreGridTableView: TcxGridTableView;
    StoreGridTableStoreName: TcxGridColumn;
    StoreGridTableRate: TcxGridColumn;
    StoreGridTableSaleAmt: TcxGridColumn;
    StoreGridLevel: TcxGridLevel;
    StoreChartPanel: TAdvPanel;
    StoreGridTableViewAvgAmt: TcxGridColumn;
    mnuVisibleStoreChart: TMenuItem;
    GridTableViewStoreCount: TcxGridColumn;
    GridTableViewAvgAmt: TcxGridColumn;
    LocalChartPanel: TAdvPanel;
    SaleZoneChartPanel: TAdvPanel;
    mnuVisibleLocalChart: TMenuItem;
    mnuVisibleSaleZoneChart: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RefreshTimerTimer(Sender: TObject);
    procedure RefreshToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure TimeGridBandedTableViewBands1HeaderClick(Sender: TObject);
    procedure ClassGridBandedTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure CompanyGridBandedTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure mnuAutoArrangeClick(Sender: TObject);
    procedure PayChartDblClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BackGroundPopupMenuPopup(Sender: TObject);
    procedure mnuVisibleSummeryClick(Sender: TObject);
    procedure mnuVisibleClassClick(Sender: TObject);
    procedure PosGridBandedTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TimeGridBandedTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TeamGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure SaleCompanyGridBandedTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure SummeryPanelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SummeryChartPanelResize(Sender: TObject);
    procedure PayChartPanelResize(Sender: TObject);
    procedure TimeChartPanelResize(Sender: TObject);
    procedure StoreChartPanelResize(Sender: TObject);
    procedure ConditionToolBarToDateEditPropertiesChange(Sender: TObject);
    procedure LocalChartPanelResize(Sender: TObject);
    procedure SaleZoneChartPanelResize(Sender: TObject);

  private
    SummeryChart,
    PayChart,
    TimeChart,
    StoreChart,
    LocalChart,
    SaleZoneChart  : TWebBrowser;
  protected
    function DoSearch: Boolean; override;
  end;

var
  HeadSaleQuickShowForm: THeadSaleQuickShowForm;



implementation

uses
  Common, DBModule, Main;

const
  iniDateCondition = 'DateCondition';

{$R *.dfm}

procedure THeadSaleQuickShowForm.FormCreate(Sender: TObject);
var
  vCodeData: PIntPointer;
begin
  inherited;

  //속보 패널 위치이동 및 리사이즈 가능하도록 처리
  Self.KeyPreview := TRUE;

  // 자동갱신 간격 조건 콤보박스 초기화
  New(vCodeData); vCodeData^.Data := 0;
  RefreshToolBarComboBox.Properties.Items.AddObject('없음',  TObject(vCodeData));
  New(vCodeData); vCodeData^.Data := 60;
  RefreshToolBarComboBox.Properties.Items.AddObject('1분 간격',  TObject(vCodeData));
  New(vCodeData); vCodeData^.Data := 300;
  RefreshToolBarComboBox.Properties.Items.AddObject('5분 간격',  TObject(vCodeData));
  New(vCodeData); vCodeData^.Data := 600;
  RefreshToolBarComboBox.Properties.Items.AddObject('10분 간격',  TObject(vCodeData));

  SummeryPanel.LoadPosition;
  ClassPanel.LoadPosition;
  PricePanel.LoadPosition;
  TimePanel.LoadPosition;
  MenuPanel.LoadPosition;
  PayChartPanel.LoadPosition;
  TimeChartPanel.LoadPosition;
  StorePanel.LoadPosition;
  StoreChartPanel.LoadPosition;
  LocalChartPanel.LoadPosition;
  SaleZoneChartPanel.LoadPosition;

  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      try
        RefreshToolBarComboBox.ItemIndex := ReadInteger('본부매출속보', '자동갱신간격', 0);
        RefreshTimer.Enabled        := RefreshToolBarComboBox.ItemIndex <> 0;
        SummeryPanel.Visible        := ReadBool('본부매출속보', SummeryPanel.Name,       True);
        ClassPanel.Visible          := ReadBool('본부매출속보', ClassPanel.Name,         True);
        PricePanel.Visible          := ReadBool('본부매출속보', PricePanel.Name,         True);
        TimePanel.Visible           := ReadBool('본부매출속보', TimePanel.Name,          True);
        PayChartPanel.Visible       := ReadBool('본부매출속보', PayChartPanel.Name,      True);
        TimeChartPanel.Visible      := ReadBool('본부매출속보', TimeChartPanel.Name,     True);
        MenuPanel.Visible           := ReadBool('본부매출속보', MenuPanel.Name,          True);
        StorePanel.Visible          := ReadBool('본부매출속보', StorePanel.Name,         True);
        StoreChartPanel.Visible     := ReadBool('본부매출속보', StoreChartPanel.Name, True);
        LocalChartPanel.Visible     := ReadBool('본부매출속보', LocalChartPanel.Name, True);
        SaleZoneChartPanel.Visible  := ReadBool('본부매출속보', SaleZoneChartPanel.Name, True);
      except
      end;
    finally
      Free;
    end;

  SummeryChart  := TWebBrowser.Create(Self);
  TWinControl(SummeryChart).Parent := SummeryChartPanel;
  SummeryChart.Align := alClient;

  PayChart      := TWebBrowser.Create(Self);
  TWinControl(PayChart).Parent := PayChartPanel;
  PayChart.Align := alClient;

  TimeChart     := TWebBrowser.Create(Self);
  TWinControl(TimeChart).Parent := TimeChartPanel;
  TimeChart.Align := alClient;

  StoreChart     := TWebBrowser.Create(Self);
  TWinControl(StoreChart).Parent := StoreChartPanel;
  StoreChart.Align := alClient;

  LocalChart     := TWebBrowser.Create(Self);
  TWinControl(LocalChart).Parent := LocalChartPanel;
  LocalChart.Align := alClient;

  SaleZoneChart     := TWebBrowser.Create(Self);
  TWinControl(SaleZoneChart).Parent := SaleZoneChartPanel;
  SaleZoneChart.Align := alClient;
end;


procedure THeadSaleQuickShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  SummeryChart.Free;
  PayChart.Free;
  TimeChart.Free;
end;

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure THeadSaleQuickShowForm.FormShow(Sender: TObject);
begin
  inherited;
  // 조회 날짜 조건을 불러온다
  ConditionToolBarFromDateEdit.Date       := ConditionToolBarToDateEdit.CurrentDate-1;

//  ButtonToolBarSearchButton.Click;
end;

procedure THeadSaleQuickShowForm.mnuAutoArrangeClick(Sender: TObject);
begin
  inherited;
  SummeryPanel.Left   := 0  ;
  SummeryPanel.Top    := 38 ;
  SummeryPanel.Width  := Self.Width-20;
  SummeryPanel.Height := 108;
  StoreChartPanel.Left := 0;
  StoreChartPanel.Top  := 147;
  StoreChartPanel.Width := Self.Width-20;
  StoreChartPanel.Height := 150;
  TimeChartPanel.Left := 0;
  TimeChartPanel.Top  := 298;
  TimeChartPanel.Width := Self.Width div 2-10;
  TimeChartPanel.Height := 150;
  MenuPanel.Left := TimeChartPanel.Width + 1;
  MenuPanel.Top  := 298;
  MenuPanel.Width := Self.Width div 2 - 10;
  MenuPanel.Height := 300;
  ClassPanel.Left     := 0;
  ClassPanel.Top      := 448;
  ClassPanel.Width    := Self.Width div 2-10;
  ClassPanel.Height   := 150;
  PricePanel.Left     := 812;
  PricePanel.Top      := 152;
  PricePanel.Width    := 170;
  PricePanel.Height   := 178;
  TimePanel.Left      := 0  ;
  TimePanel.Top       := 436;
  TimePanel.Width     := 424;
  TimePanel.Height    := 218;
  PayChartPanel.Left   := 812;
  PayChartPanel.Top    := 336;
  PayChartPanel.Width  := 170;
  PayChartPanel.Height := 218;
  TimeChartPanel.Left    := 0  ;
  TimeChartPanel.Top     := 336;
  TimeChartPanel.Width   := 424;
  TimeChartPanel.Height  := 218;
  SummeryPanel.Visible   := True;
  ClassPanel.Visible     := true;
  PricePanel.Visible     := false;
  TimePanel.Visible      := false;
  StorePanel.Visible     := false;
  PayChartPanel.Visible  := false;
  TimeChartPanel.Visible := true;
  StoreChartPanel.Visible := true;
end;

procedure THeadSaleQuickShowForm.mnuVisibleClassClick(Sender: TObject);
begin
  ClassPanel.Visible := Not ClassPanel.Visible;
end;

procedure THeadSaleQuickShowForm.mnuVisibleSummeryClick(Sender: TObject);
var vAdvPanel :TAdvPanel;
begin
  inherited;
  vAdvPanel := TAdvPanel(FindComponent(Format('%s',[(Sender as TMenuItem).Hint])));
  vAdvPanel.Visible := Not vAdvPanel.Visible;
  vAdvPanel.BringToFront;
end;

procedure THeadSaleQuickShowForm.RefreshTimerTimer(Sender: TObject);
begin
  inherited;
  if Self.Active then DoSearch;
end;

procedure THeadSaleQuickShowForm.RefreshToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;

  RefreshTimer.Interval := PIntPointer(RefreshToolBarComboBox.Properties.Items.Objects[RefreshToolBarComboBox.ItemIndex]).Data * 1000;
  RefreshTimer.Enabled  := RefreshToolBarComboBox.ItemIndex <> 0;
end;

procedure THeadSaleQuickShowForm.SaleCompanyGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //매출처별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  FormParam[2] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 1];
  ExtremeMainForm.RunProgram('CompanyGoodsSaleShow');
end;

procedure THeadSaleQuickShowForm.SaleZoneChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(SaleZoneChart) and (SaleZoneChart.Hint <> '') then
    ShowChart(SaleZoneChart, 'SaleZoneChart', 'column3d', SaleZoneChart.Hint);
end;

procedure THeadSaleQuickShowForm.SummeryChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(SummeryChart) and (SummeryChart.Hint <> '') then
    ShowChart(SummeryChart, 'SummeryChart', 'column3d', SummeryChart.Hint);
end;

procedure THeadSaleQuickShowForm.SummeryPanelClick(Sender: TObject);
begin
  inherited;
  (Sender as TAdvPanel).BringToFront;
end;

procedure THeadSaleQuickShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //영업일보 실행
  if FormParam[0]<>'00000000' then
  begin
    FormParam[0] := Sender.DataController.Values[0, 1];
    ExtremeMainForm.RunProgram('CloseReportShow');
  end;
end;

procedure THeadSaleQuickShowForm.LocalChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(LocalChart) and (LocalChart.Hint <> '') then
    ShowChart(LocalChart, 'LocalChart', 'column3d', LocalChart.Hint);
end;

procedure THeadSaleQuickShowForm.TeamGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //상품분류별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('SaleTeamSaleShow');
end;

procedure THeadSaleQuickShowForm.TimeChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(TimeChart) and (TimeChart.Hint <> '') then
    ShowChart(TimeChart, 'TimeChart', 'column3d', TimeChart.Hint);
end;

procedure THeadSaleQuickShowForm.TimeGridBandedTableViewBands1HeaderClick(
  Sender: TObject);
begin
  inherited;
  //시간대별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate-1);
  ExtremeMainForm.RunProgram('SaleTimeSaleShow');
end;

procedure THeadSaleQuickShowForm.TimeGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //시간대별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate);
  ExtremeMainForm.RunProgram('SaleTimeSaleShow');
end;

procedure THeadSaleQuickShowForm.BackGroundPopupMenuPopup(Sender: TObject);
begin
  inherited;
  mnuVisibleSummery.Checked     := SummeryPanel.Visible;
  mnuVisibleClass.Checked       := ClassPanel.Visible;
  mnuVisiblePrice.Checked       := PricePanel.Visible;
  mnuVisibleTime.Checked        := TimePanel.Visible;
  mnuVisibleMenu.Checked        := MenuPanel.Visible;
  mnuVisiblePayChart.Checked    := PayChartPanel.Visible;
  mnuVisibleTimeChart.Checked   := TimeChartPanel.Visible;
  mnuVisibleStore.Checked       := StorePanel.Visible;
  mnuVisibleStoreChart.Checked  := StoreChartPanel.Visible;
  mnuVisibleLocalChart.Checked  := LocalChartPanel.Visible;
  mnuVisibleSaleZoneChart.Checked  := SaleZoneChartPanel.Visible;
end;

procedure THeadSaleQuickShowForm.ClassGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //상품분류별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('AnalysisClassSaleShow');
end;

procedure THeadSaleQuickShowForm.CompanyGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //매입처별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('SaleCompanySaleShow');
end;

procedure THeadSaleQuickShowForm.StoreChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(StoreChart) and (StoreChart.Hint <> '') then
    ShowChart(StoreChart, 'StoreChart', 'column3d', StoreChart.Hint);
end;

procedure THeadSaleQuickShowForm.PayChartDblClick(Sender: TObject);
begin
  inherited;
  //결제수단별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate);
  ExtremeMainForm.RunProgram('SalePayShow');
end;


procedure THeadSaleQuickShowForm.PayChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(PayChart) and (PayChart.Hint <> '') then
    ShowChart(PayChart, 'PayChart', 'pie3d', PayChart.Hint);
end;

procedure THeadSaleQuickShowForm.PosGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //포스별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.CurrentDate);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('SaleReceiptShow');
end;

procedure THeadSaleQuickShowForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SummeryPanel.SavePosition;
  ClassPanel.SavePosition;
  PricePanel.SavePosition;
  TimePanel.SavePosition;
  MenuPanel.SavePosition;
  PayChartPanel.SavePosition;
  TimeChartPanel.SavePosition;
  StorePanel.SavePosition;
  StoreChartPanel.SavePosition;
  LocalChartPanel.SavePosition;
  SaleZoneChartPanel.SavePosition;
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      try
        WriteInteger('본부매출속보', '자동갱신간격', RefreshToolBarComboBox.ItemIndex);
        WriteBool('본부매출속보', SummeryPanel.Name,       SummeryPanel.Visible);
        WriteBool('본부매출속보', ClassPanel.Name,         ClassPanel.Visible);
        WriteBool('본부매출속보', PricePanel.Name,         PricePanel.Visible);
        WriteBool('본부매출속보', TimePanel.Name,          TimePanel.Visible);
        WriteBool('본부매출속보', PayChartPanel.Name,      PayChartPanel.Visible);
        WriteBool('본부매출속보', TimeChartPanel.Name,     TimeChartPanel.Visible);
        WriteBool('본부매출속보', MenuPanel.Name,          MenuPanel.Visible);
        WriteBool('본부매출속보', StorePanel.Name,         StorePanel.Visible);
        WriteBool('본부매출속보', StoreChartPanel.Name,    StoreChartPanel.Visible);
        WriteBool('본부매출속보', LocalChartPanel.Name,    LocalChartPanel.Visible);
        WriteBool('본부매출속보', SaleZoneChartPanel.Name,    SaleZoneChartPanel.Visible);
      except
      end;
    finally
      Free;
    end;
end;


procedure THeadSaleQuickShowForm.FormResize(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure THeadSaleQuickShowForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

procedure THeadSaleQuickShowForm.ConditionToolBarToDateEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if ConditionToolBarToDateEdit.CurrentDate <= ConditionToolBarFromDateEdit.CurrentDate then
    ConditionToolBarFromDateEdit.Date := IncDay(ConditionToolBarToDateEdit.CurrentDate,-1);
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function THeadSaleQuickShowForm.DoSearch: Boolean;
var
 vCaption  : String;
 vChartXml : String;
 vIndex, vTemp : Integer;
 vAvgAmt :Currency;
begin
  // 매출 요약
  if (SummeryPanel.Visible) then
  begin
    OpenQuery('select   GUBUN, '
             +'         YMD_SALE, '
             +'         STORE_COUNT, '
             +'         AMT_AVG, '
             +'         AMT_TOT, '
             +'         DC_TOT, '
             +'         AMT_SERVICE, '
             +'         AMT_DUTY, '
             +'         AMT_TAX, '
             +'         AMT_SALE, '
             +'         AMT_SALE_DUTY, '
             +'         AMT_SALE_DUTYFREE, '
             +'         AMT_SALE_EVENT, '
             +'         QTY_CUST, '
             +'         AMT_CUST, '
             +'         AMT_SALE - AMT_BUY as AMT_PROFIT, '
             +'         RATE_PROFIT, '
             +'         CNT_DELIVERY, '
             +'         AMT_DELIVERY, '
             +'         Round(AMT_DELIVERY / case when AMT_SALE = 0 then 1 else AMT_SALE end * 100, 2) as RATE_DELIVERY '
             +'from    (select   h.YMD_SALE, '
             +'                  case h.YMD_SALE when :P1 then 1        when :P2 then 2        when :P3 then 3        when :P4 then 4        when :P5 then 5        end as SEQ, '
             +'                  case h.YMD_SALE when :P1 then ''당일'' when :P2 then ''전일'' when :P3 then ''전주'' when :P4 then ''전월'' when :P5 then ''전년'' end as GUBUN, '
             +'                  Count(h.CD_STORE) as STORE_COUNT, '
             +'                  Avg(h.AMT_SALE) as AMT_AVG, '
             +'                  Sum(h.AMT_SALE + h.DC_TOT + h.AMT_SERVICE)  as AMT_TOT, '
             +'                  Sum(h.DC_TOT)                    as DC_TOT, '
             +'                  Sum(h.AMT_SERVICE)               as AMT_SERVICE, '
             +'                  Sum(h.AMT_DUTY + h.AMT_DUTYFREE) as AMT_DUTY, '
             +'                  Sum(h.AMT_TAX)                   as AMT_TAX, '
             +'                  Sum(h.AMT_SALE)                  as AMT_SALE, '
             +'                  Sum(h.AMT_DUTY + h.AMT_TAX)      as AMT_SALE_DUTY, '
             +'                  Sum(h.AMT_DUTYFREE)              as AMT_SALE_DUTYFREE, '
             +'                  Sum(h.AMT_EVENT)            as AMT_SALE_EVENT, '
             +'                  Sum(h.CNT_DELIVERY) as CNT_DELIVERY, '
             +'                  Sum(h.AMT_DELIVERY) as AMT_DELIVERY, '
             +'                  Sum(h.CNT_CUSTOMER) as QTY_CUST, '
             +'                  case when Sum(h.CNT_CUSTOMER) = 0 then Sum(h.AMT_SALE) else Round(Sum(h.AMT_SALE) / Sum(h.CNT_CUSTOMER), 0) end as AMT_CUST, '
             +'                  Sum(h.AMT_BUY) as AMT_BUY, '
             +'                  GetProfitRate(Sum(h.AMT_BUY), Sum(h.AMT_SALE)) as RATE_PROFIT '
             +'          from    SL_SALE_H_SUM as h '
             +'         where    h.CD_HEAD  =:P0 '
             +'           and    h.YMD_SALE in (:P1, :P2, :P3, :P4, :P5) '
             +'         group by h.YMD_SALE '
             +'         union all '
             +'         select   ''00000000'' as YMD_SALE, '
             +'                  6            as SEQ, '
             +'                  ''월계''     as GUBUN, '
             +'                  Count(h.CD_STORE) as STORE_COUNT, '
             +'                  Avg(h.AMT_SALE) as AMT_AVG, '
             +'                  Sum(h.AMT_SALE + h.DC_TOT + h.AMT_SERVICE) as AMT_TOT, '
             +'                  Sum(h.DC_TOT)                    as DC_TOT, '
             +'                  Sum(h.AMT_SERVICE)               as AMT_SERVICE, '
             +'                  Sum(h.AMT_DUTY + h.AMT_DUTYFREE) as AMT_DUTY, '
             +'                  Sum(h.AMT_TAX)                   as AMT_TAX, '
             +'                  Sum(h.AMT_SALE)                  as AMT_SALE, '
             +'                  Sum(h.AMT_DUTY + h.AMT_TAX)      as AMT_SALE_DUTY, '
             +'                  Sum(h.AMT_DUTYFREE)              as AMT_SALE_DUTYFREE, '
             +'                  Sum(h.AMT_EVENT)                 as AMT_SALE_EVENT, '
             +'                  Sum(h.CNT_DELIVERY) as CNT_DELIVERY, '
             +'                  Sum(h.AMT_DELIVERY) as AMT_DELIVERY, '
             +'                  Sum(h.CNT_CUSTOMER) as QTY_CUST, '
             +'                  case when Sum(h.CNT_CUSTOMER) = 0 then Sum(h.AMT_SALE) else Round(Sum(h.AMT_SALE) / Sum(h.CNT_CUSTOMER), 0) end as AMT_CUST, '
             +'                  Sum(h.AMT_BUY) as AMT_BUY, '
             +'                  GetProfitRate(Sum(h.AMT_BUY), Sum(h.AMT_SALE)) as RATE_PROFIT '
             +'          from    SL_SALE_H_SUM as h '
             +'         where    h.CD_HEAD  =:P0 '
             +'           and    h.YMD_SALE between ConCat(Left(:P1, 6),''01'') and :P1 '
             +'         ) as k '
             +'order by SEQ',
              [HeadStoreCode,
               DtoS(ConditionToolBarToDateEdit.CurrentDate),
               DtoS(ConditionToolBarToDateEdit.CurrentDate-1),
               DtoS(IncWeek(ConditionToolBarToDateEdit.CurrentDate, -1)),
               DtoS(IncMonth(ConditionToolBarToDateEdit.CurrentDate,-1)),
               DtoS(IncYear(ConditionToolBarToDateEdit.CurrentDate, -1))]);
    DM.ReadQuery(Query, GridTableView);
    // 챠트로 표시
    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
    for vIndex := GridTableView.DataController.RecordCount - 2 downto 0 do
    begin
      vChartXml := vChartXml + '<set label="'+GridTableView.DataController.Values[vIndex,0]+'" value="'+FloatToStr(GridTableView.DataController.Values[vIndex,GridTableViewSaleAmt.Index])+'" />'
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(SummeryChart, 'SummeryChart', 'column3d', vChartXml);
  end;

  if StorePanel.Visible or StoreChartPanel.Visible then
  begin
    OpenQuery('select  a.CD_STORE, '
             +'        a.NM_STORE_SHORT as NM_STORE, '
             +'        Ifnull(b.AMT_SALE,0)    as AMT_SALE, '
             +'        DivFlt(Ifnull(b.AMT_SALE,0), Ifnull(c.AMT_AVG,0)) * 100 as RATE, '
             +'        Ifnull(c.AMT_AVG,0) as AMT_AVG '
             +'  from  MS_STORE as a inner join '
             +'       (select CD_STORE, '
             +'               AMT_SALE '
             +'          from SL_SALE_H_SUM  '
             +'         where CD_HEAD  = :P0 '
             +'           and YMD_SALE = :P1 ) as b on b.CD_STORE = a.CD_STORE, '
             +'       (select Avg(AMT_SALE) as AMT_AVG '
             +'          from SL_SALE_H_SUM  '
             +'         where CD_HEAD  =:P0 '
             +'           and YMD_SALE =:P1) as c '
             +' where a.CD_HEAD =:P0 '
             +'   and a.YN_USE  =''Y'' '
             +' order by a.CD_STORE ',
            [HeadStoreCode,
             DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
    Result := DM.ReadQuery(Query, StoreGridTableView);

    if Result then
      vAvgAmt := StoreGridTableView.DataController.Values[0, StoreGridTableViewAvgAmt.Index];

    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    vChartXml := vChartXml + Format('<trendlines> '
                                   +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="평균:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
    for vIndex := 0 to StoreGridTableView.DataController.RecordCount-1 do
    begin
      vChartXml := vChartXml + '<set label="'+StoreGridTableView.DataController.Values[vIndex,StoreGridTableStoreName.Index]+'" value="'+FloatToStr(StoreGridTableView.DataController.Values[vIndex,StoreGridTableSaleAmt.Index])+'" />';
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(StoreChart, 'StoreChart', 'column3d', vChartXml);
  end;

  //지역별 매출
  if LocalChartPanel.Visible then
  begin
    OpenQuery('select  Ifnull(t1.NM_CODE1,''미지정'') as NM_LOCAL, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE, '
             +'        Ifnull(t2.AMT_AVG,0) as AMT_AVG '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_LOCAL, '
             +'                Sum(a.AMT_SALE) as AMT_SALE, '
             +'                Avg(a.AMT_SALE) as AMT_AVG '
             +'           from SL_SALE_H_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD  = a.CD_HEAD '
             +'                                  and b.CD_STORE = a.CD_STORE '
             +'          where a.CD_HEAD  =:P0 '
             +'            and a.YMD_SALE =:P1 '
             +'            and b.YN_USE   =''Y'' '
             +'          group by b.CD_LOCAL '
             +'        ) as t2 on t2.CD_LOCAL = t1.CD_CODE '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P2 '
             +'   and  t1.CD_KIND  =''01'' ',
            [HeadStoreCode,
             DtoS(ConditionToolBarToDateEdit.CurrentDate),
             StandardStore]);
    if not Query.Eof then
      vAvgAmt := Query.FieldByName('AMT_AVG').AsCurrency;

    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    vChartXml := vChartXml + Format('<trendlines> '
                                   +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="평균:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
    if not Query.Eof then
      Query.First;
    while not Query.Eof do
    begin
      vChartXml := vChartXml + '<set label="'+Query.FieldByName('NM_LOCAL').AsString+'" value="'+FloatToStr(Query.FieldByName('AMT_SALE').AsCurrency)+'" />';
      Query.Next;
    end;
    Query.Close;
    vChartXml := vChartXml + '</chart>';
    ShowChart(LocalChart, 'LocalChart', 'column3d', vChartXml);
  end;

  //상권별 매출
  if SaleZoneChartPanel.Visible then
  begin
    OpenQuery('select  Ifnull(t1.NM_CODE1,''미지정'') as NM_SALEZONE, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE, '
             +'        Ifnull(t2.AMT_AVG,0) as AMT_AVG '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_SALEZONE, '
             +'                Sum(a.AMT_SALE) as AMT_SALE, '
             +'                Avg(a.AMT_SALE) as AMT_AVG '
             +'           from SL_SALE_H_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +'          where a.CD_HEAD  =:P0 '
             +'            and a.YMD_SALE =:P1 '
             +'            and b.YN_USE   =''Y'' '
             +'          group by b.CD_SALEZONE '
             +'        ) as t2 on t2.CD_SALEZONE = t1.CD_CODE '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P2 '
             +'   and  t1.CD_KIND  =''03'' ',
            [HeadStoreCode,
             DtoS(ConditionToolBarToDateEdit.CurrentDate),
             StandardStore]);
    if not Query.Eof then
      vAvgAmt := Query.FieldByName('AMT_AVG').AsCurrency;

    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    vChartXml := vChartXml + Format('<trendlines> '
                                   +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="평균:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
    if not Query.Eof then
      Query.First;
    while not Query.Eof do
    begin
      vChartXml := vChartXml + '<set label="'+Query.FieldByName('NM_SALEZONE').AsString+'" value="'+FloatToStr(Query.FieldByName('AMT_SALE').AsCurrency)+'" />';
      Query.Next;
    end;
    Query.Close;
    vChartXml := vChartXml + '</chart>';
    ShowChart(SaleZoneChart, 'SaleZoneChart', 'column3d', vChartXml);
  end;


  //메뉴별 매출
  if MenuPanel.Visible then
  begin
     OpenQuery('select a.CD_MENU, '
              +'	     Max(b.NM_MENU) as NM_MENU, '
              +'       GetQty(b.DS_MENU_TYPE, SUM(a.QTY_SALE) ) as QTY_SALE, '
              +'       SUM(a.AMT_SALE-a.DC_TOT) AS AMT_SALE '
              +'  from SL_SALE_D_SUM a inner join '
              +'       MS_MENU       b on b.CD_HEAD  = a.CD_HEAD '
              +'                      and b.CD_STORE = :P1 '
              +'                      and a.CD_MENU  = b.CD_MENU '
              +' where a.CD_HEAD  = :P0 '
              +'   and a.YMD_SALE = :P2 '
              +' group by a.CD_MENU, b.DS_MENU_TYPE '
              +' order by 4 desc '
              +' limit 20 ',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
    DM.ReadQuery(Query, MenuGridTableView);
  end;

  // 상품 분류별 매출
  if (ClassPanel.Visible) then
  begin
    OpenQuery('select   a.CD_CLASS, '
             +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
             +'         a.AMT_SALE, '
             +'         a.RATE_PROFIT, '
             +'         case when b.AMT_TOTAL = 0 then 0 else DivFlt(a.AMT_SALE,b.AMT_TOTAL) * 100 end as RATE '
             +'from    (select Left(IfNull(g.CD_CLASS,''''),2) as CD_CLASS, '
             +'                Max(c.NM_CLASS)    as NM_CLASS, '
             +'                Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'                GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
             +'           from SL_SALE_D_SUM  as d  inner join '
             +'                MS_MENU        as g  on d.CD_HEAD  = g.CD_HEAD '
             +'                                    and g.CD_STORE =:P1 '
             +'                                    and d.CD_MENU  = g.CD_MENU left outer join '
             +'                MS_MENU_CLASS  as c  on c.CD_HEAD  = g.CD_HEAD '
             +'                                    and c.CD_STORE =:P1 '
             +'                                    and Left(g.CD_CLASS,2) = c.CD_CLASS '
             +'                                    and c.CD_CLASS <> '''' '
             +'          where d.CD_HEAD  = :P0 '
             +'            and d.YMD_SALE = :P2 '
             +'          group by Left(Ifnull(g.CD_CLASS,''''),2)) as a, '
             +'        (select Sum(AMT_SALE) as AMT_TOTAL '
             +'           from SL_SALE_H_SUM  '
             +'          where CD_HEAD  = :P0 '
             +'            and YMD_SALE = :P2 ) as b '
             +'order by a.CD_CLASS',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
    DM.ReadQuery(Query, ClassGridBandedTableView);
  end;


  // 금액대별 매출
  if (PricePanel.Visible) then
  begin
    OpenQuery('select   Max(a.MONEY_ZONE) as MONEY_ZONE, '
             +'         Count(b.CD_MONEY) as CNT_CUST '
             +'from    (select   0 as CD_MONEY, '' 1천원 이하'' as MONEY_ZONE union all '
             +'         select   1 as CD_MONEY, '' 5천원 이하'' as MONEY_ZONE union all '
             +'         select   2 as CD_MONEY, '' 1만원 이하'' as MONEY_ZONE union all '
             +'         select   3 as CD_MONEY, '' 2만원 이하'' as MONEY_ZONE union all '
             +'         select   4 as CD_MONEY, '' 3만원 이하'' as MONEY_ZONE union all '
             +'         select   5 as CD_MONEY, '' 5만원 이하'' as MONEY_ZONE union all '
             +'         select   6 as CD_MONEY, ''10만원 이하'' as MONEY_ZONE union all '
             +'         select   7 as CD_MONEY, ''20만원 이하'' as MONEY_ZONE union all '
             +'         select   8 as CD_MONEY, ''30만원 이하'' as MONEY_ZONE union all '
             +'         select   9 as CD_MONEY, ''30만원 초과'' as MONEY_ZONE) as a left outer join '
             +'        (select   case when Abs(AMT_SALE) <= 1000                   then 0 '
             +'                       when Abs(AMT_SALE) between   1001 and   5000 then 1 '
             +'                       when Abs(AMT_SALE) between   5001 and  10000 then 2 '
             +'                       when Abs(AMT_SALE) between  10001 and  20000 then 3 '
             +'                       when Abs(AMT_SALE) between  20001 and  30000 then 4 '
             +'                       when Abs(AMT_SALE) between  30001 and  50000 then 5 '
             +'                       when Abs(AMT_SALE) between  50001 and 100000 then 6 '
             +'                       when Abs(AMT_SALE) between 100001 and 200000 then 7 '
             +'                       when Abs(AMT_SALE) between 200001 and 300000 then 8 '
             +'                       when Abs(AMT_SALE) > 300000                  then 9 end as CD_MONEY '
             +'           from '+GetPartitionTable('SL_SALE_H', ConditionToolBarToDateEdit.CurrentDate, '')
             +'          where   CD_HEAD =  :P0 '
             +'            and   YMD_SALE = :P1 '
             +'            and   DS_SALE  <> ''V'' ) as b on a.CD_MONEY = b.CD_MONEY '
             +'group by a.CD_MONEY '
             +'order by a.CD_MONEY ',
              [HeadStoreCode,
               DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
    DM.ReadQuery(Query, MoneyGridBandedTableView);
  end;

  //결제수단별 매출
  if (PayChartPanel.Visible) then
  begin
    OpenQuery('select   Sum(case when AMT_CASH    = 0 then 0 else 1 end) as QTY_CASH, '
             +'         Sum(AMT_CASH)    as AMT_CASH, '
             +'         (select count(YMD_SALE) from SL_CASH where CD_HEAD = a.CD_HEAD and CD_STORE = a.CD_STORE and YMD_SALE = a.YMD_SALE ) as QTY_CASHRCP, '
             +'         Sum(AMT_CASHRCP) as AMT_CASHRCP, '
             +'         (select count(YMD_SALE) from SL_CARD where CD_HEAD = a.CD_HEAD and CD_STORE = a.CD_STORE and YMD_SALE = a.YMD_SALE ) as QTY_CARD, '
             +'         Sum(AMT_CARD)    as AMT_CARD, '
             +'         Sum(case when AMT_CHECK   = 0 then 0 else 1 end) as QTY_CHECK, '
             +'         Sum(AMT_CHECK)   as AMT_CHECK, '
             +'         Sum(case when AMT_TRUST   = 0 then 0 else 1 end) as QTY_TRUST, '
             +'         Sum(AMT_TRUST)   as AMT_TRUST, '
             +'         Sum(case when AMT_GIFT    = 0 then 0 else 1 end) as QTY_GIFT, '
             +'         Sum(AMT_GIFT)    as AMT_GIFT, '
             +'         Sum(case when AMT_BANK     = 0 then 0 else 1 end) as QTY_BANK, '
             +'         Sum(AMT_BANK)     as AMT_BANK, '
             +'         Sum(case when AMT_POINT    = 0 then 0 else 1 end) as QTY_POINT, '
             +'         Sum(AMT_POINT)     as AMT_POINT, '
             +'         Sum(case when AMT_LETSORDER    = 0 then 0 else 1 end) as QTY_LETSORDER, '
             +'         Sum(AMT_LETSORDER)     as AMT_LETSORDER '
             +'  from '+GetPartitionTable('SL_SALE_H', ConditionToolBarToDateEdit.CurrentDate, 'a')
             +' where   CD_HEAD  = :P0 '
             +'   and   YMD_SALE = :P1 '
             +'   and   DS_SALE  <> ''V'' '
             +' group by YMD_SALE ',
              [HeadStoreCode,
               DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
    try
      vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

      if Not Query.Eof then
      begin
        if Query.FieldByName('AMT_CASH').AsCurrency > 0 then
        begin
          vCaption := '현금' + '('+Query.FieldByName('QTY_CASH').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_CASH').asString+'" />';
        end;
        if Query.FieldByName('AMT_CASHRCP').AsCurrency > 0 then
        begin
          vCaption := '[현금영수증]' + '('+Query.FieldByName('QTY_CASHRCP').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_CASHRCP').asString+'" />';
        end;
        if Query.FieldByName('AMT_CARD').AsCurrency > 0 then
        begin
          vCaption := '카드' + '('+Query.FieldByName('QTY_CARD').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_CARD').asString+'" />';
        end;
        if Query.FieldByName('AMT_CHECK').AsCurrency > 0 then
        begin
          vCaption := '수표' + '('+Query.FieldByName('QTY_CHECK').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_CHECK').asString+'" />';
        end;
        if Query.FieldByName('AMT_TRUST').AsCurrency > 0 then
        begin
          vCaption := '외상' + '('+Query.FieldByName('QTY_TRUST').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_TRUST').asString+'" />';
        end;
        if Query.FieldByName('AMT_GIFT').AsCurrency > 0 then
        begin
          vCaption := '상품권' + '('+Query.FieldByName('QTY_GIFT').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_GIFT').asString+'" />';
        end;
        if Query.FieldByName('AMT_BANK').AsCurrency > 0 then
        begin
          vCaption := '계좌입금' + '('+Query.FieldByName('QTY_BANK').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_BANK').asString+'" />';
        end;
        if Query.FieldByName('AMT_POINT').AsCurrency > 0 then
        begin
          vCaption := '포인트' + '('+Query.FieldByName('QTY_POINT').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_POINT').asString+'" />';
        end;
        if Query.FieldByName('AMT_LETSORDER').AsCurrency > 0 then
        begin
          vCaption := '렛츠오더' + '('+Query.FieldByName('QTY_LETSORDER').AsString+'건)';
          vChartXml := vChartXml + '<set label="'+vCaption+'" value="'+Query.FieldByName('AMT_LETSORDER').asString+'" />';
        end;
      end;
    finally
      FinishQuery;
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(PayChart, 'PayChart', 'pie3d', vChartXml);
  end;

  // 시간대별 매출
  if (TimePanel.Visible or TimeChartPanel.Visible) then
  begin
    OpenQuery('select   Max(c.NM_CODE1) as TIME_ZONE, '
             +'         Sum(case when s.YMD_SALE = :P2 then s.AMT_SALE else 0 end) as AMT_SALE_Y, '
             +'         Sum(case when s.YMD_SALE = :P2 then s.CNT_CUST else 0 end) as CNT_CUST_Y, '
             +'         Sum(case when s.YMD_SALE = :P3 then s.AMT_SALE else 0 end) as AMT_SALE, '
             +'         Sum(case when s.YMD_SALE = :P3 then s.CNT_CUST else 0 end) as CNT_CUST, '
             +'         case when Sum(case when s.YMD_SALE = :P3 then s.CNT_CUST else 0 end) = 0 then 0 else Round(Sum(case when s.YMD_SALE = :P3 then s.AMT_SALE else 0 end) / Sum(case when s.YMD_SALE = :P3 then s.CNT_CUST else 0 end), 0) end as AMT_CUST '
             +'from     MS_CODE as c left outer join '
             +'        (select YMD_SALE, '
             +'                CD_TIME as CD_CODE, '
             +'                Sum(AMT_SALE) as AMT_SALE, '
             +'                Sum(CNT_PERSON) as CNT_CUST '
             +'           from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.CurrentDate, ConditionToolBarToDateEdit.CurrentDate, '')
             +'          where CD_HEAD  =:P0 '
             +'            and YMD_SALE between :P2 and :P3 '
             +'            and DS_SALE <> ''V'' '
             +'          group by YMD_SALE, '
             +'                   CD_TIME) as s on c.CD_CODE = s.CD_CODE '
             +'where    c.CD_HEAD   = :P0 '
             +'  and    c.CD_STORE  = :P1 '
             +'  and    c.CD_KIND   = ''15'' '
             +'  and    c.DS_STATUS = ''0'' '
             +'group by c.CD_CODE '
             +'order by c.CD_CODE',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarFromDateEdit.CurrentDate),
               DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
    DM.ReadQuery(Query, TimeGridBandedTableView);

    // 챠트로 표시
    if TimeChartPanel.Visible then
    begin
      vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

      for vIndex := 0 to TimeGridBandedTableView.DataController.RecordCount - 1 do
      begin
        vChartXml := vChartXml + '<set label="'+TimeGridBandedTableView.DataController.Values[vIndex,0]+'" value="'+FloatToStr(TimeGridBandedTableView.DataController.Values[vIndex,3])+'" />'
      end;
      vChartXml := vChartXml + '</chart>';
      ShowChart(TimeChart, 'TimeChart', 'column3d', vChartXml);
    end;
  end;

  Result := true;
end;

end.
