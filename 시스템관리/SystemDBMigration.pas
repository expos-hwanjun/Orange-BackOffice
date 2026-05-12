unit SystemDBMigration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Data.DB, dxmdaset, Vcl.ExtCtrls, cxStyles, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, Vcl.StdCtrls, cxGroupBox, cxMemo, MemDS, DBAccess,
  Uni, StrUtils, cxSpinEdit, DateUtils, ShellApi, DAScript, UniScript, AdvProgr,
  cxProgressBar, cxCheckBox, OracleUniProvider, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TSystemDBMigrationForm = class(TInheritForm)
    cxGroupBox2: TcxGroupBox;
    DBGroupBox: TcxGroupBox;
    cxLabel3: TcxLabel;
    DataBaseNameEdit: TcxTextEdit;
    cxLabel10: TcxLabel;
    DbUserEdit: TcxTextEdit;
    cxLabel11: TcxLabel;
    DbUserPassEdit: TcxTextEdit;
    DBCheckButton: TAdvGlowButton;
    cxLabel6: TcxLabel;
    DBIPEdit: TcxTextEdit;
    WorkMemo: TcxMemo;
    Connection: TUniConnection;
    PosQuery: TUniQuery;
    Label6: TLabel;
    Label7: TLabel;
    SaleButton: TAdvGlowButton;
    SaleSpinEdit: TcxSpinEdit;
    Label8: TLabel;
    SaleDateEdit: TcxDateEdit;
    DBPortEdit: TcxTextEdit;
    Script: TUniScript;
    WorkProgress: TProgressBar;
    Label10: TLabel;
    YearSpinEdit: TcxSpinEdit;
    Label11: TLabel;
    cxGroupBox4: TcxGroupBox;
    PointButton: TAdvGlowButton;
    cxGroupBox1: TcxGroupBox;
    MigrationButton: TAdvGlowButton;
    Label1: TLabel;
    Label2: TLabel;
    MemberExistsCheckBox: TcxCheckBox;
    OraConnection: TUniConnection;
    OraQuery: TUniQuery;
    AspGroupBox: TcxGroupBox;
    OraCheckBox: TcxCheckBox;
    Label3: TLabel;
    CompCodeEdit: TcxTextEdit;
    Label4: TLabel;
    UpjangCodeEdit: TcxTextEdit;
    procedure MigrationButtonClick(Sender: TObject);
    procedure SaleButtonClick(Sender: TObject);
    procedure DBCheckButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PointButtonClick(Sender: TObject);
  private
    BeginDate :TDateTime;
    function  GetColum(aTableName:String):String;
    function  GetColumOra(aTableName:String):String;
    function  SetMigration(aTableName:String; aDelete:Boolean=true):Boolean;
    procedure SetBeginDate;
    function  PosOpenQuery(aSQL: string; aParam: array of Variant): Boolean;
    function  PointMonthClose(aMonth:String):Boolean;

    function  PosOpenQuery_Ora(aSQL: string; aParam: array of Variant): Boolean;
    function  SetMigration_Ora(aTableName:String; aDelete:Boolean=true):Boolean;

  public
    { Public declarations }
  end;

var
  SystemDBMigrationForm: TSystemDBMigrationForm;

const PosStoreCode ='0001';
implementation
uses Common, DBModule, Help, ProxyCheck;

{$R *.dfm}



procedure TSystemDBMigrationForm.DBCheckButtonClick(Sender: TObject);
var vjsonDBURL :String;
begin
  inherited;
  try
    Connection.ProviderName := 'SQL Server';
    Connection.Server   := DBIPEdit.Text;
    Connection.Port     := StrToIntDef(DBPortEdit.Text, 1433);
    Connection.Database := DataBaseNameEdit.Text;
    Connection.Username := DbUserEdit.Text;
    Connection.Password := DbUserPassEdit.Text;
    Connection.Connect;

    if OraCheckBox.Checked and not OraConnection.Connected then
      OraConnection.Connect;


    if LeftStr(StoreCode,2) <> 'TT' then
      with TProxyCheckForm.Create(self) do
        try
          if ShowModal <> mrOK then
            Exit;
        finally
          Free;
        end;

    DBCheckButton.Enabled   := true;
    MigrationButton.Enabled := true;
    PointButton.Enabled     := true;
    SetBeginDate;
    YearSpinEdit.Value := YearsBetween(Now(), SaleDateEdit.Date);
    BeginDate          := SaleDateEdit.Date;
    ShowMsg('DB 정상연결');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TSystemDBMigrationForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if not Self.Enabled then Exit;
  if (Key = VK_F4) and SaleButton.Enabled then
    SaleButton.Click;
  if Shift = [ssCtrl] then
  begin
    if (Key = Ord('a')) or (Key = Ord('A')) then
      AspGroupBox.Visible := true;
  end;
end;

function TSystemDBMigrationForm.SetMigration(aTableName:String; aDelete:Boolean): Boolean;
var vSQL, vInsertSQL, vTemp, vData :String;
    vCount, vCol :Integer;
begin
  WorkMemo.Lines.Add(Format('%S.... 이관 중...',[aTableName]));
  WorkProgress.Position := 0;
  Application.ProcessMessages;
  if aDelete then
  begin
    vSQL := Format('delete from %s where CD_HEAD = ''%s'' and CD_STORE = ''%s'';',[aTableName, HeadStoreCode, StoreCode]);
    ExecQuery(vSQL,[],true);
  end;

  if PosQuery.Eof then
  begin
    WorkMemo.Lines.Add(Format('%S.... 이관 완료',[aTableName]));
    PosQuery.Close;
    Result := true;
    Exit;
  end;

  try
    WorkProgress.Max := PosQuery.RecordCount;
    vInsertSQL := GetColum(aTableName);
    vCount := 0;
    while not PosQuery.Eof do
    begin
      vSQL   := '';
      for vCol := 0 to PosQuery.FieldCount-1 do
      begin
        case PosQuery.Fields[vCol].DataType of
          Data.DB.ftSmallint,
          Data.DB.ftInteger,
          Data.DB.ftWord,
          Data.DB.ftShortint   :
          begin
            if PosQuery.Fields[vCol].Value = null then
              vSQL := vSQL + 'null,'
            else
              vSQL := vSQL + Format('%d,',[PosQuery.Fields[vCol].AsInteger]);
          end;
          Data.DB.ftFloat,
          Data.DB.ftCurrency,
          Data.DB.ftExtended   :
          begin
            if PosQuery.Fields[vCol].Value = null then
              vSQL := vSQL + 'null,'
            else
              vSQL := vSQL + Format('%s,',[FloatToStr(PosQuery.Fields[vCol].AsCurrency)]);
          end;
          Data.DB.ftDate,
          Data.DB.ftTime,
          Data.DB.ftDateTime    :
          begin
            if FormatDateTime('yyyymmdd',PosQuery.Fields[vCol].AsDateTime) < '20000101' then
              vSQL := vSQL + 'null,'
            else
              vSQL := vSQL + Format('Cast(''%s'' as DateTime),',[FormatDateTime('yyyy-mm-dd hh:nn:ss',PosQuery.Fields[vCol].AsDateTime)]);
          end;
          Data.DB.ftBlob : vSQL := vSQL + Format('''%s'',',['']);
          else
          begin
            if (aTableName = 'MS_MEMBER') and ((UpperCase(PosQuery.Fields[vCol].FieldName) = 'TEL_MOBILE')
                                               or (UpperCase(PosQuery.Fields[vCol].FieldName) = 'TEL_HOME')
                                               or (UpperCase(PosQuery.Fields[vCol].FieldName) = 'TEL_MOBILE_SHORT')
                                               or (UpperCase(PosQuery.Fields[vCol].FieldName) = 'TEL_HOME_SHORT')) then
             vSQL := vSQL + Format('AES_Encrypt(''%s'',71483),',[PosQuery.Fields[vCol].AsString])
            else if PosQuery.Fields[vCol].Value = null then
            begin
              vSQL := vSQL + 'null,';//Format('''%s'',',[vTemp]);
            end
            else
            begin
              vTemp := Replace(PosQuery.Fields[vCol].AsString,';','');
              vTemp := Replace(vTemp,'''','');

              vSQL := vSQL + Format('''%s'',',[vTemp]);
            end;
          end;
        end;
      end;
      vSQL := '('+LeftStr(vSQL, Length(vSQL)-1) + '),';
      vData := vData + vSQL;
      Inc(vCount);
      if vCount = 1000 then
      begin
        vSQL := vInsertSQL + LeftStr(vData, Length(vData)-1) + ';';
        if not ExecQuery(vSQL,[],true) then
        begin
          MsgBox('다시 요청합니다.');
          ExecQuery(vSQL,[],true);
        end;
        vData  := '';
        vCount := 0;
      end;
      WorkProgress.Position := WorkProgress.Position +1 ;
      PosQuery.Next;
    end;
  finally
    PosQuery.Options.QueryRecCount := false;
  end;

  if vData <> '' then
  begin
    vSQL := vInsertSQL + LeftStr(vData, Length(vData)-1) + ';';
    if not ExecQuery(vSQL,[],true) then
    begin
      MsgBox('다시 요청합니다.');
      ExecQuery(vSQL,[],true);
    end;
  end;
  PosQuery.Close;
  WorkMemo.Lines.Add(Format('%S.... 이관완료',[aTableName]));
  WorkProgress.Position := 0;
end;

function TSystemDBMigrationForm.SetMigration_Ora(aTableName:String; aDelete:Boolean): Boolean;
var vSQL, vInsertSQL, vTemp, vData :String;
    vCount, vCol :Integer;
begin
  WorkMemo.Lines.Add(Format('%S.... 이관 중...',[aTableName]));
  WorkProgress.Position := 0;
  Application.ProcessMessages;
  if aDelete then
  begin
    vSQL := Format('delete from %s where CD_HEAD = ''%s'' and CD_STORE = ''%s'';',[aTableName, HeadStoreCode, StoreCode]);
    ExecQuery(vSQL,[],true);
  end;

  if OraQuery.Eof then
  begin
    WorkMemo.Lines.Add(Format('%S.... 이관 완료',[aTableName]));
    OraQuery.Close;
    Result := true;
    Exit;
  end;

  try
    WorkProgress.Max := OraQuery.RecordCount;
    vInsertSQL := GetColumOra(aTableName);
    vCount := 0;
    while not OraQuery.Eof do
    begin
      vSQL   := '';
      for vCol := 0 to OraQuery.FieldCount-1 do
      begin
        case OraQuery.Fields[vCol].DataType of
          Data.DB.ftSmallint,
          Data.DB.ftInteger,
          Data.DB.ftWord,
          Data.DB.ftShortint   :
          begin
            if OraQuery.Fields[vCol].Value = null then
              vSQL := vSQL + 'null,'
            else
              vSQL := vSQL + Format('%d,',[OraQuery.Fields[vCol].AsInteger]);
          end;
          Data.DB.ftFloat,
          Data.DB.ftCurrency,
          Data.DB.ftExtended   :
          begin
            if OraQuery.Fields[vCol].Value = null then
              vSQL := vSQL + 'null,'
            else
              vSQL := vSQL + Format('%s,',[FloatToStr(OraQuery.Fields[vCol].AsCurrency)]);
          end;
          Data.DB.ftDate,
          Data.DB.ftTime,
          Data.DB.ftDateTime    :
          begin
            if FormatDateTime('yyyymmdd',OraQuery.Fields[vCol].AsDateTime) < '20000101' then
              vSQL := vSQL + 'null,'
            else
              vSQL := vSQL + Format('Cast(''%s'' as DateTime),',[FormatDateTime('yyyy-mm-dd hh:nn:ss',OraQuery.Fields[vCol].AsDateTime)]);
          end;
          Data.DB.ftBlob : vSQL := vSQL + Format('''%s'',',['']);
          else
          begin
            if OraQuery.Fields[vCol].Value = null then
            begin
              vSQL := vSQL + 'null,';//Format('''%s'',',[vTemp]);
            end
            else
            begin
              vTemp := Replace(OraQuery.Fields[vCol].AsString,';','');
              vTemp := Replace(vTemp,'''','');

              vSQL := vSQL + Format('''%s'',',[vTemp]);
            end;
          end;
        end;
      end;
      vSQL := '('+LeftStr(vSQL, Length(vSQL)-1) + '),';
      vData := vData + vSQL;
      Inc(vCount);
      if vCount = 1000 then
      begin
        vSQL := vInsertSQL + LeftStr(vData, Length(vData)-1) + ';';
        if not ExecQuery(vSQL,[],true) then
        begin
          MsgBox('다시 요청합니다.');
          ExecQuery(vSQL,[],true);
        end;
        vData  := '';
        vCount := 0;
      end;
      WorkProgress.Position := WorkProgress.Position +1 ;
      OraQuery.Next;
    end;
  finally
    OraQuery.Options.QueryRecCount := false;
  end;

  if vData <> '' then
  begin
    vSQL := vInsertSQL + LeftStr(vData, Length(vData)-1) + ';';
    if not ExecQuery(vSQL,[],true) then
    begin
      MsgBox('다시 요청합니다.');
      ExecQuery(vSQL,[],true);
    end;
  end;
  OraQuery.Close;
  WorkMemo.Lines.Add(Format('%S.... 이관완료',[aTableName]));
  WorkProgress.Position := 0;
end;


function TSystemDBMigrationForm.GetColum(aTableName:String): String;
var vCol :Integer;
begin
  Result := '';
  for vCol := 0 to PosQuery.FieldCount-1 do
    Result := Result + Format('%s,',[PosQuery.Fields[vCol].FieldName]);

  Result := 'insert into '+aTableName+' ('+LeftStr(Result,Length(Result)-1)+') values ';
end;

function TSystemDBMigrationForm.GetColumOra(aTableName:String): String;
var vCol :Integer;
begin
  Result := '';
  for vCol := 0 to OraQuery.FieldCount-1 do
    Result := Result + Format('%s,',[OraQuery.Fields[vCol].FieldName]);

  Result := 'insert into '+aTableName+' ('+LeftStr(Result,Length(Result)-1)+') values ';
end;

procedure TSystemDBMigrationForm.MigrationButtonClick(Sender: TObject);
var vTemp :String;
    vOptions :String;
begin
  inherited;
  OpenQuery('select ALLOW_POS, '
           +'       ALLOW_KIOSK '
           +'  from CUSTOMER '
           +' where CD_COMPANY  =:P0 '
           +'   and CD_CUSTOMER =:P1 ',
           [HeadStoreCode,
            StoreCode],false, RestBaseURL);

  AllowPos   := Query.Fields[0].AsInteger;
  AllowKiosk := Query.Fields[1].AsInteger;
  Query.Close;

  PosOpenQuery('select  Count(*) as CNT '
              +'  from  MS_CODE '
              +' where  CD_STORE  = :P0 '
              +'   and  CD_KIND   = ''01'' '
              +'   and  DS_STATUS = ''0'' '
              +'   and  NM_CODE3 in (''0'',''1'',''4'',''5'') ',
              [PosStoreCode]);

  if (PosQuery.Fields[0].AsInteger-1) > AllowPos then
  begin
    PosQuery.Close;
    ErrBox('포스 수량이 부족합니다');
    Exit;
  end;
  PosQuery.Close;

  PosOpenQuery('select  Count(*) as CNT '
              +'  from  MS_CODE '
              +' where  CD_STORE  = :P0 '
              +'   and  CD_KIND   = ''01'' '
              +'   and  DS_STATUS = ''0'' '
              +'   and  NM_CODE3  = ''2'' ',
              [PosStoreCode]);

  if PosQuery.Fields[0].AsInteger > AllowKiosk then
  begin
    PosQuery.Close;
    ErrBox('키오스크 수량이 부족합니다');
    Exit;
  end;
  PosQuery.Close;


  WorkMemo.Clear;
  Self.Enabled  := false;
  WorkProgress.Visible := true;
  try
    PosOpenQuery('select  :P1 as CD_HEAD,  :P2 as CD_STORE, CD_KIND,   CD_CODE,    '
                +'         NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  '
                +'         case when CD_KIND = ''01'' then  dbo.Decrypt(NM_CODE6, 5869,29486,4921) else NM_CODE6 end as NM_CODE6, '
                +'         NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
                +'         NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, '
                +'         NM_CODE21, NM_CODE22, NM_CODE23, NM_CODE24, NM_CODE25, NM_CODE26, NM_CODE27, NM_CODE28, NM_CODE29, NM_CODE30, '
                +'         NM_CODE31, NM_CODE32, NM_CODE33, NM_CODE34, NM_CODE35, DS_STATUS '
                +'  from   MS_CODE '
                +' where   CD_STORE = :P0 '
                +'   and   CD_KIND  in (''01'',''02'',''03'',''04'',''05'',''06'',''07'',''08'',''10'',''11'',''12'',''13'',''14'',''15'',''18'',''19'',''20'', '
                +'                      ''23'',''24'',''25'',''27'',''30'',''31'',''32'',''81'',''82'',''83'') ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  not in (''71'',''72'',''84'',''85'',''87'',''86'',''95'',''96'');',
             [HeadStoreCode,
              StoreCode],true);
    SetMigration('MS_CODE', false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''19'';',
             [HeadStoreCode,
              StoreCode,
              '09'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''18'';',
             [HeadStoreCode,
              StoreCode,
              '16'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''20'';',
             [HeadStoreCode,
              StoreCode,
              '17'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''27''; ',
             [HeadStoreCode,
              StoreCode,
              '19'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''23'';',
             [HeadStoreCode,
              StoreCode,
              '20'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''24'';',
             [HeadStoreCode,
              StoreCode,
              '21'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''25''; ',
             [HeadStoreCode,
              StoreCode,
              '22'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''30''; ',
             [HeadStoreCode,
              StoreCode,
              '23'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''31''; ',
             [HeadStoreCode,
              StoreCode,
              '24'],false);

    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2; '
             +'update MS_CODE '
             +'   set CD_KIND  = :P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''32''; ',
             [HeadStoreCode,
              StoreCode,
              '25'],false);

    //주방프린터 하단여백
    ExecQuery('update MS_CODE '
             +'   set NM_CODE4 = ''1'', '
             +'       NM_CODE15= ''3'' '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2;',
             [HeadStoreCode,
              StoreCode,
              '02'],false);

    //회원구분
    ExecQuery('update MS_CODE '
             +'   set NM_CODE17= ''1'' '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2;',
             [HeadStoreCode,
              StoreCode,
              '05'],false);
    //외상대금결제코드
    ExecQuery('update MS_CODE '
             +'   set NM_CODE3 = ''2'' '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2 '
             +'   and NM_CODE2 = ''0'';',
             [HeadStoreCode,
              StoreCode,
              '11'],false);

    ExecQuery('update MS_CODE '
             +'   set NM_CODE17 =''1'' '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2 '
             +'   and CD_CODE  = :P3;',
             [HeadStoreCode,
              StoreCode,
              '87',
              '300'],true);

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_MENU, '
                +'       NM_MENU, '
                +'       NM_MENU_SHORT, '
                +'       DS_MENU_TYPE, '
                +'       PR_BUY, '
                +'       PR_SALE, '
                +'       DS_TAX, '
                +'       CD_CLASS, '
                +'       CD_TRDPL, '
                +'       CD_PRINTER, '
                +'       NO_GROUP, '
                +'       NO_MENU, '
                +'       BILL_SEQ, '
                +'       SAVE_STAMP, '
                +'       USE_STAMP, '
                +'       DS_KITCHEN, '
                +'       QTY_SELECT, '
                +'       dbo.RPAD(YN_DC+YN_POINT+YN_RCP+''0''+YN_BILL+YN_TABLECOLOR+YN_TICKET+''NNN'',30,''0'') as CONFIG, '
                +'       YN_USE '
                +'  from MS_MENU '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_MENU, '
                +'       CD_ITEM, '
                +'       DENSE_RANK() OVER(order by CD_MENU) as SEQ '
                +'  from MS_MENU_ITEM '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU_ITEM');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_MENU, '
                +'       CD_MEMO '
                +'  from MS_MENU_MEMO '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU_MEMO');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_MENU, '
                +'       CD_MENU_SET, '
                +'       QTY_SET, '
                +'       SEQ '
                +'  from MS_MENU_SET '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU_SET');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_MENU, '
                +'       CD_MENU_SET, '
                +'       QTY_SET, '
                +'       SEQ, '
                +'       ''clWhite'' as COLOR '
                +'  from MS_MENU_OPEN '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU_OPEN');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_MENU, '
                +'       CD_MENU_SET, '
                +'       QTY_SET, '
                +'       SEQ '
                +'  from MS_MENU_GROUP '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU_GROUP');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_MENU, '
                +'       NO_SEQ as COURSE_SEQ, '
                +'       SEQ, '
                +'       NM_SEQ  as NM_COURSE, '
                +'       CNT_SEQ as CNT_CHOOSE, '
                +'       CD_COURSE as CD_MENU_COURSE, '
                +'       YN_DEFAULT '
                +'  from MS_COURSE '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_COURSE');

    ExecQuery('update MS_COURSE inner join '
             +'       MS_MENU as m ON m.CD_HEAD = MS_COURSE.CD_HEAD AND m.CD_STORE = MS_COURSE.CD_STORE AND m.CD_MENU = MS_COURSE.CD_MENU_COURSE '
             +'   set MS_COURSE.NM_MENU_COURSE = m.NM_MENU '
             +' where MS_COURSE.CD_HEAD  =:P0 '
             +'   and MS_COURSE.CD_STORE =:P1;',
             [HeadStoreCode,
              StoreCode],false);

    ExecQuery('update MS_COURSE '
             +'   set COLOR = ''clSkyBlue'' '
             +' where MS_COURSE.CD_HEAD  =:P0 '
             +'   and MS_COURSE.CD_STORE =:P1;',
             [HeadStoreCode,
              StoreCode],true);

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_CLASS, '
                +'       NM_CLASS '
                +'  from MS_MENU_CLASS '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU_CLASS');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_GUBUN, '
                +'       CD_LARGE, '
                +'       NM_LARGE, '
                +'       NO_POSITION, '
                +'       ''$00B55A00'' as COLOR '
                +'  from MS_LARGE '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_LARGE');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_GUBUN, '
                +'       CD_LARGE, '
                +'       CD_MENU, '
                +'       NM_VIEW, '
                +'       NO_POSITION, '
                +'       ''$00B55A00'' as COLOR '
                +'  from MS_SMALL '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_SMALL');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       NO_TABLE, '
                +'       SEQ, '
                +'       NO_FLOOR as CD_FLOOR, '
                +'       ''R'' as TABLE_STYLE, '
                +'       NM_TABLE, '
                +'       NO_LEFT, '
                +'       NO_TOP, '
                +'       NO_HEIGHT, '
                +'       NO_WIDTH, '
                +'       CLFACE as COLOR, '
                +'       CLNUMBER as NUMBER_COLOR, '
                +'       CLCAPTION   as FONT_COLOR, '
                +'       CLBORDER as BORDER_COLOR, '
                +'       ''$00400040'' as COLOR_HEX, '
                +'       ''$00865A00'' as NUMBER_COLOR_HEX, '
                +'       ''clWhite''   as FONT_COLOR_HEX, '
                +'       ''$00C08000'' as BORDER_COLOR_HEX, '
                +'       CD_GROUP, '
                +'       YN_PACKING '
                +'  from MS_TABLE '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_TABLE');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_SAWON, '
                +'       NM_SAWON, '
                +'       ''P'' as DS_SAWON, '
                +'       dbo.Decrypt(NO_PASSWORD, 5869,29486,4921) as NO_PASSWORD, '
                +'       CD_GRADE, '
                +'       CD_TIME_PAY, '
                +'       TEL_MOBIL as  TEL_MOBILE, '
                +'       EMP_WORK, '
                +'       ADDR1, '
                +'       ADDR2, '
                +'       YN_USE '
                +'  from MS_SAWON '
                +' where CD_STORE =:P0 '
                +'   and CD_SAWON <> ''master'' ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);

    ExecQuery('delete from MS_SAWON '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and DS_SAWON =''P'';',
             [HeadStoreCode,
              StoreCode],true);

    SetMigration('MS_SAWON',false);


    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       NM_BAEMIN, '
                +'       CD_MENU '
                +'  from MS_MENU_BAEMIN '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_MENU_BAEMIN');

    PosOpenQuery('select :P1 as CD_HEAD, '
                +'       :P2 as CD_STORE, '
                +'       CD_TRDPL,'
                +'       NM_TRDPL, '
                +'       NO_BIZER,'
                +'       NM_BOSS, '
                +'       NM_UPTAE,'
                +'       NM_JONGMOK,'
                +'       TEL_OFFICE,'
                +'       TEL_FAX,'
                +'       NM_DAMDANG,'
                +'       TEL_MOBILE,'
                +'       ADDR1,'
                +'       ADDR2,'
                +'       NM_EMAIL'
                +'  from MS_TRD '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('MS_TRD');

    if not MemberExistsCheckBox.Checked then
    begin
      PosOpenQuery('select :P1 as CD_HEAD, '
                  +'       :P2 as CD_STORE, '
                  +'       CD_MEMBER, '
                  +'       NM_MEMBER, '
                  +'       CHOSUNG, '
                  +'       DS_MEMBER, '
                  +'       dbo.Decrypt(TEL_MOBIL, 5869,29486,4921) as TEL_MOBILE, '
                  +'       dbo.Decrypt(TEL_HOME, 5869,29486,4921) as TEL_HOME, '
                  +'       dbo.Decrypt(TEL_MOBILE_SHORT, 5869,29486,4921) as TEL_MOBILE_SHORT, '
                  +'       dbo.Decrypt(TEL_HOME_SHORT, 5869,29486,4921) as TEL_HOME_SHORT, '
                  +'       NO_CARD, '
                  +'       NO_CASHRCP, '
                  +'       ADDR1, '
                  +'       ADDR2, '
                  +'       DS_SEX, '
                  +'       YMD_ISU, '
                  +'       NM_EMAIL, '
                  +'       YN_NEWS, '
                  +'       YMD_AGREE, '
                  +'       CD_SAWON_CHG, '
                  +'       DT_CHANGE, '
                  +'       DS_STATUS, '
                  +'       PRG_INSERT, '
                  +'       PRG_CHANGE '
                  +'  from MS_MEMBER '
                  +' where CD_STORE =:P0 ',
                  [PosStoreCode,
                   HeadStoreCode,
                   StoreCode]);

      ExecQuery('delete from MS_MEMBER '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1;'
               +'delete from MS_MEMBER_ETC '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1;'
               +'delete from MS_MEMBER_HIST '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1;',
               [HeadStoreCode,
                StoreCode],true);

      SetMigration('MS_MEMBER', false);

      PosOpenQuery('select :P1 as CD_HEAD, '
                  +'       :P2 as CD_STORE, '
                  +'       CD_MEMBER, '
                  +'       YMD_VISIT, '
                  +'       AMT_SALE, '
                  +'       CNT_VISIT, '
                  +'       YN_TRUST '
                  +'  from MS_MEMBER '
                  +' where CD_STORE =:P0 ',
                  [PosStoreCode,
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('MS_MEMBER_ETC', true);
    end;

    PosOpenQuery('select CONF, '
                +'       RCP_TITLE1, '
                +'       RCP_TITLE2, '
                +'       RCP_TITLE3, '
                +'       RCP_TITLE4, '
                +'       RCP_END1, '
                +'       RCP_END2, '
                +'       RCP_END3, '
                +'       BAEMIN_MENU, '
                +'       BALANCE_PREFIX, '
                +'       DEF_TIME, '
                +'       ADD_MENU, '
                +'       EACH_TIME, '
                +'       AMT_ADD, '
                +'       AMT_STAMP, '
                +'       CNT_STAMP, '
                +'       DC_UNIT, '
                +'       POINT_MIN, '
                +'       AMT_DEFREADY, '
                +'       CHECKSECOND as PRINTER_CHECKTIME, '
                +'       RED_HOUR, '
                +'       SEARCHRCP_PWD, '
                +'       POSRPT_PWD, '
                +'       WAIT_TEXT1, '
                +'       WAIT_TEXT2, '
                +'       WAIT_TEXT3, '
                +'       SELFGOODS_PREFIX, '
                +'       CARD_FEE, '
                +'       TIP_MENU, '
                +'       BOOKING_MENU, '
                +'       PREFIX, '
                +'       LEN_CARD, '
                +'       USE_MENU, '
                +'       JOINPOINTCODE, '
                +'       COUPON_PREFIX, '
                +'       DELIVERY_DEFADDR, '
                +'       DELIVERY_X, '
                +'       DELIVERY_Y, '
                +'       CNT_WAITTEL, '
                +'       DELIVERY_NUMBER, '
                +'       DELIVERY_MENU, '
                +'       DELIVERY_AMOUNT, '
                +'       DELIVERY_BOTTOM, '
                +'       DELIVERY_CAPTION, '
                +'       DELIVERY_COLOR1, '
                +'       DELIVERY_COLOR2, '
                +'       DELIVERY_COLOR3, '
                +'       DELIVERY_COLOR4, '
                +'       CUST_TITLE, '
                +'       KITCHEN_TITLE '
                +'  from MS_STORE '
                +' where CD_STORE =:P0 ',
                [PosStoreCode,
                 HeadStoreCode,
                 StoreCode]);

    ExecQuery('update MS_STORE '
             +'   set OPTIONS            =:P2, '
             +'       RCP_TITLE1         =:P3, '
             +'       RCP_TITLE2         =:P4, '
             +'       RCP_TITLE3         =:P5, '
             +'       RCP_TITLE4         =:P6, '
             +'       RCP_END1           =:P7, '
             +'       RCP_END2           =:P8, '
             +'       RCP_END3           =:P9, '
             +'       BAEMIN_MENU        =:P10, '
             +'       SCALE_PREFIX       =:P11, '
             +'       OVERTIME_TIME      =:P12, '
             +'       OVERTIME_MENU      =:P13, '
             +'       OVERTIME_EACH      =:P14, '
             +'       OVERTIME_AMT       =:P15, '
             +'       AMT_STAMP          =:P16, '
             +'       CNT_STAMP          =:P17, '
             +'       DC_UNIT            =:P18, '
             +'       POINT_MIN          =:P19, '
             +'       AMT_DEFREADY       =:P20, '
             +'       PRINTER_CHECKTIME  =:P21, '
             +'       RED_HOUR           =:P22, '
             +'       SEARCHRCP_PWD      =:P23, '
             +'       POSRPT_PWD         =:P24, '
             +'       WAIT_TEXT1         =:P25, '
             +'       WAIT_TEXT2         =:P26, '
             +'       WAIT_TEXT3         =:P27, '
             +'       SELFGOODS_PREFIX   =:P28, '
             +'       CARD_FEE           =:P29, '
             +'       TIP_MENU           =:P30, '     //28
             +'       BOOKING_MENU       =:P31, '
             +'       MEMBER_PREFIX      =:P32, '
             +'       LEN_CARD           =:P33, '      //31
             +'       USE_MENU           =:P34, '
             +'       JOINPOINTCODE      =:P35, '
             +'       COUPON_PREFIX      =:P36, '
             +'       DELIVERY_DEFADDR   =:P37, '      //35
             +'       DELIVERY_X         =:P38, '
             +'       DELIVERY_Y         =:P39, '
             +'       CNT_WAITTEL        =:P40, '      //38
             +'       DELIVERY_NUMBER    =:P41,'
             +'       DELIVERY_MENU      =:P42,'
             +'       DELIVERY_AMOUNT    =:P43,'
             +'       DELIVERY_BOTTOM    =:P44,'
             +'       DELIVERY_CAPTION   =:P45,'
             +'       DELIVERY_COLOR1    =:P46,'
             +'       DELIVERY_COLOR2    =:P47,'
             +'       DELIVERY_COLOR3    =:P48,'
             +'       DELIVERY_COLOR4    =:P49,'
             +'       CUST_TITLE         =:P50,'
             +'       KITCHEN_TITLE      =:P51 '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1;',
             [HeadStoreCode,
              StoreCode,
              PosQuery.Fields[0].AsString,
              PosQuery.Fields[1].AsString,
              PosQuery.Fields[2].AsString,
              PosQuery.Fields[3].AsString,
              PosQuery.Fields[4].AsString,
              PosQuery.Fields[5].AsString,
              PosQuery.Fields[6].AsString,
              PosQuery.Fields[7].AsString,
              PosQuery.Fields[8].AsString,
              PosQuery.Fields[9].AsString,
              PosQuery.Fields[10].AsInteger,
              PosQuery.Fields[11].AsString,
              PosQuery.Fields[12].AsInteger,
              PosQuery.Fields[13].AsInteger,
              PosQuery.Fields[14].AsInteger,
              PosQuery.Fields[15].AsInteger,
              PosQuery.Fields[16].AsInteger,
              PosQuery.Fields[17].AsInteger,
              PosQuery.Fields[18].AsInteger,
              PosQuery.Fields[19].AsInteger,
              PosQuery.Fields[20].AsInteger,
              PosQuery.Fields[21].AsString,
              PosQuery.Fields[22].AsString,
              PosQuery.Fields[23].AsString,
              PosQuery.Fields[24].AsString,
              PosQuery.Fields[25].AsString,
              PosQuery.Fields[26].AsString,
              PosQuery.Fields[27].AsCurrency,
              PosQuery.Fields[28].AsString,
              PosQuery.Fields[29].AsString,
              PosQuery.Fields[30].AsString,
              PosQuery.Fields[31].AsInteger,
              PosQuery.Fields[32].AsString,
              PosQuery.Fields[33].AsString,
              PosQuery.Fields[34].AsString,
              PosQuery.Fields[35].AsString,
              PosQuery.Fields[36].AsInteger,
              PosQuery.Fields[37].AsInteger,
              PosQuery.Fields[38].AsInteger,
              PosQuery.Fields[39].AsString,
              PosQuery.Fields[40].AsString,
              PosQuery.Fields[41].AsString,
              PosQuery.Fields[42].AsString,
              PosQuery.Fields[43].AsString,
              PosQuery.Fields[44].AsString,
              PosQuery.Fields[45].AsString,
              PosQuery.Fields[46].AsString,
              PosQuery.Fields[47].AsString,
              PosQuery.Fields[48].AsString,
              PosQuery.Fields[49].AsString],true);
    vOptions := PosQuery.Fields[0].AsString;
    PosQuery.Close;

    vOptions[8]  := '0';
    vOptions[23] := '0';
    vOptions[21] := vOptions[405];

    ExecQuery('update MS_STORE '
             +'   set OPTIONS  =:P2 '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1;',
             [HeadStoreCode,
              StoreCode,
              vOptions],true);

    WorkMemo.Lines.Add('------------이관완료-----------');

    SaleDateEdit.Date := IncDay(SaleDateEdit.Date, SaleSpinEdit.Value);
  finally
    Self.Enabled  := true;
    Screen.Cursor := crDefault;
    WorkProgress.Visible := false;
  end;
end;

procedure TSystemDBMigrationForm.PointButtonClick(Sender: TObject);
var vTableName :String;
    vIndex :Integer;
    vMonth :TDateTime;
begin
  inherited;
  WorkProgress.Visible := true;
  WorkMemo.Clear;
  WorkProgress.Visible := true;
  try
    Self.Enabled := false;
    Screen.Cursor := crSQLWait;

    vTableName := 'SL_PNT_OCCUR';
    WorkMemo.Lines.Add(Format('%S.... 이관 중...',[vTableName]));
    PosOpenQuery('select :P2 as CD_HEAD, '
                +'       :P3 as CD_STORE, '
                +'       :P1 as YMD_OCCUR, '
                +'       ''00'' as NO_POS, '
                +'       ROW_NUMBER() OVER( order by t.CD_MEMBER) as SEQ, '
                +'       t.CD_MEMBER, '
                +'       Sum(t.PNT_CASH) - Sum(t.PNT_CASH2) + Sum(t.PNT_USE) as PNT_CASH, '
                +'       0 as PNT_CASHRCP, '
                +'       0 as PNT_CARD, '
                +'       0 as PNT_GIFT, '
                +'       0 as PNT_TRUST, '
                +'       0 as PNT_POINT, '
                +'       0    as PNT_USE, '
                +'       Sum(t.ADD_STAMP) as STAMP_ADD, '
                +'       Sum(t.USE_STAMP) as STAMP_USE, '
                +'       '''' as RCP_LINK'
                +'  from ( '
                +'        select a.CD_MEMBER, '
                +'          	   case when a.TOTAL_POINT <  (Isnull(b.PNT_ADD,0) - Isnull(c.PNT_USE,0)) then a.TOTAL_POINT - (Isnull(b.PNT_ADD,0) - Isnull(c.PNT_USE,0)) '
			          +'                    else a.TOTAL_POINT end as PNT_CASH, '
                +'               0 as PNT_CASH2, '
                +'               0 as PNT_USE, '
                +'               0 as PNT_GIFT, '
                +'               0 as PNT_TRUST, '
                +'               0 as PNT_POINT, '
                +'               a.TOTAL_STAMP - (Isnull(d.ADD_STAMP,0) - Isnull(d.USE_STMP,0)) as ADD_STAMP, '
                +'               0 as USE_STAMP '
                +'          from MS_MEMBER a left outer join '
                +'              (select CD_MEMBER, '
                +'                      Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as PNT_ADD '
                +'                 from SL_PNT_OCCUR '
                +'                where CD_STORE = :P0 '
                +'                group by CD_MEMBER) as b on b.CD_MEMBER = a.CD_MEMBER left outer join '
                +'              (select CD_MEMBER, '
                +'                      Sum(PNT_USE) as PNT_USE '
                +'                 from SL_PNT_PAY '
                +'                where CD_STORE = :P0 '
                +'                group by CD_MEMBER) as c on c.CD_MEMBER = a.CD_MEMBER left outer join '
                +'              (select CD_MEMBER, '
                +'                      Sum(SAVE_STAMP) as ADD_STAMP, '
                +'                      Sum(USE_STAMP) as USE_STMP '
                +'                 from SL_SALE_H '
                +'                where CD_STORE =:P0 '
                +'                  and Len(CD_MEMBER)= 10 '
                +'                  and DS_SALE <> ''V'' '
                +'                group by CD_MEMBER ) as d on d.CD_MEMBER = a.CD_MEMBER '
                +'         where a.CD_STORE = :P0 '
                +'        union all '
                +'        select CD_MEMBER, '
                +'               0 as PNT_CASH, '
                +'               Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as PNT_CASH2, '
                +'               0 as PNT_USE, '
                +'               0 as PNT_GIFT, '
                +'               0 as PNT_TRUST, '
                +'               0 as PNT_POINT, '
                +'               0 as ADD_STAMP, '
                +'               0 as USE_STAMP '
                +'          from SL_PNT_OCCUR  '
                +'         where CD_STORE =:P0 '
                +'           and YMD_OCCUR > :P1 '
                +'         group by CD_MEMBER '
                +'        union all '
                +'        select CD_MEMBER, '
                +'               0 as PNT_CASH, '
                +'               0 as PNT_CASH2, '
                +'               Sum(PNT_USE) as PNT_USE, '
                +'               0 as PNT_GIFT, '
                +'               0 as PNT_TRUST, '
                +'               0 as PNT_POINT, '
                +'               0 as ADD_STAMP, '
                +'               0 as USE_STAMP '
                +'          from SL_PNT_PAY  '
                +'         where CD_STORE =:P0 '
                +'           and YMD_PAY > :P1 '
                +'         group by CD_MEMBER '
                +'        union all '
                +'        select CD_MEMBER, '
                +'               0 as PNT_CASH, '
                +'               0 as PNT_CASHRCP, '
                +'               0 as PNT_CARD, '
                +'               0 as PNT_GIFT, '
                +'               0 as PNT_TRUST, '
                +'               0 as PNT_POINT, '
                +'               Sum(SAVE_STAMP) as ADD_STAMP, '
                +'               Sum(USE_STAMP) as USE_STMP '
                +'          from SL_SALE_H  '
                +'         where CD_STORE =:P0 '
                +'           and YMD_SALE <= :P1 '
                +'           and DS_SALE <> ''V'' '
                +'           and Len(CD_MEMBER) = 10 '
                +'         group by CD_MEMBER '
                +'       ) as t '
                +' group by t.CD_MEMBER ',
                [PosStoreCode,
                 FormatDateTime('yyyymmdd', IncDay(BeginDate,-1)),
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('SL_POINT',true);

    PosOpenQuery('select :P2 as CD_HEAD, '
                +'       :P3 as CD_STORE, '
                +'       t.YMD_OCCUR, '
                +'       ''00'' as NO_POS, '
                +'       ROW_NUMBER() OVER( order by t.CD_MEMBER) as SEQ, '
                +'       t.CD_MEMBER, '
                +'       t.PNT_CASH, '
                +'       t.PNT_CASHRCP, '
                +'       t.PNT_CARD, '
                +'       t.PNT_GIFT, '
                +'       t.PNT_TRUST, '
                +'       t.PNT_POINT, '
                +'       t.PNT_USE, '
                +'       t.LINK as RCP_LINK,'
                +'       t.STAMP_ADD , '
                +'       t.STAMP_USE '
                +' from ( '
                +'        select CD_STORE, '
                +'               YMD_OCCUR, '
                +'               SEQ, '
                +'               CD_MEMBER, '
                +'               PNT_CASH, '
                +'               PNT_CASHRCP, '
                +'               PNT_CARD, '
                +'               PNT_GIFT, '
                +'               PNT_TRUST, '
                +'               PNT_POINT, '
                +'               0 as PNT_USE, '
                +'               LINK, '
                +'               0 as STAMP_ADD, '
                +'               0 as STAMP_USE '
                +'          from SL_PNT_OCCUR  '
                +'         where CD_STORE =:P0 '
                +'           and YMD_OCCUR >= :P1 '
                +'         union all '
                +'        select CD_STORE, '
                +'               YMD_PAY, '
                +'               SEQ, '
                +'               CD_MEMBER, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               PNT_USE, '
                +'               LINK, '
                +'               0 as STAMP_ADD, '
                +'               0 as STAMP_USE '
                +'          from SL_PNT_PAY  '
                +'         where CD_STORE =:P0 '
                +'           and YMD_PAY  >= :P1 '
                +'         union all '
                +'        select CD_STORE, '
                +'               YMD_SALE, '
                +'               ROW_NUMBER() OVER( order by YMD_SALE, NO_POS, NO_RCP) as SEQ, '
                +'               CD_MEMBER, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               0, '
                +'               YMD_SALE+NO_POS+NO_RCP as LINK, '
                +'               SAVE_STAMP as STAMP_ADD, '
                +'               USE_STAMP as STAMP_USE '
                +'          from SL_SALE_H  '
                +'         where CD_STORE =:P0 '
                +'           and YMD_SALE  >= :P1 '
                +'           and DS_SALE <> ''V'' '
                +'           and (Isnull(SAVE_STAMP,0) <> 0 or  Isnull(USE_STAMP,0) <> 0) '
                +'      ) as t '
                +' order by t.YMD_OCCUR, t.SEQ',
                [PosStoreCode,
                 FormatDateTime('yyyymmdd',BeginDate),
                 HeadStoreCode,
                 StoreCode]);
    SetMigration('SL_POINT',false);

    PosOpenQuery('select :P2 as CD_HEAD, '
                +'       :P3 as CD_STORE, '
                +'       YM_CLOSE, '
                +'       CD_CLOSE, '
                +'       CD_CODE, '
                +'       AMT_BASE, '
                +'       AMT_CLOSE, '
                +'       CD_SAWON_CHG, '
                +'       DT_CHANGE '
                +'  from SL_BOOKS_MONTH '
                +' where CD_STORE  =:P0 '
                +'   and YM_CLOSE >=:P1 '
                +'   and CD_CLOSE  =:P4 '
                +' order by YM_CLOSE ',
                [PosStoreCode,
                 FormatDateTime('yyyymmdd',IncDay(BeginDate,-1)),
                 HeadStoreCode,
                 StoreCode,
                 varMemberTrustClose]);
    SetMigration('SL_BOOKS_MONTH',true);


    ExecQuery('delete   SL_BOOKS_MONTH '
             +'  from   SL_BOOKS_MONTH '
             +' where   CD_HEAD   =:P0 '
             +'   and   CD_STORE  =:P1 '
             +'   and   CD_CLOSE  in (:P2,:P3);',
              [HeadStoreCode,
               StoreCode,
               varPointClose,
               varStampClose], false);

    vMonth := IncMonth(BeginDate,-1);
    while vMonth < IncMonth(Now(),-1) do
    begin
      WorkMemo.Lines.Add(Format('%S.... 마감데이터 생성',[FormatDateTime('yyyy-mm', vMonth)]));
      PointMonthClose(FormatDateTime('yyyymm', vMonth));
      vMonth := IncMonth(vMonth, 1);
    end;

    ExecQuery('update MS_MEMBER_ETC inner join '
             +'       (select   CD_MEMBER, '
             +'                 Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_TRUST,0) - Ifnull(AMT_PAYIN,0)) as AMT_TRUST '
             +'          from   (select   CD_CODE as CD_MEMBER, '
             +'                           Sum(AMT_BASE) as AMT_BASE, '
             +'                           0 as AMT_TRUST, '
             +'                           0 as AMT_PAYIN '
             +'                  from     SL_BOOKS_MONTH '
             +'                  where    CD_HEAD  = :P0 '
             +'                    and    CD_STORE  =:P1 '
             +'                    and    YM_CLOSE = :P2 '
             +'                    and    CD_CLOSE = :P3 '
             +'                  group by CD_CODE '
             +'                  union all '
             +'                  select   CD_MEMBER,'
             +'                           0 as AMT_BASE, '
             +'                           Sum(AMT_TRUST) as AMT_TRUST, '
             +'                           0 as AMT_PAY '
             +'                  from     SL_SALE_H '
             +'                  where    CD_HEAD  = :P0 '
             +'                    and    CD_STORE  =:P1 '
             +'                  and      DS_SALE <> ''V'' '
             +'                  and      YMD_SALE Between ConCat(Left(:P2,6),''01'') and ConCat(:P2,''31'') '
             +'                  and      AMT_TRUST <> 0 '
             +'                  group by CD_MEMBER '
             +'                  union all '
             +'                  select   CD_MEMBER, '
             +'                           0 as AMT_BASE, '
             +'                           0 as AMT_TRUST, '
             +'                           Sum(AMT_PAYIN+AMT_DC) as AMT_PAY '
             +'                  from     SL_ACCT '
             +'                  where    CD_HEAD  = :P0 '
             +'                    and    CD_STORE  =:P1 '
             +'                  and      YMD_OCCUR Between ConCat(Left(:P2,6),''01'') and ConCat(:P2,''31'') '
             +'                   and     CD_MEMBER is not null '
             +'                   and     CD_ACCT = '''+CreditIn+''''
             +'                  group by CD_MEMBER) as t group by t.CD_MEMBER '
             +'        ) as b on b.CD_MEMBER = MS_MEMBER_ETC.CD_MEMBER '
             +'   set  MS_MEMBER_ETC.AMT_TRUST    = Ifnull(b.AMT_TRUST,0) '
             +' where  MS_MEMBER_ETC.CD_HEAD  = :P0 '
             +'   and  MS_MEMBER_ETC.CD_STORE = :P1;',
              [HeadStoreCode,
               StoreCode,
               FormatDateTime('yyyymm', Now()),
               varMemberTrustClose],
               true);

        ExecQuery('update MS_MEMBER_ETC inner join '
                 +'       (select   m.CD_STORE, '
                 +'                 m.CD_MEMBER, '
                 +'                 Ifnull(c.AMT_BASE, 0) + Ifnull(s.POINT_ADD, 0) - Ifnull(s.POINT_USE, 0) as AMT_CLOSE, '
                 +'                 Ifnull(c.AMT_BASE2, 0) + Ifnull(s.POINT_ADD, 0) as AMT_CLOSE2, '
                 +'                 Ifnull(c.AMT_BASE3, 0) + Ifnull(s.POINT_USE, 0) as AMT_CLOSE3 '
                 +'          from   MS_MEMBER as m left outer join '
                 +'                 (select   CD_CODE as CD_MEMBER, '
                 +'                           AMT_BASE, '
                 +'                           AMT_BASE2, '
                 +'                           AMT_BASE3 '
                 +'                   from    SL_BOOKS_MONTH '
                 +'                  where    CD_HEAD  = :P0 '
                 +'                    and    CD_STORE = :P1 '
                 +'                    and    CD_CLOSE = :P3 '
                 +'                    and    YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
                 +'                 (select   CD_MEMBER, '
                 +'                           Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as POINT_ADD, '
                 +'                           Sum(PNT_USE) as POINT_USE '
                 +'                    from   SL_POINT '
                 +'                   where   CD_HEAD  =:P0 '
                 +'                     and   CD_STORE =:P1 '
                 +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
                 +'                   group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
                 +'         where    m.CD_HEAD  =:P0 '
                 +'           and    m.CD_STORE =:P1) as x on MS_MEMBER_ETC.CD_MEMBER = x.CD_MEMBER '
                 +'   set  MS_MEMBER_ETC.TOTAL_POINT  = Ifnull(x.AMT_CLOSE,0), '
                 +'        MS_MEMBER_ETC.OCCUR_POINT  = Ifnull(x.AMT_CLOSE2,0), '
                 +'        MS_MEMBER_ETC.USE_POINT    = Ifnull(x.AMT_CLOSE3,0) '
                 +' where  MS_MEMBER_ETC.CD_HEAD  = :P0 '
                 +'   and  MS_MEMBER_ETC.CD_STORE = :P1;',
                [HeadStoreCode,
                 StoreCode,
                 FormatDateTime('yyyymm', Now()),
                 varPointClose],
                 true);

        ExecQuery('update MS_MEMBER_ETC inner join '
                 +'       (select   m.CD_STORE, '
                 +'                 m.CD_MEMBER, '
                 +'                 Ifnull(c.AMT_BASE, 0)  + Ifnull(s.STAMP_ADD, 0) - Ifnull(s.STAMP_USE, 0) as AMT_CLOSE, '
                 +'                 Ifnull(c.AMT_BASE2, 0) + Ifnull(s.STAMP_ADD, 0) as AMT_CLOSE2, '
                 +'                 Ifnull(c.AMT_BASE3, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE3 '
                 +'          from   MS_MEMBER as m left outer join '
                 +'                 (select   CD_CODE as CD_MEMBER, '
                 +'                           AMT_BASE, '
                 +'                           AMT_BASE2, '
                 +'                           AMT_BASE3 '
                 +'                    from   SL_BOOKS_MONTH '
                 +'                   where   CD_HEAD  = :P0 '
                 +'                     and   CD_STORE = :P1 '
                 +'                     and   CD_CLOSE = :P3 '
                 +'                     and   YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
                 +'                 (select   CD_MEMBER, '
                 +'                           Sum(STAMP_ADD) as STAMP_ADD, '
                 +'                           Sum(STAMP_USE) as STAMP_USE '
                 +'                    from   SL_POINT '
                 +'                   where   CD_HEAD  =:P0 '
                 +'                     and   CD_STORE =:P1 '
                 +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
                 +'                  group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
                 +'         where    m.CD_HEAD  =:P0 '
                 +'           and    m.CD_STORE =:P1) as x on MS_MEMBER_ETC.CD_MEMBER = x.CD_MEMBER '
                 +'set     MS_MEMBER_ETC.TOTAL_STAMP  = Ifnull(x.AMT_CLOSE,0), '
                 +'        MS_MEMBER_ETC.OCCUR_STAMP  = Ifnull(x.AMT_CLOSE2,0), '
                 +'        MS_MEMBER_ETC.USE_STAMP    = Ifnull(x.AMT_CLOSE3,0) '
                 +'where   MS_MEMBER_ETC.CD_HEAD  = :P0 '
                 +'  and   MS_MEMBER_ETC.CD_STORE = :P1;',
                [HeadStoreCode,
                 StoreCode,
                 FormatDateTime('yyyymm', Now()),
                 varStampClose],
                 true);

    WorkMemo.Lines.Add('-------- 이관완료--------');
  finally
    Self.Enabled  := true;
    Screen.Cursor := crDefault;
    WorkProgress.Visible := false;
  end;
end;

function TSystemDBMigrationForm.PointMonthClose(aMonth: String):Boolean;
var vNextMonth :String;
begin
  vNextMonth := FormatDateTime('yyyymm', IncMonth(StoD(aMonth +'01'),1));
  Result := false;
  ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
           +'select   CD_HEAD, '
           +'         CD_STORE, '
           +'         :P2 as YM_CLOSE, '
           +'         :P3 as CD_CLOSE, '
           +'         CD_MEMBER '
           +'  from   MS_MEMBER '
           +' where   CD_HEAD   =:P0 '
           +'   and   CD_STORE  =:P1 '
           +'   and   CD_MEMBER not in (select  CD_CODE '
           +'                             from  SL_BOOKS_MONTH '
           +'                            where  CD_HEAD   =:P0 '
           +'                              and  CD_STORE = :P1 '
           +'                              and  YM_CLOSE = :P2 '
           +'                              and  CD_CLOSE = :P3);',
            [HeadStoreCode,
             StoreCode,
             aMonth,
             varPointClose],
             false);

    ExecQuery('update   SL_BOOKS_MONTH inner join '
             +'        (select   m.CD_STORE, '
             +'                  m.CD_MEMBER, '
             +'                  Ifnull(c.AMT_BASE, 0) + Ifnull(s.POINT_ADD, 0) - Ifnull(s.POINT_USE, 0) as AMT_CLOSE, '
             +'                  Ifnull(c.AMT_BASE2, 0) + Ifnull(s.POINT_ADD, 0) as AMT_CLOSE2, '
             +'                  Ifnull(c.AMT_BASE3, 0) + Ifnull(s.POINT_USE, 0) as AMT_CLOSE3 '
             +'         from     MS_MEMBER as m left outer join '
             +'                 (select   CD_CODE as CD_MEMBER, '
             +'                           AMT_BASE, '
             +'                           AMT_BASE2, '
             +'                           AMT_BASE3 '
             +'                    from   SL_BOOKS_MONTH '
             +'                   where   CD_HEAD  = :P0 '
             +'                     and   CD_STORE = :P1 '
             +'                     and   CD_CLOSE = :P4 '
             +'                     and   YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
             +'                 (select   CD_MEMBER, '
             +'                           Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as POINT_ADD, '
             +'                           Sum(PNT_USE) as POINT_USE '
             +'                  from     SL_POINT '
             +'                  where    CD_HEAD =:P0 '
             +'                    and    CD_STORE =:P1 '
             +'                    and    YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
             +'                  group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
             +'         where    m.CD_HEAD  =:P0 '
             +'           and    m.CD_STORE =:P1) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_MEMBER '
             +'set      SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
             +'         SL_BOOKS_MONTH.AMT_CLOSE2   = Ifnull(x.AMT_CLOSE2,0), '
             +'         SL_BOOKS_MONTH.AMT_CLOSE3   = Ifnull(x.AMT_CLOSE3,0), '
             +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
             +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
             +'where    SL_BOOKS_MONTH.CD_HEAD  = :P0 '
             +'  and    SL_BOOKS_MONTH.CD_STORE = :P1 '
             +'  and    SL_BOOKS_MONTH.YM_CLOSE = :P2 '
             +'  and    SL_BOOKS_MONTH.CD_CLOSE = :P4;',
              [HeadStoreCode,
               StoreCode,
               aMonth,
               UserCode,
               varPointClose],
               false);



  ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
           +'select   CD_HEAD, '
           +'         CD_STORE, '
           +'         :P2 as YM_CLOSE, '
           +'         :P3 as CD_CLOSE, '
           +'         CD_MEMBER '
           +'  from   MS_MEMBER '
           +' where   CD_HEAD   =:P0 '
           +'   and   CD_STORE  =:P1 '
           +'   and   CD_MEMBER not in (select  CD_CODE '
           +'                             from  SL_BOOKS_MONTH '
           +'                            where  CD_HEAD   =:P0 '
           +'                              and  CD_STORE = :P1 '
           +'                              and  YM_CLOSE = :P2 '
           +'                              and  CD_CLOSE = :P3);',
            [HeadStoreCode,
             StoreCode,
             aMonth,
             varStampClose],
             false);

  // 회원 스템프 합계를 넣어준다
  Result := ExecQuery('update  SL_BOOKS_MONTH inner join '
                     +'        (select   m.CD_STORE, '
                     +'                  m.CD_MEMBER, '
                     +'                  Ifnull(c.AMT_BASE, 0)  + Ifnull(s.STAMP_ADD, 0) - Ifnull(s.STAMP_USE, 0) as AMT_CLOSE, '
                     +'                  Ifnull(c.AMT_BASE2, 0) + Ifnull(s.STAMP_ADD, 0) as AMT_CLOSE2, '
                     +'                  Ifnull(c.AMT_BASE3, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE3 '
                     +'         from     MS_MEMBER as m left outer join '
                     +'                 (select   CD_CODE as CD_MEMBER, '
                     +'                           AMT_BASE, '
                     +'                           AMT_BASE2, '
                     +'                           AMT_BASE3 '
                     +'                    from   SL_BOOKS_MONTH '
                     +'                   where   CD_HEAD  = :P0 '
                     +'                     and   CD_STORE = :P1 '
                     +'                     and   CD_CLOSE = :P4'
                     +'                     and   YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
                     +'                 (select   CD_MEMBER, '
                     +'                           Sum(STAMP_ADD) as STAMP_ADD, '
                     +'                           Sum(STAMP_USE) as STAMP_USE '
                     +'                    from   SL_POINT '
                     +'                   where   CD_HEAD  =:P0 '
                     +'                     and   CD_STORE =:P1 '
                     +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
                     +'                   group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
                     +'         where    m.CD_HEAD  =:P0 '
                     +'           and    m.CD_STORE =:P1) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_MEMBER '
                     +'  set    SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
                     +'         SL_BOOKS_MONTH.AMT_CLOSE2   = Ifnull(x.AMT_CLOSE2,0), '
                     +'         SL_BOOKS_MONTH.AMT_CLOSE3   = Ifnull(x.AMT_CLOSE3,0), '
                     +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
                     +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
                     +'where    SL_BOOKS_MONTH.CD_HEAD  = :P0 '
                     +'  and    SL_BOOKS_MONTH.CD_STORE = :P1 '
                     +'  and    SL_BOOKS_MONTH.YM_CLOSE = :P2 '
                     +'  and    SL_BOOKS_MONTH.CD_CLOSE = :P4;',
                      [HeadStoreCode,
                       StoreCode,
                       aMonth,
                       UserCode,
                       varStampClose],
                       false);

  ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE, AMT_BASE, AMT_BASE2, AMT_BASE3) '
           +'select   CD_HEAD, '
           +'         CD_STORE, '
           +'         :P5 as YM_CLOSE, '
           +'         CD_CLOSE, '
           +'         CD_CODE, '
           +'         AMT_CLOSE, '
           +'         AMT_CLOSE2, '
           +'         AMT_CLOSE3 '
           +'  from   SL_BOOKS_MONTH '
           +' where   CD_HEAD   =:P0 '
           +'   and   CD_STORE  =:P1 '
           +'   and   YM_CLOSE  =:P2 '
           +'   and   CD_CLOSE  in (:P3,:P4);',
            [HeadStoreCode,
             StoreCode,
             aMonth,
             varPointClose,
             varStampClose,
             vNextMonth],
             false);

  ExecQuery('insert into SL_CLOSE_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, DS_CLOSE, CD_SAWON_CHG, DT_INSERT) '
           +'                    values(:P0, :P1, :P2, ''M'', :P3, Now()) '
           +' ON DUPLICATE KEY UPDATE DS_CLOSE = ''M'';',
           [HeadStoreCode,
            StoreCode,
            aMonth,
            UserCode],true);
end;

function TSystemDBMigrationForm.PosOpenQuery(aSQL: string;
  aParam: array of Variant): Boolean;
var
  vIndex : Integer;
  vSQL   : String;
begin
  Result := false;
  if (UpperCase(Copy(aSQL, 1, 1)) <> 'S') or (Trim(aSQL) = EmptyStr) then
    Exit;

  with PosQuery do
  begin
    if Active then
    begin
      ErrBox('쿼리가 열려 있습니다.');
      Exit;
    end;

    PosQuery.Options.QueryRecCount := true;
    vSQL := aSQL;
    for vIndex := High(aParam) downto 0 do
    begin
      case VarType(aParam[vIndex]) of
        varInteger : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',NVL(aParam[vIndex],0)));
        varDouble,
        varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0.00',NVL(aParam[vIndex],0.0)));
        varDate     : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime)',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
        else
        begin
          vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[aParam[vIndex]]));
        end;
      end;
    end;

    SQL.Text := vSQL;
    Open;
    Result := not Eof;
  end;
end;

function TSystemDBMigrationForm.PosOpenQuery_Ora(aSQL: string;
  aParam: array of Variant): Boolean;
var
  vIndex : Integer;
  vSQL   : String;
begin
  Result := false;
  if (UpperCase(Copy(aSQL, 1, 1)) <> 'S') or (Trim(aSQL) = EmptyStr) then
    Exit;

  with OraQuery do
  begin
    if Active then
    begin
      ErrBox('쿼리가 열려 있습니다.');
      Exit;
    end;

    OraQuery.Options.QueryRecCount := true;
    vSQL := aSQL;
    for vIndex := High(aParam) downto 0 do
    begin
      case VarType(aParam[vIndex]) of
        varInteger : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',NVL(aParam[vIndex],0)));
        varDouble,
        varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0.00',NVL(aParam[vIndex],0.0)));
        varDate     : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime)',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
        else
        begin
          vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[aParam[vIndex]]));
        end;
      end;
    end;

    SQL.Text := vSQL;
    Open;
    Result := not Eof;
  end;
end;

procedure TSystemDBMigrationForm.SetBeginDate;
begin
  try
    PosQuery.Close;
    PosQuery.SQL.Text := 'select Min(YMD_SALE) '
                        +'  from SL_SALE_H '
                        +' where CD_STORE =:P0 ';
    PosQuery.ParamByName('P0').AsString := PosStoreCode;
    PosQuery.Open;
    if not PosQuery.Eof then
    begin
      SaleDateEdit.Date := StoD(PosQuery.Fields[0].AsString);
      PosQuery.Close;
      SaleButton.Enabled := true;
    end
    else
      SaleButton.Enabled := false;
  finally
    PosQuery.Close;
  end;
end;

procedure TSystemDBMigrationForm.SaleButtonClick(Sender: TObject);
var vSQL, vTableName :String;
    vBeginDate, vToDate,
    vMonth :TDateTime;
begin
  inherited;
  WorkMemo.Clear;
  Self.Enabled  := false;
  WorkProgress.Visible := true;
  if not OraCheckBox.Checked then
  begin
    try
      ExecQuery('delete from SL_SALE_S        where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_D        where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_H        where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_D_SUM    where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_H_SUM    where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_CARD          where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_CASH          where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_CASHIER_MGM   where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_CLOSE    between :P2 and :P3;'
               +'delete from SL_POSCLOSE      where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_CLOSE    between :P2 and :P3;'
               +'delete from SL_DELIVERY      where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_DELIVERY between :P2 and :P3;'
               +'delete from SL_ACCT          where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_OCCUR    between :P2 and :P3;'
               +'delete from SL_BOOKS_MONTH   where CD_HEAD =:P0 and CD_STORE =:P1 and YM_CLOSE     between Left(:P2,6) and Left(:P3,6);',
               [HeadStoreCode,
                StoreCode,
                DtoS(SaleDateEdit.Date),
                DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value))],true);

      PosOpenQuery('select :P3 as CD_HEAD,  :P4 as CD_STORE, YMD_SALE, NO_POS, NO_RCP, DS_SALE, CD_MEMBER, AMT_SALE, AMT_CASH, AMT_CASHRCP, AMT_CARD, AMT_CHECK, AMT_TRUST, AMT_GIFT, AMT_POINT, AMT_BANK, '
                  +'       AMT_CASHTIP, AMT_CARDTIP,AMT_SERVICE,AMT_BUY,DC_MENU,DC_MEMBER,DC_CODE,CD_CODE,DC_COUPON,DC_RECEIPT,DC_SPC,DC_EVENT,DC_CUT,DC_VAT,DC_POINT,'
                  +'       DC_STAMP,DC_UPLUS,DC_TOT, AMT_DUTY,AMT_TAX,AMT_DUTYFREE,DT_SALE,NO_TABLE,COME_TIME,CD_CUSTOMER,CNT_PERSON,NO_BOOKING,CD_AGE,NO_CLOSE,NO_DELIVERY,'
                  +'       NO_ORDER,CD_DAMDANG,CANCEL_TXT,NO_RCP_ORG,PNT_OCCUR,PNT_USE,AMT_EXISTPOINT,NO_ACCT_REF,CD_TIME,USE_STAMP,'
                  +'       NOW_STAMP,CD_SAWON,DT_CHANGE '
                  +'  from SL_SALE_H '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_SALE Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);
      SetMigration('SL_SALE_H', false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE,d.YMD_SALE,d.NO_POS,d.NO_RCP,d.SEQ,d.CD_MENU, '
                  +'       d.DS_SALE_TYPE,d.DS_SALE,d.QTY_SALE,d.PR_SALE,d.AMT_SALE,d.PR_SERVICE,d.PR_TIP,d.DC_MENU,d.DC_RECEIPT,d.DC_MEMBER,d.DC_SPC,d.NO_SPC,d.DS_TAX,d.AMT_VAT,'
                  +'       d.DC_TOT, d.CD_ITEMS,d.NM_ITEMS,d.PR_ITEM,d.AMT_BUY,d.CD_SERVICE,d.CD_CORNER,d.DC_STAMP,d.USE_STAMP,d.SAVE_STAMP,h.CD_MEMBER, m.DS_MENU_TYPE '
                  +'  from SL_SALE_D d inner join '
                  +'       SL_SALE_H h on h.CD_STORE = d.CD_STORE and h.YMD_SALE = d.YMD_SALE and h.NO_POS = d.NO_POS and h.NO_RCP = d.NO_RCP left outer join '
                  +'       MS_MENU   m on m.CD_STORE = d.CD_STORE and m.CD_MENU = d.CD_MENU '
                  +' where d.CD_STORE =:P0 '
                  +'   and d.YMD_SALE Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);
      SetMigration('SL_SALE_D', false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE,YMD_SALE,NO_POS,NO_RCP,DENSE_RANK() OVER(order by CD_MENU, SEQ) as SEQ, '
                  +'       SUB_SEQ,CD_MENU,QTY_SALE,PR_SALE,DS_MENU as DS_MENU_TYPE, ''S'' as DS_SALE_TYPE, 1 as QTY_UNIT, 0 as DS_STOCK '
                  +'  from SL_SALE_S '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_SALE Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('SL_SALE_S', false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE,YMD_SALE,NO_POS,NO_RCP,SEQ,''C'' as DS_CARD,case when DS_TRD = ''1'' then ''A'' else ''C'' end as DS_TRD, '
                  +'       NO_CARD,NO_CHAINPL,NO_APPROVAL,AMT_APPROVAL,AMT_TIP,AMT_VAT,TERM_HALBU,TERM_VALID,case when TYPE_TRD = ''1'' then ''S'' else TYPE_TRD end as TYPE_TRD ,TRD_TIME,TRD_DATE,NO_APPROVAL_ORG,'
                  +'       TRD_DATE_ORG,NM_CARDPL,CD_CARD_BUY,NM_CARD_BUY,RECEIPT_CHK,YMD_RECEIPT,NOTE_MSG,REALMODE,IMGFILE,AMT_DC,DS_DC,CD_SAWON,DT_INSERT,'
                  +'       YN_UNIONPAY,AMT_BALANCE,YN_NOCVM,YN_CAT '
                  +'  from SL_CARD '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_SALE Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('SL_CARD', false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE,YMD_SALE,NO_POS,NO_RCP,NO_SEQ as SEQ, case when DS_TRD = ''0'' then ''A'' else ''C'' end as DS_TRD, '
                  +'       DS_KIND,DS_TYPE,DS_INPUT,NO_CARD,NO_APPROVAL,AMT_APPROVAL,AMT_VAT,TRD_DATE,TRD_DATE_ORG,NO_APPROVAL_ORG,'
                  +'       CD_SAWON,DT_INSERT,NO_CARD_FULL,YN_CAT '
                  +'  from SL_CASH '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_SALE Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('SL_CASH', false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE,YMD_DELIVERY,NO_DELIVERY,NO_TABLE,DS_ORDER,DS_STEP,DT_ORDER,DT_DELIVERY,DT_ACCOUNT,DT_CANCEL,DS_CUSTOMER,CD_MEMBER,NM_NAME,NO_TEL1,NO_TEL2,NO_TEL3,NO_TEL4,'
                  +'       ADDRESS1,ADDRESS2,REMARK,CD_SAWON,AMT_ORDER,AMT_SALE,ORDERMENU,PAYTYPE,RECALL_SAWON,COUPON_CNT,CD_COURSE,CD_LOCAL,TEL_LINE,USE_POSNO,NO_ORDER_BAEMIN'
                  +'  from SL_DELIVERY  '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_DELIVERY Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('SL_DELIVERY', false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE,YMD_CLOSE,NO_POS,CD_SAWON,SEQ,AMT_READY,AMT_MID,AMT_MID_CASH,AMT_MID_CHECK,AMT_ACCT_CASH,AMT_ACCT_CARD,AMT_ACCT_OUT,AMT_SALE,AMT_TAX,AMT_CASH,'
                  +'       CNT_CARD,AMT_CARD,AMT_TRUST,AMT_CHECK,AMT_GIFT,AMT_BANK,AMT_ETC,AMT_POINT,AMT_CASHTIP,AMT_CARDTIP,AMT_SERVICE,DC_RECEIPT,DC_MEMBER,DC_COUPON,DC_MENU,DC_CODE,'
                  +'       DC_SPC,DC_EVENT,DC_CUT,DC_VAT,DC_POINT,DC_UPLUS,DC_STAMP,AMT_LACK,AMT_BANPUM,CNT_VOID,AMT_VOID,AMT_CASHRCP,CNT_CUSTOMER,AMT_AVERAGE,'
                  +'       RCP_BEGIN,RCP_END,YN_CLOSE,_CHECK,_50000,_10000,_5000,_1000,_500,_100,_50,_10,DT_INSERT,DT_CHANGE '
                  +'  from SL_CASHIER_MGM '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_CLOSE Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('SL_CASHIER_MGM', false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE,YMD_CLOSE,NO_POS,DS_STATUS,AMT_READY,AMT_MID,AMT_ACCT_IN,AMT_ACCT_OUT,AMT_SALE,AMT_TAX,AMT_CASH,CNT_CARD,AMT_CARD,AMT_CHECK,AMT_GIFT,'
                  +'       AMT_TRUST,AMT_BANK,AMT_ETC,AMT_POINT,AMT_TIP,AMT_SERVICE,DC_MENU,DC_RECEIPT,DC_MEMBER,DC_CODE,DC_SPC,DC_EVENT,DC_CUT,DC_VAT,DC_POINT,'
                  +'       DC_UPLUS,AMT_VOID,AMT_BANPUM,AMT_LACK,CNT_CASHIER,CNT_CUSTOMER,AMT_CASHRCP,DC_COUPON,DC_STAMP,DT_CREATE as DT_INSERT,DT_CHANGE '
                  +'  from SL_POSCLOSE '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_CLOSE Between :P1 and :P2 ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('SL_POSCLOSE', false);


      PosOpenQuery('select :P3 as CD_HEAD, '
                  +'       :P4 as CD_STORE, '
                  +'       YMD_OCCUR, '
                  +'       NO_ACCT, '
                  +'       DS_ACCT, '
                  +'       CD_ACCT, '
                  +'       AMT_PAYIN, '
                  +'       AMT_OUT, '
                  +'       AMT_DC, '
                  +'       AMT_REMAIN, '
                  +'       CD_TRDPL, '
                  +'       CD_MEMBER, '
                  +'       Isnull(NO_POS,''00'') as NO_POS, '
                  +'       REMARK, '
                  +'       CD_SAWON_INSERT, '
                  +'       DT_INSERT, '
                  +'       CD_SAWON_CHG, '
                  +'       DT_CHANGE '
                  +'  from SL_ACCT '
                  +' where CD_STORE =:P0 '
                  +'   and YMD_OCCUR Between :P1 and :P2 '
                  +' order by YMD_OCCUR, NO_ACCT ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);
      SetMigration('SL_ACCT',false);

      PosOpenQuery('select :P3 as CD_HEAD,:P4 as CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE, AMT_BASE, AMT_CLOSE, CD_SAWON_CHG, DT_CHANGE '
                  +'  from SL_BOOKS_MONTH '
                  +' where CD_STORE =:P0 '
                  +'   and YM_CLOSE Between Left(:P1,6) and Left(:P2,6) ',
                  [PosStoreCode,
                   DtoS(SaleDateEdit.Date),
                   DtoS(IncDay(SaleDateEdit.Date, SaleSpinEdit.Value)),
                   HeadStoreCode,
                   StoreCode]);

      SetMigration('SL_BOOKS_MONTH', false);

      WorkMemo.Lines.Add('-------- 이관완료--------');
      SaleDateEdit.Date := IncDay(SaleDateEdit.Date, SaleSpinEdit.Value);
    finally
      Self.Enabled  := true;
      Screen.Cursor := crDefault;
      WorkProgress.Visible := false;
    end;
  end
  else
  begin
    if not OraConnection.Connected then
      OraConnection.Connect;

    vBeginDate := SaleDateEdit.Date;
    vToDate    := IncDay(SaleDateEdit.Date, SaleSpinEdit.Value);

    //년이 다를때
    if FormatDateTime('yyyy', vBeginDate) <> FormatDateTime('yyyy', vToDate) then
    begin
      vToDate := StrToDate(FormatDateTime('yyyy-12-31', vBeginDate));
    end;

    try
      ExecQuery('delete from SL_SALE_S        where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_D        where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_H        where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_D_SUM    where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_SALE_H_SUM    where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_CARD          where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_CASH          where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_SALE     between :P2 and :P3;'
               +'delete from SL_CASHIER_MGM   where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_CLOSE    between :P2 and :P3;'
               +'delete from SL_POSCLOSE      where CD_HEAD =:P0 and CD_STORE =:P1 and YMD_CLOSE    between :P2 and :P3;',
               [HeadStoreCode,
                StoreCode,
                DtoS(SaleDateEdit.Date),
                DtoS(vToDate)],true);

      PosOpenQuery_Ora('select :P4              as CD_HEAD, '
                      +'       :P5              as CD_STORE, '
                      +'       SALE_DATE        as YMD_SALE, '
                      +'       POS_NO           as NO_POS, '
                      +'       BILL_NO          as NO_RCP, '
                      +'       SALE_GUBUN       as DS_SALE, '
                      +'       NVL(MEMBER_NO,'''')  as CD_MEMBER, '
                      +'       NVL(SALE_AMT,0)           as AMT_SALE, '
                      +'       NVL(CASH_AMT,0)           as AMT_CASH, '
                      +'       NVL(CASH_RECEIPT_AMT,0)   as AMT_CASHRCP, '
                      +'       NVL(CARD_AMT,0)           as AMT_CARD, '
                      +'       NVL(CHECK_AMT,0)          as AMT_CHECK, '
                      +'       NVL(AFTER_AMT,0)          as AMT_TRUST, '
                      +'       NVL(GIFT_AMT,0)           as AMT_GIFT, '
                      +'       NVL(POINT_AMT,0)          as AMT_POINT, '
                      +'       NVL(BANK_AMT,0)           as AMT_BANK, '
                      +'       NVL(CASH_SERVICE_AMT,0)   as AMT_CASHTIP, '
                      +'       NVL(CARD_SERVICE_AMT,0)   as AMT_CARDTIP, '
                      +'       NVL(FREE_AMT,0)           as AMT_SERVICE, '
                      +'       NVL(MENU_DC_AMT,0)        as DC_MENU, '
                      +'       NVL(MEMBER_DC_AMT,0)      as DC_MEMBER, '
                      +'       NVL(CODE_DC_AMT,0)        as DC_CODE, '
                      +'       CD_CODE            as CD_CODE, '
                      +'       NVL(COUPON_DC_AMT,0)      as DC_COUPON, '
                      +'       NVL(RECEIPT_DC_AMT,0)     as DC_RECEIPT, '
                      +'       NVL(FUCTION_DC_AMT,0)     as DC_SPC, '
                      +'       NVL(EVENT_DC_AMT,0)       as DC_EVENT, '
                      +'       NVL(JUST_ONE_DC,0)        as DC_CUT, '
                      +'       NVL(VAT_DC_AMT,0)         as DC_VAT, '
                      +'       NVL(POINT_DC_AMT,0)       as DC_POINT,'
                      +'       NVL(DC_STAMP,0)           as DC_STAMP,'
                      +'       0                as DC_UPLUS, '
                      +'       NVL(TOTAL_POINT,0)      as DC_TOT, '
                      +'       NVL(TAX_AMT,0)          as AMT_DUTY, '
                      +'       NVL(VAT_AMT,0)          as AMT_TAX, '
                      +'       NVL(TAX_FREE_AMT,0)     as AMT_DUTYFREE, '
                      +'       OUT_TIME         as DT_SALE, '
                      +'       TABLE_NO         as NO_TABLE, '
                      +'       IN_TIME          as COME_TIME, '
                      +'       CUSTOMER_CODE    as CD_CUSTOMER, '
                      +'       NVL(PERSON_COUNT,0)     as CNT_PERSON, '
                      +'       BOOKING_NO       as NO_BOOKING, '
                      +'       CD_AGE           as CD_AGE, '
                      +'       CLOSE_NO         as NO_CLOSE, '
                      +'       DELIVERY_NO      as NO_DELIVERY,'
                      +'       ORDER_NO         as NO_ORDER, '
                      +'       CD_DAMDANG       as CD_DAMDANG, '
                      +'       CANCEL_TXT       as CANCEL_TXT, '
                      +'       RECEIPT_NO_ORG   as NO_RCP_ORG, '
                      +'       NVL(ADD_POINT,0)        as PNT_OCCUR, '
                      +'       NVL(USE_POINT,0)        as PNT_USE, '
                      +'       NVL(EXISTPOINT_AMT,0)   as AMT_EXISTPOINT, '
                      +'       ACCT_NO_REF      as NO_ACCT_REF, '
                      +'       HOUR_CODE        as CD_TIME, '
                      +'       NVL(USE_STAMP,0)        as USE_STAMP,'
                      +'       NVL(SAVE_STAMP,0)       as SAVE_STAMP, '
                      +'       CASHER_CODE      as CD_SAWON, '
                      +'       DT_CHANGE        as DT_CHANGE '
                      +'  from SLS100M_'+LeftStr(DtoS(SaleDateEdit.Date),4)
                      +' where COMP_CODE   =:P0 '
                      +'   and UPJANG_CODE =:P1 '
                      +'   and SALE_DATE Between :P2 and :P3 ',
                      [CompCodeEdit.Text,
                       UpjangCodeEdit.Text,
                       DtoS(SaleDateEdit.Date),
                       DtoS(vToDate),
                       HeadStoreCode,
                       StoreCode]);
      SetMigration_Ora('SL_SALE_H', false);

      PosOpenQuery_Ora('select :P4                as CD_HEAD, '
                      +'       :P5                as CD_STORE, '
                      +'       d.SALE_DATE        as YMD_SALE, '
                      +'       d.POS_NO           as NO_POS, '
                      +'       d.BILL_NO          as NO_RCP, '
                      +'       d.SEQ              as SEQ, '
                      +'       d.UPJANG_MENU_CODE as CD_MENU, '
                      +'       h.SALE_GUBUN       as DS_SALE, '
                      +'       d.SALE_TYPE        as DS_SALE_TYPE, '
                      +'       NVL(d.SALE_QTY,0)         as QTY_SALE, '
                      +'       NVL(d.SALE_UNITAMT,0)     as PR_SALE, '
                      +'       NVL(d.SALE_AMT,0)         as AMT_SALE, '
                      +'       NVL(d.FREE_AMT,0)         as PR_SERVICE, '
                      +'       NVL(d.SERVICE_AMT,0)      as PR_TIP, '
                      +'       NVL(d.MENU_DC_AMT,0)      as DC_MENU, '
                      +'       NVL(d.RECEIPT_DC_AMT,0)   as DC_RECEIPT, '
                      +'       NVL(d.MEMBER_DC_AMT,0)    as DC_MEMBER, '
                      +'       NVL(d.FUNCTION_DC_AMT,0)  as DC_SPC, '
                      +'       d.SPC_NO           as NO_SPC, '
                      +'       d.TAX_GUBUN        as DS_TAX, '
                      +'       NVL(d.VAT_AMT,0)          as AMT_VAT,'
                      +'       NVL(d.TOTAL_DC_AMT,0)     as DC_TOT, '
                      +'       d.ITEMS_CODE       as CD_ITEMS, '
                      +'       d.ITEMS_NAME       as NM_ITEMS, '
                      +'       d.ITEMS_AMT        as PR_ITEM, '
                      +'       0                  as AMT_BUY, '
                      +'       NVL(d.DC_STAMP,0)         as DC_STAMP, '
                      +'       NVL(d.USE_STAMP,0)        as USE_STAMP, '
                      +'       NVL(d.SAVE_STAMP,0)       as SAVE_STAMP, '
                      +'       h.MEMBER_NO        as CD_MEMBER, '
                      +'       m.UPJANG_MENU_TYPE        as DS_MENU_TYPE '
                      +'  from SLS100H_'+LeftStr(DtoS(SaleDateEdit.Date),4)+' d inner join '
                      +'       SLS100M_'+LeftStr(DtoS(SaleDateEdit.Date),4)+' h on h.COMP_CODE = d.COMP_CODE and h.UPJANG_CODE = d.UPJANG_CODE and h.SALE_DATE = d.SALE_DATE and h.POS_NO = d.POS_NO and h.BILL_NO = d.BILL_NO left outer join '
                      +'       MNU200M   m on m.COMP_CODE = d.COMP_CODE and m.UPJANG_CODE = d.UPJANG_CODE and m.UPJANG_MENU_CODE = d.UPJANG_MENU_CODE '
                      +' where d.COMP_CODE   =:P0 '
                      +'   and d.UPJANG_CODE =:P1 '
                      +'   and d.SALE_DATE Between :P2 and :P3 ',
                      [CompCodeEdit.Text,
                       UpjangCodeEdit.Text,
                       DtoS(SaleDateEdit.Date),
                       DtoS(vToDate),
                       HeadStoreCode,
                       StoreCode]);
      SetMigration_Ora('SL_SALE_D', false);

      PosOpenQuery_Ora('select :P4              as CD_HEAD, '
                      +'       :P5              as CD_STORE, '
                      +'       SALE_DATE        as YMD_SALE, '
                      +'       POS_NO           as NO_POS, '
                      +'       BILL_NO          as NO_RCP, '
                      +'       SEQ              as SEQ, '
                      +'       ''C''            as DS_CARD, '
                      +'       case when APPROVAL_GUBUN = ''1'' then ''A'' else ''C'' end as DS_TRD, '
                      +'       CARD_NO          as NO_CARD, '
                      +'       CARD_JOIN_NO     as NO_CHAINPL, '
                      +'       AGREE_NO         as NO_APPROVAL, '
                      +'       NVL(SALE_AMT,0)         as AMT_APPROVAL, '
                      +'       NVL(SERVICE_AMT,0)      as AMT_TIP, '
                      +'       0                as AMT_VAT, '
                      +'       HALBU_MONTH      as TERM_HALBU, '
                      +'       ''''             as TERM_VALID, '
                      +'       case when APPROVAL_TYPE = ''1'' then ''S'' else APPROVAL_TYPE end as TYPE_TRD, '
                      +'       AGREE_TIME       as TRD_TIME, '
                      +'       AGREE_DATE       as TRD_DATE, '
                      +'       ORG_AGREE_NO     as NO_APPROVAL_ORG,'
                      +'       ORG_AGREE_DATE   as TRD_DATE_ORG, '
                      +'       ISSUE_COMPANY_NAME as NM_CARDPL, '
                      +'       CARD_COMPANY_CODE  as CD_CARD_BUY, '
                      +'       CARD_COMPANY_NAME  as NM_CARD_BUY, '
                      +'       0                 as AMT_DC '
                      +'  from CRD100M_'+LeftStr(DtoS(SaleDateEdit.Date),4)
                      +' where COMP_CODE   =:P0 '
                      +'   and UPJANG_CODE =:P1 '
                      +'   and SALE_DATE Between :P2 and :P3 ',
                      [CompCodeEdit.Text,
                       UpjangCodeEdit.Text,
                       DtoS(SaleDateEdit.Date),
                       DtoS(vToDate),
                       HeadStoreCode,
                       StoreCode]);

      SetMigration_Ora('SL_CARD', false);

      PosOpenQuery_Ora('select :P4              as CD_HEAD, '
                      +'       :P5              as CD_STORE, '
                      +'       SALE_DATE        as YMD_SALE, '
                      +'       POS_NO           as NO_POS, '
                      +'       BILL_NO          as NO_RCP, '
                      +'       SEQ              as SEQ, '
                      +'       case when APPROVAL_GUBUN = ''0'' then ''A'' else ''C'' end as DS_TRD, '
                      +'       USE_PURPOS       as DS_KIND, '
                      +'       APPROVAL_TYPE    as DS_INPUT, '
                      +'       ID_NO            as NO_CARD, '
                      +'       AGREE_NO         as NO_APPROVAL, '
                      +'       NVL(AGREE_AMT,0)        as AMT_APPROVAL, '
                      +'       0                as AMT_VAT, '
                      +'       AGREE_DATE       as TRD_DATE, '
                      +'       ''''             as TRD_DATE_ORG, '
                      +'       ''''             as NO_APPROVAL_ORG '
                      +'  from CSH100M '
                      +' where COMP_CODE   =:P0 '
                      +'   and UPJANG_CODE =:P1 '
                      +'   and SALE_DATE Between :P2 and :P3 ',
                      [CompCodeEdit.Text,
                       UpjangCodeEdit.Text,
                       DtoS(SaleDateEdit.Date),
                       DtoS(vToDate),
                       HeadStoreCode,
                       StoreCode]);

      SetMigration_Ora('SL_CASH', false);


      PosOpenQuery_Ora('select :P4 as CD_HEAD, '
                      +'       :P5 as CD_STORE, '
                      +'       CLOSE_DATE               as YMD_CLOSE, '
                      +'       POS_NO                   as NO_POS, '
                      +'       CASHER_CODE              as CD_SAWON, '
                      +'       SEQ, '
                      +'       NVL(PREPARE_AMT,0)       as AMT_READY, '
                      +'       NVL(INTERIM_IN,0)        as AMT_MID, '
                      +'       NVL(INTERIM_IN,0)        as AMT_MID_CASH, '
                      +'       0                        as AMT_MID_CHECK, '
                      +'       NVL(INOUT_IMCOMING,0)    as AMT_ACCT_CASH, '
                      +'       0                        as AMT_ACCT_CARD, '
                      +'       NVL(INOUT_EXPENSES,0)    as AMT_ACCT_OUT, '
                      +'       NVL(SALE_AMT,0)          as AMT_SALE, '
                      +'       0                        as AMT_TAX, '
                      +'       NVL(CASH_AMT,0)          as AMT_CASH,'
                      +'       0                        as CNT_CARD, '
                      +'       NVL(CARD_AMT,0)          as AMT_CARD, '
                      +'       NVL(AFTER_AMT,0)         as AMT_TRUST, '
                      +'       NVL(CHECK_AMT,0)         as AMT_CHECK, '
                      +'       NVL(GIFT_AMT,0)          as AMT_GIFT, '
                      +'       NVL(BANK_AMT,0)          as AMT_BANK, '
                      +'       NVL(CASH_RECEIPT_AMT,0)  as AMT_CASHRCP, '
                      +'       0                        as AMT_ETC, '
                      +'       NVL(POINT_AMT,0)         as AMT_POINT, '
                      +'       NVL(CASH_SERVICE_AMT,0)  as AMT_CASHTIP, '
                      +'       NVL(CARD_SERVICE_AMT,0)  as AMT_CARDTIP, '
                      +'       NVL(FREE_AMT,0)          as AMT_SERVICE, '
                      +'       NVL(RECEIPT_DC_AMT,0)    as DC_RECEIPT, '
                      +'       NVL(MEMBER_DC_AMT,0)     as DC_MEMBER, '
                      +'       NVL(DC_COUPON,0)         as DC_COUPON, '
                      +'       NVL(MENU_DC_AMT,0)       as DC_MENU, '
                      +'       NVL(CODE_DC_AMT,0)       as DC_CODE,'
                      +'       NVL(FUNCTION_DC_AMT,0)   as DC_SPC, '
                      +'       NVL(EVENT_DC_AMT,0)      as DC_EVENT, '
                      +'       NVL(JUST_ONCE_DC_AMT,0)  as DC_CUT, '
                      +'       NVL(VAT_DC_AMT,0)        as DC_VAT, '
                      +'       NVL(POINT_DC_AMT,0)      as DC_POINT, '
                      +'       0                        as DC_UPLUS, '
                      +'       NVL(DC_STAMP,0)          as DC_STAMP, '
                      +'       NVL(OVERS_SHORTS_AMT,0)  as AMT_LACK, '
                      +'       0                        as AMT_BANPUM, '
                      +'       0                        as CNT_VOID, '
                      +'       NVL(VOID_AMT,0)          as AMT_VOID, '
                      +'       NVL(PERSON_COUNT,0)      as CNT_CUSTOMER, '
                      +'       NVL(AMT_PER_PERSON,0)    as AMT_AVERAGE,'
                      +'       ''''                     as RCP_BEGIN, '
                      +'       ''''                     as RCP_END,'
                      +'       ''Y''                    as YN_CLOSE '
//                      +'       CURRENCY_CHECK    as _CHECK, '
//                      +'       0                 as _50000, '
//                      +'       CURRENCY_10000    as _10000, '
//                      +'       CURRENCY_5000     as _5000, '
//                      +'       CURRENCY_1000     as _1000, '
//                      +'       CURRENCY_500      as _500, '
//                      +'       CURRENCY_100      as _100, '
//                      +'       CURRENCY_50       as _50, '
//                      +'       CURRENCY_10       as _10 '
                      +'  from CAS100M '
                      +' where COMP_CODE   =:P0 '
                      +'   and UPJANG_CODE =:P1 '
                      +'   and CLOSE_DATE Between :P2 and :P3 ',
                      [CompCodeEdit.Text,
                       UpjangCodeEdit.Text,
                       DtoS(SaleDateEdit.Date),
                       DtoS(vToDate),
                       HeadStoreCode,
                       StoreCode]);

      SetMigration_Ora('SL_CASHIER_MGM', false);

      PosOpenQuery_Ora('select :P4               as CD_HEAD, '
                      +'       :P5               as CD_STORE, '
                      +'       CLOSING_DATE        as YMD_CLOSE, '
                      +'       POS_NO            as NO_POS, '
                      +'       DS_STATUS         as DS_STATUS, '
                      +'       NVL(PREPARE_AMT,0)       as AMT_READY, '
                      +'       NVL(INTERIM_IN,0)         as AMT_MID, '
                      +'       NVL(INOUT_IMCOMING,0)     as AMT_ACCT_IN, '
                      +'       NVL(INOUT_EXPENSES,0)     as AMT_ACCT_OUT, '
                      +'       NVL(SALE_AMT,0)           as AMT_SALE, '
                      +'       0                 as AMT_TAX, '
                      +'       NVL(CASH_AMT,0)           as AMT_CASH, '
                      +'       0                 as CNT_CARD, '
                      +'       NVL(CARD_AMT,0)           as AMT_CARD, '
                      +'       NVL(CHECK_AMT,0)          as AMT_CHECK, '
                      +'       NVL(GIFT_AMT,0)           as AMT_GIFT,'
                      +'       NVL(AFTER_AMT,0)          as AMT_TRUST, '
                      +'       NVL(BANK_AMT,0)           as AMT_BANK, '
                      +'       0                 as AMT_ETC, '
                      +'       NVL(POINT_AMT,0)          as AMT_POINT, '
                      +'       NVL(SERVICE_AMT,0)        as AMT_TIP, '
                      +'       NVL(FREE_AMT,0)           as AMT_SERVICE, '
                      +'       NVL(MENU_DC_AMT,0)        as DC_MENU, '
                      +'       NVL(RECEIPT_DC_AMT,0)     as DC_RECEIPT, '
                      +'       NVL(MEMBER_DC_AMT,0)      as DC_MEMBER, '
                      +'       NVL(CODE_DC_AMT,0)        as DC_CODE, '
                      +'       NVL(FUNCTION_DC_AMT,0)    as DC_SPC, '
                      +'       NVL(EVENT_DC_AMT,0)       as DC_EVENT, '
                      +'       NVL(JUST_ONCE_DC_AMT,0)   as DC_CUT, '
                      +'       NVL(VAT_DC_AMT,0)         as DC_VAT, '
                      +'       NVL(POINT_DC_AMT,0)       as DC_POINT,'
                      +'       0                 as DC_UPLUS, '
                      +'       NVL(VOID_AMT,0)           as AMT_VOID, '
                      +'       0                 as AMT_BANPUM, '
                      +'       NVL(OVERS_SHORTS_AMT,0)   as AMT_LACK, '
                      +'       NVL(CASHER_COUNT,0)       as CNT_CASHIER, '
                      +'       NVL(PERSON_COUNT,0)       as CNT_CUSTOMER, '
                      +'       NVL(CASH_RECEIPT_AMT,0)   as AMT_CASHRCP, '
                      +'       NVL(DC_COUPON,0)          as DC_COUPON, '
                      +'       NVL(DC_STAMP,0)           as DC_STAMP, '
                      +'       OPEN_DATETIME     as DT_INSERT, '
                      +'       CLOSE_DATETIME    as DT_CHANGE '
                      +'  from PMG100M '
                      +' where COMP_CODE   =:P0 '
                      +'   and UPJANG_CODE =:P1 '
                      +'   and CLOSING_DATE Between :P2 and :P3 ',
                      [CompCodeEdit.Text,
                       UpjangCodeEdit.Text,
                       DtoS(SaleDateEdit.Date),
                       DtoS(vToDate),
                       HeadStoreCode,
                       StoreCode]);

      SetMigration_Ora('SL_POSCLOSE', false);

      WorkMemo.Lines.Add('-------- 이관완료--------');
      SaleDateEdit.Date := IncDay(vToDate, 1);
    finally
      Self.Enabled  := true;
      Screen.Cursor := crDefault;
      WorkProgress.Visible := false;
    end;
  end;
end;

end.
