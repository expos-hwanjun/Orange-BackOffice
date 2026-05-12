// 매장 관리 (F)

unit SystemStore;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxLabel, cxGroupBox, cxButtonEdit, cxMaskEdit,
  StdCtrls, cxGridCustomTableView, cxGridTableView, AdvToolBar, JPEG,
  AdvToolBarStylers, ExtCtrls, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, StrUtils, DateUtils, DBAccess, Vcl.ExtDlgs, cxImage,
  cxCheckBox;

type
  TSystemStoreForm = class(TInheritGridEditForm)
    GridTableViewStoreCode: TcxGridColumn;
    GridTableViewStoreName: TcxGridColumn;
    CompanyCodeLabel: TLabel;
    CompanyNameLabel: TLabel;
    CEONameLabel: TLabel;
    IDNoLabel: TLabel;
    JongmokLabel: TLabel;
    UptaeLabel: TLabel;
    TelNoLabel: TLabel;
    FaxNoLabel: TLabel;
    AddrLabel: TLabel;
    CompanyCodeEdit: TcxTextEdit;
    CompanyNameEdit: TcxTextEdit;
    CEONameEdit: TcxTextEdit;
    IDNoEdit: TcxMaskEdit;
    JongmokEdit: TcxTextEdit;
    UptaeEdit: TcxTextEdit;
    TelNoEdit: TcxTextEdit;
    FaxNoEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    OKCashbagGroupBox: TcxGroupBox;
    OkCashbagJoinNoLabel: TLabel;
    OkCashbagPasswordLabel: TLabel;
    OkCashbagJoinNoEdit: TcxTextEdit;
    OkCashbagPasswordEdit: TcxTextEdit;
    InvoiceGroupBox: TcxGroupBox;
    MobileNoLabel: TLabel;
    EMailLabel: TLabel;
    MobileNoEdit: TcxTextEdit;
    EMailEdit: TcxTextEdit;
    MobileNoCommentLabel: TLabel;
    SubIDNoLabel: TLabel;
    SubIDNoEdit: TcxTextEdit;
    InvoiceItemLabel: TLabel;
    InvoiceItemEdit: TcxTextEdit;
    PictureImage: TcxImage;
    PictureLoadButton: TButton;
    PictureDeleteButton: TButton;
    PictureLoadDialog: TOpenPictureDialog;
    StoreInfoButton: TButton;
    OrderGroupBox: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    StoreTypeComboBox: TcxComboBox;
    OrderCheckBox: TcxCheckBox;
    StoreComboBox: TcxComboBox;

    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PictureLoadButtonClick(Sender: TObject);
    procedure PictureDeleteButtonClick(Sender: TObject);
    procedure StoreInfoButtonClick(Sender: TObject);
  private
    procedure SetStoreComboBox;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  SystemStoreForm: TSystemStoreForm;



implementation

uses
  Common, DBModule, ZipCode, ProxyCheck;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSystemStoreForm.FormShow(Sender: TObject);
begin
  inherited;
  ButtonToolBarSearchButton.Click;

  // 대표영업장 마스터로 로그인 했을 때만 조회 및 삭제가 가능하다
  ButtonToolBarSearchButton.Visible := (UserCode = userMaster) and (StoreCode = HeadStoreCode);
  ButtonToolBarDeleteButton.Visible := ButtonToolBarSearchButton.Visible;
end;
procedure TSystemStoreForm.PictureDeleteButtonClick(Sender: TObject);
begin
  inherited;
  PictureImage.Hint := EmptyStr;
  PictureImage.Clear;
end;

procedure TSystemStoreForm.PictureLoadButtonClick(Sender: TObject);
var
  vWidth, vHeight: Integer;
  vBMP: TBitmap;
  vJPG: TJPEGImage;
begin
  inherited;

  PictureLoadDialog.FileName := PictureImage.Hint;
  if PictureLoadDialog.Execute then
  begin
    PictureImage.Hint := PictureLoadDialog.FileName;
    PictureImage.Picture.LoadFromFile(PictureLoadDialog.FileName);

    // 이미지를 JPG 형태의 작은 사진으로 수정해 저장한다
    if PictureImage.Picture.Width > PictureImage.Height then
    begin
      vWidth  := PictureImage.Width;
      vHeight := Trunc(PictureImage.Picture.Height * (vWidth / PictureImage.Picture.Width));
    end
    else
    begin
      vHeight := PictureImage.Height;
      vWidth  := Trunc(PictureImage.Picture.Width * (vHeight / PictureImage.Picture.Height));
    end;
    vBMP := TBitmap.Create;
    vJPG := TJPEGImage.Create;
    try
      vBMP.Width  := vWidth;
      vBMP.Height := vHeight;
      vBMP.Canvas.StretchDraw(vBMP.Canvas.ClipRect, PictureImage.Picture.Graphic);
      vJPG.Assign(vBMP);
      PictureImage.Picture.Assign(vJPG);
    finally
      vBMP.Free;
      vJPG.Free;
    end;
  end;
end;

procedure TSystemStoreForm.SetStoreComboBox;
var vCode : PStrPointer;
begin
  StoreComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := EmptyStr;
  StoreComboBox.Properties.Items.AddObject('없음', TObject(vCode));
  try
    OpenQuery('select CD_STORE, NM_STORE '
             +'from   MS_STORE '
             +'where  CD_STORE not in (:P0, :P1) '
             +'  and  DS_STORE = ''W'' '
             +'order by CD_STORE ',
             [HeadStoreCode,
              CompanyCodeEdit.Text]);
    while not Query.Eof do
    begin
      //매장
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      StoreComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TSystemStoreForm.StoreInfoButtonClick(Sender: TObject);
begin
  inherited;
  with TProxyCheckForm.Create(self) do
    try
      if ShowModal <> mrOK then
        Exit;
    finally
      Free;
    end;

  SetServerToLocal;
  DoGridLink;
end;

//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TSystemStoreForm.FormCreate(Sender: TObject);
var vCode : PStrPointer;
begin
  inherited;
  GridPanel.Visible     := false;
  OrderGroupBox.Visible := ProgramName = pnERP;


  // 상품구분
  New(vCode);
  vCode^.Data := 'D';
  StoreTypeComboBox.Properties.Items.AddObject('직영점', TObject(vCode));
  New(vCode);
  vCode^.Data := 'J';
  StoreTypeComboBox.Properties.Items.AddObject('가맹점', TObject(vCode));
  New(vCode);
  vCode^.Data := 'W';
  StoreTypeComboBox.Properties.Items.AddObject('물  류', TObject(vCode));

  //매장정보 수정못하도록
  CompanyNameEdit.Enabled := not IsFixStore;
  CEONameEdit.Enabled     := not IsFixStore;
  IDNoEdit.Enabled        := not IsFixStore;
  JongmokEdit.Enabled     := not IsFixStore;
  UptaeEdit.Enabled       := not IsFixStore;
  TelNoEdit.Enabled       := not IsFixStore;
  Addr1Edit.Enabled       := not IsFixStore;
  Addr2Edit.Enabled       := not IsFixStore;

  StoreInfoButton.Visible := IsFixStore;
end;

procedure TSystemStoreForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vPassword: string;
begin
  inherited;

  // 대표영업장 마스터가
  // Ctrl-I를 누르고
  // 비밀번호로 store를 누르면 신규 매장 입력 가능
  if (UserCode = userMaster) and (StoreCode = HeadStoreCode) and
     (Shift = [ssCtrl]) and (Key = Ord('I')) and
     PasswordBox('암호를 입력하십시오.', vPassword) and (vPassword = 'store') then
  begin
    ButtonToolBarNewButton.Visible := true;
    ButtonToolBarNewButton.Click;
  end;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 신규 버튼을 누를 때
procedure TSystemStoreForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  if (DBIP <> ipLocal) and (DBIP <> GetIPAddress) then
  begin
    ErrBox('DB가 설치된 PC에서만 등록 가능합니다.');
    ButtonToolBarNewButton.Visible := false;
    ButtonToolBarCancelButton.Click;
  end
  else
    inherited;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 값을 바꿀 때
procedure TSystemStoreForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = PictureImage then
    PictureDeleteButton.Enabled := PictureImage.Hint <> EmptyStr
  // 우편번호를 수정할 때 주소를 지운다
  else if (Sender = ZipCodeEdit) and (Addr1Edit.Text <> EmptyStr) then
    Addr1Edit.Clear
  else if Sender = StoreTypeComboBox then
  begin
    if (PStrPointer(StoreTypeComboBox.Properties.Items.Objects[StoreTypeComboBox.ItemIndex])^.Data = 'W') or (CompanyCodeEdit.Text = HeadStoreCode) then
    begin
      OrderCheckBox.Checked := false;
      OrderCheckBox.Enabled := false;
      StoreComboBox.ItemIndex := 0;
      StoreComboBox.Enabled := false;
    end
    else
    begin
      OrderCheckBox.Checked := true;
      OrderCheckBox.Enabled := true;
      StoreComboBox.Enabled := true;
    end;
  end;

end;
//------------------------------------------------------------------------------
// 입력창에서 빠져나갈 때
procedure TSystemStoreForm.EditExit(Sender: TObject);
begin
  inherited;

  // 전화번호를 체계에 맞게 고친다
  if (Sender = TelNoEdit) or (Sender = FaxNoEdit) or (Sender = MobileNoEdit) then
    TcxTextEdit(Sender).Text := GetPhoneNo(TcxTextEdit(Sender).Text);
end;
//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TSystemStoreForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  // 사업자번호를 검증한다
  if Sender = IDNoEdit then
  begin
    if not CheckIDNo(DisplayValue) then
      ShowMsg(IDNoLabel.Caption+msgMustInput, true)
    else
      ShowMsg;
  end

  // 우편번호에 맞는 주소를 불러온다
  else if (Sender = ZipCodeEdit) and (Addr1Edit.Text = EmptyStr) then
  begin
    OpenQuery('select   NM_CITYDO + '' '' + NM_GUGUN + '' '' + NM_DONG '
             +'from     MS_POST '
             +'where    NO_POST = :P0',
              [DisplayValue]);
    try
      if not Query.Eof then
        Addr1Edit.Text := Query.Fields[0].AsString;
    finally
      FinishQuery;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 우편번호 조회 버튼을 누를 때
procedure TSystemStoreForm.ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  with TZipCodeForm.Create(self) do
    try
      if ShowModal = mrOK then
      begin
        ZipCodeEdit.Text := Zip;
        Addr1Edit.Text   := Addr;
        Addr2Edit.Text   := Addr2;
        Addr2Edit.SetFocus;
      end;
    finally
      Free;
    end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSystemStoreForm.DoSearch: Boolean;
begin
  inherited;
  OpenQuery('select   CD_STORE, '
           +'         NM_STORE '
           +'from     MS_STORE '
           +'where    CD_STORE = :P0 '
           +'order by CD_STORE',
            [StoreCode]);

  DM.ReadQuery(Query, GridTableView);
  Result := true;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TSystemStoreForm.DoGridLink;
var
  vStream    : TStream;
  vJPG       : TJPEGImage;
begin
  inherited;
  CompanyCodeEdit.Text        := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStoreCode.Index];
  SetStoreComboBox;

  // DB에서 자료를 불러온다
  OpenQuery('select   NM_STORE, '
           +'         NM_BOSS, '
           +'         NO_BIZER, '
           +'         NM_UPJONG, '
           +'         NM_UPTAE, '
           +'         TEL_OFFICE, '
           +'         TEL_FAX, '
           +'         NO_POST, '
           +'         ADDR1, '
           +'         ADDR2, '
           +'         OKC_JOIN_NO, '
           +'         OKC_PASSWORD, '
           +'         TEL_MOBIL1, '
           +'         NM_EMAIL, '
           +'         INVOICE_ITEM, '
           +'         SIGN_IMAGE, '
           +'         DS_STORE, '
           +'         YN_ORDER, '
           +'         CD_STORE_DIST '
           +'from     MS_STORE '
           +'where    CD_STORE = :P0',
            [GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStoreCode.Index]]);
  isLoading := true;
  try
    if not Query.Eof then
    begin
      CompanyCodeEdit.Text        := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStoreCode.Index];
      CompanyNameEdit.Text        := Query.Fields[ 0].AsString;
      CEONameEdit.Text            := Query.Fields[ 1].AsString;
      IDNoEdit.Text               := Query.Fields[ 2].AsString;
      JongmokEdit.Text            := Query.Fields[ 3].AsString;
      UptaeEdit.Text              := Query.Fields[ 4].AsString;
      TelNoEdit.Text              := Query.Fields[ 5].AsString;
      FaxNoEdit.Text              := Query.Fields[ 6].AsString;
      ZipCodeEdit.Text            := Query.Fields[ 7].AsString;
      Addr1Edit.Text              := Query.Fields[ 8].AsString;
      Addr2Edit.Text              := Query.Fields[ 9].AsString;
      OkCashbagJoinNoEdit.Text    := Query.Fields[10].AsString;
      OkCashbagPasswordEdit.Text  := Query.Fields[11].AsString;
      MobileNoEdit.Text           := GetPhoneNo(Query.Fields[12].AsString);
      EMailEdit.Text              := Query.Fields[13].AsString;
      InvoiceItemEdit.Text        := Query.Fields[14].AsString;
      StoreTypeComboBox.ItemIndex := GetStrPointerIndex(StoreTypeComboBox, Query.Fields[16].AsString);
      OrderCheckBox.Checked       := Query.Fields[17].AsString = 'Y';
      StoreComboBox.ItemIndex     := GetStrPointerIndex(StoreComboBox, Query.Fields[18].AsString);

      // 이미지
      if Query.FieldByName('SIGN_IMAGE').AsString <> '' then
      begin
        vStream := Query.CreateBLOBStream(Query.FieldByName('SIGN_IMAGE'), bmRead);
        vJPG    := TJPEGImage.Create;
        try
          vJPG.LoadFromStream(vStream);
          PictureImage.Picture.Assign(vJPG);
          PictureImage.Tag := 1;
          PictureDeleteButton.Enabled := true;
        finally
          vStream.Free;
          vJPG.Free;
        end;
      end
      else
      begin
        PictureImage.Picture := nil;
        PictureImage.Tag     := 0;
      end;

      StoreTypeComboBox.Enabled := CompanyCodeEdit.Text <> HeadStoreCode;

      CompanyNameEdit.EditModified := false;
      CEONameEdit.EditModified     := false;
      IDNoEdit.EditModified        := false;
      JongmokEdit.EditModified     := false;
      UptaeEdit.EditModified       := false;
      TelNoEdit.EditModified       := false;
      Addr1Edit.EditModified       := false;
      Addr2Edit.EditModified       := false;
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 신규
function TSystemStoreForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    OpenQuery('select   Max(CD_STORE) '
             +'from     MS_STORE',
              []);
    CompanyCodeEdit.Text := LPad(IntToStr(StoI(Query.Fields[0].AsString)+1), 4, '0');
    CompanyNameEdit.SetFocus;
    Result := true;
  finally
    FinishQuery;
    isLoading := false;
  end;

  SetStoreComboBox;
  PictureImage.Picture     := nil;
  PictureImage.Tag         := 0;
end;
//------------------------------------------------------------------------------
// 삭제
function TSystemStoreForm.DoDelete: Boolean;
begin
  // 신규 상태일 때는 그냥 취소
  if isNew then
  begin
    ButtonToolBarCancelButton.Click;
    Result := true;
    Exit;
  end;

  try
    OpenQuery('select   Count(*)      as CNT, '
             +'         Min(CD_STORE) as CD_STORE '
             +'from     MS_STORE '
             +'where    CD_STORE <> :P0 '
             +'  and    DS_STATUS = ''0''',
              [HeadStoreCode]);
    if (Query.Fields[0].AsInteger <= 1) and (Query.Fields[1].AsString = CompanyCodeEdit.Text) then
    begin
      ErrBox('매장이 하나 이상 등록되어야 하므로 삭제할 수 없습니다.');
      Result := false;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  try
    OpenQuery('select   Top 1 CD_GOODS '
             +'from     MS_GOODS '
             +'where    CD_STORE = :P0',
              [CompanyCodeEdit.Text]);
    if not Query.Eof and (Query.Fields[0].AsString <> EmptyStr) then
    begin
      ErrBox(Format('%s 매장에 등록된 상품이 있어 삭제할 수 없습니다.', [CompanyNameEdit.Text]));
      Result := false;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  try
    BeginTrans;
    // POS 판매 실적이 없는 사원은 삭제
    ExecQuery('delete from MS_STORE '
             +'where  CD_STORE = :P0 ',
              [GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStoreCode.Index]], false);
    ExecQuery('delete from MS_GOODS_CLASS '
             +'where  CD_STORE = :P0 ',
              [GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStoreCode.Index]], false);
    ExecQuery('delete from MS_CODE '
             +'where  CD_STORE = :P0 ',
              [GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStoreCode.Index]], false);
    CommitTrans;
    Result := true;
  except
    on E: Exception do
    begin
      RollbackTrans;;
      ErrBox(E.Message);
      Result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 저장 버튼
function TSystemStoreForm.DoSave: Boolean;
var
  vDefStoreCode: string;
  vTemp, vDemoStr: string;
  vStream    : TMemoryStream;
  vJPG       : TJPEGImage;
begin
  Result := false;

  // 매장이름
  if Trim(CompanyNameEdit.Text) = EmptyStr then
  begin
    ErrBox(CompanyNameLabel.Caption+msgMustInput);
    CompanyNameEdit.SetFocus;
    Exit;
  end
  // 사업자번호
  else if not CheckIDNo(IDNoEdit.Text) and
          not AskBox(IDNoLabel.Caption+'가 체계에 맞지 않습니다.'#13'체계에 맞지 않을 경우 신용카드 승인 등이 제대로 되지 않습니다.'#13#13'저장하시겠습니까?') then
  begin
    IDNoEdit.SetFocus;
    Exit;
  end;

  try
    OpenQuery('select   Min(CD_STORE) as CD_STORE '
             +'from     MS_STORE '
             +'where    CD_STORE <> :P0 '
             +'  and    DS_STATUS = ''0''',
              [HeadStoreCode]);
    vDefStoreCode := Query.Fields[0].AsString;
    if vDefStoreCode = EmptyStr then
    begin
      ErrBox('기존에 최소 하나 이상의 매장이 등록되어 있어야 합니다.');
      Exit;
    end;
  finally
    FinishQuery;
  end;


  if OrderCheckBox.Checked and ( PStrPointer(StoreComboBox.Properties.Items.Objects[StoreComboBox.ItemIndex])^.Data = EmptyStr) then
  begin
    ErrBox('수발주 사용 시에는 물류매장이 반드시 지정되어야합니다');
    Exit;
  end;

  // 저장한다
  try
    BeginTrans;

    // 신규 매장 등록 시
    if isNew then
    begin
      // 일단 기존 등록된 매장 정보로 새 매장 정보를 등록한다
      ExecQuery('insert into MS_STORE '
               +'( '
               +'  CD_STORE, '
               +'  NO_BIZER,       NO_BIZER_SUB, '
               +'  NM_STORE,       NM_BOSS,        NM_UPJONG,       NM_UPTAE, '
               +'  TEL_OFFICE,     TEL_FAX,        TEL_MOBIL1,      TEL_MOBIL2, '
               +'  NO_POST,        ADDR1,          ADDR2,           NM_EMAIL, '
               +'  RCP_TITLE1,     RCP_TITLE2,     RCP_TITLE3,      RCP_TITLE4, '
               +'  RCP_END1,       RCP_END2,       RCP_END3,        RCP_END4, '
               +'  PNT_END1,       PNT_END2,       PNT_END3, '
               +'  TRUST_END1,     TRUST_END2,     TRUST_END3, '
               +'  CARD_END1,      CARD_END2,      CARD_END3,       CARD_END4, '
               +'  CASHRCP_END1,   CASHRCP_END2,   CASHRCP_END3, '
               +'  OKC_SAVE_END1,  OKC_SAVE_END2,  OKC_SAVE_END3, '
               +'  OKC_END1,       OKC_END2,       OKC_END3, '
               +'  CONF, '
               +'  PNT_MIN_USE, '
               +'  DC_UNIT, '
               +'  LEN_CARD,       PREFIX, '
               +'  BALANCE_LENGTH, BALANCE_PREFIX, BALANCE_PREFIX2, '
               +'  GOODS_LENGTH,   GOODS_PREFIX, '
               +'  COUPON_PREFIX, '
               +'  NO_POS, '
//               +'  USE_FROM,       USE_TO,         USE_UPDATE,      YMD_LICENSE, '
               +'  REMARK, '
               +'  CD_SAWON_CHG,   DT_CHANGE, '
//               +'  USE_POS,        USE_POWER, '
//               +'  CUSTOMERNO, '
               +'  CNT_WAITTEL, '
               +'  KEEP_DAY,       DELETE_DAY,     DELETE_PER, '
               +'  JOINPOINTCODE, '
               +'  AMT_DEFREADY, '
               +'  OKC_JOIN_NO,    OKC_PASSWORD, '
               +'  ASP_ORDER,      ASP_MEMBERCODE, '
               +'  YMD_SILSA, '
               +'  DT_TRANS, '
               +'  COMPANY_LEN_CARD,       COMPANY_PREFIX, '
               +'  COMPANY_BALANCE_LENGTH, COMPANY_BALANCE_PREFIX, COMPANY_BALANCE_PREFIX2, '
               +'  COMPANY_GOODS_LENGTH,   COMPANY_GOODS_PREFIX, '
               +'  DS_STATUS, '
               +'  BILL_REMARK,    INVOICE_ITEM,   DT_MEMBER_RANK, '
               +'  DS_STORE, YN_ORDER, CD_STORE_DIST '
               +') '
               +'select   :P1, '
               +'         NO_BIZER,       NO_BIZER_SUB, '
               +'         NM_STORE,       NM_BOSS,        NM_UPJONG,       NM_UPTAE, '
               +'         TEL_OFFICE,     TEL_FAX,        TEL_MOBIL1,      TEL_MOBIL2, '
               +'         NO_POST,        ADDR1,          ADDR2,           NM_EMAIL, '
               +'         RCP_TITLE1,     RCP_TITLE2,     RCP_TITLE3,      RCP_TITLE4, '
               +'         RCP_END1,       RCP_END2,       RCP_END3,        RCP_END4, '
               +'         PNT_END1,       PNT_END2,       PNT_END3, '
               +'         TRUST_END1,     TRUST_END2,     TRUST_END3, '
               +'         CARD_END1,      CARD_END2,      CARD_END3,       CARD_END4, '
               +'         CASHRCP_END1,   CASHRCP_END2,   CASHRCP_END3, '
               +'         OKC_SAVE_END1,  OKC_SAVE_END2,  OKC_SAVE_END3, '
               +'         OKC_END1,       OKC_END2,       OKC_END3, '
               +'         CONF, '
               +'         PNT_MIN_USE, '
               +'         DC_UNIT, '
               +'         COMPANY_LEN_CARD,       COMPANY_PREFIX, '
               +'         COMPANY_BALANCE_LENGTH, COMPANY_BALANCE_PREFIX, COMPANY_BALANCE_PREFIX2, '
               +'         COMPANY_GOODS_LENGTH,   COMPANY_GOODS_PREFIX, '
               +'         COUPON_PREFIX, '
               +'         NO_POS, '
//               +'         USE_FROM,       USE_TO,         USE_UPDATE,      YMD_LICENSE, '
               +'         REMARK, '
               +'         CD_SAWON_CHG,   DT_CHANGE, '
//               +'         USE_POS,        USE_POWER, '
//               +'         CUSTOMERNO, '
               +'         CNT_WAITTEL, '
               +'         KEEP_DAY,       DELETE_DAY,     DELETE_PER, '
               +'         JOINPOINTCODE, '
               +'         AMT_DEFREADY, '
               +'         OKC_JOIN_NO,    OKC_PASSWORD, '
               +'         ASP_ORDER,      ASP_MEMBERCODE, '
               +'         YMD_SILSA, '
               +'         DT_TRANS, '
               +'         COMPANY_LEN_CARD,       COMPANY_PREFIX, '
               +'         COMPANY_BALANCE_LENGTH, COMPANY_BALANCE_PREFIX, COMPANY_BALANCE_PREFIX2, '
               +'         COMPANY_GOODS_LENGTH,   COMPANY_GOODS_PREFIX, '
               +'         DS_STATUS, '
               +'         BILL_REMARK,    INVOICE_ITEM,   DT_MEMBER_RANK, '
               +'         ''D'', ''N'', '''' '
               +'from     MS_STORE                   '
               +'where    CD_STORE = :P0',
               [vDefStoreCode,
                CompanyCodeEdit.Text],
                false);

      // Master 사용자를 추가한다
      ExecQuery('insert into MS_SAWON '
              +'( '
              +'  CD_STORE, CD_SAWON, NM_SAWON, NO_PASSWORD, YMD_ENTRANCE, NM_RANK, CD_GRADE, YN_USE, TEL_HOME, TEL_MOBIL, NO_POST, ADDR1, ADDR2, NM_EMAIL, CD_SAWON_CHG, DT_CHANGE, EMP_WORK, DS_TRANS, TEL_OFFICE, YN_DEFAULT, YN_AUTHORITY '
              +') '
              +'select   :P2, '
              +'         CD_SAWON, '
              +'         NM_SAWON, '
              +'         NO_PASSWORD, '
              +'         YMD_ENTRANCE, '
              +'         NM_RANK, '
              +'         CD_GRADE, '
              +'         ''Y'', '
              +'         TEL_HOME, '
              +'         TEL_MOBIL, '
              +'         NO_POST, '
              +'         ADDR1, '
              +'         ADDR2, '
              +'         NM_EMAIL, '
              +'         :P1, '
              +'         GetDate(), '
              +'         EMP_WORK, '
              +'         0, '
              +'         TEL_OFFICE, '
              +'         ''N'', '
              +'         ''Y''  '
              +'from     MS_SAWON '
              +'where    CD_STORE = :P0 '
              +'  and    CD_SAWON = :P1',
              [vDefStoreCode,
               UserMaster,
               CompanyCodeEdit.Text],
               false);

      // 공통코드 추가
      ExecQuery('delete from MS_CODE '
               +'where  CD_STORE = :P0',
                [CompanyCodeEdit.Text],
                 false);
      ExecQuery('insert into MS_CODE '
               +'( '
               +'  CD_STORE, '
               +'  CD_KIND,   CD_CODE, '
               +'  NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
               +'  NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, '
               +'  NM_CODE21, NM_CODE22, NM_CODE23, NM_CODE24, NM_CODE25, NM_CODE26, NM_CODE27, NM_CODE28, NM_CODE29, NM_CODE30, '
               +'  DS_STATUS, CD_SAWON_CHG, DT_CHANGE, IMAGEDATA, DS_TRANS '
               +') '
               +'select   :P1, '
               +'         CD_KIND,   CD_CODE, '
               +'         NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
               +'         NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, '
               +'         NM_CODE21, NM_CODE22, NM_CODE23, NM_CODE24, NM_CODE25, NM_CODE26, NM_CODE27, NM_CODE28, NM_CODE29, NM_CODE30, '
               +'         DS_STATUS, :P2, GetDate(), IMAGEDATA, 0 '
               +'from     MS_CODE '
               +'where    CD_STORE = :P0 '
               +'  and    CD_KIND <> ''01''',
               [vDefStoreCode,
                CompanyCodeEdit.Text,
                UserCode],
                false);

      // 본사 상품분류 추가
      ExecQuery('delete from MS_GOODS_CLASS '
               +'where  CD_STORE = :P0',
                [CompanyCodeEdit.Text],
                 false);
      ExecQuery('insert into MS_GOODS_CLASS '
               +'( '
               +'  CD_STORE, '
               +'  CD_CLASS, '
               +'  NM_CLASS, '
               +'  PROFIT_RATE, '
               +'  DT_CHANGE, '
               +'  DS_TRANS '
               +') '
               +'select   :P1, '
               +'         CD_CLASS, '
               +'         NM_CLASS, '
               +'         PROFIT_RATE, '
               +'         GetDate(), '
               +'         0 '
               +'from     MS_GOODS_CLASS '
               +'where    CD_STORE = :P0',
                [HeadStoreCode,
                 CompanyCodeEdit.Text],
                 false);

      if GetOption(253) = '1'  then
        //상품을 등록한다
        ExecQuery('insert into MS_GOODS '
                 +'( '
                 +'  CD_STORE, '
                 +'  CD_GOODS, '
                 +'  NM_GOODS, '
                 +'  NM_GOODS_SHORT, '
                 +'  CD_CLASS, '
                 +'  DS_GOODS, '
                 +'  PR_SALE, '
                 +'  DS_TAX, '
                 +'  YN_DC, '
                 +'  YN_POINT, '
                 +'  DS_STOCK, '
                 +'  CD_GOODS_T, '
                 +'  NM_UNIT, '
                 +Ifthen(GetOption(269)='1', '  CD_TRDPL, ','')
                 +'  PR_BUY, '
                 +'  QTY_NEPUM, '
                 +'  QTY_SAFETY, '
                 +'  YN_USE, '
                 +'  NM_SPEC, '
                 +'  CD_BOTTLE, '
                 +'  CD_MAKER, '
                 +'  DS_ORDER, '
                 +'  NO_ORDER, '
                 +'  NO_BUY, '
                 +'  QTY_ORDER_UNIT, '
                 +'  YN_ADULT, '
                 +'  NO_EXPIRE, '
                 +'  DS_SEASON, '
                 +'  YN_OKCASHBAG, '
                 +'  PR_SALE_PROFIT, '
                 +'  RATE_FEE, '
                 +'  YN_SALEPRICE_SAME,'
                 +'  KEEP_TXT,'
                 +'  CD_POSITION,'
                 +'  CD_THROW,'
                 +'  RATE_INCENTIVES, '
                 +'  CAPACITY_GOODS, '
                 +'  CAPACITY_STD, '
                 +'  CD_TEAM, '
                 +'  DT_INSERT, '
                 +'  PRG_INSERT, '
                 +'  PRG_CHG, '
                 +'  CD_SAWON_CHG, '
                 +'  YN_BOXPRICELINK, '
                 +'  YN_BUYPRICE_SAME, '
                 +'  DT_CHANGE, '
                 +'  DS_TRANS '
                 +')  '
                 +'  select :P0, '
                 +'  CD_GOODS, '
                 +'  NM_GOODS, '
                 +'  NM_GOODS_SHORT, '
                 +'  CD_CLASS, '
                 +'  DS_GOODS, '
                 +'  PR_SALE, '
                 +'  DS_TAX, '
                 +'  YN_DC, '
                 +'  YN_POINT, '
                 +'  DS_STOCK, '
                 +'  CD_GOODS_T, '
                 +'  NM_UNIT, '
                 +Ifthen(GetOption(269)='1', '  CD_TRDPL, ','')
                 +'  PR_BUY, '
                 +'  QTY_NEPUM, '
                 +'  QTY_SAFETY, '
                 +'  YN_USE, '
                 +'  NM_SPEC, '
                 +'  CD_BOTTLE, '
                 +'  CD_MAKER, '
                 +'  DS_ORDER, '
                 +'  NO_ORDER, '
                 +'  NO_BUY, '
                 +'  QTY_ORDER_UNIT, '
                 +'  YN_ADULT, '
                 +'  NO_EXPIRE, '
                 +'  DS_SEASON, '
                 +'  YN_OKCASHBAG, '
                 +'  PR_SALE_PROFIT, '
                 +'  RATE_FEE, '
                 +'  YN_SALEPRICE_SAME,'
                 +'  KEEP_TXT,'
                 +'  CD_POSITION,'
                 +'  CD_THROW,'
                 +'  RATE_INCENTIVES, '
                 +'  CAPACITY_GOODS, '
                 +'  CAPACITY_STD, '
                 +'  CD_TEAM, '
                 +'  getdate(), '
                 +'  ''CMM'', '
                 +'  PRG_CHG, '
                 +'  CD_SAWON_CHG, '
                 +'  YN_BOXPRICELINK, '
                 +'  YN_BUYPRICE_SAME, '
                 +'  getdate(), '
                 +'  DS_TRANS '
                 +'from MS_GOODS '
                 +'where CD_STORE = ''0000'' ',
                 [CompanyCodeEdit.Text],
                 false);

      // 본사일 때
      if StoreCode = HeadStoreCode then
      begin
        // 통합회원 사용 시
        if CheckOption(257) then
        begin
          ExecQuery('delete from MS_CODE '
                   +'where  CD_STORE <> :P0 '
                   +'  and  CD_KIND in (''05'',''12'',''13'')',
                    [HeadStoreCode],
                     false);
          ExecQuery('insert into MS_CODE '
                   +'( '
                   +'  CD_STORE, '
                   +'  CD_KIND,   CD_CODE, '
                   +'  NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
                   +'  NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, '
                   +'  NM_CODE21, NM_CODE22, NM_CODE23, NM_CODE24, NM_CODE25, NM_CODE26, NM_CODE27, NM_CODE28, NM_CODE29, NM_CODE30, '
                   +'  DS_STATUS, CD_SAWON_CHG, DT_CHANGE, IMAGEDATA, DS_TRANS '
                   +') '
                   +'select   b.CD_STORE, '
                   +'         a.CD_KIND,   a.CD_CODE, '
                   +'         a.NM_CODE1,  a.NM_CODE2,  a.NM_CODE3,  a.NM_CODE4,  a.NM_CODE5,  a.NM_CODE6,  a.NM_CODE7,  a.NM_CODE8,  a.NM_CODE9,  a.NM_CODE10, '
                   +'         a.NM_CODE11, a.NM_CODE12, a.NM_CODE13, a.NM_CODE14, a.NM_CODE15, a.NM_CODE16, a.NM_CODE17, a.NM_CODE18, a.NM_CODE19, a.NM_CODE20, '
                   +'         a.NM_CODE21, a.NM_CODE22, a.NM_CODE23, a.NM_CODE24, a.NM_CODE25, a.NM_CODE26, a.NM_CODE27, a.NM_CODE28, a.NM_CODE29, a.NM_CODE30, '
                   +'         a.DS_STATUS, :P1, GetDate(), a.IMAGEDATA, 0 '
                   +'from     MS_CODE  as a left outer join '
                   +'         MS_STORE as b on b.CD_STORE <> :P0 '
                   +'where    a.CD_STORE = :P0 '
                   +'  and    a.CD_KIND in (''05'',''12'',''13'')',
                    [HeadStoreCode,
                     UserCode],
                     false);
        end;

        // 본사일 때는 모든 매장에 환경설정을 반영한단다 뭔지...?
        ExecQuery('update MS_STORE '
                 +'set    CONF = Left(CONF, 252) + '
                 +'              (select SubString(CONF, 253, 7) from MS_STORE where CD_STORE = :P0) + '
                 +'              Right(CONF, Len(CONF)-259) '
                 +'where  CD_STORE <> :P0 ',
                  [HeadStoreCode],
                   false);
      end;
    end;

    // 변경 정보를 저장한다
    ExecQuery('update MS_STORE '
             +'set    NM_STORE     = :P1, '
             +'       NM_BOSS      = :P2, '
             +'       NO_BIZER     = :P3, '
             +'       NO_BIZER_SUB = :P4, '
             +'       NM_UPTAE     = :P5, '
             +'       NM_UPJONG    = :P6, '
             +'       TEL_OFFICE   = :P7, '
             +'       TEL_FAX      = :P8, '
             +'       NO_POST      = :P9, '
             +'       ADDR1        = :P10, '
             +'       ADDR2        = :P11, '
             +'       TEL_MOBIL1   = :P12, '
             +'       NM_EMAIL     = :P13, '
             +'       INVOICE_ITEM = :P14, '
             +'       OKC_JOIN_NO  = :P15, '
             +'       OKC_PASSWORD = :P16, '
             +'       CD_SAWON_CHG = :P17, '
             +'       DS_STORE     = :P18, '
             +'       YN_ORDER     = :P19, '
             +'       CD_STORE_DIST =:P20, '
             +'       DT_CHANGE    = GetDate() '
             +'where  CD_STORE     = :P0',
              [CompanyCodeEdit.Text,
               CompanyNameEdit.Text,
               CEONameEdit.Text,
               IDNoEdit.Text,
               SubIDNoEdit.Text,
               UptaeEdit.Text,
               JongmokEdit.Text,
               TelNoEdit.Text,
               FaxNoEdit.Text,
               ZipCodeEdit.Text,
               Addr1Edit.Text,
               Addr2Edit.Text,
               MobileNoEdit.Text,
               EMailEdit.Text,
               InvoiceItemEdit.Text,
               OkCashbagJoinNoEdit.Text,
               OkCashbagPasswordEdit.Text,
               UserCode,
               PStrPointer(StoreTypeComboBox.Properties.Items.Objects[StoreTypeComboBox.ItemIndex])^.Data,
               Ifthen(OrderCheckBox.Checked, 'Y', 'N'),
               PStrPointer(StoreComboBox.Properties.Items.Objects[StoreComboBox.ItemIndex])^.Data],
               false);

    // 공통 환경 반영
    if (not CheckOption(254)) or (not CheckOption(255)) or (CheckOption(257)) then
    begin
      vTemp := EmptyStr;
      if not CheckOption(254) then
        vTemp := vTemp + Format(' GOODS_LENGTH = %d, GOODS_PREFIX = ''%s'', ', [SelfGoodsLength, SelfGoodsPrefix]);
      if not CheckOption(255) then
        vTemp := vTemp + Format(' BALANCE_LENGTH = %d, BALANCE_PREFIX = ''%s'', BALANCE_PREFIX2 = ''%s'', ', [ScaleGoodsLength, ScaleGoodsPrefix, ScaleGoodsPrefix2]);
      if CheckOption(257) then
        vTemp := vTemp + Format(' LEN_CARD = %d, PREFIX = ''%s'', ', [MemberCardLength, MemberPrefix]);
      ExecQuery('update MS_STORE '
               +'set '+ vTemp
               +'       DT_CHANGE = GetDate() '
               +'where  CD_STORE <> :P0 ',
                [HeadStoreCode],
                 false);
    end;

    //본사수발주 사용 시 본사를 매입처로 등록한다
    if (CompanyCodeEdit.Text <> HeadStoreCode) and (PStrPointer(StoreTypeComboBox.Properties.Items.Objects[StoreTypeComboBox.ItemIndex])^.Data <> 'W') then
      try
        OpenQuery('select count(*) '
                 +'  from MS_TRD '
                 +' where CD_STORE =:P0 '
                 +'   and CD_TRDPL =''000000'' ',
                 [CompanyCodeEdit.Text]);
        if OrderCheckBox.Checked and (Query.Fields[0].AsInteger = 0) then
        begin
          Query.Close;
          ExecQuery('insert into MS_TRD(CD_STORE, '
                   +'                   CD_TRDPL, '
                   +'                   NM_TRDPL, '
                   +'                   DS_TRDPL, '
                   +'                   NM_BOSS, '
                   +'                   NO_BIZER, '
                   +'                   NM_JONGMOK, '
                   +'                   NM_UPTAE, '
                   +'                   TEL_OFFICE, '
                   +'                   NO_POST, '
                   +'                   ADDR1, '
                   +'                   ADDR2, '
                   +'                   DS_ORDER, '
                   +'                   CD_STORE_DIST ) '
                   +'          VALUES (:P0, '
                   +'                  :P1, '
                   +'                  :P2, '
                   +'                  :P3, '
                   +'                  :P4, '
                   +'                  :P5, '
                   +'                  :P6, '
                   +'                  :P7, '
                   +'                  :P8, '
                   +'                  :P9, '
                   +'                  :P10, '
                   +'                  :P11, '
                   +'                  :P12, '
                   +'                  :P13 ) ',
                   [CompanyCodeEdit.Text,
                    '000000',
                    CompanyNameEdit.Text,
                    'B',
                    CEONameEdit.Text,
                    IDNoEdit.Text,
                    JongmokEdit.Text,
                    UptaeEdit.Text,
                    TelNoEdit.Text,
                    ZipCodeEdit.Text,
                    Addr1Edit.Text,
                    Addr2Edit.Text,
                    '2',
                    PStrPointer(StoreComboBox.Properties.Items.Objects[StoreComboBox.ItemIndex])^.Data],
                    false);
        end
        else if OrderCheckBox.Checked and (Query.Fields[0].AsInteger = 1) then
        begin
          Query.Close;
          ExecQuery('update MS_TRD set DS_STATUS     =''0'', '
                   +'                  NM_TRDPL      =:P2, '
                   +'                  CD_STORE_DIST =:P3 '
                   +' where CD_STORE =:P0 '
                   +'   and CD_TRDPL =:P1 ',
                   [CompanyCodeEdit.Text,
                    '000000',
                    StoreComboBox.Text,
                    PStrPointer(StoreComboBox.Properties.Items.Objects[StoreComboBox.ItemIndex])^.Data],
                    false);

        end
        else if not OrderCheckBox.Checked then
        begin
          Query.Close;
          ExecQuery('update MS_TRD set DS_STATUS = ''1'', '
                   +'                  CD_STORE_DIST =:P2 '
                   +' where CD_STORE =:P0 '
                   +'   and CD_TRDPL =:P1 ',
                   [CompanyCodeEdit.Text,
                    '000000',
                    PStrPointer(StoreComboBox.Properties.Items.Objects[StoreComboBox.ItemIndex])^.Data],
                    false);
        end
      finally
        FinishQuery;
      end;

    if (StoreCode = CompanyCodeEdit.Text) then
      StoreName := CompanyNameEdit.Text;
    Result := true;
    CommitTrans;

    // 데모인증내역을 입력한다
    if isNew then
    begin
      vDemoStr := 'Demo'+FormatDateTime(fmtDateShort, IncDay(Now, 16)) + FormatDateTime(fmtDateShort, Now) + '30' + '1111110005' + FormatDateTime(fmtDateShort, IncDay(Now, 10));
      vDemoStr := Encrypt(vDemoStr, 2345);
      SetRegistry(HKEY_LOCAL_MACHINE, regExtremePOS+msgExtremeERP+'\'+CompanyCodeEdit.Text, regGuest, vDemoStr);
    end;

    if ButtonToolBarNewButton.Visible then
    begin
      StoreList.Clear;
      StoreList.Add(HeadStoreCode);
      OpenQuery('select   CD_STORE '
               +'from     MS_STORE '
               +'where    CD_STORE <> :P0 '
               +'  and    DS_STATUS = ''0''',
                [HeadStoreCode]);
      while not Query.Eof do
      begin
        StoreList.Add(Query.Fields[0].AsString);
        Query.Next;
      end;
      FinishQuery;
    end;

    StoreName        := CompanyNameEdit.Text;
    BusinessNumber   := CEONameEdit.Text;
    StoreTelNumber   := TelNoEdit.Text;

    if isNew then DoSearch;
  except
    on E: Exception do
    begin
      RollbackTrans;;
      ErrBox(E.Message);
      Result := false;
    end;
  end;

  // 이미지를 저장한다
  BeginTrans;
  try
    vStream := TMemoryStream.Create;
    vJPG    := TJPEGImage.Create;
    try
      if PictureImage.Picture.Graphic <> nil then
      begin
        vJPG.Assign(PictureImage.Picture.Graphic);
        vJPG.SaveToStream(vStream);
      end;
      Query.SQL.Text := 'update MS_STORE '
                       +'set    SIGN_IMAGE = :P1 '
                       +'where  CD_STORE   = :P0 ';
      Query.ParamByName(sqlP0).Value := StoreCode;
      Query.ParamByName(sqlP1).LoadFromStream(vStream, ftBlob);
      Query.Execute;
    finally
      vStream.Free;
      vJPG.Free;
    end;
    CommitTrans;
  except
    on E: Exception do
    begin
      RollBackTrans;
      ErrBox(E.Message);
    end;
  end;

  //매장정보를 익스트림서버에 반영한다
  if  (StoreCode <> HeadStoreCode) and (CompanyNameEdit.EditModified or
      CEONameEdit.EditModified or
      IDNoEdit.EditModified or
      JongmokEdit.EditModified or
      UptaeEdit.EditModified or
      TelNoEdit.EditModified or
      Addr1Edit.EditModified or
      Addr2Edit.EditModified) then
  SetLocalToServer;
end;

end.
