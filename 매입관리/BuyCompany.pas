unit BuyCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter, Math,
  cxData, cxDataStorage, cxEdit, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxTextEdit, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, ExtCtrls,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvSplitter, cxMemo, StdCtrls, cxCheckBox, cxCurrencyEdit,
  StrUtils, AdvToolBarStylers, AdvGlowButton, cxLookAndFeels,
  cxLookAndFeelPainters, DBAccess, Vcl.Menus, cxButtons, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, AdvSmoothButton, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TBuyCompanyForm = class(TInheritGridEditForm)
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewDsStatus: TcxGridColumn;
    TopPanel: TPanel;
    TaxLabel: TLabel;
    CompanyCodeLabel: TLabel;
    CompanyNameLabel: TLabel;
    TaxComboBox: TcxComboBox;
    CompanyCodeEdit: TcxTextEdit;
    CompanyNameEdit: TcxTextEdit;
    ClientPanel: TPanel;
    CEONameLabel: TLabel;
    IDNoLabel: TLabel;
    JongmokLabel: TLabel;
    UptaeLabel: TLabel;
    TelNoLabel: TLabel;
    FaxNoLabel: TLabel;
    AddrLabel: TLabel;
    ContactTelNoLabel: TLabel;
    EMailLabel: TLabel;
    ContactNameLabel: TLabel;
    OrderCreditAmtLabel: TLabel;
    CEONameEdit: TcxTextEdit;
    IDNoEdit: TcxMaskEdit;
    JongmokEdit: TcxTextEdit;
    UptaeEdit: TcxTextEdit;
    TelNoEdit: TcxTextEdit;
    FaxNoEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    MobileTelNoEdit: TcxTextEdit;
    EMailEdit: TcxTextEdit;
    ContactNameEdit: TcxTextEdit;
    OrderCreditAmtEdit: TcxCurrencyEdit;
    CornerPanel: TPanel;
    VanGroupBox: TcxGroupBox;
    VanPasswordLabel: TLabel;
    VanSerialNoLabel: TLabel;
    Label1: TLabel;
    VanPasswordEdit: TcxTextEdit;
    VanSerialNoEdit: TcxTextEdit;
    VanTidEdit: TcxTextEdit;
    VanRateGroupBox: TcxGroupBox;
    RentAddFeeCashRateLabel: TLabel;
    RentAddFeeCardRateLabel: TLabel;
    CashRateEdit: TcxCurrencyEdit;
    CardRateEdit: TcxCurrencyEdit;
    BottomPanel: TPanel;
    UseYNComboBox: TcxComboBox;
    RemarkMemo: TcxMemo;
    UseYNLabel: TLabel;
    RemarkLabel: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DefaultRateEdit: TcxCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    CashrcpRateEdit: TcxCurrencyEdit;
    BuyGrid: TcxGrid;
    SaleGridTableView: TcxGridTableView;
    SaleGridTableViewSaleDate: TcxGridColumn;
    SaleGridTableViewSaleType: TcxGridColumn;
    SaleGridTableViewSaleAmt: TcxGridColumn;
    SaleGridTableViewDCAmt: TcxGridColumn;
    SaleGridTableViewSavePoint: TcxGridColumn;
    SaleGridTableViewUsePoint: TcxGridColumn;
    SaleGridTableViewDsAcct: TcxGridColumn;
    SaleGridTableViewRcpNo: TcxGridColumn;
    BuyGridTableView: TcxGridTableView;
    BuyGridTableViewBuyDate: TcxGridColumn;
    BuyGridTableViewBuyNo: TcxGridColumn;
    BuyGridTableViewColumn3: TcxGridColumn;
    BuyGridTableViewColumn4: TcxGridColumn;
    BuyGridTableViewColumn5: TcxGridColumn;
    BuyGridTableViewColumn7: TcxGridColumn;
    BuyGridLevel: TcxGridLevel;
    AdvSplitter: TAdvSplitter;
    CompanyCodeCreateButton: TAdvGlowButton;

    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure CompanyCodeCreateButtonClick(Sender: TObject);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure BuyGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ReceiptTitleGroupBoxClick(Sender: TObject);
  private
    procedure GetCompanyCode;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    procedure SetMultiMode(aMultiMode: Boolean); override;
  end;

var
  BuyCompanyForm: TBuyCompanyForm;



implementation

uses
  Common, DBModule, UnitZipPopup, ProxyCheck, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyCompanyForm.FormCreate(Sender: TObject);
var vCodeData : PStrPointer;
begin
  inherited;
  //코너일때
  if Tag = 2 then
  begin
    CornerPanel.Visible := true;
    TaxLabel.Visible    := false;
    TaxComboBox.Visible := false;
    OrderCreditAmtLabel.Visible := false;
    OrderCreditAmtEdit.Visible  := false;
    TaxComboBox.Enabled := false;
    TopPanel.Height     := 69;
    AdvSplitter.Visible := false;
    BuyGrid.Visible     := false;
  end;

  TaxComboBox.Properties.Items.Clear;
  New(vCodeData);
  vCodeData^.Data := '0';
  TaxComboBox.Properties.Items.AddObject('면세', TObject(vCodeData));

  New(vCodeData);
  vCodeData^.Data := '1';
  TaxComboBox.Properties.Items.AddObject('과세(포함)', TObject(vCodeData));

  New(vCodeData);
  vCodeData^.Data := '2';
  TaxComboBox.Properties.Items.AddObject('과세(별도)', TObject(vCodeData));

  ConditionToolBarComboBox.Properties.Items.Clear;

  GridTableView.OptionsSelection.MultiSelect := True;
  isChanged := False;
end;

procedure TBuyCompanyForm.FormShow(Sender: TObject);
const POS_VAN : array [0..12] of String = ('KOCES','DAOU','NICE','KICC','KIS','KSNET','KCP','FDK','JTNET','KFTC','SMARTRO','KOVAN','SPC');
var vCode : PStrPointer;
begin
  inherited;
  if (Tag = 2) then
  begin
    // 공통코드에서 지정한 VAN 에 따라 시리얼, 비밀번호 입력창을 활성화 한다
    OpenQuery('select   NM_CODE5 as VAN_CODE '
             +'from     MS_CODE '
             +'where    CD_HEAD  = :P0 '
             +'  and    CD_STORE = :P1 '
             +'  and    CD_KIND  = ''01'' '
             +'  and    CD_CODE  = ''001''',
              [HeadStoreCode,
               StoreCode]);
    try
      if (Query.Eof) or (Query.Fields[0].AsString = EmptyStr) then
      begin
        ErrBox('VAN 등록이 되어 있지 않습니다.'#13'[코드관리] - [공통 코드 관리] 프로그램에서 먼저 등록하십시오.');
        VanTidEdit.Enabled      := false;
        VanSerialNoEdit.Enabled := false;
        VanPasswordEdit.Enabled := false;
      end
      else
      begin
        VanGroupBox.Caption := POS_VAN[StoI(Query.Fields[0].AsString)]+' 정보';
        case StoI(Query.Fields[0].AsString) of
          0 :      // KOCES
            begin
              VanSerialNoEdit.Enabled         := True;
              VanTIDEdit.Properties.MaxLength := 10;
            end;
          4 :      // KIS
            begin
              VanSerialNoLabel.Caption := '일련번호';
              VanSerialNoEdit.Enabled  := true;
              VanPasswordLabel.Caption := '비밀번호';
              VanPasswordEdit.Enabled  := True;
            end;
          9 :      // 금융결제원
            VanPasswordEdit.Enabled := True;
        end;
      end;
    finally
      FinishQuery;
    end;
  end
end;

procedure TBuyCompanyForm.GetCompanyCode;
begin
  OpenQuery('select   Max(CD_TRDPL) as CODE '
           +'from     MS_TRD '
           +'where    CD_HEAD  =:P0 '
           +'  and    CD_STORE =:P1 '
           +'  and    Left(CD_TRDPL,1) = :P2 ',
            [HeadStoreCode,
             StoreCode,
             IntToStr(Tag)]);
  try
    if (Query.Eof) or (Query.Fields[0].AsString = EmptyStr) then
      CompanyCodeEdit.Text := IntToStr(Tag)+'00001'
    else
      CompanyCodeEdit.Text := FormatFloat('000000',StoI(Query.Fields[0].AsString)+1);
    if MainPanel.Enabled and CompanyNameEdit.Enabled then
      CompanyNameEdit.SetFocus;
  finally
    FinishQuery;
  end;
end;

procedure TBuyCompanyForm.GridTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var vMultiMode :Boolean;
begin
  inherited;
  vMultiMode := GridTableView.Controller.SelectedRowCount > 0;

  if isMultiMode <> vMultiMode then
    isMultiMode := vMultiMode;
end;

procedure TBuyCompanyForm.GridTableViewCustomDrawCell(
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

procedure TBuyCompanyForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridTableViewDsStatus.Index] = '1' then
    AStyle := StyleFontRed;
end;


procedure TBuyCompanyForm.ReceiptTitleGroupBoxClick(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TBuyCompanyForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if  (Sender is TcxCustomEdit) then
    TcxCustomEdit(Sender).EditModified := true;
  // 우편번호를 수정할 때 주소를 지운다
  if (Sender = ZipCodeEdit) and (Addr1Edit.Text <> EmptyStr) then
    Addr1Edit.Clear;
end;
//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TBuyCompanyForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  // 업체코드를 짧게 입력하면 앞을 0으로 채운다
  if (Sender = CompanyCodeEdit) and (not CompanyCodeEdit.Properties.ReadOnly) and
     (Length(DisplayValue) < CompanyCodeEdit.Properties.MaxLength) then
  begin
    DisplayValue := LPad(CompanyCodeEdit.Text, CompanyCodeEdit.Properties.MaxLength, '0');
    if Copy(DisplayValue, 1, 1) = '0' then
      DisplayValue := IntToStr(Tag)+Copy(DisplayValue, 2, CompanyCodeEdit.Properties.MaxLength-1);
  end

  // 사업자번호를 검증한다
  else if Sender = IDNoEdit then
  begin
    if not CheckIDNo(DisplayValue) then
      ShowMsg(IDNoLabel.Caption+msgMustInput, true);
//    else
//      ShowMsg;
  end

  // 전화번호를 체계에 맞게 고친다
  else if (Sender = TelNoEdit) or (Sender = FaxNoEdit) or (Sender = MobileTelNoEdit) then
    DisplayValue := GetPhoneNo(DisplayValue);
end;
//------------------------------------------------------------------------------
// 업체코드 생성 버튼
procedure TBuyCompanyForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  isMultiMode := False;
end;

procedure TBuyCompanyForm.BuyGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FormParam[0] := BuyGridTableView.DataController.Values[BuyGridTableView.DataController.GetFocusedRecordIndex, BuyGridTableViewBuyDate.Index]+
                  BuyGridTableView.DataController.Values[BuyGridTableView.DataController.GetFocusedRecordIndex, BuyGridTableViewBuyNo.Index];
  ExtremeMainForm.RunProgram('BuyBuy');
end;

procedure TBuyCompanyForm.CompanyCodeCreateButtonClick(Sender: TObject);
begin
  inherited;
  GetCompanyCode;
end;
procedure TBuyCompanyForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 우편번호 버튼
procedure TBuyCompanyForm.ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
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
procedure TBuyCompanyForm.SetMultiMode(aMultiMode: Boolean);
var vIndex :Integer;
begin
  inherited;
  //여러상품을 선택했을때는 수정할 수 있는 항목만 Enabled 시킨다
  if aMultiMode then
  begin
    for vIndex := 0 to ComponentCount-1 do
      if ( (TWinControl(Components[vIndex]).Parent = TopPanel)
        or (TWinControl(Components[vIndex]).Parent = ClientPanel)
        or (TWinControl(Components[vIndex]).Parent = VanRateGroupBox)
        or (TWinControl(Components[vIndex]).Parent = VanGroupBox)
        or (TWinControl(Components[vIndex]).Parent = BottomPanel) ) then
      begin
        if (Components[vIndex] is TcxCustomEdit) and (TControl(Components[vIndex]).Hint = '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := False
        else if (Components[vIndex] is TcxCustomEdit) and (TControl(Components[vIndex]).Hint <> '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := true;
        Application.ProcessMessages;
      end;


    isChanged := False;
    ButtonToolBarSearchButton.Enabled := False;
    ButtonToolBarNewButton.Enabled    := False;
    ButtonToolBarDeleteButton.Enabled := False;
    ButtonToolBarCancelButton.Enabled := True;
  end
  else
  begin
    GridTableView.Controller.ClearSelection;
    for vIndex := 0 to ComponentCount-1 do
      if ( (TWinControl(Components[vIndex]).Parent = TopPanel) or (TWinControl(Components[vIndex]).Parent = ClientPanel) or (TWinControl(Components[vIndex]).Parent = VanRateGroupBox) or (TWinControl(Components[vIndex]).Parent = VanGroupBox) or (TWinControl(Components[vIndex]).Parent = BottomPanel) )
      and
        (Components[vIndex] is TcxCustomEdit) then
      begin
        TcxCustomEdit(Components[vIndex]).EditModified := False;
        TcxCustomEdit(Components[vIndex]).Enabled  := True;
        Application.ProcessMessages;
      end;

    if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
      DoGridLink;
    isChanged := False;
  end;
end;


//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TBuyCompanyForm.DoSearch: Boolean;
var vCondition :String;
begin
  Result := false;
  case Tag of
    1 : vCondition := ' and DS_TRDPL = ''B'' ';
    2 : vCondition := ' and DS_TRDPL = ''C'' ';
    3 : vCondition := ' and DS_TRDPL = ''L'' ';
  end;

  try
    OpenQuery('select   CD_TRDPL, '
             +'         NM_TRDPL, '
             +'         DS_STATUS '
             +'from     MS_TRD '
             +'where    CD_HEAD  =:P0 '
             +'  and    CD_STORE =:P1 '
             +'  and   (CD_TRDPL =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'') ) '
             +vCondition
             +'order by CD_STORE, CD_TRDPL',
              [HeadStoreCode,
               StoreCode,
               ConditionToolBarEdit.Text]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TBuyCompanyForm.DoGridLink;
begin
  inherited;
  if isMultiMode then Exit;

  OpenQuery('select   NM_TRDPL, '           //  0
           +'         DS_TAX, '             //  1
           +'         NO_BIZER, '           //  2
           +'         NM_BOSS, '            //  3
           +'         NM_UPTAE, '           //  4
           +'         NM_JONGMOK, '         //  5
           +'         TEL_OFFICE, '         //  6
           +'         TEL_FAX, '            //  7
           +'         TEL_MOBILE, '         //  8
           +'         NO_POST, '            //  9
           +'         ADDR1, '              // 10
           +'         ADDR2, '              // 11
           +'         NM_EMAIL, '           // 12
           +'         NM_DAMDANG, '         // 13
           +'         REMARK, '             // 14
           +'         DS_STATUS, '          // 15
           +'         RATE_FEE, '           // 16
           +'         RATE_FEE_CASH, '      // 17
           +'         RATE_FEE_CARD, '      // 18
           +'         RATE_FEE_CASHRCP, '   // 19
           +'         VAN_TID, '            // 20
           +'         VAN_SERIALNO, '       // 21
           +'         VAN_PWD '            // 22
           +'from     MS_TRD '
           +'where    CD_HEAD  =:P0 '
           +'  and    CD_STORE =:P1 '
           +'  and    CD_TRDPL =:P2',
            [HeadStoreCode,
             StoreCode,
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index]]);
  try
    if not Query.Eof then
    begin
      CompanyCodeEdit.Text                  := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index];
      CompanyNameEdit.Text                  := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index];
      TaxComboBox.ItemIndex                 := StrToIntDef(Query.Fields[1].AsString, 1);
      CEONameEdit.Text                      := Query.Fields[ 3].AsString;
      IDNoEdit.Text                         := Query.Fields[ 2].AsString;
      UptaeEdit.Text                        := Query.Fields[ 4].AsString;
      JongmokEdit.Text                      := Query.Fields[ 5].AsString;
      TelNoEdit.Text                        := GetPhoneNo(Query.Fields[ 6].AsString);
      FaxNoEdit.Text                        := GetPhoneNo(Query.Fields[ 7].AsString);
      MobileTelNoEdit.Text                  := GetPhoneNo(Query.Fields[ 8].AsString);
      ZipCodeEdit.Text                      := Query.Fields[9].AsString;
      Addr1Edit.Text                        := Query.Fields[10].AsString;
      Addr2Edit.Text                        := Query.Fields[11].AsString;
      EMailEdit.Text                        := Query.Fields[12].AsString;
      ContactNameEdit.Text                  := Query.Fields[13].AsString;
      RemarkMemo.Text                       := Query.Fields[14].AsString;
      UseYNComboBox.ItemIndex               := StrToIntDef(Query.Fields[15].AsString, 0);
      DefaultRateEdit.Value                 := Query.Fields[16].AsCurrency;
      CashRateEdit.Value                    := Query.Fields[17].AsCurrency;
      CardRateEdit.Value                    := Query.Fields[18].AsCurrency;
      CashRcpRateEdit.Value                 := Query.Fields[19].AsCurrency;
      VanTidEdit.Text                       := Query.Fields[20].AsString;
      VanSerialNoEdit.Text                  := Query.Fields[21].AsString;
      VanPasswordEdit.Text                  := Query.Fields[22].AsString;
    end;
    CompanyCodeEdit.Properties.ReadOnly     := true;
    CompanyCodeEdit.TabStop                 := false;
    CompanyCodeEdit.Style.Color             := clrDisabled;
    CompanyCodeEdit.StyleFocused.Color      := clrDisabled;
    CompanyCodeCreateButton.Enabled         := false;
  finally
    FinishQuery;
    isChanged := false;
  end;

  // 매입처면 미지급액을 조회해 보여준다
  if Tag = 1 then
  begin
    OpenQuery('select   Sum(AMT_BASE + AMT_BUY - AMT_PAY) as AMT_REMAIN '
             +'from    (select   AMT_BASE, '
             +'                  0 as AMT_BUY, '
             +'                  0 as AMT_PAY '
             +'         from     SL_BOOKS_MONTH '
             +'         where    CD_HEAD  =:P0 '
             +'           and    CD_STORE =:P1 '
             +'           and    CD_CLOSE = ''10'' '
             +'           and    CD_CODE  =:P2 '
             +'           and    YM_CLOSE = Date_Format(Now(), ''%Y%m'') '
             +'         union all '
             +'         select   0 as AMT_BASE, '
             +'                  Sum(AMT_TRUST) as AMT_BUY, '
             +'                  0 as AMT_PAY '
             +'           from   SL_BUY_H '
             +'          where   CD_HEAD  =:P0 '
             +'            and   CD_STORE =:P1 '
             +'            and   CD_TRDPL =:P2 '
             +'            and   YMD_BUY between Date_Format(Now(), ''%Y%m01'') and Date_Format(Now(), ''%Y%m%d'') '
             +'            and   AMT_TRUST <> 0 '
             +'         union all '
             +'         select   0 as AMT_BASE, '
             +'                  0 as AMT_BUY, '
             +'                  Sum(AMT_OUT+AMT_DC) as AMT_PAY '
             +'           from   SL_ACCT '
             +'          where   CD_HEAD  =:P0 '
             +'            and   CD_STORE =:P1 '
             +'            and   CD_TRDPL =:P2 '
             +'            and   CD_ACCT ='''+CreditOut+''''
             +'            and   YMD_OCCUR between Date_Format(Now(), ''%Y%m01'') and Date_Format(Now(), ''%Y%m%d'') '
             +'         ) as t ',
              [HeadStoreCode,
               StoreCode,
               String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index])]);
    try
      if not Query.Eof then
      begin
        OrderCreditAmtEdit.Value := Query.Fields[0].AsCurrency;
      end;
    finally
      FinishQuery;
    end;
  end;

  if Tag = 1 then
  begin
    OpenQuery('select StoD(YMD_BUY) as YMD_BUY, '
             +'       NO_BUY, '
             +'       AMT_DUTY as AMT_NET, '
             +'       AMT_TAX, '
             +'       AMT_DUTYFREE, '
             +'       AMT_BUY '
             +'  from SL_BUY_H '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_TRDPL =:P2 '
             +' order by YMD_BUY desc, NO_BUY ',
             [HeadStoreCode,
              StoreCode,
              CompanyCodeEdit.Text]);
    DM.ReadQuery(Query, BuyGridTableView);
  end;
end;
//------------------------------------------------------------------------------
// 신규
function TBuyCompanyForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    CompanyNameEdit.Enabled := true;
    GetCompanyCode;
    // 코드 자동 증가
    if CheckOption(2) then
    begin
      CompanyCodeCreateButton.Enabled     := false;
      CompanyCodeEdit.Properties.ReadOnly := true;
      CompanyCodeEdit.TabStop             := false;
      CompanyCodeEdit.Style.Color         := clrDisabled;
      CompanyCodeEdit.StyleFocused.Color  := clrDisabled;
    end
    // 코드 수동 입력
    else
    begin
      CompanyCodeCreateButton.Enabled     := true;
      CompanyCodeEdit.Properties.ReadOnly := false;
      CompanyCodeEdit.TabStop             := true;
      CompanyCodeEdit.Style.Color         := clWindow;
      CompanyCodeEdit.StyleFocused.Color  := clrFocused;
    end;
    if MainPanel.Enabled and CompanyNameEdit.Enabled then
      CompanyNameEdit.SetFocus;

    TaxComboBox.ItemIndex := 1;
  finally
    isLoading := false;
  end;

  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function TBuyCompanyForm.DoDelete: Boolean;
var
  vExist: Boolean;
begin

  Result := false;

  // 거래내역 조회
  if Tag = 1  then
  begin
    vExist := OpenQuery('select   NO_BUY '
                       +'from     SL_BUY_H '
                       +'where    CD_HEAD  = :P0 '
                       +'  and    CD_STORE = :P1 '
                       +'  and    CD_TRDPL = :P2 ',
                        [HeadStoreCode,
                         StoreCode,
                         String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index])],
                         true);
    FinishQuery;
    if vExist then
    begin
      ErrBox(Format('%s(%s) 업체로 %s이 있어서 삭제할 수 없습니다.'#13'%s를 %s으로 수정하고 저장하십시오.', [String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index]), String(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index]), UseYNLabel.Caption, UseYNComboBox.Properties.Items[1], IfThen(vExist, '등록된 상품', '매입된 내역')]));
      Exit;
    end;
  end;

  // 업체 삭제
  Result := ExecQuery('delete from MS_TRD '
                     +' where CD_HEAD  =:P0 '
                     +'   and CD_STORE =:P1 '
                     +'   and CD_TRDPL =:P2;',
                      [HeadStoreCode,
                       StoreCode,
                       GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index]]);
end;
//------------------------------------------------------------------------------
// 저장
function TBuyCompanyForm.DoSave: Boolean;
var
  vIndex, vParamIndex :Integer;
  vNoOrder    : Integer;
  vCompanyType: string;
  vSQLText, vCode :String;
begin
  Result := false;

  // 업체코드 입력여부 확인
  if Trim(CompanyCodeEdit.Text) = EmptyStr then
  begin
    ErrBox(CompanyCodeLabel.Caption+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    Exit;
  end
  // 업체이름
  else if Trim(CompanyNameEdit.Text) = EmptyStr then
  begin
    ErrBox(CompanyNameLabel.Caption+msgMustInput);
    if MainPanel.Enabled and CompanyNameEdit.Enabled then
      CompanyNameEdit.SetFocus;
    Exit;
  end;

  try
    OpenQuery('select count(*) '
             +'  from MS_TRD '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +Ifthen(isNew, '', 'and CD_TRDPL <> '''+CompanyCodeEdit.Text+'''')
             +'   and NM_TRDPL =:P2 '
             +'   and DS_STATUS =:P3 ',
             [HeadStoreCode,
              StoreCode,
              CompanyNameEdit.Text,
              UseYNComboBox.ItemIndex]);
    if (Query.Fields[0].AsInteger > 0) then
    begin
      if not AskBox('매입처 이름이 같은 매입처가 존재합니다.'+#13+'계속하시겠습니까?') then
        Exit;
    end;
  finally
    FinishQuery;
  end;

  case Tag of
    1 : vCompanyType := 'B';
    2 : vCompanyType := 'C';
    3 : vCompanyType := 'L';
  end;

  if GetOnlyNumber(IDNoEdit.Text) <> '' then
    try
      OpenQuery('select count(*) '
               +'  from MS_TRD '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and DS_TRDPL = '''+vCompanyType+''' '
               +Ifthen(isNew, '', 'and CD_TRDPL <> '''+CompanyCodeEdit.Text+'''')
               +'   and GetOnlyNumber(NO_BIZER) =:P2 ',
               [HeadStoreCode,
                StoreCode,
                GetOnlyNumber(IDNoEdit.Text)]);
      if (Query.Fields[0].AsInteger > 0) then
      begin
        if not AskBox('이미 등록된 사업자번호입니다.'#13'계속하시겠습니까?') then
          Exit;
      end;
    finally
      FinishQuery;
    end;

  // 저장
  Result := ExecQuery(IfThen(isNew,
                             'insert into MS_TRD(CD_HEAD, '
                            +'                   CD_STORE, '
                            +'                   CD_TRDPL, '
                            +'                   NM_TRDPL, '
                            +'                   DS_TRDPL, '
                            +'                   DS_CORNER, '
                            +'                   DS_TAX, '
                            +'                   NM_BOSS, '
                            +'                   NO_BIZER, '
                            +'                   NM_JONGMOK, '
                            +'                   NM_UPTAE, '
                            +'                   TEL_OFFICE, '
                            +'                   TEL_FAX, '
                            +'                   TEL_MOBILE, '
                            +'                   NM_EMAIL, '
                            +'                   NO_POST, '
                            +'                   ADDR1, '
                            +'                   ADDR2, '
                            +'                   NM_DAMDANG, '
                            +'                   REMARK, '
                            +'                   DS_STATUS, '
                            +'                   CD_SAWON_CHG, '
                            +'                   RATE_FEE, '
                            +'                   RATE_FEE_CASH, '
                            +'                   RATE_FEE_CARD, '
                            +'                   RATE_FEE_CASHRCP, '
                            +'                   VAN_TID, '
                            +'                   VAN_SERIALNO, '
                            +'                   VAN_PWD, '
                            +'                   VAN_TAX, '
                            +'                   DT_CHANGE) '
                            +'            values(:P0, :P1, :P2, :P3, :P4, ''D'', :P5, :P6,  :P7, :P8, :P9,'
                            +'                   :P10, :P11, :P12, :P13, :P14, :P15, :P16, :P17, :P18, :P19, :P20, :P21, :P22, :P23, :P24, :P25, :P26, :P27, 0, Now());',
                             'update MS_TRD '
                            +'set    NM_TRDPL         = :P3, '
                            +'       DS_TRDPL         = :P4, '
                            +'       DS_TAX           = :P5, '
                            +'       NM_BOSS          = :P6, '
                            +'       NO_BIZER         = :P7, '
                            +'       NM_JONGMOK       = :P8, '
                            +'       NM_UPTAE         = :P9, '
                            +'       TEL_OFFICE       = :P10, '
                            +'       TEL_FAX          = :P11, '
                            +'       TEL_MOBILE       = :P12, '
                            +'       NM_EMAIL         = :P13, '
                            +'       NO_POST          = :P14, '
                            +'       ADDR1            = :P15, '
                            +'       ADDR2            = :P16, '
                            +'       NM_DAMDANG       = :P17, '
                            +'       REMARK           = :P18, '
                            +'       DS_STATUS        = :P19, '
                            +'       CD_SAWON_CHG     = :P20, '
                            +'       RATE_FEE         = :P21, '
                            +'       RATE_FEE_CASH    = :P22, '
                            +'       RATE_FEE_CARD    = :P23, '
                            +'       RATE_FEE_CASHRCP = :P24, '
                            +'       VAN_TID          = :P25, '
                            +'       VAN_SERIALNO     = :P26, '
                            +'       VAN_PWD          = :P27, '
                            +'       VAN_TAX          = 0, '
                            +'       DT_CHANGE        = Now() '
                            +' where CD_HEAD          = :P0 '
                            +'   and CD_STORE         = :P1 '
                            +'   and CD_TRDPL         = :P2;'),
                      [HeadStoreCode,
                       StoreCode,
                       CompanyCodeEdit.Text,
                       CompanyNameEdit.Text,
                       vCompanyType,
                       IntToStr(TaxComboBox.ItemIndex),
                       CEONameEdit.Text,
                       IDNoEdit.Text,
                       JongmokEdit.Text,
                       UptaeEdit.Text,
                       Replace(TelNoEdit.Text,'-',''),
                       Replace(FaxNoEdit.Text,'-',''),
                       Replace(MobileTelNoEdit.Text,'-',''),
                       EMailEdit.Text,
                       ZipCodeEdit.Text,
                       Addr1Edit.Text,
                       Addr2Edit.Text,
                       ContactNameEdit.Text,
                       RemarkMemo.Text,
                       UseYNComboBox.ItemIndex,
                       UserCode,
                       DefaultRateEdit.Value,
                       CashRateEdit.Value,
                       CardRateEdit.Value,
                       CashRcpRateEdit.Value,
                       VanTidEdit.Text,
                       VanSerialNoEdit.Text,
                       VanPasswordEdit.Text], true);
  if Result then
  begin
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := CompanyCodeEdit.Text;
      NewData[1] := CompanyNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewCompanyName.Index] := CompanyNameEdit.Text;
  end;
end;

end.
