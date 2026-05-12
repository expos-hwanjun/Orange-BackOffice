// 상품 일괄 조회 (New완료)

unit CodeBatchHelp;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxCurrencyEdit, ExtCtrls, AdvSplitter,
  cxContainer, StdCtrls, cxTextEdit, cxMaskEdit, cxButtonEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, CheckLst, AdvPanel, cxTreeView, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator;

type
  TCodeBatchHelpForm = class(TForm)
    ConditionPanel: TPanel;
    ConditionGoodsClassLabel: TLabel;
    ConditionGoodsClassCodeEdit: TcxButtonEdit;
    ConditionGoodsClassNameEdit: TcxTextEdit;
    ConditionGoodsClassTreeView: TcxTreeView;
    ConditionCompanyLabel: TLabel;
    ConditionCompanyCodeEdit: TcxButtonEdit;
    ConditionCompanyNameEdit: TcxTextEdit;
    ConditionCompanyPanel: TAdvPanel;
    ConditionCompanyCheckListBox: TCheckListBox;
    ConditionSearchLabel: TLabel;
    ConditionSearchEdit: TcxTextEdit;
    ConditionSearchButton: TButton;
    Grid: TcxGrid;
    GridLevel: TcxGridLevel;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewBuyQty: TcxGridColumn;
    AddGrid: TcxGrid;
    AddGridLevel: TcxGridLevel;
    AddGridTableView: TcxGridTableView;
    AddGridTableViewGoodsCode: TcxGridColumn;
    AddGridTableViewGoodsName: TcxGridColumn;
    AddGridTableViewCompanyName: TcxGridColumn;
    AddGridTableViewBuyPrice: TcxGridColumn;
    AddGridTableViewSalePrice: TcxGridColumn;
    AddGridTableViewBuyQty: TcxGridColumn;
    ButtonPanel: TPanel;
    ButtonAddButton: TButton;
    ButtonOKButton: TButton;
    ButtonCloseButton: TButton;
    EditStyleController: TcxEditStyleController;
    Splitter: TAdvSplitter;
    CommentLabel: TLabel;
    StyleRepository: TcxStyleRepository;
    StyleFontRed: TcxStyle;
    StyleFontBlue: TcxStyle;
    StyleEven: TcxStyle;
    StyleOdd: TcxStyle;
    StyleFontGray: TcxStyle;
    StyleFocused: TcxStyle;
    StyleHighlight: TcxStyle;
    GridTableViewMasterBuyPrice: TcxGridColumn;
    GridTableViewMasterSalePrice: TcxGridColumn;
    AddGridTableViewMasterBuyPrice: TcxGridColumn;
    AddGridTableViewMasterSalePrice: TcxGridColumn;
    ConditionDeleteButton: TButton;
    GridTableViewDsTax: TcxGridColumn;
    AddGridTableViewDsTax: TcxGridColumn;
    GridTableViewDsGoods: TcxGridColumn;
    AddGridTableViewDsGoods: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionGoodsClassCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure ConditionGoodsClassCodeEditPropertiesChange(Sender: TObject);
    procedure ConditionGoodsClassCodeEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionGoodsClassTreeViewDblClick(Sender: TObject);
    procedure ConditionGoodsClassTreeViewExit(Sender: TObject);
    procedure ConditionGoodsClassTreeViewExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure ConditionGoodsClassTreeViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionCompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure ConditionCompanyCodeEditPropertiesChange(Sender: TObject);
    procedure ConditionCompanyCodeEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionCompanyCheckListBoxClickCheck(Sender: TObject);
    procedure ConditionCompanyCheckListBoxExit(Sender: TObject);
    procedure ConditionSearchEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionSearchButtonClick(Sender: TObject);
    procedure ButtonOKButtonClick(Sender: TObject);
    procedure ButtonAddButtonClick(Sender: TObject);
    procedure ButtonCloseButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewBuyPricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure AddGridTableViewBuyPricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionDeleteButtonClick(Sender: TObject);

  private
    isValidating: Boolean;
  public
    WorkType   : Integer; //0:매입(상품일괄), 1:매입(PDA 요청), 2:행사, 3:발수(상품일괄), 4:이관
    SQLText    : string;
    CompanyCode: string;
  end;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCodeBatchHelpForm.FormCreate(Sender: TObject);
var
  vCode    : PStrPointer;
  vTreeNode: TTreeNode;
begin
  inherited;

  // 거래처 목록을 불러온다
  DM.OpenQuery('select   CD_TRDPL, '
              +'         NM_TRDPL as NM_TRDPL '
              +'  from   MS_TRD '
              +' where   CD_HEAD   = :P0 '
              +'   and   CD_STORE  = :P1 '
              +'   and   DS_TRDPL  = ''B'' '
              +'   and   DS_STATUS = 0 '
              +' order by NM_TRDPL',
              [HeadStoreCode,
               StoreCode]);
  try
    while not DM.Query.Eof do
    begin
      New(vCode);
      vCode^.Data := DM.Query.Fields[0].AsString;
      ConditionCompanyCheckListBox.Items.AddObject(DM.Query.Fields[1].AsString, TObject(vCode));
      DM.Query.Next;
    end;
  finally
    DM.FinishQuery;
  end;

  // 상품분류 목록을 불러온다
  DM.OpenQuery('select   NM_CLASS, '
              +'         CD_CLASS '
              +'  from   MS_MENU_CLASS '
              +' where   CD_HEAD   = :P0 '
              +'   and   CD_STORE  = :P1 '
              +'   and   Length(CD_CLASS) = 2',
               [HeadStoreCode,
                StoreCode]);
  try
    while not DM.Query.Eof do
    begin
      New(vCode);
      vCode^.Data := DM.Query.Fields[1].AsString;
      vTreeNode   := ConditionGoodsClassTreeView.Items.AddObject(nil, DM.Query.Fields[0].AsString, vCode);
      if GetOption(248) <> '1' then
        vTreeNode.HasChildren := true;
      DM.Query.Next;
    end;
  finally
    DM.FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TCodeBatchHelpForm.FormShow(Sender: TObject);
var
  vIndex: Integer;
  vCode : PStrPointer;
begin
  // 부모 폼에서 SQL을 지정해 준 경우
  case WorkType of
    2 :
    begin
      AddGridTableViewBuyQty.Visible         := false;
      GridTableViewBuyPrice.Options.Focusing := false;
      ConditionDeleteButton.Visible          := true;
      ConditionSearchButton.Click;
    end;
    // 부모 폼에서 SQL을 지정해 주지 않은 경우
    0,1 :
    begin
      ConditionSearchButton.Left := ConditionDeleteButton.Left;
      ConditionPanel.Height               := 75;
      // 여러 줄 선택 가능할 때는 수량 입력을 못하게 막는다
      if not GridTableView.OptionsSelection.MultiSelect then
        GridTableViewBuyQty.Visible       := true;
      //매입(상품일괄)일때 행사 칼럼을 보여준다
      if WorkType = 0 then
      begin
        GridTableViewBuyPrice.Options.Focusing:= true;
        GridTableViewBuyPrice.Options.Editing := true;

        AddGridTableViewBuyPrice.Options.Focusing := true;
        AddGridTableViewBuyPrice.Options.Editing  := true;
      end
      else
      begin
        GridTableViewBuyPrice.Options.Focusing:= false;
        GridTableViewBuyPrice.Options.Editing := false;

        AddGridTableViewBuyPrice.Options.Focusing := false;
        AddGridTableViewBuyPrice.Options.Editing  := false;
      end;
    end;
  end;
  CommentLabel.Visible := GridTableView.OptionsSelection.MultiSelect;

  // 기본 거래처가 있으면 보여준다
  if (GetOnlyNumber(CompanyCode) = CompanyCode) and (Length(CompanyCode) = 6) then
  begin
    isValidating := true;
    for vIndex := 0 to ConditionCompanyCheckListBox.Items.Count-1 do
    begin
      vCode := PStrPointer(ConditionCompanyCheckListBox.Items.Objects[vIndex]);
      if vCode^.Data = CompanyCode then
      begin
        ConditionCompanyCodeEdit.Text := CompanyCode;
        ConditionCompanyNameEdit.Text := ConditionCompanyCheckListBox.Items[vIndex];
        ConditionCompanyCheckListBox.CheckAll(cbUnchecked);
        ConditionCompanyCheckListBox.Checked[vIndex] := true;
        if ConditionSearchEdit.Enabled then
          ConditionSearchEdit.SetFocus;
        break;
      end;
    end;
  end;

  ConditionSearchButton.Click;

end;
procedure TCodeBatchHelpForm.GridTableViewBuyPricePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex,  GridTableViewBuyPrice.Index] := DisplayValue;

end;

procedure TCodeBatchHelpForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
end;

//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TCodeBatchHelpForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vActiveControl: tcontrol;
begin
  // 단축키 처리를 한다
  case Key of
    VK_F2     : ConditionSearchButton.Click;
    VK_F5     : ButtonOKButton.Click;
    VK_F6     : ButtonAddButton.Click;
    VK_Return : begin
                  if Supports(ActiveControl, IcxInnerEditHelper) or Supports(ActiveControl, IcxContainerInnerControl) then
                    vActiveControl := TcxCustomEdit(ActiveControl.Owner)
                  else if ActiveControl is TcxCustomEdit then
                    vActiveControl := TcxCustomEdit(ActiveControl)
                  else
                    vActiveControl := ActiveControl;
                  if vActiveControl.Name <> EmptyStr then
                    SelectNext(TWinControl(Sender), true, true);
                end;
    VK_Escape : ButtonCloseButton.Click;
  end;
end;

//==============================================================================
// 조회 조건
//------------------------------------------------------------------------------
// 상품분류 도움말 버튼
procedure TCodeBatchHelpForm.ConditionGoodsClassCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  // 상품분류 테이블에서 상품분류을 불러오는 창을 띄운다
  if (not ConditionGoodsClassTreeView.Visible) and (ConditionGoodsClassTreeView.Items.Count > 0) then
  begin
    ConditionGoodsClassTreeView.Top     := ConditionGoodsClassCodeEdit.Top  + ConditionGoodsClassCodeEdit.Height;
    ConditionGoodsClassTreeView.Left    := ConditionGoodsClassCodeEdit.Left + 3;
    ConditionGoodsClassTreeView.Visible := true;
    ConditionGoodsClassTreeView.BringToFront;
    ConditionGoodsClassTreeView.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
// 상품분류를 수정할 때
procedure TCodeBatchHelpForm.ConditionGoodsClassCodeEditPropertiesChange(Sender: TObject);
begin
  if isValidating then
    isValidating := false
  else if (not isValidating) and (ConditionGoodsClassNameEdit.Text <> EmptyStr) then
    ConditionGoodsClassNameEdit.Clear;
end;
//------------------------------------------------------------------------------
// 상품분류를 검증할 때
procedure TCodeBatchHelpForm.ConditionGoodsClassCodeEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // 상품분류코드에 문자를 입력했으면 해당 분류를 찾아와 표시한다
  if (DisplayValue <> EmptyStr) and (ConditionGoodsClassNameEdit.Text = EmptyStr) and
     ((GetOnlyNumber(DisplayValue) <> DisplayValue) or (Length(DisplayValue) <> (StoI(GetOption(248))+1)*2)) then
  begin
    isValidating := true;
    DM.OpenQuery('select   CD_CLASS, '
                +'         GetMenuClassName(CD_HEAD, CD_STORE, CD_CLASS) as NM_CLASS '
                +'from     MS_MENU_CLASS '
                +'where    CD_HEAD       = :P0 '
                +'  and    CD_STORE      = :P1 '
                +'  and    Length(CD_CLASS) = :P2 '
                +'  and    NM_CLASS like ConCat(''%'',:P3,''%'') '
                +'order by NM_CLASS',
                 [HeadStoreCode,
                  StoreCode,
                  (StoI(GetOption(248))+1)*2,
                  DisplayValue]);
    try
      if not DM.Query.eof then
      begin
        DisplayValue                     := DM.Query.Fields[0].AsString;
        ConditionGoodsClassNameEdit.Text := DM.Query.Fields[1].AsString;
      end;
      if ConditionCompanyCodeEdit.Enabled then
        ConditionCompanyCodeEdit.SetFocus;
    finally
      DM.FinishQuery;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 상품분류 트리뷰를 더블클릭할 때
procedure TCodeBatchHelpForm.ConditionGoodsClassTreeViewDblClick(Sender: TObject);
var
  vClassData: PStrPointer;
  vClassName: string;
  vTreeNode : TTreeNode;
begin
  inherited;

  // 선택된 노드가 있고 자식이 없는 노드라면
  vTreeNode := ConditionGoodsClassTreeView.Selected;
  if (vTreeNode <> nil) and (vTreeNode.Count = 0) then
  begin
    vClassData   := vTreeNode.Data;
    vClassName   := vTreeNode.Text;
    // 부모 노드들을 쭉 찾아나가며 이름을 얻어온다 (대-중-소 식으로)
    while vTreeNode.Parent <> nil do
    begin
      vTreeNode  := vTreeNode.Parent;
      vClassName := vTreeNode.Text+' - '+vClassName;
    end;

    // 상품분류 트리를 숨긴다
    (Sender as TcxTreeView).Visible  := false;

    ConditionGoodsClassCodeEdit.Text := vClassData^.Data;
    ConditionGoodsClassNameEdit.Text := vClassName;
    ConditionGoodsClassCodeEdit.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
// 상품분류 트리뷰에서 포커스가 나갈 때
procedure TCodeBatchHelpForm.ConditionGoodsClassTreeViewExit(Sender: TObject);
begin
  ConditionGoodsClassTreeView.Visible := false;
end;
//------------------------------------------------------------------------------
// 상품분류 트리뷰 노드를 열 때
procedure TCodeBatchHelpForm.ConditionGoodsClassTreeViewExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
var
  vClassData, vCode: PStrPointer;
  vTreeNode: TTreeNode;
begin
  inherited;

  // 현재 노드의 자식이 있다고 하면서 실제로는 자식이 없는 경우에는 새로 쿼리를 해 본다(최초 확장 시)
  if (Node.HasChildren) and (Node.Count = 0) then
  begin
    vClassData := Node.Data;
    DM.OpenQuery('select   NM_CLASS, '
                +'         CD_CLASS '
                +'from     MS_MENU_CLASS '
                +'where    CD_HEAD       = :P0 '
                +'  and    CD_STORE      = :P1 '
                +'  and    CD_CLASS like ConCat(:P2,''%'') '
                +'  and    Length(CD_CLASS) = :P3',
                 [HeadStoreCode,
                  StoreCode,
                  vClassData^.Data,
                  Length(vClassData^.Data)+2]);
    try
      while not DM.Query.Eof do
      begin
        New(vCode);
        vCode^.Data := DM.Query.Fields[1].AsString;
        vTreeNode   := ConditionGoodsClassTreeView.Items.AddChildObject(Node, DM.Query.Fields[0].AsString, vCode);
        // 환경설정에서 관리하겠다고 한 최대 자릿수보다 작으면 자식노드가 있다고 간주한다
        if Length(vCode^.Data) < (StoI(GetOption(248))+1)*2 then
          vTreeNode.HasChildren := true;
        DM.Query.Next;
      end;
      Node.HasChildren := Node.Count > 0;
      AllowExpansion   := Node.HasChildren;
    finally
      DM.FinishQuery;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 상품분류 트리뷰에서 키보드를 누를 때
procedure TCodeBatchHelpForm.ConditionGoodsClassTreeViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vClassData: PStrPointer;
  vClassName: string;
  vTreeNode : TTreeNode;
begin
  inherited;

  // Enter를 누르면 더블클릭을 한 것과 같은 처리를 한다
  if Key = VK_Return then
  begin
    // 선택된 노드가 있고 자식이 없는 노드라면
    vTreeNode := ConditionGoodsClassTreeView.Selected;
    if (vTreeNode <> nil) then
    begin
      vClassData   := vTreeNode.Data;
      vClassName   := vTreeNode.Text;
      // 부모 노드들을 쭉 찾아나가며 이름을 얻어온다 (대-중-소 식으로)
      while vTreeNode.Parent <> nil do
      begin
        vTreeNode  := vTreeNode.Parent;
        vClassName := vTreeNode.Text+' - '+vClassName;
      end;

      // 상품분류 트리를 숨긴다
      (Sender as TcxTreeView).Visible  := false;

      ConditionGoodsClassCodeEdit.Text := vClassData^.Data;
      ConditionGoodsClassNameEdit.Text := vClassName;
      ConditionSearchButton.Click;
      ConditionGoodsClassCodeEdit.SetFocus;
    end;
  end
//    ConditionGoodsClassTreeViewDblClick(Sender)

  // Esc를 누르면 포커스가 빠져나가는 것과 같은 처리를 한다
  else if Key = VK_Escape then
    ConditionGoodsClassTreeViewExit(Sender);
end;
//------------------------------------------------------------------------------
// 거래처 도움말 버튼
procedure TCodeBatchHelpForm.ConditionCompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if (not ConditionGoodsClassTreeView.Visible) and (ConditionCompanyCheckListBox.Items.Count > 0) then
  begin
    ConditionCompanyPanel.Top     := ConditionCompanyCodeEdit.Top  + ConditionCompanyCodeEdit.Height;
    ConditionCompanyPanel.Left    := ConditionCompanyCodeEdit.Left + 3;
    ConditionCompanyPanel.Visible := true;
    ConditionCompanyPanel.BringToFront;
    ConditionCompanyCheckListBox.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
// 거래처 값을 수정할 때
procedure TCodeBatchHelpForm.ConditionCompanyCodeEditPropertiesChange(Sender: TObject);
begin
  if isValidating then
    isValidating := false

  else if (not isValidating) and (ConditionCompanyNameEdit.Text <> EmptyStr) then
  begin
    ConditionCompanyCheckListBox.CheckAll(cbUnchecked);
    ConditionCompanyNameEdit.Clear;
    ConditionCompanyNameEdit.Hint := EmptyStr;
  end;
end;
//------------------------------------------------------------------------------
// 거래처 값을 검증할 때
procedure TCodeBatchHelpForm.ConditionCompanyCodeEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vIndex: Integer;
  vCode : PStrPointer;
begin
  // 6자리 숫자일 때 거래처 목록에서 코드로 거래처를 찾는다
  if (GetOnlyNumber(DisplayValue) = DisplayValue) and (Length(DisplayValue) = 6) then
  begin
    isValidating := true;
    for vIndex := 0 to ConditionCompanyCheckListBox.Items.Count-1 do
    begin
      vCode := PStrPointer(ConditionCompanyCheckListBox.Items.Objects[vIndex]);
      if vCode^.Data = DisplayValue then
      begin
        ConditionCompanyNameEdit.Text := ConditionCompanyCheckListBox.Items[vIndex];
        ConditionCompanyCheckListBox.CheckAll(cbUnchecked);
        ConditionCompanyCheckListBox.Checked[vIndex] := true;
        if ConditionSearchEdit.Enabled then
          ConditionSearchEdit.SetFocus;
        break;
      end;
    end;
  end

  // 다른 값일 때 거래처 목록에서 이름으로 거래처를 찾는다
  else if DisplayValue <> EmptyStr then
  begin
    isValidating := true;
    for vIndex := 0 to ConditionCompanyCheckListBox.Items.Count-1 do
      if Pos(DisplayValue, ConditionCompanyCheckListBox.Items[vIndex]) > 0 then
      begin
        vCode        := PStrPointer(ConditionCompanyCheckListBox.Items.Objects[vIndex]);
        DisplayValue := vCode^.Data;
        ConditionCompanyNameEdit.Text := ConditionCompanyCheckListBox.Items[vIndex];
        ConditionCompanyCheckListBox.CheckAll(cbUnchecked);
        ConditionCompanyCheckListBox.Checked[vIndex] := true;
        if ConditionSearchEdit.Enabled then
          ConditionSearchEdit.SetFocus;
        break;
      end;
  end;
end;
procedure TCodeBatchHelpForm.ConditionDeleteButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  if not AskBox('행사요청상품을 삭제하시겠습니까?') then Exit;

  try
    GridTableView.BeginUpdate;
    for vIndex := GridTableView.Controller.SelectedRowCount - 1 downto 0 do
    begin
      DM.ExecQuery('delete from MS_SPC_TEMP '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and DS_SPC = ''0'' '
                  +'   and CD_MENU = :P2;',
                  [HeadStoreCode,
                   StoreCode,
                   GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewGoodsCode.Index]]);
      GridTableView.DataController.DeleteRecord(GridTableView.Controller.SelectedRows[vIndex].Index);
    end;
    DM.ExecQuery(TempSQL, [], true);
  finally
    GridTableView.EndUpdate;
  end;
end;

//------------------------------------------------------------------------------
// 거래처 목록을 체크할 때
procedure TCodeBatchHelpForm.ConditionCompanyCheckListBoxClickCheck(Sender: TObject);
var
  vIndex,
  vCount: Integer;
  vCode : PStrPointer;
begin
  inherited;

  // 체크한 목록을 거래처 입력창에 표시한다
  ConditionCompanyNameEdit.Text := EmptyStr;
  vCount := 0;
  vCode  := nil;
  isValidating := true;
  for vIndex := 0 to ConditionCompanyCheckListBox.Items.Count-1 do
    if ConditionCompanyCheckListBox.Checked[vIndex] then
    begin
      ConditionCompanyNameEdit.Text := ConditionCompanyNameEdit.Text + IfThen(ConditionCompanyCodeEdit.Text = EmptyStr, EmptyStr, ', ') + ConditionCompanyCheckListBox.Items[vIndex];
      if vCount = 0 then
        vCode := PStrPointer(ConditionCompanyCheckListBox.Items.Objects[vIndex]);
      Inc(vCount);
    end;
  ConditionCompanyNameEdit.Hint := ConditionCompanyNameEdit.Text;
  if vCount = 0 then
    ConditionCompanyCodeEdit.Clear
  else if (vCount = 1) and (vCode <> nil) then
    ConditionCompanyCodeEdit.Text := vCode^.Data
  else if vCount > 1 then
    ConditionCompanyCodeEdit.Text := '(다중선택)';
end;
//------------------------------------------------------------------------------
// 거래처 목록에서 포커스가 나갈 때
procedure TCodeBatchHelpForm.ConditionCompanyCheckListBoxExit(Sender: TObject);
begin
  ConditionCompanyPanel.Visible := False;
end;
//------------------------------------------------------------------------------
// 검색어에서 키보드를 누를 때
procedure TCodeBatchHelpForm.ConditionSearchEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Return then
    ConditionSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TCodeBatchHelpForm.ConditionSearchButtonClick(Sender: TObject);
var
  vCompany: string;
  vIndex  : Integer;
  vCode   : PStrPointer;
begin
  // 거래처 또는 상품분류를 선택 중일지 모르므로 창을 없애기 위해 포커스를 옮긴다
  if ConditionSearchButton.Enabled then
    ConditionSearchButton.SetFocus;

  // 선택한 거래처 목록을 구한다
  vCompany := EmptyStr;
  if ConditionCompanyNameEdit.Text <> EmptyStr then
  begin
    for vIndex := 0 to ConditionCompanyCheckListBox.Items.Count-1 do
      if ConditionCompanyCheckListBox.Checked[vIndex] then
      begin
        vCode    := PStrPointer(ConditionCompanyCheckListBox.Items.Objects[vIndex]);
        vCompany := vCompany + IfThen(vCompany = EmptyStr, EmptyStr, ', ') + ''''+ vCode^.Data + '''';
      end;
    vCompany := ' and g.CD_TRDPL in (' + vCompany + ') ';
  end;

  try
    Screen.Cursor := crHourGlass;
    DM.OpenQuery(IfThen(SQLText = EmptyStr,
                        'select   g.CD_MENU, '
                       +'         ConCat(g.NM_MENU,'' '', Ifnull(g.NM_SPEC,'''')) as NM_GOODS, '
                       +'         Ifnull(t.NM_TRDPL,''미지정'') as NM_TRDPL, '
                       +'         g.PR_BUY, '
                       +'         g.PR_SALE, '
                       +'         g.PR_BUY as PR_BUY_M, '
                       +'         g.PR_SALE as PR_SALE_M, '
                       +'         g.DS_TAX, '
                       +'         g.DS_MENU_TYPE '
                       +'from     MS_MENU as g left outer join '
                       +'         MS_TRD   as t on g.CD_HEAD  = t.CD_HEAD '
                       +'                      and g.CD_STORE = t.CD_STORE '
                       +'                      and g.CD_TRDPL = t.CD_TRDPL '
                       +'where    g.CD_HEAD  = :P0 '
                       +'  and    g.CD_STORE = :P1 ',
                         SQLText)
                +Ifthen(vCompany <> EmptyStr, vCompany, EmptyStr)
                +IfThen(ConditionGoodsClassNameEdit.Text = EmptyStr, EmptyStr, '  and    g.CD_CLASS like ConCat('''+ConditionGoodsClassCodeEdit.Text+''',''%'') ')
                +'  and   (g.NM_MENU like ConCat(''%'',:P2,''%'') or g.NM_MENU_SHORT like ConCat(''%'',:P2,''%'')) '
                +'  and    g.YN_USE    = ''Y'' '
                +Ifthen(WorkType=2,'and g.DS_MENU_TYPE in (''N'',''C'',''S'',''O'') ',' and g.DS_MENU_TYPE = ''N'' ')
                +'order by g.NM_MENU, g.CD_MENU ',
                 [HeadStoreCode,
                  StoreCode,
                  ConditionSearchEdit.Text]);
    GridTableView.BeginUpdate;
    GridTableView.DataController.RecordCount := 0;
    while not DM.Query.Eof do
    begin
      GridTableView.DataController.AppendRecord;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]         := DM.Query.Fields[0].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]         := DM.Query.Fields[1].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewCompanyName.Index]       := DM.Query.Fields[2].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyPrice.Index]          := DM.Query.Fields[3].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePrice.Index]         := DM.Query.Fields[4].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyQty.Index]            := 0;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewMasterBuyPrice.Index]    := DM.Query.Fields[5].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewMasterSalePrice.Index]   := DM.Query.Fields[6].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDsTax.Index]             := DM.Query.Fields[7].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDsGoods.Index]           := DM.Query.Fields[8].AsString;
      GridTableView.DataController.Post;
      DM.Query.Next;
    end;
  finally
    DM.FinishQuery;
    GridTableView.EndUpdate;
    if GridTableView.DataController.RecordCount > 0 then
      Grid.SetFocus;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
// 추가 버튼
procedure TCodeBatchHelpForm.AddGridTableViewBuyPricePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  AddGridTableView.DataController.Values[AddGridTableView.DataController.GetFocusedRecordIndex,  AddGridTableViewBuyPrice.Index] := DisplayValue;
end;

procedure TCodeBatchHelpForm.ButtonAddButtonClick(Sender: TObject);
var
  vRow, vCol, vCount: Integer;
begin
  vCount := 0;
  GridTableView.DataController.PostEditingData;

  AddGridTableView.BeginUpdate;
  case WorkType of
    0,1,3,4 :
    begin
      for vRow := 0 to GridTableView.DataController.FilteredRecordCount-1 do
      begin
        // 위쪽 그리드의 매입수량이 없으면 그냥 넘어간다
        if (GridTableViewBuyQty.Visible) and
           (GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vRow], GridTableViewBuyQty.Index] = 0) then
          Continue;

        // 아래 그리드에 같은 상품이 있으면 그냥 넘어간다
        if AddGridTableView.DataController.FindRecordIndexByText(0, AddGridTableViewGoodsCode.Index, GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vRow], GridTableViewGoodsCode.Index], false, false, true) > -1 then
          Continue;

        // 위 그리드 내용을 아래 그리드에 넣는다
        AddGridTableView.DataController.AppendRecord;
        for vCol := 0 to GridTableView.ColumnCount-1 do
          AddGridTableView.DataController.Values[AddGridTableView.DataController.RecordCount-1, vCol] := GridTableView.DataController.Values[vRow, vCol];
        Inc(vCount);
      end;
    end;
    2 :
    begin
      for vRow := 0 to GridTableView.Controller.SelectedRowCount - 1 do
      begin
        // 아래 그리드에 같은 상품이 있으면 그냥 넘어간다
        if AddGridTableView.DataController.FindRecordIndexByText(0, AddGridTableViewGoodsCode.Index, GridTableView.Controller.SelectedRows[vRow].Values[GridTableViewGoodsCode.Index], false, false, true) > -1 then
          Continue;

        // 위 그리드 내용을 아래 그리드에 넣는다
        AddGridTableView.DataController.AppendRecord;
        for vCol := 0 to GridTableView.ColumnCount-1 do
          AddGridTableView.DataController.Values[AddGridTableView.DataController.RecordCount-1, vCol] := GridTableView.Controller.SelectedRows[vRow].Values[vCol];
        Inc(vCount);
      end;
    end;
  end;
  AddGridTableView.EndUpdate;

  if vCount = 0 then
    Exit;

  // 아래 그리드를 보여준다
  AddGrid.Visible  := true;
  Splitter.Visible := true;
end;
//------------------------------------------------------------------------------
// 확인 버튼
procedure TCodeBatchHelpForm.ButtonOKButtonClick(Sender: TObject);
begin
  // 추가 버튼을 누르고 폼을 닫는다
  ButtonAddButton.Click;
  ModalResult := mrOK;
end;
//------------------------------------------------------------------------------
// 닫기 버튼
procedure TCodeBatchHelpForm.ButtonCloseButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
