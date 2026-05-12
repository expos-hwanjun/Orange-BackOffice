unit HeadYearSaleShow;

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
  AdvGlowButton, cxCurrencyEdit, DateUtils, Math, StrUtils, SHDocVw, AdvSplitter;

type
  THeadYearSaleShowForm = class(TInheritShowForm)
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
    cxLabel2: TcxLabel;
    StoreComboBox: TcxComboBox;
    cxLabel1: TcxLabel;
    SaleZoneComboBox: TcxComboBox;
    PosSplitter: TAdvSplitter;
    ChartPanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure StoreComboBoxPropertiesChange(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FusionChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadYearSaleShowForm: THeadYearSaleShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}
procedure THeadYearSaleShowForm.FormCreate(Sender: TObject);
var
  vCode  :PStrPointer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  ConditionToolBarFromYearEdit.Text := FormatDateTime('yyyy', IncYear(Now(),-1));
  ConditionToolBarToYearEdit.Text   := FormatDateTime('yyyy', Now());

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;


  OpenQuery('select CD_STORE,  '
           +'       NM_STORE_SHORT '
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

end;
procedure THeadYearSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'YearChart', 'mscombi3d', FusionChart.Hint);
end;

function THeadYearSaleShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vDestStoreCode  :String;
    vChart01,
    vChart02,
    vChart03,
    vChartXml      : String;
    vCol :Integer;
    vChartData :TStringList;
begin
  SetWorkStoreList;

  if GetStrPointerData(StoreComboBox) = '' then
  begin
    for vIndex := 1 to WorkStoreList.Count-1 do
      vDestStoreCode := vDestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);

    if vDestStoreCode = '' then Exit;
    vDestStoreCode := Format(' in (%s) ',[LeftStr(vDestStoreCode, Length(vDestStoreCode)-1)]);
  end
  else
    vDestStoreCode := Format(' = ''%s'' ',[GetStrPointerData(StoreComboBox)]);

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
           +'               case when SubString(a.YMD_SALE,5,2) = ''01'' then a.AMT_SALE else 0 end as JAN_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''02'' then a.AMT_SALE else 0 end as FEB_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''03'' then a.AMT_SALE else 0 end as MAR_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''04'' then a.AMT_SALE else 0 end as APR_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''05'' then a.AMT_SALE else 0 end as MAY_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''06'' then a.AMT_SALE else 0 end as JUN_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''07'' then a.AMT_SALE else 0 end as JUL_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''08'' then a.AMT_SALE else 0 end as AUG_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''09'' then a.AMT_SALE else 0 end as SEP_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''10'' then a.AMT_SALE else 0 end as OCT_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''11'' then a.AMT_SALE else 0 end as NOV_AMT, '
           +'               case when SubString(a.YMD_SALE,5,2) = ''12'' then a.AMT_SALE else 0 end as DEC_AMT, '
           +'               a.AMT_SALE as TOT_AMT '
           +'          from SL_SALE_H_SUM a inner join '
           +'               MS_STORE      b on b.CD_HEAD  = a.CD_HEAD '
           +'                              and b.CD_STORE = a.CD_STORE '
           +'         where a.CD_HEAD  =:P0 '
           +'           and a.CD_STORE '+vDestStoreCode
           +'           and a.YMD_SALE between :P1 and :P2 '
           +Ifthen(GetStrPointerData(ConditionToolBarComboBox)='','',Format(' and b.CD_LOCAL = ''%s'' ',[GetStrPointerData(ConditionToolBarComboBox)]))
           +Ifthen(GetStrPointerData(SaleZoneComboBox)='','',Format(' and b.CD_SALEZONE = ''%s'' ',[GetStrPointerData(SaleZoneComboBox)]))
           +'        ) as t '
           +' group by Left(t.YMD_SALE,4) '
           +' order by 1 ',
            [HeadStoreCode,
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



procedure THeadYearSaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure THeadYearSaleShowForm.StoreComboBoxPropertiesChange(
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

end.
