// 협력사 확인 (F)

unit ProxyCheck;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, StrUtils;

type
  TProxyCheckForm = class(TForm)
    PasswordShape: TShape;
    IDLabel: TLabel;
    PasswordLabel: TLabel;
    OKButton: TButton;
    CancelButton: TButton;
    IDEdit: TcxTextEdit;
    PasswordEdit: TcxTextEdit;
    Label1: TLabel;
    CustomerNoLabel: TLabel;

    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    isProxyCheck :Boolean;
    ProxyCode    :String;
    ChooseUserLevel :String;
    isExtremePosCheck :Boolean;
  end;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 확인 버튼
procedure TProxyCheckForm.FormCreate(Sender: TObject);
begin
  BlockInput(false);
  isProxyCheck      := false;
  isExtremePosCheck := false;
end;

procedure TProxyCheckForm.FormShow(Sender: TObject);
begin
  IDEdit.Clear;
  PasswordEdit.Clear;
  CustomerNoLabel.Caption := ifThen(StoreCode = StandardStore, HeadStoreCode, StoreCode);
end;

procedure TProxyCheckForm.OKButtonClick(Sender: TObject);
var
  vProxyCode:String;
begin
  // 모든 값 입력 여부 확인
  if IDEdit.Text = EmptyStr then
    IDEdit.SetFocus
  else if PasswordEdit.Text = EmptyStr then
    PasswordEdit.SetFocus
  // 확인
  else
  begin
    try
      DM.OpenQuery('select USER_LEVEL, CD_PARTNER '
                  +'  from USER_MASTER '
                  +' where ID_USER    = :P0'
                  +'   and PW_USER    = :P1 '
                  +'   and DS_STATUS  = ''0'' ',
                  [IDEdit.Text,
                   PasswordEdit.Text], false, RestBaseURL);

      if DM.Query.Eof then
      begin
        ErrBox('협력사 정보가 올바르지 않습니다');
        Exit;
      end;

      ChooseUserLevel := DM.Query.Fields[0].AsString;
      if DM.Query.Fields[0].AsString = 'E' then
      begin
        DM.Query.Close;
        ProxyCode   := DM.Query.Fields[1].AsString;
        ModalResult := mrOK;
        Exit;
      end;

      //익스트림포스 체크일때
      if isExtremePosCheck then
      begin
        MsgBox('익스트림포스 본사 사용자만 가능합니다');
        Close;
        Exit;
      end;


      vProxyCode := DM.Query.Fields[1].AsString;
      DM.Query.Close;

      if isProxyCheck then
      begin
        ProxyCode   := vProxyCode;
        ModalResult := mrOK;
        Exit;
      end;

      //데모는 제외
      //표준일때
      if StoreCode = StandardStore then
        DM.OpenQuery('select CD_PARTNER '
                    +'  from COMPANY '
                    +' where CD_COMPANY  = :P0 '
                    +'   and YN_USE      = ''Y'' ',
                    [HeadStoreCode],false,RestBaseURL)
      else
        DM.OpenQuery('select CD_PARTNER '
                    +'  from CUSTOMER '
                    +' where CD_COMPANY  = :P0 '
                    +'   and CD_CUSTOMER = :P1 '
                    +'   and DS_STATUS   in (''0'',''D'') ',
                    [HeadStoreCode,
                     StoreCode],false,RestBaseURL);

      if DM.Query.Eof then
      begin
        ErrBox('고객정보가 존재하지 않습니다');
        Exit;
      end;

      if vProxyCode <> DM.Query.Fields[0].AsString then
      begin
        ErrBox('협력사의 매장이 아닙니다');
        Exit;
      end;
      ModalResult := mrOK;
    finally
      DM.Query.Close;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure TProxyCheckForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

end.
