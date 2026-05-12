unit HeadClassByMenuSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AnalysisClassByMenuSaleShow, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxLabel, cxCurrencyEdit,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton;

type
  THeadClassByMenuSaleShowForm = class(TAnalysisClassByMenuSaleShowForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadClassByMenuSaleShowForm: THeadClassByMenuSaleShowForm;

implementation

{$R *.dfm}

end.
