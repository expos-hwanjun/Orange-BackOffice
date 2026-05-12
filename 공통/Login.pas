// 로그인 (F)

unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Jpeg, StdCtrls, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxMaskEdit, cxDropDownEdit,
  dxSkinsCore, Vcl.Menus, cxLabel, cxButtons, StrUtils, DateUtils,
  AdvSmoothToggleButton, AdvGlassButton, CurvyControls, dxGDIPlusClasses,
  cxCheckBox, Vcl.Buttons;

type
  TLoginForm = class(TForm)
    KeyPadPanel: TPanel;
    PassWordMessageLabel: TcxLabel;
    Num_7: TAdvSmoothToggleButton;
    Num_8: TAdvSmoothToggleButton;
    Num_9: TAdvSmoothToggleButton;
    Num_6: TAdvSmoothToggleButton;
    Num_5: TAdvSmoothToggleButton;
    Num_4: TAdvSmoothToggleButton;
    Num_1: TAdvSmoothToggleButton;
    Num_2: TAdvSmoothToggleButton;
    Num_3: TAdvSmoothToggleButton;
    ClearButton: TAdvSmoothToggleButton;
    BackButton: TAdvSmoothToggleButton;
    UserCodeEdit: TCurvyEdit;
    PasswordEdit: TCurvyEdit;
    OKButton: TAdvGlassButton;
    MainImage: TImage;
    KeyPadLabel1: TcxLabel;
    PassWordChangeLabel: TcxLabel;
    MessageLabel: TLabel;
    IDSaveCheckBox: TcxCheckBox;
    AutoLoginCheckBox: TcxCheckBox;
    Num_0: TAdvSmoothToggleButton;
    AutoLogInTimer: TTimer;
    LogInTimer: TTimer;
    cxLabel1: TcxLabel;
    CloseButton: TAdvGlassButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PasswordEditEnter(Sender: TObject);
    procedure PasswordEditChange(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure StoreComboBoxPropertiesChange(Sender: TObject);
    procedure UserCodeEditEnter(Sender: TObject);
    procedure Num_7Click(Sender: TObject);
    procedure KeyPadLabel1Click(Sender: TObject);
    procedure PassWordChangeLabelClick(Sender: TObject);
    procedure AutoLogInTimerTimer(Sender: TObject);
    procedure LogInTimerTimer(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure UserCodeEditKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordEditKeyPress(Sender: TObject; var Key: Char);
  private
    UserPass: string;
    isUserIDFocused :Boolean;
    SelectedHeadCode,
    SelectedStoreCode :String;   //선택한 매장코드
    function StoreSelect(aPartnerCode:String):Boolean;  //현력사 매장선택
    function CusomerSelect(aCompany,aAuthCode:String):Boolean;     //본사 및 매장사용자 매장선택
    function CheckPartner:Boolean;
    procedure CreateFlatRoundRgn;
    procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    //매장변경시 선택한 매장코드
    ChangeStoreCode :String;
  end;

var
  LoginForm: TLoginForm;



implementation

uses
  Common, DBModule, Password, StoreSelect, ProxyCheck;

{$R *.dfm}
procedure ExcludeRectRgn(var Rgn: HRGN; LeftRect, TopRect, RightRect, BottomRect: Integer);
var
  RgnEx: HRGN;
begin
  RgnEx := CreateRectRgn(LeftRect, TopRect, RightRect, BottomRect);
  CombineRgn(Rgn, Rgn, RgnEx, RGN_OR);
  DeleteObject(RgnEx);
end;

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TLoginForm.FormCreate(Sender: TObject);
begin
  CreateFlatRoundRgn;
  ChangeStoreCode := '';
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TLoginForm.FormShow(Sender: TObject);
begin
  if ChangeStoreCode <> '' then
  begin
    LogInTimer.Enabled := true;
    Exit;
  end;
  SelectedHeadCode  := '';
  SelectedStoreCode := '';
  if ParamStr(1) = 'execute' then
  begin
    UserCodeEdit.Text  := ParamStr(2);
    PasswordEdit.Text  := ParamStr(3);
    AutoLogInTimer.Enabled := true;
  end
  else
  begin
    UserCodeEdit.Text := UserCode;
    IDSaveCheckBox.Checked := UserCodeEdit.Text <> '';

    if not isLogOut then
      PasswordEdit.Text  := Decrypt(GetRegistry(HKEY_CURRENT_USER, 'ExtremePOS\CloudOrange\', 'UserPWD',''),_CryptKey)
    else
      PasswordEdit.Text := '';
    AutoLoginCheckBox.Checked := PasswordEdit.Text <> '';

    if (UserCodeEdit.Text <> EmptyStr) and (PasswordEdit.Text = '') then
      PasswordEdit.SetFocus;

    if (UserCodeEdit.Text <> EmptyStr) and (PasswordEdit.Text <> '') then
      AutoLogInTimer.Enabled := true;

    SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_SHOWWINDOW);
    Windows.SetFocus(Handle);
  end;
end;

procedure TLoginForm.KeyPadLabel1Click(Sender: TObject);
begin
  KeyPadPanel.Top  := 40;
  KeyPadPanel.Left := 256;
  KeyPadPanel.Visible := not KeyPadPanel.Visible;
  if KeyPadPanel.Visible then
    Self.Width := 460
  else
    Self.Width := 410;

  if isUserIDFocused then
    UserCodeEdit.SetFocus
  else
    PasswordEdit.SetFocus;
end;

procedure TLoginForm.LogInTimerTimer(Sender: TObject);
begin
  LogInTimer.Enabled := false;
  OKButtonClick(nil);
  Exit;
end;

procedure TLoginForm.Num_7Click(Sender: TObject);
begin
  if isUserIDFocused then
  begin
    if ((Sender as TAdvSmoothToggleButton).Name = 'BackButton') then UserCodeEdit.Text := LeftStr(UserCodeEdit.Text, Length(UserCodeEdit.Text)-1)
    else if ((Sender as TAdvSmoothToggleButton).Name = 'ClearButton')  then UserCodeEdit.Text := ''
    else UserCodeEdit.Text := UserCodeEdit.Text + (Sender as TAdvSmoothToggleButton).Caption;
    UserCodeEdit.SetFocus;
  end
  else
  begin
    if ((Sender as TAdvSmoothToggleButton).Name = 'BackButton') then PasswordEdit.Text := LeftStr(PasswordEdit.Text, Length(PasswordEdit.Text)-1)
    else if ((Sender as TAdvSmoothToggleButton).Name = 'ClearButton')  then PasswordEdit.Text := ''
    else PasswordEdit.Text := PasswordEdit.Text + (Sender as TAdvSmoothToggleButton).Caption;
    PasswordEdit.SetFocus;
  end;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창에서 키보드를 누를 때
procedure TLoginForm.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case Key of
    VK_Escape : ModalResult := mrCancel;
    VK_Up     : if Sender = PasswordEdit then
                  UserCodeEdit.SetFocus;
    VK_Down   : if Sender = UserCodeEdit then
                  PasswordEdit.SetFocus;
    VK_Return : if Sender = PasswordEdit then
                begin
                  OKButton.Click;
                end
                else
                  PasswordEdit.SetFocus;
    VK_Tab    : begin
                  SelectNext(TWinControl(ActiveControl), true,  true);
                  Key := 0;
                end;
  end;
end;
//------------------------------------------------------------------------------
// 사용자ID에서 빠져나올 때
procedure TLoginForm.UserCodeEditEnter(Sender: TObject);
begin
  isUserIDFocused := (Sender as TCurvyEdit).Name = 'UserCodeEdit';
end;

procedure TLoginForm.UserCodeEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(Ord(VK_RETURN))) or (Key = Char(Ord(VK_ESCAPE))) then
    Key := #0;
end;

procedure TLoginForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;

  if (Msg.Result = HTCLIENT) and
     not ((Msg.XPos > Left+CloseButton.Left)  and (Msg.XPos < Left+CloseButton.Left +CloseButton.Width)  and
          (Msg.YPos > Top +CloseButton.Top)   and (Msg.YPos < Top +CloseButton.Top  +CloseButton.Height))  then
    Msg.Result := HTCAPTION;
end;

//------------------------------------------------------------------------------
// 비밀번호로 들어갈 때
procedure TLoginForm.PasswordEditEnter(Sender: TObject);
begin
  isUserIDFocused := (Sender as TCurvyEdit).Name = 'UserCodeEdit';
end;
procedure TLoginForm.PasswordEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(Ord(VK_RETURN))) or (Key = Char(Ord(VK_ESCAPE))) then
    Key := #0;
end;

//------------------------------------------------------------------------------
// 비밀번호를 편집할 때
procedure TLoginForm.PasswordEditChange(Sender: TObject);
begin
  MessageLabel.Caption := '';
end;
//------------------------------------------------------------------------------
// 매장을 변경할 때
procedure TLoginForm.StoreComboBoxPropertiesChange(Sender: TObject);
begin
  PasswordEdit.SetFocus;
end;

function TLoginForm.StoreSelect(aPartnerCode:String):Boolean;
begin
  result := false;
  with TStoreSelectForm.Create(Self) do
    try
      if aPartnerCode <> '' then
      begin
        QuerySQL := Format('select a.ID_USER, '
                          +'       b.NM_CUSTOMER, '
                          +'       a.CD_CUSTOMER, '
                          +'       c.NM_COMPANY, '
                          +'       case when a.USER_LEVEL = ''C'' then ''본사'' else ''매장'' end,  '
                          +'       case when a.USER_LEVEL = ''C'' then ''정상'' else case when a.DS_STATUS = ''D'' then ''데모'' else ''정상'' end end DS_STATUS, '
                          +'       a.PW_USER '
                          +'  from USER_CUSTOMER as a inner join '
                          +'       CUSTOMER      as b on b.CD_CUSTOMER = a.CD_CUSTOMER  left outer join '
                          +'       COMPANY       as c on c.CD_COMPANY  = a.CD_COMPANY and c.YN_USE = ''Y'' '
                          +' where a.USER_LEVEL <> ''C'' '
                          +'   and b.DS_STATUS   in (''D'', ''0'')  '
                          +'   and a.CD_PARTNER = ''%s'' '
                          +'   and (a.ID_USER = :P0 or a.CD_CUSTOMER =:P0 or b.NM_CUSTOMER like ConCat(''%%'',:P0,''%%'') or a.NM_USER like ConCat(''%%'',:P0,''%%'')) '
                          +'   and a.DS_STATUS = ''0'' '
                          +' union all '
                          +'select a.ID_USER, '
                          +'       a.NM_USER, '
                          +'       a.CD_CUSTOMER, '
                          +'       c.NM_COMPANY, '
                          +'       case when a.USER_LEVEL = ''C'' then ''본사'' else ''매장'' end,  '
                          +'       case when a.USER_LEVEL = ''C'' then ''정상'' else case when a.DS_STATUS = ''D'' then ''데모'' else ''정상'' end end DS_STATUS, '
                          +'       a.PW_USER '
                          +'  from USER_CUSTOMER as a inner join '
                          +'       COMPANY       as c on c.CD_COMPANY  = a.CD_COMPANY and c.YN_USE = ''Y'' '
                          +' where a.USER_LEVEL = ''C'' '
                          +'   and a.CD_PARTNER = ''%s'' '
                          +'   and (a.ID_USER = :P0 or a.CD_CUSTOMER =:P0 or c.NM_COMPANY like ConCat(''%%'',:P0,''%%'') or a.NM_USER like ConCat(''%%'',:P0,''%%'')) '
                          +'   and a.DS_STATUS = ''0'' '
                          +' order by 3,2 ',[aPartnerCode,aPartnerCode]);

        GridTableViewCode.Caption  := '아이디';
        GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
        GridTableViewName1.Caption := '사용자명';
        GridTableViewName1.Width   := 180;
        GridTableViewName2.Caption := '기본매장';
        GridTableViewName2.Width   := 90;
        GridTableViewName2.Visible := true;
        GridTableViewName2.PropertiesClassName       := 'TcxTextEditProperties';
        GridTableViewName2.Properties.Alignment.Horz  := taCenter;
        GridTableViewName3.Caption := '본사명';
        GridTableViewName3.Width   := 180;
        GridTableViewName3.Visible := true;

        GridTableViewName4.Caption := '권한';
        GridTableViewName4.Width   := 70;
        GridTableViewName4.Visible := true;
        GridTableViewName4.PropertiesClassName       := 'TcxTextEditProperties';
        GridTableViewName4.Properties.Alignment.Horz  := taCenter;

        GridTableViewName5.Caption := '상태';
        GridTableViewName5.Width   := 70;
        GridTableViewName5.Visible := true;
        GridTableViewName5.PropertiesClassName       := 'TcxTextEditProperties';
        GridTableViewName5.Properties.Alignment.Horz  := taCenter;
      end
      else
      begin
        QuerySQL := Format('select d.NM_PARTNER, '
                          +'       a.ID_USER, '
                          +'       b.NM_CUSTOMER, '
                          +'       a.CD_CUSTOMER,  '
                          +'       c.NM_COMPANY, '
                          +'       case when a.USER_LEVEL = ''C'' then ''본사'' else ''매장'' end,  '
                          +'       case when a.DS_STATUS  = ''D'' then ''데모'' else ''정상'' end DS_STATUS, '
                          +'       a.PW_USER, '
                          +'       a.CD_COMPANY, '
                          +'       2 '
                          +'  from USER_CUSTOMER as a inner join '
                          +'       CUSTOMER      as b on b.CD_COMPANY  = a.CD_COMPANY '
                          +'                         and b.CD_CUSTOMER = a.CD_CUSTOMER left outer join '
                          +'       COMPANY       as c on c.CD_COMPANY  = a.CD_COMPANY left outer join '
                          +'       PARTNER       as d on d.CD_PARTNER  = a.CD_PARTNER  '
                          +'where a.DS_STATUS   = ''0'' '
                          +'  and (a.ID_USER = :P0 or a.CD_CUSTOMER =:P0 or b.NM_CUSTOMER like ConCat(''%%'',:P0,''%%'') or a.NM_USER like ConCat(''%%'',:P0,''%%'')) '
                          +'  and b.DS_STATUS   in (''D'', ''0'')   '
                          +'  and a.USER_LEVEL <> ''C''  '
                          +' union all '
                          +'select d.NM_PARTNER, '
                          +'       a.ID_USER, '
                          +'       a.NM_USER, '
                          +'       a.CD_CUSTOMER,  '
                          +'       c.NM_COMPANY, '
                          +'       case when a.USER_LEVEL = ''C'' then ''본사'' else ''매장'' end,  '
                          +'       case when a.DS_STATUS  = ''D'' then ''데모'' else ''정상'' end DS_STATUS, '
                          +'       a.PW_USER, '
                          +'       a.CD_COMPANY, '
                          +'       1 '
                          +'  from USER_CUSTOMER as a inner join '
                          +'       COMPANY       as c on c.CD_COMPANY  = a.CD_COMPANY left outer join '
                          +'       PARTNER       as d on d.CD_PARTNER  = a.CD_PARTNER  '
                          +'where a.DS_STATUS  = ''0'' '
                          +'  and (a.ID_USER = :P0 or a.CD_CUSTOMER =:P0 or c.NM_COMPANY like ConCat(''%%'',:P0,''%%'') or a.NM_USER like ConCat(''%%'',:P0,''%%'')) '
                          +'  and a.USER_LEVEL = ''C''  '
                          +' order by 9,10,4,3 ',[aPartnerCode, aPartnerCode]);

        GridTableViewCode.Caption  := '협력사';
        GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
        GridTableViewCode.Width    := 150;

        GridTableViewName1.Caption  := '아이디';
        GridTableViewName1.Width    := 100;

        GridTableViewName2.Caption := '사용자명';
        GridTableViewName2.Width   := 200;
        GridTableViewName2.Visible := true;

        GridTableViewName3.Caption := '기본매장';
        GridTableViewName3.Width   := 90;
        GridTableViewName3.Visible := true;
        GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
        GridTableViewName3.Properties.Alignment.Horz  := taCenter;

        GridTableViewName4.Caption := '본사명';
        GridTableViewName4.Width   := 180;
        GridTableViewName4.Visible := true;

        GridTableViewName5.Caption := '권한';
        GridTableViewName5.Width   := 60;
        GridTableViewName5.Visible := true;
        GridTableViewName5.PropertiesClassName       := 'TcxTextEditProperties';
        GridTableViewName5.Properties.Alignment.Horz  := taCenter;

        GridTableViewName6.Caption := '상태';
        GridTableViewName6.Width   := 60;
        GridTableViewName6.Visible := true;
        GridTableViewName6.PropertiesClassName       := 'TcxTextEditProperties';
        GridTableViewName6.Properties.Alignment.Horz  := taCenter;
        isAutoSearch := false;
      end;

      isStoreChange  := false;
      isPartnerCheck := true;
      CustomerButton.Visible := true;
      FormStyle := fsStayOnTop;
      case ShowModal of
        mrOK :
        begin
          Result := true;
          UserLevel             := '';
          if aPartnerCode <> '' then
          begin
            UserCodeEdit.Text := Code;
            PasswordEdit.Text := Names[5];
          end
          else
          begin
            UserCodeEdit.Text := Names[0];
            PasswordEdit.Text := Names[6];
          end;
        end;
        mrYes :
        begin
          Result := true;

          if aPartnerCode <> '' then
          begin
            UserLevel   := 'P';
            PartnerCode := aPartnerCode;
          end
          else
            UserLevel := 'E';
        end;
      end;
    finally
      Free;
    end;

end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 암호 변경 버튼
procedure TLoginForm.PassWordChangeLabelClick(Sender: TObject);
begin
  try
    DM.OpenQuery('select '''' as USER_LEVEL, '
                +'       PW_USER '
                +'  from USER_CUSTOMER '
                +' where ID_USER   =:P0 '
                +'   and DS_STATUS =''0'' '
                +'union all '
                +'select USER_LEVEL, '
                +'       PW_USER '
                +'  from USER_MASTER '
                +' where ID_USER   =:P0 '
                +'   and DS_STATUS =''0'' ',
                [UserCodeEdit.Text],false, RestBaseURL);
    if not DM.Query.Eof then
    begin
      UserLevel     := DM.Query.Fields[0].AsString;
      self.UserPass := DM.Query.Fields[1].AsString;
    end
    else
    begin
      MsgBox('등록되지 않은 사용자 입니다');
      Exit;
    end;
    DM.FinishQuery;

    if UserLevel = '' then
    begin
      DM.OpenQuery('select d.HTTPS_DOMAIN, '
                  +'       case when e.SERVICE_TYPE = ''S'' then d.HTTPS_PORT else d.HTTPS_PORT_DIST end HTTPS_PORT, '
                  +'       case when e.SERVICE_TYPE = ''S'' then '''' else e.NM_DATABASE end NM_DATABASE '
                  +'  from USER_CUSTOMER as a left outer join  '
                  +'       COMPANY       as c on a.CD_COMPANY   = c.CD_COMPANY inner join '
                  +'       SERVER_LIST   as d on c.ID_SERVER    = d.ID_SERVER inner join '
                  +'       DATABASE_LIST as e on e.ID_SERVER    = c.ID_SERVER and e.DB_SEQ = c.DB_SEQ '
                  +' where a.ID_USER    = :P0 '
                  +'   and d.DS_SERVER  = ''O'' ',
                  [UserCodeEdit.Text],false,RestBaseURL);

      RestDBURL  := Format('https://%s:%s/Orange/|%s',[DM.Query.FieldByName('HTTPS_DOMAIN').AsString,
                                                       DM.Query.FieldByName('HTTPS_PORT').AsString,
                                                       DM.Query.FieldByName('NM_DATABASE').AsString]);
      DM.Query.Close;
    end;


    with TPasswordForm.Create(self) do
      try
        UserCode := UserCodeEdit.Text;
        UserPass := self.UserPass;
        if ShowModal = mrOK then
        begin
          self.UserPass := UserPass;
          MsgBox(Format('%s을 했습니다.', [PasswordChangeLabel.Caption]));
          PasswordEdit.SetFocus;
        end;
      finally
        Free;
      end;
  finally
    DM.FinishQuery;
  end;
end;

//------------------------------------------------------------------------------
// 확인 버튼
procedure TLoginForm.OKButtonClick(Sender: TObject);
  procedure SetLogin;
  begin
    // 모두 정상이면 키보드 프로그램을 끝내고 정상적으로 폼을 닫는다
    if IDSaveCheckBox.Checked then
      SetRegistry(HKEY_CURRENT_USER, 'ExtremePOS\CloudOrange\', 'UserID', UserCode)
    else
      SetRegistry(HKEY_CURRENT_USER, 'ExtremePOS\CloudOrange\', 'UserID', '');

    if AutoLoginCheckBox.Checked then
      SetRegistry(HKEY_CURRENT_USER, 'ExtremePOS\CloudOrange\', 'UserPWD', Encrypt(UserPass, _CryptKey))
    else
      SetRegistry(HKEY_CURRENT_USER, 'ExtremePOS\CloudOrange\', 'UserPWD', '');
  end;
var vjsonDBURL,
    vPartnerCode :String;
    vPosCount,
    vKioskCount,
    vConnectLimit:Integer;
    vMemberPreFix,
    vStoreName,
    vStoreShortName,
    vOptions,
    vAuthCode,
    vBossName,
    vBizNo,
    vAddr1,
    vAddr2,
    vTelNo,
    vMobileNo,
    vHeadOptions,
    vOrgStoreCode :String;
begin
  IsDebugMode := IsDebuggerPresent;

  if ChangeStoreCode = '' then
  begin
    if (Sender = nil) and ((UserLevel = 'E') or (UserLevel = 'P')) then
    begin
      isLogOut    := false;
      UserCode    := UserCodeEdit.Text;
      UserPass    := PasswordEdit.Text;
      SetLogin;
      ModalResult := mrOK;
      Exit;
    end;
    // 입력창에 값을 입력했는지 확인한다
    if UserCodeEdit.Text = EmptyStr then
    begin
      MessageLabel.Caption := '아이디'+msgMustInput;
      UserCodeEdit.SetFocus;
      Exit;
    end
    else if (PasswordEdit.Text = EmptyStr) and (not IsDebuggerPresent) then
    begin
      MessageLabel.Caption := '패스워드'+msgMustInput;
      PasswordEdit.SetFocus;
      Exit;
    end;
  end;

  try
    OKButton.Enabled := false;
    if (Length(UserCodeEdit.Text) > 0) or (ChangeStoreCode <> '') then
    begin
      MessageLabel.Caption := EmptyStr;
      try
        if ChangeStoreCode <> '' then
        begin
          //매장변경 시 표준매장이 아닐때
          if ChangeStoreCode <> StandardStore then
            DM.OpenQuery('select a.USER_LEVEL, a.ID_USER, a.CD_CUSTOMER, a.CD_COMPANY,  a.NM_USER, '
                        +'       d.SERVICE_KEY, '
                        +'       b.OPTIONS,  c.CD_PARTNER, d.ID_SERVER, c.DB_SEQ, b.ALLOW_POS, b.ALLOW_KIOSK, b.MEMBER_PREFIX,  '
                        +'       b.DS_STATUS, b.YMD_SETUP, NOW() as NOW_DATE, b.BIZ_NO, b.CONNECTION_LIMIT, '
                        +'       a.YN_STORECHOOSE, b.ALLOW_MENUCOUNT, a.CD_AUTH, b.DS_LICENSE, b.YMD_PAYEND, '
                        +'       b.CEO_NAME, b.ADDR1, b.ADDR2, b.TEL_OFFICE, b.TEL_MOBILE, b.NM_CUSTOMER, b.NM_CUSTOMER_SHORT, c.OPTIONS as HEAD_OPTIONS, '
                        +'       a.CD_CUSTOMER as CD_CUSTOMER_ORG, '
                        +'       a.COMPANY_EXISTS '
                        +'  from USER_CUSTOMER as a left outer join  '
                        +'       CUSTOMER      as b on a.CD_COMPANY   = b.CD_COMPANY and a.CD_CUSTOMER = b.CD_CUSTOMER left outer join '
                        +'       COMPANY       as c on a.CD_COMPANY   = c.CD_COMPANY inner join '
                        +'       SERVER_LIST   as d on c.ID_SERVER    = d.ID_SERVER and d.DS_SERVER = ''O'' left outer join  '
                        +'       PARTNER       as f on f.CD_PARTNER   = b.CD_PARTNER '
                        +' where a.CD_COMPANY  = :P0 '
                        +'   and a.CD_CUSTOMER = :P1 '
                        +'   and a.DS_STATUS   = ''0'' ',
                        [HeadStoreCode,
                         ChangeStoreCode],false,RestBaseURL)
          else
            DM.OpenQuery('select ''C'' as USER_LEVEL, a.ID_USER, ''00000000'' as CD_CUSTOMER, a.CD_COMPANY,  a.NM_USER, '
                        +'       d.SERVICE_KEY, '
                        +'       b.OPTIONS,   c.CD_PARTNER, d.ID_SERVER, c.DB_SEQ, b.ALLOW_POS, 0 as ALLOW_KIOSK, '''' as MEMBER_PREFIX,  '
                        +'       ''0'' as DS_STATUS, '''' as YMD_SETUP, NOW() as NOW_DATE, c.BIZ_NO, 0 as CONNECTION_LIMIT, '
                        +'       ''N'' as YN_STORECHOOSE, 0 as ALLOW_MENUCOUNT, a.CD_AUTH, ''P''  as DS_LICENSE, '''' as YMD_PAYEND, '
                        +'       c.CEO_NAME, c.ADDR1, c.ADDR2, c.TEL_OFFICE, '''' as TEL_MOBILE, '''' as NM_CUSTOMER, '''' as NM_CUSTOMER_SHORT, c.OPTIONS as HEAD_OPTIONS, '
                        +'       a.CD_CUSTOMER as CD_CUSTOMER_ORG, '
                        +'       a.COMPANY_EXISTS '
                        +'  from USER_CUSTOMER as a left outer join  '
                        +'       CUSTOMER      as b on a.CD_COMPANY   = b.CD_COMPANY and a.CD_CUSTOMER = b.CD_CUSTOMER left outer join '
                        +'       COMPANY       as c on a.CD_COMPANY   = c.CD_COMPANY inner join '
                        +'       SERVER_LIST   as d on c.ID_SERVER    = d.ID_SERVER and d.DS_SERVER = ''O'' left outer join  '
                        +'       PARTNER       as f on f.CD_PARTNER   = b.CD_PARTNER '
                        +' where a.CD_COMPANY = :P0 '
                        +'   and a.DS_STATUS  = ''0'' ',
                        [HeadStoreCode],false,RestBaseURL);
        end
        else if SelectedHeadCode = '' then
          DM.OpenQuery('select a.USER_LEVEL, a.ID_USER, a.CD_CUSTOMER, a.CD_COMPANY,  a.NM_USER, '
                      +'       d.SERVICE_KEY,  '
                      +'       b.OPTIONS,  c.CD_PARTNER, d.ID_SERVER, c.DB_SEQ, b.ALLOW_POS, b.ALLOW_KIOSK, b.MEMBER_PREFIX,  '
                      +'       b.DS_STATUS, b.YMD_SETUP, NOW() as NOW_DATE, b.BIZ_NO, b.CONNECTION_LIMIT, '
                      +'       a.YN_STORECHOOSE, b.ALLOW_MENUCOUNT, a.CD_AUTH, b.DS_LICENSE, b.YMD_PAYEND, '
                      +'       b.CEO_NAME, b.ADDR1, b.ADDR2, b.TEL_OFFICE, b.TEL_MOBILE, b.NM_CUSTOMER, b.NM_CUSTOMER_SHORT, c.OPTIONS as HEAD_OPTIONS, '
                      +'       a.CD_CUSTOMER as CD_CUSTOMER_ORG, '
                      +'       a.COMPANY_EXISTS '
                      +'  from USER_CUSTOMER as a left outer join  '
                      +'       CUSTOMER      as b on a.CD_COMPANY   = b.CD_COMPANY and a.CD_CUSTOMER = b.CD_CUSTOMER left outer join '
                      +'       COMPANY       as c on a.CD_COMPANY   = c.CD_COMPANY inner join '
                      +'       SERVER_LIST   as d on c.ID_SERVER    = d.ID_SERVER and d.DS_SERVER = ''O'' left outer join '
                      +'       PARTNER       as f on f.CD_PARTNER   = b.CD_PARTNER '
                      +' where a.ID_USER    = :P0 '
                      +Ifthen(not IsDebuggerPresent,'and a.PW_USER = :P1 ','')
                      +'   and a.DS_STATUS  = ''0'' ',
                      [UserCodeEdit.Text,
                       PasswordEdit.Text],false,RestBaseURL)
        //매장선택에서 표준을 선택했을때
        else if (SelectedHeadCode <> '') and (SelectedStoreCode = StandardStore) then
          DM.OpenQuery('select a.USER_LEVEL, a.ID_USER, a.CD_CUSTOMER, a.CD_COMPANY,  a.NM_USER, '
                      +'       d.SERVICE_KEY, '
                      +'       c.OPTIONS,   c.CD_PARTNER, d.ID_SERVER, c.DB_SEQ, b.ALLOW_POS, 0 as ALLOW_KIOSK, '''' as MEMBER_PREFIX,  '
                      +'       ''0'' as DS_STATUS, '''' as YMD_SETUP, NOW() as NOW_DATE, c.BIZ_NO, 0 as CONNECTION_LIMIT, '
                      +'       ''N'' as YN_STORECHOOSE, 0 as ALLOW_MENUCOUNT, a.CD_AUTH, ''P''  as DS_LICENSE, '''' as YMD_PAYEND, '
                      +'       c.CEO_NAME, c.ADDR1, c.ADDR2, c.TEL_OFFICE, '''' as TEL_MOBILE,  '''' as NM_CUSTOMER, '''' as NM_CUSTOMER_SHORT, c.OPTIONS as HEAD_OPTIONS, '
                      +'       a.CD_CUSTOMER as CD_CUSTOMER_ORG, '
                      +'       a.COMPANY_EXISTS '
                      +'  from USER_CUSTOMER as a left outer join  '
                      +'       CUSTOMER      as b on a.CD_COMPANY   = b.CD_COMPANY and a.CD_CUSTOMER = b.CD_CUSTOMER left outer join '
                      +'       COMPANY       as c on a.CD_COMPANY   = c.CD_COMPANY inner join '
                      +'       SERVER_LIST   as d on c.ID_SERVER    = d.ID_SERVER and d.DS_SERVER = ''O'' left outer join '
                      +'       PARTNER       as f on f.CD_PARTNER   = b.CD_PARTNER '
                      +' where a.ID_USER    = :P0 '
                      +Ifthen(not IsDebuggerPresent,'and a.PW_USER = :P1 ','')
                      +'   and a.DS_STATUS  = ''0'' ',
                      [UserCodeEdit.Text,
                       PasswordEdit.Text],false,RestBaseURL)
        else
          DM.OpenQuery('select a.USER_LEVEL, a.ID_USER, b.CD_CUSTOMER, b.CD_COMPANY,  a.NM_USER, '
                      +'       d.SERVICE_KEY, '
                      +'       b.OPTIONS, c.CD_PARTNER, d.ID_SERVER, c.DB_SEQ, b.ALLOW_POS, b.ALLOW_KIOSK, b.MEMBER_PREFIX,  '
                      +'       b.DS_STATUS, b.YMD_SETUP, NOW() as NOW_DATE, b.BIZ_NO, b.CONNECTION_LIMIT, '
                      +'       a.YN_STORECHOOSE, b.ALLOW_MENUCOUNT, a.CD_AUTH, b.DS_LICENSE, b.YMD_PAYEND, '
                      +'       b.CEO_NAME, b.ADDR1, b.ADDR2, b.TEL_OFFICE, b.TEL_MOBILE, b.NM_CUSTOMER, b.NM_CUSTOMER_SHORT, c.OPTIONS as HEAD_OPTIONS, '
                      +'       a.CD_CUSTOMER as CD_CUSTOMER_ORG, '
                      +'       a.COMPANY_EXISTS '
                      +'  from USER_CUSTOMER as a left outer join  '
                      +'       CUSTOMER      as b on b.CD_COMPANY   = :P2  and b.CD_CUSTOMER = :P3 inner join '
                      +'       COMPANY       as c on b.CD_COMPANY   = c.CD_COMPANY inner join '
                      +'       SERVER_LIST   as d on c.ID_SERVER    = d.ID_SERVER and d.DS_SERVER = ''O'' left outer join  '
                      +'       PARTNER       as f on f.CD_PARTNER   = b.CD_PARTNER '
                      +' where a.ID_USER    = :P0 '
                      +Ifthen(not IsDebuggerPresent,'and a.PW_USER = :P1 ','')
                      +'   and a.DS_STATUS  = ''0'' ',
                      [UserCodeEdit.Text,
                       PasswordEdit.Text,
                       SelectedHeadCode,
                       SelectedStoreCode],false,RestBaseURL);

        if DM.Query.Eof then
        begin
          DM.Query.Close;
          //매장에 등록된 아이디가 없으면 협력사 아이디인지 체크한다
          if CheckPartner then
          begin
            RestOrgDBURL          := RestBaseURL;
            OKButtonClick(nil);
            Exit;
          end;
          MessageLabel.Caption := '로그인 정보가 올바르지 않습니다';
          Exit;
        end
        else
        begin
          if (SelectedHeadCode = '') and (DM.Query.FieldByName('YN_STORECHOOSE').AsString = 'Y') then
          begin
            UserClass             := DM.Query.FieldByName('USER_LEVEL').AsString;
            //본사권한 제외일때
            if DM.Query.FieldByName('COMPANY_EXISTS').AsString = 'Y' then
              UserClass := 'S';

            if CusomerSelect(DM.Query.FieldByName('CD_COMPANY').AsString, DM.Query.FieldByName('CD_AUTH').AsString) then
            begin
              OKButtonClick(nil);
              Exit;
            end
            else
              Exit;
          end;

          if DM.Query.FieldByName('DS_STATUS').AsString = 'R'  then
          begin
            ErrBox('계약해지 [요청] 매장입니다'#13'영업대리점에 문의하세요');
            Application.Terminate;
            Exit;
          end;

          if DM.Query.FieldByName('DS_STATUS').AsString = '1'  then
          begin
            ErrBox('계약이 해지 된  매장입니다'#13'영업대리점에 문의하세요');
            Application.Terminate;
            Exit;
          end;

          //데모버젼 체크
          if (DM.Query.FieldByName('DS_STATUS').AsString = 'D') and (DM.Query.FieldByName('YMD_SETUP').AsString <> '') then
          begin
            if DaysBetween(DM.Query.FieldByName('NOW_DATE').AsDateTime, StoD(DM.Query.FieldByName('YMD_SETUP').AsString)) > 15 then
            begin
              ErrBox('데모기간이 만료 되었습니다'#13'영업대리점에 문의하세요');
              Application.Terminate;
              Exit;
            end;
            Common.MsgBox(Format('[ 데모버젼 ]'#13'%s 까지 사용가능합니다',[FormatDateTime('yyyy년mm월dd일',IncDay(StoD(DM.Query.FieldByName('YMD_SETUP').AsString), 15))]));
          end;

          //구독매장 인증체크
          if (DM.Query.FieldByName('DS_LICENSE').AsString = 'C') and (DM.Query.FieldByName('YMD_PAYEND').AsString < FormatDateTime('yyyymmdd',DM.Query.FieldByName('NOW_DATE').AsDateTime) ) then
          begin
            Common.ErrBox(Format('구독기간이 만료되었습니다[%s]'#13'1544-4171에 문의주세요',[DM.Query.FieldByName('YMD_PAYEND').AsString]));
            Exit;
          end;

//          if DM.Query.FieldByName('SERVICE_TYPE').AsString = 'S' then
//            JsonDBName := ''
//          else
//            JsonDBName := DM.Query.FieldByName('NM_DATABASE').AsString;
//
//          vjsonDBURL            := Format('https://%s:%s/Orange/|%s',[DM.Query.FieldByName('HTTPS_DOMAIN').AsString,
//                                                                      DM.Query.FieldByName('HTTPS_PORT').AsString,
//                                                                      JsonDBName]);
//
//          RestOrgDBURL          := vjsonDBURL;
          UserLevel             := '';
          HeadStoreCode         := DM.Query.FieldByName('CD_COMPANY').AsString;    //본사코드
          if SelectedStoreCode <> StandardStore then
            StoreCode             := DM.Query.FieldByName('CD_CUSTOMER').AsString;    //매장코드
          vStoreName            := DM.Query.FieldByName('NM_CUSTOMER').AsString;
          vStoreShortName       := DM.Query.FieldByName('NM_CUSTOMER_SHORT').AsString;
          //기본매장이 없으면 표준매장으로 한다
          if StoreCode = '' then
          begin
            StoreCode           := StandardStore;
            vOptions            := DM.Query.FieldByName('HEAD_OPTIONS').AsString;
          end
          else
          begin
            vOptions            := DM.Query.FieldByName('OPTIONS').AsString;
          end;
          // ※ CompanyOptions 과 HeadOption은 다름
          // CompanyOptions는 본부 로그인 또는 수발주시 사용
          ChainHeadOptions      := DM.Query.FieldByName('HEAD_OPTIONS').AsString;
          UserCode              := UserCodeEdit.Text;
          UserName              := DM.Query.FieldByName('NM_USER').AsString;
          UserPWD               := PasswordEdit.Text;
          vPartnerCode          := DM.Query.FieldByName('CD_PARTNER').AsString;
          PartnerCode           := DM.Query.FieldByName('CD_PARTNER').AsString;
          UserPass              := PasswordEdit.Text;
          CloudServer           := Format('-%s[%d]',[DM.Query.FieldByName('ID_SERVER').AsString,DM.Query.FieldByName('DB_SEQ').AsInteger]);
          UserClass             := DM.Query.FieldByName('USER_LEVEL').AsString;
          vPosCount             := DM.Query.FieldByName('ALLOW_POS').AsInteger;
          vKioskCount           := DM.Query.FieldByName('ALLOW_KIOSK').AsInteger;
          AllowMenuCount        := DM.Query.FieldByName('ALLOW_MENUCOUNT').AsInteger;
          vMemberPreFix         := DM.Query.FieldByName('MEMBER_PREFIX').AsString;
          vBizNo                := DM.Query.FieldByName('BIZ_NO').AsString;
          vBossName             := DM.Query.FieldByName('CEO_NAME').AsString;
          vAddr1                := DM.Query.FieldByName('ADDR1').AsString;
          vAddr2                := DM.Query.FieldByName('ADDR2').AsString;
          vTelNo                := DM.Query.FieldByName('TEL_OFFICE').AsString;
          vMobileNo             := DM.Query.FieldByName('TEL_MOBILE').AsString;
          vAuthCode             := DM.Query.FieldByName('CD_AUTH').AsString;
          vConnectLimit         := DM.Query.FieldByName('CONNECTION_LIMIT').AsInteger;
          vOrgStoreCode         := DM.Query.FieldByName('CD_CUSTOMER_ORG').AsString;
          PasswordChangeLabel.Visible := true;
          StoreList.Clear;


          //본사권한일때 매장선택
          if (UserClass = 'C') and (StoreCode <> StandardStore) then
          begin
            DM.Query.Close;
            DM.OpenQuery('select a.CD_CUSTOMER, '
                        +'       b.NM_CUSTOMER, '
                        +'       a.CD_COMPANY '
                        +'  from USER_AUTH a inner join '
                        +'       CUSTOMER  b on b.CD_COMPANY = a.CD_COMPANY and b.CD_CUSTOMER = a.CD_CUSTOMER '
                        +' where a.CD_COMPANY =:P0 '
                        +'   and a.CD_AUTH    =:P1 '
                        +' order by a.CD_COMPANY, a.CD_CUSTOMER',
                        [HeadStoreCode,
                         vAuthCode],false,RestBaseURL);
            if (UserClass = 'C')  then
              StoreList.Add(StandardStore+splitColumn+'표준'+splitColumn+vPartnerCode);
            while not DM.Query.Eof do
            begin
              StoreList.Add(DM.Query.Fields[0].AsString
                           +splitColumn+DM.Query.Fields[1].AsString
                           +splitColumn+DM.Query.Fields[2].AsString);
              DM.Query.Next;
            end;
            DM.Query.Close;
          end
          //매장권한일때 매장선택
          else if (UserClass = 'S') and (DM.Query.FieldByName('YN_STORECHOOSE').AsString = 'Y') then
          begin
            DM.Query.Close;
            DM.OpenQuery('select a.CD_CUSTOMER, '
                        +'       b.NM_CUSTOMER, '
                        +'       a.CD_COMPANY '
                        +'  from USER_AUTH_CUSTOMER a inner join '
                        +'       CUSTOMER           b on b.CD_COMPANY = a.CD_COMPANY and b.CD_CUSTOMER = a.CD_CUSTOMER '
                        +' where a.ID_USER =:P0 '
                        +' order by a.CD_COMPANY, a.CD_CUSTOMER',
                        [UserCode],false,RestBaseURL);
            while not DM.Query.Eof do
            begin
              StoreList.Add(DM.Query.Fields[0].AsString
                           +splitColumn+DM.Query.Fields[1].AsString
                           +splitColumn+DM.Query.Fields[2].AsString);
              DM.Query.Next;
            end;
            DM.Query.Close;
          end
          else if (UserClass = 'C') and (StoreCode = StandardStore) then
          begin
            StoreList.Add(StandardStore+splitColumn+'표준'+splitColumn+vPartnerCode);
            DM.Query.Close;
            DM.OpenQuery('select CD_CUSTOMER, '
                        +'       NM_CUSTOMER, '
                        +'       CD_COMPANY '
                        +'  from CUSTOMER '
                        +' where CD_COMPANY = :P0 '
                        +' order by CD_CUSTOMER',
                        [HeadStoreCode],false,RestBaseURL);
            while not DM.Query.Eof do
            begin
              StoreList.Add(DM.Query.Fields[0].AsString
                           +splitColumn+DM.Query.Fields[1].AsString
                           +splitColumn+DM.Query.Fields[2].AsString);
              DM.Query.Next;
            end;
            DM.Query.Close;
          end;
        end;
      finally
        DM.Query.Close;
      end;

      RestDBURL    := GetRestDBURL(HeadStoreCode);
      RestOrgDBURL := RestDBURL;
    end;


    if (UserCodeEdit.Text = PasswordEdit.Text) and (ChangeStoreCode = '') then
    begin
      MsgBox(Format('%s가 관리자에 의해 초기화 되었습니다.'#13'%s를 다시 설정하십시오.', ['패스워드', '패스워드']));
      with TPasswordForm.Create(self) do
        try
          UserCode      := Common.UserCode;
          UserPass      := self.UserPass;
          ShowModal;
          self.UserPass := UserPass;
          PasswordEdit.Text := '';
          PasswordEdit.SetFocus;
        finally
          Free;
        end;
      Exit;
    end;

    DM.OpenQuery('select b.CD_GRADE, '
                +'       a.HEAD_OPTIONS '
                +'  from MS_STORE a left outer join '
                +'       MS_SAWON b on b.CD_STORE = a.CD_STORE and b.CD_SAWON =:P2 '
                +' where a.CD_HEAD  =:P0 '
                +'   and a.CD_STORE =:P1 ',
                [HeadStoreCode,
                 StoreCode,
                 UserCode],false,RestDBURL);
    if DM.Query.Eof then
    begin
      DM.Query.Close;

      //등록이 아직 안된 매장일때
      DM.OpenQuery('select CD_STORE '
                  +'  from MS_STORE '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 ',
                  [HeadStoreCode,
                   StoreCode],false,RestDBURL);
      if DM.Query.Eof then
      begin
        DM.Query.Close;
        DM.ExecProcedure(Format('CALL STORE_COPY(''%s'', ''%s'', ''%s'', ?) ',
                               [HeadStoreCode,
                                StoreCode,
                                vOptions]),RestDBURL);

        DM.ExecQuery('update MS_STORE '
                    +'   set RCP_TITLE1 = :P2, '
                    +'       RCP_TITLE2 = :P3, '
                    +'       RCP_TITLE3 = :P4, '
                    +'       RCP_TITLE4 = :P5 '
                    +' where CD_HEAD  =:P0 '
                    +'   and CD_STORE =:P1;',
                    [HeadStoreCode,
                     StoreCode,
                     Format('상호 : %s',[vStoreName]),
                     Format('사업자번호:%s 대표자:%s',[vBizNo, vBossName]),
                     Format('주소:%s %s',[vAddr1,vAddr2]),
                     Format('전화번호 : %s',[GetPhoneNo(vTelNo)])],true,RestDBURL);
      end;

      //포스수량이 0이면 포스코드를 삭제한다
      if vPosCount = 0 then
        DM.ExecQuery('delete from MS_CODE '
                    +' where CD_HEAD  =:P0 '
                    +'   and CD_STORE =:P1 '
                    +'   and CD_KIND  =''01'';',
                    [HeadStoreCode,
                     StoreCode],false,RestDBURL);

      UserGrade := '001';
    end
    else
    begin
      UserGrade    := DM.Query.Fields[0].AsString;
      vHeadOptions := DM.Query.Fields[1].AsString;
    end;
    DM.Query.Close;

    //사용자코드가 없으면 넣어준다
    DM.ExecQuery('insert into MS_SAWON(CD_HEAD, '
                +'                     CD_STORE, '
                +'                     CD_SAWON, '
                +'                     NM_SAWON, '
                +'                     DS_SAWON, '
                +'                     NO_PASSWORD, '
                +'                     CD_GRADE, '
                +'                     YN_HEADUSER, '
                +'                     DT_CHANGE) '
                +'              values(:P0, '
                +'                     :P1, '
                +'                     :P2, '
                +'                     :P3, '
                +'                     ''B'', '
                +'                     :P4, '
                +'                     ''001'', '
                +'                     :P5, '
                +'                     NOW()) '
                +' ON DUPLICATE KEY UPDATE NM_SAWON    =:P3, '
                +'                         NO_PASSWORD =:P4, '
                +'                         YN_HEADUSER =:P5; ',
                [HeadStoreCode,
                 StoreCode,
                 UserCode,
                 UserName,
                 Encrypt(UserPass, _CryptKey),
                 Ifthen(vOrgStoreCode=StoreCode,'N','Y')],false,RestDBURL);

    DM.ExecQuery('update MS_STORE '
                +'   set HEAD_OPTIONS     = :P2, '
                +'       ALLOW_POS        = :P3, '
                +'       ALLOW_KIOSK      = :P4, '
                +'       MEMBERNO_PREFIX  = :P5, '
                +'       NO_BIZER         = :P6, '
                +'       CONNECTION_LIMIT = :P7, '
                +'       NM_STORE         = :P8, '
                +'       NM_STORE_SHORT   = :P9, '
                +'       NM_BOSS          = :P10, '
                +'       ADDR1            = :P11, '
                +'       ADDR2            = :P12, '
                +'       TEL_OFFICE       = :P13, '
                +'       CD_SAWON_CHG     = :P14, '
                +'       CHANGE_IP        = :P15 '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1;',
                [HeadStoreCode,
                 StoreCode,
                 vOptions,
                 vPosCount,
                 vKioskCount,
                 vMemberPreFix,
                 vBizNo,
                 vConnectLimit,
                 vStoreName,
                 vStoreShortName,
                 vBossName,
                 vAddr1,
                 vAddr2,
                 vTelNo,
                 UserCode,
                 GetIPAddress],true,RestDBURL);

    //회사권한일때
    if UserClass = 'C' then
    begin
      DM.OpenQuery('select Count(*) '
                  +'  from MS_PRG_MENU'
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 ',
                  [HeadStoreCode,
                   StandardStore],false,RestDBURL);

      if DM.Query.Fields[0].AsInteger = 0 then
      begin
        DM.Query.Close;
        DM.ExecQuery('insert into MS_PRG_MENU(CD_HEAD, '
                    +'                        CD_STORE, '
                    +'                        CD_CODE, '
                    +'                        ACT_CODE) '
                    +'  select :P0, '
                    +'         :P1, '
                    +'         CD_CODE, '
                    +'         ACT_CODE '
                    +'    from MS_PRG_MENU '
                    +'   where CD_HEAD  = ''00000000'' '
                    +'     and CD_STORE = :P1 '
                    +'     and ACT_CODE like ''Head%'';',
                    [HeadStoreCode,
                     StandardStore],false,RestDBURL);
      end
      else
        DM.Query.Close;

      DM.OpenQuery('select Count(*) '
                  +'  from MS_PRG_MENU'
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and ACT_CODE like ''Head%'' ',
                  [HeadStoreCode,
                   StoreCode],false,RestDBURL);

      if DM.Query.Fields[0].AsInteger = 0 then
      begin
        DM.Query.Close;
        DM.ExecQuery('insert into MS_PRG_MENU(CD_HEAD, '
                    +'                        CD_STORE, '
                    +'                        CD_CODE, '
                    +'                        ACT_CODE) '
                    +'  select :P0, '
                    +'         :P2, '
                    +'         CD_CODE, '
                    +'         ACT_CODE '
                    +'    from MS_PRG_MENU '
                    +'   where CD_HEAD  = :P0 '
                    +'     and CD_STORE = :P1 '
                    +'     and ACT_CODE like ''Head%'';',
                    [HeadStoreCode,
                     StandardStore,
                     StoreCode],true,RestDBURL);
      end
      else
        DM.Query.Close;
    end;

    //렛츠오더 사용 안한다고 했을때
    if (UserClass <> 'C') and  ((Length(vOptions) > 9) and (vOptions[9] = 'N') and (vHeadOptions[9] = '0')) then
    begin
      vOptions[9] := '0';
      DM.ExecQuery('update CUSTOMER '
                  +'   set OPTIONS =:P2 '
                  +' where CD_COMPANY  = :P0 '
                  +'   and CD_CUSTOMER = :P1;',
                  [HeadStoreCode,
                   StoreCode,
                   vOptions],true, RestBaseURL);
    end;

    // 모두 정상이면 키보드 프로그램을 끝내고 정상적으로 폼을 닫는다
    if ChangeStoreCode = '' then
      SetLogin;

    isLogOut    := false;
    ModalResult := mrOK;
  finally
    OKButton.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
// 닫기 버튼
procedure TLoginForm.AutoLogInTimerTimer(Sender: TObject);
begin
  AutoLogInTimer.Enabled := false;
  OKButtonClick(nil);
end;

procedure TLoginForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TLoginForm.CheckPartner: Boolean;
var vPartnerCode :String;
    vLevel       :String;
begin
  Result := false;
  try
    //협력사 아이디인지 체크한다
    DM.OpenQuery('select USER_LEVEL, CD_PARTNER '
                +'  from USER_MASTER '
                +' where ID_USER    = :P0 '
                +'   and PW_USER    = :P1 '
                +'   and DS_STATUS  = ''0'' ',
                [UserCodeEdit.Text,
                 PasswordEdit.Text], false, RestBaseURL);
    if not DM.Query.Eof then
    begin
      vPartnerCode := DM.Query.Fields[1].AsString;
      UserLevel    := DM.Query.Fields[0].AsString;
      PartnerCode  := DM.Query.Fields[1].AsString;
      DM.Query.Close;
      Result := StoreSelect(vPartnerCode);
    end
    else
      Exit;
  finally
    DM.Query.Close;
  end;
end;

procedure TLoginForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TLoginForm.CreateFlatRoundRgn;
const
  CORNER_SIZE = 10;
var
  Rgn: HRGN;
begin
  with BoundsRect do
  begin
    Rgn := CreateRoundRectRgn(0, 0, Right - Left + 1, Bottom - Top + 1, CORNER_SIZE, CORNER_SIZE);
    // exclude left-bottom corner
    ExcludeRectRgn(Rgn, 0, Bottom - Top - CORNER_SIZE div 2, CORNER_SIZE div 2, Bottom - Top + 1);
    // exclude right-bottom corner
    ExcludeRectRgn(Rgn, Right - Left - CORNER_SIZE div 2, Bottom - Top - CORNER_SIZE div 2, Right - Left , Bottom - Top);
  end;
  // the operating system owns the region, delete the Rgn only SetWindowRgn fails
  if SetWindowRgn(Handle, Rgn, True) = 0 then
    DeleteObject(Rgn);
end;

procedure TLoginForm.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP;
    WindowClass.Style := WindowClass.Style or CS_DROPSHADOW;
  end;
end;

function TLoginForm.CusomerSelect(aCompany,aAuthCode:String): Boolean;
begin
  result := false;
  StoreList.Clear;
  DM.Query.Close;
  if aAuthCode <> '' then
  begin
    DM.OpenQuery('select a.CD_CUSTOMER, '
                +'       b.NM_CUSTOMER, '
                +'       a.CD_COMPANY '
                +'  from USER_AUTH a inner join '
                +'       CUSTOMER  b on b.CD_COMPANY  = a.CD_COMPANY '
                +'                  and b.CD_CUSTOMER = a.CD_CUSTOMER '
                +' where a.CD_AUTH     =:P0 '
                +'   and a.CD_COMPANY  =:P1 '
                +'   and b.DS_STATUS in (''0'',''D'') '
                +' order by a.CD_COMPANY, a.CD_CUSTOMER',
                [aAuthCode,
                 aCompany],false,RestBaseURL);
  end
  else
  begin
    DM.OpenQuery('select a.CD_CUSTOMER, '
                +'       b.NM_CUSTOMER_SHORT, '
                +'       a.CD_COMPANY '
                +'  from USER_AUTH_CUSTOMER a inner join '
                +'       CUSTOMER  b on b.CD_COMPANY  = a.CD_COMPANY '
                +'                  and b.CD_CUSTOMER = a.CD_CUSTOMER '
                +' where a.ID_USER     =:P0 '
                +'   and b.DS_STATUS in (''0'',''D'') '
                +' order by a.CD_COMPANY, a.CD_CUSTOMER',
                [UserCodeEdit.Text],false,RestBaseURL);
  end;

  if not DM.Query.Eof and (UserClass = 'C') then
    StoreList.Add('00000000'
                 +splitColumn+'본사'
                 +splitColumn+DM.Query.Fields[2].AsString);

  while not DM.Query.Eof do
  begin
    StoreList.Add(DM.Query.Fields[0].AsString
                 +splitColumn+DM.Query.Fields[1].AsString
                 +splitColumn+DM.Query.Fields[2].AsString);
    DM.Query.Next;
  end;
  DM.Query.Close;

  with TStoreSelectForm.Create(Self) do
    try
      GridTableViewCode.Caption  := '고객번호';
      GridTableViewName1.Caption := '매장명';

      isStoreChange   := false;
      isPartnerCheck  := false;
      FormStyle := fsStayOnTop;
      if ShowModal = mrOK then
      begin
        Result := true;
        SelectedHeadCode  := SelectHeadCode;
        SelectedStoreCode := SelectStoreCode;
      end;
    finally
      Free;
    end;

end;

end.
