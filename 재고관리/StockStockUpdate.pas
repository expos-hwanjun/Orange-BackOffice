unit StockStockUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.ExtCtrls, Data.DB, dxmdaset, cxStyles, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, DateUtils, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TStockStockUpdateForm = class(TInheritForm)
    GridPanel2: TGridPanel;
    Panel2: TPanel;
    DailyStockButton: TAdvGlowButton;
    procedure DailyStockButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StockStockUpdateForm: TStockStockUpdateForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TStockStockUpdateForm.DailyStockButtonClick(Sender: TObject);
begin
  inherited;
  if DaysBetween(ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date) > 3 then
  begin
    MsgBox('최대 3일까지만 가능합니다');
    Exit;
  end;

  ExecQuery('delete from SL_STOCK_DAY '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and YMD_STOCK between :P2 and :P3;',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);

  if ExecQuery('insert into SL_STOCK_DAY(CD_HEAD,CD_STORE,YMD_STOCK,CD_GOODS,QTY_BUY,QTY_RETURN,QTY_SALE,QTY_DISUSE,QTY_ADJ) '
              +' select CD_HEAD, '
              +'        CD_STORE, '
              +'        YMD_STOCK, '
              +'        CD_GOODS, '
              +'        SUM(QTY_BUY), '
              +'        SUM(QTY_RETURN), '
              +'        SUM(QTY_SALE), '
              +'        SUM(QTY_DISUSE), '
              +'        SUM(QTY_ADJ) '
              +'  from ( '
              +'        select CD_HEAD, '
              +'               CD_STORE, '
              +'               YMD_BUY as YMD_STOCK, '
              +'               CD_GOODS, '
              +'               ifnull(SUM(QTY_BUY),0) as QTY_BUY, '
              +'               ifnull(SUM(QTY_RETURN),0) as QTY_RETURN, '
              +'               0 as QTY_SALE, '
              +'               0 as QTY_DISUSE, '
              +'               0 as QTY_ADJ '
              +'          from ( '
              +'                select CD_HEAD, '
              +'                       CD_STORE, '
              +'                       YMD_BUY, '
              +'                       CD_GOODS, '
              +'                       case when QTY_BUY > 0 then Cast(QTY_BUY as Int) else 0  end QTY_BUY, '
              +'                       case when QTY_BUY < 0 then Cast(QTY_BUY as Int) else 0  end QTY_RETURN '
              +'                  from SL_BUY_D  '
              +'                 where CD_HEAD  =:P0 '
              +'                   and CD_STORE =:P1 '
              +'                   and YMD_BUY between :P2 and :P3 '
              +'                ) as t '
              +'         group by CD_HEAD, CD_STORE, YMD_BUY, CD_GOODS '
              +'        union all  '
              +'        select CD_HEAD, '
              +'               CD_STORE, '
              +'               YMD_SALE, '
              +'               CD_MENU, '
              +'               0, '
              +'               0, '
              +'               ifnull(SUM(QTY_SALE),0), '
              +'               0, '
              +'               0  '
              +'          from SL_SALE_D_SUM  '
              +'         where CD_HEAD  =:P0 '
              +'           and CD_STORE =:P1 '
              +'           and YMD_SALE between :P2 and :P3 '
              +'         group by CD_HEAD, CD_STORE, YMD_SALE, CD_MENU '
              +'        union all '
              +'        select CD_HEAD, '
              +'               CD_STORE, '
              +'               YMD_DISUSE, '
              +'               CD_GOODS, '
              +'               0, '
              +'               0, '
              +'               0, '
              +'               ifnull(SUM(QTY_DISUSE),0), '
              +'               0  '
              +'          from SL_DISUSE  '
              +'         where CD_HEAD  =:P0 '
              +'           and CD_STORE =:P1 '
              +'           and YMD_DISUSE between :P2 and :P3 '
              +'         group by CD_HEAD, CD_STORE, YMD_DISUSE, CD_GOODS '
              +'        union all '
              +'        select CD_HEAD, '
              +'               CD_STORE, '
              +'               YMD_SILSA, '
              +'               CD_GOODS, '
              +'               0, '
              +'               0, '
              +'               0, '
              +'               0, '
              +'               ifnull(SUM(QTY_SETTLE),0) '
              +'          from SL_SILSA  '
              +'         where CD_HEAD  =:P0 '
              +'           and CD_STORE =:P1 '
              +'           and YMD_SILSA between :P2 and :P3 '
              +'         group by CD_HEAD, CD_STORE, YMD_SILSA, CD_GOODS '
              +'        ) as t '
              +' group by CD_HEAD, CD_STORE, YMD_STOCK, CD_GOODS;',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)],true) then
  MsgBox('재고갱신 작업이 정상 처리되었습니다');
  ConditionToolBarFromDateEdit.Date := IncDay(ConditionToolBarToDateEdit.Date,1);
  ConditionToolBarToDateEdit.Date   := IncDay(ConditionToolBarFromDateEdit.Date,3);
end;

end.
