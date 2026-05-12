unit CodeLetsOrderQRPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StoreQRPrint, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, frxBarcode, frxClass, Data.DB, Vcl.Menus, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxButtonEdit,
  cxGroupBox, cxRadioGroup, AdvPanel, cxCheckBox, cxCurrencyEdit, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  cxSpinEdit, dxBarBuiltInMenu, Vcl.ExtDlgs, cxImage, cxScrollBox, cxPC,
  frxExportBaseDialog, frxExportPDF, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeLetsOrderQRPrintForm = class(TStoreQRPrintForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodeLetsOrderQRPrintForm: TCodeLetsOrderQRPrintForm;

implementation

{$R *.dfm}

end.
