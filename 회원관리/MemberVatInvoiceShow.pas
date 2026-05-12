unit MemberVatInvoiceShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, Menus, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  cxContainer, Uni, DB, MemDS, ImgList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSFillPatterns, MaskUtils,
  frxClass, StrUtils, dxPSPDFExportCore, cxDrawTextUtils, dxPSCompsProvider,
  dxPSEdgePatterns, dxPSPDFExport, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  DBAccess;

type
  TMemberVatInvoiceShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewDate: TcxGridBandedColumn;
    GridBandedTableViewTaxNo: TcxGridBandedColumn;
    GridBandedTableViewBillNo: TcxGridBandedColumn;
    GridBandedTableViewApprovalNo: TcxGridBandedColumn;
    GridBandedTableViewCompanyName: TcxGridBandedColumn;
    GridBandedTableViewBizNo: TcxGridBandedColumn;
    GridBandedTableViewCeo: TcxGridBandedColumn;
    GridBandedTableViewUptae: TcxGridBandedColumn;
    GridBandedTableViewJongMok: TcxGridBandedColumn;
    GridBandedTableViewNetAmt: TcxGridBandedColumn;
    GridBandedTableViewTaxAmt: TcxGridBandedColumn;
    GridBandedTableViewTotalAmt: TcxGridBandedColumn;
    GridBandedTableViewStatus: TcxGridBandedColumn;
    GridBandedTableViewAddress: TcxGridBandedColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    FastReportDataSet: TfrxUserDataSet;
    GridBandedTableViewType: TcxGridBandedColumn;
    ConditionToolBar1ComboBox: TcxComboBox;
    GridBandedTableViewEMail: TcxGridBandedColumn;
    GridBandedTableViewTelNo: TcxGridBandedColumn;
    GridBandedTableViewYnDelete: TcxGridBandedColumn;
    ButtonToolBarEMailButton: TAdvGlowButton;
    ConditionToolBar2ComboBox: TcxComboBox;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewColumn12: TcxGridColumn;
    GridTableViewColumn13: TcxGridColumn;
    GridTableViewColumn14: TcxGridColumn;
    GridTableViewColumn15: TcxGridColumn;
    GridTableViewColumn16: TcxGridColumn;
    GridTableViewColumn17: TcxGridColumn;
    GridBandedTableViewProviderBizNo: TcxGridBandedColumn;
    GridBandedTableViewProviderCompany: TcxGridBandedColumn;
    GridBandedTableViewProviderCeo: TcxGridBandedColumn;
    GridBandedTableViewProviderUptae: TcxGridBandedColumn;
    GridBandedTableViewProviderJonmok: TcxGridBandedColumn;
    GridBandedTableViewProviderAddress: TcxGridBandedColumn;
    GridTableViewColumn18: TcxGridColumn;
    GridTableViewColumn19: TcxGridColumn;
    GridTableViewColumn20: TcxGridColumn;
    GridTableViewColumn21: TcxGridColumn;
    GridTableViewColumn22: TcxGridColumn;
    GridTableViewColumn23: TcxGridColumn;
    GridTableViewColumn24: TcxGridColumn;
    GridTableViewColumn25: TcxGridColumn;
    GridTableViewColumn26: TcxGridColumn;
    GridTableViewColumn27: TcxGridColumn;
    GridTableViewColumn28: TcxGridColumn;
    GridTableViewColumn29: TcxGridColumn;
    GridTableViewColumn30: TcxGridColumn;
    GridTableViewColumn31: TcxGridColumn;
    GridTableViewColumn32: TcxGridColumn;
    GridTableViewColumn33: TcxGridColumn;
    GridTableViewColumn34: TcxGridColumn;
    GridTableViewColumn35: TcxGridColumn;
    GridTableViewColumn36: TcxGridColumn;
    GridTableViewColumn37: TcxGridColumn;
    GridTableViewColumn38: TcxGridColumn;
    GridTableViewColumn39: TcxGridColumn;
    GridTableViewColumn40: TcxGridColumn;
    GridTableViewColumn41: TcxGridColumn;
    GridTableViewColumn42: TcxGridColumn;
    GridTableViewColumn43: TcxGridColumn;
    GridTableViewColumn44: TcxGridColumn;
    ButtonToolBarPrintButtonPopupMenuTax: TMenuItem;
    GridTableViewColumn45: TcxGridColumn;
    GridBandedTableViewDsInvoice: TcxGridBandedColumn;
    ReceiveReport: TfrxReport;
    ProviderReport: TfrxReport;
    cxLabel1: TcxLabel;
    ConditionPrintComboBox: TcxComboBox;
    AllFastReport: TfrxReport;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Date: TcxGridColumn;
    GridTableView1BillNo: TcxGridColumn;
    GridTableView1TaxType: TcxGridColumn;
    GridTableView1CompanyCode: TcxGridColumn;
    GridTableView1CompanyName: TcxGridColumn;
    GridTableView1NetAmt: TcxGridColumn;
    GridTableView1TaxAmt: TcxGridColumn;
    GridTableView1TotalAmt: TcxGridColumn;
    GridTableView1BizNo: TcxGridColumn;
    GridTableView1Uptae: TcxGridColumn;
    GridTableView1JongMok: TcxGridColumn;
    GridTableView1Addr: TcxGridColumn;
    GridTableView1EMail: TcxGridColumn;
    GridTableView1Column14: TcxGridColumn;
    GridTableView1DsInvoice: TcxGridColumn;
    GridTableView1Status: TcxGridColumn;
    GridTableView1Ceo: TcxGridColumn;
    GridTableView1Item: TcxGridColumn;
    procedure GridBandedTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarEMailButtonClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuTaxClick(Sender: TObject);
    procedure FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure GridTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    procedure Print(aPrint: Boolean = true);
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberVatInvoiceShowForm: TMemberVatInvoiceShowForm;



implementation

uses
  Common, DBModule, eTax;

{$R *.dfm}

procedure TMemberVatInvoiceShowForm.FastReportDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportDataSet.RecNo >= GridTableView.DataController.RecordCount;
end;

procedure TMemberVatInvoiceShowForm.FastReportDataSetNewGetValue(
  Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.ColumnCount-1 do
    if GridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := GridTableView.DataController.Values[FastReportDataSet.RecNo, vIndex];
      break;
    end;
end;

procedure TMemberVatInvoiceShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  if GetOption(123) = '0' then
  begin
    ButtonToolBarEMailButton.Visible  := false;
    ConditionToolBar2ComboBox.Visible := false;
    ConditionToolBar1ComboBox.Visible := false;
    cxLabel1.Visible                  := false;
    ConditionPrintComboBox.Visible    := false;
    ConditionToolBarEdit.Visible      := true;
    ConditionToolBarEdit.Width        := 150;
    GridLevel.Visible                 := false;
    GridLevel1.Visible                := true;
    ButtonToolBarSearchButton.Left    := ButtonToolBarEMailButton.Left + 30;
    ButtonToolBar.Refresh;
  end;
end;

procedure TMemberVatInvoiceShowForm.ButtonToolBarDeleteButtonClick(
  Sender: TObject);
var vConditionSql,
    vConditionWhere :String;
begin
  inherited;

  if GetOption(123) = '1' then
  begin
    if not AskBox(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewBillNo.Index]+'를 폐기하시겠습니까?') then
       Exit;

    try
      ChangeETaxData(Replace(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewBillNo.Index],'-',''),
                     3,
                     false,
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     '',
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     '',
                     '',
                     '',
                     '');
      BeginTrans;
      if GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewTaxNo.Index] = '세금계산서' then
      begin
        vConditionSql   := 'NO_TAX_REF = '''' ';
        vConditionWhere := 'and NO_TAX_REF =:P1 ';
      end
      else
      begin
        vConditionSql   := 'NO_NOTAX_REF = '''' ';
        vConditionWhere := 'and NO_NOTAX_REF =:P1 ';
      end;

      ExecQuery('update SL_SALE_H set '+ vConditionSql
               +' where CD_STORE =:P0 '
               +vConditionWhere,
               [StoreCode,
                GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1Date.Index])+
                GetOnlyNumber(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewBillNo.Index])],
                false);
      CommitTrans;
      GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStatus.Index] := '폐기';
      ButtonToolBarDeleteButton.Enabled := false;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
      end;
    end;
  end
  else  //전자세금계산서 사용안할때
  begin
    if not AskBox(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1BillNo.Index]+'를 폐기하시겠습니까?') then
       Exit;

    BeginTrans;
    try
      ExecQuery('update SL_TAX set DS_STATUS = 1 '
               +' where CD_STORE =:P0 '
               +'   and YMD_TAX  =:P1 '
               +'   and NO_TAX   =:P2 ',
               [StoreCode,
                GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1Date.Index]),
                GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1BillNo.Index])],
                false);

      if GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1TaxType.Index] = '세금계산서' then
      begin
        vConditionSql   := 'NO_TAX_REF = '''' ';
        vConditionWhere := 'and NO_TAX_REF =:P1 ';
      end
      else
      begin
        vConditionSql   := 'NO_NOTAX_REF = '''' ';
        vConditionWhere := 'and NO_NOTAX_REF =:P1 ';
      end;

      ExecQuery('update SL_SALE_H set '+ vConditionSql
               +' where CD_STORE =:P0 '
               +vConditionWhere,
               [StoreCode,
                GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1Date.Index])+
                GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1BillNo.Index])],
                false);
      CommitTrans;
      GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1Status.Index] := '폐기';
      ButtonToolBarDeleteButton.Enabled := false;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
      end;
    end;
  end;
end;

procedure TMemberVatInvoiceShowForm.ButtonToolBarEMailButtonClick(
  Sender: TObject);
begin
  inherited;
  if GridBandedTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

  ChangeETaxData(Replace(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewBillNo.Index],'-',''),
                 2,
                 false,
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewEMail.Index],
                 '',
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 '',
                 '',
                 '',
                 '');
end;

procedure TMemberVatInvoiceShowForm.ButtonToolBarPrintButtonPopupMenuTaxClick(
  Sender: TObject);
begin
  inherited;
  Print(false);
end;

function TMemberVatInvoiceShowForm.DoSearch:Boolean;
var vRow, vCol, vCondition :Integer;
    vRecords   :TStringList;
    vColumns   :TStringList;
begin
  inherited;
  if GetOption(123) = '1' then
  begin
    GridBandedTableView.DataController.RecordCount := 0;
    ButtonToolBarEMailButton.Enabled := false;
    ButtonToolBarPrintButton.Enabled := false;
    case ConditionToolBar1ComboBox.ItemIndex of
      0 : vCondition := $0117;
      1 : vCondition := $0004;
      2 : vCondition := $0010;
      3 : vCondition := $0020;
      4 : vCondition := $0100;
      5 : vCondition := $0040;
      else vCondition := $FFFF;
    end;

    vRecords := GetETaxDatas(CustomerNo, DtoS(ConditionToolBarFromDateEdit.Date), DtoS(ConditionToolBarToDateEdit.Date), ConditionToolBarComboBox.ItemIndex+1, ConditionToolBar2ComboBox.ItemIndex,  vCondition, '', ConditionToolBarEdit.Text);

    if vRecords <> nil then
    begin
      ButtonToolBarEMailButton.Enabled := true;
      ButtonToolBarPrintButton.Enabled := true;
      vColumns := TStringList.Create;
      try
        for vRow := 0 to vRecords.Count-1 do
        begin
          Split(vRecords[vRow], splitColumn, vColumns);
          GridBandedTableView.DataController.AppendRecord;
          for vCol := 0 to vColumns.Count-1 do
          begin
            if vColumns[42] = '매출' then
            begin
              case vCol of
               31 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewDate.Index]       := FormatMaskText('!0000-00-00;0; ',       vColumns[vCol]) ;
                0 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewBillNo.Index]     := FormatMaskText('!00000000-0000000;0; ', vColumns[vCol]) ;
                1 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTaxNo.Index]      := vColumns[vCol];
                5 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewStatus.Index]     := vColumns[vCol];
                6 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewDsInvoice.Index]  := vColumns[vCol];
               42 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewType.Index]       := vColumns[vCol];
               41 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewApprovalNo.Index] := vColumns[vCol];
               22 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewCompanyName.Index]:= vColumns[vCol];
               34 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewNetAmt.Index]     := vColumns[vCol];
               35 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTaxAmt.Index]     := vColumns[vCol];
               33 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTotalAmt.Index]   := vColumns[vCol];
               20 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewBizNo.Index]      := Copy(Replace(vColumns[vCol],'-',''),1,3)+'-'+Copy(Replace(vColumns[vCol],'-',''),4,2)+'-'+Copy(Replace(vColumns[vCol],'-',''),6,5);
               23 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewCeo.Index]        := vColumns[vCol];
               26 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewUptae.Index]      := vColumns[vCol];
               25 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewJongMok.Index]    := vColumns[vCol];
               29 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewEMail.Index]      := vColumns[vCol];
               30 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTelNo.Index]      := GetPhoneNo(vColumns[vCol]);
               24 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewAddress.Index]    := vColumns[vCol];
                3 :
                begin
                  if (vColumns[vCol] = 'DS10') or (vColumns[vCol] = 'DS15') or (vColumns[vCol] = 'DS30') then
                    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewYnDelete.Index]    := 'Y'
                  else
                    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewYnDelete.Index]    := 'N';
                end;
                4 :
                begin
                  if vColumns[vCol] = '1' then
                    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewYnDelete.Index]    := 'N';
                end;
              end;
            end
            else  //매입
            begin
              case vCol of
               31 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewDate.Index]       := FormatMaskText('!0000-00-00;0; ',       vColumns[vCol]) ;
                0 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewBillNo.Index]     := FormatMaskText('!00000000-0000000;0; ', vColumns[vCol]) ;
                1 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTaxNo.Index]      := vColumns[vCol];
                5 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewStatus.Index]     := vColumns[vCol];
                6 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewDsInvoice.Index]  := vColumns[vCol];
               42 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewType.Index]       := vColumns[vCol];
               41 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewApprovalNo.Index] := vColumns[vCol];
               11 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewCompanyName.Index]:= vColumns[vCol];
               34 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewNetAmt.Index]     := vColumns[vCol];
               35 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTaxAmt.Index]     := vColumns[vCol];
               33 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTotalAmt.Index]   := vColumns[vCol];
                9 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewBizNo.Index]      := FormatMaskText('!000-00-00000;0; ',    Replace(Trim(vColumns[vCol]),'-','')) ;
               12 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewCeo.Index]        := vColumns[vCol];
               25 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewUptae.Index]      := vColumns[vCol];
               24 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewJongMok.Index]    := vColumns[vCol];
               18 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewEMail.Index]      := vColumns[vCol];
               19 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTelNo.Index]      := GetPhoneNo(vColumns[vCol]);
               13 : GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewAddress.Index]    := vColumns[vCol];
              end;
            end;
          end;
        end;
      finally
        vRecords.Free;
        vColumns.Free;
      end;
    end;
    Result := true;
  end
  else
  begin
    OpenQuery('select dbo.StoD(YMD_TAX) as YMD_TAX, '
             +'       NO_TAX, '
             +'       CD_MEMBER, '
             +'       NM_MEMBER, '
             +'       NO_BIZER, '
             +'       NM_UPTAE, '
             +'       NM_JONGMOK, '
             +'       NM_BOSS, '
             +'       ADDR, '
             +'       EMAIL, '
             +'       MD_ITEM1, '
             +'       ITEM1, '
             +'       QTY_ITEM1, '
             +'       PRICE_ITEM1, '
             +'       AMT_NET, '
             +'       AMT_VAT, '
             +'       AMT_TOT, '
             +'       CASE WHEN DS_INVOICE = 0 THEN ''영수'' ELSE ''청구'' END AS DS_INVOICE, '
             +'       case when DS_STATUS=0 then ''정상'' else ''폐기'' end as DS_STATUS, '
             +'       CASE WHEN DS_TAX=0 THEN ''세금계산서'' ELSE ''계산서'' END AS DS_TAX '
             +'from   SL_TAX '
             +'where  CD_STORE =:P0 '
             +'  and  YMD_TAX  between :P1 and :P2 '
             +'  and  len(CD_MEMBER) = 10 '
             +Ifthen(ConditionToolBarComboBox.ItemIndex=2, '', '  and  DS_TAX   ='''+IntToStr(ConditionToolBarComboBox.ItemIndex)+'''')
             +'  and  (CD_MEMBER =:P3 or NM_MEMBER like ''%''+:P3+''%'') ',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarEdit.Text]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end;
end;

procedure TMemberVatInvoiceShowForm.GridBandedTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then Exit;
  ButtonToolBarDeleteButton.Enabled            := (GridBandedTableView.DataController.Values[AFocusedRecord.Index, GridBandedTableViewType.Index] = '매입') or (GridBandedTableView.DataController.Values[AFocusedRecord.Index, GridBandedTableViewYnDelete.Index] = 'Y');
  ButtonToolBarPrintButtonPopupMenuTax.Enabled := GridBandedTableView.DataController.Values[AFocusedRecord.Index, GridBandedTableViewType.Index] = '매출';
end;

procedure TMemberVatInvoiceShowForm.GridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then Exit;
  ButtonToolBarDeleteButton.Enabled            := GridTableView1.DataController.Values[AFocusedRecord.Index, GridTableView1Status.Index] = '정상';
  ButtonToolBarPrintButtonPopupMenuTax.Enabled := ButtonToolBarDeleteButton.Enabled;
end;

procedure TMemberVatInvoiceShowForm.Print(aPrint: Boolean);
var vRow, vIndex :Integer;
    vRecords   :TStringList;
    vColumns   :TStringList;
    vCeo, vUptae, vJongMok, vAddress :String;
    vMemo: TfrxMemoView;
begin

  GridTableView.DataController.RecordCount := 0;
  //공급자 정보
  try
    OpenQuery('select * from MS_STORE '
             +'where CD_STORE =:P0 ',
             [StoreCode]);

    vCeo       := Query.FieldByName('NM_BOSS').AsString;
    vUptae     := Query.FieldByName('NM_UPTAE').AsString;
    vJongMok   := Query.FieldByName('NM_UPJONG').AsString;
    vAddress   := Query.FieldByName('ADDR1').AsString + ' '+ Query.FieldByName('ADDR2').AsString;
  finally
    FinishQuery;
  end;

  //전자세금계산서기능을 사용할때
  if GetOption(123) = '1' then
  begin
    if GridBandedTableView.Controller.SelectedRowCount = 0 then Exit;
    for vIndex := 0 to GridBandedTableView.Controller.SelectedRowCount-1 do
    begin
      if GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewDsInvoice.Index] = '매입' then Continue;

      GridTableView.DataController.AppendRecord;
      //공급자정보
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewDate.Index];  //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1]   := FormatMaskText('!000-00-00000;0; ', Replace(BusinessNumber,'-','')); //사업자번호
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 2]   := vCeo;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 3]   := StoreName;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 4]   := vUptae;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 5]   := vJongMok;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 6]   := vAddress;

      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 43] := '이 금액을 '+Ifthen(GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewDsInvoice.Index]='01',' 영수 ',' 청구 ')+' 함.';
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 44]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewApprovalNo.Index];    //발행일자


      //공급받는자 정보
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1,  7]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewCompanyName.Index]; //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1,  8]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewBizNo.Index];       //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1,  9]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewCeo.Index];         //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 10]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewUptae.Index];       //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 11]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewJongMok.Index];     //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 12]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewAddress.Index];     //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 13]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewNetAmt.Index];      //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 14]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewTaxAmt.Index];      //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 15]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewTotalAmt.Index];    //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 16]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewEMail.Index];       //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 17]   := GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewTotalAmt.Index];    //발행일자

      //디테일항목 조회
      vRecords := TStringList.Create;
      vColumns := TStringList.Create;
      try
        vRecords := GetETaxDataItems(Replace(GridBandedTableView.Controller.SelectedRecords[vIndex].Values[GridBandedTableViewBillNo.Index],'-',''));

        if vRecords <> nil then
          for vRow := 0 to vRecords.Count-1 do
          begin
            Split(vRecords[vRow], splitColumn, vColumns);
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 17+(vRow*6)] := vColumns[1] +'/'+vColumns[2];
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 18+(vRow*6)] := vColumns[3];
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 19+(vRow*6)] := vColumns[5];
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 20+(vRow*6)] := vColumns[7];
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 21+(vRow*6)] := vColumns[8];
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 22+(vRow*6)] := vColumns[9];
          end;
      finally
        vRecords.free;
        vColumns.Free;
      end;
    end;
  end
  //전자세금계산서를 사용하지 않을때
  else
  begin
      // 세금계산서 타이틀
    case ConditionPrintComboBox.ItemIndex of
      0 :
      begin
        vMemo := TfrxMemoView(AllFastReport.FindObject('TaxTitle'));
        if Assigned(vMemo) then
          vMemo.Memo.Text := ' 세 금 계 산 서';

        vMemo := TfrxMemoView(AllFastReport.FindObject('TaxTitle2'));
        if Assigned(vMemo) then
          vMemo.Memo.Text := ' 세 금 계 산 서';
      end;
      1 :
      begin
        vMemo := TfrxMemoView(ReceiveReport.FindObject('TaxTitle'));
        if Assigned(vMemo) then
          vMemo.Memo.Text := ' 세 금 계 산 서';
      end;
      2 :
      begin
        vMemo := TfrxMemoView(ProviderReport.FindObject('TaxTitle'));
        if Assigned(vMemo) then
          vMemo.Memo.Text := ' 세 금 계 산 서';
      end;
    end;

    if GridTableView1.Controller.SelectedRowCount = 0 then Exit;
    for vIndex := 0 to GridTableView1.Controller.SelectedRowCount-1 do
    begin
      GridTableView.DataController.AppendRecord;
      //공급자정보
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1Date.Index];  //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1]   := FormatMaskText('!000-00-00000;0; ', Replace(BusinessNumber,'-','')); //사업자번호
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 2]   := vCeo;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 3]   := StoreName;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 4]   := vUptae;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 5]   := vJongMok;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 6]   := vAddress;

      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 43]  := '이 금액을 '+Ifthen(GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1DsInvoice.Index]='0',' 영수 ',' 청구 ')+' 함.';
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 44]   := ''; //승인번호


      //공급받는자 정보
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1,  7]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1CompanyName.Index]; //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1,  8]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1BizNo.Index];       //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1,  9]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1Ceo.Index];         //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 10]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1Uptae.Index];       //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 11]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1JongMok.Index];     //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 12]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1Addr.Index];     //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 13]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1NetAmt.Index];      //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 14]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1TaxAmt.Index];      //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 15]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1TotalAmt.Index];    //발행일자
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 16]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1EMail.Index];       //발행일자

      //디테일항목 조회
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 17]   := FormatMaskText('!00/00;0; ',RightStr(GetOnlyNumber(GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1Date.Index]),4));
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 18]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1Item.Index];
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 19]   := 1;
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 20]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1NetAmt.Index];
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 21]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1TaxAmt.Index];
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 22]   := GridTableView1.Controller.SelectedRecords[vIndex].Values[GridTableView1TotalAmt.Index];
    end;
  end;

  if GridTableView.DataController.RecordCount = 0 then Exit;

  case ConditionPrintComboBox.ItemIndex of
    0 : AllFastReport.ShowReport;
    1 : ReceiveReport.ShowReport;
    2 : ProviderReport.ShowReport;
  end;
end;

end.
