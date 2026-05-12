unit StoreStore;

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
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, cxButtonEdit,
  Vcl.StdCtrls, cxCurrencyEdit, cxMemo, cxGroupBox, cxRadioGroup, cxCheckBox,
  cxSpinEdit, AdvOfficePager, Math, StrUtils, DateUtils, AdvGlassButton,
  AdvPanel, cxCheckGroup, cxImage, AdvGroupBox, DelphiZXingQRCode,
  Vcl.WinXCalendars, AdvSmoothButton, cxTimeEdit, Vcl.WinXCtrls, MaskUtils,
  IdMultiPartFormData, IdHttp, System.JSON, CurvyControls, dxBarBuiltInMenu,
  cxPC, dxDateRanges, dxScrollbarAnnotations, REST.Types, Activex,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers, AdvScrollBox,
  Winapi.TlHelp32, Clipbrd;

type
  TStoreStoreForm = class(TInheritGridEditForm)
    GridTableViewCustomerCode: TcxGridColumn;
    GridTableViewCustomerName: TcxGridColumn;
    GridTableViewPartner: TcxGridColumn;
    cxLabel1: TcxLabel;
    ToolBarCompanyCodeEdit: TcxButtonEdit;
    ToolBarCompanyNameLabel: TcxLabel;
    GridTableViewStatus: TcxGridColumn;
    DetailSearchPanel: TAdvPanel;
    ScrollBox1: TScrollBox;
    ConditionLocalComboBox: TcxComboBox;
    cxLabel2: TcxLabel;
    ConditionManagerComboBox: TcxComboBox;
    cxLabel3: TcxLabel;
    ConditionUpjongComboBox: TcxComboBox;
    cxLabel4: TcxLabel;
    ConditionSizeComboBox: TcxComboBox;
    cxLabel5: TcxLabel;
    ConditionVanComboBox: TcxComboBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    ConditionVanTypeComboBox: TcxComboBox;
    ConditionPayTypeComboBox: TcxComboBox;
    cxLabel8: TcxLabel;
    ConditionPayEndCheckBox: TcxCheckBox;
    ConditionPayFromDateEdit: TcxDateEdit;
    cxLabel9: TcxLabel;
    ConditionPayEndDateEdit: TcxDateEdit;
    ConditionStipulateCheckBox: TcxCheckBox;
    ConditionStipulateFromDateEdit: TcxDateEdit;
    cxLabel10: TcxLabel;
    ConditionStipulateToDateEdit: TcxDateEdit;
    ConditionDemoCheckBox: TcxCheckBox;
    ConditionDemoFromDateEdit: TcxDateEdit;
    cxLabel11: TcxLabel;
    ConditionDemoToDateEdit: TcxDateEdit;
    AuthTelPanel: TAdvPanel;
    AuthComboBox: TcxComboBox;
    Label21: TLabel;
    OKButton: TAdvGlowButton;
    CloseButton: TAdvGlowButton;
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    OpenDialog: TOpenDialog;
    OptionLetsOrderCheckBox: TcxCheckBox;
    GridTableViewLetsOrder: TcxGridColumn;
    AdvOfficePager: TcxPageControl;
    StoreInfoOfficePager: TcxTabSheet;
    EtcPage: TcxTabSheet;
    UserPager: TcxTabSheet;
    UserGrid: TcxGrid;
    UserGridTableView: TcxGridTableView;
    UserGridTableViewUserID: TcxGridColumn;
    UserGridTableViewGubun: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    SyncPage: TcxTabSheet;
    SyncCheckGroup: TcxCheckGroup;
    HistoryPage: TcxTabSheet;
    cxGrid1: TcxGrid;
    HistoryGridTableView: TcxGridTableView;
    HistoryGridTableViewHistoryDate: TcxGridColumn;
    HistoryGridTableViewWorkType: TcxGridColumn;
    HistoryGridTableViewColumn17: TcxGridColumn;
    HistoryGridTableViewColumn18: TcxGridColumn;
    HistoryGridTableViewStoreName: TcxGridColumn;
    HistoryGridTableViewColumn1: TcxGridColumn;
    HistoryGridTableViewColumn2: TcxGridColumn;
    HistoryGridTableViewColumn3: TcxGridColumn;
    HistoryGridTableViewColumn4: TcxGridColumn;
    HistoryGridTableViewColumn5: TcxGridColumn;
    HistoryGridTableViewColumn6: TcxGridColumn;
    HistoryGridTableViewColumn7: TcxGridColumn;
    HistoryGridTableViewColumn8: TcxGridColumn;
    HistoryGridTableViewColumn9: TcxGridColumn;
    HistoryGridTableViewColumn10: TcxGridColumn;
    HistoryGridTableViewColumn11: TcxGridColumn;
    HistoryGridTableViewColumn12: TcxGridColumn;
    HistoryGridTableViewColumn13: TcxGridColumn;
    HistoryGridTableViewColumn14: TcxGridColumn;
    HistoryGridTableViewColumn16: TcxGridColumn;
    HistoryGridTableViewColumn15: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    RustDeskPage: TcxTabSheet;
    SyncButton: TAdvGlowButton;
    AdvScrollBox1: TAdvScrollBox;
    GoodsCodeLabel: TLabel;
    GoodsNameLabel: TLabel;
    MenuClassLabel: TLabel;
    CEONameLabel: TLabel;
    IDNoLabel: TLabel;
    OfficeTelLabel: TLabel;
    AddrLabel: TLabel;
    DisplaySeqLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    UseYNLabel: TLabel;
    RemarkLabel: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    DemoEndLabel: TLabel;
    PayEndDateLabel: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label33: TLabel;
    Option14CheckBox: TcxCheckBox;
    Option8CheckBox: TcxCheckBox;
    CustomerCodeEdit: TcxTextEdit;
    CustomerNameEdit: TcxTextEdit;
    PartnerNameEdit: TcxTextEdit;
    CEONameEdit: TcxTextEdit;
    BizNoEdit: TcxMaskEdit;
    OfficeTelEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    PosCountEdit: TcxSpinEdit;
    KioskCountEdit: TcxSpinEdit;
    MenuLimitCountEdit: TcxSpinEdit;
    StatusComboBox: TcxComboBox;
    RemarkMemo: TcxMemo;
    MobileTelEdit: TcxTextEdit;
    PartnerCodeEdit: TcxButtonEdit;
    SetupDateEdit: TcxDateEdit;
    LogInGroupBox: TcxGroupBox;
    AppIDLabel: TLabel;
    AppPWDLabel: TLabel;
    LoginCommentLabel: TLabel;
    UserIDEdit: TcxTextEdit;
    AppPWDEdit: TcxTextEdit;
    IDDupCheckButton: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    Label18: TLabel;
    TimeLabel: TLabel;
    LicenseNoEdit: TcxTextEdit;
    LicenseCallButton: TAdvGlowButton;
    ConnectLimitCountEdit: TcxSpinEdit;
    TabletCountEdit: TcxSpinEdit;
    LetsOrderPanel: TAdvPanel;
    Option9CheckBox: TcxCheckBox;
    Option15CheckBox: TcxCheckBox;
    HeadChangeGroupBox: TcxGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    NewHeadCodeEdit: TcxTextEdit;
    HeadChangeButton: TAdvGlowButton;
    CustomerShortNameEdit: TcxTextEdit;
    KaKaoChannelPanel: TAdvPanel;
    Label38: TLabel;
    Label40: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    KaKaoChannelWebUrlEdit: TcxTextEdit;
    KaKaoChannelAPIKeyEdit: TcxButtonEdit;
    ReOrderQREdit: TcxTextEdit;
    OrderTemplatCodeEdit: TcxTextEdit;
    PickupTemplatCodeEdit: TcxTextEdit;
    SyncPanel: TAdvPanel;
    Option1RadioGroup: TcxRadioGroup;
    Option2CheckBox: TcxCheckBox;
    Option4CheckBox: TcxCheckBox;
    Option5CheckBox: TcxCheckBox;
    Option6CheckBox: TcxCheckBox;
    Option3CheckBox: TcxCheckBox;
    Option7CheckBox: TcxCheckBox;
    AdvScrollBox2: TAdvScrollBox;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    PosDeviceMemo: TcxMemo;
    LocalComboBox: TcxComboBox;
    ManagerComboBox: TcxComboBox;
    UpjongComboBox: TcxComboBox;
    SizeComboBox: TcxComboBox;
    LicenseGroupBox: TcxGroupBox;
    Label5: TLabel;
    LicenseRadio1Button: TRadioButton;
    LicenseRadio2Button: TRadioButton;
    AspAmtEdit: TcxCurrencyEdit;
    cxGroupBox1: TcxGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    VanComboBox: TcxComboBox;
    VanTypeComboBox: TcxComboBox;
    StipulateFromDateEdit: TcxDateEdit;
    StipulateToDateEdit: TcxDateEdit;
    StipulateCountEdit: TcxCurrencyEdit;
    RentalFeeEdit: TcxCurrencyEdit;
    cxGroupBox3: TcxGroupBox;
    PosVersionLabel: TLabel;
    TRVersionLabel: TLabel;
    PosUpdateCheckBox: TcxCheckBox;
    SmsRemainEdit: TcxCurrencyEdit;
    Option10ComboBox: TcxComboBox;
    SubPartnerComboBox: TcxComboBox;
    Option11CheckBox: TcxCheckBox;
    SaleDataDeleteButton: TAdvGlowButton;
    ProgramAuthInitButton: TAdvGlowButton;
    AdvPanel1: TAdvPanel;
    MenuRestoreButton: TAdvGlowButton;
    PosPluRestoreButton: TAdvGlowButton;
    TableRestoeButton: TAdvGlowButton;
    KioskPluRestoreButton: TAdvGlowButton;
    UploadBeginEdit: TcxMaskEdit;
    UploadToEdit: TcxMaskEdit;
    cxGrid2: TcxGrid;
    GridTableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridRustDeskID: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    GridTableView1Device: TcxGridColumn;
    UserGridTableViewPassWord: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure PartnerCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPropertiesChange(Sender: TObject);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ToolBarCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure IDDupCheckButtonClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ConditionPayEndCheckBoxPropertiesChange(Sender: TObject);
    procedure ConditionPayFromDateEditPropertiesChange(Sender: TObject);
    procedure ConditionStipulateFromDateEditPropertiesChange(Sender: TObject);
    procedure ConditionStipulateCheckBoxPropertiesChange(Sender: TObject);
    procedure ConditionDemoCheckBoxPropertiesChange(Sender: TObject);
    procedure ConditionDemoFromDateEditPropertiesChange(Sender: TObject);
    procedure SyncButtonClick(Sender: TObject);
    procedure LicenseCallButtonClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure HistoryPagexShow(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure SaleDataDeleteButtonClick(Sender: TObject);
    procedure GoodsCodeLabelDblClick(Sender: TObject);
    procedure HeadChangeButtonClick(Sender: TObject);
    procedure PWDEditKeyPress(Sender: TObject; var Key: Char);
    procedure AdvOfficePagerChange(Sender: TObject);
    procedure CustomerNameEditExit(Sender: TObject);
    procedure ProgramAuthInitButtonClick(Sender: TObject);
    procedure MenuRestoreButtonClick(Sender: TObject);
    procedure TableRestoeButtonClick(Sender: TObject);
    procedure PosPluRestoreButtonClick(Sender: TObject);
    procedure KaKaoChannelAPIKeyEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SyncPageShow(Sender: TObject);
    procedure RustDeskPageShow(Sender: TObject);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure UserGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    CompanyCode,
    PartnerCode,
    PartnerName,
    PartnerPrefix,
    CompanyOption,
    NewStore :String;
    PartnerOptions  :String;
    QRCodeBitmap: TBitmap;
    QRURL       : String;
    procedure ShowHistory;
    procedure SetPartnerComboBox(aPartnerCode, aType:String);
    procedure LetsOrderDisUse(aHeadStore,aStoreCode:String);
    procedure RustDeskShow;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StoreStoreForm: TStoreStoreForm;

implementation
uses Common, DBModule, UnitZipPopup, Help, ProxyCheck;

{$R *.dfm}

{ TStoreStoreForm }
procedure TStoreStoreForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  AdvOfficePager.ActivePageIndex := 0;
  VanTypeComboBox.Properties.Items.Clear;
  ConditionVanTypeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionVanTypeComboBox.Properties.Items.AddObject('전체', TObject(vCode));

  New(vCode);
  vCode^.Data := 'I';;
  VanTypeComboBox.Properties.Items.AddObject('IC인증', TObject(vCode));
  ConditionVanTypeComboBox.Properties.Items.AddObject('IC인증', TObject(vCode));
  New(vCode);
  vCode^.Data := 'V';;
  VanTypeComboBox.Properties.Items.AddObject('가상단말기', TObject(vCode));
  ConditionVanTypeComboBox.Properties.Items.AddObject('가상단말기', TObject(vCode));
  New(vCode);
  vCode^.Data := 'C';;
  VanTypeComboBox.Properties.Items.AddObject('단말기연동', TObject(vCode));
  ConditionVanTypeComboBox.Properties.Items.AddObject('단말기연동', TObject(vCode));

  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''0'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('정상', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''1'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('해지', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''D'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('데모', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''E'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('데모종료', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''R'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('해지요청', TObject(vCode));
  New(vCode);
  vCode^.Data := '';
  ConditionToolBarComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;


  StatusComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  StatusComboBox.Properties.Items.AddObject('일시중지', TObject(vCode));
  New(vCode);
  vCode^.Data := 'D';
  StatusComboBox.Properties.Items.AddObject('데모', TObject(vCode));

  ConditionPayTypeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionPayTypeComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  New(vCode);
  vCode^.Data := 'P';
  ConditionPayTypeComboBox.Properties.Items.AddObject('협력사', TObject(vCode));
  New(vCode);
  vCode^.Data := 'C';
  ConditionPayTypeComboBox.Properties.Items.AddObject('매장', TObject(vCode));
  ConditionPayTypeComboBox.ItemIndex := 0;

  ConditionPayFromDateEdit.Date       := Now();
  ConditionPayEndDateEdit.Date        := Now();
  ConditionStipulateFromDateEdit.Date := Now();
  ConditionStipulateToDateEdit.Date   := Now();
  ConditionDemoFromDateEdit.Date      := Now();
  ConditionDemoToDateEdit.Date        := Now();


  ConditionLocalComboBox.Properties.Items.Clear;
  ConditionManagerComboBox.Properties.Items.Clear;
  ConditionUpjongComboBox.Properties.Items.Clear;
  ConditionSizeComboBox.Properties.Items.Clear;
  ConditionVanComboBox.Properties.Items.Clear;

  NewStore := 'Y';
  //협력사 권한일때는 협력사고정
  StandaloneCode := '00000000';
  if UserLevel = 'P' then
  begin
    try
      OpenQuery('select CD_PARTNER, '
               +'       NM_PARTNER, '
               +'       DISCERN, '
               +'       YN_NEWSTORE, '
               +'       CD_STANDALONE, '
               +'       OPTIONS '
               +'  from PARTNER '
               +' where CD_PARTNER = (select CD_PARTNER '
               +'                       from USER_MASTER '
               +'                      where ID_USER =:P0) ',
               [UserCode],false,RestBaseURL);
      if not Query.Eof then
      begin
        PartnerCode   := Query.Fields[0].AsString;
        PartnerName   := Query.Fields[1].AsString;
        PartnerPrefix := Query.Fields[2].AsString;
        NewStore      := Query.Fields[3].AsString;
        StandaloneCode := Query.Fields[4].AsString;
        PartnerOptions := Query.Fields[5].AsString;
      end;
    finally
      FinishQuery;
    end;
    LicenseGroupBox.Enabled   := false;
    MenuLimitCountEdit.Properties.ReadOnly := true;

    SetPartnerComboBox(PartnerCode, 'C');
    PosUpdateCheckBox.Properties.ReadOnly := true;
  end
  else
  begin
    LicenseGroupBox.Enabled := true;
  end;

  ConditionLocalComboBox.ItemIndex := 0;
  ConditionManagerComboBox.ItemIndex := 0;
  ConditionUpjongComboBox.ItemIndex := 0;
  ConditionSizeComboBox.ItemIndex := 0;
  ConditionVanComboBox.ItemIndex := 0;

  ConnectLimitCountEdit.Enabled := UserLevel = 'E';
  LetsOrderPanel.Visible        := (UserLevel = 'E') or (Copy(PartnerOptions,2,1)='1');
  Option14CheckBox.Enabled      := UserLevel = 'E';
  HeadChangeGroupBox.Visible    := UserLevel = 'E';
  if NewStore = 'N' then
  begin
    ButtonToolBarNewButton.Visible := false;
    ButtonToolBar.Refresh;
  end;

  QRCodeBitmap    := TBitmap.Create;
  isChanged := false;
end;

procedure TStoreStoreForm.GoodsCodeLabelDblClick(Sender: TObject);
var vCode :String;
begin
  inherited;
  if isNew then
  begin
    if InputBox('고객번호를 입력하세요', vCode,8,false,false) then
    begin
      if Length(vCode) <> 8 then
      begin
        MsgBox('8 자리를 입력해야합니다');
        Exit;
      end;
      if PartnerPrefix <> LeftStr(vCode,2) then
      begin
        MsgBox(Format('고객번호는 %s로 시작해야합니다',[PartnerPrefix]));
        Exit;
      end;

      try
        OpenQuery('select CD_CUSTOMER '
                 +'  from CUSTOMER '
                 +' where CD_CUSTOMER = :P0 ',
                 [vCode],false,RestBaseURL);
        if not Query.Eof then
        begin
          MsgBox('사용 중인 고객번호입니다');
          Exit;
        end;
      finally
        Query.Close;
      end;
      CustomerCodeEdit.Text := vCode;
    end;
  end;
end;

procedure TStoreStoreForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if Trim(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, cxGridRustDeskID.Index]) = '' then Exit;

  if not AskBox('원격제어를 하시겠습니까?') then Exit;
  if not RunningProgram('rustdesk.exe') then
  begin
    if not FileExists(ExtractFileName(Application.ExeName)+'RustDesk.exe') then
      FileDownLoad('RustDesk.exe', ExtractFileName(Application.ExeName));
    GetDosOutput('rustdesk.exe --silent-install', ExtractFileName(Application.ExeName));
    while not RunningProgram('rustdesk.exe') do
      Application.ProcessMessages;
  end;

  Clipboard.Clear;
  Clipboard.AsText := '9JSP3BVYB5UTNtUW25WcRdWMZllU5w2QCNHbvFVbFpndhVmcvhFTxATb4UjUyIiOikXZrJCLiIiOikGchJCLiI3au82YuM3bwhXZuc3d3JiOikXYsVmciwiIytmLvNmLz9Gc4VmL3d3diojI0N3boJye';
  ExecuteProgram('rustdesk.exe','C:\Program Files\RustDesk\', Format('--connect %s --password exPos15444171',[GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, cxGridRustDeskID.Index]]));
end;

procedure TStoreStoreForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewStatus.Index] = '데모' then
    AStyle := StyleFontBlue
  else if ARecord.Values[GridTableViewStatus.Index] = '해지' then
    AStyle := StyleFontRed
  else if ARecord.Values[GridTableViewStatus.Index] = '데모만료' then
    AStyle := StyleFontGray;
end;

procedure TStoreStoreForm.IDDupCheckButtonClick(Sender: TObject);
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
      UserIDEdit.TextHint := UserIDEdit.Text;
      MsgBox('사용 가능한 아이디입니다');
      AppPWDEdit.SetFocus;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TStoreStoreForm.KaKaoChannelAPIKeyEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var vCode : PStrPointer;
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption := '카카오채널 조회';
      GridTableViewCode.Caption  := '채널명';
      GridTableViewCode.Width    := 180;
      GridTableViewCode.Properties.Alignment.Horz := taLeftJustify;
      GridTableViewName1.Caption := 'API Key';
      GridTableViewName1.Width   := 350;
      jsonHelpURL := jsonSMSDBURL;

      SQLText    := 'select API_KEY_ID, '
                   +'       API_KEY, '
                   +'       API_WEB_URL '
                   +'  from KMS_API_KEY  '
                   +' where API_KEY_ID like ConCat(''%'',:P2,''%'') '
                   +'   and DS_STATUS = ''0'' '
                   +' order by API_KEY_ID';

      if ShowModal = mrOK then
      begin
        KaKaoChannelAPIKeyEdit.Text := Names[0];
        KaKaoChannelWebUrlEdit.Text := Names[1];
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

procedure TStoreStoreForm.LetsOrderDisUse(aHeadStore, aStoreCode: String);
var vRestClient   :TRestClient;
    vRestRequest  :TRestRequest;
    vRESTResponse :TRESTResponse;
    vMsgObject,
    vJSONObject   :TJSONObject;
    vGUID : TGUID;
    vURL, vData, vToken :String;
begin
  vToken := LetsOrderAuth(aHeadStore);
  if vToken = '' then Exit;
  vToken := 'Bearer '+Replace(vToken,'"','');
  vURL := GetLetsOrderURL(aHeadStore);
  vURL := Format('%s/s2s/groups/%s/stores/%s/store',[vURL,aHeadStore,LowerCase(aStoreCode)]);

  try
    BlockInput(false);
    vRestClient                := TRestClient.Create(nil);
    vRestRequest               := TRestRequest.Create(nil);
    vRESTResponse              := TRESTResponse.Create(vRestRequest);
    vRestRequest.Client        := vRestClient;
    vRestRequest.Response      := vRESTResponse;
    vRestClient.BaseURL        := vURL;
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRestRequest.Method        := TRESTRequestMethod.rmDELETE;
    CoCreateGuid(vGUID);
    vRestRequest.Params.AddHeader('X-Message-Id', GUIDToString(vGUID));
    vRestRequest.Params.AddHeader('Authorization', vToken);
    vRestRequest.URLAlreadyEncoded := true;
    try
      vRESTRequest.Execute;
    except
      Exit;
    end;

    if vRestRequest.Response.StatusCode = 200 then
    begin
      Exit;
    end;

    vData := vRESTResponse.Content;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('error').ToJson;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('message').ToJson;
//    ErrBox('LetsOrder 매장삭제 오류'+#13+vData);
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

procedure TStoreStoreForm.LicenseCallButtonClick(Sender: TObject);
var vSendDate,
    vMessage,
    vPartnerTel :String;
    vPos, vKiosk :Integer;
    vTelList :TStringList;
    vCode : PStrPointer;
    vIndex :Integer;
begin
  inherited;

  if Exec_Timer.Enabled then
  begin
    MsgBox('인증요청이 진행 중입니다');
    Exit;
  end;
  vSendDate := FormatDateTime('yyyy-mm-dd hh:nn:ss', now());
  LicenseNoEdit.Hint := IntToStr(Random(9999));
  while Length(LicenseNoEdit.Hint) <> 4 do
    LicenseNoEdit.Hint := IntToStr(Random(9999));

  OpenQuery('select TEL_AUTH '
           +'  from PARTNER '
           +' where CD_PARTNER  =:P0 ',
           [PartnerCodeEdit.Text],false,RestBaseURL);

  vPartnerTel := Query.Fields[0].AsString;
  Query.Close;

  if vPartnerTel = '' then
  begin
    MsgBox('협력사에 인증용 전화번호가 등록되어 있지 않습니다');
    Exit;
  end;

  vTelList := TStringList.Create;
  Split(vPartnerTel,',',vTelList);
  if vTelList.Count > 1 then
  begin
    AuthComboBox.Properties.Items.Clear;
    for vIndex := 0 to vTelList.Count-1 do
      AuthComboBox.Properties.Items.Add(GetPhoneNo(vTelList.Strings[vIndex]));

    AuthComboBox.ItemIndex := 0;

    AuthTelPanel.Top  := (Self.Height - AuthTelPanel.Height) div 2;
    AuthTelPanel.Left := (Self.Width  - AuthTelPanel.Width ) div 2;
    AuthTelPanel.Visible := true;
    AuthTelPanel.Visible := true;
    MainPanel.Enabled   := false;
    Grid.Enabled        := false;
    Exit;
  end;

  if not AskBox(Format('%s 번호로 인증번호를 요청합니다',[GetPhoneNo(vPartnerTel)])) then Exit;

  PosCountEdit.PostEditValue;
  KioskCountEdit.PostEditValue;
  TabletCountEdit.PostEditValue;
  if StatusComboBox.EditModified and (GetStrPointerData(StatusComboBox) = '0') then
  begin
    if isNew and (GetStrPointerData(StatusComboBox) = '0') then
    begin
      if not AskBox('데모기간 없이 프로그램을 사용하시겠습니까?'#13'데모용으로 변경은 불가능합니다') then Exit;
    end;
    vPos   := PosCountEdit.EditingValue;
    vKiosk := KioskCountEdit.EditingValue;
    if (vPos > 0) and (vKiosk = 0) then
      vMessage := Format('%s 매장에 포스 %d대 인증완료를 요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, LicenseNoEdit.Hint])
    else if (vPos = 0) and (vKiosk > 0) then
      vMessage := Format('%s 매장에 키오스크 %d대 인증완료를 요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vKiosk, LicenseNoEdit.Hint])
    else if (vPos > 0) and (vKiosk > 0) then
      vMessage := Format('%s 매장에 포스 %d대, 키오스크 %d대 인증완료를 요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, vKiosk, LicenseNoEdit.Hint]);
  end
  else if StatusComboBox.EditModified and (GetStrPointerData(StatusComboBox) = 'R') then
  begin
    vMessage := Format('%s 매장의 대해 사용해지를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, LicenseNoEdit.Hint]);
    vMessage := 'POS 알림 메시지입니다'#13#13+vMessage+#13#13+Format('본 알림톡은 %s의 관리자에게만 보내는 서비스 입니다.',[PartnerNameEdit.Text]);
  end
  else
  begin
    vPos   := PosCountEdit.EditingValue;
    vKiosk := KioskCountEdit.EditingValue;
    if isNew then
    begin
      if (PosCountEdit.EditingValue > 0) and (KioskCountEdit.EditingValue = 0) then
        vMessage := Format('%s 매장에 포스 %d대를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, LicenseNoEdit.Hint])
      else if (PosCountEdit.EditingValue = 0) and (KioskCountEdit.EditingValue > 0) then
        vMessage := Format('%s 매장에 키오스크 %d대를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vKiosk, LicenseNoEdit.Hint])
      else if (PosCountEdit.EditingValue > 0) and (KioskCountEdit.EditingValue > 0) then
        vMessage := Format('%s 매장에 포스 %d대, 키오스크 %d대를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, vKiosk, LicenseNoEdit.Hint]);
    end
    else
    begin
      if (PosCountEdit.Tag <> PosCountEdit.EditingValue) and (KioskCountEdit.Tag = KioskCountEdit.EditingValue) then
        vMessage := Format('%s 매장에 포스 %d대 -> %d대로 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, PosCountEdit.Tag, vPos, LicenseNoEdit.Hint])
      else if (PosCountEdit.Tag = PosCountEdit.EditingValue) and (KioskCountEdit.Tag <> KioskCountEdit.EditingValue ) then
        vMessage := Format('%s 매장에 키오스크 %d대 ->%d대로 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, KioskCountEdit.Tag, vKiosk, LicenseNoEdit.Hint])
      else if (PosCountEdit.Tag <> PosCountEdit.EditingValue) and (KioskCountEdit.Tag <> KioskCountEdit.EditingValue) then
        vMessage := Format('%s 매장에 포스 %d대 -> %d대, 키오스크 %d대 -> %d대로 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, PosCountEdit.Tag, vPos, KioskCountEdit.Tag, vKiosk, LicenseNoEdit.Hint]);
    end;
    if vMessage = '' then
    begin
      MsgBox('포스 또는 키오스크 수량이 변경이 없으면'#13'인증요청을 안해도 됩니다');
      Exit;
    end;
  end;
  vMessage := 'POS 알림 메시지입니다'#13#13+vMessage+#13#13+Format('본 알림톡은 %s의 관리자에게만 보내는 서비스 입니다.',[PartnerNameEdit.Text]);
  if DM.ExecSmsProcedure(Format('CALL PROC_KAKAOSEND(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ?) ',
                              ['AA000001',
                               'P',
                               'POS 알림 메시지입니다',
                               vMessage,
                               '15444171',
                               GetOnlyNumber(vPartnerTel),
                               vSendDate]), '인증요청') then
  begin
    Exec_Timer.Tag     := 0;
    Exec_Timer.Enabled := true;
    TimeLabel.Visible  := true;
    PosCountEdit.Properties.ReadOnly   := true;
    KioskCountEdit.Properties.ReadOnly := true;
  end;
end;

procedure TStoreStoreForm.MenuRestoreButtonClick(Sender: TObject);
var vURL :String;
begin
  inherited;
  if not AskBox('현재 메뉴정보를 어제 백업데이터로 복원하시겠습니까?') then Exit;

  vURL := GetRestDBURL(CompanyCode);

  try
    OpenQuery('select Count(*) '
             +'  from MS_MENU_BACKUP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [CompanyCode,
              CustomerCodeEdit.Text], false, vURL);
    if not Query.Fields[0].AsInteger = 0 then
    begin
      MsgBox('복원 할 데이터가 없습니다');
      Exit;
    end;
  finally
    Query.Close;
  end;


  ExecQuery('delete from MS_MENU_ITEM '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL);

  ExecQuery('insert into MS_MENU_ITEM(CD_HEAD, '
           +'                         CD_STORE, '
           +'                         CD_MENU, '
           +'                         CD_ITEM, '
           +'                         SEQ, '
           +'                         DT_CHANGE) '
           +'                  SELECT CD_HEAD, '
           +'                         CD_STORE, '
           +'                         CD_MENU, '
           +'                         CD_ITEM, '
           +'                         SEQ, '
           +'                         DT_CHANGE '
           +'                   from  MS_MENU_ITEM_BACKUP '
           +'                  where  CD_HEAD  =:P0 '
           +'                    and  CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL);

  ExecQuery('delete from MS_COURSE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL);

  ExecQuery('insert into MS_COURSE(CD_HEAD, '
           +'                      CD_STORE, '
           +'                      CD_MENU, '
           +'                      COURSE_SEQ, '
           +'                      SEQ, '
           +'                      NM_COURSE, '
           +'                      CNT_CHOOSE, '
           +'                      CD_MENU_COURSE, '
           +'                      DS_CHOOSE, '
           +'                      NM_MENU_COURSE, '
           +'                      YN_DEFAULT, '
           +'                      COLOR, '
           +'                      COLOR_HEX, '
           +'                      CD_SAWON_CHG, '
           +'                      DT_CHANGE) '
           +'               SELECT CD_HEAD, '
           +'                      CD_STORE, '
           +'                      CD_MENU, '
           +'                      COURSE_SEQ, '
           +'                      SEQ, '
           +'                      NM_COURSE, '
           +'                      CNT_CHOOSE, '
           +'                      CD_MENU_COURSE, '
           +'                      DS_CHOOSE, '
           +'                      NM_MENU_COURSE, '
           +'                      YN_DEFAULT, '
           +'                      COLOR, '
           +'                      COLOR_HEX, '
           +'                      CD_SAWON_CHG, '
           +'                      DT_CHANGE '
           +'                from  MS_COURSE_BACKUP '
           +'               where  CD_HEAD  =:P0 '
           +'                 and  CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL);

  ExecQuery('delete from MS_MENU '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL);

  if ExecQuery('insert into MS_MENU(CD_HEAD, '
           +'                    CD_STORE, '
           +'                    CD_MENU, '
           +'                    NM_MENU, '
           +'                    NM_MENU_SHORT, '
           +'                    NM_SPEC, '
           +'                    CD_CLASS, '
           +'                    DS_MENU_TYPE, '
           +'                    OPTIONS, '
           +'                    QTY_UNIT, '
           +'                    QTY_SELECT, '
           +'                    PR_BUY, '
           +'                    PR_SALE, '
           +'                    PR_SALE_DOUBLE, '
           +'                    PR_SALE_PROFIT, '
           +'                    PR_TIP, '
           +'                    PR_SALE_PACKING, '
           +'                    CONFIG, '
           +'                    DS_TAX, '
           +'                    CD_PRINTER, '
           +'                    NO_GROUP, '
           +'                    DS_KITCHEN, '
           +'                    BILL_SEQ, '
           +'                    NO_MENU, '
           +'                    CD_TRDPL, '
           +'                    DS_STOCK, '
           +'                    QTY_SAFETY, '
           +'                    QTY_ORDER, '
           +'                    CD_CORNER, '
           +'                    SAVE_STAMP, '
           +'                    USE_STAMP, '
           +'                    YN_USE, '
           +'                    CD_SAWON_CHG, '
           +'                    PRG_CHANGE, '
           +'                    PRG_INSERT, '
           +'                    DT_INSERT, '
           +'                    DT_CHANGE) '
           +'         select     CD_HEAD, '
           +'                    CD_STORE, '
           +'                    CD_MENU, '
           +'                    NM_MENU, '
           +'                    NM_MENU_SHORT, '
           +'                    NM_SPEC, '
           +'                    CD_CLASS, '
           +'                    DS_MENU_TYPE, '
           +'                    OPTIONS, '
           +'                    QTY_UNIT, '
           +'                    QTY_SELECT, '
           +'                    PR_BUY, '
           +'                    PR_SALE, '
           +'                    PR_SALE_DOUBLE, '
           +'                    PR_SALE_PROFIT, '
           +'                    PR_TIP, '
           +'                    PR_SALE_PACKING, '
           +'                    CONFIG, '
           +'                    DS_TAX, '
           +'                    CD_PRINTER, '
           +'                    NO_GROUP, '
           +'                    DS_KITCHEN, '
           +'                    BILL_SEQ, '
           +'                    NO_MENU, '
           +'                    CD_TRDPL, '
           +'                    DS_STOCK, '
           +'                    QTY_SAFETY, '
           +'                    QTY_ORDER, '
           +'                    CD_CORNER, '
           +'                    SAVE_STAMP, '
           +'                    USE_STAMP, '
           +'                    YN_USE, '
           +'                    CD_SAWON_CHG, '
           +'                    PRG_CHANGE, '
           +'                    PRG_INSERT, '
           +'                    DT_INSERT, '
           +'                    DT_CHANGE '
           +'             from   MS_MENU_BACKUP '
           +'            where   CD_HEAD =:P0 '
           +'              and   CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], true, vURL) then
  MsgBox('복원이 완료되었습니다');
end;

procedure TStoreStoreForm.OKButtonClick(Sender: TObject);
var vSendDate,
    vMessage,
    vPartnerTel :String;
    vPos, vKiosk :Integer;
    vTelList :TStringList;
    vCode : PStrPointer;
    vIndex :Integer;
begin
  inherited;
  vPartnerTel := AuthComboBox.Text;
  if not AskBox(Format('%s 번호로 인증번호를 요청합니다',[GetPhoneNo(vPartnerTel)])) then Exit;

  vSendDate := FormatDateTime('yyyy-mm-dd hh:nn:ss', now());
  PosCountEdit.PostEditValue;
  KioskCountEdit.PostEditValue;
  if StatusComboBox.EditModified and (GetStrPointerData(StatusComboBox) = '0') then
  begin
    if isNew and (GetStrPointerData(StatusComboBox) = '0') then
    begin
      if not AskBox('데모기간 없이 프로그램을 사용하시겠습니까?'#13'데모용으로 변경은 불가능합니다') then Exit;
    end;
    vPos   := PosCountEdit.EditingValue;
    vKiosk := KioskCountEdit.EditingValue;
    if (vPos > 0) and (vKiosk = 0) then
      vMessage := Format('%s 매장에 포스 %d대 인증완료를 요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, LicenseNoEdit.Hint])
    else if (vPos = 0) and (vKiosk > 0) then
      vMessage := Format('%s 매장에 키오스크 %d대 인증완료를 요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vKiosk, LicenseNoEdit.Hint])
    else if (vPos > 0) and (vKiosk > 0) then
      vMessage := Format('%s 매장에 포스 %d대, 키오스크 %d대 인증완료를 요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, vKiosk, LicenseNoEdit.Hint]);
  end
  else if StatusComboBox.EditModified and (GetStrPointerData(StatusComboBox) = '1') then
  begin
    vMessage := Format('%s 매장에 사용해지를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, LicenseNoEdit.Hint]);
    vMessage := 'POS 알림 메시지입니다'#13#13+vMessage+#13#13+Format('본 알림톡은 %s의 관리자에게만 보내는 서비스 입니다.',[PartnerNameEdit.Text]);
  end
  else
  begin
    vPos   := PosCountEdit.EditingValue;
    vKiosk := KioskCountEdit.EditingValue;
    if isNew then
    begin
      if (PosCountEdit.EditingValue > 0) and (KioskCountEdit.EditingValue = 0) then
        vMessage := Format('%s 매장에 포스 %d대를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, LicenseNoEdit.Hint])
      else if (PosCountEdit.EditingValue = 0) and (KioskCountEdit.EditingValue > 0) then
        vMessage := Format('%s 매장에 키오스크 %d대를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vKiosk, LicenseNoEdit.Hint])
      else if (PosCountEdit.EditingValue > 0) and (KioskCountEdit.EditingValue > 0) then
        vMessage := Format('%s 매장에 포스 %d대, 키오스크 %d대를 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, vPos, vKiosk, LicenseNoEdit.Hint]);
    end
    else
    begin
      if (PosCountEdit.Tag <> PosCountEdit.EditingValue) and (KioskCountEdit.Tag = KioskCountEdit.EditingValue) then
        vMessage := Format('%s 매장에 포스 %d대 -> %d대로 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, PosCountEdit.Tag, vPos, LicenseNoEdit.Hint])
      else if (PosCountEdit.Tag = PosCountEdit.EditingValue) and (KioskCountEdit.Tag <> KioskCountEdit.EditingValue ) then
        vMessage := Format('%s 매장에 키오스크 %d대 ->%d대로 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, KioskCountEdit.Tag, vKiosk, LicenseNoEdit.Hint])
      else if (PosCountEdit.Tag <> PosCountEdit.EditingValue) and (KioskCountEdit.Tag <> KioskCountEdit.EditingValue) then
        vMessage := Format('%s 매장에 포스 %d대 -> %d대, 키오스크 %d대 -> %d대로 인증요청합니다 - 인증번호 [%s] ',[CustomerNameEdit.Text, PosCountEdit.Tag, vPos, KioskCountEdit.Tag, vKiosk, LicenseNoEdit.Hint]);
    end;
    if vMessage = '' then
    begin
      MsgBox('포스 또는 키오스크 수량이 변경이 없으면'#13'인증요청을 안해도 됩니다');
      Exit;
    end;
  end;
  vMessage := 'POS 알림 메시지입니다'#13#13+vMessage+#13#13+Format('본 알림톡은 %s의 관리자에게만 보내는 서비스 입니다.',[PartnerNameEdit.Text]);
  if DM.ExecSmsProcedure(Format('CALL PROC_KAKAOSEND(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ?) ',
                              ['AA000001',
                               'P',
                               'POS 알림 메시지입니다',
                               vMessage,
                               '15444171',
                               GetOnlyNumber(vPartnerTel),
                               vSendDate]), '인증요청') then
  begin
    Exec_Timer.Tag     := 0;
    Exec_Timer.Enabled := true;
    TimeLabel.Visible  := true;
    PosCountEdit.Properties.ReadOnly   := true;
    KioskCountEdit.Properties.ReadOnly := true;
  end;
end;

procedure TStoreStoreForm.PartnerCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '협력사조회';
      GridTableViewCode.Caption  := '협력사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '협력사 이름';
      GridTableViewName1.Width   := 320;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_PARTNER, '
                   +'       NM_PARTNER, '
                   +'       DISCERN '
                   +'  from PARTNER '
                   +' where NM_PARTNER  like ConCat(''%'',:P2,''%'') '
                   +'   and YN_USE = ''Y'' '
                   +'order by CD_PARTNER';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        PartnerCodeEdit.Text    := Code;
        PartnerNameEdit.Text    := Names[0];
        PartnerNameEdit.Hint    := Names[1];
        PartnerPrefix           := Names[1];
        isChanged := true;

        if isNew then
        begin
          OpenQuery('select Ifnull(Max(CD_CUSTOMER),0) '
                   +'  from CUSTOMER '
                   +' where Left(CD_CUSTOMER,2) = :P0 '
                   +'   and Length(CD_CUSTOMER) = 8 ',
                   [PartnerNameEdit.Hint],false,RestBaseURL);

          if Query.Fields[0].AsString = '0' then
            CustomerCodeEdit.Text := PartnerNameEdit.Hint + '000001'
          else
            CustomerCodeEdit.Text := PartnerNameEdit.Hint + FormatFloat('000000', StrToInt(Copy(Query.Fields[0].AsString,3,6))+1);
          CustomerCodeEdit.TextHint := CustomerCodeEdit.Text;
          Query.Close;
          CustomerNameEdit.SetFocus;
        end;
      end;
    finally
      Free;
    end;
end;

procedure TStoreStoreForm.PosPluRestoreButtonClick(Sender: TObject);
var vURL :String;
begin
  inherited;
  if not AskBox('현재 PLU정보를 어제 백업데이터로 복원하시겠습니까?') then Exit;

  vURL := GetRestDBURL(CompanyCode);

  if Sender = PosPluRestoreButton then
  begin
    try
      OpenQuery('select Count(*) '
               +'  from MS_LARGE_BACKUP '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_GUBUN not in (''98'',''99'')',
               [CompanyCode,
                CustomerCodeEdit.Text], false, vURL);
      if not Query.Fields[0].AsInteger = 0 then
      begin
        MsgBox('복원 할 데이터가 없습니다');
        Exit;
      end;
    finally
      Query.Close;
    end;


    if ExecQuery('delete from MS_LARGE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN not in (''98'',''99'');'
             +'insert into MS_LARGE (CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE) '
             +' select CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE '
             +'  from MS_LARGE_BACKUP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN not in (''98'',''99'');'
             +'delete from MS_SMALL '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN not in (''98'',''99'');'
             +'insert into MS_SMALL (CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE) '
             +'select CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE '
             +'  from MS_SMALL_BACKUP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN not in (''98'',''99'');',
             [CompanyCode,
              CustomerCodeEdit.Text], true, vURL) then
    MsgBox('복원이 완료되었습니다');
  end
  else
  begin
    try
      OpenQuery('select Count(*) '
               +'  from MS_KIOSK_LARGE_BACKUP '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 ',
               [CompanyCode,
                CustomerCodeEdit.Text], false, vURL);
      if not Query.Fields[0].AsInteger = 0 then
      begin
        MsgBox('복원 할 데이터가 없습니다');
        Exit;
      end;
    finally
      Query.Close;
    end;


    if ExecQuery('delete from MS_KIOSK_LARGE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1; '
             +'insert into MS_KIOSK_LARGE (CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE) '
             +' select CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE '
             +'  from MS_KIOSK_LARGE_BACKUP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1; '
             +'delete from MS_KIOSK_SMALL '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1; '
             +'insert into MS_KIOSK_SMALL (CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE) '
             +'select CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE '
             +'  from MS_KIOSK_SMALL_BACKUP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1;',
             [CompanyCode,
              CustomerCodeEdit.Text], true, vURL) then
    MsgBox('복원이 완료되었습니다');
  end;
end;

procedure TStoreStoreForm.ProgramAuthInitButtonClick(Sender: TObject);
var vURL :String;
begin
  inherited;
  if not AskBox('매장의 프로그램 권한을 초기화 하시겠습니까?') then Exit;

  vURL := GetRestDBURL(CompanyCode);

  ExecQuery('delete from MS_PRG_MENU '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1;',
           [CompanyCode,
            CustomerCodeEdit.Text],false, vURL);

  ExecQuery('insert into MS_PRG_MENU(CD_HEAD, '
           +'                        CD_STORE, '
           +'                        CD_CODE, '
           +'                        ACT_CODE) '
           +'                select  :P0, '
           +'                        :P1, '
           +'                         CD_CODE, '
           +'                         ACT_CODE '
           +'                  from   MS_PRG_MENU '
           +'                 where   CD_HEAD  = ''00000000'' '
           +'                   and   CD_STORE = ''00000000'' '
           +'							      and   Left(ACT_CODE,4) <> ''Head'';',
           [CompanyCode,
            CustomerCodeEdit.Text],true, vURL);

  MsgBox('초기화가 완료 되었습니다');
end;

procedure TStoreStoreForm.PWDEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key in ['0'..'9']) or (Key = #8) then
  else
    Key := #0;
end;

procedure TStoreStoreForm.RustDeskPageShow(Sender: TObject);
begin
  inherited;
  RustDeskShow;
end;

procedure TStoreStoreForm.RustDeskShow;
var vURL :String;
begin
  vURL := GetRestDBURL(CompanyCode);
  OpenQuery('select NM_CODE1  as NO_POS, '
           +'       GetOnlyNumber(NM_CODE21) as RUSTDESK_ID, '
           +'       case NM_CODE3 when ''0'' then ''정산포스'' '
           +'                     when ''1'' then ''주문포스'' '
           +'                     when ''2'' then ''키오스크'' '
           +'                     when ''3'' then ''셀프대기'' '
           +'                     when ''4'' then ''주방모니터'' '
           +'                     when ''5'' then ''스마트패드'' '
           +'                     when ''6'' then ''DID'' '
           +'       end as DEVICE '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  =''01'' '
           +'   and NM_CODE3 <> ''7'' '
           +'union all '
           +'select cast(NO_TABLE as char), '
           +'       GetOnlyNumber(RUSTDESK_ID), '
           +'       ''Tablet'' '
           +'  from MS_TABLE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and NO_TABLE > 0 '
           +'   and Ifnull(RUSTDESK_ID,'''') <> '''' ',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL);
  DM.ReadQuery(Query, GridTableView1);
end;

procedure TStoreStoreForm.TableRestoeButtonClick(Sender: TObject);
var vURL :String;
begin
  inherited;
  if not AskBox('현재 테이블정보를 어제 백업데이터로 복원하시겠습니까?') then Exit;

  vURL := GetRestDBURL(CompanyCode);

  try
    OpenQuery('select Count(*) '
             +'  from MS_TABLE_BACKUP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [CompanyCode,
              CustomerCodeEdit.Text], false, vURL);
    if not Query.Fields[0].AsInteger = 0 then
    begin
      MsgBox('복원 할 데이터가 없습니다');
      Exit;
    end;
  finally
    Query.Close;
  end;

  ExecQuery('delete from MS_TABLE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL);

  if ExecQuery('insert into MS_TABLE(CD_HEAD, '
           +'                     CD_STORE, '
           +'                     NO_TABLE, '
           +'                     SEQ, '
           +'                     CD_FLOOR, '
           +'                     TABLE_STYLE, '
           +'                     NM_TABLE, '
           +'                     CHAIR_COUNT, '
           +'                     NO_LEFT, '
           +'                     NO_TOP, '
           +'                     NO_HEIGHT, '
           +'                     NO_WIDTH, '
           +'                     NO_TABLE_GROUP, '
           +'                     COLOR, '
           +'                     NUMBER_COLOR, '
           +'                     FONT_COLOR, '
           +'                     BOTTOM_COLOR, '
           +'                     BORDER_COLOR, '
           +'                     COLOR_HEX, '
           +'                     NUMBER_COLOR_HEX, '
           +'                     FONT_COLOR_HEX, '
           +'                     BORDER_COLOR_HEX, '
           +'                     NO_RFID, '
           +'                     YN_PACKING, '
           +'                     YN_TABLET, '
           +'                     YN_DELIVERY, '
           +'                     CD_GROUP, '
           +'                     LETSORDER_URL, '
           +'                     OPTIONS, '
           +'                     DT_ACCT_LAST, '
           +'                     CD_SAWON_CHG, '
           +'                     DT_CHANGE) '
           +'              SELECT CD_HEAD, '
           +'                     CD_STORE, '
           +'                     NO_TABLE, '
           +'                     SEQ, '
           +'                     CD_FLOOR, '
           +'                     TABLE_STYLE, '
           +'                     NM_TABLE, '
           +'                     CHAIR_COUNT, '
           +'                     NO_LEFT, '
           +'                     NO_TOP, '
           +'                     NO_HEIGHT, '
           +'                     NO_WIDTH, '
           +'                     NO_TABLE_GROUP, '
           +'                     COLOR, '
           +'                     NUMBER_COLOR, '
           +'                     FONT_COLOR, '
           +'                     BOTTOM_COLOR, '
           +'                     BORDER_COLOR, '
           +'                     COLOR_HEX, '
           +'                     NUMBER_COLOR_HEX, '
           +'                     FONT_COLOR_HEX, '
           +'                     BORDER_COLOR_HEX, '
           +'                     NO_RFID, '
           +'                     YN_PACKING, '
           +'                     YN_TABLET, '
           +'                     YN_DELIVERY, '
           +'                     CD_GROUP, '
           +'                     LETSORDER_URL, '
           +'                     OPTIONS, '
           +'                     DT_ACCT_LAST, '
           +'                     CD_SAWON_CHG, '
           +'                     DT_CHANGE '
           +'               from  MS_TABLE_BACKUP '
           +'              where  CD_HEAD  =:P0 '
           +'                and  CD_STORE =:P1;',
           [CompanyCode,
            CustomerCodeEdit.Text], false, vURL) then
  MsgBox('복원이 완료되었습니다');
end;

procedure TStoreStoreForm.SaleDataDeleteButtonClick(Sender: TObject);
var vURL :String;
begin
  inherited;
  if IncDay(SetupDateEdit.CurrentDate, 30) < Now() then
  begin
    MsgBox('설치된지 30일이상 매장은 본사에 권한이 필요합니다');
    with TProxyCheckForm.Create(self) do
      try
        if ShowModal <> mrOK then
          Exit;
         if ChooseUserLevel <> 'E' then Exit;
      finally
        Free;
      end;
  end;

  if not AskBox('매출데이터 전체가 삭제됩니다'#13'매출데이터를 삭제하시겠습니까?') then Exit;
  if not AskBox('삭제 된 데이터는 복구할 수 없습니다'#13'삭제하시겠습니까?') then Exit;

  vURL := GetRestDBURL(CompanyCode);
  try
    ExecQuery('insert into MS_TRIGGER_EXISTS(CD_STORE, YN_TRIGGER, DT_CHANGE) '
             +'                       VALUES(:P0, ''Y'', NOW()) '
             +'              ON DUPLICATE KEY UPDATE  YN_TRIGGER = ''Y'';',
             [CustomerCodeEdit.Text],true, vURL);

    if DM.ExecProcedure(Format('CALL DELETE_DATA(''%s'', ''%s'', ''S'', ?) ',
                             [CompanyCode,
                              CustomerCodeEdit.Text]),vURL) then
    begin
      MsgBox('삭제가 완료되었습니다'#13'반드시 포스에서 ClearDB를 실행해야합니다');
    end;
  finally
    ExecQuery('delete from MS_TRIGGER_EXISTS '
             +' where CD_STORE = :P0; ',
             [CustomerCodeEdit.Text], true, vURL);
  end;
end;

procedure TStoreStoreForm.SetPartnerComboBox(aPartnerCode,aType:String);
var
  vCode : PStrPointer;
begin
  try
    LocalComboBox.Properties.Items.Clear;
    ManagerComboBox.Properties.Items.Clear;
    UpjongComboBox.Properties.Items.Clear;
    SizeComboBox.Properties.Items.Clear;
    VanComboBox.Properties.Items.Clear;

    if aType = 'C' then
    begin
      New(vCode);
      vCode^.Data := '';
      ConditionLocalComboBox.Properties.Items.AddObject('전체', TObject(vCode));
      ConditionManagerComboBox.Properties.Items.AddObject('전체', TObject(vCode));
      ConditionUpjongComboBox.Properties.Items.AddObject('전체', TObject(vCode));
      ConditionSizeComboBox.Properties.Items.AddObject('전체', TObject(vCode));
      ConditionVanComboBox.Properties.Items.AddObject('전체', TObject(vCode));
    end;


    Query.Close;
    OpenQuery('select DS_CODE, '
             +'       CD_CODE, '
             +'       NM_CODE1 '
             +'  from CODE '
             +' where CD_PARTNER = :P0 '
             +'   and DS_CODE in (''01'',''02'',''03'',''04'',''05'') '
             +'   and DS_STATUS  =''0'' '
             +' order by DS_CODE, CD_CODE ',
             [aPartnerCode],false,RestBaseURL);
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[1].AsString;
      if Query.Fields[0].AsString = '01' then
        LocalComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode))
      else if Query.Fields[0].AsString = '02' then
        ManagerComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode))
      else if Query.Fields[0].AsString = '03' then
        UpjongComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode))
      else if Query.Fields[0].AsString = '04' then
        SizeComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode))
      else if Query.Fields[0].AsString = '05' then
        VanComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  try
    SubPartnerComboBox.Properties.Items.Clear;
    Query.Close;
    OpenQuery('select CD_PARTNER_SUB, '
             +'       NM_PARTNER '
             +'  from PARTNER_SUB '
             +' where CD_PARTNER = :P0 '
             +'   and YN_USE  =''Y'' '
             +' order by CD_PARTNER_SUB ',
             [aPartnerCode],false,RestBaseURL);
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      SubPartnerComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TStoreStoreForm.ShowHistory;
begin
  OpenQuery('select DT_HIST, '
           +'       DS_HIST, '
           +'       NM_CUSTOMER, '
           +'       CD_COMPANY, '
           +'       CD_PARTNER, '
           +'       CEO_NAME, '
           +'       BIZ_NO, '
           +'       TEL_OFFICE, '
           +'       TEL_MOBILE, '
           +'       ADDR1, '
           +'       ADDR2, '
           +'       ALLOW_POS, '
           +'       ALLOW_KIOSK, '
           +'       ALLOW_MENUCOUNT, '
           +'       REMARK, '
           +'       DS_STATUS, '
           +'       ID_USER, '
           +'       DS_LICENSE, '
           +'       AMT_ASP, '
           +'       OPTIONS, '
           +'       YN_POSUPDATE '
           +'  from CUSTOMER_HIST '
           +' where CD_CUSTOMER =:P0 '
           +' order by DT_HIST desc ',
           [CustomerCodeEdit.Text],false,RestBaseURL);
  DM.ReadQuery(Query, HistoryGridTableView);
end;

procedure TStoreStoreForm.SyncButtonClick(Sender: TObject);
var vOption, vPrefix :String;
    vURL :String;
begin
  inherited;
  if (Sender <> nil) and not AskBox('선택한 자료를 모두 삭제 후 동기화합니다'#13'계속하시겠습니까?') then Exit;

  DM.OpenQuery('select MEMBER_PREFIX '
              +'  from CUSTOMER '
              +' where CD_COMPANY = :P0 ',
              [CustomerCodeEdit.Text],false,RestBaseURL);
  if not DM.Query.Eof then
    vPrefix := DM.Query.Fields[0].AsString;
  DM.Query.Close;

  vURL := GetRestDBURL(CompanyCode);
  if vURL = '' then Exit;


  //등록이 아직 안된 매장일때
  try
    DM.OpenQuery('select CD_STORE '
                +'  from MS_STORE '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 ',
                [CompanyCode,
                 CustomerCodeEdit.Text],false,vURL);
    if DM.Query.Eof then
    begin
      vOption := IntToStr(Option1RadioGroup.ItemIndex)
                +ifthen(Option2CheckBox.Checked,'1','0')
                +ifthen(Option3CheckBox.Checked,'1','0')
                +ifthen(Option4CheckBox.Checked,'1','0')
                +ifthen(Option5CheckBox.Checked,'1','0')
                +ifthen(Option6CheckBox.Checked,'1','0')
                +ifthen(Option7CheckBox.Checked,'1','0')
                +ifthen(Option8CheckBox.Checked,'1','0')
                +ifthen(Option9CheckBox.Checked,'1','0');

      DM.ExecProcedure(Format('CALL STORE_COPY(''%s'', ''%s'', ''%s'', ?) ',
                             [CompanyCode,
                              CustomerCodeEdit.Text,
                              vOption]),vURL);
    end;
  finally
    DM.Query.Close;
  end;

  if isNew then
    ExecQuery('update MS_STORE '
             +'   set MEMBER_PREFIX = :P2, '
             +'       OPTIONS       = ConCat(Left(OPTIONS,402),:P3,Substring(OPTIONS,404,Length(OPTIONS)-402)) '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1;',
             [CompanyCode,
              CustomerCodeEdit.Text,
              vPrefix,
              Copy(CompanyOption,4,1)],false,vURL);

  if SyncCheckGroup.States[0] = cbsChecked then
  begin
    ExecQuery('delete from MS_MENU_CLASS where CD_HEAD =:P0 and CD_STORE =:P1;',
             [CompanyCode,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU_CLASS(CD_HEAD, CD_STORE, CD_CLASS, NM_CLASS, DS_STATUS) '
             +'                   select CD_HEAD, '
             +'                          :P2, '
             +'                          CD_CLASS, '
             +'                          NM_CLASS, '
             +'                          DS_STATUS '
             +'                     from MS_MENU_CLASS '
             +'                    where CD_HEAD  =:P0 '
             +'                      and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);
  end;

  if SyncCheckGroup.States[1] = cbsChecked then
  begin
    ExecQuery('delete from MS_MENU         where CD_HEAD =:P0 and CD_STORE =:P1; '
             +'delete from MS_MENU_HIST    where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_MENU_ITEM    where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_MENU_SET     where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_MENU_OPEN    where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_COURSE       where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_MENU_GROUP   where CD_HEAD =:P0 and CD_STORE =:P1;',
             [CompanyCode,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU(CD_HEAD, '
             +'                    CD_STORE, '
             +'                    CD_MENU, '
             +'                    NM_MENU, '
             +'                    NM_MENU_SHORT, '
             +'                    NM_SPEC, '
             +'                    DS_MENU_TYPE, '
             +'                    PR_BUY, '
             +'                    PR_SALE, '
             +'                    DS_TAX, '
             +'                    CD_CLASS, '
             +'                    CD_TRDPL,  '
             +'                    PRG_INSERT, '
             +'                    PRG_CHANGE, '
             +'                    PR_SALE_PROFIT, '
             +'                    CD_PRINTER, '
             +'                    OPTIONS) '
             +'             select CD_HEAD, '
             +'                    :P2, '
             +'                    CD_MENU, '
             +'                    NM_MENU, '
             +'                    NM_MENU_SHORT, '
             +'                    NM_SPEC, '
             +'                    DS_MENU_TYPE, '
             +'                    PR_BUY, '
             +'                    PR_SALE, '
             +'                    DS_TAX, '
             +'                    CD_CLASS, '
             +'                    CD_TRDPL,  '
             +'                    ''표준'', '
             +'                    ''표준'', '
             +'                    PR_SALE_PROFIT, '
             +'                    CD_PRINTER, '
             +'                    OPTIONS '
             +'               from MS_MENU '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU_ITEM(CD_HEAD, CD_STORE, CD_MENU, CD_ITEM, SEQ) '
             +'                   select CD_HEAD, '
             +'                          :P2, '
             +'                          CD_MENU, '
             +'                          CD_ITEM, '
             +'                          SEQ '
             +'                     from MS_MENU_ITEM '
             +'                    where CD_HEAD  =:P0 '
             +'                      and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU_OPEN(CD_HEAD, CD_STORE, CD_MENU, CD_MENU_SET, QTY_SET, SEQ, COLOR, COLOR_HEX) '
             +'                   select CD_HEAD, '
             +'                          :P2, '
             +'                          CD_MENU, '
             +'                          CD_MENU_SET, '
             +'                          QTY_SET, '
             +'                          SEQ, '
             +'                          COLOR, '
             +'                          COLOR_HEX '
             +'                     from MS_MENU_OPEN '
             +'                    where CD_HEAD  =:P0 '
             +'                      and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU_MEMO(CD_HEAD, CD_STORE, CD_MENU, CD_MEMO) '
             +'                   select CD_HEAD, '
             +'                          :P2, '
             +'                          CD_MENU, '
             +'                          CD_MEMO '
             +'                     from MS_MENU_MEMO '
             +'                    where CD_HEAD  =:P0 '
             +'                      and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU_SET(CD_HEAD, CD_STORE, CD_MENU, CD_MENU_SET, QTY_SET, SEQ) '
             +'               select CD_HEAD, '
             +'                      :P2, '
             +'                      CD_MENU, '
             +'                      CD_MENU_SET, '
             +'                      QTY_SET, '
             +'                      SEQ '
             +'                 from MS_MENU_SET '
             +'                where CD_HEAD   =:P0 '
             +'                   and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU_GROUP(CD_HEAD, CD_STORE, CD_MENU, CD_MENU_SET, QTY_SET, SEQ, COLOR, COLOR_HEX) '
             +'                   select CD_HEAD, '
             +'                          :P2, '
             +'                          CD_MENU, '
             +'                          CD_MENU_SET, '
             +'                          QTY_SET, '
             +'                          SEQ, '
             +'                          COLOR, '
             +'                          COLOR_HEX '
             +'                     from MS_MENU_GROUP '
             +'                    where CD_HEAD  =:P0 '
             +'                      and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_COURSE(CD_HEAD, CD_STORE, CD_MENU, COURSE_SEQ, SEQ, NM_COURSE, CNT_CHOOSE, CD_MENU_COURSE, NM_MENU_COURSE, YN_DEFAULT, COLOR, COLOR_HEX) '
             +'                   select CD_HEAD, '
             +'                          :P2, '
             +'                          CD_MENU, '
             +'                          COURSE_SEQ, '
             +'                          SEQ, '
             +'                          NM_COURSE, '
             +'                          CNT_CHOOSE, '
             +'                          CD_MENU_COURSE, '
             +'                          NM_MENU_COURSE, '
             +'                          YN_DEFAULT, '
             +'                          COLOR, '
             +'                          COLOR_HEX '
             +'                     from MS_COURSE '
             +'                    where CD_HEAD  =:P0 '
             +'                      and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);
  end;

  //포스디자인
  if SyncCheckGroup.States[2] = cbsChecked then
  begin
    ExecQuery('delete from MS_CODE where CD_HEAD =:P0 and CD_STORE =:P1 and CD_KIND = ''84'' ;',
             [CompanyCode,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
             +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18) '
             +'             select CD_HEAD, :P2, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
             +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18 '
             +'               from MS_CODE '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1 '
             +'                and CD_KIND = ''84'';',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);
  end;

  //PLU
  if SyncCheckGroup.States[3] = cbsChecked then
  begin
    ExecQuery('delete from MS_LARGE where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_SMALL where CD_HEAD =:P0 and CD_STORE =:P1;',
             [CompanyCode,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_LARGE(CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX,YN_BLOCKING) '
             +'              select CD_HEAD, '
             +'                     :P2, '
             +'                     CD_GUBUN, '
             +'                     CD_LARGE, '
             +'                     NM_LARGE, '
             +'                     NO_POSITION, '
             +'                     COLOR, '
             +'                     COLOR_HEX, '
             +'                     YN_BLOCKING '
             +'               from MS_LARGE '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_SMALL(CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX,YN_BLOCKING) '
             +'              select CD_HEAD, '
             +'                     :P2, '
             +'                     CD_GUBUN, '
             +'                     CD_LARGE, '
             +'                     NO_POSITION, '
             +'                     CD_MENU, '
             +'                     NM_VIEW, '
             +'                     COLOR, '
             +'                     COLOR_HEX, '
             +'                     YN_BLOCKING '
             +'               from MS_SMALL '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

  end;

  //키오스크디자인
  if SyncCheckGroup.States[4] = cbsChecked then
  begin
    ExecQuery('delete from MS_CODE where CD_HEAD =:P0 and CD_STORE =:P1 and CD_KIND in (''84'',''85'');',
             [CompanyCode,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
             +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18) '
             +'             select CD_HEAD, :P2, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
             +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18 '
             +'               from MS_CODE '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1 '
             +'                and CD_KIND in (''84'',''85'');',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);
  end;

  //키오스크 PLU
  if SyncCheckGroup.States[5] = cbsChecked then
  begin
    ExecQuery('delete from MS_KIOSK_LARGE where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_KIOSK_SMALL where CD_HEAD =:P0 and CD_STORE =:P1;'
             +'delete from MS_MENU_IMAGE  where CD_HEAD =:P0 and CD_STORE =:P1;',
             [CompanyCode,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_KIOSK_LARGE(CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX,YN_BLOCKING) '
             +'              select CD_HEAD, '
             +'                     :P2, '
             +'                     CD_GUBUN, '
             +'                     CD_LARGE, '
             +'                     NM_LARGE, '
             +'                     NO_POSITION, '
             +'                     COLOR, '
             +'                     COLOR_HEX, '
             +'                     YN_BLOCKING '
             +'               from MS_KIOSK_LARGE '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_KIOSK_SMALL(CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX,YN_BLOCKING) '
             +'              select CD_HEAD, '
             +'                     :P2, '
             +'                     CD_GUBUN, '
             +'                     CD_LARGE, '
             +'                     NO_POSITION, '
             +'                     CD_MENU, '
             +'                     NM_VIEW, '
             +'                     COLOR, '
             +'                     COLOR_HEX, '
             +'                     YN_BLOCKING '
             +'               from MS_KIOSK_SMALL '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);

    ExecQuery('insert into MS_MENU_IMAGE(CD_HEAD, CD_STORE, CD_MENU, IMG_MENU, DT_CHANGE, DT_INSERT) '
             +'              select CD_HEAD, '
             +'                     :P2, '
             +'                     CD_MENU, '
             +'                     IMG_MENU, '
             +'                     DT_CHANGE, '
             +'                     DT_INSERT '
             +'               from MS_MENU_IMAGE '
             +'              where CD_HEAD  =:P0 '
             +'                and CD_STORE =:P1;',
             [CompanyCode,
              StandardStore,
              CustomerCodeEdit.Text],false,vURL);
  end;

  //포스수량이 0일때
  if (Sender = nil)  and (PosCountEdit.Value = 0) then
    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =''01'';',
             [CompanyCode,
              CustomerCodeEdit.Text],false,vURL);

  try
    Screen.Cursor := crHourGlass;
    if ExecQuery('',[],true, vURL) then
    begin
      if Sender <> nil then
        MsgBox('동기화 작업이 완료되었습니다');
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TStoreStoreForm.SyncPageShow(Sender: TObject);
begin
  inherited;
  if Option1RadioGroup.ItemIndex > 0 then
  begin
    SyncCheckGroup.States[0] := cbsChecked;
    SyncCheckGroup.States[1] := cbsChecked;
  end
  else
  begin
    SyncCheckGroup.States[0] := cbsUnChecked;
    SyncCheckGroup.States[1] := cbsUnChecked;
  end;

  if Option3CheckBox.Checked then
    SyncCheckGroup.States[2] := cbsChecked
  else
    SyncCheckGroup.States[2] := cbsUnChecked;

  if Option2CheckBox.Checked then
    SyncCheckGroup.States[3] := cbsChecked
  else
    SyncCheckGroup.States[3] := cbsUnChecked;

  if Option7CheckBox.Checked then
    SyncCheckGroup.States[4] := cbsChecked
  else
    SyncCheckGroup.States[4] := cbsUnChecked;

  if Option6CheckBox.Checked then
    SyncCheckGroup.States[5] := cbsChecked
  else
    SyncCheckGroup.States[5] := cbsUnChecked;
end;

procedure TStoreStoreForm.ToolBarCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '본사 조회';
      GridTableViewCode.Caption  := '본사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '본사 이름';
      GridTableViewName1.Width   := 320;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '구분';
      GridTableViewName2.Width   := 60;
      GridTableViewName2.PropertiesClassName       := 'TcxLabelProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select a.CD_COMPANY, '
                   +'       a.NM_COMPANY, '
                   +'       case when a.DS_COMPANY = ''OF'' then ''체인'' else ''단독'' end DS_COMPANY, '
                   +'       b.CD_PARTNER, '
                   +'       b.NM_PARTNER, '
                   +'       b.DISCERN, '
                   +'       a.OPTIONS '
                   +'  from COMPANY a inner join '
                   +'       PARTNER b on b.CD_PARTNER = a.CD_PARTNER '
                   +' where a.NM_COMPANY  like ConCat(''%'',:P2,''%'') '
                   +Ifthen(UserCode = 'support', 'and a.CD_PARTNER = ''0026'' ','and a.CD_PARTNER <> ''0026'' ') //영업지원용
                   +Ifthen(UserLevel='P',Format(' and a.CD_PARTNER = ''%s'' ',[PartnerCode]),'')
                   +'   and a.DS_COMPANY in (''OF'',''OS'') '
                   +'   and a.YN_USE = ''Y'' '
                   +'order by a.CD_COMPANY';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        ToolBarCompanyCodeEdit.Text     := Code;
        ToolBarCompanyCodeEdit.TextHint := Code;
        ToolBarCompanyNameLabel.Caption := Names[0];
        PartnerCode                     := Names[2];
        partnerName                     := Names[3];
        PartnerPrefix                   := Names[4];
        CompanyOption                   := Names[5];
        isChanged := false;
      end;
    finally
      Free;
    end;
end;

procedure TStoreStoreForm.UserGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ExecuteProgram('updater.exe',PChar(Folder),
                              format('execute %s %s',[UserGridTableView.DataController.Values[UserGridTableView.DataController.GetFocusedRecordIndex, UserGridTableViewUserID.Index],
                                                      UserGridTableView.DataController.Values[UserGridTableView.DataController.GetFocusedRecordIndex, UserGridTableViewPassWord.Index]]));
  Application.Terminate;
end;

procedure TStoreStoreForm.ZipCodeEditPropertiesButtonClick(Sender: TObject;
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

procedure TStoreStoreForm.HeadChangeButtonClick(Sender: TObject);
var vURL :String;
begin
  inherited;
  if not AskBox('본사를 변경하시겠습니까?') then Exit;
  vURL := GetRestDBURL(CompanyCode);

  try
    ExecQuery('insert into MS_TRIGGER_EXISTS(CD_STORE, YN_TRIGGER) '
             +'                      values(:P0, ''Y'') '
             +'on duplicate key update YN_TRIGGER = ''Y'';',
             [CustomerCodeEdit.Text],true, vURL);

    if DM.ExecProcedure(Format('CALL HEAD_CHANGE(''%s'', ''%s'', ''%s'', ?) ',
                               [NewHeadCodeEdit.Text,
                                CompanyCode,
                                CustomerCodeEdit.Text]),vURL) then
    begin
      ExecQuery('update CUSTOMER '
               +'   set CD_COMPANY  =:P2 '
               +' where CD_COMPANY  =:P0 '
               +'   and CD_CUSTOMER =:P1;',
               [CompanyCode,
                CustomerCodeEdit.Text,
                NewHeadCodeEdit.Text],false, RestBaseURL);

      ExecQuery('update USER_AUTH '
               +'   set CD_COMPANY  =:P2 '
               +' where CD_COMPANY  =:P0 '
               +'   and CD_CUSTOMER =:P1;',
               [CompanyCode,
                CustomerCodeEdit.Text,
                NewHeadCodeEdit.Text],false, RestBaseURL);

      ExecQuery('update USER_AUTH_CUSTOMER '
               +'   set CD_COMPANY  =:P2 '
               +' where CD_COMPANY  =:P0 '
               +'   and CD_CUSTOMER =:P1;',
               [CompanyCode,
                CustomerCodeEdit.Text,
                NewHeadCodeEdit.Text],false, RestBaseURL);

      if ExecQuery('update USER_CUSTOMER '
               +'   set CD_COMPANY  =:P2 '
               +' where CD_COMPANY  =:P0 '
               +'   and CD_CUSTOMER =:P1;',
               [CompanyCode,
                CustomerCodeEdit.Text,
                NewHeadCodeEdit.Text],true, RestBaseURL) then
      begin
        CompanyCode := NewHeadCodeEdit.Text;
        MsgBox('정상 변경되었습니다');
      end;
    end;
  finally
    ExecQuery('update MS_TRIGGER_EXISTS '
             +'   set YN_TRIGGER = ''N'' '
             +' where CD_STORE =:P0;',
             [CustomerCodeEdit.Text],true,vURL);
  end;
end;

procedure TStoreStoreForm.HistoryPagexShow(Sender: TObject);
begin
  inherited;
  ShowHistory;
end;

procedure TStoreStoreForm.AdvOfficePagerChange(Sender: TObject);
begin
  inherited;

  if AdvOfficePager.ActivePage <> StoreInfoOfficePager then
    ButtonToolBarDeleteButton.Enabled := false
  else
    ButtonToolBarDeleteButton.Enabled := isChanged;
end;

procedure TStoreStoreForm.CloseButtonClick(Sender: TObject);
begin
  inherited;
  AuthTelPanel.Visible := false;
  MainPanel.Enabled    := true;
  Grid.Enabled         := true;
end;

procedure TStoreStoreForm.ConditionDemoCheckBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ConditionDemoFromDateEdit.Enabled := ConditionDemoCheckBox.Checked;
  ConditionDemoToDateEdit.Enabled   := ConditionDemoCheckBox.Checked;
  if ConditionDemoCheckBox.Checked then
    ConditionToolBarComboBox.ItemIndex := GetStrPointerIndex(ConditionToolBarComboBox, ' and a.DS_STATUS = ''D'' ');
end;

procedure TStoreStoreForm.ConditionDemoFromDateEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if Sender = ConditionDemoFromDateEdit then
  begin
    if ConditionDemoFromDateEdit.CurrentDate > ConditionDemoToDateEdit.CurrentDate then
      ConditionDemoToDateEdit.Date := ConditionDemoFromDateEdit.CurrentDate;
  end
  else if Sender = ConditionPayEndDateEdit then
  begin
    if ConditionDemoFromDateEdit.CurrentDate > ConditionDemoToDateEdit.CurrentDate then
      ConditionDemoFromDateEdit.Date := ConditionDemoToDateEdit.CurrentDate;
  end;
end;

procedure TStoreStoreForm.ConditionPayEndCheckBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ConditionPayFromDateEdit.Enabled := ConditionPayEndCheckBox.Checked;
  ConditionPayEndDateEdit.Enabled  := ConditionPayEndCheckBox.Checked;
end;

procedure TStoreStoreForm.ConditionPayFromDateEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if Sender = ConditionPayFromDateEdit then
  begin
    if ConditionPayFromDateEdit.CurrentDate > ConditionPayEndDateEdit.CurrentDate then
      ConditionPayEndDateEdit.Date := ConditionPayFromDateEdit.CurrentDate;
  end
  else if Sender = ConditionPayEndDateEdit then
  begin
    if ConditionPayFromDateEdit.CurrentDate > ConditionPayEndDateEdit.CurrentDate then
      ConditionPayFromDateEdit.Date := ConditionPayEndDateEdit.CurrentDate;
  end;
end;

procedure TStoreStoreForm.ConditionStipulateCheckBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ConditionStipulateFromDateEdit.Enabled := ConditionStipulateCheckBox.Checked;
  ConditionStipulateToDateEdit.Enabled   := ConditionStipulateCheckBox.Checked;
end;

procedure TStoreStoreForm.ConditionStipulateFromDateEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if Sender = ConditionStipulateFromDateEdit then
  begin
    if ConditionStipulateFromDateEdit.CurrentDate > ConditionStipulateToDateEdit.CurrentDate then
      ConditionStipulateToDateEdit.Date := ConditionStipulateFromDateEdit.CurrentDate;
  end
  else if Sender = ConditionPayEndDateEdit then
  begin
    if ConditionStipulateFromDateEdit.CurrentDate > ConditionStipulateToDateEdit.CurrentDate then
      ConditionStipulateFromDateEdit.Date := ConditionStipulateToDateEdit.CurrentDate;
  end;
end;

procedure TStoreStoreForm.CustomerNameEditExit(Sender: TObject);
begin
  inherited;
  if CustomerShortNameEdit.Text = '' then
    CustomerShortNameEdit.Text := CustomerNameEdit.Text;
end;

function TStoreStoreForm.DoDelete: Boolean;
var visDelete :Boolean;
    vMinute :Integer;
    vCompanyCode,
    vURL :String;
begin
  visDelete := false;
  PosCountEdit.Properties.ReadOnly   := false;
  KioskCountEdit.Properties.ReadOnly := false;
  try
    //추가한지 5분이내에는 삭제가능
    OpenQuery('select CD_COMPANY, '
             +'       TIMESTAMPDIFF(MINUTE, DT_INSERT, NOW()) '
             +'  from CUSTOMER '
             +' where CD_CUSTOMER = :P0 ',
             [CustomerCodeEdit.Text],false,RestBaseURL);
    vCompanyCode := Query.Fields[0].AsString;
    vMinute      := Query.Fields[1].AsInteger;
    Query.Close;

    vURL := GetRestDBURL(vCompanyCode);
    if vMinute > 60 then
    begin
      try
        OpenQuery('select Count(*) '
                 +'  from MS_STORE '
                 +' where CD_STORE =:P0 ',
                 [CustomerCodeEdit.Text],false,vURL);
        if Query.Fields[0].AsInteger > 0 then
        begin
//            if (UserLevel = 'E') then        //반드시 필요시 삭제 후 다시 주석처리//
//            begin
//               if not AskBox('사용내역이 있습니다'#13'삭제하시겠습니까?') then
//                 Exit;
//            end
//            else
          begin
            MsgBox('사용내역이 있으면 삭제할 수 없습니다');
            Exit;
          end;
          visDelete := true;
        end;
      finally
        Query.Close;
      end;
    end
    else visDelete := true;

    //매장의 데이터를 삭제한다
    if visDelete then
    begin
      DM.ExecProcedure(Format('CALL DEMO_DELETE(''%s'', ''%s'', ?) ',
                             [vCompanyCode,
                              CustomerCodeEdit.Text]),vURL);

    end;
  finally
    DM.Query.Close;
    Query.Close;
  end;

  Result := ExecQuery('delete from CUSTOMER '
                     +' where CD_CUSTOMER = :P0;'
                     +'delete from USER_AUTH '
                     +' where CD_CUSTOMER = :P0;'
                     +'delete from USER_CUSTOMER '
                     +' where CD_CUSTOMER = :P0;'
                     +'delete from USER_AUTH_CUSTOMER '
                     +' where CD_CUSTOMER = :P0;',
                     [CustomerCodeEdit.Text],true,RestBaseURL);
end;

procedure TStoreStoreForm.DoGridLink;
var
  vCode : PStrPointer;
  vStatus, vLocal, vManager, vUpjong, vSize, vVan, vSubPartner, vHeadOption,
  vExpireRequest :String;
begin
  inherited;
  try
    OpenQuery('select a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       a.NM_CUSTOMER_SHORT, '
             +'       a.BIZ_NO, '
             +'       a.CEO_NAME, '
             +'       a.TEL_OFFICE, '
             +'       a.TEL_MOBILE, '
             +'       a.POST, '
             +'       a.ADDR1, '
             +'       a.ADDR2, '
             +'       a.ALLOW_POS, '
             +'       a.ALLOW_KIOSK, '
             +'       a.ALLOW_TABLET, '
             +'       a.ALLOW_MENUCOUNT, '
             +'       a.OPTIONS, '
             +'       a.POS_DEVICE, '
             +'       a.REMARK, '
             +'       a.DS_STATUS, '
             +'       a.CD_PARTNER, '
             +'       a.YMD_SETUP, '
             +'       a.CD_COMPANY, '
             +'       a.DS_LICENSE, '
             +'       a.CD_LOCAL, '
             +'       a.CD_MANAGER, '
             +'       a.CD_UPJONG, '
             +'       a.CD_STORESIZE, '
             +'       a.CD_VAN, '
             +'       a.DS_VAN, '
             +'       a.AMT_ASP, '
             +'       StoD(a.YMD_PAYEND) as YMD_PAYEND, '
             +'       a.STIPULATE_FROM, '
             +'       a.STIPULATE_TO, '
             +'       a.STIPULATE_COUNT, '
             +'       a.RENTAL_FEE, '
             +'       a.POS_VERSION, '
             +'       a.TR_VERSION, '
             +'       a.YN_POSUPDATE, '
             +'       b.OPTIONS as HEAD_OPTIONS,  '
             +'       a.CONNECTION_LIMIT, '
             +'       a.CD_PARTNER_SUB, '
             +'       a.ERP_STORECODE, '
             +'       c.OPTIONS as DEST_OPTIONS, '
             +'       d.API_KEY, '
             +'       d.API_WEB_URL, '
             +'       a.UPLOAD_FROM, '
             +'       a.UPLOAD_TO, '
             +'       a.DT_EXPIRE_REQUEST '
             +'  from CUSTOMER a left outer join '
             +'       COMPANY  b on b.CD_COMPANY = a.CD_COMPANY and b.DS_COMPANY = ''OF'' left outer join '
             +'       CUSTOMER c on c.CD_COMPANY = a.CD_COMPANY and a.CD_CUSTOMER = c.LETSORDER_ONLINESTORE left outer join '
             +'       SMS_CUSTOMER d on d.CD_CUSTOMER = a.CD_CUSTOMER '
             +' where a.CD_CUSTOMER = :P0 '
             +'   and a.DS_CUSTOMER = ''O'' ',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCustomerCode.Index]],false,RestBaseURL);

    if not Query.Eof then
    begin
      CompanyCode                := Query.FieldByName('CD_COMPANY').AsString;
      CustomerCodeEdit.Text      := Query.FieldByName('CD_CUSTOMER').AsString;
      CustomerNameEdit.Text      := Query.FieldByName('NM_CUSTOMER').AsString;
      CustomerShortNameEdit.Text := Query.FieldByName('NM_CUSTOMER_SHORT').AsString;
      BizNoEdit.Text             := Query.FieldByName('BIZ_NO').AsString;
      CEONameEdit.Text           := Query.FieldByName('CEO_NAME').AsString;
      OfficeTelEdit.Text         := GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString);
      MobileTelEdit.Text         := GetPhoneNo(Query.FieldByName('TEL_MOBILE').AsString);
      ZipCodeEdit.Text           := Query.FieldByName('POST').AsString;
      Addr1Edit.Text             := Query.FieldByName('ADDR1').AsString;
      Addr2Edit.Text             := Query.FieldByName('ADDR2').AsString;
      PosCountEdit.Value         := Query.FieldByName('ALLOW_POS').AsInteger;
      PosCountEdit.Tag           := Query.FieldByName('ALLOW_POS').AsInteger;
      KioskCountEdit.Value       := Query.FieldByName('ALLOW_KIOSK').AsInteger;
      KioskCountEdit.Tag         := Query.FieldByName('ALLOW_KIOSK').AsInteger;
      TabletCountEdit.Value      := Query.FieldByName('ALLOW_TABLET').AsInteger;
      TabletCountEdit.Tag        := Query.FieldByName('ALLOW_TABLET').AsInteger;
      MenuLimitCountEdit.Value   := Query.FieldByName('ALLOW_MENUCOUNT').AsInteger;
      vHeadOption                := Query.FieldByName('HEAD_OPTIONS').AsString;
      PosCountEdit.EditModified   := false;
      KioskCountEdit.EditModified := false;
      PosCountEdit.Properties.ReadOnly   := false;
      KioskCountEdit.Properties.ReadOnly := false;

      VanTypeComboBox.ItemIndex := GetStrPointerIndex(VanTypeComboBox, Query.FieldByName('DS_VAN').AsString);
      vLocal   := Query.FieldByName('CD_LOCAL').AsString;
      vManager := Query.FieldByName('CD_MANAGER').AsString;
      vUpjong  := Query.FieldByName('CD_UPJONG').AsString;
      vSize    := Query.FieldByName('CD_STORESIZE').AsString;
      vVan     := Query.FieldByName('CD_VAN').AsString;
      vSubPartner := Query.FieldByName('CD_PARTNER_SUB').AsString;
      if Query.FieldByName('DS_LICENSE').AsString = 'P' then
      begin
        LicenseRadio1Button.Checked := true;
        PayEndDateLabel.Visible     := false;
      end
      else
      begin
        LicenseRadio2Button.Checked := true;
        PayEndDateLabel.Visible     := true;
        PayEndDateLabel.Caption     := Format('구독종료일 %s',[Query.FieldByName('YMD_PAYEND').AsString]);
      end;
      AspAmtEdit.Value := Query.FieldByName('AMT_ASP').AsInteger;

      Option1RadioGroup.ItemIndex := StrToInt(Copy(Query.FieldByName('OPTIONS').AsString,1,1));

      //본사에서 표준PLU 사용할때는 무조건 전매장이 다 사용이었는데... 우선변경(2024.10.14)
//      Option2CheckBox.Checked := (Copy(vHeadOption,3,1) = '1') and (Copy(Query.FieldByName('OPTIONS').AsString,2,1) = '1');
      Option2CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,2,1) = '1';
      Option3CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,3,1) = '1';
      Option4CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,4,1) = '1';
      Option5CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,5,1) = '1';
      Option6CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,6,1) = '1';
      Option7CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,7,1) = '1';
      Option8CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,8,1) = '1';
      Option9CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,9,1) = '1';
      Option9CheckBox.Hint    := Copy(Query.FieldByName('OPTIONS').AsString,9,1);
      Option10ComboBox.ItemIndex := StrToIntDef(Copy(Query.FieldByName('OPTIONS').AsString,10,1),0);
      Option11CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,11,1) = '1';
      Option14CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,14,1) = '1';
      Option15CheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,15,1) = '1';

      //본사에 KIOSK를 사용안할때
      if Copy(vHeadOption,4,1) = '0' then
      begin
        Option4CheckBox.Checked := false;
        Option6CheckBox.Checked := false;
        Option7CheckBox.Checked := false;

        Option4CheckBox.Enabled := false;
        Option6CheckBox.Enabled := false;
        Option7CheckBox.Enabled := false;
      end
      else
      begin
        Option4CheckBox.Enabled := true;
        Option6CheckBox.Enabled := true;
        Option7CheckBox.Enabled := true;
      end;


      RemarkMemo.Text          := Query.FieldByName('REMARK').AsString;
      PosDeviceMemo.Text       := Query.FieldByName('POS_DEVICE').AsString;
      vStatus                  := Query.FieldByName('DS_STATUS').AsString;
      PartnerCodeEdit.Text     := Query.FieldByName('CD_PARTNER').AsString;
      PartnerCodeEdit.TextHint := Query.FieldByName('CD_PARTNER').AsString;
      PartnerNameEdit.Text     := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPartner.Index];
      if Query.FieldByName('YMD_SETUP').AsString = '' then
        SetupDateEdit.Text       := EmptyStr
      else
        SetupDateEdit.Date       := StoD(Query.FieldByName('YMD_SETUP').AsString);
      SetupDateEdit.Enabled := false;
      if Query.FieldByName('STIPULATE_FROM').AsString = '' then
        StipulateFromDateEdit.Text       := EmptyStr
      else
        StipulateFromDateEdit.Date := StoD(Query.FieldByName('STIPULATE_FROM').AsString);

      if Query.FieldByName('STIPULATE_TO').AsString = '' then
        StipulateToDateEdit.Text       := EmptyStr
      else
        StipulateToDateEdit.Date   := StoD(Query.FieldByName('STIPULATE_TO').AsString);
      StipulateCountEdit.Value   := Query.FieldByName('STIPULATE_COUNT').AsCurrency;
      RentalFeeEdit.Value        := Query.FieldByName('RENTAL_FEE').AsCurrency;
      PosUpdateCheckBox.Checked  := Query.FieldByName('YN_POSUPDATE').AsString = 'Y';
      PosVersionLabel.Caption    := Format('POS - %s',[Query.FieldByName('POS_VERSION').AsString]);
      TRVersionLabel.Caption     := Format('TR - %s',[Query.FieldByName('TR_VERSION').AsString]);
      ConnectLimitCountEdit.Value := Query.FieldByName('CONNECTION_LIMIT').AsCurrency;
      KaKaoChannelAPIKeyEdit.Text  := Query.FieldByName('API_KEY').AsString;
      KaKaoChannelWebUrlEdit.Text  := Query.FieldByName('API_WEB_URL').AsString;
      UploadBeginEdit.Text         := Query.FieldByName('UPLOAD_FROM').AsString;
      UploadToEdit.Text            := Query.FieldByName('UPLOAD_TO').AsString;
      vExpireRequest               := Query.FieldByName('DT_EXPIRE_REQUEST').AsString;
      StatusComboBox.EditModified := false;
    end;

    if NewStore = 'N' then
    begin
      if UserLevel = 'P' then
      begin
        PosCountEdit.Properties.MinValue    := PosCountEdit.Value;
        KioskCountEdit.Properties.MinValue  := KioskCountEdit.Value;
        TabletCountEdit.Properties.MinValue := TabletCountEdit.Value;
      end
      else
      begin
        PosCountEdit.Properties.MinValue    := 0;
        KioskCountEdit.Properties.MinValue  := 0;
        TabletCountEdit.Properties.MinValue := 0;
      end;
    end;

    LogInGroupBox.Enabled     := true;
    LoginCommentLabel.Visible := false;
    Query.Close;
    OpenQuery('select ID_USER, PW_USER '
             +'  from USER_CUSTOMER '
             +' where CD_COMPANY  =:P0 '
             +'   and CD_CUSTOMER =:P1 ',
             [CompanyCode,
              CustomerCodeEdit.Text],false,RestBaseURL);
    if not Query.Eof then
    begin
      UserIDEdit.Enabled       := false;
      IDDupCheckButton.Enabled := false;
      UserIDEdit.Text          := Query.FieldByName('ID_USER').AsString;
      UserIDEdit.TextHint      := Query.FieldByName('ID_USER').AsString;
      AppPWDEdit.Text          := Query.FieldByName('PW_USER').AsString;
      AppPWDEdit.EditModified  := false;
    end
    else
    begin
      UserIDEdit.Enabled       := true;
      IDDupCheckButton.Enabled := true;
      UserIDEdit.Clear;
      AppPWDEdit.Clear;
      AppPWDEdit.EditModified  := false;
    end;
    AppPWDEdit.Enabled      := true;

    Query.Close;
    OpenQuery('select ID_USER, NM_USER, PW_USER '
             +'  from USER_CUSTOMER '
             +' where CD_CUSTOMER = :P0 ',
             [CustomerCodeEdit.Text],false,RestBaseURL);
    DM.ReadQuery(Query, UserGridTableView);

    if UserLevel <> 'P' then
      SetPartnerComboBox(PartnerCodeEdit.Text,'');

    LocalComboBox.ItemIndex   := GetStrPointerIndex(LocalComboBox,   vLocal);
    ManagerComboBox.ItemIndex := GetStrPointerIndex(ManagerComboBox, vManager);
    UpjongComboBox.ItemIndex  := GetStrPointerIndex(UpjongComboBox, vUpjong);
    SizeComboBox.ItemIndex    := GetStrPointerIndex(SizeComboBox, vSize);
    VanComboBox.ItemIndex     := GetStrPointerIndex(VanComboBox, vVan);
    SubPartnerComboBox.ItemIndex     := GetStrPointerIndex(SubPartnerComboBox, vSubPartner);
  finally
    Query.Close;
  end;

  SyncPanel.Visible         := Copy(vHeadOption,1,1) = '1';
  Option1RadioGroup.Enabled := Copy(vHeadOption,1,1) = '1';
  if not Option1RadioGroup.Enabled then
    Option1RadioGroup.ItemIndex := 0;
  Option2CheckBox.Enabled   := Copy(vHeadOption,2,1) = '1';
  if not Option2CheckBox.Enabled then
    Option2CheckBox.Checked := false;
  Option3CheckBox.Enabled   := Copy(vHeadOption,1,1) = '1';
  if not Option3CheckBox.Enabled then
    Option3CheckBox.Checked := false;
  Option4CheckBox.Enabled   := Copy(vHeadOption,4,1) = '1';
  if not Option4CheckBox.Enabled then
    Option4CheckBox.Checked := false;
  Option5CheckBox.Enabled   := Copy(vHeadOption,5,1) = '1';
  if not Option5CheckBox.Enabled then
    Option5CheckBox.Checked := false;
  Option6CheckBox.Enabled   := Copy(vHeadOption,4,1) = '1';
  if not Option6CheckBox.Enabled then
    Option6CheckBox.Checked := false;
  Option7CheckBox.Enabled   := Copy(vHeadOption,4,1) = '1';
  if not Option7CheckBox.Enabled then
    Option7CheckBox.Checked := false;

  //데모일때는 상태를 변경할 수 있다
  DemoEndLabel.Visible := false;
  if vStatus = 'D' then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
    New(vCode);
    vCode^.Data := 'D';
    StatusComboBox.Properties.Items.AddObject('데모', TObject(vCode));
    DemoEndLabel.Visible :=true;
    DemoEndLabel.Caption := Format(' 데모종료 - %s ',[FormatDateTime('yyyy년-mm월-dd일',IncDay(SetupDateEdit.CurrentDate,15))]);
  end
  else if vStatus = 'E' then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
    New(vCode);
    vCode^.Data := 'E';
    StatusComboBox.Properties.Items.AddObject('데모종료', TObject(vCode));
  end
  else if vStatus = '0' then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
    New(vCode);
    vCode^.Data := 'R';
    StatusComboBox.Properties.Items.AddObject('해지요청', TObject(vCode));
  end
  else if vStatus = '1' then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
  end
  else if vStatus = 'R' then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
    New(vCode);
    vCode^.Data := 'R';
    StatusComboBox.Properties.Items.AddObject('해지요청', TObject(vCode));
    DemoEndLabel.Visible :=true;
    DemoEndLabel.Caption := Format(' 해지요청 - %s ',[vExpireRequest]);
  end;

  //해지상태일때는 익스트림포스에서만 상태를 변경 할 수있다
  if (vStatus = '1') or (vStatus = '2') or (vStatus = 'R') then
    StatusComboBox.Enabled := UserLevel = 'E';


  StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox, vStatus);

  if HistoryPage.Showing then
    ShowHistory
  else if SyncPage.Showing then
    SyncPageShow(nil)
  else if RustDeskPage.Showing then
    RustDeskShow;

  try
    OpenQuery('select Ifnull(b.AMT_CHARGE,0) - Ifnull(b.AMT_USE,0) + Ifnull(b.AMT_FAILURE,0) as CNT_CHARGE, '
             +'       c.TAKEOUT_URL, '
             +'       c.TEMPLATECODE, '
             +'       c.TEMPLATECODE_PICKUP '
             +'  from SMS_CUSTOMER as a left outer join '
             +'       SMS_COUNT    as b on b.CD_CUSTOMER = a.CD_CUSTOMER left outer join '
             +'       SMS_CUSTOMER_LETSORDER c on c.CD_CUSTOMER = a.CD_CUSTOMER '
             +' where a.CD_CUSTOMER = :P0 ',
             [CustomerCodeEdit.Text],false,jsonSMSDBURL);
    if not Query.Eof then
    begin
      SmsRemainEdit.Value         := Query.Fields[0].AsInteger;
      OrderTemplatCodeEdit.Text   := Query.FieldByName('TEMPLATECODE').AsString;
      PickupTemplatCodeEdit.Text  := Query.FieldByName('TEMPLATECODE_PICKUP').AsString;
      ReOrderQREdit.Text          := Query.FieldByName('TAKEOUT_URL').AsString;
      OrderTemplatCodeEdit.Hint   := OrderTemplatCodeEdit.Text;
      PickupTemplatCodeEdit.Hint  := PickupTemplatCodeEdit.Text;
      ReOrderQREdit.Hint          := ReOrderQREdit.Text;
    end
    else
    begin
      SmsRemainEdit.Value := 0;
      OrderTemplatCodeEdit.Clear;
      PickupTemplatCodeEdit.Clear;
      ReOrderQREdit.Clear;
      OrderTemplatCodeEdit.Hint   := '';
      PickupTemplatCodeEdit.Hint  := '';
      ReOrderQREdit.Hint          := '';
      KaKaoChannelWebUrlEdit.Clear;
    end;
  finally
    Query.Close;
  end;
  isChanged := false;
end;

function TStoreStoreForm.DoNew: Boolean;
var
  vCode : PStrPointer;
begin
  if (ToolBarCompanyCodeEdit.Text <> '') and (ToolBarCompanyCodeEdit.Text <> '00000000') then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
    StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox, '0');

    PartnerCodeEdit.Text     := PartnerCode;
    PartnerCodeEdit.TextHint := '';
    PartnerNameEdit.Text    := PartnerName;
    PartnerCodeEdit.Enabled := false;
    SetupDateEdit.Date      := Now();
    SetupDateEdit.Enabled   := false;

    //협력사도 신규일때는 변경할 수 있게한다
    Option1RadioGroup.Enabled := Copy(CompanyOption,1,1) = '1';
    Option2CheckBox.Enabled   := Copy(CompanyOption,1,1) = '1';
    Option3CheckBox.Enabled   := Copy(CompanyOption,1,1) = '1';
    Option4CheckBox.Enabled   := Copy(CompanyOption,1,1) = '1';
    Option5CheckBox.Enabled   := Copy(CompanyOption,1,1) = '1';
    Option6CheckBox.Enabled   := Copy(CompanyOption,1,1) = '1';
    Option7CheckBox.Enabled   := Copy(CompanyOption,1,1) = '1';

    Option1RadioGroup.ItemIndex := Ifthen(Copy(CompanyOption,2,1) = '1',2,0);
    Option2CheckBox.Checked     := (Copy(CompanyOption,1,1) = '1') and (Copy(CompanyOption,2,1) = '1');
    Option3CheckBox.Checked     := (Copy(CompanyOption,1,1) = '1') and (Copy(CompanyOption,2,1) = '1');
    Option4CheckBox.Checked     := (Copy(CompanyOption,1,1) = '1') and (Copy(CompanyOption,4,1) = '1');
    Option5CheckBox.Checked     := (Copy(CompanyOption,1,1) = '1') and (Copy(CompanyOption,5,1) = '1');
    Option6CheckBox.Checked     := (Copy(CompanyOption,1,1) = '1') and (Copy(CompanyOption,4,1) = '1');
    Option7CheckBox.Checked     := (Copy(CompanyOption,1,1) = '1') and (Copy(CompanyOption,4,1) = '1');
    CustomerNameEdit.SetFocus;
  end
  else
  begin
    //단독매장일때만 데모를 설정할 수 있다
    Option1RadioGroup.ItemIndex := 0;
    PartnerCodeEdit.Enabled := true;
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
    New(vCode);
    vCode^.Data := 'D';
    StatusComboBox.Properties.Items.AddObject('데모', TObject(vCode));

    StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox, 'D');
    SetupDateEdit.Date     := Now();
    SetupDateEdit.Enabled  := true;
    PartnerCodeEdit.SetFocus;
  end;
  SyncPage.TabVisible      := (CompanyCode <> '') ;
  Option9CheckBox.Enabled  := (UserLevel = 'E') or (Copy(PartnerOptions,2,1)='1');

  //협력사권한일때
  if UserLevel = 'P' then
  begin
    PartnerCodeEdit.Text        := PartnerCode;
    PartnerNameEdit.Text        := PartnerName;
    PartnerNameEdit.Hint        := PartnerPrefix;

    PartnerCodeEdit.Enabled := false;
    MenuLimitCountEdit.Enabled := false;
    CustomerNameEdit.SetFocus;
  end;

  PosCountEdit.Properties.MinValue    := 0;
  KioskCountEdit.Properties.MinValue  := 0;
  TabletCountEdit.Properties.MinValue := 0;

  LogInGroupBox.Enabled     := false;
  LoginCommentLabel.Visible := true;

  LicenseRadio1Button.Checked := true;
  PosCountEdit.Value       := 1;
  AspAmtEdit.Value         := 10000;
  UserIDEdit.Enabled       := false;
  IDDupCheckButton.Enabled := false;
  AppPWDEdit.Enabled       := false;

  if PartnerPrefix <> '' then
  begin
    OpenQuery('select Ifnull(Max(CD_CUSTOMER),0) '
             +'  from CUSTOMER '
             +' where Left(CD_CUSTOMER,2) = :P0 '
             +'   and Length(CD_CUSTOMER)= 8 ',
             [PartnerPrefix],false,RestBaseURL);

    if Query.Fields[0].AsString = '0' then
      CustomerCodeEdit.Text := PartnerPrefix + '000001'
    else
      CustomerCodeEdit.Text := PartnerPrefix + FormatFloat('000000', StrToInt(Copy(Query.Fields[0].AsString,3,6))+1);

    PartnerNameEdit.Hint := PartnerPrefix;
    Query.Close;
  end;
  Result := true;
end;

function TStoreStoreForm.DoSave: Boolean;
var vOption :String;
    vPosUseCount,
    vKioskUseCount,
    vPosCount :Integer;
    vAddCount,
    vAddKiosk :Integer;
    vMessage,
    vSendDate,
    vKey,
    vPartnerTel,
    vLicenseDate,
    vURL,
    vWeek, vDayOff :String;
    vIndex :Integer;
begin
  Result := false;

  if PartnerCodeEdit.Text='' then
  begin
    MsgBox('협력사를 지정해야합니다');
    Exit;
  end;

  if (PosCountEdit.Value = 0) and not AskBox('포스수량이 0개 입니다'#13'저장하시겠습니까?')  then
    Exit;

  if isNew and (AppPWDEdit.Text <> '') and (Length(AppPWDEdit.Text) < 4) then
  begin
    MsgBox('비밀번호는 4자리 이상이어야 합니다.');
    Exit;
  end;

  if isNew and (ToolBarCompanyCodeEdit.Text = '') then
  begin
    if not AskBox('단독매장으로 저장하시겠습니까?'#13#13'체인 매장일때는 본사를 지정해야합니다') then Exit;
  end;

  if not isNew and (Option9CheckBox.Hint = '1') and not Option9CheckBox.Checked then
  begin
    if not AskBox('렛츠오더 사용을 중지하시겠습니까?'#13#13'렛츠오더의 모든 자료가 삭제됩니다') then Exit;
  end;

  if isNew then
  begin
    if ToolBarCompanyCodeEdit.Text = '' then
    begin
      OpenQuery('select DEFAULT_COMPANY '
               +'  from PARTNER '
               +' where CD_PARTNER  =:P0 ',
               [PartnerCode],false,RestBaseURL);
      if Query.Eof or (Query.Fields[0].AsString = '') then
        CompanyCode := '00000000'
      else
        CompanyCode := Query.Fields[0].AsString;
      Query.Close;
      if CompanyCode = '' then
        CompanyCode := '00000000';
    end
    else
      CompanyCode := ToolBarCompanyCodeEdit.Text;
  end;

  //수정일때는 매장의 사용중인 포스대수를 체크한다
  if not isNew and (PosCountEdit.EditModified or KioskCountEdit.EditModified)  then
  begin
    try
      vURL := GetRestDBURL(CompanyCode);
      OpenQuery('select sum(case when NM_CODE3 in (''0'',''1'') then 1 else 0 end) as POS_COUNT, '
               +'       sum(case when NM_CODE3 = ''2'' then 1 else 0 end) as KIOSK_COUNT '
               +'  from MS_CODE '
               +' where CD_HEAD   = :P0 '
               +'   and CD_STORE  = :P1 '
               +'   and CD_KIND   = ''01'' '
               +'   and DS_STATUS = ''0'' '
               +'   and NM_CODE3 in (''0'',''1'',''2'') ',
                [CompanyCode,
                 CustomerCodeEdit.Text],false,vURL);

      vPosUseCount   := Query.Fields[0].AsInteger;
      vKioskUseCount := Query.Fields[1].AsInteger;
      Query.Close;

      if vPosUseCount > PosCountEdit.Value then
      begin
        MsgBox(Format('매장에서 %d대의 포스를 사용중 입니다',[vPosUseCount]));
        Exit;
      end;
      if vKioskUseCount > KioskCountEdit.Value then
      begin
        MsgBox(Format('매장에서 %d대의 키오스크를 사용중 입니다',[vPosUseCount]));
        Exit;
      end;
    finally
      Query.Close;
    end;
  end;


  vOption := IntToStr(Option1RadioGroup.ItemIndex)
            +ifthen(Option2CheckBox.Checked,'1','0')
            +ifthen(Option3CheckBox.Checked,'1','0')
            +ifthen(Option4CheckBox.Checked,'1','0')
            +ifthen(Option5CheckBox.Checked,'1','0')
            +ifthen(Option6CheckBox.Checked,'1','0')
            +ifthen(Option7CheckBox.Checked,'1','0')
            +ifthen(Option8CheckBox.Checked,'1','0');
  //사용을 하다가 안한다고 했을때( N이면 전송 후 0으로 반영해야함)
  if ((Option9CheckBox.Hint = '1') or (Option9CheckBox.Hint = 'N')) and not Option9CheckBox.Checked then
    vOption := vOption + 'N'
  else if GetStrPointerData(StatusComboBox) <> '0' then
    vOption := vOption + '0'
  else
    vOption := vOption + ifthen(Option9CheckBox.Checked,'1','0');
  vOption := vOption + IntToStr(Option10ComboBox.ItemIndex);
  vOption := vOption + ifthen(Option11CheckBox.Checked,'1','0');
  vOption := vOption + '0';
  vOption := vOption + '0';
  vOption := vOption + ifthen(Option14CheckBox.Checked,'1','0');      //다국어기능
  vOption := vOption + ifthen(Option15CheckBox.Checked,'1','0');      //신규렛츠오더


  vOption := Rpad(vOption,30,'0');
  try
    if isNew then
    begin
      OpenQuery('select Ifnull(Max(CD_CUSTOMER),0) '
               +'  from CUSTOMER '
               +' where Left(CD_CUSTOMER,2) = :P0 '
               +'   and Length(CD_CUSTOMER) = 8 ',
               [PartnerNameEdit.Hint],false,RestBaseURL);

      if Query.Fields[0].AsString = '0' then
        CustomerCodeEdit.Text := PartnerNameEdit.Hint + '000001'
      else
        CustomerCodeEdit.Text := PartnerNameEdit.Hint + FormatFloat('000000', StrToInt(Copy(Query.Fields[0].AsString,3,6))+1);
      Query.Close;
    end;

    if isNew then
      vAddCount := PosCountEdit.Value -1
    else
      vAddCount := PosCountEdit.Value - PosCountEdit.Tag;


    //포스가 2대이상이면서 포스 추가가 있을때
    if (GetStrPointerData(StatusComboBox) <> 'D') and (PosCountEdit.Value > 1) and (vAddCount > 0) then
    begin
      OpenQuery('select POS_COUNT, TEL_AUTH '
               +'  from PARTNER '
               +' where CD_PARTNER  =:P0 ',
               [PartnerCodeEdit.Text],false, RestBaseURL);
      vPosCount   := Query.Fields[0].AsInteger;
      vPartnerTel := Query.Fields[1].AsString;
      Query.Close;

      OpenQuery('select Sum(case when ALLOW_POS > 1 then ALLOW_POS-1 else 0 end) as USE_COUNT '
               +'  from CUSTOMER '
               +' where CD_PARTNER  =:P0 '
               +'   and DS_CUSTOMER = ''O'' '
               +'   and CD_CUSTOMER <> :P1 '
               +'   and DS_STATUS = ''0'' ',
               [PartnerCodeEdit.Text,
                CustomerCodeEdit.Text],false,RestBaseURL);


      if vPosCount < (Query.Fields[0].AsInteger + PosCountEdit.Value -1)  then
      begin
        MsgBox('주문포스 인증 대수를 초과합니다');
        Exit;
      end;
    end;

    //데모에서 정상인증 또는  포스추가시 카톡인증을 받는다
    if (vPartnerTel <> '') and (LeftStr(CustomerCodeEdit.Text,2) <> 'TT') and (UserLevel <> 'E') and not isDebugMode and (StatusComboBox.EditModified and (GetStrPointerData(StatusComboBox) = '0')) and ((GetStrPointerData(StatusComboBox) <> 'D') and (PosCountEdit.Value <> PosCountEdit.Tag) or (KioskCountEdit.Value <> KioskCountEdit.Tag)) then
    begin
      if (LicenseNoEdit.Text = '') then
      begin
        MsgBox('인증번호를 입력해야합니다');
        Exit;
      end;

      if (LicenseNoEdit.Text <> LicenseNoEdit.Hint) then
      begin
        MsgBox('인증번호가 올바르지 않습니다');
        Exit;
      end;

      if not Exec_Timer.Enabled then
      begin
        MsgBox('인증번호 유효시간이 지났습니다'#13'인증번호를 다시 요청해주세요');
        Exit;
      end;

      Exec_Timer.Enabled := false;
      TimeLabel.Visible  := false;
    end;

    if isNew and AskBox('로그인 아이디를 매장코드로 생성하시겠습니까?') then
    begin
      try
        OpenQuery('select ID_USER '
                 +'  from USER_CUSTOMER '
                 +' where ID_USER   = :P0 '
                 +'union all '
                 +'select ID_USER '
                 +'  from USER_MASTER '
                 +' where ID_USER   = :P0 ',
                 [CustomerCodeEdit.Text],false,RestBaseURL);
        if not Query.Eof then
        begin
          MsgBox('이미 등록된 아이디가 있어 아이디등록 하지 못했습니다');
        end
        else
        begin
          MsgBox(Format('ID : %s, PW : %s 로 등록되었습니다',[CustomerCodeEdit.Text, CustomerCodeEdit.Text]));

          UserIDEdit.Text     := CustomerCodeEdit.Text;
          UserIDEdit.TextHint := CustomerCodeEdit.Text;
          AppPWDEdit.Text     := CustomerCodeEdit.Text;
          AppPWDEdit.EditModified := true;
        end;
      finally
        Query.Close;
      end;
    end;

    if AppPWDEdit.EditModified then
    begin
      if UserIDEdit.Text = '' then
      begin
        MsgBox('로그인 아이디를 입력하세요');
        UserIDEdit.SetFocus;
        Exit;
      end;
      if UserIDEdit.Text <> UserIDEdit.TextHint then
      begin
        MsgBox('로그인 아이디 중복체크를 해야합니다');
        UserIDEdit.SetFocus;
        Exit;
      end;

      ExecQuery('insert into USER_CUSTOMER(ID_USER, '
               +'                          PW_USER, '
               +'                          NM_USER, '
               +'                          USER_LEVEL, '
               +'                          CD_COMPANY, '
               +'                          CD_CUSTOMER, '
               +'                          CD_PARTNER, '
               +'                          YN_APP, '
               +'                          DS_STATUS) '
               +'                 values(:P0, '
               +'                        :P1, '
               +'                        :P2, '
               +'                        ''S'', '
               +'                        :P3, '
               +'                        :P4, '
               +'                        :P5, '
               +'                        ''Y'', '
               +'                        ''0'') '
               +'ON DUPLICATE KEY UPDATE '
               +'             PW_USER =:P1,'
               +'             NM_USER =:P2;',
               [UserIDEdit.Text,
                AppPWDEdit.Text,
                CustomerNameEdit.Text,
                CompanyCode,
                CustomerCodeEdit.Text,
                PartnerCodeEdit.Text],false,RestBaseURL);
    end;

    if GetStrPointerData(StatusComboBox)='0' then
      vLicenseDate := FormatDateTime('yyyymmdd', Now())
    else
      vLicenseDate := '';

    Result := ExecQuery(Ifthen(isNew,'insert into CUSTOMER(CD_CUSTOMER, '
                                    +'                     NM_CUSTOMER, '
                                    +'                     CD_COMPANY, '
                                    +'                     CD_PARTNER, '
                                    +'                     BIZ_NO, '
                                    +'                     CEO_NAME, '
                                    +'                     POST, '
                                    +'                     ADDR1, '
                                    +'                     ADDR2, '
                                    +'                     TEL_OFFICE, '
                                    +'                     TEL_MOBILE, '
                                    +'                     ALLOW_POS, '
                                    +'                     ALLOW_KIOSK, '
                                    +'                     ALLOW_TABLET, '
                                    +'                     ALLOW_MENUCOUNT, '
                                    +'                     OPTIONS, '
                                    +'                     REMARK, '
                                    +'                     YMD_SETUP, '
                                    +'                     DS_LICENSE, '
                                    +'                     AMT_ASP, '
                                    +'                     CD_LOCAL, '
                                    +'                     CD_MANAGER, '
                                    +'                     CD_UPJONG, '
                                    +'                     CD_STORESIZE, '
                                    +'                     CD_VAN, '
                                    +'                     DS_VAN, '
                                    +'                     POS_DEVICE, '
                                    +'                     STIPULATE_FROM, '
                                    +'                     STIPULATE_TO, '
                                    +'                     STIPULATE_COUNT, '
                                    +'                     RENTAL_FEE, '
                                    +'                     DS_STATUS, '
                                    +'                     YN_POSUPDATE, '
                                    +'                     ID_USER, '
                                    +'                     CONNECTION_LIMIT, '
                                    +'                     CD_PARTNER_SUB, '
                                    +'                     MEMBER_PREFIX, '
                                    +'                     YMD_LICENSE, '
                                    +'                     NM_CUSTOMER_SHORT, '
                                    +'                     UPLOAD_FROM, '
                                    +'                     UPLOAD_TO) '
                                    +'              values(:P0, '
                                    +'                     :P1, '
                                    +'                     :P2, '
                                    +'                     :P3, '
                                    +'                     :P4, '
                                    +'                     :P5, '
                                    +'                     :P6, '
                                    +'                     :P7, '
                                    +'                     :P8, '
                                    +'                     :P9, '
                                    +'                     :P10, '
                                    +'                     :P11, '
                                    +'                     :P12, '
                                    +'                     :P13, '
                                    +'                     :P14, '
                                    +'                     :P15, '
                                    +'                     :P16, '
                                    +'                     :P17, '
                                    +'                     :P18, '
                                    +'                     :P19, '
                                    +'                     :P20, '
                                    +'                     :P21, '
                                    +'                     :P22, '
                                    +'                     :P23, '
                                    +'                     :P24, '
                                    +'                     :P25, '
                                    +'                     :P26, '
                                    +'                     :P27, '
                                    +'                     :P28, '
                                    +'                     :P29, '
                                    +'                     :P30, '
                                    +'                     :P31, '
                                    +'                     :P32, '
                                    +'                     :P33, '
                                    +'                     :P34, '
                                    +'                     :P35, '
                                    +Ifthen(ToolBarCompanyCodeEdit.Text='',':P36,', '(select LPad(Ifnull(Max(MEMBER_PREFIX),''000'') + 1,3,''0'') '
                                                                                    +'   from CUSTOMER as s '
                                                                                    +'  where CD_COMPANY = :P2), ')
                                    +'                     :P37, '
                                    +'                     :P38, '
                                    +'                     :P39, '
                                    +'                     :P40);',
                                     'update CUSTOMER '
                                    +'   set NM_CUSTOMER      =:P1, '
                                    +'       CD_COMPANY       =:P2, '
                                    +'       CD_PARTNER       =:P3, '
                                    +'       BIZ_NO           =:P4, '
                                    +'       CEO_NAME         =:P5, '
                                    +'       POST             =:P6, '
                                    +'       ADDR1            =:P7, '
                                    +'       ADDR2            =:P8, '
                                    +'       TEL_OFFICE       =:P9, '
                                    +'       TEL_MOBILE       =:P10, '
                                    +'       ALLOW_POS        =:P11, '
                                    +'       ALLOW_KIOSK      =:P12, '
                                    +'       ALLOW_TABLET     =:P13, '
                                    +'       ALLOW_MENUCOUNT  =:P14, '
                                    +'       OPTIONS          =:P15, '
                                    +'       REMARK           =:P16, '
                                    +'       YMD_SETUP        =:P17, '
                                    +'       DS_LICENSE       =:P18, '
                                    +'       AMT_ASP          =:P19, '
                                    +'       CD_LOCAL         =:P20, '
                                    +'       CD_MANAGER       =:P21, '
                                    +'       CD_UPJONG        =:P22, '
                                    +'       CD_STORESIZE     =:P23, '
                                    +'       CD_VAN           =:P24, '
                                    +'       DS_VAN           =:P25, '
                                    +'       POS_DEVICE       =:P26, '
                                    +'       STIPULATE_FROM   =:P27, '
                                    +'       STIPULATE_TO     =:P28, '
                                    +'       STIPULATE_COUNT  =:P29, '
                                    +'       RENTAL_FEE       =:P30, '
                                    +'       DS_STATUS        =:P31, '
                                    +'       YN_POSUPDATE     =:P32, '
                                    +'       ID_USER          =:P33, '
                                    +'       CONNECTION_LIMIT =:P35, '
                                    +'       CD_PARTNER_SUB   =:P36, '
                                    +'       YMD_LICENSE      =case when (DS_STATUS = ''D'') and (:P31 = ''0'') then Date_Format(Now(), ''%Y%m%d'') else YMD_LICENSE end, '
                                    +'       NM_CUSTOMER_SHORT =:P38, '
                                    +'       UPLOAD_FROM       =:P39, '
                                    +'       UPLOAD_TO         =:P40 '
                                    +' where CD_CUSTOMER =:P0;'),
                                    [CustomerCodeEdit.Text,
                                     CustomerNameEdit.Text,
                                     CompanyCode,
                                     PartnerCodeEdit.Text,
                                     BizNoEdit.Text,
                                     CEONameEdit.Text,
                                     ZipCodeEdit.Text,
                                     Addr1Edit.Text,
                                     Addr2Edit.Text,
                                     GetOnlyNumber(OfficeTelEdit.Text),
                                     GetOnlyNumber(MobileTelEdit.Text),
                                     PosCountEdit.EditingValue,
                                     KioskCountEdit.EditingValue,
                                     TabletCountEdit.EditingValue,
                                     MenuLimitCountEdit.EditingValue,
                                     vOption,
                                     RemarkMemo.Text,
                                     Ifthen(SetupDateEdit.Text ='','',DtoS(SetupDateEdit.CurrentDate)),
                                     Ifthen(LicenseRadio1Button.Checked,'P','S'),
                                     AspAmtEdit.Value,
                                     GetStrPointerData(LocalComboBox),
                                     GetStrPointerData(ManagerComboBox),
                                     GetStrPointerData(UpjongComboBox),
                                     GetStrPointerData(SizeComboBox),
                                     GetStrPointerData(VanComboBox),
                                     GetStrPointerData(VanTypeComboBox),
                                     PosDeviceMemo.Text,
                                     DtoS(StipulateFromDateEdit.CurrentDate),
                                     DtoS(StipulateToDateEdit.CurrentDate),
                                     StipulateCountEdit.EditingValue,
                                     RentalFeeEdit.EditingValue,
                                     GetStrPointerData(StatusComboBox),
                                     Ifthen(PosUpdateCheckBox.Checked,'Y','N'),
                                     UserCode,
                                     ConnectLimitCountEdit.EditingValue,
                                     '',
                                     GetStrPointerData(SubPartnerComboBox),
                                     vLicenseDate,
                                     CustomerShortNameEdit.Text,
                                     GetOnlyNumber(UploadBeginEdit.Text),
                                     GetOnlyNumber(UploadToEdit.Text)],true,RestBaseURL);

    if Result then
    begin
      if isNew then
      begin
        SetLength(NewData, 4);
        NewData[0] := CustomerCodeEdit.Text;
        NewData[1] := CustomerNameEdit.Text;
        NewData[2] := StatusComboBox.Text;
        NewData[3] := PartnerNameEdit.Text;
      end
      else
        GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewCustomerName.Index] := CustomerNameEdit.Text;

      //렛츠오더를 사용하다가 안한때
      if (Option9CheckBox.Hint = '1') and not Option9CheckBox.Checked then
      begin
        LetsOrderDisUse(CompanyCode, CustomerCodeEdit.Text);
      end;


      ExecQuery('update SMS_CUSTOMER '
               +'   set API_KEY     = :P1, '
               +'       API_WEB_URL = :P2 '
               +' where CD_CUSTOMER = :P0;',
               [CustomerCodeEdit.Text,
                KaKaoChannelAPIKeyEdit.Text,
                KaKaoChannelWebUrlEdit.Text],true,RestBaseURL);


      vURL := GetRestDBURL(CompanyCode);
      if vURL <> ''  then
      begin
        ExecQuery('update MS_STORE '
                 +'   set YN_USE         =:P2, '
                 +'       HEAD_OPTIONS   =:P3, '
                 +'       NM_STORE       =:P4, '
                 +'       NM_STORE_SHORT =:P5, '
                 +'       NO_BIZER       =:P6, '
                 +'       NM_BOSS        =:P7, '
                 +'       TEL_MOBILE     =:P8, '
                 +'       TEL_OFFICE     =:P9 '
                 +Ifthen(Option9CheckBox.Checked, Format(', CERTIFY_KEY = ''%d'' ',[Ifthen(StrToInt(RightStr(CustomerCodeEdit.Text, 1)) mod 2 = 0, 1, 2)]),'')
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1;',
                 [CompanyCode,
                  CustomerCodeEdit.Text,
                  Ifthen(GetStrPointerData(StatusComboBox)[1] in ['0','D'],'Y','N'),
                  vOption,
                  CustomerNameEdit.Text,
                  CustomerShortNameEdit.Text,
                  GetOnlyNumber(BizNoEdit.Text),
                  CEONameEdit.Text,
                  GetOnlyNumber(MobileTelEdit.Text),
                  GetOnlyNumber(OfficeTelEdit.Text)],true, vURL);
      end;
    end;
  finally
    Query.Close;
  end;

  if (OrderTemplatCodeEdit.Hint <> OrderTemplatCodeEdit.Text)
    or (PickupTemplatCodeEdit.Hint <> PickupTemplatCodeEdit.Text)
    or (ReOrderQREdit.Hint <> ReOrderQREdit.Text) then
  begin
    ExecQuery('insert into SMS_CUSTOMER_LETSORDER(CD_CUSTOMER, '
             +'                                   TEMPLATECODE, '
             +'                                   TEMPLATECODE_PICKUP, '
             +'                                   TAKEOUT_URL) '
             +'                            values(:P0, '
             +'                                   :P1, '
             +'                                   :P2, '
             +'                                   :P3) '
             +' on duplicate key update TEMPLATECODE        =:P1, '
             +'                         TEMPLATECODE_PICKUP =:P2, '
             +'                         TAKEOUT_URL         =:P3;',
             [CustomerCodeEdit.Text,
              OrderTemplatCodeEdit.Text,
              PickupTemplatCodeEdit.Text,
              ReOrderQREdit.Text],true,jsonSMSDBURL);
  end;


  //코드동기화
  if isNew then
  begin
    SyncPageShow(nil);
    SyncButtonClick(nil);
  end;
end;

function TStoreStoreForm.DoSearch: Boolean;
var vWhere :String;
begin
  vWhere := '';
  if GetStrPointerData(ConditionLocalComboBox) <> '' then
    vWhere := Format(' and a.CD_LOCAL = ''%s'' ',[GetStrPointerData(ConditionLocalComboBox)]);

  if GetStrPointerData(ConditionManagerComboBox) <> '' then
    vWhere := vWhere + Format(' and a.CD_MANAGER = ''%s'' ',[GetStrPointerData(ConditionManagerComboBox)]);

  if GetStrPointerData(ConditionUpjongComboBox) <> '' then
    vWhere := vWhere + Format(' and a.CD_UPJONG = ''%s'' ',[GetStrPointerData(ConditionUpjongComboBox)]);

  if GetStrPointerData(ConditionSizeComboBox) <> '' then
    vWhere := vWhere + Format(' and a.CD_STORESIZE = ''%s'' ',[GetStrPointerData(ConditionSizeComboBox)]);

  if GetStrPointerData(ConditionVanComboBox) <> '' then
    vWhere := vWhere + Format(' and a.CD_VAN = ''%s'' ',[GetStrPointerData(ConditionVanComboBox)]);

  if GetStrPointerData(ConditionVanTypeComboBox) <> '' then
    vWhere := vWhere + Format(' and a.DS_VAN = ''%s'' ',[GetStrPointerData(ConditionVanTypeComboBox)]);

  if GetStrPointerData(ConditionPayTypeComboBox) <> '' then
    vWhere := vWhere + Format(' and a.DS_LICENSE = ''%s'' ',[GetStrPointerData(ConditionPayTypeComboBox)]);

  if ConditionPayEndCheckBox.Checked then
    vWhere := vWhere + Format(' and a.YMD_PAYEND between ''%s'' and ''%s'' ',[DtoS(ConditionPayFromDateEdit.CurrentDate), DtoS(ConditionPayEndDateEdit.CurrentDate)]);

  if ConditionStipulateCheckBox.Checked then
    vWhere := vWhere + Format(' and a.STIPULATE_TO between ''%s'' and ''%s'' ',[DtoS(ConditionStipulateFromDateEdit.CurrentDate), DtoS(ConditionStipulateToDateEdit.CurrentDate)]);

  if ConditionDemoCheckBox.Checked then
    vWhere := vWhere + ' and a.DS_STATUS = ''D'' and  Date_Format(Date_ADD(Cast(a.YMD_SETUP as DateTime), INTERVAL 15 DAY), ''%Y%m%d'') '+Format('between ''%s'' and ''%s'' ',[DtoS(ConditionDemoFromDateEdit.CurrentDate), DtoS(ConditionDemoToDateEdit.CurrentDate)]);

  if OptionLetsOrderCheckBox.Checked then
    vWhere := vWhere + ' and SubString(a.OPTIONS,9,1) = ''1'' ';

  OpenQuery('select a.CD_CUSTOMER, '
           +'       a.NM_CUSTOMER, '
           +'       case a.DS_STATUS when ''0'' then ''정상'' when ''1'' then ''해지'' when ''R'' then ''해지요청'' when ''D'' then ''데모'' when ''E'' then ''데모만료'' end DS_STATUS, '
           +'       c.NM_PARTNER, '
           +'       a.CD_COMPANY, '
           +'       b.NM_COMPANY '
           +Ifthen(OptionLetsOrderCheckBox.Checked,', Case when Substring(a.OPTIONS,12,1) = ''1'' then ''주문전용'' end LETSORDER ', '')
           +'  from CUSTOMER a left outer join '
           +'       COMPANY  b on b.CD_COMPANY = a.CD_COMPANY inner join '
           +'       PARTNER  c on c.CD_PARTNER = a.CD_PARTNER '
           +' where (a.CD_CUSTOMER  = :P0 '
           +'    or a.NM_CUSTOMER like ConCat(''%'',:P0,''%'') or a.NM_CUSTOMER_SHORT like ConCat(''%'',:P0,''%'') ) '
           +GetStrPointerData(ConditionToolBarComboBox)
           +Ifthen(ToolBarCompanyCodeEdit.Text <> '', Format(' and a.CD_COMPANY = ''%s'' ',[ToolBarCompanyCodeEdit.Text]), '')
           +'  and a.DS_CUSTOMER = ''O'' '
           +'  and Length(a.CD_CUSTOMER) = 8 '
           +vWhere
           +Ifthen(UserLevel='P',Format(' and a.CD_PARTNER = ''%s'' ',[PartnerCode]),'')
           +' order by a.CD_CUSTOMER ',
           [ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);

  isChanged := false;
end;

procedure TStoreStoreForm.EditPropertiesChange(Sender: TObject);
var vCode : PStrPointer;
begin
  inherited;
  if Sender = ToolBarCompanyCodeEdit then
  begin
    ClearGrid;
    if ToolBarCompanyCodeEdit.Text <> ToolBarCompanyCodeEdit.TextHint then
      ToolBarCompanyNameLabel.Caption := '';
    isChanged := false;
  end
  else if Sender = PartnerCodeEdit then
  begin
    if PartnerCodeEdit.Text <> PartnerCodeEdit.TextHint then
      PartnerNameEdit.Clear;
  end
  else if Sender = UserIDEdit then
  begin
    if UserIDEdit.Text <> UserIDEdit.TextHint then
      UserIDEdit.TextHint := '';
  end;
end;

procedure TStoreStoreForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Tag := Exec_Timer.Tag + 1;
  TimeLabel.Caption := Format('(%d)',[120-Exec_Timer.Tag]);

  if Exec_Timer.Tag = 120 then
  begin
    Exec_Timer.Enabled := false;
    TimeLabel.Visible  := false;
    PosCountEdit.Properties.ReadOnly   := false;
    KioskCountEdit.Properties.ReadOnly := false;
  end;
end;

end.
