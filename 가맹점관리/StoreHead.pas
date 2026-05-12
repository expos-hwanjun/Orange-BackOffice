unit StoreHead;

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
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, cxCheckBox,
  cxGroupBox, cxMemo, cxButtonEdit, Vcl.StdCtrls, Math, StrUtils, cxCurrencyEdit,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TStoreHeadForm = class(TInheritGridEditForm)
    GridTableViewHeadCode: TcxGridColumn;
    GridTableViewHeadName: TcxGridColumn;
    GridTableViewPartner: TcxGridColumn;
    GoodsCodeLabel: TLabel;
    CompanyCodeEdit: TcxTextEdit;
    GoodsNameLabel: TLabel;
    CompanyNameEdit: TcxTextEdit;
    MenuClassLabel: TLabel;
    PartnerCodeEdit: TcxButtonEdit;
    PartnerNameEdit: TcxTextEdit;
    CEONameLabel: TLabel;
    IDNoLabel: TLabel;
    TelNoLabel: TLabel;
    CEONameEdit: TcxTextEdit;
    BizNoEdit: TcxMaskEdit;
    TelNoEdit: TcxTextEdit;
    AddrLabel: TLabel;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    UseYNLabel: TLabel;
    RemarkLabel: TLabel;
    UseYNComboBox: TcxComboBox;
    RemarkMemo: TcxMemo;
    UseGroupBox: TcxGroupBox;
    Option1CheckBox: TcxCheckBox;
    Option2CheckBox: TcxCheckBox;
    Option3CheckBox: TcxCheckBox;
    Option5CheckBox: TcxCheckBox;
    Option4CheckBox: TcxCheckBox;
    Label1: TLabel;
    SolutionComboBox: TcxComboBox;
    Label23: TLabel;
    SubPartnerComboBox: TcxComboBox;
    DBGroupBox: TcxGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    UserEdit: TcxTextEdit;
    UserPassEdit: TcxTextEdit;
    DBNameEdit: TcxTextEdit;
    DBIPEdit: TcxTextEdit;
    DBPortEdit: TcxCurrencyEdit;
    SyncPosPortEdit: TcxCurrencyEdit;
    Label3: TLabel;
    RestPortEdit: TcxCurrencyEdit;
    RestAPIEdit: TcxTextEdit;
    Option6CheckBox: TcxCheckBox;
    Option7CheckBox: TcxCheckBox;
    Option8CheckBox: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PartnerCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPropertiesChange(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    procedure SetSolutionComboBox(aShow:Boolean=false);
    procedure SetSubPartnerComboBox(aPartnerCode:String);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StoreHeadForm: TStoreHeadForm;

implementation
uses Common, DBModule, UnitZipPopup, Help;

{$R *.dfm}

{ TStoreHeadForm }
procedure TStoreHeadForm.FormCreate(Sender: TObject);
begin
  inherited;
  if UserLevel='P' then
  begin
    ButtonToolBarNewButton.Visible    := false;
    ButtonToolBarDeleteButton.Visible := false;
    ButtonToolBarSaveButton.Visible   := false;
    ButtonToolBar.Refresh;
    DBGroupBox.Visible                := false;
  end;
end;

procedure TStoreHeadForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if UserLevel='P' then
    MainPanel.Enabled := false;
end;

procedure TStoreHeadForm.PartnerCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '협력사조회';
      GridTableViewCode.Caption  := '협력사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '협력사 이름';
      GridTableViewName1.Width   := 320;
      JsonHelpURL  := RestBaseURL;

      SQLText    := 'select CD_PARTNER, '
                   +'       NM_PARTNER '
                   +'  from PARTNER '
                   +' where NM_PARTNER  like ConCat(''%'',:P2,''%'') '
                   +'   and YN_USE = ''Y'' '
                   +'order by CD_PARTNER';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        PartnerCodeEdit.Text    := Code;
        PartnerNameEdit.Text    := Names[0];
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

procedure TStoreHeadForm.SetSubPartnerComboBox(aPartnerCode: String);
var
  vCode : PStrPointer;
begin
  try
    SubPartnerComboBox.Properties.Items.Clear;
    Query.Close;
    OpenQuery('select CD_PARTNER_SUB, '
             +'       NM_PARTNER '
             +'  from PARTNER_SUB '
             +' where CD_PARTNER = :P0 '
             +'   and YN_USE     = ''Y'' '
             +' order by CD_PARTNER_SUB ',
             [aPartnerCode],false,RestBaseURL);
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      SubPartnerComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TStoreHeadForm.SetSolutionComboBox(aShow:Boolean=false);
var
  vCode : PStrPointer;
begin
  inherited;
  SolutionComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'OF';;
  SolutionComboBox.Properties.Items.AddObject('오렌지(체인)', TObject(vCode));
  New(vCode);
  vCode^.Data := 'OS';;
  SolutionComboBox.Properties.Items.AddObject('오렌지(단독)', TObject(vCode));
  if aShow or (UserLevel='E') then
  begin
    New(vCode);
    vCode^.Data := 'EF';;
    SolutionComboBox.Properties.Items.AddObject('ERP', TObject(vCode));
    New(vCode);
    vCode^.Data := 'SS';;
    SolutionComboBox.Properties.Items.AddObject('스포츠센터', TObject(vCode));
  end;
  New(vCode);
  vCode^.Data := 'MS';;
  SolutionComboBox.Properties.Items.AddObject('마트', TObject(vCode));
end;

procedure TStoreHeadForm.ZipCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  vZipNo, vRoadAddr, vJibunAddr: string;
begin
  inherited;
  if TFrmZipPopup.Execute(vZipNo, vRoadAddr, vJibunAddr) then
  begin
    ZipCodeEdit.Text := vZipNo;
    Addr1Edit.Text := vRoadAddr;
    Addr2Edit.Text := '';
    Addr2Edit.SetFocus;
  end;
end;

function TStoreHeadForm.DoNew: Boolean;
begin
  Result := true;
  OpenQuery('select LPad(Ifnull(Max(CD_COMPANY),0)+1,8, ''0'') '
           +'  from COMPANY',
           [],false,RestBaseURL);
  CompanyCodeEdit.Text := Query.Fields[0].AsString;
  Query.Close;
  CompanyNameEdit.SetFocus;
  SetSolutionComboBox;
  SolutionComboBox.Properties.ReadOnly := false;
end;

function TStoreHeadForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := ' and a.YN_USE = ''Y'' ';
    1 : vWhere := ' and a.YN_USE = ''N'' ';
    2 : vWhere := '';
  end;

  if UserLevel = 'P' then
    vWhere := vWhere +Format(' and a.CD_PARTNER = (select CD_PARTNER '
                            +'                       from USER_MASTER '
                            +'                      where ID_USER =''%s'') ',[UserCode]);

  OpenQuery('select a.CD_COMPANY, '
           +'       a.NM_COMPANY, '
           +'       a.YN_USE, '
           +'       b.NM_PARTNER '
           +'  from COMPANY a left outer join '
           +'       PARTNER b on b.CD_PARTNER = a.CD_PARTNER '
           +' where (a.CD_COMPANY  = :P0 '
           +'    or a.NM_COMPANY like ConCat(''%'',:P0,''%'')) '
           +vWhere
           +' order by a.CD_COMPANY ',
           [ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStoreHeadForm.EditPropertiesChange(Sender: TObject);
var vTemp :String;
begin
  inherited;
  if isLoading then Exit;

  if Sender = PartnerCodeEdit then
  begin
    if PartnerCodeEdit.Text <> PartnerCodeEdit.TextHint then
    begin
      PartnerNameEdit.Clear;
      SubPartnerComboBox.Properties.Items.Clear;
    end
    else if Length(PartnerCodeEdit.Text) = 4 then
      SetSubPartnerComboBox(PartnerCodeEdit.Text);
  end
  else if Sender = SolutionComboBox then
    UseGroupBox.Visible := Copy(GetStrPointerData(SolutionComboBox),1,1) = 'O';
end;

procedure TStoreHeadForm.DoGridLink;
var vSubPartner :String;
begin
  inherited;
  try
    SetSolutionComboBox(true);
    OpenQuery('select * '
             +'  from COMPANY '
             +' where CD_COMPANY = :P0 ',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewHeadCode.Index]],false,RestBaseURL);

    if not Query.Eof then
    begin
      CompanyCodeEdit.Text := Query.FieldByName('CD_COMPANY').AsString;
      CompanyNameEdit.Text := Query.FieldByName('NM_COMPANY').AsString;
      SolutionComboBox.ItemIndex := GetStrPointerIndex(SolutionComboBox, Query.FieldByName('DS_COMPANY').AsString);
      BizNoEdit.Text       := Query.FieldByName('BIZ_NO').AsString;
      CEONameEdit.Text     := Query.FieldByName('CEO_NAME').AsString;
      TelNoEdit.Text       := GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString);
      ZipCodeEdit.Text     := Query.FieldByName('NO_POST').AsString;
      Addr1Edit.Text       := Query.FieldByName('ADDR1').AsString;
      Addr2Edit.Text       := Query.FieldByName('ADDR2').AsString;
      Option1CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,1,1) = '1';
      Option2CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,2,1) = '1';
      Option3CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,3,1) = '1';
      Option4CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,4,1) = '1';
      Option5CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,5,1) = '1';
      Option6CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,6,1) = '1';
      Option7CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,7,1) = '1';
      Option8CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,8,1) = '1';

      Option1CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,1,1);
      Option2CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,2,1);
      Option3CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,3,1);
      Option4CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,4,1);
      Option5CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,5,1);
      Option6CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,6,1);
      Option7CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,7,1);
      Option8CheckBox.Hint := Copy(Query.FieldByName('OPTIONS').AsString,8,1);

      RemarkMemo.Text         := Query.FieldByName('REMARK').AsString;
      UseYNComboBox.ItemIndex := Ifthen(Query.FieldByName('YN_USE').AsString='Y',0,1);
      PartnerCodeEdit.Text    := Query.FieldByName('CD_PARTNER').AsString;
      PartnerCodeEdit.TextHint := Query.FieldByName('CD_PARTNER').AsString;
      PartnerNameEdit.Text     := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPartner.Index];
      vSubPartner              := Query.FieldByName('CD_PARTNER_SUB').AsString;
      DBNameEdit.Text         := Query.FieldByName('DB_NAME').AsString;
      DBIPEdit.Text           := Query.FieldByName('DB_IP').AsString;
      DBPortEdit.Value        := Query.FieldByName('DB_PORT').AsInteger;;
      UserEdit.Text           := Query.FieldByName('DB_USER_ID').AsString;
      UserPassEdit.Text       := Query.FieldByName('DB_USER_PWD').AsString;
      SyncPosPortEdit.Value   := Query.FieldByName('SYNCPOS_PORT').AsInteger;
      RestPortEdit.Value      := Query.FieldByName('REST_PORT').AsInteger;
      RestAPIEdit.Text        := Query.FieldByName('REST_API').AsString;
      SolutionComboBox.Properties.ReadOnly := true;
    end;
  finally
    Query.Close;
  end;
  SetSubPartnerComboBox(PartnerCodeEdit.Text);
  SubPartnerComboBox.ItemIndex := GetStrPointerIndex(SubPartnerComboBox, vSubPartner);

  if (UserLevel='P') or (GetStrPointerData(SolutionComboBox) = 'OF') or (GetStrPointerData(SolutionComboBox) = 'OS') then
    DBGroupBox.Visible := false
  else
    DBGroupBox.Visible := true;
end;

function TStoreHeadForm.DoSave: Boolean;
var vURL,
    vOption,
    vServer :String;
    vDBSeq  :Integer;
begin
  Result := false;

  if CompanyNameEdit.Text='' then
  begin
    MsgBox('본사이름을 입력해야합니다');
    Exit;
  end;

  vOption := ifthen(Option1CheckBox.Checked,'1','0')
            +ifthen(Option2CheckBox.Checked,'1','0')
            +ifthen(Option3CheckBox.Checked,'1','0')
            +ifthen(Option4CheckBox.Checked,'1','0')
            +ifthen(Option5CheckBox.Checked,'1','0')
            +ifthen(Option6CheckBox.Checked,'1','0')
            +ifthen(Option7CheckBox.Checked,'1','0')
            +ifthen(Option8CheckBox.Checked,'1','0');

  vOption := Rpad(vOption,30,'0');

  if isNew then
  begin
    if PartnerCodeEdit.Text = '' then
    begin
      MsgBox('협력사를 지정하세요');
      Exit;
    end;
    OpenQuery('select ID_SERVER, '
             +'       DB_SEQ '
             +'  from PARTNER '
             +' where CD_PARTNER =:P0 ',
             [PartnerCodeEdit.Text], false, RestBaseURL);
    vServer := Query.Fields[0].AsString;
    vDBSeq  := Query.Fields[1].AsInteger;
    if vServer = '' then
    begin
      vServer := '1001';
      vDBSeq  := 1;
    end;

    Query.Close;

    OpenQuery('select LPad(Ifnull(Max(CD_COMPANY),0)+1,8, ''0'') '
             +'  from COMPANY',
             [],false,RestBaseURL);
    CompanyCodeEdit.Text := Query.Fields[0].AsString;
    Query.Close;
  end;

  Result := ExecQuery(Ifthen(isNew,'insert into COMPANY(CD_COMPANY, '
                                 +'                    NM_COMPANY, '
                                 +'                    DS_COMPANY, '
                                 +'                    CD_PARTNER, '
                                 +'                    BIZ_NO, '
                                 +'                    CEO_NAME, '
                                 +'                    NO_POST, '
                                 +'                    ADDR1, '
                                 +'                    ADDR2, '
                                 +'                    TEL_OFFICE, '
                                 +'                    OPTIONS, '
                                 +'                    REMARK, '
                                 +'                    YN_USE, '
                                 +'                    CD_PARTNER_SUB, '
                                 +'                    DB_NAME, '
                                 +'                    DB_IP, '
                                 +'                    DB_PORT, '
                                 +'                    DB_USER_ID, '
                                 +'                    DB_USER_PWD, '
                                 +'                    SYNCPOS_PORT, '
                                 +'                    REST_PORT, '
                                 +'                    REST_API, '
                                 +'                    ID_SERVER, '
                                 +'                    DB_SEQ) '
                                 +'             values(:P0, '
                                 +'                    :P1, '
                                 +'                    :P2, '
                                 +'                    :P3, '
                                 +'                    :P4, '
                                 +'                    :P5, '
                                 +'                    :P6, '
                                 +'                    :P7, '
                                 +'                    :P8, '
                                 +'                    :P9, '
                                 +'                    :P10, '
                                 +'                    :P11, '
                                 +'                    :P12, '
                                 +'                    :P13, '
                                 +'                    :P14, '
                                 +'                    :P15, '
                                 +'                    :P16, '
                                 +'                    :P17, '
                                 +'                    :P18, '
                                 +'                    :P19, '
                                 +'                    :P20, '
                                 +'                    :P21, '
                                 +'                    :P22, '
                                 +'                    :P23);',
                                  'update COMPANY '
                                 +'   set NM_COMPANY =:P1, '
                                 +'       DS_COMPANY =:P2, '
                                 +'       CD_PARTNER =:P3, '
                                 +'       BIZ_NO     =:P4, '
                                 +'       CEO_NAME   =:P5, '
                                 +'       NO_POST    =:P6, '
                                 +'       ADDR1      =:P7, '
                                 +'       ADDR2      =:P8, '
                                 +'       TEL_OFFICE =:P9, '
                                 +'       OPTIONS    =:P10, '
                                 +'       REMARK     =:P11, '
                                 +'       YN_USE     =:P12, '
                                 +'       CD_PARTNER_SUB =:P13, '
                                 +'       DB_NAME    =:P14, '
                                 +'       DB_IP      =:P15, '
                                 +'       DB_PORT    =:P16, '
                                 +'       DB_USER_ID   =:P17, '
                                 +'       DB_USER_PWD  =:P18, '
                                 +'       SYNCPOS_PORT =:P19, '
                                 +'       REST_PORT    =:P20, '
                                 +'       REST_API     =:P21 '
                                 +' where CD_COMPANY =:P0;'),
                                 [CompanyCodeEdit.Text,
                                  CompanyNameEdit.Text,
                                  GetStrPointerData(SolutionComboBox),
                                  PartnerCodeEdit.Text,
                                  BizNoEdit.Text,
                                  CEONameEdit.Text,
                                  ZipCodeEdit.Text,
                                  Addr1Edit.Text,
                                  Addr2Edit.Text,
                                  GetOnlyNumber(TelNoEdit.Text),
                                  vOption,
                                  RemarkMemo.Text,
                                  Ifthen(UseYNComboBox.ItemIndex=0,'Y','N'),
                                  GetStrPointerData(SubPartnerComboBox),
                                  DBNameEdit.Text,
                                  DBIPEdit.Text,
                                  DBPortEdit.EditValue,
                                  UserEdit.Text,
                                  UserPassEdit.Text,
                                  SyncPosPortEdit.EditValue,
                                  RestPortEdit.EditValue,
                                  RestAPIEdit.Text,
                                  vServer,
                                  vDBSeq],true,RestBaseURL);

  //본사추가일때는 매장에도 추가해준다
  if not Result then Exit;

  if (GetStrPointerData(SolutionComboBox) = 'OF') or (GetStrPointerData(SolutionComboBox) = 'OS')  then
  begin
    vURL := GetRestDBURL(CompanyCodeEdit.Text);
    if isNew then
    begin
      DM.ExecProcedure(Format('CALL STORE_COPY(''%s'', ''%s'', ''%s'', ?) ',
                             [CompanyCodeEdit.Text,
                              StandardStore,
                              vOption]),vURL);

      ExecQuery('update MS_STORE '
               +'   set NM_STORE   = :P2, '
               +'       OPTIONS    = StringPosReplace(OPTIONS,7,:P3), '
               +'       COUPON_LEN = 16 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1;',
               [CompanyCodeEdit.Text,
                StandardStore,
                CompanyNameEdit.Text,
                Ifthen(Option6CheckBox.Checked,'1','0')],true,vURL);
    end
    else if Result then
    begin
      ExecQuery('update MS_STORE '
               +'   set HEAD_OPTIONS  = :P1, '
               +'       OPTIONS       = StringPosReplace(OPTIONS,7,:P3), '
               +'       NM_HEADSTORE  = :P2, '
               +'       DT_CHANGE     = Now() '
               +' where CD_HEAD  =:P0;',
               [CompanyCodeEdit.Text,
                vOption,
                CompanyNameEdit.Text,
                Ifthen(Option6CheckBox.Checked,'1','0')],true,vURL);

      //체인이 표준을 사용하다 사용을 안할때 전매장에 표준사용을 해제한다
//      if (GetStrPointerData(SolutionComboBox) = 'OF') and ((Option2CheckBox.Hint = '1') and not Option2CheckBox.Checked)  then

    end;
  end;


  if Result then
    if isNew then
    begin
      SetLength(NewData, 3);
      NewData[0] := PartnerNameEdit.Text;
      NewData[1] := CompanyCodeEdit.Text;
      NewData[2] := CompanyNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewHeadName.Index] := CompanyNameEdit.Text;
end;

function TStoreHeadForm.DoDelete: Boolean;
var vURL :String;
begin
  OpenQuery('select Count(*) '
           +'  from CUSTOMER '
           +' where CD_COMPANY = :P0 ',
           [CompanyCodeEdit.Text],false,RestBaseURL);

  if Query.Fields[0].AsInteger > 0 then
  begin
    Query.Close;
    MsgBox('본사에 등록된 매장이 있으면 삭제할 수 없습니다'#13'매장을 먼저 삭제 해야합니다');
    Exit;
  end;
  Query.Close;

  vURL := GetRestDBURL(CompanyCodeEdit.Text);
  DM.ExecProcedure(Format('CALL DELETE_DATA(''%s'', ''%s'', ''%s'', ?) ',
                         [CompanyCodeEdit.Text,
                          StandardStore,
                          'A']),vURL);

  Result := ExecQuery('delete from COMPANY '
                     +' where CD_COMPANY = :P0;',
                     [CompanyCodeEdit.Text,
                      StandardStore],true,RestBaseURL);

end;

end.
