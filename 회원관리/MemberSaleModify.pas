// 매입 정정 (완료)

//##### 매입수정 버튼 시 매입창 띄우는 부분 수정...

unit MemberSaleModify;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, StrUtils,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  ExtCtrls, AdvSplitter, cxCurrencyEdit, AdvToolBarStylers, StdCtrls,
  cxRadioGroup, frxClass, Math, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, frxExportImage, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk;

type
  TMemberSaleModifyForm = class(TInheritShow2Form)
    GridSplitter: TAdvSplitter;
    GridDBTableViewRcpNo: TcxGridDBColumn;
    GridDBTableViewDsSale: TcxGridDBColumn;
    GridDBTableViewCompanyName: TcxGridDBColumn;
    GridDBTableViewNetAmt: TcxGridDBColumn;
    GridDBTableViewVatAmt: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubDBTableViewSalePrice: TcxGridDBColumn;
    GridSubDBTableViewDcAmt: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewDsAcct: TcxGridDBColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarSeparator3: TAdvToolBarSeparator;
    GridDBTableViewDCAmt: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewPosNo: TcxGridDBColumn;
    GridSubDBTableViewNetAmt: TcxGridDBColumn;
    GridSubDBTableViewTaxAmt: TcxGridDBColumn;
    GridTableView1: TcxGridTableView;
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
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1SaleQty: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    FastReportDataSet: TfrxUserDataSet;
    GridTableViewColumn12: TcxGridColumn;
    GridTableViewColumn13: TcxGridColumn;
    GridDBTableViewSaleDate: TcxGridDBColumn;
    GridDBTableViewTaxNo: TcxGridDBColumn;
    GridTableView1SalePrice: TcxGridColumn;
    GridDBTableViewDTSale: TcxGridDBColumn;
    GridDBTableViewSawonCode: TcxGridDBColumn;
    FastReportSaleDataSet: TfrxUserDataSet;
    GridTableView1Column4: TcxGridColumn;
    FastReport: TfrxReport;
    GridTableViewColumn14: TcxGridColumn;
    GridTableViewColumn15: TcxGridColumn;
    GridTableViewColumn16: TcxGridColumn;
    GridTableViewColumn17: TcxGridColumn;
    GridTableViewColumn18: TcxGridColumn;
    GridTableViewColumn19: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1NepumQty: TcxGridColumn;
    frxTIFFExport1: TfrxTIFFExport;
    GridTableViewColumn20: TcxGridColumn;
    ConditionToolBarPrintLabel: TcxLabel;
    ConditionToolBarPrintComboBox: TcxComboBox;
    GridDBTableViewTotAmt: TcxGridDBColumn;
    GridDBTableViewFreeAmt: TcxGridDBColumn;
    GridDBTableViewNoTaxNo: TcxGridDBColumn;
    GridDBTableViewAcctNo: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FastReportDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportSaleDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportSaleDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure GridDBTableViewDsSaleCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);

  private
    RecordCount :Integer;
    procedure Print(aPrint:Integer);
  protected
    function  DoSearch:Boolean; override;
    procedure DoPrint;   override;
    procedure DoPreview; override;
    procedure DoTIF;     override;
  end;

var
  MemberSaleModifyForm: TMemberSaleModifyForm;



implementation

uses
  Common, DBModule, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때

procedure TMemberSaleModifyForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode   := pmPrintPreviewTif;
  DefaultDate := ddToday;
  //매출처 판매시 판매단가에 수수점 사용여부
  if GetOption(260) = '1' then
  begin
    TcxCustomCurrencyEditProperties(GridSubDBTableViewSalePrice.Properties).DisplayFormat := ',0.#';
    TcxCustomCurrencyEditProperties(GridSubDBTableViewSalePrice.Properties).DecimalPlaces := 1;
  end;
end;

procedure TMemberSaleModifyForm.FastReportDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportDataSet.RecNo >= GridTableView.DataController.RecordCount;
end;

procedure TMemberSaleModifyForm.FastReportDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
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

procedure TMemberSaleModifyForm.FastReportSaleDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView1.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportSaleDataSet.RecNo >= RecordCount;
end;

procedure TMemberSaleModifyForm.FastReportSaleDataSetNewGetValue(
  Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView1.ColumnCount-1 do
    if GridTableView1.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      if FastReportSaleDataSet.RecNo < GridTableView1.DataController.RecordCount then
      begin
        if (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'SEQ') or
           (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'AMT_SALE') or
           (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'AMT_DC') then
          Value := FormatFloat('#,0',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
        else if (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'QTY_SALE') then
        begin
          if (((Ord(GetOption(268)) - Ord('A')) and 4) = 4) and
             (NVL(GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, GridTableView1NepumQty.Index],0) > 1) and
             (GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex] mod NVL(GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, GridTableView1NepumQty.Index],0) = 0)  then
            Value := '('+ FormatFloat('#0',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex] div NVL(GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, GridTableView1NepumQty.Index],0)) +')'+FormatFloat('#,0.#',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
          else
            Value := FormatFloat('#,0.#',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex]);
        end
        else if (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'PR_SALE') then
          Value := FormatFloat('#,0.#',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
        else
        begin
          Value := GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex]
        end;
      end
      else
        if (FastReportSaleDataSet.RecNo = GridTableView1.DataController.RecordCount) and (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'NM_GOODS') then
          Value := '         -  이하여백  -  '
        else
          Value := '';
      break;
    end;
end;

//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TMemberSaleModifyForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // 단축키 처리를 한다
  case Key of
    VK_F4 : ButtonToolBarDeleteButton.Click;
    VK_F5 : ButtonToolBarSaveButton.Click;
  end;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TMemberSaleModifyForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TMemberSaleModifyForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var
  vSaleDate,
  vPosNo,
  vRcpNo: string;
begin
  if not ButtonToolBarDeleteButton.Visible or not ButtonToolBarDeleteButton.Enabled then
    Exit;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index] <> '00') and (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index] < '90') then
  begin
    ErrBox('POS에서 판매한 자료는 삭제할 수 없습니다.');
    Exit;
  end;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewTaxNo.Index] <> '') then
  begin
    ErrBox(GridDBTableViewTaxNo.Caption+'가 발행된 전표는 삭제할 수 없습니다.');
    Exit;
  end;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewNoTaxNo.Index] <> '') then
  begin
    ErrBox(GridDBTableViewNoTaxNo.Caption+'가 발행된 전표는 삭제할 수 없습니다.');
    Exit;
  end;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewAcctNo.Index] <> '') then
  begin
    ErrBox('외상이 결제된 전표는 삭제할 수 없습니다.');
    Exit;
  end;

  inherited;

  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('삭제할 판매 자료를 선택하십시오.');
    Exit;
  end;

  try
    OpenQuery('select Count(*) '
             +'from   SL_CASHIER_MGM '
             +'where  CD_STORE  = :P0 '
             +'  and  YMD_CLOSE = :P1 '
             +'  and  NO_POS    = :P2 '
             +'  and  CD_SAWON  = :P3 '
             +'  and  YN_CLOSE  = ''Y'' ',
             [StoreCode,
              Replace(LeftStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleDate.Index],10),'-',''),
              GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index],
              GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSawonCode.Index]]);
    if Query.Fields[0].AsInteger > 0 then
    begin
      ErrBox('계산원 마감이 완료된 영수증은 삭제할 수 없습니다.');
      Exit;
    end;
  finally
    FinishQuery;
  end;

  vSaleDate := GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleDate.Index]);
  vPosNo    := String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index]);
  vRcpNo    := String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewRcpNo.Index]);

  // 월 마감 된 날짜의 매입은 삭제 못한다
  if OpenQuery('select   Top 1 YN_CLOSE '
              +'from     SL_STOCK_MONTH '
              +'where    CD_STORE = :P0 '
              +'  and    YM_STOCK = Left(:P1, 6) '
              +'  and    YN_CLOSE = ''Y'' ',
               [StoreCode,
                vSaleDate],
                true) then
  begin
    ErrBox(Format('%s-%s월은 마감이 되어 판매를 삭제를 할 수 없습니다.', [Copy(vSaleDate,1,4), Copy(vSaleDate,5,2)]));
    FinishQuery;
    Exit;
  end;

  if not AskBox('판매 자료를 삭제하시겠습니까?') then
    Exit;

  // 삭제한다
  try
    BeginTrans;

    // 판매 디테일 테이블을 삭제한다
    ExecQuery('update SL_SALE_D set DS_SALE = ''V'' '
             +'where  CD_STORE = :P0 '
             +'  and  YMD_SALE = :P1 '
             +'  and  NO_POS   = :P2 '
             +'  and  NO_RCP   = :p3 ',
              [StoreCode,
               vSaleDate,
               vPosNo,
               vRcpNo],
               false);

    // 판매 디테일 테이블을 삭제한다
    ExecQuery('update SL_SALE_H set DS_SALE = ''V'' '
             +'where  CD_STORE = :P0 '
             +'  and  YMD_SALE = :P1 '
             +'  and  NO_POS   = :P2 '
             +'  and  NO_RCP   = :p3 ',
              [StoreCode,
               vSaleDate,
               vPosNo,
               vRcpNo],
               false);

    // 신용카드 테이블을 삭제한다
    ExecQuery('delete SL_CARD '
             +' where CD_STORE =:P0 '
             +'   and YMD_SALE =:P1 '
             +'   and NO_POS   =:P2 '
             +'   and NO_RCP   =:P3 ',
             [StoreCode,
              vSaleDate,
              vPosNo,
              vRcpNo],
              false);

    //포인트 삭제
    ExecQuery('delete from SL_PNT_OCCUR '
             +'where LINK  =:P0 ',
             [StoreCode +
              vSaleDate +
              vPosNo +
              vRcpNo],
              false);

    CommitTrans;

    // 선택된 레코드를 삭제한다
    PlayWave('Deleted');
    ShowMsg('판매 자료를 Void 처리했습니다.');
    GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewDsSale.Index] := '취소';
    if not GridDBTableViewDsSale.Visible then
      GridDBTableViewDsSale.Visible := true;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 수정 버튼
procedure TMemberSaleModifyForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  if LowerCase(UserCode)= userMaster then
  begin
    ErrBox('master 사용자로는 수정을 할 수 없습니다.');
    Exit;
  end;

  inherited;
  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('수정할 판매 자료를 선택하십시오.');
    Exit;
  end;

  if DM.CheckMonthClose(Replace(LeftStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleDate.Index],10),'-','')) then
    Exit;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index] < '90')
     and (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index] <> '00') then
  begin
    ErrBox('POS의 판매 자료는 수정할 수 없습니다.');
    Exit;
  end;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewTaxNo.Index] <> '') then
  begin
    ErrBox(GridDBTableViewTaxNo.Caption+'가 발행된 전표는 수정할 수 없습니다.');
    Exit;
  end;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewNoTaxNo.Index] <> '') then
  begin
    ErrBox(GridDBTableViewNoTaxNo.Caption+'가 발행된 전표는 수정할 수 없습니다.');
    Exit;
  end;

  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewAcctNo.Index] <> '') then
  begin
    ErrBox('외상이 결제된 전표는 수정할 수 없습니다.');
    Exit;
  end;



  if GetOption(265) = '1' then
  begin
    try
      OpenQuery('select Count(*) '
               +'from   SL_CASHIER_MGM '
               +'where  CD_STORE  = :P0 '
               +'  and  YMD_CLOSE = :P1 '
               +'  and  NO_POS    = :P2 '
               +'  and  CD_SAWON  = :P3 '
               +'  and  YN_CLOSE  = ''Y'' ',
               [StoreCode,
                Replace(LeftStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleDate.Index],10),'-',''),
                GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index],
                GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSawonCode.Index]]);

      if Query.Fields[0].AsInteger > 0 then
      begin
        ErrBox('계산원 마감이 완료된 영수증은 수정할 수 없습니다.');
        Exit;
      end;
    finally
      FinishQuery;
    end;
  end;

  //#####
  FormParam[0] := LeftStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleDate.Index],10)+
                  GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index]+
                  GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewRcpNo.Index];
  ExtremeMainForm.RunProgram('MemberSale')
end;

procedure TMemberSaleModifyForm.Print(aPrint: Integer);
  function GetValueHan(Value: Extended): String;
  var
     s: String;
     i, iDiv, iMod: Integer;
     Flag: Boolean;
  const
        M1: Array[0..9] of String= ('','일','이','삼','사','오','육','칠','팔','구');
        M2: Array[0..3] of String =('','십','백','천');
        M3: Array[0..3] of String =('','만','억','조');
  begin
    s := FloatToStr(Abs(Value));
    if pos('.', s) > 0 then s := Copy(s, 1, pos('.',s)-1);

    Flag := False;
    Result := '';
    for i := 1 to Length(s) do
    begin
      iDiv := (Length(s)-i) div 4;
      iMod := (Length(s)-i) mod 4;

      if StrToInt(s[i]) <> 0 then
      begin
        Flag := True;
        Result := Result + M1[StrToInt(s[i])] + M2[iMod];
      end;
      if (iMod = 0) and Flag then
      begin
        Flag := False;
        Result := Result + M3[iDiv];
      end;
    end;
  end;
const FIRSTPAGELINE = 29;
var
  vMemo : TfrxMemoView;
  vPicture: TfrxPictureView;
  vIndex: Double;
begin
  OpenQuery('SELECT  ''전표번호 : ''+b.YMD_SALE+''-''+b.NO_POS+''-''+b.NO_RCP as NO_RCP, '
           +'        a.NM_STORE, '
           +'        a.NO_BIZER, '
           +'        a.NM_BOSS, '
           +'        a.ADDR1+'' ''+a.ADDR2 as ADDRESS, '
           +'        a.TEL_OFFICE + ''  FAX ''+a.TEL_FAX AS TEL_OFFICE, '
           +'        c.NM_MEMBER +'' 귀하'' as NM_TRDPL, '
           +'        (b.AMT_DUTY + b.AMT_TAX) - Convert(Int, (b.AMT_DUTY + b.AMT_TAX) / 11)  as AMT_NET, '                                   //과세금액
           +'        Convert(Int, (b.AMT_DUTY + b.AMT_TAX) / 11) as AMT_TAX, '                                               //부가세
           +'        b.AMT_SALE, '                                              //판매금액
           +'        b.AMT_SALE - b.AMT_TRUST as AMT_PAY, '
           +'        ISNULL(c.AMT_MISU,0) + b.AMT_TRUST as AMT_MISU, '
           +'        c.TEL_OFFICE as TEL_OFFICE_TRD, '
           +'        c.COMPANY_ADDRESS, '
           +'        a.BILL_REMARK + case when IsNull(a.BILL_REMARK,'''') = '''' then '''' else Char(13) end + b.REMARK as BILL_REMARK, '
           +'        b.AMT_SALE+b.DC_TOT as AMT_SALE_TOT, '                     //합계금액
           +'        b.DC_TOT as AMT_DC, '                                      //할인금액
           +'        b.AMT_DUTYFREE '                                           //면세금액
           +'  FROM  MS_STORE a inner join '
           +'       SL_SALE_H b on a.CD_STORE = b.CD_STORE and b.YMD_SALE = :P1 and b.NO_POS = :P2 and b.NO_RCP = :P3 inner join '
           +'        (select t1.CD_MEMBER, '
           +'                t1.NM_MEMBER, '
           +'                dbo.Decrypt(t1.TEL_JOB, 5869,29486,4921) as TEL_OFFICE, '
           +'                t1.ADDR1 +'' ''+t1.ADDR2 as COMPANY_ADDRESS, '
           +'                Isnull(t2.AMT_BASE,0)+Isnull(t3.AMT_TRUST,0)-isnull(t4.AMT_MISU,0) as AMT_MISU '
           +'           from MS_MEMBER      t1 left outer join '
           +'                SL_BOOKS_MONTH t2 on t2.CD_STORE =:P0 and t1.CD_MEMBER = t2.CD_CODE and t2.CD_CLOSE = ''20'' and t2.CD_CODE <> '''' and t2.ym_close = LEFT(:P1,6)  left outer join '
           +'                (select CD_STORE, '
           +'                        CD_MEMBER, '
           +'                        Sum(AMT_TRUST) as AMT_TRUST  '
           +'                   from SL_SALE_H  '
           +'                  where DS_SALE <> ''V'' '
           +'                    and CD_MEMBER <> '''' '
           +'                    and YMD_SALE between LEFT(:P1,6)+''01'' and :P1 and DS_SALE <> ''V'' and Convert(varchar(19), DT_SALE, 120) < :P4 '
           +'                  group by CD_STORE, CD_MEMBER '
           +'                ) t3 on t3.CD_STORE =:P0 and t1.CD_MEMBER = t3.CD_MEMBER left outer join '
           +'                (select CD_STORE, '
           +'                        CD_MEMBER, '
           +'                        SUM(isnull(AMT_PAYIN,0)+isnull(AMT_DC,0)) as AMT_MISU '
           +'                   from SL_ACCT '
           +'                  where YMD_OCCUR between LEFT(:P1,6)+''01'' and :P1 and Convert(varchar(19), DT_INSERT, 120) < :P4 '
           +'                  group by CD_STORE, CD_MEMBER '
           +'                 ) t4 on t4.CD_STORE =:P0 and t1.CD_MEMBER = t4.CD_MEMBER '
           +'          where t1.CD_STORE = :P5 '
           +'         ) c on b.CD_MEMBER = c.CD_MEMBER '
           +' WHERE  a.CD_STORE =:P0',
           [StoreCode,
            GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleDate.Index]),
            GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewPosNo.Index],
            GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewRcpNo.Index],
            GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewDtSale.Index],
            Ifthen(GetOption(257)='0', StoreCode,'0000')]);
  DM.ReadQuery(Query, GridTableView);
  if GridTableView.DataController.RecordCount > 0 then
  begin
    GridTableView.DataController.Values[0, GridTableViewColumn20.Index] := IfThen(ConditionToolBarPrintComboBox.ItemIndex=1, '견   적   서', '거 래 명 세 서');
    GridTableView.DataController.Post;
  end;

  OpenQuery('SELECT  a.SEQ, '
           +'        case when a.AMT_VAT = 0 then ''*'' else '''' end + a.CD_GOODS as CD_GOODS, '
           +Ifthen(((Ord(GetOption(262)) - Ord('A')) and 2) <> 2, ' b.NM_GOODS +'' ''+ b.NM_SPEC as NM_GOODS, ', ' b.NM_GOODS as NM_GOODS, ')
           +'        b.NM_SPEC as NM_SPEC, '
           +'        a.QTY_SALE, '
           +'        a.PR_SALE, '
           +'        a.AMT_SALE, ' //판매금액
           +'        a.DC_TOT as AMT_DC '
           +Ifthen(((Ord(GetOption(268)) - Ord('A')) and 4) <> 4,'',', (select  TOP 1 QTY_NEPUM '
                                        +'     from  MS_GOODS '
                                        +'    where  CD_STORE   = b.CD_STORE '
                                        +'      and  CD_GOODS_T = b.CD_GOODS  '
                                        +'      and  QTY_NEPUM  > 1 '
                                        +'    order by QTY_NEPUM ) as QTY_NEPUM ')
           +'  FROM SL_SALE_D a inner join '
           +'       MS_GOODS  b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
           +' WHERE a.CD_STORE =:P0 AND a.YMD_SALE =:P1 AND a.NO_POS =:P2 AND a.NO_RCP =:P3 '
           +' ORDER BY a.SEQ ',
           [StoreCode,
            GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleDate.Index]),
            GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewPosNo.Index],
            GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewRcpNo.Index]]);
  DM.ReadQuery(Query, GridTableView1);

  RecordCount := GridTableView1.DataController.RecordCount;
  // 1페이지
  if RecordCount <= FIRSTPAGELINE then RecordCount := FIRSTPAGELINE
  else
  begin
    RecordCount := ((RecordCount - FIRSTPAGELINE) div 40) * 40 + FIRSTPAGELINE + Ifthen(((RecordCount - FIRSTPAGELINE) mod 40)=0,0,40);
  end;

  // 날짜
  vMemo := TfrxMemoView(FastReport.FindObject('SaleDate'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatDateTime('yyyy"년 "mm"월 "dd"일"', StoD(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleDate.Index]));

  // 출력일시
  vMemo := TfrxMemoView(FastReport.FindObject('PrintTime'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '출력일시 : '+FormatDateTime(fmtDateTime, Now);

  // 서명이미지
  vPicture := TfrxPictureView(FastReport.FindObject('SignPicture'));
  if Assigned(vPicture) then
    vPicture.Picture.Assign(StoreSignImage);

  // 규격
  if (((Ord(GetOption(262)) - Ord('A')) and 2) = 2) then
  begin
    vIndex := 0;
    vMemo  := TfrxMemoView(FastReport.FindObject('SpecLabel'));
    if Assigned(vMemo) and not vMemo.Visible then
    begin
      vMemo.Visible   := true;
      vIndex          := vMemo.Width;
    end;
    vMemo  := TfrxMemoView(FastReport.FindObject('GoodsNameLabel'));
    if Assigned(vMemo) then
    begin
      vMemo.Memo.Text := '상품이름';
      vMemo.Width     := vMemo.Width - vIndex;
    end;
    vMemo  := TfrxMemoView(FastReport.FindObject('SpecData'));
    if Assigned(vMemo) and not vMemo.Visible then
    begin
      vMemo.Visible   := true;
      vIndex          := vMemo.Width;
    end;
    vMemo  := TfrxMemoView(FastReport.FindObject('GoodsNameData'));
    if Assigned(vMemo) then
      vMemo.Width     := vMemo.Width - vIndex;
  end;

  // 할인금액
  if (((Ord(GetOption(262)) - Ord('A')) and 8) = 8) then
  begin
    vIndex := 0;
    vMemo  := TfrxMemoView(FastReport.FindObject('Memo3'));
    if Assigned(vMemo) and vMemo.Visible then
    begin
      vMemo.Visible := false;
      vIndex        := vMemo.Width;
    end;
    if vIndex > 0 then
    begin
      vMemo := TfrxMemoView(FastReport.FindObject('Memo24'));
      if Assigned(vMemo) then
        vMemo.Visible := false;
      vMemo := TfrxMemoView(FastReport.FindObject('GoodsNameLabel'));
      if Assigned(vMemo) then
        vMemo.Width   := vMemo.Width + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('GoodsNameData'));
      if Assigned(vMemo) then
        vMemo.Width   := vMemo.Width + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SpecLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SpecData'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('Memo28'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SalePlanAmtLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SaleVatAmtCaptionLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SalePlanRateLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SalePlanAmtCaptionLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SaleCustomerAmtLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
    end;
  end;

  // 합계금액
  vMemo := TfrxMemoView(FastReport.FindObject('SaleAmoutText'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := GetValueHan(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleAmt.Index])+'원정';
  vMemo := TfrxMemoView(FastReport.FindObject('SaleAmt'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '( ￦'+FormatFloat('#,0',GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleAmt.Index])+' )';

  //출력매수
  FastReport.PrintOptions.Copies := StoI(GetOption(261));

  // 미수내역
  if ((Ord(GetOption(262)) - Ord('A')) and 1) <> 1 then
  begin
    vMemo := TfrxMemoView(FastReport.FindObject('MisuAmt'));
    if Assigned(vMemo) then vMemo.Visible := true;
  end
  else
  begin
    vMemo := TfrxMemoView(FastReport.FindObject('MisuAmt'));
    if Assigned(vMemo) then vMemo.Visible := false;
  end;

  //하단문구
  vMemo := TfrxMemoView(FastReport.FindObject('RemarkTelMemo'));
  if Assigned(vMemo) then
    vMemo.Visible := CharInSet(GetOption(263), ['1','3','5','7']);
  vMemo := TfrxMemoView(FastReport.FindObject('RemarkAddressMemo'));
  if Assigned(vMemo) then
  begin
    vMemo.Visible := CharInSet(GetOption(263), ['2','3','6','7']);
    vMemo.Top     := IfThen(CharInSet(GetOption(263), ['2','6']), 6, 29);
  end;
  vMemo := TfrxMemoView(FastReport.FindObject('RemarkMemo'));
  if Assigned(vMemo) then
  begin
    vMemo.Visible := GetOption(263) >= '4';
    vMemo.Top     := IfThen(GetOption(263)='4',  6, IfThen(GetOption(263)='7', 51, 29));
    vMemo.Height  := IfThen(GetOption(263)='4', 86, IfThen(GetOption(263)='7', 40, 63));
  end;

  // 출력
  case aPrint of
    0 : FastReport.Print;
    1 : FastReport.ShowReport;
    2 :
    begin
      FastReport.ShowReport;
      if not DirectoryExists(ExtractFilePath(Application.ExeName)+'거래명세서') then
        ForceDirectories(ExtractFilePath(Application.ExeName)+'거래명세서');
      frxTIFFExport1.DefaultPath := ExtractFilePath(Application.ExeName)+'거래명세서';
      frxTIFFExport1.FileName    := GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyName.Index]
                                    +'('+Replace(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, 0],'-','')+'-'+
                                         GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, 1]+'-'+
                                         GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, 2]+')';
      FastReport.Export(frxTIFFExport1);
    end;
  end;
end;

//------------------------------------------------------------------------------
// 매입 그리드 다른 레코드를 선택할 때
procedure TMemberSaleModifyForm.GridDBTableViewDsSaleCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

  if AViewInfo.Text = '취소' then
    ACanvas.Font.Color := clRed;
end;

procedure TMemberSaleModifyForm.GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  try
    ButtonToolBarDeleteButton.Enabled := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewRcpNo.Index] <> null;
    ButtonToolBarSaveButton.Enabled   := ButtonToolBarDeleteButton.Enabled;
  except
  end;
end;

procedure TMemberSaleModifyForm.GridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
  if GridDBTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridDBTableViewDsSale.Index] = '반품' then
    AStyle := StyleFontBlue
  else if ARecord.Values[GridDBTableViewDsSale.Index] = '취소' then
    AStyle := StyleFontRed;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TMemberSaleModifyForm.DoSearch:Boolean;
var
  vConditionSql,
  vConditionAcct :String;
begin
//  inherited;
  if ConditionToolBarEdit.Text <> '' then
    vConditionSql := 'and b.NM_MEMBER like ''%''+'''+ConditionToolBarEdit.Text+'''+''%'' '
  else
    vConditionSql := EmptyStr;

  case ConditionToolBarComboBox.ItemIndex of
    0 : vConditionAcct := EmptyStr;
    1 : vConditionAcct := ' and a.AMT_SALE = a.AMT_TRUST ';
    2 : vConditionAcct := ' and a.AMT_CARD = 0 and a.AMT_CASHRCP = 0 ';
    3 : vConditionAcct := ' and (a.AMT_CARD <> 0 or a.AMT_CASHRCP <> 0)';
  end;


  OpenQuery('select   dbo.StoD(a.YMD_SALE) as YMD_SALE, '
           +'         a.NO_POS, '
           +'         a.NO_RCP, '
           +'         case a.DS_SALE when ''S'' then ''판매'' when ''V'' then ''취소'' when ''B'' then ''반품'' end as DS_SALE, '
           +'         b.NM_MEMBER, '
           +'         a.AMT_SALE + a.DC_TOT as AMT_SALE_TOT, '
           +'         a.AMT_DUTY as AMT_NET, '
           +'         a.AMT_TAX, '
           +'         a.AMT_DUTYFREE, '
           +'         a.AMT_SALE, '
           +'         a.DC_TOT, '
           +'         case when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT = 0 and a.AMT_CASHRCP = 0 and a.AMT_OKC = 0 and a.AMT_TMONEY = 0 and a.AMT_CASH <> 0                                          then ''현금'' '
           +'              when a.AMT_CARD <>0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT = 0 and a.AMT_CASHRCP = 0 and a.AMT_OKC = 0 and a.AMT_TMONEY = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_CARD))    then ''신용카드'' '
           +'              when a.AMT_CARD = 0 and a.AMT_CHECK <>0 and a.AMT_TRUST = 0 and a.AMT_GIFT = 0 and a.AMT_CASHRCP = 0 and a.AMT_OKC = 0 and a.AMT_TMONEY = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_CHECK))   then ''수표'' '
           +'              when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST <>0 and a.AMT_GIFT = 0 and a.AMT_CASHRCP = 0 and a.AMT_OKC = 0 and a.AMT_TMONEY = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_TRUST))   then ''외상'' '
           +'              when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT <> 0 and a.AMT_CASHRCP = 0 and a.AMT_OKC = 0 and a.AMT_TMONEY = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_GIFT))    then ''상품권'' '
           +'              when a.AMT_CARD = 0 and (a.AMT_CHECK + a.AMT_CASH) = a.AMT_CASHRCP and a.AMT_CASHRCP <> 0  then ''현금영수증'' '
           +'              when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT = 0 and a.AMT_CASHRCP = 0 and a.AMT_OKC <>0 and a.AMT_TMONEY = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_OKC))     then ''OK캐쉬백'' '
           +'              when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT = 0 and a.AMT_CASHRCP = 0 and a.AMT_OKC = 0 and a.AMT_TMONEY <>0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_TMONEY))  then ''T-money'' '
           +'              else ''복합'' end as DS_ACCT, '
           +'         Isnull(a.NO_TAX_REF,'''') as NO_TAX_REF, '
           +'         Convert(varchar(16), a.DT_SALE, 120) as DT_SALE, '
           +'         a.CD_STORE + a.YMD_SALE + a.NO_POS + a.NO_RCP as LINK, '
           +'         a.CD_SAWON, '
           +'         Isnull(a.NO_NOTAX_REF,'''') as NO_NOTAX_REF, '
           +'         Isnull(a.NO_ACCT_REF,'''') as NO_ACCT_REF '
           +'from     SL_SALE_H as a inner join '
           +'         MS_MEMBER as b on b.CD_STORE =:P3 and a.CD_MEMBER = b.CD_MEMBER '+vConditionSql//and b.DS_CLASS = ''1'' '
           +'where    a.CD_STORE = :P0 '
           +'  and    a.YMD_SALE between :P1 and :P2 '
           +vConditionAcct
           +'  and    a.CD_MEMBER <> '''' '
           +'  and    a.DS_SALE <> ''V'' '
           +'order by a.CD_STORE, a.YMD_SALE, a.NO_POS, a.NO_RCP',
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             Ifthen(GetOption(257)='0', StoreCode,'0000')]);
  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;
  Result := GridDBTableView.DataController.RecordCount > 0;

  if GridDBTableView.DataController.RecordCount > 0 then
  begin
    // 판매 디테일 쿼리를 열어 그리드에 보여준다
    OpenQuery('select   a.SEQ, '
             +'         a.CD_GOODS, '
             +'         b.NM_GOODS, '
             +'         b.NM_SPEC, '
             +'         a.QTY_SALE, '
             +'         a.PR_SALE, '
             +'         a.DC_TOT, '
             +'         a.AMT_SALE - a.AMT_VAT - a.DC_TOT as AMT_NET, '
             +'         a.AMT_VAT as AMT_TAX, '
             +'         a.AMT_SALE, '
             +'         a.CD_STORE + a.YMD_SALE + a.NO_POS + a.NO_RCP as LINK '
             +'from     SL_SALE_D as a inner join '
             +'         SL_SALE_H as h on a.CD_STORE = h.CD_STORE and a.YMD_SALE = h.YMD_SALE and a.NO_POS = h.NO_POS and a.NO_RCP = h.NO_RCP inner join '
             +'         MS_GOODS as b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
             +'where    a.CD_STORE = :P0 '
             +'  and    a.YMD_SALE between :P1 and :P2 '
             +'order by a.CD_STORE, a.YMD_SALE, a.NO_POS, a.NO_RCP, a.SEQ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;
  end;
end;
procedure TMemberSaleModifyForm.DoTIF;
begin
  inherited;
  Print(2);
end;

//------------------------------------------------------------------------------
// 미리보기
procedure TMemberSaleModifyForm.DoPreview;
begin
//  inherited;

  Print(1);
end;

//------------------------------------------------------------------------------
// 출력
procedure TMemberSaleModifyForm.DoPrint;
begin
  inherited;
  Print(0);
end;
end.
