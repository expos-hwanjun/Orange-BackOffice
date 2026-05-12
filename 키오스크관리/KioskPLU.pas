unit KioskPLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CodePLU, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxLabel,
  cxCurrencyEdit, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  DBAccess, Uni, Data.DB, MemDS, Vcl.Buttons, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  cxButtons, cxCheckBox, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  PosButton, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, dxBarBuiltInMenu, cxPC, cxImage, Vcl.ExtDlgs,
  AdvSmoothToggleButton, AdvScrollBox, AdvSmoothButton, dxGDIPlusClasses,
  AdvPanel, System.ImageList, Vcl.ImgList, dxDateRanges, dxScrollbarAnnotations,
  cxImageList, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager,
  AdvOfficePagerStylers;

type
  TKioskPLUForm = class(TCodePLUForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KioskPLUForm: TKioskPLUForm;

implementation

{$R *.dfm}

end.
