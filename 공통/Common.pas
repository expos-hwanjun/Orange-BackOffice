unit Common;



interface

uses
  Windows, Forms, SysUtils, WinSock, Registry, IniFiles, StrUtils, MMSystem,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, Math, StdCtrls,
  NB30, ActiveX, ComObj, URLMon, Variants, Graphics, Controls, Classes,
  MaskUtils, IdGlobal, cxDropDownEdit, Messages, ExtCtrls, JPEG,
  dxGDIPlusClasses, CPort, ShellAPI, SHDocVw, IdHTTP, idMultiPartFormData, nrcomm,
  cxImage, DateUtils, System.JSON, System.IOUtils, IdSSLOpenSSL, REST.Client, REST.Types,
  Winapi.TlHelp32;

const
  msgExtremePOS        = '㈜익스트림포스';
  regExtremePOS        = 'SOFTWARE\ExtremePOS\';
  regDelivery          = 'Delivery';
  regLicense           = 'License';
  regCustomerCode      = 'CustomerCode';
  regDemo              = 'Demo';
  jsonMartURL          = 'http://39.120.147.84:19009/WebErp/|';
  jsonSportsCenterURL  = 'http://39.120.147.84:18099/Orange/|';
  jsonSMSDBURL         = 'http://39.120.147.83:18008/Orange/|';
  jsonERPASPURL        = 'http://www.exposcloud.co.kr:18008/ERP/|';    //유통ASP
  apikey               = 'FHPMD1T-DHJMJTJ-K71H57C-HE59023';             //암호화적용안함
  StandardStore        = '00000000';                //표준매장코드
  portServer           = 8001;
  userGradeMaster      = '001';
  dirDLL               = 'DLL\';
  dirDownload          = 'Download\';
  dirExcel             = 'Excel\';
  filUpInfoFile        = 'UP_FileInfo.ini';
  filDNInfoFile        = 'DN_FileInfo.ini';
  filAppName           = 'Orange.exe';
  filUpdater           = 'Updater.exe';
  filConfigIni         = 'Config.ini';                                          //환경설정 파일
  iniMain              = 'MAIN';
  iniCommon            = '공통';
  iniStore             = '매장코드';
  iniLastUser          = '최종사용자';
  iniCharBold          = '폰트진하게';
  DateSeparator        = '-';

const
  fmtDateTimeLong      = 'yyyy"년" m"월" d"일" ampm h:nn:ss';
  fmtDateTime          = 'yyyy/mm/dd(ddd) ampm hh:nn';
  fmtDateShort         = 'yyyymmdd';
  fmtDate              = 'yyyy-mm-dd';
  fmtDateYM            = 'yyyymm';
  fmtTimeShort         = 'hhnn';
  fmtTime              = 'hh:nn';
  fmtTimeLong          = 'ampm h:nn';
  fmtComma             = '0,';
  fmtNullComma         = '#,';

  varBuyClose           ='10';
  varMemberTrustClose   ='20';
  varPointClose         ='30';
  varStampClose         ='40';
  varOrderClose         ='50';    //수발주마감

  varGetCode            ='001';   //매장입금코드
const
  sqlP0                = 'P0';
  sqlP1                = 'P1';
  sqlP2                = 'P2';
  sqlP3                = 'P3';
  sqlP4                = 'P4';
  sqlP5                = 'P5';
  sqlP6                = 'P6';
  sqlP7                = 'P7';
  sqlP8                = 'P8';
  sqlP9                = 'P9';
  sqlP10               = 'P10';
  sqlP11               = 'P11';
  sqlP12               = 'P12';
  sqlP13               = 'P13';
  sqlP14               = 'P14';
  sqlP15               = 'P15';
  sqlP16               = 'P16';
  sqlP17               = 'P17';
  sqlP18               = 'P18';
  sqlP19               = 'P19';
  sqlP20               = 'P20';
  sqlP21               = 'P21';
  sqlP22               = 'P22';
  sqlP23               = 'P23';
  sqlP24               = 'P24';
  sqlP25               = 'P25';
  sqlP26               = 'P26';
  sqlP27               = 'P27';
  sqlP28               = 'P28';
  sqlP29               = 'P29';
  sqlP30               = 'P30';
  sqlP31               = 'P31';
  sqlP32               = 'P32';
  sqlP33               = 'P33';
  sqlP34               = 'P34';
  sqlP35               = 'P35';
  sqlP36               = 'P36';
  sqlP37               = 'P37';
  sqlP38               = 'P38';
  sqlP39               = 'P39';
  sqlP40               = 'P40';
  sqlP41               = 'P41';
  sqlP42               = 'P42';
  sqlP43               = 'P43';
  sqlP44               = 'P44';
  sqlP45               = 'P45';
  sqlP46               = 'P46';
  sqlP47               = 'P47';
  sqlP48               = 'P48';
  sqlP49               = 'P49';
  sqlP50               = 'P50';
const
  msgMustInput         = '을(를) 정확히 입력하십시오.';
  msgConnectServer     = msgExtremePOS+' 서버와 연결할 수 없습니다.';
  msgNoPrintData       = '출력할 내용이 없습니다.';
  msgNoSearchData      = '조회된 내역이 없습니다.';
  msgSaved             = '저장이 완료되었습니다.';
const
  clrDisabled          = $00E0E0E0;
  clrFocused           = $0080FFFF;
  C1                   = 73165;
  C2                   = 56;
  _CryptKey            = 2843;
  _DateKey             = 2345;
  _LicenseKey          = 4962;
  _EncryptKey          = 71483;
  HexaChar: array [0..15] of Char = ('0','1','2','3','4','5','6','7','8', '9','A','B','C','D','E','F');
const
  WM_USER_PRINT        = WM_USER + 101;
  WM_USER_CLEAR        = WM_USER + 102;
  WM_USER_CLOSE        = WM_USER + 103;
const
  valGoodsDCType       = '0';
  valReceiptDCType     = '1';
const
  splitDataSet         = #$03C0;
  splitTable           = #$03D0;
  splitRecord          = #$03E0;
  splitColumn          = #$03F0;
  andChar              = #$03B0;
const
  rsNormal             = 'rsNormal';
  rsDelete             = 'rsDelete';
  rsUpdate             = 'rsUpdate';
  rsInsert             = 'rsInsert';
const
// 프린터 특수명령
   rptCharNormal   = '{N}';   // 일반 글자
   rptCharBold     = '{B}';   // 굵은 글자
   rptCharInverse  = '{I}';   // 역상 글자
   rptCharUnderline= '{U}';   // 밑줄 글자
   rptAlignLeft    = '{L}';   // 왼쪽 정렬
   rptAlignCenter  = '{C}';   // 가운데 정렬
   rptAlignRight   = '{R}';   // 오른쪽 정렬
   rptSizeNormal   = '{S}';   // 보통 크기
   rptSizeWidth    = '{X}';   // 가로확대 크기
   rptSizeHeight   = '{Y}';   // 세로확대 크기
   rptSizeBoth     = '{Z}';   // 가로세로확대 크기
   rptSize3Times   = '{3}';   // 가로세로3배확대 크기
   rptLF           = #13;
   rptOneLine      = '{O}';
   rptTwoLine      = '{T}';
   rptOneLine2     = '{2}';
   rptTwoLine2     = '{4}';
   rptpStr         = '{6}';
   rptBarcode      = '{D}';

const
   prtESPON        = 0;       //엡슨계열
   prtTM           = 1;
   prtKICC         = 2;


type
  PStrPointer = ^TStrPointer;
  TStrPointer = record
    Data: string;
  end;

  PIntPointer = ^TIntPointer;
  TIntPointer = record
    Data: Integer;
  end;

type
  TDefaultDate = (ddToday, ddLastWeek, ddMonthFirst, ddLastMonth, ddLastYear, ddNextWeek, ddNextMonth, ddNowMonth);
  TPrintMode   = (pmNone, pmAll, pmPrint, pmPreview, pmExcel, pmPrintPreview, pmPrintExcel, pmPreviewExcel, pmPrintPreviewExcel, pmPrintPreviewTif);
  TProgramName = (pnOrange);

type
  TByteArr = array of byte;

var
  msgProgramName   :String;//     = 'Orange';
//  RestBaseURL          = 'http://www.exposcloud.co.kr:18008/Orange/';
  RestBaseURL      :String = 'https://letsorder.expos.co.kr:19008/Orange/|';
  RestDBURL        :String;
  RestOrgDBURL     :String;
  StandaloneCode   :String;                                                     // 단독매장 회사코드
  HeadStoreCode   : string;                                                     // 본사매장코드
  HeadStoreName   : string;                                                     // 본사명
  StoreCode       : string;                                                     // 매장코드
  StoreName       : string;                                                     // 매장 이름
  CloudServer     : string;
  PartnerCode     : string;                                                     //협력사코드
  JsonDBName      : string;                                                     //정액제 DB 사용시

  BusinessNumber  : string;                                                     // 매장 사업자번호
  StoreTelNumber  : string;                                                     // 매장 전화번호
  BossName        : string;                                                     // 대표자
  UserCode        : string;                                                     // 사용자 코드
  UserName        : string;                                                     // 사용자 이름
  UserPWD         : string;                                                     // 사용자 비밀번호
  UserLevel       : string;                                                     // 사용자권한(E:익스트림포스, P:협력사)
  UserClass       : string;                                                     // C:본사권한, S:매장권한
  UserGrade       : string;                                                     // 사용자 등급
  UserGradeAuth   : string;                                                     // 사용자그룹별 권한
  AllowPos        : integer;                                                    // 허용포스대수
  AllowKiosk      : integer;                                                    //허용키오스크대수
  AllowMenuCount  : integer;                                                    //메뉴최대건수
  LicenseMacAdress: string;                                                     // MacAddress
  LicenseProram   : string;                                                     // 프로그램권한   1:수발주제한
  Options         : string;                                                     // 옵션(Options)
  StoreOptions    : string;                                                     //가맹점관리에서 체크한 옵션표준환경설정 (1:체인여부,2:표준메뉴사용(0:사용안함,1:사용(매장메뉴O),2:매장메뉴X),3:표준PLU,4:키오스크메뉴연동, 5:통합회원
  ChainHeadOptions  : string;                                                   //1:체인여부, 2:표준메뉴사용여부 (COMPANY - Options)      수발주옵션
  HeadOptions: string;                                                          //본사에 옵션
  LetsOrderToken  : String;
  LetsOrderURL    : String = '';

  isDebugMode     : boolean;                                                    // 디버깅모드
  StoreSignImage  : TJPEGImage;
  isDemo          : Boolean;                                                    //데모 여부
  isSupportLicense: Boolean;                                                    //영업지원용 여부
  DBVersion       : String;
  JsonLocalServer : String;
  ConnectionLimit : Integer;                                                   //동시접속 제한
  LogOutCheckTime : TDateTime;
  LoginEnd        : Boolean;
  isLogOut        : Boolean;
  LogList          :TStringList;                                                //오프라인으로 에러로그 저장못했을때 다시전송할 로그임시저장(프로그램종료시 Clear);
  ProgramUseLogList :TStringList;                                               //프로그램사용로그 리스트(건건이 저장하면 서버에 부하가 생겨서 10개씩 저장한다) default 1000
  StringFieldSize : Integer;

var
  TaxRate         : Currency;                                                   // 세율 (판매가를 이 값으로 나누면 공급가가 나온다. 10%=1.1, 5%=1.05, 20%=1.2로 지정)
  SelfMenuPrefix  : string;                                                     // 자체상품코드 앞자리
  SelfMenuLength  : Integer;
  SelfGoodsPrefix  : string;                                                     // 자체상품코드 앞자리
  SelfGoodsLength  : Integer;
  CouponPrefix    : string;                                                     // 쿠폰코드 앞자리
  CouponLen       : Integer;
  MemberPrefix    : string;                                                     // 회원카드번호 앞자리
  MemberCardLength: Integer;                                                    // 회원카드길이
  ScaleCodePrefix : string;
  ScaleCodeLength : Integer;
  CreditIn        : string;                                                     // 외상매출금 입금
  CreditOut       : string;                                                     // 외상매입금 지급
  CashOut         : string;                                                     // 현금매입 지급
  VANCompany      : string;
var
  Folder          : string;
var
  FormParam       : array[0..4] of string;                                      // 연계화면 실행시 넘겨줄 파라미터
var
  ProgramName     : TProgramName;
  StoreList       : TStringList;
  WorkStoreList   : TStringList;
var
  LPTFile         : THandle;
  PrintBlank      : Integer;                                                    //영수증프린터 공백(42 or 48 Colum)

  TempSQL       : String;                                                       //Excute 할 SQL 보관

// 형변환
function  StoI(aValue: string): Integer;                                                                // 문자열을 정수로
function  StoI64(aValue: string): Int64;                                                                // 문자열을 정수로
function  StoF(aValue: string): Double;                                                                 // 문자열을 실수로
function  StrToHex(const aValue: string): string;                                                       // 문자열을 16진수로
function  HexToStr(const aHex: string) : string;                                                        // 16진수를 문자열로
function  HexToBin(aHex: string): string;                                                               // 16진수를 2진수로
function  BinToHex2(aBin: string): string;
function  ByteToString(const Value: TByteArr): String;
function  StrToByte(const Value: String): TByteArr;
function  TColorToHex(Color : TColor) : string;
function  HexToTColor(sColor : string) : TColor;
function  DtoS(const aValue: TDateTime): string;                                                        // 날짜를 문자열(yyyymmdd)로
function  TtoS(const aValue: TDateTime): string;                                                        // 시간을 문자열(hh:nn)로
function  StoD(const aValue: string): TDateTime;                                                        // 문자열(yyyymmdd)을 날짜로
function  StoT(const aValue: string): TDateTime;
                                                       // 문자열(hh:nn)을 시간으로
// 문자열
function  GetOnlyNumber(const aValue: string): string;                                                  // 문자열 중 숫자만 뽑기
function  Replace(aData: string; aSrc: string = ' '; aDst: string = ''): string;
function  DateToString(const aDate: string; aSepChar: Char = '-'): string;                              // 날짜를 문자열로(yyyymmdd -> yyyy-mm-dd)
function  LPad(const aStr: string; aLength: Integer; aPadChar: Char = ' '): string;                     // 문자열 앞 채우기
function  RPad(const aStr: string; aLength: Integer; aPadChar: Char = ' '): string;                     // 문자열 뒤 채우기
procedure Split(const aStr: string; aSplitChar: Char; var aList: TStringList);                          // 문자열을 구분자 기준으로 나누어 문자리스트로 리턴하기
function  LengthB(aStr: string): Integer;                                                               // 문자열 길이를 Byte 단위로 리턴
function  CopyStr(const aStr: string; aIndex, aCount: Integer): Ansistring; overload;                       // 한글 Copy
function  CopyStr(const aStr: string; aCount: Integer): Ansistring; overload;
function  CopyStr(const aStr: Variant; aIndex, aCount: Integer): Ansistring; overload;
function  CopyPos(aStr :String; aChar :Char; aPOS:Integer):String;
function  Nvl(aValue: Variant; aDefaultValue: string  ): string; overload;                              // Null이면 기본값으로 바꾸기
function  Nvl(aValue: Variant; aDefaultValue: Currency): Currency; overload;
function  Nvl(aValue: Variant; aDefaultValue: Integer ): Integer; overload;
function  Nvl(aValue: Variant; aDefaultValue: Boolean ): Boolean; overload;
function  GetValueHan(Value: Extended): String;

// 숫자
function  RoundNumber(aNumber: Currency; aUnit: Currency = 1): Currency;                                // 반올림
function  CeilNumber(aNumber: Currency; aUnit: Currency = 1): Currency;                                 // 올림
function  FloorNumber(aNumber: Currency; aUnit: Currency = 1): Currency;                                // 내림
function  CalcOptionNumber(aNumber: Currency; aOptionIndex: Integer): Currency;                         // 옵션에 따라 계산
function  CalcSaleProfitRate(aBuyAmt, aSaleAmt:Currency): Currency;                                     // 이익률 계산

// 레지스트리
function  SetRegistry(aRootKey: HKEY; aKey, aValue:String; aData: Variant): Boolean;                    // 레지스트리 값 저장(SetKeyValue)
function  SetRegistryBin(aRootKey: HKEY; aKey, aValue, aData: string): Boolean;                         // 레지스트리 값 저장(SetKeyValue)
function  GetRegistry(aRootKey: HKEY; aKey, aValue: string; aDefault: string = ''): Variant;             // 레지스트리 값 읽기(GetKeyValue)

function  SetIniFile(aSection, aIdent, aData: string): Boolean; overload;                               // Ini File 값 저장
function  SetIniFile(aSection, aIdent: string; aData: Integer): Boolean; overload;                      // Ini File 값 저장
function  SetIniFile(aSection, aIdent: string; aData: Boolean): Boolean; overload;                      // Ini File 값 저장
function  GetIniFile(aSection, aIdent, aDefault: string): string; overload;                             // Ini File 값 읽기
function  GetIniFile(aSection, aIdent: string; aDefault: Integer): Integer; overload;                   // Ini File 값 읽기
function  GetIniFile(aSection, aIdent: string; aDefault: Boolean): Boolean; overload;                   // Ini File 값 읽기
// 대화상자
procedure MsgBox(const aMessage: string);                                                               // 대화상자
procedure ErrBox(const aMessage: string);                                                               // 에러 대화상자
function  AskBox(const aMessage: string): Boolean;                                                      // 질문 대화상자
function  InputBox(const aMessage: string; var aValue: string; aMaxLength: Integer = 0; aPassword: Boolean = false; aNumber: Boolean = false): Boolean;    // 입력 대화상자
function  PasswordBox(const aMessage: string; var aValue: string): Boolean;                             // 비밀번호 입력 대화상자
// 기타
function  GetFileVersion(aFileName:String=''): string;                                                                       // 파일 버전 구하기
function  GetIPAddress: string;                                                                         // 로컬PC IP 구하기
function  GetMacAddress: string;                                                                        // 랜카드 MAC 어드래스 구하기
function  GetPCName: string;
function  Encrypt(const aStr: string; aKey: Word): string;                                              // 암호걸기
function  Decrypt(const aStr: string; aKey: Word): string;                                              // 암호풀기
function  GetPhoneNo(aTelNo: string): string;                                                           // 전화번호에 하이픈넣기
function  CheckIDNo(const aIDNo: string; aNullIsError: Boolean = False) : Boolean;                      // 주민/사업자번호 맞는지 검사
function  GetBarcode(aCode: string): string;                                                            // 바코드
function  GetCardNo(const aCardNo: string): string;                                                     // 카드번호 구하기(1111222233334444 -> 1111-2222-****-4444)
function  CheckOption(aIndex: Integer; aValue: Char = '1'): Boolean;                                    // 옵션 확인
function  GetStoreOption(aIndex: Integer; aDefaultValue: Char = '0'): Char;
function  GetOption(aIndex: Integer; aDefaultValue: Char = '0'): Char;
function  GetHeadOption(aIndex: Integer; aDefaultValue: Char = '0'): Char;
function  GetChainHeadOption(aIndex: Integer; aDefaultValue: Char = '0'): Char;
function  GetStrPointerIndex(aComBoBox:TcxComboBox; aValue:String):Integer;
function  GetStrPointerData(aComBoBox:TcxComboBox):String;
function  StringToColorDef(aValue:String; aColor:TColor):TColor;
procedure SetPosNo(aComboBox :TcxComboBox);
procedure SetKitchen(aComboBox :TcxComboBox);
procedure PrintPrinter(AValue:AnsiString);
function  PrinterCommendReplace(AValue:AnsiString):AnsiString;
function  CharToNum(aChar:Char):Integer;
function  NumToChar(aValue: Integer): Char;
function  isChar(aStr:String; aChar:Char):Boolean;
function  Space(aLen:Integer):String;
function  FindForm(aFormName: string): THandle;
function  CheckSurvey(aDate:String):Boolean;
function  CheckPhoneNo(aTelNo:String):Boolean;
procedure ExecuteProgram(aFileName:String;aPath:String;aParameter:String; aWait:Boolean=false);
procedure LogSave(aJob, aForm, aActionName, aActionText, aLog:String);  //aLog :Log구분, 폼,
procedure ProgramUseLogSave(aForm, aCaption:String);
function  GetDosOutput(aCommandLine, aWorkPath: string): string;
function  isDate(aStr:String):Boolean;
function  isTime(aStr:String):Boolean;
function  ConvertSQL(aSQL: string; aParam: array of Variant): String;
function  CheckMonthClose(aClose,aDate:String):Boolean;
function  SetProgramAuth(aAuth:Integer):String;
procedure ShowChart(aWebBrowser:TWebBrowser; aChartName, aChartType, aChartData :String);
function  isWindows64 : Boolean;
function  CharCnt(aStr:String;aChar:Char):Integer;
procedure SetComPort(aComboBox:TcxComboBox; aDefault:String='');
function  LineFeed(aValue: String): String;
function  FormatEx(aSQL:String; aParam: array of Variant) :String;

procedure SetWorkStoreList;
function  ImageUpLoad(aPath,aFileName:String):Boolean;
function  ImageDownLoad(aPath,aFileName:String;aSavePath:String=''):Boolean;
function  ImageDelete(aPath,aFileName:String):Boolean;
function  GetHttpURL:String;
function  GetLetsOrderURL(aCompany:String):String;
function  LetsOrderImageUpLoad(aUploadFile, aFileName, aType:String):String;
function  LetsOrderImageDelete(aFileName, aType:String):Boolean;
function  LetsOrderImageInvalidate:Boolean;
function  LetsOrderAuth(aHeadStore:String):String;
function  LetsOrderSync(aSyncData:String):Boolean;
function  SendTabletMessage(aMsgType:String; aTableNo:Integer; aMsg:String; aShow:Boolean=false):Boolean;

function  GetRestDBURL(aCompanyCode:String):String;
function  FileDownLoad(aFileName: String; aPath:String=''): Boolean;
function  SetWorkingTable(aWork, aTable, aPK:String):Boolean;
function  GetWorkingTable( aTable, aPK:String):Boolean;
function  GetFileSize(aFileName:String):Integer;
function  GetPartitionTable(aTable:String; aFromDate, aToDate:TDateTime; aJoin:String=''):String; overload;
function  GetPartitionTable(aTable:String; aDate:TDateTime; aJoin:String=''):String; overload;
function  RunningProgram(aExeFileName: String): Boolean;
function  IsRustDeskInstalled: Boolean;
function  RunRustDesk: Boolean;
function  EnsureRustDeskRunning: Boolean;
function  IsProcessRunning(const ExeFileName: string): Boolean;
function  GetRustDeskPath: string;
procedure SetComPortList(aComPortComboBox:TcxComboBox; aDefault:String);

implementation

uses
  DBModule;

//==============================================================================
// 형변환
//------------------------------------------------------------------------------
// 문자를 정수로
function StoI(aValue: string): Integer;
begin
  aValue := Replace(aValue, ',', EmptyStr);
  aValue := Trim(aValue);

  if (Length(aValue) > 9) or (aValue = EmptyStr) then
    aValue := '0';
  try
    Result := StrToInt(aValue);
  except
    Result := 0;
  end;
end;
function StoI64(aValue: string): Int64;
begin
  aValue := Replace(aValue, ',', EmptyStr);
  aValue := Trim(aValue);

  if (Length(aValue) > 18) or (aValue = EmptyStr) then
    aValue := '0';
  try
    Result := StrToInt64(aValue);
  except
    Result := 0;
  end;
end;
//------------------------------------------------------------------------------
// 문자를 실수로
function StoF(aValue: string): Double;
begin
  aValue := Trim(aValue);
  if aValue = EmptyStr then
    aValue := '0';
  try
    Result := StrToFloat(aValue);
  except
    Result := 0.0;
  end;
end;

//------------------------------------------------------------------------------
// 문자를 16진수로
function StrToHex(const aValue: string): string;
var
  vIndex: Integer;
begin
  SetLength(Result, Length(aValue)*2);
  for vIndex := 0 to Length(aValue)-1 do
  begin
    Result[(vIndex*2)+1] := HexaChar[Integer(aValue[vIndex+1]) shr   4];
    Result[(vIndex*2)+2] := HexaChar[Integer(aValue[vIndex+1]) and $0F];
  end;
end;

//------------------------------------------------------------------------------
// 16진수를 문자로
function HexToStr(const aHex: string): string;
var
  vIndex : Integer;
begin
  SetLength(Result, Length(aHex) div 2);
  for vIndex := 0 to (Length(aHex) div 2)-1 do
    Result[vIndex+1] := Char(StrToInt('$'+Copy(aHex, (vIndex*2)+1, 2)));
end;

//16진수를 2진수로
function HexToBin(aHex: string): string;
const
  BCD: array [0..15] of string =
    ('0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111',
    '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111');
var
  i: integer;
begin
  for i := Length(aHex) downto 1 do
    Result := BCD[StrToInt('$' + aHex[i])] + Result;
end;

function TColorToHex(Color : TColor) : string;
begin
  Result :=
     IntToHex(GetRValue(Color), 2) +
     IntToHex(GetGValue(Color), 2) +
     IntToHex(GetBValue(Color), 2) ;
end;

function HexToTColor(sColor : string) : TColor;
begin
   Result :=
     RGB(
       StrToInt('$'+Copy(sColor, 1, 2)),
       StrToInt('$'+Copy(sColor, 3, 2)),
       StrToInt('$'+Copy(sColor, 5, 2))
     ) ;
end;

function BinToHex2(aBin: string): string;
const
  BinArray: array[0..15, 0..1] of string =
    (('0000', '0'), ('0001', '1'), ('0010', '2'), ('0011', '3'),
     ('0100', '4'), ('0101', '5'), ('0110', '6'), ('0111', '7'),
     ('1000', '8'), ('1001', '9'), ('1010', 'A'), ('1011', 'B'),
     ('1100', 'C'), ('1101', 'D'), ('1110', 'E'), ('1111', 'F'));
var
  Error: Boolean;
  j: Integer;
  BinPart: string;
begin
  Result:='';

  Error:=False;
  for j:=1 to Length(aBin) do
    if not (aBin[j] in ['0', '1']) then
    begin
      Error:=True;
      Break;
    end;

  if not Error then
  begin
    case Length(aBin) mod 4 of
      1: aBin:='000'+aBin;
      2: aBin:='00'+aBin;
      3: aBin:='0'+aBin;
    end;

    while Length(aBin)>0 do
    begin
      BinPart:=Copy(aBin, Length(aBin)-3, 4);
      Delete(aBin, Length(aBin)-3, 4);
      for j:=1 to 16 do
        if BinPart=BinArray[j-1, 0] then
          Result:=BinArray[j-1, 1]+Result;
    end;
  end;
end;

function ByteToString(const Value: TByteArr): String;
var
  I: integer;
  S : String;
  Letra: char;
begin
  S := '';
  for I := Length(Value)-1 downto 0 do begin
    letra := Chr(Value[I] + 48);
    S := letra + S;
  end;
  Result := S;
end;

function StrToByte(const Value: String): TByteArr;
var
  I: integer;
begin
  SetLength(Result, Length(Value));
  for I := 0 to Length(Value) - 1 do
    Result[I] := ord(Value[I + 1]) - 48;
end;

//------------------------------------------------------------------------------
// 날짜를 문자(yyyymmdd)로
function DtoS(const aValue: TDateTime): string;
var
  vYear, vMonth, vDay: word;
begin
  Result := EmptyStr;
  if aValue <= 0 then
    Exit;
  if DateToStr(aValue) <> EmptyStr then
  begin
    DecodeDate(aValue, vYear, vMonth, vDay);
    Result := IntToStr(vYear) + FormatFloat('00', vMonth) + FormatFloat('00', vDay);
  end;
end;



//------------------------------------------------------------------------------
// 시간을 문자열(hh:nn)로
function TtoS(const aValue: TDateTime): string;
begin
  Result := FormatDateTime(fmtTime, aValue);
end;
//------------------------------------------------------------------------------
// 문자(yyyymmdd)를 날짜로
function StoD(const aValue: string): TDateTime;
var
  vSep: Char;
  vTemp :String;
begin
  Result := EncodeTime(0,0,0,0);
  vTemp  := GetOnlyNumber(aValue);
  vSep   := FormatSettings.DateSeparator;
  if vTemp <> EmptyStr then
    try
      if Length(vTemp) = 8 then
        Result := StrToDate(Copy(vTemp, 1, 4)+vSep+Copy(vTemp, 5, 2)+vSep+Copy(vTemp, 7, 2))
      else if Length(vTemp) = 6 then
        Result := StrToDate(Copy(vTemp, 1, 2)+vSep+Copy(vTemp, 3, 2)+vSep+Copy(vTemp, 5, 2))
      else if Length(vTemp) = 10 then
        Result := StrToDate(vTemp);
    except

    end;
end;
//------------------------------------------------------------------------------
// 문자(hh:nn)를 시간으로
function StoT(const aValue: string): TDateTime;
var
  vSep: Char;
begin
  Result := 0;
  vSep   := FormatSettings.TimeSeparator;
  if Trim(aValue) <> EmptyStr then
    try
      if Length(aValue) = 4 then
        Result := StrToTime(Copy(aValue, 1, 2)+vSep+Copy(aValue, 3, 2))
      else if Length(aValue) = 5 then
        Result := StrToTime(Copy(aValue, 1, 2)+vSep+Copy(aValue, 4, 2))
      else if Length(aValue) = 6 then
        Result := StrToTime(Copy(aValue, 1, 2)+vSep+Copy(aValue, 3, 2)+vSep+Copy(aValue, 5, 2))
      else if Length(aValue) = 8 then
        Result := StrToTime(Copy(aValue, 1, 2)+vSep+Copy(aValue, 4, 2)+vSep+Copy(aValue, 7, 2))
    except
    end;
end;

//==============================================================================
// 문자열
//------------------------------------------------------------------------------
// 문자열 중 숫자만 뽑기
function GetOnlyNumber(const aValue: string): string;
var
  vIndex: Integer;
begin
  Result := EmptyStr;
  for vIndex := Length(aValue) downto 1 do
    if CharInSet(aValue[vIndex], ['0'..'9']) or ((vIndex = 1) and (aValue[vIndex] = '-')) then
      Insert(aValue[vIndex], Result, 1);
end;
//------------------------------------------------------------------------------
// 문자열 중 특정 문자열을 다른 문자열로 바꾸기
function Replace(aData, aSrc, aDst: string): string;
begin
  Result := StringReplace(aData, aSrc, aDst, [rfReplaceAll]);
end;
//------------------------------------------------------------------------------
// 날짜를 문자로 (20010101 -> 2001-01-01)
function DateToString(const aDate: string; aSepChar: Char): string;
var
  vIndex: Integer;
  vBool: Boolean;
begin
  if Length(aDate) = 8 then
  begin
    for vIndex := 1 to 8 do
      if CharInSet(aDate[vIndex], ['0'..'9']) then
        vBool := True
      else
      begin
        vBool := False;
        Break;
      end;
    if vBool then
      Result := Copy(aDate, 1, 4)+aSepChar+Copy(aDate, 5, 2)+aSepChar+Copy(aDate, 7, 2)
    else
    begin
      Result := aDate;
      Exit;
    end;

    try
      StrToDate(Result);
    except
      Result := aDate;
    end;
  end
  else
    Result := aDate;
end;
//------------------------------------------------------------------------------
// 문자열 앞을 원하는 문자로 채우기
function LPad(const aStr: string; aLength: Integer; aPadChar: Char): string;
var
  vIndex: Integer;
begin
  Result := aStr;
  if LengthB(aStr) < aLength then
    for vIndex := 0 to aLength-LengthB(aStr)-1 do
      Result := string(aPadChar)+Result;
end;
//------------------------------------------------------------------------------
// 문자열 뒤를 원하는 문자로 채우기
function RPad(const aStr: string; aLength: Integer; aPadChar: Char): string;
var
  vIndex: Integer;
begin
  Result := aStr;
  if LengthB(aStr) < aLength then
    for vIndex := 0 to aLength-LengthB(aStr)-1 do
      Result := Result+string(aPadChar);
end;
//------------------------------------------------------------------------------
// 문자열을 구분자 기준으로 나누어 문자리스트로 리턴하기
procedure Split(const aStr: string; aSplitChar: Char; var aList: TStringList);
begin
  aList.Clear;
  aList.Delimiter       := aSplitChar;
  aList.StrictDelimiter := True;
  aList.DelimitedText   := aStr;
end;
//------------------------------------------------------------------------------
// 문자열 길이를 Byte 단위로 리턴
function LengthB(aStr: string): Integer;
begin
  Result := Length(AnsiString(aStr));
end;
//------------------------------------------------------------------------------
// 한글 Copy
// Copy로 끊는 마지막 글자가 한글일 경우 반이 짤려서 문제가 생기는 것 방지
function CopyStr(const aStr: string; aIndex, aCount: Integer): Ansistring;
var
  vStr   : AnsiString;
  vResult: AnsiString;
begin
  vStr := AnsiString(aStr);
  // 원하는 글자보다 한 글자 더 가져온다
  vResult := Copy(vStr, aIndex, aCount+1);
  // 마지막 글자가 한글 첫글자인지 확인한다
  if (Length(vResult) >= aCount) and (ByteType(vResult, aCount) = mbLeadByte) then
    Result := String(Copy(vResult, 1, aCount-1)+' ')
  else
    Result := String(Copy(vResult, 1, aCount));
end;
function CopyStr(const aStr: string; aCount: Integer): Ansistring;
var
  vStr: AnsiString;
begin
  // Count가 +면 앞쪽부터 자르기, -면 뒤쪽부터 자르기
  if aCount > 0 then
    Result := CopyStr(aStr, 1, aCount)
  else if aCount < 0 then
  begin
    vStr := AnsiString(aStr);
    if Length(vStr) > aCount then
      Result := CopyStr(aStr, Length(vStr)-aCount, aCount)
    else
      Result := aStr;
  end
  else
    Result := EmptyStr;
end;
function CopyStr(const aStr: Variant; aIndex, aCount: Integer): Ansistring;
var
  vStr: string;
begin
  try
    if aStr = null then
      vStr := EmptyStr
    else if (VarType(aStr) = varSmallint) or (VarType(aStr) = varInteger) or (VarType(aStr) = varByte) then
      vStr := IntToStr(Integer(aStr))
    else if (VarType(aStr) = varSingle) or (VarType(aStr) = varDouble) or (VarType(aStr) = varCurrency) then
      vStr := FloatToStr(Currency(aStr))
    else if VarType(aStr) = varDate then
      vStr := FormatDateTime(fmtDate, TDateTime(aStr))
    else
      vStr := string(aStr);
  except
    vStr := EmptyStr;
  end;
  Result := CopyStr(vStr, aIndex, aCount);
end;
//------------------------------------------------------------------------------
// 뭐하는 함수인지 모르겠음...
function CopyPos(aStr :String; aChar :Char; aPOS:Integer):String;
var
  vIndex: Integer;
begin
  if aStr = EmptyStr then
  begin
    Result := EmptyStr;
    Exit;
  end;

  try
    if aStr[Length(aStr)] <> aChar then
      aStr := aStr + aChar;
    for vIndex := 1 to aPOS do
      Delete(aStr, 1, Pos(aChar, aStr));
    Result := Copy(aStr, 1, Pos(aChar, aStr)-1);
  except
    Result := EmptyStr;
  end;
end;
//------------------------------------------------------------------------------
// Null이면 기본값으로 바꾸기
function Nvl(aValue: Variant; aDefaultValue: string): string;
begin
  if aValue = null then
    Result := aDefaultValue
  else
    Result := string(aValue);
end;
function Nvl(aValue: Variant; aDefaultValue: Currency): Currency;
begin
  if (aValue = null) then
    Result := aDefaultValue
  else if ((VarType(aValue)= varString) or (VarType(aValue)= varUString)) and (aValue = '') then
    Result := aDefaultValue
  else
    try
      Result := Currency(aValue);
    except
      Result := aDefaultValue;
    end;
end;
function Nvl(aValue: Variant; aDefaultValue: Integer): Integer;
begin
  if (aValue = null) then
    Result := aDefaultValue
  else if ((VarType(aValue)= varString) or (VarType(aValue)= varUString)) and (aValue = '') then
    Result := aDefaultValue
  else
    try
      Result := Integer(Trunc(aValue));
    except
      Result := aDefaultValue;
    end;
end;
function Nvl(aValue: Variant; aDefaultValue: Boolean ): Boolean;
begin
  if aValue = null then
    Result := aDefaultValue
  else
    try
      Result := Boolean(aValue);
    except
      Result := aDefaultValue;
    end;
end;

//------------------------------------------------------------------------------
// 숫자를 한글로 변황
function GetValueHan(Value: Extended): String;
var
   s: String;
   i, iDiv, iMod: Integer;
   Flag: Boolean;
const
      M1: Array[0..9] of String= ('','일','이','삼','사','오','육','칠','팔','구');
      M2: Array[0..3] of String =('','십','백','천');
      M3: Array[0..3] of String =('','만','억','조');
begin
  s := FloatToStr(Abs(Value));
  if pos('.', s) > 0 then s := Copy(s, 1, pos('.',s)-1);

  Flag := False;
  Result := '';
  for i := 1 to Length(s) do
  begin
    iDiv := (Length(s)-i) div 4;
    iMod := (Length(s)-i) mod 4;

    if StrToInt(s[i]) <> 0 then
    begin
      Flag := True;
      Result := Result + M1[StrToInt(s[i])] + M2[iMod];
    end;
    if (iMod = 0) and Flag then
    begin
      Flag := False;
      Result := Result + M3[iDiv];
    end;
  end;
end;

//==============================================================================
// 숫자계산
//------------------------------------------------------------------------------
// 반올림
function RoundNumber(aNumber: Currency; aUnit: Currency): Currency;
begin
  // 델파이에서 Banker's Round 계산법을 사용해서 새로 만듦
//Result := Round(aNumber/aUnit)*aUnit;
  if aNumber = 0 then
    Result := 0
  else if aNumber > 0 then
    Result := Trunc(aNumber/aUnit+0.5)*aUnit
  else
    Result := Trunc(aNumber/aUnit-0.5)*aUnit
end;
//------------------------------------------------------------------------------
// 올림
function CeilNumber(aNumber: Currency; aUnit: Currency): Currency;
begin
  if aNumber >= 0 then
    Result := Ceil (aNumber/aUnit)*aUnit
  else
    Result := Floor(aNumber/aUnit)*aUnit;
end;
//------------------------------------------------------------------------------
// 내림
function FloorNumber(aNumber: Currency; aUnit: Currency): Currency;
begin
  if aNumber >= 0 then
    Result := Floor(aNumber/aUnit)*aUnit
  else
    Result := Ceil (aNumber/aUnit)*aUnit;
end;
//------------------------------------------------------------------------------
// 옵션에 따라 계산
function CalcOptionNumber(aNumber: Currency; aOptionIndex: Integer): Currency;
var
  vRoundUnit: Currency;
begin
  if Length(Options) < aOptionIndex then
    Result := 0
  else
  begin
    // 이익률 계산단위 (0:사용안함, A:1원올림, B:1원반올림, C:1원버림, D:10원올림, E:10원반올림, F:10원버림, G:50원올림, H:50원반올림, I:50원버림, J:100원올림, K:100원반올림, L:100원버림, M:500원올림, N:500원반올림, O:500원버림, P:1000원올림, Q:1000원반올림, R:1000원버림, S:5000원올림, T:5000원반올림, U:5000원버림, V:10000원올림, W:10000원반올림, X:10000원버림)
    case Ord(Options[aOptionIndex]) - Ord('A') of
       0, 1, 2: vRoundUnit := 10;
       3, 4, 5: vRoundUnit := 100;
       6, 7, 8: vRoundUnit := 500;
       9,10,11: vRoundUnit := 1000;
      12,13,14: vRoundUnit := 5000;
      15,16,17: vRoundUnit := 10000;
      18,19,20: vRoundUnit := 50000;
      21,22,23: vRoundUnit := 100000;
      else      vRoundUnit := 1;
    end;
    // 판매단가 계산
    case Ord(Options[aOptionIndex]) - Ord('A') of
       0, 3, 6, 9,12,15,18,21: Result := CeilNumber (aNumber, vRoundUnit);
       1, 4, 7,10,13,16,19,22: Result := RoundNumber(aNumber, vRoundUnit);
       2, 5, 8,11,14,17,20,23: Result := FloorNumber(aNumber, vRoundUnit);
      else                     Result := RoundNumber(aNumber);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 이익률 계산
function  CalcSaleProfitRate(aBuyAmt, aSaleAmt:Currency): Currency;
begin
  aBuyAmt  := Nvl(aBuyAmt,  0.0);
  aSaleAmt := Nvl(aSaleAmt, 0.0);

  //매입단가가 0원일때는 이익률을 임의로 입력할 수도 있어서 이익률을 0으로 하지 않는다
  if (aBuyAmt = 0) and (aSaleAmt = 0) then
    Result := 0
  else if (aBuyAmt <> 0) and (aSaleAmt = 0) then
    Result := -100
  else
    Result := RoundNumber(100 - aBuyAmt / aSaleAmt * 100, 0.01);

  if Result > 100 then
    Result := 100
  else if Result < -100 then
    Result := -100;
end;

//==============================================================================
// 레지스트리
//------------------------------------------------------------------------------
// 레지스트리 값 저장
function SetRegistry(aRootKey: HKEY; aKey, aValue:String; aData: Variant): Boolean;
begin
  Result := False;
  with TRegistry.Create do
    try
      RootKey := aRootKey;
      if OpenKey(aKey, True) then
      begin
        case VarType(aData) of
          varString,
          varUString  : WriteString(aValue,aData);
          varInteger,
          varByte     :  WriteInteger(aValue,aData);
        end;
        Result := True;
      end;
    finally
      Free;
    end;
end;
function SetRegistryBin(aRootKey: HKEY; aKey, aValue, aData: string): Boolean;
var vBuffer :String;
    vBufSize :Integer;
begin
  Result := False;
  with TRegistry.Create do
    try
      RootKey := aRootKey;
      if OpenKey(aKey, True) then
      begin
        vBuffer := aData;
        WriteBinaryData(aValue, vBuffer[1], Length(vBuffer));
        Result := True;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 레지스트리 값 읽기
function GetRegistry(aRootKey: HKEY; aKey, aValue, aDefault: string): Variant;
var vBuffer   : String;
    vBufSize :Integer;
begin
  Result := aDefault;
  with TRegistry.Create do
    try
      RootKey := aRootKey;
      if KeyExists(aKey) and OpenKey(aKey, False) and ValueExists(aValue) then
        try
          if GetDataType(aValue) = rdBinary then
          begin
            vBufSize := GetDataSize(aValue);

            Setlength(vBuffer, vBufSize);
            ReadBinaryData(aValue, vBuffer[1], vBufSize);
            Result := StrToHex(vBuffer);
          end
          else if GetDataType(aValue) = rdInteger then
            Result := ReadInteger(aValue)
          else if GetDataType(aValue) = rdString then
            Result := ReadString(aValue);
        except
        end;
    finally
      Free;
    end;
end;

//------------------------------------------------------------------------------
// Ini File 값 저장
function SetIniFile(aSection, aIdent, aData: string): Boolean;
begin
  Result := false;
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      try
        WriteString(aSection, aIdent, aData);
        Result := true;
      except
      end;
    finally
      Free;
    end;
end;
function SetIniFile(aSection, aIdent: string; aData: Integer): Boolean;
begin
  Result := false;
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      try
        WriteInteger(aSection, aIdent, aData);
        Result := true;
      except
      end;
    finally
      Free;
    end;
end;
function SetIniFile(aSection, aIdent: string; aData: Boolean): Boolean;
begin
  Result := false;
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      try
        WriteBool(aSection, aIdent, aData);
        Result := true;
      except
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// Ini File 값 읽기
function GetIniFile(aSection, aIdent, aDefault: string): string;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      Result := ReadString(aSection, aIdent, aDefault);
    finally
      Free;
    end;
end;
function GetIniFile(aSection, aIdent: string; aDefault: Integer): Integer;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      Result := ReadInteger(aSection, aIdent, aDefault);
    finally
      Free;
    end;
end;
function GetIniFile(aSection, aIdent: string; aDefault: Boolean): Boolean;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+filConfigIni) do
    try
      Result := ReadBool(aSection, aIdent, aDefault);
    finally
      Free;
    end;
end;

//==============================================================================
// 대화상자
//------------------------------------------------------------------------------
// 일반 대화상자
procedure MsgBox(const aMessage: string);
begin
  BlockInput(false);
  Application.MessageBox(PChar(aMessage), PChar(Application.Title), MB_OK+MB_ICONINFORMATION);
end;
//------------------------------------------------------------------------------
// 에러 대화상자
procedure ErrBox(const aMessage: string);
begin
  BlockInput(false);
  Application.MessageBox(PChar(aMessage), PChar(Application.Title), MB_OK+MB_ICONERROR);
end;
//------------------------------------------------------------------------------
// 질문 대화상자
function AskBox(const aMessage: string): Boolean;
begin
  BlockInput(false);
  Result := Application.MessageBox(PChar(aMessage), PChar(Application.Title), MB_YESNO+MB_ICONQUESTION) = idYes;
end;
//------------------------------------------------------------------------------
// 입력 대화상자
function InputBox(const aMessage: string; var aValue: string; aMaxLength: Integer; aPassword, aNumber: Boolean): Boolean;
  function GetAveCharSize(aCanvas: TCanvas): TPoint;
  var
    vIndex: Integer;
    vBuffer: array[0..51] of Char;
  begin
    for vIndex := 0 to 25 do
      vBuffer[vIndex] := Chr(vIndex+Ord('A'));
    for vIndex := 0 to 25 do
      vBuffer[vIndex+26] := Chr(vIndex+Ord('a'));
    GetTextExtentPoint(aCanvas.Handle, vBuffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;
var
  vForm : TForm;
  vLabel: TLabel;
  vEdit : TEdit;
  vDialogUnits: TPoint;
  vButtonTop, vButtonWidth, vButtonHeight: Integer;
begin
  BlockInput(false);
  Result := False;
  vForm  := TForm.Create(Application);
  with vForm do
    try
      Font.Name    := '맑은 고딕';
      Font.Size    := 10;
      Canvas.Font  := Font;
      vDialogUnits := GetAveCharSize(Canvas);
      BorderStyle  := bsDialog;
      Caption      := Application.Title;
      ClientWidth  := MulDiv(180, vDialogUnits.X, 4);
      Position     := poScreenCenter;
      vLabel := TLabel.Create(vForm);
      with vLabel do
      begin
        Parent   := vForm;
        Font.Assign(vForm.Font);
        Caption  := aMessage;
        AutoSize := True;
        Left     := MulDiv(8, vDialogUnits.X, 4);
        Top      := MulDiv(8, vDialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, vDialogUnits.X, 4);
        WordWrap := True;
      end;
      vEdit := TEdit.Create(vForm);
      with vEdit do
      begin
        if aPassword then
          PasswordChar := '*';
        Parent    := vForm;
        Font.Assign(vForm.Font);
        Left      := vLabel.Left;
        Top       := vLabel.Top + vLabel.Height + 5;
        Width     := MulDiv(164, vDialogUnits.X, 4);
        MaxLength := aMaxLength;
        Text      := aValue;
        SelectAll;
      end;
      vButtonTop    := vEdit.Top + vEdit.Height + 15;
      vButtonWidth  := 90;
      vButtonHeight := 28;
      with TButton.Create(vForm) do
      begin
        Parent      := vForm;
        Font.Assign(vForm.Font);
        Caption     := '확인(&K)';
        ModalResult := mrOk;
        Default     := True;
        SetBounds(vEdit.Left + vEdit.Width - vButtonWidth * 2 - 10, vButtonTop, vButtonWidth, vButtonHeight);
      end;
      with TButton.Create(vForm) do
      begin
        Parent      := vForm;
        Font.Assign(vForm.Font);
        Caption     := '취소(&C)';
        ModalResult := mrCancel;
        Cancel      := True;
        SetBounds(vEdit.Left + vEdit.Width - vButtonWidth, vButtonTop, vButtonWidth, vButtonHeight);
        vForm.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        if aNumber then
          aValue := GetOnlyNumber(vEdit.Text)
        else
          aValue := vEdit.Text;
        Result := True;
      end;
    finally
      vForm.Free;
    end;
end;
//------------------------------------------------------------------------------
// 비밀번호 입력 대화상자
function PasswordBox(const aMessage: string; var aValue: string): Boolean;
begin
  Result := InputBox(aMessage+'  ', aValue, 0, true);
end;

//==============================================================================
// 기타 함수
//------------------------------------------------------------------------------
// 파일 버전 구하기
function GetFileVersion(aFileName:String):String;
var
  vBufferSize   : DWord;
  vReserved     : DWord;
  vPBuffer      : PChar;
  vFixedFileInfo: PVSFixedFileInfo;
  vLen          : UINT;
begin
  Result      := EmptyStr;
  if aFileName = '' then
    aFileName := Application.ExeName;
  vBufferSize := GetFileVersionInfoSize(PChar(aFileName), vReserved);
  if vBufferSize > 0 then
  begin
    GetMem(vPBuffer, vBufferSize);
    try
      if Assigned(vPBuffer) then
      begin
        if not GetFileVersionInfo(PChar(aFileName), vReserved, vBufferSize, vPBuffer) then
          Exit;
        if not VerQueryValue(vPBuffer, '\', pointer(vFixedFileInfo), vLen) then
          Exit;

        Result := Format('%.04d.%.02d.%.02d.%d', [Word(vFixedFileInfo.dwFileVersionMS shr    16),
                                                  Word(vFixedFileInfo.dwFileVersionMS and $FFFF),
                                                  Word(vFixedFileInfo.dwFileVersionLS shr    16),
                                                  Word(vFixedFileInfo.dwFileVersionLS and $FFFF)]);
      end;
    finally
      FreeMem(vPBuffer);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 로컬PC IP 구하기
function  GetIPAddress: string;
var
  vWSAData : TWSAData;
  vHostName: AnsiString;
  vHostEnt : pHostEnt;
begin
  WSAStartup(2, vWSAData);
  SetLength(vHostName, 255);
  GetHostName(PAnsiChar(vHostName), 255);
  SetLength(vHostName, StrLen(PAnsiChar(vHostName)));
  vHostEnt := GetHostByName(PAnsiChar(vHostName));

  if not Assigned(vHostEnt) then
    Result :='127.0.0.1'
  else
    with vHostEnt^ do
      Result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
  WSACleanup;
end;
//------------------------------------------------------------------------------
// 랜카드 MAC 어드래스 구하기
function GetMacAddress: string;
  function GetMacAddress2: string;
  var
    vNCB          : PNCB;
    vAdapterStatus: PAdapterStatus;
    vReturnCode   : AnsiChar;
    vIndex        : Integer;
    vLen          : PlanaEnum;
    vSystemID     : string;
  begin
    Result    := '';
    vSystemID := '';
    GetMem(vNCB, SizeOf(TNCB));
    FillChar(vNCB^, SizeOf(TNCB), 0);
    GetMem(vLen, SizeOf(TLanaEnum));
    FillChar(vLen^, SizeOf(TLanaEnum), 0);
    GetMem(vAdapterStatus, SizeOf(TAdapterStatus));
    FillChar(vAdapterStatus^, SizeOf(TAdapterStatus), 0);
    vLen.Length      := Chr(0);
    vNCB.ncb_command := Chr(NCBEnum);
    vNCB.ncb_buffer  := Pointer(vLen);
    vNCB.ncb_length  := SizeOf(vLen);
    vIndex           := 0;
    repeat
      FillChar(vNCB^, SizeOf(TNCB), 0);
      vNCB.ncb_command  := Chr(NCBReset);
      vNCB.ncb_lana_num := vLen.lana[vIndex];
      FillChar(vNCB^, SizeOf(TNCB), 0);
      vNCB.ncb_command  := Chr(NCBAstat);
      vNCB.ncb_lana_num := vLen.lana[vIndex];
      vNCB.ncb_callname := '* ';
      vNCB.ncb_buffer   := Pointer(vAdapterStatus);
      vNCB.ncb_length   := SizeOf(TAdapterStatus);
      vReturnCode       := Netbios(vNCB);
      if (vReturnCode = Chr(0)) or (vReturnCode = Chr(6)) then
        vSystemID := IntToHex(Ord(vAdapterStatus.adapter_address[0]),2)+'-'+
                     IntToHex(Ord(vAdapterStatus.adapter_address[1]),2)+'-'+
                     IntToHex(Ord(vAdapterStatus.adapter_address[2]),2)+'-'+
                     IntToHex(Ord(vAdapterStatus.adapter_address[3]),2)+'-'+
                     IntToHex(Ord(vAdapterStatus.adapter_address[4]),2)+'-'+
                     IntToHex(Ord(vAdapterStatus.adapter_address[5]),2);
      Inc(vIndex);
    until (vIndex >= Ord(vLen.length)) or (vSystemID <> '00-00-00-00-00-00');
    FreeMem(vNCB);
    FreeMem(vAdapterStatus);
    FreeMem(vLen);
    Result := vSystemID;
  end;
var
  vBindObj : IDispatch;
  vNetAdapters,
  vWMIService : OleVariant;
  vIndex, vValue : LongWord;
  vEnumVar : IEnumvariant;
  vBindCtx : IBindCtx;
  vMoniker : IMoniker;
  vFileObj : WideString;
begin
  Result   := EmptyStr;
  try
    vFileObj := 'winmgmts:\\.\root\cimv2';
    OleCheck(CreateBindCtx(0, vBindCtx));
    OleCheck(MkParseDisplayNameEx(vBindCtx, PWideChar(vFileObj), vIndex, vMoniker));
    OleCheck(vMoniker.BindToObject(vBindCtx, nil, IUnknown, vBindObj));
    vWMIService  := vBindObj;
    vNetAdapters := vWMIService.ExecQuery('select * from Win32_NetworkAdapterConfiguration where IPEnabled = True');
    vEnumVar     := IUnknown(vNetAdapters._NewEnum) as IEnumVariant;
    while vEnumVar.Next(1, vNetAdapters, vValue) = 0 do
      if not VarIsNull(vNetAdapters.MACAddress) then
      begin
        Result := Replace(vNetAdapters.MACAddress, ':', '-');
        Break;
      end;
    vNetAdapters := Unassigned;
    vWMIService  := Unassigned;
  except
  end;
  if Result = EmptyStr then
    Result := GetMacAddress2;
end;

function  GetPCName: string;
var
  CompName: array[0..256] of Char;
  i: DWord;
begin
  i:=256;
  GetComputerName(CompName, i);
  Result := StrPas(CompName);
end;

//------------------------------------------------------------------------------
// 암호걸기
function Encrypt(const aStr: string; aKey: Word): string;
var
  vIndex      : Integer;
  vFirstResult: string;
  vTemp       : Int64;
begin
  try
    SetLength(vFirstResult, Length(aStr));
    for vIndex := 1 to Length(aStr) do
    begin
      vFirstResult[vIndex] := Char(Byte(aStr[vIndex]) xor (aKey shr 8));
      vTemp := (Byte(vFirstResult[vIndex]) + aKey) * C1 + (C1 div C2);
      aKey  := StrToInt(Copy(IntToStr(vTemp),2,4));
    end;
    Result := StrToHex(vFirstResult);
  except
    Result := '';
  end;
end;
//------------------------------------------------------------------------------
// 암호풀기
function Decrypt(const aStr: string; aKey: Word): string;
var
  vIndex      : Integer;
  vFirstResult: string;
  vTemp       : Int64;
begin
  try
    vFirstResult := HexToStr(aStr);
    SetLength(Result, Length(vFirstResult));
    for vIndex := 1 to Length(vFirstResult) do
    begin
      Result[vIndex] := Char(Byte(vFirstResult[vIndex]) xor (aKey shr 8));
      vTemp := (Byte(vFirstResult[vIndex]) + aKey) * C1 + (C1 div C2);
      aKey  := StrToInt(Copy(IntToStr(vTemp),2,4));
    end;
  except
    Result := '';
  end;
end;


//------------------------------------------------------------------------------
// 전화번호에 하이픈넣기
function GetPhoneNo(aTelNo: string): string;
var
  vTemp: String;
begin
  vTemp := GetOnlyNumber(aTelNo);
  if (Length(vTemp) > 8) and (vTemp[1] <> '0') then
    Result := aTelNo
  else
    case Length(vTemp) of
       7 : Result := FormatMaskText('!000-0000;0; ',       vTemp);
       8 : Result := FormatMaskText('!0000-0000;0; ',      vTemp);
       9 : Result := FormatMaskText('!00-000-0000;0; ',    vTemp);
      10 : if Copy(vTemp, 1, 2) = '02' then
             Result := FormatMaskText('!00-0000-0000;0; ', vTemp)
           else
             Result := FormatMaskText('!000-000-0000;0; ', vTemp);
      11 : if Copy(vTemp, 1, 3) = '050' then
             Result := FormatMaskText('!0000-000-0000;0; ',  vTemp)
           else
             Result := FormatMaskText('!000-0000-0000;0; ',  vTemp);
      12 : Result := FormatMaskText('!0000-0000-0000;0; ',    vTemp);
      else Result := aTelNo;
    end;
end;
//------------------------------------------------------------------------------
// 주민등록번호/사업자번호 맞는지 검사하기
function  CheckIDNo(const aIDNo: string; aNullIsError: Boolean): Boolean;
var
  vStr: string;
  vIndex, vLastDigit: Integer;
begin
  Result := False;

  vStr := GetOnlyNumber(aIDNo);

  // 길이가 0일 경우(입력 안한 경우)
  if Length(vStr) = 0 then
  begin
    // null을 에러 처리하라면 에러, null을 에러 처리 하지 말라면 정상 리턴
    Result := not aNullIsError;
    Exit;
  end;

  // 체크디지트 구하기
  vLastDigit := StrToInt(vStr[Length(vStr)]);

  // 주민등록번호 검사
  if Length(vStr) = 13 then
  begin
    vIndex := StrToInt(vStr[ 1]) * 2 +
              StrToInt(vStr[ 2]) * 3 +
              StrToInt(vStr[ 3]) * 4 +
              StrToInt(vStr[ 4]) * 5 +
              StrToInt(vStr[ 5]) * 6 +
              StrToInt(vStr[ 6]) * 7 +
              StrToInt(vStr[ 7]) * 8 +
              StrToInt(vStr[ 8]) * 9 +
              StrToInt(vStr[ 9]) * 2 +
              StrToInt(vStr[10]) * 3 +
              StrToInt(vStr[11]) * 4 +
              StrToInt(vStr[12]) * 5;
    Result := ((11 - (vIndex mod 11)) mod 10) = vLastDigit;
  end

  // 사업자번호 검사
  else if Length(vStr) = 10 then
  begin
    vIndex := StrToInt(vStr[9]) * 5;
    vIndex := (vIndex div 10) + (vIndex mod 10);
    vIndex := vIndex +
              StrToInt(vStr[1]) + StrToInt(vStr[4]) + StrToInt(vStr[7]) +
             (StrToInt(vStr[2]) + StrToInt(vStr[5]) + StrToInt(vStr[8])) * 3 +
             (StrToInt(vStr[3]) + StrToInt(vStr[6])) * 7;
    if (vIndex mod 10) <> 0 then
      vIndex := 10 - (vIndex mod 10)
    else
      vIndex := 0;

    Result := vIndex = vLastDigit;
  end;
end;
//------------------------------------------------------------------------------
// 바코드 체크디지트 계산해서 리턴
function  GetBarcode(aCode: string): string;
  function UpcE2UpcA(aCode: string): string;
  begin
    if Length(aCode) = 7 then
      aCode := Copy(aCode, 1, 6)
    else if Length(aCode) = 8 then
      aCode := Copy(aCode, 2, 6);
    case aCode[6] of
      '0','1','2':
        Result := '0' + Copy(aCode, 1, 2) + aCode[6] + '0000' + Copy(aCode, 3, 3) + '0';
      '3':
        Result := '0' + Copy(aCode, 1, 3) + '00000' + Copy(aCode, 4, 2) + '0';
      '4':
        Result := '0' + Copy(aCode, 1, 4) + '00000' + aCode[5] + '0';
      else
        Result := '0' + Copy(aCode, 1, 5) + '0000' + aCode[6] + '0';
    end;
  end;
var
  vOdd, vEven: Integer;
  vUPCE: string;
begin
  // 바코드에 문자가 포함되어 있는지 확인
  aCode := GetOnlyNumber(aCode);

  // UPC-E 코드면 UPC-A로 바꿔서 체크디지트를 구한다
  if (Length(aCode) = 6) or (Length(aCode) = 7) or ((Length(aCode) = 8) and (aCode[1] = '0')) then
  begin
    vUPCE := aCode;
    aCode := UpcE2UpcA(aCode);
  end
  else
    vUPCE := EmptyStr;

  // 바코드 체크디지트 계산
  case Length(aCode) of
     8 : begin // EAN-8
           vOdd   := StrToInt(aCode[1])+StrToInt(aCode[3])+StrToInt(aCode[5])+StrToInt(aCode[7]);
           vEven  := StrToInt(aCode[2])+StrToInt(aCode[4])+StrToInt(aCode[6]);
           Result := Copy(aCode,1,7) + IntToStr((10 - ((vOdd*3 + vEven) mod 10)) mod 10);
         end;
    12 : begin // UPC-A
           vOdd   := StrToInt(aCode[1])+StrToInt(aCode[3])+StrToInt(aCode[5])+StrToInt(aCode[7])+StrToInt(aCode[ 9])+StrToInt(aCode[11]);
           vEven  := StrToInt(aCode[2])+StrToInt(aCode[4])+StrToInt(aCode[6])+StrToInt(aCode[8])+StrToInt(aCode[10]);
           Result := Copy(aCode,1,11) + IntToStr((10 - ((vOdd*3 + vEven) mod 10)) mod 10);
         end;
    13 : begin // EAN-13
           vOdd   := StrToInt(aCode[1])+StrToInt(aCode[3])+StrToInt(aCode[5])+StrToInt(aCode[7])+StrToInt(aCode[ 9])+StrToInt(aCode[11]);
           vEven  := StrToInt(aCode[2])+StrToInt(aCode[4])+StrToInt(aCode[6])+StrToInt(aCode[8])+StrToInt(aCode[10])+StrToInt(aCode[12]);
           Result := Copy(aCode,1,12) + IntToStr((10 - ((vOdd + vEven*3) mod 10)) mod 10);
         end;
    14 : begin // EAN-14, ITF-14 (Box)
           vOdd   := StrToInt(aCode[1])+StrToInt(aCode[3])+StrToInt(aCode[5])+StrToInt(aCode[7])+StrToInt(aCode[ 9])+StrToInt(aCode[11])+StrToInt(aCode[13]);
           vEven  := StrToInt(aCode[2])+StrToInt(aCode[4])+StrToInt(aCode[6])+StrToInt(aCode[8])+StrToInt(aCode[10])+StrToInt(aCode[12]);
           Result := Copy(aCode,1,13) + IntToStr((10 - ((vOdd*3 + vEven) mod 10)) mod 10);
         end;
    else       // 기타 (UPC-E는 체크디지트 계산이 되지 않는다)
         Result := aCode;
  end;
end;

//------------------------------------------------------------------------------
// 카드번호 구하기 (1111222233334444 -> 1111-2222-****-4444)
function GetCardNo(const aCardNo: string): string;
var vTemp :String;
begin
  vTemp := Replace(aCardNo,'-','');
  case Length(aCardNo) of
    14 : Result := FormatMaskText('0000-000***-**00;0;', LeftStr(vTemp,7)+RightStr(vTemp,2));
    15 : Result := FormatMaskText('0000-000***-**000;0;', LeftStr(vTemp,7)+RightStr(vTemp,3));
    16 : Result := FormatMaskText('0000-00**-****-0000;0;', LeftStr(vTemp,6)+RightStr(vTemp,4));
    else Result := vTemp;
  end;
end;

//------------------------------------------------------------------------------
// 옵션 확인
function CheckOption(aIndex: Integer; aValue: Char): Boolean;
begin
  Result := (Length(Options) >= aIndex) and (Options[aIndex] = aValue);
end;
//------------------------------------------------------------------------------
// 옵션 가져오기
function GetOption(aIndex: Integer; aDefaultValue: Char): Char;
begin
  if Length(Options) >= aIndex then
  begin
    Result := Options[aIndex];
  end
  else
    Result := aDefaultValue;
end;

function GetStoreOption(aIndex: Integer; aDefaultValue: Char): Char;
begin
  if Length(StoreOptions) >= aIndex then
    Result := StoreOptions[aIndex]
  else
    Result := aDefaultValue;
end;


function GetHeadOption(aIndex: Integer; aDefaultValue: Char): Char;
begin
  if Length(HeadOptions) >= aIndex then
    Result := HeadOptions[aIndex]
  else
    Result := aDefaultValue;
end;

function GetChainHeadOption(aIndex: Integer; aDefaultValue: Char): Char;
begin
  if Length(ChainHeadOptions) >= aIndex then
    Result := ChainHeadOptions[aIndex]
  else
    Result := aDefaultValue;
end;


//------------------------------------------------------------------------------
// 콤보박스에 연결된 값 찾기
function GetStrPointerIndex(aComboBox: TcxComboBox; aValue: string): Integer;
var
  vIndex: Integer;
begin
  Result := -1;
  for vIndex := 0 to aComboBox.Properties.Items.Count-1 do
    if (aComboBox.Properties.Items.Objects[vIndex] <> nil) and (PStrPointer(aComboBox.Properties.Items.Objects[vIndex]).Data = aValue) then
    begin
      Result := vIndex;
      Break;
    end;
end;

function  GetStrPointerData(aComBoBox:TcxComboBox):String;
begin
  if aComBoBox.ItemIndex >= 0 then
    result := PStrPointer(aComBoBox.Properties.Items.Objects[aComBoBox.ItemIndex]).Data
  else
    result := EmptyStr;
end;

function StringToColorDef(aValue:String; aColor:TColor):TColor;
begin
  try
    if aValue <> '' then
      Result := StringToColor(aValue)
    else
      Result := aColor;
  except
    Result := aColor;
  end;
end;

procedure SetPosNo(aComboBox :TcxComboBox);
begin
  DM.OpenQuery('select NM_CODE1 '
              +'  from MS_CODE '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and CD_KIND   = ''01'' '
              +'   and (NM_CODE3 in (''0'',''1'',''2'') or (NM_CODE3 =''3'' and NM_CODE2 <> '''')) '
              +'   and DS_STATUS = ''0'' '
              +' order by NM_CODE1 ',
              [HeadStoreCode,
               StoreCode]);

  aComboBox.Properties.Items.Clear;
  while not DM.Query.Eof do
  begin
    aComboBox.Properties.Items.Add(DM.Query.FieldbyName('NM_CODE1').Asstring);
    DM.Query.Next;
  end;
  DM.Query.Close;
  aComboBox.ItemIndex := 0;
end;

procedure SetKitchen(aComboBox :TcxComboBox);
var vCode :PStrPointer;
begin
  DM.OpenQuery('select CD_CODE, '
              +'       NM_CODE1 '
              +'  from MS_CODE '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and CD_KIND   = ''02'' '
              +'   and DS_STATUS = ''0'' ',
              [HeadStoreCode,
               StoreCode]);

  aComboBox.Properties.Items.Clear;
  while not DM.Query.Eof do
  begin
    New(vCode);
    vCode^.Data := DM.Query.FieldbyName('CD_CODE').Asstring;
    aComboBox.Properties.Items.AddObject(DM.Query.FieldbyName('NM_CODE1').Asstring, TObject(vCode));
    DM.Query.Next;
  end;
  DM.Query.Close;
  aComboBox.ItemIndex := 0;
end;

////////////////////////////////////////////////////////////////////////////////
// Name         : PrintPrinter
// Type         : procedure
// Explanation  : 영수증을 출력한다
////////////////////////////////////////////////////////////////////////////////
procedure PrintPrinter(AValue:AnsiString);
  procedure LPTPortInit;
  var
   aTimeOut : TCommTimeouts;
   bSuccess : boolean;
  begin
     LPTFile := CreateFile(PChar('LPT1'), GENERIC_WRITE, 0,nil,OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
     if GetCommTimeouts(LPTFile,aTimeOut) then
     begin
       aTimeOut.WriteTotalTimeoutMultiplier := 200;   // 200
       aTimeOut.WriteTotalTimeoutConstant   := 2000;   // 4000
       SetCommTimeouts(LPTFile,aTimeOut);
       bSuccess := SetCommTimeouts(LPTFile,aTimeOut);
     end;
  end;


  procedure LocalPrint(aPrintData :AnsiString);
  begin
    with TnrComm.Create(nil) do
      try
        ComPortNo      := StoI(GetOnlyNumber(GetIniFile('영수증프린터', '포트', '1')));
        BufferInSize   := 4096 * 10;
        BufferOutSize  := 4096 * 10;
        Parity         := pNone;
        StopBits       := sbOne;
        StreamProtocol := spNone;
        TimeoutRead    := 10000;
        TimeoutWrite   := 10000;
        TraceStates    := [tsRxChar];
        Update;

        case GetIniFile('영수증프린터', '속도', 0) of
          0 : BaudRate := 9600;
          1 : BaudRate := 19200;
          2 : BaudRate := 38400;
          3 : BaudRate := 57600;
          4 : BaudRate := 115200;
        end;
        try
          Active := true;
          Sleep(150);
        except
          raise Exception.Create('프린터포트 오픈 실패!!');
          Exit;
        end;
        SendString(aPrintData);
      finally
        Active := false;
        free;
      end;
  end;
var BytesWritten : DWORD;
    vHnd        :THandle;
    Data       :TCOPYDATASTRUCT;
    vPrintData :String;
    vAnsiData  :AnsiString;
begin
  vPrintData := PrinterCommendReplace(aValue);
  try
    //포스에 영수증 프린터를 사용한다고 체크했을때
    if GetIniFile('영수증프린터', '포스프린터사용',   False) then
    begin
      vHnd := FindWindow('TMain_F', nil);          //-- 받는 프로그램 이름
      vAnsiData := AnsiString(aValue);
      Data.dwData:=0;
      Data.cbData:=Length(vAnsiData)+1;
      Data.lpData:= PAnsiChar(vAnsiData);

      //포스프로그램이 실행되 있으면 포스프로그램에 출력메세지를 보낸다
      if vHnd > 0 then
         SendMessage(vHnd, WM_COPYDATA, 0, Integer(@Data))
      else
      //포스프로그램이 실행되지 않았을때
      begin
        if GetIniFile('영수증프린터', '포트', '') = 'LPT' then
        begin
          LPTPortInit;
          vAnsiData := AnsiString(vPrintData);
          WriteFile(LPTFile,PAnsiChar(vAnsiData)^,Length(vAnsiData),BytesWritten,nil);
          if (BytesWritten < Length(vAnsiData)) then
          begin
            CloseHandle(LPTFile);
            raise Exception.Create('Error Write LPT');
          end
          else CloseHandle(LPTFile);
        end
        else LocalPrint(vAnsiData);
      end;
    end
    else
    begin
      if GetIniFile('영수증프린터', '포트', '') = 'LPT' then
      begin
        LPTPortInit;
        vAnsiData := AnsiString(vPrintData);
        WriteFile(LPTFile,PAnsiChar(vAnsiData)^,Length(vAnsiData),BytesWritten,nil);
        if (BytesWritten < Length(vAnsiData)) then
        begin
          CloseHandle(LPTFile);
          raise Exception.Create('Error Write LPT');
        end
        else CloseHandle(LPTFile);
      end
      else LocalPrint(vPrintData);
    end;
  except
  end;
end;

////////////////////////////////////////////////////////////////////////////////
// Name         : PrintPrinter
// Type         : PrinterCommendReplace
// Explanation  : 출력내용을  출력커맨드에 맞게 바꾼다
// Parameter    : AValue: 출력할 내용
////////////////////////////////////////////////////////////////////////////////
function  PrinterCommendReplace(AValue:AnsiString):AnsiString;
var vIndex,
    vPrintDevice,
    vBottomMargin :Integer;
begin
  vPrintDevice := GetIniFile('영수증프린터', '기종', 0);
  vBottomMargin := GetIniFile('영수증프린터', '하단여백', 0);
    // 인쇄할 내용을 만든다(POS Man)
  if vPrintDevice = prtESPON  then
  begin
    Result := #27'@'+   // 프린터 초기화
              AValue+
              #13#10+#13#10+#13#10+
              #27#74#0+ // 인쇄(Feed)
              #27'i';  // 컷팅
  end
  else if vPrintDevice = prtTM then
  begin
    Result := #27'@'+   // 프린터 초기화
              AValue+
              #13#10#13#10+
              #27#74#0+ // 인쇄(Feed)
              #27'i';  // 컷팅
  end;

  Result := Replace(Result, rptCharNormal,    #27#71#0#29#66#0#27#45#0);
  if vPrintDevice = prtKICC then
    Result := Replace(Result, rptCharBold,      '');

  //KIS에서 나온 단말기가 진하게 출력시 크게 출력되서 옵션처리함
  if GetIniFile('POS', iniCharBold, 'Y') = 'N' then
    Result := Replace(Result, rptCharBold,      '');

  Result := Replace(Result, rptCharBold,      #27#71#1);

  Result := Replace(Result, rptCharInverse,   #29#66#1);
  Result := Replace(Result, rptCharUnderline, #27#45#1);
  Result := Replace(Result, rptAlignLeft,     #27#97#0);
  Result := Replace(Result, rptAlignCenter,   #27#97#1);
  Result := Replace(Result, rptAlignRight,    #27#97#2);

  Result := Replace(Result, rptSizeNormal, #29#33#0);
  Result := Replace(Result, rptSizeWidth,  #29#33#16);
  Result := Replace(Result, rptSizeHeight, #29#33#1);
  Result := Replace(Result, rptSizeBoth,   #29#33#17);
  Result := Replace(Result, rptSize3Times, #29#33#34);
  Result := Replace(Result, rptLF,               #13#10);
  case vPrintDevice of
    prtTM :
    begin
       Result := Replace(Result, rptOneLine,  '────────────────────────');
       Result := Replace(Result, rptOneLine2, '────────────');
       Result := Replace(Result, rptTwoLine,  '━━━━━━━━━━━━━━━━━━━━━━━━');
       Result := Replace(Result, rptTwoLine2, '━━━━━━━━━━━━');
       Result := Replace(Result, rptpStr,     '   ');
    end;
    else
    begin
       Result := Replace(Result, rptOneLine,  '------------------------------------------');
       Result := Replace(Result, rptOneLine2, '---------------------');
       Result := Replace(Result, rptTwoLine,  '==========================================');
       Result := Replace(Result, rptTwoLine2, '=====================');
       Result := Replace(Result, rptpStr,     '');
    end;
  end;
  for vIndex := 1 to vBottomMargin do
    Result := Result + #13#10;
end;

function  CharToNum(aChar:Char):Integer;
begin
  if CharInSet(aChar, ['0'..'9']) then
    Result       := StoI(aChar)
  else if CharInSet(aChar, ['A'..'Z']) then
    Result       := Ord(aChar) - Ord('A') + 10;
end;

function NumToChar(aValue: Integer): Char;
begin
  if Trunc(aValue) in [0..9] then
    Result := IntToStr(aValue)[1]
  else
    Result := Chr(Trunc(aValue)-10+Ord('A'));
end;

function isChar(aStr:String; aChar:Char):Boolean;
var vPos :Integer;
begin
   vPos := 0;
   while Pos(aChar,aStr) > 0 do
   begin
      Delete(aStr,1,Pos(aChar,aStr));
      Inc(vPos);
   end;
   Result := vPos > 0;
end;

function Space(aLen:Integer):String;
var I :Integer;
begin
  Result := '';
  For I := 1 to aLen do
    Result := Result + ' ';
end;

function FindForm(aFormName: string): THandle;
var
  vIndex: Integer;
begin
  Result := 0;
  for vIndex := 0 to Screen.CustomFormCount - 1 do begin
    if UpperCase('T' + Screen.CustomForms[vIndex].Name) = UpperCase(aFormName) then
    begin
      Result := Screen.CustomForms[vIndex].Handle;
      Break;
    end;
  end;
end;

function  CheckSurvey(aDate:String):Boolean;
begin
  if aDate <> EmptyStr then
  begin
    // 기준일 이후에 실사내역이 있는지 체크한다
    DM.OpenQuery('select   YMD_SILSA '
                +'  from   SL_SILSA '
                +' where   CD_HEAD   =:P0 '
                +'   and   CD_STORE  =:P1'
                +'   and   YM_SILSA  =Left(:P2,6) '
                +'   and   YMD_SILSA >=:P3',
              [HeadStoreCode,
               StoreCode,
               aDate]);
    try
      if not DM.Query.Eof and (DM.Query.Fields[0].AsString <> EmptyStr) then
        Result := false
      else
        Result := true;
    finally
      DM.FinishQuery;
    end;
    Result := true;
  end
  else Result := true;
end;

function CheckPhoneNo(aTelNo:String):Boolean;
var vTemp,
    vTemp1 :String;
begin
  aTelNo := GetOnlyNumber(aTelNo);
  if aTelNo = EmptyStr then
  begin
    Result := True;
    Exit;
  end;
  Result := false;
  case Length(aTelNo) of
    8 : Result := aTelNo[1] = '1';
    9 : Result := LeftStr(aTelNo,2) = '02';
    10,11 :
    begin
      vTemp := '010,011,016,017,018,019,050,070,080,031,032,033,041,042,043,044,051,052,053,054,055,061,062,063,064';
      vTemp1 := LeftStr(aTelNo,3);
      if (Pos(vTemp1, vTemp) > 0) and (vTemp1 <> '021') then
        Result := true;
      if (LeftStr(aTelNo,2) = '02') and (Length(aTelNo)=10) and (aTelNo[3] <> '1') then
        Result := true;
    end;
  end;
end;


procedure ExecuteProgram(aFileName:String;aPath:String;aParameter:String; aWait:Boolean);
  function AddFolderBackSlash(aFolderName: string): string;
  begin
    if (aFolderName <> EmptyStr) and (aFolderName[Length(aFolderName)] <> '\') then
      aFolderName := aFolderName + '\';
    Result := aFolderName;
  end;
var
  vShellExecuteInfo: TShellExecuteInfo;
  vProcessHandle   : DWORD;
begin
  if aPath = '' then
    aFileName := AddFolderBackSlash(ExtractFileDir(Application.ExeName))+aFileName
  else
    aFileName := aPath+aFileName;
  FillChar(vShellExecuteInfo, Sizeof(vShellExecuteInfo), 0);
  with vShellExecuteInfo do
  begin
    cbSize       := Sizeof(vShellExecuteInfo);
    fMask        := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    wnd          := GetActiveWindow;
    lpVerb       := 'open';
    lpFile       := PChar(aFileName);
    lpParameters := PChar(aParameter);
    if aWait then
      nShow        := SW_SHOW
    else
      nShow        := SW_HIDE;
  end;

  if not FileExists(aFileName) then Exit;

  // 프로그램을 실행한다
  if ShellExecuteEx(@vShellExecuteInfo) then
    vProcessHandle := vShellExecuteInfo.hProcess
  else
    Exit;

  if aWait then
    while WaitForSingleObject(vShellExecuteInfo.hProcess, 50) <> WAIT_OBJECT_0 do
      Application.ProcessMessages;
  CloseHandle(vProcessHandle);
end;

procedure LogSave(aJob, aForm, aActionName, aActionText, aLog:String);
begin
  if not Assigned(LogList) then
    LogList := TStringList.Create;

  LogList.Add(aJob+splitColumn
             +aForm+splitColumn
             +aActionName+splitColumn
             +aActionText+splitColumn
             +aLog+splitColumn
             +GetFileVersion+splitColumn
             +FormatDateTime('yyyy-mm-dd hh:nn:ss',Now())+splitColumn);
end;

procedure ProgramUseLogSave(aForm, aCaption:String);
var vSQL :String;
    vIndex :Integer;
begin
  if not IsDebugMode then
  begin
    if not Assigned(ProgramUseLogList) then
      ProgramUseLogList := TStringList.Create;

    ProgramUseLogList.Add(Format('(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', Cast(''%s'' as DateTime)),',
                        [HeadStoreCode,
                         StoreCode,
                         FormatDateTime('yyyymmdd',Now()),
                         aForm,
                         aCaption,
                         UserCode,
                         GetIPAddress,
                         GetMacAddress,
                         GetFileVersion,
                         FormatDateTime('yyyy-mm-dd hh:nn:ss',Now())]));
  end;
end;

function GetDosOutput(aCommandLine, aWorkPath: string): string;
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
  SystemPath : String;
begin
  SetLength(SystemPath, 256);
  GetSystemDirectory(PChar(SystemPath), 256);
  if aWorkPath = '' then
    WorkDir := SystemPath
  else
    WorkDir := aWorkPath;

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

function isDate(aStr: String): Boolean;
var vStr :String;
begin
  Result := False;
  vStr   := LeftStr(aStr, 10);
  if (Copy(vStr, 6, 2) = '00') and (Copy(vStr, 9, 2) = '00') then Exit;

  if Length(GetOnlyNumber(vStr)) < 8 then Exit;
  vStr := GetOnlyNumber(vStr);

  try
    Insert(DateSeparator, vStr, 5);
    Insert(DateSeparator, vStr, 8);
    StrToDate(vStr);
    if POS(' ',vStr) > 0 then Exit;
    if LeftStr(vStr,4) = '1900' then Exit;
    Result := True;
  except
    Exit;
  end;
end;

function isTime(aStr: String): Boolean;
begin
  Result := False;
  if (GetOnlyNumber(LeftStr(aStr, 2)) <> LeftStr(aStr, 2)) or (LeftStr(aStr, 2) < '00') or (LeftStr(aStr, 2) > '23') then Exit;
  if (GetOnlyNumber(RightStr(aStr, 2)) <> RightStr(aStr, 2)) or (RightStr(aStr, 2) < '00') or (RightStr(aStr, 2) > '59') then Exit;

  if Length(aStr) <> 5 then Exit;

  Result := true;
end;

function  ConvertSQL(aSQL: string; aParam: array of Variant): String;
var  vIndex : Integer;
     vTemp,
     vSQL   : String;
begin
  vSQL := aSQL;
  for vIndex := High(aParam) downto 0 do
  begin
    case VarType(aParam[vIndex]) of
      varInteger : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',aParam[vIndex]));
      varDouble,
      varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0.00',aParam[vIndex]));
      varDate     : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime )',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
      else
      begin
        vTemp := Replace(NVL(aParam[vIndex],''),'''','＇');
        vTemp := Replace(vTemp, ';','');
        vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[vTemp]));
      end;
    end;
  end;
  Result := vSQL;
end;

function  CheckMonthClose(aClose,aDate:String):Boolean; //S:재고마감, M:미수마감
begin
  DM.OpenQuery('select   Count(*) '
              +'  from   SL_CLOSE_MONTH  '
              +' where   CD_HEAD   =:P0 '
              +'   and   CD_STORE  =:P1 '
              +'   and   YM_CLOSE  =:P2 '
              +'   and   DS_CLOSE  =:P3 ',
            [HeadStoreCode,
             StoreCode,
             LeftStr(aDate,6),
             aClose]);
  try
    Result := DM.Query.Fields[0].AsInteger > 0;
  finally
    DM.FinishQuery;
  end;
end;

function SetProgramAuth(aAuth: Integer): String;
begin
  if aAuth = -1 then
    Result := '1111'
  else
  begin
    Result := '0000';
    case aAuth of
      1 : Result := '0001';
      2 : Result := '0010';
      3 : Result := '0011';
      4 : Result := '0100';
      5 : Result := '0101';
      6 : Result := '0110';
      7 : Result := '0111';
      8 : Result := '1000';
      9 : Result := '1001';
      10: Result := '1010';
      11: Result := '1011';
      12: Result := '1100';
      13: Result := '1101';
      14: Result := '1110';
      15: Result := '1111';
    end;
  end;
end;

procedure ShowChart(aWebBrowser:TWebBrowser; aChartName, aChartType, aChartData :String);
var vHTML :TStringList;
    vStream: TMemoryStream;
begin
  try
    aWebBrowser.Hint := aChartData;
    vHTML := TStringList.Create;
    vHTML.Add('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ');
    vHTML.Add('<html xmlns="http://www.w3.org/1999/xhtml"> ');
    vHTML.Add('<head> ');
    vHTML.Add('<meta name="viewport" content="width=device-width, initial-scale=1.0" /> ');
    vHTML.Add('<title>Chart 그래프  </title> ');
    vHTML.Add('<script type="text/javascript" src="https://food.expos.co.kr:8443/Extreme/IntranetFood/Chart6/js/fusioncharts.js"></script> ');
    vHTML.Add('<script type="text/javascript"> ');
    vHTML.Add(' Column3DChart   = "column3d";       //막대3차원');
    vHTML.Add(' Pie2DChart      = "pie2d";          //파이2차원');
    vHTML.Add(' Pie3DChart      = "pie3d";          //파이3차원');
    vHTML.Add(' LineChart       = "line";           //선형 ');
    vHTML.Add(' MSColumn3DChart = "mscolumn3d";     //묶음막대3차원');
    vHTML.Add(' MSColumn2DLine  = "mscombi2d";      //막대+선형 2차원');
    vHTML.Add(' MSColumn3DLine  = "mscolumnline3d"; //막대+선형 2차원');
    vHTML.Add(' Bar2DChart      = "bar2d";          //바2차원');
    vHTML.Add(' MSBar2D         = "msbar2d";        //묶음바2차원');
    vHTML.Add(' MSBar3D         = "msbar3d";        //묶음바3차원');
    vHTML.Add(' MSCombiDY2D     = "mscombidy2d";    //선형,막대,영역 혼합 차트');
    vHTML.Add(Format('_chartType="%s", ',[aChartType]));
    vHTML.Add(Format('_height="%d";',[aWebBrowser.Height-Ifthen(aWebBrowser.Height > 300, 90,0)]));
    vHTML.Add(Format('_width="%d",',[aWebBrowser.Width-30]));
    vHTML.Add(Format('_dataSource="%s";',[Replace(aChartData,'"','''')]));
    vHTML.Add(' function GetChart(chartType, chartId, width, height, chartTarget, dataSource, dataFormat ) ');
    vHTML.Add('{ ');
    vHTML.Add('chartType = chartType ? chartType : document.form1.chartType.value; ');
    vHTML.Add('chartId = chartId ? chartId : document.form1.chartId.value; ');
    vHTML.Add('width = width ? width : document.form1.width.value; ');
    vHTML.Add('height = height ? height : document.form1.height.value; ');
    vHTML.Add('chartTarget = chartTarget ? chartTarget : document.form1.chartTarget.value; ');
    vHTML.Add('dataSource = dataSource ? dataSource : document.form1.dataSource.value; ');
    vHTML.Add('dataFormat = dataFormat ? dataFormat : document.form1.dataFormat.value; ');
    vHTML.Add(' FusionCharts && FusionCharts.ready(function () { ');
    vHTML.Add('    if (FusionCharts(chartId) ) { ');
    vHTML.Add('      //FusionCharts(chartId).dispose(); ');
    vHTML.Add('      FusionCharts(chartId).setXMLData(chartXMLNoFlash(dataSource)); ');
    vHTML.Add('    } else ');
    vHTML.Add('       try { ');
    vHTML.Add('         var mychart = new FusionCharts({ ');
    vHTML.Add('          "id" : chartId,');
    vHTML.Add('          "type" : chartType, ');
    vHTML.Add('          "renderAt" : "chartdiv", ');
    vHTML.Add('          "width" : width, ');
    vHTML.Add('          "height" : height, ');
    vHTML.Add('          "dataFormat" : "xml", ');
    vHTML.Add('          "dataSource" : dataSource ');
    vHTML.Add('          }).render(); ');
    vHTML.Add('        } catch(e) { ');
    vHTML.Add('          FusionCharts(chartId).setXMLData(dataSource); ');
    vHTML.Add('        } ');
    vHTML.Add('  }); ');
    vHTML.Add('} ');
    vHTML.Add('function LoadPage() ');
    vHTML.Add('{ ');
    vHTML.Add('//GetChart();');
    vHTML.Add('} ');
    vHTML.Add('</script> ');
    vHTML.Add('</head> ');
    vHTML.Add('<body onload="LoadPage();"> ');
    vHTML.Add('<form name="form1" method="post" action="" id="form1"> ');
    vHTML.Add('<div id="chartdiv" style="text-align:center;margin-bottom:8px;"> ');
    vHTML.Add('<div id=''chartId_1_div'' > ');
    vHTML.Add('Chart... ');
    vHTML.Add('</div> ');
    vHTML.Add('<script type="text/javascript"> ');
    vHTML.Add('FusionCharts && FusionCharts.ready(function () { ');
    vHTML.Add('if (FusionCharts("chartId_1") ) FusionCharts("chartId_1").dispose(); ');
    vHTML.Add('var colorArray = ["FF0000", "008ED6", "F6BD0F", "588526", "008E8E", "8BBA00", "A186BE", "AFD8F8", "FF8E46", "D64646", "8E468E", "B3AA00"];');
    vHTML.Add('var chart_chartId_1 = new FusionCharts({ ');
    vHTML.Add('"id" : "chartId_1", ');
    vHTML.Add('"type" : _chartType, ');
    vHTML.Add('"renderAt" : "chartId_1_div", ');
    vHTML.Add('"width" : _width, ');
    vHTML.Add('"height" : _height, ');
    vHTML.Add('"dataFormat" : "xml", ');
    vHTML.Add('"dataSource" : _dataSource ');
    vHTML.Add('}).render(); ');
    vHTML.Add('}); ');
    vHTML.Add('</script> ');
    vHTML.Add('</div> ');
    vHTML.Add('    </form> ');
    vHTML.Add('</body> ');
    vHTML.Add('</html> ');
    vHTML.Text := UTF8String(vHTML.Text);

//    vHTML.SaveToFile(ExtractFilePath(Application.ExeName)+aChartName+'.html');
//    aWebBrowser.Navigate('file://'+ExtractFilePath(Application.ExeName)+aChartName+'.html');
    aWebBrowser.Navigate('about:blank');
    while aWebBrowser.ReadyState <> READYSTATE_COMPLETE do
    begin
      Sleep(5);
      Application.ProcessMessages;
    end;
    vStream := TMemoryStream.Create;
    vHTML.SaveToStream(vStream);
    vStream.Seek(0,0);
    (aWebBrowser.Document as IPersistStreamInit).Load(
      TStreamAdapter.Create(vStream));
  finally
    vStream.Free;
    vHTML.Free;
  end;
end;

function isWindows64 : Boolean;
var
  vKernelModule      : HModule;
  vSystemInfo        : TSystemInfo;
  GetNativeSystemInfo: procedure(var lpSystemInfo: TSystemInfo); stdcall;
begin
  vKernelModule := GetModuleHandle(kernel32);
  try
    GetNativeSystemInfo := GetProcAddress(vKernelModule, 'GetNativeSystemInfo');
    if Assigned(GetNativeSystemInfo) then
    begin
      GetNativeSystemInfo(vSystemInfo);
      Result := (vSystemInfo.wProcessorArchitecture = 9) or // PROCESSOR_ARCHITECTURE_AMT64
                (vSystemInfo.wProcessorArchitecture = 6);   // PROCESSOR_ARCHITECTURE_IA64
    end;
  finally
    FreeLibrary(vKernelModule);
  end;
end;

function  CharCnt(aStr:String;aChar:Char):Integer;
var vPos :Integer;
begin
   vPos := 0;
   while Pos(aChar,aStr) > 0 do
   begin
      Delete(aStr,1,Pos(aChar,aStr));
      Inc(vPos);
   end;
   Result := vPos;
end;

procedure SetComPort(aComboBox:TcxComboBox; aDefault:String);
var vReg : TRegistry;
    vTempList:TStringList;
    vIndex :Integer;
begin
  vReg := TRegistry.Create;
  vTempList := TStringList.Create;
  try
    vReg.RootKey := HKEY_LOCAL_MACHINE;
    vReg.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM',false);
    vReg.GetValueNames(vTempList);

    aComboBox.Properties.Items.Clear;
    if aDefault <> '' then
      aComboBox.Properties.Items.Add(aDefault);

    for vIndex := 0 to vTempList.Count-1 do
    begin
      if LeftStr(vReg.ReadString(vTempList.Strings[vIndex]),3) <> 'COM' then Continue;

      aComboBox.Properties.Items.Add(vReg.ReadString(vTempList.Strings[vIndex]));
    end;
  finally
    vReg.CloseKey;
    vReg.Free;
    vTempList.Free;
  end;
end;

function LineFeed(aValue: String): String;
var vData : TStringList;
    vIndex :Integer;
begin
  try
    Result := EmptyStr;
    vData := TStringList.Create;
    Split(aValue, '|', vData);
    for vIndex := 0 to vData.Count-1 do
       Result := Result + vData[vIndex] + Ifthen(vIndex < vData.Count-1, #13#10,'');

    if Result = EmptyStr then
      Result := aValue;
  finally
    vData.Free;
  end;
end;

function  FormatEx(aSQL:String; aParam: array of Variant) :String;
var
  vIndex : Integer;
begin
  Result := aSQL;
  for vIndex := High(aParam) downto 0 do
  begin
    case VarType(aParam[vIndex]) of
      varInteger :  Result := Replace(Result, Format(':P%d',[vIndex]), FormatFloat('#0',aParam[vIndex]));
      varDouble,
      varCurrency : Result := Replace(Result, Format(':P%d',[vIndex]), FormatFloat('#0.00',aParam[vIndex]));
      varDate     :
      begin
        Result := Replace(Result, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime)',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
      end;
      else
        Result := Replace(Result, Format(':P%d',[vIndex]), Format('''%s''',[aParam[vIndex]]));
    end;
  end;
end;


procedure SetWorkStoreList;
begin
  try
    DM.OpenQuery('select   CD_STORE, '
                +'         NM_STORE, '
                +'         HEAD_OPTIONS, '
                +'         CD_HEAD '
                +'  from   MS_STORE  '
                +' where   CD_HEAD   =:P0 '
                +' order by CD_STORE ',
                [HeadStoreCode]);
    WorkStoreList.Clear;
    while not DM.Query.Eof do
    begin
      WorkStoreList.Add(DM.Query.Fields[0].AsString
                       +splitColumn+DM.Query.Fields[1].AsString
                       +splitColumn+Ifthen(DM.Query.Fields[0].AsString = StandardStore, Rpad('1',30,'1'), DM.Query.Fields[2].AsString)
                       +splitColumn+DM.Query.Fields[3].AsString);
      DM.Query.Next;
    end;
  finally
    DM.FinishQuery;
  end;
end;

function  ImageUpLoad(aPath,aFileName:String):Boolean;
var
    vHttp: TIdHTTP;
    vParams: TIdMultiPartFormDataStream;
    vResponse, vURL: string;
begin
  Result := false;

  try
    vHttp := TIdHTTP.Create;
    vParams :=  TIdMultiPartFormDataStream.Create;
    vURL    := GetHttpURL+'Action_FileUp';

    try
      Screen.Cursor := crArrow;
      vHttp.Request.CustomHeaders.AddValue('COMP_ID',Replace(aPath,'\','/'));
      vHttp.Request.CustomHeaders.AddValue('JOB_GBN','U');
      vParams.AddFile('0', aFileName);
      vResponse := vHttp.Post(vURL, vParams);
      if vResponse <> 'OK' then
      begin
        Screen.Cursor := crDefault;
        ErrBox('화일전송실패!!!'#13+ vResponse);
        Exit;
      end
      else
        Result := true;
    except
      on E:Exception do
      begin
        Screen.Cursor := crDefault;
        ErrBox(E.Classname + ': '+ E.Message);
      end;
    end;
  finally
    vHttp.Disconnect;
    Screen.Cursor := crDefault;
    vParams.Free;
    vHttp.Free;
  end;
end;

function  ImageDownLoad(aPath,aFileName:String;aSavePath:String):Boolean;
var vIdHTTP     : TIdHTTP;
    vFileStream: TMemoryStream;
    vRequest : TStringStream;
    vResponse :String;
    vURL      :String;
begin
  Result := false;
  try
    vURL := GetHttpURL + 'Action_FileDown';
    vFileStream := TMemoryStream.Create;
    vIdHTTP     := TIdHTTP.Create(Application);
    vRequest    := TStringStream.Create;
    vIdHTTP.ConnectTimeout := 3000;
    vIdHTTP.ReadTimeout    := 5000;
    vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID', Replace(aPath,'\','/'));
    vIdHTTP.Request.CustomHeaders.AddValue('FILE_NAME', aFileName);
    vIdHTTP.Request.CustomHeaders.AddValue('JOB_GBN','D');
    vIdHTTP.Post(vURL, vRequest, vFileStream );
    vResponse := IntToStr(vIdHTTP.ResponseCode);
    if vResponse = '200' then
    begin
      if aSavePath = '' then
        vFileStream.SaveToFile(aFileName)
      else
      begin
        if not DirectoryExists(Format('%s%s',[Folder, aSavePath])) then
          ForceDirectories(Format('%s%s',[Folder, aSavePath]));
        vFileStream.SaveToFile(Format('%s%s\%s',[Folder, aSavePath,aFileName]));
      end;
      Result := true;
    end;
  finally
    vIdHTTP.Disconnect;
    vFileStream.Free;
    vIdHTTP.Free;
  end;
end;

function  ImageDelete(aPath,aFileName:String):Boolean;
var vIdHTTP     : TIdHTTP;
    vRequest : TStringStream;
    vResponse :String;
begin
  Result := false;
  try
    vIdHTTP     := TIdHTTP.Create(Application);
    vRequest    := TStringStream.Create;
    vIdHTTP.ConnectTimeout := 3000;
    vIdHTTP.ReadTimeout    := 5000;
    vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID', aPath);
    vIdHTTP.Request.CustomHeaders.AddValue('FILE_NAME', aFileName);
    vIdHTTP.Request.CustomHeaders.AddValue('JOB_GBN','R');
    vIdHTTP.Post(GetHttpURL+'Action_FileDown', vRequest );
    vResponse := IntToStr(vIdHTTP.ResponseCode);
    Result := true;
  finally
    vIdHTTP.Disconnect;
    vIdHTTP.Free;
  end;
end;

function  GetRestDBURL(aCompanyCode:String):String;
begin
  if ParamStr(1) = 'http' then
  begin
    try
      DM.OpenQuery('select a.IP_ADDR, '
                  +'       a.SERVICE_PORT, '
                  +'       a.REST_API '
                  +'  from SERVER_LIST   a inner join '
                  +'       COMPANY       b on b.ID_SERVER = a.ID_SERVER '
                  +' where b.CD_COMPANY = :P0 '
                  +'   and a.DS_SERVER  = ''O'' ',
                  [aCompanyCode],false,RestBaseURL);
      if not DM.Query.Eof then
      begin
        Result := Format('http://%s:%s/%s/|',[DM.Query.FieldByName('IP_ADDR').AsString,
                                              DM.Query.FieldByName('SERVICE_PORT').AsString,
                                              DM.Query.FieldByName('REST_API').AsString]);
      end
    finally
      DM.Query.Close;
    end;

  end
  else
  begin
    try
      DM.OpenQuery('select GetRestHttpsURL(:P0) ',
                  [aCompanyCode],false,RestBaseURL);
      if not DM.Query.Eof then
      begin
        Result := DM.Query.Fields[0].AsString;
      end
    finally
      DM.Query.Close;
    end;
  end;
end;

function  GetHttpURL:String;
begin
  DM.OpenQuery('select a.ID_SERVER, '
              +'       b.HTTPS_DOMAIN, '
              +'       case when c.SERVICE_TYPE = ''S'' then b.HTTPS_PORT else b.HTTPS_PORT_DIST end HTTPS_PORT '
              +'  from COMPANY a inner join '
              +'       SERVER_LIST   as b on b.ID_SERVER = a.ID_SERVER inner join '
              +'       DATABASE_LIST as c on c.ID_SERVER = b.ID_SERVER and c.DB_SEQ = a.DB_SEQ '
              +' where a.CD_COMPANY  =:P0 ',
              [HeadStoreCode],false,RestBaseURL);

  Result :=  'http://www.exposcloud.co.kr:18009/Orange/';
  if not DM.Query.Eof then
  begin
    if DM.Query.Fields[0].AsString = '9999' then
      Result := 'http://www.exposcloud.co.kr:38009/Orange/'
    else if DM.Query.Fields[0].AsString = '9998' then
      Result := 'http://www.exposcloud.co.kr:38009/Orange/';
  end;
  DM.Query.Close;
end;

function GetLetsOrderURL(aCompany:String):String;
begin
  DM.OpenQuery('select b.LETSORDER_URL_NEW '
              +'  from COMPANY     as a inner join '
              +'       SERVER_LIST as b on b.ID_SERVER = a.ID_SERVER '
              +' where a.CD_COMPANY  =:P0 ',
              [aCompany],false,RestBaseURL);

  if not DM.Query.Eof then
    Result := DM.Query.Fields[0].AsString
  else
    Result := 'https://api-op.letsorder.kr:7308/api/v1';
  DM.Query.Close;
end;

function  LetsOrderImageUpLoad(aUploadFile, aFileName, aType:String):String;
var vHttp: TIdHTTP;
    vFolder,
    vFileName,
    vResult    :String;
    vParams : TIdMultiPartFormDataStream;
    vFiles: TSearchRec;
    vImage :TImage;
    vResponseStream: TStringStream;
    vGUID : TGUID;
    vImageURL :String;
    vMasterObject,
    vDetailObject :TJSONObject;
    vJsonValue :TJSONValue;
    vIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    vJpg :TJPEGImage;
    vtmpBmp, vBmp :TBitmap;
    vHeight :Integer;
    vWidth  :Integer;
begin
  Result := '';

  //이미지 화일크기 축소
  try
    if aType = 'menu' then
      vWidth := 400
    else
      vWidth := 1280;

    vJpg := TJpegimage.Create;
    vtmpBmp := TBitmap.Create;
    vBmp    := TBitmap.Create;
    vImage := TImage.Create(Application);
    vImage.Picture.LoadFromFile(aUploadFile);
    vBmp.Assign(vImage.Picture.Graphic);
    if vBmp.Width > vWidth then
    begin
      vHeight := Ceil((vBmp.Height*vWidth) / vBmp.Width);
      vtmpBmp.Width  := vWidth;
      vtmpBmp.Height := vHeight;

      SetStretchBltMode(vtmpBmp.Canvas.Handle, HALFTONE);
      StretchBlt(vtmpBmp.Canvas.Handle, 0, 0, vtmpBmp.Width, vtmpBmp.Height, vBmp.Canvas.Handle, 0, 0, vBmp.Width, vBmp.Height, SRCCOPY );
      vJpg.Assign(vtmpBmp);
    end
    else
      vJpg.Assign(vBmp);

    vFolder := Format('%s\Image\LetsOrder\%s\%s\',[Folder,HeadStoreCode,StoreCode]);
    if not DirectoryExists(vFolder) then
      ForceDirectories(vFolder);
    if FileExists( vFolder+aFileName) then
      DeleteFile(vFolder+aFileName);

    vJpg.SaveToFile(vFolder+aFileName);
  finally
    vJpg.Free;
    vtmpBmp.Free;
    vBmp.Free;
  end;

  if LetsOrderURL = '' then
    LetsOrderURL := GetLetsOrderURL(HeadStoreCode);

  vImageURL := '';
  try
    Screen.Cursor := crHourGlass;
    CoCreateGuid(vGUID);
    vIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
    vIdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvSSLv23;

    vHttp := TIdHTTP.Create;
    vResponseStream := TStringStream.Create('', TEncoding.UTF8);
    vHttp.Request.CustomHeaders.Values['X-Message-Id'] := GUIDToString(vGUID);
    vParams := TIdMultiPartFormDataStream.Create;
    vParams.AddFormField('image_type',aType);
    vParams.AddFile('image_file', vFolder+aFileName, 'multipart/form-data');
    vHttp.Request.ContentType := vParams.RequestContentType;
    vHttp.IOHandler :=vIdSSLIOHandlerSocketOpenSSL;
    vHTTP.Post(Format('%s/pos/groups/%s/stores/%s/image',[LetsOrderURL,HeadStoreCode,LowerCase(StoreCode)]), vParams, vResponseStream);
  finally
    vResult := vResponseStream.DataString;
    vMasterObject := TJSONObject.ParseJSONValue( vResult ) as TJSONObject;
    vJsonValue := vMasterObject.GetValue('response');
    vJsonValue.TryGetValue(Format('%s_image_url',[aType]),vImageURL);
    Result := vImageURL;
    Screen.Cursor := crDefault;
    vParams.Free;
    vHttp.Free;
  end;
end;

function  LetsOrderImageDelete(aFileName, aType:String):Boolean;
var vRestClient         :TRestClient;
    vRestRequest        :TRestRequest;
    vRESTResponse       :TRESTResponse;
    vJSONObject         :TJSONObject;
    vJSONDetailObject   :TJSONObject;
    vFileName,
    vResult :String;
    vGUID : TGUID;
begin
  try
    Result := false;
    if LetsOrderURL = '' then
      LetsOrderURL := GetLetsOrderURL(HeadStoreCode);

    vJSONDetailObject := TJSONObject.Create;
    vJSONDetailObject.AddPair('image_type',    TJSONString.Create(aType));
    vJSONDetailObject.AddPair('image_file',    TJSONString.Create(aFileName));
    vJSONObject    := TJSONObject.Create;
    vJSONObject.AddPair('delete_image', vJSONDetailObject);

    Screen.Cursor := crHourGlass;
    vRestRequest := TRestRequest.Create(nil);
    vRestClient  := TRestClient.Create(nil);
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRestClient.BaseURL := Format('%s/pos/groups/%s/stores/%s/image',[LetsOrderURL,LowerCase(HeadStoreCode),LowerCase(StoreCode)]);
    CoCreateGuid(vGUID);
    vRestRequest.Params.AddHeader('X-Message-Id', GUIDToString(vGUID));
    vRESTResponse := TRESTResponse.Create(vRestRequest);
    vRestRequest.Client   := vRestClient;
    vRestRequest.Response := vRESTResponse;
    vRestRequest.Method   := TRESTRequestMethod.rmDELETE;
    vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    vRESTRequest.Execute;
    if vRestRequest.Response.StatusCode <> 200 then
    begin
      MsgBox('삭제실패!!!'+#13+IntToStr(vRestRequest.Response.StatusCode));
      Exit;
    end;
    Result := true;
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    Screen.Cursor := crDefault;
  end;
end;

function  LetsOrderImageInvalidate:Boolean;
var vRestClient         :TRestClient;
    vRestRequest        :TRestRequest;
    vRESTResponse       :TRESTResponse;
    vURL  : String;
    vGUID : TGUID;
    vTemp : String;
begin
  try
    if LetsOrderURL = '' then
      LetsOrderURL := GetLetsOrderURL(HeadStoreCode);

    Screen.Cursor := crHourGlass;
    vRestRequest := TRestRequest.Create(nil);
    vRestClient  := TRestClient.Create(nil);
    vRESTClient.Accept         := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset  := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRestClient.BaseURL := Format('%s/pos/groups/%s/stores/%s/images-invalidate',[LetsOrderURL,HeadStoreCode,LowerCase(StoreCode)]);
    CoCreateGuid(vGUID);
    vRestRequest.Params.AddHeader('X-Message-Id', GUIDToString(vGUID));
    vTemp := GUIDToString(vGUID);

    vRESTResponse         := TRESTResponse.Create(vRestRequest);
    vRestRequest.Client   := vRestClient;
    vRestRequest.Response := vRESTResponse;
    vRestRequest.Method   := TRESTRequestMethod.rmPOST;
    vRESTRequest.Execute;
    if vRestRequest.Response.StatusCode <> 200 then
    begin
      MsgBox('저장실패!!!'+#13+IntToStr(vRestRequest.Response.StatusCode));
      Exit
    end;
    MsgBox('이미지 저장완료');
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    Screen.Cursor := crDefault;
  end;
end;

function  LetsOrderAuth(aHeadStore:String):String;
var vRestClient   :TRestClient;
    vRestRequest  :TRestRequest;
    vRESTResponse :TRESTResponse;
    vMsgObject,
    vJSONObject   :TJSONObject;
    vGUID : TGUID;
    vURL,
    vData :String;
begin
  Result := '';
  vURL := GetLetsOrderURL(aHeadStore);

  try
    BlockInput(false);
    vRestClient                := TRestClient.Create(nil);
    vRestRequest               := TRestRequest.Create(nil);
    vRESTResponse              := TRESTResponse.Create(vRestRequest);
    vRestRequest.Client        := vRestClient;
    vRestRequest.Response      := vRESTResponse;
    vRestClient.BaseURL        := Format('%s/admin/login',[vURL]);
    vRestClient.ContentType    := 'application/x-www-form-urlencoded; charset=UTF-8;';
    vRestRequest.Accept        := 'application/json';
    vRestRequest.AcceptCharset := 'UTF-8';
    vRestRequest.Method        := TRESTRequestMethod.rmPOST;
    CoCreateGuid(vGUID);
    vRestRequest.Params.AddHeader('X-Message-Id', GUIDToString(vGUID));
    vJSONObject   := TJSONObject.Create;
    if Pos('api-op',vURL) > 0 then
    begin
      vJSONObject.AddPair('user_id',      TJSONString.Create('lets.order'));
      vJSONObject.AddPair('password',     TJSONString.Create('expos.retail!'));
    end
    else
    begin
      vJSONObject.AddPair('user_id',      TJSONString.Create('lets_order'));
      vJSONObject.AddPair('password',     TJSONString.Create('lge.retail'));
    end;
    vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);

    try
      vRESTRequest.Execute;
    except
      Exit;
    end;

    if vRestRequest.Response.StatusCode <> 200 then
    begin
      Exit;
    end;
    vData := vRESTResponse.Content;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('response').ToJson;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    Result := vJSONObject.GetValue('access_token').ToJson;
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

function LetsOrderSync(aSyncData:String):Boolean;
var vRestClient   :TRestClient;
    vRestRequest  :TRestRequest;
    vRESTResponse :TRESTResponse;
    vJSONArray
        :TJSONArray;
    vJSONObject   :TJSONObject;
    vGUID : TGUID;
    vURL, vData,
    vToken :String;
begin
  Result := false;
  if LetsOrderToken = '' then
    LetsOrderToken := LetsOrderAuth(HeadStoreCode);
  if LetsOrderToken = '' then Exit;
  vToken := 'Bearer '+Replace(LetsOrderToken,'"','');
  vURL := GetLetsOrderURL(HeadStoreCode);
  vURL := Format('%s/s2s/groups/%s/stores/%s/batch',[vURL,HeadStoreCode,LowerCase(StoreCode)]);


  try
    BlockInput(false);
    vRestClient                := TRestClient.Create(nil);
    vRestRequest               := TRestRequest.Create(nil);
    vRESTResponse              := TRESTResponse.Create(vRestRequest);
    vRestRequest.Response      := vRESTResponse;
    vRestClient.BaseURL        := vURL;
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRestRequest.Client        := vRestClient;
    vRestRequest.Method        := TRESTRequestMethod.rmDELETE;
    CoCreateGuid(vGUID);
    vRestRequest.Params.AddHeader('X-Message-Id',  GUIDToString(vGUID));
    vRestRequest.Params.AddHeader('Authorization', vToken);
    vRestRequest.URLAlreadyEncoded := true;

    if aSyncData = 'menu' then
    begin
      vJSONObject    := TJSONObject.Create;
      vJSONArray     := TJSONArray.Create;
      vJSONArray.AddElement(TJSONString.Create('menu_item'));
      vJSONArray.AddElement(TJSONString.Create('menu_course'));
      vJSONArray.AddElement(TJSONString.Create('menu_set'));
      vJSONArray.AddElement(TJSONString.Create('menu_category_item'));
      vJSONArray.AddElement(TJSONString.Create('menu_category'));

      vJSONObject.AddPair('menu',     vJSONArray);
      vJSONObject.AddPair('table',    TJSONArray.Create());
      vJSONObject.AddPair('language', TJSONArray.Create());
      vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    end
    else if aSyncData = 'table' then
    begin
      vJSONObject    := TJSONObject.Create;
      vJSONArray     := TJSONArray.Create;
      vJSONArray.AddElement(TJSONString.Create('table_info'));
      vJSONArray.AddElement(TJSONString.Create('table_message'));
      vJSONObject.AddPair('menu',     TJSONArray.Create());
      vJSONObject.AddPair('table',    vJSONArray);
      vJSONObject.AddPair('language', TJSONArray.Create());
      vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    end
    else if aSyncData = 'language' then
    begin
      vJSONObject    := TJSONObject.Create;
      vJSONArray     := TJSONArray.Create;
      vJSONArray.AddElement(TJSONString.Create('language_pack'));
      vJSONArray.AddElement(TJSONString.Create('table_message'));
      vJSONObject.AddPair('menu',      TJSONArray.Create());
      vJSONObject.AddPair('table',     TJSONArray.Create());
      vJSONObject.AddPair('language',  vJSONArray);
      vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    end
    else if aSyncData = 'category' then
    begin
      vJSONObject    := TJSONObject.Create;
      vJSONArray     := TJSONArray.Create;
      vJSONArray.AddElement(TJSONString.Create('menu_category_item'));
      vJSONArray.AddElement(TJSONString.Create('menu_category'));
      vJSONObject.AddPair('menu',      vJSONArray);
      vJSONObject.AddPair('table',     TJSONArray.Create());
      vJSONObject.AddPair('language',  TJSONArray.Create());
      vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    end;
    vData := vJSONObject.ToJSON;
    try
      vRESTRequest.Execute;
    except
      Exit;
    end;

    if vRestRequest.Response.StatusCode = 200 then
    begin
      Result := true;
      Exit;
    end;

    vData := vRESTResponse.Content;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('error').ToJson;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('message').ToJson;
    ErrBox(vData);
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

function SendTabletMessage(aMsgType:String; aTableNo: Integer; aMsg: String; aShow:Boolean):Boolean;
var vRestClient   :TRestClient;
    vRestRequest  :TRestRequest;
    vRESTResponse :TRESTResponse;
    vMsgObject,
    vJSONObject   :TJSONObject;
    vGUID : TGUID;
    vData :String;
begin
  try
    BlockInput(false);
    Result := false;
    vRestClient                := TRestClient.Create(nil);
    vRestRequest               := TRestRequest.Create(nil);
    vRESTResponse              := TRESTResponse.Create(vRestRequest);
    vRestRequest.Client        := vRestClient;
    vRestRequest.Response      := vRESTResponse;
    if LeftStr(StoreCode,2) = 'TT' then
      vRestClient.BaseURL        := Format('https://api-qa.letsorder.kr/api/v1/pos/groups/%s/stores/%s/table/%d/publish-message',
                                          [HeadStoreCode,
                                           StoreCode,
                                           aTableNo])
    else
      vRestClient.BaseURL        := Format('https://api-op.letsorder.kr/api/v1/pos/groups/%s/stores/%s/table/%d/publish-message',
                                          [HeadStoreCode,
                                           StoreCode,
                                           aTableNo]);
    vRestClient.ContentType    := 'application/x-www-form-urlencoded; charset=UTF-8;';
    vRestRequest.Accept        := 'application/json';
    vRestRequest.AcceptCharset := 'UTF-8';
    vRestRequest.Method        := TRESTRequestMethod.rmPOST;
    CoCreateGuid(vGUID);
    vRestRequest.Params.AddHeader('X-Message-Id', GUIDToString(vGUID));
    vMsgObject    := TJSONObject.Create;
    vMsgObject.AddPair('msg_type',    TJSONString.Create(aMsgType));
    vMsgObject.AddPair('msg_text',    TJSONString.Create(aMsg));
    vJSONObject    := TJSONObject.Create;
    vJSONObject.AddPair('publish_message',      vMsgObject);
    vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    vData := vJSONObject.ToJSON;
    try
      vRESTRequest.Execute;
    except
      Exit;
    end;

    if vRestRequest.Response.StatusCode <> 200 then
    begin
      Exit;
    end;
    Result := true;
    if aShow then
      MsgBox('전송이 완료 되었습니다');
//    vData := vRESTResponse.Content;
//    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
//    vData := vJSONObject.GetValue('response').ToJson;
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

function FileDownLoad(aFileName: String; aPath:String): Boolean;
var vIdHTTP     : TIdHTTP;
    vFileStream: TMemoryStream;
    vRequest : TStringStream;
    vResponse :String;
begin
  Result := false;
  try
    vFileStream := TMemoryStream.Create;
    vIdHTTP     := TIdHTTP.Create(Application);
    vIdHTTP.HandleRedirects := true;
    vRequest    := TStringStream.Create;
    vIdHTTP.ConnectTimeout := 1000;
    vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID', '/FTP/Update/CloudOrange/BackOffice');
    vIdHTTP.Request.CustomHeaders.AddValue('FILE_NAME', aFileName);
    vIdHTTP.Request.CustomHeaders.AddValue('JOB_GBN','T');
    vIdHTTP.ReadTimeout    := 10000;

    try

      vIdHTTP.Post('http://39.120.147.83:50280/Orange/Action_FileDown', vRequest, vFileStream );
    except
      Exit;
    end;
    vResponse := IntToStr(vIdHTTP.ResponseCode);
    if vResponse = '200' then
    begin
      if aFileName = 'Orange.exe' then
        vFileStream.SaveToFile(Folder+'temp_'+aFileName)
      else
        vFileStream.SaveToFile(Folder+aPath+aFileName);
      Result := true;
    end;
  finally
    vIdHTTP.Disconnect;
    vFileStream.Free;
    vIdHTTP.Free;
  end;
end;

function SetWorkingTable(aWork, aTable, aPK:String):Boolean;
begin
  if aWork = 'I' then
  begin
    Result := false;
    try
      DM.OpenQuery('select b.NM_SAWON, '
                  +'       a.DT_CHANGE, '
                  +'       a.CD_SAWON, '
                  +'       TIMESTAMPDIFF(minute, a.DT_CHANGE, Now()) as DIFF '
                  +'  from SL_WORKING_TABLE a  left outer join '
                  +'       MS_SAWON         b  on b.CD_HEAD  = a.CD_HEAD '
                  +'                          and b.CD_STORE = a.CD_STORE '
                  +'                          and b.CD_SAWON = a.CD_SAWON '
                  +' where a.CD_HEAD  =:P0 '
                  +'   and a.CD_STORE =:P1 '
                  +'   and a.DS_TABLE =:P2 '
                  +'   and a.PK       =:P3 ',
                  [HeadStoreCode,
                   StoreCode,
                   aTable,
                   aPK]);

      if not DM.Query.Eof then
      begin
        //수정작업중이었던 사용자와 같을때
        if DM.Query.Fields[2].AsString = UserCode then
        begin
          Result := true;
          Exit;
        end
        else
        begin
          //60분이 지났으면 그냥 할건지 물어본다
          if DM.Query.Fields[3].AsInteger > 60  then
          begin
            if AskBox(Format('%s[%s] 사용자가 %s부터 수정 중 입니다'#13'무시하고 작업하시겠습니까?',[DM.Query.Fields[2].AsString, DM.Query.Fields[0].AsString, FormatDateTime('mm월dd일hh:nn',DM.Query.Fields[1].AsDateTime)])) then
            begin
              DM.ExecQuery('delete '
                          +'  from SL_WORKING_TABLE '
                          +' where CD_HEAD  =:P0 '
                          +'   and CD_STORE =:P1 '
                          +'   and DS_TABLE =:P2 '
                          +'   and PK       =:P3;',
                          [HeadStoreCode,
                           StoreCode,
                           aTable,
                           aPK],false)
            end
            else Exit;
          end
          else
          begin
            MsgBox(Format('%s[%s] 사용자가 %s부터 수정 중 입니다'#13'작업이 완료 후에 다시 시도하세요',[DM.Query.Fields[2].AsString, DM.Query.Fields[0].AsString, FormatDateTime('mm월dd일hh:nn',DM.Query.Fields[1].AsDateTime)]));
            Exit;
          end;
        end;
      end;
    finally
      DM.Query.Close;
    end;

    DM.ExecQuery('insert into SL_WORKING_TABLE(CD_HEAD, '
                +'                             CD_STORE, '
                +'                             DS_TABLE, '
                +'                             PK, '
                +'                             CD_SAWON, '
                +'                             DT_CHANGE) '
                +'                      values(:P0, '
                +'                             :P1, '
                +'                             :P2, '
                +'                             :P3, '
                +'                             :P4, '
                +'                             Now());',
                [HeadStoreCode,
                 StoreCode,
                 aTable,
                 aPK,
                 UserCode],true);
    Result := true;
  end
  else
  begin
    if aTable <> '' then
      DM.ExecQuery('delete '
                  +'  from SL_WORKING_TABLE '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and DS_TABLE =:P2 '
                  +'   and PK       =:P3;',
                  [HeadStoreCode,
                   StoreCode,
                   aTable,
                   aPK],true)
    else
      DM.ExecQuery('delete '
                  +'  from SL_WORKING_TABLE '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and CD_SAWON =:P2; ',
                  [HeadStoreCode,
                   StoreCode,
                   UserCode],true);

    Result := true;
  end;
end;

function  GetWorkingTable(aTable, aPK:String):Boolean;
begin
  Result := false;
  try
    DM.OpenQuery('select b.NM_SAWON, '
                +'       a.DT_CHANGE, '
                +'       a.CD_SAWON '
                +'  from SL_WORKING_TABLE a  left outer join '
                +'       MS_SAWON         b  on b.CD_HEAD  = a.CD_HEAD '
                +'                          and b.CD_STORE = a.CD_STORE '
                +'                          and b.CD_SAWON = a.CD_SAWON '
                +' where a.CD_HEAD  =:P0 '
                +'   and a.CD_STORE =:P1 '
                +'   and a.DS_TABLE =:P2 '
                +'   and a.PK       =:P3 ',
                [HeadStoreCode,
                 StoreCode,
                 aTable,
                 aPK]);

    if not DM.Query.Eof then
    begin
      //수정작업중이었던 사용자와 같을때
      if DM.Query.Fields[2].AsString = UserCode then
      begin
        Result := true;
      end
      else
      begin
        MsgBox(Format('%s[%s] 사용자가 %s부터 수정 중 입니다'#13'작업이 완료 후에 다시 시도하세요',[DM.Query.Fields[2].AsString, DM.Query.Fields[0].AsString, FormatDateTime('mm월dd일hh:nn',DM.Query.Fields[1].AsDateTime)]));
        Exit;
      end;
    end
    else
    begin
      Result := true;
      Exit;
    end;
  finally
    DM.Query.Close;
  end;

  DM.ExecQuery('delete '
              +'  from SL_WORKING_TABLE '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and DS_TABLE =:P2 '
              +'   and PK       =:P3;',
              [HeadStoreCode,
               StoreCode,
               aTable,
               aPK],true);
end;

function GetFileSize(aFileName:String):Integer;
var
  sr : TSearchRec;
begin
  if not FileExists(aFileName) then
    Result := -1
  else
  begin
    if FindFirst(aFileName, faAnyFile, sr ) = 0 then
       result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
    else
       result := -1;

    FindClose(sr) ;
  end;
end;

function  GetPartitionTable(aTable:String; aFromDate, aToDate:TDateTime; aJoin:String):String;
var vCount,
    vIndex :Integer;
    vParttionTable :String;
    vFromDate, vToDate :TDateTime;
    vToStr :String;
begin
  if FormatDateTime('yyyy', aFromDate) <= '2016'  then
    vFromDate := StrToDate('2016-01-01')
  else
    vFromDate := StrToDate(FormatDateTime('yyyy-01-01', aFromDate));

  vToDate   := StrToDate(FormatDateTime('yyyy-12-31', aToDate));
  Result := '';

  if aTable = 'SL_SALE_H'  then
    vParttionTable := 'SALEH'
  else if aTable = 'SL_SALE_D'  then
    vParttionTable := 'SALED'
  else if aTable = 'SL_CARD'  then
    vParttionTable := 'CARD';


  vCount := YearsBetween(vToDate, vFromDate);
  for vIndex := 0 to vCount do
    Result := Result + Format('%s_%s,',[vParttionTable, Ifthen(FormatDateTime('yyyy', IncYear(vFromDate, vIndex)) <= '2050', FormatDateTime('yyyy', IncYear(vFromDate, vIndex)),'MAX')]);

  Result := Format('%s PARTITION (%s) %s ',[aTable, LeftStr(Result, Length(Result)-1), aJoin]);
end;

function  GetPartitionTable(aTable:String; aDate:TDateTime; aJoin:String=''):String;
var vParttionTable :String;
    vYear :String;
begin
  Result := '';
  if aTable = 'SL_SALE_H'  then
    vParttionTable := 'SALEH'
  else if aTable = 'SL_SALE_D'  then
    vParttionTable := 'SALED'
  else if aTable = 'SL_CARD'  then
    vParttionTable := 'CARD';

  if FormatDateTime('yyyy', aDate) <= '2016' then
    vYear := '2016'
  else if FormatDateTime('yyyy', aDate) > '2050' then
    vYear := 'MAX'
  else
    vYear := FormatDateTime('yyyy', aDate);

  Result := Format('%s PARTITION (%s_%s) %s ',[aTable, vParttionTable, vYear, aJoin]);
end;

function RunningProgram(aExeFileName: String): Boolean;
var
  Next     : BOOL;
  SHandle  : THandle;
  Process32: TProcessEntry32;
  ProcId   : DWORD;
begin
  Result := false;
  Process32.dwSize := SizeOf(TProcessEntry32);
  SHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if Process32First(SHandle, Process32) then
  begin
    repeat
      Next := Process32Next(SHandle, Process32);
      if Next then
      begin
        GetWindowThreadProcessID(SHandle, @ProcId);
        if Process32.szExeFile = aExeFileName then
        begin
          ProcId  := DWORD(Process32.th32ProcessID);
          SHandle := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
          Result  := true;
          Break;
        end;
      end;
    until not Next;
  end;
  CloseHandle(SHandle);
end;

function IsRustDeskInstalled: Boolean;
begin
  Result := GetRustDeskPath <> '';
end;

function IsProcessRunning(const ExeFileName: string): Boolean;
var
  SnapShot: THandle;
  ProcEntry: TProcessEntry32;
begin
  Result := False;
  SnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if SnapShot = INVALID_HANDLE_VALUE then
    Exit;

  try
    ProcEntry.dwSize := SizeOf(TProcessEntry32);
    if Process32First(SnapShot, ProcEntry) then
    begin
      repeat
        if SameText(ExtractFileName(ProcEntry.szExeFile), ExeFileName) then
        begin
          Result := True;
          Break;
        end;
      until not Process32Next(SnapShot, ProcEntry);
    end;
  finally
    CloseHandle(SnapShot);
  end;
end;

function IsRustDeskRunning: Boolean;
begin
  Result := IsProcessRunning('rustdesk.exe');
end;

function RunRustDesk: Boolean;
var
  RustDeskPath: string;
begin
  Result := False;
  RustDeskPath := GetRustDeskPath;
  if RustDeskPath = '' then
    Exit;

  Result := ShellExecute(0, 'open', PChar(RustDeskPath), nil, nil, SW_SHOWNORMAL) > 32;
end;

function EnsureRustDeskRunning: Boolean;
begin
  if not IsRustDeskInstalled then
    Exit(False);

  if not IsRustDeskRunning then
    Result := RunRustDesk
  else
    Result := True;
end;

function GetRustDeskPath: string;
begin
  if FileExists('C:\Program Files\RustDesk\rustdesk.exe') then
    Exit('C:\Program Files\RustDesk\rustdesk.exe');

  if FileExists('C:\Program Files (x86)\RustDesk\rustdesk.exe') then
    Exit('C:\Program Files (x86)\RustDesk\rustdesk.exe');

  Result := '';
end;

procedure SetComPortList(aComPortComboBox:TcxComboBox; aDefault:String);
var vReg : TRegistry;
    vTempList:TStringList;
    vIndex :Integer;
    vCode: PStrPointer;
begin
  vReg := TRegistry.Create;
  vTempList := TStringList.Create;
  try
    vReg.RootKey := HKEY_LOCAL_MACHINE;
    vReg.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM',false);
    vReg.GetValueNames(vTempList);

    aComPortComboBox.Properties.Items.Clear;
    if aDefault <> '' then
    begin
      New(vCode);
      vCode^.Data := '0';
      if aDefault = '사용안함' then
        aComPortComboBox.Properties.Items.AddObject(aDefault, TObject(vCode))
      else
        aComPortComboBox.Properties.Items.AddObject(aDefault, TObject(vCode));
    end;
    for vIndex := 0 to vTempList.Count-1 do
    begin
      if LeftStr(vReg.ReadString(vTempList.Strings[vIndex]),3) <> 'COM' then Continue;
      if Pos('com0com',vTempList.Strings[vIndex]) > 0 then Continue;
      New(vCode);
      vCode^.Data := GetOnlyNumber(vReg.ReadString(vTempList.Strings[vIndex]));
      aComPortComboBox.Properties.Items.AddObject(vReg.ReadString(vTempList.Strings[vIndex]), TObject(vCode));
    end;
  finally
    aComPortComboBox.ItemIndex := 0;
    vReg.CloseKey;
    vReg.Free;
    vTempList.Free;
  end;
end;

end.

