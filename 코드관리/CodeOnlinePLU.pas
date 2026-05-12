unit CodeOnlinePLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CodePLU, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxLabel, cxCurrencyEdit, Data.DB, MemDS, DBAccess,
  Uni, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  Vcl.Buttons, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxGrid, cxButtons, cxCheckBox, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter;

type
  TCodeOnlinePLUForm = class(TCodePLUForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodeOnlinePLUForm: TCodeOnlinePLUForm;

implementation

{$R *.dfm}

end.
