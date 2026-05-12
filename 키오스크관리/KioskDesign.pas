{
1 - 옵션
2 - PLU분류
3 - PLU메뉴
4 - 영업일자
5 - 전체취소
6 - 주문총수량
7 - 주문메뉴리스트
8 - 받을금액
9 - 현금결제
10 - 카드결제
11 - 직원호출
12 - 회원가입
13 - 외상결제
14 - 메뉴PLU <
15 - 메뉴PLU >
16 - ●○○
17 - 분류PLU <
18 - 분류PLU >
19 - 포인트결제
20 - 포인트/스템프조회
21 - 주문
22 - 스템프사용
23 - 할인금액
24 - 주문금액
25 - 간편결제
26 - 다국어
27 - 음성안내
28 - 볼륨조절
29 - 사용안함--
30 - 사용안함--
31 - 매장이용
}
unit KioskDesign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ExtCtrls,
  cxStyles, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB,
  MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, Vcl.Menus, AdvPanel, cxScrollBox, Vcl.StdCtrls, cxButtons,
  cxFontNameComboBox, cxCurrencyEdit, cxCheckBox, cxSpinEdit, cxGroupBox, Math,
  StrUtils, cxMemo, cxScrollBar, Vcl.ComCtrls, dxCore, cxDateUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  cxColorComboBox, System.ImageList, Vcl.ImgList, cxImageList, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  TKioskDesignForm = class(TInheritEditForm)
    ColorDialog: TColorDialog;
    MainPanel: TPanel;
    KioskPopup: TPopupMenu;
    Kiosk002Item: TMenuItem;
    Kiosk009Item: TMenuItem;
    Kiosk010Item: TMenuItem;
    Kiosk019Item: TMenuItem;
    Kiosk013Item: TMenuItem;
    Kiosk017Item: TMenuItem;
    Kiosk018Item: TMenuItem;
    N1: TMenuItem;
    Kiosk014Item: TMenuItem;
    Kiosk015Item: TMenuItem;
    Kiosk016Item: TMenuItem;
    Kiosk011Item: TMenuItem;
    Kiosk006Item: TMenuItem;
    Kiosk012Item: TMenuItem;
    Kiosk020Item: TMenuItem;
    cxScrollBox1: TcxScrollBox;
    KioskDesignPanel: TcxScrollBox;
    Kiosk003Panel: TAdvPanel;
    Kiosk002Panel: TAdvPanel;
    Kiosk007Panel: TAdvPanel;
    Kiosk008Panel: TAdvPanel;
    Kiosk004Panel: TAdvPanel;
    Kiosk010Panel: TAdvPanel;
    Kiosk009Panel: TAdvPanel;
    Kiosk005Panel: TAdvPanel;
    Kiosk011Panel: TAdvPanel;
    Kiosk013Panel: TAdvPanel;
    Kiosk016Panel: TAdvPanel;
    Kiosk015Panel: TAdvPanel;
    Kiosk014Panel: TAdvPanel;
    Kiosk017Panel: TAdvPanel;
    Kiosk018Panel: TAdvPanel;
    Kiosk019Panel: TAdvPanel;
    Kiosk006Panel: TAdvPanel;
    Kiosk012Panel: TAdvPanel;
    Kiosk020Panel: TAdvPanel;
    LeftPanel: TPanel;
    Label162: TLabel;
    KioskWokGroupBox: TcxGroupBox;
    Label174: TLabel;
    Label173: TLabel;
    Label172: TLabel;
    Label171: TLabel;
    KioskWidthEdit: TcxCurrencyEdit;
    KioskHeightEdit: TcxCurrencyEdit;
    KioskLeftEdit: TcxCurrencyEdit;
    KioskTopEdit: TcxCurrencyEdit;
    FontGroupBox: TcxGroupBox;
    Label177: TLabel;
    KioskFontColorLabel: TLabel;
    Label169: TLabel;
    KioskFontDownColorLabel: TLabel;
    KioskFontSizeSpinEdit: TcxSpinEdit;
    KioskFontNameComboBox: TcxFontNameComboBox;
    KioskFontColorPanel: TPanel;
    KioskFontDownColorPanel: TPanel;
    KioskFontColorValueEdit: TcxTextEdit;
    Kiosk002SpinEdit: TcxSpinEdit;
    DesignSaveButton: TAdvGlowButton;
    DesignLoadButton: TAdvGlowButton;
    Kiosk021Item: TMenuItem;
    Kiosk021Panel: TAdvPanel;
    Kiosk003Item: TMenuItem;
    Kiosk022Panel: TAdvPanel;
    Kiosk022Item: TMenuItem;
    N2: TMenuItem;
    Kiosk023Item: TMenuItem;
    Kiosk024Item: TMenuItem;
    Kiosk023Panel: TAdvPanel;
    Kiosk024Panel: TAdvPanel;
    Kiosk025Panel: TAdvPanel;
    Kiosk025Item: TMenuItem;
    ImageButton: TAdvGlowButton;
    OpenDialog: TOpenDialog;
    N3: TMenuItem;
    SizeCopyMenuItem: TMenuItem;
    SizePasteTopMenuItem: TMenuItem;
    SizePasteLeftMenuItem: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label167: TLabel;
    Kiosk005SpinEdit: TcxSpinEdit;
    RatingBluePanel: TPanel;
    RatingBlackPanel: TPanel;
    RatingRedPanel: TPanel;
    Kiosk006CheckBox: TcxCheckBox;
    Label165: TLabel;
    KiosDisplayXEdit: TcxCurrencyEdit;
    KiosDisplayYEdit: TcxCurrencyEdit;
    ZoomCheckBox: TcxCheckBox;
    KioskInitButton: TAdvGlowButton;
    DefaultDesignButton: TAdvGlowButton;
    Label8: TLabel;
    Kiosk013ComboBox: TcxComboBox;
    Kiosk007CheckBox: TcxCheckBox;
    cxGroupBox18: TcxGroupBox;
    Label163: TLabel;
    Label164: TLabel;
    Label170: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Kiosk003SpinEdit: TcxSpinEdit;
    Kiosk004SpinEdit: TcxSpinEdit;
    Kiosk014CheckBox: TcxCheckBox;
    Kiosk010SpinEdit: TcxSpinEdit;
    Kiosk008SpinEdit: TcxSpinEdit;
    Kiosk011ComboBox: TcxComboBox;
    Kiosk012ComboBox: TcxComboBox;
    CaptionEdit: TcxTextEdit;
    Label5: TLabel;
    Kiosk026Panel: TAdvPanel;
    Kiosk026Item: TMenuItem;
    MoveSizeCheckBox: TcxCheckBox;
    cxLabel1: TcxLabel;
    Kiosk028Panel: TAdvPanel;
    Kiosk027Panel: TAdvPanel;
    N4: TMenuItem;
    Kiosk027Item: TMenuItem;
    Kiosk028Item: TMenuItem;
    ColorPopupMenu: TPopupMenu;
    DeleteColorItem: TMenuItem;
    ColorPopupImageList: TcxImageList;
    N5: TMenuItem;
    ColorPopupCopyItem: TMenuItem;
    ColorPopupTopPasteItem: TMenuItem;
    ColorPopupLeftPasteItem: TMenuItem;
    Kiosk031Panel: TAdvPanel;
    Kiosk031Item: TMenuItem;
    procedure Kiosk002PanelClick(Sender: TObject);
    procedure Kiosk002PanelClose(Sender: TObject);
    procedure Kiosk002PanelEndMoveSize(Sender: TObject);
    procedure Kiosk002PanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Kiosk002PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Kiosk002PanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Kiosk002ItemClick(Sender: TObject);
    procedure KioskInitButtonClick(Sender: TObject);
    procedure KioskFontColorPanelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DesignSaveButtonClick(Sender: TObject);
    procedure DesignLoadButtonClick(Sender: TObject);
    procedure KiosDisplayXEditPropertiesEditValueChanged(Sender: TObject);
    procedure KioskFontSizeSpinEditPropertiesChange(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KioskTopEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure MemberInfo1LabelClick(Sender: TObject);
    procedure MemberInfo1LabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MemberInfo1LabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MemberInfo1LabelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageButtonClick(Sender: TObject);
    procedure ZoomCheckBoxPropertiesChange(Sender: TObject);
    procedure SizeCopyMenuItemClick(Sender: TObject);
    procedure KioskPopupPopup(Sender: TObject);
    procedure SizePasteTopMenuItemClick(Sender: TObject);
    procedure SizePasteLeftMenuItemClick(Sender: TObject);
    procedure DefaultDesignButtonClick(Sender: TObject);
    procedure RatingBluePanelClick(Sender: TObject);
    procedure KioskFontNameComboBoxPropertiesFontPreviewButtonClick(
      Sender: TObject; ButtonType: TcxFontButtonType);
    procedure MoveSizeCheckBoxPropertiesChange(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure DeleteColorItemClick(Sender: TObject);
    procedure ColorPopupMenuPopup(Sender: TObject);
  private
    KioskSelectedPanel :TAdvPanel;
    SelectedControl: TLabel;
    MouseDowned     : Boolean;
    MouseOldX,
    MouseOldY       : Integer;
    SelectedPanel   : TAdvPanel;
    CopyHeight,
    CopyWidth,
    CopyLeft,
    CopyTop :Integer;
    procedure GetKioskDesign;
    procedure SetSelectedControl(aControl: TLabel);
    procedure SetMoveSize;
  protected
    function  DoSave: Boolean; override;                        // 저장
  public
    { Public declarations }
  end;

var
  KioskDesignForm: TKioskDesignForm;

implementation
uses
  Common, DBModule, Help, Main;
{$R *.dfm}

procedure TKioskDesignForm.ColorPopupMenuPopup(Sender: TObject);
begin
  inherited;
  SelectedPanel   := TAdvPanel(ColorPopupMenu.PopupComponent);
  ColorPopupCopyItem.Visible       := MoveSizeCheckBox.Checked;
  ColorPopupTopPasteItem.Visible   := MoveSizeCheckBox.Checked;
  ColorPopupLeftPasteItem.Visible  := MoveSizeCheckBox.Checked;
end;

procedure TKioskDesignForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  GetKioskDesign;
end;

procedure TKioskDesignForm.DefaultDesignButtonClick(Sender: TObject);
var vHeadStoreCode,
    vStoreCode :String;
begin
  inherited;
  if (Sender <> nil) and not AskBox('기본 디자인으로 변경하시겠습니까?') then Exit;

  try
    vHeadStoreCode := HeadStoreCode;
    vStoreCode     := StoreCode;
    HeadStoreCode := '00000000';
    StoreCode     := '00000000';
    GetKioskDesign;
  finally
    HeadStoreCode := vHeadStoreCode;
    StoreCode     := vStoreCode;
  end;
end;

procedure TKioskDesignForm.DeleteColorItemClick(Sender: TObject);
begin
  inherited;
  TAdvPanel(ColorPopupMenu.PopupComponent).CollapsColor := clWhite;
  isChanged            := true;
end;

procedure TKioskDesignForm.DesignLoadButtonClick(Sender: TObject);
var
  vFileName: String;
  vStringList :TStringList;
  vIndex :Integer;
begin
  inherited;
  if (Sender <> nil) and not AskBox('디자인 설정을 불러오겠습니까?') then Exit;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\Kiosk\KioskDesign.txt') then
  begin
    if (Sender <> nil) then
      ErrBox(ExtractFilePath(Application.ExeName)+'\Kiosk\KioskDesign.txt'+' 파일이 없습니다.');
    Exit;
  end;

  vFileName   := ExtractFilePath(Application.ExeName)+'\Kiosk\KioskDesign.txt';
  vStringList := TStringList.Create;
  try
    if ZoomCheckBox.Checked then
      ZoomCheckBox.Checked := false;

    vStringList.LoadFromFile(vFileName);
    try
      ExecQuery('delete from MS_CODE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_KIND  =:P2;',
                [HeadStoreCode,
                 StoreCode,
                 GetStrPointerData(ConditionToolBarComboBox)],
                false);


      for vIndex := 0 to vStringList.Count - 1 do
      begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, NM_CODE9, NM_CODE10, '
                   +'                    NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15) '
                   +'             values(:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12, :P13, :P14, :P15, :P16, :P17, :P18);',
                   [HeadStoreCode,
                    StoreCode,
                    GetStrPointerData(ConditionToolBarComboBox),
                    CopyPos(vStringList.Strings[vIndex], #28, 2),
                    CopyPos(vStringList.Strings[vIndex], #28, 3),
                    CopyPos(vStringList.Strings[vIndex], #28, 4),
                    CopyPos(vStringList.Strings[vIndex], #28, 5),
                    CopyPos(vStringList.Strings[vIndex], #28, 6),
                    CopyPos(vStringList.Strings[vIndex], #28, 7),
                    CopyPos(vStringList.Strings[vIndex], #28, 8),
                    CopyPos(vStringList.Strings[vIndex], #28, 9),
                    CopyPos(vStringList.Strings[vIndex], #28, 10),
                    CopyPos(vStringList.Strings[vIndex], #28, 11),
                    CopyPos(vStringList.Strings[vIndex], #28, 12),
                    CopyPos(vStringList.Strings[vIndex], #28, 13),
                    CopyPos(vStringList.Strings[vIndex], #28, 14),
                    CopyPos(vStringList.Strings[vIndex], #28, 15),
                    CopyPos(vStringList.Strings[vIndex], #28, 16),
                    CopyPos(vStringList.Strings[vIndex], #28, 17)],false);
      end;
      ExecQuery(TempSQL, [], true);
      isChanged := false;
      GetKioskDesign;
      if (Sender <> nil) then
        MsgBox('디자인 불러오기가 정상 처리되었습니다.');
    except
    end;
  finally
    vStringList.Free;
  end;
end;

procedure TKioskDesignForm.DesignSaveButtonClick(Sender: TObject);
var
  vFileName,
  vData: String;
  vCol     : Integer;
begin
  inherited;
  if isChanged and not AskBox('저장하지 않은 내역은 내보낼 수 없습니다.'+#13+'계속하시겠습니까?') then Exit;

  vFileName := ExtractFilePath(Application.ExeName)+'\Kiosk\KioskDesign.txt';

  if FileExists(vFileName) then DeleteFile(vFileName);
  if ZoomCheckBox.Checked then
    ZoomCheckBox.Checked := false;

  // 파일 불러오기
  with TStringList.Create do
    try
      if FileExists(vFileName) then
        LoadFromFile(vFileName);

      try
        OpenQuery('select   CD_KIND, CD_CODE, '
                 +'         NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
                 +'         NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15 '
                 +'  from   MS_CODE '
                 +' where   CD_HEAD  =:P0 '
                 +'   and   CD_STORE =:P1 '
                 +'   and   CD_KIND  =:P2 '
                 +' order by CD_KIND, CD_CODE',
                  [HeadStoreCode,
                   StoreCode,
                   GetStrPointerData(ConditionToolBarComboBox)]);

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

function TKioskDesignForm.DoSave: Boolean;
var vIndex :Integer;
    vSQL  :String;
begin
  result := false;
  if ZoomCheckBox.Checked then
    ZoomCheckBox.Checked := false;

  try
    //키오스크
    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =:P2; ',
             [HeadStoreCode,
              StoreCode,
              GetStrPointerData(ConditionToolBarComboBox)],false);
    vSQL := '';
    for vIndex := 1 to 31 do
    begin
      if vIndex in [29,30] then Continue;
      if vIndex = 1 then
        vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s''),',
                              [HeadStoreCode,
                               StoreCode,
                               GetStrPointerData(ConditionToolBarComboBox),
                               FormatFloat('000',vIndex),
                               GetOnlyNumber(KiosDisplayXEdit.Text),
                               GetOnlyNumber(KiosDisplayYEdit.Text),
                               IntToStr(Kiosk002SpinEdit.Value),
                               IntToStr(Kiosk003SpinEdit.Value),
                               IntToStr(Kiosk004SpinEdit.Value),
                               IntToStr(Kiosk005SpinEdit.Value),
                               Ifthen(Kiosk006CheckBox.Checked,'1','0'),
                               Ifthen(Kiosk007CheckBox.Checked,'1','0'),
                               IntToStr(Kiosk008SpinEdit.Value),
                               '1',
                               IntToStr(Kiosk010SpinEdit.Value),
                               GetStrPointerData(Kiosk011ComboBox),
                               GetStrPointerData(Kiosk012ComboBox),
                               GetStrPointerData(Kiosk013ComboBox),
                               Ifthen(Kiosk014CheckBox.Checked,'1','0')])
      else
      begin
        vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'','''','''',''%s''),',
                              [HeadStoreCode,
                               StoreCode,
                               GetStrPointerData(ConditionToolBarComboBox),
                               FormatFloat('000',vIndex),
                               IntToStr(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Left),
                               IntToStr(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Top),
                               IntToStr(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Width),
                               IntToStr(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Height),
                               Ifthen(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Visible,'0','1'),
                               TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Caption.Font.Name,                      //NM_CODE6
                               ColorToString(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Caption.Font.Color),      //NM_CODE7
                               IntToStr(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Caption.Font.Size),            //NM_CODE8
                               ColorToString(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).CollapsColor),            //NM_CODE9
                               ColorToString(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).StatusBar.Color),         //NM_CODE10 버튼색상 또는 선택폰트색상
                               ColorToString(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).StatusBar.ColorTo),       //NM_CODE11
                               Ifthen(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Caption.Font.Style = [fsBold], '1','0'),
                               LeftStr(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Text, Pos('<',TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Text)-1) ]); //NM_CODE12
      end;
    end;

    vSQL := 'insert into MS_CODE(CD_HEAD, '    //:P0
           +'                    CD_STORE, '   //:P1,
           +'                    CD_KIND, '    //:P2,
           +'                    CD_CODE, '    //:P3,
           +'                    NM_CODE1, '   //:P4,
           +'                    NM_CODE2, '   //:P5,
           +'                    NM_CODE3, '   //:P6,
           +'                    NM_CODE4, '   //:P7,
           +'                    NM_CODE5, '   //:P8,
           +'                    NM_CODE6, '   //:P9,
           +'                    NM_CODE7, '   //:P10,
           +'                    NM_CODE8, '   //:P11
           +'                    NM_CODE9, '   //:P12
           +'                    NM_CODE10, '  //:P13
           +'                    NM_CODE11, '  //:P14
           +'                    NM_CODE12, '  //:P15
           +'                    NM_CODE13, '  //:P16
           +'                    NM_CODE14, ' //:P17
           +'                    NM_CODE15) values  '
           + LeftStr(vSQL, Length(vSQL)-1)+';';

    Result := ExecQuery(vSQL, [], true);
    ShowMsg('저장 했습니다.');
    isChanged := false;
    ButtonToolbarSaveButton.Enabled := false;
  except
    on E: Exception do
    begin
      ErrBox(Format('저장하지 못했습니다.'#13'%s', [E.Message]));
    end;
  end
end;

procedure TKioskDesignForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = KioskFontNameComboBox) and (KioskSelectedPanel <> nil) then
  begin
    KioskSelectedPanel.Caption.Font.Name  := KioskFontNameComboBox.FontName;
  end
  else if Sender = KioskFontColorValueEdit then
  begin
    if KioskFontColorValueEdit.Text <> EmptyStr then
      KioskFontColorPanel.Color := StringToColor(KioskFontColorValueEdit.Text);
  end
  else if Sender = CaptionEdit then
  begin
    if CaptionEdit.Text <> EmptyStr then
      KioskSelectedPanel.Text := CaptionEdit.Text + '<P align="center"></P>';
  end;
  isChanged := true;
end;

procedure TKioskDesignForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  isLoading := true;
  SelectedPanel := TAdvPanel.Create(Self);
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '84';
  ConditionToolBarComboBox.Properties.Items.AddObject('일반', TObject(vCode));
  New(vCode);
  vCode^.Data := '85';
  ConditionToolBarComboBox.Properties.Items.AddObject('접근성(저자세)', TObject(vCode));
  New(vCode);
  vCode^.Data := '86';
  ConditionToolBarComboBox.Properties.Items.AddObject('접근성(저시력)', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;


  Kiosk011ComboBox.Properties.Items.Clear;
  Kiosk012ComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  Kiosk011ComboBox.Properties.Items.AddObject('좌측정렬', TObject(vCode));
  Kiosk012ComboBox.Properties.Items.AddObject('좌측정렬', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  Kiosk011ComboBox.Properties.Items.AddObject('가운데', TObject(vCode));
  Kiosk012ComboBox.Properties.Items.AddObject('가운데', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  Kiosk011ComboBox.Properties.Items.AddObject('우측정렬', TObject(vCode));
  Kiosk012ComboBox.Properties.Items.AddObject('우측정렬', TObject(vCode));
  Kiosk011ComboBox.ItemIndex := 0;
  Kiosk012ComboBox.ItemIndex := 0;

  Kiosk013ComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  Kiosk013ComboBox.Properties.Items.AddObject('표시안함', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  Kiosk013ComboBox.Properties.Items.AddObject('위', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  Kiosk013ComboBox.Properties.Items.AddObject('아래', TObject(vCode));
  New(vCode);
  vCode^.Data := '3';
  Kiosk013ComboBox.Properties.Items.AddObject('좌측', TObject(vCode));
  New(vCode);
  vCode^.Data := '4';
  Kiosk013ComboBox.Properties.Items.AddObject('우측', TObject(vCode));
  Kiosk013ComboBox.ItemIndex := 0;
end;

procedure TKioskDesignForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if Shift = [ssCtrl, ssShift] then
  begin
    if KioskSelectedPanel = nil then Exit;
    try
      isLoading := true;
      case Key of
        VK_LEFT  : (KioskSelectedPanel as TAdvPanel).Left := (KioskSelectedPanel as TAdvPanel).Left - 5;
        VK_RIGHT : (KioskSelectedPanel as TAdvPanel).Left := (KioskSelectedPanel as TAdvPanel).Left + 5;
        VK_UP    : (KioskSelectedPanel as TAdvPanel).Top  := (KioskSelectedPanel as TAdvPanel).Top  - 5;
        VK_DOWN  : (KioskSelectedPanel as TAdvPanel).Top  := (KioskSelectedPanel as TAdvPanel).Top  + 5;
      end;
      KioskTopEdit.Value    := (KioskSelectedPanel as TAdvPanel).Top;
      KioskLeftEdit.Value   := (KioskSelectedPanel as TAdvPanel).Left;
      KioskHeightEdit.Value := (KioskSelectedPanel as TAdvPanel).Height;
      KioskWidthEdit.Value  := (KioskSelectedPanel as TAdvPanel).Width;
    finally
      isLoading := false;
      isChanged := true;
    end;
//    Key := 0;
  end
  else if Shift = [ssCtrl] then
  begin
    if KioskSelectedPanel = nil then Exit;
    try
      isLoading := true;
      case Key of
        VK_LEFT  : (KioskSelectedPanel as TAdvPanel).Left := (KioskSelectedPanel as TAdvPanel).Left - 1;
        VK_RIGHT : (KioskSelectedPanel as TAdvPanel).Left := (KioskSelectedPanel as TAdvPanel).Left + 1;
        VK_UP    : (KioskSelectedPanel as TAdvPanel).Top  := (KioskSelectedPanel as TAdvPanel).Top  - 1;
        VK_DOWN  : (KioskSelectedPanel as TAdvPanel).Top  := (KioskSelectedPanel as TAdvPanel).Top  + 1;
      end;
      KioskTopEdit.Value    := (KioskSelectedPanel as TAdvPanel).Top;
      KioskLeftEdit.Value   := (KioskSelectedPanel as TAdvPanel).Left;
      KioskHeightEdit.Value := (KioskSelectedPanel as TAdvPanel).Height;
      KioskWidthEdit.Value  := (KioskSelectedPanel as TAdvPanel).Width;
    finally
      isLoading := false;
      isChanged := true;
    end;
//    Key := 0;
  end
  else if Shift = [ssShift] then
  begin
    if KioskSelectedPanel = nil then Exit;
    try
      isLoading := true;
      case Key of
        VK_LEFT  : (KioskSelectedPanel as TAdvPanel).Width   := (KioskSelectedPanel as TAdvPanel).Width - 1;
        VK_RIGHT : (KioskSelectedPanel as TAdvPanel).Width   := (KioskSelectedPanel as TAdvPanel).Width + 1;
        VK_UP    : (KioskSelectedPanel as TAdvPanel).Height  := (KioskSelectedPanel as TAdvPanel).Height  - 1;
        VK_DOWN  : (KioskSelectedPanel as TAdvPanel).Height  := (KioskSelectedPanel as TAdvPanel).Height  + 1;
      end;
      KioskTopEdit.Value    := (KioskSelectedPanel as TAdvPanel).Top;
      KioskLeftEdit.Value   := (KioskSelectedPanel as TAdvPanel).Left;
      KioskHeightEdit.Value := (KioskSelectedPanel as TAdvPanel).Height;
      KioskWidthEdit.Value  := (KioskSelectedPanel as TAdvPanel).Width;
    finally
      isLoading := false;
      isChanged := true;
    end;
//    Key := 0;
  end;
end;

procedure TKioskDesignForm.FormShow(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select Count(*) '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GetStrPointerData(ConditionToolBarComboBox)]);

    if Query.Fields[0].AsInteger = 0 then
    begin
      Query.Close;
      DefaultDesignButtonClick(nil);
    end
    else
      GetKioskDesign;
  finally
    FinishQuery;
  end;
  SetMoveSize;
  isLoading := false;
  isChanged := false;
end;

procedure TKioskDesignForm.GetKioskDesign;
begin
  Kiosk027Item.Visible := GetStrPointerData(ConditionToolBarComboBox) <> '84';
  Kiosk028Item.Visible := GetStrPointerData(ConditionToolBarComboBox) <> '84';
  //키오스크
  try
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1, '      //1 Left
             +'       NM_CODE2, '      //2 Top
             +'       NM_CODE3, '      //3 Width
             +'       NM_CODE4, '      //4 Height
             +'       Ifnull(NM_CODE5,''0''), ' //5 Visible
             +'       NM_CODE6, '      //6 Color
             +'       NM_CODE7, '       //7 FontSize
             +'       NM_CODE8, '       //8
             +'       NM_CODE9, '       //9
             +'       NM_CODE10, '      //10
             +'       NM_CODE11, '      //11
             +'       NM_CODE12, '      //12
             +'       NM_CODE13, '
             +'       NM_CODE14, '
             +'       NM_CODE15 '
             +'  from MS_CODE '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and CD_KIND    =:P2 '
             +' order by CD_CODE',
             [HeadStoreCode,
              StoreCode,
              GetStrPointerData(ConditionToolBarComboBox)]);
    KiosDisplayXEdit.Value     := 1080;
    KiosDisplayYEdit.Value     := 1920;
    while not Query.Eof do
    begin
      case StoI(Query.Fields[0].AsString) of
        1 :
        begin
          KiosDisplayXEdit.Value     := StrToIntDef(Query.Fields[1].AsString,1024);  //해상도 가로
          KiosDisplayYEdit.Value     := StrToIntDef(Query.Fields[2].AsString,768);   //해상도 세로
          Kiosk002SpinEdit.Value     := StrToIntDef(Query.Fields[3].AsString,3);    //PLU분류 버튼 갯수
          Kiosk003SpinEdit.Value     := StrToIntDef(Query.Fields[4].AsString,4);    //PLU메뉴 X
          Kiosk004SpinEdit.Value     := StrToIntDef(Query.Fields[5].AsString,5);    //PLU메뉴 Y
          Kiosk005SpinEdit.Value     := StrToIntDef(Query.Fields[6].AsString,10);   //주문메뉴 보일 갯수
          Kiosk006CheckBox.Checked   := Query.Fields[7].AsString = '1';             //메뉴 이미지 테두리 사용
          Kiosk007CheckBox.Checked   := Query.Fields[8].AsString = '1';
          Kiosk008SpinEdit.Value     := StrToIntDef(Query.Fields[9].AsString,10);  //하단높이
//          Kiosk009CheckBox.Checked   := Query.Fields[10].AsString = '1';           //메뉴명표시
          Kiosk010SpinEdit.Value     := StrToIntDef(Query.Fields[11].AsString,5);  //PLU간격
          Kiosk011ComboBox.ItemIndex := GetStrPointerIndex(Kiosk011ComboBox, Query.Fields[12].AsString);
          Kiosk012ComboBox.ItemIndex := GetStrPointerIndex(Kiosk012ComboBox, Query.Fields[13].AsString);
          Kiosk013ComboBox.ItemIndex := GetStrPointerIndex(Kiosk013ComboBox, Query.Fields[14].AsString);
          Kiosk014CheckBox.Checked   := Query.Fields[15].AsString = '1';           //메뉴명표시
          KioskDesignPanel.Width     := KiosDisplayXEdit.EditValue;
          KioskDesignPanel.Height    := KiosDisplayYEdit.EditValue;
          if Kiosk002SpinEdit.Value = 0 then
            Kiosk002SpinEdit.Value := 1;
        end;
        2..31:
        begin
          if Assigned(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString])))) then
          begin
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Left    := StrToIntDef(Query.Fields[1].AsString,TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Left);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Top     := StrToIntDef(Query.Fields[2].AsString,TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Top);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Width   := StrToIntDef(Query.Fields[3].AsString,TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Width);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Height  := StrToIntDef(Query.Fields[4].AsString,TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Height);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Visible := Query.Fields[5].AsString = '0';
            if StoI(Query.Fields[0].AsString) in [2,3,9,10,11,12,14,15,16,17,18,19,20,21,22,23,24,25,27,28,31] then //PLU분류, 현금, 카드, <, ㅇㅇㅇ, >
              TMenuItem(FindComponent(Format('Kiosk%sItem',[Query.Fields[0].AsString]))).Checked := Query.Fields[5].AsString = '0';
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Caption.Font.Name := Ifthen(Query.Fields[6].AsString='','맑은 고딕', Query.Fields[6].AsString);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Caption.Font.Color := StringToColorDef(Query.Fields[7].AsString, clBlack);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Caption.Font.Size := StrToIntDef(Query.Fields[8].AsString,15);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).CollapsColor        := StringToColorDef(Query.Fields[9].AsString, clWhite);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).StatusBar.Color     := StringToColorDef(Query.Fields[10].AsString, clWhite);
            TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).StatusBar.ColorTo   := StringToColorDef(Query.Fields[11].AsString, clWhite);
            if Query.Fields[12].AsString = '1' then
              TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Caption.Font.Style   := [fsBold]
            else
              TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Caption.Font.Style   := [];

            if StoI(Query.Fields[0].AsString) in [5,10,11,12,13,19,20,21,22,25,27,31] then
            begin
              if Query.Fields[15].AsString <> '' then
                TAdvPanel(FindComponent(Format('Kiosk%sPanel',[Query.Fields[0].AsString]))).Text := Query.Fields[15].AsString + '<P align="center"></P>';
            end;
            if GetStrPointerData(ConditionToolBarComboBox) = '84' then
            begin
              Kiosk027Panel.Visible := false;
              Kiosk028Panel.Visible := false;
            end;
          end;
        end;
      end;
      Query.Next;
    end;
  finally
    Query.Close;
    isChanged := false;
  end;
end;

procedure TKioskDesignForm.ImageButtonClick(Sender: TObject);
var vFiles: TSearchRec;
    vHeight,
    vWidth :Integer;
begin
  inherited;
  if not OpenDialog.Execute then Exit;

  ZoomCheckBox.Checked := false;
  FindFirst(OpenDialog.FileName,faArchive,vFiles);

  if Assigned(TImage(FindComponent('MainImage')))  then
    TImage(FindComponent('MainImage')).Free;

    with TPicture.Create do
    try
      LoadFromFile(OpenDialog.FileName);
      vHeight := Height;
      vWidth  := Width;
    finally
      Free;
    end;


  with TImage.Create(Self) do
  begin
    Parent      := KioskDesignPanel;
    Name        := 'MainImage';
    Align       := alClient;
    Stretch     := true;
    Picture.LoadFromFile(OpenDialog.FileName);
    KiosDisplayYEdit.EditValue  := vHeight;
    KiosDisplayXEdit.EditValue  := vWidth;
    Caption     := EmptyStr;
    SendToBack;

    KioskDesignPanel.Width  := KiosDisplayXEdit.EditValue;
    KioskDesignPanel.Height := KiosDisplayYEdit.EditValue;
  end;
end;

procedure TKioskDesignForm.KiosDisplayXEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if (Sender = KiosDisplayXEdit) then
    KioskDesignPanel.Width  := KiosDisplayXEdit.EditValue
  else if (Sender = KiosDisplayYEdit) then
    KioskDesignPanel.Height := KiosDisplayYEdit.EditValue;
end;

procedure TKioskDesignForm.Kiosk002ItemClick(Sender: TObject);
begin
  inherited;
  if ZoomCheckBox.Checked then
    ZoomCheckBox.Checked := false;
  cxScrollBox1.VertScrollBar.Position := 0;
  cxScrollBox1.HorzScrollBar.Position := 0;

  //안보이다 보일 경우 마우스 위치에 보여준다
  if not TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))).Visible then
  begin
    TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))).Top  := 5;
    TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))).Left := 5;
    TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))).Visible := True;
  end
  else
    TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))).Visible := false;
  (Sender as TMenuItem).Checked  := TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))).Visible;
  if TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))).Visible then
    Kiosk002PanelClick(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[GetOnlyNumber((Sender as TMenuItem).Name)]))));
  isChanged := true;
end;

procedure TKioskDesignForm.Kiosk002PanelClick(Sender: TObject);
var vName :String;
begin
  inherited;
  if KioskSelectedPanel <> nil then
    KioskSelectedPanel.ColorTo := $00FF8000;

  (Sender as TAdvPanel).BringToFront;
  vName := (Sender as TAdvPanel).Name;
  KioskSelectedPanel             := Sender as TAdvPanel;
  (Sender as TAdvPanel).ColorTo  := $0080FFFF;
  KioskWokGroupBox.Caption       := (Sender as TAdvPanel).Hint;
  KioskWokGroupBox.Enabled       := true;
  KioskTopEdit.Value             := (Sender as TAdvPanel).Top;
  KioskLeftEdit.Value            := (Sender as TAdvPanel).Left;
  KioskHeightEdit.Value          := (Sender as TAdvPanel).Height;
  KioskWidthEdit.Value           := (Sender as TAdvPanel).Width;
  KioskFontNameComboBox.FontName := (Sender as TAdvPanel).Caption.Font.Name;
  KioskFontSizeSpinEdit.Value    := (Sender as TAdvPanel).Caption.Font.Size;
  KioskFontColorPanel.Color      := (Sender as TAdvPanel).Caption.Font.Color;
  KioskFontDownColorPanel.Color  := (Sender as TAdvPanel).CollapsColor;
  KioskFontNameComboBox.Properties.FontPreview.FontStyle := (Sender as TAdvPanel).Caption.Font.Style;

  if vName = 'Kiosk002Panel' then
  begin
    KioskFontDownColorLabel.Caption := '선택색상';
    KioskFontDownColorLabel.Visible := true;
    KioskFontDownColorPanel.Visible := true;
  end
  else if (vName = 'Kiosk004Panel') then
  begin
    KioskFontDownColorLabel.Visible := false;
    KioskFontDownColorPanel.Visible := false;
  end
  else if (vName = 'Kiosk005Panel') or  (vName = 'Kiosk010Panel') or (vName = 'Kiosk009Panel') or (vName = 'Kiosk019Panel') or (vName = 'Kiosk021Panel')
          or (vName = 'Kiosk013Panel') or (vName = 'Kiosk022Panel') or (vName = 'Kiosk012Panel') or (vName = 'Kiosk020Panel') or (vName = 'Kiosk011Panel') then
  begin
    KioskFontDownColorLabel.Caption := '버튼색상';
    KioskFontDownColorLabel.Visible := true;
    KioskFontDownColorPanel.Visible := true;
  end
  else if (vName = 'Kiosk026Panel') then
  begin
    KioskWokGroupBox.Enabled := false;
  end
  else
  begin
    KioskFontDownColorLabel.Visible := false;
    KioskFontDownColorPanel.Visible := false;
  end;

  if (vName = 'Kiosk005Panel') or (vName = 'Kiosk010Panel') or (vName = 'Kiosk011Panel') or (vName = 'Kiosk012Panel') or (vName = 'Kiosk013Panel') or (vName = 'Kiosk019Panel')
     or (vName = 'Kiosk020Panel') or (vName = 'Kiosk021Panel') or (vName = 'Kiosk022Panel') or (vName = 'Kiosk025Panel') or (vName = 'Kiosk027Panel') or (vName = 'Kiosk031Panel') then
  begin
    CaptionEdit.Enabled := true;
    CaptionEdit.Text    := LeftStr((Sender as TAdvPanel).Text, Pos('<',(Sender as TAdvPanel).Text)-1) ;
  end
  else
  begin
    CaptionEdit.Enabled := false;
    CaptionEdit.Text    := '';
  end;

  FontGroupBox.Visible     := true;

  if KioskFontColorPanel.Visible then
    KioskFontColorValueEdit.Text := ColorToString(KioskFontColorPanel.Color);
end;

procedure TKioskDesignForm.Kiosk002PanelClose(Sender: TObject);
begin
  inherited;
  TMenuItem(FindComponent(Format('Kiosk%sItem',[GetOnlyNumber((Sender as TAdvPanel).Name)]))).Checked := false;
end;

procedure TKioskDesignForm.Kiosk002PanelEndMoveSize(Sender: TObject);
begin
  inherited;

  if KioskSelectedPanel <> nil then
    KioskSelectedPanel.ColorTo := $00FF8000;
  (Sender as TAdvPanel).ColorTo  := $0080FFFF;

  if ((Sender as TAdvPanel).Height < 10) or ((Sender as TAdvPanel).Width < 10) then
  begin
    MsgBox('최소 크기 이하입니다');
    (Sender as TAdvPanel).Height := KioskHeightEdit.EditValue;
    (Sender as TAdvPanel).Width  := KioskWidthEdit.EditValue;
  end;

  KioskSelectedPanel       := Sender as TAdvPanel;
  KioskWokGroupBox.Caption := (Sender as TAdvPanel).Hint;
  KioskTopEdit.Value       := (Sender as TAdvPanel).Top;
  KioskLeftEdit.Value      := (Sender as TAdvPanel).Left;
  KioskHeightEdit.Value    := (Sender as TAdvPanel).Height;
  KioskWidthEdit.Value     := (Sender as TAdvPanel).Width;

  isChanged := true;
end;

procedure TKioskDesignForm.Kiosk002PanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;

procedure TKioskDesignForm.Kiosk002PanelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if not MoveSizeCheckBox.Checked then Exit;

  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
  end;
end;

procedure TKioskDesignForm.Kiosk002PanelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := false;
end;

procedure TKioskDesignForm.KioskFontColorPanelClick(Sender: TObject);
begin
  inherited;
  if KioskSelectedPanel = nil then
  begin
    MsgBox('작업대상을 먼저 선택하세요');
    Exit;
  end;
  ColorDialog.Color := (Sender as TPanel).Color;
  if ColorDialog.Execute then
  begin
    (Sender as TPanel).Color      := ColorDialog.Color;
    if Sender = KioskFontColorPanel then
    begin
      KioskSelectedPanel.Caption.Font.Color := ColorDialog.Color;
      KioskFontColorValueEdit.Text := ColorToString(ColorDialog.Color);
    end
    else if Sender = KioskFontDownColorPanel then
      KioskSelectedPanel.CollapsColor := ColorDialog.Color;

    (Sender as TPanel).Caption    := EmptyStr;
    isChanged            := true;
  end
  else if AskBox('색상을 삭제하시겠습니까?') then
  begin
    (Sender as TPanel).Caption := '없음';
    (Sender as TPanel).Color   := clWhite;
    isChanged            := true;
  end;
end;

procedure TKioskDesignForm.KioskFontNameComboBoxPropertiesFontPreviewButtonClick(
  Sender: TObject; ButtonType: TcxFontButtonType);
begin
  inherited;
  KioskSelectedPanel.Caption.Font.Style   := KioskFontNameComboBox.Properties.FontPreview.FontStyle;
end;

procedure TKioskDesignForm.KioskFontSizeSpinEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  EditPropertiesChange(KioskFontSizeSpinEdit);
  KioskSelectedPanel.Caption.Font.Size := KioskFontSizeSpinEdit.Value;
end;

procedure TKioskDesignForm.KioskInitButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('설정을 초기화 하시겠습니까?') then Exit;
  ExecQuery('delete '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  =:P2;',
           [HeadStoreCode,
            StoreCode,
            GetStrPointerData(ConditionToolBarComboBox)]);
  MsgBox('환경설정을 종료 후 다시 실행하세요');
end;


procedure TKioskDesignForm.KioskPopupPopup(Sender: TObject);
var vTemp :String;
begin
  inherited;
  vTemp := TAdvPanel(KioskPopup.PopupComponent).Name;
  if vTemp = 'KioskDesignPanel' then
  begin
    SizeCopyMenuItem.Visible       := false;
    SizePasteTopMenuItem.Visible   := false;
    SizePasteLeftMenuItem.Visible  := false;
  end
  else
  begin
    SelectedPanel   := TAdvPanel(KioskPopup.PopupComponent);
    SizeCopyMenuItem.Visible       := MoveSizeCheckBox.Checked;
    SizePasteTopMenuItem.Visible   := MoveSizeCheckBox.Checked;
    SizePasteLeftMenuItem.Visible  := MoveSizeCheckBox.Checked;
  end;
end;

procedure TKioskDesignForm.KioskTopEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if isLoading then Exit;

  if (Sender = KiosDisplayXEdit) then
    KioskDesignPanel.Width  := DisplayValue
  else if (Sender = KiosDisplayYEdit) then
    KioskDesignPanel.Height := DisplayValue
  else if (Sender = KioskTopEdit) and (KioskSelectedPanel <> nil) then
  begin
    KioskSelectedPanel.Top := DisplayValue;
    KioskTopEdit.SelStart := Length(KioskTopEdit.Text);
    KioskTopEdit.SetFocus;
  end
  else if (Sender = KioskLeftEdit) and (KioskSelectedPanel <> nil) then
  begin
    KioskSelectedPanel.Left := DisplayValue;
    KioskLeftEdit.SelStart := Length(KioskLeftEdit.Text);
    KioskLeftEdit.SetFocus;
  end
  else if (Sender = KioskHeightEdit) and (KioskSelectedPanel <> nil) then
  begin
    KioskSelectedPanel.Height := DisplayValue;
    KioskHeightEdit.SelStart := Length(KioskHeightEdit.Text);
    KioskHeightEdit.SetFocus;
  end
  else if (Sender = KioskWidthEdit) and (KioskSelectedPanel <> nil) then
  begin
    KioskSelectedPanel.Width := DisplayValue;
    KioskWidthEdit.SelStart := Length(KioskWidthEdit.Text);
    KioskWidthEdit.SetFocus;
  end;
  if (Sender = KioskFontNameComboBox) and (KioskSelectedPanel <> nil) then
    KioskSelectedPanel.Caption.Font.Name := KioskFontNameComboBox.FontName
  else if Sender = KioskFontColorValueEdit then
  begin
    if KioskFontColorValueEdit.Text <> EmptyStr then
      KioskFontColorPanel.Color := StringToColor(KioskFontColorValueEdit.Text);
  end;
end;

procedure TKioskDesignForm.MemberInfo1LabelClick(Sender: TObject);
begin
  inherited;
  if Sender is TLabel then
  begin
    if SelectedControl <> nil  then
      SelectedControl.Transparent := true;

    (Sender as TLabel).Transparent := false;
    SelectedControl := Sender as TLabel;
    SetSelectedControl(SelectedControl);
  end;
end;

procedure TKioskDesignForm.MemberInfo1LabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;

procedure TKioskDesignForm.MemberInfo1LabelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
  end;
end;

procedure TKioskDesignForm.MemberInfo1LabelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := false;
  isChanged   := true;
end;

procedure TKioskDesignForm.MoveSizeCheckBoxPropertiesChange(Sender: TObject);
begin
  inherited;
  SetMoveSize;
end;

procedure TKioskDesignForm.RatingBluePanelClick(Sender: TObject);
begin
  inherited;
  RatingBluePanel.Caption  := '';
  RatingBlackPanel.Caption := '';
  RatingRedPanel.Caption   := '';
  KioskSelectedPanel.StatusBar.Color := (Sender as TPanel).Color;
  (Sender as TPanel).Caption := 'v';
end;

procedure TKioskDesignForm.SetMoveSize;
var vIndex :Integer;
begin
  for vIndex := 2 to 31 do
  begin
    if vIndex in [29,30] then Continue;
    TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).CanMove := MoveSizeCheckBox.Checked;
    TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).CanSize := MoveSizeCheckBox.Checked;
  end;
end;

procedure TKioskDesignForm.SetSelectedControl(aControl: TLabel);
begin
  KioskTopEdit.Value             := SelectedControl.Top;
  KioskLeftEdit.Value            := SelectedControl.Left;
  KioskHeightEdit.Value          := SelectedControl.Height;
  KioskWidthEdit.Value           := SelectedControl.Width;
  KioskFontNameComboBox.FontName := SelectedControl.Font.Name;
  KioskFontSizeSpinEdit.Value    := SelectedControl.Font.Size;
  KioskFontColorPanel.Color      := SelectedControl.Font.Color;

  SelectedControl.Refresh;
end;

procedure TKioskDesignForm.SizeCopyMenuItemClick(Sender: TObject);
begin
  inherited;
  CopyHeight  := (SelectedPanel as TAdvPanel).Height;
  CopyWidth   := (SelectedPanel as TAdvPanel).Width;
  CopyLeft    := (SelectedPanel as TAdvPanel).Left;
  CopyTop     := (SelectedPanel as TAdvPanel).Top;
  SizePasteTopMenuItem.Enabled  := true;
  SizePasteLeftMenuItem.Enabled := true;
  ColorPopupTopPasteItem.Enabled  := true;
  ColorPopupLeftPasteItem.Enabled := true;
end;

procedure TKioskDesignForm.SizePasteLeftMenuItemClick(Sender: TObject);
begin
  inherited;
  (SelectedPanel as TAdvPanel).Left    := CopyLeft;
  (SelectedPanel as TAdvPanel).Height  := CopyHeight;
  (SelectedPanel as TAdvPanel).Width   := CopyWidth;
  isChanged :=true;
end;

procedure TKioskDesignForm.SizePasteTopMenuItemClick(Sender: TObject);
begin
  inherited;
  (SelectedPanel as TAdvPanel).Top     := CopyTop;
  (SelectedPanel as TAdvPanel).Height  := CopyHeight;
  (SelectedPanel as TAdvPanel).Width   := CopyWidth;
  isChanged :=true;
end;

procedure TKioskDesignForm.ZoomCheckBoxPropertiesChange(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  cxScrollBox1.VertScrollBar.Position := 0;
  cxScrollBox1.HorzScrollBar.Position := 0;
  if ZoomCheckBox.Checked then
  begin
    KioskDesignPanel.ScaleBy(50, 100);
    for vIndex := 1 to 32 do
      if Assigned(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)])))) then
        TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Font.Size := 12;
  end
  else
  begin
    KioskDesignPanel.ScaleBy(200, 100);
    for vIndex := 1 to 32 do
      if Assigned(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)])))) then
        TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Font.Size := 10;
  end;

end;

end.
