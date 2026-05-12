unit MemberCreditBalanceShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, cxLabel,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, dxPScxGrid6Lnk, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, StrUtils, DateUtils, Math;

type
  TMemberCreditBalanceShowForm = class(TInheritShowForm)
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    BookGridTableView: TcxGridTableView;
    BookGridTableViewColumn1: TcxGridColumn;
    BookGridTableViewColumn2: TcxGridColumn;
    BookGridTableViewTrustAmt: TcxGridColumn;
    BookGridTableViewPayInAmt: TcxGridColumn;
    BookGridTableViewRemainAmt: TcxGridColumn;
    BookGridTableViewColumn6: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewDblClick(Sender: TObject);
    procedure BookGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberCreditBalanceShowForm: TMemberCreditBalanceShowForm;

implementation
uses Common;
{$R *.dfm}

{ TMemberCreditBalanceShowForm }

procedure TMemberCreditBalanceShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
end;

procedure TMemberCreditBalanceShowForm.GridActiveTabChanged(
  Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
  inherited;
  if ALevel = GridLevel then
    ConditionToolBarEdit.Clear;
end;

procedure TMemberCreditBalanceShowForm.GridTableViewDblClick(Sender: TObject);
begin
  inherited;
  GridLevel1.Caption := '['+GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index]+'] 외상 원장';
  ConditionToolBarEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberCode.Index];
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure TMemberCreditBalanceShowForm.BookGridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
  if (AItem <> nil) and (AItem.Index = BookGridTableViewColumn2.Index) and (ARecord.Values[BookGridTableViewColumn2.Index] = '결제') then
    AStyle := StyleFontRed;
end;

procedure TMemberCreditBalanceShowForm.ConditionToolBarEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    if not DoSearch then MsgBox(msgNoSearchData);
end;

function TMemberCreditBalanceShowForm.DoSearch: Boolean;
var
  vIndex    : Integer;
  vRemainAmt: Currency;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   a.CD_MEMBER, '
             +'         Max(b.NM_MEMBER)    as NM_MEMBER, '
             +'         Max(b.NO_CARD)      as NO_CARD, '
             +'         Max(b.TEL_MOBIL)    as TEL_MOBIL, '
             +'         Sum(AMT_BEFORE)     as AMT_BEFORE, '
             +'         Sum(a.AMT_TRUST)    as AMT_TRUST, '
             +'         Sum(a.AMT_PAYIN)    as AMT_PAYIN, '
             +'         Sum(Isnull(a.AMT_BEFORE,0) + Isnull(a.AMT_TRUST,0) - Isnull(a.AMT_PAYIN,0) ) as AMT_REMAIN, '
             +'         case when c.YMD_ACCT is null then ''없음'' else dbo.StoD(c.YMD_ACCT) end  as YMD_ACCT '
             +'from    (select CD_MEMBER, '
             +'                Sum(Isnull(AMT_BASE,0) + Isnull(AMT_TRUST,0) - Isnull(AMT_PAYIN,0)) as AMT_BEFORE, '
             +'                0 as AMT_TRUST, '
             +'                0 as AMT_PAYIN '
             +'         from '
             +'              (select CD_CODE as CD_MEMBER, '
             +'                      AMT_BASE, '
             +'                      0 as AMT_TRUST, '
             +'                      0 as AMT_PAYIN '
             +'               from   SL_BOOKS_MONTH '
             +'               where  CD_STORE =:P0 '
             +'                 and  YM_CLOSE = Left(:P1,6) '
             +'                 and  CD_CLOSE = ''20'' '
             +'                 and  CD_CODE <> '''' '
             +'               union all '
             +'               select CD_MEMBER, '
             +'                      0, '
             //01일까지 조회이면 월 기초 미지급만 사용
             +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0, ',' sum(AMT_TRUST), ')
             +'                      0 '
             +'               from   SL_SALE_H '
             +'               where  CD_STORE =:P0 '
             +'                 and  YMD_SALE between Left(:P1,6)+''01'' and :P3 '
             +'                 and  AMT_TRUST <> 0 '
             +'                 and  DS_SALE <> ''V'' '
             +'               group by CD_MEMBER '
             +'               union all '
             +'               select CD_MEMBER, '
             +'                      0, '
             +'                      0, '
             //01일까지 조회이면 월 기초 미지급만 사용
             +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0 ',' Sum(AMT_PAYIN + AMT_DC) ')
             +'               from   SL_ACCT '
             +'               where  CD_STORE = :P0 '
             +'                 and  YMD_OCCUR between Left(:P1,6)+''01'' and :P3 '
             +'                 and  CD_MEMBER <> '''' '
             +'                 and  CD_ACCT ='''+CreditIn+''''
             +'               group by CD_MEMBER '
             +'             ) t '
             +'         group by CD_MEMBER '
             +'         union all '
             +'         select   CD_MEMBER, '                                      // 매입 기간내금액
             +'                  0                   as AMT_BEFORE, '
             +'                  Sum(AMT_TRUST)      as AMT_TRUST, '
             +'                  0                   as AMT_PAYIN '
             +'         from     SL_SALE_H '
             +'         where    CD_STORE = :P0 '
             +'           and    YMD_SALE  between :P1 and :P2 '
             +'           and    DS_SALE <> ''V'' '
             +'           and    AMT_TRUSt <> 0 '
             +'         group by CD_MEMBER '
             +'         union all '
             +'         select   CD_MEMBER, '                                      // 지급 기간내금액
             +'                  0            as AMT_BEFORE, '
             +'                  0            as AMT_TRUST, '
             +'                  Sum(AMT_PAYIN+AMT_DC) as AMT_PAYIN '
             +'         from     SL_ACCT '
             +'         where    CD_STORE  = :P0 '
             +'           and    YMD_OCCUR between :P1 and :P2 '
             +'           and  CD_ACCT ='''+CreditIn+''''
             +'         group by CD_MEMBER) as a inner join '
             +'         MS_MEMBER as b on b.CD_STORE = :P5 and a.CD_MEMBER = b.CD_MEMBER left outer join  '
             +'         (select CD_STORE, CD_MEMBER, Max(YMD_OCCUR) as YMD_ACCT from SL_ACCT where CD_MEMBER <> '''' group by CD_STORE, CD_MEMBER) c on b.CD_STORE = c.CD_STORE and b.CD_MEMBER = c.CD_MEMBER '
             +'where b.CD_MEMBER =:P4 or b.NM_MEMBER like ''%''+:P4+''%'' '
             +'group by a.CD_MEMBER, c.YMD_ACCT '
             +'having Sum(Isnull(a.AMT_BEFORE,0) + Isnull(a.AMT_TRUST,0) - Isnull(a.AMT_PAYIN,0) ) > 0 ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
               ConditionToolBarEdit.Text,
               Ifthen(GetOption(257)='0', StoreCode,'0000')]);
    ReadQuery(GridTableView);
    Result := GridTableView.DataController.RowCount > 0;
  end
  else
  begin
    if Length(GetOnlyNumber(ConditionToolBarEdit.Text)) <> 10 then
    begin
      MsgBox('조회할 회원번호를 정확히 입력하십시오.');
      ConditionToolBarEdit.SetFocus;
      Result := true;
      Exit;
    end;
    OpenQuery('select   ''''     as YMD_SALE, '
             +'         ''0''    as SEQ, '
             +'         ''이월'' as DS_TYPE, '
             +'         0        as AMT_TRUST, '
             +'         0        as AMT_PAYIN, '
             +'         Sum(Isnull(AMT_BASE,0)+Isnull(AMT_TRUST,0)-Isnull(AMT_PAYIN,0))  as AMT_REMAIN, '
             +'         ''''                as REMARK '
             +'  from  (select Isnull(AMT_BASE,0) as AMT_BASE, '
             +'                0 as AMT_TRUST, '
             +'                0 as AMT_PAYIN '
             +'         from   SL_BOOKS_MONTH '
             +'         where  CD_STORE =:P0 '
             +'           and  YM_CLOSE = Left(:P2,6) '
             +'           and  CD_CLOSE = ''20'' '
             +'           and  CD_CODE  = :P1 '
             +'         union all '
             +'         select 0, '
             //01일까지 조회이면 월 기초 미지급만 사용
             +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0, ',' sum(Isnull(AMT_TRUST,0)), ')
             +'                0 '
             +'         from   SL_SALE_H '
             +'         where  CD_STORE =:P0 '
             +'           and  YMD_SALE between Left(:P2,6)+''01'' and :P4 '
             +'           and  CD_MEMBER = :P1 '
             +'           and  DS_SALE <> ''V'' '
             +'           and  AMT_TRUST <> 0 '
             +'         union all '
             +'         select 0, '
             +'                0, '
             //01일까지 조회이면 월 기초 미지급만 사용
             +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0 ',' Sum(Isnull(AMT_PAYIN,0) + Isnull(AMT_DC,0)) ')
             +'         from   SL_ACCT '
             +'         where  CD_STORE = :P0 '
             +'           and  YMD_OCCUR between Left(:P2,6)+''01'' and :P4 '
             +'           and  CD_ACCT ='''+CreditIn+''''
             +'           and  CD_MEMBER =:P1 '
             +'  ) t '
             +'union all '
             +'select   dbo.StoDW(YMD_SALE) as YMD_SALE, '
             +'         ''1'' as SEQ, '
             +'         case DS_SALE when ''S'' then ''판매'' when ''B'' then ''반품'' end as DS_TYPE, '
             +'         AMT_TRUST, '
             +'         0 as AMT_PAYIN, '
             +'         0 as AMT_REMAIN, '
             +'         '''' as REMARK '
             +'from     SL_SALE_H '
             +'where    CD_STORE = :P0 '
             +'  and    CD_MEMBER = :P1 '
             +'  and    YMD_SALE between :P2 and :P3 '
             +'  and    DS_SALE <> ''V'' '
             +'  and    AMT_TRUST <> 0 '
             +'union all '
             +'select   dbo.StoDW(YMD_OCCUR) as YMD_BUY, '
             +'         ''2''      as SEQ, '
             +'         ''결제''   as DS_TYPE, '
             +'         0          as AMT_TRUST, '
             +'         AMT_PAYIN  as AMT_PAYIN, '
             +'         0          as AMT_REMAIN, '
             +'         REMARK '
             +'from     SL_ACCT  '
             +'where    CD_STORE = :P0 '
             +'  and    CD_MEMBER = :P1 '
             +'  and    YMD_OCCUR between :P2 and :P3 '
             +'  and    CD_ACCT ='''+CreditIn+''''
             +'order by YMD_SALE, SEQ',
              [StoreCode,
               ConditionToolBarEdit.Text,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)) ]);
    ReadQuery(BookGridTableView);
    // 미지급잔액을 계산해서 그리드에 넣어준다
    vRemainAmt := 0;
    for vIndex := 0 to BookGridTableView.DataController.RecordCount-1 do
    begin
      vRemainAmt := vRemainAmt
                  + Ifthen(vIndex=0,Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewRemainAmt.Index],0.0),0)
                  + Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewTrustAmt.Index],        0)
                  - Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewPayInAmt.Index],         0);
      BookGridTableView.DataController.Values[vIndex, BookGridTableViewRemainAmt.Index] := vRemainAmt;
    end;
    // 미지급금액 푸터 표시 (그리드 내용 Sum 아니고 미지급계산한 마지막 금액 넣으면 됨)
    if BookGridTableView.DataController.RecordCount > 0 then
      BookGridTableView.DataController.Summary.FooterSummaryValues[2] := FormatFloat(fmtComma, vRemainAmt)
    else
      BookGridTableView.DataController.Summary.FooterSummaryValues[2] := 0;

    Result := BookGridTableView.DataController.RowCount > 0;
  end;
end;


end.
