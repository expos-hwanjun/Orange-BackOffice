unit CornerCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BuyCompany, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxLabel, cxTextEdit,
  cxGroupBox, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess,
  Uni, Data.DB, MemDS, cxCurrencyEdit, Vcl.StdCtrls, cxButtonEdit, cxMaskEdit,
  cxMemo, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxGrid, cxDropDownEdit, cxCalendar, AdvGlowButton, AdvSplitter, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxmdaset, AdvSmoothButton;

type
  TCornerCompanyForm = class(TBuyCompanyForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CornerCompanyForm: TCornerCompanyForm;

implementation

{$R *.dfm}

end.
