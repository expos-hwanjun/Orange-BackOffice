// 상품 일괄 조회

unit OrderBatchHelp;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxCurrencyEdit, ExtCtrls, AdvSplitter,
  cxContainer, StdCtrls, cxTextEdit, cxMaskEdit, cxButtonEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, CheckLst, AdvPanel, cxTreeView, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, cxDropDownEdit, AdvSmoothButton,
  AdvGlowButton;

type
  TOrderBatchHelpForm = class(TForm)
    ConditionPanel: TPanel;
    ConditionSearchLabel: TLabel;
    ConditionSearchEdit: TcxTextEdit;
    ButtonPanel: TPanel;
    EditStyleController: TcxEditStyleController;
    StyleRepository: TcxStyleRepository;
    StyleFontRed: TcxStyle;
    StyleFontBlue: TcxStyle;
    StyleEven: TcxStyle;
    StyleOdd: TcxStyle;
    StyleFontGray: TcxStyle;
    StyleFocused: TcxStyle;
    StyleHighlight: TcxStyle;
    ConditionSearchButton: TAdvGlowButton;
    ButtonOKButton: TAdvGlowButton;
    ButtonCloseButton: TAdvGlowButton;
    Panel1: TPanel;
    ButtonAddButton: TAdvGlowButton;
    ConditionDeleteButton: TAdvGlowButton;
    CommentLabel: TLabel;
    AddGrid: TcxGrid;
    AddGridTableView: TcxGridTableView;
    AddGridTableViewGoodsClass: TcxGridColumn;
    AddGridTableViewGoodsCode: TcxGridColumn;
    AddGridTableViewGoodsName: TcxGridColumn;
    AddGridTableViewOrderUnit: TcxGridColumn;
    AddGridTableViewNepumQty: TcxGridColumn;
    AddGridTableViewKeep: TcxGridColumn;
    AddGridTableViewOrderPrice: TcxGridColumn;
    AddGridTableViewOrderQty: TcxGridColumn;
    AddGridTableViewDsTax: TcxGridColumn;
    AddGridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsClass: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewOrderUnit: TcxGridColumn;
    GridTableViewNepumQty: TcxGridColumn;
    GridTableViewKeepName: TcxGridColumn;
    GridTableViewOrderPrice: TcxGridColumn;
    GridTableViewOrderQty: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridLevel: TcxGridLevel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionGoodsClassCodeEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionGoodsClassTreeViewDblClick(Sender: TObject);
    procedure ConditionCompanyCheckListBoxClickCheck(Sender: TObject);
    procedure ConditionCompanyCheckListBoxExit(Sender: TObject);
    procedure ConditionSearchEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionSearchButtonClick(Sender: TObject);
    procedure ButtonOKButtonClick(Sender: TObject);
    procedure ButtonAddButtonClick(Sender: TObject);
    procedure ButtonCloseButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure ConditionDeleteButtonClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure AddGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
  public
    OrderLimitCode :String;
  end;

implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TOrderBatchHelpForm.FormCreate(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TOrderBatchHelpForm.FormShow(Sender: TObject);
begin
  ConditionSearchButton.Click;
end;
procedure TOrderBatchHelpForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var vCol :Integer;
begin
  if AddGridTableView.DataController.FindRecordIndexByText(0, AddGridTableViewGoodsCode.Index, GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex,GridTableViewGoodsCode.Index], false, false, true) > -1 then
    Exit;

  // 위 그리드 내용을 아래 그리드에 넣는다
  AddGridTableView.DataController.AppendRecord;
  for vCol := 0 to GridTableView.ColumnCount-1 do
    AddGridTableView.DataController.Values[AddGridTableView.DataController.RecordCount-1, vCol] := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex,vCol];

  AddGridTableView.DataController.Values[AddGridTableView.DataController.RecordCount-1, AddGridTableViewOrderQty.Index] := 1;

  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
end;

procedure TOrderBatchHelpForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
end;

//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TOrderBatchHelpForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vActiveControl: tcontrol;
  vCol :Integer;
begin
  // 단축키 처리를 한다
  case Key of
    VK_F2     : ConditionSearchButton.Click;
    VK_F5     : ButtonOKButton.Click;
    VK_F6     : ButtonAddButton.Click;
    VK_Return : begin
                  GridTableView.DataController.PostEditingData;
                  if GridTableView.Focused and GridTableViewOrderQty.Focused and (NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderQty.Index],0) > 0) then
                  begin
                    GridTableView.DataController.PostEditingData;
                      if AddGridTableView.DataController.FindRecordIndexByText(0, AddGridTableViewGoodsCode.Index, GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index], false, false, true) > -1 then
                        Exit;

                    AddGridTableView.DataController.AppendRecord;
                    for vCol := 0 to GridTableView.ColumnCount-1 do
                      AddGridTableView.DataController.Values[AddGridTableView.DataController.RecordCount-1, vCol] := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, vCol];
                    GridTableView.DataController.DeleteRecord(GridTableView.Controller.FocusedRecordIndex);
                  end
                  else
                  begin
                    if Supports(ActiveControl, IcxInnerEditHelper) or Supports(ActiveControl, IcxContainerInnerControl) then
                      vActiveControl := TcxCustomEdit(ActiveControl.Owner)
                    else if ActiveControl is TcxCustomEdit then
                      vActiveControl := TcxCustomEdit(ActiveControl)
                    else
                      vActiveControl := ActiveControl;
                    if vActiveControl.Name <> EmptyStr then
                      SelectNext(TWinControl(Sender), true, true);
                  end;
                end;
    VK_Escape : ButtonCloseButton.Click;
  end;
end;

procedure TOrderBatchHelpForm.ConditionGoodsClassCodeEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
end;
//------------------------------------------------------------------------------
// 상품분류 트리뷰를 더블클릭할 때
procedure TOrderBatchHelpForm.ConditionGoodsClassTreeViewDblClick(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 상품분류 트리뷰에서 포커스가 나갈 때
procedure TOrderBatchHelpForm.ConditionDeleteButtonClick(Sender: TObject);
var vRow, vCol, vIndex :Integer;
begin
  GridTableView.BeginUpdate;

  for vRow := 0 to AddGridTableView.Controller.SelectedRowCount - 1 do
  begin
    // 위 그리드 내용을 아래 그리드에 넣는다
    GridTableView.DataController.AppendRecord;
    for vCol := 0 to GridTableView.ColumnCount-1 do
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := AddGridTableView.Controller.SelectedRows[vRow].Values[vCol];
  end;

  for vRow := AddGridTableView.Controller.SelectedRowCount - 1 downto 0 do
    AddGridTableView.DataController.DeleteRecord(AddGridTableView.Controller.SelectedRows[vRow].RecordIndex);

  GridTableView.EndUpdate;
end;

//------------------------------------------------------------------------------
// 거래처 목록을 체크할 때
procedure TOrderBatchHelpForm.ConditionCompanyCheckListBoxClickCheck(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 거래처 목록에서 포커스가 나갈 때
procedure TOrderBatchHelpForm.ConditionCompanyCheckListBoxExit(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
// 검색어에서 키보드를 누를 때
procedure TOrderBatchHelpForm.ConditionSearchEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Return then
    ConditionSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TOrderBatchHelpForm.ConditionSearchButtonClick(Sender: TObject);
var
  vIndex  : Integer;
  vGoods  : String;
begin
  // 거래처 또는 상품분류를 선택 중일지 모르므로 창을 없애기 위해 포커스를 옮긴다
  if ConditionSearchButton.Enabled then
    ConditionSearchButton.SetFocus;

  vGoods := '';
  for vIndex := 0 to AddGridTableView.DataController.RecordCount-1 do
    vGoods := vGoods + Format('''%s'',',[AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index]]);

  if vGoods <> '' then
    vGoods := Format(' and a.CD_GOODS not in (%s) ',[LeftStr(vGoods, Length(vGoods)-1)]);

  try
    Screen.Cursor := crHourGlass;
    DM.OpenQuery('select   c.NM_CODE1 as NM_CLASS, '
                +'         a.CD_GOODS, '
                +'         a.NM_GOODS, '
                +'         a.NM_UNIT, '
                +'         a.QTY_NEPUM, '
                +'         d.NM_CODE1 as NM_KEEP, '
                +'         a.PR_SALE, '
                +'         a.DS_TAX '
                +'  from   MS_GOODS as a left outer join '
                +Ifthen(OrderLimitCode <> '', ' MS_CODE  as b on b.CD_HEAD  = a.CD_HEAD '
                +'                      and b.CD_STORE = a.CD_STORE '
                +'                      and b.CD_KIND  = ''06'' '
                +Format('               and b.CD_CODE  = ''%s'' ',[OrderLimitCode])
                +'                      and Substring(b.NM_CODE2, DAYOFWEEK(Now()), 1) = ''1'' '
                +'                      and b.NM_CODE3 <= Date_Format(Now(), ''%H:%i'') '
                +'                      and b.NM_CODE4 >= Date_Format(Now(), ''%H:%i'') left outer join ','')
                +'         MS_CODE  as c on c.CD_HEAD  = a.CD_HEAD '
                +'                      and c.CD_STORE = a.CD_STORE '
                +'                      and c.CD_KIND  = ''04'' '
                +'                      and c.CD_CODE  = a.CD_CLASS left outer join '
                +'         MS_CODE  as d on d.CD_HEAD  = a.CD_HEAD '
                +'                      and d.CD_STORE = a.CD_STORE '
                +'                      and d.CD_KIND  = ''07'' '
                +'                      and d.CD_CODE  = a.CD_KEEP '
                +' where   a.CD_HEAD  = :P0 '
                +'   and   a.CD_STORE = :P1 '
                +'   and   a.NM_GOODS like ConCat(''%'',:P2,''%'') '
                +'   and   a.DS_STATUS    = ''Y'' '
                +vGoods
                +' order by a.NM_GOODS',
                 [HeadStoreCode,
                  StandardStore,
                  ConditionSearchEdit.Text]);
    GridTableView.BeginUpdate;
    GridTableView.DataController.RecordCount := 0;
    while not DM.Query.Eof do
    begin
      GridTableView.DataController.AppendRecord;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsClass.Index]        := DM.Query.Fields[0].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]         := DM.Query.Fields[1].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]         := DM.Query.Fields[2].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderUnit.Index]         := DM.Query.Fields[3].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewNepumQty.Index]          := DM.Query.Fields[4].AsInteger;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewKeepName.Index]          := DM.Query.Fields[5].AsString;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderQty.Index]          := 0;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index]        := DM.Query.Fields[6].AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDsTax.Index]             := DM.Query.Fields[7].AsString;
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
procedure TOrderBatchHelpForm.AddGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var vCol :Integer;
begin
  // 위 그리드 내용을 아래 그리드에 넣는다
  GridTableView.DataController.AppendRecord;
  for vCol := 0 to AddGridTableView.ColumnCount-1 do
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := AddGridTableView.DataController.Values[AddGridTableView.DataController.GetFocusedRecordIndex,vCol];

  AddGridTableView.DataController.DeleteRecord(AddGridTableView.DataController.GetFocusedRecordIndex);
end;

procedure TOrderBatchHelpForm.ButtonAddButtonClick(Sender: TObject);
var
  vRow, vCol, vCount: Integer;
begin
  vCount := 0;
  GridTableView.DataController.PostEditingData;

  AddGridTableView.BeginUpdate;

  for vRow := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vRow, GridTableViewOrderQty.Index] = 0 then Continue;

    // 아래 그리드에 같은 상품이 있으면 그냥 넘어간다
    if AddGridTableView.DataController.FindRecordIndexByText(0, AddGridTableViewGoodsCode.Index, GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index], false, false, true) > -1 then
      Continue;

    // 위 그리드 내용을 아래 그리드에 넣는다
    AddGridTableView.DataController.AppendRecord;
    for vCol := 0 to GridTableView.ColumnCount-1 do
      AddGridTableView.DataController.Values[AddGridTableView.DataController.RecordCount-1, vCol] := GridTableView.DataController.Values[vRow, vCol];

    Inc(vCount);
  end;

  AddGridTableView.EndUpdate;
  for vRow := GridTableView.DataController.RecordCount-1 downto 0 do
    if GridTableView.DataController.Values[vRow, GridTableViewOrderQty.Index] <> 0 then
      GridTableView.DataController.DeleteRecord(vRow);

  if vCount = 0 then
    Exit;

  // 아래 그리드를 보여준다
  AddGrid.Visible  := true;
end;
//------------------------------------------------------------------------------
// 확인 버튼
procedure TOrderBatchHelpForm.ButtonOKButtonClick(Sender: TObject);
begin
  // 추가 버튼을 누르고 폼을 닫는다
  ModalResult := mrOK;
end;
//------------------------------------------------------------------------------
// 닫기 버튼
procedure TOrderBatchHelpForm.ButtonCloseButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
