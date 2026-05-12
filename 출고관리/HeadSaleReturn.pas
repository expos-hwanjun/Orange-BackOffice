unit HeadSaleReturn;

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
  THeadSaleReturnForm = class(TInheritEditForm)
    MainPanel: TPanel;
    CommentLabel: TLabel;
    BuyAmtLabel: TLabel;
    CommentMemo: TcxMemo;
    OrderTotalAmtEdit: TcxCurrencyEdit;
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
    StoreCodeLabel: TcxLabel;
    StoreCodeEdit: TcxButtonEdit;
    StoreNameEdit: TcxTextEdit;
    SearchEdit: TCurvyEdit;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;
    GridTableViewLogisticsCode: TcxGridColumn;
    GridTableViewLogisticsName: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GoodsSearchButton: TAdvGlowButton;
    GridDeleteButton: TAdvGlowButton;
    GoodsBatchButton: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
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
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewOrderPricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewOrderQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    IsCalcAmts       :Boolean;
    procedure DisabledCompanyCode;
    function  SearchStore(aStore: string = ''): string;
    function  SearchGoods(aGoods: string = ''): string;
    procedure CalcAmts(aAllRows: Boolean = false);
  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSave  : Boolean; override;
  end;

var
  HeadSaleReturnForm: THeadSaleReturnForm;

implementation
uses
  Common, Help, ExcelLoad, OrderBatchHelp, Main, DBModule;

{$R *.dfm}

{ TOrderStoreOrderForm }
procedure THeadSaleReturnForm.FormCreate(Sender: TObject);
var vGridSite: TcxGridSiteAccess;
    vScrollBar: TcxControlScrollBarHelper;
    vPos :Integer;
begin
  inherited;
  IsCalcAmts  := true;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;

  vGridSite := TcxGridSiteAccess(GridTableView.Site);
  vScrollBar := TcxControlScrollBarsAccess(vGridSite.MainScrollBars).HScrollBar;
  vPos := vScrollBar.Min;
  GridTableView.Controller.Scroll(sbHorizontal, Vcl.StdCtrls.scTrack, vPos);

end;

procedure THeadSaleReturnForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN :
      begin
        if GridTableView.Focused and (GridTableView.Controller.FocusedColumn = GridTableViewOrderQty) then
        begin
          SearchEdit.SetFocus;
          Key := 0;
          Exit;
        end;
      end;
  end;
  inherited;
end;

procedure THeadSaleReturnForm.GoodsBatchButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  with TOrderBatchHelpForm.Create(Self) do
    try
      OrderLimitCode := '';
      if ShowModal = mrOK then
      begin
        try
          Self.GridTableView.BeginUpdate;
          for vIndex := 0 to AddGridTableView.DataController.RecordCount-1 do
          begin
            // 그리드에 이미 등록되어 있는 상품코드면 무시하고 넘어간다
            if Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index], false, false, true) >= 0 then
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
          Self.GridTableView.EndUpdate;
          Self.Grid.SetFocus;
        end;
        // 각 금액 계산
        CalcAmts(true);
        DisabledCompanyCode;
      end;
    finally
      Free;
      FinishQuery;
    end;
end;

procedure THeadSaleReturnForm.GoodsSearchButtonClick(Sender: TObject);
begin
  inherited;
  if SearchGoods(SearchEdit.Text) <> EmptyStr then
    SearchEdit.Text := ''
  else
    SearchEdit.SetFocus;
end;

procedure THeadSaleReturnForm.GridDeleteButtonClick(Sender: TObject);
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

procedure THeadSaleReturnForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  CalcAmts(True);
  DisabledCompanyCode;
  if not isLoading then
    isChanged := true;
  SearchEdit.SetFocus;

end;

procedure THeadSaleReturnForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
  isChanged := true;
end;

procedure THeadSaleReturnForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  GridDeleteButton.Enabled                     := AFocusedRecord <> nil;
end;

procedure THeadSaleReturnForm.GridTableViewOrderPricePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderPrice.Index] := Nvl(DisplayValue,0.0);

  // 금액 재계산
  CalcAmts(true);
  GridTableView.DataController.Post;

end;

procedure THeadSaleReturnForm.GridTableViewOrderQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderQty.Index] := DisplayValue;
  // 금액 재계산
  CalcAmts(true);
  GridTableView.DataController.Post;
end;

procedure THeadSaleReturnForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;

  StoreCodeEdit.Clear;
  StoreCodeEdit.TextHint := '';
  StoreNameEdit.Clear;
  OrderTotalAmtEdit.Value  := 0;
  GoodsPanel.Enabled       := false;
  MainPanel.Enabled        := true;
  GoodsPanel.Enabled       := true;
  GridDeleteButton.Enabled := false;
end;

procedure THeadSaleReturnForm.CalcAmts(aAllRows: Boolean);
var
  vIndex     : Integer;
  vOrderQty    : Currency;
begin
  if not IsCalcAmts then Exit;
  try
    GridTableView.BeginUpdate;
    OrderTotalAmtEdit.Value := 0;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      vOrderQty := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index], 0.0);
      if vOrderQty = 0 then
      begin
        GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]            := 0;
        GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index]         := 0;
        GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index]         := 0;
        GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index]         := 0;
      end
      else
      begin
        GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewOrderPrice.Index] * vOrderQty;

        // 부가세를 먼저 계산한다
        if GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index] = '1' then
        begin
          GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index]         := Trunc((GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]) / 11);
          GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index]         := GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index];
          GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index]         := 0;
        end
        else
        begin
          GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index]         := 0;
          GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index]         := GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index];
          GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index]         := GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index];
        end;
      end;
      OrderTotalAmtEdit.Value := OrderTotalAmtEdit.Value + GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index];
    end;
  finally
    GridTableView.EndUpdate;
  end;
end;

procedure THeadSaleReturnForm.StoreCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if StoreCodeEdit.Text <> EmptyStr then
    StoreCodeEdit.Text := SearchStore(StoreCodeEdit.Text)
  else
    StoreCodeEdit.Text := SearchStore;

end;

procedure THeadSaleReturnForm.DisabledCompanyCode;
begin

end;

function THeadSaleReturnForm.DoSave: Boolean;
var vExist :Boolean;
    vSeq, vIndex :Integer;
    vNet, vNot, vVat, vSum: Currency;
    vLogisticsCode, vSaleNo, vSQL :String;

begin
  Result := false;
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
    ErrBox('반품 수량을 입력하지 않은 상품이 있습니다.');
    FinishQuery;
    Exit;
  end;

  CalcAmts(True);


    // 매입 저장
  try
    IsCalcAmts := false;
    OpenQuery('select   Max(NO_SALE) as NO_SALE, '
             +'         Now() '
             +'from     OL_SALE_H '
             +'where    CD_HEAD   = :P0 '
             +'  and    YMD_SALE = :P1',
              [HeadStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date)]);
    try
      // 신규매입일때는 매입번호, 입력일시를 알아낸다
      vSaleNo     := FormatFloat('0000', StoI(Query.Fields[0].AsString)+1);
    finally
      FinishQuery;
    end;

    vNet    := 0;
    vNot    := 0;
    vVat    := 0;
    vSum    := 0;
    vSeq    := 0;
    GridTableView.DataController.PostEditingData;
    GridTableViewLogisticsCode.SortOrder := soAscending;
    vLogisticsCode := '';

    //마스터 저장
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if (vLogisticsCode = '') or (vLogisticsCode = GridTableView.DataController.Values[vIndex, GridTableViewLogisticsCode.Index]) then
      begin
        vLogisticsCode := GridTableView.DataController.Values[vIndex, GridTableViewLogisticsCode.Index];
        vNet    := vNet    +(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index],    0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0));
        vNot    := vNot    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index],    0.0);
        vVat    := vVat    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index],    0.0);
        vSum    := vSum    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index],       0.0);

        Inc(vSeq);
        vSQL := vSQL + Format('(''%s'', ''%s'', ''%s'', %s, ''R'',''%s'', ''%s'',''%s'', %s, %s, %s, %s, %s, ''%s''),',
                              [HeadStoreCode,
                               DtoS(ConditionToolBarFromDateEdit.Date),
                               vSaleNo,
                               IntToStr(vSeq),
                               vLogisticsCode,
                               StoreCodeEdit.Text,
                               GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                               FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderPrice.Index], 0.0)),
                               FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],    0.0) * -1),
                               FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index], 0.0)  * -1),
                               FloatToStr((Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index], 0.0)+Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index], 0.0)) * -1),
                               FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],    0.0) * Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index],    0.0) * -1),
                               GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index]])

      end
      else
      begin
        ExecQuery('insert into OL_SALE_H(CD_HEAD, '
                 +'                      YMD_SALE, '
                 +'                      NO_SALE, '
                 +'                      DS_SALE, '
                 +'                      CD_LOGISTICS, '
                 +'                      CD_STORE, '
                 +'                      AMT_DUTY, '
                 +'                      AMT_TAX, '
                 +'                      AMT_DUTYFREE, '
                 +'                      AMT_SALE, '
                 +'                      REMARK, '
                 +'                      CD_SAWON, '
                 +'                      DT_INSERT, '
                 +'                      DT_CHANGE) '
                 +'              Values (:P0, '
                 +'                      :P1, '
                 +'                      :P2, '
                 +'                      ''R'', '
                 +'                      :P3, '
                 +'                      :P4, '
                 +'                      :P5, '
                 +'                      :P6, '
                 +'                      :P7, '
                 +'                      :P5+:P6+:P7, '
                 +'                      :P8, '
                 +'                      :P9, '
                 +'                      Now(), '
                 +'                      Now()) ;',
                  [HeadStoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   vSaleNo,
                   vLogisticsCode,
                   StoreCodeEdit.Text,
                   vNet * -1,
                   vVat * -1,
                   vNot * -1,
                   CommentMemo.Text,
                   UserCode],
                   false);

        vSQL := 'insert into OL_SALE_D(CD_HEAD, YMD_SALE, NO_SALE, SEQ, DS_SALE, CD_LOGISTICS, CD_STORE, CD_GOODS, PR_SALE, QTY_SALE, AMT_TAX, AMT_SALE, AMT_BUY, DS_TAX) '
               +' values '+LeftStr(vSQL, Length(vSQL)-1)+';';

        ExecQuery(vSQL, [], false);
        vSaleNo     := FormatFloat('0000', StoI(vSaleNo)+1);
        vNet    := 0;
        vNot    := 0;
        vVat    := 0;
        vSum    := 0;
        vSQL    := '';
      end;
    end;

    if vSQL <> '' then
    begin
      ExecQuery('insert into OL_SALE_H(CD_HEAD, '
               +'                      YMD_SALE, '
               +'                      NO_SALE, '
               +'                      DS_SALE, '
               +'                      CD_LOGISTICS, '
               +'                      CD_STORE, '
               +'                      AMT_DUTY, '
               +'                      AMT_TAX, '
               +'                      AMT_DUTYFREE, '
               +'                      AMT_SALE, '
               +'                      REMARK, '
               +'                      CD_SAWON, '
               +'                      DT_INSERT, '
               +'                      DT_CHANGE) '
               +'              Values (:P0, '
               +'                      :P1, '
               +'                      :P2, '
               +'                      ''R'', '
               +'                      :P3, '
               +'                      :P4, '
               +'                      :P5, '
               +'                      :P6, '
               +'                      :P7, '
               +'                      :P5+:P6+:P7, '
               +'                      :P8, '
               +'                      :P9, '
               +'                      Now(), '
               +'                      Now()) ;',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vSaleNo,
                 vLogisticsCode,
                 StoreCodeEdit.Text,
                 vNet * -1,
                 vVat * -1,
                 vNot * -1,
                 CommentMemo.Text,
                 UserCode],
                 false);

      vSQL := 'insert into OL_SALE_D(CD_HEAD, YMD_SALE, NO_SALE, SEQ, DS_SALE,CD_LOGISTICS, CD_STORE, CD_GOODS, PR_SALE, QTY_SALE, AMT_TAX, AMT_SALE, AMT_BUY, DS_TAX) '
             +' values '+LeftStr(vSQL, Length(vSQL)-1)+';';
    end;

    if ExecQuery(vSQL, [], true) then
    begin
      isChanged := false;
      ButtonToolBarNewButton.Click;

      Result := true;
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
  IsCalcAmts := true;
end;



procedure THeadSaleReturnForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = StoreCodeEdit) and (StoreCodeEdit.Text <> StoreCodeEdit.TextHint) then
  begin
    StoreNameEdit.Text := EmptyStr;
    GridTableView.DataController.RecordCount := 0;
    GoodsPanel.Enabled         := false;
  end;
end;

procedure THeadSaleReturnForm.EditPropertiesValidate(Sender: TObject;
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
                 +'   and DS_STATUS = ''0'' '
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
  end;
end;

function THeadSaleReturnForm.SearchStore(aStore: string): string;
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
        Result                 := Code;
        StoreCodeEdit.Text     := Code;
        StoreCodeEdit.TextHint := Code;
        StoreNameEdit.Text     := Names[0];
        GoodsPanel.Enabled     := true;
      end;
    finally
      Free;
    end;
end;

procedure THeadSaleReturnForm.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    GoodsSearchButton.Click;
  end;
end;

function THeadSaleReturnForm.SearchGoods(aGoods: string): string;
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
      GridTableViewName2.Caption := '단위';
      GridTableViewName2.Width   := 80;
      GridTableViewName2.Visible := true;
      GridTableViewName3.Caption := '반품단가';
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
                   +'          a.QTY_NEPUM, '
                   +'          a.CD_LOGISTICS, '
                   +'          b.NM_TRDPL as NM_LOGISTICS, '
                   +'          a.PR_BUY '
                   +'  from    MS_GOODS as a inner join '
                   +'          MS_TRD   as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_TRDPL = a.CD_LOGISTICS '
                   +'where     a.CD_HEAD  =:P0 '
                   +'  and     a.CD_STORE =''00000000'' '
                   +'  and     (CD_GOODS like ConCat(:P2,''%'') or NM_GOODS like ConCat(''%'',:P2,''%'') ) '
                   +'  and     a.DS_STATUS   = ''Y'' '
                   +'  and     a.CD_LOGISTICS <> '''' '
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
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewLogisticsCode.Index]     := Names[5];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewLogisticsName.Index]     := Names[6];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderQty.Index]          := 1;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderAmt.Index]          := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderNetAmt.Index]       := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderVatAmt.Index]       := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBuyPrice.Index]          := StrToInt(Names[7]);
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

procedure THeadSaleReturnForm.SetChanged(aChanged: Boolean);
begin
  inherited;
end;

end.
