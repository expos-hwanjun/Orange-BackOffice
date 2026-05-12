unit HeadMenuSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, cxGridCustomTableView, cxGridTableView,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, cxCurrencyEdit, SHDocVw, AdvPanel,
  StrUtils;

type
  THeadMenuSaleShowForm = class(TInheritGridEditForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    StorePanel: TAdvPanel;
    GridTableViewSaleQty: TcxGridColumn;
    SaleZonePanel: TAdvPanel;
    LocalPanel: TAdvPanel;
    procedure StorePanelResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaleZonePanelResize(Sender: TObject);
    procedure LocalPanelResize(Sender: TObject);
  private
    StoreChart,
    SaleZoneChart,
    LocalChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
    procedure DoGridLink; override;
  end;

var
  HeadMenuSaleShowForm: THeadMenuSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ THeadLocalSaleShowForm }
procedure THeadMenuSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  StoreChart       := TWebBrowser.Create(Self);
  TWinControl(StoreChart).Parent := StorePanel;
  StoreChart.Align := alClient;

  SaleZoneChart       := TWebBrowser.Create(Self);
  TWinControl(SaleZoneChart).Parent := SaleZonePanel;
  SaleZoneChart.Align := alClient;

  LocalChart       := TWebBrowser.Create(Self);
  TWinControl(LocalChart).Parent := LocalPanel;
  LocalChart.Align := alClient;

end;


function THeadMenuSaleShowForm.DoSearch: Boolean;
begin
  //Ç¥ÁØ¸Þ´º »ç¿ë½Ã
  if GetChainHeadOption(2) = '1' then
    OpenQuery('select   d.CD_MENU, '
             +'         Max(g.NM_MENU) as NM_MENU, '
             +'         GetQty(Max(g.DS_MENU_TYPE), Sum(d.QTY_SALE)) as QTY_SALE, '
             +'         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
             +'  from   SL_SALE_D_SUM as d inner join '
             +'         MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
             +'                           and g.CD_STORE = :P1 '
             +'                           and d.CD_MENU  = g.CD_MENU '
             +' where   d.CD_HEAD  =:P0 '
             +'   and   d.YMD_SALE between :P2 and :P3 '
             +'   and  (d.CD_MENU like ConCat(:P4,''%'') or g.NM_MENU like ConCat(''%'',:P4,''%'') ) '
             +' group by d.CD_STORE, d.CD_MENU '
             +' having Sum(d.QTY_SALE) <> 0 '
             +' order by d.CD_MENU',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text])
  else
    OpenQuery('select   h.CD_MENU, '
             +'         Max(h.NM_MENU) as NM_MENU, '
             +'         Sum(s.QTY_SALE) as QTY_SALE, '
             +'         Sum(s.AMT_SALE) as AMT_SALE '
             +'  from   MS_MENU as h inner join '
             +'        ( '
             +'          select   g.CD_MENU_HEAD, '
             +'                   Sum(d.QTY_SALE) as QTY_SALE, '
             +'                   Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
             +'            from   SL_SALE_D_SUM as d inner join '
             +'                   MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
             +'                                     and g.CD_STORE = d.CD_STORE '
             +'                                     and d.CD_MENU  = g.CD_MENU '
             +'           where   d.CD_HEAD  =:P0 '
             +'             and   d.YMD_SALE between :P2 and :P3 '
             +'           group by d.CD_STORE, g.CD_MENU_HEAD '
             +'           having Sum(d.QTY_SALE) <> 0 '
             +'         ) as s on s.CD_MENU_HEAD = h.CD_MENU '
             +' where   h.CD_HEAD  =:P0 '
             +'   and   h.CD_STORE =:P1 '
             +' group by h.CD_MENU '
             +' order by h.CD_MENU',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadMenuSaleShowForm.DoGridLink;
var
 vChartXml : String;
 vCount : Integer;
 vAvgAmt :Currency;
begin
  inherited;
  if GetChainHeadOption(2) = '1' then
    OpenQuery('select  t1.NM_CODE1 as NM_LOCAL, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_LOCAL, '
             +'                Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE '
             +'          from  SL_SALE_D_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +'         where  a.CD_HEAD  =:P0 '
             +'           and  a.YMD_SALE between :P2 and :P3 '
             +'           and  a.CD_MENU = :P4 '
             +'         group by b.CD_LOCAL '
             +'        ) as t2 on t2.CD_LOCAL = t1.CD_CODE '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P1 '
             +'   and  t1.CD_KIND  =''01'' '
             +'   and  t1.DS_STATUS =''0'' '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]])
  else
    OpenQuery('select  t1.NM_CODE1 as NM_LOCAL, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_LOCAL, '
             +'                Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE '
             +'          from  SL_SALE_D_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE inner join '
             +'                MS_MENU       as c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.CD_MENU = a.CD_MENU '
             +'         where  a.CD_HEAD  =:P0 '
             +'           and  a.YMD_SALE between :P2 and :P3 '
             +'           and  c.CD_MENU_HEAD = :P4 '
             +'         group by b.CD_LOCAL '
             +'        ) as t2 on t2.CD_LOCAL = t1.CD_CODE '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P1 '
             +'   and  t1.CD_KIND  =''01'' '
             +'   and  t1.DS_STATUS =''0'' '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);



  if not Query.Eof then
  begin
    vCount := 0;
    while not Query.Eof do
    begin
      if Query.FieldByName('AMT_SALE').AsCurrency > 0 then
        Inc(vCount);
      Query.Next;
    end;

    if vCount = 0 then
      vCount := 1;

    vAvgAmt :=  RoundNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSaleAmt.Index] /  vCount);

    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''¸¼Àº °íµñ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    vChartXml := vChartXml + Format('<trendlines> '
                                   +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="Æò±Õ:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);


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



  if GetChainHeadOption(2) = '1' then
    OpenQuery('select  t1.NM_CODE1 as NM_SALEZONE, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_SALEZONE, '
             +'                Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE '
             +'          from  SL_SALE_D_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +'         where  a.CD_HEAD  =:P0 '
             +'           and  a.YMD_SALE between :P2 and :P3 '
             +'           and  a.CD_MENU = :P4 '
             +'         group by b.CD_SALEZONE '
             +'        ) as t2 on t2.CD_SALEZONE = t1.CD_CODE '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P1 '
             +'   and  t1.CD_KIND  =''03'' '
             +'   and  t1.DS_STATUS =''0'' '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]])
  else
    OpenQuery('select  t1.NM_CODE1 as NM_SALEZONE, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_SALEZONE, '
             +'                Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE '
             +'          from  SL_SALE_D_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE inner join '
             +'                MS_MENU       as c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.CD_MENU = a.CD_MENU '
             +'         where  a.CD_HEAD  =:P0 '
             +'           and  a.YMD_SALE between :P2 and :P3 '
             +'           and  c.CD_MENU_HEAD = :P4 '
             +'         group by b.CD_SALEZONE '
             +'        ) as t2 on t2.CD_SALEZONE = t1.CD_CODE '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P1 '
             +'   and  t1.CD_KIND  =''03'' '
             +'   and  t1.DS_STATUS =''0'' '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);


  if not Query.Eof then
  begin
    vCount := 0;
    while not Query.Eof do
    begin
      if Query.FieldByName('AMT_SALE').AsCurrency > 0 then
        Inc(vCount);
      Query.Next;
    end;

    if vCount = 0 then
      vCount := 1;
    vAvgAmt :=  RoundNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSaleAmt.Index] /  vCount);

    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''¸¼Àº °íµñ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    vChartXml := vChartXml + Format('<trendlines> '
                                   +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="Æò±Õ:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);


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


  if GetChainHeadOption(2) = '1' then
    OpenQuery('select  a.NM_STORE, '
             +'        Ifnull(b.AMT_SALE,0)    as AMT_SALE '
             +'  from  MS_STORE as a inner join '
             +'        (select CD_STORE, '
             +'                Sum(AMT_SALE - DC_TOT) as AMT_SALE '
             +'          from  SL_SALE_D_SUM '
             +'         where  CD_HEAD  =:P0 '
             +'           and  YMD_SALE between :P1 and :P2 '
             +'           and  CD_MENU = :P3 '
             +'         group by CD_STORE '
             +'        ) as b on b.CD_STORE = a.CD_STORE '
             +' where a.CD_HEAD =:P0 '
             +'   and a.YN_USE  =''Y'' '
             +' order by a.CD_STORE ',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDAteEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]])
  else
    OpenQuery('select  a.NM_STORE, '
             +'        Ifnull(b.AMT_SALE,0)    as AMT_SALE '
             +'  from  MS_STORE as a inner join '
             +'        (select a.CD_STORE, '
             +'                Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE '
             +'          from  SL_SALE_D_SUM as a inner join '
             +'                MS_MENU       as b on b.CD_HEAD  = a.CD_HEAD '
             +'                                  and b.CD_STORE = a.CD_STORE '
             +'                                  and b.CD_MENU  = a.CD_MENU '
             +'         where  a.CD_HEAD  =:P0 '
             +'           and  a.YMD_SALE between :P1 and :P2 '
             +'           and  b.CD_MENU_HEAD = :P3 '
             +'         group by a.CD_STORE '
             +'        ) as b on b.CD_STORE = a.CD_STORE '
             +' where a.CD_HEAD =:P0 '
             +'   and a.YN_USE  =''Y'' '
             +' order by a.CD_STORE ',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDAteEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);



  if not Query.Eof then
  begin
    vCount := 0;
    while not Query.Eof do
    begin
      if Query.FieldByName('AMT_SALE').AsCurrency > 0 then
        Inc(vCount);
      Query.Next;
    end;

    if vCount = 0 then
      vCount := 1;

    vAvgAmt :=  RoundNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSaleAmt.Index] /  vCount);
    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''¸¼Àº °íµñ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    vChartXml := vChartXml + Format('<trendlines> '
                                   +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="Æò±Õ:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);


    Query.First;
    while not Query.Eof do
    begin
      vChartXml := vChartXml + '<set label="'+Query.FieldByName('NM_STORE').AsString+'" value="'+FloatToStr(Query.FieldByName('AMT_SALE').AsCurrency)+'" />';
      Query.Next;
    end;
    Query.Close;
    vChartXml := vChartXml + '</chart>';
    ShowChart(StoreChart, 'StoreChart', 'column3d', vChartXml);
  end;
end;

procedure THeadMenuSaleShowForm.SaleZonePanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(SalezoneChart) and (SalezoneChart.Hint <> '') then
    ShowChart(SalezoneChart, 'SalezoneChart', 'column3d', SalezoneChart.Hint);

end;

procedure THeadMenuSaleShowForm.StorePanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(StoreChart) and (StoreChart.Hint <> '') then
    ShowChart(StoreChart, 'StoreChart', 'column3d', StoreChart.Hint);
end;

procedure THeadMenuSaleShowForm.LocalPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(LocalChart) and (LocalChart.Hint <> '') then
    ShowChart(LocalChart, 'LocalChart', 'column3d', LocalChart.Hint);
end;

end.
