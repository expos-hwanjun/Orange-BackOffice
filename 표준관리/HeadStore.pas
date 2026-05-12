unit HeadStore;

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
  Vcl.StdCtrls, cxMemo, Math, StrUtils, AdvGlassButton, cxGroupBox,
  cxCurrencyEdit, AdvOfficePager, cxCheckGroup, dxSkinsCore, dxSkinBasic,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePagerStylers;

type
  THeadStoreForm = class(TInheritGridEditForm)
    GridTableViewStoreCode: TcxGridColumn;
    GridTableViewStoreName: TcxGridColumn;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    CouponNoLabel: TLabel;
    CouponNameLabel: TLabel;
    AddrLabel: TLabel;
    EMailLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    TelNoLabel: TLabel;
    MobileNoLabel: TLabel;
    MemberTypeLabel: TLabel;
    Label3: TLabel;
    RemarkLabel: TLabel;
    StatusLabel: TLabel;
    EnterDateLabel: TLabel;
    RetireDateLabel: TLabel;
    StoreCodeEdit: TcxTextEdit;
    StoreNameEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    EMailEdit: TcxTextEdit;
    CeoNameEdit: TcxTextEdit;
    BizNoEdit: TcxTextEdit;
    OfficeTelEdit: TcxTextEdit;
    MobileTelEdit: TcxTextEdit;
    LocalComboBox: TcxComboBox;
    SaleZoneComboBox: TcxComboBox;
    RemarkMemo: TcxMemo;
    StatusComboBox: TcxComboBox;
    ContractDateEdit: TcxDateEdit;
    RetireDateEdit: TcxDateEdit;
    SmsUserGroupBox: TcxGroupBox;
    AppIDLabel: TLabel;
    AppPWDLabel: TLabel;
    Label48: TLabel;
    AppIDEdit: TcxTextEdit;
    AppPWDEdit: TcxTextEdit;
    AppPWDConfirmEdit: TcxTextEdit;
    AppIDDupCheckButton: TAdvGlowButton;
    AppUserSaveButton: TAdvGlowButton;
    Label11: TLabel;
    OrderLimitAmtEdit: TcxCurrencyEdit;
    Label4: TLabel;
    OrderCreditAmtEdit: TcxCurrencyEdit;
    Label5: TLabel;
    OrderLimitCodeComboBox: TcxComboBox;
    GridTableViewSatus: TcxGridColumn;
    procedure FormShow(Sender: TObject);
    procedure AppIDDupCheckButtonClick(Sender: TObject);
    procedure AppUserSaveButtonClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    procedure SetRemainAmt;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoSave: Boolean; override;                        // 저장
  end;
var
  HeadStoreForm: THeadStoreForm;

implementation
uses Common, DBModule, UnitZipPopup, Help;

{$R *.dfm}

{ THeadStoreForm }
procedure THeadStoreForm.FormShow(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  try
    OpenQuery('select CD_KIND, '
             +'       CD_CODE, '
             +'       NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORe =:P1 '
             +'   and CD_KIND in (''01'',''03'') '
             +'   and DS_STATUS = ''0'' '
             +' order by CD_KIND, CD_CODE ',
             [HeadStoreCode,
              StandardStore]);

    LocalComboBox.Properties.Items.Clear;
    SaleZoneComboBox.Properties.Items.Clear;
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[1].AsString;
      if Query.Fields[0].AsString = '01' then
        LocalComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode))
      else
        SaleZoneComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    Query.Close;
  end;

  try
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORe =:P1 '
             +'   and CD_KIND = ''06'' '
             +'   and DS_STATUS = ''0'' '
             +' order by CD_CODE ',
             [HeadStoreCode,
              StandardStore]);

    OrderLimitCodeComboBox.Properties.Items.Clear;
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      OrderLimitCodeComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  isChanged := false;
end;


procedure THeadStoreForm.GridTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  inherited;
  if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color  := clHighlightText;
  end;
end;

procedure THeadStoreForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewSatus.Index] = '해지' then
    AStyle := StyleFontRed;

end;

procedure THeadStoreForm.SetRemainAmt;
begin
  OpenQuery('select  Sum(AMT_BASE + AMT_ORDER + AMT_SALE - AMT_PAY) as AMT_REMAIN '
           +'  from  (select  AMT_BASE, '
           +'                 0 as AMT_ORDER, '
           +'                 0 as AMT_SALE, '
           +'                 0 as AMT_PAY '
           +'          from   SL_BOOKS_MONTH '
           +'         where   CD_HEAD  = :P0 '
           +'           and   CD_STORE = :P1 '
           +'           and   CD_CLOSE = :P3 '
           +'           and   CD_CODE  = :P2 '
           +'           and   YM_CLOSE = Date_Format(Now(), ''%Y%m'') '
           +'        union all '
           +'        select   0 as AMT_BASE, '
           +'                 Sum(AMT_ORDER) as AMT_SALE, '
           +'                 0 as AMT_SALE, '
           +'                 0 as AMT_PAY '
           +'          from   OL_ORDER_H '
           +'         where   CD_HEAD   =:P0 '
           +'           and   CD_STORE  =:P3 '
           +'           and   DS_STATUS =''O'' '
           +'        union all '
           +'        select   0 as AMT_BASE, '
           +'                 0 as AMT_ORDER, '
           +'                 Sum(AMT_SALE) as AMT_SALE, '
           +'                 0 as AMT_PAY '
           +'          from   OL_SALE_H '
           +'         where   CD_HEAD   =:P0 '
           +'           and   CD_STORE  =:P3 '
           +'           and   YMD_SALE >= Date_Format(Now(), ''%Y%m01'') '
           +'        union all '
           +'        select   0 as AMT_BASE, '
           +'                 0 as AMT_ORDER, '
           +'                 0 as AMT_SALE, '
           +'                 Sum(AMT_OUT+AMT_DC) as AMT_PAY '
           +'          from   SL_ACCT '
           +'         where   CD_HEAD  =:P0 '
           +'           and   CD_STORE =:P1 '
           +'           and   CD_TRDPL =:P3 '
           +'           and   CD_ACCT ='''+CreditOut+''''
           +'           and   YMD_OCCUR >= Date_Format(Now(), ''%Y%m01'') '
           +'        ) as b ',
           [HeadStoreCode,
            StandardStore,
            varOrderClose,
            StoreCodeEdit.Text]);
  if not Query.Eof then
    OrderCreditAmtEdit.Value := Query.Fields[0].AsInteger
  else
    OrderCreditAmtEdit.Value := 0;

  Query.Close;

end;

procedure THeadStoreForm.AppIDDupCheckButtonClick(Sender: TObject);
begin
  inherited;

  if AppIDDupCheckButton.Caption = '중복체크' then
  begin
    if Length(AppIDEdit.Text) < 5 then
    begin
      MsgBox('최소 5자이상이어야 합니다');
      Exit;
    end;

    try
      OpenQuery('select APP_ID '
               +'  from MS_APP_USER '
               +' where APP_ID   = :P0 ',
               [AppIDEdit.Text],false,jsonSMSDBURL);
      if not Query.Eof then
      begin
        MsgBox('사용 중인 아이디입니다');
        Exit;
      end
      else
      begin
        AppIDEdit.EditModified := false;
        MsgBox('사용 가능한 아이디입니다');
        AppPWDEdit.SetFocus;
      end;
    finally
      FinishQuery;
    end;
  end
  else if AskBox('아이디를 삭제하시겠습니까?') then
  begin
    if ExecQuery('delete'
                +'  from MS_APP_USER '
                +' where APP_ID   = :P0 ',
                [AppIDEdit.Text],true,jsonSMSDBURL) then
    begin
      AppIDEdit.Enabled      := true;
      AppIDEdit.Text         := StoreCode;
      AppPWDEdit.Clear;
      AppPWDConfirmEdit.Clear;
      AppIDDupCheckButton.Caption := '중복체크';

      AppIDEdit.EditModified     := false;
      AppPWDEdit.EditModified    := false;
    end;
  end;
end;

procedure THeadStoreForm.AppUserSaveButtonClick(Sender: TObject);
begin
  inherited;
  if AppIDEdit.EditModified then
  begin
    MsgBox('아이디 중복체크를 해야합니다');
    AppIDEdit.SetFocus;
    Exit;
  end;
  if AppPWDEdit.EditModified and (AppPWDEdit.Text = '') then
  begin
    MsgBox('비밀번호를 입력해야합니다');
    AppPWDEdit.SetFocus;
    Exit;
  end;
  if AppPWDEdit.EditModified and (AppPWDEdit.Text <> AppPWDConfirmEdit.Text) then
  begin
    MsgBox('비밀번호가 일치하지 않습니다');
    AppPWDConfirmEdit.SetFocus;
    Exit;
  end;

  if ExecQuery('insert into MS_APP_USER(APP_ID, '
              +'                        APP_PWD, '
              +'                        NM_USER, '
              +'                        CD_CUSTOMER, '
              +'                        CD_HEAD, '
              +'                        BIZ_NO, '
              +'                        CD_SAWON_CHG, '
              +'                        DT_INSERT, '
              +'                        DT_CHANGE) '
              +'                Values(:P0, '
              +'                        AES_Encrypt(:P1,71483), '
              +'                       :P2, '
              +'                       :P3, '
              +'                       :P4, '
              +'                       :P5, '
              +'                       :P6, '
              +'                       NOW(), '
              +'                       NOW()) '
              +'ON DUPLICATE KEY UPDATE APP_PWD      =AES_Encrypt(:P1,71483), '
              +'                        NM_USER      =:P2, '
              +'                        CD_CUSTOMER  =:P3, '
              +'                        CD_HEAD      =:P4, '
              +'                        BIZ_NO       =:P5, '
              +'                        CD_SAWON_CHG =:P6, '
              +'                        DT_CHANGE    =NOW() ',
              [AppIDEdit.Text,
               AppPWDEdit.Text,
               StoreNameEdit.Text,
               StoreCodeEdit.Text,
               HeadStoreCode,
               GetOnlyNumber(BizNoEdit.Text),
               UserCode],true,jsonSMSDBURL) then
  begin
    AppIDDupCheckButton.Caption := '삭제';
    AppIDEdit.Enabled           := false;
    MsgBox('저장되었습니다');
  end;
end;

procedure THeadStoreForm.DoGridLink;
var vjsonDBURL :String;
begin
  inherited;
  try
    OpenQuery('select a.CD_STORE, '
             +'       a.NM_STORE, '
             +'       a.CD_LOCAL, '
             +'       a.CD_SALEZONE, '
             +'       a.NM_BOSS, '
             +'       a.NO_BIZER, '
             +'       a.ADDR1, '
             +'       a.ADDR2, '
             +'       a.TEL_MOBILE, '
             +'       a.TEL_OFFICE, '
             +'       a.EMAIL, '
             +'       a.REMARK, '
             +'       a.YMD_CONTRACT, '
             +'       a.YMD_CONTRACT_CANCEL, '
             +'       a.YN_USE, '
             +'       Ifnull(b.AMT_ORDER_LIMIT,0) as AMT_ORDER_LIMIT, '
             +'       Ifnull(b.CD_ORDER_LIMIT,'''') as CD_ORDER_LIMIT '
             +'  from MS_STORE as a left outer join '
             +'       MS_STORE_ETC as b on b.CD_HEAD  = a.CD_HEAD '
             +'                        and b.CD_STORE = a.CD_STORE '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 ',
             [HeadStoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index]]);
    if not Query.Eof then
    begin
      StoreCodeEdit.Text         := Query.FieldByName('CD_STORE').AsString;
      StoreNameEdit.Text         := Query.FieldByName('NM_STORE').AsString;
      LocalComboBox.ItemIndex    := GetStrPointerIndex(LocalComboBox, Query.FieldByName('CD_LOCAL').AsString);
      SaleZoneComboBox.ItemIndex := GetStrPointerIndex(SaleZoneComboBox, Query.FieldByName('CD_SALEZONE').AsString);
      CeoNameEdit.Text           := Query.FieldByName('NM_BOSS').AsString;
      BizNoEdit.Text             := Query.FieldByName('NO_BIZER').AsString;
      Addr1Edit.Text             := Query.FieldByName('ADDR1').AsString;
      Addr2Edit.Text             := Query.FieldByName('ADDR2').AsString;
      MobileTelEdit.Text         := GetPhoneNo(Query.FieldByName('TEL_MOBILE').AsString);
      OfficeTelEdit.Text         := GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString);
      EMailEdit.Text             := Query.FieldByName('EMAIL').AsString;
      RemarkMemo.Text            := Query.FieldByName('REMARK').AsString;
      ContractDateEdit.Date      := StoD(Query.FieldByName('YMD_CONTRACT').AsString);
      RetireDateEdit.Date        := StoD(Query.FieldByName('YMD_CONTRACT_CANCEL').AsString);
      StatusComboBox.ItemIndex   := Ifthen(Query.FieldByName('YN_USE').AsString = 'Y',0,1);
      OrderLimitAmtEdit.Value    := Query.FieldByName('AMT_ORDER_LIMIT').AsCurrency;
      OrderLimitCodeComboBox.ItemIndex := GetStrPointerIndex(OrderLimitCodeComboBox,   Query.FieldByName('CD_ORDER_LIMIT').AsString);

      RetireDateEdit.Visible     := StatusComboBox.ItemIndex = 1;
      RetireDateLabel.Visible    := RetireDateEdit.Visible;
      if not RetireDateEdit.Visible then
        RetireDateEdit.Date          := 0;
    end;
  finally
    Query.Close;
  end;

  SetRemainAmt;

  StoreNameEdit.Enabled := StoreCodeEdit.Text = StandardStore;
  CeoNameEdit.Enabled   := StoreCodeEdit.Text = StandardStore;
  BizNoEdit.Enabled     := StoreCodeEdit.Text = StandardStore;
  ZipCodeEdit.Enabled   := StoreCodeEdit.Text = StandardStore;
  Addr2Edit.Enabled     := StoreCodeEdit.Text = StandardStore;
  MobileTelEdit.Enabled := StoreCodeEdit.Text = StandardStore;
  OfficeTelEdit.Enabled := StoreCodeEdit.Text = StandardStore;

  try
    OpenQuery('select APP_ID, '
             +'       Cast(AES_Decrypt(APP_PWD, 71483) as Char) as APP_PWD '
             +'  from MS_APP_USER '
             +' where CD_CUSTOMER = :P0 ',
             [Ifthen(StoreCodeEdit.Text = StandardStore, HeadStoreCode, StoreCodeEdit.Text)],false,jsonSMSDBURL);
    if not Query.Eof then
    begin
      AppIDEdit.Text             := Query.FieldByName('APP_ID').AsString;
      AppIDEdit.Enabled          := false;
      AppPWDEdit.Text            := Query.FieldByName('APP_PWD').AsString;
      AppPWDConfirmEdit.Text     := Query.FieldByName('APP_PWD').AsString;
      AppIDDupCheckButton.Caption := '삭제';

      AppIDEdit.EditModified     := false;
      AppPWDEdit.EditModified    := false;
    end
    else
    begin
      AppIDEdit.Text         := Ifthen(StoreCodeEdit.Text = StandardStore, HeadStoreCode, StoreCodeEdit.Text);
      AppIDEdit.Enabled      := true;
      AppPWDEdit.Clear;
      AppPWDConfirmEdit.Clear;
      AppIDEdit.EditModified := true;
      AppIDDupCheckButton.Caption := '중복체크';
    end;
  finally
    FinishQuery;
  end;
end;

function THeadStoreForm.DoSave: Boolean;
begin
  ExecQuery('update MS_STORE_ETC '
           +'   set AMT_ORDER_LIMIT = :P2, '
           +'       CD_ORDER_LIMIT  = :P3 '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1;',
           [HeadStoreCode,
            StoreCodeEdit.Text,
            OrderLimitAmtEdit.Value,
            GetStrPointerData(OrderLimitCodeComboBox)],false);

  Result := ExecQuery('update MS_STORE '
                     +'   set NM_STORE     =:P2, '
                     +'       NM_BOSS      =:P3, '
                     +'       NO_BIZER     =:P4, '
                     +'       ADDR2        =:P5, '
                     +'       TEL_MOBILE   =:P6, '
                     +'       TEL_OFFICE   =:P7, '
                     +'       EMAIL        =:P8, '
                     +'       CD_LOCAL     =:P9, '
                     +'       CD_SALEZONE  =:P10, '
                     +'       REMARK       =:P11, '
                     +'       YMD_CONTRACT =:P12 '
                     +' where CD_HEAD  =:P0 '
                     +'   and CD_STORE =:P1;',
                     [HeadStoreCode,
                      StoreCodeEdit.Text,
                      StoreNameEdit.Text,
                      CeoNameEdit.Text,
                      GetOnlyNumber(BizNoEdit.Text),
                      Addr2Edit.Text,
                      GetOnlyNumber(MobileTelEdit.Text),
                      GetOnlyNumber(OfficeTelEdit.Text),
                      EMailEdit.Text,
                      GetStrPointerData(LocalComboBox),
                      GetStrPointerData(SaleZoneComboBox),
                      RemarkMemo.Text,
                      DtoS(ContractDateEdit.Date)],true);
end;

function THeadStoreForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := ' and YN_USE = ''Y'' ';
    1 : vWhere := ' and YN_USE = ''N'' ';
    2 : vWhere := '';
  end;
  OpenQuery('select CD_STORE, '
           +'       NM_STORE, '
           +'       case when YN_USE = ''Y'' then ''정상'' else ''해지'' end DS_STATUS '
           +'  from MS_STORE  '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE <> :P1 '
           +'   and (CD_STORE  = :P2 or NM_STORE like ConCat(''%'',:P2,''%'')) '
           +vWhere
           +' order by CD_STORE ',
           [HeadStoreCode,
            StandardStore,
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;


end.
