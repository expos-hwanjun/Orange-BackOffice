unit StoreSaleDataDelete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxCalendar, dxDateTimeWheelPicker, cxDBLookupComboBox,
  cxCurrencyEdit, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxGrid, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, AdvGlowButton, DateUtils;

type
  TStoreSaleDataDeleteForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewFromDate: TcxGridColumn;
    GridTableViewToDate: TcxGridColumn;
    GridTableViewSchduleDate: TcxGridColumn;
    GridTableViewInsertDate: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    GridLevel: TcxGridLevel;
    StoreCodeEdit: TcxButtonEdit;
    ButtonToolBarCancelButton: TAdvGlowButton;
    procedure StoreCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StoreCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    JsonURL :String;
    function  SearchStore(aStore: string = ''): string;
  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave  : Boolean; override; // 저장
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  StoreSaleDataDeleteForm: TStoreSaleDataDeleteForm;

implementation
uses
  Common, DBModule, Help;

{$R *.dfm}

{ TStoreSaleDataDeleteForm }

procedure TStoreSaleDataDeleteForm.ButtonToolBarCancelButtonClick(
  Sender: TObject);
begin
  inherited;
  ClearGrid;
  StoreCodeEdit.Enabled := true;
  isChanged := false;
end;

function TStoreSaleDataDeleteForm.DoDelete: Boolean;
var vIndex :Integer;
    vRowIndex :Integer;
begin
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
    Result    := true;
  except
    Result    := false;
  end;
end;

function TStoreSaleDataDeleteForm.DoSave: Boolean;
var vIndex :Integer;
begin
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
    begin
      ExecQuery('delete from DELETE_SCHDULE '
               +' where CD_HEAD     =:P0 '
               +'   and CD_STORE    =:P1 '
               +'   and YMD_SCHDULE =:P2;',
               [ConditionToolBarEdit.Hint,
                StoreCodeEdit.Text,
                GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewSchduleDate.Index])],
                False);
    end
    else
    begin
      if MonthsBetween(StrToDate(GridTableView.DataController.Values[vIndex, GridTableViewFromDate.Index]), StrToDate(GridTableView.DataController.Values[vIndex, GridTableViewToDate.Index])) > 1 then
      begin
        MsgBox('최대 1개월만 지정할 수 있습니다');
        TempSQL := '';
        Exit;
      end;

      if MonthsBetween(Now(), StrToDate(GridTableView.DataController.Values[vIndex, GridTableViewToDate.Index])) < 3 then
      begin
        MsgBox('최소 3개월은 지난 데이터만 삭제가능합니다');
        TempSQL := '';
        Exit;
      end;

      if GridTableView.DataController.Values[vIndex, GridTableViewFromDate.Index] > GridTableView.DataController.Values[vIndex, GridTableViewToDate.Index] then
      begin
        MsgBox('삭제일자를 올바르게 입력하세요');
        TempSQL := '';
        Exit;
      end;

      ExecQuery('insert into DELETE_SCHDULE(CD_HEAD, '
               +'                           CD_STORE, '
               +'                           YMD_SCHDULE, '
               +'                           YMD_FROM, '
               +'                           YMD_TO, '
               +'                           DT_INSERT, '
               +'                           YN_DELETE) '
               +'                   values(:P0, '
               +'                          :P1, '
               +'                          :P2, '
               +'                          :P3, '
               +'                          :P4, '
               +'                          Now(), '
               +'                          ''N'') '
               +'on duplicate key update YMD_FROM =:P3, '
               +'                        YMD_TO   =:P4;',
               [ConditionToolBarEdit.Hint,
                StoreCodeEdit.Text,
                GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewSchduleDate.Index]),
                GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewFromDate.Index]),
                GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewToDate.Index])],false, jsonURL);
    end;
  end;
  if TempSQL <> '' then
  begin
    Result := ExecQuery('',[],true, jsonURL);
    if Result then
    begin
      ClearGrid;
      isChanged := false;
    end;
  end;
end;

function TStoreSaleDataDeleteForm.DoSearch: Boolean;
begin
  if StoreCodeEdit.Text = '' then
  begin
    MsgBox('삭제할 매장을 선택하세요');
    Exit;
  end;

  OpenQuery('select StoD(YMD_SCHDULE) as YMD_SCHDULE, '
           +'       StoD(YMD_FROM)    as YMD_FROM, '
           +'       StoD(YMD_TO)      as YMD_TO, '
           +'       DT_INSERT, '
           +'       YN_DELETE, '
           +'       ''rsNormal'' as ROW_STATE '
           +'  from DELETE_SCHDULE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and YMD_SCHDULE between :P2 and :P3 '
           +' order by YMD_SCHDULE',
           [ConditionToolBarEdit.Hint,
            StoreCodeEdit.Text,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)],false, JsonURL);

  Result := DM.ReadQuery(Query, GridTableView);
  ButtonToolBarDeleteButton.Enabled := false;
  ButtonToolBarSaveButton.Enabled   := false;
  StoreCodeEdit.Enabled             := false;
end;

procedure TStoreSaleDataDeleteForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = StoreCodeEdit then
  begin
    if StoreCodeEdit.Text <> StoreCodeEdit.TextHint then
    begin
      StoreCodeEdit.TextHint := '';
      ConditionToolBarEdit.Clear;
      isChanged := false;
    end;
  end;
end;

procedure TStoreSaleDataDeleteForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;

procedure TStoreSaleDataDeleteForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if not isLoading then
    isChanged := true;
end;

procedure TStoreSaleDataDeleteForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
end;

procedure TStoreSaleDataDeleteForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := true;
end;

function TStoreSaleDataDeleteForm.SearchStore(aStore: string): string;
begin
  Result := EmptyStr;

  // 거래처 조회 폼을 보여준다
  with THelpForm.Create(Self) do
    try
      Caption := '매장 조회';
      GridTableViewCode.Caption  := '매장 코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '매장 이름';
      GridTableViewName1.Width   := 340;
      jsonHelpURL := RestBaseURL;

      SearchText := aStore;
      if UserLevel = 'E' then
        SQLText    := 'select CD_CUSTOMER, '
                     +'       NM_CUSTOMER, '
                     +'       CD_COMPANY '
                     +'  from CUSTOMER  '
                     +' where (CD_CUSTOMER =:P2 or NM_CUSTOMER like ConCat(''%'',:P2,''%'')) '
                     +'   and DS_STATUS = ''0'' '
                     +' order by CD_CUSTOMER'
      else
        SQLText    := 'select CD_CUSTOMER, '
                     +'       NM_CUSTOMER, '
                     +'       CD_COMPANY '
                     +'  from CUSTOMER  '
                     +Format(' where CD_PARTNER = ''%s'' ',[PartnerCode])
                     +'   and (CD_CUSTOMER =:P2 or NM_CUSTOMER like ConCat(''%'',:P2,''%'')) '
                     +'   and DS_STATUS = ''0'' '
                     +' order by CD_CUSTOMER';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result                 := Code;
        StoreCodeEdit.Text     := Code;
        StoreCodeEdit.TextHint := Code;
        ConditionToolBarEdit.Text := Names[0];
        ConditionToolBarEdit.Hint := Names[1];

        JsonURL := GetRestDBURL(Names[1]);
      end;
    finally
      Free;
    end;
end;

procedure TStoreSaleDataDeleteForm.SetChanged(aChanged: Boolean);
begin
  inherited;
end;

procedure TStoreSaleDataDeleteForm.StoreCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if StoreCodeEdit.Text <> EmptyStr then
    StoreCodeEdit.Text := SearchStore(StoreCodeEdit.Text)
  else
    StoreCodeEdit.Text := SearchStore;
end;

procedure TStoreSaleDataDeleteForm.StoreCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  vCode, vName, vName1  : string;
begin
  inherited;
  if Sender = StoreCodeEdit then
  begin
    if DisplayValue <> EmptyStr then
      try
        if UserLevel = 'E' then
          OpenQuery('select CD_CUSTOMER, '
                   +'       NM_CUSTOMER, '
                   +'       CD_COMPANY '
                   +'  from CUSTOMER  '
                   +' where (CD_CUSTOMER =:P0 or NM_CUSTOMER like ConCat(''%'',:P0,''%'')) '
                   +'   and DS_STATUS = ''0'' '
                   +' order by CD_CUSTOMER',
                   [DisplayValue], false, RestBaseURL)
        else
          OpenQuery('select CD_CUSTOMER, '
                   +'       NM_CUSTOMER, '
                   +'       CD_COMPANY '
                   +'  from CUSTOMER  '
                   +' where CD_PARTNER =:P0 '
                   +'   and (CD_CUSTOMER =:P1 or NM_CUSTOMER like ConCat(''%'',:P1,''%'')) '
                   +'   and DS_STATUS = ''0'' '
                   +' order by CD_CUSTOMER',
                   [PartnerCode,
                    DisplayValue], false, RestBaseURL);
        if not Query.Eof then
        begin
          // 일단 첫번째 값을 받아 놓는다
          vCode           := Query.Fields[0].AsString;
          vName           := Query.Fields[1].AsString;
          vName1          := Query.Fields[2].AsString;
          // 쿼리 다음 줄로 이동해 본다
          Query.Next;
          // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
          if Query.Eof then
          begin
            StoreCodeEdit.Text       := vCode;
            DisplayValue             := vCode;
            ConditionToolBarEdit.Text := vName;
            ConditionToolBarEdit.Hint := vName1;
            JsonURL := GetRestDBURL(vName1);
          end
          // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
          else
          begin
            FinishQuery;
            DisplayValue := SearchStore(DisplayValue);
          end;
        end
        else
        begin
          ErrorText := Replace(ConditionToolBarEditLabel.Caption)+msgMustInput;
          Error     := true;
          Exit;
        end;
      finally
        FinishQuery;
      end;
  end;
end;

end.
