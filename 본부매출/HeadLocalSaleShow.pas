unit HeadLocalSaleShow;

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
  THeadLocalSaleShowForm = class(TInheritGridEditForm)
    GridTableViewLocalName: TcxGridColumn;
    GridTableViewStoreCount: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewRate: TcxGridColumn;
    StorePanel: TAdvPanel;
    TimePanel: TAdvPanel;
    GridTableViewLocalCode: TcxGridColumn;
    procedure TimePanelResize(Sender: TObject);
    procedure StorePanelResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    StoreChart,
    TimeChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
    procedure DoGridLink; override;
  end;

var
  HeadLocalSaleShowForm: THeadLocalSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ THeadLocalSaleShowForm }
procedure THeadLocalSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  StoreChart       := TWebBrowser.Create(Self);
  TWinControl(StoreChart).Parent := StorePanel;
  StoreChart.Align := alClient;

  TimeChart       := TWebBrowser.Create(Self);
  TWinControl(TimeChart).Parent := TimePanel;
  TimeChart.Align := alClient;
end;


function THeadLocalSaleShowForm.DoSearch: Boolean;
begin
  //∏≈√‚¿Ã ¿÷¥¬ ∏≈¿Â∏∏ ¡∂»∏«—¥Ÿ ±◊∑°æﬂ ∆Ú±’¿Ã ∏¬¿Ω
  if Tag = 0 then
    OpenQuery('select  t1.NM_CODE1 as NM_LOCAL, '
             +'        t1.CD_CODE as CD_LOCAL, '
             +'        t2.CNT_STORE as CNT_STORE, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE, '
             +'        DivFlt(Ifnull(t2.AMT_SALE,0), Ifnull(t3.AMT_AVG,0)) * 100 as RATE_AVG '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_LOCAL, '
             +'                Count(DISTINCT b.CD_STORE) as CNT_STORE, '
             +'                Sum(a.AMT_SALE) as AMT_SALE '
             +'          from  SL_SALE_H_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +'         where  a.CD_HEAD  =:P0 '
             +'           and  a.YMD_SALE between :P2 and :P3 '
             +'         group by b.CD_LOCAL '
             +'        ) as t2 on t2.CD_LOCAL = t1.CD_CODE, '
             +'        (select DivFlt(Sum(a.AMT_SALE), COUNT(DISTINCT b.CD_LOCAL)) AS AMT_AVG '
             +'          from  SL_SALE_H_SUM  as a inner join  '
             +'                MS_STORE       as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +'          where a.CD_HEAD  =:P0 '
             +'            and a.YMD_SALE between :P2 and :P3) as t3 '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P1 '
             +'   and  t1.CD_KIND  =''01'' '
             +'   and  t1.DS_STATUS =''0'' '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)])
  else
    OpenQuery('select  t1.NM_CODE1 as NM_LOCAL, '
             +'        t1.CD_CODE as CD_LOCAL, '
             +'        t2.CNT_STORE as CNT_STORE, '
             +'        Ifnull(t2.AMT_SALE,0) as AMT_SALE, '
             +'        DivFlt(Ifnull(t2.AMT_SALE,0), Ifnull(t3.AMT_AVG,0)) * 100 as RATE_AVG '
             +'  from  MS_CODE as t1 left outer join '
             +'        (select b.CD_SALEZONE, '
             +'                Count(DISTINCT b.CD_STORE) as CNT_STORE, '
             +'                Sum(a.AMT_SALE) as AMT_SALE '
             +'          from  SL_SALE_H_SUM as a inner join  '
             +'                MS_STORE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +'         where  a.CD_HEAD  =:P0 '
             +'           and  a.YMD_SALE between :P2 and :P3 '
             +'         group by b.CD_SALEZONE '
             +'        ) as t2 on t2.CD_SALEZONE = t1.CD_CODE, '
             +'        (select DivFlt(Sum(a.AMT_SALE), COUNT(DISTINCT b.CD_LOCAL)) AS AMT_AVG '
             +'           from  SL_SALE_H_SUM  as a inner join  '
             +'                 MS_STORE       as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +'          where  a.CD_HEAD  =:P0 '
             +'            and  a.YMD_SALE between :P2 and :P3) as t3 '
             +' where  t1.CD_HEAD  =:P0 '
             +'   and  t1.CD_STORE =:P1 '
             +'   and  t1.CD_KIND  =''03'' '
             +'   and  t1.DS_STATUS =''0'' '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);

  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadLocalSaleShowForm.DoGridLink;
var
 vChartXml : String;
 vIndex : Integer;
 vAvgAmt :Currency;
begin
  inherited;
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
           +'          and  YMD_SALE between :P2 and :P3 '
           +'        group by CD_STORE) as b on b.CD_STORE = a.CD_STORE, '
           +Ifthen(Tag=0,' (select DivFlt(Sum(a.AMT_SALE), COUNT(DISTINCT b.CD_LOCAL)) AS AMT_AVG ',
                         ' (select DivFlt(Sum(a.AMT_SALE), COUNT(DISTINCT b.CD_SALEZONE)) AS AMT_AVG ')
           +'           from  SL_SALE_H_SUM  as a inner join  '
           +'                 MS_STORE       as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +'          where  a.CD_HEAD  =:P0 '
           +Ifthen(Tag=0, ' and b.CD_LOCAL =:P1 ', ' and b.CD_SALEZONE = :P1 ')
           +'            and  a.YMD_SALE between :P2 and :P3) as c '
           +' where a.CD_HEAD =:P0 '
           +Ifthen(Tag=0, ' and a.CD_LOCAL =:P1 ', ' and a.CD_SALEZONE = :P1 ')
           +'   and a.YN_USE  =''Y'' '
           +' order by a.CD_STORE ',
          [HeadStoreCode,
           GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLocalCode.Index],
           DtoS(ConditionToolBarFromDateEdit.Date),
           DtoS(ConditionToolBarToDAteEdit.Date)]);

  if not Query.Eof then
    vAvgAmt := Query.FieldByName('AMT_AVG').AsCurrency
  else
    vAvgAmt := 0;

  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''∏º¿∫ ∞ÌµÒ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  vChartXml := vChartXml + Format('<trendlines> '
                                 +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="∆Ú±’:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
  if not Query.Eof then
    Query.First;
  while not Query.Eof do
  begin
    vChartXml := vChartXml + '<set label="'+Query.FieldByName('NM_STORE_SHORT').AsString+'" value="'+FloatToStr(Query.FieldByName('AMT_SALE').AsCurrency)+'" />';
    Query.Next;
  end;
  Query.Close;
  vChartXml := vChartXml + '</chart>';
  ShowChart(StoreChart, 'StoreChart', 'column3d', vChartXml);


  OpenQuery('select  t1.NM_CODE1 as NM_TIME, '
           +'        Ifnull(t2.AMT_SALE,0)    as AMT_SALE, '
           +'        Ifnull(t3.AMT_AVG,0)    as AMT_AVG '
           +'  from  MS_CODE as t1 left outer join '
           +'       (select a.CD_TIME, '
           +'               Sum(a.AMT_SALE) as AMT_SALE '
           +'          from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
           +'               MS_STORE   b on b.CD_HEAD  = a.CD_HEAD '
           +'                           and b.CD_STORE = a.CD_STORE '
           +Ifthen(Tag=0, 'and b.CD_LOCAL = :P2 ','and b.CD_SALEZONE =:P2 ')
           +'        where  a.CD_HEAD  = :P0 '
           +'          and  a.YMD_SALE between :P3 and :P4 '
           +'        group by a.CD_STORE) as t2 on t2.CD_TIME = t1.CD_CODE, '
           +Ifthen(Tag=0,' (select DivFlt(Sum(a.AMT_SALE), COUNT(DISTINCT b.CD_LOCAL)) AS AMT_AVG ',
                         ' (select DivFlt(Sum(a.AMT_SALE), COUNT(DISTINCT b.CD_SALEZONE)) AS AMT_AVG ')
           +'           from  SL_SALE_H_SUM  as a inner join  '
           +'                 MS_STORE       as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +'          where  a.CD_HEAD  =:P0 '
           +Ifthen(Tag=0, ' and b.CD_LOCAL =:P2 ', ' and b.CD_SALEZONE = :P2 ')
           +'            and  a.YMD_SALE between :P3 and :P4) as t3 '
           +' where t1.CD_HEAD   =:P0 '
           +'   and t1.CD_STORE  =:P1 '
           +'   and t1.CD_KIND   =''15'' '
           +'   and t1.DS_STATUS =''0'' '
           +' order by t1.NM_CODE1 ',
          [HeadStoreCode,
           StandardStore,
           GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLocalCode.Index],
           DtoS(ConditionToolBarFromDateEdit.Date),
           DtoS(ConditionToolBarToDAteEdit.Date)]);

  if not Query.Eof then
    vAvgAmt := Query.FieldByName('AMT_AVG').AsCurrency
  else
    vAvgAmt := 0;

  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''∏º¿∫ ∞ÌµÒ'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  vChartXml := vChartXml + Format('<trendlines> '
                                 +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="∆Ú±’:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
  if not Query.Eof then
    Query.First;
  while not Query.Eof do
  begin
    vChartXml := vChartXml + '<set label="'+Query.FieldByName('NM_TIME').AsString+'" value="'+FloatToStr(Query.FieldByName('AMT_SALE').AsCurrency)+'" />';
    Query.Next;
  end;
  Query.Close;
  vChartXml := vChartXml + '</chart>';
  ShowChart(TimeChart, 'TimeChart', 'column3d', vChartXml);
end;

procedure THeadLocalSaleShowForm.StorePanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(StoreChart) and (StoreChart.Hint <> '') then
    ShowChart(StoreChart, 'StoreChart', 'column3d', StoreChart.Hint);

end;

procedure THeadLocalSaleShowForm.TimePanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(TimeChart) and (TimeChart.Hint <> '') then
    ShowChart(TimeChart, 'TimeChart', 'column3d', TimeChart.Hint);
end;


end.
