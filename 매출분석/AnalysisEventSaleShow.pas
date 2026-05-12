unit AnalysisEventSaleShow;

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
  dxPScxExtEditorProducers, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisEventSaleShowForm = class(TInheritShowForm)
    GridTableViewEventName: TcxGridColumn;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewTotAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisEventSaleShowForm: TAnalysisEventSaleShowForm;

implementation
uses
  Common, DBModule;
{$R *.dfm}

function TAnalysisEventSaleShowForm.DoSearch: Boolean;
begin
  OpenQuery('select b.NM_SPC as NM_EVENT, '
           +'       StoDW(a.YMD_SALE) as YMD_SALE, '
           +'       a.CD_MENU, '
           +'       Max(c.NM_MENU) as NM_MENU, '
           +'       Ifnull(a.PR_SALE, 0) as PR_SALE, '
           +'       Sum(Ifnull(a.QTY_SALE,0)) as QTY_SALE, '
           +'       Sum(Ifnull(a.AMT_SALE,0)) as AMT_TOT, '
           +'       Sum(Ifnull(a.DC_SPC,0))   as AMT_DC, '
           +'       Sum(Ifnull(a.AMT_SALE-a.DC_TOT,0)) as AMT_SALE, '
           +'       Sum(a.AMT_BUY)  as AMT_BUY, '
           +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE-a.DC_TOT)) as RATE_PROFIT, '
           +'       Sum(a.AMT_SALE - a.DC_TOT - a.AMT_BUY) as AMT_PROFIT '
           +'  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
           +'       MS_SPC_H  b on a.CD_HEAD  = b.CD_HEAD '
           +'                  and a.CD_STORE = b.CD_STORE '
           +'                  and a.NO_SPC   = b.NO_SPC inner join '
           +'       MS_MENU   c on a.CD_HEAD  = c.CD_HEAD '
           +'                  and a.CD_STORE = c.CD_STORE '
           +'                  and a.CD_MENU  = c.CD_MENU '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and a.YMD_SALE BETWEEN :P2 AND :P3 '
           +'   and a.DS_SALE <> ''V'' '
           +'   and a.DC_SPC <> 0 '
           +' group by b.NM_SPC, a.YMD_SALE, a.CD_MENU, a.PR_SALE ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TAnalysisEventSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

end.
