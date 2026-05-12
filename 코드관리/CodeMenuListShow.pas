unit CodeMenuListShow;

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
  dxPScxExtEditorProducers, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeMenuListShowForm = class(TInheritShowForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSpec: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridTableViewMenuType: TcxGridColumn;
    GridTableViewSavePoint: TcxGridColumn;
    GridTableViewDcYN: TcxGridColumn;
    GridTableViewClassCode: TcxGridColumn;
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewUseYN: TcxGridColumn;
    GridTableViewKitchenCode: TcxGridColumn;
    GridTableViewStampSave: TcxGridColumn;
    GridTableViewStampUse: TcxGridColumn;
    GridTableViewDoublePrice: TcxGridColumn;
    GridTableViewTipPrice: TcxGridColumn;
    GridTableViewSelectQty: TcxGridColumn;
    GridTableViewMenuNo: TcxGridColumn;
    GridTableViewUsePoint: TcxGridColumn;
    GridTableViewPerson: TcxGridColumn;
    GridTableViewSoldOut: TcxGridColumn;
    GridTableViewPackingPrice: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override;                      // 조회
  end;

var
  CodeMenuListShowForm: TCodeMenuListShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TCodeMenuListShowForm }

function TCodeMenuListShowForm.DoSearch: Boolean;
begin
  OpenQuery('select a.CD_MENU, '
           +'       a.NO_MENU, '
           +'       a.NM_MENU, '
           +'       a.NM_SPEC, '
           +'       case a.DS_MENU_TYPE when ''N'' then ''일반'' when ''G'' then ''싯가'' when ''S'' then ''세트'' when ''O'' then ''오픈세트'' '
           +'                           when ''C'' then ''코스'' when ''I'' then ''아이템'' when ''W'' then ''저울'' when ''P'' then ''그룹'' end as DS_MENU_TYPE, '
           +'       a.QTY_SELECT, '
           +'       a.PR_SALE, '
           +'       a.PR_SALE_DOUBLE, '
           +'       a.PR_TIP, '
           +'       a.PR_SALE_PACKING, '
           +'       a.PR_BUY, '
           +'       case a.DS_TAX when ''0'' then ''면세'' when ''1'' then ''과세'' when ''2'' then ''과세(별도)'' end DS_TAX, '
           +'       case when SubString(a.CONFIG,2,1) = ''Y'' then ''적립''     else ''적립안함'' end as SAVE_POINT, '
           +'       case when SubString(a.CONFIG,9,1) = ''Y'' then ''사용안됨'' else ''사용가능'' end as USE_POINT, '
           +'       SubString(a.CONFIG,1,1) as YN_DC, '
           +'       SubString(a.CONFIG,8,1) as YN_SOLDOUT, '
           +'       a.YN_USE, '
           +'       GetMenuClassName(a.CD_HEAD, a.CD_STORE, a.CD_CLASS) as CD_CLASS, '
           +'       b.NM_TRDPL, '
           +'       a.CD_PRINTER, '
           +'       a.SAVE_STAMP, '
           +'       a.USE_STAMP, '
           +'       SubString(a.CONFIG,4,1) as YN_PERSON '
           +'  from MS_MENU as a left outer join '
           +'       MS_TRD  as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_TRDPL = a.CD_TRDPL '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 ',
           [HeadStoreCode,
            StoreCode]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TCodeMenuListShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode := pmPrintPreviewExcel;
end;

end.
