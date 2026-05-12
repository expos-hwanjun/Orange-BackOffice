unit SaleTableSaleShow;

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
  cxCurrencyEdit, cxProgressBar, StrUtils, MaskUtils, Math, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleTableSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableViewFloor: TcxGridColumn;
    GridTableViewTable: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewPersonCount: TcxGridColumn;
    GridTableViewRate: TcxGridColumn;
    GridTableViewCycle: TcxGridColumn;
    GridTableView1Floor: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1Person: TcxGridColumn;
    GridTableView1Rate: TcxGridColumn;
    GridTableView1CycleCount: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableView1BuyAmt: TcxGridColumn;
    GridTableView1ProfitAmt: TcxGridColumn;
    GridTableView1ProfitRate: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
    { Public declarations }
  end;

var
  SaleTableSaleShowForm: TSaleTableSaleShowForm;

implementation

uses
  Common, DBModule;
{$R *.dfm}

{ TSaleTableSaleShowForm }
procedure TSaleTableSaleShowForm.FormCreate(Sender: TObject);
begin
  HelpURL := 'BackOffice/매출관리/테이블별%20매출조회/테이블별%20매출조회.htm';
  if GetOption(58) = '1' then
  begin
    Grid.RootLevelOptions.DetailTabsPosition := dtpNone;
    GridTableViewFloor.Visible := false;
    GridTableViewFloor.Tag     := 99;
    GridTableView.OptionsView.GroupByBox := false;
  end;
  inherited;
  PrintMode   := pmPreviewExcel;
end;

function TSaleTableSaleShowForm.DoSearch: Boolean;
var vIndex :Integer;
begin
  Result := false;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select b.NM_CODE1 as NM_FLOOR, '
             +'       a.NM_TABLE as NM_TABLE, '
             +'       Ifnull(c.AMT_SALE,0)    as AMT_SALE, '
             +'       Ifnull(c.CNT_PERSON,0)  as CNT_PERSON, '
             +'       Ifnull(c.CNT_CYCLE,0)   as CNT_CYCLE, '
             +'       Ifnull(c.AMT_BUY, 0)    as AMT_BUY, '
             +'       Ifnull(c.RATE_PROFIT,0) as RATE_PROFIT, '
             +'       Ifnull(c.AMT_PROFIT, 0) as AMT_PROFIT, '
             +'       0 as RATE '
             +'  from MS_TABLE a left outer join '
             +'       MS_CODE  b on a.CD_HEAD  = b.CD_HEAD '
             +'                 and a.CD_STORE = b.CD_STORE '
             +'                 and a.CD_FLOOR = b.CD_CODE '
             +'                 and b.CD_KIND  =''03'' left outer join '
             +'       (select NO_TABLE, '
             +'               Sum(CNT_PERSON) as CNT_PERSON, '
             +'               Sum(AMT_SALE) as AMT_SALE, '
             +'               Sum(AMT_BUY)  as AMT_BUY, '
             +'               GetProfitRate(Sum(AMT_BUY), Sum(AMT_SALE)) as RATE_PROFIT, '
             +'               Sum(AMT_SALE - AMT_BUY) as AMT_PROFIT, '
             +'               Count(*) as CNT_CYCLE '
             +'          from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
             +'         where CD_HEAD  =:P0 '
             +'           and CD_STORE =:P1 '
             +'           and YMD_SALE between :P2 and :P3 '
             +'           and DS_SALE <> ''V'' '
             +'           and NO_DELIVERY = '''' '
             +'         group by NO_TABLE '
             +'        ) c on a.NO_TABLE = c.NO_TABLE '
             +'  where a.CD_HEAD  =:P0 '
             +'    and a.CD_STORE =:P1 '
             +'    and a.SEQ = 0 '
             +'  order by a.NO_TABLE',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;

  // 점유율을 구한다(쿼리에서 구할 수 있으나 한 번 더 Sum을 하면 부하가 더 걸릴 것 같아서 수동으로 처리)
  if (GridTableView.DataController.Summary.FooterSummaryValues[3] <> null) and
     (GridTableView.DataController.Summary.FooterSummaryValues[3] <> 0) then
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] <> null then
        GridTableView.DataController.Values[vIndex, GridTableViewRate.Index] := RoundNumber(GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] * 100 / GridTableView.DataController.Summary.FooterSummaryValues[3]);

  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select b.NM_CODE1 as NM_FLOOR, '
             +'       Sum(Ifnull(c.AMT_SALE,0))    as AMT_SALE, '
             +'       Sum(Ifnull(c.CNT_PERSON,0))  as CNT_PERSON, '
             +'       Sum(Ifnull(c.CNT_CYCLE,0))   as CNT_CYCLE, '
             +'       Sum(Ifnull(c.AMT_BUY, 0))    as AMT_BUY, '
             +'       GetProfitRate(Sum(c.AMT_BUY), Sum(c.AMT_SALE)) as RATE_PROFIT, '
             +'       Sum(Ifnull(c.AMT_PROFIT, 0)) as AMT_PROFIT '
             +'   from MS_TABLE a left outer join '
             +'        MS_CODE  b on a.CD_HEAD  = b.CD_HEAD '
             +'                  and a.CD_STORE = b.CD_STORE '
             +'                  and a.CD_FLOOR = b.CD_CODE '
             +'                  and b.CD_KIND = ''03'' left outer join '
             +'        (select NO_TABLE, '
             +'                Sum(CNT_PERSON) as CNT_PERSON, '
             +'                Sum(AMT_SALE) as AMT_SALE, '
             +'                Sum(AMT_BUY)  as AMT_BUY, '
             +'                Sum(AMT_SALE - AMT_BUY) as AMT_PROFIT, '
             +'                Count(*) as CNT_CYCLE '
             +'           from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
             +'          where CD_HEAD  =:P0 '
             +'            and CD_STORE =:P1 '
             +'            and YMD_SALE between :P2 and :P3 '
             +'            and DS_SALE <> ''V'' '
             +'            and NO_DELIVERY = '''' '
             +'          group by CD_STORE, NO_TABLE '
             +'         ) c on a.NO_TABLE = c.NO_TABLE '
             +'  where a.CD_HEAD  =:P0 '
             +'    and a.CD_STORE =:P1 '
             +'    and a.SEQ = 0 '
             +'  group by a.CD_FLOOR, b.NM_CODE1 '
             +'  order by a.CD_FLOOR',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView1);

  // GridTableView1 구한다(쿼리에서 구할 수 있으나 한 번 더 Sum을 하면 부하가 더 걸릴 것 같아서 수동으로 처리)
  if (GridTableView1.DataController.Summary.FooterSummaryValues[0] <> null) and
     (GridTableView1.DataController.Summary.FooterSummaryValues[0] <> 0) then
    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
      if GridTableView1.DataController.Values[vIndex, GridTableView1SaleAmt.Index] <> null then
        GridTableView1.DataController.Values[vIndex, GridTableView1Rate.Index] := RoundNumber(Nvl(GridTableView1.DataController.Values[vIndex, GridTableView1SaleAmt.Index],0.0) / Nvl(GridTableView1.DataController.Summary.FooterSummaryValues[0],0.0) * 100);
  end
end;

procedure TSaleTableSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData, vFloor :String;
    vIndex      :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  if Grid.ActiveLevel = GridLevel then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '테이블별 매출현황'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+Common.StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  '테이블 '+rptpStr+'           매출금액   비율   회전수'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView do
    begin
      For vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        if GetOption(58) = '0' then
          vFloor := DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewFloor.Index]+'-'
        else
          vFloor := '';
        vPrintData := vPrintData + Rpad(vFloor+DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewTable.Index],15+PrintBlank,' ');

        vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),11,' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewRate.Index],7, ' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex],GridTableViewCycle.Index],9, ' ')+#13;
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계     '+rptpStr+LPad(FormatFloat('#,0',NVL(GridTableView.DataController.Summary.FooterSummaryValues[3],0)), 23,' ') + #13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  end
  else
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '층별 매출현황'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+Common.StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  '     층    '+rptpStr+'    매출금액   점유율    회전수'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView1 do
    begin
      For vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + Rpad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1Floor.Index],1,11),11+PrintBlank,' ');

        vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1SaleAmt.Index]),12,' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1Rate.Index],9, ' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex],GridTableView1CycleCount.Index],10, ' ')+#13;
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'       합   계     '+rptpStr+LPad(FormatFloat('#,0',NVL(GridTableView1.DataController.Summary.FooterSummaryValues[0],0)), 23,' ') + #13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  end;


  PrintPrinter(vPrintData);
end;

end.
