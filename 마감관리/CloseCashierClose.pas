// 계산원 마감 (완료)

unit CloseCashierClose;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter, Math,
  cxData, cxDataStorage, cxEdit, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxTextEdit, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, ExtCtrls,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, AdvSplitter, cxLookAndFeelPainters, StdCtrls, cxGroupBox,
  cxCurrencyEdit, DateUtils, AdvToolBarStylers, StrUtils, cxMemo, cxLookAndFeels,
  DBAccess;

type
  TCloseCashierCloseForm = class(TInheritGridEditForm)
    GridTableViewCashierNo: TcxGridColumn;
    GridTableViewCashierName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    ReserveGroupBox: TcxGroupBox;
    DepositGroupBox: TcxGroupBox;
    AccountsGroupBox: TcxGroupBox;
    ReserveOldAmtLabel: TLabel;
    ReserveAmtLabel: TLabel;
    DepositOldAmtLabel: TLabel;
    DepositCheckAmtLabel: TLabel;
    Deposit50000AmtLabel: TLabel;
    Deposit10000AmtLabel: TLabel;
    Deposit5000AmtLabel: TLabel;
    Deposit1000AmtLabel: TLabel;
    Deposit500AmtLabel: TLabel;
    Deposit100AmtLabel: TLabel;
    Deposit50AmtLabel: TLabel;
    Deposit10AmtLabel: TLabel;
    DepositAmtLabel: TLabel;
    AccountsSaleAmtLabel: TLabel;
    AccountsReturnAmtLabel: TLabel;
    AccountsVoidAmtLabel: TLabel;
    AccountsCustomerAmtLabel: TLabel;
    AccountsModifyAmtLabel: TLabel;
    AccountsCancelAmtLabel: TLabel;
    AccountsDCAmtLabel: TLabel;
    AccountsAutoDCAmtLabel: TLabel;
    AccountsOKCSaveAmtLabel: TLabel;
    AccountsCashAmtLabel: TLabel;
    AccountsCashReceiptAmtLabel: TLabel;
    AccountsCardAmtLabel: TLabel;
    AccountsCheckAmtLabel: TLabel;
    AccountsCreditAmtLabel: TLabel;
    AccountsGiftCardAmtLabel: TLabel;
    AccountsOKCashbagAmtLabel: TLabel;
    AccountsTmoneyAmtLabel: TLabel;
    ReserveOldAmtEdit: TcxCurrencyEdit;
    ReserveAmtEdit: TcxCurrencyEdit;
    DepositOldAmtEdit: TcxCurrencyEdit;
    DepositCheckAmtEdit: TcxCurrencyEdit;
    Deposit50000QtyEdit: TcxCurrencyEdit;
    Deposit10000QtyEdit: TcxCurrencyEdit;
    Deposit5000QtyEdit: TcxCurrencyEdit;
    Deposit1000QtyEdit: TcxCurrencyEdit;
    Deposit500QtyEdit: TcxCurrencyEdit;
    Deposit100QtyEdit: TcxCurrencyEdit;
    Deposit50QtyEdit: TcxCurrencyEdit;
    Deposit10QtyEdit: TcxCurrencyEdit;
    DepositAmtEdit: TcxCurrencyEdit;
    Deposit50000AmtEdit: TcxCurrencyEdit;
    Deposit10000AmtEdit: TcxCurrencyEdit;
    Deposit5000AmtEdit: TcxCurrencyEdit;
    Deposit1000AmtEdit: TcxCurrencyEdit;
    Deposit500AmtEdit: TcxCurrencyEdit;
    Deposit100AmtEdit: TcxCurrencyEdit;
    Deposit50AmtEdit: TcxCurrencyEdit;
    Deposit10AmtEdit: TcxCurrencyEdit;
    AccountsSaleAmtEdit: TcxCurrencyEdit;
    AccountsReturnAmtEdit: TcxCurrencyEdit;
    AccountsVoidAmtEdit: TcxCurrencyEdit;
    AccountsCustomerQtyEdit: TcxCurrencyEdit;
    AccountsModifyQtyEdit: TcxCurrencyEdit;
    AccountsCancelQtyEdit: TcxCurrencyEdit;
    AccountsDCQtyEdit: TcxCurrencyEdit;
    AccountsAutoDCQtyEdit: TcxCurrencyEdit;
    AccountsOKCSaveQtyEdit: TcxCurrencyEdit;
    AccountsCustomerAmtEdit: TcxCurrencyEdit;
    AccountsModifyAmtEdit: TcxCurrencyEdit;
    AccountsCancelAmtEdit: TcxCurrencyEdit;
    AccountsDCAmtEdit: TcxCurrencyEdit;
    AccountsAutoDCAmtEdit: TcxCurrencyEdit;
    AccountsOKCSaveAmtEdit: TcxCurrencyEdit;
    AccountsCashQtyEdit: TcxCurrencyEdit;
    AccountsCashReceiptQtyEdit: TcxCurrencyEdit;
    AccountsCashReceiptCQtyEdit: TcxCurrencyEdit;
    AccountsCardQtyEdit: TcxCurrencyEdit;
    AccountsCardCQtyEdit: TcxCurrencyEdit;
    AccountsCheckQtyEdit: TcxCurrencyEdit;
    AccountsCreditQtyEdit: TcxCurrencyEdit;
    AccountsGiftCardQtyEdit: TcxCurrencyEdit;
    AccountsCashAmtEdit: TcxCurrencyEdit;
    AccountsCashReceiptAmtEdit: TcxCurrencyEdit;
    AccountsCashReceiptCAmtEdit: TcxCurrencyEdit;
    AccountsCardAmtEdit: TcxCurrencyEdit;
    AccountsCardCAmtEdit: TcxCurrencyEdit;
    AccountsCheckAmtEdit: TcxCurrencyEdit;
    AccountsCreditAmtEdit: TcxCurrencyEdit;
    AccountsGiftCardAmtEdit: TcxCurrencyEdit;
    AccountsOKCashbagQtyEdit: TcxCurrencyEdit;
    AccountsOKCashbagAmtEdit: TcxCurrencyEdit;
    AccountsTmoneyQtyEdit: TcxCurrencyEdit;
    AccountsTmoneyAmtEdit: TcxCurrencyEdit;
    CommentLabel: TLabel;
    RemarkMemo: TcxMemo;
    RemarkLabel: TLabel;
    AccountsCashReceiptCAmtLabel: TLabel;
    AccountsCardCAmtLabel: TLabel;
    AccountsEasyCheckAmtLabel: TLabel;
    AccountsEasyCheckQtyEdit: TcxCurrencyEdit;
    AccountsEasyCheckAmtEdit: TcxCurrencyEdit;
    AccountsEasyCheckCAmtLabel: TLabel;
    AccountsEasyCheckCQtyEdit: TcxCurrencyEdit;
    AccountsEasyCheckCAmtEdit: TcxCurrencyEdit;
    AccountsOverShortAmtLabel: TLabel;
    AccountsOverShortAmtEdit: TcxCurrencyEdit;
    Label1: TLabel;
    cxCurrencyEdit1: TcxCurrencyEdit;
    Label2: TLabel;
    cxCurrencyEdit2: TcxCurrencyEdit;
    Label3: TLabel;
    cxCurrencyEdit3: TcxCurrencyEdit;
    Label4: TLabel;
    cxCurrencyEdit4: TcxCurrencyEdit;
    Label5: TLabel;
    cxCurrencyEdit5: TcxCurrencyEdit;
    Label6: TLabel;
    cxCurrencyEdit6: TcxCurrencyEdit;
    Label7: TLabel;
    cxCurrencyEdit7: TcxCurrencyEdit;
    Label8: TLabel;
    cxCurrencyEdit8: TcxCurrencyEdit;
    cxCurrencyEdit9: TcxCurrencyEdit;
    Label9: TLabel;
    cxCurrencyEdit10: TcxCurrencyEdit;
    Label10: TLabel;
    cxCurrencyEdit11: TcxCurrencyEdit;
    Label11: TLabel;
    cxCurrencyEdit12: TcxCurrencyEdit;
    Label12: TLabel;
    cxCurrencyEdit13: TcxCurrencyEdit;
    Label13: TLabel;
    cxCurrencyEdit14: TcxCurrencyEdit;
    Label14: TLabel;
    cxCurrencyEdit15: TcxCurrencyEdit;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure DepositQtyEditChanged(Sender: TObject);
    procedure DepositAmtEditEnter(Sender: TObject);
    procedure DepositAmtEditExit(Sender: TObject);
    procedure DepositAmtEditPropertiesChange(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure EditPropertiesChange(Sender: TObject);

  private
    VatAmt,
    DCMemberQty,
    DCMemberAmt,
    DCReceiptQty,
    DCReceiptAmt,
    DCEnuriQty,
    DCEnuriAmt,
    DCCutQty,
    DCCutAmt,
    DCPointQty,
    DCPointAmt,
    DCSpcQty,
    DCSpcAmt,
    DCGoodsQty,
    DCGoodsAmt,
    DCCouponQty,
    DCCouponAmt,
    DCCmsQty,
    DCCmsAmt,
    VoidQty,
    CashAmt       : Currency;
    isTotalFocused: Boolean;
    isTempClose   : Boolean;
    CloseDateTime : String;

    procedure GridLink(aCloseDate, aPosNo, aCashierNo: string; aClearDepositAmt: Boolean);
    procedure CashierClosePrint;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoSave: Boolean; override;                        // 저장
  public
    function  Save(aCloseDate, aPosNo, aCashierNo: string): Boolean;
  end;

var
  CloseCashierCloseForm: TCloseCashierCloseForm;



implementation

uses
  Common, DBModule;

const
  msgClose     = '마감';
  msgTempClose = '가마감';

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCloseCashierCloseForm.FormCreate(Sender: TObject);
begin
  inherited;

  DefaultDate := ddToday;
  CommentLabel.Caption := '※ 준비금, 중간출금은 기존 입금 금액이 있을경우 누적되어 저장되며 기존 입금 금액을 차감하거나 덮어쓸 수 없습니다.'#13
                         +'   예를 들어 100,000원 입력 후 다시 200,000원을 입력하면 입금 금액은 200,000원이 아닌 합산 금액인 300,000원이 됩니다.'#13
                         +'   POS에서 등록한 경우 다시 입력하지 마십시오.';
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TCloseCashierCloseForm.CashierClosePrint;
var vPrintData :String;
begin
  OpenQuery('select * from sl_cashier_mem '
           +' where cd_store =:P0 '
           +'   and ymd_close =:P1 '
           +'   and no_pos    =:P2 '
           +'   and cd_sawon  =:P3 '
           +'   and seq       =1',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index],
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCashierNo.Index]]);
  try
    vPrintData := rptSizeWidth + rptAlignCenter + '계산원 마감' + #13 +
                 '('+ConditionToolBarFromDateEdit.Text+')' + #13 +
                 rptSizeNormal + rptAlignLeft + rptTwoLine +
                 Format('POS  : %s (%s) #%s', [StoreName, StoreCode, String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index])]) + #13 +
                 Format('마감 : %s ',[CloseDateTime]) + #13 +
                 Format('담당 : %s(%s) ',[String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCashierName.Index]), String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCashierNo.Index]) ]) + #13 +
                 rptOneLine + #13 +
                 rptSizeWidth + '판매 내역' + #13 +
                 rptSizeNormal +
                 Format(' 판매 %s',[LPad(AccountsSaleAmtEdit.Text,35,' ')])+#13+
                 Format(' 반품 %s',[LPad(AccountsReturnAmtEdit.Text,35,' ')])+#13+
                 Format(' 매출취소 %s',[LPad(AccountsVoidAmtEdit.Text,31,' ')])+#13+
                 Format(' [합계] %s',[LPad(AccountsTotalAmtEdit.Text,33,' ')])+#13+
                 rptOneLine + #13 +
                 Format(' 면세 상품 판매 %s',[LPad(AccountsSaleAmtEdit.Text,27,' ')])+#13+
                 Format(' 과세 상품 판매 %s',[LPad(AccountsSaleAmtEdit.Text,27,' ')])+#13+
                 Format('       부 가 세 %s',[LPad(AccountsSaleAmtEdit.Text,27,' ')])+#13+
                 rptOneLine + #13 +
                 ' 객수 / 객단가 '+ LPad(Query.FieldByName('CNT_CUSTOMER').AsString,10,' ')+LPad(FormatFloat('#,0',Query.FieldByName('AMT_AVERAGE').Value),15,' ')+#13+
                 rptOneLine + #13 +
                 rptSizeWidth + '결제 내역' + #13 +
                 rptSizeNormal +
                 Format(' 현금 %s',[LPad(FormatFloat('#,0',Query.FieldByName('AMT_CASH').Value),35,' ')])+#13;

  finally
    FinishQuery;
  end;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TCloseCashierCloseForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TCloseCashierCloseForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

  // 마감 가능여부
  ButtonToolBarSaveButton.Enabled := (GridTableView.DataController.FocusedRecordIndex >= 0) and
                                     ((GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = null) or (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = EmptyStr) or (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = msgTempClose));
end;
//------------------------------------------------------------------------------
// 저장 버튼
procedure TCloseCashierCloseForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  // 저장하기 위해 무조건 변경된 것으로 한다
  isChanged := true;

  inherited;

  isChanged := false;
  ButtonToolBarSaveButton.Enabled := (GridTableView.DataController.FocusedRecordIndex >= 0) and ((GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = null) or (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = EmptyStr) or (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = msgTempClose));
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드 다른 레코드를 선택할 때
procedure TCloseCashierCloseForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  // 마감 가능여부, 중간출금, 준비금 활성화 여부
  ButtonToolBarSaveButton.Enabled := ((GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = null) or (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = EmptyStr) or (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] = msgTempClose)) and isTempClose;
  ReserveAmtEdit.Enabled          := ButtonToolBarSaveButton.Enabled;
  DepositCheckAmtEdit.Enabled     := ReserveAmtEdit.Enabled;
//Deposit100000QtyEdit.Enabled    := ReserveAmtEdit.Enabled;
  Deposit50000QtyEdit.Enabled     := ReserveAmtEdit.Enabled;
  Deposit10000QtyEdit.Enabled     := ReserveAmtEdit.Enabled;
  Deposit5000QtyEdit.Enabled      := ReserveAmtEdit.Enabled;
  Deposit1000QtyEdit.Enabled      := ReserveAmtEdit.Enabled;
  Deposit500QtyEdit.Enabled       := ReserveAmtEdit.Enabled;
  Deposit100QtyEdit.Enabled       := ReserveAmtEdit.Enabled;
  Deposit50QtyEdit.Enabled        := ReserveAmtEdit.Enabled;
  Deposit10QtyEdit.Enabled        := ReserveAmtEdit.Enabled;
  DepositAmtEdit.Enabled          := ReserveAmtEdit.Enabled;
  ButtonToolBarSaveButton.Tag     := Ifthen(ButtonToolBarSaveButton.Enabled,0,1);
  ButtonToolBarSaveButton.Enabled := true;
//  RemarkMemo.Enabled              := ReserveAmtEdit.Enabled;
end;
//------------------------------------------------------------------------------
// 그리드 스타일 적용
procedure TCloseCashierCloseForm.GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  // 마감은 빨간색, 가마감은 파란색으로 표시
  if (AItem <> nil) and (AItem.Index = GridTableViewStatus.Index) then
    if ARecord.Values[GridTableViewStatus.Index] = msgClose then
      AStyle := StyleFontRed
    else
      AStyle := StyleFontBlue;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 권종 수량 입력창 값을 수정할 때
procedure TCloseCashierCloseForm.DepositQtyEditChanged(Sender: TObject);
begin
  inherited;

  if isTotalFocused then
    Exit;

  // 권종별 금액을 새로 구한다
//Deposit100000AmtEdit.Value := Deposit100000QtyEdit.Value * 100000;
  Deposit50000AmtEdit.Value  := Deposit50000QtyEdit.Value  * 50000;
  Deposit10000AmtEdit.Value  := Deposit10000QtyEdit.Value  * 10000;
  Deposit5000AmtEdit.Value   := Deposit5000QtyEdit.Value   * 5000;
  Deposit1000AmtEdit.Value   := Deposit1000QtyEdit.Value   * 1000;
  Deposit500AmtEdit.Value    := Deposit500QtyEdit.Value    * 500;
  Deposit100AmtEdit.Value    := Deposit100QtyEdit.Value    * 100;
  Deposit50AmtEdit.Value     := Deposit50QtyEdit.Value     * 50;
  Deposit10AmtEdit.Value     := Deposit10QtyEdit.Value     * 10;
  DepositAmtEdit.Value       := DepositCheckAmtEdit.Value
//                            + Deposit100000AmtEdit.Value
                              + Deposit50000AmtEdit.Value
                              + Deposit10000AmtEdit.Value
                              + Deposit5000AmtEdit.Value
                              + Deposit1000AmtEdit.Value
                              + Deposit500AmtEdit.Value
                              + Deposit100AmtEdit.Value
                              + Deposit50AmtEdit.Value
                              + Deposit10AmtEdit.Value;
  DepositAmtEdit.Tag := Trunc(DepositAmtEdit.Value);
end;
//------------------------------------------------------------------------------
// 중간출금 합계창 값을 수정할 때
procedure TCloseCashierCloseForm.DepositAmtEditPropertiesChange(Sender: TObject);
begin
  inherited;

  if not isTotalFocused then
    Exit;

  if Trunc(DepositAmtEdit.Value) <> DepositAmtEdit.Tag then
  begin
    DepositCheckAmtEdit.Value  := 0;
//  Deposit100000QtyEdit.Value := 0;
//  Deposit100000AmtEdit.Value := 0;
    Deposit50000QtyEdit.Value  := 0;
    Deposit50000AmtEdit.Value  := 0;
    Deposit10000QtyEdit.Value  := 0;
    Deposit10000AmtEdit.Value  := 0;
    Deposit5000QtyEdit.Value   := 0;
    Deposit5000AmtEdit.Value   := 0;
    Deposit1000QtyEdit.Value   := 0;
    Deposit1000AmtEdit.Value   := 0;
    Deposit500QtyEdit.Value    := 0;
    Deposit500AmtEdit.Value    := 0;
    Deposit100QtyEdit.Value    := 0;
    Deposit100AmtEdit.Value    := 0;
    Deposit50QtyEdit.Value     := 0;
    Deposit50AmtEdit.Value     := 0;
    Deposit10QtyEdit.Value     := 0;
    Deposit10AmtEdit.Value     := 0;
  end;
  DepositAmtEdit.Tag := Trunc(DepositAmtEdit.Value);
end;
//------------------------------------------------------------------------------
// 중간출금 합계창에 포커스가 들어갈 때
procedure TCloseCashierCloseForm.DepositAmtEditEnter(Sender: TObject);
begin
  inherited;

  isTotalFocused := true;
end;
//------------------------------------------------------------------------------
// 중간출금 합계창에서 포커스가 나갈 때
procedure TCloseCashierCloseForm.DepositAmtEditExit(Sender: TObject);
begin
  inherited;

  isTotalFocused := false;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TCloseCashierCloseForm.DoSearch: Boolean;
begin
  Result := False;

  try
    OpenQuery('select   a.NO_POS, '
             +'         a.CD_SAWON, '
             +'         b.NM_SAWON, '
             +'         case when a.YN_CLOSE = ''Y'' then '''+msgClose+''' when a.YN_TEMP_CLOSE = ''Y'' then '''+msgTempClose+''' else '''' end as YN_CLOSE '
             +'from    (select   CD_STORE, '
             +'                  YMD_SALE, '
             +'                  NO_POS, '
             +'                  CD_SAWON, '
             +'                  Max(YN_CLOSE)      as YN_CLOSE, '
             +'                  Max(YN_TEMP_CLOSE) as YN_TEMP_CLOSE '
             +'         from    (select   CD_STORE, '
             +'                           YMD_SALE, '
             +'                           NO_POS, '
             +'                           CD_SAWON, '
             +'                           '''' as YN_CLOSE, '
             +'                           '''' as YN_TEMP_CLOSE '
             +'                  from     SL_SALE_H '
             +'                  where    CD_STORE = :P0 '
             +'                    and    YMD_SALE = :P1 '
             +'                  group by CD_STORE, YMD_SALE, NO_POS, CD_SAWON '
             +'                  union all '
             +'                  select   CD_STORE, '
             +'                           YMD_CLOSE, '
             +'                           NO_POS, '
             +'                           CD_SAWON, '
             +'                           YN_CLOSE, '
             +'                           YN_TEMP_CLOSE '
             +'                  from     SL_CASHIER_MGM '
             +'                  where    CD_STORE  = :P0 '
             +'                    and    YMD_CLOSE = :P1) as k '
             +'         group by CD_STORE, YMD_SALE, NO_POS, CD_SAWON) as a left outer join '
             +'         MS_SAWON as b on a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
             +'order by a.NO_POS ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  except
  end;
end;
procedure TCloseCashierCloseForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 그리드 연결 자료 표시 (실제 함수)
procedure TCloseCashierCloseForm.GridLink(aCloseDate, aPosNo, aCashierNo: string; aClearDepositAmt: Boolean);
begin
  // 기존 준비금, 중간출금
  OpenQuery('select   AMT_READY, '
           +'         AMT_MID, '
           +'         _CHECK, '
           +'         _100000, '
           +'         _50000, '
           +'         _10000, '
           +'         _5000, '
           +'         _1000, '
           +'         _500, '
           +'         _100, '
           +'         _50, '
           +'         _10, '
           +'         AMT_LACK, '
           +'         REMARK, '
           +'         YN_TEMP_CLOSE, '
           +'         YN_CLOSE, '
           +'         DT_CHANGE '
           +'from     SL_CASHIER_MGM '
           +'where    CD_STORE  = :P0 '
           +'  and    YMD_CLOSE = :P1 '
           +'  and    NO_POS    = :P2 '
           +'  and    CD_SAWON  = :P3 '
           +'  and    SEQ       = 1',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    isTotalFocused := true;
    if not Query.Eof then
    begin
      ReserveOldAmtEdit.Value := Query.Fields[ 0].AsCurrency;                   // AMT_READY
      DepositOldAmtEdit.Value := Query.Fields[ 1].AsCurrency;                   // AMT_MID
      // 마감 되었을 때만 기존 정보를 다시 불러온다
      if Query.Fields[15].AsString = 'Y' then                                   // YN_CLOSE
      begin
        DepositCheckAmtEdit.Value      := Query.Fields[ 2].AsCurrency;          // _CHECK
        Deposit50000AmtEdit.Value      := Query.Fields[ 4].AsCurrency;          // _50000
        Deposit10000AmtEdit.Value      := Query.Fields[ 5].AsCurrency;          // _10000
        Deposit5000AmtEdit.Value       := Query.Fields[ 6].AsCurrency;          // _5000
        Deposit1000AmtEdit.Value       := Query.Fields[ 7].AsCurrency;          // _1000
        Deposit500AmtEdit.Value        := Query.Fields[ 8].AsCurrency;          // _500
        Deposit100AmtEdit.Value        := Query.Fields[ 9].AsCurrency;          // _100
        Deposit50AmtEdit.Value         := Query.Fields[10].AsCurrency;          // _50
        Deposit10AmtEdit.Value         := Query.Fields[11].AsCurrency;          // _10
        Deposit50000QtyEdit.Value      := Deposit50000AmtEdit.Value / 50000;
        Deposit10000QtyEdit.Value      := Deposit10000AmtEdit.Value / 10000;
        Deposit5000QtyEdit.Value       := Deposit5000AmtEdit.Value  / 5000;
        Deposit1000QtyEdit.Value       := Deposit1000AmtEdit.Value  / 1000;
        Deposit500QtyEdit.Value        := Deposit500AmtEdit.Value   / 500;
        Deposit100QtyEdit.Value        := Deposit100AmtEdit.Value   / 100;
        Deposit50QtyEdit.Value         := Deposit50AmtEdit.Value    / 50;
        Deposit10QtyEdit.Value         := Deposit10AmtEdit.Value    / 10;
        AccountsOverShortAmtEdit.Value := Query.Fields[12].AsCurrency;          // AMT_LACK
        if AccountsOverShortAmtEdit.Value < 0 then
          AccountsOverShortAmtEdit.Style.TextColor := clRed
        else
          AccountsOverShortAmtEdit.Style.TextColor := clBlue;
      end
      else if aClearDepositAmt then
      begin
        DepositCheckAmtEdit.Clear;
        Deposit50000QtyEdit.Clear;
        Deposit10000QtyEdit.Clear;
        Deposit5000QtyEdit.Clear;
        Deposit1000QtyEdit.Clear;
        Deposit500QtyEdit.Clear;
        Deposit100QtyEdit.Clear;
        Deposit50QtyEdit.Clear;
        Deposit10QtyEdit.Clear;
        AccountsOverShortAmtEdit.Clear;
        RemarkMemo.Clear;
      end;
      RemarkMemo.Text           := Query.Fields[13].AsString;                   // REMARK
      isTempClose               := Query.Fields[14].AsString = 'Y';             // YN_TEMP_CLOSE
    end
    else
    begin
      ReserveOldAmtEdit.Value   := 0;
      DepositOldAmtEdit.Value   := 0;
      if aClearDepositAmt then
      begin
        DepositCheckAmtEdit.Clear;
        Deposit50000QtyEdit.Clear;
        Deposit10000QtyEdit.Clear;
        Deposit5000QtyEdit.Clear;
        Deposit1000QtyEdit.Clear;
        Deposit500QtyEdit.Clear;
        Deposit100QtyEdit.Clear;
        Deposit50QtyEdit.Clear;
        Deposit10QtyEdit.Clear;
        AccountsOverShortAmtEdit.Clear;
        RemarkMemo.Clear;
      end;
      isTempClose := false;
    end;
  finally
    FinishQuery;
    isTotalFocused := false;
    DepositQtyEditChanged(Deposit10QtyEdit);
  end;

  //포스번호가 00이면 무조건 True
  if aPosNo = '00' then
    isTempClose := True;

  // 계산원 가마감을 하지 않았다면
  if not isTempClose then
  begin
    // 어제, 오늘꺼 마감할 때는
    if (aCloseDate = FormatDateTime(fmtDateShort, Date)) then //or (aCloseDate = FormatDateTime(fmtDateShort, Date-1)) then
    begin
      //  다음 날짜로 판매된 것이 있을 때만 가마감 했다고 인정해 준다
      if OpenQuery('select   Top 1 NO_RCP '
                  +'from     SL_SALE_H '
                  +'where    CD_STORE = :P0 '
                  +'  and    YMD_SALE = :P1 '
                  +'  and    NO_POS   = :P2 '
                  +'  and    CD_SAWON = :P3 '
                  +'  and    NO_CLOSE = 1',
                   [StoreCode,
                    FormatDateTime(fmtDateShort, StoD(aCloseDate)+1),
                    aPosNo,
                    aCashierNo],
                    true) then
        isTempClose := true;
    end
    // 그제 이전 꺼 마감할 때는 그냥 가마감 한 것으로 인정해 준다
    else if (aCloseDate < FormatDateTime(fmtDateShort, Date)) then
      isTempClose := true;
  end;


  // 매출
  OpenQuery('select   Count(h.YMD_SALE) as CustomerQty, '
           +'         case Count(h.YMD_SALE) when 0 then Sum(h.AMT_SALE) else Sum(h.AMT_SALE) / Count(h.YMD_SALE) end as CustomerAmt, '
           +'         Sum(h.AMT_TAX)                                                              as VatAmt, '
           +'         Sum(case when h.AMT_CASH               <> 0 then 1              else 0 end) as CashQty, '
           +'         Sum(case when h.AMT_CASH               <> 0 then h.AMT_CASH     else 0 end) as CashAmt, '
           +'         Sum(case when h.AMT_CHECK              <> 0 then 1              else 0 end) as CheckQty, '
           +'         Sum(case when h.AMT_CHECK              <> 0 then h.AMT_CHECK    else 0 end) as CheckAmt, '
           +'         Sum(case when h.AMT_TRUST              <> 0 then 1              else 0 end) as CreditQty, '
           +'         Sum(case when h.AMT_TRUST              <> 0 then h.AMT_TRUST    else 0 end) as CreditAmt, '
           +'         Sum(case when h.AMT_GIFT               <> 0 then 1              else 0 end) as GiftCardQty, '
           +'         Sum(case when h.AMT_GIFT               <> 0 then h.AMT_GIFT     else 0 end) as GiftCardAmt, '
           +'         Sum(case when h.DC_MEMBER              <> 0 then 1              else 0 end) as DCMemberQty, '
           +'         Sum(h.DC_MEMBER)                                                            as DCMemberAmt, '
           +'         Sum(case when h.DC_RECEIPT             <> 0 then 1              else 0 end) as DCReceiptQty, '
           +'         Sum(h.DC_RECEIPT)                                                           as DCReceiptAmt, '
           +'         Sum(case when h.DC_ENURI               <> 0 then 1              else 0 end) as DCEnuriQty, '
           +'         Sum(h.DC_ENURI)                                                             as DCEnuriAmt, '
           +'         Sum(case when h.DC_CUT                 <> 0 then 1              else 0 end) as DCCutQty, '
           +'         Sum(h.DC_CUT)                                                               as DCCutAmt, '
           +'         Sum(case when h.AMT_OKC_SAVE           <> 0 then 1              else 0 end) as OkCashbagSaveQty, '
           +'         Sum(h.AMT_OKC_SAVE)                                                         as OkCashbagSaveAmt, '
           +'         Sum(case when h.DS_SALE = ''S''             then h.AMT_SALE     else 0 end) as SaleAmt, '
           +'         Sum(case when h.DS_SALE = ''B''             then h.AMT_SALE     else 0 end) as ReturnAmt, '
           +'         Sum(case when h.DC_POINT               <> 0 then 1              else 0 end) as DCPointQty, '
           +'         Sum(h.DC_POINT)                                                             as DCPointAmt '
           +'from     SL_SALE_H as h (nolock) '
           +'where    h.CD_STORE = :P0 '
           +'  and    h.YMD_SALE = :P1 '
           +'  and    h.NO_POS   = :P2 '
           +'  and    h.CD_SAWON = :P3 '
           +'  and    h.DS_SALE <> ''V'' ',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      AccountsCustomerQtyEdit.Value := Query.Fields[ 0].AsCurrency;
      AccountsCustomerAmtEdit.Value := Query.Fields[ 1].AsCurrency;
      VatAmt                        := Query.Fields[ 2].AsCurrency;
      AccountsCashQtyEdit.Value     := Query.Fields[ 3].AsCurrency;
      //마감이 됐으면 현금금액을 보여준다
      if CheckOption(102) or (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index] = msgClose) then
        AccountsCashAmtEdit.Value   := Query.Fields[ 4].AsCurrency
      else
        AccountsCashAmtEdit.Clear;
      CashAmt                       := Query.Fields[ 4].AsCurrency;
      AccountsCheckQtyEdit.Value    := Query.Fields[ 5].AsCurrency;
      AccountsCheckAmtEdit.Value    := Query.Fields[ 6].AsCurrency;
      AccountsCreditQtyEdit.Value   := Query.Fields[ 7].AsCurrency;
      AccountsCreditAmtEdit.Value   := Query.Fields[ 8].AsCurrency;
      AccountsGiftCardQtyEdit.Value := Query.Fields[ 9].AsCurrency;
      AccountsGiftCardAmtEdit.Value := Query.Fields[10].AsCurrency;
      DCMemberQty                   := Query.Fields[11].AsCurrency;
      DCMemberAmt                   := Query.Fields[12].AsCurrency;
      DCReceiptQty                  := Query.Fields[13].AsCurrency;
      DCReceiptAmt                  := Query.Fields[14].AsCurrency;
      DCEnuriQty                    := Query.Fields[15].AsCurrency;
      DCEnuriAmt                    := Query.Fields[16].AsCurrency;
      DCCutQty                      := Query.Fields[17].AsCurrency;
      DCCutAmt                      := Query.Fields[18].AsCurrency;
      AccountsOKCSaveQtyEdit.Value  := Query.Fields[19].AsCurrency;
      AccountsOKCSaveAmtEdit.Value  := Query.Fields[20].AsCurrency;
      AccountsSaleAmtEdit.Value     := Query.Fields[21].AsCurrency;
      AccountsReturnAmtEdit.Value   := Query.Fields[22].AsCurrency;
      DCPointQty                    := Query.Fields[23].AsCurrency;
      DCPointAmt                    := Query.Fields[24].AsCurrency;
    end
    else
    begin
      AccountsCustomerQtyEdit.Value := 0;
      AccountsCustomerAmtEdit.Value := 0;
      VatAmt                        := 0;
      AccountsCashQtyEdit.Value     := 0;
      AccountsCashAmtEdit.Value     := 0;
      CashAmt                       := 0;
      AccountsCheckQtyEdit.Value    := 0;
      AccountsCheckAmtEdit.Value    := 0;
      AccountsCreditQtyEdit.Value   := 0;
      AccountsCreditAmtEdit.Value   := 0;
      AccountsGiftCardQtyEdit.Value := 0;
      AccountsGiftCardAmtEdit.Value := 0;
      DCMemberQty                   := 0;
      DCMemberAmt                   := 0;
      DCReceiptQty                  := 0;
      DCReceiptAmt                  := 0;
      DCEnuriQty                    := 0;
      DCEnuriAmt                    := 0;
      DCCutQty                      := 0;
      DCCutAmt                      := 0;
      AccountsOKCSaveQtyEdit.Value  := 0;
      AccountsOKCSaveAmtEdit.Value  := 0;
      AccountsSaleAmtEdit.Value     := 0;
      AccountsReturnAmtEdit.Value   := 0;
      DCPointQty                    := 0;
      DCPointAmt                    := 0;
    end;
  finally
    FinishQuery;
  end;

  // 매출취소
  OpenQuery('select   Count(*)      as VoidQty, '
           +'         Sum(AMT_SALE) as VoidAmt '
           +'from     SL_SALE_H (nolock)'
           +'where    CD_STORE = :P0 '
           +'  and    YMD_SALE = :P1 '
           +'  and    NO_POS   = :P2 '
           +'  and    CD_SAWON = :P3 '
           +'  and    DS_SALE  = ''V''',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      VoidQty                   := Query.Fields[0].AsCurrency;
      AccountsVoidAmtEdit.Value := Query.Fields[1].AsCurrency;
    end
    else
    begin
      VoidQty                   := 0;
      AccountsVoidAmtEdit.Value := 0;
    end;
  finally
    FinishQuery;
  end;

  // 현금영수증
  OpenQuery('select   Sum(case when DS_TRD = ''0'' then 1             else 0 end) as CashReceiptQty, '
           +'         Sum(case when DS_TRD = ''0'' then AMT_APPROVAL  else 0 end) as CashReceiptAmt, '
           +'         Sum(case when DS_TRD = ''1'' then 1             else 0 end) as CashReceiptCQty, '
           +'         Sum(case when DS_TRD = ''1'' then -AMT_APPROVAL else 0 end) as CashReceiptCAmt '
           +'from     SL_CASH (nolock)'
           +'where    CD_STORE = :P0 '
           +'  and    YMD_SALE = :P1 '
           +'  and    NO_POS   = :P2 '
           +'  and    CD_SAWON = :P3',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      AccountsCashReceiptQtyEdit.Value  := Query.Fields[0].AsCurrency;
      AccountsCashReceiptAmtEdit.Value  := Query.Fields[1].AsCurrency;
      AccountsCashReceiptCQtyEdit.Value := Query.Fields[2].AsCurrency;
      AccountsCashReceiptCAmtEdit.Value := Query.Fields[3].AsCurrency;
    end
    else
    begin
      AccountsCashReceiptQtyEdit.Value  := 0;
      AccountsCashReceiptAmtEdit.Value  := 0;
      AccountsCashReceiptCQtyEdit.Value := 0;
      AccountsCashReceiptCAmtEdit.Value := 0;
    end;
  finally
    FinishQuery;
  end;

  // 신용카드
  OpenQuery('select   Sum(case when TYPE_TRD <> ''O'' and DS_TRD = ''1'' then 1             else 0 end) as CardQty, '
           +'         Sum(case when TYPE_TRD <> ''O'' and DS_TRD = ''1'' then AMT_APPROVAL  else 0 end) as CardAmt, '
           +'         Sum(case when TYPE_TRD <> ''O'' and DS_TRD = ''2'' then 1             else 0 end) as CardCQty, '
           +'         Sum(case when TYPE_TRD <> ''O'' and DS_TRD = ''2'' then -AMT_APPROVAL else 0 end) as CardCAmt, '
           +'         Sum(case when TYPE_TRD =  ''O'' and DS_TRD = ''1'' then 1             else 0 end) as EasyCheckQty, '
           +'         Sum(case when TYPE_TRD =  ''O'' and DS_TRD = ''1'' then AMT_APPROVAL  else 0 end) as EasyCheckAmt, '
           +'         Sum(case when TYPE_TRD =  ''O'' and DS_TRD = ''2'' then 1             else 0 end) as EasyCheckCQty, '
           +'         Sum(case when TYPE_TRD =  ''O'' and DS_TRD = ''2'' then -AMT_APPROVAL else 0 end) as EasyCheckCAmt '
           +'from     SL_CARD (nolock)'
           +'where    CD_STORE = :P0 '
           +'  and    YMD_SALE = :P1 '
           +'  and    NO_POS   = :P2 '
           +'  and    CD_SAWON = :P3',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      AccountsCardQtyEdit.Value       := Query.Fields[0].AsCurrency;
      AccountsCardAmtEdit.Value       := Query.Fields[1].AsCurrency;
      AccountsCardCQtyEdit.Value      := Query.Fields[2].AsCurrency;
      AccountsCardCAmtEdit.Value      := Query.Fields[3].AsCurrency;
      AccountsEasyCheckQtyEdit.Value  := Query.Fields[4].AsCurrency;
      AccountsEasyCheckAmtEdit.Value  := Query.Fields[5].AsCurrency;
      AccountsEasyCheckCQtyEdit.Value := Query.Fields[6].AsCurrency;
      AccountsEasyCheckCAmtEdit.Value := Query.Fields[7].AsCurrency;
    end
    else
    begin
      AccountsCardQtyEdit.Value       := 0;
      AccountsCardAmtEdit.Value       := 0;
      AccountsCardCQtyEdit.Value      := 0;
      AccountsCardCAmtEdit.Value      := 0;
      AccountsEasyCheckQtyEdit.Value  := 0;
      AccountsEasyCheckAmtEdit.Value  := 0;
      AccountsEasyCheckCQtyEdit.Value := 0;
      AccountsEasyCheckCAmtEdit.Value := 0;
    end;
  finally
    FinishQuery;
  end;

  // OK캐쉬백 사용
  OpenQuery('select   Count(*)          as OkCashbagQty, '
           +'         Sum(AMT_APPROVAL) as OkCashbagAmt '
           +'from     SL_CASHBAG (nolock) '
           +'where    CD_STORE = :P0 '
           +'  and    YMD_SALE = :P1 '
           +'  and    NO_POS   = :P2 '
           +'  and    CD_SAWON = :P3',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      AccountsOKCashbagQtyEdit.Value := Query.Fields[0].AsCurrency;
      AccountsOKCashbagAmtEdit.Value := Query.Fields[1].AsCurrency;
    end
    else
    begin
      AccountsOKCashbagQtyEdit.Value := 0;
      AccountsOKCashbagAmtEdit.Value := 0;
    end;
  finally
    FinishQuery;
  end;

  // T-money
  OpenQuery('select   Count(*)  as TmoneyQty, '
           +'         Sum(MPDA) as TmoneyAmt '
           +'from     SL_TMONEY (nolock) '
           +'where    CD_STORE = :P0 '
           +'  and    YMD_SALE = :P1 '
           +'  and    NO_POS   = :P2 '
           +'  and    CD_SAWON = :P3',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      AccountsTmoneyQtyEdit.Value := Query.Fields[0].AsCurrency;
      AccountsTmoneyAmtEdit.Value := Query.Fields[1].AsCurrency;
    end
    else
    begin
      AccountsTmoneyQtyEdit.Value := 0;
      AccountsTmoneyAmtEdit.Value := 0;
    end;
  finally
    FinishQuery;
  end;

  // 정정, 단품할인
  OpenQuery('select   Sum(case when Isnull(d.MODIFY,'''') = '''' then 0 else 1                     end) as ModifyQty, '
           +'         Sum(case when Isnull(d.MODIFY,'''') = '''' then 0 else d.AMT_SALE - d.DC_TOT end) as ModifyAmt, '
           +'         Sum(case when d.DC_SPC    <> 0 then 1 else 0 end)                    as DCSpcQty, '
           +'         Sum(d.DC_SPC)                                                        as DCSpcAmt, '
           +'         Sum(case when d.DC_GOODS  <> 0 then 1 else 0 end)                    as DCGoodsQty, '
           +'         Sum(d.DC_GOODS)                                                      as DCGoodsAmt, '
           +'         Sum(case when d.DC_COUPON <> 0 then 1 else 0 end)                    as DCCouponQty, '
           +'         Sum(d.DC_COUPON)                                                     as DCCouponAmt, '
           +'         Sum(case when d.DC_CMS    <> 0 then 1 else 0 end)                    as DCCmsQty, '
           +'         Sum(d.DC_CMS)                                                        as DCCmsAmt '
           +'from     SL_SALE_H as h (nolock) inner join '
           +'         SL_SALE_D as d (nolock) on h.CD_STORE = d.CD_STORE and h.YMD_SALE = d.YMD_SALE and h.NO_POS = d.NO_POS and h.NO_RCP = d.NO_RCP '
           +'where    h.CD_STORE = :P0 '
           +'  and    h.YMD_SALE = :P1 '
           +'  and    h.NO_POS   = :P2 '
           +'  and    h.CD_SAWON = :P3 '
           +'  and    h.DS_SALE <> ''V''',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      AccountsModifyQtyEdit.Value := Query.Fields[0].AsCurrency;
      AccountsModifyAmtEdit.Value := Query.Fields[1].AsCurrency;
      DCSpcQty                    := Query.Fields[2].AsCurrency;
      DCSpcAmt                    := Query.Fields[3].AsCurrency;
      DCGoodsQty                  := Query.Fields[4].AsCurrency;
      DCGoodsAmt                  := Query.Fields[5].AsCurrency;
      DCCouponQty                 := Query.Fields[6].AsCurrency;
      DCCouponAmt                 := Query.Fields[7].AsCurrency;
      DCCmsQty                    := Query.Fields[8].AsCurrency;
      DCCmsAmt                    := Query.Fields[9].AsCurrency;
    end
    else
    begin
      AccountsModifyQtyEdit.Value := 0;
      AccountsModifyAmtEdit.Value := 0;
      DCSpcQty                    := 0;
      DCSpcAmt                    := 0;
      DCGoodsQty                  := 0;
      DCGoodsAmt                  := 0;
      DCCouponQty                 := 0;
      DCCouponAmt                 := 0;
      DCCmsQty                    := 0;
      DCCmsAmt                    := 0;
    end;
  finally
    FinishQuery;
  end;

  // 전체취소
  OpenQuery('select   Sum(case when a.SEQ2 = 1 then 1 else 0 end) as CancelQty, '
           +'         Sum(b.PR_SALE * a.QTY_CANCEL)               as CancelAmt '
           +'from     SL_SALE_C as a (nolock) inner join '
           +'         MS_GOODS  as b (nolock) on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
           +'where    a.CD_STORE = :P0 '
           +'  and    a.YMD_SALE = :P1 '
           +'  and    a.NO_POS   = :P2 '
           +'  and    a.CD_SAWON = :P3',
            [StoreCode,
             aCloseDate,
             aPosNo,
             aCashierNo]);
  try
    if not Query.Eof then
    begin
      AccountsCancelQtyEdit.Value := Query.Fields[0].AsCurrency;
      AccountsCancelAmtEdit.Value := Query.Fields[1].AsCurrency;
    end
    else
    begin
      AccountsCancelQtyEdit.Value := 0;
      AccountsCancelAmtEdit.Value := 0;
    end;
  finally
    FinishQuery;
  end;

  // 계산값
  AccountsTotalAmtEdit.Value  := AccountsSaleAmtEdit.Value + AccountsReturnAmtEdit.Value;
  AccountsDCQtyEdit.Value     := DCGoodsQty + DCReceiptQty + DCEnuriQty + DCPointQty;
  AccountsDCAmtEdit.Value     := DCGoodsAmt + DCReceiptAmt + DCEnuriAmt + DCPointAmt;
  AccountsAutoDCQtyEdit.Value := DCSpcQty + DCCouponQty + DCCmsQty + DCMemberQty + DCCutQty;
  AccountsAutoDCAmtEdit.Value := DCSpcAmt + DCCouponAmt + DCCmsAmt + DCMemberAmt + DCCutAmt;


  // 기본 준비금, 중간출금을 넣는다
  if aClearDepositAmt and (ReserveOldAmtEdit.Value = 0) and
     ((aPosNo > '00') and (aPosNo <= '90')) then  // 정상 POS일 때만
  begin
    OpenQuery('select   AMT_DEFREADY '
             +'from     MS_STORE '
             +'where    CD_STORE = :P0',
              [StoreCode]);
    try
      if Query.Fields[0].AsCurrency > 0 then
        ReserveAmtEdit.Value := Query.Fields[0].AsCurrency
      else
        ReserveAmtEdit.Value := 0;
    finally
      FinishQuery;
    end;
  end
  else if aClearDepositAmt then
  begin
    ReserveAmtEdit.Value := 0;
    FinishQuery;
  end;

// 준비금이 없으면 입력이 안된건지 어쩐지 확인이 안되어 강제로 넣게 한건데 그냥 무시하기로...
//if (ReserveOldAmtEdit.Value = 0) and (ReserveAmtEdit.Value = 0) then
//  ReserveAmtEdit.Value := 10000;

  // 자동 중간출금이거나 정상 POS가 아닐 때 중간출금 금액 구하기
  if (CheckOption(181) or (aPosNo = '00') or (aPosNo > '90')) and
     (DepositOldAmtEdit.Value = 0) then
    DepositAmtEdit.Value := (ReserveOldAmtEdit.Value + ReserveAmtEdit.Value) + (CashAmt + AccountsCheckAmtEdit.Value);
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TCloseCashierCloseForm.DoGridLink;
begin
  inherited;

  ShowMsg('계산원 마감 자료를 불러오고 있습니다.', false, -1);

  GridLink(DtoS(ConditionToolBarFromDateEdit.Date),
           GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index],
           GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCashierNo.Index],
           true);

  DepositQtyEditChanged(nil);
end;
//------------------------------------------------------------------------------
// 저장 (실제 함수)
function TCloseCashierCloseForm.Save(aCloseDate, aPosNo, aCashierNo: string): Boolean;
var
  isExists: Boolean;
  vSQLText: string;
  vSeq    : Integer;
begin
  Result := false;
  // 마감 준비 후 시간이 경과되었을 수 있으므로 자료 조회를 새로 한다
  GridLink(aCloseDate, aPosNo, aCashierNo, false);

  // 계산원 가마감이 안 되어 있으면 그냥 종료
  // 포스번호가 00이면 B/O에서 매출, 포스번호가 90이상은 PDA이어서 체크하지 않는다
  if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index] <> '00') and
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index] < '90') then
    if not isTempClose then
      Exit;

  // 저장
  try
    ShowMsg('계산원 마감 중입니다.');

    BeginTrans;
    DepositQtyEditChanged(nil);

    // 기존 마감 자료가 있는지 검사한다
    isExists :=  OpenQuery('select   Top 1 CD_SAWON '
                          +'from     SL_CASHIER_MGM (nolock) '
                          +'where    CD_STORE  = :P0 '
                          +'  and    YMD_CLOSE = :P1 '
                          +'  and    NO_POS    = :P2 '
                          +'  and    CD_SAWON  = :P3 '
                          +'  and    SEQ       = 1',
                           [StoreCode,
                            aCloseDate,
                            aPosNo,
                            aCashierNo],
                            true);

    // 마감 자료 저장
    if isExists then
      vSQLText := 'update SL_CASHIER_MGM '
                 +'set    AMT_READY     = AMT_READY     + :P4, '
                 +'       AMT_MID_CASH  = AMT_MID_CASH  + :P5, '
                 +'       AMT_MID_CHECK = AMT_MID_CHECK + :P6, '
                 +'       AMT_SALE      = :P7, '
                 +'       AMT_TAX       = :P8, '
                 +'       AMT_CASH      = :P9, '
                 +'       CNT_CARD      = :P10, '
                 +'       AMT_CARD      = :P11, '
                 +'       AMT_CHECK     = :P12, '
                 +'       AMT_TRUST     = :P13, '
                 +'       AMT_GIFT      = :P14, '
                 +'       AMT_CASHRCP   = :P15, '
                 +'       AMT_OKC       = :P16, '
                 +'       AMT_TMONEY    = :P17, '
                 +'       DC_SPC        = :P18, '
                 +'       DC_GOODS      = :P19, '
                 +'       DC_COUPON     = :P20, '
                 +'       DC_CMS        = :P21, '
                 +'       DC_MEMBER     = :P22, '
                 +'       DC_RECEIPT    = :P23, '
                 +'       DC_ENURI      = :P24, '
                 +'       DC_CUT        = :P25, '
                 +'       CNT_VOID      = :P26, '
                 +'       AMT_VOID      = :P27, '
                 +'       AMT_LACK      = :P28, '
                 +'       AMT_BANPUM    = :P29, '
                 +'       CNT_CUSTOMER  = :P30, '
                 +'       AMT_AVERAGE   = :P31, '
                 +'       YN_CLOSE      = ''Y'', '
                 +'       _CHECK        = _CHECK  + :P32, '
                 +'       _50000        = _50000  + :P33, '
                 +'       _10000        = _10000  + :P34, '
                 +'       _5000         = _5000   + :P35, '
                 +'       _1000         = _1000   + :P36, '
                 +'       _500          = _500    + :P37, '
                 +'       _100          = _100    + :P38, '
                 +'       _50           = _50     + :P39, '
                 +'       _10           = _10     + :P40, '
                 +'       DT_CHANGE     = GetDate(), '
                 +'       DS_TRANS      = 0, '
                 +'       DC_POINT      = :P41, '
                 +'       REMARK        = :P42 '
                 +'where  CD_STORE      = :P0 '
                 +'  and  YMD_CLOSE     = :P1 '
                 +'  and  NO_POS        = :P2 '
                 +'  and  CD_SAWON      = :P3 '
                 +'  and  SEQ           = 1'
    else
      vSQLText := 'insert into SL_CASHIER_MGM '
                 +'( '
                 +'  CD_STORE, '
                 +'  YMD_CLOSE, '
                 +'  NO_POS, '
                 +'  CD_SAWON, '
                 +'  SEQ, '
                 +'  AMT_READY, '
                 +'  AMT_MID_CASH, '
                 +'  AMT_MID_CHECK, '
                 +'  AMT_SALE, '
                 +'  AMT_TAX, '
                 +'  AMT_CASH, '
                 +'  CNT_CARD, '
                 +'  AMT_CARD, '
                 +'  AMT_CHECK, '
                 +'  AMT_TRUST, '
                 +'  AMT_GIFT, '
                 +'  AMT_CASHRCP, '
                 +'  AMT_OKC, '
                 +'  AMT_TMONEY, '
                 +'  DC_SPC, '
                 +'  DC_GOODS, '
                 +'  DC_COUPON, '
                 +'  DC_CMS, '
                 +'  DC_MEMBER, '
                 +'  DC_RECEIPT, '
                 +'  DC_ENURI, '
                 +'  DC_CUT, '
                 +'  CNT_VOID, '
                 +'  AMT_VOID, '
                 +'  AMT_LACK, '
                 +'  AMT_BANPUM, '
                 +'  CNT_CUSTOMER, '
                 +'  AMT_AVERAGE, '
                 +'  YN_CLOSE, '
                 +'  _CHECK, '
                 +'  _50000, '
                 +'  _10000, '
                 +'  _5000, '
                 +'  _1000, '
                 +'  _500, '
                 +'  _100, '
                 +'  _50, '
                 +'  _10, '
                 +'  DT_CHANGE, '
                 +'  DS_TRANS, '
                 +'  DC_POINT, '
                 +'  REMARK, '
                 +'  DS_INSERT '
                 +') '
                 +'values '
                 +'( '
                 +'  :P0, '
                 +'  :P1, '
                 +'  :P2, '
                 +'  :P3, '
                 +'  1, '
                 +'  :P4, '
                 +'  :P5, '
                 +'  :P6, '
                 +'  :P7, '
                 +'  :P8, '
                 +'  :P9, '
                 +'  :P10, '
                 +'  :P11, '
                 +'  :P12, '
                 +'  :P13, '
                 +'  :P14, '
                 +'  :P15, '
                 +'  :P16, '
                 +'  :P17, '
                 +'  :P18, '
                 +'  :P19, '
                 +'  :P20, '
                 +'  :P21, '
                 +'  :P22, '
                 +'  :P23, '
                 +'  :P24, '
                 +'  :P25, '
                 +'  :P26, '
                 +'  :P27, '
                 +'  :P28, '
                 +'  :P29, '
                 +'  :P30, '
                 +'  :P31, '
                 +'  ''Y'', '
                 +'  :P32, '
                 +'  :P33, '
                 +'  :P34, '
                 +'  :P35, '
                 +'  :P36, '
                 +'  :P37, '
                 +'  :P38, '
                 +'  :P39, '
                 +'  :P40, '
                 +'  GetDate(), '
                 +'  0, '
                 +'  :P41, '
                 +'  :P42, '
                 +'  ''B'' '
                 +')';
    Result := ExecQuery(vSQLText,
                       [StoreCode,
                        aCloseDate,
                        aPosNo,
                        aCashierNo,
                        ReserveAmtEdit.Value,
                        DepositAmtEdit.Value - DepositCheckAmtEdit.Value,
                        DepositCheckAmtEdit.Value,
                        AccountsSaleAmtEdit.Value,
                        VatAmt,
                        CashAmt,
                        Trunc(AccountsCardQtyEdit.Value + AccountsCardCQtyEdit.Value + AccountsEasyCheckQtyEdit.Value + AccountsEasyCheckCQtyEdit.Value),
                        AccountsCardAmtEdit.Value + AccountsCardCAmtEdit.Value + AccountsEasyCheckAmtEdit.Value + AccountsEasyCheckCAmtEdit.Value,
                        AccountsCheckAmtEdit.Value,
                        AccountsCreditAmtEdit.Value,
                        AccountsGiftCardAmtEdit.Value,
                        AccountsCashReceiptAmtEdit.Value + AccountsCashReceiptCAmtEdit.Value,
                        AccountsOKCashbagAmtEdit.Value,
                        AccountsTmoneyAmtEdit.Value,
                        DCSpcAmt,
                        DCGoodsAmt,
                        DCCouponAMt,
                        DCCmsAmt,
                        DCMemberAmt,
                        DCReceiptAmt,
                        DCEnuriAmt,
                        DCCutAmt,
                        Trunc(VoidQty),
                        AccountsVoidAmtEdit.Value,
                       (DepositOldAmtEdit.Value + DepositAmtEdit.Value) - (ReserveOldAmtEdit.Value + ReserveAmtEdit.Value) - (CashAmt + AccountsCheckAmtEdit.Value),
                        AccountsReturnAmtEdit.Value,
                        Trunc(AccountsCustomerQtyEdit.Value),
                        AccountsCustomerAmtEdit.Value,
                        DepositCheckAmtEdit.Value,
                        Deposit50000AmtEdit.Value,
                        Deposit10000AmtEdit.Value,
                        Deposit5000AmtEdit.Value,
                        Deposit1000AmtEdit.Value,
                        Deposit500AmtEdit.Value,
                        Deposit100AmtEdit.Value,
                        Deposit50AmtEdit.Value,
                        Deposit10AmtEdit.Value,
                        DCPointAmt,
                        RemarkMemo.Text],
                        false);

    // 준비금 건별 데이터 저장
    if Result and (ReserveAmtEdit.Value <> 0) then
    begin
      OpenQuery('select   IsNull(Max(LIST_SEQ),0)+1 as SEQ '
               +'from     SL_CASHIER_MGM_LIST '
               +'where    CD_STORE  = :P0 '
               +'  and    YMD_CLOSE = :P1 '
               +'  and    NO_POS    = :P2 '
               +'  and    CD_SAWON  = :P3 '
               +'  and    SEQ       = 1 '
               +'  and    DS_CLOSE  = ''I''',
                [StoreCode,
                 aCloseDate,
                 aPosNo,
                 aCashierNo]);
      try
        if not Query.Eof then
          vSeq := Query.Fields[0].AsInteger
        else
          vSeq := 1;
      finally
        FinishQuery;
      end;
      Result := ExecQuery('insert into SL_CASHIER_MGM_LIST '
                         +'( '
                         +'  CD_STORE, YMD_CLOSE, NO_POS, CD_SAWON, SEQ, DS_CLOSE, LIST_SEQ, _10, DT_CHANGE, DS_INSERT '
                         +') values ( '
                         +'  :P0, :P1, :P2, :P3, 1, ''I'', :P4, :P5, GetDate(), ''B'' '
                         +')',
                          [StoreCode,
                           aCloseDate,
                           aPosNo,
                           aCashierNo,
                           vSeq,
                           ReserveAmtEdit.Value],
                           false);
    end;
    // 중간출금 건별 데이터 저장
    if Result and (DepositAmtEdit.Value <> 0) then
    begin
      OpenQuery('select   IsNull(Max(LIST_SEQ),0)+1 as SEQ '
               +'from     SL_CASHIER_MGM_LIST '
               +'where    CD_STORE  = :P0 '
               +'  and    YMD_CLOSE = :P1 '
               +'  and    NO_POS    = :P2 '
               +'  and    CD_SAWON  = :P3 '
               +'  and    SEQ       = 1 '
               +'  and    DS_CLOSE  = ''O''',
                [StoreCode,
                 aCloseDate,
                 aPosNo,
                 aCashierNo]);
      try
        if not Query.Eof then
          vSeq := Query.Fields[0].AsInteger
        else
          vSeq := 1;
      finally
        FinishQuery;
      end;
      Result := ExecQuery('insert into SL_CASHIER_MGM_LIST '
                         +'( '
                         +'  CD_STORE, YMD_CLOSE, NO_POS, CD_SAWON, SEQ, DS_CLOSE, LIST_SEQ, _CHECK, _50000, _10000, _5000, _1000, _500, _100, _50, _10, DT_CHANGE, DS_INSERT '
                         +') values ( '
                         +'  :P0, :P1, :P2, :P3, 1, ''O'', :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12, :P13, GetDate(), ''B'' '
                         +')',
                          [StoreCode,
                           aCloseDate,
                           aPosNo,
                           aCashierNo,
                           vSeq,
                           DepositCheckAmtEdit.Value,
                           Deposit50000AmtEdit.Value,
                           Deposit10000AmtEdit.Value,
                           Deposit5000AmtEdit.Value,
                           Deposit1000AmtEdit.Value,
                           Deposit500AmtEdit.Value,
                           Deposit100AmtEdit.Value,
                           Deposit50AmtEdit.Value,
                           IfThen((DepositCheckAmtEdit.Value  = 0) and
                                  (Deposit50000AmtEdit.Value  = 0) and
                                  (Deposit10000AmtEdit.Value  = 0) and
                                  (Deposit5000AmtEdit.Value   = 0) and
                                  (Deposit1000AmtEdit.Value   = 0) and
                                  (Deposit500AmtEdit.Value    = 0) and
                                  (Deposit100AmtEdit.Value    = 0) and
                                  (Deposit50AmtEdit.Value     = 0) and
                                  (Deposit10AmtEdit.Value     = 0),    DepositAmtEdit.Value, Deposit10AmtEdit.Value)],
                           false);
    end;
    // 마감 건별 데이터 저장
    if Result then
    begin
      OpenQuery('select   IsNull(Max(LIST_SEQ),0)+1 as SEQ '
               +'from     SL_CASHIER_MGM_LIST '
               +'where    CD_STORE  = :P0 '
               +'  and    YMD_CLOSE = :P1 '
               +'  and    NO_POS    = :P2 '
               +'  and    CD_SAWON  = :P3 '
               +'  and    SEQ       = 1 '
               +'  and    DS_CLOSE  = ''C''',
                [StoreCode,
                 aCloseDate,
                 aPosNo,
                 aCashierNo]);
      try
        if not Query.Eof then
          vSeq := Query.Fields[0].AsInteger
        else
          vSeq := 1;
      finally
        FinishQuery;
      end;
      Result := ExecQuery('insert into SL_CASHIER_MGM_LIST '
                         +'( '
                         +'  CD_STORE, YMD_CLOSE, NO_POS, CD_SAWON, SEQ, DS_CLOSE, LIST_SEQ, _10, DT_CHANGE, DS_INSERT '
                         +') values ( '
                         +'  :P0, :P1, :P2, :P3, 1, ''C'', :P4, :P5, GetDate(), ''B'' '
                         +')',
                          [StoreCode,
                           aCloseDate,
                           aPosNo,
                           aCashierNo,
                           vSeq,
                           CashAmt + AccountsCheckAmtEdit.Value],
                           false);
    end;

    CommitTrans;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TCloseCashierCloseForm.DoSave: Boolean;
begin
  Result := false;

  //비고만 수정
  if ButtonToolBarSaveButton.Tag = 1 then
  begin
    ExecQuery('update SL_CASHIER_MGM set REMARK = :P4 '
             +' where CD_STORE =:P0 '
             +'   and YMD_CLOSE=:P1 '
             +'   and NO_POS   =:P2 '
             +'   and CD_SAWON =:P3 ',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index],
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCashierNo.Index],
              RemarkMemo.Text],
              true);
    Result := true;
    Exit;
  end;

  // 포스번호가 00이면 B/O에서 매출, 포스번호가 90이상은 PDA이어서 체크하지 않는다
  if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index] <> '00') and
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index] < '90') then
  begin
    // 준비금 입력 확인
    if (ReserveOldAmtEdit.Value = 0) and (ReserveAmtEdit.Value = 0) then
    begin
      ErrBox(Trim(ReserveGroupBox.Caption)+msgMustInput);
      if MainPanel.Enabled and ReserveAmtEdit.Enabled then
        ReserveAmtEdit.SetFocus;
      Exit;
    end
    else if (ReserveOldAmtEdit.Value <> 0) and (ReserveAmtEdit.Value <> 0) then
    begin
      if not AskBox(Format('기존 %s 금액이 있습니다.'#13'기존 %s원에 새로 입력한 %s원이 더해져'#13'%s원이 %s으로 입력됩니다.'#13#13'%s하시겠습니까?', [Trim(ReserveGroupBox.Caption), FormatFloat(fmtComma, ReserveOldAmtEdit.Value), FormatFloat(fmtComma, ReserveAmtEdit.Value), FormatFloat(fmtComma, ReserveOldAmtEdit.Value+ReserveAmtEdit.Value), Trim(ReserveGroupBox.Caption), Caption])) then
        Exit;
    end;
    // 중간출금 입력 확인
    if (DepositOldAmtEdit.Value = 0) and (DepositAmtEdit.Value = 0) then
    begin
      ErrBox(Trim(DepositGroupBox.Caption)+msgMustInput);
      if MainPanel.Enabled and Deposit10000QtyEdit.Enabled then
        Deposit10000QtyEdit.SetFocus;
      Exit;
    end
    else if (DepositOldAmtEdit.Value <> 0) and (DepositAmtEdit.Value <> 0) then
    begin
      if not AskBox(Format('기존 %s 금액이 있습니다.'#13'기존 %s원에 새로 입력한 %s원이 더해져'#13'%s원이 %s로 입력됩니다.'#13#13'%s하시겠습니까?', [DepositOldAmtLabel.Caption, FormatFloat(fmtComma, DepositOldAmtEdit.Value), FormatFloat(fmtComma, DepositAmtEdit.Value), FormatFloat(fmtComma, DepositOldAmtEdit.Value+DepositAmtEdit.Value), Trim(DepositGroupBox.Caption), Caption])) then
        Exit;
    end;
    // 계산원 가마감이 되어 있는지 확인
    if not isTempClose then
    begin
      ErrBox('계산원 가마감이 되어있지 않아 마감을 할 수 없습니다.'#13'POS에서 계산원 가마감을 먼저 하십시오.');
      Exit;
    end
    // 시간 확인
    else if (ConditionToolBarFromDateEdit.Date = Date) and (HourOf(Time) < 7) and
            (not AskBox(ConditionToolBarFromDateEdit.Text+'(오늘) 날짜로 마감하는 것이 맞습니까?')) then
      Exit;

    // 마지막 확인
    if not AskBox('POS에서 오프라인 판매가 되고 아직 서버(DB)로 올라오지 않은 자료가 있을 경우 해당 자료가 마감 누락될 수 있습니다.'#13'계산원 마감을 하시겠습니까?') then
      Exit;
  end;

  // 마감
  Result := Save(DtoS(ConditionToolBarFromDateEdit.Date),
                 GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index],
                 GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCashierNo.Index]);

  if Result then
  begin
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] := msgClose;

    // 해당 계산원 정보를 다시 읽는다
    GridLink(DtoS(ConditionToolBarFromDateEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index],
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCashierNo.Index],
             true);

    ButtonToolBarSaveButton.Enabled := false;
    MsgBox(Format('%s을 완료했습니다.', [Caption]));
  end;
end;

end.
