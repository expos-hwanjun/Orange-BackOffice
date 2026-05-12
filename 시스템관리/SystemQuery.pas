// 쿼리 분석기 (완료)

unit SystemQuery;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, cxGridExportLink, Clipbrd, Inherit, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxButtonEdit,
  cxDropDownEdit, cxContainer, DAScript, UniScript, Menus, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, StdCtrls, AdvOfficePager, AdvToolBar, ExtCtrls,
  AdvSplitter, UniProvider, SQLServerUniProvider, Uni, DB, MemDS,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  cxMemo, AdvToolBarStylers, cxLookAndFeels, cxLookAndFeelPainters, DBAccess;

type
  TSystemQueryForm = class(TInheritForm)
    ButtonToolBarExecuteButton: TAdvGlowButton;
    ButtonToolBarCommitButton: TAdvGlowButton;
    ButtonToolBarRollbackButton: TAdvGlowButton;
    ButtonToolBarExcelButton: TAdvGlowButton;
    ButtonToolBarSeparator: TAdvToolBarSeparator;
    QueryPager: TAdvOfficePager;
    QueryPagerQuery: TAdvOfficePage;
    QueryPagerScript: TAdvOfficePage;
    QueryPagerQueryMemo: TcxMemo;
    QueryPagerScriptMemo: TcxMemo;
    Splitter: TAdvSplitter;
    Script: TUniScript;
    Grid: TcxGrid;
    GridView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    QueryPagerScriptOpenDialog: TOpenDialog;
    QueryPagerScriptSaveDialog: TSaveDialog;
    QueryPagerScriptPopupMenu: TPopupMenu;
    QueryPagerScriptPopupMenuLoad: TMenuItem;
    QueryPagerScriptPopupMenuSave: TMenuItem;
    QueryPagerScriptPopupMenuLine1: TMenuItem;
    QueryPagerScriptPopupMenuUndo: TMenuItem;
    QueryPagerScriptPopupMenuLine2: TMenuItem;
    QueryPagerScriptPopupMenuCut: TMenuItem;
    QueryPagerScriptPopupMenuCopy: TMenuItem;
    QueryPagerScriptPopupMenuPaste: TMenuItem;
    QueryPagerScriptPopupMenuDelete: TMenuItem;
    QueryPagerScriptPopupMenuLine3: TMenuItem;
    QueryPagerScriptPopupMenuSelectAll: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarExecuteButtonClick(Sender: TObject);
    procedure ButtonToolBarRollbackButtonClick(Sender: TObject);
    procedure ButtonToolBarCommitButtonClick(Sender: TObject);
    procedure ButtonToolBarExcelButtonClick(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QueryPagerScriptPopupMenuSaveClick(Sender: TObject);
    procedure QueryPagerScriptPopupMenuLoadClick(Sender: TObject);
    procedure QueryPagerChange(Sender: TObject);
    procedure QueryPagerScriptPopupMenuUndoClick(Sender: TObject);
    procedure QueryPagerScriptPopupMenuCutClick(Sender: TObject);
    procedure QueryPagerScriptPopupMenuCopyClick(Sender: TObject);
    procedure QueryPagerScriptPopupMenuPasteClick(Sender: TObject);
    procedure QueryPagerScriptPopupMenuDeleteClick(Sender: TObject);
    procedure QueryPagerScriptPopupMenuSelectAllClick(Sender: TObject);
    procedure QueryPagerScriptPopupMenuPopup(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    ErrorMessage: string;
    ScriptFileName: string;

    procedure ExcuteQuery;
    procedure SetGridColumns;
  end;

var
  SystemQueryForm: TSystemQueryForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSystemQueryForm.FormShow(Sender: TObject);
begin
  inherited;

  QueryPager.ActivePageIndex := 0;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TSystemQueryForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  case Key of
    VK_F5 : ButtonToolBarExecuteButton.Click;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 실행 버튼
procedure TSystemQueryForm.ButtonToolBarExecuteButtonClick(Sender: TObject);
begin
  inherited;

  ExcuteQuery;
end;
//------------------------------------------------------------------------------
// 롤백 버튼
procedure TSystemQueryForm.ButtonToolBarRollbackButtonClick(Sender: TObject);
begin
  inherited;

  RollbackTrans;
  ButtonToolBarRollbackButton.Enabled := false;
  ButtonToolBarCommitButton.Enabled   := false;
end;
//------------------------------------------------------------------------------
// 커밋 버튼
procedure TSystemQueryForm.ButtonToolBarCommitButtonClick(Sender: TObject);
var
  vSqlText: string;
begin
  inherited;

  vSqlText := SQL.SQL.Text;
  SQL.SQL.Text := 'insert into QUERY_LOG '
                 +'( '
                 +'  SQL_TXT, RESULT '
                 +') values ( '
                 +'  :P0, :P1 '
                 +')';
  SQL.Params[0].AsString := vSqlText;
  SQL.Params[1].AsString := ErrorMessage;
  SQL.Execute;

  CommitTrans;
  ButtonToolBarRollbackButton.Enabled := false;
  ButtonToolBarCommitButton.Enabled   := false;
end;
//------------------------------------------------------------------------------
// 엑셀 버튼
procedure TSystemQueryForm.ButtonToolBarExcelButtonClick(Sender: TObject);
var
  vFileName: string;
begin
  inherited;

  vFileName := Caption+' '+FormatDateTime(fmtDateShort, Date)+'.xls';
  ExportGridToExcel(vFileName, Grid, False);
  ShellExecute(0, 'open', PChar(vFileName), nil, nil, SW_SHOW);
end;

//==============================================================================
// 쿼리, 스크립트
//------------------------------------------------------------------------------
// 쿼리/스크립트 페이지를 변경할 때
procedure TSystemQueryForm.QueryPagerChange(Sender: TObject);
begin
  inherited;

  if QueryPager.ActivePageIndex = 0 then
    QueryPagerQueryMemo.SetFocus
  else
    QueryPagerScriptMemo.SetFocus;
end;
//------------------------------------------------------------------------------
// 쿼리/스크립트 입력창에서 키보드를 누를 때
procedure TSystemQueryForm.MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Ctrl-A를 눌렀을 때 전체 선택을 한다
  if (Shift = [ssCtrl]) and (Key = $41) then
    TMemo(Sender).SelectAll;
end;
//------------------------------------------------------------------------------
// 스크립트 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuPopup(Sender: TObject);
begin
  inherited;

  QueryPagerScriptPopupMenuSave.Enabled      := QueryPagerScriptMemo.Lines.Text <> EmptyStr;
  QueryPagerScriptPopupMenuUndo.Enabled      := QueryPagerScriptMemo.ModifiedAfterEnter;
  QueryPagerScriptPopupMenuCut.Enabled       := QueryPagerScriptMemo.SelLength > 0;
  QueryPagerScriptPopupMenuCopy.Enabled      := QueryPagerScriptPopupMenuCut.Enabled;
  QueryPagerScriptPopupMenuPaste.Enabled     := Clipboard.HasFormat(CF_TEXT);
  QueryPagerScriptPopupMenuDelete.Enabled    := QueryPagerScriptPopupMenuCut.Enabled;
  QueryPagerScriptPopupMenuSelectAll.Enabled := QueryPagerScriptMemo.SelLength <> Length(QueryPagerScriptMemo.Lines.Text);
end;
//------------------------------------------------------------------------------
// 스크립트 불러오기 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuLoadClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptOpenDialog.FileName := ScriptFileName;
  if QueryPagerScriptOpenDialog.Execute then
    QueryPagerScriptMemo.Lines.LoadFromFile(QueryPagerScriptOpenDialog.FileName);
end;
//------------------------------------------------------------------------------
// 스크립트 저장 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuSaveClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptSaveDialog.FileName := ScriptFileName;
  if QueryPagerScriptSaveDialog.Execute then
    QueryPagerScriptMemo.Lines.SaveToFile(QueryPagerScriptOpenDialog.FileName);
end;
//------------------------------------------------------------------------------
// 스크립트 실행 취소 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuUndoClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptMemo.Undo;
end;
//------------------------------------------------------------------------------
// 스크립트 잘라내기 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuCutClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptMemo.CutToClipboard;
end;
//------------------------------------------------------------------------------
// 스크립트 복사 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuCopyClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptMemo.CopyToClipboard;
end;
//------------------------------------------------------------------------------
// 스크립트 붙여넣기 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuPasteClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptMemo.PasteFromClipboard;
end;
//------------------------------------------------------------------------------
// 스크립트 삭제 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuDeleteClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptMemo.ClearSelection;
end;
//------------------------------------------------------------------------------
// 스크립트 모두 선택 팝업메뉴
procedure TSystemQueryForm.QueryPagerScriptPopupMenuSelectAllClick(Sender: TObject);
begin
  inherited;

  QueryPagerScriptMemo.SelectAll;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 쿼리 실행
procedure TSystemQueryForm.ExcuteQuery;
var
  vSqlText: string;
  vIndex  : Integer;
begin
  // DML을 실행했었다면 롤백을 한다
  if ButtonToolBarRollbackButton.Enabled then
    ButtonToolBarRollbackButton.Click;

  ButtonToolBarRollbackButton.Enabled := false;
  ButtonToolBarCommitButton.Enabled   := false;
  ButtonToolBarExcelButton.Enabled    := false;
  GridView.DataController.RecordCount := 0;

  // 쿼리 실행
  if QueryPager.ActivePageIndex = 0 then
  begin
    vSqlText := Trim(QueryPagerQueryMemo.SelText);
    if vSqlText = EmptyStr then
      vSqlText := Replace(QueryPagerQueryMemo.Text, #$D#$A, ' ');
    if vSqlText = EmptyStr then
    begin
      ShowMsg('실행할 쿼리가 없습니다.', true);
      Exit;
    end;

    // Select
    if UpperCase(Copy(vSqlText, 1, 1)) = 'S' then
    begin
      try
        ShowMsg('조회 중입니다.');
        ConnectDB;
        Query.SQL.Text := vSqlText;
        Query.Open;
        SetGridColumns;
        // 쿼리를 읽어 그리드에 보여준다(쓰레드)
        DM.ReadQuery(Query, GridView);
      except
        on E: Exception do
        begin
          ErrBox(E.Message);
          ShowMsg(E.Message, true, -1);
        end;
      end;
    end

    // DML
    else
    begin
      ShowMsg('실행 중입니다.');
      try
        ConnectDB; // 연결 종료는 커밋, 롤백 버튼을 누를 때
        BeginTrans;
        SQL.SQL.Text := vSqlText;
        SQL.Execute;
        ButtonToolBarRollbackButton.Enabled := true;
        ButtonToolBarCommitButton.Enabled   := true;
        ShowMsg('실행 완료... 커밋을 눌러 실행을 확정하거나, 롤백을 눌러 실행을 취소하십시오.');
      except
        on E: Exception do
        begin
          RollbackTrans;
          ButtonToolBarRollbackButton.Enabled := false;
          ButtonToolBarCommitButton.Enabled   := false;
          ErrBox(E.Message);
          ShowMsg(E.Message, true, -1);
        end;
      end;
    end;
  end

  // 스크립트 실행
  else
  begin
    ConnectDB;
    try
      with TStringList.Create do
        try
          vSqlText := Trim(QueryPagerScriptMemo.SelText);
          if vSqlText = EmptyStr then
            for vIndex := 0 to QueryPagerScriptMemo.Lines.Count-1 do
            begin
              if UpperCase(Trim(QueryPagerScriptMemo.Lines.Strings[vIndex])) <> 'GO' then
                Add(QueryPagerScriptMemo.Lines.Strings[vIndex])
              else
              begin
                Script.SQL.Text := Text;
                Script.Execute;
                Clear;
              end;
            end
          else
          begin
            Script.SQL.Text := vSqlText;
            Script.Execute;
          end;
        finally
          Free;
        end;
      ShowMsg('모든 스크립트 실행 완료');
    except
      on E: Exception do
      begin
        RollbackTrans;
        ButtonToolBarRollbackButton.Enabled := false;
        ButtonToolBarCommitButton.Enabled   := false;
        ErrBox(E.Message);
        ShowMsg(E.Message, true, -1);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 칼럼 만들기
procedure TSystemQueryForm.SetGridColumns;
var
  vIndex :Integer;
begin
  if not Query.Active then
    Exit;
  GridView.ClearItems;
  if not Query.Eof then
    for vIndex := 0 to Query.FieldCount-1 do
    begin
      GridView.CreateColumn;
      GridView.Columns[GridView.ColumnCount-1].Caption               := Query.Fields[vIndex].FieldName;
      GridView.Columns[GridView.ColumnCount-1].DataBinding.FieldName := Query.Fields[vIndex].FieldName; // 필드명
      if Query.Fields[vIndex].DataType in [ftInteger, ftFloat] then
      begin
        GridView.Columns[GridView.ColumnCount-1].PropertiesClassName       := 'TcxCurrencyEditProperties';
        GridView.Columns[GridView.ColumnCount-1].Properties.Alignment.Horz := taRightJustify;
        GridView.Columns[GridView.ColumnCount-1].Options.Filtering         := False;
        TcxCustomCurrencyEditProperties(GridView.Columns[GridView.ColumnCount-1].Properties).DisplayFormat  := '0,';
      end;
    end;
end;

end.
