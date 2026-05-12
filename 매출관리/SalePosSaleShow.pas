unit SalePosSaleShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxGridBandedTableView, cxCurrencyEdit, cxProgressBar, StrUtils,
  SHDocVw, Math, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, AdvSplitter;

type
  TSalePosSaleShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewSaleDate: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);

  private
    PosList      : TStringList;
    FusionChart: TWebBrowser;
    procedure SetColums;
  protected
    function DoSearch:Boolean; override;
  end;

var
  SalePosSaleShowForm: TSalePosSaleShowForm;

implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSalePosSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매출관리/포스별%20매출조회/포스별%20매출조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TSalePosSaleShowForm.FormDestroy(Sender: TObject);
begin
  PosList.Free;
  FusionChart.Free;
  inherited;
end;

procedure TSalePosSaleShowForm.SetColums;
var
  vColumn: TcxGridBandedColumn;
  vIndex : Integer;
begin
  for vIndex := GridBandedTableView.ColumnCount-1 downto 2 do
    GridBandedTableView.Columns[vIndex].Destroy;

  for vIndex := GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1  downto 1 do
    GridBandedTableView.DataController.Summary.FooterSummaryItems[vIndex].Destroy;

  for vIndex := GridBandedTableView.Bands.Count-1 downto 1 do
    GridBandedTableView.Bands.Delete(vIndex);

  // 매장 목록을 불러온다
  PosList        := TStringList.Create;
  OpenQuery('select   CD_CODE, '
           +'         NM_CODE1 '
           +'  from   MS_CODE '
           +'  where  CD_HEAD  =:P0 '
           +'    and  CD_STORE =:P1 '
           +'    and  CD_KIND  =''01'' '
           +'    and  NM_CODE3 in (''0'',''2'') '
           +'  order by CD_CODE ',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      PosList.Add(Query.Fields[1].AsString);
      GridBandedTableView.Bands.Add;
      GridBandedTableView.Bands[GridBandedTableView.Bands.Count-1].Caption := Query.Fields[1].AsString;

      // 판매금액
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewSaleAmt.Caption;
        DataBinding.FieldName     := GridBandedTableViewSaleAmt.DataBinding.FieldName+Query.Fields[1].AsString;
        DataBinding.ValueType     := GridBandedTableViewSaleAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewSaleAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewSaleAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewSaleAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewSaleAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewSaleAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewSaleAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := 0;
        Position.RowIndex         := GridBandedTableViewSaleAmt.Position.RowIndex;
        Tag                       := 98;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[0].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[0].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      // 고객수
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := '고객수';
        DataBinding.FieldName     := 'CNT_CUST'+Query.Fields[1].AsString;
        DataBinding.ValueType     := GridBandedTableViewSaleAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewSaleAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewSaleAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewSaleAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewSaleAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewSaleAmt.HeaderAlignmentHorz;
        Width                     := 50;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := 1;
        Position.RowIndex         := GridBandedTableViewSaleAmt.Position.RowIndex;
        Tag                       := 98;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[0].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[0].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      // 점유율
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := '점유율';
        DataBinding.FieldName     := 'RT_'+Query.Fields[1].AsString;
        DataBinding.ValueType     := 'Integer';
        PropertiesClassName       := 'TcxProgressBarProperties';
        TcxCustomProgressBarProperties(Properties).BarStyle       := cxbsGradient;
        TcxCustomProgressBarProperties(Properties).BeginColor     := clSkyBlue;
        TcxCustomProgressBarProperties(Properties).EndColor       := clBlue;
        TcxCustomProgressBarProperties(Properties).SolidTextColor := true;
        FooterAlignmentHorz       := taCenter;
        HeaderAlignmentHorz       := GridBandedTableViewSaleDate.HeaderAlignmentHorz;
        Width                     := 55;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := 2;
        Position.RowIndex         := GridBandedTableViewSaleAmt.Position.RowIndex;
        Tag                       := 98;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := '0%';
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;

end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
procedure TSalePosSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

function TSalePosSaleShowForm.DoSearch: Boolean;
var
  vPos: string;
  vIndex, vIndex2: Integer;
  vChartXml :String;
begin
//inherited;
  SetColums;

  vPos := EmptyStr;
  for vIndex := 0 to PosList.Count-1 do
  begin
    vPos := vPos + Format(', Sum(case when NO_POS = ''%s'' then AMT_SALE   else 0 end) as %s%s ', [PosList[vIndex], GridBandedTableViewSaleAmt.DataBinding.FieldName, PosList[vIndex]]);
    vPos := vPos + Format(', Sum(case when NO_POS = ''%s'' then CNT_PERSON else 0 end) as %s%s ', [PosList[vIndex], 'CNT_CUST', PosList[vIndex]]);
  end;

  OpenQuery('select   StoDW(YMD_SALE) as YMD_SALE, '
           +'         Sum(AMT_SALE) as AMT_SALE '
           +vPos
           +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
           +' where    CD_HEAD  =:P0 '
           +'   and    CD_STORE =:P1 '
           +'   and    YMD_SALE between :P2 and :P3 '
           +'   and    DS_SALE <> ''V'' '
           +' group by YMD_SALE '
           +' order by YMD_SALE',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  DM.ReadQuery(Query, GridBandedTableView);
  Result := GridBandedTableView.DataController.RecordCount > 0;

  // 점유율을 구한다(쿼리에서 구할 수 있으나 한 번 더 Sum을 하면 부하가 더 걸릴 것 같아서 수동으로 처리)
  for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
    if (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index] <> null) and
       (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index] <> 0) then
    begin
      vIndex2 := 2;
      while vIndex2 < GridBandedTableView.ColumnCount-1 do
      begin
        GridBandedTableView.DataController.Values[vIndex, vIndex2+2] := RoundNumber(GridBandedTableView.DataController.Values[vIndex, vIndex2] * 100 / GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index]);
        Inc(vIndex2, 3);
      end;
    end;

  // 푸터 점유율을 구한다
  if (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> null) and
     (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> 0) then
  begin
    vIndex2 := 1;
    while vIndex2 < GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1 do
    begin
      GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex2+2] := RoundNumber(Nvl(GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex2],0.0) * 100 / GridBandedTableView.DataController.Summary.FooterSummaryValues[0]);
      Inc(vIndex2, 3);
    end;
  end;

  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  vIndex2 := 1;
  for vIndex := 1 to GridBandedTableView.Bands.Count-1 do
  begin
    vChartXml := vChartXml + '<set label="'+GridBandedTableView.Bands.Items[vIndex].Caption+'" value="'+FloatToStr(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex2],0.0))+'" />';
    vIndex2 := vIndex2 + 3;
  end;
  vChartXml := vChartXml + '</chart>';
  ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
end;

end.
