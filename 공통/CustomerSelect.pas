unit CustomerSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxLabel, Data.DB, MemDS, DBAccess, Uni, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxTextEdit, Vcl.ExtCtrls, AdvPanel, cxMaskEdit, cxCurrencyEdit,
  StrUtils, IdTCPClient, IdGlobal, cxNavigator;

type
  TCustomerSelectForm = class(TForm)
    SearchLabel: TLabel;
    SearchEdit: TcxTextEdit;
    SearchButton: TButton;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewCode: TcxGridColumn;
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewBizNo: TcxGridColumn;
    GridLevel: TcxGridLevel;
    OKButton: TButton;
    CloseButton: TButton;
    Label1: TLabel;
    ProxyPanel: TAdvPanel;
    IDLabel: TLabel;
    IDEdit: TcxTextEdit;
    PasswordEdit: TcxTextEdit;
    PasswordLabel: TLabel;
    ProxyOkButton: TButton;
    ProxyCancelButton: TButton;
    GridTableViewDB_IP: TcxGridColumn;
    GridTableViewDB_ID: TcxGridColumn;
    GridTableViewDBPort: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ProxyOkButtonClick(Sender: TObject);
    procedure ProxyCancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure SearchEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IDEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PasswordEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    isProxyCheck :Boolean;
    ProxyCode,
    ProxyPassWord :String;
    procedure ProxyCheck(aShow:Boolean);
  public
    HeadCustomerNo :String;
  end;

var
  CustomerSelectForm: TCustomerSelectForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TCustomerSelectForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerSelectForm.FormActivate(Sender: TObject);
begin
  if not isProxyCheck then
    ProxyCheck(True);
end;

procedure TCustomerSelectForm.FormCreate(Sender: TObject);
var vTemp :String;
begin
  isProxyCheck := false;
  vTemp := Decrypt(GetIniFile(iniMain, 'Proxy',''),_CryptKey);
  if (Length(vTemp)=12) and (LeftStr(vTemp,8) = FormatDateTime('yyyymmdd',now())) then
  begin
    ProxyCode    := RightStr(vTemp,4);
    isProxyCheck := true;
  end;
end;

procedure TCustomerSelectForm.FormResize(Sender: TObject);
begin
  ProxyPanel.Left := Self.Width  div 2 - ProxyPanel.Width div 2;
  ProxyPanel.Top  := Self.Height div 2 - ProxyPanel.Height div 2;
end;

procedure TCustomerSelectForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  OKButtonClick(nil);
end;

procedure TCustomerSelectForm.IDEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Return : PasswordEdit.SetFocus;
  end;
end;

procedure TCustomerSelectForm.OKButtonClick(Sender: TObject);
begin
  if Tag = 0 then
  begin
    if GridTableView.DataController.GetFocusedRecordIndex < 0 then
    begin
      MsgBox('로그인 할 매장을 선택하세요');
      Exit;
    end;
    if not AskBox(Format('%s 매장으로 로그인합니다',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreName.Index]])) then
      Exit;

    if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index] <> '정상' then
    begin
      if not AskBox('매장 공유기에 포트포워딩이 설정되지 않았습니다'+#13+'그래도 실행하시겠습니까?') then
      Exit;
    end;
    SetIniFile(iniCommon, iniDBIP,   String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDB_IP.Index]));
    SetIniFile(iniCommon, iniDBPORT, String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDBPORT.Index]));
    SetIniFile(iniCommon, iniDBUSER, String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDB_ID.Index]));
  end
  else
    HeadCustomerNo := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCode.Index];
  ModalResult := mrOK;
end;

procedure TCustomerSelectForm.PasswordEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : ProxyOkButton.Click;
  end;
end;

procedure TCustomerSelectForm.ProxyCancelButtonClick(Sender: TObject);
begin
  ProxyCheck(false);
end;

procedure TCustomerSelectForm.ProxyCheck(aShow:Boolean);
begin
  ProxyPanel.Visible   := aShow;
  Grid.Enabled         := not aShow;
  OKButton.Enabled     := not aShow;
  CloseButton.Enabled  := not aShow;
  SearchEdit.Enabled   := not aShow;
  SearchButton.Enabled := not aShow;
  if aShow then
    IDEdit.SetFocus;
end;

procedure TCustomerSelectForm.ProxyOkButtonClick(Sender: TObject);
var vRcvData :String;
begin
  if IDEdit.Text = '' then
  begin
    MsgBox('협력사 ID를 입력하세요');
    IDEdit.SetFocus;
    Exit;
  end;

  if PasswordEdit.Text = '' then
  begin
    MsgBox('비밀번호를 입력하세요');
    PasswordEdit.SetFocus;
    Exit;
  end;

  with TIdTCPClient.Create(self) do
    try
      Host           := ipServer;
      Port           := portServer;
      ConnectTimeout := 500;
      ReadTimeout    := 5000;
      Connect;
      Socket.WriteLnRFC('S'+#28+IDEdit.Text+#28+PasswordEdit.Text+#28+#3, IndyTextEncoding_OSDefault);
      vRcvData := Socket.ReadLn(#3, IndyTextEncoding_OSDefault);
      if Length(vRcvData) = 4 then
      begin
        ProxyCode := vRcvData;
        ProxyCheck(false);
        SetIniFile(iniMain, 'Proxy', Encrypt(FormatDateTime('yyyymmdd',now())+ProxyCode,_CryptKey));
        isProxyCheck := true;
        SearchEdit.SetFocus;
      end
      else
      begin
        case StrToIntDef(vRcvData,9) of
          0 : MsgBox('협력사정보가 올바르지 않습니다');
          1 : MsgBox('비밀번호가 일치하지 않습니다');
          3 : MsgBox('협력사 기간이 만료되었습니다');
          4 : MsgBox('계약이 해지 된 협력사입니다');
          9 : MsgBox('알 수 없는 에러입니다');
        end;
      end;
    finally
      if Connected then
        Disconnect;
      Free;
    end;
end;

procedure TCustomerSelectForm.SearchButtonClick(Sender: TObject);
begin
  if not isProxyCheck then
  begin
    ProxyCheck(true);
    Exit;
  end;

  try
    ProxyOkButton.Enabled := false;
    dm.LocalConnection.Connect;
    dm.LocalQuery.Close;
    dm.LocalQuery.SQL.Text := 'select CD_CUSTOMER, '
                             +'       NM_CUSTOMER, '
                             +'       BIZ_NO, '
                             +'       LOCAL_IP, '
                             +'       LOCAL_ID, '
                             +'       LOCAL_PORT, '
                             +'       case when right(LOCAL_STATUS,2) = ''00'' then ''정상'' else ''설정안됨'' end as DS_STATUS '
                             +'  from MS_CUSTOMER '
                             +' where CD_PROXY = :P0 '
                             +'   and (CD_CUSTOMER =:P1 '
                             +'     or NM_CUSTOMER like concat(''%'',:P1,''%'') '
                             +'     or GetOnlyNumber(BIZ_NO) = :P1) '
                             +' order by CD_CUSTOMER ';
    dm.LocalQuery.ParamByName('P0').AsString := ProxyCode;
    dm.LocalQuery.ParamByName('P1').AsString := SearchEdit.Text;
    dm.LocalQuery.Open;
    if not DM.ReadQuery(dm.LocalQuery, GridTableView) then
      MsgBox('조건에 맞는 자료가 없습니다');
  finally
    dm.LocalConnection.Disconnect;
  end;
end;

procedure TCustomerSelectForm.SearchEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Return : SearchButton.Click;
    VK_Escape : CloseButton.Click;
    VK_Down   : if GridTableView.DataController.RecordCount > 0 then
                  Grid.SetFocus;
  end;
end;

end.
