unit SalePosAuditShow;

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
  cxCurrencyEdit, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, MaskUtils, Math, StrUtils,
  dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TSalePosAuditShowForm = class(TInheritShowForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewQty: TcxGridColumn;
    GridTableViewCancelDate: TcxGridColumn;
    GridTableViewSawon: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewFloor: TcxGridColumn;
    GridTableViewTable: TcxGridColumn;
    GridTableViewWhy: TcxGridColumn;
    GridTableViewOrderDate: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1PosNo: TcxGridColumn;
    GridTableView1ReceiptNo: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1Floor: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    GridTableView1Column10: TcxGridColumn;
    GridTableView1Column11: TcxGridColumn;
    GridTableView1SaleTime: TcxGridColumn;
    GridTableView1CancelTime: TcxGridColumn;
    GridTableView1Column14: TcxGridColumn;
    GridLevel2: TcxGridLevel;
    GridLevel3: TcxGridLevel;
    GridTableView2: TcxGridTableView;
    GridTableView3: TcxGridTableView;
    GridTableView2SaleDate: TcxGridColumn;
    GridTableView2PosNo: TcxGridColumn;
    GridTableView2ReceiptNo: TcxGridColumn;
    GridTableView2CardNo: TcxGridColumn;
    GridTableView2ApprovalAmt: TcxGridColumn;
    GridTableView2Member: TcxGridColumn;
    GridTableView2SaleTime: TcxGridColumn;
    GridTableView2ChangeTime: TcxGridColumn;
    GridTableView2Sawon: TcxGridColumn;
    GridTableView3SaleDate: TcxGridColumn;
    GridTableView3PosNo: TcxGridColumn;
    GridTableView3ReceiptNo: TcxGridColumn;
    GridTableView3Member: TcxGridColumn;
    GridTableView3Point: TcxGridColumn;
    GridTableView3SaleTime: TcxGridColumn;
    GridTableView3ChangeTime: TcxGridColumn;
    GridTableView3Sawon: TcxGridColumn;
    GridTableView2DelayTime: TcxGridColumn;
    GridTableView3DelayTime: TcxGridColumn;
    GridTableViewRcpNo: TcxGridColumn;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableViewCancelAmt: TcxGridColumn;
    GridLevel4: TcxGridLevel;
    GridTableView4: TcxGridTableView;
    GridTableView4Column1: TcxGridColumn;
    GridTableView4Column2: TcxGridColumn;
    GridTableView4Column3: TcxGridColumn;
    GridTableView4Column4: TcxGridColumn;
    GridTableView4Column5: TcxGridColumn;
    GridTableView4Column6: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView3CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GridTableView3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  SalePosAuditShowForm: TSalePosAuditShowForm;



implementation

uses
  Common, DBModule, Main;

{$R *.dfm}

procedure TSalePosAuditShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
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
  if GridLevel.Active then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '주문취소내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'    메뉴명  '+rptpStr+'                수량  담당자  '+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView do
    begin
      For vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + Rpad(NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex],  GridTableViewMenuName.Index],'')+Ifthen(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewOrderDate.Index] = '', '(미주문)', '(주문)'),29+PrintBlank,' ')
                                 + LPad(NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex],  GridTableViewQty.Index],''),3,' ')
                                 + ' '+LPad(LeftStr(NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex],  GridTableViewSawon.Index],''),4),6,' ')+#13;
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
  end
  else
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '매출취소내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptpStr+'영수증'+rptpStr+'   매출금액   계산시간    취소시간'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    with GridTableView1 do
    begin
      For vIndex := 0 to DataController.FilteredRecordCount-1 do
      begin
        vPrintData := vPrintData + Format('%s-%s',[DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1PosNo.Index], DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1ReceiptNo.Index]])
                                 + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1SaleAmt.Index]),PrintBlank+10,' ')
                                 + LPad(RightStr(NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1SaleTime.Index],  ''),11),12,' ')
                                 + LPad(RightStr(NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableView1CancelTime.Index],''),11),12,' ')+#13
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
  end;

  PrintPrinter(vPrintData);
end;

function TSalePosAuditShowForm.DoSearch: Boolean;
var vTemp :Integer;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vTemp := 2;
    1 : vTemp := 3;
    2 : vTemp := 5;
  end;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select a.CD_MENU, '
             +'       b.NM_MENU, '
             +'       StoD(a.YMD_SALE) as YMD_SALE, '
             +'       StoD(a.DT_ORDER) as DT_ORDER, '
             +'       StoD(a.DT_CANCEL) as DT_CANCEL, '
             +'       e.NM_CODE1 as NM_FLOOR, '
             +'       case when a.DS_ORDER = ''D'' then ''배달'' '
             +'            when a.NO_TABLE = 0     then ''선불판매'' '
             +'       else d.NM_TABLE end as NM_TABLE, '
             +'       a.QTY_CANCEL, '
             +'       a.QTY_CANCEL * b.PR_SALE as AMT_CANCEL, '
             +'       a.CANCEL_TXT, '
             +'       c.NM_SAWON, '
             +'       a.NO_POS, '
             +'       case when Ifnull(a.DS_ORDER,'''') = ''D'' then '''' else a.NO_RCP end as NO_RCP '
             +'  from SL_SALE_C a left outer join '
             +'       MS_MENU   b on a.CD_HEAD  = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU  = b.CD_MENU  left outer join '
             +'       MS_SAWON  c on a.CD_HEAD  = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_SAWON = c.CD_SAWON left outer join '
             +'       MS_TABLE  d on a.CD_HEAD  = d.CD_HEAD and a.CD_STORE = d.CD_STORE and a.NO_TABLE = d.NO_TABLE left outer join '
             +'       MS_CODE   e on d.CD_HEAD  = e.CD_HEAD and d.CD_STORE = e.CD_STORE and e.CD_KIND = ''03'' and d.CD_FLOOR = e.CD_CODE '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'order by a.DT_CANCEL ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select StoD(a.YMD_SALE) as YMD_SALE, '
             +'	      a.NO_POS, '
             +'	      a.NO_RCP, '
             +'       case a.DS_SALE when ''B'' then ''반품'' when ''V'' then ''취소'' end as DS_SALE, '
             +'       case a.AMT_SALE when AMT_CASH  then case when AMT_CASHRCP = 0 then ''현금'' else ''현금영수증'' end  '
             +'                       when AMT_CARD  then ''신용카드'' '
             +'                       when AMT_TRUST then ''외상'' '
             +'                       when AMT_CHECK then ''수표'' '
             +'                       when AMT_GIFT  then ''상품권'' '
             +'                       else ''기타'' '
             +'       end as DS_ACCT, '
             +'	      Ifnull(a.AMT_SALE, 0) as AMT_SALE, '
             +'	      e.NM_CODE1 as NM_FLOOR, '
             +'       case when (a.NO_TABLE=0) and (a.NO_DELIVERY <> '''')  then ''배달'' '
             +'            when (a.NO_TABLE=0) then ''TakeOut'' '
             +'            else d.NM_TABLE '
             +'       end as NM_TABLE, '
             +'       case when a.CD_MEMBER = '''' then ''일반'' else ConCat(NM_MEMBER,''['',a.CD_MEMBER,'']'') end as NM_MEMBER, '
             +'	      Ifnull(b.NM_SAWON,   '''') as NM_SAWON, '
             +'	      Date_Format(a.COME_TIME, ''%Y-%m-%d %H:%i'') as DT_COME, '
             +'	      Date_Format(a.DT_SALE,   ''%Y-%m-%d %H:%i'') as DT_SALE, '
             +'	      a.DT_CHANGE as DT_CANCEL, '
             +'       a.CANCEL_TXT, '
             +'       case when Length(a.NO_RCP_ORG) = 14 then ConCat(Left(a.NO_RCP_ORG,8),''-'',SubString(a.NO_RCP_ORG,9,2),''-'',SubString(a.NO_RCP_ORG,11,4)) '
             +'                                        else '''' '
             +'       end as NO_RCP_ORG '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'       MS_SAWON  b on a.CD_HEAD  = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON  = b.CD_SAWON  left outer join '
             +'       MS_MEMBER c on a.CD_HEAD  = c.CD_HEAD and c.CD_STORE = :P4 and a.CD_MEMBER = c.CD_MEMBER left outer join '
             +'       MS_TABLE  d on a.CD_HEAD  = d.CD_HEAD and a.CD_STORE = d.CD_STORE and a.NO_TABLE  = d.NO_TABLE and d.NO_TABLE > 0 left outer join '
             +'       MS_CODE   e on d.CD_HEAD  = e.CD_HEAD and d.CD_STORE = e.CD_STORE and d.CD_FLOOR  = e.CD_CODE  and e.CD_KIND = ''03''  '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'   and a.DS_SALE in (''V'',''B'') '
             +' order by a.YMD_SALE, a.NO_POS, a.NO_RCP ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    OpenQuery('select StoDW(a.YMD_SALE) as YMD_SALE, '
             +'       a.NO_POS, '
             +'       a.NO_RCP, '
             +'       Max(c.CD_MEMBER)    as CD_MEMBER, '
             +'       Max(a.NO_CARD)      as NO_CARD, '
             +'       Max(a.AMT_APPROVAL) as AMT_APPROVAL, '
             +'       Max(c.DT_SALE)      as DT_SALE, '
             +'       Ifnull(Max(c.DT_CHANGE),Max(c.DT_SALE))    as DT_CHANGE, '
             +'       MAX(d.NM_SAWON)     as NM_SAWON, '
             +'       Max(e.NM_CODE31)    as NO_CHANNEL, '
             +'       TIMESTAMPDIFF(MINUTE, Max(c.DT_SALE), Max(c.DT_CHANGE) ) as DELAY_TIME '
             +'  from SL_CASH a inner join '
             +'      (select YMD_SALE, NO_POS, NO_CARD, COUNT(*) as CNT '
             +'         from SL_CASH '
             +'        where CD_HEAD  =:P0 '
             +'          and CD_STORE =:P1 '
             +'          and YMD_SALE between :P2 and :P3 '
             +'        group by CD_STORE, YMD_SALE, NO_CARD, NO_POS '
             +'        having COUNT(*) >= :P4 '
             +'       ) b on b.YMD_SALE = a.YMD_SALE and b.NO_POS = a.NO_POS and b.NO_CARD = a.NO_CARD left outer join '
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'c')
             +'                   on c.CD_HEAD  = a.CD_HEAD '
             +'                  and c.CD_STORE = a.CD_STORE '
             +'                  and c.YMD_SALE = a.YMD_SALE '
             +'                  and c.NO_POS   = a.NO_POS '
             +'                  and c.NO_RCP   = a.NO_RCP left outer join '
             +'       MS_SAWON  d on d.CD_HEAD  = c.CD_HEAD and d.CD_STORE = c.CD_STORE and d.CD_SAWON = c.CD_SAWON left outer join '
             +'       MS_CODE   e on e.CD_HEAD  = a.CD_HEAD and e.CD_STORE = a.CD_STORE and e.NM_CODE1  = a.NO_POS and e.CD_KIND = ''01'' '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +Ifthen(ConditionToolBarEdit.Text <> '', ' and a.NO_CARD ='''+ConditionToolBarEdit.Text+''' ')
             +' group by a.YMD_SALE, a.NO_POS, a.NO_RCP '
             +' order by 1,5,2,3',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              vTemp]);
    Result := DM.ReadQuery(Query, GridTableView2);
  end
  else if Grid.ActiveLevel = GridLevel3 then
  begin
    OpenQuery('select StoDW(a.YMD_SALE) as YMD_SALE, '
             +'       a.NO_POS, '
             +'       a.NO_RCP, '
             +'       ConCat(Max(a.CD_MEMBER),''-'', Max(Ifnull(d.NM_MEMBER,''''))) as NM_MEMBER, '
             +'       Max(a.PNT_OCCUR)    as PNT_OCCUR, '
             +'       Max(a.DT_SALE)      as DT_SALE, '
             +'       Ifnull(Max(a.DT_CHANGE), Max(a.DT_SALE))    as DT_CHANGE, '
             +'       MAX(c.NM_SAWON)     as NM_SAWON, '
             +'       Max(e.NM_CODE31)    as NO_CHANNEL, '
             +'       TIMESTAMPDIFF(MINUTE, Max(a.DT_SALE), Max(a.DT_CHANGE) ) as DELAY_TIME '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'a left outer join')
             +'      (select YMD_SALE, '
             +'              NO_POS, '
             +'              CD_MEMBER, '
             +'              COUNT(*) as CNT '
             +'         from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
             +'        where CD_HEAD  =:P0 '
             +'          and CD_STORE =:P1 '
             +'          and YMD_SALE between :P2 and :P3 '
             +'          and PNT_OCCUR > 0 '
             +'          and Ifnull(CD_MEMBER,'''') <> '''' '
             +'        group by YMD_SALE, CD_MEMBER, NO_POS '
             +'        having COUNT(*) > :P4 '
             +'       ) b on b.YMD_SALE = a.YMD_SALE and b.NO_POS = a.NO_POS and b.CD_MEMBER = a.CD_MEMBER left outer join '
             +'       MS_SAWON  c on c.CD_HEAD  = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.CD_SAWON = a.CD_SAWON left outer join '
             +'       MS_MEMBER d on d.CD_HEAD  = a.CD_HEAD and d.CD_STORE = :P5 and d.CD_MEMBER = a.CD_MEMBER left outer join '
             +'       MS_CODE   e on e.CD_HEAD  = a.CD_HEAD and e.CD_STORE = a.CD_STORE and e.NM_CODE1  = a.NO_POS and e.CD_KIND = ''01'' '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +Ifthen(ConditionToolBarEdit.Text <> '', ' and a.CD_MEMBER ='''+ConditionToolBarEdit.Text+''' ')
             +' group by a.YMD_SALE, a.NO_POS, a.NO_RCP '
             +' order by 1,4,2,3',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              vTemp,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridTableView3);
  end
  else if Grid.ActiveLevel = GridLevel4 then
  begin
    OpenQuery('select StoDW(a.YMD_REAL) as YMD_REAL, '
             +'       a.SEQ, '
             +'       case when DS_OPEN = ''S'' then ''계산시'' else ''임의'' end DS_OPEN, '
             +'       a.NO_POS, '
             +'       ConCat(a.YMD_SALE,''-'',a.NO_POS,''-'',a.NO_RCP) as NO_RCP, '
             +'       b.NM_SAWON, '
             +'       a.DT_CHANGE '
             +'  from SL_CASHBOX a inner join '
             +'       MS_SAWON   b on b.CD_HEAD  = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_SAWON = a.CD_SAWON  '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_REAL between :P2 and :P3 '
             +' order by a.YMD_REAL, a.SEQ ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView4);
  end;
end;

procedure TSalePosAuditShowForm.FormCreate(Sender: TObject);
begin
  if GetOption(25) = '1' then
  begin
    GridTableViewFloor.Visible  := false;
    GridTableViewFloor.Tag      := 99;
    GridTableView1Floor.Visible := false;
    GridTableView1Floor.Tag     := 99;
  end;
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TSalePosAuditShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ConditionToolBarComboBox.Visible  := (Grid.ActiveLevel = GridLevel2) or (Grid.ActiveLevel = GridLevel3);
  DoSearch;
end;

procedure TSalePosAuditShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FormParam[0] := LeftStr(GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index]),8);
  FormParam[1] := GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1PosNo.Index];
  FormParam[2] := GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1ReceiptNo.Index];
  ExtremeMainForm.RunProgram('SaleReceiptShow');
end;

procedure TSalePosAuditShowForm.GridTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FormParam[0] := GetOnlyNumber(GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2SaleDate.Index]);
  FormParam[1] := GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2PosNo.Index];
  FormParam[2] := GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, GridTableView2ReceiptNo.Index];
  ExtremeMainForm.RunProgram('SaleReceiptShow');
end;

procedure TSalePosAuditShowForm.GridTableView2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableView2DelayTime.Index] >= 5 then
    AStyle := StyleFontRed;
end;

procedure TSalePosAuditShowForm.GridTableView3CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  FormParam[0] := GetOnlyNumber(GridTableView3.DataController.Values[GridTableView3.DataController.GetFocusedRecordIndex, GridTableView3SaleDate.Index]);
  FormParam[1] := GridTableView3.DataController.Values[GridTableView3.DataController.GetFocusedRecordIndex, GridTableView3PosNo.Index];
  FormParam[2] := GridTableView3.DataController.Values[GridTableView3.DataController.GetFocusedRecordIndex, GridTableView3ReceiptNo.Index];
  ExtremeMainForm.RunProgram('SaleReceiptShow');
end;

procedure TSalePosAuditShowForm.GridTableView3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableView3DelayTime.Index] >= 5 then
    AStyle := StyleFontRed;
end;

end.
