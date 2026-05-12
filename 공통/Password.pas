// 암호 변경 (F)

unit Password;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Data.DB, MemDS, DBAccess,
  Uni, StrUtils, AdvGlowButton;

type
  TPasswordForm = class(TForm)
    PasswordShape: TShape;
    CurrentPasswordLabel: TLabel;
    CurrentPasswordEdit: TcxTextEdit;
    NewPasswordLabel: TLabel;
    NewPasswordEdit: TcxTextEdit;
    ConfirmPasswordLabel: TLabel;
    ConfirmPasswordEdit: TcxTextEdit;
    ShowPasswordCheckBox: TCheckBox;
    OKButton: TAdvGlowButton;
    CancelButton: TAdvGlowButton;

    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ShowPasswordCheckBoxClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  public
    UserCode, UserPass: string;
  end;

implementation

uses
  Common, DBModule, ProxyCheck;

const
  minPasswordLength = 1;

{$R *.dfm}

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창에서 키보드를 누를 때
procedure TPasswordForm.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Escape : CancelButton.Click;
    VK_Up     : SelectNext(TWinControl(Sender), false, true);
    VK_Down   : SelectNext(TWinControl(Sender), true, true);
    VK_Return : if Sender = ConfirmPasswordEdit then
                  OKButton.Click
                else
                  SelectNext(TWinControl(Sender), true, true);
  end;
end;
procedure TPasswordForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Tag = 0 then Exit;

  if (Shift = [ssCtrl]) and (Key = Ord('P')) then
  begin
    with TProxyCheckForm.Create(self) do
      try
        if ShowModal <> mrOK then
          Exit
        else
        begin
          MsgBox('현재 암호를 체크하지 않고 변경합니다');
          CurrentPasswordEdit.Enabled := false;
          Exit;
        end;
      finally
        Free;
      end;
  end;

end;

//------------------------------------------------------------------------------
// 비밀번호 표시 체크박스
procedure TPasswordForm.ShowPasswordCheckBoxClick(Sender: TObject);
begin
  if ShowPasswordCheckBox.Checked then
    CurrentPasswordEdit.Properties.EchoMode := eemNormal
  else
    CurrentPasswordEdit.Properties.EchoMode := eemPassword;
  NewPasswordEdit.Properties.EchoMode       := CurrentPasswordEdit.Properties.EchoMode;
  ConfirmPasswordEdit.Properties.EchoMode   := CurrentPasswordEdit.Properties.EchoMode;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 확인 버튼
procedure TPasswordForm.OKButtonClick(Sender: TObject);
  function InputDataCheck(aPassword:String):Boolean;
  var vCharSet: TSysCharSet;
      vIndex  : Integer;
  begin
    Result := false;

    // 모든 값 입력 여부 확인
    if CurrentPasswordEdit.Enabled and (CurrentPasswordEdit.Text = EmptyStr) then
      CurrentPasswordEdit.SetFocus
    else if NewPasswordEdit.Text = EmptyStr then
      NewPasswordEdit.SetFocus
    else if ConfirmPasswordEdit.Text = EmptyStr then
      ConfirmPasswordEdit.SetFocus
    // 에러 확인
    else if CurrentPasswordEdit.Enabled and (CurrentPasswordEdit.Text <> aPassword) then
    begin
      ErrBox(Format('%s가 일치하지 않습니다.', [CurrentPasswordLabel.Caption]));
      CurrentPasswordEdit.SetFocus;
      CurrentPasswordEdit.SelectAll;
    end
    else if NewPasswordEdit.Text <> ConfirmPasswordEdit.Text then
    begin
      ErrBox(Format('%s와 %s이 서로 다릅니다.', [NewPasswordLabel.Caption, ConfirmPasswordLabel.Caption]));
      ConfirmPasswordEdit.SetFocus;
      ConfirmPasswordEdit.SelectAll;
    end
    else if NewPasswordEdit.Text = CurrentPasswordEdit.Text then
    begin
      ErrBox(Format('%s와 %s가 같습니다.', [NewPasswordLabel.Caption, CurrentPasswordLabel.Caption]));
      ConfirmPasswordEdit.Clear;
      NewPasswordEdit.SetFocus;
      NewPasswordEdit.SelectAll;
    end
    else if NewPasswordEdit.Text = UserCode then
    begin
      ErrBox(Format('%s와 아이디와 같습니다.', [NewPasswordLabel.Caption]));
      ConfirmPasswordEdit.Clear;
      NewPasswordEdit.SetFocus;
      NewPasswordEdit.SelectAll;
    end
    else if Length(NewPasswordEdit.Text) < minPasswordLength then
    begin
      ErrBox(Format('%s는 최소 %d글자 이상 입력하십시오.', [NewPasswordLabel.Caption, minPasswordLength]));
      ConfirmPasswordEdit.Clear;
      NewPasswordEdit.SetFocus;
      NewPasswordEdit.SelectAll;
    end
    // 정상 처리
    else
    begin
      vCharSet := [' ','%',';','-','+',','];
      for vIndex := 1 to Length(NewPasswordEdit.Text) do
      begin
        if CharInSet(NewPasswordEdit.Text[vIndex], vCharSet) then
        begin
          MsgBox(Format('패스워드에 %s 문자는 사용할 수 없습니다',[Copy(NewPasswordEdit.Text, vIndex,1)]));
          Break;
          Exit;
        end;
      end;
      Result := true;
    end;
  end;
begin
  if Tag = 0 then
  begin
    if InputDataCheck(UserPass) then
    begin
      if UserLevel = '' then
      begin
        if not DM.ExecQuery('update MS_SAWON '
                            +'  set NO_PASSWORD = :P3, '
                            +'       DT_CHANGE   = Now() '
                            +'where  CD_HEAD  =:P0 '
                            +'  and  CD_STORE =:P1 '
                            +'  and  CD_SAWON =:P2;',
                             [HeadStoreCode,
                              StoreCode,
                              UserCode,
                              Encrypt(NewPasswordEdit.Text, _CryptKey)],true,RestDBURL) then Exit;
      end;

      if not DM.ExecQuery('update '+Ifthen(UserLevel = '', ' USER_CUSTOMER ', 'USER_MASTER ')
                          +'   set PW_USER =:P1 '
                          +' where ID_USER =:P0; ',
                          [UserCode,
                           NewPasswordEdit.Text],true,RestBaseURL) then Exit;


      UserPass    := NewPasswordEdit.Text;
      ModalResult := mrOK;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure TPasswordForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

end.
