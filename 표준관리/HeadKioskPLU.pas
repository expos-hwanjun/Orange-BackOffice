unit HeadKioskPLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HeadPLU, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxCurrencyEdit, Vcl.Menus, IPPeerClient, Data.DB, MemDS,
  DBAccess, Uni, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, PosButton,
  Vcl.StdCtrls, cxButtons, Vcl.Buttons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxGrid, cxCheckBox, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  dxBarBuiltInMenu, Vcl.ExtDlgs, dxGDIPlusClasses, AdvSmoothToggleButton,
  AdvPanel, AdvScrollBox, cxPC, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadKioskPLUForm = class(THeadPLUForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadKioskPLUForm: THeadKioskPLUForm;

implementation

{$R *.dfm}

end.
