// 출납 (New완료)

unit HeadDeposit;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, Math,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, cxGridBandedTableView, DateUtils,
  cxMemo;

type
  THeadDepositForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    ButtonToolBarCancelButton: TAdvGlowButton;
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewAcctNo: TcxGridBandedColumn;
    GridBandedTableViewStoreCode: TcxGridBandedColumn;
    GridBandedTableViewStoreName: TcxGridBandedColumn;
    GridBandedTableViewLastSaleDate: TcxGridBandedColumn;
    GridBandedTableViewLastGetDate: TcxGridBandedColumn;
    GridBandedTableViewRemainAmt: TcxGridBandedColumn;
    GridBandedTableViewBalanceAmt: TcxGridBandedColumn;
    GridBandedTableViewGetAmt: TcxGridBandedColumn;
    GridBandedTableViewDcAmt: TcxGridBandedColumn;
    GridBandedTableViewRealGetAmt: TcxGridBandedColumn;
    GridBandedTableViewNetAmt: TcxGridBandedColumn;
    GridBandedTableViewDutyfreeAmt: TcxGridBandedColumn;
    GridBandedTableViewAcctType: TcxGridBandedColumn;
    GridBandedTableViewRemark: TcxGridBandedColumn;
    GridBandedTableViewSplit: TcxGridBandedColumn;
    GridBandedTableViewRowState: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridBandedTableViewGetAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewDcAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewRealGetAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewNetAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewDutyfreeAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewStoreCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridBandedTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridBandedTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridBandedTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);

  private
    BackupData: array of Variant;
    isSearch  : Boolean;
    function  SearchStore(aStore: string = ''): string;
    procedure ButtonEnable;
    function  GetRemainAmt(aStoreCode:String):Currency;
    function  GetLastGetDate(aStoreCode:String):String;
    function  GetLastSaleDate(aStoreCode:String):String;
    procedure SetNetTaxDutyfree;

  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave: Boolean; override;   // 저장
  end;

var
  HeadDepositForm: THeadDepositForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure THeadDepositForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
  isSearch    := false;
  GridBandedTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridBandedTableView.DataController.Filter.Active := true;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure THeadDepositForm.FormShow(Sender: TObject);
begin
  inherited;
  isChanged := false;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure THeadDepositForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vCode, vName: string;
begin
  inherited;

  // 그리드 OnKeyDown 이벤트는 Enter키 입력이 되지 않아서 폼에서 처리한다
  if (Key = VK_Return) and (GridBandedTableView.Focused) then
  begin
    GridBandedTableView.DataController.PostEditingData;
    // 출납코드
    if GridBandedTableView.Controller.FocusedColumnIndex = GridBandedTableViewStoreCode.Index then
    begin
      if (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreCode.Index] = null) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreCode.Index] = EmptyStr) then
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreName.Index] := EmptyStr
      else
      begin
        OpenQuery('select   CD_STORE, '
                 +'         NM_STORE '
                 +'  from   MS_STORE '
                 +' where   CD_HEAD   = :P0 '
                 +'   and   CD_STORE  <> ''00000000'' '
                 +'   and  (CD_STORE  = :P1 '
                 +'      or NM_STORE like ConCat(''%'',:P1,''%'')) '
                 +'   and   YN_USE = ''Y'' ',
                 [HeadStoreCode,
                  GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreCode.Index]]);
        try
          if not Query.Eof then
          begin
            // 일단 첫번째 값을 받아 놓는다
            vCode := Query.Fields[0].AsString;
            vName := Query.Fields[1].AsString;
            // 쿼리 다음 줄로 이동해 본다
            Query.Next;
            // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
            if Query.Eof then
            begin
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewAcctNo.Index]    := '신규';
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index] := vCode;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreName.Index] := vName;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index] := rsInsert;
              Query.Close;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRemainAmt.Index]  := GetRemainAmt(vCode);
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewLastGetDate.Index]  := GetLastGetDate(vCode);
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewLastSaleDate.Index] := GetLastSaleDate(vCode);
              GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewGetAmt.Index;
            end
            // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
            else
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreCode.Index] := SearchStore(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreCode.Index]);
          end
          else
            SearchStore(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index]);
        finally
          FinishQuery;
        end;
      end;
    end

    // 비고
    else if GridBandedTableView.Controller.FocusedColumnIndex = GridBandedTableViewRemark.Index then
    begin
      // 입력 안 한 값이 있으면 그곳으로 포커스를 옮긴다
      if (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreCode.Index] = null) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreCode.Index] = EmptyStr) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreName.Index] = null) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewStoreName.Index] = EmptyStr) then
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewStoreCode.Index
      else if (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewGetAmt.Index] = null) or
              (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewGetAmt.Index] = 0) then
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewGetAmt.Index
      else
      begin
        GridBandedTableView.DataController.Post;
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewStoreCode.Index;
      end;
    end

    // 기타
    else
      GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableView.Controller.FocusedColumnIndex + 1;
  end;
end;

function THeadDepositForm.GetLastGetDate(aStoreCode: String): String;
begin
  DM.OpenQuery('select  StoDW(Max(YMD_OCCUR)) as YMD_OCCUR '
              +'  from  SL_ACCT  '
              +' where  CD_HEAD  =:P0 '
              +'   and  CD_STORE =:P1 '
              +'   and  YMD_OCCUR >:P2 '
              +'   and  CD_ACCT ='''+varGetCode+'''',
              [StoreCode,
               aStoreCode,
               DtoS(IncMonth(Now, -12))]);
  try
    if not DM.Query.Eof then
    begin
      Result := DM.Query.Fields[0].AsString;
    end;
  finally
    DM.FinishQuery;
  end;
end;

function THeadDepositForm.GetLastSaleDate(aStoreCode: String): String;
begin
  DM.OpenQuery('select  StoDW(Max(YMD_SALE)) as YMD_SALE '
              +'  from  OL_SALE_H  '
              +' where  CD_HEAD  =:P0 '
              +'   and  CD_STORE =:P1 ',
              [StoreCode,
               aStoreCode]);
  try
    if not DM.Query.Eof then
    begin
      Result := DM.Query.Fields[0].AsString;
    end;
  finally
    DM.FinishQuery;
  end;

end;

function THeadDepositForm.GetRemainAmt(aStoreCode: String): Currency;
begin
  DM.OpenQuery('select   Sum(ifnull(AMT_BASE,0) + ifnull(AMT_SALE,0) - ifnull(AMT_GET,0)) as AMT_REMAIN '
              +'from    (select   AMT_BASE, '
              +'                  0 as AMT_SALE, '
              +'                  0 as AMT_GET '
              +'           from   SL_BOOKS_MONTH '
              +'          where   CD_HEAD  =:P0 '
              +'            and   CD_CLOSE = '''+varOrderClose+''' '
              +'            and   CD_CODE  =:P1 '
              +'            and   YM_CLOSE = '''+ LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+''' '
              +'          union all '
              +'         select   0 as AMT_BASE, '
              +'                  Sum(AMT_SALE) as AMT_SALE, '
              +'                  0 as AMT_GET '
              +'           from   OL_SALE_H '
              +'          where   CD_HEAD  =:P0 '
              +'            and   CD_STORE =:P1 '
              +'            and   YMD_SALE Between ConCat('''+ LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+''',''00'') and '''+DtoS(ConditionToolBarFromDateEdit.Date)+''' '
              +'          union all '
              +'         select   0 as AMT_BASE, '
              +'                  0 as AMT_SALE, '
              +'                  Sum(AMT_PAYIN+AMT_DC) as AMT_GET '
              +'           from   SL_ACCT '
              +'          where   CD_HEAD  =:P0 '
              +'            and   CD_STORE =:P1 '
              +'            and   CD_TRDPL =:P1 '
              +'            and   YMD_OCCUR Between ConCat('''+ LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+''',''00'') and '''+DtoS(ConditionToolBarFromDateEdit.Date)+''' '
              +'            and   CD_ACCT = '''+varGetCode+''''
              +'         ) as t ',
               [HeadStoreCode,
                aStoreCode]);
  try
    if not DM.Query.Eof then
      Result := DM.Query.Fields[0].AsCurrency;
  finally
    DM.FinishQuery;
  end;
end;

procedure THeadDepositForm.GridBandedTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if not isLoading then
    isChanged := true;

  //조회를 안하고 신규를 바로 입력했을때
  if ConditionToolBarFromDateEdit.Enabled then
  begin
    ConditionToolBarFromDateEdit.Enabled := false;
    ButtonToolBarSearchButton.Enabled    := false;
    ButtonToolBarCancelButton.Enabled    := true;
  end;

end;

procedure THeadDepositForm.GridBandedTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;

  // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
  if (ADataController.NewItemRowFocused) and
     ((Nvl(ADataController.Values[ADataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index], EmptyStr) = EmptyStr) or
      (Nvl(ADataController.Values[ADataController.GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index],      0.0)      = 0.0)) then
  begin
    // 기존에 입력된 값을 저장해 놓는다
    SetLength(BackupData, GridBandedTableView.ColumnCount);
    for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
      BackupData[vIndex] := ADataController.Values[-1, vIndex];
    // Post를 취소한다
    ADataController.Cancel;
    Exit;
  end;

  if ADataController.Values[ADataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index] := rsUpdate;

end;

procedure THeadDepositForm.GridBandedTableViewDcAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := Nvl(DisplayValue,0);
  with GridBandedTableView.DataController do
  begin
    Values[GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index] := Values[GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index] - DisplayValue;
    Values[GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index] := DisplayValue
                                                                    + Values[GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index];

    Values[GetFocusedRecordIndex, GridBandedTableViewBalanceAmt.Index] := Values[GetFocusedRecordIndex, GridBandedTableViewRemainAmt.Index]
                                                                        - Values[GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index];
  end;
end;

procedure THeadDepositForm.GridBandedTableViewDutyfreeAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := Nvl(DisplayValue,0);
  if DisplayValue < 0 then
    DisplayValue := 0
  else if DisplayValue > GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index] then
    DisplayValue := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index];
  GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewNetAmt.Index]   := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index]
                                                                                                                        - DisplayValue;
  GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewSplit.Index] := 'Y';
  if GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index] = rsNormal then
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index] := rsUpdate;

  isChanged := true;
end;

procedure THeadDepositForm.GridBandedTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vIndex: Integer;
begin
  inherited;
  if (AFocusedRecord = nil) then
    ButtonToolBarSaveButton.Enabled := false
  else
    isChanged := isChanged;

  // 신규 상태에서 비 정상적으로 다른 레코드를 선택했다면 다시 신규 상태로 만든다
  if ((APrevFocusedRecord = nil) or (APrevFocusedRecord.Index = GridBandedTableView.DataController.NewItemRecordIndex)) and
     (Assigned(BackupData)) and (High(BackupData) = GridBandedTableView.ColumnCount-1) then
  begin
    // 새 레코드에 기존에 입력된 값을 강제로 다시 넣는다
    GridBandedTableView.DataController.NewItemRowFocused := true;
    for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
      GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, vIndex] := BackupData[vIndex];
  end;
  SetLength(BackupData, 0);
  BackupData := nil;

  // 신규 입력일 때만 거래처를 입력할 수 있게 한다
  GridBandedTableViewStoreCode.Options.Editing   := GridBandedTableView.Controller.IsNewItemRowFocused;
  GridBandedTableViewStoreCode.Options.Focusing  := GridBandedTableView.Controller.IsNewItemRowFocused;

  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  ButtonToolBarDeleteButton.Enabled               := (GridBandedTableView.DataController.RecordCount > 0) and (not GridBandedTableView.Controller.IsNewItemRowFocused);

end;

procedure THeadDepositForm.GridBandedTableViewGetAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := Nvl(DisplayValue,0);
  if DisplayValue = 0 then
  begin
    ErrorText := '금액을 정확히 입력하세요';
    Error     := true;
  end;
  with GridBandedTableView.DataController do
  begin
    Values[GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index] := DisplayValue;
    Values[GetFocusedRecordIndex, GridBandedTableViewDCAmt.Index]      := 0;
    Values[GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index] := DisplayValue +
                                                                      Values[GetFocusedRecordIndex, GridBandedTableViewDCAmt.Index];

    Values[GetFocusedRecordIndex, GridBandedTableViewBalanceAmt.Index] := Values[GetFocusedRecordIndex, GridBandedTableViewRemainAmt.Index]
                                                                        - Values[GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index];
    Values[GetFocusedRecordIndex, GridBandedTableViewSplit.Index] := 'N';
    SetNetTaxDutyfree;
  end;

end;

procedure THeadDepositForm.GridBandedTableViewNetAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := Nvl(DisplayValue,0);
  if DisplayValue < 0 then
    DisplayValue := 0
  else if DisplayValue > GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index] then
    DisplayValue := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index];

  GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewDutyFreeAmt.Index] := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index]
                                                                                                                           - DisplayValue;

  GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewSplit.Index] := 'Y';
  if GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index] = rsNormal then
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index] := rsUpdate;
  isChanged := true;

end;

procedure THeadDepositForm.GridBandedTableViewRealGetAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := Nvl(DisplayValue,0);
  with GridBandedTableView.DataController do
  begin
    Values[GetFocusedRecordIndex, GridBandedTableViewRealGetAmt.Index] := DisplayValue -
                                                                          Values[GetFocusedRecordIndex, GridBandedTableViewDCAmt.Index];
    Values[GetFocusedRecordIndex, GridBandedTableViewBalanceAmt.Index] := Values[GetFocusedRecordIndex, GridBandedTableViewRemainAmt.Index]
                                                                        - DisplayValue;
    if Values[GetFocusedRecordIndex, GridBandedTableViewRowState.Index] = rsInsert then
      SetNetTaxDutyfree;
  end;

end;

procedure THeadDepositForm.GridBandedTableViewStoreCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var vCode :String;
begin
  inherited;

  // 거래처를 조회한다
  if GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index] <> null then
    vCode := SearchStore(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index])
  else
    vCode := SearchStore;
//
//  if vCode <> EmptyStr then
//    Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
end;

function THeadDepositForm.SearchStore(aStore: string): string;
var vWhere :String;
    vIndex :Integer;
    vRemainAmt :Currency;
begin
  Result := EmptyStr;

  for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
    if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsInsert then
      vWhere := vWhere + Format('''%s'',',[String(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewStoreCode.Index])]);

  if vWhere <> '' then
    vWhere := 'and CD_STORE not in ('+LeftStr(vWhere, Length(vWhere)-1)+')';

  with THelpForm.Create(Self) do
    try
      Caption := '매장 조회';
      GridTableViewCode.Caption  := GridBandedTableViewStoreCode.Caption;
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := GridBandedTableViewStoreName.Caption;
      GridTableViewName1.Width   := 310;
      GridTableViewName2.Caption := '대표자';
      GridTableViewName2.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName3.Caption := '사업자번호';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      SQLText    := 'select   CD_STORE, '
                   +'         NM_STORE, '
                   +'         NM_BOSS, '
                   +'         GetBusinessNo(NO_BIZER) '
                   +'from     MS_STORE '
                   +'where    CD_HEAD = :P0 '
                   +'  and    CD_STORE <> ''00000000'' '
                   +'  and   (CD_STORE  = :P2 '
                   +'      or NM_STORE like ConCat(''%'',:P2,''%'')) '
                   +'  and    YN_USE = ''Y'' '
                   +vWhere
                   +'order by CD_STORE';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        GridBandedTableViewStoreCode.EditValue := Code;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewAcctNo.Index]    := '신규';
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index] := Code;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreName.Index] := Names[0];

        //미수잔액
        vRemainAmt := GetRemainAmt(Code);
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewLastGetDate.Index]  := GetLastGetDate(Code);
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewLastSaleDate.Index] := GetLastSaleDate(Code);

        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRemainAmt.Index]   := vRemainAmt;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index]      := 0;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewAcctType.Index]    := '계좌';
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewSplit.Index]       := 'N';
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewRowState.Index]    := rsInsert;
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewGetAmt.Index;
        Result    := Code;
      end;
    finally
      Free;
    end;
end;

procedure THeadDepositForm.SetNetTaxDutyfree;
var vWhere :String;
begin
  if NVL(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index],0) = 0 then Exit;

  if (GetOption(1) <> '0') then
  begin
    if GetOption(1) = '1' then  //최근일주일
      vWhere := ' and YMD_SALE between DATE_FORMAT(ADDDATE(CAST(:P1 AS DATETIME), INTERVAL -1 WEEK), ''%Y%m%d'') and :P1 ';
    if GetOption(1) = '2' then  //최근 1개월
      vWhere := ' and YMD_SALE between DATE_FORMAT(ADDDATE(CAST(:P1 AS DATETIME), INTERVAL -1 MONTH), ''%Y%m%d'') and :P1 ';
    if GetOption(1) = '3' then  //최근 2개월
      vWhere := ' and YMD_SALE between DATE_FORMAT(ADDDATE(CAST(:P1 AS DATETIME), INTERVAL -2 MONTH), ''%Y%m%d'') and :P1 ';
    if GetOption(1) = '4' then  //최근 3개월
      vWhere := ' and YMD_SALE between DATE_FORMAT(ADDDATE(CAST(:P1 AS DATETIME), INTERVAL -3 MONTH), ''%Y%m%d'') and :P1 ';


    if (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewSplit.Index] <> 'Y') then
    begin
      try
        OpenQuery('select Sum(AMT_DUTY + AMT_TAX),'
                 +'				Sum(AMT_DUTYFREE), '
                 +'       DivFlt(Sum(AMT_DUTY + AMT_TAX), Sum(AMT_DUTY + AMT_TAX)+Sum(AMT_DUTYFREE)) '
                 +'	 from OL_SALE_H '
                 +'	where CD_HEAD   =:P0 '
                 +vWhere
                 +'		and CD_STORE = :P2 ',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index]]);
        if Query.Fields[2].AsCurrency > 0 then
        begin
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewNetAmt.Index]      := Round(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index] * Query.Fields[2].AsCurrency);
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewDutyFreeAmt.Index] := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index] - GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewNetAmt.Index];
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewSplit.Index]       := 'Y';
        end
        else
        begin
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewNetAmt.Index]       := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index];
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewDutyFreeAmt.Index]  := 0;
        end;
      finally
        Query.Close;
      end;
    end;
  end
  else
  begin
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewNetAmt.Index]       := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewGetAmt.Index];
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewDutyFreeAmt.Index]  := 0;
  end;
end;

//------------------------------------------------------------------------------
// 조회
function THeadDepositForm.DoSearch: Boolean;
begin
  Result := false;

  try
    OpenQuery('select   a.CD_MEMBER as CD_STORE, '
             +'         b.NM_STORE, '
             +'         case a.DS_ACCT when ''0'' then ''현금'' when ''1'' then ''카드''  when ''2'' then ''계좌'' when ''3'' then ''기타'' end as DS_GET, '
             +'         a.AMT_PAYIN  as AMT_GET_REAL, '
             +'         a.AMT_PAYIN + a.AMT_DC as AMT_GET, '
             +'         a.AMT_DC, '
             +'         a.AMT_NET, '
             +'         a.AMT_DUTYFREE, '
             +'         StoD(a.YMD_GET_LAST) as YMD_GET_LAST, '
             +'         StoD(a.YMD_SALE_LAST) as YMD_SALE_LAST, '
             +'         a.AMT_REMAIN, '
             +'         a.AMT_REMAIN - a.AMT_PAYIN - a.AMT_DC as AMT_BALANCE, '
             +'         a.REMARK, '
             +'         a.NO_ACCT, '
             +'         a.YN_SPLIT, '
             +'         ''rsNormal'' as ROW_STATE '
             +'  from   SL_ACCT  as a inner join '
             +'         MS_STORE as b on a.CD_HEAD = b.CD_HEAD and a.CD_MEMBER = b.CD_STORE  '
             +' where   a.CD_HEAD   =:P0 '
             +'   and   a.CD_STORE  =:P1 '
             +'   and   a.YMD_OCCUR =:P2 '
             +'   and   a.NO_POS    = ''00'' '
             +' order by a.NO_ACCT',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedTableView);
    isSearch := true;
    ButtonEnable;
    ConditionToolBarFromDateEdit.Enabled := not Result;
  except
  end;
end;
procedure THeadDepositForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 삭제
procedure THeadDepositForm.ButtonEnable;
begin
  ConditionToolBarFromDateEdit.Enabled := not isSearch;
  ButtonToolBarSearchButton.Enabled    := not isSearch;
  ButtonToolBarCancelButton.Enabled    := isSearch;
  ButtonToolBarDeleteButton.Enabled    := GridBandedTableView.DataController.GetFocusedRecordIndex >= 0;
end;

procedure THeadDepositForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if isChanged then
    if not AskBox('현재 작업을 모두 취소하시겠습니까?') then Exit;
  GridBandedTableView.DataController.RecordCount := 0;
  isChanged := false;
  isSearch  := false;
  ButtonEnable;
  ConditionToolBarFromDateEdit.Enabled := true;
end;

function THeadDepositForm.DoDelete: Boolean;
var vIndex :Integer;
    vRowIndex :Integer;
begin
  if CheckMonthClose('M',DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    Result := false;
    Exit;
  end;

  // 선택한 레코드를 삭제한다
  try
    //신규로 입력한 레코드는 삭제한다
    if GridBandedTableView.DataController.Values[GridBandedTableView.Controller.FocusedRecordIndex, GridBandedTableViewRowState.Index] = rsInsert then
      GridBandedTableView.DataController.DeleteFocused
    else
    begin
      //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
      vRowIndex := GridBandedTableView.Controller.FocusedRecordIndex;
      GridBandedTableView.DataController.Values[GridBandedTableView.Controller.FocusedRecordIndex, GridBandedTableViewRowState.Index] := rsDelete;
      GridBandedTableView.DataController.AppendRecord;
      for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, vIndex] := GridBandedTableView.DataController.Values[vRowIndex, vIndex];
      GridBandedTableView.DataController.DeleteRecord(vRowIndex);
    end;
    isChanged := true;
    Result := true;
  except
    Result := false;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function THeadDepositForm.DoSave: Boolean;
var
  vIndex, vSeq: Integer;
  vNoAcct,
  vAcctType :String;
begin
  Result := false;

  if CheckMonthClose('M',DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    Result := false;
    Exit;
  end;

  // 입력 중이던 자료 포스트
  GridBandedTableView.DataController.Post;
  // 전체 레코드 돌아가며 필수 입력값 입력하지 않았는지 검사
  for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
    if (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewStoreCode.Index] = null) or
       (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewStoreCode.Index] = EmptyStr) or
       (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewStoreName.Index] = null) or
       (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewStoreName.Index] = EmptyStr) then
    begin
      ErrBox(GridBandedTableViewStoreCode.Caption+msgMustInput);
      GridBandedTableView.DataController.FocusedRecordIndex := vIndex;
      GridBandedTableView.Controller.FocusedColumnIndex     := GridBandedTableViewStoreCode.Index;
      Exit;
    end
    else if (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewGetAmt.Index] = null) or
            (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewGetAmt.Index] = 0) then
    begin
      ErrBox(GridBandedTableViewGetAmt.Caption+msgMustInput);
      GridBandedTableView.DataController.FocusedRecordIndex := vIndex;
      GridBandedTableView.Controller.FocusedColumnIndex     := GridBandedTableViewGetAmt.Index;
      Exit;
    end;


  try
    // 마지막 순번을 구한다 (삭제 후 순번을 구하는 것이 좋으나 SQL의 버그 때문에 순번부터 구한다)
    OpenQuery('select Max(NO_ACCT) as NO_ACCT '
             +'  from SL_ACCT '
             +' where CD_HEAD   = :P0 '
             +'   and CD_STORE  = :P1 '
             +'   and YMD_OCCUR = :P2 '
             +'   and NO_POS    =''00'' ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date)]);
    try
      if (Query.Eof) or (Query.Fields[0].AsString = EmptyStr) then
        vSeq := 0
      else
        vSeq := StoI(Query.Fields[0].AsString);
    finally
      FinishQuery;
    end;

    for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
    begin
      if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsNormal then Continue;

      if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete from SL_ACCT '
                 +' where CD_HEAD   =:P0 '
                 +'   and CD_STORE  =:P1 '
                 +'   and YMD_OCCUR =:P2 '
                 +'   and NO_POS    =''00'' '
                 +'   and NO_ACCT   =:P3;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewAcctNo.Index]],
                  False);
      end
      else
      begin
        if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsInsert then
        begin
          vNoAcct := FormatFloat('000', vSeq+1);
          Inc(vSeq);
        end
        else
          vNoAcct := GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewAcctNo.Index];

        if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewAcctType.Index]  = '현금'then
          vAcctType := '0'
        else if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewAcctType.Index]  = '카드' then
          vAcctType := '1'
        else if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewAcctType.Index]  = '계좌'then
          vAcctType := '2'
        else if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewAcctType.Index]  = '기타'then
          vAcctType := '3';

        ExecQuery(Ifthen(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsInsert,
                  'insert into SL_ACCT(CD_HEAD, '
                 +'                    CD_STORE, '
                 +'                    YMD_OCCUR, '
                 +'                    NO_POS, '
                 +'                    NO_ACCT, '
                 +'                    DS_ACCT, '
                 +'                    CD_ACCT, '
                 +'                    AMT_PAYIN, '
                 +'                    AMT_DC, '
                 +'                    AMT_NET, '
                 +'                    AMT_DUTYFREE, '
                 +'                    AMT_REMAIN, '
                 +'                    YMD_GET_LAST, '
                 +'                    YMD_SALE_LAST, '
                 +'                    YN_SPLIT, '
                 +'                    CD_MEMBER, '
                 +'                    REMARK, '
                 +'                    CD_SAWON_CHG, '
                 +'                    DT_CHANGE, '
                 +'                    DT_INSERT) '
                 +'            values (:P0, '
                 +'                    :P1, '
                 +'                    :P2, '
                 +'                    ''00'', '
                 +'                    :P3, '
                 +'                    :P4, '
                 +'                    :P5, '
                 +'                    :P6, '
                 +'                    :P7, '
                 +'                    :P8, '
                 +'                    :P9, '
                 +'                    :P10, '
                 +'                    :P11, '
                 +'                    :P12, '
                 +'                    :P13, '
                 +'                    :P14, '
                 +'                    :P15, '
                 +'                    :P16, '
                 +'                    Now(), '
                 +'                    Now()); ',
                 'update SL_ACCT '
                 +'  set DS_ACCT      = :P4, '
                 +'      AMT_PAYIN    = :P6, '
                 +'      AMT_DC       = :P7, '
                 +'      AMT_NET      = :P8, '
                 +'      AMT_DUTYFREE = :P9, '
                 +'      REMARK       = :P15, '
                 +'      CD_SAWON_CHG =:P16, '
                 +'      DT_CHANGE    = Now() '
                 +'where CD_HEAD   =:P0 '
                 +'  and CD_STORE  =:P1 '
                 +'  and YMD_OCCUR =:P2 '
                 +'  and NO_POS    =''00'' '
                 +'  and NO_ACCT   =:P3;'),
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vNoAcct,
                 vAcctType,
                 varGetCode,
                 GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewGetAmt.Index],
                 GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewDcAmt.Index],
                 GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewNetAmt.Index],
                 GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewDutyFreeAmt.Index],
                 GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRemainAmt.Index],
                 GetOnlyNumber(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewLastGetDate.Index]),
                 GetOnlyNumber(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewLastSaleDate.Index]),
                 GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSplit.Index],
                 GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewStoreCode.Index],
                 Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRemark.Index], ''),
                 UserCode],
                 false);
      end;
    end;

    Result := ExecQuery(TempSQL, [], true);
    if Result then
    begin
      isSearch  := false;
      GridBandedTableView.DataController.RecordCount := 0;
      GridBandedTableView.DataController.EndUpdateFields;
      ButtonEnable;
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
