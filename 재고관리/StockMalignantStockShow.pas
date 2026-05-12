// 악성 재고 조회 (완료)

unit StockMalignantStockShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider, DateUtils,
  SQLServerUniProvider, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, ExtCtrls, AdvToolBarStylers,
  StdCtrls, cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters;

type
  TStockMalignantStockShowForm = class(TInheritShowForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    ConditionToolBarMonthEdit: TcxCurrencyEdit;
    ConditionToolBarSaleQtyEdit: TcxCurrencyEdit;
    GridTableViewLastSaleDate: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarSaleQtyEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    procedure DoSearch; override;
  end;

var
  StockMalignantStockShowForm: TStockMalignantStockShowForm;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockMalignantStockShowForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode := pmExcel;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 판매수량에서 키보드를 누를 때
procedure TStockMalignantStockShowForm.ConditionToolBarSaleQtyEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
procedure TStockMalignantStockShowForm.DoSearch;
var
  vStartMonth, vThisMonth: string;
begin
  // 시작월을 구한다(6개월 전이면 6개월 전 월, 그런데 시작월이 그보다 후이면 시작월)
  vStartMonth := FormatDateTime('yyyymm', IncMonth(Date, -(Trunc(ConditionToolBarMonthEdit.Value)-1)));
  OpenQuery('select  Min(YM_STOCK) as YM_STOCK '
           +'from    SL_STOCK_MONTH '
           +'where   CD_STORE = :P0',
            [StoreCode]);
  try
    if Query.Eof or (Query.Fields[0].AsString = EmptyStr) then
    begin
      ErrBox('기초 재고 생성이 되어 있지 않습니다.'#13'[월 마감] 프로그램에서 마감(기초 재고 생성) 후 실행하십시오.');
      FinishQuery;
      Exit;
    end
    else if vStartMonth < Query.Fields[0].AsString then
      vStartMonth := Query.Fields[0].AsString;
  finally
    FinishQuery(false);
  end;
  // 이번달을 구한다
  vThisMonth := FormatDateTime('yyyymm', Date);


  SetQuery('select   t.NM_TRDPL, '
          +'         g.CD_GOODS, '
          +'         g.NM_GOODS, '
          +'         g.NM_SPEC, '
          +'         a.QTY_SALE, '
          +'         a.QTY_STOCK, '
          +'         g.PR_BUY  * a.QTY_STOCK as AMT_BUY, '
          +'         g.PR_SALE * a.QTY_STOCK as AMT_SALE, '
          +'         case when Len(a.YMD_SALE) = 8 then dbo.StoD(a.YMD_SALE) + '' ('' + Convert(varchar, DateDiff(dd, Convert(datetime, a.YMD_SALE, 112), GetDate())) + ''일전)'' else '''' end as YMD_SALE '
          +'from     MS_GOODS as g left outer join '
          +'         MS_TRD   as t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL left outer join '
          +'        (select   CD_STORE, '
          +'                  CD_GOODS, '
          +'                  Sum(QTY_SALE)  as QTY_SALE, '
          +'                  Sum(QTY_STOCK) as QTY_STOCK, '
          +'                  Max(YMD_SALE)  as YMD_SALE '
          +'         from    (select   CD_STORE, '                              // 기간 내에 판매 수량
          +'                           CD_GOODS, '
          +'                           Sum(QTY_SALE) as QTY_SALE, '
          +'                           0 as QTY_STOCK, '
          +'                           Max(YMD_SALE) as YMD_SALE '
          +'                  from     SL_SALE_D '
          +'                  where    CD_STORE = :P0 '
          +'                    and    YMD_SALE between :P1+''01'' and :P2+''31'' '
          +'                    and    DS_SALE  <> ''V'' '
          +'                  group by CD_STORE, CD_GOODS '
          +'                  union all '
          +'                  select   CD_STORE, '                              // 마지막 달의 기초 전산재고
          +'                           CD_GOODS, '
          +'                           0 as QTY_SALE, '
          +'                           QTY_BASE as QTY_STOCK, '
          +'                           '''' as YMD_SALE '
          +'                  from     SL_STOCK_MONTH '
          +'                  where    CD_STORE = :P0 '
          +'                    and    YM_STOCK = :P2 '
          +'                  union all '
          +'                  select   b.CD_STORE, '                            // 마지막 달의 매입수량
          +'                           g.CD_GOODS_T as CD_GOODS, '
          +'                           0 as QTY_SALE, '
          +'                           Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
          +'                           '''' as YMD_SALE '
          +'                  from     SL_BUY_D as b inner join '
          +'                           MS_GOODS as g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
          +'                  where    b.CD_STORE = :P0 '
          +'                    and    b.YMD_BUY between :P2+''01'' and :P2 '
          +'                  group by b.CD_STORE, g.CD_GOODS_T '
          +'                  union all '
          +'                  select   s.CD_STORE, '                            // 마지막 달의 판매수량
          +'                           g.CD_GOODS_T as CD_GOODS, '
          +'                           0 as QTY_SALE, '
          +'                           - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
          +'                           '''' as YMD_SALE '
          +'                  from     SL_SALE_D as s inner join '
          +'                           MS_GOODS  as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
          +'                  where    s.CD_STORE = :P0 '
          +'                    and    s.YMD_SALE between :P2+''01'' and :P2 '
          +'                    and    s.DS_SALE  <> ''V'' '
          +'                  group by s.CD_STORE, g.CD_GOODS_T '
          +'                  union all '
          +'                  select   d.CD_STORE, '                            // 마지막 달의 폐기
          +'                           g.CD_GOODS_T as CD_GOODS, '
          +'                           0 as QTY_SALE, '
          +'                           - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
          +'                           '''' as YMD_SALE '
          +'                  from     SL_DISUSE as d inner join '
          +'                           MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
          +'                  where    d.CD_STORE = :P0 '
          +'                    and    d.YMD_DISUSE between :P2+''01'' and :P2 '
          +'                  group by d.CD_STORE, g.CD_GOODS_T '
          +'                  union all '
          +'                  select   s.CD_STORE, '                            // 마지막 달의 실사 로스수량
          +'                           g.CD_GOODS_T as CD_GOODS, '
          +'                           0 as QTY_SALE, '
          +'                           - Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
          +'                           '''' as YMD_SALE '
          +'                  from     SL_SILSA as s inner join '
          +'                           MS_GOODS as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
          +'                  where    s.CD_STORE = :P0 '
          +'                    and    s.YM_SILSA = :P2 '
          +'                    and    Convert(varchar(8), s.DT_CHANGE, 112) between :P2+''01'' and :P2 '
          +'                    and    s.QTY_SETTLE is not null '
          +'                  group by s.CD_STORE, g.CD_GOODS_T) as stock '
          +'         group by CD_STORE, CD_GOODS) as a on g.CD_STORE = a.CD_STORE and g.CD_GOODS = a.CD_GOODS '
          +'where   (a.QTY_SALE is null  or  a.QTY_SALE  <= :P3) '
//        +'  and    a.QTY_STOCK > 0 '
          +'order by g.CD_GOODS',
           [StoreCode,
            vStartMonth,
            vThisMonth,
            Trunc(ConditionToolBarSaleQtyEdit.Value)]);

  inherited;
end;

end.
