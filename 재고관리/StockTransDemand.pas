// 재고 이관 신청

unit StockTransDemand;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxControls, cxLookAndFeels, StrUtils,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, AdvToolBar, Math,
  AdvToolBarStylers, ExtCtrls, DBAccess, Uni, DB, MemDS, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxButtonEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, cxMemo, tmsXLSAdapter;

type
  TStockTransDemandForm = class(TInheritEditForm)
    MainPanel: TPanel;
    TransAmtLabel: TLabel;
    StatusLabel: TLabel;
    GridDeleteButton: TButton;
    ExcelLoadButton: TButton;
    GoodsBatchButton: TButton;
    TransAmtEdit: TcxCurrencyEdit;
    StatusEdit: TcxTextEdit;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewStockSafetyQty: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewTransQty: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewTransAmt: TcxGridColumn;
    GridLevel: TcxGridLevel;
    ConditionToolBarTransNoEdit: TcxButtonEdit;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;
    CommentLabel: TLabel;
    CommentMemo: TcxMemo;
    ConditionToolBarStoreLabel: TcxLabel;
    ConditionToolBarStoreComboBox: TcxComboBox;
    GridTableViewTransNetAmt: TcxGridColumn;
    GridTableViewTransDutyFreeAmt: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    GridTableViewSeq: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarTransNoEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarTransNoEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure ExcelLoadButtonClick(Sender: TObject);
    procedure GoodsBatchButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewTransQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
    procedure GridDeleteButtonClick(Sender: TObject);

  private
    BackupData: array of Variant;

    function  SearchGoods(aGoods: string = ''): string;

  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSearch: Boolean; override;
    function  DoSave  : Boolean; override;
  end;

var
  StockTransDemandForm: TStockTransDemandForm;



implementation

uses
  Common, DBModule, Help, ExcelLoad, GoodsBatchHelp;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockTransDemandForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;

  // 이관 매장(현재 매장이 아닌 매장) 목록을 불러온다
  OpenQuery('select   CD_STORE, '
           +'         NM_STORE '
           +'from     MS_STORE '
           +'where    CD_STORE not in (''0000'', :P0) '
           +'  and    DS_STATUS = ''0'' '
           +'order by CD_STORE',
            [StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarStoreComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarStoreComboBox.ItemIndex := -1;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TStockTransDemandForm.FormShow(Sender: TObject);
begin
  inherited;

  // 이관 신청 조회에서 실행시켰을때
  if (Length(FormParam[0]) = 4) and (Length(FormParam[1]) = 8) and (Length(FormParam[2]) = 4) then
  begin
    ConditionToolBarStoreComboBox.ItemIndex := GetStrPointerIndex(ConditionToolBarStoreComboBox, FormParam[0]);

    if ConditionToolBarStoreComboBox.ItemIndex >= 0 then
    begin
      ConditionToolBarFromDateEdit.Date    := StoD(FormParam[1]);
      ConditionToolBarTransNoEdit.Text     := FormParam[2];
      ButtonToolBarSearchButton.Click;
      ButtonToolBarSearchButton.Visible    := false;
      ButtonToolBarNewButton.Visible       := false;
      ConditionToolBarTransNoEdit.Enabled  := false;
      ConditionToolBarFromDateEdit.Enabled := false;
    end;
    FormParam[0] := EmptyStr;
    FormParam[1] := EmptyStr;
    FormParam[2] := EmptyStr;
  end
  else
    ButtonToolBarNewButton.Click;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TStockTransDemandForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F3   : ButtonToolBarNewButton.Click;
    VK_F7   : ButtonToolBarCancelButton.Click;

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

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 이관번호에서 키보드를 누를 때
procedure TStockTransDemandForm.ConditionToolBarTransNoEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 이관번호 조회버튼
procedure TStockTransDemandForm.ConditionToolBarTransNoEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  with THelpForm.Create(Self) do
    try
      Caption := '재고 이관 신청 조회';
      GridTableViewCode.Caption   := '이관일자';
      GridTableViewCode.Width     := 100;
      GridTableViewName1.Caption  := '번호';
      GridTableViewName1.Width    := 60;
      GridTableViewName1.PropertiesClassName       := 'TcxLabelProperties';
      GridTableViewName1.Properties.Alignment.Horz := taCenter;
      GridTableViewName2.Caption  := '이관매장';
      GridTableViewName2.Width    := 250;
      GridTableViewName2.Visible  := true;
      GridTableViewName3.Caption  := '이관금액';
      GridTableViewName3.Width    := 80;
      GridTableViewName3.Visible  := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;

      SearchText := '';
      SQLText    := 'select   dbo.StoD(t.YMD_TRANS) as YMD_TRANS, '
                   +'         t.NO_TRANS, '
                   +'         s.NM_STORE, '
                   +'         t.AMT_DEMAND, '
                   +'         t.CD_STORE '
                   +'from     SL_TRANS_H as t inner join '
                   +'         MS_STORE   as s on t.CD_STORE = s.CD_STORE '
                   +'where    t.CD_STORE_RECEIVE = :P0 '
                   +'  and    t.YMD_TRANS = '''+DtoS(ConditionToolBarFromDateEdit.Date)+''' '
                   +'  and    t.DS_STATUS = '''+TransDemand+''' '
                   +'  and    t.NO_SEND_LINK is null '
                   +'order by t.NO_TRANS';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        ConditionToolBarTransNoEdit.Text := Names[0];
        ConditionToolBarStoreComboBox.ItemIndex := GetStrPointerIndex(ConditionToolBarStoreComboBox, Names[3]);
        DoSearch;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TStockTransDemandForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  if isChanged then
  begin
    PlayWave('SaveChanged');
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  inherited;
end;
//------------------------------------------------------------------------------
// 신규 버튼
procedure TStockTransDemandForm.ButtonToolBarNewButtonClick(Sender: TObject);
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

  ClearEdit;
  StatusEdit.Text := '신규 신청';
  StatusEdit.Tag  := 0;
  ConditionToolBarTransNoEdit.Clear;
  GridTableView.DataController.RecordCount := 0;

  ShowMsg('신규 신청을 합니다.');

  ConditionToolBarStoreComboBox.Enabled := true;
  ConditionToolBarStoreComboBox.SetFocus;
  MainPanel.Enabled := true;
  Grid.Enabled      := true;
  isChanged         := false;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure TStockTransDemandForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  if not ButtonToolBarCancelButton.Visible or not ButtonToolBarCancelButton.Enabled then
    Exit;

  inherited;

  if not isChanged or AskBox('현재 작업을 모두 취소하시겠습니까?') then
  begin
    isChanged := false;
    GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
    GridTableView.DataController.Cancel;
    GridTableView.Controller.NewItemRecordFocused := false;
    ConditionToolBarFromDateEdit.Date             := Now;
    ButtonToolBarNewButton.Click;
  end;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 엑셀 불러오기 버튼
procedure TStockTransDemandForm.ExcelLoadButtonClick(Sender: TObject);
var
  vXLSAdapter: TXLSAdapter;
  vXLSFile   : TXLSFile;
  vIndex     : Integer;
begin
  inherited;

  if ConditionToolBarStoreComboBox.ItemIndex < 0 then
  begin
    ErrBox(ConditionToolBarStoreLabel.Caption+msgMustInput);
    if ConditionToolBarStoreComboBox.Enabled then
      ConditionToolBarStoreComboBox.SetFocus;
    Exit;
  end
  // 기존 등록된 자료가 있을 경우 확인
  else if (GridTableView.DataController.RecordCount > 0) and
          (not AskBox(Format('이미 등록된 이관 상품이 있습니다.'#13'무시하고 %s를 하시겠습니까?', [ExcelLoadButton.Caption]))) then
    Exit;

  // 엑셀 칼럼지정 폼을 띄운다
  with TExcelLoadForm.Create(self) do
    try
      if SetColumn([GridTableViewGoodsCode.Caption, GridTableViewTransQty.Caption], [true, true]) then
        if ShowModal = mrOK then
        begin
          // 엑셀 파일을 읽어 그리드에 넣는다
          vXLSAdapter := TXLSAdapter.Create(self);
          vXLSFile    := TXLSFile.Create(vXLSAdapter);
          vXLSFile.Connect;
          vXLSFile.OpenFile(ExcelFileEdit.Text);
          try
            isLoading := true;
            GridTableView.BeginUpdate;
            GridTableView.DataController.RecordCount := 0;

            vIndex := 2;
            while True do
            begin
              if string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]) = EmptyStr then
                Break
              else
              begin
                OpenQuery('select   case when Isnull(YN_LINK,''N'') = ''Y'' then CD_GOODS_L else CD_GOODS end CD_GOODS, '
                         +'         NM_GOODS, '
                         +'         NM_SPEC, '
                         +'         QTY_SAFETY, '
                         +'         dbo.GetStockCount(CD_STORE, CD_GOODS_T, '''') as QTY_STOCK, '
                         +'         PR_BUY, '
                         +'         DS_TAX '
                         +'from     MS_GOODS '
                         +'where    CD_STORE = :P0 '
                         +'  and    CD_GOODS = :P1 '
                         +'  and    DS_STOCK = ''0'' '
                         +'  and    YN_USE   = ''Y''',
                         [StoreCode,
                          string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]),
                          StoreCode]);
                try
                  try
                    if not Query.Eof then
                    begin
                      GridTableView.DataController.AppendRecord;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]         := Query.Fields[0].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]         := Query.Fields[1].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsSpec.Index]         := Query.Fields[2].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewStockSafetyQty.Index]    := Query.Fields[3].AsInteger;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewStockQty.Index]          := Query.Fields[4].AsInteger;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTransQty.Index]          := Abs(vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex]);
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyPrice.Index]          := Query.Fields[5].AsCurrency;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTransAmt.Index]          := Abs(vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex]) * Query.Fields[5].AsCurrency;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTransNetAmt.Index]       := Ifthen(Query.Fields[6].AsString = '1', GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTransAmt.Index],0);
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTransDutyFreeAmt.Index]  := Ifthen(Query.Fields[6].AsString = '0', GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTransAmt.Index],0);
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDsTax.Index]             := Query.Fields[6].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewRowState.Index]          := rsInsert;
                    end;
                  except
                    ErrBox(Format('엑셀 파일을 불러올 수 없습니다.'#13'엑셀 칼럼을 잘못 지정했거나, 엑셀 파일에 잘못된 값이 들어 있는 것 같습니다.'#13#13'에러 줄(레코드) : %d', [vIndex]));
                    Break;
                  end;
                finally
                  FinishQuery;
                end;
              end;
              Inc(vIndex);
            end;
          finally
            vXLSFile.Disconnect;
            vXLSFile.Free;
            vXLSAdapter.Free;
            isLoading := false;
            GridTableView.EndUpdate;
          end;
        end;
    finally
      Free;
      FinishQuery;
      isChanged := true;
    end;
end;
//------------------------------------------------------------------------------
// 상품 일괄등록 버튼
procedure TStockTransDemandForm.GoodsBatchButtonClick(Sender: TObject);
var
  vIndex    : Integer;
  vStoreCode: string;
begin
  inherited;

  if ConditionToolBarStoreComboBox.ItemIndex < 0 then
  begin
    ErrBox(ConditionToolBarStoreLabel.Caption+msgMustInput);
    if ConditionToolBarStoreComboBox.Enabled then
      ConditionToolBarStoreComboBox.SetFocus;
    Exit;
  end;

  // 이관 매장코드
  vStoreCode := PStrPointer(ConditionToolBarStoreComboBox.Properties.Items.Objects[ConditionToolBarStoreComboBox.ItemIndex])^.Data;

  with TGoodsBatchHelpForm.Create(Self) do
    try
      WorkType    := 3;  //발주(상품일괄)
      GridTableViewBuyQty.Caption                := Self.GridTableViewTransQty.Caption;
      AddGridTableViewBuyQty.Caption             := GridTableViewBuyQty.Caption;
      GridTableViewBuyPrice.Caption              := Self.GridTableViewBuyPrice.Caption;
      AddGridTableViewBuyPrice.Caption           := GridTableViewBuyPrice.Caption;
      GridTableView.OptionsSelection.MultiSelect := false;

      SQLText := 'select   g.CD_GOODS, '
                +'         g.NM_GOODS+'' ''+g.NM_SPEC as NM_GOODS, '
                +'         t.NM_TRDPL, '
                +'         '''' as NM_SPC, '
                +'         g.PR_BUY, '
                +'         g.PR_SALE, '
                +'         g.PR_BUY  as PR_BUY_M, '
                +'         g.PR_SALE as PR_SALE_M, '
                +'         ''00''    as NO_DEVICE_CHG, '
                +'         g.DS_GOODS '
                +'from     MS_GOODS as g left outer join '
                +'         MS_TRD   as t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
                +'where    g.CD_STORE = '''+vStoreCode+''' '
                +'  and    g.DS_STOCK = ''0'' '
                +'  and    Isnull(g.YN_LINK,''N'') = ''N'' '
                +'  and    g.YN_USE   = ''Y'' '
                +'  and    :P0 is not null';  // P0이 없었으면 좋겠는데 TGoodsBatchHelpForm에서 무조건 넣으므로 조건을 무시하라는 뜻으로 넣은 코딩

      if ShowModal = mrOK then
        for vIndex := 0 to AddGridTableView.DataController.RecordCount-1 do
        begin
          // 그리드에 이미 등록되어 있는 상품코드면 무시하고 넘어간다
          if Self.GridTableView.DataController.FindRecordIndexByText(0, Self.GridTableViewGoodsCode.Index, AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index], false, false, true) >= 0 then
            Continue;
          // 이관 수량이 없으면 다음으로 넘어간다
          if Nvl(AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyQty.Index], 0) = 0 then
            Continue;

          OpenQuery('select   CD_GOODS, '
                   +'         NM_GOODS, '
                   +'         NM_SPEC, '
                   +'         QTY_SAFETY, '
                   +'         dbo.GetStockCount(CD_STORE, CD_GOODS_T, '''') as QTY_STOCK, '
                   +'         PR_BUY, '
                   +'         DS_TAX '
                   +'from     MS_GOODS '
                   +'where    CD_STORE = :P0 '
                   +'  and    CD_GOODS = :P1 '
                   +'  and    DS_STOCK = ''0'' '
                   +'  and    Isnull(YN_LINK,''N'') = ''N'' '
                   +'  and    YN_USE   = ''Y''',
                   [StoreCode,
                    AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index]]);
          try
            Self.GridTableView.DataController.AppendRecord;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index]        := Query.Fields[0].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsName.Index]        := Query.Fields[1].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsSpec.Index]        := Query.Fields[2].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewStockSafetyQty.Index]   := Query.Fields[3].AsInteger;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewStockQty.Index]         := Query.Fields[4].AsInteger;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTransQty.Index]         := Abs(Nvl(AddGridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index], 0));
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyPrice.Index]         := Query.Fields[5].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTransAmt.Index]         := Abs(Nvl(AddGridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index], 0)) * Query.Fields[5].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTransNetAmt.Index]      := Ifthen(Query.Fields[6].AsString = '1', Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTransAmt.Index],0);
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTransDutyFreeAmt.Index] := Ifthen(Query.Fields[6].AsString = '0', Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTransAmt.Index],0);
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewDsTax.Index]            := Query.Fields[6].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewRowState.Index]         := rsInsert;
          finally
            FinishQuery;
          end;
        end;
    finally
      Free;
      FinishQuery;
      isChanged := true;
    end;
end;
//------------------------------------------------------------------------------
// 그리드 값을 적용하기 전
procedure TStockTransDemandForm.GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;

  if ADataController.NewItemRowFocused then
  begin
    // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
    if (Nvl(ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
       (Nvl(ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewTransQty.Index],  0)        = 0) then
    begin
      // 기존에 입력된 값을 저장해 놓는다
      SetLength(BackupData, GridTableView.ColumnCount);
      for vIndex := 0 to GridTableView.ColumnCount-1 do
        BackupData[vIndex] := ADataController.Values[-1, vIndex];
      // Post를 취소한다
      ADataController.Cancel;
    end

    // 새로 추가한 상품과 동일한 상품을 미리 불러놓았다면 해당 상품 목록을 지운다
    else
      for vIndex := ADataController.RecordCount-1 downto 0 do
        if ADataController.Values[vIndex, GridTableViewGoodsCode.Index] = ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsCode.Index] then
        begin
          if AskBox(Format('%s(%s) 상품은 이미 이관 등록이 되어 있습니다.'#13'기존 이관에 수량을 추가하시겠습니까?'#13'''아니요''를 누르면 지금 입력한 값이 취소됩니다.', [String(ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsName.Index]), String(ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsCode.Index])])) then
          begin
            ADataController.Values[vIndex, GridTableViewTransQty.Index] := ADataController.Values[vIndex, GridTableViewTransQty.Index] + ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewTransQty.Index];
            ADataController.Values[vIndex, GridTableViewTransAmt.Index] := ADataController.Values[vIndex, GridTableViewTransQty.Index] * ADataController.Values[vIndex, GridTableViewBuyPrice.Index];
          end;
          // Post를 취소한다
          ADataController.Cancel;
          break;
        end;
  end;
  if ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate
  else
    ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsInsert;
end;
//------------------------------------------------------------------------------
// 그리드에 값이 적용된 후
procedure TStockTransDemandForm.GridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
begin
  inherited;

  if not isLoading then
    isChanged := true;
end;
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TStockTransDemandForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
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
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, vIndex] := BackupData[vIndex];
  end;
  SetLength(BackupData, 0);
  BackupData := nil;

  // 신규 입력일 때만 상품코드를 입력할 수 있게 한다
  GridTableViewGoodsCode.Options.Editing  := GridTableView.Controller.IsNewItemRowFocused;
  GridTableViewGoodsCode.Options.Focusing := GridTableViewGoodsCode.Options.Editing;
  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  GridDeleteButton.Enabled                := not GridTableView.Controller.IsNewItemRowFocused;
end;
//------------------------------------------------------------------------------
// 상품코드 도움말 버튼을 누를 때
procedure TStockTransDemandForm.GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  SearchGoods;
end;
//------------------------------------------------------------------------------
// 상품코드를 검증할 때
procedure TStockTransDemandForm.GridTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vIndex      : Integer;
  vGoodsCode,
  vGoodsName,
  vGoodsSpec,
  vDsTax      : string;
  vStockSafetyQty,
  vStockQty   : Integer;
  vBuyPrice   : Currency;
begin
  inherited;

  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    // 상품마스터에서 해당 상품을 찾아본다
    OpenQuery('select   CD_GOODS, '
             +'         NM_GOODS, '
             +'         NM_SPEC, '
             +'         QTY_SAFETY, '
             +'         dbo.GetStockCount(CD_STORE, CD_GOODS_T, '''') as QTY_STOCK, '
             +'         PR_BUY, '
             +'         DS_TAX '
             +'from     MS_GOODS '
             +'where    CD_STORE = :P0 '
             +'  and   (CD_GOODS like ''%''+:P1+''%'' or NM_GOODS like ''%''+:P1+''%'' or NM_GOODS_SHORT like ''%''+:P1+''%'') '
             +'  and    DS_STOCK = ''0'' '
             +'  and    DS_GOODS <> ''K'' '
             +'  and    Isnull(YN_LINK,''N'') = ''N'' '
             +'  and    YN_USE   = ''Y''',
             [StoreCode,
              DisplayValue]);
    isLoading := true;
    try
      if not Query.Eof then
      begin
        // 첫 레코드를 읽어놓는다
        vGoodsCode      := Query.Fields[0].AsString;
        vGoodsName      := Query.Fields[1].AsString;
        vGoodsSpec      := Query.Fields[2].AsString;
        vStockSafetyQty := Query.Fields[3].AsInteger;
        vStockQty       := Query.Fields[4].AsInteger;
        vBuyPrice       := Query.Fields[5].AsCurrency;
        vDsTax          := Query.Fields[6].AsString;
        // 다음 줄로 이동해 검색한 레코드가 여러 건인지 확인한다
        Query.Next;
        // 검색한 레코드가 한 건이라면 바로 적용한다
        if Query.Eof then
        begin
          DisplayValue := vGoodsCode;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsName.Index]        := vGoodsName;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsSpec.Index]        := vGoodsSpec;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStockSafetyQty.Index]   := vStockSafetyQty;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStockQty.Index]         := vStockQty;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index]         := vBuyPrice;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDsTax.Index]            := vDsTax;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransQty.Index]         := 0;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransAmt.Index]         := 0;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNetAmt.Index]      := 0;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDutyFreeAmt.Index] := 0;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index]         := rsInsert;
          Exit;
        end
        // 검색한 레코드가 여러 건이면 검색을 한다
        else
        begin
          DisplayValue := SearchGoods(DisplayValue);
          GridTableView.Controller.FocusedItemIndex := GridTableViewGoodsCode.Index;
          if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsName.Index] <> EmptyStr then
            Exit;
        end;
      end;
    finally
      isLoading := false;
      FinishQuery;
    end;
  end
  // 상품코드를 입력하지 않았으면 모든 값을 지운다
  else
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      if (GridTableView.Columns[vIndex].DataBinding.ValueType = 'Integer') or
         (GridTableView.Columns[vIndex].DataBinding.ValueType = 'Currency') then
        GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, vIndex] := 0
      else
        GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, vIndex] := EmptyStr;
end;
//------------------------------------------------------------------------------
// 이관수량을 검증할 때
procedure TStockTransDemandForm.GridTableViewTransQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if Nvl(DisplayValue, 0) = 0 then
    Error := true
  else
  begin
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransQty.Index] := DisplayValue;
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransAmt.Index] := DisplayValue * GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index];
    if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDsTax.Index] = '1' then
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNetAmt.Index] := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransAmt.Index]
    else
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDutyFreeAmt.Index] := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransAmt.Index];
  end;
end;
//------------------------------------------------------------------------------
// 그리드 푸터를 새로 계산할 때
procedure TStockTransDemandForm.GridTableViewDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
begin
  inherited;

  // 합계금액을 새로 구한다
  if (Showing) and (GridTableView.DataController.Summary.FooterSummaryItems.Count > 1) then
    TransAmtEdit.Value := Nvl(GridTableView.DataController.Summary.FooterSummaryValues[1], 0.0);
end;
//------------------------------------------------------------------------------
// 그리드 삭제 버튼
procedure TStockTransDemandForm.GridDeleteButtonClick(Sender: TObject);
var vRowIndex :Integer;
    vIndex    :Integer;
begin
  inherited;
  if not AskBox('이관상품을 삭제하시겠습니까?') then Exit;

  if GridTableView.Controller.IsNewItemRowFocused then
  begin
    GridTableView.DataController.Cancel;
    isChanged := true;
  end
  else if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.GetFocusedRecordIndex >= 0) then
  begin
    // 선택한 레코드를 삭제한다
    //신규로 입력한 레코드는 삭제한다
    if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index] = rsInsert then
      GridTableView.DataController.DeleteFocused
    else
    begin
      //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
      vRowIndex := GridTableView.DataController.GetFocusedRecordIndex;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsDelete;
      GridTableView.DataController.AppendRecord;
      for vIndex := 0 to GridTableView.ColumnCount-1 do
        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := GridTableView.DataController.Values[vRowIndex, vIndex];
      GridTableView.DataController.DeleteRecord(vRowIndex);
    end;
    isChanged := true;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 상품 조회
function TStockTransDemandForm.SearchGoods(aGoods: string): string;
begin
  Result := EmptyStr;

  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '상품 조회';
      GridTableViewCode.Caption  := Self.GridTableViewGoodsCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := Self.GridTableViewGoodsName.Caption;
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := Self.GridTableViewGoodsSpec.Caption;
      GridTableViewName2.Width   := 60;
      GridTableViewName3.Caption := Self.GridTableViewBuyPrice.Caption;
      GridTableViewName3.Width   := 100;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;

      SearchText := aGoods;
      SQLText    := 'select   g.CD_GOODS, '
                   +'         g.NM_GOODS, '
                   +'         g.NM_SPEC,  '
                   +'         g.PR_BUY, '
                   +'         g.QTY_SAFETY, '
                   +'         s.QTY_STOCK, '
                   +'         g.DS_TAX '
                   +'from     MS_GOODS as g (nolock) left outer join '
                   +'        (select   CD_STORE, '
                   +'                  CD_GOODS, '
                   +'                  Sum(QTY_STOCK) as QTY_STOCK '
                   +'         from    (select   CD_STORE, '
                   +'                           CD_GOODS, '
                   +'                           QTY_BASE as QTY_STOCK '
                   +'                  from     SL_STOCK_MONTH (nolock) '
                   +'                  where    CD_STORE = :P0 '
                   +'                    and    YM_STOCK = Left(Convert(varchar, GetDate(), 112), 6) '
                   +'                    and    QTY_BASE <> 0 '
                   +'                  union all '
                   +'                  select   b.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_BUY_D as b (nolock) inner join '
                   +'                           MS_GOODS as g (nolock) on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS '
                   +'                  where    b.CD_STORE = :P0 '
                   +'                    and    b.YMD_BUY like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                  group by b.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   s.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_SALE_D_SUM as s (nolock) inner join '
                   +'                           MS_GOODS      as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
                   +'                  where    s.CD_STORE = :P0 '
                   +'                    and    s.YMD_SALE like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                  group by s.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   d.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_DISUSE as d (nolock) inner join '
                   +'                           MS_GOODS  as g (nolock) on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
                   +'                  where    d.CD_STORE = :P0 '
                   +'                    and    d.YMD_DISUSE like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                  group by d.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   s.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           - Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_SILSA as s (nolock) inner join '
                   +'                           MS_GOODS as g (nolock) on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
                   +'                  where    s.CD_STORE = :P0 '
                   +'                    and    s.YM_SILSA = Left(Convert(varchar, GetDate(), 112), 6) '
                   +'                    and    s.QTY_SETTLE is not null '
                   +'                  group by s.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   t.CD_STORE, '
                   +'                           g.CD_GOODS_T     as CD_GOODS, '
                   +'                           -Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_TRANS_D as t (nolock) inner join '
                   +'                           MS_GOODS   as g (nolock) on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
                   +'                  where    t.CD_STORE  = :P0 '
                   +'                    and    t.YMD_TRANS like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                    and    t.DS_STATUS = '''+TransReceive+''' '
                   +'                  group by t.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   t.CD_STORE_RECEIVE as CD_STORE, '
                   +'                           g.CD_GOODS_T       as CD_GOODS, '
                   +'                           Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end)     as QTY_STOCK '
                   +'                  from     SL_TRANS_D as t (nolock) inner join '
                   +'                           MS_GOODS   as g (nolock) on t.CD_STORE_RECEIVE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
                   +'                  where    t.CD_STORE_RECEIVE = :P0 '
                   +'                    and    t.YMD_TRANS like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                    and    t.DS_STATUS        = '''+TransReceive+''' '
                   +'                  group by t.CD_STORE_RECEIVE, g.CD_GOODS_T) as k '
                   +'         group by CD_STORE, CD_GOODS) as s on g.CD_STORE = s.CD_STORE and g.CD_GOODS_T = s.CD_GOODS '
                   +'where    g.CD_STORE = :P0 '
                   +'  and   (g.CD_GOODS like ''%''+:P1+''%'' or g.NM_GOODS like ''%''+:P1+''%'' or g.NM_GOODS_SHORT like ''%''+:P1+''%'') '
                   +'  and    g.DS_STOCK = ''0'' '
                   +'  and    g.YN_USE   = ''Y'' '
                   +'  and    g.DS_GOODS <> ''K'' '
                   +'  and    Isnull(g.YN_LINK,''N'') = ''N'' '
                   +'order by g.CD_STORE, g.CD_GOODS';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Result := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewGoodsCode.Index]      := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewGoodsName.Index]      := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewGoodsSpec.Index]      := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewStockSafetyQty.Index] := StoI(Names[3]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewStockQty.Index]       := StoI(Names[4]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewBuyPrice.Index]       := StoF(Names[2]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewDsTax.Index]          := Names[5];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewTransQty.Index]       := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewTransAmt.Index]       := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewTransNetAmt.Index]      := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewTransDutyFreeAmt.Index] := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewRowState.Index]         := rsInsert;
        Self.GridTableView.Controller.FocusedItemIndex := Self.GridTableViewTransQty.Index;
      end
      else
        Self.GridTableView.Controller.FocusedItemIndex := Self.GridTableViewGoodsCode.Index;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 값이 변경되었을 때
procedure TStockTransDemandForm.SetChanged(aChanged: Boolean);
begin
  inherited;

  ConditionToolBarTransNoEdit.Enabled := not isChanged;
  ButtonToolBarSearchButton.Enabled   := not isChanged;
  ButtonToolBarNewButton.Enabled      := not isChanged;
  ButtonToolBarCancelButton.Enabled   := ButtonToolBarSaveButton.Enabled;
end;
//------------------------------------------------------------------------------
// 조회
function TStockTransDemandForm.DoSearch: Boolean;
var
  vStoreCode: string;
begin
  Result    := false;
  isLoading := true;
  ClearEdit;

  if ConditionToolBarStoreComboBox.ItemIndex < 0 then
  begin
    ConditionToolBarTransNoEdit.Text := EmptyStr;
    ErrBox(ConditionToolBarStoreLabel.Caption+msgMustInput);
    Exit;
  end
  // 이관 매장코드
  else
    vStoreCode := PStrPointer(ConditionToolBarStoreComboBox.Properties.Items.Objects[ConditionToolBarStoreComboBox.ItemIndex])^.Data;

  // 전표번호를 잘 입력했는지 확인한다
  if (GetOnlyNumber(ConditionToolBarTransNoEdit.Text) <> ConditionToolBarTransNoEdit.Text) or
     (StoI(ConditionToolBarTransNoEdit.Text) <= 0) then
    ConditionToolBarTransNoEdit.Text := EmptyStr;

  // 발주번호를 입력했다면 기존 자료를 불러온다
  if ConditionToolBarTransNoEdit.Text <> EmptyStr then
  begin
    ConditionToolBarTransNoEdit.Text := LPad(ConditionToolBarTransNoEdit.Text, 4, '0');
    OpenQuery('select   CD_STORE, '
             +'         DS_STATUS, '
             +'         REMARK '
             +'from     SL_TRANS_H '
             +'where    CD_STORE_RECEIVE  = :P0 '
             +'  and    YMD_TRANS = :P1 '
             +'  and    NO_TRANS  = :P2 '
             +'  and    CD_STORE  = :P3 ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               ConditionToolBarTransNoEdit.Text,
               vStoreCode]);
    try
      // 조회 결과 없는 이관 전표이면 전표번호를 지우고 신규로 처리한다
      if Query.Eof then
      begin
        ConditionToolBarTransNoEdit.Text := EmptyStr;
        ErrBox('해당 이관 전표가 없습니다.');
      end
      else if Query.Fields[1].AsString <> TransDemand then
      begin
        ConditionToolBarTransNoEdit.Text := EmptyStr;
        ErrBox(Format('%s 전표만 수정할 수 있습니다.', [TransDemandName]));
        Exit;
      end
      // 이관정보를 표시한다
      else
      begin
        StatusEdit.Tag  := IfThen(Query.Fields[1].AsString = TransRefuse, 2, 1);
        StatusEdit.Text := IfThen(StatusEdit.Tag = 2, TransRefuseName, TransDemandName);
        CommentMemo.Text := Query.Fields[2].AsString;
      end;
    finally
      FinishQuery;
    end;

    // 상세 내역을 불러온다
    if ConditionToolBarTransNoEdit.Text <> EmptyStr then
    begin
      GridTableView.DataController.RecordCount := 0;
      OpenQuery('select   t.CD_GOODS, '
               +'         g.NM_GOODS, '
               +'         g.NM_SPEC, '
               +'         g.QTY_SAFETY, '
               +'         s.QTY_STOCK, '
               +'         t.QTY_DEMAND, '
               +'         t.PR_BUY, '
               +'         t.AMT_DEMAND, '
               +'         g.DS_TAX, '
               +'         case when g.DS_TAX = ''1'' then t.AMT_DEMAND else 0 end AMT_NET, '
               +'         case when g.DS_TAX = ''0'' then t.AMT_DEMAND else 0 end AMT_DUTYFREE, '
               +'         t.SEQ, '
               +'         ''rsNormal'' as ROW_STATE '
               +'from     SL_TRANS_D as t inner join '
               +'         MS_GOODS   as g on t.CD_STORE_RECEIVE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS left outer join '
               +'        (select   CD_STORE, '
               +'                  CD_GOODS, '
               +'                  Sum(QTY_STOCK) as QTY_STOCK '
               +'         from    (select   CD_STORE, '
               +'                           CD_GOODS, '
               +'                           QTY_BASE as QTY_STOCK '
               +'                  from     SL_STOCK_MONTH '
               +'                  where    CD_STORE = :P3 '
               +'                    and    YM_STOCK = Left(:P1, 6) '
               +'                    and    QTY_BASE <> 0 '
               +'                  union all '
               +'                  select   b.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_BUY_D as b inner join '
               +'                           MS_GOODS as g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS '
               +'                  where    b.CD_STORE = :P3 '
               +'                    and    b.YMD_BUY between Left(:P1, 6) + ''01'' and :P1 '
               +'                  group by b.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   s.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_SALE_D as s inner join '
               +'                           MS_GOODS  as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
               +'                  where    s.CD_STORE = :P3 '
               +'                    and    s.YMD_SALE between Left(:P1, 6) + ''01'' and :P1 '
               +'                    and    s.DS_SALE <> ''V'' '
               +'                  group by s.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   d.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_DISUSE as d inner join '
               +'                           MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
               +'                  where    d.CD_STORE = :P3 '
               +'                    and    d.YMD_DISUSE between Left(:P1, 6) + ''01'' and :P1 '
               +'                  group by d.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   s.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           - Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_SILSA as s inner join '
               +'                           MS_GOODS as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
               +'                  where    s.CD_STORE = :P3 '
               +'                    and    s.YM_SILSA = Left(:P1, 6) '
               +'                    and    Convert(varchar, s.DT_CHANGE, 112) between Left(:P1, 6) + ''01'' and :P1 '
               +'                    and    s.QTY_SETTLE is not null '
               +'                  group by s.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   t.CD_STORE, '
               +'                           g.CD_GOODS_T     as CD_GOODS, '
               +'                           -Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_TRANS_D as t inner join '
               +'                           MS_GOODS   as g on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
               +'                  where    t.CD_STORE  = :P3 '
               +'                    and    t.YMD_TRANS between Left(:P1, 6) + ''01'' and :P1 '
               +'                    and    t.DS_STATUS = '''+TransSend+''' '
               +'                  group by t.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   t.CD_STORE_RECEIVE as CD_STORE, '
               +'                           g.CD_GOODS_T       as CD_GOODS, '
               +'                           Sum(t.QTY_TRANS * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_TRANS_D as t inner join '
               +'                           MS_GOODS   as g on t.CD_STORE_RECEIVE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
               +'                  where    t.CD_STORE_RECEIVE = :P3 '
               +'                    and    t.YMD_TRANS between Left(:P1, 6) + ''01'' and :P1 '
               +'                    and    t.DS_STATUS        = '''+TransReceive+''' '
               +'                  group by t.CD_STORE_RECEIVE, g.CD_GOODS_T) as k '
               +'         group by CD_STORE, CD_GOODS) as s on t.CD_STORE_RECEIVE = s.CD_STORE and t.CD_GOODS = s.CD_GOODS '
               +'where    t.CD_STORE_RECEIVE  = :P0 '
               +'  and    t.YMD_TRANS = :P1 '
               +'  and    t.NO_TRANS  = :P2 '
               +'order by t.SEQ',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 ConditionToolBarTransNoEdit.Text,
                 StoreCode]);
      DM.ReadQuery(Query, GridTableView);
    end;

    // 기존 자료를 불러왔을 경우 수관매장은 수정할 수 없다
    ConditionToolBarStoreComboBox.Enabled := false;
    if Grid.Visible and Grid.Enabled then
      Grid.SetFocus;
  end;
  isLoading := false;

  // 이관번호를 입력하지 않으면 신규 상태로 처리한다
  if ConditionToolBarTransNoEdit.Text = EmptyStr then
  begin
    ErrBox(ConditionToolBarEditLabel.Caption+msgMustInput);
    ButtonToolBarNewButton.Click;
  end;

  Result := true;
end;
//------------------------------------------------------------------------------
// 저장
function TStockTransDemandForm.DoSave: Boolean;
var
  vIndex    : Integer;
  vExist    : Boolean;
  vTransNo  : string;
  vStoreCode: string;
  vSum      : Currency;
  vSeq      : Integer;
begin
  Result := false;

  // 거래처
  if ConditionToolBarStoreComboBox.ItemIndex < 0 then
  begin
    ErrBox(ConditionToolBarStoreLabel.Caption+msgMustInput);
    if ConditionToolBarStoreComboBox.Enabled then
      ConditionToolBarStoreComboBox.SetFocus;
    Exit;
  end;

  // 이관 매장코드
  vStoreCode := PStrPointer(ConditionToolBarStoreComboBox.Properties.Items.Objects[ConditionToolBarStoreComboBox.ItemIndex])^.Data;


  // 입력 중이던 자료 포스트
  GridTableView.DataController.Post;
  // 이관 목록을 뒤져서 이관 수량이 입력 되었는지 확인한다
  if GridTableView.DataController.RecordCount = 0 then
    vExist := false
  else
  begin
    vExist := true;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
         (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewTransQty.Index],  0)        = 0) then
      begin
        vExist := false;
        break;
      end;
  end;
  if not vExist then
  begin
    ErrBox('이관 신청할 목록을 정상적으로 입력하지 않았거나, 수량을 입력하지 않았습니다.');
    FinishQuery;
    Exit;
  end;

  // 신규 이관이 아니라면 이미 수관한 자료인지 검색한다
  if StatusEdit.Tag <> 0 then
  begin
    vTransNo := LPad(ConditionToolBarTransNoEdit.Text, 4, '0');
    OpenQuery('select   DS_STATUS '
             +'from     SL_TRANS_H '
             +'where    CD_STORE  = :P0 '
             +'  and    YMD_TRANS = :P1 '
             +'  and    NO_TRANS  = :P2',
              [vStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               vTransNo]);
    try
      if (Query.Fields[0].AsString = TransReceive) or
         (Query.Fields[0].AsString = TransCancel)  or
         (Query.Fields[0].AsString = TransDemandAbort) then
      begin
        ErrBox(Format('이미 %s 상태이므로 저장할 수 없습니다.', [IfThen(Query.Fields[0].AsString = TransReceive, TransReceiveName, IfThen(Query.Fields[0].AsString = TransCancel, TransCancelName, TransDemandAbortName))]));
        FinishQuery;
        Exit;
      end
      else if Query.Fields[0].AsString <> TransDemand then
      begin
        ErrBox(Format('이미 %s을 한 상태이므로 저장할 수 없습니다.', [TransSendName]));
        FinishQuery;
        Exit;
      end;
    finally
      FinishQuery;
    end;
  end;


  // 이관 저장
  BeginTrans;
  try
    // 이관 번호를 불러온다
    if (StatusEdit.Tag = 0) or (ConditionToolBarTransNoEdit.Text = EmptyStr) then
    begin
      OpenQuery('select   Max(NO_TRANS) as NO_TRANS '
               +'from     SL_TRANS_H '
               +'where    CD_STORE  = :P0 '
               +'  and    YMD_TRANS = :P1',
                [vStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date)]);
      try
        vTransNo := FormatFloat('0000', StoI(Query.Fields[0].AsString)+1);
      finally
        FinishQuery;
      end;
    end
    else vTransNo := ConditionToolBarTransNoEdit.Text;

    // 디테일을 저장한다
    vSum    := 0;
    vSeq    := 0;
    try
      OpenQuery('select Max(SEQ) as SEQ '
               +'from   SL_TRANS_D '
               +'where    CD_STORE  = :P0 '
               +'  and    YMD_TRANS = :P1',
                [vStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date)]);
      if not Query.Eof then
        vSeq := Query.Fields[0].AsInteger;
    finally
      FinishQuery;
    end;

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then
      begin
        vSum := vSum + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewTransAmt.Index], 0.0);
        Continue;
      end
      else if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete from SL_TRANS_D '
                 +'where  CD_STORE  = :P0 '
                 +'  and  YMD_TRANS = :P1 '
                 +'  and  NO_TRANS  = :P2 '
                 +'  and  SEQ       = :P3 ',
                  [vStoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   vTransNo,
                   GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index]],
                   false);
      end
      else
      begin
        if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then Inc(vSeq);

        ExecQuery(Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert,
                 'insert into SL_TRANS_D '
                +'( '
                +'  CD_STORE, YMD_TRANS, NO_TRANS, SEQ, CD_GOODS, PR_BUY, QTY_DEMAND, QTY_TRANS, CD_STORE_RECEIVE, DS_STATUS '
                +') values ( '
                +'  :P0, :P1, :P2, :P3, :P4, :P5, :P6, 0, :P7, :P8 '
                +')',
                 'update SL_TRANS_D set CD_GOODS            =:P4, '
                +'                      PR_BUY              =:P5, '
                +'                      QTY_DEMAND          =:P6, '
                +'                      CD_STORE_RECEIVE    =:P7, '
                +'                      DS_STATUS           =:P8 '
                +' where CD_STORE  =:P0 '
                +'   and YMD_TRANS =:P1 '
                +'   and NO_TRANS  =:P2 '
                +'   and SEQ       =:P3 '),
                [vStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vTransNo,
                 Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert, vSeq, NVL(GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index],0)),
                 GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewTransQty.Index],
                 StoreCode,
                 TransDemand],
                 false);
        vSum := vSum + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewTransAmt.Index], 0.0);
      end;
    end;
    // 마스터를 저장한다
    ExecQuery(Ifthen(ConditionToolBarTransNoEdit.Text = EmptyStr,
                     'insert into SL_TRANS_H '
                    +'( '
                    +'  CD_STORE, YMD_TRANS, NO_TRANS, CD_STORE_RECEIVE, DS_STATUS, AMT_DEMAND, AMT_TRANS, CD_SAWON_DEMAND, NO_DEVICE_DEMAND, DT_DEMAND, REMARK '
                    +') values ( '
                    +'  :P0, :P1, :P2, :P3, :P4, :P5, 0, :P6, :P7, GetDate(), :P8 '
                    +')',
                     'update SL_TRANS_H '
                    +'set    CD_STORE_RECEIVE = :P3, '
                    +'       DS_STATUS        = :P4, '
                    +'       AMT_DEMAND       = :P5, '
                    +'       AMT_TRANS        = 0, '
                    +'       CD_SAWON_DEMAND  = :P6, '
                    +'       NO_DEVICE_DEMAND = :P7, '
                    +'       DT_DEMAND        = GetDate(), '
                    +'       REMARK           = :P8 '
                    +'where  CD_STORE         = :P0 '
                    +'  and  YMD_TRANS        = :P1 '
                    +'  and  NO_TRANS         = :P2'),
              [vStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               vTransNo,
               StoreCode,
               TransDemand,
               vSum,
               UserCode,
               '00',
               CommentMemo.Text],
               false);

    // 상대 매장에 확인용 메시지를 저장한다
    ExecQuery('delete from MS_CODE '
             +'where  CD_STORE = :P0 '
             +'  and  CD_KIND  = ''61'' '
             +'  and  CD_CODE  = ''001''',
              [vStoreCode],
               false);
    ExecQuery('insert into MS_CODE '
             +'( '
             +'  CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6 '
             +') values ( '
             +'  :P0, ''61'', ''001'', :P1, :P2, :P3, :P4, :P5, :P6 '
             +')',
              [vStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               StoreCode,
               StoreName,
               TransDemandName,
               TransSendName,
               'StockTransSend'],
               false);

    CommitTrans;

    isChanged       := false;
    StatusEdit.Text := TransDemandName;
    StatusEdit.Tag  := 1;
    ConditionToolBarTransNoEdit.Text := vTransNo;
    GridTableView.DataController.EndUpdateFields;

    // 이관정정에서 넘어왔을 때는 폼을 닫는다
    if not ButtonToolBarNewButton.Visible then
      Close
    else
      ButtonToolBarNewButton.Click;
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
