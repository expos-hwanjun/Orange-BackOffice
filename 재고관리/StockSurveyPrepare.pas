// 실사 준비 (완료)

unit StockSurveyPrepare;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inherit, Menus, UniProvider, SQLServerUniProvider, Uni, DB,
  cxGraphics, cxButtonEdit, cxDropDownEdit, cxContainer, cxEdit, StdCtrls,
  ExtCtrls, MemDS, cxLabel, cxControls, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvToolBar, StrUtils, AdvToolBarStylers, cxStyles,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, cxClasses;

type
  TStockSurveyPrepareForm = class(TInheritForm)
    GoodsClassDownloadGridPanel: TGridPanel;
    PrepareButton: TButton;
    PrepareCancelButton: TButton;

    procedure FormCreate(Sender: TObject);
    procedure PrepareButtonClick(Sender: TObject);
    procedure PrepareCancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  StockSurveyPrepareForm: TStockSurveyPrepareForm;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockSurveyPrepareForm.FormCreate(Sender: TObject);
var
  vYear, vMonth, vDay: Word;
begin
  inherited;

  // 이번 달과 지난 달(월초일 때를 대비)만 선택할 수 있도록 한다
  DecodeDate(Date, vYear, vMonth, vDay);
  ConditionToolBarComboBox.Properties.Items.Add(IntToStr(vYear) +'-'+ FormatFloat('00', vMonth));
  if vMonth = 1 then
    ConditionToolBarComboBox.Properties.Items.Insert(0, IntToStr(vYear-1) +'-12')
  else
    ConditionToolBarComboBox.Properties.Items.Insert(0, IntToStr(vYear) +'-'+ FormatFloat('00', vMonth-1));
  ConditionToolBarComboBox.ItemIndex := 1;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 실사 준비 버튼
procedure TStockSurveyPrepareForm.FormShow(Sender: TObject);
begin
  inherited;
  // 실사 준비가 되어 있는지 확인한다
  OpenQuery('select   YMD_SILSA '
           +'from     MS_STORE '
           +'where    CD_STORE = :P0',
            [StoreCode]);
  try
    if Query.Fields[0].AsString = EmptyStr then
    begin
      ConditionToolBarComboBox.Enabled := true;
      PrepareCancelButton.Enabled      := false;
    end
    else
    begin
      PrepareButton.Caption := Format('%s년%s월', [LeftStr(Query.Fields[0].AsString,4), RightStr(Query.Fields[0].AsString,2)]) +#13#13+'실사 중';
      ConditionToolBarComboBox.Enabled := false;
      PrepareButton.Enabled            := false;
      PrepareCancelButton.Enabled      := true;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TStockSurveyPrepareForm.PrepareButtonClick(Sender: TObject);
var
  vDate: string;
  vResult, vIsDelete: Boolean;
begin
  inherited;
  // 이번 달에 판매는 했지만 POS 마감을 하지 않은 날짜가 있는지 확인한다
  OpenQuery('select   Top 1 YMD_CLOSE, '
           +'         NO_POS '
           +'  from   SL_POSCLOSE'
           +' where   CD_STORE  =:P0 '
           +'   and   YMD_CLOSE like :P1 + ''%'' '
           +'   and   DS_STATUS = ''O'' '
           +'order by YMD_CLOSE, NO_POS',
            [StoreCode,
             GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex])]);
  try
    if not Query.Eof then
    begin
      // 실사 준비하는 달이 지난 달이거나,
      // 이번 달인데 POS마감 안 한 날짜가 오늘 이전이거나,
      // 마감 전 실사 허용 옵션이 꺼져 있으면 에러 표시
      if ((ConditionToolBarComboBox.ItemIndex = 0) or
         (Query.Fields[0].AsString < DtoS(Date))) and
         (CheckOption(168, '0')) then
      begin
        ErrBox(Format('%s일 %s번 POS 마감이 되지 않아'#13'실사 준비를 할 수 없습니다.', [DateToString(Query.Fields[0].AsString), Query.Fields[1].AsString]));
        FinishQuery;
        Exit;
      end;
    end;
  finally
    FinishQuery;
  end;

  // 월마감이 되었으면 실사 준비를 못한다
  if OpenQuery('select   Top 1 YM_STOCK '
              +'from     SL_STOCK_MONTH '
              +'where    CD_STORE = :P0 '
              +'  and    YM_STOCK = :P1 '
              +'  and    YN_CLOSE = ''Y''',
               [StoreCode,
                GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex])],
                true) then
  begin
    ErrBox('월 마감이 된 년월에는 실사 준비를 할 수 없습니다.');
    FinishQuery;
    Exit;
  end;

  // 지난 달 월마감이 되지 않았으면 실사 준비를 못한다
  if not OpenQuery('select   Top 1 YM_STOCK '
                  +'from     SL_STOCK_MONTH '
                  +'where    CD_STORE = :P0 '
                  +'  and    YM_STOCK = :P1',
                   [StoreCode,
                    GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex])],
                    true) then
  begin
    ErrBox('지난 달 월 마감이 되지 않아 실사 준비를 할 수 없습니다.');
    FinishQuery;
    Exit;
  end;

  vIsDelete := false;
  try
    OpenQuery('select count(*) '
             +'  from SL_SILSA '
             +' where  CD_STORE = :P0 '
             +'   and  YM_SILSA = :P1 '
             +'   and  QTY_SETTLE <> 0 '
             +'   and  QTY_SILSA is not null',
              [StoreCode,
               GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex])]);
    if Query.Fields[0].AsInteger > 0 then
    begin
      if not AskBox('이미 실사된 상품이 있습니다'+#13+'실사된 상품을 제외한 상품만 실사준비를 하시겠습니까?') then
        vIsDelete := true;

      if vIsDelete and not AskBox('이번달에 실사한 내역은 모두 삭제됩니다'+#13+'계속하시겠습니까?') then
        vIsDelete := false;
    end;
  finally
    FinishQuery;
  end;

  // 실사 준비가 되어 있는지 확인한다
  OpenQuery('select   YMD_SILSA '
           +'from     MS_STORE '
           +'where    CD_STORE = :P0',
            [StoreCode]);
  try
    if (Query.Fields[0].AsString <> '') and
       (not AskBox('실사 준비가 이미 되어 있습니다.'#13'실사 준비를 다시 하시겠습니까?')) then
    begin
      FinishQuery;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  // 이미 이번 달에 실사 파악이 된 상품을 제외한 나머지 상품을 실사 준비 상태로 Insert한다
  try
    BeginTrans;
    Screen.Cursor := crSQLWait;

    ShowMsg('실사 준비를 하고 있습니다. 잠시 기다리십시오.');

    vDate := GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex]) + IfThen(ConditionToolBarComboBox.ItemIndex = 1, Copy(DtoS(Date),7,2), '31');

    //이번달에 기 실사된 내역을 삭제한다
    if vIsDelete then
      ExecQuery('delete from SL_SILSA '
               +' where CD_STORE = :P0 '
               +'   and YM_SILSA = :P1 ',
                [StoreCode,
                 GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex])],
                 false);

    vResult := ExecQuery('delete from SL_SILSA '
                        +' where CD_STORE = :P0 '
                        +'   and YM_SILSA = :P1 '
                        +'   and QTY_SILSA is null',
                         [StoreCode,
                          GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex])],
                          false);
    if vResult then
      vResult := ExecQuery('insert into SL_SILSA '
                          +'( '
                          +'  CD_STORE, YM_SILSA, CD_GOODS, QTY_STOCK, CD_SAWON_CHG, DT_CHANGE '
                          +') '
                          +'select   a.CD_STORE, '
                          +'         Left(:P1, 6) as YM_SILSA, '
                          +'         a.CD_MENU as CD_GOODS, '
                          +'         IsNull(c.QTY_STOCK,0) as QTY_STOCK, '
                          +'         :P2 as CD_SAWON_CHG, '
                          +'         GetDate() as DT_CHANGE '
                          +'from     MS_MENU as a inner join '
                          +'        (select   CD_STORE, '
                          +'                  CD_GOODS, '
                          +'                  Sum(QTY_STOCK) as QTY_STOCK '
                          +'         from    (select   CD_STORE, '
                          +'                           CD_GOODS, '
                          +'                           QTY_BASE as QTY_STOCK '
                          +'                  from     SL_STOCK_MONTH '
                          +'                  where    CD_STORE = :P0 '
                          +'                    and    YM_STOCK = Left(:P1, 6) '
                          +'                  union all '
                          +'                  select   CD_STORE, '
                          +'                           CD_GOODS, '
                          +'                           Sum(QTY_BUY) as QTY_STOCK '
                          +'                  from     SL_BUY_D '
                          +'                  where    CD_STORE = :P0 '
                          +'                    and    YMD_BUY between Left(:P1, 6) + ''01'' and :P1 '
                          +'                  group by CD_STORE, CD_GOODS '
                          +'                  union all '
                          +'                  select   g.CD_STORE, '
                          +'                           g.CD_MENU as CD_GOODS, '
                          +'                           - dbo.GetUnitQty(g.CD_STORE, g.CD_MENU, Sum(g.QTY_SALE)) as QTY_STOCK '
                          +'                  from     SL_SALE_D_SUM as g inner join '
                          +'                           MS_MENU       as h on g.CD_STORE = h.CD_STORE and g.CD_MENU = h.CD_MENU and h.DS_STOCK = ''1''  '
                          +'                  where    g.CD_STORE = :P0 '
                          +'                    and    g.YMD_SALE between Left(:P1, 6) + ''01'' and :P1 '
                          +'                  group by g.CD_STORE, g.CD_MENU '
                          +'                  union all '
                          +'                  select   g.CD_STORE, '
                          +'                           g.CD_MENU as CD_GOODS, '
                          +'                           - dbo.GetUnitQty(g.CD_STORE, g.CD_MENU, Sum(g.QTY_SALE)) as QTY_STOCK '
                          +'                  from     SL_SALE_S     as g inner join '
                          +'                           MS_MENU       as h on g.CD_STORE = h.CD_STORE and g.CD_MENU = h.CD_MENU and h.DS_STOCK = ''1''  '
                          +'                  where    g.CD_STORE = :P0 '
                          +'                    and    g.YMD_SALE between Left(:P1, 6) + ''01'' and :P1 '
                          +'                  group by g.CD_STORE, g.CD_MENU '
                          +'                  union all '
                          +'                  select   CD_STORE, '
                          +'                           CD_GOODS, '
                          +'                           - Sum(QTY_DISUSE) as QTY '
                          +'                  from     SL_DISUSE  '
                          +'                  where    CD_STORE = :P0 '
                          +'                    and    YMD_DISUSE between Left(:P1, 6) + ''01'' and :P1 '
                          +'                  group by CD_STORE, CD_GOODS) as stock '
                          +'         group by CD_STORE, CD_GOODS) as c on a.CD_STORE = c.CD_STORE and a.CD_MENU = c.CD_GOODS left outer join '
                          +'         (select  CD_GOODS  '
                          +'           from   SL_SILSA '
                          +'           where  CD_STORE = :P0 '
                          +'             and  YM_SILSA = Left(:P1, 6)) as d on d.CD_GOODS = a.CD_MENU '
                          +'where    a.CD_STORE = :P0 '
                          +'  and    a.DS_STOCK = ''1'' '
                          +'  and    a.CD_MENU <> ''00000000'' '
                          +'  and    a.YN_USE   = ''Y'' '
                          +'  and    d.CD_GOODS is null ',
                           [StoreCode,
                            vDate,
                            UserCode],
                            false);
    if vResult then
      ExecQuery('update MS_STORE '
               +'set    YMD_SILSA = :P1 '
               +'where  CD_STORE  = :P0 ',
                [StoreCode,
                 GetOnlyNumber(ConditionToolBarComboBox.Properties.Items[ConditionToolBarComboBox.ItemIndex])],
                 false);
    ShowMsg;

    CommitTrans;
    MsgBox('실사 준비가 완료 되었습니다.'#13#13'주의!!!'#13'실사 도중 판매 또는 매입 등을 할 경우 실사가 정확히 이루어질 수 없으므로 [실사 확정] 전까지는 판매 또는 매입을 하지 마시기 바랍니다.');
    FormShow(nil);
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
  Screen.Cursor := crDefault;
end;
//------------------------------------------------------------------------------
// 실사 준비 취소 버튼
procedure TStockSurveyPrepareForm.PrepareCancelButtonClick(Sender: TObject);
var
  vPrepareDate: string;
  vResult: Boolean;
begin
  inherited;

  // 실사 준비가 되어 있는지 확인한다
  OpenQuery('select   YMD_SILSA '
           +'from     MS_STORE '
           +'where    CD_STORE = :P0',
            [StoreCode]);
  try
    vPrepareDate := Query.Fields[0].AsString;
    if vPrepareDate = '' then
    begin
      ErrBox('실사 준비가 되어 있지 않습니다.');
      FinishQuery;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  // 이미 진행한 실사가 있는지 확인한다
  OpenQuery('select   Top 1 a.CD_GOODS '
           +'from     SL_SILSA_TEMP as a inner join '
           +'         SL_SILSA as b on a.CD_STORE = b.CD_STORE and a.YM_SILSA = b.YM_SILSA and a.CD_GOODS = b.CD_GOODS '
           +'where    a.CD_STORE = :P0 '
           +'  and    a.YM_SILSA = :P1 '
           +'  and    b.QTY_SILSA is null',
            [StoreCode,
             vPrepareDate]);
  try
    if not Query.Eof and  (Query.Fields[0].AsString <> '') and
       (not AskBox('실사 등록을 한 상품이 있습니다.'#13'등록한 내역을 삭제하시겠습니까?')) then
    begin
      FinishQuery;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  if not AskBox('실사 준비를 취소하시겠습니까?') then
    Exit;

  // 실사 준비 취소를 한다
  try
    BeginTrans;

    // 실사 등록 내역을 지운다
    vResult := ExecQuery('delete from SL_SILSA_TEMP '
                        +'from   SL_SILSA as b inner join '
                        +'       SL_SILSA_TEMP on b.CD_STORE = SL_SILSA_TEMP.CD_STORE and b.YM_SILSA = SL_SILSA_TEMP.YM_SILSA and b.CD_GOODS = SL_SILSA_TEMP.CD_GOODS '
                        +'where  SL_SILSA_TEMP.CD_STORE = :P0 '
                        +'  and  SL_SILSA_TEMP.YM_SILSA = :P1 '
                        +'  and  b.QTY_SILSA is null',
                         [StoreCode,
                          vPrepareDate],
                          false);

    // 실사 테이블에서 실사 등록되지 않은 값들을 지운다
    if vResult then
      vResult := ExecQuery('delete from SL_SILSA '
                          +'where  CD_STORE = :P0 '
                          +'  and  YM_SILSA = :P1 '
                          +'  and  QTY_SILSA is null',
                           [StoreCode,
                            vPrepareDate],
                            false);
    // 실사 완료 세팅
    if vResult then
      ExecQuery('update MS_STORE '
               +'set    YMD_SILSA = null, '
               +'       DT_CHANGE = GetDate() '
               +'where  CD_STORE  = :P0',
                [StoreCode],
                 false);

    CommitTrans;
    MsgBox('실사 준비를 취소 했습니다.');
    PrepareButton.Caption := '실사 준비';
    PrepareButton.Enabled := true;
    PrepareCancelButton.Enabled := false;

  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;

end.
