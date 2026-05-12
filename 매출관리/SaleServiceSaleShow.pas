unit SaleServiceSaleShow;

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
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  MaskUtils, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TSaleServiceSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewQtySale: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1MenuCode: TcxGridColumn;
    GridTableView1MenuName: TcxGridColumn;
    GridTableView1SaleQty: TcxGridColumn;
    GridTableView1SalePrice: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableViewWhy: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleServiceSaleShowForm: TSaleServiceSaleShowForm;

implementation
uses
  Common, DBModule;
{$R *.dfm}
procedure TSaleServiceSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TSaleServiceSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex  :Integer;
    vTotAmt :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  if Grid.ActiveLevel = GridLevel then
  begin
    if GridTableView.DataController.RecordCount = 0 then Exit;

    vPrintData := rptSizeBoth + rptAlignCenter + '서비스매출내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  ' 매출일자    '+rptpStr+'    메뉴명  '+rptpStr+'           수량  '+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vTotAmt := 0;
    with GridTableView do
    begin
      For vIndex := 0 to DataController.RecordCount-1 do
      begin
        vPrintData := vPrintData + Rpad(NVL(DataController.Values[vIndex, GridTableViewSaleDate.Index],''),11,' ')
                                 + RPad(NVL(DataController.Values[vIndex, GridTableViewMenuName.Index],''),24+PrintBlank,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableViewQtySale.Index]),7,' ')+#13;
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
  end
  else
  begin
    if GridTableView1.DataController.RecordCount = 0 then Exit;

    vPrintData := rptSizeBoth + rptAlignCenter + '포장매출내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  ' 매출일자   '+rptpStr+'   메뉴명 '+rptpStr+'      수량  매출금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vTotAmt := 0;
    with GridTableView1 do
    begin
      For vIndex := 0 to DataController.RecordCount-1 do
      begin
        vPrintData := vPrintData + Rpad(LeftStr(DataController.Values[vIndex, GridTableView1SaleDate.Index],10),11,' ')
                                 + RPad(DataController.Values[vIndex, GridTableView1MenuName.Index],17+PrintBlank,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableView1SaleQty.Index]),4,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableView1SaleAmt.Index]),10,' ')+#13;
        vTotAmt := vTotAmt + DataController.Values[vIndex, GridTableView1SaleAmt.Index];
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계     '+rptpStr+LPad(FormatFloat('#,0',vTotAmt), 24,' ')+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
  end;

  PrintPrinter(vPrintData);
end;

function TSaleServiceSaleShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select StoD(a.YMD_SALE) as YMD_SALE, '
             +'       ConCat(a.NO_POS,''-'',a.NO_RCP) as NO_RCP, '
             +'       d.NM_SAWON, '
             +'       a.CD_MENU, '
             +'       c.NM_MENU, '
             +'       e.NM_CODE1 as NM_SERVICE, '
             +'       GetQty(c.DS_MENU_TYPE, a.QTY_SALE) as QTY_SALE, '
             +'       c.PR_SALE, '
             +'       case when c.DS_MENU_TYPE = ''W'' then a.PR_SERVICE else a.QTY_SALE * a.PR_SERVICE end as AMT_SERVICE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'b')
             +'                   on a.CD_HEAD  = b.CD_HEAD  '
             +'                  and a.CD_STORE = b.CD_STORE '
             +'                  and a.YMD_SALE = b.YMD_SALE '
             +'                  and a.NO_POS   = b.NO_POS '
             +'                  and a.NO_RCP   = b.NO_RCP left outer join '
             +'       MS_MENU   c on a.CD_HEAD  = c.CD_HEAD '
             +'                  and a.CD_STORE = c.CD_STORE '
             +'                  and a.CD_MENU  = c.CD_MENU left outer join '
             +'       MS_SAWON  d on a.CD_HEAD  = d.CD_HEAD '
             +'                  and a.CD_STORE = d.CD_STORE '
             +'                  and b.CD_SAWON = d.CD_SAWON left outer join '
             +'       MS_CODE   e on a.CD_HEAD  = e.CD_HEAD '
             +'                  and a.CD_STORE = e.CD_STORE '
             +'                  and a.CD_SERVICE  = e.CD_CODE and e.CD_KIND = ''23'' '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'   and a.DS_SALE_TYPE = ''D'' '
             +'   and a.DS_SALE <> ''V'' '
             +' order by a.YMD_SALE, a.NO_POS, a.NO_RCP ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select StoD(a.YMD_SALE) AS YMD_SALE, '
             +'       a.CD_MENU, '
             +'       c.NM_MENU, '
             +'       GetQty(c.DS_MENU_TYPE, a.QTY_SALE) as QTY_SALE, '
             +'       a.PR_SALE, '
             +'       a.AMT_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'       MS_MENU   c on a.CD_HEAD  = c.CD_HEAD '
             +'                  and a.CD_STORE = c.CD_STORE '
             +'                  and a.CD_MENU  = c.CD_MENU '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'   and a.DS_SALE_TYPE = ''P'' '
             +'   and a.DS_SALE <> ''V'' '
             +' order by a.YMD_SALE, a.CD_MENU ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end;
end;



end.
