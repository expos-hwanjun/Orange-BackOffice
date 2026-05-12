// 재고 조회 (완료)
unit StockShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, ExtCtrls, AdvToolBarStylers,
  cxGridBandedTableView, StdCtrls, cxRadioGroup, DateUtils, Buttons,
  Math, StrUtils, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, MaskUtils, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockShowForm = class(TInheritShowForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewSurveyQty: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1TrdName: TcxGridBandedColumn;
    GridBandedTableView1StockQtyBef: TcxGridBandedColumn;
    GridBandedTableView1StockBuyAmtBef: TcxGridBandedColumn;
    GridBandedTableView1StockSaleAmtBef: TcxGridBandedColumn;
    GridBandedTableView1BuyQty: TcxGridBandedColumn;
    GridBandedTableView1SaleQty: TcxGridBandedColumn;
    GridBandedTableView1StockBuyAmt: TcxGridBandedColumn;
    GridBandedTableView1StockQty: TcxGridBandedColumn;
    GridBandedTableView2: TcxGridBandedTableView;
    GridBandedTableView2ClassName: TcxGridBandedColumn;
    GridBandedTableView2StockQtyBef: TcxGridBandedColumn;
    GridBandedTableView2StockBuyAmtBef: TcxGridBandedColumn;
    GridBandedTableView2StockSaleAmtBef: TcxGridBandedColumn;
    GridBandedTableView2StockBuy: TcxGridBandedColumn;
    GridBandedTableView2StockSale: TcxGridBandedColumn;
    GridBandedTableView2StockQty: TcxGridBandedColumn;
    GridBandedTableView2StockBuyAmt: TcxGridBandedColumn;
    GridTableViewCompany: TcxGridColumn;
    GridBandedTableView1DisuseQty: TcxGridBandedColumn;
    GridBandedTableView1SilsaQty: TcxGridBandedColumn;
    GridBandedTableView2StockDisuse: TcxGridBandedColumn;
    GridBandedTableView2StockSilsa: TcxGridBandedColumn;
    GridLevel3: TcxGridLevel;
    GridBandedTableView3: TcxGridBandedTableView;
    GridBandedTableView3GoodsCode: TcxGridBandedColumn;
    GridBandedTableView3GoodsName: TcxGridBandedColumn;
    GridBandedTableView3Spec: TcxGridBandedColumn;
    GridBandedTableView3StockQtyBef: TcxGridBandedColumn;
    GridBandedTableView3BuyQty: TcxGridBandedColumn;
    GridBandedTableView3SaleQty: TcxGridBandedColumn;
    GridBandedTableView3DisuseQty: TcxGridBandedColumn;
    GridBandedTableView3SilsaQty: TcxGridBandedColumn;
    GridBandedTableView3StockQty: TcxGridBandedColumn;
    GridBandedTableView3StockBuyAmt: TcxGridBandedColumn;
    GridLevel4: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Date: TcxGridColumn;
    GridTableView1Gubun: TcxGridColumn;
    GridTableView1Qty: TcxGridColumn;
    GridTableView1Price: TcxGridColumn;
    GridTableView1Amount: TcxGridColumn;
    GridTableView1BuyTrd: TcxGridColumn;
    GridTableView1RcpNo: TcxGridColumn;
    GridBandedTableView1TrdCode: TcxGridBandedColumn;
    GridBandedTableView2ClassCode: TcxGridBandedColumn;
    GridTableView1Seq: TcxGridColumn;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView2StockReturn: TcxGridBandedColumn;
    GridBandedTableView3Column1: TcxGridBandedColumn;
    GridTableViewMenuType: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridBandedTableView3CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridBandedTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridBandedTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GridTableView1DataControllerFilterChanged(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridBandedTableView3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
    SearchGubun :Integer;  //상품수불 조회구분(0:상품, 1:거래처, 2:분류)
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;
var
  StockShowForm: TStockShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode    := pmPreviewExcel;
  DefaultDate  := ddToday;
  SearchGubun  := 0;
  ConditionToolBarEditLabel.Hint := ConditionToolBarEdit.Hint;
end;

procedure TStockShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  case Grid.ActiveLevel.Index of
    0 :
    begin
      ConditionToolBarDateToLabel.Visible := False;
      ConditionToolBarToDateEdit.Visible  := False;
      GridLevel3.Caption := ' 상품별 수불';
      ButtonToolBarPrintButtonPopupMenuReceipt.Visible := true;
    end;
    1,2,3,4:
    begin
      ConditionToolBarDateToLabel.Visible := True;
      ConditionToolBarToDateEdit.Visible  := True;
      ButtonToolBarPrintButtonPopupMenuReceipt.Visible := false;
    end;
  end;
  GridLevel4.Caption := '상품장';
//  ConditionToolBarEdit.Clear;
end;

procedure TStockShowForm.GridBandedTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridBandedTableView1.DataController.RecordCount = 0 then Exit;
  isLoading := true;
  SearchGubun := 1;  //상품수불 거래처조회
  GridLevel3.Caption := '['+GridBandedTableView1.DataController.Values[GridBandedTableView1.DataController.GetFocusedRecordIndex, GridBandedTableView1TrdName.Index]+'] 상품수불 조회';
  Grid.ActiveLevel := GridLevel3;
  DoSearch;
  isLoading := false;
end;

procedure TStockShowForm.GridBandedTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridBandedTableView2.DataController.RecordCount = 0 then Exit;
  isLoading   := true;
  SearchGubun := 2;  //상품수불 분류조회
  GridLevel3.Caption := '['+GridBandedTableView2.DataController.Values[GridBandedTableView2.DataController.GetFocusedRecordIndex, GridBandedTableView2ClassName.Index]+'] 상품수불 조회';
  Grid.ActiveLevel := GridLevel3;
  DoSearch;
  isLoading := false;
end;

procedure TStockShowForm.GridBandedTableView3CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridBandedTableView3.DataController.RecordCount = 0 then Exit;
  isLoading := true;
  Grid.ActiveLevel := GridLevel4;
  GridLevel4.Caption        := '['+GridBandedTableView3.DataController.Values[GridBandedTableView3.DataController.GetFocusedRecordIndex, GridBandedTableView3GoodsName.Index]+'] 상품장';
  ConditionToolBarEdit.Text := GridBandedTableView3.DataController.Values[GridBandedTableView3.DataController.GetFocusedRecordIndex, GridBandedTableView3GoodsCode.Index];
  DoSearch;
  isLoading := false;
end;

procedure TStockShowForm.GridBandedTableView3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridBandedTableView3.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridBandedTableView3StockQty.Index] < 0 then
    AStyle := StyleFontRed;
end;

procedure TStockShowForm.GridTableView1DataControllerFilterChanged(
  Sender: TObject);
var vStockQty :Currency;
    vIndex    :Integer;
begin
  inherited;
  vStockQty := 0;
  try
    GridTableView1.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView1.DataController.FilteredRecordCount-1 do
      case GridTableView1.DataController.Values[GridTableView1.DataController.FilteredRecordIndex[vIndex], GridTableView1Seq.Index] of
        1,2,3 : vStockQty := vStockQty + GridTableView1.DataController.Values[GridTableView1.DataController.FilteredRecordIndex[vIndex], GridTableView1Qty.Index];
        else vStockQty := vStockQty - GridTableView1.DataController.Values[GridTableView1.DataController.FilteredRecordIndex[vIndex], GridTableView1Qty.Index];
      end;
    GridTableView1.DataController.Summary.FooterSummaryValues[0] := vStockQty;
  finally
    GridTableView1.DataController.EndUpdate;
  end;
end;

procedure TStockShowForm.GridTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if (ARecord.Values[GridTableView1Gubun.Index] = '매입') then
    AStyle := StyleFontRed;
end;

procedure TStockShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  isLoading := true;
  SearchGubun := 0;
  Grid.ActiveLevel := GridLevel3;
  ConditionToolBarEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index];
  DoSearch;
  isLoading := false;
end;

procedure TStockShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridTableViewStockQty.Index] < 0 then
    AStyle := StyleFontRed;
end;


//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
procedure TStockShowForm.ClearGrid;
begin
  if isLoading then Exit;

  inherited;

end;

function TStockShowForm.DoSearch:Boolean;
var vSearchText,
    vBefStockSql,
    vStockSql    :String;
    vStockQty :Currency;
    vIndex    :Integer;
begin
  Result := false;
  if RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) <> '01' then
    vBefStockSql :='(select   CD_GOODS, '
                  +'          Sum(Ifnull(QTY_STOCK,0)) as QTY_STOCK '
                  +' from    (select   CD_GOODS, '
                  +'                   QTY_BASE as QTY_STOCK '
                  +'            from   SL_STOCK_MONTH '
                  +'           where   CD_HEAD  =:P0 '
                  +'             and   CD_STORE =:P1 '
                  +'              and  YM_STOCK = Left(:P2, 6) '
                  +'              and  QTY_BASE <> 0 '             //월기초재고
                  +'          union all '
                  +'           select CD_GOODS, '
                  +'                  SUM(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) as QTY_STOCK '
                  +'             from SL_STOCK_DAY '
                  +'            where CD_HEAD  =:P0 '
                  +'              and CD_STORE =:P1 '
                  +Format('       and YMD_STOCK between ''%s'' and ''%s'' ',[LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+'01', DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1))])
                  +'            group by CD_GOODS) as t '
                   +'  group by CD_GOODS) as q on g.CD_MENU = q.CD_GOODS left outer join  '
  else
    //조회기간이 01일부터 시작 할때
    vBefStockSql   := '(select   CD_STORE, '
                   +'            CD_GOODS, '
                   +'            QTY_BASE as QTY_STOCK '
                   +'    from    SL_STOCK_MONTH '
                   +'   where    CD_HEAD  =:P0 '
                   +'     and    CD_STORE =:P1 '
                   +'     and    YM_STOCK = Left(:P3, 6) '
                   +'     and    QTY_BASE <> 0 '             //월기초재고
                   +'  ) as q on g.CD_MENU = q.CD_GOODS left outer join  ';



   vStockSql   := '(select CD_GOODS, '
               +'          Sum(QTY_BUY)     as QTY_BUY, '
               +'          Sum(QTY_RETURN)  as QTY_RETURN, '
               +'          Sum(QTY_SALE)    as QTY_SALE, '
               +'          Sum(QTY_DISUSE)  as QTY_DISUSE, '
               +'          Sum(QTY_ADJ)     as QTY_SILSA, '
               +'          SUM(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) as QTY_STOCK '
               +'     from SL_STOCK_DAY '
               +'    where CD_HEAD  =:P0 '
               +'      and CD_STORE =:P1 '
               +'      and YMD_STOCK between :P3 and :P4 '
               +'    group by CD_GOODS ) as s on g.CD_MENU = s.CD_GOODS '+Ifthen(Grid.ActiveLevel.Index = 3, '', 'left outer join ');

  case Grid.ActiveLevel.Index of
    0 : //GridLevel
    begin
      OpenQuery('select  t.NM_TRDPL, '
               +'         g.CD_MENU as CD_GOODS, '
               +'         g.NM_MENU as NM_GOODS, '
               +'         Ifnull(g.NM_SPEC,'''') as NM_SPEC, '
               +'         Ifnull(s.QTY_STOCK,0) as QTY_STOCK, '
               +'         case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then Ifnull(s.QTY_STOCK,0) * 1000 / 100 else Ifnull(s.QTY_STOCK,0) end * g.PR_SALE as AMT_SALE, '
               +'         case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then Ifnull(s.QTY_STOCK,0) * 1000 / 100 else Ifnull(s.QTY_STOCK,0) end  * g.PR_BUY  as AMT_BUY, '
               +'         g.DS_MENU_TYPE '
               +'from     MS_MENU as g left outer join '
               +'        (select CD_GOODS, '
               +'                Sum(Ifnull(QTY_BASE,0)+Ifnull(QTY_STOCK,0)) as QTY_STOCK '
               +'           from '
               +'                (select CD_GOODS, '
               +'                        Ifnull(QTY_BASE,0) as QTY_BASE, '
               +'                        0 as QTY_STOCK '
               +'                   from SL_STOCK_MONTH  '
               +'                  where CD_HEAD  =:P0 '
               +'                    and CD_STORE =:P1 '
               +'                    and YM_STOCK =Left(:P2, 6) '
               +'                 union all '
               +'                 select CD_GOODS, '
               +'                        0, '
               +'                        Sum(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) '
               +'                   from SL_STOCK_DAY '
               +'                  where CD_HEAD  =:P0 '
               +'                    and CD_STORE =:P1 '
               +'                    and YMD_STOCK between ConCat(Left(:P2,6),''01'') and :P2 '
               +'                  group by CD_GOODS '
               +'                 ) as t '
               +'           group by CD_GOODS '
               +'         ) as s on s.CD_GOODS = g.CD_MENU left outer join '
               +'         MS_TRD   as t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''B'' '
               +' where g.CD_HEAD  =:P0 '
               +'   and g.CD_STORE =:P1 '
               +'   and g.DS_STOCK = ''1'' '
               +'   and (g.CD_MENU =:P3 or g.NM_MENU like ConCat(''%'',:P3,''%''))  '
               +'   and g.YN_USE = ''Y'' '
               +' order by g.CD_MENU ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                ConditionToolBarEdit.Text]);
      Result := DM.ReadQuery(Query, GridTableView);
    end;
    1 : //GridLevel1
    begin
      OpenQuery('select Ifnull(CD_TRDPL, '''') as CD_TRDPL, '
               +'       Ifnull(Max(NM_TRDPL), ''[미지정]'') as NM_TRDPL, '
               +'       SUM(QTY_STOCK_BEF) as QTY_STOCK_BEF, '
               +'       SUM(AMT_BUY_BEF)   as AMT_BUY_BEF, '
               +'       SUM(AMT_SALE_BEF)  as AMT_SALE_BEF, '
               +'       SUM(QTY_BUY)       as QTY_BUY, '
               +'       SUM(QTY_RETURN)    as QTY_RETURN, '
               +'       SUM(QTY_SALE*-1)   as QTY_SALE, '
               +'       SUM(QTY_DISUSE) as QTY_DISUSE, '
               +'       SUM(QTY_SILSA)  as QTY_SILSA, '
               +'       SUM(QTY_STOCK)  as QTY_STOCK, '
               +'       SUM(AMT_BUY)    as AMT_BUY, '
               +'       SUM(AMT_SALE)   as AMT_SALE '
               +'from  (select   t.CD_TRDPL, '
               +'                t.NM_TRDPL, '
               +'                Ifnull(q.QTY_STOCK,0)   as QTY_STOCK_BEF, '
               +'                Ifnull(q.QTY_STOCK,0) * g.PR_BUY  as AMT_BUY_BEF, '
               +'                Ifnull(q.QTY_STOCK,0) * g.PR_SALE as AMT_SALE_BEF, '
               +'                Ifnull(s.QTY_BUY,0)    as QTY_BUY, '
               +'                Ifnull(s.QTY_RETURN,0) as QTY_RETURN, '
               +'                Ifnull(s.QTY_SALE,0)   as QTY_SALE, '
               +'                Ifnull(s.QTY_DISUSE,0) as QTY_DISUSE, '
               +'                Ifnull(s.QTY_SILSA,0)  as QTY_SILSA, '
               +'                Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)  as QTY_STOCK, '
               +'                case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) * 1000 / 100 else (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) end * g.PR_BUY  as AMT_BUY, '
               +'                case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) * 1000 / 100 else (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) end * g.PR_SALE as AMT_SALE  '
               +'        from    MS_MENU as g left outer join '
               //               --############ 전재고 ###########
               + vBefStockSql
               //         --###########  기간재고  ##########
               + vStockSql
               +'                 MS_TRD   as t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''B'' '
               +'        where g.CD_HEAD  = :P0 '
               +'          and g.CD_STORE = :P1 '
               +'          and g.DS_STOCK = ''1'' '
               +'          and g.YN_USE   = ''Y'' '
               +'        ) as t1 '
               +'where t1.CD_TRDPL = :P5 or t1.NM_TRDPL like ConCat(''%'',:P5,''%'') '
               +'group by t1.CD_TRDPL '
               +'order by t1.CD_TRDPL ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ConditionToolBarEdit.Text]);
      Result :=DM.ReadQuery(Query, GridBandedTableView1);
    end;
    2 : //GridLevel2
    begin
      OpenQuery('select Ifnull(CD_CLASS, '''') as CD_CLASS, '
               +'       Ifnull(NM_CLASS, ''[미지정]'') as NM_CLASS, '
               +'       SUM(QTY_STOCK_BEF) as QTY_STOCK_BEF, '
               +'       SUM(AMT_BUY_BEF)   as AMT_BUY_BEF, '
               +'       SUM(AMT_SALE_BEF)  as AMT_SALE_BEF, '
               +'       SUM(QTY_BUY)    as QTY_BUY, '
               +'       SUM(QTY_RETURN)    as QTY_RETURN, '
               +'       SUM(QTY_SALE*-1)   as QTY_SALE, '
               +'       SUM(QTY_DISUSE) as QTY_DISUSE, '
               +'       SUM(QTY_SILSA)  as QTY_SILSA, '
               +'       SUM(QTY_STOCK)  as QTY_STOCK, '
               +'       SUM(AMT_BUY)    as AMT_BUY, '
               +'       SUM(AMT_SALE)   as AMT_SALE '
               +'from  (select   t.CD_CLASS, '
               +'                t.NM_CLASS, '
               +'                Ifnull(q.QTY_STOCK,0) as QTY_STOCK_BEF, '
               +'                Ifnull(q.QTY_STOCK,0) * g.PR_BUY   as AMT_BUY_BEF, '
               +'                Ifnull(q.QTY_STOCK,0) * g.PR_SALE  as AMT_SALE_BEF, '
               +'                Ifnull(s.QTY_BUY,0)  as QTY_BUY, '
               +'                Ifnull(s.QTY_RETURN,0) as QTY_RETURN, '
               +'                Ifnull(s.QTY_SALE,0) as QTY_SALE, '
               +'                Ifnull(s.QTY_DISUSE,0) as QTY_DISUSE, '
               +'                Ifnull(s.QTY_SILSA,0) as QTY_SILSA, '
               +'                Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0) as QTY_STOCK, '
               +'                case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) * 1000 / 100 else (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) end * g.PR_BUY  as AMT_BUY, '
               +'                case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) * 1000 / 100 else (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) end * g.PR_SALE as AMT_SALE  '
               +'        from    MS_MENU as g left outer join '
               //               --############ 전재고 ###########
               + vBefStockSql
               //         --###########  기간재고  ##########
               + vStockSql
               +'                 MS_MENU_CLASS   as t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and LEFT(g.CD_CLASS,2) = LEFT(t.CD_CLASS,2) and Length(t.CD_CLASS)=2 '//left outer join'
//               +'                 MS_TRD   as m on g.CD_STORE = m.CD_STORE and g.CD_TRDPL = m.CD_TRDPL and m.DS_TRDPL not in (''R'',''C'',''E'') '
               +'        where g.CD_HEAD   =:P0 '
               +'          and g.CD_STORE = :P1 '
               +'          and g.DS_STOCK = ''1'' '
               +'          and g.YN_USE   = ''Y'' '
               +'        ) as t1 '
               +' where t1.NM_CLASS like ConCat(''%'',:P5,''%'') '
               +' group by t1.CD_CLASS, t1.NM_CLASS '
               +' order by t1.NM_CLASS ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ConditionToolBarEdit.Text]);
      Result := DM.ReadQuery(Query, GridBandedTableView2);
    end;
    3 : //GridLevel3
    begin
      case SearchGubun of
        0 :
        begin
          vSearchText := ConditionToolBarEdit.Text;
          GridLevel3.Caption := ' 상품별 수불';
        end;
        1 : vSearchText := GridBandedTableView1.DataController.Values[GridBandedTableView1.DataController.GetFocusedRecordIndex, GridBandedTableView1TrdCode.Index];
        2 : vSearchText := GridBandedTableView2.DataController.Values[GridBandedTableView2.DataController.GetFocusedRecordIndex, GridBandedTableView2ClassCode.Index];
      end;
      OpenQuery('select   g.CD_MENU as CD_GOODS, '
               +'         g.NM_MENU as NM_GOODS, '
               +'         Ifnull(q.QTY_STOCK,0) as QTY_STOCK_BEF, '
               +'         Ifnull(s.QTY_BUY,0)  as QTY_BUY, '
               +'         Ifnull(s.QTY_RETURN,0)  as QTY_RETURN, '
               +'         Ifnull(s.QTY_SALE,0) * -1 as QTY_SALE, '
               +'         Ifnull(s.QTY_DISUSE,0) as QTY_DISUSE, '
               +'         Ifnull(s.QTY_SILSA,0) as QTY_SILSA, '
               +'         Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0) as QTY_STOCK, '
               +'         case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) * 1000 / 100 else (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) end * g.PR_BUY   as AMT_BUY, '
               +'         case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) * 1000 / 100 else (Ifnull(q.QTY_STOCK,0) + Ifnull(s.QTY_STOCK,0)) end * g.PR_SALE  as AMT_SALE '
               +' from    MS_MENU as g left outer join '
               // --############ 전재고 ###########
               + vBefStockSql
               // --###########  기간재고  ##########
               + vStockSql
               +'  where g.CD_HEAD  = :P0 '
               +'    and g.CD_STORE = :P1 '
               +'    and g.DS_STOCK = ''1'' '
               +'    and g.YN_USE = ''Y'' '
               +IfThen(SearchGubun=0, 'and (g.CD_MENU = :P5 or g.NM_MENU like ConCat(''%'',:P5,''%'')) ', '')
               +Ifthen(SearchGubun=1, 'and g.CD_TRDPL =:P5 ','')
               +Ifthen(SearchGubun=2, 'and g.CD_CLASS =:P5 ','')
               +' order by g.CD_MENU ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 vSearchText]);
      DM.ReadQuery(Query, GridBandedTableView3);
      Result := GridBandedTableView3.DataController.RecordCount > 0;
      SearchGubun := 0;
    end;
    4 :
    begin
      if ConditionToolBarEdit.Text = EmptyStr then
      begin
        MsgBox('조회할 상품코드를 입력하십시오.');
        ConditionToolBarEdit.SetFocus;
        Exit;
      end;

      OpenQuery('select  '''' as YMD_BUY, '
               +'         1 as SEQ,  '
               +'         ''전재고'' as DS_GUBUN, '
               +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) <> '01', ' GetStockCount(:P0,:P1,:P4,DATE_FORMAT(DATE_SUB(DATE(:P2), INTERVAL 1 DAY),''%Y%m%d'')) as QTY_BUY, '
                ,'         QTY_BASE as QTY_BUY, ')
               +'         0 as PR_BUY, '
               +'         0 as AMT_BUY, '
               +'         '''' as NM_TRDPL, '
               +'         '''' as NO_BUY '
               +'   from SL_STOCK_MONTH '
               +'  where CD_HEAD  = :P0 '
               +'    and CD_STORE = :P1 '
               +'    and YM_STOCK = Left(:P2,6) '
               +'    and CD_GOODS = :P4 '
               +' union all '
               +' select StoDW(a.YMD_BUY) as YMD_BUY, '
               +'         2 as seq, '
               +'         ''매입'' as DS_GUBUN,  '
               +'         a.QTY_BUY,  '
               +'         a.PR_BUY, '
               +'         a.AMT_BUY, '
               +'         c.NM_TRDPL, '
               +'         ConCat(a.YMD_BUY,''-'',a.NO_BUY) '
               +'   from SL_BUY_D a inner join '
               +'        SL_BUY_H b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.YMD_BUY = b.YMD_BUY and a.NO_BUY = b.NO_BUY inner join  '
               +'        MS_TRD   c on b.CD_HEAD = c.CD_HEAD and b.CD_STORE = c.CD_STORE and b.CD_TRDPL = c.CD_TRDPL inner join '
               +'        MS_MENU  d on a.CD_HEAD = d.CD_HEAD and a.CD_STORE = d.CD_STORE and a.CD_GOODS = d.CD_MENU  '
               +'  where a.CD_HEAD  =:P0 '
               +'    and a.CD_STORE =:P1 '
               +'    and a.YMD_BUY between :P2 and :P3 '
               +'    and a.CD_GOODS= :P4 '
               +'    and b.DS_BUY = ''B'' '
               +' union all  '
               +' select StoDW(a.YMD_BUY) as YMD_BUY, '
               +'         2 as seq, '
               +'         ''반품'' as DS_GUBUN,  '
               +'         a.QTY_BUY,  '
               +'         a.PR_BUY, '
               +'         a.AMT_BUY, '
               +'         c.NM_TRDPL, '
               +'         ConCat(a.YMD_BUY,''-'',a.NO_BUY) '
               +'   from SL_BUY_D a inner join '
               +'        SL_BUY_H b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.YMD_BUY = b.YMD_BUY and a.NO_BUY = b.NO_BUY inner join  '
               +'        MS_TRD   c on b.CD_HEAD = c.CD_HEAD and b.CD_STORE = c.CD_STORE and b.CD_TRDPL = c.CD_TRDPL inner join '
               +'        MS_MENU  d on a.CD_HEAD = d.CD_HEAD and a.CD_STORE = d.CD_STORE and a.CD_GOODS = d.CD_MENU  '
               +'  where a.CD_HEAD  =:P0 '
               +'    and a.CD_STORE =:P1 '
               +'    and a.YMD_BUY between :P2 and :P3 '
               +'    and a.CD_GOODS = :P4 '
               +'    and b.DS_BUY = ''R'' '
               +' union all  '
               +' select StoDW(a.YMD_SALE) as YMD_BUY, '
               +'        5 as seq, '
               +'        ''판매'', '
               +'        case when b.DS_MENU_TYPE = ''W''  THEN a.QTY_SALE / 1000 '
			         +'             else case when b.DS_MENU_TYPE in (''N'',''G'') and  b.QTY_UNIT > 1 then a.QTY_SALE * b.QTY_UNIT / 1000 '
			         +'                       else a.QTY_SALE  end '
			         +'        end as QTY_SALE, '
               +'        a.PR_SALE, '
               +'        a.AMT_SALE, '
               +'        '''', '
               +'        ConCat(a.YMD_SALE,''-'',a.NO_POS,''-'',a.NO_RCP)  '
               +'   from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
               +'        MS_MENU      b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU '
               +'  where a.CD_HEAD  =:P0 '
               +'    and a.CD_STORE =:P1 '
               +'    and a.YMD_SALE between :P2 and :P3 '
               +'    and a.CD_MENU = :P4 '
               +'    and a.DS_SALE <> ''V'' '
               +' union all  '
               +' select StoDW(a.YMD_SALE) as YMD_BUY, '
               +'        6 as seq, '
               +'        ''부메뉴판매'', '
               +'        case when b.DS_MENU_TYPE = ''W''  THEN a.QTY_SALE / 1000 '
			         +'             else case when b.DS_MENU_TYPE in (''N'',''G'') and  b.QTY_UNIT > 1 then a.QTY_SALE * b.QTY_UNIT / 1000 '
			         +'                       else a.QTY_SALE  end '
			         +'        end as QTY_SALE, '
               +'        a.PR_SALE, '
               +'        a.QTY_SALE*a.PR_SALE as AMT_SALE, '
               +'        '''', '
               +'        ConCat(a.YMD_SALE,''-'',a.NO_POS,''-'',a.NO_RCP)  '
               +'   from SL_SALE_S     a inner join '
               +'        MS_MENU       b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU '
               +'  where a.CD_HEAD  =:P0 '
               +'    and a.CD_STORE =:P1 '
               +'    and a.YMD_SALE between :P2 and :P3 '
               +'    and a.CD_MENU = :P4 '
               +' union all '
               +' select StoDW(YMD_SILSA) as YMD_BUY, '
               +'        7 as seq, '
               +'        ''실사'', '
               +'        QTY_SETTLE, '
               +'        0, '
               +'        0, '
               +'        '''', '
               +'        ''''  '
               +'   from SL_SILSA '
               +'  where CD_HEAD  =:P0 '
               +'    and CD_STORE =:P1 '
               +'    and YMD_SILSA between :P2 and :P3 '
               +'    and CD_GOODS = :P4 '
               +'    and QTY_SETTLE is not null '
               +' union all '
               +' select StoDW(YMD_DISUSE) as YMD_BUY, '
               +'        8 as seq, '
               +'        ''폐기'', '
               +'        QTY_DISUSE, '
               +'        0, '
               +'        0, '
               +'        '''', '
               +'        '''' '
               +'   from SL_DISUSE  '
               +'  where CD_HEAD  =:P0 '
               +'    and CD_STORE =:P1 '
               +'    and YMD_DISUSE between :P2 and :P3 '
               +'    and CD_GOODS = :P4 '
               +'  order by 1,2',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ConditionToolBarEdit.Text]);
      Result :=  DM.ReadQuery(Query, GridTableView1);
      vStockQty := 0;
      try
        GridTableView1.DataController.BeginUpdate;
        for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
          case GridTableView1.DataController.Values[vIndex, GridTableView1Seq.Index] of
            1,2,3,7 : vStockQty := vStockQty + GridTableView1.DataController.Values[vIndex, GridTableView1Qty.Index];
            else vStockQty := vStockQty - GridTableView1.DataController.Values[vIndex, GridTableView1Qty.Index];
          end;

        GridTableView1.DataController.Summary.FooterSummaryValues[0] := vStockQty;
      finally
        GridTableView1.DataController.EndUpdate;
      end;
    end;
  end;
//  inherited;
end;

procedure TStockShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  if Grid.ActiveLevel.Index <> 0 then Exit;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;

  vPrintData := rptSizeBoth + rptAlignCenter + '재고내역'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'    메뉴명 '+rptpStr+'               규격        재고'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    if DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewMenuType.Index] <> 'W' then
    begin
      vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsName.Index] ,1,16+(PrintBlank div 2)),24+PrintBlank,' ')
                             + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsSpec.Index], 12, ' ')
                             + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewStockQty.Index]),6, ' ')+#13;
    end
    else
    begin
      vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsName.Index] ,1,16+(PrintBlank div 2)),21+PrintBlank,' ')
                             + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsSpec.Index], 12, ' ')
                             + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewStockQty.Index]),9, ' ')+#13;
    end;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

end.
