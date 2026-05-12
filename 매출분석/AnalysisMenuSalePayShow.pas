unit AnalysisMenuSalePayShow;

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
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisMenuSalePayShowForm = class(TInheritShowForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewTrustAmt: TcxGridColumn;
    GridTableViewGiftAmt: TcxGridColumn;
    GridTableViewBankAmt: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1ClassName: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1CardAmt: TcxGridColumn;
    GridTableView1TrustAmt: TcxGridColumn;
    GridTableView1GiftAmt: TcxGridColumn;
    GridTableView1BankAmt: TcxGridColumn;
    GridTableView1ClassCode: TcxGridColumn;
    GridTableView1Column1: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableView1PointAmt: TcxGridColumn;
    GridTableViewPointAmt: TcxGridColumn;
    GridTableView1LetsOrderAmt: TcxGridColumn;
    GridTableViewLetsOrderAmt: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    SelectClass :String;
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisMenuSalePayShowForm: TAnalysisMenuSalePayShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TAnalysisMenuSalePayShowForm }
procedure TAnalysisMenuSalePayShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매출분석/결제수단별매출조회/결제수단별%20매출조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TAnalysisMenuSalePayShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ReportSubTitle := GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1ClassName.Index];
  SelectClass := GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1ClassCode.Index];
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

function TAnalysisMenuSalePayShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select left(m.CD_CLASS,2) as CD_CLASS, '
             +'       Max(c.NM_CLASS)  as NM_CLASS, '
             +'       Sum(s.AMT_SALE)  as AMT_SALE, '
             +'       Sum(s.AMT_CASH)  as AMT_CASH, '
             +'       Sum(s.AMT_CARD)  as AMT_CARD, '
             +'       Sum(s.AMT_LETSORDER)  as AMT_LETSORDER, '
             +'       Sum(s.AMT_TRUST) as AMT_TRUST, '
             +'       Sum(s.AMT_GIFT)  as AMT_GIFT, '
             +'       Sum(s.AMT_BANK)  as AMT_BANK, '
             +'       Sum(s.AMT_POINT) as AMT_POINT '
             +'  from (select a.CD_MENU, '
             +'               a.AMT_SALE, '
             +'               a.QTY_SALE, '
             +'               Ceil(DivFlt(b.AMT_CASH, b.AMT_SALE)  * a.AMT_SALE) as AMT_CASH, '
             +'               Ceil(DivFlt(b.AMT_CARD, b.AMT_SALE)  * a.AMT_SALE) as AMT_CARD, '
             +'               Ceil(DivFlt(b.AMT_LETSORDER, b.AMT_SALE)  * a.AMT_SALE) as AMT_LETSORDER, '
             +'               Ceil(DivFlt(b.AMT_TRUST,b.AMT_SALE)  * a.AMT_SALE) as AMT_TRUST, '
             +'               Ceil(DivFlt(b.AMT_GIFT, b.AMT_SALE)  * a.AMT_SALE) as AMT_GIFT, '
             +'               Ceil(DivFlt(b.AMT_BANK, b.AMT_SALE)  * a.AMT_SALE) as AMT_BANK, '
             +'               Ceil(DivFlt(b.AMT_POINT,b.AMT_SALE)  * a.AMT_SALE) as AMT_POINT '
             +'          from (select YMD_SALE, '
             +'                       NO_POS, '
             +'                       NO_RCP, '
             +'                       CD_MENU, '
             +'                       SUM(QTY_SALE)        as QTY_SALE, '
             +'                       SUM(AMT_SALE-DC_TOT) as AMT_SALE '
             +'                  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'                 where CD_HEAD  =:P0 '
             +'                   and CD_STORE =:P1 '
             +'                   and YMD_SALE between :P2 and :P3 '
             +'                   and DS_SALE <> ''V'' '
             +'                 group by YMD_SALE, NO_POS, NO_RCP, CD_MENU) a inner join '
             +'               (select YMD_SALE, '
             +'                       NO_POS, '
             +'                       NO_RCP, '
             +'                       AMT_SALE, '
             +'                       AMT_CASH+AMT_CHECK as AMT_CASH, '
             +'                       AMT_LETSORDER, '
             +'                       AMT_CARD, '
             +'                       AMT_TRUST, '
             +'                       AMT_GIFT, '
             +'                       AMT_BANK, '
             +'                       AMT_POINT '
             +'                  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
             +'                 where CD_HEAD  =:P0 '
             +'                   and CD_STORE =:P1 '
             +'                   and YMD_SALE between :P2 and :P3 '
             +'                   and DS_SALE <> ''V'' '
             +'                ) b on b.YMD_SALE = a.YMD_SALE and b.NO_POS = a.NO_POS and b.NO_RCP = a.NO_RCP '
             +'       ) as s inner join '
             +'       MS_MENU       as m on m.CD_HEAD = :P0       and m.CD_STORE = :P1 and s.CD_MENU = m.CD_MENU left outer join '
             +'       MS_MENU_CLASS as c on c.CD_HEAD = m.CD_HEAD and c.CD_STORE = m.CD_STORE and c.CD_CLASS = m.CD_CLASS '
             +' group by left(m.CD_CLASS,2) ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select s.CD_MENU, '
             +'       Max(m.NM_MENU) as NM_MENU, '
             +'       GetQty(Max(m.DS_MENU_TYPE), Sum(s.QTY_SALE)) as QTY_SALE, '
             +'       Sum(s.AMT_SALE)  as AMT_SALE, '
             +'       Sum(s.AMT_CASH)  as AMT_CASH, '
             +'       Sum(s.AMT_CARD)  as AMT_CARD, '
             +'       Sum(s.AMT_LETSORDER)  as AMT_LETSORDER, '
             +'       Sum(s.AMT_TRUST) as AMT_TRUST, '
             +'       Sum(s.AMT_GIFT)  as AMT_GIFT, '
             +'       Sum(s.AMT_BANK)  as AMT_BANK, '
             +'       Sum(s.AMT_POINT) as AMT_POINT '
             +'  from (select a.CD_MENU, '
             +'               a.AMT_SALE, '
             +'               a.QTY_SALE, '
             +'               Ceil(DivFlt(b.AMT_CASH, b.AMT_SALE)  * a.AMT_SALE)  as AMT_CASH, '
             +'               Ceil(DivFlt(b.AMT_CARD, b.AMT_SALE)  * a.AMT_SALE)  as AMT_CARD, '
             +'               Ceil(DivFlt(b.AMT_LETSORDER, b.AMT_SALE)  * a.AMT_SALE)  as AMT_LETSORDER, '
             +'               Ceil(DivFlt(b.AMT_TRUST,b.AMT_SALE)  * a.AMT_SALE)  as AMT_TRUST, '
             +'               Ceil(DivFlt(b.AMT_GIFT, b.AMT_SALE)  * a.AMT_SALE)  as AMT_GIFT, '
             +'               Ceil(DivFlt(b.AMT_BANK, b.AMT_SALE)  * a.AMT_SALE)  as AMT_BANK, '
             +'               Ceil(DivFlt(b.AMT_POINT,b.AMT_SALE)  * a.AMT_SALE)  as AMT_POINT '
             +'          from (select YMD_SALE, '
             +'                       NO_POS, '
             +'                       NO_RCP, '
             +'                       CD_MENU, '
             +'                       SUM(QTY_SALE)        as QTY_SALE, '
             +'                       SUM(AMT_SALE-DC_TOT) as AMT_SALE '
             +'                  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'                 where CD_HEAD  =:P0 '
             +'                   and CD_STORE =:P1 '
             +'                   and YMD_SALE between :P2 and :P3 '
             +'                   and DS_SALE <> ''V'' '
             +'                 group by YMD_SALE, NO_POS, NO_RCP, CD_MENU) a inner join '
             +'               (select YMD_SALE, '
             +'                       NO_POS, '
             +'                       NO_RCP, '
             +'                       AMT_SALE, '
             +'                       AMT_CASH+AMT_CHECK as AMT_CASH, '
             +'                       AMT_CARD, '
             +'                       AMT_LETSORDER, '
             +'                       AMT_TRUST, '
             +'                       AMT_GIFT, '
             +'                       AMT_BANK, '
             +'                       AMT_POINT '
             +'                  from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'                 where CD_HEAD  =:P0 '
             +'                   and CD_STORE =:P1 '
             +'                   and YMD_SALE between :P2 and :P3 '
             +'                   and DS_SALE <> ''V'' '
             +'                ) b on b.YMD_SALE = a.YMD_SALE and b.NO_POS = a.NO_POS and b.NO_RCP = a.NO_RCP '
             +'       ) as s inner join '
             +'       MS_MENU as m on m.CD_HEAD =:P0 and m.CD_STORE = :P1 and s.CD_MENU = m.CD_MENU and m.CD_CLASS like :P4 '
             +' group by s.CD_MENU ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               SelectClass+'%']);
    Result := DM.ReadQuery(Query, GridTableView);
    SelectClass := EmptyStr;
  end;
end;



end.
