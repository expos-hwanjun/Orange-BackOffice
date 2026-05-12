// 재고를 관리하면 세무구분에 부가세 별도는 사용할 수 없음
// 일반메뉴와 저울메뉴만 재고관리를 함
//1:YN_DC, 2:YN_POINT, 3:YN_RCP, 4,CNT_PERSON, 5,YN_BILL, 6:YN_TABLECOLOR, 7:YN_TICKET, 8:YN_SOLDOUT, 9:YN_POINT_LIMIT, 10:Y-포장제외, S:매장제외, 11:렛츠오더 주문서출력, 12:성인상품, 13:키오스크뱃지, 14:메뉴최소주문, 15:TTS전송, 16:공휴일제외, 17:당일판매수량관리

unit CodeMenuMaster;

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
  Data.Bind.Components, Data.Bind.ObjectScope, PNGImage,
  cxTimeEdit, Vcl.Buttons, dxBarBuiltInMenu, cxPC, dxDateRanges, dxScrollbarAnnotations, cxCustomListBox,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers, AdvPageControl,
  AdvScrollBox;

type
  TCodeMenuMasterForm = class(TInheritGridEditForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    PLUDeletePopupMenu: TPopupMenu;
    PluMenuDeleteMenuItem: TMenuItem;
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
    Label5: TLabel;
    ConditionKitchenComboBox: TcxComboBox;
    ConditionCornerLabel: TLabel;
    ConditionCornerComboBox: TcxComboBox;
    ConditionCustomerCheckBox: TAdvOfficeCheckBox;
    BillPrinterCheckBox: TAdvOfficeCheckBox;
    ConditionPointLimitCheckBox: TAdvOfficeCheckBox;
    PictureLoadDialog: TOpenPictureDialog;
    ConditionSoldOutCheckBox: TAdvOfficeCheckBox;
    ColorPopupMenu: TPopupMenu;
    ColorChangeMenuItem: TMenuItem;
    ColorCopyMenuItem: TMenuItem;
    ColorPasteMenuItem: TMenuItem;
    DeleteMenuItem: TMenuItem;
    EmptyMenuItem: TMenuItem;
    Delete2MenuItem: TMenuItem;
    ColorDialog: TColorDialog;
    GridTableViewMenuType: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewMenuClass: TcxGridColumn;
    GridTableViewKitchen: TcxGridColumn;
    GridTableViewSoldOut: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridTableViewLetsOrder: TcxGridColumn;
    ConditionZeroMenuCheckBox: TAdvOfficeCheckBox;
    MenuInfoPanel: TAdvPanel;
    Label14: TLabel;
    ConditionBadgeComboBox: TcxComboBox;
    GridTableViewEnglish: TcxGridColumn;
    GridTableViewChina: TcxGridColumn;
    GridTableViewJapan: TcxGridColumn;
    GridTableViewVietnam: TcxGridColumn;
    GridTableViewThai: TcxGridColumn;
    GridTableViewIndo: TcxGridColumn;
    GridTableViewFrench: TcxGridColumn;
    GridTableViewGerman: TcxGridColumn;
    Label30: TLabel;
    Label31: TLabel;
    MenuPager: TcxPageControl;
    MainPager: TcxTabSheet;
    PluPager: TcxTabSheet;
    ClassPanel: TAdvGroupBox;
    MenuPanel: TAdvGroupBox;
    LogPager: TcxTabSheet;
    cxGrid1: TcxGrid;
    HistoryGridTableView: TcxGridTableView;
    HistoryGridTableViewHistoryDate: TcxGridColumn;
    HistoryGridTableViewWorkType: TcxGridColumn;
    HistoryGridTableViewMenusName: TcxGridColumn;
    HistoryGridTableViewSalePrice: TcxGridColumn;
    HistoryGridTableViewAfterSalePrice: TcxGridColumn;
    HistoryGridTableViewProfitRate: TcxGridColumn;
    HistoryGridTableViewMakerCode: TcxGridColumn;
    HistoryGridTableViewMenuShortName: TcxGridColumn;
    HistoryGridTableViewBuyPrice: TcxGridColumn;
    HistoryGridTableViewAfterBuyPrice: TcxGridColumn;
    HistoryGridTableViewClassCode: TcxGridColumn;
    HistoryGridTableViewType: TcxGridColumn;
    HistoryGridTableViewTaxYN: TcxGridColumn;
    HistoryGridTableViewStockType: TcxGridColumn;
    HistoryGridTableViewUnitQty: TcxGridColumn;
    HistoryGridTableViewCompanyCode: TcxGridColumn;
    HistoryGridTableViewDoublePrice: TcxGridColumn;
    HistoryGridTableViewTipPrice: TcxGridColumn;
    HistoryGridTableViewMenuCount: TcxGridColumn;
    HistoryGridTableViewMenuNo: TcxGridColumn;
    HistoryGridTableViewDisplaySeq: TcxGridColumn;
    HistoryGridTableViewGroupNo: TcxGridColumn;
    HistoryGridTableViewDsKitchen: TcxGridColumn;
    HistoryGridTableViewStampSave: TcxGridColumn;
    HistoryGridTableViewStampUse: TcxGridColumn;
    HistoryGridTableViewConfig: TcxGridColumn;
    HistoryGridTableViewPricePacking: TcxGridColumn;
    HistoryGridTableViewPriceMon: TcxGridColumn;
    HistoryGridTableViewPriceTue: TcxGridColumn;
    HistoryGridTableViewPriceWed: TcxGridColumn;
    HistoryGridTableViewPriceThu: TcxGridColumn;
    HistoryGridTableViewPriceFri: TcxGridColumn;
    HistoryGridTableViewPriceSat: TcxGridColumn;
    HistoryGridTableViewPriceSun: TcxGridColumn;
    HistoryGridTableViewPriceHoliday: TcxGridColumn;
    HistoryGridTableViewUseYN: TcxGridColumn;
    HistoryGridTableViewUserName: TcxGridColumn;
    HistoryGridTableViewInsertDate: TcxGridColumn;
    HistoryGridTableViewPrgChange: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    LanguagePage: TcxTabSheet;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EnglishEdit: TcxTextEdit;
    ChianensEdit: TcxTextEdit;
    JapanseEdit: TcxTextEdit;
    VietnamensEdit: TcxTextEdit;
    KoreanEdit: TcxTextEdit;
    ThaiEdit: TcxTextEdit;
    IndoEdit: TcxTextEdit;
    FrenchEdit: TcxTextEdit;
    GermanEdit: TcxTextEdit;
    AdvScrollBox1: TAdvScrollBox;
    RightPanel: TPanel;
    MemberPanel: TPanel;
    MemberGroupBox: TAdvGroupBox;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1DcRate: TcxGridColumn;
    GridTableView1PointRate: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    ItemPanel: TPanel;
    ItemGroupBox: TAdvGroupBox;
    ItemCheckListBox: TcxCheckListBox;
    StampPanel: TPanel;
    StampGroupBox: TAdvGroupBox;
    Label11: TLabel;
    StampUseLabel: TLabel;
    StampSaveEdit: TcxSpinEdit;
    StampUseEdit: TcxSpinEdit;
    WeekPricePanel: TPanel;
    WeekPriceGroupBox: TAdvGroupBox;
    Label19: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label12: TLabel;
    Label36: TLabel;
    PriceMonEdit: TcxCurrencyEdit;
    PriceTueEdit: TcxCurrencyEdit;
    PriceWedEdit: TcxCurrencyEdit;
    PriceThuEdit: TcxCurrencyEdit;
    PriceFriEdit: TcxCurrencyEdit;
    PriceSatEdit: TcxCurrencyEdit;
    PriceSunEdit: TcxCurrencyEdit;
    PriceHolidayEdit: TcxCurrencyEdit;
    OrderTimePanel: TPanel;
    AdvGroupBox4: TAdvGroupBox;
    Label35: TLabel;
    OrderTimeFromEdit: TcxTimeEdit;
    OrderTimeToEdit: TcxTimeEdit;
    OrderAllTimeCheckBox: TcxCheckBox;
    Option16CheckBox: TcxCheckBox;
    Panel2: TPanel;
    CornerPanel: TPanel;
    Label7: TLabel;
    CornerComboBox: TcxComboBox;
    KitchenPanel: TPanel;
    KitchenGroupBox: TAdvGroupBox;
    KitchenCheckListBox: TcxCheckListBox;
    KitchenComboBox: TcxComboBox;
    MemoGroupBox: TAdvGroupBox;
    MemoCheckListBox: TcxCheckListBox;
    TopPanel: TPanel;
    MenuCodeLabel: TLabel;
    MenuNameLabel: TLabel;
    MenuShortNameLabel: TLabel;
    MenuClassLabel: TLabel;
    Label8: TLabel;
    MenuNameEdit: TcxTextEdit;
    MenuShortNameEdit: TcxTextEdit;
    MenuCodeEdit: TcxTextEdit;
    MenuClassCodeEdit: TcxButtonEdit;
    MenuClassNameEdit: TcxTextEdit;
    InputRemainCheckBox: TcxCheckBox;
    HeadMenuStatus: TcxLabel;
    KeyInButton: TAdvGlowButton;
    KitchenMenuNameEdit: TcxTextEdit;
    MenuInfoButton: TAdvGlowButton;
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
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label37: TLabel;
    BageLabel: TLabel;
    PriceSaleEdit: TcxCurrencyEdit;
    MenuTypeComboBox: TcxComboBox;
    TaxComboBox: TcxComboBox;
    PriceProfitRateEdit: TcxCurrencyEdit;
    MenuNoEdit: TcxTextEdit;
    PriceTipEdit: TcxCurrencyEdit;
    PriceDoubleEdit: TcxCurrencyEdit;
    DisplaySeqEdit: TcxSpinEdit;
    GroupNoEdit: TcxSpinEdit;
    Option1CheckBox: TcxCheckBox;
    Option2CheckBox: TcxCheckBox;
    UseCheckBox: TcxCheckBox;
    Option3CheckBox: TcxCheckBox;
    MenuCountEdit: TcxSpinEdit;
    PriceBuyEdit: TcxCurrencyEdit;
    Option5CheckBox: TcxCheckBox;
    Option9CheckBox: TcxCheckBox;
    Option6CheckBox: TcxCheckBox;
    Option7CheckBox: TcxCheckBox;
    Option8CheckBox: TcxCheckBox;
    PricePackingEdit: TcxCurrencyEdit;
    Option4Edit: TcxSpinEdit;
    Option11CheckBox: TcxCheckBox;
    Option12CheckBox: TcxCheckBox;
    Option14Edit: TcxSpinEdit;
    Option17CheckBox: TcxCheckBox;
    Option10ComboBox: TcxComboBox;
    Option13ComboBox: TcxComboBox;
    BottomPanel: TPanel;
    StockGroupBox: TAdvGroupBox;
    StockTypeLabel: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    StockTypeComboBox: TcxComboBox;
    UnitQtyEdit: TcxCurrencyEdit;
    MenuClassTreeView: TcxTreeView;
    Option18CheckBox: TcxCheckBox;
    MenuInfoMemo: TcxMemo;
    MenuInfoOKButton: TAdvGlowButton;
    MenuInfoCloseButton: TAdvGlowButton;
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
    procedure PLUDeletePopupMenuPopup(Sender: TObject);
    procedure PluMenuDeleteMenuItemClick(Sender: TObject);
    procedure KeyInButtonClick(Sender: TObject);
    procedure MenuNameEditExit(Sender: TObject);
    procedure ConditionGoodsClassCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableView1DcRatePropertiesEditValueChanged(Sender: TObject);
    procedure GridTableView1PointRatePropertiesEditValueChanged(
      Sender: TObject);
    procedure InputRemainCheckBoxPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupNoEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ItemCheckListBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ItemCheckListBoxClickCheck(Sender: TObject; AIndex: Integer;
      APrevState, ANewState: TcxCheckBoxState);
    procedure ColorChangeMenuItemClick(Sender: TObject);
    procedure ColorCopyMenuItemClick(Sender: TObject);
    procedure ColorPasteMenuItemClick(Sender: TObject);
    procedure DeleteMenuItemClick(Sender: TObject);
    procedure EmptyMenuItemClick(Sender: TObject);
    procedure Delete2MenuItemClick(Sender: TObject);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure MenuInfoButtonClick(Sender: TObject);
    procedure MenuInfoOKButtonClick(Sender: TObject);
    procedure MenuInfoCloseButtonClick(Sender: TObject);
    procedure PluPagerShow(Sender: TObject);
    procedure LogPagerShow(Sender: TObject);
  private
    ////////////////  PLU 관련 //////////////
    ClassButton :TPosButton;
    MenuButton  :TPosButton;

    ClassPage,
    MenuPage    :Integer;

    ClassCode   :String;
    isPLUSave   :Boolean;

    BackKitchenList :TStringList;
    BackMemoList    :TStringList;
    BackItemList    :TStringList;

    ClassDefaultColor,                       //기본설정값
    ClassBorderColor,
    ClassDefaultDownColor,
    MenuDefaultColor,
    MenuBorderColor :TColor;
    ClassDefaultFont,
    MenuDefaultFont : TFont;
    ClassDefaultDownFontColor :TColor;
    ColorClipboard : TColor;

    PluClassX,
    PluClassY      : Integer;
    PluClassButton :Array of TPosButton;

    PluMenuX,
    PluMenuY      :Integer;
    PluMenuButton :Array of TPosButton;

    KioskConfig       :Array[1..17] of Integer;

    procedure  PluClassButtonCreate;
    procedure  PluClassButtonClick(Sender: TObject);
    procedure  PluClassPrevButtonClick(Sender :TObject);

    procedure  PluMenuButtonCreate;
    procedure  PluMenuButtonClick(Sender: TObject);
    procedure  PluMenuPrevButtonClick(Sender :TObject);
    procedure  PluMenuButtonClear;
    procedure  ShowPosMode;

    procedure SetClassButton;
    procedure SetMenuButton;
    function  DoPLUSave:Boolean;
    procedure SaveColor;

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
  CodeMenuMasterForm: TCodeMenuMasterForm;

implementation
uses Common, DBModule, Help, CodeClassHelp, Main;
{$R *.dfm}

{ TCodeMenuForm }

procedure TCodeMenuMasterForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ClassDefaultFont.Free;
  MenuDefaultFont.Free;
end;

procedure TCodeMenuMasterForm.FormCreate(Sender: TObject);
begin
  inherited;
  ClassDefaultFont := TFont.Create;
  MenuDefaultFont  := TFont.Create;
end;

procedure TCodeMenuMasterForm.FormShow(Sender: TObject);
var
  vCode: PStrPointer;
  vItemMenuCount :Integer;
begin
  if GetOption(194) = '0' then
  begin
    HistoryGridTableViewPriceMon.Visible := false;
    HistoryGridTableViewPriceTue.Visible := false;
    HistoryGridTableViewPriceWed.Visible := false;
    HistoryGridTableViewPriceThu.Visible := false;
    HistoryGridTableViewPriceFri.Visible := false;
    HistoryGridTableViewPriceSat.Visible := false;
    HistoryGridTableViewPriceSun.Visible := false;
    HistoryGridTableViewPriceHoliday.Visible := false;
    HistoryGridTableViewPriceMon.Tag     := 99;
    HistoryGridTableViewPriceTue.Tag     := 99;
    HistoryGridTableViewPriceWed.Tag     := 99;
    HistoryGridTableViewPriceThu.Tag     := 99;
    HistoryGridTableViewPriceFri.Tag     := 99;
    HistoryGridTableViewPriceSat.Tag     := 99;
    HistoryGridTableViewPriceSun.Tag     := 99;
    HistoryGridTableViewPriceHoliday.Tag     := 99;
  end;
  inherited;
  //표준 PLU 사용시 PLU 셋팅을 못하게 한다
  PluPager.TabVisible := (GetStoreOption(2) = '0') and (Tag = 0);

  MenuPager.ActivePageIndex := 0;
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

  New(vCode);
  vCode^.Data := 'N';
  Option10ComboBox.Properties.Items.AddObject('없음', TObject(vCode));
  New(vCode);
  vCode^.Data := 'Y';
  Option10ComboBox.Properties.Items.AddObject('포장', TObject(vCode));
  New(vCode);
  vCode^.Data := 'S';
  Option10ComboBox.Properties.Items.AddObject('매장', TObject(vCode));
  New(vCode);
  vCode^.Data := 'T';
  Option10ComboBox.Properties.Items.AddObject('외상', TObject(vCode));

  vItemMenuCount := 0;
  if GetOption(57) = '0' then
    try
      OpenQuery('select Count(*) '
               +'  from MS_MENU '
               +' where CD_HEAD      = :P0 '
               +'   and CD_STORE     = :P1 '
               +'   and DS_MENU_TYPE = ''I'' ',
               [HeadStoreCode,
                StoreCode]);
      vItemMenuCount := Query.Fields[0].AsInteger;
    finally
      Query.Close;
    end;

  if (GetOption(57) = '1') or (vItemMenuCount > 0) then
  begin
    New(vCode);
    vCode^.Data := 'I';
    MenuTypeComboBox.Properties.Items.AddObject('아이템', TObject(vCode));
  end;


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
  Option13ComboBox.Properties.Items.AddObject('HOT', TObject(vCode));
  New(vCode);
  vCode^.Data := 'N';
  Option13ComboBox.Properties.Items.AddObject('신메뉴', TObject(vCode));
  New(vCode);
  vCode^.Data := 'T';
  Option13ComboBox.Properties.Items.AddObject('HIT', TObject(vCode));
  New(vCode);
  vCode^.Data := 'S';
  Option13ComboBox.Properties.Items.AddObject('대표', TObject(vCode));

  ConditionBadgeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionBadgeComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and Substring(a.CONFIG,13,1) = ''R'' ';
  ConditionBadgeComboBox.Properties.Items.AddObject('추천', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and Substring(a.CONFIG,13,1) = ''H'' ';
  ConditionBadgeComboBox.Properties.Items.AddObject('Hot', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and Substring(a.CONFIG,13,1) = ''N'' ';
  ConditionBadgeComboBox.Properties.Items.AddObject('신메뉴', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and Substring(a.CONFIG,13,1) = ''T'' ';
  ConditionBadgeComboBox.Properties.Items.AddObject('HIT', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and Substring(a.CONFIG,13,1) = ''S'' ';
  ConditionBadgeComboBox.Properties.Items.AddObject('대표', TObject(vCode));
  ConditionBadgeComboBox.ItemIndex := 0;

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
  PriceTipEdit.Enabled    := (GetOption(20) = '1') or (GetOption(289) = '1');

  //메뉴번호
  MenuNoEdit.Enabled      := GetOption(247) = '1';

  //표시순번
  DisplaySeqEdit.Enabled  := GetOption(164) = '1';

  //메뉴그룹
  GroupNoEdit.Enabled     := GetOption(79) = '1';

  WeekPricePanel.Visible := GetOption(194) = '1';

  //고객수 추정메뉴(렛츠오더에서 고객수와 주문메뉴 체크해야되서..)
//  Option4Edit.Enabled  := GetOption(307) = '1';
//  ConditionCustomerCheckBox.Enabled  := GetOption(307) = '1';

  //재고기능
  StockGroupBox.Visible     :=  GetOption(19) = '1';

  //층별주방
  KitchenComboBox.Visible := GetOption(26) = '1';
  if GetOption(26) = '0' then
    KitchenPanel.Height := 137;

  //회원등급별 할인/포인트
  MemberPanel.Visible          := (GetOption(251) = '1') or (GetOption(258) = '1');
  GridTableView1DcRate.Visible    := GetOption(251) = '1';
  GridTableView1PointRate.Visible := GetOption(258) = '1';

  //아이템
  ItemPanel.Visible := GetOption(57) = '1';

  //스템프
  StampPanel.Visible := GetOption(21) = '1';

  //스템프를 금액으로 할인 시 에는 사용가능 메뉴로 사용한다
  if GetOption(406)='1' then
  begin
    StampUseEdit.Properties.AssignedValues.MaxValue := true;
    StampUseEdit.Properties.MaxValue := 1;
  end;

  //표준메뉴사용 시 매장메뉴 사용 못할 시
  if (GetStoreOption(1)='2') then
  begin
    ButtonToolBarNewButton.Visible    := false;
    ButtonToolBarDeleteButton.Visible := false;
  end;

  //렛츠오더 사용, 렛츠오더 출력체크한 메뉴만 고객주문서 출력한닥 했을때
  if (GetStoreOption(9) = '0') or ((GetOption(181) <> '2') and (GetOption(182) <> '2'))then
  begin
    Option11CheckBox  .Visible := false;
    CenterPanel.Height         := 255;
  end;

  Option12CheckBox.Visible := (GetStoreOption(9) = '1') and (Tag = 0);
  BageLabel.Visible        := ((GetStoreOption(9) = '1') and (Tag = 0)) or (GetOption(403) = '1');
  Option13ComboBox.Visible := ((GetStoreOption(9) = '1') and (Tag = 0)) or (GetOption(403) = '1');


  //재고관리
  BottomPanel.Visible := GetOption(19) = '1';

  //상세검색에 주방
  ConditionKitchenComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionKitchenComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and a.CD_PRINTER = '''' ';
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
              StoreCode]);
    KitchenCheckListBox.Items.Clear;
    BackKitchenList := TStringList.Create;
    BackKitchenList.Clear;
    while not Query.Eof do
    begin
      KitchenCheckListBox.Items.Add;
      KitchenCheckListBox.Items[KitchenCheckListBox.Items.Count-1].Text        := Query.Fields[1].AsString;
      New(vCode);
      vCode^.Data := Format('and a.CD_PRINTER like  ''%%%s%%'' ' ,[Query.Fields[0].AsString]);
      ConditionKitchenComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));

      BackKitchenList.Add(Query.Fields[0].AsString);
      Query.Next;
    end;
    ConditionKitchenComboBox.ItemIndex := 0;
  finally
    Query.Close;
  end;

  //주방메모
  if (GetOption(156) = '1') or (GetOption(156) = '2') then
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
                StoreCode]);
      MemoCheckListBox.Items.Clear;
      BackMemoList := TStringList.Create;
      BackMemoList.Clear;
      while not Query.Eof do
      begin
        MemoCheckListBox.Items.Add;
        MemoCheckListBox.Items[MemoCheckListBox.Items.Count-1].Text := Query.Fields[1].AsString;
        BackMemoList.Add(Query.Fields[0].AsString);
        Query.Next;
      end;
    finally
      Query.Close;
    end;

  MemoGroupBox.Visible := (GetOption(156) = '1') or (GetOption(156) = '2');

  BackItemList := TStringList.Create;
  SetItemCheckListBox;

  //코너세팅
  if (GetOption(231) = '1') or (GetOption(60) = '1') then
  begin
    try
      OpenQuery('select CD_TRDPL, '
               +'       NM_TRDPL '
               +'  from MS_TRD '
               +' where CD_HEAD   =:P0 '
               +'   and CD_STORE  =:P1 '
               +'   and DS_TRDPL  =''C'' '
               +'   and DS_STATUS = 0 '
               +' order by CD_TRDPL ',
               [HeadStoreCode,
                StoreCode]);

      ConditionCornerComboBox.Clear;
      New(vCode);
      vCode^.Data := '';
      ConditionCornerComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
      New(vCode);
      vCode^.Data := '';
      ConditionCornerComboBox.Properties.Items.AddObject('[미지정]', TObject(vCode));

      CornerComboBox.Clear;
      New(vCode);
      vCode^.Data := '';
      CornerComboBox.Properties.Items.AddObject('없음', TObject(vCode));

      while not Query.Eof do
      begin
        New(vCode);
        vCode^.Data := Query.Fields[0].AsString;
        CornerComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        ConditionCornerComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        Query.Next;
      end;
      ConditionCornerComboBox.ItemIndex := 0;
    finally
      Query.Close;
    end;
    ConditionCornerLabel.Visible    := true;
    ConditionCornerComboBox.Visible := true;
  end;


  //PLU 디자인 설정(표준PLU 사용안할때)
  if GetStoreOption(3) = '0' then
  begin
    try
      OpenQuery('select CD_CODE, '
               +'       NM_CODE1, '
               +'       NM_CODE2, '
               +'       NM_CODE3, '
               +'       NM_CODE4, '
               +'       NM_CODE5, '
               +'       NM_CODE6, '
               +'       NM_CODE7, '
               +'       NM_CODE8, '
               +'       NM_CODE9, '
               +'       NM_CODE11, '
               +'       NM_CODE12, '
               +'       NM_CODE13 '
               +'  from MS_CODE '
               +' where CD_HEAD  = :P0 '
               +'   and CD_STORE = :P1 '
               +'   and CD_KIND  = ''87'' '
               +'   and CD_CODE  in (''001'',''002'') '
               +' order by CD_CODE ',
               [HeadStoreCode,
                StoreCode]);
      while not Query.Eof do
      begin
        if Query.FieldByName('CD_CODE').AsString = '001' then
        begin
          PluClassX              := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          PluClassY              := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,2);

          ClassDefaultColor      := StringToColor(Query.FieldByName('NM_CODE3').AsString);
          ClassDefaultFont.Name  := Query.FieldByName('NM_CODE5').AsString;
          ClassDefaultFont.Color := StringToColor(Query.FieldByName('NM_CODE8').AsString);
          ClassDefaultFont.Size  := StrToIntDef(Query.FieldByName('NM_CODE6').AsString,10);
          ClassBorderColor       := StringToColor(Query.FieldByName('NM_CODE13').AsString);
          if Query.FieldByName('NM_CODE7').AsString  = '1' then
            ClassDefaultFont.Style := [fsBold];

          ClassDefaultDownColor     := StringToColor(Query.FieldByName('NM_CODE4').AsString);
          ClassDefaultDownFontColor := StringToColor(Query.FieldByName('NM_CODE9').AsString);
          ClassPanel.Height         := StrToIntDef(Query.FieldByName('NM_CODE11').AsString,100);
          ClassPanel.Width          := StrToIntDef(Query.FieldByName('NM_CODE12').AsString,517);
          MenuPanel.Width           := StrToIntDef(Query.FieldByName('NM_CODE12').AsString,517);
          MenuPanel.Top             := ClassPanel.Top + ClassPanel.Height + 30;
        end
        else if Query.FieldByName('CD_CODE').AsString = '002' then
        begin
          PluMenuX              := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          PluMenuY              := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,5);
          MenuDefaultColor      := StringToColor(Query.FieldByName('NM_CODE3').AsString);
          MenuDefaultFont.Name  := Query.FieldByName('NM_CODE4').AsString;
          MenuDefaultFont.Color := StringToColor(Query.FieldByName('NM_CODE7').AsString);
          MenuDefaultFont.Size  := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,10);
          MenuBorderColor       := StringToColor(Query.FieldByName('NM_CODE13').AsString);
          if Query.FieldByName('NM_CODE6').AsString  = '1' then
            ClassDefaultFont.Style := [fsBold];
        end;
        Query.Next;
      end;
    finally
      Query.Close;
    end;

    PluClassButtonCreate;
    PluMenuButtonCreate;
  end
  else
  begin
    PluPager.TabVisible := false;
  end;



  CornerPanel.Visible  := (GetOption(231) = '1') or (GetOption(60) = '1') ;
  // 재고관리구분
  New(vCode);
  vCode^.Data := '0';
  StockTypeComboBox.Properties.Items.AddObject('관리안함', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  StockTypeComboBox.Properties.Items.AddObject('관리함', TObject(vCode));

  ClassPage := 1;
  MenuPage  := 1;
  isPLUSave := true;
  isChanged := false;
end;


function TCodeMenuMasterForm.DoSearch: Boolean;
var
  vWhere :Array[0..16] of String;
  vWhereStr :String;
  vList  : TStringList;
  vIndex : Integer;
begin
  DetailSearchPanel.Collaps := true;
  Result := false;

  for vIndex := 0 to High(vWhere) do
    vWhere[vIndex] := '';

  case Conditon1RadioGroup.ItemIndex of
     1: vWhere[0] := ' and a.YN_USE = ''Y'' ';
     2: vWhere[0] := ' and a.YN_USE = ''N'' ';
     else vWhere[0] := '';
  end;

  case Conditon2RadioGroup.ItemIndex of
     1: vWhere[2] := ' and a.DS_MENU_TYPE = ''N'' ';
     2: vWhere[2] := ' and a.DS_MENU_TYPE = ''G'' ';
     3: vWhere[2] := ' and a.DS_MENU_TYPE = ''S'' ';
     4: vWhere[2] := ' and a.DS_MENU_TYPE = ''C'' ';
     5: vWhere[2] := ' and a.DS_MENU_TYPE = ''O'' ';
     6: vWhere[2] := ' and a.DS_MENU_TYPE = ''W'' ';
     7: vWhere[2] := ' and a.DS_MENU_TYPE = ''I'' ';
     8: vWhere[2] := ' and a.DS_MENU_TYPE = ''P'' ';
     else vWhere[2] := '';
  end;

  case Conditon3RadioGroup.ItemIndex of
     1: vWhere[3] := ' and Substring(CONFIG,1,1) = ''Y'' ';
     2: vWhere[3] := ' and Substring(a.CONFIG,1,1) = ''N'' ';
     3: vWhere[3] := ' and Substring(a.CONFIG,2,1) = ''Y'' ';
     4: vWhere[3] := ' and Substring(a.CONFIG,2,1) = ''N'' ';
     else vWhere[3] := '';
  end;

  case Conditon4RadioGroup.ItemIndex of
     1: vWhere[4] := ' and a.DS_TAX = ''1'' ';
     2: vWhere[4] := ' and a.DS_TAX = ''0'' ';
     3: vWhere[4] := ' and a.DS_TAX = ''2'' ';
     else vWhere[4] := '';
  end;

  case Conditon5RadioGroup.ItemIndex of
     1: vWhere[5] := ' and a.DS_STOCK = ''0'' ';
     2: vWhere[5] := ' and a.DS_STOCK = ''1'' ';
  end;

  if ConditionNotClassCheckBox.Checked then
    vWhere[6] := ' and Ifnull(a.CD_CLASS, '''') = '''' ';

  if ConditionGoodsClassCodeEdit.Text <> '' then
  begin
    if Pos(',',ConditionGoodsClassCodeEdit.Text) > 0 then
    begin
      vList := TStringList.Create;
      try
        Split(ConditionGoodsClassCodeEdit.Text, ',', vList);

        for vIndex := 0 to vList.Count-1 do
          vWhere[7] := vWhere[7] + 'a.CD_CLASS like ConCat('+vList.Strings[vIndex] +',''%'') '+ Ifthen(vIndex < vList.Count-1, ' or ', '');

        vWhere[7] := ' and ('+vWhere[7]+')';
      finally
        vList.Free
      end;
    end
    else
    begin
      if (Pos('''',ConditionGoodsClassCodeEdit.Text) = 0) and (ConditionGoodsClassNameEdit.Text <> EmptyStr) then
        vWhere[7] := ' and a.CD_CLASS = '''+ConditionGoodsClassCodeEdit.Text+''' '
      else
      begin
        if (Pos('''',ConditionGoodsClassCodeEdit.Text) = 0) then
          vWhere[7] := ' and a.CD_CLASS like ConCat('''+ConditionGoodsClassCodeEdit.Text+''',''%'') '
        else
          vWhere[7] := ' and a.CD_CLASS like ConCat('+ConditionGoodsClassCodeEdit.Text+',''%'') ';
      end;
    end;
  end;

   //1:YN_DC, 2:YN_POINT, 3:YN_RCP, 4,YN_PERSON, 5,YN_BILL, 6:YN_TABLECOLOR, 7:YN_TICKET, 8:YN_SOLDOUT, 9:YN_POINT_LIMIT
  if ConditionSoldOutCheckBox.Checked then
    vWhere[8] := ' and Substring(a.CONFIG,8,1) =''Y'' ';

  if (ConditionFromDateEdit.CurrentDate > 0) and (ConditionToDateEdit.CurrentDate > 0) then
    vWhere[9] := ' and Date_Format(a.DT_CHANGE, ''%Y%m%d'') between '''+DToS(ConditionFromDateEdit.CurrentDate)+''' and '''+DToS(ConditionToDateEdit.CurrentDate)+''' ';

  vWhere[10] := GetStrPointerData(ConditionKitchenComboBox);

  if ConditionCornerComboBox.ItemIndex = 1 then
    vWhere[11] := 'and Ifnull(a.CD_CORNER,'''') = '''' '
  else if ConditionCornerComboBox.ItemIndex > 1 then
    vWhere[11] := Format('and a.CD_CORNER = ''%s'' ',[GetStrPointerData(ConditionCornerComboBox)]);

  if ConditionCustomerCheckBox.Checked then
    vWhere[12] := ' and Substring(a.CONFIG,4,1) =''Y'' ';

  if BillPrinterCheckBox.Checked then
    vWhere[13] := ' and Substring(a.CONFIG,5,1) =''Y'' ';

  if ConditionPointLimitCheckBox.Checked then
    vWhere[14] := ' and Substring(a.CONFIG,9,1) = ''Y'' ';

  if ConditionZeroMenuCheckBox.Checked then
    vWhere[15] := ' and a.PR_SALE = 0 ';

  vWhere[16] := GetStrPointerData(ConditionBadgeComboBox);

  for vIndex := 0 to High(vWhere) do
    vWhereStr := vWhereStr + vWhere[vIndex];

  OpenQueryEx('select a.CD_MENU, '
           +'       a.NM_MENU, '
           +'       case a.DS_MENU_TYPE when ''N'' then ''일반'' when ''S'' then ''세트'' when ''C'' then ''코스'' when ''I'' then ''아이템'' '
           +'                           when ''G'' then ''싯가'' when ''P'' then ''그룹'' when ''O'' then ''오픈세트'' when ''W'' then ''저울'' end as DS_MENU, '
           +'       a.PR_SALE, '
           +'       a.CD_PRINTER, '
           +'       b.NM_CLASS, '
           +'       case a.DS_TAX when ''0'' then ''면세'' when ''1'' then ''과세'' when ''2'' then ''과세(별도)'' end as DS_TAX, '
           +'       SubString(a.CONFIG, 8, 1) as YN_SOLDOUT, '
           +'       Ifnull(c.YN_LETSORDER,''N'') as YN_LETSORDER, '
           +'       a.YN_USE, '
           +'       d.ENGLISH, '
           +'       d.CHINESE_SIMPLE, '
           +'       d.JAPANESE, '
           +'       d.VIETNAMESE, '
           +'       d.THAI, '
           +'       d.INDONESIAN, '
           +'       d.FRENCH, '
           +'       d.GERMAN '
           +'  from MS_MENU as a left outer join '
           +'       MS_MENU_CLASS as b on b.CD_HEAD  = a.CD_HEAD '
           +'                         and b.CD_STORE = a.CD_STORE '
           +'                         and b.CD_CLASS = Left(a.CD_CLASS,2) left outer join '
           +'      (select CD_MENU, ''Y'' as YN_LETSORDER '
           +'         from MS_SMALL '
           +'        where CD_HEAD  =:P0 '
           +'          and CD_STORE =:P1 '
           +'          and CD_LARGE in (''99'',''98'') '
           +'        group by CD_MENU) as c on c.CD_MENU  = a.CD_MENU left outer join '
           +'       MS_LANGUAGES as d on d.CD_HEAD  = a.CD_HEAD '
           +'                        and d.CD_STORE = :P3 '
           +'                        and d.KOREAN   = a.NM_MENU_SHORT '
           +' where a.CD_HEAD  = :P0 '
           +'   and a.CD_STORE = :P1 '
           +'   and (a.CD_MENU = :P2 or a.NM_MENU like ConCat(''%'',:P2,''%'')) '
           +vWhereStr
           +' order by a.CD_MENU '
           +Format('limit %d ',[AllowMenuCount]),
           [HeadStoreCode,
            StoreCode,
            ConditionToolBarEdit.Text,
            Ifthen((GetHeadOption(1)='1'), StandardStore, StoreCode)],GridTableView);

  Result := GridTableView.DataController.RecordCount > 0;
  SetItemCheckListBox;
end;

procedure TCodeMenuMasterForm.EditPropertiesChange(Sender: TObject);
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
          ((GetOnlyNumber(MenuClassCodeEdit.Text) <> MenuClassCodeEdit.Text) or (Length(MenuClassCodeEdit.Text) <> (StoI(GetOption(248))+1)*2)) then
    MenuClassNameEdit.Clear
  //재고구분
  else if Sender = MenuTypeComboBox then
  begin
    vTemp := GetStrPointerData(MenuTypeComboBox);
    if vTemp = '' then
      vTemp := 'N';
    if vTemp ='N' then
      SetItemCheckListBox;
    //오픈세트일때 메뉴갯수를 입력받는다
    MenuCountEdit.Enabled := (vTemp ='O') or (vTemp ='I') or (vTemp= 'N') or (vTemp= 'P');

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
    else PriceTipEdit.Enabled := (GetOption(160) = '1') or (GetOption(289) = '1');

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
    ItemGroupBox.Enabled := (vTemp[1] in ['N','G','W']) and (GetOption(57) = '1');
  end
  //판매단가
  else if Sender = PriceSaleEdit then
  begin
    //판매금액 0보다 크면 영수증은 무조건 출력한다
    if (PriceSaleEdit.Value > 0) or (GetStrPointerData(MenuTypeComboBox) <> 'N') then
    begin
      Option3CheckBox.Checked := true;
      Option3CheckBox.Enabled := false;
    end
    else Option3CheckBox.Enabled := true;
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
          ((GetOnlyNumber(ConditionGoodsClassCodeEdit.Text) <> ConditionGoodsClassCodeEdit.Text) or (Length(ConditionGoodsClassCodeEdit.Text) <> (StoI(GetOption(248))+1)*2)) then
  begin
    ConditionGoodsClassNameEdit.Clear;
    isChanged := false;
  end
  else if (Sender = ConditionGoodsClassCodeEdit) then
  begin
    isChanged := false;
  end
  else if Sender = Option10ComboBox then
    PricePackingEdit.Enabled := GetStrPointerData(Option10ComboBox) <> 'Y'
  else if Sender = OrderAllTimeCheckBox then
  begin
    if OrderAllTimeCheckBox.Checked then
    begin
      OrderTimeFromEdit.EditValue := 0.0;
      OrderTimeToEdit.EditValue   := 0.0;
      OrderTimeFromEdit.Enabled   := false;
      OrderTimeToEdit.Enabled     := false;
    end
    else
    begin
      OrderTimeFromEdit.Enabled   := true;
      OrderTimeToEdit.Enabled     := true;
    end;
  end;


end;

procedure TCodeMenuMasterForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  // 상품분류
  if Sender = MenuClassCodeEdit then
  begin
    // 상품분류코드에 문자를 입력했으면 해당 분류를 찾아와 표시한다
    if (DisplayValue <> EmptyStr) and (MenuClassNameEdit.Text = EmptyStr) and
       ((GetOnlyNumber(DisplayValue) <> DisplayValue) or (Length(DisplayValue) <> (StoI(GetOption(248))+1)*2)) then
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
                 StoreCode,
                 (StoI(GetOption(248))+1)*2,
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
       ((GetOnlyNumber(DisplayValue) <> DisplayValue) or (Length(DisplayValue) <> (StoI(GetOption(248))+1)*2)) then
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
        Query.Close;
      end;
    end
    else
      GetMenuClassName(ConditionGoodsClassCodeEdit);
    Exit;
  end
  else if Sender = PriceSaleEdit then
  begin
    if DisplayValue = '' then
      DisplayValue := 0;
    // 이익률을 새로 구한다
    PriceProfitRateEdit.Value  := CalcSaleProfitRate(PriceBuyEdit.Value, Currency(DisplayValue));
  end
  // 매입단가
  else if Sender = PriceBuyEdit then
  begin
    if DisplayValue = '' then
      DisplayValue := 0;
    // 이익률을 새로 구한다
    PriceProfitRateEdit.Value  := CalcSaleProfitRate(Currency(DisplayValue), PriceSaleEdit.Value);
  end
  // 이익률
  else if Sender = PriceProfitRateEdit then
  begin
    if DisplayValue = '' then
      DisplayValue := 0;

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
  end
  else if (Sender = PriceDoubleEdit) or (Sender = PricePackingEdit)  or (Sender = PriceTipEdit) then
  begin
    if DisplayValue = '' then
      DisplayValue := 0;
  end;
  isChanged := true;
end;

procedure TCodeMenuMasterForm.EmptyMenuItemClick(Sender: TObject);
var vPosition :Integer;
begin
  inherited;
  begin
    vPosition := (MenuPage-1) * ((PluMenuX * PluMenuY)-1) + TPosButton(ColorPopupMenu.PopupComponent).Tag + 1;

    try
      ExecQuery('update MS_SMALL '
               +'   set NO_POSITION = NO_POSITION + 1 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_GUBUN =:P2 '
               +'   and CD_LARGE =:P3 '
               +'   and NO_POSITION >= :P4 '
               +' order by NO_POSITION desc; ',
               [HeadStoreCode,
                StoreCode,
                '01',
                ClassCode,
                vPosition]);
      SetMenuButton;
    except
      on E: Exception do begin
      ErrBox(E.Message);
      end;
    end;
  end;
end;

//CheckListBox 아이템 클리어
procedure TCodeMenuMasterForm.ClearCheckListBox(aCheckListBox: TcxCheckListBox);
var vIndex :Integer;
begin
  for vIndex := 0 to aCheckListBox.Items.Count-1 do
    aCheckListBox.Items[vIndex].Checked := false;
end;

procedure TCodeMenuMasterForm.ColorChangeMenuItemClick(Sender: TObject);
begin
  inherited;
  if Copy(TPosButton(ColorPopupMenu.PopupComponent).Name, 1, 11) = 'ClassButton' then
  begin
    if TPosButton(ColorPopupMenu.PopupComponent).Temp1 = '' then
    begin
      MsgBox('분류명을 먼저 입력해야합니다');
      Exit;
    end;
  end
  else
  begin
    if TPosButton(ColorPopupMenu.PopupComponent).Temp1 = '' then
    begin
      MsgBox('메뉴를 먼저 지정하세요');
      Exit;
    end;
  end;

  ColorDialog.Color := TPosButton(ColorPopupMenu.PopupComponent).Color;
  if ColorDialog.Execute then
    TPosButton(ColorPopupMenu.PopupComponent).Color := ColorDialog.Color;
  SaveColor;
end;

procedure TCodeMenuMasterForm.ColorCopyMenuItemClick(Sender: TObject);
begin
  inherited;
  ColorClipboard := (ColorPopupMenu.PopupComponent as TPosButton).Color;
end;

procedure TCodeMenuMasterForm.ColorPasteMenuItemClick(Sender: TObject);
begin
  inherited;
  (ColorPopupMenu.PopupComponent as TPosButton).Color := ColorClipboard;
  SaveColor;
end;

procedure TCodeMenuMasterForm.ConditionGoodsClassCodeEditPropertiesButtonClick(
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

function TCodeMenuMasterForm.GetCheckListBox(aList: TStringList;
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

function TCodeMenuMasterForm.GetMenuCode: String;
begin
  MenuCodeEdit.Enabled := False;
  try
    OpenQuery('select Ifnull(Max(CD_MENU),'''') '
             +'  from MS_MENU '
             +' where CD_HEAD         =:P0 '
             +'   and CD_STORE        =:P1 '
             +'   and Length(CD_MENU) =:P2 '
             +Ifthen(SelfMenuPrefix <> '', ' and Left(CD_MENU,2) =:P3 ','')
             +'   and GetOnlyNumber(CD_MENU) = CD_MENU ',
             [HeadStoreCode,
              StoreCode,
              SelfMenuLength,
              SelfMenuPrefix]);

    if Query.Eof or (Query.Fields[0].AsString = '') then
      Result := SelfMenuPrefix + LPad('0', SelfMenuLength-Length(SelfMenuPrefix)-1,'0')+'1'
    else
    begin
      Result := Query.Fields[0].AsString;
      Result := LPad(FloatToStr(StrToCurr(Result) + 1), SelfMenuLength, '0');
    end;
  finally
    Query.Close;
  end;
end;

procedure TCodeMenuMasterForm.GridTableView1DcRatePropertiesEditValueChanged(
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

procedure TCodeMenuMasterForm.GridTableView1PointRatePropertiesEditValueChanged(
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

procedure TCodeMenuMasterForm.GridTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  inherited;
  if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color  := clHighlightText;
  end;
end;

procedure TCodeMenuMasterForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if ARecord.Values[GridTableViewStatus.Index] = 'N' then
    AStyle := StyleFontRed;
end;

procedure TCodeMenuMasterForm.GroupNoEditClick(Sender: TObject);
begin
  inherited;
  TcxCustomEdit(Sender).EditModified := true;
end;

procedure TCodeMenuMasterForm.InputRemainCheckBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
 // Tag를 99로 해 놓으면 신규 시에도 값을 지우지 않는다
  MenuClassCodeEdit.Tag              := IfThen(InputRemainCheckBox.Checked, 99, 0);
  MenuClassNameEdit.Tag              := MenuClassCodeEdit.Tag;
  CornerComboBox.Tag                 := MenuClassCodeEdit.Tag;
  MenuTypeComboBox.Tag               := MenuClassCodeEdit.Tag;
  StockTypeComboBox.Tag              := MenuClassCodeEdit.Tag;
  TaxComboBox.Tag                    := MenuClassCodeEdit.Tag;
  UseCheckBox.Tag                    := MenuClassCodeEdit.Tag;
  Option1CheckBox.Tag                := MenuClassCodeEdit.Tag;
  Option2CheckBox.Tag                := MenuClassCodeEdit.Tag;
  KitchenCheckListBox.Tag            := MenuClassCodeEdit.Tag;
  MemoCheckListBox.Tag               := MenuClassCodeEdit.Tag;
  KitchenComboBox.Tag                := MenuClassCodeEdit.Tag;
  PriceSaleEdit.Tag                  := MenuClassCodeEdit.Tag;
end;

procedure TCodeMenuMasterForm.ItemCheckListBoxClickCheck(Sender: TObject;
  AIndex: Integer; APrevState, ANewState: TcxCheckBoxState);
begin
  inherited;
  ItemCheckListBox.Tag := 1;
end;

procedure TCodeMenuMasterForm.ItemCheckListBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) and (Sender is TcxCheckListBox) then
    TcxCheckListBox(Sender).BeginDrag(false);

end;

procedure TCodeMenuMasterForm.KeyInButtonClick(Sender: TObject);
begin
  inherited;
  MenuCodeEdit.Enabled := true;
  MenuCodeEdit.SetFocus;
end;

procedure TCodeMenuMasterForm.LogPagerShow(Sender: TObject);
begin
  inherited;
  SetHistoryGridView;
end;

procedure TCodeMenuMasterForm.GetMenuClassName(Sender: TObject);
begin
  if Sender = MenuClassCodeEdit then
  begin
    // 상품분류코드를 2, 4, 6, 8 자리로 숫자로 입력했으면 이름을 불러와 표시한다
    if (MenuClassCodeEdit.Text <> EmptyStr) and
       (MenuClassNameEdit.Text =  EmptyStr) and
       (GetOnlyNumber(MenuClassCodeEdit.Text) = MenuClassCodeEdit.Text) and
       (Length(MenuClassCodeEdit.Text) = (StoI(GetOption(248))+1)*2) then
    begin
      OpenQuery('select   GetMenuClassName(:P0, :P1, :P2) as NM_CLASS',
               [HeadStoreCode,
                StoreCode,
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
       (Length(ConditionGoodsClassCodeEdit.Text) = (StoI(GetOption(248))+1)*2) then
    begin
      OpenQuery('select   GetMenuClassName(:P0, :P1, :P2) as NM_CLASS',
               [HeadStoreCode,
                StoreCode,
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

procedure TCodeMenuMasterForm.MenuClassCodeEditPropertiesButtonClick(Sender: TObject;
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
               StoreCode]);
    try
      while not Query.Eof do
      begin
        New(vClassCode);
        vClassCode^.Data := Query.Fields[1].AsString;
        vTreeNode        := MenuClassTreeView.Items.AddObject(nil, Query.Fields[0].AsString, vClassCode);
        if GetOption(248) >= '1' then
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

procedure TCodeMenuMasterForm.MenuClassTreeViewDblClick(Sender: TObject);
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

procedure TCodeMenuMasterForm.MenuClassTreeViewExit(Sender: TObject);
begin
  inherited;
  // 상품분류 트리를 숨긴다
  (Sender as TcxTreeView).Visible := false;
end;

procedure TCodeMenuMasterForm.MenuClassTreeViewExpanding(Sender: TObject;
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
      Query.Close;
    end;
  end;
end;

procedure TCodeMenuMasterForm.MenuClassTreeViewKeyDown(Sender: TObject; var Key: Word;
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

procedure TCodeMenuMasterForm.MenuInfoButtonClick(Sender: TObject);
begin
  inherited;
  MenuInfoPanel.Top     := ToolBarDockPanel.Height + MenuInfoButton.Top + MenuInfoButton.Height + 30;
  MenuInfoPanel.Left    := GridPanel.Width + MenuInfoButton.Left + MenuInfoButton.Width;
  MenuInfoPanel.Visible := true;
  MenuInfoMemo.SetFocus;
end;

procedure TCodeMenuMasterForm.MenuInfoCloseButtonClick(Sender: TObject);
begin
  inherited;
  MenuInfoPanel.Visible := false;
end;

procedure TCodeMenuMasterForm.MenuInfoOKButtonClick(Sender: TObject);
begin
  inherited;
  ExecQuery('insert into MS_MENU_IMAGE(CD_HEAD, '
           +'                          CD_STORE, '
           +'                          CD_MENU, '
           +'                          MENU_INFO, '
           +'                          DT_CHANGE, '
           +'                          DT_INSERT) '
           +'                  values(:P0, '
           +'                         :P1, '
           +'                         :P2, '
           +'                         :P3, '
           +'                          NOW(), '
           +'                          NOW()) '
           +'ON DUPLICATE KEY UPDATE '
           +'       MENU_INFO         =:P3, '
           +'       DT_CHANGE         = NOW(); ',
           [HeadStoreCode,
            StoreCode,
            MenuCodeEdit.Text,
            MenuInfoMemo.Text],true,RestDBURL);
  MenuInfoPanel.Visible := false;
end;

//메뉴명을 메뉴단축명에 넣는다
procedure TCodeMenuMasterForm.MenuNameEditExit(Sender: TObject);
begin
  inherited;
  if ((GetOption(454)='0') or (MenuShortNameEdit.Text ='')) and MenuNameEdit.EditModified then
  begin
    MenuShortNameEdit.Text := MenuNameEdit.Text;
    MenuShortNameEdit.EditModified := true;
  end;
end;

procedure TCodeMenuMasterForm.PluClassButtonCreate;
var vWidth, vHeight, vX, vY, I :Integer;
begin
  SetLength(PluClassButton, PluClassX * PluClassY-1);

  vWidth  := ClassPanel.Width  div PluClassX;
  vHeight := ClassPanel.Height div PluClassY - 2 ;
  I := 0;
  for vY := 0 to (PluClassY-1) do
    for vX := 0 to (PluClassX-1) do
    begin
      if I > High(PluClassButton) then Continue;

      PluClassButton[I] := TPosButton.Create(Self);
      with PluClassButton[I] do
      begin
        Name        := Format('ClassButton%d',[I]);
        Parent      := ClassPanel;
        TabStop     := false;
        Width       := vWidth-2;
        Height      := vHeight;
        PopupMenu   := ColorPopupMenu;
        Left        := (vX * vWidth) + 5;
        Top         := (vY * vHeight) + (vY * 2) + 25;
        Caption     := EmptyStr;
        Color       := ClassDefaultColor;
        BorderColor := ClassBorderColor;
        BorderStyle := pbsSingle;
        BorderInnerColor := clNone;
        Font        := ClassDefaultFont;
        Font.Style  := [fsBold];
        Number.Height     := Trunc(vHeight / 4);
        Number.Font.Color := ClassDefaultFont.Color;
        Number.Font.Name  := '맑은 고딕';
        Number.Font.Size  := ClassDefaultFont.Size-2;
        Bottom.Height    := Trunc(vHeight / 4)+3;
        Bottom.Font.Size := ClassDefaultFont.Size-2;
        Cursor           := crHandPoint;
        OnClick          := PluClassButtonClick;
        Tag              := I;
        Inc(I);
      end;
    end;
 ClassPanel.Height := ClassPanel.Height + 25;
 ClassPanel.Width  := ClassPanel.Width + 5;

  //PLU분류 이전페이지, 다음페이지 버튼을 생성한다
  with TPosButton.Create(Self) do
  begin
    Name        := 'ClassPrevButton';
    Parent      := ClassPanel;
    Width       := vWidth div 2 - 2;
    Height      := vHeight;
    Left        := PluClassButton[High(PluClassButton)].Left + vWidth;
    Top         := PluClassButton[High(PluClassButton)].Top;
    Caption     := '◀';
    Color       := ClassDefaultColor;
    BorderColor := ClassBorderColor;
    BorderStyle := pbsSingle;
    BorderInnerColor := clNone;
    Font        := ClassDefaultFont;
    Font.Style  := [fsBold];
    Cursor      := crHandPoint;
    OnClick     := PluClassPrevButtonClick;
    Enabled     := true;
  end;

  with TPosButton.Create(Self) do
  begin
    Name        := 'ClassNextButton';
    Parent      := ClassPanel;
    Width       := vWidth div 2 - 2;
    Height      := vHeight;
    Left        := (PluClassButton[High(PluClassButton)].Left + vWidth) + + (vWidth div 2);
    Top         := PluClassButton[High(PluClassButton)].Top;
    Caption     := '▶';
    Color       := ClassDefaultColor;
    BorderColor := ClassBorderColor;
    BorderStyle := pbsSingle;
    BorderInnerColor := clNone;
    Font        := ClassDefaultFont;
    Font.Style  := [fsBold];
    Cursor      := crHandPoint;
    OnClick     := PluClassPrevButtonClick;
    Enabled     := true;
  end;
end;



procedure TCodeMenuMasterForm.PluClassButtonClick(Sender: TObject);
var I :Integer;
    vPos,
    vPos1 :Integer;
    vFromCode,
    vToCode :String;
begin
  inherited;
  try
    For I := Low(PluClassButton) to High(PluClassButton) do
    begin
      if PluClassButton[I].Temp2 <> '' then
        PluClassButton[I].Color := StringToColor(PluClassButton[I].Temp2)
      else
        PluClassButton[I].Color      := ClassDefaultColor;
      PluClassButton[I].Font       := ClassDefaultFont
    end;

    (Sender as TPosButton).Color      := ClassDefaultDownColor;
    (Sender as TPosButton).Font.Color := ClassDefaultDownFontColor;

    ClassButton := Sender as TPosButton;

    ClassCode  := (ClassButton as TPosButton).Temp1;

    //PLU 메뉴버튼을 셋팅한다
    MenuPage := 1;
    TPosButton(FindComponent('MenuPrevButton')).Enabled := false;
    SetMenuButton;

    MenuPanel.Enabled := ((ClassButton as TPosButton).Number.NumberString <> '') and ((ClassButton as TPosButton).Temp3 = 'N');
    isChanged  := false;
  finally
    Screen.Cursor := crDefault;
    Self.Enabled  := true;
  end;
end;



procedure TCodeMenuMasterForm.PluClassPrevButtonClick(Sender: TObject);
begin
  if Sender = TPosButton(FindComponent('ClassNextButton'))  then
    ClassPage := ClassPage + 1
  else ClassPage := ClassPage - 1;

  TPosButton(FindComponent('ClassPrevButton')).Enabled     := ClassPage > 1 ;

  SetClassButton;
  PluClassButtonClick(TPosButton(FindComponent('ClassButton0')));
end;

procedure TCodeMenuMasterForm.PLUDeletePopupMenuPopup(Sender: TObject);
begin
  inherited;
  if PLUDeletePopupMenu.PopupComponent is TPosButton then
  begin
    MenuButton := TPosButton(PLUDeletePopupMenu.PopupComponent);
  end;
end;

procedure TCodeMenuMasterForm.Delete2MenuItemClick(Sender: TObject);
var vPosition :Integer;
begin
  inherited;
  if ClassButton <> nil then
  begin
    vPosition := (MenuPage-1) * ((PluMenuX * PluMenuY)-1) + TPosButton(ColorPopupMenu.PopupComponent).Tag + 1;

    try
      TempSQL := '';
      ExecQuery('delete from MS_SMALL '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_GUBUN =:P2 '
               +'   and CD_LARGE =:P3 '
               +'   and NO_POSITION = :P4; ',
               [HeadStoreCode,
                StoreCode,
                '01',
                ClassCode,
                vPosition], false);

      ExecQuery('update MS_SMALL '
               +'   set NO_POSITION = NO_POSITION - 1 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_GUBUN =:P2 '
               +'   and CD_LARGE =:P3 '
               +'   and NO_POSITION > :P4; ',
               [HeadStoreCode,
                StoreCode,
                '01',
                ClassCode,
                vPosition], true);
      SetClassButton;
    except
      on E: Exception do begin
      ErrBox(E.Message);
      end;
    end;
  end;
end;

procedure TCodeMenuMasterForm.DeleteMenuItemClick(Sender: TObject);
begin
  inherited;
  if Copy(TPosButton(ColorPopupMenu.PopupComponent).Name, 1, 11) = 'ClassButton' then
  begin
    ClassButton := TPosButton(ColorPopupMenu.PopupComponent);
    ButtonToolBarDeleteButtonClick(ClassButton);
  end
  else
  begin
    MenuButton := TPosButton(ColorPopupMenu.PopupComponent);
    ButtonToolBarDeleteButtonClick(MenuButton);
  end;
end;

function TCodeMenuMasterForm.DoDelete: Boolean;
var vMsg :String;
begin
  //PLU 삭제
  if PluPager.Showing then
  begin
    if ClassButton = nil then Exit;
    PluMenuDeleteMenuItem.Click;
    Result := true;
    Exit;
  end;
  inherited;

  Result := False;

  if HeadMenuStatus.Visible then
  begin
    MsgBox('표준메뉴는 삭제할 수 없습니다');
    Exit;
  end;

  try
    OpenQuery('select exists(select * from SL_SALE_D_SUM where CD_HEAD =:P0 and CD_STORE =:P1 and CD_MENU =:P2) as sale, '
             +'       exists(select * from SL_BUY_D where CD_HEAD =:P0 and CD_STORE =:P1 and CD_GOODS =:P2) as buy ',
             [HeadStoreCode,
              StoreCode,
              Trim(MenuCodeEdit.Text)]);

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
    Query.Close;
  end;

  try
    Result := ExecQuery('delete from MS_SMALL '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_KIOSK_SMALL '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_SPC_D '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_MENU '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
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
                       +'   and CD_MENU  =:P2;'
                       +'delete from MS_MENU_GROUP '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and (CD_MENU  =:P2 or CD_MENU_SET =:P2);'
                       +'delete from MS_COURSE '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and (CD_MENU  =:P2 or CD_MENU_COURSE =:P2);'
                       +'update MS_STORE '
                       +'   set DT_CHANGE = Now() '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1; ',
                       [HeadStoreCode,
                        StoreCode,
                        Trim(MenuCodeEdit.Text)]);
  except
    on E: Exception do begin
    ErrBox(E.Message);
    end;
  end;
end;

procedure TCodeMenuMasterForm.DoGridLink;
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
    if NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],'') = '' then Exit;

    OpenQuery('select a.CD_MENU, '
             +'       a.NM_MENU, '
             +'       a.NM_MENU_SHORT, '
             +'       a.NM_MENU_KITCHEN, '
             +'       a.CD_CLASS, '
             +'       a.CD_CORNER, '
             +'       a.DS_MENU_TYPE, '
             +'       a.NO_MENU, '
             +'       a.QTY_SELECT, '
             +'       a.PR_BUY, '
             +'       a.PR_SALE, '
             +'       a.DS_TAX, '
             +'       a.PR_SALE_DOUBLE, '
             +'       a.PR_SALE_PROFIT, '
             +'       a.PR_SALE_PACKING, '
             +'       a.PR_TIP, '
             +'       a.PR_SALE_MON, '
             +'       a.PR_SALE_TUE, '
             +'       a.PR_SALE_WED, '
             +'       a.PR_SALE_THU, '
             +'       a.PR_SALE_FRI, '
             +'       a.PR_SALE_SAT, '
             +'       a.PR_SALE_SUN, '
             +'       a.PR_SALE_HOLIDAY, '
             +'       a.BILL_SEQ, '
             +'       a.NO_GROUP, '
             +'       a.YN_USE, '
             +'       a.CD_PRINTER, '
             +'       a.DS_KITCHEN, '
             +'       a.SAVE_STAMP, '
             +'       a.USE_STAMP, '
             +'       a.DS_STOCK, '
             +'       a.QTY_UNIT, '
             +'       GetMenuClassName(a.CD_HEAD, a.CD_STORE, a.CD_CLASS) as NM_CLASS, '
             +'       a.OPTIONS, '
             +'       a.CONFIG, '
             +'       a.ORDERTIME_FROM, '
             +'       a.ORDERTIME_TO, '
             +'       b.MENU_INFO '
             +'  from MS_MENU a left outer join  '
             +'       MS_MENU_IMAGE as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.CD_MENU  =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);

     //1:YN_DC, 2:YN_POINT, 3:YN_RCP, 4,YN_PERSON, 5,YN_BILL, 6:YN_TABLECOLOR, 7:YN_TICKET, 8:YN_SOLDOUT, 9:YN_POINT_LIMIT
     if Query.Eof then Exit;
     MenuCodeEdit.Text              := Query.FieldByName('CD_MENU').AsString;
     MenuNameEdit.Text              := Query.FieldByName('NM_MENU').AsString;
     MenuNameEdit.EditModified      := false;
     MenuShortNameEdit.Text         := Query.FieldByName('NM_MENU_SHORT').AsString;
     MenuShortNameEdit.EditModified := false;
     KitchenMenuNameEdit.Text       := Query.FieldByName('NM_MENU_KITCHEN').AsString;
     MenuClassCodeEdit.Text         := Query.FieldByName('CD_CLASS').AsString;
     MenuClassNameEdit.Text         := Query.FieldByName('NM_CLASS').AsString;
     CornerComboBox.ItemIndex       := GetStrPointerIndex(CornerComboBox, Query.FieldByName('CD_CORNER').AsString);
     MenuTypeComboBox.ItemIndex     := GetStrPointerIndex(MenuTypeComboBox, Query.FieldByName('DS_MENU_TYPE').AsString);
     MenuTypeComboBox.TextHint      := Query.FieldByName('DS_MENU_TYPE').AsString;
     PriceBuyEdit.Enabled           := Query.FieldByName('DS_MENU_TYPE').AsString <> 'P';
     PriceSaleEdit.Enabled          := Query.FieldByName('DS_MENU_TYPE').AsString <> 'P';
     MenuNoEdit.Text                := Query.FieldByName('NO_MENU').AsString;
     MenuCountEdit.Value            := Query.FieldByName('QTY_SELECT').AsCurrency;
     PriceBuyEdit.Value             := Query.FieldByName('PR_BUY').AsCurrency;
     PriceSaleEdit.Value            := Query.FieldByName('PR_SALE').AsCurrency;
     TaxComboBox.ItemIndex          := GetStrPointerIndex(TaxComboBox, Query.FieldByName('DS_TAX').AsString);
     PriceDoubleEdit.Value          := Query.FieldByName('PR_SALE_DOUBLE').AsCurrency;
     PriceProfitRateEdit.Value      := Query.FieldByName('PR_SALE_PROFIT').AsCurrency;
     PriceTipEdit.Value             := Query.FieldByName('PR_TIP').AsCurrency;
     PriceMonEdit.Value             := Query.FieldByName('PR_SALE_MON').AsCurrency;
     PriceTueEdit.Value             := Query.FieldByName('PR_SALE_TUE').AsCurrency;
     PriceWedEdit.Value             := Query.FieldByName('PR_SALE_WED').AsCurrency;
     PriceThuEdit.Value             := Query.FieldByName('PR_SALE_THU').AsCurrency;
     PriceFriEdit.Value             := Query.FieldByName('PR_SALE_FRI').AsCurrency;
     PriceSatEdit.Value             := Query.FieldByName('PR_SALE_SAT').AsCurrency;
     PriceSunEdit.Value             := Query.FieldByName('PR_SALE_SUN').AsCurrency;
     PriceHolidayEdit.Value         := Query.FieldByName('PR_SALE_HOLIDAY').AsCurrency;
     PricePackingEdit.Value         := Query.FieldByName('PR_SALE_PACKING').AsCurrency;
     DisplaySeqEdit.Value           := Query.FieldByName('BILL_SEQ').AsCurrency;
     GroupNoEdit.Value              := Query.FieldByName('NO_GROUP').AsCurrency;
     UseCheckBox.Checked            := Query.FieldByName('YN_USE').AsString = 'Y';
     Option1CheckBox.Checked        := Copy(Query.FieldByName('CONFIG').AsString,1,1) = 'Y';
     Option2CheckBox.Checked        := Copy(Query.FieldByName('CONFIG').AsString,2,1) = 'Y';
     Option3CheckBox.Checked        := Copy(Query.FieldByName('CONFIG').AsString,3,1) = 'Y';
     Option4Edit.Value              := StrToIntDef(Copy(Query.FieldByName('CONFIG').AsString,4,1),0);
     Option5CheckBox.Checked        := (Copy(Query.FieldByName('CONFIG').AsString,5,1) = 'Y') or (Copy(Query.FieldByName('CONFIG').AsString,5,1) = '');
     Option6CheckBox.Checked        := Copy(Query.FieldByName('CONFIG').AsString,6,1) = 'Y';
     Option7CheckBox.Checked        := Copy(Query.FieldByName('CONFIG').AsString,7,1) = 'Y';
     Option8CheckBox.Checked        := Copy(Query.FieldByName('CONFIG').AsString,8,1) = 'Y';
     Option9CheckBox.Checked        := Copy(Query.FieldByName('CONFIG').AsString,9,1) = 'Y';
     Option10ComboBox.ItemIndex     := GetStrPointerIndex(Option10ComboBox, Copy(Query.FieldByName('CONFIG').AsString,10,1));
     Option11CheckBox.Checked       := Copy(Query.FieldByName('CONFIG').AsString,11,1) = 'Y';
     Option12CheckBox.Checked       := Copy(Query.FieldByName('CONFIG').AsString,12,1) = 'Y';
     Option13ComboBox.ItemIndex     := GetStrPointerIndex(Option13ComboBox, Copy(Query.FieldByName('CONFIG').AsString,13,1));
     Option14Edit.Value             := StrToIntDef(Copy(Query.FieldByName('CONFIG').AsString,14,1),0);
     Option16CheckBox.Checked       := Copy(Query.FieldByName('CONFIG').AsString,16,1) = 'Y';
     Option17CheckBox.Checked       := Copy(Query.FieldByName('CONFIG').AsString,17,1) = 'Y';
     Option18CheckBox.Checked       := Copy(Query.FieldByName('CONFIG').AsString,18,1) = 'Y';


     SetPrinter(KitchenCheckListBox, Query.FieldByName('CD_PRINTER').AsString);
     ItemCheckListBox.Enabled       := GetStrPointerData(MenuTypeComboBox) ='N';
     KitchenComboBox.ItemIndex      := GetStrPointerIndex(KitchenComboBox, Query.FieldByName('DS_KITCHEN').AsString);
     StampSaveEdit.Value            := Query.FieldByName('SAVE_STAMP').AsInteger;
     StampUseEdit.Value             := Query.FieldByName('USE_STAMP').AsInteger;
     StockTypeComboBox.ItemIndex    := GetStrPointerIndex(StockTypeComboBox, Query.FieldByName('DS_STOCK').AsString);
     UnitQtyEdit.Value              := Query.FieldByName('QTY_UNIT').AsCurrency;
     if Query.FieldByName('ORDERTIME_FROM').AsString = '00:00' then
       OrderTimeFromEdit.Time := 0.0
     else
       OrderTimeFromEdit.Time := StoT(Query.FieldByName('ORDERTIME_FROM').AsString);

     if Query.FieldByName('ORDERTIME_TO').AsString = '00:00' then
       OrderTimeToEdit.Time := 0.0
     else
       OrderTimeToEdit.Time := StoT(Query.FieldByName('ORDERTIME_TO').AsString);

     OrderAllTimeCheckBox.Checked := (Query.FieldByName('ORDERTIME_FROM').AsString = '00:00') and (Query.FieldByName('ORDERTIME_TO').AsString = '00:00');

     PriceSaleEdit.Properties.ReadOnly       := false;
     PriceDoubleEdit.Properties.ReadOnly     := false;
     PriceProfitRateEdit.Properties.ReadOnly := false;
     HeadMenuStatus.Caption := '매장메뉴';
     //표준메뉴 사용시 이미지는 표준에서만 지정가능
     if (Copy(Query.FieldByName('OPTIONS').AsString,1,1) = '1') and (GetStoreOption(1) <> '0') then
     begin
       KitchenGroupBox.Enabled  := GetHeadOption(10) = '0';
       MenuTypeComboBox.Enabled := GetStoreOption(4) = '0';
       HeadMenuStatus.Visible   := true;
       if (Copy(Query.FieldByName('OPTIONS').AsString,2,1) = '1')  then
       begin
         HeadMenuStatus.Caption := '단가고정';
         PriceSaleEdit.Properties.ReadOnly       := true;
         PriceDoubleEdit.Properties.ReadOnly     := true;
         PriceProfitRateEdit.Properties.ReadOnly := true;
       end
       else
         HeadMenuStatus.Caption := '표준메뉴';
     end
     else
     begin
       KitchenGroupBox.Enabled := true;
       HeadMenuStatus.Visible   := false;
       MenuTypeComboBox.Enabled := true;
     end;

     MenuInfoMemo.Text := Query.FieldByName('MENU_INFO').AsString;

     //주방메모
     if (GetOption(156) = '1') or (GetOption(156) = '2') then
       try
         DM.OpenQuery('select CD_MEMO '
                     +'  from MS_MENU_MEMO '
                     +' where CD_HEAD  =:P0 '
                     +'   and CD_STORE =:P1 '
                     +'   and CD_MENU  =:P2 ',
                     [HeadStoreCode,
                      StoreCode,
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


     MemberGroupBox.Enabled := HeadMenuStatus.Caption = '매장메뉴';
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
                     +'                   and b.CD_MENU  =:P2  '
                     +' where a.CD_HEAD  =:P0 '
                     +'   and a.CD_STORE =:P1 '
                     +'   and a.CD_KIND  = ''05'' '
                     +'   and a.DS_STATUS = ''0'' '
                     +' order by a.CD_CODE ',
                     [HeadStoreCode,
                      Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
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
                    StoreCode,
                    Trim(MenuCodeEdit.Text)]);
       ClearCheckListBox(ItemCheckListBox);
       while not DM.Query.Eof do
       begin
         if GetCheckListBox(BackItemList, DM.Query.FieldByName('CD_ITEM').AsString) >= 0 then
           ItemCheckListBox.Items[GetCheckListBox(BackItemList, DM.Query.FieldByName('CD_ITEM').AsString)].Checked := True;
         DM.Query.Next;
       end;
     finally
       DM.Query.Close;
     end;

     KoreanEdit.Text            := MenuShortNameEdit.Text;
     EnglishEdit.Text           := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewEnglish.Index],'');
     ChianensEdit.Text          := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewChina.Index],'');
     JapanseEdit.Text           := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewJapan.Index],'');
     VietnamensEdit.Text        := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewVietnam.Index],'');
     ThaiEdit.Text              := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewThai.Index],'');
     IndoEdit.Text              := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewIndo.Index],'');
     FrenchEdit.Text            := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewFrench.Index],'');
     GermanEdit.Text            := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGerman.Index],'');

     ItemCheckListBox.Tag := 0;
     if MenuPager.ActivePage = LogPager then
       SetHistoryGridView;
  finally
    Query.Close;
    isChanged := false;
  end;
end;

function TCodeMenuMasterForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    MenuPager.Enabled   := true;
    MenuPager.ActivePageIndex := 0;
    MenuCodeEdit.Text   := GetMenuCode;
    MenuCountEdit.Value := 0;
    // (상품코드) 생성 버튼을 활성화한다
    KeyInButton.Enabled  := true;
    MenuCodeEdit.Enabled := false;
    if not InputRemainCheckBox.Checked then
      ClearCheckListBox(KitchenCheckListBox);
    ClearCheckListBox(MemoCheckListBox);
    ClearCheckListBox(ItemCheckListBox);
    UseCheckBox.Checked   := true;
    Option1CheckBox.Checked    := true;
    Option2CheckBox.Checked := true;
    Option9CheckBox.Checked := false;
    Option3CheckBox.Checked := true;
    Option5CheckBox.Checked := true;
    Option6CheckBox.Checked := false;
    Option18CheckBox.Checked := false;
    MenuNameEdit.Properties.ReadOnly := false;
    HeadMenuStatus.Caption := '매장메뉴';
    MenuTypeComboBox.Enabled := true;
    PriceSaleEdit.Properties.ReadOnly       := false;
    PriceDoubleEdit.Properties.ReadOnly     := false;
    PriceProfitRateEdit.Properties.ReadOnly := false;
    KitchenGroupBox.Enabled := true;
    OrderTimeFromEdit.EditValue := 0.0;
    OrderTimeToEdit.EditValue   := 0.0;

    ItemCheckListBox.Enabled  := true;
    MenuNameEdit.SetFocus;
  finally
    isLoading := false;
    Result    := true;
  end;
end;

function TCodeMenuMasterForm.DoSave: Boolean;
var  vIndex, vIndex1, vParamIndex :Integer;
     vKitchen :String;
     vSQLText, vCode :String;
     vResult     :Boolean;
     vPointSQL :String;
     vSQL :String;
     vFileName, vFileName1, vFileName2 :String;
     vConfig :String;
begin
  result := false;

  //주방 출력
  For vIndex := 0 to Pred(KitchenCheckListBox.Items.Count) do
  begin
    if vIndex > KitchenCheckListBox.Items.Count then Continue;
    if KitchenCheckListBox.Items[vIndex].Checked then
      vKitchen := vKitchen +  BackKitchenList.Strings[vIndex]+',';
  end;
  if (vKitchen <> '') and (vKitchen[Length(vKitchen)]=',') then
    Delete(vKitchen,Length(vKitchen),1);

  if isMultiMode then
  begin
    try
      Screen.Cursor := crSQLWait;
      vParamIndex := 2;
      if KitchenCheckListBox.Tag = 1 then
        vSQLText    := KitchenCheckListBox.Hint+Format('=:P%s, ',[IntToStr(vParamIndex)]);

       //1:YN_DC, 2:YN_POINT, 3:YN_RCP, 4,YN_PERSON, 5,YN_BILL, 6:YN_TABLECOLOR, 7:YN_TICKET, 8:YN_SOLDOUT, 9:YN_POINT_LIMIT, 10:YN_PACKING, 11:렛츠오더 주문서출력, 12:성인상품, 13:키오스크뱃지, 14:최소주문수량, 15:TTS

      if Option1CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 1, ''%s''), ',[Ifthen(Option1CheckBox.Checked,'Y','N')]);

      if Option2CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 2, ''%s''), ',[Ifthen(Option2CheckBox.Checked,'Y','N')]);

      if Option3CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 3, ''%s''), ',[Ifthen(Option3CheckBox.Checked,'Y','N')]);

      if Option4Edit.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 4, ''%s''), ',[IntToStr(Option4Edit.Value)]);

      if Option5CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 5, ''%s''), ',[Ifthen(Option5CheckBox.Checked,'Y','N')]);

      if Option6CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 6, ''%s''), ',[Ifthen(Option6CheckBox.Checked,'Y','N')]);

      if Option7CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 7, ''%s''), ',[Ifthen(Option7CheckBox.Checked,'Y','N')]);

      if Option8CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 8, ''%s''), ',[Ifthen(Option8CheckBox.Checked,'Y','N')]);

      if Option9CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 9, ''%s''), ',[Ifthen(Option9CheckBox.Checked,'Y','N')]);

      if Option10ComboBox.EditModified and (GetStrPointerData(Option10ComboBox) <> '') then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 10, ''%s''), ',[GetStrPointerData(Option10ComboBox)]);

      if Option11CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 11, ''%s''), ',[Ifthen(Option11CheckBox.Checked,'Y','N')]);

      if Option12CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 12, ''%s''), ',[Ifthen(Option12CheckBox.Checked,'Y','N')]);

      if Option13ComboBox.EditModified and (GetStrPointerData(Option13ComboBox) <> '') then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 13, ''%s''), ',[GetStrPointerData(Option13ComboBox)]);

      if Option16CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 16, ''%s''), ',[Ifthen(Option16CheckBox.Checked,'Y','N')]);

      if Option17CheckBox.EditModified then
        vSQLText := vSQLText + Format('CONFIG = StringPosReplace(CONFIG, 17, ''%s''), ',[Ifthen(Option17CheckBox.Checked,'Y','N')]);

      for vIndex := 0 to ComponentCount-1 do
      begin
        if ( (TControl(Components[vIndex]).Parent = TopPanel)
          or (TControl(Components[vIndex]).Parent = CornerPanel)
          or (TControl(Components[vIndex]).Parent = StockGroupBox)
          or (TControl(Components[vIndex]).Parent = CenterPanel)
          or (TControl(Components[vIndex]).Parent = KitchenPanel)
          or (TControl(Components[vIndex]).Parent = StampGroupBox))
          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))
               or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint <> '') and TcxSpinEdit(Components[vIndex]).EditModified )
               or ((Components[vIndex] is TcxCheckListBox ) and (TcxCheckListBox(Components[vIndex]).Hint <> '') and (TcxCheckListBox(Components[vIndex]).Tag = 1)) )  then
        begin
          if ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_DC'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_POINT'))
            or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint = 'GUEST_COUNT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_BILL'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_TABLECOLOR'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_TICKET'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_SOLDOUT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_POINT_LIMIT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_PACKING'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_LETSORDER'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_ADULT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_TTS'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_SALEQTY'))
            or ((Components[vIndex] is TcxComboBox ) and (TcxComboBox(Components[vIndex]).Hint = 'BADGE'))  then
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
                 +' where CD_HEAD =:P0 and CD_STORE =:P1';

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
          or (TControl(Components[vIndex]).Parent = CornerPanel)
          or (TControl(Components[vIndex]).Parent = StockGroupBox)
          or (TControl(Components[vIndex]).Parent = CenterPanel)
          or (TControl(Components[vIndex]).Parent = KitchenPanel)
          or (TControl(Components[vIndex]).Parent = StampGroupBox))
          and ( ((Components[vIndex] is TcxCustomEdit) and (TcxCustomEdit(Components[vIndex]).Hint <> '') and (TcxCustomEdit(Components[vIndex]).EditModified))
               or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint <> '') and TcxSpinEdit(Components[vIndex]).EditModified )
               or ((Components[vIndex] is TcxCheckListBox ) and (TcxCheckListBox(Components[vIndex]).Hint <> '') and (TcxCheckListBox(Components[vIndex]).Tag = 1)) )  then
        begin
          if ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_DC'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_POINT'))
            or ((Components[vIndex] is TcxSpinEdit) and (TcxSpinEdit(Components[vIndex]).Hint = 'GUEST_COUNT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_BILL'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_TABLECOLOR'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_TICKET'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_SOLDOUT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_POINT_LIMIT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_PACKING'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_ADULT'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_LETSORDER'))
            or ((Components[vIndex] is TcxCheckBox ) and (TcxCheckBox(Components[vIndex]).Hint = 'YN_SALEQTY'))
            or ((Components[vIndex] is TcxComboBox ) and (TcxComboBox(Components[vIndex]).Hint = 'BADGE')) then
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


  if isNew and (Length(MenuCodeEdit.Text) < 4) then
    MenuCodeEdit.Text := LPad(MenuCodeEdit.Text, 4, '0');

  if Pos(' ',MenuCodeEdit.Text) > 0 then
  begin
    ErrBox(MenuCodeLabel.Caption+'에 공백을 사용할 수 없습니다');
    MenuPager.ActivePageIndex := 0;
    if MainPanel.Enabled and MenuCodeEdit.Enabled then
      MenuCodeEdit.SetFocus;
    Exit;
  end;
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

  if OrderAllTimeCheckBox.Checked and (OrderTimeFromEdit.Time > OrderTimeToEdit.Time) then
  begin
    ErrBox('주문가능 시간을 다시 설정하세요');
    Exit;
  end;

  if (GetOption(194) = '1') and ((PriceMonEdit.Value + PriceTueEdit.Value + PriceWedEdit.Value + PriceThuEdit.Value + PriceFriEdit.Value + PriceSatEdit.Value + PriceSunEdit.Value ) > 0) then
  begin
    if (PriceMonEdit.Value = 0) or (PriceTueEdit.Value = 0) or (PriceWedEdit.Value = 0) or (PriceThuEdit.Value = 0) or (PriceFriEdit.Value = 0) or (PriceSatEdit.Value = 0) or (PriceSunEdit.Value = 0) or (PriceHolidayEdit.Value = 0) then
    begin
      ErrBox('요일별단가 사용 시 전요일에 단가를 입력해야합니다');
      Exit
    end;
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
                   StoreCode,
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
                   StoreCode,
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
                StoreCode,
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

  vConfig := Ifthen(Option1CheckBox.Checked, 'Y', 'N')   //
            +Ifthen(Option2CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option3CheckBox.Checked, 'Y', 'N')
            +FormatFloat('0',Option4Edit.Value)
            +Ifthen(Option5CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option6CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option7CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option8CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option9CheckBox.Checked, 'Y', 'N')
            +GetStrPointerData(Option10ComboBox)
            +Ifthen(Option11CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option12CheckBox.Checked, 'Y', 'N')
            +GetStrPointerData(Option13ComboBox)
            +FormatFloat('0',Option14Edit.Value)
            +'N'
            +Ifthen(Option16CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option17CheckBox.Checked, 'Y', 'N')
            +Ifthen(Option18CheckBox.Checked, 'Y', 'N');

  vConfig := RPad(vConfig,30,'0');
   //1:YN_DC, 2:YN_POINT, 3:YN_RCP, 4,YN_PERSON, 5,YN_BILL, 6:YN_TABLECOLOR, 7:YN_TICKET, 8:YN_SOLDOUT, 9:YN_POINT_LIMIT, 10:YN_PACKING

  try
    TempSQL := '';
    if (GetOption(194)='1') and (PriceSunEdit.Value > 0) then
    begin
      case DayofWeek(Now()) of
        1 : PriceSaleEdit.Value := PriceSunEdit.Value;
        2 : PriceSaleEdit.Value := PriceMonEdit.Value;
        3 : PriceSaleEdit.Value := PriceTueEdit.Value;
        4 : PriceSaleEdit.Value := PriceWedEdit.Value;
        5 : PriceSaleEdit.Value := PriceThuEdit.Value;
        6 : PriceSaleEdit.Value := PriceFriEdit.Value;
        7 : PriceSaleEdit.Value := PriceSatEdit.Value;
      end;

    end;
    ExecQuery('insert into MS_MENU(CD_HEAD, '
             +'                    CD_STORE, '
             +'                    CD_MENU, '
             +'	 				           NM_MENU, '
             +'	 				           NM_MENU_SHORT, '
             +'                    NM_MENU_KITCHEN, '
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
             +'                    PR_SALE_MON, '
             +'                    PR_SALE_TUE, '
             +'                    PR_SALE_WED, '
             +'                    PR_SALE_THU, '
             +'                    PR_SALE_FRI, '
             +'                    PR_SALE_SAT, '
             +'                    PR_SALE_SUN, '
             +'                    PR_SALE_HOLIDAY, '
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
             +'                    ORDERTIME_FROM, '
             +'                    ORDERTIME_TO, '
             +'	 				           CD_SAWON_CHG, '
             +'                    PRG_INSERT, '
             +'                    PRG_CHANGE, '
             +'                    DT_CHANGE ) '
             +'            VALUES(:P0, '
             +'	 				         :P1, '
             +'	 				         :P2, '
             +'	 				         :P3, '
             +'	 				         :P4, '
             +'	 				         :P5, '
             +'	 				         :P6, '
             +'	 				         :P7, '
             +'	 				         :P8, '
             +'	 				         :P9, '
             +'	 				         :P10, '
             +'	 				         :P11, '
             +'	 				         :P12, '
             +'	 				         :P13, '
             +'	 				         :P14, '
             +'	 				         :P15, '
             +'	 				         :P16, '
             +'	 				         :P17, '
             +'	 				         :P18, '
             +'	 				         :P19, '
             +'	 				         :P20, '
             +'	 				         :P21, '
             +'	 				         :P22, '
             +'	 				         :P23, '
             +'	 				         :P24, '
             +'	 				         :P25, '
             +'	 				         :P26, '
             +'	 				         :P27, '
             +'	 				         :P28, '
             +'	 				         :P29, '
             +'	 				         :P30, '
             +'	 				         :P31, '
             +'	 				         :P32, '
             +'	 				         :P33, '
             +'	 				         :P34, '
             +'	 				         :P35, '
             +'	 				         :P36, '
             +'	 				         :P37, '
             +'	 				         :P38, '
             +'                  ''MST'', '
             +'                  ''MST'', '
             +'                   NOW()) '
             +' ON DUPLICATE KEY UPDATE  NM_MENU        = :P3, '
             +'                          NM_MENU_SHORT  = :P4, '
             +'                          NM_MENU_KITCHEN= :P5, '
             +'                          CD_CLASS       = :P6, '
             +'                          DS_MENU_TYPE   = :P7, '
             +'                          CD_CORNER      = :P8, '
             +'                          NO_MENU        = :P9, '
             +'                          QTY_SELECT     = :P10, '
             +'                          PR_BUY         = :P11, '
             +'                          PR_SALE        = :P12, '
             +'                          PR_SALE_DOUBLE = :P13, '
             +'                          PR_SALE_PROFIT = :P14, '
             +'                          PR_TIP         = :P15, '
             +'                          PR_SALE_PACKING= :P16, '
             +'                          PR_SALE_MON    = :P17, '
             +'                          PR_SALE_TUE    = :P18, '
             +'                          PR_SALE_WED    = :P19, '
             +'                          PR_SALE_THU    = :P20, '
             +'                          PR_SALE_FRI    = :P21, '
             +'                          PR_SALE_SAT    = :P22, '
             +'                          PR_SALE_SUN    = :P23, '
             +'                          PR_SALE_HOLIDAY= :P24, '
             +'                          DS_TAX         = :P25, '
             +'                          CONFIG         = :P26, '
             +'                          CD_PRINTER     = :P27, '
             +'                          DS_KITCHEN     = :P28, '
             +'                          BILL_SEQ       = :P29, '
             +'                          NO_GROUP       = :P30, '
             +'                          DS_STOCK       = :P31, '
             +'                          QTY_UNIT       = :P32, '
             +'                          YN_USE         = :P33, '
             +'                          SAVE_STAMP     = :P34, '
             +'                          USE_STAMP      = :P35, '
             +'                          ORDERTIME_FROM = :P36, '
             +'                          ORDERTIME_TO   = :P37, '
             +'                          CD_SAWON_CHG   = :P38, '
             +'                          PRG_CHANGE     =''MST'', '
             +'                          DT_CHANGE      =NOW();',
             [HeadStoreCode,
              StoreCode,
              Trim(MenuCodeEdit.Text),
              MenuNameEdit.Text,
              MenuShortNameEdit.Text,
              KitchenMenuNameEdit.Text,
              MenuClassCodeEdit.Text,
              GetStrPointerData(MenuTypeComboBox),
              GetStrPointerData(CornerComboBox),
              MenuNoEdit.Text,
              MenuCountEdit.EditValue,
              PriceBuyEdit.Value,
              PriceSaleEdit.Value,
              PriceDoubleEdit.Value,
              PriceProfitRateEdit.Value,
              PriceTipEdit.Value,
              PricePackingEdit.Value,
              PriceMonEdit.Value,
              PriceTueEdit.Value,
              PriceWedEdit.Value,
              PriceThuEdit.Value,
              PriceFriEdit.Value,
              PriceSatEdit.Value,
              PriceSunEdit.Value,
              PriceHolidayEdit.Value,
              GetStrPointerData(TaxComboBox),
              vConfig,
              vKitchen,
              GetStrPointerData(KitchenComboBox),
              DisplaySeqEdit.Value,
              GroupNoEdit.Text,
              GetStrPointerData(StockTypeComboBox),
              UnitQtyEdit.Value,
              Ifthen(UseCheckBox.Checked, 'Y', 'N'),
              StampSaveEdit.EditValue,
              StampUseEdit.EditValue,
              OrderTimeFromEdit.Text,
              OrderTimeToEdit.Text,
              UserCode],false);

    //혹시 내용중에 구분자 ";" 있을경우 뺀다
    vSQL := Replace(vSQL,';','')+';';

    //아이템저장
    if ItemCheckListBox.Tag = 1 then
    begin
      ExecQuery('delete '
              +'  from MS_MENU_ITEM '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and CD_MENU  =:P2;',
              [HeadStoreCode,
               StoreCode,
               Trim(MenuCodeEdit.Text)],false);
      for vIndex := 0 to ItemCheckListBox.Count-1 do
        if ItemCheckListBox.Items[vIndex].Checked then
          ExecQuery('insert into MS_MENU_ITEM(CD_HEAD, '
                   +'                         CD_STORE, '
                   +'                         CD_MENU, '
                   +'                         CD_ITEM) '
                   +'                  values(:P0, '
                   +'                         :P1, '
                   +'                         :P2, '
                   +'                         :P3);',
                   [HeadStoreCode,
                    StoreCode,
                    Trim(MenuCodeEdit.Text),
                    BackItemList.Strings[vIndex]],false);
    end;

    //주방메모저장
    if (GetOption(156) = '1') or (GetOption(156) = '2') then
    begin
      ExecQuery('delete '
               +'  from MS_MENU_MEMO '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MENU  =:P2;',
               [HeadStoreCode,
                StoreCode,
                Trim(MenuCodeEdit.Text)],false);
      for vIndex := 0 to MemoCheckListBox.Count-1 do
        if MemoCheckListBox.Items[vIndex].Checked then
          ExecQuery('insert into MS_MENU_MEMO(CD_HEAD, '
                   +'                         CD_STORE, '
                   +'                         CD_MENU, '
                   +'                         CD_MEMO) '
                   +'                  values(:P0, '
                   +'                         :P1, '
                   +'                         :P2, '
                   +'                         :P3);',
                   [HeadStoreCode,
                    StoreCode,
                    Trim(MenuCodeEdit.Text),
                    BackMemoList.Strings[vIndex]],false);
    end;

    //메뉴구분이 변경되면 이전에 설정된 메뉴는 삭제한다
    if not isNew and (MenuTypeComboBox.TextHint <> GetStrPointerData(MenuTypeComboBox)) and (GetStrPointerData(MenuTypeComboBox) = 'N') then
    begin
      if MenuTypeComboBox.TextHint = 'C' then
        ExecQuery('delete '
                 +'  from MS_COURSE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_MENU  =:P2;',
                 [HeadStoreCode,
                  StoreCode,
                  Trim(MenuCodeEdit.Text)],false);

      if MenuTypeComboBox.TextHint = 'S' then
        ExecQuery('delete '
                 +'  from MS_MENU_SET '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_MENU  =:P2;',
                 [HeadStoreCode,
                  StoreCode,
                  Trim(MenuCodeEdit.Text)],false);

      if MenuTypeComboBox.TextHint = 'O' then
        ExecQuery('delete '
                 +'  from MS_MENU_OPEN '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_MENU  =:P2;',
                 [HeadStoreCode,
                  StoreCode,
                  Trim(MenuCodeEdit.Text)],false);
    end;

    Result := ExecQuery('update MS_STORE '
                       +'   set DT_CHANGE = NOW() '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                       [HeadStoreCode,
                        StoreCode],true);

    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := Trim(MenuCodeEdit.Text);
      NewData[1] := MenuNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewMenuName.Index] := MenuNameEdit.Text;
    ExtremeMainForm.PosSendMessage;
  except
     on E: Exception do
     begin
       ErrBox(E.Message);
     end;
  end;
end;

procedure TCodeMenuMasterForm.SaveColor;
var vPosition :Integer;
begin
  if LeftStr(TPosButton(ColorPopupMenu.PopupComponent).Name, 11) = 'ClassButton' then
  begin
    ExecQuery('update MS_LARGE '
             +'   set COLOR      =:P4, '
             +'       COLOR_HEX  =:P5, '
             +'       DT_CHANGE  = Now() '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and CD_GUBUN   =:P2 '
             +'   and CD_LARGE   =:P3;',
             [HeadStoreCode,
              StoreCode,
              '01',
              TPosButton(ColorPopupMenu.PopupComponent).Temp1,
              ColorToString(TPosButton(ColorPopupMenu.PopupComponent).Color),
              TColorToHex(TPosButton(ColorPopupMenu.PopupComponent).Color)]);

    TPosButton(ColorPopupMenu.PopupComponent).Temp2 := ColorToString(TPosButton(ColorPopupMenu.PopupComponent).Color);
    PluClassButtonClick(TPosButton(ColorPopupMenu.PopupComponent));
  end
  else
  begin
    vPosition := (MenuPage-1) * ((PluMenuX * PluMenuY)-1) + TPosButton(ColorPopupMenu.PopupComponent).Tag + 1;

    ExecQuery('update MS_SMALL '
             +'   set COLOR       = :P5, '
             +'       COLOR_HEX   = :P6, '
             +'       DT_CHANGE   = Now() '
             +' where CD_HEAD     =:P0 '
             +'   and CD_STORE    =:P1 '
             +'   and CD_GUBUN    =:P2 '
             +'   and CD_LARGE    =:P3 '
             +'   and NO_POSITION =:P4;',
             [HeadStoreCode,
              StoreCode,
              '01',
              ClassCode,
              vPosition,
              ColorToString(TPosButton(ColorPopupMenu.PopupComponent).Color),
              TColorToHex(TPosButton(ColorPopupMenu.PopupComponent).Color)]);
  end;

end;

procedure TCodeMenuMasterForm.SaveMemberDcPointRate(aMenu, aCode: String;
  aDcRate, aPointRate: Currency);
begin
  inherited;
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

procedure TCodeMenuMasterForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  //상품작업중에는 링크, 박스등 작업을 못하게 막는다
  PluPager.Enabled          := not isChanged;
  MemberGroupBox.Enabled    := not isNew and (HeadMenuStatus.Caption = '매장메뉴');
  DetailSearchPanel.Enabled := not isChanged;
end;

procedure TCodeMenuMasterForm.SetItemCheckListBox;
begin
  if isLoading then Exit;

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
                 StoreCode]);

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

procedure TCodeMenuMasterForm.PluPagerShow(Sender: TObject);
begin
  inherited;
  SetClassButton;
  PluClassButtonClick(TPosButton(FindComponent('ClassButton0')));
end;

//PLU 분류 버튼 셋팅
procedure TCodeMenuMasterForm.SetClassButton;
var vIndex, vBegin, vEnd :Integer;
begin
  vBegin   := (ClassPage-1) * ((PluClassX * PluClassY)-1)+1;
  vEnd     := vBegin + PluClassX * PluClassY - 2;

  for vIndex := Low(PluClassButton) to High(PluClassButton) do
  begin
    PluClassButton[vIndex].Caption := IntToStr(TPosButton(FindComponent('ClassButton'+ IntToStr(vIndex))).Tag+1);
    PluClassButton[vIndex].Color   := ClassDefaultColor;
    PluClassButton[vIndex].Number.NumberString  := '';
    PluClassButton[vIndex].Temp1   := FormatFloat('00',vBegin+vIndex);
    PluClassButton[vIndex].Temp2   := '';
    PluClassButton[vIndex].Temp3   := 'N';
    PluClassButton[vIndex].Temp10  := '';
    PluClassButton[vIndex].Enabled := false;
  end;


  try
    OpenQuery('select NO_POSITION, '
             +'       CD_LARGE, '
             +'       NM_LARGE, '
             +'       COLOR, '
             +'       YN_BLOCKING '
             +'  from MS_LARGE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN =:P2 '
             +'   and NO_POSITION between :P3 and :P4 '
             +'  order by NO_POSITION ',
             [HeadStoreCode,
              StoreCode,
              '01',
              vBegin,
              vEnd]);

    while not Query.Eof do
    begin
      if ClassPage = 1 then
        vIndex := Query.FieldByName('NO_POSITION').AsInteger
      else
        vIndex := Query.FieldByName('NO_POSITION').AsInteger - vBegin + 1;

      PluClassButton[vIndex-1].Temp1   := Query.FieldByName('CD_LARGE').AsString;
      PluClassButton[vIndex-1].Caption := LineFeed(Query.FieldByName('NM_LARGE').AsString);
      PluClassButton[vIndex-1].Number.NumberString  := Query.FieldByName('CD_LARGE').AsString;
      PluClassButton[vIndex-1].Temp2   := Query.FieldByName('COLOR').AsString;
      PluClassButton[vIndex-1].Temp3   := Ifthen(Query.FieldByName('YN_BLOCKING').AsString='','N',Query.FieldByName('YN_BLOCKING').AsString);
      PluClassButton[vIndex-1].Enabled   := Query.FieldByName('YN_BLOCKING').AsString = 'N';
      if PluClassButton[vIndex-1].Temp2 <> '' then
        PluClassButton[vIndex-1].Color := StringToColor(PluClassButton[vIndex-1].Temp2);
      PluClassButton[vIndex-1].Enabled := PluClassButton[vIndex-1].Number.NumberString <> '';
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ClassPanel.Caption := Format('[ %d Page] ',[ClassPage]);
  MenuPage := 1;
end;


procedure TCodeMenuMasterForm.SetHistoryGridView;
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
             +'       a.PR_SALE_PACKING, '
             +'       a.PR_SALE_MON, '
             +'       a.PR_SALE_TUE, '
             +'       a.PR_SALE_WED, '
             +'       a.PR_SALE_THU, '
             +'       a.PR_SALE_FRI, '
             +'       a.PR_SALE_SAT, '
             +'       a.PR_SALE_SUN, '
             +'       a.PR_SALE_HOLIDAY, '
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
              StoreCode,
              Trim(MenuCodeEdit.Text)]);
    DM.ReadQuery(Query, HistoryGridTableView);
  finally
    Query.Close;
  end;
end;

//PLU 메뉴 버튼 세팅
procedure TCodeMenuMasterForm.SetMenuButton;
var vIndex, vBegin, vEnd :Integer;
begin
  if ClassButton = nil then Exit;

  vBegin   := (MenuPage-1) * ((PluMenuX * PluMenuY)-1)+1;
  vEnd     := vBegin + PluMenuX * PluMenuY - 2;

  PluMenuButtonClear;

  try
    OpenQuery('select a.NO_POSITION, '
             +'       a.CD_LARGE, '
             +'       a.CD_MENU, '
             +'       a.NM_VIEW, '
             +'       b.PR_SALE, '
             +'       a.COLOR, '
             +'       b.CD_PRINTER, '
             +'       a.YN_BLOCKING '
             +'  from MS_SMALL a left outer join '
             +'       MS_MENU  b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU '
             +' where a.CD_HEAD   = :P0 '
             +'   and a.CD_STORE  = :P1 '
             +'   and a.CD_GUBUN  = :P2 '
             +'   and a.CD_LARGE  = :P3 '
             +'   and a.NO_POSITION between :P4 and :P5 '
             +'order by a.NO_POSITION  ',
             [HeadStoreCode,
              StoreCode,
              '01',
              ClassCode,
              vBegin,
              vEnd]);
    while not Query.Eof do
    begin
      if MenuPage = 1 then
        vIndex := Query.FieldByName('NO_POSITION').AsInteger
      else
        vIndex := Query.FieldByName('NO_POSITION').AsInteger - vBegin + 1;


      PluMenuButton[vIndex-1].Temp1   := Query.FieldByName('CD_MENU').AsString;
      PluMenuButton[vIndex-1].Caption := Query.FieldByName('NM_VIEW').AsString;
      PluMenuButton[vIndex-1].Bottom.RightString := FormatFloat(',0', Query.FieldByName('PR_SALE').AsInteger);
      if Query.FieldByName('COLOR').AsString <> '' then
      begin
        PluMenuButton[vIndex-1].Color   := StringToColor(Query.FieldByName('COLOR').AsString);
        PluMenuButton[vIndex-1].Temp2   := Query.FieldByName('COLOR').AsString;        //저장시 사용
      end
      else
        PluMenuButton[vIndex-1].Temp2 := ColorToString(MenuDefaultColor);
      PluMenuButton[vIndex-1].Bottom.LeftString  := Query.FieldByName('CD_PRINTER').AsString;
      PluMenuButton[vIndex-1].Temp3   := Ifthen(Query.FieldByName('YN_BLOCKING').AsString='','N',Query.FieldByName('YN_BLOCKING').AsString);        //저장시 사용
      if Query.FieldByName('YN_BLOCKING').AsString = 'Y' then
      begin
        PluMenuButton[vIndex-1].Number.RightString := '[BK]';
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  MenuPanel.Caption := Format('%s [ %d Page] ',[(ClassButton as TPosButton).Caption, MenuPage]);
  ShowPosMode;
  isChanged         := False;
end;

procedure TCodeMenuMasterForm.SetMultiMode(aMultiMode: Boolean);
var vIndex :Integer;
begin
  inherited;
  //여러상품을 선택했을때는 수정할 수 있는 항목만 Enabled 시킨다
  if aMultiMode then
  begin
    for vIndex := 0 to ComponentCount-1 do
      if (TControl(Components[vIndex]).Parent = TopPanel)
        or (TControl(Components[vIndex]).Parent = CornerPanel)
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
        or (TControl(Components[vIndex]).Parent = CornerPanel)
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

procedure TCodeMenuMasterForm.ShowPosMode;
  function GetNextLineButton(aX,aY, aMenuCode:String):Integer;
  var vIndex :Integer;
      vLine  :String;
  begin
    vLine := IntToStr(StrToInt(aX)+1);
    Result := -1;
    for vIndex := Low(PluMenuButton) to High(PluMenuButton)-1 do
    begin
      if (vLine = PluMenuButton[vIndex].Temp4) and (aY = PluMenuButton[vIndex].Temp5) and (aMenuCode = PluMenuButton[vIndex].Temp1) and (aMenuCode = PluMenuButton[vIndex+1].Temp1) then
      begin
        PluMenuButton[vIndex].Temp8 := 'M';
        Result := vIndex;
        Break;
      end;
    end;
  end;
var vIndex, vIndex1 :Integer;
begin
  for vIndex := Low(PluMenuButton) to High(PluMenuButton) do
  begin
    PluMenuButton[vIndex].Width    := StrToInt(PluMenuButton[vIndex].Temp6);
    PluMenuButton[vIndex].Height   := StrToInt(PluMenuButton[vIndex].Temp7);
    PluMenuButton[vIndex].Temp8    := EmptyStr;   //버튼 합쳤다는 Flag
  end;

  //버튼 합치기
  for vIndex := Low(PluMenuButton) to High(PluMenuButton)-1 do
  begin
    if (PluMenuButton[vIndex].Temp1 = EmptyStr) or (PluMenuButton[vIndex].Temp8 = 'M') or (PluMenuButton[vIndex].Temp3 = 'Y') then Continue;
    //다음버튼과 메뉴코드가 같을때                                                    //같은 라인에 있을때
    if (PluMenuButton[vIndex].Temp1 = PluMenuButton[vIndex+1].Temp1) and (PluMenuButton[vIndex].Temp4 = PluMenuButton[vIndex+1].Temp4)  then
    begin
      //다음 라인버튼도 같은지 체크 (Y, X, 메뉴코드)
      vIndex1 := GetNextLineButton(PluMenuButton[vIndex].Temp4, PluMenuButton[vIndex].Temp5, PluMenuButton[vIndex].Temp1);

      //총 4개 버튼을 합친다
      if vIndex1 > 0 then
      begin
        PluMenuButton[vIndex].Width    := PluMenuButton[vIndex].Width * 2 + 2;
        PluMenuButton[vIndex].Height   := PluMenuButton[vIndex].Height * 2 + 2;
        PluMenuButton[vIndex+1].Temp8  := 'M';
      end
      else
      // 2개버튼을 합친다
      begin
        PluMenuButton[vIndex].Width    := PluMenuButton[vIndex].Width * 2 +2;
        PluMenuButton[vIndex+1].Temp8  := 'M';
      end;
      PluMenuButton[vIndex].BringToFront;
      Continue;
    end;
  end;
end;

function TCodeMenuMasterForm.DoPLUSave: Boolean;
var vPosition : Integer;
begin
  Result := False;
  vPosition := (MenuPage-1) * ((PluMenuX * PluMenuY)-1) + (MenuButton as TPosButton).Tag + 1;

  try
    ExecQuery('delete from MS_SMALL '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN =:P2 '
             +'   and CD_LARGE =:P3 '
             +'   and NO_POSITION =:P4; ',
             [HeadStoreCode,
              StoreCode,
              '01',
              ClassCode,
              vPosition], false);

    ExecQuery('insert into MS_SMALL(CD_HEAD, '
             +'                     CD_STORE, '
             +'                     CD_GUBUN, '
             +'                     CD_LARGE, '
             +'                     CD_MENU, '
             +'                     NM_VIEW, '
             +'                     NO_POSITION, '
             +'                     COLOR, '
             +'                     COLOR_HEX, '
             +'                     YN_BLOCKING, '
             +'                     CD_SAWON_CHG) '
             +'              Values(:P0, '
             +'                     :P1, '
             +'                     :P2, '
             +'                     :P3, '
             +'                     :P4, '
             +'                     :P5, '
             +'                     :P6, '
             +'                     :P7, '
             +'                     :P8, '
             +'                     :P9, '
             +'                     :P10);',
             [HeadStoreCode,
              StoreCode,
              '01',
              ClassCode,
              (MenuButton as TPosButton).Temp1,
              MenuNameEdit.Text,
              vPosition,
              (MenuButton as TPosButton).Temp2,
              TColorToHex((MenuButton as TPosButton).Color),
              (MenuButton as TPosButton).Temp3,
              UserCode], true);

    Result        := True;
    isChanged     := false;
  except
    on E: Exception do begin
    ErrBox(E.Message);
    end;
  end;

end;

procedure TCodeMenuMasterForm.PluMenuButtonCreate;
var vWidth, vHeight, vX, vY, I :Integer;
begin
  SetLength(PluMenuButton, PluMenuX * PluMenuY-1);

  vWidth  := MenuPanel.Width  div PluMenuX;
  vHeight := MenuPanel.Height div PluMenuY - 2 ;
  I := 0;
  for vY := 0 to (PluMenuY-1) do
    for vX := 0 to (PluMenuX-1) do
    begin
      if I > High(PluMenuButton) then Continue;

      PluMenuButton[I] := TPosButton.Create(Self);
      with PluMenuButton[I] do
      begin
        Name        := Format('MenuButton%d',[I]);
        Parent      := MenuPanel;
        TabStop     := false;
        Width       := vWidth-2;
        Height      := vHeight;
        PopupMenu   := ColorPopupMenu;
        Left        := (vX * vWidth) + 5;
        Top         := (vY * vHeight) + (vY * 2)+25;
        Caption     := EmptyStr;
        Color       := MenuDefaultColor;
        BorderColor := MenuBorderColor;
        BorderStyle := pbsSingle;
        BorderInnerColor := clNone;
        Font        := MenuDefaultFont;
        Font.Style  := [fsBold];
        if GetOption(247) = '1' then      // 메뉴번호 기능을 사용합니다.
        begin
          Number.Height     := Trunc(vHeight / 4);
          Number.Font.Color := MenuDefaultFont.Color;
          Number.Font.Name  := '맑은 고딕';
          Number.Font.Size  := MenuDefaultFont.Size-2;
        end
        else
          Number.Height := 0;
        Bottom.Height    := Trunc(vHeight / 4)+3;
        Bottom.Font.Size := MenuDefaultFont.Size-2;
        Cursor           := crHandPoint;
        Temp4            := IntToStr(vY);
        Temp5            := IntToStr(vX);
        Temp6            := IntToStr(vWidth-2);
        Temp7            := IntToStr(vHeight);
        OnClick          := PluMenuButtonClick;
        Tag              := I;
        Inc(I);
      end;
    end;

  MenuPanel.Height := MenuPanel.Height +25;
  MenuPanel.Width  := MenuPanel.Width  + 5;
  //PLU분류 이전페이지, 다음페이지 버튼을 생성한다
  with TPosButton.Create(Self) do
  begin
    Name        := 'MenuPrevButton';
    Parent      := MenuPanel;
    Width       := vWidth div 2 - 2;
    Height      := vHeight;
    Left        := PluMenuButton[High(PluMenuButton)].Left + vWidth;
    Top         := PluMenuButton[High(PluMenuButton)].Top;
    Caption     := '◀';
    Color       := MenuDefaultColor;
    BorderColor := MenuBorderColor;
    BorderStyle := pbsSingle;
    BorderInnerColor := clNone;
    Font        := MenuDefaultFont;
    Font.Style  := [fsBold];
    Cursor      := crHandPoint;
    OnClick     := PluMenuPrevButtonClick;
    Enabled     := true;
  end;

  with TPosButton.Create(Self) do
  begin
    Name        := 'MenuNextButton';
    Parent      := MenuPanel;
    Width       := vWidth div 2 - 2;
    Height      := vHeight;
    Left        := (PluMenuButton[High(PluMenuButton)].Left + vWidth) + + (vWidth div 2);
    Top         := PluMenuButton[High(PluMenuButton)].Top;
    Caption     := '▶';
    Color       := MenuDefaultColor;
    BorderColor := MenuBorderColor;
    BorderStyle := pbsSingle;
    BorderInnerColor := clNone;
    Font        := MenuDefaultFont;
    Font.Style  := [fsBold];
    Cursor      := crHandPoint;
    OnClick     := PluMenuPrevButtonClick;
    Enabled     := true;
  end;
end;

procedure TCodeMenuMasterForm.PluMenuButtonClear;
var vIndex :Integer;
begin
  for vIndex := Low(PluMenuButton) to High(PluMenuButton) do
  begin
    PluMenuButton[vIndex].Number.NumberString := EmptyStr;
    PluMenuButton[vIndex].Enabled             := True;
    PluMenuButton[vIndex].Caption             := IntToStr(PluMenuButton[vIndex].Tag+1);
    PluMenuButton[vIndex].Color               := MenuDefaultColor;
    PluMenuButton[vIndex].Temp1               := '';
    PluMenuButton[vIndex].Temp2               := '';
    PluMenuButton[vIndex].Temp3               := 'N';
    PluMenuButton[vIndex].Bottom.RightString  := '';
    PluMenuButton[vIndex].Bottom.LeftString   := '';
    PluMenuButton[vIndex].Number.RightString  := '';
  end;
end;

procedure TCodeMenuMasterForm.PluMenuButtonClick(Sender: TObject);
begin
  inherited;

  try
    MainPanel.Enabled := False;
    //그리드에서 메뉴선택 후 메뉴버튼 눌렀을때
    if (GridTableView.Controller.FocusedRecordIndex >= 0) then
    begin
      (Sender as TPosButton).Temp1 := MenuCodeEdit.Text;
      MenuButton  := Sender as TPosButton;
      if DoPluSave then
      begin
        (MenuButton as TPosButton).Caption := LineFeed(MenuNameEdit.Text);
        (MenuButton as TPosButton).Bottom.RightString := FormatFloat('#,0', PriceSaleEdit.Value)+' ';
      end
      else
        (Sender as TPosButton).Temp1 := '';
    end;

    ShowPosMode;
    isChanged       := false;
  finally
    MainPanel.Enabled := True;
  end;
end;

procedure TCodeMenuMasterForm.PluMenuDeleteMenuItemClick(Sender: TObject);
var vCode      : String;
    vClassIndex,
    vPosition  : Integer;
begin
  inherited;
  if ClassButton = nil then Exit;

  vClassIndex := (ClassButton as TPosButton).Tag + 1 + ((ClassPage-1) * 9);

  vCode      := FormatFloat('00', vClassIndex);

  vPosition := (MenuPage-1) * ((PluMenuX * PluMenuY)-1) + (MenuButton as TPosButton).Tag + 1;

  if not AskBox('PLU 메뉴를 삭제하겠습니까?') then Exit;

  ExecQuery('delete '
           +'  from MS_SMALL '
           +' where CD_HEAD     =:P0 '
           +'   and CD_STORE    =:P1 '
           +'   and CD_GUBUN    =:P2 '
           +'   and CD_LARGE    =:P3 '
           +'   and NO_POSITION =:P4;',
           [HeadStoreCode,
            StoreCode,
            '01',
            vCode,
            vPosition],true);

  SetMenuButton;
end;

procedure TCodeMenuMasterForm.PluMenuPrevButtonClick(Sender: TObject);
begin
  inherited;
  if Sender = TPosButton(FindComponent('MenuNextButton')) then
    MenuPage  := MenuPage  + 1
  else
    MenuPage  := MenuPage  - 1;
  SetMenuButton;
  TPosButton(FindComponent('MenuPrevButton')).Enabled  := MenuPage  > 1;
  isChanged  := False;
end;

end.
