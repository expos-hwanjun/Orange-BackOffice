// SMS 문자 발송 (완료)

unit MemberSMS;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, Menus, UniProvider, SQLServerUniProvider, Uni,
  DB, IdTCPClient, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCheckBox, cxLabel, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls, StrUtils,
  cxGridCustomView, cxGrid, StdCtrls, AdvOfficePager, cxTextEdit, cxMemo,
  ExtCtrls, cxContainer, MemDS, cxButtonEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvToolBar, DateUtils, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, cxRadioGroup, Math, DBAccess, AdvPanel,
  MaskUtils, Vcl.ImgList, cxImage, Vcl.Imaging.jpeg, ShellAPI, IdHttp,
  cxRichEdit, AdvMemo, AdvmWS, Vcl.Imaging.GIFImg, cxScrollBox, cxHyperLinkEdit,
  dxGDIPlusClasses, cxButtons, cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TMemberSMSForm = class(TInheritEditForm)
    SMSPanel: TPanel;
    SMSMessageCaptionLabel: TLabel;
    SMSMessageLengthLabel: TLabel;
    SMSPhoneLabel: TLabel;
    SMSMessageMemo: TcxMemo;
    SMSPhoneEdit: TcxTextEdit;
    SMSImmediateRadioButton: TRadioButton;
    SMSReserveRadioButton: TRadioButton;
    SMSInfoPager: TAdvOfficePager;
    SMSInfoPagerInfo: TAdvOfficePage;
    SMSInfoPagerCharge: TAdvOfficePage;
    SMSInfoPagerChargeChargeLabel: TLabel;
    SMSInfoPagerChargeBankLabel: TLabel;
    SMSInfoPagerChargeAccountLabel: TLabel;
    SMSInfoPagerChargeOwnerLabel: TLabel;
    SMSInfoPagerChargeCustomerLabel: TLabel;
    SMSInfoPagerInfoCustomerLabel: TLabel;
    SMSInfoPagerInfoCustomerCaptionLabel: TLabel;
    SMSSymbolPager: TAdvOfficePager;
    SMSSymbolPagerEmoticon: TAdvOfficePage;
    SMSSymbolPagerSymbol: TAdvOfficePage;
    SMSSymbolPagerMessage: TAdvOfficePage;
    SMSSymbolPagerEmoticon11Label: TLabel;
    SMSSymbolPagerEmoticon12Label: TLabel;
    SMSSymbolPagerEmoticon13Label: TLabel;
    SMSSymbolPagerEmoticon14Label: TLabel;
    SMSSymbolPagerEmoticon21Label: TLabel;
    SMSSymbolPagerEmoticon22Label: TLabel;
    SMSSymbolPagerEmoticon23Label: TLabel;
    SMSSymbolPagerEmoticon24Label: TLabel;
    SMSSymbolPagerEmoticon31Label: TLabel;
    SMSSymbolPagerEmoticon32Label: TLabel;
    SMSSymbolPagerEmoticon33Label: TLabel;
    SMSSymbolPagerEmoticon34Label: TLabel;
    SMSSymbolPagerEmoticon41Label: TLabel;
    SMSSymbolPagerEmoticon42Label: TLabel;
    SMSSymbolPagerEmoticon43Label: TLabel;
    SMSSymbolPagerEmoticon44Label: TLabel;
    SMSSymbolPagerEmoticon51Label: TLabel;
    SMSSymbolPagerEmoticon52Label: TLabel;
    SMSSymbolPagerEmoticon53Label: TLabel;
    SMSSymbolPagerEmoticon54Label: TLabel;
    SMSSymbolPagerEmoticon61Label: TLabel;
    SMSSymbolPagerEmoticon62Label: TLabel;
    SMSSymbolPagerEmoticon63Label: TLabel;
    SMSSymbolPagerEmoticon64Label: TLabel;
    SMSSymbolPagerEmoticon71Label: TLabel;
    SMSSymbolPagerEmoticon72Label: TLabel;
    SMSSymbolPagerEmoticon73Label: TLabel;
    SMSSymbolPagerEmoticon74Label: TLabel;
    SMSSymbolPagerEmoticon81Label: TLabel;
    SMSSymbolPagerEmoticon82Label: TLabel;
    SMSSymbolPagerEmoticon83Label: TLabel;
    SMSSymbolPagerEmoticon84Label: TLabel;
    SMSSymbolPagerEmoticon15Label: TLabel;
    SMSSymbolPagerEmoticon25Label: TLabel;
    SMSSymbolPagerEmoticon35Label: TLabel;
    SMSSymbolPagerEmoticon45Label: TLabel;
    SMSSymbolPagerEmoticon55Label: TLabel;
    SMSSymbolPagerEmoticon65Label: TLabel;
    SMSSymbolPagerEmoticon75Label: TLabel;
    SMSSymbolPagerEmoticon85Label: TLabel;
    SMSSymbolPagerSymbol11Label: TLabel;
    SMSSymbolPagerSymbol12Label: TLabel;
    SMSSymbolPagerSymbol13Label: TLabel;
    SMSSymbolPagerSymbol14Label: TLabel;
    SMSSymbolPagerSymbol21Label: TLabel;
    SMSSymbolPagerSymbol22Label: TLabel;
    SMSSymbolPagerSymbol23Label: TLabel;
    SMSSymbolPagerSymbol24Label: TLabel;
    SMSSymbolPagerSymbol31Label: TLabel;
    SMSSymbolPagerSymbol32Label: TLabel;
    SMSSymbolPagerSymbol33Label: TLabel;
    SMSSymbolPagerSymbol34Label: TLabel;
    SMSSymbolPagerSymbol41Label: TLabel;
    SMSSymbolPagerSymbol42Label: TLabel;
    SMSSymbolPagerSymbol43Label: TLabel;
    SMSSymbolPagerSymbol44Label: TLabel;
    SMSSymbolPagerSymbol51Label: TLabel;
    SMSSymbolPagerSymbol52Label: TLabel;
    SMSSymbolPagerSymbol53Label: TLabel;
    SMSSymbolPagerSymbol54Label: TLabel;
    SMSSymbolPagerSymbol61Label: TLabel;
    SMSSymbolPagerSymbol62Label: TLabel;
    SMSSymbolPagerSymbol63Label: TLabel;
    SMSSymbolPagerSymbol64Label: TLabel;
    SMSSymbolPagerSymbol71Label: TLabel;
    SMSSymbolPagerSymbol72Label: TLabel;
    SMSSymbolPagerSymbol73Label: TLabel;
    SMSSymbolPagerSymbol74Label: TLabel;
    SMSSymbolPagerSymbol81Label: TLabel;
    SMSSymbolPagerSymbol82Label: TLabel;
    SMSSymbolPagerSymbol83Label: TLabel;
    SMSSymbolPagerSymbol84Label: TLabel;
    SMSSymbolPagerSymbol15Label: TLabel;
    SMSSymbolPagerSymbol25Label: TLabel;
    SMSSymbolPagerSymbol35Label: TLabel;
    SMSSymbolPagerSymbol45Label: TLabel;
    SMSSymbolPagerSymbol55Label: TLabel;
    SMSSymbolPagerSymbol65Label: TLabel;
    SMSSymbolPagerSymbol75Label: TLabel;
    SMSSymbolPagerSymbol85Label: TLabel;
    SMSSymbolPagerSymbol16Label: TLabel;
    SMSSymbolPagerSymbol26Label: TLabel;
    SMSSymbolPagerSymbol36Label: TLabel;
    SMSSymbolPagerSymbol46Label: TLabel;
    SMSSymbolPagerSymbol56Label: TLabel;
    SMSSymbolPagerSymbol66Label: TLabel;
    SMSSymbolPagerSymbol76Label: TLabel;
    SMSSymbolPagerSymbol86Label: TLabel;
    SMSSymbolPagerSymbol17Label: TLabel;
    SMSSymbolPagerSymbol27Label: TLabel;
    SMSSymbolPagerSymbol37Label: TLabel;
    SMSSymbolPagerSymbol47Label: TLabel;
    SMSSymbolPagerSymbol57Label: TLabel;
    SMSSymbolPagerSymbol67Label: TLabel;
    SMSSymbolPagerSymbol77Label: TLabel;
    SMSSymbolPagerSymbol87Label: TLabel;
    SMSSymbolPagerSymbol18Label: TLabel;
    SMSSymbolPagerSymbol28Label: TLabel;
    SMSSymbolPagerSymbol38Label: TLabel;
    SMSSymbolPagerSymbol48Label: TLabel;
    SMSSymbolPagerSymbol58Label: TLabel;
    SMSSymbolPagerSymbol68Label: TLabel;
    SMSSymbolPagerSymbol78Label: TLabel;
    SMSSymbolPagerSymbol88Label: TLabel;
    SMSSymbolPagerMessageButton: TButton;
    SMSSymbolPagerMessageMemo: TcxMemo;
    SMSInfoPagerInfoLabel: TLabel;
    SMSSymbolPagerMessageComboBox: TcxComboBox;
    SMSReserveDateEdit: TcxDateEdit;
    Panel1: TPanel;
    SmsRadioButton: TcxRadioButton;
    LmsRadioButton: TcxRadioButton;
    MemberNameButton: TButton;
    ConditionPanel: TAdvPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ConditionJoinFromDateEdit: TcxDateEdit;
    ConditionFromPointEdit: TcxCurrencyEdit;
    ConditionToPointEdit: TcxCurrencyEdit;
    ConditionJoinToDateEdit: TcxDateEdit;
    Label10: TLabel;
    ConditionVisitBeforeDateEdit: TcxDateEdit;
    ConditionVisitAfterDateEdit: TcxDateEdit;
    Label12: TLabel;
    ConditionFromAmtEdit: TcxCurrencyEdit;
    ConditionToAmtEdit: TcxCurrencyEdit;
    Label6: TLabel;
    ConditionWeddingFromDateEdit: TcxDateEdit;
    Label9: TLabel;
    ConditionWeddingToDateEdit: TcxDateEdit;
    Label14: TLabel;
    ConditionBirthFromDateEdit: TcxDateEdit;
    Label15: TLabel;
    ConditionBirthToDateEdit: TcxDateEdit;
    Grid: TcxGrid;
    MemberGridView: TcxGridTableView;
    MemberGridViewSendColumn: TcxGridColumn;
    MemberGridViewMemberNoColumn: TcxGridColumn;
    MemberGridViewMemberNameColumn: TcxGridColumn;
    MemberGridViewGenderColumn: TcxGridColumn;
    MemberGridViewMemberTypeColumn: TcxGridColumn;
    MemberGridViewMobileNoColumn: TcxGridColumn;
    MemberGridViewJoinDate: TcxGridColumn;
    MemberGridViewSaleColumn: TcxGridColumn;
    GridLevel: TcxGridLevel;
    MemberGridViewLastVisit: TcxGridColumn;
    MemberGridViewBirthday: TcxGridColumn;
    MemberGridViewWeddingDay: TcxGridColumn;
    Label16: TLabel;
    Label17: TLabel;
    ConditionFromDateEdit: TcxDateEdit;
    ConditionToDateEdit: TcxDateEdit;
    ConditionPointCheckBox: TcxCheckBox;
    ConditionSaleAmtCheckBox: TcxCheckBox;
    Label11: TLabel;
    MemberGridViewPoint: TcxGridColumn;
    EachPanel: TPanel;
    TelNoMemo: TcxMemo;
    Label18: TLabel;
    EashCountLabel: TLabel;
    TelNo2Memo: TcxMemo;
    TelNo3Memo: TcxMemo;
    TelNo4Memo: TcxMemo;
    TelNo5Memo: TcxMemo;
    TelNo6Memo: TcxMemo;
    MemberGridViewTotalSaleAmt: TcxGridColumn;
    Label19: TLabel;
    SubjectEdit: TcxTextEdit;
    ConditionVisitCheckBox: TcxCheckBox;
    ConditionFromVisitEdit: TcxCurrencyEdit;
    Label21: TLabel;
    ConditionToVisitEdit: TcxCurrencyEdit;
    MemberGridViewVisitCount: TcxGridColumn;
    ReservationGridView: TcxGridTableView;
    ReservationGridViewSend: TcxGridColumn;
    ReservationGridViewDate: TcxGridColumn;
    ReservationGridViewCustName: TcxGridColumn;
    ReservationGridViewDsSale: TcxGridColumn;
    ReservationGridViewTelNo: TcxGridColumn;
    ReservationGridViewCount: TcxGridColumn;
    ReservationGridViewRemark: TcxGridColumn;
    TransTypeComboBox: TcxComboBox;
    MemberAddButton: TButton;
    SMSInfoPagerInfoTotalCountLabel: TLabel;
    SMSInfoPagerInfoUseCountLabel: TLabel;
    SMSInfoPagerInfoRestCountLabel: TLabel;
    SMSInfoPagerInfoDateFromLabel: TLabel;
    SMSInfoPagerInfoSMSCountEdit: TcxCurrencyEdit;
    SMSInfoPagerInfoLMSCountEdit: TcxCurrencyEdit;
    SMSInfoPagerInfoRestAmtEdit: TcxCurrencyEdit;
    SMSInfoPagerInfoDateEdit: TcxTextEdit;
    AdvOfficePage1: TAdvOfficePage;
    Image1: TImage;
    Label22: TLabel;
    LeafletImage: TcxImage;
    ImageList1: TImageList;
    AdDesignMakeButton: TButton;
    Button1: TButton;
    SmsPriceLabel: TLabel;
    LmsPriceLabel: TLabel;
    LeafletPriceLabel: TLabel;
    ReservationGridViewName: TcxGridColumn;
    NoticePanel: TAdvPanel;
    ConditionToolBarHelpButton: TcxButton;
    AgreeCheckBox: TcxCheckBox;
    HelpPanel: TAdvPanel;
    cxRichEdit1: TcxRichEdit;
    DupCheckBox: TcxCheckBox;
    cxHyperLinkEdit3: TcxHyperLinkEdit;
    MemberGridViewAgreeDate: TcxGridColumn;
    MemberGridViewDup: TcxGridColumn;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxHyperLinkEdit2: TcxHyperLinkEdit;
    cxLabel9: TcxLabel;
    cxHyperLinkEdit1: TcxHyperLinkEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    MemberGridViewAgreeYn: TcxGridColumn;
    AgreeYesCheckBox: TcxCheckBox;
    PointButton: TButton;
    ChargeSearchButton: TButton;
    CheckButton: TButton;

    procedure FormShow(Sender: TObject);
    procedure SMSSymbolPagerSymbolLabelClick(Sender: TObject);
    procedure SMSPhoneEditExit(Sender: TObject);
    procedure SMSRadioButtonClick(Sender: TObject);
    procedure SMSSymbolPagerMessageComboBoxPropertiesChange(Sender: TObject);
    procedure SMSSymbolPagerMessageButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure LmsRadioButtonClick(Sender: TObject);
    procedure MemberNameButtonClick(Sender: TObject);
    procedure SMSMessageMemoEnter(Sender: TObject);
    procedure SMSMessageMemoExit(Sender: TObject);
    procedure SMSImmediateRadioButtonClick(Sender: TObject);
    procedure MemberGridViewSendColumnHeaderClick(Sender: TObject);
    procedure MemberGridViewSendColumnPropertiesEditValueChanged(
      Sender: TObject);
    procedure MemberGridViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure MemberGridViewDataControllerFilterChanged(Sender: TObject);
    procedure TelNoMemoKeyPress(Sender: TObject; var Key: Char);
    procedure TransTypeButtonClick(Sender: TObject);
    procedure MemberGridViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure FormResize(Sender: TObject);
    procedure ReservationGridViewSendHeaderClick(Sender: TObject);
    procedure ReservationGridViewSendPropertiesEditValueChanged(
      Sender: TObject);
    procedure ReservationGridViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure MemberAddButtonClick(Sender: TObject);
    procedure AdDesignMakeButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MemberGridViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure MemberGridViewMobileNoColumnPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure NoticePanelClose(Sender: TObject);
    procedure ConditionToolBarHelpButtonClick(Sender: TObject);
    procedure HelpCloseButtonClick(Sender: TObject);
    procedure cxHyperLinkEdit1Click(Sender: TObject);
    procedure NoticeRadioButtonClick(Sender: TObject);
    procedure AdRadioButtonClick(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure cxHyperLinkEdit3Click(Sender: TObject);
    procedure AgreeCheckBoxPropertiesChange(Sender: TObject);
    procedure ChargeSearchButtonClick(Sender: TObject);
    procedure CheckButtonClick(Sender: TObject);
  private
    Domain :String;
    LeafletURL,
    ShortURL  :String;
    SMSPrice,                          //단문단가
    LMSPrice,                          //장문단가
    LeafletPrice : Currency;           //전단단가
    ChargeAmount : Integer;            //충전금액
    DefaultMessage : String;
    RegPhoneNo     : String;           //사전등록발신번호
    function GetCustomerSmsInfo(aMsg:Boolean=false):Boolean;
    function GetFilteredSort(aGrid:TcxGridTableView):Boolean;
    procedure SetDupPhoneNo;
  protected
    function DoSearch: Boolean; override; // 조회
    function DoSave  : Boolean; override; // 발송
  end;

var
  MemberSMSForm: TMemberSMSForm;

implementation

uses
  Common, DBModule, LeafletSMS, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberSMSForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddNextWeek;
end;
procedure TMemberSMSForm.FormResize(Sender: TObject);
begin
  inherited;
  EachPanel.Top  := ConditionPanel.Top;
  EachPanel.Left := ConditionPanel.Left;
  EachPanel.Height  := Grid.Height + ConditionPanel.Height;
  EachPanel.Width   := ConditionPanel.Width;

  NoticePanel.Top  := (Self.Height - NoticePanel.Height) div 2 + Self.Top;
  NoticePanel.Left := (Self.Width  - NoticePanel.Width ) div 2 + Self.Left;

  HelpPanel.Top  := (Self.Height - HelpPanel.Height) div 2 + Self.Top;
  HelpPanel.Left := (Self.Width  - HelpPanel.Width ) div 2 + Self.Left;
end;

//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TMemberSMSForm.FormShow(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;

  isLoading := true;
  try
    SMSReserveDateEdit.Date    := Now;
    SMSInfoPagerInfoCustomerLabel.Caption   := StoreCode;
    SMSInfoPagerChargeCustomerLabel.Caption := Format('※ 보내는사람'#13'   %s 또는 %s 로'#13'   하시면 자동충전됩니다',[GetOnlyNumber(BusinessNumber), StoreCode]);
    GetCustomerSmsInfo(true);

    // 메시지함 값들을 읽어온다
    OpenQuery('select  NM_CODE1, '
             +'        NM_CODE2 '
             +'  from  MS_CODE '
             +' where  CD_HEAD   = :P0 '
             +'   and  CD_STORE  = :P1 '
             +'   and  CD_KIND   = ''22'' '
             +'   and  NM_CODE3  = ''0'' '
             +'   and  DS_STATUS = ''0'' '
             +' order by CD_CODE',
              [HeadStoreCode,
               StoreCode]);
    try
      while not Query.Eof do
      begin
        New(vCode);
        vCode^.Data := Query.Fields[1].AsString;
        SMSSymbolPagerMessageComboBox.Properties.Items.AddObject(Query.Fields[0].AsString, TObject(vCode));
        Query.Next;
      end;
      SMSSymbolPagerMessageComboBox.ItemIndex := 0;
    finally
      FinishQuery;
    end;
  finally
    isLoading := false;
  end;
  DefaultMessage := SMSMessageMemo.Text;
  ToolBarDockPanel.Enabled := false;
  SMSPanel.Enabled         := false;
  ConditionPanel.Enabled   := false;
  Grid.Enabled             := false;
  if GetIniFile('문자충전', '은행','') <> '' then
    SMSInfoPagerChargeBankLabel.Caption := GetIniFile('문자충전', '은행','');
  if GetIniFile('문자충전', '계좌','') <> '' then
    SMSInfoPagerChargeAccountLabel.Caption := GetIniFile('문자충전', '계좌','');
  if GetIniFile('문자충전', '예금주','') <> '' then
    SMSInfoPagerChargeOwnerLabel.Caption := GetIniFile('문자충전', '예금주','');
  if GetIniFile('문자충전', '비고','') <> '' then
  begin
    SMSInfoPagerChargeCustomerLabel.Caption := GetIniFile('문자충전', '비고','');
    SMSInfoPagerChargeCustomerLabel.Caption := Replace(SMSInfoPagerChargeCustomerLabel.Caption,'#13',#13);
  end;
//  if SMSPhoneEdit.Text = EmptyStr then
//    cxHyperLinkEdit3Click(nil);
end;

//==============================================================================
// SMS 정보
//------------------------------------------------------------------------------
// 입력창을 수정할 때
procedure TMemberSMSForm.EditPropertiesChange(Sender: TObject);
var vTemp :String;
begin
  inherited;

  if isLoading then Exit;

  if Sender = SMSMessageMemo then
  begin
    SMSMessageLengthLabel.Caption := Format('[ %d / %s byte ]',[LengthB(SMSMessageMemo.Text), Ifthen(SmsRadioButton.Checked, '90','2,000')]);
  end
  else if Sender = ConditionSaleAmtCheckBox then
  begin
    ConditionFromAmtEdit.Enabled := ConditionSaleAmtCheckBox.Checked;
    ConditionToAmtEdit.Enabled   := ConditionSaleAmtCheckBox.Checked;
  end
  else if Sender = ConditionVisitCheckBox then
  begin
    ConditionFromVisitEdit.Enabled := ConditionVisitCheckBox.Checked;
    ConditionToVisitEdit.Enabled   := ConditionVisitCheckBox.Checked;
  end
  else if Sender = ConditionPointCheckBox then
  begin
    ConditionFromPointEdit.Enabled := ConditionPointCheckBox.Checked;
    ConditionToPointEdit.Enabled   := ConditionPointCheckBox.Checked;
  end
  else if Sender = ConditionJoinFromDateEdit then
  begin
    if (ConditionJoinFromDateEdit.Date > ConditionJoinToDateEdit.Date) or (ConditionJoinToDateEdit.Date = 0)  then
      ConditionJoinToDateEdit.Date := ConditionJoinFromDateEdit.Date;
  end
  else  if Sender = ConditionJoinToDateEdit then
  begin
    if (ConditionJoinFromDateEdit.Date > ConditionJoinToDateEdit.Date) or (ConditionJoinFromDateEdit.Date = 0) then
      ConditionJoinFromDateEdit.Date := ConditionJoinToDateEdit.Date;
  end
  else if Sender = ConditionFromDateEdit then
  begin
    if (ConditionFromDateEdit.Date > ConditionToDateEdit.Date) or (ConditionToDateEdit.Date = 0)  then
      ConditionToDateEdit.Date := ConditionFromDateEdit.Date;
  end
  else  if Sender = ConditionToDateEdit then
  begin
    if (ConditionFromDateEdit.Date > ConditionToDateEdit.Date) or (ConditionFromDateEdit.Date = 0) then
      ConditionFromDateEdit.Date := ConditionToDateEdit.Date;
  end
  else if Sender = ConditionBirthFromDateEdit then
  begin
    if (ConditionBirthFromDateEdit.Date > ConditionBirthToDateEdit.Date) or (ConditionBirthToDateEdit.Date = 0)  then
      ConditionBirthToDateEdit.Date := ConditionBirthFromDateEdit.Date;
  end
  else  if Sender = ConditionBirthToDateEdit then
  begin
    if (ConditionBirthFromDateEdit.Date > ConditionBirthToDateEdit.Date) or (ConditionBirthFromDateEdit.Date = 0) then
      ConditionBirthFromDateEdit.Date := ConditionBirthToDateEdit.Date;
  end
  else if Sender = ConditionWeddingFromDateEdit then
  begin
    if (ConditionWeddingFromDateEdit.Date > ConditionWeddingToDateEdit.Date) or (ConditionWeddingToDateEdit.Date = 0)  then
      ConditionWeddingToDateEdit.Date := ConditionWeddingFromDateEdit.Date;
  end
  else  if Sender = ConditionWeddingToDateEdit then
  begin
    if (ConditionWeddingFromDateEdit.Date > ConditionWeddingToDateEdit.Date) or (ConditionWeddingFromDateEdit.Date = 0) then
      ConditionWeddingFromDateEdit.Date := ConditionWeddingToDateEdit.Date;
  end
  else if Sender = TransTypeComboBox then
  begin
    case TransTypeComboBox.ItemIndex of
      0 :
      begin
        PointButton.Visible       := true;
        MemberNameButton.Visible  := true;
        MemberAddButton.Visible   := true;
        EachPanel.Visible  := false;
        GridLevel.GridView := MemberGridView;
        ConditionPanel.Visible := true;
        ConditionToolBar.Visible             := false;
        ConditionToolBarDateLabel.Visible    := false;
        ConditionToolBarFromDateEdit.Visible := false;
        ConditionToolBarDateToLabel.Visible  := false;
        ConditionToolBarToDateEdit.Visible   := false;
      end;
      1 :
      begin
        PointButton.Visible       := false;
        MemberNameButton.Visible  := false;
        EachPanel.Visible         := true;
        MemberAddButton.Visible   := false;
        ConditionToolBar.Visible             := false;
        ConditionToolBarDateLabel.Visible    := false;
        ConditionToolBarFromDateEdit.Visible := false;
        ConditionToolBarDateToLabel.Visible  := false;
        ConditionToolBarToDateEdit.Visible   := false;
      end;
      2,3 :
      begin
        PointButton.Visible       := false;
        MemberNameButton.Visible  := false;
        EachPanel.Visible         := false;
        MemberAddButton.Visible   := false;
        GridLevel.GridView := ReservationGridView;
        ConditionPanel.Visible := false;
        ConditionToolBar.Visible             := true;
        ConditionToolBarDateLabel.Visible    := true;
        ConditionToolBarFromDateEdit.Visible := true;
        ConditionToolBarDateToLabel.Visible  := true;
        ConditionToolBarToDateEdit.Visible   := true;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 이모티콘 레이블을 클릭할 때
procedure TMemberSMSForm.SMSSymbolPagerSymbolLabelClick(Sender: TObject);
var
  vStr: string;
begin
  inherited;

  if LengthB(SMSMessageMemo.Text + (Sender as TLabel).Caption) > 180 then
    Exit;
  vStr := SMSMessageMemo.Text;
  Insert((Sender as TLabel).Caption, vStr, SMSMessageMemo.SelStart+1);
  SMSMessageMemo.Text := vStr;
  SMSMessageMemo.SetFocus;
  SMSMessageMemo.SelStart := Length(SMSMessageMemo.Text);
end;
procedure TMemberSMSForm.TelNoMemoKeyPress(Sender: TObject; var Key: Char);
var vIndex :Integer;
begin
  inherited;
  if Key <> #13 then Exit;
  for vIndex := 0 to (Sender as TcxMemo).Lines.Count-1 do
  begin
    if Length(GetOnlyNumber((Sender as TcxMemo).Lines.Strings[vIndex])) < 10 then
      (Sender as TcxMemo).Lines.Delete(vIndex)
    else
      (Sender as TcxMemo).Lines.Strings[vIndex] := GetPhoneNo((Sender as TcxMemo).Lines.Strings[vIndex]);
  end;

  EashCountLabel.Caption := Format('( %d 명)',[TelNoMemo.Lines.Count
                                             + TelNo2Memo.Lines.Count
                                             + TelNo3Memo.Lines.Count
                                             + TelNo4Memo.Lines.Count
                                             + TelNo5Memo.Lines.Count]);
end;

procedure TMemberSMSForm.TransTypeButtonClick(Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 메시지함 콤보박스를 변경할 때
procedure TMemberSMSForm.SMSSymbolPagerMessageComboBoxPropertiesChange(Sender: TObject);
begin
  inherited;
  SMSSymbolPagerMessageMemo.Text := GetStrPointerData(SMSSymbolPagerMessageComboBox);
end;
//------------------------------------------------------------------------------
// 메시지함 입력 버튼
procedure TMemberSMSForm.SMSSymbolPagerMessageButtonClick(Sender: TObject);
begin
  inherited;

  if Trim(SMSSymbolPagerMessageMemo.Text) <> EmptyStr then
  begin
    SMSMessageMemo.SetFocus;
    SMSMessageMemo.Text     := SMSSymbolPagerMessageMemo.Text;
    SMSMessageMemo.SelStart := Length(SMSMessageMemo.Text);
  end;
end;


procedure TMemberSMSForm.SetDupPhoneNo;
var vIndex :Integer;
begin
  try
    MemberGridView.DataController.BeginUpdate;
    for vIndex := 1 to MemberGridView.DataController.RecordCount-1 do
    begin
      if MemberGridView.DataController.FindRecordIndexByText(vIndex-1, MemberGridViewMobileNoColumn.Index, MemberGridView.DataController.Values[vIndex, MemberGridViewMobileNoColumn.Index], false, true, true) <> vIndex then
      begin
        MemberGridView.DataController.Values[vIndex-1, MemberGridViewDup.Index] := 'Y';
        MemberGridView.DataController.Values[vIndex,   MemberGridViewDup.Index] := 'Y';
      end
      else
        MemberGridView.DataController.Values[vIndex, MemberGridViewDup.Index] := 'N';
    end;
  finally
    MemberGridView.DataController.EndUpdate;
  end;
end;

procedure TMemberSMSForm.SMSImmediateRadioButtonClick(Sender: TObject);
begin
  inherited;
  SMSReserveDateEdit.Enabled := SMSReserveRadioButton.Checked;
  if SMSReserveDateEdit.Enabled then
    SMSReserveDateEdit.Date  := IncMinute(Now, 5);
end;

procedure TMemberSMSForm.SMSMessageMemoEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := false;
end;

procedure TMemberSMSForm.SMSMessageMemoExit(Sender: TObject);
begin
  inherited;
  KeyPreview := true;
end;

//------------------------------------------------------------------------------
// 보내는 전화번호를 빠져나갈 때
procedure TMemberSMSForm.SMSPhoneEditExit(Sender: TObject);
begin
  inherited;

  if SMSPhoneEdit.Text = EmptyStr then
    Exit;
  if Length(GetPhoneNo(SMSPhoneEdit.Text)) in [8,9,10,11,12,13,14] then
    SMSPhoneEdit.Text := GetPhoneNo(SMSPhoneEdit.Text)
  else
  begin
    ErrBox(SMSPhoneLabel.Caption+msgMustInput);
    SMSPhoneEdit.SetFocus;
    SMSPhoneEdit.SelectAll;
  end;
end;
//------------------------------------------------------------------------------
// 전송 시간 라디오 버튼을 선택할 때
procedure TMemberSMSForm.SMSRadioButtonClick(Sender: TObject);
begin
  inherited;
  SubjectEdit.Enabled := false;
  SMSMessageLengthLabel.Caption := Format('[ %d / %s byte ]',[LengthB(SMSMessageMemo.Text), Ifthen(SmsRadioButton.Checked, '90','2,000')]);
end;

//==============================================================================
// 조회 결과
//------------------------------------------------------------------------------
// 조회 결과 탭을 변경할 때
procedure TMemberSMSForm.ReservationGridViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var
  vIndex, vCount: Integer;
begin
  inherited;
  vCount    := 0;
  for vIndex := 0 to ReservationGridView.DataController.FilteredRecordCount-1 do
    if ReservationGridView.DataController.Values[ReservationGridView.DataController.FilteredRecordIndex[vIndex], 0] then
      Inc(vCount);
  ReservationGridView.DataController.Summary.FooterSummaryValues[0] := vCount;
end;

procedure TMemberSMSForm.ReservationGridViewSendHeaderClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  ReservationGridView.DataController.BeginFullUpdate;
  for vIndex := 0 to ReservationGridView.DataController.RecordCount-1 do
  begin
    if ReservationGridViewSend.Tag = 0 then
      ReservationGridView.DataController.Values[vIndex, ReservationGridViewSend.Index] := True
    else
      ReservationGridView.DataController.Values[vIndex, ReservationGridViewSend.Index] := False;
  end;
  ReservationGridView.DataController.EndFullUpdate;
  ReservationGridViewSend.Tag := Ifthen(ReservationGridViewSend.Tag=0,1,0);
end;

procedure TMemberSMSForm.ReservationGridViewSendPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ReservationGridView.DataController.Post;
end;

//------------------------------------------------------------------------------
// 조회 결과 가입일 그리드 체크박스를 선택할 때
procedure TMemberSMSForm.MemberAddButtonClick(Sender: TObject);
begin
  inherited;
  MemberGridView.DataController.BeginUpdate;
  MemberGridView.DataController.AppendRecord;
  MemberGridView.DataController.Values[MemberGridView.DataController.RecordCount-1, MemberGridViewSendColumn.Index]       := true;
  MemberGridView.DataController.Values[MemberGridView.DataController.RecordCount-1, MemberGridViewMemberNameColumn.Index] := '';
  MemberGridView.DataController.Values[MemberGridView.DataController.RecordCount-1, MemberGridViewMobileNoColumn.Index]   := '';
  MemberGridView.DataController.EndUpdate;
  MemberGridView.Controller.FocusedRecordIndex := MemberGridView.DataController.RecordCount-1;
end;

procedure TMemberSMSForm.MemberGridViewDataControllerFilterChanged(
  Sender: TObject);
var vIndex :Integer;
begin
  try
    MemberGridView.DataController.BeginUpdate;
    for vIndex := 0 to MemberGridView.DataController.RecordCount-1 do
      MemberGridView.DataController.Values[vIndex, MemberGridViewDup.Index] := 'N';
  finally
    MemberGridView.DataController.EndUpdate;
  end;
  MemberGridViewSendColumnPropertiesEditValueChanged(MemberGridView);
end;

procedure TMemberSMSForm.MemberGridViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var
  vIndex, vCount: Integer;
begin
  inherited;
  vCount := 0;
  for vIndex := 0 to MemberGridView.DataController.FilteredRecordCount-1 do
  begin
    if NVL(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewMobileNoColumn.Index],'') = '' then
      Continue;

    if MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], 0] then
      Inc(vCount);
  end;

  MemberGridView.DataController.Summary.FooterSummaryValues[0] := vCount;
end;

procedure TMemberSMSForm.MemberGridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then Exit;

  MemberGridViewMobileNoColumn.Options.Editing    := NVL(MemberGridView.DataController.Values[AFocusedRecord.Index, MemberGridViewMemberNoColumn.Index],'') = '';
  MemberGridViewMobileNoColumn.Options.Focusing   := NVL(MemberGridView.DataController.Values[AFocusedRecord.Index, MemberGridViewMemberNoColumn.Index],'') = '';
  MemberGridViewMemberNameColumn.Options.Editing  := NVL(MemberGridView.DataController.Values[AFocusedRecord.Index, MemberGridViewMemberNoColumn.Index],'') = '';
  MemberGridViewMemberNameColumn.Options.Focusing := NVL(MemberGridView.DataController.Values[AFocusedRecord.Index, MemberGridViewMemberNoColumn.Index],'') = '';
end;

procedure TMemberSMSForm.MemberGridViewMobileNoColumnPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := GetPhoneNo(DisplayValue);
end;

procedure TMemberSMSForm.MemberGridViewSendColumnHeaderClick(
  Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  MemberGridView.DataController.BeginFullUpdate;
  for vIndex := 0 to MemberGridView.DataController.RecordCount-1 do
  begin
    if MemberGridViewSendColumn.Tag = 0 then
      MemberGridView.DataController.Values[vIndex, MemberGridViewSendColumn.Index] := True
    else
      MemberGridView.DataController.Values[vIndex, MemberGridViewSendColumn.Index] := False;
  end;
  MemberGridView.DataController.EndFullUpdate;
  MemberGridViewSendColumn.Tag := Ifthen(MemberGridViewSendColumn.Tag=0,1,0);
end;

procedure TMemberSMSForm.MemberGridViewSendColumnPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  MemberGridView.DataController.Post;
end;

procedure TMemberSMSForm.MemberGridViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if MemberGridView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[MemberGridViewMemberNoColumn.Index] = null then Exit;
  if ARecord.Values[MemberGridViewDup.Index] = 'Y' then
    AStyle := StyleFontRed;

  Exit;

  if not GetFilteredSort(MemberGridView) and (ARecord <> nil) and (AItem <> nil) and
     (MemberGridView.DataController.RecordCount > 0) and (ARecord.Index >= 0) and
     (GetOnlyNumber(ARecord.Values[MemberGridViewMobileNoColumn.Index]) <> null) and
     (MemberGridView.DataController.FindRecordIndexByText(Ifthen(ARecord.Index = MemberGridView.DataController.RecordCount-1, 0, ARecord.Index+1), MemberGridViewMobileNoColumn.Index, ARecord.Values[MemberGridViewMobileNoColumn.Index], false, true, true) <> ARecord.Index) then
    AStyle := StyleFontRed;
end;


//==============================================================================
// 함수
//------------------------------------------------------------------------------
// SMS 충전 정보 읽기
function TMemberSMSForm.GetCustomerSmsInfo(aMsg:Boolean): Boolean;
var
  vResultStr: String;
  vTotalChargeQty, vSmsUseQty, vLmsUseQty, vMmsUseQty, vLeafletUseQty, vLastChargeQty, vLastChargeAmt: Integer;
  vLastChargeDate, vLastUseDate: String;
  vResult: Boolean;
  vLastUseQty,
  vLastUseAmt,
  vChargeAmt :Integer;
  vRemainAmt :Integer;
  vRemainSmsQty :Integer;
  vSmsPrice,
  vLmsPrice,
  vMmsPrice,
  vLeafletPrice:Double;
  vResultList: TStringList;
begin
  Result := false;
  Domain := 'http://전단.kr';
  try
    GetServiceSoap.smsCount2(StoreCode,
                             vResult,
                             vChargeAmt,
                             vRemainAmt,
                             vSmsUseQty,
                             vLmsUseQty,
                             vMmsUseQty,
                             vLeafletUseQty,
                             vRemainSmsQty,
                             vSmsPrice,
                             vLmsPrice,
                             vMmsPrice,
                             vLeafletPrice,
                             vLastChargeDate,
                             vLastChargeQty,
                             vLastChargeAmt,
                             vLastUseDate,
                             vLastUseQty,
                             vLastUseAmt,
                             vResultStr);

    if not vResult then
    begin
      if vResultStr <> '충전 내역이 없습니다.' then
        ErrBox(vResultStr);
      Exit;
    end
    else
    begin
      SMSInfoPagerInfoSMSCountEdit.Value := vRemainSmsQty;
      SMSInfoPagerInfoLMSCountEdit.Value := RoundNumber(vRemainAmt / vLmsPrice,1);
      SMSInfoPagerInfoRestAmtEdit.Value  := vRemainAmt;
      SMSInfoPagerInfoDateEdit.Text      := FormatMaskText('!0000-90-90;0; ',vLastChargeDate) ;
      SmsPriceLabel.Caption              := FormatFloat('#,0원',vSmsPrice);
      LmsPriceLabel.Caption              := FormatFloat('#,0원',vLmsPrice);
      LeafletPriceLabel.Caption          := '전단문자 : '+ FormatFloat('#,0원',vLeafletPrice);

      vResultList := TStringList.Create;
      Split(vResultStr, '|', vResultList);
      Domain := vResultList[0];
      if Trim(Domain) = EmptyStr then
        Domain := 'http://전단.kr';

      if aMsg then
      begin
        SMSPhoneEdit.Text   := GetPhoneNo(vResultList[1]);
        RegPhoneNo          := GetPhoneNo(vResultList[1]);
        if SMSPhoneEdit.Text = EmptyStr then
          SMSPhoneEdit.Text := StoreTelNumber;
        SMSMessageMemo.Text := Format('(광고)'#13'%s'#13'무료거부 0808080697'#13'{인증키}',[StoreName]);
      end;
      vResultList.Free;

      SMSPrice     := vSmsPrice;
      LMSPrice     := vLmsPrice;
      LeafletPrice := vLeafletPrice;
      ChargeAmount := vRemainAmt;
    end;
  except
    on E: Exception do
    begin
      ErrBox(msgConnectWebService+E.Message);
      Exit;
    end;
  end;
  Result := true;
end;

function TMemberSMSForm.GetFilteredSort(aGrid: TcxGridTableView): Boolean;
var vIndex :Integer;
begin
  Result := false;
  for vIndex := 0 to aGrid.ColumnCount-1 do
  begin
    if (aGrid.Columns[vIndex].Filtered) or (aGrid.Columns[vIndex].SortIndex >= 0) then
    begin
      result := true;
      Break;
    end;
  end;
end;

procedure TMemberSMSForm.HelpCloseButtonClick(Sender: TObject);
begin
  inherited;
  ToolBarDockPanel.Enabled := true;
  SMSPanel.Enabled         := true;
  ConditionPanel.Enabled   := true;
  Grid.Enabled             := true;
  HelpPanel.Visible        := false;
end;

procedure TMemberSMSForm.LmsRadioButtonClick(Sender: TObject);
var vTemp :String;
begin
  inherited;
  SubjectEdit.Enabled := true;
  SMSMessageLengthLabel.Caption := Format('[ %d / %s byte ]',[LengthB(SMSMessageMemo.Text), Ifthen(SmsRadioButton.Checked, '90','2,000')]);
end;

procedure TMemberSMSForm.MemberNameButtonClick(Sender: TObject);
var vSelStart :Integer;
begin
  inherited;
  vSelStart := SMSMessageMemo.SelStart;
  if Sender = MemberNameButton then
    SMSMessageMemo.Text := Copy(SMSMessageMemo.Text,1,SMSMessageMemo.SelStart)+'{회원명}'+Copy(SMSMessageMemo.Text,SMSMessageMemo.SelStart+1, Length(SMSMessageMemo.Text)-SMSMessageMemo.SelStart)
  else
    SMSMessageMemo.Text := Copy(SMSMessageMemo.Text,1,SMSMessageMemo.SelStart)+'{포인트}'+Copy(SMSMessageMemo.Text,SMSMessageMemo.SelStart+1, Length(SMSMessageMemo.Text)-SMSMessageMemo.SelStart);

  SMSMessageMemo.SelStart := vSelStart+5;
  SMSMessageMemo.SetFocus;

end;

procedure TMemberSMSForm.NoticePanelClose(Sender: TObject);
begin
  inherited;
  ToolBarDockPanel.Enabled := true;
  SMSPanel.Enabled         := true;
  ConditionPanel.Enabled   := true;
  Grid.Enabled             := true;
end;

procedure TMemberSMSForm.NoticeRadioButtonClick(Sender: TObject);
begin
  inherited;
  SMSMessageMemo.Lines.Clear;
end;

//------------------------------------------------------------------------------
// 조회 버튼
function TMemberSMSForm.DoSearch: Boolean;
var vWhere : Array[0..11] of String;
begin
  inherited;
  Result := false;
  case TransTypeComboBox.ItemIndex of
    0 :
    begin
      if (ConditionFromDateEdit.Date > 0) and (ConditionToDateEdit.Date > 0) then
        vWhere[0] := Format('inner join '
                           +'(select CD_MEMBER, '
                           +'        Sum(AMT_SALE) as AMT_SALE, '
                           +'        Count(CD_MEMBER) as CNT_VISIT '
                           +'   from SL_SALE_H '
                           +'  where CD_HEAD  =:P0 '
                           +'    and CD_STORE =:P1 '
                           +'    and YMD_SALE between ''%s'' and ''%s'' '
                           +'    and DS_SALE  <> ''V'' '
                           +'  group by CD_MEMBER ) as b on b.CD_MEMBER = a.CD_MEMBER ',
                           [DtoS(ConditionFromDateEdit.Date), DtoS(ConditionToDateEdit.Date)]);

      if (ConditionJoinFromDateEdit.Date > 0) then
        vWhere[1] := Format('and a.YMD_ISU >= ''%s'' ',[DtoS(ConditionJoinFromDateEdit.Date)]);

      if (ConditionJoinToDateEdit.Date > 0) then
        vWhere[2] := Format('and a.YMD_ISU <= ''%s'' ',[DtoS(ConditionJoinToDateEdit.Date)]);

      if (ConditionVisitBeforeDateEdit.Date > 0) then
        vWhere[3] := Format('and b.YMD_VISIT <= ''%s'' ',[DtoS(ConditionVisitBeforeDateEdit.Date)]);

      if (ConditionVisitAfterDateEdit.Date > 0) then
        vWhere[4] := Format('and b.YMD_VISIT >= ''%s'' ',[DtoS(ConditionVisitAfterDateEdit.Date)]);

      if ConditionPointCheckBox.Checked then
        vWhere[5] := Format('and b.TOTAL_POINT Between %s and %s ', [FormatFloat('#0',ConditionFromPointEdit.Value), FormatFloat('#0',ConditionToPointEdit.Value)]);

      if (vWhere[0] <> EmptyStr) and ConditionSaleAmtCheckBox.Checked then
        vWhere[6] := Format('and b.AMT_SALE Between %s and %s ', [FormatFloat('#0',ConditionFromAmtEdit.Value), FormatFloat('#0',ConditionToAmtEdit.Value)])
      else if (vWhere[0] = EmptyStr) and ConditionSaleAmtCheckBox.Checked then
        vWhere[6] := Format('and b.AMT_SALE Between %s and %s ', [FormatFloat('#0',ConditionFromAmtEdit.Value), FormatFloat('#0',ConditionToAmtEdit.Value)]);

      if (ConditionBirthFromDateEdit.Date > 0) and (ConditionBirthToDateEdit.Date > 0) then
        vWhere[7] := Format('inner join '
                           +' (select CD_MEMBER '
                           +'    from MS_MEMBER '
                           +'   where CD_HEAD   = :P0 '
                           +'     and CD_STORE  = :P2 '
                           +'     and YN_LUNAR  = ''N'' '
                           +'     and YMD_BIRTH <> '''' '
                           +'     and  SubString(YMD_BIRTH,5,4) between SubString(''%s'',5,4) and SubString(''%s'',5,4)) as c on a.CD_MEMBER = c.CD_MEMBER left outer join '
                           +' (select CD_MEMBER '
                           +'    from MS_MEMBER  '
                           +'   where CD_HEAD   =:P0 '
                           +'     and CD_STORE  =:P2 '
                           +'     and YN_LUNAR  = ''Y'' '
                           +'     and YMD_BIRTH <> '''' '
                           +'     and SubString(YMD_BIRTH,5,4) between SubString(''%s'',5,4) and SubString(''%s'',5,4)) as d on a.CD_MEMBER = d.CD_MEMBER and a.YMD_BIRTH <> '''' ',
                           [DtoS(ConditionBirthFromDateEdit.Date),
                            DtoS(ConditionBirthToDateEdit.Date),
                            DtoS(ConditionBirthFromDateEdit.Date),
                            DtoS(ConditionBirthToDateEdit.Date)]);

      if (ConditionWeddingFromDateEdit.Date > 0) and (ConditionWeddingToDateEdit.Date > 0) then
        vWhere[8] := Format('inner join '
                           +'(select  CD_MEMBER '
                           +'   from  MS_MEMBER '
                           +'  where  CD_HEAD  =:P0 '
                           +'    and  CD_STORE =:P2 '
                           +'    and  YMD_MARRI <> '''' '
                           +'    and  SubString(YMD_MARRI,5,4) between SubString(''%s'',5,4) and SubString(''%s'',5,4)) as e on a.CD_MEMBER = e.CD_MEMBER and a.YMD_MARRI <> '''' ',
                           [DtoS(ConditionWeddingFromDateEdit.Date),
                            DtoS(ConditionWeddingToDateEdit.Date)]);

      if (vWhere[0] <> EmptyStr) and ConditionVisitCheckBox.Checked then
        vWhere[10] := Format('and b.CNT_VISIT Between %s and %s ', [FormatFloat('#0',ConditionFromVisitEdit.Value), FormatFloat('#0',ConditionToVisitEdit.Value)]);

      if AgreeCheckBox.Checked then
        vWhere[11] := 'and ((Ifnull(DAYNAME(a.YMD_AGREE),'''') = '''') or  DATE(a.YMD_AGREE) < ADDDATE(NOW(), INTERVAL -2 YEAR)) ';

      if AgreeYesCheckBox.Checked then
        vWhere[9] := 'and (Ifnull(DAYNAME(a.YMD_AGREE),'''') <> '''') and DATE(a.YMD_AGREE) >= ADDDATE(NOW(), INTERVAL -2 YEAR) ';

      try
        ShowMsg('조회 중입니다.');

        MemberGridView.DataController.Filter.Clear;
        MemberGridView.DataController.ClearSorting(true);
        MemberGridView.DataController.RecordCount := 0;
        OpenQuery('select   ''1'' as CHK, '
                 +'         a.CD_MEMBER, '
                 +'         a.NM_MEMBER, '
                 +'         case when a.DS_SEX = ''0'' then ''남자'' else ''여자'' end as GENDER, '
                 +'         f.NM_CODE1 as DS_MEMBER, '
                 +'         GetPhoneNo(GetOnlyNumber(AES_Decrypt(a.TEL_MOBILE, 71483))) as TEL_MOBILE, '
                 +'         StoD(a.YMD_ISU) as YMD_ISU, '
                 +'         g.TOTAL_POINT, '
                 +'         g.AMT_SALE as AMT_SALE_TOT, '
                 +Ifthen(vWhere[0] = EmptyStr, '', 'b.AMT_SALE, ')
                 +Ifthen(vWhere[7] = EmptyStr, '', Format('case a.YN_LUNAR when ''Y'' then StoD(LunarToSolar_F(ConCat(SubString(''%s'',1,4),SubString(YMD_BIRTH,5,4)),0)) '
                                                  +'                when ''N'' then StoD(ConCat(SubString(''%s'',1,4),SubString(YMD_BIRTH,5,4))) '
                                                  +'                else '''' end YMD_BIRTH, ',
                                                  [DtoS(ConditionBirthFromDateEdit.Date),
                                                   DtoS(ConditionBirthFromDateEdit.Date)]))
                 +Ifthen(vWhere[8] = EmptyStr, '', ' StoD(a.YMD_MARRI) as YMD_MARRI, ')
                 +'         StoD(g.YMD_VISIT) as YMD_VISIT, '
                 +'         g.CNT_VISIT as CNT_VISIT_TOT, '
                 +'         case when Ifnull(DAYNAME(a.YMD_AGREE),'''') <> ''''  then ConCat(Left(a.YMD_AGREE,4),''년'',Substring(a.YMD_AGREE,5,2),''월'',Right(a.YMD_AGREE,2),''일'') else '''' end as YMD_AGREE, '
                 +'         case when (Ifnull(DAYNAME(a.YMD_AGREE),'''') <> '''') and (DATE(a.YMD_AGREE) >= ADDDATE(NOW(), INTERVAL -2 YEAR)) then ''Y'' else ''N'' end YN_AGREE '
                 +'   from  MS_MEMBER a left outer '
                 +'         MS_CODE       as f on f.CD_HEAD  = a.CD_HEAD '
                 +'                           and f.CD_STORE = a.CD_STORE '
                 +'                           and f.CD_KIND  = ''05'' '
                 +'                           and f.CD_CODE  = a.DS_MEMBER left outer join '
                 +'         MS_MEMBER_ETC as g on g.CD_HEAD  = a.CD_HEAD '
                 +'                           and g.CD_STORE = a.CD_STORE '
                 +'                           and g.CD_MEMBER = a.CD_MEMBER left outer join '
                 +vWhere[0]
                 +vWhere[7]
                 +vWhere[8]
                 +'   where a.CD_HEAD  =:P0 '
                 +'     and a.CD_STORE =:P2 '
                 +'     and Length(Cast(AES_Decrypt(a.TEL_MOBILE, 71483) as char)) >= 10 '
                 +'     and a.DS_STATUS = 0 '
                 +'     and a.YN_NEWS = ''Y'' '
                 +vWhere[1]
                 +vWhere[2]
                 +vWhere[3]
                 +vWhere[4]
                 +vWhere[5]
                 +vWhere[6]
                 +vWhere[9]
                 +vWhere[10]
                 +vWhere[11]
                 +' order by a.TEL_MOBILE ',
        [HeadStoreCode,
         StoreCode,
         Ifthen(GetHeadConfig(5)='0',StoreCode,StandardStore)]);

         Result := DM.ReadQuery(Query, MemberGridView);
        SetDupPhoneNo;
        ShowMsg;
      except
        on E: Exception do
        begin
          ErrBox(E.Message);
          ShowMsg(E.Message, true, -1);
        end;
      end;
    end;
    2 :
    begin
      OpenQuery('select ''1'' as CHK, '
               +'       Date_Format(DT_BOOKING, ''%Y-%m-%d'') as YMD_BOOKING, '
               +'       case when CD_MEMBER = '''' then NM_NAME '
               +'            else ConCat(CD_MEMBER,''-'',NM_NAME) '
               +'       end as NM_NAME, '
               +'       case when YN_SALE = ''Y'' then ''방문'' else ''미방문'' end as YN_SALE, '
               +'       GetPhoneNo(NO_TEL) as NO_TEL, '
               +'       CNT_PERSON, '
               +'       REMARK, '
               +'       NM_NAME as CUST_NAME '
               +'  from SL_BOOKING '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and Date_Format(DT_BOOKING, ''%Y%m%d'')  between :P2 and :P3 '
               +' order by DT_BOOKING',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)]);

      Result := DM.ReadQuery(Query, ReservationGridView);
    end;
  end;

end;

//------------------------------------------------------------------------------
// 저장 버튼
procedure TMemberSMSForm.AdDesignMakeButtonClick(Sender: TObject);
var vVersion :String;
begin
  inherited;
  vVersion := GetFileVersion('C:\Program Files\Internet Explorer\iexplore.exe');
  if StrToIntDef(Copy(vVersion,1,Pos('.',vVersion)-1),0) < 10 then
  begin
    MsgBox('Internet Explorer이 버전 10 이상이어야 합니다');
    Exit;
  end;

  ShellExecute(0, 'open', 'iexplore.exe', PChar('http://전단.kr/pop/main.jsp?cust_id='+StoreCode+'&ds_app=ERP&gubun=AD&ver=1.0'), nil, SW_SHOW);
end;

procedure TMemberSMSForm.AdRadioButtonClick(Sender: TObject);
begin
  inherited;
  if SmsRadioButton.Checked then
    SMSRadioButtonClick(SMSRadioButton)
  else
    LMSRadioButtonClick(nil);
end;

procedure TMemberSMSForm.AgreeCheckBoxPropertiesChange(Sender: TObject);
begin
  inherited;
  if AgreeCheckBox.Checked then
  begin
    LmsRadioButton.Checked := true;
    SubjectEdit.Text    := '문자수신동의';
    SMSMessageMemo.Text := StoreName +#13
                         +'{회원명}님 안녕하세요'+#13
                         +'정보통신망법 제50조 시행령 제62조3항에 따라 광고 수신 동의 여부에 '
                         +'대해 안내드립니다.'+#13
                         +'{회원명}님은 {수신동의일자} 현재 개인정보 수집.이용 동의 및 광고 수신에 동의하신 상태입니다'+#13
                         +'동의 여부를 변경하시고자 하는 경우 무료거부를 이용하여 변경이 가능합니다'+#13
                         +'무료거부 0808080697'+#13
                         +'{인증키}';
    isChanged := true;
  end
  else
  begin
    SmsRadioButton.Checked := true;
    SMSMessageMemo.Text :='(광고)'+#13
                         +StoreName +#13
                         +'무료거부 0808080697'+#13
                         +'{인증키}';
  end;

end;

procedure TMemberSMSForm.Button1Click(Sender: TObject);
  function EncodeURL(S:string):string;
  const
    NoConversion  = ['A'..'Z','a'..'z','0'..'9','/'];
  var
    T: WideString;
    I: Integer;
    H,L: Byte;
  begin
    Result := '';
    T := WideString(S);
    for I := 1 to Length(T) do
    begin
      if (Char(T[i]) in NoConversion) and (Ord(T[I]) < 127) then
      begin
        Result := Result + T[I];
        Continue;
      end;
      H := Hi(Ord(T[I]));
      L := Lo(Ord(T[I]));
      if Ord(T[I]) > 127 then
        Result := Result + '%u' + (IntToHex(H, 2)+ IntToHex(L,2))
      else
        Result:= Result + '%' + IntToHex(L,2);
    end;
    Result:= Copy(Result,1,Length(Result));
  end;

  function DownLoadFileURL(aURL: string): Boolean;
  var
    vHttp  : TIdHttp;
    vStrem : TMemoryStream;
  begin
    vStrem := TMemoryStream.Create;
    vHttp := TIdHttp.Create(nil);
    try
      try
        vHttp.Get(aURL, vStrem);
        vStrem.SaveToFile('Leaflet.png');
        Result := FileExists('Leaflet.png');
      except
      end;
    finally
      vStrem.Free;
      vHttp.Free;
    end;
  end;
var
  vResult: string;
  vSelStart :Integer;
  vSize     :Int64;
begin
  SMSMessageMemo.SetFocus;
  // 전단문자 선택 폼 보여주기
  if ShowLeafletSelect(1024, 768, StoreCode, 'ERP', 'AD', '1.0', 'http://www.xn--6j1b831b.kr', vResult) then
  begin
    vResult := LeftStr(vResult,8);
    LeafletURL := Domain + '/'+ vResult;
    ShortURL  := vResult;
    vSelStart := SMSMessageMemo.SelStart;
    SMSMessageMemo.Text := Copy(SMSMessageMemo.Text,1,SMSMessageMemo.SelStart)+LeafletURL+Copy(SMSMessageMemo.Text,SMSMessageMemo.SelStart+1, Length(SMSMessageMemo.Text)-SMSMessageMemo.SelStart);
    SMSMessageMemo.SelStart := vSelStart+Length(LeafletURL);
    if DownLoadFileURL(Format('http://www.xn--6j1b831b.kr/%s/%s.png',[StoreCode,ShortURL ])) then
       LeafletImage.Picture.LoadFromFile('Leaflet.png');
  end
  else if vResult <> EmptyStr then
    ShowMessage(vResult);
end;

procedure TMemberSMSForm.ButtonToolBarSearchButtonClick(Sender: TObject);
var visChanged :Boolean;
begin
  inherited;
  isChanged := visChanged;
end;

procedure TMemberSMSForm.ChargeSearchButtonClick(Sender: TObject);
begin
  inherited;
  GetCustomerSmsInfo(false);
end;

procedure TMemberSMSForm.CheckButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  try
    MemberGridView.DataController.BeginUpdate;
    for vIndex := 0 to MemberGridView.Controller.SelectedRecordCount-1 do
      MemberGridView.Controller.SelectedRows[vIndex].Values[MemberGridViewSendColumn.Index] := not MemberGridView.Controller.SelectedRows[vIndex].Values[MemberGridViewSendColumn.Index];
  finally
    MemberGridView.DataController.EndUpdate;
  end;
end;

procedure TMemberSMSForm.ConditionToolBarHelpButtonClick(Sender: TObject);
begin
  inherited;
  ToolBarDockPanel.Enabled := false;
  SMSPanel.Enabled         := false;
  ConditionPanel.Enabled   := false;
  Grid.Enabled             := false;
  HelpPanel.Visible        := true;
end;

procedure TMemberSMSForm.cxHyperLinkEdit1Click(Sender: TObject);
begin
  inherited;
  if Sender = cxHyperLinkEdit1 then
    ShellExecute(handle, 'open', PChar('http://spam.kisa.or.kr/kor/notice/noticeView.jsp?p_No=10&b_No=10&d_No=72'), '', '', SW_SHOW)
  else
    ShellExecute(handle, 'open', PChar('http://spam.kisa.or.kr/kor/notice/dataView.jsp?p_No=49&b_No=49&d_No=48&cgubun=&cPage=1&searchType=ALL&searchKeyword='), '', '', SW_SHOW);
end;

procedure TMemberSMSForm.cxHyperLinkEdit3Click(Sender: TObject);
var vURL :String;
begin
  inherited;
  vURL := 'http://www.expos.co.kr/wwwCallbackReg/login.aspx?';
  vURL := Format('%scustIDStr=%s&storeNameStr=%s&idStr=%s&saupNo=%s',[vURL, Encrypt(StoreCode,5657), StoreName, Encrypt(UserCode,5657), Encrypt(BusinessNumber,5657)]);
  ShellExecute(handle, 'open', PChar(vURL), '', '', SW_SHOW)
end;

function TMemberSMSForm.DoSave: Boolean;
  function DupCheck(aPhoneList:TStringList; aPhoneaData, aPhoneNo:String):Boolean;
  var vIndex :Integer;
  begin
    Result := false;
    if Pos(aPhoneNo, aPhoneaData) > 0 then
    begin
      Result := True;
      Exit;
    end;

    For vIndex := 0 to aPhoneList.Count-1 do
    begin
      if Pos(aPhoneNo, aPhoneList.Strings[vIndex]) > 0 then
      begin
        Result := True;
        Break;
      end;
    end;
  end;

const MAX_DATA = 3000;
var
  vIndex, vCount, vSendCount, vNoAgreeCount, vIndex1:Integer;
  vPhoneNo, vPhoneTemp, vMemberCode, vResult, vMsg1, vMsg2, vSeq: string;
  vTemp: String;
  vReplaceData, vReplaceTemp, vSendMessage :String;
  vPhoneList,
  vReplaceList,
  vMemberList :TStringList;
  vReturn, vIsFinish :Boolean;
  visLeaflet :Boolean;   //전단문자 사용여부
  vUseAmount :Currency;
  visMemberName, visAgreeDate, visPoint :Boolean;
label loop;
begin
  inherited;
  if AskBox('이전 발송건에 대한 수신거부내역을 확인하시겠습니까?') then
  begin
    ExtremeMainForm.RunProgram('MemberSMSRejectShow');
    Exit;
  end;
  //전단문자가 있는지 체크
  visLeaflet := (ShortURL <> EmptyStr) and (Pos(ShortURL, SMSMessageMemo.Text) > 0);
  isChanged := false;
  try
    Result := false;
    vNoAgreeCount := 0;
    if Trim(SMSMessageMemo.Text) = EmptyStr then
    begin
      ErrBox(SMSMessageCaptionLabel.Caption+msgMustInput);
      SMSMessageMemo.SetFocus;
      Exit;
    end
    else if Trim(SMSPhoneEdit.Text) = EmptyStr then
    begin
      ErrBox(SMSPhoneLabel.Caption+msgMustInput);
      SMSPhoneEdit.SetFocus;
      Exit;
    end;

    case TransTypeComboBox.ItemIndex of
      0 : vCount := MemberGridView.DataController.Summary.FooterSummaryValues[0];
      1 : vCount := TelNoMemo.Lines.Count
                  + TelNo2Memo.Lines.Count
                  + TelNo3Memo.Lines.Count
                  + TelNo4Memo.Lines.Count
                  + TelNo5Memo.Lines.Count;
      2 : vCount := ReservationGridView.DataController.Summary.FooterSummaryValues[0];
    end;

    if vCount = 0 then
    begin
      ErrBox('발송할 전화번호가 없습니다.');
      Exit;
    end;

    if (LengthB(SMSMessageMemo.Text) <= 90) and LmsRadioButton.Checked then
    begin
      isLoading              := true;
      SMSRadioButton.Checked := true;
      isLoading              := false;
    end
    else if (LengthB(SMSMessageMemo.Text) > 90) and SmsRadioButton.Checked then
    begin
      isLoading              := true;
      LMSRadioButton.Checked := true;
      isLoading              := false;
    end;

    if LmsRadioButton.Checked and (SubjectEdit.Text = EmptyStr) then
    begin
      MsgBox('장문일 때는 제목을 입력하세요');
      SubjectEdit.SetFocus;
      Exit;
    end;

    if not AskBox(Format('%s을 발송하시겠습니까?',[Ifthen(LmsRadioButton.Checked, '장문','단문')])) then
      Exit;

    //사용가능수량을 체크한다
    if SmsRadioButton.Checked then
    begin
      if LMSPrice = 0 then
      begin
        MsgBox('단문단가가 올바르지 않습니다');
        Exit;
      end;
      vUseAmount := vCount * SMSPrice;
    end
    else
    begin
      if LMSPrice = 0 then
      begin
        MsgBox('장문단가가 올바르지 않습니다');
        Exit;
      end;
      vUseAmount := vCount * LMSPrice;
    end;

    if visLeaflet then
      vUseAmount := vUseAmount + (vCount * LeafletPrice);

    if ChargeAmount < vUseAmount then
    begin
      ErrBox(SMSInfoPagerInfoRestCountLabel.Caption+'가 부족합니다.'#13'충전 후 사용하십시오.');
      SMSInfoPager.ActivePageIndex := 1;
      Exit;
    end;

    if not DupCheckBox.Checked then
    begin
      if not AskBox('오늘 발송 된 전화번호를 제외하지 않으면'#13'같은 번호로 중복발생 될 수 있습니다'#13#13'발송 하시겠습니까?') then Exit;
    end;

    if DefaultMessage = SMSMessageMemo.Text then
    begin
      MsgBox('전송 문자내역을 확인하세요');
      Exit;
    end;

    if RegPhoneNo = '' then
    begin
      MsgBox('발신번호가 등록 되어있지 않습니다'+#13+'향후 발송차단 될 수 있습니다'+#13+'발신번호를 사전등록을 하시기바랍니다');
    end;

    try
      ShowMsg('SMS를 발송하고 있습니다.');
      vPhoneList   := TStringList.Create;
      vReplaceList := TStringList.Create;
      vMemberList  := TStringList.Create;
      vPhoneNo := EmptyStr;
      // 발송할 전화번호 구하기
      vPhoneNo    := EmptyStr;
      vMemberCode := EmptyStr;
      vIndex1       := 0;
      visMemberName := Pos('{회원명}', SMSMessageMemo.Text) > 0;
      visAgreeDate  := Pos('{수신동의일자}', SMSMessageMemo.Text) > 0;
      visPoint      := Pos('{포인트}', SMSMessageMemo.Text) > 0;

      vSendMessage := SMSMessageMemo.Text;
      if visMemberName then
      begin
        vSendMessage := Replace(vSendMessage,'{회원명}',Format('{%d}',[vIndex1]));
        Inc(vIndex1);
      end;
      if visPoint then
      begin
        vSendMessage := Replace(vSendMessage,'{포인트}',Format('{%d}',[vIndex1]));
        Inc(vIndex1);
      end;
      if visAgreeDate then
        vSendMessage := Replace(vSendMessage,'{수신동의일자}',Format('{%d}',[vIndex1]));

      //회원발송
      case TransTypeComboBox.ItemIndex of
        0 :
        begin
          for vIndex := 0 to MemberGridView.DataController.FilteredRecordCount-1 do
          begin
            if MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewMobileNoColumn.Index] = '' then Continue;

            if MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewSendColumn.Index] then
            begin
              if DupCheck(vPhoneList, vPhoneNo, GetOnlyNumber(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewMobileNoColumn.Index])) then Continue;
              vPhoneNo     := vPhoneNo     + GetOnlyNumber(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewMobileNoColumn.Index]) + '|';
              vMemberCode  := vMemberCode  + Format('''%s'',',[GetOnlyNumber(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewMemberNoColumn.Index])]);

              if MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewAgreeYn.Index] = 'N' then
                Inc(vNoAgreeCount);

              vIndex1 := 0;
              if visMemberName then
              begin
                vReplaceData := vReplaceData + Replace(NVL(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewMemberNameColumn.Index],''), '-');
                vIndex1      := 1;
              end;

              if visPoint then
              begin
                vReplaceData := vReplaceData + Ifthen(vIndex1=1, #9, '') + FormatFloat(',0점',MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewPoint.Index]);
                vIndex1      := 1;
              end;

              if visAgreeDate then
              begin
                if NVL(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewAgreeDate.Index],'') <> '' then
                  vReplaceData := vReplaceData + Ifthen(vIndex1=1,#9,'')+ NVL(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewAgreeDate.Index],'')
                else if Length(NVL(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewJoinDate.Index],'')) = 10 then
                begin
                  vTemp := GetOnlyNumber(NVL(MemberGridView.DataController.Values[MemberGridView.DataController.FilteredRecordIndex[vIndex], MemberGridViewJoinDate.Index],''));
                  vReplaceData := vReplaceData + Ifthen(vIndex1=1,#9,'')+ Format('%s년%s월%s일',[LeftStr(vTemp,4), Copy(vTemp,5,2), RightStr(vTemp,2)]);
                end;
              end;

              if visMemberName or visAgreeDate or visPoint then
                vReplaceData := vReplaceData + '|';
              if Length(vPhoneNo) > MAX_DATA then
              begin
                vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));
                vReplaceList.Add(Copy(vReplaceData, 1, Length(vReplaceData)-1));
                vMemberList.Add(vMemberCode);
                vPhoneNo     := EmptyStr;
                vReplaceData := EmptyStr;
                vMemberCode  := EmptyStr;
              end;
            end;
          end;

          if vPhoneNo <> EmptyStr then
          begin
            vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));
            vReplaceList.Add(Copy(vReplaceData, 1, Length(vReplaceData)-1));
            vMemberList.Add(vMemberCode);
            vPhoneNo     := EmptyStr;
            vReplaceData := EmptyStr;
            vMemberCode  := EmptyStr;
          end;
        end;
        1 :
        begin
          for vIndex := 0 to TelNoMemo.Lines.Count-1 do
          begin
            if Length(GetOnlyNumber(TelNoMemo.Lines.Strings[vIndex])) < 10 then Continue;
               vPhoneNo := vPhoneNo + GetOnlyNumber(TelNoMemo.Lines.Strings[vIndex])+ '|';
          end;
          if vPhoneNo <> EmptyStr then
            vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));

          vPhoneNo := EmptyStr;
          for vIndex := 0 to TelNo2Memo.Lines.Count-1 do
          begin
            if Length(GetOnlyNumber(TelNo2Memo.Lines.Strings[vIndex])) < 10 then Continue;
               vPhoneNo := vPhoneNo + GetOnlyNumber(TelNo2Memo.Lines.Strings[vIndex])+ '|';
          end;
          if vPhoneNo <> EmptyStr then
            vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));

          vPhoneNo := EmptyStr;
          for vIndex := 0 to TelNo3Memo.Lines.Count-1 do
          begin
            if Length(GetOnlyNumber(TelNo3Memo.Lines.Strings[vIndex])) < 10 then Continue;
               vPhoneNo := vPhoneNo + GetOnlyNumber(TelNo3Memo.Lines.Strings[vIndex])+ '|';
          end;
          if vPhoneNo <> EmptyStr then
            vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));

          vPhoneNo := EmptyStr;
          for vIndex := 0 to TelNo4Memo.Lines.Count-1 do
          begin
            if Length(GetOnlyNumber(TelNo4Memo.Lines.Strings[vIndex])) < 10 then Continue;
               vPhoneNo := vPhoneNo + GetOnlyNumber(TelNo4Memo.Lines.Strings[vIndex])+ '|';
          end;
          if vPhoneNo <> EmptyStr then
            vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));

          vPhoneNo := EmptyStr;
          for vIndex := 0 to TelNo5Memo.Lines.Count-1 do
          begin
            if Length(GetOnlyNumber(TelNo5Memo.Lines.Strings[vIndex])) < 10 then Continue;
               vPhoneNo := vPhoneNo + GetOnlyNumber(TelNo5Memo.Lines.Strings[vIndex])+ '|';
          end;
          if vPhoneNo <> EmptyStr then
            vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));
          vReplaceList.Add('');
        end;
        2 :   //예약고객
        begin
          for vIndex := 0 to ReservationGridView.DataController.FilteredRecordCount-1 do
          begin
            if ReservationGridView.DataController.Values[ReservationGridView.DataController.FilteredRecordIndex[vIndex], ReservationGridViewSend.Index] then
            begin
              if DupCheck(vPhoneList, vPhoneNo, GetOnlyNumber(ReservationGridView.DataController.Values[ReservationGridView.DataController.FilteredRecordIndex[vIndex], ReservationGridViewTelNo.Index])) then Continue;
              vPhoneNo     := vPhoneNo     + GetOnlyNumber(ReservationGridView.DataController.Values[ReservationGridView.DataController.FilteredRecordIndex[vIndex], ReservationGridViewTelNo.Index]) + '|';
              vReplaceData := vReplaceData + Replace(ReservationGridView.DataController.Values[ReservationGridView.DataController.FilteredRecordIndex[vIndex], ReservationGridViewName.Index], '-') + '|';
              if Length(vPhoneNo) > MAX_DATA then
              begin
                vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));
                vReplaceList.Add(Copy(vReplaceData, 1, Length(vReplaceData)-1));
                vPhoneNo     := EmptyStr;
                vReplaceData := EmptyStr;
              end;
            end;
          end;

          if vPhoneNo <> EmptyStr then
          begin
            vPhoneList.Add(Copy(vPhoneNo, 1, Length(vPhoneNo)-1));
            vReplaceList.Add(Copy(vReplaceData, 1, Length(vReplaceData)-1));
            vPhoneNo     := EmptyStr;
            vReplaceData := EmptyStr;
          end;
        end;
      end;

      if not AgreeCheckBox.Checked and (vNoAgreeCount > 0) then
      begin
        if not AskBox(Format('수신동의를 한지 2년이 경과한 회원이 %d명 발송됩니다'#13'발송하시겠습니까?',[vNoAgreeCount])) then Exit;
      end;

      // 전화번호를 MAX_DATA 글자씩 잘라서 웹서비스로 전송한다
      vResult := EmptyStr;
      // 실제 발송건수
      vSendCount := 0;
      vSeq := '';
      For vIndex := 0 to vPhoneList.Count-1 do
      begin
        loop:
        vIsFinish := vIndex=vPhoneList.Count-1;
        GetServiceSoap.smsSend3(StoreCode,
                                not LmsRadioButton.Checked,
                                vIsFinish,
                                vSeq,
                                IfThen(SMSImmediateRadioButton.Checked, '', FormatDateTime('yyyymmddhhnnss', SMSReserveDateEdit.Date)),
                                Replace(SMSPhoneEdit.Text, '-',''),
                                vPhoneList.Strings[vIndex],
                                SubjectEdit.Text,
                                vSendMessage,
                                Ifthen(visMemberName or visAgreeDate or visPoint, vReplaceList.Strings[vIndex], ''),
                                Ifthen(DupCheckBox.Checked, StrToInt(FormatDateTime('hh', now())),0),
                                false,
                                Ifthen((ShortURL <> EmptyStr) and (Pos(ShortURL, SMSMessageMemo.Text) > 0),  LeafletURL, ''),
                                GetIPAddress,
                                nil,
                                vReturn,
                                vResult);
        if vReturn then
        begin
          vSendCount := vSendCount+ StrToIntDef(LeftStr(vResult,Pos('|',vResult)-1) ,0);
          vSeq       := RightStr(vResult,Pos('|',vResult)+1);
        end
        else
        begin
          if vResult = EmptyStr then goto loop
          else
            raise Exception.Create(vResult);
        end;
      end;

      MsgBox(Ifthen(SmsRadioButton.Checked,'단문 ','장문 ')+ IntToStr(vSendCount)+'건을 정상 발송하였습니다.');

      if AgreeCheckBox.Checked and (vSendCount > 0) then
      begin
        try
          for vIndex := 0 to vMemberList.Count-1 do
            vMemberCode := vMemberCode + vMemberList.Strings[vIndex];
          vMemberCode := ' and CD_MEMBER in ('+LeftStr(vMemberCode, Length(vMemberCode)-1)+')';
          ExecQuery('update MS_MEMBER '
                   +'   set YMD_AGREE = Date_Format(Now(), ''%Y%m%d''), '
                   +'       YN_NEWS   = ''Y'' '
                   +' where CD_HEAD  =:P0 '
                   +'   and CD_STORE =:P1; '
                   +vMemberCode,
                   [HeadStoreCode,
                    Ifthen(GetHeadConfig(5)='0',StoreCode,StandardStore)],true);
        except
          on E: Exception do
          begin
            ErrBox('수신동의를 적용 실패'#13#13+E.Message);
          end;
        end;
      end;

      Result := true;
    except
      on E: Exception do
        ErrBox('발송하지 못했습니다.'#13'발송내역을 확인 후 재발송바랍니다'#13#13+E.Message);
    end;
    GetCustomerSmsInfo;
  finally
    isChanged := true;
  end;
end;
end.
