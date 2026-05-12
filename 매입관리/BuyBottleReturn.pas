// 공병 반환 (New완료)

unit BuyBottleReturn;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxButtonEdit, cxLabel, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxCheckBox, cxMemo, ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxContainer, Uni, DB, MemDS, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels,
  cxLookAndFeelPainters, DBAccess, StrUtils;

type
  TBuyBottleReturnForm = class(TInheritEditForm)
    MainPanel: TPanel;
    CompanyCodeLabel: TLabel;
    CompanyCodeEdit: TcxButtonEdit;
    CompanyNameEdit: TcxTextEdit;
    StatusLabel: TLabel;
    StatusEdit: TcxTextEdit;
    CommentLabel: TLabel;
    CommentMemo: TcxMemo;
    Grid: TcxGrid;
    GridLevel: TcxGridLevel;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewQty: TcxGridColumn;
    GridTableViewPrice: TcxGridColumn;
    GridTableViewAmt: TcxGridColumn;
    ButtonToolBarNewButton: TAdvGlowButton;
    GridDeleteButton: TButton;
    ButtonToolBarCancelButton: TAdvGlowButton;

    procedure ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridDeleteButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);

  private
    BackupData: array of Variant;

    procedure DisabledCompanyCode;
    function  SearchCompany(aCompany: string = ''): string;
    function  SearchGoods(aGoods: string = ''): string;

  protected
    function  DoSearch: Boolean; override;
    function  DoDelete: Boolean; override;
    function  DoSave  : Boolean; override;
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  BuyBottleReturnForm: TBuyBottleReturnForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TBuyBottleReturnForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN,
    VK_UP   :
      if GridTableView.Controller.IsNewItemRowFocused then
      begin
        Key := 0;
        Exit;
      end;
  end;

  inherited;
end;

procedure TBuyBottleReturnForm.FormShow(Sender: TObject);
begin
  inherited;
  //매입정정에서 실행시켰을때
  //##### 이벤트 처리
  if Length(FormParam[0]) = 14 then
  begin
    ConditionToolBarFromDateEdit.Date := StoD(LeftStr(FormParam[0],10));
    ConditionToolBarEdit.Text    := RightStr(FormParam[0],4);
    ButtonToolBarSearchButton.Click;
    FormParam[0] := EmptyStr;
  end
  else
    ButtonToolBarNewButton.Click;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 전표번호에서 키보드를 누를 때
procedure TBuyBottleReturnForm.ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 신규 버튼
procedure TBuyBottleReturnForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재 작업을 모두 취소하시겠습니까?') then Exit;

  // 입력창들을 모두 지운다
  ClearEdit;
  ConditionToolBarFromDateEdit.Enabled := true;
  ConditionToolBarEdit.Enabled := true;
  ConditionToolBarEdit.Clear;
  CompanyCodeEdit.Enabled := true;
  GridTableView.DataController.RecordCount := 0;

  MainPanel.Enabled := true;
  Grid.Enabled      := MainPanel.Enabled;
  isChanged         := false;
  if CompanyCodeEdit.Enabled then
    CompanyCodeEdit.SetFocus;
end;

procedure TBuyBottleReturnForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  if not ButtonToolBarNewButton.Visible or not ButtonToolBarNewButton.Enabled then
    Exit;

  inherited;

  if isChanged then
  begin
    PlayWave('SaveChanged');
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  // 입력창들을 모두 지운다
  ClearEdit;
  ConditionToolBarFromDateEdit.Enabled := true;
  ConditionToolBarEdit.Enabled := true;
  ConditionToolBarEdit.Clear;
  GridTableView.DataController.RecordCount := 0;

  MainPanel.Enabled := true;
  Grid.Enabled      := MainPanel.Enabled;
  isChanged         := false;
  if CompanyCodeEdit.Enabled then
    CompanyCodeEdit.SetFocus;
end;

procedure TBuyBottleReturnForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 매인 패널
//------------------------------------------------------------------------------
// 거래처 입력창 버튼을 누를 때
procedure TBuyBottleReturnForm.CompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  // 거래처를 조회한다
  if CompanyCodeEdit.Text <> EmptyStr then
    CompanyCodeEdit.Text := SearchCompany(CompanyCodeEdit.Text)
  else
    CompanyCodeEdit.Text := SearchCompany;

  if CompanyNameEdit.Text <> EmptyStr then
  begin
    if MainPanel.Enabled and CommentMemo.Enabled then
      CommentMemo.SetFocus;
    Grid.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
// 거래처 입력창을 수정할 때
procedure TBuyBottleReturnForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;

  // 거래처코드
  if (Sender = CompanyCodeEdit) and (CompanyNameEdit.Text <> EmptyStr) and
     ((GetOnlyNumber(CompanyCodeEdit.EditingText) <> CompanyCodeEdit.EditingText) or (Length(CompanyCodeEdit.EditingText) <> 6)) then
  begin
    CompanyNameEdit.Text := EmptyStr;
    GridTableView.DataController.RecordCount := 0;
    Grid.Enabled         := false;
  end
end;
//------------------------------------------------------------------------------
// 거래처 입력창을 검증할 때
procedure TBuyBottleReturnForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vCode, vName: string;
begin
  inherited;

  // 거래처
  if Sender = CompanyCodeEdit then
  begin
    if DisplayValue <> EmptyStr then
      try
        OpenQuery('select   CD_TRDPL, '
                 +'         NM_TRDPL  '
                 +'from     MS_TRD '
                 +'where    CD_STORE  = :P0 '
                 +'  and   (CD_TRDPL like ''%''+:P1+''%'' or NM_TRDPL like ''%''+:P1+''%'') '
                 +'  and    DS_TRDPL  = ''B'' '
                 +'  and    DS_STATUS = 0',
                  [StoreCode,
                   DisplayValue]);
        if not Query.Eof then
        begin
          // 일단 첫번째 값을 받아 놓는다
          vCode := Query.Fields[0].AsString;
          vName := Query.Fields[1].AsString;
          // 쿼리 다음 줄로 이동해 본다
          Query.Next;
          // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
          if Query.Eof then
          begin
            Grid.Enabled         := true;
            DisplayValue         := vCode;
            CompanyNameEdit.Text := vName;
          end
          // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
          else
          begin
            DisplayValue := SearchCompany(DisplayValue);
            if DisplayValue <> EmptyStr then
              Grid.Enabled := true;
          end;
        end
        else
        begin
          ErrorText := Replace(CompanyCodeLabel.Caption)+msgMustInput;
          Error     := true;
        end;
      finally
        FinishQuery;
      end;
  end;
end;

procedure TBuyBottleReturnForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드 값을 적용하기 전
procedure TBuyBottleReturnForm.GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;

  // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
  if (ADataController.NewItemRowFocused) and
     ((Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
      (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewQty.Index],       0)        = 0)) then
  begin
    // 기존에 입력된 값을 저장해 놓는다
    SetLength(BackupData, GridTableView.ColumnCount);
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      BackupData[vIndex] := ADataController.Values[-1, vIndex];
    // Post를 취소한다
    ADataController.Cancel;
  end;

  // 수량이 양수이면 음수로 바꾼다
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewQty.Index] > 0 then
  begin
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewQty.Index] := -ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewQty.Index];
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewAmt.Index] := ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewQty.Index] * ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewPrice.Index];
  end;
end;
//------------------------------------------------------------------------------
// 그리드에 값이 적용된 후
procedure TBuyBottleReturnForm.GridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
begin
  inherited;

  DisabledCompanyCode;
end;
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TBuyBottleReturnForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vIndex: Integer;
begin
  inherited;

  // 신규 상태에서 비 정상적으로 다른 레코드를 선택했다면 다시 신규 상태로 만든다
  if ((APrevFocusedRecord = nil) or (APrevFocusedRecord.Index = GridTableView.DataController.NewItemRecordIndex)) and
     (Assigned(BackupData)) and (High(BackupData) = GridTableView.ColumnCount-1) then
  begin
    // 새 레코드에 기존에 입력된 값을 강제로 다시 넣는다
    GridTableView.DataController.NewItemRowFocused := true;
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] := BackupData[vIndex];
  end;
  SetLength(BackupData, 0);
  BackupData := nil;

  // 신규 입력일 때만 상품코드를 입력할 수 있게 한다
  GridTableViewGoodsCode.Options.Editing  := GridTableView.Controller.IsNewItemRowFocused;
  GridTableViewGoodsCode.Options.Focusing := GridTableView.Controller.IsNewItemRowFocused;
  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  GridDeleteButton.Enabled                := not GridTableView.Controller.IsNewItemRowFocused;
end;
//------------------------------------------------------------------------------
// 그리드 삭제 버튼
procedure TBuyBottleReturnForm.GridDeleteButtonClick(Sender: TObject);
begin
  inherited;

  if GridTableView.Controller.IsNewItemRowFocused then
  begin
    GridTableView.DataController.Cancel;
    isChanged := true;
  end
  else if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.FocusedRecordIndex >= 0) then
  begin
    GridTableView.DataController.DeleteFocused;
    isChanged := true;
  end;
  DisabledCompanyCode;
end;
//------------------------------------------------------------------------------
// 공병코드 조회 버튼
procedure TBuyBottleReturnForm.GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  SearchGoods;
end;
//------------------------------------------------------------------------------
// 공병코드 입력값을 검증할 때
procedure TBuyBottleReturnForm.GridTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vGoodsCode, vGoodsName: string;
  vPrice: Currency;
begin
  inherited;

  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    // 상품마스터에서 해당 상품을 찾아본다
    OpenQuery('select   CD_GOODS, '
             +'         NM_GOODS_SHORT, '
             +'         PR_BUY '
             +'from     MS_GOODS '
             +'where    CD_STORE = :P0 '
             +'  and   (CD_GOODS like ''%''+:P1+''%'' or NM_GOODS like ''%''+:P1+''%'' or NM_GOODS_SHORT like ''%''+:P1+''%'') '
             +'  and    DS_GOODS = ''B'' '
             +'  and    YN_USE   = ''Y''',
              [StoreCode,
               DisplayValue]);
    isLoading := true;
    try
      if not Query.Eof then
      begin
        // 첫 레코드를 읽어놓는다
        vGoodsCode := Query.Fields[0].AsString;
        vGoodsName := Query.Fields[1].AsString;
        vPrice     := Query.Fields[2].AsCurrency;
        // 다음 줄로 이동해 검색한 레코드가 여러 건인지 확인한다
        Query.Next;
        // 검색한 레코드가 한 건이라면 바로 적용한다
        if Query.Eof then
        begin
          DisplayValue := vGoodsCode;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index] := vGoodsName;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewQty.Index]       := 0;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPrice.Index]     := vPrice;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAmt.Index]       := 0;
          Exit;
        end
        // 검색한 레코드가 여러 건이면 검색을 한다
        else
        begin
          DisplayValue := SearchGoods(DisplayValue);
          if GridTableView.DataController.Values[GridTableView.DataController.NewItemRecordIndex, GridTableViewGoodsName.Index] <> EmptyStr then
            Exit;
        end;
      end;
    finally
      isLoading := false;
      FinishQuery;
    end;

    ErrorText := GridTableViewGoodsCode.Caption+msgMustInput;
    Error     := true;
  end;
end;
//------------------------------------------------------------------------------
// 수량 입력값을 검증할 때
procedure TBuyBottleReturnForm.GridTableViewQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if Nvl(DisplayValue, 0) = 0 then
    Error := true
  else
  begin
    // 수량을 양수로 넣으면 반품이므로 음수로 바꿔준다
    if DisplayValue > 0 then
      DisplayValue := -DisplayValue;

    // 금액을 계산해서 보여준다
    if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPrice.Index] = null then
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPrice.Index] := 0;
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAmt.Index]     := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPrice.Index] * DisplayValue;
  end;
end;
//------------------------------------------------------------------------------
// 단가 입력값을 검증할 때
procedure TBuyBottleReturnForm.GridTableViewPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  // 금액을 계산해서 보여준다
  if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewQty.Index] = null then
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewQty.Index] := 0;
  GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAmt.Index]   := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewQty.Index] * DisplayValue;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 거래처 코드 비활성화
procedure TBuyBottleReturnForm.DisabledCompanyCode;
begin
  CompanyCodeEdit.Properties.ReadOnly := GridTableView.DataController.RecordCount > 0;

  if not CompanyNameEdit.Properties.ReadOnly then
    CompanyCodeEdit.Style.Color       := clWindow
  else
    CompanyCodeEdit.Style.Color       := clrDisabled;
  CompanyCodeEdit.Properties.Buttons[0].Enabled := not CompanyNameEdit.Properties.ReadOnly;
  if not CompanyNameEdit.Properties.ReadOnly then
    isChanged := false;
end;
//------------------------------------------------------------------------------
// 거래처 조회
function TBuyBottleReturnForm.SearchCompany(aCompany: string): string;
begin
  Result := EmptyStr;

  // 거래처 조회 폼을 보여준다
  with THelpForm.Create(Self) do
    try
      Caption := '거래처 조회';
      GridTableViewCode.Caption  := '거래처 코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '거래처 이름';
      GridTableViewName1.Width   := 340;

      SearchText := aCompany;
      SQLText    := 'select   CD_TRDPL, '
                   +'         NM_TRDPL  '
                   +'from     MS_TRD '
                   +'where    CD_STORE  = :P0 '
                   +'  and   (CD_TRDPL like ''%''+:P1+''%'' or NM_TRDPL like ''%''+:P1+''%'') '
                   +'  and    DS_TRDPL  = ''B'' '
                   +'  and    DS_STATUS = 0 '
                   +'order by CD_STORE, CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result               := Code;
        CompanyNameEdit.Text := Names[0];
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 상품 조회
function TBuyBottleReturnForm.SearchGoods(aGoods: string): string;
begin
  Result := EmptyStr;

  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '공병/공상자 조회';
      GridTableViewCode.Caption  := Self.GridTableViewGoodsCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := Self.GridTableViewGoodsName.Caption;
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := Self.GridTableViewPrice.Caption;
      GridTableViewName2.Width   := 100;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

      SearchText := aGoods;
      SQLText    := 'select   CD_GOODS, '
                   +'         NM_GOODS_SHORT, '
                   +'         PR_BUY '
                   +'from     MS_GOODS '
                   +'where    CD_STORE = :P0 '
                   +'  and   (CD_GOODS like ''%''+:P1+''%'' or NM_GOODS like ''%''+:P1+''%'' or NM_GOODS_SHORT like ''%''+:P1+''%'') '
                   +'  and    DS_GOODS = ''B'' '
                   +'  and    YN_USE   = ''Y'' '
                   +'order by CD_STORE, CD_GOODS';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsCode.Index] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsName.Index] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewQty.Index]       := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewPrice.Index]     := StoI(Names[1]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewAmt.Index]       := 0;
        Self.GridTableView.Controller.FocusedItemIndex := Self.GridTableViewQty.Index;
      end
      else
        Self.GridTableView.Controller.FocusedItemIndex := Self.GridTableViewGoodsCode.Index;
    finally
      Free;
    end;
end;
procedure TBuyBottleReturnForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarCancelButton.Enabled := isChanged or not ConditionToolBarEdit.Enabled;
  ButtonToolBarSearchButton.Enabled := not isChanged and ConditionToolBarEdit.Enabled;
  ButtonToolBarNewButton.Enabled    := not isChanged and ConditionToolBarEdit.Enabled;
  ButtonToolBarDeleteButton.Enabled := not ConditionToolBarEdit.Enabled;
end;

//------------------------------------------------------------------------------
// 조회
function TBuyBottleReturnForm.DoSearch: Boolean;
begin
  Result := false;

  ClearEdit;
  ButtonToolBarDeleteButton.Enabled := false;

  // 전표번호를 잘 입력했는지 확인한다
  if (GetOnlyNumber(ConditionToolBarEdit.Text) <> ConditionToolBarEdit.Text) or
     (StoI(ConditionToolBarEdit.Text) <= 0) then
    ConditionToolBarEdit.Text := EmptyStr;

  // 전표번호를 입력했다면 기존 자료를 불러온다
  if ConditionToolBarEdit.Text <> EmptyStr then
  begin
    ConditionToolBarEdit.Text := LPad(ConditionToolBarEdit.Text, 4, '0');
    OpenQuery('select   b.CD_TRDPL, '
             +'         t.NM_TRDPL, '
             +'         b.REMARK '
             +'from     SL_BUY_H as b inner join '
             +'         MS_TRD   as t on b.CD_STORE = t.CD_STORE and b.CD_TRDPL = t.CD_TRDPL '
             +'where    b.CD_STORE = :P0 '
             +'  and    b.YMD_BUY  = :P1 '
             +'  and    b.NO_BUY   = :P2 '
             +'  and    b.DS_BUY   = ''9''',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               ConditionToolBarEdit.Text]);
    try
      // 조회 결과 없는 전표이면 전표번호를 지우고 신규로 처리한다
      if Query.Eof then
        ConditionToolBarEdit.Text := EmptyStr
      else
      // 있는 전표이면 정보를 표시한다
      begin
        CompanyCodeEdit.Text      := Query.Fields[0].AsString;
        CompanyNameEdit.Text      := Query.Fields[1].AsString;
        CommentMemo.Text          := Query.Fields[2].AsString;
        StatusEdit.Text           := '반환 수정';
        StatusEdit.Tag            := 1;
      end;
    finally
      FinishQuery;
    end;

    // 상세 내역을 불러온다(있는 전표일 경우)
    if ConditionToolBarEdit.Text <> EmptyStr then
    begin
      OpenQuery('select   b.CD_GOODS, '
               +'         g.NM_GOODS, '
               +'         b.QTY_BUY, '
               +'         b.PR_BUY, '
               +'         b.AMT_BUY '
               +'from     SL_BUY_D as b inner join '
               +'         MS_GOODS as g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS '
               +'where    b.CD_STORE = :P0 '
               +'  and    b.YMD_BUY  = :P1 '
               +'  and    b.NO_BUY   = :P2',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 ConditionToolBarEdit.Text]);
      DM.ReadQuery(Query, GridTableView);
      ButtonToolBarDeleteButton.Enabled := true;
      ConditionToolBarFromDateEdit.Enabled := false;
      ConditionToolBarEdit.Enabled         := false;;
    end;
    // 거래처를 고치지 못하게 막는다
    DisabledCompanyCode;
    if Grid.Visible and Grid.Enabled then
      Grid.SetFocus;
  end;

  // 매입번호를 입력하지 않으면 신규 상태로 처리한다
  if ConditionToolBarEdit.Text = EmptyStr then
  begin
    // 월마감이 된 달에는 매입을 할 수 없다
    if OpenQuery('select   Top 1 YN_CLOSE '
                +'from     SL_STOCK_MONTH '
                +'where    CD_STORE = :P0 '
                +'  and    YM_STOCK = Left(:P1, 6) '
                +'  and    YN_CLOSE = ''Y''',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date)],
                  true) then
    begin
      ErrBox(Format('월 마감이 된 월에는 %s을 할 수 없습니다.', [Caption]));
      Exit;
    end;

    StatusEdit.Text := '신규 반환';
    StatusEdit.Tag  := 0;
    CompanyCodeEdit.TabStop                       := true;
    CompanyCodeEdit.Properties.ReadOnly           := false;
    CompanyCodeEdit.Style.Color                   := clWindow;
    CompanyCodeEdit.Properties.Buttons[0].Enabled := true;
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    GridTableView.DataController.RecordCount      := 0;
    ShowMsg(Format('신규 %s을 합니다.', [Caption]));
  end;
  GridDeleteButton.Enabled := false;

  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function TBuyBottleReturnForm.DoDelete: Boolean;
begin
  Result := false;

  // 전표번호를 잘 입력했는지 확인한다
  if (GetOnlyNumber(ConditionToolBarEdit.Text) <> ConditionToolBarEdit.Text) or
     (StoI(ConditionToolBarEdit.Text) <= 0) then
    Exit;

  // 월 마감 된 날짜의 매입은 삭제 못한다
  if OpenQuery('select   Top 1 YN_CLOSE '
              +'from     SL_STOCK_MONTH '
              +'where    CD_STORE = :P0 '
              +'  and    YM_STOCK = Left(:P1, 6) '
              +'  and    YN_CLOSE = ''Y''',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date)],
                true) then
  begin
    ErrBox(Format('월 마감이 된 월에는 %s 삭제를 할 수 없습니다.', [Caption]));
    FinishQuery;
    Exit;
  end;

  // 삭제한다
  try
    BeginTrans;

    // 매입 디테일 테이블을 삭제한다
    ExecQuery('delete from SL_BUY_D '
             +'where  CD_STORE = :P0 '
             +'  and  YMD_BUY  = :P1 '
             +'  and  NO_BUY   = :P2',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               LPad(ConditionToolBarEdit.Text, 4, '0')],
               false);
    // 매입 마스터 테이블을 삭제한다
    ExecQuery('delete from SL_BUY_H '
             +'where  CD_STORE = :P0 '
             +'  and  YMD_BUY  = :P1 '
             +'  and  NO_BUY   = :P2',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               LPad(ConditionToolBarEdit.Text, 4, '0')],
               false);

    CommitTrans;
    Result := true;

    // 선택된 레코드를 삭제한다
    PlayWave('Deleted');
    ShowMsg(Format('%s 자료를 삭제했습니다.', [Caption]));
    ButtonToolBarNewButton.Click;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TBuyBottleReturnForm.DoSave: Boolean;
var
  vExist: Boolean;
  vIndex: Integer;
  vSeq  : string;
begin
  Result := false;

  // 실사 등록 도중(확정 이전)에는 매입, 발주가 안된다
  OpenQuery('select   YMD_SILSA '
           +'from     MS_STORE '
           +'where    CD_STORE = :P0',
            [StoreCode]);
  try
    if Query.Fields[0].AsString <> EmptyStr then
    begin
      ErrBox(Format('실사 도중에는 %s을 할 수 없습니다.', [Caption]));
      FinishQuery;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  // 월마감이 된 달에는 매입을 할 수 없다
  if OpenQuery('select   Top 1 YN_CLOSE '
              +'from     SL_STOCK_MONTH '
              +'where    CD_STORE = :P0 '
              +'  and    YM_STOCK = Left(:P1, 6) '
              +'  and    YN_CLOSE = ''Y''',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date)],
                true) then
  begin
    ErrBox(Format('월 마감이 된 월에는 %s을 할 수 없습니다.', [Caption]));
    FinishQuery;
    Exit;
  end;

  // 반환일자
  if ConditionToolBarFromDateEdit.Date < Date then
  begin
    if not AskBox(Format('%s가 오늘 날짜보다 이릅니다.'#13'그대로 적용하시겠습니까?', [ConditionToolBarDateLabel.Caption])) then
    begin
      FinishQuery;
      Exit;
    end;
  end
  // 거래처
  else if CompanyNameEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(CompanyCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    FinishQuery;
    Exit;
  end;

  // 입력 중이던 자료 포스트
  GridTableView.DataController.Post;
  // 목록을 뒤져서 반환 수량이 모두 입력 되었는지 확인한다
  if GridTableView.DataController.RecordCount = 0 then
    vExist := false
  else
  begin
    vExist := true;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
         (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewQty.Index], 0) = 0) then
      begin
        vExist := false;
        break;
      end;
  end;
  if not vExist then
  begin
    ErrBox('반환할 목록을 정상적으로 입력하지 않았거나, 반환 수량을 입력하지 않았습니다.');
    FinishQuery;
    Exit;
  end;

  // 공병반환 저장
  BeginTrans;
  try
    // 매입 번호를 불러온다
    if (StatusEdit.Tag = 0) or (ConditionToolBarEdit.Text = EmptyStr) then
    begin
      OpenQuery('select   Max(NO_BUY) as NO_BUY '
               +'from     SL_BUY_H '
               +'where    CD_STORE = :P0 '
               +'  and    YMD_BUY  = :P1',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date)]);
      try
        vSeq := FormatFloat('0000', StoI(Query.Fields[0].AsString)+1);
      finally
        FinishQuery;
      end;
    end
    // 기존 매입자료 수정
    else
    begin
      vSeq := LPad(ConditionToolBarEdit.Text, 4, '0');
      // 기존 자료를 삭제한다
      ExecQuery('delete from SL_BUY_H '
               +'where  CD_STORE = :P0 '
               +'  and  YMD_BUY  = :P1 '
               +'  and  NO_BUY   = :P2',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vSeq],
                 false);
      ExecQuery('delete from SL_BUY_D '
               +'where  CD_STORE = :P0 '
               +'  and  YMD_BUY  = :P1 '
               +'  and  NO_BUY   = :P2',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vSeq],
                 false);
    end;

    // 디테일을 저장한다
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      ExecQuery('insert into SL_BUY_D '
               +'( '
               +'  CD_STORE, YMD_BUY, NO_BUY, SEQ, CD_GOODS, PR_BUY, QTY_BUY, AMT_DUTYFREE '
               +') values ( '
               +'  :P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7 '
               +')',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vSeq,
                 vIndex+1,
                 GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],  // 상품코드
                 GridTableView.DataController.Values[vIndex, GridTableViewPrice.Index],      // 단가
                 GridTableView.DataController.Values[vIndex, GridTableViewQty.Index],        // 수량
                 GridTableView.DataController.Values[vIndex, GridTableViewAmt.Index]],       // 면세금액
                 false);

    // 마스터를 저장한다
    ExecQuery('insert into SL_BUY_H '
             +'( '
             +'  CD_STORE, YMD_BUY, NO_BUY, DS_BUY, CD_TRDPL, CD_WAREHOUSE, AMT_DUTYFREE, AMT_CASH, AMT_TRUST, REMARK, CD_SAWON_CHG, DT_CHANGE, YN_SALE_BUY, DS_PRICE, NO_DEVICE_CHG, DS_TRANS, DS_STATUS, CD_SAWON_INSERT, NO_DEVICE_INSERT '
             +') values ( '
             +'  :P0, :P1, :P2, ''9'', :P3, :P4, :P5, 0, :P6, :P7, :P8, GetDate(), ''N'', ''0'', ''00'', 0, ''B'', :P8, ''00'' '
             +')',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               vSeq,
               CompanyCodeEdit.Text,
               '001',
               GridTableView.DataController.Summary.FooterSummaryValues[1],
               GridTableView.DataController.Summary.FooterSummaryValues[1],
               CommentMemo.Text,
               UserCode],
               false);
    CommitTrans;

    StatusEdit.Text := '반환 완료';
    StatusEdit.Tag  := 1;
    ConditionToolBarEdit.Text         := vSeq;
    ButtonToolBarDeleteButton.Enabled := true;

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
