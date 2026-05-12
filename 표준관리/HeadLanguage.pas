unit HeadLanguage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SystemLanguage, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers,
  cxClasses, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter;

type
  THeadLanguageForm = class(TSystemLanguageForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadLanguageForm: THeadLanguageForm;

implementation

{$R *.dfm}

end.
