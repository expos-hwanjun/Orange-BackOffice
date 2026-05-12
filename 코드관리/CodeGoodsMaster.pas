unit CodeGoodsMaster;

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
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePagerStylers, dxBarBuiltInMenu, cxPC;

type
  TCodeGoodsMasterForm = class(TInheritGridEditForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    DetailSearchPanel: TAdvPanel;
    ScrollBox1: TScrollBox;
    Conditon1RadioGroup: TAdvOfficeRadioGroup;
    Conditon2RadioGroup: TAdvOfficeRadioGroup;
    Conditon3RadioGroup: TAdvOfficeRadioGroup;
    Conditon4RadioGroup: TAdvOfficeRadioGroup;
    Conditon5RadioGroup: TAdvOfficeRadioGroup;
    AdvGroupBox1: TAdvGroupBox;
    ConditionGoodsClassLabel: TLabel;
    Label4: TLabel;
    ConditionGoodsClassCodeEdit: TcxButtonEdit;
    ConditionGoodsClassNameEdit: TcxTextEdit;
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
    GridTableViewEventName: TcxGridColumn;
    GridTableViewEventDate: TcxGridColumn;
    GridTableViewEventPrice: TcxGridColumn;
    ConditionNotCompanyCheckBox: TAdvOfficeCheckBox;
    GoodsPager: TcxPageControl;
    GoodsInfoPager: TcxTabSheet;
    HistoryPager: TcxTabSheet;
    GoodsCodeLabel: TLabel;
    GoodsNameLabel: TLabel;
    MenuClassLabel: TLabel;
    PriceBuyLabel: TLabel;
    PriceSaleLabel: TLabel;
    CompanyLabel: TLabel;
    PriceProfitRateLabel: TLabel;
    StockTypeLabel: TLabel;
    PriceBuyNetLabel: TLabel;
    PriceBuyVatLabel: TLabel;
    StockOptimumQtyLabel: TLabel;
    EtcOrderUnitQtyLabel: TLabel;
    GoodsTypeLabel: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    GoodsClassTreeView: TcxTreeView;
    GoodsCodeEdit: TcxTextEdit;
    GoodsNameEdit: TcxTextEdit;
    GoodsClassCodeEdit: TcxButtonEdit;
    GoodsClassNameEdit: TcxTextEdit;
    PriceBuyEdit: TcxCurrencyEdit;
    PriceSaleEdit: TcxCurrencyEdit;
    CompanyCodeEdit: TcxButtonEdit;
    CompanyNameEdit: TcxTextEdit;
    PriceProfitRateEdit: TcxCurrencyEdit;
    PriceBuyProfitRateEdit: TcxCurrencyEdit;
    StockTypeComboBox: TcxComboBox;
    UseCheckBox: TcxCheckBox;
    PriceBuyNetEdit: TcxCurrencyEdit;
    PriceBuyVatEdit: TcxCurrencyEdit;
    StockOptimumQtyEdit: TcxCurrencyEdit;
    OrderUnitQtyEdit: TcxCurrencyEdit;
    DcCheckBox: TcxCheckBox;
    PointCheckBox: TcxCheckBox;
    GoodsTypeComboBox: TcxComboBox;
    GoodsShortNameEdit: TcxTextEdit;
    TaxComboBox: TcxComboBox;
    GoodsSpecEdit: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    InfoRegistDateLabel: TLabel;
    InfoFirstBuyDateLabel: TLabel;
    InfoRecentBuyDateLabel: TLabel;
    InfoRecentSurveyDateLabel: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    InfoRegistDateEdit: TcxTextEdit;
    InfoRecentBuyDateEdit: TcxTextEdit;
    InfoRecentSurveyDateEdit: TcxTextEdit;
    InfoFirstBuyDateEdit: TcxTextEdit;
    InfoEventPriceEdit: TcxCurrencyEdit;
    InfoEventNameEdit: TcxTextEdit;
    InfoEventTermEdit: TcxTextEdit;
    MemberGroupBox: TAdvGroupBox;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1DcRate: TcxGridColumn;
    GridTableView1PointRate: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    InputRemainCheckBox: TcxCheckBox;
    HeadMenuStatus: TcxLabel;
    GoodsCodeCreateButton: TAdvGlowButton;
    cxGrid1: TcxGrid;
    HistoryGridTableView: TcxGridTableView;
    HistoryGridTableViewHistoryDate: TcxGridColumn;
    HistoryGridTableViewWorkType: TcxGridColumn;
    HistoryGridTableViewMenusName: TcxGridColumn;
    HistoryGridTableViewBuyPrice: TcxGridColumn;
    HistoryGridTableViewAfterBuyPrice: TcxGridColumn;
    HistoryGridTableViewSalePrice: TcxGridColumn;
    HistoryGridTableViewAfterSalePrice: TcxGridColumn;
    HistoryGridTableViewProfitRate: TcxGridColumn;
    HistoryGridTableViewMenuShortName: TcxGridColumn;
    HistoryGridTableViewClassCode: TcxGridColumn;
    HistoryGridTableViewTaxYN: TcxGridColumn;
    HistoryGridTableViewType: TcxGridColumn;
    HistoryGridTableViewStockType: TcxGridColumn;
    HistoryGridTableViewCompanyCode: TcxGridColumn;
    HistoryGridTableViewSafetyQty: TcxGridColumn;
    HistoryGridTableViewOrderQty: TcxGridColumn;
    HistoryGridTableViewDCYN: TcxGridColumn;
    HistoryGridTableViewPointYN: TcxGridColumn;
    HistoryGridTableViewRcpYN: TcxGridColumn;
    HistoryGridTableViewUnitQty: TcxGridColumn;
    HistoryGridTableViewTipPrice: TcxGridColumn;
    HistoryGridTableViewUseYN: TcxGridColumn;
    HistoryGridTableViewUserName: TcxGridColumn;
    HistoryGridTableViewInsertDate: TcxGridColumn;
    HistoryGridTableViewPrgChange: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
    procedure KeyInButtonClick(Sender: TObject);
    procedure GoodsCodeCreateButtonClick(Sender: TObject);
    procedure GoodsCodeCreatePopupNormalClick(Sender: TObject);
    procedure GoodsCodeCreatePopupSelfClick(Sender: TObject);
    procedure GoodsClassCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GoodsNameEditExit(Sender: TObject);
    procedure GoodsClassTreeViewDblClick(Sender: TObject);
    procedure GoodsClassTreeViewExit(Sender: TObject);
    procedure GoodsClassTreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure GoodsClassTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConditionGoodsClassCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure HistoryPager1Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridTableView1DcRatePropertiesEditValueChanged(Sender: TObject);
    procedure GridTableView1PointRatePropertiesEditValueChanged(
      Sender: TObject);
    procedure GoodsCodeEditExit(Sender: TObject);
    procedure HistoryPagerShow(Sender: TObject);
  private
    MenuConfig :String;
    procedure GetGoodsClassName(Sender: TObject);
    procedure GetCompanyName(Sender: TObject);
    function  SearchCompany(Sender:TObject; aCompany: string = ''): string;
    procedure SetHistoryGridView;
    procedure SaveMemberDcPointRate(aMenu, aCode:String; aDcRate, aPointRate:Currency);
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
  CodeGoodsMasterForm: TCodeGoodsMasterForm;

implementation
uses Common, DBModule, Help, CodeClassHelp, Main;
{$R *.dfm}

{ TCodeGoodsMasterForm }

procedure TCodeGoodsMasterForm.HistoryPager1Show(Sender: TObject);
begin
  inherited;
  SetHistoryGridView;
end;

procedure TCodeGoodsMasterForm.HistoryPagerShow(Sender: TObject);
begin
  inherited;
  SetHistoryGridView;
end;

procedure TCodeGoodsMasterForm.CompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchCompany(Sender);
end;

procedure TCodeGoodsMasterForm.ConditionGoodsClassCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  vIndex: Integer;
begin
  inherited;

  // 상품분류를 조회한다
  with TCodeClassHelpForm.Create(Self) do
    try
      if ShowModal = mrOK then
      begin

        ConditionGoodsClassCodeEdit.Text := EmptyStr;
        ConditionGoodsClassNameEdit.Text := EmptyStr;
        for vIndex := 0 to ClassTreeView.SelectionCount - 1 do
        begin
          ConditionGoodsClassCodeEdit.Text := ConditionGoodsClassCodeEdit.Text
            + Ifthen(ConditionGoodsClassCodeEdit.Text=EmptyStr,'''',',''')+ PStrPointer(ClassTreeView.Selections[vIndex].Data).Data+'''';
          ConditionGoodsClassNameEdit.Text := ConditionGoodsClassNameEdit.Text
            + Ifthen(ConditionGoodsClassNameEdit.Text=EmptyStr,'',',')+ ClassTreeView.Selections[vIndex].Text;
        end;
        ConditionGoodsClassCodeEdit.Hint := ConditionGoodsClassCodeEdit.Text;
        ConditionGoodsClassNameEdit.Hint := ConditionGoodsClassNameEdit.Text;
        ConditionGoodsClassCodeEdit.SetFocus;
        IsChanged := False;
      end;
    finally
      Free;
    end;
end;

function TCodeGoodsMasterForm.DoDelete: Boolean;
var vMsg :String;
begin
  Result := False;
  try
    OpenQuery('select exists(select * from SL_SALE_D_SUM  where CD_HEAD =:P0 and CD_STORE =:P1 and CD_MENU =:P2)  as sale, '
             +'       exists(select * from SL_BUY_D       where CD_HEAD =:P0 and CD_STORE =:P1 and CD_GOODS =:P2)  as buy ',
             [HeadStoreCode,
              StoreCode,
              GoodsCodeEdit.Text]);

    if Query.FieldByName('sale').AsInteger > 0 then
      vMsg := vMsg + Ifthen(vMsg='', '매출', ',매출');
    if Query.FieldByName('buy').AsInteger > 0 then
      vMsg :=  vMsg+ Ifthen(vMsg='', '매입', ',매입');

    if vMsg <> '' then
    begin
      MsgBox(vMsg+' 데이터가 존재합니다'+#13+vMsg+ '데이터가 있으면 삭제할 수 없습니다');
      Exit;
    end;
  finally
    FinishQuery;
  end;

  try
    ExecQuery('delete from MS_SMALL '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_MENU  =:P2;'
             +'delete from MS_SPC_D '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P0 '
             +'   and CD_MENU  =:P1;'
             +'delete from MS_MENU '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P0 '
             +'   and CD_MENU  =:P1;'
             +'delete from MS_MENU_ITEM '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P0 '
             +'   and (CD_MENU  =:P1 or CD_ITEM = :P1);'
             +'delete from MS_MENU_MEMO '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P0 '
             +'   and CD_MENU  =:P1;'
             +'delete from MS_MENU_DC '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P0 '
             +'   and CD_MENU  =:P1;',
             [HeadStoreCode,
              StoreCode,
              GoodsCodeEdit.Text], true);
  except
    on E: Exception do begin
    ErrBox(E.Message);
    end;
  end;
  Result := True;
end;

procedure TCodeGoodsMasterForm.DoGridLink;
begin
  inherited;
  try
    GoodsCodeEdit.Properties.ReadOnly := true;
    GoodsCodeCreateButton.Enabled := false;
    OpenQuery('select g.CD_MENU, '
             +'       g.NM_MENU, '
             +'       g.NM_MENU_SHORT, '
             +'       g.NM_SPEC, '
             +'       g.CD_CLASS, '
             +'       g.DS_MENU_TYPE, '
             +'       g.PR_BUY, '
             +'       g.PR_SALE, '
             +'       g.DS_TAX, '
             +'       g.PR_SALE_PROFIT, '
             +'       g.CD_TRDPL, '
             +'       g.DS_STOCK, '
             +'       g.QTY_SAFETY, '
             +'       g.QTY_ORDER, '
             +'       g.YN_USE, '
             +'       g.DT_INSERT, '
             +'       GetMenuClassName(g.CD_HEAD, g.CD_STORE, g.CD_CLASS) as NM_CLASS, '
             +'       t.NM_TRDPL, '
             +'       StoD(e.YMD_BUY_FIRST) as YMD_BUY_FIRST, '
             +'       StoD(e.YMD_BUY_LAST) as YMD_BUY_LAST, '
             +'       StoD(e.YMD_SILSA) as YMD_SILSA, '
             +'       g.OPTIONS, '
             +'       g.CONFIG '
             +'  from MS_MENU g left outer join '
             +'       MS_TRD  t on g.CD_HEAD  = t.CD_HEAD '
             +'                and g.CD_STORE = t.CD_STORE '
             +'                and g.CD_TRDPL = t.CD_TRDPL left outer join '
             +'       MS_MENU_ETC as e on e.CD_HEAD  = g.CD_HEAD '
             +'                       and e.CD_STORE = g.CD_STORE '
             +'                       and e.CD_MENU  = g.CD_MENU '
             +' where g.CD_HEAD  =:P0 '
             +'   and g.CD_STORE =:P1 '
             +'   and g.CD_MENU  =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index]]);

    if Query.Eof then Exit;

    GoodsCodeEdit.Text          := Query.FieldByName('CD_MENU').AsString;
    GoodsNameEdit.Text          := Query.FieldByName('NM_MENU').AsString;
    GoodsNameEdit.EditModified  := false;
    GoodsShortNameEdit.Text     := Query.FieldByName('NM_MENU_SHORT').AsString;
    GoodsSpecEdit.Text          := Query.FieldByName('NM_SPEC').AsString;
    GoodsShortNameEdit.EditModified := false;
    GoodsClassCodeEdit.Text     := Query.FieldByName('CD_CLASS').AsString;
    GoodsClassNameEdit.Text     := Query.FieldByName('NM_CLASS').AsString;
    GoodsTypeComboBox.ItemIndex := GetStrPointerIndex(GoodsTypeComboBox, Query.FieldByName('DS_MENU_TYPE').AsString);
    PriceBuyEdit.Value          := Query.FieldByName('PR_BUY').AsCurrency;
    PriceSaleEdit.Value         := Query.FieldByName('PR_SALE').AsCurrency;
    TaxComboBox.ItemIndex      := GetStrPointerIndex(TaxComboBox, Query.FieldByName('DS_TAX').AsString);
    // 과세(포함)
    if GetStrPointerData(TaxComboBox) = '1' then
    begin
      if TaxRate <> 0 then
        PriceBuyNetEdit.Value  := CeilNumber(PriceBuyEdit.Value / TaxRate);
      PriceBuyVatEdit.Value       := PriceBuyEdit.Value - PriceBuyNetEdit.Value;
    end
    // 면세
    else if GetStrPointerData(TaxComboBox) = '0' then
    else
    begin
      PriceBuyNetEdit.Value    := PriceBuyEdit.Value;
      PriceBuyVatEdit.Value       := PriceBuyEdit.Value - PriceBuyNetEdit.Value;
    end;

    PriceProfitRateEdit.Value   := Query.FieldByName('PR_SALE_PROFIT').AsCurrency;
    if PriceBuyEdit.Value <> 0 then
      PriceBuyProfitRateEdit.Value     := RoundNumber((PriceSaleEdit.Value - PriceBuyEdit.Value) / PriceBuyEdit.Value * 100, 0.01)
    else
      PriceBuyProfitRateEdit.Value     := 0;
    CompanyCodeEdit.Text        := Query.FieldByName('CD_TRDPL').AsString;
    CompanyNameEdit.Text        := Query.FieldByName('NM_TRDPL').AsString;
    StockTypeComboBox.ItemIndex := GetStrPointerIndex(StockTypeComboBox, Query.FieldByName('DS_STOCK').AsString);
    StockOptimumQtyEdit.Value   := Query.FieldByName('QTY_SAFETY').AsCurrency;
    OrderUnitQtyEdit.Value      := Query.FieldByName('QTY_ORDER').AsCurrency;
    UseCheckBox.Checked         := Query.FieldByName('YN_USE').AsString = 'Y';
    DcCheckBox.Checked          := Copy(Query.FieldByName('CONFIG').AsString,1,1) = 'Y';
    PointCheckBox.Checked       := Copy(Query.FieldByName('CONFIG').AsString,2,1) = 'Y';
    MenuConfig                  := Query.FieldByName('CONFIG').AsString;

//    GoodsPager.Enabled := StockTypeComboBox.ItemIndex < 2;

    //등록일자
    if Query.FieldByName('DT_INSERT').AsString = EmptyStr then
      InfoRegistDateEdit.Text          := EmptyStr
    else
      InfoRegistDateEdit.Text          := FormatDateTime(fmtDate, Query.FieldByName('DT_INSERT').AsDateTime);

    InfoEventNameEdit.Text   := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewEventName.Index],'');
    InfoEventPriceEdit.Value := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewEventPrice.Index],0);
    InfoEventTermEdit.Text   := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewEventDate.Index],'');

    if Query.FieldByName('YMD_BUY_FIRST').AsString = EmptyStr then
      InfoFirstBuyDateEdit.Text          := '없음'
    else
      InfoFirstBuyDateEdit.Text          := Query.FieldByName('YMD_BUY_FIRST').AsString;

    if Query.FieldByName('YMD_BUY_LAST').AsString = EmptyStr then
      InfoRecentBuyDateEdit.Text          := '없음'
    else
      InfoRecentBuyDateEdit.Text          := Query.FieldByName('YMD_BUY_LAST').AsString;

    if Query.FieldByName('YMD_SILSA').AsString = EmptyStr then
      InfoRecentSurveyDateEdit.Text          := '없음'
    else
      InfoRecentSurveyDateEdit.Text          := Query.FieldByName('YMD_SILSA').AsString;

     HeadMenuStatus.Caption := '매장메뉴';
     //표준메뉴 사용시 이미지는 표준에서만 지정가능
     if (Copy(Query.FieldByName('OPTIONS').AsString,1,1) = '1') then
     begin
       HeadMenuStatus.Visible  := true;
       if Copy(Query.FieldByName('OPTIONS').AsString,2,1) = '1' then
       begin
         HeadMenuStatus.Caption := '단가고정';
         PriceSaleEdit.Properties.ReadOnly       := true;
         PriceProfitRateEdit.Properties.ReadOnly := true;
       end
       else
         HeadMenuStatus.Caption := '표준메뉴';
     end
     else
     begin
       HeadMenuStatus.Visible   := false;
     end;

    //회원등급 할인/포인트
    if (GetOption(251) = '1') or (GetOption(258) = '1') then
      try
        DM.OpenQuery('select a.NM_CODE1, '
                    +'       ifnull(b.DC_RATE,0)    as DC_RATE, '
                    +'       ifnull(b.POINT_RATE,0) as POINT_RATE, '
                    +'       a.CD_CODE '
                    +'  from MS_CODE    a left outer join'
                    +'       MS_MENU_DC b on a.CD_HEAD  = b.CD_HEAD '
                    +'                   and a.CD_STORE = b.CD_STORE '
                    +'                   and a.CD_CODE  = b.DS_MEMBER '
                    +'                   and b.CD_MENU =:P2  '
                    +' where a.CD_HEAD  =:P0 '
                    +'   and a.CD_STORE =:P1 '
                    +'   and a.CD_KIND  = ''05'' '
                    +' order by a.CD_CODE ',
                    [HeadStoreCode,
                     StoreCode,
                     GoodsCodeEdit.Text]);
        DM.ReadQuery(DM.Query, GridTableView1);
      finally
        DM.FinishQuery;
      end;
  finally
    FinishQuery;
    isChanged := false;
  end;

  case GoodsPager.ActivePageIndex of
    1 : SetHistoryGridView;
  end;
end;

function TCodeGoodsMasterForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    GoodsPager.Enabled    := true;
    UseCheckBox.Checked   := true;
    DcCheckBox.Checked    := true;
    PointCheckBox.Checked := true;

    // (상품코드) 생성 버튼을 활성화한다
    GoodsCodeCreateButton.Enabled  := true;
    GoodsCodeEdit.Clear;
    GoodsCodeEdit.TabStop             := true;
    GoodsCodeEdit.Properties.ReadOnly := false;
    GoodsCodeEdit.Style.Color         := clWindow;
    GoodsCodeEdit.Properties.ReadOnly := false;
    GoodsNameEdit.Properties.ReadOnly := false;
    GoodsNameEdit.SetFocus;
  finally
    isLoading := false;
    Result    := true;
  end;
end;

function TCodeGoodsMasterForm.DoSave: Boolean;
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
      vParamIndex := 2;
      if DcCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ''%s'', Right(CONFIG,%d)), ',[Ifthen(DcCheckBox.Checked,'1','0'),29]);

      if PointCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[1,Ifthen(PointCheckBox.Checked,'1','0'),28]);


      for vIndex := 0 to ComponentCount-1 do
      begin
        if (TControl(Components[vIndex]).Parent = GoodsInfoPager)
          and ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))  then
        begin
          if (TControl(Components[vIndex]).Hint = 'YN_DC')
            or (TControl(Components[vIndex]).Hint = 'YN_POINT') then
          Continue
          else
          begin
            if (Components[vIndex] is TcxCustomEdit) then
              vSQLText    := vSQLText    + TcxCustomEdit(Components[vIndex]).Hint+Format('=:P%s, ',[IntToStr(vParamIndex)]);
              Inc(vParamIndex);
          end;
        end;
      end;


      vSQLText := 'update MS_MENU set '
                 + vSQLText +' PRG_CHANGE = ''MST'', CD_SAWON_CHG = '''+UserCode+''', DT_CHANGE = Now() '
                 +' where CD_HEAD =:P0 and CD_STORE =:P1';

      vCode := EmptyStr;
      for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        vCode := vCode + Format('''%s'',',[String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewGoodsCode.Index])]);

      vCode    := 'and CD_MENU in ('+LeftStr(vCode, Length(vCode)-1)+');';

      vSQLText := vSQLText + vCode;

      //Param에 값을 대입한다
      vParamIndex := 2;                                   //

      for vIndex := 0 to ComponentCount-1 do
      begin
        if (TControl(Components[vIndex]).Parent = GoodsInfoPager)
          and ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))  then
        begin
          if (TControl(Components[vIndex]).Hint = 'YN_DC')
            or (TControl(Components[vIndex]).Hint = 'YN_POINT') then
            Continue
          else
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
      end;

      vSQLText := Replace(vSQLText, ':P0', Format('''%s''',[HeadStoreCode]));
      vSQLText := Replace(vSQLText, ':P1', Format('''%s''',[StoreCode]));
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
      if OpenQuery('select YN_USE '
                  +'  from MS_MENU '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and CD_MENU  =:P2 ',
                  [HeadStoreCode,
                   StoreCode,
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
      end;
    finally
      FinishQuery;
    end;
  end;

  if isNew then
  begin
    try
      if OpenQuery('select CD_MENU '
                  +'  from MS_MENU '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and NM_MENU  =:P2 ',
                  [HeadStoreCode,
                   StoreCode,
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

  //저울메뉴
  if (GetStrPointerData(GoodsTypeComboBox) ='W') and (PriceSaleEdit.Value = 0) then
  begin
    ErrBox('저울상품일때는 판매단가가 반드시 입력되어야 합니다');
    PriceSaleEdit.SetFocus;
    Exit;
  end;

  if isNew then
    try
      OpenQuery('select Count(*) '
               +'  from MS_MENU '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 ',
               [HeadStoreCode,
                StoreCode]);

      if Query.Fields[0].AsInteger > AllowMenuCount then
      begin
        ErrBox(Format('메뉴는 최대 %d 까지 등록가능합니다',[AllowMenuCount]));
        Exit;
      end;
    finally
      Query.Close;
    end;

  if isNew then
    vConfig := Ifthen(DCCheckBox.Checked, 'Y', 'N')
              +Ifthen(PointCheckBox.Checked, 'Y', 'N')
                  +'Y'
                  +'N'
                  +'Y'
                  +'N'
                  +'N'
                  +'N'
                  +'N'
                  +LPad('',11,'0')
  else
    vConfig := Ifthen(DCCheckBox.Checked, 'Y', 'N')
              +Ifthen(PointCheckBox.Checked, 'Y', 'N')
              +RightStr(MenuConfig,28);

  try
    ExecQuery(Ifthen(isNew, 'insert into MS_MENU(CD_HEAD, '
                           +'                    CD_STORE, '
                           +'                    CD_MENU, '
                           +'	 				           NM_MENU, '
                           +'	 				           NM_MENU_SHORT, '
                           +'                    NM_SPEC, '
                           +'	 				           CD_CLASS, '
                           +'	 				           DS_MENU_TYPE, '
                           +'                    PR_BUY, '
                           +'	 				           PR_SALE, '
                           +'	 				           PR_SALE_PROFIT, '
                           +'	 				           DS_TAX, '
                           +'	 				           DS_STOCK, '
                           +'                    CD_TRDPL, '
                           +'                    QTY_SAFETY, '
                           +'                    QTY_ORDER, '
                           +'                    YN_USE, '
                           +'	 				           CONFIG, '
                           +'	 				           CD_SAWON_CHG, '
                           +'	 				           DT_CHANGE, '
                           +'                    PRG_INSERT, '
                           +'                    PRG_CHANGE) '
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
                           +'	 				         	Now(), '
                           +'                   ''MST'', '
                           +'                   ''MST'');',
                           'update MS_MENU set NM_MENU        = :P3, '
                           +'                  NM_MENU_SHORT  = :P4, '
                           +'                  NM_SPEC        = :P5, '
                           +'                  CD_CLASS       = :P6, '
                           +'                  DS_MENU_TYPE   = :P7, '
                           +'                  PR_BUY         = :P8, '
                           +'                  PR_SALE        = :P9, '
                           +'                  PR_SALE_PROFIT = :P10, '
                           +'                  DS_TAX         = :P11, '
                           +'                  DS_STOCK       = :P12, '
                           +'                  CD_TRDPL       = :P13, '
                           +'                  QTY_SAFETY     = :P14, '
                           +'                  QTY_ORDER      = :P15, '
                           +'                  YN_USE         = :P16, '
                           +'                  CONFIG         = :P17, '
                           +'                  CD_SAWON_CHG   = :P18, '
                           +'                  DT_CHANGE      = Now(), '
                           +'                  PRG_CHANGE     =''MST'' '
                           +' where CD_HEAD  =:P0 '
                           +'   and CD_STORE =:P1 '
                           +'   and CD_MENU  =:P2;'),
                           [HeadStoreCode,
                            StoreCode,
                            GoodsCodeEdit.Text,
                            GoodsNameEdit.Text,
                            GoodsShortNameEdit.Text,
                            GoodsSpecEdit.Text,
                            GoodsClassCodeEdit.Text,
                            GetStrPointerData(GoodsTypeComboBox),
                            PriceBuyEdit.Value,
                            PriceSaleEdit.Value,
                            PriceProfitRateEdit.Value,
                            GetStrPointerData(TaxComboBox),
                            GetStrPointerData(StockTypeComboBox),
                            CompanyCodeEdit.Text,
                            StockOptimumQtyEdit.Value,
                            OrderUnitQtyEdit.Value,
                            Ifthen(UseCheckBox.Checked, 'Y', 'N'),
                            vConfig,
                            UserCode], false);

    //메뉴단축명 변경 시 PLU명도 변경한다.
    if not isNew and GoodsNameEdit.EditModified then
    begin
      ExecQuery('update MS_SMALL '
               +'   set NM_VIEW = :P3 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MENU  =:P2;',
               [HeadStoreCode,
                StoreCode,
                GoodsCodeEdit.Text,
                GoodsShortNameEdit.Text], false);
    end;


    //메뉴를 단종처리하면 PLU에서 자동 삭제한다
    if not UseCheckBox.Checked then
      ExecQuery('delete from MS_SMALL '
               +'      where CD_HEAD  =:P0 '
               +'        and CD_STORE =:P1 '
               +'        and CD_MENU  =:P2',
               [HeadStoreCode,
                StoreCode,
                GoodsCodeEdit.Text], false);

    ExecQuery(TempSQL,[], true);
    ExtremeMainForm.PosSendMessage;
    result := true;
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

function TCodeGoodsMasterForm.DoSearch: Boolean;
var
  vWhere1,vWhere2,vWhere3,vWhere4,vWhere5,vWhere6,vWhere7,vWhere8, vWhere9, vWhere10: String;
  vList  : TStringList;
  vIndex : Integer;
begin
  DetailSearchPanel.Collaps := true;
  Result := false;
  case Conditon1RadioGroup.ItemIndex of
     1: vWhere1 := ' and m.YN_USE = ''Y'' ';
     2: vWhere1 := ' and m.YN_USE = ''N'' ';
     else vWhere1 := '';
  end;

  case Conditon2RadioGroup.ItemIndex of
     1: vWhere2 := ' and m.DS_MENU_TYPE = ''N'' ';
     2: vWhere2 := ' and m.DS_MENU_TYPE = ''G'' ';
     3: vWhere2 := ' and m.DS_MENU_TYPE = ''W'' ';
     else vWhere2 := ' and m.DS_MENU_TYPE in (''N'', ''G'', ''W'', ''I'') ';
  end;

  case Conditon3RadioGroup.ItemIndex of
     1: vWhere3 := ' and Substring(m.CONFIG,1,1) = ''Y'' ';
     2: vWhere3 := ' and Substring(m.CONFIG,1,1) = ''N'' ';
     3: vWhere3 := ' and Substring(m.CONFIG,2,1) = ''Y'' ';
     4: vWhere3 := ' and Substring(m.CONFIG,2,1) = ''N'' ';
     else vWhere3 := '';
  end;

  case Conditon4RadioGroup.ItemIndex of
     1: vWhere4 := ' and m.DS_TAX = ''1'' ';
     2: vWhere4 := ' and m.DS_TAX = ''0'' ';
     3: vWhere4 := ' and m.DS_TAX = ''2'' ';
     else vWhere4 := '';
  end;

  case Conditon5RadioGroup.ItemIndex of
     2: vWhere5 := ' and m.DS_STOCK = ''0'' ';
     1: vWhere5 := ' and m.DS_STOCK = ''1'' ';
     else vWhere5 := '';
  end;

   //1:YN_DC, 2:YN_POINT, 3:YN_RCP, 4,YN_PERSON, 5,YN_BILL, 6:YN_TABLECOLOR, 7:YN_TICKET, 8:YN_SOLDOUT, 9:YN_POINT_LIMIT
  if ConditionGoodsClassCodeEdit.Text <> '' then
  begin
    if Pos(',',ConditionGoodsClassCodeEdit.Text) > 0 then
    begin
      vList := TStringList.Create;
      try
        Split(ConditionGoodsClassCodeEdit.Text, ',', vList);

        for vIndex := 0 to vList.Count-1 do
          vWhere6 := vWhere6 + ' (m.CD_CLASS like '+ vList.Strings[vIndex] +'+''%'') '+Ifthen(vIndex < vList.Count-1, ' or ', '');

        vWhere6 := ' and ('+vWhere6 +') ';
      finally
        vList.Free
      end;
    end
    else
    begin
      if (Pos('''',ConditionGoodsClassCodeEdit.Text) = 0) and (ConditionGoodsClassNameEdit.Text <> EmptyStr) then
        vWhere6 := ' and m.CD_CLASS = '''+ConditionGoodsClassCodeEdit.Text+''' '
      else
      begin
        if (Pos('''',ConditionGoodsClassCodeEdit.Text) = 0) then
          vWhere6 := ' and m.CD_CLASS like ConCat('''+ConditionGoodsClassCodeEdit.Text+''',''%'') '
        else
          vWhere6 := ' and m.CD_CLASS like ConCat('+ConditionGoodsClassCodeEdit.Text+',''%'') ';
      end;
    end;
  end
  else
    vWhere6 := '';

  if ConditionCompanyCodeEdit.Text <> '' then
  begin
    if Pos(',',ConditionCompanyCodeEdit.Text) > 0 then
      vWhere7 := ' and m.CD_TRDPL in ('+ConditionCompanyCodeEdit.Text+') '
    else
      vWhere7 := ' and m.CD_TRDPL = '''+Replace(ConditionCompanyCodeEdit.Text,'''','')+''' ';
  end
  else
    vWhere7 := '';

  if (ConditionFromDateEdit.CurrentDate > 0) and (ConditionToDateEdit.CurrentDate > 0) then
    vWhere8 := ' and Date_Format(m.DT_CHANGE, ''%Y%m%d'') between '''+DToS(ConditionFromDateEdit.CurrentDate)+''' and '''+DToS(ConditionToDateEdit.CurrentDate)+''' '
  else
    vWhere8 := '';

  if ConditionNotCompanyCheckBox.Checked then
    vWhere9 := ' and Ifnull(m.CD_TRDPL,'''') = '''' ';

  if ConditionNotClassCheckBox.Checked then
    vWhere10 := ' and Ifnull(m.CD_CLASS,'''') = '''' ';


  OpenQuery('select m.CD_MENU as CD_GOODS, '
           +'       m.NM_MENU as NM_GOODS, '
           +'       m.YN_USE, '
           +'       Ifnull(e.NM_SPC,'''') as NM_SPC, '
           +'       Ifnull(e.DT_SPC,'''') as DT_SPC, '
           +'       Ifnull(e.PR_SALE,0) as PR_SALE '
           +'  from MS_MENU m left outer join '
           +'       (select Min(d.NO_SPC) as NO_SPC, '
           +'               h.NM_SPC, '
           +'               ConCat(substring(h.DT_FROM,5,2),''-'',substring(h.DT_FROM,7,2),''~'',substring(h.DT_TO,5,2),''-'',substring(h.DT_TO,7,2)) as DT_SPC, '
           +'               d.CD_MENU, '
           +'               d.PR_SALE '
           +'          from MS_SPC_D d inner join '
           +'               MS_SPC_H h on d.CD_HEAD = h.CD_HEAD and d.CD_STORE = h.CD_STORE and d.NO_SPC = h.NO_SPC '
           +'         where d.CD_STORE = :P0 '
           +'           and h.DT_FROM <= Date_Format(Now(), ''%Y%m%d'') and h.DT_TO >= Date_Format(Now(), ''%Y%m%d'') '
           +'           and d.YN_USE = ''0'' '
           +'           and h.YN_USE = ''0'' '
           +'         group by d.NO_SPC, h.NM_SPC, h.DT_FROM, h.DT_TO, d.CD_MENU, d.PR_SALE) as e on m.CD_MENU = e.CD_MENU'
           +' where m.CD_HEAD = :P0 '
           +'   and m.CD_STORE =:P1 '
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
           +'   and (m.CD_MENU = :P2 or m.NM_MENU like ConCat(''%'',:P2,''%'')) '
           +' order by m.CD_MENU ',
           [HeadStoreCode,
            StoreCode,
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TCodeGoodsMasterForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = CompanyCodeEdit) and
     (Length(CompanyCodeEdit.Text) <> 6) and
     (CompanyNameEdit.Text <> EmptyStr)  then
  begin
    CompanyNameEdit.Clear;
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
    if (GetStrPointerData(TaxComboBox) = '1') then
    begin
      if TaxRate <> 0 then
        PriceBuyNetEdit.Value := CeilNumber(PriceBuyEdit.Value / TaxRate);
    end
    // 면세
    else
    begin
      PriceBuyNetEdit.Value   := PriceBuyEdit.Value;
    end;
    PriceBuyVatEdit.Value   := PriceBuyEdit.Value - PriceBuyNetEdit.Value;
  end
  // 상품분류를 변경할 때
  else if (Sender = GoodsClassCodeEdit) and (GoodsClassNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(GoodsClassCodeEdit.Text) <> GoodsClassCodeEdit.Text) or (Length(GoodsClassCodeEdit.Text) <> (StoI(GetOption(248))+1)*2)) then
    GoodsClassNameEdit.Clear

  // 상품분류를 변경할 때(상세검색)
  else if (Sender = ConditionGoodsClassCodeEdit) and (ConditionGoodsClassNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(ConditionGoodsClassCodeEdit.Text) <> ConditionGoodsClassCodeEdit.Text) or (Length(ConditionGoodsClassCodeEdit.Text) <> (StoI(GetOption(248))+1)*2)) then
  begin
    ConditionGoodsClassNameEdit.Clear;
    isChanged := false;
    Exit;
  end
  else if (Sender = ConditionGoodsClassCodeEdit) then
  begin
    isChanged := false;
  end
  else if Sender = InputRemainCheckBox then
  begin
   // Tag를 99로 해 놓으면 신규 시에도 값을 지우지 않는다
    GoodsClassCodeEdit.Tag  := IfThen(InputRemainCheckBox.Checked, 99, 0);
    GoodsClassNameEdit.Tag  := GoodsClassCodeEdit.Tag;
    GoodsTypeComboBox.Tag   := GoodsClassCodeEdit.Tag;
    StockTypeComboBox.Tag   := GoodsClassCodeEdit.Tag;
    TaxComboBox.Tag         := GoodsClassCodeEdit.Tag;
    UseCheckBox.Tag         := GoodsClassCodeEdit.Tag;
    DcCheckBox.Tag          := GoodsClassCodeEdit.Tag;
    PointCheckBox.Tag       := GoodsClassCodeEdit.Tag;
  end;
end;

procedure TCodeGoodsMasterForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var  vCode, vName: string;
     vTemp : Currency;
begin
  inherited;
  // 상품분류
  if Sender = GoodsClassCodeEdit then
  begin
    // 상품분류코드에 문자를 입력했으면 해당 분류를 찾아와 표시한다
    if (DisplayValue <> EmptyStr) and (GoodsClassNameEdit.Text = EmptyStr) and
       ((GetOnlyNumber(DisplayValue) <> DisplayValue) or (Length(DisplayValue) <> (StoI(GetOption(248))+1)*2)) then
    begin
      OpenQuery('select   CD_CLASS, '
               +'         GetMenuClassName(CD_HEAD, CD_STORE, CD_CLASS) as NM_CLASS '
               +'from     MS_MENU_CLASS '
               +'where    CD_HEAD       = :P0 '
               +'  and    CD_STORE      = :P1 '
               +'  and    Length(CD_CLASS) = :P2 '
               +'  and    NM_CLASS like ConCat(''%'',:P3,''%'') '
               +'order by NM_CLASS',
                [HeadStoreCode,
                 StoreCode,
                 (StoI(GetOption(248))+1)*2,
                 GoodsClassCodeEdit.Text]);
      try
        if not Query.eof then
        begin
          DisplayValue            := Query.Fields[0].AsString;
          GoodsClassNameEdit.Text := Query.Fields[1].AsString;
        end;
        if GoodsClassNameEdit.Text = EmptyStr then
          ShowMsg(MenuClassLabel.Caption+msgMustInput, true);
      finally
        FinishQuery;
      end;
    end
    else
      GetGoodsClassName(GoodsClassCodeEdit);
  end
  else if Sender = ConditionGoodsClassCodeEdit then
  begin
    // 상품분류코드에 문자를 입력했으면 해당 분류를 찾아와 표시한다
    if (DisplayValue <> EmptyStr) and (ConditionGoodsClassNameEdit.Text = EmptyStr) and
       ((GetOnlyNumber(DisplayValue) <> DisplayValue) or (Length(DisplayValue) <> (StoI(GetOption(248))+1)*2)) then
    begin
      OpenQuery('select   CD_CLASS, '
               +'         GetMenuClassName(CD_HEAD, CD_STORE, CD_CLASS) as NM_CLASS '
               +'from     MS_MENU_CLASS '
               +'where    CD_HEAD       = :P0 '
               +'  and    CD_STORE      = :P1 '
               +'  and    Length(CD_CLASS) = :P2 '
               +'  and    NM_CLASS like ConCat(''%'',:P3,''%'') '
               +'order by NM_CLASS',
                [HeadStoreCode,
                 StoreCode,
                 (StoI(GetOption(248))+1)*2,
                 ConditionGoodsClassCodeEdit.Text]);
      try
        if not Query.eof then
        begin
          DisplayValue                     := Query.Fields[0].AsString;
          ConditionGoodsClassNameEdit.Text := Query.Fields[1].AsString;
        end;
        if ConditionGoodsClassNameEdit.Text = EmptyStr then
          ShowMsg(MenuClassLabel.Caption+msgMustInput, true);
      finally
        FinishQuery;
      end;
    end
    else
      GetGoodsClassName(ConditionGoodsClassCodeEdit);
    Exit;
  end
  // 거래처
  else if Sender = CompanyCodeEdit then
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
                 StoreCode,
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
                 StoreCode,
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

    if PriceBuyEdit.Value <> 0 then
      PriceBuyProfitRateEdit.Value := RoundNumber((Currency(DisplayValue) - PriceBuyEdit.Value) / PriceBuyEdit.Value * 100, 0.01)
    else
      PriceBuyProfitRateEdit.Value := 0;
  end

  // 매입단가
  else if Sender = PriceBuyEdit then
  begin
    // 이익률을 새로 구한다
    PriceProfitRateEdit.Value  := CalcSaleProfitRate(Currency(DisplayValue), PriceSaleEdit.Value);
    if Currency(DisplayValue) <> 0 then
      PriceBuyProfitRateEdit.Value := RoundNumber((PriceSaleEdit.Value - Currency(DisplayValue)) / Currency(DisplayValue) * 100, 0.01)
    else
      PriceBuyProfitRateEdit.Value := 0;
    // 공급가, 부가세를 새로 구한다
    if (GetStrPointerData(TaxComboBox) = '1') then
    begin
      if TaxRate <> 0 then
        PriceBuyNetEdit.Value := CeilNumber(Currency(DisplayValue) / TaxRate);
    end
    else
      PriceBuyNetEdit.Value   := Currency(DisplayValue);
    PriceBuyVatEdit.Value   := Currency(DisplayValue) - PriceBuyNetEdit.Value;
  end

  // 매입공급가
  else if Sender = PriceBuyNetEdit then
  begin
    // 공급가, 부가세를 새로 구한다
    if (GetStrPointerData(TaxComboBox) = '1') then
      PriceBuyEdit.Value  := CeilNumber(Currency(DisplayValue) * TaxRate)
    else
      PriceBuyEdit.Value  := Currency(DisplayValue);
    PriceBuyVatEdit.Value := PriceBuyEdit.Value - Currency(DisplayValue);

    // 이익률을 새로 구한다
    PriceProfitRateEdit.Value  := CalcSaleProfitRate(PriceBuyEdit.Value, PriceSaleEdit.Value);

    if PriceBuyEdit.Value <> 0 then
      PriceBuyProfitRateEdit.Value := RoundNumber((PriceSaleEdit.Value - PriceBuyEdit.Value) / PriceBuyEdit.Value * 100, 0.01)
    else
      PriceBuyProfitRateEdit.Value := 0;
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
        // 매입이익률
        if PriceBuyEdit.Value <> 0 then
          PriceBuyProfitRateEdit.Value := RoundNumber((PriceSaleEdit.Value - PriceBuyEdit.Value) / PriceBuyEdit.Value * 100, 0.01)
        else
          PriceBuyProfitRateEdit.Value := 100;
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
      PriceBuyVatEdit.Value     := PriceBuyEdit.Value - PriceBuyNetEdit.Value;
    end;
  end;
  isChanged := true;
end;

procedure TCodeGoodsMasterForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  HelpURL := 'BackOffice/코드관리/4.상품관리/상품관리.htm';

  // 메뉴구분
  New(vCode);
  vCode^.Data := 'N';
  GoodsTypeComboBox.Properties.Items.AddObject('일반', TObject(vCode));
  New(vCode);
  vCode^.Data := 'G';
  GoodsTypeComboBox.Properties.Items.AddObject('오픈단가', TObject(vCode));
  New(vCode);
  vCode^.Data := 'W';
  GoodsTypeComboBox.Properties.Items.AddObject('저울상품', TObject(vCode));
  New(vCode);
  vCode^.Data := 'I';
  GoodsTypeComboBox.Properties.Items.AddObject('아이템상품', TObject(vCode));

  // 세무구분
  New(vCode);
  vCode^.Data := '1';
  TaxComboBox.Properties.Items.AddObject('과세', TObject(vCode));
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
end;

procedure TCodeGoodsMasterForm.FormShow(Sender: TObject);
begin
  inherited;
  //회원등급별 할인/포인트
  MemberGroupBox.Visible          := (GetOption(251) = '1') or (GetOption(258) = '1');
  GoodsPager.ActivePageIndex := 0;
end;

//------------------------------------------------------------------------------
// 거래처 이름 구하기
procedure TCodeGoodsMasterForm.GetCompanyName(Sender: TObject);
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
                 StoreCode,
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
                StoreCode,
                ConditionCompanyCodeEdit.Text]);
      try
        if Query.Eof or (Query.Fields[0].AsString = EmptyStr) then
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

procedure TCodeGoodsMasterForm.GetGoodsClassName(Sender: TObject);
begin
  if Sender = GoodsClassCodeEdit then
  begin
    // 상품분류코드를 2, 4, 6, 8 자리로 숫자로 입력했으면 이름을 불러와 표시한다
    if (GoodsClassCodeEdit.Text <> EmptyStr) and
       (GoodsClassNameEdit.Text =  EmptyStr) and
       (GetOnlyNumber(GoodsClassCodeEdit.Text) = GoodsClassCodeEdit.Text) and
       (Length(GoodsClassCodeEdit.Text) = (StoI(GetOption(248))+1)*2) then
    begin
      OpenQuery('select GetMenuClassName(:P0, :P1, :P2) as NM_CLASS',
                [HeadStoreCode,
                 StoreCode,
                 GoodsClassCodeEdit.Text]);
      try
        GoodsClassNameEdit.Text := Query.Fields[0].AsString;
        if GoodsClassNameEdit.Text = EmptyStr then
          ShowMsg(MenuClassLabel.Caption+msgMustInput, true)
      finally
        FinishQuery;
      end;
    end;
  end
  else if Sender = ConditionGoodsClassCodeEdit then
  begin
    // 상품분류코드를 2, 4, 6, 8 자리로 숫자로 입력했으면 이름을 불러와 표시한다
    if (ConditionGoodsClassCodeEdit.Text <> EmptyStr) and
       (ConditionGoodsClassNameEdit.Text =  EmptyStr) and
       (GetOnlyNumber(ConditionGoodsClassCodeEdit.Text) = ConditionGoodsClassCodeEdit.Text) and
       (Length(ConditionGoodsClassCodeEdit.Text) = (StoI(GetOption(248))+1)*2) then
    begin
      OpenQuery('select  GetMenuClassName(:P0, :P1, :P2) as NM_CLASS',
                [HeadStoreCode,
                 StoreCode,
                 ConditionGoodsClassCodeEdit.Text]);
      try
        ConditionGoodsClassNameEdit.Text := Query.Fields[0].AsString;
        if ConditionGoodsClassNameEdit.Text = EmptyStr then
          ShowMsg(MenuClassLabel.Caption+msgMustInput, true)
      finally
        FinishQuery;
      end;
    end;
  end;
end;

procedure TCodeGoodsMasterForm.GoodsClassCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  vClassCode: PStrPointer;
  vTreeNode : TTreeNode;
begin
  inherited;
  // 상품분류 테이블에서 상품분류을 불러오는 창을 띄운다
  if not GoodsClassTreeView.Visible then
  begin
    GoodsClassTreeView.Left    := GoodsClassNameEdit.Left;
    GoodsClassTreeView.Top     := GoodsClassNameEdit.Top;
    GoodsClassTreeView.Visible := true;
    GoodsClassTreeView.BringToFront;
    GoodsClassTreeView.Items.Clear;
    Application.ProcessMessages;

    OpenQuery('select   NM_CLASS, '
             +'         CD_CLASS '
             +'from     MS_MENU_CLASS '
             +'where    CD_HEAD       = :P0 '
             +'  and    CD_STORE      = :P1 '
             +'  and    Length(CD_CLASS) = 2',
              [HeadStoreCode,
               StoreCode]);
    try
      while not Query.Eof do
      begin
        New(vClassCode);
        vClassCode^.Data := Query.Fields[1].AsString;
        vTreeNode        := GoodsClassTreeView.Items.AddObject(nil, Query.Fields[0].AsString, vClassCode);
        if GetOption(248) <> '0' then
          vTreeNode.HasChildren := true;
        Query.Next;
      end;
    finally
      FinishQuery;
    end;

    if GoodsClassTreeView.Items.Count > 0 then
      GoodsClassTreeView.SetFocus
    else
      GoodsClassTreeView.Visible := false;
  end;
end;

procedure TCodeGoodsMasterForm.GoodsClassTreeViewDblClick(Sender: TObject);
var
  vClassData: PStrPointer;
  vClassName: string;
  vTreeNode : TTreeNode;
begin
  inherited;

  // 선택된 노드가 있고 자식이 없는 노드라면
  vTreeNode := (Sender as TcxTreeView).Selected;

  //상품정보의 상품분류 검색버튼을 클릭했을경우
  if (vTreeNode <> nil) and (vTreeNode.Count = 0) then
  begin
    vClassData              := vTreeNode.Data;
    vClassName              := vTreeNode.Text;
    while vTreeNode.Parent <> nil do
    begin
      vTreeNode  := vTreeNode.Parent;
      vClassName := vTreeNode.Text+' - '+vClassName;
    end;

    // 상품분류 트리를 숨긴다
    (Sender as TcxTreeView).Visible := false;

    GoodsClassCodeEdit.Text := vClassData^.Data;
    GoodsClassNameEdit.Text := vClassName;
    GoodsClassCodeEdit.EditModified := true;
    if MainPanel.Enabled and PriceBuyEdit.Enabled then
      PriceBuyEdit.SetFocus;
    isChanged := true;
  end;
end;

procedure TCodeGoodsMasterForm.GoodsClassTreeViewExit(Sender: TObject);
begin
  inherited;
  // 상품분류 트리를 숨긴다
  (Sender as TcxTreeView).Visible := false;
end;

procedure TCodeGoodsMasterForm.GoodsClassTreeViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  vClassData, vClassCode: PStrPointer;
  vTreeNode: TTreeNode;
begin
  inherited;
  // 현재 노드의 자식이 있다고 하면서 실제로는 자식이 없는 경우에는 새로 쿼리를 해 본다(최초 확장 시)
  if Node.HasChildren and (Node.Count = 0) then
  begin
    vClassData := Node.Data;
    OpenQuery('select   NM_CLASS, '
             +'         CD_CLASS '
             +'from     MS_MENU_CLASS '
             +'where    CD_HEAD  = :P0 '
             +'  and    CD_STORE = :P1 '
             +'  and    CD_CLASS like ConCat(:P2,''%'') '
             +'  and    Length(CD_CLASS) = :P3 ',
              [HeadStoreCode,
               StoreCode,
               vClassData^.Data,
               Length(vClassData^.Data)+2]);
    try
      while not Query.Eof do
      begin
        New(vClassCode);
        vClassCode^.Data := Query.Fields[1].AsString;
        vTreeNode        := (Sender as TcxCustomInnerTreeView).Items.AddChildObject(Node, Query.Fields[0].AsString, vClassCode);
        // 환경설정에서 관리하겠다고 한 최대 자릿수보다 작으면 자식노드가 있다고 간주한다
        if Length(vClassCode^.Data) < (StoI(GetOption(248))+1)*2 then
          vTreeNode.HasChildren := true;
        Query.Next;
      end;
      Node.HasChildren := Node.Count > 0;
      AllowExpansion   := Node.HasChildren;
    finally
      FinishQuery;
    end;
  end;
end;

procedure TCodeGoodsMasterForm.GoodsClassTreeViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  // Enter를 누르면 더블클릭을 한 것과 같은 처리를 한다
  if Key = VK_Return then
    GoodsClassTreeViewDblClick(Sender)

  // Esc를 누르면 포커스가 빠져나가는 것과 같은 처리를 한다
  else if Key = VK_Escape then
  begin
    GoodsClassTreeViewExit(Sender);
    if MainPanel.Enabled and GoodsClassCodeEdit.Enabled then
      GoodsClassCodeEdit.SetFocus;
  end;
end;

procedure TCodeGoodsMasterForm.GoodsCodeCreateButtonClick(Sender: TObject);
var
  vPoint: TPoint;
begin
  inherited;
  // 팝업 메뉴를 띄운다
  vPoint := ClientToScreen(Point(MainPanel.Left +  GoodsCodeCreateButton.Left + 2, MainPanel.Top + GoodsCodeCreateButton.Top + GoodsCodeCreateButton.Height + 2));
  SetCursorPos(vPoint.X+30, vPoint.Y+10);
  GoodsCodeCreatePopup.Popup(vPoint.X, vPoint.Y);
end;

procedure TCodeGoodsMasterForm.GoodsCodeCreatePopupNormalClick(Sender: TObject);
begin
  inherited;
  GoodsCodeEdit.Clear;
  GoodsCodeEdit.TabStop             := true;
  GoodsCodeEdit.Properties.ReadOnly := false;
  GoodsCodeEdit.Style.Color         := clWindow;
  GoodsTypeComboBox.ItemIndex       := 0;
  if MainPanel.Enabled and GoodsCodeEdit.Enabled then
    GoodsCodeEdit.SetFocus;
end;

procedure TCodeGoodsMasterForm.GoodsCodeCreatePopupSelfClick(Sender: TObject);
const
  msgNoPrefix = '%s 시작문자(프리픽스)가 정의되지 않아 %s를 생성할 수 없습니다.';
var
  vGoodsCode: string;
begin
  inherited;

  GoodsCodeEdit.TabStop             := true;
  GoodsCodeEdit.Properties.ReadOnly := false;
  GoodsCodeEdit.Style.Color         := clWindow;

  // 바코드 앞자리가 지정되어 있는지 먼저 확인한다
  if (Sender = GoodsCodeCreatePopupScale) and (Trim(ScaleCodePrefix) = EmptyStr) then
    ErrBox(Format(msgNoPrefix, [GoodsCodeCreatePopupScale.Caption, GoodsCodeLabel.Caption]))
  else if (Sender = GoodsCodeCreatePopupSelf) and (Trim(SelfGoodsPrefix) = EmptyStr) then
    ErrBox(Format(msgNoPrefix, [GoodsCodeCreatePopupSelf.Caption,  GoodsCodeLabel.Caption]))
  else
  begin
    // 기존에 등록된 자체/저울 바코드의 최대값을 구한다
    OpenQuery('select CD_MENU '
             +'  from MS_MENU '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and Left(CD_MENU,2) = :P2 '
             +'   and Length(CD_MENU)    = :P3 '
             +' order by CD_MENU desc '
             +' limit 1 ',
              [HeadStoreCode,
               StoreCode,
               IfThen(Sender = GoodsCodeCreatePopupScale, ScaleCodePrefix,  SelfGoodsPrefix),
               IfThen(Sender = GoodsCodeCreatePopupScale, 6, SelfGoodsLength)]);
    try
      // 기존에 등록된 자료가 없다면 생성한다
      if not Query.eof then
        vGoodsCode := Query.Fields[0].AsString;
      if vGoodsCode = EmptyStr then
        if Sender = GoodsCodeCreatePopupScale then
          vGoodsCode := RPad(ScaleCodePrefix, ScaleCodeLength+2, '0')
        else
          vGoodsCode := RPad(SelfGoodsPrefix, SelfGoodsLength, '0');

      // 저울 바코드이면 앞에서 6자리(프리픽스2자리+코드4자리)까지의 숫자 +1을 한다(뒤는 가격)
      if Sender = GoodsCodeCreatePopupScale then
//        vGoodsCode := GetBarcode(RPad(IntToStr(StoI(Copy(vGoodsCode, 1, ScaleGoodsLength+2))+1), 13, '0'))
        vGoodsCode := IntToStr(StoI(Copy(vGoodsCode, 1, ScaleCodeLength+2))+1)
      // 자체 바코드이면 마지막 한 자리를 제외한 나머지 숫자 +1을 한다
      else
        vGoodsCode := GetBarcode(RPad(FloatToStr(StoF(Copy(vGoodsCode, 1, SelfGoodsLength-1))+1), SelfGoodsLength, '0'));

      // 바코드가 한도를 벗어났으면 에러
      if Copy(vGoodsCode,1,2) > IfThen(Sender = GoodsCodeCreatePopupScale, ScaleCodePrefix, SelfGoodsPrefix) then
        ErrBox(Format('생성한 %s가 최대 한도를 초과하였습니다.', [GoodsCodeLabel.Caption]))
      else
      // 정상이면 생성한 바코드를 화면에 표시한다
      begin
        GoodsCodeEdit.Text := vGoodsCode;
        // 코드 자동 증가면 수정 못하게 막는다
        if CheckOption(2) then
        begin
          GoodsCodeEdit.TabStop             := false;
          GoodsCodeEdit.Properties.ReadOnly := true;
          GoodsCodeEdit.Style.Color         := clrDisabled;
        end;

        if Sender = GoodsCodeCreatePopupScale then
          GoodsTypeComboBox.ItemIndex := 2
        else
          GoodsTypeComboBox.ItemIndex := 0;
        if MainPanel.Enabled and GoodsNameEdit.Enabled then
          GoodsNameEdit.SetFocus;
      end;
    finally
      FinishQuery;
    end;
  end;
end;

procedure TCodeGoodsMasterForm.GoodsCodeEditExit(Sender: TObject);
begin
  inherited;
  GoodsCodeEdit.Text := Trim(GoodsCodeEdit.Text);
end;

procedure TCodeGoodsMasterForm.GoodsNameEditExit(Sender: TObject);
begin
  inherited;
  if GoodsNameEdit.EditModified then
  begin
    GoodsShortNameEdit.Text := GoodsNameEdit.Text;
    GoodsShortNameEdit.EditModified := true;
  end;
end;

procedure TCodeGoodsMasterForm.GridTableView1DcRatePropertiesEditValueChanged(
  Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;
  if isMultiMode then
  begin
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
      SaveMemberDcPointRate(String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewGoodsCode.Index]),
                            GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                            (Sender as TcxCurrencyEdit).EditingValue,
                            NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 2],0));
  end
  else
      SaveMemberDcPointRate(GoodsCodeEdit.Text,
                            GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                            (Sender as TcxCurrencyEdit).EditingValue,
                            NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 2],0));

end;

procedure TCodeGoodsMasterForm.GridTableView1PointRatePropertiesEditValueChanged(
  Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;
  if isMultiMode then
  begin
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
      SaveMemberDcPointRate(String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewGoodsCode.Index]),
                            GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                            NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 1],0),
                            (Sender as TcxCurrencyEdit).EditingValue);
  end
  else
      SaveMemberDcPointRate(GoodsCodeEdit.Text,
                            GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                            NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 1],0),
                            (Sender as TcxCurrencyEdit).EditingValue);
end;

procedure TCodeGoodsMasterForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridTableViewStatus.Index] = 'N' then
    AStyle := StyleFontRed;
end;

procedure TCodeGoodsMasterForm.KeyInButtonClick(Sender: TObject);
begin
  inherited;
  GoodsCodeEdit.Enabled := true;
end;

procedure TCodeGoodsMasterForm.SaveMemberDcPointRate(aMenu, aCode: String;
  aDcRate, aPointRate: Currency);
begin
  ExecQuery('insert into MS_MENU_DC(CD_HEAD, CD_STORE, DS_MEMBER, CD_MENU, DC_RATE, POINT_RATE) '
           +'                Values(:P0, :P1, :P2, :P3, :P4, :P5) '
           +' ON DUPLICATE KEY UPDATE DC_RATE    =:P4, '
           +'                         POINT_RATE =:P5; ',
           [HeadStoreCode,
            StoreCode,
            aCode,
            aMenu,
            aDcRate,
            aPointRate],true);
end;

function TCodeGoodsMasterForm.SearchCompany(Sender: TObject;
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

          if MainPanel.Enabled and GoodsClassCodeEdit.Enabled then
            GoodsClassCodeEdit.SetFocus;
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

procedure TCodeGoodsMasterForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  MemberGroupBox.Enabled    := not isNew;
  DetailSearchPanel.Enabled := not isChanged;
end;

procedure TCodeGoodsMasterForm.SetHistoryGridView;
begin
  try
    OpenQuery('select a.DT_HIST, '
             +'       a.NM_MENU, '
             +'       a.PR_SALE_OLD, '
             +'       a.PR_SALE,'
             +'       a.PR_SALE_PROFIT, '
             +'       a.CD_PRINTER, '
             +'       GetMenuClassName(a.CD_HEAD, a.CD_STORE, a.CD_CLASS) as NM_CLASS, '
             +'       a.NM_MENU_SHORT, '
             +'       a.PR_BUY, '
             +'       a.PR_BUY_OLD, '
             +'       a.DS_MENU_TYPE, '
             +'       a.YN_DC, '
             +'       a.YN_POINT, '
             +'       a.CD_CORNER, '
             +'       a.YN_KEEPING, '
             +'       a.YN_PERSON, '
             +'       case a.DS_TAX when ''0'' then ''면세'' when ''1'' then ''과세(포함)'' when ''2'' then ''과세(별도)'' end as DS_TAX, '
             +'       a.YN_RCP, '
             +'       a.QTY_UNIT, '
             +'       a.PR_TIP, '
             +'       b.NM_TRDPL, '
             +'       case a.DS_STOCK when ''0'' then ''재고관리안함'' when ''1'' then ''재고관리함''  end DS_STOCK, '
             +'       a.NO_GROUP, '
             +'       a.QTY_SELECT, '
             +'       a.QTY_SAFETY, '
             +'       a.QTY_ORDER, '
             +'       a.YN_SCALE, '
             +'       a.YN_USE, '
             +'       ConCat(a.CD_SAWON_CHG,''-'',c.NM_SAWON) as NM_SAWON, '
             +'       a.PRG_CHANGE, '
             +'       a.DT_INSERT '
             +'  from MS_MENU_HIST a left outer join '
             +'       MS_TRD       b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_TRDPL = b.CD_TRDPL left outer join '
             +'       MS_SAWON     c on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_SAWON_CHG = c.CD_SAWON '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.CD_MENU  = :P2 '
             +' order by a.DT_HIST desc ',
             [HeadStoreCode,
              StoreCode,
              GoodsCodeEdit.Text]);
    DM.ReadQuery(Query, HistoryGridTableView);
  finally
    FinishQuery;
  end;
end;

procedure TCodeGoodsMasterForm.SetMultiMode(aMultiMode: Boolean);
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
    MemberGroupBox.Enabled            := True;
    Grid1.Enabled                     := True;
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

    MemberGroupBox.Enabled            := True;
    Grid1.Enabled                     := True;
    GoodsCodeCreateButton.Enabled     := True;
    if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
      DoGridLink;
    isChanged := False;
  end;
end;

end.
