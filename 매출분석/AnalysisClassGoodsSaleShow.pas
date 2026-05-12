unit AnalysisClassGoodsSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SHDocVw, InheritShow, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxCurrencyEdit, Vcl.ExtCtrls,
  AdvSplitter, cxButtonEdit, Vcl.StdCtrls, Vcl.CheckLst, AdvPanel,
  cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus,
  Vcl.ImgList, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB,
  MemDS, cxGridLevel, cxGridCustomView, cxGrid, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils,
  MaskUtils, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisClassGoodsSaleShowForm = class(TInheritShowForm)
    GridTableViewLargeClass: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewSubClass: TcxGridColumn;
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    ClassPanel: TAdvPanel;
    ClassCheckListBox: TCheckListBox;
    ConditionToolBarButtonEdit: TcxButtonEdit;
    PosSplitter: TAdvSplitter;
    ChartPanel: TPanel;
    GridTableViewServiceAmt: TcxGridColumn;
    GridTableViewVatAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    procedure ConditionToolBarButtonEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConditionToolBarButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ClassCheckListBoxClickCheck(Sender: TObject);
    procedure ClassCheckListBoxExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
  private
    FusionChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisClassGoodsSaleShowForm: TAnalysisClassGoodsSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TAnalysisClassGoodsSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

procedure TAnalysisClassGoodsSaleShowForm.ClassCheckListBoxClickCheck(Sender: TObject);
var  vIndex: Integer;
begin
  inherited;

  // 체크한 목록을 문류 입력창에 표시한다
  ConditionToolBarButtonEdit.Text := EmptyStr;
  for vIndex := 0 to ClassCheckListBox.Items.Count-1 do
    if ClassCheckListBox.Checked[vIndex] then
      ConditionToolBarButtonEdit.Text := ConditionToolBarButtonEdit.Text + IfThen(ConditionToolBarButtonEdit.Text = EmptyStr, EmptyStr, ', ') + ClassCheckListBox.Items[vIndex];
  ConditionToolBarButtonEdit.Hint := ConditionToolBarButtonEdit.Text;

end;

procedure TAnalysisClassGoodsSaleShowForm.ClassCheckListBoxExit(Sender: TObject);
begin
  inherited;
  // 분류 목록을 벗어나면 숨긴다
  ClassPanel.Visible := (GetActiveControl = ClassCheckListBox) or (GetActiveControl = ClassPanel);
end;

procedure TAnalysisClassGoodsSaleShowForm.ConditionToolBarButtonEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
    ButtonToolBarSearchButton.Click
  else if (Key = VK_Back) or (Key = VK_Delete) then
  begin
    ClassCheckListBox.CheckAll(TCheckBoxState.cbUnchecked);
    ConditionToolBarButtonEdit.Text := EmptyStr;
    ConditionToolBarButtonEdit.Hint := EmptyStr;
  end;
end;

procedure TAnalysisClassGoodsSaleShowForm.ConditionToolBarButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  ClassPanel.BringToFront;
  ClassPanel.Visible := true;
  ClassCheckListBox.SetFocus;
end;

function TAnalysisClassGoodsSaleShowForm.DoSearch: Boolean;
var
  vCondition: string;
  vIndex    : Integer;
  vCode     : PStrPointer;
  vChartXml : String;
  iRow, iSelected : Integer;
begin
  ConditionToolBarButtonEdit.SetFocus;
  Result := false;

  // 선택한 분류 목록을 구한다
  vCondition := EmptyStr;
  if ConditionToolBarButtonEdit.Text <> EmptyStr then
  begin
    for vIndex := 0 to ClassCheckListBox.Items.Count-1 do
      if ClassCheckListBox.Checked[vIndex] then
      begin
        vCode      := PStrPointer(ClassCheckListBox.Items.Objects[vIndex]);
        vCondition := vCondition + IfThen(vCondition = EmptyStr, EmptyStr, ', ') + ''''+ vCode^.Data + '''';
      end;
    vCondition := ' and substring(g.CD_CLASS,1,2) in (' + vCondition + ')';
  end;

  OpenQuery('select d.CD_MENU as CD_GOODS, '
           +'       Max(g.NM_MENU) as NM_GOODS, '
           +'       Max(g.NM_SPEC) as NM_SPEC, '
           +'       Sum(d.QTY_SALE) as QTY_SALE, '
           +'       Sum(d.AMT_BUY)  as AMT_BUY, '
           +'       Sum(d.AMT_SERVICE)  as AMT_SERVICE, '
           +'       Sum(d.AMT_VAT)  as AMT_VAT, '
           +'       Sum(d.DC_TOT) as AMT_DC, '
           +'       Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE,'
           +'       GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
           +'       Ifnull(Max(g.NM_LARGE),''분류 미지정'') as NM_LARGE, '
           +'       Max(g.NM_MIDDLE) as NM_MIDDLE, '
           +'       Max(g.NM_SMALL)  as NM_SMALL, '
           +'       Max(g.NM_SUB)    as NM_SUB '
           +' from  SL_SALE_D_SUM as d left outer join '
           +'       (select g.CD_MENU, '
           +'               g.CD_CLASS, '
           +'               g.NM_MENU, '
           +'               g.NM_SPEC, '
           +'               Ifnull(l.NM_CLASS,''분류 미지정'') as NM_LARGE, '
           +'               m.NM_CLASS as NM_MIDDLE, '
           +'               s.NM_CLASS as NM_SMALL, '
           +'               e.NM_CLASS as NM_SUB '
           +'          from MS_MENU g left outer join '
           +'               MS_MENU_CLASS as l on g.CD_HEAD = l.CD_HEAD and g.CD_STORE = l.CD_STORE and Left(g.CD_CLASS,2) = l.CD_CLASS and Length(l.CD_CLASS)= 2 left outer join '
           +'               MS_MENU_CLASS as m on g.CD_HEAD = m.CD_HEAD and g.CD_STORE = m.CD_STORE and Left(g.CD_CLASS,4) = m.CD_CLASS and Length(m.CD_CLASS)= 4 left outer join '
           +'               MS_MENU_CLASS as s on g.CD_HEAD = s.CD_HEAD and g.CD_STORE = s.CD_STORE and Left(g.CD_CLASS,6) = s.CD_CLASS and Length(s.CD_CLASS)= 6 left outer join '
           +'               MS_MENU_CLASS as e on g.CD_HEAD = e.CD_HEAD and g.CD_STORE = e.CD_STORE and Left(g.CD_CLASS,8) = e.CD_CLASS and Length(e.CD_CLASS)= 8 '
           +'         where g.CD_HEAD  =:P0 '
           +'           and g.CD_STORE =:P1 '
           +'        ) as g on d.CD_MENU = g.CD_MENU '
           +' where d.CD_HEAD  =:P0 '
           +'   and d.CD_STORE =:P1 '
           +'   and d.YMD_SALE between :P2 and :P3 '
           + Ifthen(vCondition = EmptyStr, '', vCondition)
           +' group by d.CD_MENU '
           +' having Sum(d.QTY_SALE) <> 0 '
           +' order by 11,12,13,1 ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
  if not Result then Exit;

  GridTableView.DataController.Summary.FooterSummaryValues[3] := FormatFloat('0.00%', RoundNumber((NVL(GridTableView.DataController.Summary.FooterSummaryValues[2],0)-NVL(GridTableView.DataController.Summary.FooterSummaryValues[1],0)) / NVL(GridTableView.DataController.Summary.FooterSummaryValues[2],1) * 100, 0.01));

  //분류단계를 1단계만 사용할때
//  if GetOption(248) = '1' then
//  begin
    DM.GroupGridTable(GridTableView,
                      GridTableViewLargeClass.Index,
                      GridTableViewMenuCode.Index,
                      ' [ 소 계 ] ',
                     [GridTableViewSaleQty.Index,
                      GridTableViewBuyAmt.Index,
                      GridTableViewSaleAmt.Index,
                      GridTableViewDcAmt.Index,
                      GridTableViewServiceAmt.Index,
                      GridTableViewVatAmt.Index]);
    GridTableView.OptionsView.Footer := false;
//  end;

//    inherited;
  // 상품목록 그리드에 현재 선택한 분류에 해당하는 내용만 보여준다
  OpenQuery('select   Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
           +'         l.NM_CLASS as NM_LARGE '
           +'  from   SL_SALE_D_SUM as d inner join '
           +'         MS_MENU       as g  on d.CD_HEAD  = g.CD_HEAD '
           +'                            and d.CD_STORE = g.CD_STORE '
           +'                           and d.CD_MENU   = g.CD_MENU left outer join '
           +'         MS_MENU_CLASS as l  on g.CD_HEAD  = l.CD_HEAD '
           +'                            and g.CD_STORE = l.CD_STORE '
           +'                            and Left(g.CD_CLASS,2) = l.CD_CLASS '
           +'                            and Length(l.CD_CLASS)= 2 '
           +' where   d.CD_HEAD  =:P0 '
           +'   and   d.CD_STORE =:P1 '
           +'   and   d.YMD_SALE between :P2 and :P3 '
           + Ifthen(vCondition = EmptyStr, '', vCondition)
           +' group by l.NM_CLASS '
           +' order by l.NM_CLASS ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  // 챠트로 표시
  vChartXml := '<chart caption='''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
  while not Query.Eof do
  begin
    vChartXml := vChartXml + '<set label="'+Query.Fields[1].AsString+'" value="'+Query.Fields[0].AsString+'" />';
    Query.Next;
  end;
  Query.Close;
  vChartXml := vChartXml + '</chart>';
  ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
end;

procedure TAnalysisClassGoodsSaleShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  case StoI(GetOption(248)) of
    0 :
    begin
      GridTableViewColumn2.Tag     := 99;
      GridTableViewColumn2.Visible := false;
      GridTableViewColumn3.Tag     := 99;
      GridTableViewColumn3.Visible := false;
      GridTableViewSubClass.Tag     := 99;
      GridTableViewSubClass.Visible := false;
      GridTableViewLargeClass.Caption := '분류';
      GridTableView.OptionsView.GroupByBox := false;
    end;
    1 :
    begin
      GridTableViewColumn3.Tag     := 99;
      GridTableViewColumn3.Visible := false;
      GridTableViewSubClass.Tag     := 99;
      GridTableViewSubClass.Visible := false;
    end;
    2 :
    begin
      GridTableViewSubClass.Tag     := 99;
      GridTableViewSubClass.Visible := false;
    end;
  end;

  inherited;

  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;

 // 분류 목록을 불러온다
  OpenQuery('select  CD_CLASS, '
           +'        NM_CLASS '
           +'  from  MS_MENU_CLASS '
           +' where  CD_HEAD  =:P0 '
           +'   and  CD_STORE =:P1 '
           +'   and  Length(CD_CLASS) = 2 '
           +'order by CD_CLASS',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ClassCheckListBox.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  ConditionToolBarEditLabel.Hint := ConditionToolBarEdit.Hint;
  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;

procedure TAnalysisClassGoodsSaleShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewMenuCode.Index] = ' [ 소 계 ] ' then
    AStyle := StyleFontRed
  else if ARecord.Values[GridTableViewMenuCode.Index] = ' [ 합 계 ] ' then
    AStyle := StyleFontRedBold;

end;

procedure TAnalysisClassGoodsSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex     :Integer;
    vTemp      :String;
begin
  inherited;
  vPrintData := rptSizeBoth + rptAlignCenter + '분류별 메뉴매출내역'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'    분류/메뉴 '+rptpStr+'            수량        금액'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    vTemp := Trim(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewMenuCode.Index]);
    if NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewLargeClass.Index],'') <> '' then
    begin
      vPrintData := vPrintData + NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewLargeClass.Index],'')+#13
                               + '-'+RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewMenuName.Index],1,16+(PrintBlank div 2)),23+PrintBlank,' ')
                               + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleQty.Index], 6, ' ')
                               + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),12, ' ')+#13;
    end
    else if (Replace(vTemp,' ','') = '[소계]') or (Replace(vTemp,' ','') = '[합계]') then
      vPrintData := vPrintData + RPad('     '+vTemp,24+PrintBlank,' ')
                               + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleQty.Index], 6, ' ')
                               + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),12, ' ')+#13
    else
      vPrintData := vPrintData + '-'+RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewMenuName.Index],1,16+(PrintBlank div 2)),23+PrintBlank,' ')
                               + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleQty.Index], 6, ' ')
                               + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),12, ' ')+#13;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

end.
