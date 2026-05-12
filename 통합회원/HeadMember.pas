// 회원 관리 (완료)

unit HeadMember;



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
  Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvOfficePagerStylers;

type
  THeadMemberForm = class(TInheritGridEditForm)
    GridTableViewMemberNo: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    MainPager: TAdvOfficePager;
    MemberPage: TAdvOfficePage;
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
    JoinDateLabel: TLabel;
    CashReceiptNoLabel: TLabel;
    MemberNoEdit: TcxTextEdit;
    MemberNoCreateButton: TButton;
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
    JoinDateEdit: TcxDateEdit;
    MemberGroupBox: TcxGroupBox;
    LastVisitDateLabel: TLabel;
    VisitCountLabel: TLabel;
    SaleAmountLabel: TLabel;
    RemainPointLabel: TLabel;
    LastVisitDateEdit: TcxTextEdit;
    VisitCountEdit: TcxCurrencyEdit;
    SaleAmountEdit: TcxCurrencyEdit;
    RemainPointEdit: TcxCurrencyEdit;
    CashReceiptNoEdit: TcxTextEdit;
    DetailPage: TAdvOfficePage;
    ConditionToolBarStatusLabel: TcxLabel;
    GridTableViewDsStatus: TcxGridColumn;
    PictureImage: TcxImage;
    PictureDeleteButton: TButton;
    PictureLoadButton: TButton;
    IDNoLabel: TLabel;
    BirthdayLabel: TLabel;
    IDNoEdit: TcxMaskEdit;
    MarriageDateLabel: TLabel;
    Etc2TelNoEdit: TcxTextEdit;
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
    AgeGroupComboBox: TcxComboBox;
    Label2: TLabel;
    SaleGridTableViewGubun: TcxGridColumn;
    BirthdayLunarCheckBox: TcxCheckBox;
    DetailSearchPanel: TAdvPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ConditionMemberClassComboBox: TcxComboBox;
    ConditionLastVisitDateEdit: TcxDateEdit;
    ConditionFromPointEdit: TcxCurrencyEdit;
    ConditionToPointEdit: TcxCurrencyEdit;
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
    SmsGroupBox: TcxGroupBox;
    Label13: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    AgreeDateEdit: TcxDateEdit;
    RejectDateEdit: TcxDateEdit;
    SMSAgreeCheckBox: TcxCheckBox;
    BirthdayEdit: TcxMaskEdit;
    MarriageEdit: TcxMaskEdit;
    HistoryPage: TAdvOfficePage;
    HistoryGrid: TcxGrid;
    HistoryTableView: TcxGridTableView;
    HistoryTableViewHistoryDate: TcxGridColumn;
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
    HistoryGridLevel: TcxGridLevel;
    HistoryTableViewGubun: TcxGridColumn;
    HistoryTableViewRejectDate: TcxGridColumn;
    HistoryTableViewTrust: TcxGridColumn;
    HistoryTableViewPrgInsert: TcxGridColumn;
    HistoryTableViewPrgChange: TcxGridColumn;
    AgreeMemberCheckBox: TcxCheckBox;
    Label11: TLabel;
    StampCountEdit: TcxCurrencyEdit;
    SaleGridTableViewSaveStamp: TcxGridColumn;
    SaleGridTableViewUseStamp: TcxGridColumn;
    SaleGridTableViewStore: TcxGridColumn;
    HistoryTableViewStore: TcxGridColumn;
    GenderLabel: TLabel;
    GenderComboBox: TcxComboBox;
    Label1: TLabel;
    JoinStoreComboBox: TcxComboBox;
    Label3: TLabel;
    ConditionJoinStoreComboBox: TcxComboBox;

    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure MemberNoCreateButtonClick(Sender: TObject);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure PictureLoadButtonClick(Sender: TObject);
    procedure PictureDeleteButtonClick(Sender: TObject);
    procedure MainPagerChange(Sender: TObject);
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
    procedure HistoryPageShow(Sender: TObject);
  private
    PrefixCode :String;
    procedure mnuPointManageClick(Sender: TObject);
    procedure mnuPointSearchClick(Sender: TObject);
    procedure mnuSaleSearchClick(Sender: TObject);
    procedure SelectSaleData;
    procedure SetHistory;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    procedure SetMultiMode(aMultiMode: Boolean); override;
  end;

var
  HeadMemberForm: THeadMemberForm;



implementation

uses
  Common, DBModule, UnitZipPopup, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure THeadMemberForm.FormCreate(Sender: TObject);
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
end;

procedure THeadMemberForm.FormShow(Sender: TObject);
var
  vCode : PStrPointer;
  vIndex :Integer;
  vTemp  :String;
begin
  inherited;
  SetWorkStoreList;

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
                 StandardStore]);
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
                 StandardStore]);
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

    // 가입매장
    JoinStoreComboBox.Properties.Items.Clear;
    ConditionJoinStoreComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '';
    ConditionJoinStoreComboBox.Properties.Items.AddObject('전체', TObject(vCode));

    for vIndex := 0 to WorkStoreList.Count-1 do
    begin
      New(vCode);
      vCode^.Data := CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0);
      if vCode^.Data = StandardStore then
        vTemp := '통합'
      else
        vTemp := CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 1);

      JoinStoreComboBox.Properties.Items.AddObject(vTemp, TObject(vCode));
      ConditionJoinStoreComboBox.Properties.Items.AddObject(vTemp, TObject(vCode));
    end;
    ConditionJoinStoreComboBox.ItemIndex := 0;

    PrefixCode := '100';
    OpenQuery('select MEMBERNO_PREFIX '
            +'  from MS_STORE '
            +' where CD_HEAD  = :P0 '
            +'   and CD_STORE = :P1 ',
          [HeadStoreCode,
           StandardStore]);

    if not Query.Eof then
      PrefixCode := Query.Fields[0].AsString;
  finally
    FinishQuery;
    isLoading := false;
    isChanged := false;
  end;
end;

procedure THeadMemberForm.GridTableViewCustomDrawCell(
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

procedure THeadMemberForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[2] = '1' then
    AStyle := StyleFontRed;
end;

procedure THeadMemberForm.HistoryPageShow(Sender: TObject);
begin
  inherited;
  SetHistory;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 이름에서 키보드를 누를 때
procedure THeadMemberForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  isMultiMode := False;
end;


procedure THeadMemberForm.ConditionPointCheckBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ConditionFromPointEdit.Enabled := ConditionPointCheckBox.Checked;
  ConditionToPointEdit.Enabled   := ConditionPointCheckBox.Checked;
end;

procedure THeadMemberForm.MainPagerChange(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure THeadMemberForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if  (Sender is TcxCustomEdit) then
    TcxCustomEdit(Sender).EditModified := true;

  if Sender = PictureImage then
    PictureDeleteButton.Enabled := PictureImage.Hint <> EmptyStr
  // 우편번호를 수정할 때 주소를 지운다
  else if (Sender = ZipCodeEdit) and (Addr1Edit.Text <> EmptyStr) then
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
procedure THeadMemberForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
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
procedure THeadMemberForm.MemberNoCreateButtonClick(Sender: TObject);
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
            StandardStore,
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
procedure THeadMemberForm.mnuPointManageClick(Sender: TObject);
begin
end;

procedure THeadMemberForm.mnuPointSearchClick(Sender: TObject);
begin
end;

procedure THeadMemberForm.mnuSaleSearchClick(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
// 주소(우편번호) 입력창 버튼을 누를 때
procedure THeadMemberForm.ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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
procedure THeadMemberForm.PictureLoadButtonClick(Sender: TObject);
var
  vWidth, vHeight: Integer;
  vBMP: TBitmap;
  vJPG: TJPEGImage;
begin
  inherited;

  PictureLoadDialog.FileName := PictureImage.Hint;
  if PictureLoadDialog.Execute then
  begin
    PictureImage.Tag  := 1;
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
      isChanged := true;
    finally
      vBMP.Free;
      vJPG.Free;
    end;
  end;
end;
procedure THeadMemberForm.PointAddButtonClick(Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// (사진) 삭제 버튼
procedure THeadMemberForm.PictureDeleteButtonClick(Sender: TObject);
begin
  inherited;
  PictureImage.Tag  := 1;
  isChanged := true;
  PictureImage.Hint := EmptyStr;
  PictureImage.Clear;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 거래 내역 조회
procedure THeadMemberForm.SaleGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FormParam[0] := LeftStr(GetOnlyNumber(SaleGridTableView.DataController.Values[SaleGridTableView.DataController.GetFocusedRecordIndex, SaleGridTableViewReceiptNo.Index]),8);
  FormParam[1] := Copy(GetOnlyNumber(SaleGridTableView.DataController.Values[SaleGridTableView.DataController.GetFocusedRecordIndex, SaleGridTableViewReceiptNo.Index]),9,2);
  FormParam[2] := RightStr(GetOnlyNumber(SaleGridTableView.DataController.Values[SaleGridTableView.DataController.GetFocusedRecordIndex, SaleGridTableViewReceiptNo.Index]),4);
  ExtremeMainForm.RunProgram('SaleReceiptShow');
end;

procedure THeadMemberForm.SelectSaleData;
begin
  if Length(MemberNoEdit.Text) = MemberNoEdit.Properties.MaxLength then
  begin
    OpenQuery('select b.NM_STORE, '
             +'       StoDW(a.YMD_SALE) as YMD_SALE, '
             +'       case a.DS_SALE when ''S'' then case when IfNull(a.NO_DELIVERY,'''') = '''' then ''판매'' else ''배달'' end when ''B'' then ''반품'' end as DS_SALE, '
             +'       case when a.AMT_SALE = a.AMT_CASHRCP   and a.AMT_CASHRCP <> 0  then ''현금영수증'' '
             +'            when a.AMT_SALE = a.AMT_CASH      and a.AMT_CASH    <> 0  then ''현금'' '
             +'            when a.AMT_SALE = a.AMT_CARD      and a.AMT_CARD    <> 0  then ''신용카드'' '
             +'            when a.AMT_SALE = a.AMT_TRUST     and a.AMT_TRUST   <> 0  then ''외상'' '
             +'            when a.AMT_SALE = a.AMT_GIFT      and a.AMT_GIFT    <> 0  then ''상품권'' '
             +'            when a.AMT_SALE = a.AMT_BANK      and a.AMT_BANK    <> 0  then ''계좌이체'' '
             +'            when a.AMT_SALE = a.AMT_POINT     and a.AMT_POINT   <> 0  then ''포인트'' '
             +'            when a.AMT_SALE = 0               and a.DC_TOT      <> 0  then ''할인'' '
             +'            else ''복합'' end as DS_ACCT, '
             +'       a.DC_TOT, '
             +'       a.AMT_SALE, '
             +'       a.PNT_OCCUR, '
             +'       a.DC_POINT+a.AMT_POINT as AMT_POINT, '
             +'       a.DT_SALE, '
             +'       a.SAVE_STAMP, '
             +'       a.USE_STAMP, '
             +'       ConCat(a.YMD_SALE,''-'',a.NO_POS,''-'',a.NO_RCP) as NO_RECEIPT '
             +'  from SL_SALE_H a inner join '
             +'       MS_STORE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +' where a.CD_HEAD   = :P0 '
             +'   and a.CD_MEMBER = :P1 '
             +'   and a.DS_SALE  <> ''V'' '
             +' order by a.YMD_SALE desc, a.NO_POS, a.NO_RCP',
              [HeadStoreCode,
               MemberNoEdit.Text]);
    DM.ReadQuery(Query, SaleGridTableView);
  end;
end;
procedure THeadMemberForm.SetHistory;
begin
  if MainPager.ActivePage <> HistoryPage then Exit;

  if MemberNoEdit.Text = '' then
  begin
    HistoryTableView.DataController.RecordCount := 0;
    Exit;
  end;

  OpenQuery('select DT_HIST, '
           +'       case GUBUN when ''I'' then ''신규'' when ''U'' then ''수정'' when ''D'' then ''삭제'' else GUBUN end as GUBUN, '
           +'       CD_STORE_CHG, '
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
           +'       YN_TRUST, '
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
             StandardStore,
             MemberNoEdit.Text]);
    DM.ReadQuery(Query, HistoryTableView);
end;

procedure THeadMemberForm.SetMultiMode(aMultiMode: Boolean);
var vIndex :Integer;
begin
  inherited;
  //여러상품을 선택했을때는 수정할 수 있는 항목만 Enabled 시킨다
  if aMultiMode then
  begin
    for vIndex := 0 to ComponentCount-1 do
      if ( (TControl(Components[vIndex]).Parent = MemberPage) or (TControl(Components[vIndex]).Parent = DetailPage)
          or (TControl(Components[vIndex]).Parent = SmsGroupBox)) then
      begin
        if (Components[vIndex] is TcxCustomEdit) and (TControl(Components[vIndex]).Hint = '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := False
        else if (Components[vIndex] is TcxCustomEdit) and (TControl(Components[vIndex]).Hint <> '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := true;
        Application.ProcessMessages;
      end;


    isChanged := False;
    SmsGroupBox.Enabled               := true;
    ButtonToolBarSearchButton.Enabled := False;
    ButtonToolBarNewButton.Enabled    := False;
    ButtonToolBarDeleteButton.Enabled := False;
    ButtonToolBarCancelButton.Enabled := True;
    MemberNoCreateButton.Enabled      := False;
    PictureLoadButton.Enabled         := False;
  end
  else
  begin
    GridTableView.Controller.ClearSelection;
    for vIndex := 0 to ComponentCount-1 do
      if ( (TControl(Components[vIndex]).Parent = MemberPage) or (TControl(Components[vIndex]).Parent = DetailPage)
          or (TControl(Components[vIndex]).Parent = SmsGroupBox))
      and
        (Components[vIndex] is TcxCustomEdit) then
      begin
        TcxCustomEdit(Components[vIndex]).EditModified := False;
        TcxCustomEdit(Components[vIndex]).Enabled  := True;
        Application.ProcessMessages;
      end;

    if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
      DoGridLink;
    PictureLoadButton.Enabled         := True;
    isChanged := False;
  end;
end;

//------------------------------------------------------------------------------
// 조회
function THeadMemberForm.DoSearch: Boolean;
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
    1 : vWhere[1] := ' and DS_STATUS = ''0'' ';
    2 : vWhere[1] := ' and DS_STATUS = ''1'' ';
  end;

  if ConditionMemberClassComboBox.ItemIndex > 0 then
  begin
    vTemp := GetStrPointerData(ConditionMemberClassComboBox);
    if vTemp = 'not' then
      vWhere[2]  := ' and Ifnull(DS_MEMBER,'''') = '''' '
    else
      vWhere[2]  := Format(' and DS_MEMBER = ''%s'' ', [vTemp]);
  end;

  if ConditionPointCheckBox.Checked then
  begin
    if (Integer(ConditionFromPointEdit.EditingValue) <> 0) and (Integer(ConditionToPointEdit.EditingValue) <> 0) then
      vWhere[3] := Format(' and TOTAL_POINT Between %d and %d ',[Integer(ConditionFromPointEdit.EditingValue), Integer(ConditionToPointEdit.EditingValue)])
    else if Integer(ConditionFromPointEdit.EditingValue) <> 0 then
      vWhere[3] := Format(' and TOTAL_POINT >= %d ', [Integer(ConditionFromPointEdit.EditingValue)])
    else if Integer(ConditionToPointEdit.EditingValue) <> 0 then
      vWhere[3] := Format(' and TOTAL_POINT <= %d ', [Integer(ConditionToPointEdit.EditingValue)]);
  end;

  if (ConditionLastVisitDateEdit.CurrentDate > 0) then
    vWhere[4]  := Format(' and YMD_VISIT <= ''%s'' ', [DtoS(ConditionLastVisitDateEdit.CurrentDate)]);

  if GetStrPointerData(ConditionJoinStoreComboBox) <> '' then
    vWhere[5] := Format(' and CD_STORE_JOIN = ''%s'' ',[GetStrPointerData(ConditionJoinStoreComboBox)]);

  case ConditionSmsRadioGroup.ItemIndex of
    1 : vWhere[6] := 'and YN_NEWS = ''Y'' ';
    2 : vWhere[6] := 'and YN_NEWS = ''N'' ';
  end;

  if ConditionLastVisit1DateEdit.CurrentDate > 0 then
    vWhere[7]  := Format(' and YMD_VISIT >= ''%s'' ', [DtoS(ConditionLastVisit1DateEdit.CurrentDate)]);

  if AgreeMemberCheckBox.Checked then
    vWhere[8]  := ' and DATE(YMD_AGREE)) >= ADDDATE(NOW(), INTERVAL -2 YEAR) ';

  try
    OpenQuery('select CD_MEMBER, '
             +'       NM_MEMBER, '
             +'       DS_STATUS, '
             +'       NO_CARD, '
             +'       GetPhoneNo(AES_Decrypt(TEL_MOBILE, 71483)) as NO_TEL '
             +'  from MS_MEMBER '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and (CD_MEMBER =:P2 '
             +'      or NM_MEMBER like ConCat(''%'',:P2,''%'') '
             +'      or NO_JUMIN  like ConCat(''%'',:P2,''%'') '
             +'      or GetOnlyNumber(NO_CARD) like ConCat(''%'',:P2,''%'') '
             +'      or AES_Decrypt(TEL_MOBILE,71483) =:P2 '
             +'      or AES_Decrypt(TEL_HOME,71483)  =:P2 '
             +'      or AES_Decrypt(TEL_MOBILE_SHORT,71483) =:P2 '
             +'      or AES_Decrypt(TEL_HOME_SHORT,71483)   =:P2) '
             +vWhere[1]
             +vWhere[2]
             +vWhere[3]
             +vWhere[4]
             +vWhere[5]
             +vWhere[6]
             +vWhere[7]
             +vWhere[8]
             +' order by CD_MEMBER',
             [HeadStoreCode,
              StandardStore,
              ConditionToolBarEdit.Text]);
    GridTableView.DataController.RecordCount := 0;
    Result := DM.ReadQuery(Query, GridTableView);
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
procedure THeadMemberForm.DoGridLink;
var
  vStream    : TStream;
  vJPG       : TJPEGImage;
  vBlobData  : TBlobByteData;
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
           +'         a.CD_STORE_JOIN, '                                        //16
           +'         a.YMD_ISU, '                                              //17
           +'         a.REMARK, '                                               //18
           +'         a.DS_STATUS, '                                            //19
           +'         StoD(b.YMD_VISIT) as YMD_VISIT, '                         //20
           +'         b.CNT_VISIT, '                                            //21
           +'         b.AMT_SALE, '                                             //22
           +'         b.TOTAL_POINT as PNT_TOTAL, '                             //23
           +'         a.NO_CASHRCP, '                                           //24
           +'         a.IMG_MEMBER, '                                           //25
           +'         a.CD_AGE, '                                               //26
           +'         a.YMD_AGREE, '                                            //27
           +'         a.YMD_REJECT, '                                           //28
           +'         b.TOTAL_STAMP '                                           //29
           +'  from   MS_MEMBER as a inner join '
           +'        (select CD_MEMBER, '
           +'                Max(YMD_VISIT) as YMD_VISIT, '
           +'                Sum(CNT_VISIT) as CNT_VISIT, '
           +'                Sum(AMT_SALE)  as AMT_SALE, '
           +'                Sum(TOTAL_POINT)  as TOTAL_POINT, '
           +'                Sum(TOTAL_STAMP)  as TOTAL_STAMP '
           +'           from MS_MEMBER_ETC '
           +'          where CD_HEAD  =:P0 '
           +'          group by CD_MEMBER) as b on b.CD_MEMBER = a.CD_MEMBER'
           +' where   a.CD_HEAD   = :P0 '
           +'   and   a.CD_STORE  = :P1 '
           +'   and   a.CD_MEMBER = :P2',
            [HeadStoreCode,
             StandardStore,
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]]);
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
      JoinStoreComboBox.ItemIndex   := GetStrPointerIndex(JoinStoreComboBox, Query.Fields[16].AsString);
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
      AgeGroupComboBox.ItemIndex      := GetStrPointerIndex(AgeGroupComboBox, Query.Fields[26].AsString);
      if Query.Fields[27].AsString = EmptyStr then
        AgreeDateEdit.Text           := EmptyStr
      else
        AgreeDateEdit.Date           := StoD(Query.Fields[27].AsString);
      if Query.Fields[28].AsString = EmptyStr then
        RejectDateEdit.Text          := EmptyStr
      else
        RejectDateEdit.Date          := StoD(Query.Fields[28].AsString);
      StampCountEdit.Value           := Query.Fields[29].AsInteger;

      // 이미지
      PictureImage.Tag  := 0;
      if Query.FieldByName('IMG_MEMBER').AsString <> '' then
      begin
        vStream :=  Query.CreateBLOBStream(Query.FieldByName('IMG_MEMBER'), bmRead);
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
    end;
    MemberNoEdit.Properties.ReadOnly := true;
    MemberNoEdit.TabStop             := false;
    MemberNoEdit.Style.Color         := clrDisabled;
    MemberNoEdit.StyleFocused.Color  := clrDisabled;
  finally
    FinishQuery;
  end;
  SetHistory;
  if SaleGrid.Height > 0 then
    SelectSaleData;
end;
//------------------------------------------------------------------------------
// 신규
function THeadMemberForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    // 회원정보 탭으로 옮긴다
    MainPager.ActivePageIndex := MemberPage.PageIndex;
    PictureImage.Tag  := 0;

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

    JoinDateEdit.Date        := now;
    SMSAgreeCheckBox.Checked := true;
    PictureImage.Picture     := nil;
    PictureImage.Tag         := 0;
  finally
    isLoading := false;
  end;

  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function THeadMemberForm.DoDelete: Boolean;
var
  vResult: Boolean;
  vResultStr: String;
begin
  Result := false;

  // 회원 거래내역 조회
  OpenQuery('select exists(select *'
           +'                from  SL_SALE_H '
           +'               where  CD_HEAD   = :P0 '
           +'                 and  CD_MEMBER = :P1) + '
           +'       exists(select *'
           +'                from  SL_POINT '
           +'               where  CD_HEAD   = :P0 '
           +'                 and  CD_MEMBER = :P1) ',
            [HeadStoreCode,
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]], false);
  if Query.Fields[0].AsInteger > 0 then
  begin
    Query.Close;
    ErrBox(Format('%s(%s) 회원님은 거래 실적이 있어서 삭제할 수 없습니다.', [String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index]), String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index])]));
    Exit;
  end;

  Query.Close;

  // 회원 삭제
  Result := ExecQuery('delete  from MS_MEMBER '
                     +' where  CD_HEAD   = :P0 '
                     +'   and  CD_STORE  = :P1 '
                     +'   and  CD_MEMBER = :P2;',
                     [HeadStoreCode,
                      StandardStore,
                      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index]]);
end;
//------------------------------------------------------------------------------
// 저장
function THeadMemberForm.DoSave: Boolean;
var
  vIndex,   vParamIndex :Integer;
  vStream    : TMemoryStream;
  vJPG       : TJPEGImage;
  vSQLText, vCode :String;
  vResult     :Boolean;
  vData       :String;
  vParamsType,
  vResultStr  :String;
  vTemp       :String;
begin
  Result := False;
//  if isMultiMode then
//  begin
//    try
//      Screen.Cursor := crSQLWait;
//      vParamIndex := 2;
//      for vIndex := 0 to ComponentCount-1 do
//      begin
//        if ( (TControl(Components[vIndex]).Parent = TopPanel)
//          or (TControl(Components[vIndex]).Parent = CornerPanel)
//          or (TControl(Components[vIndex]).Parent = StockGroupBox)
//          or (TControl(Components[vIndex]).Parent = CenterPanel)
//          or (TControl(Components[vIndex]).Parent = KitchenPanel)
//          or (TControl(Components[vIndex]).Parent = StampGroupBox))
//          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))
//               or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint <> '') and TcxSpinEdit(Components[vIndex]).EditModified )
//               or ((Components[vIndex] is TcxCheckListBox ) and (TcxCheckListBox(Components[vIndex]).Hint <> '') and (TcxCheckListBox(Components[vIndex]).Tag = 1)) )  then
//        begin
//            if (Components[vIndex] is TcxCustomEdit) then
//              vSQLText    := vSQLText    + TcxCustomEdit(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)])
//            else if (Components[vIndex] is TcxSpinEdit) then
//              vSQLText    := vSQLText    + TcxSpinEdit(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)])
//            else if (Components[vIndex] is TcxCheckListBox) then
//              vSQLText    := vSQLText    + TcxCheckListBox(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)]);
//            Inc(vParamIndex);
//        end;
//      end;
//      vSQLText := 'update MS_MEMBER set '
//                 + vSQLText +' CD_SAWON_CHG = '''+UserCode+''', DT_CHANGE = Now() '
//                 +' where CD_HEAD =:P0 and CD_STORE =:P1';
//
//      vCode := EmptyStr;
//      for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
//        vCode := vCode + Format('''%s'',',[String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewMemberCode.Index])]);
//
//      vCode    := 'and CD_MEMBER in ('+LeftStr(vCode, Length(vCode)-1)+');';
//
//      vSQLText := vSQLText + vCode;
//
//      //Param에 값을 대입한다
//      vParamIndex := 2;                                   //
//      if KitchenCheckListBox.Tag = 1 then
//        vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[vKitchen]));
//
//      for vIndex := 0 to ComponentCount-1 do
//      begin
//        if ( (TControl(Components[vIndex]).Parent = TopPanel)
//          or (TControl(Components[vIndex]).Parent = CornerPanel)
//          or (TControl(Components[vIndex]).Parent = StockGroupBox)
//          or (TControl(Components[vIndex]).Parent = CenterPanel)
//          or (TControl(Components[vIndex]).Parent = KitchenPanel)
//          or (TControl(Components[vIndex]).Parent = StampGroupBox))
//          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))
//               or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint <> '') and TcxSpinEdit(Components[vIndex]).EditModified )
//               or ((Components[vIndex] is TcxCheckListBox ) and (TcxCheckListBox(Components[vIndex]).Hint <> '') and (TcxCheckListBox(Components[vIndex]).Tag = 1)) )  then
//        begin
//          if (Components[vIndex] is TcxCurrencyEdit) then
//            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), FormatFloat('#0.00',TcxCurrencyEdit(Components[vIndex]).Value))
//          else if (Components[vIndex] is TcxButtonEdit) then
//            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxButtonEdit(Components[vIndex]).Text]))
//          else if (Components[vIndex] is TcxMemo) then
//            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxMemo(Components[vIndex]).Text]))
//          else if (Components[vIndex] is TcxCheckBox) then
//            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[Ifthen(TcxCheckBox(Components[vIndex]).Checked,'Y','N')]))
//          else if (Components[vIndex] is TcxTextEdit) then
//            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxTextEdit(Components[vIndex]).Text]))
//          else if (Components[vIndex] is TcxComboBox) then
//            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[GetStrPointerData(TcxComboBox(Components[vIndex]))]))
//          else if (Components[vIndex] is TcxCheckListBox) then
//           vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[vKitchen]))
//          else if (Components[vIndex] is TcxSpinEdit) then
//           vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('%s',[TcxSpinEdit(Components[vIndex]).Text]));
//
//          Inc(vParamIndex);
//        end;
//      end;
//
//      vSQLText := Replace(vSQLText, ':P0', Format('''%s''',[HeadStoreCode]));
//      vSQLText := Replace(vSQLText, ':P1', Format('''%s''',[StandardStore]));
//      ExecQuery(vSQLText,[],true);
//
//      isChanged := false;
//      isMultiMode                := False;
//      DoGridLink;
//      Result := True;
//    finally
//      Screen.Cursor := crDefault;
//    end;
//    Exit;
//  end;


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
              StandardStore,
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
                StandardStore,
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
  Result := ExecQuery('insert into MS_MEMBER(CD_HEAD, '
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
                     +'                      CD_AGE, '
                     +'                      DT_CHANGE, '
                     +'                      YMD_AGREE, '
                     +'                      YMD_REJECT, '
                     +'                      CD_STORE_JOIN, '
                     +'                      CD_STORE_CHG, '
                     +'                      TEL_HOME_SHORT, '
                     +'                      TEL_MOBILE_SHORT, '
                     +'                      CHOSUNG, '
                     +'                      PRG_INSERT, '
                     +'                      PRG_CHANGE) '
                     +'             values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, AES_Encrypt(:P12,71483), AES_Encrypt(:P13,71483), :P14, :P15, :P16, :P17, :P18, :P19, :P20, :P21, '
                     +'                     :P22, :P23, :P24, :P25, Now(), :P26, :P27, :P28, :P1, AES_Encrypt(Right(:P12,4),71483),AES_Encrypt(Right(:P13,4),71483), GetChosung(:P3), ''B/O'', ''B/O'') '
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
                     +'                        CD_AGE       = :P25, '
                     +'                        DT_CHANGE    = Now(), '
                     +'                        YMD_AGREE    = :P26, '
                     +'                        YMD_REJECT   = :P27, '
                     +'                        CD_STORE_JOIN =:P28, '
                     +'                        CD_STORE_CHG  =:P1, '
                     +'                        TEL_HOME_SHORT   = AES_Encrypt(Right(:P12,4),71483), '
                     +'                        TEL_MOBILE_SHORT = AES_Encrypt(Right(:P13,4),71483),'
                     +'                        CHOSUNG      = GetChosung(:P3), '
                     +'                        PRG_CHANGE   = ''B/O'';',
                    [HeadStoreCode,
                     StandardStore,
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
                     GetStrPointerData(AgeGroupComboBox),
                     IfThen(AgreeDateEdit.Text  <> '', DtoS(AgreeDateEdit.CurrentDate), ''),
                     IfThen(RejectDateEdit.Text <> '', DtoS(RejectDateEdit.CurrentDate), ''),
                     GetStrPointerData(JoinStoreComboBox)],true);
  if Result then
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := MemberNoEdit.Text;
      NewData[1] := MemberNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewMemberName.Index] := MemberNameEdit.Text;

  // 이미지를 저장한다
  if PictureImage.Tag = 0 then Exit;
  
  try
    vStream := TMemoryStream.Create;
    vJPG    := TJPEGImage.Create;
    try
      if PictureImage.Picture.Graphic <> nil then
      begin
        vJPG.Assign(PictureImage.Picture.Graphic);
        vJPG.SaveToStream(vStream);
      end;
      ExecQuery('update MS_MEMBER '
               +'   set IMG_MEMBER = :P3 '
               +' where CD_HEAD    = :P0 '
               +'   and CD_STORE   = :P1 '
               +'   and CD_MEMBER  = :P2;',
               [HeadStoreCode,
                StandardStore,
                MemberNoEdit.Text,
                EncodeBase64(vStream.Memory, vStream.Size)]);
    finally
      vStream.Free;
      vJPG.Free;
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
