// 인기/비인기 상품 조회 (New완료)

unit SalePopularGoodsShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCheckBox, cxCurrencyEdit, ExtCtrls,
  AdvToolBarStylers, StdCtrls, cxRadioGroup, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TSalePopularGoodsShowForm = class(TInheritShowForm)
    GridTableViewCheck: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    ConditionToolBarPluCheckBox: TcxCheckBox;
    ConditionToolBarEventCheckBox: TcxCheckBox;
    ConditionToolBarOpenCheckBox: TcxCheckBox;
    ConditionToolBarScaleCheckBox: TcxCheckBox;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSeparator3: TAdvToolBarSeparator;
    GridPopup: TPopupMenu;
    GridPopupSelectAll: TMenuItem;
    GridPopupDeselectAll: TMenuItem;
    GridPopupInverseSelect: TMenuItem;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewBuyDate: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure GridTableViewCheckHeaderClick(Sender: TObject);
    procedure GridPopupSelectAllClick(Sender: TObject);
    procedure GridPopupDeselectAllClick(Sender: TObject);
    procedure GridPopupInverseSelectClick(Sender: TObject);
    procedure GridTableViewCheckPropertiesChange(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);

  protected
    function DoSearch:Boolean; override;
  end;

var
  SalePopularGoodsShowForm: TSalePopularGoodsShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSalePopularGoodsShowForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode   := pmPreview;
  DefaultDate := ddLastMonth;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 조회조건에서 키보드를 누를 때
procedure TSalePopularGoodsShowForm.ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 조회콤보박스를 변경할 때
procedure TSalePopularGoodsShowForm.ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
begin
  inherited;

  if ConditionToolBarComboBox.ItemIndex = 0 then
  begin
    ConditionToolBarEdit.Text         := '50';
    ConditionToolBarEditLabel.Caption := '위 까지';
  end
  else
  begin
    ConditionToolBarEdit.Text         := '0';
    ConditionToolBarEditLabel.Caption := '개 이하';
  end
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TSalePopularGoodsShowForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var
  vIndex  : Integer;
  vChecked: Boolean;
begin
  vChecked := false;
  GridTableView.DataController.PostEditingData;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] <> null) and
       (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] = true) then
    begin
      vChecked := true;
      Break;
    end;

  if vChecked then
  begin
    if not AskBox('선택한 상품들을 삭제하시겠습니까?'#13#13'(판매, 매입 등 거래가 있는 상품은 삭제되지 않고 사용 중지 됩니다.)') then
      Exit;

    GridTableView.BeginUpdate;
    ShowMsg('삭제 중입니다. 삭제할 상품이 많을 경우 상당히 오랜 시간이 걸립니다.', false, -1);
    try
      for vIndex := GridTableView.DataController.RecordCount-1 downto 0 do
        if (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] <> null) and
           (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] = true) then
          // 해당 상품으로 거래 건수가 있거나, 현재고가 있는지 확인한다
          if ((GridTableView.DataController.Values[vIndex, GridTableViewStockQty.Index] <> null) and (GridTableView.DataController.Values[vIndex, GridTableViewStockQty.Index] <> '0')) or
             OpenQuery('select   Top 1 CD_GOODS ' // 판매
                      +'from     SL_SALE_D (nolock) '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = :P1 '
                      +'union all '
                      +'select   Top 1 CD_GOODS ' // 전체취소
                      +'from     SL_SALE_C (nolock) '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = :P1 '
                      +'union all '
                      +'select   Top 1 CD_GOODS ' // 판매연습
                      +'from     TR_SALE_D (nolock) '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = :P1 '
                      +'union all '
                      +'select   Top 1 CD_GOODS ' // 발주
                      +'from     SL_ORDER_D (nolock) '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = :P1 '
                      +'union all '
                      +'select   Top 1 CD_GOODS ' // 매입
                      +'from     SL_BUY_D (nolock) '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = :P1 '
                      +'union all '
                      +'select   Top 1 CD_GOODS ' // 폐기
                      +'from     SL_DISUSE (nolock) '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = :P1 '
                      +'union all '
                      +'select   Top 1 CD_GOODS ' // 실사
                      +'from     SL_SILSA (nolock) '
                      +'where    CD_STORE = :P0 '
                      +'  and    CD_GOODS = :P1 ',
                       [StoreCode,
                        GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]],
                        true) then
          begin
            // 거래 내역이 있으면 사용 안 함으로 업데이트
            if ExecQuery('update MS_GOODS '
                        +'set    YN_USE     = ''N'', '
                        +'       DT_CHANGE  = GetDate(), '
                        +'       DT_SUSPEND = GetDate(), '
                        +'       PRG_CHG    = ''POP'', '
                        +'       CD_SAWON_CHG = :P2, '
                        +'       DS_TRANS   = 0 '
                        +'where  CD_STORE   = :P0 '
                        +'  and  CD_GOODS   = :P1',
                         [StoreCode,
                          GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                          UserCode]) then
              GridTableView.DataController.DeleteRecord(vIndex);
          end
          else
          begin
            if not OpenQuery('select Top 1 CD_GOODS '
                     +'from MS_GOODS (nolock) '
                     +'where CD_STORE=:P0 '
                     +'  and CD_GOODS_L=:P1 '
                     +'  and Isnull(YN_LINK,''N'') =''Y'' ',
                     [StoreCode,
                      GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]],
                      true) then
            begin
              // 거래 내역이 없으면 삭제
              if ExecQuery('delete from MS_GOODS '
                          +'where  CD_STORE = :P0 '
                          +'  and  CD_GOODS = :P1',
                           [StoreCode,
                            GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]]) then
                GridTableView.DataController.DeleteRecord(vIndex);
            end;
          end;
    finally
      ShowMsg;
      GridTableView.EndUpdate;
    end;
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 체크박스 선택을 변경할 때
procedure TSalePopularGoodsShowForm.GridTableViewCheckPropertiesChange(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  // 선택된 항목이 있으면 삭제 버튼을 활성화한다
  ButtonToolBarDeleteButton.Enabled := false;
  GridTableView.DataController.PostEditingData;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] <> null) and
       (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] = true) then
    begin
      ButtonToolBarDeleteButton.Enabled := true;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 체크박스 헤더를 누를 때
procedure TSalePopularGoodsShowForm.GridTableViewCheckHeaderClick(Sender: TObject);
var
  vIndex: Integer;
  vSelectAll: Boolean;
begin
  inherited;

  // 전체 선택 되어 있는지 확인한다
  vSelectAll := true;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] = null) or
       (GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] = false) then
    begin
      vSelectAll := false;
      break;
    end;

  // 전체 선택 시 전체 취소
  if vSelectAll then
    GridPopupDeselectAll.Click
  // 선택 안된 것이 있으면 전체 선택
  else
    GridPopupSelectAll.Click;
end;

//==============================================================================
// 그리드 팝업메뉴
//------------------------------------------------------------------------------
// 모두 선택 팝업메뉴
procedure TSalePopularGoodsShowForm.GridPopupSelectAllClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  GridTableView.BeginUpdate;
  try
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] := true;
    GridTableViewCheckPropertiesChange(GridTableViewCheck);
  finally
    GridTableView.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
// 모두 선택 취소 팝업메뉴
procedure TSalePopularGoodsShowForm.GridPopupDeselectAllClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  GridTableView.BeginUpdate;
  try
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] := false;
    GridTableViewCheckPropertiesChange(GridTableViewCheck);
  finally
    GridTableView.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
// 선택 영역 반전 팝업메뉴
procedure TSalePopularGoodsShowForm.GridPopupInverseSelectClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  GridTableView.BeginUpdate;
  try
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index] := not GridTableView.DataController.Values[vIndex, GridTableViewCheck.Index];
    GridTableViewCheckPropertiesChange(GridTableViewCheck);
  finally
    GridTableView.EndUpdate;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSalePopularGoodsShowForm.DoSearch:Boolean;
begin
  // 수량 조건을 새로 정리한다
  if (ConditionToolBarComboBox.ItemIndex = 0) and (StoI(ConditionToolBarEdit.Text) <= 0) then
    ConditionToolBarEdit.Text := '50'
  else if (ConditionToolBarComboBox.ItemIndex = 1) and (StoI(ConditionToolBarEdit.Text) = 0) then
    ConditionToolBarEdit.Text := '0';

  ButtonToolBarDeleteButton.Enabled := false;
  GridTableViewCheck.Visible        := ConditionToolBarComboBox.ItemIndex = 1;


  OpenQuery('select '
           +IfThen(ConditionToolBarComboBox.ItemIndex = 0, ' Top '+ConditionToolBarEdit.Text+' ', '') // 인기상품 수량조건
           +'         g.CD_GOODS, '
           +'         g.NM_GOODS, '
           +'         g.NM_SPEC, '
           +'         s.QTY_SALE, '
           +'         case when s.QTY_SALE <> 0 then s.AMT_SALE else 0 end AMT_SALE, '
           +'         a.QTY_STOCK, '
           +'         t.NM_TRDPL, '
           +'         dbo.StoD(k.YMD_SALE) as YMD_SALE, '
           +'         dbo.StoD(b.YMD_BUY) as YMD_BUY '
           +'from     MS_GOODS as g '
           +IfThen(ConditionToolBarComboBox.ItemIndex = 0, ' inner join ', ' left outer join ') // 인기상품 수량조건
           +'        (select   d.CD_STORE, '
           +'                  g.CD_GOODS as CD_GOODS, '
           +'                  Sum(d.QTY_SALE) as QTY_SALE, '
           +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
           +IfThen(not ConditionToolBarEventCheckBox.Checked, ' from SL_SALE_D_SUM ',' from SL_SALE_D ')+' as d (nolock) inner join '
           +'                  MS_GOODS      as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
           +'         where    d.CD_STORE = :P0 '
           +'           and    d.YMD_SALE between :P1 and :P2 '
           +IfThen(not ConditionToolBarEventCheckBox.Checked, '', ' and d.DS_SALE  <> ''V'' ')
           +IfThen(not ConditionToolBarEventCheckBox.Checked, '', ' and Isnull(d.NO_SPC,'''') = '''' ') // 행사 상품 조회
           +'         group by d.CD_STORE, g.CD_GOODS) as s on g.CD_STORE = s.CD_STORE and g.CD_GOODS = s.CD_GOODS left outer join '
           +'        (select   CD_STORE, '
           +'                  CD_GOODS, '
           +'                  Sum(QTY_STOCK) as QTY_STOCK '
           +'         from    (select   CD_STORE, '
           +'                           CD_GOODS, '
           +'                           QTY_BASE as QTY_STOCK '
           +'                  from     SL_STOCK_MONTH (nolock) '
           +'                  where    CD_STORE = :P0 '
           +'                    and    YM_STOCK = Left(:P2, 6) '
           +'                  union all '
           +'                  select   b.CD_STORE, '
           +'                           g.CD_GOODS_T as CD_GOODS, '
           +'                           Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
           +'                  from     SL_BUY_D as b (nolock) inner join '
           +'                           MS_GOODS as g (nolock) on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0'' '
           +'                  where    b.CD_STORE = :P0 '
           +'                    and    b.YMD_BUY between Left(:P2, 6) + ''01'' and :P2 '
           +'                  group by b.CD_STORE, g.CD_GOODS_T '
           +'                  union all '
           +'                  select   s.CD_STORE, '
           +'                           g.CD_GOODS_T as CD_GOODS, '
           +'                           - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
           +'                  from     SL_SALE_D_SUM as s (nolock) inner join '
           +'                           MS_GOODS      as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0'' '
           +'                  where    s.CD_STORE = :P0 '
           +'                    and    s.YMD_SALE between Left(:P2, 6) + ''01'' and :P2 '
           +'                  group by s.CD_STORE, g.CD_GOODS_T '
           +'                  union all '
           +'                  select   d.CD_STORE, '
           +'                           g.CD_GOODS_T as CD_GOODS, '
           +'                           - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
           +'                  from     SL_DISUSE as d (nolock) inner join '
           +'                           MS_GOODS  as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0'' '
           +'                  where    d.CD_STORE = :P0 '
           +'                    and    d.YMD_DISUSE between Left(:P2, 6) + ''01'' and :P2 '
           +'                  group by d.CD_STORE, g.CD_GOODS_T '
           +'                  union all '
           +'                  select   s.CD_STORE, '
           +'                           g.CD_GOODS_T as CD_GOODS, '
           +'                           - Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
           +'                  from     SL_SILSA as s (nolock) inner join '
           +'                           MS_GOODS as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS and g.DS_STOCK = ''0'' '
           +'                  where    s.CD_STORE = :P0 '
           +'                    and    s.YM_SILSA = Left(:P2, 6) '
           +'                    and    Convert(varchar(8), s.DT_CHANGE, 112) between Left(:P2, 6) + ''01'' and :P2 '
           +'                    and  s.QTY_SETTLE is not null '
           +'                  group by s.CD_STORE, g.CD_GOODS_T) as stock '
           +'         group by CD_STORE, CD_GOODS) as a on g.CD_STORE = a.CD_STORE and g.CD_GOODS = a.CD_GOODS left outer join '
           +'         MS_TRD as t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL left outer join '
           +'        (select CD_STORE, '
           +'                CD_GOODS, '
           +'                MAX(YMD_SALE) as YMD_SALE '
           +'           from SL_SALE_D_SUM (nolock) '
           +'          group by CD_STORE, CD_GOODS '
           +'         ) k on g.CD_STORE = k.CD_STORE and g.CD_GOODS = k.CD_GOODS left outer join '
           +'        (select CD_STORE, '
           +'                CD_GOODS, '
           +'                MAX(YMD_BUY) as YMD_BUY '
           +'           from SL_BUY_D (nolock) '
           +'          group by CD_STORE, CD_GOODS '
           +'         ) b on g.CD_STORE = b.CD_STORE and g.CD_GOODS = b.CD_GOODS '
           +'where    g.CD_STORE = :P0 '
           +'  and    g.YN_USE   = ''Y'' '
           +IfThen(ConditionToolBarComboBox.ItemIndex = 1, ' and Isnull(g.YN_LINK,''N'') = ''N'' ', '') // 비인기상품일때는 연결상품 제외
           +IfThen(not ConditionToolBarPluCheckBox.Checked,   '', ' and g.CD_GOODS not in (select CD_GOODS from MS_SMALL where CD_STORE = :P0) ') // PLU 등록상품 조회
           +IfThen(not ConditionToolBarOpenCheckBox.Checked,  '', ' and g.DS_GOODS <> ''O'' ') // 오픈 상품 조회
           +IfThen(not ConditionToolBarScaleCheckBox.Checked, '', ' and g.DS_GOODS <> ''W'' ') // 저울 상품 조회
           +'  and    g.DS_GOODS <> ''B'' '
           +'  and    g.CD_GOODS <> ''00000000'' '
           +IfThen(ConditionToolBarComboBox.ItemIndex = 0, ' order by s.QTY_SALE desc ', ' and IsNull(s.QTY_SALE,0) <= '+ConditionToolBarEdit.Text+' ') // 인기/비인기 상품 수량조건
           ,
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  DM.ReadQuery(Query, GridTableView);
  Result := GridTableView.DataController.RecordCount > 0;

//  inherited;
end;

end.
