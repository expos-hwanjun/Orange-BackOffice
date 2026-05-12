unit SaleTeamSaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore, FusionChart,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, ShockwaveFlashObjects_TLB, AdvSplitter,
  dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk;

type
  TSaleTeamSaleShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    PosSplitter: TAdvSplitter;
    ChartPanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
  private
    FCompanyChart: TFusionChart;
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleTeamSaleShowForm: TSaleTeamSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TSaleTeamSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  DoSearch;
end;

procedure TSaleTeamSaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    Exec_Timer.Enabled := true;
  end;
end;

procedure TSaleTeamSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
  FCompanyChart := TFusionChart.Create(ChartPanel);
  FCompanyChart.Align := alClient;
end;

function TSaleTeamSaleShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vChartXml : String;
begin
  OpenQuery('select t.NM_TEAM, '
           +'       SUM(t.AMT_SALE_TOT) as AMT_SALE_TOT, '
           +'       sum(t.AMT_DC) as  AMT_DC, '
           +'       sum(t.AMT_SALE) as AMT_SALE, '
           +'       sum(t.AMT_BUY) as AMT_BUY, '
           +'       dbo.GetProfitRate(Sum(t.AMT_BUY), Sum(t.AMT_SALE)) as RATE_PROFIT, '
           +'       sum(t.AMT_SALE-t.AMT_BUY) as AMT_PROFIT '
           +'  from ( '
           +'        select Isnull(Max(c.NM_CODE1),''[미지정]'') as NM_TEAM, '
           +'               sum(s.AMT_SALE) as AMT_SALE_TOT, '
           +'               sum(s.DC_TOT) as  AMT_DC, '
           +'               sum(s.AMT_SALE-s.DC_TOT) as AMT_SALE, '
           +'               sum(s.AMT_BUY) as AMT_BUY '
           +'        from   SL_SALE_D_SUM s (nolock) left outer join '
           +'               MS_GOODS      g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS left outer join '
           +'               MS_CODE       c (nolock) on g.CD_STORE = c.CD_STORE and g.CD_TEAM = c.CD_CODE and c.CD_KIND = ''03'' '
           +'        where  s.CD_STORE = :P0 '
           +'          and  s.YMD_SALE between :P1 and :P2 '
           +'        group by g.CD_TEAM '
           +'       ) t '
           +' group by t.NM_TEAM '
           +' order by 1 ',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);

  // 챠트로 표시
  vChartXml := '<graph rotateNames="0" baseFont="굴림" rotateValues="1" placeValuesInside="1" baseFontSize="11"   '
      + ' outCnvBaseFont="굴림" outCnvBaseFontSize="12" caption="부서별 매출" xAxisName=""    '
      + ' yAxisName="" decimalPrecision="0" formatNumberScale="0" >'
      + '';
  for vIndex := 0 to GridTableView.DataController.FilteredRecordCount - 1 do
  begin
    vChartXml := vChartXml + '<set name="'+GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex],0]+'" value="'+FloatToStr(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex],GridTableViewSaleAmt.Index])+'" />'
  end;
  vChartXml := vChartXml + '</graph>';
  FCompanyChart.ChartUrl := 'Column3D.swf';
  FCompanyChart.Draw( vChartXml );
  FCompanyChart.ReDraw;

end;



end.
