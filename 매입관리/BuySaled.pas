// 위탁상품 판매분 매입 (New완료)

//##### 덤, 장려금 정의?

unit BuySaled;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, Math,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, cxDBData, cxGridDBTableView, dxmdaset,
  ExtCtrls, AdvToolBarStylers, cxLookAndFeels, cxLookAndFeelPainters,
  DBAccess, Vcl.Grids, Vcl.DBGrids, CRGrid;

type
  TBuySaledForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridLevel: TcxGridLevel;
    GridSubLevel: TcxGridLevel;
    GridDBTableView: TcxGridDBTableView;
    GridSubDBTableView: TcxGridDBTableView;
    GridSubDBTableViewPosNo: TcxGridDBColumn;
    GridSubDBTableViewBillNo: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubDBTableViewBuyPrice: TcxGridDBColumn;
    GridSubDBTableViewBuyQty: TcxGridDBColumn;
    GridDBTableViewSaleDate: TcxGridDBColumn;
    GridDBTableViewCompanyName: TcxGridDBColumn;
    GridDBTableViewNetAmt: TcxGridDBColumn;
    GridDBTableViewVatAmt: TcxGridDBColumn;
    GridDBTableViewBuyAmt: TcxGridDBColumn;
    GridSubDBTableViewBuyAmt: TcxGridDBColumn;
    DataSource: TDataSource;
    SubDataSource: TDataSource;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
  private
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
  protected
    function  DoSearch: Boolean; override;
    function  DoSave  : Boolean; override;
  end;

var
  BuySaledForm: TBuySaledForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuySaledForm.FormCreate(Sender: TObject);
begin
  inherited;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet := MemData;
  SubDataSource.DataSet := SubMemData;
  DefaultDate := ddMonthFirst;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TBuySaledForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TBuySaledForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

  isChanged := GridDBTableView.DataController.RecordCount > 0;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TBuySaledForm.DoSearch: Boolean;
var
  vMonth, vMonthTo: string;
  vDate : string;
  vError: Boolean;
begin
  Result := false;

  try
    // 날짜 범위에 월마감을 한 달이 있는지 검사한다
    vMonth   := Copy(DtoS(ConditionToolBarFromDateEdit.Date), 1, 6);
    vMonthTo := Copy(DtoS(ConditionToolBarToDateEdit.Date),   1, 6);
    while vMonth <= vMonthTo do
    begin
      // 마감했는지 검사한다
      if OpenQuery('select   Top 1 YM_STOCK '
                  +'from     SL_STOCK_MONTH '
                  +'where    CD_STORE = :P0 '
                  +'  and    YM_STOCK = :P1 '
                  +'  and    YN_CLOSE = ''Y''',
                   [StoreCode,
                    vMonth],
                    true) then
      begin
        ErrBox(Format('%s-%s월 마감이 완료되어'#13'해당 기간의 판매분 매입을 잡을 수 없습니다.', [Copy(vMonth,1,4), Copy(vMonth,5,2)]));
        FinishQuery;
        Exit;
      end;
      // 마감했는지 비교할 달을 다음 달로 바꾼다
      if StoI(Copy(vMonth,5,2)) = 12 then
        vMonth := IntToStr(StoI(Copy(vMonth,1,4))+1)+'01'
      else
        vMonth := Copy(vMonth,1,4)+FormatFloat('00', StoI(Copy(vMonth,5,2))+1);
    end;

    // 마스터 쿼리를 열어 그리드에 보여준다
    OpenQuery('select   dbo.StoDW(s.YMD_SALE) as YMD_SALE, '
             +'         t.NM_TRDPL, '
             +'         s.AMT_BUY, '
             +'         s.AMT_NET, '
             +'         s.AMT_VAT, '
             +'         s.LINK '
             +'from    (select   d.CD_STORE, '
             +'                  d.YMD_SALE, '
             +'                  g.CD_TRDPL, '
             +'                  Sum(d.AMT_BUY)  as AMT_BUY, '
             +'                  Sum(case when g.DS_TAX = ''0'' then d.AMT_BUY else dbo.Ceil(d.AMT_BUY / 1.1)             end) as AMT_NET, '
             +'                  Sum(case when g.DS_TAX = ''0'' then 0         else d.AMT_BUY - dbo.Ceil(d.AMT_BUY / 1.1) end) as AMT_VAT, '
             +'                  d.YMD_SALE + g.CD_TRDPL as LINK '
             +'         from     SL_SALE_D   as d inner join '
             +'                  MS_GOODS    as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
             +'         where    d.CD_STORE = :P0 '
             +'           and    d.YMD_SALE between :P1 and :P2 '
             +'           and    d.DS_SALE  <> ''V'' '
             +'           and    g.DS_STOCK = ''2'' '
             +'           and   (not exists (select   CD_STORE '
             +'                              from     SL_BUY_H '
             +'                              where    CD_STORE    = d.CD_STORE '
             +'                                and    YMD_BUY     = d.YMD_SALE '
             +'                                and    YN_SALE_BUY = ''Y'')) '
             +'         group by d.CD_STORE, d.YMD_SALE, g.CD_TRDPL) as s inner join '
             +'         MS_TRD as t on s.CD_STORE = t.CD_STORE and s.CD_TRDPL = t.CD_TRDPL '
             +'order by s.LINK',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);

    GridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, GridDBTableView, MemData);
    GridDBTableView.DataController.DataSource := DataSource;

    if GridDBTableView.DataController.RecordCount > 0 then
    begin
      // 디테일 쿼리를 열어 그리드에 보여준다
      OpenQuery('select   d.NO_POS, '
               +'         d.NO_RCP, '
               +'         d.CD_GOODS, '
               +'         g.NM_GOODS, '
               +'         g.NM_SPEC, '
               +'         Round(d.AMT_BUY / d.QTY_SALE, 2) as PR_BUY, '
               +'         d.QTY_SALE, '
               +'         d.AMT_BUY, '
               +'         d.YMD_SALE + g.CD_TRDPL as LINK '
               +'from     SL_SALE_D as d inner join '
               +'         MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
               +'where    d.CD_STORE = :P0 '
               +'  and    d.YMD_SALE between :P1 and :P2 '
               +'  and    d.DS_SALE  <> ''V'' '
               +'  and    g.DS_STOCK = ''2'' '
               +'  and   (not exists (select   CD_STORE '
               +'                     from     SL_BUY_H '
               +'                     where    CD_STORE    = d.CD_STORE '
               +'                       and    YMD_BUY     = d.YMD_SALE '
               +'                       and    YN_SALE_BUY = ''Y'')) '
               +'order by d.YMD_SALE, g.CD_TRDPL, d.NO_POS, d.NO_RCP',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);
      GridSubDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, nil, SubMemData);
      GridSubDBTableView.DataController.DataSource := SubDataSource;

      // 날짜 범위에 POS마감이 모두 완료되었는지 검사한다
      GridDBTableView.BeginUpdate;
      try
        vDate  := EmptyStr;
        vError := false;
        MemData.Last;
        while not MemData.Bof do
        begin
          if vDate <> GetOnlyNumber(MemData.Fields[0].AsString) then
          begin
            vDate  := GetOnlyNumber(MemData.Fields[0].AsString);
            vError := false;
            OpenQuery('select   Top 1 NO_POS '
                     +'from    (select   NO_POS, '
                     +'                  Max(DT_CHANGE1) as DT_CHANGE1, '
                     +'                  Max(DT_CHANGE2) as DT_CHANGE2 '
                     +'         from    (select   NO_POS, '
                     +'                           Max(DT_SALE) as DT_CHANGE1, '
                     +'                           null         as DT_CHANGE2 '
                     +'                  from     SL_SALE_H '
                     +'                  where    CD_STORE = :P0 '
                     +'                    and    YMD_SALE = :P1 '
                     +'                  group by YMD_SALE, NO_POS '
                     +'                  union all '
                     +'                  select   NO_POS, '
                     +'                           null      as DT_CHANGE1, '
                     +'                           DT_CHANGE as DT_CHANGE2 '
                     +'                  from     SL_POSCLOSE '
                     +'                  where    CD_STORE  = :P0 '
                     +'                    and    YMD_CLOSE = :P1 '
                     +'                    and    DS_STATUS = ''C'') as a '
                     +'         group by NO_POS) as b '
                     +'where   (DT_CHANGE1 > DT_CHANGE2 or DT_CHANGE2 is null) '
                     +'order by NO_POS',
                      [StoreCode,
                       vDate]);
            try
              if not Query.Eof then
              begin
                vError := true;
                ErrBox(Format('%s일 %s번 POS 마감을 하지 않아 %s을 할 수 없습니다.'#13'POS 마감을 하고 다시 시도하거나 %s을 조정하십시오.',
                              [DateToString(vDate), Query.Fields[0].AsString, Caption, ConditionToolBarDateLabel.Caption]));
                MemData.Delete;
              end;
            finally
              FinishQuery;
            end;
          end
          else if vError then
            MemData.Delete;

          if not vError then
            MemData.Prior;
        end;
      finally
        GridDBTableView.EndUpdate;
        Result := GridDBTableView.DataController.RecordCount > 0;
        FinishQuery;
      end;
    end;
  except
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TBuySaledForm.DoSave: Boolean;
var
  vDateList,
  vDate,
  vCompanyCode,
  vBuySeq     : string;
  vNet,
  vVat,
  vNot,
  vBottle,
  vTotal      : Currency;
begin
  Result := false;

  try
    BeginTrans;

    // 그리드에 있는 판매 날짜들 목록을 구한다
    vDateList := EmptyStr;
    GridDBTableView.BeginUpdate;
    try
      MemData.First;
      while not MemData.Eof do
      begin
        if Pos(GetOnlyNumber(MemData.Fields[0].AsString), vDateList) = 0 then
          vDateList := vDateList + IfThen(vDateList = EmptyStr, EmptyStr, ',') + '''' + GetOnlyNumber(MemData.Fields[0].AsString) + '''';
        MemData.Next;
      end;
    finally
      GridDBTableView.EndUpdate;
    end;
    if vDateList = EmptyStr then
      Exit
    else
      vDateList := ' and a.YMD_SALE in (' + vDateList + ') ';


    // 판매분 매입 자료를 저장한다
    vDate        := EmptyStr;
    vCompanyCode := EmptyStr;
    vNet         := 0;
    vVat         := 0;
    vNot         := 0;
    vBottle      := 0;
    vTotal       := 0;
    DM.OpenQuery('select   a.YMD_SALE, '
                +'         b.CD_TRDPL, '
                +'         a.CD_GOODS, '
                +'         Sum(a.QTY_SALE)   as QTY_SALE, '
                +'         Max(a.PR_SALE)    as PR_SALE, '
                +'         Sum(a.AMT_BUY)    as AMT_BUY, '
                +'         Max(a.DS_TAX)     as DS_TAX, '
                +'         Sum(a.AMT_BOTTLE) as AMT_BOTTLE '
                +'from     SL_SALE_D as a inner join '
                +'         MS_GOODS  as b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
                +'where    a.CD_STORE = :P0 '
                +   vDateList
                +'  and    a.DS_SALE <> ''V'' '
                +'  and    b.DS_STOCK = ''2'' '
                +'  and    IsNull(b.CD_TRDPL,'''') <> '''' '
                +'  and   (not exists (select   CD_STORE '
                +'                     from     SL_BUY_H '
                +'                     where    CD_STORE    = a.CD_STORE '
                +'                       and    YMD_BUY     = a.YMD_SALE '
                +'                       and    YN_SALE_BUY = ''Y'')) '
                +'group by a.YMD_SALE, b.CD_TRDPL, a.CD_GOODS '
                +'order by a.YMD_SALE, b.CD_TRDPL, a.CD_GOODS',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  DtoS(ConditionToolBarToDateEdit.Date)]);
    try
      while not DM.Query.Eof do
      begin
        if (vDate <> DM.Query.Fields[0].AsString) or (vCompanyCode <> DM.Query.Fields[1].AsString) then
        begin
          // 매입 마스터 테이블을 추가한다
          if (vDate <> EmptyStr) and (vCompanyCode <> EmptyStr) then
            ExecQuery('insert into SL_BUY_H '
                     +'( '
                     +'  CD_STORE, YMD_BUY, NO_BUY, DS_BUY, CD_TRDPL, CD_WAREHOUSE, AMT_DUTY, AMT_TAX, AMT_DUTYFREE, AMT_BOTTLE, AMT_TRUST, CD_SAWON_CHG, DT_CHANGE, '
                     +'  YN_SALE_BUY, REMARK, DS_TRANS, DS_STATUS, DT_CONFIRM, DT_INSERT, CD_SAWON_INSERT, NO_DEVICE_INSERT, NO_DEVICE_CHG '
                     +') values ( '
                     +'  :P0, :P1, :P2, :P3, :P4, ''001'', :P5, :P6, :P7, :P8, :P9, :P10, GetDate(), ''Y'', :P11, 0, ''B'', null, getdate(), :P10, ''00'',''00''  '
                     +')',
                      [StoreCode,
                       vDate,
                       vBuySeq,
                       IfThen(vTotal >= 0, '0', '1'),
                       vCompanyCode,
                       vNet,
                       vVat,
                       vNot,
                       vBottle,
                       vTotal,
                       UserCode,
                       Caption],
                       false);
          vDate        := DM.Query.Fields[0].AsString;
          vCompanyCode := DM.Query.Fields[1].AsString;
          vNet         := 0;
          vVat         := 0;
          vNot         := 0;
          vBottle      := 0;
          vTotal       := 0;

          // 매입 순번을 알아낸다
          vBuySeq := EmptyStr;
          OpenQuery('select   IsNull(Max(NO_BUY),''0'') as NO_BUY '
                   +'from     SL_BUY_H '
                   +'where    CD_STORE = :P0 '
                   +'  and    YMD_BUY  = :P1',
                    [StoreCode,
                     vDate]);
          try
            vBuySeq := FormatFloat('0000', StoI(Query.Fields[0].AsString)+1);
          finally
            FinishQuery;
          end;
        end;

        // 매입 디테일 테이블을 추가한다
        ExecQuery('insert into SL_BUY_D '
                 +'( '
                 +'  CD_STORE, YMD_BUY, NO_BUY, CD_GOODS, SEQ, PR_BUY, QTY_BUY, AMT_DUTY, AMT_TAX, AMT_DUTYFREE, AMT_BOTTLE, PR_SALE '
                 +') values ( '
                 +'  :P0, :P1, :P2, :P3, 1, :P4, :P5, :P6, :P7, :P8, :P9, :P10 '
                 +')',
                  [StoreCode,
                   vDate,
                   vBuySeq,
                   DM.Query.Fields[2].AsString,
                   RoundNumber(DM.Query.Fields[5].AsCurrency / DM.Query.Fields[3].AsInteger, 0.01),
                   DM.Query.Fields[3].AsInteger,
                   IfThen(DM.Query.Fields[6].AsString = '1', CeilNumber(DM.Query.Fields[5].AsCurrency / TaxRate), 0),
                   IfThen(DM.Query.Fields[6].AsString = '1', DM.Query.Fields[5].AsCurrency - CeilNumber(DM.Query.Fields[5].AsCurrency / TaxRate), 0),
                   IfThen(DM.Query.Fields[6].AsString = '0', DM.Query.Fields[5].AsCurrency, 0),
                   DM.Query.Fields[7].AsCurrency,
                   DM.Query.Fields[4].AsCurrency],
                   false);
        vNet    := vNet    + IfThen(DM.Query.Fields[6].AsString = '1', CeilNumber(DM.Query.Fields[5].AsCurrency / TaxRate), 0);
        vVat    := vVat    + IfThen(DM.Query.Fields[6].AsString = '1', DM.Query.Fields[5].AsCurrency - CeilNumber(DM.Query.Fields[5].AsCurrency / TaxRate), 0);
        vNot    := vNot    + IfThen(DM.Query.Fields[6].AsString = '0', DM.Query.Fields[5].AsCurrency, 0);
        vBottle := vBottle + DM.Query.Fields[7].AsCurrency;
        vTotal  := vTotal  + DM.Query.Fields[5].AsCurrency;

        DM.Query.Next;
      end;

      // 매입 마스터 테이블을 추가한다
      if (vDate <> '') and (vCompanyCode <> '') then
        ExecQuery('insert into SL_BUY_H '
                 +'( '
                 +'  CD_STORE, YMD_BUY, NO_BUY, DS_BUY, CD_TRDPL, CD_WAREHOUSE, AMT_DUTY, AMT_TAX, AMT_DUTYFREE, AMT_BOTTLE, AMT_TRUST, CD_SAWON_CHG, DT_CHANGE, YN_SALE_BUY, REMARK, DS_TRANS, '
                 +'  DS_STATUS, DT_CONFIRM, DT_INSERT, CD_SAWON_INSERT, NO_DEVICE_INSERT, NO_DEVICE_CHG '
                 +') values ( '
                 +'  :P0, :P1, :P2, :P3, :P4, ''001'', :P5, :P6, :P7, :P8, :P9, :P10, GetDate(), ''Y'', :P11, 0, ''B'', null, getdate(), :P10, ''00'',''00'' '
                 +')',
                  [StoreCode,
                   vDate,
                   vBuySeq,
                   IfThen(vTotal >= 0, '0', '1'),
                   vCompanyCode,
                   vNet,
                   vVat,
                   vNot,
                   vBottle,
                   vTotal,
                   UserCode,
                   Caption],
                   false);
    finally
      DM.FinishQuery;
    end;

    CommitTrans;

    MsgBox(Format('%s을 완료했습니다.', [Caption]));
    Result := true;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;

end.
