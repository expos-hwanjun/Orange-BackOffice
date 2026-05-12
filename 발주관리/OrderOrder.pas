unit OrderOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Data.DB, dxmdaset, Vcl.ExtCtrls, cxStyles, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxButtonEdit, cxCurrencyEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  cxMemo, AdvGroupBox, AdvSmoothButton, StrUtils, CurvyControls, Math,
  dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager,
  AdvOfficePagerStylers;

type
  TcxGridDataControllerAccess = class (TcxGridDataController);

type
  TcxGridSiteAccess = class (TcxGridSite);
  TcxControlScrollBarsAccess = class (TcxControlScrollBars);

type
  TOrderOrderForm = class(TInheritEditForm)
    MainPanel: TPanel;
    CommentLabel: TLabel;
    BuyAmtLabel: TLabel;
    CommentMemo: TcxMemo;
    OrderTotalAmtEdit: TcxCurrencyEdit;
    DeliveryRequestDateEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewOrderUnit: TcxGridColumn;
    GridTableViewOrderQty: TcxGridColumn;
    GridTableViewOrderPrice: TcxGridColumn;
    GridTableViewOrderNetAmt: TcxGridColumn;
    GridTableViewOrderNotAmt: TcxGridColumn;
    GridTableViewOrderVatAmt: TcxGridColumn;
    GridTableViewOrderAmt: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridTableViewSeq: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewNepumQty: TcxGridColumn;
    GoodsPanel: TPanel;
    MemoGroupBox: TAdvGroupBox;
    cxLabel3: TcxLabel;
    DeliveryDatetEdit: TcxTextEdit;
    cxLabel4: TcxLabel;
    ConfirmDateEdit: TcxTextEdit;
    ConfirmUserEdit: TcxTextEdit;
    cxLabel5: TcxLabel;
    OrderStatusLabel: TcxLabel;
    OrderTypeLabel: TcxLabel;
    StoreCodeLabel: TcxLabel;
    OrderNoLabel: TcxLabel;
    Label1: TLabel;
    CreditAmtEdit: TcxCurrencyEdit;
    Label2: TLabel;
    RemainAmtEdit: TcxCurrencyEdit;
    StoreCodeEdit: TcxButtonEdit;
    StoreNameEdit: TcxTextEdit;
    SearchEdit: TCurvyEdit;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;
    Label3: TLabel;
    RestCreditAmtEdit: TcxCurrencyEdit;
    GoodsFindButton: TAdvGlowButton;
    GoodsBatchButton: TAdvGlowButton;
    GridDeleteButton: TAdvGlowButton;
    GoodsSearchButton: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure StoreCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsSearchButtonClick(Sender: TObject);
    procedure GridDeleteButtonClick(Sender: TObject);
    procedure GoodsBatchButtonClick(Sender: TObject);
    procedure GoodsFindButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridTableViewOrderQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    IsCalcAmts       :Boolean;
    LinkRowIndex     :Integer;
    OrderLimitCode   :String;
    procedure DisabledCompanyCode;
    function  SearchStore(aStore: string = ''): string;
    function  SearchGoods(aGoods: string = ''): string;
    procedure CalcAmts(aAllRows: Boolean = false);
    procedure SetRemainAmt;
  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSearch: Boolean; override;
    function  DoSave  : Boolean; override;
  end;

var
  OrderOrderForm: TOrderOrderForm;

implementation
uses
  Common, Help, ExcelLoad, OrderBatchHelp, Main, DBModule;

{$R *.dfm}

{ TOrderStoreOrderForm }
procedure TOrderOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if not ButtonToolBarNewButton.Visible then
    SetWorkingTable('D','O', DtoS(ConditionToolBarFromDateEdit.CurrentDate)+OrderNoLabel.Caption);

end;

procedure TOrderOrderForm.FormCreate(Sender: TObject);
var vGridSite: TcxGridSiteAccess;
    vScrollBar: TcxControlScrollBarHelper;
    vPos :Integer;
begin
  inherited;
  if Tag = 0 then
  begin
    StoreCodeEdit.Text := StoreCode;
    StoreNameEdit.Text := StoreName;
    StoreCodeEdit.Enabled := false;
    StoreCodeEdit.Tag     := 99;
    StoreNameEdit.Tag     := 99;
  end;

  IsCalcAmts  := true;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;

  vGridSite := TcxGridSiteAccess(GridTableView.Site);
  vScrollBar := TcxControlScrollBarsAccess(vGridSite.MainScrollBars).HScrollBar;
  vPos := vScrollBar.Min;
  GridTableView.Controller.Scroll(sbHorizontal, Vcl.StdCtrls.scTrack, vPos);

end;

procedure TOrderOrderForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      Ord('B') : if GoodsBatchButton.Enabled then GoodsBatchButton.Click;
      Ord('D') : if GridDeleteButton.Enabled  then GridDeleteButton.Click;
      Ord('F') : if GridDeleteButton.Enabled  then GoodsFindButton.Click;
    end;
  end
  else
    case Key of
      VK_RETURN :
        begin
          if StoreCodeEdit.Focused then
          begin
            if StoreCodeEdit.Text <> EmptyStr then
              StoreCodeEdit.Text := SearchStore(StoreCodeEdit.Text)
            else
              StoreCodeEdit.Text := SearchStore;

            if StoreCodeEdit.Text <> '' then
            begin
              GoodsPanel.Enabled := true;
              SearchEdit.SetFocus;
            end;
            Exit;
          end;
          if GridTableView.Focused and (GridTableView.Controller.FocusedColumn = GridTableViewOrderQty) then
          begin
            SearchEdit.SetFocus;
            Key := 0;
            Exit;
          end;
        end;
      VK_F1 :
        begin
          GoodsSearchButtonClick(nil);
          Key := 0;
          Exit;
        end;
    end;
  inherited;

end;

procedure TOrderOrderForm.FormShow(Sender: TObject);
begin
  inherited;
  isChanged := false;
  //매입정정에서 실행시켰을때
  //##### 이벤트 처리
  if Length(FormParam[0]) = 14 then
  begin
    ConditionToolBarFromDateEdit.Date := StoD(LeftStr(FormParam[0],10));
    OrderNoLabel.Caption              := RightStr(FormParam[0],4);
    ButtonToolBarNewButton.Visible    := false;
    DoSearch;
    FormParam[0] := EmptyStr;
  end
  else
    ButtonToolBarNewButton.Click;
end;

procedure TOrderOrderForm.GoodsBatchButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  with TOrderBatchHelpForm.Create(Self) do
    try
      if Self.Tag = 0 then
        OrderLimitCode := Self.OrderLimitCode
      else
        OrderLimitCode := '';
      if ShowModal = mrOK then
      begin
        try
          Self.GridTableView.DataController.BeginFullUpdate;
          for vIndex := 0 to AddGridTableView.DataController.RecordCount-1 do
          begin
            // 그리드에 이미 등록되어 있는 상품코드면 무시하고 넘어간다
            if Self.GridTableView.DataController.FindRecordIndexByText(0, Self.GridTableViewGoodsCode.Index, AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index], false, false, true) >= 0 then
              Continue;
            // 매입 수량이 없으면 다음으로 넘어간다
            if Nvl(AddGridTableView.DataController.Values[vIndex, AddGridTableViewOrderQty.Index], 0) = 0 then
              Continue;

            try
              Self.GridTableView.DataController.AppendRecord;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index]         := AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsName.Index]         := AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsName.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderUnit.Index]         := AddGridTableView.DataController.Values[vIndex, AddGridTableViewOrderUnit.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewNepumQty.Index]          := AddGridTableView.DataController.Values[vIndex, AddGridTableViewNepumQty.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderPrice.Index]        := AddGridTableView.DataController.Values[vIndex, AddGridTableViewOrderPrice.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderQty.Index]          := AddGridTableView.DataController.Values[vIndex, AddGridTableViewOrderQty.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderAmt.Index]          := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderNetAmt.Index]       := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderNotAmt.Index]       := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderVatAmt.Index]       := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewDsTax.Index]             := AddGridTableView.DataController.Values[vIndex, AddGridTableViewDsTax.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewRowState.Index]          := rsInsert;
              isChanged := true;
            finally
              FinishQuery;
            end;
          end;
        finally
          Self.GridTableView.DataController.EndFullUpdate;
          Self.Grid.SetFocus;
        end;
      end
      else
        Exit;
    finally
      Free;
      FinishQuery;
    end;
  // 각 금액 계산

  CalcAmts(true);
  DisabledCompanyCode;

end;

procedure TOrderOrderForm.GoodsFindButtonClick(Sender: TObject);
var
  vGoodsCode: string;
  vIndex    : Integer;
begin
  inherited;

  if InputBox('아래 목록 중 찾고 싶은 상품코드/이름을 입력하십시오(상품코드:전체, 이름:앞글자 또는 전체).', vGoodsCode) then
  begin
    if (GetOnlyNumber(vGoodsCode) = vGoodsCode) then
      vIndex := GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, vGoodsCode, false, false, true)
    else
      vIndex := GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsName.Index, vGoodsCode, true, true, true);
    if vIndex >= 0 then
    begin
      GridTableView.ViewData.Records[vIndex].Selected := not GridTableView.ViewData.Records[vIndex].Selected and GridTableView.ViewData.Records[vIndex].IsData;
      GridTableView.Controller.FocusedRecordIndex     := vIndex;
      Grid.SetFocus;
    end
    else
      MsgBox('아래 목록에 찾는 상품이 없습니다.');
  end;
end;

procedure TOrderOrderForm.GoodsSearchButtonClick(Sender: TObject);
begin
  inherited;
  if SearchGoods(SearchEdit.Text) <> EmptyStr then
    SearchEdit.Text := ''
  else
    SearchEdit.SetFocus;
end;

procedure TOrderOrderForm.GridDeleteButtonClick(Sender: TObject);
var vRowIndex :Integer;
    vIndex    :Integer;
begin
  inherited;
  if not AskBox('발주상품을 삭제하시겠습니까?') then Exit;

  if GridTableView.Controller.IsNewItemRowFocused then
  begin
    GridTableView.DataController.Cancel;
    isChanged := true;
  end
  else if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.FocusedRecordIndex >= 0) then
  begin
    // 선택한 레코드를 삭제한다
    //신규로 입력한 레코드는 삭제한다
    if GridTableView.DataController.Values[GridTableView.Controller.FocusedRecordIndex, GridTableViewRowState.Index] = rsInsert then
      GridTableView.DataController.DeleteFocused
    else
    begin
      //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
      vRowIndex := GridTableView.Controller.FocusedRecordIndex;
      GridTableView.DataController.Values[GridTableView.Controller.FocusedRecordIndex, GridTableViewRowState.Index] := rsDelete;
      GridTableView.DataController.AppendRecord;
      for vIndex := 0 to GridTableView.ColumnCount-1 do
        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := GridTableView.DataController.Values[vRowIndex, vIndex];
      GridTableView.DataController.DeleteRecord(vRowIndex);
    end;
    CalcAmts(True);
    isChanged := true;
  end;
  DisabledCompanyCode;
  SearchEdit.SetFocus;

end;

procedure TOrderOrderForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  CalcAmts(True);
  DisabledCompanyCode;
  if not isLoading then
    isChanged := true;
  SearchEdit.SetFocus;

end;

procedure TOrderOrderForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
  isChanged := true;
end;

procedure TOrderOrderForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  GridDeleteButton.Enabled                     := AFocusedRecord <> nil;
end;

procedure TOrderOrderForm.GridTableViewOrderQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderQty.Index] := DisplayValue;
  // 금액 재계산
  CalcAmts(true);
  GridTableView.DataController.Post;
end;

procedure TOrderOrderForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if ButtonToolBarNewButton.Visible then
    ButtonToolBarNewButton.Click
  else
    DoSearch;
end;

procedure TOrderOrderForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  ClearEdit;
  //매장발주
  if Tag = 0 then
  begin
    StoreCodeEdit.Text := StoreCode;
    StoreCodeEdit.TextHint := StoreCode;
    StoreNameEdit.Text := StoreName;
    SetRemainAmt;
    OrderTypeLabel.Caption := '매장발주';
    GoodsPanel.Enabled     := true;
    SearchEdit.SetFocus;
  end
  //긴급발주(본사)
  else
  begin
    StoreCodeEdit.Clear;
    StoreNameEdit.Clear;
    CreditAmtEdit.Value     := 0;
    RemainAmtEdit.Value     := 0;
    OrderTotalAmtEdit.Value := 0;
    OrderTypeLabel.Caption  := '긴급발주';
    StoreCodeEdit.TextHint  := '';
    GoodsPanel.Enabled      := false;
  end;
  MainPanel.Enabled  := true;
  CommentMemo.Clear;
  ButtonToolBarNewButton.Enabled := false;
  GridDeleteButton.Enabled       := false;
  ButtonToolBarCancelButton.Enabled := true;
  ConditionToolBarFromDateEdit.Date   := Now();
  DeliveryRequestDateEdit.Date   := Now();
  OrderStatusLabel.Caption       := '발주';
  OrderNoLabel.Clear;

end;

procedure TOrderOrderForm.CalcAmts(aAllRows: Boolean);
var
  vIndex     : Integer;
  vOrderQty    : Currency;
  vApplyAmt  : Currency;
  vReceiptDc : Currency;
begin
  if not IsCalcAmts then Exit;
  try
    GridTableView.BeginUpdate;
    OrderTotalAmtEdit.Value := 0;

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      vOrderQty := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index], 0.0);
      GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]  := RoundNumber(GridTableView.DataController.Values[vIndex, GridTableViewOrderPrice.Index] * vOrderQty);

      // 면세금액
      GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index]         := IfThen(GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index] = '1', 0, Currency(GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]));

      // 부가세를 먼저 계산한다
      if GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index] = '1' then
      begin
        //부가세(매입금액-공병금액 / 11)
        GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index]         := Trunc((GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]) / 11);
        GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index]         := GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index];
      end
      else
      begin
        GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index]         := 0;
        GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index]         := GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index];
      end;
      OrderTotalAmtEdit.Value := OrderTotalAmtEdit.Value + GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index];
    end;
  finally
    GridTableView.EndUpdate;
  end;
end;

procedure TOrderOrderForm.StoreCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if StoreCodeEdit.Text <> EmptyStr then
    StoreCodeEdit.Text := SearchStore(StoreCodeEdit.Text)
  else
    StoreCodeEdit.Text := SearchStore;

  if StoreCodeEdit.Text <> '' then
  begin
    GoodsPanel.Enabled := true;
    SearchEdit.SetFocus;
  end;
end;

procedure TOrderOrderForm.DisabledCompanyCode;
begin
  if not StoreNameEdit.Properties.ReadOnly then
    isChanged := false;

  StoreCodeEdit.Properties.ReadOnly := not StoreCodeEdit.TabStop;
  if StoreCodeEdit.TabStop then
    StoreCodeEdit.Style.Color       := clWindow
  else
    StoreCodeEdit.Style.Color       := clrDisabled;
  StoreCodeEdit.Properties.Buttons[0].Enabled := StoreCodeEdit.TabStop;

end;

function TOrderOrderForm.DoSave: Boolean;
var vExist :Boolean;
    vSeq, vIndex, vCount :Integer;
    vPrice, vNet, vNot, vVat, vSum, vBuyPrice: Currency;
    vOrderNo, vSQL :String;
begin
  if ConditionToolBarFromDateEdit.CurrentDate < Date then
  begin
    if not AskBox(Format('%s가 오늘 날짜보다 이릅니다.'#13'그대로 적용하시겠습니까?', [ConditionToolBarDateLabel.Caption])) then
    begin
      FinishQuery;
      Exit;
    end;
  end
  // 거래처
  else if StoreCodeEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(StoreCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and StoreCodeEdit.Enabled then
      StoreCodeEdit.SetFocus;
    FinishQuery;
    Exit;
  end;

  if DeliveryRequestDateEdit.CurrentDate < Date then
  begin
    MsgBox('출고요청일이 오늘보다 이전 일수 없습니다');
    if DeliveryRequestDateEdit.Enabled then
      DeliveryRequestDateEdit.SetFocus;
    Exit;
  end;

  // 입력 중이던 자료 포스트
  GridTableView.DataController.Post;
  // 목록을 뒤져서 매입 수량이 모두 입력 되었는지 확인한다
  if GridTableView.DataController.RecordCount = 0 then
    vExist := false
  else
  begin
    vExist := true;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],    0.0)        = 0) then
      begin
        vExist := false;
        break;
      end;
  end;
  if not vExist then
  begin
    ErrBox('발주 수량을 입력하지 않은 레코드가 있습니다.');
    FinishQuery;
    Exit;
  end;

  CalcAmts(True);

  SetRemainAmt;
  if RestCreditAmtEdit.Value < OrderTotalAmtEdit.Value then
  begin
    if Tag = 0 then
    begin
      MsgBox('여신한도를 초과합니다');
      Exit;
    end;

    if (Tag = 1) and not AskBox('여신한도를 초과합니다'#13'저장하시겠습니까?') then Exit;
  end;
  


    // 매입 저장
  try
    vSeq    := 0;
    IsCalcAmts := false;
    OpenQuery('select   Max(NO_ORDER) as NO_ORDER, '
             +'         Now() '
             +'from     OL_ORDER_H '
             +'where    CD_HEAD   = :P0 '
             +'  and    YMD_ORDER = :P1',
              [HeadStoreCode,
               DtoS(ConditionToolBarFromDateEdit.CurrentDate)]);
    try
      // 신규매입일때는 매입번호, 입력일시를 알아낸다
      if (OrderNoLabel.Caption = EmptyStr) then
        vOrderNo     := FormatFloat('0000', StoI(Query.Fields[0].AsString)+1);
    finally
      FinishQuery;
    end;

    if (OrderNoLabel.Caption <> EmptyStr) then
    begin
      vOrderNo := LPad(OrderNoLabel.Caption, 4, '0');
      OpenQuery('select   Max(SEQ) as SEQ '
               +'  from   OL_ORDER_D '
               +' where   CD_HEAD    = :P0 '
               +'   and   YMD_ORDER  = :P1 '
               +'   and   NO_ORDER   = :P2 ',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 vOrderNo]);
      try
        // 신규매입일때는 매입번호, 입력일시를 알아낸다
        if not Query.Eof then
          vSeq     := Query.Fields[0].AsInteger
        else
          vSeq       := 0;
      finally
        FinishQuery;
      end;
    end;


    // 디테일을 저장한다
    vNet    := 0;
    vNot    := 0;
    vVat    := 0;
    vSum    := 0;
    vCount  := 0;
    GridTableView.DataController.PostEditingData;

    //매입마스터 저장
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then
      begin
        vNet    := vNet    +(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index],    0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0));
        vNot    := vNot    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index],    0.0);
        vVat    := vVat    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index],    0.0);
        vSum    := vSum    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index],       0.0);
        Inc(vCount);
        Continue;
      end;

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then Continue;

      vNet    := vNet    +(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index],    0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0));
      vNot    := vNot    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index],    0.0);
      vVat    := vVat    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index],    0.0);
      vSum    := vSum    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index],       0.0);
      Inc(vCount);
    end;

    //발주상품이 없으면 발주서를 삭제한다
    if (vCount = 0) and (OrderNoLabel.Caption <> EmptyStr) then
    begin
      if not AskBox('발주서를 삭제하시겠습니까?') then Exit;

      ExecQuery('delete from OL_ORDER_D '
               +' where CD_HEAD   =:P0 '
               +'   and YMD_ORDER =:P1 '
               +'   and NO_ORDER  =:P2;',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 OrderNoLabel.Caption],
                 false);

      // 매입 마스터 테이블을 삭제한다
      ExecQuery('delete from OL_ORDER_H '
               +' where CD_HEAD    = :P0 '
               +'   and YMD_ORDER  = :P1 '
               +'   and NO_ORDER   = :P2;',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 OrderNoLabel.Caption],
                 true);
    end
    else
    begin
      // 마스터를 저장한다
      ExecQuery('insert into OL_ORDER_H(CD_HEAD, '
               +'                       YMD_ORDER, '
               +'                       NO_ORDER, '
               +'                       DS_ORDER, '
               +'                       CD_STORE, '
               +'                       YMD_REQUEST, '
               +'                       AMT_DUTY, '
               +'                       AMT_TAX, '
               +'                       AMT_DUTYFREE, '
               +'                       AMT_ORDER, '
               +'                       ORDER_REMARK, '
               +'                       DS_STATUS, '
               +'                       CD_SAWON_INSERT, '
               +'                       AMT_LOAN_LIMIT, '
               +'                       DT_INSERT, '
               +'                       DT_CHANGE) '
               +'              Values (:P0, '
               +'                      :P1, '
               +'                      :P2, '
               +'                      :P3, '
               +'                      :P4, '
               +'                      :P5, '
               +'                      :P6, '
               +'                      :P7, '
               +'                      :P8, '
               +'                      :P6+:P7+:P8, '
               +'                      :P9, '
               +'                      :P10, '
               +'                      :P11, '
               +'                      :P12, '
               +'                      Now(), '
               +'                      Now()) '
               +'ON DUPLICATE KEY UPDATE YMD_REQUEST    =:P5, '
               +'                        AMT_DUTY       =:P6, '
               +'                        AMT_TAX        =:P7, '
               +'                        AMT_DUTYFREE   =:P8, '
               +'                        AMT_ORDER      =:P6+:P7+:P8, '
               +'                        ORDER_REMARK   =:P9, '
               +'                        CD_SAWON_CHG   =:P11, '
               +'                        DT_CHANGE      =Now();',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 vOrderNo,
                 Ifthen(Tag=0,'S','H'),
                 StoreCodeEdit.Text,
                 DtoS(DeliveryRequestDateEdit.CurrentDate),
                 vNet,
                 vVat,
                 vNot,
                 CommentMemo.Text,
                 Ifthen(Tag=0,'O','C'),
                 UserCode,
                 RestCreditAmtEdit.Value],
                 false);

      vSQL := '';
      for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      begin
        vBuyPrice := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderPrice.Index], 0.0);

        if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

        if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
        begin
          ExecQuery('delete from OL_ORDER_D '
                   +' where CD_HEAD    = :P0 '
                   +'   and YMD_ORDER  = :P1 '
                   +'   and NO_ORDER   = :P2 '
                   +'   and SEQ        = :P3;',
                  [HeadStoreCode,
                   DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                   vOrderNo,
                   GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index]],
                   false);
        end
        else
        begin
          if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then
          begin
            Inc(vSeq);
            vSQL := vSQL + Format('(''%s'', ''%s'', ''%s'', %s,''%s'',''%s'', %s, %s, %s, %s, %s, %s,''%s'',%s, ''%s'',''%s''),',
                                  [HeadStoreCode,
                                   DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                                   vOrderNo,
                                   IntToStr(vSeq),
                                   StoreCodeEdit.Text,
                                   GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                                   FloatToStr(vBuyPrice),
                                   FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],    0.0)),
                                   FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index], 0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0)),
                                   FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index], 0.0)),
                                   FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0)),
                                   FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index], 0.0)+Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index], 0.0)),
                                   GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index],
                                   Ifthen(Tag=0,'null',FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],    0.0))),
                                   UserCode,
                                   GetIPAddress])
          end
          else
            ExecQuery('update OL_ORDER_D '
                     +'   set CD_GOODS      =:P4, '
                     +'       PR_ORDER      =:P5, '
                     +'       QTY_ORDER     =:P6, '
                     +'       AMT_DUTY      =:P7, '
                     +'       AMT_TAX       =:P8, '
                     +'       AMT_DUTYFREE  =:P9,  '
                     +'       AMT_ORDER     =:P10, '
                     +Ifthen(Tag=0,'QTY_CONFIRM=null, ','QTY_CONFIRM =:P6, ')
                     +'       CD_SAWON_CHG  =:P11, '
                     +'       UPDATE_IP     =:P12 '
                     +' where CD_HEAD    =:P0 '
                     +'   and YMD_ORDER  =:P1 '
                     +'   and NO_ORDER   =:P2 '
                     +'   and SEQ        =:P3; ',
                      [HeadStoreCode,
                       DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                       vOrderNo,
                       Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert, vSeq, NVL(GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index],0)),
                       GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                       vBuyPrice,
                       Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],    0.0),
                       Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index], 0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0),
                       Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index], 0.0),
                       Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0),
                       Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index], 0.0)+Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index], 0.0),
                       UserCode,
                       GetIPAddress],
                       false);
        end;
      end;

      if vSQL <> '' then
      begin
        vSQL := 'insert into OL_ORDER_D(CD_HEAD, YMD_ORDER, NO_ORDER, SEQ, CD_STORE, CD_GOODS, PR_ORDER, QTY_ORDER, AMT_DUTY, AMT_TAX, AMT_DUTYFREE, AMT_ORDER, DS_TAX, QTY_CONFIRM, CD_SAWON_CHG, UPDATE_IP) '
               +' values '+LeftStr(vSQL, Length(vSQL)-1)+';';

        ExecQuery(vSQL, [], false);
      end;
      ExecQuery(TempSQL, [], true);
      OrderNoLabel.Caption := vOrderNo;
    end;

    SetWorkingTable('D','O', DtoS(ConditionToolBarFromDateEdit.CurrentDate)+OrderNoLabel.Caption);
    isChanged := false;
    // 매입정정에서 넘어왔을 때는 폼을 닫는다
    if not ButtonToolBarNewButton.Visible then
    begin
      Close;
      if Tag = 0 then
      begin
        FormParam[0] := 'OrderOrder';
        ExtremeMainForm.RunProgram('OrderModify');
      end
      else
      begin
        FormParam[0] := 'HeadOrder';
        ExtremeMainForm.RunProgram('HeadOrderModify');
      end;
    end
    else
      ButtonToolBarNewButton.Click;

    Result := true;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
  IsCalcAmts := true;
end;

function TOrderOrderForm.DoSearch: Boolean;
var vIndex :Integer;
begin
  isLoading := true;
  ClearEdit;

  OpenQuery('select b.CD_STORE, '
           +'       b.NM_STORE, '
           +'       case a.DS_ORDER when ''S'' then ''매장발주'' when ''H'' then ''긴급발주'' end as DS_ORDER, '
           +'       case a.DS_STATUS when ''O'' then ''발주'' when ''C'' then ''확정'' when ''S'' then ''출고'' end as DS_STATUS, '                                            //0
           +'       StoD(a.YMD_REQUEST) as YMD_REQUEST, '
           +'       a.ORDER_REMARK, '
           +'       StoD(YMD_DELIVERY) as YMD_DELIVERY, '
           +'       a.AMT_ORDER, '
           +'       a.CD_SAWON_CONFIRM, '
           +'       case when a.DS_STATUS = ''C'' then Date_Format(a.DT_CONFIRM, ''%Y-%m-%d %H:%i'') else '''' end as DT_CONFIRM '
           +'  from OL_ORDER_H as a inner join '
           +'       MS_STORE   as b on b.CD_HEAD  = a.CD_HEAD '
           +'                      and b.CD_STORE = a.CD_STORE '
           +' where a.CD_HEAD    = :P0 '
           +'   and a.YMD_ORDER  = :P1 '
           +'   and a.NO_ORDER   = :P2 ',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.CurrentDate),
             OrderNoLabel.Caption]);
  try
    // 조회 결과 없는 매입 전표이면 전표번호를 지우고 신규로 처리한다
    if Query.Eof then
    begin
      OrderNoLabel.Caption := EmptyStr;
      ShowMsg('발주 전표가 없습니다.', true);
    end
    else
    // 있는 매입 전표이면 정보를 표시한다
    begin
      IsCalcAmts := false;
      StoreCodeEdit.Enabled        := false;
      StoreCodeEdit.Text           := Query.FieldByName('CD_STORE').AsString;
      StoreNameEdit.Text           := Query.FieldByName('NM_STORE').AsString;
      OrderStatusLabel.Caption     := Query.FieldByName('DS_STATUS').AsString;
      OrderTypeLabel.Caption       := Query.FieldByName('DS_ORDER').AsString;
      DeliveryRequestDateEdit.Text := Query.FieldByName('YMD_REQUEST').AsString;
      CommentMemo.Text             := Query.FieldByName('ORDER_REMARK').AsString;
      OrderTotalAmtEdit.Value      := Query.FieldByName('AMT_ORDER').AsCurrency;
      DeliveryDatetEdit.Text       := Query.FieldByName('YMD_DELIVERY').AsString;
      ConfirmDateEdit.Text         := Query.FieldByName('DT_CONFIRM').AsString;
      ConfirmUserEdit.Text         := Query.FieldByName('CD_SAWON_CONFIRM').AsString;
      GoodsPanel.Enabled := True;
      IsCalcAmts        := true;
    end;
  finally
    FinishQuery;
  end;

  SetRemainAmt;

  OpenQuery('select   b.SEQ, '
           +'         b.CD_GOODS, '
           +'         g.NM_GOODS, '
           +'         g.NM_UNIT, '
           +'         g.QTY_NEPUM, '
           +'         b.PR_ORDER, '
           +'         b.QTY_ORDER, '
           +'         b.DS_TAX, '
           +'         b.AMT_DUTY + b.AMT_DUTYFREE as AMT_DUTY, '
           +'         b.AMT_TAX, '
           +'         b.AMT_DUTYFREE, '
           +'         b.AMT_ORDER, '
           +'         ''rsNormal'' as ROW_STATE '
           +'  from   OL_ORDER_D as b inner join '
           +'         MS_GOODS   as g on b.CD_HEAD  = g.CD_HEAD '
           +'                        and g.CD_STORE = ''00000000'' '
           +'                        and b.CD_GOODS = g.CD_GOODS '
           +' where   b.CD_HEAD    = :P0 '
           +'   and   b.YMD_ORDER  = :P1 '
           +'   and   b.NO_ORDER   = :P2 '
           +' order by b.SEQ',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.CurrentDate),
             OrderNoLabel.Caption]);
  DM.ReadQuery(Query, GridTableView);

  DisabledCompanyCode;

  isChanged            := false;
  ButtonToolBarCancelButton.Enabled := true;

  if Grid.Visible and GoodsPanel.Enabled then
    Grid.SetFocus;

  Result := true;
  isLoading := false;
end;

procedure TOrderOrderForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = StoreCodeEdit) and (StoreCodeEdit.Text <> StoreCodeEdit.TextHint) then
  begin
    StoreNameEdit.Text := EmptyStr;
    GridTableView.DataController.RecordCount := 0;
    GoodsPanel.Enabled         := false;
  end;
end;

procedure TOrderOrderForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vCode, vName  : string;
begin
  inherited;
  if Sender = StoreCodeEdit then
  begin
    if DisplayValue <> EmptyStr then
      try
        OpenQuery('select CD_STORE, '
                 +'       NM_STORE '
                 +'  from MS_STORE  '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE <> :P1 '
                 +'   and (CD_STORE =:P2 or NM_STORE like ConCat(''%'',:P2,''%'')) '
                 +'   and YN_USE = ''Y'' '
                 +' order by CD_STORE',
                 [HeadStoreCode,
                  StandardStore,
                  DisplayValue]);
        if not Query.Eof then
        begin
          // 일단 첫번째 값을 받아 놓는다
          vCode           := Query.Fields[0].AsString;
          vName           := Query.Fields[1].AsString;
          // 쿼리 다음 줄로 이동해 본다
          Query.Next;
          // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
          if Query.Eof then
          begin
            StoreCodeEdit.Text       := vCode;
            GoodsPanel.Enabled       := true;
            DisplayValue             := vCode;
            StoreNameEdit.Text       := vName;
          end
          // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
          else
          begin
            FinishQuery;
            DisplayValue := SearchStore(DisplayValue);
          end;
          GoodsPanel.Enabled := true;
          SearchEdit.SetFocus;
        end
        else
        begin
          ErrorText := Replace(StoreCodeLabel.Caption)+msgMustInput;
          Error     := true;
          Exit;
        end;
      finally
        FinishQuery;
      end;
    SetRemainAmt;
  end;
end;

function TOrderOrderForm.SearchStore(aStore: string): string;
begin
  Result := EmptyStr;

  // 거래처 조회 폼을 보여준다
  with THelpForm.Create(Self) do
    try
      Caption := '매장 조회';
      GridTableViewCode.Caption  := '매장 코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '매장 이름';
      GridTableViewName1.Width   := 340;

      SearchText := aStore;
      SQLText    := 'select    CD_STORE, '
                   +'          NM_STORE '
                   +' from     MS_STORE '
                   +' where    CD_HEAD   =:P0 '
                   +'   and    CD_STORE  <> ''00000000'' '
                   +'   and   (CD_STORE  =:P2 or NM_STORE like ConCat(''%'',:P2,''%'')) '
                   +'   and    YN_USE = ''Y'' '
                   +' order by CD_STORE ';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result                   := Code;
        StoreCodeEdit.Text     := Code;
        StoreCodeEdit.TextHint := Code;
        StoreNameEdit.Text     := Names[0];
        SetRemainAmt;
        GoodsPanel.Enabled     := true;
      end;
    finally
      Free;
    end;
end;

procedure TOrderOrderForm.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    GoodsSearchButton.Click;
  end;
end;

function TOrderOrderForm.SearchGoods(aGoods: string): string;
var vIndex :Integer;
begin
  Result := EmptyStr;

  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '상품 조회';
      GridTableViewCode.Caption  := Self.GridTableViewGoodsCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := '상품명';
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := '발주단위';
      GridTableViewName2.Width   := 80;
      GridTableViewName2.Visible := true;
      GridTableViewName3.Caption := '발주단가';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;

      SearchText := aGoods;
      SQLText    := 'select    a.CD_GOODS, '                                //0
                   +'          a.NM_GOODS, '
                   +'          a.NM_UNIT, '
                   +'          a.PR_SALE, '                                             //1
                   +'          a.DS_TAX, '
                   +'          a.QTY_NEPUM '
                   +' from     MS_GOODS as a  '
                   +Ifthen(Self.Tag=0,'left outer join '
                   +'                       MS_CODE  as b on b.CD_HEAD  = a.CD_HEAD '
                   +'                       and b.CD_STORE = a.CD_STORE '
                   +'                       and b.CD_KIND  = ''06'' '
                   +Format('                and b.CD_CODE  = ''%s'' ',[OrderLimitCode])
                   +'                       and Substring(b.NM_CODE2, DAYOFWEEK(Now()), 1) = ''1'' '
                   +'                       and b.NM_CODE3 <= Date_Format(Now(), ''%H:%i'') '
                   +'                       and b.NM_CODE4 >= Date_Format(Now(), ''%H:%i'') ','')
                   +'where     a.CD_HEAD  =:P0 '
                   +'  and     a.CD_STORE =''00000000'' '
                   +'  and     (CD_GOODS like ConCat(:P2,''%'') or NM_GOODS like ConCat(''%'',:P2,''%'') ) '
                   +'  and     a.CD_LOGISTICS <> '''' '
                   +'  and     a.DS_STATUS   = ''Y'' '
                   +'order by  a.CD_GOODS';

      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Result := Code;

        vIndex := Self.GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Result, false, false, true)];
        if (vIndex >= 0) then
        begin
          Self.GridTableView.Controller.FocusedRecordIndex := vIndex;
          MsgBox('이미 등록된 상품입니다');
          Result := '';
          Exit;
        end;
        Self.GridTableView.DataController.AppendRecord;
        Self.GridTableView.Controller.FocusedRecordIndex := Self.GridTableView.DataController.RecordCount-1;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsCode.Index]         := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsName.Index]         := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderUnit.Index]         := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewNepumQty.Index]          := StrToInt(Names[4]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderPrice.Index]        := StoF(Names[2]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewDsTax.Index]             := Names[3];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderQty.Index]          := 1;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderAmt.Index]          := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderNetAmt.Index]       := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderVatAmt.Index]       := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewRowState.Index]          := rsInsert;
        Self.GridTableView.Controller.FocusedColumn :=  Self.GridTableViewOrderQty;
      end
      else
         Self.GridTableView.Controller.FocusedColumn := Self.GridTableViewGoodsCode;
      CalcAmts(True);
      Self.Grid.SetFocus;
      Self.Grid.FocusedView := Self.GridTableView;
    finally
      Free;
    end;
end;

procedure TOrderOrderForm.SetChanged(aChanged: Boolean);
begin
  inherited;

end;

procedure TOrderOrderForm.SetRemainAmt;
begin
  OpenQuery('select a.CD_ORDER_LIMIT, '
           +'       a.AMT_ORDER_LIMIT, '
           +'       b.AMT_REMAIN, '
           +'       b.AMT_ORDER '
           +'  from MS_STORE_ETC a, '
           +'      (select  Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_SALE,0) - Ifnull(AMT_PAY,0)) as AMT_REMAIN, '
           +'               Sum(Ifnull(AMT_ORDER,0)) as AMT_ORDER '
           +'         from  (select   AMT_BASE, '
           +'                         0 as AMT_ORDER, '
           +'                         0 as AMT_SALE, '
           +'                         0 as AMT_PAY '
           +'                  from   SL_BOOKS_MONTH '
           +'                 where   CD_HEAD  = :P0 '
           +'                   and   CD_STORE = :P1 '
           +'                   and   CD_CLOSE = :P3 '
           +'                   and   CD_CODE  = :P2 '
           +'                   and   YM_CLOSE = Left(:P4,6) '
           +'                union all '
           +'                select   0 , '
           +'                         Sum((Ifnull(b.QTY_CONFIRM, b.QTY_ORDER) - Ifnull(b.QTY_SALE,0)) * b.PR_ORDER) as AMT_ORDER, '  //발주-출고 수량을 여신에 포함
           +'                         0, '
           +'                         0 '
           +'                  from   OL_ORDER_H a inner join '
           +'                         OL_ORDER_D b on b.CD_HEAD   = a.CD_HEAD '
           +'                                     and b.CD_STORE  = a.CD_STORE '
           +'                                     and b.YMD_ORDER = a.YMD_ORDER '
           +'                                     and b.NO_ORDER  = a.NO_ORDER '
           +'                 where   a.CD_HEAD   =:P0 '
           +'                   and   a.CD_STORE  =:P3 '
           +'                   and   a.DS_STATUS <> ''D'' '
           +'                   and   ConCat(a.YMD_ORDER,a.NO_ORDER) <> :P5 '
           +'                union all '
           +'                select   0 as AMT_BASE, '
           +'                         0, '
           +'                         Sum(AMT_SALE) as AMT_SALE, '
           +'                         0 as AMT_PAY '
           +'                  from   OL_SALE_H '
           +'                 where   CD_HEAD   =:P0 '
           +'                   and   CD_STORE  =:P3 '
           +'                   and   YMD_SALE >= ConCat(Left(:P4,6),''01'') '
           +'                union all '
           +'                select   0 as AMT_BASE, '
           +'                         0 as AMT_ORDER, '
           +'                         0 as AMT_RETURN, '
           +'                         Sum(AMT_PAYIN+AMT_DC) as AMT_PAY '
           +'                  from   SL_ACCT '
           +'                 where   CD_HEAD  =:P0 '
           +'                   and   CD_STORE =:P1 '
           +'                   and   CD_MEMBER =:P3 '
           +'                   and   CD_ACCT ='''+varGetCode+''''
           +'                   and   YMD_OCCUR >= ConCat(Left(:P4,6),''01'')  '
           +'                ) as t '
           +'        ) as b '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P3 ',
           [HeadStoreCode,
            StandardStore,
            varOrderClose,
            StoreCodeEdit.Text,
            DtoS(ConditionToolBarFromDateEdit.CurrentDate),
            DtoS(ConditionToolBarFromDateEdit.CurrentDate)+LPad(OrderNoLabel.Caption, 4, '0')]);
  if not Query.Eof then
  begin
    OrderLimitCode         := Query.Fields[0].AsString;
    CreditAmtEdit.Value    := Query.Fields[1].AsCurrency;
    if CreditAmtEdit.Value > 0 then
      RestCreditAmtEdit.Value:= Query.Fields[1].AsCurrency - Query.Fields[2].AsCurrency - Query.Fields[3].AsCurrency;
    RemainAmtEdit.Value := Query.Fields[2].AsCurrency;
  end
  else
  begin
    OrderLimitCode      := '';
    CreditAmtEdit.Value := 0;
    RemainAmtEdit.Value := 0;
    RestCreditAmtEdit.Value := 0;
  end;
  Query.Close;
end;

end.
