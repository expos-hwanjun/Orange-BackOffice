unit SaleCashierSaleShow;

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
  Math, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TSaleCashierSaleShowForm = class(TInheritShowForm)
    GridTableViewSawonName: TcxGridColumn;
    GridTableViewTotAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewServiceAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewCashRcpAmt: TcxGridColumn;
    GridTableViewTrustAmt: TcxGridColumn;
    GridTableViewGiftAmt: TcxGridColumn;
    GridTableViewPersonCount: TcxGridColumn;
    GridTableView1: TcxGridTableView;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableView1ServiceAmt: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1CashAmt: TcxGridColumn;
    GridTableView1CardAmt: TcxGridColumn;
    GridTableView1CashRcpAmt: TcxGridColumn;
    GridTableView1TrustAmt: TcxGridColumn;
    GridTableView1GiftAmt: TcxGridColumn;
    GridTableView1PersonCount: TcxGridColumn;
    GridTableView2: TcxGridTableView;
    GridTableView2Column1: TcxGridColumn;
    GridTableView2Column2: TcxGridColumn;
    GridTableView2Column3: TcxGridColumn;
    GridTableView2Column4: TcxGridColumn;
    GridTableView2Column5: TcxGridColumn;
    GridTableView2Column6: TcxGridColumn;
    GridTableViewSawonCode: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView2Column7: TcxGridColumn;
    GridTableView2Column8: TcxGridColumn;
    GridTableView2Column9: TcxGridColumn;
    GridTableViewBankAmt: TcxGridColumn;
    GridTableView1BankAmt: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableView1PointAmt: TcxGridColumn;
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleCashierSaleShowForm: TSaleCashierSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TSaleCashierSaleShowForm }
procedure TSaleCashierSaleShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  HelpURL     := 'BackOffice/매출관리/계산원별%20매출조회/계산원별%20매출조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
  //주방프린터
  try
    OpenQuery('select CD_SAWON, '
             +'       NM_SAWON '
             +'  from MS_SAWON '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_SAWON <> ''master'' '
             +'   and YN_USE = ''Y'' '
             +' order by CD_SAWON ',
             [HeadStoreCode,
              StoreCode]);
    ConditionToolBarComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '';
    ConditionToolBarComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    ConditionToolBarComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;
end;

function TSaleCashierSaleShowForm.DoSearch: Boolean;
begin
  case Grid.ActiveLevel.Index of
    0 :
    begin
      OpenQuery('select a.CD_SAWON, '
               +'       Max(b.NM_SAWON) as NM_SAWON, '
               +'       Sum(a.AMT_SALE+a.DC_TOT+a.AMT_SERVICE) as AMT_TOT, '
               +'       Sum(a.DC_TOT) as AMT_DC, '
               +'       Sum(a.AMT_SERVICE) as AMT_SERVICE, '
               +'       Sum(a.AMT_SALE) as AMT_SALE, '
               +'       Sum(a.AMT_CASH) as AMT_CASH, '
               +'       Sum(a.AMT_CARD) as AMT_CARD, '
               +'       Sum(a.AMT_CASHRCP) as AMT_CASHRCP, '
               +'       Sum(a.AMT_TRUST)   as AMT_TRUST, '
               +'       Sum(a.AMT_GIFT)    as AMT_GIFT, '
               +'       Sum(a.AMT_BANK)    as AMT_BANK, '
               +'       Sum(a.AMT_POINT)   as AMT_POINT, '
               +'       Sum(a.CNT_PERSON)  as CNT_PERSON, '
               +'       Sum(a.AMT_BUY)  as AMT_BUY, '
               +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE)) as RATE_PROFIT, '
               +'       Sum(a.AMT_SALE - a.AMT_BUY) as AMT_PROFIT '
               +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'a left outer join')
               +'       MS_SAWON  b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
               +' where a.CD_HEAD  =:P0 '
               +'   and a.CD_STORE =:P1 '
               +'   and a.DS_SALE  <> ''V'' '
               +'   and a.YMD_SALE between :P2 and :P3 '
               +Ifthen(GetStrPointerData(ConditionToolBarComboBox) = EmptyStr, 'and a.CD_SAWON <> '''' ', ' and a.CD_SAWON =:P4 ')
               +' group by a.CD_SAWON '
               +' order by a.CD_SAWON',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 GetStrPointerData(ConditionToolBarComboBox)]);
      Result := DM.ReadQuery(Query, GridTableView);
    end;
    1 :
    begin
      if GridTableView.DataController.GetFocusedRecordIndex < 0 then
      begin
        MsgBox('담당자를 선택하세요');
        Grid.ActiveLevel := GridLevel;
        Exit;
      end;
      OpenQuery('select StoDW(a.YMD_SALE) as YMD_SALE, '
               +'       Sum(a.AMT_SALE+a.DC_TOT+a.AMT_SERVICE) as AMT_TOT, '
               +'       Sum(a.DC_TOT) as AMT_DC, '
               +'       Sum(a.AMT_SERVICE) as AMT_SERVICE, '
               +'       Sum(a.AMT_SALE) as AMT_SALE, '
               +'       Sum(a.AMT_CASH) as AMT_CASH, '
               +'       Sum(a.AMT_CARD) as AMT_CARD, '
               +'       Sum(a.AMT_CASHRCP) as AMT_CASHRCP, '
               +'       Sum(a.AMT_TRUST)   as AMT_TRUST, '
               +'       Sum(a.AMT_GIFT)    as AMT_GIFT, '
               +'       Sum(a.AMT_BANK)    as AMT_BANK, '
               +'       Sum(a.AMT_POINT)   as AMT_POINT, '
               +'       Sum(a.CNT_PERSON)  as CNT_PERSON, '
               +'       Sum(AMT_BUY)  as AMT_BUY, '
               +'       GetProfitRate(Sum(AMT_BUY), Sum(AMT_SALE)) as RATE_PROFIT, '
               +'       Sum(AMT_SALE - AMT_BUY) as AMT_PROFIT '
               +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'a left outer join')
               +'       MS_SAWON  b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
               +' where a.CD_HEAD  =:P0 '
               +'   and a.CD_STORE =:P1 '
               +'   and a.YMD_SALE between :P2 and :P3 '
               +'   and a.CD_SAWON =:P4 '
               +'   and a.DS_SALE <> ''V'' '
               +' group by a.YMD_SALE '
               +' order by a.YMD_SALE ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonCode.Index]]);
      DM.ReadQuery(Query, GridTableView1);
    end;
    2 :
    begin
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

      OpenQuery('select a.CD_MENU, '
               +'       Max(c.NM_MENU) as NM_MENU, '
               +'       a.PR_SALE, '
               +'       Sum(a.QTY_SALE) as QTY_SALE, '
               +'       Sum(a.AMT_SALE) as AMT_SALE, '
               +'       Sum(a.DC_TOT) as DC_TOT, '
               +'       Sum(a.AMT_BUY)  as AMT_BUY, '
               +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE-a.DC_TOT)) as RATE_PROFIT, '
               +'       Sum(a.AMT_SALE - a.DC_TOT - a.AMT_BUY) as AMT_PROFIT '
               +'  from   '+GetPartitionTable('SL_SALE_D', StoD(GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index])), 'a inner join')
               +GetPartitionTable('SL_SALE_H', StoD(GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index])), 'b')
               +'                   on a.CD_HEAD  = b.CD_HEAD '
               +'                  and a.CD_STORE = b.CD_STORE '
               +'                  and a.YMD_SALE = b.YMD_SALE '
               +'                  and a.NO_POS   = b.NO_POS '
               +'                  and a.NO_RCP   = b.NO_RCP '
               +'                  and b.DS_SALE <> ''V''  inner join '
               +'       MS_MENU   c on a.CD_HEAD  = c.CD_HEAD '
               +'                  and a.CD_STORE = c.CD_STORE '
               +'                  and a.CD_MENU  = c.CD_MENU '
               +'  where a.CD_HEAD  =:P0 '
               +'    and a.CD_STORE =:P1 '
               +'    and b.CD_SAWON =:P2 '
               +'    and a.YMD_SALE =:P3 '
               +'  group by a.CD_MENU, a.PR_SALE '
               +'  order by a.CD_MENU',
                [HeadStoreCode,
                 StoreCode,
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonCode.Index],
                 GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index])]);
      DM.ReadQuery(Query, GridTableView2);
    end;
  end;
end;

procedure TSaleCashierSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel   := GridLevel1;
  GridLevel1.Caption := Format(' [%s] 일자별 매출 ',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonName.Index]]);
  ReportSubTitle     := GridLevel1.Caption;
  DoSearch;
end;

procedure TSaleCashierSaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  case ALevel.Index of
    0 ://GridLevel
    begin
      GridLevel1.Caption := ' 일자별 매출 ';
      GridLevel2.Caption := ' 메뉴별 매출 ';
    end;
    1 ://GridLevel1
    begin
      GridLevel2.Caption := ' 메뉴별 매출 ';
    end;
  end;
end;

procedure TSaleCashierSaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel   := GridLevel2;
  GridLevel2.Caption := Format(' [%s][%s] 메뉴별 매출 ',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonName.Index],
                                                       GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index]]);
  ReportSubTitle     := GridLevel2.Caption;
  DoSearch;
end;

end.
