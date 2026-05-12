unit SaleItemSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleItemSaleShowForm = class(TInheritShowForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewMenuType: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleItemSaleShowForm: TSaleItemSaleShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

function TSaleItemSaleShowForm.DoSearch: Boolean;
begin
  OpenQuery('select case a.DS_MENU_TYPE when ''S'' then ''세트'' when ''O'' then ''오픈세트'' when ''C'' then ''코스'' when ''I'' then ''아이템'' end as DS_MENU, '
           +'       a.CD_MENU, '
           +'       Max(b.NM_MENU)  as NM_MENU, '
           +'       Sum(a.QTY_SALE) as QTY_SALE, '
           +'       a.PR_SALE, '
           +'       Sum(a.QTY_SALE) * a.PR_SALE as AMT_SALE '
           +'  from SL_SALE_S a inner join '
           +'       MS_MENU b on a.CD_HEAD  = b.CD_HEAD '
           +'                and a.CD_STORE = b.CD_STORE '
           +'                and a.CD_MENU  = b.CD_MENU '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and a.YMD_SALE between :P2 and :P3 '
           +' group by a.DS_MENU_TYPE, a.CD_MENU, a.PR_SALE '
           +' order by a.CD_MENU ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TSaleItemSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

end.
