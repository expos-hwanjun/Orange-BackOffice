unit AnalysisTimeMenuSaleShow;

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
  dxPScxExtEditorProducers, cxTextEdit, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisTimeMenuSaleShowForm = class(TInheritShowForm)
    GridTableViewTimeZone: TcxGridColumn;
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisTimeMenuSaleShowForm: TAnalysisTimeMenuSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TAnalysisTimeMenuSaleShowForm }

function TAnalysisTimeMenuSaleShowForm.DoSearch: Boolean;
begin
  OpenQuery('select t.NM_CODE1 as TIME_ZONE, '
           +'       s.CD_MENU, '
           +'       m.NM_MENU, '
           +'       s.QTY_SALE, '
           +'       s.AMT_SALE '
           +'  from MS_CODE t left outer join '
           +'      (select h.CD_TIME, '
           +'              d.CD_MENU, '
           +'              SUM(d.QTY_SALE) as QTY_SALE, '
           +'              SUM(d.AMT_SALE-d.DC_TOT) as AMT_SALE '
           +'        from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h inner join')
           +GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd')
           +'                          on d.CD_HEAD  = h.CD_HEAD '
           +'                         and d.CD_STORE = h.CD_STORE '
           +'                         and d.YMD_SALE = h.YMD_SALE '
           +'                         and d.NO_POS   = h.NO_POS '
           +'                         and d.NO_RCP   = h.NO_RCP '
           +'        where h.CD_HEAD  =:P0 '
           +'          and h.CD_STORE =:P1 '
           +'          and h.YMD_SALE between :P2 and :P3 '
           +'          and h.DS_SALE <> ''V'' '
           +'        group by h.CD_TIME, d.CD_MENU '
           +'        ) as s on s.CD_TIME = t.CD_CODE left outer join '
           +'        MS_MENU as m on m.CD_HEAD  = t.CD_HEAD '
           +'                    and m.CD_STORE = t.CD_STORE '
           +'                    and m.CD_MENU  = s.CD_MENU '
           +' where t.CD_HEAD   =:P0 '
           +'   and t.CD_STORE  =:P1 '
           +'   and t.CD_KIND   = ''15'' '
           +'   and t.DS_STATUS = ''0'' '
           +' order by t.CD_CODE, s.AMT_SALE desc ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
  DM.GroupGridTable(GridTableView,
                    GridTableViewTimeZone.Index,
                    GridTableViewMenuName.Index,
                    ' [ 소 계 ] ',
                    [GridTableViewSaleAmt.Index]);
end;

procedure TAnalysisTimeMenuSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TAnalysisTimeMenuSaleShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewMenuName.Index] = ' [ 소 계 ] ' then
    AStyle := StyleFontRed
  else if ARecord.Values[GridTableViewMenuName.Index] = ' [ 합 계 ] ' then
    AStyle := StyleFontRedBold;
end;

end.
