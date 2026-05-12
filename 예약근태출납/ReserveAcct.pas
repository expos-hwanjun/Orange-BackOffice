// 출납 (New완료)

unit ReserveAcct;



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
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TReserveAcctForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewAcctCode: TcxGridColumn;
    GridTableViewAcctName: TcxGridColumn;
    GridTableViewType: TcxGridColumn;
    GridTableViewAcctAmt: TcxGridColumn;
    GridTableViewBank: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    GridLevel: TcxGridLevel;
    ButtonToolBarCancelButton: TAdvGlowButton;
    GridTableViewNoAcct: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewAcctType: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewAcctCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewBankPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewDataControllerDataChanged(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewAcctTypePropertiesChange(Sender: TObject);
    procedure GridTableViewAcctTypePropertiesCloseUp(Sender: TObject);
    procedure GridTableViewAcctTypePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
    BackupData: array of Variant;
    isSearch  : Boolean;
    function  SearchAcct(aAcct: string = ''): string;
    function  SearchBank(aBank: string = ''): string;
    procedure ButtonEnable;
  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave: Boolean; override;   // 저장
  end;

var
  ReserveAcctForm: TReserveAcctForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TReserveAcctForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
  isSearch    := false;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TReserveAcctForm.FormShow(Sender: TObject);
begin
  inherited;
  isChanged := false;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TReserveAcctForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vCode, vName, vType: string;
begin
  inherited;

  // 그리드 OnKeyDown 이벤트는 Enter키 입력이 되지 않아서 폼에서 처리한다
  if (Key = VK_Return) and (GridTableView.Focused) then
  begin
    GridTableView.DataController.PostEditingData;
    // 출납코드
    if GridTableView.Controller.FocusedColumnIndex = GridTableViewAcctCode.Index then
    begin
      if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] = null) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] = EmptyStr) then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctName.Index] := EmptyStr
      else
      begin
        OpenQuery('select   CD_CODE, '
                 +'         NM_CODE1, '
                 +'         case NM_CODE2 when ''0'' then ''수입'' else ''지출'' end as NM_CODE2 '
                 +'  from   MS_CODE '
                 +' where   CD_HEAD   =:P0 '
                 +'   and   CD_STORE  =:P1 '
                 +'   and   CD_KIND   = ''11'' '
                 +'   and  (CD_CODE like =:P2 or NM_CODE1 like ConCat(''%'',:P2,''%'')) '
                 +'   and   NM_CODE3  in (''0'', ''4'') '
                 +'   and   DS_STATUS = ''0''',
                  [HeadStoreCode,
                   StoreCode,
                   GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index]]);
        try
          if not Query.Eof then
          begin
            // 일단 첫번째 값을 받아 놓는다
            vCode := Query.Fields[0].AsString;
            vName := Query.Fields[1].AsString;
            vType := Query.Fields[2].AsString;
            // 쿼리 다음 줄로 이동해 본다
            Query.Next;
            // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
            if Query.Eof then
            begin
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] := vCode;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctName.Index] := vName;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewType.Index]     := vType;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsInsert;
              GridTableView.Controller.FocusedColumnIndex := GridTableViewAcctAmt.Index;
            end
            // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
            else
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] := SearchAcct(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index]);
          end
          else
          begin
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] := EmptyStr;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctName.Index] := EmptyStr;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewType.Index]     := EmptyStr;
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
        OpenQuery('select   ConCat(CD_CODE,''-'',NM_CODE1) as CODE '
                 +'  from   MS_CODE '
                 +' where   CD_HEAD   =:P0 '
                 +'   and   CD_STORE  =:P1 '
                 +'   and   CD_KIND   = ''27'' '
                 +'   and  (CD_CODE =:P2 or NM_CODE1 like ConCat(''%'',:P2,''%'')) '
                 +'   and   DS_STATUS = ''0''',
                  [HeadStoreCode,
                   StoreCode,
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
      if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] = null) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] = EmptyStr) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctName.Index] = null) or
         (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctName.Index] = EmptyStr) then
        GridTableView.Controller.FocusedColumnIndex := GridTableViewAcctCode.Index
      else if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctAmt.Index] = null) or
              (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctAmt.Index] = 0) then
        GridTableView.Controller.FocusedColumnIndex := GridTableViewAcctAmt.Index
      else
      begin
        GridTableView.DataController.Post;
        GridTableView.Controller.FocusedColumnIndex := GridTableViewAcctCode.Index;
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
// 출납코드 입력창에서 버튼을 누를 때
procedure TReserveAcctForm.GridTableViewAcctCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewAcctCode.Index] <> null then
    SearchAcct(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewAcctCode.Index])
  else
    SearchAcct;
end;
procedure TReserveAcctForm.GridTableViewAcctTypePropertiesChange(
  Sender: TObject);
begin
  inherited;
  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewAcctType.Index] = '계좌' then
    GridTableViewBank.Options.Focusing:= false
  else
    GridTableViewBank.Options.Focusing := true;
end;

procedure TReserveAcctForm.GridTableViewAcctTypePropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewAcctType.Index] = '계좌' then
    GridTableViewBank.Options.Focusing := false
  else
    GridTableViewBank.Options.Focusing := true;
end;

procedure TReserveAcctForm.GridTableViewAcctTypePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 은행 입력창에서 버튼을 누를 때
procedure TReserveAcctForm.GridTableViewBankPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewBank.Index] <> null then
    SearchBank(IfThen(Pos(' - ', GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewBank.Index]) > 0, Copy(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewBank.Index],1,3), GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRowIndex, GridTableViewBank.Index]))
  else
    SearchBank;
end;
procedure TReserveAcctForm.GridTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  if not GridTableView.DataController.NewItemRowFocused and (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPosNo.Index] <> '00') then
  begin
    GridTableViewAcctAmt.Options.Focusing  := false;
    GridTableViewAcctCode.Options.Focusing := false;
  end
  else
  begin
    GridTableViewAcctAmt.Options.Focusing  := true;
    GridTableViewAcctCode.Options.Focusing := true;
  end;
end;

//------------------------------------------------------------------------------
// 그리드 값을 변경할 때
procedure TReserveAcctForm.GridTableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;

  isChanged := true;
end;
//------------------------------------------------------------------------------
// 그리드 입력값을 포스트 할 때
procedure TReserveAcctForm.GridTableViewDataControllerAfterPost(
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
  end;
  ButtonToolBarCancelButton.Enabled    := true;
end;

procedure TReserveAcctForm.GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;

  // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
  if (ADataController.NewItemRowFocused) and
     ((Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewAcctCode.Index], EmptyStr) = EmptyStr) or
      (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewAcctName.Index], EmptyStr) = EmptyStr) or
      (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewAcctAmt.Index],  0.0)      = 0.0)) then
  begin
    // 기존에 입력된 값을 저장해 놓는다
    SetLength(BackupData, GridTableView.ColumnCount);
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      BackupData[vIndex] := ADataController.Values[-1, vIndex];
    // Post를 취소한다
    ADataController.Cancel;
    Exit;
  end;

  //조회를 안하고 신규를 바로 입력했을때
  if ConditionToolBarFromDateEdit.Enabled then
  begin
    ConditionToolBarFromDateEdit.Enabled := false;
    ButtonToolBarSearchButton.Enabled    := false;
    ButtonToolBarCancelButton.Enabled    := true;
  end;

  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
end;
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TReserveAcctForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vIndex: Integer;
begin
  inherited;

  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  if AFocusedRecord = nil then
    ButtonToolBarDeleteButton.Enabled := false
  else
    ButtonToolBarDeleteButton.Enabled := AFocusedRecord.Index >= 0;

  if APrevFocusedRecord = nil then Exit;

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


  GridTableViewAcctCode.Options.Editing       := GridTableView.Controller.IsNewItemRowFocused;
  GridTableViewAcctCode.Options.Focusing      := GridTableViewAcctCode.Options.Editing;

  if GridTableView.DataController.Values[APrevFocusedRecord.Index, GridTableViewAcctType.Index] = '계좌' then
    GridTableViewBank.Options.Focusing := true
  else
    GridTableViewBank.Options.Focusing := false;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 출납 조회
function TReserveAcctForm.SearchAcct(aAcct: string): string;
begin
  Result := EmptyStr;
  with THelpForm.Create(Self) do
    try
      Caption := '출납 조회';
      GridTableViewCode.Caption  := '출납코드';
      GridTableViewName1.Caption := '출납이름';

      SearchText := aAcct;
      SQLText    := 'select   CD_CODE  as CODE, '
                   +'         NM_CODE1 as CODE1, '
                   +'         case NM_CODE2 when ''0'' then ''수입'' else ''지출'' end as CODE2 '
                   +'  from   MS_CODE '
                   +' where   CD_HEAD   =:P0 '
                   +'   and   CD_STORE  =:P1 '
                   +'   and   CD_KIND   = ''11'' '
                   +'   and  (CD_CODE =:P2 or NM_CODE1 like ConCat(''%'',:P2,''%'')) '
                   +'   and   NM_CODE3 in (''0'', ''4'') '
                   +'   and   DS_STATUS = ''0'' '
                   +' order by CD_STORE, CD_CODE';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctCode.Index] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctName.Index] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewType.Index]     := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewAcctType.Index] := '현금';
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsInsert;
        Self.GridTableView.Controller.FocusedColumnIndex := GridTableViewAcctAmt.Index;
        Self.GridTableViewBank.Options.Focusing := false;
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
    end;
  ConditionToolBarFromDateEdit.Enabled := false;
end;
//------------------------------------------------------------------------------
// 은행 조회
function TReserveAcctForm.SearchBank(aBank: string): string;
begin
  Result := EmptyStr;
  with THelpForm.Create(Self) do
    try
      Caption := '은행 조회';
      GridTableViewCode.Caption  := '은행코드';
      GridTableViewName1.Caption := '은행이름';

      KindCode     := '19';
      SearchText   := aBank;
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, GridTableViewBank.Index] := Code+' - '+Names[0];
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
function TReserveAcctForm.DoSearch: Boolean;
begin
  Result := false;

  try
    OpenQuery('select   a.CD_ACCT, '
             +'         b.NM_CODE1 as NM_ACCT, '
             +'         case b.NM_CODE2 when ''0'' then ''수입''    else ''지출''  end as TYPE, '
             +'         case a.DS_ACCT when ''0'' then ''현금'' when ''1'' then ''카드''  when ''2'' then ''현금영수증'' when ''3'' then ''계좌'' end as DS_ACCT, '
             +'         case b.NM_CODE2 when ''0'' then a.AMT_PAYIN else a.AMT_OUT end as AMT_ACCT, '
             +'         c.NM_CODE1 as BANK, '
             +'         a.REMARK, '
             +'         a.NO_ACCT, '
             +'         a.NO_POS, '
             +'         ''rsNormal'' as ROW_STATE '
             +'from     SL_ACCT as a inner join '
             +'         MS_CODE as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ACCT = b.CD_CODE and b.CD_KIND = ''11'' and b.NM_CODE3 in (''0'', ''4'') left outer join '
             +'         MS_CODE as c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_BANK = c.CD_CODE and c.CD_KIND = ''19'' '
             +'where    a.CD_HEAD   =:P0 '
             +'  and    a.CD_STORE  =:P1 '
             +'  and    a.YMD_OCCUR =:P2 '
             +'order by a.NO_ACCT',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
    isSearch := true;
    ButtonEnable;
    ConditionToolBarFromDateEdit.Enabled := not Result;
  except
  end;
end;
//------------------------------------------------------------------------------
// 삭제
procedure TReserveAcctForm.ButtonEnable;
begin
  ConditionToolBarFromDateEdit.Enabled := not isSearch;
  ButtonToolBarSearchButton.Enabled    := not isSearch;
  ButtonToolBarCancelButton.Enabled    := isSearch;
  ButtonToolBarDeleteButton.Enabled    := GridTableView.DataController.GetFocusedRecordIndex >= 0;
end;

procedure TReserveAcctForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if isChanged then
    if not AskBox('현재 작업을 모두 취소하시겠습니까?') then Exit;
  GridTableView.DataController.RecordCount := 0;
  isChanged := false;
  isSearch  := false;
  ButtonEnable;
  ConditionToolBarFromDateEdit.Enabled := true;
end;

function TReserveAcctForm.DoDelete: Boolean;
var vIndex :Integer;
    vRowIndex :Integer;
begin
  if CheckMonthClose('M',DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    Result := false;
    Exit;
  end;

  if GridTableView.DataController.Values[GridTableView.Controller.FocusedRecordIndex, GridTableViewPosNo.Index] <> '00' then
  begin
    MsgBox('포스에서 등록한 내역은 삭제 할 수 없습니다');
    Exit;
  end;


  // 선택한 레코드를 삭제한다
  try
    //신규로 입력한 레코드는 삭제한다
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
    Result := true;
  except
    Result := false;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TReserveAcctForm.DoSave: Boolean;
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
  GridTableView.DataController.Post;
  // 전체 레코드 돌아가며 필수 입력값 입력하지 않았는지 검사
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if (GridTableView.DataController.Values[vIndex, GridTableViewAcctCode.Index] = null) or
       (GridTableView.DataController.Values[vIndex, GridTableViewAcctCode.Index] = EmptyStr) or
       (GridTableView.DataController.Values[vIndex, GridTableViewAcctName.Index] = null) or
       (GridTableView.DataController.Values[vIndex, GridTableViewAcctName.Index] = EmptyStr) then
    begin
      ErrBox(GridTableViewAcctCode.Caption+msgMustInput);
      GridTableView.DataController.FocusedRecordIndex := vIndex;
      GridTableView.Controller.FocusedColumnIndex     := GridTableViewAcctCode.Index;
      Exit;
    end
    else if (GridTableView.DataController.Values[vIndex, GridTableViewAcctAmt.Index] = null) or
            (GridTableView.DataController.Values[vIndex, GridTableViewAcctAmt.Index] = 0) then
    begin
      ErrBox(GridTableViewAcctAmt.Caption+msgMustInput);
      GridTableView.DataController.FocusedRecordIndex := vIndex;
      GridTableView.Controller.FocusedColumnIndex     := GridTableViewAcctAmt.Index;
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

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
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
                  GridTableView.DataController.Values[vIndex, GridTableViewNoAcct.Index]],
                  False);
      end
      else
      begin
        if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then
        begin
          vNoAcct := FormatFloat('000', vSeq+1);
          Inc(vSeq);
        end
        else
          vNoAcct := GridTableView.DataController.Values[vIndex, GridTableViewNoAcct.Index];

        if GridTableView.DataController.Values[vIndex, GridTableViewAcctType.Index]  = '현금'then
          vAcctType := '0'
        else if GridTableView.DataController.Values[vIndex, GridTableViewAcctType.Index]  = '카드'then
          vAcctType := '1'
        else if GridTableView.DataController.Values[vIndex, GridTableViewAcctType.Index]  = '현금영수증'then
          vAcctType := '2'
        else if GridTableView.DataController.Values[vIndex, GridTableViewAcctType.Index]  = '계좌'then
          vAcctType := '3';

        ExecQuery(Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert,
                  'insert into SL_ACCT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, NO_ACCT, DS_ACCT, CD_ACCT, AMT_PAYIN, AMT_OUT, CD_BANK, REMARK, DT_CHANGE, CD_SAWON_CHG, DT_INSERT) '
                 +'            values (:P0, :P1, :P2, ''00'', :P3, :P4, :P5, :P6, :P7, :P8, :P9,  Now(), :P10, Now()); ',
                 'update SL_ACCT '
                 +'  set DS_ACCT   = :P4, '
                 +'      CD_ACCT   = :P5, '
                 +'      AMT_PAYIN = :P6, '
                 +'      AMT_OUT   = :P7, '
                 +'      CD_BANK   = :P8, '
                 +'      REMARK    = :P9, '
                 +'      DT_CHANGE = Now(), '
                 +'      CD_SAWON_CHG =:P10 '
                 +'where CD_HEAD   =:P0 '
                 +'  and CD_STORE  =:P1 '
                 +'  and YMD_OCCUR =:P2 '
                 +'  and NO_POS    =''00'' '
                 +'  and NO_ACCT   =:P3;'),
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vNoAcct,
                 vAcctType,
                 GridTableView.DataController.Values[vIndex, GridTableViewAcctCode.Index],
                 IfThen(GridTableView.DataController.Values[vIndex, GridTableViewType.Index] = '수입', GridTableView.DataController.Values[vIndex, GridTableViewAcctAmt.Index], 0),
                 IfThen(GridTableView.DataController.Values[vIndex, GridTableViewType.Index] = '수입', 0, GridTableView.DataController.Values[vIndex, GridTableViewAcctAmt.Index]),
                 Copy(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBank.Index], ''), 1, 3),
                 Nvl(GridTableView.DataController.Values[vIndex, GridTableViewRemark.Index], ''),
                 UserCode],
                 false);
      end;
    end;

    Result := ExecQuery(TempSQL, [], true);
    isSearch  := false;
    GridTableView.DataController.RecordCount := 0;
    GridTableView.DataController.EndUpdateFields;
    ButtonEnable;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
