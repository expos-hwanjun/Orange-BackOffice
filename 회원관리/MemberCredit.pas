// 외상 매출금 입금 관리 (New완료)

unit MemberCredit;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, DBAccess, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, ExtCtrls, AdvToolBarStylers, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TMemberCreditForm = class(TInheritEditForm)
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewMemberNo: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewGetAmt: TcxGridColumn;
    GridTableViewDCAmt: TcxGridColumn;
    GridTableViewBank: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    ButtonToolBarCancelButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewMemberNoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewBankPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewDataControllerDataChanged(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);

  private
    BackupData: array of Variant;
    isSearch  : Boolean;
    function  SearchMember(aMember: string = ''): string;
    function  SearchBank(aBank: string = ''): string;
    procedure ButtonEnable;

  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave: Boolean; override;   // 저장
  end;

var
  MemberCreditForm: TMemberCreditForm;



implementation

uses
  Common, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberCreditForm.FormCreate(Sender: TObject);
begin
  inherited;

  DefaultDate := ddToday;
  isSearch    := false;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TMemberCreditForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;

  isChanged := false;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TMemberCreditForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vCode, vName: string;
begin
  case Key of
    VK_Down,
    VK_Up   :
      if GridTableView.Controller.IsNewItemRowFocused then
      begin
        Key := 0;
        Exit;
      end;
  end;

  inherited;

  // 그리드 OnKeyDown 이벤트는 Enter키 입력이 되지 않아서 폼에서 처리한다
  if (Key = VK_Return) and (GridTableView.Focused) then
  begin
    GridTableView.DataController.PostEditingData;
    // 회원번호
    if GridTableView.Controller.FocusedColumnIndex = GridTableViewMemberNo.Index then
    begin
      if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index] = null) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index] = EmptyStr) then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index] := EmptyStr
      else
      begin
        OpenQuery('select   CD_MEMBER, '
                 +'         NM_MEMBER '
                 +'from     MS_MEMBER '
                 +'where    CD_STORE  = :P0 '
                 +'  and   (CD_MEMBER like ''%''+:P1+''%'' or NM_MEMBER like ''%''+:P1+''%'' or NO_JUMIN like ''%''+:P1+''%'' or NO_CARD like ''%''+:P1+''%'' or TEL_MOBIL like ''%''+:P1+''%'' or TEL_HOME like ''%''+:P1+''%'' or TEL_JOB like ''%''+:P1+''%'') '
                 +'  and    DS_STATUS = ''0''',
                  [Ifthen(GetOption(257)='0', StoreCode,'0000'),
                   GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]]);
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
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]   := vCode;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index] := vName;
              GridTableView.Controller.FocusedColumnIndex := GridTableViewGetAmt.Index;
            end
            // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
            else
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index] := SearchMember(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]);
          end
          else
          begin
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]   := EmptyStr;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index] := EmptyStr;
          end;
        finally
          FinishQuery;
        end;
      end;
    end

    // 은행
    else if GridTableView.Controller.FocusedColumnIndex = GridTableViewBank.Index then
    begin
      if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index] = null) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index] = EmptyStr) then
        GridTableView.Controller.FocusedColumnIndex := GridTableViewRemark.Index
      else
      begin
        OpenQuery('select   CD_CODE + '' - '' + NM_CODE1 as CODE '
                 +'from     MS_CODE '
                 +'where    CD_STORE  = :P0 '
                 +'  and    CD_KIND   = ''26'' '
                 +'  and   (CD_CODE like ''%''+:P1+''%'' or NM_CODE1 like ''%''+:P1+''%'') '
                 +'  and    DS_STATUS = ''0''',
                  [Ifthen(GetOption(257)='0', StoreCode,'0000'),
                   GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index]]);
        try
          if not Query.Eof then
          begin
            // 일단 첫번째 값을 받아 놓는다
            vCode := Query.Fields[0].AsString;
            // 쿼리 다음 줄로 이동해 본다
            Query.Next;
            // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
            if Query.Eof then
            begin
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index] := vCode;
              GridTableView.Controller.FocusedColumnIndex := GridTableViewRemark.Index;
            end
            // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
            else
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index] := SearchBank(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index]);
          end
          else
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index] := EmptyStr;
        finally
          FinishQuery;
        end;
      end;
    end

    // 비고
    else if GridTableView.Controller.FocusedColumnIndex = GridTableViewRemark.Index then
    begin
      // 입력 안 한 값이 있으면 그곳으로 포커스를 옮긴다
      if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]   = null) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]   = EmptyStr) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index] = null) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index] = EmptyStr) then
        GridTableView.Controller.FocusedColumnIndex := GridTableViewMemberNo.Index
      else if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGetAmt.Index] = null) or
              (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGetAmt.Index] = 0) then
        GridTableView.Controller.FocusedColumnIndex := GridTableViewGetAmt.Index
      else
      begin
        GridTableView.DataController.Post;
        GridTableView.Controller.FocusedColumnIndex := GridTableViewMemberNo.Index;
      end;
    end

    // 기타
    else
      GridTableView.Controller.FocusedColumnIndex := GridTableView.Controller.FocusedColumnIndex + 1;
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드 값을 적용하기 전
procedure TMemberCreditForm.GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;

  // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
  if (ADataController.NewItemRowFocused) and
     ((Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewMemberNo.Index], EmptyStr) = EmptyStr) or
      (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewGetAmt.Index],   0.0)      = 0.0)) then
  begin
    // 기존에 입력된 값을 저장해 놓는다
    SetLength(BackupData, GridTableView.ColumnCount);
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      BackupData[vIndex] := ADataController.Values[-1, vIndex];
    // Post를 취소한다
    ADataController.Cancel;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 값을 적용한 후
procedure TMemberCreditForm.GridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
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
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TMemberCreditForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vIndex: Integer;
begin
  inherited;

  // 신규 상태에서 비 정상적으로 다른 레코드를 선택했다면 다시 신규 상태로 만든다
  if ((APrevFocusedRecord = nil) or (APrevFocusedRecord.Index = GridTableView.DataController.NewItemRecordIndex)) and
     (Assigned(BackupData)) and (High(BackupData) = GridTableView.ColumnCount-1) then
  begin
    // 새 레코드에 기존에 입력된 값을 강제로 다시 넣는다
    GridTableView.DataController.NewItemRowFocused := true;
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] := BackupData[vIndex];
  end;
  SetLength(BackupData, 0);
  BackupData := nil;

  // 신규 입력일 때만 회원을 입력할 수 있게 한다
  GridTableViewMemberNo.Options.Editing  := GridTableView.Controller.IsNewItemRowFocused;
  GridTableViewMemberNo.Options.Focusing := GridTableView.Controller.IsNewItemRowFocused;
  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  ButtonToolBarDeleteButton.Enabled      := not GridTableView.Controller.IsNewItemRowFocused;
end;
//------------------------------------------------------------------------------
// 회원번호 입력창에서 버튼을 누를 때
procedure TMemberCreditForm.GridTableViewMemberNoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index] <> null then
    SearchMember(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index])
  else
    SearchMember;
end;
//------------------------------------------------------------------------------
// 은행 입력창에서 버튼을 누를 때
procedure TMemberCreditForm.GridTableViewBankPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index] <> null then
    SearchBank(IfThen(Pos(' - ', GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index]) > 0, Copy(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index],1,3), GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index]))
  else
    SearchBank;
end;
//------------------------------------------------------------------------------
// 그리드 값을 변경할 때
procedure TMemberCreditForm.GridTableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;

  isChanged := true;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 회원 조회
function TMemberCreditForm.SearchMember(aMember: string): string;
var vStoreCode :String;
begin
  Result     := EmptyStr;
  vStoreCode := StoreCode;
  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := GridTableViewMemberNo.Caption;
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := GridTableViewMemberName.Caption;
      GridTableViewName1.Width   := 310;

      SearchText := aMember;
      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER '
                   +'from     MS_MEMBER '
                   +'where    CD_STORE = :P0 '
                   +'  and   (CD_MEMBER like ''%''+:P1+''%'' or NM_MEMBER like ''%''+:P1+''%'' or NO_CARD like ''%''+:P1+''%'' or NO_JUMIN like ''%''+:P1+''%'' or TEL_HOME like ''%''+:P1+''%'' or TEL_MOBIL like ''%''+:P1+''%'' or TEL_JOB like ''%''+:P1+''%'') '
                   +'  and    DS_STATUS = ''0'' '
                   +'order by CD_STORE, CD_MEMBER';
      StoreCode := Ifthen(GetOption(257)='0', StoreCode,'0000');
      if ShowModal = mrOK then
      begin
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewMemberNo.Index]   := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewMemberName.Index] := Names[0];
        Self.GridTableView.Controller.FocusedColumnIndex := GridTableViewGetAmt.Index;
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
      StoreCode := vStoreCode;
    end;
end;
//------------------------------------------------------------------------------
// 은행 조회
function TMemberCreditForm.SearchBank(aBank: string): string;
begin
  with THelpForm.Create(Self) do
    try
      Caption := '은행 조회';
      GridTableViewCode.Caption  := '은행코드';
      GridTableViewName1.Caption := '은행이름';

      KindCode   := '26';
      SearchText := aBank;

      if ShowModal = mrOK then
      begin
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBank.Index] := Code+' - '+Names[0];
        Self.GridTableView.Controller.FocusedColumnIndex := GridTableViewRemark.Index;
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 조회
function TMemberCreditForm.DoSearch: Boolean;
begin
  Result := false;
  try
    OpenQuery('select   a.CD_MEMBER, '
             +'         b.NM_MEMBER, '
             +'         a.AMT_PAYIN, '
             +'         a.AMT_DC, '
             +'         dbo.GetCommonCode(a.CD_STORE, ''26'', a.CD_BANK) as BANK, '
             +'         a.REMARK '
             +'from     SL_ACCT   as a inner join '
             + Ifthen(GetOption(257)='0', ' MS_MEMBER as b on a.CD_STORE = b.CD_STORE and a.CD_MEMBER = b.CD_MEMBER ', ' MS_MEMBER as b on b.CD_STORE = ''0000'' and a.CD_MEMBER = b.CD_MEMBER ')
             +'where    a.CD_STORE  = :P0 '
             +'  and    a.YMD_OCCUR = :P1 '
             +'  and    a.CD_ACCT   = :P2 '
             +'order by a.NO_ACCT',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               CreditIn]);
    Result   := ReadQuery(GridTableView);
    isSearch := true;
    ButtonEnable;
  except
  end;
end;
//------------------------------------------------------------------------------
// 삭제
procedure TMemberCreditForm.ButtonEnable;
begin
  ConditionToolBarFromDateEdit.Enabled := not isSearch;
  ButtonToolBarSearchButton.Enabled    := not isSearch;
  ButtonToolBarCancelButton.Enabled    := isSearch;
end;

procedure TMemberCreditForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if isChanged then
    if not AskBox('현재 작업을 모두 취소하시겠습니까?') then Exit;
  GridTableView.DataController.RecordCount := 0;
  isChanged := false;
  isSearch  := false;
  ButtonEnable;
end;

function TMemberCreditForm.DoDelete: Boolean;
begin
  // 선택한 레코드를 삭제한다
  try
    GridTableView.DataController.DeleteFocused;
    isChanged := true;
    Result    := true;
  except
    Result    := false;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TMemberCreditForm.DoSave: Boolean;
var
  vIndex, vSeq: Integer;
begin
  Result := false;

  // 입력 중이던 자료 포스트
  GridTableView.DataController.Post;
  // 전체 레코드 돌아가며 필수 입력값 입력하지 않았는지 검사
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if (GridTableView.DataController.Values[vIndex, GridTableViewMemberNo.Index]   = null) or
       (GridTableView.DataController.Values[vIndex, GridTableViewMemberNo.Index]   = EmptyStr) or
       (GridTableView.DataController.Values[vIndex, GridTableViewMemberName.Index] = null) or
       (GridTableView.DataController.Values[vIndex, GridTableViewMemberName.Index] = EmptyStr) then
    begin
      ErrBox(GridTableViewMemberNo.Caption+msgMustInput);
      GridTableView.DataController.FocusedRecordIndex := vIndex;
      GridTableView.Controller.FocusedColumnIndex     := GridTableViewMemberNo.Index;
      Exit;
    end
    else if (GridTableView.DataController.Values[vIndex, GridTableViewGetAmt.Index] = null) or
            (GridTableView.DataController.Values[vIndex, GridTableViewGetAmt.Index] = 0) then
    begin
      ErrBox(GridTableViewGetAmt.Caption+msgMustInput);
      GridTableView.DataController.FocusedRecordIndex := vIndex;
      GridTableView.Controller.FocusedColumnIndex     := GridTableViewGetAmt.Index;
      Exit;
    end;


  BeginTrans;
  try
    // 마지막 순번을 구한다 (삭제 후 순번을 구하는 것이 좋으나 SQL의 버그 때문에 순번부터 구한다)
    OpenQuery('select   Max(NO_ACCT) as NO_ACCT '
             +'from     SL_ACCT '
             +'where    CD_STORE  = :P0 '
             +'  and    YMD_OCCUR = :P1',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date)]);
    try
      if (Query.Eof) or (Query.Fields[0].AsString = EmptyStr) then
        vSeq := 1
      else
        vSeq := StoI(Query.Fields[0].AsString)+1;
    finally
      FinishQuery(false);
    end;

    // 기존 자료 삭제
    if isSearch then
      ExecQuery('delete from SL_ACCT '
               +'where  CD_STORE  = :P0 '
               +'  and  YMD_OCCUR = :P1 '
               +'  and  CD_ACCT   = :P2',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 CreditIn],
                 false);

    // 새 자료 저장
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      ExecQuery('insert into SL_ACCT '
               +'( '
               +'  CD_STORE, YMD_OCCUR, NO_ACCT, DS_ACCT, CD_ACCT, AMT_PAYIN, AMT_DC, CD_BANK, CD_MEMBER, REMARK, DT_CHANGE, CD_SAWON_CHG, DS_TRANS '
               +') values ( '
               +'  :P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, GetDate(), :P10, 0 '
               +')',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 FormatFloat('000', vIndex + vSeq),
                 IfThen(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBank.Index], '') = '', '0', '2'),
                 CreditIn,
                 GridTableView.DataController.Values[vIndex, GridTableViewGetAmt.Index],
                 Nvl(GridTableView.DataController.Values[vIndex, GridTableViewDCAmt.Index], 0.0),
                 Copy(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBank.Index], ''), 1, 3),
                 GridTableView.DataController.Values[vIndex, GridTableViewMemberNo.Index],
                 Nvl(GridTableView.DataController.Values[vIndex, GridTableViewRemark.Index], ''),
                 UserCode],
                 false);

    //##### 순번이 중간에 비는 문제가 있으나 큰 문제는 되지 않을 것 같아 넘어감

    CommitTrans;
    Result    := true;
    isSearch  := false;
    GridTableView.DataController.RecordCount := 0;
    ButtonEnable;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;

end.
