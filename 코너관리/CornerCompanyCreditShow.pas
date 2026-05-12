unit CornerCompanyCreditShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BuyCompanyCreditShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxLabel, cxCurrencyEdit, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, Menus, ImgList,
  AdvToolBar, AdvToolBarStylers, ExtCtrls, Uni, DB, MemDS,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxMaskEdit, cxCalendar, AdvGlowButton, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, IPPeerClient, System.ImageList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxmdaset;

type
  TCornerCompanyCreditShowForm = class(TBuyCompanyCreditShowForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CornerCompanyCreditShowForm: TCornerCompanyCreditShowForm;

implementation

{$R *.dfm}

procedure TCornerCompanyCreditShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  Tag := 1;
  HelpURL := 'BackOffice/코너관리/코너%20미지급금%20지급조회/코너%20미지급금%20지급조회.htm';
end;

end.
