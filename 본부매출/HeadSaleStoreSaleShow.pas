unit HeadSaleStoreSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, StrUtils, AdvSplitter, AdvPanel,
  SHDocVw, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadSaleStoreSaleShowForm = class(TInheritShowForm)
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewTotSaleAmt: TcxGridColumn;
    GridTableViewServiceAmt: TcxGridColumn;
    GridTableViewTipAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewTaxAmt: TcxGridColumn;
    GridTableViewSoonSaleAmt: TcxGridColumn;
    GridTableViewGuestCount: TcxGridColumn;
    GridTableViewGuestAverage: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewDutyFreeAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewStoreCode: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableView1ServiceAmt: TcxGridColumn;
    GridTableView1TipAmt: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1TaxAmt: TcxGridColumn;
    GridTableView1SoonAmt: TcxGridColumn;
    GridTableView1GuestCount: TcxGridColumn;
    GridTableView1GuestAverage: TcxGridColumn;
    GridTableView1NetAmt: TcxGridColumn;
    GridTableView1DutyFreeAmt: TcxGridColumn;
    SaleZoneComboBox: TcxComboBox;
    cxLabel1: TcxLabel;
    GridTableViewRcpCount: TcxGridColumn;
    GridTableView1RcpCount: TcxGridColumn;
    cxLabel2: TcxLabel;
    StoreComboBox: TcxComboBox;
    GridTableViewDeliveryAmt: TcxGridColumn;
    GridTableView1DeliveryAmt: TcxGridColumn;
    GridTableViewDeliveryCount: TcxGridColumn;
    GridTableView1DeliveryCount: TcxGridColumn;
    ChartPanel: TAdvPanel;
    GridSplitter: TAdvSplitter;
    GridTableViewAvgAmt: TcxGridColumn;
    GridTableViewSaleDate: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure StoreComboBoxPropertiesChange(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    SaleChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadSaleStoreSaleShowForm: THeadSaleStoreSaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ THeadSaleStoreSaleShowForm }
procedure THeadSaleStoreSaleShowForm.FormCreate(Sender: TObject);
var
  vCode  :PStrPointer;
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddMonthFirst;

  if Tag = 0 then
  begin
    SaleChart       := TWebBrowser.Create(Self);
    TWinControl(SaleChart).Parent := ChartPanel;
    SaleChart.Align := alClient;
  end;


  OpenQuery('select CD_STORE,  '
           +'       case when Ifnull(NM_STORE_SHORT,'''') = '''' then NM_STORE else NM_STORE_SHORT end '
           +'  from MS_STORE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE <> :P1 '
           +'   and YN_USE = ''Y'' '
           +' order by CD_STORE ',
           [HeadStoreCode,
            StandardStore]);
  try
    StoreComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '';
    StoreComboBox.Properties.Items.AddObject('전매장', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      StoreComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    StoreComboBox.ItemIndex := 0;
    Query.Close;
  end;


  OpenQuery('select CD_KIND,  '
           +'       CD_CODE, '
           +'       NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and CD_KIND in (''01'',''03'') '
           +'   and DS_STATUS = ''0'' '
           +' order by CD_KIND, CD_CODE ',
           [HeadStoreCode,
            StandardStore]);
  try
    ConditionToolBarComboBox.Properties.Items.Clear;
    SaleZoneComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '';
    ConditionToolBarComboBox.Properties.Items.AddObject('전체', TObject(vCode));
    SaleZoneComboBox.Properties.Items.AddObject('전체', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[1].AsString;
      if Query.Fields[0].AsString = '01' then
        ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode))
      else
        SaleZoneComboBox.Properties.Items.AddObject(Query.Fields[2].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    ConditionToolBarComboBox.ItemIndex := 0;
    SaleZoneComboBox.ItemIndex := 0;
    Query.Close;
  end;
  isSelected  := false;
end;

procedure THeadSaleStoreSaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Tag = 1 then Exit;
  if isSelected and (GridTableView.DataController.GetFocusedRecordIndex >= 0) then
    GridLevel1.Caption := Format('[%s] 일자별 매출 ',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreName.Index]])
  else
    GridLevel1.Caption := ' 일자별 매출 ';
end;

procedure THeadSaleStoreSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure THeadSaleStoreSaleShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if (Tag = 2) and (ARecord.Values[GridTableViewStoreName.Index] = ' [ 소 계 ]')  or (ARecord.Values[GridTableViewStoreName.Index] = ' [ 합 계 ] ') then
    AStyle := StyleFontBlackBold;
end;

procedure THeadSaleStoreSaleShowForm.StoreComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ClearGrid;
  if StoreComboBox.ItemIndex = 0 then
  begin
    ConditionToolBarComboBox.Enabled := true;
    SaleZoneComboBox.Enabled         := true;
  end
  else
  begin
    ConditionToolBarComboBox.Enabled   := false;
    SaleZoneComboBox.Enabled           := false;
    ConditionToolBarComboBox.ItemIndex := 0;
    SaleZoneComboBox.ItemIndex         := 0;
  end;
end;

procedure THeadSaleStoreSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if (Tag = 0) and Assigned(SaleChart) and (SaleChart.Hint <> '') then
    ShowChart(SaleChart, 'SaleChart', 'column3d', SaleChart.Hint);
end;

function THeadSaleStoreSaleShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vDestStoreCode  :String;
    vChartXml :String;
    vAvgAmt :Currency;
begin
  inherited;
  SetWorkStoreList;

  //매장별 매출조회
  if Tag = 0 then
  begin
    if Grid.ActiveLevel = GridLevel then
    begin
      vDestStoreCode := '';
      for vIndex := 1 to WorkStoreList.Count-1 do
        vDestStoreCode := vDestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);

      if vDestStoreCode = '' then Exit;
      vDestStoreCode := Format(' in (%s) ',[LeftStr(vDestStoreCode, Length(vDestStoreCode)-1)]);
      OpenQuery('select case when Ifnull(s.NM_STORE_SHORT,'''') = '''' then s.NM_STORE else s.NM_STORE_SHORT end as NM_STORE_SHORT, '
               +'       h.AMT_SALE_TOT, '
               +'       h.AMT_DC, '
               +'       h.AMT_SERVICE, '
               +'       h.AMT_SALE, '
               +'       h.AMT_TIP, '
               +'       h.AMT_SOON, '
               +'       c.AMT_DELIVERY, '
               +'       h.AMT_TAX, '
               +'       h.AMT_NET, '
               +'       h.AMT_DUTYFREE, '
               +'       h.CNT_GUEST, '
               +'       Ifnull(h.AVG_GUEST,0) as AVG_GUEST, '
               +'       c.RCP_CNT, '
               +'       c.CNT_DELIVERY, '
               +'       s.CD_STORE, '
               +'       d.AMT_AVG '
               +'  from MS_STORE as s left outer join '
               +'       (select CD_STORE, '
               +'               Sum(AMT_SALE + DC_TOT + AMT_SERVICE) as AMT_SALE_TOT, '
               +'               Sum(DC_TOT)   as AMT_DC, '
               +'               Sum(AMT_SERVICE) as AMT_SERVICE, '
               +'               Sum(AMT_SALE) as AMT_SALE, '
               +'               Sum(AMT_TIP) as AMT_TIP, '
               +'               Sum(AMT_SALE-AMT_TAX-AMT_TIP) as AMT_SOON, '
               +'               Sum(AMT_TAX)  as AMT_TAX, '
               +'               Sum(AMT_SALE-AMT_DUTYFREE) as AMT_NET, '
               +'               Sum(AMT_DUTYFREE)  as AMT_DUTYFREE, '
               +'               Sum(CNT_CUSTOMER) as CNT_GUEST, '
               +'               case when Sum(CNT_CUSTOMER) = 0 then Sum(AMT_SALE) else Round(Sum(AMT_SALE) / Sum(CNT_CUSTOMER), 0) end as AVG_GUEST '
               +'        from   SL_SALE_H_SUM  '
               +'        where  CD_HEAD  =:P0 '
               +'          and  CD_STORE '+vDestStoreCode
               +'          and  YMD_SALE between :P1 and :P2 '
               +'         group by CD_STORE ) as h on h.CD_STORE = s.CD_STORE inner join '
               +'       (select a.CD_STORE, '
               +'               Count(a.YMD_SALE) as RCP_CNT, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then 1 else 0 end) as CNT_DELIVERY, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then a.AMT_SALE else 0 end) as AMT_DELIVERY '
               +'          from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a left outer join')
               +'               MS_TABLE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE and b.NO_TABLE > 0 '
               +'        where  a.CD_HEAD  =:P0 '
               +'          and  a.CD_STORE '+vDestStoreCode
               +'          and  a.YMD_SALE between :P1 and :P2 '
               +'          and  a.DS_SALE <> ''V'' '
               +'         group by a.CD_STORE ) as c on c.CD_STORE = s.CD_STORE,  '
               +'       (select DivFlt(Sum(AMT_SALE), COUNT(DISTINCT CD_STORE)) AS AMT_AVG '
               +'         from  SL_SALE_H_SUM  '
               +'        where  CD_HEAD  =:P0 '
               +'          and  CD_STORE <> :P3 '
               +'          and  CD_STORE '+vDestStoreCode
               +'          and  YMD_SALE between :P1 and :P2) as d '
               +' where s.CD_HEAD =:P0 '
               +'   and s.CD_STORE <> :P3 '
               +'   and s.CD_STORE '+vDestStoreCode
               +Ifthen(GetStrPointerData(ConditionToolBarComboBox)='','',Format(' and s.CD_LOCAL = ''%s'' ',[GetStrPointerData(ConditionToolBarComboBox)]))
               +Ifthen(GetStrPointerData(SaleZoneComboBox)='','',Format(' and s.CD_SALEZONE = ''%s'' ',[GetStrPointerData(SaleZoneComboBox)]))
               +' order by 2 desc ',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 StandardStore]);

      Result := DM.ReadQuery(Query, GridTableView);
    end
    else if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
    begin
      OpenQuery('select StoDW(s.YMD_SALE) as YMD_SALE, '
               +'       Sum(s.AMT_SALE + s.DC_TOT + s.AMT_SERVICE) as AMT_SALE_TOT, '
               +'       Sum(s.DC_TOT)   as AMT_DC, '
               +'       Sum(s.AMT_SERVICE) as AMT_SERVICE, '
               +'       Sum(s.AMT_SALE) as AMT_SALE, '
               +'       Sum(s.AMT_TIP) as AMT_TIP, '
               +'       Sum(s.AMT_SALE-s.AMT_TAX-s.AMT_TIP) as AMT_SOON, '
               +'       Sum(s.AMT_TAX)  as AMT_TAX, '
               +'       Sum(s.AMT_SALE-s.AMT_DUTYFREE) as AMT_NET, '
               +'       c.AMT_DELIVERY, '
               +'       Sum(s.AMT_DUTYFREE)  as AMT_DUTYFREE, '
               +'       Sum(s.CNT_CUSTOMER) as CNT_GUEST, '
               +'       case when Sum(s.CNT_CUSTOMER) = 0 then Sum(s.AMT_SALE) else Round(Sum(s.AMT_SALE) / Sum(s.CNT_CUSTOMER), 0) end as AVG_GUEST, '
               +'       c.RCP_CNT, '
               +'       c.CNT_DELIVERY '
               +'  from SL_SALE_H_SUM as s inner join '
               +'       (select a.YMD_SALE, '
               +'               Count(a.YMD_SALE) as RCP_CNT, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then 1 else 0 end) as CNT_DELIVERY, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then a.AMT_SALE else 0 end) as AMT_DELIVERY '
               +'          from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a left outer join')
               +'               MS_TABLE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE and b.NO_TABLE > 0 '
               +'        where  a.CD_HEAD  =:P0 '
               +'          and  a.CD_STORE =:P1 '
               +'          and  a.YMD_SALE between :P2 and :P3 '
               +'          and  a.DS_SALE <> ''V'' '
               +'         group by a.YMD_SALE ) as c on c.YMD_SALE = s.YMD_SALE '
               +' where s.CD_HEAD  =:P0 '
               +'   and s.CD_STORE =:P1 '
               +'   and s.YMD_SALE between :P2 and :P3 '
               +' group by s.YMD_SALE '
               +' order by 1 ',
                [HeadStoreCode,
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index],
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

      Result := DM.ReadQuery(Query, GridTableView1);
    end
    else
      MsgBox('조회할 매장을 선택하세요');
  end
  //일자별 매출조회
  else if Tag = 1 then
  begin
    vDestStoreCode := '';
    if GetStrPointerData(StoreComboBox) = '' then
    begin
      for vIndex := 1 to WorkStoreList.Count-1 do
        vDestStoreCode := vDestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);

      if vDestStoreCode = '' then Exit;
      vDestStoreCode := Format(' in (%s) ',[LeftStr(vDestStoreCode, Length(vDestStoreCode)-1)]);
    end
    else
      vDestStoreCode := Format(' in (''%s'') ',[GetStrPointerData(StoreComboBox)]);

    if Grid.ActiveLevel = GridLevel then
    begin
      OpenQuery('select StoDW(s.YMD_SALE) as YMD_SALE, '
               +'       Sum(s.AMT_SALE + s.DC_TOT + s.AMT_SERVICE) as AMT_SALE_TOT, '
               +'       Sum(s.DC_TOT)   as AMT_DC, '
               +'       Sum(s.AMT_SERVICE) as AMT_SERVICE, '
               +'       Sum(s.AMT_SALE) as AMT_SALE, '
               +'       Sum(s.AMT_TIP) as AMT_TIP, '
               +'       Sum(s.AMT_SALE-s.AMT_TAX-s.AMT_TIP) as AMT_SOON, '
               +'       Sum(s.AMT_TAX)  as AMT_TAX, '
               +'       c.AMT_DELIVERY, '
               +'       Sum(s.AMT_SALE-s.AMT_DUTYFREE) as AMT_NET, '
               +'       Sum(s.AMT_DUTYFREE)  as AMT_DUTYFREE, '
               +'       Sum(s.CNT_CUSTOMER) as CNT_GUEST, '
               +'       case when Sum(s.CNT_CUSTOMER) = 0 then Sum(s.AMT_SALE) else Round(Sum(s.AMT_SALE) / Sum(s.CNT_CUSTOMER), 0) end as AVG_GUEST, '
               +'       c.RCP_CNT, '
               +'       c.CNT_DELIVERY '
               +'  from SL_SALE_H_SUM as s inner join '
               +'       (select a.YMD_SALE, '
               +'               Count(a.YMD_SALE) as RCP_CNT, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then 1 else 0 end) as CNT_DELIVERY, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then a.AMT_SALE else 0 end) as AMT_DELIVERY '
               +'          from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a left outer join')
               +'               MS_TABLE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE and b.NO_TABLE > 0 '
               +'        where  a.CD_HEAD  =:P0 '
               +'          and  a.CD_STORE '+vDestStoreCode
               +'          and  a.YMD_SALE between :P1 and :P2 '
               +'          and  a.DS_SALE <> ''V'' '
               +'         group by a.YMD_SALE ) as c on c.YMD_SALE = s.YMD_SALE '
               +' where s.CD_HEAD  =:P0 '
               +'   and s.CD_STORE '+vDestStoreCode
               +'   and s.YMD_SALE between :P1 and :P2 '
               +' group by s.YMD_SALE '
               +' order by 1 ',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

      Result := DM.ReadQuery(Query, GridTableView1);
    end
    else if GridTableView1.DataController.GetFocusedRecordIndex >= 0 then
    begin
      OpenQuery('select case when Ifnull(s.NM_STORE_SHORT,'''') = '''' then s.NM_STORE else s.NM_STORE_SHORT end as NM_STORE_SHORT, '
               +'       h.AMT_SALE_TOT, '
               +'       h.AMT_DC, '
               +'       h.AMT_SERVICE, '
               +'       h.AMT_SALE, '
               +'       h.AMT_TIP, '
               +'       h.AMT_SOON, '
               +'       c.AMT_DELIVERY, '
               +'       h.AMT_TAX, '
               +'       h.AMT_NET, '
               +'       h.AMT_DUTYFREE, '
               +'       h.CNT_GUEST, '
               +'       Ifnull(h.AVG_GUEST,0) as AVG_GUEST, '
               +'       c.RCP_CNT, '
               +'       c.CNT_DELIVERY, '
               +'       s.CD_STORE '
               +'  from MS_STORE as s left outer join '
               +'       (select CD_STORE, '
               +'               Sum(AMT_SALE + DC_TOT + AMT_SERVICE) as AMT_SALE_TOT, '
               +'               Sum(DC_TOT)   as AMT_DC, '
               +'               Sum(AMT_SERVICE) as AMT_SERVICE, '
               +'               Sum(AMT_SALE) as AMT_SALE, '
               +'               Sum(AMT_TIP) as AMT_TIP, '
               +'               Sum(AMT_SALE-AMT_TAX-AMT_TIP) as AMT_SOON, '
               +'               Sum(AMT_TAX)  as AMT_TAX, '
               +'               Sum(AMT_SALE-AMT_DUTYFREE) as AMT_NET, '
               +'               Sum(AMT_DUTYFREE)  as AMT_DUTYFREE, '
               +'               Sum(CNT_CUSTOMER) as CNT_GUEST, '
               +'               case when Sum(CNT_CUSTOMER) = 0 then Sum(AMT_SALE) else Round(Sum(AMT_SALE) / Sum(CNT_CUSTOMER), 0) end as AVG_GUEST '
               +'        from   SL_SALE_H_SUM  '
               +'        where  CD_HEAD  =:P0 '
               +'          and  CD_STORE '+vDestStoreCode
               +'          and  YMD_SALE = :P1 '
               +'         group by CD_STORE ) as h on h.CD_STORE = s.CD_STORE inner join '
               +'       (select a.CD_STORE, '
               +'               Count(a.YMD_SALE) as RCP_CNT, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then 1 else 0 end) as CNT_DELIVERY, '
               +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then a.AMT_SALE else 0 end) as AMT_DELIVERY '
               +'          from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a left outer join')
               +'               MS_TABLE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE and b.NO_TABLE > 0 '
               +'        where  a.CD_HEAD  =:P0 '
               +'          and  a.CD_STORE '+vDestStoreCode
               +'          and  a.YMD_SALE =:P1 '
               +'          and  a.DS_SALE <> ''V'' '
               +'         group by a.CD_STORE ) as c on c.CD_STORE = s.CD_STORE,  '
               +' where s.CD_HEAD =:P0 '
               +'   and s.CD_STORE '+vDestStoreCode
               +'   and s.CD_STORE <> :P2 '
               +' order by 2 desc ',
                [HeadStoreCode,
                 GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index]),
                 StandardStore]);

      Result := DM.ReadQuery(Query, GridTableView);
    end;
  end
  else if Tag = 2 then
  begin
    vDestStoreCode := '';
    for vIndex := 1 to WorkStoreList.Count-1 do
      vDestStoreCode := vDestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);

    if vDestStoreCode = '' then Exit;
    vDestStoreCode := Format(' in (%s) ',[LeftStr(vDestStoreCode, Length(vDestStoreCode)-1)]);

    OpenQuery('select StoDW(h.YMD_SALE) as YMD_SALE, '
             +'       case when Ifnull(s.NM_STORE_SHORT,'''') = '''' then s.NM_STORE else s.NM_STORE_SHORT end as NM_STORE_SHORT, '
             +'       h.AMT_SALE_TOT, '
             +'       h.AMT_DC, '
             +'       h.AMT_SERVICE, '
             +'       h.AMT_SALE, '
             +'       h.AMT_TIP, '
             +'       h.AMT_SOON, '
             +'       c.AMT_DELIVERY, '
             +'       h.AMT_TAX, '
             +'       h.AMT_NET, '
             +'       h.AMT_DUTYFREE, '
             +'       h.CNT_GUEST, '
             +'       Ifnull(h.AVG_GUEST,0) as AVG_GUEST, '
             +'       c.RCP_CNT, '
             +'       c.CNT_DELIVERY, '
             +'       s.CD_STORE, '
             +'       d.AMT_AVG '
             +'  from MS_STORE as s inner join '
             +'       (select CD_STORE, '
             +'               YMD_SALE, '
             +'               Sum(AMT_SALE + DC_TOT + AMT_SERVICE) as AMT_SALE_TOT, '
             +'               Sum(DC_TOT)   as AMT_DC, '
             +'               Sum(AMT_SERVICE) as AMT_SERVICE, '
             +'               Sum(AMT_SALE) as AMT_SALE, '
             +'               Sum(AMT_TIP) as AMT_TIP, '
             +'               Sum(AMT_SALE-AMT_TAX-AMT_TIP) as AMT_SOON, '
             +'               Sum(AMT_TAX)  as AMT_TAX, '
             +'               Sum(AMT_SALE-AMT_DUTYFREE) as AMT_NET, '
             +'               Sum(AMT_DUTYFREE)  as AMT_DUTYFREE, '
             +'               Sum(CNT_CUSTOMER) as CNT_GUEST, '
             +'               case when Sum(CNT_CUSTOMER) = 0 then Sum(AMT_SALE) else Round(Sum(AMT_SALE) / Sum(CNT_CUSTOMER), 0) end as AVG_GUEST '
             +'        from   SL_SALE_H_SUM  '
             +'        where  CD_HEAD  =:P0 '
             +'          and  CD_STORE '+vDestStoreCode
             +'          and  YMD_SALE between :P1 and :P2 '
             +'         group by CD_STORE, YMD_SALE ) as h on h.CD_STORE = s.CD_STORE inner join '
             +'       (select a.CD_STORE, '
             +'               a.YMD_SALE, '
             +'               Count(a.YMD_SALE) as RCP_CNT, '
             +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then 1 else 0 end) as CNT_DELIVERY, '
             +'               Sum(case when (Ifnull(b.YN_PACKING,''N'') = ''Y'') or (Ifnull(a.NO_DELIVERY,'''') <> '''') then a.AMT_SALE else 0 end) as AMT_DELIVERY '
             +'          from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'               MS_TABLE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE and b.NO_TABLE > 0 '
             +'        where  a.CD_HEAD  =:P0 '
             +'          and  a.CD_STORE '+vDestStoreCode
             +'          and  a.YMD_SALE between :P1 and :P2 '
             +'          and  a.DS_SALE <> ''V'' '
             +'         group by a.CD_STORE, a.YMD_SALE ) as c on c.CD_STORE = h.CD_STORE and c.YMD_SALE = h.YMD_SALE, '
             +'       (select DivFlt(Sum(AMT_SALE), COUNT(DISTINCT CD_STORE)) AS AMT_AVG '
             +'          from  SL_SALE_H_SUM  '
             +'         where  CD_HEAD  =:P0 '
             +'           and  CD_STORE '+vDestStoreCode
             +'           and  YMD_SALE between :P1 and :P2) as d '
             +' where s.CD_HEAD =:P0 '
             +'   and s.CD_STORE '+vDestStoreCode
             +Ifthen(GetStrPointerData(ConditionToolBarComboBox)='','',Format(' and s.CD_LOCAL = ''%s'' ',[GetStrPointerData(ConditionToolBarComboBox)]))
             +Ifthen(GetStrPointerData(SaleZoneComboBox)='','',Format(' and s.CD_SALEZONE = ''%s'' ',[GetStrPointerData(SaleZoneComboBox)]))
             +' order by 1, 14  ',
              [HeadStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);

    Result := DM.ReadQuery(Query, GridTableView);

    DM.GroupGridTable(GridTableView, GridTableViewSaleDate.Index,
                                     GridTableViewStoreName.Index,
                                    ' [ 소 계 ]',
                                    [GridTableViewTotSaleAmt.Index,
                                     GridTableViewDcAmt.Index,
                                     GridTableViewServiceAmt.Index,
                                     GridTableViewTipAmt.Index,
                                     GridTableViewSaleAmt.Index,
                                     GridTableViewTaxAmt.Index,
                                     GridTableViewSoonSaleAmt.Index,
                                     GridTableViewDeliveryAmt.Index,
                                     GridTableViewDeliveryCount.Index,
                                     GridTableViewGuestCount.Index,
                                     GridTableViewRcpCount.Index,
                                     GridTableViewNetAmt.Index,
                                     GridTableViewDutyFreeAmt.Index]);

  end;

  if (Tag = 0) and (Grid.ActiveLevel = GridLevel) then
  begin
    if Result then
      vAvgAmt := GridTableView.DataController.Values[0, GridTableViewAvgAmt.Index];

    vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

    vChartXml := vChartXml + Format('<trendlines> '
                                   +'<line color="FF0000" isTrendZone="0" thickness="1" showOnTop="1" displayValue="평균:%s" startValue="%f"/> </trendlines>',[FormatFloat(',0',vAvgAmt), vAvgAmt]);
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      vChartXml := vChartXml + '<set label="'+GridTableView.DataController.Values[vIndex,GridTableViewStoreName.Index]+'" value="'+FloatToStr(GridTableView.DataController.Values[vIndex,GridTableViewSaleAmt.Index])+'" />';
    end;
    vChartXml := vChartXml + '</chart>';
    ShowChart(SaleChart, 'SaleChart', 'column3d', vChartXml);
  end;
end;


end.
