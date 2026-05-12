unit HeadDeliverySaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, cxGridBandedTableView,
  cxGridCustomTableView, cxGridTableView, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, cxContainer, Uni, DB, MemDS, ImgList, Menus, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, cxMemo,
  Math, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, StrUtils,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, cxTimeEdit,
  cxDBData, cxGridDBTableView, dxmdaset,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  THeadDeliverySaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewStoreCode: TcxGridBandedColumn;
    GridBandedTableViewSaleCount: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewVisitCnt: TcxGridBandedColumn;
    GridBandedTableViewVisitAmt: TcxGridBandedColumn;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridBandedTableViewDeliveryCnt: TcxGridBandedColumn;
    GridBandedTableViewDeliveryAmt: TcxGridBandedColumn;
    GridBandedTableViewDeliveryRate: TcxGridBandedColumn;
    GridLevel2: TcxGridLevel;
    GridTableView3: TcxGridTableView;
    GridTableView3Column1: TcxGridColumn;
    GridTableView3Column2: TcxGridColumn;
    GridTableView3Column3: TcxGridColumn;
    GridTableView3Column4: TcxGridColumn;
    GridTableView3Column5: TcxGridColumn;
    GridTableView3Column6: TcxGridColumn;
    GridTableView3Column7: TcxGridColumn;
    GridTableView3Column8: TcxGridColumn;
    GridTableView3Column9: TcxGridColumn;
    GridTableView3Column10: TcxGridColumn;
    GridTableView3Column11: TcxGridColumn;
    GridDBTableView: TcxGridDBTableView;
    GridLevel3: TcxGridLevel;
    GridSubDBTableView: TcxGridDBTableView;
    GridDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewColumn2: TcxGridDBColumn;
    GridDBTableViewColumn3: TcxGridDBColumn;
    GridDBTableViewColumn4: TcxGridDBColumn;
    GridDBTableViewColumn5: TcxGridDBColumn;
    GridDBTableViewColumn6: TcxGridDBColumn;
    GridDBTableViewColumn7: TcxGridDBColumn;
    GridDBTableViewColumn8: TcxGridDBColumn;
    GridDBTableViewColumn9: TcxGridDBColumn;
    GridDBTableViewColumn10: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    DataSource: TDataSource;
    SubDataSource: TDataSource;
    GridDBTableViewColumn12: TcxGridDBColumn;
    GridDBTableViewColumn13: TcxGridDBColumn;
    GridDBTableViewColumn14: TcxGridDBColumn;
    GridDBTableViewColumn15: TcxGridDBColumn;
    GridDBTableViewColumn16: TcxGridDBColumn;
    GridDBTableViewColumn17: TcxGridDBColumn;
    GridDBTableViewColumn19: TcxGridDBColumn;
    GridDBTableViewColumn20: TcxGridDBColumn;
    GridDBTableViewColumn18: TcxGridDBColumn;
    GridBandedTableViewStoreName: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridBandedTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure GridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GridBandedTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
  private
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  HeadDeliverySaleShowForm: THeadDeliverySaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure THeadDeliverySaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet := MemData;
  SubDataSource.DataSet := SubMemData;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
end;

procedure THeadDeliverySaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if (aLevel = GridLevel2) and (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index] > 0) then
    DoSearch;
end;

procedure THeadDeliverySaleShowForm.GridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure THeadDeliverySaleShowForm.GridBandedTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  inherited;
  GridBandedTableView.DataController.Summary.FooterSummaryValues[8] := 0;
  if GridBandedTableView.DataController.RecordCount = 0 then Exit;
  GridBandedTableView.DataController.Summary.FooterSummaryValues[8] := GridBandedTableView.DataController.Summary.FooterSummaryValues[7] /
                                                                       Ifthen(GridBandedTableView.DataController.Summary.FooterSummaryValues[1]=0,1,GridBandedTableView.DataController.Summary.FooterSummaryValues[1]) * 100;
end;

procedure THeadDeliverySaleShowForm.GridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridDBTableView.DataController.RecordCount = 0 then Exit;

  if (ARecord.Values[2] = '매출취소') or (ARecord.Values[2] = '배달취소') then AStyle := StyleFontRed
end;

function THeadDeliverySaleShowForm.DoSearch:Boolean;
begin
  inherited;
  if (IncMonth(ConditionToolBarToDateEdit.Date,-1) > ConditionToolBarFromDateEdit.Date) then
  begin
    MsgBox('최대 조회기간은 1개월입니다');
    Exit;
  end;

  Result := false;
  case Grid.ActiveLevel.Index of
    0 :
    begin
      OpenQuery('select a.CD_STORE, '
               +'       Max(b.NM_STORE_SHORT) as NM_STORE_SHORT, '
               +'       COUNT(a.CNT_PERSON) as CNT_PERSON, '
               +'       SUM(a.AMT_SALE) as AMT_SALE, '
               +'       sum(case when (Ifnull(c.YN_PACKING,''N'') = ''Y'') or (a.NO_DELIVERY <> '''') then 1 else 0 end) as CNT_DELIVERY, '
               +'       sum(case when (Ifnull(c.YN_PACKING,''N'') = ''Y'') or (a.NO_DELIVERY <> '''') then a.AMT_SALE else 0 end) as AMT_DELIVERY, '
               +'       case when SUM(a.AMT_SALE) = 0 then 0 else DivFlt(sum(case when (Ifnull(c.YN_PACKING,''N'') = ''Y'') or (a.NO_DELIVERY <> '''') then a.AMT_SALE else 0 end), SUM(a.AMT_SALE)) * 100 end as RATE_DELIVERY, '
               +'       sum(case when (Ifnull(c.YN_PACKING,''N'') = ''N'') and (a.NO_DELIVERY = '''') then 1 else 0 end) as CNT_VISIT, '
               +'       sum(case when (Ifnull(c.YN_PACKING,''N'') = ''N'') and (a.NO_DELIVERY = '''') then a.AMT_SALE else 0 end) as AMT_VISIT '
               +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
               +'       MS_STORE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.YN_USE = ''Y'' left outer join '
               +'       MS_TABLE  c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.NO_TABLE = a.NO_TABLE and c.NO_TABLE > 0 '
               +' where a.CD_HEAD  =:P0 '
               +'   and a.YMD_SALE between :P1 and :P2 '
               +'   and a.DS_SALE <> ''V'' '
               +' group by a.CD_STORE '
               +' order by 1 ',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);
      Result := DM.ReadQuery(Query, GridBandedTableView);
      ReportFixtitle := '기간별 배달매출';
    end;
    1 :
    begin
      OpenQuery('select d.CD_MENU, '
               +'       Max(g.NM_MENU) as NM_MENU, '
               +'       SUM(d.QTY_SALE) as QTY_SALE, '
               +'       SUM(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
               +'                      on d.CD_HEAD  = h.CD_HEAD '
               +'                     and d.CD_STORE = h.CD_STORE '
               +'                     and d.YMD_SALE = h.YMD_SALE '
               +'                     and d.NO_POS   = h.NO_POS '
               +'                     and d.NO_RCP   = h.NO_RCP '
               +'                     and (h.NO_DELIVERY <> '''' or h.DS_DELIVERY <> '''') '
               +'                     and h.DS_SALE <> ''V'' left outer join '
               +'       MS_MENU  as g on d.CD_HEAD  = g.CD_HEAD '
               +'                    and d.CD_STORE = g.CD_STORE '
               +'                    and d.CD_MENU  = g.CD_MENU '
               +' where d.CD_HEAD  =:P0 '
               +'   and d.CD_STORE =:P1 '
               +'   and d.YMD_SALE between :P2 and :P3 '
               +' group by d.CD_MENU '
               +' order by SUM(d.QTY_SALE) desc',
                [HeadStoreCode,
                 GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index],
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);
      Result := DM.ReadQuery(Query, GridTableView);
      ReportFixtitle := '메뉴별 배달매출';
    end;
    2 :
    begin
      OpenQuery('select StoDW(a.YMD_DELIVERY) AS YMD_DELIVERY, '
               +'       a.NO_DELIVERY, '
               +'       case when Ifnull(a.NO_ORDER_BAEMIN,'''') = '''' then case a.DS_ORDER when ''D'' then ''배달'' '
               +'                                                                            when ''P'' then ''포장''  end '
               +'            else ''배민'' '
               +'       end as DS_ORDER, '
               +'       case a.DS_STEP when ''A'' then ''정산완료'' '
               +'                      when ''O'' then ''주문'' '
               +'                      when ''D'' then ''배달 중''  '
               +'                      when ''C'' then ''주문취소''  '
               +'                      when ''V'' then ''매출취소''  '
               +'                      when ''R'' then ''그릇회수''  '
               +'                      when ''N'' then ''미주문''  '
               +'       end as DS_STEP,  '
               +'       a.DT_ORDER, '
               +'       case a.DS_STEP when ''A'' then d.AMT_SALE '
               +'                      when ''O'' then a.AMT_ORDER '
               +'                      when ''D'' then a.AMT_ORDER '
               +'                      when ''C'' then a.AMT_ORDER '
               +'                      when ''V'' then d.AMT_SALE '
               +'                      when ''R'' then d.AMT_SALE '
               +'                      when ''N'' then 0 '
               +'       end as AMT_ORDER, '
               +'       a.NM_NAME, '
               +'       a.CD_MEMBER, '
               +'       case when a.NO_TEL1 <> '''' then GetPhoneNo(a.NO_TEL1) '
               +'            else case when a.NO_TEL2 <> '''' then GetPhoneNo(a.NO_TEL2) '
               +'                      else case when a.NO_TEL3 <> '''' then GetPhoneNo(a.NO_TEL3) '
               +'                                else case when a.NO_TEL4 <> '''' then GetPhoneNo(a.NO_TEL4) '
               +'                                     end '
               +'                           end '
               +'                 end '
               +'       end as NO_TEL, '
               +'       ConCat(a.ADDRESS1,'' '',a.ADDRESS2) AS ADDR, '
               +'       b.NM_SAWON, '
               +'       c.NM_SAWON as RECALL_SAWON, '
               +'       e.NM_CODE1 as LOCAL, '
               +'       f.NM_CODE1 as COURSE, '
               +'       a.COUPON_CNT, '
               +'       a.TEL_LINE, '
               +'       case when (a.DS_STEP =''A'' or a.DS_STEP = ''R'') then case d.AMT_SALE when d.AMT_CASH  then ''현금'' '
               +'                                                                              when d.AMT_CARD  then ''카드'' '
               +'                                                                              when d.AMT_TRUST then ''외상'' '
               +'                                                                              when d.AMT_CHECK then ''수표'' '
               +'                                                                              when d.AMT_POINT then ''포인트'' '
               +'                                                                              when d.AMT_GIFT  then ''상품권'' '
               +'                                                                              when d.AMT_BANK  then ''계좌이체'' '
               +'                                                                          else ''기타'' '
               +'                                                              end '
               +'            else '''' '
               +'       end PAYTYPE, '
               +'       a.REMARK, '
               +'       ConCat(a.YMD_DELIVERY,a.NO_DELIVERY) as LINK '
               +'  from SL_DELIVERY a left outer join '
               +'       MS_SAWON    b on a.CD_STORE = b.CD_STORE and a.CD_SAWON     = b.CD_SAWON left outer join '
               +'       MS_SAWON    c on a.CD_STORE = c.CD_STORE and a.RECALL_SAWON = c.CD_SAWON left outer join '
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd')
               +'                     on a.CD_STORE = d.CD_STORE '
               +'                    and ConCat(a.YMD_DELIVERY,a.NO_DELIVERY) = d.NO_DELIVERY left outer join '
               +'       MS_CODE     e on a.CD_HEAD  = e.CD_HEAD and a.CD_STORE = e.CD_STORE and e.CD_KIND = ''22'' and a.CD_LOCAL = e.CD_CODE left outer join '
               +'       MS_CODE     f on a.CD_HEAD  = f.CD_HEAD and a.CD_STORE = f.CD_STORE and f.CD_KIND = ''20'' and a.CD_COURSE = f.CD_CODE '
               +' where a.CD_HEAD  =:P0 '
               +'   and a.CD_STORE =:P1 '
               +'   and a.YMD_DELIVERY between :P2 and :P3 '
               +'   and (a.NM_NAME LIKE ConCat(''%'',:P4,''%'') '
               +'          or GetOnlyNumber(a.NO_TEL1) like ConCat(''%'',:P4) '
               +'          or GetOnlyNumber(a.NO_TEL2) like ConCat(''%'',:P4) '
               +'          or GetOnlyNumber(a.NO_TEL3) like ConCat(''%'',:P4) '
               +'          or GetOnlyNumber(a.NO_TEL4) like ConCat(''%'',:P4) '
               +'       ) '
               +'order by 1, 2 ',
                [HeadStoreCode,
                 GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index],
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ConditionToolBarEdit.Text]);
      GridDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, GridDBTableView, MemData);
      GridDBTableView.DataController.DataSource := DataSource;
      Result := GridDBTableView.DataController.RecordCount > 0;

      OpenQuery('select a.CD_MENU, '
               +'       c.NM_MENU, '
               +'       a.QTY_SALE, '
               +'       a.PR_SALE, '
               +'       a.AMT_SALE, '
               +'       b.NO_DELIVERY as LINK'
               +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'b')
               +'                     on a.CD_HEAD  = b.CD_HEAD '
               +'                    and a.CD_STORE = b.CD_STORE '
               +'                    and a.YMD_SALE = b.YMD_SALE '
               +'                    and a.NO_POS   = b.NO_POS '
               +'                    and a.NO_RCP   = b.NO_RCP '
               +'                    and Length(b.NO_DELIVERY) = 12 left outer join '
               +'       MS_MENU     c on a.CD_HEAD  = c.CD_HEAD '
               +'                    and a.CD_STORE = c.CD_STORE '
               +'                    and a.CD_MENU  = c.CD_MENU inner join '
               +'       SL_DELIVERY d on a.CD_HEAD  = d.CD_HEAD '
               +'                    and b.CD_STORE = d.CD_STORE '
               +'                    and b.NO_DELIVERY = ConCat(d.YMD_DELIVERY,d.NO_DELIVERY) '
               +'                    and d.DS_STEP not in (''C'',''V'') '
               +' where a.CD_HEAD  =:P0 '
               +'   and a.CD_STORE =:P1 '
               +'   and a.YMD_SALE between :P2 AND :P3 '
               +' order by d.YMD_DELIVERY, d.NO_DELIVERY',
                [HeadStoreCode,
                 GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index],
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

      GridSubDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, GridSubDBTableView, SubMemData);
      GridSubDBTableView.DataController.DataSource := SubDataSource;
      ReportFixtitle := '배달 전표 매출';
    end;
  end;
end;


end.
