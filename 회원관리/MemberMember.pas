// 회원 관리 (완료)

unit MemberMember;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, JPEG, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, StrUtils, Math, StdCtrls, ExtCtrls, AdvGlowButton, AdvToolBar,
  AdvSplitter, ExtDlgs, AdvToolBarStylers, AdvOfficePager, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxLabel,
  cxCurrencyEdit, cxLookAndFeelPainters, cxGroupBox, cxImage, cxCheckBox,
  cxMemo, cxButtonEdit, cxMaskEdit, cxGridCustomTableView, cxGridTableView,
  cxContainer, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxTextEdit, cxDropDownEdit, cxCalendar, cxLookAndFeels, Menus, DBAccess,
  AdvGroupBox, AdvOfficeButtons, AdvPanel, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator,
  EncdDecd, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, PNGImage, AdvSmoothToggleButton, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers,
  dxBarBuiltInMenu, cxPC, AdvGlassButton, nrclasses, nrcomm, uNFC_ACR122;

type
  TMemberMemberForm = class(TInheritGridEditForm)
    GridTableViewMemberNo: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    ConditionToolBarStatusLabel: TcxLabel;
    GridTableViewDsStatus: TcxGridColumn;
    PictureLoadDialog: TOpenPictureDialog;
    SaleGrid: TcxGrid;
    SaleGridTableView: TcxGridTableView;
    SaleGridTableViewSaleDate: TcxGridColumn;
    SaleGridTableViewSaleAmt: TcxGridColumn;
    SaleGridTableViewDCAmt: TcxGridColumn;
    SaleGridTableViewSavePoint: TcxGridColumn;
    SaleGridTableViewUsePoint: TcxGridColumn;
    SaleGridTableViewDsAcct: TcxGridColumn;
    SaleGridLevel: TcxGridLevel;
    SaleGridTableViewTime: TcxGridColumn;
    SaleGridTableViewGubun: TcxGridColumn;
    DetailSearchPanel: TAdvPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ConditionMemberClassComboBox: TcxComboBox;
    ConditionLastVisitDateEdit: TcxDateEdit;
    ConditionFromPointEdit: TcxCurrencyEdit;
    ConditionToPointEdit: TcxCurrencyEdit;
    ConditionTrustCheckBox: TcxCheckBox;
    ConditonStatusRadioGroup: TAdvOfficeRadioGroup;
    ConditionSmsRadioGroup: TAdvOfficeRadioGroup;
    ConditionPointCheckBox: TcxCheckBox;
    Label8: TLabel;
    ConditionLastVisit1DateEdit: TcxDateEdit;
    Label9: TLabel;
    AdvSplitter1: TAdvSplitter;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewTelNo: TcxGridColumn;
    SaleGridTableViewReceiptNo: TcxGridColumn;
    AgreeMemberCheckBox: TcxCheckBox;
    SaleGridTableViewSaveStamp: TcxGridColumn;
    SaleGridTableViewUseStamp: TcxGridColumn;
    MainPager: TcxPageControl;
    MemberPage: TcxTabSheet;
    DetailPage: TcxTabSheet;
    HistoryPage: TcxTabSheet;
    MemberNoLabel: TLabel;
    MemberNameLabel: TLabel;
    TelNoLabel: TLabel;
    CompanyTelNoLabel: TLabel;
    AddrLabel: TLabel;
    EMailLabel: TLabel;
    RemarkLabel: TLabel;
    StatusLabel: TLabel;
    MemberTypeLabel: TLabel;
    CardNoLabel: TLabel;
    MobileNoLabel: TLabel;
    CreditLabel: TLabel;
    JoinDateLabel: TLabel;
    CashReceiptNoLabel: TLabel;
    MemberNoEdit: TcxTextEdit;
    MemberNameEdit: TcxTextEdit;
    TelNoEdit: TcxTextEdit;
    Etc1TelNoEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    EMailEdit: TcxTextEdit;
    RemarkMemo: TcxMemo;
    StatusComboBox: TcxComboBox;
    MemberTypeComboBox: TcxComboBox;
    CardNoEdit: TcxTextEdit;
    MobileNoEdit: TcxTextEdit;
    CreditComboBox: TcxComboBox;
    JoinDateEdit: TcxDateEdit;
    MemberGroupBox: TcxGroupBox;
    LastVisitDateLabel: TLabel;
    VisitCountLabel: TLabel;
    SaleAmountLabel: TLabel;
    RemainPointLabel: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    LastVisitDateEdit: TcxTextEdit;
    VisitCountEdit: TcxCurrencyEdit;
    SaleAmountEdit: TcxCurrencyEdit;
    RemainPointEdit: TcxCurrencyEdit;
    TrustAmtEdit: TcxCurrencyEdit;
    StampCountEdit: TcxCurrencyEdit;
    CashReceiptNoEdit: TcxTextEdit;
    Etc2TelNoEdit: TcxTextEdit;
    MemberNoCreateButton: TAdvGlowButton;
    PointAddButton: TAdvGlowButton;
    PointUseButton: TAdvGlowButton;
    IDNoLabel: TLabel;
    BirthdayLabel: TLabel;
    MarriageDateLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DeliveryLocalLabel: TLabel;
    DeliveryCourseLabel: TLabel;
    GenderLabel: TLabel;
    IDNoEdit: TcxMaskEdit;
    AgeGroupComboBox: TcxComboBox;
    DamdangComboBox: TcxComboBox;
    DeliveryLocalComboBox: TcxComboBox;
    DeliveryCourseComboBox: TcxComboBox;
    GenderComboBox: TcxComboBox;
    BirthdayLunarCheckBox: TcxCheckBox;
    SmsGroupBox: TcxGroupBox;
    Label13: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    AgreeDateEdit: TcxDateEdit;
    RejectDateEdit: TcxDateEdit;
    SMSAgreeCheckBox: TcxCheckBox;
    BirthdayEdit: TcxMaskEdit;
    MarriageEdit: TcxMaskEdit;
    HistoryGrid: TcxGrid;
    HistoryTableView: TcxGridTableView;
    HistoryTableViewHistoryDate: TcxGridColumn;
    HistoryTableViewGubun: TcxGridColumn;
    HistoryTableViewMemberName: TcxGridColumn;
    HistoryTableViewMemberType: TcxGridColumn;
    HistoryTableViewCardNo: TcxGridColumn;
    HistoryTableViewMobileNo: TcxGridColumn;
    HistoryTableViewHomeNo: TcxGridColumn;
    HistoryTableViewEtcNo1: TcxGridColumn;
    HistoryTableViewEtcNo2: TcxGridColumn;
    HistoryTableViewAddress: TcxGridColumn;
    HistoryTableViewRcpNo: TcxGridColumn;
    HistoryTableViewEmail: TcxGridColumn;
    HistoryTableViewStatus: TcxGridColumn;
    HistoryTableViewRemark: TcxGridColumn;
    HistoryTableViewGender: TcxGridColumn;
    HistoryTableViewBirthday: TcxGridColumn;
    HistoryTableViewMarryDay: TcxGridColumn;
    HistoryTableViewAge: TcxGridColumn;
    HistoryTableViewDamdang: TcxGridColumn;
    HistoryTableViewLocal: TcxGridColumn;
    HistoryTableViewCourse: TcxGridColumn;
    HistoryTableViewNews: TcxGridColumn;
    HistoryTableViewAgreeDate: TcxGridColumn;
    HistoryTableViewRejectDate: TcxGridColumn;
    HistoryTableViewPrgInsert: TcxGridColumn;
    HistoryTableViewPrgChange: TcxGridColumn;
    HistoryGridLevel: TcxGridLevel;
    ComPortOpenButton: TAdvGlassButton;
    ComPortComboBox: TcxComboBox;
    nrComPort: TnrComm;

    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure MemberNoCreateButtonClick(Sender: TObject);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure PictureDeleteButtonClick(Sender: TObject);
    procedure MainPager1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure PointAddButtonClick(Sender: TObject);
    procedure SaleGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ConditionPointCheckBoxPropertiesEditValueChanged(Sender: TObject);
    procedure HistoryPage1Show(Sender: TObject);
    procedure HistoryPageShow(Sender: TObject);
    procedure ComPortOpenButtonClick(Sender: TObject);
    procedure nrComPortAfterReceive(Com: TObject; Buffer: Pointer;
      Received: Cardinal);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PrefixCode :String;
    procedure mnuPointManageClick(Sender: TObject);
    procedure mnuPointSearchClick(Sender: TObject);
    procedure mnuSaleSearchClick(Sender: TObject);
    procedure SelectSaleData;
    procedure SetHistory;
    procedure OnCardUID(const UID: string);
protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    procedure SetMultiMode(aMultiMode: Boolean); override;
  end;

var
  MemberMemberForm: TMemberMemberForm;



implementation

uses
  Common, DBModule, Main, UnitZipPopup;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TMemberMemberForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  StopMonitor;
end;

procedure TMemberMemberForm.FormCreate(Sender: TObject);
var
  vPopMenuItem: TMenuItem;
begin
  inherited;
  MainPager.ActivePageIndex := 0;
  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);
  vPopMenuItem.Caption   := '-';
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);
  vPopMenuItem.Caption   := '포인트 임의적립/사용';
  vPopMenuItem.OnClick   := mnuPointManageClick;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);
  vPopMenuItem.Caption   := '포인트 상세조회';
  vPopMenuItem.OnClick   := mnuPointSearchClick;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);
  vPopMenuItem.Caption   := '구매내역 조회';
  vPopMenuItem.OnClick   := mnuSaleSearchClick;
//  vPopMenuItem.Checked   := True;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  GridTableView.OptionsSelection.MultiSelect := GetOption(257) = '0';
  SetComPortList(ComPortComboBox,'사용안함');
  StartMonitor(Self.OnCardUID);
end;

procedure TMemberMemberForm.FormShow(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;

  isLoading := true;
  try
    // 상태 콤보박스 세팅
    ConditionToolBarComboBox.Properties.Items.Clear;
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := EmptyStr;
    ConditionToolBarComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
    New(vCode);
    vCode^.Data := '0';
    ConditionToolBarComboBox.Properties.Items.AddObject('정상 회원', TObject(vCode));
    StatusComboBox.Properties.Items.AddObject('정상 회원', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    ConditionToolBarComboBox.Properties.Items.AddObject('탈퇴 회원', TObject(vCode));
    StatusComboBox.Properties.Items.AddObject('탈퇴 회원', TObject(vCode));
    ConditionToolBarComboBox.ItemIndex := 0;

    //성별 콤보박스 세팅
    GenderComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    GenderComboBox.Properties.Items.AddObject('남자', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    GenderComboBox.Properties.Items.AddObject('여자', TObject(vCode));

    //외상여부 콤보박스
    CreditComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := 'N';
    CreditComboBox.Properties.Items.AddObject('불가능', TObject(vCode));
    New(vCode);
    vCode^.Data := 'Y';
    CreditComboBox.Properties.Items.AddObject('가능', TObject(vCode));

    // 회원구분 콤보박스 세팅
    MemberTypeComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := EmptyStr;
    ConditionMemberClassComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
    New(vCode);
    vCode^.Data := 'not';
    ConditionMemberClassComboBox.Properties.Items.AddObject('[미지정]', TObject(vCode));
    try
      OpenQuery('select   CD_CODE, '
               +'         NM_CODE1 '
               +'  from   MS_CODE '
               +' where   CD_HEAD  =:P0 '
               +'   and   CD_STORE =:P1 '
               +'   and   CD_KIND = ''05'' '
               +' order by CD_CODE',
                [HeadStoreCode,
                 Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
      while not Query.Eof do
      begin
        New(vCode);
        vCode^.Data := Query.Fields[0].AsString;
        MemberTypeComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        ConditionMemberClassComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        Query.Next;
      end;
      MemberTypeComboBox.ItemIndex := 0;
      ConditionMemberClassComboBox.ItemIndex := 0;
    finally
      FinishQuery;
    end;

    DeliveryLocalComboBox.Properties.Items.Clear;
    DeliveryCourseComboBox.Properties.Items.Clear;
    if GetOption(185) = '1' then
    begin
      // 배달지역 콤보박스 세팅
      try
        OpenQuery('select  CD_CODE, '
                 +'        NM_CODE1 '
                 +'  from  MS_CODE '
                 +' where  CD_HEAD  = :P0 '
                 +'   and  CD_STORE = :P1 '
                 +'   and  CD_KIND = ''22'' '
                 +' order by CD_CODE',
                  [HeadStoreCode,
                   StoreCode]);
        while not Query.Eof do
        begin
          New(vCode);
          vCode^.Data := Query.Fields[0].AsString;
          DeliveryLocalComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
          Query.Next;
        end;
      finally
        FinishQuery;
      end;

      // 배달코스 콤보박스 세팅
      try
        OpenQuery('select CD_CODE, '
                 +'       NM_CODE1 '
                 +'  from MS_CODE '
                 +' where CD_HEAD  = :P0 '
                 +'   and CD_STORE = :P1 '
                 +'   and CD_KIND = ''20'' '
                 +' order by CD_CODE',
                  [HeadStoreCode,
                   StoreCode]);
        while not Query.Eof do
        begin
          New(vCode);
          vCode^.Data := Query.Fields[0].AsString;
          DeliveryCourseComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
          Query.Next;
        end;
      finally
        FinishQuery;
      end;
    end
    else
    begin
      DeliveryLocalLabel.Visible     := false;
      DeliveryCourseLabel.Visible    := false;
      DeliveryLocalComboBox.Visible  := false;
      DeliveryCourseComboBox.Visible := false;
    end;

    // 연령대 콤보박스 세팅
    AgeGroupComboBox.Properties.Items.Clear;
    try
      OpenQuery('select CD_CODE, '
               +'       NM_CODE1 '
               +'  from MS_CODE '
               +' where CD_HEAD  = :P0 '
               +'   and CD_STORE = :P1 '
               +'   and CD_KIND = ''14'' '
               +' order by CD_CODE',
                [HeadStoreCode,
                 StoreCode]);
      while not Query.Eof do
      begin
        New(vCode);
        vCode^.Data := Query.Fields[0].AsString;
        AgeGroupComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        Query.Next;
      end;
    finally
      FinishQuery;
    end;

    //담당자
    DamdangComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := EmptyStr;
    DamdangComboBox.Properties.Items.AddObject('없음', TObject(vCode));
    try
      OpenQuery('select CD_SAWON, '
               +'       NM_SAWON '
               +'  from MS_SAWON '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_SAWON <> ''master'' ',
               [HeadStoreCode,
                StoreCode]);

      while not Query.Eof do
      begin
        //담당자
        New(vCode);
        vCode^.Data := Query.Fields[0].AsString;
        DamdangComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        Query.Next;
      end;
    finally
      FinishQuery;
    end;

    PrefixCode := '000';
    if GetStoreOption(5)='1' then
    begin
      OpenQuery('select MEMBERNO_PREFIX '
              +'  from MS_STORE '
              +' where CD_HEAD  = :P0 '
              +'   and CD_STORE = :P1 ',
            [HeadStoreCode,
             StoreCode]);

      if not Query.Eof then
        PrefixCode := Query.Fields[0].AsString;
    end;
  finally
    FinishQuery;
    isLoading := false;
    isChanged := false;
  end;
end;

procedure TMemberMemberForm.GridTableViewCustomDrawCell(
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

procedure TMemberMemberForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[2] = '1' then
    AStyle := StyleFontRed;
end;

procedure TMemberMemberForm.HistoryPage1Show(Sender: TObject);
begin
  inherited;
  SetHistory;
end;

procedure TMemberMemberForm.HistoryPageShow(Sender: TObject);
begin
  inherited;
  SetHistory;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 이름에서 키보드를 누를 때
procedure TMemberMemberForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  isMultiMode := False;
end;


procedure TMemberMemberForm.ComPortOpenButtonClick(Sender: TObject);
begin
  inherited;
  if (GetStrPointerData(ComPortComboBox) = '') or (GetStrPointerData(ComPortComboBox) = '0')  then
  begin
    MsgBox('포트를 지정하세요');
    Exit;
  end;

  try
    if nrComPort.Active then
    begin
      nrComPort.Active := false;
      ComPortOpenButton.Enabled := true;
      Exit;
    end;

    nrComPort.ComPortNo := StrToInt(GetStrPointerData(ComPortComboBox));
    nrComPort.BaudRate := 9600;
    nrComPort.Active := true;
    ComPortOpenButton.Enabled := false;
  except
    ErrBox(Format('포트[%s] 실패',[ComPortComboBox.Text]));
  end;
end;

procedure TMemberMemberForm.ConditionPointCheckBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ConditionFromPointEdit.Enabled := ConditionPointCheckBox.Checked;
  ConditionToPointEdit.Enabled   := ConditionPointCheckBox.Checked;
end;

procedure TMemberMemberForm.MainPager1Change(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TMemberMemberForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if  (Sender is TcxCustomEdit) then
    TcxCustomEdit(Sender).EditModified := true;

  if (Sender = ZipCodeEdit) and (Addr1Edit.Text <> EmptyStr) then
    Addr1Edit.Clear
  else if Sender = SMSAgreeCheckBox then
  begin
    if SMSAgreeCheckBox.Checked then
    begin
      AgreeDateEdit.Date  := Now;
      RejectDateEdit.Text := EmptyStr;
    end
    else
    begin
      AgreeDateEdit.Text  := EmptyStr;
      RejectDateEdit.Date  := Now;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TMemberMemberForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  // 회원번호를 짧게 입력하면 앞을 0으로 채운다
  if (Sender = MemberNoEdit) and
     (not MemberNoEdit.Properties.ReadOnly) and (Length(DisplayValue) < MemberNoEdit.Properties.MaxLength) then
    DisplayValue := LPad(DisplayValue, MemberNoEdit.Properties.MaxLength, '0')
  // 전화번호를 체계에 맞게 고친다
  else if (Sender = MobileNoEdit) or (Sender = TelNoEdit) or (Sender = Etc1TelNoEdit) or (Sender = Etc2TelNoEdit) then
    DisplayValue := GetPhoneNo(DisplayValue);
end;
//------------------------------------------------------------------------------
// 회원번호 생성 버튼
procedure TMemberMemberForm.MemberNoCreateButtonClick(Sender: TObject);
var vCode :String;
begin
  inherited;
  OpenQuery('select Max(CD_MEMBER) as CODE '
           +'  from MS_MEMBER '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1'
           +'   and IsNumeric(CD_MEMBER) = 1 '
           +'   and Length(CD_MEMBER)    = 10 '
           +'   and Left(CD_MEMBER,3)    =:P2 ',
           [HeadStoreCode,
            Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
            PrefixCode]);
  try
    if not Query.Eof and (Query.Fields[0].AsString = '9999999999') then
    begin
      MsgBox('회원번호를 자동으로 증가할 수 없습니다');
      Exit;
    end;
    if Query.Eof or (Query.Fields[0].AsString = '') then
      vCode := PrefixCode +'0000000'
    else
      vCode := Query.Fields[0].AsString;

    MemberNoEdit.Text := LPad(IntToStr(StoI64(vCode)+1), MemberNoEdit.Properties.MaxLength, '0');
    if MainPanel.Enabled and MemberNoEdit.Enabled then
      MemberNoEdit.SetFocus;
  finally
    FinishQuery;
  end;

end;
procedure TMemberMemberForm.mnuPointManageClick(Sender: TObject);
begin
  //회원포인트관리 실행
  FormParam[0] := MemberNoEdit.Text;
  ExtremeMainForm.RunProgram('MemberPoint');
end;

procedure TMemberMemberForm.mnuPointSearchClick(Sender: TObject);
begin
  //회원포인트조회 실행
  FormParam[0] := MemberNoEdit.Text;
  ExtremeMainForm.RunProgram('MemberPointShow');
end;

procedure TMemberMemberForm.mnuSaleSearchClick(Sender: TObject);
begin
  //회원매출조회 실행
  FormParam[0] := MemberNoEdit.Text;
  ExtremeMainForm.RunProgram('MemberSaleShow');
end;

procedure TMemberMemberForm.nrComPortAfterReceive(Com: TObject; Buffer: Pointer;
  Received: Cardinal);
  function CheckRFID(aReadData:String):Boolean;
  begin
    try
      OpenQuery('select CD_MEMBER '
               +'  from MS_MEMBER '
               +' where CD_HEAD  = :P0 '
               +'   and CD_STORE = :P1 '
               +'   and CD_MEMBER <> :P2 '
               +'   and NO_CARD  = :P3 ',
               [HeadStoreCode,
                StoreCode,
                MemberNoEdit.Text,
                aReadData]);

      if not Query.Eof then
      begin
        MsgBox(Format('이미 %s  회원에 등록 된 번호입니다', [Query.FieldByName('CD_MEMBER').AsString]));
        Result := False;
      end
      else
        Result := true;
    finally
      FinishQuery;
    end;
  end;
var vIndex:integer;
    vReadData : AnsiString;
    vStr :String;
begin
  inherited;
  for vIndex := 0 to Received - 1 do
    vReadData := vReadData + PAnsiChar(Buffer)[vIndex];

  if (Pos(#13, vReadData) > 0) or (Pos(#3, vReadData) > 0) then
  begin
    vStr := vReadData;
    vReadData := '';
    For vIndex:=1 to Length(vStr) do
    begin
       Case vStr[vIndex] of
         #48..#57, #65..#90, #61: vReadData := vReadData + vStr[vIndex];
       end;
    end;

    if not CheckRFID(vReadData) then Exit;
    CardNoEdit.Text := vReadData;
  end;
end;

procedure TMemberMemberForm.OnCardUID(const UID: string);
begin
  CardNoEdit.Text := UID;
end;

//------------------------------------------------------------------------------
// 주소(우편번호) 입력창 버튼을 누를 때
procedure TMemberMemberForm.ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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
//------------------------------------------------------------------------------
// 사진 불러오기 버튼
procedure TMemberMemberForm.PointAddButtonClick(Sender: TObject);
begin
  inherited;
  FormParam[0] := MemberNoEdit.Text;
  if Sender = PointAddButton then
    FormParam[1] := 'A'
  else
    FormParam[1] := 'U';
  ExtremeMainForm.RunProgram('MemberPoint');
end;

//------------------------------------------------------------------------------
// (사진) 삭제 버튼
procedure TMemberMemberForm.PictureDeleteButtonClick(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 거래 내역 조회
procedure TMemberMemberForm.SaleGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FormParam[0] := LeftStr(GetOnlyNumber(SaleGridTableView.DataController.Values[SaleGridTableView.DataController.GetFocusedRecordIndex, SaleGridTableViewReceiptNo.Index]),8);
  FormParam[1] := Copy(GetOnlyNumber(SaleGridTableView.DataController.Values[SaleGridTableView.DataController.GetFocusedRecordIndex, SaleGridTableViewReceiptNo.Index]),9,2);
  FormParam[2] := RightStr(GetOnlyNumber(SaleGridTableView.DataController.Values[SaleGridTableView.DataController.GetFocusedRecordIndex, SaleGridTableViewReceiptNo.Index]),4);
  ExtremeMainForm.RunProgram('SaleReceiptShow');
end;

procedure TMemberMemberForm.SelectSaleData;
begin
  if Length(MemberNoEdit.Text) = MemberNoEdit.Properties.MaxLength then
  begin
    OpenQuery('select StoDW(YMD_SALE) as YMD_SALE, '
             +'       case DS_SALE when ''S'' then case when IfNull(NO_DELIVERY,'''') = '''' then ''판매'' else ''배달'' end when ''B'' then ''반품'' end as DS_SALE, '
             +'       case when AMT_SALE = AMT_CASHRCP   and AMT_CASHRCP <> 0  then ''현금영수증'' '
             +'            when AMT_SALE = AMT_CASH      and AMT_CASH    <> 0  then ''현금'' '
             +'            when AMT_SALE = AMT_CARD      and AMT_CARD    <> 0  then ''신용카드'' '
             +'            when AMT_SALE = AMT_LETSORDER and AMT_LETSORDER    <> 0  then ''렛츠오더'' '
             +'            when AMT_SALE = AMT_TRUST     and AMT_TRUST   <> 0  then ''외상'' '
             +'            when AMT_SALE = AMT_GIFT      and AMT_GIFT    <> 0  then ''상품권'' '
             +'            when AMT_SALE = AMT_BANK      and AMT_BANK    <> 0  then ''계좌이체'' '
             +'            when AMT_SALE = AMT_POINT     and AMT_POINT   <> 0  then ''포인트'' '
             +'            when AMT_SALE = 0             and DC_TOT      <> 0  then ''할인'' '
             +'            else ''복합'' end as DS_ACCT, '
             +'       DC_TOT, '
             +'       AMT_SALE, '
             +'       PNT_OCCUR, '
             +'       DC_POINT+AMT_POINT as AMT_POINT, '
             +'       DT_SALE, '
             +'       SAVE_STAMP, '
             +'       USE_STAMP, '
             +'       ConCat(YMD_SALE,''-'',NO_POS,''-'',NO_RCP) as NO_RECEIPT '
             +'  from SL_SALE_H '
             +' where CD_HEAD   = :P0 '
             +'   and CD_STORE  = :P1 '
             +'   and CD_MEMBER = :P2 '
             +'   and DS_SALE  <> ''V'' '
             +' order by CD_STORE, YMD_SALE desc, NO_POS, NO_RCP',
              [HeadStoreCode,
               StoreCode,
               MemberNoEdit.Text]);
    DM.ReadQuery(Query, SaleGridTableView);
  end;
end;
procedure TMemberMemberForm.SetHistory;
begin
  if MainPager.ActivePage <> HistoryPage then Exit;

  if MemberNoEdit.Text = '' then
  begin
    HistoryTableView.DataController.RecordCount := 0;
    Exit;
  end;

  OpenQuery('select DT_HIST, '
           +'       case GUBUN when ''I'' then ''신규'' when ''U'' then ''수정'' when ''D'' then ''삭제'' else GUBUN end as GUBUN, '
           +'       NM_MEMBER, '
           +'       DS_SEX, '
           +'       DS_MEMBER, '
           +'       NO_CARD, '
           +'       NO_JUMIN, '
           +'       YMD_BIRTH, '
           +'       YN_LUNAR, '
           +'       YMD_MARRI, '
           +'       GetPhoneNo(AES_Decrypt(TEL_MOBILE, 71483)) as TEL_MOBILE, '
           +'       YN_NEWS, '
           +'       GetPhoneNo(AES_Decrypt(TEL_HOME, 71483)) as TEL_HOME, '
           +'       GetPhoneNo(TEL_ETC1) as TEL_ETC1, '
           +'       GetPhoneNo(TEL_ETC2) as TEL_ETC2, '
           +'       NO_POST, '
           +'       ConCat(Ifnull(ADDR1,''''),Ifnull(ADDR2,'''')) as ADDRESS, '
           +'       NM_EMAIL, '
           +'       REMARK, '
           +'       DS_STATUS, '
           +'       NO_CASHRCP, '
           +'       CD_DAMDANG, '
           +'       CD_AGE, '
           +'       CD_LOCAL, '
           +'       CD_COURSE, '
           +'       StoD(YMD_AGREE) as YMD_AGREE, '
           +'       StoD(YMD_REJECT) as YMD_REJECT, '
           +'       PRG_INSERT, '
           +'       PRG_CHANGE '
           +'from   MS_MEMBER_HIST  '
           +'where  CD_HEAD   = :P0 '
           +'  and  CD_STORE  = :P1 '
           +'  and  CD_MEMBER = :P2 '
           +'order by DT_HIST desc',
            [HeadStoreCode,
             Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
             MemberNoEdit.Text]);
    DM.ReadQuery(Query, HistoryTableView);
end;

procedure TMemberMemberForm.SetMultiMode(aMultiMode: Boolean);
var vIndex :Integer;
begin
  inherited;
  //여러상품을 선택했을때는 수정할 수 있는 항목만 Enabled 시킨다
  if aMultiMode then
  begin
    for vIndex := 0 to ComponentCount-1 do
      if ( (TControl(Components[vIndex]).Parent = MemberPage)
          or (TControl(Components[vIndex]).Parent = DetailPage)
          or (TControl(Components[vIndex]).Parent = SmsGroupBox)) then
      begin
        if (Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') then
        begin
          TcxCustomEdit(Components[vIndex]).EditModified := False;
          TcxCustomEdit(Components[vIndex]).Enabled      := true;
        end
        else if (Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint = '') then
          TcxCustomEdit(Components[vIndex]).Enabled      := false;
      end;


    isChanged := False;
    SmsGroupBox.Enabled               := true;
    ButtonToolBarSearchButton.Enabled := False;
    ButtonToolBarNewButton.Enabled    := False;
    ButtonToolBarDeleteButton.Enabled := False;
    ButtonToolBarCancelButton.Enabled := True;
    MemberNoCreateButton.Enabled      := False;
  end
  else
  begin
    GridTableView.Controller.ClearSelection;
    for vIndex := 0 to ComponentCount-1 do
      if (TControl(Components[vIndex]).Parent = MemberPage)
          or (TControl(Components[vIndex]).Parent = DetailPage)
          or (TControl(Components[vIndex]).Parent = SmsGroupBox) then
      begin
        if (Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint = '') then
        begin
          TcxCustomEdit(Components[vIndex]).EditModified := False;
          TcxCustomEdit(Components[vIndex]).Enabled      := True;
        end;
      end;

    if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
      DoGridLink;
    isChanged := False;
  end;
end;

//------------------------------------------------------------------------------
// 조회
function TMemberMemberForm.DoSearch: Boolean;
var
  vWhere: Array [1..8] of String;
  vCode: PStrPointer;
  vIndex :Integer;
  vTemp :String;
  vEncryptStr :String;
begin
  Result := false;
  DetailSearchPanel.Collaps := true;
  for vIndex := 1 to 6 do
    vWhere[vIndex] := EmptyStr;

  case ConditonStatusRadioGroup.ItemIndex of
    1 : vWhere[1] := ' and a.DS_STATUS = ''0'' ';
    2 : vWhere[1] := ' and a.DS_STATUS = ''1'' ';
  end;

  if ConditionMemberClassComboBox.ItemIndex > 0 then
  begin
    vTemp := GetStrPointerData(ConditionMemberClassComboBox);
    if vTemp = 'not' then
      vWhere[2]  := ' and Ifnull(a.DS_MEMBER,'''') = '''' '
    else
      vWhere[2]  := Format(' and a.DS_MEMBER = ''%s'' ', [vTemp]);
  end;

  if ConditionPointCheckBox.Checked then
  begin
    if (Integer(ConditionFromPointEdit.EditingValue) <> 0) and (Integer(ConditionToPointEdit.EditingValue) <> 0) then
      vWhere[3] := Format(' and b.TOTAL_POINT Between %d and %d ',[Integer(ConditionFromPointEdit.EditingValue), Integer(ConditionToPointEdit.EditingValue)])
    else if Integer(ConditionFromPointEdit.EditingValue) <> 0 then
      vWhere[3] := Format(' and b.TOTAL_POINT >= %d ', [Integer(ConditionFromPointEdit.EditingValue)])
    else if Integer(ConditionToPointEdit.EditingValue) <> 0 then
      vWhere[3] := Format(' and b.TOTAL_POINT <= %d ', [Integer(ConditionToPointEdit.EditingValue)]);
  end;

  if (ConditionLastVisitDateEdit.CurrentDate > 0) then
    vWhere[4]  := Format(' and b.YMD_VISIT <= ''%s'' ', [DtoS(ConditionLastVisitDateEdit.CurrentDate)]);

  if ConditionTrustCheckBox.Checked then
    vWhere[5] := ' and b.YN_TRUST = ''Y'' ';

  case ConditionSmsRadioGroup.ItemIndex of
    1 : vWhere[6] := 'and a.YN_NEWS = ''Y'' ';
    2 : vWhere[6] := 'and a.YN_NEWS = ''N'' ';
  end;

  if ConditionLastVisit1DateEdit.CurrentDate > 0 then
    vWhere[7]  := Format(' and b.YMD_VISIT >= ''%s'' ', [DtoS(ConditionLastVisit1DateEdit.CurrentDate)]);

  if AgreeMemberCheckBox.Checked then
    vWhere[8]  := ' and DATE(a.YMD_AGREE) >= ADDDATE(NOW(), INTERVAL -2 YEAR) ';

  try
    ClearGrid;
    Result := OpenQueryEx('select a.CD_MEMBER, '
                         +'       a.NM_MEMBER, '
                         +'       a.DS_STATUS, '
                         +'       a.NO_CARD, '
                         +'       GetPhoneNo(AES_Decrypt(a.TEL_MOBILE, 71483)) as NO_TEL '
                         +'  from MS_MEMBER as a inner join '
                         +'       MS_MEMBER_ETC as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = :P3 and b.CD_MEMBER = a.CD_MEMBER '
                         +Ifthen(GetStoreOption(5)='1', 'inner join MS_MEMBER_ETC as c on c.CD_HEAD   = a.CD_HEAD '
                                                      +'                             and c.CD_STORE  = a.CD_STORE '
                                                      +'                             and c.CD_MEMBER = a.CD_MEMBER ','')
                         +' where a.CD_HEAD    =:P0 '
                         +'   and a.CD_STORE   =:P1 '
                         +Ifthen(GetStoreOption(5)='0','',Format(' and a.CD_STORE_JOIN =''%s'' ',[StoreCode]))
                         +'   and (a.CD_MEMBER =:P2 '
                         +'      or a.NM_MEMBER like ConCat(''%'',:P2,''%'') '
                         +'      or a.NO_JUMIN  like ConCat(''%'',:P2,''%'') '
                         +'      or GetOnlyNumber(a.NO_CARD) like ConCat(''%'',:P2,''%'') '
                         +'      or AES_Decrypt(a.TEL_MOBILE,71483) =:P2 '
                         +'      or AES_Decrypt(a.TEL_HOME,71483)  =:P2 '
                         +'      or AES_Decrypt(a.TEL_MOBILE_SHORT,71483) =:P2 '
                         +'      or AES_Decrypt(a.TEL_HOME_SHORT,71483)   =:P2) '
                         +vWhere[1]
                         +vWhere[2]
                         +Ifthen(GetStoreOption(5)='1', Replace(vWhere[3],'b.','c.'), vWhere[3])
                         +Ifthen(GetStoreOption(5)='1', Replace(vWhere[4],'b.','c.'), vWhere[4])
                         +vWhere[5]
                         +vWhere[6]
                         +Ifthen(GetStoreOption(5)='1', Replace(vWhere[7],'b.','c.'), vWhere[7])
                         +vWhere[8]
                         +' order by a.CD_MEMBER',
                         [HeadStoreCode,
                          Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                          ConditionToolBarEdit.Text,
                          StoreCode],GridTableView);
  finally
    FinishQuery;
  end;
//  GridTableView.DataController.BeginUpdate;
//  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
//    if Length(NVL(GridTableView.DataController.Values[vIndex, GridTableViewTelNo.Index],'')) = 13 then
//      GridTableView.DataController.Values[vIndex, GridTableViewTelNo.Index] := LeftStr(GridTableView.DataController.Values[vIndex, GridTableViewTelNo.Index],4)+'****'+RightStr(GridTableView.DataController.Values[vIndex, GridTableViewTelNo.Index],5);
//
//  GridTableView.DataController.EndUpdate;

end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TMemberMemberForm.DoGridLink;
var
  vStream    : TStream;
  vPNG       : TPNGImage;
begin
  inherited;

  OpenQuery('select   a.DS_MEMBER, '                                            //0
           +'         a.NO_CARD, '                                              //1
           +'         a.NO_JUMIN, '                                             //2
           +'         a.DS_SEX, '                                               //3
           +'         a.YMD_BIRTH, '                                            //4
           +'         a.YN_LUNAR, '                                             //5
           +'         a.YMD_MARRI, '                                            //6
           +'         Cast(AES_Decrypt(a.TEL_MOBILE, 71483) as Char) as TEL_MOBILE, '          //7
           +'         a.YN_NEWS, '                                              //8
           +'         Cast(AES_Decrypt(a.TEL_HOME, 71483) as Char) as TEL_HOME, '             //9
           +'         a.TEL_ETC1, '                                             //10
           +'         a.TEL_ETC2, '                                             //11
           +'         a.NO_POST, '                                              //12
           +'         a.ADDR1, '                                                //13
           +'         a.ADDR2, '                                                //14
           +'         a.NM_EMAIL, '                                             //15
           +'         IfNull(b.YN_TRUST,''N'') as YN_TRUST, '                   //16
           +'         a.YMD_ISU, '                                              //17
           +'         a.REMARK, '                                               //18
           +'         a.DS_STATUS, '                                            //19
           +'         StoD(b.YMD_VISIT) as YMD_VISIT, '                         //20
           +'         b.CNT_VISIT, '                                            //21
           +'         b.AMT_SALE, '                                             //22
           +Ifthen(GetStoreOption(5)='1', 'c.TOTAL_POINT, ',' b.TOTAL_POINT, ')  //23
           +'         a.NO_CASHRCP, '                                           //24
           +'         a.CD_DAMDANG, '                                           //25
           +'         a.CD_AGE, '                                               //26
           +'         a.CD_LOCAL, '                                             //27
           +'         a.CD_COURSE, '                                            //28
           +'         a.YMD_AGREE, '                                            //29
           +'         a.YMD_REJECT, '                                           //30
           +Ifthen(GetStoreOption(5)='1', 'c.TOTAL_STAMP, ',' b.TOTAL_STAMP, ')  //31
           +'         b.AMT_TRUST, '                                            //32
           +'         a.CD_STORE_JOIN '                                        //33
           +'  from   MS_MEMBER as a inner join '
           +'         MS_MEMBER_ETC as b on b.CD_HEAD   = a.CD_HEAD '
           +'                           and b.CD_STORE  = :P3 '
           +'                           and b.CD_MEMBER = a.CD_MEMBER '
           +Ifthen(GetStoreOption(5)='1', 'inner join MS_MEMBER_ETC as c on c.CD_HEAD   = a.CD_HEAD '
                                        +'                             and c.CD_STORE  = a.CD_STORE '
                                        +'                             and c.CD_MEMBER = a.CD_MEMBER ','')
           +' where   a.CD_HEAD   = :P0 '
           +'   and   a.CD_STORE  = :P1 '
           +'   and   a.CD_MEMBER = :P2 '
           +Ifthen(GetStoreOption(5)='0','',' and a.CD_STORE_JOIN =:P3 '),
            [HeadStoreCode,
             Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index],
             StoreCode]);
  try
    if not Query.Eof then
    begin
      MemberNoEdit.Text   := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index];
      MemberNameEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index];
      MemberTypeComboBox.ItemIndex    := GetStrPointerIndex(MemberTypeComboBox, Query.Fields[0].AsString);
      CardNoEdit.Text               := Query.Fields[1].AsString;
      IDNoEdit.Text                 := Query.Fields[2].AsString;
      GenderComboBox.ItemIndex      := GetStrPointerIndex(GenderComboBox, Query.Fields[3].AsString);
      BirthdayEdit.Text             := Query.Fields[4].AsString;
      BirthdayLunarCheckBox.Checked := Query.Fields[5].AsString = 'Y';
      MarriageEdit.Text             := Query.Fields[6].AsString;
      MobileNoEdit.Text             := GetPhoneNo(Query.Fields[7].AsString);
      SMSAgreeCheckBox.Checked      := Query.Fields[8].AsString = 'Y';
      TelNoEdit.Text                := GetPhoneNo(Query.Fields[9].AsString);
      Etc1TelNoEdit.Text            := GetPhoneNo(Query.Fields[10].AsString);
      Etc2TelNoEdit.Text            := GetPhoneNo(Query.Fields[11].AsString);
      ZipCodeEdit.Text              := Query.Fields[12].AsString;
      Addr1Edit.Text                := Query.Fields[13].AsString;
      Addr2Edit.Text                := Query.Fields[14].AsString;
      EMailEdit.Text                := Query.Fields[15].AsString;
      CreditComboBox.ItemIndex      := GetStrPointerIndex(CreditComboBox, Query.Fields[16].AsString);
      if Query.Fields[17].AsString = EmptyStr then
        JoinDateEdit.Text           := EmptyStr
      else
        JoinDateEdit.Date           := StoD(Query.Fields[17].AsString);
      RemarkMemo.Text               := Query.Fields[18].AsString;
      StatusComboBox.ItemIndex      := GetStrPointerIndex(StatusComboBox, Query.Fields[19].AsString);
      LastVisitDateEdit.Text          := Ifthen(Length(Query.Fields[20].AsString) < 10, '', Query.Fields[20].AsString);
      VisitCountEdit.Value            := Query.Fields[21].AsCurrency;
      SaleAmountEdit.Value            := Query.Fields[22].AsCurrency;
      //통합회원을 사용하면 잔여포인트를 보여주지 않는다
      RemainPointEdit.Value           := Query.Fields[23].AsCurrency;
      CashReceiptNoEdit.Text          := Query.Fields[24].AsString;
      DamdangComboBox.ItemIndex       := GetStrPointerIndex(DamdangComboBox, Query.Fields[25].AsString);
      AgeGroupComboBox.ItemIndex      := GetStrPointerIndex(AgeGroupComboBox, Query.Fields[26].AsString);
      DeliveryLocalComboBox.ItemIndex := GetStrPointerIndex(DeliveryLocalComboBox, Query.Fields[27].AsString);
      DeliveryCourseComboBox.ItemIndex:= GetStrPointerIndex(DeliveryCourseComboBox, Query.Fields[28].AsString);
      if Query.Fields[29].AsString = EmptyStr then
        AgreeDateEdit.Text           := EmptyStr
      else
        AgreeDateEdit.Date           := StoD(Query.Fields[29].AsString);
      if Query.Fields[30].AsString = EmptyStr then
        RejectDateEdit.Text          := EmptyStr
      else
        RejectDateEdit.Date          := StoD(Query.Fields[30].AsString);
      StampCountEdit.Value           := Query.Fields[31].AsInteger;
      TrustAmtEdit.Value             := Query.Fields[32].AsInteger;

      //통합회원일 때 가입매장일때만 수정할 수 있게 한다
      if (GetStoreOption(5) = '1') then
        MemberPage.Enabled := Query.Fields[33].AsString = StoreCode;
    end;
    PointAddButton.Enabled   := true;
    PointUseButton.Enabled   := true;
    CreditComboBox.EditModified := false;
    MemberNoEdit.Properties.ReadOnly := true;
    MemberNoEdit.TabStop             := false;
    MemberNoEdit.Style.Color         := clrDisabled;
    MemberNoEdit.StyleFocused.Color  := clrDisabled;
  finally
    FinishQuery;
  end;

//  GetTrustAmt;
  SetHistory;
  if SaleGrid.Height > 0 then
    SelectSaleData;
end;
//------------------------------------------------------------------------------
// 신규
function TMemberMemberForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    // 회원정보 탭으로 옮긴다
    MainPager.ActivePageIndex := MemberPage.PageIndex;

    MemberNoCreateButton.Click;
    // 코드 자동 증가
    if CheckOption(2) and (MemberNoEdit.Text <> EmptyStr) then
    begin
      MemberNoCreateButton.Enabled     := false;
      MemberNoEdit.Properties.ReadOnly := true;
      MemberNoEdit.TabStop             := false;
      MemberNoEdit.Style.Color         := clrDisabled;
      MemberNoEdit.StyleFocused.Color  := clrDisabled;
    end
    // 코드 수동 입력
    else
    begin
      MemberNoCreateButton.Enabled     := true;
      MemberNoEdit.Properties.ReadOnly := false;
      MemberNoEdit.TabStop             := true;
      MemberNoEdit.Style.Color         := clWindow;
      MemberNoEdit.StyleFocused.Color  := clrFocused;
    end;

    if MainPanel.Enabled and MemberNameEdit.Enabled then
      MemberNameEdit.SetFocus;

    PointAddButton.Enabled   := false;
    PointUseButton.Enabled   := false;
    JoinDateEdit.Date        := now;
    SMSAgreeCheckBox.Checked := true;
  finally
    isLoading := false;
  end;

  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function TMemberMemberForm.DoDelete: Boolean;
var
  vResult: Boolean;
  vResultStr: String;
begin
  Result := false;

  // 회원 거래내역 조회
  OpenQuery('select exists(select * '
              +'                from  SL_SALE_H '
              +'               where  CD_HEAD   = :P0 '
              +'                 and  CD_STORE  = :P1 '
              +'                 and  CD_MEMBER = :P2) + '
              +'       exists(select * '
              +'                from  SL_POINT '
              +'               where  CD_HEAD   = :P0 '
              +'                 and  CD_STORE  = :P1 '
              +'                 and  CD_MEMBER = :P2) ',
               [HeadStoreCode,
                StoreCode,
                GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]], false);
  if Query.Fields[0].AsInteger > 0 then
  begin
    Query.Close;
    ErrBox(Format('%s(%s) 회원님은 거래 실적이 있어서 삭제할 수 없습니다.', [String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index]), String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index])]));
    Exit;
  end;
  Query.Close;

  // 회원 삭제
  Result := ExecQuery('delete from MS_MEMBER_ETC '
                     +' where  CD_HEAD   = :P0 '
                     +'   and  CD_STORE  = :P1 '
                     +'   and  CD_MEMBER = :P2;'
                     +' delete  from MS_MEMBER '
                     +' where  CD_HEAD   = :P0 '
                     +'   and  CD_STORE  = :P1 '
                     +'   and  CD_MEMBER = :P2;',
                     [HeadStoreCode,
                      Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]]);
end;
//------------------------------------------------------------------------------
// 저장
function TMemberMemberForm.DoSave: Boolean;
var
  vIndex,   vParamIndex :Integer;
  vStream    : TMemoryStream;
  vPNG       : TPNGImage;
  vSQLText,
  vSQLEtcText,
  vCode :String;
  vResult     :Boolean;
  vData       :String;
  vParamsType,
  vResultStr  :String;
  vTemp       :String;
  vMaster,
  vDetail  :Boolean;
begin
  Result := False;
  if isMultiMode then
  begin
    vMaster := false;
    vDetail := false;
    try
      Screen.Cursor := crSQLWait;
      vParamIndex := 2;

      for vIndex := 0 to ComponentCount-1 do
      begin
        if ( (TControl(Components[vIndex]).Parent = MemberPage)
          or (TControl(Components[vIndex]).Parent = DetailPage)
          or (TControl(Components[vIndex]).Parent = SmsGroupBox) )
          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified)))  then
        begin
          if ((Components[vIndex] is TcxComboBox ) and (TcxComboBox(Components[vIndex]).Hint = 'YN_TRUST')) then
          begin
            vMaster := true;
            if (Components[vIndex] is TcxCustomEdit) then
              vSQLEtcText    := vSQLEtcText    + TcxCustomEdit(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)]);
            Continue;
          end
          else
          begin
            vDetail := true;
            if (Components[vIndex] is TcxCustomEdit) then
              vSQLText    := vSQLText    + TcxCustomEdit(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)]);
            Inc(vParamIndex);
          end;
        end;
      end;

      vSQLEtcText := 'update MS_MEMBER_ETC set '
                 + vSQLEtcText+' DT_CHANGE = Now() '
                 +' where CD_HEAD =:P0 and CD_STORE =:P1 ';

      vSQLText := 'update MS_MEMBER set '
                 + vSQLText +' PRG_CHANGE = ''MST'', CD_SAWON_CHG = '''+UserCode+''', DT_CHANGE = Now() '
                 +' where CD_HEAD =:P0 and CD_STORE =:P1';


      vCode := EmptyStr;
      for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        vCode := vCode + Format('''%s'',',[String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewMemberNo.Index])]);

      vCode    := 'and CD_MEMBER in ('+LeftStr(vCode, Length(vCode)-1)+');';

      vSQLText := vSQLText + vCode;
      vSQLEtcText := vSQLEtcText + vCode;

      //Param에 값을 대입한다
      vParamIndex := 2;                                   //

      for vIndex := 0 to ComponentCount-1 do
      begin
        if ( (TControl(Components[vIndex]).Parent = MemberPage)
          or (TControl(Components[vIndex]).Parent = DetailPage)
          or (TControl(Components[vIndex]).Parent = SmsGroupBox))
          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified)))  then
        begin
          if ((Components[vIndex] is TcxComboBox ) and (TcxComboBox(Components[vIndex]).Hint = 'YN_TRUST')) then
          begin
            if (Components[vIndex] is TcxComboBox) then
              vSQLEtcText := Replace(vSQLEtcText, Format(':P%d',[vParamIndex]), Format('''%s''',[GetStrPointerData(TcxComboBox(Components[vIndex]))]));
            Continue;
          end
          else
          begin
            if (Components[vIndex] is TcxCurrencyEdit) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), FormatFloat('#0.00',TcxCurrencyEdit(Components[vIndex]).Value))
            else if (Components[vIndex] is TcxButtonEdit) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxButtonEdit(Components[vIndex]).Text]))
            else if (Components[vIndex] is TcxMemo) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxMemo(Components[vIndex]).Text]))
            else if (Components[vIndex] is TcxCheckBox) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[Ifthen(TcxCheckBox(Components[vIndex]).Checked,'Y','N')]))
            else if (Components[vIndex] is TcxTextEdit) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxTextEdit(Components[vIndex]).Text]))
            else if (Components[vIndex] is TcxComboBox) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[GetStrPointerData(TcxComboBox(Components[vIndex]))]))
            else if (Components[vIndex] is TcxDateEdit) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[DtoS(TcxDateEdit(Components[vIndex]).CurrentDate)]));
            Inc(vParamIndex);
          end;
        end;
      end;
      vSQLText := Replace(vSQLText, ':P0', Format('''%s''',[HeadStoreCode]));
      vSQLText := Replace(vSQLText, ':P1', Format('''%s''',[StoreCode]));

      vSQLEtcText := Replace(vSQLEtcText, ':P0', Format('''%s''',[HeadStoreCode]));
      vSQLEtcText := Replace(vSQLEtcText, ':P1', Format('''%s''',[StoreCode]));

      if vDetail then
        ExecQuery(vSQLText,[],true);
      if vMaster then
        ExecQuery(vSQLEtcText,[],true);


      isChanged := false;
      isMultiMode                := False;
      DoGridLink;
      Result := True;
    finally
      Screen.Cursor := crDefault;
    end;
    Exit;
  end;

  // 회원번호 입력여부 확인
  if Trim(MemberNoEdit.Text) = EmptyStr then
  begin
    ErrBox(MemberNoLabel.Caption+msgMustInput);
    if MainPanel.Enabled and MemberNoEdit.Enabled then
      MemberNoEdit.SetFocus;
    Exit;
  end
  // 회원이름 입력여부 확인
  else if Trim(MemberNameEdit.Text) = EmptyStr then
  begin
    ErrBox(MemberNameLabel.Caption+msgMustInput);
    if MainPanel.Enabled and MemberNameEdit.Enabled then
      MemberNameEdit.SetFocus;
    Exit;
  end;

  try
    OpenQuery('select count(*) '
             +'  from MS_MEMBER '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +Ifthen(isNew, '', Format('and CD_MEMBER <> ''%s'' ',[MemberNoEdit.Text]))
             +'   and NM_MEMBER =:P2 ',
             [HeadStoreCode,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
              Trim(MemberNameEdit.Text)]);
    if (Query.Fields[0].AsInteger > 0) then
    begin
      if not AskBox('회원이름이 같은 회원이 있습니다.'+#13+'계속하시겠습니까?') then
        Exit;
    end;
  finally
    FinishQuery;
  end;

  if Trim(CardNoEdit.Text) <> '' then
    try
      OpenQuery('select Count(*) '
               +'  from MS_MEMBER '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +Ifthen(isNew, '', Format('and CD_MEMBER <> ''%s'' ',[MemberNoEdit.Text]))
               +'   and NO_CARD  =:P2 ',
               [HeadStoreCode,
                Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                Trim(CardNoEdit.Text)]);
      if (Query.Fields[0].AsInteger > 0) then
      begin
        MsgBox('사용 중인 카드번호입니다.');
        Exit;
      end;
    finally
      FinishQuery;
    end;

  // 저장
  ExecQuery('insert into MS_MEMBER(CD_HEAD, '
           +'                      CD_STORE, '
           +'                      CD_MEMBER, '
           +'                      NM_MEMBER, '
           +'                      DS_SEX, '
           +'                      DS_MEMBER, '
           +'                      NO_CARD, '
           +'                      YMD_ISU, '
           +'                      NO_JUMIN, '
           +'                      YMD_BIRTH, '
           +'                      YN_LUNAR, '
           +'                      YMD_MARRI, '
           +'                      TEL_HOME, '
           +'                      TEL_MOBILE, '
           +'                      TEL_ETC1, '
           +'                      TEL_ETC2, '
           +'                      NO_POST, '
           +'                      ADDR1, '
           +'                      ADDR2, '
           +'                      NM_EMAIL, '
           +'                      YN_NEWS, '
           +'                      REMARK, '
           +'                      NO_CASHRCP, '
           +'                      DS_STATUS, '
           +'                      CD_SAWON_CHG, '
           +'                      CD_DAMDANG, '
           +'                      CD_AGE, '
           +'                      CD_LOCAL, '
           +'                      CD_COURSE, '
           +'                      DT_CHANGE, '
           +'                      YMD_AGREE, '
           +'                      YMD_REJECT, '
           +'                      CD_STORE_JOIN, '
           +'                      CD_STORE_CHG, '
           +'                      TEL_MOBILE_SHORT, '
           +'                      TEL_HOME_SHORT, '
           +'                      CHOSUNG, '
           +'                      PRG_INSERT, '
           +'                      PRG_CHANGE) '
           +'             values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, AES_Encrypt(:P12,71483), AES_Encrypt(:P13,71483), :P14, :P15, :P16, :P17, :P18, :P19, :P20, :P21, '
           +'                     :P22, :P23, :P24, :P25, :P26, :P27, :P28, Now(), :P29, :P30, :P31, :P31,  AES_Encrypt(Right(:P13,4),71483),AES_Encrypt(Right(:P12,4),71483), GetChosung(:P3), ''B/O'', ''B/O'') '
           +'ON DUPLICATE KEY UPDATE NM_MEMBER    = :P3, '
           +'                        DS_SEX       = :P4, '
           +'                        DS_MEMBER    = :P5, '
           +'                        NO_CARD      = :P6, '
           +'                        YMD_ISU      = :P7, '
           +'                        NO_JUMIN     = :P8, '
           +'                        YMD_BIRTH    = :P9, '
           +'                        YN_LUNAR     = :P10, '
           +'                        YMD_MARRI    = :P11, '
           +'                        TEL_HOME     = AES_Encrypt(:P12, 71483), '
           +'                        TEL_MOBILE   = AES_Encrypt(:P13, 71483), '
           +'                        TEL_ETC1     = :P14, '
           +'                        TEL_ETC2     = :P15, '
           +'                        NO_POST      = :P16, '
           +'                        ADDR1        = :P17, '
           +'                        ADDR2        = :P18, '
           +'                        NM_EMAIL     = :P19, '
           +'                        YN_NEWS      = :P20, '
           +'                        REMARK       = :P21, '
           +'                        NO_CASHRCP   = :P22, '
           +'                        DS_STATUS    = :P23, '
           +'                        CD_SAWON_CHG = :P24, '
           +'                        CD_DAMDANG   = :P25, '
           +'                        CD_AGE       = :P26, '
           +'                        CD_LOCAL     = :P27, '
           +'                        CD_COURSE    = :P28, '
           +'                        DT_CHANGE    =  Now(), '
           +'                        YMD_AGREE    = :P29,'
           +'                        YMD_REJECT   = :P30, '
           +'                        CD_STORE_JOIN =:P31, '
           +'                        CD_STORE_CHG  =:P31, '
           +'                        TEL_HOME_SHORT   = AES_Encrypt(Right(:P12,4),71483), '
           +'                        TEL_MOBILE_SHORT = AES_Encrypt(Right(:P13,4),71483),'
           +'                        CHOSUNG      = GetChosung(:P3), '
           +'                        PRG_CHANGE   = ''B/O'';',
          [HeadStoreCode,
           Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
           MemberNoEdit.Text,
           MemberNameEdit.Text,
           GetStrPointerData(GenderComboBox),
           GetStrPointerData(MemberTypeComboBox),
           CardNoEdit.Text,
           IfThen(JoinDateEdit.CurrentDate     > 0.0, DtoS(JoinDateEdit.CurrentDate),     ''),
           IDNoEdit.Text,
           BirthdayEdit.Text,
           IfThen(BirthdayLunarCheckBox.Checked, 'Y', 'N'),
           MarriageEdit.Text,
           GetOnlyNumber(TelNoEdit.Text),
           GetOnlyNumber(MobileNoEdit.Text),
           Etc1TelNoEdit.Text,
           Etc2TelNoEdit.Text,
           ZipCodeEdit.Text,
           Addr1Edit.Text,
           Addr2Edit.Text,
           EMailEdit.Text,
           IfThen(SMSAgreeCheckBox.Checked, 'Y', 'N'),
           RemarkMemo.Text,
           CashReceiptNoEdit.Text,
           GetStrPointerData(StatusComboBox),
           UserCode,
           GetStrPointerData(DamdangComboBox),
           GetStrPointerData(AgeGroupComboBox),
           GetStrPointerData(DeliveryLocalComboBox),
           GetStrPointerData(DeliveryCourseComboBox),
           IfThen(AgreeDateEdit.Text  <> '', DtoS(AgreeDateEdit.CurrentDate), ''),
           IfThen(RejectDateEdit.Text <> '', DtoS(RejectDateEdit.CurrentDate), ''),
           StoreCode],false);

  if CreditComboBox.EditModified then
    ExecQuery('update MS_MEMBER_ETC '
             +'   set YN_TRUST  =:P3 '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and CD_MEMBER =:P2; ',
             [HeadStoreCode,
              StoreCode,
              MemberNoEdit.Text,
              GetStrPointerData(CreditComboBox)],false);

  Result := ExecQuery('',[],true);

  if Result then
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := MemberNoEdit.Text;
      NewData[1] := MemberNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewMemberName.Index] := MemberNameEdit.Text;
end;

end.
