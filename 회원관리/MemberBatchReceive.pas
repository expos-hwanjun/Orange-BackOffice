unit MemberBatchReceive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGridLevel, cxGrid,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  DateUtils, Math, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TMemberBatchReceiveForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridLevel: TcxGridLevel;
    GridTableView: TcxGridTableView;
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewTrustAmt: TcxGridColumn;
    GridTableViewReceiveAmt: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    GridTableViewBalanceAmt: TcxGridColumn;
    ButtonToolBarCancelButton: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure GridTableViewReceiveAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
  private
  protected
    procedure ClearGrid; override;
    function DoSearch:Boolean; override;
    function DoDelete:Boolean; override;
    function DoSave  :Boolean; override; // 저장
  end;

var
  MemberBatchReceiveForm: TMemberBatchReceiveForm;

implementation
uses Common, DBModule;
{$R *.dfm}
procedure TMemberBatchReceiveForm.FormShow(Sender: TObject);
begin
  inherited;
  ConditionToolBarFromDateEdit.Date := EndOfAMonth(YearOf(IncMonth(Now(),-1)), MonthOf(IncMonth(Now(),-1)));
  ConditionToolBarToDateEdit.Date   := Now();
end;

procedure TMemberBatchReceiveForm.GridTableViewReceiveAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue = '' then DisplayValue := 0;

  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBalanceAmt.Index] := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTrustAmt.Index],0)
                                                                                                                          - DisplayValue;
end;

procedure TMemberBatchReceiveForm.ButtonToolBarCancelButtonClick(
  Sender: TObject);
begin
  inherited;
  ClearGrid;
  ButtonToolBarSearchButton.Enabled    := true;
  ButtonToolBarCancelButton.Enabled    := false;
  ConditionToolBarFromDateEdit.Enabled := true;
  ConditionToolBarToDateEdit.Enabled   := true;
end;

procedure TMemberBatchReceiveForm.ButtonToolBarSearchButtonClick(
  Sender: TObject);
begin
  inherited;
  isChanged := GridTableView.DataController.RecordCount > 0;
  ButtonToolBarDeleteButton.Enabled := isChanged;
  ButtonToolBarSaveButton.Enabled   := isChanged;
end;

procedure TMemberBatchReceiveForm.ClearGrid;
begin
//  inherited;

end;

function TMemberBatchReceiveForm.DoDelete: Boolean;
begin
  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
  isChanged := GridTableView.DataController.RecordCount > 0;
  ButtonToolBarDeleteButton.Enabled := isChanged;
end;

function TMemberBatchReceiveForm.DoSave: Boolean;
var vIndex,
    vSeq :Integer;
    vSQL :String;
begin
  if not AskBox('회원전체의 현재 외상잔액을 입금처리합니다'#13'계속하시겠습니까?') then Exit;

  if not CheckMonthClose('M', DtoS(IncMonth(ConditionToolBarFromDateEdit.CurrentDate,-1))) then
  begin
    MsgBox('전월 미수마감이 처리되지 않았습니다');
    Result := false;
    Exit;
  end;

  if not CheckMonthClose('M', DtoS(ConditionToolBarFromDateEdit.CurrentDate)) then
  begin
    Result := false;
    Exit;
  end;

  OpenQuery('select  Max(NO_ACCT) as NO_ACCT '
           +'  from  SL_ACCT '
           +' where  CD_HEAD   = :P0 '
           +'   and  CD_STORE  = :P1 '
           +'   and  YMD_OCCUR = :P2 '
           +'   and  NO_POS    = ''00'' ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
  try
    if (Query.Eof) or (Query.Fields[0].AsString = EmptyStr) then
      vSeq := 1
    else
      vSeq := StoI(Query.Fields[0].AsString);
  finally
    FinishQuery;
  end;

  try
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewReceiveAmt.Index] = 0 then Continue;
      vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'', ''%s'', %d ,''%s'', %s, %d, ''%s'',''%s'', ''%s'', Now(),''%s'',''%s'',%s, Now()),',
                             [HeadStoreCode,
                              StoreCode,
                              DtoS(ConditionToolBarToDateEdit.CurrentDate),
                              '00',
                              FormatFloat('000', vSeq),
                              0, //현금
                              CreditIn,
                              FloatToStr(NVL(GridTableView.DataController.Values[vIndex, GridTableViewReceiveAmt.Index],0)),
                              0,
                              '',
                              GridTableView.DataController.Values[vIndex, GridTableViewMemberCode.Index],
                              GridTableView.DataController.Values[vIndex, GridTableViewRemark.Index],
                              UserCode,
                              UserCode,
                              FloatToStr(GridTableView.DataController.Values[vIndex, GridTableViewTrustAmt.Index])]);
      Inc(vSeq);
    end;
    vSQL := 'insert into SL_ACCT(CD_HEAD, '
           +'                    CD_STORE, '
           +'                    YMD_OCCUR, '
           +'                    NO_POS, '
           +'                    NO_ACCT, '
           +'                    DS_ACCT, '
           +'                    CD_ACCT, '
           +'                    AMT_PAYIN, '
           +'                    AMT_DC, '
           +'                    CD_BANK, '
           +'                    CD_MEMBER, '
           +'                    REMARK, '
           +'                    DT_CHANGE, '
           +'                    CD_SAWON_INSERT, '
           +'                    CD_SAWON_CHG, '
           +'                    AMT_REMAIN, '
           +'                    DT_INSERT) values '
           +LeftStr(vSQL,Length(vSQL)-1)+';';
    Result := ExecQuery(vSQL, [], true);
    GridTableView.DataController.RecordCount := 0;
    GridTableView.DataController.EndUpdateFields;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

function TMemberBatchReceiveForm.DoSearch: Boolean;
begin
  OpenQuery('select   a.CD_MEMBER, '
           +'         Max(b.NM_MEMBER)  as NM_MEMBER, '
           +'         Max(b.NO_CARD)    as NO_CARD, '
           +'         Sum(a.AMT_TRUST)  as AMT_TRUST, '
           +'         Sum(a.AMT_TRUST)  as AMT_RECEIVE, '
           +'         0                 as AMT_BALANCE '
           +'  from  (select CD_MEMBER, '
           +'                Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_TRUST,0) - Ifnull(AMT_RECEIVE,0)) as AMT_TRUST '
           +'         from '
           +'              (select CD_CODE as CD_MEMBER, '
           +'                      AMT_BASE, '
           +'                      0 as AMT_SALE, '
           +'                      0 as AMT_TRUST, '
           +'                      0 as AMT_RECEIVE '
           +'                from  SL_BOOKS_MONTH '
           +'               where  CD_HEAD  =:P0 '
           +'                 and  CD_STORE =:P2 '
           +'                 and  YM_CLOSE = Left(:P3,6) '
           +'                 and  CD_CLOSE = ''20'' '
           +'                 and  CD_CODE <> '''' '
           +'               union all '
           +'               select CD_MEMBER, '
           +'                      0, '
           +'                      0, '
           //01일까지 조회이면 월 기초 미지급만 사용
           +'                      sum(AMT_TRUST), '
           +'                      0 '
           +'               from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.CurrentDate, '')
           +'               where  CD_HEAD  =:P0 '
           +'                 and  CD_STORE =:P2 '
           +'                 and  YMD_SALE between ConCat(Left(:P3,6),''01'') and :P3 '
           +'                 and  AMT_TRUST <> 0 '
           +'                 and  DS_SALE <> ''V'' '
           +'               group by CD_MEMBER '
           +'               union all '
           +'               select CD_MEMBER, '
           +'                      0, '
           +'                      0, '
           +'                      0, '
           //01일까지 조회이면 월 기초 미지급만 사용
           +'                      Sum(AMT_PAYIN + AMT_DC) '
           +'                from  SL_ACCT '
           +'               where  CD_HEAD  =:P0 '
           +'                 and  CD_STORE =:P2 '
           +'                 and  YMD_OCCUR between ConCat(Left(:P3,6),''01'') and :P3 '
           +'                 and  CD_MEMBER <> '''' '
           +'               group by CD_MEMBER '
           +'             ) t '
           +'         group by CD_MEMBER) as a inner join '
           +'         MS_MEMBER as b on b.CD_HEAD = :P0  and b.CD_STORE = :P1 and a.CD_MEMBER = b.CD_MEMBER  '
           +' group by a.CD_MEMBER '
           +' having Ifnull(Sum(AMT_TRUST),0) <> 0 ',
            [HeadStoreCode,
             Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.CurrentDate)]);
  Result := DM.ReadQuery(Query, GridTableView);
  if Result  then
  begin
    ButtonToolBarSearchButton.Enabled    := false;
    ButtonToolBarDeleteButton.Enabled    := false;
    ButtonToolBarCancelButton.Enabled    := true;
    ConditionToolBarFromDateEdit.Enabled := false;
    ConditionToolBarToDateEdit.Enabled   := false;
    isChanged := true;
  end;
end;


end.
