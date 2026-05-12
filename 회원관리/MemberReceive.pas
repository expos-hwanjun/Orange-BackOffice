// 외상 매입금 지급 관리 (New완료)

unit MemberReceive;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, DBAccess, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, AdvToolBarStylers, cxMemo,
  cxGridBandedTableView, cxLookAndFeels, cxLookAndFeelPainters, DateUtils,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TMemberReceiveForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridLevel: TcxGridLevel;
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewCompanyCode: TcxGridBandedColumn;
    GridBandedTableViewCompanyName: TcxGridBandedColumn;
    GridBandedTableViewLastPayDate: TcxGridBandedColumn;
    GridBandedTableViewRemainAmt: TcxGridBandedColumn;
    GridBandedTableViewPayAmt: TcxGridBandedColumn;
    GridBandedTableViewDCAmt: TcxGridBandedColumn;
    GridBandedTableViewRemark: TcxGridBandedColumn;
    GridBandedTableViewLastBuyDate: TcxGridBandedColumn;
    GridBandedTableViewBalanceAmt: TcxGridBandedColumn;
    ButtonToolBarCancelButton: TAdvGlowButton;
    GridBandedTableViewDsAcct: TcxGridBandedColumn;
    GridBandedTableViewNoAcct: TcxGridBandedColumn;
    GridBandedTableViewRowState: TcxGridBandedColumn;
    GridBandedTableViewTotalAmt: TcxGridBandedColumn;
    GridBandedTableViewPosNo: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridBandedTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridBandedTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridBandedTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GridBandedTableViewCompanyCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridBandedTableViewTrustSearchPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridBandedTableViewPayAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewDCAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
    BackupData: array of Variant;
    isSearch  : Boolean;
    function  SearchMember(aCompany: string = ''): string;
    procedure ButtonEnable;
  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave  : Boolean; override; // 저장
  end;

var
  MemberReceiveForm: TMemberReceiveForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberReceiveForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
  isSearch    := false;
  GridBandedTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridBandedTableView.DataController.Filter.Active := true;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TMemberReceiveForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vCode, vName, vSaleDate, vReceiveDate: string;
  vRemainAmt: Currency;
begin
  case Key of
    VK_Down,
    VK_Up   :
      if GridBandedTableView.Controller.IsNewItemRowFocused then
      begin
        Key := 0;
        Exit;
      end;
  end;

  inherited;

  // 그리드 OnKeyDown 이벤트는 Enter키 입력이 되지 않아서 폼에서 처리한다
  if (Key = VK_Return) and (GridBandedTableView.Focused) then
  begin
    GridBandedTableView.DataController.PostEditingData;
    // 회원코드
    if GridBandedTableView.Controller.FocusedColumnIndex = GridBandedTableViewCompanyCode.Index then
    begin
      if (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] = null) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] = EmptyStr) then
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyName.Index] := EmptyStr
      else
      begin
        OpenQuery('select   t.CD_MEMBER, '
                 +'         t.NM_MEMBER, '
                 +'         r.AMT_REMAIN, '
                 +'         b.YMD_SALE, '
                 +'         p.YMD_OCCUR '
                 +'from     MS_MEMBER as t left outer join '
                 +'        (select   a.CD_MEMBER, '
                 +'                  Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_TRUST,0) - Ifnull(AMT_PAYIN,0)) as AMT_REMAIN '
                 +'         from    (select   CD_CODE as CD_MEMBER, '
                 +'                           Sum(AMT_BASE) as AMT_BASE, '
                 +'                           0 as AMT_TRUST, '
                 +'                           0 as AMT_PAYIN '
                 +'                   from    SL_BOOKS_MONTH '
                 +'                  where    CD_HEAD  =:P0 '
                 +'                    and    CD_STORE =:P1 '
                 +'                    and    CD_CLOSE = ''20'' '
                 +'                    and    YM_CLOSE = Left(:P2,6) '
                 +'                  group by CD_CODE '
                 +'                  union all '
                 +'                  select   CD_MEMBER,'
                 +'                           0 as AMT_BASE, '
                 +'                           Sum(AMT_TRUST) as AMT_TRUST, '
                 +'                           0 as AMT_PAY '
                 +'                    from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, '')
                 +'                   where   CD_HEAD  =:P0 '
                 +'                     and   CD_STORE =:P1 '
                 +'                     and   CD_MEMBER <> '''' '
                 +'                     and   DS_SALE <> ''V'' '
                 +'                     and   YMD_SALE Between ConCat(Left(:P3,6),''01'') and :P3 '
                 +'                     and   DT_SALE < Now() '
                 +'                     and   AMT_TRUST <> 0 '
                 +'                   group by CD_STORE, CD_MEMBER '
                 +'                  union all '
                 +'                  select   CD_MEMBER, '
                 +'                           0 as AMT_BASE, '
                 +'                           0 as AMT_TRUST, '
                 +'                           Sum(AMT_PAYIN+AMT_DC) as AMT_PAY '
                 +'                  from     SL_ACCT '
                 +'                  where    CD_HEAD  =:P0 '
                 +'                    and    CD_STORE =:P1 '
                 +'                    and    CD_MEMBER is not null '
                 +'                    and    YMD_OCCUR Between ConCat(Left(:P3,6),''01'') and :P3 '
                 +'                    and    DT_INSERT < Now() '
                 +'                    and    CD_ACCT in (select CD_CODE '
                 +'                                       from MS_CODE '
                 +'                                      where CD_HEAD  =:P0 '
                 +'                                        and CD_STORE =:P4 '
                 +'                                        and CD_KIND  =''11'' '
                 +'                                        and NM_CODE3 =''1'' )'
                 +'                  group by CD_MEMBER) as a '
                 +'         group by a.CD_MEMBER) as r on t.CD_MEMBER = r.CD_MEMBER left outer join'
                 +'        (select   CD_MEMBER, '
                 +'                  StoDW(Max(YMD_SALE)) as YMD_SALE '
                 +'           from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, '')
                 +'          where   CD_HEAD  =:P0 '
                 +'            and   CD_STORE =:P1 '
                 +'            and   DS_SALE = ''S'' '
                 +'            and   Ifnull(CD_MEMBER,'''') <> '''' '
                 +'          group by CD_MEMBER) as b on t.CD_MEMBER = b.CD_MEMBER left outer join '
                 +'        (select   CD_MEMBER, '
                 +'                  StoDW(Max(YMD_OCCUR)) as YMD_OCCUR '
                 +'           from   SL_ACCT '
                 +'          where   CD_HEAD  =:P0 '
                 +'            and   CD_STORE =:P1 '
                 +'            and   CD_MEMBER is not null '
                 +'            and   CD_ACCT in (select CD_CODE '
                 +'                             from MS_CODE '
                 +'                            where CD_HEAD  =:P0 '
                 +'                              and CD_STORE =:P4 '
                 +'                              and CD_KIND  =''11'' '
                 +'                              and NM_CODE3 =''1'' )'
                 +'         group by CD_MEMBER) as p on b.CD_MEMBER = p.CD_MEMBER '
                 +' where  t.CD_HEAD  = :P0 '
                 +'   and  t.CD_STORE = :P4 '
                 +'   and (t.CD_MEMBER =:P2or t.NM_MEMBER like ConCat(''%'',:P2,''%'')) '
                 +'   and  t.DS_STATUS = 0',
                  [HeadStoreCode,
                   StoreCode,
                   GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index],
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
        try
          if not Query.Eof then
          begin
            // 일단 첫번째 값을 받아 놓는다
            vCode        := Query.Fields[0].AsString;
            vName        := Query.Fields[1].AsString;
            vRemainAmt   := Query.Fields[2].AsCurrency;
            vSaleDate    := Query.Fields[3].AsString;
            vReceiveDate := Query.Fields[4].AsString;
            // 쿼리 다음 줄로 이동해 본다
            Query.Next;
            // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
            if Query.Eof then
            begin
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] := vCode;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyName.Index] := vName;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewRemainAmt.Index]   := vRemainAmt;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewLastBuyDate.Index] := vSaleDate;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewLastPayDate.Index] := vReceiveDate;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewPayAmt.Index]      := 0;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewDCAmt.Index]       := 0;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewBalanceAmt.Index]  := vRemainAmt;
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewRowState.Index]    := rsInsert;
              GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewPayAmt.Index;
            end
            // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
            else
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] := SearchMember(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index]);
          end
          else
          begin
            GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] := EmptyStr;
            GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyName.Index] := EmptyStr;
          end;
        finally
          FinishQuery;
        end;
      end;
    end

    // 지급 후 잔액을 보여준다
    else if GridBandedTableView.Controller.FocusedColumnIndex in [GridBandedTableViewPayAmt.Index, GridBandedTableViewDCAmt.Index] then
      GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewBalanceAmt.Index] := Nvl(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewRemainAmt.Index], 0.0) - Nvl(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewPayAmt.Index], 0.0) - Nvl(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewDCAmt.Index], 0.0)

    // 비고
    else if GridBandedTableView.Controller.FocusedColumnIndex = GridBandedTableViewRemark.Index then
    begin
      // 입력 안 한 값이 있으면 그곳으로 포커스를 옮긴다
      if (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] = null) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] = EmptyStr) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyName.Index] = null) or
         (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyName.Index] = EmptyStr) then
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewCompanyCode.Index
      else if (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewPayAmt.Index] = null) or
              (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewPayAmt.Index] = 0) then
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewPayAmt.Index
      else
      begin
        GridBandedTableView.DataController.Post;
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewCompanyCode.Index;
      end;
    end;
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드 값을 적용하기 전
procedure TMemberReceiveForm.GridBandedTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;

  // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
  if (ADataController.NewItemRowFocused) and
     ((Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index], EmptyStr) = EmptyStr) or
      (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridBandedTableViewPayAmt.Index],      0.0)      = 0.0)) then
  begin
    // 기존에 입력된 값을 저장해 놓는다
    SetLength(BackupData, GridBandedTableView.ColumnCount);
    for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
      BackupData[vIndex] := ADataController.Values[-1, vIndex];
    // Post를 취소한다
    ADataController.Cancel;
    Exit;
  end;

  if ADataController.Values[ADataController.FocusedRecordIndex, GridBandedTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridBandedTableViewRowState.Index] := rsUpdate;
end;
procedure TMemberReceiveForm.GridBandedTableViewDCAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  with GridBandedTableView do
    DataController.Values[DataController.GetFocusedRecordIndex, GridBandedTableViewTotalAmt.Index] := NVL(DataController.Values[DataController.GetFocusedRecordIndex, GridBandedTableViewPayAmt.Index],0)
                                                                                                    + NVL(DisplayValue,0);
end;

//------------------------------------------------------------------------------
// 그리드 값을 적용한 후
procedure TMemberReceiveForm.GridBandedTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
begin
  inherited;
  if not isLoading then
    isChanged := true;

  //조회를 안하고 신규를 바로 입력했을때
  if ConditionToolBarFromDateEdit.Enabled then
  begin
    ConditionToolBarFromDateEdit.Enabled := false;
    ButtonToolBarSearchButton.Enabled    := false;
    ButtonToolBarCancelButton.Enabled    := true;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TMemberReceiveForm.GridBandedTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vIndex: Integer;
begin
  inherited;
  if (AFocusedRecord = nil) then
    ButtonToolBarSaveButton.Enabled := false
  else
    isChanged := isChanged;

  // 신규 상태에서 비 정상적으로 다른 레코드를 선택했다면 다시 신규 상태로 만든다
  if ((APrevFocusedRecord = nil) or (APrevFocusedRecord.Index = GridBandedTableView.DataController.NewItemRecordIndex)) and
     (Assigned(BackupData)) and (High(BackupData) = GridBandedTableView.ColumnCount-1) then
  begin
    // 새 레코드에 기존에 입력된 값을 강제로 다시 넣는다
    GridBandedTableView.DataController.NewItemRowFocused := true;
    for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
      GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, vIndex] := BackupData[vIndex];
  end;
  SetLength(BackupData, 0);
  BackupData := nil;

  // 신규 입력일 때만 거래처를 입력할 수 있게 한다
  GridBandedTableViewCompanyCode.Options.Editing  := GridBandedTableView.Controller.IsNewItemRowFocused;
  GridBandedTableViewCompanyCode.Options.Focusing := GridBandedTableView.Controller.IsNewItemRowFocused;

  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  ButtonToolBarDeleteButton.Enabled               := (GridBandedTableView.DataController.RecordCount > 0) and (not GridBandedTableView.Controller.IsNewItemRowFocused);
end;
procedure TMemberReceiveForm.GridBandedTableViewPayAmtPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  with GridBandedTableView do
    DataController.Values[DataController.GetFocusedRecordIndex, GridBandedTableViewTotalAmt.Index] := NVL(DisplayValue,0)
                                                                                                    + NVL(DataController.Values[DataController.GetFocusedRecordIndex, GridBandedTableViewDCAmt.Index],0);
end;

procedure TMemberReceiveForm.GridBandedTableViewTrustSearchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 거래처코드 입력창에서 버튼을 누를 때
procedure TMemberReceiveForm.GridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  if not GridBandedTableView.DataController.NewItemRowFocused and (GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewPosNo.Index] <> '00') then
  begin
    GridBandedTableViewPayAmt.Options.Focusing  := false;
    GridBandedTableViewDCAmt.Options.Focusing := false;
  end
  else
  begin
    GridBandedTableViewPayAmt.Options.Focusing  := true;
    GridBandedTableViewDCAmt.Options.Focusing := true;
  end;

end;

procedure TMemberReceiveForm.GridBandedTableViewCompanyCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  // 거래처를 조회한다
  if GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] <> null then
    SearchMember(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index])
  else
    SearchMember;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 회원 조회
function TMemberReceiveForm.SearchMember(aCompany: string): string;
var vWhere :String;
    vIndex :Integer;
begin
  Result := EmptyStr;

  for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
    if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsInsert then
      vWhere := vWhere + Format('''%s'',',[String(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCompanyCode.Index])]);

  if vWhere <> '' then
    vWhere := 'and t.CD_MEMBER not in ('+LeftStr(vWhere, Length(vWhere)-1)+')';

  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := GridBandedTableViewCompanyCode.Caption;
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := GridBandedTableViewCompanyName.Caption;
      GridTableViewName1.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '카드번호';
      GridTableViewName2.Width   := 110;
      GridTableViewName2.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      GridTableViewName3.Caption := '휴대전화';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;

      SearchText := aCompany;
      SQLText    := 'select   t.CD_MEMBER, '
                   +'         t.NM_MEMBER, '
                   +'         t.NO_CARD, '
                   +'         GetPhoneNo(AES_Decrypt(t.TEL_MOBILE, 71483)) as NO_TEL, '
                   +'         r.AMT_REMAIN, '
                   +'         b.YMD_SALE, '
                   +'         p.YMD_OCCUR '
                   +'from     MS_MEMBER as t left outer join '
                   +'        (select   a.CD_MEMBER, '
                   +'                  Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_TRUST,0) - Ifnull(AMT_PAYIN,0)) as AMT_REMAIN '
                   +'         from    (select   CD_CODE as CD_MEMBER, '
                   +'                           Sum(AMT_BASE) as AMT_BASE, '
                   +'                           0 as AMT_TRUST, '
                   +'                           0 as AMT_PAYIN '
                   +'                    from   SL_BOOKS_MONTH '
                   +'                   where   CD_HEAD  = :P0 '
                   +'                     and   CD_STORE = :P1 '
                   +'                     and   CD_CLOSE = ''20'' '
                   +'                     and   YM_CLOSE = '''+ LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+''' '
                   +'                   group by CD_STORE, CD_CODE '
                   +'                  union all '
                   +'                  select   CD_MEMBER,'
                   +'                           0 as AMT_BASE, '
                   +'                           Sum(AMT_TRUST) as AMT_TRUST, '
                   +'                           0 as AMT_PAYIN '
                   +'                    from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, '')
                   +'                   where   CD_HEAD  = :P0 '
                   +'                     and   CD_STORE = :P1 '
                   +'                     and   CD_MEMBER <> '''' '
                   +'                     and   DS_SALE <> ''V'' '
                   +'                     and   YMD_SALE Between ConCat('''+ LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+''',''01'') and '''+DtoS(ConditionToolBarFromDateEdit.Date)+''' '
                   +'                     and   DT_SALE < Now() '
                   +'                     and   AMT_TRUST <> 0 '
                   +'                   group by CD_STORE, CD_MEMBER '
                   +'                  union all '
                   +'                  select   CD_MEMBER, '
                   +'                           0 as AMT_BASE, '
                   +'                           0 as AMT_TRUST, '
                   +'                           Sum(AMT_PAYIN+AMT_DC) as AMT_PAY '
                   +'                    from   SL_ACCT '
                   +'                   where   CD_HEAD  = :P0 '
                   +'                     and   CD_STORE = :P1 '
                   +'                     and   CD_MEMBER is not null '
                   +'                     and   YMD_OCCUR Between ConCat('''+ LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+''',''01'') and '''+DtoS(ConditionToolBarFromDateEdit.Date)+''' '
                   +'                     and   DT_INSERT < Now() '
                   +'                     and   CD_ACCT = '''+CreditIn+''''
                   +'                   group by CD_STORE, CD_MEMBER ) as a '
                   +'         group by a.CD_MEMBER) as r on t.CD_MEMBER = r.CD_MEMBER left outer join '
                   +'        (select   CD_MEMBER, '
                   +'                  StoDW(Max(YMD_SALE)) as YMD_SALE '
                   +'           from   SL_SALE_H '
                   +'          where   CD_HEAD  = :P0 '
                   +'            and   CD_STORE = :P1 '
                   +'            and   YMD_SALE < Date_Format(Now(), ''%Y%m%d'') '
                   +'            and   DS_SALE = ''S'' '
                   +'            and   Ifnull(CD_MEMBER,'''') <> '''' '
                   +'         group by CD_MEMBER) as b on t.CD_MEMBER = b.CD_MEMBER left outer join '
                   +'        (select   CD_MEMBER, '
                   +'                  StoDW(Max(YMD_OCCUR)) as YMD_OCCUR '
                   +'           from   SL_ACCT '
                   +'          where   CD_HEAD  = :P0 '
                   +'            and   CD_STORE = :P1 '
                   +'            and   YMD_OCCUR < Date_Format(Now(), ''%Y%m%d'') '
                   +'            and   CD_MEMBER is not null '
                   +'            and   CD_ACCT ='''+CreditIn+''''
                   +'         group by CD_MEMBER) as p on b.CD_MEMBER = p.CD_MEMBER '
                   +' where   t.CD_HEAD  =:P0 '
                   +Format('   and   t.CD_STORE =''%s'' ',[Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)])
                   +'   and  (t.CD_MEMBER =:P2 or t.NM_MEMBER like ConCat(''%'',:P2,''%'')) '
                   +'   and   t.DS_STATUS = 0 '
                   +vWhere
                   +'order by t.CD_MEMBER';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyCode.Index] := Code;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewCompanyName.Index] := Names[0];
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewRemainAmt.Index]   := StoF(Names[3]);
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewLastBuyDate.Index] := Names[4];
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewLastPayDate.Index] := Names[5];
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewPayAmt.Index]      := 0;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewDCAmt.Index]       := 0;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewBalanceAmt.Index]  := StoF(Names[3]);
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewDsAcct.Index]      := '현금';
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.FocusedRecordIndex, GridBandedTableViewRowState.Index]    := rsInsert;
        GridBandedTableView.Controller.FocusedColumnIndex := GridBandedTableViewPayAmt.Index;
        Result    := Code;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 조회
function TMemberReceiveForm.DoSearch: Boolean;
begin
  Result := false;
  try
    OpenQuery('select   a.CD_MEMBER, '
             +'         t.NM_MEMBER, '
             +'         0 as AMT_REMAIN, '
             +'         a.AMT_PAYIN as AMT_RECEIVE, '
             +'         a.AMT_DC, '
             +'         a.AMT_PAYIN + a.AMT_DC as AMT_TOTAL, '
             +'         0 as AMT_BALANCE, ' //a.AMT_REMAIN - a.AMT_PAYIN - a.AMT_DC as AMT_BALANCE, '
             +'         a.REMARK, '
             +'         b.YMD_SALE   as YMD_SALE_LAST, '
             +'         p.YMD_OCCUR as YMD_RECEIVE_LAST, '
             +'         case a.DS_ACCT when ''0'' then ''현금'' when ''1'' then ''카드''  when ''2'' then ''현금영수증'' when ''3'' then ''계좌'' end as DS_ACCT, '
             +'         a.NO_ACCT, '
             +'         a.NO_POS, '
             +'         ''rsNormal'' as ROW_STATE '
             +'  from   SL_ACCT     as a inner join '
             +'         MS_MEMBER   as t on t.CD_HEAD = a.CD_HEAD and t.CD_STORE = :P4 and a.CD_MEMBER = t.CD_MEMBER left outer join '
             +'        (select   CD_MEMBER, '
             +'                  StoDW(Max(YMD_SALE)) as YMD_SALE '
             +'           from   SL_SALE_H '
             +'          where   CD_HEAD  = :P0 '
             +'            and   CD_STORE = :P1 '
             +'            and   YMD_SALE < Date_Format(Now(), ''%Y%m%d'') '
             +'            and   DS_SALE = ''S'' '
             +'            and   Ifnull(CD_MEMBER,'''') <> '''' '
             +'         group by CD_MEMBER) as b on t.CD_MEMBER = b.CD_MEMBER left outer join '
             +'        (select   CD_MEMBER, '
             +'                  StoDW(Max(YMD_OCCUR)) as YMD_OCCUR '
             +'           from   SL_ACCT '
             +'          where   CD_HEAD  = :P0 '
             +'            and   CD_STORE = :P1 '
             +'            and   YMD_OCCUR < Date_Format(Now(), ''%Y%m%d'') '
             +'            and   CD_MEMBER is not null '
             +'         group by CD_MEMBER) as p on b.CD_MEMBER = p.CD_MEMBER '
             +' where   a.CD_HEAD   =:P0 '
             +'   and   a.CD_STORE  =:P1 '
             +'   and   a.YMD_OCCUR =:P2 '
             +'   and   a.CD_ACCT   =:P3 '
             +' order by a.NO_ACCT',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               CreditIn,
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridBandedTableView);
    isSearch := true;
    ButtonEnable;
  except
  end;
end;

//------------------------------------------------------------------------------
// 조회 여부에 따른 버튼 Enabled 설정
procedure TMemberReceiveForm.ButtonEnable;
begin
  ConditionToolBarFromDateEdit.Enabled := not isSearch;
  ButtonToolBarSearchButton.Enabled    := not isSearch;
  ButtonToolBarCancelButton.Enabled    := isSearch;
end;

//------------------------------------------------------------------------------
// 취소
procedure TMemberReceiveForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if isChanged then
    if not AskBox('현재 작업을 모두 취소하시겠습니까?') then Exit;

  GridBandedTableView.DataController.RecordCount := 0;
  isChanged := false;
  isSearch  := false;
  ButtonEnable;
end;
procedure TMemberReceiveForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 삭제
function TMemberReceiveForm.DoDelete: Boolean;
var vIndex :Integer;
    vRowIndex :Integer;
begin
  if CheckMonthClose('M',DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    Result := false;
    Exit;
  end;

  if GridBandedTableView.DataController.Values[GridBandedTableView.Controller.FocusedRecordIndex, GridBandedTableViewPosNo.Index] <> '00' then
  begin
    MsgBox('포스에서 등록한 내역은 삭제 할 수 없습니다');
    Exit;
  end;

  // 선택한 레코드를 삭제한다
  try
    //신규로 입력한 레코드는 삭제한다
    if GridBandedTableView.DataController.Values[GridBandedTableView.Controller.FocusedRecordIndex, GridBandedTableViewRowState.Index] = rsInsert then
    begin
      GridBandedTableView.DataController.DeleteFocused;
    end
    else
    begin
      //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
      vRowIndex := GridBandedTableView.Controller.FocusedRecordIndex;
      GridBandedTableView.DataController.Values[GridBandedTableView.Controller.FocusedRecordIndex, GridBandedTableViewRowState.Index] := rsDelete;
      GridBandedTableView.DataController.AppendRecord;
      for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, vIndex] := GridBandedTableView.DataController.Values[vRowIndex, vIndex];
      GridBandedTableView.DataController.DeleteRecord(vRowIndex);
    end;

    isChanged := true;
    Result    := true;
  except
    Result    := false;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TMemberReceiveForm.DoSave: Boolean;
var
  vIndex, vSeq: Integer;
  vTemp :String;
  vNoAcct :String;
begin
  Result := false;
  if CheckMonthClose('M', DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    Result := false;
    Exit;
  end;

  // 입력 중이던 자료 포스트
  GridBandedTableView.DataController.Post;
  // 전체 레코드 돌아가며 필수 입력값 입력하지 않았는지 검사
  for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
  begin
    if (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCompanyCode.Index] = null) or
       (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCompanyCode.Index] = EmptyStr) or
       (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCompanyName.Index] = null) or
       (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCompanyName.Index] = EmptyStr) then
    begin
      ErrBox(GridBandedTableViewCompanyCode.Caption+msgMustInput);
      GridBandedTableView.DataController.FocusedRecordIndex := vIndex;
      GridBandedTableView.Controller.FocusedColumnIndex     := GridBandedTableViewCompanyCode.Index;
      Exit;
    end
    else if (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewPayAmt.Index] = null) or
            (GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewPayAmt.Index] = 0) then
    begin
      ErrBox(GridBandedTableViewPayAmt.Caption+msgMustInput);
      GridBandedTableView.DataController.FocusedRecordIndex := vIndex;
      GridBandedTableView.Controller.FocusedColumnIndex     := GridBandedTableViewPayAmt.Index;
      Exit;
    end;

    if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsNormal then Continue;

    if (Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRemainAmt.Index], 0.0) - Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewPayAmt.Index], 0.0) - Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewDCAmt.Index], 0.0) < 0) then
    begin
      if not AskBox(Format('''%s''에 %s이 %s보다 많습니다.'#13'그냥 저장하시겠습니까?', [Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCompanyName.Index], EmptyStr), GridBandedTableViewPayAmt.Caption, GridBandedTableViewRemainAmt.Caption])) then
      begin
        GridBandedTableView.DataController.FocusedRecordIndex := vIndex;
        GridBandedTableView.Controller.FocusedColumnIndex     := GridBandedTableViewPayAmt.Index;
        Exit;
      end;
    end;
  end;


  try
    // 마지막 순번을 구한다 (삭제 후 순번을 구하는 것이 좋으나 SQL의 버그 때문에 순번부터 구한다)
    OpenQuery('select Max(NO_ACCT) as NO_ACCT '
             +'  from SL_ACCT '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and YMD_OCCUR =:P2 '
             +'   and NO_POS    = ''00'' ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date)]);
    try
      if (Query.Eof) or (Query.Fields[0].AsString = EmptyStr) then
        vSeq := 0
      else
        vSeq := StoI(Query.Fields[0].AsString);
    finally
      FinishQuery;
    end;

    // 새 자료 저장
    for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
    begin
      if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsNormal then Continue;

      if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete from SL_ACCT '
                 +' where CD_HEAD   =:P0 '
                 +'   and CD_STORE  =:P1 '
                 +'   and YMD_OCCUR =:P2 '
                 +'   and NO_POS    =:P3 '
                 +'   and NO_ACCT   =:P4; ',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  '00',
                  GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewNoAcct.Index]],
                  False);
      end
      else
      begin
        if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsInsert then
        begin
          vNoAcct := FormatFloat('000', vSeq+1);
          Inc(vSeq);
        end
        else
          vNoAcct := GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewNoAcct.Index];

        if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewDsAcct.Index] = '현금' then
          vTemp := '0'
        else if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewDsAcct.Index] = '카드' then
          vTemp := '1'
        else if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewDsAcct.Index] = '통장' then
          vTemp := '3'
        else
          vTemp := '2';

        ExecQuery(Ifthen(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRowState.Index] = rsInsert,
                  'insert into SL_ACCT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, NO_ACCT, DS_ACCT, CD_ACCT, AMT_PAYIN, AMT_DC, CD_BANK, CD_MEMBER, REMARK, DT_CHANGE, CD_SAWON_INSERT, CD_SAWON_CHG, AMT_REMAIN, DT_INSERT) '
                  +'            values (:P0, :P1, :P2, ''00'', :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, Now(), :P11, :P11, :P12, Now()); ',
                   'update SL_ACCT '
                  +'   set DS_ACCT   = :P4, '
                  +'       CD_ACCT   = :P5, '
                  +'       AMT_PAYIN = :P6, '
                  +'       AMT_DC    = :P7, '
                  +'       CD_BANK   = :P8, '
                  +'       CD_MEMBER = :P9, '
                  +'       REMARK    = :P10, '
                  +'       DT_CHANGE = Now(), '
                  +'       CD_SAWON_CHG =:P11, '
                  +'       AMT_REMAIN =:P12 '
                  +' where CD_HEAD   =:P0 '
                  +'   and CD_STORE  =:P1 '
                  +'   and YMD_OCCUR =:P2 '
                  +'   and NO_POS    = ''00 '' '
                  +'   and NO_ACCT   =:P3; '),
                  [HeadStoreCode,
                   StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   vNoAcct,
                   vTemp,
                   CreditIn,
                   Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewPayAmt.Index], 0.0),
                   Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewDCAmt.Index],  0.0),
                   EmptyStr, // CD_BANK
                   GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewCompanyCode.Index],
                   Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRemark.Index], EmptyStr),
                   UserCode,
                   Nvl(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewRemainAmt.Index], 0.0)],
                   false);
      end;
    end;

    //##### 순번이 중간에 비는 문제가 있으나 큰 문제는 되지 않을 것 같아 넘어감

    Result := ExecQuery('', [], true);
    if not Result then Exit;
    isSearch  := false;
    GridBandedTableView.DataController.RecordCount := 0;
    GridBandedTableView.DataController.EndUpdateFields;
    ButtonEnable;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
