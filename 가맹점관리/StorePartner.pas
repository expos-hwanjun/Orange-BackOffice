unit StorePartner;

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
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, cxSpinEdit,
  cxGroupBox, cxMemo, cxButtonEdit, Vcl.StdCtrls, Math, StrUtils, cxCheckBox,
  AdvGlassButton, AdvOfficePager, cxCurrencyEdit, AdvPanel, dxBarBuiltInMenu,
  cxPC, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers;

type
  TStorePartnerForm = class(TInheritGridEditForm)
    GridTableViewPartnerCode: TcxGridColumn;
    GridTableViewPartnerName: TcxGridColumn;
    OrderPosAddPanel: TAdvPanel;
    Label18: TLabel;
    OrderPosCountEdit: TcxSpinEdit;
    Label19: TLabel;
    OrderPosAddMemo: TcxMemo;
    OKButton: TAdvGlowButton;
    CloseButton: TAdvGlowButton;
    AdvOfficePager1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    GoodsCodeLabel: TLabel;
    GoodsNameLabel: TLabel;
    CEONameLabel: TLabel;
    IDNoLabel: TLabel;
    TelNoLabel: TLabel;
    AddrLabel: TLabel;
    UseYNLabel: TLabel;
    RemarkLabel: TLabel;
    Label1: TLabel;
    EnterDateLabel: TLabel;
    RetireDateLabel: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    AppIDLabel: TLabel;
    AppPWDLabel: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    PartnerCodeEdit: TcxTextEdit;
    PartnerNameEdit: TcxTextEdit;
    CEONameEdit: TcxTextEdit;
    BizNoEdit: TcxMaskEdit;
    OfficeTelEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    UseYNComboBox: TcxComboBox;
    RemarkMemo: TcxMemo;
    PrefixEdit: TcxTextEdit;
    PosGroupBox: TcxGroupBox;
    DisplaySeqLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PosCountEdit: TcxSpinEdit;
    UseCountEdit: TcxSpinEdit;
    PossibleEdit: TcxSpinEdit;
    OrderPosAddButton: TAdvGlassButton;
    EnterDateEdit: TcxDateEdit;
    RetireDateEdit: TcxDateEdit;
    DamdangNameEdit: TcxTextEdit;
    DamdangMobileEdit: TcxTextEdit;
    CeoMobileTelEdit: TcxTextEdit;
    Option1CheckBox: TcxCheckBox;
    FaxTelEdit: TcxTextEdit;
    EmailEdit: TcxTextEdit;
    PayDayEdit: TcxSpinEdit;
    UserIDEdit: TcxTextEdit;
    IDDupCheckButton: TAdvGlassButton;
    AppPWDEdit: TcxTextEdit;
    NewStoreComboBox: TcxComboBox;
    AuthTelNoEdit: TcxTextEdit;
    PosNoticeComboBox: TcxComboBox;
    cxTabSheet2: TcxTabSheet;
    Grid1: TcxGrid;
    OrderPosUseTableView: TcxGridTableView;
    OrderPosUseTableViewStoreCode: TcxGridColumn;
    OrderPosUseTableViewStoreName: TcxGridColumn;
    OrderPosUseTableViewPosCount: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    cxTabSheet3: TcxTabSheet;
    cxGrid1: TcxGrid;
    ChangeGridTableView: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    ChangeGridTableViewColumn1: TcxGridColumn;
    cxGridColumn3: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxTabSheet4: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridTableView1: TcxGridTableView;
    cxGridColumn4: TcxGridColumn;
    cxGridColumn5: TcxGridColumn;
    cxGridColumn6: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    cxTabSheet5: TcxTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Option2CheckBox: TcxCheckBox;
    LetsOrderRateEdit: TcxCurrencyEdit;
    LetsOrderEnderDateEdit: TcxDateEdit;
    LetsOrderRetireDateEdit: TcxDateEdit;
    CloudUsePage: TcxTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    CloudUseSizeEdit: TcxCurrencyEdit;
    CloudDBNameEdit: TcxTextEdit;
    CloudSizeEdit: TcxCurrencyEdit;
    cxGroupBox1: TcxGroupBox;
    cxGrid3: TcxGrid;
    CloudDBTableView: TcxGridTableView;
    CloudDBTableViewNo: TcxGridColumn;
    CloudDBTableViewTableName: TcxGridColumn;
    CloudDBTableViewSize: TcxGridColumn;
    cxGridLevel3: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    TotalStoreEdit: TcxCurrencyEdit;
    UseStoreEdit: TcxCurrencyEdit;
    DisUseStoreEdit: TcxCurrencyEdit;
    procedure EditPropertiesChange(Sender: TObject);
    procedure IDDupCheckButtonClick(Sender: TObject);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure CeoMobileTelEditExit(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure OrderPosAddButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure cxTabSheet3Show(Sender: TObject);
    procedure CloudUsePageShow(Sender: TObject);
  private
    procedure SetOrderPosList;
    procedure SetPosCountList;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StorePartnerForm: TStorePartnerForm;

implementation
uses Common, DBModule, UnitZipPopup, Help;

{$R *.dfm}

procedure TStorePartnerForm.IDDupCheckButtonClick(Sender: TObject);
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
      UserIDEdit.EditModified := false;
      MsgBox('사용 가능한 아이디입니다');
      AppPWDEdit.SetFocus;
    end;
  finally
    FinishQuery;
  end;

end;

procedure TStorePartnerForm.OKButtonClick(Sender: TObject);
var visChanged :Boolean;
begin
  inherited;
  visChanged := isChanged;
  if OrderPosCountEdit.Value = 0 then
  begin
    MsgBox('추가할 포스 수량을 입력하세요');
    Exit;
  end;


  if ExecQuery('insert into PARTNER_POS(CD_PARTNER, '
              +'                        SEQ, '
              +'                        POS_COUNT, '
              +'                        REMARK, '
              +'                        ID_USER) '
              +'                 values(:P0, '
              +'                       (select Ifnull(Max(SEQ),0)+1 '
              +'                          from PARTNER_POS as s '
              +'                         where CD_PARTNER =:P0), '
              +'                        :P1, '
              +'                        :P2, '
              +'                        :P3);'
              +'update PARTNER '
              +'   set POS_COUNT = POS_COUNT + :P1 '
              +' where CD_PARTNER =:P0;',
              [PartnerCodeEdit.Text,
               OrderPosCountEdit.Value,
               OrderPosAddMemo.Text,
               UserCode],true,RestBaseURL) then
  begin
    OpenQuery('select Sum(case when ALLOW_POS > 1 then ALLOW_POS-1 else 0 end) as USE_COUNT '
             +'  from CUSTOMER '
             +' where CD_PARTNER  =:P0 '
             +'   and DS_CUSTOMER = ''O'' '
             +'   and DS_STATUS = ''0'' ', //정상만 카운트한다
             [PartnerCodeEdit.Text],false,RestBaseURL);

    if not Query.Eof then
      UseCountEdit.Value := Query.Fields[0].AsInteger
    else
      UseCountEdit.Value := 0;
    Query.Close;
    PosCountEdit.Value := PosCountEdit.Value + OrderPosCountEdit.Value;
    PossibleEdit.Value := PossibleEdit.Value + OrderPosCountEdit.Value;
    OrderPosAddPanel.Visible := false;
    MainPanel.Enabled        := true;
    Grid.Enabled             := true;
    isChanged                := visChanged;
  end;

end;

procedure TStorePartnerForm.OrderPosAddButtonClick(Sender: TObject);
begin
  inherited;
  OrderPosCountEdit.Value := 0;
  OrderPosAddPanel.Top  := Self.Height div 2 - OrderPosAddPanel.Height div 2;
  OrderPosAddPanel.Left := Self.Width div 2 -OrderPosAddPanel.Width div 2 ;
  OrderPosAddPanel.Visible := true;
  MainPanel.Enabled := false;
  Grid.Enabled      := false;
end;

procedure TStorePartnerForm.SetOrderPosList;
begin
  OpenQuery('select a.CD_CUSTOMER, '
           +'       a.NM_CUSTOMER, '
           +'       a.ALLOW_POS-1 as ALLOW_POS '
           +'  from CUSTOMER a inner join '
           +'       COMPANY  b on b.CD_COMPANY = a.CD_COMPANY inner join '
           +'       PARTNER  c on c.CD_PARTNER = a.CD_PARTNER '
           +' where a.DS_STATUS = ''0'' '
           +'   and a.DS_CUSTOMER = ''O'' '
           +'   and a.CD_PARTNER = :P0 '
           +'   and a.ALLOW_POS > 1 ',
           [PartnerCodeEdit.Text],false,RestBaseURL);
  DM.ReadQuery(Query, OrderPosUseTableView);
end;

procedure TStorePartnerForm.SetPosCountList;
begin
  OpenQuery('select Date_Format(DT_INSERT, ''%Y-%m-%d'') as YMD_INSERT, '
           +'       POS_COUNT, '
           +'       REMARK, '
           +'       ID_USER '
           +'  from PARTNER_POS'
           +' where CD_PARTNER = :P0 '
           +'  order by SEQ',
           [PartnerCodeEdit.Text],false,RestBaseURL);
  DM.ReadQuery(Query, ChangeGridTableView);
end;

procedure TStorePartnerForm.ZipCodeEditPropertiesButtonClick(Sender: TObject;
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

procedure TStorePartnerForm.CeoMobileTelEditExit(Sender: TObject);
begin
  inherited;
  (Sender as TcxTextEdit).Text := GetPhoneNo((Sender as TcxTextEdit).Text);
end;

procedure TStorePartnerForm.CloseButtonClick(Sender: TObject);
begin
  inherited;
  OrderPosAddPanel.Visible := false;
  MainPanel.Enabled        := true;
  Grid.Enabled             := true;
end;

procedure TStorePartnerForm.CloudUsePageShow(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select Round(SUM(data_length + index_length) / 1024 / 1024 / 1024, 2) '
             +'  from information_schema.TABLES '
             +' where table_schema =:P0 ',
             [CloudDBNameEdit.Text],false, CloudDBNameEdit.Hint);
    CloudUseSizeEdit.Value := Query.Fields[0].AsCurrency;
  finally
    Query.Close;
  end;

  try
    OpenQuery('select Sum(case when YN_USE = ''Y'' then 1 else 0 end) as CNT_USE, '
             +'       Sum(case when YN_USE = ''Y'' then 0 else 1 end) as CNT_DISUSE '
             +'  from MS_STORE ',
             [CloudDBNameEdit.Text],false, CloudDBNameEdit.Hint);
    TotalStoreEdit.Value  := Query.Fields[0].AsCurrency + Query.Fields[1].AsCurrency;
    UseStoreEdit.Value    := Query.Fields[0].AsCurrency;
    DisUseStoreEdit.Value := Query.Fields[1].AsCurrency;
  finally
    Query.Close;
  end;

  try
    OpenQuery('select @ROWNUM:=@ROWNUM+1 AS SEQ, '
             +'       table_name, '
             +'       round((data_length+index_length)/(1024*1024*1024),2) as DB_SIZE '
             +'  from information_schema.TABLES, (SELECT @ROWNUM:=0) AS R '
             +' where table_schema =:P0 '
             +'   and table_rows is not null '
             +'   AND ROUND((data_length+index_length)/(1024*1024*1024),2) > 0 '
             +' order by table_name',
             [CloudDBNameEdit.Text],false,CloudDBNameEdit.Hint);
    DM.ReadQuery(Query, CloudDBTableView);
  finally
    Query.Close;
  end;
end;

procedure TStorePartnerForm.cxTabSheet2Show(Sender: TObject);
begin
  inherited;
  SetOrderPosList;
end;

procedure TStorePartnerForm.cxTabSheet3Show(Sender: TObject);
begin
  inherited;
  SetPosCountList;
end;

function TStorePartnerForm.DoDelete: Boolean;
begin
  try
    OpenQuery('select CD_COMPANY '
             +'  from COMPANY '
             +' where CD_PARTNER =:P0 '
             +'union all '
             +'select CD_CUSTOMER '
             +'  from CUSTOMER '
             +' where CD_PARTNER =:P0 '
             +' limit 1 ',
             [PartnerCodeEdit.Text],false,RestBaseURL);
    if not Query.Eof then
    begin
      MsgBox('해당협력사로 등록된 본사 또는 매장이 있습니다');
      Exit;
    end;


    Result := ExecQuery('delete from PARTNER '
                       +' where CD_PARTNER = :P0; '
                       +'delete from USER_MASTER '
                       +' where CD_PARTNER = :P0;',
                       [PartnerCodeEdit.Text],true,RestBaseURL);
  finally
    Query.Close;
  end;

end;

procedure TStorePartnerForm.DoGridLink;
begin
  inherited;
  try
    OpenQuery('select a.CD_PARTNER, '
             +'       a.NM_PARTNER, '
             +'       a.BIZ_NO, '
             +'       a.CEO_NAME, '
             +'       a.TEL_OFFICE, '
             +'       a.TEL_MOBILE, '
             +'       a.TEL_FAX, '
             +'       a.TEL_AUTH, '
             +'       a.NO_POST, '
             +'       a.ADDR1, '
             +'       a.ADDR2, '
             +'       a.EMAIL, '
             +'       a.DISCERN, '
             +'       a.POS_COUNT, '
             +'       a.REMARK, '
             +'       a.NM_DAMDANG, '
             +'       a.TEL_DAMDANG, '
             +'       a.PAY_DAY, '
             +'       a.OPTIONS, '
             +'       a.CONTRACT_BEGIN, '
             +'       a.CONTRACT_END, '
             +'       a.YN_USE, '
             +'       a.YN_NEWSTORE, '
             +'       a.CLOUD_SIZE, '
             +'       b.NM_DATABASE, '
             +'       c.HTTPS_DOMAIN, '
             +'       c.HTTPS_PORT, '
             +'       a.POS_NOTICE '
             +'  from PARTNER a left outer join '
             +'       DATABASE_LIST b on b.ID_SERVER = a.ID_SERVER and b.DB_SEQ = a.DB_SEQ left outer join '
             +'       SERVER_LIST   c on c.ID_SERVER = a.ID_SERVER '
             +' where a.CD_PARTNER = :P0 ',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPartnerCode.Index]],false,RestBaseURL);

    if not Query.Eof then
    begin
      PartnerCodeEdit.Text    := Query.FieldByName('CD_PARTNER').AsString;
      PartnerNameEdit.Text    := Query.FieldByName('NM_PARTNER').AsString;
      BizNoEdit.Text          := Query.FieldByName('BIZ_NO').AsString;
      CEONameEdit.Text        := Query.FieldByName('CEO_NAME').AsString;
      OfficeTelEdit.Text      := GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString);
      CeoMobileTelEdit.Text   := GetPhoneNo(Query.FieldByName('TEL_MOBILE').AsString);
      FaxTelEdit.Text         := GetPhoneNo(Query.FieldByName('TEL_FAX').AsString);
      AuthTElNoEdit.Text      := Query.FieldByName('TEL_AUTH').AsString;
      ZipCodeEdit.Text        := Query.FieldByName('NO_POST').AsString;
      Addr1Edit.Text          := Query.FieldByName('ADDR1').AsString;
      Addr2Edit.Text          := Query.FieldByName('ADDR2').AsString;
      EMailEdit.Text          := Query.FieldByName('EMAIL').AsString;
      PrefixEdit.Text         := Query.FieldByName('DISCERN').AsString;
      PosCountEdit.Value      := Query.FieldByName('POS_COUNT').AsCurrency;
      PosCountEdit.Tag        := Query.FieldByName('POS_COUNT').AsInteger;
      PosCountEdit.EditModified := false;
      RemarkMemo.Text         := Query.FieldByName('REMARK').AsString;
      DamdangNameEdit.Text    := Query.FieldByName('NM_DAMDANG').AsString;
      DamdangMobileEdit.Text  := GetPhoneNo(Query.FieldByName('TEL_DAMDANG').AsString);
      PayDayEdit.Value        := Query.FieldByName('PAY_DAY').AsInteger;
      Option1CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,1,1) = '1';
      Option2CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,2,1) = '1';
      EnterDateEdit.Date      := StoD(Query.FieldByName('CONTRACT_BEGIN').AsString);
      RetireDateEdit.Date     := StoD(Query.FieldByName('CONTRACT_END').AsString);
      UseYNComboBox.ItemIndex := Ifthen(Query.FieldByName('YN_USE').AsString='Y',0,1);
      NewStoreComboBox.ItemIndex := Ifthen(Query.FieldByName('YN_NEWSTORE').AsString='Y',0,1);
      CloudSizeEdit.Value     := Query.FieldByName('CLOUD_SIZE').AsInteger;
      CloudDBNameEdit.Text    := Query.FieldByName('NM_DATABASE').AsString;
      CloudDBNameEdit.Hint    := Format('https://%s:%s/Orange/',[Query.FieldByName('HTTPS_DOMAIN').AsString,
                                                                 Query.FieldByName('HTTPS_PORT').AsString]);
      PosNoticeComboBox.ItemIndex := GetStrPointerIndex(PosNoticeComboBox, Query.FieldByName('POS_NOTICE').AsString);
      RetireDateEdit.Visible  := UseYNComboBox.ItemIndex = 1;
      RetireDateLabel.Visible := RetireDateEdit.Visible;
      if not RetireDateEdit.Visible then
        RetireDateEdit.Date          := 0;
    end;

    Query.Close;
    OpenQuery('select Sum(case when ALLOW_POS > 1 then ALLOW_POS-1 else 0 end) as USE_COUNT '
             +'  from CUSTOMER '
             +' where CD_PARTNER  =:P0 '
             +'   and DS_CUSTOMER = ''O'' '
             +'   and DS_STATUS = ''0'' ', //정상만 카운트한다
             [PartnerCodeEdit.Text],false,RestBaseURL);

    if not Query.Eof then
      UseCountEdit.Value := Query.Fields[0].AsInteger
    else
     UseCountEdit.Value := 0;
    PossibleEdit.Value := PosCountEdit.Value - UseCountEdit.Value;

    Query.Close;
    OpenQuery('select ID_USER, '
             +'       PW_USER, '
             +'       DS_STATUS '
             +'  from USER_MASTER '
             +' where CD_PARTNER  =:P0 ',
             [PartnerCodeEdit.Text],false,RestBaseURL);
    if not Query.Eof then
    begin
      UserIDEdit.Text := Query.FieldByName('ID_USER').AsString;
      AppPWDEdit.Text := Query.FieldByName('PW_USER').AsString;
      AppPWDEdit.EditModified := false;
    end
    else
    begin
      UserIDEdit.Clear;
      AppPWDEdit.Clear;
      AppPWDEdit.EditModified := false;
    end;
  finally
    Query.Close;
  end;

  if UserIDEdit.Text = '' then
  begin
    UserIDEdit.Enabled       := true;
    IDDupCheckButton.Enabled := true;
  end
  else
  begin
    UserIDEdit.Enabled       := false;
    IDDupCheckButton.Enabled := false;
  end;
  AppPWDEdit.Enabled       := true;

  if AdvOfficePager1.ActivePageIndex = 1 then
    SetOrderPosList;
  if AdvOfficePager1.ActivePageIndex = 2 then
    SetPosCountList;
  if not IsDebuggerPresent then
    CloudUsePage.TabVisible := CloudSizeEdit.Value > 0;

  if CloudUsePage.Showing then
    CloudUsePageShow(nil);
end;

function TStorePartnerForm.DoNew: Boolean;
begin
  OpenQuery('select LPad(Ifnull(Max(CD_PARTNER),0)+1,4,''0'') '
           +'  from PARTNER',
           [],false,RestBaseURL);
  PartnerCodeEdit.Text := Query.Fields[0].AsString;
  Query.Close;
  RetireDateEdit.Date := Now();
  PartnerNameEdit.SetFocus;

  UserIDEdit.Enabled       := false;
  IDDupCheckButton.Enabled := false;
  AppPWDEdit.Enabled       := false;
  Result := true;
end;

function TStorePartnerForm.DoSave: Boolean;
var vOption :String;
begin
  Result := false;

  if PartnerNameEdit.Text='' then
  begin
    MsgBox('협력사명을 입력해야합니다');
    Exit;
  end;

  if (PrefixEdit.Text='') or (Length(PrefixEdit.Text) <> 2) then
  begin
    MsgBox('프리픽스를 정확히 입력하세요');
    Exit;
  end;

  if PosCountEdit.EditModified and not isNew then
  begin
    if PosCountEdit.Value < UseCountEdit.Value then
    begin
      MsgBox('현재 사용중인 수량보다 적게 수정할 수 없습니다');
      Exit;
    end;
  end;


  vOption := ifthen(Option1CheckBox.Checked,'1','0')
           + ifthen(Option2CheckBox.Checked,'1','0');


  vOption := Rpad(vOption,10,'0');
  if AppPWDEdit.EditModified then
  begin
    if UserIDEdit.Text = '' then
    begin
      MsgBox('로그인 아이디를 입력하세요');
      UserIDEdit.SetFocus;
      Exit;
    end;

    if UserIDEdit.Enabled and UserIDEdit.EditModified then
    begin
      MsgBox('로그인 아이디 중복체크를 해야합니다');
      UserIDEdit.SetFocus;
      Exit;
    end;

    ExecQuery('insert into USER_MASTER(ID_USER, '
             +'                        PW_USER, '
             +'                        NM_USER, '
             +'                        USER_LEVEL, '
             +'                        CD_PARTNER, '
             +'                        DS_STATUS) '
             +'                values(:P0, '
             +'                       :P1, '
             +'                       :P2, '
             +'                       ''P'', '
             +'                       :P3, '
             +'                      ''0'') '
             +'ON DUPLICATE KEY UPDATE '
             +'             PW_USER =:P1,'
             +'             NM_USER =:P2;',
             [UserIDEdit.Text,
              AppPWDEdit.Text,
              PartnerNameEdit.Text,
              PartnerCodeEdit.Text],false,RestBaseURL);
  end;

  Result := ExecQuery(Ifthen(isNew,'insert into PARTNER(CD_PARTNER, '
                                  +'                    NM_PARTNER, '
                                  +'                    DISCERN, '
                                  +'                    BIZ_NO, '
                                  +'                    CEO_NAME, '
                                  +'                    NO_POST, '
                                  +'                    ADDR1, '
                                  +'                    ADDR2, '
                                  +'                    TEL_OFFICE, '
                                  +'                    TEL_MOBILE, '
                                  +'                    TEL_DAMDANG, '
                                  +'                    TEL_FAX, '
                                  +'                    TEL_AUTH, '
                                  +'                    EMAIL, '
                                  +'                    PAY_DAY, '
                                  +'                    POS_COUNT, '
                                  +'                    NM_DAMDANG, '
                                  +'                    CONTRACT_BEGIN, '
                                  +'                    CONTRACT_END, '
                                  +'                    OPTIONS, '
                                  +'                    REMARK, '
                                  +'                    POS_NOTICE, '
                                  +'                    YN_USE, '
                                  +'                    YN_NEWSTORE, '
                                  +'                    ID_USER, '
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
                                  +'                    :P23, '
                                  +'                    :P24, '
                                  +'                    ''1001'', '
                                  +'                    1);',
                                   'update PARTNER '
                                  +'   set NM_PARTNER     =:P1, '
                                  +'       DISCERN        =:P2, '
                                  +'       BIZ_NO         =:P3, '
                                  +'       CEO_NAME       =:P4, '
                                  +'       NO_POST        =:P5, '
                                  +'       ADDR1          =:P6, '
                                  +'       ADDR2          =:P7, '
                                  +'       TEL_OFFICE     =:P8, '
                                  +'       TEL_MOBILE     =:P9, '
                                  +'       TEL_DAMDANG    =:P10, '
                                  +'       TEL_FAX        =:P11, '
                                  +'       TEL_AUTH       =:P12, '
                                  +'       EMAIL          =:P13, '
                                  +'       PAY_DAY        =:P14, '
                                  +'       POS_COUNT      =:P15, '
                                  +'       NM_DAMDANG     =:P16, '
                                  +'       CONTRACT_BEGIN =:P17, '
                                  +'       CONTRACT_END   =:P18, '
                                  +'       OPTIONS        =:P19, '
                                  +'       REMARK         =:P20, '
                                  +'       POS_NOTICE     =:P21, '
                                  +'       YN_USE         =:P22, '
                                  +'       YN_NEWSTORE    =:P23, '
                                  +'       ID_USER        =:P24 '
                                  +' where CD_PARTNER =:P0;'),
                                  [PartnerCodeEdit.Text,
                                   PartnerNameEdit.Text,
                                   PrefixEdit.Text,
                                   BizNoEdit.Text,
                                   CEONameEdit.Text,
                                   ZipCodeEdit.Text,
                                   Addr1Edit.Text,
                                   Addr2Edit.Text,
                                   GetOnlyNumber(OfficeTelEdit.Text),
                                   GetOnlyNumber(CeoMobileTelEdit.Text),
                                   GetOnlyNumber(DamdangMobileEdit.Text),
                                   GetOnlyNumber(FaxTelEdit.Text),
                                   AuthTelNoEdit.Text,
                                   EmailEdit.Text,
                                   PayDayEdit.EditingValue,
                                   PosCountEdit.EditingValue,
                                   DamdangNameEdit.Text,
                                   DtoS(EnterDateEdit.CurrentDate),
                                   IfThen(RetireDateEdit.CurrentDate = 0, EmptyStr, DtoS(RetireDateEdit.CurrentDate)),
                                   vOption,
                                   RemarkMemo.Text,
                                   GetStrPointerData(PosNoticeComboBox),
                                   Ifthen(UseYNComboBox.ItemIndex=0,'Y','N'),
                                   Ifthen(NewStoreComboBox.ItemIndex=0,'Y','N'),
                                   UserCode],true,RestBaseURL);

  if Result and (PosCountEdit.EditModified or (isNew and PosCountEdit.Value > 0)) then
  begin
    ExecQuery('insert into PARTNER_POS(CD_PARTNER, '
             +'                        SEQ, '
             +'                        POS_COUNT, '
             +'                        ID_USER) '
             +'                 values(:P0, '
             +'                       (select Ifnull(Max(SEQ),0)+1 '
             +'                          from PARTNER_POS as s '
             +'                         where CD_PARTNER =:P0), '
             +'                        :P1, '
             +'                        :P2);',
             [PartnerCodeEdit.Text,
              PosCountEdit.Value,
              UserCode],true,RestBaseURL);
  end;
end;

function TStorePartnerForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := ' and YN_USE = ''Y'' ';
    1 : vWhere := ' and YN_USE = ''N'' ';
    2 : vWhere := '';
  end;
  OpenQuery('select CD_PARTNER, '
           +'       NM_PARTNER, '
           +'       YN_USE '
           +'  from PARTNER  '
           +' where (CD_PARTNER  = :P0 '
           +'    or NM_PARTNER like ConCat(''%'',:P0,''%'')) '
           +vWhere
           +' order by CD_PARTNER ',
           [ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStorePartnerForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = UseYNComboBox then
  begin
    RetireDateEdit.Visible  := UseYNComboBox.ItemIndex = 1;
    RetireDateLabel.Visible := RetireDateEdit.Visible;
    if RetireDateEdit.Visible then
      RetireDateEdit.Date := Date
    else
      RetireDateEdit.Date := 0;
  end;

end;

procedure TStorePartnerForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  AdvOfficePager1.ActivePageIndex := 0;
  PosNoticeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  PosNoticeComboBox.Properties.Items.AddObject('간편메뉴얼', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  PosNoticeComboBox.Properties.Items.AddObject('협력사공지', TObject(vCode));
end;

end.
