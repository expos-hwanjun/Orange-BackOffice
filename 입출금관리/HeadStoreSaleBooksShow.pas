unit HeadStoreSaleBooksShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridDBTableView, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxButtonEdit, DateUtils, cxCurrencyEdit;

type
  THeadStoreSaleBooksShowForm = class(TInheritShow2Form)
    ConditionToolBarStoreCodeEdit: TcxButtonEdit;
    ConditionToolBarStoreNameLabel: TcxLabel;
    GridDBTableViewSaleDate: TcxGridDBColumn;
    GridDBTableViewSaleDetails: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewGetAmt: TcxGridDBColumn;
    GridDBTableViewBalanceAmt: TcxGridDBColumn;
    GridDBTableViewDcAmt: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewOrderUnit: TcxGridDBColumn;
    GridSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubDBTableViewSalePrice: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewLink: TcxGridDBColumn;
    GridDBTableViewLink: TcxGridDBColumn;
    GridDBTableViewReturnAmt: TcxGridDBColumn;
    procedure ConditionToolBarStoreCodeEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure EditPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
  private
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
    ReportMaster,
    ReportDetail: TList;
    MasterNo: Integer;
    DetailNo: Integer;
    function  SearchStore(aStore: string = ''): string;
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  HeadStoreSaleBooksShowForm: THeadStoreSaleBooksShowForm;

implementation
uses
  Common, DBModule, Help;

{$R *.dfm}

{ THeadStoreSaleBooksShowForm }
procedure THeadStoreSaleBooksShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet    := MemData;
  SubDataSource.DataSet := SubMemData;
end;

procedure THeadStoreSaleBooksShowForm.ClearGrid;
begin
  GridSubDBTableView.DataController.DataSource := nil;
  GridDBTableView.DataController.DataSource    := nil;
end;

procedure THeadStoreSaleBooksShowForm.ConditionToolBarStoreCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchStore(ConditionToolBarStoreCodeEdit.Text);
end;

function THeadStoreSaleBooksShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vTotalAmt :Currency;
begin
  if ConditionToolBarStoreCodeEdit.Text = EmptyStr then
  begin
    MsgBox('매장을 선택하십시오.');
    Result := true;
    Exit;
  end;

  Screen.Cursor := crSQLWait;

  ExecQuery('delete from TEMP_SALE '
           +' where CD_HEAD     =:P0 '
           +'   and MAC_ADDRESS =:P1;',
            [HeadStoreCode,
             GetMacAddress],true);

  ExecQuery('insert into TEMP_SALE(CD_HEAD, CD_STORE, MAC_ADDRESS, YMD_SALE, CD_MENU, PR_SALE, QTY_SALE, AMT_SALE, SEQ, QTY_BUY) '
           +'select CD_HEAD, '
           +'       CD_STORE, '
           +'       :P4, '
           +'       YMD_SALE, '
           +'       CD_GOODS, '
           +'       PR_SALE, '
           +'       QTY_SALE, '
           +'       AMT_SALE, '
           +'       SEQ, '
           +'       0 '
           +'from '
           +'    (select CD_HEAD, '
           +'            CD_STORE, '
           +'            YMD_SALE, '
           +'            CD_GOODS, '
           +'            PR_SALE, '
           +'            Sum(QTY_SALE) as QTY_SALE, '
           +'            Sum(AMT_SALE) as AMT_SALE, '
           +'            Min(SEQ) as SEQ '
           +'       from OL_SALE_D  '
           +'      where CD_HEAD  = :P0 '
           +'        and YMD_SALE between :P1 and :P2 '
           +'        and CD_STORE = :P3 '
           +'        and QTY_SALE < 0 '
           +'      group by CD_HEAD, CD_STORE, YMD_SALE, CD_GOODS, PR_SALE '
           +'     union all '
           +'     select CD_HEAD, '
           +'            CD_STORE, '
           +'            YMD_SALE, '
           +'            CD_GOODS, '
           +'            PR_SALE, '
           +'            Sum(QTY_SALE) as QTY_SALE, '
           +'            Sum(AMT_SALE) as AMT_SALE, '
           +'            Min(SEQ)+1000 as SEQ '
           +'       from OL_SALE_D  '
           +'      where CD_HEAD  = :P0 '
           +'        and YMD_SALE between :P1 and :P2 '
           +'        and CD_STORE = :P3 '
           +'        and QTY_SALE > 0 '
           +'      group by CD_HEAD, CD_STORE, YMD_SALE, CD_GOODS, PR_SALE) as t;',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarStoreCodeEdit.Text,
            GetMacAddress],true);


  OpenQuery('select 1 as SEQ, '
           +'       '''' as YMD_SALE, '
           +'       ''이월금액'' as SALE_DETAIL, '
           +'       0 as AMT_SALE, '
           +'       0 as AMT_RETURN, '
           +'       0 as AMT_GET, '
           +'       0 as AMT_DC, '
           +'       Sum(ifnull(AMT_BASE,0) + ifnull(AMT_SALE,0) - ifnull(AMT_RETURN,0)- ifnull(AMT_GET,0)) as AMT_BALANCE, '
           +'       '''' as LINK '
           +'from  (select  AMT_BASE, '
           +'               0 as AMT_SALE, '
           +'               0 as AMT_RETURN, '
           +'               0 as AMT_GET '
           +'         from  SL_BOOKS_MONTH  '
           +'        where  CD_HEAD  = :P0 '
           +'          and  CD_STORE = ''00000000'' '
           +'          and  CD_CLOSE = '''+varOrderClose+''' '
           +'          and  CD_CODE  =:P3 '
           +'          and  YM_CLOSE = Left(:P1,6) '
           +'       union all '
           +'       select  0 as AMT_BASE, '
           +'               Sum(case when DS_SALE = ''S'' then AMT_SALE else 0 end) as AMT_SALE, '
           +'               Sum(case when DS_SALE = ''R'' then Abs(AMT_SALE) else 0 end) as AMT_RETURN, '
           +'               0 as AMT_GET '
           +'         from  OL_SALE_H  '
           +'        where  CD_HEAD   =:P0 '
           +'          and  CD_STORE =:P3 '
           +'          and  YMD_SALE between ConCat(Left(:P1,6),''01'') and :P4 '
           +'       union all '
           +'       select  0 as AMT_BASE, '
           +'               0 as AMT_SALE, '
           +'               0 as AMT_RETURN, '
           +'               Sum(AMT_PAYIN+AMT_DC) as AMT_GET '
           +'         from  SL_ACCT  '
           +'        where  CD_HEAD   =:P0 '
           +'          and  CD_STORE  =''00000000'' '
           +'          and  YMD_OCCUR between ConCat(Left(:P1,6),''01'') and :P4 '
           +'          and  CD_MEMBER =:P3 '
           +'          and  CD_ACCT = '''+varGetCode+''''
           +'          ) as t '
           +'union all '
           +'select 3, '
           +'       StoD(a.YMD_SALE) as YMD_SALE, '
           +'       ConCat(d.NM_GOODS,'' 외 '', Cast(c.CNT_GOODS-1 as Char),''건''), '
           +'       a.AMT_SALE, '
           +'       a.AMT_RETURN, '
           +'       0, '
           +'       0, '
           +'       0, '
           +'       a.YMD_SALE as LINK '
           +'  from (select YMD_SALE, '
           +'               Sum(case when DS_SALE = ''S'' then AMT_SALE else 0 end) as AMT_SALE, '
           +'               Sum(case when DS_SALE = ''R'' then Abs(AMT_SALE) else 0 end) as AMT_RETURN '
           +'          from OL_SALE_H '
           +'         where CD_HEAD   = :P0 '
           +'           and CD_STORE  = :P3 '
           +'           and YMD_SALE between :P1 and :P2 '
           +'         group by YMD_SALE '
           +'        ) a left outer join '
           +'       (select s.YMD_SALE, '
           +'               Min(s.CD_MENU) as CD_GOODS '
           +'         from ( '
           +'               select CD_HEAD, '
           +'                      CD_STORE, '
           +'                      MAC_ADDRESS, '
           +'        		           YMD_SALE, '
           +'                      Min(SEQ) as SEQ '
           +'                 from TEMP_SALE '
           +'                where CD_HEAD     =:P0 '
           +'                  and CD_STORE    =:P3 '
           +'                  and MAC_ADDRESS =:P5 '
           +'                group by CD_STORE, YMD_SALE '
           +'               ) as t inner join '
           +'               TEMP_SALE as s on s.CD_HEAD     = t.CD_HEAD '
           +'                             and s.CD_STORE    = t.CD_STORE '
           +'                             and s.MAC_ADDRESS = t.MAC_ADDRESS '
           +'                             and s.YMD_SALE    = t.YMD_SALE '
           +'                             and s.SEQ         = t.SEQ  '
           +'         group by s.YMD_SALE  ) b on b.YMD_SALE = a.YMD_SALE left outer join '
           +'       (select YMD_SALE, '
           +'               Count(CD_MENU) as CNT_GOODS '
           +'          from TEMP_SALE '
           +'         where CD_HEAD     =:P0 '
           +'           and CD_STORE    =:P3 '
           +'           and MAC_ADDRESS =:P5 '
           +'         group by YMD_SALE) c on c.YMD_SALE = a.YMD_SALE left outer join '
           +'       MS_GOODS d on d.CD_HEAD  = :P0 '
           +'                 and d.CD_STORE = ''00000000'' '
           +'                 and d.CD_GOODS = b.CD_GOODS '
           +'union all '
           +'select   2 as SEQ, '
           +'         StoD(YMD_OCCUR), '
           +'         ''결제금액'' as NM_GOODS, '
           +'         0 as AMT_SALE, '
           +'         0 as AMT_RETURN, '
           +'         Sum(AMT_PAYIN) as AMT_GET, '
           +'         Sum(AMT_DC) as AMT_DC, '
           +'         0 as AMT_BALANCE, '
           +'         '''' as LINK '
           +'from     SL_ACCT '
           +'where    CD_HEAD   =:P0 '
           +'and      CD_MEMBER =:P3 '
           +'and      CD_ACCT = '''+varGetCode+''''
           +'and      YMD_OCCUR between :P1 and :P2 '
           +'group by YMD_OCCUR '
           +'order by 2,1 ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarStoreCodeEdit.Text,
            DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
            GetMacAddress]);

  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;
  Result := GridDBTableView.DataController.RecordCount > 0;

  if not Result then Exit;

  OpenQuery('select d.YMD_SALE, '
           +'       d.CD_MENU as CD_GOODS, '
           +'       Max(g.NM_GOODS) as NM_GOODS, '
           +'       Max(g.NM_UNIT) as NM_UNIT, '
           +'       SUM(d.QTY_SALE) as QTY_SALE, '
           +'       d.PR_SALE, '
           +'       SUM(d.AMT_SALE) as AMT_SALE, '
           +'       d.YMD_SALE as LINK '
           +'  from TEMP_SALE d inner join '
           +'       MS_GOODS  g  on g.CD_HEAD and g.CD_STORE = ''00000000'' and g.CD_GOODS = d.CD_MENU '
           +' where d.CD_HEAD     =:P0 '
           +'   and d.CD_STORE    =:P1 '
           +'   and d.MAC_ADDRESS =:P2 '
           +' group by d.YMD_SALE, d.CD_MENU, d.PR_SALE, d.SEQ '
           +' order by d.YMD_SALE, d.SEQ ',
           [HeadStoreCode,
            ConditionToolBarStoreCodeEdit.Text,
            GetMacAddress]);
  GridSubDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, SubMemData);
  GridSubDBTableView.DataController.DataSource := SubDataSource;

  try
    GridDBTableView.DataController.BeginUpdate;
    vTotalAmt := 0;
    for vIndex := 0 to GridDBTableView.DataController.RecordCount-1 do
    begin
      if GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleDetails.Index] = '이월금액' then
        vTotalAmt := GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index]
      else if GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleDetails.Index] = '결제금액' then
      begin
        GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index] := vTotalAmt - GridDBTableView.DataController.Values[vIndex, GridDBTableViewGetAmt.Index]-GridDBTableView.DataController.Values[vIndex, GridDBTableViewDcAmt.Index] ;
        vTotalAmt := GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index];
      end
      else
      begin
        GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index] := vTotalAmt + GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleAmt.Index] - GridDBTableView.DataController.Values[vIndex, GridDBTableViewReturnAmt.Index];
        vTotalAmt := GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index];
      end;
    end;
  finally
    GridDBTableView.DataController.EndUpdate;
  end;

  ReportSubTitle := Format('조회매장 : %s-%s',[ConditionToolBarStoreCodeEdit.Text, ConditionToolBarStoreNameLabel.Caption]);
end;

procedure THeadStoreSaleBooksShowForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = ConditionToolBarStoreCodeEdit) and (ConditionToolBarStoreCodeEdit.Text <> ConditionToolBarStoreCodeEdit.TextHint) then
  begin
    ConditionToolBarStoreCodeEdit.TextHint  := EmptyStr;
    ConditionToolBarStoreNameLabel.Caption  := EmptyStr;
    ClearGrid;
  end;

end;

procedure THeadStoreSaleBooksShowForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var vCode, vName :String;
begin
  inherited;
  if DisplayValue <> '' then
  begin
    try
      OpenQuery('select   CD_STORE, '
               +'         NM_STORE '
               +'from     MS_STORE '
               +'where    CD_HEAD   = :P0 '
               +'  and   (CD_STORE  = :P1 '
               +'      or NM_STORE like ConCat(''%'',:P1,''%'')) '
               +'  and    YN_USE = ''Y'' ',
               [HeadStoreCode,
                DisplayValue]);
      if not Query.Eof then
      begin
        vCode := Query.Fields[0].AsString;
        vName := Query.Fields[1].AsString;
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue              := vCode;
          ConditionToolBarStoreNameLabel.Caption := vName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
        begin
          Query.Close;
          DisplayValue := SearchStore(DisplayValue);
        end;
      end
      else
      begin
        ErrorText := Format('''%s'' 조건에 맞는 매장이 없습니다', [DisplayValue]);
        DisplayValue := EmptyStr;
        Error     := true;
      end;
    finally
      FinishQuery;
    end;
  end;

end;

function THeadStoreSaleBooksShowForm.SearchStore(aStore: string): string;
begin
  Result := EmptyStr;

  with THelpForm.Create(Self) do
    try
      Caption := '매장 조회';
      GridTableViewCode.Caption  := '매장코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '매장명';
      GridTableViewName1.Width   := 310;
      GridTableViewName2.Caption := '대표자';
      GridTableViewName2.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName3.Caption := '사업자번호';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      SQLText    := 'select   CD_STORE, '
                   +'         NM_STORE, '
                   +'         NM_BOSS, '
                   +'         GetBusinessNo(NO_BIZER) '
                   +'from     MS_STORE '
                   +'where    CD_HEAD   = :P0 '
                   +'  and    CD_STORE  <> ''00000000'' '
                   +'  and   (CD_STORE  = :P2 '
                   +'      or NM_STORE like ConCat(''%'',:P2,''%'')) '
                   +'  and    YN_USE = ''Y'' '
                   +'order by CD_STORE';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        ConditionToolBarStoreCodeEdit.Text     := Code;
        ConditionToolBarStoreCodeEdit.TextHint := Code;
        ConditionToolBarStoreNameLabel.Caption := Names[0];
        Result    := Code;
      end;
    finally
      Free;
    end;

end;

end.
