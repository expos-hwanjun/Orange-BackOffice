// 재고 이관 조회

unit StockTransSendShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels, StrUtils,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSCore, dxPScxCommon, Menus, ImgList, AdvToolBar,
  AdvToolBarStylers, ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvOfficeTabSet, cxCurrencyEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxPSPrVwRibbon,
  dxSkinsdxBarPainter, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TStockTransSendShowForm = class(TInheritShowForm)
    ConditionTabSet: TAdvOfficeTabSet;
    GridDetailLevel: TcxGridLevel;
    GridDetailTableView: TcxGridTableView;
    ConditionToolBarStoreComboBox: TcxComboBox;
    ConditionToolBarStoreLabel: TcxLabel;
    GridTableViewTransDate: TcxGridColumn;
    GridTableViewTransNo: TcxGridColumn;
    GridTableViewReceiveStoreCode: TcxGridColumn;
    GridTableViewReceiveStoreName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewStatusName: TcxGridColumn;
    GridTableViewTransAmt: TcxGridColumn;
    GridTableViewSendEmpNo: TcxGridColumn;
    GridTableViewSendEmpName: TcxGridColumn;
    GridTableViewSendDateTime: TcxGridColumn;
    GridTableViewSendRemark: TcxGridColumn;
    GridTableViewReceiveEmpNo: TcxGridColumn;
    GridTableViewReceiveEmpName: TcxGridColumn;
    GridTableViewReceiveDateTime: TcxGridColumn;
    GridTableViewReceiveRemark: TcxGridColumn;
    GridDetailTableViewGoodsCode: TcxGridColumn;
    GridDetailTableViewGoodsName: TcxGridColumn;
    GridDetailTableViewGoodsSpec: TcxGridColumn;
    GridDetailTableViewBuyPrice: TcxGridColumn;
    GridDetailTableViewTransQty: TcxGridColumn;
    GridDetailTableViewTransAmt: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    GridDetailTableViewDemandQty: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure ConditionTabSetChange(Sender: TObject);
    procedure GridDetailTableViewCustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

  private
    CurrentTransInfo: string;

    function DoSearchDetail: Boolean;

  protected
    function DoSearch: Boolean; override;
  end;

var
  StockTransSendShowForm: TStockTransSendShowForm;



implementation

uses
  Common, DBModule, Main, StockTransSend;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockTransSendShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;

  // 수관 매장 목록을 불러온다
  New(vCode);
  vCode^.Data := EmptyStr;
  ConditionToolBarStoreComboBox.Properties.Items.AddObject('[모든 매장]', TObject(vCode));
  OpenQuery('select   CD_STORE, '
           +'         NM_STORE '
           +'from     MS_STORE '
           +'where    CD_STORE not in (''0000'', :P0) '
           +'  and    DS_STATUS = ''0'' '
           +'order by CD_STORE',
            [StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarStoreComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarStoreComboBox.ItemIndex := 0;

  // 조회조건을 지정한다
  New(vCode);
  vCode^.Data := Format('''%s'',''%s'',''%s'',''%s''', [TransSend, TransRefuse, TransReceive, TransCancel]);
  ConditionToolBarComboBox.Properties.Items.AddObject('[모든 전표]', TObject(vCode));
  New(vCode);
  vCode^.Data := Format('''%s''', [TransSend]);
  ConditionToolBarComboBox.Properties.Items.AddObject(TransSendName, TObject(vCode));
  New(vCode);
  vCode^.Data := Format('''%s''', [TransRefuse]);
  ConditionToolBarComboBox.Properties.Items.AddObject(TransRefuseName, TObject(vCode));
  New(vCode);
  vCode^.Data := Format('''%s''', [TransReceive]);
  ConditionToolBarComboBox.Properties.Items.AddObject(TransReceiveName, TObject(vCode));
  New(vCode);
  vCode^.Data := Format('''%s''', [TransCancel]);
  ConditionToolBarComboBox.Properties.Items.AddObject(TransCancelName, TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;

  // 기본값을 지정한다
  DefaultDate := ddLastWeek;
  PrintMode   := pmPreviewExcel;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TStockTransSendShowForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TStockTransSendShowForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  inherited;

  if (GridTableView.DataController.RecordCount = 0) or
     (GridTableView.DataController.FocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransDate.Index] = EmptyStr) or
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index]   = EmptyStr) then
  begin
    ErrBox('이관 전표를 선택하지 않았습니다.');
    ConditionTabSet.ActiveTabIndex := 0;
    Exit;
  end;

  // 수정 가능한 전표인지 확인한다
  OpenQuery('select   DS_STATUS '
           +'from     SL_TRANS_H '
           +'where    CD_STORE  = :P0 '
           +'  and    YMD_TRANS = :P1 '
           +'  and    NO_TRANS  = :P2',
            [StoreCode,
             GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransDate.Index]),
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index]]);
  try
    if Query.Eof then
    begin
      ErrBox(Format('%s번 이관 전표가 없습니다.', [GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index]]));
      Exit;
    end
    else if (Query.Fields[0].AsString = TransReceive) or
            (Query.Fields[0].AsString = TransCancel)  or
            (Query.Fields[0].AsString = TransDemandAbort) then
    begin
      ErrBox(Format('%s된 전표는 수정할 수 없습니다.', [IfThen(Query.Fields[0].AsString = TransReceive, TransReceiveName, IfThen(Query.Fields[0].AsString = TransCancel, TransCancel, TransDemandAbort))]));
      Exit;
    end;
  finally
    FinishQuery;
  end;

  // 재고 이관 등록 프로그램을 띄운다
  FormParam[0] := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransDate.Index]);
  FormParam[1] := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index];
  ExtremeERPForm.RunProgram('StockTransSend');
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 목록 그리드 다른 레코드를 선택할 때
procedure TStockTransSendShowForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  ButtonToolBarSaveButton.Enabled := (AFocusedRecord <> nil) and (AFocusedRecord.Index >= 0) and
                                     ((AFocusedRecord.Values[GridTableViewStatus.Index] = TransSend) or (AFocusedRecord.Values[GridTableViewStatus.Index] = TransRefuse));
end;
//------------------------------------------------------------------------------
// 목록 그리드를 더블클릭할 때
procedure TStockTransSendShowForm.GridTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  // 상세 목록을 보여줄 수 있게 탭을 변경한다
  if (GridTableView.DataController.RecordCount > 0) and
     (GridTableView.DataController.FocusedRecordIndex >= 0) and
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransDate.Index] <> EmptyStr) and
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index]   <> EmptyStr) then
    ConditionTabSet.ActiveTabIndex := 1;
end;
//------------------------------------------------------------------------------
// 상세 그리드를 그릴 때
procedure TStockTransSendShowForm.GridDetailTableViewCustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
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
procedure TStockTransSendShowForm.ConditionTabSetChange(Sender: TObject);
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
function TStockTransSendShowForm.DoSearch: Boolean;
begin
  isLoading := true;
  try
    ConditionTabSet.ActiveTabIndex := 0;
    Grid.ActiveLevel               := GridLevel;

    OpenQuery('select   dbo.StoDW(t.YMD_TRANS) as YMD_TRANS, '
             +'         t.NO_TRANS, '
             +'         t.CD_STORE_RECEIVE, '
             +'         s.NM_STORE as NM_STORE_RECEIVE, '
             +'         t.DS_STATUS, '
             +'         case t.DS_STATUS when '''+TransSend+''' then '''+TransSendName+''' when '''+TransRefuse+''' then '''+TransRefuseName+''' when '''+TransReceive+''' then '''+TransReceiveName+''' when '''+TransCancel+''' then '''+TransCancelName+''' end as NM_STATUS, '
             +'         t.AMT_TRANS, '
             +'         t.CD_SAWON_SEND, '
             +'         s1.NM_SAWON as NM_SAWON_SEND, '
             +'         t.DT_SEND, '
             +'         t.REMARK, '
             +'         t.CD_SAWON_RECEIVE, '
             +'         s2.NM_SAWON as NM_SAWON_RECEIVE, '
             +'         t.DT_RECEIVE, '
             +'         t.REMARK_RECEIVE '
             +'from     SL_TRANS_H as t inner join '
             +'         MS_STORE   as s  on t.CD_STORE_RECEIVE = s.CD_STORE inner join '
             +'         MS_SAWON   as s1 on t.CD_STORE = s1.CD_STORE and t.CD_SAWON_SEND = s1.CD_SAWON left outer join '
             +'         MS_SAWON   as s2 on t.CD_STORE_RECEIVE = s2.CD_STORE and t.CD_SAWON_RECEIVE = s2.CD_SAWON '
             +'where    t.CD_STORE = :P0 '
             +'  and    t.YMD_TRANS between :P1 and :P2 '
             +'  and    (:P3 = '''' or t.CD_STORE_RECEIVE = :P3) '
             +Format(' and t.DS_STATUS in (%s) ', [PStrPointer(ConditionToolBarComboBox.Properties.Items.Objects[ConditionToolBarComboBox.ItemIndex])^.Data])
             +'order by t.CD_STORE, t.YMD_TRANS, t.NO_TRANS',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              PStrPointer(ConditionToolBarStoreComboBox.Properties.Items.Objects[ConditionToolBarStoreComboBox.ItemIndex])^.Data]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    isLoading := false;
  end;
end;
//------------------------------------------------------------------------------
// 상세 조회
function TStockTransSendShowForm.DoSearchDetail: Boolean;
begin
  Result := false;

  if (GridTableView.DataController.RecordCount = 0) or
     (GridTableView.DataController.FocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransDate.Index] = EmptyStr) or
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index]   = EmptyStr) then
  begin
    ErrBox('이관 전표를 선택하지 않았습니다.');
    ConditionTabSet.ActiveTabIndex := 0;
    Exit;
  end;

  isLoading := true;
  try
    CurrentTransInfo := Format('이관일자 : %s,  이관번호 : %s', [GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransDate.Index], GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index]]);

    ConditionTabSet.ActiveTabIndex := 1;
    Grid.ActiveLevel               := GridDetailLevel;

    OpenQuery('select   t.CD_GOODS, '
             +'         dbo.Decrypt(g.NM_GOODS, 5869, 29486, 4921) as NM_GOODS, '
             +'         dbo.Decrypt(g.NM_SPEC,  5869, 29486, 4921) as NM_SPEC, '
             +'         t.PR_BUY, '
             +'         t.QTY_DEMAND, '
             +'         t.QTY_TRANS, '
             +'         t.AMT_TRANS '
             +'from     SL_TRANS_D as t inner join '
             +'         MS_GOODS   as g on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
             +'where    t.CD_STORE  = :P0 '
             +'  and    t.YMD_TRANS = :P1 '
             +'  and    t.NO_TRANS  = :P2 '
             +'order by t.SEQ',
             [StoreCode,
              GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransDate.Index]),
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTransNo.Index]]);
    Result := DM.ReadQuery(Query, GridDetailTableView);
  finally
    isLoading := false;
  end;
end;

end.
