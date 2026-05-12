unit StockOutofStockGoodsShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  ImgList, Menus, AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, DateUtils, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TStockOutofStockGoodsShowForm = class(TInheritShowForm)
    GridTableViewTrdCode: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewEXPECT: TcxGridColumn;
    GridTableViewEXPECT5: TcxGridColumn;
    GridTableViewEXPECT10: TcxGridColumn;
    GridTableViewEXPECT15: TcxGridColumn;
    GridTableViewEXPECT20: TcxGridColumn;
    GridTableViewEXPECT25: TcxGridColumn;
    GridTableViewEXPECT30: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1GoodsCode: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1OrderQty: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1EXPECT: TcxGridColumn;
    GridTableView1EXPECT5: TcxGridColumn;
    GridTableView1EXPECT10: TcxGridColumn;
    GridTableView1EXPECT15: TcxGridColumn;
    GridTableView1EXPECT20: TcxGridColumn;
    GridTableView1EXPECT25: TcxGridColumn;
    GridTableView1EXPECT30: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableViewDblClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableView1DataControllerAfterPost(
      ADataController: TcxCustomDataController);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  StockOutofStockGoodsShowForm: TStockOutofStockGoodsShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}


procedure TStockOutofStockGoodsShowForm.ButtonToolBarSaveButtonClick(
  Sender: TObject);
var  vIndex: Integer;
begin
  inherited;
  try
  if not AskBox('발주상품 목록에 저장하시겠습니까?') then Exit;
    BeginTrans;
    for vIndex := 0 to GridTableView1.DataController.RecordCount - 1 do
    begin
      if NVL(GridTableView1.DataController.Values[vIndex, GridTableView1OrderQty.Index],0) <= 0 then Continue;
      Query.Close;
      if not OpenQuery('select CD_GOODS '
                      +'from   SL_ORDER_REQUEST '
                      +'where  CD_STORE =:P0 '
                      +'  and  DS_ORDER =''4'' '
                      +'  and  CD_GOODS =:P1 ',
                      [StoreCode,
                       GridTableView.DataController.Values[vIndex, GridTableView1GoodsCode.Index]]) then
      begin
        Query.Close;
        ExecQuery('insert into SL_ORDER_REQUEST(CD_STORE, '
                 +'                             DS_ORDER, '
                 +'                             CD_GOODS, '
                 +'                             QTY_REQUEST, '
                 +'                             PR_BUY, '
                 +'                             PR_SALE, '
                 +'                             CD_SAWON, '
                 +'                             DT_CHANGE) '
                 +'                     values (:P0, '
                 +'                             ''4'', '
                 +'                             :P1, '
                 +'                             :P2, '
                 +'                             0, '
                 +'                             0, '
                 +'                             :P3, '
                 +'                             GetDate() ) ',
                 [StoreCode,
                  GridTableView1.DataController.Values[vIndex, GridTableView1GoodsCode.Index],
                  Abs(GridTableView1.DataController.Values[vIndex, GridTableView1OrderQty.Index]),
                  UserCode],
                  false);
      end;
    end;
    CommitTrans;
    MsgBox(msgSaved);
    for vIndex := 0 to GridTableView1.DataController.RecordCount - 1 do
      GridTableView1.DataController.Values[vIndex, GridTableView1OrderQty.Index] := null;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;

procedure TStockOutofStockGoodsShowForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  case ConditionToolBarComboBox.ItemIndex of
    1 : //전월
    begin
      ConditionToolBarFromDateEdit.Date := IncMonth(now, -1);
      ConditionToolBarToDateEdit.Date   := now();
    end;
    2 : //최근3개월
    begin
      ConditionToolBarFromDateEdit.Date := IncMonth(now, -3);
      ConditionToolBarToDateEdit.Date   := now();
    end;
    3 : //최근6개월
    begin
      ConditionToolBarFromDateEdit.Date := IncMonth(now, -6);
      ConditionToolBarToDateEdit.Date   := now();
    end;
    4 : //전년 3개월
    begin
      ConditionToolBarFromDateEdit.Date := IncMonth(now, -15);
      ConditionToolBarToDateEdit.Date   := IncYear(now(),-1);
    end;
    5 : //전년 6개월
    begin
      ConditionToolBarFromDateEdit.Date := IncMonth(now, -18);
      ConditionToolBarToDateEdit.Date   := IncYear(now(),-1);
    end;
  end;
end;

function TStockOutofStockGoodsShowForm.DoSearch:Boolean;
begin
  inherited;
  ButtonToolBarSaveButton.Enabled := false;
  Grid.ActiveLevel := GridLevel;
  OpenQuery('select isnull(m.CD_TRDPL,'''') as CD_TRDPL, '
           +'       isnull(max(m.NM_TRDPL), ''[ 미등록 ]'') as NM_TRDPL, '
           +'       isnull(sum(t.QTY_EXPECT),0)    as QTY_EXPECT, '
           +'       isnull(sum(t.QTY_EXPECT5),0)	  as QTY_EXPECT5, '
           +'       isnull(sum(t.QTY_EXPECT10),0)  as QTY_EXPECT10, '
           +'       isnull(sum(t.QTY_EXPECT15),0)  as QTY_EXPECT15, '
           +'       isnull(sum(t.QTY_EXPECT20),0)  as QTY_EXPECT20, '
           +'       isnull(sum(t.QTY_EXPECT25),0)  as QTY_EXPECT25, '
           +'       isnull(sum(t.QTY_EXPECT30),0)  as QTY_EXPECT30 '
           +'  from '
           +'      ( '
           +'       select t.CD_STORE, '
           +'              t.CD_GOODS, '
           +'              g.CD_TRDPL, '
           +'              case when t.QTY_STOCK - (t.DAY_SALE*1)  <= g.QTY_SAFETY then 1 else 0 end as QTY_EXPECT, '
           +'              case when t.QTY_STOCK - (t.DAY_SALE*5)  <= g.QTY_SAFETY then 1 else 0 end as QTY_EXPECT5, '
           +'              case when t.QTY_STOCK - (t.DAY_SALE*10) <= g.QTY_SAFETY then 1 else 0 end as QTY_EXPECT10, '
           +'              case when t.QTY_STOCK - (t.DAY_SALE*15) <= g.QTY_SAFETY then 1 else 0 end as QTY_EXPECT15, '
           +'              case when t.QTY_STOCK - (t.DAY_SALE*20) <= g.QTY_SAFETY then 1 else 0 end as QTY_EXPECT20, '
           +'              case when t.QTY_STOCK - (t.DAY_SALE*25) <= g.QTY_SAFETY then 1 else 0 end as QTY_EXPECT25, '
           +'              case when t.QTY_STOCK - (t.DAY_SALE*30) <= g.QTY_SAFETY then 1 else 0 end as QTY_EXPECT30 '
           +'        from '
           +'            ( '
           +'             select d.CD_STORE, '
           +'                    d.CD_GOODS, '
           +'                    CONVERT(FLOAT,SUM(QTY_SALE)) / DATEDIFF(d, CONVERT(DATETIME,:P1), CONVERT(DATETIME,:P2)) as DAY_SALE, '
           +'                    isnull(k.QTY_STOCK,0) as QTY_STOCK '
           +'               from SL_SALE_D_SUM d (nolock) left outer join '
           +'                    ( '
           +'                      select t.CD_STORE, '
           +'                             t.CD_GOODS, '
           +'                             sum(isnull(t.QTY_STOCK,0) + isnull(t.QTY_LOSS,0)) + sum(isnull(t.QTY_ORDER,0)) as QTY_STOCK '
           +'                        from '
           +'                            ( '
           +'                              select  CD_STORE, '
           +'                                      CD_GOODS, '
           +'                                      QTY_BASE as QTY_STOCK, '
           +'                                      0        as QTY_LOSS, '
           +'                                      0        as QTY_ORDER '
           +'                               from   SL_STOCK_MONTH (nolock) '
           +'                               where  CD_STORE = :P0 '
           +'                                 and  YM_STOCK = Left(:P3, 6) '
           +'                                 and  QTY_BASE <> 0 '
           +'                               union all '
           +'                              select  b.CD_STORE, '
           +'                                      g.CD_GOODS_T as CD_GOODS, '
           +'                                      Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                                      0 as QTY_LOSS, '
           +'                                      0 as QTY_ORDER '
           +'                                from  SL_BUY_D as b (nolock) inner join '
           +'                                      MS_GOODS as g (nolock) on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                               where  b.CD_STORE = :P0 '
           +'                                 and  b.YMD_BUY between Left(:P3, 6) + ''01'' and :P3 '
           +'                               group by b.CD_STORE, g.CD_GOODS_T '
           +'                               union all '
           +'                               select s.CD_STORE, '
           +'                                      g.CD_GOODS_T as CD_GOODS,'
           +'                                    - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK,'
           +'                                      0 as QTY_LOSS, '
           +'                                      0 as QTY_ORDER '
           +'                                 from SL_SALE_D_SUM as s (nolock) inner join  '
           +'                                      MS_GOODS  as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                                where s.CD_STORE = :P0 '
           +'                                  and s.YMD_SALE between Left(:P3, 6) + ''01'' and :P3 '
           +'                               group by s.CD_STORE, g.CD_GOODS_T '
           +'                               union all '
           +'                               select d.CD_STORE, '
           +'                                      g.CD_GOODS_T as CD_GOODS, '
           +'                                      - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                                      null as QTY_LOSS, '
           +'                                      0 as QTY_ORDER '
           +'                                from  SL_DISUSE as d (nolock) inner join  '
           +'                                      MS_GOODS  as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''   '
           +'                               where  d.CD_STORE = :P0 '
           +'                                 and  d.YMD_DISUSE between Left(:P3, 6) + ''01'' and :P3  '
           +'                               group by d.CD_STORE, g.CD_GOODS_T '
           +'                               union all '
           +'                               select s.CD_STORE, '
           +'                                      g.CD_GOODS_T as CD_GOODS, '
           +'                                      0 as QTY_STOCK, '
           +'                                      - Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_LOSS,  '
           +'                                      0 as QTY_ORDER '
           +'                                from  SL_SILSA as s (nolock) inner join '
           +'                                      MS_GOODS as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                               where  s.CD_STORE = :P0 '
           +'                                 and  s.YM_SILSA = Left(:P3, 6) '
           +'                                 and  Convert(varchar(8), s.DT_CHANGE, 112) between Left(:P3, 6) + ''01'' and :P3 '
           +'                                 and  s.QTY_SETTLE is not null '
           +'                               group by s.CD_STORE, g.CD_GOODS_T '
           +'                               union all '
           +'                               select d.CD_STORE, '
           +'                                      g.CD_GOODS_T as CD_GOODS, '
           +'                                      0 as QTY_STOCK, '
           +'                                      0 as QTY_LOSS, '
           +'                                      Sum(d.QTY_ORDER * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_ORDER '
           +'                                from  SL_ORDER_D as d (nolock) inner join  '
           +'                                      SL_ORDER_H as h (nolock) on d.CD_STORE = h.CD_STORE and d.YMD_ORDER = h.YMD_ORDER and d.NO_ORDER = h.NO_ORDER and h.DS_ORDER = ''O'' inner join  '
           +'                                      MS_GOODS   as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                               where  d.CD_STORE = :P0  '
           +'                                 and  d.YMD_ORDER between Left(:P3, 6) + ''01'' and :P3 '
           +'                               group by d.CD_STORE, g.CD_GOODS_T '
           +'                               union all '
           +'                               select   t.CD_STORE, '
           +'                                        g.CD_GOODS_T     as CD_GOODS, '
           +'                                        -Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                                        null as QTY_LOSS, '
           +'                                        0 '
           +'                               from     SL_TRANS_D as t (nolock) inner join '
           +'                                        MS_GOODS   as g (nolock) on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
           +'                               where    t.CD_STORE  = :P0 '
           +'                                 and    t.YMD_TRANS between Left(:P3, 6) + ''01'' and :P3  '
           +'                                 and    t.DS_STATUS = '''+TransReceive+''' '
           +'                               group by t.CD_STORE, g.CD_GOODS_T '
           +'                               union all '
           +'                               select   t.CD_STORE_RECEIVE as CD_STORE, '
           +'                                        g.CD_GOODS_T       as CD_GOODS, '
           +'                                        Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                                        null as QTY_LOSS, '
           +'                                        0 '
           +'                               from     SL_TRANS_D as t (nolock) inner join '
           +'                                        MS_GOODS   as g (nolock) on t.CD_STORE_RECEIVE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
           +'                               where    t.CD_STORE_RECEIVE = :P0 '
           +'                                 and    t.YMD_TRANS between Left(:P3, 6) + ''01'' and :P3  '
           +'                                 and    t.DS_STATUS        = '''+TransReceive+''' '
           +'                               group by t.CD_STORE_RECEIVE, g.CD_GOODS_T '
           +'                            ) t '
           +'                           group by t.CD_STORE, t.CD_GOODS '
           +'                    ) as k on d.CD_STORE = k.CD_STORE and d.CD_GOODS = k.CD_GOODS '
           +'              where d.CD_STORE = :P0 '
           +'                and d.YMD_SALE between :P1 and :P2 '
           +'              group by d.CD_STORE, d.CD_GOODS, k.QTY_STOCK '
           +'             ) as t inner join  '
           +'             MS_GOODS g (nolock) on t.CD_STORE= g.CD_STORE and t.CD_GOODS = g.CD_GOODS_T and g.CD_GOODS = g.CD_GOODS_T and g.DS_STOCK = ''0''  '
           +'      ) t left outer join '
           +'      MS_TRD m on t.CD_STORE = m.CD_STORE and t.CD_TRDPL = m.CD_TRDPL '
           +'   group by  m.CD_TRDPL ',
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             FormatDateTime('yyyymmdd',now()) ]);
  Result := DM.ReadQuery(Query, GridTableView, nil);
end;

procedure TStockOutofStockGoodsShowForm.FormCreate(Sender: TObject);
begin
  GridTableView1EXPECT.Caption   := FormatDateTime('m"/"d', now);
  GridTableView1EXPECT5.Caption  := FormatDateTime('m"/"d', IncDay(now, 5));
  GridTableView1EXPECT10.Caption := FormatDateTime('m"/"d', IncDay(now,10));
  GridTableView1EXPECT15.Caption := FormatDateTime('m"/"d', IncDay(now,15));
  GridTableView1EXPECT20.Caption := FormatDateTime('m"/"d', IncDay(now,20));
  GridTableView1EXPECT25.Caption := FormatDateTime('m"/"d', IncDay(now,25));
  GridTableView1EXPECT30.Caption := FormatDateTime('m"/"d', IncDay(now,30));

  GridTableViewEXPECT.Caption   := FormatDateTime('m"/"d', now);
  GridTableViewEXPECT5.Caption  := FormatDateTime('m"/"d', IncDay(now, 5));
  GridTableViewEXPECT10.Caption := FormatDateTime('m"/"d', IncDay(now,10));
  GridTableViewEXPECT15.Caption := FormatDateTime('m"/"d', IncDay(now,15));
  GridTableViewEXPECT20.Caption := FormatDateTime('m"/"d', IncDay(now,20));
  GridTableViewEXPECT25.Caption := FormatDateTime('m"/"d', IncDay(now,25));
  GridTableViewEXPECT30.Caption := FormatDateTime('m"/"d', IncDay(now,30));
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
end;

procedure TStockOutofStockGoodsShowForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then ButtonToolBarSaveButton.Click;
end;

procedure TStockOutofStockGoodsShowForm.GridActiveTabChanged(
  Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then Exit;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

  OpenQuery('select t.CD_GOODS, '
           +'       g.NM_GOODS, '
           +'       g.QTY_SAFETY, '
           +'       t.QTY_STOCK , '
           +'       t.QTY_ORDER, '
           +'       Round(t.DAY_SALE, 2) as QTY_DAY, '
           +'       case when t.QTY_STOCK - (t.DAY_SALE*1)  <= g.QTY_SAFETY then Round(t.QTY_STOCK - (t.DAY_SALE*1) - g.QTY_SAFETY, 0) else 0 end as QTY_EXPECT, '
           +'       case when t.QTY_STOCK - (t.DAY_SALE*5)  <= g.QTY_SAFETY then Round(t.QTY_STOCK - (t.DAY_SALE*5) - g.QTY_SAFETY, 0) else 0 end as QTY_EXPECT5, '
           +'       case when t.QTY_STOCK - (t.DAY_SALE*10) <= g.QTY_SAFETY then Round(t.QTY_STOCK - (t.DAY_SALE*10)- g.QTY_SAFETY, 0) else 0 end as QTY_EXPECT10, '
           +'       case when t.QTY_STOCK - (t.DAY_SALE*15) <= g.QTY_SAFETY then Round(t.QTY_STOCK - (t.DAY_SALE*15)- g.QTY_SAFETY, 0) else 0 end as QTY_EXPECT15, '
           +'       case when t.QTY_STOCK - (t.DAY_SALE*20) <= g.QTY_SAFETY then Round(t.QTY_STOCK - (t.DAY_SALE*20)- g.QTY_SAFETY, 0) else 0 end as QTY_EXPECT20, '
           +'       case when t.QTY_STOCK - (t.DAY_SALE*25) <= g.QTY_SAFETY then Round(t.QTY_STOCK - (t.DAY_SALE*25)- g.QTY_SAFETY, 0) else 0 end as QTY_EXPECT25, '
           +'       case when t.QTY_STOCK - (t.DAY_SALE*30) <= g.QTY_SAFETY then Round(t.QTY_STOCK - (t.DAY_SALE*30)- g.QTY_SAFETY, 0) else 0 end as QTY_EXPECT30  '
           +'  from '
           +'      ( '
           +'      select d.CD_STORE, '
           +'             d.CD_GOODS, '
           +'             CONVERT(FLOAT,SUM(QTY_SALE)) / DATEDIFF(d, CONVERT(DATETIME,:P1), CONVERT(DATETIME,:P2)) as DAY_SALE, '
           +'             Sum(isnull(k.QTY_STOCK,0)) as QTY_STOCK, '
           +'             Sum(isnull(k.QTY_ORDER,0)) as QTY_ORDER '
           +'        from SL_SALE_D_SUM d (nolock) left outer join '
           +'           ( '
           +'            select t.CD_STORE, '
           +'                   t.CD_GOODS, '
           +'                   sum(isnull(t.QTY_STOCK,0) + isnull(t.QTY_LOSS,0)) as QTY_STOCK, '
           +'                   sum(isnull(t.QTY_ORDER,0)) as QTY_ORDER '
           +'              from '
           +'                ( '
           +'                  select CD_STORE, '
           +'                         CD_GOODS, '
           +'                         QTY_BASE as QTY_STOCK, '
           +'                         0        as QTY_LOSS, '
           +'                         0        as QTY_ORDER '
           +'                    from SL_STOCK_MONTH (nolock) '
           +'                   where CD_STORE = :P0 '
           +'                     and YM_STOCK = Left(:P3, 6) '
           +'                     and QTY_BASE <> 0 '
           +'                   union all '
           +'                  select b.CD_STORE, '
           +'                         g.CD_GOODS_T as CD_GOODS, '
           +'                         Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                         0 as QTY_LOSS, '
           +'                         0 as QTY_ORDER	'
           +'                    from SL_BUY_D as b (nolock) inner join '
           +'                         MS_GOODS as g (nolock) on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                   where b.CD_STORE = :P0 '
           +'                     and b.YMD_BUY between Left(:P3, 6) + ''01'' and :P3 '
           +'                   group by b.CD_STORE, g.CD_GOODS_T '
           +'                   union all '
           +'                  select s.CD_STORE, '
           +'                         g.CD_GOODS_T as CD_GOODS, '
           +'                        - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                         0 as QTY_LOSS, '
           +'                         0 as QTY_ORDER '
           +'                   from  SL_SALE_D_SUM as s (nolock) inner join '
           +'                         MS_GOODS      as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                   where s.CD_STORE = :P0 '
           +'                     and s.YMD_SALE between Left(:P3, 6) + ''01'' and :P3 '
           +'                   group by s.CD_STORE, g.CD_GOODS_T  '
           +'                   union all  '
           +'                  select d.CD_STORE, '
           +'                         g.CD_GOODS_T as CD_GOODS, '
           +'                         - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                         null as QTY_LOSS, '
           +'                         0 as QTY_ORDER	'
           +'                   from  SL_DISUSE as d (nolock) inner join '
           +'                         MS_GOODS  as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                   where d.CD_STORE = :P0 '
           +'                     and d.YMD_DISUSE between Left(:P3, 6) + ''01'' and :P3 '
           +'                   group by d.CD_STORE, g.CD_GOODS_T '
           +'                   union all '
           +'                  select s.CD_STORE, '
           +'                         g.CD_GOODS_T as CD_GOODS, '
           +'                         0 as QTY_STOCK, '
           +'                         - Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_LOSS, '
           +'                         0 as QTY_ORDER '
           +'                    from SL_SILSA as s (nolock) inner join '
           +'                         MS_GOODS as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0''  '
           +'                   where s.CD_STORE = :P0  '
           +'                     and s.YM_SILSA = Left(:P3, 6) '
           +'                     and Convert(varchar(8), s.DT_CHANGE, 112) between Left(:P3, 6) + ''01'' and :P3 '
           +'                     and s.QTY_SETTLE is not null '
           +'                   group by s.CD_STORE, g.CD_GOODS_T '
           +'                   union all '
           +'                  select d.CD_STORE, '
           +'                         g.CD_GOODS_T as CD_GOODS, '
           +'                         0 as QTY_STOCK, '
           +'                         0 as QTY_LOSS, '
           +'                         Sum(d.QTY_ORDER * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_ORDER '
           +'                    from SL_ORDER_D as d (nolock) inner join '
           +'                         SL_ORDER_H as h (nolock) on d.CD_STORE = h.CD_STORE and d.YMD_ORDER = h.YMD_ORDER and d.NO_ORDER = h.NO_ORDER and h.DS_ORDER = ''O'' inner join  '
           +'                         MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
           +'                   where d.CD_STORE = :P0 '
           +'                     and d.YMD_ORDER between Left(:P3, 6) + ''01'' and :P3  '
           +'                   group by d.CD_STORE, g.CD_GOODS_T '
           +'                   union all '
           +'                   select   t.CD_STORE, '
           +'                            g.CD_GOODS_T     as CD_GOODS, '
           +'                            -Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                            null as QTY_LOSS, '
           +'                            0 as QTY_ORDER '
           +'                   from     SL_TRANS_D as t (nolock) inner join '
           +'                            MS_GOODS   as g (nolock) on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
           +'                   where    t.CD_STORE  = :P0 '
           +'                     and    t.YMD_TRANS between Left(:P3, 6) + ''01'' and :P3 '
           +'                     and    t.DS_STATUS = '''+TransReceive+''' '
           +'                   group by t.CD_STORE, g.CD_GOODS_T '
           +'                   union all '
           +'                   select   t.CD_STORE_RECEIVE as CD_STORE, '
           +'                            g.CD_GOODS_T       as CD_GOODS, '
           +'                            Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK, '
           +'                            null as QTY_LOSS, '
           +'                            0 as QTY_ORDER '
           +'                   from     SL_TRANS_D as t (nolock) inner join '
           +'                            MS_GOODS   as g (nolock) on t.CD_STORE_RECEIVE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
           +'                   where    t.CD_STORE_RECEIVE = :P0 '
           +'                     and    t.YMD_TRANS between Left(:P3, 6) + ''01'' and :P3 '
           +'                     and    t.DS_STATUS        = '''+TransReceive+''' '
           +'                   group by t.CD_STORE_RECEIVE, g.CD_GOODS_T '
           +'                ) t '
           +'              group by t.CD_STORE, t.CD_GOODS '
           +'           ) as k on d.CD_STORE = k.CD_STORE and d.CD_GOODS = k.CD_GOODS '
           +'       where d.CD_STORE = :P0 '
           +'         and d.YMD_SALE between :P1 and :P2 '
           +'       group by d.CD_STORE, d.CD_GOODS ' //, k.QTY_STOCK, k.QTY_ORDER '
           +'  ) as t inner join '
           +'  MS_GOODS g (nolock) on g.CD_STORE =t.CD_STORE and g.CD_GOODS = g.CD_GOODS_T and t.CD_GOODS = g.CD_GOODS_T  and g.DS_STOCK = ''0'' and g.CD_TRDPL = :P4 '
           +'order by t.QTY_STOCK desc',
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             FormatDateTime('yyyymmdd',now()),
             String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTrdCode.Index])]);
  DM.ReadQuery(Query, GridTableView1);
end;

procedure TStockOutofStockGoodsShowForm.GridTableView1DataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  ButtonToolBarSaveButton.Enabled := true;
end;

procedure TStockOutofStockGoodsShowForm.GridTableViewDblClick(Sender: TObject);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;
  Grid.ActiveLevel := GridLevel1;
end;

end.

