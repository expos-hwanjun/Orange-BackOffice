// 실사 확정 (완료)

unit StockSurveyConfirm;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, cxCheckBox, DateUtils,
  DBAccess, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockSurveyConfirmForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewSurveyQty: TcxGridColumn;
    GridTableViewLossQty: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;

    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoSave  : Boolean; override;
  end;

var
  StockSurveyConfirmForm: TStockSurveyConfirmForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TStockSurveyConfirmForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/재고관리/재고실사확정/재고실사확정.htm';
end;

procedure TStockSurveyConfirmForm.FormShow(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select StoD(YMD_SILSA) '
             +'  from SL_SILSA_TEMP '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and YN_CONFIRM =''N'' '
             +' group by YMD_SILSA '
             +' order by 1 ',
            [HeadStoreCode,
             StoreCode]);
    ConditionToolBarComboBox.Properties.Items.Clear;
    while not Query.Eof do
    begin
      ConditionToolBarComboBox.Properties.Items.Add(Query.Fields[0].AsString);
      Query.Next;
    end;
    ConditionToolBarComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;
end;

procedure TStockSurveyConfirmForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  try
    OpenQuery('select b.CD_GOODS, '
             +'       a.NM_MENU, '
             +'       a.NM_SPEC, '
             +'       b.QTY_SILSA, '
             +'       case when b.NO_POS = ''00'' then ''B/O'' else b.NO_POS end NO_POS '
             +'from   SL_SILSA_TEMP b inner join '
             +'       MS_MENU       a on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_GOODS = a.CD_MENU and a.CD_MENU = :P2 '
             +'where  b.CD_HEAD  =:P0 '
             +'  and  b.CD_STORE =:P1 '
             +'  and  b.YM_SILSA = Left(:P2,6) '
             +'  and  b.YMD_SILSA =:P1 '
             +' order by b.CD_GOODS ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index])]);
    DM.ReadQuery(Query, GridTableView1);
  finally
    FinishQuery;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TStockSurveyConfirmForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

  isChanged := GridTableView.DataController.RecordCount > 0;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockSurveyConfirmForm.DoSearch: Boolean;
begin
  Result := false;
  // 월마감이 되었으면 실사 확정을 못한다
  if CheckMonthClose('S', GetOnlyNumber(ConditionToolBarComboBox.Text)) then
  begin
    ErrBox('월 마감이 완료된 년월에는 실사 확정을 할 수 없습니다.');
    Exit;
  end;

  OpenQuery('select   e.NM_TRDPL, '
           +'         b.CD_GOODS, '
           +'         c.NM_MENU as NM_GOODS, '
           +'         c.NM_SPEC, '
           +'         b.YMD_SILSA, '
           +'         ifnull(t.QTY_STOCK, 0) as QTY_STOCK, '
           +'         b.QTY_SILSA, '
           +'         b.QTY_SILSA - ifnull(t.QTY_STOCK, 0) as QTY_SETTLE '
           +'from     SL_SILSA_TEMP b inner join '
           +'         MS_MENU  as c on b.CD_STORE = c.CD_STORE and b.CD_GOODS = c.CD_MENU left outer join '
           +'         MS_TRD   as e on c.CD_STORE = e.CD_STORE and c.CD_TRDPL = e.CD_TRDPL left outer join '
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
           +'         ) as t on t.CD_GOODS = b.CD_GOODS '
           +' where b.CD_HEAD  =:P0 '
           +'   and b.CD_STORE =:P1 '
           +'   and b.YM_SILSA =Left(:P2,6) '
           +'   and b.YMD_SILSA =:P2 '
           +'   and b.YN_CONFIRM = ''N'' ',
            [HeadStoreCode,
             StoreCode,
             GetOnlyNumber(ConditionToolBarComboBox.Text)]);

  Result := DM.ReadQuery(Query, GridTableView);
end;
procedure TStockSurveyConfirmForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = ConditionToolBarComboBox then
    GridTableView.DataController.RecordCount := 0;
end;

//------------------------------------------------------------------------------
// 저장
function TStockSurveyConfirmForm.DoSave: Boolean;
begin
  Result := false;
  if not AskBox('재고실사내역을 확정하시겠습니까?') then Exit;


  // 월마감이 되었으면 실사 확정을 못한다
  if CheckMonthClose('S', GetOnlyNumber(ConditionToolBarComboBox.Text)) then
  begin
    ErrBox('월 마감이 된 년월에는 실사 확정을 할 수 없습니다.');
    Exit;
  end;

  try
    if CheckMonthClose('S', GetOnlyNumber(ConditionToolBarComboBox.Text)) then
    if Query.Eof then
    begin
      MsgBox('지난 달 ''월 마감''을 하지 않았습니다.');
      Exit;
    end;
  finally
    FinishQuery;
  end;

  try
    ExecQuery('delete d '
             +'  from SL_SILSA as d inner join '
             +'       SL_SILSA_TEMP as j on j.CD_HEAD  = d.CD_HEAD '
             +'                         and j.CD_STORE = d.CD_STORE '
             +'                         and j.YM_SILSA = d.YM_SILSA '
             +'                         and j.CD_GOODS = d.CD_GOODS  '
             +'                         and j.YMD_SILSA =:P3 '
             +'                         and  j.YN_CONFIRM =''N'' '
             +'where  d.CD_HEAD    = :P0 '
             +'  and  d.CD_STORE   = :P1 '
             +'  and  d.YM_SILSA   = :P2;',
             [HeadStoreCode,
              StoreCode,
              LeftStr(GetOnlyNumber(ConditionToolBarComboBox.Text),6),
              GetOnlyNumber(ConditionToolBarComboBox.Text)], false);


    ExecQuery('insert into SL_SILSA(CD_HEAD, '
             +'                     CD_STORE, '
             +'                     YM_SILSA, '
             +'                     CD_GOODS, '
             +'                     YMD_SILSA, '
             +'                     QTY_STOCK, '
             +'                     QTY_SILSA, '
             +'                     QTY_SETTLE, '
             +'                     PR_BUY, '
             +'                     PR_SALE, '
             +'                     CD_SAWON_CHG, '
             +'                     DT_CHANGE) '
             +'select   b.CD_HEAD, '
             +'         b.CD_STORE, '
             +'         Left(:P2,6), '
             +'         b.CD_GOODS, '
             +'         b.YMD_SILSA, '
             +'         ifnull(t.QTY_STOCK, 0) as QTY_STOCK, '
             +'         b.QTY_SILSA, '
             +'         b.QTY_SILSA - ifnull(t.QTY_STOCK, 0) as QTY_SETTLE, '
             +'         c.PR_BUY, '
             +'         c.PR_SALE, '
             +'         :P3, '
             +'         Now() '
             +'from     SL_SILSA_TEMP b inner join '
             +'         MS_MENU    as c on b.CD_HEAD = c.CD_HEAD and b.CD_STORE = c.CD_STORE and b.CD_GOODS = c.CD_MENU left outer join '
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
             +'         ) as t on t.CD_GOODS = b.CD_GOODS '
             +'where b.CD_HEAD    =:P0 '
             +'  and b.CD_STORE   =:P1 '
             +'  and b.YM_SILSA   =Left(:P2,6) '
             +'  and b.YMD_SILSA  =:P2 '
             +'  and b.YN_CONFIRM =''N''; ',
             [HeadStoreCode,
              StoreCode,
              GetOnlyNumber(ConditionToolBarComboBox.Text),
              UserCode],false);

      ExecQuery('update SL_SILSA_TEMP '
               +'   set YN_CONFIRM =''Y'' '
               +' where CD_HEAD    =:P0 '
               +'   and CD_STORE   =:P1 '
               +'   and YM_SILSA   =:P2 '
               +'   and YMD_SILSA  =:P3; ',
               [HeadStoreCode,
                StoreCode,
                LeftStr(GetOnlyNumber(ConditionToolBarComboBox.Text),6),
                GetOnlyNumber(ConditionToolBarComboBox.Text)],true);

    GridTableView.DataController.RecordCount := 0;
    MsgBox('실사 확정을 완료했습니다.');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
