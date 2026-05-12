// POS 마감 조회 (완료)

unit ClosePosCloseShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ImgList, Menus, AdvToolBar, Math,
  AdvToolBarStylers, ExtCtrls, cxContainer, Uni, dxmdaset, MemDS,
  cxGridLevel, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxGridCardView,
  cxGridDBCardView, cxCurrencyEdit, StrUtils, StdCtrls, cxRadioGroup, cxMemo,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxGridCustomLayoutView,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TClosePosCloseShowForm = class(TInheritShow2Form)
    GridDBTableViewCloseDate: TcxGridDBColumn;
    GridDBCardView: TcxGridDBCardView;
    GridDBTableViewPosNo: TcxGridDBColumn;
    GridDBTableViewCashierQty: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewCashAmt: TcxGridDBColumn;
    GridDBTableViewCardAmt: TcxGridDBColumn;
    GridDBTableViewGiftCardAmt: TcxGridDBColumn;
    GridDBTableViewCreditAmt: TcxGridDBColumn;
    GridDBTableViewOverShortAmt: TcxGridDBColumn;
    GridDBTableViewCustomerQty: TcxGridDBColumn;
    GridDBTableViewVoidAmt: TcxGridDBColumn;
    GridDBCardViewCashierName: TcxGridDBCardViewRow;
    GridDBCardViewReserveAmt: TcxGridDBCardViewRow;
    GridDBCardViewDepositAmt: TcxGridDBCardViewRow;
    GridDBCardViewSaleAmt: TcxGridDBCardViewRow;
    GridDBCardViewCashAmt: TcxGridDBCardViewRow;
    GridDBCardViewCardQty: TcxGridDBCardViewRow;
    GridDBCardViewCardAmt: TcxGridDBCardViewRow;
    GridDBCardViewGiftCardAmt: TcxGridDBCardViewRow;
    GridDBCardViewCreditAmt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit50000Amt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit10000Amt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit5000Amt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit1000Amt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit500Amt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit100Amt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit50Amt: TcxGridDBCardViewRow;
    GridDBCardViewDeposit10Amt: TcxGridDBCardViewRow;
    GridDBTableViewCustomerAmt: TcxGridDBColumn;
    GridDBCardViewCashReceiptAmt: TcxGridDBCardViewRow;
    GridDBCardViewVoidAmt: TcxGridDBCardViewRow;
    GridDBCardViewCustomerAmt: TcxGridDBCardViewRow;
    GridDBCardViewDCAmt: TcxGridDBCardViewRow;
    GridDBCardViewModifyAmt: TcxGridDBCardViewRow;
    GridDBCardViewCancelAmt: TcxGridDBCardViewRow;
    GridDBCardViewStatus: TcxGridDBCardViewRow;
    GridDBTableViewStatus: TcxGridDBColumn;
    GridDBTableViewCashReceiptAmt: TcxGridDBColumn;
    GridDBCardViewCustomerQty: TcxGridDBCardViewRow;
    GridDBCardViewLackAmt: TcxGridDBCardViewRow;
    GridDBCardViewCloseAmt: TcxGridDBCardViewRow;
    GridDBCardViewCloseDateTime: TcxGridDBCardViewRow;
    GridDBTableViewOpenTime: TcxGridDBColumn;
    GridDBTableViewCloseTime: TcxGridDBColumn;
    GridDBCardViewAcctInCash: TcxGridDBCardViewRow;
    GridDBCardViewAcctInCard: TcxGridDBCardViewRow;
    GridDBCardViewAcctOut: TcxGridDBCardViewRow;
    GridDBTableViewBankAmt: TcxGridDBColumn;
    GridDBCardViewBankAmt: TcxGridDBCardViewRow;
    GridDBTableViewPointAmt: TcxGridDBColumn;
    GridDBCardViewPointAmt: TcxGridDBCardViewRow;
    GridDBTableViewLetsOrderAmt: TcxGridDBColumn;
    GridDBCardViewLetsOrderAmt: TcxGridDBCardViewRow;
    GridDBCardViewDepositCheckAmt: TcxGridDBCardViewRow;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  ClosePosCloseShowForm: TClosePosCloseShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TClosePosCloseShowForm.FormCreate(Sender: TObject);
var
  vPay  : string;
  vIndex: Integer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TClosePosCloseShowForm.ClearGrid;
begin
  GridDBCardView.DataController.DataSource  := nil;
  GridDBTableView.DataController.DataSource := nil;
end;

procedure TClosePosCloseShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TClosePosCloseShowForm.DoSearch:Boolean;
begin
  inherited;
  OpenQuery('select   StoDW(YMD_CLOSE) as YMD_CLOSE, '
           +'         NO_POS, '
           +'         case when DS_STATUS = ''C'' then ''마감'' else ''개점'' end as DS_STATUS, '
           +'         AMT_SALE, '
           +'         AMT_CASH + AMT_CHECK as AMT_CASH, '
           +'         AMT_CASHRCP, '
           +'         AMT_CARD, '
           +'         AMT_TRUST, '
           +'         AMT_GIFT, '
           +'         AMT_BANK, '
           +'         AMT_LETSORDER, '
           +'         AMT_POINT, '
           +'         AMT_LACK, '
           +'         CNT_CASHIER, '
           +'         CNT_CUSTOMER, '
           +'         Round(AMT_SALE / case when CNT_CUSTOMER = 0 then 1 else CNT_CUSTOMER end, 0) as AMT_CUSTOMER, '
           +'         AMT_BANPUM, '
           +'         AMT_VOID,  '
           +'         DT_INSERT as DT_OPEN, '
           +'         case when DS_STATUS = ''C''then DT_CHANGE else '''' end as DT_CLOSE, '
           +'         ConCat(YMD_CLOSE,NO_POS) as LINK '
           +'  from   SL_POSCLOSE '
           +' where   CD_HEAD   =:P0 '
           +'   and   CD_STORE  =:P1 '
           +'   and   YMD_CLOSE between :P2 and :P3 '
           +' order by YMD_CLOSE, NO_POS',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  OpenQuery('select   ConCat(b.NM_SAWON,''('',a.CD_SAWON,'')'') as NM_SAWON, '
          +'         a.DT_CHANGE, '
          +'         case a.YN_CLOSE when ''Y'' then ''마감'' when ''N'' then '''' end as DS_STATUS, '
          +'         a.AMT_SALE, '
          +'         a.AMT_BANPUM, '
          +'         a.AMT_VOID, '
          +'         a.AMT_READY, '
          +'         a.AMT_MID_CASH, '
          +'         a.AMT_ACCT_CASH, '
          +'         a.AMT_ACCT_CARD, '
          +'         a.AMT_ACCT_OUT, '
          +'         a.AMT_CASH + a.AMT_CASHTIP as AMT_CASH, '
          +'         a.AMT_CASHRCP, '
          +'         a.CNT_CARD, '
          +'         a.AMT_CARD + a.AMT_CARDTIP as AMT_CARD, '
          +'         a.AMT_CHECK, '
          +'         a.AMT_GIFT, '
          +'         a.AMT_BANK, '
          +'         a.AMT_POINT, '
          +'         a.AMT_TRUST, '
          +'         a.AMT_LETSORDER, '
          +'         a.CNT_CUSTOMER, '
          +'         a.AMT_AVERAGE as AMT_CUSTOMER, '
          +'         a._CHECK, '
          +'         a._50000, '
          +'         a._10000, '
          +'         a._5000, '
          +'         a._1000, '
          +'         a._500, '
          +'         a._100, '
          +'         a._50, '
          +'         a._10, '
          +'         a._CHECK+a._50000+a._10000+a._5000+a._1000+a._500+a._100+a._50+a._10 as AMT_CLOSE, '
          +'         a.AMT_LACK, '
          +'         a.DC_MENU + a.DC_SPC + a.DC_MEMBER + a.DC_RECEIPT + a.DC_VAT + a.DC_CUT + a.DC_POINT + a.DC_MEMBER + a.DC_STAMP + a.DC_TAXFREE + a.DC_UPLUS + a.DC_KAKAO + a.DC_LETSORDER as DC_TOT, '
          +'         ConCat(a.YMD_CLOSE,a.NO_POS) as LINK '
          +'from     SL_CASHIER_MGM as a left outer join '
          +'         MS_SAWON       as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
          +'where    a.CD_HEAD   =:P0 '
          +'  and    a.CD_STORE  =:P1 '
          +'  and    a.YMD_CLOSE between :P2 and :P3',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);

  GridDBCardView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, SubMemData);
  GridDBCardView.DataController.DataSource := SubDataSource;

  Result := GridDBTableView.DataController.RecordCount > 0;
  if GridDBTableView.DataController.RecordCount > 0 then
    GridDBTableView.DataController.Summary.FooterSummaryValues[10] := FormatFloat(fmtComma, RoundNumber(Nvl(GridDBTableView.DataController.Summary.FooterSummaryValues[0], 0.0) / IfThen(Nvl(GridDBTableView.DataController.Summary.FooterSummaryValues[9], 0.0) = 0, 1, Nvl(GridDBTableView.DataController.Summary.FooterSummaryValues[9], 0.0))))
  else
    GridDBTableView.DataController.Summary.FooterSummaryValues[10] := 0;
end;

end.
