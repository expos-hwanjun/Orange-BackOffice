unit BuyBuy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, Math,
  cxCurrencyEdit, cxSpinEdit, cxGridLevel, cxGridCustomTableView, tmsXLSAdapter,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxCheckBox,
  cxMemo, ExtCtrls, AdvToolBarStylers, cxGridBandedTableView, Menus,
  cxLookAndFeelPainters, cxButtons, cxLookAndFeels, DBAccess, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, dxmdaset, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TBuyBuyForm = class(TInheritEditForm)
    MainPanel: TPanel;
    CompanyCodeLabel: TLabel;
    CommentLabel: TLabel;
    CompanyNameEdit: TcxTextEdit;
    CommentMemo: TcxMemo;
    CompanyCodeEdit: TcxButtonEdit;
    ButtonToolBarNewButton: TAdvGlowButton;
    BuyAmtLabel: TLabel;
    BuyTotalAmtEdit: TcxCurrencyEdit;
    CashBuyCheckBox: TcxCheckBox;
    ConditionToolBarBuyNoEdit: TcxButtonEdit;
    LockCheckBox: TcxCheckBox;
    ButtonToolBarCancelButton: TAdvGlowButton;
    Del_Timer: TTimer;
    RemainAmtEdit: TcxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    NowReaminAmtEdit: TcxCurrencyEdit;
    GridPanel: TPanel;
    Grid: TcxGrid;
    GridLevel: TcxGridLevel;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewBuyQty: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewBuyNetAmt: TcxGridColumn;
    GridTableViewBuyVatAmt: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    DCAmtEdit: TcxCurrencyEdit;
    Label3: TLabel;
    GridTableViewVatYN: TcxGridColumn;
    GridTableViewSeq: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    Label4: TLabel;
    BuyAmtEdit: TcxCurrencyEdit;
    GridTableViewBuyNotAmt: TcxGridColumn;
    StatusEdit: TcxTextEdit;
    GridTableViewDsGoods: TcxGridColumn;
    GridTableViewSpec: TcxGridColumn;
    GridTableViewRequestLoaded: TcxGridColumn;
    GridTableViewRequestDate: TcxGridColumn;
    GoodsPanel: TPanel;
    Label14: TLabel;
    GoodsEdit: TcxTextEdit;
    BuyTypeLabel: TLabel;
    BuyTypeComboBox: TcxComboBox;
    GridTableViewFixType: TcxGridColumn;
    GoodsSearchButton: TAdvGlowButton;
    GridDeleteButton: TAdvGlowButton;
    GoodsFindButton: TAdvGlowButton;
    GoodsBatchButton: TAdvGlowButton;
    ExcelLoadButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridDeleteButtonClick(Sender: TObject);
    procedure GridBandedTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridBandedTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GridBandedTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridBandedTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridBandedTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewBuyQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewBuyPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridBandedTableViewBuyAmtPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure GoodsFindButtonClick(Sender: TObject);
    procedure ConditionToolBarBuyNoEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConditionToolBarBuyNoEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure GridBandedTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Del_TimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewBuyPricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewBuyAmtPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewBuyQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ExcelLoadButtonClick(Sender: TObject);
    procedure GoodsSearchButtonClick(Sender: TObject);
    procedure GoodsEditKeyPress(Sender: TObject; var Key: Char);
    procedure ConditionToolBarFromDateEditExit(Sender: TObject);
    procedure GoodsBatchButtonClick(Sender: TObject);
  private
    BackupData : array of Variant;
    AcctRefNo    :String;    //현금매입시 출납코드 번호
    CompanyTax   :String;    //매입처 세무구분(0:면세, 1:과세(포함))
    IsCalcAmts       :Boolean;
    LinkRowIndex     :Integer;

    procedure DisabledCompanyCode;
    function  SearchCompany(aCompany: string = ''): string;
    function  SearchGoods(aGoods: string = ''): string;
    procedure CalcAmts(aAllRows: Boolean = false);
    procedure SetRemainAmt;
  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSearch: Boolean; override;
    function  DoSave  : Boolean; override;
  end;

var
  BuyBuyForm: TBuyBuyForm;

implementation

uses
  Common, Help, ExcelLoad, CodeBatchHelp, Main, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyBuyForm.FormCreate(Sender: TObject);
begin
  inherited;
  IsCalcAmts  := true;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TBuyBuyForm.FormShow(Sender: TObject);
var vCode : PStrPointer;
begin
  inherited;

  BuyTypeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'B';
  BuyTypeComboBox.Properties.Items.AddObject('매입', TObject(vCode));
  New(vCode);
  vCode^.Data := 'R';
  BuyTypeComboBox.Properties.Items.AddObject('반품', TObject(vCode));
  BuyTypeComboBox.ItemIndex := 0;

  isChanged := false;
  //매입정정에서 실행시켰을때
  //##### 이벤트 처리
  if Length(FormParam[0]) = 14 then
  begin
    ConditionToolBarFromDateEdit.Date := StoD(LeftStr(FormParam[0],10));
    ConditionToolBarBuyNoEdit.Text    := RightStr(FormParam[0],4);
    ButtonToolBarSearchButton.Click;
    ButtonToolBarSearchButton.Visible := False;
    ButtonToolBarNewButton.Visible    := False;
    ConditionToolBarBuyNoEdit.Properties.ReadOnly    := True;
    ConditionToolBarFromDateEdit.Properties.ReadOnly := True;
    FormParam[0] := EmptyStr;
  end
  else
    ButtonToolBarNewButton.Click;
end;
procedure TBuyBuyForm.GridBandedTableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TBuyBuyForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      Ord('B') : if GoodsBatchButton.Enabled then GoodsBatchButton.Click;
      Ord('D') : if GridDeleteButton.Enabled  then GridDeleteButton.Click;
    end;
  end
  else
    case Key of
      VK_DOWN,
      VK_UP   :
        if GridTableView.Controller.IsNewItemRowFocused then
        begin
          Key := 0;
          Exit;
        end;
      VK_RETURN :
        begin
          if CompanyCodeEdit.Focused and (Trim(CompanyCodeEdit.Text) = EmptyStr) then
            CompanyCodeEditPropertiesButtonClick(nil,0);

          if GridTableView.Focused and (GridTableView.Controller.FocusedColumn = GridTableViewBuyAmt) then
          begin
            GoodsEdit.SetFocus;
            Key := 0;
            Exit;
          end;
        end;
      VK_F1 :
        begin
          if GridTableView.Focused and (GridTableView.Controller.FocusedColumn = GridTableViewGoodsCode) then
          begin
            GridTableViewGoodsCodePropertiesButtonClick(nil,0);
            Key := 0;
            Exit;
          end;
        end;
    end;

  inherited;
end;

procedure TBuyBuyForm.FormResize(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 매입번호에서 키보드를 누를 때
procedure TBuyBuyForm.ConditionToolBarBuyNoEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

procedure TBuyBuyForm.ConditionToolBarBuyNoEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption := '매입 조회';
      GridTableViewCode.Caption  := '매입번호';
      GridTableViewCode.Width    := 60;
      GridTableViewName1.Caption := '거래처이름';
      GridTableViewName1.Width   := 250;
      GridTableViewName1.Visible := true;
      GridTableViewName2.Caption := '매입금액';
      GridTableViewName2.Width   := 80;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

      SearchText := '';
      SQLText    := 'select  b.NO_BUY, '
                   +'        t.NM_TRDPL, '
                   +'        b.AMT_BUY '
                   +'  from  SL_BUY_H b inner join '
                   +'        MS_TRD   t on b.CD_HEAD = t.CD_HEAD and b.CD_STORE = t.CD_STORE and b.CD_TRDPL = t.CD_TRDPL '
                   +' where  b.CD_HEAD  =:P0 '
                   +'   and  b.CD_STORE =:P1 '
                   +'   and  b.YMD_BUY  = '''+DtoS(ConditionToolBarFromDateEdit.CurrentDate)+''' '
                   +'   and  b.DS_BUY in '+Ifthen(Self.Tag=0, '(''0'',''1'')', '(''2'',''3'')')
                   +'   and  t.NM_TRDPL like ConCat(''%'',:P2,''%'') '
                   +' order by  b.NO_BUY';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        ConditionToolBarBuyNoEdit.Text := Code;
        DoSearch;
      end;
    finally
      Free;
    end;
end;

procedure TBuyBuyForm.ConditionToolBarFromDateEditExit(Sender: TObject);
begin
  inherited;
  if not isDate(DtoS(ConditionToolBarFromDateEdit.CurrentDate)) then
  begin
    MsgBox(Format('%s가 올바르지 않습니다',[ConditionToolBarDateLabel.Caption]));
    ConditionToolBarFromDateEdit.SetFocus;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TBuyBuyForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  if isChanged then
  begin
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  inherited;
end;

//------------------------------------------------------------------------------
// 취소 버튼
procedure TBuyBuyForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if AskBox('현재 작업을 모두 취소하시겠습니까?') then
  begin
    GridDeleteButton.Enabled := false;
    // 매입정정에서 넘어왔을 때는 폼을 닫는다
    if not ButtonToolBarNewButton.Visible then
    begin
      Close;
      FormParam[0] := 'BuyBuy';
      ExtremeMainForm.RunProgram('BuyModify');
    end
    else
    begin
      ConditionToolBarBuyNoEdit.Clear;
      isChanged := false;
      ConditionToolBarBuyNoEdit.Enabled := true;
      GoodsPanel.Enabled      := false;
      BuyTypeComboBox.Enabled := true;
      CompanyCodeEdit.Enabled := true;
      CompanyCodeEdit.Clear;
      GridTableView.DataController.Cancel;
      GridTableView.DataController.RecordCount := 0;
      ConditionToolBarFromDateEdit.Date := now;
      RemainAmtEdit.Value    := 0;
      NowReaminAmtEdit.Value := 0;
      CompanyCodeEdit.SetFocus;
    end;
  end;
end;
procedure TBuyBuyForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 신규 버튼
procedure TBuyBuyForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  isChanged := false;
  if not ButtonToolBarNewButton.Visible or not ButtonToolBarNewButton.Enabled then
    Exit;

  if UpperCase(UserCode)= 'master' then
  begin
    ErrBox('master 사용자로는 매입을 할 수 없습니다.');
    Exit;
  end;
  inherited;

  if isChanged then
  begin
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  // 월마감이 된 달에는 매입을 할 수 없다
  if CheckMonthClose('S', DtoS(ConditionToolBarFromDateEdit.CurrentDate))then
  begin
    ErrBox('월 마감이 된 월에는 매입을 할 수 없습니다.');
    Exit;
  end;

  try
    GridTableView.BeginUpdate;
    ClearEdit;
    ConditionToolBarBuyNoEdit.Text    := EmptyStr;
    ConditionToolBarBuyNoEdit.Enabled := true;
    CompanyCodeEdit.Enabled           := true;
    BuyTypeComboBox.Enabled           := true;
    CompanyCodeEdit.TabStop                        := true;
    CompanyCodeEdit.Properties.ReadOnly            := false;
    CompanyCodeEdit.Style.Color                    := clWindow;
    CompanyCodeEdit.Properties.Buttons[0].Enabled  := true;
    CashBuyCheckBox.Enabled                        := true;
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    GridTableView.DataController.RecordCount := 0;
    GridPanel.Enabled := false;
    ShowMsg('신규 매입을 입력합니다.');

    BuyAmtEdit.Value        := 0;

    GoodsBatchButton.Enabled := true;

    MainPanel.Enabled := true;
//    GridTableView.OptionsView.NewItemRow      := true;
    GridTableView.OptionsSelection.CellSelect := true;
    LockCheckBox.Checked := false;
    LockCheckBox.Visible := true;
    LockCheckBox.Enabled := true;
    isChanged         := false;

    if CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
  finally
    GridTableView.EndUpdate;
  end;
end;

//==============================================================================
// 메인 패널
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TBuyBuyForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;

  if (Sender = CompanyCodeEdit) and (CompanyNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(CompanyCodeEdit.EditingText) <> CompanyCodeEdit.EditingText) or (Length(CompanyCodeEdit.EditingText) <> 6)) then
  begin
    CompanyNameEdit.Text := EmptyStr;
    GridTableView.DataController.RecordCount := 0;
    GridPanel.Enabled         := false;
  end
  else if (Sender = CashBuyCheckBox) then
    CalcAmts(True);

//  else if Sender = DcAmtEdit then CalcAmts(True);

end;


//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TBuyBuyForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vCode, vName, vTax   : string;
begin
  inherited;

  // 할인금액
  if Sender = DCAmtEdit then
  begin
    DCAmtEdit.Value := DisplayValue;
    CalcAmts(True);
  end

  // 거래처
  else if Sender = CompanyCodeEdit then
  begin
    if DisplayValue <> EmptyStr then
      try
        OpenQuery('select    CD_TRDPL, '
                  +'         NM_TRDPL, '
                  +'         DS_TAX '
                  +'from     MS_TRD  '
                  +'where    CD_HEAD  =:P0 '
                  +'  and    CD_STORE =:P1 '
                  +'  and    DS_TRDPL = ''B'' '
                  +'  and    (CD_TRDPL =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                  +'order by CD_TRDPL',
                  [HeadStoreCode,
                   StoreCode,
                   DisplayValue]);
        if not Query.Eof then
        begin
          // 일단 첫번째 값을 받아 놓는다
          vCode           := Query.Fields[0].AsString;
          vName           := Query.Fields[1].AsString;
          vTax            := Query.Fields[2].AsString;
          // 쿼리 다음 줄로 이동해 본다
          Query.Next;
          // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
          if Query.Eof then
          begin
            CompanyCodeEdit.Text     := vCode;
            GridPanel.Enabled        := true;
            DisplayValue             := vCode;
            CompanyNameEdit.Text     := vName;
            CompanyTax               := vTax;
          end
          // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
          else
          begin
            FinishQuery;
            DisplayValue := SearchCompany(DisplayValue);
          end;
          GridPanel.Enabled  := True;
          GoodsPanel.Enabled := true;
          GoodsEdit.SetFocus;
        end
        else
        begin
          ErrorText := Replace(CompanyCodeLabel.Caption)+msgMustInput;
          Error     := true;
        end;
      finally
        FinishQuery;
      end;
    SetRemainAmt;
  end;
end;


procedure TBuyBuyForm.CompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  // 거래처를 조회한다
  if CompanyCodeEdit.Text <> EmptyStr then
    CompanyCodeEdit.Text := SearchCompany(CompanyCodeEdit.Text)
  else
    CompanyCodeEdit.Text := SearchCompany;

  if CompanyNameEdit.Text <> EmptyStr then
  begin
    BuyTypeComboBox.Enabled := false;
    GoodsPanel.Enabled      := true;
    GridPanel.Enabled       := true;
    GoodsEdit.SetFocus;

//    Grid.FocusedView := GridTableView;
//    GridTableView.Navigator.Buttons.Insert.Click;
//    GridTableView.Controller.FocusedColumnIndex := GridTableViewGoodsCode.Index;
  end;
end;

procedure TBuyBuyForm.ExcelLoadButtonClick(Sender: TObject);
var
  vName      : array of string;
  vNotNull   : array of Boolean;
  vRemark    : array of string;

  vXLSAdapter : TXLSAdapter;
  vXLSFile    : TXLSFile;
  vIndex, vRowIndex: Integer;
  vDupGoodsCount,
  vInsertedGoodsCount: Integer;
  vDupGoodsCode: string;
  vEndMessage  : string;
  vXLSGoodsCode: string;
  vGoodsCode   : string;
  vIsDup       : Boolean;
  vRecordIndex : Integer;
  vBuyPrice    : Currency;
  vBuyQty      : Currency;
begin
  inherited;
  if CompanyNameEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(CompanyCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    Exit;
  end
  else
  begin
  // 엑셀 칼럼지정 폼을 띄운다
  with TExcelLoadForm.Create(self) do
    try
      SetLength(vName,    3);
      SetLength(vNotNull, 3);
      SetLength(vRemark,  3);
      vName[0] := '상품코드';
      vName[1] := '매입수량';
      vName[2] := '매입단가';
      vNotNull[0] := True;
      vNotNull[1] := True;
      vNotNull[2] := True;


      if SetColumn(vName, vNotNull, vRemark) then
        if ShowModal = mrOK then
        begin
          // 엑셀 파일을 읽어 그리드에 넣는다
          vXLSAdapter := TXLSAdapter.Create(self);
          vXLSFile    := TXLSFile.Create(vXLSAdapter);
          vXLSFile.Connect;
          vXLSFile.OpenFile(ExcelFileEdit.Text);
          vDupGoodsCode             := EmptyStr;
          vDupGoodsCount            := 0;
          vInsertedGoodsCount       := 0;
          try
            GridTableView.DataController.BeginUpdate;
            GridTableView.DataController.RecordCount := 0;

            vIndex := 2;
            while True do
            begin
              vXLSGoodsCode := Trim(string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]));
              //바코드가 없으면 패스
              if vXLSGoodsCode = EmptyStr then
                break
              else
              begin
                if vXLSGoodsCode = EmptyStr then
                  break;

                // 상품마스터에서 해당 상품을 찾아본다
                OpenQuery('select    CD_MENU, '                                //0
                         +'          NM_MENU, '
                         +'          PR_BUY, '                                             //1
                         +'          DS_TAX, '
                         +'          case when DS_MENU_TYPE in (''N'',''G'') and QTY_UNIT > 1 then ''W'' else DS_MENU_TYPE end as DS_MENU , '
                         +'          NM_SPEC '
                         +' from     MS_MENU  '
                         +'where     CD_HEAD  =:P0 '
                         +'  and     CD_STORE =:P1 '
                         +'  and     CD_MENU  =:P2 '
                         +'  and     YN_USE   =''Y'' '
                         +'  and     DS_STOCK =''1'' '
                         +'order by  CD_MENU',
                         [HeadStoreCode,
                          StoreCode,
                          vXLSGoodsCode]);
                try
                  try
                    if not Query.Eof then
                    begin
                      vRowIndex := GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Query.FieldByName('CD_MENU').AsString, false, false, true)];
                      if (vRowIndex >= 0) then
                      begin
                        Inc(vDupGoodsCount);
                        vDupGoodsCode := vDupGoodsCode + IfThen(vDupGoodsCode = EmptyStr, EmptyStr, ', ') + vXLSGoodsCode;
                      end
                      else
                      begin
                        vBuyPrice := vXLSFile.CellValue[vIndex, ColumnComboBox[2].ItemIndex];
                        if GetStrPointerData(BuyTypeComboBox) = 'B' then
                          vBuyQty := Currency(vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex])
                        else
                          vBuyQty := Currency(vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex]) * -1;

                        GridTableView.DataController.AppendRecord;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]         := Query.FieldByName('CD_MENU').AsString;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]         := Query.FieldByName('NM_MENU').AsString;
                        if (Query.FieldByName('DS_TAX').AsString = '0') then // 매입단가가 부가세 포함이거나 면세 상품일 때
                          GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyPrice.Index]        := vBuyPrice
                        else // 매입 단가가 공급가일 때
                          GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyPrice.Index]        := CeilNumber(vBuyPrice / TaxRate, 0.01);
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewVatYN.Index]             := Query.FieldByName('DS_TAX').AsString;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDsGoods.Index]           := Query.FieldByName('DS_MENU').AsString;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSpec.Index]              := Query.FieldByName('NM_SPEC').AsString;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyQty.Index]            := vBuyQty;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyAmt.Index]            := 0;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyNetAmt.Index]         := 0;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyVatAmt.Index]         := 0;
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewFixType.Index]           := 'P';
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewRowState.Index]          := rsInsert;
                        Inc(vInsertedGoodsCount);
                      end;
                    end;
                    CalcAmts(True);
                    Grid.SetFocus;
                    Grid.FocusedView := GridTableView;
                except
                  ErrBox(Format('엑셀 파일을 불러올 수 없습니다.'#13'엑셀 칼럼을 잘못 지정했거나, 엑셀 파일에 잘못된 값이 들어 있는 것 같습니다.'#13#13'에러 줄(레코드) : %d', [vIndex]));
                  Break;
                end;
              finally
                FinishQuery;
              end;
            end;
            Inc(vIndex);
            isChanged := true;
          end;
          finally
            GridTableView.DataController.EndUpdate;
            vXLSFile.Disconnect;
            vXLSFile.Free;
            vXLSAdapter.Free;
            // 각 금액 계산
            CalcAmts(true);
            DisabledCompanyCode;
//            GridBandedTableView.EndUpdate;
          end;

          if vInsertedGoodsCount > 0 then
            vEndMessage := Format('%s건의 엑셀 자료를 불러왔습니다.', [FormatFloat(fmtComma, vInsertedGoodsCount)])
          else
            vEndMessage := EmptyStr;

          if vDupGoodsCount > 0 then
          begin
            if vEndMessage <> EmptyStr then
              vEndMessage := vEndMessage + #13#13;
            vEndMessage := vEndMessage + Format('%s 등 %s건의 상품이 중복되어 무시했습니다.', [vDupGoodsCode, FormatFloat(fmtComma, vDupGoodsCount)]);
          end;

          if vEndMessage <> EmptyStr then
            MsgBox(vEndMessage);
        end;
    finally
      Free;
      FinishQuery;
    end;
  end;
end;

procedure TBuyBuyForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 상품 일괄등록 메뉴
procedure TBuyBuyForm.GoodsBatchButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  if CompanyNameEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(CompanyCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    Exit;
  end;

  with TCodeBatchHelpForm.Create(Self) do
    try
      WorkType    := 0;  //매입(상품일괄)
      CompanyCode := CompanyCodeEdit.Text;
      GridTableView.OptionsSelection.MultiSelect := false;
      SQLText := 'select   g.CD_MENU, '
                +'         ConCat(g.NM_MENU,Ifnull(g.NM_SPEC,'''')) as NM_MENU, '
                +'         t.NM_TRDPL, '
                +'         g.PR_BUY,  '
                +'         g.PR_SALE, '
                +'         g.PR_BUY as PR_BUY_M, '
                +'         g.PR_SALE as PR_SALE_M, '
                +'         g.DS_TAX, '
                +'         case when g.DS_MENU_TYPE in (''N'',''G'') and g.QTY_UNIT > 1 then ''W'' else g.DS_MENU_TYPE end '
                +' from    MS_MENU as g left outer join '
                +'         MS_TRD  as t on g.CD_HEAD  = t.CD_HEAD '
                +'                     and g.CD_STORE = t.CD_STORE '
                +'                     and g.CD_TRDPL = t.CD_TRDPL '
                +' where   g.CD_HEAD   = :P0 '
                +'   and   g.CD_STORE  = :P1 '
                +'   and   g.YN_USE    = ''Y'' ';
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
            if Nvl(AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyQty.Index], 0) = 0 then
              Continue;

            try
              Self.GridTableView.DataController.AppendRecord;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index]         := AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsName.Index]         := AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsName.Index];

              if (AddGridTableView.DataController.Values[vIndex, AddGridTableViewDsTax.Index] = '0') then // 매입단가가 부가세 포함이거나 면세 상품일 때
              begin
                if NVL(AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyPrice.Index],0.0) = 0 then
                  Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyPrice.Index]        := AddGridTableView.DataController.Values[vIndex, AddGridTableViewMasterBuyPrice.Index]
                else
                  Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyPrice.Index]        := AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyPrice.Index]
              end
              else // 매입 단가가 공급가일 때
              begin
                if NVL(AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyPrice.Index],0.0) = 0 then
                  Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyPrice.Index]        := CeilNumber(AddGridTableView.DataController.Values[vIndex, AddGridTableViewMasterBuyPrice.Index] / TaxRate)
                else
                  Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyPrice.Index]        := CeilNumber(AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyPrice.Index] / TaxRate);
              end;

              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyQty.Index]            := Nvl(AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyQty.Index], 0) * Ifthen(GetStrPointerData(BuyTypeComboBox)='B',1,-1);
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyAmt.Index]            := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyNetAmt.Index]         := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyNotAmt.Index]         := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyVatAmt.Index]         := 0;
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewVatYN.Index]             := AddGridTableView.DataController.Values[vIndex, AddGridTableViewDsTax.Index];
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewDsGoods.Index]           := AddGridTableView.DataController.Values[vIndex, AddGridTableViewDsGoods.Index];
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

procedure TBuyBuyForm.GoodsEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    GoodsSearchButton.Click;
  end;
end;

//------------------------------------------------------------------------------
// 상품 찾기 버튼
procedure TBuyBuyForm.GoodsFindButtonClick(Sender: TObject);
var
  vGoodsCode: string;
  vIndex    : Integer;
begin
  inherited;

  if InputBox('아래 목록 중 찾고 싶은 상품코드/이름을 입력하십시오(상품코드:전체, 이름:앞글자 또는 전체).', vGoodsCode) then
  begin
    if (Length(vGoodsCode) in [5,6,7,8, 12, 13, 14]) and (GetOnlyNumber(vGoodsCode) = vGoodsCode) then
      vIndex := GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, vGoodsCode, false, false, true)
    else
      vIndex := GridTableView.DataController.FindRecordIndexByText(GridTableView.Controller.FocusedRecordIndex+1, GridTableViewGoodsName.Index, vGoodsCode, true, true, true);
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


procedure TBuyBuyForm.GoodsSearchButtonClick(Sender: TObject);
begin
  inherited;
  if SearchGoods(GoodsEdit.Text) <> EmptyStr then
    GoodsEdit.Clear
  else
    GoodsEdit.SetFocus;
end;

//------------------------------------------------------------------------------
// 그리드 값을 적용하기 전
procedure TBuyBuyForm.GridBandedTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 그리드에 값이 적용된 후
procedure TBuyBuyForm.GridBandedTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
begin
  inherited;

end;
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TBuyBuyForm.GridBandedTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  // NewRow일때는 저장버튼을 못누르게 한다
  if (AFocusedRecord = nil) then
    ButtonToolBarSaveButton.Enabled := false
  else
    isChanged := isChanged;

  // 신규 입력일 때만 상품코드를 입력할 수 있게 한다
  GridTableViewGoodsCode.Options.Editing       := GridTableView.Controller.IsNewItemRowFocused;
  GridTableViewGoodsCode.Options.Focusing      := GridTableViewGoodsCode.Options.Editing;
  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  GridDeleteButton.Enabled                           := not GridTableView.Controller.IsNewItemRowFocused;
end;
//------------------------------------------------------------------------------
// 상품코드 도움말 버튼을 누를 때
procedure TBuyBuyForm.GridBandedTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchGoods;
end;
//------------------------------------------------------------------------------
// 상품코드를 검증할 때
procedure TBuyBuyForm.GridBandedTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vGoodsCode,
  vGoodsName,
  vDsTax      : string;
  vIndex      : Integer;
  vBuyPrice   : Currency;
begin
  inherited;

  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    if (GetOnlyNumber(DisplayValue) = DisplayValue) then
    begin
      // 상품마스터에서 해당 상품을 찾아본다
      OpenQuery('select    CD_MENU, '
               +'          NM_MENU, '
               +'          DS_TAX, '
               +'          PR_BUY '
               +'  from    MS_MENU '
               +' where    CD_HEAD  = :P0 '
               +'   and    CD_STORE = :P1 '
               +'   and    CD_MENU  Like ConCat(:P2,''%'') '
               +'   and    YN_USE   = ''Y'' '
               +' order by CD_MENU',
               [HeadStoreCode,
                StoreCode,
                DisplayValue]);
      isLoading := true;
      try
        if not Query.Eof then
        begin
          // 첫 레코드를 읽어놓는다
          vGoodsCode       := Query.Fields[0].AsString;
          vGoodsName       := Query.Fields[1].AsString;
          vDsTax           := Query.Fields[2].AsString;
          vBuyPrice        := Query.Fields[3].AsCurrency;
          // 다음 줄로 이동해 검색한 레코드가 여러 건인지 확인한다
          Query.Next;

          // 검색한 레코드가 한 건이라면 바로 적용한다
          if Query.Eof then
          begin
            vIndex := GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, vGoodsCode, false, false, true);
            if (vIndex >= 0)  then
            begin
              GridTableView.DataController.Cancel;
              LinkRowIndex := vIndex;
              Del_Timer.Enabled := true;
            end
            else
            begin
              DisplayValue := vGoodsCode;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index]         := vGoodsName;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewVatYN.Index]             := vDsTax;
              if vDsTax = '0' then // 매입단가가 부가세 포함이거나 면세 상품일 때
                GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index]        := vBuyPrice
              else // 매입 단가가 공급가일 때
                GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index]        := CeilNumber(vBuyPrice / TaxRate);
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyQty.Index]            := 0;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyAmt.Index]            := 0;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyNetAmt.Index]         := 0;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyNotAmt.Index]         := 0;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyVatAmt.Index]         := 0;
              GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewRowState.Index]          := rsInsert;
              GridTableViewGoodsName.Options.Editing  := false;
              GridTableViewGoodsName.Options.Focusing := GridTableViewGoodsName.Options.Editing;
            end;
            CalcAmts;
            Exit;
          end
          // 검색한 레코드가 여러 건이면 검색을 한다
          else
          begin
            DisplayValue := SearchGoods(DisplayValue);
            GridTableView.Controller.FocusedItemIndex := GridTableViewGoodsCode.Index;
            if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index] <> EmptyStr then
            begin
              GridTableViewGoodsName.Options.Editing  := false;
              GridTableViewGoodsName.Options.Focusing := GridTableViewGoodsName.Options.Editing;
              Exit;
            end;
          end;
        end;
      finally
        isLoading := false;
        FinishQuery;
      end;
    end
    else
    begin
      DisplayValue := SearchGoods(DisplayValue);
      if DisplayValue = EmptyStr then
      begin
        ErrorText := EmptyStr;
        Error := True;
        Keybd_Event(VK_ESCAPE,VK_ESCAPE, 0, 0);
      end;

      GridTableView.Controller.FocusedItemIndex := GridTableViewGoodsCode.Index;
      if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index] <> EmptyStr then
      begin
        GridTableViewGoodsName.Options.Editing  := false;
        GridTableViewGoodsName.Options.Focusing := GridTableViewGoodsName.Options.Editing;
        Exit;
      end;
    end;
  end
  // 상품코드를 입력하지 않았으면 모든 값을 지운다
  else
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      if (GridTableView.Columns[vIndex].DataBinding.ValueType = 'Integer') or
         (GridTableView.Columns[vIndex].DataBinding.ValueType = 'Currency') then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] := 0
      else
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] := EmptyStr;
end;
//------------------------------------------------------------------------------
// 매입수량을 검증할 때
procedure TBuyBuyForm.GridBandedTableViewBuyQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if Nvl(DisplayValue, 0) = 0 then
    Error := true
  else
  begin
    // 매입/반품에 따라 수량을 양수/음수로 바꿔준다
//    if ((BuyTypeComboBox.ItemIndex = 0) and (DisplayValue < 0)) or
//       ((BuyTypeComboBox.ItemIndex = 1) and (DisplayValue > 0)) then
//      DisplayValue := -DisplayValue;

    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyQty.Index] := DisplayValue;
    // 금액 재계산
    CalcAmts(true);
  end;
end;

//------------------------------------------------------------------------------
// 매입단가를 검증할 때
procedure TBuyBuyForm.GridBandedTableViewBuyPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index] := Nvl(DisplayValue,0.0);

  // 금액 재계산
  CalcAmts(true);
end;
//------------------------------------------------------------------------------
// 매입금액을 검증할 때
procedure TBuyBuyForm.GridBandedTableViewBuyAmtPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyQty.Index],0) = 0 then
  begin
    ErrorText := '매입수량을 입력하십시오.';
    Error     := True;
    Exit;
  end;

  // 금액 기준으로 매입단가 역산 (매입금액 / (매입수량 - 덤수량))
  if (Nvl(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewVatYN.Index], '1') = '0') then // 매입단가가 부가세 포함이거나 면세 상품일 때
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index] := RoundNumber(DisplayValue / (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyQty.Index]), 0.01)
  else // 매입단가가 공급가일 때
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index] := CeilNumber(DisplayValue / (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyQty.Index]  / TaxRate));
  // 금액 재계산
  CalcAmts;
end;

//------------------------------------------------------------------------------
// 그리드 삭제 버튼
procedure TBuyBuyForm.GridDeleteButtonClick(Sender: TObject);
var vRowIndex :Integer;
    vIndex    :Integer;
begin
  inherited;
  if not AskBox('매입상품을 삭제하시겠습니까?') then Exit;

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
  GoodsEdit.SetFocus;
end;


procedure TBuyBuyForm.GridExit(Sender: TObject);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    GridTableView.Controller.NewItemRecordFocused := false;
end;

procedure TBuyBuyForm.GridTableViewBuyAmtPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var vBuyPrice :Currency;
    vBuyQty   :Currency;
begin
  inherited;
  if NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyQty.Index],0) = 0 then
  begin
    ErrorText := '매입수량을 입력하십시오.';
    Error     := True;
    Exit;
  end;

  if GetStrPointerData(BuyTypeComboBox) = 'R' then
    DisplayValue := Abs(DisplayValue) * -1;

  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyAmt.Index] := DisplayValue;

  // 금액 기준으로 매입단가 역산 (매입금액 / (매입수량 - 덤수량))
  if Nvl(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewVatYN.Index], '1') = '0' then // 매입단가가 부가세 포함이거나 면세 상품일 때
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index] := RoundNumber(Currency(DisplayValue) / (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyQty.Index]), 0.01)
  else // 매입단가가 공급가일 때
  begin
    if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDsGoods.Index] = 'W' then
      vBuyQty := 1
    else
      vBuyQty := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyQty.Index];

    vBuyPrice := RoundNumber(Currency(DisplayValue) / vBuyQty / TaxRate, 0.01);
//    vBuyPrice := CeilNumber(vBuyPrice / TaxRate, 0.01);
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index] := vBuyPrice;
  end;

  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewFixType.Index] := 'A';
  // 금액 재계산
  CalcAmts(true);
  GridTableView.DataController.Post;
end;

procedure TBuyBuyForm.GridTableViewBuyPricePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index] := Nvl(DisplayValue,0.0);

  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewFixType.Index] := 'P';
  // 금액 재계산
  CalcAmts(true);
  GridTableView.DataController.Post;
end;

procedure TBuyBuyForm.GridTableViewBuyQtyPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var vQty : Currency;
begin
  inherited;
  vQty := Nvl(DisplayValue,0.0);
  if GetStrPointerData(BuyTypeComboBox) = 'B' then DisplayValue := ABS(vQty)
  else DisplayValue := ABS(vQty) * -1;

  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyQty.Index] := DisplayValue;

  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewFixType.Index] := 'P';
  // 금액 재계산
  CalcAmts(true);
  GridTableView.DataController.Post;
end;

procedure TBuyBuyForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  CalcAmts(True);
  DisabledCompanyCode;
  if not isLoading then
    isChanged := true;
  GoodsEdit.SetFocus;
end;

procedure TBuyBuyForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
  isChanged := true;
end;

procedure TBuyBuyForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  // NewRow일때는 저장버튼을 못누르게 한다
  if (AFocusedRecord = nil) then
    ButtonToolBarSaveButton.Enabled := false
  else
    isChanged := isChanged;

  // 신규 입력일 때만 상품코드를 입력할 수 있게 한다
  GridTableViewGoodsCode.Options.Editing       := GridTableView.Controller.IsNewItemRowFocused;
  GridTableViewGoodsCode.Options.Focusing      := GridTableViewGoodsCode.Options.Editing;

  GridDeleteButton.Enabled                     := true;
end;

procedure TBuyBuyForm.GridTableViewGoodsCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchGoods;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 거래처 코드 비활성화
procedure TBuyBuyForm.Del_TimerTimer(Sender: TObject);
begin
  inherited;
  Del_Timer.Enabled := false;
  GridTableView.Controller.FocusedRecordIndex := LinkRowIndex;
end;

procedure TBuyBuyForm.DisabledCompanyCode;
begin
  if not CompanyNameEdit.Properties.ReadOnly then
    isChanged := false;

  CompanyCodeEdit.Properties.ReadOnly := not CompanyCodeEdit.TabStop;
  if CompanyCodeEdit.TabStop then
    CompanyCodeEdit.Style.Color       := clWindow
  else
    CompanyCodeEdit.Style.Color       := clrDisabled;
  CompanyCodeEdit.Properties.Buttons[0].Enabled := CompanyCodeEdit.TabStop;

end;
//------------------------------------------------------------------------------
// 금액 등 재계산
procedure TBuyBuyForm.CalcAmts(aAllRows: Boolean);
var
  vIndex     : Integer;
  vBuyQty    : Currency;
  vBuyAmt    : Currency;
  vTemp      : Currency;
  vApplyAmt  : Currency;
  vReceiptDc : Currency;
begin
  if not IsCalcAmts then Exit;
  try
    GridTableView.BeginUpdate;
    vBuyAmt := 0;
    BuyTotalAmtEdit.Value := 0;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then Continue;

      vBuyQty := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index], 0.0);
      if vBuyQty = 0 then Continue;

      if GridTableView.DataController.Values[vIndex, GridTableViewDsGoods.Index] <> 'W' then
      begin
        if GridTableView.DataController.Values[vIndex, GridTableViewFixType.Index] <> 'A' then
        begin
          // 매입금액 (매입단가 * (매입수량))
          if Nvl(GridTableView.DataController.Values[vIndex, GridTableViewVatYN.Index], '1') = '0' then // 매입단가가 부가세 포함이거나 면세 상품일 때
            GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := RoundNumber(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index], 0.0) * vBuyQty )
          else // 매입 단가가 공급가일 때
            GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := RoundNumber(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] * TaxRate * vBuyQty, 0.01 );
        end;

        if GetStrPointerData(BuyTypeComboBox) = 'R' then GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := ABS(GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]) * -1;
      end
      else
      begin
        if GridTableView.DataController.Values[vIndex, GridTableViewFixType.Index] <> 'A' then
        begin
          // 매입금액 (매입단가 )
          if Nvl(GridTableView.DataController.Values[vIndex, GridTableViewVatYN.Index], '1') = '0' then // 매입단가가 부가세 포함이거나 면세 상품일 때
            GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := RoundNumber(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index], 0.0) )
          else // 매입 단가가 공급가일 때
            GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]  := RoundNumber(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] * TaxRate, 0.01);
        end;

        if GetStrPointerData(BuyTypeComboBox) = 'R' then GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := ABS(GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]) * -1;
      end;

      GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := RoundNumber(GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]);

      BuyTotalAmtEdit.Value := BuyTotalAmtEdit.Value + GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index];

      vBuyAmt := vBuyAmt + GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index];
    end;

    if aAllRows and (BuyTotalAmtEdit.Value < DCAmtEdit.Value) then  DCAmtEdit.Value := 0;

    if not aAllRows then Exit;

    vApplyAmt := 0;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      vBuyQty := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index], 0.0);
      if vBuyQty = 0 then Continue;

      // 면세금액
      GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index]         := IfThen(GridTableView.DataController.Values[vIndex, GridTableViewVatYN.Index] = '1', 0, Currency(GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]));

      // 부가세를 먼저 계산한다
      if GridTableView.DataController.Values[vIndex, GridTableViewVatYN.Index] = '1' then
      begin
        //부가세(매입금액-공병금액 / 11)
        GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index]         := Trunc((GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]) / 11);
        GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index]         := GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index];
      end
      else
      begin
        GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index]         := 0;
        GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index]         := GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index];
      end;
    end;

    // 합계금액을 새로 구한다
    BuyAmtEdit.Value        := BuyTotalAmtEdit.Value - DCAmtEdit.Value;
    if (BuyTotalAmtEdit.Value ) >= 0 then
      DCAmtEdit.Properties.MaxValue := BuyTotalAmtEdit.Value
    else
      DCAmtEdit.Properties.MinValue := BuyTotalAmtEdit.Value;
  finally
    GridTableView.EndUpdate;
    if not CashBuyCheckBox.Checked then
      NowReaminAmtEdit.Value := RemainAmtEdit.Value + BuyAmtEdit.Value
    else
      NowReaminAmtEdit.Value := RemainAmtEdit.Value;
  end;
end;
//------------------------------------------------------------------------------
// 거래처 조회
function TBuyBuyForm.SearchCompany(aCompany: string): string;
begin
  Result := EmptyStr;

  // 거래처 조회 폼을 보여준다
  with THelpForm.Create(Self) do
    try
      Caption := '매입처 조회';
      GridTableViewCode.Caption  := '매입처 코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '매입처 이름';
      GridTableViewName1.Width   := 340;

      SearchText := aCompany;
      SQLText    := 'select    CD_TRDPL, '
                   +'          NM_TRDPL, '
                   +'          DS_TAX '
                   +' from     MS_TRD '
                   +' where    CD_HEAD   =:P0 '
                   +'   and    CD_STORE  =:P1 '
                   +'   and    DS_TRDPL  = ''B''  '
                   +'   and   (CD_TRDPL  =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                   +'   and    DS_STATUS = 0 '
                   +' order by CD_TRDPL ';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result                   := Code;
        CompanyCodeEdit.Text     := Code;
        CompanyNameEdit.Text     := Names[0];
        CompanyTax               := Names[1];
        SetRemainAmt;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 상품 조회
function TBuyBuyForm.SearchGoods(aGoods: string): string;
var vIndex :Integer;
    vQty,
    vAmt   :Integer;
    vMenuCode :String;
begin
  Result := EmptyStr;

//  if Length(aGoods) = 18 then
//  begin
//    vMenuCode := Copy(aGoods,3,6);
//    vQty      := StrToInt(Copy(aGoods, 7,5));
//    vAmt      := StrToInt(Copy(aGoods, 12,17));
//  end
//  else
//  begin
    if GetStrPointerData(BuyTypeComboBox) = 'B' then
      vQty := 1
    else
      vQty := -1;
//  end;


  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '상품 조회';
      GridTableViewCode.Caption  := Self.GridTableViewGoodsCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := Self.GridTableViewGoodsName.Caption;
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := Self.GridTableViewBuyPrice.Caption;
      GridTableViewName2.Width   := 100;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

      SearchText := aGoods;
      SQLText    := 'select    CD_MENU, '                                //0
                   +'          NM_MENU, '
                   +'          PR_BUY, '                                             //1
                   +'          DS_TAX, '
                   +'          case when DS_MENU_TYPE in (''N'',''G'') and QTY_UNIT > 1 then ''W'' else DS_MENU_TYPE end, '
                   +'          NM_SPEC '
                   +' from     MS_MENU  '
                   +'where     CD_HEAD  =:P0 '
                   +'  and     CD_STORE =:P1 '
                   +'  and     (CD_MENU like ConCat(:P2,''%'') or NM_MENU like ConCat(''%'',:P2,''%'') ) '
                   +'  and     YN_USE   = ''Y'' '
                   +'  and     DS_STOCK = ''1'' '
                   +'order by  CD_MENU';

      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Result := Code;

        vIndex := Self.GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Result, false, false, true)];
        if (vIndex >= 0) then
        begin
          Self.GridTableView.Controller.FocusedRecordIndex := vIndex;
          Result := '';
          Exit;
        end;
        Self.GridTableView.DataController.AppendRecord;
        Self.GridTableView.Controller.FocusedRecordIndex := Self.GridTableView.DataController.RecordCount-1;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsCode.Index]         := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsName.Index]         := Names[0];
        if Names[2] = '0' then // 매입단가가 부가세 포함이거나 면세 상품일 때
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBuyPrice.Index]        := StoF(Names[1])
        else // 매입 단가가 공급가일 때
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBuyPrice.Index]        := CeilNumber(StoF(Names[1]) / TaxRate, 0.01);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewVatYN.Index]             := Names[2];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewDsGoods.Index]           := Names[3];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewSpec.Index]              := Names[4];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBuyQty.Index]            := vQty;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBuyAmt.Index]            := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBuyNetAmt.Index]         := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewBuyVatAmt.Index]         := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewFixType.Index]           := 'P';
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewRowState.Index]          := rsInsert;
        Self.GridTableView.Controller.FocusedColumn :=  Self.GridTableViewBuyQty;
      end
      else
         Self.GridTableView.Controller.FocusedColumn := Self.GridTableViewGoodsCode;

      CalcAmts(True);
      Self.Grid.SetFocus;
      Self.Grid.FocusedView := Self.GridTableView;
      if StatusEdit.Tag = 1 then
        isChanged := true;
    finally
      Free;
    end;
end;
procedure TBuyBuyForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarSearchButton.Enabled := not isChanged;
  ButtonToolBarNewButton.Enabled    := not isChanged;
  ButtonToolBarCancelButton.Enabled := ButtonToolBarSaveButton.Enabled;
end;

procedure TBuyBuyForm.SetRemainAmt;
begin
  if Length(CompanyCodeEdit.Text) <> 6 then
  begin
    RemainAmtEdit.Clear;
    Exit;
  end;
  OpenQuery('select   Sum(AMT_BASE + AMT_BUY - AMT_PAY) as AMT_REMAIN '
           +'  from  (select   AMT_BASE, '
           +'                  0 as AMT_BUY, '
           +'                  0 as AMT_PAY '
           +'           from   SL_BOOKS_MONTH '
           +'          where   CD_HEAD  = :P0 '
           +'            and   CD_STORE = :P1 '
           +'            and   CD_CLOSE = ''10'' '
           +'            and   CD_CODE  = :P2 '
           +'            and   YM_CLOSE = Left(:P3,6) '
           +'         union all '
           +'         select   0 as AMT_BASE, '
           +'                  Sum(AMT_TRUST) as AMT_BUY, '
           +'                  0 as AMT_PAY '
           +'           from   SL_BUY_H '
           +'          where   CD_HEAD   =:P0 '
           +'            and   CD_STORE  =:P1 '
           +'            and   CD_TRDPL  =:P2 '
           +'            and   YMD_BUY between ConCat(Left(:P3,6),''01'') and :P3 '
           +'            and   ConCat(YMD_BUY,NO_BUY) <> :P4 '
           +'            and   AMT_TRUST <> 0 '
           +'         union all '
           +'         select   0 as AMT_BASE, '
           +'                  0 as AMT_BUY, '
           +'                  Sum(AMT_OUT+AMT_DC) as AMT_PAY '
           +'           from   SL_ACCT '
           +'          where   CD_HEAD  =:P0 '
           +'            and   CD_STORE =:P1 '
           +'            and   CD_TRDPL =:P2 '
           +'            and   CD_ACCT ='''+CreditOut+''''
           +'            and   YMD_OCCUR Between ConCat(Left(:P3,6),''01'') and :P3 '
           +'         ) as t ',
            [HeadStoreCode,
             StoreCode,
             CompanyCodeEdit.Text,
             DtoS(ConditionToolBarFromDateEdit.CurrentDate),
             DtoS(ConditionToolBarFromDateEdit.CurrentDate)+LPad(ConditionToolBarBuyNoEdit.Text, 4, '0')]);
  try
    if not Query.Eof then
    begin
      RemainAmtEdit.Value := Query.Fields[0].AsCurrency;
    end;
    if not CashBuyCheckBox.Checked then
      NowReaminAmtEdit.Value := RemainAmtEdit.Value + BuyAmtEdit.Value
    else
      NowReaminAmtEdit.Value := RemainAmtEdit.Value;
  finally
    FinishQuery;
  end;
end;

//------------------------------------------------------------------------------
// 조회
function TBuyBuyForm.DoSearch: Boolean;
var vIndex :Integer;
begin
  isLoading := true;
  ClearEdit;

  // 전표번호를 잘 입력했는지 확인한다
  if (GetOnlyNumber(ConditionToolBarBuyNoEdit.Text) <> ConditionToolBarBuyNoEdit.Text) or
     (StoI(ConditionToolBarBuyNoEdit.Text) <= 0) then
    ConditionToolBarBuyNoEdit.Text := EmptyStr;

  // 전표번호는 입력안하고 거래처만 입력했을때 조회일자에 마지막 매입전표를 조회한다
  if (ConditionToolBarBuyNoEdit.Text = EmptyStr) and (CompanyNameEdit.Text <> EmptyStr) then
  begin
    OpenQuery('select  NO_BUY, '
             +'  from  SL_BUY_H '
             +' where  CD_HEAD  = :P0 '
             +'   and  CD_STORE = :P1 '
             +'   and  YMD_BUY  = :P2 '
             +Format(' and  DS_BUY   = ''%s'' ',[Ifthen(Tag=0,'B','R')])
             +'   and  CD_TRDPL = :P3 '
             +' order by NO_BUY Desc '
             +' limit 1 ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.CurrentDate),
               CompanyCodeEdit.Text]);
    try
      if not Query.Eof then
        ConditionToolBarBuyNoEdit.Text := Query.Fields[0].AsString;
    finally
      FinishQuery;
    end;
  end;

  // 매입번호를 입력했다면 기존 자료를 불러온다
  if ConditionToolBarBuyNoEdit.Text <> EmptyStr then
  begin
    ConditionToolBarBuyNoEdit.Text := LPad(ConditionToolBarBuyNoEdit.Text, 4, '0');
    OpenQuery('select b.AMT_CASH, '                                            //0
             +'       b.CD_TRDPL, '                                            //1
             +'       t.NM_TRDPL, '                                            //2
             +'       b.REMARK, '                                              //3
             +'       b.AMT_BUY, '                                             //4
             +'       b.AMT_DC, '                                              //5
             +'       case b.DS_STATUS when ''B'' then ''정상'' when ''L'' then ''잠금'' end as DS_STATUS, '//6
             +'       NO_ACCT_REF, '    //7
             +'       t.DS_TAX, '       //8
             +'       b.DS_BUY '        //9
             +'  from SL_BUY_H as b inner join '
             +'       MS_TRD   as t on b.CD_HEAD = t.CD_HEAD and b.CD_STORE = t.CD_STORE and b.CD_TRDPL = t.CD_TRDPL  '
             +' where b.CD_HEAD  = :P0 '
             +'   and b.CD_STORE = :P1 '
             +'   and b.YMD_BUY  = :P2 '
             +'   and b.NO_BUY   = :P3 ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.CurrentDate),
               ConditionToolBarBuyNoEdit.Text]);
    try
      // 조회 결과 없는 매입 전표이면 전표번호를 지우고 신규로 처리한다
      if Query.Eof then
      begin
        ConditionToolBarBuyNoEdit.Text := EmptyStr;
        ShowMsg('매입 전표가 없습니다.', true);
      end
      else
      // 있는 매입 전표이면 정보를 표시한다
      begin
        IsCalcAmts := false;
        ConditionToolBarBuyNoEdit.Enabled := false;
        CompanyCodeEdit.Enabled     := false;
        CashBuyCheckBox.Checked     := Query.Fields[0].AsCurrency > 0;
        CompanyCodeEdit.Text        := Query.Fields[1].AsString;
        CompanyNameEdit.Text        := Query.Fields[2].AsString;
        CommentMemo.Text            := Query.Fields[3].AsString;
        BuyTotalAmtEdit.Value       := Query.Fields[4].AsCurrency;
        if BuyTotalAmtEdit.Value  >= 0 then
          DCAmtEdit.Properties.MaxValue := BuyTotalAmtEdit.Value
        else
          DCAmtEdit.Properties.MinValue := BuyTotalAmtEdit.Value;
        DCAmtEdit.Value             := Query.Fields[5].AsCurrency;
        BuyAmtEdit.Value            := Query.Fields[4].AsCurrency - Query.Fields[5].AsCurrency;
        LockCheckBox.Checked        := Query.Fields[6].AsString = '잠금';
        AcctRefNo                   := Query.Fields[7].AsString;
        CompanyTax                  := Query.Fields[8].AsString;
        StatusEdit.Text             := Query.Fields[6].AsString;
        StatusEdit.Tag              := IfThen(CashBuyCheckBox.Checked, 2, 1);
        BuyTypeComboBox.ItemIndex    := GetStrPointerIndex(BuyTypeComboBox, Query.Fields[9].AsString);
        BuyTypeComboBox.Enabled      := false;

        GridPanel.Enabled := True;
        IsCalcAmts        := true;
      end;
    finally
      FinishQuery;
    end;

    SetRemainAmt;
    // 상세 내역을 불러온다
    if ConditionToolBarBuyNoEdit.Text <> EmptyStr then
    begin
      OpenQuery('select   b.CD_GOODS, '
               +'         g.NM_MENU as NM_GOODS, '
               +'         g.NM_SPEC, '
               +'         b.QTY_BUY, '
               +'         b.PR_BUY, '
               +'         g.DS_TAX, '
               +'         b.AMT_BUY, '
               +'         b.AMT_DUTY + b.AMT_DUTYFREE as AMT_DUTY, '
               +'         b.AMT_TAX, '
               +'         b.AMT_DUTYFREE, '
               +'         case when g.DS_MENU_TYPE in (''N'',''G'') and g.QTY_UNIT > 1 then ''W'' else g.DS_MENU_TYPE end as DS_MENU_TYPE, '
               +'         b.SEQ, '
               +'         ''A'' as FIX, '
               +'         ''rsNormal'' as ROW_STATE '
               +'from     SL_BUY_D as b inner join '
               +'         MS_MENU  as g on b.CD_HEAD = g.CD_HEAD and b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_MENU '
               +'where    b.CD_HEAD  = :P0 '
               +'  and    b.CD_STORE = :P1 '
               +'  and    b.YMD_BUY  = :P2 '
               +'  and    b.NO_BUY   = :P3 '
               +'order by b.YMD_BUY, b.NO_BUY, b.SEQ, b.CD_GOODS',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 ConditionToolBarBuyNoEdit.Text]);
      DM.ReadQuery(Query, GridTableView);
    end;

    //부가세 별도 거래처일때
    GridTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if (GridTableView.DataController.Values[vIndex, GridTableViewVatYN.Index] <> '0') then
        GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] := CeilNumber(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] / TaxRate, 0.01) ;
    end;
    GridTableView.DataController.EndUpdate;

    DisabledCompanyCode;

    if CheckMonthClose('S',DtoS(ConditionToolBarFromDateEdit.CurrentDate))then
    begin
      StatusEdit.Text := '월마감';
    end;

    //잠금 전표는 수정할 수없게 한다
    if (StatusEdit.Text = '잠금') or (StatusEdit.Text = '월마감') then
    begin
      MainPanel.Enabled := false;
      GridTableView.OptionsSelection.CellSelect := false;
      LockCheckBox.Checked := true;
      LockCheckBox.Visible := true;
      LockCheckBox.Enabled := false;
      GoodsPanel.Enabled   := false;
    end
    else
    begin
      MainPanel.Enabled := true;
      GridTableView.OptionsSelection.CellSelect := true;
      LockCheckBox.Checked := false;
      LockCheckBox.Visible := true;
      LockCheckBox.Enabled := true;
      GoodsPanel.Enabled   := true;
    end;
    isChanged            := false;
    ButtonToolBarCancelButton.Enabled := true;

    if Grid.Visible and GridPanel.Enabled then
      Grid.SetFocus;
  end;

  // 매입번호를 입력하지 않으면 신규 상태로 처리한다
  if ConditionToolBarBuyNoEdit.Text = EmptyStr then
    ButtonToolBarNewButton.Click;

  Result := true;
  isLoading := false;
end;
//------------------------------------------------------------------------------
// 저장
function TBuyBuyForm.DoSave: Boolean;
var
  vIndex,
  vSeq,
  vCount       : Integer;
  vIsEvent,
  vExist     : Boolean;
  vBuyDate,
  vBuyNo     : string;
  vBuyPrice, vNet, vNot, vVat, vBottle, vSum: Currency;
  vGoodsType : string;
  vProfitRate: Currency;
  vAcctSeq,
  vAcctRef   : string;
  vGoodsSql  : string;
  vSQL,
  vGoodsCode,
  vAcctKey : string;
begin
  Result := false;

  if not CheckSurvey('') then
  begin
    if not AskBox('매입일 이후에 실사내역이 있습니다'#13'저장하시겠습니까?') then
      Exit;
  end;

  if CheckMonthClose('S', DtoS(ConditionToolBarFromDateEdit.CurrentDate)) then
    Exit;

  vCount := 0;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] <> rsDelete then
      Inc(vCount);
  end;

  if (ConditionToolBarBuyNoEdit.Text <> '') and (vCount = 0) then
  begin
    if not AskBox('매입상품이 없으면 전표가 삭제됩니다'#13'삭제하시겠습니까?') then Exit;

    vBuyDate := DtoS(ConditionToolBarFromDateEdit.CurrentDate);
    vBuyNo   := ConditionToolBarBuyNoEdit.Text;

    DM.OpenQuery('select   Count(*) '
                +'  from   SL_BUY_D  '
                +' where   CD_HEAD   =:P0 '
                +'   and   CD_STORE  =:P1 '
                +'   and   YMD_BUY   =:P2 '
                +'   and   NO_BUY    =:P3 '
                +'   and   CD_GOODS in (select CD_GOODS '
                +'                        from SL_SILSA '
                +'                       where CD_HEAD   =:P0 '
                +'                         and CD_STORE  =:P1 '
                +'                         and YM_SILSA  =Left(:P2,6) '
                +'                         and YMD_SILSA >=:P2) ',
              [HeadStoreCode,
               StoreCode,
               vBuyDate,
               vBuyNo]);
    try
      if DM.Query.Fields[0].AsInteger > 0 then
      begin
        ErrBox('삭제할려는 매입일자 이후에 실사내역이 있어'#13'매입전표를 삭제할 수 없습니다');
        Exit;
      end;
    finally
      DM.FinishQuery;
    end;

    // 현금 결제 시 연결된 출납전표를 확인한다
    OpenQuery('select   NO_ACCT_REF '
             +'from     SL_BUY_H '
             +'where    CD_HEAD  =:P0 '
             +'  and    CD_STORE =:P1 '
             +'  and    YMD_BUY  =:P2 '
             +'  and    NO_BUY   =:P3',
              [HeadStoreCode,
               StoreCode,
               vBuyDate,
               vBuyNo]);
    try
      if not Query.Eof then
        vAcctKey := Query.Fields[0].AsString
      else
        vAcctKey := '';
    finally
      FinishQuery;
    end;

    // 매입 디테일 테이블을 삭제한다
    ExecQuery('delete from SL_BUY_D '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_BUY  =:P2 '
             +'   and NO_BUY   =:P3;',
              [HeadStoreCode,
               StoreCode,
               vBuyDate,
               vBuyNo],
               false);

    // 매입 마스터 테이블을 삭제한다
    ExecQuery('delete from SL_BUY_H '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YMD_BUY  = :P2 '
             +'   and NO_BUY   = :P3;',
              [HeadStoreCode,
               StoreCode,
               vBuyDate,
               vBuyNo],
               false);
    // 현금일 때는 입출금 계정 테이블을 삭제한다
    if Length(vAcctKey) = 13 then
      ExecQuery('delete from SL_ACCT '
               +' where CD_HEAD   = :P0 '
               +'   and CD_STORE  = :P1 '
               +'   and YMD_OCCUR = :P2 '
               +'   and NO_POS    = :P3 '
               +'   and NO_ACCT   = :P4;',
                [HeadStoreCode,
                 StoreCode,
                 Copy(vAcctKey,  1, 8),
                 Copy(vAcctKey,  9, 2),
                 Copy(vAcctKey, 11, 3)],
                 false);
    if ExecQuery('', [], true) then
    begin
      Result    := true;
      isChanged := false;
      Close;
      FormParam[0] := 'BuyBuy';
      ExtremeMainForm.RunProgram('BuyModify');
    end
    else
      Exit;
  end;

  GridTableView.DataController.PostEditingData;
  vGoodsCode := EmptyStr;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if (GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete) or (GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert)
       or (GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsUpdate) then
    vGoodsCode := vGoodsCode + Format('''%s'',',[GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]]);
  end;

  if vGoodsCode <> EmptyStr then
  begin
    vGoodsCode := ' and CD_GOODS in ('+LeftStr(vGoodsCode, Length(vGoodsCode)-1)+')';
    try
      DM.OpenQuery('select Count(*) '
                  +'  from SL_SILSA '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and YM_SILSA  =Left(:P2,6) '
                  +'   and YMD_SILSA >=:P2 '
                  +vGoodsCode,
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate)]);
      if DM.Query.Fields[0].AsInteger > 0 then
      begin
        ErrBox('매입일 이후에 실사내역이 있어 매입 작업을 저장 할 수 없습니다.');
        Exit;
      end;
    finally
      DM.FinishQuery;
    end;
  end;

  if ConditionToolBarFromDateEdit.CurrentDate < Date then
  begin
    if not AskBox(Format('%s가 오늘 날짜보다 이릅니다.'#13'그대로 적용하시겠습니까?', [ConditionToolBarDateLabel.Caption])) then
    begin
      FinishQuery;
      Exit;
    end;
  end
  // 거래처
  else if CompanyCodeEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(CompanyCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
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
      if (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
         (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index],    0.0)        = 0) then
      begin
        vExist := false;
        break;
      end;
  end;
  if not vExist then
  begin
    ErrBox('신상품 이름을 등록하지 않았거나'#13'매입 수량을 입력하지 않은 레코드가 있습니다.');
    FinishQuery;
    Exit;
  end;

  CalcAmts(True);

  // 매입 저장
  try
    vSeq    := 0;
    IsCalcAmts := false;
    OpenQuery('select   Max(NO_BUY) as NO_BUY, '
             +'         Now() '
             +'from     SL_BUY_H '
             +'where    CD_HEAD  = :P0 '
             +'  and    CD_STORE = :P1 '
             +'  and    YMD_BUY  = :P2',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.CurrentDate)]);
    try
      // 신규매입일때는 매입번호, 입력일시를 알아낸다
      if (StatusEdit.Tag = 0) or (ConditionToolBarBuyNoEdit.Text = EmptyStr) then
      begin
        if not Query.Eof then
          vBuyNo  := FormatFloat('0000', StoI(Query.Fields[0].AsString)+1)
        else
          vBuyNo  := '0001';
      end;
    finally
      FinishQuery;
    end;

    // 매입 번호를 불러온다
    if (StatusEdit.Tag = 0) or (ConditionToolBarBuyNoEdit.Text = EmptyStr) then
      AcctRefNo    := ''
    // 기존 매입자료 수정
    else
    begin
      vBuyNo := LPad(ConditionToolBarBuyNoEdit.Text, 4, '0');
      OpenQuery('select   Max(SEQ) as SEQ '
               +'from     SL_BUY_D '
               +'where    CD_HEAD  = :P0 '
               +'  and    CD_STORE = :P1 '
               +'  and    YMD_BUY  = :P2 '
               +'  and    NO_BUY   = :P3 ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 vBuyNo]);
      try
        // 신규매입일때는 매입번호, 입력일시를 알아낸다
        if not Query.Eof then
          vSeq     := Query.Fields[0].AsInteger
        else
          vSeq       := 0;
      finally
        FinishQuery;
      end;

      ExecQuery('delete from SL_ACCT '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and ConCat(YMD_OCCUR,NO_POS, NO_ACCT) = :P2; ',
                [HeadStoreCode,
                 StoreCode,
                 AcctRefNo],
                 false);
    end;


    // 디테일을 저장한다
    vNet    := 0;
    vNot    := 0;
    vVat    := 0;
    vSum    := 0;
    GridTableView.DataController.PostEditingData;

    //매입마스터 저장
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then
      begin
        vNet    := vNet    +(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index],    0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index], 0.0));
        vNot    := vNot    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index],    0.0);
        vVat    := vVat    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index],    0.0);
        vSum    := vSum    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index],       0.0);
        Continue;
      end;

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then Continue;

      vNet    := vNet    +(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index],    0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index], 0.0));
      vNot    := vNot    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index],    0.0);
      vVat    := vVat    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index],    0.0);
      vSum    := vSum    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index],       0.0);
    end;

    // 현금 매입 시 입출금 계정 테이블에 저장한다
    vAcctSeq := EmptyStr;
    vAcctRef := EmptyStr;
    if CashBuyCheckBox.Checked then
    begin
      OpenQuery('select Ifnull(Max(NO_ACCT),''0'') as NO_ACCT '
               +'  from SL_ACCT '
               +' where CD_HEAD   = :P0 '
               +'   and CD_STORE  = :P1 '
               +'   and YMD_OCCUR = :P2 '
               +'   and NO_POS    = ''00'' ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate)]);
      try
        vAcctSeq := FormatFloat('000', StoI(Query.Fields[0].AsString)+1);
      finally
        FinishQuery;
      end;
      if vAcctSeq <> EmptyStr then
      begin
        ExecQuery('insert into SL_ACCT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, NO_ACCT, DS_ACCT, CD_ACCT, AMT_OUT, CD_SAWON_CHG, CD_TRDPL, REMARK, DT_CHANGE) '
                 +'            values (:P0, :P1, :P2, ''00'', :P3, ''0'', :P4, :P5, :P6, :P7, :P8, Now()); ',
                  [HeadStoreCode,
                   StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                   vAcctSeq,
                   CashOut,
                   vSum,
                   UserCode,
                   CompanyCodeEdit.Text,
                   '[매입] ' + DtoS(ConditionToolBarFromDateEdit.CurrentDate) + vBuyNo],
                   false);
        vAcctRef := DtoS(ConditionToolBarFromDateEdit.CurrentDate) + '00' +vAcctSeq;
      end;
    end;

    // 마스터를 저장한다
    if ConditionToolBarBuyNoEdit.Text = EmptyStr then
      ExecQuery('insert into SL_BUY_H(CD_HEAD, '
               +'                     CD_STORE, '
               +'                     YMD_BUY, '
               +'                     NO_BUY, '
               +'                     CD_TRDPL, '
               +'                     AMT_DUTY, '
               +'                     AMT_TAX, '
               +'                     AMT_DUTYFREE, '
               +'                     AMT_CASH, '
               +'                     AMT_TRUST, '
               +'                     AMT_DC, '
               +'                     NO_ACCT_REF, '
               +'                     REMARK, '
               +'                     DS_STATUS, '
               +'                     DT_INSERT, '
               +'                     CD_SAWON_INSERT,'
               +'                     CD_SAWON_CHG, '
               +'                     DT_CHANGE, '
               +'                     DS_BUY, '
               +'                     AMT_BUY ) '
               +'            Values (:P0, '
               +'                    :P1, '
               +'                    :P2, '
               +'                    :P3, '
               +'                    :P4, '
               +'                    :P5, '
               +'                    :P6, '
               +'                    :P7, '
               +'                    :P8, '
               +'                    :P9, '
               +'                    :P10, '
               +'                    :P11, '
               +'                    :P12, '
               +'                    :P13, '
               +'                    Now(), '
               +'                    :P14, '
               +'                    :P15, '
               +'                    Now(), '
               +'                    :P15, '
               +'                    :P5+:P6+:P7 );',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 vBuyNo,
                 CompanyCodeEdit.Text,
                 vNet,
                 vVat,
                 vNot,
                 IfThen(CashBuyCheckBox.Checked, BuyAmtEdit.Value, 0),
                 IfThen(CashBuyCheckBox.Checked, 0, BuyAmtEdit.Value),
                 DCAmtEdit.Value,
                 vAcctRef,
                 CommentMemo.Text,
                 IfThen(LockCheckBox.Checked, 'L', 'B'),
                 UserCode,
                 GetStrPointerData(BuyTypeComboBox)],
                 false)
    else
      ExecQuery('update SL_BUY_H set CD_TRDPL       =:P4, '
               +'                    AMT_DUTY       =:P5, '
               +'                    AMT_TAX        =:P6, '
               +'                    AMT_DUTYFREE   =:P7, '
               +'                    AMT_CASH       =:P8, '
               +'                    AMT_TRUST      =:P9, '
               +'                    AMT_DC         =:P10, '
               +'                    AMT_BUY        =:P5+:P6+:P7, '
               +'                    NO_ACCT_REF    =:P11, '
               +'                    REMARK         =:P12, '
               +'                    CD_SAWON_CHG   =:P13, '
               +'                    DT_CHANGE      =Now(), '
               +'                    DS_STATUS      =:P14 '
               +'where CD_HEAD  =:P0 '
               +'  and CD_STORE =:P1 '
               +'  and YMD_BUY  =:P2 '
               +'  and NO_BUY   =:P3;',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 vBuyNo,
                 CompanyCodeEdit.Text,
                 vNet,
                 vVat,
                 vNot,
                 IfThen(CashBuyCheckBox.Checked, BuyAmtEdit.Value, 0),
                 IfThen(CashBuyCheckBox.Checked, 0, BuyAmtEdit.Value),
                 DCAmtEdit.Value,
                 vAcctRef,
                 CommentMemo.Text,
                 UserCode,
                 IfThen(LockCheckBox.Checked, 'L', 'B')],
                 false);

    vSQL := '';
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      // 매입단가가 부가세 포함이거나 면세 상품일 때
      if Nvl(GridTableView.DataController.Values[vIndex, GridTableViewVatYN.Index], '1') = '0' then
        vBuyPrice := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index], 0.0)
      else // 매입 단가가 공급가일 때
        vBuyPrice := RoundNumber(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index], 0.0) * TaxRate);

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete from SL_BUY_D '
                 +' where CD_HEAD  = :P0 '
                 +'   and CD_STORE = :P1 '
                 +'   and YMD_BUY  = :P2 '
                 +'   and NO_BUY   = :P3 '
                 +'   and SEQ      = :P4;',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 vBuyNo,
                 GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index]],
                 false);
      end
      else
      begin
        if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then
        begin
          Inc(vSeq);
          vSQL := vSQL + Format('(''%s'', ''%s'', ''%s'', ''%s'', %s, ''%s'', %s, %s, %s, %s, %s, %s),',
                                [HeadStoreCode,
                                 StoreCode,
                                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                                 vBuyNo,
                                 IntToStr(vSeq),
                                 GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                                 FloatToStr(vBuyPrice),
                                 FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index],    0.0)),
                                 FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index], 0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index], 0.0)),
                                 FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index], 0.0)),
                                 FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index], 0.0)),
                                 FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index], 0.0)+Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index], 0.0))])
        end
        else
          ExecQuery('update SL_BUY_D set CD_GOODS      =:P5, '
                   +'                    PR_BUY        =:P6, '
                   +'                    QTY_BUY       =:P7, '
                   +'                    AMT_DUTY      =:P8, '
                   +'                    AMT_TAX       =:P9, '
                   +'                    AMT_DUTYFREE  =:P10,  '
                   +'                    AMT_BUY       =:P11 '
                   +'where  CD_HEAD  =:P0 '
                   +'  and  CD_STORE =:P1 '
                   +'  and  YMD_BUY  =:P2 '
                   +'  and  NO_BUY   =:P3 '
                   +'  and  SEQ      =:P4; ',
                    [HeadStoreCode,
                     StoreCode,
                     DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                     vBuyNo,
                     Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert, vSeq, NVL(GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index],0)),
                     GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                     vBuyPrice,
                     Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index],    0.0),
                     Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index], 0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index], 0.0),
                     Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index], 0.0),
                     Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNotAmt.Index], 0.0),
                     Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyNetAmt.Index], 0.0)+Nvl(GridTableView.DataController.Values[vIndex, GridTableViewBuyVatAmt.Index], 0.0)],
                     false);
      end;
    end;

    if vSQL <> '' then
    begin
      vSQL := 'insert into SL_BUY_D(CD_HEAD, CD_STORE, YMD_BUY, NO_BUY, SEQ, CD_GOODS, PR_BUY, QTY_BUY, AMT_DUTY, AMT_TAX, AMT_DUTYFREE, AMT_BUY) '
             +' values '+LeftStr(vSQL, Length(vSQL)-1)+';';

      ExecQuery(vSQL, [], false);
    end;
    ExecQuery(TempSQL, [], true);
    ConditionToolBarBuyNoEdit.Text := vBuyNo;
    isChanged := false;
    StatusEdit.Text := '매입 완료';
    StatusEdit.Tag  := 1;

    // 매입정정에서 넘어왔을 때는 폼을 닫는다
    if not ButtonToolBarNewButton.Visible then
    begin
      Close;
      FormParam[0] := 'BuyBuy';
      ExtremeMainForm.RunProgram('BuyModify');
    end
    // 매입폼에서 불러왔을 때는 자동으로 신규 버튼을 눌러 화면을 지운다 별걸 다 요구한다... 짜증...
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

end.
