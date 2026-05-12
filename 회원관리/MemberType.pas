// 회원 포인트/할인 관리 (완료)

unit MemberType;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxTextEdit, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, ExtCtrls,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, AdvSplitter, cxLookAndFeelPainters, cxCheckBox, cxCurrencyEdit,
  cxGroupBox, StdCtrls, StrUtils, AdvToolBarStylers, cxLookAndFeels, Math, DBAccess;

type
  TMemberTypeForm = class(TInheritGridEditForm)
    GridTableViewCode: TcxGridColumn;
    GridTableViewName: TcxGridColumn;
    TopPanel: TPanel;
    MemberTypeNameLabel: TLabel;
    PointDCTypeLabel: TLabel;
    CommentLabel: TLabel;
    MemberTypeNameEdit: TcxTextEdit;
    PointDCTypeComboBox: TcxComboBox;
    PointPanel: TPanel;
    PointGroupBox: TcxGroupBox;
    PointCashLabel: TLabel;
    PointCashReceiptLabel: TLabel;
    PointCardLabel: TLabel;
    PointGiftCardLabel: TLabel;
    PointCreditLabel: TLabel;
    PointOKCashbagLabel: TLabel;
    PointTypeLabel: TLabel;
    PointTmoneyLabel: TLabel;
    PointRatePanel: TPanel;
    PointRateCashLabel: TLabel;
    PointRateCashReceiptLabel: TLabel;
    PointRateCardLabel: TLabel;
    PointRateGiftCardLabel: TLabel;
    PointRateCreditLabel: TLabel;
    PointRateOKCashbagLabel: TLabel;
    PointRateTmoneyLabel: TLabel;
    PointRateCashEdit: TcxCurrencyEdit;
    PointRateCashReceiptEdit: TcxCurrencyEdit;
    PointRateCardEdit: TcxCurrencyEdit;
    PointRateGiftCardEdit: TcxCurrencyEdit;
    PointRateCreditEdit: TcxCurrencyEdit;
    PointRateOKCashbagEdit: TcxCurrencyEdit;
    PointRateTmoneyEdit: TcxCurrencyEdit;
    PointPointPanel: TPanel;
    PointPointCashLabel: TLabel;
    PointPointCashReceiptLabel: TLabel;
    PointPointCardLabel: TLabel;
    PointPointGiftCardLabel: TLabel;
    PointPointCreditLabel: TLabel;
    PointPointOKCashbagLabel: TLabel;
    PointPointTmoneyLabel: TLabel;
    PointPointCashAmountEdit: TcxCurrencyEdit;
    PointPointCashEdit: TcxCurrencyEdit;
    PointPointCashReceiptAmountEdit: TcxCurrencyEdit;
    PointPointCashReceiptEdit: TcxCurrencyEdit;
    PointPointCardAmountEdit: TcxCurrencyEdit;
    PointPointCardEdit: TcxCurrencyEdit;
    PointPointGiftCardAmountEdit: TcxCurrencyEdit;
    PointPointGiftCardEdit: TcxCurrencyEdit;
    PointPointCreditAmountEdit: TcxCurrencyEdit;
    PointPointCreditEdit: TcxCurrencyEdit;
    PointPointOKCashbagAmountEdit: TcxCurrencyEdit;
    PointPointOKCashbagEdit: TcxCurrencyEdit;
    PointPointTmoneyAmountEdit: TcxCurrencyEdit;
    PointPointTmoneyEdit: TcxCurrencyEdit;
    PointAllCheckBox: TcxCheckBox;
    PointTypeComboBox: TcxComboBox;
    DCPanel: TPanel;
    DCGroupBox: TcxGroupBox;
    DCRateLabel: TLabel;
    DCRatePercentLabel: TLabel;
    DCRateEdit: TcxCurrencyEdit;

    procedure EditPropertiesChange(Sender: TObject);
    procedure PointAllCheckBoxPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  MemberTypeForm: TMemberTypeForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}


//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TMemberTypeForm.FormShow(Sender: TObject);
begin
  inherited;
  //본사가 아닐때는 통합회원을 사용하면 포인트/할인률 관리를 수정하지 못하게 한다
  if (Tag = 0) and (StoreCode <> '0000') and (GetOption(257)='1') then
  begin
    ButtonToolBarNewButton.Visible    := false;
    ButtonToolBarDeleteButton.Visible := false;
    ButtonToolBarSaveButton.Visible   := false;
    ButtonToolBarCancelButton.Visible := false;
    ButtonToolBarSearchButton.Left    := ButtonToolBarCancelButton.Left;
  end;
  isChanged := false;
  // 조회를 한다
//  ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TMemberTypeForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;

  // 포인트/할인적용
  if Sender = PointDCTypeComboBox then
  begin
    PointPanel.Visible := false;
    DCPanel.Visible    := false;
    case PointDCTypeComboBox.ItemIndex of
      1 : // 포인트만
        PointPanel.Visible := true;
      2 : // 할인만
        DCPanel.Visible    := true;
      3 : // 할인+포인트
      begin
        PointPanel.Visible := true;
        DCPanel.Visible    := true;
      end;
    end;
  end

  // (포인트) 적립기준
  else if Sender = PointTypeComboBox then
  begin
    PointPointPanel.Visible := false;
    PointRatePanel.Visible  := false;
    if PointTypeComboBox.ItemIndex = 0 then
      PointPointPanel.Visible := true
    else
      PointRatePanel.Visible  := true;
  end

  // (포인트) 현금/수표 매출
  else if (Sender = PointPointCashAmountEdit) and (PointAllCheckBox.Checked) then
  begin
    PointPointCashReceiptAmountEdit.Value   := PointPointCashAmountEdit.Value;
    PointPointCardAmountEdit.Value          := PointPointCashAmountEdit.Value;
    PointPointGiftCardAmountEdit.Value      := PointPointCashAmountEdit.Value;
    PointPointCreditAmountEdit.Value        := PointPointCashAmountEdit.Value;
    PointPointOKCashbagAmountEdit.Value     := PointPointCashAmountEdit.Value;
    PointPointTmoneyAmountEdit.Value        := PointPointCashAmountEdit.Value;
  end
  else if (Sender = PointPointCashEdit) and (PointAllCheckBox.Checked) then
  begin
    PointPointCashReceiptEdit.Value         := PointPointCashEdit.Value;
    PointPointCardEdit.Value                := PointPointCashEdit.Value;
    PointPointGiftCardEdit.Value            := PointPointCashEdit.Value;
    PointPointCreditEdit.Value              := PointPointCashEdit.Value;
    PointPointOKCashbagEdit.Value           := PointPointCashEdit.Value;
    PointPointTmoneyEdit.Value              := PointPointCashEdit.Value;
  end
  else if (Sender = PointRateCashEdit) and (PointAllCheckBox.Checked) then
  begin
    PointRateCashReceiptEdit.Value          := PointRateCashEdit.Value;
    PointRateCardEdit.Value                 := PointRateCashEdit.Value;
    PointRateGiftCardEdit.Value             := PointRateCashEdit.Value;
    PointRateCreditEdit.Value               := PointRateCashEdit.Value;
    PointRateOKCashbagEdit.Value            := PointRateCashEdit.Value;
    PointRateTmoneyEdit.Value               := PointRateCashEdit.Value;
  end;
end;
//------------------------------------------------------------------------------
// 모든 결제수단 동일 적용 값을 수정할 때
procedure TMemberTypeForm.PointAllCheckBoxPropertiesChange(Sender: TObject);
begin
  inherited;

  PointPointCashReceiptAmountEdit.Enabled := not PointAllCheckBox.Checked;
  PointPointCashReceiptEdit.Enabled       := PointPointCashReceiptAmountEdit.Enabled;
  PointPointCardAmountEdit.Enabled        := PointPointCashReceiptAmountEdit.Enabled;
  PointPointCardEdit.Enabled              := PointPointCashReceiptAmountEdit.Enabled;
  PointPointGiftCardAmountEdit.Enabled    := PointPointCashReceiptAmountEdit.Enabled;
  PointPointGiftCardEdit.Enabled          := PointPointCashReceiptAmountEdit.Enabled;
  PointPointCreditAmountEdit.Enabled      := PointPointCashReceiptAmountEdit.Enabled;
  PointPointCreditEdit.Enabled            := PointPointCashReceiptAmountEdit.Enabled;
  PointPointOKCashbagAmountEdit.Enabled   := PointPointCashReceiptAmountEdit.Enabled;
  PointPointOKCashbagEdit.Enabled         := PointPointCashReceiptAmountEdit.Enabled;
  PointPointTmoneyAmountEdit.Enabled      := PointPointCashReceiptAmountEdit.Enabled;
  PointPointTmoneyEdit.Enabled            := PointPointCashReceiptAmountEdit.Enabled;
  PointRateCashReceiptEdit.Enabled        := PointPointCashReceiptAmountEdit.Enabled;
  PointRateCardEdit.Enabled               := PointPointCashReceiptAmountEdit.Enabled;
  PointRateGiftCardEdit.Enabled           := PointPointCashReceiptAmountEdit.Enabled;
  PointRateCreditEdit.Enabled             := PointPointCashReceiptAmountEdit.Enabled;
  PointRateOKCashbagEdit.Enabled          := PointPointCashReceiptAmountEdit.Enabled;
  PointRateTmoneyEdit.Enabled             := PointPointCashReceiptAmountEdit.Enabled;

  if not PointAllCheckBox.Checked then Exit;

  PointPointCashReceiptAmountEdit.Value   := PointPointCashAmountEdit.Value;
  PointPointCardAmountEdit.Value          := PointPointCashAmountEdit.Value;
  PointPointGiftCardAmountEdit.Value      := PointPointCashAmountEdit.Value;
  PointPointCreditAmountEdit.Value        := PointPointCashAmountEdit.Value;
  PointPointOKCashbagAmountEdit.Value     := PointPointCashAmountEdit.Value;
  PointPointTmoneyAmountEdit.Value        := PointPointCashAmountEdit.Value;

  PointPointCashReceiptEdit.Value         := PointPointCashEdit.Value;
  PointPointCardEdit.Value                := PointPointCashEdit.Value;
  PointPointGiftCardEdit.Value            := PointPointCashEdit.Value;
  PointPointCreditEdit.Value              := PointPointCashEdit.Value;
  PointPointOKCashbagEdit.Value           := PointPointCashEdit.Value;
  PointPointTmoneyEdit.Value              := PointPointCashEdit.Value;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TMemberTypeForm.DoSearch: Boolean;
begin
  Result := False;

  try
    if Tag = 0 then
    begin
      OpenQuery('select   CD_CODE, '
               +'         NM_CODE1 '
               +'from     MS_CODE '
               +'where    CD_STORE  = :P0 '
               +'  and    CD_KIND   = ''05'' '
               +'  and    DS_STATUS = ''0'' '
               +'order by CD_STORE, CD_KIND, CD_CODE',
                [Ifthen(GetOption(257)='0', StoreCode,'0000')]);
      Result := DM.ReadQuery(Query, GridTableView);
      if not Result then
        MsgBox('등록된 회원구분이 없습니다.'+#13+'[공통 코드 관리]에서 회원구분을 먼저 등록하십시오.');
    end
    else
    begin
      OpenQuery('select   CD_CODE, '
               +'         NM_CODE1 '
               +'from     MS_CODE '
               +'where    CD_STORE  = :P0 '
               +'  and    CD_KIND   = ''09'' '
               +'  and    DS_STATUS = ''0'' '
               +'order by CD_STORE, CD_KIND, CD_CODE',
                [StoreCode]);
      Result := DM.ReadQuery(Query, GridTableView);
      if not Result then
        MsgBox('등록된 매출처구분이 없습니다.'+#13+'[공통 코드 관리]에서 매출처구분을 먼저 등록하십시오.');
    end;
  except
  end;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TMemberTypeForm.DoGridLink;
begin
  inherited;
  MainPanel.Enabled := ButtonToolBarSaveButton.Visible;
  OpenQuery('select   NM_CODE2, '       //0
           +'         NM_CODE3, '       //1
           +'         NM_CODE4, '       //2    //현금금액
           +'         NM_CODE5, '       //3    //현금포인트
           +'         NM_CODE6, '       //4
           +'         NM_CODE7, '       //5
           +'         NM_CODE8, '       //6    //신용카드금액
           +'         NM_CODE9, '       //7    //신용카드포인트
           +'         NM_CODE10, '      //8  상품권
           +'         NM_CODE11, '      //9
           +'         NM_CODE12, '      //10  외상금액
           +'         NM_CODE13, '      //11  외상포인트
           +'         NM_CODE14, '      //12
           +'         NM_CODE15, '      //13
           +'         NM_CODE16, '      //14
           +'         NM_CODE17, '      //15
           +'         NM_CODE24 '       //16
           +'from     MS_CODE '
           +'where    CD_STORE = :P0 '
           +'  and    CD_KIND  = '''+Ifthen(Tag=0, '05', '09')+''' '
           +'  and    CD_CODE  = :P1',
            [Ifthen((GetOption(257)='0') or (Tag=1), StoreCode,'0000'),
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index]]);
  try
    if not Query.Eof then
    begin
      MemberTypeNameEdit.Hint                 := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index];
      MemberTypeNameEdit.Text                 := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewName.Index];
      PointAllCheckBox.Checked                := false;
      PointDCTypeComboBox.ItemIndex           := Ifthen(Tag=0, StoI(Query.Fields[ 0].AsString),1);
      PointTypeComboBox.ItemIndex             := StoI(Query.Fields[ 1].AsString);
      if PointTypeComboBox.ItemIndex = 0 then
      begin
        PointPointCashAmountEdit.Value        := StoF(Query.Fields[ 2].AsString);
        PointPointCashEdit.Value              := StoF(Query.Fields[ 3].AsString);
        PointPointCashReceiptAmountEdit.Value := StoF(Query.Fields[ 4].AsString);
        PointPointCashReceiptEdit.Value       := StoF(Query.Fields[ 5].AsString);
        PointPointCardAmountEdit.Value        := StoF(Query.Fields[ 6].AsString);
        PointPointCardEdit.Value              := StoF(Query.Fields[ 7].AsString);
        PointPointGiftCardAmountEdit.Value    := StoF(Query.Fields[ 8].AsString);
        PointPointGiftCardEdit.Value          := StoF(Query.Fields[ 9].AsString);
        PointPointCreditAmountEdit.Value      := StoF(Query.Fields[10].AsString);
        PointPointCreditEdit.Value            := StoF(Query.Fields[11].AsString);
        PointPointOKCashbagAmountEdit.Value   := StoF(Query.Fields[12].AsString);
        PointPointOKCashbagEdit.Value         := StoF(Query.Fields[13].AsString);
        PointPointTmoneyAmountEdit.Value      := StoF(Query.Fields[14].AsString);
        PointPointTmoneyEdit.Value            := StoF(Query.Fields[15].AsString);
      end
      else
      begin
        PointRateCashEdit.Value               := StoF(Query.Fields[ 3].AsString);
        PointRateCashReceiptEdit.Value        := StoF(Query.Fields[ 5].AsString);
        PointRateCardEdit.Value               := StoF(Query.Fields[ 7].AsString);
        PointRateGiftCardEdit.Value           := StoF(Query.Fields[ 9].AsString);
        PointRateCreditEdit.Value             := StoF(Query.Fields[11].AsString);
        PointRateOKCashbagEdit.Value          := StoF(Query.Fields[13].AsString);
        PointRateTmoneyEdit.Value             := StoF(Query.Fields[15].AsString);
      end;
      DCRateEdit.Value                        := StoF(Query.Fields[16].AsString);
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TMemberTypeForm.DoSave: Boolean;
begin
  Result := ExecQuery('update MS_CODE '
                     +'set    NM_CODE2     = :P2, '
                     +'       NM_CODE3     = :P3, '
                     +'       NM_CODE4     = :P4, '
                     +'       NM_CODE5     = :P5, '
                     +'       NM_CODE6     = :P6, '
                     +'       NM_CODE7     = :P7, '
                     +'       NM_CODE8     = :P8, '
                     +'       NM_CODE9     = :P9, '
                     +'       NM_CODE10    = :P10, '
                     +'       NM_CODE11    = :P11, '
                     +'       NM_CODE12    = :P12, '
                     +'       NM_CODE13    = :P13, '
                     +'       NM_CODE14    = :P14, '
                     +'       NM_CODE15    = :P15, '
                     +'       NM_CODE16    = :P16, '
                     +'       NM_CODE17    = :P17, '
                     +'       NM_CODE24    = :P18, '
                     +'       CD_SAWON_CHG = :P19, '
                     +'       DT_CHANGE    = GetDate(), '
                     +'       DS_TRANS     = 0 '
                     +'where  CD_STORE     = :P0 '
                     +'  and  CD_KIND      = '''+Ifthen(Tag=0, '05', '09')+''' '
                     +'  and  CD_CODE      = :P1',
                      [Ifthen((GetOption(257)='0') or (Tag=1), StoreCode,'0000'),
                       MemberTypeNameEdit.Hint,
                       IntToStr(PointDCTypeComboBox.ItemIndex),
                       IntToStr(PointTypeComboBox.ItemIndex),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCashAmountEdit.Value),        EmptyStr),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCashEdit.Value),              FloatToStr(PointRateCashEdit.Value)),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCashReceiptAmountEdit.Value), EmptyStr),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCashReceiptEdit.Value),       FloatToStr(PointRateCashReceiptEdit.Value)),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCardAmountEdit.Value),        EmptyStr),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCardEdit.Value),              FloatToStr(PointRateCardEdit.Value)),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointGiftCardAmountEdit.Value),    EmptyStr),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointGiftCardEdit.Value),          FloatToStr(PointRateGiftCardEdit.Value)),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCreditAmountEdit.Value),      EmptyStr),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointCreditEdit.Value),            FloatToStr(PointRateCreditEdit.Value)),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointOKCashbagAmountEdit.Value),   EmptyStr),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointOKCashbagEdit.Value),         FloatToStr(PointRateOKCashbagEdit.Value)),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointTmoneyAmountEdit.Value),      EmptyStr),
                       IfThen(PointTypeComboBox.ItemIndex = 0, FloatToStr(PointPointTmoneyEdit.Value),            FloatToStr(PointRateTmoneyEdit.Value)),
                       FloatToStr(DCRateEdit.Value),
                       UserCode]);
end;

end.
