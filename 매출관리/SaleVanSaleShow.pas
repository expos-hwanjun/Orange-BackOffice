unit SaleVanSaleShow;

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
  AdvGlowButton,  AdvSplitter, StrUtils, Vcl.ComCtrls, dxCore, SHDocVw,
  cxDateUtils, cxNavigator, System.ImageList, cxGridBandedTableView,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TSaleVanSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView2: TcxGridTableView;
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewCashRcpAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewRealAmt: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewDutyFreeAmt: TcxGridColumn;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1TaxAmt: TcxGridColumn;
    GridTableView1RealAmt: TcxGridColumn;
    GridTableView2GoodsCode: TcxGridColumn;
    GridTableView2GoodsName: TcxGridColumn;
    GridTableView2SaleQty: TcxGridColumn;
    GridTableView2SaleAmt: TcxGridColumn;
    GridTableView2TaxAmt: TcxGridColumn;
    GridTableView1CompanyCode: TcxGridColumn;
    GridTableViewCardFee: TcxGridColumn;
    GridTableViewCashFee: TcxGridColumn;
    GridTableView1PayAmt: TcxGridColumn;
    GridTableView1CashRcpAmt: TcxGridColumn;
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewUpjangCode: TcxGridBandedColumn;
    GridBandedTableViewUpjangName: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewUpjangCardAmt: TcxGridBandedColumn;
    GridBandedTableViewCashRcpAmt: TcxGridBandedColumn;
    GridBandedTableViewCashAmt: TcxGridBandedColumn;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1SaleDate: TcxGridBandedColumn;
    GridBandedTableView1SaleAmt: TcxGridBandedColumn;
    GridBandedTableView1CardAmt: TcxGridBandedColumn;
    GridBandedTableView1CashRcpAmt: TcxGridBandedColumn;
    GridBandedTableView1CashAmt: TcxGridBandedColumn;
    GridBandedTableViewColumn1: TcxGridBandedColumn;
    GridBandedTableViewColumn2: TcxGridBandedColumn;
    GridBandedTableViewCenterCardAmt: TcxGridBandedColumn;
    GridBandedTableViewCardAmt: TcxGridBandedColumn;
    GridBandedTableViewUpjangCashRcpAmt: TcxGridBandedColumn;
    GridBandedTableViewCenterCashRcpAmt: TcxGridBandedColumn;
    GridBandedTableView1UpjangCardAmt: TcxGridBandedColumn;
    GridBandedTableView1Column2: TcxGridBandedColumn;
    GridBandedTableView1Column3: TcxGridBandedColumn;
    GridBandedTableView1Column4: TcxGridBandedColumn;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView1Column5: TcxGridBandedColumn;
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure GridBandedTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridBandedTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ChartPanelResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FusionChart: TWebBrowser;
    isSelected   : Boolean;
  protected
    function DoSearch:Boolean; override;
    { Public declarations }
  end;

var
  SaleVanSaleShowForm: TSaleVanSaleShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ TInheritShowForm1 }
procedure TSaleVanSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TSaleVanSaleShowForm.FormActivate(Sender: TObject);
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

procedure TSaleVanSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
  isSelected := false;
end;

procedure TSaleVanSaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure TSaleVanSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

function TSaleVanSaleShowForm.DoSearch: Boolean;
var
  vIndex    : Integer;
  vChartXml : String;
  vCondition: String;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   t.CD_TRDPL, '
             +'         Ifnull(t.NM_TRDPL,''[미지정]'') as NM_TRDPL, '
             +'         Ifnull(a.AMT_SALE,0) as AMT_SALE, '
             +'         Ifnull(e.AMT_CARD,0) as AMT_CARD, '
             +'         Ifnull(c.AMT_CARD,0) as AMT_CARD_UPJANG, '
             +'         Ifnull(e.AMT_CARD,0)-Ifnull(c.AMT_CARD,0) as AMT_CARD_CENTER, '
             +'         Ifnull(e.AMT_CASHRCP,0) as AMT_CASHRCP, '
             +'         Ifnull(d.AMT_CASHRCP,0) as AMT_CASHRCP_UPJANG, '
             +'         Ifnull(e.AMT_CASHRCP,0) - Ifnull(e.AMT_CASHRCP,0) as AMT_CASHRCP_CENTER, '
             +'         Ifnull(e.AMT_CASH,0)  as AMT_CASH, '
             +'         Ifnull(a.AMT_NET,0) as AMT_NET, '
             +'         Ifnull(a.AMT_DUTYFREE,0) as AMT_DUTYFREE '
             +'from    MS_TRD as t left outer join  '
             +'       (select   d.CD_STORE, '
             +'                  Ifnull(g.CD_CORNER,'''') as CD_TRDPL, '
             +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'                  Sum(d.DC_TOT)  as AMT_DC_TOT, '
             +'                  Sum(case when g.DS_TAX=''1'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_NET, '
             +'                  Sum(case when g.DS_TAX=''0'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_DUTYFREE '
             +'         from     SL_SALE_D_SUM as d  left outer join '
             +'                  MS_MENU       as g  on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
             +'         where    d.CD_HEAD  = :P0 '
             +'           and    d.CD_STORE = :P1 '
             +'           and    d.YMD_SALE between :P2 and :P3 '
             +'         group by d.CD_STORE, g.CD_CORNER) as a on a.CD_STORE = t.CD_STORE and a.CD_TRDPL = t.CD_TRDPL left outer join '
             +'        (select CD_CORNER, '
             +'                Sum(case DS_TRD  when ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_CARD '
             +'        from '+GetPartitionTable('SL_CARD', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'          where CD_HEAD  =:P0 '
             +'            and CD_STORE =:P1 '
             +'            and YMD_SALE between :P2 and :P3 '
             +'          group by CD_CORNER) as c on c.CD_CORNER = t.CD_TRDPL left outer join '
             +'        (select CD_CORNER, '
             +'                Sum(case DS_TRD  when ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_CASHRCP '
             +'           from SL_CASH    '
             +'          where CD_HEAD  =:P0 '
             +'            and CD_STORE =:P1 '
             +'            and YMD_SALE between :P2 and :P3 '
             +'          group by CD_CORNER) as d on d.CD_CORNER = t.CD_TRDPL left outer join '
             +'         (select t.CD_TRDPL, '
             +'                 Sum(t.AMT_CASH) as AMT_CASH, '
             +'                 Sum(t.AMT_CASHRCP) as AMT_CASHRCP, '
             +'	                Sum(t.AMT_CARD) as AMT_CARD '
             +'            from ( '
             +'                  select d.CD_TRDPL, '
             +'                        (h.AMT_SALE-h.AMT_CARD-h.AMT_CASHRCP) / case when h.AMT_SALE =0 then 1 else h.AMT_SALE end * d.AMT_SALE   as AMT_CASH, '
             +'	                        h.AMT_CASHRCP / case when h.AMT_SALE =0 then 1 else h.AMT_SALE end * d.AMT_SALE   as AMT_CASHRCP, '
             +'	           	          	h.AMT_CARD    / case when h.AMT_SALE =0 then 1 else h.AMT_SALE end * d.AMT_SALE   as AMT_CARD '
             +'                    from ( '
             +'                           select a.YMD_SALE, '
             +'                                  a.NO_POS, '
             +'                                  a.NO_RCP, '
             +'	           	    			           b.CD_CORNER as CD_TRDPL, '
             +'                                  SUM(a.AMT_SALE - a.DC_TOT) as AMT_SALE '
             +'                             from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'	           	    		             MS_MENU   b  on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU '
             +'                            where a.CD_HEAD  =:P0 '
             +'                              and a.CD_STORE =:P1 '
             +'                              and a.YMD_SALE between :P2 and :P3 '
             +'                              and a.DS_SALE <> ''V'' '
             +'                            group by a.YMD_SALE, a.NO_POS, a.NO_RCP, b.CD_CORNER '
             +'                          ) as d inner join '
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
             +'                                          on h.CD_HEAD  =:P0 '
             +'                                         and h.CD_STORE =:P1 '
             +'                                         and h.YMD_SALE = d.YMD_SALE '
             +'                                         and h.NO_POS   = d.NO_POS '
             +'                                         and h.NO_RCP   = d.NO_RCP '
             +'                   )  as t '
             +'            group by t.CD_TRDPL '
             +'           ) as e on e.CD_TRDPL = t.CD_TRDPL '
             +' where t.CD_HEAD  =:P0 '
             +'   and t.CD_STORE =:P1 '
             +'   and t.DS_TRDPL = ''C'' '
             +'   and t.NM_TRDPL like ConCat(''%'',:P4,''%'') '
             +'order by t.CD_TRDPL ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text]);
    Result := DM.ReadQuery(Query, GridBandedTableView);

    // 챠트로 표시
    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
    for vIndex := 0 to GridBandedTableView.DataController.FilteredRecordCount - 1 do
    begin
      if vIndex > 30 then Break;
      vChartXml := vChartXml + '<set label="'+GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FilteredRecordIndex[vIndex],1]+'" value="'+FloatToStr(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FilteredRecordIndex[vIndex],GridBandedTableViewSaleAmt.Index])+'" />'
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select   StoD(a.YMD_SALE) as YMD_SALE, '
             +'         Ifnull(a.AMT_SALE,0) as AMT_SALE, '
             +'         Ifnull(e.AMT_CARD,0) as AMT_CARD, '
             +'         Ifnull(c.AMT_CARD,0) as AMT_CARD_UPJANG, '
             +'         Ifnull(e.AMT_CARD,0)-Ifnull(c.AMT_CARD,0) as AMT_CARD_CENTER, '
             +'         Ifnull(e.AMT_CASHRCP,0) as AMT_CASHRCP, '
             +'         Ifnull(d.AMT_CASHRCP,0) as AMT_CASHRCP_UPJANG, '
             +'         Ifnull(e.AMT_CASHRCP,0) - Ifnull(e.AMT_CASHRCP,0) as AMT_CASHRCP_CENTER, '
             +'         Ifnull(e.AMT_CASH,0) as AMT_CASH, '
             +'         Ifnull(a.AMT_NET,0) as AMT_NET, '
             +'         Ifnull(a.AMT_DUTYFREE,0) as AMT_DUTYFREE '
             +'from    (select   d.YMD_SALE, '
             +'                  g.CD_CORNER as CD_TRDPL, '
             +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'                  Sum(d.DC_TOT)  as AMT_DC_TOT, '
             +'                  Sum(case when g.DS_TAX=''1'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_NET, '
             +'                  Sum(case when g.DS_TAX=''0'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_DUTYFREE '
             +'         from     SL_SALE_D_SUM as d  inner join '
             +'                  MS_MENU       as g  on d.CD_HEAD = g.CD_HEAD and  d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
             +'         where    d.CD_HEAD  =:P0 '
             +'           and    d.CD_STORE =:P1 '
             +'           and    d.YMD_SALE between :P2 and :P3 '
             +'           and    g.CD_CORNER =:P4 '
             +'         group by d.YMD_SALE, g.CD_CORNER) as a left outer join '
             +'        (select CD_CORNER, '
             +'                YMD_SALE, '
             +'                Sum(case DS_TRD  when ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_CARD '
             +'           from '+GetPartitionTable('SL_CARD', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'         where CD_HEAD  =:P0 '
             +'           and CD_STORE =:P1 '
             +'           and YMD_SALE between :P2 and :P3 '
             +'           and CD_CORNER = :P4 '
             +'         group by CD_CORNER, YMD_SALE) as c on c.CD_CORNER = a.CD_TRDPL '
             +'                                           and c.YMD_SALE = a.YMD_SALE left outer join '
             +'        (select CD_CORNER, '
             +'                YMD_SALE, '
             +'                Sum(case DS_TRD  when ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_CASHRCP '
             +'           from SL_CASH '
             +'          where CD_HEAD  =:P0 '
             +'            and CD_STORE =:P1 '
             +'            and YMD_SALE between :P2 and :P3 '
             +'            and CD_CORNER = :P4 '
             +'          group by CD_CORNER, YMD_SALE) as d on d.CD_CORNER = a.CD_TRDPL '
             +'                                            and d.YMD_SALE  = a.YMD_SALE left outer join '
             +'         (select t.CD_TRDPL, '
             +'                 t.YMD_SALE, '
             +'                 Sum(t.AMT_CASH) as AMT_CASH, '
             +'                 Sum(t.AMT_CASHRCP) as AMT_CASHRCP, '
             +'	                Sum(t.AMT_CARD) as AMT_CARD '
             +'            from ( '
             +'                  select d.CD_TRDPL, '
             +'                         d.YMD_SALE, '
             +'                        (h.AMT_SALE-h.AMT_CARD-h.AMT_CASHRCP) / case when h.AMT_SALE =0 then 1 else h.AMT_SALE end * d.AMT_SALE   as AMT_CASH, '
             +'	                        h.AMT_CASHRCP / case when h.AMT_SALE =0 then 1 else h.AMT_SALE end * d.AMT_SALE   as AMT_CASHRCP, '
             +'	           	          	h.AMT_CARD    / case when h.AMT_SALE =0 then 1 else h.AMT_SALE end * d.AMT_SALE   as AMT_CARD '
             +'                    from ( '
             +'                           select a.CD_HEAD, '
             +'                                  a.CD_STORE, '
             +'                                  a.YMD_SALE, '
             +'                                  a.NO_POS, '
             +'                                  a.NO_RCP, '
             +'	           	    			           b.CD_CORNER as CD_TRDPL, '
             +'                                  SUM(a.AMT_SALE - a.DC_TOT) as AMT_SALE '
             +'                             from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'	           	    		             MS_MENU   b  on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU '
             +'                            where a.CD_HEAD  =:P0 '
             +'                              and a.CD_STORE =:P1 '
             +'                              and a.YMD_SALE between :P2 and :P3 '
             +'                              and b.CD_CORNER = :P4 '
             +'                              and a.DS_SALE <> ''V'' '
             +'                            group by a.CD_HEAD, a.CD_STORE, a.YMD_SALE, a.NO_POS, a.NO_RCP, b.CD_CORNER '
             +'                          ) as d inner join '
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'h')
             +'                                          on h.CD_HEAD  = d.CD_HEAD '
             +'                                         and h.CD_STORE = d.CD_STORE '
             +'                                         and h.YMD_SALE = d.YMD_SALE '
             +'                                         and h.NO_POS   = d.NO_POS '
             +'                                         and h.NO_RCP   = d.NO_RCP '
             +'                   )  as t '
             +'            group by t.CD_TRDPL, t.YMD_SALE '
             +'           ) as e on e.CD_TRDPL = a.CD_TRDPL and e.YMD_SALE = a.YMD_SALE '
             +'order by a.YMD_SALE ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             NVL(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewUpjangCode.Index],'')]);
    Result := DM.ReadQuery(Query, GridBandedTableView1);
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
//    ChartPanel.Visible := False;
    if GridBandedTableView.DataController.GetFocusedRecordIndex < 0 then
    begin
      GridBandedTableView1.DataController.RecordCount := 0;
      Exit;
    end;

    //일자별탭에서 더블클릭하지 않고 조회조건 넣고 조회할때
    if not isSelected and (ConditionToolBarEdit.Text <> '') then
      vCondition := 'and (g.CD_MENU = '''+ConditionToolBarEdit.Text+''' or g.NM_MENU like ConCat(''%'','''+ConditionToolBarEdit.Text+''',''%'')) '
    else
      vCondition := EmptyStr;

    OpenQuery('select   d.CD_MENU, '
             +'         Max(g.NM_MENU) as NM_MENU, '
             +'         Sum(d.QTY_SALE) as QTY_SALE, '
             +'         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'         Sum(d.AMT_VAT) as AMT_TAX, '
             +'         Sum(d.DC_TOT)  as AMT_DC '
             +'  from   SL_SALE_D_SUM as d  inner join '
             +'         MS_MENU       as g  on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
             +' where   d.CD_HEAD  =:P0 '
             +'   and   d.CD_STORE =:P1 '
             +'   and   d.YMD_SALE Between :P2 and :P3 '
             +'   and   g.CD_CORNER = :P4 '
             +vCondition
             +'group by d.CD_MENU '
             +'order by d.CD_MENU',
              [HeadStoreCode,
               StoreCode,
               Ifthen(isSelected, GetOnlyNumber(NVL(GridBandedTableView1.DataController.Values[GridBandedTableView1.DataController.GetFocusedRecordIndex, GridBandedTableView1SaleDate.Index],'')), DtoS(ConditionToolBarFromDateEdit.Date)),
               Ifthen(isSelected, GetOnlyNumber(NVL(GridBandedTableView1.DataController.Values[GridBandedTableView1.DataController.GetFocusedRecordIndex, GridBandedTableView1SaleDate.Index],'')), DtoS(ConditionToolBarToDateEdit.Date)),
               NVL(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewUpjangCode.Index],'')]);
    Result := DM.ReadQuery(Query, GridTableView2);
  end;
end;


//기간별 판매 탭에서 더블클릭
procedure TSaleVanSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
end;

//일자별 판매 탭에서 더블클릭
procedure TSaleVanSaleShowForm.GridBandedTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  isSelected := true;
  Grid.ActiveLevel := GridLevel2;
  DoSearch;
  isSelected := false;

end;

procedure TSaleVanSaleShowForm.GridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  isSelected := true;
  GridLevel1.Caption := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewUpjangName.Index ] + ' 일자별 판매 ';
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
  isSelected := false;

end;

end.
