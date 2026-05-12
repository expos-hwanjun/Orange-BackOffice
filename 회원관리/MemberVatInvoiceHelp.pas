unit MemberVatInvoiceHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxCheckBox,
  cxContainer, Menus, StdCtrls, cxButtons, cxDropDownEdit, cxCheckComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar, cxLabel, ExtCtrls, AdvSplitter,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCurrencyEdit, Math, StrUtils, DateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TMemberVatInvoiceHelpForm = class(TForm)
    GridPanel: TPanel;
    Grid: TcxGrid;
    CompanyGridTableView: TcxGridTableView;
    CompanyGridTableViewCompanyCode: TcxGridColumn;
    CompanyGridTableViewCompanyName: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridSplitter: TAdvSplitter;
    MainPanel: TPanel;
    AcctGrid: TcxGrid;
    AcctGridTableView: TcxGridTableView;
    AcctGridTableViewAcctDate: TcxGridColumn;
    AcctGridTableViewBillNo: TcxGridColumn;
    AcctGridTableViewCheck: TcxGridColumn;
    AcctGridTableViewAcctAmt: TcxGridColumn;
    AcctGridTableViewColumn4: TcxGridColumn;
    AcctGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    Panel2: TPanel;
    SaleGrid: TcxGrid;
    SaleGridTableView: TcxGridTableView;
    SaleGridTableViewSaleDate: TcxGridColumn;
    SaleGridTableViewBillNo: TcxGridColumn;
    SaleGridTableViewCheck: TcxGridColumn;
    SaleGridTableGridSaleAmt: TcxGridColumn;
    SaleGridTableGridCashAmt: TcxGridColumn;
    SaleGridTableGridCashRcpAmt: TcxGridColumn;
    SaleGridTableGridCardAmt: TcxGridColumn;
    SaleGridTableGridTrustAmt: TcxGridColumn;
    SaleGridTableGridGiftAmt: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
    StyleFontRed: TcxStyle;
    StyleFontBlue: TcxStyle;
    StyleEven: TcxStyle;
    StyleOdd: TcxStyle;
    StyleFontGray: TcxStyle;
    StyleFontBlackBold: TcxStyle;
    StyleFontRedBold: TcxStyle;
    Panel3: TPanel;
    EditStyleController: TcxEditStyleController;
    ConditionToolBarDateLabel: TcxLabel;
    ConditionToolBarFromDateEdit: TcxDateEdit;
    ConditionToolBarDateToLabel: TcxLabel;
    ConditionToolBarToDateEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    ConditionToolBarEdit: TcxTextEdit;
    ConditionToolBarEditLabel: TcxLabel;
    ConditionDsTrdCheckComboBox: TcxCheckComboBox;
    SearchButton: TcxButton;
    ConfirmButton: TcxButton;
    CloseButton: TcxButton;
    SaleGridTableGridTMoneyAmt: TcxGridColumn;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    TotalAmtEdit: TcxCurrencyEdit;
    cxLabel4: TcxLabel;
    SaleTotalAmtEdit: TcxCurrencyEdit;
    AcctTotalAmtEdit: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    AcctGridTableViewColumn2: TcxGridColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure CompanyGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure CloseButtonClick(Sender: TObject);
    procedure SaleGridTableViewCheckHeaderClick(Sender: TObject);
    procedure AcctGridTableViewCheckHeaderClick(Sender: TObject);
    procedure SaleGridTableViewCheckPropertiesEditValueChanged(Sender: TObject);
    procedure AcctGridTableViewCheckPropertiesEditValueChanged(Sender: TObject);
    procedure ConfirmButtonClick(Sender: TObject);
  private
    function GetActiveControl: TWinControl;
  public
    TaxGubun    :String;
    TempNumber  :String;
  end;

var
  MemberVatInvoiceHelpForm: TMemberVatInvoiceHelpForm;

implementation
uses Common, DBModule;
{$R *.dfm}



procedure TMemberVatInvoiceHelpForm.FormCreate(Sender: TObject);
var vIndex :Integer;
begin
  ConditionToolBarFromDateEdit.Date := StartOfTheMonth(Date);
  ConditionToolBarToDateEdit.Date   := Now();

  for vIndex := 0 to ConditionDsTrdCheckComboBox.Properties.Items.Count - 1 do
  begin
    case vIndex of
      0 : ConditionDsTrdCheckComboBox.SetItemState(vIndex, cbsChecked);
      1 : ConditionDsTrdCheckComboBox.SetItemState(vIndex, cbsUnChecked);
      2 : ConditionDsTrdCheckComboBox.SetItemState(vIndex, cbsUnChecked);
      3 : ConditionDsTrdCheckComboBox.SetItemState(vIndex, cbsChecked);
      4 : ConditionDsTrdCheckComboBox.SetItemState(vIndex, cbsChecked);
      5 : ConditionDsTrdCheckComboBox.SetItemState(vIndex, cbsChecked);
    end;
  end;
end;

procedure TMemberVatInvoiceHelpForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // 메모, 그리드, 트리가 아니면 포커스 이동 키보드 이벤트를 타게 한다
  if (GetActiveControl <> nil) and
     (not (GetActiveControl is TcxGridSite)) and
     ((GetActiveControl.Parent <> nil) and (not (GetActiveControl.Parent is TcxGridSite))) and
     ((GetActiveControl.Parent <> nil) and (GetActiveControl.Parent.Parent <> nil) and (not (GetActiveControl.Parent.Parent is TcxGridSite))) then
    case Key of
      VK_Return,
      VK_Down   : SelectNext(TWinControl(ActiveControl), true,  true);
      VK_Up     : SelectNext(TWinControl(ActiveControl), false, true);
    end;
end;

//------------------------------------------------------------------------------
// 현재 활성화 된 컨트롤 리턴
function TMemberVatInvoiceHelpForm.GetActiveControl: TWinControl;
begin
  if Supports(ActiveControl, IcxInnerEditHelper) or Supports(ActiveControl, IcxContainerInnerControl) then
    Result := TcxCustomEdit(ActiveControl.Owner)
  else if ActiveControl is TcxCustomEdit then
    Result := TcxCustomEdit(ActiveControl)
  else
    Result := ActiveControl;
end;

procedure TMemberVatInvoiceHelpForm.SearchButtonClick(Sender: TObject);
begin
  try
    SaleGridTableView.DataController.RecordCount := 0;
    DM.OpenQuery('select CD_MEMBER, '
                +'       dbo.Decrypt(NM_MEMBER, 5869, 29486, 4921) as NM_MEMBER '
                +'from   MS_MEMBER '
                +'where  CD_STORE =:P0 '
                +'  and  DS_STATUS =0 '
                +'  and  MEMBER_TYPE  = ''T'' '
                +'  and  (CD_MEMBER =:P1 or dbo.Decrypt(NM_MEMBER, 5869, 29486, 4921) like ''%''+:P1+''%'') '
                +'order by CD_MEMBER ',
                [Ifthen(GetOption(257)='0', StoreCode,'0000'),
                 ConditionToolBarEdit.Text]);
    MainPanel.Enabled := DM.ReadQuery(Query, CompanyGridTableView);
    CompanyGridTableView.DataController.FocusedRowIndex := 0;
  finally
    DM.FinishQuery;
  end;
end;


procedure TMemberVatInvoiceHelpForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMemberVatInvoiceHelpForm.CompanyGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var vConditionWhere :String;
    vIndex :Integer;
begin
  if AFocusedRecord = nil then Exit;

  for vIndex := 0 to ConditionDsTrdCheckComboBox.Properties.Items.Count - 1 do
  begin
    if ConditionDsTrdCheckComboBox.GetItemState(vIndex) = cbsChecked then
    begin
      case vIndex of
        0 : vConditionWhere  := '     (AMT_CASH+AMT_CHECK) <> 0 ';
        1 : vConditionWhere  := vConditionWhere + Ifthen(vConditionWhere = '', '', ' or ') + ' AMT_CASHRCP <> 0 ' ;
        2 : vConditionWhere  := vConditionWhere + Ifthen(vConditionWhere = '', '', ' or ') + ' AMT_CARD    <> 0 ';
        3 : vConditionWhere  := vConditionWhere + Ifthen(vConditionWhere = '', '', ' or ') + ' AMT_TRUST   <> 0 ';
        4 : vConditionWhere  := vConditionWhere + Ifthen(vConditionWhere = '', '', ' or ') + ' AMT_GIFT    <> 0 ';
        5 : vConditionWhere  := vConditionWhere + Ifthen(vConditionWhere = '', '', ' or ') + ' AMT_TMONEY  <> 0 ';
      end;
    end;
  end;

  if vConditionWhere <> '' then
    vConditionWhere := ' and ( '+vConditionWhere+' ) ';


  try
    DM.OpenQuery('select dbo.StoD(YMD_SALE) as YMD_SALE, '
                +'       NO_POS+''-''+ NO_RCP as NO_BILL, '
                +'       ''0'' as YN_CHECK, '
                +'       AMT_DUTY + AMT_TAX as AMT_SALE, '
                +'       (AMT_CASH+AMT_CHECK) / (AMT_DUTY + AMT_TAX) * (AMT_CASH+AMT_CHECK) as AMT_CASH, '
                +'       AMT_CASHRCP          / (AMT_DUTY + AMT_TAX) * AMT_CASHRCP          as AMT_CASHRCP, '
                +'       AMT_CARD             / (AMT_DUTY + AMT_TAX) * AMT_CARD             as AMT_CARD, '
                +'       AMT_TRUST            / (AMT_DUTY + AMT_TAX) * AMT_TRUST            as AMT_TRUST, '
                +'       AMT_GIFT             / (AMT_DUTY + AMT_TAX) * AMT_GIFT             as AMT_GIFT '
                +'from   SL_SALE_H '
                +'where  CD_STORE = :P0 '
                +'  and  DS_SALE  <> ''V'' '
                +Ifthen(TaxGubun='S',' and  AMT_TAX  <> 0 ', ' and AMT_DUTYFREE <> 0 ')
                +'  and  YMD_SALE Between :P1 AND :P2 '
                +'  and  (Isnull(NO_TAX_REF,'''') = '''' or Isnull(NO_NOTAX_REF,'''') ='''') '
                +'  and  CD_MEMBER =:P3 '
                +vConditionWhere
                +'order by YMD_SALE, NO_POS, NO_RCP ',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  DtoS(ConditionToolBarToDateEdit.Date),
                  AFocusedRecord.Values[0]]);
    DM.ReadQuery(Query, SaleGridTableView);
  finally
    DM.FinishQuery;
  end;

  try
    DM.OpenQuery('select dbo.StoD(YMD_OCCUR) as YMD_OCCUR, '
                +'       NO_ACCT, '
                +'       ''0'' as YN_CHECK, '
                +'       AMT_PAYIN, '
                +'       case DS_ACCT when ''0'' then ''현금'' when ''1'' then ''카드'' when ''2'' then ''현금영수증''  end as DS_ACCT, '
                +'       REMARK '
                +'from   SL_ACCT '
                +'where  CD_STORE = :P0 '
                +'  and  YMD_OCCUR Between :P1 AND :P2 '
                +'  and  CD_MEMBER =:P3 '
                +'  and  Isnull(NO_TAX_REF,'''') = '''' '
                +'order by YMD_OCCUR, NO_ACCT ',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  DtoS(ConditionToolBarToDateEdit.Date),
                  AFocusedRecord.Values[0]]);
    DM.ReadQuery(Query, AcctGridTableView);
  finally
    DM.FinishQuery;
  end;
end;

//확인버튼 클릭 시
procedure TMemberVatInvoiceHelpForm.ConfirmButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  if TotalAmtEdit.Value = 0 then
  begin
    MsgBox('발행할 금액이 없습니다.');
    Exit;
  end;

  try
    DM.BeginTrans;
    for vIndex := 0 to SaleGridTableView.DataController.RowCount-1 do
    begin
      if SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewCheck.Index] = '1'  then
      begin
        DM.ExecQuery('update SL_SALE_H set '+Ifthen(TaxGubun='S', 'NO_TAX_REF=:P4 ', 'NO_NOTAX_REF=:P4 ')
                 +'where CD_STORE =:P0 '
                 +'  and YMD_SALE =:P1 '
                 +'  and NO_POS   =:P2 '
                 +'  and NO_RCP   =:P3 ',
                 [StoreCode,
                  GetOnlyNumber(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewSaleDate.Index]),
                  LeftStr(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewBillNo.Index],2),
                  RightStr(SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewBillNo.Index],4),
                  TempNumber], false);
      end
    end;

    for vIndex := 0 to AcctGridTableView.DataController.RowCount-1 do
    begin
      if AcctGridTableView.DataController.Values[vIndex, AcctGridTableViewCheck.Index] = '1'  then
      begin
        DM.ExecQuery('update SL_ACCT set '+Ifthen(TaxGubun='S', 'NO_TAX_REF=:P3 ', 'NO_NOTAX_REF=:P3 ')
                 +'where CD_STORE =:P0 '
                 +'  and YMD_OCCUR =:P1 '
                 +'  and NO_ACCT   =:P2 ',
                 [StoreCode,
                  GetOnlyNumber(AcctGridTableView.DataController.Values[vIndex, AcctGridTableViewAcctDate.Index]),
                  AcctGridTableView.DataController.Values[vIndex, AcctGridTableViewBillNo.Index],
                  TempNumber], false);
      end
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
  ModalResult := mrOK;
end;

//판매내역 그리드에 발행 타이틀 클릭 시
procedure TMemberVatInvoiceHelpForm.SaleGridTableViewCheckHeaderClick(Sender: TObject);
var vIndex :Integer;
begin
  SaleGridTableView.DataController.BeginUpdate;
  for vIndex := 0 to SaleGridTableView.DataController.RowCount-1 do
  begin
    SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewCheck.Index] := Ifthen(SaleGridTableViewCheck.Tag=0,'1','0');
  end;
  SaleGridTableViewCheck.Tag := Ifthen(SaleGridTableViewCheck.Tag=0,1,0);
  SaleGridTableView.DataController.EndUpdate;
  SaleGridTableViewCheckPropertiesEditValueChanged(nil);
end;


//입금내역 그리드에 발행 타이틀 클릭 시
procedure TMemberVatInvoiceHelpForm.AcctGridTableViewCheckHeaderClick(
  Sender: TObject);
var vIndex :Integer;
begin
  AcctGridTableView.DataController.BeginUpdate;
  for vIndex := 0 to AcctGridTableView.DataController.RowCount-1 do
  begin
    AcctGridTableView.DataController.Values[vIndex, AcctGridTableViewCheck.Index] := Ifthen(AcctGridTableViewCheck.Tag=0,'1','0');
  end;
  AcctGridTableViewCheck.Tag := Ifthen(AcctGridTableViewCheck.Tag=0,1,0);
  AcctGridTableView.DataController.EndUpdate;

  AcctGridTableViewCheckPropertiesEditValueChanged(nil);
end;

procedure TMemberVatInvoiceHelpForm.SaleGridTableViewCheckPropertiesEditValueChanged(
  Sender: TObject);
var vIndex :Integer;
begin
  SaleTotalAmtEdit.Value := 0;
  SaleGridTableView.DataController.PostEditingData;
  for vIndex := 0 to SaleGridTableView.DataController.RowCount-1 do
  begin
    if SaleGridTableView.DataController.Values[vIndex, SaleGridTableViewCheck.Index] = '1'  then
      SaleTotalAmtEdit.Value := SaleTotalAmtEdit.Value + NVL(SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridCashAmt.Index],0)
                                                       + NVL(SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridCashRcpAmt.Index],0)
                                                       + NVL(SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridCardAmt.Index],0)
                                                       + NVL(SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridTrustAmt.Index],0)
                                                       + NVL(SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridGiftAmt.Index],0)
                                                       + NVL(SaleGridTableView.DataController.Values[vIndex, SaleGridTableGridTMoneyAmt.Index],0);
  end;
  TotalAmtEdit.Value := SaleTotalAmtEdit.Value + AcctTotalAmtEdit.Value;
end;

procedure TMemberVatInvoiceHelpForm.AcctGridTableViewCheckPropertiesEditValueChanged(
  Sender: TObject);
var vIndex :Integer;
begin
  AcctTotalAmtEdit.Value := 0;
  AcctGridTableView.DataController.PostEditingData;
  for vIndex := 0 to AcctGridTableView.DataController.RowCount-1 do
  begin
    if AcctGridTableView.DataController.Values[vIndex, AcctGridTableViewCheck.Index] = '1'  then
      AcctTotalAmtEdit.Value := AcctTotalAmtEdit.Value + NVL(AcctGridTableView.DataController.Values[vIndex, AcctGridTableViewAcctAmt.Index],0);
  end;

  TotalAmtEdit.Value := SaleTotalAmtEdit.Value + AcctTotalAmtEdit.Value;
end;

end.
