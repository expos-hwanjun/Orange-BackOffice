// 데이터베이스 이관 (F)

unit SystemDBTransfer;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  cxContainer, cxEdit, Uni, DB, MemDS, cxTextEdit, cxDropDownEdit,
  cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton, StdCtrls,
  cxCheckBox, cxLookAndFeelPainters, cxGroupBox, StrUtils, cxStyles,
  cxLookAndFeels, DBAccess, cxClasses;

type
  TSystemDBTransferForm = class(TInheritEditForm)
    MSSqlPanel: TPanel;
    MSSqlTRGroupBox: TcxGroupBox;
    MSSqlStoreCheckBox: TcxCheckBox;
    MSSqlGoodsCheckBox: TcxCheckBox;
    MSSqlGoodsClassCheckBox: TcxCheckBox;
    MSSqlCompanyCheckBox: TcxCheckBox;
    MSSqlMemberCheckBox: TcxCheckBox;
    MSSqlUserCheckBox: TcxCheckBox;
    MSSqlDBNameEdit: TcxTextEdit;
    MSSqlDBTestButton: TButton;
    MSSqlDBNameLabel: TLabel;
    MSSqlStoreLabel: TLabel;
    MSSqlGoodsLabel: TLabel;
    MSSqlGoodsClassLabel: TLabel;
    MSSqlCompanyLabel: TLabel;
    MSSqlMemberLabel: TLabel;
    MSSqlUserLabel: TLabel;
    MSSqlWarnningLabel: TLabel;
    MSSqlServerIPLabel: TLabel;
    MSSqlServerIPEdit: TcxTextEdit;
    MSSqlLoginLabel: TLabel;
    MSSqlLoginEdit: TcxTextEdit;
    MSSqlPasswordLabel: TLabel;
    MSSqlPasswordEdit: TcxTextEdit;
    MSSqlCompanyCreditLabel: TLabel;
    MSSqlCompanyCreditCheckBox: TcxCheckBox;
    MSSqlMemberPointLabel: TLabel;
    MSSqlMemberPointCheckBox: TcxCheckBox;
    MSSqlMemberCreditLabel: TLabel;
    MSSqlMemberCreditCheckBox: TcxCheckBox;
    Connection: TUniConnection;

    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure MSSqlDBTestButtonClick(Sender: TObject);

  private
    function MSSqlConnectTest: string;
    function TransferIamPOS: Boolean;
    function TransferSolbiMart: Boolean;
  end;

var
  SystemDBTransferForm: TSystemDBTransferForm;



implementation

uses
  Common, DBModule;

const
  msgSuccess = '완료';
  msgFailed  = '실패';

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSystemDBTransferForm.FormCreate(Sender: TObject);
begin
  inherited;

  // 마스터만 쓸 수 있다
  if UserGrade = userGradeMaster then
  begin
    ConditionToolBarComboBox.Properties.Items.Add('iamPOS');
    ConditionToolBarComboBox.Properties.Items.Add('SolbiMart');
    ConditionToolBarComboBox.ItemIndex := 0;
  end
  else
    ErrBox('프로그램 사용 권한이 없습니다.');

  MSSqlServerIPEdit.Text := GetIniFile('공통', 'DB_IP', ipLocal);
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TSystemDBTransferForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSearchButton.Visible or not ButtonToolBarSearchButton.Enabled then
    Exit;

//  inherited;

  case ConditionToolBarComboBox.ItemIndex of
    0 : // iamPOS
    begin
      MSSqlDBNameEdit.Text               := 'iampos';
      MSSqlPanel.Visible                 := true;
      MSSqlCompanyCreditCheckBox.Checked := false;
      MSSqlCompanyCreditCheckBox.Enabled := false;
      MSSqlMemberPointCheckBox.Checked   := false;
      MSSqlMemberPointCheckBox.Enabled   := false;
      MSSqlMemberCreditCheckBox.Checked  := false;
      MSSqlMemberCreditCheckBox.Enabled  := false;
      MSSqlWarnningLabel.Visible         := true;
      ButtonToolBarSaveButton.Enabled    := true;
    end;
    1 : // SolbiMart
    begin
      MSSqlPasswordEdit.Text             := 'pos';
      MSSqlDBNameEdit.Text               := 'Solbi_Mart2';
      MSSqlPanel.Visible                 := true;
      ButtonToolBarSaveButton.Enabled    := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 이관 버튼
procedure TSystemDBTransferForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

//  inherited;

  try
    Screen.Cursor := crHourGlass;
    case ConditionToolBarComboBox.ItemIndex of
      0 : // iamPOS
          TransferIamPOS;
      1 : // SolbiMart
          TransferSolbiMart;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

//==============================================================================
// MSSQL
//------------------------------------------------------------------------------
// 서버 연결 - 테스트
procedure TSystemDBTransferForm.MSSqlDBTestButtonClick(Sender: TObject);
var
  vConnectTestResult: string;
begin
  inherited;

  vConnectTestResult := MSSqlConnectTest;
  if vConnectTestResult = EmptyStr then
    MsgBox('데이터베이스에 연결이 잘 되었습니다.'#13'이관 작업을 진행하셔도 됩니다.')
  else if Pos(msgMustInput, vConnectTestResult) > 0 then
    ShowMsg(vConnectTestResult, true)
  else
  begin
    PlayWave('DBError');
    ErrBox('데이터베이스와 연결할 수 없습니다.'#13#13 + vConnectTestResult);
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// MSSQL 연결 테스트
function TSystemDBTransferForm.MSSqlConnectTest: string;
begin
  if MSSqlServerIPEdit.Text = EmptyStr then
    Result := MSSqlServerIPLabel.Caption+msgMustInput
  else if MSSqlLoginEdit.Text = EmptyStr then
    Result := MSSqlLoginLabel.Caption+msgMustInput
  else if MSSqlPasswordEdit.Text = EmptyStr then
    Result := MSSqlPasswordLabel.Caption+msgMustInput
  else if MSSqlDBNameEdit.Text = EmptyStr then
    Result := MSSqlDBNameLabel.Caption+msgMustInput
  else
    try
      try
        if Connection.Connected then
          Connection.Close;
        Connection.Server   := MSSqlServerIPEdit.Text;
        Connection.Username := MSSqlLoginEdit.Text;
        Connection.Password := MSSqlPasswordEdit.Text;
        Connection.Database := MSSqlDBNameEdit.Text;
        Connection.Open;
        Result := EmptyStr;
      except
        on E: Exception do
          Result := '에러내용:'#13+E.Message;
      end;
    finally
      if Connection.Connected then
        Connection.Close;
    end;
end;
//------------------------------------------------------------------------------
// iamPOS 데이터 이관
function TSystemDBTransferForm.TransferIamPOS: Boolean;
var
  vSourceDB, vDestDB: string;
  vStore, vBoss, vUptae, vJongmok, vBizNo, vAddr, vTel, vMsg1, vMsg2: string;
  vConnectTestResult: string;
begin
  Result := false;

  // 필수 정보 입력 확인
  vConnectTestResult := MSSqlConnectTest;
  if vConnectTestResult <> EmptyStr then
  begin
    if Pos(msgMustInput, vConnectTestResult) > 0 then
      ShowMsg(vConnectTestResult, true)
    else
    begin
      PlayWave('DBError');
      ErrBox('원본 서버에 접속할 수 없어 이관을 할 수 없습니다.'#13#13 + vConnectTestResult);
    end;
    Exit;
  end
  else if not MSSqlStoreCheckBox.Checked      and
          not MSSqlGoodsCheckBox.Checked      and
          not MSSqlGoodsClassCheckBox.Checked and
          not MSSqlCompanyCheckBox.Checked    and
          not MSSqlMemberCheckBox.Checked     and
          not MSSqlUserCheckBox.Checked       then
  begin
    ShowMsg(Trim(MSSqlTRGroupBox.Caption)+'을 하나 이상 선택하십시오.', true);
    Exit;
  end;


  // 같은 데이터베이스에 있지 않을 경우 링크를 건다
  vSourceDB := EmptyStr;
  if MSSqlServerIPEdit.Text <> GetIniFile('공통', 'DB_IP', ipLocal) then
  begin
    DM.ConnectDB(true);
    try
      try
        vSourceDB := 'MartLink';
        if not DM.OpenQuery('select   srvid '
                           +'from     sys.sysservers '
                           +'where    srvname = :P0',
                            [vSourceDB],
                             true) then
        begin
          // 원격 서버 링크
          DM.Script.SQL.Text := Format('sp_addlinkedserver @server=''%s'', @srvproduct='''', @provider=''SQLOLEDB'', @datasrc=''%s'', @provstr='''', @catalog=''%s''', [vSourceDB, MSSqlServerIPEdit.Text, MSSqlDBNameEdit.Text]);
          DM.Script.Execute;
          // 원격 서버 로그인 생성
          DM.Script.SQL.Text := Format('sp_addlinkedsrvlogin @rmtsrvname=''%s'', @useself=''false'', @locallogin=NULL, @rmtuser=''%s'', @rmtpassword=''%s''', [vSourceDB, MSSqlLoginEdit.Text, MSSqlPasswordEdit.Text]);
          DM.Script.Execute;
        end;
        vSourceDB := vSourceDB + '.';
      except
        on E: Exception do
        begin
          ErrBox(ConditionToolBarEditLabel.Caption+'와 연결을 설정하지 못했습니다.'#13+E.Message);
          Exit;
        end;
      end;
    finally
      DM.DisconnectDB;
    end;
  end;
  vSourceDB := vSourceDB + MSSqlDBNameEdit.Text + '.dbo.';
  vDestDB   := GetIniFile('공통', 'DB_NAME', msgExtremeERP) + '.dbo.';


  // 상품 분류 임시 테이블 생성 (iamPOS에서 상품 분류를 3자리로 쓰는 바람에 매칭 시키는 테이블 필요)
  try
    OpenQuery('select   Top 1 gb_top '
             +'from '+vSourceDB+'gbook_tmp',
              [],
               true);
  except
    Result := ExecQuery('create table '+vSourceDB+'gbook_tmp '
                       +'( '
                       +'  gb_top int not null, '
                       +'  gb_mid int not null, '
                       +'  gb_bot int not null, '
                       +'  gb_name varchar(30) null, '
                       +'  cd_class varchar(6) null '
                       +') on [PRIMARY]',
                        []);
    if not Result then
      Exit;
  end;


  // 매장 정보 이관
  if MSSqlStoreCheckBox.Checked then
  begin
    OpenQuery('select   Max(NM_STORE)   as NM_STORE, '
             +'         Max(NM_BOSS)    as NM_BOSS, '
             +'         Max(NM_UPTAE)   as NM_UPTAE, '
             +'         Max(NM_UPJONG)  as NM_UPJONG, '
             +'         Max(NO_BIZER)   as NO_BIZER, '
             +'         Max(ADDR1)      as ADDR1, '
             +'         Max(TEL_OFFICE) as TEL_OFFICE, '
             +'         Max(RCP_TITLE1) as RCP_TITLE1, '
             +'         Max(RCP_END1)   as RCP_END1 '
             +'from    (select   case when cc_code = 21 then RTrim(cc_strval) end as NM_STORE, '
             +'                  case when cc_code = 23 then RTrim(cc_strval) end as NM_BOSS, '
             +'                  case when cc_code = 20 then RTrim(cc_strval) end as NM_UPTAE, '
             +'                  case when cc_code = 19 then RTrim(cc_strval) end as NM_UPJONG, '
             +'                  case when cc_code = 22 then RTrim(cc_strval) end as NO_BIZER, '
             +'                  case when cc_code = 24 then RTrim(cc_strval) end as ADDR1, '
             +'                  case when cc_code = 25 then RTrim(cc_strval) end as TEL_OFFICE, '
             +'                  case when cc_code = 26 then RTrim(cc_strval) end as RCP_TITLE1, '
             +'                  case when cc_code = 27 then RTrim(cc_strval) end as RCP_END1 '
             +'         from '+vSourceDB+'ccode) as store',
              []);
    try
      vStore   := Query.Fields[0].AsString;
      vBoss    := Query.Fields[1].AsString;
      vUptae   := Query.Fields[2].AsString;
      vJongmok := Query.Fields[3].AsString;
      vBizNo   := Query.Fields[4].AsString;
      vAddr    := Query.Fields[5].AsString;
      vTel     := Query.Fields[6].AsString;
      vMsg1    := Query.Fields[7].AsString;
      vMsg2    := Query.Fields[8].AsString;
    finally
      FinishQuery;
    end;
    Result := ExecQuery('update '+vDestDB+'MS_STORE '
                       +'set    NM_STORE   = SubString(Convert(TEXT, :P1), 1, 30), '
                       +'       NM_BOSS    = SubString(Convert(TEXT, :P2), 1, 20), '
                       +'       NM_UPTAE   = SubString(Convert(TEXT, :P3), 1, 30), '
                       +'       NM_UPJONG  = SubString(Convert(TEXT, :P4), 1, 30), '
                       +'       NO_BIZER   = SubString(Convert(TEXT, :P5), 1, 12), '
                       +'       ADDR1      = SubString(Convert(TEXT, :P6), 1, 40), '
                       +'       TEL_OFFICE = SubString(Convert(TEXT, :P7), 1, 13), '
                       +'       RCP_TITLE1 = SubString(Convert(TEXT, :P8), 1, 42), '
                       +'       RCP_END1   = SubString(Convert(TEXT, :P9), 1, 42) '
                       +'where  CD_STORE   = :P0',
                        [StoreCode,
                         vStore, vBoss, vUptae, vJongmok, vBizNo, vAddr, vTel, vMsg1, vMsg2]);
    if Result then
    begin
      MSSqlStoreLabel.Caption := msgSuccess;
      MSSqlStoreLabel.Refresh;
    end
    else
    begin
      MSSqlStoreLabel.Caption := msgFailed;
      MSSqlStoreLabel.Refresh;
      Exit;
    end;
  end;


  // 거래처 이관
  if MSSqlCompanyCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 거래처 삭제
      ExecQuery('delete from '+vDestDB+'MS_TRD '
               +'where  CD_STORE = :P0 '
               +'  and  DS_TRDPL in (''B'', ''R'', ''C'', ''E'')',
                [StoreCode],
                 false);
      // 새 거래처 저장
      ExecQuery('insert into '+vDestDB+'MS_TRD '
               +'( '
               +'  CD_STORE, CD_TRDPL, NM_TRDPL, NM_BOSS, NO_BIZER, NM_JONGMOK, NM_UPTAE, TEL_OFFICE, TEL_FAX, NM_EMAIL, NO_POST, ADDR1, NM_DAMDANG, TEL_DAMDANG, REMARK, DS_STATUS, DS_TRDPL, NM_BANK, NO_ACCOUNT, NM_ACCOUNT, RATE_FEE, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         Replicate(''0'', 6 - Len(Convert(varchar, sup_code))) + Convert(varchar, sup_code) as CD_TRDPL, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(sup_bzname)), 1, 30) as NM_TRDPL, '
               +vDestDB+'RTrim(sup_ceoname) as NM_BOSS, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(sup_bzno)), 1, 12) as NO_BIZER, '
               +'         SubString(Convert(TEXT, RTrim(sup_maingoods)), 1, 30) as NM_JONGMOK, '
               +'         SubString(Convert(TEXT, RTrim(sup_bztype)), 1, 30) as NM_UPTAE, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(sup_tel)), 1, 13) as TEL_OFFICE, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(sup_fax)), 1, 13) as TEL_FAX, '
               +'         SubString(Convert(TEXT, RTrim(sup_email)), 1, 40) as NM_EMAIL, '
               +'         SubString(Convert(TEXT, RTrim(sup_zipcode)), 1, 7) as NO_POST, '
               +'         SubString(Convert(TEXT, RTrim(sup_address)), 1, 40) as ADDR1, '
               +'         RTrim(sup_mgrname) as NM_DAMDANG, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(sup_cel)), 1, 13) as TEL_DAMDANG, '
               +'         SubString(Convert(TEXT, RTrim(sup_memo)), 1, 100) as REMARK, '
               +'         0 as DS_STATUS, '
               +'         case when sup_purtype = 1 then ''R'' else ''B'' end as DS_TRDPL, '
               +'         SubString(Convert(TEXT, RTrim(sup_bank)), 1, 20) as NM_BANK, '
               +'         SubString(Convert(TEXT, RTrim(sup_account)), 1, 30) as NO_ACCOUNT, '
               +'         RTrim(sup_accname) as NM_ACCOUNT, '
               +'         0 as RATE_FEE, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'supplier',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlCompanyLabel.Caption := msgSuccess;
      MSSqlCompanyLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlCompanyLabel.Caption := msgFailed;
        MSSqlCompanyLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 회원 이관
  if MSSqlMemberCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 회원 삭제
      ExecQuery('delete from '+vDestDB+'MS_MEMBER '
               +'where  CD_STORE = :P0',
                [StoreCode],
                 false);
      // 새 회원 저장
      ExecQuery('insert into '+vDestDB+'MS_MEMBER '
               +'( '
               +'  CD_STORE, CD_MEMBER, NM_MEMBER, NM_CHOSUNG, DS_SEX, NO_CARD, YMD_ISU, YMD_BIRTH, YN_LUNAR, YMD_MARRI, AMT_SALE, CNT_VISIT, TEL_HOME, TEL_MOBIL, NO_POST, ADDR1, NM_EMAIL, CD_JOIN, REMARK, DS_STATUS, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         Replicate(''0'', 10 - Len(Convert(varchar, mem_code))) + Convert(varchar, mem_code) as CD_MEMBER, '
               +vDestDB+'RTrim(mem_name) as NM_MEMBER, '
               +'         dbo.GetChosung(RTrim(mem_name)) as NM_CHOSUNG, '
               +'         Convert(varchar, IsNull(mem_sex,0)) as DS_SEX, '
               +'         RTrim(mem_bcode) as NO_CARD, '
               +'         Convert(varchar, mem_rdate, 112) as YMD_ISU, '
               +'         case when mem_birthyy is null or mem_birthmm is null or mem_birthdd is null then null else mem_birthyy + mem_birthmm + mem_birthdd end as YMD_BIRTH, '
               +'         case when IsNull(mem_birthtype,0) = 0 then ''N'' else ''Y'' end as YN_LUNAR, '
               +'         case when mem_wedday is null then null else Convert(varchar, mem_wedday) end as YMD_MARRI, '
               +'         0 as AMT_SALE, '
               +'         0 as CNT_VISIT, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(mem_tel)), 1, 13) as TEL_HOME, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(mem_cel)), 1, 13)  as TEL_MOBIL, '
               +'         SubString(Convert(TEXT, RTrim(mem_zip)), 1, 7)    as NO_POST, '
               +'         SubString(Convert(TEXT, RTrim(mem_addr)), 1, 40)  as ADDR1, '
               +'         SubString(Convert(TEXT, RTrim(mem_email)), 1, 40) as NM_EMAIL, '
               +'         :P0   as CD_JOIN, '
               +'         mem_memo, '
               +'         ''0'' as DS_STATUS, '
               +'         0     as DS_TRANS '
               +'from '+vSourceDB+'member',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlMemberLabel.Caption := msgSuccess;
      MSSqlMemberLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlMemberLabel.Caption := msgFailed;
        MSSqlMemberLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 사용자 이관
  if MSSqlUserCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 사용자 삭제
      ExecQuery('delete from '+vDestDB+'MS_SAWON '
               +'where  CD_STORE = :P0 '
               +'  and  CD_SAWON <> ''master''',
                [StoreCode],
                 false);
      ExecQuery('delete from '+vDestDB+'MS_SAWON_FAV '
               +'where  CD_STORE = :P0 '
               +'  and  CD_SAWON <> ''master''',
                [StoreCode],
                 false);
      // 새 사용자 저장
      ExecQuery('insert into '+vDestDB+'MS_SAWON '
               +'( '
               +'  CD_STORE, CD_SAWON, NM_SAWON, NO_PASSWORD, YMD_ENTRANCE, NM_RANK, CD_GRADE, YN_USE, TEL_HOME, TEL_MOBIL, NO_POST, ADDR1, NM_EMAIL, EMP_WORK, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         Replicate(''0'', 6 - Len(RTrim(id))) + RTrim(id) as CD_SAWON, '
               +'         RTrim(name) as NM_SAWON, '
               +'         ''3B'' as NO_PASSWORD, '
               +'         Convert(varchar, ipsadate, 112) as YMD_ENTRANCE, '
               +'         SubString(Convert(TEXT, RTrim(title)), 1, 10) as NM_RANK, '
               +'         ''002'' as CD_GRADE, '
               +'         ''Y'' as YN_USE, '
               +'         SubString(Convert(TEXT, RTrim(phone_home)), 1, 13) as TEL_HOME, '
               +'         SubString(Convert(TEXT, RTrim(phone_cel)), 1, 13)  as TEL_MOBIL, '
               +'         RTrim(zipcode) as NO_POST, '
               +'         SubString(Convert(TEXT, RTrim(address)), 1, 40) as ADDR1, '
               +'         SubString(Convert(TEXT, RTrim(email1)), 1, 40)  as NM_EMAIL, '
               +'         ''1000000000'' as EMP_WORK, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'Employee',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlUserLabel.Caption := msgSuccess;
      MSSqlUserLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlUserLabel.Caption := msgFailed;
        MSSqlUserLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 상품 분류 이관
  if MSSqlGoodsClassCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 상품 분류 임시 테이블에 분류 생성
      ExecQuery('delete from '+vSourceDB+'gbook_tmp',
                [],
                 false);
      ExecQuery('insert into '+vSourceDB+'gbook_tmp '
               +'( '
               +'  gb_top, gb_mid, gb_bot, gb_name, cd_class '
               +') '
               +'select   gb_top, '
               +'         gb_mid, '
               +'         gb_bot, '
               +'         gb_name, '
               +'         case when r1 = 0 then '''' else Replicate(''0'', 2 - Len(Convert(varchar, r1))) + Convert(varchar, r1) end + '
               +'         case when r2 = 0 then '''' else Replicate(''0'', 2 - Len(Convert(varchar, r2))) + Convert(varchar, r2) end + '
               +'         case when r3 = 0 then '''' else Replicate(''0'', 2 - Len(Convert(varchar, r3))) + Convert(varchar, r3) end as cd_class '
               +'from    (select   gb_top, '
               +'                  gb_mid, '
               +'                  gb_bot, '
               +'                  RTrim(gb_name) as gb_name, '
               +'                  Dense_Rank() over (order by gb_top) -1 as r1, '
               +'                  Dense_Rank() over (partition by gb_top order by gb_mid) -1 as r2, '
               +'                  Dense_Rank() over (partition by gb_top, gb_mid order by gb_bot) -1 as r3 '
               +'         from '+vSourceDB+'gbook) as gb',
                [],
                 false);

      // 기 상품분류 삭제
      ExecQuery('delete from '+vDestDB+'MS_GOODS_CLASS '
               +'where  CD_STORE = :P0',
                [StoreCode],
                 false);
      // 새 상품분류 저장
      ExecQuery('insert into '+vDestDB+'MS_GOODS_CLASS '
               +'( '
               +'  CD_STORE, CD_CLASS, NM_CLASS, DT_CHANGE, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         cd_class, '
               +'         gb_name, '
               +'         GetDate() as DT_CHANGE, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'gbook_tmp',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlGoodsClassLabel.Caption := msgSuccess;
      MSSqlGoodsClassLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlGoodsClassLabel.Caption := msgFailed;
        MSSqlGoodsClassLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 상품마스터 이관
  if MSSqlGoodsCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 상품마스터 삭제
      ExecQuery('delete from '+vDestDB+'MS_GOODS '
               +'where  CD_STORE = :P0 '
               +'  and  CD_GOODS <> ''00000000''',
                [StoreCode],
                 false);
      // 이상한 상품코드 삭제
      ExecQuery('delete from '+vSourceDB+'goods '
               +'where  (not Len(RTrim(goods_bcode)) in (7, 8, 12, 13)) '
               +'   or  (RTrim(goods_name) = '''')',
                [],
                 false);
      // 중복키 삭제
      ExecQuery('delete from '+vSourceDB+'goods '
               +'where  goods_code in (select   goods_code '
               +'                      from    (select   row_number() over (partition by goods_bcode order by goods_bcode) as rnk, '
               +'                                        goods_bcode, '
               +'                                        goods_code '
               +'                               from '+vSourceDB+'goods '
               +'                               where goods_bcode in (select   goods_bcode '
               +'                                                     from    (select   goods_bcode, '
               +'                                                                       Count(*) as cnt '
               +'                                                              from '+vSourceDB+'goods '
               +'                                                              group by goods_bcode) as g1 '
               +'                                                     where    cnt > 1)) as g2 '
               +'                      where    rnk > 1)',
                [],
                 false);
      ExecQuery('delete from '+vSourceDB+'goods '
               +'where  goods_code in (select   goods_code '
               +'                      from    (select   row_number() over (partition by goods_bcode order by goods_bcode) as rnk, '
               +'                                        goods_bcode, '
               +'                                        goods_code '
               +'                               from '+vSourceDB+'goods '
               +'                               where goods_bcode in (select   goods_bcode '
               +'                                                     from    (select   Max(goods_bcode) as goods_bcode, '
               +'                                                                       Count(*) as cnt '
               +'                                                              from '+vSourceDB+'goods '
               +'                                                              where    goods_bcode like ''2%'' '
               +'                                                              group by case when Len(RTrim(goods_bcode)) = 7 then RTrim(goods_bcode)+''00000'' else SubString(goods_bcode, 1, 12) end) as g1 '
               +'                                                     where    cnt > 1)) as g2)',
                [],
                 false);
      // 새 상품마스터 저장
      ExecQuery('insert into '+vDestDB+'MS_GOODS '
               +'( '
               +'  CD_STORE, CD_GOODS, NM_GOODS, NM_SPEC, NM_GOODS_SHORT, DS_GOODS, PR_SALE, PR_SALE_PROFIT, PR_BUY, DS_TAX, CD_CLASS, DS_STOCK, CD_GOODS_T, QTY_NEPUM, CD_TRDPL, RATE_FEE, YN_USE, YN_DC, YN_POINT, YN_OKCASHBAG, DT_CHANGE, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         RTrim(g.goods_bcode) as CD_GOODS, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(g.goods_name)),  1, 50) as NM_GOODS, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(g.goods_sspec)), 1, 20) as NM_SPEC, '
               +vDestDB+'SubString(Convert(TEXT, RTrim(g.goods_name) + case when RTrim(g.goods_sspec) = '''' then '''' else '' ''+RTrim(g.goods_sspec) end), 1, 18) as NM_GOODS_SHORT, '
               +'         case when Len(RTrim(g.goods_bcode)) = 7 and Left(g.goods_bcode, 1) = ''2'' then ''W'' when g.goods_sprice = 0 then ''O'' else ''N'' end as DS_GOODS, '
               +'         g.goods_sprice as PR_SALE, '
               +'         case when g.goods_sprice = 0 or g.goods_bprice > g.goods_sprice then 0 else Round((g.goods_sprice - g.goods_bprice) / g.goods_sprice * 100, 2) end as PR_SALE_PROFIT, '
               +'         g.goods_bprice as PR_BUY, '
               +'         Convert(varchar, g.goods_tax) as DS_TAX, '
               +'         b.cd_class as CD_CLASS, '
               +'         case when Len(RTrim(g.goods_bcode)) = 7 and Left(g.goods_bcode, 1) = ''2'' then ''1'' when g.goods_sprice = 0 then ''1'' else ''0'' end as DS_STOCK, '
               +'         RTrim(g.goods_bcode) as CD_GOODS_T, '
               +'         1 as QTY_NEPUM, '
               +'         case when g.goods_sup = 0 then null else Replicate(''0'', 6 - Len(Convert(varchar, g.goods_sup))) + Convert(varchar, g.goods_sup) end as CD_TRDPL, '
               +'         Convert(numeric(5,2), IsNull(g.goods_fee, 0)) as RATE_FEE, '
               +'         ''Y'' as YN_USE, '
               +'         ''Y'' as YN_DC, '
               +'         ''Y'' as YN_POINT, '
               +'         ''N'' as YN_OKCASHBAG, '
               +'         GetDate() as DT_CHANGE, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'goods as g inner join '
               +'     '+vSourceDB+'gbook_tmp as b on g.goods_bktop = b.gb_top and g.goods_bkmid = b.gb_mid and g.goods_bkbot = b.gb_bot',
                [StoreCode],
                 false);
      // 저울 코드 새로 만들기
      ExecQuery('update '+vDestDB+'MS_GOODS '
               +'set    CD_GOODS      = dbo.GetBarcode(CD_GOODS + ''000000'') '
               +'where  CD_STORE      = :P0 '
               +'  and  Len(CD_GOODS) = 7 '
               +'  and  DS_GOODS      = ''W''',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlGoodsLabel.Caption := msgSuccess;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlGoodsLabel.Caption := msgFailed;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 원격 서버 링크를 제거한다
  if MSSqlServerIPEdit.Text <> GetIniFile('공통', 'DB_IP', ipLocal) then
  begin
    DM.ConnectDB(true);
    try
      try
        vSourceDB := 'MartLink';
        if DM.OpenQuery('select   srvid '
                       +'from     sys.sysservers '
                       +'where    srvname = :P0',
                        [vSourceDB],
                         true) then
        begin
          // 원격 서버 로그인 삭제
          DM.Script.SQL.Text := Format('sp_droplinkedsrvlogin @rmtsrvname=''%s'', @locallogin=NULL', [vSourceDB]);
          DM.Script.Execute;
          // 원격 서버 링크 삭제
          DM.Script.SQL.Text := Format('sp_dropserver @server=''%s''', [vSourceDB]);
          DM.Script.Execute;
        end;
      except
        on E: Exception do
          ErrBox(ConditionToolBarEditLabel.Caption+'와 연결을 제거하지 못했습니다.'#13+E.Message);
      end;
    finally
      DM.DisconnectDB;
    end;
  end;

  MsgBox('이관이 완료되었습니다.');
end;
//------------------------------------------------------------------------------
// SolbiMart 데이터 이관
function TSystemDBTransferForm.TransferSolbiMart: Boolean;
var
  vSourceDB, vDestDB: string;
  vConnectTestResult: string;
  vIndex: Integer;
begin
  Result := false;

  // 필수 정보 입력 확인
  vConnectTestResult := MSSqlConnectTest;
  if vConnectTestResult <> EmptyStr then
  begin
    if Pos(msgMustInput, vConnectTestResult) > 0 then
      ShowMsg(vConnectTestResult, true)
    else
    begin
      PlayWave('DBError');
      ErrBox('원본 서버에 접속할 수 없어 이관을 할 수 없습니다.'#13#13 + vConnectTestResult);
    end;
    Exit;
  end
  else if not MSSqlStoreCheckBox.Checked         and
          not MSSqlGoodsCheckBox.Checked         and
          not MSSqlGoodsClassCheckBox.Checked    and
          not MSSqlCompanyCheckBox.Checked       and
          not MSSqlCompanyCreditCheckBox.Checked and
          not MSSqlMemberCheckBox.Checked        and
          not MSSqlMemberPointCheckBox.Checked   and
          not MSSqlMemberCreditCheckBox.Checked  and
          not MSSqlUserCheckBox.Checked          then
  begin
    ShowMsg(Trim(MSSqlTRGroupBox.Caption)+'을 하나 이상 선택하십시오.', true);
    Exit;
  end;


  // 같은 데이터베이스에 있지 않을 경우 링크를 건다
  vSourceDB := EmptyStr;
  if MSSqlServerIPEdit.Text <> GetIniFile('공통', 'DB_IP', ipLocal) then
  begin
    DM.ConnectDB(true);
    try
      try
        vSourceDB := 'MartLink';
        if not DM.OpenQuery('select   srvid '
                           +'from     sys.sysservers '
                           +'where    srvname = :P0',
                            [vSourceDB],
                             true) then
        begin
          // 원격 서버 링크
          DM.Script.SQL.Text := Format('sp_addlinkedserver @server=''%s'', @srvproduct='''', @provider=''SQLOLEDB'', @datasrc=''%s'', @provstr='''', @catalog=''%s''', [vSourceDB, MSSqlServerIPEdit.Text, MSSqlDBNameEdit.Text]);
          DM.Script.Execute;
          // 원격 서버 로그인 생성
          DM.Script.SQL.Text := Format('sp_addlinkedsrvlogin @rmtsrvname=''%s'', @useself=''false'', @locallogin=NULL, @rmtuser=''%s'', @rmtpassword=''%s''', [vSourceDB, MSSqlLoginEdit.Text, MSSqlPasswordEdit.Text]);
          DM.Script.Execute;
        end;
        vSourceDB := vSourceDB + '.';
      except
        on E: Exception do
        begin
          ErrBox(ConditionToolBarEditLabel.Caption+'와 연결을 설정하지 못했습니다.'#13+E.Message);
          Exit;
        end;
      end;
    finally
      DM.DisconnectDB;
    end;
  end;
  vSourceDB := vSourceDB + MSSqlDBNameEdit.Text + '.dbo.';
  vDestDB   := GetIniFile('공통', 'DB_NAME', msgExtremeERP) + '.dbo.';


  // 매장 정보 이관
  if MSSqlStoreCheckBox.Checked then
  begin
    BeginTrans;
    try
      ExecQuery('update '+vDestDB+'MS_STORE '
               +'set    NO_BIZER    = s.no_bizer, '
               +'       NM_STORE    = s.nm_store, '
               +'       NM_BOSS     = s.nm_boss, '
               +'       NM_UPJONG   = s.nm_upjong, '
               +'       NM_UPTAE    = s.nm_uptae, '
               +'       TEL_OFFICE  = s.tel_office, '
               +'       TEL_FAX     = s.tel_fax, '
               +'       NO_POST     = s.no_post, '
               +'       ADDR1       = s.addr1, '
               +'       ADDR2       = s.addr2, '
               +'       RCP_TITLE1  = s.rcp_title1, '
               +'       RCP_TITLE2  = s.rcp_title2, '
               +'       RCP_TITLE3  = s.rcp_title3, '
               +'       RCP_TITLE4  = s.rcp_title4, '
               +'       RCP_END1    = s.rcp_end1, '
               +'       RCP_END2    = s.rcp_end2, '
               +'       RCP_END3    = s.rcp_end3, '
               +'       RCP_END4    = '''', '
               +'       PNT_MIN_USE = s.pnt_min_use, '
               +'       DC_UNIT     = s.dc_unit, '
               +'       LEN_CARD    = s.len_card, '
               +'       PREFIX      = s.prefix, '
               +'       DT_CHANGE   = GetDate(), '
               +'       REMARK      = s.remark '
               +'from '+vSourceDB+'MS_STORE as s',
                [],
                 false);
      CommitTrans;
      Result := true;
      MSSqlStoreLabel.Caption := msgSuccess;
      MSSqlStoreLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlStoreLabel.Caption := msgFailed;
        MSSqlStoreLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 상품마스터 이관
  if MSSqlGoodsCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 상품마스터 삭제
      ExecQuery('delete from '+vDestDB+'MS_GOODS '
               +'where  CD_STORE = :P0 '
               +'  and  CD_GOODS <> ''00000000''',
                [StoreCode],
                 false);
      // 새 상품마스터 저장
      ExecQuery('insert into '+vDestDB+'MS_GOODS '
               +'( '
               +'  CD_STORE, CD_GOODS, NM_GOODS, NM_SPEC, NM_GOODS_SHORT, NM_UNIT, DS_GOODS, PR_SALE, PR_SALE_PROFIT, PR_BUY, DS_TAX, CD_CLASS, DS_STOCK, CD_GOODS_T, '
               +'  QTY_NEPUM, CD_TRDPL, YN_USE, YN_DC, YN_POINT, YN_OKCASHBAG, QTY_SAFETY, QTY_ORDER_UNIT, CD_SAWON_CHG, DT_CHANGE, DT_INSERT, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         barcd_s as CD_GOODS, '
               +vDestDB+'nm_barcode as NM_GOODS, '
               +vDestDB+'nm_fix as NM_SPEC, '
               +vDestDB+'SubString(Convert(TEXT, nm_goods_short), 1, 30) as NM_GOODS_SHORT, '
               +'         nm_unit, '
               +'         case when ds_mng_goods = ''2'' then ''W'' when pr_sale = 0 then ''O'' else ''N'' end as DS_GOODS, '
               +'         pr_sale, '
               +'         case when pr_sale = 0 or pr_buy > pr_sale then 0 else Round((pr_sale - pr_buy) / pr_sale * 100, 2) end as PR_SALE_PROFIT, '
               +'         pr_buy, '
               +'         ds_tax, '
               +'         cd_class, '
               +'         case when ds_mng_goods = ''2'' or yn_stock = ''N'' then ''1'' else ''0'' end as DS_STOCK, '
               +'         barcd_s as CD_GOODS_T, '
               +'         1 as QTY_NEPUM, '
               +'         cd_buy_trdpl as CD_TRDPL, '
               +'         yn_use, '
               +'         yn_goods_dc as YN_DC, '
               +'         yn_point, '
               +'         ''N'' as YN_OKCASHBAG, '
               + Ifthen(UpperCase(MSSqlDBNameEdit.Text)='SOLBI_MART2',' qty_safe as QTY_SAFETY, ',' 0 as QTY_SAFETY, ')
               + Ifthen(UpperCase(MSSqlDBNameEdit.Text)='SOLBI_MART2',' qty_order as QTY_ORDER_UNIT, ',' 0 as QTY_ORDER_UNIT,')
               +'         cd_sawon_chg, '
               +'         GetDate() as DT_CHANGE, '
               +'         dt_change as DT_INSERT, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'MS_SALBAR',
                [StoreCode],
                 false);
      // 저울 코드 새로 만들기
      ExecQuery('update '+vDestDB+'MS_GOODS '
               +'set    CD_GOODS      = dbo.GetBarcode(CD_GOODS + ''0000000'') '
               +'where  CD_STORE      = :P0 '
               +'  and  Len(CD_GOODS) = 6 '
               +'  and  DS_GOODS      = ''W''',
                [StoreCode],
                 false);
      // 이상한 상품코드 삭제
      ExecQuery('delete from '+vDestDB+'MS_GOODS '
               +'where  CD_STORE = :P0 '
               +'  and ((not Len(CD_GOODS) in (7, 8, 12, 13)) '
               +'    or (NM_GOODS = ''''))',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlGoodsLabel.Caption := msgSuccess;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlGoodsLabel.Caption := msgFailed;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 상품 분류 이관
  if MSSqlGoodsClassCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 상품분류 삭제
      ExecQuery('delete from '+vDestDB+'MS_GOODS_CLASS '
               +'where  CD_STORE = :P0',
                [StoreCode],
                 false);
      // 새 상품분류 저장
      ExecQuery('insert into '+vDestDB+'MS_GOODS_CLASS '
               +'( '
               +'  CD_STORE, CD_CLASS, NM_CLASS, DT_CHANGE, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         cd_class, '
               +'         nm_class, '
               +'         GetDate() as DT_CHANGE, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'MS_GOODS_CLASS',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlGoodsClassLabel.Caption := msgSuccess;
      MSSqlGoodsClassLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlGoodsClassLabel.Caption := msgFailed;
        MSSqlGoodsClassLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 거래처 이관
  if MSSqlCompanyCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 거래처 삭제
      ExecQuery('delete from '+vDestDB+'MS_TRD '
               +'where  CD_STORE = :P0 '
               +'  and  DS_TRDPL in (''B'', ''R'', ''C'', ''E'')',
                [StoreCode],
                 false);
      // 새 거래처 저장
      ExecQuery('insert into '+vDestDB+'MS_TRD '
               +'( '
               +'  CD_STORE, CD_TRDPL, NM_TRDPL, NM_BOSS, NO_BIZER, NM_JONGMOK, NM_UPTAE, TEL_OFFICE, TEL_FAX, NM_EMAIL, NO_POST, ADDR1, ADDR2, NM_DAMDANG, DS_STATUS, CD_SAWON_CHG, DT_CHANGE, DS_TRDPL, NM_BANK, NO_ACCOUNT, NM_ACCOUNT, RATE_FEE, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         t.cd_trdpl, '
               +vDestDB+'t.nm_trdpl as NM_TRDPL, '
               +vDestDB+'t.nm_boss as NM_BOSS, '
               +vDestDB+'t.no_bizer as NO_BIZER, '
               +'         t.nm_upjong as NM_JONGMOK, '
               +'         t.nm_uptae, '
               +vDestDB+'t.tel_office as TEL_OFFICE, '
               +vDestDB+'t.tel_fax as TEL_FAX, '
               +'         t.nm_email, '
               +'         t.no_post, '
               +'         t.addr1, '
               +'         t.addr2, '
               +'         t.nm_damer_pl as NM_DAMDANG, '
               +'         0 as DS_STATUS, '
               +'         t.cd_sawon_chg, '
               +'         GetDate() as DT_CHANGE, '
               +'         case when c.cd_code is null then ''B'' else ''R'' end as DS_TRDPL, '
               +'         Left(t.nm_bank,20) as NM_BANK, '
               +'         t.no_acc as NO_ACCOUNT, '
               +'         t.nm_acc as NM_ACCOUNT, '
               +'         0 as RATE_FEE, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'MS_TRD  as t left outer join '
               +        vSourceDB+'MS_CODE as c on t.cd_store = c.cd_store and c.cd_kind = ''07'' and t.cd_trdpl = c.nm_code1 '
               +'where    t.yn_use = ''Y''',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlCompanyLabel.Caption := msgSuccess;
      MSSqlCompanyLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlCompanyLabel.Caption := msgFailed;
        MSSqlCompanyLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 거래처 미지급금 이관
  if MSSqlCompanyCreditCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 상품마스터 테이블에 '00000000' 코드의 상품이 있는지 검색하여 없으면 새로 등록한다
      if not OpenQuery('select   Top 1 CD_GOODS '
                      +'from '+vDestDB+'MS_GOODS '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = ''00000000''',
                       [StoreCode],
                        true) then
        ExecQuery('insert into '+vDestDB+'MS_GOODS '
                 +'( '
                 +'  CD_STORE, CD_GOODS, NM_GOODS, YN_USE '
                 +') values ( '
                 +'  :P0, ''00000000'', ''기초 외상 매입'', ''N'' '
                 +')',
                  [StoreCode],
                   false);
      // 기존 기초외상매입을 삭제한다
      ExecQuery('delete from '+vDestDB+'SL_BUY_H '
               +'where  CD_STORE = :P0 '
               +'  and  YMD_BUY  = ''20000000''',
                [StoreCode],
                 false);
      ExecQuery('delete from '+vDestDB+'SL_BUY_D '
               +'where  CD_STORE = :P0 '
               +'  and  YMD_BUY  = ''20000000''',
                [StoreCode],
                 false);
      // 새 거래처 미지급금 저장
      OpenQuery('select   cd_trdpl, '
               +'         Sum(amt_buy) as amt_buy '
               +'from    (select   cd_trdpl, '
               +'                  Sum(amt_buy + amt_buy_rtn) as amt_buy '
               +'         from '+vSourceDB+'SL_LDR_OCCUR '
               +'         where    ds_trd_mem = ''T'' '
               +'         group by cd_trdpl '
               +'         union all '
               +'         select   cd_trdpl, '
               +'                  - Sum(amt_accu) as amt_buy '
               +'         from '+vSourceDB+'SL_LDR_PAY '
               +'         group by cd_trdpl) as a '
               +'group by cd_trdpl',
                []);
      try
        vIndex := 0;
        while not Query.Eof do
        begin
          ExecQuery('insert into '+vDestDB+'SL_BUY_H '
                   +'( '
                   +'  CD_STORE, YMD_BUY, NO_BUY, DS_BUY, CD_TRDPL, CD_WAREHOUSE, AMT_DUTYFREE, AMT_TRUST, CD_SAWON_CHG, DT_CHANGE, DS_TRANS '
                   +') values ('
                   +'  :P0, ''20000000'', :P1, ''0'', :P2, ''001'', :P3, :P3, :P4, GetDate(), 0 '
                   +')',
                    [StoreCode,
                     FormatFloat('0000', vIndex+1),
                     Query.Fields[0].AsString,
                     Query.Fields[1].AsInteger,
                     UserCode],
                     false);
          ExecQuery('insert into '+vDestDB+'SL_BUY_D '
                   +'( '
                   +'  CD_STORE, YMD_BUY, NO_BUY, CD_GOODS, PR_BUY, QTY_BUY, AMT_DUTYFREE '
                   +') values ( '
                   +'  :P0, ''20000000'', :P1, ''00000000'', :P2, 1, :P2 '
                   +')',
                    [StoreCode,
                     FormatFloat('0000', vIndex+1),
                     Query.Fields[1].AsInteger],
                     false);
          Query.Next;
          Inc(vIndex);
        end;
      finally
        FinishQuery;
      end;
      CommitTrans;
      Result := true;
      MSSqlCompanyCreditLabel.Caption := msgSuccess;
      MSSqlCompanyCreditLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlCompanyCreditLabel.Caption := msgFailed;
        MSSqlCompanyCreditLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 회원 이관
  if MSSqlMemberCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 회원 삭제
      ExecQuery('delete from '+vDestDB+'MS_MEMBER '
               +'where  CD_STORE = :P0',
                [StoreCode],
                 false);
      // 새 회원 저장
      ExecQuery('insert into '+vDestDB+'MS_MEMBER '
               +'( '
               +'  CD_STORE, CD_MEMBER, NM_MEMBER, DS_SEX, DS_MEMBER, NO_CARD, YMD_ISU, NO_JUMIN, YMD_BIRTH, YN_LUNAR, YMD_MARRI, TEL_HOME, TEL_MOBIL, TEL_JOB, NO_POST, ADDR1, ADDR2, YN_TRUST, NM_EMAIL, CD_JOIN, DT_MEDIATION, DS_STATUS, CD_SAWON_CHG, DT_CHANGE, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         CD_MEMBER, '
               +vDestDB+'NM_MEMBER as NM_MEMBER, '
               +'         DS_SEX, '
               +'         DS_MEMBER, '
               +'         NO_CARD, '
               +'         YMD_ISU, '
               +'         NO_JUMIN, '
               +'         YMD_BIRTH, '
               +'         YN_LUNAR, '
               +'         YMD_MARRI, '
               +vDestDB+'TEL_HOME as TEL_HOME, '
               +vDestDB+'TEL_MOBIL as TEL_MOBIL, '
               +vDestDB+'TEL_JOB as TEL_JOB, '
               +'         NO_POST, '
               +'         ADDR1, '
               +'         ADDR2, '
               +'         case when YN_TRUST = ''Y'' then ''Y'' else ''N'' end as YN_TRUST, '
               +'         NM_EMAIL, '
               +'         CD_JOIN, '
               +'         DT_MEDIATION, '
               +'         ''0'' as DS_STATUS, '
               +'         CD_SAWON_CHG, '
               +'         GetDate() as DT_CHANGE, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'MS_MEMBER',
                [StoreCode],
                 false);
      // 기 회원구분 삭제
      ExecQuery('delete from '+vDestDB+'MS_CODE '
               +'where  CD_STORE = :P0 '
               +'  and  CD_KIND  = ''05''',
                [StoreCode],
                 false);
      // 새 회원구분 저장
      ExecQuery('insert into '+vDestDB+'MS_CODE '
               +'( '
               +'  CD_STORE, CD_KIND, CD_CODE, '
               +'  NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
               +'  NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, '
               +'  NM_CODE21, NM_CODE22, NM_CODE23, NM_CODE24, NM_CODE25, NM_CODE26, NM_CODE27, NM_CODE28, NM_CODE29, NM_CODE30, '
               +'  DS_STATUS, CD_SAWON_CHG, DT_CHANGE, DS_TRANS '
               +') '
               +'select   :P0       as CD_STORE, '
               +'         ''05''    as CD_KIND, '
               +'         cd_code, '
               +'         nm_code1, '
               +'         ''0''     as NM_CODE2, '
               +'         ''0''     as NM_CODE3, '
               +'         ''100''   as NM_CODE4, '
               +'         ''1''     as NM_CODE5, '
               +'         ''100''   as NM_CODE6, '
               +'         ''1''     as NM_CODE7, '
               +'         ''100''   as NM_CODE8, '
               +'         ''1''     as NM_CODE9, '
               +'         ''100''   as NM_CODE10, '
               +'         ''1''     as NM_CODE11, '
               +'         ''100''   as NM_CODE12, '
               +'         ''1''     as NM_CODE13, '
               +'         ''100''   as NM_CODE14, '
               +'         ''1''     as NM_CODE15, '
               +'         ''100''   as NM_CODE16, '
               +'         ''1''     as NM_CODE17, '
               +'         ''''      as NM_CODE18, '
               +'         ''''      as NM_CODE19, '
               +'         ''''      as NM_CODE20, '
               +'         ''''      as NM_CODE21, '
               +'         ''0''     as NM_CODE22, '
               +'         ''0''     as NM_CODE23, '
               +'         ''0''     as NM_CODE24, '
               +'         null      as NM_CODE25, '
               +'         null      as NM_CODE26, '
               +'         null      as NM_CODE27, '
               +'         null      as NM_CODE28, '
               +'         null      as NM_CODE29, '
               +'         null      as NM_CODE30, '
               +'         ''0''     as DS_STATUS, '
               +'         cd_sawon_chg, '
               +'         GetDate() as DT_CHANGE, '
               +'         0         as DS_TRANS '
               +'from '+vSourceDB+'MS_CODE '
               +'where    CD_KIND = ''01''',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlMemberLabel.Caption := msgSuccess;
      MSSqlMemberLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlMemberLabel.Caption := msgFailed;
        MSSqlMemberLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 회원 포인트 이관
  if MSSqlMemberPointCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 회원 포인트 삭제
      ExecQuery('delete from '+vDestDB+'SL_PNT_OCCUR '
               +'where  CD_STORE  = :P0 '
               +'  and  YMD_OCCUR = ''20000000''',
                [StoreCode],
                 false);
      // 새 회원 포인트 저장
      OpenQuery('select   cd_member, '
               +'         pnt_rest '
               +'from '+vSourceDB+'SL_POINT',
                []);
      try
        vIndex := 1;
        while not Query.Eof do
        begin
          ExecQuery('insert into '+vDestDB+'SL_PNT_OCCUR '
                   +'( '
                   +'  CD_STORE, YMD_OCCUR, SEQ, CD_MEMBER, CD_CODE, PNT_CASH, REMARK, CD_SAWON_CHG, DT_CHANGE, DS_TRANS '
                   +') values ( '
                   +'  :P0, ''20000000'', :P1, :P2, ''001'', :P3, ''기초 포인트 이관'', :P4, GetDate(), 0 '
                   +')',
                    [StoreCode,
                     vIndex,
                     Query.Fields[0].AsString,
                     Query.Fields[1].AsInteger,
                     UserCode],
                     false);
          Query.Next;
          Inc(vIndex);
        end;
      finally
        FinishQuery;
      end;
      CommitTrans;
      Result := true;
      MSSqlMemberPointLabel.Caption := msgSuccess;
      MSSqlMemberPointLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlMemberPointLabel.Caption := msgFailed;
        MSSqlMemberPointLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 회원 외상 이관
  if MSSqlMemberCreditCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 상품마스터 테이블에 '00000000' 코드의 상품이 있는지 검색하여 없으면 새로 등록한다
      if not OpenQuery('select   Top 1 CD_GOODS '
                      +'from '+vDestDB+'MS_GOODS '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = ''00000000''',
                       [StoreCode],
                        true) then
        ExecQuery('insert into '+vDestDB+'MS_GOODS '
                 +'( '
                 +'  CD_STORE, CD_GOODS, CD_GOODS_T, NM_GOODS, NM_GOODS_SHORT, NM_SPEC, YN_USE '
                 +') values ( '
                 +'  :P0, ''00000000'', ''00000000'', ''기초 외상 매입'',  ''기초 외상 매입'', '''', ''N'' '
                 +')',
                  [StoreCode],
                   false);
      // 기존 회원 외상 매출을 삭제한다
      ExecQuery('delete from '+vDestDB+'SL_SALE_H '
               +'where  CD_STORE = :P0 '
               +'  and  YMD_SALE = ''20000000''',
                [StoreCode],
                 false);
      ExecQuery('delete from '+vDestDB+'SL_SALE_H '
               +'where  CD_STORE = :P0 '
               +'  and  YMD_SALE = ''20000000''',
                [StoreCode],
                 false);
      // 새 회원 외상 미수금 저장
      OpenQuery('select   cd_trdpl, '
               +'         Sum(amt_sale) as amt_sale '
               +'from    (select   cd_trdpl, '
               +'                  Sum(amt_sale + amt_sale_rtn) as amt_sale '
               +'         from '+vSourceDB+'SL_LDR_OCCUR '
               +'         where    ds_trd_mem = ''M'' '
               +'         group by cd_trdpl '
               +'         union all '
               +'         select   cd_member, '
               +'                  - Sum(amt_accu) as amt_buy '
               +'         from '+vSourceDB+'SL_LDR_GIVE '
               +'         group by cd_member) as a '
               +'group by cd_trdpl',
                []);
      try
        vIndex := 0;
        while not Query.Eof do
        begin
          ExecQuery('insert into '+vDestDB+'SL_SALE_H '
                   +'( '
                   +'  CD_STORE, YMD_SALE, NO_POS, NO_RCP, DS_SALE, AMT_SALE, AMT_TRUST, AMT_DUTYFREE, CD_MEMBER, NO_CLOSE, CD_SAWON, DT_SALE, DT_CHANGE, DS_TRANS '
                   +') values ('
                   +'  :P0, ''20000000'', ''01'', :P1, ''S'', :P2, :P2, :P2, :P3, 1, :P4, GetDate(), GetDate(), 0 '
                   +')',
                    [StoreCode,
                     FormatFloat('0000', vIndex+1),
                     Query.Fields[1].AsInteger,
                     Query.Fields[0].AsString,
                     UserCode],
                     false);
          ExecQuery('insert into '+vDestDB+'SL_SALE_D '
                   +'( '
                   +'  CD_STORE, YMD_SALE, NO_POS, NO_RCP, SEQ, DS_SALE, CD_GOODS, QTY_SALE, PR_SALE, DS_TAX, AMT_BUY, DC_SPC '
                   +') values ( '
                   +'  :P0, ''20000000'', ''01'', :P1, 1, ''S'', ''00000000'', 1, :P2, ''0'', 0, 0 '
                   +')',
                    [StoreCode,
                     FormatFloat('0000', vIndex+1),
                     Query.Fields[1].AsInteger],
                     false);
          Query.Next;
          Inc(vIndex);
        end;
      finally
        FinishQuery;
      end;
      CommitTrans;
      Result := true;
      MSSqlMemberCreditLabel.Caption := msgSuccess;
      MSSqlMemberCreditLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlMemberCreditLabel.Caption := msgFailed;
        MSSqlMemberCreditLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 사용자 이관
  if MSSqlUserCheckBox.Checked then
  begin
    BeginTrans;
    try
      // 기 사용자 삭제
      ExecQuery('delete from '+vDestDB+'MS_SAWON '
               +'where  CD_STORE = :P0 '
               +'  and  CD_SAWON <> ''master''',
                [StoreCode],
                 false);
      ExecQuery('delete from '+vDestDB+'MS_SAWON_FAV '
               +'where  CD_STORE = :P0 '
               +'  and  CD_SAWON <> ''master''',
                [StoreCode],
                 false);
      // 새 사용자 저장
      ExecQuery('insert into '+vDestDB+'MS_SAWON '
               +'( '
               +'  CD_STORE, CD_SAWON, NM_SAWON, NO_PASSWORD, YMD_ENTRANCE, YMD_LEAVE, NM_RANK, CD_GRADE, YN_USE, TEL_HOME, TEL_MOBIL, NO_POST, ADDR1, ADDR2, NM_EMAIL, CD_SAWON_CHG, DT_CHANGE, EMP_WORK, CD_TRDPL, DS_TRANS '
               +') '
               +'select   :P0 as CD_STORE, '
               +'         cd_sawon, '
               +'         nm_sawon, '
               +'         ''3B'' as NO_PASSWORD, '
               +'         ymd_entrance, '
               +'         ymd_leave, '
               +'         nm_rank, '
               +'         ''002'' as CD_GRADE, '
               +'         yn_use, '
               +'         tel_home, '
               +'         tel_mobil, '
               +'         no_post, '
               +'         addr1, '
               +'         addr2, '
               +'         nm_email, '
               +'         cd_sawon_chg, '
               +'         GetDate() as DT_CHANGE, '
               +'         ''1000000000'' as EMP_WORK, '
               +'         '''' as CD_TRDPL, '
               +'         0 as DS_TRANS '
               +'from '+vSourceDB+'MS_SAWON '
               +'where    cd_sawon <> ''master''',
                [StoreCode],
                 false);
      CommitTrans;
      Result := true;
      MSSqlUserLabel.Caption := msgSuccess;
      MSSqlUserLabel.Refresh;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
        MSSqlUserLabel.Caption := msgFailed;
        MSSqlUserLabel.Refresh;
        Result := false;
        Exit;
      end;
    end;
  end;


  // 원격 서버 링크를 제거한다
  if MSSqlServerIPEdit.Text <> GetIniFile('공통', 'DB_IP', ipLocal) then
  begin
    DM.ConnectDB(true);
    try
      try
        vSourceDB := 'MartLink';
        if DM.OpenQuery('select   srvid '
                       +'from     sys.sysservers '
                       +'where    srvname = :P0',
                        [vSourceDB],
                         true) then
        begin
          // 원격 서버 로그인 삭제
          DM.Script.SQL.Text := Format('sp_droplinkedsrvlogin @rmtsrvname=''%s'', @locallogin=NULL', [vSourceDB]);
          DM.Script.Execute;
          // 원격 서버 링크 삭제
          DM.Script.SQL.Text := Format('sp_dropserver @server=''%s''', [vSourceDB]);
          DM.Script.Execute;
        end;
      except
        on E: Exception do
          ErrBox(ConditionToolBarEditLabel.Caption+'와 연결을 제거하지 못했습니다.'#13+E.Message);
      end;
    finally
      DM.DisconnectDB;
    end;
  end;

  MsgBox('이관이 완료되었습니다.');
end;

end.
