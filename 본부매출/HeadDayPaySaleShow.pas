unit HeadDayPaySaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HeadSalePayShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxCurrencyEdit, cxLabel, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers,
  cxClasses, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton;

type
  THeadDayPaySaleShowForm = class(THeadSalePayShowForm)
    GridTableViewSaleDate: TcxGridColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadDayPaySaleShowForm: THeadDayPaySaleShowForm;

implementation

{$R *.dfm}

end.
