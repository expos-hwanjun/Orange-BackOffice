// 판매 감사자료 조회 (완료)

unit SaleReceiptShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, ExtCtrls, cxContainer, Uni,
  DB, MemDS, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton, cxDBData,
  dxmdaset, cxGridDBTableView, cxGridCardView, cxGridDBCardView, cxCurrencyEdit,
  AdvToolBarStylers, cxCheckBox, StdCtrls, CheckLst, AdvPanel, cxButtonEdit, StrUtils,
  cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, cxGridCustomLayoutView, cxSpinEdit, cxTimeEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  AdvSplitter, cxMemo, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  TSaleReceiptShowForm = class(TInheritShow2Form)
    PayGridLevel: TcxGridLevel;
    CardGridLevel: TcxGridLevel;
    CashReceiptGridLevel: TcxGridLevel;
    MemberGridLevel: TcxGridLevel;
    DCGridLevel: TcxGridLevel;
    PayGridDBCardView: TcxGridDBCardView;
    CardGridDBCardView: TcxGridDBCardView;
    CashReceiptGridDBCardView: TcxGridDBCardView;
    MemberGridDBCardView: TcxGridDBCardView;
    DCGridDBCardView: TcxGridDBCardView;
    GridDBTableViewPosNo: TcxGridDBColumn;
    GridDBTableViewBillNo: TcxGridDBColumn;
    GridDBTableViewType: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewDCAmt: TcxGridDBColumn;
    GridDBTableViewPayType: TcxGridDBColumn;
    GridDBTableViewMemberType: TcxGridDBColumn;
    GridDBTableViewPoint: TcxGridDBColumn;
    GridDBTableViewCashierName: TcxGridDBColumn;
    GridDBTableViewChangeDate: TcxGridDBColumn;
    PayDataSource: TDataSource;
    CardDataSource: TDataSource;
    CashReceiptDataSource: TDataSource;
    MemberDataSource: TDataSource;
    DCDataSource: TDataSource;
    GridSubDBTableViewMenuCode: TcxGridDBColumn;
    GridSubDBTableViewMenuName: TcxGridDBColumn;
    GridSubDBTableViewSalePrice: TcxGridDBColumn;
    GridSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    PayGridDBCardViewCashAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCashReceiptAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCardAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCheckAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCreditAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewGiftCardAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewTipAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewType: TcxGridDBCardViewRow;
    CardGridDBCardViewCardNo: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewHalbu: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalNo: TcxGridDBCardViewRow;
    CardGridDBCardViewCardCompany: TcxGridDBCardViewRow;
    CardGridDBCardViewJoinNo: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewType: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewCustomer: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewCardNo: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewApprovalAmt: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewApprovalNo: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewCorner: TcxGridDBCardViewRow;
    MemberGridDBCardViewMemberNo: TcxGridDBCardViewRow;
    MemberGridDBCardViewMemberName: TcxGridDBCardViewRow;
    MemberGridDBCardViewCardNo: TcxGridDBCardViewRow;
    MemberGridDBCardViewCreditAmt: TcxGridDBCardViewRow;
    MemberGridDBCardViewSavePoint: TcxGridDBCardViewRow;
    MemberGridDBCardViewUsePoint: TcxGridDBCardViewRow;
    DCGridDBCardViewSpcDC: TcxGridDBCardViewRow;
    DCGridDBCardViewMenuDC: TcxGridDBCardViewRow;
    DCGridDBCardViewMemberDC: TcxGridDBCardViewRow;
    DCGridDBCardViewReceiptDC: TcxGridDBCardViewRow;
    DCGridDBCardViewCutDC: TcxGridDBCardViewRow;
    MemberGridDBCardViewTelNo: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalType: TcxGridDBCardViewRow;
    GridSubDBTableViewDCAmt: TcxGridDBColumn;
    DCGridDBCardViewPointDC: TcxGridDBCardViewRow;
    GridSubDBTableViewVatAmt: TcxGridDBColumn;
    GridDBTableViewTotAmt: TcxGridDBColumn;
    GridDBTableViewTable: TcxGridDBColumn;
    GridDBTableViewComeTime: TcxGridDBColumn;
    GridDBTableViewExitTime: TcxGridDBColumn;
    GridDBTableViewStayTime: TcxGridDBColumn;
    GridDBTableViewPerson: TcxGridDBColumn;
    CashReceiptGridDBCardViewApprovalDate: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalDate: TcxGridDBCardViewRow;
    DCGridDBCardViewCodeDcCode: TcxGridDBCardViewRow;
    DCGridDBCardViewCodeDC: TcxGridDBCardViewRow;
    DCGridDBCardViewEventDC: TcxGridDBCardViewRow;
    DCGridDBCardViewVatDC: TcxGridDBCardViewRow;
    PrintGridLevel: TcxGridLevel;
    PrintGridDBCardView: TcxGridDBCardView;
    PrintDataSource: TDataSource;
    CancelDataSource: TDataSource;
    CancelGridLevel: TcxGridLevel;
    CancelGridDBTableView: TcxGridDBTableView;
    PrintGridDBCardViewPrintName: TcxGridDBCardViewRow;
    PrintGridDBCardViewOrderNo: TcxGridDBCardViewRow;
    PrintGridDBCardViewOrderTime: TcxGridDBCardViewRow;
    PrintGridDBCardViewDamDang: TcxGridDBCardViewRow;
    PrintGridDBCardViewPrintTxt: TcxGridDBCardViewRow;
    CancelGridDBTableViewMenuCode: TcxGridDBColumn;
    CancelGridDBTableViewMenuName: TcxGridDBColumn;
    CancelGridDBTableViewCancelQty: TcxGridDBColumn;
    CancelGridDBTableViewFloor: TcxGridDBColumn;
    CancelGridDBTableViewPosNo: TcxGridDBColumn;
    CancelGridDBTableViewTableName: TcxGridDBColumn;
    CancelGridDBTableViewOrderTime: TcxGridDBColumn;
    CancelGridDBTableViewCancelTime: TcxGridDBColumn;
    CancelGridDBTableViewSawon: TcxGridDBColumn;
    CancelGridDBTableViewCancelTxt: TcxGridDBColumn;
    GridDBTableViewDamdang: TcxGridDBColumn;
    PayGridDBCardViewBankAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewTaxAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewTipAmt: TcxGridDBCardViewRow;
    DCGridDBCardViewKaKaoDc: TcxGridDBCardViewRow;
    PayGridDBCardViewPointAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewCorner: TcxGridDBCardViewRow;
    ConditionPanel: TAdvPanel;
    Label4: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    ConditionDeliveryCheckBox: TcxCheckBox;
    ConditionSawonComboBox: TcxComboBox;
    ConditionPosComboBox: TcxComboBox;
    ConditionFromTimeEdit: TcxTimeEdit;
    ConditionToTimeEdit: TcxTimeEdit;
    ConditionAcctTypeComboBox: TcxComboBox;
    ConditionSaleTypeComboBox: TcxComboBox;
    ConditionSaleTargetComboBox: TcxComboBox;
    ConditionGoodsCodeEdit: TcxTextEdit;
    GridDBTableViewOrgRcp: TcxGridDBColumn;
    GridDBTableViewWhyCancel: TcxGridDBColumn;
    DCGridDBCardViewCouponDC: TcxGridDBCardViewRow;
    GridDBTableViewCashAmt: TcxGridDBColumn;
    GridDBTableViewCardAmt: TcxGridDBColumn;
    GridDBTableViewTrustAmt: TcxGridDBColumn;
    GridDBTableViewPointAmt: TcxGridDBColumn;
    GridDBTableViewBankAmt: TcxGridDBColumn;
    GridDBTableViewGiftAmt: TcxGridDBColumn;
    GridDBTableViewServiceAmt: TcxGridDBColumn;
    DCGridDBCardViewStampDc: TcxGridDBCardViewRow;
    DCGridDBCardViewTaxFreeDc: TcxGridDBCardViewRow;
    GridSubDBTableViewSaveStamp: TcxGridDBColumn;
    GridSubDBTableViewUseStamp: TcxGridDBColumn;
    GridDBTableViewStamp: TcxGridDBColumn;
    DCGridDBCardViewUPlusDC: TcxGridDBCardViewRow;
    CardGridDBCardViewDcAmt: TcxGridDBCardViewRow;
    ListGrid: TcxGrid;
    ListGridTableView: TcxGridTableView;
    ListGridTableViewSaleDate: TcxGridColumn;
    ListGridTableViewYmdBuy: TcxGridColumn;
    ListGridLevel: TcxGridLevel;
    GridSplitter: TAdvSplitter;
    DCGridDBCardViewLetsOrderDc: TcxGridDBCardViewRow;
    GridDBTableViewLetsOrderAmt: TcxGridDBColumn;
    LetsOrderSyncGridLevel: TcxGridLevel;
    LetsOrderSyncDBCardView: TcxGridDBCardView;
    LetsOrderSyncDBCardViewOrderTime: TcxGridDBCardViewRow;
    LetsOrderSyncDBCardViewOrderTelNo: TcxGridDBCardViewRow;
    LetsOrderSyncDBCardViewOrderMenu: TcxGridDBCardViewRow;
    LetsOrderSyncDBCardViewOrderNo: TcxGridDBCardViewRow;
    LetsOrderSyncDataSource: TDataSource;
    StyleLetsOrderSync: TcxStyle;
    PayGridDBCardViewLetsOrderAmt: TcxGridDBCardViewRow;
    GridDBTableViewLetsOrder: TcxGridDBColumn;
    CardGridDBCardViewCardName: TcxGridDBCardViewRow;
    GridDBTableViewDeliveryNo: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure GridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridDBTableViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure ListGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    PayMemData,
    CardMemData,
    CashReceiptMemData,
    MemberMemData,
    DCMemData,
    PrintMemData,
    CancelMemData,
    LetsOrderSyncMemData : TdxMemData;
    procedure SetFooterSummary;
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  SaleReceiptShowForm: TSaleReceiptShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSaleReceiptShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TSaleReceiptShowForm.FormActivate(Sender: TObject);
var
  vIndex: Integer;
  vCode : PStrPointer;
begin
  inherited;
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    if FormParam[1] <> EmptyStr then
      ConditionPosComboBox.ItemIndex := GetStrPointerIndex(ConditionPosComboBox, FormParam[1]);

    ConditionToolBarEdit.Text := FormParam[2];
    FormParam[0] := EmptyStr;
    FormParam[1] := EmptyStr;
    FormParam[2] := EmptyStr;
    Exec_Timer.Enabled := True;
  end;

end;

procedure TSaleReceiptShowForm.FormCreate(Sender: TObject);
var
  vCodeData: PStrPointer;
begin
  inherited;
  PayMemData             := TdxMemData.Create(Self);
  PayDataSource.DataSet  := PayMemData;
  CardMemData            := TdxMemData.Create(Self);
  CardDataSource.DataSet := CardMemData;
  CashReceiptMemData      := TdxMemData.Create(Self);
  CashReceiptDataSource.DataSet := CashReceiptMemData;
  MemberMemData             := TdxMemData.Create(Self);
  MemberDataSource.DataSet  :=  MemberMemData;
  DCMemData                 := TdxMemData.Create(Self);
  DCDataSource.DataSet      := DCMemData;
  PrintMemData              := TdxMemData.Create(Self);
  PrintDataSource.DataSet   := PrintMemData;
  CancelMemData             := TdxMemData.Create(Self);
  CancelDataSource.DataSet  := CancelMemData;
  LetsOrderSyncMemData             := TdxMemData.Create(Self);
  LetsOrderSyncDataSource.DataSet  := LetsOrderSyncMemData;

  PrintMode   := pmPreviewExcel;

  if GetOption(249) = '0' then
    CardGridDBCardViewCorner.Visible := false;

  if GetOption(60) = '0' then
    CardGridDBCardViewCorner.Visible := false;

  // POS 목록을 불러온다
  OpenQuery('select   NM_CODE1 as NO_POS '
           +'from     MS_CODE '
           +'where    CD_HEAD   = :P0 '
           +'  and    CD_STORE  = :P1 '
           +'  and    CD_KIND   = ''01'' '
           +'  and    DS_STATUS = ''0'' '
           +'  and    NM_CODE3 in (''0'',''2'',''7'') '
           +'order by CD_KIND, CD_CODE',
            [HeadStoreCode,
             StoreCode]);

  New(vCodeData);
  vCodeData^.Data := EmptyStr;
  ConditionPosComboBox.Properties.Items.AddObject('[전체]', TObject(vCodeData));


  try
    while not Query.Eof do
    begin
      New(vCodeData);
      vCodeData^.Data := Query.Fields[0].AsString;
      ConditionPosComboBox.Properties.Items.AddObject(Query.Fields[0].AsString, TObject(vCodeData));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  ConditionPosComboBox.ItemIndex := 0;

  // 사원(계산원) 목록을 불러와 조건 콤보박스에 넣는다
  New(vCodeData);
  vCodeData^.Data := EmptyStr;
  ConditionSawonComboBox.Properties.Items.AddObject('[전체 계산원]',  TObject(vCodeData));
  OpenQuery('select   CD_SAWON, '
           +'         ConCat(NM_SAWON,''('',CD_SAWON,'')'') as NM_SAWON '
           +'from     MS_SAWON '
           +'where    CD_HEAD  = :P0 '
           +'  and    CD_STORE = :P1 '
           +'  and    YN_USE = ''Y'' '
           +'  and    CD_SAWON <> ''master'' '
           +'order by CD_SAWON',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCodeData);
      vCodeData^.Data := Query.Fields[0].AsString;
      ConditionSawonComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCodeData));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionSawonComboBox.ItemIndex := 0;


  // 판매구분 조건 콤보박스 초기화
  New(vCodeData);
  vCodeData^.Data := EmptyStr;
  ConditionSaleTypeComboBox.Properties.Items.AddObject('[전체]',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := 'S';
  ConditionSaleTypeComboBox.Properties.Items.AddObject('[판매]',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := 'B';
  ConditionSaleTypeComboBox.Properties.Items.AddObject('[반품]',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := 'V';
  ConditionSaleTypeComboBox.Properties.Items.AddObject('[판매취소]',  TObject(vCodeData));
  ConditionSaleTypeComboBox.ItemIndex := 0;

  // 결제수단
  New(vCodeData);
  vCodeData^.Data := '0';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('[전체]',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := '1';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('현금',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := '2';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('신용카드',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := '3';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('현금영수증',  TObject(vCodeData));
  if GetStoreOption(9) = '1' then
  begin
    New(vCodeData);
    vCodeData^.Data := '4';
    ConditionAcctTypeComboBox.Properties.Items.AddObject('렛츠오더',  TObject(vCodeData));
  end;
  New(vCodeData);
  vCodeData^.Data := '5';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('외상',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := '6';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('상품권',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := '7';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('포인트',  TObject(vCodeData));
  New(vCodeData);
  vCodeData^.Data := '8';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('계좌이체',  TObject(vCodeData));
  ConditionAcctTypeComboBox.ItemIndex := 0;

end;

procedure TSaleReceiptShowForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//푸터금액 다시계산
procedure TSaleReceiptShowForm.GridDBTableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  inherited;
  SetFooterSummary;
end;

procedure TSaleReceiptShowForm.GridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridDBTableView.DataController.RecordCount = 0 then Exit;

//  if GridDBTableViewType.Index > 3 then Exit;

  if ARecord.Values[GridDBTableViewType.Index] = '취소' then AStyle := StyleFontRed
  else if ARecord.Values[GridDBTableViewType.Index] = '반품' then AStyle := StyleFontBlue;

end;

procedure TSaleReceiptShowForm.ListGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vPosNo,
  vSawonCode,
  vSaleType,
  vAcctType,
  vSaleTime,
  vDelivery,
  vTarget,
  vRcpNo,
  vCardNo,
  vGoods : string;
  vIndex    : Integer;
  vCode     : PStrPointer;
  vSaleDate : String;
begin
  inherited;
  if isLoading then Exit;

  if ConditionToolBarEdit.Text <> EmptyStr then
  begin
    vRcpNo := Format('and h.NO_RCP = ''%s'' ', [LPad(ConditionToolBarEdit.Text,4,'0')]);
    ConditionToolBarEdit.Text := LPad(ConditionToolBarEdit.Text,4,'0');
  end;

  vPosNo     := Ifthen(ConditionPosComboBox.ItemIndex      = 0, '', Format('and h.NO_POS   = ''%s'' ', [GetStrPointerData(ConditionPosComboBox)]));
  vSawonCode := Ifthen(ConditionSawonComboBox.ItemIndex    = 0, '', Format('and h.CD_SAWON = ''%s'' ', [GetStrPointerData(ConditionSawonComboBox)]));
  vSaleType  := Ifthen(ConditionSaleTypeComboBox.ItemIndex = 0, '', Format('and h.DS_SALE  = ''%s'' ', [GetStrPointerData(ConditionSaleTypeComboBox)]));

  case  StrToInt(GetStrPointerData(ConditionAcctTypeComboBox)) of
    0 : vAcctType := EmptyStr;
    1 : vAcctType := 'and h.AMT_CASH    <> 0 ';
    2 : vAcctType := 'and h.AMT_CARD    <> 0 ';
    3 : vAcctType := 'and h.AMT_CASHRCP <> 0 ';
    4 : vAcctType := 'and h.AMT_LETSORDER <> 0 ';
    5 : vAcctType := 'and h.AMT_TRUST   <> 0 ';
    6 : vAcctType := 'and h.AMT_GIFT    <> 0 ';
    7 : vAcctType := 'and h.AMT_POINT   <> 0 ';
    8 : vAcctType := 'and h.AMT_BANK    <> 0 ';
  end;

  if ConditionFromTimeEdit.Time > 0 then
    vSaleTime := Format('and Date_Format(h.DT_SALE, ''%%H:%%i'') Between ''%s'' and ''%s'' ', [ConditionFromTimeEdit.Text, ConditionToTimeEdit.Text]);

  if ConditionDeliveryCheckBox.Checked then
    vDelivery := 'and (h.NO_DELIVERY <> '''' or Ifnull(t.YN_PACKING,'''') = ''Y'') ';

  case ConditionSaleTargetComboBox.ItemIndex of
    0 : vTarget := EmptyStr;
    1 : vTarget := 'and h.CD_MEMBER = ''''  ';
    2 : vTarget := 'and h.CD_MEMBER <> '''' ';
  end;

  if ConditionGoodsCodeEdit.Text <> EmptyStr then
  begin
    vGoods := Format(' inner join '
                    +' (select NO_POS, '
                    +'         NO_RCP '
                    +'    from SL_SALE_D_SUM '
                    +'   where CD_HEAD  = :P0 '
                    +'     and CD_STORE = :P1 '
                    +'     and YMD_SALE = :P2 '
                    +'     and CD_MENU ''%s'') as g on g.NO_POS = h.NO_POS '
                    +'                             and g.NO_RCP = h.NO_RCP ',[ConditionGoodsCodeEdit.Text, ConditionGoodsCodeEdit.Text]);
  end
  else
    vGoods := EmptyStr;


  vSaleDate := GetOnlyNumber(ListGridTableView.DataController.Values[ListGridTableView.DataController.GetFocusedRecordIndex, ListGridTableViewSaleDate.Index]);
  OpenQuery('select   h.NO_POS, '
           +'         h.NO_RCP, '
           +'         case h.DS_SALE when ''B'' then ''반품'' when ''V'' then ''취소'' else ''판매'' end as DS_SALE, '
           +'         h.AMT_SALE + h.DC_TOT + h.AMT_SERVICE as AMT_SALE_TOT, '
           +'         h.AMT_SERVICE, '
           +'         h.DC_TOT, '
           +'         h.AMT_SALE, '
	         +'         h.CNT_PERSON, '
           +'         case when (Ifnull(t.YN_PACKING,''N'') = ''Y'') or ((Ifnull(h.DS_DELIVERY,'''') = '''') and (Ifnull(h.NO_DELIVERY,'''') <> '''')) then ''배달(매장)''  '
           +'              when (Ifnull(h.DS_DELIVERY,'''') = ''B'') and (Ifnull(h.NO_DELIVERY,'''') <> '''') then ''배달(배민)''  '
           +'              when (Ifnull(h.DS_DELIVERY,'''') = ''C'') and (Ifnull(h.NO_DELIVERY,'''') <> '''') then ''배달(쿠팡)''  '
           +'              when (Ifnull(h.DS_DELIVERY,'''') = ''Y'') and (Ifnull(h.NO_DELIVERY,'''') <> '''') then ''배달(요기요)''  '
           +'              else case when h.NO_TABLE=0 then ''TakeOut'' else t.NM_TABLE end '
           +'         end as NO_TABLE, '
           +'         h.NO_DELIVERY, '
           +'         case when h.AMT_SALE = h.AMT_CASHRCP   and h.AMT_CASHRCP <> 0  then ''현금영수증'' '
           +'              when h.AMT_SALE = h.AMT_CASH      and h.AMT_CASH    <> 0  then ''현금'' '
           +'              when h.AMT_SALE = h.AMT_CARD      and h.AMT_CARD    <> 0  then ''신용카드'' '
           +'              when h.AMT_SALE = h.AMT_LETSORDER and h.AMT_LETSORDER   <> 0  then ''렛츠오더'' '
           +'              when h.AMT_SALE = h.AMT_TRUST     and h.AMT_TRUST   <> 0  then ''외상'' '
           +'              when h.AMT_SALE = h.AMT_GIFT      and h.AMT_GIFT    <> 0  then ''상품권'' '
           +'              when h.AMT_SALE = h.AMT_POINT     and h.AMT_POINT   <> 0  then ''포인트'' '
           +'              when h.AMT_SALE = 0               and h.DC_TOT      <> 0  then ''할인'' '
           +'              when h.AMT_SALE = 0               and h.AMT_SERVICE <> 0  then ''서비스'' '
           +'              else ''복합'' end as PAY_TYPE, '
           +'         case when (Ifnull(h.CD_MEMBER,'''') = '''') then ''일반'' '
           +'              else ConCat(''회원('',m.NM_MEMBER,'')'') '
           +'         end as MEMBER_TYPE, '
           +'         h.PNT_OCCUR, '
           +'         ConCat(c.NM_SAWON,''('',h.CD_SAWON,'')'') as NM_SAWON, '
           +'         d.NM_SAWON as NM_DAMDANG, '
	         +'         Date_Format(h.COME_TIME, ''%Y-%m-%d %H:%i'') as COME_TIME, '
	         +'         Date_Format(h.DT_SALE, ''%H:%i'') as SALE_TIME, '
           +'         TIMESTAMPDIFF(HOUR,  h.COME_TIME, h.DT_SALE) as STAY_TIME, '
	         +'         Date_Format(h.DT_CHANGE, ''%Y-%m-%d %H:%i'') as DT_CHANGE, '
           +'         h.CANCEL_TXT, '
           +'         case when Length(h.NO_RCP_ORG) = 14 then ConCat(Left(h.NO_RCP_ORG,8),''-'',SubString(h.NO_RCP_ORG,9,2),''-'',SubString(h.NO_RCP_ORG,11,4)) '
           +'                                          else '''' '
           +'         end as NO_RCP_ORG, '
           +'         ConCat(h.NO_POS,h.NO_RCP) as LINK, '
           +'         h.AMT_CASH, '
           +'         h.AMT_CARD, '
           +'         h.AMT_TRUST, '
           +'         h.AMT_POINT, '
           +'         h.AMT_BANK, '
           +'         h.AMT_GIFT, '
           +'         h.AMT_LETSORDER, '
           +'         h.SAVE_STAMP, '
           +'         h.YN_LETSORDER '
           +'from     '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), 'h  left outer join ')
           +'         MS_MEMBER as m  on h.CD_HEAD  = m.CD_HEAD  and m.CD_STORE = :P3 and h.CD_MEMBER  = m.CD_MEMBER left outer join '
           +'         MS_SAWON  as c  on h.CD_HEAD  = c.CD_HEAD  and h.CD_STORE = c.CD_STORE and h.CD_SAWON   = c.CD_SAWON left outer join '
           +'         MS_SAWON  as d  on h.CD_HEAD  = d.CD_HEAD  and h.CD_STORE = d.CD_STORE and h.CD_DAMDANG = d.CD_SAWON left outer join '
           +'         MS_TABLE  as t  on h.CD_HEAD  = t.CD_HEAD  and h.CD_STORE   = t.CD_STORE and h.NO_TABLE = t.NO_TABLE and t.SEQ = 0 '
           +vGoods
           +'where    h.CD_HEAD  =:P0 '
           +'  and    h.CD_STORE =:P1 '
           +'  and    h.YMD_SALE =:P2 '
           +vPosNo
           +vRcpNo
           +vSawonCode
           +vSaleType
           +vAcctType
           +vSaleTime
           +vDelivery
           +vTarget
           +'order by h.NO_POS, h.NO_RCP',
            [HeadStoreCode,
             StoreCode,
             vSaleDate,
             Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  SetFooterSummary;

  if GridDBTableView.DataController.RecordCount > 0 then
  begin
    // 판매내역
    OpenQuery('select   d.CD_MENU, '
             +'         case when d.NM_ITEMS <> '''' then ConCat(g.NM_MENU,''['',d.NM_ITEMS,'']'') '
             +'              else g.NM_MENU '
             +'         end as NM_MENU, '
             +'         case when g.DS_MENU_TYPE = ''W'' then case when Abs(d.QTY_SALE) > 1 then DivFlt(d.PR_SALE,d.QTY_SALE) * 100 else d.PR_SALE end else d.PR_SALE end as PR_SALE, '
             +'         GetQty(g.DS_MENU_TYPE, d.QTY_SALE) as QTY_SALE, '
             +'         d.AMT_SALE, '
             +'         d.AMT_VAT, '
             +'         d.DC_TOT, '
             +'         d.USE_STAMP, '
             +'         d.SAVE_STAMP, '
             +'         ConCat(d.NO_POS,d.NO_RCP) as LINK '
             +'  from   '+GetPartitionTable('SL_SALE_D', StoD(vSaleDate), 'd inner join ')
             +'         MS_MENU   as g  on d.CD_HEAD  = g.CD_HEAD '
             +'                        and d.CD_STORE = g.CD_STORE '
             +'                        and d.CD_MENU  = g.CD_MENU '
             +' where   d.CD_HEAD  =:P0 '
             +'   and   d.CD_STORE =:P1 '
             +'   and   d.YMD_SALE =:P2 '
             +'order by d.NO_POS, d.NO_RCP, d.SEQ',
             [HeadStoreCode,
              StoreCode,
              vSaleDate]);

    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;

    // 입금
    OpenQuery('select   AMT_CASH, '
             +'         AMT_CASHRCP, '
             +'         AMT_CARD, '
             +'         AMT_LETSORDER, '
             +'         AMT_CHECK, '
             +'         AMT_TRUST, '
             +'         AMT_GIFT, '
             +'         AMT_BANK, '
             +'         AMT_POINT, '
             +'         AMT_CASHTIP+AMT_CARDTIP as AMT_TIP, '
             +'         ConCat(NO_POS,NO_RCP) as LINK '
             +'from     '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), '')
             +'where    CD_HEAD  =:P0 '
             +'  and    CD_STORE =:P1 '
             +'  and    YMD_SALE =:P2 '
             +Replace(vPosNo, 'h.','')
             +Replace(vSawonCode, 'h.','')
             +Replace(vSaleType, 'h.','')
             +'order by  NO_POS, NO_RCP',
             [HeadStoreCode,
              StoreCode,
              vSaleDate]);

    PayGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, PayMemData);
    PayGridDBCardView.DataController.DataSource := PayDataSource;

    // 신용카드
    OpenQuery('select   case s.DS_TRD  when ''C'' then ''취소'' else ''승인'' end as DS_TRD, '
             +'         GetCardNo(Replace(s.NO_CARD,''-'',''''),''N'') as NO_CARD, '
             +'         case s.DS_TRD  when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end as AMT_APPROVAL, '
             +'         case s.DS_TRD  when ''C'' then -s.AMT_VAT else s.AMT_VAT end as AMT_VAT, '
             +'         case s.DS_TRD  when ''C'' then -s.AMT_TIP else s.AMT_TIP end as AMT_TIP, '
             +'         case s.DS_TRD  when ''C'' then -s.AMT_DC  else s.AMT_DC  end as AMT_DC, '
             +'         case when Cast(Ifnull(s.TERM_HALBU,''0'') as int) < 2 then ''일시불'' else TERM_HALBU + ''개월'' end as TERM_HALBU, '
             +'         s.NO_APPROVAL, '
             +'         case s.TYPE_TRD when ''K'' then ''키 인'' when ''C'' then ''단말기'' else ''카드리딩'' end as TYPE_TRD, '
             +'         s.NM_CARDPL, '
             +'         s.NM_CARD_BUY, '
             +'         s.NO_CHAINPL, '
             +'         ConCat(s.TRD_DATE,s.TRD_TIME) as DT_APPROVAL, '
             +'         ConCat(s.CD_CORNER,''-'',t.NM_TRDPL) as CORNER, '
             +'         ConCat(s.NO_POS,s.NO_RCP) as LINK '
             +'from     '+GetPartitionTable('SL_CARD', StoD(vSaleDate), 's left outer join ')
             +'         MS_TRD   as t  on t.CD_HEAD  = s.CD_HEAD '
             +'                       and t.CD_STORE = s.CD_STORE '
             +'                       and t.CD_TRDPL = s.CD_CORNER '
             +'where    s.CD_HEAD  =:P0 '
             +'  and    s.CD_STORE =:P1 '
             +'  and    s.YMD_SALE =:P2 '
             +Replace(vPosNo, 'h.','s.')
             +Replace(vSawonCode, 'h.','s.')
             +'order by s.NO_POS, s.NO_RCP, s.SEQ',
              [HeadStoreCode,
               StoreCode,
               vSaleDate]);

    CardGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, CardMemData);
    CardGridDBCardView.DataController.DataSource := CardDataSource;

    // 현금영수증
    OpenQuery('select   case s.DS_TRD  when ''C'' then ''취소'' else ''승인'' end as DS_TRD, '
             +'         case s.DS_KIND when ''1'' then ''지출증빙'' else ''소득공제'' end as DS_KIND, '
             +'         s.NO_CARD, '
             +'         case s.DS_TRD  when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end as AMT_APPROVAL, '
             +'         case when s.DS_INPUT = ''O'' then ''단말기'' else s.NO_APPROVAL end NO_APPROVAL, '
             +'         StoD(s.TRD_DATE) as DT_APPROVAL, '
             +'         ConCat(s.CD_CORNER,''-'',t.NM_TRDPL) as CORNER, '
             +'         ConCat(NO_POS,NO_RCP) as LINK '
             +'from     SL_CASH as s  left outer join  '
             +'         MS_TRD  as t  on t.CD_HEAD  = s.CD_HEAD '
             +'                      and t.CD_STORE = s.CD_STORE '
             +'                      and t.CD_TRDPL = s.CD_CORNER '
             +'where    s.CD_HEAD  =:P0 '
             +'  and    s.CD_STORE =:P1 '
             +'  and    s.YMD_SALE =:P2 '
             +Replace(vPosNo, 'h.','s.')
             +Replace(vSawonCode, 'h.','s.')
             +'order by s.NO_POS, s.NO_RCP, s.SEQ',
              [HeadStoreCode,
               StoreCode,
               vSaleDate]);

    CashReceiptGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, CashReceiptMemData);
    CashReceiptGridDBCardView.DataController.DataSource := CashReceiptDataSource;

    // 회원
    OpenQuery('select   h.CD_MEMBER, '
             +'         m.NM_MEMBER as NM_MEMBER, '
             +'         m.NO_CARD, '
             +'         case when m.TEL_MOBILE = '''' then AES_Decrypt(m.TEL_HOME, 5871483) else AES_Decrypt(m.TEL_MOBILE, 71483) end as TEL_MOBILE, '
             +'         h.AMT_TRUST, '
             +'         h.AMT_POINT + h.DC_POINT as AMT_POINT, '
             +'         h.PNT_OCCUR, '
             +'         ConCat(h.NO_POS,h.NO_RCP) as LINK '
             +'from     '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), 'h inner join ')
             +'         MS_MEMBER as m  on m.CD_HEAD   = h.CD_HEAD '
             +'                        and m.CD_STORE  = :P3 '
             +'                        and h.CD_MEMBER = m.CD_MEMBER '
             +'where    h.CD_HEAD  =:P0 '
             +'  and    h.CD_STORE =:P1 '
             +'  and    h.YMD_SALE =:P2 '
             +vPosNo
             +vSawonCode
             +vSaleType
             +'order by h.NO_POS, h.NO_RCP',
              [HeadStoreCode,
               StoreCode,
               vSaleDate,
               Ifthen(GetStoreOption(5)='1',StandardStore, Storecode)]);

    MemberGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MemberMemData);
    MemberGridDBCardView.DataController.DataSource := MemberDataSource;

    // 할인
    OpenQuery('select   h.DC_MENU, '
             +'         h.DC_MEMBER, '
             +'         h.DC_POINT, '
             +'         b.NM_CODE1 as CD_CODE, '
             +'         h.DC_CODE, '
             +'         h.DC_VAT, '
             +'         h.DC_SPC, '
             +'         h.DC_EVENT, '
             +'         h.DC_RECEIPT, '
             +'         h.DC_CUT, '
             +'         h.DC_KBANK, '
             +'         h.DC_MCARD, '
             +'         h.DC_COUPON, '
             +'         h.DC_TAXFREE, '
             +'         h.DC_STAMP, '
             + '        h.DC_UPLUS, '
             +'         h.DC_KAKAO, '
             +'         h.DC_LETSORDER, '
             +'         ConCat(h.NO_POS,h.NO_RCP) as LINK '
             +'  from   '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), 'h  left outer join ')
             +'         MS_CODE   as b on b.CD_HEAD  = h.CD_HEAD '
             +'                       and b.CD_STORE = h.CD_STORE '
             +'                       and b.CD_CODE  = h.CD_CODE '
             +'                       and b.CD_KIND  = ''07'' '
             +' where   h.CD_HEAD  =:P0 '
             +'   and   h.CD_STORE =:P1 '
             +'   and   h.YMD_SALE =:P2 '
             +vPosNo
             +vSawonCode
             +vSaleType
             +'order by h.YMD_SALE, h.NO_POS, h.NO_RCP',
             [HeadStoreCode,
              StoreCode,
              vSaleDate]);

    DCGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, DCMemData);
    DCGridDBCardView.DataController.DataSource := DCDataSource;

    // 출력내역
    OpenQuery('select   case h.CD_PRINTER when ''000'' then ''고객주문서'' '
             +'                         else b.NM_CODE1 '
             +'         end as PRT_NAME, '
             +'         Cast(h.NO_ORDER as Char) as NO_ORDER, '
             +'         h.PRINT_DATA, '
             +'         h.ORDER_TIME, '
             +'         h.NM_DAMDANG as NM_SAWON, '
             +'         ConCat(h.NO_POS,h.NO_RCP) as LINK '
             +'from     SL_SALE_PRT  as h left outer join '
             +'         MS_CODE      as b on b.CD_HEAD  = h.CD_HEAD '
             +'                          and b.CD_STORE = h.CD_STORE '
             +'                          and b.CD_CODE  = h.CD_PRINTER '
             +'                          and b.CD_KIND  = ''02'' '
             +' where   h.CD_HEAD  =:P0 '
             +'   and   h.CD_STORE =:P1 '
             +'   and   h.YMD_SALE =:P2 '
             +'   and   h.NO_ORDER > 0 '
             +'   and   h.CD_PRINTER <> ''LET'' '
             +vPosNo
             +'order by h.YMD_SALE, h.NO_POS, h.NO_RCP',
             [HeadStoreCode,
              StoreCode,
              vSaleDate]);

    PrintGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, PrintMemData);
    PrintGridDBCardView.DataController.DataSource := PrintDataSource;

    // 취소내역
    OpenQuery('select   c.CD_MENU, '
             +'         m.NM_MENU, '
             +'         StoD(c.DT_ORDER) as DT_ORDER, '
             +'         StoD(c.DT_CANCEL) as DT_CANCEL, '
             +'         b.NM_CODE1 as NM_FLOOR, '
             +'         t.NM_TABLE, '
             +'         c.QTY_CANCEL, '
             +'         c.CANCEL_TXT, '
             +'         c.NO_POS, '
             +'         s.NM_SAWON, '
             +'         Right(c.NO_RCP,6) as LINK '
             +'from     SL_SALE_C  c  left outer join '
             +'         MS_MENU    m  on c.CD_STORE = m.CD_STORE and c.CD_MENU  = m.CD_MENU left outer join '
             +'         MS_SAWON   s  on c.CD_STORE = s.CD_STORE and c.CD_SAWON = s.CD_SAWON left outer join '
             +'         MS_TABLE   t  on c.CD_STORE = t.CD_STORE and c.NO_TABLE = t.NO_TABLE left outer join '
             +'         MS_CODE as b on b.CD_HEAD  = t.CD_HEAD '
             +'                     and b.CD_STORE = t.CD_STORE '
             +'                     and b.CD_CODE  = t.CD_FLOOR '
             +'                     and b.CD_KIND  = ''03'' '
             +'where    c.CD_HEAD  = :P0 '
             +'  and    c.CD_STORE = :P1 '
             +'  and    c.YMD_SALE = :P2 '
             +'  and    Substring(c.NO_RCP,1,8)= :P2  '
             +Replace(vPosNo, 'h.','c.')
             +'order by c.DT_CANCEL',
              [HeadStoreCode,
               StoreCode,
               vSaleDate]);
    CancelGridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, CancelMemData);
    CancelGridDBTableView.DataController.DataSource := CancelDataSource;

    // 렛츠오더 싱크
    OpenQuery('select   NO_ORDER, '
             +'         PRINT_DATA, '
             +'         ORDER_TIME, '
             +'         AES_Decrypt(TEL_MOBILE, 71483) as TEL_MOBILE, '
             +'         ConCat(NO_POS,NO_RCP) as LINK '
             +'  from   SL_SALE_PRT  '
             +' where   CD_HEAD  =:P0 '
             +'   and   CD_STORE =:P1 '
             +'   and   YMD_SALE =:P2 '
             +'   and   CD_PRINTER = ''LET'' '
             +'order by YMD_SALE, NO_POS, NO_RCP, ORDER_TIME',
             [HeadStoreCode,
              StoreCode,
              vSaleDate]);
    LetsOrderSyncDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, LetsOrderSyncMemData);
    LetsOrderSyncDBCardView.DataController.DataSource := LetsOrderSyncDataSource;
  end;
end;

procedure TSaleReceiptShowForm.SetFooterSummary;
var vRow, vIndex:Integer;
begin
  inherited;
  try
    GridDBTableView.DataController.BeginUpdate;
    for vRow := 1 to GridDBTableView.DataController.Summary.FooterSummaryItems.Count-1 do
      GridDBTableView.DataController.Summary.FooterSummaryValues[vRow] := 0;

    for vRow := 0 to GridDBTableView.DataController.FilteredRecordCount-1 do
    begin
      if String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vRow], GridDBTableViewType.Index]) = '취소' then Continue;

      for vIndex := 1 to GridDBTableView.DataController.Summary.FooterSummaryItems.Count-1 do
        GridDBTableView.DataController.Summary.FooterSummaryValues[vIndex] := GridDBTableView.DataController.Summary.FooterSummaryValues[vIndex] +
                                                                              GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vRow],  GridDBTableView.DataController.Summary.FooterSummaryItems[vIndex].DataField.Index];
    end;
  finally
    GridDBTableView.DataController.EndUpdate;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
procedure TSaleReceiptShowForm.ClearGrid;
begin
  isLoading := true;
  ListGridTableView.DataController.RecordCount := 0;
  LetsOrderSyncDBCardView.DataController.DataSource := nil;
  DCGridDBCardView.DataController.DataSource := nil;
  MemberGridDBCardView.DataController.DataSource := nil;
  CashReceiptGridDBCardView.DataController.DataSource := nil;
  CardGridDBCardView.DataController.DataSource := nil;
  PayGridDBCardView.DataController.DataSource := nil;
  PrintGridDBCardView.DataController.DataSource := nil;
  CancelGridDBTableView.DataController.DataSource := nil;
  GridSubDBTableView.DataController.DataSource := nil;
  GridDBTableView.DataController.DataSource := nil;
end;

function TSaleReceiptShowForm.DoSearch:Boolean;
var
  vPosNo,
  vSawonCode,
  vSaleType,
  vAcctType,
  vSaleTime,
  vDelivery,
  vTarget,
  vRcpNo,
  vCardNo,
  vGoods : string;
  vIndex    : Integer;
  vCode     : PStrPointer;
begin
//  inherited;
  if ConditionToolBarEdit.Text <> EmptyStr then
  begin
    vRcpNo := Format('and h.NO_RCP = ''%s'' ', [LPad(ConditionToolBarEdit.Text,4,'0')]);
    ConditionToolBarEdit.Text := LPad(ConditionToolBarEdit.Text,4,'0');
  end;

  vPosNo     := Ifthen(ConditionPosComboBox.ItemIndex      = 0, '', Format('and h.NO_POS   = ''%s'' ', [GetStrPointerData(ConditionPosComboBox)]));
  vSawonCode := Ifthen(ConditionSawonComboBox.ItemIndex    = 0, '', Format('and h.CD_SAWON = ''%s'' ', [GetStrPointerData(ConditionSawonComboBox)]));
  vSaleType  := Ifthen(ConditionSaleTypeComboBox.ItemIndex = 0, '', Format('and h.DS_SALE  = ''%s'' ', [GetStrPointerData(ConditionSaleTypeComboBox)]));

  case StoI(GetStrPointerData(ConditionAcctTypeComboBox)) of
    0 : vAcctType := EmptyStr;
    1 : vAcctType := 'and h.AMT_CASH    <> 0 ';
    2 : vAcctType := 'and h.AMT_CARD    <> 0 ';
    3 : vAcctType := 'and h.AMT_CASHRCP <> 0 ';
    4 : vAcctType := 'and h.AMT_LETSORDER <> 0 ';
    5 : vAcctType := 'and h.AMT_TRUST   <> 0 ';
    6 : vAcctType := 'and h.AMT_GIFT    <> 0 ';
    7 : vAcctType := 'and h.AMT_POINT   <> 0 ';
    8 : vAcctType := 'and h.AMT_BANK    <> 0 ';
  end;

  if ConditionFromTimeEdit.Time > 0 then
    vSaleTime := Format('and Date_Format(h.DT_SALE, ''%%H:%%i'') Between ''%s'' and ''%s'' ', [ConditionFromTimeEdit.Text, ConditionToTimeEdit.Text]);

  if ConditionDeliveryCheckBox.Checked then
    vDelivery := 'and h.NO_DELIVERY <> '''' ';

  case ConditionSaleTargetComboBox.ItemIndex of
    0 : vTarget := EmptyStr;
    1 : vTarget := 'and h.CD_MEMBER = ''''  ';
    2 : vTarget := 'and h.CD_MEMBER <> '''' ';
  end;

  if ConditionGoodsCodeEdit.Text <> EmptyStr then
  begin
    vGoods := Format(' inner join '
                    +' (select YMD_SALE '
                    +'    from SL_SALE_D_SUM '
                    +'   where CD_HEAD  = :P0 '
                    +'     and CD_STORE = :P1 '
                    +'     and YMD_SALE between :P2 and :P3 '
                    +'     and CD_MENU = ''%s'') as g on g.YMD_SALE = h.YMD_SALE ',[ConditionGoodsCodeEdit.Text, ConditionGoodsCodeEdit.Text]);
  end
  else
    vGoods := EmptyStr;

  try
    isLoading := true;
    ClearGrid;
    OpenQuery('select   StoD(h.YMD_SALE) as YMD_SALE '
             +'  from   '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date , 'h  left outer join ')
             +'         MS_SAWON  as c  on h.CD_HEAD  = c.CD_HEAD  and h.CD_STORE = c.CD_STORE and h.CD_SAWON   = c.CD_SAWON left outer join '
             +'         MS_SAWON  as d  on h.CD_HEAD  = d.CD_HEAD  and h.CD_STORE = d.CD_STORE and h.CD_DAMDANG = d.CD_SAWON left outer join '
             +'         MS_TABLE  as t  on h.CD_HEAD  = t.CD_HEAD  and h.CD_STORE   = t.CD_STORE and h.NO_TABLE = t.NO_TABLE and t.SEQ = 0 '
             +vGoods
             +' where   h.CD_HEAD  =:P0 '
             +'   and   h.CD_STORE =:P1 '
             +'   and   h.YMD_SALE between :P2 and :P3 '
             +vPosNo
             +vRcpNo
             +vSawonCode
             +vSaleType
             +vAcctType
             +vSaleTime
             +vDelivery
             +vTarget
             +' group by h.YMD_SALE '
             +' order by h.YMD_SALE',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, ListGridTableView);
  finally
    isLoading := false;
  end;


  if ListGridTableView.DataController.RecordCount > 0 then
  begin
    ListGrid.SetFocus;
    ListGridTableView.DataController.FocusedRecordIndex := 0;
  end;
end;

end.
