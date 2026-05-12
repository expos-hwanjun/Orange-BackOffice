// POS 마감 취소 (완료)

unit ClosePosClose;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  cxContainer, cxEdit, Uni, DB, MemDS, cxTextEdit, cxDropDownEdit,
  cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess;

type
  TClosePosCloseForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewReserveAmt: TcxGridColumn;
    GridTableViewDepositAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewOverShortAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewVoidAmt: TcxGridColumn;
    GridTableViewReturnAmt: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewCloseDate: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);

  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave: Boolean; override;   // 마감
  end;

var
  ClosePosCloseForm: TClosePosCloseForm;



implementation

uses
  Common, DBModule, CloseCashierClose;

const
  msgOpen  = '개점';
  msgClose = '마감';

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TClosePosCloseForm.FormCreate(Sender: TObject);
begin
  inherited;

  DefaultDate := ddToday;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TClosePosCloseForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 마감 버튼
procedure TClosePosCloseForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  inherited;

  if DoSave then
    isChanged := false;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TClosePosCloseForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  ButtonToolBarSaveButton.Enabled   := (AFocusedRecord <> nil) and (AFocusedRecord.Index >= 0) and (AFocusedRecord.Values[GridTableViewStatus.Index] = msgOpen);
  ButtonToolBarDeleteButton.Enabled := (AFocusedRecord <> nil) and (AFocusedRecord.Index >= 0) and (AFocusedRecord.Values[GridTableViewStatus.Index] = msgClose);
  isChanged := ButtonToolBarSaveButton.Enabled;
end;
//------------------------------------------------------------------------------
// 그리드 스타일 적용
procedure TClosePosCloseForm.GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
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
// 함수
//------------------------------------------------------------------------------
// 조회
function TClosePosCloseForm.DoSearch: Boolean;
begin
  Result := false;

  try
    OpenQuery('select   dbo.StoDW(YMD_CLOSE) as YMD_CLOSE, '
             +'         NO_POS, '
             +'         '''+msgClose+''' as DS_STATUS, '
             +'         AMT_READY, '
             +'         AMT_MID, '
             +'         AMT_CASH + AMT_CHECK as AMT_CASH, '
             +'         AMT_LACK, '
             +'         AMT_SALE, '
             +'         AMT_VOID, '
             +'         AMT_BANPUM '
             +'from     SL_POSCLOSE '
             +'where    CD_STORE  = :P0 '
             +'  and    YMD_CLOSE between :P1 and :P2 '
             +'  and    DS_STATUS = ''C'' '
             +'union all '
             +'select   dbo.StoDW(a.YMD_SALE) as YMD_CLOSE, '
             +'         a.NO_POS, '
             +'         '''+msgOpen+''' as DS_STATUS, '
             +'         0, 0, 0, 0, 0, 0, 0 '
             +'from     SL_SALE_H   as a left outer join '
             +'         SL_POSCLOSE as b on a.CD_STORE = b.CD_STORE and a.YMD_SALE = b.YMD_CLOSE and a.NO_POS = b.NO_POS '
             +'where    a.CD_STORE  = :P0 '
             +'  and    a.YMD_SALE  between :P1 and :P2 '
             +'  and   (b.DS_STATUS = ''O'' or b.YMD_CLOSE is null) '
             +'group by a.CD_STORE, a.YMD_SALE, a.NO_POS '
             +'order by YMD_CLOSE, NO_POS, DS_STATUS',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  except
  end;
end;
//------------------------------------------------------------------------------
// 마감
function TClosePosCloseForm.DoSave: Boolean;
var
  vCloseDate, vPosNo: string;
  vEmpList: TStringList;
  vCode   : PStrPointer;
  vIndex  : Integer;
begin
  Result := false;

  vCloseDate := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCloseDate.Index]);
  vPosNo     := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index];

  // 판매는 있는데 계산원 마감을 하지 않은 계산원이 있다면 POS 마감을 못한다
  vEmpList := TStringList.Create;
  OpenQuery('select   b.NM_SAWON+''(''+a.CD_SAWON+'')'' as NM_SAWON, '
           +'         a.CD_SAWON '
           +'from    (select   CD_STORE, '
           +'                  CD_SAWON, '
           +'                  Max(DT_CHANGE1) as DT_CHANGE1, '
           +'                  Max(DT_CHANGE2) as DT_CHANGE2 '
           +'         from    (select   CD_STORE, '
           +'                           CD_SAWON, '
           +'                           Max(DT_SALE) as DT_CHANGE1, '
           +'                           null         as DT_CHANGE2 '
           +'                  from     SL_SALE_H '
           +'                  where    CD_STORE = :P0 '
           +'                    and    YMD_SALE = :P1 '
           +'                    and    NO_POS   = :P2 '
           +'                  group by CD_STORE, CD_SAWON '
           +'                  union all '
           +'                  select   CD_STORE, '
           +'                           CD_SAWON, '
           +'                           null           as DT_CHANGE1, '
           +'                           Max(DT_CHANGE) as DT_CHANGE2 '
           +'                  from     SL_CASHIER_MGM '
           +'                  where    CD_STORE  = :P0 '
           +'                    and    YMD_CLOSE = :P1 '
           +'                    and    NO_POS    = :P2 '
           +'                    and    YN_CLOSE  = ''Y'' '
           +'                  group by CD_STORE, CD_SAWON) as c '
           +'         group by CD_STORE, CD_SAWON) as a left outer join '
           +'         MS_SAWON as b on a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
           +'where   (a.DT_CHANGE1 > a.DT_CHANGE2) '
           +'     or (a.DT_CHANGE1 is not null and a.DT_CHANGE2 is null) ',
            [StoreCode,
             vCloseDate,
             vPosNo]);
  try
    if not Query.Eof then
      if not AskBox(Format('%s님이 계산원 마감을 하지 않아'#13'POS 마감을 할 수 없습니다.'#13#13'강제로 계산원 마감을 한 후 POS 마감을 하시겠습니까?', [Query.Fields[0].AsString])) then
        Exit
      else
        while not Query.Eof do
        begin
          New(vCode);
          vCode^.Data := Query.Fields[0].AsString;
          vEmpList.AddObject(Query.Fields[1].AsString, TObject(vCode));
          Query.Next;
        end;
  finally
    FinishQuery;
  end;

  // 계산원 마감을 먼저 하라면 먼저 한다
  if vEmpList.Count > 0 then
    // 한 명씩 마감을 한다
    with TCloseCashierCloseForm.Create(self) do
      try
        self.Left := 0;
        self.Top  := 0;
        ShowWindow(Handle, SW_HIDE);
        for vIndex := 0 to vEmpList.Count-1 do
          if not Save(vCloseDate, vPosNo, vEmpList[vIndex]) then
          begin
            vCode := PStrPointer(vEmpList.Objects[vIndex]);
            ErrBox(Format('%s님 계산원 마감을 하지 못했습니다.'#13'[계산원 마감] 프로그램에서 마감을 해 주십시오.', [vCode.Data]));
            Exit;
          end;
      finally
        Free;
      end;

  // POS 마감을 한다
  try
    ShowMsg('POS 마감 중입니다.');

    BeginTrans;
    Result := ExecQuery('delete from SL_POSCLOSE '
                       +'where  CD_STORE  = :P0 '
                       +'  and  YMD_CLOSE = :P1 '
                       +'  and  NO_POS    = :P2',
                        [StoreCode,
                         vCloseDate,
                         vPosNo],
                         false);
    if Result then
      Result := ExecQuery('insert into SL_POSCLOSE '
                         +'( '
                         +'  CD_STORE, '
                         +'  YMD_CLOSE, '
                         +'  NO_POS, '
                         +'  DS_STATUS, '
                         +'  AMT_READY, '
                         +'  AMT_MID, '
                         +'  AMT_ACCT_IN, '
                         +'  AMT_ACCT_OUT, '
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
                         +'  AMT_VOID, '
                         +'  AMT_LACK, '
                         +'  AMT_BANPUM, '
                         +'  CNT_CASHIER, '
                         +'  CNT_CUSTOMER, '
                         +'  DT_CREATE, '
                         +'  DT_CHANGE, '
                         +'  DS_TRANS, '
                         +'  DC_POINT '
                         +') '
                         +'select   CD_STORE, '
                         +'         YMD_CLOSE, '
                         +'         NO_POS, '
                         +'         ''C''             as DS_STATUS, '
                         +'         Sum(AMT_READY)    as AMT_READY, '
                         +'         Sum(AMT_MID)      as AMT_MID, '
                         +'         Sum(AMT_ACCT_IN)  as AMT_ACCT_IN, '
                         +'         Sum(AMT_ACCT_OUT) as AMT_ACCT_OUT, '
                         +'         Sum(AMT_SALE)     as AMT_SALE, '
                         +'         Sum(AMT_TAX)      as AMT_TAX, '
                         +'         Sum(AMT_CASH)     as AMT_CASH, '
                         +'         Sum(CNT_CARD)     as CNT_CARD, '
                         +'         Sum(AMT_CARD)     as AMT_CARD, '
                         +'         Sum(AMT_CHECK)    as AMT_CHECK, '
                         +'         Sum(AMT_TRUST)    as AMT_TRUST, '
                         +'         Sum(AMT_GIFT)     as AMT_GIFT, '
                         +'         Sum(AMT_CASHRCP)  as AMT_CASHRCP, '
                         +'         Sum(AMT_OKC)      as AMT_OKC, '
                         +'         Sum(AMT_TMONEY)   as AMT_TMONEY, '
                         +'         Sum(DC_SPC)       as DC_SPC, '
                         +'         Sum(DC_GOODS)     as DC_GOODS, '
                         +'         Sum(DC_COUPON)    as DC_COUPON, '
                         +'         Sum(DC_CMS)       as DC_CMS, '
                         +'         Sum(DC_MEMBER)    as DC_MEMBER, '
                         +'         Sum(DC_RECEIPT)   as DC_RECEIPT, '
                         +'         Sum(DC_ENURI)     as DC_ENURI, '
                         +'         Sum(DC_CUT)       as DC_CUT, '
                         +'         Sum(AMT_VOID)     as AMT_VOID, '
                         +'         Sum(AMT_LACK)     as AMT_LACK, '
                         +'         Sum(AMT_BANPUM)   as AMT_BANPUM, '
                         +'         Count(*)          as CNT_CASHIER, '
                         +'         Sum(CNT_CUSTOMER) as CNT_CUSTOMER, '
                         +'         GetDate(), '
                         +'         GetDate(), '
                         +'         0 as DS_TRANS, '
                         +'         Sum(DC_POINT)     as DC_POINT '
                         +'from     SL_CASHIER_MGM '
                         +'where    CD_STORE  = :P0 '
                         +'  and    YMD_CLOSE = :P1 '
                         +'  and    NO_POS    = :P2 '
                         +'group by CD_STORE, YMD_CLOSE, NO_POS',
                          [StoreCode,
                           vCloseDate,
                           vPosNo],
                           false);
    CommitTrans;

    if Result then
    begin
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] := msgClose;
      ButtonToolBarSaveButton.Enabled   := false;
      ButtonToolBarDeleteButton.Enabled := true;
    end;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 마감 취소
function TClosePosCloseForm.DoDelete: Boolean;
begin
  Result := false;

  if GridTableView.DataController.FocusedRecordIndex < 0 then
    Exit;
{
  // 일마감을 했다면 POS 마감 취소를 못하게 막는다
  if OpenQuery('select   YMD_CLOSE '
              +'from     SL_CLOSE_DAY '
              +'where    CD_STORE = :P0 '
              +'  and    YMD_CLOSE = :P1 ',
               [StoreCode,
                GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCloseDate.Index])],
                true) then
  begin
    ErrBox('일 마감이 되어 POS 마감을 할 수 없습니다.');
    FinishQuery;
    Exit;
  end;

  FinishQuery;
}
  // 월마감을 했다면 POS 마감 취소를 못하게 막는다
  if OpenQuery('select   Top 1 YM_STOCK '
              +'from     SL_STOCK_MONTH '
              +'where    CD_STORE = :P0 '
              +'  and    YM_STOCK = :P1 '
              +'  and    YN_CLOSE = ''Y''',
               [StoreCode,
                Copy(GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCloseDate.Index]), 1, 6)],
                true) then
  begin
    ErrBox('월 마감이 되어 POS 마감을 할 수 없습니다.');
    FinishQuery;
    Exit;
  end;

  // POS 마감 취소를 한다
  Result := ExecQuery('update SL_POSCLOSE '
                     +'set    DS_STATUS     = ''O'', '
                     +'       AMT_READY     = 0, '
                     +'       AMT_MID       = 0, '
                     +'       AMT_ACCT_IN   = 0, '
                     +'       AMT_ACCT_OUT  = 0, '
                     +'       AMT_SALE      = 0, '
                     +'       AMT_TAX       = 0, '
                     +'       AMT_CASH      = 0, '
                     +'       CNT_CARD      = 0, '
                     +'       AMT_CARD      = 0, '
                     +'       AMT_CHECK     = 0, '
                     +'       AMT_TRUST     = 0, '
                     +'       AMT_GIFT      = 0, '
                     +'       AMT_CASHRCP   = 0, '
                     +'       AMT_OKC       = 0, '
                     +'       AMT_TMONEY    = 0, '
                     +'       DC_SPC        = 0, '
                     +'       DC_GOODS      = 0, '
                     +'       DC_COUPON     = 0, '
                     +'       DC_CMS        = 0, '
                     +'       DC_MEMBER     = 0, '
                     +'       DC_RECEIPT    = 0, '
                     +'       DC_ENURI      = 0, '
                     +'       DC_CUT        = 0, '
                     +'       AMT_VOID      = 0, '
                     +'       AMT_LACK      = 0, '
                     +'       AMT_BANPUM    = 0, '
                     +'       CNT_CASHIER   = 0, '
                     +'       CNT_CUSTOMER  = 0, '
                     +'       DT_CHANGE     = GetDate(), '
                     +'       DS_TRANS      = 0, '
                     +'       YN_DATADELETE = null, '
                     +'       DC_POINT      = 0 '
                     +'where  CD_STORE      = :P0 '
                     +'  and  YMD_CLOSE     = :P1 '
                     +'  and  NO_POS        = :P2',
                      [StoreCode,
                       GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCloseDate.Index]),
                       GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index]]);
  if Result then
  begin
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStatus.Index] := msgOpen;
    ButtonToolBarSaveButton.Enabled   := true;
    ButtonToolBarDeleteButton.Enabled := false;
  end;
end;

end.
