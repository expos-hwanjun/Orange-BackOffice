unit CornerMenuSaleShow;

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
  dxPScxExtEditorProducers, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCornerMenuSaleShowForm = class(TInheritShowForm)
    GridTableViewCorner: TcxGridColumn;
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewTotSaleAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  CornerMenuSaleShowForm: TCornerMenuSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TInheritShowForm1 }
procedure TCornerMenuSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TCornerMenuSaleShowForm.DoSearch: Boolean;
var vIndex  :Integer;
    vCorner :String;
begin
  OpenQuery('select c.NM_TRDPL as NM_CORNER, '
           +'       s.CD_MENU, '
           +'       Max(m.NM_MENU) as NM_MENU, '
           +'       Sum(s.QTY_SALE) as QTY_SALE, '
           +'       Sum(s.AMT_SALE + s.DC_TOT) as AMT_SALE_TOT, '
           +'       Sum(s.DC_TOT) as AMT_DC, '
           +'       Sum(s.AMT_SALE) as AMT_SALE '
           +'  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 's inner join')
           +'       MS_MENU   m on m.CD_HEAD = s.CD_HEAD and m.CD_STORE = s.CD_STORE and m.CD_MENU = s.CD_MENU left outer join '
           +'       MS_TRD    c on c.CD_HEAD = m.CD_HEAD and c.CD_STORE = m.CD_STORE and c.CD_TRDPL = m.CD_CORNER '
           +' where s.CD_HEAD  =:P0 '
           +'   and s.CD_STORE =:P1 '
           +'   and s.DS_SALE  <> ''V'' '
           +'   and s.YMD_SALE Between :P2 and :P3 '
           +' group by c.NM_TRDPL, s.CD_MENU '
           +' order by 1 ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);

  GridTableView.DataController.BeginUpdate;
  vCorner := EmptyStr;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if NVL(GridTableView.DataController.Values[vIndex, GridTableViewCorner.Index],'') = vCorner then
      GridTableView.DataController.Values[vIndex, GridTableViewCorner.Index] := EmptyStr
    else
      vCorner := NVL(GridTableView.DataController.Values[vIndex, GridTableViewCorner.Index],'');
  end;
  GridTableView.DataController.EndUpdate;
end;



end.
