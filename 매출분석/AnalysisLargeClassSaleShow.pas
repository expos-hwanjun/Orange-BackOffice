unit AnalysisLargeClassSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit, cxGridBandedTableView, DateUtils, StrUtils, Math,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TAnalysisLargeClassSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView2: TcxGridBandedTableView;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView1Column2: TcxGridBandedColumn;
    GridBandedTableView1Column3: TcxGridBandedColumn;
    GridBandedTableView1Column4: TcxGridBandedColumn;
    GridBandedTableView1Column5: TcxGridBandedColumn;
    GridBandedTableView1Column6: TcxGridBandedColumn;
    GridBandedTableView1Column7: TcxGridBandedColumn;
    GridBandedTableView1Column8: TcxGridBandedColumn;
    GridBandedTableView1Column9: TcxGridBandedColumn;
    GridBandedTableView2Column1: TcxGridBandedColumn;
    GridBandedTableView2SunSale: TcxGridBandedColumn;
    GridBandedTableView2SunRate: TcxGridBandedColumn;
    GridBandedTableView2MonSale: TcxGridBandedColumn;
    GridBandedTableView2MonRate: TcxGridBandedColumn;
    GridBandedTableView2TueSale: TcxGridBandedColumn;
    GridBandedTableView2TueRate: TcxGridBandedColumn;
    GridBandedTableView2WedSale: TcxGridBandedColumn;
    GridBandedTableView2WedRate: TcxGridBandedColumn;
    GridBandedTableView2ThuSale: TcxGridBandedColumn;
    GridBandedTableView2ThuRate: TcxGridBandedColumn;
    GridBandedTableView2FriSale: TcxGridBandedColumn;
    GridBandedTableView2FriRate: TcxGridBandedColumn;
    GridBandedTableView2SatSale: TcxGridBandedColumn;
    GridBandedTableView2SatRate: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridBandedTableView1Column6StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GridBandedTableView1Column9StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisLargeClassSaleShowForm: TAnalysisLargeClassSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TAnalysisLargeClassSaleShowForm }
procedure TAnalysisLargeClassSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TAnalysisLargeClassSaleShowForm.GridActiveTabChanged(
  Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
  inherited;
  ConditionToolBarDateToLabel.Visible      := ALevel = GridLevel2;
  ConditionToolBarToDateEdit.Visible       := ALevel = GridLevel2;
  ConditionToolbarTodayRadioButton.Visible := ALevel = GridLevel2;
  ConditionToolbarWeekRadioButton.Visible  := ALevel = GridLevel2;
  ConditionToolbarMonthRadioButton.Visible := ALevel = GridLevel2;
end;

procedure TAnalysisLargeClassSaleShowForm.GridBandedTableView1Column6StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[AItem.Index] < 0 then
    AStyle := StyleFontRed;
end;

procedure TAnalysisLargeClassSaleShowForm.GridBandedTableView1Column9StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[AItem.Index] < 0 then
    AStyle := StyleFontRed;
end;

function TAnalysisLargeClassSaleShowForm.DoSearch: Boolean;
var vIndex :Integer;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    GridTableViewColumn2.Caption := FormatDateTime('mm월dd일', IncDay(ConditionToolBarFromDateEdit.Date,-6));
    GridTableViewColumn3.Caption := FormatDateTime('mm월dd일', IncDay(ConditionToolBarFromDateEdit.Date,-5));
    GridTableViewColumn4.Caption := FormatDateTime('mm월dd일', IncDay(ConditionToolBarFromDateEdit.Date,-4));
    GridTableViewColumn5.Caption := FormatDateTime('mm월dd일', IncDay(ConditionToolBarFromDateEdit.Date,-3));
    GridTableViewColumn6.Caption := FormatDateTime('mm월dd일', IncDay(ConditionToolBarFromDateEdit.Date,-2));
    GridTableViewColumn7.Caption := FormatDateTime('mm월dd일', IncDay(ConditionToolBarFromDateEdit.Date,-1));
    GridTableViewColumn8.Caption := FormatDateTime('mm월dd일', ConditionToolBarFromDateEdit.Date);

    OpenQuery('select case when t.NM_CLASS is NULL then ''(미지정)'' else ConCat(t.CD_CLASS,''-'',t.NM_CLASS) end as NM_CLASS, '
             +'       SUM(t.AMT_SALE_6)  as AMT_SALE_6, '
             +'       SUM(t.AMT_SALE_5)  as AMT_SALE_5, '
             +'       SUM(t.AMT_SALE_4)  as AMT_SALE_4, '
             +'       SUM(t.AMT_SALE_3)  as AMT_SALE_3, '
             +'       SUM(t.AMT_SALE_2)  as AMT_SALE_2, '
             +'       SUM(t.AMT_SALE_1)  as AMT_SALE_1, '
             +'       SUM(t.AMT_SALE)    as AMT_SALE '
             +'  from '
             +'  ( '
             +'  select c.CD_CLASS, '
             +'         Max(c.NM_CLASS) as NM_CLASS, '
             +'         case when d.YMD_SALE = :P2 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_6, '
             +'         case when d.YMD_SALE = :P3 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_5, '
             +'         case when d.YMD_SALE = :P4 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_4, '
             +'         case when d.YMD_SALE = :P5 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_3, '
             +'         case when d.YMD_SALE = :P6 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_2, '
             +'         case when d.YMD_SALE = :P7 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_1, '
             +'         case when d.YMD_SALE = :P8 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE '
             +'     from SL_SALE_D_SUM  d left outer join '
             +'          MS_MENU        g on g.CD_HEAD  = d.CD_HEAD '
             +'                          and g.CD_STORE = d.CD_STORE '
             +'                          and g.CD_MENU  = d.CD_MENU left outer join '
             +'          MS_MENU_CLASS  c on c.CD_HEAD  = g.CD_HEAD '
             +'                          and c.CD_STORE = g.CD_STORE '
             +'                          and Length(c.CD_CLASS) = 2 '
             +'                          and c.CD_CLASS = SUBSTRING(g.CD_CLASS,1,2) '
             +'    where d.CD_HEAD  =:P0 '
             +'      and d.CD_STORE =:P1 '
             +'      and (d.YMD_SALE like ConCat(:P2,''%'') or d.YMD_SALE like ConCat(:P3,''%'') or d.YMD_SALE like ConCat(:P4,''%'') or d.YMD_SALE like ConCat(:P5,''%'') or d.YMD_SALE like ConCat(:P6,''%'') or d.YMD_SALE like ConCat(:P7,''%'') or d.YMD_SALE like ConCat(:P8,''%'')) '
             +'   group by c.CD_CLASS, c.NM_CLASS, d.YMD_SALE '
             +'   ) t '
             +' group by t.CD_CLASS, t.NM_CLASS '
             +' order by t.CD_CLASS ',
             [HeadStoreCode,
              StoreCode,
              DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-6)),
              DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-5)),
              DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-4)),
              DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-3)),
              DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-2)),
              DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
              DtoS(ConditionToolBarFromDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    GridBandedTableView1.Bands[1].Caption  := FormatDateTime('yyyy-mm',IncMonth(ConditionToolBarFromDateEdit.Date,-2));
    GridBandedTableView1.Bands[2].Caption  := FormatDateTime('yyyy-mm',IncMonth(ConditionToolBarFromDateEdit.Date,-1));
    GridBandedTableView1.Bands[3].Caption  := FormatDateTime('yyyy-mm',ConditionToolBarFromDateEdit.Date);

    OpenQuery('select case when Ifnull(t.CD_CLASS,'''') = '''' then ''(미지정)'' else ConCat(t.CD_CLASS,''-'',Max(t.NM_CLASS)) end as NM_CLASS, '
             +'        Sum(t.AMT_TWO)  AS AMT_TWO, '
             +'        GetProfitRate(sum(t.BUY_TWO), Sum(t.AMT_TWO))as RATE_TWO, '
             +'        sum(t.AMT_ONE)  AS AMT_ONE, '
             +'        sum(t.AMT_ONE - AMT_TWO)  AS AMT_ONE_GROW, '
             +'        GetProfitRate(sum(t.BUY_ONE), Sum(t.AMT_ONE))as RATE_ONE, '
             +'        sum(t.AMT_NOW)  AS AMT_NOW, '
             +'        sum(t.AMT_NOW - AMT_ONE)  AS AMT_NOW_GROW, '
             +'        GetProfitRate(sum(t.BUY_NOW), Sum(t.AMT_NOW))as RATE_NOW '
             +'   from ( '
             +'         select Left(g.CD_CLASS,2) as CD_CLASS, '
             +'                Max(g.NM_CLASS) as NM_CLASS, '
             +'                case when LEFT(d.YMD_SALE,6) = :P2 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_TWO, '
             +'                case when LEFT(d.YMD_SALE,6) = :P3 then sum(d.AMT_BUY) ELSE 0           end as BUY_TWO, '
             +'                case when LEFT(d.YMD_SALE,6) = :P3 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_ONE, '
             +'                case when LEFT(d.YMD_SALE,6) = :P3 then sum(d.AMT_BUY) ELSE 0           end as BUY_ONE, '
             +'                case when LEFT(d.YMD_SALE,6) = :P4 then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_NOW, '
             +'                case when LEFT(d.YMD_SALE,6) = :P4 then sum(d.AMT_BUY) ELSE 0           end as BUY_NOW '
             +'           from SL_SALE_D_SUM  d left outer join '
             +'                (select a.CD_MENU, '
             +'                        a.CD_CLASS, '
             +'                        b.NM_CLASS '
             +'                   from MS_MENU a inner join '
             +'                        MS_MENU_CLASS b on b.CD_HEAD  = a.CD_HEAD '
             +'                                       and b.CD_STORE = a.CD_STORE '
             +'                                       and Length(b.CD_CLASS) = 2 '
             +'                                       and b.CD_CLASS = LEFT(a.CD_CLASS,2) '
             +'                  where a.CD_HEAD  =:P0 '
             +'                    and a.CD_STORE =:P1 '
             +'                ) as g on d.CD_MENU = g.CD_MENU '
             +'          where d.CD_HEAD  =:P0 '
             +'            and d.CD_STORE =:P1 '
             +'            and d.YMD_SALE between ConCat(:P2,''01'') and ConCat(:P4,''31'') '
             +'          group by g.CD_CLASS, d.YMD_SALE  '
             +'          ) t '
             +' group by t.CD_CLASS, t.NM_CLASS '
             +' order by t.CD_CLASS ',
             [HeadStoreCode,
              StoreCode,
              FormatDateTime('yyyymm',IncMonth(ConditionToolBarFromDateEdit.Date,-2)),
              FormatDateTime('yyyymm',IncMonth(ConditionToolBarFromDateEdit.Date,-1)),
              FormatDateTime('yyyymm',ConditionToolBarFromDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedTableView1);
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    OpenQuery('select case when NM_CLASS is NULL then ''(미지정)'' else ConCat(CD_CLASS,''-'',NM_CLASS) end as NM_CLASS, '
             +'       sum(AMT_SALE_SUN)  as AMT_SALE_SUN, '
             +'       sum(AMT_SALE_MON)  as AMT_SALE_MON, '
             +'       sum(AMT_SALE_TUE)  as AMT_SALE_TUE, '
             +'       sum(AMT_SALE_WED)  as AMT_SALE_WED, '
             +'       sum(AMT_SALE_THU)  as AMT_SALE_THU, '
             +'       sum(AMT_SALE_FRI)  as AMT_SALE_FRI, '
             +'       sum(AMT_SALE_SAT)  as AMT_SALE_SAT '
             +'  from ( '
             +'        select Left(g.CD_CLASS,2) as CD_CLASS, '
             +'               Max(c.NM_CLASS) as NM_CLASS, '
             +'               Sum(case when DAYOFWEEK(d.YMD_SALE) = ''1'' then 1 else 0 end) as CNT_SUN, '
             +'               Sum(case when DAYOFWEEK(d.YMD_SALE) = ''2'' then 1 else 0 end) as CNT_MON, '
             +'               Sum(case when DAYOFWEEK(d.YMD_SALE) = ''3'' then 1 else 0 end) as CNT_TUE, '
             +'               Sum(case when DAYOFWEEK(d.YMD_SALE) = ''4'' then 1 else 0 end) as CNT_WED, '
             +'               Sum(case when DAYOFWEEK(d.YMD_SALE) = ''5'' then 1 else 0 end) as CNT_THU, '
             +'               Sum(case when DAYOFWEEK(d.YMD_SALE) = ''6'' then 1 else 0 end) as CNT_FRI, '
             +'               Sum(case when DAYOFWEEK(d.YMD_SALE) = ''7'' then 1 else 0 end) as CNT_SAT, '
             +'               Count(d.YMD_SALE) as CNT_TOT, '
             +'               case when DAYOFWEEK(d.YMD_SALE) = ''1'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_SUN, '
             +'               case when DAYOFWEEK(d.YMD_SALE) = ''2'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_MON, '
             +'               case when DAYOFWEEK(d.YMD_SALE) = ''3'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_TUE, '
             +'               case when DAYOFWEEK(d.YMD_SALE) = ''4'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_WED, '
             +'               case when DAYOFWEEK(d.YMD_SALE) = ''5'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_THU, '
             +'               case when DAYOFWEEK(d.YMD_SALE) = ''6'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_FRI, '
             +'               case when DAYOFWEEK(d.YMD_SALE) = ''7'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_SAT, '
             +'               sum(d.AMT_SALE-d.DC_TOT) as AMT_SALE_TOT  '
             +'          from SL_SALE_D_SUM  d left outer join '
             +'               MS_MENU        g on g.CD_HEAD  = d.CD_HEAD '
             +'                               and g.CD_STORE = d.CD_STORE '
             +'                               and g.CD_MENU  = d.CD_MENU inner join '
             +'               MS_MENU_CLASS  c on c.CD_HEAD = g.CD_HEAD '
             +'                               and c.CD_STORE = g.CD_STORE '
             +'                               and Length(c.CD_CLASS) = 2 '
             +'                               and c.CD_CLASS = Left(g.CD_CLASS,2) '
             +'         where d.CD_HEAD  =:P0 '
             +'           and d.CD_STORE =:P1 '
             +'           and d.YMD_SALE between :P2 and :P3 '
             +'         group by g.CD_CLASS, c.NM_CLASS, d.YMD_SALE '
             +'         ) t '
             +'group by t.CD_CLASS, t.NM_CLASS '
             +'order by t.CD_CLASS ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedTableView2);

    for vIndex := 0 to GridBandedTableView2.DataController.RecordCount-1 do
    begin
      GridBandedTableView2.DataController.Values[vIndex, GridBandedTableView2SunRate.Index] := GridBandedTableView2.DataController.Values[vIndex,GridBandedTableView2SunSale.Index]/ Ifthen(GridBandedTableView2.DataController.Summary.FooterSummaryValues[0]=0,1,GridBandedTableView2.DataController.Summary.FooterSummaryValues[0]) * 100;
      GridBandedTableView2.DataController.Values[vIndex, GridBandedTableView2MonRate.Index] := GridBandedTableView2.DataController.Values[vIndex,GridBandedTableView2MonSale.Index]/ Ifthen(GridBandedTableView2.DataController.Summary.FooterSummaryValues[2]=0,1,GridBandedTableView2.DataController.Summary.FooterSummaryValues[2]) * 100;
      GridBandedTableView2.DataController.Values[vIndex, GridBandedTableView2TueRate.Index] := GridBandedTableView2.DataController.Values[vIndex,GridBandedTableView2TueSale.Index]/ Ifthen(GridBandedTableView2.DataController.Summary.FooterSummaryValues[4]=0,1,GridBandedTableView2.DataController.Summary.FooterSummaryValues[4]) * 100;
      GridBandedTableView2.DataController.Values[vIndex, GridBandedTableView2WedRate.Index] := GridBandedTableView2.DataController.Values[vIndex,GridBandedTableView2WedSale.Index]/ Ifthen(GridBandedTableView2.DataController.Summary.FooterSummaryValues[6]=0,1,GridBandedTableView2.DataController.Summary.FooterSummaryValues[6]) * 100;
      GridBandedTableView2.DataController.Values[vIndex, GridBandedTableView2ThuRate.Index] := GridBandedTableView2.DataController.Values[vIndex,GridBandedTableView2ThuSale.Index]/ Ifthen(GridBandedTableView2.DataController.Summary.FooterSummaryValues[8]=0,1,GridBandedTableView2.DataController.Summary.FooterSummaryValues[8]) * 100;
      GridBandedTableView2.DataController.Values[vIndex, GridBandedTableView2FriRate.Index] := GridBandedTableView2.DataController.Values[vIndex,GridBandedTableView2FriSale.Index]/ Ifthen(GridBandedTableView2.DataController.Summary.FooterSummaryValues[10]=0,1,GridBandedTableView2.DataController.Summary.FooterSummaryValues[10]) * 100;
      GridBandedTableView2.DataController.Values[vIndex, GridBandedTableView2SatRate.Index] := GridBandedTableView2.DataController.Values[vIndex,GridBandedTableView2SatSale.Index]/ Ifthen(GridBandedTableView2.DataController.Summary.FooterSummaryValues[12]=0,1,GridBandedTableView2.DataController.Summary.FooterSummaryValues[12]) * 100;
    end;
  end;

end;


end.
