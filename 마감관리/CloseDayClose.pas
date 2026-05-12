unit CloseDayClose;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxGridCustomTableView,
  cxGridTableView, cxGridLevel, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit, StrUtils;

type
  TCloseDayCloseForm = class(TInheritForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    ButtonToolBarSearchButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    GridTableViewColumn4: TcxGridColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CloseDayCloseForm: TCloseDayCloseForm;

implementation
uses Common, DbModule;
{$R *.dfm}
procedure TCloseDayCloseForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;
  OpenQuery('select dbo.StoDW(t1.YMD_SALE) as YMD_SALE, '
           +'       case when t2.YMD_CLOSE IS null then ''N'' else ''Y'' end YN_CLOSE, '
           +'       t4.CNT_POS as CNT_REGPOS, '
           +'       t3.CNT_POS, '
           +'       t3.CNT_CASHIER '
           +'   from  '
           +'       (select CD_STORE, YMD_SALE '
           +'          from SL_SALE_H '
           +'         where CD_STORE = :P0 '
           +'           and DS_SALE <> ''V'' '
           +'           and YMD_SALE between :P1 and :P2 '
           +'         group by CD_STORE, YMD_SALE '
           +'        ) t1 left outer join '
           +'        SL_CLOSE_DAY t2 on t1.CD_STORE = t2.CD_STORE and t1.YMD_SALE = t2.YMD_CLOSE left outer join '
           +'       (select CD_STORE, '
           +'               YMD_CLOSE, '
           +'               COUNT(*) as CNT_POS, '
           +'               SUM(CNT_CASHIER) as CNT_CASHIER '
           +'          from SL_POSCLOSE '
           +'         where DS_STATUS = ''C''  '
           +'         group by CD_STORE, YMD_CLOSE) t3 on t1.CD_STORE = t3.CD_STORE and t1.YMD_SALE = t3.YMD_CLOSE left outer join '
           +'       (select CD_STORE, YMD_SALE, Count(*) as CNT_POS '
           +'          from ( '
           +'                select CD_STORE, YMD_SALE, NO_POS '
           +'                  from SL_SALE_H '
           +'                 where CD_STORE = :P0 '
           +'                   and DS_SALE <> ''V'' '
           +'                   and YMD_SALE between :P1 and :P2 '
           +'                 group by CD_STORE, YMD_SALE, NO_POS '
           +'               ) t '
           +'          group by CD_STORE, YMD_SALE ) t4 on t1.CD_STORE = t4.CD_STORE and t1.YMD_SALE = t4.YMD_SALE '
           +Ifthen(ConditionToolBarComboBox.ItemIndex=0, ' where t2.YMD_CLOSE is null ','')
           +'  order by 1 ',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  if not DM.ReadQuery(Query, GridTableView) then
    MsgBox(msgNoSearchData);

  ButtonToolBarSaveButton.Enabled := GridTableView.DataController.RecordCount > 0;
end;

procedure TCloseDayCloseForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarSaveButton.Enabled   := (AFocusedRecord <> nil) and (AFocusedRecord.Index >= 0);
  ButtonToolBarDeleteButton.Enabled := (AFocusedRecord <> nil) and (AFocusedRecord.Index >= 0);
end;

procedure TCloseDayCloseForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if (ARecord.Values[2] <> ARecord.Values[3]) then
    AStyle := StyleFontRed
  else if ARecord.Values[1] = 'N' then
    AStyle := StyleFontBlue;
end;

procedure TCloseDayCloseForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var vDate :String;
    vIndex :Integer;
begin
  inherited;
  if not AskBox('일마감을 취소하시겠습니까?') then Exit;
  for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
    vDate := vDate + Format('''%s'',',[GetOnlyNumber(GridTableView.Controller.SelectedRows[vIndex].Values[0])]);

  if vDate = EmptyStr then
  begin
    ErrBox('취소할 일자를 선택하세요');
    Exit;
  end;

  vDate :=  '('+LeftStr(vDate, Length(vDate)-1)+')';
  try
    ShowMsg('마감 취소 중 입니다.');
    Screen.Cursor := crSQLWait;
    BeginTrans;

    ExecQuery('delete from SL_CLOSE_DAY '
             +' where CD_STORE =:P0 '
             +'   and YMD_CLOSE in '+vDate,
             [StoreCode],
             false);

    ExecQuery('delete from SL_CLOSE_GOODS '
             +' where CD_STORE =:P0 '
             +'   and YMD_CLOSE in '+vDate,
             [StoreCode],
             false);

    CommitTrans;
    MsgBox('마감이 취소 되었습니다');
    GridTableView.Controller.ClearSelection;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TCloseDayCloseForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vDate :String;
    vIndex :Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
  begin
    if NVL(GridTableView.Controller.SelectedRows[vIndex].Values[2],0) > NVL(GridTableView.Controller.SelectedRows[vIndex].Values[2],0) then Continue;
    vDate := vDate + Format('''%s'',',[GetOnlyNumber(GridTableView.Controller.SelectedRows[vIndex].Values[0])]);
  end;


  if vDate = EmptyStr then
  begin
    ErrBox('마감할 일자를 선택하세요');
    Exit;
  end;

  if not AskBox('일마감을 하시겠습니까?') then Exit;

  vDate :=  '('+LeftStr(vDate, Length(vDate)-1)+')';

  try
    ShowMsg('마감 중 입니다.');
    Screen.Cursor := crSQLWait;
    BeginTrans;

    //일별 매출내역
    ExecQuery('delete from SL_CLOSE_DAY '
             +' where CD_STORE =:P0 '
             +'   and YMD_CLOSE in '+vDate,
             [StoreCode],
             false);

    ExecQuery('insert into SL_CLOSE_DAY (CD_STORE, '
             +'                          YMD_CLOSE, '
             +'                          AMT_SALE, '
             +'                          AMT_DC, '
             +'                          AMT_NET, '
             +'                          AMT_TAX, '
             +'                          AMT_DUTYFREE, '
             +'                          AMT_BUY, '
             +'                          RT_PROFIT, '
             +'                          AMT_PROFIT, '
             +'                          AMT_SALE_DIRECT, '
             +'                          AMT_SALE_RENT, '
             +'                          AMT_SALE_FEE, '
             +'                          AMT_SALE_SALED, '
             +'                          CNT_DELIVERY, '
             +'                          AMT_DELIVERY, '
             +'                          AMT_CUSTOMER_AVG, '
             +'                          CNT_CUSTOMER, '
             +'                          AMT_PLAN, '
             +'                          RT_PLAN, '
             +'                          AMT_CASH, '
             +'                          AMT_CARD, '
             +'                          AMT_TRUST, '
             +'                          AMT_CASHRCP, '
             +'                          AMT_GIFT, '
             +'                          AMT_OKC, '
             +'                          AMT_TMONEY, '
             +'                          DT_CHANGE) '
             +' select CD_STORE, '
             +'        YMD_SALE, '
             +'        AMT_SALE, '
             +'        AMT_DC, '
             +'        AMT_NET, '
             +'        AMT_TAX, '
             +'        AMT_DUTYFREE, '
             +'        AMT_BUY, '
             +'        dbo.GetProfitRate(AMT_BUY, AMT_SALE) as RATE_PROFIT, '
             +'        AMT_SALE-AMT_BUY as AMT_PROFIT, '
             +'        AMT_SALE_DIRECT, '
             +'        AMT_SALE_RENT, '
             +'        AMT_SALE_FEE, '
             +'        AMT_SALE_SALED, '
             +'        CNT_DELIVERY, '
             +'        AMT_DELIVERY, '
             +'        AMT_CUSTOMER_AVG, '
             +'        CNT_CUSTOMER, '
             +'        AMT_PLAN, '
             +'        case AMT_PLAN when 0 then 100 else Round(AMT_SALE * 100 / AMT_PLAN, 2) end as RATE_PLAN, '
             +'        AMT_CASH, '
             +'        AMT_CARD, '
             +'        AMT_TRUST, '
             +'        AMT_CASHRCP, '
             +'        AMT_GIFT, '
             +'        AMT_OKC, '
             +'        AMT_TMONEY, '
             +'        GETDATE() '
             +'  from ( '
             +'         select   h.CD_STORE, '
             +'                  h.YMD_SALE, '
             +'                  Sum(h.AMT_SALE)            as AMT_SALE, '
             +'                  Sum(h.DC_TOT)              as AMT_DC, '
             +'                  Sum(h.AMT_DUTY+h.AMT_TAX)  as AMT_NET, '
             +'                  Sum(h.AMT_DUTYFREE)        as AMT_DUTYFREE, '
             +'                  Sum(h.AMT_TAX)             as AMT_TAX, '
             +'                  isnull((select Round(Convert(float, IsNull(case SubString(h.YMD_SALE, 5, 2) when ''01'' then NM_CODE1 '
             +'                                                                                              when ''02'' then NM_CODE2 '
             +'                                                                                              when ''03'' then NM_CODE3 '
             +'                                                                                              when ''04'' then NM_CODE4 '
             +'                                                                                              when ''05'' then NM_CODE5 '
             +'                                                                                              when ''06'' then NM_CODE6 '
             +'                                                                                              when ''07'' then NM_CODE7 '
             +'                                                                                              when ''08'' then NM_CODE8 '
             +'                                                                                              when ''09'' then NM_CODE9 '
             +'                                                                                              when ''10'' then NM_CODE10'
             +'                                                                                              when ''11'' then NM_CODE11'
             +'                                                                                              when ''12'' then NM_CODE12 end, 0)) / Convert(int, DateName(day, DateAdd(day, - 1, DateAdd(month, 1, Left(h.YMD_SALE, 6)+''01'')))), 0) as AMT_PLAN '
             +'                         from     MS_CODE '
             +'                         where    CD_STORE = :P0 '
             +'                           and    CD_KIND  = ''53'' '
             +'                           and    CD_CODE  = Left(h.YMD_SALE, 4)),0) as AMT_PLAN, '
             +'                  Count(*) as CNT_CUSTOMER, '
             +'                  case when Count(*) = 0 then Sum(h.AMT_SALE) else Round(Sum(h.AMT_SALE) / Count(*), 0) end as AMT_CUSTOMER_AVG, '
             +'                  Sum(h.AMT_BUY) as AMT_BUY, '
             +'                  Sum(i.AMT_SALE_SELF)   as AMT_SALE_DIRECT, '
             +'                  Sum(i.AMT_SALE_RENTAL) as AMT_SALE_RENT, '
             +'                  Sum(i.AMT_SALE_FEE) as AMT_SALE_FEE, '
             +'                  Sum(i.AMT_SALE_SALED)  as AMT_SALE_SALED, '
             +'                  sum(case when h.NO_DELIVERY = '''' then 0 else 1 end) as CNT_DELIVERY, '
             +'                  sum(case when h.NO_DELIVERY = '''' then 0 else h.AMT_SALE end) as AMT_DELIVERY, '
             +'                  SUM(h.AMT_CASH+h.AMT_CHECK) as AMT_CASH, '
             +'                  SUM(h.AMT_CARD) as AMT_CARD, '
             +'                  SUM(h.AMT_TRUST) as AMT_TRUST, '
             +'                  SUM(h.AMT_GIFT) as AMT_GIFT, '
             +'                  SUM(h.AMT_CASHRCP) as AMT_CASHRCP, '
             +'                  SUM(h.AMT_OKC) as AMT_OKC, '
             +'                  SUM(h.AMT_TMONEY) as AMT_TMONEY  '
             +'         from     SL_SALE_H as h inner join '
             +'                 (select   d.CD_STORE, '
             +'                           d.YMD_SALE, '
             +'                           d.NO_POS, '
             +'                           d.NO_RCP, '
             +'                           Sum(case when t.DS_TRDPL is null or t.DS_TRDPL not in (''R'', ''C'', ''E'') then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_SELF,  '
             +'                           Sum(case when t.DS_TRDPL in (''R'', ''E'') then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_RENTAL, '
             +'                           Sum(case when t.DS_TRDPL = ''C'' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_FEE, '
             +'                           SUM(case when g.DS_STOCK = ''2'' then d.AMT_SALE-d.DC_TOT else 0 end) as AMT_SALE_SALED '
             +'                  from     SL_SALE_D as d inner join '
             +'                           MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS left outer join '
             +'                           MS_TRD    as t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
             +'                  where    d.CD_STORE = :P0 '
             +'                    and    d.YMD_SALE in '+vDate
             +'                    and    d.DS_SALE <> ''V'' '
             +'                  group by d.CD_STORE, d.YMD_SALE, d.NO_POS, d.NO_RCP) as i on h.CD_STORE = i.CD_STORE and h.YMD_SALE = i.YMD_SALE and h.NO_POS = i.NO_POS and h.NO_RCP = i.NO_RCP '
             +'         where    h.CD_STORE = :P0 '
             +'           and    h.YMD_SALE in '+vDate
             +'           and    h.DS_SALE <> ''V'' '
             +'         group by h.CD_STORE, h.YMD_SALE '
             +'         ) t ',
             [StoreCode],
             false);

    //상품판매내역
    ExecQuery('delete from SL_CLOSE_GOODS '
             +' where CD_STORE =:P0 '
             +'   and YMD_CLOSE in '+vDate,
             [StoreCode],
             false);

    ExecQuery('insert into SL_CLOSE_GOODS (CD_STORE, '
             +'                            YMD_CLOSE, '
             +'                            CD_GOODS, '
             +'                            QTY_SALE, '
             +'                            AMT_NET, '
             +'                            AMT_TAX, '
             +'                            AMT_DUTYFREE, '
             +'                            AMT_BUY, '
             +'                            AMT_DC, '
             +'                            AMT_SALE, '
             +'                            AMT_BOTTLE) '
             +' select CD_STORE, '
             +'        YMD_SALE, '
             +'        CD_GOODS, '
             +'        SUM(QTY_SALE), '
             +'        SUM(CASE WHEN AMT_VAT <> 0 THEN AMT_SALE-DC_TOT ELSE 0 END), '
             +'        SUM(AMT_VAT), '
             +'        SUM(CASE WHEN AMT_VAT = 0 THEN AMT_SALE-DC_TOT ELSE 0 END), '
             +'        SUM(AMT_BUY), '
             +'        SUM(DC_TOT), '
             +'        SUM(AMT_SALE-DC_TOT), '
             +'        SUM(AMT_BOTTLE) '
             +'  from  SL_SALE_D '
             + 'where  CD_STORE = :P0 '
             +'   and  YMD_SALE in '+vDate
             +'   and  DS_SALE <> ''V'' '
             +' group by CD_STORE, YMD_SALE, CD_GOODS ',
             [StoreCode],
             false);

    CommitTrans;
    MsgBox('마감이 완료 되었습니다');
    GridTableView.Controller.ClearSelection;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
  Screen.Cursor := crDefault;
end;



end.
