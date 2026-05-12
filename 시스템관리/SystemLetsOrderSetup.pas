unit SystemLetsOrderSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SystemSetup, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxBarBuiltInMenu, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxCurrencyEdit, cxLabel, cxTextEdit, cxDropDownEdit,
  cxMemo, Vcl.Menus, cxImageList, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtDlgs,
  FolderDialog, System.ImageList, Vcl.ImgList, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers,
  Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  AdvSmoothCalendar, Vcl.WinXCalendars, AdvSmoothButton, Vcl.StdCtrls,
  CurvyControls, Vcl.WinXCtrls, cxRadioGroup, cxButtons, cxImage,
  cxImageComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGrid, cxTimeEdit, cxScrollBox, dxGDIPlusClasses,
  cxCustomListBox, cxCheckListBox, PosButton, cxGroupBox, cxSpinEdit,
  cxButtonEdit, AdvGroupBox, cxMaskEdit, AdvScrollBox, cxPC, cxCalendar,
  AdvGlowButton;

type
  TSystemLetsOrderSetupForm = class(TSystemSetupForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SystemLetsOrderSetupForm: TSystemLetsOrderSetupForm;

implementation

{$R *.dfm}

procedure TSystemLetsOrderSetupForm.FormCreate(Sender: TObject);
begin
  inherited;
  Pager.ActivePage := LetsOrderPage;
  Pager.HideTabs   := true;
end;

end.
