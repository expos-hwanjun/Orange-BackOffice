unit HeadSaleDaySaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HeadSaleStoreSaleShow, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxCurrencyEdit, cxLabel, IPPeerClient, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvPanel, AdvSplitter;

type
  THeadSaleDaySaleShowForm = class(THeadSaleStoreSaleShowForm)
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadSaleDaySaleShowForm: THeadSaleDaySaleShowForm;

implementation

{$R *.dfm}

procedure THeadSaleDaySaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  isSelected := true;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

end.
