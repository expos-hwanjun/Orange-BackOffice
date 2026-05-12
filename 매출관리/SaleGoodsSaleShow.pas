unit SaleGoodsSaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxCurrencyEdit, cxLabel, cxGridCustomTableView,
  cxGridTableView, AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer,
  Uni, DB, MemDS, ImgList, Menus, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, MaskUtils,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleGoodsSaleShowForm = class(TInheritShowForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewTotAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1PosNo: TcxGridColumn;
    GridTableView1BillNo: TcxGridColumn;
    GridTableView1ViewType: TcxGridColumn;
    GridTableView1SaleQty: TcxGridColumn;
    GridTableView1SalePrice: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableViewSoonAmt: TcxGridColumn;
    GridTableViewVatAmt: TcxGridColumn;
    GridTableView1VatAmt: TcxGridColumn;
    GridLevel2: TcxGridLevel;
    GridTableView2: TcxGridTableView;
    GridTableView2MenuCode: TcxGridColumn;
    GridTableView2MenuName: TcxGridColumn;
    GridTableView2SaleDate: TcxGridColumn;
    GridTableView2SaleQty: TcxGridColumn;
    GridTableView2TotAmt: TcxGridColumn;
    GridTableView2SaleAmt: TcxGridColumn;
    GridTableView2VatAmt: TcxGridColumn;
    GridTableView2DcAmt: TcxGridColumn;
    GridTableView2SoonAmt: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableView1SoonAmt: TcxGridColumn;
    GridTableViewMenuType: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableView2BuyAmt: TcxGridColumn;
    GridTableView2ProfitAmt: TcxGridColumn;
    GridTableView2ProfitRate: TcxGridColumn;
    GridTableViewServiceAmt: TcxGridColumn;
    GridTableView2ServiceAmt: TcxGridColumn;
    GridTableView1ServiceAmt: TcxGridColumn;
    GridTableViewDutyfreeAmt: TcxGridColumn;
    GridTableView2DutyfreeAmt: TcxGridColumn;
    GridTableView1DutyfreeAmt: TcxGridColumn;
    GridTableView1TableName: TcxGridColumn;
    GridTableView1SaleTime: TcxGridColumn;
    GridTableView1MenuCode: TcxGridColumn;
    GridTableView1MenuName: TcxGridColumn;
    GridTableViewMenuClass: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  SaleGoodsSaleShowForm: TSaleGoodsSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때

procedure TSaleGoodsSaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    Exec_Timer.Enabled := True;
  end;
end;

procedure TSaleGoodsSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  ConditionToolBarEditLabel.Hint := ConditionToolBarEdit.Hint;
end;

procedure TSaleGoodsSaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    GridLevel1.Caption := ' 일자별 판매 ';
    GridLevel2.Caption := ' 상세 판매 ';
    ButtonToolBarSearchButton.Enabled := True;
  end;
end;

procedure TSaleGoodsSaleShowForm.GridTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView2.DataController.GetFocusedRecordIndex < 0 then Exit;
  GridLevel2.Caption := GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2MenuName.Index] + ' 상세 판매 ';
  Grid.ActiveLevel   := GridLevel2;
  isSelected := true;
  DoSearch;
end;

procedure TSaleGoodsSaleShowForm.GridTableView2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView2.DataController.RecordCount = 0 then Exit;

  if (AItem <> nil) and (AItem.Index = GridTableView2SaleDate.Index) and (ARecord.Values[GridTableView2SaleDate.Index] = '[ 소계 ]') then
    AStyle := StyleFontRed;
end;

procedure TSaleGoodsSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;
  GridLevel1.Caption := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuName.Index ] + ' 일자별 판매 ';
  isSelected := true;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

function TSaleGoodsSaleShowForm.DoSearch:Boolean;
begin
  inherited;
  Result := false;
  case Grid.ActiveLevel.Index of
    0 :
    begin
      // 상품별 판매 목록
      OpenQuery('select   d.CD_MENU, '
               +'         Max(g.NM_MENU) as NM_MENU, '
               +'         Max(g.DS_MENU_TYPE) as DS_MENU_TYPE, '
               +'         Max(c.NM_CLASS) as NM_CLASS, '
               +'         Sum(d.QTY_SALE) as QTY_SALE, '
               +'         Sum(d.AMT_SALE+d.AMT_SERVICE) as AMT_TOT, '
               +'         Sum(d.AMT_SERVICE) as AMT_SERVICE, '
               +'         Sum(d.DC_TOT)   as AMT_DC, '
               +'         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'         Sum(d.AMT_VAT) as AMT_VAT, '
               +'         case when Sum(d.AMT_VAT)=0 then Sum(d.AMT_SALE - d.DC_TOT) else 0 end as AMT_DUTYFREE, '
               +'         Sum(d.AMT_SALE - d.DC_TOT - d.AMT_VAT) as AMT_SOON, '
               +'         Sum(d.AMT_BUY)  as AMT_BUY, '
               +'         GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
               +'         Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT '
               +'from     SL_SALE_D_SUM as d left outer join '
               +'         MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
               +'                           and d.CD_STORE = g.CD_STORE '
               +'                           and d.CD_MENU  = g.CD_MENU left outer join '
               +'         MS_MENU_CLASS as c on c.CD_HEAD  = g.CD_HEAD '
               +'                           and c.CD_STORE = g.CD_STORE '
               +'                           and c.CD_CLASS = left(g.CD_CLASS,2) '
               +'where    d.CD_HEAD  =:P0 '
               +'  and    d.CD_STORE =:P1 '
               +'  and    d.YMD_SALE between :P2 and :P3 '
               +'  and   (d.CD_MENU like ConCat(:P4,''%'') or g.NM_MENU like ConCat(''%'',:P4,''%'') ) '
               +'group by d.CD_STORE, d.CD_MENU '
               +'having Sum(d.QTY_SALE) <> 0 '
               +'order by d.CD_MENU',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ConditionToolBarEdit.Text]);
      DM.ReadQuery(Query, GridTableView);
      Result := GridTableView.DataController.RecordCount > 0;
    end;
    1 :
    begin
      if ConditionToolBarEdit.Text = EmptyStr then
         GridLevel1.Caption := ' 일자별 판매 ';

      OpenQuery('select d.CD_MENU, '
               +'  	    Max(g.NM_MENU) as NM_MENU, '
               +'  	    StoD(d.YMD_SALE) as YMD_SALE, '
               +'       Sum(d.QTY_SALE) as QTY_SALE, '
               +'       Sum(d.AMT_SALE+d.AMT_SERVICE) as AMT_TOT, '
               +'       Sum(d.AMT_SERVICE) as AMT_SERVICE, '
               +'       Sum(d.DC_TOT)   as AMT_DC, '
               +'       Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
               +'       Sum(d.AMT_VAT) as AMT_VAT, '
               +'       case when Sum(d.AMT_VAT)=0 then Sum(d.AMT_SALE - d.DC_TOT) else 0 end as AMT_DUTYFREE, '
               +'       Sum(d.AMT_SALE - d.DC_TOT - d.AMT_VAT) as AMT_SOON, '
               +'       Sum(d.AMT_BUY)  as AMT_BUY, '
               +'       GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE-d.DC_TOT)) as RATE_PROFIT, '
               +'       Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT '
               +'from   SL_SALE_D_SUM as d left outer join '
               +'       MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
               +'                         and d.CD_STORE = g.CD_STORE '
               +'                         and d.CD_MENU  = g.CD_MENU '
               +'where  d.CD_HEAD  =:P0 '
               +'  and  d.CD_STORE =:P1 '
               +'  and  d.YMD_SALE between :P2 and :P3 '
               +'   and (d.CD_MENU =:P4 or g.NM_MENU like ConCat(''%'',:P4,''%'')) '
               +' group by d.CD_MENU, d.YMD_SALE '
               +' having Sum(d.QTY_SALE) <> 0 ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ifthen(isSelected, NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],''), ConditionToolBarEdit.Text)]);
      Result := DM.ReadQuery(Query, GridTableView2);
      isSelected := false;
    end;
    2 :
    begin
      if not isSelected then
        GridLevel2.Caption := ' 상세 판매 ';

      // 상품별 날짜,포스,전표별 판매 목록
      OpenQuery('select   StoDW(d.YMD_SALE) as YMD_SALE, '
               +'         d.NO_POS, '
               +'         d.NO_RCP, '
               +'         case d.DS_SALE when ''B'' then ''반품'' when ''S'' then ''판매'' when ''V'' then ''취소''  end as DS_SALE, '
               +'         d.QTY_SALE, '
               +'         case when g.DS_MENU_TYPE = ''W'' then DivFlt(d.AMT_SALE, DivFlt(d.QTY_SALE,100)) else d.PR_SALE end as PR_SALE, '
               +'         d.AMT_SALE + (d.QTY_SALE * d.PR_SERVICE) as AMT_TOT, '
               +'         case when g.DS_MENU_TYPE = ''W'' then d.PR_SERVICE else d.QTY_SALE * d.PR_SERVICE end as AMT_SERVICE, '
               +'         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
               +'         d.AMT_VAT, '
               +'         case when d.AMT_VAT=0 then d.AMT_SALE - d.DC_TOT else 0 end as AMT_DUTYFREE, '
               +'         d.DC_TOT as AMT_DC, '
               +'         d.AMT_SALE - d.DC_TOT - d.AMT_VAT as AMT_SOON, '
               +'         g.CD_MENU, '
               +'         g.NM_MENU, '
               +'         case when (h.NO_TABLE = 0) and (h.NO_DELIVERY = '''') then ''선불판매'' else t.NM_TABLE end as NM_TABLE, '
               +'         h.DT_SALE '
               +'   from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
               +'         MS_MENU   as g on d.CD_HEAD  = g.CD_HEAD '
               +'                       and d.CD_STORE = g.CD_STORE '
               +'                       and d.CD_MENU  = g.CD_MENU inner join '
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
               +'                        on d.CD_HEAD  = h.CD_HEAD '
               +'                       and d.CD_STORE = h.CD_STORE '
               +'                       and d.YMD_SALE = h.YMD_SALE '
               +'                       and d.NO_POS = h.NO_POS '
               +'                       and d.NO_RCP = h.NO_RCP left outer join '
               +'         MS_TABLE  as t on h.CD_HEAD  = t.CD_HEAD '
               +'                       and h.CD_STORE = t.CD_STORE '
               +'                       and h.NO_TABLE = t.NO_TABLE '
               +'where  d.CD_HEAD  =:P0 '
               +'  and  d.CD_STORE =:P1 '
               +'  and  d.YMD_SALE between :P2 and :P3 '
               +'  and (d.CD_MENU =:P4 or g.NM_MENU like ConCat(''%'',:P4,''%'')) '
               +'  and    d.DS_SALE <> ''V'' '
               +'order by d.YMD_SALE, d.NO_POS, d.NO_RCP',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ifthen(isSelected,NVL(GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2MenuCode.Index],''), ConditionToolBarEdit.Text)]);
      Result := DM.ReadQuery(Query, GridTableView1);
      isSelected := false;
    end;
  end;
end;

procedure TSaleGoodsSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  DoSearch;
end;

procedure TSaleGoodsSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
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
  vPrintData := rptSizeBoth + rptAlignCenter + '메뉴별 매출내역'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'    메뉴명 '+rptpStr+'               수량        금액'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    if DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewMenuType.Index] <> 'W' then
    begin
      vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewMenuName.Index] ,1,16+(PrintBlank div 2)),24+PrintBlank,' ')
                             + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleQty.Index], 6, ' ')
                             + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),12, ' ')+#13;
    end
    else
    begin
      vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewMenuName.Index] ,1,16+(PrintBlank div 2)),21+PrintBlank,' ')
                             + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleQty.Index], 9, ' ')
                             + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),12, ' ')+#13;
    end;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptCharBold;
  vPrintData := vPrintData +  rptpStr+'      합   계    '+rptpStr+ LPad(FormatFloat('#,0',GridTableView.DataController.Summary.FooterSummaryValues[1]),25,' ')+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

end.
