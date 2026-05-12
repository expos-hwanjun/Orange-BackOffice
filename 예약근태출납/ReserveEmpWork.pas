unit ReserveEmpWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCalendar, cxGridCustomTableView, cxGridTableView,
  cxControls, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, AdvToolBar,
  AdvToolBarStylers, ExtCtrls, cxContainer, Uni, DB, MemDS,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, AdvGlowButton, cxButtonEdit,
  cxTimeEdit, cxLookAndFeels, cxLookAndFeelPainters, DBAccess, cxCurrencyEdit,
  StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, DateUtils;

type
  TReserveEmpWorkForm = class(TInheritEditForm)
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewEmpCode: TcxGridColumn;
    GridTableViewEmpName: TcxGridColumn;
    GridTableViewSettleIn: TcxGridColumn;
    GridTableViewSettleOut: TcxGridColumn;
    GridTableViewTimeIn: TcxGridColumn;
    GridTableViewTimeOut: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewIPAddress: TcxGridColumn;
    GridTableViewTimeCode: TcxGridColumn;
    ButtonToolBarCancelButton: TAdvGlowButton;
    GridTableViewRowState: TcxGridColumn;
    GridTableViewSettleInOrg: TcxGridColumn;
    procedure GridTableViewSawonCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewSettleInPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewSettleOutPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewEmpCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
  private
    isSearch :Boolean;    //조회여부(조회를 하고 저장을 하면 조회조건데이터를 모두 지우고 다시 Insert 한다
                          //         조회를 하지 않고 저장을 하면 그리드의 데이터만 Insert 한다
    function  SearchEmp(aEmp: string = ''): string;
    procedure ButtonEnable;
  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave  : Boolean; override; // 저장
  end;

var
  ReserveEmpWorkForm: TReserveEmpWorkForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

procedure TReserveEmpWorkForm.FormCreate(Sender: TObject);
begin
  inherited;
  isSearch := false;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;

//------------------------------------------------------------------------------
// 조회
function TReserveEmpWorkForm.DoSearch: Boolean;
begin
  OpenQuery('select   a.CD_SAWON, '
           +'         b.NM_SAWON, '
           +'         a.SETTLE_IN, '
           +'         a.SETTLE_OUT, '
           +'         a.TIME_IN, '
           +'         a.TIME_OUT, '
           +'         a.NO_POS, '
           +'         a.IP_ADDRESS, '
           +'         a.CD_TIME, '
           +'         Date_Format(a.SETTLE_IN, ''%Y%m%d'') as SETTLE_IN_ORG, '
           +'         ''rsNormal'' as ROW_STATE '
           +'from     SL_SAWONWORK  as a inner join '
           +'         MS_SAWON      as b on a.CD_HEAD  = b.CD_HEAD '
           +'                           and a.CD_STORE = b.CD_STORE '
           +'                           and a.CD_SAWON = b.CD_SAWON '
           +'where    a.CD_HEAD  =:P0 '
           +'  and    a.CD_STORE =:P1 '
           +'  and    Date_Format(a.SETTLE_IN, ''%Y%m%d'') = :P2 '
           +'order by a.CD_SAWON',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
  isSearch := true;
  ButtonEnable;
  ConditionToolBarFromDateEdit.Enabled := not Result;
end;


procedure TReserveEmpWorkForm.ButtonEnable;
begin
  ConditionToolBarFromDateEdit.Enabled := not isSearch;
  ButtonToolBarSearchButton.Enabled    := not isSearch;
  ButtonToolBarCancelButton.Enabled    := isSearch;
  GridTableView.NewItemRow.Visible     := isSearch;
  ButtonToolBarDeleteButton.Enabled    := GridTableView.DataController.RecordCount > 0;
end;

procedure TReserveEmpWorkForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if isChanged then
    if not AskBox('현재 작업을 모두 취소하시겠습니까?') then Exit;
  GridTableView.DataController.RecordCount := 0;
  isSearch  := false;
  isChanged := false;
  ButtonEnable;
  ConditionToolBarFromDateEdit.Enabled := true;
end;

function TReserveEmpWorkForm.DoDelete: Boolean;
var vIndex :Integer;
    vRowIndex :Integer;
begin
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

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
function TReserveEmpWorkForm.DoSave: Boolean;
var vIndex :Integer;
begin
  Result := false;
  GridTableView.DataController.Post;

  try
    for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete from SL_SAWONWORK '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_SAWON =:P2 '
                 +'   and Date_Format(SETTLE_IN, ''%Y%m%d'') = :P3; ',
                  [HeadStoreCode,
                   StoreCode,
                   GridTableView.DataController.Values[vIndex, GridTableViewEmpCode.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewSettleInOrg.Index]],
                   false);
      end
      else if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then
      begin
        ExecQuery('insert into SL_SAWONWORK(CD_HEAD, CD_STORE, CD_SAWON, SETTLE_IN, SETTLE_OUT, TIME_IN, TIME_OUT, NO_POS, IP_ADDRESS, CD_TIME) '
                 +'               values (:P0, :P1, :P2, :P3, case when :P4 = '''' then null else :P4 end, case when :P5 = '''' then null else :P5 end, case when :P6 = '''' then null else :P6 end, :P7, :P8, :P9);',
                  [HeadStoreCode,
                   StoreCode,
                   GridTableView.DataController.Values[vIndex, GridTableViewEmpCode.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewSettleIn.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewSettleOut.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewTimeIn.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewTimeOut.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewPosNo.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewIPAddress.Index],
                   GridTableView.DataController.Values[vIndex, GridTableViewTimeCode.Index]],
                   false);
      end
      else if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsUpdate then
      begin
        if GridTableView.DataController.Values[vIndex, GridTableViewSettleInOrg.Index] <> FormatDateTime('yyyymmdd',GridTableView.DataController.Values[vIndex, GridTableViewSettleIn.Index]) then
          MsgBox('출근일자를 변경할 수 없습니다')
        else
          ExecQuery('update SL_SAWONWORK '
                   +'   set SETTLE_IN  = :P4, '
                   +'       SETTLE_OUT = :P5, '
                   +'       TIME_IN    = :P6, '
                   +'       TIME_OUT   = :P7, '
                   +'       CD_TIME    = :P8 '
                   +' where CD_HEAD  =:P0 '
                   +'   and CD_STORE =:P1 '
                   +'   and CD_SAWON =:P2 '
                   +'   and Date_Format(SETTLE_IN, ''%Y%m%d'') = :P3; ',
                    [HeadStoreCode,
                     StoreCode,
                     GridTableView.DataController.Values[vIndex, GridTableViewEmpCode.Index],
                     GridTableView.DataController.Values[vIndex, GridTableViewSettleInOrg.Index],
                     GridTableView.DataController.Values[vIndex, GridTableViewSettleIn.Index],
                     GridTableView.DataController.Values[vIndex, GridTableViewSettleOut.Index],
                     GridTableView.DataController.Values[vIndex, GridTableViewTimeIn.Index],
                     GridTableView.DataController.Values[vIndex, GridTableViewTimeOut.Index],
                     GridTableView.DataController.Values[vIndex, GridTableViewTimeCode.Index]],
                     false);
      end;

    end;
    Result    := ExecQuery(TempSQL, [], true);
    if Result then
    begin
      isSearch  := false;
      GridTableView.DataController.RecordCount := 0;
      ButtonEnable;
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

//------------------------------------------------------------------------------
// (그리드)로우 포커스 변경 시
procedure TReserveEmpWorkForm.GridTableViewCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
//  if (not GridTableView.Controller.IsNewItemRowFocused)
//    and (NVL(GridTableView.DataController.Values[ARecord.Index, GridTableViewPosNo.Index],'') <> '')
//    and (NVL(GridTableView.DataController.Values[ARecord.Index, GridTableViewSettleOut.Index],'') = '')
//    and (DaysBetween(Now(), ConditionToolBarFromDateEdit.Date) < 2)  then
//    GridTableView.OptionsData.Editing := false
//  else
//    GridTableView.OptionsData.Editing := true;
end;

procedure TReserveEmpWorkForm.GridTableViewDataControllerAfterPost(
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

procedure TReserveEmpWorkForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
end;

procedure TReserveEmpWorkForm.GridTableViewEmpCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue <> '' then
    if SearchEmp(DisplayValue) = '' then
    begin
      DisplayValue := '';
    end;
end;

procedure TReserveEmpWorkForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := (GridTableView.DataController.RecordCount > 0) and (not GridTableView.Controller.IsNewItemRowFocused);
end;

//------------------------------------------------------------------------------
// 사원코드 버튼에디트 클릭 이벤트
procedure TReserveEmpWorkForm.GridTableViewSawonCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  // 사원을 조회한다
  if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewEmpCode.Index] <> null then
    SearchEmp(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewEmpCode.Index])
  else
    SearchEmp;
end;

procedure TReserveEmpWorkForm.GridTableViewSettleInPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if (NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSettleOut.Index],'') <> '')
    and  (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSettleOut.Index] < DisplayValue) then
  begin
    ErrorText := '출근시간이 퇴근시간보다 클 수 없습니다.';
    Error     := True;
  end;
end;

procedure TReserveEmpWorkForm.GridTableViewSettleOutPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if (NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSettleIn.Index],'') <> '')
    and (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSettleIn.Index] > DisplayValue) then
  begin
    ErrorText := '퇴근시간이 출근시간보다 작을 수 없습니다.';
    Error     := True;
  end;
end;

//------------------------------------------------------------------------------
// 사원조회
function TReserveEmpWorkForm.SearchEmp(aEmp: string): string;
var vIndex :Integer;
begin
  Result := EmptyStr;

  with THelpForm.Create(Self) do
    try
      Caption := '사원 조회';
      GridTableViewCode.Caption  := GridTableViewEmpCode.Caption;
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := GridTableViewEmpName.Caption;
      GridTableViewName1.Width   := 200;

      SearchText   := aEmp;
      IsAutoSearch := true;
      SQLText    := 'select   CD_SAWON, '
                   +'         NM_SAWON, '
                   +'         CD_TIME_PAY '
                   +'  from   MS_SAWON  '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and   DS_SAWON =''P'' '
                   +'   and  (CD_SAWON =:P2 or NM_SAWON like ConCat(''%'',:P2,''%'')) '
                   +' order by CD_SAWON ';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        vIndex := Self.GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewEmpCode.Index, Code, false, false, true)];
        if vIndex >= 0 then
        begin
          Result := '';
          MsgBox('이미 출근한 직원입니다');
          Self.GridTableView.Controller.FocusedRowIndex := vIndex;
          Exit;
        end;

        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewEmpCode.Index] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewEmpName.Index] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTimeCode.Index] := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex,    GridTableViewRowState.Index] := rsInsert;
        Self.GridTableView.Controller.FocusedColumnIndex := GridTableViewSettleIn.Index;
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
    end;
  ConditionToolBarFromDateEdit.Enabled := false;
end;

//------------------------------------------------------------------------------
// 수정여부 변경 시 삭제버튼 Enabled 변경
procedure TReserveEmpWorkForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := (GridTableView.DataController.RecordCount > 0) and (not GridTableView.Controller.IsNewItemRowFocused);
end;

end.
