unit HeadLetsOrderMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CodeLetsOrderMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxTextEdit, cxCurrencyEdit, cxLabel,
  cxDropDownEdit, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.ExtDlgs, Vcl.Menus, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxMemo, cxImage,
  ToolPanels, cxGridCardView, cxGridCustomLayoutView, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  Vcl.Buttons, AdvPanel;

type
  THeadLetsOrderMenuForm = class(TCodeLetsOrderMenuForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadLetsOrderMenuForm: THeadLetsOrderMenuForm;

implementation

{$R *.dfm}

end.
