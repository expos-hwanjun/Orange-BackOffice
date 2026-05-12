// 기초 재고 등록 (완료)

unit StockBaseStock;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxCurrencyEdit, StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockBaseStockForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewChanged: TcxGridColumn;

    procedure FormShow(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);

  private
    BaseDate: string;
    function BaseStockCreate:Boolean;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StockBaseStockForm: TStockBaseStockForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TStockBaseStockForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/재고관리/기초재고등록/기초재고등록.htm'
end;

procedure TStockBaseStockForm.FormShow(Sender: TObject);
var
  vCompanyCode: PStrPointer;
begin
  inherited;

  // 월 마감 테이블에 마감이 한 건이라도 있으면 이 프로그램을 못 돌린다
  if OpenQuery('select  CD_GOODS '
              +'  from  SL_STOCK_MONTH '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and YN_CLOSE = ''Y'' '
              +'  limit 1 ',
               [HeadStoreCode,
                StoreCode],
                true) then
  begin
    ErrBox('월 마감이 된 자료가 있습니다.'#13'['+Caption+'] 프로그램은 월 마감 이전에만 실행할 수 있습니다.');
    FinishQuery;
    Close;
    Exit;
  end;
  // 월 마감 테이블에 자료가 없다면 이 프로그램을 못 돌린다
  OpenQuery('select   Min(YM_STOCK) as YM_STOCK '
           +'  from   SL_STOCK_MONTH '
           +' where   CD_HEAD  =:P0 '
           +'   and   CD_STORE =:P1',
            [HeadStoreCode,
             StoreCode]);
  try
    if Query.Eof or (Query.Fields[0].AsString = EmptyStr) then
    begin
      FinishQuery;
      if not BaseStockCreate then
      begin
        Close;
        Exit;
      end
      else BaseDate := FormatDateTime('yyyymm', now);
    end
    else
      BaseDate := Query.Fields[0].AsString;
  finally
    FinishQuery;
  end;


  // 콤보박스에 거래처 없음 추가
  New(vCompanyCode);
  vCompanyCode^.Data := EmptyStr;
  ConditionToolBarComboBox.Properties.Items.AddObject('(거래처 없음)', TObject(vCompanyCode));

  // 거래처 테이블에서 거래처 목록 불러와서 콤보박스에 추가
  OpenQuery('select  CD_TRDPL, '
           +'        NM_TRDPL '
           +'  from  MS_TRD '
           +' where  CD_HEAD  =:P0 '
           +'   and  CD_STORE =:P1 '
           +'   and  DS_TRDPL =''B'' '
           +' order by NM_TRDPL',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCompanyCode);
      vCompanyCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCompanyCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarComboBox.ItemIndex := 0;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 재고수량 값을 검증할 때
procedure TStockBaseStockForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index]  <> null then
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyAmt.Index]  := DisplayValue * GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index]
  else
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyAmt.Index]  := 0;
  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSalePrice.Index] <> null then
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSaleAmt.Index] := DisplayValue * GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSalePrice.Index]
  else
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSaleAmt.Index] := 0;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewChanged.Index]   := true;
  isChanged := true;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockBaseStockForm.DoSearch: Boolean;
begin
  Result := false;

  if ConditionToolBarComboBox.ItemIndex < 0 then
  begin
    ErrBox('거래처를 먼저 선택하십시오.');
    Exit;
  end;


  // 거래처 취급 상품 조회
  try
    OpenQuery('select a.CD_MENU as CD_GOODS, '
             +'       a.NM_MENU as NM_GOODS, '
             +'       b.QTY_BASE, '
             +'       a.PR_BUY, '
             +'       b.AMT_BASE, '
             +'       a.PR_SALE, '
             +'       b.AMT_BASE_SALE '
             +'  from MS_MENU        as a left outer join '
             +'       SL_STOCK_MONTH as b on a.CD_HEAD  = b.CD_HEAD '
             +'                          and a.CD_STORE = b.CD_STORE '
             +'                          and b.YM_STOCK = :P3 '
             +'                          and a.CD_MENU = b.CD_GOODS '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.DS_STOCK =''1'' '
             +'   and Ifnull(a.CD_TRDPL, '''') = :P2 '
             +'   and a.YN_USE   = ''Y''',
              [HeadStoreCode,
               StoreCode,
               GetStrPointerData(ConditionToolBarComboBox),
               BaseDate]);
    Result := DM.ReadQuery(Query, GridTableView);

    Grid.SetFocus;
    if GridTableView.DataController.RecordCount > 0 then
    begin
      GridTableView.Controller.FocusedRecordIndex := 0;
      GridTableView.Controller.FocusedColumnIndex := GridTableViewStockQty.Index;
    end;
  except
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TStockBaseStockForm.BaseStockCreate:Boolean;
var vMonth :String;
begin
  Result := false;
  vMonth := FormatDateTime('yyyymm', now);
  try
    ExecQuery('insert into SL_STOCK_MONTH(CD_HEAD, CD_STORE, YM_STOCK, CD_GOODS) '
             +'select  g.CD_HEAD, '
             +'        g.CD_STORE, '
             +'        :P2       as YM_STOCK, '
             +'        g.CD_MENU '
             +'  from  MS_MENU  as g '
             +' where  g.CD_HEAD  =:P0 '
             +'   and  g.CD_STORE =:P1 '
             +'   and  g.CD_MENU not in (select CD_GOODS '
             +'                            from SL_STOCK_MONTH '
             +'                           where CD_HEAD  =:P0 '
             +'                             and CD_STORE =:P1 '
             +'                             and YM_STOCK =:P2 );',
             [HeadStoreCode,
              StoreCode,
              vMonth],false);

    Result := ExecQuery('insert into SL_CLOSE_MONTH (CD_HEAD, CD_STORE, YM_CLOSE, DS_CLOSE, CD_SAWON_CHG) '
                       +'                     Values(:P0, :P1, :P2, ''S'', :P3); ',
                      [HeadStoreCode,
                       StoreCode,
                       FormatDateTime('yyyymm', IncMonth(StoD(vMonth+'01'), -1)),
                       UserCode],
                       true);
  except
    on E: Exception do
    begin
      ErrBox('기초재고 생성오류!!!'#13+E.Message);
    end;
  end;
end;

function TStockBaseStockForm.DoSave: Boolean;
var
  vIndex  : Integer;
begin
  Result := false;

  try
    ShowMsg('기초 재고를 저장하고 있습니다. 잠시 기다리십시오.', false, -1);

    // 그리드 루프를 돌며 기초재고 저장
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if (GridTableView.DataController.Values[vIndex, GridTableViewChanged.Index] <> null) and
         (GridTableView.DataController.Values[vIndex, GridTableViewChanged.Index] = true) then
      begin
        ExecQuery('insert into SL_STOCK_MONTH(CD_HEAD, CD_STORE, YM_STOCK, CD_GOODS, QTY_BASE, AMT_BASE, AMT_BASE_SALE) '
                 +'                   values (:P0, :P1, :P2,  :P3, :P4, :P5, :P6) '
                 +' ON DUPLICATE KEY UPDATE QTY_BASE      = :P4, '
                 +'                         AMT_BASE      = :P5, '
                 +'                         AMT_BASE_SALE = :P6; ',
                 [HeadStoreCode,
                  StoreCode,
                  BaseDate,
                  GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewStockQty.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index]],
                  false);
      end;


    Result := ExecQuery(TempSQL, [], true);

    // 모든 기초 재고 저장이 완료되었을 경우 변경 여부를 false로 초기화
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if (GridTableView.DataController.Values[vIndex, GridTableViewChanged.Index] <> null) and
         (GridTableView.DataController.Values[vIndex, GridTableViewChanged.Index] = true) then
        GridTableView.DataController.Values[vIndex, GridTableViewChanged.Index] := false;

    MsgBox('기초 재고를 저장했습니다.'#13
          +'다른 거래처의 기초 재고도 등록해 주십시오.');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
