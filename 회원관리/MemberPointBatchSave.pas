unit MemberPointBatchSave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MemberPointErase, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxCheckBox,
  cxTextEdit, cxCurrencyEdit, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TMemberPointBatchSaveForm = class(TMemberPointEraseForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberPointBatchSaveForm: TMemberPointBatchSaveForm;

implementation

{$R *.dfm}

procedure TMemberPointBatchSaveForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
//  inherited;

end;

procedure TMemberPointBatchSaveForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // 단축키 처리를 한다
  case Key of
    VK_F2 : ButtonToolBarSearchButton.Click;
    VK_F4 : ButtonToolBarDeleteButton.Click;
    VK_F5 : ButtonToolBarSaveButton.Click;
  end;
end;

end.
