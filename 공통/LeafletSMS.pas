//==============================================================================
//
// 전단문자 페이지 호출
// 2015.01.09
//
//------------------------------------------------------------------------------
//
// 사용할 함수 (각 함수 파라미터는 아래 설명 참고)
//   ShowLeafletDesign()
//   ShowLeafletSelect()
//
// ##### 주의!!! #####
//   개발 단계이므로 실제 적용 시 아래 URL을 실제 URL로 수정해야 함
//
//==============================================================================

unit LeafletSMS;



interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls,
  SHDocVw, MSHTML;

type
  TLeafletSMSType =
  (
    lsDesign,
    lsSelect
  );

type
  TLeafletSMSForm = class(TForm)
    WebBrowser: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure WebBrowserDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    function  GetElementById(const aDoc: IDispatch; const aId: string): IDispatch;

  private
    LeafletSMSType: TLeafletSMSType;
    URL           : string;
    PostData,
    Headers       : OleVariant;

  public
    ResultURL     : string;
    Element       : IHTMLElement;
    function ShowDialog(aWidth, aHeight: Integer; aLeafletSMSType: TLeafletSMSType; aCustID, aAppType, aLeafletType, aVersion, aDomain: string): Boolean;
  end;

type
  // HTML Element 이벤트 처리 클래스
  THTMLElementEvent = class(TInterfacedObject, IDispatch)
  private
    FOnEvent: TProcedure;
  protected
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
  public
    constructor Create(const OnEvent: TProcedure);
    property OnEvent: TProcedure read FOnEvent write FOnEvent;
  end;

var
  LeafletSMSSelect: TLeafletSMSForm;

//==============================================================================
// 외부 제공 함수
//------------------------------------------------------------------------------
// 전단문자 양식 디자인 폼 보여주기
// aWidth, aHeight : 폼 크기(0이면 전체화면)
// aCustID         : 고객번호(AA0001)
// aAppType        : 앱 종류(ERP, ASP, ...)
// aLeafletType    : 전단문자 종류(AD, ...)
// aVersion        : 버전
//------------------------------------------------------------------------------
procedure ShowLeafletDesign(aWidth, aHeight: Integer; aCustID, aAppType, aLeafletType, aVersion, aDomain: string);
// 전단문자 선택 폼 보여주기
// aWidth, aHeight : 폼 크기(0이면 전체화면)
// aCustID         : 고객번호(AA0001)
// aAppType        : 앱 종류(ERP, ASP, ...)
// aLeafletType    : 전단문자 종류(AD, ...)
// aVersion        : 버전
function ShowLeafletSelect(aWidth, aHeight: Integer; aCustID, aAppType, aLeafletType, aVersion, aDomain: string; var aResult: string): Boolean;
//------------------------------------------------------------------------------
// 웹브라우저에서 버튼을 누를 때 (내부 함수이므로 신경쓸 필요 없음)
procedure OnPostInfoButtonClick;



implementation

{$R *.dfm}

const
  // ##### 나중에 반드시 실제 URL로 바꿔야 함
  urlDesign = 'http://www.xn--6j1b831b.kr/pop/UserCheck.jsp';                         // 양식 디자인 URL
  urlSelect = 'http://www.xn--6j1b831b.kr/pop/user_imageThumbnail.jsp';               // 양식 선택 URL

//==============================================================================
// 외부 제공 함수
//------------------------------------------------------------------------------
// 전단문자 양식 디자인 폼 보여주기
procedure ShowLeafletDesign(aWidth, aHeight: Integer; aCustID, aAppType, aLeafletType, aVersion, aDomain: string);
begin
  with TLeafletSMSForm.Create(Application) do
    try
      ShowDialog(aWidth, aHeight, lsDesign, aCustID, aAppType, aLeafletType, aVersion, aDomain);
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 전단문자 선택 폼 보여주기
// aResult : 결과가 true이면 전단문자URL, false면 에러메시지
function ShowLeafletSelect(aWidth, aHeight: Integer; aCustID, aAppType, aLeafletType, aVersion, aDomain: string; var aResult: string): Boolean;
begin
  LeafletSMSSelect := TLeafletSMSForm.Create(Application);
  with LeafletSMSSelect do
    try
      Result  := ShowDialog(aWidth, aHeight, lsSelect, aCustID, aAppType, aLeafletType, aVersion, aDomain);
      aResult := ResultURL;
    finally
      Free;
    end;
end;

//==============================================================================
// 내부 함수
//------------------------------------------------------------------------------
// 폼 표시
function TLeafletSMSForm.ShowDialog(aWidth, aHeight: Integer; aLeafletSMSType: TLeafletSMSType; aCustID, aAppType, aLeafletType, aVersion, aDomain: string): Boolean;
var
  vI: Integer;
  vS: string;
begin
  if (aWidth <= 0) or (aHeight <= 0) then
    WindowState := wsMaximized
  else
  begin
    Width  := aWidth;
    Height := aHeight;
  end;

  // URL
  LeafletSMSType := aLeafletSMSType;
  case LeafletSMSType of
    lsDesign:
      URL := urlDesign;
    lsSelect:
      URL := urlSelect;
  end;

  // Post 파라미터
  vS := Format('cust_id=%s&ds_app=%s&gubun=%s&ver=%s&d_name=%s', [aCustID, aAppType, aLeafletType, aVersion, aDomain]);
  PostData := VarArrayCreate([0, Length(vS)-1], varByte);
  for vI := 1 to Length(vS) do
    PostData[vI-1] := Ord(vS[vI]);

  // 헤더
  Headers  := 'Content-Type: application/x-www-form-urlencoded'#10#13;

  // 폼을 보여준다
  ShowModal;
  Result := ModalResult = mrOK;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TLeafletSMSForm.FormShow(Sender: TObject);
begin
  // 전단문자 페이지를 표시한다
  if URL <> EmptyStr then
    WebBrowser.Navigate(URL, EmptyParam, EmptyParam, PostData, Headers);
end;
//------------------------------------------------------------------------------
// 웹브라우저에서 페이지 표시를 다 했을 때
procedure TLeafletSMSForm.WebBrowserDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  // 전단문자 선택 화면에서만 처리한다
  if LeafletSMSType = lsSelect then
    try
      Element := GetElementById(WebBrowser.Document, 'postInfoHidden') as IHTMLElement;
      if Assigned(Element) then
        Element.onclick := THTMLElementEvent.Create(OnPostInfoButtonClick) as IDispatch;
    except
      on E: Exception do
      begin
        ResultURL   := '전단문자 페이지를 열 수 없습니다.'#13+E.Message;
        ModalResult := mrCancel;
      end;
    end;
end;
//------------------------------------------------------------------------------
// 전단문자 양식을 선택했을 때
procedure OnPostInfoButtonClick;
begin
  if Assigned(LeafletSMSSelect) and Assigned(LeafletSMSSelect.Element) then
    try
      LeafletSMSSelect.ResultURL     := VarToStr(LeafletSMSSelect.Element.getAttribute('Value', 0));
      LeafletSMSSelect.ModalResult   := mrOK;
    except
      on E: Exception do
      begin
        LeafletSMSSelect.ResultURL   := '전단문자 주소를 분석할 수 없습니다.'#13+E.Message;
        LeafletSMSSelect.ModalResult := mrCancel;
      end;
    end;
end;
//------------------------------------------------------------------------------
// HTML의 객체 찾기
function TLeafletSMSForm.GetElementById(const aDoc: IDispatch; const aId: string): IDispatch;
var
  vDoc : IHTMLDocument2;
  vBody: IHTMLElement2;
  vTags: IHTMLElementCollection;
  vTag : IHTMLElement;
  vI   : Integer;
begin
  Result := nil;
  if not Supports(aDoc, IHTMLDocument2, vDoc) or
     not Supports(vDoc.body, IHTMLElement2, vBody) then
    raise Exception.Create('문서 형식이 잘못되었습니다.');
  vTags := vBody.getElementsByTagName('*');
  for vI := 0 to Pred(vTags.length) do
  begin
    vTag := vTags.item(vI, EmptyParam) as IHTMLElement;
    if AnsiSameText(vTag.id, 'postInfoHidden') then
    begin
      Result := vTag;
      Break;
    end;
  end;
end;

//==============================================================================
// THTMLElementEvent
//------------------------------------------------------------------------------
constructor THTMLElementEvent.Create(const OnEvent: TProcedure);
begin
  inherited Create;
  FOnEvent := OnEvent;
end;
//------------------------------------------------------------------------------
function THTMLElementEvent.GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;
//------------------------------------------------------------------------------
function THTMLElementEvent.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
end;
//------------------------------------------------------------------------------
function THTMLElementEvent.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;
//------------------------------------------------------------------------------
function THTMLElementEvent.Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
  if DispID = 0{DISPID_VALUE} then
  begin
    if Assigned(FOnEvent) then
      FOnEvent;
    Result := S_OK;
  end
  else
    Result := E_NOTIMPL;
end;

end.
