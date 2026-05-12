unit KioskTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ExtCtrls,
  cxStyles, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB,
  MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, Vcl.Menus, Vcl.StdCtrls, cxButtons, System.Contnrs, AdvPanel,
  StrUtils, Math, Vcl.ComCtrls, dxCore, cxDateUtils, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, cxScrollBox, cxImage,
  Vcl.ExtDlgs, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TKioskTableForm = class(TInheritEditForm)
    ButtonToolBarNewButton: TAdvGlowButton;
    TablePopupMenu: TPopupMenu;
    TableNumberPopupMenu: TMenuItem;
    TableDeletePopupMenu: TMenuItem;
    MainPanel: TPanel;
    TableScrollBox: TScrollBox;
    MainImage: TcxImage;
    ImageButton: TAdvGlowButton;
    PictureLoadDialog: TOpenPictureDialog;
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure TableNumberPopupMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TableDeletePopupMenuClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImageButtonClick(Sender: TObject);
  private
    MouseDowned : Boolean;
    MouseOldX,
    MouseOldY       : Integer;
    SelectedTable   : TAdvPanel;
    function  GetTableMaxNumber:Integer;
    procedure ButtonCreate(aTableNo, aTop, aLeft, aHeight, aWidth:Integer);
    procedure ButtonAllClear;
    procedure PanelClick(Sender: TObject);
    procedure PanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelEndMoveSize(Sender: TObject);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    function  DoSave: Boolean; override;                        // 저장
  public
  end;

var
  KioskTableForm: TKioskTableForm;

implementation
uses Common, Main, Help;
{$R *.dfm}

{ TCodeKioskTableForm }

{ TCodeKioskTableForm }

procedure TKioskTableForm.ButtonAllClear;
var vIndex :Integer;
label go;
begin
  go:
  For vIndex := 0 to ComponentCount-1 do
  begin
    if (Components[vIndex] is TAdvPanel) then
    begin
      (Components[vIndex] as TAdvPanel).Free;
      Goto go;
    end;
  end;
end;

procedure TKioskTableForm.ButtonCreate(aTableNo, aTop, aLeft, aHeight, aWidth: Integer);
begin
  with TAdvPanel.Create(Self) do
  begin
    Parent          := TableScrollBox;
    Top             := Ifthen(aTop < 0, 100, aTop);
    Left            := Ifthen(aLeft < 0, 100, aLeft);
    Height          := Ifthen(aHeight < 0, 50, aHeight);
    Width           := Ifthen(aWidth < 0, 100, aWidth);
    BevelInner      := bvSpace;
    BevelOuter      := bvLowered;
    TextVAlign      := tvaCenter;
    CanMove         := true;
    CanSize         := true;
    Caption.Visible := false;
    ColorTo         := clMoneyGreen;
    Font.Size       := 12;
    if aTableNo = 0 then
      Text            := '닫기<P align="center"></P>'
    else
      Text            := Format('%s<P align="center"></P>',[Ifthen(aTableNo < 0, '', IntToStr(aTableNo))]);
    Tag             := Ifthen(aTableNo >= 0, aTableNo, 0);
    PopupMenu       := TablePopupMenu;
    OnClick         := PanelClick;
    OnCaptionClick  := PanelClick;
    OnMouseDown     := PanelMouseDown;
    OnMouseMove     := PanelMouseMove;
    OnMouseUp       := PanelMouseUp;
    OnEndMoveSize   := PanelEndMoveSize;
  end;
end;

procedure TKioskTableForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  ButtonCreate(-1, 100, 10, 100, 200);
  isChanged := true;
end;

procedure TKioskTableForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  DoSearch;
end;

function TKioskTableForm.DoSave: Boolean;
var vIndex :Integer;
    vTableExist :Boolean;
    vSQL :String;
begin
  Result := false;
  vTableExist := true;
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TAdvPanel) then
      vSQL := vSQL + Format('%d,',[(Components[vIndex] as TAdvPanel).Tag]);

  if vSQL <> '' then
    vSQL := ' and NO_TABLE not in ('+LeftStr(vSQL,Length(vSQL)-1)+')';
  OpenQuery('select Count(*) '
           +'  from MS_TABLE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +vSQL
           +'   and SEQ      = 0',
           [HeadStoreCode,
            StoreCode]);

  if Query.Fields[0].AsInteger > 0 then
  begin
    Query.Close;
    if not AskBox('등록되지 않은 테이블이 있습니다'#13'저장하시겠습니까?') then
      Exit;
  end;
  Query.Close;
  try
    ExecQuery('delete from MS_KIOSK_TABLE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1;',
             [HeadStoreCode,
              StoreCode],false);

    vSQL := '';
    for vIndex := 0 to ComponentCount-1 do
    begin
      if Components[vIndex] is TAdvPanel then
      begin
        if (Components[vIndex] as TAdvPanel).Tag = 0 then Continue;
        vSQL := vSQL + Format('(''%s'',''%s'',%d,''%s'',%d, %d, %d, %d),',
                             [HeadStoreCode,
                              StoreCode,
                              (Components[vIndex] as TAdvPanel).Tag,
                              GetStrPointerData(ConditionToolBarComboBox),
                              TableScrollBox.VertScrollBar.Position+(Components[vIndex] as TAdvPanel).Top,
                              TableScrollBox.HorzScrollBar.Position+(Components[vIndex] as TAdvPanel).Left,
                              (Components[vIndex] as TAdvPanel).Height,
                              (Components[vIndex] as TAdvPanel).Width]);
      end;
    end;
    if vSQL <> '' then
      vSQL := 'insert into MS_KIOSK_TABLE(CD_HEAD, '
             +'                           CD_STORE, '
             +'                           NO_TABLE, '
             +'                           CD_FLOOR, '
             +'                           NO_TOP, '
             +'                           NO_LEFT, '
             +'                           NO_HEIGHT, '
             +'                           NO_WIDTH) '
             +'                   values '+LeftStr(vSQL, Length(vSQL)-1)+';';
    Result := ExecQuery(vSQL, [], true);
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

function TKioskTableForm.DoSearch: Boolean;
begin
  ButtonAllClear;
  try
    OpenQuery('select NO_TABLE, '
             +'       NO_TOP, '
             +'       NO_LEFT, '
             +'       NO_HEIGHT, '
             +'       NO_WIDTH '
             +'  from MS_KIOSK_TABLE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_FLOOR =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GetStrPointerData(ConditionToolBarComboBox)]);
    while not Query.Eof do
    begin
      ButtonCreate(Query.FieldByName('NO_TABLE').AsInteger,
                   Query.FieldByName('NO_TOP').AsInteger,
                   Query.FieldByName('NO_LEFT').AsInteger,
                   Query.FieldByName('NO_HEIGHT').AsInteger,
                   Query.FieldByName('NO_WIDTH').AsInteger);
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  Result := true;
end;

procedure TKioskTableForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl, ssShift] then
  begin
    if SelectedTable = nil then Exit;
    case Key of
      VK_LEFT  : (SelectedTable as TAdvPanel).Left := (SelectedTable as TAdvPanel).Left - 5;
      VK_RIGHT : (SelectedTable as TAdvPanel).Left := (SelectedTable as TAdvPanel).Left + 5;
      VK_UP    : (SelectedTable as TAdvPanel).Top  := (SelectedTable as TAdvPanel).Top  - 5;
      VK_DOWN  : (SelectedTable as TAdvPanel).Top  := (SelectedTable as TAdvPanel).Top  + 5;
    end;
    isChanged := true;
  end
  else if Shift = [ssCtrl] then
  begin
    if SelectedTable = nil then Exit;
    case Key of
      VK_LEFT  : (SelectedTable as TAdvPanel).Left := (SelectedTable as TAdvPanel).Left - 1;
      VK_RIGHT : (SelectedTable as TAdvPanel).Left := (SelectedTable as TAdvPanel).Left + 1;
      VK_UP    : (SelectedTable as TAdvPanel).Top  := (SelectedTable as TAdvPanel).Top  - 1;
      VK_DOWN  : (SelectedTable as TAdvPanel).Top  := (SelectedTable as TAdvPanel).Top  + 1;
    end;
    isChanged := true;
  end
  else if Shift = [ssShift] then
  begin
    if SelectedTable = nil then Exit;
    case Key of
      VK_LEFT  : (SelectedTable as TAdvPanel).Width   := (SelectedTable as TAdvPanel).Width - 1;
      VK_RIGHT : (SelectedTable as TAdvPanel).Width   := (SelectedTable as TAdvPanel).Width + 1;
      VK_UP    : (SelectedTable as TAdvPanel).Height  := (SelectedTable as TAdvPanel).Height  - 1;
      VK_DOWN  : (SelectedTable as TAdvPanel).Height  := (SelectedTable as TAdvPanel).Height  + 1;
    end;
    isChanged := true;
  end;
end;

procedure TKioskTableForm.FormShow(Sender: TObject);
var
  vCode     : PStrPointer;begin
  inherited;
  OpenQuery('select CD_CODE, '
           +'       NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  = ''03'' '
           +' order by CD_CODE ',
           [HeadStoreCode,
            StoreCode]);
  ConditionToolBarComboBox.Properties.Items.Clear;
  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := Query.Fields[0].AsString;
    ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
    Query.Next;
  end;
  Query.Close;
  ConditionToolBarComboBox.ItemIndex := 0;
  SelectedTable := nil;
end;

function TKioskTableForm.GetTableMaxNumber: Integer;
begin
  try
    OpenQuery('select max(ifnull(NO_TABLE, 0) ) '
             +'  from MS_KIOSK_TABLE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [HeadStoreCode,
              StoreCode]);

    Result := Query.Fields[0].AsInteger;
  finally
    FinishQuery;
  end;
end;

procedure TKioskTableForm.ImageButtonClick(Sender: TObject);
begin
  inherited;
  if PictureLoadDialog.Execute then
  begin
    with TPicture.Create do
    try
      LoadFromFile(PictureLoadDialog.FileName);
      MainImage.Width  := Width;
      MainImage.Height := Height;
    finally
      Free;
    end;
    MainImage.Picture.LoadFromFile(PictureLoadDialog.FileName);
    MainImage.Top  := 0;
    MainImage.Left := 0;
  end;
end;

procedure TKioskTableForm.PanelClick(Sender: TObject);
begin
  SelectedTable    := Sender as TAdvPanel;
end;

procedure TKioskTableForm.PanelEndMoveSize(Sender: TObject);
begin
  isChanged := true;
end;

procedure TKioskTableForm.PanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;

procedure TKioskTableForm.PanelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
    isChanged := true;
  end;
end;

procedure TKioskTableForm.PanelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseDowned := false;
end;

procedure TKioskTableForm.TableDeletePopupMenuClick(Sender: TObject);
begin
  inherited;
  ExecQuery('delete from MS_KIOSK_TABLE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and NO_TABLE =:P2; ',
           [HeadStoreCode,
            StoreCode,
            TAdvPanel(TablePopupMenu.PopupComponent).Tag],true);

  TAdvPanel(TablePopupMenu.PopupComponent).Free;
end;

procedure TKioskTableForm.TableNumberPopupMenuClick(Sender: TObject);
var vTemp :String;
begin
  inherited;
  if InputQuery('테이블번호 입력', '테이블번호를 입력하세요.', vTemp) then
  begin
    if vTemp = '닫기' then
    begin
      TAdvPanel(TablePopupMenu.PopupComponent).Text := Format('%s<P align="center"></P>',[vTemp]);
      TAdvPanel(TablePopupMenu.PopupComponent).Tag  := 0;
    end
    else
    begin
      if GetOnlyNumber(vTemp) <> vTemp then
      begin
        ErrBox('숫자만 입력이 가능합니다');
        Exit;
      end;
      if vTemp = '0' then
      begin
        ErrBox('0번은 사용할 수 없습니다');
        Exit;
      end;

      TAdvPanel(TablePopupMenu.PopupComponent).Text := Format('%s<P align="center"></P>',[vTemp]);
      TAdvPanel(TablePopupMenu.PopupComponent).Tag  := StrToInt(vTemp);
    end;
  end
  else Exit;

  isChanged := true;
end;

end.
