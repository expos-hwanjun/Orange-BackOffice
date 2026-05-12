unit HeadClassSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SHDocVw,
  InheritShow, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxCurrencyEdit, Vcl.ExtCtrls,
  AdvSplitter, cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon,
  Vcl.Menus, Vcl.ImgList, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess,
  Uni, Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, cxProgressBar, MaskUtils, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  THeadClassSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView2: TcxGridTableView;
    GridTableViewLargeName: TcxGridColumn;
    GridTableViewRate: TcxGridColumn;
    GridTableViewTotAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewLargeCode: TcxGridColumn;
    GridLevel3: TcxGridLevel;
    GridTableView3: TcxGridTableView;
    GridTableView1MiddleName: TcxGridColumn;
    GridTableView1Rate: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1ProfitRate: TcxGridColumn;
    GridTableView1ProfitAmt: TcxGridColumn;
    GridTableView1MiddleCode: TcxGridColumn;
    GridTableView2SmallName: TcxGridColumn;
    GridTableView2Rate: TcxGridColumn;
    GridTableView2TotAmt: TcxGridColumn;
    GridTableView2DcAmt: TcxGridColumn;
    GridTableView2SaleAmt: TcxGridColumn;
    GridTableView2ProfitRate: TcxGridColumn;
    GridTableView2ProfitAmt: TcxGridColumn;
    GridTableView2SmallCode: TcxGridColumn;
    GridTableView3SubName: TcxGridColumn;
    GridTableView3Rate: TcxGridColumn;
    GridTableView3TotAmt: TcxGridColumn;
    GridTableView3DcAmt: TcxGridColumn;
    GridTableView3SaleAmt: TcxGridColumn;
    GridTableView3ProfitRate: TcxGridColumn;
    GridTableView3ProfitAmt: TcxGridColumn;
    GridTableView3SubCode: TcxGridColumn;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;
    GridTableViewClass: TcxGridColumn;
    GridTableView1Class: TcxGridColumn;
    GridTableView2Class: TcxGridColumn;
    GridTableView3Class: TcxGridColumn;
    GridLevel4: TcxGridLevel;
    GridTableView4: TcxGridTableView;
    GridTableView4MenuCode: TcxGridColumn;
    GridTableView4MenuName: TcxGridColumn;
    GridTableView4Spec: TcxGridColumn;
    GridTableView4SaleQty: TcxGridColumn;
    GridTableView4TotAmt: TcxGridColumn;
    GridTableView4DcAmt: TcxGridColumn;
    GridTableView4SaleAmt: TcxGridColumn;
    GridTableView4ProfitRate: TcxGridColumn;
    GridTableView4ProfitAmt: TcxGridColumn;
    GridTableView4Rate: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableView1SaleQty: TcxGridColumn;
    GridTableView2Column1: TcxGridColumn;
    GridTableView3SaleQty: TcxGridColumn;
    GridTableView4MenuType: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridTableView3CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
  private
    FusionChart: TWebBrowser;
    LastActiveLevel   : Integer;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadClassSaleShowForm: THeadClassSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure THeadClassSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure THeadClassSaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date   := SToD(FormParam[0]);
    Exec_Timer.Enabled := True;
  end;
end;

procedure THeadClassSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;

  // 관리하는 분류에 해당하는 것만 표시한다
  GridLevel1.Visible  := GetHeadOption(248) >= '1';
  GridLevel2.Visible  := GetHeadOption(248) >= '2';
  GridLevel3.Visible  := GetHeadOption(248) >= '3';
  if not GridLevel1.Visible then
    GridLevel.Caption := ' 분 류 ';
  LastActiveLevel := 0;
end;

procedure THeadClassSaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure THeadClassSaleShowForm.GridTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LastActiveLevel    := 2;
end;

procedure THeadClassSaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridLevel2.Visible then
  begin
    Grid.ActiveLevel   := GridLevel2;
    GridLevel2.Caption := Format(' 소분류[%s] ',[GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleName.Index]]);
    GridLevel3.Caption := ' 세분류 ';
    DoSearch;
  end
  else
  begin
    Grid.ActiveLevel   := GridLevel4;
    DoSearch;
  end;
end;

procedure THeadClassSaleShowForm.GridTableView2CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LastActiveLevel    := 3;
end;

procedure THeadClassSaleShowForm.GridTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridLevel3.Visible then
  begin
    Grid.ActiveLevel   := GridLevel3;
    GridLevel3.Caption := Format(' 세분류[%s] ',[GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SmallName.Index]]);
    DoSearch;
  end
  else
  begin
    Grid.ActiveLevel   := GridLevel4;
    DoSearch;
  end;
end;

procedure THeadClassSaleShowForm.GridTableView3CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LastActiveLevel    := 4;
end;

procedure THeadClassSaleShowForm.GridTableView3CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel   := GridLevel4;
  DoSearch;
end;

procedure THeadClassSaleShowForm.GridTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LastActiveLevel    := 1;
end;

procedure THeadClassSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridLevel1.Visible then
  begin
    Grid.ActiveLevel   := GridLevel1;
    GridLevel1.Caption := Format(' 중분류[%s] ',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeName.Index]]);
    GridLevel2.Caption := ' 소분류 ';
    GridLevel3.Caption := ' 세분류 ';
    DoSearch;
  end
  else
  begin
    Grid.ActiveLevel   := GridLevel4;
    DoSearch;
  end;
end;

procedure THeadClassSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

function THeadClassSaleShowForm.DoSearch: Boolean;
var  vIndex     : Integer;
     vChartXml  : String;
     vCondition :String;
begin
  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  if Grid.ActiveLevel = GridLevel then
  begin
    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   a.CD_CLASS, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
               +'         a.AMT_DC, '
               +'         a.AMT_SALE, '
               +'         a.RATE_PROFIT, '
               +'         a.AMT_PROFIT, '
               +'         case when b.AMT_TOTAL = 0 then 0 else Round(a.AMT_SALE / b.AMT_TOTAL * 100, 0) end as RATE, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_LARGE '
               +'from    (select   Left(Ifnull(g.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.DC_TOT) as AMT_DC, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'                  Sum(d.AMT_SALE-d.DC_TOT-d.AMT_BUY) as AMT_PROFIT, '
               +'                  GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
               +'         from     SL_SALE_D_SUM  as d inner join '
               +'                  MS_MENU        as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                     and g.CD_STORE = :P1 '
               +'                                     and d.CD_MENU  = g.CD_MENU left outer join '
               +'                  MS_MENU_CLASS  as c on d.CD_HEAD  = c.CD_HEAD '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(g.CD_CLASS,2) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'         where    d.CD_HEAD  =:P0 '
               +'           and    d.YMD_SALE between :P2 and :P3 '
               +'         group by Left(Ifnull(g.CD_CLASS,''''),2)) as a, '
               +'        (select   Sum(AMT_SALE) as AMT_TOTAL '
               +'           from   SL_SALE_H_SUM '
               +'          where   CD_HEAD  =:P0 '
               +'            and   YMD_SALE between :P2 and :P3 ) as b '
               +'order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
    else
      OpenQuery('select   a.CD_CLASS, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
               +'         a.AMT_DC, '
               +'         a.AMT_SALE, '
               +'         a.RATE_PROFIT, '
               +'         a.AMT_PROFIT, '
               +'         case when b.AMT_TOTAL = 0 then 0 else Round(a.AMT_SALE / b.AMT_TOTAL * 100, 0) end as RATE, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_LARGE '
               +'from    (select   Left(Ifnull(m.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(s.QTY_SALE) as QTY_SALE, '
               +'                  Sum(s.DC_TOT) as AMT_DC, '
               +'                  Sum(s.AMT_SALE - s.DC_TOT) as AMT_SALE, '
               +'                  Sum(s.AMT_SALE-s.DC_TOT-s.AMT_BUY) as AMT_PROFIT, '
               +'                  GetProfitRate(Sum(s.AMT_BUY), Sum(s.AMT_SALE-s.DC_TOT)) as RATE_PROFIT '
               +'         from    (select g.CD_MENU_HEAD, '
               +'                         d.QTY_SALE, '
               +'                         d.DC_TOT, '
               +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
               +'                         d.AMT_BUY '
               +'                    from SL_SALE_D_SUM  as d inner join '
               +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
               +'                                            and g.CD_STORE = d.CD_STORE '
               +'                                            and d.CD_MENU  = g.CD_MENU '
               +'                   where d.CD_HEAD  =:P0 '
               +'                     and d.YMD_SALE between :P2 and :P3 '
               +'                  ) as s inner join '
               +'                  MS_MENU        as m on m.CD_HEAD  = :P0 '
               +'                                     and m.CD_STORE = :P1 '
               +'                                     and m.CD_MENU  = s.CD_MENU_HEAD inner join '
               +'                  MS_MENU_CLASS  as c on c.CD_HEAD  = :P0 '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(m.CD_CLASS,2) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'         group by Left(Ifnull(m.CD_CLASS,''''),2)) as a, '
               +'        (select   Sum(AMT_SALE) as AMT_TOTAL '
               +'           from   SL_SALE_H_SUM '
               +'          where   CD_HEAD  =:P0 '
               +'            and   YMD_SALE between :P2 and :P3 ) as b '
               +'order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);

    // 챠트로 표시
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      vChartXml := vChartXml + Format('<set label="%s" value="%s" />',[GridTableView.DataController.Values[vIndex, GridTableViewClass.Index], IntToStr(GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index])]);
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
    GridLevel1.Caption := ' 중분류 ';
    GridLevel2.Caption := ' 소분류 ';
    GridLevel3.Caption := ' 세분류 ';
    LastActiveLevel    := 1;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    if GridTableView.DataController.GetFocusedRecordIndex < 0 then
    begin
      MsgBox('조회 할 분류를 지정하세요');
      Exit;
    end;

    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   Ifnull(a.CD_CLASS,'''') as CD_CLASS, '
               +'         case when Ifnull(a.CD_CLASS,'''') = '''' then ''(상품분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
               +'         a.AMT_DC, '
               +'         a.AMT_SALE, '
               +'         a.RATE_PROFIT, '
               +'         a.AMT_PROFIT, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_MIDDLE '
               +'  from  (select   SubString(Ifnull(g.CD_CLASS,''''),3,2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.DC_TOT) as AMT_DC, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'                  Sum(d.AMT_SALE-d.DC_TOT-d.AMT_BUY) as AMT_PROFIT, '
               +'                  GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
               +'           from   SL_SALE_D_SUM  as d inner join '
               +'                  MS_MENU        as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                     and g.CD_STORE = :P1 '
               +'                                     and d.CD_MENU  = g.CD_MENU '
               +'                                     and Left(g.CD_CLASS,2) = :P4 left outer join '
               +'                  MS_MENU_CLASS  as c on g.CD_HEAD  = c.CD_HEAD '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(g.CD_CLASS,4) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'                                     and Left(c.CD_CLASS,2) = :P4  '
               +'          where   d.CD_HEAD  =:P0 '
               +'            and   d.YMD_SALE between :P2 and :P3 '
               +'          group by SubString(Ifnull(g.CD_CLASS,''''),3,2)) as a '
               +' order by a.CD_CLASS',
               [HeadStoreCode,
                StandardStore,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]])
    else
      OpenQuery('select   Ifnull(a.CD_CLASS,'''') as CD_CLASS, '
               +'         case when Ifnull(a.CD_CLASS,'''') = '''' then ''(상품분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
               +'         a.AMT_DC, '
               +'         a.AMT_SALE, '
               +'         a.RATE_PROFIT, '
               +'         a.AMT_PROFIT, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_MIDDLE '
               +'  from  (select   SubString(Ifnull(m.CD_CLASS,''''),3,2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(s.QTY_SALE) as QTY_SALE, '
               +'                  Sum(s.DC_TOT) as AMT_DC, '
               +'                  Sum(s.AMT_SALE - s.DC_TOT) as AMT_SALE, '
               +'                  Sum(s.AMT_SALE-s.DC_TOT-s.AMT_BUY) as AMT_PROFIT, '
               +'                  GetProfitRate(Sum(s.AMT_BUY), Sum(s.AMT_SALE-s.DC_TOT)) as RATE_PROFIT '
               +'         from    (select g.CD_MENU_HEAD, '
               +'                         d.QTY_SALE, '
               +'                         d.DC_TOT, '
               +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
               +'                         d.AMT_BUY '
               +'                    from SL_SALE_D_SUM  as d inner join '
               +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
               +'                                            and g.CD_STORE = d.CD_STORE '
               +'                                            and d.CD_MENU  = g.CD_MENU '
               +'                   where d.CD_HEAD  =:P0 '
               +'                     and d.YMD_SALE between :P2 and :P3 '
               +'                  ) as s inner join '
               +'                  MS_MENU        as m on m.CD_HEAD  = :P0 '
               +'                                     and m.CD_STORE = :P1 '
               +'                                     and m.CD_MENU  = s.CD_MENU_HEAD inner join '
               +'                                     and Left(m.CD_CLASS,2) = :P4 left outer join '
               +'                  MS_MENU_CLASS  as c on m.CD_HEAD  = c.CD_HEAD '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(m.CD_CLASS,4) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'                                     and Left(c.CD_CLASS,2) = :P4  '
               +'          group by SubString(Ifnull(m.CD_CLASS,''''),3,2)) as a '
               +' order by a.CD_CLASS',
               [HeadStoreCode,
                StandardStore,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]]);

    Result := DM.ReadQuery(Query, GridTableView1);

    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
      if (GridTableView1.DataController.Values[vIndex, GridTableView1SaleAmt.Index] <> null) and
         (GridTableView1.DataController.Summary.FooterSummaryValues[2] <> 0) then
      begin
        GridTableView1.DataController.Values[vIndex, GridTableView1Rate.Index] := RoundNumber(GridTableView1.DataController.Values[vIndex, GridTableView1SaleAmt.Index] * 100 / GridTableView1.DataController.Summary.FooterSummaryValues[2]);
      end;

    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    begin
      vChartXml := vChartXml + Format('<set label="%s" value="%s" />',[GridTableView1.DataController.Values[vIndex, GridTableView1Class.Index], IntToStr(GridTableView1.DataController.Values[vIndex, GridTableView1SaleAmt.Index])]);
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
    LastActiveLevel    := 2;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    if GridTableView1.DataController.GetFocusedRecordIndex < 0 then
    begin
      MsgBox('조회 할 분류를 지정하세요');
      Exit;
    end;

    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   Ifnull(a.CD_CLASS,'''') as CD_CLASS, '
               +'         case when Ifnull(a.CD_CLASS,'''') = '''' then ''(상품분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
               +'         a.AMT_DC, '
               +'         a.AMT_SALE, '
               +'         a.RATE_PROFIT, '
               +'         a.AMT_PROFIT, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_SMALL '
               +'  from  (select   SubString(Ifnull(g.CD_CLASS,''''),5,2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.DC_TOT) as AMT_DC, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'                  Sum(d.AMT_SALE-d.DC_TOT-d.AMT_BUY) as AMT_PROFIT, '
               +'                  GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
               +'           from   SL_SALE_D_SUM as d inner join '
               +'                  MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                    and g.CD_STORE = :P1 '
               +'                                    and d.CD_MENU  = g.CD_MENU '
               +'                                    and Left(g.CD_CLASS,4) = :P4 left outer join '
               +'                  MS_MENU_CLASS as c on g.CD_HEAD  = c.CD_HEAD '
               +'                                    and c.CD_STORE = :P1 '
               +'                                    and Left(g.CD_CLASS,6) = c.CD_CLASS '
               +'                                    and c.CD_CLASS <> '''' and Left(c.CD_CLASS,4) = :P4  '
               +'          where   d.CD_HEAD  =:P0 '
               +'            and   d.YMD_SALE between :P2 and :P3 '
               +'         group by SubString(Ifnull(g.CD_CLASS,''''),5,2)) as a '
               +' order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]
                 +GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleCode.Index]])
    else
       OpenQuery('select   Ifnull(a.CD_CLASS,'''') as CD_CLASS, '
                +'         case when Ifnull(a.CD_CLASS,'''') = '''' then ''(상품분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
                +'         a.QTY_SALE, '
                +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
                +'         a.AMT_DC, '
                +'         a.AMT_SALE, '
                +'         a.RATE_PROFIT, '
                +'         a.AMT_PROFIT, '
                +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_SMALL '
                +'  from  (select   SubString(Ifnull(m.CD_CLASS,''''),5,2) as CD_CLASS, '
                +'                  Max(c.NM_CLASS)    as NM_CLASS, '
                +'                  Sum(s.QTY_SALE) as QTY_SALE, '
                +'                  Sum(s.DC_TOT) as AMT_DC, '
                +'                  Sum(s.AMT_SALE - s.DC_TOT) as AMT_SALE, '
                +'                  Sum(s.AMT_SALE-s.DC_TOT-s.AMT_BUY) as AMT_PROFIT, '
                +'                  GetProfitRate(Sum(s.AMT_BUY), Sum(s.AMT_SALE-s.DC_TOT)) as RATE_PROFIT '
                +'         from    (select g.CD_MENU_HEAD, '
                +'                         d.QTY_SALE, '
                +'                         d.DC_TOT, '
                +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
                +'                         d.AMT_BUY '
                +'                    from SL_SALE_D_SUM  as d inner join '
                +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
                +'                                            and g.CD_STORE = d.CD_STORE '
                +'                                            and d.CD_MENU  = g.CD_MENU '
                +'                   where d.CD_HEAD  =:P0 '
                +'                     and d.YMD_SALE between :P2 and :P3 '
                +'                  ) as s inner join '
                +'                  MS_MENU        as m on m.CD_HEAD  = s.CD_HEAD '
                +'                                     and m.CD_STORE = :P1 '
                +'                                     and m.CD_MENU  = s.CD_MENU_HEAD inner join '
                +'                                    and Left(m.CD_CLASS,4) = :P4 left outer join '
                +'                  MS_MENU_CLASS as c on m.CD_HEAD  = c.CD_HEAD '
                +'                                    and c.CD_STORE = :P1 '
                +'                                    and Left(m.CD_CLASS,6) = c.CD_CLASS '
                +'                                    and c.CD_CLASS <> '''' and Left(c.CD_CLASS,4) = :P4  '
                +'          where   d.CD_HEAD  =:P0 '
                +'            and   d.YMD_SALE between :P2 and :P3 '
                +'         group by SubString(Ifnull(m.CD_CLASS,''''),5,2)) as a '
                +' order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]
                 +GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleCode.Index]]);

    Result := DM.ReadQuery(Query, GridTableView2);

    for vIndex := 0 to GridTableView2.DataController.RecordCount-1 do
      if (GridTableView2.DataController.Values[vIndex, GridTableView2SaleAmt.Index] <> null) and
         (GridTableView2.DataController.Summary.FooterSummaryValues[2] <> 0) then
      begin
        GridTableView2.DataController.Values[vIndex, GridTableView2Rate.Index] := RoundNumber(GridTableView2.DataController.Values[vIndex, GridTableView2SaleAmt.Index] * 100 / GridTableView2.DataController.Summary.FooterSummaryValues[2]);
      end;

    for vIndex := 0 to GridTableView2.DataController.RecordCount-1 do
    begin
      vChartXml := vChartXml + Format('<set label="%s" value="%s" />',[GridTableView2.DataController.Values[vIndex, GridTableView2Class.Index], IntToStr(GridTableView2.DataController.Values[vIndex, GridTableView2SaleAmt.Index])]);
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
    LastActiveLevel    := 3;
  end
  else if Grid.ActiveLevel = GridLevel3 then
  begin
    if GridTableView2.DataController.GetFocusedRecordIndex < 0 then
    begin
      MsgBox('조회 할 분류를 지정하세요');
      Exit;
    end;

    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   Ifnull(a.CD_CLASS,'''') as CD_CLASS, '
               +'         case when Ifnull(a.CD_CLASS,'''') = '''' then ''(상품분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
               +'         a.AMT_DC, '
               +'         a.AMT_SALE, '
               +'         a.RATE_PROFIT, '
               +'         a.AMT_PROFIT, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_SUB '
               +'  from  (select   SubString(Ifnull(g.CD_CLASS,''''),6,2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.DC_TOT) as AMT_DC, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'                  Sum(d.AMT_SALE-d.DC_TOT-d.AMT_BUY) as AMT_PROFIT, '
               +'                  GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
               +'           from   SL_SALE_D_SUM as d inner join '
               +'                  MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                    and g.CD_STORE = :P1 '
               +'                                    and d.CD_MENU  = g.CD_MENU '
               +'                                    and Left(g.CD_CLASS,6) = :P4 left outer join '
               +'                  MS_MENU_CLASS as c on m.CD_HEAD  = c.CD_HEAD '
               +'                                    and c.CD_STORE = :P1 '
               +'                                    and m.CD_CLASS = c.CD_CLASS '
               +'                                    and c.CD_CLASS <> '''' '
               +'                                    and Left(c.CD_CLASS,6) = :P4  '
               +'          where   d.CD_HEAD  =:P0 '
               +'            and   d.CD_STORE =:P1 '
               +'            and   d.YMD_SALE between :P2 and :P3 '
               +'         group by SubString(Ifnull(m.CD_CLASS,''''),6,2)) as a '
               +' order by a.CD_CLASS',
               [HeadStoreCode,
                StandardStore,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]
                +GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleCode.Index]
                +GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SmallCode.Index]])
    else
    OpenQuery('select   Ifnull(a.CD_CLASS,'''') as CD_CLASS, '
             +'         case when Ifnull(a.CD_CLASS,'''') = '''' then ''(상품분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
             +'         a.QTY_SALE, '
             +'         a.AMT_SALE+a.AMT_DC as AMT_TOT, '
             +'         a.AMT_DC, '
             +'         a.AMT_SALE, '
             +'         a.RATE_PROFIT, '
             +'         a.AMT_PROFIT, '
             +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(미지정)'' else Ifnull(a.NM_CLASS,'''') end as NM_SUB '
             +'  from  (select   SubString(Ifnull(m.CD_CLASS,''''),6,2) as CD_CLASS, '
             +'                  Max(c.NM_CLASS)    as NM_CLASS, '
             +'                  Sum(s.QTY_SALE) as QTY_SALE, '
             +'                  Sum(s.DC_TOT) as AMT_DC, '
             +'                  Sum(s.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'                  Sum(s.AMT_SALE-d.DC_TOT-s.AMT_BUY) as AMT_PROFIT, '
             +'                  GetProfitRate(Sum(s.AMT_BUY), Sum(s.AMT_SALE-s.DC_TOT)) as RATE_PROFIT '
             +'         from    (select g.CD_MENU_HEAD, '
             +'                         d.QTY_SALE, '
             +'                         d.DC_TOT, '
             +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
             +'                         d.AMT_BUY '
             +'                    from SL_SALE_D_SUM  as d inner join '
             +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
             +'                                            and g.CD_STORE = d.CD_STORE '
             +'                                            and d.CD_MENU  = g.CD_MENU '
             +'                   where d.CD_HEAD  =:P0 '
             +'                     and d.YMD_SALE between :P2 and :P3 '
             +'                  ) as s inner join '
             +'                  MS_MENU        as m on m.CD_HEAD  = s.CD_HEAD '
             +'                                     and m.CD_STORE = :P1 '
             +'                                     and m.CD_MENU  = s.CD_MENU_HEAD inner join '
             +'                                     and Left(m.CD_CLASS,6) = :P4 left outer join '
             +'                  MS_MENU_CLASS as c on m.CD_HEAD  = c.CD_HEAD '
             +'                                    and c.CD_STORE = :P1 '
             +'                                    and m.CD_CLASS = c.CD_CLASS '
             +'                                    and c.CD_CLASS <> '''' '
             +'                                    and Left(c.CD_CLASS,6) = :P4  '
             +'         group by SubString(Ifnull(m.CD_CLASS,''''),6,2)) as a '
             +' order by a.CD_CLASS',
             [HeadStoreCode,
              StandardStore,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]
              +GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleCode.Index]
              +GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SmallCode.Index]]);

    Result := DM.ReadQuery(Query, GridTableView3);

    for vIndex := 0 to GridTableView3.DataController.RecordCount-1 do
      if (GridTableView3.DataController.Values[vIndex, GridTableView3SaleAmt.Index] <> null) and
         (GridTableView3.DataController.Summary.FooterSummaryValues[2] <> 0) then
      begin
        GridTableView3.DataController.Values[vIndex, GridTableView3Rate.Index] := RoundNumber(GridTableView3.DataController.Values[vIndex, GridTableView3SaleAmt.Index] * 100 / GridTableView3.DataController.Summary.FooterSummaryValues[2]);
      end;

    // 챠트로 표시
    for vIndex := 0 to GridTableView3.DataController.RecordCount-1 do
    begin
      vChartXml := vChartXml + Format('<set label="%s" value="%s" />',[GridTableView3.DataController.Values[vIndex, GridTableView3Class.Index], IntToStr(GridTableView2.DataController.Values[vIndex, GridTableView2SaleAmt.Index])]);
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
    LastActiveLevel    := 4;
  end
  else if Grid.ActiveLevel = GridLevel4 then
  begin

    case LastActiveLevel of
      0 : vCondition := EmptyStr;
      1 :
      begin
        if GridTableView.DataController.GetFocusedRecordIndex < 0 then
        begin
          MsgBox('분류를 지정하세요');
          Exit;
        end;
        vCondition := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index];

        if vCondition = EmptyStr then
          vCondition := 'and g.CD_CLASS = '''' '
        else
          vCondition := Format('and g.CD_CLASS like ''%s'' ', [vCondition+'%']);
      end;
      2 :
      begin
        if (GridTableView.DataController.GetFocusedRecordIndex < 0) or (GridTableView1.DataController.GetFocusedRecordIndex < 0) then
        begin
          MsgBox('분류를 지정하세요');
          Exit;
        end;
        vCondition := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]
                      +GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleCode.Index];
        if vCondition = EmptyStr then
          vCondition := 'and g.CD_CLASS = '''' '
        else
          vCondition := Format('and g.CD_CLASS like ''%s'' ', [vCondition+'%']);
      end;
      3 :
      begin
        if (GridTableView.DataController.GetFocusedRecordIndex < 0) or (GridTableView1.DataController.GetFocusedRecordIndex < 0) or (GridTableView2.DataController.GetFocusedRecordIndex < 0) then
        begin
          MsgBox('분류를 지정하세요');
          Exit;
        end;
        vCondition := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]
                      +GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleCode.Index]
                      +GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SmallCode.Index];
        if vCondition = EmptyStr then
          vCondition := 'and g.CD_CLASS = '''' '
        else
          vCondition := Format('and g.CD_CLASS like ''%s'' ', [vCondition+'%']);
      end;
      4 :
      begin
        if (GridTableView.DataController.GetFocusedRecordIndex < 0) or (GridTableView1.DataController.GetFocusedRecordIndex < 0) or (GridTableView2.DataController.GetFocusedRecordIndex < 0) or (GridTableView3.DataController.GetFocusedRecordIndex < 0) then
        begin
          MsgBox('분류를 지정하세요');
          Exit;
        end;
        vCondition := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeCode.Index]
                      +GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleCode.Index]
                      +GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SmallCode.Index]
                      +GridTableView3.DataController.Values[GridTableView3.DataController.GetFocusedRecordIndex, GridTableView3SubCode.Index];
        if vCondition = EmptyStr then
          vCondition := 'and g.CD_CLASS = '''' '
        else
          vCondition := Format('and g.CD_CLASS like ''%s'' ', [vCondition+'%']);
      end;
    end;

    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   g.CD_MENU, '
               +'         Max(g.NM_MENU) as NM_MENU, '
               +'         Max(g.NM_SPEC) as NM_SPEC, '
               +'         Sum(d.AMT_SALE) as AMT_TOT, '
               +'         Sum(d.QTY_SALE) as QTY_SALE, '
               +'         Sum(d.DC_TOT) as AMT_DC, '
               +'         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'         Sum(d.AMT_SALE-d.DC_TOT-d.AMT_BUY) as AMT_PROFIT, '
               +'         GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
               +'  from   SL_SALE_D_SUM as d  inner join '
               +'         MS_MENU       as g  on d.CD_HEAD = g.CD_HEAD and g.CD_STORE = :P1 and d.CD_MENU = g.CD_MENU '+vCondition
               +' where   d.CD_HEAD  =:P0 '
               +'   and   d.YMD_SALE between :P2 and :P3 '
               +' group by g.CD_MENU '
               +' order by g.CD_MENU',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
    else
      OpenQuery('select   g.CD_MENU, '
               +'         g.NM_MENU, '
               +'         g.NM_SPEC, '
               +'         d.AMT_TOT, '
               +'         d.QTY_SALE, '
               +'         d.AMT_DC, '
               +'         d.AMT_SALE, '
               +'         d.AMT_PROFIT, '
               +'         d.RATE_PROFIT '
               +'  from  ( '
               +'         select   g.CD_MENU_HEAD, '
               +'                  Sum(d.AMT_SALE) as AMT_TOT, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.DC_TOT) as AMT_DC, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'                  Sum(d.AMT_SALE-d.DC_TOT-d.AMT_BUY) as AMT_PROFIT, '
               +'                  GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT '
               +'           from   SL_SALE_D_SUM as d  inner join '
               +'                  MS_MENU       as g  on g.CD_HEAD  = d.CD_HEAD '
               +'                                     and g.CD_STORE = d.CD_STORE '
               +'                                     and g.CD_MENU  = d.CD_MENU '+vCondition
               +'          where   d.CD_HEAD  =:P0 '
               +'            and   d.YMD_SALE between :P2 and :P3 '
               +'          group by g.CD_MENU_HEAD '
               +'         ) as d inner join '
               +'         MS_MENU as g on g.CD_HEAD = :P0 and g.CD_STORE = :P1 and g.CD_MENU = d.CD_MENU_HEAD '
               +' order by g.CD_MENU',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

    Result := DM.ReadQuery(Query, GridTableView4);

    GridTableView4.DataController.BeginUpdate;
    try
      for vIndex := 0 to GridTableView4.DataController.RecordCount-1 do
        if (GridTableView4.DataController.Values[vIndex, GridTableView4SaleAmt.Index] <> null) and
           (GridTableView4.DataController.Summary.FooterSummaryValues[1] <> 0) then
        begin
          GridTableView4.DataController.Values[vIndex, GridTableView4Rate.Index] := RoundNumber(GridTableView4.DataController.Values[vIndex, GridTableView4SaleAmt.Index] * 100 / GridTableView4.DataController.Summary.FooterSummaryValues[1]);
        end;
    finally
      GridTableView4.DataController.EndUpdate;
    end;
  end;
end;

procedure THeadClassSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '대분류별 매출내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    분류명 '+rptpStr+'                   매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView do
    For vIndex := 0 to DataController.FilteredRecordCount-1 do
    begin
        vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewLargeName.Index] ,1,22+(PrintBlank div 2)),27+PrintBlank,' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),15, ' ')+#13;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계    '+rptpStr+ LPad(FormatFloat('#,0',GridTableView.DataController.Summary.FooterSummaryValues[2]),25,' ')+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
    PrintPrinter(vPrintData);
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '중분류별 매출내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  '대 분 류 : '+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeName.Index]+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    분류명 '+rptpStr+'                   매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView1 do
    For vIndex := 0 to DataController.FilteredRecordCount-1 do
    begin
        vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1MiddleName.Index] ,1,22+(PrintBlank div 2)),27+PrintBlank,' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1SaleAmt.Index]),15, ' ')+#13;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계    '+rptpStr+ LPad(FormatFloat('#,0',GridTableView1.DataController.Summary.FooterSummaryValues[2]),25,' ')+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
    PrintPrinter(vPrintData);
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '소분류별 매출내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  '대 분 류 : '+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeName.Index]+#13;
    vPrintData := vPrintData +  '중 분 류 : '+GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleName.Index]+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    분류명 '+rptpStr+'                   매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView2 do
    For vIndex := 0 to DataController.FilteredRecordCount-1 do
    begin
        vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView2SmallName.Index] ,1,22+(PrintBlank div 2)),27+PrintBlank,' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView2SaleAmt.Index]),15, ' ')+#13;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계    '+rptpStr+ LPad(FormatFloat('#,0',GridTableView2.DataController.Summary.FooterSummaryValues[2]),25,' ')+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
    PrintPrinter(vPrintData);
  end
  else if Grid.ActiveLevel = GridLevel3 then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '상세분류별 매출내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  '대 분 류 : '+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeName.Index]+#13;
    vPrintData := vPrintData +  '중 분 류 : '+GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleName.Index]+#13;
    vPrintData := vPrintData +  '소 분 류 : '+GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SmallName.Index]+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    분류명 '+rptpStr+'                   매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView3 do
    For vIndex := 0 to DataController.FilteredRecordCount-1 do
    begin
        vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView3SubName.Index] ,1,22+(PrintBlank div 2)),27+PrintBlank,' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView3SaleAmt.Index]),15, ' ')+#13;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계    '+rptpStr+ LPad(FormatFloat('#,0',GridTableView3.DataController.Summary.FooterSummaryValues[2]),25,' ')+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
    PrintPrinter(vPrintData);
  end
  else if Grid.ActiveLevel = GridLevel4 then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '메뉴별 매출내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    if not GridLevel1.Visible then
      vPrintData := vPrintData +  '분    류 : '+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeName.Index]+#13
    else
      vPrintData := vPrintData +  '대 분 류 : '+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLargeName.Index]+#13;
    if GridLevel2.Visible then
      vPrintData := vPrintData +  '중 분 류 : '+GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1MiddleName.Index]+#13;
    if GridLevel3.Visible then
      vPrintData := vPrintData +  '소 분 류 : '+GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SmallName.Index]+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    메뉴명 '+rptpStr+'               수량        금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView4 do
    For vIndex := 0 to DataController.FilteredRecordCount-1 do
    begin
      if DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView4MenuType.Index] <> 'W' then
      begin
        vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView4MenuName.Index] ,1,16+(PrintBlank div 2)),24+PrintBlank,' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView4SaleQty.Index], 6, ' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView4SaleAmt.Index]),12, ' ')+#13;
      end
      else
      begin
        vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView4MenuName.Index] ,1,16+(PrintBlank div 2)),21+PrintBlank,' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView4SaleQty.Index], 9, ' ')
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView4SaleAmt.Index]),12, ' ')+#13;
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계    '+rptpStr+ LPad(FormatFloat('#,0',GridTableView4.DataController.Summary.FooterSummaryValues[3]),25,' ')+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
    PrintPrinter(vPrintData);
  end;
end;

end.
