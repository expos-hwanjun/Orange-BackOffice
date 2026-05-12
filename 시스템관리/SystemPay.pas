// 결제 수단 관리 (완료)

unit SystemPay;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, StdCtrls, Buttons, cxListBox, ExtCtrls,
  cxContainer, cxEdit, UniProvider, SQLServerUniProvider, DBAccess, Uni, DB,
  MemDS, cxButtonEdit, cxDropDownEdit, cxLabel, cxControls, cxTextEdit,
  cxMaskEdit, cxCalendar, AdvGlowButton, AdvToolBar, AdvToolBarStylers, cxStyles;

type
  TSystemPayForm = class(TInheritEditForm)
    SourcePanel: TPanel;
    SourceTitleLabel: TcxLabel;
    SourceListBox: TcxListBox;
    SplitterPanel: TPanel;
    DestinationPanel: TPanel;
    DestinationTitleLabel: TcxLabel;
    Panel1: TPanel;
    DestinationTopButton: TButton;
    DestinationUpButton: TButton;
    DestinationDownButton: TButton;
    DestinationBottomButton: TButton;
    DestinationListBox: TcxListBox;
    SplitterAddButton: TButton;
    SplitterDeleteButton: TButton;

    procedure FormShow(Sender: TObject);
    procedure SplitterAddButtonClick(Sender: TObject);
    procedure SplitterDeleteButtonClick(Sender: TObject);
    procedure DestinationTopButtonClick(Sender: TObject);
    procedure DestinationUpButtonClick(Sender: TObject);
    procedure DestinationDownButtonClick(Sender: TObject);
    procedure DestinationBottomButtonClick(Sender: TObject);

  protected
    function DoSave: Boolean; override;  // 저장
  end;

var
  SystemPayForm: TSystemPayForm;



implementation

uses
  Common;

{$R *.dfm}

const
  payCash      = '현금영수증';
  payCheck     = '수표';
  payCard      = '신용카드';
  payEasyCheck = '카드단말기';
  payCredit    = '외상';
  payPoint     = '포인트';
  payGiftCard  = '상품권';
  payOKCashbag = 'OK캐쉬백';
  payTMoney    = 'T-money';

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSystemPayForm.FormShow(Sender: TObject);
var
  vPay: string;
  vIndex: Integer;
begin
  inherited;

  // 기존 자료를 불러온다
  OpenQuery('select   NM_CODE1 '
           +'from     MS_CODE '
           +'where    CD_STORE = :P0 '
           +'  and    CD_KIND  = ''54'' '
           +'  and    CD_CODE  = ''001''',
            [StoreCode]);
  try
    if not Query.Eof then
      vPay := Query.Fields[0].AsString
    else
      vPay := EmptyStr;
  finally
    FinishQuery;
  end;

  for vIndex := 0 to Length(vPay)-1 do
    case StoI(vPay[vIndex+1]) of
      1 : DestinationListBox.Items.Add(payCash     );
      2 : DestinationListBox.Items.Add(payCheck    );
      3 : DestinationListBox.Items.Add(payCard     );
      4 : DestinationListBox.Items.Add(payEasyCheck);
      5 : DestinationListBox.Items.Add(payCredit   );
      6 : DestinationListBox.Items.Add(payPoint    );
      7 : DestinationListBox.Items.Add(payGiftCard );
      8 : DestinationListBox.Items.Add(payOKCashbag);
      9 : DestinationListBox.Items.Add(payTMoney   );
    end;

  if DestinationListBox.Items.IndexOf(payCash)      < 0 then
    SourceListBox.Items.Add(payCash);
  if DestinationListBox.Items.IndexOf(payCheck)     < 0 then
    SourceListBox.Items.Add(payCheck);
  if DestinationListBox.Items.IndexOf(payCard)      < 0 then
    SourceListBox.Items.Add(payCard);
  if DestinationListBox.Items.IndexOf(payEasyCheck) < 0 then
    SourceListBox.Items.Add(payEasyCheck);
  if DestinationListBox.Items.IndexOf(payCredit)    < 0 then
    SourceListBox.Items.Add(payCredit);
  if DestinationListBox.Items.IndexOf(payPoint)     < 0 then
    SourceListBox.Items.Add(payPoint);
  if DestinationListBox.Items.IndexOf(payGiftCard)  < 0 then
    SourceListBox.Items.Add(payGiftCard);
  if DestinationListBox.Items.IndexOf(payOKCashbag) < 0 then
    SourceListBox.Items.Add(payOKCashbag);
  if DestinationListBox.Items.IndexOf(payTMoney)    < 0 then
    SourceListBox.Items.Add(payTMoney);
end;

//==============================================================================
// 메인 폼
//------------------------------------------------------------------------------
// 추가 버튼
procedure TSystemPayForm.SplitterAddButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to SourceListBox.Count-1 do
    if SourceListBox.Selected[vIndex] then
    begin
      DestinationListBox.Items.Add(SourceListBox.Items[vIndex]);
      SourceListBox.DeleteSelected;
      isChanged := true;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TSystemPayForm.SplitterDeleteButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to DestinationListBox.Count-1 do
    if DestinationListBox.Selected[vIndex] then
    begin
      SourceListBox.Items.Add(DestinationListBox.Items[vIndex]);
      DestinationListBox.DeleteSelected;
      isChanged := true;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 맨 위로 버튼
procedure TSystemPayForm.DestinationTopButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to DestinationListBox.Count-1 do
    if DestinationListBox.Selected[vIndex] and (vIndex > 0) then
    begin
      DestinationListBox.Items.Move(vIndex, 0);
      DestinationListBox.Selected[0] := true;
      isChanged := true;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 위로 버튼
procedure TSystemPayForm.DestinationUpButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to DestinationListBox.Count-1 do
    if DestinationListBox.Selected[vIndex] and (vIndex > 0) then
    begin
      DestinationListBox.Items.Move(vIndex, vIndex-1);
      DestinationListBox.Selected[vIndex-1] := true;
      isChanged := true;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 아래로 버튼
procedure TSystemPayForm.DestinationDownButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to DestinationListBox.Count-1 do
    if DestinationListBox.Selected[vIndex] and (vIndex < DestinationListBox.Count-1) then
    begin
      DestinationListBox.Items.Move(vIndex, vIndex+1);
      DestinationListBox.Selected[vIndex+1] := true;
      isChanged := true;
      break;
    end;
end;
//------------------------------------------------------------------------------
// 맨 아래로 버튼
procedure TSystemPayForm.DestinationBottomButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to DestinationListBox.Count-1 do
    if DestinationListBox.Selected[vIndex] and (vIndex < DestinationListBox.Count-1) then
    begin
      DestinationListBox.Items.Move(vIndex, DestinationListBox.Count-1);
      DestinationListBox.Selected[DestinationListBox.Count-1] := true;
      isChanged := true;
      break;
    end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 저장 버튼
function TSystemPayForm.DoSave: Boolean;
var
  vPay: string;
  vIndex: Integer;
begin
  Result := false;

  inherited;

  vPay := EmptyStr;
  for vIndex := 0 to DestinationListBox.Count-1 do
    if DestinationListBox.Items[vIndex] = payCash then
      vPay := vPay+'1'
    else if DestinationListBox.Items[vIndex] = payCheck then
      vPay := vPay+'2'
    else if DestinationListBox.Items[vIndex] = payCard then
      vPay := vPay+'3'
    else if DestinationListBox.Items[vIndex] = payEasyCheck then
      vPay := vPay+'4'
    else if DestinationListBox.Items[vIndex] = payCredit then
      vPay := vPay+'5'
    else if DestinationListBox.Items[vIndex] = payPoint then
      vPay := vPay+'6'
    else if DestinationListBox.Items[vIndex] = payGiftCard then
      vPay := vPay+'7'
    else if DestinationListBox.Items[vIndex] = payOKCashbag then
      vPay := vPay+'8'
    else if DestinationListBox.Items[vIndex] = payTMoney then
      vPay := vPay+'9';

  // 저장
  try
    BeginTrans;
    Result := ExecQuery('delete from MS_CODE '
                       +'where  CD_STORE = :P0 '
                       +'  and  CD_KIND  = ''54'' '
                       +'  and  CD_CODE  = ''001''',
                        [StoreCode],
                         false);
    if Result then
      Result := ExecQuery('insert into MS_CODE '
                         +'( '
                         +'  CD_STORE, CD_KIND, CD_CODE, NM_CODE1, DS_STATUS, DT_CHANGE, DS_TRANS '
                         +') values ( '
                         +'  :P0, ''54'', ''001'', :P1, ''0'', GetDate(), 0 '
                         +')',
                          [StoreCode,
                           vPay],
                           false);
    CommitTrans;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
      RollbackTrans;
    end;
  end;
end;

end.
