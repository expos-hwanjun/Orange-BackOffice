unit Download;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, IniFiles, GraphicEx, IdFTPCommon,
  ShellAPI, StrUtils, Menus, cxLookAndFeelPainters, cxButtons,
  cxLookAndFeels, cxControls, cxPC, cxTextEdit, cxMemo,
  cxContainer, cxEdit, cxProgressBar, IdWhois, DB, IdExplicitTLSClientServerBase,
  IdAntiFreezeBase, IdAntiFreeze, IdHTTP,   WinSock, idGlobal,
  cxLabel, Registry, jpeg, cxGraphics, cxClasses, AdvGlassButton,
  AdvSmoothToggleButton, Vcl.WinXCtrls, PosButton, dxGDIPlusClasses;

type
  TFileInfo = record
  Name : String;
  Date : String;
  Size : integer;
  Kind : String;
  Path : String;
end;

type
  TFilePath = (FilePos,Dll,Data,Sys,None);

type
  TFtpStatus = (ftWork,ftAbort,ftConn);

type
  TDownloadForm = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    ActivityIndicator: TActivityIndicator;
    MessageLabel: TLabel;
    StartTimer: TTimer;
    CloseTimer: TTimer;
    IdHTTP: TIdHTTP;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseTimerTimer(Sender: TObject);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Integer);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Integer);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure StartTimerTimer(Sender: TObject);
  private
    AppPath    : String;
    DownPath   : String;
    SystemPath : String;
    Files      : TFileInfo;
    FtpStatus  : TFtpStatus;
    FileList   : TStringList;
    UP_ini     : Tinifile;
    DN_ini     : Tinifile;
    bDownLoad  : Boolean;
    DelFile    : String;
    CopyFileNm : Array of String;
    fsServerPath :String;
    fsProgram    :String;
    fsURL        :String;
    function  fGetFilePath(FileName:String):TFilePath;
    procedure ReadyFileCopy;
    procedure FileCopy;
    function  ExecDownload :Boolean;
    procedure DeleteErrorFile;
    function  FileDownload:Boolean;
    function  GetKeyValue(ARootKey : HKEY; SubKey,GetValue : string): Variant;
    function  GetDosOutput(aCommandLine: string): string;
  public
    FileCount :Integer;
  end;

var
  DownloadForm: TDownloadForm;
implementation                                                       
const
  fsUpInfoFile  = 'UP_FileInfo.ini';
  fsDnInfoFile  = 'DN_FileInfo.ini';
  fsDownLoading = 'DownLoading';
  fsDemon       = 'POSDemon';
  iniDownloadInfo = 'DOWNLOADINFO';
{$R *.dfm}
procedure TDownloadForm.FormCreate(Sender: TObject);
var vTemp :String;
begin
  FileCount:= 0;
  AppPath  := ExtractFilePath(Application.ExeName);
  SetLength(SystemPath, 256);
  GetSystemDirectory(PChar(SystemPath), 256);

  StartTimer.Enabled := true;
  fsURL := 'http://www.xn--6j1b831b.kr:84/';
  fsServerPath  := 'FTP\Update\CloudOrange\BackOffice\';
  fsProgram     := 'Orange.exe';
  DownPath := AppPath+'Download\';
  FileCount   := 0;
end;

//**************************************************************************//
//                           다운받을 PATH를 구한다
//**************************************************************************//
function TDownloadForm.fGetFilePath(FileName:String):TFilePath;
  var
  Path : String;
  ini  : Tinifile;
begin
  ini := Tinifile.Create(DownPath+fsUpInfoFile);
  Path := LowerCase(ini.ReadString('UPLOADINFO',FileName,'0'));

  if      Path = 'app'     then  Result := FilePos
  else if Path = 'dll'     then  Result := Dll
  else if Path = 'dat'     then  Result := Data
  else if Path = 'sys'     then  Result := Sys
  else Result := None;

end;

//---------------------- 다운받은 파일확인 -----------------------------------//
procedure TDownloadForm.ReadyFileCopy;
 var
  Ret      : integer;
  FileRec  : TSearchRec;
  FileCnt  : integer;
begin
  Ret := FindFirst(DownPath+'*.*',faAnyfile,FileRec);

  FileCnt := -1;
  if Ret = 0 then
  begin
    try
      While Ret = 0 do
      begin
        if (FileRec.Attr = faDirectory) or
           (FileRec.Name = fsUpInfoFile) or
           (FileRec.Name = fsDnInfoFile) then
        begin
          Ret := FindNext(FileRec);
        end
        else
        begin
          inc(FileCnt);
          SetLength(CopyFileNm,FileCnt +1);
          CopyFileNm[FileCnt] := FileRec.Name;
          Ret := FindNext(FileRec);
        end;
      end;
    finally
     FindClose(FileRec);
    end;
  end;
  if High(CopyfileNm) > -1 then  FileCopy;
end;

//**************************************************************************//
//                       다운받은 화일을 해당경로로 이동
//**************************************************************************//
procedure TDownloadForm.FileCopy;
var
  SourceFile,TargetFile : TFileStream;
  I, Hnd :Integer;
  CopyPath  : String;
begin
  for i:= 0 to High(CopyFileNm) do
  begin
    Case fGetFilePath(CopyFileNm[i]) of
         FilePos : CopyPath := AppPath;
         Dll    : CopyPath := AppPath+'Dll\';
         Data   : CopyPath := AppPath+'Data\';
         Sys    : CopyPath := SystemPath;
    end;

    try
      if DelFile = CopyFileNm[i] then
      begin
        DeleteFile(DownPath+DelFile);
        if High(CopyFileNm) = 0 then Exit;
      end;

      if Pos(LowerCase(fsProgram), LowerCase(CopyFileNm[i])) = 0 then
      begin
        try
          SourceFile := TFileStream.Create(DownPath+CopyFileNm[i], fmOpenRead );
          TargetFile := TFileStream.Create(CopyPath+CopyFileNm[i], fmOpenWrite or fmCreate );
          TargetFile.CopyFrom(SourceFile, SourceFile.Size);
        finally
          SourceFile.Free;
          TargetFile.Free;
        end;
        DeleteFile(DownPath+CopyFileNm[i]);
      end
      else bDownLoad    := True;
    except
    end;
  end;

end;


//**************************************************************************//
//                           취소버튼 클릭시
//**************************************************************************//
procedure TDownloadForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.ProcessMessages;
end;

//**************************************************************************//
//                           업데이트버튼 클릭시
//**************************************************************************//
function TDownloadForm.ExecDownload:Boolean;
  //aWork H:Head, G:Get;
  function FileDown(aWork, aFileName:String):String;
  var vErrCnt :Integer;
  label Loop;
  begin
    vErrCnt := 0;
    Result  := '';
    Loop:
    try
      if aWork = 'H' then
        IdHTTP.Head(aFileName)
      else
        Result := IdHTTP.Get(aFileName);
      vErrCnt := 0;
    except
      Inc(vErrCnt);
    end;
    if (vErrCnt > 0) and (vErrCnt < 6) then
      Goto Loop;

    if vErrCnt > 0 then
      Result := '-1';
  end;
var I, vIndex :Integer;
    DownLoadTime,vTemp : String;
    vMemStream: TMemoryStream;
    vStringList  :TStringList;
    vFileName    :String;
begin
  //다운로드가 완료되지 않은 내역 삭제
  Result := false;
  DeleteErrorFile;
  try
    IdHTTP.ReadTimeout := 500;
    FileList     := TStringlist.Create;
    try
      //다운받을 디렉토리가 없으면 생성
      if Not DirectoryExists(DownPath) then ForceDirectories(DownPath);

      vStringList := TStringList.Create;

      with TStringList.Create do
        try
          Text := FileDown('G',fsURL+fsServerPath+fsUpInfoFile);
          if Text <> '-1' then
          begin
            SaveToFile(DownPath+fsUpInfoFile);
            UP_ini := Tinifile.Create(DownPath+fsUpInfoFile);
            DN_ini := Tinifile.Create(DownPath+fsDNInfoFile);
            FileList.LoadFromFile(DownPath+fsUpInfoFile);
          end;
        finally
          Free;
        end; // try .. finally ..

      IdHTTP.ReadTimeout := 0;
      vStringList.Clear;
      UP_ini.ReadSectionValues('UPLOADDATE', vStringList);
      For vIndex := 0 to vStringList.Count-1 do
      begin
        vFileName := LeftStr(vStringList.Strings[vIndex], Pos('=',vStringList.Strings[vIndex])-1);
        DownLoadTime := UP_ini.ReadString('UPLOADDATE', vFileName ,'0');
        if (StrToFloat(DownLoadTime) <= StrToFloat(DN_ini.ReadString(iniDownloadInfo, vFileName,'0'))) then Continue;

        FtpStatus  := ftWork;
        DN_ini.WriteString(iniDownloadInfo, vFileName, fsDownLoading);
        vMemStream := TMemoryStream.Create;
        with vMemStream do
          try
            FileDown('H',fsURL+fsServerPath+vFileName);
            if Text <> '-1' then
            begin
              //화일크기를 알아낸다
              Files.Size := IdHTTP.Response.ContentLength;
              IdHTTP.Get(fsURL+fsServerPath+vFileName, vMemStream);
              SaveToFile(DownPath+vFileName);
            end;
            if vFileName = 'Orange.exe' then
              Result := true;
          finally
            Free;
          end; // try .. finally ..

          if FtpStatus = ftAbort then Exit;
          DN_ini.WriteString(iniDownloadInfo,vFileName,DownLoadTime);
          Sleep(100);
      end;
    except
    end;
  finally
    FileList.Free;
    ReadyFileCopy;
  end;
end;

procedure TDownloadForm.CloseTimerTimer(Sender: TObject);
begin
  CloseTimer.Enabled := false;
  if CloseTimer.Tag = 1 then ModalResult := mrOK
  else                       ModalResult := mrCancel;
end;

procedure TDownloadForm.DeleteErrorFile;
var
  Ret        : Integer;
  Files      : TSearchRec;
begin
  Ret := FindFirst(DownPath+'*.*',faAnyfile,Files);
  DN_ini := Tinifile.Create(DownPath+fsDnInfoFile);
  while Ret = 0 do
  begin
     if (UpperCase(Files.Name) = UpperCase(fsUpInfoFile)) or (UpperCase(Files.Name) = UpperCase(fsDnInfoFile)) then
     begin
       Ret := FindNext(Files);
       Continue;
     end;

     //다운로드중에 끝난 화일이면 삭제한다
     if DN_ini.ReadString('DOWNLOADINFO'  ,Files.Name,'') = fsDownLoading then
     begin
        While FileExists(DownPath+Files.Name) do
          DeleteFile(DownPath+Files.Name);
        DN_ini.WriteString('DOWNLOADINFO',Files.Name,'0');
     end;
     Ret := FindNext(Files);
  end;
  DN_ini.Free;
end;


//**************************************************************************//
//                           화일을 다운받는 중
//**************************************************************************//
procedure TDownloadForm.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Integer);
begin
  Application.ProcessMessages;
end;

//**************************************************************************//
//                           화일다운받기 시작
//**************************************************************************//
procedure TDownloadForm.IdHTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Integer);
begin
  MessageLabel.Caption := '업데이트 중 입니다...';
end;

//**************************************************************************//
//                           화일다운을 완료후
//**************************************************************************//
procedure TDownloadForm.IdHTTPWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  case FtpStatus of
    ftWork :begin
              FtpStatus             := ftConn;
            end;
    ftAbort:begin
              if FileExists(DownPath+Files.Name) then
              begin
                DelFile := Files.Name;
              end;
            end;
  end;
  Application.ProcessMessages;
end;

function TDownloadForm.FileDownload:Boolean;
var Hnd  :Integer;
begin
  Hnd := FindWindow(nil, PChar(fsDemon));
  Result := false;
  try
    //데몬을 종료시킨다
    SendMessage(Hnd,WM_SYSCOMMAND,SC_CLOSE,0);
    SendMessage(Hnd,WM_USER+$2,0,0);;

    Application.ProcessMessages;
    ExecDownload;
    Result := bDownLoad;
  finally
    SendMessage(Hnd,WM_SYSCOMMAND,SC_CLOSE,0);
  end;
end;

function TDownloadForm.GetKeyValue(ARootKey : HKEY; SubKey,GetValue : string): Variant;
var
  Registry  : TRegistry;
  AValueData: Variant;
  i :Integer;
  vKey        :TStringList;
begin
  Result := '';
  Registry := TRegistry.Create;
  try
    Registry.RootKey := ARootKey; //HKEY_LOCAL_MACHINE;
    if Registry.OpenKey(SubKey,False) then
    begin
      if GetValue <> '' then
      begin

        case Registry.GetDataType(GetValue) of
          rdString: begin
                      try
                        AValueData := Registry.ReadString(GetValue);
                      except
                        AValueData := '';
                      end;
                    end;
          rdInteger: begin
                       try
                         AValueData := Registry.ReadInteger(GetValue);
                       except
                         AValueData := 0;
                       end;
                     end;
        end;
        Result := AValueData;
      end
      else
      begin
        vKey := TStringList.Create;
        Registry.GetKeyNames(vKey);
        For i := 0 to vKey.Count do
        begin
          if Length(vKey.Strings[i]) = 4 then
          begin
            Result := vKey.Strings[i];
            Break;
          end;
        end;
      end;
    end
    else Result := -1;
  finally
    Registry.Free;
  end;
end;

procedure TDownloadForm.StartTimerTimer(Sender: TObject);
var vPwd :String;
    vResult :String;
begin
  StartTimer.Enabled := false;
  vResult := GetDosOutput('ping www.expos.co.kr');

  if Pos('TTL=',vResult) = 0 then
  begin
    with TIniFile.Create(AppPath+'CONFIG.INI') do                                          
      try
        WriteString('POS','PING FAIL', FormatDateTime('yyyy-mm-dd hh:nn:ss',now()));
      finally
        Free;
      end;
    CloseTimer.Enabled := True;
    Exit;
  end
  else
  begin
    with TIniFile.Create(AppPath+'CONFIG.INI') do
      try
        WriteString('POS','PING CHECK', FormatDateTime('yyyy-mm-dd hh:nn:ss',now()));
      finally
        Free;
      end;
  end;

  if ExecDownload then
    ModalResult := mrOK
  else
    Close;
end;

function TDownloadForm.GetDosOutput(aCommandLine: string): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  SetLength(WorkDir, 256);
  GetSystemDirectory(PChar(WorkDir), 256);

  Result := '';
  with SA do begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + aCommandLine),
                            nil, nil, True, 0, nil,
                            PChar(WorkDir), SI, PI);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            Result := Result + Buffer;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

end.
