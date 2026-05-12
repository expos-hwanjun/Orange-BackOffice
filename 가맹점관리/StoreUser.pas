unit StoreUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, cxButtonEdit,
  AdvGlassButton, Vcl.StdCtrls, cxMemo, Math, StrUtils, cxCheckBox, AdvGroupBox,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TStoreUserForm = class(TInheritGridEditForm)
    GridTableViewUserID: TcxGridColumn;
    GridTableViewUserName: TcxGridColumn;
    GridTableViewClass: TcxGridColumn;
    AppIDLabel: TLabel;
    AppPWDLabel: TLabel;
    UserIDEdit: TcxTextEdit;
    AppPWDEdit: TcxTextEdit;
    GoodsNameLabel: TLabel;
    UserNameEdit: TcxTextEdit;
    CompanyNameLabel: TLabel;
    CompanyCodeEdit: TcxButtonEdit;
    CompanyNameEdit: TcxTextEdit;
    UseYNLabel: TLabel;
    UserLevelComboBox: TcxComboBox;
    StoreNameLabel: TLabel;
    StoreCodeEdit: TcxButtonEdit;
    StoreNameEdit: TcxTextEdit;
    AuthGroupLabel: TLabel;
    AuthComboBox: TcxComboBox;
    Label4: TLabel;
    UseYNComboBox: TcxComboBox;
    RemarkLabel: TLabel;
    RemarkMemo: TcxMemo;
    cxLabel1: TcxLabel;
    ToolBarCompanyCodeEdit: TcxButtonEdit;
    ToolBarCompanyNameLabel: TcxLabel;
    StoreChooseCheckBox: TcxCheckBox;
    CustomerGroupBox: TAdvGroupBox;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1CustomerCode: TcxGridColumn;
    GridTableView1CustomerName: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1CompanyCode: TcxGridColumn;
    AppUseCheckBox: TcxCheckBox;
    GridTableViewPartner: TcxGridColumn;
    AddButton: TAdvGlowButton;
    DeleteButton: TAdvGlowButton;
    IDDupCheckButton: TAdvGlowButton;
    CompanyExistsCheckBox: TcxCheckBox;
    TrdCodeEdit: TcxButtonEdit;
    TrdNameEdit: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPropertiesChange(Sender: TObject);
    procedure IDDupCheckButtonClick(Sender: TObject);
    procedure ToolBarCompanyCodeEditPropertiesChange(Sender: TObject);
    procedure StoreCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TtrCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    vPartnerCode :String;
    ERPStoreCode,
    ERPRestURL:String;
    procedure SetAuthComboBox;
    procedure SelectCustomer(aCompanyCode:String; aType:Integer);                    //aType 0:프렌차이즈, 1:전매장
    procedure SetERPRestURL(aCompanyCode:String);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StoreUserForm: TStoreUserForm;

implementation
uses Common, DBModule, UnitZipPopup, Help;

{$R *.dfm}
procedure TStoreUserForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  UserLevelComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'S';
  UserLevelComboBox.Properties.Items.AddObject('매장', TObject(vCode));
  New(vCode);
  vCode^.Data := 'C';
  UserLevelComboBox.Properties.Items.AddObject('본사', TObject(vCode));
  New(vCode);
  vCode^.Data := 'M';
  UserLevelComboBox.Properties.Items.AddObject('유통', TObject(vCode));
  New(vCode);
  vCode^.Data := 'R';
  UserLevelComboBox.Properties.Items.AddObject('임대매장(유통)', TObject(vCode));

  if UserLevel='P' then
  begin
    ButtonToolBarNewButton.Visible    := false;
    ButtonToolBarDeleteButton.Visible := false;
    ButtonToolBarSaveButton.Visible   := false;
    ButtonToolBar.Refresh;
  end;
  SetAuthComboBox;
end;

procedure TStoreUserForm.SetERPRestURL(aCompanyCode: String);
begin
  try
    DM.OpenQuery('select a.IP_ADDR, '
                +'       a.SERVICE_PORT, '
                +'       a.REST_API, '
                +'       a.DB_NAME '
                +'  from SERVER_LIST   a inner join '
                +'       COMPANY       b on b.ID_SERVER = a.ID_SERVER '
                +' where b.CD_COMPANY = :P0 '
                +'   and a.DS_SERVER  = ''E'' ',
                [aCompanyCode],false,RestBaseURL);
    if not DM.Query.Eof then
    begin
      ERPRestURL := Format('http://%s:%s/%s/|%s',[DM.Query.FieldByName('IP_ADDR').AsString,
                                            DM.Query.FieldByName('SERVICE_PORT').AsString,
                                            DM.Query.FieldByName('REST_API').AsString,
                                            DM.Query.FieldByName('DB_NAME').AsString]);
    end
  finally
    DM.Query.Close;
  end;
end;

procedure TStoreUserForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if UserLevel='P' then
    MainPanel.Enabled := false;
end;

procedure TStoreUserForm.IDDupCheckButtonClick(Sender: TObject);
begin
  inherited;
  if Length(UserIDEdit.Text) < 6 then
  begin
    MsgBox('아이디는 최소 6자리 이상이어야 합니다');
    Exit;
  end;

  try
    OpenQuery('select ID_USER '
             +'  from USER_CUSTOMER '
             +' where ID_USER   = :P0 '
             +'union all '
             +'select ID_USER '
             +'  from USER_MASTER '
             +' where ID_USER   = :P0 ',
             [UserIDEdit.Text],false,RestBaseURL);
    if not Query.Eof then
    begin
      MsgBox('사용 중인 아이디입니다');
      Exit;
    end
    else
    begin
      UserIDEdit.TextHint := UserIDEdit.Text;
      MsgBox('사용 가능한 아이디입니다');
      AppPWDEdit.SetFocus;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TStoreUserForm.SelectCustomer(aCompanyCode:String; aType:Integer);
begin
  with THelpForm.Create(Self) do
    try
      Caption                    := '매장 조회';
      GridTableViewCode.Caption  := '매장 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '매장 이름';
      GridTableViewName1.Width   := 320;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_CUSTOMER, '
                   +'       NM_CUSTOMER, '
                   +'       CD_COMPANY, '
                   +'       CD_PARTNER '
                   +'  from CUSTOMER '
                   +' where (CD_CUSTOMER =:P2 or NM_CUSTOMER  like ConCat(''%'',:P2,''%'')) '
                   +Ifthen(aCompanyCode='', '', Format(' and CD_COMPANY = ''%s'' ',[aCompanyCode]))
                   +'   and DS_CUSTOMER = ''O'' '
                   +'   and Length(CD_CUSTOMER) = 8 '
                   +'   and DS_STATUS in(''0'',''D'') '
                   +'order by CD_COMPANY';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        if aType = 0 then
        begin
          StoreCodeEdit.Text    := Code;
          StoreCodeEdit.TextHint:= Code;
          StoreNameEdit.Text    := Names[0];
          vPartnerCode          := Names[2];
          isChanged := true;
        end
        else
        begin
          GridTableView1.DataController.AppendRecord;
          GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1CustomerCode.Index] := Code;
          GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1CustomerName.Index] := Names[0];
          GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1CompanyCode.Index]  := Names[1];
          isChanged := true;
        end;
      end;
    finally
      Free;
    end;
end;

procedure TStoreUserForm.SetAuthComboBox;
var
  vCode : PStrPointer;
begin
  AuthComboBox.Properties.Items.Clear;
  try
    DM.OpenQuery('select CD_AUTH, '
                +'       Max(NM_AUTH) as NM_AUTH '
                +'  from USER_AUTH  '
                +' where CD_COMPANY  = :P0 '
                +' group by CD_AUTH ',
                [CompanyCodeEdit.Text],false,RestBaseURL);
    New(vCode);
    vCode^.Data := '';
    AuthComboBox.Properties.Items.AddObject('지정안함', TObject(vCode));
    while not DM.Query.Eof do
    begin
      New(vCode);
      vCode^.Data := DM.Query.FieldList[0].AsString;
      AuthComboBox.Properties.Items.AddObject(DM.Query.FieldList[1].AsString, TObject(vCode));
      DM.Query.Next;
    end;
  finally
    DM.Query.Close;
  end;
  isChanged := false;
end;

procedure TStoreUserForm.StoreCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var vWhere :String;
begin
  inherited;
  if (GetStrPointerData(UserLevelComboBox) <> 'M') and (GetStrPointerData(UserLevelComboBox) <> 'R') then
    SelectCustomer(CompanyCodeEdit.Text,0)
  else
  begin
    if UserLevel = 'P' then
      vWhere := Format(' and CD_PARTNER = (select CD_PARTNER '
                      +'                     from USER_MASTER '
                      +'                    where ID_USER =''%s'') ',[UserCode])
    else
      vWhere := '';

    with THelpForm.Create(Self) do
    try
      Caption                    := '매장 조회';
      GridTableViewCode.Caption  := '매장 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '매장 이름';
      GridTableViewName1.Width   := 320;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_CUSTOMER, '
                   +'       NM_CUSTOMER, '
                   +'       CD_COMPANY, '
                   +'       CD_PARTNER, '
                   +'       CD_STORE '
                   +'  from CUSTOMER '
                   +' where (CD_CUSTOMER =:P2 or NM_CUSTOMER  like ConCat(''%'',:P2,''%'')) '
                   +'   and DS_CUSTOMER in (''E'',''M'') '
                   +'   and Length(CD_CUSTOMER) = 8 '
                   +'   and DS_STATUS = ''0'' '
                   +vWhere
                   +'order by CD_CUSTOMER';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        StoreCodeEdit.Text    := Code;
        StoreCodeEdit.TextHint:= Code;
        StoreNameEdit.Text    := Names[0];
        SetERPRestURL(Names[1]);
        vPartnerCode            := Names[2];
        ERPStoreCode            := Names[3];
        isChanged := true;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TStoreUserForm.ToolBarCompanyCodeEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if ToolBarCompanyCodeEdit.Text <> ToolBarCompanyCodeEdit.TextHint then
  begin
    ToolBarCompanyNameLabel.Caption := '';
    ToolBarCompanyCodeEdit.TextHint := '단독매장';
    SetAuthComboBox;
  end;
end;

procedure TStoreUserForm.TtrCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '거래처 조회';
      GridTableViewCode.Caption  := '거래처코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '거래처이름';
      GridTableViewName1.Width   := 320;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '구분';
      GridTableViewName2.Width   := 60;
      GridTableViewName2.PropertiesClassName       := 'TcxLabelProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;
      jsonHelpURL := ERPRestURL;

      SQLText    := 'select CD_TRDPL, '
                   +'       NM_TRDPL, '
                   +'       case DS_TRDPL when ''R'' then ''임대'' when ''C'' then ''수수료'' when ''E'' then ''특정'' end '
                   +'  from MS_TRD '
                   +Format(' where CD_STORE = ''%s'' ',[ERPStoreCode])
                   +'   and (CD_TRDPL =:P2 or NM_TRDPL  like ConCat(''%'',:P2,''%'')) '
                   +'   and DS_TRDPL in (''R'',''C'',''E'') '
                   +'   and DS_STATUS = ''0'' '
                   +'order by CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        TrdCodeEdit.Text    := Code;
        TrdCodeEdit.TextHint:= Code;
        TrdNameEdit.Text    := Names[0];
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

procedure TStoreUserForm.AddButtonClick(Sender: TObject);
begin
  inherited;
  SelectCustomer(CompanyCodeEdit.Text,1);
end;

procedure TStoreUserForm.CompanyCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var vWhere :String;
begin
  inherited;
  if UserLevel = 'P' then
    vWhere := Format(' and CD_PARTNER = (select CD_PARTNER '
                    +'                     from USER_MASTER '
                    +'                    where ID_USER =''%s'') ',[UserCode]);

  with THelpForm.Create(Self) do
    try
      Caption                    := '본사 조회';
      GridTableViewCode.Caption  := '본사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '본사 이름';
      GridTableViewName1.Width   := 320;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_COMPANY, '
                   +'       NM_COMPANY, '
                   +'       CD_PARTNER '
                   +'  from COMPANY '
                   +' where NM_COMPANY  like ConCat(''%'',:P2,''%'') '
                   +'   and CD_COMPANY <> ''00000000'' '
                   +'   and YN_USE = ''Y'' '
                   +vWhere
                   +'order by CD_COMPANY';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        SetAuthComboBox;
        if Sender = CompanyCodeEdit then
        begin
          CompanyCodeEdit.Text    := Code;
          CompanyCodeEdit.TextHint:= Code;
          CompanyNameEdit.Text    := Names[0];
          vPartnerCode            := Names[1];
          isChanged := true;
        end
        else
        begin
          ToolBarCompanyCodeEdit.Text     := Code;
          ToolBarCompanyCodeEdit.TextHint := Code;
          ToolBarCompanyNameLabel.Caption := Names[0];
          vPartnerCode             := Names[1];
        end;
      end;
    finally
      Free;
    end;

end;

procedure TStoreUserForm.DeleteButtonClick(Sender: TObject);
begin
  inherited;
  GridTableView1.DataController.DeleteRecord(GridTableView1.DataController.GetFocusedRecordIndex);
  isChanged := true;
end;

function TStoreUserForm.DoDelete: Boolean;
begin
  Result := ExecQuery('delete from USER_CUSTOMER '
                     +' where ID_USER = :P0; '
                     +'delete from USER_AUTH '
                     +' where CD_CUSTOMER = :P0;'
                     +'delete from USER_AUTH_CUSTOMER '
                     +' where CD_CUSTOMER = :P0;',
                     [UserIDEdit.Text],true,RestBaseURL);
end;

procedure TStoreUserForm.DoGridLink;
begin
  inherited;
  GridTableView1.DataController.RecordCount := 0;
  try
    OpenQuery('select a.ID_USER, '
             +'       a.NM_USER, '
             +'       a.PW_USER, '
             +'       a.USER_LEVEL, '
             +'       a.CD_COMPANY, '
             +'       b.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       c.NM_CUSTOMER, '
             +'       a.YN_STORECHOOSE, '
             +'       a.YN_APP, '
             +'       a.CD_AUTH, '
             +'       a.REMARK, '
             +'       a.CD_PARTNER, '
             +'       a.COMPANY_EXISTS, '
             +'       a.DS_STATUS, '
             +'       a.CD_TRDPL, '
             +'       c.CD_STORE '
             +'  from USER_CUSTOMER a left outer join '
             +'       COMPANY       b on b.CD_COMPANY  = a.CD_COMPANY left outer join '
             +'       CUSTOMER      c on c.CD_CUSTOMER = a.CD_CUSTOMER '
             +' where a.ID_USER = :P0 ',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewUserID.Index]],false,RestBaseURL);

    if not Query.Eof then
    begin
      UserIDEdit.Text              := Query.FieldByName('ID_USER').AsString;
      UserNameEdit.Text            := Query.FieldByName('NM_USER').AsString;
      AppPWDEdit.Text              := Query.FieldByName('PW_USER').AsString;
      UserLevelComboBox.ItemIndex  := GetStrPointerIndex(UserLevelComboBox, Query.FieldByName('USER_LEVEL').AsString);
      CompanyCodeEdit.Text         := Query.FieldByName('CD_COMPANY').AsString;
      CompanyCodeEdit.TextHint     := Query.FieldByName('CD_COMPANY').AsString;
      CompanyNameEdit.Text         := Query.FieldByName('NM_COMPANY').AsString;
      StoreCodeEdit.Text           := Query.FieldByName('CD_CUSTOMER').AsString;
      StoreCodeEdit.TextHint       := Query.FieldByName('CD_CUSTOMER').AsString;
      StoreNameEdit.Text           := Query.FieldByName('NM_CUSTOMER').AsString;
      StoreChooseCheckBox.Checked  := Query.FieldByName('YN_STORECHOOSE').AsString = 'Y';
      AppUseCheckBox.Checked       := Query.FieldByName('YN_APP').AsString = 'Y';
      SetAuthComboBox;
      AuthComboBox.ItemIndex       := GetStrPointerIndex(AuthComboBox, Query.FieldByName('CD_AUTH').AsString);
      RemarkMemo.Text              := Query.FieldByName('REMARK').AsString;
      vPartnerCode                 := Query.FieldByName('CD_PARTNER').AsString;
      CompanyExistsCheckBox.Checked := Query.FieldByName('COMPANY_EXISTS').AsString = 'Y';
      UseYNComboBox.ItemIndex      := Query.FieldByName('DS_STATUS').AsInteger;
      TrdCodeEdit.Text             := Query.FieldByName('CD_TRDPL').AsString;
      ERPStoreCode                 := Query.FieldByName('CD_STORE').AsString;
    end;

    if StoreChooseCheckBox.Checked and (GetStrPointerData(UserLevelComboBox) = 'S') then
    begin
      CustomerGroupBox.Visible := true;
      Query.Close;
      OpenQuery('select a.CD_CUSTOMER, '
               +'       b.NM_CUSTOMER, '
               +'       a.CD_COMPANY '
               +'  from USER_AUTH_CUSTOMER a inner join '
               +'       CUSTOMER           b on b.CD_CUSTOMER = a.CD_CUSTOMER '
               +' where a.ID_USER = :P0 '
               +' order by a.CD_CUSTOMER ',
               [UserIDEdit.Text],false,RestBaseURL);
      DM.ReadQuery(Query, GridTableView1);
    end
    else
      CustomerGroupBox.Visible := false;

    if GetStrPointerData(UserLevelComboBox) = 'R' then
    begin
      Query.Close;
      SetERPRestURL(CompanyCodeEdit.Text);
      OpenQuery('select NM_TRDPL '
               +'  from MS_TRD '
               +' where CD_STORE = :P0 '
               +'   and CD_TRDPL = :P1 ',
               [ERPStoreCode,
                TrdCodeEdit.Text],false,ERPRestURL);
      if not Query.Eof then
        TrdNameEdit.Text := Query.FieldByName('NM_TRDPL').AsString;
    end;

    IDDupCheckButton.Enabled := false;
  finally
    Query.Close;
  end;

end;

function TStoreUserForm.DoNew: Boolean;
begin
  IDDupCheckButton.Enabled := true;
  GridTableView1.DataController.RecordCount :=0;
  CustomerGroupBox.Visible := false;
  if ToolBarCompanyCodeEdit.Text <> '' then
  begin
    CompanyCodeEdit.Text     := ToolBarCompanyCodeEdit.Text;
    CompanyCodeEdit.TextHint := ToolBarCompanyCodeEdit.Text;
    CompanyNameEdit.Text     := ToolBarCompanyNameLabel.Caption;
    StoreCodeEdit.Clear;
  end;
  AppUseCheckBox.Checked := true;
  UserIDEdit.SetFocus;
  Result := true;
end;

function TStoreUserForm.DoSave: Boolean;
var vIndex :Integer;
    vURL   :String;
    vStoreList :TStringList;
begin
  Result := false;
  if isNew and (UserIDEdit.TextHint <> UserIDEdit.Text) then
  begin
    MsgBox('아이디 중복체크 후 저장해야합니다');
    Exit;
  end;

  if UserNameEdit.Text='' then
  begin
    MsgBox('사용자이름을 입력해야합니다');
    Exit;
  end;

  if (Length(AppPWDEdit.Text) < 4) then
  begin
    MsgBox('비밀번호는 4자리 이상이어야 합니다.');
    Exit;
  end;

  if (UserLevelComboBox.ItemIndex=1) and (CompanyCodeEdit.Text='') then
  begin
    MsgBox('본사을 지정해야합니다');
    Exit;
  end;

  if (GetStrPointerData(UserLevelComboBox) = 'S') and (StoreCodeEdit.Text='') then
  begin
    MsgBox('매장을 지정해야합니다');
    Exit;
  end;

  ExecQuery(Ifthen(isNew,'insert into USER_CUSTOMER(ID_USER, '
                        +'                          CD_CUSTOMER, '
                        +'                          CD_COMPANY, '
                        +'                          NM_USER, '
                        +'                          USER_LEVEL, '
                        +'                          PW_USER, '
                        +'                          CD_AUTH, '
                        +'                          YN_STORECHOOSE, '
                        +'                          YN_APP, '
                        +'                          REMARK, '
                        +'                          DS_STATUS, '
                        +'                          CD_PARTNER, '
                        +'                          CD_TRDPL, '
                        +'                          COMPANY_EXISTS) '
                        +'                   values(:P0, '
                        +'                          :P1, '
                        +'                          :P2, '
                        +'                          :P3, '
                        +'                          :P4, '
                        +'                          :P5, '
                        +'                          :P6, '
                        +'                          :P7, '
                        +'                          :P8, '
                        +'                          :P9, '
                        +'                          :P10, '
                        +'                          :P11, '
                        +'                          :P12, '
                        +'                          :P13);',
                         'update USER_CUSTOMER '
                        +'   set CD_CUSTOMER    =:P1, '
                        +'       CD_COMPANY     =:P2, '
                        +'       NM_USER        =:P3, '
                        +'       USER_LEVEL     =:P4, '
                        +'       PW_USER        =:P5, '
                        +'       CD_AUTH        =:P6, '
                        +'       YN_STORECHOOSE =:P7, '
                        +'       YN_APP         =:P8, '
                        +'       REMARK         =:P9, '
                        +'       DS_STATUS      =:P10, '
                        +'       CD_TRDPL       =:P12, '
                        +'       COMPANY_EXISTS =:P13 '
                        +' where ID_USER  =:P0;'),
                        [UserIDEdit.Text,
                         StoreCodeEdit.Text,
                         Ifthen(CompanyCodeEdit.Text='','00000000',CompanyCodeEdit.Text),
                         UserNameEdit.Text,
                         GetStrPointerData(UserLevelComboBox),
                         AppPWDEdit.Text,
                         GetStrPointerData(AuthComboBox),
                         Ifthen(StoreChooseCheckBox.Checked,'Y','N'),
                         Ifthen(AppUseCheckBox.Checked,'Y','N'),
                         RemarkMemo.Text,
                         Ifthen(UseYNComboBox.ItemIndex=0,'0','1'),
                         vPartnerCode,
                         TrdCodeEdit.Text,
                         Ifthen(CompanyExistsCheckBox.Checked,'Y','N')],false,RestBaseURL);

  ExecQuery('delete from USER_AUTH_CUSTOMER '
           +' where ID_USER =:P0;',
           [UserIDEdit.Text],false,RestBaseURL);

  for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    ExecQuery('insert into USER_AUTH_CUSTOMER(ID_USER, '
            +'                                CD_CUSTOMER, '
            +'                                CD_COMPANY) '
            +'                        values(:P0, '
            +'                               :P1, '
            +'                               :P2);',
            [UserIDEdit.Text,
             GridTableView1.DataController.Values[vIndex, GridTableView1CustomerCode.Index],
             GridTableView1.DataController.Values[vIndex, GridTableView1CompanyCode.Index]],false,RestBaseURL);

  Result := ExecQuery('',[],true, RestBaseURL);

  if GetStrPointerData(AuthComboBox) = '' then Exit;

  OpenQuery('select CD_CUSTOMER '
           +'  from USER_AUTH '
           +' where CD_COMPANY =:P0 '
           +'   and CD_AUTH    =:P1',
           [Ifthen(CompanyCodeEdit.Text='','00000000',CompanyCodeEdit.Text),
            GetStrPointerData(AuthComboBox)],false, RestBaseURL);
  try
    vStoreList := TStringList.Create;
    vStoreList.Clear;
    while not Query.Eof do
    begin
      vStoreList.Add(Query.Fields[0].AsString);
      Query.Next;
    end;
    Query.Close;
    vURL := GetRestDBURL(Ifthen(CompanyCodeEdit.Text='','00000000',CompanyCodeEdit.Text));

    for vIndex := 0 to vStoreList.Count-1 do
    begin
      ExecQuery('insert into MS_SAWON(CD_HEAD, '
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
               +' ON DUPLICATE KEY UPDATE DT_CHANGE    =Now();',
               [Ifthen(CompanyCodeEdit.Text='','00000000',CompanyCodeEdit.Text),
                vStoreList.Strings[vIndex],
                UserIDEdit.Text,
                UserNameEdit.Text,
                Encrypt(AppPWDEdit.Text, _CryptKey),
                Ifthen(StoreCodeEdit.Text=vStoreList.Strings[vIndex],'N','Y')], false, vURL);
    end;
    Result := ExecQuery('',[],true, vURL);
  finally
    vStoreList.Free;
  end;

  if Result then
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := Trim(UserIDEdit.Text);
      NewData[1] := UserNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewUserName.Index] := UserNameEdit.Text;

end;

function TStoreUserForm.DoSearch: Boolean;
var vWhere, vJoin :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := ' and a.DS_STATUS = ''0'' ';
    1 : vWhere := ' and a.DS_STATUS = ''1'' ';
    2 : vWhere := '';
  end;
  vJoin  := '';
  if UserLevel = 'P' then
  begin
    vJoin := Format(' inner join '
                   +' CUSTOMER as b on b.CD_CUSTOMER =a.CD_CUSTOMER'
                   +'              and b.CD_PARTNER in (select CD_PARTNER '
                   +'                                     from USER_MASTER '
                   +'                                    where ID_USER =''%s'') ',[UserCode]);
  end;

  OpenQuery('select a.ID_USER, '
           +'       a.NM_USER, '
           +'       p.NM_PARTNER, '
           +'       case when a.USER_LEVEL = ''S'' then ''매장'' else ''본사'' end USER_LEVEL '
           +'  from USER_CUSTOMER a left outer join '
           +'       PARTNER    as p on p.CD_PARTNER = a.CD_PARTNER '+vJoin
           +' where (a.ID_USER  = :P0 '
           +'    or a.NM_USER like ConCat(''%'',:P0,''%'')) '
           +Ifthen(ToolBarCompanyCodeEdit.Text <> '', Format('and a.CD_COMPANY = ''%s'' ',[ToolBarCompanyCodeEdit.Text]),'')
           +vWhere
           +Ifthen(UserLevel='P', 'union all '
           +'select a.ID_USER, '
           +'       a.NM_USER, '
           +'       p.NM_PARTNER, '
           +'       ''본사'' '
           +'  from USER_CUSTOMER a left outer join '
           +'       PARTNER    as p on p.CD_PARTNER = a.CD_PARTNER '
           +' where Ifnull(a.CD_CUSTOMER,'''') = '''' '
           +Ifthen(ToolBarCompanyCodeEdit.Text <> '', Format('and a.CD_COMPANY = ''%s'' ',[ToolBarCompanyCodeEdit.Text]),'')
           +'   and (a.ID_USER =:P0 '
           +'    or a.NM_USER like ConCat(''%'',:P0,''%'')) '
           +Format('and a.CD_PARTNER in (select CD_PARTNER '
                  +'                     from USER_MASTER '
                  +'                    where ID_USER =''%s'') ',[UserCode]),'')
           +' order by 1 ',
           [ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStoreUserForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = UserLevelComboBox then
  begin
    if GetStrPointerData(UserLevelComboBox) = 'M' then
    begin
      CompanyCodeEdit.Enabled     := false;
      AuthGroupLabel.Caption      := '권한그룹';
      TrdCodeEdit.Visible         := false;
      TrdNameEdit.Visible         := false;
      AuthComboBox.Enabled        := false;
      StoreChooseCheckBox.Enabled := false;
      AppUseCheckBox.Enabled      := false;
      CustomerGroupBox.Visible    := false;
      StoreCodeEdit.TextHint      := '';
    end
    else if GetStrPointerData(UserLevelComboBox) = 'R' then
    begin
      CompanyCodeEdit.Enabled     := false;
      AuthGroupLabel.Caption      := '거래처';
      TrdCodeEdit.Visible         := true;
      TrdNameEdit.Visible         := true;
      AuthComboBox.Enabled        := false;
      StoreChooseCheckBox.Enabled := false;
      AppUseCheckBox.Enabled      := false;
      CustomerGroupBox.Visible    := false;
      StoreCodeEdit.TextHint      := '';
    end
    else if GetStrPointerData(UserLevelComboBox) = 'S' then
    begin
      AuthGroupLabel.Caption      := '권한그룹';
      TrdCodeEdit.Visible         := false;
      TrdNameEdit.Visible         := false;
      AuthComboBox.Enabled        := false;
      AuthComboBox.ItemIndex      := 0;
      StoreChooseCheckBox.Enabled := true;
      AppUseCheckBox.Enabled      := true;
      CustomerGroupBox.Visible    := StoreChooseCheckBox.Checked;
    end
    else
    begin
      AuthGroupLabel.Caption      := '권한그룹';
      TrdCodeEdit.Visible         := false;
      TrdNameEdit.Visible         := false;
      AuthComboBox.Enabled        := true;
      StoreChooseCheckBox.Enabled := true;
      AppUseCheckBox.Enabled      := true;
      CustomerGroupBox.Visible    := false;
    end;
  end
  else if Sender = CompanyCodeEdit then
  begin
    if CompanyCodeEdit.Text <> CompanyCodeEdit.TextHint then
    begin
      CompanyNameEdit.Clear;
      StoreCodeEdit.Text := '';
      StoreNameEdit.Clear;
    end;
  end
  else if Sender = StoreCodeEdit then
  begin
    if StoreCodeEdit.Text <> StoreCodeEdit.TextHint then
    begin
      StoreNameEdit.Clear;
      StoreCodeEdit.TextHint := '전매장';
    end;
  end
  else if Sender = StoreChooseCheckBox then
  begin
    CustomerGroupBox.Visible := (GetStrPointerData(UserLevelComboBox) = 'S') and StoreChooseCheckBox.Checked;
  end;

end;

end.
