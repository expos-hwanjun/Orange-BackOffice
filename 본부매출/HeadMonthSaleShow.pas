unit HeadMonthSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, DateUtils,
  StrUtils, SHDocVw, AdvSplitter;

type
  THeadMonthSaleShowForm = class(TInheritShowForm)
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewJan: TcxGridColumn;
    GridTableViewFeb: TcxGridColumn;
    GridTableViewMar: TcxGridColumn;
    GridTableViewApr: TcxGridColumn;
    GridTableViewMay: TcxGridColumn;
    GridTableViewJun: TcxGridColumn;
    GridTableViewJul: TcxGridColumn;
    GridTableViewAug: TcxGridColumn;
    GridTableViewSep: TcxGridColumn;
    GridTableViewOct: TcxGridColumn;
    GridTableViewNov: TcxGridColumn;
    GridTableViewDec: TcxGridColumn;
    GridTableViewTotal: TcxGridColumn;
    ChartGraphPanel: TPanel;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ChartGraphPanelResize(Sender: TObject);
  private
    SaleChart  : TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadMonthSaleShowForm: THeadMonthSaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}
procedure THeadMonthSaleShowForm.FormCreate(Sender: TObject);
var vIndex :Integer;
    vYear  :Integer;
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;

  SaleChart  := TWebBrowser.Create(Self);
  TWinControl(SaleChart).Parent := ChartPanel;
  SaleChart.Align := alClient;

  ConditionToolBarComboBox.Properties.Items.Clear;
  for vIndex := 5 downto 0 do
    ConditionToolBarComboBox.Properties.Items.Add(FormatDateTime('yyyy³â',IncYear(Now(),-vIndex)));

  ConditionToolBarComboBox.ItemIndex := ConditionToolBarComboBox.Properties.Items.Count-1;
end;

procedure THeadMonthSaleShowForm.ChartGraphPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(SaleChart) and (SaleChart.Hint <> '') then
    ShowChart(SaleChart, 'SaleChart', 'column3d', SaleChart.Hint);

end;

function THeadMonthSaleShowForm.DoSearch: Boolean;
var
 vCaption  : String;
 vChartXml : String;
 vIndex    : Integer;
begin
  OpenQuery('select a.NM_STORE_SHORT, '
           +'       Ifnull(b.AMT_01, 0) as AMT_01,'
           +'       Ifnull(b.AMT_02, 0) as AMT_02,'
           +'       Ifnull(b.AMT_03, 0) as AMT_03,'
           +'       Ifnull(b.AMT_04, 0) as AMT_04,'
           +'       Ifnull(b.AMT_05, 0) as AMT_05,'
           +'       Ifnull(b.AMT_06, 0) as AMT_06,'
           +'       Ifnull(b.AMT_07, 0) as AMT_07,'
           +'       Ifnull(b.AMT_08, 0) as AMT_08,'
           +'       Ifnull(b.AMT_09, 0) as AMT_09,'
           +'       Ifnull(b.AMT_10, 0) as AMT_10,'
           +'       Ifnull(b.AMT_11, 0) as AMT_11,'
           +'       Ifnull(b.AMT_12, 0) as AMT_12,'
           +'       Ifnull(b.AMT_TOT, 0) as AMT_TOT '
           +'  from MS_STORE as a inner join '
           +'     (select CD_STORE, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''01'' then AMT_SALE else 0 end) as AMT_01, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''02'' then AMT_SALE else 0 end) as AMT_02, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''03'' then AMT_SALE else 0 end) as AMT_03, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''04'' then AMT_SALE else 0 end) as AMT_04, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''05'' then AMT_SALE else 0 end) as AMT_05, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''06'' then AMT_SALE else 0 end) as AMT_06, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''07'' then AMT_SALE else 0 end) as AMT_07, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''08'' then AMT_SALE else 0 end) as AMT_08, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''09'' then AMT_SALE else 0 end) as AMT_09, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''10'' then AMT_SALE else 0 end) as AMT_10, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''11'' then AMT_SALE else 0 end) as AMT_11, '
           +'             SUM(case when Substring(YMD_SALE,5,2) = ''12'' then AMT_SALE else 0 end) as AMT_12, '
           +'             Sum(AMT_SALE) as AMT_TOT '
           +'        from SL_SALE_H_SUM '
           +'       where CD_HEAD =:P0 '
           +'         and YMD_SALE between :P1 and :P2 '
           +'       group by CD_STORE) as b on b.CD_STORE = a.CD_STORE '
           +' where a.CD_HEAD =:P0 '
           +'   and a.YN_USE  = ''Y'' '
           +' group by b.AMT_TOT desc ',
           [HeadStoreCode,
            LeftStr(ConditionToolBarComboBox.Text,4)+'0101',
            LeftStr(ConditionToolBarComboBox.Text,4)+'1231']);
  Result := DM.ReadQuery(Query, GridTableView);
  ReportSubTitle := 'Á¶È¸³âµµ '+ ConditionToolBarComboBox.Text;

  // Ã­Æ®·Î Ç¥½Ã
  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''¸¼Àº °íµñ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
  for vIndex := 0 to 11 do
  begin
    vChartXml := vChartXml + '<set label="'+GridTableView.Columns[vIndex+1].Caption+'" value="'+FloatToStr(GridTableView.DataController.Summary.FooterSummaryValues[vIndex])+'" />'
  end;
  vChartXml := vChartXml + '</chart>';
  ShowChart(SaleChart, 'SaleChart', 'column3d', vChartXml);

end;


end.
