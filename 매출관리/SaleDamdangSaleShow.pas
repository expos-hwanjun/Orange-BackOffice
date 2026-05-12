unit SaleDamdangSaleShow;

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
  dxPScxExtEditorProducers, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils,
  MaskUtils, Math, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TSaleDamdangSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView2: TcxGridTableView;
    GridTableViewDamdang: TcxGridColumn;
    GridTableViewTotAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewTrustAmt: TcxGridColumn;
    GridTableViewGiftAmt: TcxGridColumn;
    GridTableViewEtcAmt: TcxGridColumn;
    GridTableViewPersonCount: TcxGridColumn;
    GridTableViewServiceAmt: TcxGridColumn;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1CashAmt: TcxGridColumn;
    GridTableView1CardAmt: TcxGridColumn;
    GridTableView1TrustAmt: TcxGridColumn;
    GridTableView1GiftAmt: TcxGridColumn;
    GridTableView1EtcAmt: TcxGridColumn;
    GridTableView1PersonCount: TcxGridColumn;
    GridTableView1ServiceAmt: TcxGridColumn;
    GridTableView2MenuCode: TcxGridColumn;
    GridTableView2MenuName: TcxGridColumn;
    GridTableView2SaleQty: TcxGridColumn;
    GridTableView2SalePrice: TcxGridColumn;
    GridTableView2SaleAmt: TcxGridColumn;
    GridTableView2DcAmt: TcxGridColumn;
    GridTableViewCustType: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableView1BuyAmt: TcxGridColumn;
    GridTableView1ProfitAmt: TcxGridColumn;
    GridTableView1ProfitRate: TcxGridColumn;
    GridTableView2BuyAmt: TcxGridColumn;
    GridTableView2ProfitAmt: TcxGridColumn;
    GridTableView2ProfitRate: TcxGridColumn;
    GridTableViewBankAmt: TcxGridColumn;
    GridTableView1BankAmt: TcxGridColumn;
    GridTableViewPointAmt: TcxGridColumn;
    GridTableView1PointAmt: TcxGridColumn;
    GridTableView2Damdang: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure GridTableView2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    isSelect :Boolean;
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleDamdangSaleShowForm: TSaleDamdangSaleShowForm;

implementation
uses
  Common, DBModule;
{$R *.dfm}

{ TSaleDamdangSaleShowForm }
procedure TSaleDamdangSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
  isSelect    := false;
end;


procedure TSaleDamdangSaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel2;
  isSelect         := true;
  DoSearch;
  isSelect         := false;
end;

procedure TSaleDamdangSaleShowForm.GridTableView2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableView2Damdang.Index] = ' [ 소 계 ] ' then
    AStyle := StyleFontRed
  else if ARecord.Values[GridTableView2Damdang.Index] = ' [ 합 계 ] ' then
    AStyle := StyleFontRedBold;

end;

procedure TSaleDamdangSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;


function TSaleDamdangSaleShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select ConCat(a.CD_DAMDANG,''-'',Ifnull(b.NM_SAWON,'''')) as NM_DAMDANG, '
             +'       Sum(a.AMT_SALE+a.DC_TOT+a.AMT_SERVICE) as AMT_TOT, '
             +'       Sum(a.DC_TOT) as AMT_DC, '
             +'       Sum(a.AMT_SERVICE) as AMT_SERVICE, '
             +'       Sum(a.AMT_SALE) as AMT_SALE, '
             +'       Sum(a.AMT_CASH+a.AMT_CHECK) as AMT_CASH, '
             +'       Sum(a.AMT_CARD)  as AMT_CARD, '
             +'       Sum(a.AMT_TRUST) as AMT_TRUST, '
             +'       Sum(a.AMT_GIFT)  as AMT_GIFT, '
             +'       Sum(a.AMT_BANK)  as AMT_BANK, '
             +'       Sum(a.AMT_POINT)  as AMT_POINT, '
             +'       sum(a.AMT_SALE-a.AMT_CASH-a.AMT_CHECK-a.AMT_CARD-a.AMT_GIFT-a.AMT_BANK-a.AMT_POINT) as AMT_ETC, '
             +'       Sum(a.CNT_PERSON) as CNT_PERSON, '
             +'       Sum(a.AMT_BUY)  as AMT_BUY, '
             +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE)) as RATE_PROFIT, '
             +'       Sum(a.AMT_SALE - a.AMT_BUY) as AMT_PROFIT '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'       MS_SAWON  b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_DAMDANG = b.CD_SAWON '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'   and a.DS_SALE <> ''V'' '
             +'   and Ifnull(a.CD_DAMDANG,'''') <> '''' '
             +' group by a.CD_STORE, a.CD_DAMDANG, b.NM_SAWON '
             +' order by a.CD_DAMDANG ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    if GridTableView.DataController.RecordCount = 0 then
    begin
      Grid.ActiveLevel := GridLevel;
      DoSearch;
      Exit;
    end;

    if GridTableView.DataController.GetFocusedRecordIndex < 0 then
    begin
      MsgBox('담당자를 선택하세요');
      Grid.ActiveLevel := GridLevel;
      Exit;
    end;

    OpenQuery('select StoD(YMD_SALE) as YMD_SALE, '
             +'       Sum(AMT_SALE+DC_TOT+AMT_SERVICE) as AMT_TOT, '
             +'       Sum(DC_TOT) as AMT_DC, '
             +'       Sum(AMT_SERVICE) as AMT_SERVICE, '
             +'       Sum(AMT_SALE) as AMT_SALE, '
             +'       Sum(AMT_CASH+AMT_CHECK) as AMT_CASH, '
             +'       Sum(AMT_CARD)  as AMT_CARD, '
             +'       Sum(AMT_TRUST) as AMT_TRUST, '
             +'       Sum(AMT_GIFT)  as AMT_GIFT, '
             +'       Sum(AMT_BANK)  as AMT_BANK, '
             +'       Sum(AMT_POINT)  as AMT_POINT, '
             +'       sum(AMT_SALE-AMT_CASH-AMT_CHECK-AMT_CARD-AMT_GIFT-AMT_BANK-AMT_POINT) as AMT_ETC, '
             +'       Sum(CNT_PERSON) as CNT_PERSON, '
             +'       Sum(AMT_BUY)  as AMT_BUY, '
             +'       GetProfitRate(Sum(AMT_BUY), Sum(AMT_SALE)) as RATE_PROFIT, '
             +'       Sum(AMT_SALE - AMT_BUY) as AMT_PROFIT '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_SALE between :P2 and :P3 '
             +'   and CD_DAMDANG = :P4 '
             +'   and DS_SALE <> ''V'' '
             +' group by YMD_SALE '
             +' order by YMD_SALE ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               LeftStr(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDamdang.Index],6)]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    if isSelect then
    begin
      if GridTableView1.DataController.RecordCount = 0 then
      begin
        Grid.ActiveLevel := GridLevel1;
        DoSearch;
        Exit;
      end;

      if GridTableView.DataController.GetFocusedRecordIndex < 0 then
      begin
        MsgBox('담당자를 선택하세요');
        Grid.ActiveLevel := GridLevel;
        Exit;
      end;

      if GridTableView1.DataController.GetFocusedRecordIndex < 0 then
      begin
        MsgBox('일자를 선택하세요');
        Grid.ActiveLevel := GridLevel1;
        Exit;
      end;

      GridTableView2Damdang.Visible := false;
      OpenQuery('select a.CD_MENU, '
               +'       Max(c.NM_MENU) as NM_MENU, '
               +'       a.PR_SALE, '
               +'       Sum(a.QTY_SALE) as QTY_SALE, '
               +'       Sum(a.AMT_SALE-a.DC_TOT) as AMT_SALE, '
               +'       Sum(a.DC_TOT) as AMT_DC, '
               +'       Sum(a.AMT_BUY)  as AMT_BUY, '
               +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE-a.DC_TOT)) as RATE_PROFIT, '
               +'       Sum(a.AMT_SALE - a.DC_TOT - a.AMT_BUY) as AMT_PROFIT '
               +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'b')
               +'                   on a.CD_HEAD  = b.CD_HEAD '
               +'                  and a.CD_STORE = b.CD_STORE '
               +'                  and a.YMD_SALE = b.YMD_SALE '
               +'                  and a.NO_POS   = b.NO_POS '
               +'                  and a.NO_RCP   = b.NO_RCP '
               +'                  and b.DS_SALE <> ''V'' left outer join '
               +'       MS_MENU   c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_MENU  = c.CD_MENU '
               +' where a.CD_HEAD    =:P0 '
               +'   and a.CD_STORE   =:P1 '
               +'   and a.YMD_SALE   =:P2 '
               +'   and b.CD_DAMDANG =:P3 '
               +' group by a.CD_MENU, a.PR_SALE '
               +' order by a.CD_MENU',
                [HeadStoreCode,
                 StoreCode,
                 GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index]),
                 LeftStr(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDamdang.Index],6)]);
      DM.ReadQuery(Query, GridTableView2);
      GridTableView2.OptionsView.Footer := true;
    end
    else
    begin
      GridTableView2Damdang.Visible := true;
      OpenQuery('select d.NM_SAWON, '
               +'       a.CD_MENU, '
               +'       Max(c.NM_MENU) as NM_MENU, '
               +'       a.PR_SALE, '
               +'       Sum(a.QTY_SALE) as QTY_SALE, '
               +'       Sum(a.AMT_SALE-a.DC_TOT) as AMT_SALE, '
               +'       Sum(a.DC_TOT) as AMT_DC, '
               +'       Sum(a.AMT_BUY)  as AMT_BUY, '
               +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE-a.DC_TOT)) as RATE_PROFIT, '
               +'       Sum(a.AMT_SALE - a.DC_TOT - a.AMT_BUY) as AMT_PROFIT '
               +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'b')
               +'                   on a.CD_HEAD  = b.CD_HEAD '
               +'                  and a.CD_STORE = b.CD_STORE '
               +'                  and a.YMD_SALE = b.YMD_SALE '
               +'                  and a.NO_POS   = b.NO_POS '
               +'                  and a.NO_RCP   = b.NO_RCP '
               +'                  and b.DS_SALE <> ''V'' left outer join '
               +'       MS_MENU   c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_MENU  = c.CD_MENU inner join '
               +'       MS_SAWON  d on a.CD_HEAD = d.CD_HEAD and d.CD_STORE = b.CD_STORE and d.CD_SAWON = b.CD_DAMDANG '
               +' where a.CD_HEAD    =:P0 '
               +'   and a.CD_STORE   =:P1 '
               +'   and a.YMD_SALE   between :P2 and :P3 '
               +' group by d.NM_SAWON, a.CD_MENU, a.PR_SALE '
               +' order by d.NM_SAWON, a.CD_MENU',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

      DM.ReadQuery(Query, GridTableView2);
      DM.GroupGridTable(GridTableView2,
                        GridTableView2Damdang.Index,
                        GridTableView2Damdang.Index,
                        ' [ 소 계 ] ',
                       [GridTableView2SaleAmt.Index,
                        GridTableView2DcAmt.Index,
                        GridTableView2BuyAmt.Index,
                        GridTableView2ProfitAmt.Index]);
      GridTableView2.OptionsView.Footer := false;

    end;

    Result := GridTableView2.DataController.RecordCount > 0;
  end;
end;

procedure TSaleDamdangSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex, vTotAmt      :Integer;
begin
  inherited;
  vTotAmt := 0;
  if GridLevel.Active then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '담당자별 매출현황'+#13;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData + rptAlignCenter + '(기간별)'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    담당자         고 객 수       매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView do
    begin
      For vIndex := 0 to DataController.FilteredRecordCount -1 do
      begin
        vPrintData := vPrintData + rptpStr+Rpad(Copy(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewDamdang.Index],8, 16) ,16,' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewPersonCount.Index],11,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),15,' ')+#13;

        vTotAmt := vTotAmt + DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index];
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계     '+ LPad(FormatFloat('#,0',vTotAmt), 24,' ') + #13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  end
  else if GridLevel1.Active then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '담당자별 매출현황'+#13;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  rptAlignCenter + '(일자별)'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    담당자         매출일자       매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView1 do
    begin
      For vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + rptpStr+Rpad(Copy(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDamdang.Index],8, 16),28,' ')
                                 + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1SaleDate.Index],11,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1SaleAmt.Index]),12,' ')+#13;

        vTotAmt := vTotAmt + DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1SaleAmt.Index];
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계     '+ LPad(FormatFloat('#,0',vTotAmt), 24,' ') + #13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  end
  //메뉴별
  else if GridLevel2.Active then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '담당자 메뉴별 매출현황'+#13;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  rptAlignCenter + '(기간별)'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '담 당 자 : '+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDamdang.Index] +#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'     메뉴명             수량      매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView2 do
    begin
      For vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + rptpStr+Rpad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView2MenuName.Index],22,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView2SaleQty.Index]),6,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView2SaleAmt.Index]),14,' ')+#13;

        vTotAmt := vTotAmt + DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView2SaleAmt.Index];
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계     '+ LPad(FormatFloat('#,0',vTotAmt), 24,' ') + #13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  end;

  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

end.
