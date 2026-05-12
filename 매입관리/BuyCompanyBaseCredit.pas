// 기초 외상 매입금 등록 (F)

unit BuyCompanyBaseCredit;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset;

type
  TBuyCompanyBaseCreditForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridLevel: TcxGridLevel;
    ButtonToolBarCancelButton: TAdvGlowButton;
    GridTableViewRowState: TcxGridColumn;
    GridTableViewAcctDate: TcxGridColumn;
    GridTableViewAcctNo: TcxGridColumn;

    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridTableViewCompanyCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewDataControllerDataChanged(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);

  private
    isSearch :Boolean;

    function  SearchCompany(aCompany: string = ''): string;
    procedure EnableButtons;

  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave: Boolean; override;   // 저장
  end;

var
  BuyCompanyBaseCreditForm: TBuyCompanyBaseCreditForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TBuyCompanyBaseCreditForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
  isSearch := false;
  EnableButtons;
  isChanged := false;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TBuyCompanyBaseCreditForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/매입관리/기초%20외상%20매입금%20등록/기초%20외상%20매입금%20등록.htm';
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;

procedure TBuyCompanyBaseCreditForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vCode, vName: string;
begin
  inherited;

  // 그리드 OnKeyDown 이벤트는 Enter키 입력이 되지 않아서 폼에서 처리한다
  if (Key = VK_Return) and (GridTableView.Focused) then
  begin
    GridTableView.DataController.PostEditingData;
    // 거래처코드
    if GridTableView.Controller.FocusedColumnIndex = GridTableViewCompanyCode.Index then
    begin
      if Nvl(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index], EmptyStr) = EmptyStr then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index] := EmptyStr
      else
      begin
        OpenQuery('select   CD_TRDPL, '
                 +'         NM_TRDPL '
                 +'from     MS_TRD '
                 +'where    CD_HEAD  =:P0 '
                 +'  and    CD_STORE =:P1 '
                 +'  and   (CD_TRDPL =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                 +'  and    DS_TRDPL  = ''B'' '
                 +'  and    DS_STATUS = 0',
                  [HeadStoreCode,
                   StoreCode,
                   GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index]]);
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
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index] := vCode;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index] := vName;
              GridTableView.Controller.FocusedColumnIndex := GridTableViewBuyAmt.Index;
            end
            // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
            else
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index] := SearchCompany(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index]);
          end
          else
          begin
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index] := EmptyStr;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index] := EmptyStr;
          end;
        finally
          FinishQuery;
        end;
      end;
    end

    // 외상 매입금
    else if GridTableView.Controller.FocusedColumnIndex = GridTableViewBuyAmt.Index then
    begin
      // 거래처 입력을 안 했으면 그곳으로 포커스를 옮긴다
      if (Nvl(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index], EmptyStr) = EmptyStr) or
         (Nvl(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index], EmptyStr) = EmptyStr) then
        GridTableView.Controller.FocusedColumnIndex := GridTableViewCompanyCode.Index
      else
      begin
        GridTableView.DataController.Post;
        GridTableView.Controller.FocusedColumnIndex := GridTableViewCompanyCode.Index;
      end;
    end;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 취소 버튼
procedure TBuyCompanyBaseCreditForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;

  if isChanged then
    if not AskBox('현재 작업을 모두 취소하시겠습니까?') then Exit;
  GridTableView.DataController.RecordCount := 0;
  isSearch := false;
  EnableButtons;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 거래처 입력창에서 버튼을 누를 때
procedure TBuyCompanyBaseCreditForm.GridTableViewCompanyCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index] <> null then
    SearchCompany(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index])
  else
    SearchCompany;
end;
//------------------------------------------------------------------------------
// 그리드 값을 변경할 때
procedure TBuyCompanyBaseCreditForm.GridTableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;

  isChanged := true;
  // 조회를 안하고 신규를 바로 입력했을때
  if ConditionToolBarFromDateEdit.Enabled then
  begin
    ConditionToolBarFromDateEdit.Enabled := false;
    ButtonToolBarSearchButton.Enabled    := false;
    ButtonToolBarCancelButton.Enabled    := true;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 입력값을 포스트 할 때
procedure TBuyCompanyBaseCreditForm.GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
begin
  inherited;

  if (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewCompanyCode.Index], EmptyStr) = EmptyStr) or
     (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewCompanyName.Index], EmptyStr) = EmptyStr) or
     (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewBuyAmt.Index], 0.0) = 0.0) then
  begin
    ADataController.Cancel;
    Exit;
  end;

  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
end;
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TBuyCompanyBaseCreditForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  if AFocusedRecord = nil then
    ButtonToolBarDeleteButton.Enabled := false
  else
    ButtonToolBarDeleteButton.Enabled := AFocusedRecord.Index >= 0;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 거래처 조회
function TBuyCompanyBaseCreditForm.SearchCompany(aCompany: string): string;
begin
  Result := EmptyStr;

  with THelpForm.Create(Self) do
    try
      Caption := '거래처 조회';
      GridTableViewCode.Caption  := GridTableViewCompanyCode.Caption;
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := GridTableViewCompanyName.Caption;
      GridTableViewName1.Width   := 310;

      SearchText := aCompany;
      SQLText    := 'select   CD_TRDPL as CODE, '
                   +'         NM_TRDPL as CODE1 '
                   +'from     MS_TRD '
                   +'where    CD_HEAD  =:P0 '
                   +'  and    CD_STORE =:P1 '
                   +'  and   (CD_TRDPL = :P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                   +'  and    DS_TRDPL  = ''B'' '
                   +'  and    DS_STATUS = 0 '
                   +'order by CD_TRDPL';

      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewRowState.Index]    := rsInsert;
        Self.GridTableView.Controller.FocusedColumnIndex := GridTableViewBuyAmt.Index;
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 버튼 활성화
procedure TBuyCompanyBaseCreditForm.EnableButtons;
begin
  ConditionToolBarFromDateEdit.Enabled := not isSearch;
  ButtonToolBarSearchButton.Enabled    := not isSearch;
  ButtonToolBarCancelButton.Enabled    := isSearch;
end;
//------------------------------------------------------------------------------
// 조회
function TBuyCompanyBaseCreditForm.DoSearch: Boolean;
begin
  Result := false;

  try
    OpenQuery('select   a.CD_TRDPL, '
             +'         b.NM_TRDPL as NM_TRDPL, '
             +'         a.YMD_OCCUR, '
             +'         a.NO_ACCT, '
             +'         a.AMT_OUT*-1 as AMT_OUT, '
             +'         ''rsNormal'' as ROW_STATE '
             +'from     SL_ACCT  as a inner join '
             +'         MS_TRD   as b on a.CD_HEAD  = b.CD_HEAD '
             +'                      and a.CD_STORE = b.CD_STORE '
             +'                      and a.CD_TRDPL = b.CD_TRDPL '
             +'where    a.CD_HEAD  =:P0 '
             +'  and    a.CD_STORE =:P1 '
             +'  and    a.DS_ACCT  =''0''  '
             +'  and    a.REMARK   =''기초미지급'' '
             +'order by a.CD_TRDPL',
              [HeadStoreCode,
               StoreCode]);
    Result := DM.ReadQuery(Query, GridTableView);
    isSearch := true;
    EnableButtons;
  except
  end;
end;
//------------------------------------------------------------------------------
// 삭제
function TBuyCompanyBaseCreditForm.DoDelete: Boolean;
var vRowIndex :Integer;
    vIndex    :Integer;
begin
  // 선택한 레코드를 삭제한다
  if GridTableView.DataController.Values[GridTableView.Controller.FocusedRecordIndex, GridTableViewRowState.Index] = rsInsert then
    GridTableView.DataController.DeleteFocused
  else
  begin
    //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
    vRowIndex := GridTableView.Controller.FocusedRecordIndex;
    GridTableView.DataController.Values[GridTableView.Controller.FocusedRecordIndex, GridTableViewRowState.Index] := rsDelete;
    GridTableView.DataController.AppendRecord;
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := GridTableView.DataController.Values[vRowIndex, vIndex];
    GridTableView.DataController.DeleteRecord(vRowIndex);
  end;

  isChanged := true;
  result    := true;
end;
//------------------------------------------------------------------------------
// 저장
function TBuyCompanyBaseCreditForm.DoSave: Boolean;
var
  vIndex  : Integer;
  vAcctNo :Integer;
  vBaseDate :String;
begin
  Result := false;

  // 월 마감 테이블에 마감이 한 건이라도 있으면 이 프로그램을 못 돌린다
  if OpenQuery('select CD_GOODS '
              +'  from SL_STOCK_MONTH '
              +' where CD_HEAD  = :P0 '
              +'   and CD_STORE = :P1 '
              +'   and YN_CLOSE = ''Y'''
              +' limit 1 ',
               [HeadStoreCode,
                StoreCode],
                true) then
  begin
    ErrBox('월 마감이 된 자료가 있습니다.'#13'['+Caption+'] 프로그램은 월 마감 이전에만 실행할 수 있습니다.');
    FinishQuery;
    Close;
    Exit;
  end;

  // 월 마감 테이블에 자료가 없다면 이 프로그램을 못 돌린다
  OpenQuery('select Min(YM_STOCK) as YM_STOCK '
           +'  from SL_STOCK_MONTH '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1',
            [HeadStoreCode,
             StoreCode]);
  try
    if Query.Eof or (Query.Fields[0].AsString = EmptyStr) then
    begin
      vBaseDate := FormatDateTime('yyymm',now)+'01';
    end
    else
      vBaseDate := Query.Fields[0].AsString+'01';
  finally
    FinishQuery;
  end;

  // 입력 중이던 자료 포스트
  GridTableView.DataController.Post;
  // 전체 레코드 돌아가며 필수 입력값 입력하지 않았는지 검사
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewCompanyCode.Index], EmptyStr) = EmptyStr) or
       (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewCompanyName.Index], EmptyStr) = EmptyStr) then
    begin
      ErrBox(GridTableViewCompanyCode.Caption+msgMustInput);
      GridTableView.DataController.FocusedRecordIndex := vIndex;
      GridTableView.Controller.FocusedColumnIndex     := GridTableViewCompanyCode.Index;
      Exit;
    end
    else if Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index], 0.0) = 0.0 then
    begin
      ErrBox(GridTableViewBuyAmt.Caption+msgMustInput);
      GridTableView.DataController.FocusedRecordIndex := vIndex;
      GridTableView.Controller.FocusedColumnIndex     := GridTableViewBuyAmt.Index;
      Exit;
    end;

  try
    OpenQuery('select Ifnull(Max(NO_ACCT),0) as NO_ACCT '
             +'  from SL_ACCT '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and YMD_OCCUR =:P2',
             [HeadStoreCode,
              StoreCode,
              vBaseDate]);
    vAcctNo := Query.Fields[0].AsInteger;
  finally
    FinishQuery;
  end;


  try
    // 매입 마스터 테이블에 값을 저장한다
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete from SL_ACCT '
                 +' where  CD_HEAD    = :P0 '
                 +'   and  CD_STORE   = :P1 '
                 +'   and  YMD_OCCUR  = :P2 '
                 +'   and  NO_POS     = ''00'' '
                 +'   and  NO_ACCT    = :P3;',
                  [HeadStoreCode,
                   StoreCode,
                   GridTableView.DataController.Values[vIndex, GridTableViewAcctDate.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewAcctNo.Index]],
                   false);
        Continue;
      end;

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then
      begin
        Inc(vAcctNo);
        ExecQuery('insert into SL_ACCT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, NO_ACCT, DS_ACCT, CD_ACCT, CD_TRDPL, AMT_OUT, CD_SAWON_CHG, DT_CHANGE, DT_INSERT, REMARK) '
                 +'            values (:P0, :P1, :P2, ''00'', :P3, ''0'', :P4, :P5, :P6, :P7, Now(), Now(), ''기초미지급'');',
                  [HeadStoreCode,
                   StoreCode,
                   vBaseDate,
                   FormatFloat('000', vAcctNo),
                   CreditOut,
                   GridTableView.DataController.Values[vIndex, GridTableViewCompanyCode.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]*-1,
                   UserCode],
                   false);
      end
      else
        ExecQuery('update SL_ACCT '
                 +'   set CD_TRDPL     =:P4, '
                 +'       AMT_OUT      =:P5, '
                 +'       CD_SAWON_CHG =:P6, '
                 +'       DT_CHANGE    =Now() '
                 +' where CD_HEAD   = :P0 '
                 +'   and CD_STORE  = :P1 '
                 +'   and YMD_OCCUR = :P2 '
                 +'   and NO_POS    = ''00'' '
                 +'   and NO_ACCT   = :P3;',
                  [HeadStoreCode,
                   StoreCode,
                   GridTableView.DataController.Values[vIndex, GridTableViewAcctDate.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewAcctNo.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewCompanyCode.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]*-1,
                   UserCode],
                   false);
    end;
    ExecQuery(TempSQL, [], true);

    Result   := true;
    isSearch := false;
    EnableButtons;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
