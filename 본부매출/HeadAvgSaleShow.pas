unit HeadAvgSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  DBAccess, Uni, cxGridLevel, cxGridCustomView, cxGrid, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  AdvPanel, Vcl.OleCtrls, SHDocVw;

type
  THeadAvgSaleShowForm = class(TInheritGridEditForm)
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewAvgRate: TcxGridColumn;
    GridTableViewStoreCode: TcxGridColumn;
    StorePanel: TAdvPanel;
    LocalPanel: TAdvPanel;
    GridTableViewAvgAmt: TcxGridColumn;
    SaleZonePanel: TAdvPanel;
    procedure FormCreate(Sender: TObject);
    procedure StorePanelResize(Sender: TObject);
    procedure LocalPanelResize(Sender: TObject);
    procedure SaleZonePanelResize(Sender: TObject);
  private
    StoreChart,
    LocalChart,
    SaleZoneChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadAvgSaleShowForm: THeadAvgSaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ THeadAvgSaleShowForm }
function THeadAvgSaleShowForm.DoSearch: Boolean;
var  vIndex: Integer;
     vChartXml :String;
     vAvgAmt :Currency;
begin
  //∏≈√‚¿Ã ¿÷¥¬ ∏≈¿Â∏∏ ¡∂»∏«—¥Ÿ ±◊∑°æﬂ ∆Ú±’¿Ã ∏¬¿Ω
  OpenQuery('select  a.NM_STORE_SHORT, '
           +'        a.CD_STORE, '
           +'        Ifnull(b.AMT_SALE,0)    as AMT_SALE, '
           +'        DivFlt(Ifnull(b.AMT_SALE,0), Ifnull(c.AMT_AVG,0)) * 100 as RATE_AVG, '
           +'        c.AMT_AVG '
           +'  from  MS_STORE as a inner join '
           +'       (select CD_STORE, '
           +'               Sum(AMT_SALE) as AMT_SALE'
           +'         from  SL_SALE_H_SUM  '
           +'        where  CD_HEAD  =:P0 '
           +'          and  YMD_SALE between :P1 and :P2 '
           +'        group by CD_STORE) as b on b.CD_STORE = a.CD_STORE, '
           +'      (select DivFlt(Sum(AMT_SALE), COUNT(DISTINCT CD_STORE)) AS AMT_AVG '
           +'         from  SL_SALE_H_SUM  '
           +'        where  CD_HEAD  =:P0 '
           +'          and  YMD_SALE between :P1 and :P2) as c '
           +' where a.CD_HEAD =:P0 '
           +'   and a.YN_USE  =''Y'' '
           +' order by a.CD_STORE ',
          [HeadStoreCode,
           DtoS(ConditionToolBarFromDateEdit.Date),
           DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
  if Result then
    vAvgAmt := GridTableView.DataController.Values[0, GridTableViewAvgAmt.Index];

  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''∏º¿∫ ∞ÌµÒ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  vChartXml := vChartXml + Format('<trendlines> '
                                 +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="∆Ú±’:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    vChartXml := vChartXml + '<set label="'+GridTableView.DataController.Values[vIndex,0]+'" value="'+FloatToStr(GridTableView.DataController.Values[vIndex,1])+'" />';
  end;
  vChartXml := vChartXml + '</chart>';
  ShowChart(StoreChart, 'StoreChart', 'column3d', vChartXml);

  //¡ˆø™
  OpenQuery('select  Ifnull(t1.NM_CODE1,''πÃ¡ˆ¡§'') as NM_LOCAL, '
           +'        Sum(t2.AMT_SALE) as AMT_SALE, '
           +'        Ifnull(Avg(t2.AMT_SALE),0) as AMT_AVG '
           +'  from  MS_CODE as t1 left outer join '
           +'        (select b.CD_LOCAL, '
           +'                Sum(a.AMT_SALE) as AMT_SALE '
           +'          from  SL_SALE_H_SUM as a inner join  '
           +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +'         where  a.CD_HEAD  =:P0 '
           +'           and  a.YMD_SALE between :P1 and :P2 '
           +'           and  b.YN_USE   =''Y'' '
           +'         group by b.CD_LOCAL '
           +'        ) as t2 on t2.CD_LOCAL = t1.CD_CODE '
           +' where  t1.CD_HEAD  =:P0 '
           +'   and  t1.CD_STORE =:P3 '
           +'   and  t1.CD_KIND  =''01'' '
           +' group by t1.NM_CODE1 ',
          [HeadStoreCode,
           DtoS(ConditionToolBarFromDateEdit.Date),
           DtoS(ConditionToolBarToDateEdit.Date),
           StandardStore]);

  if not Query.Eof then
    vAvgAmt := Query.FieldByName('AMT_AVG').AsCurrency;

  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''∏º¿∫ ∞ÌµÒ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  vChartXml := vChartXml + Format('<trendlines> '
                                 +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="∆Ú±’:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
  if not Query.Eof then
    Query.First;
  while not Query.Eof do
  begin
    vAvgAmt := Query.FieldByName('AMT_AVG').AsCurrency;
    vChartXml := vChartXml + '<set label="'+Query.FieldByName('NM_LOCAL').AsString+'" value="'+FloatToStr(Query.FieldByName('AMT_SALE').AsCurrency)+'" />';
    Query.Next;
  end;
  Query.Close;
  vChartXml := vChartXml + '</chart>';
  ShowChart(LocalChart, 'LocalChart', 'column3d', vChartXml);


  //ªÛ±«
  OpenQuery('select  Ifnull(t1.NM_CODE1,''πÃ¡ˆ¡§'') as NM_SALEZONE, '
           +'        Sum(t2.AMT_SALE) as AMT_SALE, '
           +'        Ifnull(Avg(t2.AMT_SALE),0) as AMT_AVG '
           +'  from  MS_CODE as t1 left outer join '
           +'        (select b.CD_SALEZONE, '
           +'                Sum(a.AMT_SALE) as AMT_SALE '
           +'          from  SL_SALE_H_SUM as a inner join  '
           +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +'         where  a.CD_HEAD  =:P0 '
           +'           and  a.YMD_SALE between :P1 and :P2 '
           +'           and  b.YN_USE   =''Y'' '
           +'         group by b.CD_SALEZONE '
           +'        ) as t2 on t2.CD_SALEZONE = t1.CD_CODE '
           +' where  t1.CD_HEAD  =:P0 '
           +'   and  t1.CD_STORE =:P3 '
           +'   and  t1.CD_KIND  =''03'' '
           +' group by t1.NM_CODE1 ',
          [HeadStoreCode,
           DtoS(ConditionToolBarFromDateEdit.Date),
           DtoS(ConditionToolBarToDateEdit.Date),
           StandardStore]);

  if not Query.Eof then
    vAvgAmt := Query.FieldByName('AMT_AVG').AsCurrency;

  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''∏º¿∫ ∞ÌµÒ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  vChartXml := vChartXml + Format('<trendlines> '
                                 +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="∆Ú±’:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);

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

procedure THeadAvgSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  StoreChart       := TWebBrowser.Create(Self);
  TWinControl(StoreChart).Parent := StorePanel;
  StoreChart.Align := alClient;

  LocalChart       := TWebBrowser.Create(Self);
  TWinControl(LocalChart).Parent := LocalPanel;
  LocalChart.Align := alClient;

  SaleZoneChart       := TWebBrowser.Create(Self);
  TWinControl(SaleZoneChart).Parent := SaleZonePanel;
  SaleZoneChart.Align := alClient;

end;


procedure THeadAvgSaleShowForm.LocalPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(LocalChart) and (LocalChart.Hint <> '') then
    ShowChart(LocalChart, 'LocalChart', 'column3d', LocalChart.Hint);

end;

procedure THeadAvgSaleShowForm.SaleZonePanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(SaleZoneChart) and (SaleZoneChart.Hint <> '') then
    ShowChart(SaleZoneChart, 'SaleZoneChart', 'column3d', SaleZoneChart.Hint);

end;

procedure THeadAvgSaleShowForm.StorePanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(StoreChart) and (StoreChart.Hint <> '') then
    ShowChart(StoreChart, 'StoreChart', 'column3d', StoreChart.Hint);
end;

end.
