unit HeadSaleDayStoreSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HeadSaleStoreSaleShow, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxLabel, cxCurrencyEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, AdvPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadSaleDayStoreSaleShowForm = class(THeadSaleStoreSaleShowForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadSaleDayStoreSaleShowForm: THeadSaleDayStoreSaleShowForm;

implementation

{$R *.dfm}

procedure THeadSaleDayStoreSaleShowForm.FormCreate(Sender: TObject);
begin
  Tag := 2;
  inherited;
  GridTableViewSaleDate.Visible := true;
end;

end.
