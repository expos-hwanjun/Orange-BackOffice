unit HeadLogistics;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BuyCompany, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxTextEdit, cxCurrencyEdit, cxMaskEdit, Data.DB,
  dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxMemo,
  cxGroupBox, cxButtonEdit, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxGrid, cxDropDownEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, AdvSmoothButton;

type
  THeadLogisticsForm = class(TBuyCompanyForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadLogisticsForm: THeadLogisticsForm;

implementation

{$R *.dfm}

end.
