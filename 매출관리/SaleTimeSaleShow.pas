// 시간대별 매출 조회 (완료)

unit SaleTimeSaleShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, ExtCtrls, cxContainer, Uni,
  DB, MemDS, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton, cxCurrencyEdit,
  cxProgressBar, cxGridBandedTableView, AdvToolBarStylers, AdvSplitter,
  StdCtrls, cxRadioGroup, OleCtrls, SHDocVw,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, StrUtils,
  MaskUtils, Math, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TSaleTimeSaleShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewTimeZone: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewCustomerCnt: TcxGridBandedColumn;
    GridBandedTableViewCustomerAmt: TcxGridBandedColumn;
    GridBandedTableViewRate: TcxGridBandedColumn;
    PosSplitter: TAdvSplitter;
    ChartPanel: TPanel;
    GridBandedTableViewSumSaleAmt: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);

  private
    PosList: TStringList;
    FusionChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleTimeSaleShowForm: TSaleTimeSaleShowForm;

implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSaleTimeSaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    Exec_Timer.Enabled := true;
  end;
end;

procedure TSaleTimeSaleShowForm.FormCreate(Sender: TObject);
var
  vColumn: TcxGridBandedColumn;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 공통코드에 등록된 POS를 그리드에 추가한다
  PosList := TStringList.Create;
  OpenQuery('select  NM_CODE1 as NO_POS, '
           +'        ConCat(NM_CODE4,''('',NM_CODE1,'')'') as NM_POS '
           +'  from  MS_CODE '
           +' where  CD_HEAD   = :P0 '
           +'   and  CD_STORE  = :P1 '
           +'   and  CD_KIND   = ''01'' '
           +'   and  DS_STATUS = ''0'' '
           +'   and  NM_CODE3 in (''0'',''2'',''7'') '
           +'  order by CD_KIND, CD_CODE',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      PosList.Add(Query.Fields[0].AsString);

      GridBandedTableView.Bands.Add;
      GridBandedTableView.Bands[GridBandedTableView.Bands.Count-1].Caption := Query.Fields[1].AsString;
      // 금액
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewSaleAmt.Caption;
        DataBinding.FieldName     := 'AMT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewSaleAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewSaleAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewSaleAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewSaleAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewSaleAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewSaleAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewSaleAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewSaleAmt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewSaleAmt.Position.RowIndex;
        Tag                       := 98;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[0].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[0].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 객수
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewCustomerCnt.Caption;
        DataBinding.FieldName     := 'CNT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewCustomerCnt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewCustomerCnt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewCustomerCnt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewCustomerCnt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewCustomerCnt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewCustomerCnt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewCustomerCnt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewCustomerCnt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewCustomerCnt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSaleTimeSaleShowForm.FormShow(Sender: TObject);
begin
  inherited;
//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TSaleTimeSaleShowForm.FormDestroy(Sender: TObject);
begin
  PosList.Free;
  FusionChart.Free;
  inherited;
end;

procedure TSaleTimeSaleShowForm.FormResize(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TSaleTimeSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

procedure TSaleTimeSaleShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSaleTimeSaleShowForm.DoSearch:Boolean;
var
  vSQL      : string;
  vIndex    : Integer;
  vChartXml : String;
  vSumAmt   : Currency;
begin
//  inherited;

  vSQL := EmptyStr;
  for vIndex := 0 to PosList.Count-1 do
    if PosList[vIndex] <> EmptyStr then
      vSQL := vSQL
            +'Sum(case when s.NO_POS = '''+PosList[vIndex]+''' then s.AMT_SALE else 0 end) as AMT_'+PosList[vIndex]+', '
            +'Sum(case when s.NO_POS = '''+PosList[vIndex]+''' then s.CNT_CUST else 0 end) as CNT_'+PosList[vIndex]+', ';

  OpenQuery('select   Max(c.NM_CODE1) as TIME_ZONE, '
           +'         Ifnull(Sum(s.AMT_SALE),0) as AMT_SALE, '
           +'         Ifnull(Sum(s.CNT_CUST),0) as CNT_CUST, '
           +'         case when Ifnull(Sum(s.CNT_CUST),0) = 0 then 0 else Round(Sum(s.AMT_SALE) / Sum(s.CNT_CUST), 0) end as AMT_CUST, '
           +vSQL
           +'         0 as RATE '
           +'from     MS_CODE as c left outer join '
           +'        (select   h.NO_POS, '
           +'                  h.CD_TIME as CD_CODE, '
           +'                  Sum(h.AMT_SALE) as AMT_SALE, '
           +'                  Sum(h.CNT_PERSON) as CNT_CUST '
           +'         from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
           +'         where    h.CD_HEAD  =:P0 '
           +'           and    h.CD_STORE =:P1 '
           +'           and    h.YMD_SALE between :P2 and :P3 '
           +'           and    h.DS_SALE <> ''V'' '
           +'         group by h.NO_POS, h.CD_TIME) as s on c.CD_CODE = s.CD_CODE '
           +'where    c.CD_HEAD   = :P0 '
           +'  and    c.CD_STORE  = :P1 '
           +'  and    c.CD_KIND   = ''15'' '
           +'  and    c.DS_STATUS = ''0'' '
           +'group by c.CD_CODE '
           +'order by c.CD_CODE ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  DM.ReadQuery(Query, GridBandedTableView);
  Result := GridBandedTableView.DataController.RecordCount > 0;

  vSumAmt := 0;

  GridBandedTableView.DataController.BeginUpdate;
  for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
  begin
    vSumAmt := vSumAmt + GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index];
    if (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index] > 0) and (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCustomerCnt.Index] > 0) then
      GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSumSaleAmt.Index] := vSumAmt
    else
      GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSumSaleAmt.Index] := 0;
  end;
  GridBandedTableView.DataController.EndUpdate;

  // 점유율을 구한다(쿼리에서 구할 수 있으나 한 번 더 Sum을 하면 부하가 더 걸릴 것 같아서 수동으로 처리)
  if (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> null) and
     (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> 0) then
    for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
      if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index] <> null then
        GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRate.Index] := RoundNumber(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index] * 100 / GridBandedTableView.DataController.Summary.FooterSummaryValues[0]);

  // 푸터 객단가를 구한다
  if (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> null) and
     (GridBandedTableView.DataController.Summary.FooterSummaryValues[1] <> null) and
     (GridBandedTableView.DataController.Summary.FooterSummaryValues[1] <> 0) then
    GridBandedTableView.DataController.Summary.FooterSummaryValues[2] := FormatFloat(fmtComma, RoundNumber(GridBandedTableView.DataController.Summary.FooterSummaryValues[0] / GridBandedTableView.DataController.Summary.FooterSummaryValues[1]))
  else
    GridBandedTableView.DataController.Summary.FooterSummaryValues[2] := '0';


  // 챠트로 표시
  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
  for vIndex := 0 to GridBandedTableView.DataController.RecordCount - 1 do
  begin
    vChartXml := vChartXml + '<set label="'+GridBandedTableView.DataController.Values[vIndex,0]+'" value="'+FloatToStr(GridBandedTableView.DataController.Values[vIndex,1])+'" />'
  end;
  vChartXml := vChartXml + '</chart>';
  ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
end;

procedure TSaleTimeSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  DoSearch;
end;

procedure TSaleTimeSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  vPrintData := rptSizeBoth + rptAlignCenter + '시간대별 매출현황'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  '      시 간 대          고객수    매출금액'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridBandedTableView do
  begin
    For vIndex := 0 to DataController.RecordCount-1 do
    begin
      vPrintData := vPrintData + rptpStr+'    '+ Rpad(DataController.Values[vIndex, GridBandedTableViewTimeZone.Index],19,' ')
                               + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridBandedTableViewCustomerCnt.Index]),7,' ')
                               + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index]),12,' ')+#13;
    end;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptCharBold;
  vPrintData := vPrintData +  rptpStr+'      합   계     '+ LPad(FormatFloat('#,0',NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[1],0)), 12,' ')
                                                          + LPad(FormatFloat('#,0',NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[0],0)), 11,' ')+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;

  PrintPrinter(vPrintData);
end;

end.
