unit HeadRealTimeOrderShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, cxLabel, cxCurrencyEdit, cxGridCustomTableView,
  cxGridCardView, cxGridCustomLayoutView, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, cxGridLevel, cxGridCustomView,
  cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, AdvPanel, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadRealTimeOrderShowForm = class(TInheritGridEditForm)
    GridStoreView: TcxGridCardView;
    GridStoreViewStoreName: TcxGridCardViewRow;
    GridStoreViewOrderAmt: TcxGridCardViewRow;
    GridStoreViewDeliveryAmt: TcxGridCardViewRow;
    GridStoreViewGuestCount: TcxGridCardViewRow;
    GridStoreViewOrderTable: TcxGridCardViewRow;
    GridStoreViewStoreCode: TcxGridCardViewRow;
    GridStoreViewDeliveryCount: TcxGridCardViewRow;
    MenuPanel: TAdvPanel;
    MenuGrid: TcxGrid;
    MenuGridTableView: TcxGridTableView;
    MenuGridTableViewMenuName: TcxGridColumn;
    MenuGridTableViewQty: TcxGridColumn;
    MenuGridTableViewAmount: TcxGridColumn;
    MenuGridLevel: TcxGridLevel;
    OrderPanel: TAdvPanel;
    OrderGrid: TcxGrid;
    OrderGridTableView: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    OrderGridLevel: TcxGridLevel;
    MenuGridTableViewPrice: TcxGridColumn;
    OrderGridTableViewTableNo: TcxGridColumn;
    OrderGridTableViewDsOrder: TcxGridColumn;
    procedure GridStoreViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure OrderGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
  end;

var
  HeadRealTimeOrderShowForm: THeadRealTimeOrderShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ THeadDaySaleShowForm }
function THeadRealTimeOrderShowForm.DoSearch: Boolean;
var vDestStoreCode :String;
begin
  isLoading := true;
  OpenQuery('select  a.NM_STORE_SHORT, '
           +'        a.CD_STORE, '
           +'        Ifnull(b.AMT_ORDER,0)    as AMT_ORDER, '
           +'        Ifnull(b.ORDER_TABLE,0)  as ORDER_TABLE, '
           +'        Ifnull(b.CNT_GUEST,0)    as CNT_GUEST, '
           +'        Ifnull(b.CNT_DELIVERY,0) as CNT_DELIVERY, '
           +'        Ifnull(b.AMT_DELIVERY,0) as AMT_DELIVERY '
           +'  from  MS_STORE as a left outer join '
           +'       (select CD_STORE, '
           +'               Sum(AMT_ORDER) as AMT_ORDER, '
           +'               Sum(case when DS_ORDER = ''T'' then 1 else 0 end) as ORDER_TABLE, '
           +'               Sum(CNT_PERSON) as CNT_GUEST, '
           +'               Sum(case when DS_ORDER = ''D'' then 1 else 0 end) as CNT_DELIVERY, '
           +'               Sum(case when DS_ORDER = ''D'' then AMT_ORDER else 0 end) as AMT_DELIVERY '
           +'         from  SL_ORDER_H  '
           +'        where  CD_HEAD  =:P0 '
           +'        group by CD_STORE) as b on b.CD_STORE = a.CD_STORE '
           +' where a.CD_HEAD =:P0 '
           +'   and a.CD_STORE <> :P1 '
           +'   and a.YN_USE  =''Y'' '
           +' order by b.AMT_ORDER desc ',
            [HeadStoreCode,
             StandardStore]);
  GridStoreView.DataController.BeginUpdate;
  GridStoreView.DataController.RecordCount := 0;
  while not Query.Eof do
  begin
    GridStoreView.DataController.AppendRecord;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewStoreCode.Index]     := Query.FieldByName('CD_STORE').AsString;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewStoreName.Index]     := Query.FieldByName('NM_STORE').AsString;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewOrderAmt.Index]      := Query.FieldByName('AMT_ORDER').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewOrderTable.Index]    := Query.FieldByName('ORDER_TABLE').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewGuestCount.Index]    := Query.FieldByName('CNT_GUEST').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewDeliveryCount.Index] := Query.FieldByName('CNT_DELIVERY').AsCurrency;
    GridStoreView.DataController.Values[GridStoreView.DataController.RecordCount-1, GridStoreViewDeliveryAmt.Index]   := Query.FieldByName('AMT_DELIVERY').AsCurrency;
    Query.Next;
  end;
  GridStoreView.DataController.EndUpdate;
  Query.Close;
  Result := GridStoreView.DataController.RecordCount > 0;
  isLoading := false;
  if Result then
    GridStoreView.DataController.FocusedRecordIndex := 0;
end;

procedure THeadRealTimeOrderShowForm.DoGridLink;
begin
  inherited;
  OpenQuery('select case when a.DS_ORDER = ''T'' then case when a.NO_TABLE = 0 then ''TakeOut'' else b.NM_TABLE end else ''배달'' end as NM_TABLE, '
           +'       Date_Format(a.COME_TIME, ''%Y-%m-%d %H:%i'') as COME_TIME, '
           +' 	    a.AMT_ORDER, '
           +' 	    a.CNT_PERSON, '
           +'       a.NO_TABLE, '
           +'       a.DS_ORDER '
           +'  from SL_ORDER_H a left outer join '
           +'       MS_TABLE   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +' order by a.NO_TABLE ',
           [HeadStoreCode,
            GridStoreView.DataController.Values[GridStoreView.DataController.GetFocusedRecordIndex, GridStoreViewStoreCode.Index]]);
  DM.ReadQuery(Query, OrderGridTableView);
  MenuGridTableView.DataController.RecordCount := 0;
  if OrderGridTableView.DataController.RecordCount > 0 then
    OrderGridTableView.DataController.FocusedRecordIndex := 0;
end;


procedure THeadRealTimeOrderShowForm.GridStoreViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if isLoading then Exit;
  DoGridLink;
end;

procedure THeadRealTimeOrderShowForm.OrderGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  OpenQuery('select case when a.NO_STEP = 0 then b.NM_MENU else ConCat(''-'',c.NM_MENU) end as NM_MENU, '
           +'       GetQty(b.DS_MENU_TYPE, a.QTY_ORDER) as QTY_ORDER, '
           +'       a.PR_SALE, '
           +'       a.AMT_ORDER '
           +'  from SL_ORDER_D  a  inner join '
           +'       MS_MENU     b  on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU left outer join '
           +'       MS_MENU     c  on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.CD_MENU = a.CD_MENU1 '
           +' where a.CD_HEAD  = :P0 '
           +'   and a.CD_STORE = :P1 '
           +'   and a.NO_TABLE = :P2 '
           +'   and a.DS_ORDER = :P3 '
           +' order by a.NO_TABLE, a.SEQ, a.NO_STEP ',
           [HeadStoreCode,
            GridStoreView.DataController.Values[GridStoreView.DataController.GetFocusedRecordIndex, GridStoreViewStoreCode.Index],
            OrderGridTableView.DataController.Values[OrderGridTableView.DataController.GetFocusedRecordIndex, OrderGridTableViewTableNo.Index],
            OrderGridTableView.DataController.Values[OrderGridTableView.DataController.GetFocusedRecordIndex, OrderGridTableViewDsOrder.Index]]);
  DM.ReadQuery(Query, MenuGridTableView);
end;

end.
