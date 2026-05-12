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
}
unit HeadKioskDesign;

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
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadKioskDesignForm = class(TInheritEditForm)
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
    Label167: TLabel;
    Kiosk002SpinEdit: TcxSpinEdit;
    DesignSaveButton: TAdvGlowButton;
    DesignLoadButton: TAdvGlowButton;
    Kiosk005SpinEdit: TcxSpinEdit;
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
    Label2: TLabel;
    Label3: TLabel;
    cxGroupBox18: TcxGroupBox;
    Label163: TLabel;
    Label164: TLabel;
    Label170: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Kiosk003SpinEdit: TcxSpinEdit;
    Kiosk004SpinEdit: TcxSpinEdit;
    Kiosk009CheckBox: TcxCheckBox;
    Kiosk010SpinEdit: TcxSpinEdit;
    Kiosk008SpinEdit: TcxSpinEdit;
    Kiosk011ComboBox: TcxComboBox;
    Kiosk012ComboBox: TcxComboBox;
    Label7: TLabel;
    AdvGlowButton1: TAdvGlowButton;
    ZoomCheckBox: TcxCheckBox;
    DefaultDesignButton: TAdvGlowButton;
    KioskWokGroupBox: TcxGroupBox;
    Label174: TLabel;
    Label173: TLabel;
    Label172: TLabel;
    Label171: TLabel;
    KioskWidthEdit: TcxCurrencyEdit;
    KioskHeightEdit: TcxCurrencyEdit;
    KioskLeftEdit: TcxCurrencyEdit;
    KioskTopEdit: TcxCurrencyEdit;
    ColorGroupBox: TcxGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    KioskColorPanel: TPanel;
    KioskDownColorPanel: TPanel;
    KioskColorValueEdit: TcxTextEdit;
    KioskDownColorValueEdit: TcxTextEdit;
    RatingBluePanel: TPanel;
    RatingBlackPanel: TPanel;
    RatingRedPanel: TPanel;
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
    Kiosk006CheckBox: TcxCheckBox;
    Label10: TLabel;
    Kiosk013ComboBox: TcxComboBox;
    KiosDisplayXEdit: TcxCurrencyEdit;
    KiosDisplayYEdit: TcxCurrencyEdit;
    Kiosk007CheckBox: TcxCheckBox;
    Kiosk027Panel: TAdvPanel;
    Kiosk028Panel: TAdvPanel;
    Kiosk031Panel: TAdvPanel;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    CaptionEdit: TcxTextEdit;
    Label5: TLabel;
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
    procedure DefaultDesignButtonClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
  private
    DestStoreCode  :String;
    KioskSelectedPanel :TAdvPanel;
    SelectedControl: TLabel;
    SelectedPanel   : TAdvPanel;
    MouseDowned     : Boolean;
    MouseOldX,
    MouseOldY       : Integer;
    ViewRate        : Integer; //보기(2:50%, 1:100%)
    procedure GetKioskDesign;
    procedure SetSelectedControl(aControl: TLabel);
  protected
    function  DoSave: Boolean; override;                        // 저장
  public
    { Public declarations }
  end;

var
  HeadKioskDesignForm: THeadKioskDesignForm;

implementation
uses
  Common, DBModule, Help, Main;
{$R *.dfm}
procedure THeadKioskDesignForm.FormCreate(Sender: TObject);
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

procedure THeadKioskDesignForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  GetKioskDesign;
end;

procedure THeadKioskDesignForm.DefaultDesignButtonClick(Sender: TObject);
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

procedure THeadKioskDesignForm.DesignLoadButtonClick(Sender: TObject);
var
  vFileName: String;
  vStringList :TStringList;
  vIndex, vCol :Integer;
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
    vStringList.LoadFromFile(vFileName);
    try
      ExecQuery('delete from MS_CODE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+ DestStoreCode
               +'   and CD_KIND = :P1;',
                [HeadStoreCode,
                 GetStrPointerData(ConditionToolBarComboBox)],
                false);


      for vIndex := 0 to vStringList.Count - 1 do
      begin
        ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, NM_CODE9, NM_CODE10, '
                 +'                    NM_CODE11, NM_CODE12, NM_CODE13) '
                 +'             values(:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12, :P13, :P14, :P15, :P16);',
                 [HeadStoreCode,
                  StandardStore,
                  CopyPos(vStringList.Strings[vIndex], #28, 1),
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
                  CopyPos(vStringList.Strings[vIndex], #28, 15)],false);
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

procedure THeadKioskDesignForm.DesignSaveButtonClick(Sender: TObject);
var
  vFileName,
  vData: String;
  vCol     : Integer;
begin
  inherited;
  if isChanged and not AskBox('저장하지 않은 내역은 내보낼 수 없습니다.'+#13+'계속하시겠습니까?') then Exit;

  vFileName := ExtractFilePath(Application.ExeName)+'\Kiosk\KioskDesign.txt';

  if FileExists(vFileName) then DeleteFile(vFileName);

  // 파일 불러오기
  with TStringList.Create do
    try
      if FileExists(vFileName) then
        LoadFromFile(vFileName);

      try
        OpenQuery('select   CD_KIND, CD_CODE, '
                 +'         NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
                 +'         NM_CODE11, NM_CODE12, NM_CODE13 '
                 +'  from   MS_CODE '
                 +' where   CD_HEAD  =:P0 '
                 +'   and   CD_STORE =:P1 '
                 +'   and   CD_KIND  =:P2 '
                 +' order by CD_KIND, CD_CODE',
                  [HeadStoreCode,
                   StandardStore,
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

function THeadKioskDesignForm.DoSave: Boolean;
var vIndex, vIndex2 :Integer;
    vSQL, vKind  :String;
begin
  result := false;
  if ZoomCheckBox.Checked then
    ZoomCheckBox.Checked := false;

  try
    //키오스크
    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE '+DestStoreCode
             +'   and CD_KIND  =:P1;',
             [HeadStoreCode,
              GetStrPointerData(ConditionToolBarComboBox)],false);
    vSQL := '';
    for vIndex2 := 0 to WorkStoreList.Count-1 do
    begin
      if Copy(CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 2),7,1) = '0' then Continue;
      if vIndex in [29,30] then Continue;

      for vIndex := 1 to 31 do
      begin
        if vIndex = 1 then
          vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s''),',
                                [HeadStoreCode,
                                 CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 0),
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
                                 Ifthen(Kiosk009CheckBox.Checked,'1','0'),
                                 IntToStr(Kiosk010SpinEdit.Value),
                                 GetStrPointerData(Kiosk011ComboBox),
                                 GetStrPointerData(Kiosk012ComboBox),
                                 GetStrPointerData(Kiosk013ComboBox)])
        else
          vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'','''',''''),',
                                [HeadStoreCode,
                                 CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 0),
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
                                 ColorToString(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).StatusBar.Color),         //NM_CODE10
                                 ColorToString(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).StatusBar.ColorTo),       //NM_CODE11
                                 Ifthen(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Caption.Font.Style = [fsBold], '1','0')]); //NM_CODE12
      end;
    end;

    if vSQL <> '' then
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
             +'                    NM_CODE14) values  '  //:P17
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

procedure THeadKioskDesignForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = KioskFontNameComboBox) and (KioskSelectedPanel <> nil) then
    KioskSelectedPanel.Caption.Font.Name := KioskFontNameComboBox.FontName
  else if Sender = KioskFontColorValueEdit then
  begin
    if KioskFontColorValueEdit.Text <> EmptyStr then
      KioskFontColorPanel.Color := StringToColor(KioskFontColorValueEdit.Text);
  end;
  isChanged := true;
end;



procedure THeadKioskDesignForm.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure THeadKioskDesignForm.FormShow(Sender: TObject);
var vIndex :Integer;
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
  SetWorkStoreList;

  DestStoreCode := '';
  SetWorkStoreList;
  for vIndex := 0 to WorkStoreList.Count-1 do
  begin
    if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),7,1) = '0' then Continue;
    DestStoreCode := DestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);
  end;
  DestStoreCode := Format(' in (%s) ',[LeftStr(DestStoreCode, Length(DestStoreCode)-1)]);

  isLoading := false;
  isChanged := false;
end;

procedure THeadKioskDesignForm.GetKioskDesign;
var vKind :String;
    vIndex :Integer;
begin
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
             +'       NM_CODE12, '       //12
             +'       NM_CODE13, '
             +'       NM_CODE14 '
             +'  from MS_CODE '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and CD_KIND    =:P2 '
             +' order by CD_CODE',
             [HeadStoreCode,
              StandardStore,
              GetStrPointerData(ConditionToolBarComboBox)]);
    KiosDisplayXEdit.Value     := 1024;  //해상도 가로
    KiosDisplayYEdit.Value     := 768;  //해상도 세로
    while not Query.Eof do
    begin
      case StoI(Query.Fields[0].AsString) of
        1 :
        begin
          KiosDisplayXEdit.Value     := StrToIntDef(Query.Fields[1].AsString,1024);  //해상도 가로
          KiosDisplayYEdit.Value     := StrToIntDef(Query.Fields[2].AsString,768);  //해상도 세로
          Kiosk002SpinEdit.Value     := StrToIntDef(Query.Fields[3].AsString,3);  //PLU분류 버튼 갯수
          Kiosk003SpinEdit.Value     := StrToIntDef(Query.Fields[4].AsString,4);  //PLU메뉴 X
          Kiosk004SpinEdit.Value     := StrToIntDef(Query.Fields[5].AsString,5);  //PLU메뉴 Y
          Kiosk005SpinEdit.Value     := StrToIntDef(Query.Fields[6].AsString,10);  //주문메뉴 보일 갯수
          Kiosk006CheckBox.Checked   := Query.Fields[7].AsString = '1';           //메뉴 이미지 테두리 사용
          Kiosk007CheckBox.Checked   := Query.Fields[8].AsString = '1';
          Kiosk008SpinEdit.Value     := StrToIntDef(Query.Fields[9].AsString,10);  //하단높이
          Kiosk009CheckBox.Checked   := Query.Fields[10].AsString = '1';           //메뉴명표시
          Kiosk010SpinEdit.Value     := StrToIntDef(Query.Fields[11].AsString,5);  //PLU간격
          Kiosk011ComboBox.ItemIndex := GetStrPointerIndex(Kiosk011ComboBox, Query.Fields[12].AsString);
          Kiosk012ComboBox.ItemIndex := GetStrPointerIndex(Kiosk012ComboBox, Query.Fields[13].AsString);
          Kiosk013ComboBox.ItemIndex := GetStrPointerIndex(Kiosk013ComboBox, Query.Fields[14].AsString);
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
            if StoI(Query.Fields[0].AsString) in [2,3,9,10,11,12,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,31] then //PLU분류, 현금, 카드, <, ㅇㅇㅇ, >
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

procedure THeadKioskDesignForm.ImageButtonClick(Sender: TObject);
var vFiles: TSearchRec;
begin
  inherited;
  if not OpenDialog.Execute then Exit;
  FindFirst(OpenDialog.FileName,faArchive,vFiles);

  if Assigned(TImage(FindComponent('MainImage')))  then
    TImage(FindComponent('MainImage')).Free;

  with TImage.Create(Self) do
  begin
    Parent      := KioskDesignPanel;
    Name        := 'MainImage';
    Align       := alClient;
    Stretch     := true;
    Picture.LoadFromFile(OpenDialog.FileName);
    KiosDisplayYEdit.EditValue  := Height;
    KiosDisplayXEdit.EditValue  := Width;
    Caption     := EmptyStr;
    SendToBack;

    KioskDesignPanel.Width  := KiosDisplayXEdit.EditValue;
    KioskDesignPanel.Height := KiosDisplayYEdit.EditValue;
  end;
end;

procedure THeadKioskDesignForm.KiosDisplayXEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if (Sender = KiosDisplayXEdit) then
    KioskDesignPanel.Width  := KiosDisplayXEdit.EditValue
  else if (Sender = KiosDisplayYEdit) then
    KioskDesignPanel.Height := KiosDisplayYEdit.EditValue;
end;

procedure THeadKioskDesignForm.Kiosk002ItemClick(Sender: TObject);
begin
  inherited;
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

procedure THeadKioskDesignForm.Kiosk002PanelClick(Sender: TObject);
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
  KioskTopEdit.Value             := (Sender as TAdvPanel).Top;
  KioskLeftEdit.Value            := (Sender as TAdvPanel).Left;
  KioskHeightEdit.Value          := (Sender as TAdvPanel).Height;
  KioskWidthEdit.Value           := (Sender as TAdvPanel).Width;
  KioskFontNameComboBox.FontName := (Sender as TAdvPanel).Caption.Font.Name;
  KioskFontSizeSpinEdit.Value    := (Sender as TAdvPanel).Caption.Font.Size;
  KioskFontColorPanel.Color      := (Sender as TAdvPanel).Caption.Font.Color;
  KioskFontDownColorPanel.Color  := (Sender as TAdvPanel).CollapsColor;
  KioskColorPanel.Color          := (Sender as TAdvPanel).StatusBar.Color;
  KioskDownColorPanel.Color      := (Sender as TAdvPanel).StatusBar.ColorTo;
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

procedure THeadKioskDesignForm.Kiosk002PanelClose(Sender: TObject);
begin
  inherited;
  TMenuItem(FindComponent(Format('Kiosk%sItem',[GetOnlyNumber((Sender as TAdvPanel).Name)]))).Checked := false;
end;

procedure THeadKioskDesignForm.Kiosk002PanelEndMoveSize(Sender: TObject);
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

procedure THeadKioskDesignForm.Kiosk002PanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;

procedure THeadKioskDesignForm.Kiosk002PanelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
  end;
end;

procedure THeadKioskDesignForm.Kiosk002PanelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := false;
end;

procedure THeadKioskDesignForm.KioskFontColorPanelClick(Sender: TObject);
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
    if Sender = KioskFontDownColorPanel then
      KioskSelectedPanel.CollapsColor := ColorDialog.Color
    else
      KioskSelectedPanel.Caption.Font.Color := ColorDialog.Color;

    if Sender = KioskFontColorPanel then
    begin
      KioskFontColorValueEdit.Text := ColorToString(ColorDialog.Color);
    end;


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

procedure THeadKioskDesignForm.KioskFontSizeSpinEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  EditPropertiesChange(KioskFontSizeSpinEdit);
  KioskSelectedPanel.Caption.Font.Size := KioskFontSizeSpinEdit.Value;
end;

procedure THeadKioskDesignForm.KioskInitButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('설정을 초기화 하시겠습니까?') then Exit;
  ExecQuery('delete '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  =:P2;',
           [HeadStoreCode,
            StandardStore,
            GetStrPointerData(ConditionToolBarComboBox)]);
  MsgBox('환경설정을 종료 후 다시 실행하세요');
end;


procedure THeadKioskDesignForm.KioskTopEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if isLoading then Exit;

  if (Sender = KiosDisplayXEdit) then
    KioskDesignPanel.Width  := DisplayValue
  else if (Sender = KiosDisplayYEdit) then
    KioskDesignPanel.Height := DisplayValue
  else if (Sender = KioskTopEdit) and (KioskSelectedPanel <> nil) then
    KioskSelectedPanel.Top := DisplayValue
  else if (Sender = KioskLeftEdit) and (KioskSelectedPanel <> nil) then
    KioskSelectedPanel.Left := DisplayValue
  else if (Sender = KioskHeightEdit) and (KioskSelectedPanel <> nil) then
    KioskSelectedPanel.Height := DisplayValue
  else if (Sender = KioskWidthEdit) and (KioskSelectedPanel <> nil) then
    KioskSelectedPanel.Width := DisplayValue;
  if (Sender = KioskFontNameComboBox) and (KioskSelectedPanel <> nil) then
    KioskSelectedPanel.Caption.Font.Name := KioskFontNameComboBox.FontName
  else if Sender = KioskFontColorValueEdit then
  begin
    if KioskFontColorValueEdit.Text <> EmptyStr then
      KioskFontColorPanel.Color := StringToColor(KioskFontColorValueEdit.Text);
  end;
end;

procedure THeadKioskDesignForm.MemberInfo1LabelClick(Sender: TObject);
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

procedure THeadKioskDesignForm.MemberInfo1LabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;

procedure THeadKioskDesignForm.MemberInfo1LabelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
  end;
end;

procedure THeadKioskDesignForm.MemberInfo1LabelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := false;
  isChanged   := true;
end;

procedure THeadKioskDesignForm.SetSelectedControl(aControl: TLabel);
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

procedure THeadKioskDesignForm.ZoomCheckBoxPropertiesChange(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  cxScrollBox1.VertScrollBar.Position := 0;
  cxScrollBox1.HorzScrollBar.Position := 0;
  if ZoomCheckBox.Checked then
  begin
    KioskDesignPanel.ScaleBy(50, 100);
    for vIndex := 1 to 25 do
      if Assigned(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)])))) then
        TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Font.Size := 12;
  end
  else
  begin
    KioskDesignPanel.ScaleBy(200, 100);
    for vIndex := 1 to 25 do
      if Assigned(TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)])))) then
        TAdvPanel(FindComponent(Format('Kiosk%sPanel',[FormatFloat('000',vIndex)]))).Font.Size := 10;
  end;


end;

end.
