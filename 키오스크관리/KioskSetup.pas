unit KioskSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SystemSetup, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxBarBuiltInMenu, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxLabel, cxMaskEdit,
  IPPeerClient, FolderDialog, System.ImageList, Vcl.ImgList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, AdvPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxButtons, cxImage, cxMemo, cxScrollBox,
  dxGDIPlusClasses, cxCheckListBox, PosButton, cxGroupBox, cxPC, cxSpinEdit,
  cxCurrencyEdit, AdvGlassButton, cxCheckBox, AdvGroupBox, cxButtonEdit,
  AdvOfficePager, cxTextEdit, cxDropDownEdit, cxCalendar, AdvGlowButton,
  PNGImage, Vcl.ExtDlgs, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, cxTimeEdit,
  AdvSmoothButton, Vcl.WinXCalendars, CurvyControls, Vcl.WinXCtrls, AdvScrollBox,
  cxImageComboBox, dxDateRanges, dxScrollbarAnnotations,
  cxImageList, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers,
  cxCustomListBox, AdvSmoothCalendar;

type
  TKioskSetupForm = class(TSystemSetupForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KioskSetupForm: TKioskSetupForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TKioskSetupForm.FormShow(Sender: TObject);
begin
  inherited;
  Pager.ActivePage := PosPage;
  PosPage.PageIndex := 2;
  POSPageControl.ActivePage := KioskTabSheet;
  KioskPager.ActivePageIndex := 0;
  Pager.HideTabs          := true;
  POSPageControl.HideTabs := true;
end;

end.
