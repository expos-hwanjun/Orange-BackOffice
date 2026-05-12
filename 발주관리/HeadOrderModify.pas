unit HeadOrderModify;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, OrderModify, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxCurrencyEdit, cxLabel, cxTextEdit, cxImageComboBox, cxCalendar,
  Data.DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  frxClass, dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList,
  dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridDBTableView, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxDropDownEdit, cxMaskEdit, AdvGlowButton,
  AdvSplitter;

type
  THeadOrderModifyForm = class(TOrderModifyForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadOrderModifyForm: THeadOrderModifyForm;

implementation

{$R *.dfm}

end.
