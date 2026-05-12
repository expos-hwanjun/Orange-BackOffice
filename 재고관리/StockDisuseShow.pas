// 재고 폐기 조회 (완료)

unit StockDisuseShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, ExtCtrls, AdvToolBarStylers,
  StdCtrls, cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSPrVwRibbon, DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockDisuseShowForm = class(TInheritShowForm)
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewDisuseQty: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    function DoSearch:Boolean; override;
  end;

var
  StockDisuseShowForm: TStockDisuseShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockDisuseShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/재고관리/재고폐기조회/재고폐기조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TStockDisuseShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockDisuseShowForm.DoSearch:Boolean;
begin
  inherited;
  OpenQuery('select t.NM_TRDPL, '
           +'       d.CD_GOODS, '
           +'       g.NM_MENU as NM_GOODS, '
           +'       g.NM_SPEC, '
           +'       d.QTY_DISUSE, '
           +'       case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then d.QTY_DISUSE * 1000 / 100 else d.QTY_DISUSE end * g.PR_BUY as AMT_BUY, '
           +'       d.REMARK '
           +'  from SL_DISUSE as d left outer join '
           +'       MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_MENU left outer join '
           +'       MS_TRD    as t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
           +' where d.CD_HEAD  =:P0 '
           +'   and d.CD_STORE =:P1 '
           +'   and d.YMD_DISUSE between :P2 and :P3 '
           +' order by t.CD_TRDPL, d.CD_GOODS',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

end.
