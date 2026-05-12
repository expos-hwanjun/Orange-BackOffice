// 거래처별 매출 조회 (완료)

unit SaleMakerSaleShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, ExtCtrls,
  cxContainer, DBAccess, Uni, MemDS, cxGridLevel, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, StdCtrls, AdvToolBarStylers,
  AdvPanel, CheckLst, StrUtils, AdvSplitter, ShockwaveFlashObjects_TLB,
  cxGridBandedTableView, cxRadioGroup, OleCtrls, FusionChart, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TSaleMakerSaleShowForm = class(TInheritShow2Form)
    GridDBTableViewCompanyCode: TcxGridDBColumn;
    GridDBTableViewCompanyName: TcxGridDBColumn;
    GridDBTableViewBuyAmt: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewProfitRate: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubDBTableViewBuyAmt: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewProfitRate: TcxGridDBColumn;
    GridDBTableViewSaleSaleAmt: TcxGridDBColumn;
    GridDBTableViewDutyAmt: TcxGridDBColumn;
    GridDBTableViewDutyFreeAmt: TcxGridDBColumn;
    GridDBTableViewDcAmt: TcxGridDBColumn;
    GridDBTableViewRealAmt: TcxGridDBColumn;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;
    GridLevel1: TcxGridLevel;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView1Column3: TcxGridBandedColumn;
    GridBandedTableView1Column4: TcxGridBandedColumn;
    GridBandedTableView1Column5: TcxGridBandedColumn;
    GridBandedTableView1Column6: TcxGridBandedColumn;
    GridBandedTableView1Column7: TcxGridBandedColumn;
    GridBandedTableView1Column8: TcxGridBandedColumn;
    GridBandedTableView1Column9: TcxGridBandedColumn;
    GridBandedTableView1Column10: TcxGridBandedColumn;
    GridBandedTableView1Column11: TcxGridBandedColumn;
    GridLevel2: TcxGridLevel;
    GridLevel3: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridDBTableViewTaxAmt: TcxGridDBColumn;
    GridDBTableViewBottleAmt: TcxGridDBColumn;
    GridTableView1Column9: TcxGridColumn;
    GridDBTableViewProfitAmt: TcxGridDBColumn;
    GridTableView1Column10: TcxGridColumn;
    GridSubDBTableViewProfitAmt: TcxGridDBColumn;
    GridSubDBTableViewVatAmt: TcxGridDBColumn;
    GridLevel4: TcxGridLevel;
    GridTableViewYmdSale: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    ConditionSearchGoodsLabel: TcxLabel;
    ConditionSearchGoodsEdit: TcxTextEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure GridDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
  private
    FCompanyChart: TFusionChart;
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleMakerSaleShowForm: TSaleMakerSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSaleMakerSaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;

  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    ConditionToolBarEdit.Text := FormParam[1];
    Exec_Timer.Enabled := True;
  end;
end;

procedure TSaleMakerSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TSaleMakerSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
  FCompanyChart := TFusionChart.Create(ChartPanel);
  FCompanyChart.Align := alClient;
end;

//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSaleMakerSaleShowForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;

procedure TSaleMakerSaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    ConditionToolBarDateLabel.Caption   := '조회기간';
    ConditionToolBarDateToLabel.Visible := True;
    ConditionToolBarToDateEdit.Visible  := True;
    ButtonToolBarSearchButton.Enabled   := True;
    ChartPanel.Visible := True;
  end
  else if ((Grid.ActiveLevel = GridLevel1) or (Grid.ActiveLevel = GridLevel3) or (Grid.ActiveLevel = GridLevel2)) then
  begin
    DoSearch;
  end
  else if (Grid.ActiveLevel = GridLevel4) then
  begin
    ButtonToolBarSearchButton.Enabled := True;
    ChartPanel.Visible := True;
    ConditionToolBarDateLabel.Caption   := '기준월';
    ConditionToolBarDateToLabel.Visible := False;
    ConditionToolBarToDateEdit.Visible  := False;
    ConditionSearchGoodsLabel.Visible   := false;
    ConditionSearchGoodsEdit.Visible    := false;
  end;
end;

procedure TSaleMakerSaleShowForm.GridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridDBTableView.DataController.GetFocusedRecordIndex < 0 then Exit;
  if GridDBTableView.DataController.RecordCount <= 0 then
  begin
    GridLevel1.Caption := ' 일자별 상품매출 ';
    GridTableView1.DataController.RecordCount := 0;
    Exit;
  end;

  Grid.ActiveLevel := GridLevel1;
  GridLevel1.Caption := '['+GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyName.Index ] + '] 일자별 상품매출 ';
  DoSearch;
end;

procedure TSaleMakerSaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView1.DataController.GetFocusedRecordIndex < 0 then Exit;
  if GridTableView1.DataController.RecordCount <= 0 then
  begin
    GridLevel3.Caption := ' 상품별 매출조회 ';
    GridTableView1.DataController.RecordCount := 0;
    Exit;
  end;

  Grid.ActiveLevel := GridLevel3;
  GridLevel3.Caption := '['+GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1Column1.Index ] + '] 상품별 매출조회 ';
  DoSearch;
end;

procedure TSaleMakerSaleShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if (AItem <> nil) and (AItem.Index = GridTableViewYmdSale.Index) and (ARecord.Values[GridTableViewYmdSale.Index] = '[ 소계 ]') then
    AStyle := StyleFontRed;

end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 조회조건에서 키보드를 누를 때
procedure TSaleMakerSaleShowForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSaleMakerSaleShowForm.DoSearch:Boolean;
var
  vIndex    : Integer;
  vChartXml : String;
  vCondition: String;
begin
  Result := false;

  if ConditionToolBarEdit.Text <> '' then
    vCondition := ' inner join MS_TRD t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''M'''
                 +' and ( t.CD_TRDPL = '''+ConditionToolBarEdit.Text+''' or t.NM_TRDPL like ''%''+'''+ConditionToolBarEdit.Text+'''+ ''%'') '
  else
    vCondition := ' left outer join MS_TRD t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''M''';

  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   t.CD_TRDPL, '
             +'         Isnull(t.NM_TRDPL,''[미지정]'') as NM_TRDPL, '
             +'         a.AMT_BUY, '
             +'         a.AMT_SALE, '
             +'         a.AMT_SALE_SALE, '
             +'         a.AMT_TAX, '
             +'         a.AMT_BOTTLE, '
             +'         a.AMT_REAL, '
             +'         a.AMT_DC_TOT, '
             +'         a.RATE_PROFIT, '
             +'         a.AMT_SALE_SALE - a.AMT_BUY as AMT_PROFIT, '
             +'         a.AMT_SALE_DUTY, '
             +'         a.AMT_SALE_DUTYFREE '
             +'from    (select   d.CD_STORE, '
             +'                  Isnull(g.CD_TRDPL,'''') as CD_TRDPL, '
             +'                  Sum(d.AMT_BUY)  as AMT_BUY, '
             +'                  Sum(d.AMT_SALE) as AMT_SALE, '
             +'                  Sum(d.AMT_VAT)  as AMT_TAX, '
             +'                  Sum(d.AMT_BOTTLE)  as AMT_BOTTLE, '
             +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE_SALE, '
             +'                  Sum(d.AMT_SALE - d.DC_TOT - d.AMT_VAT - d.AMT_BOTTLE) as AMT_REAL, '
             +'                  Sum(d.DC_TOT)  as AMT_DC_TOT, '
             +'                  dbo.GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
             +'                  Sum(case when g.DS_TAX=''1'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_DUTY, '
             +'                  Sum(case when g.DS_TAX=''0'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_DUTYFREE '
             +'         from     SL_SALE_D_SUM as d (nolock) left outer join '
             +'                  MS_GOODS      as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
             +                   vCondition
             +'         where    d.CD_STORE = :P0 '
             +'           and    d.YMD_SALE between :P1 and :P2 '
             +'         group by d.CD_STORE, g.CD_TRDPL) as a left outer join '
             +'         MS_TRD as t on a.CD_STORE = t.CD_STORE and a.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''M'' '
             +'order by a.CD_TRDPL ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    GridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MemData);
    GridDBTableView.DataController.DataSource := DataSource;
    Result := GridDBTableView.DataController.RecordCount > 0;

      // 푸터 이익률을 구한다
    if (GridDBTableView.DataController.Summary.FooterSummaryValues[0] <> null) and
       (GridDBTableView.DataController.Summary.FooterSummaryValues[1] <> null) and
       (GridDBTableView.DataController.Summary.FooterSummaryValues[1] <> 0) then
      GridDBTableView.DataController.Summary.FooterSummaryValues[2] := FormatFloat('0.00%', RoundNumber(GridDBTableView.DataController.Summary.FooterSummaryValues[15]  / GridDBTableView.DataController.Summary.FooterSummaryValues[4] * 100, 0.01))
    else
      GridDBTableView.DataController.Summary.FooterSummaryValues[2] := EmptyStr;


      // 챠트로 표시
      vChartXml := '<graph rotateNames="0" baseFont="굴림" rotateValues="1" placeValuesInside="1" baseFontSize="11"   '
          + ' outCnvBaseFont="굴림" outCnvBaseFontSize="12" caption="제조처별 매출" xAxisName=""    '
          + ' yAxisName="" decimalPrecision="0" formatNumberScale="0" >'
          + '';
      for vIndex := 0 to GridDBTableView.DataController.FilteredRecordCount - 1 do
      begin
        vChartXml := vChartXml + '<set name="'+GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vIndex],1]+'" value="'+FloatToStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vIndex],GridDBTableViewSaleAmt.Index])+'" />'
      end;
      vChartXml := vChartXml + '</graph>';
      FCompanyChart.ChartUrl := 'Column3D.swf';
      FCompanyChart.Draw( vChartXml );
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    ChartPanel.Visible := False;
    if GridDBTableView.DataController.GetFocusedRecordIndex = -1 then
    begin
      GridTableView.DataController.RecordCount := 0;
      Exit;
    end;

    OpenQuery('select   case when GROUPING(CD_GOODS) = 0 and GROUPING(YMD_SALE) = 0 then case when Max(ROWNUM) = 1 then MAX(CD_GOODS) end when GROUPING(CD_GOODS) = 1 then '''' end as CD_GOODS, '
             +'         case when GROUPING(CD_GOODS) = 0 and GROUPING(YMD_SALE) = 0 then case when Max(ROWNUM) = 1 then Max(NM_GOODS) end when GROUPING(CD_GOODS) = 1 then ''[ 합 계 ] '' end as NM_GOODS, '
             +'         case when Max(ROWNUM) = 1 then MAX(NM_SPEC) end AS NM_SPEC, '
             +'         case when GROUPING(CD_GOODS) = 0 and GROUPING(YMD_SALE) = 1 then ''[ 소계 ]'' else YMD_SALE end as YMD_SALE, '
             +'         SUM(QTY_SALE) as QTY_SALE, '
             +'	     	  Sum(AMT_BUY)  as AMT_BUY, '
             +'         SUM(AMT_SALE) as AMT_SALE, '
             +'		      Sum(AMT_VAT) as AMT_VAT, '
             +'		      dbo.GetProfitRate(Sum(AMT_BUY), Sum(AMT_SALE)) as RATE_PROFIT, '
             +'		      Sum(AMT_PROFIT) as AMT_PROFIT '
             +'from    (  '
             +'      		select d.CD_GOODS, '
             +'          			 Max(g.NM_GOODS) as NM_GOODS, '
             +'          			 Max(g.NM_SPEC)  as NM_SPEC, '
             +'          			 dbo.StoD(d.YMD_SALE) as YMD_SALE, '
             +'          			 Sum(d.QTY_SALE) as QTY_SALE, '
             +'          			 Sum(d.AMT_BUY)  as AMT_BUY, '
             +'          			 Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'          			 Sum(d.AMT_VAT) as AMT_VAT, '
             +'          			 dbo.GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT))  as RATE_PROFIT, '
             +'          			 Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT, '
             +'          			 ROW_NUMBER() over (partition by d.CD_GOODS order by d.YMD_SALE) as ROWNUM '
             +'      		from   SL_SALE_D_SUM as d (nolock) inner join '
             +'      				   MS_GOODS      as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
             +'      		where  d.CD_STORE = :P0 '
             +'      		  and  g.CD_TRDPL = :P1 '
             +'      		  and  d.YMD_SALE between :P2 and :P3 '
             +'           and  (d.CD_GOODS = :P4 or g.NM_GOODS like ''%''+:P4+''%'') '
             +'      		group by d.CD_GOODS, d.YMD_SALE '
             +'	) as a '
             +'group by CD_GOODS, YMD_SALE with rollup ',
              [StoreCode,
               NVL(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyCode.Index],''),
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionSearchGoodsEdit.Text]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
     if GridDBTableView.DataController.GetFocusedRecordIndex = -1 then
     begin
       GridTableView1.DataController.RecordCount := 0;
       Exit;
     end;

     if NVL(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyCode.Index],'') = '' then
        vCondition := ' and (g.CD_TRDPL = '''' or g.CD_TRDPL is null) '
     else
        vCondition := ' and g.CD_TRDPL = '''+NVL(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyCode.Index],'')+'''';
     OpenQuery('select dbo.StoD(d.YMD_SALE) as YMD_SALE, '
              +'       Sum(d.AMT_BUY)  as AMT_BUY, '
              +'       Sum(d.AMT_SALE) as AMT_SALE, '
              +'       Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE_SALE, '
              +'       Sum(d.AMT_VAT) as AMT_TAX, '
              +'       Sum(d.AMT_BOTTLE) as AMT_BOTTLE, '
              +'       Sum(d.AMT_SALE - d.DC_TOT - d.AMT_VAT - d.AMT_BOTTLE) as AMT_REAL, '
              +'       Sum(d.DC_TOT)  as AMT_DC, '
              +'       dbo.GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
              +'       Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT '
              +'  from SL_SALE_D_SUM as d (nolock) inner join '
              +'       MS_GOODS      as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '+vCondition
              +' where d.CD_STORE = :P0 '
              +'   and d.YMD_SALE between :P1 and :P2 '
              +' group by d.YMD_SALE '
              +' order by d.YMD_SALE ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;

    // 푸터 이익률을 구한다
    if (GridTableView1.DataController.Summary.FooterSummaryValues[7] <> null) and
       (GridTableView1.DataController.Summary.FooterSummaryValues[1] <> 0) then
      GridTableView1.DataController.Summary.FooterSummaryValues[8] := FormatFloat('0.00%', RoundNumber(GridTableView1.DataController.Summary.FooterSummaryValues[7]  / GridTableView1.DataController.Summary.FooterSummaryValues[1] * 100, 0.01))
    else
      GridTableView1.DataController.Summary.FooterSummaryValues[8] := EmptyStr;
  end
  else if Grid.ActiveLevel = GridLevel3 then
  begin
    ChartPanel.Visible := False;
    if GridDBTableView.DataController.GetFocusedRecordIndex = -1 then
    begin
      GridTableView.DataController.RecordCount := 0;
      Exit;
    end;

    if NVL(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyCode.Index],'') = '' then
       vCondition := ' and (g.CD_TRDPL = '''' or g.CD_TRDPL is null) '
    else
       vCondition := ' and g.CD_TRDPL = '''+NVL(GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewCompanyCode.Index],'')+'''';

    OpenQuery('select   d.CD_GOODS, '
             +'         Max(g.NM_GOODS) as NM_GOODS, '
             +'         Max(g.NM_SPEC) as NM_SPEC, '
             +'         Sum(d.QTY_SALE) as QTY_SALE, '
             +'         Sum(d.AMT_BUY)  as AMT_BUY, '
             +'         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
             +'         Sum(d.AMT_VAT) as AMT_VAT, '
             +'         dbo.GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
             +'         Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT '
             +'from     SL_SALE_D_SUM as d (nolock) inner join '
             +'         MS_GOODS      as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
             +'where    d.CD_STORE = :P0 '
             +'  and    d.YMD_SALE Between :P1 and :P2 '
             + vCondition
             +'group by d.CD_GOODS '
             +'order by d.CD_GOODS',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;
    Result := GridSubDBTableView.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel4 then
  begin
    GridBandedTableView1.Bands[1].Caption  := FormatDateTime('yyyy-mm',IncMonth(ConditionToolBarFromDateEdit.Date,-2));
    GridBandedTableView1.Bands[2].Caption  := FormatDateTime('yyyy-mm',IncMonth(ConditionToolBarFromDateEdit.Date,-1));
    GridBandedTableView1.Bands[3].Caption  := FormatDateTime('yyyy-mm',ConditionToolBarFromDateEdit.Date);

    OpenQuery('select   case when Max(NM_TRDPL) is NULL then ''(미지정)'' else Max(NM_TRDPL) end as NM_TRDPL, '
             +'         Sum(RATE_TWO) as AMT_BUY_TWO, '
             +'         Sum(AMT_TWO)  as AMT_SALE_TWO, '
             +'         case when Sum(AMT_TWO) = 0 then 0 else Round(Sum(AMT_TWO-RATE_TWO) / Sum(AMT_TWO) * 100, 2) end as RATE_TWO, '
             +'         Sum(RATE_ONE) as AMT_BUY_ONE, '
             +'         Sum(AMT_ONE)  as AMT_SALE_ONE, '
             +'         case when Sum(AMT_ONE) = 0 then 0 else Round(Sum(AMT_ONE-RATE_ONE) / Sum(AMT_ONE) * 100, 2) end as RATE_ONE, '
             +'         Sum(RATE_NOW) as AMT_BUY_NOW, '
             +'         Sum(AMT_NOW)  as AMT_SALE_NOW, '
             +'         case when Sum(AMT_NOW) = 0 then 0 else Round(Sum(AMT_NOW-RATE_NOW) / Sum(AMT_NOW) * 100, 2) end as RATE_NOW '
             +'from    (select   t.CD_TRDPL, '
             +'                  MAX(t.NM_TRDPL) AS NM_TRDPL, '
             +'                  case when SubString(d.YMD_SALE,1,6) = :P1 then Sum(d.AMT_SALE - d.DC_TOT) else 0 end as AMT_TWO, '
             +'                  case when SubString(d.YMD_SALE,1,6) = :P1 then Sum(d.AMT_BUY) else 0 end as RATE_TWO, '
             +'                  case when SubString(d.YMD_SALE,1,6) = :P2 then Sum(d.AMT_SALE - d.DC_TOT) else 0 end as AMT_ONE, '
             +'                  case when SubString(d.YMD_SALE,1,6) = :P2 then Sum(d.AMT_BUY) else 0 end as RATE_ONE, '
             +'                  case when SubString(d.YMD_SALE,1,6) = :P3 then Sum(d.AMT_SALE - d.DC_TOT) else 0 end as AMT_NOW, '
             +'                  case when SubString(d.YMD_SALE,1,6) = :P3 then Sum(d.AMT_BUY) else 0 end as RATE_NOW '
             +'         from     SL_SALE_D_SUM as d (nolock) left outer join '
             +'                  MS_GOODS      as g (nolock) on g.CD_STORE = d.CD_STORE and g.CD_GOODS = d.CD_GOODS '
             +                  vCondition
             +'         where    d.CD_STORE = :P0 '
             +'           and   (d.YMD_SALE like :P1+''%'' or d.YMD_SALE like :P2+''%'' or d.YMD_SALE like :P3+''%'') '
             +'         group by t.CD_TRDPL, d.YMD_SALE) as t '
             +'group by CD_TRDPL '
             +'order by NM_TRDPL',
             [StoreCode,
              FormatDateTime('yyyymm',IncMonth(ConditionToolBarFromDateEdit.Date,-2)),
              FormatDateTime('yyyymm',IncMonth(ConditionToolBarFromDateEdit.Date,-1)),
              FormatDateTime('yyyymm',ConditionToolBarFromDateEdit.Date)]);
    DM.ReadQuery(Query, GridBandedTableView1);
    Result := GridBandedTableView1.DataController.RecordCount > 0;

    // 푸터 이익률을 구한다
    if (GridBandedTableView1.DataController.Summary.FooterSummaryValues[4] <> null) and
       (GridBandedTableView1.DataController.Summary.FooterSummaryValues[5] <> 0) then
      GridBandedTableView1.DataController.Summary.FooterSummaryValues[6] := FormatFloat('0.00%', RoundNumber((GridBandedTableView1.DataController.Summary.FooterSummaryValues[4]-GridBandedTableView1.DataController.Summary.FooterSummaryValues[5])  / GridBandedTableView1.DataController.Summary.FooterSummaryValues[4] * 100, 0.01))
    else
      GridBandedTableView1.DataController.Summary.FooterSummaryValues[6] := EmptyStr;

    if (GridBandedTableView1.DataController.Summary.FooterSummaryValues[2] <> null) and
       (GridBandedTableView1.DataController.Summary.FooterSummaryValues[3] <> 0) then
      GridBandedTableView1.DataController.Summary.FooterSummaryValues[7] := FormatFloat('0.00%', RoundNumber((GridBandedTableView1.DataController.Summary.FooterSummaryValues[2]-GridBandedTableView1.DataController.Summary.FooterSummaryValues[3])  / GridBandedTableView1.DataController.Summary.FooterSummaryValues[2] * 100, 0.01))
    else
      GridBandedTableView1.DataController.Summary.FooterSummaryValues[7] := EmptyStr;

    if (GridBandedTableView1.DataController.Summary.FooterSummaryValues[0] <> null) and
       (GridBandedTableView1.DataController.Summary.FooterSummaryValues[1] <> 0) then
      GridBandedTableView1.DataController.Summary.FooterSummaryValues[8] := FormatFloat('0.00%', RoundNumber((GridBandedTableView1.DataController.Summary.FooterSummaryValues[0]-GridBandedTableView1.DataController.Summary.FooterSummaryValues[1])  / GridBandedTableView1.DataController.Summary.FooterSummaryValues[0] * 100, 0.01))
    else
      GridBandedTableView1.DataController.Summary.FooterSummaryValues[8] := EmptyStr;

  end;
end;

end.

