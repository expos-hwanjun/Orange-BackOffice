unit MemberVatInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridCustomTableView, cxGridTableView, Menus,
  AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer, DBAccess, Uni, DB,
  MemDS, ImgList, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, cxCheckBox, StrUtils,
  cxLookAndFeels, cxLookAndFeelPainters, frxClass, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPScxGrid6Lnk, Math,
  cxCheckComboBox, cxGridBandedTableView, cxButtonEdit, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer;

type
  TMemberVatInvoiceForm = class(TInheritShowForm)
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewBizNo: TcxGridColumn;
    GridTableViewBoss: TcxGridColumn;
    GridTableViewUptae: TcxGridColumn;
    GridTableViewJongmok: TcxGridColumn;
    GridTableViewAddress: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewTaxAmt: TcxGridColumn;
    GridTableViewTotalAmt: TcxGridColumn;
    GridTableViewEmail: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    GridTableViewCheck: TcxGridColumn;
    GridPopup: TPopupMenu;
    GridPopupSelectAll: TMenuItem;
    GridPopupDeselectAll: TMenuItem;
    GridPopupInverseSelect: TMenuItem;
    GridTableViewInvoiceItem: TcxGridColumn;
    InvoiceDateEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    GridTableViewInvoiceType: TcxGridColumn;
    ButtonToolBarCancelButton: TAdvGlowButton;
    NonTaxFastReport: TfrxReport;
    TaxFastReport: TfrxReport;
    FastReportDataSet: TfrxUserDataSet;
    ConditionCompanyCodeEdit: TcxButtonEdit;
    ConditionCompanyNameEdit: TcxTextEdit;
    ConditionCompanyLabel: TcxLabel;
    ConditionDsInvoiceComboBox: TcxComboBox;
    GridTableViewTelNo: TcxGridColumn;
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure GridBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ConditionCompanyCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewCheckHeaderClick(Sender: TObject);
    procedure GridTableViewCheckPropertiesChange(Sender: TObject);
  private
    isFirst :Boolean;
    isCount :Boolean;
    Password :String;
    ErrCount :Integer;
    procedure SetPrintData;
    function  SearchCompany(aCompany: string = ''): string;
  protected
    function  DoSearch:Boolean; override;
    function  CheckError:Integer;
    procedure DoPreview; override;
    { Public declarations }
  end;

var
  MemberVatInvoiceForm: TMemberVatInvoiceForm;

implementation
uses Common, eTax, Help;
{$R *.dfm}

{ TMemberSaleTaxForm }
procedure TMemberVatInvoiceForm.FastReportDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
{  if ReportGridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportDataSet.RecNo >= ReportGridTableView.DataController.RecordCount;
}
end;

procedure TMemberVatInvoiceForm.FastReportDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
{  for vIndex := 0 to ReportGridTableView.ColumnCount-1 do
    if ReportGridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := ReportGridTableView.DataController.Values[FastReportDataSet.RecNo, vIndex];
      break;
    end;
}
end;

procedure TMemberVatInvoiceForm.FormCreate(Sender: TObject);
begin
  inherited;
  InvoiceDateEdit.Date := now;
  GridTableViewCheck.Width := 40;
  IsCount := true;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
  isFirst     := true;
  PassWord    := '';
end;


procedure TMemberVatInvoiceForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재 작업을 취소하시겠습니까?') then
     Exit;
  ButtonToolBarCancelButton.Enabled    := false;
  ConditionCompanyCodeEdit.Clear;
  ConditionCompanyNameEdit.Clear;
  GridTableView.DataController.RecordCount := 0;
  ConditionToolBar.Enabled             := true;
end;

procedure TMemberVatInvoiceForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vIndex, vTaxNo, vIndex1 :Integer;
    vData,
    vBillNo,
    vConditionSql,
    vConditionWhere :String;
    vBillNoList :TStringList;
    vResult :Boolean;
begin
  inherited;
  if not AskBox(ConditionToolBarComboBox.Text+'를 발행 하시겠습니까?') then
     Exit;

  if CheckError > 0 then
  begin
    ErrBox('세금계산서 정보를 정확히 입력하세요');
    Exit;
  end;
  vData := EmptyStr;

  try
    BeginTrans;
    //전자세금계산서 사용
    if GetOption(123) = '1' then
    begin
      with GridTableView.DataController do
      begin
        for vIndex := 0 to FilteredRecordCount-1 do
        begin
          if Values[FilteredRecordIndex[vIndex], GridTableViewCheck.Index] = '1' then
          begin
            vData := vData + '1'+#9+                                                                                      //공급받는자 구분(1:사업자, 2:개인(주민번호), 3:외국인(여권번호))
                             Replace(Values[FilteredRecordIndex[vIndex], GridTableViewBizNo.Index],'-','')+#9+      //공급받는자 사업자번호(-없이)
                             ''+#9+                                                                                       //공급받는자 종사업자번호(4)
                             Values[FilteredRecordIndex[vIndex], GridTableViewCompanyName.Index]+#9+                //공급받는자 상호(100)
                             Values[FilteredRecordIndex[vIndex], GridTableViewBoss.Index]+#9+                       //공급받는자 대표자이름(50)
                             Values[FilteredRecordIndex[vIndex], GridTableViewAddress.Index]+#9+                    //공급받는자 주소(200)
                             Values[FilteredRecordIndex[vIndex], GridTableViewUptae.Index]+#9+                      //공급받는자 업태
                             Values[FilteredRecordIndex[vIndex], GridTableViewJongMok.Index]+#9+                    //공급받는자 종목
                             ''+#9+                                                                                       //부서
                             ''+#9+                                                                                       //담당자이름
                             Values[FilteredRecordIndex[vIndex], GridTableViewEMail.Index]+#9+                      //공급받는자 이메일
                             GetOnlyNumber(Values[FilteredRecordIndex[vIndex], GridTableViewTelNo.Index])+#9+       //공급받는자 담당자 휴대전화
                             DtoS(InvoiceDateEdit.Date)+#9+                                                               //세금계산서 발행일자(8)
                             '1'+#9+                                                                                      //국세청 전송(0:미전송, 1:전송)
                             'S'+#9+                                                                                      //발행방향(S:매출(정방향), B:매입(역방향))
                             '0'+#9+                                                                                      //종이세금계산서(0:전자세금계산서, 1:종이세금계산서)
                             IntToStr(ConditionToolBarComboBox.ItemIndex+1)+#9+                                           //문서종류(1:세금계산서, 2:계산서, 3:영세)
                             Ifthen(Values[FilteredRecordIndex[vIndex], GridTableViewInvoiceType.Index]='영수','1','2')+#9+//영수구분(1:영수, 2:청구)
                             ''+#9+                                                                                       //권
                             ''+#9+                                                                                       //호
                             FormatFloat('#0',Values[FilteredRecordIndex[vIndex], GridTableViewTotalAmt.Index])+#9+ //세금계산서 총 합계금액
                             FormatFloat('#0',Values[FilteredRecordIndex[vIndex], GridTableViewNetAmt.Index])+#9+   //세금계산서 총 공급금액
                             FormatFloat('#0',Values[FilteredRecordIndex[vIndex], GridTableViewTaxAmt.Index])+#9+   //세금계산서 총 부가세금액
                             '0'+#9+                                                                                      //현금 결제금액
                             '0'+#9+                                                                                      //수표 결제금액
                             '0'+#9+                                                                                      //어음 결제금액
                             '0'+#9+                                                                                      //외상(미수) 금액
                             ''+#9+                                                                                       //비고(250)
                             ''+'{#3}'+                                                                                   //공급받는자공지사항(250), 국세청에는 전송되지 않고 공급받는자 이메일에만 표시됨
                             FormatDateTime('mm',InvoiceDateEdit.Date)+#9+                                                //월
                             FormatDateTime('dd',InvoiceDateEdit.Date)+#9+                                                //일
                             Values[FilteredRecordIndex[vIndex], GridTableViewInvoiceItem.Index]+#9+                       //품목
                             ''+#9+                                                                                       //비고
                             '1'+#9+                                                                                      //수량
                             ''+#9+                                                                                       //단위
                             FormatFloat('#0',Values[FilteredRecordIndex[vIndex], GridTableViewNetAmt.Index])+#9+   //단가
                             FormatFloat('#0',Values[FilteredRecordIndex[vIndex], GridTableViewNetAmt.Index])+#9+   //공급가액
                             FormatFloat('#0',Values[FilteredRecordIndex[vIndex], GridTableViewTaxAmt.Index])+#9+   //부가세
                             ' '+'{#4}';                                                                                  //비고
          end;
        end;
      end;

      vData := Copy(vData,1,Length(vData)-5);
      try
        OpenQuery('select NO_BIZER, '
                 +'       NM_STORE, '
                 +'       NM_BOSS, '
                 +'       ADDR1+'' ''+ADDR2 as ADDR, '
                 +'       NM_UPTAE, '
                 +'       NM_UPJONG, '
                 +'       TEL_MOBIL1, '
                 +'       NM_EMAIL '
                 +'from   MS_STORE '
                 +'where  CD_STORE =:P0',
                 [StoreCode]);

        vResult := SetETaxMultiDatas(CustomerNo,
                                     Replace(Query.Fields[0].AsString,'-',''), //공급자 사업자번호(-없이)
                                     '',                                       //공급자 종사업자번호(4)
                                     Query.Fields[1].AsString,                 //공급자 상호(100)
                                     Query.Fields[2].AsString,                 //공급자 대표자이름(50)
                                     Query.Fields[3].AsString,                 //공급자 주소(200)
                                     Query.Fields[4].AsString,                 //공급자 업태(40)
                                     Query.Fields[5].AsString,                 //공급자 종목(40)
                                     '',                                       //공급자 부서이름(50)
                                     '',                                       //공급자 담당자이름(50)
                                     Query.Fields[7].AsString,                 //공급자 이메일(50)
                                     GetOnlyNumber(Query.Fields[6].AsString),  //공급자 휴대폰번호(20)
                                     vData,
                                     vBillNo,
                                     PassWord,
                                     isFirst);
      finally
        FinishQuery;
      end;
      if not vResult then
        raise Exception.Create('계산서 발행 실패!!!');

      //매출에 계산서번호를 업데이트한다
      with GridTableView.DataController do
      begin
        //매출헤더에 계산서 번호를 업데이트한다
        case ConditionToolBarComboBox.ItemIndex of
          0 :
          begin
            vConditionSql   := ' NO_TAX_REF = :P4 ';
            vConditionWhere := ' and Isnull(NO_TAX_REF,'''') = '''' ';
          end;
          1 :
          begin
            vConditionSql   := ' NO_NOTAX_REF = :P4 ';
            vConditionWhere := ' and Isnull(NO_NOTAX_REF,'''') = '''' ';
          end;
        end;

        vBillNoList := TStringList.Create;
        vBillNoList := Split(vBillNo);

        vIndex1 := 0;
        for vIndex := 0 to FilteredRecordCount-1 do
        begin
          if Values[FilteredRecordIndex[vIndex], GridTableViewCheck.Index] = '1' then
          begin
            ExecQuery('update SL_SALE_H set '+ vConditionSql
                     +' where CD_STORE =:P0 '
                     +'   and DS_SALE <> ''V'' '
                     +'   and YMD_SALE Between :P1 and :P2 '
                     +'   and CD_MEMBER =:P3 '
                     +vConditionWhere,
                     [StoreCode,
                      DtoS(ConditionToolBarFromDateEdit.Date),
                      DtoS(ConditionToolBarToDateEdit.Date),
                      Values[FilteredRecordIndex[vIndex], GridTableViewCompanyCode.Index],
                      vBillNoList.Strings[vIndex1]],
                      false);
            Inc(vIndex1);
          end;
        end;
      end;
    end
    else //종이세금계산서
    begin
      try
        OpenQuery('select Isnull(Max(NO_TAX),0) '
                 +'  from SL_TAX '
                 +' where CD_STORE =:P0 '
                 +'   and YMD_TAX  =:P1 ',
                 [StoreCode,
                  DtoS(InvoiceDateEdit.Date)]);
        vTaxNo := Query.Fields[0].AsInteger;
        vIndex1 := 0;
      finally
        FinishQuery;
      end;
      for vIndex := GridTableView.DataController.FilteredRecordCount-1 downto 0 do
        if (GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCheck.Index] <> null) and
           (GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCheck.Index] = true) and
           (GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewTotalAmt.Index] > 0) then
        begin
          ExecQuery('insert into SL_TAX(CD_STORE, '
                    +'                  YMD_TAX, '
                    +'                  NO_TAX, '
                    +'                  DS_TAX, '
                    +'                  CD_MEMBER, '
                    +'                  NM_MEMBER, '
                    +'                  NO_BIZER, '
                    +'                  NM_BOSS, '
                    +'                  NM_UPTAE, '
                    +'                  NM_JONGMOK, '
                    +'                  ADDR, '
                    +'                  EMail, '
                    +'                  DS_INVOICE, '
                    +'                  AMT_NET, '
                    +'                  AMT_VAT, '
                    +'                  AMT_TOT, '
                    +'                  MD_ITEM1, '
                    +'                  ITEM1, '
                    +'                  QTY_ITEM1, '
                    +'                  PRICE_ITEM1, '
                    +'                  YMD_FROM, '
                    +'                  YMD_TO, '
                    +'                  DS_STATUS ) '
                    +'           VALUES(:P0, '
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
                    +'                  :P13, '
                    +'                  :P14, '
                    +'                  :P15, '
                    +'                  :P16, '
                    +'                  :P17, '
                    +'                  1, '
                    +'                  :P12, '
                    +'                  :P18, '
                    +'                  :P19, '
                    +'                  ''0'')',
                     [StoreCode,
                      DtoS(InvoiceDateEdit.Date),
                      LPad(IntToStr(vTaxNo+1),3,'0'),
                      ConditionToolBarComboBox.ItemIndex,
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCompanyCode.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCompanyName.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewBizNo.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewBoss.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewUptae.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewJongmok.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewAddress.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewEmail.Index],
                      Ifthen(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewInvoiceType.Index]='영수',0,1),
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewNetAmt.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewTaxAmt.Index],
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewTotalAmt.Index],
                      RightStr(DtoS(InvoiceDateEdit.Date),4),
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewInvoiceItem.Index],
                      DtoS(ConditionToolBarFromDateEdit.Date),
                      DtoS(ConditionToolBarToDateEdit.Date)],
                      false);

          //매출헤더에 계산서 번호를 업데이트한다
          case ConditionToolBarComboBox.ItemIndex of
            0 :
            begin
              vConditionSql   := ' NO_TAX_REF = :P4 ';
              vConditionWhere := ' and Isnull(NO_TAX_REF,'''') = '''' ';
            end;
            1 :
            begin
              vConditionSql   := ' NO_NOTAX_REF = :P4 ';
              vConditionWhere := ' and Isnull(NO_NOTAX_REF,'''') = '''' ';
            end;
          end;

          ExecQuery('update SL_SALE_H set '+ vConditionSql
                   +' where CD_STORE =:P0 '
                   +'   and DS_SALE <> ''V'' '
                   +'   and YMD_SALE Between :P1 and :P2 '
                   +'   and CD_MEMBER =:P3 '
                   +vConditionWhere,
                   [StoreCode,
                    DtoS(ConditionToolBarFromDateEdit.Date),
                    DtoS(ConditionToolBarToDateEdit.Date),
                    GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCompanyCode.Index],
                    DtoS(InvoiceDateEdit.Date)+LPad(IntToStr(vTaxNo+1),3,'0')],
                    false);
          Inc(vTaxNo);
          Inc(vIndex1);
          GridTableView.DataController.DeleteRecord(GridTableView.DataController.FilteredRecordIndex[vIndex]);
        end;


    end;
    ButtonToolBarSaveButton.Enabled := false;
    CommitTrans;
    MsgBox(IntToStr(vIndex1)+' 건이 정상 발행되었습니다');
    ButtonToolBarCancelButton.Enabled    := true;
//    ConditionToolBar.Enabled := true;
    isFirst := false;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;

end;

function TMemberVatInvoiceForm.CheckError: Integer;
var vIndex :Integer;
begin
  Result := 0;
  with GridTableView.DataController do
  begin
    for vIndex := 0 to FilteredRecordCount-1 do
    begin
      if Values[FilteredRecordIndex[vIndex], GridTableViewCheck.Index] = '1' then
      begin
        if Length(GetOnlyNumber(Values[FilteredRecordIndex[vIndex], GridTableViewBizNo.Index])) <> 10 then
        begin
          Result := Result + 1;
          Continue;
        end;

        if Trim(Values[FilteredRecordIndex[vIndex], GridTableViewBoss.Index]) = '' then
        begin
          Result := Result + 1;
          Continue;
        end;

        if Trim(Values[FilteredRecordIndex[vIndex], GridTableViewUptae.Index]) = '' then
        begin
          Result := Result + 1;
          Continue;
        end;

        if Trim(Values[FilteredRecordIndex[vIndex], GridTableViewJongMok.Index]) = '' then
        begin
          Result := Result + 1;
          Continue;
        end;

        if Trim(Values[FilteredRecordIndex[vIndex], GridTableViewAddress.Index]) = '' then
        begin
          Result := Result + 1;
          Continue;
        end;

        if Trim(Values[FilteredRecordIndex[vIndex], GridTableViewInvoiceItem.Index]) = '' then
        begin
          Result := Result + 1;
          Continue;
        end;

        if (GetOption(123)='1') and (Trim(Values[FilteredRecordIndex[vIndex], GridTableViewEMail.Index]) = '') then
        begin
          Result := Result + 1;
          Continue;
        end;

        if (GetOption(123)='1') and (Trim(Values[FilteredRecordIndex[vIndex], GridTableViewTelNo.Index]) = '') then
        begin
          Result := Result + 1;
          Continue;
        end;
      end;
    end;
  end;
end;

procedure TMemberVatInvoiceForm.ConditionCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchCompany;
end;

procedure TMemberVatInvoiceForm.ConditionCompanyCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vCode,
    vName :String;
begin
  inherited;
  OpenQuery('select   CD_MEMBER, '
           +'         NM_MEMBER '
           +'from     MS_MEMBER '
           +'where    CD_STORE = :P0 '
           +'  and    (CD_MEMBER = :P1 or NM_MEMBER like ''%''+:P1+''%'' )'
           +'  and    MEMBER_TYPE = ''T'' '
           +'  and    DS_STATUS = 0',
            [Ifthen(GetOption(257)='0', StoreCode,'0000'),
             DisplayValue]);
  try
    if not Query.Eof then
    begin
      vCode      := Query.Fields[0].AsString;
      vName      := Query.Fields[1].AsString;
      Query.Next;
      if Query.Eof then
      begin
        DisplayValue              := vCode;
        ConditionCompanyNameEdit.Text := vName;
      end
      else
        DisplayValue := SearchCompany(DisplayValue);
    end
    else
    begin
      ConditionCompanyCodeEdit.SetFocus;
      ConditionCompanyNameEdit.Text := EmptyStr;
      ShowMsg(Replace(ConditionCompanyLabel.Caption)+msgMustInput, true)
    end;
  finally
    FinishQuery;
  end;
end;

procedure TMemberVatInvoiceForm.DoPreview;
begin
//  inherited;
  SetPrintData;
  case ConditionToolBarComboBox.ItemIndex of
    0 : TaxFastReport.ShowReport;
    1 : NonTaxFastReport.ShowReport;
  end;
end;

function TMemberVatInvoiceForm.DoSearch:Boolean;
var vConditionSql,
    vConditionWhere,
    vConditionWhere1,
    vConditionWhere2,
    vConditionAcct,
    vSaleColum,
    vHaving  :String;
begin
  inherited;
  case ConditionToolBarComboBox.ItemIndex of
    0 :
       begin
         vConditionSql    := ' (CONVERT(FLOAT, SUM(h.AMT_NET)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end * SUM(h.AMT_CASH)) '
                            +' - CONVERT(INT, (CONVERT(FLOAT, SUM(h.AMT_NET)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end * SUM(h.AMT_CASH) / 11))  AS AMT_NET, '
                            +' CONVERT(INT, (CONVERT(FLOAT, SUM(h.AMT_NET)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end * SUM(h.AMT_CASH) / 11)) AS AMT_TAX, '
                            +' ROUND( CONVERT(FLOAT, SUM(h.AMT_NET)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end * SUM(h.AMT_CASH), 0)  AS AMT_SALE, ';
         vConditionWhere1 := ' and Isnull(h.NO_TAX_REF,'''') = '''' ';
         vHaving          := ' Having CONVERT(FLOAT, SUM(h.AMT_NET)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end * SUM(h.AMT_CASH) <> 0 '
       end;
    1 :
       begin
         vConditionSql    := ' ROUND(CONVERT(FLOAT, SUM(h.AMT_DUTYFREE)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end * SUM(h.AMT_CASH),0) as AMT_NET, '
                            +' 0 as AMT_TAX, '
                            +' ROUND(CONVERT(FLOAT, SUM(h.AMT_DUTYFREE)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end  * SUM(h.AMT_CASH),0) as AMT_SALE, ';
         vConditionWhere1 := ' and Isnull(h.NO_NOTAX_REF,'''') = '''' ';
         vHaving          := ' Having CONVERT(FLOAT, SUM(h.AMT_DUTYFREE)) / case when SUM(h.AMT_SALE) =0 then 1 else SUM(h.AMT_SALE) end  * SUM(h.AMT_CASH) <> 0 '
       end;
  end;

  case ConditionDsInvoiceComboBox.ItemIndex of
    0 : vConditionWhere2 := EmptyStr;
    1 : vConditionWhere2 := 'and t.DS_INVOICE = ''0'' ';
    2 : vConditionWhere2 := 'and t.DS_INVOICE = ''1'' ';
  end;

  OpenQuery('SELECT ''1'' as YN_CHECK, '
           +'       h.CD_MEMBER, '
           +'       Isnull(Max(t.NM_MEMBER),'''') as NM_MEMBER, '
           +vConditionSql
           +'       case when Isnull(Max(t.INVOICE_ITEM),'''') = '''' then Max(s.INVOICE_ITEM) else Max(t.INVOICE_ITEM) end as INVOICE_ITEM, '
           +'       ''영수'' as DS_INVOICE, '
           +'       Isnull(Max(t.NO_BIZER),'''') as NO_BIZER, '
           +'       Isnull(Max(t.NM_BOSS), '''') as NM_BOSS, '
           +'       Isnull(Max(t.NM_UPTAE), '''') as NM_UPTAE, '
           +'       Isnull(Max(t.NM_JONGMOK), '''') as NM_JONGMOK,'
           +'       Isnull(Max(t.ADDR1),'''') +'' ''+ Isnull(Max(t.ADDR2),'''') AS ADDRESS, '
           +'       Isnull(Max(t.NM_EMAIL),'''') as EMail, '
           +'       Isnull(Max(dbo.GetPhoneNo(t.TEL_INVOICE)),'''') as TEL_INVOICE, '
           +'       Isnull(Max(t.NO_BIZER_SUB),'''') as NO_BIZER_SUB, '
           +'       Isnull(Max(t.INVOICE_ITEM),'''') as INVOICE_ITEM '
           +'  FROM '
           +'      (select t.CD_STORE, '
           +'              t.CD_MEMBER, '
           +'              SUM(t.AMT_DUTYFREE) as AMT_DUTYFREE, '
           +'              SUM(t.AMT_NET)      as AMT_NET, '
           +'              SUM(t.AMT_SALE)     as AMT_SALE, '
           +'              SUM(t.AMT_CASH)     as AMT_CASH '
           +'         from  '
           +'            ( '
           +'             select h.CD_STORE,'
           +'                    h.CD_MEMBER, '
           +'                    SUM(d.AMT_DUTYFREE) as AMT_DUTYFREE , '
           +'                    SUM(d.AMT_NET)      as AMT_NET , '
           +'                    h.AMT_CASH+h.AMT_CHECK as AMT_CASH, '
           +'                    h.AMT_SALE '
           +'               from SL_SALE_H as h inner join '
           +'                    (select CD_STORE, '
           +'                            YMD_SALE, '
           +'                            NO_POS, '
           +'                            NO_RCP, '
           +'	       		            		 case when AMT_VAT  = 0 then AMT_SALE-DC_TOT else 0 end AMT_DUTYFREE, '
           +'	       				             case when AMT_VAT <> 0 then AMT_SALE-DC_TOT else 0 end AMT_NET '
           +'	       		            from SL_SALE_D '
           +'	       		           where CD_STORE = :P0 '
           +'	       		             and YMD_SALE  Between :P1 AND :P2 '
           +'	       		             and DS_SALE  <> ''V'' '
           +'	       		          ) as d on h.CD_STORE = d.CD_STORE and h.YMD_SALE = d.YMD_SALE and h.NO_POS = d.NO_POS and h.NO_RCP = d.NO_RCP '
           +'              where h.CD_STORE = :P0 '
           +'                and h.DS_SALE  <> ''V'' '
           +'                and h.YMD_SALE Between :P1 AND :P2 '
           +vConditionWhere1
           +'                and h.CD_MEMBER <> '''' '
           +'              group by h.CD_STORE, h.CD_MEMBER, h.AMT_CASH+h.AMT_CHECK, h.AMT_SALE '
           +'             ) t group by t.CD_STORE, t.CD_MEMBER '
           +'       ) AS h INNER JOIN '
           +'       MS_MEMBER t ON t.CD_STORE = :P3  AND h.CD_MEMBER = t.CD_MEMBER and t.YN_INVOICE = ''Y'' ' + vConditionWhere2 + ' LEFT OUTER JOIN '
           +'       MS_STORE s ON t.CD_STORE = s.CD_STORE '
           +Ifthen(ConditionCompanyCodeEdit.Text <> EmptyStr, ' AND t.CD_MEMBER = '''+ConditionCompanyCodeEdit.Text+''' ', '')
           +'GROUP BY h.CD_MEMBER '
           +vHaving,
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             Ifthen(GetOption(257)='0', StoreCode,'0000')]);
  Result := ReadQuery(GridTableView);
  if Result then
  begin
    ButtonToolBarCancelButton.Enabled    := true;
    ButtonToolBarSaveButton.Enabled      := true;
    ConditionToolBar.Enabled             := false;
  end;
end;


procedure TMemberVatInvoiceForm.GridBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
  if AItem = nil then Exit;

  if (Length(GetOnlyNumber(ARecord.Values[GridTableViewBizNo.Index])) <> 10)
     or (Trim(ARecord.Values[GridTableViewBoss.Index]) = '')
     or (Trim(ARecord.Values[GridTableViewUptae.Index]) = '')
     or (Trim(ARecord.Values[GridTableViewJongMok.Index]) = '')
     or (Trim(ARecord.Values[GridTableViewAddress.Index]) = '')
     or (Trim(ARecord.Values[GridTableViewEMail.Index]) = '')
     or (Trim(ARecord.Values[GridTableViewTelNo.Index]) = '')
     or (Trim(ARecord.Values[GridTableViewInvoiceItem.Index]) = '') then
     AStyle := StyleFontRed;
end;

procedure TMemberVatInvoiceForm.GridTableViewCheckHeaderClick(
  Sender: TObject);
var
  vIndex: Integer;
  vSelectAll: Boolean;
begin
  inherited;

  // 전체 선택 되어 있는지 확인한다
  vSelectAll := true;
  for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
    if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCheck.Index] = '0' then
    begin
      vSelectAll := false;
      break;
    end;

  // 전체 선택 시 전체 취소
  if vSelectAll then
    GridPopupDeselectAll.Click
  // 선택 안된 것이 있으면 전체 선택
  else
    GridPopupSelectAll.Click;
end;

procedure TMemberVatInvoiceForm.GridTableViewCheckPropertiesChange(
  Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  // 선택된 항목이 있으면 삭제 버튼을 활성화한다
  ButtonToolBarSaveButton.Enabled := false;
  GridTableView.DataController.PostEditingData;
  for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
    if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCheck.Index] = '1' then
    begin
      ButtonToolBarSaveButton.Enabled := true;
      Break;
    end;
end;

function TMemberVatInvoiceForm.SearchCompany(aCompany: string): string;
begin
  Result := EmptyStr;
  // 거래처를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := Replace(ConditionCompanyLabel.Caption)+' 조회';
      GridTableViewCode.Caption  := Replace(ConditionCompanyLabel.Caption)+' 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := Replace(ConditionCompanyLabel.Caption)+' 이름';
      GridTableViewName1.Width   := 320;

      SearchText := aCompany;
      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER '
                   +'from     MS_MEMBER '
                   +'where    CD_STORE  = '''+Ifthen(GetOption(257)='0', StoreCode,'0000')+''''
                   +'  and   (CD_MEMBER  = :P1 or NM_MEMBER like ''%''+:P1+''%'') '
                   +'  and    MEMBER_TYPE = ''T'' '
                   +'  and    DS_STATUS = 0 '
                   +'order by CD_MEMBER';
      SearchButton.Click;
      if ShowModal = mrOK then
      begin
        Result                    := Code;
          ConditionCompanyCodeEdit.Text := Code;
          ConditionCompanyNameEdit.Text := Names[0];
      end
      else
      begin
        ConditionCompanyCodeEdit.SetFocus;
        ConditionCompanyCodeEdit.SelectAll;
      end;
    finally
      Free;
    end;
end;

procedure TMemberVatInvoiceForm.SetPrintData;
var vTemp :String;
    vIndex,
    vRow  :Integer;
begin
{  ReportGridTableView.DataController.RecordCount := 0;
  ReportGridTableView.DataController.AppendRecord;
  vRow := ReportGridTableView.DataController.RowCount-1;
  //공급자 정보
  try
    OpenQuery('select * from MS_STORE where CD_STORE =:P0',[StoreCode]);
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewStoreName.Index]    := StoreName;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewStoreBizNo.Index]   := BusinessNumber;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewStoreBoss.Index]    := Query.FieldByName('NM_BOSS').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewStoreAddress.Index] := Query.FieldByName('ADDR1').AsString +' '+Query.FieldByName('ADDR2').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewStoreUptae.Index]   := Query.FieldByName('NM_UPTAE').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewStoreJongmok.Index] := Query.FieldByName('NM_UPJONG').AsString;
  finally
    FinishQuery;
  end;

  //공급받는자 정보
  try
    OpenQuery('select * from MS_TRD '
             +'where CD_STORE =:P0 '
             +'  and CD_TRDPL =:P1',
             [StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyCode.Index]]);
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewCompanyName.Index]    := Query.FieldByName('NM_TRDPL').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewCompanyBizNo.Index]   := Query.FieldByName('NO_BIZER').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewCompanyBoss.Index]    := Query.FieldByName('NM_BOSS').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewCompanyAddress.Index] := Query.FieldByName('ADDR1').AsString +' '+Query.FieldByName('ADDR2').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewCompanyUptae.Index]   := Query.FieldByName('NM_UPTAE').AsString;
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewCompanyJongmok.Index] := Query.FieldByName('NM_JONGMOK').AsString;
  finally
    FinishQuery;
  end;

  //공란수
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewAmtNull.Index] := IntToStr(11 - Length(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewNetAmt.Index]));

  //공급금액
  vTemp := FormatFloat('#0', GridTableView.DataController.Values[vRow, GridTableViewNetAmt.Index]);
  vTemp := LPad(vTemp, 11, ' ');
  for vIndex := 1 to 11 do
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewAmtNull.Index+vIndex] := vTemp[vIndex];

  //부가세
  vTemp := FormatFloat('#0', GridTableView.DataController.Values[vRow, GridTableViewTaxAmt.Index]);
  vTemp := LPad(vTemp, 10, ' ');
  for vIndex := 1 to 10 do
    ReportGridTableView.DataController.Values[vRow, ReportGridTableViewAmt11.Index+vIndex] := vTemp[vIndex];

  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewTaxYear.Index]  := Copy(DtoS(InvoiceDateEdit.Date),1,4);
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewTaxMonth.Index] := Copy(DtoS(InvoiceDateEdit.Date),5,2);
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewTaxDay.Index]   := Copy(DtoS(InvoiceDateEdit.Date),7,2);

  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewItemDate.Index] := Copy(DtoS(InvoiceDateEdit.Date),5,2) +'/'+Copy(DtoS(InvoiceDateEdit.Date),7,2);
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewItemTxt.Index]  := Nvl(GridTableView.DataController.Values[vRow, GridTableViewInvoiceItem.Index],'');
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewItemQty.Index]  := '1';
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewItemPrice.Index]:= GridTableView.DataController.Values[vRow, GridTableViewNetAmt.Index];
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewItemNet.Index]  := GridTableView.DataController.Values[vRow, GridTableViewNetAmt.Index];
  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewItemTax.Index]  := GridTableView.DataController.Values[vRow, GridTableViewTaxAmt.Index];

  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewAmtTotal.Index] := GridTableView.DataController.Values[vRow, GridTableViewTotAmt.Index];
  case Condition1ToolBarComboBox.ItemIndex of
    0,1 : ReportGridTableView.DataController.Values[vRow, ReportGridTableViewAmtCash.Index] := '0';
      2 : ReportGridTableView.DataController.Values[vRow, ReportGridTableViewAmtCash.Index] := GridTableView.DataController.Values[vRow, GridTableViewTotAmt.Index];
  end;

  ReportGridTableView.DataController.Values[vRow, ReportGridTableViewInvoiceType.Index] := '이 금액을 '+GridTableView.DataController.Values[vRow, GridTableViewInvoiceType.Index]+' 함.';
}
end;

end.
