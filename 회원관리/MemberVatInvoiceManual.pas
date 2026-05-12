unit MemberVatInvoiceManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  cxMemo, ExtCtrls, cxStyles, AdvToolBar, AdvToolBarStylers, DBAccess, Uni, DB,
  MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, cxCurrencyEdit, cxRadioGroup, cxCheckBox, Math, StrUtils,
  cxClasses;

type
  TMemberVatInvoiceManualForm = class(TInheritEditForm)
    ButtonToolBarNewButton: TAdvGlowButton;
    MainPanel: TPanel;
    Shape11: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape3: TShape;
    Shape7: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape45: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape50: TShape;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    AddressLMemo: TcxMemo;
    BossLEdit: TcxTextEdit;
    UptaeLEdit: TcxTextEdit;
    JongmokLEdit: TcxTextEdit;
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
    AddressRMemo: TcxMemo;
    BossREdit: TcxTextEdit;
    UptaeREdit: TcxTextEdit;
    JongmokREdit: TcxTextEdit;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    SaleCompanyButton: TcxButton;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel33: TcxLabel;
    TaxDateEdit: TcxDateEdit;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel37: TcxLabel;
    cxLabel38: TcxLabel;
    cxLabel39: TcxLabel;
    TotalVatAmtEdit: TcxCurrencyEdit;
    WhyEdit: TcxTextEdit;
    RemarkMemo: TcxMemo;
    Month1Edit: TcxTextEdit;
    Month2Edit: TcxTextEdit;
    Month3Edit: TcxTextEdit;
    Month4Edit: TcxTextEdit;
    Item1Edit: TcxTextEdit;
    Item2Edit: TcxTextEdit;
    Item3Edit: TcxTextEdit;
    Item4Edit: TcxTextEdit;
    Qty1Edit: TcxCurrencyEdit;
    Qty2Edit: TcxCurrencyEdit;
    Qty4Edit: TcxCurrencyEdit;
    Qty3Edit: TcxCurrencyEdit;
    Price1Edit: TcxCurrencyEdit;
    Price2Edit: TcxCurrencyEdit;
    Price3Edit: TcxCurrencyEdit;
    Price4Edit: TcxCurrencyEdit;
    NetAmt1Edit: TcxCurrencyEdit;
    NetAmt2Edit: TcxCurrencyEdit;
    NetAmt3Edit: TcxCurrencyEdit;
    NetAmt4Edit: TcxCurrencyEdit;
    VatAmt1Edit: TcxCurrencyEdit;
    VatAmt2Edit: TcxCurrencyEdit;
    VatAmt3Edit: TcxCurrencyEdit;
    VatAmt4Edit: TcxCurrencyEdit;
    cxLabel41: TcxLabel;
    Amount1Edit: TcxCurrencyEdit;
    Amount2Edit: TcxCurrencyEdit;
    Amount3Edit: TcxCurrencyEdit;
    Amount4Edit: TcxCurrencyEdit;
    cxLabel40: TcxLabel;
    cxLabel42: TcxLabel;
    cxLabel43: TcxLabel;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    TotalAmtEdit: TcxCurrencyEdit;
    CashAmtEdit: TcxCurrencyEdit;
    CheckAmtEdit: TcxCurrencyEdit;
    BillAmtEdit: TcxCurrencyEdit;
    MisuAmtEdit: TcxCurrencyEdit;
    cxLabel46: TcxLabel;
    RequestRadioButton: TcxRadioButton;
    ReceiptRadioButton: TcxRadioButton;
    cxLabel47: TcxLabel;
    TotalNetAmtEdit: TcxCurrencyEdit;
    OptionPanel: TPanel;
    SaleRadioButton: TcxRadioButton;
    BuyRadioButton: TcxRadioButton;
    BizNoLEdit: TcxMaskEdit;
    BizNoREdit: TcxMaskEdit;
    Shape51: TShape;
    cxButton1: TcxButton;
    BuyCompanyButton: TcxButton;
    DutyFreeCheckBox: TcxCheckBox;
    CompanyNameREdit: TcxTextEdit;
    CompanyNameLEdit: TcxTextEdit;
    Shape46: TShape;
    cxLabel48: TcxLabel;
    Shape52: TShape;
    cxLabel49: TcxLabel;
    Shape53: TShape;
    PasswordEdit: TcxTextEdit;
    EMailREdit: TcxTextEdit;
    Shape54: TShape;
    cxLabel50: TcxLabel;
    SubBizNoLEdit: TcxTextEdit;
    SubBizNoREdit: TcxTextEdit;
    Shape25: TShape;
    TelNoREdit: TcxTextEdit;
    cxLabel31: TcxLabel;
    Shape44: TShape;
    TelNoLEdit: TcxTextEdit;
    Shape55: TShape;
    RestCountLabel: TcxLabel;
    PaperCheckBox: TcxCheckBox;
    ButtonToolBarCancelButton: TAdvGlowButton;
    procedure SaleRadioButtonClick(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure Qty1EditExit(Sender: TObject);
    procedure SaleCompanyButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Month2EditEnter(Sender: TObject);
    procedure Month3EditEnter(Sender: TObject);
    procedure Month4EditEnter(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure Month1EditExit(Sender: TObject);
    procedure TelNoLEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
  private
    isFirst :Boolean;
    ProviderEMail :String;
    TempBillNo    :String;
  protected
    procedure RestoreBillNo;
    procedure CommitBillNo(aBillNo:String);
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  MemberVatInvoiceManualForm: TMemberVatInvoiceManualForm;



implementation

uses
  Common, Help, eTax;//, MemberVatInvoicePopup;
{$R *.dfm}

procedure TMemberVatInvoiceManualForm.FormShow(Sender: TObject);
var
  vCount, vChargeCount, vUseCount: Integer;
begin
  inherited;
  isFirst     := true;
  TempBillNo  := EmptyStr;
  // 충전건수 확인                      CustomerNo
  vCount := GetETaxChargeCount(CustomerNo, vChargeCount, vUseCount);

  RestCountLabel.Caption := '발행가능 건수 : '+IntToStr(vCount)+' 건';
  RestCountLabel.Tag     := vCount;
end;


procedure TMemberVatInvoiceManualForm.Month1EditExit(Sender: TObject);
begin
  inherited;
  if Length(GetOnlyNumber((Sender as TcxTextEdit).Text)) = 4 then
    (Sender as TcxTextEdit).Text := LeftStr((Sender as TcxTextEdit).Text,2)+'-'+ RightStr((Sender as TcxTextEdit).Text,2)
  else
    (Sender as TcxTextEdit).Text := '';
end;

procedure TMemberVatInvoiceManualForm.Month2EditEnter(Sender: TObject);
begin
  inherited;
  if Month2Edit.Text = EmptyStr then
    Month2Edit.Text := Month1Edit.Text;
end;

procedure TMemberVatInvoiceManualForm.Month3EditEnter(Sender: TObject);
begin
  inherited;
  if Month3Edit.Text = EmptyStr then
    Month3Edit.Text := Month1Edit.Text;
end;

procedure TMemberVatInvoiceManualForm.Month4EditEnter(Sender: TObject);
begin
  inherited;
  if Month4Edit.Text = EmptyStr then
    Month4Edit.Text := Month1Edit.Text;
end;

//------------------------------------------------------------------------------
// 신규버튼 클릭 시
procedure TMemberVatInvoiceManualForm.ButtonToolBarCancelButtonClick(
  Sender: TObject);
begin
  inherited;
  if not AskBox('현재 작업을 취소하시겠습니까?') then Exit;

  ButtonToolBarNewButtonClick(nil);
  OptionPanel.Enabled := true;
end;

procedure TMemberVatInvoiceManualForm.ButtonToolBarNewButtonClick(
  Sender: TObject);
begin
  inherited;
  RestoreBillNo;
  SaleRadioButtonClick(SaleRadioButton);
  TaxDateEdit.Date  := now();
  Month1Edit.Text   := FormatDateTime('mm/dd',now);
  MainPanel.Enabled := true;
  isChanged         := true;
  TempBillNo        := EmptyStr;
  ButtonToolBarCancelButton.Enabled := true;
end;

//------------------------------------------------------------------------------
// 공급받는자 조회 버튼 클릭 시
procedure TMemberVatInvoiceManualForm.SaleCompanyButtonClick(
  Sender: TObject);
begin
  inherited;
  if Sender = SaleCompanyButton then
  begin
    with THelpForm.Create(Self) do
      try
        Caption := '매출처 조회';
        GridTableViewCode.Caption  := '매출처코드';
        GridTableViewCode.Width    := 100;
        GridTableViewName1.Caption := '매출처이름';
        GridTableViewName1.Width   := 310;

        SearchText := EmptyStr;
        SQLText    := 'select   a.CD_MEMBER, '
                     +'         a.NM_MEMBER, '
                     +'         a.NO_BIZER, '
                     +'         a.NM_BOSS, '
                     +'         a.ADDR1+'' ''+a.ADDR2 as ADDR, '
                     +'         a.NM_UPTAE, '
                     +'         a.NM_JONGMOK, '
                     +'         case when Isnull(a.INVOICE_ITEM,'''') = '''' then b.INVOICE_ITEM else a.INVOICE_ITEM end as INVOICE_ITEM, '
                     +'         a.NM_EMAIL, '
                     +'         a.TEL_INVOICE, '
                     +'         a.NO_BIZER_SUB '
                     +'from     MS_MEMBER a left outer join '
                     +'         MS_STORE b on b.CD_STORE =:P0 '
                     +'where    a.CD_STORE = '''+Ifthen(GetOption(257)='0', StoreCode,'0000')+''''
                     +'  and   (a.CD_MEMBER =:P1 or a.NM_MEMBER like ''%''+:P1+''%'') '
                     +'  and    a.DS_STATUS = ''0'' '
                     +'  and    a.MEMBER_TYPE  = ''T'' '
                     +'order by a.CD_STORE, a.CD_MEMBER';
        IsAutoSearch := true; // 폼 띄우면서 자동 검색
        if ShowModal = mrOK then
        begin
          RestoreBillNo;
          CompanyNameREdit.Text    := Names[0];
          BizNoREdit.Text          := Names[1];
          BossREdit.Text           := Names[2];
          AddressRMemo.Text        := Names[3];
          UptaeREdit.Text          := Names[4];
          JongmokREdit.Text        := Names[5];
          Item1Edit.Text           := Names[6];
          EmailREdit.Text          := Names[7];
          TelNoREdit.Text          := GetPhoneNo(Names[8]);
          SubBizNoREdit.Text       := Names[9];
          if Item1Edit.Text = EmptyStr then Item1Edit.SetFocus
          else Amount1Edit.SetFocus;
          OptionPanel.Enabled := false;
        end;
      finally
        Free;
      end;
  end
  else
  begin
    with THelpForm.Create(Self) do
      try
        Caption := '매입처 조회';
        GridTableViewCode.Caption  := '매입처코드';
        GridTableViewCode.Width    := 100;
        GridTableViewName1.Caption := '매입처이름';
        GridTableViewName1.Width   := 310;

        SearchText := EmptyStr;
        SQLText    := 'select   a.CD_TRDPL, '
                     +'         a.INVOICE_NM_TRDPL , '
                     +'         a.NO_BIZER, '
                     +'         a.NM_BOSS, '
                     +'         a.ADDR1+'' ''+a.ADDR2 as ADDR, '
                     +'         a.NM_UPTAE, '
                     +'         a.NM_JONGMOK, '
                     +'         case when Isnull(a.INVOICE_ITEM,'''') = '''' then b.INVOICE_ITEM else a.INVOICE_ITEM end as INVOICE_ITEM, '
                     +'         a.TEL_INVOICE, '
                     +'         a.NO_BIZER_SUB '
                     +'from     MS_TRD a left outer join '
                     +'         MS_STORE b on a.CD_STORE = b.CD_STORE '
                     +'  and   (a.CD_TRDPL =:P1 or a.NM_TRDPL like ''%''+:P1+''%'') '
                     +'  and    a.DS_STATUS = ''0'' '
                     +'  and    a.DS_TRDPL  = ''B'' '
                     +'order by a.CD_STORE, a.CD_TRDPL';
        IsAutoSearch := true; // 폼 띄우면서 자동 검색
        if ShowModal = mrOK then
        begin
          RestoreBillNo;
          CompanyNameLEdit.Text    := Names[0];
          BizNoLEdit.Text          := Names[1];
          BossLEdit.Text           := Names[2];
          AddressLMemo.Text        := Names[3];
          UptaeLEdit.Text          := Names[4];
          JongmokLEdit.Text        := Names[5];
          Item1Edit.Text           := Names[6];
          TelNoLEdit.Text          := GetPhoneNo(Names[7]);
          SubBizNoLEdit.Text       := Names[8];
          if Item1Edit.Text = EmptyStr then Item1Edit.SetFocus
          else Amount1Edit.SetFocus;
          OptionPanel.Enabled := false;
        end;
      finally
        Free;
      end;
  end;
end;

//저장버튼 클릭 시
procedure TMemberVatInvoiceManualForm.ButtonToolBarSaveButtonClick(
  Sender: TObject);
var vIndex :Integer;
    vBillNo :String;
begin
  inherited;
  if SaleRadioButton.Checked then
  begin
    if Trim(BizNoREdit.Text) = '--' then
    begin
      ErrBox('사업자를 입력하십시오.');
      ButtonToolBarSaveButton.Enabled := true;
      BizNoREdit.SetFocus;
      Exit;
    end;

    if Trim(CompanyNameREdit.Text) = '' then
    begin
      ErrBox('상호를 입력하십시오.');
      ButtonToolBarSaveButton.Enabled := true;
      CompanyNameREdit.SetFocus;
      Exit;
    end;

    if Trim(BossREdit.Text) = '' then
    begin
      ErrBox('대표자를 입력하십시오.');
      ButtonToolBarSaveButton.Enabled := true;
      BossREdit.SetFocus;
      Exit;
    end;

    if Trim(AddressRMemo.Text) = '' then
    begin
      ErrBox('주소를 입력하십시오.');
      ButtonToolBarSaveButton.Enabled := true;
      AddressRMemo.SetFocus;
      Exit;
    end;

    if Trim(UptaeREdit.Text) = '' then
    begin
      ErrBox('업태를 입력하십시오.');
      ButtonToolBarSaveButton.Enabled := true;
      UptaeREdit.SetFocus;
      Exit;
    end;

    if Trim(JongmokREdit.Text) = '' then
    begin
      ErrBox('종목을 입력하십시오.');
      ButtonToolBarSaveButton.Enabled := true;
      JongmokREdit.SetFocus;
      Exit;
    end;

    if Trim(PasswordEdit.Text) = '' then
    begin
      ErrBox('인증서암호를 입력하십시오.');
      ButtonToolBarSaveButton.Enabled := true;
      PasswordEdit.SetFocus;
      Exit;
    end;
  end;

  if not AskBox(Ifthen(DutyFreeCheckBox.Checked, '계산서', '세금계산서')+'를 발행하시겠습니까?') then Exit;

  if SetETaxData(CustomerNo,
                 Replace(BizNoLEdit.Text,'-',''),        //공급자 사업자번호
                 SubBizNoLEdit.Text,                     //공급자 종사업자번호
                 CompanyNameLEdit.Text,                  //공급자 상호명
                 BossLEdit.Text,                         //공급자 대표자
                 AddressLMemo.Text,                      //공급자 주소
                 UptaeLEdit.Text,                        //공급자 업태
                 JongmokLEdit.Text,                      //공급자 종목,
                 '',                                     //공급자 부서
                 '',                                     //공급자 담당,
                 ProviderEMail,                          //공급자 이메일,
                 Replace(TelNoLEdit.Text,'-',''),        //공급자 전화번호
                 SaleRadioButton.Checked,                //국제청 전송여부
                 SaleRadioButton.Checked,                //매출/매입구분
                 PaperCheckBox.Checked,                  //종이/전자세금계산서 구분
                 Ifthen(DutyFreeCheckBox.Checked, 2, 1), //구분(1:세금계산서, 2:계산서, 3:영세
                 ReceiptRadioButton.Checked,             //영수구분(true:영수, false:청구)
                 '',                                     //권,
                 '',                                     //호
                 1,                                      //공급받는자 구분(1:사업자, 2:개인, 3:외국인)
                 Replace(BizNoREdit.Text,'-',''),        //공급받는자 사업자번호
                 SubBizNoREdit.Text,                     //공급받는자 종사업자번호
                 CompanyNameREdit.Text,                  //공급받는자 상호명
                 BossREdit.Text,                         //공급받는자 대표자
                 AddressRMemo.Text,                      //공급받는자 주소
                 UptaeREdit.Text,                        //공급받는자 업태
                 JongmokREdit.Text,                      //공급받는자 종목,
                 '',                                     //공급받는자 부서
                 '',                                     //공급받는자 담당,
                 EmailREdit.Text,                        //공급받는자 이메일,
                 '',                                     //공급받는자 전화번호
                 DtoS(TaxDateEdit.Date),                 //세금계산서 발행일자
                 TotalAmtEdit.EditingValue,              //세금계산서 합계금액
                 TotalNetAmtEdit.EditingValue,           //세금계산서 공급금액
                 TotalVatAmtEdit.EditingValue,           //세금계산서 부가세금액
                 CashAmtEdit.EditingValue,               //세금계산서 현금금액
                 CheckAmtEdit.EditingValue,              //세금계산서 수표금액
                 BillAmtEdit.EditingValue,               //세금계산서 어음금액
                 MisuAmtEdit.EditingValue,               //세금계산서 외상미수금액
                 RemarkMemo.Text,                        //비고
                 WhyEdit.Text,                           //수신자용 공지사항
                 LeftStr(Month1Edit.Text,2) +#9+
                 RightStr(Month1Edit.Text,2) +#9+
                 Item1Edit.Text + #9#9+
                 GetOnlyNumber(Qty1Edit.Text) + #9#9 +
                 GetOnlyNumber(Price1Edit.Text) + #9 +
                 GetOnlyNumber(NetAmt1Edit.Text) + #9 +
                 GetOnlyNumber(VatAmt1Edit.Text) + #9 +
                 '' +'|'+
                 LeftStr(Month2Edit.Text,2) +#9+
                 RightStr(Month2Edit.Text,2) +#9+
                 Item2Edit.Text + #9#9+
                 GetOnlyNumber(Qty2Edit.Text) + #9#9 +
                 GetOnlyNumber(Price2Edit.Text) + #9 +
                 GetOnlyNumber(NetAmt2Edit.Text) + #9 +
                 GetOnlyNumber(VatAmt2Edit.Text) + #9 +
                 '' +'|'+
                 LeftStr(Month3Edit.Text,2) +#9+
                 RightStr(Month3Edit.Text,2) +#9+
                 Item3Edit.Text + #9#9+
                 GetOnlyNumber(Qty3Edit.Text) + #9#9 +
                 GetOnlyNumber(Price3Edit.Text) + #9 +
                 GetOnlyNumber(NetAmt3Edit.Text) + #9 +
                 GetOnlyNumber(VatAmt3Edit.Text) + #9 +
                 '' +'|'+
                 LeftStr(Month4Edit.Text,2) +#9+
                 RightStr(Month4Edit.Text,2) +#9+
                 Item4Edit.Text + #9#9+
                 GetOnlyNumber(Qty4Edit.Text) + #9#9 +
                 GetOnlyNumber(Price4Edit.Text) + #9 +
                 GetOnlyNumber(NetAmt4Edit.Text) + #9 +
                 GetOnlyNumber(VatAmt4Edit.Text) + #9 +
                 '',
                 vBillNo,
                 PasswordEdit.Text,
                 isFirst) then
  begin
    MsgBox('저장이 완료 되었습니다.'+#13+'정상 발행여부를 [전자세금계산서 조회]에서 반드시 확인 바랍니다.');
    //연결된 매출에 계산서번호를 확정한다
    CommitBillNo(vBillNo);

    if SaleRadioButton.Checked then
      RestCountLabel.Tag := RestCountLabel.Tag - 1;
    isFirst := false;  //첫번째 전송이 아님으로 변경 다음부터는 인증안받음
    TotalNetAmtEdit.Clear;
    TotalVatAmtEdit.Clear;
    for vIndex := 1 to 4 do
    begin
      TcxTextEdit(FindComponent('Month'+IntToStr(vIndex)+'Edit')).Clear;
      TcxTextEdit(FindComponent('Item'+IntToStr(vIndex)+'Edit')).Clear;
      TcxCurrencyEdit(FindComponent('Qty'+IntToStr(vIndex)+'Edit')).Clear;
      TcxCurrencyEdit(FindComponent('Price'+IntToStr(vIndex)+'Edit')).Clear;
      TcxCurrencyEdit(FindComponent('NetAmt'+IntToStr(vIndex)+'Edit')).Clear;
      TcxCurrencyEdit(FindComponent('VatAmt'+IntToStr(vIndex)+'Edit')).Clear;
      TcxCurrencyEdit(FindComponent('Amount'+IntToStr(vIndex)+'Edit')).Clear;
    end;
    TotalAmtEdit.Value := 0;
    CashAmtEdit.Value  := 0;
    CheckAmtEdit.Value := 0;
    BillAmtEdit.Value  := 0;
    MisuAmtEdit.Value  := 0;
    ButtonToolBarNewButton.Click;
  end
  else
    ButtonToolBarSaveButton.Enabled := true;
end;

procedure TMemberVatInvoiceManualForm.CommitBillNo(aBillNo:String);
begin
  if TempBillNo = EmptyStr then Exit;

  try
    BeginTrans;
    ExecQuery('update SL_SALE_H set NO_TAX_REF=:P2, NO_NOTAX_REF=:P2 '
             +'where CD_STORE =:P0 '
             +'  and (NO_TAX_REF = :P1 or NO_NOTAX_REF =:P1)',
             [StoreCode,
              TempBillNo,
              aBillNo]);

    ExecQuery('update SL_ACCT set NO_TAX_REF=:P2, NO_NOTAX_REF=:P2 '
             +'where CD_STORE =:P0 '
             +'  and (NO_TAX_REF = :P1 or NO_NOTAX_REF =:P1)',
             [StoreCode,
              TempBillNo,
              aBillNo]);
    CommitTrans;
    TempBillNo := EmptyStr;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;

procedure TMemberVatInvoiceManualForm.cxButton1Click(Sender: TObject);
begin
  inherited;
{
  with TMemberVatInvoicePopupForm.Create(Self) do
    try
      TaxGubun    := Ifthen(DutyFreeCheckBox.Checked, 'B','S');
      Randomize;
      TempBillNo  := IntToStr(Random(99))+FormatDateTime('mmddhhnn',now());   //임시발행번호 10자리- 10분이 지났으면 발행하지 않으건으로 간주한다
      TempNumber  := TempBillNo;
      if ShowModal = mrOK then
      begin
        try
          OpenQuery('select    NM_MEMBER as NM_MEMBER, '
                    +'         NO_BIZER as NO_BIZER, '
                    +'         NM_BOSS as NM_BOSS, '
                    +'         ADDR1+'' ''+ADDR2 as ADDR, '
                    +'         NM_UPTAE, '
                    +'         NM_JONGMOK, '
                    +'         INVOICE_ITEM, '
                    +'         NM_EMAIL, '
                    +'         TEL_INVOICE as TEL_INVOICE, '
                    +'         NO_BIZER_SUB '
                    +'from     MS_MEMBER '
                    +'where    CD_STORE = :P0 '
                    +'  and    CD_MEMBER  =:P1 '
                    +'  and    DS_STATUS = ''0'' ',
                    [Ifthen(GetOption(257)='0', StoreCode,'0000'),
                     CompanyGridTableView.DataController.Values[CompanyGridTableView.DataController.GetFocusedRecordIndex, CompanyGridTableViewCompanyCode.Index]]);
          CompanyNameREdit.Text    := Query.Fields[0].AsString;
          BizNoREdit.Text          := Query.Fields[1].AsString;
          BossREdit.Text           := Query.Fields[2].AsString;
          AddressRMemo.Text        := Query.Fields[3].AsString;
          UptaeREdit.Text          := Query.Fields[4].AsString;
          JongmokREdit.Text        := Query.Fields[5].AsString;
          Item1Edit.Text           := Query.Fields[6].AsString;
          EMailREdit.Text          := Query.Fields[7].AsString;
          TelNoREdit.Text          := GetPhoneNo(Query.Fields[8].AsString);
          SubBizNoREdit.Text       := Query.Fields[9].AsString;

          Qty1Edit.Value           := 1;
          Amount1Edit.Value        := TotalAmtEdit.Value;
          Qty1EditExit(Amount1Edit);
          if Item1Edit.Text = EmptyStr then Item1Edit.SetFocus
          else Amount1Edit.SetFocus;
          OptionPanel.Enabled := false;
        finally
          FinishQuery;
        end;
      end
      else TempBillNo := EmptyStr;
    finally
      Free;
    end;
    }
end;

procedure TMemberVatInvoiceManualForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //계산서 발행이 완료되지 않은 매출에 임시번호를 클리어한다
  RestoreBillNo;
end;

procedure TMemberVatInvoiceManualForm.FormCreate(Sender: TObject);
begin
  inherited;

end;


//------------------------------------------------------------------------------
// 수량, 단가, 공급금액, 합계금액 자동 계산
procedure TMemberVatInvoiceManualForm.Qty1EditExit(Sender: TObject);
begin
  inherited;
  if (Sender = Qty1Edit) then
  begin
    NetAmt1Edit.Value   := Qty1Edit.Value * Price1Edit.Value;
    VatAmt1Edit.Value   := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt1Edit.Value * 0.1));
    Amount1Edit.Value   := NetAmt1Edit.Value + VatAmt1Edit.Value;
  end
  else if (Sender = Price1Edit)  then
  begin
    if Qty1Edit.Value = 0 then Qty1Edit.Value := 1;
    NetAmt1Edit.Value   := Qty1Edit.Value * Price1Edit.Value;
    VatAmt1Edit.Value   := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt1Edit.Value * 0.1));
    Amount1Edit.Value   := NetAmt1Edit.Value + VatAmt1Edit.Value;
  end
  else if (Sender = NetAmt1Edit) then
  begin
    Qty1Edit.Value    := 1;
    Price1Edit.Value  := NetAmt1Edit.Value;
    VatAmt1Edit.Value := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt1Edit.Value * 0.1));
    Amount1Edit.Value := NetAmt1Edit.Value + VatAmt1Edit.Value;
  end
  else if (Sender = Amount1Edit) then
  begin
    Qty1Edit.Value    := 1;
    NetAmt1Edit.Value := Amount1Edit.Value - Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(Amount1Edit.Value / 1.1 * 0.1));
    Price1Edit.Value  := NetAmt1Edit.Value;
    VatAmt1Edit.Value := Amount1Edit.Value - NetAmt1Edit.Value;
  end
  else if (Sender = Qty2Edit) then
  begin
    NetAmt2Edit.Value  := Qty2Edit.Value * Price2Edit.Value;
    VatAmt2Edit.Value  := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt2Edit.Value * 0.1));
    Amount2Edit.Value  := NetAmt2Edit.Value + VatAmt2Edit.Value;
  end
  else if (Sender = Price2Edit) then
  begin
    if Qty2Edit.Value = 0 then Qty2Edit.Value := 1;
    NetAmt2Edit.Value  := Qty2Edit.Value * Price2Edit.Value;
    VatAmt2Edit.Value  := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt2Edit.Value * 0.1));
    Amount2Edit.Value  := NetAmt2Edit.Value + VatAmt2Edit.Value;
  end
  else if (Sender = NetAmt2Edit) then
  begin
    Qty2Edit.Value    := 1;
    Price2Edit.Value  := NetAmt2Edit.Value;
    VatAmt2Edit.Value := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt2Edit.Value * 0.1));
    Amount2Edit.Value := NetAmt2Edit.Value + VatAmt2Edit.Value;
  end
  else if (Sender = Amount2Edit) then
  begin
    Qty2Edit.Value    := 1;
    NetAmt2Edit.Value := Amount2Edit.Value - Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(Amount2Edit.Value / 1.1 * 0.1));
    Price2Edit.Value  := NetAmt2Edit.Value;
    VatAmt2Edit.Value := Amount2Edit.Value - NetAmt2Edit.Value;
  end
  else if (Sender = Qty3Edit) then
  begin
    NetAmt3Edit.Value := Qty3Edit.Value * Price3Edit.Value;
    VatAmt3Edit.Value := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt3Edit.Value * 0.1));
    Amount3Edit.Value := NetAmt3Edit.Value + VatAmt3Edit.Value;
  end
  else if (Sender = Price3Edit) then
  begin
    if Qty3Edit.Value = 0 then Qty3Edit.Value := 1;
    NetAmt3Edit.Value   := Qty3Edit.Value * Price3Edit.Value;
    VatAmt3Edit.Value   := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt3Edit.Value * 0.1));
    Amount3Edit.Value   := NetAmt3Edit.Value + VatAmt3Edit.Value;
  end
  else if (Sender = NetAmt3Edit) then
  begin
    Qty3Edit.Value    := 1;
    Price3Edit.Value  := NetAmt3Edit.Value;
    VatAmt3Edit.Value := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt3Edit.Value * 0.1));
    Amount3Edit.Value := NetAmt3Edit.Value + VatAmt3Edit.Value;
  end
  else if (Sender = Amount3Edit) then
  begin
    Qty3Edit.Value    := 1;
    NetAmt3Edit.Value := Amount3Edit.Value - Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(Amount3Edit.Value / 1.1 * 0.1));
    Price3Edit.Value  := NetAmt3Edit.Value;
    VatAmt3Edit.Value := Amount3Edit.Value - NetAmt3Edit.Value;
  end
  else if (Sender = Qty4Edit) then
  begin
    NetAmt4Edit.Value := Qty4Edit.Value * Price4Edit.Value;
    VatAmt4Edit.Value := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt4Edit.Value * 0.1));
    Amount4Edit.Value := NetAmt4Edit.Value + VatAmt4Edit.Value;
  end
  else if (Sender = Price4Edit) then
  begin
    if Qty4Edit.Value = 0 then Qty4Edit.Value := 1;
    NetAmt4Edit.Value := Qty4Edit.Value * Price4Edit.Value;
    VatAmt4Edit.Value := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt4Edit.Value * 0.1));
    Amount4Edit.Value := NetAmt4Edit.Value + VatAmt4Edit.Value;
  end
  else if (Sender = NetAmt4Edit) then
  begin
    Qty4Edit.Value    := 1;
    Price4Edit.Value  := NetAmt4Edit.Value;
    VatAmt4Edit.Value := Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(NetAmt4Edit.Value * 0.1));
    Amount4Edit.Value := NetAmt4Edit.Value + VatAmt4Edit.Value;
  end
  else if (Sender = Amount4Edit) then
  begin
    Qty4Edit.Value    := 1;
    NetAmt4Edit.Value := Amount4Edit.Value - Ifthen(DutyFreeCheckBox.Checked, 0, Trunc(Amount4Edit.Value / 1.1 * 0.1));
    Price4Edit.Value  := NetAmt4Edit.Value;
    VatAmt4Edit.Value := Amount4Edit.Value - NetAmt4Edit.Value;
  end;

  TotalVatAmtEdit.Value := VatAmt1Edit.Value + VatAmt2Edit.Value + VatAmt3Edit.Value + VatAmt4Edit.Value;
  TotalNetAmtEdit.Value := NetAmt1Edit.Value + NetAmt2Edit.Value + NetAmt3Edit.Value + NetAmt4Edit.Value;
  TotalAmtEdit.Value    := Amount1Edit.Value + Amount2Edit.Value + Amount3Edit.Value + Amount4Edit.Value;
end;

procedure TMemberVatInvoiceManualForm.RestoreBillNo;
begin
  if TempBillNo = EmptyStr then Exit;

  try
    BeginTrans;
    ExecQuery('update SL_SALE_H set NO_TAX_REF='''', NO_NOTAX_REF='''' '
             +'where CD_STORE =:P0 '
             +'  and (NO_TAX_REF = :P1 or NO_NOTAX_REF =:P1)',
             [StoreCode,
              TempBillNo]);

    ExecQuery('update SL_ACCT set NO_TAX_REF='''', NO_NOTAX_REF='''' '
             +'where CD_STORE =:P0 '
             +'  and (NO_TAX_REF = :P1 or NO_NOTAX_REF =:P1)',
             [StoreCode,
              TempBillNo]);
    CommitTrans;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;

end;

//------------------------------------------------------------------------------
// 매입 / 매출 변경 시
procedure TMemberVatInvoiceManualForm.SaleRadioButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if isLoading then Exit;
  try
    OpenQuery('select NO_BIZER, '
             +'       NM_STORE, '
             +'       NM_BOSS, '
             +'       ADDR1+'' ''+ADDR2 as ADDR, '
             +'       NM_UPTAE, '
             +'       NM_UPJONG, '
             +'       TEL_MOBIL1, '
             +'       NM_EMAIL, '
             +'       NO_BIZER_SUB '
             +'from   MS_STORE '
             +'where  CD_STORE =:P0',
             [StoreCode]);
    //매출계산서일때
    if Sender = SaleRadioButton then
    begin
      PaperCheckBox.Checked     := false;
      PaperCheckBox.Enabled     := false;
      BuyCompanyButton.Visible  := false;
      SaleCompanyButton.Visible := true;
      BizNoLEdit.Text       := Query.Fields[0].AsString;
      CompanyNameLEdit.Text := Query.Fields[1].AsString;
      BossLEdit.Text        := Query.Fields[2].AsString;
      AddressLMemo.Text     := Query.Fields[3].AsString ;
      UptaeLEdit.Text       := Query.Fields[4].AsString;
      JongmokLEdit.Text     := Query.Fields[5].AsString;
      TelNoLEdit.Text       := GetPhoneNo(Query.Fields[6].AsString);
      ProviderEMail         := Query.Fields[7].AsString;
      SubBizNoLEdit.Text    := Query.Fields[8].AsString;

      BizNoLEdit.Properties.ReadOnly       := true;
      CompanyNameLEdit.Properties.ReadOnly := true;
      BossLEdit.Properties.ReadOnly        := true;
      AddressLMemo.Properties.ReadOnly     := true;
      UptaeLEdit.Properties.ReadOnly       := true;
      JongmokLEdit.Properties.ReadOnly     := true;
      TelNoLEdit.Properties.ReadOnly       := true;
      SubBizNoLEdit.Properties.ReadOnly    := true;
      PasswordEdit.Properties.ReadOnly     := false;

      BizNoREdit.Clear;
      SubBizNoREdit.Clear;
      CompanyNameREdit.Clear;
      BossREdit.Clear;
      AddressRMemo.Clear;
      UptaeREdit.Clear;
      JongmokREdit.Clear;
      EMailREdit.Clear;
      TelNoREdit.Clear;

      BizNoREdit.Properties.ReadOnly       := false;
      SubBizNoREdit.Properties.ReadOnly    := false;
      CompanyNameREdit.Properties.ReadOnly := false;
      BossREdit.Properties.ReadOnly        := false;
      AddressRMemo.Properties.ReadOnly     := false;
      UptaeREdit.Properties.ReadOnly       := false;
      JongmokREdit.Properties.ReadOnly     := false;
      TelNoREdit.Properties.ReadOnly       := false;
    end
    //매입세금계산서 일때
    else if Sender = BuyRadioButton then
    begin
      PaperCheckBox.Checked     := false;
      PaperCheckBox.Enabled     := true;

      BuyCompanyButton.Visible  := true;
      SaleCompanyButton.Visible := false;
      BizNoREdit.Text       := Query.Fields[0].AsString;
      CompanyNameREdit.Text := Query.Fields[1].AsString;
      BossREdit.Text        := Query.Fields[2].AsString;
      AddressRMemo.Text     := Query.Fields[3].AsString ;
      UptaeREdit.Text       := Query.Fields[4].AsString;
      JongmokREdit.Text     := Query.Fields[5].AsString;
      TelNoREdit.Text       := GetPhoneNo(Query.Fields[6].AsString);
      SubBizNoREdit.Text    := Query.Fields[7].AsString;

      BizNoREdit.Properties.ReadOnly       := true;
      CompanyNameREdit.Properties.ReadOnly := true;
      BossREdit.Properties.ReadOnly        := true;
      AddressRMemo.Properties.ReadOnly     := true;
      UptaeREdit.Properties.ReadOnly       := true;
      JongmokREdit.Properties.ReadOnly     := true;
      TelNoREdit.Properties.ReadOnly       := true;
      SubBizNoREdit.Properties.ReadOnly    := true;

      BizNoLEdit.Clear;
      CompanyNameLEdit.Clear;
      BossLEdit.Clear;
      AddressLMemo.Clear;
      UptaeLEdit.Clear;
      JongmokLEdit.Clear;
      TelNoLEdit.Clear;
      PasswordEdit.Clear;
      SubBizNoLEdit.Clear;
      ProviderEMail := EmptyStr;

      BizNoLEdit.Properties.ReadOnly       := false;
      CompanyNameLEdit.Properties.ReadOnly := false;
      BossLEdit.Properties.ReadOnly        := false;
      AddressLMemo.Properties.ReadOnly     := false;
      UptaeLEdit.Properties.ReadOnly       := false;
      JongmokLEdit.Properties.ReadOnly     := false;
      TelNoLEdit.Properties.ReadOnly       := false;
      SubBizNoLEdit.Properties.ReadOnly    := false;
      PasswordEdit.Properties.ReadOnly     := true;
    end;
  finally
    FinishQuery;
  end;

  TotalNetAmtEdit.Clear;
  TotalVatAmtEdit.Clear;
  for vIndex := 1 to 4 do
  begin
    TcxTextEdit(FindComponent('Month'+IntToStr(vIndex)+'Edit')).Clear;
    TcxTextEdit(FindComponent('Item'+IntToStr(vIndex)+'Edit')).Clear;
    TcxCurrencyEdit(FindComponent('Qty'+IntToStr(vIndex)+'Edit')).Clear;
    TcxCurrencyEdit(FindComponent('Price'+IntToStr(vIndex)+'Edit')).Clear;
    TcxCurrencyEdit(FindComponent('NetAmt'+IntToStr(vIndex)+'Edit')).Clear;
    TcxCurrencyEdit(FindComponent('VatAmt'+IntToStr(vIndex)+'Edit')).Clear;
    TcxCurrencyEdit(FindComponent('Amount'+IntToStr(vIndex)+'Edit')).Clear;
  end;
  TotalAmtEdit.Value := 0;
  CashAmtEdit.Value  := 0;
  CheckAmtEdit.Value := 0;
  BillAmtEdit.Value  := 0;
  MisuAmtEdit.Value  := 0;

end;

procedure TMemberVatInvoiceManualForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarNewButton.Enabled := not isChanged;
end;

procedure TMemberVatInvoiceManualForm.TelNoLEditExit(Sender: TObject);
begin
  inherited;
  (Sender as TcxTextEdit).Text := GetPhoneNo((Sender as TcxTextEdit).Text);
end;

end.
