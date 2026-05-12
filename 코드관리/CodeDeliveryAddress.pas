unit CodeDeliveryAddress;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  ExtCtrls, AdvSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxCurrencyEdit, Menus,
  AdvToolBarStylers, cxLookAndFeels, cxLookAndFeelPainters, DBAccess,
  Vcl.StdCtrls, cxButtons, AdvPanel, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TCodeDeliveryAddressForm = class(TInheritEditForm)
    Class1Panel: TPanel;
    Class1Grid: TcxGrid;
    Class1GridLevel: TcxGridLevel;
    Class2Splitter: TAdvSplitter;
    Class4Panel: TPanel;
    Class4Grid: TcxGrid;
    Class4GridLevel: TcxGridLevel;
    Class3Panel: TPanel;
    Class3Grid: TcxGrid;
    Class3GridLevel: TcxGridLevel;
    Class2Panel: TPanel;
    Class2Grid: TcxGrid;
    Class2GridLevel: TcxGridLevel;
    Class4Splitter: TAdvSplitter;
    Class3Splitter: TAdvSplitter;
    Class1GridTableView: TcxGridTableView;
    Class2GridTableView: TcxGridTableView;
    Class3GridTableView: TcxGridTableView;
    Class4GridTableView: TcxGridTableView;
    Class1GridTableViewClassCode: TcxGridColumn;
    Class1GridTableViewClassName: TcxGridColumn;
    Class2GridTableViewClassCode: TcxGridColumn;
    Class2GridTableViewClassName: TcxGridColumn;
    Class3GridTableViewClassCode: TcxGridColumn;
    Class3GridTableViewClassName: TcxGridColumn;
    Class4GridTableViewClassCode: TcxGridColumn;
    Class4GridTableViewClassName: TcxGridColumn;
    ClassPopup: TPopupMenu;
    ClassPopupCopy: TMenuItem;
    ClassPopupPaste: TMenuItem;
    ClassPopupLine: TMenuItem;
    ClassPopupChangeCode: TMenuItem;
    Class1GridTableViewRealCode: TcxGridColumn;
    Class2GridTableViewRealCode: TcxGridColumn;
    Class3GridTableViewRealCode: TcxGridColumn;
    Class4GridTableViewRealCode: TcxGridColumn;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarEtcButton: TAdvGlowButton;
    ConfigPanel: TAdvPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    CourseComboBox: TcxComboBox;
    LocalComboBox: TcxComboBox;
    DamdangComboBox: TcxComboBox;
    SaveButton: TcxButton;
    Class1GridTableViewCourse: TcxGridColumn;
    Class1GridTableViewLocal: TcxGridColumn;
    Class1GridTableViewDamdang: TcxGridColumn;
    Class2GridTableViewCourse: TcxGridColumn;
    Class2GridTableViewLocal: TcxGridColumn;
    Class2GridTableViewDamdang: TcxGridColumn;
    Class3GridTableViewCourse: TcxGridColumn;
    Class3GridTableViewLocal: TcxGridColumn;
    Class3GridTableViewDamdang: TcxGridColumn;
    Class4GridTableViewCourse: TcxGridColumn;
    Class4GridTableViewLocal: TcxGridColumn;
    Class4GridTableViewDamdang: TcxGridColumn;

    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ClassGridEnter(Sender: TObject);
    procedure ClassGridExit(Sender: TObject);
    procedure Class1GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure Class2GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure Class3GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure Class1LabelClick(Sender: TObject);
    procedure Class2LabelClick(Sender: TObject);
    procedure Class3LabelClick(Sender: TObject);
    procedure Class4LabelClick(Sender: TObject);
    procedure Class1GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Class2GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Class3GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Class4GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ClassPopupPopup(Sender: TObject);
    procedure ClassPopupCopyClick(Sender: TObject);
    procedure ClassPopupPasteClick(Sender: TObject);
    procedure ClassPopupChangeCodeClick(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure ConfigPanelClose(Sender: TObject);
    procedure ButtonToolBarEtcButtonClick(Sender: TObject);

  private
    FocusedGrid: TcxGrid;
    oldFocusedGrid :TcxGrid;
    CopyedClassName: string;

    procedure SaveData(aClassCode: string = ''; aClassName: string = ''; aOldClassCode: string = '');
  protected
    function  DoDelete: Boolean; override;                      // 삭제
  end;

var
  CodeDeliveryAddressForm: TCodeDeliveryAddressForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TCodeDeliveryAddressForm.FormShow(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  // 배달지역 콤보박스 세팅
  LocalComboBox.Properties.Items.Clear;
  try
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND = ''22'' '
             +' order by CD_CODE',
              [HeadStoreCode,
               StoreCode]);
    New(vCode);
    vCode^.Data := '';
    LocalComboBox.Properties.Items.AddObject('선택안함', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      LocalComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    LocalComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;

  // 배달코스 콤보박스 세팅
  CourseComboBox.Properties.Items.Clear;
  try
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND = ''20'' '
             +' order by CD_CODE',
              [HeadStoreCode,
               StoreCode]);
    New(vCode);
    vCode^.Data := '';
    CourseComboBox.Properties.Items.AddObject('선택안함', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      CourseComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    CourseComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;

  DamdangComboBox.Properties.Items.Clear;
  try
    OpenQuery('select CD_SAWON, '
             +'       NM_SAWON  '
             +'  from MS_SAWON '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YN_USE = ''Y'' '
             +'   and CD_SAWON <> ''master'' '
             +'   and substring(EMP_WORK,4,1) = ''1'' '
             +' order by CD_SAWON',
              [HeadStoreCode,
               StoreCode]);
    New(vCode);
    vCode^.Data := '';
    DamdangComboBox.Properties.Items.AddObject('선택안함', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      DamdangComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    DamdangComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;

  // 대분류를 조회한다
  isLoading := true;
  try
    OpenQuery('select CD_ADDR, '
             +'       NM_ADDR, '
             +'       CD_COURSE, '
             +'       CD_LOCAL, '
             +'       CD_DAMDANG, '
             +'       CD_ADDR as CD_REAL '
             +'  from MS_DELIVERY_ADDR '
             +' where CD_HEAD      =:P0 '
             +'   and CD_STORE     =:P1 '
             +'   and Length(CD_ADDR) = 2 '
             +' order by CD_ADDR',
             [HeadStoreCode,
              StoreCode]);
    DM.ReadQuery(Query, Class1GridTableView);
  finally
    isLoading := false;
  end;
  if Class1Grid.Visible and Class1Grid.Enabled then
  begin
    Class1Grid.SetFocus;
    if Class1GridTableView.DataController.RecordCount > 0 then
    begin
      Class1GridTableView.Controller.FocusedRecordIndex := 0;
      Class1GridTableViewFocusedRecordChanged(Class1GridTableView, nil, nil, false);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 폼 크기를 변경할 때
procedure TCodeDeliveryAddressForm.FormResize(Sender: TObject);
begin
  inherited;

  // 그리드 크기를 조정한다
  if not Class3Panel.Visible then
    Class1Panel.Width := (self.ClientWidth - Class2Splitter.Width) div 2
  else if not Class4Panel.Visible then
  begin
    Class1Panel.Width := (self.ClientWidth - Class2Splitter.Width * 2) div 3;
    Class2Panel.Width := Class1Panel.Width;
  end
  else if Class4Panel.Visible then
  begin
    Class1Panel.Width := (self.ClientWidth - Class2Splitter.Width * 3) div 4;
    Class2Panel.Width := Class1Panel.Width;
    Class3Panel.Width := Class1Panel.Width;
  end;
  Class1GridTableViewClassName.Width := Class1Grid.Width - Class1GridTableViewClassCode.Width - 20;
  Class2GridTableViewClassName.Width := Class2Grid.Width - Class2GridTableViewClassCode.Width - 20;
  Class3GridTableViewClassName.Width := Class3Grid.Width - Class3GridTableViewClassCode.Width - 20;
  Class4GridTableViewClassName.Width := Class4Grid.Width - Class4GridTableViewClassCode.Width - 20;

  ConfigPanel.Top  := (Self.Height - ConfigPanel.Height) div 2 + Self.Top;
  ConfigPanel.Left := (Self.Width  - ConfigPanel.Width ) div 2 + Self.Left;

end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TCodeDeliveryAddressForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // 단축키 처리를 한다
  case Key of
    VK_F3 : ButtonToolBarNewButton.Click;
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드에 포커스가 들어갈 때
procedure TCodeDeliveryAddressForm.ClassGridEnter(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  FocusedGrid := TcxGrid(Sender);
  TcxGridDBTableView(TcxGrid(Sender).ActiveView).Styles.Background := StyleFocused;
  TcxGridDBTableView(TcxGrid(Sender).ActiveView).Styles.Content    := StyleFocused;
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TcxLabel) and (TcxLabel(Components[vIndex]).Parent = TcxGrid(Sender).Parent) then
    begin
      TcxLabel(Components[vIndex]).Style.Color := $00C08000;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 그리드에서 포커스가 나갈 때
procedure TCodeDeliveryAddressForm.ClassGridExit(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  FocusedGrid := nil;
  TcxGridDBTableView(TcxGrid(Sender).ActiveView).Styles.Background := StyleOdd;
  TcxGridDBTableView(TcxGrid(Sender).ActiveView).Styles.Content    := StyleOdd;
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TcxLabel) and (TcxLabel(Components[vIndex]).Parent = TcxGrid(Sender).Parent) then
    begin
      TcxLabel(Components[vIndex]).Style.Color := clSkyBlue;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 그리드1 선택 레코드를 옮길 때
procedure TCodeDeliveryAddressForm.Class1GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  if isLoading or not Class2Panel.Visible then
    Exit;

  if (Class1GridTableView.DataController.RecordCount = 0) or
     (Class1GridTableView.DataController.Values[Class1GridTableView.Controller.FocusedRecordIndex, Class1GridTableViewRealCode.Index] = null) then
  begin
    Class2GridTableView.DataController.RecordCount := 0;
    Class3GridTableView.DataController.RecordCount := 0;
    Class4GridTableView.DataController.RecordCount := 0;
  end
  else
  begin
    isLoading := true;
    try
      OpenQuery('select Right(CD_ADDR,2) as CD_ADDR, '
               +'       NM_ADDR, '
               +'       CD_COURSE, '
               +'       CD_LOCAL, '
               +'       CD_DAMDANG, '
               +'       CD_ADDR as CD_REAL '
               +'  from MS_DELIVERY_ADDR '
               +' where CD_HEAD        =:P0 '
               +'   and CD_STORE       =:P1 '
               +'   and Length(CD_ADDR) = 4 '
               +'   and CD_ADDR like ConCat(:P2,''%'') '
               +' order by CD_ADDR',
               [HeadStoreCode,
                StoreCode,
                Class1GridTableView.DataController.Values[Class1GridTableView.Controller.FocusedRecordIndex, Class1GridTableViewRealCode.Index]]);
      DM.ReadQuery(Query, Class2GridTableView);
    finally
      isLoading := false;
    end;
    if Class2GridTableView.DataController.RecordCount > 0 then
    begin
      Class2GridTableView.Controller.FocusedRecordIndex := 0;
      Class2GridTableViewFocusedRecordChanged(Class2GridTableView, nil, nil, false);
    end
    else
    begin
      Class3GridTableView.DataController.RecordCount := 0;
      Class4GridTableView.DataController.RecordCount := 0;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 그리드2 선택 레코드를 옮길 때
procedure TCodeDeliveryAddressForm.Class2GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  if isLoading or not Class3Panel.Visible then
    Exit;

  if (Class2GridTableView.DataController.RecordCount = 0) or
     (Class2GridTableView.DataController.Values[Class2GridTableView.Controller.FocusedRecordIndex, Class2GridTableViewRealCode.Index] = null) then
  begin
    Class3GridTableView.DataController.RecordCount := 0;
    Class4GridTableView.DataController.RecordCount := 0;
  end
  else
  begin
    isLoading := true;
    try
      OpenQuery('select Right(CD_ADDR,2) as CD_ADDR, '
               +'       NM_ADDR, '
               +'       CD_COURSE, '
               +'       CD_LOCAL, '
               +'       CD_DAMDANG, '
               +'       CD_ADDR as CD_REAL '
               +'  from MS_DELIVERY_ADDR '
               +' where CD_HEAD   =:P0 '
               +'   and CD_STORE  =:P1 '
               +'   and Length(CD_ADDR) = 6 '
               +'   and CD_ADDR like ConCat(:P2,''%'') '
               +' order by CD_ADDR',
                [HeadStoreCode,
                 StoreCode,
                 Class2GridTableView.DataController.Values[Class2GridTableView.Controller.FocusedRecordIndex, Class2GridTableViewRealCode.Index]]);
      DM.ReadQuery(Query, Class3GridTableView);
    finally
      isLoading := false;
    end;
    if Class3GridTableView.DataController.RecordCount > 0 then
    begin
      Class3GridTableView.Controller.FocusedRecordIndex := 0;
      Class3GridTableViewFocusedRecordChanged(Class3GridTableView, nil, nil, false);
    end
    else
      Class4GridTableView.DataController.RecordCount := 0;
  end;
end;
//------------------------------------------------------------------------------
// 그리드3 선택 레코드를 옮길 때
procedure TCodeDeliveryAddressForm.Class3GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  if isLoading or not Class4Panel.Visible then
    Exit;

  if (Class3GridTableView.DataController.RecordCount = 0) or
     (Class3GridTableView.DataController.Values[Class3GridTableView.Controller.FocusedRecordIndex, Class3GridTableViewRealCode.Index] = null) then
    Class4GridTableView.DataController.RecordCount := 0
  else
  begin
    isLoading := true;
    try
      OpenQuery('select Right(CD_ADDR,2) as CD_ADDR, '
               +'       NM_ADDR, '
               +'       CD_COURSE, '
               +'       CD_LOCAL, '
               +'       CD_DAMDANG, '
               +'       CD_ADDR as CD_REAL '
               +'  from MS_DELIVERY_ADDR '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and Length(CD_ADDR) = 8 '
               +'   and CD_ADDR like ConCat(:P2,''%'') '
               +' order by CD_ADDR',
                [HeadStoreCode,
                 StoreCode,
                 Class3GridTableView.DataController.Values[Class3GridTableView.Controller.FocusedRecordIndex, Class3GridTableViewRealCode.Index]]);
      DM.ReadQuery(Query, Class4GridTableView);
    finally
      isLoading := false;
    end;
    if Class4GridTableView.DataController.RecordCount > 0 then
      Class4GridTableView.Controller.FocusedRecordIndex := 0;
  end;
end;
//------------------------------------------------------------------------------
// 그리드1 제목줄을 선택할 때
procedure TCodeDeliveryAddressForm.Class1LabelClick(Sender: TObject);
begin
  inherited;

  if Class1Grid.Visible and Class1Grid.Enabled then
    Class1Grid.SetFocus;
end;
//------------------------------------------------------------------------------
// 그리드2 제목줄을 선택할 때
procedure TCodeDeliveryAddressForm.Class2LabelClick(Sender: TObject);
begin
  inherited;

  if Class2Grid.Visible and Class2Grid.Enabled then
    Class2Grid.SetFocus;
end;
//------------------------------------------------------------------------------
// 그리드3 제목줄을 선택할 때
procedure TCodeDeliveryAddressForm.Class3LabelClick(Sender: TObject);
begin
  inherited;

  if Class3Grid.Visible and Class3Grid.Enabled then
    Class3Grid.SetFocus;
end;
//------------------------------------------------------------------------------
// 그리드4 제목줄을 선택할 때
procedure TCodeDeliveryAddressForm.Class4LabelClick(Sender: TObject);
begin
  inherited;

  if Class4Grid.Visible and Class4Grid.Enabled then
    Class4Grid.SetFocus;
end;
//------------------------------------------------------------------------------
// 그리드1 상품분류이름을 검증할 때
procedure TCodeDeliveryAddressForm.Class1GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if (Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassCode.Index] = null) or
     (Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassCode.Index] = EmptyStr) then
  begin
    Error     := true;
    ErrorText := Class1GridTableViewClassCode.Caption+msgMustInput;
    Exit;
  end
  else if DisplayValue = EmptyStr then
  begin
    Error     := true;
    ErrorText := Class1GridTableViewClassName.Caption+msgMustInput;
    Exit;
  end;

  Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassName.Index] := DisplayValue;
  Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewRealCode.Index ] := Class1GridTableView.DataController.DisplayTexts[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassCode.Index];

  SaveData;
end;
//------------------------------------------------------------------------------
// 그리드2 상품분류이름을 검증할 때
procedure TCodeDeliveryAddressForm.Class2GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if (Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassCode.Index] = null) or
     (Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassCode.Index] = EmptyStr) then
  begin
    Error     := true;
    ErrorText := Class2GridTableViewClassCode.Caption+msgMustInput;
    Exit;
  end
  else if DisplayValue = EmptyStr then
  begin
    Error     := true;
    ErrorText := Class2GridTableViewClassName.Caption+msgMustInput;
    Exit;
  end;

  Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassName.Index] := DisplayValue;
  Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewRealCode.Index ] := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewRealCode.Index] + Class2GridTableView.DataController.DisplayTexts[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassCode.Index];

  SaveData;
end;
//------------------------------------------------------------------------------
// 그리드3 상품분류이름을 검증할 때
procedure TCodeDeliveryAddressForm.Class3GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if (Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassCode.Index] = null) or
     (Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassCode.Index] = EmptyStr) then
  begin
    Error     := true;
    ErrorText := Class3GridTableViewClassCode.Caption+msgMustInput;
    Exit;
  end
  else if DisplayValue = EmptyStr then
  begin
    Error     := true;
    ErrorText := Class3GridTableViewClassName.Caption+msgMustInput;
    Exit;
  end;

  Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassName.Index] := DisplayValue;
  Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewRealCode.Index ] := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewRealCode.Index] + Class3GridTableView.DataController.DisplayTexts[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassCode.Index];

  SaveData;
end;
//------------------------------------------------------------------------------
// 그리드4 상품분류이름을 검증할 때
procedure TCodeDeliveryAddressForm.Class4GridTableViewClassNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if (Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassCode.Index] = null) or
     (Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassCode.Index] = EmptyStr) then
  begin
    Error     := true;
    ErrorText := Class4GridTableViewClassCode.Caption+msgMustInput;
    Exit;
  end
  else if DisplayValue = EmptyStr then
  begin
    Error     := true;
    ErrorText := Class4GridTableViewClassName.Caption+msgMustInput;
    Exit;
  end;

  Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassName.Index] := DisplayValue;
  Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewRealCode.Index ] := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewRealCode.Index] + Class4GridTableView.DataController.DisplayTexts[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassCode.Index];

  SaveData;
end;

//==============================================================================
// 상품분류 팝업메뉴
//------------------------------------------------------------------------------
// 팝업메뉴가 뜰 때
procedure TCodeDeliveryAddressForm.ClassPopupPopup(Sender: TObject);
begin
  inherited;

  ClassPopupCopy.Enabled       := (TcxGrid(ClassPopup.PopupComponent).ActiveView.DataController.RecordCount > 0) and (TcxGrid(ClassPopup.PopupComponent).ActiveView.DataController.FocusedRecordIndex >= 0);
  ClassPopupPaste.Enabled      := (CopyedClassName <> EmptyStr) and (ButtonToolBarNewButton.Enabled);
  ClassPopupChangeCode.Enabled := ClassPopupCopy.Enabled;
end;
procedure TCodeDeliveryAddressForm.ConfigPanelClose(Sender: TObject);
begin
  inherited;
  ToolBarDockPanel.Enabled := true;
  Class1Panel.Enabled      := true;
  Class2Panel.Enabled      := true;
  Class3Panel.Enabled      := true;
  Class4Panel.Enabled      := true;
  ConfigPanel.Visible      := false;
end;

procedure TCodeDeliveryAddressForm.SaveButtonClick(Sender: TObject);
var vClassCode :String;
begin
  inherited;
  if oldFocusedGrid = Class1Grid then
    vClassCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewClassCode.Index]
  else if oldFocusedGrid = Class2Grid then
    vClassCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewClassCode.Index]
                + Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewClassCode.Index]
  else if oldFocusedGrid = Class3Grid then
    vClassCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewClassCode.Index]
                + Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewClassCode.Index]
                + Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewClassCode.Index]
  else if oldFocusedGrid = Class4Grid then
    vClassCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewClassCode.Index]
                + Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewClassCode.Index]
                + Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewClassCode.Index]
                + Class4GridTableView.DataController.Values[Class4GridTableView.DataController.GetFocusedRecordIndex, Class4GridTableViewClassCode.Index];

  ExecQuery('update MS_DELIVERY_ADDR '
           +'set    CD_COURSE  = :P3, '
           +'       CD_LOCAL   = :P4, '
           +'       CD_DAMDANG = :P5, '
           +'       DT_CHANGE = Now() '
           +'where  CD_HEAD   =:P0 '
           +'  and  CD_STORE  =:P1 '
           +'  and  CD_ADDR   =:P2;',
            [HeadStoreCode,
             StoreCode,
             vClassCode,
             GetStrPointerData(CourseComboBox),
             GetStrPointerData(LocalComboBox),
             GetStrPointerData(DamdangComboBox)],
             true);

  if oldFocusedGrid = Class1Grid then
  begin
    Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewCourse.Index]  := GetStrPointerData(CourseComboBox);
    Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewLocal.Index]   := GetStrPointerData(LocalComboBox);
    Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewDamdang.Index] := GetStrPointerData(DamdangComboBox);
  end
  else if oldFocusedGrid = Class2Grid then
  begin
    Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewCourse.Index]  := GetStrPointerData(CourseComboBox);
    Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewLocal.Index]   := GetStrPointerData(LocalComboBox);
    Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewDamdang.Index] := GetStrPointerData(DamdangComboBox);
  end
  else if oldFocusedGrid = Class3Grid then
  begin
    Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewCourse.Index]  := GetStrPointerData(CourseComboBox);
    Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewLocal.Index]   := GetStrPointerData(LocalComboBox);
    Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewDamdang.Index] := GetStrPointerData(DamdangComboBox);
  end
  else if oldFocusedGrid = Class4Grid then
  begin
    Class4GridTableView.DataController.Values[Class4GridTableView.DataController.GetFocusedRecordIndex, Class4GridTableViewCourse.Index]  := GetStrPointerData(CourseComboBox);
    Class4GridTableView.DataController.Values[Class4GridTableView.DataController.GetFocusedRecordIndex, Class4GridTableViewLocal.Index]   := GetStrPointerData(LocalComboBox);
    Class4GridTableView.DataController.Values[Class4GridTableView.DataController.GetFocusedRecordIndex, Class4GridTableViewDamdang.Index] := GetStrPointerData(DamdangComboBox);
  end;
  ToolBarDockPanel.Enabled := true;
  Class1Panel.Enabled      := true;
  Class2Panel.Enabled      := true;
  Class3Panel.Enabled      := true;
  Class4Panel.Enabled      := true;
  ConfigPanel.Visible      := false;
end;

//------------------------------------------------------------------------------
// 상품분류 복사 팝업메뉴
procedure TCodeDeliveryAddressForm.ClassPopupCopyClick(Sender: TObject);
begin
  inherited;

  CopyedClassName := TcxGrid(ClassPopup.PopupComponent).ActiveView.DataController.Values[TcxGrid(ClassPopup.PopupComponent).ActiveView.DataController.FocusedRecordIndex, 1];
end;
//------------------------------------------------------------------------------
// 상품분류 붙여넣기 팝업메뉴
procedure TCodeDeliveryAddressForm.ClassPopupPasteClick(Sender: TObject);
var
  vClassCode: string;
begin
  inherited;

  // New 버튼을 눌렀을 때와 하는 일이 거의 같음. 퀀텀그리드 문제로 입력 내용이 날아가서 같은 코드를 그대로 복사함
  if FocusedGrid = Class1Grid then
  begin
    Class1GridTableView.DataController.AppendRecord;
    if Class1GridTableView.DataController.RecordCount > 1 then
      Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-1, Class1GridTableViewClassCode.Index] := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-2, Class1GridTableViewClassCode.Index]+1
    else
      Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-1, Class1GridTableViewClassCode.Index] := 1;
    Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-1, Class1GridTableViewClassName.Index]   := CopyedClassName;
    vClassCode := Class1GridTableView.DataController.DisplayTexts[Class1GridTableView.DataController.RecordCount-1, Class1GridTableViewClassCode.Index];
    Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-1, Class1GridTableViewRealCode.Index]    := vClassCode;
    if Class1GridTableView.DataController.RecordCount > 0 then
      Class1GridTableView.DataController.FocusedRecordIndex := Class1GridTableView.DataController.RecordCount-1;
    Class1GridTableView.Controller.FocusedColumn := Class1GridTableViewClassName;
    Class1GridTableViewFocusedRecordChanged(Class1GridTableView, nil, nil, false);
  end

  else if FocusedGrid = Class2Grid then
  begin
    Class2GridTableView.DataController.AppendRecord;
    if Class2GridTableView.DataController.RecordCount > 1 then
      Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-1, Class2GridTableViewClassCode.Index] := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-2, Class2GridTableViewClassCode.Index]+1
    else
      Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-1, Class2GridTableViewClassCode.Index] := 1;
    Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-1, Class2GridTableViewClassName.Index]   := CopyedClassName;
    vClassCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewRealCode.Index] + Class2GridTableView.DataController.DisplayTexts[Class2GridTableView.DataController.RecordCount-1, Class2GridTableViewClassCode.Index];
    Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-1, Class2GridTableViewRealCode.Index]    := vClassCode;
    if Class2GridTableView.DataController.RecordCount > 0 then
      Class2GridTableView.DataController.FocusedRecordIndex := Class2GridTableView.DataController.RecordCount-1;
    Class2GridTableView.Controller.FocusedColumn := Class2GridTableViewClassName;
    Class2GridTableViewFocusedRecordChanged(Class2GridTableView, nil, nil, false);
  end

  else if FocusedGrid = Class3Grid then
  begin
    Class3GridTableView.DataController.AppendRecord;
    if Class3GridTableView.DataController.RecordCount > 1 then
      Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-1, Class3GridTableViewClassCode.Index] := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-2, Class3GridTableViewClassCode.Index]+1
    else
      Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-1, Class3GridTableViewClassCode.Index] := 1;
    Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-1, Class3GridTableViewClassName.Index]   := CopyedClassName;
    vClassCode := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewRealCode.Index] + Class3GridTableView.DataController.DisplayTexts[Class3GridTableView.DataController.RecordCount-1, Class3GridTableViewClassCode.Index];
    Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-1, Class3GridTableViewRealCode.Index]    := vClassCode;
    if Class3GridTableView.DataController.RecordCount > 0 then
      Class3GridTableView.DataController.FocusedRecordIndex := Class3GridTableView.DataController.RecordCount-1;
    Class3GridTableView.Controller.FocusedColumn := Class3GridTableViewClassName;
    Class3GridTableViewFocusedRecordChanged(Class3GridTableView, nil, nil, false);
  end

  else if FocusedGrid = Class4Grid then
  begin
    Class4GridTableView.DataController.AppendRecord;
    if Class4GridTableView.DataController.RecordCount > 1 then
      Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-1, Class4GridTableViewClassCode.Index] := Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-2, Class4GridTableViewClassCode.Index]+1
    else
      Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-1, Class4GridTableViewClassCode.Index] := 1;
    Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-1, Class4GridTableViewClassName.Index]   := CopyedClassName;
    vClassCode := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewRealCode.Index] + Class4GridTableView.DataController.DisplayTexts[Class4GridTableView.DataController.RecordCount-1, Class4GridTableViewClassCode.Index];
    Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-1, Class4GridTableViewRealCode.Index]    := vClassCode;
    if Class4GridTableView.DataController.RecordCount > 0 then
      Class4GridTableView.DataController.FocusedRecordIndex := Class4GridTableView.DataController.RecordCount-1;
    Class4GridTableView.Controller.FocusedColumn := Class4GridTableViewClassName;
  end;

  SaveData(vClassCode, CopyedClassName);
end;
//------------------------------------------------------------------------------
// 상품분류코드 변경 팝업메뉴
procedure TCodeDeliveryAddressForm.ClassPopupChangeCodeClick(Sender: TObject);
var
  vCode, vReal, vName, vOldCode: string;
begin
  inherited;

  if ((FocusedGrid = Class1Grid) and (Class1GridTableView.DataController.FocusedRecordIndex >= 0)) or
     ((FocusedGrid = Class2Grid) and (Class2GridTableView.DataController.FocusedRecordIndex >= 0)) or
     ((FocusedGrid = Class3Grid) and (Class3GridTableView.DataController.FocusedRecordIndex >= 0)) or
     ((FocusedGrid = Class4Grid) and (Class4GridTableView.DataController.FocusedRecordIndex >= 0)) then
  begin
    if FocusedGrid = Class1Grid then
    begin
      vCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassCode.Index];
      vReal := EmptyStr;
      vName := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassName.Index];
    end
    else if FocusedGrid = Class2Grid then
    begin
      vCode := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassCode.Index];
      vReal := Copy(Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewRealCode.Index], 1, 2);
      vName := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassName.Index];
    end
    else if FocusedGrid = Class3Grid then
    begin
      vCode := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassCode.Index];
      vReal := Copy(Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewRealCode.Index], 1, 4);
      vName := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassName.Index];
    end
    else if FocusedGrid = Class4Grid then
    begin
      vCode := Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassCode.Index];
      vReal := Copy(Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewRealCode.Index], 1, 6);
      vName := Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassName.Index];
    end;
    vOldCode := vCode;
    if InputBox('변경할 주소류코드를 입력하십시오.', vCode, 2, false, true) then
      if vCode <> vOldCode then
        if Length(vCode) = 2 then
          SaveData(vReal+vCode, vName, vReal+vOldCode)
        else
          ErrBox('주소코드'+msgMustInput);
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 신규
procedure TCodeDeliveryAddressForm.ButtonToolBarEtcButtonClick(Sender: TObject);
begin
  inherited;
  oldFocusedGrid := FocusedGrid;
  if oldFocusedGrid = nil then Exit;

  ToolBarDockPanel.Enabled := false;
  Class1Panel.Enabled      := false;
  Class2Panel.Enabled      := false;
  Class3Panel.Enabled      := false;
  Class4Panel.Enabled      := false;
  ConfigPanel.Visible      := true;
  if oldFocusedGrid = Class1Grid then
  begin
    CourseComboBox.ItemIndex  := GetStrPointerIndex(CourseComboBox,  NVL(Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewCourse.Index],''));
    LocalComboBox.ItemIndex   := GetStrPointerIndex(LocalComboBox,   NVL(Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewLocal.Index],''));
    DamdangComboBox.ItemIndex := GetStrPointerIndex(DamdangComboBox, NVL(Class1GridTableView.DataController.Values[Class1GridTableView.DataController.GetFocusedRecordIndex, Class1GridTableViewDamdang.Index],''));
  end
  else if oldFocusedGrid = Class2Grid then
  begin
    CourseComboBox.ItemIndex  := GetStrPointerIndex(CourseComboBox,  NVL(Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewCourse.Index],''));
    LocalComboBox.ItemIndex   := GetStrPointerIndex(LocalComboBox,   NVL(Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewLocal.Index],''));
    DamdangComboBox.ItemIndex := GetStrPointerIndex(DamdangComboBox, NVL(Class2GridTableView.DataController.Values[Class2GridTableView.DataController.GetFocusedRecordIndex, Class2GridTableViewDamdang.Index],''));
  end
  else if oldFocusedGrid = Class3Grid then
  begin
    CourseComboBox.ItemIndex  := GetStrPointerIndex(CourseComboBox,  NVL(Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewCourse.Index],''));
    LocalComboBox.ItemIndex   := GetStrPointerIndex(LocalComboBox,   NVL(Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewLocal.Index],''));
    DamdangComboBox.ItemIndex := GetStrPointerIndex(DamdangComboBox, NVL(Class3GridTableView.DataController.Values[Class3GridTableView.DataController.GetFocusedRecordIndex, Class3GridTableViewDamdang.Index],''));
  end
  else if oldFocusedGrid = Class4Grid then
  begin
    CourseComboBox.ItemIndex  := GetStrPointerIndex(CourseComboBox,  NVL(Class4GridTableView.DataController.Values[Class4GridTableView.DataController.GetFocusedRecordIndex, Class4GridTableViewCourse.Index],''));
    LocalComboBox.ItemIndex   := GetStrPointerIndex(LocalComboBox,   NVL(Class4GridTableView.DataController.Values[Class4GridTableView.DataController.GetFocusedRecordIndex, Class4GridTableViewLocal.Index],''));
    DamdangComboBox.ItemIndex := GetStrPointerIndex(DamdangComboBox, NVL(Class4GridTableView.DataController.Values[Class4GridTableView.DataController.GetFocusedRecordIndex, Class4GridTableViewDamdang.Index],''));
  end;
end;

procedure TCodeDeliveryAddressForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;

  if FocusedGrid = Class1Grid then
  begin
    Class1GridTableView.DataController.AppendRecord;
    if Class1GridTableView.DataController.RecordCount > 1 then
      Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-1, Class1GridTableViewClassCode.Index] := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-2, Class1GridTableViewClassCode.Index]+1
    else
      Class1GridTableView.DataController.Values[Class1GridTableView.DataController.RecordCount-1, Class1GridTableViewClassCode.Index] := 1;
    if Class1GridTableView.DataController.RecordCount > 0 then
      Class1GridTableView.DataController.FocusedRecordIndex := Class1GridTableView.DataController.RecordCount-1;
    Class1GridTableView.Controller.FocusedColumn := Class1GridTableViewClassName;
    Class1GridTableViewFocusedRecordChanged(Class1GridTableView, nil, nil, false);
  end

  else if FocusedGrid = Class2Grid then
  begin
    Class2GridTableView.DataController.AppendRecord;
    if Class2GridTableView.DataController.RecordCount > 1 then
      Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-1, Class2GridTableViewClassCode.Index] := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-2, Class2GridTableViewClassCode.Index]+1
    else
      Class2GridTableView.DataController.Values[Class2GridTableView.DataController.RecordCount-1, Class2GridTableViewClassCode.Index] := 1;
    if Class2GridTableView.DataController.RecordCount > 0 then
      Class2GridTableView.DataController.FocusedRecordIndex := Class2GridTableView.DataController.RecordCount-1;
    Class2GridTableView.Controller.FocusedColumn := Class2GridTableViewClassName;
    Class2GridTableViewFocusedRecordChanged(Class2GridTableView, nil, nil, false);
  end

  else if FocusedGrid = Class3Grid then
  begin
    Class3GridTableView.DataController.AppendRecord;
    if Class3GridTableView.DataController.RecordCount > 1 then
      Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-1, Class3GridTableViewClassCode.Index] := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-2, Class3GridTableViewClassCode.Index]+1
    else
      Class3GridTableView.DataController.Values[Class3GridTableView.DataController.RecordCount-1, Class3GridTableViewClassCode.Index] := 1;
    if Class3GridTableView.DataController.RecordCount > 0 then
      Class3GridTableView.DataController.FocusedRecordIndex := Class3GridTableView.DataController.RecordCount-1;
    Class3GridTableView.Controller.FocusedColumn := Class3GridTableViewClassName;
    Class3GridTableViewFocusedRecordChanged(Class3GridTableView, nil, nil, false);
  end

  else if FocusedGrid = Class4Grid then
  begin
    Class4GridTableView.DataController.AppendRecord;
    if Class4GridTableView.DataController.RecordCount > 1 then
      Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-1, Class4GridTableViewClassCode.Index] := Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-2, Class4GridTableViewClassCode.Index]+1
    else
      Class4GridTableView.DataController.Values[Class4GridTableView.DataController.RecordCount-1, Class4GridTableViewClassCode.Index] := 1;
    if Class4GridTableView.DataController.RecordCount > 0 then
      Class4GridTableView.DataController.FocusedRecordIndex := Class4GridTableView.DataController.RecordCount-1;
    Class4GridTableView.Controller.FocusedColumn := Class4GridTableViewClassName;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 삭제
function TCodeDeliveryAddressForm.DoDelete: Boolean;
var
  vClassCode: string;
begin
  try
    if FocusedGrid = Class1Grid then
      vClassCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewRealCode.Index]
    else if FocusedGrid = Class2Grid then
      vClassCode := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewRealCode.Index]
    else if FocusedGrid = Class3Grid then
      vClassCode := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewRealCode.Index]
    else if FocusedGrid = Class4Grid then
      vClassCode := Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewRealCode.Index];

    Result := ExecQuery('delete from MS_DELIVERY_ADDR '
                       +'where  CD_STORE = :P0 '
                       +'  and  CD_ADDR like ConCat(:P1,''%'');',
                        [StoreCode,
                         vClassCode]);

    if Result then
      if FocusedGrid = Class1Grid then
        Class1GridTableView.DataController.DeleteFocused
      else if FocusedGrid = Class2Grid then
        Class2GridTableView.DataController.DeleteFocused
      else if FocusedGrid = Class3Grid then
        Class3GridTableView.DataController.DeleteFocused
      else if FocusedGrid = Class4Grid then
        Class4GridTableView.DataController.DeleteFocused;
  except
    Result := false;
  end;
end;
//------------------------------------------------------------------------------
// 자료 즉시 저장
procedure TCodeDeliveryAddressForm.SaveData(aClassCode, aClassName, aOldClassCode: string);
var
  vClassCode: string;
  vClassName: string;
  vIndex    : Integer;
begin
  if aClassCode <> EmptyStr then
    vClassCode := aClassCode
  else if FocusedGrid = Class1Grid then
    vClassCode := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewRealCode.Index]
  else if FocusedGrid = Class2Grid then
    vClassCode := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewRealCode.Index]
  else if FocusedGrid = Class3Grid then
    vClassCode := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewRealCode.Index]
  else if FocusedGrid = Class4Grid then
    vClassCode := Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewRealCode.Index];

  if aClassName <> EmptyStr then
    vClassName := aClassName
  else if FocusedGrid = Class1Grid then
    vClassName := Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassName.Index]
  else if FocusedGrid = Class2Grid then
    vClassName := Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassName.Index]
  else if FocusedGrid = Class3Grid then
    vClassName := Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassName.Index]
  else if FocusedGrid = Class4Grid then
    vClassName := Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassName.Index];

  if (vClassCode = EmptyStr) or (vClassName = EmptyStr) then
    Exit;

  // 저장
  try
    ExecQuery('delete from MS_DELIVERY_ADDR '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_ADDR  =:P2;',
              [HeadStoreCode,
               StoreCode,
               IfThen(aOldClassCode = '', vClassCode, aOldClassCode)],
               false);
    ExecQuery('insert into MS_DELIVERY_ADDR(CD_HEAD, CD_STORE, CD_ADDR, NM_ADDR, DT_CHANGE) '
             +'                     values (:P0, :P1, :P2, :P3, Now()); ',
              [HeadStoreCode,
               StoreCode,
               vClassCode,
               vClassName],
               false);


    if aOldClassCode <> '' then
    begin
      ExecQuery('update MS_DELIVERY_ADDR '
               +'   set CD_ADDR  = ConCat(:P3,SubString(CD_ADDR, Length(:P3)+1, Length(CD_ADDR)-Length(:P3))), '
               +'       DT_CHANGE = Now() '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_ADDR  like ConCat(:P2,''%'') '
               +'   and Length(CD_ADDR) > Length(:P2);',
                [HeadStoreCode,
                 StoreCode,
                 aOldClassCode,
                 vClassCode],
                 false);

      if FocusedGrid = Class1Grid then
      begin
        Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewClassCode.Index] := vClassCode;
        Class1GridTableView.DataController.Values[Class1GridTableView.DataController.FocusedRecordIndex, Class1GridTableViewRealCode.Index]  := vClassCode;
      end
      else if FocusedGrid = Class2Grid then
      begin
        Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewClassCode.Index] := Copy(vClassCode, 3, 2);
        Class2GridTableView.DataController.Values[Class2GridTableView.DataController.FocusedRecordIndex, Class2GridTableViewRealCode.Index]  := vClassCode;
      end
      else if FocusedGrid = Class3Grid then
      begin
        Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewClassCode.Index] := Copy(vClassCode, 5, 2);
        Class3GridTableView.DataController.Values[Class3GridTableView.DataController.FocusedRecordIndex, Class3GridTableViewRealCode.Index]  := vClassCode;
      end
      else if FocusedGrid = Class4Grid then
      begin
        Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewClassCode.Index] := Copy(vClassCode, 7, 2);
        Class4GridTableView.DataController.Values[Class4GridTableView.DataController.FocusedRecordIndex, Class4GridTableViewRealCode.Index]  := vClassCode;
      end
    end;

    ExecQuery(TempSQL, [], true);
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
