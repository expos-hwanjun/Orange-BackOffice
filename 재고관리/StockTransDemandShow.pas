unit StockTransDemandShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxmdaset, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, MemDS, cxGridLevel, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, cxCurrencyEdit, cxMemo, dxPScxGridLnk, cxCheckBox,
  dxPScxGridLayoutViewLnk, cxCheckComboBox, StrUtils;

type
  TStockTransDemandShowForm = class(TInheritShow2Form)
    GridDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewColumn2: TcxGridDBColumn;
    GridDBTableViewColumn3: TcxGridDBColumn;
    GridDBTableViewColumn4: TcxGridDBColumn;
    GridDBTableViewColumn5: TcxGridDBColumn;
    GridDBTableViewColumn6: TcxGridDBColumn;
    GridDBTableViewColumn7: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    GridDBTableViewColumn8: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    ConditionToolBarStoreCheckComboBox: TcxCheckComboBox;
    cxLabel1: TcxLabel;
    ConditionToolbarGoodsLabel: TcxLabel;
    GridDBTableViewLink: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableViewCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
  private
    LinkNo :String;
    CurrentTransInfo: string;
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
  protected
    function DoSearch: Boolean; override;
  end;

var
  StockTransDemandShowForm: TStockTransDemandShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

function TStockTransDemandShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    try
      OpenQuery('select   s.CD_STORE as DEMAND_STORE_CODE, '
               +'         s.NM_STORE as DEMAND_STORE_NAME, '
               +'         dbo.StoDW(t.YMD_TRANS) as YMD_DEMAND, '
               +'         t.NO_TRANS, '
               +'         t.DS_STATUS, '
               +'         case t.DS_STATUS when '''+TransDemand+''' then '''+TransDemandName+''' when '''+TransDemandAbort+''' then '''+TransDemandAbortName+''' when '''+TransSend+''' then '''+TransSendName+''' when '''+TransRefuse+''' then '''+TransRefuseName+''' when '''+TransReceive+''' then '''+TransReceiveName+''' when '''+TransCancel+''' then '''+TransCancelName+''' end as NM_STATUS, '
               +'         t.AMT_DEMAND, '
               +'         t.CD_SAWON_DEMAND, '
               +'         s2.NM_SAWON as NM_SAWON_DEMAND, '
               +'         t.DT_DEMAND, '
               +'         t.CD_SAWON_SEND, '
               +'         s1.NM_SAWON as NM_SAWON_SEND, '
               +'         case t.DS_STATUS when '''+TransDemand+''' then t.DT_DEMAND when '''+TransDemandAbort+''' then t.DT_DEMANDCANCEL when '''+TransSend+''' then t.DT_SEND when '''+TransRefuse+''' then t.DT_REFUSE when '''+TransReceive+''' then t.DT_RECEIVE when '''+TransCancel+''' then null end as DT_SEND, '
               +'         t.REMARK, '
               +'         t.CD_STORE + t.YMD_TRANS + NO_TRANS as LINK  '
               +'from     SL_TRANS_H as t  (nolock) inner join '
               +'         MS_STORE   as s  (nolock) on t.CD_STORE_RECEIVE = s.CD_STORE left outer join '
               +'         MS_SAWON   as s1 (nolock) on t.CD_STORE = s1.CD_STORE and t.CD_SAWON_SEND = s1.CD_SAWON left outer join '
               +'         MS_SAWON   as s2 (nolock) on t.CD_STORE_RECEIVE = s2.CD_STORE and t.CD_SAWON_DEMAND = s2.CD_SAWON '
               +'where    t.CD_STORE = :P0 '
//               +'  and    t.NO_SEND_LINK is null '
               +PStrPointer(ConditionToolBarComboBox.Properties.Items.Objects[ConditionToolBarComboBox.ItemIndex])^.Data
               +Ifthen(ConditionToolBarStoreCheckComboBox.Text='전매장', '', ' and t.CD_STORE_RECEIVE in ('''+ConditionToolBarStoreCheckComboBox.Text+''') ')
               +'  and    t.YMD_TRANS between :P1 and :P2 '
               +'order by t.CD_STORE, t.YMD_TRANS, t.NO_TRANS',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)]);

      GridDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, nil, MemData);
      GridDBTableView.DataController.DataSource := DataSource;
      Result := GridDBTableView.DataController.RecordCount > 0;
      GridTableView.OptionsView.GroupByBox := false;

      if not Result then Exit;

      OpenQuery('select   t.CD_GOODS, '
               +'         Isnull(g.NM_GOODS, ''[미등록상품]'') as NM_GOODS, '
               +'         g.NM_SPEC, '
               +'         t.PR_BUY, '
               +'         t.QTY_DEMAND, '
               +'         t.AMT_DEMAND, '
               +'         t.CD_STORE+t.YMD_TRANS+t.NO_TRANS as LINK '
               +'from     SL_TRANS_D as t (nolock) inner join '
               +'         SL_TRANS_H as h (nolock) on t.CD_STORE= h.CD_STORE and t.YMD_TRANS = h.YMD_TRANS and t.NO_TRANS = h.NO_TRANS and h.NO_SEND_LINK is null left outer join '
               +'         MS_GOODS   as g (nolock) on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
               +'where    t.CD_STORE  = :P0 '
               +'  and    t.YMD_TRANS between :P1 and :P2 '
               +Ifthen(ConditionToolBarStoreCheckComboBox.Text='전매장', '', ' and t.CD_STORE_RECEIVE in ('''+ConditionToolBarStoreCheckComboBox.Text+''') ')
               +'order by t.CD_STORE, t.YMD_TRANS, t.NO_TRANS ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)]);
      GridSubDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, nil, SubMemData);
      GridSubDBTableView.DataController.DataSource := SubDataSource;
    finally
      FinishQuery;
    end;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    if LinkNo = EmptyStr then
    begin
      ReportTitleText := EmptyStr;
      GridTableView.OptionsView.GroupByBox := false;
      OpenQuery('select t.CD_GOODS, '
               +'       Isnull(max(g.NM_GOODS),''[미등록상품]'') as NM_GOODS, '
               +'       max(g.NM_SPEC) as NM_SPEC, '
               +'       sum(t.QTY_DEMAND) as QTY_TRANS '
               +'  from SL_TRANS_D    t (nolock) inner join '
               +'       SL_TRANS_H as h (nolock) on t.CD_STORE= h.CD_STORE and t.YMD_TRANS = h.YMD_TRANS and t.NO_TRANS = h.NO_TRANS and h.NO_SEND_LINK is null left outer join '
               +'       MS_GOODS   as g (nolock) on g.CD_STORE = t.CD_STORE and g.CD_GOODS = t.CD_GOODS '
               +' where t.CD_STORE = :P0 '
               +'  and    t.YMD_TRANS between :P1 and :P2 '
               +PStrPointer(ConditionToolBarComboBox.Properties.Items.Objects[ConditionToolBarComboBox.ItemIndex])^.Data
               +Ifthen(ConditionToolBarStoreCheckComboBox.Text='전매장', '', ' and t.CD_STORE_RECEIVE in ('''+ConditionToolBarStoreCheckComboBox.Text+''') ')
               +'  and (g.CD_GOODS =:P3 or g.NM_GOODS like ''%''+:P3+''%'') '
               +' group by t.CD_GOODS '
               +' order by t.CD_GOODS ',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  DtoS(ConditionToolBarToDateEdit.Date),
                  ConditionToolBarEdit.Text]);
    end
    else
    begin
      ReportTitleText := CurrentTransInfo;

      OpenQuery('select t.CD_GOODS, '
               +'       Isnull(max(g.NM_GOODS),''[미등록상품]'') as NM_GOODS, '
               +'       max(g.NM_SPEC) as NM_SPEC, '
               +'       sum(t.QTY_DEMAND) as QTY_TRANS '
               +'  from SL_TRANS_D    t (nolock) inner join '
               +'       SL_TRANS_H as h (nolock) on t.CD_STORE= h.CD_STORE and t.YMD_TRANS = h.YMD_TRANS and t.NO_TRANS = h.NO_TRANS and h.NO_SEND_LINK is null left outer join '
               +'       MS_GOODS   as g (nolock) on g.CD_STORE = t.CD_STORE and g.CD_GOODS = t.CD_GOODS '
               +' where t.CD_STORE + t.YMD_TRANS + t.NO_TRANS = :P0 '
               +' group by t.CD_GOODS '
               +' order by t.CD_GOODS ',
                 [LinkNo]);
    end;
    LinkNo := EmptyStr;
    Result := DM.ReadQuery(Query, GridTableView);
  end;
end;

procedure TStockTransDemandShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet := MemData;
  SubDataSource.DataSet := SubMemData;

  PrintMode   := pmPrintPreviewExcel;
  // 조회조건을 지정한다
  New(vCode);
  vCode^.Data := EmptyStr;
  ConditionToolBarComboBox.Properties.Items.AddObject('[모든 전표]', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and t.DS_STATUS = '''+TransDemand+''' ';
  ConditionToolBarComboBox.Properties.Items.AddObject(TransDemandName, TObject(vCode));
  New(vCode);
  vCode^.Data := ' and t.DS_STATUS = '''+TransDemandAbort+''' ';
  ConditionToolBarComboBox.Properties.Items.AddObject(TransDemandAbortName, TObject(vCode));
  New(vCode);
  vCode^.Data := ' and t.DS_STATUS = '''+TransSend+''' ';
  ConditionToolBarComboBox.Properties.Items.AddObject(TransSendName, TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 1;

  try
    OpenQuery('select CD_STORE, NM_STORE '
                +'  from MS_STORE '
                +' where CD_STORE not in (:P0, :P1) '
                +' order by CD_STORE',
                [HeadStoreCode,
                 StoreCode]);
    while not Query.Eof do
    begin
      ConditionToolBarStoreCheckComboBox.Properties.Items.AddCheckItem(Query.Fields[1].AsString, Query.Fields[0].AsString);
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  LinkNo := EmptyStr;
end;

procedure TStockTransDemandShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ReportTitleText := EmptyStr;
  ConditionToolbarGoodsLabel.Visible :=  Grid.ActiveLevel = GridLevel1;
  ConditionToolBarEdit.Visible       :=  Grid.ActiveLevel = GridLevel1;
  if (LinkNo = EmptyStr) and (GridDBTableView.DataController.RecordCount > 0) then
    DoSearch;
end;

procedure TStockTransDemandShowForm.GridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LinkNo := GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewLink.Index];
  GridTableView.OptionsView.GroupByBox := true;
  CurrentTransInfo := Format('신청매장 : %s, 신청일자 : %s,  번호 : %s', [String(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewColumn1.Index]),
                                                                          String(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewColumn2.Index]),
                                                                          String(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewColumn3.Index])]);

  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure TStockTransDemandShowForm.GridTableViewCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if not GridTableView.OptionsView.GroupByBox then Exit;
  // 위쪽 GroupByBox에 현재 전표 정보를 보여준다
  if AViewInfo is TcxGridGroupByBoxViewInfo then
  begin
    AViewInfo.Text        := CurrentTransInfo;
    ACanvas.FillRect(AViewInfo.Bounds, AViewInfo.Params.Color);
    ACanvas.Font.Style    := ACanvas.Font.Style + [fsBold];
    AViewInfo.Params.Font := ACanvas.Font;
    ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.TextBounds,0, True);
    ADone                 := True;
  end;
end;

end.
