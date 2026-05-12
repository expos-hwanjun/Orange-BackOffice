// 발주 정정 (완료)


unit BuyOrderModify;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, StrUtils,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  ExtCtrls, AdvSplitter, cxCurrencyEdit, AdvToolBarStylers, StdCtrls,
  cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, cxImageComboBox, dxPSCore, dxPScxCommon,
  frxClass, Math, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  frxExportImage, DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TBuyOrderModifyForm = class(TInheritShow2Form)
    ListGrid: TcxGrid;
    ListGridTableView: TcxGridTableView;
    ListGridTableViewOrderDate: TcxGridColumn;
    ListGridLevel: TcxGridLevel;
    GridSplitter: TAdvSplitter;
    GridDBTableViewOrderNo: TcxGridDBColumn;
    GridDBTableViewCompanyName: TcxGridDBColumn;
    GridDBTableViewNetAmt: TcxGridDBColumn;
    GridDBTableViewVatAmt: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubDBTableViewOrderQty: TcxGridDBColumn;
    GridSubDBTableViewOrderPrice: TcxGridDBColumn;
    GridSubDBTableViewBuyAmt: TcxGridDBColumn;
    GridDBTableViewRemark: TcxGridDBColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarSeparator3: TAdvToolBarSeparator;
    GridDBTableViewOrderAmt: TcxGridDBColumn;
    GridDBTableViewDamdangName: TcxGridDBColumn;
    GridDBTableViewStatus: TcxGridDBColumn;
    GridSubDBTableViewSeq: TcxGridDBColumn;
    GridDBTableViewInsertDate: TcxGridDBColumn;
    GridDBTableViewOrderDate: TcxGridDBColumn;
    FastReport: TfrxReport;
    FastReportOrderDataSet: TfrxUserDataSet;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewDeliveryPlace: TcxGridDBColumn;
    GridDBTableViewDamdangTel: TcxGridDBColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    frxTIFFExport1: TfrxTIFFExport;
    GridDBTableViewOrderType: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FastReportOrderDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportOrderDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
  private
    RecordCount :Integer;
    procedure Print(aPrint: Integer);
  protected
    function  DoSearch:Boolean; override;
    procedure DoPrint;   override;
    procedure DoPreview; override;
    procedure DoTIF;     override;
  end;

var
  BuyOrderModifyForm: TBuyOrderModifyForm;



implementation

uses
  Common, DBModule, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyOrderModifyForm.FastReportOrderDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportOrderDataSet.RecNo >= RecordCount;
end;

procedure TBuyOrderModifyForm.FastReportOrderDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.ColumnCount-1 do
    if GridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      if FastReportOrderDataSet.RecNo < GridTableView.DataController.RecordCount then
      begin
        if (GridTableView.Columns[vIndex].DataBinding.FieldName = 'SEQ') or
           (GridTableView.Columns[vIndex].DataBinding.FieldName = 'QTY_ORDER') or
           (GridTableView.Columns[vIndex].DataBinding.FieldName = 'PR_ORDER') or
           (GridTableView.Columns[vIndex].DataBinding.FieldName = 'AMT_DUTY') then
          Value := FormatFloat('#,0',GridTableView.DataController.Values[FastReportOrderDataSet.RecNo, vIndex])
        else
        begin
          Value := GridTableView.DataController.Values[FastReportOrderDataSet.RecNo, vIndex]
        end;
      end
      else
        if (FastReportOrderDataSet.RecNo = GridTableView.DataController.RecordCount) and (GridTableView.Columns[vIndex].DataBinding.FieldName = 'NM_GOODS') then
          Value := '         -  이하여백  -  '
        else
          Value := '';
      break;
    end;
end;

procedure TBuyOrderModifyForm.FormActivate(Sender: TObject);
var vIndex, vIndex1 :Integer;
begin
  inherited;
  //매입등록에서 수정 후에 액티브 됐을때
  if FormParam[0] = 'BuyBuy' then
  begin
    vIndex  := ListGridTableView.DataController.FocusedRecordIndex;
    vIndex1 := GridDBTableView.DataController.FocusedRecordIndex;
    DoSearch;
    ListGridTableView.DataController.FocusedRecordIndex := vIndex;
    GridDBTableView.DataController.FocusedRecordIndex   := vIndex1;
  end;
end;

procedure TBuyOrderModifyForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewTIF;
  DefaultDate := ddToday;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TBuyOrderModifyForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TBuyOrderModifyForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TBuyOrderModifyForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  if not ButtonToolBarDeleteButton.Visible or not ButtonToolBarDeleteButton.Enabled then
    Exit;

  inherited;

  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('삭제할 매입 자료를 선택하십시오.');
    Exit;
  end;

  if GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index] = '매입' then
  begin
    ErrBox('매입이 완료된 발주는 삭제할 수 없습니다.');
    Exit;
  end;

  if not AskBox('발주서를 삭제하시겠습니까?') then
    Exit;

  // 삭제한다
  try
    BeginTrans;

    // 발주 디테일 테이블을 삭제한다
    ExecQuery('delete from SL_ORDER_D '
             +'where  CD_STORE = :P0 '
             +'  and  YMD_ORDER  = :P1 '
             +'  and  NO_ORDER   = :P2',
              [StoreCode,
               GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderDate.Index]),
               GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index]],
               false);


    // 매입 마스터 테이블을 삭제한다
    ExecQuery('delete from SL_ORDER_H '
             +'where  CD_STORE = :P0 '
             +'  and  YMD_ORDER= :P1 '
             +'  and  NO_ORDER = :P2',
              [StoreCode,
               GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderDate.Index]),
               GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index]],
               false);

    CommitTrans;

    // 선택된 레코드를 삭제한다
    PlayWave('Deleted');
    ShowMsg('발주서를 삭제했습니다.');
    GridDBTableView.DataController.DeleteFocused;
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
procedure TBuyOrderModifyForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  inherited;

  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('수정할 발주서를 선택하십시오.');
    Exit;
  end;

  //#####
  FormParam[0] := LeftStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderDate.Index],10)+
                  GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index];
  ExtremeMainForm.RunProgram('BuyOrder');
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 날짜목록 그리드 다른 레코드를 선택할 때
procedure TBuyOrderModifyForm.ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vDate: string;
begin
  inherited;

  try
    // 선택한 날짜에 해당하는 자료들만 발주 그리드에서 필터링해서 보여준다
    if ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewOrderDate.Index] <> null then
      vDate := ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewOrderDate.Index];

    GridDBTableView.BeginUpdate;
    try
      GridDBTableView.DataController.Filter.Clear;
      GridDBTableViewOrderDate.DataBinding.AddToFilter(nil, foEqual, vDate);
      GridDBTableView.DataController.Filter.Active := true;
    finally
      GridDBTableView.EndUpdate;
    end;
  except
  end;
end;

procedure TBuyOrderModifyForm.Print(aPrint: Integer);
var
  vMemo : TfrxMemoView;
  vPicture: TfrxPictureView;
  vTitle: TfrxReportTitle;
  vIndex: Integer;
begin
  if (GridDBTableView.DataController.RecordCount = 0) or (GridDBTableView.DataController.FocusedRecordIndex < 0) then
    Exit;

  OpenQuery('select   a.SEQ, '
           +'         a.CD_GOODS, '
           +'         b.NM_GOODS, '
           +'         b.NM_SPEC, '
           +'         a.QTY_ORDER, '
           +'         a.PR_ORDER, '
           +'         a.AMT_DUTY+a.AMT_DUTYFREE as AMT_DUTY '
           +'from     SL_ORDER_D as a left outer join '
           +'         MS_GOODS as b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
           +'where    a.CD_STORE  =:P0 '
           +'  and    a.YMD_ORDER =:P1 '
           +'  and    a.NO_ORDER  =:P2 '
           +'order by a.CD_STORE, a.YMD_ORDER, a.NO_ORDER, a.SEQ',
            [StoreCode,
             GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderDate.Index]),
             GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index]]);
  DM.ReadQuery(Query, GridTableView, nil);

  RecordCount := GridTableView.DataController.RecordCount;

  // 발주번호
  vMemo := TfrxMemoView(FastReport.FindObject('OrderNo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '발주번호 : '+GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderDate.Index])+'-'+GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index];

  vPicture := TfrxPictureView(FastReport.FindObject('SignPicture'));
  if Assigned(vPicture) then
    vPicture.Picture.Assign(StoreSignImage);

  // 날짜
  vMemo := TfrxMemoView(FastReport.FindObject('OrderDate'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatDateTime('yyyy"년 "mm"월 "dd"일"', StoD(GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderDate.Index])) );

  //거래처
  vMemo := TfrxMemoView(FastReport.FindObject('CompanyName'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '수신 : '+GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCompanyName.Index];

  // 발주금액
  vMemo := TfrxMemoView(FastReport.FindObject('OrderAmt'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := LPad(FormatFloat('#,0',GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderAmt.Index]),20)+' 원';

  // 비고
  vMemo  := TfrxMemoView(FastReport.FindObject('Remark'));
  vIndex := 0;
  if Assigned(vMemo) then
  begin
    vMemo.Memo.Text := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewRemark.Index];
    vIndex := (Length(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewRemark.Index]) - Length(StringReplace(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewRemark.Index], #13, '', [rfReplaceAll]))) div Length(#13);
    if vIndex > 0 then
      Inc(vIndex);
    vMemo.Height    := vIndex * 16;
  end;
  vTitle := TfrxReportTitle(FastReport.FindObject('ReportTitle'));
  if Assigned(vTitle) then
    vTitle.Height := 179 + vIndex * 16;

  // 비고 줄 수에 따라 디테일 레코드 수 결정
  RecordCount := GridTableView.DataController.RowCount;
  vIndex      := 31 - (vIndex * 2 div 3);
  // 1페이지
  if RecordCount <= vIndex then
    RecordCount := vIndex
  // 2페이지부터
  else
    RecordCount := ((RecordCount - vIndex) div 40) * 40 + vIndex + Ifthen(((RecordCount - vIndex) mod 40)=0,0,40);

  // 발주처
  vMemo := TfrxMemoView(FastReport.FindObject('StoreName'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := StoreName;

  // 납품장소
  vMemo := TfrxMemoView(FastReport.FindObject('DeliveryPlace'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewDeliveryPlace.Index];

  //담당자
  vMemo := TfrxMemoView(FastReport.FindObject('DamdangName'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewDamdangName.Index];

  //연락처
  vMemo := TfrxMemoView(FastReport.FindObject('DamdangTel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewDamdangTel.Index];

  // 발주금액
  vMemo := TfrxMemoView(FastReport.FindObject('TotalAmt'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatFloat('#,0',GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderAmt.Index]);

  // 출력일시
  vMemo := TfrxMemoView(FastReport.FindObject('PrintTime'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '출력일시 : '+FormatDateTime(fmtDateTime, Now);

  // 출력
  case aPrint of
    0 : FastReport.Print;
    1 : FastReport.ShowReport;
    2 :
    begin
      FastReport.ShowReport;
      if not DirectoryExists(ExtractFilePath(Application.ExeName)+'발주서') then
        ForceDirectories(ExtractFilePath(Application.ExeName)+'발주서');
      frxTIFFExport1.DefaultPath := ExtractFilePath(Application.ExeName)+'발주서';
      frxTIFFExport1.FileName    := GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyName.Index]
                                    +'('+Replace(ListGridTableView.DataController.Values[ListGridTableView.DataController.GetFocusedRecordIndex, ListGridTableViewOrderDate.Index],'-','')+'-'+
                                         GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, 0]+')';
      FastReport.Export(frxTIFFExport1);
    end;
  end;
end;

//------------------------------------------------------------------------------
// 매입 그리드 다른 레코드를 선택할 때
procedure TBuyOrderModifyForm.GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  try
    ButtonToolBarDeleteButton.Enabled := (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index] <> null) ;
    ButtonToolBarSaveButton.Enabled   := ButtonToolBarDeleteButton.Enabled;
  except
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
procedure TBuyOrderModifyForm.DoPreview;
begin
//  inherited;
  Print(1);
end;

procedure TBuyOrderModifyForm.DoPrint;
begin
//  inherited;
  Print(0);
end;

function TBuyOrderModifyForm.DoSearch:Boolean;
begin
//  inherited;
  Result := false;
  try
    // 날짜목록 쿼리를 열어 그리드에 보여준다
    OpenQuery('select   dbo.StoDW(YMD_ORDER) as YMD_ORDER '
             +'from     SL_ORDER_H '
             +'where    CD_STORE = :P0 '
             +'  and    YMD_ORDER  between :P1 and :P2 '
             +'group by CD_STORE, YMD_ORDER '
             +'order by YMD_ORDER ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := Query.RecordCount > 0;
    if DM.ReadQuery(Query, ListGridTableView) then
    begin
      // 매입 마스터 쿼리를 열어 그리드에 보여준다
      OpenQuery('select   a.NO_ORDER, '
               +'         case a.DS_ORDER when ''0'' then ''매입처 오프라인 발주'' when ''1'' then ''매입처 온라인 발주'' when ''2'' then ''본사 발주'' end as DS_ORDER, '
               +'         case a.DS_STEP  when ''0'' then ''발주'' when ''1'' then ''확정'' when ''2'' then ''취소'' when ''3'' then ''출고'' when ''4'' then ''매입'' end as DS_STEP, '
               +'         b.NM_TRDPL, '
               +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
               +'         a.AMT_TAX, '
               +'         a.AMT_ORDER, '
               +'         a.NM_DAMDANG, '
               +'         a.REMARK, '
               +'         a.DT_CHANGE, '
               +'         a.TEL_DAMDANG, '
               +'         a.DELIVERY_PLACE, '
               +'         dbo.StoDW(a.YMD_ORDER) as YMD_ORDER, '
               +'         a.CD_STORE + a.YMD_ORDER + a.NO_ORDER as LINK '
               +'from     SL_ORDER_H as a inner join '
               +'         MS_TRD   as b on a.CD_STORE = b.CD_STORE and a.CD_TRDPL = b.CD_TRDPL '
               +'where    a.CD_STORE = :P0 '
               +'  and    a.YMD_ORDER between :P1 and :P2 '
               +'order by a.CD_STORE, a.YMD_ORDER, a.NO_ORDER',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);
      GridDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, nil, MemData);
      GridDBTableView.DataController.DataSource := DataSource;

      if GridDBTableView.DataController.RecordCount > 0 then
      begin
        // 매입 디테일 쿼리를 열어 그리드에 보여준다
        OpenQuery('select   a.SEQ, '
                 +'         a.CD_GOODS, '
                 +'         b.NM_GOODS, '
                 +'         b.NM_SPEC, '
                 +'         a.QTY_ORDER, '
                 +'         a.PR_ORDER, '
                 +'         a.AMT_TAX, '
                 +'         a.AMT_DUTY+a.AMT_DUTYFREE as AMT_DUTY, '
                 +'         a.AMT_ORDER, '
                 +'         a.CD_STORE + a.YMD_ORDER + a.NO_ORDER as LINK '
                 +'from     SL_ORDER_D as a left outer join '
                 +'         MS_GOODS as b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
                 +'where    a.CD_STORE = :P0 '
                 +'  and    a.YMD_ORDER between :P1 and :P2 '
                 +'order by a.CD_STORE, a.YMD_ORDER, a.NO_ORDER, a.SEQ',
                  [StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   DtoS(ConditionToolBarToDateEdit.Date)]);
        GridSubDBTableView.DataController.DataSource := nil;
        DM.ReadQuery(Query, GridSubDBTableView, SubMemData);
        GridSubDBTableView.DataController.DataSource := SubDataSource;

        if ListGridTableView.DataController.RecordCount > 0 then
        begin
          ListGrid.SetFocus;
          ListGridTableView.DataController.FocusedRecordIndex := 0;
        end;
      end;
    end;
  except
  end;
end;

procedure TBuyOrderModifyForm.DoTIF;
begin
  inherited;
  Print(2);
end;

end.
