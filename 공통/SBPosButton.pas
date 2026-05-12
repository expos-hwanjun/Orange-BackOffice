unit SBPosButton;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

const
  SBM_BEEP = WM_USER+200;

type
  //============================================================================
  // 버튼 색깔 클래스
  //----------------------------------------------------------------------------
  TSBPosButtonColor = class(TPersistent)
  private
    FChange        : Boolean;
    FFace,                     // 바탕색
    FFaceDown,
    FBorder,                   // 테두리색
    FBorderDown,
    FHighlight,                // 버튼 윗부분색
    FHighlightDown,
    FShadow,
    FShadowDown    : TColor;   // 버튼 아랫부분색
    FOnChange      : TNotifyEvent;

    procedure SetSBPosButtonColor(const Index: Integer; const Value: TColor);

  protected
    procedure Change; dynamic;

  public
    constructor Create; virtual;
    destructor  Destroy; override;

    property OnChange : TNotifyEvent   read FOnChange  write FOnChange;

  published
    property Face         : TColor index 0 read FFace          write SetSBPosButtonColor default $0000D8FF;
    property Border       : TColor index 1 read FBorder        write SetSBPosButtonColor default $00000F6F;
    property Highlight    : TColor index 2 read FHighlight     write SetSBPosButtonColor default $00FFFFFF;
    property Shadow       : TColor index 3 read FShadow        write SetSBPosButtonColor default $0000A8F0;
    property FaceDown     : TColor index 4 read FFaceDown      write SetSBPosButtonColor default $0000D8FF;
    property BorderDown   : TColor index 5 read FBorderDown    write SetSBPosButtonColor default $00000F6F;
    property HighlightDown: TColor index 6 read FHighlightDown write SetSBPosButtonColor default $0000A8F0;
    property ShadowDown   : TColor index 7 read FShadowDown    write SetSBPosButtonColor default $00FFFFFF;
  end;

  //============================================================================
  // 버튼 번호 클래스
  //----------------------------------------------------------------------------
  TSBPosButtonNumber = class(TPersistent)
  private
    FChange     : Boolean;
    FNumber     : Integer;
    FNumberString,
    FCenterString,
    FRightString,
    FTempString : String;
    FLeft,
    FTop        : Integer;
    FFont       : TFont;
    FColor,
    FColorShadow,
    FColorHeader: TColor;
    FShowNumber,
    FShadow,
    FHeader     : Boolean;
    FOnChange   : TNotifyEvent;

    procedure SetNumber(const Value: Integer);
    procedure SetNumberString(const Value: String);
    procedure SetCenterString(const Value: String);
    procedure SetRightString(const Value: String);
    procedure SetTempString(const Value: String);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetColor(const Value: TColor);
    procedure SetColorShadow(const Value: TColor);
    procedure SetColorHeader(const Value: TColor);
    procedure SetShowNumber(const Value:Boolean);
    procedure SetShadow(const Value: Boolean);
    procedure SetHeader(const Value: Boolean);
    procedure SetFont(const Value: TFont);

  protected
    procedure Change; dynamic;

  public
    constructor Create; virtual;
    destructor  Destroy; override;

    property OnChange : TNotifyEvent   read FOnChange  write FOnChange;

  published
    property Number       : Integer read FNumber       write SetNumber      default 0;
    property NumberString : String  read FNumberString write SetNumberString;
    property CenterString : String  read FCenterString write SetCenterString;
    property RightString  : String  read FRightString  write SetRightString;
    property TempString   : String  read FTempString   write SetTempString;
    property Left         : Integer read FLeft         write SetLeft        default 7;
    property Top          : Integer read FTop          write SetTop         default 5;
    property Font         : TFont   read FFont         write SetFont;
    property Color        : TColor  read FColor        write SetColor       default clGreen;
    property ColorShadow  : TColor  read FColorShadow  write SetColorShadow default clWhite;
    property ColorHeader  : TColor  read FColorHeader  write SetColorHeader default $00ADD5A8;
    property ShowNumber   : Boolean read FShowNumber   write SetShowNumber  default True;
    property Shadow       : Boolean read FShadow       write SetShadow      default True;
    property Header       : Boolean read FHeader       write SetHeader      default False;
  end;

  //============================================================================
  // 버튼 Bottom 클래스
  //----------------------------------------------------------------------------
  TSBPosButtonBottom = class(TPersistent)
  private
    FChange        : Boolean;
    FLeftString,
    FCenterString,
    FRightString : String;
    FIsColor    : Boolean;
    FLeft,
    FTop        : Integer;
    FColor      : TColor;
    FFont       : TFont;
    FOnChange   : TNotifyEvent;

    procedure SetLeftString(const Value: String);
    procedure SetCenterString(const Value: String);
    procedure SetRightString(const Value: String);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetIsColor(const Value: Boolean);
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);

  protected
    procedure Change; dynamic;

  public
    constructor Create; virtual;
    destructor  Destroy; override;

    property OnChange : TNotifyEvent   read FOnChange  write FOnChange;

  published
    property LeftString  : String  read FLeftString   write SetLeftString;
    property CenterString: String  read FCenterString write SetCenterString;
    property RightString : String  read FRightString  write SetRightString;
    property Left        : Integer read FLeft         write SetLeft        default 7;
    property Top         : Integer read FTop          write SetTop         default 5;
    property Color       : TColor   read FColor       write SetColor       default $0005BEED;
    property Font        : TFont   read FFont         write SetFont;
    property IsColor     : Boolean read FIsColor      write SetIsColor     default False;
  end;

  //============================================================================
  // 버튼 캡션 클래스
  //----------------------------------------------------------------------------
  TSBPosButtonCaption = class(TPersistent)
  private
    FChange     : Boolean;
    FCaption    : TStrings;
    FKey        : Integer;
    FCode       : TStrings;
    FFont       : TFont;
    FColor,
    FColorShadow: TColor;
    FShadow     : Boolean;
    FIndex      : Integer;
    FOnChange   : TNotifyEvent;

    procedure SetCaption(const Value: TStrings);
    procedure SetCode(const Value: TStrings);
    procedure SetFont(const Value: TFont);
    procedure SetColor(const Value: TColor);
    procedure SetColorShadow(const Value: TColor);
    procedure SetShadow(const Value: Boolean);
    procedure SetIndex(const Value: Integer);
    function GetCaption: Integer;

  protected
    procedure Change; dynamic;

  public
    constructor Create; virtual;
    destructor  Destroy; override;
    procedure   Add(ACaption, ACode: String);
    procedure   Delete(AIndex: Integer);
    procedure   Clear;

    property OnChange : TNotifyEvent   read FOnChange  write FOnChange;

  published
    property Caption     : TStrings read FCaption     write SetCaption;
    property Key         : Integer  read FKey         write FKey;
    property Code        : TStrings read FCode        write SetCode;
    property Font        : TFont    read FFont        write SetFont;
    property Color       : TColor   read FColor       write SetColor       default clBlack;
    property ColorShadow : TColor   read FColorShadow write SetColorShadow default clWhite;
    property Shadow      : Boolean  read FShadow      write SetShadow      default True;
    property Index       : Integer  read FIndex       write SetIndex       default 0;
    property Count       : Integer  read GetCaption;
  end;

  //============================================================================
  // Label 클래스
  //----------------------------------------------------------------------------
  TSBPosButtonMenuName = class(TPersistent)
  private
    FChange     : Boolean;
    FCaption    : String;
    FFont       : TFont;
    FColor,
    FColorShadow: TColor;
    FShadow     : Boolean;
    FOnChange   : TNotifyEvent;
    FAlignment  : TAlignment;

    procedure SetCaption(const Value: String);
    procedure SetFont(const Value: TFont);
    procedure SetColor(const Value: TColor);
    procedure SetColorShadow(const Value: TColor);
    procedure SetShadow(const Value: Boolean);

  protected
    procedure Change; dynamic;

  public
    constructor Create; virtual;
    destructor  Destroy; override;
    property OnChange : TNotifyEvent   read FOnChange  write FOnChange;

  published
    property Caption     : String     read FCaption     write SetCaption;
    property Alignment   : TAlignment read FAlignment   write FAlignment     default taCenter;
    property Font        : TFont      read FFont        write SetFont;
    property Color       : TColor     read FColor       write SetColor       default clBlack;
    property ColorShadow : TColor     read FColorShadow write SetColorShadow default clWhite;
    property Shadow      : Boolean    read FShadow      write SetShadow      default True;
  end;

  //============================================================================
  // 버튼 금액 클래스
  //----------------------------------------------------------------------------
  TSBPosButtonAmount = class(TPersistent)
  private
    FChange     : Boolean;
    FCaption    : String;
    FFont       : TFont;
    FColor,
    FColorShadow: TColor;
    FShadow     : Boolean;
    FOnChange   : TNotifyEvent;

    procedure SetCaption(const Value: String);
    procedure SetFont(const Value: TFont);
    procedure SetColor(const Value: TColor);
    procedure SetColorShadow(const Value: TColor);
    procedure SetShadow(const Value: Boolean);

  protected
    procedure Change; dynamic;

  public
    constructor Create; virtual;
    destructor  Destroy; override;
    property OnChange : TNotifyEvent   read FOnChange  write FOnChange;

  published
    property Caption     : String   read FCaption     write SetCaption;
    property Font        : TFont    read FFont        write SetFont;
    property Color       : TColor   read FColor       write SetColor       default clBlack;
    property ColorShadow : TColor   read FColorShadow write SetColorShadow default clWhite;
    property Shadow      : Boolean  read FShadow      write SetShadow      default True;
  end;

  //============================================================================
  // 버튼 그림 클래스
  //----------------------------------------------------------------------------
  TSBPosButtonImage = class(TPersistent)
  private
    FDLLName      : String;
    FEnableImage,
    FDisableImage : String;
    FHandle       : THandle;
    FOnChange     : TNotifyEvent;

    procedure SetDLLName(const Value: String);
    procedure SetEnableImage(const Value: String);

  protected
    procedure Change; dynamic;

  public
    constructor Create; virtual;
    destructor  Destroy; override;

    property OnChange : TNotifyEvent   read FOnChange  write FOnChange;

  published
    property DLLName     : String  read FDLLName      write SetDLLName;
    property EnableImage : String  read FEnableImage  write SetEnableImage;
    property DisableImage: String  read FDisableImage write FDisableImage;
    property Handle      : THandle read FHandle;
  end;

  //============================================================================
  // 버튼 클래스
  //----------------------------------------------------------------------------
  TSBPosButton = class(TGraphicControl)
  private
    FAssociate   : TWinControl;
    FColor       : TSBPosButtonColor;
    FNumber      : TSBPosButtonNumber;
    FBottom      : TSBPosButtonBottom;
    FCaption     : TSBPosButtonCaption;
    FMenuName    : TSBPosButtonMenuName;
    FAmount      : TSBPosButtonAmount;
    FImage       : TSBPosButtonImage;
    FDown        : Boolean;
    FAllowAllUp  : Boolean;
    FGroupIndex  : Integer;
{    isDowned     : Boolean;}
    isKeyPress   : Boolean;
    FFlags       :Longint;
    FBeep        : Integer;
    FDontKeyPress: Boolean;
    Bitmap       : TBitmap;
    FBeepHandle  : THandle;
    ImgHeight    : Integer;
    FLayoutTop   : Boolean;
    FTemp1       : String;
    FTemp2       : String;
    FTemp3       : String;
    FTemp4       : String;
    FTemp5       : String;
    FTemp6       : String;
    FTemp7       : String;
    FIsWork      : Boolean;
    FShowAccelChar: Boolean;
    procedure DrawButton;
    procedure DrawNumber;
    procedure DrawBottom;
    procedure DrawCaption;
    procedure DrawMenuName;
    procedure DrawAmount;
    procedure DrawImage;
    procedure Change(Sender: TObject);
    procedure SetColor(const Value: TSBPosButtonColor);
    procedure SetNumber(const Value: TSBPosButtonNumber);
    procedure SetBottom(const Value: TSBPosButtonBottom);
    procedure SetDown(Value: Boolean);
    procedure SetCaption(const Value: TSBPosButtonCaption);
    procedure SetMenuName(const Value: TSBPosButtonMenuName);
    procedure SetAmount(const Value: TSBPosButtonAmount);
    procedure SetImage(const Value: TSBPosButtonImage);
    procedure SetAllowAllUp(const Value: Boolean);
    procedure SetGroupIndex(const Value: Integer);
    procedure SetAssociate(const Value: TWinControl);
    procedure SetShowAccelChar(Value: Boolean);
    procedure UpdateExclusive;
    procedure CMButtonPressed(var Message: TMessage); message CM_BUTTONPRESSED;
    procedure WMLButtonDblClk(var Message: TWMLButtonDown); message WM_LBUTTONDBLCLK;

  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure KeyDown;
    procedure KeyUp;
    procedure KeyPress;
    procedure Click; override;

  published
    property Enabled;
    property Visible;
    property Associate   : TWinControl         read FAssociate    write SetAssociate;
    property Color       : TSBPosButtonColor   read FColor        write SetColor;
    property Number      : TSBPosButtonNumber  read FNumber       write SetNumber;
    property Bottom      : TSBPosButtonBottom  read FBottom       write SetBottom;
    property Caption     : TSBPosButtonCaption read FCaption      write SetCaption;
    property MenuName    : TSBPosButtonMenuName read FMenuName    write SetMenuName;
    property Amount      : TSBPosButtonAmount  read FAmount       write SetAmount;
    property Image       : TSBPosButtonImage   read FImage        write SetImage;
    property Down        : Boolean             read FDown         write SetDown;
    property AllowAllUp  : Boolean             read FAllowAllUp   write SetAllowAllUp default False;
    property GroupIndex  : Integer             read FGroupIndex   write SetGroupIndex default 0;
    property Beep        : Integer             read FBeep         write FBeep         default 4;
    property BeepHandle  : THandle             read FBeepHandle   write FBeepHandle   default 0;
    property DontKeyPress: Boolean             read FDontKeyPress write FDontKeyPress default False;
    property LayoutTop   : Boolean             read FLayoutTop    write FLayoutTop;
    property Temp1       : String              read FTemp1        write FTemp1;
    property Temp2       : String              read FTemp2        write FTemp2;
    property Temp3       : String              read FTemp3        write FTemp3;
    property Temp4       : String              read FTemp4        write FTemp4;
    property Temp5       : String              read FTemp5        write FTemp5;
    property Temp6       : String              read FTemp6        write FTemp6;
    property Temp7       : String              read FTemp7        write FTemp7;
    property IsWork      : Boolean             read FIsWork       write FIsWork;
    property ShowAccelChar: Boolean read FShowAccelChar write SetShowAccelChar default True;
    property PopupMenu;
    property ShowHint;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

function TransparentBlt(DestDC: HDC; X, Y, Width, Height: Integer; SrcDC: HDC; XSrc, YSrc, WidSrc, HeiSrc: Integer; BkColor: UINT): BOOL; stdcall;

procedure Register;



implementation

function TransparentBlt; external 'msimg32.dll' name 'TransparentBlt';

procedure Register;
begin
  RegisterComponents('ExtremePOS', [TSBPosButton]);
end;

{ TSBPosButtonColor }

//==============================================================================
// 버튼 색깔 정보
//------------------------------------------------------------------------------
// 버튼 색깔 정보 생성자
constructor TSBPosButtonColor.Create;
begin
  inherited Create;
  FChange       := False;
  FFace         := $0000D8FF;
  FBorder       := $00000F6F;
  FHighlight    := $00FFFFFF;
  FShadow       := $0000A8F0;
  FFaceDown     := $0000D8FF;
  FBorderDown   := $00000F6F;
  FHighlightDown:= $0000A8F0;
  FShadowDown   := $00FFFFFF;
end;
//------------------------------------------------------------------------------
// 버튼 색깔 정보 소멸자
destructor TSBPosButtonColor.Destroy;
begin
  inherited Destroy;
end;
//------------------------------------------------------------------------------
// 버튼 색깔 정보 변경 이벤트
procedure TSBPosButtonColor.Change;
begin
  if Assigned(FOnChange) and not FChange then
  begin
    FChange := True;
    FOnChange(Self);
  end;
end;
//------------------------------------------------------------------------------
// 버튼 색깔 정보 색깔 설정
procedure TSBPosButtonColor.SetSBPosButtonColor(const Index: Integer; const Value: TColor);
begin
  case Index of
    0 : if FFace <> Value then
        begin
          FFace := Value;
          Change;
        end;
    1 : if FBorder <> Value then
        begin
          FBorder := Value;
          Change;
        end;
    2 : if FHighlight <> Value then
        begin
          FHighlight := Value;
          Change;
        end;
    3 : if FShadow <> Value then
        begin
          FShadow := Value;
          Change;
        end;
    4 : if FFaceDown <> Value then
        begin
          FFaceDown := Value;
          Change;
        end;
    5 : if FBorderDown <> Value then
        begin
          FBorderDown := Value;
          Change;
        end;
    6 : if FHighlightDown <> Value then
        begin
          FHighlightDown := Value;
          Change;
        end;
    7 : if FShadowDown <> Value then
        begin
          FShadowDown := Value;
          Change;
        end;
  end;
end;


{ TSBPosButtonNumber }

//==============================================================================
// 버튼 번호 정보
//------------------------------------------------------------------------------
// 버튼 번호 정보 생성자
constructor TSBPosButtonNumber.Create;
begin
  inherited Create;
  FChange       := False;
  FNumber       := 0;
  FCenterString := '';
  FRightString  := '';
  FTempString   := '';
  FLeft         := 7;
  FTop          := 5;
  FFont         := TFont.Create;
  FFont.Name    := '굴림체';
  FFont.Size    := 8;
  FColor        := clGreen;
  FColorShadow  := clWhite;
  FColorHeader  := $00ADD5A8;
  FShadow       := True;
  FHeader       := False;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 소멸자
destructor TSBPosButtonNumber.Destroy;
begin
  FFont.Free;

  inherited Destroy;
end;

//------------------------------------------------------------------------------
// 버튼 번호 정보 변경 이벤트
procedure TSBPosButtonNumber.Change;
begin
  if Assigned(FOnChange) and not FChange then
  begin
    FChange := True;
    FOnChange(Self);
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 번호 설정
procedure TSBPosButtonNumber.SetNumber(const Value: Integer);
begin
  if FNumber <> Value then
  begin
    FNumber := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 Number 문자 캡션 설정
procedure TSBPosButtonNumber.SetNumberString(const Value: String);
begin
  if FNumberString <> Value then
  begin
    FNumberString := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 가운데 캡션 설정
procedure TSBPosButtonNumber.SetCenterString(const Value: String);
begin
  if FCenterString <> Value then
  begin
    FCenterString := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 마지막 캡션 설정
procedure TSBPosButtonNumber.SetRightString(const Value: String);
begin
  if FRightString <> Value then
  begin
    FRightString := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 임시 스트리변수 설정
procedure TSBPosButtonNumber.SetTempString(const Value: String);
begin
  if FTempString <> Value then
  begin
    FTempString := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 위치 설정
procedure TSBPosButtonNumber.SetLeft(const Value: Integer);
begin
  if FLeft <> Value then
  begin
    FLeft := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 위치 설정
procedure TSBPosButtonNumber.SetTop(const Value: Integer);
begin
  if FTop <> Value then
  begin
    FTop := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 색깔 설정
procedure TSBPosButtonNumber.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 그림자 색깔 설정
procedure TSBPosButtonNumber.SetColorShadow(const Value: TColor);
begin
  if FColorShadow <> Value then
  begin
    FColorShadow := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 헤더 색깔 설정
procedure TSBPosButtonNumber.SetColorHeader(const Value: TColor);
begin
  if FColorHeader <> Value then
  begin
    FColorHeader := Value;
    Change;
  end;
end;

//------------------------------------------------------------------------------
// 버튼 번호를 보일지 여부 그림자 여부 설정
procedure TSBPosButtonNumber.SetShowNumber(const Value:Boolean);
begin
  if FShowNumber <> Value then
  begin
    FShowNumber := Value;
    Change;
  end;
end;

//------------------------------------------------------------------------------
// 버튼 번호 정보 그림자 여부 설정
procedure TSBPosButtonNumber.SetShadow(const Value: Boolean);
begin
  if FShadow <> Value then
  begin
    FShadow := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 그림자 여부 설정
procedure TSBPosButtonNumber.SetHeader(const Value: Boolean);
begin
  if FHeader <> Value then
  begin
    FHeader := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 글꼴 설정
procedure TSBPosButtonNumber.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  Change;
end;

{ TSBPosButtonBottom }

//==============================================================================
// 버튼 Bottom 번호 정보
//------------------------------------------------------------------------------
// 버튼 Bottom 정보 생성자
constructor TSBPosButtonBottom.Create;
begin
  inherited Create;
  FChange       := False;
  FLeftString   := '';
  FCenterString := '';
  FRightString  := '';
  FLeft         := 7;
  FTop          := 20;
  FColor        := $0005BEED;
  FFont         := TFont.Create;
  FFont.Name    := '굴림체';
  FFont.Size    := 8;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 소멸자
destructor TSBPosButtonBottom.Destroy;
begin
  FFont.Free;

  inherited Destroy;
end;
//------------------------------------------------------------------------------
// 버튼 Bottom 정보 변경 이벤트
procedure TSBPosButtonBottom.Change;
begin
  if Assigned(FOnChange) and not FChange then
  begin
    FChange := True;
    FOnChange(Self);
  end;
end;
//------------------------------------------------------------------------------
// 버튼 Bottom 정보 번호 설정
procedure TSBPosButtonBottom.SetLeftString(const Value: String);
begin
  if FLeftString <> Value then
  begin
    FLeftString := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 가운데 캡션 설정
procedure TSBPosButtonBottom.SetCenterString(const Value: String);
begin
  if FCenterString <> Value then
  begin
    FCenterString := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 마지막 캡션 설정
procedure TSBPosButtonBottom.SetRightString(const Value: String);
begin
  if FRightString <> Value then
  begin
    FRightString := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 위치 설정
procedure TSBPosButtonBottom.SetLeft(const Value: Integer);
begin
  if FLeft <> Value then
  begin
    FLeft := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 번호 정보 위치 설정
procedure TSBPosButtonBottom.SetTop(const Value: Integer);
begin
  if FTop <> Value then
  begin
    FTop := Value;
    Change;
  end;
end;

procedure TSBPosButtonBottom.SetIsColor(const Value: Boolean);
begin
  if FIsColor <> Value then
  begin
    FIsColor := Value;
    Change;
  end;
end;


//------------------------------------------------------------------------------
// 버튼 번호 정보 색깔 설정
procedure TSBPosButtonBottom.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Change;
  end;
end;

//------------------------------------------------------------------------------
// 버튼 번호 정보 글꼴 설정
procedure TSBPosButtonBottom.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  Change;
end;


{ TSBPosButtonCaption }

//==============================================================================
// 버튼 캡션 정보
//------------------------------------------------------------------------------
// 버튼 캡션 정보 생성자
constructor TSBPosButtonCaption.Create;
begin
  inherited Create;

  FChange      := False;
  FCaption     := TStringList.Create;
  FCode        := TStringList.Create;
  FFont        := TFont.Create;
  FFont.Name   := '굴림체';
  FFont.Size   := 9;
  FColor       := clBlack;
  FColorShadow := clWhite;
  FShadow      := True;
  FIndex       := 0;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 소멸자
destructor TSBPosButtonCaption.Destroy;
begin
  FCaption.Free;
  FCode.Free;
  FFont.Free;

  inherited Destroy;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 변경 이벤트
procedure TSBPosButtonCaption.Change;
begin
  if Assigned(FOnChange) and not FChange then
  begin
    FChange := True;
    FOnChange(Self);
  end;
end;

//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션 설정
procedure TSBPosButtonCaption.SetCaption(const Value: TStrings);
begin
  FCaption.Assign(Value);
  Change;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 코드 설정
procedure TSBPosButtonCaption.SetCode(const Value: TStrings);
begin
  FCode.Assign(Value);
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 색깔 설정
procedure TSBPosButtonCaption.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 색깔 설정
procedure TSBPosButtonCaption.SetColorShadow(const Value: TColor);
begin
  if FColorShadow <> Value then
  begin
    FColorShadow := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 글꼴 설정
procedure TSBPosButtonCaption.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  Change;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 여부 설정
procedure TSBPosButtonCaption.SetShadow(const Value: Boolean);
begin
  if FShadow <> Value then
  begin
    FShadow := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션 인덱스 설정
procedure TSBPosButtonCaption.SetIndex(const Value: Integer);
begin
  if (Value >= 0) and (Value < FCaption.Count) and (FIndex <> Value) then
  begin
    FIndex := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션 개수
function TSBPosButtonCaption.GetCaption: Integer;
begin
  Result := FCaption.Count;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션, 코드 추가
procedure TSBPosButtonCaption.Add(ACaption, ACode: String);
begin
  FCaption.Add(ACaption);
  FCode.Add(ACode);
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션, 코드 모두 지우기
procedure TSBPosButtonCaption.Clear;
begin
  FCaption.Clear;
  FCode.Clear;
  FIndex := 0;
  Change;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션, 코드 지우기
procedure TSBPosButtonCaption.Delete(AIndex: Integer);
begin
  if (AIndex >= 0) and (AIndex < FCaption.Count) then
  begin
    FCaption.Delete(AIndex);
    FCode.Delete(AIndex);
    Change;
  end;
end;

{ TSBPosButtonMenuName }

//==============================================================================
// 메뉴명 캡션 정보
//------------------------------------------------------------------------------
// 버튼 캡션 정보 생성자
constructor TSBPosButtonMenuName.Create;
begin
  inherited Create;

  FChange      := False;
  FFont        := TFont.Create;
  FFont.Name   := '굴림체';
  FFont.Size   := 9;
  FColor       := clBlack;
  FColorShadow := clWhite;
  FShadow      := True;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 소멸자
destructor TSBPosButtonMenuName.Destroy;
begin
  FFont.Free;

  inherited Destroy;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 변경 이벤트
procedure TSBPosButtonMenuName.Change;
begin
  if Assigned(FOnChange) and not FChange then
  begin
    FChange := True;
    FOnChange(Self);
  end;
end;

//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션 설정
procedure TSBPosButtonMenuName.SetCaption(const Value: String);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 색깔 설정
procedure TSBPosButtonMenuName.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Change;
  end;
end;

//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 색깔 설정
procedure TSBPosButtonMenuName.SetColorShadow(const Value: TColor);
begin
  if FColorShadow <> Value then
  begin
    FColorShadow := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 글꼴 설정
procedure TSBPosButtonMenuName.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  Change;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 여부 설정
procedure TSBPosButtonMenuName.SetShadow(const Value: Boolean);
begin
  if FShadow <> Value then
  begin
    FShadow := Value;
    Change;
  end;
end;


//==============================================================================
// 버튼 캡션 정보
//------------------------------------------------------------------------------
// 버튼 캡션 정보 생성자
constructor TSBPosButtonAmount.Create;
begin
  inherited Create;

  FChange      := False;
  FFont        := TFont.Create;
  FFont.Name   := '굴림체';
  FFont.Size   := 9;
  FColor       := clBlack;
  FColorShadow := clWhite;
  FShadow      := True;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 소멸자
destructor TSBPosButtonAmount.Destroy;
begin
  FFont.Free;

  inherited Destroy;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 변경 이벤트
procedure TSBPosButtonAmount.Change;
begin
  if Assigned(FOnChange) and not FChange then
  begin
    FChange := True;
    FOnChange(Self);
  end;
end;

//------------------------------------------------------------------------------
// 버튼 캡션 정보 캡션 설정
procedure TSBPosButtonAmount.SetCaption(const Value: String);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 색깔 설정
procedure TSBPosButtonAmount.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Change;
  end;
end;

//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 색깔 설정
procedure TSBPosButtonAmount.SetColorShadow(const Value: TColor);
begin
  if FColorShadow <> Value then
  begin
    FColorShadow := Value;
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 글꼴 설정
procedure TSBPosButtonAmount.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  Change;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 정보 그림자 여부 설정
procedure TSBPosButtonAmount.SetShadow(const Value: Boolean);
begin
  if FShadow <> Value then
  begin
    FShadow := Value;
    Change;
  end;
end;


{ TSBPosButtonImage }

//==============================================================================
// 버튼 그림 정보
//------------------------------------------------------------------------------
// 버튼 그림 정보
constructor TSBPosButtonImage.Create;
begin
  inherited Create;

  FHandle := 0;
end;
//------------------------------------------------------------------------------
// 버튼 그림 정보
destructor TSBPosButtonImage.Destroy;
begin
  if (Length(FDLLName) > 0) and (FHandle > 0) then
    FreeLibrary(FHandle);

  inherited Destroy;
end;
//------------------------------------------------------------------------------
// 버튼 그림 정보
procedure TSBPosButtonImage.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;
//------------------------------------------------------------------------------
// 버튼 그림 정보
procedure TSBPosButtonImage.SetDLLName(const Value: String);
begin
  if FDLLName <> Value then
  begin
    // 기존에 이미지 DLL 이름이 있었으면 기존 DLL을 없앤다
    if (Length(FDLLName) > 0) and (FHandle > 0) then
      FreeLibrary(FHandle);

    FDLLName := Value;

    // 이미지 DLL 이름을 입력했으면 새 DLL을 불러온다
    FHandle := LoadLibrary(PChar(FDLLName));
//    if FHandle = 0 then
//      MessageBox(0, PChar(FDLLName+' 파일이 없습니다.'), 'SBPosButton', MB_OK+MB_ICONERROR);
    Change;
  end;
end;
//------------------------------------------------------------------------------
// 버튼 그림 정보
procedure TSBPosButtonImage.SetEnableImage(const Value: String);
begin
  if FEnableImage <> Value then
  begin
    FEnableImage := Value;
    Change;
  end;
end;


{ TSBPosButton }

//==============================================================================
// 생성자, 소멸자
//------------------------------------------------------------------------------
// 생성자
constructor TSBPosButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Width               := 60;
  Height              := 55;
  FColor              := TSBPosButtonColor.Create;
  FColor.OnChange     := Change;
  FNumber             := TSBPosButtonNumber.Create;
  FNumber.OnChange    := Change;
  FBottom             := TSBPosButtonBottom.Create;
  FBottom.OnChange    := Change;
  FCaption            := TSBPosButtonCaption.Create;
  FCaption.OnChange   := Change;
  FMenuName           := TSBPosButtonMenuName.Create;
  FMenuName.OnChange  := Change;
  FAmount             := TSBPosButtonAmount.Create;
  FAmount.OnChange    := Change;
  FImage              := TSBPosButtonImage.Create;
  FImage.OnChange     := Change;
  FBeep               := 4;
  FBeepHandle         := 0;
  FDontKeyPress       := False;
  FLayoutTop          := True;
  Bitmap              := TBitmap.Create;
  Bitmap.Width        := Self.Width;
  Bitmap.Height       := Self.Height;
  Temp1               := '';
  Temp2               := '';
  Temp3               := '';
  Temp4               := '';
  Temp5               := '';
  Temp6               := '';  
  IsWork              := False;
  FShowAccelChar := True;
  FFlags         := 0;
end;
//------------------------------------------------------------------------------
// 소멸자
destructor TSBPosButton.Destroy;
begin
  Bitmap.Free;
  FColor.Free;
  FNumber.Free;
  FBottom.Free;
  FCaption.Free;
  FAmount.Free;
  FImage.Free;

  inherited Destroy;
end;

//==============================================================================
// 속성 설정
//------------------------------------------------------------------------------
// 연결 컴포넌트 설정
procedure TSBPosButton.SetAssociate(const Value: TWinControl);
begin
  // 선택된 것을 새로 등록한다
  if FAssociate <> Value then
    FAssociate := Value;
end;

procedure TSBPosButton.SetShowAccelChar(Value: Boolean);
begin
  if FShowAccelChar <> Value then
  begin
    FShowAccelChar := Value;
    if FShowAccelChar then FFlags := 0
    else                   FFlags := DT_NOPREFIX;
    Invalidate;
  end;
end;
//------------------------------------------------------------------------------
// 색깔 설정
procedure TSBPosButton.SetColor(const Value: TSBPosButtonColor);
begin
  FColor.Assign(Value);
end;
//------------------------------------------------------------------------------
// 버튼 번호 설정
procedure TSBPosButton.SetNumber(const Value: TSBPosButtonNumber);
begin
  FNumber.Assign(Value);
end;

//------------------------------------------------------------------------------
// 버튼 Bottom 설정
procedure TSBPosButton.SetBottom(const Value: TSBPosButtonBottom);
begin
  FBottom.Assign(Value);
end;
//------------------------------------------------------------------------------
// 버튼 캡션 설정
procedure TSBPosButton.SetCaption(const Value: TSBPosButtonCaption);
begin
  FCaption.Assign(Value);
end;
//------------------------------------------------------------------------------
// 메뉴명 캡션 설정
procedure TSBPosButton.SetMenuName(const Value: TSBPosButtonMenuName);
begin
  FMenuName.Assign(Value);
end;

//------------------------------------------------------------------------------
// 버튼 금액 설정
procedure TSBPosButton.SetAmount(const Value: TSBPosButtonAmount);
begin
  FAmount.Assign(Value);
end;
//------------------------------------------------------------------------------
// 버튼 그림 설정
procedure TSBPosButton.SetImage(const Value: TSBPosButtonImage);
begin
  FImage.Assign(Value);
end;
//------------------------------------------------------------------------------
// 눌림 여부 설정
procedure TSBPosButton.SetDown(Value: Boolean);
begin
//  if FGroupIndex <= 0 then
//    Value := False;

  if FDown <> Value then
  begin
    if (not FAllowAllUp) and (FDown) then
      Exit;
    FDown    := Value;
{    isDowned := FDown;}
    Invalidate;
    if FDown then
      UpdateExclusive;
  end;
end;
//------------------------------------------------------------------------------
// 같은 그룹 내의 모든 버튼이 올라올 수 있는지 설정
procedure TSBPosButton.SetAllowAllUp(const Value: Boolean);
begin
  if FAllowAllUp <> Value then
  begin
    FAllowAllUp := Value;
    UpdateExclusive;
  end;
end;
//------------------------------------------------------------------------------
// 그룹 인덱스 설정
procedure TSBPosButton.SetGroupIndex(const Value: Integer);
begin
  if FGroupIndex <> Value then
  begin
    FGroupIndex := Value;
    UpdateExclusive;
  end;
end;

//==============================================================================
// 내부 메시지 처리
//------------------------------------------------------------------------------
// 그룹 눌림 설정
procedure TSBPosButton.UpdateExclusive;
var
  Msg: TMessage;
begin
  // 그룹이 설정돼 있을 때 눌려있는 버튼 이외의 모든 버튼을 눌리지 않게 메시지를 보낸다
  if (FGroupIndex > 0) and (Parent <> nil) then
  begin
    Msg.Msg    := CM_BUTTONPRESSED;
    Msg.WParam := FGroupIndex;
    Msg.LParam := LongInt(Self);
    Msg.Result := 0;
    Parent.Broadcast(Msg);
  end;
end;
//------------------------------------------------------------------------------
// 같은 그룹 눌림 재설정
procedure TSBPosButton.CMButtonPressed(var Message: TMessage);
var
  Sender: TSBPosButton;
begin
  // WParam 값이 - 면 버튼을 눌렀다 떼는 효과를 준다
  if (Message.WParam < 0) and (FCaption.Key = Message.LParam) then
  begin
    case Message.WParam of
      -1 : KeyDown;
      -2 : KeyUp;
      -3 : KeyPress;
    end;
  end
  // 0이면 눌린 버튼을 올린다 (두 버튼이 동시에 눌렸을 때 안올라오는 현상 없애기 위해)
  else if (Message.WParam = 0) and (Message.LParam = 12345) and (FGroupIndex = 0) {and (isDowned)} then
    KeyUp
  // 같은 그룹 내의 다른 버튼들을 눌려있지 않은 상태로 바꾼다
  else if (Message.WParam > 0) and (Message.WParam = FGroupIndex) and (Message.LParam <> 12345) then
  begin
    Sender := TSBPosButton(Message.LParam);
    if Sender <> Self then
    begin
      if Sender.Down and FDown then
      begin
        FDown    := False;
{        isDowned := False;}
        Invalidate;
      end;
      FAllowAllUp := Sender.AllowAllUp;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 더블 클릭
procedure TSBPosButton.WMLButtonDblClk(var Message: TWMLButtonDown);
begin
  inherited;

  if FDown then
    DblClick
  else
    Click;
end;

//==============================================================================
// 버튼 그리기
//------------------------------------------------------------------------------
// 버튼 그리기
procedure TSBPosButton.Paint;
begin
  inherited Paint;

  Bitmap.Width  := Width;
  Bitmap.Height := Height;

  // 버튼 배경을 그린다
  DrawButton;
  // 버튼 그림을 그린다
  DrawImage;
  // 버튼 번호를 쓴다
  DrawNumber;
  DrawMenuName;
  // 버튼 Bottom을 쓴다
  DrawBottom;
  // 버튼 캡션을 쓴다
  DrawCaption;
  // 버튼 금액을 쓴다
  DrawAmount;

  BitBlt(Canvas.Handle, 0, 0, Width, Height, Bitmap.Canvas.Handle, 0, 0, SRCCOPY);

  Hint := 'Top:'+IntToStr(Top)+', Left:'+IntToStr(Left)+', Height:'+IntToStr(Height)+', Width:'+IntToStr(Width);
end;
//------------------------------------------------------------------------------
// 바뀐 내용이 있을 때
procedure TSBPosButton.Change(Sender: TObject);
begin
  Invalidate;
end;
//------------------------------------------------------------------------------
// 버튼 배경 그리기
procedure TSBPosButton.DrawButton;
begin

  with Bitmap.Canvas do
  begin
    // 바탕
{    if not isDowned then}
    if not FDown then
      Brush.Color := FColor.Face
    else
      Brush.Color := FColor.FaceDown;
    FillRect(Rect(3, 3, Width-6, Height-6));

    // 테두리
{    if not isDowned then}
    if not FDown then
      Pen.Color   := FColor.Border
    else
      Pen.Color   := FColor.BorderDown;
    Rectangle(0, 0, Width, Height);

    // 위 그림자
{    if not isDowned then}
    if not FDown then
      Pen.Color := FColor.Highlight
    else
      Pen.Color := FColor.HighlightDown;
    MoveTo(1, 1);
    LineTo(Width-1, 1);
    MoveTo(1, 2);
    LineTo(1, Height-1);
    MoveTo(2, 2);
    LineTo(Width-2, 2);
    MoveTo(2, 3);
    LineTo(2, Height-2);

    // 아래 그림자
{    if not isDowned then}
    if not FDown then
      Pen.Color := FColor.Shadow
    else
      Pen.Color := FColor.ShadowDown;
    MoveTo(2, Height-2);
    LineTo(Width-1, Height-2);
    MoveTo(Width-2, 2);
    LineTo(Width-2, Height-2);
    MoveTo(3, Height-3);
    LineTo(Width-2, Height-3);
    MoveTo(Width-3, 3);
    LineTo(Width-3, Height-3);
  end;
  FColor.FChange := False;
end;
//------------------------------------------------------------------------------
// 버튼 번호 쓰기
procedure TSBPosButton.DrawNumber;
var
  vNumber :String;
  Index: Integer;
  CaptionRect: TRect;
begin
  // 번호가 0보다 클 때만 출력한다
//  if FNumber.Number > 0 then
    with Bitmap.Canvas do
    begin
      if FNumber.ShowNumber then
        vNumber := IntToStr(FNumber.Number)
      else
        vNumber := FNumber.NumberString;

      Font := FNumber.Font;
      // 바탕을 투명하게
      SetBkMode(Handle, 1);

{     if isDowned then}
      if FDown then
        Index := 2
      else
        Index := 0;

      // 그림자
      if Enabled then
        Font.Color := FNumber.ColorShadow
      else
        Font.Color := clBtnHighlight;
      if (FNumber.Shadow) {or (not Enabled)} then
        TextOut(FNumber.Left+Index+1, FNumber.Top+Index+1, vNumber);

      //헤더색깔
      if FNumber.FHeader then
      begin
        Brush.Color :=  FNumber.FColorHeader;
        FillRect(Rect(3, 1, Width-2, FNumber.Top + (Font.Size * 2)-3 ));
      end;

      // 번호
      if Enabled then
        Font.Color := FNumber.Font.Color
      else
        Font.Color := clBtnShadow;

    // 2005.05.11추가(김환준)
      CaptionRect := Rect(3, FNumber.Top+Index, Self.Width-6, Self.Height-3);
      DrawText(Handle,
               PChar(FNumber.FCenterString),
               Length(FNumber.FCenterString),
               CaptionRect, DT_WORDBREAK+DT_CENTER);

      DrawText(Handle,
               PChar(FNumber.FRightString),
               Length(FNumber.FRightString),
               CaptionRect, DT_WORDBREAK+DT_RIGHT);

      TextOut(FNumber.Left+Index, FNumber.Top+Index, vNumber);
    end;
    FNumber.FChange := False;
end;

procedure TSBPosButton.DrawBottom;
var
  Index: Integer;
  CaptionRect: TRect;

begin
  // 왼쪽 String가 공백이 아니면
  if (FBottom.LeftString <> '') or (FBottom.CenterString <> '') or (FBottom.RightString <> '') then
  begin
    with Bitmap.Canvas do
    begin
      Font := FBottom.Font;
      // 바탕을 투명하게
      SetBkMode(Handle, 1);

{     if isDowned then}
      if FDown then
        Index := 2
      else
        Index := 0;

      if FBottom.FIsColor then
      begin
        Brush.Color :=  FBottom.FColor;
        if Font.Size < 11 then
          FillRect(Rect(3, (Height+Index)-FBottom.Top-(Font.Size div 4), Self.Width-3, Self.Height-3))
        else
          FillRect(Rect(3, (Height+Index)-FBottom.Top-(Font.Size div 2), Self.Width-3, Self.Height-3));
      end;
      
      Font.Color := FBottom.Font.Color;
      if Font.Size < 11 then
      begin
//        TextOut(FBottom.Left+Index, (Height+Index)-FBottom.Top+(Font.Size div 4), FBottom.LeftString);
        CaptionRect := Rect(10, (Height+Index)-FBottom.Top+(Font.Size div 4), Self.Width-6, Self.Height-3);
      end
      else
      begin
//        TextOut(FBottom.Left+Index, (Height+Index)-FBottom.Top-(Font.Size div 2), FBottom.LeftString);
        CaptionRect := Rect(3, (Height+Index)-FBottom.Top-(Font.Size div 2)+2, Self.Width-6, Self.Height-3);
      end;

      DrawText(Handle,
               PChar(FBottom.FLeftString),
               Length(FBottom.FLeftString),
               CaptionRect, DT_WORDBREAK+DT_LEFT);

      DrawText(Handle,
               PChar(FBottom.FCenterString),
               Length(FBottom.FCenterString),
               CaptionRect, DT_WORDBREAK+DT_CENTER);

      DrawText(Handle,
               PChar(FBottom.FRightString),
               Length(FBottom.FRightString),
               CaptionRect, DT_WORDBREAK+DT_RIGHT);

    end;
  end;
  FBottom.FChange := False;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 쓰기
procedure TSBPosButton.DrawCaption;
var
  Index: Integer;
  CaptionRect: TRect;
begin
  // 현재 인덱스에 맞는 출력할 내용이 있으면
  if (FCaption.Caption.Count > FCaption.Index) and
     (Length(Trim(FCaption.Caption.Strings[FCaption.Index])) > 0) then
    with Bitmap.Canvas do
    begin

      Font := FCaption.Font;
      // 바탕을 투명하게
      SetBkMode(Handle, 1);
{     if isDowned then}
      if FDown then
        Index := 2
      else
        Index := 0;

      // 이름을 찍을 위치를 설정한다
      if FLayoutTop then
      begin
        if ImgHeight > 0 then
          CaptionRect := Rect(3, Self.Height-18, Self.Width-6, 18)
        else //if FNumber.Number > 0 then
//          CaptionRect := Rect(3, 13, Self.Width-6, Self.Height-15)
          CaptionRect := Rect(3, 10, Self.Width-6, Self.Height-15);    //김환준 수정(2005.05.26)
//        else
//          CaptionRect := Rect(3, 3, Self.Width-6, Self.Height-3);
      end
      else
        CaptionRect := Rect(ImgHeight+3, 3, Self.Width-6, Self.Height-3);

      // 자동 줄바꿈, 가운데 정렬로 이름을 쓸 자리를 미리 계산하고
      DrawText(Bitmap.Canvas.Handle,
               PChar(FCaption.Caption.Strings[FCaption.Index]),
               Length(FCaption.Caption.Strings[FCaption.Index]),
               CaptionRect, DT_WORDBREAK+DT_CENTER+DT_CALCRECT+DT_NOPREFIX);

      // 화면 가운데로 이동
      OffsetRect(CaptionRect,
                (Self.Width-CaptionRect.Right)   div 2 + Index,
                (Self.Height-CaptionRect.Bottom) div 2 + Index);

      if Enabled then
        Font.Color := FCaption.ColorShadow
      else
        Font.Color := clBtnHighlight;

      if (FCaption.Shadow) {or (not Enabled)} then
      begin
        DrawText(Handle,
                 PChar(FCaption.Caption.Strings[FCaption.Index]),
                 Length(FCaption.Caption.Strings[FCaption.Index]),
                 CaptionRect, DT_WORDBREAK+DT_CENTER+DT_NOPREFIX);
      end;

      // 캡션
      if Enabled then
        Font.Color := FCaption.Font.Color
      else
        Font.Color := clBtnShadow;

      OffsetRect(CaptionRect, -1, -1);
      DrawText(Handle,
               PChar(FCaption.Caption.Strings[FCaption.Index]),
               Length(FCaption.Caption.Strings[FCaption.Index]),
               CaptionRect, DT_WORDBREAK+DT_CENTER+DT_NOPREFIX);
    end;
    FCaption.FChange := False;
end;
//------------------------------------------------------------------------------
// 버튼 캡션 쓰기
procedure TSBPosButton.DrawMenuName;
var
  MenuNameRect: TRect;
  vCaption  : String;
begin
  // 현재 인덱스에 맞는 출력할 내용이 있으면
  if (FMenuName.Caption <> EmptyStr) then
    with Bitmap.Canvas do
    begin
      if not FShowAccelChar then
        vCaption := StringReplace(FMenuName.Caption,'&','&&',[rfReplaceAll])
      else
        vCaption := FMenuName.Caption;

      Font := FMenuName.Font;
      // 바탕을 투명하게
      SetBkMode(Handle, 1);
      Brush.Color := FColor.FFace;

      // 메뉴명을 찍을 위치를 설정한다
      MenuNameRect := Rect(0, FNumber.Top+(FNumber.Font.Size * 2), Self.Width-6, Self.Height-3);
      // 화면 가운데로 이동
      OffsetRect(MenuNameRect,
                (Self.Width-MenuNameRect.Right)   div 2+1,
                (Self.Height-MenuNameRect.Bottom) div 2+1);

//      SetBkMode(Handle, 2);

      // 그림자
      if Enabled then
        Font.Color := FMenuName.ColorShadow
      else
        Font.Color := clBtnHighlight;


      Font.Color := FMenuName.Font.Color;
(*      if (FMenuName.Shadow) {or (not Enabled)} then
      begin
        DrawText(Handle,
                 PChar(vCaption),
                 Length(vCaption),
                 MenuNameRect, DT_WORDBREAK+DT_CENTER);
      end;
*)      
      SetBkMode(Handle, 1);

      // 캡션
      if Enabled then
        Font.Color := FMenuName.Font.Color
      else
        Font.Color := clBtnShadow;

      OffsetRect(MenuNameRect, 0, 0);
      if FMenuName.Alignment = taCenter then
        DrawText(Handle,
                 PChar(vCaption),
                 Length(vCaption),
                 MenuNameRect, DT_WORDBREAK+DT_CENTER)
      else if FMenuName.Alignment = taLeftJustify then
        DrawText(Handle,
                 PChar(vCaption),
                 Length(vCaption),
                 MenuNameRect, DT_WORDBREAK+DT_LEFT)
      else if FMenuName.Alignment = taRightJustify then
        DrawText(Handle,
                 PChar(vCaption),
                 Length(vCaption),
                 MenuNameRect, DT_WORDBREAK+DT_RIGHT);
    end;
    FMenuName.FChange := False;
end;


//------------------------------------------------------------------------------
// 버튼 캡션 쓰기
procedure TSBPosButton.DrawAmount;
var
  AmountRect: TRect;
begin
  // 현재 인덱스에 맞는 출력할 내용이 있으면
  if (FAmount.Caption <> EmptyStr) then
    with Bitmap.Canvas do
    begin
      Font := FAmount.Font;
      // 바탕을 투명하게
      SetBkMode(Handle, 1);
      Brush.Color := FColor.FFace;

      // 금액을 찍을 위치를 설정한다
      AmountRect := Rect(0, Height-FBottom.Top-(FAmount.Font.Size*2), Self.Width-6, Self.Height-3);
      // 화면 가운데로 이동
      OffsetRect(AmountRect,
                (Self.Width-AmountRect.Right)   div 2,
                (Self.Height-AmountRect.Bottom) div 2);

//      SetBkMode(Handle, 2);

      // 그림자
      if Enabled then
        Font.Color := FAmount.ColorShadow
      else
        Font.Color := clBtnHighlight;


      if (FAmount.Shadow) {or (not Enabled)} then
      begin
        DrawText(Handle,
                 PChar(FAmount.Caption),
                 Length(FAmount.Caption),
                 AmountRect, DT_WORDBREAK+DT_CENTER);
      end;
      //SetBkMode(Handle, 1);

      // 캡션
      if Enabled then
        Font.Color := FAmount.Font.Color
      else
        Font.Color := clBtnShadow;

      OffsetRect(AmountRect, -1, -1);
      DrawText(Handle,
               PChar(FAmount.Caption),
               Length(FAmount.Caption),
               AmountRect, DT_WORDBREAK+DT_CENTER);
    end;
    FAmount.FChange := False;
end;

//------------------------------------------------------------------------------
// 버튼 그림 그리기
procedure TSBPosButton.DrawImage;
var
  ImgBmp: TBitmap;
  ImageName: String;
  ImageLeft, ImageTop: Integer;
begin
  // 불러올 그림 이름을 알아낸다
  if Enabled then
    ImageName := FImage.EnableImage
  else
    ImageName := FImage.DisableImage;

  // 불러올 그림이 있으면
  if Length(ImageName) > 0 then
  begin
    ImgBmp := TBitmap.Create;
    ImgBmp.Canvas.Brush.Color := Color.FFace;
    try
      // 이미지 DLL 이름이 없으면 실제 파일을 불러온다
      if Length(FImage.DLLName) = 0 then
      begin
        // 이미지 파일 이름이 있고 그 파일이 존재하면 해당 파일을 불러온다
        if FileExists(ImageName) then
          ImgBmp.LoadFromFile(ImageName);
      end
      // 이미지 DLL 이름이 있으면 DLL에서 그림을 불러온다
      else if FImage.Handle > 0 then
        ImgBmp.LoadFromResourceName(FImage.Handle, ImageName);

      if (ImgBmp.Width > 0) and (ImgBmp.Height > 0) then
      begin
        // 그림을 버튼 가운데에 그리게 한다
        ImgBmp.Canvas.Font.Assign(FCaption.Font);
        if FLayoutTop then
          ImageLeft := (Width -ImgBmp.Width)  div 2
        else
          ImageLeft := (Width -ImgBmp.Canvas.TextWidth(Caption.Caption[Caption.Index])-ImgBmp.Width - 5) div 2;

        if (Caption.Count > 0) and FLayoutTop then
          ImageTop  := ((Height-ImgBmp.Height) div 2) - 7
        else
          ImageTop  := (Height-ImgBmp.Height) div 2;

        if (ImageLeft < 0) or (ImageLeft >= Width)  then
          ImageLeft := 0;
        if (ImageTop < 0)  or (ImageTop  >= Height) then
          ImageTop  := 0;
{       if isDowned then}
        if FDown then
        begin
          Inc(ImageLeft, 2);
          Inc(ImageTop,  2);
        end;

        if FLayoutTop then
          ImgHeight := ImgBmp.Height
        else
          ImgHeight := ImgBmp.Width;

{ WindowsXP에서는 이 코드가 먹는데 Windows98에서는 안돼서 아래와 같이 수정함
        // 그림을 기존 배경에 투명하게 올려놓게 설정한다
        ImgBmp.Transparent      := True;
        ImgBmp.TransParentColor := ImgBmp.Canvas.Pixels[0,0];
        ImgBmp.TransparentMode  := tmFixed;

        // 기존 배경 위에 그림을 그린다
        Bitmap.Canvas.Draw(ImageLeft, ImageTop, ImgBmp);
}
        TransparentBlt(Bitmap.Canvas.Handle, ImageLeft, ImageTop, ImgBmp.Width, ImgBmp.Height,
                       ImgBmp.Canvas.Handle, 0, 0, ImgBmp.Width, ImgBmp.Height,
                       ImgBmp.Canvas.Pixels[0,0]);
      end;
    finally
      ImgBmp.Free;
    end;
  end

  else
    ImgHeight := 0;
end;

//==============================================================================
// 마우스 이벤트
//------------------------------------------------------------------------------
// 마우스를 클릭할 때
procedure TSBPosButton.KeyPress;
begin
  // 마우스로 누른게 아니고 키보드로 누른 경우에만 클릭 이벤트가 먹게 처리
  isKeyPress := True;
  Click;
end;
procedure TSBPosButton.Click;
begin
  // 눌려있는 상태가 아니면
  if (Enabled) and ((not Down) or (Down and AllowAllUp)) then
  begin
    if not isKeyPress then
      if BeepHandle > 0 then
        SendMessage(BeepHandle, SBM_BEEP, FBeep, 0)
      else
        SendMessage(Parent.Handle, SBM_BEEP, FBeep, 0);

    inherited ;

    with FCaption.Code do
    begin
      if (Count = 0) and (FCaption.Key > 0) and (not isKeyPress) and (not FDontKeyPress) then
      begin
        // 해당 글자의 키보드 이벤트를 발생시킨다
        Keybd_Event(FCaption.Key, MapVirtualKey(FCaption.Key, 0), 0, 0);
        Keybd_Event(FCaption.Key, MapVirtualKey(FCaption.Key, 0), KEYEVENTF_KEYUP, 0);
      end
      // 연결된 컴포넌트가 있고 보낼 코드가 있으면
      else if (FAssociate <> nil) and (Count > FCaption.Index) and (Length(Trim(Strings[FCaption.Index])) > 0) then
      begin
        // 코드와 Enter를 보낸다
        SendMessage(FAssociate.Handle, WM_SETTEXT, 0, Integer(PChar(Strings[FCaption.Index])));
        Keybd_Event(13, MapVirtualKey(13, 0), 0, 0);
        Keybd_Event(13, MapVirtualKey(13, 0), KEYEVENTF_KEYUP, 0);
//      SendMessage(FAssociate.Handle, WM_CHAR, 13, 0);
      end;
      isKeyPress := False;
    end;
  end

  else if Enabled and Down then
    inherited ;
end;
//------------------------------------------------------------------------------
// 마우스를 누를 때
procedure TSBPosButton.KeyDown;
begin
  MouseDown(mbLeft, [], 1, 1);
end;
procedure TSBPosButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Enabled then
  begin
    inherited;
{
    if (not Down) and (not isDowned) then
    begin
      isDowned := True;
      Repaint;
    end;}
  end;
end;
//------------------------------------------------------------------------------
// 마우스를 뗄 때
procedure TSBPosButton.KeyUp;
begin
  MouseUp(mbLeft, [], 1, 1);
end;
procedure TSBPosButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Enabled then
  begin
    inherited;

    if GroupIndex > 0 then
    begin
      if FAllowAllUp then
        Down := not FDown
      else
        Down := True;
{      isDowned := FDown;}
      Invalidate;
    end
{    else
      isDowned := False;
    Repaint;}
  end;
end;

end.





