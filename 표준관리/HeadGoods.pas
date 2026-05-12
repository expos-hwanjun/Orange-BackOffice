unit HeadGoods;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  Vcl.Menus, cxCheckBox, cxCurrencyEdit, cxButtonEdit, Vcl.StdCtrls, cxButtons,
  AdvOfficeButtons, AdvGroupBox, AdvPanel, StrUtils, Vcl.ComCtrls, cxTreeView,
  AdvOfficePager, Math, cxGroupBox, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, cxCheckListBox,
  cxRadioGroup, cxSpinEdit, AdvSmoothToggleButton, AdvSmoothButton, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers;

type
  THeadGoodsForm = class(TInheritGridEditForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    DetailSearchPanel: TAdvPanel;
    ScrollBox1: TScrollBox;
    Conditon1RadioGroup: TAdvOfficeRadioGroup;
    Conditon4RadioGroup: TAdvOfficeRadioGroup;
    Conditon5RadioGroup: TAdvOfficeRadioGroup;
    AdvGroupBox1: TAdvGroupBox;
    Label4: TLabel;
    ConditionFromDateEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    ConditionToDateEdit: TcxDateEdit;
    ConditionNotClassCheckBox: TAdvOfficeCheckBox;
    GoodsCodeCreatePopup: TPopupMenu;
    GoodsCodeCreatePopupNormal: TMenuItem;
    GoodsCodeCreatePopupSelf: TMenuItem;
    GoodsCodeCreatePopupScale: TMenuItem;
    ConditionCompanyLabel: TLabel;
    ConditionCompanyCodeEdit: TcxButtonEdit;
    ConditionCompanyNameEdit: TcxTextEdit;
    GoodsPager: TAdvOfficePager;
    GoodsInfoPager: TAdvOfficePage;
    HistoryPager: TAdvOfficePage;
    GoodsCodeLabel: TLabel;
    GoodsNameLabel: TLabel;
    MenuClassLabel: TLabel;
    PriceBuyLabel: TLabel;
    PriceSaleLabel: TLabel;
    CompanyLabel: TLabel;
    PriceProfitRateLabel: TLabel;
    StockTypeLabel: TLabel;
    PriceBuyNetLabel: TLabel;
    StockOptimumQtyLabel: TLabel;
    EtcOrderUnitQtyLabel: TLabel;
    GoodsCodeEdit: TcxTextEdit;
    GoodsNameEdit: TcxTextEdit;
    PriceBuyEdit: TcxCurrencyEdit;
    PriceSaleEdit: TcxCurrencyEdit;
    CompanyCodeEdit: TcxButtonEdit;
    CompanyNameEdit: TcxTextEdit;
    PriceProfitRateEdit: TcxCurrencyEdit;
    StockTypeComboBox: TcxComboBox;
    PriceBuyNetEdit: TcxCurrencyEdit;
    StockOptimumQtyEdit: TcxCurrencyEdit;
    OrderUnitQtyEdit: TcxCurrencyEdit;
    GoodsClassTreeView: TcxTreeView;
    cxGrid1: TcxGrid;
    HistoryGridTableView: TcxGridTableView;
    HistoryGridTableViewHistoryDate: TcxGridColumn;
    HistoryGridTableViewWorkType: TcxGridColumn;
    HistoryGridTableViewMenusName: TcxGridColumn;
    HistoryGridTableViewAfterSalePrice: TcxGridColumn;
    HistoryGridTableViewProfitRate: TcxGridColumn;
    HistoryGridTableViewAfterBuyPrice: TcxGridColumn;
    HistoryGridTableViewClassCode: TcxGridColumn;
    HistoryGridTableViewTaxYN: TcxGridColumn;
    HistoryGridTableViewStockType: TcxGridColumn;
    HistoryGridTableViewCompanyCode: TcxGridColumn;
    HistoryGridTableViewUseYN: TcxGridColumn;
    HistoryGridTableViewUserName: TcxGridColumn;
    HistoryGridTableViewPrgChange: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    HistoryGridTableViewSafetyQty: TcxGridColumn;
    HistoryGridTableViewOrderQty: TcxGridColumn;
    Label1: TLabel;
    TaxComboBox: TcxComboBox;
    ConditionNotCompanyCheckBox: TAdvOfficeCheckBox;
    Label3: TLabel;
    OrderUnitEdit: TcxTextEdit;
    Label2: TLabel;
    Label5: TLabel;
    StatusComboBox: TcxComboBox;
    Label7: TLabel;
    ConditionLogisticsComboBox: TcxComboBox;
    Label18: TLabel;
    NepumQtyEdit: TcxSpinEdit;
    Label8: TLabel;
    InsertDateLabel: TcxLabel;
    Label9: TLabel;
    UpdateDateLabel: TcxLabel;
    Label10: TLabel;
    UpdateUserLabel: TcxLabel;
    GoodsClassComboBox: TcxComboBox;
    LogisticsComboBox: TcxComboBox;
    Label11: TLabel;
    KeepComboBox: TcxComboBox;
    HistoryGridTableViewColumn1: TcxGridColumn;
    HistoryGridTableViewColumn2: TcxGridColumn;
    HistoryGridTableViewColumn3: TcxGridColumn;
    HistoryGridTableViewColumn4: TcxGridColumn;
    GoodsCodeCreateButton: TAdvSmoothButton;
    Label6: TLabel;
    ConditionGoodsClassComboBox: TcxComboBox;
    Label12: TLabel;
    ConditionKeepComboBox: TcxComboBox;
    Label13: TLabel;
    GoodsUnitEdit: TcxTextEdit;
    GridTableViewGoodsUnit: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewLogistics: TcxGridColumn;
    MenuLabel: TLabel;
    MenuCodeEdit: TcxButtonEdit;
    MenuNameEdit: TcxTextEdit;
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
    procedure KeyInButtonClick(Sender: TObject);
    procedure GoodsCodeCreateButtonClick(Sender: TObject);
    procedure GoodsCodeCreatePopupNormalClick(Sender: TObject);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure HistoryPagerShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GoodsCodeEditExit(Sender: TObject);
    procedure MenuCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    GoodsConfig :String;
    procedure GetCompanyName(Sender: TObject);
    function  SearchCompany(Sender:TObject; aCompany: string = ''): string;
    function  SearchMenu(aCode: string = ''): string;
    procedure SetHistoryGridView;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    procedure SetChanged(aChanged: Boolean); override;
    procedure SetMultiMode(aMultiMode: Boolean); override;
  end;

var
  HeadGoodsForm: THeadGoodsForm;

implementation
uses Common, DBModule, Help, CodeClassHelp, Main;
{$R *.dfm}

{ TCodeGoodsMasterForm }
procedure THeadGoodsForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  isLoading := true;
  // 세무구분
  New(vCode);
  vCode^.Data := '1';
  TaxComboBox.Properties.Items.AddObject('과세(포함)', TObject(vCode));
  New(vCode);
  vCode^.Data := '0';
  TaxComboBox.Properties.Items.AddObject('면세', TObject(vCode));

  // 재고관리구분
  New(vCode);
  vCode^.Data := '0';
  StockTypeComboBox.Properties.Items.AddObject('관리안함', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  StockTypeComboBox.Properties.Items.AddObject('관리함', TObject(vCode));

  // 재고관리구분
  New(vCode);
  vCode^.Data := 'Y';
  StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
  New(vCode);
  vCode^.Data := 'N';
  StatusComboBox.Properties.Items.AddObject('사용안함', TObject(vCode));
  New(vCode);
  vCode^.Data := 'L';
  StatusComboBox.Properties.Items.AddObject('발주중지', TObject(vCode));

  OpenQuery('select CD_TRDPL, '
           +'       NM_TRDPL '
           +'  from MS_TRD '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_TRDPL =''L'' '
           +'   and DS_STATUS =''0'' '
           +' order by CD_TRDPL ',
           [HeadStoreCode,
            StandardStore]);
  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := '';
    LogisticsComboBox.Properties.Items.AddObject('지정안함', TObject(vCode));
    New(vCode);
    vCode^.Data := Query.FieldByName('CD_TRDPL').AsString;
    LogisticsComboBox.Properties.Items.AddObject(Query.FieldByName('NM_TRDPL').AsString, TObject(vCode));
    Query.Next;
  end;
  Query.Close;

  //상품분류
  OpenQuery('select CD_CODE, '
           +'       NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND =''04'' '
           +'   and DS_STATUS =''0'' '
           +' order by CD_CODE ',
           [HeadStoreCode,
            StandardStore]);
  ConditionGoodsClassComboBox.Properties.Items;
  GoodsClassComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  GoodsClassComboBox.Properties.Items.AddObject('지정안함', TObject(vCode));
  ConditionGoodsClassComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));

  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := Query.FieldByName('CD_CODE').AsString;
    GoodsClassComboBox.Properties.Items.AddObject(Query.FieldByName('NM_CODE1').AsString, TObject(vCode));
    ConditionGoodsClassComboBox.Properties.Items.AddObject(Query.FieldByName('NM_CODE1').AsString, TObject(vCode));
    Query.Next;
  end;
  Query.Close;
  ConditionGoodsClassComboBox.ItemIndex := 0;

  //물류센터
  OpenQuery('select CD_TRDPL, '
           +'       NM_TRDPL '
           +'  from MS_TRD '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_TRDPL =''L'' '
           +'   and DS_STATUS =''0'' '
           +' order by CD_TRDPL ',
           [HeadStoreCode,
            StandardStore]);
  LogisticsComboBox.Properties.Items.Clear;
  ConditionLogisticsComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  LogisticsComboBox.Properties.Items.AddObject('지정안함', TObject(vCode));
  ConditionLogisticsComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := Query.FieldByName('CD_TRDPL').AsString;
    LogisticsComboBox.Properties.Items.AddObject(Query.FieldByName('NM_TRDPL').AsString, TObject(vCode));
    ConditionLogisticsComboBox.Properties.Items.AddObject(Query.FieldByName('NM_TRDPL').AsString, TObject(vCode));
    Query.Next;
  end;
  ConditionLogisticsComboBox.ItemIndex := 0;
  Query.Close;

  //보관방법
  OpenQuery('select CD_CODE, '
           +'       NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND =''07'' '
           +'   and DS_STATUS =''0'' '
           +' order by CD_CODE ',
           [HeadStoreCode,
            StandardStore]);
  KeepComboBox.Properties.Items.Clear;
  ConditionKeepComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  KeepComboBox.Properties.Items.AddObject('지정안함', TObject(vCode));
  ConditionKeepComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := Query.FieldByName('CD_CODE').AsString;
    KeepComboBox.Properties.Items.AddObject(Query.FieldByName('NM_CODE1').AsString, TObject(vCode));
    ConditionKeepComboBox.Properties.Items.AddObject(Query.FieldByName('NM_CODE1').AsString, TObject(vCode));
    Query.Next;
  end;
  Query.Close;
  ConditionKeepComboBox.ItemIndex := 0;
  isLoading := false;
end;

procedure THeadGoodsForm.HistoryPagerShow(Sender: TObject);
begin
  inherited;
  SetHistoryGridView;
end;

procedure THeadGoodsForm.CompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchCompany(Sender);
end;

function THeadGoodsForm.DoDelete: Boolean;
var vMsg :String;
begin
  Result := False;
  try
    OpenQuery('select StoD(Min(YMD_ORDER)) '
              +' from OL_ORDER_D '
              +'where CD_HEAD  = :P0 '
              +'  and CD_GOODS = :P1 ',
              [HeadStoreCode,
               GoodsCodeEdit.Text]);
    if not Query.Eof then
    begin
      MsgBox(Format('%s 일 발주내역이 있습니다',[Query.Fields[0].AsString]));
      Exit;
    end;
  finally
    FinishQuery;
  end;

  try
    ExecQuery('delete from MS_GOODS '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GOODS =:P2;'
             +'delete from MS_GOODS_HIST '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GOODS =:P2;',
             [HeadStoreCode,
              StandardStore,
              GoodsCodeEdit.Text], true);
  except
    on E: Exception do begin
    ErrBox(E.Message);
    end;
  end;
  Result := True;
end;

procedure THeadGoodsForm.DoGridLink;
begin
  inherited;
  try
    GoodsCodeEdit.Properties.ReadOnly := true;
    GoodsCodeCreateButton.Enabled := false;
    OpenQuery('select g.CD_GOODS, '
             +'       g.NM_GOODS, '
             +'       g.NM_UNIT, '
             +'       g.CD_CLASS, '
             +'       g.QTY_NEPUM, '
             +'       g.PR_BUY, '
             +'       g.PR_SALE, '
             +'       g.DS_TAX, '
             +'       g.PR_SALE_PROFIT, '
             +'       g.CD_LOGISTICS, '
             +'       g.CD_KEEP, '
             +'       g.CD_TRDPL, '
             +'       g.DS_STOCK, '
             +'       g.QTY_OPTIMUM, '
             +'       g.QTY_ORDER, '
             +'       g.DS_STATUS, '
             +'       g.CONFIG, '
             +'       t.NM_TRDPL, '
             +'       g.DT_INSERT, '
             +'       g.DT_CHANGE, '
             +'       g.CD_SAWON_CHG, '
             +'       m.CD_MENU, '
             +'       m.NM_MENU '
             +'  from MS_GOODS g left outer join '
             +'       MS_TRD   t on g.CD_HEAD  = t.CD_HEAD '
             +'                 and g.CD_STORE = t.CD_STORE '
             +'                 and g.CD_TRDPL = t.CD_TRDPL left outer join '
             +'       MS_MENU  m on m.CD_HEAD  = g.CD_HEAD '
             +'                 and m.CD_STORE = g.CD_STORE '
             +'                 and m.CD_MENU  = g.CD_MENU '
             +' where g.CD_HEAD  =:P0 '
             +'   and g.CD_STORE =:P1 '
             +'   and g.CD_GOODS =:P2 ',
             [HeadStoreCode,
              StandardStore,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index]]);

    if Query.Eof then Exit;

    GoodsCodeEdit.Text          := Query.FieldByName('CD_GOODS').AsString;
    GoodsNameEdit.Text          := Query.FieldByName('NM_GOODS').AsString;
    GoodsUnitEdit.Text          := Query.FieldByName('NM_UNIT').AsString;
    GoodsClassComboBox.ItemIndex := GetStrPointerIndex(GoodsClassComboBox, Query.FieldByName('CD_CLASS').AsString);
    LogisticsComboBox.ItemIndex := GetStrPointerIndex(LogisticsComboBox, Query.FieldByName('CD_LOGISTICS').AsString);
    KeepComboBox.ItemIndex      := GetStrPointerIndex(KeepComboBox, Query.FieldByName('CD_KEEP').AsString);
    PriceBuyEdit.Value          := Query.FieldByName('PR_BUY').AsCurrency;
    PriceSaleEdit.Value         := Query.FieldByName('PR_SALE').AsCurrency;
    TaxComboBox.ItemIndex      := GetStrPointerIndex(TaxComboBox, Query.FieldByName('DS_TAX').AsString);
    // 과세(포함)
    if GetStrPointerData(TaxComboBox) = '1' then
    begin
      if TaxRate <> 0 then
        PriceBuyNetEdit.Value  := CeilNumber(PriceBuyEdit.Value / TaxRate);
    end
    // 과세(별도)
    else if GetStrPointerData(TaxComboBox) = '2' then
    begin
      if TaxRate <> 0 then
        PriceBuyNetEdit.Value  := PriceBuyEdit.Value;
    end
    // 면세
    else
    begin
      PriceBuyNetEdit.Value    := PriceBuyEdit.Value;
    end;

    PriceProfitRateEdit.Value    := Query.FieldByName('PR_SALE_PROFIT').AsCurrency;
    CompanyCodeEdit.Text        := Query.FieldByName('CD_TRDPL').AsString;
    CompanyNameEdit.Text        := Query.FieldByName('NM_TRDPL').AsString;
    StockTypeComboBox.ItemIndex := GetStrPointerIndex(StockTypeComboBox, Query.FieldByName('DS_STOCK').AsString);
    StockOptimumQtyEdit.Value   := Query.FieldByName('QTY_OPTIMUM').AsCurrency;
    OrderUnitQtyEdit.Value      := Query.FieldByName('QTY_ORDER').AsCurrency;
    StatusComboBox.ItemIndex    := GetStrPointerIndex(StatusComboBox, Query.FieldByName('DS_STATUS').AsString);
    GoodsConfig                 := Query.FieldByName('CONFIG').AsString;
    InsertDateLabel.Caption     := Query.FieldByName('DT_INSERT').AsString;
    UpdateDateLabel.Caption     := Query.FieldByName('DT_CHANGE').AsString;
    UpdateUserLabel.Caption     := Query.FieldByName('CD_SAWON_CHG').AsString;
    MenuCodeEdit.Text           := Query.FieldByName('CD_MENU').AsString;
    MenuNameEdit.Text           := Query.FieldByName('NM_MENU').AsString;
    MenuNameEdit.TextHint       := Query.FieldByName('CD_MENU').AsString;
  finally
    FinishQuery;
    isChanged := false;
  end;

  if GoodsPager.ActivePageIndex = 1 then
    SetHistoryGridView;
end;

function THeadGoodsForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    GoodsPager.Enabled    := true;
    // (상품코드) 생성 버튼을 활성화한다
    GoodsCodeCreateButton.Enabled  := true;
    GoodsCodeEdit.Clear;
    GoodsCodeCreateButtonClick(nil);
    GoodsCodeEdit.TabStop             := true;
    GoodsCodeEdit.Properties.ReadOnly := false;
    GoodsCodeEdit.Style.Color         := clWindow;
    GoodsCodeEdit.Properties.ReadOnly := false;
    GoodsNameEdit.Properties.ReadOnly := false;
    InsertDateLabel.Clear;
    UpdateDateLabel.Clear;
    UpdateUserLabel.Clear;
    GoodsNameEdit.SetFocus;
  finally
    isLoading := false;
    Result    := true;
  end;
end;

function THeadGoodsForm.DoSave: Boolean;
var  vIndex, vIndex1, vParamIndex :Integer;
     vSQLText, vCode :String;
     vResult     :Boolean;
     vData       :String;
     vParamsType,
     vConfig,
     vResultStr  :String;
begin
  if isMultiMode then
  begin
    try
      Screen.Cursor := crSQLWait;
      //Param에 값을 대입한다
      vParamIndex := 2;                                   //
      for vIndex := 0 to ComponentCount-1 do
      begin
        if (TControl(Components[vIndex]).Parent = GoodsInfoPager)
          and ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))  then
        begin
          if (Components[vIndex] is TcxCustomEdit) then
            vSQLText    := vSQLText    + TcxCustomEdit(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)])
          else if (Components[vIndex] is TcxSpinEdit) then
            vSQLText    := vSQLText    + TcxSpinEdit(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)])
          else if (Components[vIndex] is TcxCheckListBox) then
            vSQLText    := vSQLText    + TcxCheckListBox(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)]);
          Inc(vParamIndex);
        end;
      end;


      vSQLText := 'update MS_GOODS set '
                 + vSQLText +' PRG_CHANGE = ''MST'', CD_SAWON_CHG = '''+UserCode+''', DT_CHANGE = Now() '
                 +' where CD_HEAD =:P0 and CD_STORE =:P1 ';

      vCode := EmptyStr;
      for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        vCode := vCode + Format('''%s'',',[String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewGoodsCode.Index])]);

      vCode    := ' and CD_GOODS in ('+LeftStr(vCode, Length(vCode)-1)+');';

      vSQLText := vSQLText + vCode;
      //Param에 값을 대입한다
      vParamIndex := 2;                                   //


      for vIndex := 0 to ComponentCount-1 do
      begin
        if (TControl(Components[vIndex]).Parent = GoodsInfoPager)
          and ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))  then
        begin
          if (Components[vIndex] is TcxCurrencyEdit) then
            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), FormatFloat('#0.00',TcxCurrencyEdit(Components[vIndex]).Value))
          else if (Components[vIndex] is TcxButtonEdit) then
            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxButtonEdit(Components[vIndex]).Text]))
          else if (Components[vIndex] is TcxCheckBox) then
            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[Ifthen(TcxCheckBox(Components[vIndex]).Checked,'Y','N')]))
          else if (Components[vIndex] is TcxTextEdit) then
            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxTextEdit(Components[vIndex]).Text]))
          else if (Components[vIndex] is TcxComboBox) then
            vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[GetStrPointerData(TcxComboBox(Components[vIndex]))]));

          Inc(vParamIndex);
        end;
      end;

      vSQLText := Replace(vSQLText, ':P0', Format('''%s''',[HeadStoreCode]));
      vSQLText := Replace(vSQLText, ':P1', Format('''%s''',[StandardStore]));
      ExecQuery(vSQLText,[],true);

      isChanged := false;
      isMultiMode                := False;
      DoGridLink;
      Result := True;
    finally
      Screen.Cursor := crDefault;
    end;
    Exit;
  end;

  if isNew and (Length(GoodsCodeEdit.Text) < 4) then
    GoodsCodeEdit.Text := LPad(GoodsCodeEdit.Text, 4, '0');


  // 상품코드
  if Trim(GoodsCodeEdit.Text) = EmptyStr then
  begin
    ErrBox(GoodsCodeLabel.Caption+msgMustInput);
    GoodsPager.ActivePageIndex := 0;
    if MainPanel.Enabled and GoodsCodeEdit.Enabled then
      GoodsCodeEdit.SetFocus;
    Exit;
  end;

  // 상품 이름
  if Trim(GoodsNameEdit.Text) = EmptyStr then
  begin
    ErrBox(GoodsNameLabel.Caption+msgMustInput);
    GoodsPager.ActivePageIndex := 0;
    if MainPanel.Enabled and GoodsNameEdit.Enabled then
      GoodsNameEdit.SetFocus;
    Exit;
  end;

  //상품코드중복체크
  if isNew and (Trim(GoodsCodeEdit.Text) <> '') then
  begin
    try
      if OpenQuery('select DS_STATUS '
                  +'  from MS_GOODS '
                  +' where CD_HEAD   =:P0 '
                  +'   and CD_STORE  =:P1 '
                  +'   and CD_GOODS  =:P2 ',
                  [HeadStoreCode,
                   StandardStore,
                   GoodsCodeEdit.Text]) then
      begin
        if Query.Fields[0].AsString = 'Y' then
        begin
          ErrBox('이미 사용 중인 코드입니다');
          if GoodsCodeEdit.Enabled then GoodsCodeEdit.SetFocus;
          Exit;
        end
        else if Query.Fields[0].AsString = 'N' then
        begin
          ErrBox('사용이 중지 된 코드입니다');
          if GoodsCodeEdit.Enabled then GoodsCodeEdit.SetFocus;
          Exit;
        end
        else if Query.Fields[0].AsString = 'L' then
        begin
          ErrBox('발주중지 상태 된 코드입니다');
          if GoodsCodeEdit.Enabled then GoodsCodeEdit.SetFocus;
          Exit;
        end;
      end;
    finally
      FinishQuery;
    end;
  end;

  if isNew then
  begin
    try
      if OpenQuery('select CD_GOODS '
                  +'  from MS_GOODS '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and NM_GOODS =:P2 ',
                  [HeadStoreCode,
                   StandardStore,
                   GoodsNameEdit.Text]) then
      begin
        if not AskBox('동일한 이름의 상품이 존재합니다'+#13+'계속하시겠습니까?') then
        begin
          GoodsNameEdit.SetFocus;
          Exit;
        end;
      end;
    finally
      FinishQuery;
    end;
  end;


  try
    if not ExecQuery('insert into MS_GOODS(CD_HEAD, '
                    +'                     CD_STORE, '
                    +'                     CD_GOODS, '
                    +'	 				           NM_GOODS, '
                    +'                     NM_UNIT, '
                    +'	 				           QTY_NEPUM, '
                    +'                     CD_CLASS, '
                    +'                     CD_KEEP, '
                    +'	 				           DS_GOODS_TYPE, '
                    +'                     PR_BUY, '
                    +'	 				           PR_SALE, '
                    +'	 				           PR_SALE_PROFIT, '
                    +'	 				           DS_TAX, '
                    +'	 				           DS_STOCK, '
                    +'                     CD_LOGISTICS, '
                    +'                     CD_TRDPL, '
                    +'                     QTY_OPTIMUM, '
                    +'                     QTY_ORDER, '
                    +'                     DS_STATUS, '
                    +'	 				           CONFIG, '
                    +'                     CD_MENU, '
                    +'	 				           CD_SAWON_CHG, '
                    +'	 				           DT_CHANGE, '
                    +'                     PRG_CHANGE) '
                    +'            VALUES(:P0, '
                    +'	 				         	:P1, '
                    +'	 				         	:P2, '
                    +'	 				         	:P3, '
                    +'	 				         	:P4, '
                    +'	 				         	:P5, '
                    +'	 				         	:P6, '
                    +'	 				         	:P7, '
                    +'	 				         	:P8, '
                    +'	 				         	:P9, '
                    +'	 				         	:P10, '
                    +'	 				         	:P11, '
                    +'	 				         	:P12, '
                    +'	 				         	:P13, '
                    +'	 				         	:P14, '
                    +'	 				         	:P15, '
                    +'	 				         	:P16, '
                    +'	 				         	:P17, '
                    +'	 				         	:P18, '
                    +'	 				         	:P19, '
                    +'	 				         	:P20, '
                    +'	 				         	:P21, '
                    +'	 				         	Now(), '
                    +'                   ''MST'') '
                    +' ON DUPLICATE KEY UPDATE NM_GOODS       = :P3, '
                    +'                         NM_UNIT        = :P4, '
                    +'                         QTY_NEPUM      = :P5, '
                    +'                         CD_CLASS       = :P6, '
                    +'                         CD_KEEP        = :P7, '
                    +'                         DS_GOODS_TYPE  = :P8, '
                    +'                         PR_BUY         = :P9, '
                    +'                         PR_SALE        = :P10, '
                    +'                         PR_SALE_PROFIT = :P11, '
                    +'                         DS_TAX         = :P12, '
                    +'                         DS_STOCK       = :P13, '
                    +'                         CD_LOGISTICS   = :P14, '
                    +'                         CD_TRDPL       = :P15, '
                    +'                         QTY_OPTIMUM    = :P16, '
                    +'                         QTY_ORDER      = :P17, '
                    +'                         DS_STATUS      = :P18, '
                    +'                         CONFIG         = :P19, '
                    +'                         CD_MENU        = :P20, '
                    +'                         CD_SAWON_CHG   = :P21, '
                    +'                         DT_CHANGE      = Now(), '
                    +'                         PRG_CHANGE     =''MST'';',
                    [HeadStoreCode,
                     StoreCode,
                     GoodsCodeEdit.Text,
                     GoodsNameEdit.Text,
                     OrderUnitEdit.Text,
                     NepumQtyEdit.Value,
                     GetStrPointerData(GoodsClassComboBox),
                     GetStrPointerData(KeepComboBox),
                     'N',
                     PriceBuyEdit.Value,
                     PriceSaleEdit.Value,
                     PriceProfitRateEdit.Value,
                     GetStrPointerData(TaxComboBox),
                     GetStrPointerData(StockTypeComboBox),
                     GetStrPointerData(LogisticsComboBox),
                     CompanyCodeEdit.Text,
                     StockOptimumQtyEdit.Value,
                     OrderUnitQtyEdit.Value,
                     GetStrPointerData(StatusComboBox),
                     vConfig,
                     MenuCodeEdit.Text,
                     UserCode], true) then Exit;

    Result := true;
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := GoodsCodeEdit.Text;
      NewData[1] := GoodsNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewGoodsName.Index] := GoodsNameEdit.Text;

    ConditionToolBarEdit.Clear;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

function THeadGoodsForm.DoSearch: Boolean;
var
  vWhere1,vWhere2,vWhere3,vWhere4,vWhere5,vWhere6,vWhere7,vWhere8, vWhere9, vWhere10: String;
  vList  : TStringList;
  vIndex : Integer;
begin
  DetailSearchPanel.Collaps := true;
  Result := false;
  case Conditon1RadioGroup.ItemIndex of
     1: vWhere1 := ' and g.DS_STATUS = ''Y'' ';            //정상
     2: vWhere1 := ' and g.DS_STATUS = ''N'' ';            //사용안함
     3: vWhere1 := ' and g.DS_STATUS = ''L'' ';            //발주중지
     else vWhere1 := '';
  end;

  if GetStrPointerData(ConditionGoodsClassComboBox) <> '' then
    vWhere2 := Format(' and g.CD_CLASS = ''%s'' ',[ GetStrPointerData(ConditionGoodsClassComboBox)]);

  if GetStrPointerData(ConditionLogisticsComboBox) <> '' then
    vWhere3 := Format(' and g.CD_LOGISTICS = ''%s'' ',[ GetStrPointerData(ConditionLogisticsComboBox)]);

  if GetStrPointerData(ConditionKeepComboBox) <> '' then
    vWhere6 := Format(' and g.CD_KEEP = ''%s'' ',[ GetStrPointerData(ConditionKeepComboBox)]);

  case Conditon4RadioGroup.ItemIndex of
     1: vWhere4 := ' and g.DS_TAX = ''1'' ';
     2: vWhere4 := ' and g.DS_TAX = ''0'' ';
     else vWhere4 := '';
  end;

  case Conditon5RadioGroup.ItemIndex of
     2: vWhere5 := ' and g.DS_STOCK = ''0'' ';
     1: vWhere5 := ' and g.DS_STOCK = ''1'' ';
     else vWhere5 := '';
  end;


  if ConditionCompanyCodeEdit.Text <> '' then
  begin
    if Pos(',',ConditionCompanyCodeEdit.Text) > 0 then
      vWhere7 := ' and g.CD_TRDPL in ('+ConditionCompanyCodeEdit.Text+') '
    else
      vWhere7 := ' and g.CD_TRDPL = '''+Replace(ConditionCompanyCodeEdit.Text,'''','')+''' ';
  end
  else
    vWhere7 := '';

  if (ConditionFromDateEdit.CurrentDate > 0) and (ConditionToDateEdit.CurrentDate > 0) then
    vWhere8 := ' and Date_Format(g.DT_CHANGE, ''%Y%m%d'') between '''+DToS(ConditionFromDateEdit.CurrentDate)+''' and '''+DToS(ConditionToDateEdit.CurrentDate)+''' '
  else
    vWhere8 := '';

  if ConditionNotCompanyCheckBox.Checked then
    vWhere9 := ' and Ifnull(g.CD_TRDPL,'''') = '''' ';

  if ConditionNotClassCheckBox.Checked then
    vWhere10 := ' and Ifnull(g.CD_CLASS,'''') = '''' ';


  OpenQuery('select g.CD_GOODS, '
           +'       g.NM_GOODS, '
           +'       g.NM_UNIT, '
           +'       g.PR_BUY, '
           +'       g.PR_SALE, '
           +'       l.NM_TRDPL as LOGISTICS, '
           +'       case g.DS_STATUS when ''Y'' then ''정상'' when ''L'' then ''발주중지'' when ''N'' then ''사용안함'' end DS_STATUS '
           +'  from MS_GOODS as g left outer join '
           +'       MS_TRD   as l on g.CD_HEAD  = l.CD_HEAD '
           +'                    and g.CD_STORE = l.CD_STORE '
           +'                    and g.CD_LOGISTICS = l.CD_TRDPL '
           +' where g.CD_HEAD = :P0 '
           +'   and g.CD_STORE =:P1 '
           + vWhere1
           + vWhere2
           + vWhere3
           + vWhere4
           + vWhere5
           + vWhere6
           + vWhere7
           + vWhere8
           + vWhere9
           + vWhere10
           +'   and (g.CD_GOODS = :P2 or g.NM_GOODS like ConCat(''%'',:P2,''%'')) '
           +' order by g.CD_GOODS ',
           [HeadStoreCode,
            StandardStore,
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadGoodsForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = CompanyCodeEdit) and
     (Length(CompanyCodeEdit.Text) <> 6) and
     (CompanyNameEdit.Text <> EmptyStr)  then
  begin
    CompanyNameEdit.Clear;
  end
  else if (Sender = MenuCodeEdit) and
     (MenuCodeEdit.Text <> MenuCodeEdit.TextHint)  then
  begin
    MenuNameEdit.Clear;
  end
  else if (Sender = ConditionCompanyCodeEdit) and
     (Length(ConditionCompanyCodeEdit.Text) <> 6) and
     (ConditionCompanyNameEdit.Text <> EmptyStr)  then
  begin
    ConditionCompanyNameEdit.Clear;
    isChanged := false;
  end
  else if (Sender = ConditionCompanyCodeEdit) then
    isChanged := false
  // 과세구분을 변경할 때
  else if (Sender = TaxComboBox) and ((GetActiveControl = Sender) or isLoading) then
  begin
    // 과세
    if (GetStrPointerData(TaxComboBox) = '1') or (GetStrPointerData(TaxComboBox) = '2') then
    begin
      if TaxRate <> 0 then
        PriceBuyNetEdit.Value := CeilNumber(PriceBuyEdit.Value / TaxRate);
    end
    // 면세
    else
    begin
      PriceBuyNetEdit.Value   := PriceBuyEdit.Value;
    end;
  end;
end;

procedure THeadGoodsForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var  vCode, vName: string;
     vTemp : Currency;
begin
  inherited;
  // 상품분류
  if Sender = CompanyCodeEdit then
  begin
    if ((GetOnlyNumber(DisplayValue) = DisplayValue) and (Length(DisplayValue) = 6)) or
       (DisplayValue = EmptyStr) then
      GetCompanyName(Sender)
    else
    begin
      OpenQuery('select   CD_TRDPL, '
               +'         NM_TRDPL '
               +'  from   MS_TRD '
               +' where   CD_HEAD  =:P0 '
               +'   and   CD_STORE =:P1 '
               +'   and   NM_TRDPL like ConCat(''%'',:P2,''%'') '
               +'   and   DS_TRDPL = ''B'' ',
                [HeadStoreCode,
                 StandardStore,
                 DisplayValue]);
      try
        if not Query.Eof then
        begin
          vCode      := Query.Fields[0].AsString;
          vName      := Query.Fields[1].AsString;
          Query.Next;
          if Query.Eof then
          begin
            DisplayValue              := vCode;
            CompanyNameEdit.Text := vName;

          end
          else
            DisplayValue := SearchCompany(CompanyCodeEdit, DisplayValue);
        end
        else
        begin
          if MainPanel.Enabled and CompanyCodeEdit.Enabled then
            CompanyCodeEdit.SetFocus;
          CompanyNameEdit.Text := EmptyStr;
          ShowMsg(Replace(CompanyLabel.Caption)+msgMustInput, true)
        end;
      finally
        FinishQuery;
      end;
    end
  end
  // 거래처(상세검색)
  else if Sender = ConditionCompanyCodeEdit then
  begin
    if ((GetOnlyNumber(DisplayValue) = DisplayValue) and (Length(DisplayValue) = 6)) or
       (DisplayValue = EmptyStr) then
      GetCompanyName(Sender)
    else
    begin
      OpenQuery('select   CD_TRDPL, '
               +'         NM_TRDPL '
               +'from     MS_TRD '
               +'where    CD_HEAD  =:P0 '
               +'  and    CD_STORE =:P1 '
               +'  and    NM_TRDPL like ConCat(''%'',:P2,''%'') '
               +'  and    DS_TRDPL = ''B'' ',
                [HeadStoreCode,
                 StandardStore,
                 DisplayValue]);
      try
        if not Query.Eof then
        begin
          vCode      := Query.Fields[0].AsString;
          vName      := Query.Fields[1].AsString;
          Query.Next;
          if Query.Eof then
          begin
            DisplayValue                  := vCode;
            ConditionCompanyNameEdit.Text := vName;
          end
          else
            DisplayValue := SearchCompany(ConditionCompanyCodeEdit, DisplayValue);
        end
        else
        begin
          ConditionCompanyCodeEdit.SetFocus;
          ConditionCompanyNameEdit.Text := EmptyStr;
          ShowMsg(Replace(ConditionCompanyLabel.Caption)+msgMustInput, true)
        end;
      finally
        FinishQuery;
      end;
    end;
    Exit;
  end
  // 판매단가
  else if Sender = PriceSaleEdit then
  begin
    // 이익률을 새로 구한다
    PriceProfitRateEdit.Value  := CalcSaleProfitRate(PriceBuyEdit.Value, Currency(DisplayValue));
  end

  // 매입단가
  else if Sender = PriceBuyEdit then
  begin
    // 이익률을 새로 구한다
    PriceProfitRateEdit.Value  := CalcSaleProfitRate(Currency(DisplayValue), PriceSaleEdit.Value);
    // 공급가, 부가세를 새로 구한다
    if (GetStrPointerData(TaxComboBox) = '1') or (GetStrPointerData(TaxComboBox) = '2') then
    begin
      if TaxRate <> 0 then
        PriceBuyNetEdit.Value := CeilNumber(Currency(DisplayValue) / TaxRate);
    end
    else
      PriceBuyNetEdit.Value   := Currency(DisplayValue);
  end

  // 매입공급가
  else if Sender = PriceBuyNetEdit then
  begin
    // 공급가, 부가세를 새로 구한다
    if (GetStrPointerData(TaxComboBox) = '1') or (GetStrPointerData(TaxComboBox) = '2') then
      PriceBuyEdit.Value  := CeilNumber(Currency(DisplayValue) * TaxRate)
    else
      PriceBuyEdit.Value  := Currency(DisplayValue);

    // 이익률을 새로 구한다
    PriceProfitRateEdit.Value  := CalcSaleProfitRate(PriceBuyEdit.Value, PriceSaleEdit.Value);
  end

  // 이익률
  else if Sender = PriceProfitRateEdit then
  begin
    // 이익률에 맞게 판매단가를 수정한다
    if PriceSaleEdit.Enabled and (PriceBuyEdit.Value > 0) then
    begin
      // 매출이익률에 맞는 판매단가를 구한다
      if (DisplayValue = 100) and(PriceBuyEdit.Value <> 0) then
      begin
        ErrorText := Format('%s가 0이 아닐 때는 이익률을 100%%로 입력할 수 없습니다.', [PriceBuyLabel.Caption]);
        Error     := true;
      end
      else
      begin
        PriceSaleEdit.Value := CalcOptionNumber(100 / (100 - Currency(DisplayValue)) * PriceBuyEdit.Value, 141);
      end;
    end
    else if (PriceBuyEdit.Value = 0) and (PriceSaleEdit.Value <> 0) then
    begin
      PriceBuyEdit.Value := RoundNumber(PriceSaleEdit.Value - (PriceSaleEdit.Value * (Currency(DisplayValue) / 100)), 0.01);
      // 공급가, 부가세를 새로 구한다
      if GetStrPointerData(TaxComboBox) <> '0' then
      begin
        if TaxRate <> 0 then
          PriceBuyNetEdit.Value := CeilNumber(PriceBuyEdit.Value / TaxRate);
      end
      else
        PriceBuyNetEdit.Value   := PriceBuyEdit.Value;
    end;
  end;
  isChanged := true;
end;



procedure THeadGoodsForm.FormShow(Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 거래처 이름 구하기
procedure THeadGoodsForm.GetCompanyName(Sender: TObject);
begin
  if Sender = CompanyCodeEdit then
  begin
    // 정상적인 거래처를 입력했을 때
    if {(GoodsCompanyNameEdit.Text = EmptyStr) and}
       (GetOnlyNumber(CompanyCodeEdit.Text) = CompanyCodeEdit.Text) and
       (Length(CompanyCodeEdit.Text) = 6) then
    begin
      OpenQuery('select   NM_TRDPL '
               +'from     MS_TRD '
               +'where    CD_HEAD  = :P0 '
               +'  and    CD_STORE = :P1 '
               +'  and    CD_TRDPL = :P2 '
               +'  and    DS_TRDPL = ''B'' ',
                [HeadStoreCode,
                 StandardStore,
                 CompanyCodeEdit.Text]);
      try
        if Query.Fields[0].AsString = EmptyStr then
          ShowMsg(Replace(CompanyLabel.Caption)+msgMustInput, true)
        else
        begin
          CompanyNameEdit.Text := Query.Fields[0].AsString;
        end;
      finally
        FinishQuery;
      end;
    end
    else
    begin
      CompanyNameEdit.Text := EmptyStr;
    end;
  end
  else
  begin
    // 정상적인 거래처를 입력했을 때
    if {(GoodsCompanyNameEdit.Text = EmptyStr) and}
       (GetOnlyNumber(ConditionCompanyCodeEdit.Text) = ConditionCompanyCodeEdit.Text) and
       (Length(ConditionCompanyCodeEdit.Text) = 6) then
    begin
      OpenQuery('select   NM_TRDPL '
               +'from     MS_TRD '
               +'where    CD_HEAD  = :P0 '
               +'  and    CD_STORE = :P1 '
               +'  and    CD_TRDPL = :P2 '
               +'  and    DS_TRDPL = ''B'' ',
               [HeadStoreCode,
                StandardStore,
                ConditionCompanyCodeEdit.Text]);
      try
        if Query.Fields[0].AsString = EmptyStr then
          ShowMsg(Replace(ConditionCompanyLabel.Caption)+msgMustInput, true)
        else
        begin
          ConditionCompanyNameEdit.Text := Query.Fields[0].AsString;
        end;
      finally
        FinishQuery;
      end;
    end
    else
    begin
      ConditionCompanyNameEdit.Text := EmptyStr;
    end;
  end;
end;

procedure THeadGoodsForm.GoodsCodeCreateButtonClick(Sender: TObject);
const
  msgNoPrefix = '%s 시작문자(프리픽스)가 정의되지 않아 %s를 생성할 수 없습니다.';
var
  vGoodsCode,
  vGoodsPrefix: string;
  vGoodsLen  : Integer;
begin
  inherited;

  GoodsCodeEdit.TabStop             := true;
  GoodsCodeEdit.Properties.ReadOnly := false;
  GoodsCodeEdit.Style.Color         := clWindow;

  OpenQuery('select SELFGOODS_PREFIX, '
           +'       SELFGOODS_LEN '
           +'  from MS_STORE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 ',
            [HeadStoreCode,
             StandardStore]);

  vGoodsPrefix := Query.Fields[0].AsString;
  vGoodsLen   := Query.Fields[1].AsInteger;
  Query.Close;

  // 기존에 등록된 자체/저울 바코드의 최대값을 구한다
  OpenQuery('select CD_GOODS '
           +'  from MS_GOODS '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and Left(CD_GOODS,2) = :P2 '
           +'   and Length(CD_GOODS) = :P3 '
           +' order by CD_GOODS desc '
           +' limit 1 ',
            [HeadStoreCode,
             StandardStore,
             vGoodsPrefix,
             vGoodsLen]);
  try
    // 기존에 등록된 자료가 없다면 생성한다
    if not Query.eof then
      vGoodsCode := Query.Fields[0].AsString;
    if vGoodsCode = EmptyStr then
      vGoodsCode := RPad(vGoodsPrefix, vGoodsLen, '0');

    vGoodsCode := GetBarcode(RPad(FloatToStr(StoF(Copy(vGoodsCode, 1, vGoodsLen-1))+1), vGoodsLen, '0'));

    // 바코드가 한도를 벗어났으면 에러
    if Copy(vGoodsCode,1,2) > vGoodsPrefix then
      ErrBox(Format('생성한 %s가 최대 한도를 초과하였습니다.', [GoodsCodeLabel.Caption]))
    else
    // 정상이면 생성한 바코드를 화면에 표시한다
    begin
      GoodsCodeEdit.Text := vGoodsCode;

      if MainPanel.Enabled and GoodsNameEdit.Enabled then
        GoodsNameEdit.SetFocus;
    end;
  finally
    FinishQuery;
  end;
end;

procedure THeadGoodsForm.GoodsCodeCreatePopupNormalClick(Sender: TObject);
begin
  inherited;
  GoodsCodeEdit.Clear;
  GoodsCodeEdit.TabStop             := true;
  GoodsCodeEdit.Properties.ReadOnly := false;
  GoodsCodeEdit.Style.Color         := clWindow;
  if MainPanel.Enabled and GoodsCodeEdit.Enabled then
    GoodsCodeEdit.SetFocus;
end;

procedure THeadGoodsForm.GoodsCodeEditExit(Sender: TObject);
begin
  inherited;
  GoodsCodeEdit.Text := Trim(GoodsCodeEdit.Text);
end;

procedure THeadGoodsForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridTableViewStatus.Index] = 'N' then
    AStyle := StyleFontRed;
end;

procedure THeadGoodsForm.KeyInButtonClick(Sender: TObject);
begin
  inherited;
  GoodsCodeEdit.Enabled := true;
end;

procedure THeadGoodsForm.MenuCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  SearchMenu;
end;

function THeadGoodsForm.SearchCompany(Sender: TObject;
  aCompany: string): string;
begin
  Result := EmptyStr;
  // 거래처를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := Replace(CompanyLabel.Caption)+' 조회';
      GridTableViewCode.Caption  := Replace(CompanyLabel.Caption)+' 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := Replace(CompanyLabel.Caption)+' 이름';
      GridTableViewName1.Width   := 320;

      SearchText := aCompany;
      SQLText    := 'select   CD_TRDPL, '
                   +'         NM_TRDPL, '
                   +'         DS_TRDPL '
                   +'from     MS_TRD '
                   +'where    CD_HEAD   = :P0 '
                   +'  and    CD_STORE  = :P1 '
                   +'  and   (CD_TRDPL like ConCat(''%'',:P2,''%'') or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                   +'  and    DS_TRDPL = ''B'' '
                   +'  and    DS_STATUS = 0 '
                   +'order by CD_STORE, CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result                    := Code;

        //상품정보에서 거래처를 조회했을때
        if (Sender = CompanyCodeEdit) then
        begin
          CompanyCodeEdit.Text := Code;
          CompanyNameEdit.Text := Names[0];
          CompanyCodeEdit.EditModified := true;
          isChanged := true;
        end
        else
        begin
          ConditionCompanyCodeEdit.Text := Code;
          ConditionCompanyNameEdit.Text := Names[0];
        end;
      end
      else if (Sender = CompanyCodeEdit) and MainPanel.Enabled and CompanyCodeEdit.Enabled then
      begin
        CompanyCodeEdit.SetFocus;
        CompanyCodeEdit.SelectAll;
      end;
    finally
      Free;
    end;
end;

function THeadGoodsForm.SearchMenu(aCode: string): string;
begin
  Result := EmptyStr;
  // 거래처를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := Replace(MenuLabel.Caption)+' 조회';
      GridTableViewCode.Caption  := Replace(MenuLabel.Caption)+' 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := Replace(MenuLabel.Caption)+' 이름';
      GridTableViewName1.Width   := 320;

      SearchText := aCode;
      SQLText    := 'select   CD_MENU, '
                   +'         NM_MENU '
                   +'from     MS_MENU '
                   +'where    CD_HEAD   = :P0 '
                   +'  and    CD_STORE  = :P1 '
                   +'  and   (CD_MENU like ConCat(''%'',:P2,''%'') or NM_MENU like ConCat(''%'',:P2,''%'')) '
                   +'  and    YN_USE = ''Y'' '
                   +'  and    DS_MENU_TYPE = ''N'' '
                   +'order by CD_MENU';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result                    := Code;
        MenuCodeEdit.Text     := Code;
        MenuNameEdit.Text     := Names[0];
        MenuNameEdit.TextHint := Code;
        MenuCodeEdit.EditModified := true;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

procedure THeadGoodsForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  DetailSearchPanel.Enabled := not isChanged;
end;

procedure THeadGoodsForm.SetHistoryGridView;
begin
  try
    OpenQuery('select DT_HIST, '
             +'       NM_GOODS, '
             +'       NM_UNIT, '
             +'	 			QTY_NEPUM, '
             +'       CD_CLASS, '
             +'       CD_KEEP, '
             +'	 			DS_GOODS_TYPE, '
             +'       PR_BUY, '
             +'	 			PR_SALE, '
             +'	 			PR_SALE_PROFIT, '
             +'	 			DS_TAX, '
             +'	 			DS_STOCK, '
             +'       CD_LOGISTICS, '
             +'       CD_TRDPL, '
             +'       QTY_SAFETY, '
             +'       QTY_ORDER, '
             +'       DS_STATUS, '
             +'	 			CONFIG, '
             +'       PRG_CHANGE '
             +'  from MS_GOODS_HIST  '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_MENU  = :P2 '
             +' order by DT_HIST desc ',
             [HeadStoreCode,
              StandardStore,
              GoodsCodeEdit.Text]);
    DM.ReadQuery(Query, HistoryGridTableView);
  finally
    FinishQuery;
  end;
end;

procedure THeadGoodsForm.SetMultiMode(aMultiMode: Boolean);
var vIndex :Integer;
begin
  inherited;
  //여러상품을 선택했을때는 수정할 수 있는 항목만 Enabled 시킨다
  if aMultiMode then
  begin
    for vIndex := 0 to ComponentCount-1 do
      if (TControl(Components[vIndex]).Parent = GoodsInfoPager) then
      begin
        if (Components[vIndex] is TcxCustomEdit) and (TControl(Components[vIndex]).Hint = '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := False
        else if (Components[vIndex] is TcxCustomEdit) and (TControl(Components[vIndex]).Hint <> '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := true;
      end;

    isChanged := False;
    ButtonToolBarSearchButton.Enabled := False;
    ButtonToolBarNewButton.Enabled    := False;
    ButtonToolBarDeleteButton.Enabled := False;
    ButtonToolBarCancelButton.Enabled := True;
    GoodsCodeCreateButton.Enabled     := False;
  end
  else
  begin
    GridTableView.Controller.ClearSelection;
    for vIndex := 0 to ComponentCount-1 do
      if (TControl(Components[vIndex]).Parent = GoodsInfoPager) and
        ((Components[vIndex] is TcxCustomEdit) or (Components[vIndex] is TcxButtonEdit)) then
      begin
        TcxCustomEdit(Components[vIndex]).EditModified := False;
        TcxCustomEdit(Components[vIndex]).Enabled  := True;
      end;

    GoodsCodeCreateButton.Enabled     := True;
    if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
      DoGridLink;
    isChanged := False;
  end;
end;

end.
