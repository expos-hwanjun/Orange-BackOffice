unit CodeVanCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BuyCompany, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxTextEdit, cxCurrencyEdit, cxMaskEdit, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxMemo, cxGroupBox, cxButtonEdit, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxCalendar, AdvGlowButton, AdvSplitter, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeVanCompanyForm = class(TBuyCompanyForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodeVanCompanyForm: TCodeVanCompanyForm;

implementation

{$R *.dfm}

end.
