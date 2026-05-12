// 그리드 편집 상속폼 (F)

unit InheritGridEdit;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, UniProvider, Math, SQLServerUniProvider, Uni,
  DB, MemDS, ExtCtrls, StdCtrls, Menus, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, AdvSplitter,
  AdvToolBar, AdvToolBarStylers, cxContainer, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels,
  cxLookAndFeelPainters,  DBAccess, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxmdaset,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  StrUtils, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TInheritGridEditForm = class(TInheritEditForm)
    GridPanel: TPanel;
    GridSplitter: TAdvSplitter;
    MainPanel: TPanel;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure WorkTimerTimer(Sender: TObject);

  protected
    isNew  : Boolean;
    isDoNew: Boolean;
    NewData: array of Variant;
    PrevRow: Integer;
    FisMultiMode :Boolean;

    procedure SetChanged(aChanged: Boolean); override;
    procedure SetMultiMode(aMultiMode: Boolean); virtual;
    procedure ClearEdit; override;
    function  DoNew: Boolean; virtual;
    procedure DoGridLink; virtual;
    property  isMultiMode: Boolean read FisMultiMode write SetMultiMode;
  end;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TInheritGridEditForm.FormCreate(Sender: TObject);
begin
  inherited;
//  isMultiMode := False;
end;

procedure TInheritGridEditForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // 단축키 처리를 한다
  case Key of
    VK_F3 : if ButtonToolBarNewButton.Visible and ButtonToolBarNewButton.Enabled then ButtonToolBarNewButton.Click;
    VK_F7 : if ButtonToolBarCancelButton.Visible and ButtonToolBarCancelButton.Enabled then ButtonToolBarCancelButton.Click;
  end;
end;

procedure TInheritGridEditForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// 그리드 다른 레코드를 선택할 때
procedure TInheritGridEditForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  isLoading     := true;
  Screen.Cursor := crHourGlass;
  try
    if GridTableView.DataController.RecordCount = 0 then
    begin
      ClearEdit;
      Exit;
    end;

    // 변경된 자료가 있을 때는 저장부터 한다
    PrevRow := -1;
    if isChanged then
    begin
      //신규작업중에는 저장하지 않는다
      if (APrevFocusedRecord <> nil) and AskBox('변경 된 자료를 저장하시겠습니까?') then
      begin
        PrevRow := APrevFocusedRecord.Index;
        ButtonToolBarSaveButton.Click;

       //신규상태였으면 마지막 Row로 위치를 이동한다
       if isNew then
         GridTableView.Controller.FocusedRecordIndex := GridTableView.DataController.RecordCount-1;
      end;
    end
    else
    begin
      isChanged := false;
    end;


    // 연결된 자료를 보여준다
    if (GridTableView.DataController.FocusedRecordIndex >= 0) then
      DoGridLink;
    ResetEditProperties;
  finally
    Screen.Cursor := crDefault;
    isLoading     := false;
    isChanged     := false;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 셀을 그릴 때
procedure TInheritGridEditForm.GridTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var vMultiMode :Boolean;
begin
  inherited;
  if not GridTableView.OptionsSelection.MultiSelect then Exit;

  vMultiMode := GridTableView.Controller.SelectedRecordCount > 0;

  if isMultiMode <> vMultiMode then
    isMultiMode := vMultiMode;
end;

procedure TInheritGridEditForm.GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // 선택만 되어 있으면 포커스가 없어도 선택 색깔로 표시한다
  if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color  := clHighlightText;
  end
  else
  begin
    ACanvas.Brush.Color := clWindow;
    ACanvas.Font.Color  := clWindowText;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TInheritGridEditForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSearchButton.Visible or not ButtonToolBarSearchButton.Enabled then
    Exit;

//inherited;

  // 변경된 자료가 있을 때는 저장부터 한다
  if isChanged then
  begin
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click
    else
      ClearEdit;
  end;

  isLoading     := true;
  Screen.Cursor := crHourGlass;
  try
    if not IsDebuggerPresent then
      BlockInput(true);
    if not DoSearch then
    begin
      if not isDoNew then
        MsgBox('조회 내용이 없습니다.');
      ClearEdit;
      if ConditionToolBarEdit.Visible then
      begin
        ConditionToolBarEdit.SelectAll;
        if ConditionToolBarEdit.Enabled then
          ConditionToolBarEdit.SetFocus;
      end;
      // 자동으로 신규처리
      FinishQuery;
      MainPanel.Enabled := false;
      if (ButtonToolBarNewButton.Visible) and (isDoNew) then
        ButtonToolBarNewButton.Click;
      ResetEditProperties;
    end
    else
    begin
      MainPanel.Enabled := true;
      if GridTableView.DataController.RecordCount > 0 then
        GridTableView.DataController.FocusedRecordIndex := GridTableView.DataController.RecordCount - 1;
      isChanged := false;
    end;
  finally
    BlockInput(false);
    Grid.Enabled  := true;
    isLoading     := false;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
// 신규 버튼
procedure TInheritGridEditForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  if Copy(HelpKeyword,4,1) = '0' then
  begin
    MsgBox('등록 권한이 없습니다');
    Exit;
  end;


  if isChanged then
  begin
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  // 입력창들을 모두 지운다
  ClearEdit;
  // 그리드의 선택 줄을 지운다
  GridTableView.Controller.FocusedRecordIndex := -1;

  MainPanel.Enabled := true;
  Grid.Enabled      := MainPanel.Enabled;
  isNew             := DoNew;
  isChanged         := true;
  MainPanel.Enabled := isNew;
  Grid.Enabled      := MainPanel.Enabled;
end;
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TInheritGridEditForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var
  vRow: Integer;
begin
  if not ButtonToolBarDeleteButton.Visible or not ButtonToolBarDeleteButton.Enabled then
    Exit;

  if Copy(HelpKeyword,2,1) = '0' then
  begin
    MsgBox('삭제 권한이 없습니다');
    Exit;
  end;


//inherited;

  if (GridTableView.ViewData.RecordCount = 0) or (GridTableView.DataController.FocusedRecordIndex = -1) then
    Exit;
  if not AskBox('삭제하시겠습니까?') then
    Exit;

  vRow := GridTableView.DataController.FocusedRecordIndex;

  try
    if not isDebugMode then
      BlockInput(true);
    if DoDelete then
    begin
      ResetEditProperties;
      ShowMsg('삭제 했습니다.');
      GridTableView.DataController.DeleteRecord(vRow);
      if vRow > GridTableView.DataController.RecordCount-1 then
        GridTableView.DataController.FocusedRecordIndex := GridTableView.DataController.RecordCount-1
      else
        GridTableView.DataController.FocusedRecordIndex := vRow;
      GridTableViewFocusedRecordChanged(nil, nil, nil, False);
      isChanged := false;
      // 자동으로 신규처리
      if GridTableView.DataController.RecordCount = 0 then
        ButtonToolBarNewButton.Click;
    end
    else
    begin
      ErrBox('삭제하지 못했습니다.');
    end;
  finally
    BlockInput(false);
  end;
end;
//------------------------------------------------------------------------------
// 저장 버튼
procedure TInheritGridEditForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var
  vRow: Integer;
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  if Copy(HelpKeyword,3,1) = '0' then
  begin
    MsgBox('저장 권한이 없습니다');
    Exit;
  end;
//inherited;

  if not isChanged then
    ShowMsg('변경된 내용이 없습니다.')
  else
  begin
    ApplySaveEdit.SetFocus;

    if isNew then
      vRow := GridTableView.DataController.RecordCount-1
    else
      vRow := GridTableView.DataController.FocusedRecordIndex;

    if DoSave then
    begin
      ResetEditProperties;
      isChanged := false;
      ShowMsg('저장 했습니다.');

      // 신규일 때는 그리드 마지막에 레코드를 하나 추가한다(NewData에 값이 미리 들어있어야 한다)
      if isNew then
      begin
        if (NewData <> nil) and (High(NewData) > 0) then
        begin
          GridTableView.DataController.AppendRecord;
          for vRow := 0 to GridTableView.ColumnCount-1 do
            if High(NewData) >= vRow then
            begin
              if (Length(NewData[vRow]) = 19) and (LeftStr(NewData[vRow],4) = FormatDateTime('yyyy',Now())) then
                 GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vRow] := StrToDateTime(NewData[vRow])
              else
                GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vRow] := NewData[vRow];
            end;
          GridTableView.DataController.Post;
          GridTableView.DataController.FocusedRecordIndex := GridTableView.DataController.RecordCount-1;
          SetLength(NewData, 0);
          NewData := nil;
        end;
      end
      // 수정일 때는 현재 그리드를 그냥 선택한다
      else
      begin
        if GridTableView.DataController.RecordCount > vRow then
          GridTableView.DataController.FocusedRecordIndex := vRow
        else
          GridTableView.DataController.FocusedRecordIndex := 0;
      end;
      isNew := false;
    end
    else
    begin
      ShowMsg('저장하지 못했습니다.', true);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure TInheritGridEditForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;

  // 입력창들을 모두 지우고 연결된 값을 새로 불러온다
  ClearEdit;
  GridTableViewFocusedRecordChanged(nil, nil, nil, False);
  if GridTableView.DataController.RecordCount > 0 then
  begin
    GridTableView.Controller.FocusedRecordIndex := GridTableView.DataController.RecordCount-1;
    DoGridLink;
  end;
  MainPanel.Enabled := GridTableView.DataController.RecordCount > 0;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 변경 여부 설정
procedure TInheritGridEditForm.SetChanged(aChanged: Boolean);
begin
  inherited;

  ButtonToolBarSearchButton.Enabled := not aChanged;
  ButtonToolBarNewButton.Enabled    := not aChanged;
  ButtonToolBarCancelButton.Enabled := ButtonToolBarCancelButton.Visible and aChanged;
end;
procedure TInheritGridEditForm.SetMultiMode(aMultiMode: Boolean);
begin
  FisMultiMode := aMultiMode;
end;

procedure TInheritGridEditForm.WorkTimerTimer(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 입력창 내용 초기화
procedure TInheritGridEditForm.ClearEdit;
begin
  inherited;

  ButtonToolBarDeleteButton.Enabled := false;
end;
procedure TInheritGridEditForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ButtonToolBarSearchButton.Click;
  end;
  inherited;
end;

//------------------------------------------------------------------------------
// 신규
function TInheritGridEditForm.DoNew: Boolean;
begin
  Result := true;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TInheritGridEditForm.DoGridLink;
begin
  isNew := false;
  ButtonToolBarDeleteButton.Enabled := GridTableView.DataController.FocusedRecordIndex >= 0;

  if (GridTableView.DataController.FocusedRecordIndex = -1) or
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, 0] = null) then
    Exit;
end;

end.
