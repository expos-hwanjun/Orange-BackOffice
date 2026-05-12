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
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, Math,
  cxCheckComboBox, cxButtonEdit, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk;

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
    ConditionCompanyCodeEdit: TcxButtonEdit;
    ConditionCompanyNameEdit: TcxTextEdit;
    ConditionCompanyLabel: TcxLabel;
    ConditionDsInvoiceComboBox: TcxComboBox;
    GridTableViewTelNo: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    TrustExistCheckBox: TcxCheckBox;
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConditionCompanyCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewCheckHeaderClick(Sender: TObject);
    procedure GridTableViewCheckPropertiesChange(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ConditionCompanyCodeEditPropertiesChange(Sender: TObject);
  private
    isFirst :Boolean;
    isCount :Boolean;
    Password :String;
    function  SearchCompany(aCompany: string = ''): string;
  protected
    function  DoSearch:Boolean; override;
    function  CheckError: Boolean;
  end;

var
  MemberVatInvoiceForm: TMemberVatInvoiceForm;



implementation

uses
  Common, DBModule, eTax, Help;

{$R *.dfm}

procedure TMemberVatInvoiceForm.FormCreate(Sender: TObject);
begin
  inherited;
  InvoiceDateEdit.Date := now;
  GridTableViewCheck.Width := 40;
  IsCount := true;
  PrintMode   := pmPrintPreviewExcel;
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
  Grid.ActiveLevel := GridLevel;
  GridTableView.DataController.RecordCount := 0;
  GridTableView1.DataController.RecordCount := 0;
  ConditionToolBar.Enabled             := true;
end;

procedure TMemberVatInvoiceForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vIndex, vTaxNo, vIndex1 :Integer;
    vData,
    vBillNo,
    vConditionSql,
    vConditionWhere,
    vConditionWhere1 :String;
    vBillNoList :TStringList;
    vResult :Boolean;
begin
  inherited;
  if not AskBox(ConditionToolBarComboBox.Text+'를 발행하시겠습니까?') then
     Exit;

  if not CheckError then
    Exit;
  vData := EmptyStr;

  try
    BeginTrans;
    //전자세금계산서 사용
    if CheckOption(123) then
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
            if GetOption(124) = '0' then
               vConditionWhere := ' and Isnull(NO_TAX_REF,'''') = '''' '
             else
               vConditionWhere := ' and Isnull(NO_TAX_REF,'''') = '''' '
                                 +' and Isnull(NO_ACCT_REF,'''') = '''' ';
             vConditionWhere1 := ' and Isnull(NO_TAX_REF,'''') = '''' ';
          end;
          1 :
          begin
            vConditionSql   := ' NO_NOTAX_REF = :P4 ';
            if GetOption(124) = '0' then
              vConditionWhere := ' and Isnull(NO_NOTAX_REF,'''') = '''' '
            else
              vConditionWhere := ' and Isnull(NO_ACCT_REF,'''') = '''' '
                                +' and Isnull(NO_NOTAX_REF,'''') = '''' ';
            vConditionWhere1 := ' and Isnull(NO_NOTAX_REF,'''') = '''' ';
          end;
        end;

        vBillNoList := TStringList.Create;
        Split(vBillNo, splitRecord, vBillNoList);

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

            //외상결제내역 업데이트
            if (ConditionToolBarComboBox.ItemIndex = 0) and not TrustExistCheckBox.Checked then
            begin
              ExecQuery('update SL_ACCT set NO_TAX_REF = :P4 '
                       +' where CD_STORE =:P0 '
                       +'   and YMD_OCCUR Between :P1 and :P2 '
                       +'   and DS_ACCT in (''0'',''3'') '
                       +'   and  CD_ACCT ='''+CreditIn+''''
                       +'   and CD_TRDPL =:P3 '
                       +vConditionWhere1,
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date),
                        Values[FilteredRecordIndex[vIndex], GridTableViewCompanyCode.Index],
                        vBillNoList.Strings[vIndex1]],
                        false);
            end;
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
                    +'                  EMAIL, '
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
              if GetOption(124) = '0' then
                vConditionWhere := ' and Isnull(NO_TAX_REF,'''') = '''' '
              else
                vConditionWhere := ' and Isnull(NO_TAX_REF,'''') = '''' '
                                  +' and Isnull(NO_ACCT_REF,'''') = '''' ';
              vConditionWhere1 := ' and Isnull(NO_TAX_REF,'''') = '''' ';
            end;
            1 :
            begin
              vConditionSql   := ' NO_NOTAX_REF = :P4 ';
              if GetOption(124) = '0' then
                vConditionWhere := ' and Isnull(NO_NOTAX_REF,'''') = '''' '
              else
                vConditionWhere := ' and Isnull(NO_ACCT_REF,'''') = '''' '
                                  +' and Isnull(NO_NOTAX_REF,'''') = '''' ';
              vConditionWhere1 := ' and Isnull(NO_NOTAX_REF,'''') = '''' ';
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

          //외상결제내역 업데이트
          if (ConditionToolBarComboBox.ItemIndex = 0) and not TrustExistCheckBox.Checked then
          begin
            ExecQuery('update SL_ACCT set NO_TAX_REF = :P4 '
                     +' where CD_STORE =:P0 '
                     +'   and YMD_OCCUR Between :P1 and :P2 '
                     +'   and DS_ACCT in (''0'',''3'') '
                     +'   and  CD_ACCT ='''+CreditIn+''''
                     +'   and CD_MEMBER =:P3 '
                     +vConditionWhere1,
                     [StoreCode,
                      DtoS(ConditionToolBarFromDateEdit.Date),
                      DtoS(ConditionToolBarToDateEdit.Date),
                      GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCompanyCode.Index],
                      DtoS(InvoiceDateEdit.Date)+LPad(IntToStr(vTaxNo+1),3,'0')],
                      false);
          end;
          Inc(vTaxNo);
          Inc(vIndex1);
          GridTableView.DataController.DeleteRecord(GridTableView.DataController.FilteredRecordIndex[vIndex]);
        end;


    end;
    ButtonToolBarSaveButton.Enabled := false;
    CommitTrans;
    MsgBox(IntToStr(vIndex1)+'건이 정상 발행되었습니다.');
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

function TMemberVatInvoiceForm.CheckError: Boolean;
const
  msgErr = '%s이(가) 등록되지 않은 레코드가 있습니다.';
var
  vIndex: Integer;
begin
  Result := false;
  with GridTableView.DataController do
  begin
    for vIndex := 0 to FilteredRecordCount-1 do
    begin
      if Values[FilteredRecordIndex[vIndex], GridTableViewCheck.Index] = '1' then
      begin
        if Length(GetOnlyNumber(Values[FilteredRecordIndex[vIndex], GridTableViewBizNo.Index])) <> 10 then
        begin
          ErrBox(Format(msgErr, [GridTableViewBizNo.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;

        if Trim(NVL(Values[FilteredRecordIndex[vIndex], GridTableViewBoss.Index],'')) = '' then
        begin
          ErrBox(Format(msgErr, [GridTableViewBoss.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;

        if Trim(NVL(Values[FilteredRecordIndex[vIndex], GridTableViewUptae.Index],'')) = '' then
        begin
          ErrBox(Format(msgErr, [GridTableViewUptae.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;

        if Trim(NVL(Values[FilteredRecordIndex[vIndex], GridTableViewJongMok.Index],'')) = '' then
        begin
          ErrBox(Format(msgErr, [GridTableViewJongMok.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;

        if Trim(NVL(Values[FilteredRecordIndex[vIndex], GridTableViewAddress.Index],'')) = '' then
        begin
          ErrBox(Format(msgErr, [GridTableViewAddress.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;

        if Trim(NVL(Values[FilteredRecordIndex[vIndex], GridTableViewInvoiceItem.Index],'')) = '' then
        begin
          ErrBox(Format(msgErr, [GridTableViewInvoiceItem.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;

        if CheckOption(123) and (Trim(NVL(Values[FilteredRecordIndex[vIndex], GridTableViewEMail.Index],'')) = '') then
        begin
          ErrBox(Format(msgErr, [GridTableViewEMail.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;

        if CheckOption(123) and (Trim(NVL(Values[FilteredRecordIndex[vIndex], GridTableViewTelNo.Index],'')) = '') then
        begin
          ErrBox(Format(msgErr, [GridTableViewTelNo.Caption]));
          FocusedRecordIndex := FilteredRecordIndex[vIndex];
          Exit;
        end;
      end;
    end;
  end;
  Result := true;
end;

procedure TMemberVatInvoiceForm.ConditionCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchCompany;
end;

procedure TMemberVatInvoiceForm.ConditionCompanyCodeEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (Sender = ConditionCompanyCodeEdit) and (ConditionCompanyNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(ConditionCompanyCodeEdit.EditingText) <> ConditionCompanyCodeEdit.EditingText) or (Length(ConditionCompanyCodeEdit.EditingText) <> 10)) then
  begin
    ConditionCompanyNameEdit.Text := EmptyStr;
  end;
end;

procedure TMemberVatInvoiceForm.ConditionCompanyCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vCode,
    vName :String;
begin
  inherited;
  if DisplayValue <> EmptyStr then
  try
    OpenQuery('select   CD_MEMBER, '
             +'         NM_MEMBER '
             +'from     MS_MEMBER '
             +'where    CD_STORE = :P0 '
             +'  and    (CD_MEMBER = :P1 or NM_MEMBER like ''%''+:P1+''%'' )'
             +'  and    YN_INVOICE = ''Y'' '
             +'  and    DS_STATUS = 0',
              [Ifthen(GetOption(257)='0', StoreCode,'0000'),
               DisplayValue]);
    if not Query.Eof then
    begin
      vCode      := Query.Fields[0].AsString;
      vName      := Query.Fields[1].AsString;
      Query.Next;
      if Query.Eof then
      begin
        DisplayValue                  := vCode;
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

function TMemberVatInvoiceForm.DoSearch:Boolean;
var vConditionWhere1,
    vConditionWhere2,
    vSelectSql,
    vSelectSql1,
    vSelectSql2,
    vHaving  :String;
begin
  Result := false;
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    case ConditionToolBarComboBox.ItemIndex of
      0 :
         begin
           vSelectSql       := ' Sum(h.AMT_NET) - dbo.DivInt(Sum(h.AMT_NET), 11) as AMT_NET, '
                              +' dbo.DivInt(Sum(h.AMT_NET), 11) as AMT_TAX, ';

           vSelectSql1      := ' dbo.Ceil(dbo.DivF(SUM(d.AMT_NET),Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) AS AMT_NET, '
                              +' dbo.Ceil( dbo.DivF(SUM(d.AMT_NET), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) AS AMT_SALE ';

           //외상 건별로 관리할때
           if GetOption(124) = '1' then
             vSelectSql2      :='union all '
                               +'select CD_STORE, '
                               +'       CD_MEMBER, '
                               +'       AMT_NET, '
                               +'       AMT_NET '
                               +'from   SL_ACCT '
                               +'where  CD_STORE = :P0 '
                               +'  and  YMD_OCCUR Between :P1 AND :P2 '
                               +'  and  Len(CD_MEMBER) =10 '
                               +'  and  DS_ACCT in (''0'',''3'') '
                               +'  and  CD_ACCT ='''+CreditIn+''''
                               +'  and Isnull(NO_TAX_REF,'''') = '''' '
           else
             vSelectSql2      :='union all '
                               +'select CD_STORE, '
                               +'       CD_MEMBER, '
                               +'       AMT_PAYIN, '
                               +'       AMT_PAYIN '
                               +'from   SL_ACCT '
                               +'where  CD_STORE = :P0 '
                               +'  and  YMD_OCCUR Between :P1 AND :P2 '
                               +'  and  Len(CD_MEMBER) =10 '
                               +'  and  DS_ACCT in (''0'',''3'')  '
                               +'  and  CD_ACCT ='''+CreditIn+''''
                               +'  and Isnull(NO_TAX_REF,'''') = '''' ';

           if GetOption(124) = '0' then
             vConditionWhere1 := ' and Isnull(h.NO_TAX_REF,'''') = '''' '
           else
             vConditionWhere1 := ' and Isnull(h.NO_ACCT_REF,'''') = '''' ';

           vHaving          := ' Having Sum(h.AMT_SALE) <> 0 ';
           if TrustExistCheckBox.Checked then
             vSelectSql2 := '';
         end;
      1 :
         begin
           vSelectSql       := ' Sum(h.AMT_NET) as AMT_NET, '
                              +' 0 as AMT_TAX, ';
           vSelectSql1      := ' dbo.Ceil(dbo.DivF(SUM(d.AMT_DUTYFREE), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) as AMT_NET, '
                              +' dbo.Ceil(dbo.DivF(SUM(d.AMT_DUTYFREE), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) as AMT_SALE ';

           //외상 건별로 관리할때
           if GetOption(124) = '1' then
             vSelectSql2      :='union all '
                               +'select CD_STORE, '
                               +'       CD_MEMBER, '
                               +'       AMT_DUTYFREE, '
                               +'       AMT_NET '
                               +'from   SL_ACCT '
                               +'where  CD_STORE = :P0 '
                               +'  and  YMD_OCCUR Between :P1 AND :P2 '
                               +'  and  Len(CD_MEMBER) =10 '
                               +'  and  DS_ACCT in (''0'',''3'') '
                               +'  and  CD_ACCT ='''+CreditIn+''''
                               +'  and Isnull(NO_TAX_REF,'''') = '''' '
           else
             vSelectSql2      := '';
           if GetOption(124) = '0' then
             vConditionWhere1 := ' and Isnull(h.NO_NOTAX_REF,'''') = '''' '
           else
             vConditionWhere1 := ' and Isnull(h.NO_ACCT_REF,'''') = '''' ';

           vHaving          := ' Having Sum(h.AMT_SALE) <> 0 '
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
             +vSelectSql
             +'       Sum(h.AMT_SALE) as AMT_SALE, '
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
             +'              SUM(t.AMT_NET)      as AMT_NET, '
             +'              SUM(t.AMT_SALE)     as AMT_SALE '
             +'         from  '
             +'            ( '
             +'             select h.CD_STORE,'
             +'                    h.CD_MEMBER, '
             +vSelectSql1
             +'               from SL_SALE_H as h inner join '
             +'                    (select CD_STORE, '
             +'                            YMD_SALE, '
             +'                            NO_POS, '
             +'                            NO_RCP, '
             +'                            case when AMT_VAT  = 0 then AMT_SALE-DC_TOT else 0 end AMT_DUTYFREE, '
             +'                            case when AMT_VAT <> 0 then AMT_SALE-DC_TOT else 0 end AMT_NET '
             +'                       from SL_SALE_D '
             +'                      where CD_STORE = :P0 '
             +'                        and YMD_SALE  Between :P1 AND :P2 '
             +'                        and DS_SALE  <> ''V'' '
             +'                     ) as d on h.CD_STORE = d.CD_STORE and h.YMD_SALE = d.YMD_SALE and h.NO_POS = d.NO_POS and h.NO_RCP = d.NO_RCP '
             +'              where h.CD_STORE = :P0 '
             +'                and h.DS_SALE  <> ''V'' '
             +'                and h.YMD_SALE Between :P1 AND :P2 '
             +vConditionWhere1
             +'                and h.CD_MEMBER <> '''' '
             +'                and (h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP) <> 0 '
             +'             group by h.CD_STORE, h.CD_MEMBER '
             +vSelectSql2
             +'             ) t group by t.CD_STORE, t.CD_MEMBER '
             +'       ) AS h INNER JOIN '
             +'       MS_MEMBER t ON t.CD_STORE =:P3 AND h.CD_MEMBER = t.CD_MEMBER and t.YN_INVOICE = ''Y'' ' + vConditionWhere2 + ' LEFT OUTER JOIN '
             +'       MS_STORE s ON t.CD_STORE = s.CD_STORE '
             +Ifthen(ConditionCompanyCodeEdit.Text <> EmptyStr, ' WHERE t.CD_MEMBER = '''+ConditionCompanyCodeEdit.Text+''' ', '')
             +'GROUP BY h.CD_MEMBER '
             +vHaving,
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               Ifthen(GetOption(257)='0', StoreCode,'0000')]);
    Result := DM.ReadQuery(Query, GridTableView);

    if Result then
    begin
      ButtonToolBarCancelButton.Enabled    := true;
      ButtonToolBarSaveButton.Enabled      := true;
      ConditionToolBar.Enabled             := false;
    end;
  end
  else
  begin
    if GridTableView.DataController.FocusedRecordIndex < 0  then Exit;

    case ConditionToolBarComboBox.ItemIndex of
      0 :
         begin
           vSelectSql       := ' dbo.Ceil(dbo.DivF(SUM(d.AMT_NET),Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) '
                              +' - CONVERT(INT, dbo.DivF(SUM(d.AMT_NET), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP) / 11)  AS AMT_NET, '
                              +' CONVERT(INT, dbo.DivF(SUM(d.AMT_NET),Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP) / 11) AS AMT_TAX, '
                              +' dbo.Ceil( dbo.DivF(SUM(d.AMT_NET), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP))  AS AMT_SALE, ';

           if GetOption(124) = '1' then
             vSelectSql1      := 'union all '
                                +'select dbo.StoDW(YMD_OCCUR), '
                                +'       ''외상결제'', '
                                +'       AMT_NET - dbo.DivInt(AMT_NET, 11), '
                                +'       dbo.DivInt(AMT_NET, 11), '
                                +'       AMT_NET, '
                                +'       YMD_OCCUR + ''-''+NO_ACCT, '
                                +'       0, '
                                +'       0, '
                                +'       0 '
                                +'from   SL_ACCT '
                                +'where  CD_STORE = :P0 '
                                +'  and  YMD_OCCUR Between :P1 AND :P2 '
                                +'  and  CD_MEMBER = :P3 '
                                +'  and  CD_ACCT ='''+CreditIn+''''
                                +'  and  DS_ACCT in (''0'',''3'') '
           else
             vSelectSql1      := 'union all '
                                +'select dbo.StoDW(YMD_OCCUR), '
                                +'       ''외상결제'', '
                                +'       AMT_PAYIN - dbo.DivInt(AMT_PAYIN, 11), '
                                +'       dbo.DivInt(AMT_PAYIN, 11), '
                                +'       AMT_PAYIN, '
                                +'       YMD_OCCUR + ''-''+NO_ACCT, '
                                +'       0, '
                                +'       0, '
                                +'       0 '
                                +'from   SL_ACCT '
                                +'where  CD_STORE = :P0 '
                                +'  and  YMD_OCCUR Between :P1 AND :P2 '
                                +'  and  CD_MEMBER = :P3 '
                                +'  and  CD_ACCT ='''+CreditIn+''''
                                +'  and  DS_ACCT in (''0'',''3'') ';

           if GetOption(124) = '0' then
             vConditionWhere1 := ' and Isnull(h.NO_TAX_REF,'''') = '''' '
           else
             vConditionWhere1 := ' and Isnull(h.NO_ACCT_REF,'''') = '''' ';

           vHaving          := ' Having dbo.Ceil(dbo.DivF(SUM(d.AMT_NET), Max(h.AMT_SALE)) * Max(h.AMT_CASH)) <> 0 ';
           if TrustExistCheckBox.Checked then
             vSelectSql1 := '';
         end;
      1 :
         begin
           vSelectSql       := ' dbo.Ceil(dbo.DivF(SUM(d.AMT_DUTYFREE), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) as AMT_NET, '
                              +' 0 as AMT_TAX, '
                              +' dbo.Ceil(dbo.DivF(SUM(d.AMT_DUTYFREE), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) as AMT_SALE, ';

           if GetOption(124) = '1' then
             vSelectSql1      := 'union all '
                                +'select dbo.StoDW(YMD_OCCUR), '
                                +'       ''외상결제'', '
                                +'       AMT_DUTYFREE, '
                                +'       0, '
                                +'       AMT_DUTYFREE, '
                                +'       YMD_OCCUR + ''-''+NO_ACCT, '
                                +'       0, '
                                +'       0, '
                                +'       0 '
                                +'from   SL_ACCT '
                                +'where  CD_STORE = :P0 '
                                +'  and  YMD_OCCUR Between :P1 AND :P2 '
                                +'  and  CD_MEMBER = :P3 '
                                +'  and  CD_ACCT ='''+CreditIn+''''
                                +'  and  DS_ACCT in (''0'',''3'') '
           else
             vSelectSql1      := '';

           if GetOption(124) = '0' then
             vConditionWhere1 := ' and Isnull(h.NO_NOTAX_REF,'''') = '''' '
           else
             vConditionWhere1 := ' and Isnull(h.NO_ACCT_REF,'''') = '''' ';

           vHaving          := ' Having dbo.Ceil(dbo.DivF(SUM(d.AMT_DUTYFREE), Max(h.AMT_SALE)) * Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP)) <> 0 '
         end;
    end;
    OpenQuery('select dbo.StoDW(h.YMD_SALE) as YMD_SALE,'
             +'       ''판매'' as KIND, '
             +vSelectSql
             +'       h.YMD_SALE+''-''+h.NO_POS+''-''+h.NO_RCP as ReceiptNo, '
             +'       Max(h.AMT_SALE) as AMT_TOT, '
             +'       Max(h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP) as AMT_CASH, '
             +'       Max(h.AMT_DUTYFREE) as AMT_DUTYFREE '
             +'  from SL_SALE_H as h inner join '
             +'       (select CD_STORE, '
             +'               YMD_SALE, '
             +'               NO_POS, '
             +'               NO_RCP, '
             +'              case when AMT_VAT  = 0 then AMT_SALE-DC_TOT else 0 end AMT_DUTYFREE, '
             +'              case when AMT_VAT <> 0 then AMT_SALE-DC_TOT else 0 end AMT_NET '
             +'          from SL_SALE_D '
             +'         where CD_STORE = :P0 '
             +'           and YMD_SALE  Between :P1 AND :P2 '
             +'           and DS_SALE  <> ''V'' '
             +'        ) as d on h.CD_STORE = d.CD_STORE and h.YMD_SALE = d.YMD_SALE and h.NO_POS = d.NO_POS and h.NO_RCP = d.NO_RCP '
             +' where h.CD_STORE = :P0 '
             +'   and h.DS_SALE  <> ''V'' '
             +'   and h.YMD_SALE Between :P1 AND :P2 '
             +vConditionWhere1
             +'   and h.CD_MEMBER =:P3 '
             +'   and (h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP) <> 0 '
             +'group by h.YMD_SALE, h.NO_POS, h.NO_RCP '
//             +vHaving
             +vSelectSql1
             +'order by 1 ',
             [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index]]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end;
end;


procedure TMemberVatInvoiceForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
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
                   +'         NM_MEMBER as NM_MEMBER '
                   +'from     MS_MEMBER '
                   +'where    CD_STORE  = '''+Ifthen(GetOption(257)='0', StoreCode,'0000')+''''
                   +'  and   (CD_MEMBER  = :P1 or NM_MEMBER like ''%''+:P1+''%'') '
                   +'  and    YN_INVOICE = ''Y'' '
                   +'  and    DS_STATUS = 0 '
                   +'order by CD_MEMBER';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
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

end.
