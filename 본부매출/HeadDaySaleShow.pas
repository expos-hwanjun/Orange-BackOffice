unit HeadDaySaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, cxLabel, cxCurrencyEdit, cxGridCustomTableView,
  cxGridCardView, cxGridCustomLayoutView, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, cxGridLevel, cxGridCustomView,
  cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, StrUtils, cxDBData, cxSpinEdit, cxTimeEdit,
  cxCheckBox, Vcl.StdCtrls, AdvPanel, cxGridDBCardView, cxGridDBTableView,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePager, AdvOfficePagerStylers;

type
  THeadDaySaleShowForm = class(TInheritGridEditForm)
    GridStoreView: TcxGridCardView;
    GridStoreViewStoreName: TcxGridCardViewRow;
    GridStoreViewSaleAmt: TcxGridCardViewRow;
    GridStoreViewDcAmt: TcxGridCardViewRow;
    GridStoreViewVatAmt: TcxGridCardViewRow;
    GridStoreViewGuestCount: TcxGridCardViewRow;
    GridStoreViewServiceAmt: TcxGridCardViewRow;
    GridStoreViewTotalAmt: TcxGridCardViewRow;
    GridStoreViewSoonAmt: TcxGridCardViewRow;
    GridStoreViewStoreCode: TcxGridCardViewRow;
    cxGrid1: TcxGrid;
    cxGridTableView1: TcxGridTableView;
    GridDBTableView: TcxGridDBTableView;
    GridDBTableViewPosNo: TcxGridDBColumn;
    GridDBTableViewBillNo: TcxGridDBColumn;
    GridDBTableViewType: TcxGridDBColumn;
    GridDBTableViewTotAmt: TcxGridDBColumn;
    GridDBTableViewDCAmt: TcxGridDBColumn;
    GridDBTableViewServiceAmt: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewTable: TcxGridDBColumn;
    GridDBTableViewPayType: TcxGridDBColumn;
    GridDBTableViewPerson: TcxGridDBColumn;
    GridDBTableViewMemberType: TcxGridDBColumn;
    GridDBTableViewPoint: TcxGridDBColumn;
    GridDBTableViewStamp: TcxGridDBColumn;
    GridDBTableViewCashierName: TcxGridDBColumn;
    GridDBTableViewDamdang: TcxGridDBColumn;
    GridDBTableViewComeTime: TcxGridDBColumn;
    GridDBTableViewExitTime: TcxGridDBColumn;
    GridDBTableViewStayTime: TcxGridDBColumn;
    GridDBTableViewChangeDate: TcxGridDBColumn;
    GridDBTableViewWhyCancel: TcxGridDBColumn;
    GridDBTableViewOrgRcp: TcxGridDBColumn;
    GridDBTableViewCashAmt: TcxGridDBColumn;
    GridDBTableViewCardAmt: TcxGridDBColumn;
    GridDBTableViewTrustAmt: TcxGridDBColumn;
    GridDBTableViewPointAmt: TcxGridDBColumn;
    GridDBTableViewBankAmt: TcxGridDBColumn;
    GridDBTableViewGiftAmt: TcxGridDBColumn;
    GridSubDBTableView: TcxGridDBTableView;
    GridSubDBTableViewMenuCode: TcxGridDBColumn;
    GridSubDBTableViewMenuName: TcxGridDBColumn;
    GridSubDBTableViewSalePrice: TcxGridDBColumn;
    GridSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewVatAmt: TcxGridDBColumn;
    GridSubDBTableViewDCAmt: TcxGridDBColumn;
    GridSubDBTableViewSaveStamp: TcxGridDBColumn;
    GridSubDBTableViewUseStamp: TcxGridDBColumn;
    PayGridDBCardView: TcxGridDBCardView;
    PayGridDBCardViewCashAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCashReceiptAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCardAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCheckAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewCreditAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewGiftCardAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewTipAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewBankAmt: TcxGridDBCardViewRow;
    PayGridDBCardViewPointAmt: TcxGridDBCardViewRow;
    CardGridDBCardView: TcxGridDBCardView;
    CardGridDBCardViewType: TcxGridDBCardViewRow;
    CardGridDBCardViewCardNo: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewTaxAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewTipAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewDcAmt: TcxGridDBCardViewRow;
    CardGridDBCardViewHalbu: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalNo: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalType: TcxGridDBCardViewRow;
    CardGridDBCardViewCardCompany: TcxGridDBCardViewRow;
    CardGridDBCardViewJoinNo: TcxGridDBCardViewRow;
    CardGridDBCardViewApprovalDate: TcxGridDBCardViewRow;
    CardGridDBCardViewCorner: TcxGridDBCardViewRow;
    CashReceiptGridDBCardView: TcxGridDBCardView;
    CashReceiptGridDBCardViewType: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewCustomer: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewCardNo: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewApprovalAmt: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewApprovalNo: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewApprovalDate: TcxGridDBCardViewRow;
    CashReceiptGridDBCardViewCorner: TcxGridDBCardViewRow;
    MemberGridDBCardView: TcxGridDBCardView;
    MemberGridDBCardViewMemberNo: TcxGridDBCardViewRow;
    MemberGridDBCardViewMemberName: TcxGridDBCardViewRow;
    MemberGridDBCardViewCardNo: TcxGridDBCardViewRow;
    MemberGridDBCardViewTelNo: TcxGridDBCardViewRow;
    MemberGridDBCardViewCreditAmt: TcxGridDBCardViewRow;
    MemberGridDBCardViewUsePoint: TcxGridDBCardViewRow;
    MemberGridDBCardViewSavePoint: TcxGridDBCardViewRow;
    DCGridDBCardView: TcxGridDBCardView;
    DCGridDBCardViewMenuDC: TcxGridDBCardViewRow;
    DCGridDBCardViewMemberDC: TcxGridDBCardViewRow;
    DCGridDBCardViewReceiptDC: TcxGridDBCardViewRow;
    DCGridDBCardViewCutDC: TcxGridDBCardViewRow;
    DCGridDBCardViewPointDC: TcxGridDBCardViewRow;
    DCGridDBCardViewCodeDcCode: TcxGridDBCardViewRow;
    DCGridDBCardViewCodeDC: TcxGridDBCardViewRow;
    DCGridDBCardViewVatDC: TcxGridDBCardViewRow;
    DCGridDBCardViewSpcDC: TcxGridDBCardViewRow;
    DCGridDBCardViewEventDC: TcxGridDBCardViewRow;
    DCGridDBCardViewCouponDC: TcxGridDBCardViewRow;
    DCGridDBCardViewMCardDC: TcxGridDBCardViewRow;
    DCGridDBCardViewEnuriDC: TcxGridDBCardViewRow;
    DCGridDBCardViewKBankDC: TcxGridDBCardViewRow;
    DCGridDBCardViewStampDc: TcxGridDBCardViewRow;
    DCGridDBCardViewTaxFreeDc: TcxGridDBCardViewRow;
    DCGridDBCardViewUPlusDC: TcxGridDBCardViewRow;
    DCGridDBCardViewKaKaoDc: TcxGridDBCardViewRow;
    DCGridDBCardViewLetsOrderDc: TcxGridDBCardViewRow;
    PrintGridDBCardView: TcxGridDBCardView;
    PrintGridDBCardViewPrintName: TcxGridDBCardViewRow;
    PrintGridDBCardViewOrderNo: TcxGridDBCardViewRow;
    PrintGridDBCardViewOrderTime: TcxGridDBCardViewRow;
    PrintGridDBCardViewDamDang: TcxGridDBCardViewRow;
    PrintGridDBCardViewPrintTxt: TcxGridDBCardViewRow;
    CancelGridDBTableView: TcxGridDBTableView;
    CancelGridDBTableViewMenuCode: TcxGridDBColumn;
    CancelGridDBTableViewMenuName: TcxGridDBColumn;
    CancelGridDBTableViewCancelQty: TcxGridDBColumn;
    CancelGridDBTableViewFloor: TcxGridDBColumn;
    CancelGridDBTableViewTableName: TcxGridDBColumn;
    CancelGridDBTableViewOrderTime: TcxGridDBColumn;
    CancelGridDBTableViewCancelTime: TcxGridDBColumn;
    CancelGridDBTableViewPosNo: TcxGridDBColumn;
    CancelGridDBTableViewSawon: TcxGridDBColumn;
    CancelGridDBTableViewCancelTxt: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    GridSubLevel: TcxGridLevel;
    PayGridLevel: TcxGridLevel;
    CardGridLevel: TcxGridLevel;
    CashReceiptGridLevel: TcxGridLevel;
    MemberGridLevel: TcxGridLevel;
    DCGridLevel: TcxGridLevel;
    PrintGridLevel: TcxGridLevel;
    CancelGridLevel: TcxGridLevel;
    ConditionPanel: TAdvPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    ConditionDeliveryCheckBox: TcxCheckBox;
    ConditionFromTimeEdit: TcxTimeEdit;
    ConditionToTimeEdit: TcxTimeEdit;
    ConditionAcctTypeComboBox: TcxComboBox;
    ConditionSaleTypeComboBox: TcxComboBox;
    ConditionSaleTargetComboBox: TcxComboBox;
    ConditionGoodsCodeEdit: TcxTextEdit;
    SubDataSource: TDataSource;
    DataSource: TDataSource;
    DCDataSource: TDataSource;
    MemberDataSource: TDataSource;
    CashReceiptDataSource: TDataSource;
    CardDataSource: TDataSource;
    PayDataSource: TDataSource;
    PrintDataSource: TDataSource;
    CancelDataSource: TDataSource;
    GridDBTableViewLetsOrderAmt: TcxGridDBColumn;
    GridDBTableViewZeroPayAmt: TcxGridDBColumn;
    GridStoreViewDeliveryAmt: TcxGridCardViewRow;
    procedure GridStoreViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
  private
    MemData,
    SubMemData,
    PayMemData,
    CardMemData,
    CashReceiptMemData,
    MemberMemData,
    DCMemData,
    PrintMemData,
    CancelMemData : TdxMemData;
    procedure SetFooterSummary;
  protected
    function DoSearch:Boolean; override;
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    procedure ClearGrid; override;
  end;

var
  HeadDaySaleShowForm: THeadDaySaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ THeadDaySaleShowForm }
procedure THeadDaySaleShowForm.FormCreate(Sender: TObject);
var
  vCodeData: PStrPointer;
begin
  inherited;
  MemData             := TdxMemData.Create(Self);
  DataSource.DataSet  := MemData;
  SubMemData             := TdxMemData.Create(Self);
  SubDataSource.DataSet  := SubMemData;

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
  New(vCodeData);
  vCodeData^.Data := '4';
  ConditionAcctTypeComboBox.Properties.Items.AddObject('렛츠오더',  TObject(vCodeData));
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
  isChanged := false;
end;

procedure THeadDaySaleShowForm.ClearGrid;
begin
  inherited;
  isLoading := true;
  GridStoreView.DataController.RecordCount := 0;
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

procedure THeadDaySaleShowForm.DoGridLink;
var
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
  vStoreCode: String;
begin
  inherited;
  if isLoading then Exit;

  vStoreCode := GridStoreView.DataController.Values[GridStoreView.DataController.GetFocusedRecordIndex, GridStoreViewStoreCode.Index];
  vSaleDate := DtoS(ConditionToolBarFromDateEdit.Date);

  if ConditionToolBarEdit.Text <> EmptyStr then
  begin
    vRcpNo := Format('and h.NO_RCP = ''%s'' ', [LPad(ConditionToolBarEdit.Text,4,'0')]);
    ConditionToolBarEdit.Text := LPad(ConditionToolBarEdit.Text,4,'0');
  end;

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
    vSaleTime := Format('and Date_Format(h.DT_SALE, ''%H:%i'') Between ''%s'' and ''%s'' ', [ConditionFromTimeEdit.Text, ConditionToTimeEdit.Text]);

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


  OpenQuery('select   h.NO_POS, '
           +'         h.NO_RCP, '
           +'         case h.DS_SALE when ''B'' then ''반품'' when ''V'' then ''취소'' when ''M'' then ''선결제'' else ''판매'' end as DS_SALE, '
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
           +'         case when h.AMT_SALE = h.AMT_CASHRCP   and h.AMT_CASHRCP <> 0  then ''현금영수증'' '
           +'              when h.AMT_SALE = h.AMT_CASH      and h.AMT_CASH    <> 0  then ''현금'' '
           +'              when h.AMT_SALE = h.AMT_CARD      and h.AMT_CARD    <> 0  then ''신용카드'' '
           +'              when h.AMT_SALE = h.AMT_LETSORDER and h.AMT_LETSORDER   <> 0  then ''렛츠오더'' '
           +'              when h.AMT_SALE = h.AMT_TRUST     and h.AMT_TRUST   <> 0  then ''외상'' '
           +'              when h.AMT_SALE = h.AMT_GIFT      and h.AMT_GIFT    <> 0  then ''상품권'' '
           +'              when h.AMT_SALE = h.AMT_POINT     and h.AMT_POINT   <> 0  then ''포인트'' '
           +'              when h.AMT_SALE = h.AMT_ZEROPAY   and h.AMT_ZEROPAY   <> 0  then ''제로페이'' '
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
           +'         h.AMT_ZEROPAY, '
           +'         h.SAVE_STAMP '
           +'   from '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), 'h left outer join')
           +'         MS_MEMBER as m  on h.CD_HEAD  = m.CD_HEAD  and m.CD_STORE = :P3 and h.CD_MEMBER  = m.CD_MEMBER left outer join '
           +'         MS_SAWON  as c  on h.CD_HEAD  = c.CD_HEAD  and h.CD_STORE = c.CD_STORE and h.CD_SAWON   = c.CD_SAWON left outer join '
           +'         MS_SAWON  as d  on h.CD_HEAD  = d.CD_HEAD  and h.CD_STORE = d.CD_STORE and h.CD_DAMDANG = d.CD_SAWON left outer join '
           +'         MS_TABLE  as t  on h.CD_HEAD  = t.CD_HEAD  and h.CD_STORE   = t.CD_STORE and h.NO_TABLE = t.NO_TABLE and t.SEQ = 0 '
           +vGoods
           +'where    h.CD_HEAD  =:P0 '
           +'  and    h.CD_STORE =:P1 '
           +'  and    h.YMD_SALE =:P2 '
           +vRcpNo
           +vSaleType
           +vAcctType
           +vSaleTime
           +vDelivery
           +vTarget
           +'order by h.NO_POS, h.NO_RCP',
            [HeadStoreCode,
             vStoreCode,
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
             +'  from  '+GetPartitionTable('SL_SALE_D', StoD(vSaleDate), 'd inner join')
             +'         MS_MENU   as g  on d.CD_HEAD  = g.CD_HEAD '
             +'                        and d.CD_STORE = g.CD_STORE '
             +'                        and d.CD_MENU  = g.CD_MENU '
             +' where   d.CD_HEAD  =:P0 '
             +'   and   d.CD_STORE =:P1 '
             +'   and   d.YMD_SALE =:P2 '
             +'order by d.NO_POS, d.NO_RCP, d.SEQ',
             [HeadStoreCode,
              vStoreCode,
              vSaleDate]);
    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;

    // 입금
    OpenQuery('select   AMT_CASH, '
             +'         AMT_CASHRCP, '
             +'         AMT_CARD, '
             +'         AMT_CHECK, '
             +'         AMT_TRUST, '
             +'         AMT_GIFT, '
             +'         AMT_BANK, '
             +'         AMT_POINT, '
             +'         AMT_CASHTIP+AMT_CARDTIP as AMT_TIP, '
             +'         ConCat(NO_POS,NO_RCP) as LINK '
             +'  from  '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), '')
             +' where    CD_HEAD  =:P0 '
             +'   and    CD_STORE =:P1 '
             +'   and    YMD_SALE =:P2 '
             +Replace(vSaleType, 'h.','')
             +'order by  NO_POS, NO_RCP',
             [HeadStoreCode,
              vStoreCode,
              vSaleDate]);
    PayGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, PayMemData);
    PayGridDBCardView.DataController.DataSource := PayDataSource;

    // 신용카드
    OpenQuery('select   case s.DS_TRD  when ''2'' then ''취소'' else ''승인'' end as DS_TRD, '
             +'         GetCardNo(Replace(s.NO_CARD,''-'',''''),''N'') as NO_CARD, '
             +'         case s.DS_TRD  when ''2'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end as AMT_APPROVAL, '
             +'         case s.DS_TRD  when ''2'' then -s.AMT_VAT else s.AMT_VAT end as AMT_VAT, '
             +'         case s.DS_TRD  when ''2'' then -s.AMT_TIP else s.AMT_TIP end as AMT_TIP, '
             +'         case s.DS_TRD  when ''2'' then -s.AMT_DC  else s.AMT_DC  end as AMT_DC, '
             +'         case when Cast(Ifnull(s.TERM_HALBU,''0'') as int) < 2 then ''일시불'' else ConCat(TERM_HALBU,''개월'') end as TERM_HALBU, '
             +'         s.NO_APPROVAL, '
             +'         case s.TYPE_TRD when ''K'' then ''키 인'' when ''C'' then ''단말기'' else ''카드리딩'' end as TYPE_TRD, '
             +'         s.NM_CARD_BUY, '
             +'         s.NO_CHAINPL, '
             +'         ConCat(s.TRD_DATE,s.TRD_TIME) as DT_APPROVAL, '
             +'         ConCat(s.CD_CORNER,''-'',t.NM_TRDPL) as CORNER, '
             +'         ConCat(s.NO_POS,s.NO_RCP) as LINK '
             +'  from  '+GetPartitionTable('SL_CARD', StoD(vSaleDate), 's left outer join')
             +'         MS_TRD   as t  on t.CD_HEAD  = s.CD_HEAD '
             +'                       and t.CD_STORE = s.CD_STORE '
             +'                       and t.CD_TRDPL = s.CD_CORNER '
             +' where   s.CD_HEAD  =:P0 '
             +'   and   s.CD_STORE =:P1 '
             +'   and   s.YMD_SALE =:P2 '
             +' order by s.NO_POS, s.NO_RCP, s.SEQ',
              [HeadStoreCode,
               vStoreCode,
               vSaleDate]);
    CardGridDBCardView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, CardMemData);
    CardGridDBCardView.DataController.DataSource := CardDataSource;

    // 현금영수증
    OpenQuery('select   case s.DS_TRD  when ''1'' then ''취소'' else ''승인'' end as DS_TRD, '
             +'         case s.DS_KIND when ''1'' then ''지출증빙'' else ''소득공제'' end as DS_KIND, '
             +'         GetCardNo(Replace(s.NO_CARD,''-'',''''),''Y'') as NO_CARD, '
             +'         case s.DS_TRD  when ''1'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end as AMT_APPROVAL, '
             +'         s.NO_APPROVAL, '
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
             +'order by s.NO_POS, s.NO_RCP, s.SEQ',
              [HeadStoreCode,
               vStoreCode,
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
             +'  from  '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), 'h inner join')
             +'         MS_MEMBER as m  on m.CD_HEAD   = h.CD_HEAD '
             +'                        and m.CD_STORE  = :P3 '
             +'                        and h.CD_MEMBER = m.CD_MEMBER '
             +' where   h.CD_HEAD  =:P0 '
             +'   and   h.CD_STORE =:P1 '
             +'   and   h.YMD_SALE =:P2 '
             +vSaleType
             +'order by h.NO_POS, h.NO_RCP',
              [HeadStoreCode,
               vStoreCode,
               vSaleDate,
               Ifthen(GetStoreOption(5)='1',StandardStore, vStorecode)]);
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
             +'  from  '+GetPartitionTable('SL_SALE_H', StoD(vSaleDate), 'h left outer join')
             +'         MS_CODE   as b on b.CD_HEAD  = h.CD_HEAD '
             +'                       and b.CD_STORE = h.CD_STORE '
             +'                       and b.CD_CODE  = h.CD_CODE '
             +'                       and b.CD_KIND  = ''07'' '
             +' where   h.CD_HEAD  =:P0 '
             +'   and   h.CD_STORE =:P1 '
             +'   and   h.YMD_SALE =:P2 '
             +vSaleType
             +'order by h.YMD_SALE, h.NO_POS, h.NO_RCP',
             [HeadStoreCode,
              vStoreCode,
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
             +'order by h.YMD_SALE, h.NO_POS, h.NO_RCP, h.ORDER_TIME',
             [HeadStoreCode,
              vStoreCode,
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
             +'         MS_MENU    m  on m.CD_HEAD = c.CD_HEAD and c.CD_STORE = m.CD_STORE and c.CD_MENU  = m.CD_MENU left outer join '
             +'         MS_SAWON   s  on s.CD_HEAD = c.CD_HEAD and c.CD_STORE = s.CD_STORE and c.CD_SAWON = s.CD_SAWON left outer join '
             +'         MS_TABLE   t  on t.CD_HEAD = c.CD_HEAD and c.CD_STORE = t.CD_STORE and c.NO_TABLE = t.NO_TABLE left outer join '
             +'         MS_CODE as b on b.CD_HEAD  = t.CD_HEAD '
             +'                     and b.CD_STORE = t.CD_STORE '
             +'                     and b.CD_CODE  = t.CD_FLOOR '
             +'                     and b.CD_KIND  = ''03'' '
             +'where    c.CD_HEAD  = :P0 '
             +'  and    c.CD_STORE = :P1 '
             +'  and    c.YMD_SALE = :P2 '
             +'  and    Substring(c.NO_RCP,1,8)= :P2  '
             +'order by c.DT_CANCEL',
              [HeadStoreCode,
               vStoreCode,
               vSaleDate]);
    CancelGridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, CancelMemData);
    CancelGridDBTableView.DataController.DataSource := CancelDataSource;
  end;
end;

function THeadDaySaleShowForm.DoSearch: Boolean;
var vDestStoreCode :String;
begin
  isLoading := true;
  ClearGrid;
  OpenQuery('select s.NM_STORE, '
           +'       h.AMT_SALE + h.DC_TOT + h.AMT_SERVICE as AMT_TOT, '
           +'       h.DC_TOT as AMT_DC, '
           +'       h.AMT_SERVICE, '
           +'       h.AMT_SALE, '
           +'       h.AMT_DELIVERY, '
           +'       h.AMT_TIP, '
           +'       h.AMT_SALE-h.AMT_TAX-h.AMT_TIP as AMT_SOON, '
           +'       h.AMT_TAX, '
           +'       h.CNT_CUSTOMER as CNT_GUEST, '
           +'       s.CD_STORE '
           +'  from MS_STORE      as s left outer join '
           +'       SL_SALE_H_SUM as h on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and h.YMD_SALE =:P2 '
           +' where s.CD_HEAD =:P0 '
           +'   and s.CD_STORE <> :P1'
           +'   and s.YN_USE  = ''Y'' '
           +' order by 2 desc ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date)]);
  GridStoreView.DataController.BeginUpdate;
  GridStoreView.DataController.RecordCount := 0;
  while not Query.Eof do
  begin
    GridStoreView.DataController.AppendRecord;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewStoreCode.Index] := Query.FieldByName('CD_STORE').AsString;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewStoreName.Index] := Query.FieldByName('NM_STORE').AsString;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewSaleAmt.Index]   := Query.FieldByName('AMT_SALE').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewDeliveryAmt.Index] := Query.FieldByName('AMT_DELIVERY').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewDcAmt.Index]     := Query.FieldByName('AMT_DC').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewVatAmt.Index]    := Query.FieldByName('AMT_TAX').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewServiceAmt.Index]:= Query.FieldByName('AMT_SERVICE').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewSoonAmt.Index]   := Query.FieldByName('AMT_SOON').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewTotalAmt.Index]  := Query.FieldByName('AMT_TOT').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewGuestCount.Index]:= Query.FieldByName('CNT_GUEST').AsCurrency;
    Query.Next;
  end;
  GridStoreView.DataController.EndUpdate;
  Query.Close;
  Result := GridStoreView.DataController.RecordCount > 0;
  isLoading := false;
  if Result then
  begin
    GridStoreView.DataController.FocusedRecordIndex := 0;
  end;
end;


procedure THeadDaySaleShowForm.EditPropertiesChange(Sender: TObject);
begin
//  inherited;
  ClearGrid;
end;

procedure THeadDaySaleShowForm.GridStoreViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  DoGridLink;
end;

procedure THeadDaySaleShowForm.SetFooterSummary;
var vRow, vIndex:Integer;
begin
  try
    GridDBTableView.DataController.BeginUpdate;
    for vRow := 1 to GridDBTableView.DataController.Summary.FooterSummaryItems.Count-1 do
      GridDBTableView.DataController.Summary.FooterSummaryValues[vRow] := 0;

    for vRow := 0 to GridDBTableView.DataController.FilteredRecordCount-1 do
    begin
      if String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vRow], 3]) = '취소' then Continue;

      for vIndex := 1 to GridDBTableView.DataController.Summary.FooterSummaryItems.Count-1 do
        GridDBTableView.DataController.Summary.FooterSummaryValues[vIndex] := GridDBTableView.DataController.Summary.FooterSummaryValues[vIndex] +
                                                                              GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vRow],  GridDBTableView.DataController.Summary.FooterSummaryItems[vIndex].DataField.Index];
    end;
  finally
    GridDBTableView.DataController.EndUpdate;
  end;

end;

end.
