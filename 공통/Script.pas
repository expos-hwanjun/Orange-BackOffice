// 데이터베이스 업데이트 (F)

unit Script;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdTCPClient, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxLabel,
  DAScript, UniScript, DateUtils, StrUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, IdHTTP, idGlobal;

type
  TScriptForm = class(TForm)
    ScriptMemo: TMemo;
    UpdateButton: TButton;
    CloseButton: TButton;
    Timer: TTimer;
    BackupCheckBox: TcxCheckBox;
    MessageLabel: TcxLabel;
    cxLabel1: TcxLabel;
    CountLabel: TcxLabel;
    Script: TUniScript;
    AutoUpdateTimer: TTimer;
    CloseTimer: TTimer;
    IdHTTP: TIdHTTP;

    procedure FormShow(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ScriptError(Sender: TObject; E: Exception; SQL: string;
      var Action: TErrorAction);
    procedure AutoUpdateTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseTimerTimer(Sender: TObject);

  private
    SourceList,
    SortedList : TStringList;
    MaxVer     : string;
    DBFolder   : string;
    ScriptIndex: Integer;
    ErrMsg     : string;
    isError    : Boolean;
    isAutoUpdate :Boolean;

    procedure GetMaxVer;
    function  CheckApply(aValue: string): Boolean;
    function  GetUpdateLicense:Boolean;
    function  ApplyScript(aFileName: string): Boolean;
    function  LoadScript: Boolean;
  end;

implementation

uses
  Common, DBModule, Service;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TScriptForm.FormCreate(Sender: TObject);
begin
  if GetIniFile('FTP', 'DB_PWD', '') = '15444171' then
  begin
    isAutoUpdate := true;
    AutoUpdateTimer.Enabled := true;
  end
  else
    isAutoUpdate := false;
end;

procedure TScriptForm.FormShow(Sender: TObject);
var
  vFiles : TSearchRec;
  vReturn: Integer;
  vIndex : Integer;
begin
  isError      := false;
  GetMaxVer;
  SourceList := TStringList.Create;
  SortedList := TStringList.Create;

  vReturn := FindFirst(Folder+dirDLL+'*.sql', faAnyfile, vFiles);
  try
    while vReturn = 0 do
    begin
      if (Length(vFiles.Name) = 12) and (GetOnlyNumber(Copy(vFiles.Name, 1, 8)) = Copy(vFiles.Name, 1, 8)) and (StoD(Copy(vFiles.Name, 1, 8)) <> 0) then
        if CheckApply(vFiles.Name) then
          while FileExists(Folder+dirDLL+vFiles.Name) do
            DeleteFile(Folder+dirDLL+vFiles.Name)
        else
          SortedList.Add(vFiles.Name);
      vReturn := FindNext(vFiles);
    end;
    SortedList.Sort;
  finally
    FindClose(vFiles);
  end;

  for vIndex := 0 to SortedList.Count-1 do
    ScriptMemo.Lines.Add(' '+SortedList.Strings[vIndex]);

  UpdateButton.Enabled := ScriptMemo.Lines.Count > 0;
  // 적용할 스크립트가 없으면 그냥 폼을 닫는다
  if ScriptMemo.Lines.Count = 0 then
    Timer.Enabled := true;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 실행 버튼
procedure TScriptForm.UpdateButtonClick(Sender: TObject);
  function FileDownLoad(aFileName:String):Boolean;
  var vFileStream: TMemoryStream;
      vHTTPPath :String;
  begin
    Result := false;
    vFileStream := TMemoryStream.Create;
    with vFileStream do
      try
        vHTTPPath := 'http://www.xn--6j1b831b.kr:84/FTP\Update\Orange2\BackOffice\';
        IdHTTP.Get(vHTTPPath+aFileName, vFileStream);
        vFileStream.SaveToFile(Folder+dirDLL+aFileName);
        Result := true;
      finally
        free;
      end;
  end;
var
  vIndex: Integer;
  vBackupFile: string;
  vHandle :THandle;
  vTRRunning :Boolean;
  vSaleDate  :TDateTime;
  vResult: Boolean;
  vResultStr: String;
  vFileStream: TMemoryStream;
  vHTTPPath :String;
  vMaxVersion :String;
  vUploadData :TStringList;
begin
  if  not GetUpdateLicense and not isAutoUpdate then
  begin
    ErrBox('자동 업데이트 기간이 만료되었습니다.');
    Exit;
  end;

  GetMaxVer;

  // 스크립트를 업데이트 한다
  try
    UpdateButton.Enabled := False;
    CloseButton.Enabled  := False;
    Application.ProcessMessages;

    //다운받은 스크립트 이전버전 적용하지 않은게 있으면 다운받는다
    if SortedList.Count > 0 then
    begin
      try
        DM.OpenQuery('select Max(VERSION) '
                    +'  from MS_VERSION ',
                     []);
        vMaxVersion := DM.Query.Fields[0].AsString;
      finally
        DM.FinishQuery;
      end;
      vFileStream := TMemoryStream.Create;
      vUploadData := TStringList.Create;
      with vFileStream do
        try
          vHTTPPath := 'http://www.xn--6j1b831b.kr:84/FTP\Update\Orange2\BackOffice\';
          IdHTTP.Get(vHTTPPath+'UP_FileInfo.ini', vFileStream);
          vFileStream.SaveToFile(Folder+dirDLL+'UP_FileInfo.ini');
          vUploadData.LoadFromFile(Folder+dirDLL+'UP_FileInfo.ini');
        finally
          free;
        end;

      for vIndex := vUploadData.Count-1 downto 0 do
      begin
        if Pos('.sql=dll',vUploadData.Strings[vIndex]) = 0 then Continue;

        if (LeftStr(vUploadData.Strings[vIndex],8) > vMaxVersion) and not FileExists(Folder+dirDLL+LeftStr(vUploadData.Strings[vIndex],12)) then
        begin
          FileDownLoad(LeftStr(vUploadData.Strings[vIndex],12));
          SortedList.Insert(0,LeftStr(vUploadData.Strings[vIndex],12))
        end;
      end;
      vUploadData.Free;
    end;

    for vIndex := 0 to SortedList.Count-1 do
    begin
      ScriptMemo.Lines.Add(' '+Copy(SortedList.Strings[vIndex], 1, Length(SortedList.Strings[vIndex])-4)+' 업데이트 중...');
      if CheckApply(SortedList.Strings[vIndex]) then
      begin
        ScriptMemo.Lines.Strings[ScriptMemo.Lines.Count-1] := ' '+Copy(SortedList.Strings[vIndex], 1, Length(SortedList.Strings[vIndex])-4)+' 업데이트 완료';
        while FileExists(Folder+dirDLL+SortedList.Strings[vIndex]) do
          DeleteFile(Folder+dirDLL+SortedList.Strings[vIndex]);
      end
      else
      begin
        if not ApplyScript(SortedList.Strings[vIndex]) then
        begin
          ScriptMemo.Lines.Add(' [Error] '+ErrMsg);
          ScriptMemo.Font.Color := clRed;
          Break;
        end;
      end;
    end;
  finally
    CloseButton.Enabled := True;
    SetIniFile('FTP', 'BO_PWD', '');
    CloseTimer.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
// 닫기 버튼
procedure TScriptForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TScriptForm.CloseTimerTimer(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 스크립트 최종버전 구하기
procedure TScriptForm.GetMaxVer;
begin
  try
    // 기존에 반영된 최종 버전을 알아낸다
    DM.OpenQuery('select   Top 1 VERSION '
                +'from     MS_VERSION '
                +'order by SEQ desc',
                 []);
    MaxVer := DM.Query.Fields[0].AsString;
    DM.FinishQuery;

    // 서버에서 DB가 설치된 폴더를 알아낸다
    DM.OpenQuery('select   filename '
                +'from     sysfiles '
                +'where    fileid = 1',
                 []);
    DBFolder := ExtractFileDir(DM.Query.Fields[0].AsString);
    if (DBFolder <> EmptyStr) and (DBFolder[Length(DBFolder)] <> '\') then
      DBFolder := DBFolder + '\';
  finally
    DM.FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 이미 적용된 스크립트인지 체크
procedure TScriptForm.AutoUpdateTimerTimer(Sender: TObject);
begin
  AutoUpdateTimer.Enabled := false;
  UpdateButtonClick(nil);
end;

function TScriptForm.CheckApply(aValue: string): Boolean;
begin
  try
    DM.OpenQuery('select   Count(*) as CNT '
                +'from     MS_VERSION '
                +'where    VERSION = :P0',
                 [Copy(aValue, 1, 8)]);
    Result := (DM.Query.Fields[0].AsInteger > 0) or (Copy(aValue, 1, 8) < MaxVer);
  finally
    DM.FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 업데이트 가능한 라이센스를 보유했는지 확인
function TScriptForm.GetUpdateLicense: Boolean;
  function CheckUpdate(aValue:String):Boolean;
  var
    vRcvData :String;
  begin
    Result := True;
    if LowerCase(aValue) = LowerCase(regDemo) then
      Exit;
    // TCP 컴포넌트를 폼에 올려놓지 않고 동적으로 생성하는 이유는
    // Indy10 버전의 에러로 한 번 Connect 한 후에는 Disconnect를 해도 계속 Connect 상태로 인식하고
    // 그러다 ReadLn, WriteLn 등을 하면 연결되지 않았다고 에러가 나기 때문이다
    with TIdTCPClient.Create(self) do
      try
        Host           := ipServer;
        Port           := portServer;
        ConnectTimeout := 500;
        ReadTimeout    := 5000;
        Connect;
        Socket.WriteLnRFC('1'+aValue+#3, IndyTextEncoding_OSDefault );
        vRcvData := Socket.ReadLn(#3, IndyTextEncoding_OSDefault);
        Result := StoI(vRcvData) = 1;
      finally
        if Connected then
          Disconnect;
        Free;
      end;
  end;
var
  vLicense, vGuest : string;
  vCustomerCode    : string;
begin
  // DB가 설치된 서버일 때
  if (DBIP = ipLocal) or (GetIPAddress = DBIP) then
  begin
    //레지스트리에서 인증정보를 가져온다
    vLicense := GetRegistry(HKEY_LOCAL_MACHINE, regExtremePOS+msgProgramName, regLicense, EmptyStr);
    vGuest   := GetRegistry(HKEY_LOCAL_MACHINE, regExtremePOS+msgProgramName, regGuest,   EmptyStr);

    if Length(vLicense) = 96 then
      vLicense := Decrypt(vLicense, _LicenseKey);
    if Length(vGuest) = 80 then
      vGuest   := Decrypt(vGuest, _DateKey);

    // 정상 인증
    if Length(vLicense) = 48 then
      vCustomerCode := vLicense[29]+vLicense[30]+vLicense[31]+vLicense[33]+vLicense[34]+vLicense[35]
    // 인증은 안받고 데모 사용 상태일 때
    else if Length(vGuest) = 40 then
      vCustomerCode := Copy(vGuest, 1, 4)
    // 아무 것도 아닐 때
    else
      vCustomerCode := EmptyStr;

    Result := CheckUpdate(vCustomerCode);
  end
  // POS일 때
  else
  begin
    vCustomerCode := GetRegistry(HKEY_LOCAL_MACHINE, regExtremePOS+msgProgramName, regCustomerCode, EmptyStr);
    Result        := CheckUpdate(vCustomerCode);
  end;
end;
//------------------------------------------------------------------------------
// 스크립트 적용
function TScriptForm.ApplyScript(aFileName: string): Boolean;
  function StringCount:Integer;
  var
    vIndex :Integer;
  begin
    Result := 0;
    for vIndex := 0 to SourceList.Count-1 do
      if Copy(SourceList.Strings[vIndex], 1, 2) = 'GO' then
        Result := Result+1;
  end;
var
  vTotalScript,
  vTemp,vTemp1,
  vPosVer     : string;
  vIndex      : Integer;
label Loop;
begin
  vTemp1 := ScriptMemo.Lines.Strings[ScriptMemo.Lines.Count-1];
  SourceList.LoadFromFile(Folder+dirDLL+aFileName);
  if not isConversion then
  begin
    if MaxVer <> SourceList.Strings[0] then
    begin
      MsgBox(SourceList.Strings[0]+'일자 업데이트가'#13'적용되지 않았습니다.');
      ErrMsg := SourceList.Strings[0]+'일자 업데이트가 적용되지 않았습니다.';
      Result := false;
      Exit;
    end;

    vPosVer := SourceList.Strings[1];
    SourceList.Delete(0);
    SourceList.Delete(0);
  end;

  vTotalScript := IntToStr(StringCount);
  vIndex       := -1;
  ScriptIndex  := 0;
  Screen.Cursor := crSQLWait;

  DM.ConnectDB;
  try
    DM.BeginTrans;

    while LoadScript do
    begin
      isError := false;
      if UpperCase(Copy(Script.SQL.Text,1,4)) = 'DROP' then
      begin
        Script.Execute();
        if isError then Break;
      end
      else
      begin
        Script.Execute();
        if isError then Break;
      end;
      vIndex  := vIndex+1;
      vTemp := vTemp1 + '( '+IntToStr(vIndex) + ' / '+vTotalScript+' )';
      CountLabel.Caption := vTemp;
      Application.ProcessMessages;
    end;

    if isError then
      Raise Exception.Create(ErrMsg);

    ScriptMemo.Lines.Strings[ScriptMemo.Lines.Count-1] := vTemp + ' - 완료';

    if not isConversion then
    begin
      // 버전 업데이트
      DM.OpenQuery('select   IsNull(Max(SEQ),0)+1 as SEQ '
                  +'from     MS_VERSION',
                   []);
      try
        if not DM.Query.Eof then
          vIndex := DM.Query.Fields[0].AsInteger
        else
          vIndex := 1;
      finally
        DM.FinishQuery;
      end;
      DM.ExecQuery('insert into MS_VERSION '
                  +'( '
                  +'  SEQ, VERSION, POS_VER, DT_CHANGE '
                  +') values ( '
                  +'  :P0, :P1, :P2, GetDate() '
                  +')',
                   [vIndex, Copy(aFileName,1,8), vPosVer],
                    false);
    end;

    DM.CommitTrans;

    while FileExists(Folder+dirDLL+aFileName) do
      DeleteFile(Folder+dirDLL+aFileName);
    MaxVer := Copy(aFileName,1,8);
    Result := True;
    Screen.Cursor := crDefault;
  except
    on E: Exception do
    begin
      DM.RollbackTrans;
      Result := False;
      Screen.Cursor := crDefault;
      ErrMsg := E.Message + #13 + Script.SQL.Text;
      ErrBox(E.Message + #13 + Script.SQL.Text);
      Exit;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 스크립트 읽어오기
function TScriptForm.LoadScript: Boolean;
var
  vIndex  : Integer;
  vStrList: TStringList;
begin
  Result   := True;
  vStrList := TStringList.Create;
  Script.SQL.Clear;
  if ScriptIndex < SourceList.Count then
  begin
    for vIndex := ScriptIndex to SourceList.Count-1 do
    begin
      if Trim(SourceList.Strings[vIndex]) <> 'GO' then
        vStrList.Add(SourceList.Strings[vIndex])
      else
        Break;
    end;
    ScriptIndex := vIndex+1;
    Script.SQL.Text := vStrList.Text;
  end;
  if Script.SQL.Text = EmptyStr then
    Result := False;
end;

procedure TScriptForm.ScriptError(Sender: TObject; E: Exception; SQL: string;
  var Action: TErrorAction);
begin
  ErrMsg  := E.Message;
  isError := True;
end;

end.
