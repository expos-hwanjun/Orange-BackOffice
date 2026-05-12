// 공통 코드 관리 (F)

unit SystemCode;

{
  포스타입
  0 : 정산포스
  1 : 주문포스
  2 : 키오스크
  4 : 주방모니터
  5 : 스마트패드
  6 : DID
  7 : 렛츠오더

  01 : POS
  02 : 주방프린터
  03 : 층코드
  04 : 객층
  05 : 회원 구분
  06 : 카드 매입사
  07 : 할인코드
  08 : 주문취소 코드
  09 : 매출취소
  10 : 시급코드
  11 : 출납
  12 : 포인트 적립
  13 : 포인트 사용
  14 : 연령대 코드
  15 : 시간대
  16 : 주방메모
  17 : 사용자그룹
  18 : SMS 메세지
  19 : 은행코드
  20 : 배달코스
  21 : 배달아이템
  22 : 배달지역
  23 : 서비스사유 코드
  24 : 테이블메모 코드
  25 : 프린터그룹 코드
  26 : 서비스요청코드(렛츠오더)
  27 : 대기테이블(렛츠오더로 주문)


  70 : 렛츠오더 배달시 요청사항
  71 : DID 디자인
  72 : DID 광고화일
  73 : DID 듀얼광고화일
  74 : DID Thrid 이미지

  81 : 고객주문서하단문구
  82 : 배달수기주문서
  83 : 테이블그룹색생
  84 : (01)키오스크 디자인
  85 : (02)키오스크 디자인

  87 : 포스디자인
  ~95
  96 : 듀얼이미지
  97 : 키오스크 이미지
  98 : 태블릿 대기이미지

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxControls, Math, StrUtils,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  StdCtrls, ExtCtrls, cxButtonEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvToolBar, AdvSplitter, cxLookAndFeelPainters,
  cxMemo, cxSpinEdit, cxTimeEdit, cxGroupBox, cxCurrencyEdit, AdvToolBarStylers,
  cxLookAndFeels, DBAccess, AdvGroupBox, AdvOfficePager, cxCheckListBox,
  cxCheckBox, Vcl.Menus, cxButtons, SBPosButton, Vcl.ComCtrls, TreeList,
  cxFontNameComboBox, JPEG, Vcl.ExtDlgs, Vcl.CheckLst, cxImage, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, PosButton, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, EncdDecd, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, AdvSmoothToggleButton,
  cxCheckComboBox, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePagerStylers;

type
  TSystemCodeForm = class(TInheritGridEditForm)
    MenuScrollBox: TScrollBox;
    GridTableViewCode: TcxGridColumn;
    GridTableViewName: TcxGridColumn;
    CodeLabel: TLabel;
    CodeEdit: TcxTextEdit;
    Notebook: TNotebook;
    POSNoLabel: TLabel;
    POSIPLabel: TLabel;
    POSRemarkLabel: TLabel;
    POSTypeLabel: TLabel;
    POSNoEdit: TcxTextEdit;
    POSIPEdit: TcxTextEdit;
    POSRemarkEdit: TcxTextEdit;
    POSTypeComboBox: TcxComboBox;
    MemberTypeNameLabel: TLabel;
    MemberTypeNameEdit: TcxTextEdit;
    MemberTypeUseLabel: TLabel;
    MemberTypeUseComboBox: TcxComboBox;
    GuestTypeNameLabel: TLabel;
    GuestTypeUseLabel: TLabel;
    GuestTypeNameEdit: TcxTextEdit;
    GuestTypeUseComboBox: TcxComboBox;
    CardCompanyNameLabel: TLabel;
    CardCompanyJoinNoLabel: TLabel;
    CardCompanyFeeLabel: TLabel;
    CardCompanyUseLabel: TLabel;
    CardCompanyFeePercentLabel: TLabel;
    CardCompanyNameEdit: TcxTextEdit;
    CardCompanyUseComboBox: TcxComboBox;
    CardCompanyJoinNoEdit: TcxTextEdit;
    CardCompanyFeeEdit: TcxCurrencyEdit;
    TimeZoneLabel: TLabel;
    TimeZoneUseLabel: TLabel;
    TimeZoneEdit: TcxMaskEdit;
    TimeZoneUseComboBox: TcxComboBox;
    TimeZoneAutoGroupBox: TcxGroupBox;
    TimeZoneAutoLabel: TLabel;
    TimeZoneAutoStartTimeEdit: TcxTimeEdit;
    TimeZoneAutoIntervalEdit: TcxSpinEdit;
    TimeZoneAutoButton: TButton;
    InOutNameLabel: TLabel;
    InOutLabel: TLabel;
    InOutRemarkLabel: TLabel;
    InOutUseLabel: TLabel;
    InOutLinkLabel: TLabel;
    InOutNameEdit: TcxTextEdit;
    InOutComboBox: TcxComboBox;
    InOutRemarkEdit: TcxTextEdit;
    InOutUseComboBox: TcxComboBox;
    InOutLinkComboBox: TcxComboBox;
    SaleCancelNameLabel: TLabel;
    SaleCancelUseLabel: TLabel;
    SaleCancelNameEdit: TcxTextEdit;
    SaleCancelUseComboBox: TcxComboBox;
    PointSaveNameLabel: TLabel;
    PointSaveLabel: TLabel;
    PointSaveUseLabel: TLabel;
    PointSavePointLabel: TLabel;
    PointSaveNameEdit: TcxTextEdit;
    PointSaveEdit: TcxCurrencyEdit;
    PointSaveUseComboBox: TcxComboBox;
    PointUseNameLabel: TLabel;
    PointUseLabel: TLabel;
    PointUsePointLabel: TLabel;
    PointUseUseLabel: TLabel;
    PointUseNameEdit: TcxTextEdit;
    PointUseEdit: TcxCurrencyEdit;
    PointUseUseComboBox: TcxComboBox;
    UserGradeNameLabel: TLabel;
    UserGradeUseLabel: TLabel;
    UserGradeNameEdit: TcxTextEdit;
    UserGradeUseComboBox: TcxComboBox;
    SMSNameLabel: TLabel;
    SMSUseLabel: TLabel;
    SMSLabel: TLabel;
    SMSLengthLabel: TLabel;
    SMSNameEdit: TcxTextEdit;
    SMSUseComboBox: TcxComboBox;
    SMSMemo: TcxMemo;
    BankLabel: TLabel;
    BankUseLabel: TLabel;
    BankNumberLabel: TLabel;
    BankMasterLabel: TLabel;
    BankEdit: TcxTextEdit;
    BankUseComboBox: TcxComboBox;
    BankNumberEdit: TcxTextEdit;
    BankMasterEdit: TcxTextEdit;
    TimePayNameLabel: TLabel;
    TimePayNameEdit: TcxTextEdit;
    TimePayAmtLabel: TLabel;
    TimePayAmtEdit: TcxCurrencyEdit;
    TimePayUseLabel: TLabel;
    TimePayUseComboBox: TcxComboBox;
    PointSaveSaleComboBox: TcxComboBox;
    PointSaveSaleLabel: TLabel;
    PointUseSaleLabel: TLabel;
    PointUseSaleComboBox: TcxComboBox;
    GridTableViewDsStatus: TcxGridColumn;
    POSType1ComboBox: TcxComboBox;
    VanGroupBox: TAdvGroupBox;
    VanLabel: TLabel;
    VanTIDLabel: TLabel;
    VanSerialNoLabel: TLabel;
    VanPasswordLabel: TLabel;
    POSLicenseKeyLabel: TLabel;
    VanComboBox: TcxComboBox;
    VanTIDEdit: TcxTextEdit;
    VanSerialNoEdit: TcxTextEdit;
    VanPasswordEdit: TcxTextEdit;
    VanBizNoEdit: TcxTextEdit;
    PosUseLabel: TLabel;
    PosUseComboBox: TcxComboBox;
    Label9: TLabel;
    KitchenNameEdit: TcxTextEdit;
    Label11: TLabel;
    KitchenUseComboBox: TcxComboBox;
    Label12: TLabel;
    KitchenLinkPosComboBox: TcxComboBox;
    Label14: TLabel;
    KitchenPortComboBox: TcxComboBox;
    KitchenIPAdressLabel: TLabel;
    KitchenIPAdressEdit: TcxTextEdit;
    Label16: TLabel;
    KitchenDeviceComboBox: TcxComboBox;
    Label17: TLabel;
    KitchenBaudRateComboBox: TcxComboBox;
    Label18: TLabel;
    KitchenPrintCountEdit: TcxSpinEdit;
    KitchenFirstPrintCheckBox: TcxCheckBox;
    KitchenFloorGroupBox: TAdvGroupBox;
    KitchenFloor1GroupBox: TAdvGroupBox;
    Label19: TLabel;
    FloorNameEdit: TcxTextEdit;
    Label20: TLabel;
    TableTitleFontSizeEdit: TcxSpinEdit;
    Label21: TLabel;
    TableCaptionFontSizeEdit: TcxSpinEdit;
    TableAmountFontSizeLabel: TLabel;
    TableAmountFontSizeEdit: TcxSpinEdit;
    Label23: TLabel;
    TableBottomFontSizeEdit: TcxSpinEdit;
    CornerLabel: TLabel;
    CornerComboBox: TcxComboBox;
    Label30: TLabel;
    FloorUseComboBox: TcxComboBox;
    Label31: TLabel;
    MemberDcRateEdit: TcxCurrencyEdit;
    Label32: TLabel;
    PointGroupBox: TAdvGroupBox;
    Label33: TLabel;
    MemberCashAmountEdit: TcxCurrencyEdit;
    MemberCashPointEdit: TcxSpinEdit;
    Label34: TLabel;
    MemberCardPointEdit: TcxSpinEdit;
    MemberCardAmountEdit: TcxCurrencyEdit;
    Label35: TLabel;
    MemberCashRcpPointEdit: TcxSpinEdit;
    MemberCashRcpAmountEdit: TcxCurrencyEdit;
    DcNameLabel: TLabel;
    DcNameEdit: TcxTextEdit;
    DcTypeComboBox: TcxComboBox;
    Label36: TLabel;
    Label37: TLabel;
    DcRateEdit: TcxCurrencyEdit;
    Label38: TLabel;
    Label39: TLabel;
    DcStandardAmountEdit: TcxCurrencyEdit;
    DcAmountEdit: TcxCurrencyEdit;
    Label40: TLabel;
    Label41: TLabel;
    DcMenuClassComboBox: TcxComboBox;
    Label42: TLabel;
    DcUseComboBox: TcxComboBox;
    OrderCancelNameLabel: TLabel;
    OrderCancelNameEdit: TcxTextEdit;
    Label44: TLabel;
    OrderCancelUseComboBox: TcxComboBox;
    AgeGroupNameLabel: TLabel;
    AgeGroupNameEdit: TcxTextEdit;
    Label49: TLabel;
    AgeGroupUseComboBox: TcxComboBox;
    KitchenMemoNameLabel: TLabel;
    Label54: TLabel;
    KitchenMemoNameEdit: TcxTextEdit;
    KitchenMemoUseComboBox: TcxComboBox;
    DeliveryCourseNameLabel: TLabel;
    Label56: TLabel;
    DeliveryCourseNameEdit: TcxTextEdit;
    DeliveryCourseUseComboBox: TcxComboBox;
    DeliveryItemNameLabel: TLabel;
    Label58: TLabel;
    DeliveryItemNameEdit: TcxTextEdit;
    DeliveryItemUseComboBox: TcxComboBox;
    DeliveryLocalNameLabel: TLabel;
    Label60: TLabel;
    DeliveryLocalNameEdit: TcxTextEdit;
    DeliveryLocalUseComboBox: TcxComboBox;
    OpenPictureDialog: TOpenPictureDialog;
    Sms1Button: TcxButton;
    Sms2Button: TcxButton;
    Sms4Button: TcxButton;
    Sms3Button: TcxButton;
    Label6: TLabel;
    SmsTypeComboBox: TcxComboBox;
    KitchenCheckListBox: TCheckListBox;
    Kitchen1CheckListBox: TCheckListBox;
    POSUserNameLabel: TLabel;
    POSUserNameEdit: TcxTextEdit;
    POSPhoneNoEdit: TcxTextEdit;
    POSPhoneNoLabel: TLabel;
    POSStatusEdit: TcxTextEdit;
    ServiceWhyLabel: TLabel;
    ServiceWhyEdit: TcxTextEdit;
    ServiceUseComboBox: TcxComboBox;
    Label8: TLabel;
    TableMemoLabel: TLabel;
    TableMemoEdit: TcxTextEdit;
    TableMemoUseComboBox: TcxComboBox;
    Label13: TLabel;
    PrinterGroupNameLabel: TLabel;
    PrinterGroupNameEdit: TcxTextEdit;
    PrinterGroupUseComboBox: TcxComboBox;
    Label10: TLabel;
    PrinterGroupKitchenLabel: TLabel;
    PrinterGroupKitchenComboBox: TcxComboBox;
    POSPrinterLabel: TLabel;
    POSPrinterComboBox: TcxComboBox;
    KitchenDisplayCheckBox: TcxCheckBox;
    KitchenColumComboBox: TcxComboBox;
    Label1: TLabel;
    MemberGiftAmountEdit: TcxCurrencyEdit;
    MemberGiftPointEdit: TcxSpinEdit;
    Label4: TLabel;
    MemberTrustAmountEdit: TcxCurrencyEdit;
    MemberTrustPointEdit: TcxSpinEdit;
    Label5: TLabel;
    MemberPointAmountEdit: TcxCurrencyEdit;
    MemberPointPointEdit: TcxSpinEdit;
    PosUserComboBox: TcxComboBox;
    TableButton: TPosButton;
    PosGroupBox: TcxGroupBox;
    Label15: TLabel;
    Label22: TLabel;
    PosDesignComboBox: TcxComboBox;
    PosPLUComboBox: TcxComboBox;
    Label2: TLabel;
    KitchenPrintBottomMaginEdit: TcxSpinEdit;
    Label3: TLabel;
    KitchenPrintTopMaginEdit: TcxSpinEdit;
    MemberTypeComboBox: TcxComboBox;
    Label25: TLabel;
    Label26: TLabel;
    VanEayPayComboBox: TcxComboBox;
    AdvGroupBox1: TAdvGroupBox;
    Label28: TLabel;
    Label47: TLabel;
    Label29: TLabel;
    Label50: TLabel;
    MemberTypeSaleAmtEdit: TcxCurrencyEdit;
    MemberSaleCountEdit: TcxSpinEdit;
    MemberClassNotChangeCheckBox: TcxCheckBox;
    ServiceCallLabel: TLabel;
    Label45: TLabel;
    ServiceCallEdit: TcxTextEdit;
    ServiceCallUseComboBox: TcxComboBox;
    Label27: TLabel;
    ServiceCallWavFileNameEdit: TcxTextEdit;
    LetsOrderOnlyCheckBox: TcxCheckBox;
    Label43: TLabel;
    TableTableNoSpinEdit: TcxSpinEdit;
    KitchenButton: TAdvSmoothToggleButton;
    AdvSmoothToggleButton1: TAdvSmoothToggleButton;
    AdvSmoothToggleButton2: TAdvSmoothToggleButton;
    AdvSmoothToggleButton3: TAdvSmoothToggleButton;
    AdvSmoothToggleButton4: TAdvSmoothToggleButton;
    AdvSmoothToggleButton5: TAdvSmoothToggleButton;
    AdvSmoothToggleButton6: TAdvSmoothToggleButton;
    AdvSmoothToggleButton7: TAdvSmoothToggleButton;
    AdvSmoothToggleButton8: TAdvSmoothToggleButton;
    AdvSmoothToggleButton9: TAdvSmoothToggleButton;
    AdvSmoothToggleButton10: TAdvSmoothToggleButton;
    AdvSmoothToggleButton11: TAdvSmoothToggleButton;
    AdvSmoothToggleButton12: TAdvSmoothToggleButton;
    AdvSmoothToggleButton13: TAdvSmoothToggleButton;
    AdvSmoothToggleButton14: TAdvSmoothToggleButton;
    AdvSmoothToggleButton15: TAdvSmoothToggleButton;
    AdvSmoothToggleButton16: TAdvSmoothToggleButton;
    AdvSmoothToggleButton17: TAdvSmoothToggleButton;
    AdvSmoothToggleButton18: TAdvSmoothToggleButton;
    AdvSmoothToggleButton19: TAdvSmoothToggleButton;
    AdvSmoothToggleButton20: TAdvSmoothToggleButton;
    AdvSmoothToggleButton21: TAdvSmoothToggleButton;
    AdvSmoothToggleButton22: TAdvSmoothToggleButton;
    AdvSmoothToggleButton23: TAdvSmoothToggleButton;
    AdvSmoothToggleButton25: TAdvSmoothToggleButton;
    HeadMemberRemarkLabel: TLabel;
    Label7: TLabel;
    TableMenuDPCountEdit: TcxSpinEdit;
    ServicePrintLabel: TLabel;
    ServicePrintComboBox: TcxComboBox;
    AdvSmoothToggleButton26: TAdvSmoothToggleButton;
    WaitFloorCheckBox: TcxCheckBox;
    ServiceKitchenCheckListBox: TCheckListBox;
    DcTypeMenuComboBox: TcxComboBox;
    RustDeskGroupBox: TAdvGroupBox;
    RustDeskIDEdit: TcxTextEdit;
    Label24: TLabel;
    RustDeskLinkButton: TAdvSmoothToggleButton;
    Label159: TLabel;
    FloorColorPanel: TPanel;
    ColorDialog: TColorDialog;

    procedure FormShow(Sender: TObject);
    procedure MenuButtonClick(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure TimeZoneAutoButtonClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure EditStyleControllerStyleChanged(Sender: TObject);
    procedure RustDeskLinkButtonClick(Sender: TObject);
    procedure FloorColorPanelClick(Sender: TObject);

  private
    SelectedIndex, BeforeIndex: Integer;
    PosMacAddres :String;
    VanCode      :String;
    procedure SetFocus(aIndex:Integer);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  SystemCodeForm: TSystemCodeForm;



implementation

uses
  Common, DBModule, ProxyCheck, Help, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSystemCodeForm.FloorColorPanelClick(Sender: TObject);
begin
  inherited;
  ColorDialog.Color := (Sender as TPanel).Color;
  if ColorDialog.Execute then
  begin
    (Sender as TPanel).Color := ColorDialog.Color;
    isChanged            := true;
  end;
end;

procedure TSystemCodeForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  isLoading := true;
  //////////////// 포스관리 ///////////////////
  //IC 카드 보안에 따른 VAN 정보 설정
  VanComboBox.Properties.Items.Clear;

  New(vCode);
  vCode^.Data := '0';
  VanComboBox.Properties.Items.AddObject('KOCES (한국신용카드결제)', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  VanComboBox.Properties.Items.AddObject('DAOU (다우데이터)', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  VanComboBox.Properties.Items.AddObject('NICE (나이스정보통신)', TObject(vCode));
  New(vCode);
  vCode^.Data := '3';
  VanComboBox.Properties.Items.AddObject('KICC (한국정보통신)', TObject(vCode));
  New(vCode);
  vCode^.Data := '4';
  VanComboBox.Properties.Items.AddObject('KIS (KIS정보통신)', TObject(vCode));
  New(vCode);
  vCode^.Data := '5';
  VanComboBox.Properties.Items.AddObject('KSNET (케이에스넷)', TObject(vCode));
  New(vCode);
  vCode^.Data := '6';
  VanComboBox.Properties.Items.AddObject('KCP (한국사이버결제)', TObject(vCode));
  New(vCode);
  vCode^.Data := '7';
  VanComboBox.Properties.Items.AddObject('KPN (파이서브)', TObject(vCode));
  New(vCode);
  vCode^.Data := '8';
  VanComboBox.Properties.Items.AddObject('JTNET (제이티넷)', TObject(vCode));
  New(vCode);
  vCode^.Data := '9';
  VanComboBox.Properties.Items.AddObject('KFTC (금융결제원)', TObject(vCode));
  New(vCode);
  vCode^.Data := '10';
  VanComboBox.Properties.Items.AddObject('Smartro (스마트로)', TObject(vCode));
  New(vCode);
  vCode^.Data := '11';
  VanComboBox.Properties.Items.AddObject('KOVAN (코밴)', TObject(vCode));
  New(vCode);
  vCode^.Data := '12';
  VanComboBox.Properties.Items.AddObject('섹터나인(SPC 네트웍스)', TObject(vCode));

  POSType1ComboBox.Visible := GetOption(16)='2';
  //////////////// 주방프린터 ///////////////////
  KitchenFloorGroupBox.Visible  := GetOption(26)='1';
  KitchenFloor1GroupBox.Visible := GetOption(26)='1';

  ////////////////// 프로그램 권한 ////////////////
  //배달
  AdvSmoothToggleButton20.Visible := GetOption(185) = '1';
  AdvSmoothToggleButton21.Visible   := GetOption(185) = '1';
  AdvSmoothToggleButton22.Visible  := GetOption(185) = '1';
  //푸드코트
  CornerLabel.Visible              := GetOption(231) = '1';
  CornerComboBox.Visible           := GetOption(231) = '1';
  if (GetOption(231) = '1') and (GetOption(249) = '1') then
    VanBizNoEdit.Enabled := false;

  //메뉴별로 포인트적립시에는 안보이게 한다
  PointGroupBox.Visible := GetOption(258) = '0';
  if not PointGroupBox.Visible then
  begin
    MemberTypeUseLabel.Top    := PointGroupBox.Top;
    MemberTypeUseComboBox.Top := PointGroupBox.Top-2;
  end;

  MemberTypeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  MemberTypeComboBox.Properties.Items.AddObject('할인', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  MemberTypeComboBox.Properties.Items.AddObject('포인트', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  MemberTypeComboBox.Properties.Items.AddObject('할인&포인트', TObject(vCode));
  if GetOption(251)='1' then
  begin
    New(vCode);
    vCode^.Data := '3';
    MemberTypeComboBox.Properties.Items.AddObject('메뉴별 할인율', TObject(vCode));
  end;
  isLoading := false;
end;

procedure TSystemCodeForm.FormShow(Sender: TObject);
var
  vCode  :PStrPointer;
  vIndex :Integer;
begin
  inherited;
  // 1번 POS의 밴 정보를 전체 POS에 지정하기 위해 기본 값을 읽어온다
  OpenQuery('select Ifnull(NM_CODE5,''0'')  as CODE '
           +'  from MS_CODE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and CD_KIND  = ''01'' '
           +'   and CD_CODE  = ''001''',
           [HeadStoreCode,
            StoreCode]);
  try
    if not Query.Eof then
    begin
      VanCode     := Query.Fields[0].AsString;
    end;
  finally
    Query.Close;
  end;

//  // 포스 디자인
//  OpenQuery('select cast(CD_KIND as int) - 86  '
//           +'  from MS_CODE '
//           +' where CD_HEAD  = :P0 '
//           +'   and CD_STORE = :P1 '
//           +'   and cast(CD_KIND as int) between 87 and 95 '
//           +' group by CD_KIND ',
//           [HeadStoreCode,
//            StoreCode]);
//  try
//    PosDesignComboBox.Properties.Items.Clear;
//    while not Query.Eof do
//    begin
//      PosDesignComboBox.Properties.Items.Add(FormatFloat('00',Query.Fields[0].AsInteger));
//      Query.Next;
//    end;
//  finally
//    PosDesignComboBox.ItemIndex := 0;
//    Query.Close;
//  end;

  // 포스 PLU
//  OpenQuery('select CD_GUBUN  '
//           +'  from MS_LARGE '
//           +' where CD_HEAD  = :P0 '
//           +'   and CD_STORE = :P1 '
//           +' group by CD_GUBUN '
//           +' order by 1 ',
//           [HeadStoreCode,
//            StoreCode]);
//  try
//    PosPLUComboBox.Properties.Items.Clear;
//    while not Query.Eof do
//    begin
//      PosPLUComboBox.Properties.Items.Add(Query.Fields[0].AsString);
//      Query.Next;
//    end;
//  finally
//    PosPLUComboBox.ItemIndex := 0;
//    Query.Close;
//  end;



  // 주방프린터 층
  OpenQuery('select CD_CODE, '
           +'       NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD   =:P0 '
           +'   and CD_STORE  =:P1 '
           +'   and CD_KIND   = ''03'' '
           +'   and DS_STATUS = ''0'' '
           +'  order by CD_CODE',
            [HeadStoreCode,
             StoreCode]);
  try
    KitchenCheckListBox.Items.Clear;
    Kitchen1CheckListBox.Items.Clear;
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      KitchenCheckListBox.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Kitchen1CheckListBox.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  // 메뉴분류
  OpenQuery('select CD_CLASS, '
           +'       NM_CLASS '
           +'  from MS_MENU_CLASS '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and Length(CD_CLASS) = 2 '
           +'  order by CD_CLASS',
            [HeadStoreCode,
             StoreCode]);
  try
    DcMenuClassComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := EmptyStr;
    DcMenuClassComboBox.Properties.Items.AddObject('', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      DcMenuClassComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    DcMenuClassComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;

  // 코너
  OpenQuery('select CD_TRDPL, '
           +'       NM_TRDPL '
           +'  from MS_TRD '
           +' where CD_HEAD   =:P0 '
           +'   and CD_STORE  =:P1 '
           +'   and DS_TRDPL  =''C'' '
           +'   and DS_STATUS =''0'' '
           +'  order by CD_TRDPL ',
            [HeadStoreCode,
             StoreCode]);
  try
    CornerComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := EmptyStr;
    CornerComboBox.Properties.Items.AddObject('', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      CornerComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    CornerComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;

  // 키오스크 사용자
  OpenQuery('select CD_SAWON, '
           +'       NM_SAWON '
           +'  from MS_SAWON '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_SAWON = ''P'' '
           +'   and YN_USE    =''Y'' '
           +'  order by CD_SAWON ',
            [HeadStoreCode,
             StoreCode]);
  try
    PosUserComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := EmptyStr;
    PosUserComboBox.Properties.Items.AddObject('', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      PosUserComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    PosUserComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;

  // 본사로 로그인 시
  if StoreCode = HeadStoreCode then
    for vIndex := 0 to ComponentCount-1 do
      if (Components[vIndex] is TAdvGlowButton) and (TAdvGlowButton(Components[vIndex]).Parent = MenuScrollBox) then
        TAdvGlowButton(Components[vIndex]).Visible := false;

  isChanged := false;
  // 기본적으로 첫 번째 버튼을 누른다
  AdvSmoothToggleButton1.Click;
end;

procedure TSystemCodeForm.GridTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color  := clHighlightText;
  end;
//  inherited;
end;

procedure TSystemCodeForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  //통합회원 사용시
  if (GetStoreOption(5) = '1') and ((NoteBook.ActivePage = 'Member') or (NoteBook.ActivePage = 'PointSave') or (NoteBook.ActivePage = 'PointUse')) then
  begin
    ButtonToolBarSearchButton.Enabled := false;
    ButtonToolBarNewButton.Enabled    := false;
    ButtonToolBarDeleteButton.Enabled := false;
    MainPanel.Enabled := False;
  end;
end;

procedure TSystemCodeForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[2] = '1' then
    AStyle := StyleFontRed;
end;

procedure TSystemCodeForm.MenuButtonClick(Sender: TObject);
var
  vIndex: Integer;
  vHelpURL :String;
begin
  inherited;

  // 변경된 자료가 있을 때는 저장부터 한다
  if isChanged then
  begin
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  // 모든 버튼 활성화
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TAdvSmoothToggleButton) and (TAdvSmoothToggleButton(Components[vIndex]).Parent = MenuScrollBox) then
      TAdvSmoothToggleButton(Components[vIndex]).Down := false;
  // 현재 누른 버튼 비활성화
  TAdvSmoothToggleButton(Sender).Down := true;

  SelectedIndex := (Sender as TAdvSmoothToggleButton).Tag;

  NoteBook.ActivePage := (Sender as TAdvSmoothToggleButton).Hint;
  ClearEdit;

  GridTableView.DataController.RecordCount := 0;
  ButtonToolBarSearchButton.Click;

  //통합회원 사용시
  if (GetStoreOption(5) = '1') and ((NoteBook.ActivePage = 'Member') or (NoteBook.ActivePage = 'PointSave') or (NoteBook.ActivePage = 'PointUse')) then
  begin
    ButtonToolBarSearchButton.Enabled := false;
    ButtonToolBarNewButton.Enabled    := false;
    ButtonToolBarDeleteButton.Enabled := false;
    DoSearch;
    if GridTableView.DataController.RecordCount > 0 then
      GridTableView.DataController.FocusedRecordIndex := GridTableView.DataController.RecordCount - 1;
    MainPanel.Enabled := False;
    HeadMemberRemarkLabel.Visible := true;
  end
  else
  begin
    ButtonToolBarSearchButton.Enabled := true;
    ButtonToolBarNewButton.Enabled    := true;
    ButtonToolBarDeleteButton.Enabled := true;
  end;

  if GridTableView.DataController.RecordCount = 0 then
    MainPanel.Enabled := False;
  BeforeIndex := SelectedIndex;
end;

procedure TSystemCodeForm.RustDeskLinkButtonClick(Sender: TObject);
begin
  inherited;
  if Trim(RustDeskIDEdit.Text) = '' then
  begin
    MsgBox('원격정보가 없습니다');
    Exit;
  end;
  if not AskBox('원격제어를 하시겠습니까?') then Exit;
  if not RunningProgram('rustdesk.exe') then
  begin
    if not FileExists(ExtractFileName(Application.ExeName)+'RustDesk.exe') then
      FileDownLoad('RustDesk.exe', ExtractFileName(Application.ExeName));
    GetDosOutput('rustdesk.exe --silent-install', ExtractFileName(Application.ExeName));
    while not RunningProgram('rustdesk.exe') do
      Application.ProcessMessages;
  end;

  ExecuteProgram('rustdesk.exe','C:\Program Files\RustDesk\', Format('--connect %s --password exPos15444171',[RustDeskIDEdit.Text]));
end;

procedure TSystemCodeForm.SetFocus(aIndex: Integer);
var vIndex :Integer;
begin
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TcxTextEdit) and (TcxTextEdit(Components[vIndex]).Parent = TWinControl(NoteBook.Pages[aIndex]) )
       and (TcxTextEdit(Components[vIndex]).TabOrder = 0) then
    begin
      TcxTextEdit(Components[vIndex]).SetFocus;
      Break;
    end;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 내용을 변경할 때
procedure TSystemCodeForm.EditPropertiesChange(Sender: TObject);
var
  vLength: Integer;
  vCode  :PStrPointer;
  vTemp  :String;
begin
  inherited;
  // POS VAN
  if Sender = VanComboBox then
  begin
    VanTIDEdit.Clear;
    VanBizNoEdit.Clear;
    VanPasswordEdit.Clear;
    VanSerialNoEdit.Clear;
    VanBizNoEdit.Enabled            := true;
    VanSerialNoEdit.Enabled         := false;
    VanPasswordLabel.Caption        := '비밀번호';
    VanPasswordEdit.Clear;
    VanPasswordEdit.Enabled         := false;
    VanTIDEdit.Enabled              := true;
    if GetStrPointerData(VanComboBox) = '8' then
      VanTIDEdit.Properties.MaxLength := 10
    else
      VanTIDEdit.Properties.MaxLength := 15;

    VanEayPayComboBox.Properties.Items.Clear;
    if (GetStrPointerData(VanComboBox) = '12') then
    begin
      New(vCode);
      vCode^.Data := 'N';
      VanEayPayComboBox.Properties.Items.AddObject('통합결제', TObject(vCode));
    end
    else
    begin
      New(vCode);
      vCode^.Data := 'N';
      VanEayPayComboBox.Properties.Items.AddObject('사용안함', TObject(vCode));
      New(vCode);
      vCode^.Data := 'M';
      VanEayPayComboBox.Properties.Items.AddObject('멀티패드', TObject(vCode));
    end;

    case StrToIntDef(GetStrPointerData(VanComboBox),0) of
      0 :      // KOCES
        begin
          VanSerialNoEdit.Enabled         := True;
          VanTIDEdit.Properties.MaxLength := 10;
          VanEayPayComboBox.Properties.Items.Clear;
          New(vCode);
          vCode^.Data := 'N';
          VanEayPayComboBox.Properties.Items.AddObject('통합결제', TObject(vCode));
          New(vCode);
          vCode^.Data := 'S';
          VanEayPayComboBox.Properties.Items.AddObject('스캐너', TObject(vCode));   //키오스크에서 스캐너입력
        end;
      2 :     // NICE
        begin
          VanEayPayComboBox.Properties.Items.Clear;
          New(vCode);
          vCode^.Data := 'N';
          VanEayPayComboBox.Properties.Items.AddObject('통합결제', TObject(vCode));
          New(vCode);
          vCode^.Data := 'S';
          VanEayPayComboBox.Properties.Items.AddObject('스캐너', TObject(vCode));   //키오스크에서 스캐너입력
        end;
      4 :      // KIS
        begin
          VanPasswordEdit.Enabled  := True;
          VanSerialNoEdit.Enabled  := true;
          VanPasswordLabel.Caption := 'U B M S';
          New(vCode);
          vCode^.Data := 'S';
          VanEayPayComboBox.Properties.Items.AddObject('스캐너', TObject(vCode));   //키오스크에서 스캐너입력
        end;
      5 : //KSNET
        begin
          New(vCode);
          vCode^.Data := 'T';
          VanEayPayComboBox.Properties.Items.AddObject('토스프론트', TObject(vCode));
        end;
      7 :      // KPN
        begin
          VanEayPayComboBox.Properties.Items.Clear;
          New(vCode);
          vCode^.Data := 'N';
          VanEayPayComboBox.Properties.Items.AddObject('통합결제', TObject(vCode));
          New(vCode);
          vCode^.Data := 'S';
          VanEayPayComboBox.Properties.Items.AddObject('스캐너', TObject(vCode));   //키오스크에서 스캐너입력
          VanSerialNoEdit.Enabled         := True;
          VanTIDEdit.Enabled              := true;
          VanBizNoEdit.Enabled            := true;
        end;
      8 : //JTNET
        begin
          New(vCode);
          vCode^.Data := 'T';
          VanEayPayComboBox.Properties.Items.AddObject('통합결제', TObject(vCode));
        end;
      9 :      // 금융결제원
        begin
          VanPasswordEdit.Enabled := True;
        end;
    end;

  end
  else if Sender = TableTitleFontSizeEdit then
  begin
    TableButton.Number.Font.Size := Trunc(TableTitleFontSizeEdit.Value);
    TableButton.Refresh;
  end
  else if Sender = TableCaptionFontSizeEdit then
  begin
    TableButton.Menu.Font.Size := Trunc(TableCaptionFontSizeEdit.Value);
    TableButton.Refresh;
  end
  else if Sender = TableAmountFontSizeEdit then
  begin
    TableButton.Amount.Font.Size := Trunc(TableAmountFontSizeEdit.Value);
    TableButton.Refresh;
  end
  else if Sender = TableBottomFontSizeEdit then
  begin
    TableButton.Bottom.Font.Size := Trunc(TableBottomFontSizeEdit.Value);
    TableButton.Refresh;
  end
  //주방프린터 포트(이더넷일때)
  else if Sender = KitchenPortComboBox then
  begin
    KitchenIPAdressEdit.Enabled := KitchenPortComboBox.Text = 'Ethernet(LAN)';
    if not KitchenIPAdressEdit.Enabled then KitchenIPAdressEdit.Clear;
  end
  else if Sender = DcTypeComboBox then
  begin
    case DcTypeComboBox.ItemIndex of
      0 :
      begin
        DcRateEdit.Enabled := True;
        DcStandardAmountEdit.Enabled  := False;
        DcStandardAmountEdit.Value    := 0;
        DcAmountEdit.Enabled          := False;
        DcAmountEdit.Value            := 0;
        DcMenuClassComboBox.Enabled   := False;
      end;
      1 :
      begin
        DcRateEdit.Enabled            := False;
        DcRateEdit.Value              := 0;
        DcStandardAmountEdit.Enabled  := True;
        DcAmountEdit.Enabled          := True;
        DcMenuClassComboBox.Enabled   := False;
      end;
      2 :
      begin
        DcRateEdit.Enabled            := True;
        DcRateEdit.Value              := 0;
        DcStandardAmountEdit.Enabled  := False;
        DcAmountEdit.Enabled          := False;
        DcMenuClassComboBox.Enabled   := True;
      end;
    end;
  end
  // SMS 내용
  else if Sender = SMSMemo then
  begin
{    vLength := LengthB(SMSMemo.Text);
    if vLength > 90 then
    begin
      SMSMemo.Text     := CopyStr(SMSMemo.Text, 1, 90);
      SMSMemo.SelStart := Length(SMSMemo.Text);
    end;
}
    SMSLengthLabel.Caption := IntToStr(LengthB(SMSMemo.Text));
  end
  // SMS 구분
  else if Sender = SmsTypeComboBox then
  begin
    Sms1Button.Visible := SmsTypeComboBox.ItemIndex in [1,2];
    Sms2Button.Visible := SmsTypeComboBox.ItemIndex = 1;
    Sms3Button.Visible := SmsTypeComboBox.ItemIndex = 1;
    Sms4Button.Visible := SmsTypeComboBox.ItemIndex = 1;
  end
  // SMS 버튼
  else if (Sender = Sms1Button) or (Sender = Sms2Button) or (Sender = Sms3Button) or (Sender = Sms4Button) then
  begin
    if Sender = Sms1Button then
      vTemp := '고객명'
    else if Sender = Sms2Button then
      vTemp := '적립'
    else if Sender = Sms3Button then
      vTemp := '사용'
    else if Sender = Sms4Button then
      vTemp := '잔여';

    SMSMemo.Text     := Copy(SMSMemo.Text,1,SMSMemo.SelStart)+ '{'+vTemp+'}' +Copy(SMSMemo.Text,SMSMemo.SelStart+1, Length(SMSMemo.Text)-SMSMemo.SelStart);
//    SMSMemo.SelStart := Length(SMSMemo.Text);
    SMSMemo.SetFocus;
  end
  //포스구분
  else if Sender = POSTypeComboBox then
  begin
    RustDeskGroupBox.Visible := GetStrPointerData(POSTypeComboBox) <> '7';
    //정산포스일때만 밴정보를 입력하게 한다
    VanGroupBox.Visible := (GetStrPointerData(POSTypeComboBox) = '0') or (GetStrPointerData(POSTypeComboBox) = '2') ;
    POSType1ComboBox.Visible  := (GetOption(16)='2') and ((GetStrPointerData(POSTypeComboBox) = '0') or (GetStrPointerData(POSTypeComboBox) = '1'));
    if POSTypeComboBox.ItemIndex = 2 then
      POSType1ComboBox.ItemIndex := 1;

    PosDesignComboBox.Enabled := GetStrPointerData(POSTypeComboBox) <> '2';

    PosGroupBox.Visible     := (GetStrPointerData(POSTypeComboBox) = '0') or (GetStrPointerData(POSTypeComboBox) = '1') or (GetStrPointerData(POSTypeComboBox) = '2');
    //키오스크,셀프대기, 렛츠오더일때 기본사용자
    PosUserComboBox.Visible := (GetStrPointerData(POSTypeComboBox) = '2') or (GetStrPointerData(POSTypeComboBox) = '7');

    ServiceKitchenCheckListBox.Visible := false;
    POSStatusEdit.Visible        := false;
    //주방모니터일때
    if GetStrPointerData(POSTypeComboBox) = '4' then
    begin
      POSPrinterLabel.Caption    := '주    방';
      POSPrinterLabel.Visible    := true;
      ServicePrintLabel.Visible    := false;
      ServicePrintComboBox.Visible := false;
      POSPrinterComboBox.Visible := true;
      POSStatusEdit.Visible      := true;

      POSPrinterLabel.Top    := PosTypeLabel.Top       + 32;
      POSPrinterComboBox.Top := POSTypeComboBox.Top    + 29;
      POSRemarkLabel.Top     := POSPrinterComboBox.Top    + 32;
      POSRemarkEdit.Top      := POSPrinterComboBox.Top     + 29;
      POSUseLabel.Top        := POSRemarkEdit.Top     + 32;
      POSUseComboBox.Top     := POSRemarkEdit.Top      + 29;
      POSPrinterComboBox.Properties.Items.Clear;
      DM.OpenQuery('select CD_CODE, '
                  +'       NM_CODE1 '
                  +'  from MS_CODE '
                  +' where CD_HEAD   =:P0 '
                  +'   and CD_STORE  =:P1 '
                  +'   and CD_KIND   = ''02'' '
                  +'   and DS_STATUS = ''0'' '
                  +'  order by CD_CODE',
                  [HeadStoreCode,
                   StoreCode]);
      try
        POSPrinterComboBox.Properties.Items.Clear;
        while not DM.Query.Eof do
        begin
          New(vCode);
          vCode^.Data := DM.Query.Fields[0].AsString;
          POSPrinterComboBox.Properties.Items.AddObject(DM.Query.Fields[1].AsString, TObject(vCode));
          DM.Query.Next;
        end;
      finally
        DM.FinishQuery;
      end;
    end
    //렛츠오더
    else if GetStrPointerData(POSTypeComboBox) = '7' then
    begin
      POSPrinterLabel.Caption      := '주 문 서';
      POSPrinterLabel.Visible      := true;
      POSPrinterComboBox.Visible   := true;
      ServicePrintLabel.Visible    := true;
      ServicePrintComboBox.Visible := true;

      POSUserNameLabel.Visible     := false;
      POSUserNameEdit.Visible      := false;
      POSPhoneNoLabel.Visible      := false;
      POSPhoneNoEdit.Visible       := false;

      POSPrinterLabel.Top          := PosTypeLabel.Top         + 29;
      POSPrinterComboBox.Top       := POSTypeComboBox.Top      + 29;
      ServicePrintLabel.Top        := POSPrinterLabel.Top      + 29;
      ServicePrintComboBox.Top     := POSPrinterComboBox.Top   + 29;
      POSRemarkLabel.Top           := ServicePrintLabel.Top    + 29;
      POSRemarkEdit.Top            := ServicePrintComboBox.Top + 29;
      POSUseLabel.Top              := POSRemarkLabel.Top       + 29;
      POSUseComboBox.Top           := POSRemarkEdit.Top        + 29;

      POSPrinterComboBox.Properties.Items.Clear;
      ServicePrintComboBox.Properties.Items.Clear;
      New(vCode);
      vCode^.Data := '0';
      POSPrinterComboBox.Properties.Items.AddObject('출력안함', TObject(vCode));
      ServicePrintComboBox.Properties.Items.AddObject('출력안함', TObject(vCode));
      New(vCode);
      vCode^.Data := '2';
      POSPrinterComboBox.Properties.Items.AddObject('프린터그룹(주방프린터에 출력가능)', TObject(vCode));
      ServicePrintComboBox.Properties.Items.AddObject('프린터그룹(주방프린터에 출력가능)', TObject(vCode));
      New(vCode);
      vCode^.Data := '3';
      POSPrinterComboBox.Properties.Items.AddObject('SmartAgent 연결된 영수증프린터', TObject(vCode));
      ServicePrintComboBox.Properties.Items.AddObject('SmartAgent 연결된 영수증프린터', TObject(vCode));
      New(vCode);
      vCode^.Data := '1';
      ServicePrintComboBox.Properties.Items.AddObject('주방프린터', TObject(vCode));
      New(vCode);
      vCode^.Data := '4';
      ServicePrintComboBox.Properties.Items.AddObject('영수증프린터+ 주방프린터', TObject(vCode));
      POSPrinterComboBox.ItemIndex   := 0;
      ServicePrintComboBox.ItemIndex := 0;
    end
    else
    begin
      POSPrinterComboBox.Properties.Items.Clear;
      ServicePrintComboBox.Properties.Items.Clear;
      POSPrinterLabel.Visible    := false;
      POSPrinterComboBox.Visible := false;
      ServicePrintLabel.Visible    := false;
      ServicePrintComboBox.Visible := false;
      POSUserNameLabel.Visible   := false;
      POSUserNameEdit.Visible    := false;
      POSPhoneNoLabel.Visible    := false;
      POSPhoneNoEdit.Visible     := false;

      POSRemarkLabel.Visible     := true;
      POSRemarkEdit.Visible      := true;


      POSRemarkLabel.Top   := PosTypeLabel.Top    + 29;
      POSRemarkEdit.Top    := POSTypeComboBox.Top + 29;
      POSUseLabel.Top      := POSRemarkLabel.Top  + 29;
      POSUseComboBox.Top   := POSRemarkEdit.Top   + 29;
    end;

    //DID
    if GetStrPointerData(POSTypeComboBox) = '6' then
    begin
      PosGroupBox.Visible    := true;
      Label22.Visible        := false;
      PosPLUComboBox.Visible := false;
    end
    else
    begin
      Label22.Visible        := true;
      PosPLUComboBox.Visible := true;
    end;
  end
  else if Sender = MemberTypeComboBox then
  begin
    if MemberTypeComboBox.Properties.Items.Count = 0 then Exit;

    vTemp := GetStrPointerData(MemberTypeComboBox);
    MemberDcRateEdit.Enabled := (vTemp <> '') and (vTemp[1] in ['0','2']);
    PointGroupBox.Enabled    := (vTemp <> '') and (vTemp[1] in ['1','2']);
    if not PointGroupBox.Enabled then
    begin
      MemberCashAmountEdit.Value    := 0;
      MemberCardAmountEdit.Value    := 0;
      MemberCashRcpAmountEdit.Value := 0;
      MemberGiftAmountEdit.Value    := 0;
      MemberTrustAmountEdit.Value   := 0;
      MemberPointAmountEdit.Value   := 0;

      MemberCashPointEdit.Value     := 0;
      MemberCardPointEdit.Value     := 0;
      MemberCashRcpPointEdit.Value  := 0;
      MemberGiftPointEdit.Value     := 0;
      MemberTrustPointEdit.Value    := 0;
      MemberPointPointEdit.Value    := 0;
    end
    else
      MemberDcRateEdit.Value := 0;
  end
  else if Sender = InOutComboBox then
  begin
    InOutLinkComboBox.Properties.Items.Clear;
    if InOutComboBox.ItemIndex = 0 then
    begin
      New(vCode);
      vCode^.Data := '0';
      InOutLinkComboBox.Properties.Items.AddObject('없음', TObject(vCode));
      New(vCode);
      vCode^.Data := '1';
      InOutLinkComboBox.Properties.Items.AddObject('영업외 수익', TObject(vCode));
      if not MainPanel.Enabled then
      begin
        New(vCode);
        vCode^.Data := '2';
        InOutLinkComboBox.Properties.Items.AddObject('외상대금입금', TObject(vCode));
      end;
    end
    else
    begin
      New(vCode);
      vCode^.Data := '0';
      InOutLinkComboBox.Properties.Items.AddObject('없음', TObject(vCode));
      New(vCode);
      vCode^.Data := '1';
      InOutLinkComboBox.Properties.Items.AddObject('영업외 비용', TObject(vCode));
      if not MainPanel.Enabled then
      begin
        New(vCode);
        vCode^.Data := '2';
        InOutLinkComboBox.Properties.Items.AddObject('현금매입', TObject(vCode));
        New(vCode);
        vCode^.Data := '3';
        InOutLinkComboBox.Properties.Items.AddObject('외상매입금지급', TObject(vCode));
      end;
    end;
  end
  else if Sender = ServicePrintComboBox then
  begin
    if ServicePrintComboBox.Properties.Items.Count = 0 then Exit;

    if (GetStrPointerData(ServicePrintComboBox) = '1') or (GetStrPointerData(ServicePrintComboBox) = '4') then
      ServiceKitchenCheckListBox.Visible := true
    else
      ServiceKitchenCheckListBox.Visible := false;

    ServiceKitchenCheckListBox.Top := ServicePrintComboBox.Top;

    try
      DM.OpenQuery('select CD_CODE, '
                  +'       NM_CODE1 '
                  +'  from MS_CODE '
                  +' where CD_HEAD  = :P0 '
                  +'   and CD_STORE = :P1 '
                  +'   and CD_KIND  = ''02'' '
                  +'   and DS_STATUS = 0 '
                  +' order by CD_CODE ',
                  [HeadStoreCode,
                   StoreCode]);
      ServiceKitchenCheckListBox.Items.Clear;
      while not DM.Query.Eof do
      begin
        New(vCode);
        vCode^.Data := DM.Query.Fields[0].AsString;
        ServiceKitchenCheckListBox.Items.AddObject(DM.Query.Fields[1].AsString, TObject(vCode));
        DM.Query.Next;
      end;
    finally
      DM.Query.Close;
    end;
  end;

  isChanged := true;
end;
//------------------------------------------------------------------------------
// 입력창 내용을 검증할 때
procedure TSystemCodeForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vChanged: Boolean;
begin
  inherited;

  // 코드
  if (Sender = CodeEdit) and (Length(DisplayValue) <> 3) then
  begin
    vChanged     := isChanged;
    DisplayValue := LPad(DisplayValue, 3, '0');
    if not vChanged then
      isChanged  := false;
  end

  // POS 번호
  else if (Sender = POSNoEdit) and (Trim(POSNoEdit.Text) = EmptyStr) then
  begin
    DisplayValue := LPad(GetOnlyNumber(DisplayValue), 2, '0');
    if POSNoEdit.Text = '00' then
      POSNoEdit.Clear;
  end;
end;
procedure TSystemCodeForm.EditStyleControllerStyleChanged(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 시간대 자동생성 버튼
procedure TSystemCodeForm.TimeZoneAutoButtonClick(Sender: TObject);
var
  vTime   : TTime;
  vCode   : Integer;
  vTimeStr: string;
begin
  inherited;

  try
    // 인터벌을 30분 간격으로 수정
    if (TimeZoneAutoIntervalEdit.Value mod 30) <> 0 then
      TimeZoneAutoIntervalEdit.Value := TimeZoneAutoIntervalEdit.Value div 30 * 30;

    // 기존 자료 지우기
    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =''15'';',
              [HeadStoreCode,
               StoreCode],
               false);

    // 신규로 자료 입력
    vTime := TimeZoneAutoStartTimeEdit.Time;
    vCode := 1;
    while True do
    begin
      vTimeStr := FormatDateTime('hh:nn ~ ', vTime)+FormatDateTime('hh:nn', vTime+((1/(24*60*60))*(60*TimeZoneAutoIntervalEdit.Value)));
      ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, DS_STATUS, CD_SAWON_CHG, DT_CHANGE) '
               +'            values (:P0, :P1, ''15'', :P2, :P3, ''0'', :P4, Now()); ',
                [HeadStoreCode,
                 StoreCode,
                 LPad(IntToStr(vCode), 3, '0'),
                 vTimeStr,
                 UserCode],
                 false);
      vTime := vTime + ((1/(24*60*60))*(60*TimeZoneAutoIntervalEdit.Value));
      Inc(vCode);
      if vCode > (24*60 div TimeZoneAutoIntervalEdit.Value) then
        Break;
    end;

    ExecQuery(TempSQL, [], true);

    // 입력한 자료 새로 조회
    ButtonToolBarSearchButton.Click;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSystemCodeForm.DoSearch: Boolean;
var vStore :String;
begin
  if (GetStoreOption(5) = '1') and ((NoteBook.ActivePage = 'Member') or (NoteBook.ActivePage = 'PointSave') or (NoteBook.ActivePage = 'PointUse')) then
    vStore := StandardStore
  else
    vStore := StoreCode;

  OpenQuery('select CD_CODE, '
           +'       NM_CODE1, '
           +'       DS_STATUS '
           +'  from MS_CODE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and CD_KIND  = :P2 '
           +' order by CD_CODE',
            [HeadStoreCode,
             vStore,
             FormatFloat('00', SelectedIndex)]);
  DM.ReadQuery(Query, GridTableView);
  Result := true;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TSystemCodeForm.DoGridLink;
  procedure SetCheckListBox(var aCheckListBox: TCheckListBox; aText: String);
    function FindItem(var aCheckListBox: TCheckListBox; aText: String): Integer;
    var i: Integer;
    begin
      Result := -1;
      for i := 0 to Pred(aCheckListBox.Items.Count) do
        if PStrPointer(aCheckListBox.Items.Objects[i]).Data = aText then
        begin
          Result := i;
          Break;
        end;
    end;
  var
    vIndex :Integer;
    i, j: Integer;
    vTempCheckList :TStringList;
  begin
    for i := 0 to Pred(aCheckListBox.Items.Count) do
      aCheckListBox.Checked[i] := False;

    vTempCheckList := TStringList.Create;
    Split(aText, ',',vTempCheckList);
    for vIndex := 0 to vTempCheckList.Count-1 do
    begin
      i := FindItem(aCheckListBox, vTempCheckList.Strings[vIndex]);
      if i >= 0 then
        aCheckListBox.Checked[i] := True;
    end;
    vTempCheckList.Free;


//    while aText <> '' do
//    begin
//       i := Pos(',', aText);
//       if i > 0 then begin
//          j := FindItem(aCheckListBox, Copy(AText, 1, Pred(i)));
//          aCheckListBox.Checked[j] := True;
//          Delete(AText, 1, i);
//       end
//       else
//       begin
//          j := FindItem(aCheckListBox, aText);
//          if j > -1 then
//            aCheckListBox.Checked[j] := True;
//
//          aText :='';
//       end;
//    end;
  end;

var
  vStream    : TStream;
  vIndex     : Integer;
  vCode      : PStrPointer;
  vStore     : String;
begin
  inherited;

  CodeEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index];
  CodeEdit.Properties.ReadOnly := not isNew;

  if (GetStoreOption(5) = '1') and ((NoteBook.ActivePage = 'Member') or (NoteBook.ActivePage = 'PointSave') or (NoteBook.ActivePage = 'PointUse')) then
    vStore := StandardStore
  else
    vStore := StoreCode;

  OpenQuery('select   DS_STATUS, '
           +'         NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
           +'         NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, '
           +'         NM_CODE21, NM_CODE22, NM_CODE23, NM_CODE24, NM_CODE25, NM_CODE26, NM_CODE27, NM_CODE28, NM_CODE29, NM_CODE30, '
           +'         NM_CODE31, NM_CODE32, NM_CODE33, NM_CODE34, NM_CODE35, NM_CODE36, NM_CODE37, NM_CODE38, NM_CODE39, NM_CODE40, '
           +'         IMAGEDATA '
           +'from     MS_CODE '
           +'where    CD_HEAD  = :P0 '
           +'  and    CD_STORE = :P1 '
           +'  and    CD_KIND  = :P2 '
           +'  and    CD_CODE  = :P3',
            [HeadStoreCode,
             vStore,
             FormatFloat('00', SelectedIndex),
             CodeEdit.Text]);
  try
    case SelectedIndex of
       1 : // 포스
        begin
          PosUserComboBox.Visible := false;
          POSTypeComboBox.Properties.Items.Clear;
          if Query.Fields[3].AsString = '3' then
          begin
            New(vCode);
            vCode^.Data := '3';
            POSTypeComboBox.Properties.Items.AddObject('셀프대기', TObject(vCode));
          end
          else if Query.Fields[3].AsString = '4' then
          begin
            New(vCode);
            vCode^.Data := '4';
            POSTypeComboBox.Properties.Items.AddObject('주방모니터', TObject(vCode));
          end
          else if Query.Fields[3].AsString = '5' then
          begin
            New(vCode);
            vCode^.Data := '5';
            POSTypeComboBox.Properties.Items.AddObject('스마트패드', TObject(vCode));
          end
          else if Query.Fields[3].AsString = '6' then
          begin
            New(vCode);
            vCode^.Data := '6';
            POSTypeComboBox.Properties.Items.AddObject('DID', TObject(vCode));
          end
          else if Query.Fields[3].AsString = '7' then
          begin
            New(vCode);
            vCode^.Data := '7';
            POSTypeComboBox.Properties.Items.AddObject('렛츠오더', TObject(vCode));
          end
          else
          begin
            New(vCode);
            vCode^.Data := '0';
            POSTypeComboBox.Properties.Items.AddObject('정산포스', TObject(vCode));
            New(vCode);
            vCode^.Data := '1';
            POSTypeComboBox.Properties.Items.AddObject('주문포스', TObject(vCode));
            if GetOption(403)='1' then
            begin
              New(vCode);
              vCode^.Data := '2';
              POSTypeComboBox.Properties.Items.AddObject('키오스크', TObject(vCode));
              PosUserComboBox.Visible := true;
            end;
            if GetStoreOption(9) = '1' then
            begin
              New(vCode);
              vCode^.Data := '7';
              POSTypeComboBox.Properties.Items.AddObject('렛츠오더', TObject(vCode));
            end;
          end;
          PosUseComboBox.ItemIndex               := StoI(Query.Fields[ 0].AsString);
          POSNoEdit.Text                         := Query.Fields[ 1].AsString;
          POSNoEdit.Properties.ReadOnly          := True;
          POSIPEdit.Text                         := Query.Fields[ 2].AsString;
          POSTypeComboBox.ItemIndex              := GetStrPointerIndex(POSTypeComboBox, Query.Fields[3].AsString);
          if StrToIntDef(GetStrPointerData(POSTypeComboBox),0) = 4 then
          begin
            POSTypeComboBox.Enabled := false;
            if Query.FieldByName('nm_code5').AsString = '0' then
              POSStatusEdit.Text := '요청'
            else if Query.FieldByName('nm_code5').AsString = '1' then
              POSStatusEdit.Text := '정상'
            else if Query.FieldByName('nm_code5').AsString = '2' then
              POSStatusEdit.Text := '중지';
            POSStatusEdit.Hint          := Query.FieldByName('nm_code5').AsString;
            POSPhoneNoEdit.Text         := GetPhoneNo(Query.FieldByName('nm_code6').AsString);
            if Length(POSPhoneNoEdit.Text) > 20 then
              POSPhoneNoEdit.Clear;
            POSUserNameEdit.Text        := Query.FieldByName('nm_code8').AsString;
            POSType1ComboBox.Visible    := false;
          end
          else
          begin
            if CodeEdit.Text = '001' then
              VanCode := Query.Fields[ 5].AsString;
            POSTypeComboBox.Enabled := true;
            if (GetOption(379) = '0') and (CodeEdit.Text <> '001') then
            begin
              VanComboBox.Properties.Items.Clear;
              New(vCode);
              vCode^.Data := VanCode;
              case StoI(VanCode) of
                 0 : VanComboBox.Properties.Items.AddObject('KOCES (한국신용카드결제)', TObject(vCode));
                 1 : VanComboBox.Properties.Items.AddObject('DAOU (다우데이터)', TObject(vCode));
                 2 : VanComboBox.Properties.Items.AddObject('NICE (나이스정보통신)', TObject(vCode));
                 4 : VanComboBox.Properties.Items.AddObject('KIS (KIS정보통신)', TObject(vCode));
                 5 : VanComboBox.Properties.Items.AddObject('KSNET (케이에스넷)', TObject(vCode));
                 9 : VanComboBox.Properties.Items.AddObject('KFTC (금융결제원)', TObject(vCode));
                10 : VanComboBox.Properties.Items.AddObject('Smartro (스마트로)', TObject(vCode));
                12 : VanComboBox.Properties.Items.AddObject('SPC(SPC 네트웍스)', TObject(vCode));
                 8 : VanComboBox.Properties.Items.AddObject('JTNET (제이티넷)', TObject(vCode));
                 7 : VanComboBox.Properties.Items.AddObject('FDK (파이서브)', TObject(vCode));
              end;
            end;
            VanComboBox.ItemIndex    := GetStrPointerIndex(VanComboBox,  VanCode);//Query.Fields[ 5].AsString); //001의 밴으로 변경한다
//            EditPropertiesChange(VanComboBox);
            //포스 코드가 001 일때만 밴사를 변경할 수 있게 한다
            VanComboBox.Enabled      := (CodeEdit.Text = '001');
            POSType1ComboBox.Visible := (GetOption(16)='2') and (StrToIntDef(GetStrPointerData(POSTypeComboBox),0) <= 1);
          end;
          POSRemarkEdit.Text                     := Query.Fields[ 4].AsString;
          VanTIDEdit.Text                        := Query.Fields[ 6].AsString;
          PosMacAddres                           := Query.Fields[ 7].AsString;
          VanBizNoEdit.Text                      := Query.Fields[ 9].AsString;
          VanSerialNoEdit.Text                   := Query.Fields[10].AsString;
          VanPasswordEdit.Text                   := Query.Fields[11].AsString;
//          KioskDesignComboBox.ItemIndex          := PosDesignComboBox.Properties.Items.IndexOf(Query.Fields[12].AsString);
          POSType1ComboBox.ItemIndex             := StrToIntDef(Query.Fields[13].AsString, 0);
          if GetStrPointerData(POSTypeComboBox) = '4' then  //KDS
            POSPrinterComboBox.ItemIndex           := GetStrPointerIndex(POSPrinterComboBox, Query.Fields[32].AsString)
          else
          begin
            POSPrinterComboBox.ItemIndex           := GetStrPointerIndex(POSPrinterComboBox, Query.Fields[14].AsString);
            ServicePrintComboBox.ItemIndex         := GetStrPointerIndex(ServicePrintComboBox, Query.Fields[19].AsString); //호출서비스
          end;

          PosDesignComboBox.ItemIndex            := PosDesignComboBox.Properties.Items.IndexOf(Query.Fields[15].AsString);
          PosPluComboBox.ItemIndex               := PosPluComboBox.Properties.Items.IndexOf(Query.Fields[16].AsString);
          PosUserComboBox.ItemIndex              := GetStrPointerIndex(PosUserComboBox, Query.Fields[17].AsString);
          VanEayPayComboBox.ItemIndex            := GetStrPointerIndex(VanEayPayComboBox, Query.Fields[18].AsString);
          SetCheckListBox(ServiceKitchenCheckListBox, Query.Fields[20].AsString);
          RustDeskIDEdit.Text                    :=  Query.Fields[21].AsString;
          Query.Close;
          VanComboBox.EditModified      := false;
          VanTIDEdit.EditModified       := false;
          VanBizNoEdit.EditModified     := false;
          VanSerialNoEdit.EditModified  := false;
          VanPasswordEdit.EditModified  := false;
        end;
       2 : // 주방프린터
       begin
         SetPosNo(KitchenLinkPosComboBox);
         KitchenNameEdit.Text                    := Query.Fields[ 1].AsString;
         KitchenLinkPosComboBox.ItemIndex        := KitchenLinkPosComboBox.Properties.Items.IndexOf(Query.Fields[ 2].AsString);
         KitchenPortComboBox.ItemIndex           := KitchenPortComboBox.Properties.Items.IndexOf(Query.Fields[ 3].AsString);
         KitchenIPAdressEdit.Text                := Query.Fields[11].AsString;
         KitchenDeviceComboBox.ItemIndex         := StrToIntDef(Query.Fields[4].AsString, 0)-1;
         KitchenBaudRateComboBox.ItemIndex       := StrToIntDef(Query.Fields[5].AsString, 0)-1;
         KitchenPrintCountEdit.Value             := StrToIntDef(Query.Fields[6].AsString, 0);
         KitchenPrintTopMaginEdit.Value          := StrToIntDef(Query.Fields[7].AsString, 0);
         KitchenFirstPrintCheckBox.Checked       := Query.Fields[10].AsString = '1';
         KitchenDisplayCheckBox.Checked          := Query.Fields[12].AsString = '1';
         KitchenUseComboBox.ItemIndex            := StoI(Query.Fields[ 0].AsString);
         SetCheckListBox(KitchenCheckListBox,  Query.Fields[8].AsString);
         SetCheckListBox(Kitchen1CheckListBox, Query.Fields[9].AsString);
         KitchenColumComboBox.ItemIndex          := StrToIntDef(Query.Fields[13].AsString, 0);
         KitchenPrintBottomMaginEdit.Value       := StrToIntDef(Query.Fields[14].AsString, 0);
         LetsOrderOnlyCheckBox.Checked           := Query.Fields[15].AsString = 'Y';
       end;
       3 : //층
       begin
         if GetOption(25) = '1' then
         begin
           TableButton.Menu.Name := '짜장면'+#13+
                                    '탕수육';
           TableButton.Menu.Qty  := '3'+#13+
                                    '1';

         end
         else
         begin
           TableButton.Amount.Caption := '1,000원';
           TableButton.Amount.Caption := EmptyStr;
         end;
         TableButton.Refresh;

         FloorNameEdit.Text                      := Query.Fields[ 1].AsString;
         TableTitleFontSizeEdit.Value            := StrToIntDef(Query.Fields[2].AsString, 0);
         TableCaptionFontSizeEdit.Value          := StrToIntDef(Query.Fields[3].AsString, 0);
         TableAmountFontSizeEdit.Value           := StrToIntDef(Query.Fields[4].AsString, 0);
         TableBottomFontSizeEdit.Value           := StrToIntDef(Query.Fields[5].AsString, 0);
         CornerComboBox.ItemIndex := GetStrPointerIndex(CornerComboBox, Query.Fields[6].AsString);
         //7~18는 테이블관리에서 사용
         TableTableNoSpinEdit.Value              := StrToIntDef(Query.Fields[10].AsString, 0);
         if TableTableNoSpinEdit.Value > 50 then
           TableTableNoSpinEdit.Value := 15;
         TableMenuDPCountEdit.Value              := StrToIntDef(Query.Fields[19].AsString, 0);
         if TableMenuDPCountEdit.Value > 20 then
           TableMenuDPCountEdit.Value := 5;
         WaitFloorCheckBox.Checked               := Query.Fields[20].AsString = 'Y';

         TableAmountFontSizeLabel.Visible        := GetOption(25) = '1';
         TableAmountFontSizeEdit.Visible         := GetOption(25) = '1';
         TableButton.Number.ShowNumber           := GetOption(25) <> '1';
         TableButton.Caption := '';

         if CornerComboBox.ItemIndex < 0 then CornerComboBox.ItemIndex := 0;
         FloorUseComboBox.ItemIndex            := StoI(Query.Fields[ 0].AsString);
         FloorColorPanel.Color                 := StringToColorDef(Query.Fields[21].AsString, clWhite);


         EditPropertiesChange(TableTitleFontSizeEdit);
         EditPropertiesChange(TableCaptionFontSizeEdit);
         EditPropertiesChange(TableAmountFontSizeEdit);
       end;
       4 : //객층
       begin
         GuestTypeNameEdit.Text                := Query.Fields[ 1].AsString;
         GuestTypeUseComboBox.ItemIndex        := StoI(Query.Fields[ 0].AsString);
       end;
       5 : //회원구분
       begin
         MemberTypeNameEdit.Text               := Query.Fields[ 1].AsString;
         MemberDcRateEdit.Value                := StrToFloatDef(Query.Fields[2].AsString, 0);
         MemberTypeSaleAmtEdit.Value           := StrToIntDef(Query.Fields[3].AsString, 0);
         MemberSaleCountEdit.Value             := StrToIntDef(Query.Fields[4].AsString, 0);
         MemberCashAmountEdit.Value            := StrToIntDef(Query.Fields[5].AsString, 0);
         MemberCashPointEdit.Value             := StrToIntDef(Query.Fields[6].AsString, 0);
         MemberCardAmountEdit.Value            := StrToIntDef(Query.Fields[7].AsString, 0);
         MemberCardPointEdit.Value             := StrToIntDef(Query.Fields[8].AsString, 0);
         MemberCashRcpAmountEdit.Value         := StrToIntDef(Query.Fields[9].AsString, 0);
         MemberCashRcpPointEdit.Value          := StrToIntDef(Query.Fields[10].AsString, 0);
         MemberGiftAmountEdit.Value            := StrToIntDef(Query.Fields[11].AsString, 0);
         MemberGiftPointEdit.Value             := StrToIntDef(Query.Fields[12].AsString, 0);
         MemberTrustAmountEdit.Value           := StrToIntDef(Query.Fields[13].AsString, 0);
         MemberTrustPointEdit.Value            := StrToIntDef(Query.Fields[14].AsString, 0);
         MemberPointAmountEdit.Value           := StrToIntDef(Query.Fields[15].AsString, 0);
         MemberPointPointEdit.Value            := StrToIntDef(Query.Fields[16].AsString, 0);
         MemberTypeComboBox.ItemIndex          := GetStrPointerIndex(MemberTypeComboBox, Query.Fields[17].AsString);
         MemberClassNotChangeCheckBox.Checked  := Query.Fields[18].AsString = '1';
         MemberTypeUseComboBox.ItemIndex       := StoI(Query.Fields[ 0].AsString);
       end;
       6 : // 카드 매입사
        begin
          CardCompanyNameEdit.Text               := Query.Fields[ 1].AsString;
          CardCompanyJoinNoEdit.Text             := Query.Fields[ 2].AsString;
          CardCompanyFeeEdit.Value               := StrToFloatDef(Query.Fields[ 3].AsString, 0);
          CardCompanyUseComboBox.ItemIndex       := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and CardCompanyNameEdit.Enabled then
            CardCompanyNameEdit.SetFocus;
        end;
       7 : //할인코드
        begin
          DcNameEdit.Text                        := Query.Fields[ 1].AsString;
          DcTypeComboBox.ItemIndex               := StrToIntDef(Query.Fields[2].AsString, 0);
          EditPropertiesChange(DcTypeComboBox);
          DcRateEdit.Value                       := StrToFloatDef(Query.Fields[3].AsString, 0);
          DcStandardAmountEdit.Value             := StrToIntDef(Query.Fields[4].AsString, 0);
          DcAmountEdit.Value                     := StrToIntDef(Query.Fields[5].AsString, 0);
          DcMenuClassComboBox.ItemIndex          := GetStrPointerIndex(DcMenuClassComboBox, Query.Fields[6].AsString);
          DcTypeMenuComboBox.ItemIndex           := StrToIntDef(Query.Fields[7].AsString, 0);
          DcUseComboBox.ItemIndex                := StoI(Query.Fields[ 0].AsString);
        end;
       8 : //주문취소사유
        begin
          OrderCancelNameEdit.Text                := Query.Fields[ 1].AsString;
          OrderCancelUseComboBox.ItemIndex        := StoI(Query.Fields[ 0].AsString);
        end;
       9 : // 매출 취소 사유
        begin
          SaleCancelNameEdit.Text                := Query.Fields[ 1].AsString;
          SaleCancelUseComboBox.ItemIndex        := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and SaleCancelNameEdit.Enabled then
            SaleCancelNameEdit.SetFocus;
        end;
      10 : // 시급코드
        begin
          TimePayNameEdit.Text                  := Query.Fields[ 1].AsString;
          TimePayAmtEdit.Value                  := StoI(Query.Fields[ 2].AsString);
          TimePayUseComboBox.ItemIndex          := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and TimePayNameEdit.Enabled then
            TimePayNameEdit.SetFocus;
        end;
      11 : // 출납
        begin
          InOutNameEdit.Text                     := Query.Fields[ 1].AsString;
          if (CodeEdit.Text = '001') or (CodeEdit.Text = '002') or (CodeEdit.Text = '003') then
            MainPanel.Enabled := false
          else
            MainPanel.Enabled := true;

          InOutComboBox.ItemIndex                := StoI(Query.Fields[ 2].AsString);
          EditPropertiesChange(InOutComboBox);
          InOutLinkComboBox.ItemIndex            := GetStrPointerIndex(InOutLinkComboBox, Query.Fields[ 3].AsString);
          InOutRemarkEdit.Text                   := Query.Fields[ 4].AsString;
          InOutUseComboBox.ItemIndex             := StoI(Query.Fields[ 0].AsString);
          InOutNameEdit.Enabled                  := not (StoI(CodeEdit.Text) in [100, 200]);
          InOutRemarkEdit.Enabled                := InOutNameEdit.Enabled;
          InOutUseComboBox.Enabled               := InOutNameEdit.Enabled;

          if MainPanel.Enabled and InOutNameEdit.Enabled then
            InOutNameEdit.SetFocus;
        end;
       12 : // 포인트 적립
        begin
          PointSaveNameEdit.Text                 := Query.Fields[ 1].AsString;
          PointSaveEdit.Value                    := StoF(Query.Fields[ 2].AsString);
          PointSaveSaleComboBox.ItemIndex        := StoI(Query.Fields[ 3].AsString);
          PointSaveUseComboBox.ItemIndex         := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and PointSaveNameEdit.Enabled then
            PointSaveNameEdit.SetFocus;
        end;
       13 : // 포인트 사용
        begin
          PointUseNameEdit.Text                  := Query.Fields[ 1].AsString;
          PointUseEdit.Value                     := StoF(Query.Fields[ 2].AsString);
          PointUseUseComboBox.ItemIndex          := StoI(Query.Fields[ 0].AsString);
          PointUseSaleComboBox.ItemIndex         := StoI(Query.Fields[ 3].AsString);
          if MainPanel.Enabled and PointUseNameEdit.Enabled then
            PointUseNameEdit.SetFocus;
        end;
       14 : //연령대
        begin
          AgeGroupNameEdit.Text                  := Query.Fields[ 1].AsString;
          AgeGroupUseComboBox.ItemIndex          := StoI(Query.Fields[ 0].AsString);
        end;
       15 : // 시간대
        begin
          TimeZoneEdit.Text                      := Query.Fields[ 1].AsString;
          TimeZoneUseComboBox.ItemIndex          := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and TimeZoneEdit.Enabled then
            TimeZoneEdit.SetFocus;
        end;
       16 : //주방메모
        begin
          KitchenMemoNameEdit.Text               := Query.Fields[ 1].AsString;
          KitchenMemoUseComboBox.ItemIndex       := StoI(Query.Fields[ 0].AsString);
        end;
       17 : // 사원 권한
        begin
          UserGradeNameEdit.Text                 := Query.Fields[ 1].AsString;
          UserGradeUseComboBox.ItemIndex         := StoI(Query.Fields[ 0].AsString);
          UserGradeNameEdit.Enabled              := CodeEdit.Text <> userGradeMaster;
          UserGradeUseComboBox.Enabled           := UserGradeNameEdit.Enabled;
          if MainPanel.Enabled and UserGradeNameEdit.Enabled then
            UserGradeNameEdit.SetFocus;
        end;
       18 : // SMS 메시지함
        begin
          SMSNameEdit.Text                       := Query.Fields[ 1].AsString;
          SMSMemo.Text                           := Query.Fields[ 2].AsString;
          SmsTypeComboBox.ItemIndex              := StoI(Query.Fields[ 3].AsString);
          SMSUseComboBox.ItemIndex               := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and SMSNameEdit.Enabled then
            SMSNameEdit.SetFocus;
        end;
       19 : // 은행코드
        begin
          BankEdit.Text                         := Query.Fields[ 1].AsString;
          BankNumberEdit.Text                   := Query.Fields[ 2].AsString;
          BankMasterEdit.Text                   := Query.Fields[ 3].AsString;
          BankUseComboBox.ItemIndex             := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and BankEdit.Enabled then
            BankEdit.SetFocus;
        end;
       20 : //배달코스
        begin
          DeliveryCourseNameEdit.Text            := Query.Fields[ 1].AsString;
          DeliveryCourseUseComboBox.ItemIndex    := StoI(Query.Fields[ 0].AsString);
        end;
       21 : //배달아이템
        begin
          DeliveryItemNameEdit.Text              := Query.Fields[ 1].AsString;
          DeliveryItemUseComboBox.ItemIndex      := StoI(Query.Fields[ 0].AsString);
        end;
       22 : //배달지역
        begin
          DeliveryLocalNameEdit.Text             := Query.Fields[ 1].AsString;
          DeliveryLocalUseComboBox.ItemIndex     := StoI(Query.Fields[ 0].AsString);
        end;
       23 : //서비스사유
        begin
          ServiceWhyEdit.Text                   := Query.Fields[ 1].AsString;
          ServiceUseComboBox.ItemIndex          := StoI(Query.Fields[ 0].AsString);
        end;
       24 : //테이블메모
        begin
          TableMemoEdit.Text                    := Query.Fields[ 1].AsString;
          TableMemoUseComboBox.ItemIndex        := StoI(Query.Fields[ 0].AsString);
        end;
       25 : //프린터그룹
        begin
          SetKitchen(PrinterGroupKitchenComboBox);
          PrinterGroupNameEdit.Text             := Query.Fields[ 1].AsString;
          PrinterGroupKitchenComboBox.ItemIndex := GetStrPointerIndex(PrinterGroupKitchenComboBox, Query.Fields[ 2].AsString);
          PrinterGroupUseComboBox.ItemIndex     := StoI(Query.Fields[ 0].AsString);
        end;
       26 : //서비스호출
        begin
          ServiceCallEdit.Text                  := Query.Fields[ 1].AsString;
          ServiceCallWavFileNameEdit.Text       := Query.Fields[ 2].AsString;
          ServiceCallUseComboBox.ItemIndex      := StoI(Query.Fields[ 0].AsString);
        end;
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 신규
function TSystemCodeForm.DoNew: Boolean;
var
  vKind  :string;
  vIndex :Integer;
  vCode      : PStrPointer;
begin
  // 코드 자동증가 (포스관리일때)
  if CheckOption(2) or (SelectedIndex = 1) then
  begin
    vKind := FormatFloat('00', SelectedIndex);
    OpenQuery('select Ifnull(Max(CD_CODE),''000'') as CODE '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2 ',
              [HeadStoreCode,
               StoreCode,
               vKind]);
    try
      CodeEdit.Text := LPad(IntToStr(StoI(Query.Fields[0].AsString)+1), 3, '0');
    finally
      FinishQuery;
    end;

    if (vKind = '11') and ((CodeEdit.Text = '100') or (CodeEdit.Text = '200')) then
      CodeEdit.Text := LPad(IntToStr(StoI(CodeEdit.Text)+1), 3, '0');
  end;

  MainPanel.Enabled := True;

  case SelectedIndex of
    1 :
    begin
      //관리프로그램에서는 스마트포스는 추가하지 못하게 한다(데몬에 직접만가능)
      POSTypeComboBox.Properties.Items.Clear;
      New(vCode);
      vCode^.Data := '0';
      POSTypeComboBox.Properties.Items.AddObject('정산포스', TObject(vCode));
      New(vCode);
      vCode^.Data := '1';
      POSTypeComboBox.Properties.Items.AddObject('주문포스', TObject(vCode));
      if GetOption(403)='1' then
      begin
        New(vCode);
        vCode^.Data := '2';
        POSTypeComboBox.Properties.Items.AddObject('키오스크', TObject(vCode));
      end;
      if GetStoreOption(9) = '1' then
      begin
        New(vCode);
        vCode^.Data := '7';
        POSTypeComboBox.Properties.Items.AddObject('렛츠오더', TObject(vCode));
      end;
      New(vCode);
      vCode^.Data := '6';
      POSTypeComboBox.Properties.Items.AddObject('DID', TObject(vCode));

      POSTypeComboBox.ItemIndex := 0;
      POSTypeComboBox.Enabled   := true;
      VanComboBox.ItemIndex := GetStrPointerIndex(VanComboBox, VanCode);
    end;
    2 :
    begin
      SetPosNo(KitchenLinkPosComboBox);

      for vIndex := 0 to Pred(KitchenCheckListBox.Items.Count) do
        KitchenCheckListBox.Checked[vIndex] := false;
      for vIndex := 0 to Pred(Kitchen1CheckListBox.Items.Count) do
        Kitchen1CheckListBox.Checked[vIndex] := false;

      KitchenLinkPosComboBox.ItemIndex  := 0;
      KitchenPrintCountEdit.Value       := 1;
      KitchenPrintTopMaginEdit.Value    := 0;
      KitchenPrintBottomMaginEdit.Value := 3;
    end;
    3 :
    begin
      TableTitleFontSizeEdit.Value   := 9;
      TableCaptionFontSizeEdit.Value := 11;
      TableAmountFontSizeEdit.Value  := 13;
      TableBottomFontSizeEdit.Value  := 9;
      TableMenuDPCountEdit.Value     := 5;
      FloorColorPanel.Color          := clWhite;
    end;
    7 : EditPropertiesChange(DcTypeComboBox);
    11 :
    begin
      InOutComboBox.Properties.ReadOnly     := false;
      InOutLinkComboBox.Properties.ReadOnly := false;
    end;
    25 : SetKitchen(PrinterGroupKitchenComboBox);
  end;

  // 코드 수동 입력
  if not CheckOption(2) and (SelectedIndex <> 1) then
    CodeEdit.SetFocus;

  CodeEdit.Properties.ReadOnly  := false;
  POSNoEdit.Properties.ReadOnly := false;
  UserGradeNameEdit.Enabled     := CodeEdit.Text <> userGradeMaster;
  InOutNameEdit.Enabled         := not (StoI(CodeEdit.Text) in [100, 200]);
  InOutComboBox.Enabled         := InOutNameEdit.Enabled;
  InOutLinkComboBox.Enabled     := InOutNameEdit.Enabled;
  InOutRemarkEdit.Enabled       := InOutNameEdit.Enabled;
  InOutUseComboBox.Enabled      := InOutNameEdit.Enabled;

  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function TSystemCodeForm.DoDelete: Boolean;
const
  msgDontDelete = '프로그램에서 사용하는 코드이므로 삭제할 수 없습니다.';
  msgUseCode    = '사용내역이 있어 삭제할 수 없습니다';
begin
  Result := false;

  if not AskBox('공통 코드는 다른 프로그램에서 사용했을 가능성이 높으므로 삭제하지 말고, ''사용여부''를 [사용 안 함]으로 선택하는 것이 좋습니다.'#13#13+'그래도 삭제하시겠습니까?') then
    Exit;

  case SelectedIndex of
     1 : // POS
      begin
        try
          DM.OpenQuery('select exists(select * '
                      +'                from SL_SALE_H '
                      +'               where CD_HEAD  =:P0 '
                      +'                 and CD_STORE =:P1 '
                      +'                 and NO_POS   =:P2) ',
                      [HeadStoreCode,
                       StoreCode,
                       POSNoEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
     2 :
      begin
        try
          DM.OpenQuery('select exists(select * '
                      +'                from MS_MENU '
                      +'               where CD_HEAD  =:P0 '
                      +'                 and CD_STORE =:P1 '
                      +'                 and CD_PRINTER like ConCat(''%'',:P2,''%'')) ',
                      [HeadStoreCode,
                       StoreCode,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
     3 : //층
      begin
        if GridTableView.DataController.RecordCount = 1 then
        begin
          ErrBox('최소 한개의 층은 있어야합니다');
          Exit;
        end;

        try
          DM.OpenQuery('select exists(select count(*) '
                      +'                from MS_TABLE '
                      +'               where CD_HEAD  =:P0 '
                      +'                 and CD_STORE =:P1 '
                      +'                 and CD_FLOOR =:P2) ',
                      [HeadStoreCode,
                       StoreCode,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox('삭제하려는 층에 테이블이 존재합니다');
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
     5 : //회원구분
      begin
        try
          DM.OpenQuery('select exists(select *'
                      +'                from MS_MEMBER '
                      +'               where CD_HEAD   =:P0 '
                      +'                 and CD_STORE  =:P1 '
                      +'                 and DS_MEMBER =:P2) ',
                      [HeadStoreCode,
                       StoreCode,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
    11 : // 출납
      begin
        if StoI(CodeEdit.Text) in [100, 200] then
        begin
          ErrBox(msgDontDelete);
          Exit;
        end;

        try
          DM.OpenQuery('select exists(select * '
                      +'                from SL_ACCT '
                      +'               where CD_HEAD  =:P0 '
                      +'                 and CD_STORE =:P1 '
                      +'                 and CD_ACCT  =:P2) ',
                      [HeadStoreCode,
                       StoreCode,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
    12,13 : // 포인트 적립/사용
      begin
        try
          DM.OpenQuery('select exists(select * '
                      +'                from SL_POINT '
                      +'               where CD_HEAD  =:P0 '
                      +'                 and CD_STORE =:P1 '
                      +'                 and CD_CODE  =:P2) ',
                      [HeadStoreCode,
                       StoreCode,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
    20 : // 사원 권한
      if CodeEdit.Text = userGradeMaster then
      begin
        ErrBox(msgDontDelete);
        Exit;
      end;
  end;

  Result := ExecQuery('delete from MS_CODE '
                     +' where CD_HEAD  =:P0 '
                     +'   and CD_STORE =:P1 '
                     +'   and CD_KIND  =:P2 '
                     +'   and CD_CODE  =:P3;',
                      [HeadStoreCode,
                       StoreCode,
                       LPad(IntToStr(SelectedIndex), 2, '0'),
                       GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index]]);
end;
//------------------------------------------------------------------------------
// 저장
function TSystemCodeForm.DoSave: Boolean;
const
  SQL            = 'select   CD_CODE '
                  +' from    MS_CODE '
                  +'where    CD_HEAD   = :P0 '
                  +'  and    CD_STORE  = :P1 '
                  +'  and    CD_KIND   = :P2 '
                  +'  and    DS_STATUS = ''0'' ';
  SQL_CODE       = '  and    CD_CODE   = :P3 ';
  SQL_NAME1      = '  and    NM_CODE1  = :P3 ';
  SQL_NAME2      = '  and    NM_CODE2  = :P5 ';
  msgDontSave    = '프로그램에서 사용되는 코드이므로 입력할 수 없습니다.';
  msgDontLocalIP = 'POS가 2대 이상일 때는 127.0.0.1 IP를 사용할 수 없습니다.';
var
  vKind: string;
  vList: TStringList;
  vProxyCheck:Boolean;
  vTemp, vTemp1:String;
  vIndex:Integer;
  vKitchen,
  vCode6, vCode14 : String;
  vTID1, vTID2 :String;
  vSQL, vP8, vP9, vP10, vP11 :String;
begin
  Result      := false;
  vProxyCheck := false;
  vKind  := LPad(IntToStr(SelectedIndex), 2, '0');

  // 필수 입력 자료 확인
  if Trim(CodeEdit.Text) = EmptyStr then
  begin
    ErrBox(Replace(CodeEdit.Text, '　', '')+msgMustInput);
    if MainPanel.Enabled and CodeEdit.Enabled then
      CodeEdit.SetFocus;
    Exit;
  end
  // 자료 중복 검사
  else if isNew and
          OpenQuery(SQL+SQL_CODE,
                   [HeadStoreCode,
                    StoreCode, vKind, CodeEdit.Text],
                    true) then
  begin
    ErrBox('이미 사용 중인 코드입니다.');
    if MainPanel.Enabled and CodeEdit.Enabled then
      CodeEdit.SetFocus;
    Exit;
  end;

  case SelectedIndex of
     1 : // 포스
      begin
        // POS 번호 체크
        if (Trim(POSNoEdit.Text) = EmptyStr) or (StoI(POSNoEdit.Text) < 1) or (StoI(POSNoEdit.Text) > 99) then
        begin
          ErrBox(POSNoLabel.Caption+msgMustInput);
          if MainPanel.Enabled and POSNoEdit.Enabled then
            POSNoEdit.SetFocus;
          Exit;
        end;

        // IP 주소 유효성 체크
        if POSIPEdit.Text <> EmptyStr then
        begin
          vList := TStringList.Create;
          try
            Split(POSIPEdit.Text, '.', vList);
            if (vList.Count <> 4) or
               (not (StoI(vList[0]) in [1..255])) or (not (StoI(vList[1]) in [0..255])) or (not (StoI(vList[2]) in [0..255])) or (not (StoI(vList[3]) in [0..255])) then
            begin
              ErrBox(POSIPLabel.Caption+msgMustInput);
              if MainPanel.Enabled and POSIPEdit.Enabled then
                POSIPEdit.SetFocus;
              Exit;
            end;
          finally
            vList.Free;
          end;
        end;

        // POS 인증 수량 검사
        if (isNew or POSUseComboBox.EditModified) and (POSUseComboBox.ItemIndex = 0)
          and ((GetStrPointerData(POSTypeComboBox) = '0')
            or (GetStrPointerData(POSTypeComboBox) = '1')
            or (GetStrPointerData(POSTypeComboBox) = '3')
            or (GetStrPointerData(POSTypeComboBox) = '4')
            or (GetStrPointerData(POSTypeComboBox) = '5')
            or (GetStrPointerData(POSTypeComboBox) = '6')) then
        begin
          OpenQuery('select   Count(*) as CNT '
                   +'from     MS_CODE '
                   +'where    CD_HEAD   = :P0 '
                   +'  and    CD_STORE  = :P1 '
                   +'  and    CD_KIND   = :P2 '
                   +'  and    DS_STATUS = ''0'' '
                   +'  and    NM_CODE3 in (''0'',''1'',''3'',''4'',''5'',''6'') ',
                    [HeadStoreCode,
                     StoreCode,
                     vKind]);
          try
            if (not Query.Eof) and (Query.Fields[0].AsInteger >= AllowPos) then
            begin
              ErrBox('인증된 POS 대수를 초과 했습니다.');
              FinishQuery;
              Exit;
            end;
          finally
            FinishQuery;
          end;
        end;

        // 키오스크 인증 수량 검사
        if (isNew or POSUseComboBox.EditModified) and (POSUseComboBox.ItemIndex = 0) and (GetStrPointerData(POSTypeComboBox) = '2') then
        begin
          OpenQuery('select   Count(*) as CNT '
                   +'from     MS_CODE '
                   +'where    CD_HEAD   = :P0 '
                   +'  and    CD_STORE  = :P1 '
                   +'  and    CD_KIND   = :P2 '
                   +'  and    DS_STATUS = ''0'' '
                   +'  and    NM_CODE3  = ''2'' ',
                    [HeadStoreCode,
                     StoreCode,
                     vKind]);
          try
            if (not Query.Eof) and (Query.Fields[0].AsInteger >= AllowKiosk) then
            begin
              ErrBox('인증된 키오스크 대수를 초과 했습니다.');
              FinishQuery;
              Exit;
            end;
          finally
            FinishQuery;
          end;
        end;

        // 신규 입력일 때 각종 중복 체크
        if isNew then
        begin
          if OpenQuery('select  CD_CODE '
                      +'  from  MS_CODE '
                      +' where  CD_HEAD   = :P0 '
                      +'   and  CD_STORE  = :P1 '
                      +'   and  CD_KIND   = :P2 '
                      +'   and  NM_CODE1  = :P3 ',
                      [HeadStoreCode,
                       StoreCode, vKind, POSNoEdit.Text],
                       true) then
          begin
            ErrBox('이미 등록된 '+POSNoLabel.Caption+'입니다.');
            if MainPanel.Enabled and POSNoEdit.Enabled then
              POSNoEdit.SetFocus;
            Exit;
          end
          else if GetStrPointerData(POSTypeComboBox) <> '7' then
          begin
            if OpenQuery('select  CD_CODE '
                             +'  from  MS_CODE '
                             +' where  CD_HEAD   = :P0 '
                             +'   and  CD_STORE  = :P1 '
                             +'   and  CD_KIND   = :P2 '
                             +'   and  NM_CODE2  = :P3 '
                             +'   and  NM_CODE3 <> ''7'' ',
                             [HeadStoreCode, StoreCode, vKind, POSIPEdit.Text],
                              true) then
            begin
              ErrBox('해당 '+POSIPLabel.Caption+'로 이미 등록된 POS가 있습니다.');
              if MainPanel.Enabled and POSIPEdit.Enabled then
                POSIPEdit.SetFocus;
              Exit;
            end;
          end;
        end
        else if GetStrPointerData(POSTypeComboBox) <> '7' then
        begin
          if OpenQuery('select  CD_CODE '
                      +'  from  MS_CODE '
                      +' where  CD_HEAD   = :P0 '
                      +'   and  CD_STORE  = :P1 '
                      +'   and  CD_KIND   = :P2 '
                      +'   and  CD_CODE  <> :P3 '
                      +'   and  NM_CODE2  = :P4 '
                      +'   and  NM_CODE3 <> ''7'' ',
                      [HeadStoreCode, StoreCode, vKind, CodeEdit.Text, POSIPEdit.Text],true) then
          begin
            ErrBox('해당 '+POSIPLabel.Caption+'로 이미 등록된 POS가 있습니다.');
            if MainPanel.Enabled and POSIPEdit.Enabled then
              POSIPEdit.SetFocus;
            Exit;
          end;
        end;

        if (GetStrPointerData(POSTypeComboBox) = '7') and (GetStrPointerData(PosUserComboBox)='') then
        begin
          ErrBox('렛츠오더일때는 사용자를 반드시 지정해야합니다');
          if MainPanel.Enabled and PosUserComboBox.Enabled then
            PosUserComboBox.SetFocus;
          Exit;
        end;
        //IC 보안이면서 스마트로이면 TID를 포스별로 다르게 사용해야됨
        if (GetStrPointerData(VanComboBox)='10') and (Trim(VanTIDEdit.Text) <> '')  then
        begin
          try
            OpenQuery('select Count(*) '
                     +'  from MS_CODE '
                     +' where CD_HEAD = :P0 '
                     +'   and CD_STORE =:P1 '
                     +'   and CD_KIND  =:P1 '
                     +'   and NM_CODE5 =:P2 '
                     +'   and NM_CODE6 =:P3 '
                     +Ifthen(isNew, '', 'and CD_CODE <> :P4 '),
                     [HeadStoreCode,
                      StoreCode,
                      vKind,
                      GetStrPointerData(VanComboBox),
                      VanTIDEdit.Text,
                      CodeEdit.Text]);
            if Query.Fields[0].AsInteger > 0 then
            begin
              ErrBox('동일한 TID를 사용하는 포스가 있습니다');
              Exit;
            end;
          finally
            FinishQuery;
          end;
        end;


        // 밴 정보를 수정했을 경우 설치한 협력사가 맞는지 확인한다
        if (LeftStr(StoreCode,2) <> 'TT') and (not vProxyCheck) and not Common.isDebugMode and
           ((VanComboBox.EditModified) or (VanTIDEdit.EditModified) or (VanSerialNoEdit.EditModified) or (VanPasswordEdit.EditModified)) then
          with TProxyCheckForm.Create(self) do
            try
              if ShowModal <> mrOK then
                Exit;
            finally
              Free;
            end;
      end;
      2  :
      begin
        if (KitchenUseComboBox.ItemIndex = 0) and (KitchenPortComboBox.Text = 'Ethernet(LAN)') then
        begin
          vList := TStringList.Create;
          try
            Split(KitchenIPAdressEdit.Text, '.', vList);
            if (vList.Count <> 4) or
               (not (StoI(vList[0]) in [1..255])) or (not (StoI(vList[1]) in [0..255])) or (not (StoI(vList[2]) in [0..255])) or (not (StoI(vList[3]) in [0..255])) then
            begin
              ErrBox(KitchenIPAdressLabel.Caption+msgMustInput);
              if MainPanel.Enabled and KitchenIPAdressEdit.Enabled then
                KitchenIPAdressEdit.SetFocus;
              Exit;
            end;
          finally
            vList.Free;
          end;
        end;

        if Trim(KitchenNameEdit.Text) = '' then
        begin
           MsgBox('프린터명을 입력하세요');
           KitchenNameEdit.SetFocus;
           Exit;
        end;
        if KitchenLinkPosComboBox.Text = '' then
        begin
           MsgBox('연결된 포스 없습니다');
           KitchenLinkPosComboBox.SetFocus;
           Exit;
        end;
      end;
     3   : //층
      begin
        if Trim(FloorNameEdit.Text) = '' then
        begin
           MsgBox('층명을 입력하세요');
           FloorNameEdit.SetFocus;
           Exit;
        end;

        if not isNew and (CodeEdit.Text = '001') and (FloorUseComboBox.ItemIndex=1) then
        begin
           MsgBox('기본층은 반드시 사용해야합니다');
           FloorUseComboBox.SetFocus;
           Exit;
        end;
      end;
     4 : // 객층
      if Trim(GuestTypeNameEdit.Text) = EmptyStr then
      begin
        ErrBox(GuestTypeNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and GuestTypeNameEdit.Enabled then
          GuestTypeNameEdit.SetFocus;
        Exit;
      end
      else if isNew and
              OpenQuery(SQL+SQL_NAME1,
                       [HeadStoreCode, StoreCode, vKind, GuestTypeNameEdit.Text],
                        true) then
      begin
        ErrBox('이미 등록된 객층입니다.');
        if MainPanel.Enabled and GuestTypeNameEdit.Enabled then
          GuestTypeNameEdit.SetFocus;
        Exit;
      end;
     5 : // 회원 구분
      if Trim(MemberTypeNameEdit.Text) = '' then
      begin
        ErrBox(MemberTypeNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and MemberTypeNameEdit.Enabled then
          MemberTypeNameEdit.SetFocus;
        Exit;
      end;
     6 : // 카드 매입사
      if Trim(CardCompanyNameEdit.Text) = EmptyStr then
      begin
        ErrBox(CardCompanyNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and CardCompanyNameEdit.Enabled then
          CardCompanyNameEdit.SetFocus;
        Exit;
      end
      else if Trim(CardCompanyJoinNoEdit.Text) = EmptyStr then
      begin
        ErrBox(CardCompanyJoinNoLabel.Caption+msgMustInput);
        if MainPanel.Enabled and CardCompanyJoinNoEdit.Enabled then
          CardCompanyJoinNoEdit.SetFocus;
        Exit;
      end;
     7 : // 할인 구분
     begin
       if Trim(DcNameEdit.Text) = '' then
       begin
         ErrBox(DcNameLabel.Caption+msgMustInput);
         if MainPanel.Enabled and DcNameEdit.Enabled then
           DcNameEdit.SetFocus;
         Exit;
       end;

       if (DcTypeMenuComboBox.ItemIndex > 0) and (DcTypeComboBox.ItemIndex = 2) then
       begin
         ErrBox('선택메뉴 할인일때는 분류할인을 사용할 수 없습니다');
         if MainPanel.Enabled and DcTypeMenuComboBox.Enabled then
           DcTypeMenuComboBox.SetFocus;
         Exit;
       end;
     end;
     8 : // 주문취소사유
      if Trim(OrderCancelNameEdit.Text) = '' then
      begin
        ErrBox(OrderCancelNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and OrderCancelNameEdit.Enabled then
          OrderCancelNameEdit.SetFocus;
        Exit;
      end;
     9 : // 매출 취소 사유
      if Trim(SaleCancelNameEdit.Text) = EmptyStr then
      begin
        ErrBox(SaleCancelNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and SaleCancelNameEdit.Enabled then
          SaleCancelNameEdit.SetFocus;
        Exit;
      end;
    10 : // 시급코드
      begin
        if Trim(TimePayNameEdit.Text) = EmptyStr then
        begin
          ErrBox(Replace(TimePayNameLabel.Caption)+msgMustInput);
          if MainPanel.Enabled and TimePayNameEdit.Enabled then
            TimePayNameEdit.SetFocus;
          Exit;
        end;
      end;
    11 : // 출납
      if StoI(CodeEdit.Text) in [100, 200] then
      begin
        ErrBox(msgDontSave);
        Exit;
      end
      else if Trim(InOutNameEdit.Text) = EmptyStr then
      begin
        ErrBox(Replace(InOutNameLabel.Caption)+msgMustInput);
        if MainPanel.Enabled and InOutNameEdit.Enabled then
          InOutNameEdit.SetFocus;
        Exit;
      end;
    12 : // 포인트 적립
      if Trim(PointSaveNameEdit.Text) = EmptyStr then
      begin
        ErrBox(PointSaveNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and PointSaveNameEdit.Enabled then
          PointSaveNameEdit.SetFocus;
        Exit;
      end;
    13 : // 포인트 사용
      if Trim(PointUseNameEdit.Text) = EmptyStr then
      begin
        ErrBox(PointUseNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and PointUseNameEdit.Enabled then
          PointUseNameEdit.SetFocus;
        Exit;
      end;
    14 : // 연령대
      if Trim(AgeGroupNameEdit.Text) = EmptyStr then
      begin
        ErrBox(AgeGroupNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and AgeGroupNameEdit.Enabled then
          AgeGroupNameEdit.SetFocus;
        Exit;
      end;
    15 : // 시간대
      if Trim(TimeZoneEdit.Text) = EmptyStr then
      begin
        ErrBox(TimeZoneLabel.Caption+msgMustInput);
        if MainPanel.Enabled and TimeZoneEdit.Enabled then
          TimeZoneEdit.SetFocus;
        Exit;
      end;
    16 : // 주방메모
      if Trim(KitchenMemoNameEdit.Text) = EmptyStr then
      begin
        ErrBox(KitchenMemoNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and KitchenMemoNameEdit.Enabled then
          KitchenMemoNameEdit.SetFocus;
        Exit;
      end;
    17 : // 사원 권한
      if not isNew and (CodeEdit.Text = userGradeMaster) then
      begin
        ErrBox(msgDontSave);
        Exit;
      end
      else if Trim(UserGradeNameEdit.Text) = EmptyStr then
      begin
        if CodeEdit.Text = userGradeMaster then
          UserGradeNameEdit.Text := '관리자'
        else
        begin
          ErrBox(UserGradeNameLabel.Caption+msgMustInput);
          if MainPanel.Enabled and UserGradeNameEdit.Enabled then
            UserGradeNameEdit.SetFocus;
          Exit;
        end;
      end;
    18 : // SMS 메시지함
      if Trim(SMSNameEdit.Text) = EmptyStr then
      begin
        ErrBox(Replace(SMSNameLabel.Caption, '　', '')+msgMustInput);
        if MainPanel.Enabled and SMSNameEdit.Enabled then
          SMSNameEdit.SetFocus;
        Exit;
      end
      else if Trim(SMSMemo.Text) = EmptyStr then
      begin
        ErrBox(SMSLabel.Caption+msgMustInput);
        if MainPanel.Enabled and SMSMemo.Enabled then
          SMSMemo.SetFocus;
        Exit;
      end;
    19 : // 은행코드
      if Trim(BankEdit.Text) = EmptyStr then
      begin
        ErrBox(Replace(BankLabel.Caption)+msgMustInput);
        if MainPanel.Enabled and BankEdit.Enabled then
          BankEdit.SetFocus;
        Exit;
      end;
    20 : // 배달코스
      if Trim(DeliveryCourseNameEdit.Text) = EmptyStr then
      begin
        ErrBox(DeliveryCourseNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and DeliveryCourseNameEdit.Enabled then
          DeliveryCourseNameEdit.SetFocus;
        Exit;
      end;
    21 : // 배달아이템
      if Trim(DeliveryItemNameEdit.Text) = EmptyStr then
      begin
        ErrBox(DeliveryItemNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and DeliveryItemNameEdit.Enabled then
          DeliveryItemNameEdit.SetFocus;
        Exit;
      end;
    22 : // 배달지역
      if Trim(DeliveryLocalNameEdit.Text) = EmptyStr then
      begin
        ErrBox(DeliveryLocalNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and DeliveryLocalNameEdit.Enabled then
          DeliveryLocalNameEdit.SetFocus;
        Exit;
      end;
    23 : // 서비스사유
      if Trim(ServiceWhyEdit.Text) = EmptyStr then
      begin
        ErrBox(ServiceWhyLabel.Caption+msgMustInput);
        if MainPanel.Enabled and ServiceWhyEdit.Enabled then
          ServiceWhyEdit.SetFocus;
        Exit;
      end;
    24 : // 테이블메모
      if Trim(TableMemoEdit.Text) = EmptyStr then
      begin
        ErrBox(TableMemoLabel.Caption+msgMustInput);
        if MainPanel.Enabled and TableMemoEdit.Enabled then
          TableMemoEdit.SetFocus;
        Exit;
      end;
    25 : // 프린터그룹
      begin
        if Trim(PrinterGroupNameEdit.Text) = EmptyStr then
        begin
          ErrBox(PrinterGroupNameLabel.Caption+msgMustInput);
          if MainPanel.Enabled and PrinterGroupNameEdit.Enabled then
            PrinterGroupNameEdit.SetFocus;
          Exit;
        end;

        if GetStrPointerData(PrinterGroupKitchenComboBox) = EmptyStr then
        begin
          ErrBox(PrinterGroupKitchenLabel.Caption+msgMustInput);
          if MainPanel.Enabled and PrinterGroupKitchenComboBox.Enabled then
            PrinterGroupKitchenComboBox.SetFocus;
          Exit;
        end;
      end;
    26 : // 서비스호출
      if Trim(ServiceCallEdit.Text) = EmptyStr then
      begin
        ErrBox(ServiceCallLabel.Caption+msgMustInput);
        if MainPanel.Enabled and ServiceCallEdit.Enabled then
          ServiceCallEdit.SetFocus;
        Exit;
      end;
  end;


  // 저장
  try
    case SelectedIndex  of
       1 : // 포스
        begin
          if StrToInt(GetStrPointerData(POSTypeComboBox)) = 4 then
          begin
            vP8   := Ifthen(POSStatusEdit.Hint=EmptyStr,'1',POSStatusEdit.Hint);
            vP9   := POSPhoneNoEdit.Text;
            vP10  := PosMacAddres;
            vP11  := POSUserNameEdit.Text;
          end
          else
          begin
            vP8  := GetStrPointerData(VanComboBox);
            vP9  := VanTIDEdit.Text;
            vP10 := '';
            vP11 := '';
          end;
          if CodeEdit.Text = '001' then
            VanCode := GetStrPointerData(VanComboBox);

          vKitchen := '';
          for vIndex := 0 to ServiceKitchenCheckListBox.Items.Count-1 do
          begin
            if ServiceKitchenCheckListBox.Checked[vIndex] then
              vKitchen := vKitchen + format('%s,',[PStrPointer(ServiceKitchenCheckListBox.Items.Objects[vIndex]).Data]);
          end;
          vKitchen := LeftStr(vKitchen, Length(vKitchen)-1);;

          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, NM_CODE9, NM_CODE10, '
                   +'                    NM_CODE11, NM_CODE12, NM_CODE13, '+Ifthen(GetStrPointerData(POSTypeComboBox) <> '4','NM_CODE14,','NM_CODE32,')+' NM_CODE15,NM_CODE16,NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, NM_CODE21, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9,:P10,:P11,:P12,:P13,:P14,:P15,:P16,:P17,:P18,:P19,:P20,:P21,:P22, :P23, :P24, :P25,:P26)'
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        NM_CODE5     =:P8, '
                   +'                        NM_CODE6     =:P9, '
                   +'                        NM_CODE7     =:P10, '
                   +'                        NM_CODE8     =:P11, '
                   +'                        NM_CODE9     =:P12, '
                   +'                        NM_CODE10    =:P13, '
                   +'                        NM_CODE11    =:P14, '
                   +'                        NM_CODE12    =:P15, '
                   +'                        NM_CODE13    =:P16, '
                   +Ifthen(GetStrPointerData(POSTypeComboBox) <> '4','NM_CODE14','NM_CODE32')+'   =:P17, '
                   +'                        NM_CODE15    =:P18, '
                   +'                        NM_CODE16    =:P19, '
                   +'                        NM_CODE17    =:P20, '
                   +'                        NM_CODE18    =:P21, '
                   +'                        NM_CODE19    =:P22, '
                   +'                        NM_CODE20    =:P23, '
                   +'                        NM_CODE21    =:P24, '
                   +'                        CD_SAWON_CHG =:P25, '
                   +'                        DS_STATUS    =:P26;',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    POSNoEdit.Text,                                                     //p4                                    //1
                    POSIPEdit.Text,                                                     //p5                                    //2
                    GetStrPointerData(POSTypeComboBox),                                 //p6                                    //3
                    POSRemarkEdit.Text,                                                 //p7                                    //4
                    vP8,                                                                //p8                                    //5
                    vP9,                                                                //p9                                    //6
                    vP10,                                                               //p10                                   //7
                    vP11,                                                               //p11                                     NM_CODE8
                    VanBizNoEdit.Text,                                                  //p12        밴사업자번호                 NM_CODE9
                    VanSerialNoEdit.Text,                                               //p13        밴시리얼번호                 NM_CODE10
                    VanPasswordEdit.Text,                                               //p14        밴비밀번호                   NM_CODE11
                    '',                                                                 //p15        사용안함                     NM_CODE12
                    IntToStr(POSType1ComboBox.ItemIndex),                               //p16        포스테이블/테이크아웃        NM_CODE13
                    GetStrPointerData(POSPrinterComboBox),                              //p17        스마트포스 주문서 출력프리넡 NM_CODE14, NM_CODE32 (주방모니터)
                    Ifthen(POSDesignComboBox.Text='','01',POSDesignComboBox.Text),      //p18        포스디자인                   NM_CODE15
                    Ifthen(POSPluComboBox.Text = '','01',POSPluComboBox.Text),          //p19        포스PLU                      NM_CODE16
                    GetStrPointerData(POSUserComboBox),                                 //p20        키오스크로그인               NM_CODE17
                    GetStrPointerData(VanEayPayComboBox),                               //p21        동반위 멀티패드              NM_CODE18
                    GetStrPointerData(ServicePrintComboBox),                            //p22        렛츠오더 서비스 출력         NM_CODE19
                    vKitchen,                                                           //p23
                    RustDeskIDEdit.Text,                                                //p24        원격 ID
                    UserCode,                                                           //p25
                    IntToStr(PosUseComboBox.ItemIndex)],true);                          //p26

          if VanComboBox.EditModified and (CodeEdit.Text = '001') then
            ExecQuery('update MS_CODE '
                     +'   set NM_CODE5 = :P2 '
                     +' where CD_HEAD  =:P0 '
                     +'   and CD_STORE =:P1 '
                     +'   and CD_KIND  =''01'' '
                     +'   and NM_CODE3 in (''0'',''1'',''2'');',
                     [HeadStoreCode,
                      StoreCode,
                      VanCode],true);
        end;
       2 :  //주방프린터
        begin
          vTemp := EmptyStr;
          for vIndex := 0 to Pred(KitchenCheckListBox.Count) do
          begin
            if KitchenCheckListBox.Checked[vIndex] then
              vTemp := vTemp + format('%s,',[PStrPointer(KitchenCheckListBox.Items.Objects[vIndex]).Data]);
          end;
          vTemp := LeftStr(vTemp, Length(vTemp)-1);;

          vTemp1 := EmptyStr;
          for vIndex := 0 to Pred(Kitchen1CheckListBox.Count) do
          begin
            if Kitchen1CheckListBox.Checked[vIndex] then
              vTemp1 := vTemp1 + format('%s,',[PStrPointer(Kitchen1CheckListBox.Items.Objects[vIndex]).Data]);
          end;
          vTemp1 := LeftStr(vTemp1, Length(vTemp1)-1);

          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, NM_CODE9, NM_CODE10, '
                   +'                    NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9,:P10,:P11,:P12,:P13,:P14,:P15,:P16,:P17,:P18,:P19,:P20) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        NM_CODE5     =:P8, '
                   +'                        NM_CODE6     =:P9, '
                   +'                        NM_CODE7     =:P10, '
                   +'                        NM_CODE8     =:P11, '
                   +'                        NM_CODE9     =:P12, '
                   +'                        NM_CODE10    =:P13, '
                   +'                        NM_CODE11    =:P14, '
                   +'                        NM_CODE12    =:P15, '
                   +'                        NM_CODE13    =:P16, '
                   +'                        NM_CODE14    =:P17, '
                   +'                        NM_CODE15    =:P18, '
                   +'                        CD_SAWON_CHG =:P19, '
                   +'                        DS_STATUS    =:P20;',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    KitchenNameEdit.Text,                                               //p5
                    KitchenLinkPosComboBox.Text,                                        //p6
                    KitchenPortComboBox.Text,                                           //p7
                    IntToStr(KitchenDeviceComboBox.ItemIndex+1),                        //p8
                    IntToStr(KitchenBaudRateComboBox.ItemIndex+1),                      //p9
                    KitchenPrintCountEdit.Text,                                         //p10
                    KitchenPrintTopMaginEdit.Text,                                      //p11
                    vTemp,                                                              //p12
                    vTemp1,                                                             //p13
                    Ifthen(KitchenFirstPrintCheckBox.Checked,'1','0'),                  //p14
                    KitchenIPAdressEdit.Text,                                           //p15
                    Ifthen(KitchenDisplayCheckBox.Checked,'1','0'),                     //p16
                    IntToStr(KitchenColumComboBox.ItemIndex),                           //p17
                    KitchenPrintBottomMaginEdit.Text,                                   //p18
                    Ifthen(LetsOrderOnlyCheckBox.Checked,'Y','N'),                      //p19
                    UserCode,                                                           //p20
                    IntToStr(KitchenUseComboBox.ItemIndex)],true);                      //p21

        end;
       3 : //층관리
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE10, NM_CODE19, NM_CODE20, NM_CODE21, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9,:P10,:P11,:P12,:P13,:P14,:P15) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        NM_CODE5     =:P8, '
                   +'                        NM_CODE6     =:P9, '
                   +'                        NM_CODE10    =:P10, '
                   +'                        NM_CODE19    =:P11, '
                   +'                        NM_CODE20    =:P12, '
                   +'                        NM_CODE21    =:P13, '
                   +'                        CD_SAWON_CHG =:P14, '
                   +'                        DS_STATUS    =:P15;',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    FloorNameEdit.Text,                                                 //p4        //NM_CODE1
                    IntToStr(TableTitleFontSizeEdit.Value),                             //p5        //NM_CODE2
                    IntToStr(TableCaptionFontSizeEdit.Value),                           //p6
                    IntToStr(TableAmountFontSizeEdit.Value),                            //p7
                    IntToStr(TableBottomFontSizeEdit.Value),                            //p8
                    GetStrPointerData(CornerComboBox),                                  //p9
                    IntToStr(TableTableNoSpinEdit.Value),                               //p10
                    IntToStr(TableMenuDPCountEdit.Value),                               //p11
                    Ifthen(WaitFloorCheckBox.Checked,'Y','N'),                          //p12
                    ColorToString(FloorColorPanel.Color),                               //p13
                    UserCode,                                                           //p14
                    IntToStr(FloorUseComboBox.ItemIndex)],true);                        //p15
        end;
       4 : //객층
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6;',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    GuestTypeNameEdit.Text,                                             //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(GuestTypeUseComboBox.ItemIndex)],true);                    //p6
        end;
       5: // 회원 구분
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, NM_CODE9, NM_CODE10, '
                   +'                    NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9,:P10,:P11,:P12,:P13,:P14,:P15,:P16,:P17,:P18,:P19,:P20,:P21,:P22,:P23) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        NM_CODE5     =:P8, '
                   +'                        NM_CODE6     =:P9, '
                   +'                        NM_CODE7     =:P10, '
                   +'                        NM_CODE8     =:P11, '
                   +'                        NM_CODE9     =:P12, '
                   +'                        NM_CODE10    =:P13, '
                   +'                        NM_CODE11    =:P14, '
                   +'                        NM_CODE12    =:P15, '
                   +'                        NM_CODE13    =:P16, '
                   +'                        NM_CODE14    =:P17, '
                   +'                        NM_CODE15    =:P18, '
                   +'                        NM_CODE16    =:P19, '
                   +'                        NM_CODE17    =:P20, '
                   +'                        NM_CODE18    =:P21, '
                   +'                        CD_SAWON_CHG =:P22, '
                   +'                        DS_STATUS    =:P23;',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    MemberTypeNameEdit.Text,                                            //p4        //NM_CODE1
                    FloatToStr(MemberDcRateEdit.EditValue),                             //p5
                    IntToStr(MemberTypeSaleAmtEdit.EditValue),                          //p6
                    IntToStr(MemberSaleCountEdit.EditValue),                            //p7
                    IntToStr(MemberCashAmountEdit.EditValue),                           //p8
                    IntToStr(MemberCashPointEdit.EditValue),                            //p9
                    IntToStr(MemberCardAmountEdit.EditValue),                           //p10
                    IntToStr(MemberCardPointEdit.EditValue),                            //p11
                    IntToStr(MemberCashRcpAmountEdit.EditValue),                        //p12
                    IntToStr(MemberCashRcpPointEdit.EditValue),                         //p13
                    IntToStr(MemberGiftAmountEdit.EditValue),                           //p14
                    IntToStr(MemberGiftPointEdit.EditValue),                            //p15
                    IntToStr(MemberTrustAmountEdit.EditValue),                          //p16
                    IntToStr(MemberTrustPointEdit.EditValue),                           //p17
                    IntToStr(MemberPointAmountEdit.EditValue),                          //p18
                    IntToStr(MemberPointPointEdit.EditValue),                           //p19
                    GetStrPointerData(MemberTypeComboBox),                              //p20
                    Ifthen(MemberClassNotChangeCheckBox.Checked,'1','0'),               //p21
                    UserCode,                                                           //p22
                    IntToStr(MemberTypeUseComboBox.ItemIndex)],true);                   //p23
        end;
       6 : // 카드 매입사
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        CD_SAWON_CHG =:P7, '
                   +'                        DS_STATUS    =:P8; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    CardCompanyNameEdit.Text,                                           //p4        //NM_CODE1
                    CardCompanyJoinNoEdit.Text,                                         //p5        //NM_CODE2
                    FloatToStr(CardCompanyFeeEdit.Value),                               //p6        //NM_CODE3
                    UserCode,                                                           //p7
                    IntToStr(CardCompanyUseComboBox.ItemIndex)],true);                  //p8
        end;
       7 : //할인구분
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9,:P10,:P11,:P12) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        NM_CODE5     =:P8, '
                   +'                        NM_CODE6     =:P9, '
                   +'                        NM_CODE7     =:P10, '
                   +'                        CD_SAWON_CHG =:P11, '
                   +'                        DS_STATUS    =:P12; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    DcNameEdit.Text,                                                    //p4        //NM_CODE1
                    IntToStr(DcTypeComboBox.ItemIndex),                                 //p5        //NM_CODE2
                    FloatToStr(DcRateEdit.Value),                                       //p6        //NM_CODE3
                    IntToStr(DcStandardAmountEdit.EditValue),                           //p7        //NM_CODE4
                    FloatToStr(DcAmountEdit.Value),                                     //p8        //NM_CODE5
                    GetStrPointerData(DcMenuClassComboBox),                             //p9        //NM_CODE6
                    IntToStr(DcTypeMenuComboBox.ItemIndex),                             //p10       //NM_CODE7
                    UserCode,                                                           //p11
                    IntToStr(DcUseComboBox.ItemIndex)],true);                           //p12
        end;
       8 : // 주문 취소 사유
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    OrderCancelNameEdit.Text,                                           //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(OrderCancelUseComboBox.ItemIndex)],true);                  //p6
        end;
       9 : // 매출 취소 사유
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    SaleCancelNameEdit.Text,                                            //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(SaleCancelUseComboBox.ItemIndex)],true);                   //p6
        end;
      10 : // 시급코드
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        CD_SAWON_CHG =:P6, '
                   +'                        DS_STATUS    =:P7; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    TimePayNameEdit.Text,                                               //p4        //NM_CODE1
                    GetOnlyNumber(TimePayAmtEdit.Text),                                 //p5        //NM_CODE2
                    UserCode,                                                           //p6
                    IntToStr(TimePayUseComboBox.ItemIndex)],true);                      //p7
        end;
      11 : // 출납
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3, NM_CODE4, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        CD_SAWON_CHG =:P8, '
                   +'                        DS_STATUS    =:P9; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    InOutNameEdit.Text,                                                 //p4        //NM_CODE1
                    IntToStr(InOutComboBox.ItemIndex),                                  //p5        //NM_CODE2
                    GetStrPointerData(InOutLinkComboBox),                               //p6        //NM_CODE3
                    InOutRemarkEdit.Text,                                               //p7        //NM_CODE4
                    UserCode,                                                           //p8
                    IntToStr(InOutUseComboBox.ItemIndex)],true);                        //p9
        end;
      12 : // 포인트 적립
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        CD_SAWON_CHG =:P7, '
                   +'                        DS_STATUS    =:P8; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    PointSaveNameEdit.Text,                                             //p4        //NM_CODE1
                    FloatToStr(PointSaveEdit.Value),                                    //p5        //NM_CODE2
                    IntToStr(PointSaveSaleComboBox.ItemIndex),                          //p6        //NM_CODE3
                    UserCode,                                                           //p7
                    IntToStr(PointSaveUseComboBox.ItemIndex)],true);                    //p8
        end;
      13 : // 포인트 사용
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        CD_SAWON_CHG =:P7, '
                   +'                        DS_STATUS    =:P8; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    PointUseNameEdit.Text,                                              //p4        //NM_CODE1
                    FloatToStr(PointUseEdit.Value),                                     //p5        //NM_CODE2
                    IntToStr(PointUseSaleComboBox.ItemIndex),                           //p6        //NM_CODE3
                    UserCode,                                                           //p7
                    IntToStr(PointSaveUseComboBox.ItemIndex)],true);                    //p8
        end;
      14 : // 연령대
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    AgeGroupNameEdit.Text,                                              //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(AgeGroupUseComboBox.ItemIndex)],true);                     //p6
        end;
      15 : // 시간대
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    TimeZoneEdit.Text,                                                  //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(TimeZoneUseComboBox.ItemIndex)],true);                     //p6
        end;
      16 : // 주방메모
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    KitchenMemoNameEdit.Text,                                           //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(KitchenMemoUseComboBox.ItemIndex)],true);                  //p6
        end;
      17 : // 사원 권한
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    UserGradeNameEdit.Text,                                             //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(UserGradeUseComboBox.ItemIndex)],true);                    //p6
        end;
      18 : // SMS 메시지함
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        CD_SAWON_CHG =:P7, '
                   +'                        DS_STATUS    =:P8; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    SMSNameEdit.Text,                                                   //p4        //NM_CODE1
                    SMSMemo.Text,                                                       //p5        //NM_CODE2
                    IntToStr(SMSTypeComboBox.ItemIndex),                                //p6        //NM_CODE3
                    UserCode,                                                           //p7
                    IntToStr(SMSUseComboBox.ItemIndex)],true);                          //p8
        end;
      19 : // 은행코드
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        CD_SAWON_CHG =:P7, '
                   +'                        DS_STATUS    =:P8; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    BankEdit.Text,                                                      //p4        //NM_CODE1
                    BankNumberEdit.Text,                                                //p5        //NM_CODE2
                    BankMasterEdit.Text,                                                //p6        //NM_CODE3
                    UserCode,                                                           //p7
                    IntToStr(BankUseComboBox.ItemIndex)],true);                         //p8
        end;
      20 : // 배달코스
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    DeliveryCourseNameEdit.Text,                                        //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(DeliveryCourseUseComboBox.ItemIndex)],true);               //p6
        end;
      21 : // 배달아이템
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    DeliveryItemNameEdit.Text,                                          //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(DeliveryItemUseComboBox.ItemIndex)],true);                 //p6
        end;
      22 : // 배달지역
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    DeliveryLocalNameEdit.Text,                                         //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(DeliveryLocalUseComboBox.ItemIndex)],true);                //p6
        end;
      23 : // 서비스사유
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    ServiceWhyEdit.Text,                                                //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(ServiceUseComboBox.ItemIndex)],true);                      //p6
        end;
      24 : // 테이블메모
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    TableMemoEdit.Text,                                                 //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(TableMemoUseComboBox.ItemIndex)],true);                    //p6
        end;
      25 : // 프린터그룹
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        CD_SAWON_CHG =:P6, '
                   +'                        DS_STATUS    =:P7; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    PrinterGroupNameEdit.Text,                                          //p4        //NM_CODE1
                    GetStrPointerData(PrinterGroupKitchenComboBox),                     //p5        //NM_CODE2
                    UserCode,                                                           //p6
                    IntToStr(PrinterGroupUseComboBox.ItemIndex)],true);                 //p7

        end;
      26 : // 서비스호출
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        CD_SAWON_CHG =:P6, '
                   +'                        DS_STATUS    =:P7; ',
                   [HeadStoreCode,                                                      //p0
                    StoreCode,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    ServiceCallEdit.Text,                                               //p4        //NM_CODE1
                    ServiceCallWavFileNameEdit.Text,                                    //p5
                    UserCode,                                                           //p6
                    IntToStr(ServiceCallUseComboBox.ItemIndex)],true);                  //p7
        end;
    end;

    VanComboBox.EditModified      := false;
    VanTIDEdit.EditModified       := false;
    VanBizNoEdit.EditModified     := false;
    VanSerialNoEdit.EditModified  := false;
    VanPasswordEdit.EditModified  := false;
    ExtremeMainForm.PosSendMessage;
    // 그리드 수정
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := CodeEdit.Text;
      case SelectedIndex  of
         1   : NewData[1] := POSNoEdit.Text;
         2   : NewData[1] := KitchenNameEdit.Text;
         3   : NewData[1] := FloorNameEdit.Text;
         4   : NewData[1] := GuestTypeNameEdit.Text;
         5   : NewData[1] := MemberTypeNameEdit.Text;
         6   : NewData[1] := CardCompanyNameEdit.Text;
         7   : NewData[1] := DCNameEdit.Text;
         8   : NewData[1] := OrderCancelNameEdit.Text;
         9   : NewData[1] := SaleCancelNameEdit.Text;
        10   : NewData[1] := TimePayNameEdit.Text;
        11   : NewData[1] := InOutNameEdit.Text;
        12   : NewData[1] := PointSaveNameEdit.Text;
        13   : NewData[1] := PointUseNameEdit.Text;
        14   : NewData[1] := AgeGroupNameEdit.Text;
        15   : NewData[1] := TimeZoneEdit.Text;
        16   : NewData[1] := KitchenMemoNameEdit.Text;
        17   : NewData[1] := UserGradeNameEdit.Text;
        18   : NewData[1] := SMSNameEdit.Text;
        19   : NewData[1] := BankEdit.Text;
        20   : NewData[1] := DeliveryCourseNameEdit.Text;
        21   : NewData[1] := DeliveryItemNameEdit.Text;
        22   : NewData[1] := DeliveryLocalNameEdit.Text;
        23   : NewData[1] := ServiceWhyEdit.Text;
        24   : NewData[1] := TableMemoEdit.Text;
        25   : NewData[1] := PrinterGroupNameEdit.Text;
        26   : NewData[1] := ServiceCallEdit.Text;
      end;
    end
    else
    begin
      case SelectedIndex of
         1   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := POSNoEdit.Text;
         2   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := KitchenNameEdit.Text;
         3   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := FloorNameEdit.Text;
         4   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := GuestTypeNameEdit.Text;
         5   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := MemberTypeNameEdit.Text;
         6   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := CardCompanyNameEdit.Text;
         7   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := DCNameEdit.Text;
         8   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := OrderCancelNameEdit.Text;
         9   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := SaleCancelNameEdit.Text;
        10   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := TimePayNameEdit.Text;
        11   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := InOutNameEdit.Text;
        12   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := PointSaveNameEdit.Text;
        13   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := PointUseNameEdit.Text;
        14   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := AgeGroupNameEdit.Text;
        15   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := TimeZoneEdit.Text;
        16   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := KitchenMemoNameEdit.Text;
        17   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := UserGradeNameEdit.Text;
        18   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := SMSNameEdit.Text;
        19   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := BankEdit.Text;
        20   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := DeliveryCourseNameEdit.Text;
        21   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := DeliveryItemNameEdit.Text;
        22   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := DeliveryLocalNameEdit.Text;
        23   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := ServiceWhyEdit.Text;
        24   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := TableMemoEdit.Text;
        25   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := PrinterGroupNameEdit.Text;
        26   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := ServiceCallEdit.Text;
      end;
    end;

    Result := true;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
