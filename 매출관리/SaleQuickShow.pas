// 매출속보 조회 (완료)

unit SaleQuickShow;



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
  TSaleQuickShowForm = class(TInheritEditForm)
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
    TablePanel: TAdvPanel;
    TableGrid: TcxGrid;
    TableGridLevel: TcxGridLevel;
    PayGraphPanel: TAdvPanel;
    PayChartPanel: TPanel;
    PosPanel: TAdvPanel;
    ClassPanel: TAdvPanel;
    PricePanel: TAdvPanel;
    PosGrid: TcxGrid;
    PosGridBandedTableView: TcxGridBandedTableView;
    PosGridBandedTableViewPosNo: TcxGridBandedColumn;
    PosGridBandedTableViewSaleAmt: TcxGridBandedColumn;
    PosGridBandedTableViewBuyAmt: TcxGridBandedColumn;
    PosGridBandedTableViewCustomerCnt: TcxGridBandedColumn;
    PosGridBandedTableViewCustomerAmt: TcxGridBandedColumn;
    PosGridLevel: TcxGridLevel;
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
    mnuVisiblePos: TMenuItem;
    N1: TMenuItem;
    mnuVisibleSummery: TMenuItem;
    mnuVisibleClass: TMenuItem;
    mnuVisiblePrice: TMenuItem;
    mnuVisibleTime: TMenuItem;
    mnuVisibleTable: TMenuItem;
    mnuVisiblePayGraph: TMenuItem;
    TimeGraphPanel: TAdvPanel;
    TimeChartPanel: TPanel;
    mnuVisibleTimeGraph: TMenuItem;
    GridTableViewDutySaleAmt: TcxGridColumn;
    GridTableViewDutyFreeSaleAmt: TcxGridColumn;
    SummeryChartPanel: TPanel;
    GridTableViewDeliveryCount: TcxGridColumn;
    GridTableViewDeliveryAmt: TcxGridColumn;
    TableGridTableView: TcxGridTableView;
    TableGridTableViewTableNo: TcxGridColumn;
    TableGridTableViewCycleCount: TcxGridColumn;
    TableGridTableViewSaleAmt: TcxGridColumn;
    TableGridTableViewColumn1: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    PosGridBandedTableViewProfitRate: TcxGridBandedColumn;
    PosGridBandedTableViewProfitAmt: TcxGridBandedColumn;
    PosGridBandedTableViewCashAmt: TcxGridBandedColumn;
    PosGridBandedTableViewCardAmt: TcxGridBandedColumn;
    PosGridBandedTableViewCashRcpAmt: TcxGridBandedColumn;
    PosGridBandedTableViewEtcAmt: TcxGridBandedColumn;
    CornerPanel: TAdvPanel;
    cxGrid1: TcxGrid;
    CornerGridBandedTableView: TcxGridBandedTableView;
    cxGridBandedColumn1: TcxGridBandedColumn;
    CornerGridBandedTableViewCornerrName: TcxGridBandedColumn;
    CornerGridBandedTableViewSaleAmt: TcxGridBandedColumn;
    CornerGridBandedTableViewRate: TcxGridBandedColumn;
    CornerGridLevel: TcxGridLevel;
    mnuVisibleCourner: TMenuItem;
    OrderPanel: TAdvPanel;
    OrderGrid: TcxGrid;
    OrderGridTableView: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    OrderGridLevel: TcxGridLevel;
    mnuVisibleOrder: TMenuItem;
    GridTableViewColumn1: TcxGridColumn;
    mnuVisibleMenu: TMenuItem;
    MenuPanel: TAdvPanel;
    MenuGrid: TcxGrid;
    MenuGridTableView: TcxGridTableView;
    cxGridColumn5: TcxGridColumn;
    cxGridColumn6: TcxGridColumn;
    cxGridColumn7: TcxGridColumn;
    MenuGridLevel: TcxGridLevel;

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
    procedure mnuVisiblePosClick(Sender: TObject);
    procedure mnuVisibleClassClick(Sender: TObject);
    procedure mnuVisiblePriceClick(Sender: TObject);
    procedure mnuVisibleTimeClick(Sender: TObject);
    procedure mnuVisibleTableClick(Sender: TObject);
    procedure mnuVisiblePayGraphClick(Sender: TObject);
    procedure mnuVisibleTimeGraphClick(Sender: TObject);
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
    procedure mnuVisibleCournerClick(Sender: TObject);
    procedure SummeryPanelClick(Sender: TObject);
    procedure mnuVisibleOrderClick(Sender: TObject);
    procedure mnuVisibleMenuClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SummeryChartPanelResize(Sender: TObject);
    procedure PayChartPanelResize(Sender: TObject);
    procedure TimeChartPanelResize(Sender: TObject);
    procedure ConditionToolBarToDateEditPropertiesChange(Sender: TObject);
    procedure MenuGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
    SummeryChart,
    PayChart,
    TimeChart  : TWebBrowser;
  protected
    function DoSearch: Boolean; override;
  end;

var
  SaleQuickShowForm: TSaleQuickShowForm;



implementation

uses
  Common, DBModule, Main;

const
  iniDateCondition = 'DateCondition';

{$R *.dfm}
procedure BlockInput(ABlockInput : boolean); stdcall; external 'USER32.DLL';

procedure TSaleQuickShowForm.FormCreate(Sender: TObject);
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
  PosPanel.LoadPosition;
  OrderPanel.LoadPosition;
  ClassPanel.LoadPosition;
  PricePanel.LoadPosition;
  TimePanel.LoadPosition;
  TablePanel.LoadPosition;
  MenuPanel.LoadPosition;
  PayGraphPanel.LoadPosition;
  TimeGraphPanel.LoadPosition;
  CornerPanel.LoadPosition;

  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      try
        RefreshToolBarComboBox.ItemIndex := ReadInteger('매출속보', '자동갱신간격', 0);
        RefreshTimer.Enabled  := RefreshToolBarComboBox.ItemIndex <> 0;
        SummeryPanel.Visible    := ReadBool('매출속보', SummeryPanel.Name,       True);
        PosPanel.Visible        := ReadBool('매출속보', PosPanel.Name,           True);
        OrderPanel.Visible      := ReadBool('매출속보', OrderPanel.Name,         True);
        ClassPanel.Visible      := ReadBool('매출속보', ClassPanel.Name,         True);
        PricePanel.Visible      := ReadBool('매출속보', PricePanel.Name,         True);
        TimePanel.Visible       := ReadBool('매출속보', TimePanel.Name,          True);
        TablePanel.Visible      := ReadBool('매출속보', TablePanel.Name,         True);
        PayGraphPanel.Visible   := ReadBool('매출속보', PayGraphPanel.Name,      True);
        TimeGraphPanel.Visible  := ReadBool('매출속보', TimeGraphPanel.Name,     True);
        MenuPanel.Visible       := ReadBool('매출속보', MenuPanel.Name,          True);
        CornerPanel.Visible     := ReadBool('매출속보', CornerPanel.Name,        True) and (GetOption(231)='1');
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

end;


procedure TSaleQuickShowForm.FormDestroy(Sender: TObject);
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
procedure TSaleQuickShowForm.FormShow(Sender: TObject);
begin
  inherited;
  // 조회 날짜 조건을 불러온다
  ConditionToolBarFromDateEdit.Date       := ConditionToolBarToDateEdit.Date-1;

//  ButtonToolBarSearchButton.Click;
end;

procedure TSaleQuickShowForm.mnuAutoArrangeClick(Sender: TObject);
begin
  inherited;

  SummeryPanel.Left   := 0  ;
  SummeryPanel.Top    := 38 ;
  SummeryPanel.Width  := 982;
  SummeryPanel.Height := 108;
  PosPanel.Left       := 0  ;
  PosPanel.Top        := 152;
  PosPanel.Width      := 503;
  PosPanel.Height     := 178;
  ClassPanel.Left     := 509;
  ClassPanel.Top      := 152;
  ClassPanel.Width    := 298;
  ClassPanel.Height   := 178;
  PricePanel.Left     := 812;
  PricePanel.Top      := 152;
  PricePanel.Width    := 170;
  PricePanel.Height   := 178;
  TimePanel.Left      := 0  ;
  TimePanel.Top       := 336;
  TimePanel.Width     := 424;
  TimePanel.Height    := 218;
  TablePanel.Left   := 430;
  TablePanel.Top    := 336;
  TablePanel.Width  := 377;
  TablePanel.Height := 218;
  PayGraphPanel.Left   := 812;
  PayGraphPanel.Top    := 336;
  PayGraphPanel.Width  := 170;
  PayGraphPanel.Height := 218;
  TimeGraphPanel.Left    := 0  ;
  TimeGraphPanel.Top     := 336;
  TimeGraphPanel.Width   := 424;
  TimeGraphPanel.Height  := 218;
  SummeryPanel.Visible   := True;
  PosPanel.Visible       := True;
  OrderPanel.Visible     := True;
  ClassPanel.Visible     := True;
  PricePanel.Visible     := True;
  TimePanel.Visible      := True;
  PayGraphPanel.Visible  := True;
  TimeGraphPanel.Visible := False;
  CornerPanel.Visible    := GetOption(231)= '1';
end;

procedure TSaleQuickShowForm.mnuVisibleClassClick(Sender: TObject);
begin
  ClassPanel.Visible := Not ClassPanel.Visible;
end;

procedure TSaleQuickShowForm.mnuVisibleCournerClick(Sender: TObject);
begin
  inherited;
  CornerPanel.Visible := Not CornerPanel.Visible;
  CornerPanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisibleMenuClick(Sender: TObject);
begin
  inherited;
  MenuPanel.Visible := Not MenuPanel.Visible;
  MenuPanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisibleOrderClick(Sender: TObject);
begin
  inherited;
  OrderPanel.Visible := Not OrderPanel.Visible;
  OrderPanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisibleTableClick(Sender: TObject);
begin
  TablePanel.Visible := Not TablePanel.Visible;
  TablePanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisiblePayGraphClick(Sender: TObject);
begin
  PayGraphPanel.Visible := Not PayGraphPanel.Visible;
  PayGraphPanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisiblePosClick(Sender: TObject);
begin
  PosPanel.Visible := Not PosPanel.Visible;
  PosPanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisiblePriceClick(Sender: TObject);
begin
  PricePanel.Visible := Not PricePanel.Visible;
  PricePanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisibleSummeryClick(Sender: TObject);
begin
  SummeryPanel.Visible := Not SummeryPanel.Visible;
  SummeryPanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisibleTimeClick(Sender: TObject);
begin
  TimePanel.Visible := Not TimePanel.Visible;
  TimePanel.BringToFront;
end;

procedure TSaleQuickShowForm.mnuVisibleTimeGraphClick(Sender: TObject);
begin
  TimeGraphPanel.Visible := Not TimeGraphPanel.Visible;
  TimeGraphPanel.BringToFront;
end;

procedure TSaleQuickShowForm.RefreshTimerTimer(Sender: TObject);
begin
  inherited;
  if Self.Active then DoSearch;
end;

procedure TSaleQuickShowForm.RefreshToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;

  RefreshTimer.Interval := PIntPointer(RefreshToolBarComboBox.Properties.Items.Objects[RefreshToolBarComboBox.ItemIndex]).Data * 1000;
  RefreshTimer.Enabled  := RefreshToolBarComboBox.ItemIndex <> 0;
end;

procedure TSaleQuickShowForm.SaleCompanyGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //매출처별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  FormParam[2] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 1];
  ExtremeMainForm.RunProgram('CompanyGoodsSaleShow');
end;

procedure TSaleQuickShowForm.SummeryChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(SummeryChart) and (SummeryChart.Hint <> '') then
    ShowChart(SummeryChart, 'SummeryChart', 'column3d', SummeryChart.Hint);
end;

procedure TSaleQuickShowForm.SummeryPanelClick(Sender: TObject);
begin
  inherited;
  (Sender as TAdvPanel).BringToFront;
end;

procedure TSaleQuickShowForm.GridTableViewCellDblClick(
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

procedure TSaleQuickShowForm.MenuGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FormParam[0] := ConditionToolBarToDateEdit.Text;
  ExtremeMainForm.RunProgram('SaleGoodsSaleShow');
end;

procedure TSaleQuickShowForm.TeamGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //상품분류별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('SaleTeamSaleShow');
end;

procedure TSaleQuickShowForm.TimeChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(TimeChart) and (TimeChart.Hint <> '') then
    ShowChart(TimeChart, 'TimeChart', 'column3d', TimeChart.Hint);

end;

procedure TSaleQuickShowForm.TimeGridBandedTableViewBands1HeaderClick(
  Sender: TObject);
begin
  inherited;
  //시간대별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date-1);
  ExtremeMainForm.RunProgram('SaleTimeSaleShow');
end;

procedure TSaleQuickShowForm.TimeGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //시간대별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date);
  ExtremeMainForm.RunProgram('SaleTimeSaleShow');
end;

procedure TSaleQuickShowForm.BackGroundPopupMenuPopup(Sender: TObject);
begin
  inherited;
  mnuVisibleSummery.Checked     := SummeryPanel.Visible;
  mnuVisiblePos.Checked         := PosPanel.Visible;
  mnuVisibleOrder.Checked       := OrderPanel.Visible;
  mnuVisibleClass.Checked       := ClassPanel.Visible;
  mnuVisiblePrice.Checked       := PricePanel.Visible;
  mnuVisibleTime.Checked        := TimePanel.Visible;
  mnuVisibleTable.Checked       := TablePanel.Visible;
  mnuVisibleMenu.Checked        := MenuPanel.Visible;
  mnuVisiblePayGraph.Checked    := PayGraphPanel.Visible;
  mnuVisibleTimeGraph.Checked   := TimeGraphPanel.Visible;
  mnuVisibleCourner.Checked     := CornerPanel.Visible;
end;

procedure TSaleQuickShowForm.ClassGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //상품분류별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('AnalysisClassSaleShow');
end;

procedure TSaleQuickShowForm.CompanyGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //매입처별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('SaleCompanySaleShow');
end;

procedure TSaleQuickShowForm.PayChartDblClick(Sender: TObject);
begin
  inherited;
  //결제수단별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date);
  ExtremeMainForm.RunProgram('SalePayShow');
end;


procedure TSaleQuickShowForm.PayChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(PayChart) and (PayChart.Hint <> '') then
    ShowChart(PayChart, 'PayChart', 'pie3d', PayChart.Hint);
end;

procedure TSaleQuickShowForm.PosGridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //포스별 매출조회 실행
  FormParam[0] := DtoS(ConditionToolBarToDateEdit.Date);
  FormParam[1] := Sender.DataController.Values[Sender.DataController.GetFocusedRecordIndex, 0];
  ExtremeMainForm.RunProgram('SaleReceiptShow');
end;

procedure TSaleQuickShowForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SummeryPanel.SavePosition;
  PosPanel.SavePosition;
  OrderPanel.SavePosition;
  ClassPanel.SavePosition;
  PricePanel.SavePosition;
  TimePanel.SavePosition;
  TablePanel.SavePosition;
  MenuPanel.SavePosition;
  PayGraphPanel.SavePosition;
  TimeGraphPanel.SavePosition;
  CornerPanel.SavePosition;
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      try
        WriteInteger('매출속보', '자동갱신간격', RefreshToolBarComboBox.ItemIndex);
        WriteBool('매출속보', SummeryPanel.Name,       SummeryPanel.Visible);
        WriteBool('매출속보', PosPanel.Name,           PosPanel.Visible);
        WriteBool('매출속보', OrderPanel.Name,         OrderPanel.Visible);
        WriteBool('매출속보', ClassPanel.Name,         ClassPanel.Visible);
        WriteBool('매출속보', PricePanel.Name,         PricePanel.Visible);
        WriteBool('매출속보', TimePanel.Name,          TimePanel.Visible);
        WriteBool('매출속보', TablePanel.Name,         TablePanel.Visible);
        WriteBool('매출속보', PayGraphPanel.Name,      PayGraphPanel.Visible);
        WriteBool('매출속보', TimeGraphPanel.Name,     TimeGraphPanel.Visible);
        WriteBool('매출속보', MenuPanel.Name,          MenuPanel.Visible);
        WriteBool('매출속보', CornerPanel.Name,        CornerPanel.Visible);
      except
      end;
    finally
      Free;
    end;
end;


procedure TSaleQuickShowForm.FormResize(Sender: TObject);
begin
  inherited;

  // 그리드 크기를 알맞게 조절한다
  //ClassGridBandedTableViewClassName.Width     := ClassGrid.Width - ClassGridBandedTableViewSaleAmt.Width - ClassGridBandedTableViewProfitRate.Width - ClassGridBandedTableViewRate.Width - 20;
  //CompanyGridBandedTableViewCompanyName.Width := CompanyGrid.Width - CompanyGridBandedTableViewBuyAmt.Width - CompanyGridBandedTableViewSaleAmt.Width - CompanyGridBandedTableViewProfitRate.Width - CompanyGridBandedTableViewRate.Width - 20;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TSaleQuickShowForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

procedure TSaleQuickShowForm.ConditionToolBarToDateEditPropertiesChange(
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
function TSaleQuickShowForm.DoSearch: Boolean;
var
 vCaption  : String;
 vChartXml : String;
 vIndex, vTemp : Integer;
begin
  // 매출 요약
  if (SummeryPanel.Visible) then
  begin
    OpenQuery('select   GUBUN, '
             +'         YMD_SALE, '
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
             +'                  case h.YMD_SALE when :P2 then 1        when :P3 then 2        when :P4 then 3        when :P5 then 4        when :P6 then 5        end as SEQ, '
             +'                  case h.YMD_SALE when :P2 then ''당일'' when :P3 then ''전일'' when :P4 then ''전주'' when :P5 then ''전월'' when :P6 then ''전년'' end as GUBUN, '
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
             +'           from   SL_SALE_H_SUM as h '
             +'          where   h.CD_HEAD  =:P0 '
             +'            and   h.CD_STORE =:P1 '
             +'            and   h.YMD_SALE in (:P2, :P3, :P4, :P5, :P6) '
             +'          group by h.YMD_SALE '
             +'          union all '
             +'         select   ''00000000'' as YMD_SALE, '
             +'                  6            as SEQ, '
             +'                  ''월계''     as GUBUN, '
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
             +'           from   SL_SALE_H_SUM as h '
             +'          where   h.CD_HEAD  =:P0 '
             +'            and   h.CD_STORE =:P1 '
             +'            and   h.YMD_SALE between ConCat(Left(:P2, 6),''01'') and :P2 '
             +'         ) as k '
             +'order by SEQ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date-1),
               DtoS(IncWeek(ConditionToolBarToDateEdit.Date, -1)),
               DtoS(IncMonth(ConditionToolBarToDateEdit.Date,-1)),
               DtoS(IncYear(ConditionToolBarToDateEdit.Date, -1))]);
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

    // POS별 매출
  if (PosPanel.Visible) then
  begin
    OpenQuery('select a.NO_POS, '
             +'       Sum(a.AMT_SALE) as AMT_SALE, '
             +'       Sum(a.AMT_SALE-a.AMT_BUY)  as AMT_PROFIT, '
             +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE)) as RATE_PROFIT, '
             +'       Sum(a.CNT_PERSON) as CNT_CUST, '
             +'       case when Count(*) = 0 then 0 else Round(Sum(a.AMT_SALE) / Count(*), 0) end as AMT_CUST, '
             +'       sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') = '''') then 0 else 1 end) as CNT_DELIVERY, '
             +'       sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') = '''') then 0 else a.AMT_SALE end) as AMT_DELIVERY, '
             +'       sum(a.AMT_CASH+a.AMT_CHECK-a.AMT_CASHRCP) as AMT_CASH, '
             +'       sum(a.AMT_CARD) as AMT_CARD, '
             +'       sum(a.AMT_CASHRCP) as AMT_CASHRCP, '
             +'       sum(a.AMT_SALE-a.AMT_CASH-a.AMT_CHECK-a.AMT_CARD) as AMT_ETC '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'       MS_TABLE  b on b.CD_HEAD = a.CD_HEAD '
             +'                  and b.CD_STORE = a.CD_STORE '
             +'                  and b.NO_TABLE = a.NO_TABLE '
             +'                  and b.NO_TABLE > 0 '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.YMD_SALE = :P2 '
             +'   and a.DS_SALE <> ''V'' '
             +' group by a.NO_POS '
             +' order by a.NO_POS ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, PosGridBandedTableView);
    //PosGrid.Height := (PosGridBandedTableView.DataController.RecordCount+3) * 23 + 7;
    if (PosGridBandedTableView.DataController.Summary.FooterSummaryValues[2] <> null) and
       (PosGridBandedTableView.DataController.Summary.FooterSummaryValues[4] <> null) and
       (PosGridBandedTableView.DataController.Summary.FooterSummaryValues[4] <> 0) then
      PosGridBandedTableView.DataController.Summary.FooterSummaryValues[5] := FormatFloat(fmtComma, RoundNumber(PosGridBandedTableView.DataController.Summary.FooterSummaryValues[2] / PosGridBandedTableView.DataController.Summary.FooterSummaryValues[4]))
    else
      PosGridBandedTableView.DataController.Summary.FooterSummaryValues[5] := EmptyStr;
    if (PosGridBandedTableView.DataController.Summary.FooterSummaryValues[2] <> null) and
       (PosGridBandedTableView.DataController.Summary.FooterSummaryValues[6] <> null) and
       (PosGridBandedTableView.DataController.Summary.FooterSummaryValues[2] <> 0) then
      PosGridBandedTableView.DataController.Summary.FooterSummaryValues[3] := FormatFloat('0.00%', RoundNumber((PosGridBandedTableView.DataController.Summary.FooterSummaryValues[2] - PosGridBandedTableView.DataController.Summary.FooterSummaryValues[6]) / PosGridBandedTableView.DataController.Summary.FooterSummaryValues[2] * 100, 0.01))
    else
      PosGridBandedTableView.DataController.Summary.FooterSummaryValues[3] := EmptyStr;
  end;

  if OrderPanel.Visible then
  begin
    OpenQuery('select case when a.DS_ORDER = ''T'' then case when a.NO_TABLE = 0 then ''TakeOut'' else b.NM_TABLE end else ''배달'' end as NM_TABLE, '
             +'       Date_Format(a.COME_TIME, ''%Y-%m-%d %H:%i'') as COME_TIME, '
             +' 	    a.AMT_ORDER, '
             +' 	    a.CNT_PERSON '
             +'  from SL_ORDER_H a left outer join '
             +'       MS_TABLE   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +' order by a.NO_TABLE ',
             [HeadStoreCode,
              StoreCode]);
    DM.ReadQuery(Query, OrderGridTableView);
  end;

  if MenuPanel.Visible then
  begin
     OpenQuery('select a.CD_MENU, '
              +'	     Max(b.NM_MENU) as NM_MENU, '
              +'       GetQty(b.DS_MENU_TYPE, SUM(a.QTY_SALE) ) as QTY_SALE, '
              +'       SUM(a.AMT_SALE-a.DC_TOT) AS AMT_SALE '
              +'  from SL_SALE_D_SUM a  inner join '
              +'       MS_MENU       b  on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU '
              +' where a.CD_HEAD  = :P0 '
              +'   and a.CD_STORE = :P1 '
              +'   and a.YMD_SALE = :P2 '
              +' group by a.CD_MENU, b.DS_MENU_TYPE '
              +' order by a.CD_MENU ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, MenuGridTableView);
  end;

  // 상품 분류별 매출
  if (ClassPanel.Visible) then
  begin
    OpenQuery('select   a.CD_CLASS, '
             +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
             +'         a.AMT_SALE, '
             +'         a.RATE_PROFIT, '
             +'         case when b.AMT_TOTAL = 0 then 0 else Round(a.AMT_SALE / b.AMT_TOTAL * 100, 0) end as RATE '
             +'  from  (select Left(IfNull(g.CD_CLASS,''''),2) as CD_CLASS, '
             +'                Max(c.NM_CLASS)    as NM_CLASS, '
             +'                Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'                GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
             +'           from SL_SALE_D_SUM  as d  inner join '
             +'                MS_MENU        as g  on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU left outer join '
             +'                MS_MENU_CLASS  as c  on c.CD_HEAD = g.CD_HEAD and g.CD_STORE = c.CD_STORE and Left(g.CD_CLASS,2) = c.CD_CLASS and c.CD_CLASS <> '''' '
             +'          where d.CD_HEAD  = :P0 '
             +'            and d.CD_STORE = :P1 '
             +'            and d.YMD_SALE = :P2 '
             +'          group by Left(Ifnull(g.CD_CLASS,''''),2)) as a, '
             +'        (select Sum(AMT_SALE) as AMT_TOTAL '
             +'           from SL_SALE_H_SUM  '
             +'          where CD_HEAD  = :P0 '
             +'            and CD_STORE = :P1 '
             +'            and YMD_SALE = :P2 ) as b '
             +'order by a.CD_CLASS',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, ClassGridBandedTableView);
  end;


  // 금액대별 매출
  if (PricePanel.Visible) then
  begin
    OpenQuery('select   Max(a.MONEY_ZONE) as MONEY_ZONE, '
             +'         Count(b.CD_MONEY) as CNT_CUST '
             +'  from  (select 0 as CD_MONEY, '' 1천원 이하'' as MONEY_ZONE union all '
             +'         select 1 as CD_MONEY, '' 5천원 이하'' as MONEY_ZONE union all '
             +'         select 2 as CD_MONEY, '' 1만원 이하'' as MONEY_ZONE union all '
             +'         select 3 as CD_MONEY, '' 2만원 이하'' as MONEY_ZONE union all '
             +'         select 4 as CD_MONEY, '' 3만원 이하'' as MONEY_ZONE union all '
             +'         select 5 as CD_MONEY, '' 5만원 이하'' as MONEY_ZONE union all '
             +'         select 6 as CD_MONEY, ''10만원 이하'' as MONEY_ZONE union all '
             +'         select 7 as CD_MONEY, ''20만원 이하'' as MONEY_ZONE union all '
             +'         select 8 as CD_MONEY, ''30만원 이하'' as MONEY_ZONE union all '
             +'         select 9 as CD_MONEY, ''30만원 초과'' as MONEY_ZONE) as a left outer join '
             +'        (select case when Abs(AMT_SALE) <= 1000                   then 0 '
             +'                     when Abs(AMT_SALE) between   1001 and   5000 then 1 '
             +'                     when Abs(AMT_SALE) between   5001 and  10000 then 2 '
             +'                     when Abs(AMT_SALE) between  10001 and  20000 then 3 '
             +'                     when Abs(AMT_SALE) between  20001 and  30000 then 4 '
             +'                     when Abs(AMT_SALE) between  30001 and  50000 then 5 '
             +'                     when Abs(AMT_SALE) between  50001 and 100000 then 6 '
             +'                     when Abs(AMT_SALE) between 100001 and 200000 then 7 '
             +'                     when Abs(AMT_SALE) between 200001 and 300000 then 8 '
             +'                     when Abs(AMT_SALE) > 300000                  then 9 end as CD_MONEY '
             +'           from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarToDateEdit.Date, '')
             +'          where CD_HEAD =  :P0 '
             +'            and CD_STORE = :P1 '
             +'            and YMD_SALE = :P2 '
             +'            and DS_SALE  <> ''V'' ) as b on a.CD_MONEY = b.CD_MONEY '
             +' group by a.CD_MONEY '
             +' order by a.CD_MONEY ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, MoneyGridBandedTableView);
  end;

  // 테이블별 매출
  if (TablePanel.Visible) then
  begin
    OpenQuery('select NM_TABLE, '
             +'       AMT_SALE, '
             +'       CNT_SALE, '
             +'       case when s.AMT_TOT = 0 then 0 else Round(h.AMT_SALE / s.AMT_TOT * 100, 0) end as RATE '
             +'  from '
             +'     	(select  b.NM_TABLE, '
             +'     	         Ifnull(sum(AMT_SALE), 0) as AMT_SALE, '
             +'     	         Count(*) as CNT_SALE '
             +'          from  '+GetPartitionTable('SL_SALE_H',  ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'                MS_TABLE  as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE '
             +'     	  where  a.CD_HEAD  = :P0 '
             +'           and  a.CD_STORE = :P1 '
             +'     	    and  a.YMD_SALE = :P2 '
             +'     	    and  a.DS_SALE <> ''V'' '
             +'           and  Ifnull(a.NO_DELIVERY,'''') = '''' '
             +'           and  a.NO_TABLE > 0 '
             +'         group  by b.NM_TABLE ) as h, '
             +'       (select  SUM(AMT_SALE) as AMT_TOT '
             +'          from  '+GetPartitionTable('SL_SALE_H',  ConditionToolBarToDateEdit.Date, '')
             +'         where  CD_HEAD  = :P0 '
             +'           and  CD_STORE = :P1 '
             +'           and  YMD_SALE = :P2 '
             +'           and  DS_SALE <> ''V'' '
             +'           and  Ifnull(NO_DELIVERY,'''') = '''' '
             +'           and  NO_TABLE > 0 ) as s ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, TableGridTableView);
  end;

  //결제수단별 매출
  if (PayGraphPanel.Visible) then
  begin
    OpenQuery('select   Sum(case when AMT_CASH    = 0 then 0 else 1 end) as QTY_CASH, '
             +'         Sum(AMT_CASH)    as AMT_CASH, '
             +'         (select count(YMD_SALE) from SL_CASH where CD_HEAD =:P0 and CD_STORE = :P1 and YMD_SALE = :P2 ) as QTY_CASHRCP, '
             +'         Sum(AMT_CASHRCP) as AMT_CASHRCP, '
             +'         (select count(YMD_SALE) from SL_CARD where CD_HEAD =:P0 and CD_STORE = :P1 and YMD_SALE = :P2 ) as QTY_CARD, '
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
             +'  from  '+GetPartitionTable('SL_SALE_H',  ConditionToolBarToDateEdit.Date, 'a')
             +' where   CD_HEAD  = :P0 '
             +'   and   CD_STORE = :P1 '
             +'   and   YMD_SALE = :P2 '
             +'   and   DS_SALE  <> ''V'' '
             +' group by YMD_SALE ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date)]);
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
          vCaption := '현금영수증' + '('+Query.FieldByName('QTY_CASHRCP').AsString+'건)';
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
  if (TimePanel.Visible or TimeGraphPanel.Visible) then
  begin
    OpenQuery('select   Max(c.NM_CODE1) as TIME_ZONE, '
             +'         Sum(case when s.YMD_SALE = :P2 then s.AMT_SALE else 0 end) as AMT_SALE_Y, '
             +'         Sum(case when s.YMD_SALE = :P2 then s.CNT_CUST else 0 end) as CNT_CUST_Y, '
             +'         Sum(case when s.YMD_SALE = :P3 then s.AMT_SALE else 0 end) as AMT_SALE, '
             +'         Sum(case when s.YMD_SALE = :P3 then s.CNT_CUST else 0 end) as CNT_CUST, '
             +'         case when Sum(case when s.YMD_SALE = :P3 then s.CNT_CUST else 0 end) = 0 then 0 else Round(Sum(case when s.YMD_SALE = :P3 then s.AMT_SALE else 0 end) / Sum(case when s.YMD_SALE = :P3 then s.CNT_CUST else 0 end), 0) end as AMT_CUST '
             +'from     MS_CODE as c left outer join '
             +'        (select   h.YMD_SALE, '
             +'                  h.CD_TIME as CD_CODE, '
             +'                  Sum(h.AMT_SALE) as AMT_SALE, '
             +'                  Sum(CNT_PERSON) as CNT_CUST '
             +'          from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
             +'         where    h.CD_HEAD  =:P0 '
             +'           and    h.CD_STORE =:P1 '
             +'           and    h.YMD_SALE between :P2 and :P3 '
             +'           and    h.DS_SALE <> ''V'' '
             +'         group by h.YMD_SALE, '
             +'                  h.CD_TIME) as s on c.CD_CODE = s.CD_CODE '
             +'where    c.CD_HEAD   = :P0 '
             +'  and    c.CD_STORE  = :P1 '
             +'  and    c.CD_KIND   = ''15'' '
             +'  and    c.DS_STATUS = ''0'' '
             +'group by c.CD_CODE '
             +'order by c.CD_CODE',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, TimeGridBandedTableView);

    // 챠트로 표시
    if TimeGraphPanel.Visible then
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


  // 코너별 매출
  if (CornerPanel.Visible) then
  begin
    OpenQuery('select  a.NM_CORNER, '
             +'        Ifnull(a.AMT_SALE, 0) as AMT_SALE, '
             +'        case when b.AMT_TOTAL = 0 then 0 else Round(a.AMT_SALE / b.AMT_TOTAL * 100, 0) end as RATE '
             +'  from (select   c.CD_TRDPL as CD_CORNER, '
             +'                 Max(c.NM_TRDPL) as NM_CORNER, '
             +'                 Sum(s.AMT_SALE) as AMT_SALE '
             +'          from   (select CD_TRDPL, '
             +'                         NM_TRDPL '
             +'                    from MS_TRD '
             +'                   where CD_HEAD  =:P0 '
             +'                     and CD_STORE =:P1 '
             +'                     and DS_TRDPL =''C'' '
             +'                   union all '
             +'                  select ''''           as CD_TRDPL, '
             +'                         ''코너미지정'' as NM_TRDPL ) as c left outer join '
             +'                 (select Ifnull(g.CD_CORNER, '''') as CD_CORNER, '
             +'                         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
             +'                    from SL_SALE_D_SUM  as d left outer join '
             +'                         MS_MENU        as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU  '
             +'                   where d.CD_HEAD  =:P0 '
             +'                     and d.CD_STORE =:P1 '
             +'                     and d.YMD_SALE =:P2 '
             +'                   group by g.CD_CORNER) s on c.CD_TRDPL = s.CD_CORNER '
             +'         group by c.CD_TRDPL ) as a, '
             +'       (select Sum(AMT_SALE) as AMT_TOTAL '
             +'          from SL_SALE_H_SUM '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'           and YMD_SALE = :P2 ) as b '
             +'order by a.CD_CORNER',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, CornerGridBandedTableView);
  end;
  Result := true;
end;

end.
