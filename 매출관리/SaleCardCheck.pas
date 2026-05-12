// 신용카드 단말기 결제 관리 (완료)

unit SaleCardCheck;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter, Math,
  cxData, cxDataStorage, cxEdit, ExtCtrls, cxContainer, Uni, DB,
  MemDS, cxTextEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvToolBar, AdvSplitter,
  cxCurrencyEdit, cxSpinEdit, StdCtrls, StrUtils, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TSaleCardCheckForm = class(TInheritGridEditForm)
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewBillNo: TcxGridColumn;
    GridTableViewSeq: TcxGridColumn;
    GridTableViewType: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewApprovalAmt: TcxGridColumn;
    CardNoLabel: TLabel;
    ApprovalDateLabel: TLabel;
    CardCompanyLabel: TLabel;
    CardJoinNoLabel: TLabel;
    ApprovalNoLabel: TLabel;
    CancelNoLabel: TLabel;
    InstallmentLabel: TLabel;
    CancelDateLabel: TLabel;
    SaleAmountLabel: TLabel;
    ApprovalDateEdit: TcxDateEdit;
    CancelDateEdit: TcxDateEdit;
    CardCompanyComboBox: TcxComboBox;
    CardJoinNoEdit: TcxTextEdit;
    SaleAmountEdit: TcxCurrencyEdit;
    CardNoEdit: TcxTextEdit;
    ApprovalNoEdit: TcxTextEdit;
    CancelNoEdit: TcxTextEdit;
    InstallmentEdit: TcxSpinEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    CardCompanyCode, CardJoinNo: TStringList;

  protected
    function  DoSearch: Boolean; override;
    procedure DoGridLink; override;
    function  DoSave: Boolean; override;
  end;

var
  SaleCardCheckForm: TSaleCardCheckForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSaleCardCheckForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSaleCardCheckForm.FormShow(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;

  // 신용카드 매입사 목록을 만든다
  New(vCode);
  vCode^.Data := '';
  CardCompanyComboBox.Clear;
  CardCompanyComboBox.Properties.Items.AddObject('[선택하지 않음]', TObject(vCode));
  // 공통코드에서 신용카드 매입사를 조회한다
  OpenQuery('select   NM_CODE1, '
           +'         NM_CODE2 '
           +'  from   MS_CODE '
           +' where   CD_HEAD  = :P0 '
           +'   and   CD_STORE = :P1 '
           +'   and   CD_KIND  = ''06'' '
           +'   and   DS_STATUS = ''0'' '
           +'order by CD_CODE',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[1].AsString;
      CardCompanyComboBox.Properties.Items.AddObject(Query.Fields[0].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  CardNoEdit.Properties.MaxLength := 6;

//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TSaleCardCheckForm.FormDestroy(Sender: TObject);
begin
  CardCompanyCode.Free;
  CardJoinNo.Free;

  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TSaleCardCheckForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 매인패널
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TSaleCardCheckForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;

  // 매입사
  if (Sender = CardCompanyComboBox) then
    CardJoinNoEdit.Text := GetStrPointerData(CardCompanyComboBox);
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSaleCardCheckForm.DoSearch: Boolean;
begin
  Result := false;

  try
    OpenQuery('select   NO_POS, '
             +'         NO_RCP, '
             +'         SEQ, '
             +'         case DS_TRD when ''C'' then ''취소'' else ''승인'' end as DS_TRD, '
             +'         GetCardNo(NO_CARD,''N'') as NO_CARD, '
             +'         case DS_TRD when ''C'' then - AMT_APPROVAL else AMT_APPROVAL end as AMT_APPROVAL '
             +'from     SL_CARD '
             +'where    CD_HEAD  = :P0 '
             +'  and    CD_STORE = :P1 '
             +'  and    YMD_SALE = :P2 '
             +'  and    TYPE_TRD = ''C'' '
             +'order by NO_POS, NO_RCP, SEQ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  except
  end;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TSaleCardCheckForm.DoGridLink;
begin
  inherited;

  if (GridTableView.DataController.FocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index] = null) then
    Exit;

  OpenQuery('select   NO_CARD, '
           +'         NO_CHAINPL, '
           +'         TRD_DATE, '
           +'         TRD_DATE_ORG, '
           +'         NO_APPROVAL, '
           +'         NO_APPROVAL_ORG, '
           +'         TERM_HALBU '
           +'from     SL_CARD '
           +'where    CD_HEAD  = :P0 '
           +'  and    CD_STORE = :P1 '
           +'  and    YMD_SALE = :P2 '
           +'  and    NO_POS   = :P3 '
           +'  and    NO_RCP   = :P4 '
           +'  and    SEQ      = :P5',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index],
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBillNo.Index],
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index]]);
  try
    SaleAmountEdit.Value          := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewApprovalAmt.Index];
    CardNoEdit.Text               := Query.Fields[0].AsString;
    CardJoinNoEdit.Text           := Query.Fields[1].AsString;
    if Query.Fields[2].AsString = EmptyStr then
      ApprovalDateEdit.Text := EmptyStr
    else
      ApprovalDateEdit.Date         := StoD(Query.Fields[2].AsString);
    if Query.Fields[3].AsString = EmptyStr then
      CancelDateEdit.Text := EmptyStr
    else
      CancelDateEdit.Date           := StoD(Query.Fields[3].AsString);

    ApprovalNoEdit.Text           := Query.Fields[4].AsString;
    CancelNoEdit.Text             := Query.Fields[5].AsString;
    InstallmentEdit.Value         := StoI(Query.Fields[6].AsString);
    CardCompanyComboBox.ItemIndex := Ifthen(GetStrPointerIndex(CardCompanyComboBox, Trim(Query.Fields[1].AsString)) < 0, 0, GetStrPointerIndex(CardCompanyComboBox, Trim(Query.Fields[1].AsString)));
    CancelDateEdit.Visible        := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewType.Index] = '취소';
    CancelDateLabel.Visible       := CancelDateEdit.Visible;
    CancelNoEdit.Visible          := CancelDateEdit.Visible;
    CancelNoLabel.Visible         := CancelDateEdit.Visible;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TSaleCardCheckForm.DoSave: Boolean;
begin
  Result := false;

  // 카드번호
  if (ApprovalNoEdit.Text <> GetOnlyNumber(ApprovalNoEdit.Text)) and (ApprovalNoEdit.Text <> '카드단말기') then
  begin
    ErrBox(ApprovalNoLabel.Caption+msgMustInput);
    Exit;
  end
  // 취소번호
  else if CancelNoEdit.Text <> GetOnlyNumber(CancelNoEdit.Text) then
  begin
    ErrBox(CancelNoLabel.Caption+msgMustInput);
    Exit;
  end;

  try
    // 마스터 저장
    Result := ExecQuery('update SL_CARD '
                       +'set    NO_CARD         = :P6, '
                       +'       NM_CARD_BUY     = :P7, '
                       +'       NO_CHAINPL      = :P8, '
                       +'       TRD_DATE        = :P9, '
                       +'       TRD_DATE_ORG    = :P10, '
                       +'       NO_APPROVAL     = :P11, '
                       +'       NO_APPROVAL_ORG = :P12, '
                       +'       TERM_HALBU      = :P13 '
                       +'where  CD_HEAD         = :P0 '
                       +'  and  CD_STORE        = :P1 '
                       +'  and  YMD_SALE        = :P2 '
                       +'  and  NO_POS          = :P3 '
                       +'  and  NO_RCP          = :P4 '
                       +'  and  SEQ             = :P5;',
                        [HeadStoreCode,
                         StoreCode,
                         DtoS(ConditionToolBarFromDateEdit.Date),
                         GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPosNo.Index],
                         GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBillNo.Index],
                         GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index],
                         GetCardNo(CardNoEdit.Text),
                         CardCompanyComboBox.Text,
                         CardJoinNoEdit.Text,
                         DtoS(ApprovalDateEdit.Date),
                         IfThen(CancelDateEdit.Visible, DtoS(CancelDateEdit.Date), EmptyStr),
                         ApprovalNoEdit.Text,
                         IfThen(CancelNoEdit.Visible, CancelNoEdit.Text, EmptyStr),
                         IntToStr(Trunc(InstallmentEdit.Value))]);
    if Result and (GridTableView.DataController.FocusedRecordIndex >= 0) then
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewCardNo.Index] := GetCardNo(CardNoEdit.Text);
  except
  end;
end;

end.
