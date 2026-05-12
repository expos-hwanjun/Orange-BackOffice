unit SystemASPTrans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ExtCtrls,
  cxStyles, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB,
  MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, IdTCPClient,
  Math, StrUtils, cxCheckBox, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, IdGlobal;

type
  TSystemASPTransForm = class(TInheritForm)
    MainPanel: TPanel;
    cxGroupBox1: TcxGroupBox;
    AllDownLoadButton: TcxButton;
    MenuDownLoadButton: TcxButton;
    ClassDownLoadButton: TcxButton;
    PLUDownLoadButton: TcxButton;
    MemberDownLoadButton: TcxButton;
    cxGroupBox2: TcxGroupBox;
    CodeUploadButton: TcxButton;
    AcctUpLoadButton: TcxButton;
    PluUploadButton: TcxButton;
    SaleUpLoadButton: TcxButton;
    TransFromDateEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    TransToDateEdit: TcxDateEdit;
    cxGroupBox3: TcxGroupBox;
    CodeUploadLabel: TcxLabel;
    cxLabel2: TcxLabel;
    EventDownLoadButton: TcxButton;
    MemberCheckBox: TcxCheckBox;
    procedure AllDownLoadButtonClick(Sender: TObject);
    procedure CodeUploadButtonClick(Sender: TObject);
    procedure AcctUpLoadButtonClick(Sender: TObject);
    procedure SaleUpLoadButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure MemberDownLoadButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  public
    { Public declarations }
  end;

var
  SystemASPTransForm: TSystemASPTransForm;

implementation
uses Common, DBModule, ProxyCheck, Service;
{$R *.dfm}
procedure TSystemASPTransForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  MainPanel.Left := Trunc(Self.Width / 2 - MainPanel.Width / 2);
  MainPanel.Top  := Trunc(Self.Height / 2 - MainPanel.Height / 2);
end;

procedure TSystemASPTransForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/시스템관리/ASP자료송수신/ASP자료송수신.htm';
end;

procedure TSystemASPTransForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if MemberDownLoadButton.Visible then Exit;

  if Shift = [ssCtrl] then
    if (Key = Ord('M')) then
    begin
      with TProxyCheckForm.Create(self) do
        try
          if ShowModal = mrOK then
          begin
            MemberDownLoadButton.Visible := isAspMember;
            MemberCheckBox.Visible       := isAspMember;
          end;
        finally
          Free;
        end;
    end;
end;

procedure TSystemASPTransForm.FormShow(Sender: TObject);
begin
  inherited;
  PluUploadButton.Enabled := (GetAspOption(2) <> '1');
  TransFromDateEdit.Date := now;
  TransToDateEdit.Date   := now;
  try
    OpenQuery('select ASP_MEMBERCODE '
             +'  from MS_STORE '
             +' where CD_STORE =:P0 ',
             [StoreCode]);
    MemberDownLoadButton.Visible := isAspMember;
  finally
    FinishQuery;
  end;
end;

procedure TSystemASPTransForm.MemberDownLoadButtonClick(Sender: TObject);
var
  vIndex: Integer;
  vResult: Boolean;
  vData  : String;
  vTempData,
  vParamsType,
  vResultStr: String;
  vFirstRow : Integer;
  vCount :Integer;
  vRow, vCol: TStringList;
  vI,   vJ: Integer;
  vSeq :Integer;
  vMemberData : Array of Array of String;
  vSQL :TStringList;
  vTempSQL :String;
label loop, loop1;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if (CompanyCode = EmptyStr) then Exit;

    try
      OpenQuery('select Count(*) '
               +'  from MS_MEMBER '
               +' where CD_STORE =:P0 ',
               [StoreCode]);
      vCount := Query.Fields[0].AsInteger;
    finally
      FinishQuery;
    end;

    try
      loop:
      GetServiceSoap.trDown(vFirstRow,
                            12, // 푸드:11, 오렌지:12
                            Common.CompanyCode,
                            Common.CustomerNo,
                            'select   COUNT(*) '
                           +'from     MEM100M '
                           +'where    COMP_CODE   =:P0 '
                           +Ifthen(MemberCheckBox.Checked, 'and :P1 = :P1', '  and  UPJANG_CODE =:P1 '),
                            '',
                            'S',
                            vResult,
                            vTempData,
                            vParamsType,
                            vResultStr);
      if not vResult and (vResultStr = EmptyStr) then goto loop;
      if not vResult then
      begin
         MsgBox(vResultStr);
         Exit;
      end;
    except
      on E: Exception do
      begin
        MsgBox(E.Message);
        Exit;
      end;
    end;

    if not AskBox(Format('서버에 %d명 로컬에 %d명의 회원이 있습니다'+#13+'계속하시겠습니까?',[StrToInt(vTempData), vCount])) then Exit;

    if not AskBox('서버에 회원정보를 다운로드 받으면'+#13+'현재 로컬DB의 회원정보는 모두 삭제됩니다'+#13#13+'계속하시겠습니까?') then Exit;

    vCount    := StrToInt(vTempData);
    vData     := EmptyStr;
    vFirstRow := 0;

    while true do
    begin
      try
        loop1:
        GetServiceSoap.trDown(vFirstRow,
                              12, // 푸드:11, 오렌지:12
                              CompanyCode,
                              CustomerNo,
                              'select T1.MEMBER_NO, '
                             +'       T1.MEMBER_NAME, '
                             +'       T1.MEMBER_GUBUN, '
                             +'       T1.CARD_NO, '
                             +'       T1.ID_NO, '
                             +'       T1.SEX, '
                             +'       T1.BIRTHDAY, '
                             +'       T1.LUNAR_YN, '
                             +'       T1.WEDDING_DATE, '
                             +'       T1.HOME_TEL, '
                             +'       T1.HP, '
                             +'       T1.POST_NO, '
                             +'       T1.ADDRESS1, '
                             +'       T1.ADDRESS2, '
                             +'       T1.REG_DATE, '
                             +'       T1.TRUST_YN, '
                             +'       T1.EMAIL, '
                             +'       T1.NEWS_YN, '
                             +'       T1.USE_YN, '
                             +'       T1.REMARK, '
                             +'       T1.CASHRCP_NO, '
                             +'       T1.COURSE_CODE, '
                             +'       T1.LOCAL_CODE, '
                             +'       T1.DAMDANG_SAWON, '
                             +'       T1.LAST_VISIT_DATE, '
                             +'       T1.SALE_AMT, '
                             +'       T1.VISIT_COUNT, '
                             +'       T2.SAVE_POINT-T2.USE_POINT as TOT_POINT '
                             +'from   MEM100M T1 LEFT OUTER JOIN '
                             +'       PNT300M T2 ON T1.COMP_CODE = T2.COMP_CODE AND T1.MEMBER_NO = T2.MEMBER_NO  '
                             +'where  T1.COMP_CODE   =:P0 '
                             +Ifthen(MemberCheckBox.Checked, 'and :P1 = :P1 ', '  and  T1.UPJANG_CODE =:P1 ')
                             +'order by T1.MEMBER_NO ',
                              '',
                              '',
                              vResult,
                              vTempData,
                              vParamsType,
                              vResultStr);
        if not vResult and (vResultStr = EmptyStr) then goto loop1;
      except
        on E: Exception do
        begin
          MsgBox(E.Message);
          Exit;
        end;
      end;
      if vResult then
        vData := vData + vTempData
      else
      begin
        MsgBox(vResultStr);
        Break;
      end;
      if vFirstRow = -1 then
        Break;

      MemberDownLoadButton.Caption := '회원정보 다운로드'+#13+FormatFloat('#,0', vFirstRow)+'/'+FormatFloat('#,0', vCount);
      Application.ProcessMessages;
    end;

    if vData = EmptyStr then Exit;

    vSeq := 0;

    MemberDownLoadButton.Caption := '회원정보 다운로드'+#13+'저장 중';
    Application.ProcessMessages;
    try
      BeginTrans;
      Screen.Cursor := crHourGlass;

      ExecQuery('delete '
               +'  from SL_PNT_OCCUR '
               +' where CD_STORE =:P0',
               [StoreCode], false);

      ExecQuery('delete '
               +'  from SL_PNT_PAY '
               +' where CD_STORE =:P0',
               [StoreCode], false);

      ExecQuery('delete '
               +'  from MS_MEMBER '
               +' where CD_STORE =:P0',
               [StoreCode], false);

      ExecQuery('delete '
               +'  from MS_MEMBER_HIST '
               +' where CD_STORE =:P0',
               [StoreCode], false);

      vRow := TStringList.Create;
      vCol := TStringList.Create;
      vSQL := TStringList.Create;
      vTempSQL := EmptyStr;
      vCount   := 0;
      Split(vData, splitRecord, vRow);
      SetLength(vMemberData, vRow.Count, 32);
      for vI := 0 to vRow.Count-1 do
      begin
        Split(vRow[vI], splitColumn, vCol);

        for vJ := 0 to 27 do
        begin
          case vJ of
            18 : vMemberData[vI, vJ+1] := Ifthen(vCol[vJ]='Y','0','1');
            25,26 : vMemberData[vI, vJ+1] := Ifthen(vCol[vJ]='','0',vCol[vJ]);
            14    : vMemberData[vI, vJ+1] := Ifthen(Length(vCol[vJ])=8, vCol[vJ], '');
            27    : vMemberData[vI, 31]   := vCol[vJ];
            else
              vMemberData[vI, vJ+1] := vCol[vJ];
          end;
          if vJ = 9 then
            vMemberData[vI, 28] := RightStr(vCol[vJ],4);
          if vJ = 10 then
            vMemberData[vI, 29] := RightStr(vCol[vJ],4);
        end;

        vTempSQL := vTempSQL + Ifthen(vTempSQL <> '', ' union all ', '')+
                                   Format('select ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', '
                                               +' ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %s, %s, ''%s'', ''%s'' ',
                                          [StoreCode,
                                           vMemberData[vI, 1],
                                           vMemberData[vI, 2],
                                           vMemberData[vI, 3],
                                           vMemberData[vI, 4],
                                           vMemberData[vI, 5],
                                           vMemberData[vI, 6],
                                           vMemberData[vI, 7],
                                           vMemberData[vI, 8],
                                           vMemberData[vI, 9],
                                           vMemberData[vI,10],
                                           vMemberData[vI,11],
                                           vMemberData[vI,12],
                                           vMemberData[vI,13],
                                           vMemberData[vI,14],
                                           vMemberData[vI,15],
                                           vMemberData[vI,16],
                                           vMemberData[vI,17],
                                           vMemberData[vI,18],
                                           vMemberData[vI,19],
                                           vMemberData[vI,20],
                                           vMemberData[vI,21],
                                           vMemberData[vI,22],
                                           vMemberData[vI,23],
                                           vMemberData[vI,24],
                                           vMemberData[vI,25],
                                           vMemberData[vI,26],
                                           vMemberData[vI,27],
                                           vMemberData[vI,28],
                                           vMemberData[vI,29]]);
        Inc(vCount);
        if vCount > 500 then
        begin
           vSQL.Add(vTempSQL);
           vTempSQL := EmptySTr;
           vCount   := 0;
        end;
      end;
      if vTempSQL <> EmptySTr then
        vSQL.Add(vTempSQL);

      for vIndex := 0 to vSQL.Count-1 do
      begin
        SQL.SQL.Text := 'insert into MS_MEMBER(CD_STORE, '
                       +'                      CD_MEMBER, '
                       +'                      NM_MEMBER, '
                       +'                      DS_MEMBER, '
                       +'                      NO_CARD, '
                       +'                      NO_JUMIN, '
                       +'                      DS_SEX, '
                       +'                      YMD_BIRTH, '
                       +'                      YN_LUNAR, '
                       +'                      YMD_MARRI, '
                       +'                      TEL_HOME, '
                       +'                      TEL_MOBIL, '
                       +'                      NO_POST, '
                       +'                      ADDR1, '
                       +'                      ADDR2, '
                       +'                      YMD_ISU, '
                       +'                      YN_TRUST, '
                       +'                      NM_EMAIL, '
                       +'                      YN_NEWS, '
                       +'                      DS_STATUS, '
                       +'                      REMARK, '
                       +'                      NO_CASHRCP, '
                       +'                      CD_COURSE, '
                       +'                      CD_LOCAL, '
                       +'                      CD_DAMDANG, '
                       +'                      YMD_VISIT, '
                       +'                      AMT_SALE, '
                       +'                      CNT_VISIT, '
                       +'                      TEL_HOME_SHORT, '
                       +'                      TEL_MOBILE_SHORT) '
                       + vSQL.Strings[vIndex];
        SQL.Execute;
      end;

      SQL.SQL.Text := 'update MS_MEMBER '
                     +'   set TEL_HOME         = dbo.Encrypt(TEL_HOME, 5968,4171,4921), '
                     +'       TEL_MOBIL        = dbo.Encrypt(TEL_MOBIL, 5968,4171,4921), '
                     +'       TEL_HOME_SHORT   = dbo.Encrypt(TEL_HOME_SHORT, 5968,4171,4921), '
                     +'       TEL_MOBILE_SHORT = dbo.Encrypt(TEL_MOBILE_SHORT, 5968,4171,4921), '
                     +'       CHOSUNG          = dbo.GetChosung(NM_MEMBER), '
                     +'       PRG_INSERT       = ''ASP'', '
                     +'       PRG_CHANGE       = ''ASP'', '
                     +'       CD_SAWON_CHG     = '''+UserCode+'''';
      SQL.Execute;

      vSQL.Clear;
      vTempSQL := EmptyStr;
      vCount   := 1;
      vSeq     := 1;
      for vIndex := 0 to High(vMemberData) do
      begin
        if StrToIntDef(vMemberData[vIndex, 31],0) > 0 then
        begin
          vTempSQL := vTempSQL + Ifthen(vTempSQL <> '', ' union all ', '')+
                                     Format('select ''%s'', ''%s'', %d, ''%s'', ''001'', %s, ''기초 포인트(ASP 백업데이터 복원)'', ''%s'', GetDate(), 0 ',
                                            [StoreCode,
                                             FormatDateTime('yyyymmdd',Now),
                                             vSeq,
                                             vMemberData[vIndex, 1],
                                             vMemberData[vIndex, 31],
                                             UserCode]);
          Inc(vCount);
          Inc(vSeq);
          if vCount > 500 then
          begin
             vSQL.Add(vTempSQL);
             vTempSQL := EmptySTr;
             vCount   := 0;
          end;
        end;
      end;
      if vTempSQL <> EmptySTr then
        vSQL.Add(vTempSQL);

      for vIndex := 0 to vSQL.Count-1 do
      begin
        SQL.SQL.Text := 'insert into SL_PNT_OCCUR(CD_STORE, YMD_OCCUR, SEQ, CD_MEMBER, CD_CODE, PNT_CASH, REMARK, CD_SAWON_CHG, DT_CHANGE, DS_TRANS) '
                       +vSQL.Strings[vIndex];
        SQL.Execute;
      end;

      SQL.SQL.Text := 'update MS_MEMBER '
                     +'   set OCCUR_POINT         = p.PNT_CASH, '
                     +'       TOTAL_POINT         = p.PNT_CASH '
                     +'  from MS_MEMBER inner join '
                     +'       SL_PNT_OCCUR as p on p.CD_STORE = MS_MEMBER.CD_STORE and p.CD_MEMBER = MS_MEMBER.CD_MEMBER ';
      SQL.Execute;


      CommitTrans;
      MemberDownLoadButton.Caption := '회원정보 다운로드';
      MsgBox('회원 다운로드를 완료하였습니다');
    except
      on E: Exception do
      begin
        RollBackTrans;
        MsgBox(E.Message +#13+ vCol[1]);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TSystemASPTransForm.AllDownLoadButtonClick(Sender: TObject);
begin
  inherited;
  with TIdTCPClient.Create(Application) do
  begin
    Host := DBIP;
    Port := 7003;
    try
      try
        ConnectTimeout := 500;
        Connect;
        DM.ExecQuery('update MS_STORE set DT_TRANS = convert(datetime, ''2000-01-01 01:10:01'')',[]);
        Socket.WriteLnRFC((Sender as TcxButton).Hint +#3, IndyTextEncoding_OSDefault);
        Socket.ReadLn(IndyTextEncoding_OSDefault);
      except
        MsgBox('TR 프로그램이 실행 중 인지 확인하세요');
      end;
    finally
      Disconnect;
      Free;
    end;
  end;
end;

procedure TSystemASPTransForm.CodeUploadButtonClick(Sender: TObject);
var vSQL :String;
begin
  inherited;
  vSQL := ' set DS_TRANS = 0 where CD_STORE ='''+StoreCode+'''';
  try
    BeginTrans;
    DM.ExecQuery('update MS_CODE'+vSQL,[], false);
    DM.ExecQuery('update MS_SAWON'+vSQL,[], false);
    DM.ExecQuery('update MS_STORE set DT_TRANS = convert(datetime, ''1900-01-01 01:01:01'') ',[], false);
    DM.ExecQuery('update MS_MENU_CLASS'+vSQL,[], false);
    DM.ExecQuery('update MS_TABLE'+vSQL,[], false);
    DM.ExecQuery('update MS_MEMBER'+vSQL,[], false);
    DM.ExecQuery('update MS_MENU'+vSQL,[], false);
    CommitTrans;
  except
    on E: Exception do begin
    RollBackTrans;
    ErrBox(E.Message);
    end;
  end;
end;

procedure TSystemASPTransForm.AcctUpLoadButtonClick(Sender: TObject);
var vSQL :String;
begin
  inherited;
  vSQL := ' set DS_TRANS = 0 where CD_STORE ='''+StoreCode+'''';
  try
    BeginTrans;
    DM.ExecQuery('update SL_ACCT'+vSQL,[], false);
    DM.ExecQuery('update SL_SAWONWORK'+vSQL,[], false);
    CommitTrans;
  except
    on E: Exception do begin
    RollBackTrans;
    ErrBox(E.Message);
    end;
  end;
end;

procedure TSystemASPTransForm.SaleUpLoadButtonClick(Sender: TObject);
var vSQL :String;
begin
  inherited;
  with TProxyCheckForm.Create(self) do
    try
      if ShowModal <> mrOK then
        Exit;
    finally
      Free;
    end;
  if not AskBox('매출데이터가 많으면 시간이 오래 걸릴 수 있습니다'+#13#13+'계속하시겠습니까?') then Exit;

  vSQL := ' set DS_TRANS = 0 where CD_STORE ='''+StoreCode+'''';
  try
    BeginTrans;
    DM.ExecQuery('update SL_SALE_H'+vSQL + ' and YMD_SALE between :P0 and :p1 ',
                 [DtoS(TransFromDateEdit.Date),
                  DtoS(TransToDateEdit.Date)], false);

    DM.ExecQuery('update SL_DELIVERY'+vSQL + ' and YMD_DELIVERY between :P0 and :p1 ',
                 [DtoS(TransFromDateEdit.Date),
                  DtoS(TransToDateEdit.Date)], false);

    DM.ExecQuery('update SL_PNT_OCCUR'+vSQL + ' and YMD_OCCUR between :P0 and :p1 ',
                 [DtoS(TransFromDateEdit.Date),
                  DtoS(TransToDateEdit.Date)], false);

    DM.ExecQuery('update SL_PNT_PAY'+vSQL+ ' and YMD_PAY between :P0 and :p1 ',
                 [DtoS(TransFromDateEdit.Date),
                  DtoS(TransToDateEdit.Date)], false);

    DM.ExecQuery('update SL_CASHIER_MGM'+vSQL+ ' and YMD_CLOSE between :P0 and :p1 ',
                 [DtoS(TransFromDateEdit.Date),
                  DtoS(TransToDateEdit.Date)], false);

    DM.ExecQuery('update SL_POSCLOSE'+vSQL + ' and YMD_CLOSE between :P0 and :p1 ',
                 [DtoS(TransFromDateEdit.Date),
                  DtoS(TransToDateEdit.Date)], false);

    CommitTrans;
  except
    on E: Exception do begin
    RollBackTrans;
    ErrBox(E.Message);
    end;
  end;
end;

end.
