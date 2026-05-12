unit SaleCompanySaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus,
  Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess,
  Uni, Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, SHDocVw, AdvSplitter, StrUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleCompanySaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView2: TcxGridTableView;
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewTotalAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewTaxAmt: TcxGridColumn;
    GridTableViewRealAmt: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewDutyFreeAmt: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1TaxAmt: TcxGridColumn;
    GridTableView1RealAmt: TcxGridColumn;
    GridTableView1BuyAmt: TcxGridColumn;
    GridTableView1ProfitRate: TcxGridColumn;
    GridTableView1ProfitAmt: TcxGridColumn;
    GridTableView2GoodsCode: TcxGridColumn;
    GridTableView2GoodsName: TcxGridColumn;
    GridTableView2Spec: TcxGridColumn;
    GridTableView2SaleQty: TcxGridColumn;
    GridTableView2SaleAmt: TcxGridColumn;
    GridTableView2TaxAmt: TcxGridColumn;
    GridTableView2BuyAmt: TcxGridColumn;
    GridTableView2ProfitRate: TcxGridColumn;
    GridTableView2ProfitAmt: TcxGridColumn;
    GridTableView1CompanyCode: TcxGridColumn;
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
  private
    FusionChart: TWebBrowser;
    isSelected   : Boolean;
  protected
    function DoSearch:Boolean; override;
    { Public declarations }
  end;

var
  SaleCompanySaleShowForm: TSaleCompanySaleShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ TInheritShowForm1 }
procedure TSaleCompanySaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TSaleCompanySaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    ConditionToolBarEdit.Text := FormParam[1];
    Exec_Timer.Enabled := True;
  end;
end;

procedure TSaleCompanySaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매출관리/매입처별%20매출조회/매입처별%20매출조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
  isSelected := false;
end;

procedure TSaleCompanySaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure TSaleCompanySaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

function TSaleCompanySaleShowForm.DoSearch: Boolean;
var
  vIndex    : Integer;
  vChartXml : String;
  vCondition: String;
begin

  if ConditionToolBarEdit.Text <> '' then
    vCondition := ' inner join MS_TRD t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''B'' '
                 +' and ( t.CD_TRDPL = '''+ConditionToolBarEdit.Text+''' or t.NM_TRDPL like ConCat(''%'','''+ConditionToolBarEdit.Text+''',''%'')) '
  else
    vCondition := ' left outer join MS_TRD t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''B'' ';

  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   t.CD_TRDPL, '
             +'         Ifnull(Max(t.NM_TRDPL),''[미지정]'') as NM_TRDPL, '
             +'         Sum(a.AMT_BUY) as AMT_BUY, '
             +'         Sum(a.AMT_SALE) as AMT_TOT, '
             +'         Sum(a.AMT_SALE_SALE) as AMT_SALE, '
             +'         Sum(a.AMT_TAX) as AMT_TAX, '
             +'         Sum(a.AMT_REAL) as AMT_REAL, '
             +'         Sum(a.AMT_DC_TOT) as AMT_DC, '
             +'         GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE_SALE)) as RATE_PROFIT, '
             +'         Sum(a.AMT_SALE_SALE - a.AMT_BUY) as AMT_PROFIT, '
             +'         Sum(a.AMT_SALE_DUTY) as AMT_NET, '
             +'         Sum(a.AMT_SALE_DUTYFREE) as AMT_DUTYFREE '
             +'from    (select   d.CD_STORE, '
             +'                  Ifnull(g.CD_TRDPL,'''') as CD_TRDPL, '
             +'                  Sum(d.AMT_BUY)  as AMT_BUY, '
             +'                  Sum(d.AMT_SALE) as AMT_SALE, '
             +'                  Sum(d.AMT_VAT)  as AMT_TAX, '
             +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE_SALE, '
             +'                  Sum(d.AMT_SALE - d.DC_TOT - d.AMT_VAT) as AMT_REAL, '
             +'                  Sum(d.DC_TOT)  as AMT_DC_TOT, '
             +'                  Sum(case when g.DS_TAX=''1'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_DUTY, '
             +'                  Sum(case when g.DS_TAX=''0'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_DUTYFREE '
             +'         from     SL_SALE_D_SUM as d  left outer join '
             +'                  MS_MENU       as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
             +                   vCondition
             +'         where    d.CD_HEAD  =:P0 '
             +'           and    d.CD_STORE =:P1 '
             +'           and    d.YMD_SALE between :P2 and :P3 '
             +'         group by d.CD_STORE, g.CD_TRDPL) as a left outer join '
             +'         MS_TRD as t on a.CD_STORE = t.CD_STORE and a.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''B'' '
             +'group by t.CD_TRDPL, t.DS_TRDPL '
             +'order by t.CD_TRDPL ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);

    // 푸터 이익률을 구한다
    if (GridTableView.DataController.Summary.FooterSummaryValues[10] <> null) and
       (GridTableView.DataController.Summary.FooterSummaryValues[2] <> null) and
       (GridTableView.DataController.Summary.FooterSummaryValues[2] <> 0) then
      GridTableView.DataController.Summary.FooterSummaryValues[9] := FormatFloat('0.00%', RoundNumber(GridTableView.DataController.Summary.FooterSummaryValues[10]  / GridTableView.DataController.Summary.FooterSummaryValues[2] * 100, 0.01))
    else
      GridTableView.DataController.Summary.FooterSummaryValues[9] := EmptyStr;

    // 챠트로 표시
    vChartXml := '<chart caption='''+Ifthen(Tag=0,'매입처별','제조처별')+' 매출'' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                  +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                  +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
    for vIndex := 0 to GridTableView.DataController.FilteredRecordCount - 1 do
    begin
      if vIndex > 30 then Break;
      vChartXml := vChartXml + '<set label="'+GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex],1]+'" value="'+FloatToStr(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex],GridTableViewSaleAmt.Index])+'" />'
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
     if not isSelected then
        vCondition := ' and (g.CD_TRDPL = '''' or g.CD_TRDPL is null) '
     else
        vCondition := ' and Ifnull(g.CD_TRDPL,'''') = '''+NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyCode.Index],'')+'''';

     OpenQuery('select StoD(d.YMD_SALE) as YMD_SALE, '
              +'       Sum(d.AMT_BUY)  as AMT_BUY, '
              +'       Sum(d.AMT_SALE) as AMT_TOT, '
              +'       Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
              +'       Sum(d.AMT_VAT) as AMT_TAX, '
              +'       Sum(d.AMT_SALE - d.DC_TOT - d.AMT_VAT) as AMT_REAL, '
              +'       Sum(d.DC_TOT)  as AMT_DC, '
              +'       GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
              +'       Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT '
              +'  from SL_SALE_D_SUM as d inner join '
              +'       MS_MENU       as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '+vCondition
              +' where d.CD_HEAD  =:P0 '
              +'   and d.CD_STORE =:P1 '
              +'   and d.YMD_SALE between :P2 and :P3 '
              +' group by d.YMD_SALE '
              +' order by d.YMD_SALE ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView1);

    // 푸터 이익률을 구한다
    if (GridTableView1.DataController.Summary.FooterSummaryValues[8] <> null) and
       (GridTableView1.DataController.Summary.FooterSummaryValues[2] <> 0) then
      GridTableView1.DataController.Summary.FooterSummaryValues[7] := FormatFloat('0.00%', RoundNumber(GridTableView1.DataController.Summary.FooterSummaryValues[8]  / GridTableView1.DataController.Summary.FooterSummaryValues[2] * 100, 0.01))
    else
      GridTableView1.DataController.Summary.FooterSummaryValues[7] := EmptyStr;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
//    ChartPanel.Visible := False;
    if GridTableView.DataController.GetFocusedRecordIndex < 0 then
    begin
      GridTableView2.DataController.RecordCount := 0;
      Exit;
    end;

    //일자별탭에서 더블클릭하지 않고 조회조건 넣고 조회할때
    if not isSelected and (ConditionToolBarEdit.Text <> '') then
      vCondition := 'and (g.CD_MENU = '''+ConditionToolBarEdit.Text+''' or g.NM_MENU like ''%''+'''+ConditionToolBarEdit.Text+'''+''%'') '
    else
      vCondition := EmptyStr;

    OpenQuery('select   d.CD_MENU, '
             +'         Max(g.NM_MENU) as NM_MENU, '
             +'         Max(g.NM_SPEC) as NM_SPEC, '
             +'         Sum(d.QTY_SALE) as QTY_SALE, '
             +'         Sum(d.AMT_BUY)  as AMT_BUY, '
             +'         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'         Sum(d.AMT_VAT) as AMT_TAX, '
             +'         Sum(d.DC_TOT)  as AMT_DC, '
             +'         GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
             +'         Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT '
             +'from     SL_SALE_D_SUM as d inner join '
             +'         MS_MENU       as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
             +'where    d.CD_HEAD  =:P0 '
             +'  and    d.CD_STORE =:P1 '
             +'  and    d.YMD_SALE Between :P2 and :P3 '
             +'  and    g.CD_TRDPL = :P4 '
             +vCondition
             +'group by d.CD_MENU '
             +'order by d.CD_MENU',
              [HeadStoreCode,
               StoreCode,
               Ifthen(isSelected, GetOnlyNumber(NVL(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index],'')), DtoS(ConditionToolBarFromDateEdit.Date)),
               Ifthen(isSelected, GetOnlyNumber(NVL(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index],'')), DtoS(ConditionToolBarToDateEdit.Date)),
               NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyCode.Index],'')]);
    Result := DM.ReadQuery(Query, GridTableView2);

    // 푸터 이익률을 구한다
    if (GridTableView2.DataController.Summary.FooterSummaryValues[5] <> null) and
       (GridTableView2.DataController.Summary.FooterSummaryValues[1] <> 0) then
      GridTableView2.DataController.Summary.FooterSummaryValues[4] := FormatFloat('0.00%', RoundNumber(GridTableView2.DataController.Summary.FooterSummaryValues[5]  / GridTableView2.DataController.Summary.FooterSummaryValues[1] * 100, 0.01))
    else
      GridTableView2.DataController.Summary.FooterSummaryValues[4] := EmptyStr;
  end;
end;


//기간별 판매 탭에서 더블클릭
procedure TSaleCompanySaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  isSelected := true;
  GridLevel1.Caption := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyName.Index ] + ' 일자별 판매 ';
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
  isSelected := false;
end;

//일자별 판매 탭에서 더블클릭
procedure TSaleCompanySaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  isSelected := true;
  Grid.ActiveLevel := GridLevel2;
  DoSearch;
  isSelected := false;
end;

end.
