// 기간별 매출 조회 (완료)

unit SaleSaleShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, ExtCtrls, cxContainer, Uni,
  DB, MemDS, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton, cxCurrencyEdit,
  AdvOfficeTabSet, AdvToolBarStylers, StdCtrls, SHDocVw,
  AdvSplitter, StrUtils, cxRadioGroup, OleCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, MaskUtils, Math,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TSaleSaleShowForm = class(TInheritShowForm)
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewTotalAmt: TcxGridColumn;
    GridTableViewDCAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewVatAmt: TcxGridColumn;
    GridTableViewCustomerQty: TcxGridColumn;
    GridTableViewCustomerAmt: TcxGridColumn;
    ConditionTabSet: TAdvOfficeTabSet;
    GridTableViewDutySaleAmt: TcxGridColumn;
    GridTableViewDutyFreeSaleAmt: TcxGridColumn;
    ChartPanel: TPanel;
    PosSplitter: TAdvSplitter;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableViewServiceAmt: TcxGridColumn;
    GridTableViewTipAmt: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionTabSetChange(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
  private
    FusionChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleSaleShowForm: TSaleSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSaleSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
  isLoading   := true;
  ConditionTabSet.ActiveTabIndex := 0;
  isLoading   := false;
  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;

procedure TSaleSaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TSaleSaleShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 조건 탭을 변경할 때
procedure TSaleSaleShowForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  BlockInput(true);
  inherited;
  BlockInput(false);
end;

procedure TSaleSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

procedure TSaleSaleShowForm.ConditionTabSetChange(Sender: TObject);
begin
  inherited;
  if isLoading then Exit;
  ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSaleSaleShowForm.DoSearch:Boolean;
var
  vSelect, vWhere, vChartXml, vTemp: string;
  vIndex :Integer;
begin
//  inherited;
  case ConditionTabSet.ActiveTabIndex of
    0 : // 일별
        begin
        vSelect  := ' StoDW(h.YMD_SALE) ';
        vWhere   := ' :P2 and :P3 ';
        end;
    1 : // 요일별
        begin
        vSelect  := ' case DAYOFWEEK(Date(h.YMD_SALE)) when ''1'' then ''7.일요일'' when ''2'' then ''1.월요일'' when ''3'' then ''2.화요일'' when ''4'' then ''3.수요일'' when ''5'' then ''4.목요일'' when ''6'' then ''5.금요일'' else ''6.토요일'' end ';
        vWhere   := ' :P2 and :P3 ';
        end;
    2 : // 월별
        begin
        vSelect  := ' ConCat(Left(h.YMD_SALE,4),''-'',SubString(h.YMD_SALE,5,2),''월'') ';
        vWhere   := ' ConCat(Left(:P2,6),''01'') and ConCat(Left(:P3,6),''31'') ';
        end;
    3 : // 분기별
        begin
        vSelect  := ' case when SubString(h.YMD_SALE,5,2) between ''01'' and ''03'' then ConCat(Left(h.YMD_SALE,4),''년 1/4분기'') '
                   +'      when SubString(h.YMD_SALE,5,2) between ''04'' and ''06'' then ConCat(Left(h.YMD_SALE,4),''년 2/4분기'') '
                   +'      when SubString(h.YMD_SALE,5,2) between ''07'' and ''09'' then ConCat(Left(h.YMD_SALE,4),''년 3/4분기'') '
                   +'      else ConCat(Left(h.YMD_SALE,4),''년 4/4분기'') end ';
        vWhere   := ' ConCat(Left(:P2,4),''0101'') and ConCat(Left(:P3,4),''1231'') ';
        end;
    4 : // 반기별
        begin
        vSelect  := ' case when SubString(h.YMD_SALE,5,2) between ''01'' and ''06'' then ConCat(Left(h.YMD_SALE,4),''년 전반기'') '
                   +'      else ConCat(Left(h.YMD_SALE,4),''년 후반기'') end ';
        vWhere   := ' ConCat(Left(:P2,4),''0101'') and ConCat(Left(:P3,4),''1231'') ';
        end;
    5 : // 연별
        begin
        vSelect  := ' ConCat(Left(h.YMD_SALE,4),''년'') ';
        vWhere   := ' ConCat(Left(:P2,4),''0101'') and ConCat(Left(:P3,4),''1231'') ';
        end;
  end;

  OpenQuery('select '+vSelect+' as YMD_SALE, '
           +'         Sum(h.AMT_SALE + h.DC_TOT + h.AMT_SERVICE) as AMT_TOTAL, '
           +'         Sum(h.DC_TOT)   as DC_TOT, '
           +'         Sum(h.AMT_SERVICE) as AMT_SERVICE, '
           +'         Sum(h.AMT_SALE) as AMT_SALE, '
           +'         Sum(h.AMT_TIP) as AMT_TIP, '
           +'         Sum(h.AMT_SALE-h.AMT_TAX-h.AMT_TIP) as AMT_SOON, '
           +'         DivInt(Sum(h.AMT_SALE-h.AMT_DUTYFREE), 11)  as AMT_TAX, '
           +'         Sum(h.AMT_SALE-h.AMT_DUTYFREE) as AMT_SALE_DUTY, '
           +'         Sum(h.AMT_DUTYFREE)  as AMT_SALE_DUTYFREE, '
           +'         Sum(h.CNT_CUSTOMER) as QTY_CUST, '
           +'         case when Sum(h.CNT_CUSTOMER) = 0 then Sum(h.AMT_SALE) else Round(Sum(h.AMT_SALE) / Sum(h.CNT_CUSTOMER), 0) end as AMT_CUST, '
           +'         Sum(h.AMT_BUY)  as AMT_BUY, '
           +'         GetProfitRate(Sum(h.AMT_BUY), Sum(h.AMT_SALE)) as RATE_PROFIT, '
           +'         Sum(h.AMT_SALE - h.AMT_BUY) as AMT_PROFIT '
           +'  from   SL_SALE_H_SUM as h '
           +' where   h.CD_HEAD  =:P0 '
           +'   and   h.CD_STORE =:P1 '
           +'   and   h.YMD_SALE between '+vWhere
           +' group by h.CD_STORE, '+vSelect
           +' order by 1 ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);


  Result := DM.ReadQuery(Query, GridTableView);

  // 푸터 객단가를 구한다
  if (GridTableView.DataController.Summary.FooterSummaryValues[2] <> null) and
     (GridTableView.DataController.Summary.FooterSummaryValues[5] <> null) and
     (GridTableView.DataController.Summary.FooterSummaryValues[5] <> 0) then
    GridTableView.DataController.Summary.FooterSummaryValues[6] := FormatFloat(fmtComma, RoundNumber(GridTableView.DataController.Summary.FooterSummaryValues[2] / GridTableView.DataController.Summary.FooterSummaryValues[5]))
  else
    GridTableView.DataController.Summary.FooterSummaryValues[6] := '0';


  case ConditionTabSet.ActiveTabIndex of
    0 :
    begin
      vTemp := '일별 매출현황';
      GridTableViewSaleDate.Caption := '판매일자';
    end;
    1 :
    begin
      vTemp := '요일별 매출현황';
      GridTableViewSaleDate.Caption := '요일';
    end;
    2 :
    begin
      vTemp := '월별 매출현황';
      GridTableViewSaleDate.Caption := '월';
    end;
    3 :
    begin
      vTemp := '분기별 매출현황';
      GridTableViewSaleDate.Caption := '분기';
    end;
    4 :
    begin
      vTemp := '반기별 매출현황';
      GridTableViewSaleDate.Caption := '반기';
    end;
    5 :
    begin
      vTemp := '연별 매출현황';
      GridTableViewSaleDate.Caption := '연';
    end;
  end;

  vChartXml := '<chart caption='''+vTemp+''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
  for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
  begin
    vChartXml := vChartXml + '<set label="'+ Ifthen(ConditionTabSet.ActiveTabIndex=0, Rightstr(GridTableView.DataController.Values[vIndex,0],5), GridTableView.DataController.Values[vIndex,0])+'" value="'+FloatToStr(GridTableView.DataController.Values[vIndex,GridTableViewSaleAmt.Index])+'" />'
  end;
  vChartXml := vChartXml + '</chart>';
  ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
end;

procedure TSaleSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData  :String;
    vIndex      :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  case ConditionTabSet.ActiveTabIndex of
    0 : vPrintData := rptSizeBoth + rptAlignCenter + '일자별 매출현황'+#13;
    1 : vPrintData := rptSizeBoth + rptAlignCenter + '요일별 매출현황'+#13;
    2 : vPrintData := rptSizeBoth + rptAlignCenter + '월별 매출현황'+#13;
    3 : vPrintData := rptSizeBoth + rptAlignCenter + '분기별 매출현황'+#13;
    4 : vPrintData := rptSizeBoth + rptAlignCenter + '반기별 매출현황'+#13;
    5 : vPrintData := rptSizeBoth + rptAlignCenter + '연별 매출현황'+#13;
  end;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  '      '+LPad(GridTableViewSaleDate.Caption, 8,' ')+'          고객수    매출금액'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView do
  begin
    For vIndex := 0 to DataController.RecordCount-1 do
    begin
      vPrintData := vPrintData + rptpStr+'    '+ Rpad(DataController.Values[vIndex, GridTableViewSaleDate.Index],19,' ')
                               + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableViewCustomerQty.Index]),7,' ')
                               + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableViewSaleAmt.Index]),12,' ')+#13;
    end;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptCharBold;
  vPrintData := vPrintData +  rptpStr+'     [ 합 계 ] '+ LPad(FormatFloat('#,0',GridTableView.DataController.Summary.FooterSummaryValues[5]),15,' ')
                                                   + LPad(FormatFloat('#,0',GridTableView.DataController.Summary.FooterSummaryValues[2]), 12,' ')+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;

  PrintPrinter(vPrintData);
end;

end.
