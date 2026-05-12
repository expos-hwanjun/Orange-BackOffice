unit CornerCompanyCredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BuyCompanyCredit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxButtonEdit, cxLabel, cxCurrencyEdit, cxMemo,
  AdvToolBar, AdvToolBarStylers, ExtCtrls, Uni, DB, MemDS,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxClasses, cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, DBAccess, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, dxmdaset;

type
  TCornerCompanyCreditForm = class(TBuyCompanyCreditForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CornerCompanyCreditForm: TCornerCompanyCreditForm;

implementation

{$R *.dfm}

procedure TCornerCompanyCreditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Tag := 1;
end;

end.
