// 판매분 매입 조회 (New완료)

unit BuySaledShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  ExtCtrls, AdvSplitter, cxCurrencyEdit, AdvToolBarStylers, StdCtrls,
  cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TBuySaledShowForm = class(TInheritShow2Form)
    ListGrid: TcxGrid;
    ListGridLevel: TcxGridLevel;
    ListGridTableView: TcxGridTableView;
    ListGridTableViewBuyDate: TcxGridColumn;
    GridSplitter: TAdvSplitter;
    GridDBTableViewBuyNo: TcxGridDBColumn;
    GridDBTableViewType: TcxGridDBColumn;
    GridDBTableViewCompanyName: TcxGridDBColumn;
    GridDBTableViewNetAmt: TcxGridDBColumn;
    GridDBTableViewVatAmt: TcxGridDBColumn;
    GridDBTableViewBottleAmt: TcxGridDBColumn;
    GridDBTableViewBuyAmt: TcxGridDBColumn;
    GridDBTableViewBuyDate: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubDBTableViewBuyQty: TcxGridDBColumn;
    GridSubDBTableViewBuyPrice: TcxGridDBColumn;
    GridSubDBTableViewBottleAmt: TcxGridDBColumn;
    GridSubDBTableViewBuyAmt: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

  protected
    function DoSearch:Boolean; override;
  end;

var
  BuySaledShowForm: TBuySaledShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuySaledShowForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode   := pmExcel;
  DefaultDate := ddMonthFirst;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TBuySaledShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드 다른 레코드를 선택할 때
procedure TBuySaledShowForm.ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vDate: string;
begin
  inherited;

  try
    // 선택한 날짜에 해당하는 자료들만 매입 그리드에서 필터링해서 보여준다
    if ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewBuyDate.Index] <> null then
      vDate := ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewBuyDate.Index];

    GridDBTableView.BeginUpdate;
    try
      GridDBTableView.DataController.Filter.Clear;
      GridDBTableViewBuyDate.DataBinding.AddToFilter(nil, foEqual, vDate);
      GridDBTableView.DataController.Filter.Active := true;
    finally
      GridDBTableView.EndUpdate;
    end;
  except
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TBuySaledShowForm.DoSearch:Boolean;
begin
//  inherited;
  Result := false;
  try
    // 날짜목록 쿼리를 열어 그리드에 보여준다
    OpenQuery('select   dbo.StoDW(YMD_BUY) as YMD_BUY '
             +'from     SL_BUY_H '
             +'where    CD_STORE    = :P0 '
             +'  and    YMD_BUY between :P1 and :P2 '
             +'  and    YN_SALE_BUY = ''Y'' '
             +'group by YMD_BUY',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := Query.RecordCount > 0;
    if DM.ReadQuery(Query, ListGridTableView) then
    begin
      // 매입 마스터 쿼리를 열어 그리드에 보여준다
      OpenQuery('select   a.NO_BUY, '
               +'         case a.DS_BUY when ''0'' then ''매입'' when ''1'' then ''반품'' when ''9'' then ''공병'' end as NM_BUY, '
               +'         b.NM_TRDPL, '
               +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
               +'         a.AMT_TAX, '
               +'         a.AMT_BOTTLE, '
               +'         a.AMT_BUY, '
               +'         dbo.StoDW(a.YMD_BUY) as YMD_BUY, '
               +'         a.CD_STORE + a.YMD_BUY + a.NO_BUY as LINK '
               +'from     SL_BUY_H as a left outer join '
               +'         MS_TRD   as b on a.CD_STORE = b.CD_STORE and a.CD_TRDPL = b.CD_TRDPL '
               +'where    a.CD_STORE    = :P0 '
               +'  and    a.YMD_BUY between :P1 and :P2 '
               +'  and    a.YN_SALE_BUY =''Y'' '
               +'order by a.CD_STORE, a.YMD_BUY, a.NO_BUY',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);
      GridDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, nil, MemData);
      GridDBTableView.DataController.DataSource := DataSource;
      if GridDBTableView.DataController.RecordCount > 0 then
      begin
        // 매입 디테일 쿼리를 열어 그리드에 보여준다
        OpenQuery('select   b.CD_GOODS, '
                 +'         c.NM_GOODS, '
                 +'         c.NM_SPEC, '
                 +'         b.QTY_BUY, '
                 +'         b.PR_BUY, '
                 +'         b.AMT_BOTTLE, '
                 +'         b.AMT_BUY, '
                 +'         a.CD_STORE + a.YMD_BUY + a.NO_BUY as LINK '
                 +'from     SL_BUY_H as a inner join '
                 +'         SL_BUY_D as b on a.CD_STORE = b.CD_STORE and a.YMD_BUY = b.YMD_BUY and a.NO_BUY = b.NO_BUY inner join '
                 +'         MS_GOODS as c on b.CD_STORE = c.CD_STORE and b.CD_GOODS = c.CD_GOODS '
                 +'where    a.CD_STORE    = :P0 '
                 +'  and    a.YMD_BUY between :P1 and :P2 '
                 +'  and    a.YN_SALE_BUY =''Y'' '
                 +'order by a.CD_STORE, a.YMD_BUY, a.NO_BUY',
                  [StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   DtoS(ConditionToolBarToDateEdit.Date)]);
        GridSubDBTableView.DataController.DataSource := nil;
        DM.ReadQuery(Query, nil, SubMemData);
        GridSubDBTableView.DataController.DataSource := SubDataSource;

        if ListGridTableView.DataController.RecordCount > 0 then
        begin
          ListGrid.SetFocus;
          ListGridTableView.DataController.FocusedRecordIndex := 0;
        end;
      end;
    end;
  except
  end;
end;

end.
