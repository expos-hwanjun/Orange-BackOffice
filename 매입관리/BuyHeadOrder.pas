unit BuyHeadOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BuyOrder, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxButtonEdit, cxTextEdit, cxCurrencyEdit, frxClass,
  AdvToolBar, AdvToolBarStylers, ExtCtrls, DBAccess, Uni, DB, MemDS,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxMemo, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton;

type
  TBuyHeadOrderForm = class(TBuyOrderForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuyHeadOrderForm: TBuyHeadOrderForm;

implementation

{$R *.dfm}

procedure TBuyHeadOrderForm.FormCreate(Sender: TObject);
begin
  inherited;
  Tag := 1;
end;

end.
