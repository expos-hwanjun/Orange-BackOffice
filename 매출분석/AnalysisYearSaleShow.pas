unit AnalysisYearSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxMaskEdit, dxPSCore,
  dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxCalendar,
  AdvGlowButton, cxCurrencyEdit, DateUtils, AdvSplitter, SHDocVw;

type
  TAnalysisYearSaleShowForm = class(TInheritShowForm)
    ConditionToolBarFromYearEdit: TcxMaskEdit;
    ConditionToolBarToYearEdit: TcxMaskEdit;
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
    GridTableViewColumn12: TcxGridColumn;
    GridTableViewColumn13: TcxGridColumn;
    GridTableViewColumn14: TcxGridColumn;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FusionChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisYearSaleShowForm: TAnalysisYearSaleShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

procedure TAnalysisYearSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'YearChart', 'mscombi3d', FusionChart.Hint);
end;

function TAnalysisYearSaleShowForm.DoSearch: Boolean;
var vChart01,
    vChart02,
    vChart03,
    vChartXml      : String;
    vIndex, vCol :Integer;
    vChartData :TStringList;
begin
  OpenQuery('select Left(YMD_SALE,4) as YEAR, '
           +'       SUM(JAN_AMT) AS JAN_AMT, '
           +'       SUM(FEB_AMT) AS FEB_AMT, '
           +'       SUM(MAR_AMT) AS MAR_AMT, '
           +'       SUM(APR_AMT) AS APR_AMT, '
           +'       SUM(MAY_AMT) AS MAY_AMT, '
           +'       SUM(JUN_AMT) AS JUN_AMT, '
           +'       SUM(JUL_AMT) AS JUL_AMT, '
           +'       SUM(AUG_AMT) AS AUG_AMT, '
           +'       SUM(SEP_AMT) AS SEP_AMT, '
           +'       SUM(OCT_AMT) AS OCT_AMT, '
           +'       SUM(NOV_AMT) AS NOV_AMT, '
           +'       SUM(DEC_AMT) AS DEC_AMT, '
           +'       SUM(TOT_AMT) AS TOT_AMT '
           +'  from (select YMD_SALE,'
           +'               case when SubString(YMD_SALE,5,2) = ''01'' then AMT_SALE else 0 end as JAN_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''02'' then AMT_SALE else 0 end as FEB_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''03'' then AMT_SALE else 0 end as MAR_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''04'' then AMT_SALE else 0 end as APR_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''05'' then AMT_SALE else 0 end as MAY_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''06'' then AMT_SALE else 0 end as JUN_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''07'' then AMT_SALE else 0 end as JUL_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''08'' then AMT_SALE else 0 end as AUG_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''09'' then AMT_SALE else 0 end as SEP_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''10'' then AMT_SALE else 0 end as OCT_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''11'' then AMT_SALE else 0 end as NOV_AMT, '
           +'               case when SubString(YMD_SALE,5,2) = ''12'' then AMT_SALE else 0 end as DEC_AMT, '
           +'               AMT_SALE as TOT_AMT '
           +'          from SL_SALE_H_SUM  '
           +'         where CD_HEAD  =:P0 '
           +'           and CD_STORE =:P1 '
           +'           and YMD_SALE between :P2 and :P3 '
           +'        ) as t '
           +' group by Left(t.YMD_SALE,4) '
           +' order by 1 ',
            [HeadStoreCode,
             StoreCode,
             ConditionToolBarFromYearEdit.Text+'0101',
             ConditionToolBarToYearEdit.Text+'1231']);
  Result := DM.ReadQuery(Query, GridTableView);

  try
    vChartXml := '<chart caption=''전년대비매출(단위:천원)'' xAxisName=''월'' yAxisName=''매출금액'' showValues="1" divLineDecimalPrecision="1" limitsDecimalPrecision="1" formatNumberScale="0">';//showValues=''0'' numberprefix= ''''>';
    vChart01 := '  <categories>  ';

    vChartData := TStringList.Create;
    vChartData.Clear;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      vChartData.Add(Format('  <dataset seriesName="%s년">  ',[GridTableView.DataController.Values[vIndex, 0]]));

    for vIndex := 1 to 12 do
      vChart01 := vChart01 + Format('  <category label="%s" />  ',[GridTableView.Columns[vIndex].Caption]);
    vChart01 := vChart01 + '  </categories>  ';

    for vCol := 1 to 12 do
    begin
      for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
        vChartData.Strings[vIndex] := vChartData.Strings[vIndex] + Format('  <set value="%s" />  ',[FormatFloat('#0',GridTableView.DataController.Values[vIndex, vCol] / 1000)]);
    end;

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      vChartData.Strings[vIndex] := vChartData.Strings[vIndex] + '  </dataset>  ';

    vChartXml := vChartXml + vChart01;
      for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
        vChartXml := vChartXml + vChartData.Strings[vIndex];

    vChartXml := vChartXml + '</chart>';
    ShowChart(FusionChart, 'YearChart', 'mscombi3d', vChartXml);
  finally
    vChartData.Free;
  end;
end;

procedure TAnalysisYearSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  ConditionToolBarFromYearEdit.Text := FormatDateTime('yyyy', IncYear(Now(),-1));
  ConditionToolBarToYearEdit.Text   := FormatDateTime('yyyy', Now());

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;

procedure TAnalysisYearSaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

end.
