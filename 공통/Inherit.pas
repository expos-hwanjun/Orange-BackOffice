// 기본 상속폼 (F)

unit Inherit;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, DB, MemDS, DateUtils, Menus, StrUtils, Math, Common,
  cxGraphics, cxStyles, AdvToolBar, AdvToolBarStylers, cxContainer, cxEdit,
  cxTextEdit, cxDropDownEdit, cxLabel, cxControls, cxMaskEdit,
  AdvGlowButton, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxmdaset, ComCtrls, cxTreeView, cxMemo, cxSpinEdit, cxCurrencyEdit,
  cxButtonEdit, cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters, ShellAPI,
  StdCtrls, DBAccess, cxCalendar, cxColorComboBox, cxImage, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, EncdDecd, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, cxRadioGroup, REST.Types, cxGridCardView,
  AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TInheritForm = class(TForm)
    ToolBarDockPanel: TAdvDockPanel;
    ButtonToolBar: TAdvToolBar;
    ButtonToolBarCloseButton: TAdvGlowButton;
    ConditionToolBar: TAdvToolBar;
    ConditionToolBarFromDateEdit: TcxDateEdit;
    ConditionToolBarDateLabel: TcxLabel;
    EditStyleController: TcxEditStyleController;
    ConditionToolBarToDateEdit: TcxDateEdit;
    ConditionToolBarDateToLabel: TcxLabel;
    ConditionToolBarEditLabel: TcxLabel;
    ConditionToolBarComboBox: TcxComboBox;
    ConditionToolBarEdit: TcxTextEdit;
    ToolBarStyler: TAdvToolBarOfficeStyler;
    StyleRepository: TcxStyleRepository;
    StyleFontRed: TcxStyle;
    StyleFontBlue: TcxStyle;
    StyleEven: TcxStyle;
    StyleOdd: TcxStyle;
    StyleFontGray: TcxStyle;
    Exec_Timer: TTimer;
    StyleFontBlackBold: TcxStyle;
    StyleFontRedBold: TcxStyle;
    Query: TdxMemData;
    StyleFooter: TcxStyle;
    AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler;
    AdvPanelStyler: TAdvPanelStyler;
    AdvOfficeTabSetOfficeStyler: TAdvOfficeTabSetOfficeStyler;
    StyleFontBlack: TcxStyle;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonToolBarCloseButtonClick(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionToolBarFromDateEditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarToDateEditPropertiesChange(Sender: TObject);
    procedure PopupMenuClick(Sender: TObject);
    procedure GridTableViewColumnSizeChanged(Sender: TcxGridTableView; AColumn: TcxGridColumn);
    procedure GridBandedTableViewBandSizeChanged(Sender: TcxGridBandedTableView; ABand: TcxGridBand);
    procedure ConditionToolBarEditPropertiesChange(Sender: TObject);
    procedure EditStyleControllerStyleChanged(Sender: TObject);
    procedure ConditionToolBarFromDateEditPropertiesEditValueChanged(
      Sender: TObject);

  private
    FisChanged       : Boolean;
    isGridSizeChanged: Boolean;
    GridViews        : array of TcxGridTableView;
    StartTime        : TDateTime;
  protected
    isLoading  : Boolean;
    DefaultDate: TDefaultDate;
    HelpURL    : string;

    procedure ShowMsg(aMessage: string = ''; aError: Boolean = false; aDisplaySecond: Integer = 10);
    function  GetActiveControl: TWinControl;
    procedure ClearEdit; virtual;
    procedure ClearGrid; virtual;
    procedure ResetEditProperties;

    function  ExecQuery(aSQL: string; aParam:array of Variant; aExecute:Boolean=true;aURL:String=''):Boolean;
    function  OpenQuery(aSQL: string; aParam: array of Variant; aAutoClose: Boolean = false;aURL:String=''): Boolean;
    function  OpenQueryEx(aSQL: string; aParam: array of Variant; aGrid: TcxGridTableView; aClear:Boolean=true;aURL:String=''): Boolean;
    procedure FinishQuery;

    procedure LoadGridColSize(aGrid: TcxGridTableView);
    procedure SaveGridColSize(aGrid: TcxGridTableView);

    procedure SetChanged(aChanged: Boolean); virtual;
    property  isChanged: Boolean read FisChanged write SetChanged;
    procedure FormClear; virtual;
    procedure FormClearMessage(var Message:TMessage); message WM_USER_CLEAR;
  end;

implementation

uses
  Main, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TInheritForm.FormCreate(Sender: TObject);
var
  vIndex ,vCol: Integer;
  vPopMenuItem: TMenuItem;
  vGridName :String;
begin
  vGridName := '';
  for vIndex := 0 to ComponentCount-1 do
    if Components[vIndex] is TcxGridTableView then
      vGridName := vGridName + Format('''%s'',',[Name + TcxGridTableView(Components[vIndex]).Name]);
  try
    if vGridName <> '' then
    begin
      vGridName := '('+LeftStr(vGridName, Length(vGridName)-1)+') ';
      for vIndex := 0 to ComponentCount-1 do
        if Components[vIndex] is TcxGridTableView then
        begin
            LoadGridColSize(TcxGridTableView(Components[vIndex]));

          // 팝업메뉴를 설정할 그리드 배열 설정
          SetLength(GridViews, Length(GridViews)+1);
          GridViews[Length(GridViews)-1] := TcxGridTableView(Components[vIndex]);
          // 그리드에 원래 지정된 팝업메뉴가 없을 때
          if GridViews[Length(GridViews)-1].PopupMenu = nil then
          begin
            // 그리드 팝업메뉴 작성
            GridViews[Length(GridViews)-1].PopupMenu     := TPopupMenu.Create(Self);
            GridViews[Length(GridViews)-1].PopupMenu.Tag := Length(GridViews)-1;
            TPopupMenu(GridViews[Length(GridViews)-1].PopupMenu).AutoHotkeys := maManual;
            for vCol :=0 to GridViews[Length(GridViews)-1].ColumnCount-1 do
            begin
              // Tag 98은 칼럼 사이즈만 저장하고 Visible는 저장하지 않는다
              if (GridViews[Length(GridViews)-1].Columns[vCol].Tag = 98) or (GridViews[Length(GridViews)-1].Columns[vCol].Tag = 99) then
                Continue;

              if (GridViews[Length(GridViews)-1] is TcxGridBandedTableView) and (TcxGridBandedTableView(GridViews[Length(GridViews)-1]).Columns[vCol].Position.BandIndex >= 0) then
              begin
                vPopMenuItem         := TMenuItem.Create(GridViews[Length(GridViews)-1].PopupMenu);
                vPopMenuItem.Caption := TcxGridBandedTableView(GridViews[Length(GridViews)-1]).Columns[vCol].Position.Band.Caption + '-'+ GridViews[Length(GridViews)-1].Columns[vCol].Caption;
              end
              else
              begin
                //밴드의 Visible 가 false 이면 Column 도 보이지 않는다
                if (GridViews[Length(GridViews)-1] is TcxGridBandedTableView) and (TcxGridBandedTableView(GridViews[Length(GridViews)-1]).Columns[vCol].Position.BandIndex >= 0)
                  and not TcxGridBandedTableView(GridViews[Length(GridViews)-1]).Columns[vCol].Position.Band.Visible then Continue;
                vPopMenuItem         := TMenuItem.Create(GridViews[Length(GridViews)-1].PopupMenu);
                vPopMenuItem.Caption := GridViews[Length(GridViews)-1].Columns[vCol].Caption;
              end;

              vPopMenuItem.Tag     := vCol;
              vPopMenuItem.Checked := GridViews[Length(GridViews)-1].Columns[vCol].Visible;
              vPopMenuItem.OnClick := PopupMenuClick;
              TPopupMenu(GridViews[Length(GridViews)-1].PopupMenu).Items.Add(vPopMenuItem);
            end;
          end;

          // 칼럼 크기 변경 이벤트를 지정한다
          TcxGridTableView(Components[vIndex]).OnColumnSizeChanged       := GridTableViewColumnSizeChanged;
          if Components[vIndex] is TcxGridBandedTableView then
            TcxGridBandedTableView(Components[vIndex]).OnBandSizeChanged := GridBandedTableViewBandSizeChanged;
        end;
    end;
  finally
    FinishQuery;
  end;
  if WindowState <> wsMaximized then
    WindowState := wsMaximized;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TInheritForm.FormShow(Sender: TObject);
begin
  // 조건 툴바에 보이는 것이 없으면 툴바 자체를 숨긴다
  ConditionToolBar.Visible := ConditionToolBarDateLabel.Visible or
                              ConditionToolBarFromDateEdit.Visible or
                              ConditionToolBarComboBox.Visible or
                              ConditionToolBarEdit.Visible;

  // 기본 조회 날짜를 지정한다
  case DefaultDate of
    ddLastWeek   : ConditionToolBarFromDateEdit.Date := IncWeek (Date, -1) + 1;
    ddMonthFirst : ConditionToolBarFromDateEdit.Date := StartOfTheMonth(Date);
    ddLastMonth  : ConditionToolBarFromDateEdit.Date := IncMonth(Date, -1) + 1;
    ddLastYear   : ConditionToolBarFromDateEdit.Date := IncYear (Date, -1) + 1;
    ddNowMonth   : ConditionToolBarFromDateEdit.Date := StartOfTheMonth(now());
    else           ConditionToolBarFromDateEdit.Date := Date;
  end;
  case DefaultDate of
    ddNextWeek   : ConditionToolBarToDateEdit.Date   := IncWeek (Date, 1) - 1;
    ddNextMonth  : ConditionToolBarToDateEdit.Date   := IncMonth(Date, 1) - 1;
    ddNowMonth   : ConditionToolBarToDateEdit.Date   := EndOfTheMonth(now());
    else           ConditionToolBarToDateEdit.Date   := Date;
  end;
end;
//------------------------------------------------------------------------------
// 폼 크기를 변경할 때
procedure TInheritForm.FormResize(Sender: TObject);
begin
  // 툴바 조건이 너무 길면 툴바를 두줄로, 짧으면 한 줄로 만든다
  if ToolBarDockPanel.Width >= ConditionToolBar.Width + ButtonToolBar.Width then
    ButtonToolBar.Top := 1
  else
    ButtonToolBar.Top := 33;
  // 버튼 툴바를 화면 오른쪽으로 붙인다
  ButtonToolBar.Left  := ToolBarDockPanel.Width-ButtonToolBar.Width;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TInheritForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // 메모, 그리드, 트리가 아니면 포커스 이동 키보드 이벤트를 타게 한다
  if (GetActiveControl <> nil) and
     (not (GetActiveControl is TcxMemo)) and
//     (not (GetActiveControl is TcxComboBox)) and
     (not (GetActiveControl is TcxGridSite)) and
     ((GetActiveControl.Parent <> nil) and (not (GetActiveControl.Parent is TcxGridSite))) and
     ((GetActiveControl.Parent <> nil) and (GetActiveControl.Parent.Parent <> nil) and (not (GetActiveControl.Parent.Parent is TcxGridSite))) and
     (not (GetActiveControl is TcxTreeView)) then
    case Key of
      VK_Return : SelectNext(TWinControl(ActiveControl), true,  true);
      VK_Down   :
      begin
        SelectNext(TWinControl(ActiveControl), true,  true);
        Key := 0;
      end;
      VK_Up     :
      begin
        SelectNext(TWinControl(ActiveControl), false, true);
        Key := 0;
      end;
    end;
end;
//------------------------------------------------------------------------------
procedure TInheritForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
//사용용도를 몰라 주석처리
{  if Key = #27 then
    Key := #0
  else if Key = #13 then
  begin
    if (GetActiveControl <> nil) and
       (not (GetActiveControl is TcxMemo)) and
       (not (GetActiveControl is TcxGridSite)) and
       ((GetActiveControl.Parent <> nil) and (GetActiveControl.Parent.Parent <> nil) and (not (GetActiveControl.Parent.Parent is TcxGridSite))) and
       (not (GetActiveControl is TcxTreeView)) then
      Key := #0;
  end;
}
end;
//------------------------------------------------------------------------------
// 폼을 닫기 전
procedure TInheritForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not isChanged or
              AskBox(Format('[%s]'#13'변경된 자료가 있습니다.'#13'저장하지 않고 종료하시겠습니까?', [Caption]));
end;
//------------------------------------------------------------------------------
// 폼을 닫을 때
procedure TInheritForm.FormActivate(Sender: TObject);
begin
  ShowMsg('', true);
end;

procedure TInheritForm.FormClear;
begin
  ClearGrid;
  ClearEdit;
  isChanged := false;
  FormCreate(application);
  FormShow(self);
  FormActivate(self);

end;

procedure TInheritForm.FormClearMessage(var Message: TMessage);
begin
  FormClear;
end;

procedure TInheritForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  vIndex: Integer;
begin
  // 변경된 값을 DB에 저장한다
  if isGridSizeChanged then
    for vIndex := 0 to ComponentCount-1 do
      if (Components[vIndex] is TcxGridTableView) then
        SaveGridColSize(TcxGridTableView(Components[vIndex]));

  // 열려있는 쿼리들을 정리한다
  FinishQuery;

  Action := caFree;

  // 자식 폼이 종료되었다는 메시지를 보낸다
  SendMessage(ExtremeMainForm.Handle, WM_MDI_CLOSE, 0, LParam(PChar(Name)));
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 시작 날짜 값을 바꿀 때
procedure TInheritForm.ConditionToolBarEditPropertiesChange(Sender: TObject);
begin
  ClearGrid;
end;

procedure TInheritForm.ConditionToolBarFromDateEditPropertiesChange(Sender: TObject);
begin
  if ConditionToolBarToDateEdit.Visible and isDate(ConditionToolBarFromDateEdit.Text) then
    if ConditionToolBarToDateEdit.Date < ConditionToolBarFromDateEdit.CurrentDate then
      ConditionToolBarToDateEdit.Date := ConditionToolBarFromDateEdit.CurrentDate;
  ClearGrid;
end;
procedure TInheritForm.ConditionToolBarFromDateEditPropertiesEditValueChanged(
  Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
// 종료 날짜 값을 바꿀 때
procedure TInheritForm.ConditionToolBarToDateEditPropertiesChange(Sender: TObject);
begin
  if ConditionToolBarFromDateEdit.Visible and isDate(ConditionToolBarToDateEdit.Text) then
    if ConditionToolBarFromDateEdit.Date > ConditionToolBarToDateEdit.CurrentDate then
      ConditionToolBarFromDateEdit.Date := ConditionToolBarToDateEdit.CurrentDate;
  ClearGrid;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 닫기 버튼
procedure TInheritForm.ButtonToolBarCloseButtonClick(Sender: TObject);
begin
  // 폼을 닫는다
  Close;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TInheritForm.EditPropertiesChange(Sender: TObject);
begin
  if not isLoading then
  begin
    if Sender is TcxColorComboBox then Exit;
    if Sender is TcxCustomEdit then
    begin
      // 값이 바뀌었을 때만 바뀐 것으로 처리한다
      if (Sender is TcxCheckBox) or
         (Sender is TcxComboBox) or
         (Sender is TcxDateEdit) or
         (Sender is TcxRadioGroup) or
         ((TcxCustomEdit(Sender).EditingValue <> null) and (TcxCustomEdit(Sender).EditValue <> TcxCustomEdit(Sender).EditingValue)) then
      begin
        isChanged := true;
        if TcxCustomEdit(Sender).Style.TextColor = clWindowText then
          TcxCustomEdit(Sender).Style.TextColor := clNavy;
        TcxCustomEdit(Sender).Style.TextStyle   := [fsBold];
      end;
    end
    else
      isChanged := true;
  end;
end;
//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TInheritForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vDisplayValue: AnsiString;
begin
  vDisplayValue := AnsiString(DisplayValue);

  if (Sender is TcxCustomTextEdit) and
     (TcxCustomTextEdit(Sender).Properties.MaxLength > 0) and
     (Length(vDisplayValue) > TcxCustomTextEdit(Sender).Properties.MaxLength) then
  begin
    DisplayValue := CopyStr(TcxCustomTextEdit(Sender).Text, 1, TcxCustomTextEdit(Sender).Properties.MaxLength);
    ShowMsg('입력한 글자가 너무 많아 뒷부분을 잘라냈습니다.');
  end;
end;
procedure TInheritForm.EditStyleControllerStyleChanged(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------
// 입력창 내용 초기화
procedure TInheritForm.ClearEdit;
var
  vIndex: Integer;
begin
  for vIndex := 0 to ComponentCount-1 do
  begin
    if (Components[vIndex].Tag = 99) or  // Tag가 99이면 초기화하지 않는다
       ((Components[vIndex] is TWinControl) and (TWinControl(Components[vIndex]).Parent = ConditionToolBar)) then
      Continue;

    if Components[vIndex] is TcxTextEdit then
      (Components[vIndex] as TcxTextEdit).Clear
    else if (Components[vIndex] is TcxCombobox) and (TcxComboBox(Components[vIndex]).Properties.Items.Count > 0) then
      (Components[vIndex] as TcxComboBox).ItemIndex := IfThen(TcxComboBox(Components[vIndex]).Tag = 0, 0, -1)
    else if Components[vIndex] is TcxDateEdit then
      (Components[vIndex] as TcxDateEdit).Clear
    else if Components[vIndex] is TcxButtonEdit then
      (Components[vIndex] as TcxButtonEdit).Clear
    else if (Components[vIndex] is TcxCurrencyEdit) then
      (Components[vIndex] as TcxCurrencyEdit).Value := 0
    else if (Components[vIndex] is TcxMemo) then
      (Components[vIndex] as TcxMemo).Clear
    else if (Components[vIndex] is TcxMaskEdit) then
      (Components[vIndex] as TcxMaskEdit).Clear
    else if (Components[vIndex] is TcxCheckBox) then
      (Components[vIndex] as TcxCheckBox).Checked := false
    else if (Components[vIndex] is TcxSpinEdit) then
      (Components[vIndex] as TcxSpinEdit).Value := (Components[vIndex] as TcxSpinEdit).Properties.MinValue
    else if (Components[vIndex] is TcxRadioGroup) then
      (Components[vIndex] as TcxRadioGroup).ItemIndex := 0
    else if (Components[vIndex] is TcxImage) and ((Components[vIndex] as TcxImage).Hint <> '99') then
    begin
      (Components[vIndex] as TcxImage).Picture := nil;
      (Components[vIndex] as TcxImage).Tag     := 0;
    end;

  end;
  ResetEditProperties;
  isChanged := false;
end;
procedure TInheritForm.ClearGrid;
var vIndex :Integer;
begin
  for vIndex := 0 to ComponentCount-1 do
  begin
    if Components[vIndex] is TcxGridTableView then
      TcxGridTableView(Components[vIndex]).DataController.RecordCount := 0
    else if Components[vIndex] is TcxGridCardView then
      TcxGridCardView(Components[vIndex]).DataController.RecordCount := 0;
  end;
end;

//------------------------------------------------------------------------------
// 입력창 속성 초기화
procedure TInheritForm.ResetEditProperties;
var
  vIndex: Integer;
begin
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex].Tag <> 99) and
       (Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Style.TextStyle = [fsBold]) then
    begin
      if TcxCustomEdit(Components[vIndex]).Style.TextColor = clNavy then
        TcxCustomEdit(Components[vIndex]).Style.TextColor := clWindowText;
      TcxCustomEdit(Components[vIndex]).Style.TextStyle   := [];
    end;
end;

//==============================================================================
// 그리드, 그리드 팝업메뉴
//------------------------------------------------------------------------------
// 그리드 칼럼 크기를 변경할 때
procedure TInheritForm.GridTableViewColumnSizeChanged(Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  isGridSizeChanged := true;
end;
//------------------------------------------------------------------------------
// 그리드 밴드 크기를 변경할 때
procedure TInheritForm.GridBandedTableViewBandSizeChanged(Sender: TcxGridBandedTableView; ABand: TcxGridBand);
begin
  isGridSizeChanged := true;
end;
//------------------------------------------------------------------------------
// 그리드 팝업메뉴를 선택할 때
procedure TInheritForm.PopupMenuClick(Sender: TObject);
var
  vIndex, vCount: Integer;
  vGridView     : TcxGridTableView;
begin
  vGridView := GridViews[TMenuItem(Sender).Owner.Tag];
  vCount    := 0;

  // 칼럼 개수를 구한다
  for vIndex := 0 to vGridView.ColumnCount-1 do
    if vGridView.Columns[vIndex].Visible then
      Inc(vCount);
  if (vCount < 2) and (Sender as TMenuItem).Checked then
    Exit;

  // 칼럼 선택을 토글한다
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  vGridView.Columns[(Sender as TMenuItem).Tag].Visible := (Sender as TMenuItem).Checked;
//  vGridView.Tag := 999;
  isGridSizeChanged := true;
end;
//------------------------------------------------------------------------------
// 그리드 칼럼 크기 불러오기
procedure TInheritForm.LoadGridColSize(aGrid: TcxGridTableView);
  function GetColumCount(aGrid:TcxGridTableView; aIndex:Integer) :Boolean;
  var vIndex : Integer;
  begin
    Result := false;
    for vIndex := 0 to aGrid.ColumnCount - 1 do
    begin
      if not TcxGridBandedTableView(aGrid).Columns[vIndex].Visible then Continue;
      if TcxGridBandedTableView(aGrid).Columns[vIndex].Position.BandIndex = aIndex then
      begin
        Result := true;
        Break;
      end;
    end;
  end;
var
  vIndex :Integer;
  vCount :Integer;
begin
  if aGrid.Tag <> 99 then
    Exit;

  if DM.GridData.RecordCount = 0 then Exit;

  vCount := 0;
  try
    try
      if aGrid is TcxGridBandedTableView then
        TcxGridBandedTableView(aGrid).Controller.BeginUpdate;
      aGrid.Controller.BeginUpdate;

      if DM.GridData.Locate('NM_GRID',Name + aGrid.Name, [loCaseInsensitive] ) then
      begin
        // 밴드 크기 설정
        if aGrid is TcxGridBandedTableView then
        begin
          for vIndex := 0 to TcxGridBandedTableView(aGrid).Bands.Count-1 do
          begin
            if TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Tag = 99 then
              TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Visible := false
            else
            begin
              TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Visible := true;
              TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Width   := DM.GridData.FieldByName('BAND'+IntToStr(vIndex+1)).AsInteger;
            end;
          end;
        end;

        // 그리드 칼럼 크기 설정, Tag가 98은 무조건 보인다
        for vIndex := 0 to aGrid.ColumnCount - 1 do
        begin
          if ((aGrid.Columns[vIndex].Tag = 99) or (DM.GridData.FieldByName('COLUM'+IntToStr(vIndex+1)).AsInteger = 0)) and (aGrid.Columns[vIndex].Tag <> 98) then
            aGrid.Columns[vIndex].Visible := false
          else
          begin
            aGrid.Columns[vIndex].Visible := true;
            aGrid.Columns[vIndex].Width   := DM.GridData.FieldByName('COLUM'+IntToStr(vIndex+1)).AsInteger;
            if aGrid.Columns[vIndex].Width = 64 then
              aGrid.Columns[vIndex].Width := 70;
            if aGrid.Columns[vIndex].Width > 1000 then
              aGrid.Columns[vIndex].Width := 100;
            Inc(vCount);
          end;
        end;

        //보이는 칼럼이 하나도 없으면
        if vCount = 0 then
        begin
          for vIndex := 0 to aGrid.ColumnCount - 1 do
            if aGrid.Columns[vIndex].Tag <> 99 then
            begin
              aGrid.Columns[vIndex].Visible := true;
            if aGrid.Columns[vIndex].Width > 1000 then
              aGrid.Columns[vIndex].Width := 100;
            if aGrid.Columns[vIndex].Width = 64 then
              aGrid.Columns[vIndex].Width := 70;
            end;
        end;
      end
      else
      begin
        // 밴드 크기 설정
        if aGrid is TcxGridBandedTableView then
        begin
          for vIndex := 0 to TcxGridBandedTableView(aGrid).Bands.Count-1 do
          begin
            if TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Tag = 99 then
              TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Visible := false
            else
            begin
              TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Visible := true;
            end;
          end;
        end;

        // 그리드 칼럼 크기 설정, Tag가 98은 무조건 보인다
        for vIndex := 0 to aGrid.ColumnCount - 1 do
        begin
          if (aGrid.Columns[vIndex].Tag = 99) and (aGrid.Columns[vIndex].Tag <> 98) then
            aGrid.Columns[vIndex].Visible := false
          else
          begin
            aGrid.Columns[vIndex].Visible := true;
            if aGrid.Columns[vIndex].Width > 1000 then
              aGrid.Columns[vIndex].Width := 100;
            if aGrid.Columns[vIndex].Width = 64 then
              aGrid.Columns[vIndex].Width := 70;
            Inc(vCount);
          end;
        end;

        //보이는 칼럼이 하나도 없으면
        if vCount = 0 then
        begin
          for vIndex := 0 to aGrid.ColumnCount - 1 do
            if aGrid.Columns[vIndex].Tag <> 99 then
            begin
              aGrid.Columns[vIndex].Visible := true;
            if aGrid.Columns[vIndex].Width > 1000 then
              aGrid.Columns[vIndex].Width := 100;
            if aGrid.Columns[vIndex].Width = 64 then
              aGrid.Columns[vIndex].Width := 70;
            end;
        end;
      end;
    except
    end;
    //칼럼이 없는 밴드는 안보이게한다
    if aGrid is TcxGridBandedTableView and (aGrid.Tag = 99) then
    begin
      for vIndex := 0 to TcxGridBandedTableView(aGrid).Bands.Count-1 do
        TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Visible := GetColumCount(aGrid, vIndex);
    end;
  finally
    if aGrid is TcxGridBandedTableView then
      TcxGridBandedTableView(aGrid).Controller.EndUpdate;

    aGrid.Controller.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 칼럼 크기 저장
procedure TInheritForm.SaveGridColSize(aGrid: TcxGridTableView);
var
  vIndex: Integer;
begin
  if aGrid.Tag <> 99 then
    Exit;

  try
    if not DM.GridData.Active then
      DM.GridData.Open;
    // 칼럼
    if (DM.GridData.RecordCount > 0) and (DM.GridData.Locate('NM_GRID',Name + aGrid.Name, [loCaseInsensitive] )) then
      DM.GridData.Edit
    else
    begin
      DM.GridData.Append;
      DM.GridData.FieldByName('CD_HEAD').AsString  := HeadStoreCode;
      DM.GridData.FieldByName('CD_STORE').AsString := StoreCode;
      DM.GridData.FieldByName('NM_GRID').AsString  := Name + aGrid.Name;
      DM.GridData.FieldByName('CD_SAWON').AsString := UserCode;
    end;
    for vIndex := 0 to aGrid.ColumnCount-1 do
      if aGrid.Columns[vIndex].Tag = 99 then
        Continue
      else if aGrid.Columns[vIndex].Visible then
        DM.GridData.FieldByName(Format('COLUM%d', [vIndex+1])).Value := aGrid.Columns[vIndex].Width
      else
        DM.GridData.FieldByName(Format('COLUM%d', [vIndex+1])).Value := 0;
    // 밴드
    if aGrid is TcxGridBandedTableView then
      for vIndex := 0 to TcxGridBandedTableView(aGrid).Bands.Count-1 do
        if TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Tag = 99 then
          Continue
        else if TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Visible then
          DM.GridData.FieldByName(Format('BAND%d', [vIndex+1])).Value := TcxGridBandedTableView(aGrid).Bands.Items[vIndex].Width;
    DM.GridData.FieldByName('ROW_STATE').AsString  := rsInsert;
    DM.GridData.Post;
  except
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 상태 표시줄에 메시지 표시
procedure TInheritForm.ShowMsg(aMessage: string; aError: Boolean; aDisplaySecond: Integer);
begin
  ExtremeMainForm.ShowMsg(aMessage, aError, aDisplaySecond);
end;
//------------------------------------------------------------------------------
// 변경 여부 설정
function TInheritForm.ExecQuery(aSQL: string; aParam:array of Variant; aExecute:Boolean;aURL:String):Boolean;
var vResult,
    vURL, vDBName,
    vSQL :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  Result := false;
  if not DM.CheckLogOut then Exit;
  if (High(aParam) >= 0) then
  begin
    vSQL    := ConvertSQL(aSQL, aParam);
    TempSQL := TempSQL + vSQL;
  end
  else
  begin
    if TempSQL = aSQL then
      TempSQL := aSQL
    else
      TempSQL := TempSQL + aSQL;
  end;

  if (TempSQL = '') or not aExecute then
    Exit;

  vSQL := Replace(TempSQL, #9, '');
  vSQL := Replace(vSQL, '\''','\\''');
  vSQL := Replace(vSQL, #$D#$A,'#$D#$A');

  try
    vRESTClient   := TRESTClient.Create(nil);
    vURL    := Ifthen(aURL='',CopyPos(RestDBURL,'|',0), CopyPos(aURL,'|',0));
    vDBName := Ifthen(aURL='',CopyPos(RestDBURL,'|',1), CopyPos(aURL,'|',1));
    vRESTClient.BaseURL := vURL+'Action_Excute';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    vRESTRequest.Timeout        := 50000;
    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',DM.GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);

//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    vRESTRequest.Params.ParameterByName('SQL').Value     := DM.GetEncrypt(vRESTClient.BaseURL,vSQL);
//    if vDBName <> '' then
//    begin
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//    end;
    try
      StartTime := Now();
      vRESTRequest.Execute;

      TempSQL := '';
      vRESTResponse.GetSimpleValue('RESULT',vResult);
      if Copy(vResult,1,5) = 'ERROR' then
      begin
        MsgBox(CopyPos(vResult, splitColumn, 1));
        LogSave('E',Self.Caption, 'ExecQuery', vSQL, Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        LogSave('E',Self.Caption, 'ExecQuery-1', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      end;
    end;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

function TInheritForm.OpenQuery(aSQL: string;
  aParam: array of Variant; aAutoClose: Boolean;aURL:String): Boolean;
var  vData,
    vURL, vDBName,
    vFieldName,
    vFieldType,
    vResult,
    vColData,
    vResponse :String;
    vIndex, vI, vJ :Integer;
    vRow, vCol, vFieldNameList, vFieldTypeList : TStringList;
    vField: TField;
    vSQL, vTemp :String;
    vBoldField : TBlobField;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  Result := false;
  if not DM.CheckLogOut then Exit;
  try
    Screen.Cursor := crSQLWait;
    vSQL := aSQL;
    for vIndex := High(aParam) downto 0 do
    begin
      case VarType(aParam[vIndex]) of
        varInteger : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',NVL(aParam[vIndex],0)));
        varDouble,
        varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0.00',NVL(aParam[vIndex],0.0)));
        varDate     : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime)',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
        else
        begin
          vTemp := Replace(NVL(aParam[vIndex],''),'''','＇');
          vTemp := Replace(vTemp, ';','');
          vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[vTemp]));
        end;
      end;
    end;
    vSQL := Replace(vsQL, '\''','\\''');

    StartTime:= Now();
    vRESTClient   := TRESTClient.Create(nil);
    vURL    := Ifthen(aURL='',CopyPos(RestDBURL,'|',0), CopyPos(aURL,'|',0));
    vDBName := Ifthen(aURL='',CopyPos(RestDBURL,'|',1), CopyPos(aURL,'|',1));

    vRESTClient.BaseURL := vURL+'Action_Select';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    vRESTRequest.Timeout        := 50000;
    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',DM.GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);

//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    vRESTRequest.Params.ParameterByName('SQL').Value     := DM.GetEncrypt(vRESTClient.BaseURL,vSQL);
//    if vDBName <> '' then
//    begin
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//    end;

    Query.Close;
    Query.Fields.Clear;
    vRESTRequest.Execute;

    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if Copy(vResult,1,5) = 'ERROR' then
    begin
      MsgBox(CopyPos(vResult, splitColumn, 1));
      LogSave('E',Self.Caption, 'OpenQuery', vSQL, Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    if vData = '' then Exit;
    vRESTResponse.GetSimpleValue('FIELD_NAME', vFieldName);
    vRESTResponse.GetSimpleValue('FIELD_TYPE', vFieldType);

    vData := Replace(vData,'"','〃');     //아주중요 Split 오류
    vData := Replace(vData,'＇','''');
    vData := Replace(vData,andChar, '&');
    vData := StringReplace(vData,'#$D#$A',#$D#$A,[rfReplaceAll]);//Replace(vData, '#$D#$A',#$D#$A);

    //데이터셋에 필드구조를 만든다
    vFieldNameList := TStringList.Create;
    Split(vFieldName, splitColumn, vFieldNameList);

    vFieldTypeList := TStringList.Create;
    Split(vFieldType, splitColumn, vFieldTypeList);

    try
      for vIndex := 0 to vFieldNameList.Count-1 do
      begin
        if vFieldTypeList[vIndex] = 'S' then
        begin
          vField := TStringField.Create(Query);
          vField.Size := StringFieldSize;
        end
        else if vFieldTypeList[vIndex] = 'C' then
          vField := TCurrencyField.Create(Query)
        else if vFieldTypeList[vIndex] = 'D' then
          vField := TDateTimeField.Create(Query)
        else if vFieldTypeList[vIndex] = 'I' then
          vField := TIntegerField.Create(Query)
        else if vFieldTypeList[vIndex] = 'G' then
          vField := TGraphicField.Create(Query)
        else if vFieldTypeList[vIndex] = 'B' then
          vField := TBlobField.Create(Query);

        vField.FieldName := vFieldNameList[vIndex];
        vField.DataSet   := Query;
      end;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        LogSave('E',Self.Caption, 'OpenQuery-1', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
    end;

    vRow := TStringList.Create;
    vCol := TStringList.Create;
    Query.Open;
    Split(vData, splitRecord, vRow);
    try
      for vI := 0 to vRow.Count-1 do
      begin
        Split(vRow[vI], splitColumn, vCol);

        Query.Append;
        for vJ := 0 to vCol.Count-1 do
        begin
          vColData := Replace(vCol[vJ],'〃','"');
          case Query.Fields[vJ].DataType of
            DB.ftSmallint,
            DB.ftInteger,
            DB.ftWord,
            DB.ftShortint   :
            begin
              if (vColData = 'null') or (vColData = '') then
                Query.Fields[vJ].AsInteger  := 0
              else
                Query.Fields[vJ].AsInteger  := StrToIntDef(vColData,0);
            end;
            DB.ftFloat,
            DB.ftCurrency,
            DB.ftExtended   :
            begin
              if (vColData = 'null') or (vColData = '') then
                Query.Fields[vJ].AsCurrency  := 0
              else
                Query.Fields[vJ].AsCurrency  := StrToCurr(vColData);
            end;
            DB.ftDate,
            DB.ftTime,
            DB.ftDateTime    :
            begin
              if  (vColData = '') or (vColData = 'null') or (vColData = '0000-00-00 00:00:00') then
                Query.Fields[vJ].AsString   := ''
              else
                Query.Fields[vJ].AsDateTime := StrToDateTime(vColData);
            end;
            DB.ftBlob        : Query.Fields[vJ].AsBytes    := DecodeBase64(vColData);
              else
              begin
                if vColData = 'null' then
                  Query.Fields[vJ].AsString   := ''
                else
                  Query.Fields[vJ].AsString   := vColData;
              end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        LogSave('E',Self.Caption, 'OpenQuery-2', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      end;
    end;

    Query.Post;
    Query.First;
    Result := Query.RecordCount > 0;
    if aAutoClose then
      Query.Close;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    Screen.Cursor := crDefault;
    if Assigned(vFieldNameList) then
      vFieldNameList.Free;
    if Assigned(vFieldTypeList) then
      vFieldTypeList.Free;
    if Assigned(vRow) then
      vRow.Free;
    if Assigned(vCol) then
      vCol.Free;
  end;
end;

function TInheritForm.OpenQueryEx(aSQL: string; aParam: array of Variant;
  aGrid: TcxGridTableView; aClear: Boolean;aURL:String): Boolean;
var  vData,
    vFieldName,
    vFieldType,
    vResult,
    vColData,
    vURL, vDBName,
    vResponse :String;
    vIndex, vI, vJ :Integer;
    vRow, vCol, vFieldNameList, vFieldTypeList : TStringList;
    vField: TField;
    vSQL, vTemp :String;
    vBoldField : TBlobField;
    vStartTime :TDateTime;
    vErrorCount :Integer;
    vColumnIndex :Integer;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
label Retry;
begin
  Result := false;
  vErrorCount := 0;
  try
    Screen.Cursor := crSQLWait;
    vSQL := aSQL;
    for vIndex := High(aParam) downto 0 do
    begin
      case VarType(aParam[vIndex]) of
        varInteger : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',NVL(aParam[vIndex],0)));
        varDouble,
        varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0.00',NVL(aParam[vIndex],0.0)));
        varDate     : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime)',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
        else
        begin
          vTemp := Replace(NVL(aParam[vIndex],''),'''','＇');
          vTemp := Replace(vTemp, ';','');
          vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[vTemp]));
        end;
      end;
    end;
    vSQL := Replace(vsQL, '\''','\\''');

    Retry:
    vStartTime := Now();
    vRESTClient   := TRESTClient.Create(Self);
    vURL    := Ifthen(aURL='',CopyPos(RestDBURL,'|',0), CopyPos(aURL,'|',0));
    vDBName := Ifthen(aURL='',CopyPos(RestDBURL,'|',1), CopyPos(aURL,'|',1));
    vRESTClient.BaseURL := vURL+'Action_Select';

    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(Self);
    vRESTResponse := TRESTResponse.Create(Self);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    vRESTRequest.Timeout        := 50000;
    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',DM.GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);


//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'USER_DB';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//    vItem.ContentType := ctNone;
//    vRESTRequest.Params.ParameterByName('SQL').Value := DM.GetEncrypt(vRESTClient.BaseURL,vSQL);
//    if vDBName <> '' then
//    begin
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//    end;
    try
      vRESTRequest.Execute;
      vErrorCount := 0;
    except
      on E: Exception do
      begin
        //서버에 연결오류가 5초 이내에 발생했을때
        if (SecondsBetween(Now(), vStartTime) < 5) and (vErrorCount = 0) and (Pos('서버에 연결할 수 없습니다' ,E.Message) > 0) then
          Inc(vErrorCount)
        else
        begin
          LogSave('E',Self.Caption, 'OpenQueryEx-1', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
          ErrBox(E.Message);
          Exit;
        end;
      end;
    end;

    if vErrorCount = 1 then
    begin
      vRESTClient.DisConnect;
      FreeAndNil(vRESTResponse);
      FreeAndNil(vRESTRequest);
      FreeAndNil(vRESTClient);
      Sleep(500);
      Goto Retry;
    end;

    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if Copy(vResult,1,5) = 'ERROR' then
    begin
      LogSave('E',Self.Caption, 'OpenQueryEx-2', vSQL, Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      MsgBox(CopyPos(vResult, splitColumn, 1));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    if vData = '' then Exit;
    vRESTResponse.GetSimpleValue('FIELD_NAME', vFieldName);
    vRESTResponse.GetSimpleValue('FIELD_TYPE', vFieldType);

    vData := Replace(vData,'"','〃');     //아주중요 Split 오류
    vData := Replace(vData,'＇','''');
    vData := Replace(vData,andChar, '&');
    vData := StringReplace(vData,'#$D#$A',#$D#$A,[rfReplaceAll]);//Replace(vData, '#$D#$A',#$D#$A);

    //데이터셋에 필드구조를 만든다
    Query.Close;
    Query.Fields.Clear;
    vFieldNameList := TStringList.Create;
    Split(vFieldName, splitColumn, vFieldNameList);

    vFieldTypeList := TStringList.Create;
    Split(vFieldType, splitColumn, vFieldTypeList);

    try
      for vIndex := 0 to vFieldNameList.Count-1 do
      begin
        if vFieldTypeList[vIndex] = 'S' then
        begin
          vField := TStringField.Create(Query);
          vField.Size := 3000;
        end
        else if vFieldTypeList[vIndex] = 'C' then
          vField := TCurrencyField.Create(Query)
        else if vFieldTypeList[vIndex] = 'D' then
          vField := TDateTimeField.Create(Query)
        else if vFieldTypeList[vIndex] = 'I' then
          vField := TIntegerField.Create(Query)
        else if vFieldTypeList[vIndex] = 'G' then
          vField := TGraphicField.Create(Query)
        else if vFieldTypeList[vIndex] = 'B' then
          vField := TBlobField.Create(Query);

        vField.FieldName := vFieldNameList[vIndex];
        vField.DataSet   := Query;
      end;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        Exit;
      end;
    end;


    vRow := TStringList.Create;
    vCol := TStringList.Create;
    aGrid.DataController.BeginUpdate;
    if aClear then
      aGrid.DataController.RecordCount := 0;
    Split(vData, splitRecord, vRow);
    try
      for vI := 0 to vRow.Count-1 do
      begin
        Split(vRow[vI], splitColumn, vCol);

        aGrid.DataController.AppendRecord;
        for vJ := 0 to vCol.Count-1 do
        begin
          for vIndex := 0 to aGrid.ColumnCount-1 do
          begin
            if aGrid.Columns[vIndex].DataBinding.FieldName = Query.Fields[vJ].FieldName then
            begin
              vColumnIndex := vIndex;
              Break;
            end;
          end;

          vColData := Replace(vCol[vJ],'〃','"');
          case Query.Fields[vJ].DataType of
            DB.ftSmallint,
            DB.ftInteger,
            DB.ftWord,
            DB.ftShortint   :
            begin
              if (vColData = 'null') or (vColData = '') then
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, 0)
              else
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, StrToIntDef(vColData,0));
            end;
            DB.ftFloat,
            DB.ftCurrency,
            DB.ftExtended   :
            begin
              if (vColData = 'null') or (vColData = '') then
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, 0)
              else
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, StrToCurr(vColData));
            end;
            DB.ftDate,
            DB.ftTime,
            DB.ftDateTime    :
            begin
              if  (vColData = '') or (vColData = 'null') or (vColData = '0000-00-00 00:00:00') then
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, '')
              else
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, StrToDateTime(vColData));
            end;
//            DB.ftBlob        : Query.Fields[vJ].AsBytes    := DecodeBase64(vColData);
            else
            begin
              if vColData = 'null' then
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, '')
              else
                aGrid.DataController.SetValue(aGrid.DataController.RecordCount-1, vColumnIndex, vColData);
            end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        LogSave('E',Self.Caption, 'OpenQueryEx-3', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        ErrBox(E.Message);
      end;
    end;
    Result := aGrid.DataController.RecordCount > 0;
  finally
    if Result then
      aGrid.DataController.EndUpdate;
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    Screen.Cursor := crDefault;
    if Assigned(vFieldNameList) then
      vFieldNameList.Free;
    if Assigned(vFieldTypeList) then
      vFieldTypeList.Free;
    if Assigned(vRow) then
      vRow.Free;
    if Assigned(vCol) then
      vCol.Free;
  end;
end;

procedure TInheritForm.SetChanged(aChanged: Boolean);
begin
  FisChanged := aChanged;
end;
//------------------------------------------------------------------------------
// 현재 활성화 된 컨트롤 리턴
function TInheritForm.GetActiveControl: TWinControl;
begin
  if Supports(ActiveControl, IcxInnerEditHelper) or Supports(ActiveControl, IcxContainerInnerControl) then
    Result := TcxCustomEdit(ActiveControl.Owner)
  else if ActiveControl is TcxCustomEdit then
    Result := TcxCustomEdit(ActiveControl)
  else
    Result := ActiveControl;
end;

//------------------------------------------------------------------------------
// 쿼리 닫기
procedure TInheritForm.FinishQuery;
begin
  if Query.Active then
    Query.Close;
end;

end.

