// POS 키보드 기능 관리 (완료)

//##### PLU 등은 비밀번호 입력 안되게 막기
//##### PLU 등록도 한번에

{
  CD_KIND  : 50
  CD_CODE  : 키보드키값 (Shift 입력시 + 1000)
  NM_CODE1 : 키 기능 설명
  NM_CODE2 : 키 기능 코드
  NM_CODE3 : 바탕색 (사용 안 함)
  NM_CODE4 : 글자색 (사용 안 함)
  NM_CODE5 : 비밀번호 입력 1, 비밀번호 미입력 0
  NM_CODE6 : 키보드 종류 (사용 안 함)
  NM_CODE7 : 키 x 좌표
  NM_CODE8 : 키 y 좌표

  Image
    Hint        : #13 앞까지는 키(F1), #13 뒤는 기능(Login)
    Tag         : 키 값 (Shift가 붙었을 경우 + 1000)
    HelpContext : 기능 값
    Stretch     : 암호 입력여부
}

{
  CD_KIND  : 51
  NM_CODE2 : 00 - 결제
             01 - 할인
             03 - 취소
             04 - OK캐쉬백
             05 - T-money
             06 - 회원
             07 - 배달
             08 - 개점/마감
             09 - 상품
             10 - 기타
             70 - 숫자
             80 - PLU
             90 - 객층
}

unit SystemKeyboard;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  Uni, DB, MemDS, AdvGlowButton, StrUtils, Menus, ComCtrls, ImgList,
  cxTreeView, cxSpinEdit, cxStyles, cxContainer, cxEdit, cxTextEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, cxLookAndFeels,
  cxLookAndFeelPainters, DBAccess, cxClasses;

type
  TSystemKeyboardForm = class(TInheritEditForm)
    ConditionToolBarColEdit: TcxSpinEdit;
    ConditionToolBarRowEdit: TcxSpinEdit;
    KeyPanel: TPanel;
    KeyPopupMenu: TPopupMenu;
    KeyPopupMenuPassword: TMenuItem;
    KeyPopupMenuFunctionDelete: TMenuItem;
    FunctionTreeImageList: TImageList;
    FunctionTreeView: TcxTreeView;
    KeyMapSaveButton: TAdvGlowButton;
    KeyMapLoadButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FunctionTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure FunctionTreeViewDblClick(Sender: TObject);
    procedure FunctionTreeViewCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure KeysClick(Sender: TObject);
    procedure KeyPopupMenuPasswordClick(Sender: TObject);
    procedure KeyPopupMenuFunctionDeleteClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure KeyMapSaveButtonClick(Sender: TObject);
    procedure KeyMapLoadButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    Keys       : array of array of TImage;
    SelectedKey: TImage;

    procedure CreateKeys;
    procedure DeleteKeys;
    procedure DrawKey(aKey: TImage; aSelected: Boolean = false);
    procedure SetKey(aKey: TImage; aValue: Integer; aReDraw: Boolean = true);
    function  GetKey(aKey: TImage): Integer;
    function  GetKeyName(aKey: TImage): string;
    procedure SetKeyFunction(aKey: TImage; aFunctionValue: Integer; aFunctionName: string; aReDraw: Boolean = true);
    function  GetKeyFunction(aKey: TImage): Integer;
    function  GetKeyFunctionName(aKey: TImage): string;
    procedure SetKeyPassword(aKey: TImage; aPassword: Boolean; aReDraw: Boolean = true);
    function  GetKeyPassword(aKey: TImage): Boolean;

  protected
    function  DoSearch: Boolean; override;  // 조회
    function  DoSave  : Boolean; override;  // 저장
  end;

var
  SystemKeyboardForm: TSystemKeyboardForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TSystemKeyboardForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vShift: Integer;
begin
  // 선택한 키가 있을 때 입력받은 키값을 키에 표시
  if SelectedKey <> nil then
  begin
    // a..z이고 Shift를 눌렀을 때
    if (ssShift in Shift) and (Key in [$41..$5A]) then
      vShift := 1000
    else
      vShift := 0;

    // 키 값 지정
    SetKey(SelectedKey, Key + vShift);
    Key := 0;
  end;

  //inherited;
end;

procedure TSystemKeyboardForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 기능 목록 트리
//------------------------------------------------------------------------------
// 트리 아이템을 선택할 때
procedure TSystemKeyboardForm.FunctionTreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;

  if Node.Expanded then
    Node.SelectedIndex := Node.ExpandedImageIndex
  else
    Node.SelectedIndex := Node.ImageIndex;
end;
//------------------------------------------------------------------------------
// 트리를 더블클릭할 때
procedure TSystemKeyboardForm.FunctionTreeViewDblClick(Sender: TObject);
var
  vFunctionValue: Integer;
  vFunctionName : string;
  vCode         : PStrPointer;
  vTreeNode     : TTreeNode;
begin
  inherited;

  // 선택된 노드가 있고 자식이 없는 노드라면
  vTreeNode := (Sender as TcxTreeView).Selected;

  // 이미등록된 기능키일때
//  if vTreeNode.ImageIndex = 3 then Exit;

  if vTreeNode = nil then
    Exit;

  if SelectedKey <> nil then
  begin
    // 기존 키에 기능이 지정되어 있었다면 해당 기능을 백업받아 놓는다
    vFunctionValue := GetKeyFunction(SelectedKey);
    vFunctionName  := GetKeyFunctionName(SelectedKey);
    if vFunctionValue < 0 then
    begin
      ShowMsg('고정 키에는 기능을 지정할 수 없습니다.', true);
      Exit;
    end;

    // 새로 선택한 기능 값을 설정한다
    vCode := vTreeNode.Data;
    SetKeyFunction(SelectedKey, StoI(vCode.Data), IfThen(StoI(vCode.Data) = 0, EmptyStr, vTreeNode.Text));
    FunctionTreeViewChange(Sender, vTreeNode);
  end;
end;
//------------------------------------------------------------------------------
// 트리를 그릴 때
procedure TSystemKeyboardForm.FunctionTreeViewCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  inherited;

  // 이미 기능이 반영된 트리는 색깔을 바꾼다
  if not (cdsSelected in State) then
      if (Node.ImageIndex = 2) then
      Sender.Canvas.Font.Color := clWindowText
    else if (Node.ImageIndex = 3) then
      Sender.Canvas.Font.Color := clGray;
end;

//==============================================================================
// 키
//------------------------------------------------------------------------------
// 키 만들기
procedure TSystemKeyboardForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  //키개수 설정부분을 Ensable 시킨다
  ConditionToolBarColEdit.Enabled   := True;
  ConditionToolBarRowEdit.Enabled   := True;
  ButtonToolBarCancelButton.Enabled := False;
end;

procedure TSystemKeyboardForm.CreateKeys;
var
  vCol, vRow, vHeight, vWidth: Integer;
begin
  // 기존 키를 지운다
  DeleteKeys;
  SelectedKey := nil;

  vHeight := (KeyPanel.Height - ConditionToolBarRowEdit.Value * 2 - 2) div ConditionToolBarRowEdit.Value;
  vWidth  := (KeyPanel.Width  - ConditionToolBarColEdit.Value * 2 - 2) div ConditionToolBarColEdit.Value;

  // 키를 만든다
  SetLength(Keys, Integer(ConditionToolBarRowEdit.Value));
  for vRow := Low(Keys) to High(Keys) do
  begin
    SetLength(Keys[vRow], Integer(ConditionToolBarColEdit.Value));
    for vCol := Low(Keys[vRow]) to High(Keys[vRow]) do
    begin
      Keys[vRow, vCol]           := TImage.Create(KeyPanel);
      Keys[vRow, vCol].Parent    := KeyPanel;
      Keys[vRow, vCol].Height    := vHeight;
      Keys[vRow, vCol].Width     := vWidth;
      Keys[vRow, vCol].Top       := (vHeight + 2) * vRow;
      Keys[vRow, vCol].Left      := (vWidth  + 2) * vCol;
      Keys[vRow, vCol].PopupMenu := KeyPopupMenu;
      Keys[vRow, vCol].OnClick   := KeysClick;
      DrawKey(Keys[vRow, vCol]);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 키 지우기
procedure TSystemKeyboardForm.DeleteKeys;
var
  vCol, vRow: Integer;
begin
  if Assigned(Keys) and (Keys <> nil) then
  begin
    for vRow := High(Keys) downto Low(Keys) do
    begin
      for vCol := High(Keys[vRow]) downto Low(Keys[vRow]) do
        Keys[vRow, vCol].Free;
      SetLength(Keys[vRow], 0);
    end;
    SetLength(Keys, 0);
    Keys := nil;
  end;
end;
//------------------------------------------------------------------------------
// 키 그리기
procedure TSystemKeyboardForm.DrawKey(aKey: TImage; aSelected: Boolean);
var
  vRect: TRect;
begin
  // 바탕 그리기
  if aSelected then
  begin
    if GetKeyFunction(aKey) < 0 then
      aKey.Canvas.Brush.Color := $00E0E0E0
    else
      aKey.Canvas.Brush.Color := $0080FFFF;
    aKey.Canvas.FillRect(Rect(1, 1, aKey.Width-1, aKey.Height-1));
    aKey.Canvas.Pen.Color := clRed;
    aKey.Canvas.Pen.Width := 2;
    aKey.Canvas.Rectangle(1, 1, aKey.Width, aKey.Height);
  end
  else
  begin
    if GetKeyFunction(aKey) < 0 then
      aKey.Canvas.Brush.Color := $00E0E0E0
    else
      aKey.Canvas.Brush.Color := clWindow;
    aKey.Canvas.FillRect(Rect(1, 1, aKey.Width-1, aKey.Height-1));
    aKey.Canvas.Pen.Color := clGray;
    aKey.Canvas.Pen.Width := 1;
    aKey.Canvas.Rectangle(0, 0, aKey.Width, aKey.Height);
  end;
  // 글씨 쓰기
  if aKey.Hint <> EmptyStr then
  begin
    // 키
    aKey.Canvas.Font.Assign(self.Font);
    aKey.Canvas.Font.Size    := 10;
    aKey.Canvas.Font.Color   := $00FF8000;
    aKey.Canvas.Font.Style   := [fsBold];
    aKey.Canvas.TextRect(Rect(5, 5, aKey.Width-5, 30), 5, 5, GetKeyName(aKey));
    // 기능
    aKey.Canvas.Font.Size    := 9;
    aKey.Canvas.Font.Color   := clBlack;
    if aKey.Stretch then
      aKey.Canvas.Font.Style := [fsBold, fsItalic]
    else
      aKey.Canvas.Font.Style := [];
    vRect := Rect(5, 25, aKey.Width-5, aKey.Height-5);
    DrawText(aKey.Canvas.Handle,
             PChar(GetKeyFunctionName(aKey)),
             Length(GetKeyFunctionName(aKey)),
             vRect,
             DT_WORDBREAK+DT_NOPREFIX);
  end;
end;
//------------------------------------------------------------------------------
// 키를 선택할 때
procedure TSystemKeyboardForm.KeysClick(Sender: TObject);
begin
  inherited;

  if Sender is TImage then
  begin
    // 기존 키 선택 해제
    if SelectedKey <> nil then
      DrawKey(SelectedKey);
    // 지금 선택한 키 새로 그리기
    SelectedKey := TImage(Sender);
    DrawKey(SelectedKey, true);

    // 키 값이 지정되지 않았으면 메시지 표시
    if GetKey(SelectedKey) = 0 then
      ShowMsg('해당 위치의 키보드를 눌러 키 값을 지정하십시오.')
    else
      ShowMsg('왼쪽 목록에서 원하는 기능을 더블클릭해 주십시오.');
  end;
end;
//------------------------------------------------------------------------------
// 키값 세팅
procedure TSystemKeyboardForm.SetKey(aKey: TImage; aValue: Integer; aReDraw: Boolean);
label
  exit_loop;
var
  vRow, vCol: Integer;
  vKey      : Integer;
  vName     : string;
  vShift,
  vFixed,
  vFind     : Boolean;
begin
  if aKey <> nil then
  begin
    if aValue < 1000 then
    begin
      vKey   := aValue;
      vShift := false;
    end
    else
    begin
      vKey   := aValue - 1000;
      vShift := true;
    end;

    // 새로 입력받은 키가 무슨 키인지 알아보기 쉽게 지정한다
    vFixed := false;
    case vKey of
      VK_BACK :
      begin
        vName  := 'BS(←)';
        vFixed := true;
      end;
      VK_RETURN :
      begin
        vName  := 'Enter';
        vFixed := true;
      end;
      VK_ESCAPE :
      begin
        vName  := 'Esc';
        vFixed := true;
      end;
      VK_SPACE :
        vName  := 'Space';
      VK_PRIOR :
        vName  := 'PageUp';
      VK_NEXT :
        vName  := 'PageDn';
      VK_END :
        vName  := 'End';
      VK_HOME :
        vName  := 'Home';
      VK_LEFT :
      begin
        vName  := '←';
        vFixed := true;
      end;
      VK_UP :
      begin
        vName  := '↑';
        vFixed := true;
      end;
      VK_RIGHT :
      begin
        vName  := '→';
        vFixed := true;
      end;
      VK_DOWN :
      begin
        vName  := '↓';
        vFixed := true;
      end;
      VK_INSERT :
        vName  := 'Insert';
      VK_DELETE :
        vName  := 'Delete';
      VK_LWIN,
      VK_RWIN :
      begin
        vName  := 'Windows';
        vFixed := true;
      end;
      VK_NUMPAD0..VK_NUMPAD9 :
        vName  := 'Num '+IntToStr(vKey-$60);
      VK_MULTIPLY :
        vName  := 'Num *';
      VK_ADD :
        vName  := 'Num +';
      VK_SUBTRACT :
        vName  := 'Num -';
      VK_DECIMAL :
        vName  := 'Num .';
      VK_DIVIDE :
        vName  := 'Num /';
      VK_F1 :
        vName  := 'F1';
      VK_F2 :
        vName  := 'F2';
      VK_F3 :
        vName  := 'F3';
      VK_F4 :
        vName  := 'F4';
      VK_F5 :
        vName  := 'F5';
      VK_F6 :
        vName  := 'F6';
      VK_F7 :
        vName  := 'F7';
      VK_F8 :
        vName  := 'F8';
      VK_F9 :
        vName  := 'F9';
      VK_F10 :
        vName  := 'F10';
      VK_F11 :
        vName  := 'F11';
      VK_F12 :
        vName  := 'F12';
      $30..$39 : // Number
      begin
        vName  := Chr(vKey); //IntToStr(vKey-$30);
        vFixed := true;
      end;
      $41..$5A : // a..z
        vName  := Chr(vKey);
      $BC :
        vName  := ', (<)';
      $BD :
        vName  := '- (_)';
      $BE :
        vName  := '. (>)';
      $BF :
        vName  := '/ (?)';
      $C0 :
        vName  := '` (~)';
      $DB :
        vName  := '[ ({)';
      $DC :
        vName  := '\ (|)';
      $DD :
        vName  := '] (})';
      $DE :  //
        vName  := ''' (")';
      0 : // 기능 없음
        vName  := EmptyStr;
      else
      begin
        if not (vKey in [VK_SHIFT, VK_CONTROL, VK_MENU]) then
          ShowMsg('사용할 수 없는 키입니다.['+IntToStr(vKey)+']', true);
        Exit;
      end;
    end;

    // 기존에 같은 키로 세팅되어 있는 키가 있다면 지운다
    if aValue <> 0 then
      for vRow := Low(Keys) to High(Keys) do
        for vCol := Low(Keys[vRow]) to High(Keys[vRow]) do
          if GetKey(Keys[vRow, vCol]) = aValue then
            SetKey(Keys[vRow, vCol], 0);

    // 고정키이면 기능을 주지 못하게 막는다
    if vFixed then
      SetKeyFunction(aKey, -1, '(고정)', not aReDraw)
    else if GetKeyFunction(aKey) < 0 then
      SetKeyFunction(aKey, 0, EmptyStr, not aReDraw);

    // 새로 입력받은 값을 세팅한다
    aKey.Tag  := aValue;
    aKey.Hint := IfThen(vShift, 'Shift-', EmptyStr) + vName +#13+ GetKeyFunctionName(aKey);
    if aReDraw then
      DrawKey(aKey, aKey = SelectedKey);

    // 자동으로 다음 키로 넘어간다
    if aValue <> 0 then
    begin
      vFind := false;
      for vRow := Low(Keys) to High(Keys) do
        for vCol := Low(Keys[vRow]) to High(Keys[vRow]) do
          if vFind then
          begin
            KeysClick(Keys[vRow, vCol]);
            goto exit_loop;
          end
          else if aKey = Keys[vRow, vCol] then
            vFind := true;
      exit_loop:;
    end;

    if not isChanged then
      isChanged := true;
  end;
end;
//------------------------------------------------------------------------------
// 키값 구하기(A일 경우 65, Shift-A일 경우 1065 등)
function TSystemKeyboardForm.GetKey(aKey: TImage): Integer;
begin
  Result := aKey.Tag;
end;
//------------------------------------------------------------------------------
// 키이름 구하기(A, Shift-A 등)
function TSystemKeyboardForm.GetKeyName(aKey: TImage): string;
var
  vPos: Integer;
begin
  vPos := Pos(#13, aKey.Hint);
  if vPos > 0 then
    Result := Copy(aKey.Hint, 1, vPos-1)
  else
    Result := '';
end;
//------------------------------------------------------------------------------
// 키 기능값 세팅
procedure TSystemKeyboardForm.SetKeyFunction(aKey: TImage; aFunctionValue: Integer; aFunctionName: string; aReDraw: Boolean);
label
  exit_loop;
var
  vRow, vCol: Integer;
  vFind     : Boolean;
  vCode     : PStrPointer;
  vTreeNode : TTreeNode;
begin
  if aKey <> nil then
  begin
    // 기능 트리에 기존 기능을 다시 쓸 수 있다는 표시를 한다
    for vRow := 0 to FunctionTreeView.Items.Count-1 do
    begin
      vTreeNode := FunctionTreeView.Items[vRow].GetFirstChild;
      while vTreeNode <> nil do
      begin
        vCode := vTreeNode.Data;
        if StoI(vCode.Data) = aKey.HelpContext then
          vTreeNode.ImageIndex := 2;
        vTreeNode := FunctionTreeView.Items[vRow].GetNextChild(vTreeNode);
      end;
    end;

    // 새 기능을 반영한다
    aKey.HelpContext := aFunctionValue;
    aKey.Hint        := GetKeyName(aKey) +#13+ aFunctionName;
    SetKeyPassword(aKey, false, not aReDraw);
    if aReDraw then
      DrawKey(aKey, aKey = SelectedKey);

    // 자동으로 다음 키로 넘어간다
    vFind := false;
    for vRow := Low(Keys) to High(Keys) do
      for vCol := Low(Keys[vRow]) to High(Keys[vRow]) do
        if vFind and (GetKey(Keys[vRow, vCol]) > 0) and (GetKeyFunction(Keys[vRow, vCol]) >= 0) then
        begin
          KeysClick(Keys[vRow, vCol]);
          goto exit_loop;
        end
        else if aKey = Keys[vRow, vCol] then
          vFind := true;
    exit_loop:;


    // 기능 트리에 해당 키가 이미 반영되었다는 표시를 한다
    for vRow := 0 to FunctionTreeView.Items.Count-1 do
    begin
      vTreeNode := FunctionTreeView.Items[vRow].GetFirstChild;
      while vTreeNode <> nil do
      begin
        vCode := vTreeNode.Data;
        if StoI(vCode.Data) = aFunctionValue then
          vTreeNode.ImageIndex := 3;
        vTreeNode := FunctionTreeView.Items[vRow].GetNextChild(vTreeNode);
      end;
    end;


    if not isChanged then
      isChanged := true;
  end;
end;
//------------------------------------------------------------------------------
// 키 기능값 구하기(단축키일 경우 901 등)
function TSystemKeyboardForm.GetKeyFunction(aKey: TImage): Integer;
begin
  Result := aKey.HelpContext;
end;
//------------------------------------------------------------------------------
// 키 기능이름 구하기(단축키, 준비금 입력 등)
function TSystemKeyboardForm.GetKeyFunctionName(aKey: TImage): string;
var
  vPos: Integer;
begin
  vPos := Pos(#13, aKey.Hint);
  if vPos > 0 then
    Result := Copy(aKey.Hint, vPos+1, Length(aKey.Hint))
  else
    Result := '';
end;
//------------------------------------------------------------------------------
// 암호 입력여부 설정
procedure TSystemKeyboardForm.SetKeyPassword(aKey: TImage; aPassword: Boolean; aReDraw: Boolean);
begin
  aKey.Stretch := aPassword;

  if aReDraw then
    DrawKey(aKey, aKey = SelectedKey);

  if not isChanged then
    isChanged := true;
end;
//------------------------------------------------------------------------------
// 암호 입력여부 읽어오기
function TSystemKeyboardForm.GetKeyPassword(aKey: TImage): Boolean;
begin
  Result := aKey.Stretch;
end;
//------------------------------------------------------------------------------
// 비밀번호 확인 팝업 메뉴
procedure TSystemKeyboardForm.KeyPopupMenuPasswordClick(Sender: TObject);
begin
  inherited;

  if KeyPopupMenu.PopupComponent is TImage then
  begin
    KeysClick(TImage(KeyPopupMenu.PopupComponent));
    SetKeyPassword(TImage(KeyPopupMenu.PopupComponent), not GetKeyPassword(TImage(KeyPopupMenu.PopupComponent)));
  end;
end;
procedure TSystemKeyboardForm.KeyMapLoadButtonClick(Sender: TObject);
var
  vFileName: String;
  vStringList :TStringList;
  vIndex, vCol :Integer;
begin
  inherited;
  if not FileExists(ExtractFilePath(Application.ExeName)+dirDLL+filKeyMap) then
  begin
    ErrBox(ExtractFilePath(Application.ExeName)+dirDLL+filKeyMap+' 파일이 없습니다.');
    Exit;
  end;
  vFileName   := ExtractFilePath(Application.ExeName)+dirDLL+filKeyMap;
  vStringList := TStringList.Create;
  try
    vStringList.LoadFromFile(vFileName);
    try
      BeginTrans;
      ExecQuery('delete from MS_CODE where CD_STORE =:P0 and CD_KIND = ''50'' ',
                [StoreCode],
                false);

      Query.Close;
      Query.SQL.Text := 'insert into MS_CODE (CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, DS_STATUS) '
                          +'             values ('''+StoreCode+''', :P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10 )';

      for vIndex := 0 to vStringList.Count - 1 do
      begin
        for vCol := 0 to 10 do
          Query.Params[vCol].Value := CopyPos(vStringList.Strings[vIndex], #28, vCol+1);
        Query.Execute;
      end;
      CommitTrans;
      MsgBox('키맵 불러오기가 정상 처리되었습니다.');
    except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
    end;
  finally
    vStringList.Free;
  end;

end;

procedure TSystemKeyboardForm.KeyMapSaveButtonClick(Sender: TObject);
var
  vFileName,
  vData: String;
  vCol     : Integer;
begin
  inherited;
  vFileName := ExtractFilePath(Application.ExeName)+dirDLL+filKeyMap;

  if FileExists(vFileName) then DeleteFile(vFileName);

  // 파일 불러오기
  with TStringList.Create do
    try
      if FileExists(vFileName) then
        LoadFromFile(vFileName);

      try
        OpenQuery('select CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, DS_STATUS '
                 +'  from MS_CODE '
                 +' where CD_STORE = :P0 '
                 +'   and CD_KIND  = ''50'' ',
                 [StoreCode]);
        while not Query.Eof do
        begin
          vData := EmptyStr;
          for vCol := 0 to Query.FieldCount -1  do
             vData := vData + #28+Query.Fields[vCol].AsString;
          Add(vData+#28);
          Query.Next;
        end;
        SaveToFile(vFileName);
        MsgBox(vFileName+' 파일로 저장되었습니다.');
      finally
        FinishQuery;
      end;
    finally
      Free;
    end; // try .. finally ..
end;
//------------------------------------------------------------------------------
// 기능 지우기 팝업 메뉴
procedure TSystemKeyboardForm.KeyPopupMenuFunctionDeleteClick(Sender: TObject);
var
  vFunctionValue: Integer;
  vFunctionName : string;
begin
  inherited;

  if KeyPopupMenu.PopupComponent is TImage then
  begin
    // 키 선택
    KeysClick(TImage(KeyPopupMenu.PopupComponent));

    if SelectedKey <> nil then
    begin
      // 기존 키에 기능이 지정되어 있었다면 해당 기능을 백업받아 놓는다
      vFunctionValue := GetKeyFunction(SelectedKey);
      vFunctionName  := GetKeyFunctionName(SelectedKey);
      if vFunctionValue <= 0 then
        Exit;

      // 기능 삭제
      SetKeyFunction(TImage(KeyPopupMenu.PopupComponent), 0, EmptyStr);
      // 키 다시 선택
      KeysClick(TImage(KeyPopupMenu.PopupComponent));

      // 기존 기능을 목록에 넣는다
//      New(vCode);
//      vCode^.Data := IntToStr(vFunctionValue);
//      GetUsableFunctionList(IntToStr(vFunctionValue)).Items.AddObject(vFunctionName, TObject(vCode));
    end;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSystemKeyboardForm.DoSearch: Boolean;
const
  FunctionType: array[0..12, 0..1] of string = (
                  ('00', '결제'),
                  ('01', '할인'),
                  ('03', '취소'),
                  ('06', '회원'),
                  ('07', '배달'),
                  ('08', '개점/마감'),
                  ('09', '상품'),
                  ('04', 'OK캐쉬백'),
                  ('05', 'T-money'),
                  ('10', '기타'),
                  ('70', '숫자'),
                  ('80', 'PLU'),
                  ('90', '객층')
                );
var
  vIndex   : Integer;
  vCode    : PStrPointer;
  vTreeNode: TTreeNode;
begin
  Result := false;

  // 기능 트리의 내용을 불러온다
  FunctionTreeView.Items.Clear;
  // 분류
  for vIndex := 0 to High(FunctionType) do
  begin
    New(vCode);
    vCode^.Data                  := FunctionType[vIndex, 0];
    vTreeNode                    := FunctionTreeView.Items.AddObject(nil, FunctionType[vIndex,1], vCode);
    vTreeNode.ImageIndex         := 0;
    vTreeNode.ExpandedImageIndex := 1;
    vTreeNode.HasChildren        := true;
  end;
  // 기능
  OpenQuery('select   CD_CODE, '
           +'         NM_CODE1, '
           +'         NM_CODE2 '
           +'from     MS_CODE '
           +'where    CD_STORE  = :P0 '
           +'  and    CD_KIND   = ''51'' '
           +Ifthen(ProgramName <> pnERP, ' and CD_CODE not in(''510'',''511'',''403'',''401'') ', '')
           +Ifthen(ProgramName <> pnThemePark, ' and CD_CODE not in(''390'') ', '')
           +'  and    DS_STATUS = ''0'' '
           +'order by NM_CODE1',
            [StoreCode]);
  try
    while not Query.Eof do
    begin
      // 부모 노드를 찾는다
      for vIndex := 0 to FunctionTreeView.Items.Count-1 do
      begin
        vCode := FunctionTreeView.Items.Item[vIndex].Data;
        if vCode.Data = Query.Fields[2].AsString then
        begin
          // 부모 노드 아래에 기능을 넣는다
          New(vCode);
          vCode^.Data                  := Query.Fields[0].AsString;
          vTreeNode                    := FunctionTreeView.Items.AddChildObject(FunctionTreeView.Items.Item[vIndex], Query.Fields[1].AsString, vCode);
          vTreeNode.ImageIndex         := 2;
          vTreeNode.ExpandedImageIndex := 2;
          vTreeNode.HasChildren        := False;
        end;
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;


  // 버튼을 새로 그린다
  CreateKeys;

  // DB에서 기존 값을 불러와 버튼에 표시한다
  OpenQuery('select   CD_CODE, '
           +'         NM_CODE1, '
           +'         NM_CODE2, '
           +'         NM_CODE5, '
           +'         NM_CODE7, '
           +'         NM_CODE8 '
           +'from     MS_CODE '
           +'where    CD_STORE = :P0 '
           +'  and    CD_KIND  = ''50'' '
           +'  and    NM_CODE7 is not null '
           +'  and    NM_CODE8 is not null '
           +'order by CD_STORE, CD_KIND, NM_CODE7, NM_CODE8, CD_CODE',
            [StoreCode]);
  try
    if Query.Eof then
      Exit;
    while not Query.Eof do
    begin
      if (StoI(Query.Fields[4].AsString) < ConditionToolBarRowEdit.Value) and (StoI(Query.Fields[5].AsString) < ConditionToolBarColEdit.Value) then
      begin
        // 기능 지정
        SetKeyFunction(Keys[StoI(Query.Fields[4].AsString), StoI(Query.Fields[5].AsString)], StoI(Query.Fields[2].AsString), Query.Fields[1].AsString, false);
        // 비밀번호 지정
        if Query.Fields[3].AsString = '1' then
          SetKeyPassword(Keys[StoI(Query.Fields[4].AsString), StoI(Query.Fields[5].AsString)], true, false);
        // 키 값 지정
        SetKey(Keys[StoI(Query.Fields[4].AsString), StoI(Query.Fields[5].AsString)], StoI(Query.Fields[0].AsString));
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  // 첫번째 키를 선택한다
  KeysClick(Keys[0, 0]);
//KeyPanel.SetFocus;
  //키개수 설정부분을 Disable 시킨다
  ConditionToolBarColEdit.Enabled   := False;
  ConditionToolBarRowEdit.Enabled   := False;
  ButtonToolBarCancelButton.Enabled := True;
  KeyMapSaveButton.Enabled          := true;
  KeyMapLoadButton.Enabled          := true;
  Result := true;
end;
//------------------------------------------------------------------------------
// 저장
function TSystemKeyboardForm.DoSave: Boolean;
var
  vRow, vCol: Integer;
begin
  Result := false;

  // 기능은 지정되어 있으나 키가 지정되지 않은 값이 있는지 확인한다
  for vRow := Low(Keys) to High(Keys) do
    for vCol := Low(Keys[vRow]) to High(Keys[vRow]) do
      if (GetKey(Keys[vRow, vCol]) = 0) and (GetKeyFunction(Keys[vRow, vCol]) > 0) then
      begin
        ErrBox('기능은 지정되었으나 키 값이 지정되지 않은 키가 있습니다.');
        KeysClick(Keys[vRow, vCol]);
        Exit;
      end;

  // 저장
  try
    BeginTrans;

    // 기존 자료를 모두 지운다
    Result := ExecQuery('delete from MS_CODE '
                       +'where  CD_STORE = :P0 '
                       +'  and  CD_KIND  = ''50''',
                        [StoreCode],
                         false);

    // 새로 입력한 값을 저장한다
    for vRow := Low(Keys) to High(Keys) do
      for vCol := Low(Keys[vRow]) to High(Keys[vRow]) do
        if (GetKey(Keys[vRow, vCol]) > 0) then
          Result := ExecQuery('insert into MS_CODE '
                             +'( '
                             +'  CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE5, NM_CODE7, NM_CODE8, DS_STATUS, CD_SAWON_CHG, DT_CHANGE, DS_TRANS '
                             +') values ( '
                             +'  :P0, ''50'', :P1, :P2, :P3, :P4, :P5, :P6, ''0'', :P7, GetDate(), 0 '
                             +')',
                              [StoreCode,
                               FormatFloat('0000', GetKey(Keys[vRow, vCol])),
                               GetKeyFunctionName(Keys[vRow, vCol]),
                               IntToStr(GetKeyFunction(Keys[vRow, vCol])),
                               IfThen(GetKeyPassword(Keys[vRow, vCol]), '1', '0'),
                               IntToStr(vRow),
                               IntToStr(vCol),
                               UserCode],
                               false);
    CommitTrans;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;

end.
