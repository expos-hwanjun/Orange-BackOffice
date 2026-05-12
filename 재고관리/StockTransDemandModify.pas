// 재고 이관 신청 조회

unit StockTransDemandModify;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSCore, dxPScxCommon, Menus, ImgList, AdvToolBar,
  AdvToolBarStylers, ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvOfficeTabSet, cxCurrencyEdit, dxPSPrVwRibbon, StrUtils,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TStockTransDemandModifyForm = class(TInheritShowForm)
    ConditionTabSet: TAdvOfficeTabSet;
    GridDetailLevel: TcxGridLevel;
    GridDetailTableView: TcxGridTableView;
    ButtonToolBarSaveButton: TAdvGlowButton;
    GridTableViewSendStoreName: TcxGridColumn;
    GridTableViewDemandDate: TcxGridColumn;
    GridTableViewDemandNo: TcxGridColumn;
    GridTableViewStatusName: TcxGridColumn;
    GridTableViewDemandAmt: TcxGridColumn;
    GridTableViewDemandEmpName: TcxGridColumn;
    GridTableViewDemandDateTime: TcxGridColumn;
    GridTableViewSendEmpName: TcxGridColumn;
    GridTableViewSendDateTime: TcxGridColumn;
    GridTableViewSendLinkNo: TcxGridColumn;
    GridDetailTableViewGoodsCode: TcxGridColumn;
    GridDetailTableViewGoodsName: TcxGridColumn;
    GridDetailTableViewGoodsSpec: TcxGridColumn;
    GridDetailTableViewBuyPrice: TcxGridColumn;
    GridDetailTableViewDemandQty: TcxGridColumn;
    GridDetailTableViewDemandAmt: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewSendStoreCode: TcxGridColumn;
    GridTableViewDemandEmpNo: TcxGridColumn;
    GridTableViewSendEmpNo: TcxGridColumn;
    GridDetailTableViewTransQty: TcxGridColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure GridDetailTableViewCustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure ConditionTabSetChange(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);

  private
    CurrentTransInfo: string;

    function DoSearchDetail: Boolean;

  protected
    function DoSearch: Boolean; override;
  end;

var
  StockTransDemandModifyForm: TStockTransDemandModifyForm;



implementation

uses
  Common, DBModule, Main, StockTransSend;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockTransDemandModifyForm.FormCreate(Sender: TObject);
begin
  inherited;
  // 기본값을 지정한다
  DefaultDate := ddLastWeek;
  PrintMode   := pmPreviewExcel;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TStockTransDemandModifyForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F5 : ButtonToolBarSaveButton.Click;
  end;

  inherited;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 수정 버튼
procedure TStockTransDemandModifyForm.ButtonToolBarDeleteButtonClick(
  Sender: TObject);
var
  vTransDate,
  vTransNo,
  vStoreCode: string;
begin
  if not AskBox('이관신청 전표를 삭제하시겠습니까?') then Exit;
  
  vTransDate := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index]);
  vTransNo   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index];

  // 이관 매장코드
  vStoreCode := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index];

  // 이미 수관한 전표인지 확인한다
  OpenQuery('select   DS_STATUS '
           +'from     SL_TRANS_H '
           +'where    CD_STORE  = :P0 '
           +'  and    YMD_TRANS = :P1 '
           +'  and    NO_TRANS  = :P2',
            [vStoreCode,
             vTransDate,
             vTransNo]);
  try
    if (Query.Fields[0].AsString = TransReceive) or
       (Query.Fields[0].AsString = TransCancel)  or
       (Query.Fields[0].AsString = TransDemandAbort) then
    begin
      ErrBox(Format('이미 %s 상태이므로 취소할 수 없습니다.', [IfThen(Query.Fields[0].AsString = TransReceive, TransReceiveName, IfThen(Query.Fields[0].AsString = TransCancel, TransCancelName, TransDemandAbortName))]));
      FinishQuery;
      Exit;
    end
    else if Query.Fields[0].AsString <> TransDemand then
    begin
      ErrBox(Format('이미 %s을 한 상태이므로 취소할 수 없습니다.', [TransSendName]));
      FinishQuery;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  // 이관 삭제
  BeginTrans;
  try
    ExecQuery('update SL_TRANS_H '
             +'set    DS_STATUS              = :P3, '
             +'       CD_SAWON_DEMANDCANCEL  = :P4, '
             +'       NO_DEVICE_DEMANDCANCEL = :P5, '
             +'       DT_DEMANDCANCEL        = GetDate() '
             +'where  CD_STORE_RECEIVE       = :P0 '
             +'  and  YMD_TRANS              = :P1 '
             +'  and  NO_TRANS               = :P2',
              [StoreCode,
               vTransDate,
               vTransNo,
               TransDemandAbort,
               UserCode,
               '00'],
               false);
    ExecQuery('update SL_TRANS_D '
             +'set    DS_STATUS = :P3 '
             +'where  CD_STORE_RECEIVE  = :P0 '
             +'  and  YMD_TRANS = :P1 '
             +'  and  NO_TRANS  = :P2',
              [StoreCode,
               vTransDate,
               vTransNo,
               TransDemandAbort],
               false);

    // 상대 매장에 확인용 메시지를 저장한다
    ExecQuery('delete from MS_CODE '
             +'where  CD_STORE = :P0 '
             +'  and  CD_KIND  = ''61'' '
             +'  and  CD_CODE  = ''001''',
              [StoreCode],
               false);

    CommitTrans;
    MsgBox(Format('%s번 이관신청 전표를 취소 했습니다.', [vTransNo]));
    DoSearch;

  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;

procedure TStockTransDemandModifyForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  inherited;

  if (GridTableView.DataController.RecordCount = 0) or
     (GridTableView.DataController.GetFocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index] = EmptyStr) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index]   = EmptyStr) then
  begin
    ErrBox(Format('%s 전표를 선택하지 않았습니다.', [TransDemandName]));
    ConditionTabSet.ActiveTabIndex := 0;
    Exit;
  end;

  // 수정 가능한 전표인지 확인한다
  OpenQuery('select   DS_STATUS '
           +'from     SL_TRANS_H '
           +'where    CD_STORE  = :P0 '
           +'  and    YMD_TRANS = :P1 '
           +'  and    NO_TRANS  = :P2',
            [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index],
             GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index]),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index]]);
  try
    if Query.Eof then
    begin
      ErrBox(Format('%s번 %s 전표가 없습니다.', [String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index]), TransDemandName]));
      Exit;
    end
    else if Query.Fields[0].AsString <> TransDemand then
    begin
      ErrBox(Format('%s 전표가 아니므로 수정할 수 없습니다.', [TransDemandName]));
      Exit;
    end;
  finally
    FinishQuery;
  end;

  // 재고 이관 신청 프로그램을 띄운다
  FormParam[0] := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index];
  FormParam[1] := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index]);
  FormParam[2] := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index];
  ExtremeMainForm.RunProgram('StockTransDemand');
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 목록 그리드 다른 레코드를 선택할 때
procedure TStockTransDemandModifyForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  ButtonToolBarSaveButton.Enabled := (AFocusedRecord <> nil) and (AFocusedRecord.Index >= 0) and
                                     (AFocusedRecord.Values[GridTableViewStatus.Index] = TransDemand);
end;
//------------------------------------------------------------------------------
// 목록 그리드를 더블클릭할 때
procedure TStockTransDemandModifyForm.GridTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  // 상세 목록을 보여줄 수 있게 탭을 변경한다
  if (GridTableView.DataController.RecordCount > 0) and
     (GridTableView.DataController.GetFocusedRecordIndex >= 0) and
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index] <> EmptyStr) and
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index]   <> EmptyStr) then
    ConditionTabSet.ActiveTabIndex := 1;
end;
//------------------------------------------------------------------------------
// 상세 그리드를 그릴 때
procedure TStockTransDemandModifyForm.GridDetailTableViewCustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;

  // 위쪽 GroupByBox에 현재 전표 정보를 보여준다
  if AViewInfo is TcxGridGroupByBoxViewInfo then
  begin
    AViewInfo.Text        := CurrentTransInfo;
    ACanvas.FillRect(AViewInfo.Bounds, AViewInfo.Params.Color);
    ACanvas.Font.Style    := ACanvas.Font.Style + [fsBold];
    AViewInfo.Params.Font := ACanvas.Font;
    ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.TextBounds,0, True);
    ADone                 := true;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 상단 탭을 바꿀 때
procedure TStockTransDemandModifyForm.ConditionTabSetChange(Sender: TObject);
begin
  inherited;

  if not isLoading then
    if ConditionTabSet.ActiveTabIndex = 0 then
      Grid.ActiveLevel := GridLevel
    else if ConditionTabSet.ActiveTabIndex = 1 then
      DoSearchDetail;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockTransDemandModifyForm.DoSearch: Boolean;
begin
  isLoading := true;
  try
    ConditionTabSet.ActiveTabIndex := 0;
    Grid.ActiveLevel               := GridLevel;

    OpenQuery('select   t.CD_STORE as CD_STORE_SEND, '
             +'         s.NM_STORE as NM_STORE_SEND, '
             +'         dbo.StoDW(t.YMD_TRANS) as YMD_TRANS, '
             +'         t.NO_TRANS, '
             +'         t.DS_STATUS, '
             +'         case t.DS_STATUS when '''+TransDemand+''' then '''+TransDemandName+''' when '''+TransDemandAbort+''' then '''+TransDemandAbortName+''' when '''+TransSend+''' then '''+TransSendName+''' when '''+TransRefuse+''' then '''+TransRefuseName+''' when '''+TransReceive+''' then '''+TransReceiveName+''' when '''+TransCancel+''' then '''+TransCancelName+''' end as NM_STATUS, '
             +'         t.AMT_DEMAND, '
             +'         t.CD_SAWON_DEMAND, '
             +'         s2.NM_SAWON as NM_SAWON_DEMAND, '
             +'         t.DT_DEMAND, '
             +'         t.CD_SAWON_SEND, '
             +'         s1.NM_SAWON as NM_SAWON_SEND, '
             +'         t.DT_SEND, '
             +'         t.NO_SEND_LINK '
             +'from     SL_TRANS_H as t ( nolock) inner join '
             +'         MS_STORE   as s  (nolock) on t.CD_STORE = s.CD_STORE left outer join '
             +'         MS_SAWON   as s1 (nolock) on t.CD_STORE = s1.CD_STORE and t.CD_SAWON_SEND = s1.CD_SAWON left outer join '
             +'         MS_SAWON   as s2 (nolock) on t.CD_STORE_RECEIVE = s2.CD_STORE and t.CD_SAWON_DEMAND = s2.CD_SAWON '
             +'where    t.CD_STORE_RECEIVE = :P0 '
             +'  and    t.YMD_TRANS between :P1 and :P2 '
             +'  and    t.CD_SAWON_DEMAND is not null '
//             +'  and    (:P3 = '''' or t.CD_STORE  = :P3) '
             +'order by t.CD_STORE, t.YMD_TRANS, t.NO_TRANS',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
//              PStrPointer(ConditionToolBarStoreComboBox.Properties.Items.Objects[ConditionToolBarStoreComboBox.ItemIndex])^.Data]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    isLoading := false;
  end;
end;
//------------------------------------------------------------------------------
// 상세 조회
function TStockTransDemandModifyForm.DoSearchDetail: Boolean;
begin
  Result := false;

  if (GridTableView.DataController.RecordCount = 0) or
     (GridTableView.DataController.GetFocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index] = EmptyStr) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index]   = EmptyStr) then
  begin
    ErrBox(Format('%s 전표를 선택하지 않았습니다.', [TransDemandName]));
    ConditionTabSet.ActiveTabIndex := 0;
    Exit;
  end;

  isLoading := true;
  try
    CurrentTransInfo := Format('신청일자 : %s,  신청번호 : %s', [String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index]), String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index])]);

    ConditionTabSet.ActiveTabIndex := 1;
    Grid.ActiveLevel               := GridDetailLevel;

    ReportTitleText := '이관매장 : '+ GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreName.Index];

    OpenQuery('select   t.CD_GOODS, '
             +'         g.NM_GOODS, '
             +'         g.NM_SPEC, '
             +'         t.PR_BUY, '
             +'         t.QTY_DEMAND, '
             +'         t.AMT_DEMAND '
             +'from     SL_TRANS_D as t inner join '
             +'         MS_GOODS   as g on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
             +'where    t.CD_STORE  = :P0 '
             +'  and    t.YMD_TRANS = :P1 '
             +'  and    t.NO_TRANS  = :P2 '
             +'order by t.SEQ',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index],
              GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandDate.Index]),
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDemandNo.Index]]);
    Result := DM.ReadQuery(Query, GridDetailTableView);
  finally
    isLoading := false;
  end;
end;

end.
