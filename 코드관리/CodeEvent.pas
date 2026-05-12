// 행사 (New완료)

// 0 : 메뉴별 행사
// 1 : 영수증별 행사


unit CodeEvent;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, Math, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, ExtCtrls, StdCtrls, StrUtils, cxGraphics, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxLabel, cxButtonEdit,
  cxCurrencyEdit, cxLookAndFeelPainters, ComCtrls, cxTreeView, cxCheckBox,
  cxGroupBox, cxSpinEdit, cxTimeEdit, cxGridCustomTableView, cxGridTableView,
  AdvToolBar, AdvToolBarStylers, cxContainer, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, AdvPanel, Menus, cxLookAndFeels,
  cxButtons, DBAccess, cxMemo, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeEventForm = class(TInheritGridEditForm)
    GridTableViewDCCode: TcxGridColumn;
    GridTableViewDCName: TcxGridColumn;
    GridTableViewUseYN: TcxGridColumn;
    DCPanel: TPanel;
    DCCodeLabel: TLabel;
    DCCodeEdit: TcxCurrencyEdit;
    DCCodeCreateButton: TButton;
    DCNameLabel: TLabel;
    DCNameEdit: TcxTextEdit;
    DCSaleDateLabel: TLabel;
    DCSaleDateFromEdit: TcxDateEdit;
    DCSaleDateToEdit: TcxDateEdit;
    DCTimeLabel: TLabel;
    DCTimeFromEdit: TcxTimeEdit;
    DCTimeToEdit: TcxTimeEdit;
    DCWeeklyGroupBox: TcxGroupBox;
    DCWeeklyMonCheckBox: TcxCheckBox;
    DCWeeklyTueCheckBox: TcxCheckBox;
    DCWeeklyWedCheckBox: TcxCheckBox;
    DCWeeklyThuCheckBox: TcxCheckBox;
    DCWeeklyFriCheckBox: TcxCheckBox;
    DCWeeklySatCheckBox: TcxCheckBox;
    DCWeeklySunCheckBox: TcxCheckBox;
    DCWeeklySelectAllButton: TButton;
    DCStatusEdit: TcxTextEdit;
    DCGrid: TcxGrid;
    GoodsGridLevel: TcxGridLevel;
    GoodsGridTableView: TcxGridTableView;
    GoodsGridTableViewGoodsCode: TcxGridColumn;
    GoodsGridTableViewGoodsName: TcxGridColumn;
    GoodsGridTableViewSalePrice: TcxGridColumn;
    GoodsGridTableViewDCSalePrice: TcxGridColumn;
    GoodsGridTableViewDCRate: TcxGridColumn;
    ReceiptGridLevel: TcxGridLevel;
    ReceiptGridTableView: TcxGridTableView;
    ReceiptGridTableViewReceiptNo: TcxGridColumn;
    GoodsGridTableViewUseYN: TcxGridColumn;
    GoodsGridTableViewSeq: TcxGridColumn;
    GoodsCopyPopupMenu: TPopupMenu;
    CopyMenuItem: TMenuItem;
    PasteMenuItem: TMenuItem;
    DcAllTimeCheckBox: TcxCheckBox;
    GoodsGridTableViewRowState: TcxGridColumn;
    GoodsBatchButton: TAdvGlowButton;
    GoodsSearchButton: TAdvGlowButton;
    GridDeleteButton: TAdvGlowButton;
    DcRateChangeButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditExit(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure DCWeeklySelectAllButtonClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure GoodsGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure DCRateEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure DCGridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure ClassTreeViewExit(Sender: TObject);
    procedure DCCodeCreateButtonClick(Sender: TObject);
    procedure GoodsGridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GoodsGridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GoodsGridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GoodsGridTableViewDCBuyPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GoodsGridTableViewDCSalePricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ClassGridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GridDeleteButtonClick(Sender: TObject);
    procedure GoodsGridTableViewApplyQtyStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GoodsSearchButtonClick(Sender: TObject);
    procedure GoodsGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GoodsCopyPopupMenuPopup(Sender: TObject);
    procedure CopyMenuItemClick(Sender: TObject);
    procedure PasteMenuItemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GoodsBatchPopupMenuRequestClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure GoodsGridTableViewGoodsCodePropertiesChange(Sender: TObject);
    procedure GoodsGridTableViewUseYNPropertiesChange(Sender: TObject);
    procedure MenuBathAddButtonClick(Sender: TObject);
    procedure GoodsBatchButtonClick(Sender: TObject);
    procedure DcRateChangeButtonClick(Sender: TObject);

  private
    FocusedGrid: TcxGrid;
    BackupData : array[0..2] of array of Variant;
    CopyEventCode :String;    //행사상품 복사용 행사코드
    RequestGoodsCode :String; //행사요청상품 (저장시 삭제하기 위함)

    function  CalcDCRate(aAmount, aDCAmount: Currency): Currency;
    function  CalcProfitRate(aBuyPrice, aSalePrice: Currency; aGubun:String): Currency;
    function  SearchGoods(aGoods: string = ''):Boolean;
    function  GetEventNo:String;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 그리드 연결 자료 표시
    function  DoNew: Boolean; override;                         // 신규
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  CodeEventForm: TCodeEventForm;



implementation

uses
  Common, Help, DBModule, CodeBatchHelp;

const
  Seller = '매입처';

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCodeEventForm.FormCreate(Sender: TObject);
begin
  inherited;

  CopyEventCode    := EmptyStr;
  RequestGoodsCode := EmptyStr;
  ConditionToolBarComboBox.ItemIndex := 1;

  GoodsGridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GoodsGridTableView.DataController.Filter.Active := true;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TCodeEventForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TCodeEventForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vCode, vName: string;
  vSalePrice: Currency;
  vIndex :Integer;
begin
  case Key of
    VK_DOWN,
    VK_UP   :
      if (GoodsGridTableView.Focused   and GoodsGridTableView.Controller.IsNewItemRowFocused) or
         (ReceiptGridTableView.Focused   and ReceiptGridTableView.Controller.IsNewItemRowFocused) then
      begin
        Key := 0;
        Exit;
      end;
  end;

  inherited;

  // 그리드 OnKeyDown 이벤트는 Enter키 입력이 되지 않아서 폼에서 처리한다
  if Key = VK_Return then
    // 상품행사
    if (GoodsGridTableView.Focused)  and
       (GoodsGridTableView.Controller.IsNewItemRowFocused) and // 신규 레코드 입력
       (GoodsGridTableView.Controller.FocusedColumnIndex = GoodsGridTableViewGoodsCode.Index) then // 상품코드에 포커스가 있을 때
    begin
      GoodsGridTableView.DataController.PostEditingData;

      if GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index] = null then
        Exit
      // 상품코드를 정확히 입력했을 때
      else if (GetOnlyNumber(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]) = GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]) and
              ((Length(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]) in [8, 13, 7, 12]) or
               ((Length(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]) = 14) and (GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewGoodsCode.Index][1] = '1'))) then
      begin
        OpenQuery('select   NM_MENU_SHORT, '
                 +'         PR_SALE, '
                 +'         CD_MENU '
                 +'from     MS_MENU '
                 +'where    CD_HEAD  = :P0 '
                 +'  and    CD_STORE = :P1 '
                 +'  and    CD_MENU  = :P2 '
                 +'  and    DS_MENU_TYPE = ''N'' '
                 +'  and    YN_USE       = ''Y''',
                  [HeadStoreCode,
                   StoreCode,
                   GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]]);
        try
          vIndex := GoodsGridTableView.DataController.FilteredIndexByRecordIndex[GoodsGridTableView.DataController.FindRecordIndexByText(0, GoodsGridTableViewGoodsCode.Index, GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewGoodsCode.Index], false, false, true)];
          if vIndex >= 0 then
          begin
            GoodsGridTableView.ViewData.Records[vIndex].Selected := not GoodsGridTableView.ViewData.Records[vIndex].Selected and GoodsGridTableView.ViewData.Records[vIndex].IsData;
            GoodsGridTableView.DataController.Cancel;
            GoodsGridTableView.Controller.FocusedRecordIndex     := vIndex;
            DCGrid.SetFocus;
            Exit;
          end;

          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index   ] := Query.Fields[2].AsString;
          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsName.Index   ] := Query.Fields[0].AsString;
          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index   ] := Query.Fields[1].AsCurrency;
          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCSalePrice.Index ] := Query.Fields[1].AsCurrency;
          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCRate.Index      ] := CalcDCRate(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index], GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCSalePrice.Index]);
          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewUseYN.Index       ] := true;
          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewRowState.Index    ] := rsInsert;
          if GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsName.Index] = EmptyStr then
            ShowMsg(GoodsGridTableViewGoodsCode.Caption+msgMustInput, true);
        finally
          FinishQuery;
        end;
      end
      // 상품코드에 문자 등이 들어가 있을 때
      else if GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index] <> EmptyStr then
      begin
        OpenQuery('select   CD_MENU, '
                 +'         NM_MENU_SHORT, '
                 +'         PR_SALE '
                 +'from     MS_MENU  '
                 +'where    CD_HEAD  = :P0 '
                 +'  and    CD_STORE = :P1 '
                 +'  and   (CD_MENU like ConCat(:P2,''%'') or NM_MENU like ConCat(''%'',:P2,''%'') or NM_MENU_SHORT like ConCat(''%'',:P2,''%'')) '
                 +'  and    DS_MENU_TYPE in (''N'', ''C'', ''O'',''S'') '
                 +'  and    YN_USE   = ''Y''',
                  [HeadStoreCode,
                   StoreCode,
                   GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]]);
        try
          // 쿼리 결과의 첫줄을 읽어놓는다
          vCode := EmptyStr;
          if not Query.Eof then
          begin
            vCode      := Query.Fields[0].AsString;
            vName      := Query.Fields[1].AsString;
            vSalePrice := Query.Fields[2].AsCurrency;
            // 쿼리 다음 줄로 이동해 본다
            Query.Next;
            // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
            if Query.Eof then
            begin
              vIndex := GoodsGridTableView.DataController.FilteredIndexByRecordIndex[GoodsGridTableView.DataController.FindRecordIndexByText(0, GoodsGridTableViewGoodsCode.Index, vCode, false, false, true)];
              if vIndex >= 0 then
              begin
                GoodsGridTableView.ViewData.Records[vIndex].Selected := not GoodsGridTableView.ViewData.Records[vIndex].Selected and GoodsGridTableView.ViewData.Records[vIndex].IsData;
                GoodsGridTableView.DataController.Cancel;
                GoodsGridTableView.Controller.FocusedRecordIndex     := vIndex;
                DCGrid.SetFocus;
                Exit;
              end;
              GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index   ] := vCode;
              GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsName.Index   ] := vName;
              GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index   ] := vSalePrice;
              GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCSalePrice.Index ] := vSalePrice;
              GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCRate.Index      ] := CalcDCRate(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index], GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCSalePrice.Index]);
              GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewUseYN.Index       ] := true;
              GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewRowState.Index    ] := rsInsert;
            end
            // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
            else
              SearchGoods(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]);
          end
          else
          begin
            GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsName.Index     ] := EmptyStr;
            GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index     ] := 0;
            GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCSalePrice.Index   ] := 0;
            GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCRate.Index        ] := 0;
            GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewRowState.Index      ] := null;
          end;
          if GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsName.Index    ] = EmptyStr then
            ShowMsg(GoodsGridTableViewGoodsCode.Caption+msgMustInput, true);
        finally
          FinishQuery;
        end;
      end
      else
      begin
        ShowMsg(GoodsGridTableViewGoodsCode.Caption+msgMustInput, true);
        GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsName.Index     ] := EmptyStr;
        GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index     ] := 0;
        GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCSalePrice.Index   ] := 0;
        GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCRate.Index        ] := 0;
        GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewUseYN.Index         ] := false;
        GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewRowState.Index      ] := null;
      end;
    end

    // 영수증별 행사
    else if (ReceiptGridTableView.Focused)  and
            (ReceiptGridTableView.Controller.IsNewItemRowFocused) and // 신규 레코드 입력
            (ReceiptGridTableView.Controller.FocusedColumnIndex = ReceiptGridTableViewReceiptNo.Index) then // 영수증번호에 포커스가 있을 때
    begin
      ReceiptGridTableView.DataController.PostEditingData;
    end;
end;

procedure TCodeEventForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 조회조건에서 키보드를 누를 때
procedure TCodeEventForm.CopyMenuItemClick(Sender: TObject);
begin
  inherited;
  CopyEventCode := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDCCode.Index];
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 취소 버튼
procedure TCodeEventForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;

  // 그리드 내용도 모두 지운다
  GoodsGridTableView.DataController.Cancel;
  GoodsGridTableView.DataController.RecordCount   := 0;
  ReceiptGridTableView.DataController.Cancel;
  ReceiptGridTableView.DataController.RecordCount   := 0;
  GridDeleteButton.Enabled := false;
  DoGridLink;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창에서 포커스가 나갈 때
procedure TCodeEventForm.EditExit(Sender: TObject);
begin
  inherited;

  // 할인기간 From 보다 To가 더 빠르면 From 날짜와 같게 수정한다
  if (Sender = DCSaleDateFromEdit) and
     ((DCSaleDateFromEdit.Text = EmptyStr) or ((DCSaleDateToEdit.Text <> EmptyStr) and (DCSaleDateToEdit.CurrentDate < DCSaleDateFromEdit.CurrentDate))) then
    DCSaleDateFromEdit.Date := DCSaleDateToEdit.Date
  else if (Sender = DCSaleDateToEdit) and
          ((DCSaleDateToEdit.Text = EmptyStr) or ((DCSaleDateFromEdit.Text <> EmptyStr) and (DCSaleDateToEdit.CurrentDate < DCSaleDateFromEdit.CurrentDate))) then
    DCSaleDateToEdit.Date := DCSaleDateFromEdit.CurrentDate;
end;
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TCodeEventForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = DCSaleDateFromEdit then
  begin
    if DCSaleDateFromEdit.CurrentDate > DCSaleDateToEdit.CurrentDate then
      DCSaleDateToEdit.Date := DCSaleDateFromEdit.CurrentDate;
  end
  else if Sender = DCSaleDateToEdit then
  begin
    if DCSaleDateToEdit.CurrentDate < DCSaleDateFromEdit.CurrentDate then
      DCSaleDateFromEdit.Date := DCSaleDateToEdit.CurrentDate;
  end;

  // 날짜를 바꿀 때 할인 중인지 아닌지 표시한다
  if (Sender = DCSaleDateFromEdit) or (Sender = DCSaleDateToEdit) then
  begin
    GoodsGridTableView.NewItemRow.Visible   := true;
    ReceiptGridTableView.NewItemRow.Visible   := true;

    GoodsSearchButton.Enabled := true;
    GridDeleteButton.Enabled  := true;

    DCStatusEdit.Style.TextColor := clWindowText;
    if (DCSaleDateFromEdit.Text = EmptyStr) or (DCSaleDateToEdit.Text = EmptyStr) then
      DCStatusEdit.Text := EmptyStr
    //종료행사
    else if (Date > DCSaleDateToEdit.CurrentDate) then
    begin
      DCStatusEdit.Text := ConditionToolBarComboBox.Properties.Items[3];
      GoodsGridTableView.NewItemRow.Visible   := false;
      ReceiptGridTableView.NewItemRow.Visible   := false;

      GoodsSearchButton.Enabled := false;
      GridDeleteButton.Enabled  := false;
    end
    else if (Date < DCSaleDateFromEdit.CurrentDate) then
      DCStatusEdit.Text := ConditionToolBarComboBox.Properties.Items[2]
    else if (GridTableView.DataController.FocusedRecordIndex >= 0) and (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUseYN.Index] = 'N') then
    begin
      DCStatusEdit.Text := '취소 행사';
      DCStatusEdit.Style.TextColor := clRed;
      GoodsGridTableView.NewItemRow.Visible   := false;
      ReceiptGridTableView.NewItemRow.Visible   := false;

      GoodsSearchButton.Enabled := false;
      GridDeleteButton.Enabled  := false;
    end
    else
      DCStatusEdit.Text := ConditionToolBarComboBox.Properties.Items[1];

    ButtonToolBarDeleteButton.Enabled := ((DCStatusEdit.Text = '진행 행사') or (DCStatusEdit.Text = '예정 행사') or (DCStatusEdit.Text = '')) and not isNew;
  end

  else if Sender =DcAllTimeCheckBox then
  begin
    if DcAllTimeCheckBox.Checked then
    begin
      DCTimeFromEdit.EditValue := '오전 12:00:00';
      DCTimeToEdit.EditValue   := '오전 12:00:00';
      DCTimeFromEdit.Enabled   := false;
      DCTimeToEdit.Enabled     := false;
    end
    else
    begin
      DCTimeFromEdit.Enabled   := true;
      DCTimeToEdit.Enabled     := true;
    end;
  end;

end;
//------------------------------------------------------------------------------
// (할인번호) 생성 버튼
procedure TCodeEventForm.DCCodeCreateButtonClick(Sender: TObject);
begin
  inherited;
  DCCodeEdit.Text := GetEventNo;
end;

//------------------------------------------------------------------------------
// (적용요일) 전체 버튼
procedure TCodeEventForm.DCWeeklySelectAllButtonClick(Sender: TObject);
begin
  inherited;

  // 선택 안된 것이 하나라도 있으면 전체 선택
  if not DCWeeklyMonCheckBox.Checked or
     not DCWeeklyTueCheckBox.Checked or
     not DCWeeklyWedCheckBox.Checked or
     not DCWeeklyThuCheckBox.Checked or
     not DCWeeklyFriCheckBox.Checked or
     not DCWeeklySatCheckBox.Checked or
     not DCWeeklySunCheckBox.Checked then
  begin
    DCWeeklyMonCheckBox.Checked  := true;
    DCWeeklyTueCheckBox.Checked  := true;
    DCWeeklyWedCheckBox.Checked  := true;
    DCWeeklyThuCheckBox.Checked  := true;
    DCWeeklyFriCheckBox.Checked  := true;
    DCWeeklySatCheckBox.Checked  := true;
    DCWeeklySunCheckBox.Checked  := true;
  end
  // 전체 선택이 되어 있으면 전체 취소
  else
  begin
    DCWeeklyMonCheckBox.Checked  := false;
    DCWeeklyTueCheckBox.Checked  := false;
    DCWeeklyWedCheckBox.Checked  := false;
    DCWeeklyThuCheckBox.Checked  := false;
    DCWeeklyFriCheckBox.Checked  := false;
    DCWeeklySatCheckBox.Checked  := false;
    DCWeeklySunCheckBox.Checked  := false;
  end;
end;
//------------------------------------------------------------------------------
// 할인율을 적용할 때
procedure TCodeEventForm.DCRateEditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vIndex: Integer;
begin
  inherited;

  // 그리드에 등록된 값이 있으면 변경할건지 물어본다
  // 상품
  if DCGrid.ActiveLevel = GoodsGridLevel then
  begin
  end;
end;
function TCodeEventForm.GetEventNo: String;
var vResult   : Boolean;
    vTempData,
    vParamsType,
    vResultStr :String;
    vFirstRow  :Integer;
begin
  Result := EmptyStr;
  try
    OpenQuery('select lpad(Ifnull(Max(NO_SPC),0)+1, 4, ''0'') '
             +'  from MS_SPC_H '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [HeadStoreCode,
              StoreCode]);
    Result := Query.Fields[0].AsString;
  finally
    FinishQuery;
  end;
end;

procedure TCodeEventForm.GoodsBatchButtonClick(Sender: TObject);
var vIndex,
    vRow :Integer;
begin
  inherited;
  with TCodeBatchHelpForm.Create(Self) do
    try
      WorkType := 2;
      if ShowModal = mrOK then
      begin
        Self.GoodsGridTableView.BeginUpdate;
        for vIndex := 0 to AddGridTableView.DataController.RecordCount-1 do
        begin
          RequestGoodsCode := RequestGoodsCode + IfThen(RequestGoodsCode = EmptyStr, EmptyStr, ', ') + ''''+AddGridTableView.DataController.Values[vIndex,AddGridTableViewGoodsCode.Index]+'''';
          // 기존에 등록된 상품은 무시한다
          vRow := Self.GoodsGridTableView.DataController.FilteredIndexByRecordIndex[Self.GoodsGridTableView.DataController.FindRecordIndexByText(0, Self.GoodsGridTableViewGoodsCode.Index, AddGridTableView.DataController.Values[vIndex,AddGridTableViewGoodsCode.Index], false, false, true)];
          if vRow >= 0 then
          begin
            Continue;
          end;
          // 등록되지 않은 상품은 추가한다
          Self.GoodsGridTableView.DataController.AppendRecord;
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewGoodsCode.Index  ] := AddGridTableView.DataController.Values[vIndex,AddGridTableViewGoodsCode.Index];
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewGoodsName.Index  ] := AddGridTableView.DataController.Values[vIndex,AddGridTableViewGoodsName.Index];
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewSalePrice.Index  ] := AddGridTableView.DataController.Values[vIndex,AddGridTableViewMasterSalePrice.Index];
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewDCSalePrice.Index] := AddGridTableView.DataController.Values[vIndex,AddGridTableViewMasterSalePrice.Index];
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewDCRate.Index     ] := CalcDCRate(Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewSalePrice.Index], Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewDCSalePrice.Index]);
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewUseYN.Index      ] := 1;
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.RecordCount-1, Self.GoodsGridTableViewRowState.Index]    := rsInsert;
        end;
        Self.GoodsGridTableView.DataController.Post;
        Self.GoodsGridTableView.EndUpdate;
        isChanged := true;
        // 행사구분을 수정하지 못하게 막는다
      end;
    finally
      Free;
    end
end;

procedure TCodeEventForm.GoodsBatchPopupMenuRequestClick(Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 팝업 onPopup 이벤트
procedure TCodeEventForm.GoodsCopyPopupMenuPopup(Sender: TObject);
begin
  inherited;
  if (GridTableView.DataController.RecordCount = 0) or (GridTableView.DataController.GetFocusedRecordIndex < 0) then
  begin
    CopyMenuItem.Enabled  := false;
    PasteMenuItem.Enabled := false;
  end
  else
  begin
    CopyMenuItem.Enabled  := true;
    PasteMenuItem.Enabled := (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDCCode.Index] <> CopyEventCode) and  (CopyEventCode <> EmptyStr);
  end;
end;

//------------------------------------------------------------------------------
// (그리드) 상품 찾기 버튼
procedure TCodeEventForm.GoodsSearchButtonClick(Sender: TObject);
var
  vGoodsCode: string;
  vIndex    : Integer;
begin
  inherited;

  if DCGrid.ActiveLevel = GoodsGridLevel then
    if InputBox('아래 목록 중 찾고 싶은 메뉴코드/이름을 입력하십시오(메뉴코드:전체, 이름:앞글자 또는 전체).', vGoodsCode) then
    begin
      if (GetOnlyNumber(vGoodsCode) = vGoodsCode) then
        vIndex := GoodsGridTableView.DataController.FindRecordIndexByText(0, GoodsGridTableViewGoodsCode.Index, vGoodsCode, false, false, true)
      else
        vIndex := GoodsGridTableView.DataController.FindRecordIndexByText(GoodsGridTableView.Controller.FocusedRecordIndex+1, GoodsGridTableViewGoodsName.Index, vGoodsCode, true, true, true);
      if vIndex >= 0 then
      begin
        GoodsGridTableView.ViewData.Records[vIndex].Selected := not GoodsGridTableView.ViewData.Records[vIndex].Selected and GoodsGridTableView.ViewData.Records[vIndex].IsData;
        GoodsGridTableView.Controller.FocusedRecordIndex     := vIndex;
        Grid.SetFocus;
      end
      else
        MsgBox('아래 목록에 찾는 메뉴가 없습니다.');
    end;
end;
//------------------------------------------------------------------------------
// (그리드) 삭제 버튼
procedure TCodeEventForm.GridDeleteButtonClick(Sender: TObject);
const
  msgAskDelete = '삭제 대신 그리드의 ''사용'' 체크를 푸는 것을 권장합니다.'#13'정말 삭제하시겠습니까?';
var vRowIndex :Integer;
    vIndex    :Integer;
begin
  inherited;

  // 상품
  if DCGrid.ActiveLevel = GoodsGridLevel then
  begin
    if GoodsGridTableView.Controller.IsNewItemRowFocused then
    begin
      GoodsGridTableView.DataController.Cancel;
      isChanged := true;
    end
    else if (GoodsGridTableView.DataController.RecordCount > 0) and (GoodsGridTableView.DataController.FocusedRecordIndex >= 0) and
            AskBox(msgAskDelete) then
    begin
      // 선택한 레코드를 삭제한다
      //신규로 입력한 레코드는 삭제한다
      if GoodsGridTableView.DataController.Values[GoodsGridTableView.Controller.FocusedRecordIndex, GoodsGridTableViewRowState.Index] = rsInsert then
        GoodsGridTableView.DataController.DeleteFocused
      else
      begin
        //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
        vRowIndex := GoodsGridTableView.Controller.FocusedRecordIndex;
        GoodsGridTableView.DataController.Values[GoodsGridTableView.Controller.FocusedRecordIndex, GoodsGridTableViewRowState.Index] := rsDelete;
        GoodsGridTableView.DataController.AppendRecord;
        for vIndex := 0 to GoodsGridTableView.ColumnCount-1 do
          GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.RecordCount-1, vIndex] := GoodsGridTableView.DataController.Values[vRowIndex, vIndex];
        GoodsGridTableView.DataController.DeleteRecord(vRowIndex);
      end;
      isChanged := true;
    end;
    // 행사구분을 수정하지 못하게 막는다
  end

  // 영수증별행사
  else if DCGrid.ActiveLevel = ReceiptGridLevel then
  begin
    if ReceiptGridTableView.Controller.IsNewItemRowFocused then
    begin
      ReceiptGridTableView.DataController.Cancel;
      isChanged := true;
    end
    else if (ReceiptGridTableView.DataController.RecordCount > 0) and (ReceiptGridTableView.DataController.FocusedRecordIndex >= 0) and
            AskBox(msgAskDelete) then
    begin
      ReceiptGridTableView.DataController.DeleteFocused;
      isChanged := true;
    end;
    // 행사구분을 수정하지 못하게 막는다
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드에 포커스가 들어갈 때
procedure TCodeEventForm.GridEnter(Sender: TObject);
begin
  inherited;

  FocusedGrid := TcxGrid(Sender);
end;
//------------------------------------------------------------------------------
// 그리드에서 포커스가 나갈 때
procedure TCodeEventForm.GridExit(Sender: TObject);
begin
  inherited;

  FocusedGrid := nil;
end;
//------------------------------------------------------------------------------
// (행사목록 그리드) 스타일 변경
procedure TCodeEventForm.GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  // 사용 여부가 N인 것은 흐리게 표시한다
  if ARecord.Values[2] = '1' then
    AStyle := StyleFontGray;
end;

procedure TCodeEventForm.MenuBathAddButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      GridTableView.OptionsSelection.MultiSelect := true;
      if ShowModal = mrOK then
      begin

      end;
    finally
      free;
    end;
end;

procedure TCodeEventForm.PasteMenuItemClick(Sender: TObject);
begin
  inherited;
  try
    ExecQuery('delete from MS_SPC_D '
             +' where CD_HEAD =:P0 '
             +'   and CD_STORE=:P1 '
             +'   and NO_SPC  =:P2;',
              [HeadStoreCode,
               StoreCode,
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDCCode.Index]],
               false);

    ExecQuery('insert into MS_SPC_D(CD_HEAD, CD_STORE, NO_SPC, CD_MENU, PR_SALE, DC_RATE, YN_USE) '
             +'            select CD_HEAD, '
             +'                   CD_STORE, '
             +'                   :P3, '
             +'                   CD_MENU, '
             +'                   PR_SALE, '
             +'                   DC_RATE, '
             +'                   YN_USE '
             +'              from MS_SPC_D '
             +'             where CD_HEAD  =:P0 '
             +'               and CD_STORE =:P1 '
             +'               and NO_SPC   =:P2;',
              [HeadStoreCode,
               StoreCode,
               CopyEventCode,
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDCCode.Index]],
               true);
     DoGridLink;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

//------------------------------------------------------------------------------
// (할인 그리드) 레벨을 변경할 때
procedure TCodeEventForm.DCGridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
  inherited;

  // 상품
  if DCGrid.ActiveLevel = GoodsGridLevel then
  begin
    GoodsSearchButton.Enabled := true;
  end
  // 상품분류
  else if DCGrid.ActiveLevel = ReceiptGridLevel then
  begin
    GoodsSearchButton.Enabled := false;
  end;
end;

procedure TCodeEventForm.DcRateChangeButtonClick(Sender: TObject);
var vIndex :Integer;
    vRate  :String;
begin
  inherited;
  if (GoodsGridTableView.DataController.RecordCount = 0) then Exit;
  if InputBox('할인율을 입력하세요', vRate, 5, false, true) then
    if AskBox('이미 등록한 메뉴의 할인율을 변경하시겠습니까?') then
    begin
      for vIndex := 0 to GoodsGridTableView.DataController.RecordCount-1 do
      begin
        GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewDCSalePrice.Index]    := CalcOptionNumber(GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewSalePrice.Index] * (100 - StrToFloat(vRate)) / 100, 142);
        GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewDCRate.Index]         := CalcDCRate(GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewSalePrice.Index], GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewDCSalePrice.Index]);
        if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] = rsNormal then
          GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] := rsUpdate;
      end;
      isChanged := true;
    end;
end;

//==============================================================================
// 상품 그리드
//------------------------------------------------------------------------------
// (상품 그리드) 레코드를 적용하기 전
procedure TCodeEventForm.GoodsGridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
var
  vIndex: Integer;
  vChanged :Boolean;
begin
  inherited;
  vChanged := true;
  if ADataController.NewItemRowFocused then
  begin
    // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
    if Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index], EmptyStr) = EmptyStr then
    begin
      // 기존에 입력된 값을 저장해 놓는다
      SetLength(BackupData[0], GoodsGridTableView.ColumnCount);
      for vIndex := 0 to GoodsGridTableView.ColumnCount-1 do
        BackupData[0][vIndex] := ADataController.Values[-1, vIndex];
      // Post를 취소한다
      ADataController.Cancel;
      vChanged := false;
    end

    // 새로 추가한 상품과 동일한 상품을 미리 불러놓았다면 해당 상품 목록을 지운다
    else
      for vIndex := ADataController.RecordCount-1 downto 0 do
        if ADataController.Values[vIndex, GoodsGridTableViewGoodsCode.Index] = ADataController.Values[ADataController.NewItemRecordIndex, GoodsGridTableViewGoodsCode.Index] then
        begin
          if AskBox(Format('%s(%s) 메뉴가 이미 등록되어 있습니다.'#13'기존 자료를 수정하시겠습니까?'#13'''아니요''를 누르면 지금 입력한 값이 취소됩니다.', [String(ADataController.Values[ADataController.NewItemRecordIndex, GoodsGridTableViewGoodsName.Index]), String(ADataController.Values[ADataController.NewItemRecordIndex, GoodsGridTableViewGoodsCode.Index])])) then
          begin
            ADataController.Values[vIndex, GoodsGridTableViewGoodsName.Index  ] := ADataController.Values[ADataController.NewItemRecordIndex, GoodsGridTableViewGoodsName.Index  ];
            ADataController.Values[vIndex, GoodsGridTableViewSalePrice.Index  ] := ADataController.Values[ADataController.NewItemRecordIndex, GoodsGridTableViewSalePrice.Index  ];
            ADataController.Values[vIndex, GoodsGridTableViewDCSalePrice.Index] := ADataController.Values[ADataController.NewItemRecordIndex, GoodsGridTableViewDCSalePrice.Index];
            ADataController.Values[vIndex, GoodsGridTableViewDCRate.Index     ] := ADataController.Values[ADataController.NewItemRecordIndex, GoodsGridTableViewDCRate.Index     ];
          end;
          // Post를 취소한다
          ADataController.Cancel;
          vChanged := false;
          break;
        end;
  end;

  if vChanged then
  begin
    if ADataController.Values[ADataController.FocusedRecordIndex, GoodsGridTableViewRowState.Index] = rsNormal then
      ADataController.Values[ADataController.FocusedRecordIndex, GoodsGridTableViewRowState.Index] := rsUpdate;
  end;
end;
//------------------------------------------------------------------------------
// (상품 그리드) 레코드를 적용한 후
procedure TCodeEventForm.GoodsGridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
begin
  inherited;

  if not isLoading then
    isChanged := true;

  // 행사구분을 수정하지 못하게 막는다
  GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.GetFocusedRecordIndex, GoodsGridTableViewSeq.Index] := GoodsGridTableView.DataController.RecordCount;
end;
//------------------------------------------------------------------------------
// (상품 그리드) 다른 레코드로 옮길 때
procedure TCodeEventForm.GoodsGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vIndex: Integer;
begin
  inherited;
  // 신규 상태에서 비 정상적으로 다른 레코드를 선택했다면 다시 신규 상태로 만든다
  if ((APrevFocusedRecord = nil) or (APrevFocusedRecord.Index = GoodsGridTableView.DataController.NewItemRecordIndex)) and
     (Assigned(BackupData[0])) and (High(BackupData[0]) = GoodsGridTableView.ColumnCount-1) then
  begin
    // 새 레코드에 기존에 입력된 값을 강제로 다시 넣는다
    GoodsGridTableView.DataController.NewItemRowFocused := true;
    for vIndex := 0 to GoodsGridTableView.ColumnCount-1 do
      GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, vIndex] := BackupData[0][vIndex];
  end;

  SetLength(BackupData[0], 0);
  BackupData[0] := nil;

  // 신규 레코드가 아니면 상품코드를 고칠 수 없게 만든다
//  GoodsGridTableView.OptionsSelection.CellSelect := (GoodsGridTableView.Controller.IsNewItemRowFocused) and (GoodsGridTableView.NewItemRow.Visible);
  GoodsGridTableViewGoodsCode.Options.Editing  := GoodsGridTableView.Controller.IsNewItemRowFocused;
  GoodsGridTableViewGoodsCode.Options.Focusing := GoodsGridTableView.Controller.IsNewItemRowFocused;
  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  GridDeleteButton.Enabled                       := (not GoodsGridTableView.Controller.IsNewItemRowFocused) and (GoodsGridTableView.NewItemRow.Visible);
end;
//------------------------------------------------------------------------------
// (상품 그리드) 상품코드 도움말 버튼을 누를 때
procedure TCodeEventForm.GoodsGridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index] <> null then
  begin
    if not SearchGoods(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewGoodsCode.Index]) then
      GoodsGridTableView.Controller.FocusedColumn := GoodsGridTableViewGoodsCode;
  end
  else if not SearchGoods then
      GoodsGridTableView.Controller.FocusedColumn := GoodsGridTableViewGoodsCode;
end;

procedure TCodeEventForm.GoodsGridTableViewGoodsCodePropertiesChange(
  Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// (상품 그리드) 할인율이 0 인것은 스타일 적용
procedure TCodeEventForm.GoodsGridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if (GoodsGridTableView.DataController.RecordCount = 0) or (AItem = nil) then Exit;

  if GoodsGridLevel.Active and  (AItem <> nil) and (AItem.Index = GoodsGridTableViewDCSalePrice.Index) then
    if ARecord.Values[GoodsGridTableViewDCRate.Index] = 0 then
      AStyle := StyleFontRed;
end;

procedure TCodeEventForm.GoodsGridTableViewUseYNPropertiesChange(
  Sender: TObject);
begin
  inherited;
  GoodsGridTableView.DataController.Post;
  isChanged := true;
end;

procedure TCodeEventForm.GoodsGridTableViewDCBuyPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// (상품 그리드) 행사판매가를 검증할 때
procedure TCodeEventForm.GoodsGridTableViewDCSalePricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  // 행사 판매가가 정상 판매가보다 클 때
  if (GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index] <> null) and
     (StoF(DisplayValue) > StoF(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index])) then
    ShowMsg(Format('%s가 %s보다 큽니다.', [GoodsGridTableViewDCSalePrice.Caption, GoodsGridTableViewSalePrice.Caption]), true);

  if (GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index] <> null) and (DisplayValue <> null) then
    GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewDCRate.Index] := CalcDCRate(GoodsGridTableView.DataController.Values[GoodsGridTableView.DataController.FocusedRecordIndex, GoodsGridTableViewSalePrice.Index], DisplayValue);

end;
//------------------------------------------------------------------------------
// (상품 그리드) 적용수량 표시
procedure TCodeEventForm.GoodsGridTableViewApplyQtyStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// (영수증별행사  그리드) 레코드를 적용한 후
procedure TCodeEventForm.ClassGridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
begin
  inherited;

  if not isLoading then
    isChanged := true;

  // 행사구분을 수정하지 못하게 막는다
end;
procedure TCodeEventForm.ClassTreeViewExit(Sender: TObject);
begin
  inherited;
end;


//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 할인율 계산
procedure TCodeEventForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var
  vDone: Boolean;
begin
//  inherited;

  if not AskBox('지금부터 행사가 종료됩니다.'#13'정말 행사를 종료하시겠습니까?') then
    Exit;

  try
    vDone := false;

    // 할인 적용된 적이 있으면 사용 여부를 N로 수정한다
    OpenQuery('select exists(select * '
             +'                from  SL_SALE_D '
             +'               where   CD_HEAD  = :P0 '
             +'                 and   CD_STORE = :P1 '
             +'                 and   NO_SPC   = :P2) ',
              [HeadStoreCode,
               StoreCode,
               DCCodeEdit.Text],false);

    if Query.Fields[0].AsInteger = 1 then
    begin
      ExecQuery('update MS_SPC_H '
               +'set    YN_USE    = ''N'', '
               +'       DT_CHANGE = NOW() '
               +'where  CD_HEAD   = :P0 '
               +'  and  CD_STORE  = :P1 '
               +'  and  NO_SPC    = :P2;',
                [HeadStoreCode,
                 StoreCode,
                 DCCodeEdit.Text],
                 true);
      vDone := true;
    end
    // 할인 적용된 적이 없으면 자료를 삭제한다
    else
    begin
      MsgBox('판매된 상품이 없어 행사가 삭제됩니다.');
      ExecQuery('delete from MS_SPC_H '
               +'where  CD_HEAD  = :P0 '
               +'  and  CD_STORE = :P1 '
               +'  and  NO_SPC   = :P2;'
               +'delete from MS_SPC_D '
               +'where  CD_HEAD  = :P0 '
               +'  and  CD_STORE = :P1 '
               +'  and  NO_SPC   = :P2;',
                [HeadStoreCode,
                 StoreCode,
                 DCCodeEdit.Text],
                 true);
    end;
    Query.Close;

    ClearEdit;
    GoodsGridTableView.DataController.Cancel;
    GoodsGridTableView.DataController.RecordCount   := 0;
    ReceiptGridTableView.DataController.Cancel;
    ReceiptGridTableView.DataController.RecordCount   := 0;
    GridDeleteButton.Enabled := false;
    if not vDone then
    begin
      GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
      GridTableView.DataController.FocusedRecordIndex := GridTableView.DataController.RecordCount-1;
    end;
    DoGridLink;
    if vDone then
      MsgBox('행사가 종료(중단) 되었습니다.');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;

end;

function TCodeEventForm.CalcDCRate(aAmount, aDCAmount: Currency): Currency;
begin
  if aAmount <> 0 then
    Result := RoundNumber((aAmount - aDCAmount) / aAmount * 100, 0.01)
  else
    Result := 0;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 이익률 계산 (aGubun :B 매입단가 변경시, S:판매단가 변경시
function TCodeEventForm.CalcProfitRate(aBuyPrice, aSalePrice: Currency; aGubun:String): Currency;
begin
  if aGubun = 'B' then
  begin
    if aSalePrice <> 0 then
      Result := RoundNumber(100 - Currency(aBuyPrice) / aSalePrice * 100, 0.01)
    else
      Result := 0;
  end
  else if aGubun = 'S' then
  begin
    if aSalePrice <> 0 then
      Result := RoundNumber(100 - aBuyPrice / aSalePrice * 100, 0.01)
    else
      Result := 0;
  end
  else
    Result := 0;
end;

//------------------------------------------------------------------------------
// 상품 찾기
function TCodeEventForm.SearchGoods(aGoods: string):Boolean;
var
  vIndex, vIndex1  : Integer;
  vSaleAmt: string;
begin
  result := false;
  // 상품 바코드를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := '메뉴 조회';
      GridTableViewCode.Caption  := GoodsGridTableViewGoodsCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := GoodsGridTableViewGoodsName.Caption;
      GridTableViewName1.Width   := 170;
      GridTableViewName2.Caption := '매입단가';
      GridTableViewName2.Width   := 70;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;
      GridTableViewName3.Caption := '판매단가';
      GridTableViewName3.Width   := 70;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;

      GridTableView.OptionsSelection.MultiSelect := false;

      SearchText := aGoods;
      SQLText    := 'select   CD_MENU, '
                   +'         NM_MENU, '
                   +'         PR_BUY, '
                   +'         PR_SALE '
                   +'from     MS_MENU '
                   +'where    CD_HEAD  = :P0 '
                   +'  and    CD_STORE = :P1 '
                   +'  and   (CD_MENU like ConCat(:P2,''%'') '
                   +'      or NM_MENU like ConCat(''%'',:P2,''%'') or NM_MENU_SHORT like ConCat(''%'',:P2,''%'')) '
                   +'  and    DS_MENU_TYPE in (''N'', ''C'', ''O'',''S'') '
                   +'  and    YN_USE   = ''Y'' '
                   +'order by CD_MENU';
      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        result := true;
        for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        begin
          vIndex1 := GoodsGridTableView.DataController.FilteredIndexByRecordIndex[GoodsGridTableView.DataController.FindRecordIndexByText(0, GoodsGridTableViewGoodsCode.Index, GridTableView.Controller.SelectedRecords[vIndex].Values[0], false, false, true)];
          if vIndex1 >= 0 then Continue;

          Self.GoodsGridTableViewGoodsCode.EditValue := GridTableView.Controller.SelectedRecords[vIndex].Values[0];
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewGoodsName.Index  ] := GridTableView.Controller.SelectedRecords[vIndex].Values[1];
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewSalePrice.Index  ] := StoF(GridTableView.Controller.SelectedRecords[vIndex].Values[3]);
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewDCSalePrice.Index] := StoF(GridTableView.Controller.SelectedRecords[vIndex].Values[3]);
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewDCRate.Index     ] := CalcDCRate(Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewSalePrice.Index], Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewDCSalePrice.Index]);
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewUseYN.Index      ] := True;
          Self.GoodsGridTableView.DataController.Values[Self.GoodsGridTableView.DataController.FocusedRecordIndex, Self.GoodsGridTableViewRowState.Index   ] := rsInsert;
          Self.GoodsGridTableView.Controller.FocusedColumnIndex := Self.GoodsGridTableViewDCSalePrice.Index;
        end;

        Self.GoodsGridTableView.Controller.FocusedColumnIndex := Self.GoodsGridTableViewDCSalePrice.Index;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 조회
function TCodeEventForm.DoSearch: Boolean;
begin
  Result := false;
  OpenQuery('select   NO_SPC, '
           +'         NM_SPC, '
           +'         case when (Date_Format(Now(), ''%Y%m%d'') > DT_TO) or (YN_USE = ''N'') then ''N'' else ''Y'' end as YN_USE '
           +'from     MS_SPC_H '
           +'where    CD_HEAD  = :P0 '
           +'  and    CD_STORE = :P1 '
           +'  and   (NO_SPC like ConCat(''%'',:P2,''%'') or NM_SPC like ConCat(''%'',:P2,''%'')) '
           +'  and   ((:P3 = 0) '
           +'     or  (:P3 = 1 and Date_Format(Now(), ''%Y%m%d'') between DT_FROM and DT_TO and YN_USE = ''Y'') '
           +'     or  (:P3 = 2 and Date_Format(Now(), ''%Y%m%d'') < DT_FROM) '
           +'     or  (:P3 = 3 and Date_Format(Now(), ''%Y%m%d'') > DT_TO)) '
           +'order by NO_SPC',
            [HeadStoreCode,
             StoreCode,
             ConditionToolBarEdit.Text,
             ConditionToolBarComboBox.ItemIndex]);
  try
    GridTableView.DataController.RecordCount        := 0;
    GoodsGridTableView.DataController.Cancel;
    GoodsGridTableView.DataController.RecordCount   := 0;
    ReceiptGridTableView.DataController.Cancel;
    ReceiptGridTableView.DataController.RecordCount   := 0;
    GridDeleteButton.Enabled := false;
    if not Query.Eof then
      Result := DM.ReadQuery(Query, GridTableView);
    DoGridLink;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TCodeEventForm.DoGridLink;
begin
  inherited;

  GridTableView.DataController.Cancel;
  if (GridTableView.DataController.FocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDCCode.Index] = null) then
    Exit;

  isLoading := true;
  // 행사 정보를 불러온다
  try
    OpenQuery('select  DT_FROM, '
             +'        DT_TO, '
             +'        TIME_FROM, '
             +'        TIME_TO, '
             +'        WEEKLY, '
             +'        YN_USE '
             +'  from  MS_SPC_H '
             +' where  CD_HEAD  = :P0 '
             +'   and  CD_STORE = :P1 '
             +'   and  NO_SPC   = :P2',
              [HeadStoreCode,
               StoreCode,
               GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDCCode.Index]]);
    if not Query.Eof then
    begin
      DCCodeEdit.Text                := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDCCode.Index];
      DCCodeEdit.TabStop             := false;
      DCCodeEdit.Properties.ReadOnly := true;
      DCCodeEdit.Style.Color         := clrDisabled;
      DCNameEdit.Text                := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDCName.Index];
      DCSaleDateFromEdit.Date        := StoD(Query.Fields[0].AsString);
      DCSaleDateToEdit.Date          := StoD(Query.Fields[1].AsString);
      DCTimeFromEdit.Time            := StoT(Query.Fields[2].AsString);
      DCTimeToEdit.Time              := StoT(Ifthen(Query.Fields[3].AsString='24:00','00:00', Query.Fields[3].AsString));
      if (DCTimeFromEdit.EditValue = '오전 12:00:00') and (DCTimeToEdit.EditValue= '오전 12:00:00') then
      begin
        DCTimeFromEdit.Enabled    := false;
        DCTimeToEdit.Enabled      := false;
        DcAllTimeCheckBox.Checked := true;
      end
      else
        DcAllTimeCheckBox.Checked := false;

      DCWeeklySunCheckBox.Checked    := Copy(Query.Fields[4].AsString,1,1) = '1';
      DCWeeklyMonCheckBox.Checked    := Copy(Query.Fields[4].AsString,2,1) = '1';
      DCWeeklyTueCheckBox.Checked    := Copy(Query.Fields[4].AsString,3,1) = '1';
      DCWeeklyWedCheckBox.Checked    := Copy(Query.Fields[4].AsString,4,1) = '1';
      DCWeeklyThuCheckBox.Checked    := Copy(Query.Fields[4].AsString,5,1) = '1';
      DCWeeklyFriCheckBox.Checked    := Copy(Query.Fields[4].AsString,6,1) = '1';
      DCWeeklySatCheckBox.Checked    := Copy(Query.Fields[4].AsString,7,1) = '1';



      if (Query.Fields[5].AsString = 'N') or (FormatDateTime('yyyymmdd', DCSaleDateToEdit.Date) < FormatDateTime('yyyymmdd',Now()))  then
        DCStatusEdit.Text := '종료 행사'
      else if (Query.Fields[5].AsString = 'Y') and (FormatDateTime('yyyymmdd', DCSaleDateFromEdit.Date) > FormatDateTime('yyyymmdd',Now())) then
        DCStatusEdit.Text := '예정 행사'
      else if Query.Fields[5].AsString = 'Y' then
        DCStatusEdit.Text := '진행 행사';
    end;
  finally
    FinishQuery;
  end;

  if (DCStatusEdit.Text = '종료 행사') or (DCStatusEdit.Text = '취소 행사') then
  begin
    GoodsGridTableView.OptionsSelection.CellSelect   := false;
    ReceiptGridTableView.OptionsSelection.CellSelect   := false;
  end
  else
  begin
    GoodsGridTableView.OptionsSelection.CellSelect   := true;
    ReceiptGridTableView.OptionsSelection.CellSelect   := true;
  end;


  // 아래 그리드를 불러온다
  try
    OpenQuery('select a.CD_MENU, '
             +'       b.NM_MENU, '
             +'       b.PR_SALE as PR_SALE_M, '
             +'       a.PR_SALE, '
             +'       GetProfitRate(a.PR_SALE, b.PR_SALE) as DC_RATE, '
             +'       case when IfNull(a.YN_USE,''Y'') = ''Y'' then 1 else 0 end as YN_USE, '
             +'       0 as SEQ, '
             +'       ''rsNormal'' as ROW_STATE '
             +'  from MS_SPC_D as a  inner join '
             +'       MS_MENU  as b on a.CD_HEAD  = b.CD_HEAD '
             +'                    and a.CD_STORE = b.CD_STORE '
             +'                    and a.CD_MENU  = b.CD_MENU '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.NO_SPC   = :P2',
              [HeadStoreCode,
               StoreCode,
               DCCodeEdit.Text]);
    DM.ReadQuery(Query, GoodsGridTableView);
  finally
    isLoading := false;
  end;
end;
//------------------------------------------------------------------------------
// 신규
function TCodeEventForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    // 할인번호를 자동으로 생성한다
    DCCodeCreateButton.Click;

    // 코드 자동 증가이면
    if CheckOption(2) then
    begin
      DCCodeEdit.Style.Color         := clrDisabled;
      DCCodeEdit.TabStop             := false;
      DCCodeEdit.Properties.ReadOnly := true;
    end
    // 코드 수동 증가
    else
    begin
      DCCodeEdit.Style.Color         := clWindow;
      DCCodeEdit.TabStop             := true;
      DCCodeEdit.Properties.ReadOnly := false;
    end;
    if MainPanel.Enabled and DCNameEdit.Enabled then
      DCNameEdit.SetFocus;

    // 기본값들을 선택한다
    DCSaleDateFromEdit.Date      := Date;
    DCSaleDateToEdit.Date        := Date;
    DCTimeFromEdit.Time          := EncodeTime(0,0,0,0);
    DCTimeToEdit.Time            := EncodeTime(0,0,0,0);
    DCWeeklyMonCheckBox.Checked  := true;
    DCWeeklyTueCheckBox.Checked  := true;
    DCWeeklyWedCheckBox.Checked  := true;
    DCWeeklyThuCheckBox.Checked  := true;
    DCWeeklyFriCheckBox.Checked  := true;
    DCWeeklySatCheckBox.Checked  := true;
    DCWeeklySunCheckBox.Checked  := true;
    GoodsGridTableView.OptionsSelection.CellSelect   := true;
    ReceiptGridTableView.OptionsSelection.CellSelect := true;

    // 그리드 삭제
    GoodsGridTableView.DataController.Cancel;
    GoodsGridTableView.DataController.RecordCount   := 0;
    ReceiptGridTableView.DataController.Cancel;
    ReceiptGridTableView.DataController.RecordCount := 0;
    GridDeleteButton.Enabled := false;
  finally
    isLoading := false;
  end;
  Result := true;
end;
//------------------------------------------------------------------------------
// 저장
function TCodeEventForm.DoSave: Boolean;
var
  vIndex: Integer;
  vTemp : Boolean;
  vRate : Currency;
begin
  Result := false;

  // 행사코드
  if GetOnlyNumber(DCCodeEdit.Text) = EmptyStr then
  begin
    ErrBox(DCCodeLabel.Caption+msgMustInput);
    if MainPanel.Enabled and DCCodeEdit.Enabled then
      DCCodeEdit.SetFocus;
    Exit;
  end
  // 행사이름
  else if Trim(DCNameEdit.Text) = EmptyStr then
  begin
    ErrBox(DCNameLabel.Caption+msgMustInput);
    if MainPanel.Enabled and DCNameEdit.Enabled then
      DCNameEdit.SetFocus;
    Exit;
  end
  // 행사기간
  else if DCSaleDateFromEdit.Text = EmptyStr then
  begin
    ErrBox(DCSaleDateLabel.Caption+msgMustInput);
    if MainPanel.Enabled and DCSaleDateFromEdit.Enabled then
      DCSaleDateFromEdit.SetFocus;
    Exit;
  end
  else if (DCSaleDateToEdit.Text = EmptyStr) or (DCSaleDateToEdit.CurrentDate < DCSaleDateFromEdit.CurrentDate) then
  begin
    ErrBox(DCSaleDateLabel.Caption+msgMustInput);
    if MainPanel.Enabled and DCSaleDateToEdit.Enabled then
      DCSaleDateToEdit.SetFocus;
    Exit;
  end
  // 적용요일
  else if not DCWeeklyMonCheckBox.Checked and
          not DCWeeklyTueCheckBox.Checked and
          not DCWeeklyWedCheckBox.Checked and
          not DCWeeklyThuCheckBox.Checked and
          not DCWeeklyFriCheckBox.Checked and
          not DCWeeklySatCheckBox.Checked and
          not DCWeeklySunCheckBox.Checked then
  begin
    ErrBox(Format('%s을 하나 이상 선택하십시오.', [Trim(DCWeeklyGroupBox.Caption)]));
    if MainPanel.Enabled and DCWeeklyMonCheckBox.Enabled then
      DCWeeklyMonCheckBox.SetFocus;
    Exit;
  end
  // 상품 그리드
  else
  begin
    GoodsGridTableView.DataController.PostEditingData;
    if GoodsGridTableView.DataController.RecordCount = 0 then
      vTemp := false
    else
    begin
      vTemp := true;
      for vIndex := 0 to GoodsGridTableView.DataController.RecordCount-1 do
      begin
        if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] = rsDelete then Continue;
        if (Nvl(GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewGoodsName.Index],   EmptyStr) = EmptyStr) then
        begin
          vTemp := false;
          break;
        end;
      end;
    end;
    if not vTemp then
    begin
      //행사상품을 붙여넣기 할 수 있엇 행사상품이 없어도 저장 할 수있게 한다
      if not AskBox('행사 메뉴가 없습니다.'+#13+'저장하시겠습니까?') then
      begin
//            ErrBox('상품 목록을 정상적으로 입력하지 않았습니다.');
        if MainPanel.Enabled and DCGrid.Enabled then
          DCGrid.SetFocus;
        Exit;
      end;
    end;

    vTemp := true;
    for vIndex := 0 to GoodsGridTableView.DataController.RecordCount-1 do
    begin
      if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] = rsDelete then Continue;
      if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewSalePrice.Index] < GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewDCSalePrice.Index] then
      begin
        vTemp := false;
        break;
      end;
    end;

    if not vTemp then
    begin
      //행사상품을 붙여넣기 할 수 있엇 행사상품이 없어도 저장 할 수있게 한다
      if not AskBox('행사판매가가 정상판매가보다 큰 메뉴가 있습니다.'+#13+'저장하시겠습니까?') then
      begin
        GoodsGridTableView.Controller.FocusedRecordIndex := vIndex;
        if MainPanel.Enabled and DCGrid.Enabled then
          DCGrid.SetFocus;
        Exit;
      end;
    end;
  end;

  // 저장
  try
    for vIndex := 0 to GoodsGridTableView.DataController.RecordCount-1 do
    begin
      if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] = rsNormal then Continue;

      if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete from MS_SPC_D '
                 +' where CD_HEAD  = :P0 '
                 +'   and CD_STORE = :P1 '
                 +'   and NO_SPC   = :P2 '
                 +'   and CD_MENU  = :P3; ',
                  [HeadStoreCode,
                   StoreCode,
                   DCCodeEdit.Text,
                   GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewGoodsCode.Index]],
                   false);
      end
      else
      begin
        ExecQuery(Ifthen(GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] = rsInsert,
                  'insert into MS_SPC_D(CD_HEAD, CD_STORE, NO_SPC, CD_MENU, PR_SALE, DC_RATE, YN_USE) '
                 +'             values (:P0, :P1, :P2, :P3, :P4, :P5, :P6);',
                  'update MS_SPC_D '
                  +'  set PR_SALE =:P4, '
                 +'       DC_RATE =:P5, '
                 +'       YN_USE  =:P6 '
                 +' where CD_HEAD  = :P0 '
                 +'   and CD_STORE = :P1 '
                 +'   and NO_SPC   = :P2 '
                 +'   and CD_MENU  = :P3; '),
                  [HeadStoreCode,
                   StoreCode,
                   DCCodeEdit.Text,
                   GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewGoodsCode.Index],
                   Nvl(GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewDCSalePrice.Index], 0.0),
                   Nvl(GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewDCRate.Index],      0.0),
                   Ifthen(GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewUseYN.Index], 'Y', 'N')],
                   false);
      end;
    end;

    // 마스터 저장
    Result := ExecQuery(IfThen(isNew, 'insert into MS_SPC_H(CD_HEAD, CD_STORE, NO_SPC, NM_SPC, DT_FROM, DT_TO, WEEKLY, TIME_FROM, TIME_TO,  YN_USE, CD_SAWON_CHG, DT_CHANGE) '
                                     +'             values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, ''Y'', :P9, Now());',
                                      'update MS_SPC_H '
                                     +'   set NM_SPC      = :P3, '
                                     +'       DT_FROM     = :P4, '
                                     +'       DT_TO       = :P5, '
                                     +'       WEEKLY      = :P6, '
                                     +'       TIME_FROM   = :P7, '
                                     +'       TIME_TO     = :P8, '
                                     +'       YN_USE      = ''Y'', '
                                     +'       CD_SAWON_CHG = :P9, '
                                     +'       DT_CHANGE   = Now() '
                                     +' where CD_HEAD     = :P0 '
                                     +'   and CD_STORE    = :P1 '
                                     +'   and NO_SPC      = :P2;'),
                       [HeadStoreCode,
                        StoreCode,
                        DCCodeEdit.Text,
                        DCNameEdit.Text,
                        DtoS(DCSaleDateFromEdit.CurrentDate),
                        DtoS(DCSaleDateToEdit.CurrentDate),
                        IfThen(DCWeeklySunCheckBox.Checked, '1', '0')+IfThen(DCWeeklyMonCheckBox.Checked, '1', '0')+IfThen(DCWeeklyTueCheckBox.Checked, '1', '0')+IfThen(DCWeeklyWedCheckBox.Checked, '1', '0')+IfThen(DCWeeklyThuCheckBox.Checked, '1', '0')+IfThen(DCWeeklyFriCheckBox.Checked, '1', '0')+IfThen(DCWeeklySatCheckBox.Checked, '1', '0'),
                        FormatDateTime(fmtTime, DCTimeFromEdit.Time),
                        Ifthen(FormatDateTime(fmtTime, DCTimeToEdit.Time)='00:00','24:00',FormatDateTime(fmtTime, DCTimeToEdit.Time)),
                        UserCode],
                        true);
    if Result then
    begin
      //그리드를 조회상태로 변경한다
      GoodsGridTableView.DataController.BeginUpdate;
      for vIndex := GoodsGridTableView.DataController.RecordCount-1 downto 0 do
      begin
        if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] = rsDelete then
          GoodsGridTableView.DataController.DeleteRecord(vIndex)
        else
          GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewRowState.Index] := rsNormal;
      end;
      GoodsGridTableView.DataController.EndUpdate;

      if isNew then
      begin
        SetLength(NewData, 3);
        NewData[0] := DCCodeEdit.Text;
        NewData[1] := DCNameEdit.Text;
        NewData[2] := 'Y';
      end
      else if GridTableView.DataController.FocusedRecordIndex >= 0 then
      begin
        GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewDCName.Index] := DCNameEdit.Text;
        GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewUseYN.Index]  := 'Y';
        EditPropertiesChange(DCSaleDateFromEdit);
      end;
    end;

    RequestGoodsCode := EmptyStr;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
