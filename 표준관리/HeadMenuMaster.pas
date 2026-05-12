// 재고를 관리하면 세무구분에 부가세 별도는 사용할 수 없음
// 일반메뉴와 저울메뉴만 재고관리를 함

unit HeadMenuMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  DBAccess, Uni, Data.DB, MemDS, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, cxCurrencyEdit,
  Vcl.StdCtrls, cxCheckBox, cxCheckListBox, cxGroupBox, cxSpinEdit, Math,
  AdvOfficePager, Menus, cxButtonEdit, cxButtons, ComCtrls, cxTreeView, StrUtils,
  AdvGroupBox, cxMemo, cxCheckComboBox, AdvOfficeButtons, AdvPanel, cxImage,
  Vcl.ExtDlgs, dxCore, cxDateUtils, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, PosButton, dxmdaset, EncdDecd, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, PNGImage, DateUtils, dxDateRanges, dxScrollbarAnnotations,
  cxCustomListBox, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePagerStylers;

type
  THeadMenuMasterForm = class(TInheritGridEditForm)
    MenuPager: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    MenuClassTreeView: TcxTreeView;
    RightPanel: TPanel;
    MemberGroupBox: TAdvGroupBox;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1DcRate: TcxGridColumn;
    GridTableView1PointRate: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    ItemGroupBox: TAdvGroupBox;
    ItemCheckListBox: TcxCheckListBox;
    DetailSearchPanel: TAdvPanel;
    ScrollBox1: TScrollBox;
    ConditionVanLabel: TLabel;
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
    ConditionVanComboBox: TcxComboBox;
    GridTableViewStatus: TcxGridColumn;
    LogPager: TAdvOfficePage;
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
    HistoryGridTableViewType: TcxGridColumn;
    HistoryGridTableViewTaxYN: TcxGridColumn;
    HistoryGridTableViewStockType: TcxGridColumn;
    HistoryGridTableViewCompanyCode: TcxGridColumn;
    HistoryGridTableViewMakerCode: TcxGridColumn;
    HistoryGridTableViewUseYN: TcxGridColumn;
    HistoryGridTableViewUserName: TcxGridColumn;
    HistoryGridTableViewInsertDate: TcxGridColumn;
    HistoryGridTableViewPrgChange: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    HistoryGridTableViewMenuCount: TcxGridColumn;
    HistoryGridTableViewDoublePrice: TcxGridColumn;
    HistoryGridTableViewTipPrice: TcxGridColumn;
    HistoryGridTableViewMenuNo: TcxGridColumn;
    HistoryGridTableViewDisplaySeq: TcxGridColumn;
    HistoryGridTableViewGroupNo: TcxGridColumn;
    HistoryGridTableViewUnitQty: TcxGridColumn;
    HistoryGridTableViewDsKitchen: TcxGridColumn;
    Label5: TLabel;
    ConditionKitchenComboBox: TcxComboBox;
    ConditionCornerLabel: TLabel;
    ConditionCornerComboBox: TcxComboBox;
    ConditionCustomerCheckBox: TAdvOfficeCheckBox;
    BillPrinterCheckBox: TAdvOfficeCheckBox;
    ConditionPointLimitCheckBox: TAdvOfficeCheckBox;
    PictureLoadDialog: TOpenPictureDialog;
    HistoryGridTableViewStampSave: TcxGridColumn;
    HistoryGridTableViewStampUse: TcxGridColumn;
    StampGroupBox: TAdvGroupBox;
    Label11: TLabel;
    StampUseLabel: TLabel;
    StampSaveEdit: TcxSpinEdit;
    StampUseEdit: TcxSpinEdit;
    PadImagePage: TAdvOfficePage;
    AdvGroupBox2: TAdvGroupBox;
    cxImage1: TcxImage;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    AdvGroupBox3: TAdvGroupBox;
    cxImage2: TcxImage;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    Panel2: TPanel;
    KitchenPanel: TPanel;
    KitchenGroupBox: TAdvGroupBox;
    KitchenCheckListBox: TcxCheckListBox;
    MemoGroupBox: TAdvGroupBox;
    MemoCheckListBox: TcxCheckListBox;
    KitchenComboBox: TcxComboBox;
    TopPanel: TPanel;
    MenuCodeLabel: TLabel;
    MenuNameLabel: TLabel;
    MenuShortNameLabel: TLabel;
    MenuClassLabel: TLabel;
    MenuNameEdit: TcxTextEdit;
    MenuShortNameEdit: TcxTextEdit;
    MenuCodeEdit: TcxTextEdit;
    MenuClassCodeEdit: TcxButtonEdit;
    MenuClassNameEdit: TcxTextEdit;
    InputRemainCheckBox: TcxCheckBox;
    CenterPanel: TPanel;
    PriceSaleLabel: TLabel;
    GoodsTypeLabel: TLabel;
    Label1: TLabel;
    PriceProfitRateLabel: TLabel;
    MenuNoLabel: TLabel;
    PriceTipLabel: TLabel;
    PriceDoubleLabel: TLabel;
    DisplaySeqLabel: TLabel;
    GroupNoLabel: TLabel;
    Label18: TLabel;
    PriceBuyLabel: TLabel;
    PriceSaleEdit: TcxCurrencyEdit;
    MenuTypeComboBox: TcxComboBox;
    TaxComboBox: TcxComboBox;
    PriceProfitRateEdit: TcxCurrencyEdit;
    MenuNoEdit: TcxTextEdit;
    PriceTipEdit: TcxCurrencyEdit;
    PriceDoubleEdit: TcxCurrencyEdit;
    DisplaySeqEdit: TcxSpinEdit;
    GroupNoEdit: TcxSpinEdit;
    DcCheckBox: TcxCheckBox;
    PointCheckBox: TcxCheckBox;
    UseCheckBox: TcxCheckBox;
    PrintCheckBox: TcxCheckBox;
    MenuCountEdit: TcxSpinEdit;
    PriceBuyEdit: TcxCurrencyEdit;
    BillPrintCheckBox: TcxCheckBox;
    PointLimitCheckBox: TcxCheckBox;
    TableColorCheckBox: TcxCheckBox;
    TicketCheckBox: TcxCheckBox;
    SoldOutCheckBox: TcxCheckBox;
    BottomPanel: TPanel;
    StockGroupBox: TAdvGroupBox;
    StockTypeLabel: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    StockTypeComboBox: TcxComboBox;
    UnitQtyEdit: TcxCurrencyEdit;
    SalePriceFixCheckBox: TcxCheckBox;
    GridTableViewInsertDate: TcxGridColumn;
    Grid2: TcxGrid;
    GridTableView2: TcxGridTableView;
    GridTableView2StoreName: TcxGridColumn;
    GridTableView2MenuName: TcxGridColumn;
    GridTableView2SalePrice: TcxGridColumn;
    GridTableView2StoreCode: TcxGridColumn;
    GridTableView2DsTrdpl: TcxGridColumn;
    GridTableView2RowState: TcxGridColumn;
    StoreGridLevel: TcxGridLevel;
    AdvSplitter1: TAdvSplitter;
    KeyInButton: TAdvGlowButton;
    PackingCheckBox: TcxCheckBox;
    HistoryGridTableViewColumn1: TcxGridColumn;
    Label2: TLabel;
    PricePackingEdit: TcxCurrencyEdit;
    GridTableView2MenuCode: TcxGridColumn;
    Label3: TLabel;
    Label6: TLabel;
    Option4Edit: TcxSpinEdit;
    Label15: TLabel;
    Option14Edit: TcxSpinEdit;
    Option12CheckBox: TcxCheckBox;
    Label13: TLabel;
    Option13ComboBox: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure MenuClassCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure MenuClassTreeViewDblClick(Sender: TObject);
    procedure MenuClassTreeViewExit(Sender: TObject);
    procedure MenuClassTreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure MenuClassTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure KeyInButtonClick(Sender: TObject);
    procedure MenuNameEditExit(Sender: TObject);
    procedure ConditionGoodsClassCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure LogPagerShow(Sender: TObject);
    procedure GridTableView1DcRatePropertiesEditValueChanged(Sender: TObject);
    procedure GridTableView1PointRatePropertiesEditValueChanged(
      Sender: TObject);
    procedure InputRemainCheckBoxPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupNoEditClick(Sender: TObject);
    procedure GridTableView2MenuCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableView2SalePriceStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    DestStoreCode   :String;
    MenuPrefix      :String;
    MenuLength      :Integer;
    BackKitchenList :TStringList;
    BackMemoList    :TStringList;
    BackItemList    :TStringList;

    ClassDefaultColor,                       //기본설정값
    ClassDefaultDownColor,
    MenuDefaultColor :TColor;
    ClassDefaultFont,
    MenuDefaultFont : TFont;
    ClassDefaultDownFontColor :TColor;

    function  GetMenuCode:String;
    procedure ClearCheckListBox(aCheckListBox:TcxCheckListBox);
    function  GetCheckListBox(aList:TStringList; aText:String):Integer;
    procedure SetItemCheckListBox;
    procedure GetMenuClassName(Sender: TObject);
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
  HeadMenuMasterForm: THeadMenuMasterForm;

implementation
uses Common, DBModule, Help, CodeClassHelp;
{$R *.dfm}

{ TCodeMenuForm }
procedure THeadMenuMasterForm.FormCreate(Sender: TObject);
begin
  inherited;
  ClassDefaultFont := TFont.Create;
  MenuDefaultFont  := TFont.Create;
end;

procedure THeadMenuMasterForm.FormShow(Sender: TObject);
var
  vCode: PStrPointer;
  vIndex, vItemMenuCount :Integer;
begin
  inherited;
  DestStoreCode := '';
  if GetChainHeadOption(2) = '1' then
  begin
    SetWorkStoreList;
    for vIndex := 0 to WorkStoreList.Count-1 do
    begin
      if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),1,1) = '0' then Continue;
      DestStoreCode := DestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);
    end;
    DestStoreCode := Format(' in (%s) ',[LeftStr(DestStoreCode, Length(DestStoreCode)-1)]);
  end
  else
  begin
    WorkStoreList.Clear;
    WorkStoreList.Add(StandardStore
                     +splitColumn+''
                     +splitColumn+'1'
                     +splitColumn+HeadStoreCode);
    DestStoreCode := ' in (''00000000'') ';
  end;

  try
    OpenQuery('select SELFMENU_LEN, '
             +'       SELFMENU_PREFIX '
             +'  from MS_STORE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [HeadStoreCode,
              StandardStore]);
    if not Query.Eof then
    begin
      MenuLength := Query.FieldByName('SELFMENU_LEN').AsInteger;
      MenuPrefix := Query.FieldByName('SELFMENU_PREFIX').AsString;
    end;
  finally
    FinishQuery;
  end;


  MenuPager.ActivePageIndex := 0;
  // 뱃지
  Option13ComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  Option13ComboBox.Properties.Items.AddObject('없음', TObject(vCode));
  New(vCode);
  vCode^.Data := 'R';
  Option13ComboBox.Properties.Items.AddObject('추천', TObject(vCode));
  New(vCode);
  vCode^.Data := 'H';
  Option13ComboBox.Properties.Items.AddObject('Hot', TObject(vCode));
  New(vCode);
  vCode^.Data := 'N';
  Option13ComboBox.Properties.Items.AddObject('신메뉴', TObject(vCode));

  // 메뉴구분
  New(vCode);
  vCode^.Data := 'N';
  MenuTypeComboBox.Properties.Items.AddObject('일반', TObject(vCode));
  New(vCode);
  vCode^.Data := 'G';
  MenuTypeComboBox.Properties.Items.AddObject('싯가', TObject(vCode));
  New(vCode);
  vCode^.Data := 'S';
  MenuTypeComboBox.Properties.Items.AddObject('세트', TObject(vCode));
  New(vCode);
  vCode^.Data := 'C';
  MenuTypeComboBox.Properties.Items.AddObject('코스', TObject(vCode));
  New(vCode);
  vCode^.Data := 'O';
  MenuTypeComboBox.Properties.Items.AddObject('오픈세트', TObject(vCode));
  New(vCode);
  vCode^.Data := 'W';
  MenuTypeComboBox.Properties.Items.AddObject('저울메뉴', TObject(vCode));
  New(vCode);
  vCode^.Data := 'P';
  MenuTypeComboBox.Properties.Items.AddObject('그룹메뉴', TObject(vCode));


  vItemMenuCount := 0;
  if GetHeadOption(57) = '0' then
    try
      OpenQuery('select Count(*) '
               +'  from MS_MENU '
               +' where CD_HEAD      = :P0 '
               +'   and CD_STORE     = :P1 '
               +'   and DS_MENU_TYPE = ''I'' ',
               [HeadStoreCode,
                StandardStore]);
      vItemMenuCount := Query.Fields[0].AsInteger;
    finally
      Query.Close;
    end;

  if (GetHeadOption(57) = '1') or (vItemMenuCount > 0) then
  begin
    New(vCode);
    vCode^.Data := 'I';
    MenuTypeComboBox.Properties.Items.AddObject('아이템', TObject(vCode));
  end;

  // 세무구분
  New(vCode);
  vCode^.Data := '1';
  TaxComboBox.Properties.Items.AddObject('과세(포함)', TObject(vCode));
  New(vCode);
  vCode^.Data := '0';
  TaxComboBox.Properties.Items.AddObject('면세', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  TaxComboBox.Properties.Items.AddObject('과세별도', TObject(vCode));

  // 주방
  New(vCode);
  vCode^.Data := '0';
  KitchenComboBox.Properties.Items.AddObject('같은 층의 주방으로만 출력합니다', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  KitchenComboBox.Properties.Items.AddObject('체크한 주방은 모두 출력합니다', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  KitchenComboBox.Properties.Items.AddObject('주방프린터에 설정한 층에서 주문할때만 출력합니다', TObject(vCode));

  //봉사료
  PriceTipEdit.Enabled    := (GetHeadOption(20) = '1') or (GetHeadOption(289) = '1');

  //메뉴번호
  MenuNoEdit.Enabled      := GetHeadOption(247) = '1';

  //표시순번
  DisplaySeqEdit.Enabled  := GetHeadOption(164) = '1';

  //메뉴그룹
  GroupNoEdit.Enabled     := GetHeadOption(79) = '1';

  //재고기능
  StockGroupBox.Visible     :=  GetHeadOption(19) = '1';

  //키오스크 사용시에만 식권사용
  TicketCheckBox.Visible  := GetHeadOption(403)='1';

  //층별주방
  KitchenComboBox.Visible := GetHeadOption(26) = '1';
  if GetHeadOption(26) = '0' then
    KitchenPanel.Height := 137;

  //회원등급별 할인/포인트
  MemberGroupBox.Visible          := (GetHeadOption(251) = '1') or (GetHeadOption(258) = '1');
  GridTableView1DcRate.Visible    := GetHeadOption(251) = '1';
  GridTableView1PointRate.Visible := GetHeadOption(258) = '1';

  //아이템
  ItemGroupBox.Visible := GetHeadOption(57) = '1';
  if not MemberGroupBox.Visible and ItemGroupBox.Visible then
  begin
    ItemGroupBox.Top    := MemberGroupBox.Top;
    StampGroupBox.Top := ItemGroupBox.Top + ItemGroupBox.Height + 5;
  end
  else if ItemGroupBox.Visible then
  begin
    StampGroupBox.Top := ItemGroupBox.Top + ItemGroupBox.Height + 5;
  end
  else if MemberGroupBox.Visible then
    StampGroupBox.Top := MemberGroupBox.Top + MemberGroupBox.Height + 5
  else
    StampGroupBox.Top := MemberGroupBox.Top;
  StampGroupBox.Left := 9;

  //스템프를 금액으로 할인 시 에는 사용가능 메뉴로 사용한다
  if GetHeadOption(406)='1' then
  begin
    StampUseEdit.Properties.AssignedValues.MaxValue := true;
    StampUseEdit.Properties.MaxValue := 1;
  end;

  if MemberGroupBox.Visible and ItemGroupBox.Visible and (GetHeadOption(177) = '1') then
    ItemGroupBox.Height := 165;

  //재고관리
  BottomPanel.Visible := GetHeadOption(19) = '1';

  //상세검색에 주방
  ConditionKitchenComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionKitchenComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and CD_PRINTER = '''' ';
  ConditionKitchenComboBox.Properties.Items.AddObject('미지정', TObject(vCode));

  //주방프린터
  try
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''02'' '
             +'   and DS_STATUS = 0 '
             +' order by CD_CODE ',
             [HeadStoreCode,
              StandardStore]);
    KitchenCheckListBox.Items.Clear;
    BackKitchenList := TStringList.Create;
    BackKitchenList.Clear;
    while not Query.Eof do
    begin
      KitchenCheckListBox.Items.Add;
      KitchenCheckListBox.Items[KitchenCheckListBox.Items.Count-1].Text        := Query.Fields[1].AsString;
      New(vCode);
      vCode^.Data := Format('and CD_PRINTER in (''%s'')' ,[Query.Fields[0].AsString]);
      ConditionKitchenComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));

      BackKitchenList.Add(Query.Fields[0].AsString);
      Query.Next;
    end;
    ConditionKitchenComboBox.ItemIndex := 0;
  finally
    Query.Close;
  end;

  //주방메모
  if (GetHeadOption(156) = '1') or (GetHeadOption(156) = '2') then
    try
      OpenQuery('select CD_CODE, '
               +'       NM_CODE1 '
               +'  from MS_CODE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_KIND  =''16'' '
               +'   and DS_STATUS = 0 '
               +' order by CD_CODE ',
               [HeadStoreCode,
                StandardStore]);
      MemoCheckListBox.Items.Clear;
      BackMemoList := TStringList.Create;
      BackMemoList.Clear;
      while not Query.Eof do
      begin
        MemoCheckListBox.Items.Add;
        MemoCheckListBox.Items[MemoCheckListBox.Items.Count-1].Text        := Query.Fields[1].AsString;
        BackMemoList.Add(Query.Fields[0].AsString);
        Query.Next;
      end;
    finally
      Query.Close;
    end;

  MemoGroupBox.Visible := (GetHeadOption(156) = '1') or (GetHeadOption(156) = '2');

  BackItemList := TStringList.Create;
  SetItemCheckListBox;

  try
    OpenQuery('select NM_CODE3, '
             +'       NM_CODE4, '
             +'       NM_CODE5, '
             +'       NM_CODE6, '
             +'       NM_CODE7, '
             +'       NM_CODE8, '
             +'       NM_CODE9, '
             +'       CD_CODE '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''87'' '
             +'   and CD_CODE  in (''001'',''002'') '
             +' order by CD_CODE ',
             [HeadStoreCode,
              StandardStore]);
    while not Query.Eof do
    begin
      if Query.FieldByName('CD_CODE').AsString = '001' then
      begin
        ClassDefaultColor      := StringToColor(Query.FieldByName('NM_CODE3').AsString);
        ClassDefaultFont.Name  := Query.FieldByName('NM_CODE5').AsString;
        ClassDefaultFont.Color := StringToColor(Query.FieldByName('NM_CODE8').AsString);
        ClassDefaultFont.Size  := StrToIntDef(Query.FieldByName('NM_CODE6').AsString,10);
        if Query.FieldByName('NM_CODE7').AsString  = '1' then
          ClassDefaultFont.Style := [fsBold];

        ClassDefaultDownColor     := StringToColor(Query.FieldByName('NM_CODE4').AsString);
        ClassDefaultDownFontColor := StringToColor(Query.FieldByName('NM_CODE9').AsString);

      end
      else if Query.FieldByName('CD_CODE').AsString = '002' then
      begin
        MenuDefaultColor      := StringToColor(Query.FieldByName('NM_CODE3').AsString);
        MenuDefaultFont.Name  := Query.FieldByName('NM_CODE4').AsString;
        MenuDefaultFont.Color := StringToColor(Query.FieldByName('NM_CODE7').AsString);
        MenuDefaultFont.Size  := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,10);
        if Query.FieldByName('NM_CODE6').AsString  = '1' then
          ClassDefaultFont.Style := [fsBold];
      end;
      Query.Next;
    end;
  finally
    Query.Close;
  end;

  KitchenGroupBox.Visible := GetHeadOption(10) = '1';
  KitchenComboBox.Visible := GetHeadOption(10) = '1';
  if not KitchenGroupBox.Visible then
    MemoGroupBox.Left := KitchenGroupBox.Left;

  // 재고관리구분
  New(vCode);
  vCode^.Data := '0';
  StockTypeComboBox.Properties.Items.AddObject('관리안함', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  StockTypeComboBox.Properties.Items.AddObject('관리함', TObject(vCode));

  if GetHeadOption(337) = '1' then
    PriceDoubleLabel.Caption := '포     장';


  if GetChainHeadOption(2) = '0' then
    GridTableView2MenuCode.Options.Focusing := true;
  isChanged := false;
end;


function THeadMenuMasterForm.DoSearch: Boolean;
var
  vWhere1,vWhere2,vWhere3,vWhere4,vWhere5,vWhere6,vWhere7,vWhere8,vWhere9,vWhere10,vWhere11,vWhere12,vWhere13, vWhere14: String;
  vList  : TStringList;
  vIndex : Integer;
begin
  DetailSearchPanel.Collaps := true;
  Result := false;
  case Conditon1RadioGroup.ItemIndex of
     1: vWhere1 := ' and YN_USE = ''Y'' ';
     2: vWhere1 := ' and YN_USE = ''N'' ';
     else vWhere1 := '';
  end;

  case Conditon2RadioGroup.ItemIndex of
     1: vWhere2 := ' and DS_MENU_TYPE = ''N'' ';
     2: vWhere2 := ' and DS_MENU_TYPE = ''G'' ';
     3: vWhere2 := ' and DS_MENU_TYPE = ''S'' ';
     4: vWhere2 := ' and DS_MENU_TYPE = ''C'' ';
     5: vWhere2 := ' and DS_MENU_TYPE = ''O'' ';
     6: vWhere2 := ' and DS_MENU_TYPE = ''W'' ';
     7: vWhere2 := ' and DS_MENU_TYPE = ''I'' ';
     8: vWhere2 := ' and DS_MENU_TYPE = ''P'' ';
     else vWhere2 := '';
  end;

  case Conditon3RadioGroup.ItemIndex of
     1: vWhere3 := ' and Substring(CONFIG,1,1) = ''Y'' ';
     2: vWhere3 := ' and Substring(CONFIG,1,1) = ''N'' ';
     3: vWhere3 := ' and Substring(CONFIG,2,1) = ''Y'' ';
     4: vWhere3 := ' and Substring(CONFIG,2,1) = ''N'' ';
     else vWhere3 := '';
  end;

  case Conditon4RadioGroup.ItemIndex of
     1: vWhere4 := ' and DS_TAX = ''1'' ';
     2: vWhere4 := ' and DS_TAX = ''0'' ';
     3: vWhere4 := ' and DS_TAX = ''2'' ';
     else vWhere4 := '';
  end;

  case Conditon5RadioGroup.ItemIndex of
     1: vWhere5 := ' and DS_STOCK = ''0'' ';
     2: vWhere5 := ' and DS_STOCK = ''1'' ';
  end;

  if ConditionNotClassCheckBox.Checked then
    vWhere6 := ' and Ifnull(CD_CLASS, '''') = '''' ';

    if ConditionGoodsClassCodeEdit.Text <> '' then
  begin
    if Pos(',',ConditionGoodsClassCodeEdit.Text) > 0 then
    begin
      vList := TStringList.Create;
      try
        Split(ConditionGoodsClassCodeEdit.Text, ',', vList);

        for vIndex := 0 to vList.Count-1 do
          vWhere1 := vWhere1 + 'CD_CLASS like ConCat('+vList.Strings[vIndex] +',''%'') '+ Ifthen(vIndex < vList.Count-1, ' or ', '');

        vWhere1 := ' and ('+vWhere1+')';
      finally
        vList.Free
      end;
    end
    else
    begin
      if (Pos('''',ConditionGoodsClassCodeEdit.Text) = 0) and (ConditionGoodsClassNameEdit.Text <> EmptyStr) then
        vWhere1 := ' and CD_CLASS = '''+ConditionGoodsClassCodeEdit.Text+''' '
      else
      begin
        if (Pos('''',ConditionGoodsClassCodeEdit.Text) = 0) then
          vWhere1 := ' and CD_CLASS like ConCat('''+ConditionGoodsClassCodeEdit.Text+''',''%'') '
        else
          vWhere1 := ' and CD_CLASS like ConCat('+ConditionGoodsClassCodeEdit.Text+',''%'') ';
      end;
    end;
  end
  else
    vWhere8 := '';

  if (ConditionFromDateEdit.CurrentDate > 0) and (ConditionToDateEdit.CurrentDate > 0) then
    vWhere9 := ' and Date_Format(DT_CHANGE, ''%Y%m%d'') between '''+DToS(ConditionFromDateEdit.CurrentDate)+''' and '''+DToS(ConditionToDateEdit.CurrentDate)+''' '
  else
    vWhere9 := '';

  vWhere10 := GetStrPointerData(ConditionKitchenComboBox);

  if ConditionCornerComboBox.ItemIndex = 1 then
    vWhere11 := 'and Ifnull(CD_CORNER,'''') = '''' '
  else if ConditionCornerComboBox.ItemIndex > 1 then
    vWhere11 := Format('and CD_CORNER = ''%s'' ',[GetStrPointerData(ConditionCornerComboBox)]);

  if ConditionCustomerCheckBox.Checked then
    vWhere12 := ' and Substring(CONFIG,8,1) =''Y'' '
  else
    vWhere12 := EmptyStr;

  if BillPrinterCheckBox.Checked then
    vWhere13 := ' and Substring(CONFIG,5,1) =''Y'' '
  else
    vWhere13 := EmptyStr;

  if ConditionPointLimitCheckBox.Checked then
    vWhere14 := ' and Substring(CONFIG,9,1) = ''Y'' '
  else
    vWhere14 := EmptyStr;

  try
    OpenQuery('select CD_MENU, '
             +'       NM_MENU, '
             +'       YN_USE, '
             +'       DT_INSERT '
             +'  from MS_MENU '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and (CD_MENU = :P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
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
             + vWhere11
             + vWhere12
             + vWhere13
             + vWhere14
             +' order by CD_MENU ',
             [HeadStoreCode,
              StandardStore,
              ConditionToolBarEdit.Text]);
    Result := not Query.Eof;
    if Result then
      DM.ReadQuery(Query, GridTableView)
    else
      GridTableView.DataController.RecordCount := 0;
  finally
    Query.Close;
  end;
  SetItemCheckListBox;
end;

procedure THeadMenuMasterForm.EditPropertiesChange(Sender: TObject);
var vTemp : String;
    vCode: PStrPointer;
    vTaxComboBoxIndex :Integer;
begin
  inherited;
  if Sender = KitchenCheckListBox then
    KitchenCheckListBox.Tag := 1;

  if  (Sender is TcxCustomEdit) then
    TcxCustomEdit(Sender).EditModified := true;

  // 상품분류를 변경할 때
  if (Sender = MenuClassCodeEdit) and (MenuClassNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(MenuClassCodeEdit.Text) <> MenuClassCodeEdit.Text) or (Length(MenuClassCodeEdit.Text) <> StoI(GetHeadOption(248))*2)) then
    MenuClassNameEdit.Clear
  //재고구분
  else if Sender = MenuTypeComboBox then
  begin
    vTemp := GetStrPointerData(MenuTypeComboBox);
    if vTemp = '' then
      vTemp := 'N';
    if vTemp ='N' then
    begin
      PriceDoubleEdit.Enabled := true;
      SetItemCheckListBox;
    end
    else
    begin
      PriceDoubleEdit.Enabled := false;
      PriceDoubleEdit.Value   := 0;
    end;
    //오픈세트일때 메뉴갯수를 입력받는다
    MenuCountEdit.Enabled := (vTemp ='O') or (vTemp ='I') or (vTemp= 'N') or (vTemp ='P');

    //재고관리(일반, 저울메뉴만 재고 관리가 가능함
    if vTemp[1] in ['N','W','I','G','O','S','C'] then
      StockTypeComboBox.Enabled := true
    else
    begin
      StockTypeComboBox.ItemIndex := 0;
      StockTypeComboBox.Enabled   := false;
    end;

    //곱빼기
    if vTemp = 'N' then
      PriceDoubleEdit.Enabled := true
    else
    begin
      PriceDoubleEdit.Enabled := false;
      PriceDoubleEdit.Value   := 0;
    end;

    //봉사료
    if vTemp[1] in ['G','W','I'] then
    begin
      PriceTipEdit.Value   := 0;
      PriceTipEdit.Enabled := false;
    end
    else PriceTipEdit.Enabled := (GetHeadOption(160) = '1') or (GetHeadOption(289) = '1');

    //개당중량
    if vTemp[1] in ['G','N'] then
    begin
      UnitQtyEdit.Enabled := true;
    end
    else
    begin
      UnitQtyEdit.Enabled := false;
      UnitQtyEdit.Value   := 1;
    end;

    //아이템
    ItemGroupBox.Enabled := (vTemp[1] in ['N','G','W']) and (GetHeadOption(57) = '1');
  end
  //판매단가
  else if Sender = PriceSaleEdit then
  begin
    //판매금액 0보다 크면 영수증은 무조건 출력한다
    if (PriceSaleEdit.Value > 0) or (GetStrPointerData(MenuTypeComboBox) <> 'N') then
    begin
      PrintCheckBox.Checked := true;
      PrintCheckBox.Enabled := false;
    end
    else PrintCheckBox.Enabled := true;
  end
  else if Sender = StockTypeComboBox then
  begin
    vTaxComboBoxIndex := TaxComboBox.ItemIndex;
    //재고를 관리하는 메뉴는 부가세별도 기능은 사용 못하게 한다
    if GetStrPointerData(StockTypeComboBox) = '0' then
    begin
      TaxComboBox.Properties.Items.Clear;
      // 세무구분
      New(vCode);
      vCode^.Data := '1';
      TaxComboBox.Properties.Items.AddObject('과세(포함)', TObject(vCode));
      New(vCode);
      vCode^.Data := '0';
      TaxComboBox.Properties.Items.AddObject('면세', TObject(vCode));
      New(vCode);
      vCode^.Data := '2';
      TaxComboBox.Properties.Items.AddObject('과세별도', TObject(vCode));
      TaxComboBox.ItemIndex := vTaxComboBoxIndex;
    end
    else
    begin
      TaxComboBox.Properties.Items.Clear;
      New(vCode);
      vCode^.Data := '1';
      TaxComboBox.Properties.Items.AddObject('과세(포함)', TObject(vCode));
      New(vCode);
      vCode^.Data := '0';
      TaxComboBox.Properties.Items.AddObject('면세', TObject(vCode));
      if vTaxComboBoxIndex = 2 then
        TaxComboBox.ItemIndex := 0
      else
        TaxComboBox.ItemIndex := vTaxComboBoxIndex;
    end;
  end
  else if Sender = KitchenCheckListBox then
    KitchenCheckListBox.Tag := 1
  // 상품분류를 변경할 때(상세검색)
  else if (Sender = ConditionGoodsClassCodeEdit) and (ConditionGoodsClassNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(ConditionGoodsClassCodeEdit.Text) <> ConditionGoodsClassCodeEdit.Text) or (Length(ConditionGoodsClassCodeEdit.Text) <> StoI(GetHeadOption(248))*2)) then
  begin
    ConditionGoodsClassNameEdit.Clear;
    isChanged := false;
  end
  else if (Sender = ConditionGoodsClassCodeEdit) then
  begin
    isChanged := false;
  end
  else if Sender = PackingCheckBox then
    PricePackingEdit.Enabled := not PackingCheckBox.Checked;
end;

procedure THeadMenuMasterForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  // 상품분류
  if Sender = MenuClassCodeEdit then
  begin
    // 상품분류코드에 문자를 입력했으면 해당 분류를 찾아와 표시한다
    if (DisplayValue <> EmptyStr) and (MenuClassNameEdit.Text = EmptyStr) and
       ((GetOnlyNumber(DisplayValue) <> DisplayValue) or (Length(DisplayValue) <> StoI(GetHeadOption(248))*2)) then
    begin
      OpenQuery('select CD_CLASS, '
               +'       GetMenuClassName(CD_HEAD, CD_STORE, CD_CLASS) as NM_CLASS '
               +'  from MS_MENU_CLASS '
               +' where CD_HEAD       = :P0 '
               +'   and CD_STORE      = :P1 '
               +'   and Length(CD_CLASS) = :P2 '
               +'   and NM_CLASS like ConCat(''%'',:P3,''%'') '
               +' order by NM_CLASS '
               +' limit 1 ',
                [HeadStoreCode,
                 StandardStore,
                 StoI(GetHeadOption(248))*2,
                 MenuClassCodeEdit.Text]);
      try
        if not Query.eof then
        begin
          DisplayValue           := Query.Fields[0].AsString;
          MenuClassNameEdit.Text := Query.Fields[1].AsString;
        end;
        if MenuClassNameEdit.Text = EmptyStr then
          ShowMsg(MenuClassLabel.Caption+msgMustInput, true);
      finally
        Query.Close;
      end;
    end
    else
      GetMenuClassName(MenuClassCodeEdit);
  end
  else if Sender = ConditionGoodsClassCodeEdit then
  begin
    // 상품분류코드에 문자를 입력했으면 해당 분류를 찾아와 표시한다
    if (DisplayValue <> EmptyStr) and (ConditionGoodsClassNameEdit.Text = EmptyStr) and
       ((GetOnlyNumber(DisplayValue) <> DisplayValue) or (Length(DisplayValue) <> StoI(GetHeadOption(248))*2)) then
    begin
      OpenQuery('select CD_CLASS, '
               +'       GetMenuClassName(CD_HEAD, CD_STORE, CD_CLASS) as NM_CLASS '
               +'  from MS_MENU_CLASS '
               +' where CD_HEAD       = :P0 '
               +'   and CD_STORE      = :P1 '
               +'   and Length(CD_CLASS) = :P2 '
               +'   and NM_CLASS like ConCat(''%'',:P3,''%'') '
               +' order by NM_CLASS '
               +' limit 1 ',
               [HeadStoreCode,
                StandardStore,
                StoI(GetHeadOption(248))*2,
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
        Query.Close;
      end;
    end
    else
      GetMenuClassName(ConditionGoodsClassCodeEdit);
    Exit;
  end
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
        ErrorText := Format('%s가 0이 아닐 때는 %s을 100%%로 입력할 수 없습니다.', [PriceBuyLabel.Caption, '이익률']);
        Error     := true;
      end
      else
      begin
        PriceSaleEdit.Value := CalcOptionNumber(100 / (100 - Currency(DisplayValue)) * PriceBuyEdit.Value, 141);
      end;
    end;
  end;
  isChanged := true;
end;

//CheckListBox 아이템 클리어
procedure THeadMenuMasterForm.ClearCheckListBox(aCheckListBox: TcxCheckListBox);
var vIndex :Integer;
begin
  for vIndex := 0 to aCheckListBox.Items.Count-1 do
    aCheckListBox.Items[vIndex].Checked := false;
end;

procedure THeadMenuMasterForm.ConditionGoodsClassCodeEditPropertiesButtonClick(
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

function THeadMenuMasterForm.GetCheckListBox(aList: TStringList;
  aText: String): Integer;
var vIndex :Integer;
begin
  Result := -1;
  for vIndex := 0 to aList.Count-1 do
    if aList.Strings[vIndex] = aText then
    begin
      Result := vIndex;
      Break;
    end;
end;

function THeadMenuMasterForm.GetMenuCode: String;
var vMenuCode :String;
begin
  MenuCodeEdit.Enabled := False;
  try
    OpenQuery('select Max(CD_MENU) CODE '
             +'  from MS_MENU '
             +' where CD_HEAD      =:P0 '
             +'   and CD_STORE     =:P1 '
             +Format(' and Left(CD_MENU,%d) = ''%s'' ',[Length(MenuPrefix),MenuPrefix])
             +'   and GetOnlyNumber(CD_MENU) = CD_MENU ',
             [HeadStoreCode,
              StandardStore]);
    if Query.Eof or (Query.Fields[0].AsString = '') then
      Result := MenuPrefix + LPad('0', MenuLength-Length(MenuPrefix)-1,'0')+'1'
    else
    begin
      vMenuCode := Query.Fields[0].AsString;
      if Length(vMenuCode) = MenuLength  then
        Result    := LPad(FloatToStr(StrToCurr(vMenuCode) + 1), MenuLength,'0')
      else
        Result    := FloatToStr(StrToFloat(vMenuCode)+1);
    end;
  finally
    Query.Close;
  end;
end;

procedure THeadMenuMasterForm.GridTableView1DcRatePropertiesEditValueChanged(
  Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;
  if isMultiMode then
  begin
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
      SaveMemberDcPointRate(String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewMenuCode.Index]),
                            GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                            (Sender as TcxCurrencyEdit).EditingValue,
                            NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 2],0));
  end
  else
    SaveMemberDcPointRate(Trim(MenuCodeEdit.Text),
                          GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                          (Sender as TcxCurrencyEdit).EditingValue,
                          NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 2],0));
end;

procedure THeadMenuMasterForm.GridTableView1PointRatePropertiesEditValueChanged(
  Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;
  if isMultiMode then
  begin
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
      SaveMemberDcPointRate(String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewMenuCode.Index]),
                            GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                            NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 1],0),
                            (Sender as TcxCurrencyEdit).EditingValue);
  end
  else
    SaveMemberDcPointRate(Trim(MenuCodeEdit.Text),
                          GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 3],
                          NVL(GridTableView1.DataController.Values[GridTableView1.Controller.FocusedRowIndex, 1],0),
                          (Sender as TcxCurrencyEdit).EditingValue);

end;

procedure THeadMenuMasterForm.GridTableView2MenuCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '매장메뉴 조회';
      GridTableViewCode.Caption  := '메뉴코드';
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := '메뉴명';
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := '판매단가';
      GridTableViewName2.Width   := 100;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

      SearchText := MenuNameEdit.Text;
      SQLText    := 'select CD_MENU, '
                   +'       NM_MENU, '
                   +'       PR_SALE '
                   +'  from MS_MENU '
                   +' where CD_HEAD  =:P0 '
                   +Format('   and CD_STORE =''%s'' ',[Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.GetFocusedRecordIndex, Self.GridTableView2StoreCode.Index]])
                   +'   and NM_MENU like ConCat(''%'',:P2,''%'') '
                   +'order by  CD_MENU';

      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.GetFocusedRecordIndex, Self.GridTableView2MenuCode.Index]   := Code;
        Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.GetFocusedRecordIndex, Self.GridTableView2MenuName.Index]   := Names[0];
        Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.GetFocusedRecordIndex, Self.GridTableView2SalePrice.Index]  := StrToInt(Names[1]);
        Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.GetFocusedRecordIndex, Self.GridTableView2RowState.Index]   := rsUpdate;
        ExecQuery('update MS_MENU '
                 +'   set CD_MENU_HEAD =:P3 '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_MENU  =:P2;',
                 [HeadStoreCode,
                  Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.GetFocusedRecordIndex, Self.GridTableView2StoreCode.Index],
                  Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.GetFocusedRecordIndex, Self.GridTableView2MenuCode.Index],
                  MenuCodeEdit.Text],true);
      end;
    finally
      Free;
    end;
end;

procedure THeadMenuMasterForm.GridTableView2SalePriceStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[AItem.Index] <> PriceSaleEdit.Value then
    AStyle := StyleFontRed;
end;

procedure THeadMenuMasterForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridTableViewStatus.Index] = 'N' then
    AStyle := StyleFontRed;
end;

procedure THeadMenuMasterForm.GroupNoEditClick(Sender: TObject);
begin
  inherited;
  TcxCustomEdit(Sender).EditModified := true;
end;

procedure THeadMenuMasterForm.InputRemainCheckBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
 // Tag를 99로 해 놓으면 신규 시에도 값을 지우지 않는다
  MenuClassCodeEdit.Tag              := IfThen(InputRemainCheckBox.Checked, 99, 0);
  MenuClassNameEdit.Tag              := MenuClassCodeEdit.Tag;
  MenuTypeComboBox.Tag               := MenuClassCodeEdit.Tag;
  StockTypeComboBox.Tag              := MenuClassCodeEdit.Tag;
  TaxComboBox.Tag                    := MenuClassCodeEdit.Tag;
  UseCheckBox.Tag                    := MenuClassCodeEdit.Tag;
  DcCheckBox.Tag                     := MenuClassCodeEdit.Tag;
  PointCheckBox.Tag                  := MenuClassCodeEdit.Tag;
  KitchenCheckListBox.Tag            := MenuClassCodeEdit.Tag;
  MemoCheckListBox.Tag               := MenuClassCodeEdit.Tag;
  KitchenComboBox.Tag                := MenuClassCodeEdit.Tag;
  PriceSaleEdit.Tag                  := MenuClassCodeEdit.Tag;
end;

procedure THeadMenuMasterForm.KeyInButtonClick(Sender: TObject);
begin
  inherited;
  MenuCodeEdit.Enabled := true;
  MenuCodeEdit.SetFocus;
end;

procedure THeadMenuMasterForm.LogPagerShow(Sender: TObject);
begin
  inherited;
  SetHistoryGridView;
end;

procedure THeadMenuMasterForm.GetMenuClassName(Sender: TObject);
begin
  if Sender = MenuClassCodeEdit then
  begin
    // 상품분류코드를 2, 4, 6, 8 자리로 숫자로 입력했으면 이름을 불러와 표시한다
    if (MenuClassCodeEdit.Text <> EmptyStr) and
       (MenuClassNameEdit.Text =  EmptyStr) and
       (GetOnlyNumber(MenuClassCodeEdit.Text) = MenuClassCodeEdit.Text) and
       (Length(MenuClassCodeEdit.Text) = StoI(GetHeadOption(248))*2) then
    begin
      OpenQuery('select   GetMenuClassName(:P0, :P1, :P2) as NM_CLASS',
               [HeadStoreCode,
                StandardStore,
                MenuClassCodeEdit.Text]);
      try
        MenuClassNameEdit.Text := Query.Fields[0].AsString;
        if MenuClassNameEdit.Text = EmptyStr then
          ShowMsg(MenuClassLabel.Caption+msgMustInput, true)
      finally
        Query.Close;
      end;
    end;
  end
  else if Sender = ConditionGoodsClassCodeEdit then
  begin
    // 상품분류코드를 2, 4, 6, 8 자리로 숫자로 입력했으면 이름을 불러와 표시한다
    if (ConditionGoodsClassCodeEdit.Text <> EmptyStr) and
       (ConditionGoodsClassNameEdit.Text =  EmptyStr) and
       (GetOnlyNumber(ConditionGoodsClassCodeEdit.Text) = ConditionGoodsClassCodeEdit.Text) and
       (Length(ConditionGoodsClassCodeEdit.Text) = StoI(GetHeadOption(248))*2) then
    begin
      OpenQuery('select   GetMenuClassName(:P0, :P1, :P2) as NM_CLASS',
               [HeadStoreCode,
                StandardStore,
                ConditionGoodsClassCodeEdit.Text]);
      try
        ConditionGoodsClassNameEdit.Text := Query.Fields[0].AsString;
        if ConditionGoodsClassNameEdit.Text = EmptyStr then
          ShowMsg(MenuClassLabel.Caption+msgMustInput, true)
      finally
        Query.Close;
      end;
    end;
  end;
end;

procedure THeadMenuMasterForm.MenuClassCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  vClassCode: PStrPointer;
  vTreeNode : TTreeNode;
begin
  inherited;
  // 상품분류 테이블에서 상품분류을 불러오는 창을 띄운다
  if not MenuClassTreeView.Visible then
  begin
    MenuClassTreeView.Left    := MenuClassNameEdit.Left;
    MenuClassTreeView.Top     := MenuClassNameEdit.Top;
    MenuClassTreeView.Visible := true;
    MenuClassTreeView.BringToFront;
    MenuClassTreeView.Items.Clear;
    Application.ProcessMessages;

    OpenQuery('select  NM_CLASS, '
             +'        CD_CLASS '
             +'  from  MS_MENU_CLASS '
             +' where  CD_HEAD       = :P0 '
             +'   and  CD_STORE      = :P1 '
             +'   and  Length(CD_CLASS) = 2',
              [HeadStoreCode,
               StandardStore]);
    try
      while not Query.Eof do
      begin
        New(vClassCode);
        vClassCode^.Data := Query.Fields[1].AsString;
        vTreeNode        := MenuClassTreeView.Items.AddObject(nil, Query.Fields[0].AsString, vClassCode);
        if GetHeadOption(248) <> '1' then
          vTreeNode.HasChildren := true;
        Query.Next;
      end;
    finally
      Query.Close;
    end;

    if MenuClassTreeView.Items.Count > 0 then
      MenuClassTreeView.SetFocus
    else
      MenuClassTreeView.Visible := false;
  end;
end;

procedure THeadMenuMasterForm.MenuClassTreeViewDblClick(Sender: TObject);
var
  vClassData: PStrPointer;
  vClassName: string;
  vTreeNode : TTreeNode;
begin
  inherited;

  // 선택된 노드가 있고 자식이 없는 노드라면
  vTreeNode := (Sender as TcxTreeView).Selected;

  //상품정보의 상품분류 검색버튼을 클릭했을경우
  if (vTreeNode <> nil) then //and (vTreeNode.Count = 0) then
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

    MenuClassCodeEdit.Text := vClassData^.Data;
    MenuClassCodeEdit.EditModified := true;
    MenuClassNameEdit.Text := vClassName;
    if MainPanel.Enabled and PriceSaleEdit.Enabled then
      PriceSaleEdit.SetFocus;
    isChanged := true;
  end;
end;

procedure THeadMenuMasterForm.MenuClassTreeViewExit(Sender: TObject);
begin
  inherited;
  // 상품분류 트리를 숨긴다
  (Sender as TcxTreeView).Visible := false;
end;

procedure THeadMenuMasterForm.MenuClassTreeViewExpanding(Sender: TObject;
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
             +'  from   MS_MENU_CLASS '
             +' where   CD_HEAD  = :P0 '
             +'   and   CD_STORE = :P1 '
             +'   and   CD_CLASS like ConCat(:P2,''%'') '
             +'   and   Length(CD_CLASS) = :P3',
              [HeadStoreCode,
               StandardStore,
               vClassData^.Data,
               Length(vClassData^.Data)+2]);
    try
      while not Query.Eof do
      begin
        New(vClassCode);
        vClassCode^.Data := Query.Fields[1].AsString;
        vTreeNode        := (Sender as TcxCustomInnerTreeView).Items.AddChildObject(Node, Query.Fields[0].AsString, vClassCode);
        // 환경설정에서 관리하겠다고 한 최대 자릿수보다 작으면 자식노드가 있다고 간주한다
        if Length(vClassCode^.Data) < StoI(GetHeadOption(248))*2 then
          vTreeNode.HasChildren := true;
        Query.Next;
      end;
      Node.HasChildren := Node.Count > 0;
      AllowExpansion   := Node.HasChildren;
    finally
      Query.Close;
    end;
  end;
end;

procedure THeadMenuMasterForm.MenuClassTreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Enter를 누르면 더블클릭을 한 것과 같은 처리를 한다
  if Key = VK_Return then
    MenuClassTreeViewDblClick(Sender)

  // Esc를 누르면 포커스가 빠져나가는 것과 같은 처리를 한다
  else if Key = VK_Escape then
  begin
    MenuClassTreeViewExit(Sender);
    if MainPanel.Enabled and MenuClassCodeEdit.Enabled then
      MenuClassCodeEdit.SetFocus;
  end;
end;

//메뉴명을 메뉴단축명에 넣는다
procedure THeadMenuMasterForm.MenuNameEditExit(Sender: TObject);
begin
  inherited;
  if MenuNameEdit.EditModified then
  begin
    MenuShortNameEdit.Text := MenuNameEdit.Text;
    MenuShortNameEdit.EditModified := true;
  end;
end;

function THeadMenuMasterForm.DoDelete: Boolean;
begin
  inherited;
  if IncMinute(Now(), -3) > GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewInsertDate.Index] then
  begin
    MsgBox('등록 후 1분이내에만 삭제가 가능합니다');
    Exit;
  end;

  try
    Result := ExecQuery('delete from MS_SMALL '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_SPC_D '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_MENU '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_MENU_ITEM '
                       +' where CD_HEAD   =:P0 '
                       +'   and CD_STORE  =:P1 '
                       +'   and (CD_MENU  =:P2 or CD_ITEM = :P2);'
                       +'delete from MS_MENU_MEMO '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_MENU_DC '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_MENU  =:P2;',
                       [HeadStoreCode,
                        StandardStore,
                        Trim(MenuCodeEdit.Text)]);
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure THeadMenuMasterForm.DoGridLink;
  procedure SetPrinter(var aCheckListBox: TcxCheckListBox; aText: String);
  var
    i, j: Integer;
  begin
    ClearCheckListBox(aCheckListBox);

    while aText <> '' do
    begin
       i := Pos(',', AText);
       if i > 0 then
       begin
          j := GetCheckListBox(BackKitchenList, Copy(aText, 1, Pred(i)) );
          if j > -1 then
            aCheckListBox.Items[j].Checked := True;
          Delete(AText, 1, i);
       end
       else
       begin
          j := GetCheckListBox(BackKitchenList, aText);
          if j > -1 then
            aCheckListBox.Items[j].Checked := True;

          aText :='';
       end;
    end;
    //CheckListBox 에는 EditModified 속성이 없어서 Tag로 사용한다 (0:변경안됨, 1:변경됨)
    KitchenCheckListBox.Tag := 0;
  end;
var vIndex :Integer;
    vStream    : TStream;
    vPNG       : TPNGImage;
begin
  inherited;
  try
    KeyInButton.Enabled  := false;
    MenuCodeEdit.Enabled := false;
    OpenQuery('select CD_MENU, '
             +'       NM_MENU, '
             +'       NM_MENU_SHORT, '
             +'       CD_CLASS, '
             +'       CD_CORNER, '
             +'       DS_MENU_TYPE, '
             +'       NO_MENU, '
             +'       QTY_SELECT, '
             +'       PR_BUY, '
             +'       PR_SALE, '
             +'       DS_TAX, '
             +'       PR_SALE_DOUBLE, '
             +'       PR_SALE_PROFIT, '
             +'       PR_TIP, '
             +'       PR_SALE_PACKING, '
             +'       BILL_SEQ, '
             +'       NO_GROUP, '
             +'       YN_USE, '
             +'       CD_PRINTER, '
             +'       DS_KITCHEN, '
             +'       SAVE_STAMP, '
             +'       USE_STAMP, '
             +'       DS_STOCK, '
             +'       QTY_UNIT, '
             +'       OPTIONS, '
             +'       CONFIG, '
             +'       GetMenuClassName(CD_HEAD, CD_STORE, CD_CLASS) as NM_CLASS '
             +'  from MS_MENU  '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_MENU  =:P2 ',
             [HeadStoreCode,
              StandardStore,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);


     MenuCodeEdit.Text          := Query.FieldByName('CD_MENU').AsString;
     MenuNameEdit.Text          := Query.FieldByName('NM_MENU').AsString;
     MenuNameEdit.EditModified  := false;
     MenuShortNameEdit.Text     := Query.FieldByName('NM_MENU_SHORT').AsString;
     MenuShortNameEdit.EditModified := false;
     MenuClassCodeEdit.Text     := Query.FieldByName('CD_CLASS').AsString;
     MenuClassNameEdit.Text     := Query.FieldByName('NM_CLASS').AsString;
     MenuTypeComboBox.ItemIndex := GetStrPointerIndex(MenuTypeComboBox, Query.FieldByName('DS_MENU_TYPE').AsString);
     MenuNoEdit.Text            := Query.FieldByName('NO_MENU').AsString;
     MenuCountEdit.Value        := Query.FieldByName('QTY_SELECT').AsCurrency;
     PriceBuyEdit.Value         := Query.FieldByName('PR_BUY').AsCurrency;
     PriceSaleEdit.Value        := Query.FieldByName('PR_SALE').AsCurrency;
     TaxComboBox.ItemIndex      := GetStrPointerIndex(TaxComboBox, Query.FieldByName('DS_TAX').AsString);
     PriceDoubleEdit.Value      := Query.FieldByName('PR_SALE_DOUBLE').AsCurrency;
     PriceProfitRateEdit.Value  := Query.FieldByName('PR_SALE_PROFIT').AsCurrency;
     PriceTipEdit.Value         := Query.FieldByName('PR_TIP').AsCurrency;
     PricePackingEdit.Value     := Query.FieldByName('PR_SALE_PACKING').AsCurrency;
     DisplaySeqEdit.Value       := Query.FieldByName('BILL_SEQ').AsCurrency;
     GroupNoEdit.Value          := Query.FieldByName('NO_GROUP').AsCurrency;
     UseCheckBox.Checked        := Query.FieldByName('YN_USE').AsString = 'Y';
     SetPrinter(KitchenCheckListBox, Query.FieldByName('CD_PRINTER').AsString);
     ItemCheckListBox.Enabled   := GetStrPointerData(MenuTypeComboBox) ='N';
     KitchenComboBox.ItemIndex  := GetStrPointerIndex(KitchenComboBox, Query.FieldByName('DS_KITCHEN').AsString);
     DcCheckBox.Checked         := Copy(Query.FieldByName('CONFIG').AsString,1,1) = 'Y';
     PointCheckBox.Checked      := Copy(Query.FieldByName('CONFIG').AsString,2,1) = 'Y';
     PrintCheckBox.Checked      := Copy(Query.FieldByName('CONFIG').AsString,3,1) = 'Y';
     Option4Edit.Value          := StrToIntDef(Copy(Query.FieldByName('CONFIG').AsString,4,1),0);
     BillPrintCheckBox.Checked  := (Copy(Query.FieldByName('CONFIG').AsString,5,1) = 'Y') or (Copy(Query.FieldByName('CONFIG').AsString,5,1) = '');
     TableColorCheckBox.Checked := Copy(Query.FieldByName('CONFIG').AsString,6,1) = 'Y';
     TicketCheckBox.Checked     := Copy(Query.FieldByName('CONFIG').AsString,7,1) = 'Y';
     SoldOutCheckBox.Checked    := Copy(Query.FieldByName('CONFIG').AsString,8,1) = 'Y';
     PointLimitCheckBox.Checked := Copy(Query.FieldByName('CONFIG').AsString,9,1) = 'Y';
     PackingCheckBox.Checked    := Copy(Query.FieldByName('CONFIG').AsString,10,1) = 'Y';
     Option12CheckBox.Checked    := Copy(Query.FieldByName('CONFIG').AsString,12,1) = 'Y';
     Option13ComboBox.ItemIndex  := GetStrPointerIndex(Option13ComboBox, Copy(Query.FieldByName('CONFIG').AsString,13,1));
     Option14Edit.Value          := StrToIntDef(Copy(Query.FieldByName('CONFIG').AsString,14,1),0);
     StampSaveEdit.Value        := Query.FieldByName('SAVE_STAMP').AsInteger;
     StampUseEdit.Value         := Query.FieldByName('USE_STAMP').AsInteger;
     StockTypeComboBox.ItemIndex  := GetStrPointerIndex(StockTypeComboBox, Query.FieldByName('DS_STOCK').AsString);
     UnitQtyEdit.Value            := Query.FieldByName('QTY_UNIT').AsCurrency;
     SalePriceFixCheckBox.Checked := Copy(Query.FieldByName('OPTIONS').AsString,2,1)='1';


     //주방메모
     if (GetHeadOption(156) = '1') or (GetHeadOption(156) = '2') then
       try
         DM.OpenQuery('select CD_MEMO '
                     +'  from MS_MENU_MEMO '
                     +' where CD_HEAD  =:P0 '
                     +'   and CD_STORE =:P1 '
                     +'   and CD_MENU  =:P2 ',
                     [HeadStoreCode,
                      StandardStore,
                      Trim(MenuCodeEdit.Text)]);
         ClearCheckListBox(MemoCheckListBox);

         while not DM.Query.Eof do
         begin
           if GetCheckListBox(BackMemoList, DM.Query.FieldByName('CD_MEMO').AsString) >= 0 then
             MemoCheckListBox.Items[GetCheckListBox(BackMemoList, DM.Query.FieldByName('CD_MEMO').AsString)].Checked := True;
           DM.Query.Next;
         end;
       finally
         DM.Query.Close;
       end;

     //회원등급 할인/포인트
     if (GetHeadOption(251) = '1') or (GetHeadOption(258) = '1') then
       try
         DM.OpenQuery('select a.NM_CODE1, '
                     +'       ifnull(b.DC_RATE,0)    as DC_RATE, '
                     +'       ifnull(b.POINT_RATE,0) as POINT_RATE, '
                     +'       a.CD_CODE '
                     +'  from MS_CODE    a left outer join'
                     +'       MS_MENU_DC b on a.CD_HEAD  = b.CD_HEAD '
                     +'                   and a.CD_STORE = b.CD_STORE '
                     +'                   and a.CD_CODE  = b.DS_MEMBER '
                     +'                   and b.CD_MENU  =:P2  '
                     +' where a.CD_HEAD  =:P0 '
                     +'   and a.CD_STORE =:P1 '
                     +'   and a.CD_KIND  = ''05'' '
                     +' order by a.CD_CODE ',
                     [HeadStoreCode,
                      StandardStore,
                      Trim(MenuCodeEdit.Text)]);
         DM.ReadQuery(DM.Query, GridTableView1);
       finally
         DM.Query.Close;
       end;

     //재고관련
     MenuPager.Enabled            := StockTypeComboBox.ItemIndex < 2;
     EditPropertiesChange(MenuTypeComboBox);

     //아이템
     try
       DM.OpenQuery('select CD_ITEM '
                   +'  from MS_MENU_ITEM '
                   +' where CD_HEAD  =:P0 '
                   +'   and CD_STORE =:P1 '
                   +'   and CD_MENU  =:P2 '
                   +' order by CD_ITEM ',
                   [HeadStoreCode,
                    StandardStore,
                    Trim(MenuCodeEdit.Text)]);
       ClearCheckListBox(ItemCheckListBox);

       while not DM.Query.Eof do
       begin
         if GetCheckListBox(BackItemList, DM.Query.FieldByName('CD_ITEM').AsString) >= 0 then
         begin
           ItemCheckListBox.Items[GetCheckListBox(BackItemList, DM.Query.FieldByName('CD_ITEM').AsString)].Checked := True;
         end;
         DM.Query.Next;
       end;
     finally
       DM.Query.Close;
     end;


     OpenQuery('select a.CD_STORE, '
              +'       a.NM_STORE, '
              +'       b.CD_MENU, '
              +'       b.NM_MENU, '
              +'       b.PR_SALE '
              +'  from MS_STORE as a left outer join '
              +'       MS_MENU  as b on b.CD_HEAD =  a.CD_HEAD '
              +'                    and b.CD_STORE = a.CD_STORE '
              +Ifthen(GetChainHeadOption(2) = '1', 'and b.CD_MENU =:P2 ','and b.CD_MENU_HEAD =:P2 ')
              +' where a.CD_HEAD  =:P0 '
              +'   and a.CD_STORE <> :P1 '
              +'   and a.YN_USE = ''Y'' '
              +' order by a.CD_STORE ',
              [HeadStoreCode,
               StandardStore,
               MenuCodeEdit.Text]);

     DM.ReadQuery(Query, GridTableView2);
     if MenuPager.ActivePage = LogPager then
       SetHistoryGridView;
  finally
    Query.Close;
  end;
  isChanged := false;
end;

function THeadMenuMasterForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    MenuPager.Enabled   := true;
    MenuPager.ActivePageIndex := 0;
    MenuCodeEdit.Text   := GetMenuCode;
    MenuCountEdit.Value := 0;
    DisplaySeqEdit.Value := 0;
    // (상품코드) 생성 버튼을 활성화한다
    KeyInButton.Enabled  := true;
    if not InputRemainCheckBox.Checked then
      ClearCheckListBox(KitchenCheckListBox);
    ClearCheckListBox(MemoCheckListBox);
    ClearCheckListBox(ItemCheckListBox);
    UseCheckBox.Checked   := true;
    DcCheckBox.Checked    := true;
    PointCheckBox.Checked := true;
    PointLimitCheckBox.Checked := false;
    PrintCheckBox.Checked := true;
    BillPrintCheckBox.Checked := true;
    TableColorCheckBox.Checked := false;
    MenuNameEdit.Properties.ReadOnly := false;
    ItemCheckListBox.Enabled  := true;
    MenuNameEdit.SetFocus;
  finally
    isLoading := false;
    Result    := true;
  end;
end;

function THeadMenuMasterForm.DoSave: Boolean;
var  vIndex, vIndex1, vParamIndex :Integer;
     vKitchen :String;
     vSQLText, vCode :String;
     vResult     :Boolean;
     vConfig :String;
     vPointSQL :String;
     vOptions,
     vTemp,
     vSQL :String;
begin
  result := false;

  //주방 출력
  For vIndex := 0 to Pred(KitchenCheckListBox.Items.Count) do
  begin
    if vIndex > KitchenCheckListBox.Items.Count then Continue;
    if KitchenCheckListBox.Items[vIndex].Checked then
      vKitchen := vKitchen +  BackKitchenList.Strings[vIndex]+',';
  end;
  if (vKitchen <> '') and (vKitchen[Length(vKitchen)]=',') then Delete(vKitchen,Length(vKitchen),1);

  if isMultiMode then
  begin
    try
      Screen.Cursor := crSQLWait;
      vParamIndex := 2;
      if KitchenCheckListBox.Tag = 1 then
        vSQLText    := KitchenCheckListBox.Hint+Format('=:P%s, ',[IntToStr(vParamIndex)]);

      if DcCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(''%s'', Right(CONFIG,%d)), ',[Ifthen(DcCheckBox.Checked,'Y','N'),29]);

      if PointCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[1,Ifthen(PointCheckBox.Checked,'Y','N'),28]);

      if Option4Edit.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[3,IntToStr(Option4Edit.Value),26]);

      if BillPrintCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[4,Ifthen(BillPrintCheckBox.Checked,'Y','N'),25]);

      if TableColorCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[5,Ifthen(TableColorCheckBox.Checked,'Y','N'),24]);

      if TicketCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[6,Ifthen(TicketCheckBox.Checked,'Y','N'),23]);

      if SoldOutCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[7,Ifthen(SoldOutCheckBox.Checked,'Y','N'),22]);

      if PointLimitCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[8,Ifthen(PointLimitCheckBox.Checked,'Y','N'),21]);

      if PackingCheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = ConCat(Left(CONFIG, %d), ''%s'', Right(CONFIG,%d)), ',[9,Ifthen(PackingCheckBox.Checked,'Y','N'),20]);

      if SalePriceFixCheckBox.EditModified then
        vSQLText := vSQLText + Format('OPTIONS = ConCat(Left(OPTIONS, %d), ''%s'', Right(OPTIONS,%d)), ',[1,Ifthen(SalePriceFixCheckBox.Checked,'1','0'),18]);



      for vIndex := 0 to ComponentCount-1 do
      begin
        if ( (TControl(Components[vIndex]).Parent = TopPanel)
          or (TControl(Components[vIndex]).Parent = StockGroupBox)
          or (TControl(Components[vIndex]).Parent = CenterPanel)
          or (TControl(Components[vIndex]).Parent = KitchenPanel)
          or (TControl(Components[vIndex]).Parent = StampGroupBox))
          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))
               or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint <> '') and TcxSpinEdit(Components[vIndex]).EditModified )
               or ((Components[vIndex] is TcxCheckListBox ) and (TcxCheckListBox(Components[vIndex]).Hint <> '') and (TcxCheckListBox(Components[vIndex]).Tag = 1)) )  then
        begin
          if (TControl(Components[vIndex]).Hint = 'YN_DC')
            or (TControl(Components[vIndex]).Hint = 'YN_POINT')
            or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint = 'GUEST_COUNT'))
            or (TControl(Components[vIndex]).Hint = 'YN_BILL')
            or (TControl(Components[vIndex]).Hint = 'YN_TABLECOLOR')
            or (TControl(Components[vIndex]).Hint = 'YN_TICKET')
            or (TControl(Components[vIndex]).Hint = 'YN_SOLDOUT')
            or (TControl(Components[vIndex]).Hint = 'YN_PRICEFIX')
            or (TControl(Components[vIndex]).Hint = 'YN_POINT_LIMIT')
            or (TControl(Components[vIndex]).Hint = 'YN_PACKING') then
          begin
            Continue;
          end
          else
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
      end;

      vSQLText := 'update MS_MENU set '
                 + vSQLText +' PRG_CHANGE = ''MST'', CD_SAWON_CHG = '''+UserCode+''', DT_CHANGE = Now() '
                 +' where CD_HEAD =:P0 and CD_STORE '+DestStoreCode;

      vCode := EmptyStr;
      for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        vCode := vCode + Format('''%s'',',[String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewMenuCode.Index])]);

      vCode    := 'and CD_MENU in ('+LeftStr(vCode, Length(vCode)-1)+');';

      vSQLText := vSQLText + vCode;

      //Param에 값을 대입한다
      vParamIndex := 2;                                   //
      if KitchenCheckListBox.Tag = 1 then
       vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[vKitchen]));

      for vIndex := 0 to ComponentCount-1 do
      begin
        if ( (TControl(Components[vIndex]).Parent = TopPanel)
          or (TControl(Components[vIndex]).Parent = StockGroupBox)
          or (TControl(Components[vIndex]).Parent = CenterPanel)
          or (TControl(Components[vIndex]).Parent = KitchenPanel)
          or (TControl(Components[vIndex]).Parent = StampGroupBox))
          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))
               or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint <> '') and TcxSpinEdit(Components[vIndex]).EditModified )
               or ((Components[vIndex] is TcxCheckListBox ) and (TcxCheckListBox(Components[vIndex]).Hint <> '') and (TcxCheckListBox(Components[vIndex]).Tag = 1)) )  then
        begin
          if (TControl(Components[vIndex]).Hint = 'YN_DC')
            or (TControl(Components[vIndex]).Hint = 'YN_POINT')
            or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint = 'GUEST_COUNT'))
            or (TControl(Components[vIndex]).Hint = 'YN_BILL')
            or (TControl(Components[vIndex]).Hint = 'YN_TABLECOLOR')
            or (TControl(Components[vIndex]).Hint = 'YN_TICKET')
            or (TControl(Components[vIndex]).Hint = 'YN_SOLDOUT')
            or (TControl(Components[vIndex]).Hint = 'YN_PRICEFIX')
            or (TControl(Components[vIndex]).Hint = 'YN_POINT_LIMIT')
            or (TControl(Components[vIndex]).Hint = 'YN_PACKING') then
          begin
            Continue;
          end
          else
          begin
            if (Components[vIndex] is TcxCurrencyEdit) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), FormatFloat('#0.00',TcxCurrencyEdit(Components[vIndex]).Value))
            else if (Components[vIndex] is TcxButtonEdit) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxButtonEdit(Components[vIndex]).Text]))
            else if (Components[vIndex] is TcxMemo) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxMemo(Components[vIndex]).Text]))
            else if (Components[vIndex] is TcxCheckBox) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[Ifthen(TcxCheckBox(Components[vIndex]).Checked,'Y','N')]))
            else if (Components[vIndex] is TcxTextEdit) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[TcxTextEdit(Components[vIndex]).Text]))
            else if (Components[vIndex] is TcxComboBox) then
              vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[GetStrPointerData(TcxComboBox(Components[vIndex]))]))
            else if (Components[vIndex] is TcxCheckListBox) then
             vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('''%s''',[vKitchen]))
            else if (Components[vIndex] is TcxSpinEdit) then
             vSQLText := Replace(vSQLText, Format(':P%d',[vParamIndex]), Format('%s',[TcxSpinEdit(Components[vIndex]).Text]));

            Inc(vParamIndex);
          end;
        end;
      end;

      vSQL := Replace(vSQLText, ':P0', Format('''%s''',[HeadStoreCode]));
      ExecQuery(vSQL,[],true);

      isChanged := false;
      isMultiMode                := False;
      DoGridLink;
      Result := True;
    finally
      Screen.Cursor := crDefault;
    end;
    Exit;
  end;


  if isNew and (Length(MenuCodeEdit.Text) < 4) then
    MenuCodeEdit.Text := LPad(MenuCodeEdit.Text, 4, '0');

  // 메뉴코드
  if Trim(MenuCodeEdit.Text) = EmptyStr then
  begin
    ErrBox(MenuCodeLabel.Caption+msgMustInput);
    MenuPager.ActivePageIndex := 0;
    if MainPanel.Enabled and MenuCodeEdit.Enabled then
      MenuCodeEdit.SetFocus;
    Exit;
  end;

  // 메뉴 이름
  if Trim(MenuNameEdit.Text) = EmptyStr then
  begin
    ErrBox(MenuNameLabel.Caption+msgMustInput);
    MenuPager.ActivePageIndex := 0;
    if MainPanel.Enabled and MenuNameEdit.Enabled then
      MenuNameEdit.SetFocus;
    Exit;
  end;

  // 메뉴 단축이름
  if Trim(MenuShortNameEdit.Text) = EmptyStr then
  begin
    ErrBox(MenuShortNameLabel.Caption+msgMustInput);
    MenuPager.ActivePageIndex := 0;
    if MainPanel.Enabled and MenuShortNameEdit.Enabled then
      MenuShortNameEdit.SetFocus;
    Exit;
  end;
  //메뉴코드중복체크
  if isNew and (Trim(MenuCodeEdit.Text) <> '') then
  begin
    try
      if OpenQuery('select YN_USE '
                  +'  from MS_MENU '
                  +' where CD_HEAD  =:P0 '
                  +'   and CD_STORE =:P1 '
                  +'   and CD_MENU  =:P2 ',
                  [HeadStoreCode,
                   StandardStore,
                   Trim(MenuCodeEdit.Text)]) then
      begin
        if Query.Fields[0].AsString = 'Y' then
        begin
          ErrBox('이미 사용 중인 코드입니다');
          if MenuCodeEdit.Enabled then MenuCodeEdit.SetFocus;
          Exit;
        end
        else if Query.Fields[0].AsString = 'N' then
        begin
          ErrBox('사용이 중지 된 코드입니다');
          if MenuCodeEdit.Enabled then MenuCodeEdit.SetFocus;
          Exit;
        end
      end;
    finally
      Query.Close;
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
                   StandardStore,
                   MenuNameEdit.Text]) then
      begin
        if not AskBox('동일한 이름의 메뉴가 존재합니다'+#13+'계속하시겠습니까?') then
        begin
          MenuNameEdit.SetFocus;
          Exit;
        end;
      end;
    finally
      Query.Close;
    end;
  end;

  //메뉴번호기능을 사용할때 메뉴번호 중복체크
  if (StrToIntDef(MenuNoEdit.Text,0) > 0) then
  begin
    try
      OpenQuery('select Count(*) '
               +'  from MS_MENU '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and NO_MENU  =:P2 ',
               [HeadStoreCode,
                StandardStore,
                StrToInt(MenuNoEdit.Text)]);

      if ( isNew and (Query.Fields[0].AsInteger > 0) ) or ( not isNew and (Query.Fields[0].AsInteger >= 2) ) then
      begin
        ErrBox('동일한 메뉴번호가 이미 있습니다');
        MenuNoEdit.SetFocus;
        Exit;
      end;
    finally
      Query.Close;
    end;
  end;

  //저울메뉴
  if (GetStrPointerData(MenuTypeComboBox) ='W') and (PriceSaleEdit.Value = 0) then
  begin
    ErrBox('저울메뉴일때는 판매단가가 반드시 입력되어야 합니다');
    PriceSaleEdit.SetFocus;
    Exit;
  end;

  vConfig := Ifthen(DCCheckBox.Checked, 'Y', 'N')
            +Ifthen(PointCheckBox.Checked, 'Y', 'N')     //2 - 포인트
            +Ifthen(PrintCheckBox.Checked, 'Y', 'N')     //3 - 영수증출력
            +Option4Edit.Text
            +Ifthen(BillPrintCheckBox.Checked, 'Y', 'N')  //5 - 고객영수증
            +Ifthen(TableColorCheckBox.Checked, 'Y', 'N')
            +Ifthen(TicketCheckBox.Checked, 'Y', 'N')
            +Ifthen(SoldOutCheckBox.Checked, 'Y', 'N')
            +Ifthen(PointLimitCheckBox.Checked, 'Y', 'N')
            +Ifthen(PackingCheckBox.Checked, 'Y', 'N')
            +'0'
            +Ifthen(Option12CheckBox.Checked, 'Y', 'N')
            +GetStrPointerData(Option13ComboBox)
            +Option14Edit.Text;
                                        //
  vConfig := RPad(vConfig,30,'0');


  try
    TempSQL   := '';
    vSQL      := '';
    vOptions  := RPad('1'+Ifthen(SalePriceFixCheckBox.Checked,'1','0'),20,'0');
    if isNew then
    begin
      OpenQuery('select CD_STORE '
               +'  from MS_MENU '
               +' where CD_HEAD  =:P0 '
               +'   and CD_MENU  =:P1 ',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text)]);

      for vIndex := 0 to WorkStoreList.Count-1 do
      begin
        if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),1,1) = '0' then Continue;

        if Query.Active and Query.Locate('CD_STORE',CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0), [loCaseInsensitive] ) then Continue;

        vSQL :=  vSQL + Format('(''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	   %s, '
                             +'	   %s, '
                             +'	   %s, '
                             +'	   %s, '
                             +'	   %s, '
                             +'	   %s, '
                             +'	   %s, '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'	   %d, '
                             +'	   %s, '
                             +'	 ''%s'', '
                             +'	   %d, '
                             +'	 ''%s'', '
                             +'	   %d, '
                             +'	   %d, '
                             +'	 ''%s'', '
                             +'	 ''%s'', '
                             +'  ''MST'', '
                             +'  ''MST'', '
                             +'  NOW()),',
                             [HeadStoreCode,
                              CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                              Trim(MenuCodeEdit.Text),
                              MenuNameEdit.Text,
                              MenuShortNameEdit.Text,
                              MenuClassCodeEdit.Text,
                              GetStrPointerData(MenuTypeComboBox),
                              '',
                              Ifthen(MenuNoEdit.Text='','0',MenuNoEdit.Text),
                              MenuCountEdit.Text,
                              IntToStr(Trunc(PriceBuyEdit.Value)),
                              IntToStr(Trunc(PriceSaleEdit.Value)),
                              IntToStr(Trunc(PriceDoubleEdit.Value)),
                              FloatToStr(PriceProfitRateEdit.Value),
                              IntToStr(Trunc(PriceTipEdit.Value)),
                              IntToStr(Trunc(PricePackingEdit.Value)),
                              GetStrPointerData(TaxComboBox),
                              vConfig,
                              vKitchen,
                              GetStrPointerData(KitchenComboBox),
                              Trunc(DisplaySeqEdit.Value),
                              GroupNoEdit.Text,
                              GetStrPointerData(StockTypeComboBox),
                              Trunc(UnitQtyEdit.Value),
                              Ifthen(UseCheckBox.Checked, 'Y', 'N'),
                              Trunc(StampSaveEdit.EditValue),
                              Trunc(StampUseEdit.EditValue),
                              UserCode,
                              vOptions]);
      end;
      Query.Close;

      vSQL := LeftStr(vSQL, Length(vSQL)-1);

      ExecQuery('insert into MS_MENU(CD_HEAD, '
               +'                    CD_STORE, '
               +'                    CD_MENU, '
               +'	 				           NM_MENU, '
               +'	 				           NM_MENU_SHORT, '
               +'	 				           CD_CLASS, '
               +'	 				           DS_MENU_TYPE, '
               +'	 				           CD_CORNER, '
               +'	 				           NO_MENU, '
               +'	 				           QTY_SELECT, '
               +'                    PR_BUY, '
               +'	 				           PR_SALE, '
               +'	 				           PR_SALE_DOUBLE, '
               +'	 				           PR_SALE_PROFIT, '
               +'	 				           PR_TIP, '
               +'	 				           PR_SALE_PACKING, '
               +'	 				           DS_TAX, '
               +'	 				           CONFIG, '
               +'	 				           CD_PRINTER, '
               +'	 				           DS_KITCHEN, '
               +'	 				           BILL_SEQ, '
               +'	 				           NO_GROUP, '
               +'	 				           DS_STOCK, '
               +'                    QTY_UNIT, '
               +'                    YN_USE, '
               +'                    SAVE_STAMP, '
               +'                    USE_STAMP, '
               +'	 				           CD_SAWON_CHG, '
               +'                    OPTIONS, '
               +'                    PRG_INSERT, '
               +'                    PRG_CHANGE, '
               +'                    DT_CHANGE ) '
               +'            VALUES '+ vSQL + ';',[],false);
    end
    else
    begin
      ExecQuery('UPDATE MS_MENU'
               +'   set NM_MENU        = :P2, '
               +'       NM_MENU_SHORT  = :P3, '
               +'       CD_CLASS       = :P4, '
               +'       DS_MENU_TYPE   = :P5, '
               +'       CD_CORNER      = :P6, '
               +'       NO_MENU        = :P7, '
               +'       QTY_SELECT     = :P8, '
               +'       PR_BUY         = :P9, '
               +Ifthen(SalePriceFixCheckBox.Checked, 'PR_SALE = :P10, ',Format('PR_SALE = case when CD_STORE = ''%s'' then :P10 else PR_SALE end, ',[StandardStore]))
               +Ifthen(SalePriceFixCheckBox.Checked, 'PR_SALE_DOUBLE = :P11, ',Format('PR_SALE_DOUBLE = case when CD_STORE = ''%s'' then :P11 else PR_SALE_DOUBLE end, ',[StandardStore]))
               +'       PR_SALE_PROFIT = :P12, '
               +Ifthen(SalePriceFixCheckBox.Checked,' PR_TIP = :P13, ',Format('PR_TIP = case when CD_STORE = ''%s'' then :P13 else PR_TIP end, ',[StandardStore]))
               +'       PR_SALE_PACKING = :P14, '
               +'       DS_TAX         = :P15, '
               +'       CONFIG         = :P16, '
               +Ifthen(GetHeadOption(10) = '1', 'CD_PRINTER = :P17, DS_KITCHEN = :P18,',Format('CD_PRINTER = case when CD_STORE = ''%s'' then :P17 else CD_PRINTER end, DS_KITCHEN = case when CD_STORE = ''%s'' then :P18 else DS_KITCHEN end,',[StandardStore, StandardStore]))
               +'       BILL_SEQ       = :P19, '
               +'       NO_GROUP       = :P20, '
               +'       DS_STOCK       = :P21, '
               +'       QTY_UNIT       = :P22, '
               +'       YN_USE         = :P23, '
               +'       SAVE_STAMP     = :P24, '
               +'       USE_STAMP      = :P25, '
               +'       CD_SAWON_CHG   = :P26, '
               +'       OPTIONS        = StringPosReplace(OPTIONS,2,:P27), '
               +'       PRG_CHANGE     =''MST'', '
               +'       DT_CHANGE      =NOW() '
               +' where CD_HEAD =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_MENU = :P1; ',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text),
                MenuNameEdit.Text,
                MenuShortNameEdit.Text,
                MenuClassCodeEdit.Text,
                GetStrPointerData(MenuTypeComboBox),
                '',
                Ifthen(MenuNoEdit.Text='','0',MenuNoEdit.Text),
                MenuCountEdit.EditValue,         //P8
                PriceBuyEdit.Value,
                PriceSaleEdit.Value,
                PriceDoubleEdit.Value,           //11
                PriceProfitRateEdit.Value,
                PriceTipEdit.Value,
                PricePackingEdit.Value,
                GetStrPointerData(TaxComboBox),
                vConfig,          //16
                vKitchen,
                GetStrPointerData(KitchenComboBox),
                DisplaySeqEdit.Value,
                GroupNoEdit.Text,
                GetStrPointerData(StockTypeComboBox),
                UnitQtyEdit.Value,
                Ifthen(UseCheckBox.Checked, 'Y', 'N'),
                StampSaveEdit.EditValue,
                StampUseEdit.EditValue,
                UserCode,
                Ifthen(SalePriceFixCheckBox.Checked,'1','0')],false);
    end;

    //혹시 내용중에 구분자 ";" 있을경우 뺀다
    TempSQL := Replace(TempSQL,';','')+';';
    //아이템저장
    if (GetChainHeadOption(2) = '1') and (GetHeadOption(57) = '1') then
    begin
      ExecQuery('delete '
               +'  from MS_MENU_ITEM '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_MENU  =:P1;',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text)],false);
      vSQL := '';
      for vIndex := 0 to WorkStoreList.Count-1 do
      begin
        if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),1,1) = '0' then Continue;
        for vIndex1 := 0 to ItemCheckListBox.Count-1 do
          if ItemCheckListBox.Items[vIndex1].Checked then
            vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s''),',
                                [HeadStoreCode,
                                 CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                                 Trim(MenuCodeEdit.Text),
                                 BackItemList.Strings[vIndex1]]);
      end;

      if vSQL <> '' then
      begin
        vSQL := LeftStr(vSQL, Length(vSQL)-1);
        ExecQuery('insert into MS_MENU_ITEM(CD_HEAD, '
                 +'                         CD_STORE, '
                 +'                         CD_MENU, '
                 +'                         CD_ITEM) '
                 +'                  values'+vSQL+';',[],false);
      end;
    end;

    //주방메모저장
    if (GetChainHeadOption(2) = '1') and ((GetHeadOption(156) = '1') or (GetHeadOption(156) = '2')) then
    begin
      vSQL := '';
      ExecQuery('delete '
               +'  from MS_MENU_MEMO '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_MENU  =:P1;',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text)],false);

      for vIndex := 0 to WorkStoreList.Count-1 do
      begin
        if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),1,1) = '0' then Continue;
        for vIndex1 := 0 to MemoCheckListBox.Count-1 do
          if MemoCheckListBox.Items[vIndex1].Checked then
            vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s''),',
                                 [HeadStoreCode,
                                  CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                                  Trim(MenuCodeEdit.Text),
                                  BackMemoList.Strings[vIndex1]]);
      end;
      if vSQL <> '' then
      begin
        vSQL := LeftStr(vSQL, Length(vSQL)-1);

        ExecQuery('insert into MS_MENU_MEMO(CD_HEAD, '
                 +'                         CD_STORE, '
                 +'                         CD_MENU, '
                 +'                         CD_MEMO) '
                 +'                 values'+vSQL+';',[],false);
        end;
    end;

    //메뉴단축명 변경 시 PLU명도 변경한다.
    if not isNew and MenuShortNameEdit.EditModified then
    begin
      ExecQuery('update MS_SMALL '
               +'   set NM_VIEW = :P2 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_MENU  =:P1 '
               +'   and CD_GUBUN not in (''98'',''99'');',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text),
                MenuShortNameEdit.Text],false);
      ExecQuery('update MS_KIOSK_SMALL '
               +'   set NM_VIEW = :P2 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_MENU  =:P1;',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text),
                MenuShortNameEdit.Text],false);
    end;


    //메뉴를 단종처리하면 PLU에서 자동 삭제한다
    if not UseCheckBox.Checked then
    begin
      ExecQuery('delete '
               +'  from MS_SMALL '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_MENU  =:P1;',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text)],false);
      ExecQuery('delete '
               +'  from MS_KIOSK_SMALL '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_MENU  =:P1;',
               [HeadStoreCode,
                Trim(MenuCodeEdit.Text)],false);
    end;

    Result := ExecQuery('',[],true);

    if isNew then
    begin
      SetLength(NewData, 4);
      NewData[0] := Trim(MenuCodeEdit.Text);
      NewData[1] := MenuNameEdit.Text;
      NewData[2] := 'Y';
      NewData[3] := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now());
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewMenuName.Index] := MenuNameEdit.Text;
  except
     on E: Exception do
     begin
       ErrBox(E.Message);
     end;
  end;
end;

procedure THeadMenuMasterForm.SaveMemberDcPointRate(aMenu, aCode: String;
  aDcRate, aPointRate: Currency);
var vIndex : Integer;
begin
  inherited;
  if (GetHeadOption(251)='0') and (GetHeadOption(258)='0') then Exit;

  for vIndex := 0 to WorkStoreList.Count-1 do
  begin
    if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),5,1) = '0' then Continue;
    ExecQuery('insert into MS_MENU_DC(CD_HEAD, '
             +'                       CD_STORE, '
             +'                       DS_MEMBER, '
             +'                       CD_MENU, '
             +'                       DC_RATE, '
             +'                       POINT_RATE) '
             +'                Values(:P0, '
             +'                       :P1, '
             +'                       :P2, '
             +'                       :P3, '
             +'                       :P4, '
             +'                       :P5) '
             +' ON DUPLICATE KEY UPDATE DC_RATE    =:P4, '
             +'                         POINT_RATE =:P5; ',
             [HeadStoreCode,
              CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
              aCode,
              aMenu,
              aDcRate,
              aPointRate],false);
  end;
  if TempSQL <> '' then
    ExecQuery('',[],true);
end;

procedure THeadMenuMasterForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  //상품작업중에는 링크, 박스등 작업을 못하게 막는다
  MemberGroupBox.Enabled    := not isNew;
  DetailSearchPanel.Enabled := not isChanged;
end;

procedure THeadMenuMasterForm.SetItemCheckListBox;
begin
  if isLoading then Exit;
  if GetHeadOption(57) = '0' then Exit;
  
  try
    DM.OpenQuery('select CD_MENU, '
                +'       NM_MENU '
                +'  from MS_MENU '
                +' where CD_HEAD      = :P0 '
                +'   and CD_STORE     = :P1 '
                +'   and DS_MENU_TYPE = ''I'' '
                +'   and YN_USE       = ''Y'' '
                +' order by CD_MENU ',
                [HeadStoreCode,
                 StandardStore]);

    ItemCheckListBox.Clear;
    BackItemList.Clear;
    while not DM.Query.Eof do
    begin
      ItemCheckListBox.Items.Add;
      ItemCheckListBox.Items[ItemCheckListBox.Count-1].Text := DM.Query.FieldByName('NM_MENU').AsString;

      BackItemList.Add(DM.Query.FieldByName('CD_MENU').AsString);
      DM.Query.Next;
    end;
  finally
    DM.Query.Close;
  end;
end;

procedure THeadMenuMasterForm.SetMultiMode(aMultiMode: Boolean);
var vIndex :Integer;
begin
  inherited;
  //여러상품을 선택했을때는 수정할 수 있는 항목만 Enabled 시킨다
  if aMultiMode then
  begin
    for vIndex := 0 to ComponentCount-1 do
      if (TControl(Components[vIndex]).Parent = TopPanel)
        or (TControl(Components[vIndex]).Parent = StockGroupBox)
        or (TControl(Components[vIndex]).Parent = CenterPanel)
        or (TControl(Components[vIndex]).Parent = StampGroupBox) then
      begin
        if (Components[vIndex] is TcxCustomEdit) then
          TcxCustomEdit(Components[vIndex]).EditModified := False;
        if (Components[vIndex] is TcxSpinEdit) then
          TcxSpinEdit(Components[vIndex]).EditModified := False;
        if (Components[vIndex] is TcxCheckListBox) then
          TcxCheckListBox(Components[vIndex]).Tag := 0;

        if (Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint = '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := False
        else if (Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') then
          TcxCustomEdit(Components[vIndex]).Enabled  := true;
        Application.ProcessMessages;
      end;

    isChanged := False;
    KitchenCheckListBox.Tag           := 0;
    MemoGroupBox.Enabled              := False;
    ItemGroupBox.Enabled              := False;
    MemberGroupBox.Enabled            := True;
    Grid1.Enabled                     := True;
    ButtonToolBarSearchButton.Enabled := False;
    ButtonToolBarNewButton.Enabled    := False;
    ButtonToolBarDeleteButton.Enabled := False;
    ButtonToolBarCancelButton.Enabled := True;
  end
  else
  begin
    GridTableView.Controller.ClearSelection;
    for vIndex := 0 to ComponentCount-1 do
    begin
      if   (TControl(Components[vIndex]).Parent = TopPanel)
        or (TControl(Components[vIndex]).Parent = StockGroupBox)
        or (TControl(Components[vIndex]).Parent = CenterPanel)
        or (TControl(Components[vIndex]).Parent = StampGroupBox)   then
      begin
        if (Components[vIndex] is TcxCustomEdit) then
        begin
          TcxCustomEdit(Components[vIndex]).EditModified := False;
          TcxCustomEdit(Components[vIndex]).Enabled  := True;
        end;
      end;
    end;

    KitchenCheckListBox.Tag           := 0;
    MemoGroupBox.Enabled              := True;
    ItemGroupBox.Enabled              := True;
    MemberGroupBox.Enabled            := True;
    Grid1.Enabled                     := True;
    if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
      DoGridLink;
    isChanged := False;
  end;

end;

procedure THeadMenuMasterForm.SetHistoryGridView;
begin
  try
    OpenQuery('select a.DT_HIST, '
             +'       case a.GUBUN when ''I'' then ''신규'' when ''U'' then ''수정'' when ''D'' then ''삭제'' end as GUBUN, '
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
             +'       case a.DS_TAX when ''0'' then ''면세'' when ''1'' then ''과세(포함)'' when ''2'' then ''과세(별도)'' end as DS_TAX, '
             +'       a.PR_SALE_DOUBLE, '
             +'       a.QTY_UNIT, '
             +'       a.PR_TIP, '
             +'       a.DS_KITCHEN, '
             +'       a.BILL_SEQ, '
             +'       a.NO_MENU, '
             +'       b.NM_TRDPL, '
             +'       case a.DS_STOCK when ''0'' then ''재고관리안함'' when ''1'' then ''재고관리함'' end DS_STOCK, '
             +'       a.NO_GROUP, '
             +'       a.QTY_SELECT, '
             +'       a.SAVE_STAMP, '
             +'       a.USE_STAMP, '
             +'       a.CONFIG, '
             +'       a.YN_USE, '
             +'       ConCat(a.CD_SAWON_CHG,''-'',c.NM_SAWON) as NM_SAWON, '
             +'       a.PRG_CHANGE, '
             +'       a.DT_INSERT '
             +'  from MS_MENU_HIST a left outer join '
             +'       MS_TRD       b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_TRDPL = b.CD_TRDPL left outer join '
             +'       MS_SAWON     c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_SAWON_CHG = c.CD_SAWON '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and a.CD_MENU  = :P2 '
             +' order by a.DT_HIST desc ',
             [HeadStoreCode,
              StandardStore,
              Trim(MenuCodeEdit.Text)]);
    DM.ReadQuery(Query, HistoryGridTableView);
  finally
    Query.Close;
  end;
end;

end.
