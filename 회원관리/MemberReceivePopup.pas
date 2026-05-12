unit MemberReceivePopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxLabel, cxCheckBox, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StrUtils;

type
  TMemberReceivePopupForm = class(TForm)
    SaleGrid: TcxGrid;
    SaleGridTableView: TcxGridTableView;
    SaleGridTableViewSaleDate: TcxGridColumn;
    SaleGridTableViewBillNo: TcxGridColumn;
    SaleGridTableGridSaleAmt: TcxGridColumn;
    SaleGridTableGridTrustAmt: TcxGridColumn;
    SaleGridTableGridNetAmt: TcxGridColumn;
    SaleGridTableGridDutyFreeAmt: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    OKButton: TButton;
    CloseButton: TButton;
    SaleGridTableViewCheck: TcxGridColumn;
    SearchButton: TButton;
    SearchLabel: TLabel;
    FromDateEdit : TcxDateEdit;
    ToDateEdit   : TcxDateEdit;
    ConditionToolBarDateToLabel: TcxLabel;
    ConditionAllCheckBox: TcxCheckBox;
    Label1: TLabel;
    TotalAmtEdit: TcxCurrencyEdit;
    EditStyleController: TcxEditStyleController;
    Label2: TLabel;
    ReceiveAmtEdit: TcxCurrencyEdit;
    Label3: TLabel;
    RemnantsAmtEdit: TcxCurrencyEdit;
    SaleGridTableViewRemark: TcxGridColumn;
    Label4: TLabel;
    NetAmtEdit: TcxCurrencyEdit;
    Label5: TLabel;
    DutyFreeAmtEdit: TcxCurrencyEdit;
    StyleRepository: TcxStyleRepository;
    StyleFontRed: TcxStyle;
    StyleFontBlue: TcxStyle;
    StyleEven: TcxStyle;
    StyleOdd: TcxStyle;
    StyleFontGray: TcxStyle;
    StyleFontBlackBold: TcxStyle;
    StyleFontRedBold: TcxStyle;
    StyleFocused: TcxStyle;
    StyleHighlight: TcxStyle;
    procedure SearchButtonClick(Sender: TObject);
    procedure SaleGridTableViewCheckPropertiesEditValueChanged(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure SaleGridTableViewCheckHeaderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FromDateEditPropertiesEditValueChanged(Sender: TObject);
    procedure ToDateEditPropertiesEditValueChanged(Sender: TObject);
    procedure ReceiveAmtEditPropertiesEditValueChanged(Sender: TObject);
    procedure SaleGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    isWork :Boolean;
  public
    TrdCode,
    SQLText,
    SQLText1 :String;
    NetAmt,
    DutyfreeAmt : Currency;
  end;

var
  MemberReceivePopupForm: TMemberReceivePopupForm;

implementation
uses DBModule, Common;
{$R *.dfm}

procedure TMemberReceivePopupForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMemberReceivePopupForm.FormCreate(Sender: TObject);
begin
  isWork := False;
end;

procedure TMemberReceivePopupForm.FromDateEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if ToDateEdit.Date < FromDateEdit.Date then
    ToDateEdit.Date := FromDateEdit.Date;
end;

procedure TMemberReceivePopupForm.OKButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  try
    Screen.Cursor := crSQLWait;
    Application.ProcessMessages;
    DM.BeginTrans;
    //이전에 작업중인 내역을 모두 초기화한다
    DM.Query.Close;
    DM.Query.SQL.Text :='update SL_SALE_H set NO_ACCT_REF ='''' '
                       +' where CD_STORE =:P0 '
                       +'   and Isnull(NO_ACCT_REF,'''') = :P1 ';
    DM.Query.ParamByName('P0').Value := StoreCode;
    DM.Query.ParamByName('P1').Value := UserCode+TrdCode;
    DM.Query.ExecSQL;
    DM.Query.Close;
    DM.Query.SQL.Text :='update SL_ACCT set NO_ACCT_REF ='''' '
                       +' where CD_STORE =:P0 '
                       +'   and Isnull(NO_ACCT_REF,'''') = :P1 ';
    DM.Query.ParamByName('P0').Value := StoreCode;
    DM.Query.ParamByName('P1').Value := UserCode+TrdCode;
    DM.Query.ExecSQL;

    //입급등록에서 저장 시 결제를 확정하기 위함(NO_ACCT_REF에 거래처코드를 넣는다)
    for vIndex := 0 to SaleGridTableView.DataController.RecordCount-1 do
    begin
      if (SaleGridTableView.DataController.Values[vIndex, 0] = '1') and (SaleGridTableView.DataController.Values[vIndex, 2] <> '자투리') then
      begin
        DM.Query.Close;
        DM.Query.SQL.Text :='update SL_SALE_H set NO_ACCT_REF =:P4 '
                           +' where CD_STORE =:P0 '
                           +'   and YMD_SALE =:P1 '
                           +'   and NO_POS   =:P2 '
                           +'   and NO_RCP   =:P3 ';
        DM.Query.ParamByName('P0').Value := StoreCode;
        DM.Query.ParamByName('P1').Value := GetOnlyNumber(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewSaleDate.Index]);
        DM.Query.ParamByName('P2').Value := LeftStr(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewBillNo.Index],2);
        DM.Query.ParamByName('P3').Value := RightStr(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewBillNo.Index],4);
        DM.Query.ParamByName('P4').Value := UserCode+TrdCode;
        DM.Query.ExecSQL;
      end
      else if (SaleGridTableView.DataController.Values[vIndex, 0] = '1') and (SaleGridTableView.DataController.Values[vIndex, 2] = '자투리') then
      begin
        DM.Query.Close;
        DM.Query.SQL.Text :='update SL_ACCT set NO_ACCT_REF =:P3 '
                           +' where CD_STORE  =:P0 '
                           +'   and YMD_OCCUR =:P1 '
                           +'   and NO_ACCT   =:P2 ';
        DM.Query.ParamByName('P0').Value := StoreCode;
        DM.Query.ParamByName('P1').Value := GetOnlyNumber(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewSaleDate.Index]);
        DM.Query.ParamByName('P2').Value := SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewRemark.Index];
        DM.Query.ParamByName('P3').Value := UserCode+TrdCode;
        DM.Query.ExecSQL;
      end;
    end;

    //자투리금액을 면,과세 비율로 배분한다
    RemnantsAmtEdit.Value := TotalAmtEdit.Value -  ReceiveAmtEdit.Value;

    if RemnantsAmtEdit.value <> 0 then
    begin
      NetAmt      := NetAmt / TotalAmtEdit.Value * RemnantsAmtEdit.Value;
      DutyFreeAmt := RemnantsAmtEdit.value - NetAmt;
    end
    else
    begin
      NetAmt      := 0;
      DutyFreeAmt := 0;
    end;

    DM.CommitTrans;
  except
    on E: Exception do
    begin
      DM.RollbackTrans;
      ErrBox(E.Message);
      Exit;
    end;
  end;
  Screen.Cursor := crDefault;
  ModalResult := mrOK;
end;

procedure TMemberReceivePopupForm.ReceiveAmtEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  RemnantsAmtEdit.Value := TotalAmtEdit.Value -  ReceiveAmtEdit.Value;

  if ReceiveAmtEdit.value <> 0 then
  begin
    NetAmtEdit.Value      := NetAmt / TotalAmtEdit.Value * ReceiveAmtEdit.value;
    DutyFreeAmtEdit.Value := ReceiveAmtEdit.value - NetAmtEdit.Value;
  end
  else
  begin
    NetAmtEdit.Value      := 0;
    DutyFreeAmtEdit.Value := 0;
  end;
end;

procedure TMemberReceivePopupForm.SaleGridTableViewCheckHeaderClick(
  Sender: TObject);
var vIndex :Integer;
begin
  if SaleGridTableViewCheck.Tag = 0 then
    SaleGridTableViewCheck.Tag := 1
  else
    SaleGridTableViewCheck.Tag := 0;

  try
    isWork := True;
    for vIndex := 0 to SaleGridTableView.DataController.RowCount-1 do
      SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewCheck.Index] := IntToStr(SaleGridTableViewCheck.Tag);
  finally
    isWork := False;
    SaleGridTableViewCheckPropertiesEditValueChanged(nil);
  end;

end;

procedure TMemberReceivePopupForm.SaleGridTableViewCheckPropertiesEditValueChanged(
  Sender: TObject);
var
   vIndex: Integer;
begin
  inherited;
  if isWork then Exit;

  TotalAmtEdit.Value := 0;
  NetAmt             := 0;
  DutyfreeAmt        := 0;
  SaleGridTableView.DataController.Post;
  for vIndex := 0 to SaleGridTableView.DataController.RecordCount-1 do
    if SaleGridTableView.DataController.Values[vIndex, 0] = '1' then
    begin
      TotalAmtEdit.Value := TotalAmtEdit.Value + SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridTrustAmt.Index];
      NetAmt             := NetAmt             + SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridNetAmt.Index];
      DutyfreeAmt        := DutyfreeAmt        + SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridDutyFreeAmt.Index];
    end;

  ReceiveAmtEdit.Value := TotalAmtEdit.Value;
  OKButton.Enabled := TotalAmtEdit.Value > 0;
end;

procedure TMemberReceivePopupForm.SaleGridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.Values[2] = '자투리' then AStyle := StyleFontRed;

end;

procedure TMemberReceivePopupForm.SearchButtonClick(Sender: TObject);
begin
  DM.Query.Close;
  DM.Query.SQL.Text := SQLText;
  if not ConditionAllCheckBox.Checked then
    DM.Query.SQL.Text := DM.Query.SQL.Text + '  and YMD_SALE between :P2 and :P3 ';

  DM.Query.SQL.Text := DM.Query.SQL.Text +
                       SQLText1 + ' order by 2,3 ';

  DM.Query.Params[0].Value := StoreCode;
  DM.Query.Params[1].Value := UserCode+TrdCode;
  if not ConditionAllCheckBox.Checked then
  begin
    DM.Query.Params[2].Value := DtoS(FromDateEdit.Date);
    DM.Query.Params[3].Value := DtoS(toDateEdit.Date);
  end;
  DM.Query.Open;

  if not DM.ReadQuery(DM.Query, SaleGridTableView) then
    MsgBox(msgNoSearchData);
end;

procedure TMemberReceivePopupForm.ToDateEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if FromDateEdit.Date > ToDateEdit.Date then
    FromDateEdit.Date := ToDateEdit.Date;
end;

end.
