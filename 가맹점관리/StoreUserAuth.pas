unit StoreUserAuth;

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
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, Math, StrUtils,
  cxButtonEdit, Vcl.StdCtrls, cxCurrencyEdit, cxCheckBox, AdvGroupBox;

type
  TStoreUserAuthForm = class(TInheritGridEditForm)
    GridTableViewAuthCode: TcxGridColumn;
    GridTableViewAuthName: TcxGridColumn;
    ToolBarCompanyCodeEdit: TcxButtonEdit;
    ToolBarCompanyNameLabel: TcxLabel;
    AppIDLabel: TLabel;
    GoodsNameLabel: TLabel;
    AuthCodeEdit: TcxTextEdit;
    AuthNameEdit: TcxTextEdit;
    MemberGroupBox: TAdvGroupBox;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1CustomerCode: TcxGridColumn;
    GridTableView1CustomerName: TcxGridColumn;
    GridTableView1Check: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    procedure ToolBarCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableView1CheckPropertiesChange(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StoreUserAuthForm: TStoreUserAuthForm;

implementation
uses Common, DBModule, Help;

{$R *.dfm}
procedure TStoreUserAuthForm.GridTableView1CheckPropertiesChange(
  Sender: TObject);
begin
  inherited;
  isChanged := true;
end;

function TStoreUserAuthForm.DoDelete: Boolean;
begin
  Result := ExecQuery('delete from USER_AUTH  '
                     +' where CD_COMPANY  = :P0 '
                     +'   and CD_AUTH     = :P1;',
                     [ToolBarCompanyCodeEdit.Text,
                      AuthCodeEdit.Text],true,RestBaseURL);
end;

procedure TStoreUserAuthForm.DoGridLink;
var vIndex :Integer;
begin
  inherited;
  try
    GridTableView1.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
      GridTableView1.DataController.Values[vIndex, GridTableView1Check.Index] := false;
    GridTableView1.DataController.EndUpdate;

    AuthCodeEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewAuthCode.Index];
    AuthNameEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewAuthName.Index];

    OpenQuery('select CD_CUSTOMER '
             +'  from USER_AUTH  '
             +' where CD_COMPANY = :P0 '
             +'   and CD_AUTH    = :P1 ',
             [ToolBarCompanyCodeEdit.Text,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewAuthCode.Index]],false,RestBaseURL);
    while not Query.Eof do
    begin
      vIndex := GridTableView1.DataController.FilteredIndexByRecordIndex[GridTableView1.DataController.FindRecordIndexByText(0, GridTableView1CustomerCode.Index, Query.Fields[0].AsString, false, false, true)];
      if vIndex >= 0 then
        GridTableView1.DataController.Values[vIndex, GridTableView1Check.Index] := true;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
end;

function TStoreUserAuthForm.DoNew: Boolean;
var vIndex :Integer;
begin
  GridTableView1.DataController.BeginUpdate;
  for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
  begin
    GridTableView1.DataController.Values[vIndex, GridTableView1Check.Index] := false;
  end;
  GridTableView1.DataController.EndUpdate;

  try
    OpenQuery('select LPad(Ifnull(Max(CD_AUTH),0)+1,3, ''0'') '
             +'  from USER_AUTH'
             +' where CD_COMPANY = :P0 ',
             [ToolBarCompanyCodeEdit.Text],false,RestBaseURL);
    AuthCodeEdit.Text := Query.Fields[0].AsString;
  finally
    Query.Close;
  end;
  Result := true;
end;

function TStoreUserAuthForm.DoSave: Boolean;
var vIndex :Integer;
    vSQL   :String;
    vURL   :String;
begin
  vSQL := '';
  for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
  begin
    if not GridTableView1.DataController.Values[vIndex, GridTableView1Check.Index] then Continue;
    vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s''),',
                         [ToolBarCompanyCodeEdit.Text,
                          AuthCodeEdit.Text,
                          AuthNameEdit.Text,
                          GridTableView1.DataController.Values[vIndex, GridTableView1CustomerCode.Index]]);
  end;

  ExecQuery('delete from USER_AUTH  '
           +' where CD_COMPANY  = :P0 '
           +'   and CD_AUTH     = :P1;',
           [ToolBarCompanyCodeEdit.Text,
            AuthCodeEdit.Text],false,RestBaseURL);

  if vSQL <> '' then
    Result := ExecQuery('insert into USER_AUTH(CD_COMPANY, '
                       +'                      CD_AUTH, '
                       +'                      NM_AUTH, '
                       +'                      CD_CUSTOMER) '
                       +'             Values'+LeftStr(vSQL, Length(vSQL)-1)+';',
                       [],true,RestBaseURL)
  else
    Result := ExecQuery('',[],true,RestBaseURL);

  vURL := GetRestDBURL(ToolBarCompanyCodeEdit.Text);
  ExecQuery('delete from USER_AUTH  '
           +' where CD_COMPANY  = :P0 '
           +'   and CD_AUTH     = :P1;',
           [ToolBarCompanyCodeEdit.Text,
            AuthCodeEdit.Text],false,vURL);

  if vSQL <> '' then
    ExecQuery('insert into USER_AUTH(CD_COMPANY, '
             +'                      CD_AUTH, '
             +'                      NM_AUTH, '
             +'                      CD_CUSTOMER) '
             +'             Values'+LeftStr(vSQL, Length(vSQL)-1)+';',
             [],true,vURL)
  else
    ExecQuery('',[],true,vURL);

  OpenQuery('select a.ID_USER, '
           +'       a.NM_USER, '
           +'       a.PW_USER, '
           +'       b.CD_CUSTOMER, '
           +'       a.CD_CUSTOMER as CD_CUSTOMER_ORG '
           +'  from USER_CUSTOMER as a inner join '
           +'       USER_AUTH     as b on b.CD_COMPANY = a.CD_COMPANY and b.CD_AUTH = a.CD_AUTH'
           +' where a.CD_COMPANY =:P0 '
           +'   and a.CD_AUTH    =:P1 '
           +'   and a.USER_LEVEL = ''C'' ',
           [ToolBarCompanyCodeEdit.Text,
            AuthCodeEdit.Text],false, RestBaseURL);
  while not Query.Eof do
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
             [ToolBarCompanyCodeEdit.Text,
              Query.FieldByName('CD_CUSTOMER').AsString,
              Query.FieldByName('ID_USER').AsString,
              Query.FieldByName('NM_USER').AsString,
              Encrypt(Query.FieldByName('PW_USER').AsString, _CryptKey),
              Ifthen(Query.FieldByName('CD_CUSTOMER_ORG').AsString=Query.FieldByName('CD_CUSTOMER').AsString,'N','Y')], false, vURL);
    Query.Next;
  end;
  Query.Close;

  if TempSQL = '' then
    Result := true
  else
    Result := ExecQuery('',[],true, vURL);

  if Result then
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := Trim(AuthCodeEdit.Text);
      NewData[1] := AuthNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewAuthName.Index] := AuthNameEdit.Text;

end;

function TStoreUserAuthForm.DoSearch: Boolean;
begin
  if ToolBarCompanyCodeEdit.Text = '' then
  begin
    MsgBox('본사를 선택해야합니다');
    Exit;
  end;

  OpenQuery('select CD_AUTH, '
           +'       Max(NM_AUTH) as NM_AUTH '
           +'  from USER_AUTH  '
           +' where CD_COMPANY  = :P0 '
           +' group by CD_AUTH ',
           [ToolBarCompanyCodeEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);

  OpenQuery('select 0 as CHK, '
           +'       CD_CUSTOMER, '
           +'       NM_CUSTOMER '
           +'  from CUSTOMER '
           +' where CD_COMPANY  = :P0 '
           +'   and DS_CUSTOMER = ''O'' '
           +'   and Length(CD_COMPANY) = 8 '
           +Ifthen(UserLevel='P', Format('and CD_PARTNER = ''%s'' ',[PartnerCode]),'')
           +' order by CD_CUSTOMER ',
           [ToolBarCompanyCodeEdit.Text],false,RestBaseURL);
  DM.ReadQuery(Query, GridTableView1);
  if GridTableView1.DataController.RecordCount = 0 then
  begin
    GridTableView1.DataController.AppendRecord;
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1Check.Index]        := false;
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1CustomerCode.Index] := StandardStore;
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1CustomerName.Index] := '표준';
  end;
end;

procedure TStoreUserAuthForm.ToolBarCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '본사 조회';
      GridTableViewCode.Caption  := '본사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '본사 이름';
      GridTableViewName1.Width   := 320;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_COMPANY, '
                   +'       NM_COMPANY '
                   +'  from COMPANY '
                   +' where NM_COMPANY  like ConCat(''%'',:P2,''%'') '
                   +'   and DS_COMPANY = ''OF'' '
                   +'   and YN_USE = ''Y'' '
                   +Ifthen(UserLevel='P', Format('and CD_PARTNER = ''%s'' ',[PartnerCode]),'')
                   +' order by CD_COMPANY';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        ToolBarCompanyCodeEdit.Text     := Code;
        ToolBarCompanyCodeEdit.TextHint := Code;
        ToolBarCompanyNameLabel.Caption := Names[0];
      end;
    finally
      Free;
    end;
end;

end.
