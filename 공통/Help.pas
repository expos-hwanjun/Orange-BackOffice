// 도움말 (F)

unit Help;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, cxContainer,
  cxTextEdit, StrUtils, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  AdvGlowButton;

type
  THelpForm = class(TForm)
    SearchLabel: TLabel;
    SearchEdit: TcxTextEdit;
    Grid: TcxGrid;
    GridLevel: TcxGridLevel;
    GridTableView: TcxGridTableView;
    GridTableViewCode: TcxGridColumn;
    GridTableViewName1: TcxGridColumn;
    GridTableViewName2: TcxGridColumn;
    GridTableViewName3: TcxGridColumn;
    GridTableViewName4: TcxGridColumn;
    GridTableViewName5: TcxGridColumn;
    GridTableViewName6: TcxGridColumn;
    GridTableViewName7: TcxGridColumn;
    GridTableViewName8: TcxGridColumn;
    GridTableViewName9: TcxGridColumn;
    GridTableViewName10: TcxGridColumn;
    GridTableViewName11: TcxGridColumn;
    GridTableViewName12: TcxGridColumn;
    GridTableViewName13: TcxGridColumn;
    GridTableViewName14: TcxGridColumn;
    GridTableViewName15: TcxGridColumn;
    GridTableViewName16: TcxGridColumn;
    GridTableViewName17: TcxGridColumn;
    GridTableViewName18: TcxGridColumn;
    GridTableViewName19: TcxGridColumn;
    GridTableViewName20: TcxGridColumn;
    OKButton: TAdvGlowButton;
    CloseButton: TAdvGlowButton;
    SearchButton: TAdvGlowButton;

    procedure FormShow(Sender: TObject);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewDblClick(Sender: TObject);
    procedure GridTableViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridEnter(Sender: TObject);

  public
    SearchText, KindCode, SQLText: string;
    Code : string;
    Names: array of string;
    IsMemberSearch,
    IsAutoSearch: Boolean;
    jsonHelpURL:String;
  end;

var
  HelpForm: THelpForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure THelpForm.FormCreate(Sender: TObject);
begin
  SetLength(Names, GridTableView.ColumnCount-1);
  IsMemberSearch := false;
  IsAutoSearch   := false;
  jsonHelpURL    := '';
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure THelpForm.FormShow(Sender: TObject);
var
  vIndex: Integer;
  vSize : Integer;
begin
  // 칼럼 폭에 맞춰 폼 크기를 조정한다
  vSize := 20;
  for vIndex := 0 to GridTableView.ColumnCount-1 do
    if GridTableView.Columns[vIndex].Visible then
      vSize := vSize + GridTableView.Columns[vIndex].Width;
  if vSize < 430 then
    vSize := 430;
  ClientWidth := vSize + 10;

  // 검색어를 미리 지정했다면 해당 조건에 맞는 내용을 검색한다
  if SearchText <> EmptyStr then
    SearchEdit.Text := SearchText
  else
    SearchEdit.SetFocus;
  if IsAutoSearch then
    SearchButton.Click;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 검색어 입력창에서 키보드를 누를 때
procedure THelpForm.SearchEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : SearchButton.Click;
    VK_Escape : CloseButton.Click;
    VK_Down   : if GridTableView.DataController.RecordCount > 0 then
                  Grid.SetFocus;
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드를 더블클릭할 때
procedure THelpForm.GridTableViewDblClick(Sender: TObject);
begin
  OKButton.Click;
end;
//------------------------------------------------------------------------------
// 그리드에서 키보드를 누를 때
procedure THelpForm.GridTableViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : OKButton.Click;
    VK_Escape : CloseButton.Click;
  end;
end;
//------------------------------------------------------------------------------
// 그리드에 포커스가 들어올 때
procedure THelpForm.GridEnter(Sender: TObject);
begin
  // 그리드에 내용이 있는데 선택된 레코드가 없다면 선택한다
  if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.FocusedRecordIndex < 0) then
    GridTableView.DataController.FocusedRecordIndex := 0;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure THelpForm.SearchButtonClick(Sender: TObject);
var
  vIndex: Integer;
  vSQL  : string;
begin
  try
    Screen.Cursor := crHourGlass;
    // SQL을 지정했다면 해당 SQL로 조회한다
    if SQLText <> EmptyStr then
      DM.OpenQuery(SQLText,
                  [HeadStoreCode,
                   Ifthen(not isMemberSearch or (GetStoreOption(5)='0'),StoreCode,StandardStore),
                   SearchEdit.Text],false,Ifthen(jsonHelpURL='',RestDBURL, jsonHelpURL))
    // SQL을 지정하지 않았다면 공통코드를 조회한다
    else
    begin
      vSQL := EmptyStr;
      for vIndex := 1 to GridTableView.ColumnCount-1 do
        vSQL := vSQL + ' NM_CODE' + IntToStr(vIndex) + IfThen(vIndex < GridTableView.ColumnCount-1, ',', ' ');
      DM.OpenQuery('select   CD_CODE, '
                  +vSQL
                  +'from     MS_CODE '
                  +'where    CD_HEAD   = :P0 '
                  +'  and    CD_STORE  = :P1 '
                  +'  and    CD_KIND   = :P2 '
                  +'  and   (CD_CODE like ConCat(''%'',:P3,''%'') or NM_CODE1 like ConCat(''%'',:P3,''%'')) '
                  +'  and    DS_STATUS = ''0'' '
                  +'order by CD_STORE, CD_CODE',
                   [HeadStoreCode,
                    Ifthen(not isMemberSearch or (GetStoreOption(5)='0'),StoreCode,StandardStore),
                    KindCode,
                    SearchEdit.Text],false,Ifthen(jsonHelpURL='',RestDBURL, jsonHelpURL));
    end;
    GridTableView.BeginUpdate;
    GridTableView.DataController.RecordCount := 0;
    try
      while not DM.Query.Eof do
      begin
        GridTableView.DataController.AppendRecord;
        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewCode.Index] := DM.Query.Fields[0].AsString;
        for vIndex := 1 to GridTableView.ColumnCount-1 do
          if DM.Query.Fields.Count > vIndex then
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := DM.Query.Fields[vIndex].AsString
          else
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := EmptyStr;
        GridTableView.DataController.Post;
        DM.Query.Next;
      end;
    except
    end;
    OKButton.Enabled     := GridTableView.DataController.RecordCount > 0;
    GridTableView.EndUpdate;
    if GridTableView.DataController.RecordCount > 0 then
    begin
      if Showing and Grid.Visible and Grid.Enabled then
        Grid.SetFocus;
      GridTableView.Controller.FocusedRowIndex := 0;
    end;
  finally
    DM.FinishQuery;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
// 확인 버튼
procedure THelpForm.OKButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  if GridTableView.DataController.FocusedRecordIndex >= 0 then
  begin
    Code := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index];
    for vIndex := 1 to GridTableView.ColumnCount-1 do
      if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] <> null then
        Names[vIndex-1] := string(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex])
      else
        Names[vIndex-1] := EmptyStr;
    ModalResult := mrOK;
  end;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure THelpForm.CloseButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
//------------------------------------------------------------------------------
// 발주/매입 요청건 삭제 버튼
end.
