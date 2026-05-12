unit HeadOrderShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridDBTableView, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit, AdvSplitter;

type
  THeadOrderShowForm = class(TInheritShow2Form)
    GridDBTableViewColumn2: TcxGridDBColumn;
    GridDBTableViewColumn3: TcxGridDBColumn;
    GridDBTableViewColumn4: TcxGridDBColumn;
    GridDBTableViewColumn5: TcxGridDBColumn;
    GridDBTableViewColumn6: TcxGridDBColumn;
    GridDBTableViewColumn7: TcxGridDBColumn;
    GridDBTableViewColumn8: TcxGridDBColumn;
    GridDBTableViewColumn9: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewOrderQty: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    GridSubDBTableViewConfirmQty: TcxGridDBColumn;
    GridDBTableViewColumn10: TcxGridDBColumn;
    GridDBTableViewColumn11: TcxGridDBColumn;
    GridDBTableViewColumn12: TcxGridDBColumn;
    GridSubDBTableViewColumn8: TcxGridDBColumn;
    ListGrid: TcxGrid;
    ListGridTableView: TcxGridTableView;
    ListGridTableViewOrderDate: TcxGridColumn;
    ListGridTableViewYmdOrder: TcxGridColumn;
    ListGridLevel: TcxGridLevel;
    GridSplitter: TAdvSplitter;
    GridDBTableViewColumn13: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ListGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridSubDBTableViewConfirmQtyStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadOrderShowForm: THeadOrderShowForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

{ TOrderOrderShowForm }
procedure THeadOrderShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure THeadOrderShowForm.GridSubDBTableViewConfirmQtyStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridSubDBTableViewOrderQty.Index] <> ARecord.Values[AItem.Index] then
    AStyle := StyleFontRed;
end;

procedure THeadOrderShowForm.ListGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord = nil then
  begin
    GridDBTableView.DataController.DataSource := nil;
    GridSubDBTableView.DataController.DataSource := nil;
    Exit;
  end;
  OpenQuery('select   StoD(a.YMD_ORDER) as YMD_ORDER, '
           +'         b.NM_STORE, '
           +'         a.NO_ORDER, '
           +'         case a.DS_ORDER when ''S'' then ''매장발주'' when ''H'' then ''긴급발주'' end as DS_ORDER, '
           +'         case a.DS_STATUS when ''O'' then ''발주'' when ''C'' then ''발주확정'' when ''D'' then ''발주삭제'' when ''S'' then ''출고완료'' end DS_STATUS, '
           +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
           +'         a.AMT_TAX, '
           +'         a.AMT_ORDER , '
           +'         StoD(a.YMD_DELIVERY) as YMD_DELIVERY, '
           +'         a.ORDER_REMARK, '
           +'         a.DT_CONFIRM, '
           +'         a.DT_INSERT, '
           +'         a.DT_CHANGE, '
           +'         ConCat(a.YMD_ORDER,a.NO_ORDER) as LINK '
           +'  from   OL_ORDER_H a inner join '
           +'         MS_STORE   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +' where   a.CD_HEAD    =:P0 '
           +'   and   a.YMD_ORDER  =:P1 '
           +' order by a.YMD_ORDER, a.NO_ORDER',
            [HeadStoreCode,
             GetOnlyNumber(ListGridTableView.DataController.Values[ListGridTableView.DataController.GetFocusedRecordIndex, 0])]);
  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  OpenQuery('select   a.SEQ, '
           +'         a.CD_GOODS, '
           +'         b.NM_GOODS, '
           +'         b.NM_UNIT, '
           +'         a.QTY_ORDER, '
           +'         a.QTY_ORDER as QTY_CONFIRM, '
           +'         a.PR_ORDER, '
           +'         a.AMT_ORDER, '
           +'         c.NM_TRDPL as NM_LOGISTICS, '
           +'         ConCat(a.YMD_ORDER,a.NO_ORDER) as LINK '
           +'  from   OL_ORDER_D as a left outer join '
           +'         MS_GOODS   as b on a.CD_HEAD = b.CD_HEAD and b.CD_STORE = :P2 and a.CD_GOODS = b.CD_GOODS left outer join '
           +'         MS_TRD     as c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = :P2 and c.CD_TRDPL = b.CD_LOGISTICS '
           +' where   a.CD_HEAD   = :P0 '
           +'   and   a.YMD_ORDER = :P1 '
           +' order by a.YMD_ORDER, a.NO_ORDER, a.SEQ',
            [HeadStoreCode,
             GetOnlyNumber(ListGridTableView.DataController.Values[ListGridTableView.DataController.GetFocusedRecordIndex, 0]),
             StandardStore]);
  GridSubDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, SubMemData);
  GridSubDBTableView.DataController.DataSource := SubDataSource;
end;

function THeadOrderShowForm.DoSearch: Boolean;
begin
//  inherited;
  GridDBTableView.DataController.RecordCount    := 0;
  GridSubDBTableView.DataController.RecordCount := 0;
  isLoading := true;

  try
    // 날짜목록 쿼리를 열어 그리드에 보여준다
    OpenQuery('select StoDW(YMD_ORDER) as YMD_ORDER '
             +'  from OL_ORDER_H '
             +' where CD_HEAD  =:P0 '
             +'   and YMD_ORDER  between :P1 and :P2 '
             +' group by YMD_ORDER '
             +' order by YMD_ORDER ',
              [HeadStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, ListGridTableView);
  finally
    FinishQuery;
    isLoading := false;
  end;

  if ListGridTableView.DataController.RecordCount > 0 then
  begin
    ListGrid.SetFocus;
    ListGridTableView.DataController.FocusedRecordIndex := 0;
  end;
end;


end.
