unit StockMonthStockShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  dxPSCore, dxPScxCommon, Menus, ImgList, AdvToolBar,
  AdvToolBarStylers, ExtCtrls, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSPrVwRibbon, DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TStockMonthStockShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewColumn1: TcxGridBandedColumn;
    GridBandedTableViewColumn2: TcxGridBandedColumn;
    GridBandedTableViewColumn3: TcxGridBandedColumn;
    GridBandedTableViewColumn4: TcxGridBandedColumn;
    GridBandedTableViewColumn5: TcxGridBandedColumn;
    GridBandedTableViewColumn6: TcxGridBandedColumn;
    GridBandedTableViewColumn7: TcxGridBandedColumn;
    GridBandedTableViewColumn8: TcxGridBandedColumn;
    GridBandedTableViewColumn9: TcxGridBandedColumn;
    GridBandedTableViewColumn10: TcxGridBandedColumn;
    GridBandedTableViewColumn11: TcxGridBandedColumn;
    GridBandedTableViewColumn12: TcxGridBandedColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewColumn12: TcxGridColumn;
    GridBandedTableViewColumn14: TcxGridBandedColumn;
    GridBandedTableViewColumn15: TcxGridBandedColumn;
    GridBandedTableViewColumn16: TcxGridBandedColumn;
    GridBandedTableViewStockQty: TcxGridBandedColumn;
    GridBandedTableViewColumn18: TcxGridBandedColumn;
    GridBandedTableViewColumn23: TcxGridBandedColumn;
    GridBandedTableViewColumn24: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridBandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  StockMonthStockShowForm: TStockMonthStockShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

function TStockMonthStockShowForm.DoSearch: Boolean;
begin
  try
    OpenQuery('select Count(*) '
             +'  from SL_STOCK_MONTH '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_STOCK = :P2',
              [HeadStoreCode,
               StoreCode,
               LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)]);
    if Query.Fields[0].AsInteger = 0 then
    begin
      MsgBox('월 마감이 되지 않았습니다.');
      Result := true;
      Exit;
    end;
    FinishQuery;
    OpenQuery('select Ifnull(c.NM_CLASS,''[미지정]'') as LARGE, '
             +'       Ifnull(t.NM_TRDPL,''[미지정]'') as NM_TRDPL, '
             +'       s.CD_GOODS, '
             +'       g.NM_MENU as NM_GOODS, '
             +'       s.QTY_BASE, '
             +'       s.AMT_BASE, '
             +'       s.QTY_BUY, '
             +'       s.AMT_BUY, '
             +'       s.QTY_SALE, '
             +'       s.AMT_SALE, '
             +'       s.QTY_DISUSE, '
             +'       s.AMT_DISUSE, '
             +'       s.QTY_SILSA, '
             +'       s.QTY_ADJ, '
             +'       s.AMT_ADJ, '
             +'       s.QTY_STOCK, '
             +'       s.AMT_STOCK, '
             +'       DivFlt(s.AMT_SALE, Divflt((s.AMT_BASE+s.AMT_STOCK), 2)) as RT_CYCLE, '
             +'       DivInt( Date_Format(Last_Day(Cast(DATE_ADD(NOW(), INTERVAL 1 MONTH) - DAY(NOW()) AS DATETIME)), ''%d''), DivFlt(s.AMT_SALE, DivFlt((s.AMT_BASE+s.AMT_STOCK), 2))) as DAY_CYCLE '
             +'from   SL_STOCK_MONTH s inner join '
             +'       MS_MENU        g on s.CD_HEAD = g.CD_HEAD and s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_MENU and g.DS_STOCK = ''1'' and g.YN_USE = ''Y'' left outer join '
             +'       MS_TRD         t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL left outer join '
             +'       MS_MENU_CLASS  c on g.CD_HEAD = c.CD_HEAD and g.CD_STORE = c.CD_STORE and Length(c.CD_CLASS) = 2 and c.CD_CLASS = g.CD_CLASS '
             +'where  s.CD_HEAD  =:P0 '
             +'  and  s.CD_STORE =:P1 '
             +'  and  s.YM_STOCK =:P2 '
             +'  and  (g.CD_MENU =:P3 or g.NM_MENU like ConCat(''%'',:P3,''%'')) '
             +'order  by g.CD_MENU ',
             [HeadStoreCode,
              StoreCode,
              LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6),
              ConditionToolBarEdit.Text]);
    Result := DM.ReadQuery(Query, GridBandedTableView);
  finally
    FinishQuery;
  end;
end;

procedure TStockMonthStockShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
end;

procedure TStockMonthStockShowForm.GridBandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridBandedTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridBandedTableViewStockQty.Index] < 0 then
    AStyle := StyleFontRed;
end;

end.
