unit BuyGoodsBuyShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer, Uni, DB,
  MemDS, ImgList, Menus, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxPSPrVwRibbon, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TBuyGoodsBuyShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView1Column10: TcxGridColumn;
    GridTableView1Column12: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
  private
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  BuyGoodsBuyShowForm: TBuyGoodsBuyShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TBuyGoodsBuyShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매입관리/상품별%20매입조회/상품별%20매입조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TBuyGoodsBuyShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    ButtonToolBarSearchButton.Enabled := true;
    ButtonToolBarSearchButton.Enabled := true;
    ConditionToolBarEdit.Enabled      := true;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    ButtonToolBarSearchButton.Enabled := false;
    ButtonToolBarSearchButton.Enabled := false;
    ConditionToolBarEdit.Enabled      := false;
    if GridTableView.DataController.RecordCount = 0 then Exit;
    if GridTableView.DataController.FocusedRecordIndex < 0 then Exit;
    DoSearch;
  end;
end;

procedure TBuyGoodsBuyShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

function TBuyGoodsBuyShowForm.DoSearch:Boolean;
begin
  inherited;
  Result := false;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select d.CD_GOODS, '
             +'       Max(m.NM_MENU) as NM_GOODS, '
             +'       Max(m.NM_SPEC) as NM_SPEC, '
             +'       d.PR_BUY, '
             +'       SUM(d.QTY_BUY) as QTY_BUY, '
             +'       SUM(d.AMT_DUTY+d.AMT_DUTYFREE) as AMT_NET, '
             +'       SUM(d.AMT_TAX) as AMT_TAX, '
             +'       SUM(d.AMT_BUY) as AMT_BUY '
             +'  from SL_BUY_D d inner join '
             +'       MS_MENU  as m on d.CD_HEAD = m.CD_HEAD and d.CD_STORE = m.CD_STORE and d.CD_GOODS = m.CD_MENU '
             +' where d.CD_HEAD  =:P0 '
             +'   and d.CD_STORE =:P1 '
             +'   and d.YMD_BUY between :P2 and :P3 '
             +'   and (d.CD_GOODS =:P4 or m.NM_MENU like ConCat(''%'',:P4,''%'')) '
             +' group by d.CD_GOODS, d.PR_BUY  '
             +' order by d.CD_GOODS ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select StoDW(d.YMD_BUY) as YMD_BUY, '
             +'       d.NO_BUY, '
             +'       ConCat(h.CD_TRDPL,''-'',t.NM_TRDPL) as TRDPL, '
             +'       d.QTY_BUY, '
             +'       d.PR_BUY, '
             +'       d.AMT_DUTY+d.AMT_DUTYFREE as AMT_NET, '
             +'       d.AMT_TAX ,  '
             +'       d.AMT_BUY '
             +'  from SL_BUY_D d inner join '
             +'       SL_BUY_H as h on d.CD_HEAD = h.CD_HEAD and d.CD_STORE = h.CD_STORE and d.YMD_BUY = h.YMD_BUY and d.NO_BUY = h.NO_BUY inner join '
             +'       MS_TRD   as t on h.CD_HEAD = t.CD_HEAD and h.CD_STORE = t.CD_STORE and h.CD_TRDPL = t.CD_TRDPL '
             +' where d.CD_HEAD  = :P0 '
             +'   and d.CD_STORE = :P1 '
             +'   and d.YMD_BUY between :P2 and :P3 '
             +'   and d.CD_GOODS = :P4 '
             +'   and d.PR_BUY   = :P5 '
             +'order by d.YMD_BUY, d.NO_BUY',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index]),
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index]]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end;
end;

end.
