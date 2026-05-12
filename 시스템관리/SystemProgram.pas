// 프로그램 권한설정 (완료)

unit SystemProgram;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxControls, Math,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  StdCtrls, ExtCtrls, cxButtonEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvToolBar, AdvSplitter, ComCtrls, jpeg, ImgList,
  cxTreeView, AdvToolBarStylers, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, DBAccess,
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, StrUtils,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  cxGroupBox;

type
  // 트리테이터
  TTreeData = record
    Code   : string;
    Auth   : string;
    Node   : TTreeNode;
  end;

type
  TSystemProgramForm = class(TInheritGridEditForm)
    MainTitleLabel: TLabel;
    ProgramTreeView: TcxTreeView;
    ProgramCheckBoxImageList: TImageList;
    MainTitleImage: TImage;
    GridTableViewUserCode: TcxGridColumn;
    GridTableViewUserName: TcxGridColumn;
    PopupMenu: TPopupMenu;
    AppendPopupMenu: TMenuItem;
    EditPopupMenu: TMenuItem;
    DeletePopupMenu: TMenuItem;
    PrintPopupMenu: TMenuItem;
    GridTableViewGradCode: TcxGridColumn;
    SelectAllButton: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure SelectAllButtonClick(Sender: TObject);
    procedure ProgramTreeViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ProgramTreeViewKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure AppendPopupMenuClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure ProgramTreeViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ProgramTreeViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    isCheck: Boolean;
    TreeData     :TList;
    mouseX,
    mouseY :Integer;
    PopupTreeNode: TTreeNode;
    procedure GetDefaultMenuList;
    procedure ChangeProgramTreeViewCheck(aTreeNode: TTreeNode);

  protected
    procedure DoGridLink; override;
    function  DoSave: Boolean; override;
  end;

var
  SystemProgramForm: TSystemProgramForm;



implementation

uses
  Common, DBModule, Main, ProxyCheck;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSystemProgramForm.FormCreate(Sender: TObject);
begin
  inherited;
  TreeData := TList.Create;

end;

procedure TSystemProgramForm.FormShow(Sender: TObject);
begin
  inherited;
  // 마스터만 사용 가능
  if UserGrade = userGradeMaster then
    try
      OpenQuery('select   CD_CODE, '
               +'         NM_CODE1 '
               +'  from   MS_CODE '
               +' where   CD_HEAD  =:P0 '
               +'   and   CD_STORE =:P1 '
               +'   and   CD_KIND = ''17'''
               +'order by CD_CODE ',
               [HeadStoreCode,
                StoreCode]);
      DM.ReadQuery(Query, GridTableView);
      if GridTableView.DataController.RecordCount > 0 then
        GridTableView.DataController.FocusedRecordIndex := 0;

      GetDefaultMenuList;
      DoGridLink;
      isCheck := False;
    finally
      FinishQuery;
      Grid.Enabled      := true;
      MainPanel.Enabled := true;
    end
  else
    ErrBox('프로그램 사용 권한이 없습니다.');
end;

//==============================================================================
// 트리
//------------------------------------------------------------------------------
// 전체 선택 버튼
procedure TSystemProgramForm.SelectAllButtonClick(Sender: TObject);
var
  vIndex, vSubIndex :Integer;
begin
  inherited;

  isCheck := not isCheck;
  if isCheck then
    SelectAllButton.Caption := '전체해제'
  else
    SelectAllButton.Caption := '전체선택';
  for vIndex := 0 to ProgramTreeView.Items.Count-1 do
  begin
    ProgramTreeView.Items[vIndex].StateIndex := IfThen(isCheck, 2, 1);
    for vSubIndex := 0 to ProgramTreeView.Items[vIndex].Count-1 do
    begin
      ProgramTreeView.Items[vIndex].Item[vSubIndex].StateIndex := IfThen(isCheck, 2, 1);

      if ProgramTreeView.Items[vIndex].StateIndex = 2 then
        ProgramTreeView.Items[vIndex].Item[vSubIndex].SelectedIndex := 15
      else
        ProgramTreeView.Items[vIndex].Item[vSubIndex].SelectedIndex := 0;
    end;
  end;
  if Sender <> nil then
    isChanged := true;
end;
//------------------------------------------------------------------------------
// 트리에서 마우스를 누를 때
procedure TSystemProgramForm.ProgramTreeViewMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  vTreeNode: TTreeNode;
begin
  inherited;
  PopupMenu.CloseMenu;

  vTreeNode     := ProgramTreeView.GetNodeAt(X, Y);
  if Assigned(vTreeNode) and (vTreeNode.Parent <> nil) then
  begin
    PopupTreeNode := vTreeNode;
    ProgramTreeView.PopupMenu := PopupMenu;
  end
  else
  begin
    PopupTreeNode := nil;
    ProgramTreeView.PopupMenu := nil;
  end;

  if Assigned(vTreeNode) and
     (((vTreeNode.Parent =  nil) and (X in [27..40])) or ((vTreeNode.Parent <> nil) and (X in [49..62]))) then
  begin
    vTreeNode.StateIndex := IfThen((vTreeNode.StateIndex = 1) or (vTreeNode.StateIndex = 3), 2, 1);
    if vTreeNode.StateIndex = 2 then
      vTreeNode.SelectedIndex := 15
    else
      vTreeNode.SelectedIndex := 0;
    ChangeProgramTreeViewCheck(vTreeNode);
  end;
end;
procedure TSystemProgramForm.ProgramTreeViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  vTreeNode: TTreeNode;
begin
  inherited;
  if Sender is TcxTreeView then
  begin
    vTreeNode     := ProgramTreeView.GetNodeAt(X, Y);
    if Assigned(vTreeNode) and (vTreeNode.Parent <> nil) then
      ProgramTreeView.PopupMenu := PopupMenu
    else
      ProgramTreeView.PopupMenu := nil;
  end
  else
    ProgramTreeView.PopupMenu := nil;
end;

procedure TSystemProgramForm.ProgramTreeViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ProgramTreeView.Select ( ProgramTreeView.Selected );
end;

//------------------------------------------------------------------------------
// 트리에서 키보드를 누를 때
procedure TSystemProgramForm.PopupMenuPopup(Sender: TObject);
var vTemp :String;
begin
  inherited;
  if Assigned(ProgramTreeView.Selected) and (ProgramTreeView.Selected.Parent <> nil) then
  begin
    vTemp := SetProgramAuth(ProgramTreeView.Selected.SelectedIndex);
    AppendPopupMenu.Checked := vTemp[4]='1';
    EditPopupMenu.Checked   := vTemp[3]='1';
    DeletePopupMenu.Checked := vTemp[2]='1';
    PrintPopupMenu.Checked  := vTemp[1]='1';
  end;
end;

procedure TSystemProgramForm.ProgramTreeViewKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (ProgramTreeView.Selected <> nil) and (Key = ' ') then
  begin
    ProgramTreeView.Selected.StateIndex := IfThen((ProgramTreeView.Selected.StateIndex = 1) or (ProgramTreeView.Selected.StateIndex = 3), 2, 1);
    ChangeProgramTreeViewCheck(ProgramTreeView.Selected);
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 메뉴 목록을 트리에 불러오기
procedure TSystemProgramForm.GetDefaultMenuList;
  function GetSubItemCount(aIndex:Integer):Integer;
  var vIndex : Integer;
  begin
    Result := 0;
    for vIndex := ExtremeMainForm.RibbonPreviewMenu.MenuItems[aIndex].SubItems.Count-1 downto 0 do
      if ExtremeMainForm.RibbonPreviewMenu.MenuItems[aIndex].SubItems.Items[vIndex].Visible then
        Result := Result + 1;
  end;
var
  vIndex, vSubIndex: Integer;
  vTreeNode, vSubTreeNode: TTreeNode;
  vProgramName: PStrPointer;
begin
  ProgramTreeView.Items.Clear;

  // 프로그램 그룹을 트리에 넣는다
  for vIndex := 0 to ExtremeMainForm.RibbonPreviewMenu.MenuItems.Count-1 do
  begin
    if not ExtremeMainForm.RibbonPreviewMenu.MenuItems[vIndex].Visible then Continue;

    vTreeNode := ProgramTreeView.Items.Add(nil, ExtremeMainForm.RibbonPreviewMenu.MenuItems[vIndex].Caption);
    vTreeNode.StateIndex := 1;

    // 프로그램을 트리에 넣는다
    for vSubIndex := 0 to ExtremeMainForm.RibbonPreviewMenu.MenuItems[vIndex].SubItems.Count-1 do
    begin
      if not ExtremeMainForm.RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vSubIndex].Visible then Continue;

      New(vProgramName);
      vProgramName^.Data      := ExtremeMainForm.RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vSubIndex].ShortCutHint;
      vSubTreeNode            := ProgramTreeView.Items.AddChildObject(vTreeNode, Trim(ExtremeMainForm.RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vSubIndex].Title), vProgramName);
      vSubTreeNode.StateIndex := 1;
    end;
  end;
end;


procedure TSystemProgramForm.GridTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 프로그램 트리 체크를 변경했을 때 처리
procedure TSystemProgramForm.AppendPopupMenuClick(Sender: TObject);
var vTemp :String;
begin
  inherited;
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  vTemp := '0000';
  if AppendPopupMenu.Checked then vTemp[4] :='1';
  if EditPopupMenu.Checked   then vTemp[3] :='1';
  if DeletePopupMenu.Checked then vTemp[2] :='1';
  if PrintPopupMenu.Checked  then vTemp[1] :='1';

  PopupTreeNode.SelectedIndex := 0;
  if vTemp[4] = '1' then
    PopupTreeNode.SelectedIndex := 1;
  if vTemp[3] = '1' then
    PopupTreeNode.SelectedIndex := PopupTreeNode.SelectedIndex + 2;
  if vTemp[2] = '1' then
    PopupTreeNode.SelectedIndex := PopupTreeNode.SelectedIndex + 4;
  if vTemp[1] = '1' then
    PopupTreeNode.SelectedIndex := PopupTreeNode.SelectedIndex + 8;
  isChanged := true;
  ProgramTreeView.PopupMenu := PopupMenu;
end;

procedure TSystemProgramForm.ChangeProgramTreeViewCheck(aTreeNode: TTreeNode);
var
  vIndex, vIndex2: Integer;
  vTemp: Boolean;
begin
  // 프로그램 그룹일 때 하위 노드를 모두 선택/취소한다
  if aTreeNode.Parent = nil then
  begin
    for vIndex := 0 to aTreeNode.Count-1 do
    begin
      aTreeNode.Item[vIndex].StateIndex := aTreeNode.StateIndex;
      if aTreeNode.StateIndex = 2 then
        aTreeNode.Item[vIndex].SelectedIndex := 15
      else
        aTreeNode.Item[vIndex].SelectedIndex := 0;
    end;
  end
  // 프로그램일 때 상위 노드를 전체 선택/취소하거나 그레이로 바꾼다
  else
  begin
    vTemp := false;
    for vIndex := 0 to aTreeNode.Parent.Count-1 do
      if aTreeNode.Parent.Item[vIndex].StateIndex <> aTreeNode.StateIndex then
      begin
        vTemp := true;
        Break;
      end;
    aTreeNode.Parent.StateIndex := IfThen(vTemp, 3, aTreeNode.StateIndex);
    aTreeNode.Parent.SelectedIndex := 15;
  end;
  isChanged := true;

end;
//------------------------------------------------------------------------------
// 저장
function TSystemProgramForm.DoSave: Boolean;
  function GetTreeNodeAuth(aCode: string): String;
  var
    vIndex, vSubIndex: Integer;
  begin
    Result := '';
    for vIndex := 0 to TreeData.Count-1 do
    begin
      if TTreeData(TreeData.Items[vIndex]^).Code = aCode then
      begin
        Result :=  TTreeData(TreeData.Items[vIndex]^).Auth;
        Break;
      end;
    end;
  end;
var
  vIndex, vSubIndex: Integer;
  vProgramName: PStrPointer;
  vSQL :String;
begin
  Result := false;
  if LeftStr(StoreCode,2) <> 'TT' then
    with TProxyCheckForm.Create(self) do
      try
        if ShowModal <> mrOK then
          Exit;
      finally
        Free;
      end;

  try
    //마스터 일때는 전체를 지우지 않는다
    if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserCode.Index] = userGradeMaster) then
    begin
      vSQL := '';
      for vIndex := 0 to ProgramTreeView.Items.Count-1 do
        for vSubIndex := 0 to ProgramTreeView.Items[vIndex].Count-1 do
        begin
          vProgramName := ProgramTreeView.Items[vIndex].Item[vSubIndex].Data;

          if GetTreeNodeAuth(vProgramName^.Data) = IntToStr(ProgramTreeView.Items[vIndex].Item[vSubIndex].SelectedIndex) then
            Continue;

          vSQL := vSQL + Format('update MS_PRG_MENU '
                               +'   set DS_AUTHORITY =%d '
                               +' where CD_HEAD  =''%s'' '
                               +'   and CD_STORE =''%s'' '
                               +'   and CD_CODE  =''%s'' '
                               +'   and ACT_CODE =''%s'';',
                               [ProgramTreeView.Items[vIndex].Item[vSubIndex].SelectedIndex,
                                HeadStoreCode,
                                StoreCode,
                                GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserCode.Index],
                                vProgramName^.Data]);
        end;
        if vSQL = '' then
          Result := true
        else
          Result := ExecQuery(vSQL,[],true);
    end
    else
    begin
      // 기저장된 목록 삭제
      ExecQuery('delete from MS_PRG_MENU '
               +' where  CD_HEAD  = :P0 '
               +'   and  CD_STORE = :P1 '
               +'   and  CD_CODE  = :P2;',
                [HeadStoreCode,
                 StoreCode,
                 GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserCode.Index]],
                 false);

      vSQL := '';
      for vIndex := 0 to ProgramTreeView.Items.Count-1 do
        for vSubIndex := 0 to ProgramTreeView.Items[vIndex].Count-1 do
        begin
          if ProgramTreeView.Items[vIndex].Item[vSubIndex].StateIndex <> 2 then
            Continue;
          vProgramName := ProgramTreeView.Items[vIndex].Item[vSubIndex].Data;
          vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'', %d),',
                               [HeadStoreCode,
                                StoreCode,
                                GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserCode.Index],
                                vProgramName^.Data,
                                ProgramTreeView.Items[vIndex].Item[vSubIndex].SelectedIndex]);
        end;

      if vSQL = '' then Exit;

      vSQL := 'insert into MS_PRG_MENU(CD_HEAD, CD_STORE, CD_CODE, ACT_CODE, DS_AUTHORITY) Values '
            + LeftStr(vSQL, Length(vSQL)-1)+';';
      Result := ExecQuery(TempSQL+vSQL,[],true);
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TSystemProgramForm.DoGridLink;
  function FindTreeItem(aText, aAuth: string): TTreeNode;
  var
    vIndex, vSubIndex: Integer;
  begin
    Result := nil;
    for vIndex := 0 to TreeData.Count-1 do
    begin
      if TTreeData(TreeData.Items[vIndex]^).Code = aText then
      begin
        TTreeData(TreeData.Items[vIndex]^).Auth := aAuth;
        Result :=  TTreeData(TreeData.Items[vIndex]^).Node;
        Break;
      end;
    end;
  end;
var
  vTreeNode : TTreeNode;
  vProgramList : TStringList;
  vIndex,
  vSubIndex    : Integer;
  vTreeData    :^TTreeData;
  vProgramName: PStrPointer;
begin
  inherited;
  vProgramList := TStringList.Create;

  Screen.Cursor := crHourGlass;
  try
    OpenQuery('select  ACT_CODE, '
             +'        DS_AUTHORITY '
             +'  from  MS_PRG_MENU '
             +' where  CD_HEAD  =:P0 '
             +'   and  CD_STORE =:P1 '
             +'   and  CD_CODE  =:P2 '
             +'   and  DS_AUTHORITY > 0',
              [HeadStoreCode,
               StoreCode,
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewUserCode.Index]]);
    while not Query.Eof do
    begin
      vProgramList.Add(Format('%-50.50s%-2.2s',[Query.Fields[0].AsString, Query.Fields[1].AsString]));
      Query.Next;
    end;
    Query.Close;

    //검색용 List에 넣는다(속도를 위해서 이용)
    TreeData.Clear;
    for vIndex := 0 to ProgramTreeView.Items.Count-1 do
      for vSubIndex := 0 to ProgramTreeView.Items[vIndex].Count-1 do
      begin
        New(vTreeData);
        vProgramName := ProgramTreeView.Items[vIndex].Item[vSubIndex].Data;
        vTreeData^.Code := vProgramName^.Data;
        vTreeData^.Node := ProgramTreeView.Items[vIndex].Item[vSubIndex];
        vTreeData^.Auth := '';
        TreeData.Add(vTreeData);
      end;

    Screen.Cursor := crHourGlass;
    isCheck := true;
    SelectAllButton.Click;
    try
      for vIndex := 0 to vProgramList.Count-1 do
      begin
        vTreeNode := FindTreeItem(Trim(LeftStr(vProgramList.Strings[vIndex],50)),RightStr(vProgramList.Strings[vIndex],2));
        if vTreeNode <> nil then
        begin
          vTreeNode.StateIndex    := 2; // Checked
          vTreeNode.SelectedIndex := StrToIntDef(GetOnlyNumber(RightStr(vProgramList.Strings[vIndex],2)),15);

          ChangeProgramTreeViewCheck(vTreeNode);
        end;
      end;
    except
    end;
  finally
    FinishQuery;
    isChanged     := false;
    Screen.Cursor := crDefault;
  end;
end;

end.
