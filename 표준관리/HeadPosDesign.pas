unit HeadPosDesign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SystemPosDesign, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxCurrencyEdit, IPPeerClient, Vcl.Menus,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, Vcl.StdCtrls,
  Vcl.Buttons, AdvPanel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGrid, cxCheckBox, cxButtonEdit, cxSpinEdit, cxGroupBox,
  dxGDIPlusClasses, cxPC, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, dxDockControl, dxCustomTileControl, dxTileControl;

type
  THeadPosDesignForm = class(TSystemPosDesignForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadPosDesignForm: THeadPosDesignForm;

implementation

{$R *.dfm}

end.
