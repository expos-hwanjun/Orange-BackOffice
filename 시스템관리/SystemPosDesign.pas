/// MS_CODE
//  CD_KIND - 87 ~
//  CD_CODE - 001  : PLU CLASS
//            002  : PLU MENU
//            100  : 주문화면 결제
//            200  : 주문화면 기능
//            300  : 테이블기능버튼
//            400  : 영수증관리 기능
//            500  : 화면디자인

unit SystemPosDesign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ExtCtrls,
  cxStyles, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB,
  MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, cxPCdxBarPopupMenu, cxCheckBox, AdvOfficeSelectors,
  cxFontNameComboBox, cxSpinEdit, Vcl.StdCtrls, cxGroupBox, cxPC, PosButton,
  Vcl.Menus, Vcl.Buttons, AdvPanel, Math, StrUtils, cxButtons, cxButtonEdit,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxGridLevel, cxGrid, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxBarBuiltInMenu, AdvSmoothButton, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, cxNavigator,
  cxCurrencyEdit, idMultiPartFormData, Vcl.Imaging.jpeg,
  dxGDIPlusClasses, dxLayoutContainer, dxLayoutControl, CurvyControls,
  AdvSelectors, AdvEdit, advlued, dxDockControl, dxDockPanel, GDIPFill,
  dxCustomTileControl, dxTileControl, AdvMetroTile, System.ImageList,
  Vcl.ImgList, cxImage, dxDateRanges, dxScrollbarAnnotations, cxImageList,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  TSystemPosDesignForm = class(TInheritEditForm)
    ButtonDesignPageControl: TcxPageControl;
    PluDesignTabSheet: TcxTabSheet;
    OrderAcctTabSheet: TcxTabSheet;
    OrderFunctionTabSheet: TcxTabSheet;
    cxGroupBox20: TcxGroupBox;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label187: TLabel;
    PluClassXEdit: TcxSpinEdit;
    PluClassYEdit: TcxSpinEdit;
    PluClassDownColorPanel: TPanel;
    cxGroupBox26: TcxGroupBox;
    Label198: TLabel;
    Label199: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    PluClassFontSizeEdit: TcxSpinEdit;
    PluClassFontColorPanel: TPanel;
    PluClassFontDownColorPanel: TPanel;
    cxGroupBox23: TcxGroupBox;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    PluMenuXEdit: TcxSpinEdit;
    PluMenuYEdit: TcxSpinEdit;
    PluMenuColorPanel: TPanel;
    cxGroupBox27: TcxGroupBox;
    Label186: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    PluMenuFontSizeEdit: TcxSpinEdit;
    PluMenuFontColorPanel: TPanel;
    Label194: TLabel;
    Label195: TLabel;
    Label197: TLabel;
    OrderAcctXEdit: TcxSpinEdit;
    OrderAcctYEdit: TcxSpinEdit;
    OrderAcctColorPanel: TPanel;
    OrderAcctButtonPanel: TPanel;
    cxGroupBox25: TcxGroupBox;
    Label200: TLabel;
    Label201: TLabel;
    KioskFontDownColorLabel: TLabel;
    OrderAcctFontSizeEdit: TcxSpinEdit;
    OrderAcctFontColorPanel: TPanel;
    ReceiptFunctionTabSheet: TcxTabSheet;
    Label8: TLabel;
    ReceiptFunctionButtonCountEdit: TcxSpinEdit;
    ReceiptFunctionButtonPanel: TPanel;
    cxGroupBox3: TcxGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ReceiptFunctionFontSizeEdit: TcxSpinEdit;
    ReceiptFunctionFontColorPanel: TPanel;
    ReceiptFunctionIconCheckBox: TcxCheckBox;
    PluClassColorPanel: TPanel;
    FunctionKeyPopup: TPopupMenu;
    FunctionKeyPopupDelete: TMenuItem;
    FunctionKeyPopupLine: TMenuItem;
    FunctionKeyPopupBackColor: TMenuItem;
    FunctionKeyPopupForeColor: TMenuItem;
    FunctionKeyPopupColorCopy: TMenuItem;
    FunctionKeyPopupColorPaste: TMenuItem;
    FunctionKeyColorDialog: TColorDialog;
    FunctionKeyDialogPanel: TAdvPanel;
    FunctionKeyDialogFunctionLabel: TLabel;
    FunctionKeyDialogTextLabel: TLabel;
    FunctionKeyDialogSplitLabel: TLabel;
    FunctionKeyDialogSplitButton: TSpeedButton;
    FunctionKeyDialogFunctionEdit: TcxTextEdit;
    FunctionKeyDialogTextEdit: TcxTextEdit;
    FunctionListBox: TListBox;
    DesignFontDialog: TFontDialog;
    OrderAcctFontNameEdit: TcxButtonEdit;
    OrderAcctFontBoldCheckBox: TcxCheckBox;
    PluClassFontNameEdit: TcxButtonEdit;
    PluClassFontBoldCheckBox: TcxCheckBox;
    PluMenuFontNameEdit: TcxButtonEdit;
    PluMenuFontBoldCheckBox: TcxCheckBox;
    ReceiptFunctionFontNameEdit: TcxButtonEdit;
    ReceiptFunctionFontBoldCheckBox: TcxCheckBox;
    Label9: TLabel;
    OrderAcctIconComboBox: TcxComboBox;
    Label10: TLabel;
    PluClassHeightEdit: TcxSpinEdit;
    ButtonToolBarCancelButton: TAdvGlowButton;
    TableFunctionTabSheet: TcxTabSheet;
    DualImageTabSheet: TcxTabSheet;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    AddButton: TAdvGlowButton;
    DeleteButton: TAdvGlowButton;
    DesignTabSheet: TcxTabSheet;
    PosPanelHeightLabel: TLabel;
    PosPanelHeightEdit: TcxCurrencyEdit;
    OpenDialog: TOpenDialog;
    cxGroupBox4: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    GridRowHeightSpinEdit: TcxSpinEdit;
    GridFontSizeSpinEdit: TcxSpinEdit;
    cxLabel1: TcxLabel;
    TitleTypeEdit: TcxSpinEdit;
    cxLabel2: TcxLabel;
    TitleNameEdit: TcxSpinEdit;
    cxLabel3: TcxLabel;
    TitleQtyEdit: TcxSpinEdit;
    cxLabel4: TcxLabel;
    TitlePriceEdit: TcxSpinEdit;
    cxLabel7: TcxLabel;
    TitleAmountEdit: TcxSpinEdit;
    cxLabel8: TcxLabel;
    TitleDcEdit: TcxSpinEdit;
    TitleCaptionEdit: TcxTextEdit;
    TitleCaptionLabel: TcxLabel;
    Label20: TLabel;
    cxLabel10: TcxLabel;
    Label161: TLabel;
    Label165: TLabel;
    DisplayXEdit: TcxCurrencyEdit;
    DisplayYEdit: TcxCurrencyEdit;
    Label19: TLabel;
    PluClassWidthEdit: TcxCurrencyEdit;
    DefaultButton: TAdvGlowButton;
    cxGroupBox5: TcxGroupBox;
    Label22: TLabel;
    FloorWidthEdit: TcxSpinEdit;
    Label18: TLabel;
    FloorColorPanel: TPanel;
    cxGroupBox6: TcxGroupBox;
    Label11: TLabel;
    TableFunctionButtonCountEdit: TcxSpinEdit;
    TableFunctionButtonPanel: TPanel;
    cxGroupBox2: TcxGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    TableFunctionFontSizeEdit: TcxSpinEdit;
    TableFunctionFontColorPanel: TPanel;
    TableFunctionFontNameEdit: TcxButtonEdit;
    TableFunctionFontBoldCheckBox: TcxCheckBox;
    Label21: TLabel;
    TableButtonHeightEdit: TcxSpinEdit;
    cxGroupBox7: TcxGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    FloorFontSizeEdit: TcxSpinEdit;
    FloorFontColorPanel: TPanel;
    FloorFontNameEdit: TcxButtonEdit;
    FloorFontBoldCheckBox: TcxCheckBox;
    FloorHeightEdit: TcxSpinEdit;
    Label26: TLabel;
    TableCreateButton: TAdvGlowButton;
    Label27: TLabel;
    TableFunctionColorPanel: TPanel;
    ReceiptCreateButton: TAdvGlowButton;
    OrderAcctCreateButton: TAdvGlowButton;
    FunctionKeyDialogOKButton: TAdvGlowButton;
    FunctionKeyDialogCancelButton: TAdvGlowButton;
    FunctionKeyDialogDeleteButton: TAdvGlowButton;
    cxGroupBox8: TcxGroupBox;
    PluMenuPriceCheckBox: TcxCheckBox;
    Label28: TLabel;
    PluMenuPriceFontColorPanel: TPanel;
    Label29: TLabel;
    PluMenuPriceFontNameEdit: TcxButtonEdit;
    Label30: TLabel;
    PluMenuPriceFontSizeEdit: TcxSpinEdit;
    PluMenuPriceFontBoldCheckBox: TcxCheckBox;
    Label31: TLabel;
    PluMenuBorderColorPanel: TPanel;
    Label32: TLabel;
    PluClassBorderColorPanel: TPanel;
    PluMenuViewCheckBox: TcxCheckBox;
    Label35: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    TableFunctionIconComboBox: TcxComboBox;
    DarkModeCheckBox: TcxCheckBox;
    Panel1: TPanel;
    Image1WidthEdit: TcxCurrencyEdit;
    Image2WidthEdit: TcxCurrencyEdit;
    Image3WidthEdit: TcxCurrencyEdit;
    Image4WidthEdit: TcxCurrencyEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    HorizontalCheckBox: TcxCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    OrderFunctionXEdit: TcxSpinEdit;
    OrderFunctionYEdit: TcxSpinEdit;
    OrderFunctionColorPanel: TPanel;
    OrderFunctionButtonPanel: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    OrderFunctionFontSizeEdit: TcxSpinEdit;
    OrderFunctionFontColorPanel: TPanel;
    OrderFunctionFontBoldCheckBox: TcxCheckBox;
    OrderFunctionFontNameEdit: TcxButtonEdit;
    OrderFunctionIconIconComboBox: TcxComboBox;
    OrderFunctionCreateButton: TAdvGlowButton;
    Label43: TLabel;
    ReceiptFunctionColorPanel: TPanel;
    Label44: TLabel;
    FunctionKeyButtonColorPanel: TPanel;
    Label45: TLabel;
    FunctionKeyFontColorPanel: TPanel;
    Label46: TLabel;
    FunctionKeyFontSizeEdit: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    DualGridRowHeightSpinEdit: TcxSpinEdit;
    DualGridFontSizeSpinEdit: TcxSpinEdit;
    Label47: TLabel;
    ClassPLUTypeComboBox: TcxComboBox;
    Label48: TLabel;
    PosStyleComboBox: TcxComboBox;
    ImageList: TcxImageList;
    ImageCollection: TcxImageCollection;
    ImageCollectionItem1: TcxImageCollectionItem;
    ImageCollectionItem2: TcxImageCollectionItem;
    ImageCollectionItem3: TcxImageCollectionItem;
    ImageCollectionItem4: TcxImageCollectionItem;
    DesignImage1: TcxImage;
    DesignImage2: TcxImage;
    DesignImage3: TcxImage;
    DesignImage4: TcxImage;
    DesignDialogPanel: TAdvPanel;
    DesignCancelButton: TAdvGlowButton;
    DesignDeleteButton: TAdvGlowButton;
    DesignDialogImage1: TcxImage;
    DesignDialogImage2: TcxImage;
    DesignDialogImage3: TcxImage;
    DesignDialogImage4: TcxImage;
    Label49: TLabel;
    Label50: TLabel;
    OrderAcctBorderColorPanel: TPanel;
    Label51: TLabel;
    OrderFunctionBorderColorPanel: TPanel;
    Label52: TLabel;
    ReceiptFunctionBorderColorPanel: TPanel;
    Label53: TLabel;
    TableFunctionBorderColorPanel: TPanel;
    Label54: TLabel;
    OrderFunctionRoundEdit: TcxSpinEdit;
    Label55: TLabel;
    OrderAcctRoundEdit: TcxSpinEdit;
    ReceiptFunctionRoundEdit: TcxSpinEdit;
    Label56: TLabel;
    TableFunctionRoundEdit: TcxSpinEdit;
    Label57: TLabel;
    OrderAcctShadowCheckBox: TcxCheckBox;
    OrderFunctionShadowCheckBox: TcxCheckBox;
    ReceiptFunctionShadowCheckBox: TcxCheckBox;
    TableFunctionShadowCheckBox: TcxCheckBox;
    procedure EditPropertiesChange(Sender: TObject);
    procedure OrderFunctionCreateButtonClick(Sender: TObject);
    procedure OrderAcctCreateButtonClick(Sender: TObject);
    procedure ReceiptCreateButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FunctionKeyPopupDeleteClick(Sender: TObject);
    procedure FunctionKeyPopupBackColorClick(Sender: TObject);
    procedure FunctionKeyPopupForeColorClick(Sender: TObject);
    procedure FunctionKeyPopupColorCopyClick(Sender: TObject);
    procedure FunctionKeyPopupColorPasteClick(Sender: TObject);
    procedure PluClassColorPanelClick(Sender: TObject);
    procedure FunctionListBoxClick(Sender: TObject);
    procedure FunctionKeyDialogSplitButtonClick(Sender: TObject);
    procedure FunctionKeyDialogDeleteButtonClick(Sender: TObject);
    procedure FunctionKeyDialogOKButtonClick(Sender: TObject);
    procedure FunctionKeyDialogCancelButtonClick(Sender: TObject);
    procedure OrderAcctFontNameComboBoxDblClick(Sender: TObject);
    procedure OrderAcctFontNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure TableCreateButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure PosPanel1ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DefaultButtonClick(Sender: TObject);
    procedure DesignTileControlItemDragEnd(Sender: TdxCustomTileControl;
      AInfo: TdxTileControlDragItemInfo);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure DesignImage1Click(Sender: TObject);
    procedure DesignCancelButtonClick(Sender: TObject);
    procedure DesignDialogImage1DblClick(Sender: TObject);
    procedure DesignDeleteButtonClick(Sender: TObject);
  private
    isPluChanged :Boolean;
    isOrderAcctButtonChanged: Boolean;
    isDesignChanged :Boolean;
    OrderAcctButton: array of array of TAdvSmoothButton;
    isOrderFunctionButtonChanged: Boolean;
    OrderFunctionButton: array of array of TAdvSmoothButton;
    isReceiptFunctionButtonChanged: Boolean;
    ReceiptFunctionButton: array of TAdvSmoothButton;
    isTableFunctionButtonChanged: Boolean;
    TableFunctionButton: array of TAdvSmoothButton;
    FunctionKeyBackColorClipboard, FunctionKeyForeColorClipboard: TColor;

    OrderFunctionHeight,
    OrderFunctionWidth :Integer;

    OrderAcctionHeight,
    OrderAcctionWidth :Integer;

    PosPanelOrder: string;
    function  CreateOrderFunctionButton(aAsk: Boolean): Boolean;
    procedure OrderFunctionButtonClick(Sender: TObject);
    function  CreateOrderAcctButton(aAsk: Boolean): Boolean;
    procedure OrderAcctButtonClick(Sender: TObject);
    function  CreateReceiptFunctionButton(aAsk: Boolean): Boolean;
    procedure ReceiptFunctionButtonClick(Sender: TObject);
    function  CreateTableFunctionButton(aAsk: Boolean): Boolean;
    procedure TableFunctionButtonClick(Sender: TObject);
    procedure GetDesign;
    procedure ShowPosMode;
    procedure ShowPosModeAcct;
  private
    DestStoreCode  :String;      //표준 PLU 사용하는 매장
  protected
    function  DoSave: Boolean; override;                        // 저장
    procedure SetChanged(aChanged: Boolean); override;
  public
    { Public declarations }
  end;

var
  SystemPosDesignForm: TSystemPosDesignForm;

implementation
uses Common, DBModule, Help, Main;
{$R *.dfm}

procedure TSystemPosDesignForm.FormShow(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  ButtonDesignPageControl.ActivePageIndex := 0;

  DestStoreCode := '';
  SetWorkStoreList;

  for vIndex := 0 to WorkStoreList.Count-1 do
  begin
    if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),3,1) = '0' then Continue;
    DestStoreCode := DestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);
  end;
  DestStoreCode := Format(' in (%s) ',[LeftStr(DestStoreCode, Length(DestStoreCode)-1)]);

  GetDesign;
  ConditionToolBarComboBox.Enabled := true;
  isChanged := false;
end;

procedure TSystemPosDesignForm.GetDesign;
var vRow, vCol, vIndex, vIndex2 :Integer;
  vTempArray :Array [1..30] of String;
begin
  try
    OpenQuery('select CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
             +'       NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18,NM_CODE19, NM_CODE20'
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =:P2 ' //''87'' '
             +' order by CD_CODE ',
             [HeadStoreCode,
              Ifthen(Tag=0, StoreCode, StandardStore),
              IntToStr(87+ConditionToolBarComboBox.ItemIndex)]);
    //디자인정보가 없을때 (신규)
    if (ConditionToolBarComboBox.ItemIndex > 0) and Query.Eof then
    begin
      Query.Close;
      ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
               +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18,NM_CODE19, NM_CODE20) '
               +'             select CD_HEAD, CD_STORE, :P2, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
               +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18,NM_CODE19, NM_CODE20 '
               +'               from MS_CODE '
               +'              where CD_HEAD  =:P0 '
               +'                and CD_STORE =:P1 '
               +'                and CD_KIND  =''87'' ',
               [HeadStoreCode,
                Ifthen(Tag=0, StoreCode, StandardStore),
                IntToStr(87+ConditionToolBarComboBox.ItemIndex)],true);

      OpenQuery('select CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
               +'       NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18, NM_CODE19, NM_CODE20'
               +'  from MS_CODE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_KIND  =:P2 '
               +' order by CD_CODE ',
               [HeadStoreCode,
                Ifthen(Tag=0, StoreCode, StandardStore),
                IntToStr(87+ConditionToolBarComboBox.ItemIndex)]);

      PosPanelOrder := '1230';

      for vIndex := 1 to 4 do
      begin
        if Copy(PosPanelOrder,vIndex,1) = '0' then
          TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Graphic := nil
        else
          TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Assign(ImageCollection.Items.Items[StrToInt(PosPanelOrder[vIndex])-1].Picture.Graphic);
        TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Tag := StrToInt(Copy(PosPanelOrder,vIndex,1));
      end;
    end;

    Image1WidthEdit.Value := 243;
    Image2WidthEdit.Value := 242;
    Image3WidthEdit.Value := 517;
    Image4WidthEdit.Value := 0;

    for vIndex := Low(OrderAcctButton) to High(OrderAcctButton) do
    begin
      for vIndex2 := Low(OrderAcctButton[vIndex]) to High(OrderAcctButton[vIndex]) do
        OrderAcctButton[vIndex][vIndex2].Free;
      OrderAcctButton[vIndex] := nil;
    end;
    SetLength(OrderAcctButton,0,0);

    for vIndex := Low(OrderFunctionButton) to High(OrderFunctionButton) do
    begin
      for vIndex2 := Low(OrderFunctionButton[vIndex]) to High(OrderFunctionButton[vIndex]) do
        OrderFunctionButton[vIndex][vIndex2].Free;
      OrderFunctionButton[vIndex] := nil;
    end;
    SetLength(OrderFunctionButton,0,0);

    for vIndex := Low(ReceiptFunctionButton) to High(ReceiptFunctionButton) do
    begin
      ReceiptFunctionButton[vIndex].Free;
      ReceiptFunctionButton[vIndex] := nil;
    end;
    SetLength(ReceiptFunctionButton,0);

    for vIndex := Low(TableFunctionButton) to High(TableFunctionButton) do
    begin
      TableFunctionButton[vIndex].Free;
      TableFunctionButton[vIndex] := nil;
    end;
    SetLength(TableFunctionButton,0);


    while not Query.Eof do
    begin
      case StoI(Query.FieldByName('CD_CODE').AsString) of
        1 : //PLU Class
        begin
          PluClassXEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          PluClassYEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,2);
          PluClassColorPanel.Color         := StringToColor(Query.FieldByName('NM_CODE3').AsString);
          PluClassDownColorPanel.Color     := StringToColor(Query.FieldByName('NM_CODE4').AsString);
          PluClassFontNameEdit.Text        := Query.FieldByName('NM_CODE5').AsString;
          PluClassFontSizeEdit.Value       := StrToIntDef(Query.FieldByName('NM_CODE6').AsString,10);
          PluClassFontBoldCheckBox.Checked := Query.FieldByName('NM_CODE7').AsString = '1';
          PluClassFontColorPanel.Color     := StringToColor(Query.FieldByName('NM_CODE8').AsString);
          PluClassFontDownColorPanel.Color := StringToColor(Query.FieldByName('NM_CODE9').AsString);
          ClassPLUTypeComboBox.ItemIndex   := StrToIntDef(Query.FieldByName('NM_CODE10').AsString,0);
          PluClassHeightEdit.Value         := StrToIntDef(Query.FieldByName('NM_CODE11').AsString,40);
          PluClassWidthEdit.Value          := StrToIntDef(Query.FieldByName('NM_CODE12').AsString,517);
          PluClassBorderColorPanel.Color   := StringToColorDef(Query.FieldByName('NM_CODE13').AsString,clWhite);
          PluClassColorPanel.Tag           := 0;
        end;
        2 : //PLU Menu
        begin
          PluMenuXEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          PluMenuYEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,5);
          PluMenuColorPanel.Color         := StringToColor(Query.FieldByName('NM_CODE3').AsString);
          PluMenuColorPanel.Hint          := Query.FieldByName('NM_CODE3').AsString;
          PluMenuFontNameEdit.Text        := Query.FieldByName('NM_CODE4').AsString;
          PluMenuFontSizeEdit.Value       := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,10);
          PluMenuFontBoldCheckBox.Checked := Query.FieldByName('NM_CODE6').AsString = '1';
          PluMenuFontColorPanel.Color     := StringToColor(Query.FieldByName('NM_CODE7').AsString);
          PluMenuPriceCheckBox.Checked    := Query.FieldByName('NM_CODE8').AsString = '1';
          PluMenuColorPanel.Tag           := 0;
          PluMenuPriceFontNameEdit.Text        := Query.FieldByName('NM_CODE9').AsString;
          PluMenuPriceFontSizeEdit.Value       := StrToIntDef(Query.FieldByName('NM_CODE10').AsString,10);
          PluMenuPriceFontBoldCheckBox.Checked := Query.FieldByName('NM_CODE11').AsString = '1';
          PluMenuPriceFontColorPanel.Color     := StringToColorDef(Query.FieldByName('NM_CODE12').AsString, clWhite);
          PluMenuBorderColorPanel.Color        := StringToColorDef(Query.FieldByName('NM_CODE13').AsString, clWhite);
          PluMenuViewCheckBox.Checked      := Query.FieldByName('NM_CODE14').AsString = '1';
        end;
        100 : //주문화면 결제
        begin
          OrderAcctXEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          OrderAcctYEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,2);
          OrderAcctColorPanel.Color         := StringToColor(Query.FieldByName('NM_CODE3').AsString);
          OrderAcctFontNameEdit.Text        := Query.FieldByName('NM_CODE4').AsString;
          OrderAcctFontSizeEdit.Value       := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,10);
          OrderAcctFontBoldCheckBox.Checked := Query.FieldByName('NM_CODE6').AsString = '1';
          OrderAcctFontColorPanel.Color     := StringToColor(Query.FieldByName('NM_CODE7').AsString);
          OrderAcctIconComboBox.ItemIndex   := StoI(Query.FieldByName('NM_CODE8').AsString);
          OrderAcctBorderColorPanel.Color   := StringToColorDef(Query.FieldByName('NM_CODE9').AsString, OrderAcctColorPanel.Color);
          OrderAcctRoundEdit.Value          := StrToIntDef(Query.FieldByName('NM_CODE10').AsString,0);
          OrderAcctShadowCheckBox.Checked   := Query.FieldByName('NM_CODE11').AsString = 'Y';
          OrderAcctCreateButton.Click;
        end;
        101..199 :
        begin
          if Assigned(OrderAcctButton) and (Length(OrderAcctButton) > 0) then
          begin
            vRow := StoI(Query.FieldByName('NM_CODE7').AsString);
            vCol := StoI(Query.FieldByName('NM_CODE8').AsString);
            if Assigned(OrderAcctButton[vRow, vCol]) then
            begin
              OrderAcctButton[vRow, vCol].Hint         := Query.FieldByName('NM_CODE1').AsString;
              OrderAcctButton[vRow, vCol].HelpKeyword  := Query.FieldByName('NM_CODE2').AsString;
              OrderAcctButton[vRow, vCol].Caption      := LineFeed(Query.FieldByName('NM_CODE3').AsString);
              OrderAcctButton[vRow, vCol].Color    := StringToColor(Query.FieldByName('NM_CODE4').AsString);
              OrderAcctButton[vRow, vCol].Appearance.Font.Color   := StringToColor(Query.FieldByName('NM_CODE5').AsString);
              if Query.FieldByName('NM_CODE6').AsString = '1' then
                OrderAcctButton[vRow, vCol].Appearance.Font.Style := [fsBold];
              OrderAcctButton[vRow, vCol].Appearance.Font.Size    := Ifthen(StoI(Query.FieldByName('NM_CODE9').AsString)<=5 ,OrderAcctFontSizeEdit.Value, StoI(Query.FieldByName('NM_CODE9').AsString));
            end;
          end;
          ShowPosModeAcct;
        end;
        200 : //주문화면 기능
        begin
          OrderFunctionXEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          OrderFunctionYEdit.Value              := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,2);
          OrderFunctionColorPanel.Color         := StringToColor(Query.FieldByName('NM_CODE3').AsString);
          OrderFunctionFontNameEdit.Text        := Query.FieldByName('NM_CODE4').AsString;
          OrderFunctionFontSizeEdit.Value       := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,10);
          OrderFunctionFontBoldCheckBox.Checked := Query.FieldByName('NM_CODE6').AsString = '1';
          OrderFunctionFontColorPanel.Color     := StringToColor(Query.FieldByName('NM_CODE7').AsString);
          OrderFunctionIconIconComboBox.ItemIndex     := StoI(Query.FieldByName('NM_CODE8').AsString);
          OrderFunctionBorderColorPanel.Color   := StringToColorDef(Query.FieldByName('NM_CODE9').AsString, OrderFunctionColorPanel.Color);
          OrderFunctionRoundEdit.Value          := StrToIntDef(Query.FieldByName('NM_CODE10').AsString,0);
          OrderFunctionShadowCheckBox.Checked   := Query.FieldByName('NM_CODE11').AsString = 'Y';
          OrderFunctionCreateButton.Click;
        end;
        201..299 :
        begin
          if Assigned(OrderFunctionButton) and (Length(OrderFunctionButton) > 0) then
          begin
            vRow := StoI(Query.FieldByName('NM_CODE7').AsString);
            vCol := StoI(Query.FieldByName('NM_CODE8').AsString);
            if Assigned(OrderFunctionButton[vRow, vCol]) then
            begin
              OrderFunctionButton[vRow, vCol].Hint         := Query.FieldByName('NM_CODE1').AsString;
              OrderFunctionButton[vRow, vCol].HelpKeyword  := Query.FieldByName('NM_CODE2').AsString;
              OrderFunctionButton[vRow, vCol].Caption      := LineFeed(Query.FieldByName('NM_CODE3').AsString);
              OrderFunctionButton[vRow, vCol].Color    := StringToColor(Query.FieldByName('NM_CODE4').AsString);
              OrderFunctionButton[vRow, vCol].Appearance.Font.Color   := StringToColor(Query.FieldByName('NM_CODE5').AsString);
              if Query.FieldByName('NM_CODE6').AsString = '1' then
                OrderFunctionButton[vRow, vCol].Appearance.Font.Style := [fsBold];
              OrderFunctionButton[vRow, vCol].Appearance.Font.Size    := Ifthen(StoI(Query.FieldByName('NM_CODE9').AsString)<=5,OrderFunctionFontSizeEdit.Value, StoI(Query.FieldByName('NM_CODE9').AsString));
            end;
          end;
          ShowPosMode;
        end;
        300 : //테이블관리관리 기능
        begin
          TableFunctionButtonCountEdit.Value      := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          TableFunctionColorPanel.Color           := StringToColor(Query.FieldByName('NM_CODE2').AsString);
          TableFunctionFontNameEdit.Text          := Query.FieldByName('NM_CODE3').AsString;
          TableFunctionFontSizeEdit.Text          := Query.FieldByName('NM_CODE4').AsString;
          TableFunctionFontBoldCheckBox.Checked   := Query.FieldByName('NM_CODE5').AsString = '1';
          TableFunctionFontColorPanel.Color       := StringToColor(Query.FieldByName('NM_CODE6').AsString);
          TableFunctionIconComboBox.ItemIndex     := StrToIntDef(Query.FieldByName('NM_CODE7').AsString,0);
          TableButtonHeightEdit.Value             := StrToIntDef(Query.FieldByName('NM_CODE8').AsString,65);
          FloorHeightEdit.Value                   := StrToIntDef(Query.FieldByName('NM_CODE9').AsString,72);
          FloorWidthEdit.Value                    := StrToIntDef(Query.FieldByName('NM_CODE10').AsString,124);
          FloorColorPanel.Color                   := StringToColor(Query.FieldByName('NM_CODE11').AsString);
          FloorFontNameEdit.Text                  := Query.FieldByName('NM_CODE12').AsString;
          FloorFontSizeEdit.Value                 := StrToIntDef(Query.FieldByName('NM_CODE13').AsString,13);
          FloorFontBoldCheckBox.Checked           := Query.FieldByName('NM_CODE14').AsString = '1';
          FloorFontColorPanel.Color               := StringToColor(Query.FieldByName('NM_CODE15').AsString);
          DarkModeCheckBox.Checked                := Query.FieldByName('NM_CODE16').AsString = '1';
          HorizontalCheckBox.Checked              := Query.FieldByName('NM_CODE17').AsString = '1';
          TableFunctionBorderColorPanel.Color     := StringToColorDef(Query.FieldByName('NM_CODE18').AsString,TableFunctionColorPanel.Color);
          TableFunctionRoundEdit.Value            := StrToIntDef(Query.FieldByName('NM_CODE19').AsString,0);
          TableFunctionShadowCheckBox.Checked    := Query.FieldByName('NM_CODE20').AsString = 'Y';

          TableCreateButton.Click;
        end;
        301..399 :
        begin
          if Assigned(TableFunctionButton) and (Length(TableFunctionButton) > 0) then
          begin
            vCol := StoI(Query.FieldByName('NM_CODE7').AsString);
            if Assigned(TableFunctionButton[vCol]) and (vCol < TableFunctionButtonCountEdit.Value)  then
            begin
              TableFunctionButton[vCol].Hint         := Query.FieldByName('NM_CODE1').AsString;  //temp1
              TableFunctionButton[vCol].HelpKeyword  := Query.FieldByName('NM_CODE2').AsString;  //temp2
              TableFunctionButton[vCol].Caption      := LineFeed(Query.FieldByName('NM_CODE3').AsString);
              TableFunctionButton[vCol].Color        := TableFunctionColorPanel.Color;
              TableFunctionButton[vCol].Appearance.Font.Color   := StringToColor(Query.FieldByName('NM_CODE5').AsString);
              if Query.FieldByName('NM_CODE6').AsString = '1' then
                TableFunctionButton[vCol].Appearance.Font.Style := [fsBold];
              TableFunctionButton[vCol].Appearance.Font.Size   := Ifthen(StoI(Query.FieldByName('NM_CODE8').AsString)<=5,TableFunctionFontSizeEdit.Value, StoI(Query.FieldByName('NM_CODE8').AsString));
            end;
          end;
          TableCreateButton.Click;
        end;
        400 : //영수증관리 기능
        begin
          ReceiptFunctionButtonCountEdit.Value      := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,5);
          ReceiptFunctionColorPanel.Color           := StringToColor(Query.FieldByName('NM_CODE2').AsString);
          ReceiptFunctionFontNameEdit.Text          := Query.FieldByName('NM_CODE3').AsString;
          ReceiptFunctionFontSizeEdit.Text          := Query.FieldByName('NM_CODE4').AsString;
          ReceiptFunctionFontBoldCheckBox.Checked   := Query.FieldByName('NM_CODE5').AsString = '1';
          ReceiptFunctionFontColorPanel.Color       := StringToColor(Query.FieldByName('NM_CODE6').AsString);
          ReceiptFunctionIconCheckBox.Checked       := Query.FieldByName('NM_CODE7').AsString = '1';
          ReceiptFunctionBorderColorPanel.Color     := StringToColorDef(Query.FieldByName('NM_CODE8').AsString,ReceiptFunctionColorPanel.Color);
          ReceiptFunctionRoundEdit.Value            := StrToIntDef(Query.FieldByName('NM_CODE9').AsString,0);
          ReceiptFunctionShadowCheckBox.Checked     := Query.FieldByName('NM_CODE10').AsString = 'Y';
          ReceiptCreateButton.Click;
        end;
        401..499 :
        begin
          if Assigned(ReceiptFunctionButton) and (Length(ReceiptFunctionButton) > 0) then
          begin
            vCol := StoI(Query.FieldByName('NM_CODE7').AsString);
            if Assigned(ReceiptFunctionButton[vCol]) then
            begin
              ReceiptFunctionButton[vCol].Hint         := Query.FieldByName('NM_CODE1').AsString;  //temp1
              ReceiptFunctionButton[vCol].HelpKeyword  := Query.FieldByName('NM_CODE2').AsString;  //temp2
              ReceiptFunctionButton[vCol].Caption      := LineFeed(Query.FieldByName('NM_CODE3').AsString);
              ReceiptFunctionButton[vCol].Color        := StringToColor(Query.FieldByName('NM_CODE4').AsString);
              ReceiptFunctionButton[vCol].Appearance.Font.Color   := StringToColor(Query.FieldByName('NM_CODE5').AsString);
              if Query.FieldByName('NM_CODE6').AsString = '1' then
                ReceiptFunctionButton[vCol].Appearance.Font.Style := [fsBold];
              ReceiptFunctionButton[vCol].Appearance.Font.Size   := Ifthen(StoI(Query.FieldByName('NM_CODE8').AsString)<=5,ReceiptFunctionFontSizeEdit.Value, StoI(Query.FieldByName('NM_CODE8').AsString));
            end;
          end;
        end;
        500 : //화면디자인
        begin
          DisplayXEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,1024);
          DisplayYEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,768);
          PosPanelOrder := Query.FieldByName('NM_CODE3').AsString;
          PosPanelHeightEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE4').AsString,190);
          if (PosPanelOrder = '') or (Length(PosPanelOrder) <> 4) then
            PosPanelOrder := '1230';

          for vIndex := 1 to 4 do
          begin
            if Copy(PosPanelOrder,vIndex,1) = '0' then
            begin
              TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Graphic := nil;
              TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Tag := 0;
            end
            else
            begin
              TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Assign(ImageCollection.Items.Items[StrToInt(PosPanelOrder[vIndex])-1].Picture.Graphic);
              TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Tag := StrToInt(Copy(PosPanelOrder,vIndex,1))-1;
            end;

          end;
          Image1WidthEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,243);
          Image2WidthEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE6').AsString,242);
          Image3WidthEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE7').AsString,517);
          Image4WidthEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE8').AsString,200);

          GridFontSizeSpinEdit.Value  := StrToIntDef(Query.FieldByName('NM_CODE9').AsString,11);
          GridRowHeightSpinEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE10').AsString,28);

          TitleCaptionEdit.Text := Query.FieldByName('NM_CODE11').AsString;
          TitleTypeEdit.Value   := StrToIntDef(Query.FieldByName('NM_CODE12').AsString,52);
          TitleNameEdit.Value   := StrToIntDef(Query.FieldByName('NM_CODE13').AsString,194);
          TitleQtyEdit.Value    := StrToIntDef(Query.FieldByName('NM_CODE14').AsString,44);
          TitlePriceEdit.Value  := StrToIntDef(Query.FieldByName('NM_CODE15').AsString,76);
          TitleAmountEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE16').AsString,83);
          TitleDcEdit.Value     := StrToIntDef(Query.FieldByName('NM_CODE17').AsString,0);

          DualGridFontSizeSpinEdit.Value  := StrToIntDef(Query.FieldByName('NM_CODE18').AsString,12);
          DualGridRowHeightSpinEdit.Value := StrToIntDef(Query.FieldByName('NM_CODE19').AsString,30);
          PosStyleComboBox.ItemIndex      := StrToIntDef(Query.FieldByName('NM_CODE20').AsString,0);
        end;
      end;
      Query.Next;
    end;
    Query.Close;
    OpenQuery('select Cast(CD_CODE as INT) as SEQ,  NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =''96'' ',
             [HeadStoreCode,
              Ifthen(Tag=0, StoreCode, StandardStore)]);

    DM.ReadQuery(Query, GridTableView);
  finally
    FinishQuery;
    ButtonToolBarCancelButton.Enabled := true;
    ButtonToolBarSearchButton.Enabled := false;
    isDesignChanged                   := false;
    isPluChanged                      := false;
    isOrderAcctButtonChanged          := false;
    isDesignChanged                   := false;
    isOrderFunctionButtonChanged      := false;
    isTableFunctionButtonChanged      := false;
    isReceiptFunctionButtonChanged    := false;
    ButtonDesignPageControl.ActivePageIndex := 0;
    ButtonDesignPageControl.Enabled   := true;
    isChanged := false;
  end;
end;

//주문화면 결제버튼 생성
procedure TSystemPosDesignForm.AddButtonClick(Sender: TObject);
var Files: TSearchRec;
    vIndex : Integer;
    vHttp: TIdHTTP;
    vParams: TIdMultiPartFormDataStream;
    vResponse: string;
    vURL :String;
    vExist :Boolean;
    vImage :TImage;
begin

  if not OpenDialog.Execute then exit;

  FindFirst(OpenDialog.FileName,faArchive,Files);
  if RightStr(OpenDialog.FileName,3) = 'png' then
    try
      vImage := TImage.Create(self);
      vImage.Picture.LoadFromFile(OpenDialog.FileName);
      if (vImage.Width > 1024) or (vImage.Height > 768) then
      begin
        MsgBox('최대 이미지 크기는 최대 1024 * 768 입니다');
        Exit;
      end;
    finally
      vImage.Free;
    end;
  if Length(AnsiString(Files.Name)) <> Length(Files.Name)  then
  begin
    MsgBox('영문 화일명만 가능합니다');
    Exit;
  end;

  vExist := false;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, 1] = Files.Name then
    begin
      vExist := true;
      MsgBox('이미 등록된 화일입니다');
      Break;
    end;
  end;

  if vExist then Exit;

  try
    vHttp   := TIdHTTP.Create;
    vParams := TIdMultiPartFormDataStream.Create;
    vURL    := GetHttpURL+'Action_FileUp';

    try
      Screen.Cursor := crArrow;
      if Tag = 0 then
        vHttp.Request.CustomHeaders.AddValue('COMP_ID',Format('%s/%s',[HeadStoreCode,StoreCode]))
      else
        vHttp.Request.CustomHeaders.AddValue('COMP_ID',HeadStoreCode);
      vHttp.Request.CustomHeaders.AddValue('JOB_GBN','U');
      vParams.AddFile('0', OpenDialog.FileName);
      vResponse := vHttp.Post(vURL, vParams);
      if vResponse <> 'OK' then
      begin
        Screen.Cursor := crDefault;
        ErrBox('화일전송실패!!!'#13+ vResponse);
        Exit;
      end;
    except
      on E:Exception do
      begin
        Screen.Cursor := crDefault;
        ErrBox(E.Classname + ': '+ E.Message);
      end;
    end;
  finally
    vHttp.Disconnect;
    Screen.Cursor := crDefault;
    vParams.Free;
    vHttp.Free;
  end;

  GridTableView.DataController.AppendRecord;
  GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := IntToStr(GridTableView.DataController.RecordCount);
  GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := Files.Name;
  GridTableView.DataController.PostEditingData;

  if Tag = 0 then
    ExecQuery('insert into MS_CODE(CD_HEAD, '
             +'                    CD_STORE, '
             +'                    CD_KIND, '
             +'                    CD_CODE, '
             +'                    NM_CODE1, '
             +'                    NM_CODE2) '
             +'             values(:P0, '
             +'                    :P1, '
             +'                    ''96'', '
             +'                    (select LPad((Cast(Ifnull(Max(CD_CODE),''0'') as int) + 1),3,''0'')   '
             +'                       from MS_CODE as s '
             +'                      where CD_HEAD =:P0 '
             +'                        and CD_STORE =:P1 '
             +'                        and CD_KIND  =''96''), '
             +'                    :P2,'
             +'                    ''STORE'') '
             +' ON DUPLICATE KEY UPDATE DT_CHANGE = Now();',
             [HeadStoreCode,
              StoreCode,
              Files.Name],true)
  else
    ExecQuery('insert into MS_CODE(CD_HEAD, '
             +'                    CD_STORE, '
             +'                    CD_KIND, '
             +'                    CD_CODE, '
             +'                    NM_CODE1, '
             +'                    NM_CODE2) '
             +'             values(:P0, '
             +'                    :P1, '
             +'                    ''96'', '
             +'                    (select LPad((Cast(Ifnull(Max(CD_CODE),''0'') as int) + 1),3,''0'')   '
             +'                       from MS_CODE as s '
             +'                      where CD_HEAD =:P0 '
             +'                        and CD_STORE =:P1 '
             +'                        and CD_KIND  =''96''), '
             +'                    :P2,'
             +'                    ''HEAD'') '
             +' ON DUPLICATE KEY UPDATE DT_CHANGE = Now();',
             [HeadStoreCode,
              StandardStore,
              Files.Name],true);
end;

procedure TSystemPosDesignForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  ConditionToolBarComboBox.Enabled  := true;
  ButtonToolBarSearchButton.Enabled := true;
  ButtonDesignPageControl.ActivePageIndex := 0;
  ButtonDesignPageControl.Enabled   := false;
  GetDesign;
  ConditionToolBarComboBox.Enabled  := true;
  isChanged := false;
end;

procedure TSystemPosDesignForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;
  GetDesign;

end;

procedure TSystemPosDesignForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  GetDesign;
end;

function TSystemPosDesignForm.CreateOrderAcctButton(aAsk: Boolean): Boolean;
var
  vIndex, vIndex2: Integer;
  vWidth, vHeight: Integer;
begin
  Result := false;

  // 기존 버튼을 삭제한다
  if Assigned(OrderAcctButton) then
  begin
    // 기존 버튼과 수가 같으면 그냥 끝낸다
    if ((Length(OrderAcctButton) = Trunc(OrderAcctXEdit.Value)) and (Length(OrderAcctButton[0]) = Trunc(OrderAcctYEdit.Value))) then
      Exit;

    // 기존 버튼 개수보다 작을 때 적용할지 물어본다
    if aAsk and
       ((Length(OrderAcctButton) > Trunc(OrderAcctYEdit.Value)) or (Length(OrderAcctButton[0]) > Trunc(OrderAcctXEdit.Value))) then
      if not AskBox('기존 등록된 버튼 수보다 적습니다.'#13'적용하시겠습니까?') then
        Exit;

    // 기존 버튼을 지운다
    for vIndex := Low(OrderAcctButton) to High(OrderAcctButton) do
    begin
      for vIndex2 := Low(OrderAcctButton[vIndex]) to High(OrderAcctButton[vIndex]) do
        OrderAcctButton[vIndex][vIndex2].Free;
      SetLength(OrderAcctButton[vIndex], 0);
      OrderAcctButton[vIndex] := nil;
    end;
    SetLength(OrderAcctButton, 0);
    OrderAcctButton := nil;
  end;

  vWidth  := OrderAcctButtonPanel.Width  div Trunc(OrderAcctXEdit.Value);// - (Trunc(OrderFunctionXEdit.Value)-1);
  vHeight := OrderAcctButtonPanel.Height div Trunc(OrderAcctYEdit.Value);// - (Trunc(OrderFunctionYEdit.Value)-1);

  // 버튼을 새로 만든다
  SetLength(OrderAcctButton, Trunc(OrderAcctYEdit.Value));
  for vIndex := Low(OrderAcctButton) to High(OrderAcctButton) do
  begin
    SetLength(OrderAcctButton[vIndex], Trunc(OrderAcctXEdit.Value));
    for vIndex2 := Low(OrderAcctButton[vIndex]) to High(OrderAcctButton[vIndex]) do
    begin
      OrderAcctButton[vIndex][vIndex2] := TAdvSmoothButton.Create(self);
      OrderAcctButton[vIndex][vIndex2].Name        := 'OrderAcct'+FormatFloat('00', vIndex)+FormatFloat('00', vIndex2);
      OrderAcctButton[vIndex][vIndex2].Caption     := '';
      OrderAcctButton[vIndex][vIndex2].Parent      := OrderAcctButtonPanel;
      OrderAcctButton[vIndex][vIndex2].Width       := vWidth;
      OrderAcctButton[vIndex][vIndex2].Height      := vHeight;
      OrderAcctButton[vIndex][vIndex2].Left        := (vIndex2 * vWidth) + (vIndex2 * 1);
      OrderAcctButton[vIndex][vIndex2].Top         := (vIndex * vHeight) + (vIndex * 1);
      OrderAcctButton[vIndex][vIndex2].Appearance.SimpleLayout := true;
      OrderAcctButton[vIndex][vIndex2].Appearance.SimpleLayoutBorder := true;
      OrderAcctButton[vIndex][vIndex2].Appearance.Rounding     := Trunc(OrderAcctRoundEdit.Value);
      OrderAcctButton[vIndex][vIndex2].Appearance.Font.Name   := OrderAcctFontNameEdit.Text;
      OrderAcctButton[vIndex][vIndex2].Appearance.Font.Size   := Trunc(OrderAcctFontSizeEdit.Value);
      OrderAcctButton[vIndex][vIndex2].Appearance.Font.Color  := OrderAcctFontColorPanel.Color;
      if OrderAcctFontBoldCheckBox.Checked then
        OrderAcctButton[vIndex][vIndex2].Appearance.Font.Style  := [fsBold];
      OrderAcctButton[vIndex][vIndex2].Color   := OrderAcctColorPanel.Color;
      OrderAcctButton[vIndex][vIndex2].BevelColor  := OrderAcctBorderColorPanel.Color;
      OrderAcctButton[vIndex][vIndex2].PopupMenu   := FunctionKeyPopup;
      OrderAcctButton[vIndex][vIndex2].OnClick     := OrderAcctButtonClick;
    end;
  end;

  OrderAcctionHeight := vHeight;
  OrderAcctionWidth  := vWidth;;


  // 저장할 수 있게 변경 되었다는 표시
  if aAsk then
  begin
    isOrderAcctButtonChanged := true;
    isChanged            := true;
  end;
  Result := true;
end;

//주문화면 기능버튼 생성
function TSystemPosDesignForm.CreateOrderFunctionButton(aAsk: Boolean): Boolean;
var
  vIndex, vIndex2: Integer;
  vWidth, vHeight: Integer;
begin
  Result := false;

  // 기존 버튼을 삭제한다
  if Assigned(OrderFunctionButton) then
  begin
    // 기존 버튼과 수가 같으면 그냥 끝낸다
    if ((Length(OrderFunctionButton) = Trunc(OrderFunctionXEdit.Value)) and (Length(OrderFunctionButton[0]) = Trunc(OrderFunctionYEdit.Value))) then
      Exit;

    // 기존 버튼 개수보다 작을 때 적용할지 물어본다
    if aAsk and
       ((Length(OrderFunctionButton) > Trunc(OrderFunctionYEdit.Value)) or (Length(OrderFunctionButton[0]) > Trunc(OrderFunctionXEdit.Value))) then
      if not AskBox('기존 등록된 버튼 수보다 적습니다.'#13'적용하시겠습니까?') then
        Exit;

    // 기존 버튼을 지운다
    for vIndex := Low(OrderFunctionButton) to High(OrderFunctionButton) do
    begin
      for vIndex2 := Low(OrderFunctionButton[vIndex]) to High(OrderFunctionButton[vIndex]) do
        OrderFunctionButton[vIndex][vIndex2].Free;
      SetLength(OrderFunctionButton[vIndex], 0);
      OrderFunctionButton[vIndex] := nil;
    end;
    SetLength(OrderFunctionButton, 0);
    OrderFunctionButton := nil;
  end;

  vWidth  := OrderFunctionButtonPanel.Width  div Trunc(OrderFunctionXEdit.Value);// - (Trunc(OrderFunctionXEdit.Value)-1);
  vHeight := OrderFunctionButtonPanel.Height div Trunc(OrderFunctionYEdit.Value);// - (Trunc(OrderFunctionYEdit.Value)-1);

  // 버튼을 새로 만든다
  SetLength(OrderFunctionButton, Trunc(OrderFunctionYEdit.Value));
  for vIndex := Low(OrderFunctionButton) to High(OrderFunctionButton) do
  begin
    SetLength(OrderFunctionButton[vIndex], Trunc(OrderFunctionXEdit.Value));
    for vIndex2 := Low(OrderFunctionButton[vIndex]) to High(OrderFunctionButton[vIndex]) do
    begin
      OrderFunctionButton[vIndex][vIndex2] := TAdvSmoothButton.Create(self);
      OrderFunctionButton[vIndex][vIndex2].Name        := 'OrderFunction'+FormatFloat('00', vIndex)+FormatFloat('00', vIndex2);
      OrderFunctionButton[vIndex][vIndex2].Caption     := '';
      OrderFunctionButton[vIndex][vIndex2].Parent      := OrderFunctionButtonPanel;
      OrderFunctionButton[vIndex][vIndex2].Width       := vWidth;
      OrderFunctionButton[vIndex][vIndex2].Height      := vHeight;
      OrderFunctionButton[vIndex][vIndex2].Left        := (vIndex2 * vWidth) + (vIndex2 * 1);
      OrderFunctionButton[vIndex][vIndex2].Top         := (vIndex * vHeight) + (vIndex * 1);
      OrderFunctionButton[vIndex][vIndex2].Appearance.SimpleLayout := true;
      OrderFunctionButton[vIndex][vIndex2].Appearance.SimpleLayoutBorder := true;
      OrderFunctionButton[vIndex][vIndex2].Appearance.Rounding    := Trunc(OrderFunctionRoundEdit.Value) ;
      OrderFunctionButton[vIndex][vIndex2].Appearance.Font.Name   := OrderFunctionFontNameEdit.Text;
      OrderFunctionButton[vIndex][vIndex2].Appearance.Font.Size   := Trunc(OrderFunctionFontSizeEdit.Value);
      OrderFunctionButton[vIndex][vIndex2].Appearance.Font.Color  := OrderFunctionFontColorPanel.Color;
      if OrderFunctionFontBoldCheckBox.Checked then
        OrderFunctionButton[vIndex][vIndex2].Appearance.Font.Style := [fsBold];
      OrderFunctionButton[vIndex][vIndex2].Color    := OrderFunctionColorPanel.Color;
      OrderFunctionButton[vIndex][vIndex2].BevelColor    := OrderFunctionBorderColorPanel.Color;
      OrderFunctionButton[vIndex][vIndex2].PopupMenu   := FunctionKeyPopup;
      OrderFunctionButton[vIndex][vIndex2].OnClick     := OrderFunctionButtonClick;
    end;
  end;
  OrderFunctionButtonPanel.Width  := OrderFunctionButtonPanel.Width + 2;
  OrderFunctionButtonPanel.Height := OrderFunctionButtonPanel.Height + 2;
  OrderFunctionHeight := vHeight;
  OrderFunctionWidth  := vWidth;;

  // 저장할 수 있게 변경 되었다는 표시
  if aAsk then
  begin
    isOrderFunctionButtonChanged := true;
    isChanged            := true;
  end;
  Result := true;
end;

function TSystemPosDesignForm.CreateReceiptFunctionButton(
  aAsk: Boolean): Boolean;
var
  vIndex, vIndex2: Integer;
  vWidth :Integer;
begin
  Result := false;

  // 기존 버튼을 삭제한다
  if Assigned(ReceiptFunctionButton) then
  begin
    // 기존 버튼과 수가 같으면 그냥 끝낸다
    if Length(ReceiptFunctionButton) = Trunc(ReceiptFunctionButtonCountEdit.Value) then
      Exit;

    // 기존 버튼 개수보다 작을 때 적용할지 물어본다
    if aAsk and
       (Length(ReceiptFunctionButton) > Trunc(ReceiptFunctionButtonCountEdit.Value)) then
      if not AskBox('기존 등록된 버튼 수보다 적습니다.'#13'적용하시겠습니까?') then
        Exit;

    // 기존 버튼을 지운다
    for vIndex := Low(ReceiptFunctionButton) to High(ReceiptFunctionButton) do
    begin
      ReceiptFunctionButton[vIndex].Free;
      ReceiptFunctionButton[vIndex] := nil;
    end;
    SetLength(ReceiptFunctionButton, 0);
    ReceiptFunctionButton := nil;
  end;

  vWidth := ReceiptFunctionButtonPanel.Width  div Trunc(ReceiptFunctionButtonCountEdit.Value) -1;
  // 버튼을 새로 만든다
  SetLength(ReceiptFunctionButton, Trunc(ReceiptFunctionButtonCountEdit.Value));
  for vIndex := Low(ReceiptFunctionButton) to High(ReceiptFunctionButton) do
  begin
    ReceiptFunctionButton[vIndex] := TAdvSmoothButton.Create(self);
    ReceiptFunctionButton[vIndex].Name        := 'ReceiptFunction'+FormatFloat('00', vIndex);
    ReceiptFunctionButton[vIndex].Caption     := '';
    ReceiptFunctionButton[vIndex].Parent      := ReceiptFunctionButtonPanel;
    ReceiptFunctionButton[vIndex].Width       := vWidth;
    ReceiptFunctionButton[vIndex].Height      := ReceiptFunctionButtonPanel.Height;
    ReceiptFunctionButton[vIndex].Left        := (vIndex * vWidth) + (vIndex * 1);
    ReceiptFunctionButton[vIndex].Top         := 0;
    ReceiptFunctionButton[vIndex].Appearance.SimpleLayout := true;
    ReceiptFunctionButton[vIndex].Appearance.SimpleLayoutBorder := true;
    ReceiptFunctionButton[vIndex].Appearance.Rounding     := Trunc(ReceiptFunctionRoundEdit.Value);
    ReceiptFunctionButton[vIndex].Color   := ReceiptFunctionColorPanel.Color;
    ReceiptFunctionButton[vIndex].BevelColor  := ReceiptFunctionBorderColorPanel.Color;
    ReceiptFunctionButton[vIndex].Appearance.Font.Name   := ReceiptFunctionFontNameEdit.Text;
    ReceiptFunctionButton[vIndex].Appearance.Font.Size   := Trunc(ReceiptFunctionFontSizeEdit.Value);
    ReceiptFunctionButton[vIndex].Appearance.Font.Color  := ReceiptFunctionFontColorPanel.Color;
    if ReceiptFunctionFontBoldCheckBox.Checked then
      ReceiptFunctionButton[vIndex].Appearance.Font.Style  := [fsBold]
    else
      ReceiptFunctionButton[vIndex].Appearance.Font.Style  := [];

    ReceiptFunctionButton[vIndex].PopupMenu   := FunctionKeyPopup;
    ReceiptFunctionButton[vIndex].OnClick     := ReceiptFunctionButtonClick;
  end;

  // 저장할 수 있게 변경 되었다는 표시
  if aAsk then
  begin
    isReceiptFunctionButtonChanged := true;
    isChanged            := true;
  end;
  Result := true;
end;

function TSystemPosDesignForm.CreateTableFunctionButton(aAsk: Boolean): Boolean;
var
  vIndex, vIndex2: Integer;
  vHeight :Integer;
begin
  Result := false;

  // 기존 버튼을 삭제한다
  if Assigned(TableFunctionButton) then
  begin
    // 기존 버튼과 수가 같으면 그냥 끝낸다
    if Length(TableFunctionButton) = Trunc(TableFunctionButtonCountEdit.Value) then
    begin
      for vIndex := Low(TableFunctionButton) to High(TableFunctionButton) do
      begin
        TableFunctionButton[vIndex].Appearance.Font.Name   := TableFunctionFontNameEdit.Text;
        TableFunctionButton[vIndex].Appearance.Font.Size   := Trunc(TableFunctionFontSizeEdit.Value);
        TableFunctionButton[vIndex].Appearance.Font.Color  := TableFunctionFontColorPanel.Color;
        if TableFunctionFontBoldCheckBox.Checked then
          TableFunctionButton[vIndex].Appearance.Font.Style  := [fsBold]
        else
          TableFunctionButton[vIndex].Appearance.Font.Style  := [];

        TableFunctionButton[vIndex].Color      := TableFunctionColorPanel.Color;
        TableFunctionButton[vIndex].BevelColor := TableFunctionBorderColorPanel.Color;
      end;
      Exit;
    end;

    // 기존 버튼 개수보다 작을 때 적용할지 물어본다
    if aAsk and
       (Length(TableFunctionButton) > Trunc(TableFunctionButtonCountEdit.Value)) then
      if not AskBox('기존 등록된 버튼 수보다 적습니다.'#13'적용하시겠습니까?') then
        Exit;

    // 기존 버튼을 지운다
    for vIndex := Low(TableFunctionButton) to High(TableFunctionButton) do
    begin
      TableFunctionButton[vIndex].Free;
      TableFunctionButton[vIndex] := nil;
    end;
    SetLength(TableFunctionButton, 0);
    TableFunctionButton := nil;
  end;

  vHeight := TableFunctionButtonPanel.Height  div Trunc(TableFunctionButtonCountEdit.Value) -1;
  // 버튼을 새로 만든다
  SetLength(TableFunctionButton, Trunc(TableFunctionButtonCountEdit.Value));
  for vIndex := Low(TableFunctionButton) to High(TableFunctionButton) do
  begin
    TableFunctionButton[vIndex] := TAdvSmoothButton.Create(self);
    TableFunctionButton[vIndex].Name        := 'TableFunction'+FormatFloat('00', vIndex);
    TableFunctionButton[vIndex].Caption     := '';
    TableFunctionButton[vIndex].Parent      := TableFunctionButtonPanel;
    TableFunctionButton[vIndex].Width       := TableFunctionButtonPanel.Width - 6;
    TableFunctionButton[vIndex].Height      := vHeight;//TableFunctionButtonPanel.Height-2;
    TableFunctionButton[vIndex].Left        := 2; //(vIndex * vWidth) + (vIndex * 1);
    TableFunctionButton[vIndex].Top         := (vIndex * vHeight) + (vIndex * 1);
    TableFunctionButton[vIndex].Appearance.SimpleLayout := true;
    TableFunctionButton[vIndex].Appearance.SimpleLayoutBorder := true;
    TableFunctionButton[vIndex].Appearance.Rounding     := Trunc(TableFunctionRoundEdit.Value);
    TableFunctionButton[vIndex].Appearance.Font.Name   := TableFunctionFontNameEdit.Text;
    TableFunctionButton[vIndex].Appearance.Font.Size   := Trunc(TableFunctionFontSizeEdit.Value);
    TableFunctionButton[vIndex].Appearance.Font.Color  := TableFunctionFontColorPanel.Color;
    if TableFunctionFontBoldCheckBox.Checked then
      TableFunctionButton[vIndex].Appearance.Font.Style  := [fsBold]
    else
      TableFunctionButton[vIndex].Appearance.Font.Style  := [];

    TableFunctionButton[vIndex].Color   := TableFunctionColorPanel.Color;
    TableFunctionButton[vIndex].BevelColor  := TableFunctionBorderColorPanel.Color;
    TableFunctionButton[vIndex].PopupMenu   := FunctionKeyPopup;
    TableFunctionButton[vIndex].OnClick     := TableFunctionButtonClick;
  end;

  // 저장할 수 있게 변경 되었다는 표시
  if aAsk then
  begin
    isTableFunctionButtonChanged := true;
    isChanged            := true;
  end;
  Result := true;
end;

procedure TSystemPosDesignForm.DefaultButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if not AskBox('기본디자인으로 변경하시겠습니까?') then Exit;

  ExecQuery('delete from MS_CODE '
          +' where CD_HEAD  =:P0 '
          +'   and CD_STORE =:P1 '
          +'   and CD_KIND  =:P2;',
          [HeadStoreCode,
           Ifthen(Tag=0, StoreCode, StandardStore),
           IntToStr(87+ConditionToolBarComboBox.ItemIndex)]);

  ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
           +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18,NM_CODE19,NM_CODE20) '
           +'             select :P0, :P1, :P2, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3,NM_CODE4,NM_CODE5,NM_CODE6,NM_CODE7,NM_CODE8,NM_CODE9,NM_CODE10,'
           +'                    NM_CODE11,NM_CODE12,NM_CODE13,NM_CODE14,NM_CODE15,NM_CODE16,NM_CODE17,NM_CODE18,NM_CODE19,NM_CODE20 '
           +'               from MS_CODE '
           +'              where CD_HEAD  =''00000000'' '
           +'                and CD_STORE =''00000000'' '
           +'                and CD_KIND  =''87'';',
           [HeadStoreCode,
            Ifthen(Tag=0, StoreCode, StandardStore),
            IntToStr(87+ConditionToolBarComboBox.ItemIndex)],true);

  GetDesign;
end;

procedure TSystemPosDesignForm.DeleteButtonClick(Sender: TObject);
var vIdHTTP     : TIdHTTP;
    vRequest : TStringStream;
    vResponse :String;
    vFileName :String;
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

  vFileName := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 1],'');

  if Tag = 0 then
    ExecQuery('delete from MS_CODE '
            +' where CD_HEAD  =:P0 '
            +'   and CD_STORE =:P1 '
            +'   and CD_KIND  =''96'' '
            +'   and NM_CODE1 = :P2;',
            [HeadStoreCode,
             StoreCode,
             vFileName],true)
  else
    ExecQuery('delete from MS_CODE '
            +' where CD_HEAD  =:P0 '
            +'   and CD_KIND  =''96'' '
            +'   and NM_CODE1 = :P1;',
            [HeadStoreCode,
             vFileName],true);

  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);

  vIdHTTP  := TIdHTTP.Create;
  vRequest := TStringStream.Create;
  try
    if Tag = 0 then
      vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID', Format('%s/%s',[HeadStoreCode,StoreCode]))
    else
      vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID',HeadStoreCode);

    vIdHTTP.Request.CustomHeaders.AddValue('FILE_NAME', vFileName);
    vIdHTTP.Request.CustomHeaders.AddValue('JOB_GBN','R');
    vIdHTTP.Post(GetHttpURL+'Action_FileDown', vRequest );
    vResponse := IntToStr(vIdHTTP.ResponseCode);
  finally
    vIdHTTP.Disconnect;
    vIdHTTP.Free;
    vRequest.Free;
  end;
end;

procedure TSystemPosDesignForm.DesignCancelButtonClick(Sender: TObject);
begin
  inherited;
  DesignDialogPanel.Visible := false;
end;

procedure TSystemPosDesignForm.DesignDeleteButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  for vIndex := 1 to 4 do
  begin
    if TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Name = DesignDialogPanel.Hint then
    begin
      TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Graphic := nil;
      TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Tag := 0;
      Break;
    end;
  end;

  isDesignChanged := true;
  isChanged       := true;
  DesignDialogPanel.Visible := false;
end;

procedure TSystemPosDesignForm.DesignDialogImage1DblClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  for vIndex := 1 to 4 do
  begin
    if (TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Graphic <> nil) and (TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Tag = (Sender as TcxImage).Tag)  then
    begin
      MsgBox('이미 등록되어 있는 기능입니다');
      Exit;
      Break;
    end;
  end;

  for vIndex := 1 to 4 do
  begin
    if TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Name = DesignDialogPanel.Hint then
    begin
      TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Assign(ImageCollection.Items.Items[(Sender as TcxImage).Tag].Picture.Graphic);
      TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Tag := (Sender as TcxImage).Tag;
      Break;
    end;
  end;

  isDesignChanged := true;
  isChanged       := true;
  DesignDialogPanel.Visible := false;
end;

procedure TSystemPosDesignForm.DesignImage1Click(Sender: TObject);
begin
  inherited;
  DesignDialogPanel.Hint    := TcxImage(Sender).Name; // 어떤 버튼이 호출했는지 저장해둔다
  DesignDialogPanel.Top := Self.Height div 2 - DesignDialogPanel.Height div 2;
  DesignDialogPanel.Left := Self.Width div 2 - DesignDialogPanel.Width div 2;
  DesignDialogPanel.Visible := true;
  DesignDialogPanel.BringToFront;
end;

procedure TSystemPosDesignForm.DesignTileControlItemDragEnd(
  Sender: TdxCustomTileControl; AInfo: TdxTileControlDragItemInfo);
begin
  inherited;
  isDesignChanged := true;
  isChanged       := true;
end;

function TSystemPosDesignForm.DoSave: Boolean;
var vRow, vCol, vIndex, vCode, vIndex2, vCount :Integer;
    vParam: array of array of String;
    vKind :String;
    vPosPanelOrder :String;
    vAllChanged :Boolean;
begin
  if (Tag = 1) and not AskBox('표준에서 저장하면 전매장에 적용됩니다'#13'저장 하시겠습니까?') then Exit;


  vAllChanged := false;
  vKind := IntToStr(87+ConditionToolBarComboBox.ItemIndex);

  try
    OpenQuery('select Count(*) '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =:P2 ',
             [HeadStoreCode,
              StoreCode,
              vKind]);
    if Query.Fields[0].AsInteger = 0 then
    begin
      isPluChanged                   := true;
      isOrderAcctButtonChanged       := true;
      isOrderFunctionButtonChanged   := true;
      isTableFunctionButtonChanged   := true;
      isReceiptFunctionButtonChanged := true;
      isDesignChanged                := true;
      vAllChanged                    := true;
    end;
  finally
    Query.Close;
  end;

  SetLength(vParam, 200, 21);
  //주문결제 버튼
  vIndex := 0;
  if isPluChanged then
  begin
    vParam[vIndex, 0] := '001';
    vParam[vIndex, 1] := PluClassXEdit.Text;
    vParam[vIndex, 2] := PluClassYEdit.Text;
    vParam[vIndex, 3] := ColorToString(PluClassColorPanel.Color);
    vParam[vIndex, 4] := ColorToString(PluClassDownColorPanel.Color);
    vParam[vIndex, 5] := PluClassFontNameEdit.Text;
    vParam[vIndex, 6] := PluClassFontSizeEdit.Text;
    vParam[vIndex, 7] := Ifthen(PluClassFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 8] := ColorToString(PluClassFontColorPanel.Color);
    vParam[vIndex, 9] := ColorToString(PluClassFontDownColorPanel.Color);
    vParam[vIndex, 10]:= IntToStr(ClassPLUTypeComboBox.ItemIndex);
    vParam[vIndex, 11]:= PluClassHeightEdit.Text;
    vParam[vIndex, 12]:= PluClassWidthEdit.Text;
    vParam[vIndex, 13] := ColorToString(PluClassBorderColorPanel.Color);

    Inc(vIndex);
    vParam[vIndex, 0] := '002';
    vParam[vIndex, 1] := PluMenuXEdit.Text;
    vParam[vIndex, 2] := PluMenuYEdit.Text;
    vParam[vIndex, 3] := ColorToString(PluMenuColorPanel.Color);
    vParam[vIndex, 4] := PluMenuFontNameEdit.Text;
    vParam[vIndex, 5] := PluMenuFontSizeEdit.Text;
    vParam[vIndex, 6] := Ifthen(PluMenuFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 7] := ColorToString(PluMenuFontColorPanel.Color);
    vParam[vIndex, 8] := Ifthen(PluMenuPriceCheckBox.Checked,'1','0');
    vParam[vIndex, 9] := PluMenuPriceFontNameEdit.Text;
    vParam[vIndex, 10] := PluMenuPriceFontSizeEdit.Text;
    vParam[vIndex, 11] := Ifthen(PluMenuPriceFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 12] := ColorToString(PluMenuPriceFontColorPanel.Color);
    vParam[vIndex, 13] := ColorToString(PluMenuBorderColorPanel.Color);
    vParam[vIndex, 14] := Ifthen(PluMenuViewCheckBox.Checked,'1','0');
    Inc(vIndex);
  end;

  if isOrderAcctButtonChanged then
  begin
    vCode := 100;
    vParam[vIndex, 0] := IntToStr(vCode);
    vParam[vIndex, 1] := OrderAcctXEdit.Text;
    vParam[vIndex, 2] := OrderAcctYEdit.Text;
    vParam[vIndex, 3] := ColorToString(OrderAcctColorPanel.Color);
    vParam[vIndex, 4] := OrderAcctFontNameEdit.Text;
    vParam[vIndex, 5] := OrderAcctFontSizeEdit.Text;
    vParam[vIndex, 6] := Ifthen(OrderAcctFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 7] := ColorToString(OrderAcctFontColorPanel.Color);
    vParam[vIndex, 8] := IntToStr(OrderAcctIconComboBox.ItemIndex);
    vParam[vIndex, 9] := ColorToString(OrderAcctBorderColorPanel.Color);
    vParam[vIndex,10] := OrderAcctRoundEdit.Text;
    vParam[vIndex,11] := Ifthen(OrderAcctShadowCheckBox.Checked,'Y','N');
    Inc(vIndex);

    if Assigned(OrderAcctButton) and (Length(OrderAcctButton) > 0) then
    begin
      for vRow := Low(OrderAcctButton) to High(OrderAcctButton) do
        if Assigned(OrderAcctButton[vRow]) and (Length(OrderAcctButton[vRow]) > 0) then
        begin
          for vCol := Low(OrderAcctButton[vRow]) to High(OrderAcctButton[vRow]) do
          begin
            if OrderAcctButton[vRow, vCol].Hint = EmptyStr then Continue;
            Inc(vCode);
            vParam[vIndex, 0] := IntToStr(vCode);
            vParam[vIndex, 1] := OrderAcctButton[vRow, vCol].Hint;
            vParam[vIndex, 2] := OrderAcctButton[vRow, vCol].HelpKeyword;
            vParam[vIndex, 3] := OrderAcctButton[vRow, vCol].Caption;
            vParam[vIndex, 4] := ColorToString(OrderAcctButton[vRow, vCol].Color);
            vParam[vIndex, 5] := ColorToString(OrderAcctButton[vRow, vCol].Appearance.Font.Color);
            vParam[vIndex, 6] := Ifthen(fsBold in OrderAcctButton[vRow, vCol].Appearance.Font.Style,'1','0');
            vParam[vIndex, 7] := IntToStr(vRow);
            vParam[vIndex, 8] := IntToStr(vCol);
            vParam[vIndex, 9] := IntToStr(OrderAcctButton[vRow, vCol].Appearance.Font.Size);
            Inc(vIndex);
          end;
        end;
    end;
  end;

  if isOrderFunctionButtonChanged then
  begin
    vCode := 200;
    vParam[vIndex, 0] := IntToStr(vCode);
    vParam[vIndex, 1] := OrderFunctionXEdit.Text;
    vParam[vIndex, 2] := OrderFunctionYEdit.Text;
    vParam[vIndex, 3] := ColorToString(OrderFunctionColorPanel.Color);
    vParam[vIndex, 4] := OrderFunctionFontNameEdit.Text;
    vParam[vIndex, 5] := OrderFunctionFontSizeEdit.Text;
    vParam[vIndex, 6] := Ifthen(OrderFunctionFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 7] := ColorToString(OrderFunctionFontColorPanel.Color);
    vParam[vIndex, 8] := IntToStr(OrderFunctionIconIconComboBox.ItemIndex);
    vParam[vIndex, 9] := ColorToString(OrderFunctionBorderColorPanel.Color);
    vParam[vIndex,10] := OrderFunctionRoundEdit.Text;
    vParam[vIndex,11] := Ifthen(OrderFunctionShadowCheckBox.Checked,'Y','N');
    Inc(vIndex);

    if Assigned(OrderFunctionButton) and (Length(OrderFunctionButton) > 0) then
    begin
      for vRow := Low(OrderFunctionButton) to High(OrderFunctionButton) do
        if Assigned(OrderFunctionButton[vRow]) and (Length(OrderFunctionButton[vRow]) > 0) then
        begin
          for vCol := Low(OrderFunctionButton[vRow]) to High(OrderFunctionButton[vRow]) do
          begin
            if OrderFunctionButton[vRow, vCol].Hint = EmptyStr then Continue;
            Inc(vCode);
            vParam[vIndex, 0] := IntToStr(vCode);
            vParam[vIndex, 1] := OrderFunctionButton[vRow, vCol].Hint;
            vParam[vIndex, 2] := OrderFunctionButton[vRow, vCol].HelpKeyword;
            vParam[vIndex, 3] := OrderFunctionButton[vRow, vCol].Caption;
            vParam[vIndex, 4] := ColorToString(OrderFunctionButton[vRow, vCol].Color);
            vParam[vIndex, 5] := ColorToString(OrderFunctionButton[vRow, vCol].Appearance.Font.Color);
            vParam[vIndex, 6] := Ifthen(fsBold in OrderFunctionButton[vRow, vCol].Appearance.Font.Style,'1','0');
            vParam[vIndex, 7] := IntToStr(vRow);
            vParam[vIndex, 8] := IntToStr(vCol);
            vParam[vIndex, 9] := IntToStr(OrderFunctionButton[vRow, vCol].Appearance.Font.Size);
            Inc(vIndex);
          end;
        end;
    end;
  end;

  if isTableFunctionButtonChanged then
  begin
    vCode := 300;
    vParam[vIndex, 0]  := IntToStr(vCode);
    vParam[vIndex, 1]  := TableFunctionButtonCountEdit.Text;
    vParam[vIndex, 2]  := ColorToString(TableFunctionColorPanel.Color);
    vParam[vIndex, 3]  := TableFunctionFontNameEdit.Text;
    vParam[vIndex, 4]  := TableFunctionFontSizeEdit.Text;
    vParam[vIndex, 5]  := Ifthen(TableFunctionFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 6]  := ColorToString(TableFunctionFontColorPanel.Color);
    vParam[vIndex, 7]  := IntToStr(TableFunctionIconComboBox.ItemIndex);
    vParam[vIndex, 8]  := TableButtonHeightEdit.Text;
    vParam[vIndex, 9]  := FloorHeightEdit.Text;
    vParam[vIndex, 10] := FloorWidthEdit.Text;
    vParam[vIndex, 11] := ColorToString(FloorColorPanel.Color);
    vParam[vIndex, 12] := FloorFontNameEdit.Text;
    vParam[vIndex, 13] := FloorFontSizeEdit.Text;
    vParam[vIndex, 14] := Ifthen(FloorFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 15] := ColorToString(FloorFontColorPanel.Color);
    vParam[vIndex, 16] := Ifthen(DarkModeCheckBox.Checked,'1','0');
    vParam[vIndex, 17] := Ifthen(HorizontalCheckBox.Checked,'1','0');
    vParam[vIndex, 18] := ColorToString(TableFunctionBorderColorPanel.Color);
    vParam[vIndex, 19] := TableFunctionRoundEdit.Text;
    vParam[vIndex, 20]  := Ifthen(TableFunctionShadowCheckBox.Checked,'Y','N');
    Inc(vIndex);

    if Assigned(TableFunctionButton) and (Length(TableFunctionButton) > 0) then
    begin
      for vCol := Low(TableFunctionButton) to High(TableFunctionButton) do
        if Assigned(TableFunctionButton) and (Length(TableFunctionButton) > 0) then
        begin
          if TableFunctionButton[vCol].Hint = EmptyStr then Continue;
          Inc(vCode);
          vParam[vIndex, 0]  := IntToStr(vCode);
          vParam[vIndex, 1]  := TableFunctionButton[vCol].Hint;
          vParam[vIndex, 2]  := TableFunctionButton[vCol].HelpKeyword;
          vParam[vIndex, 3]  := TableFunctionButton[vCol].Caption;
          vParam[vIndex, 4]  := ColorToString(TableFunctionButton[vCol].Color);
          vParam[vIndex, 5]  := ColorToString(TableFunctionButton[vCol].Appearance.Font.Color);
          vParam[vIndex, 6]  := Ifthen(fsBold in TableFunctionButton[vCol].Appearance.Font.Style,'1','0');
          vParam[vIndex, 7]  := IntToStr(vCol);
          vParam[vIndex, 8] := IntToStr(TableFunctionButton[vCol].Appearance.Font.Size);
          Inc(vIndex);
        end;
    end;
  end;

  if isReceiptFunctionButtonChanged then
  begin
    vCode := 400;
    vParam[vIndex, 0] := IntToStr(vCode);
    vParam[vIndex, 1] := ReceiptFunctionButtonCountEdit.Text;
    vParam[vIndex, 2] := ColorToString(ReceiptFunctionColorPanel.Color);
    vParam[vIndex, 3] := ReceiptFunctionFontNameEdit.Text;
    vParam[vIndex, 4] := ReceiptFunctionFontSizeEdit.Text;
    vParam[vIndex, 5] := Ifthen(ReceiptFunctionFontBoldCheckBox.Checked,'1','0');
    vParam[vIndex, 6] := ColorToString(ReceiptFunctionFontColorPanel.Color);
    vParam[vIndex, 7] := Ifthen(ReceiptFunctionIconCheckBox.Checked,'1','0');
    vParam[vIndex, 8] := ColorToString(ReceiptFunctionBorderColorPanel.Color);
    vParam[vIndex, 9] := ReceiptFunctionRoundEdit.Text;
    vParam[vIndex,10] := Ifthen(ReceiptFunctionShadowCheckBox.Checked,'Y','N');
    Inc(vIndex);

    if Assigned(ReceiptFunctionButton) and (Length(ReceiptFunctionButton) > 0) then
    begin
      for vCol := Low(ReceiptFunctionButton) to High(ReceiptFunctionButton) do
        if Assigned(ReceiptFunctionButton) and (Length(ReceiptFunctionButton) > 0) then
        begin
          if ReceiptFunctionButton[vCol].Hint = EmptyStr then Continue;
          Inc(vCode);
          vParam[vIndex, 0] := IntToStr(vCode);
          vParam[vIndex, 1] := ReceiptFunctionButton[vCol].Hint;
          vParam[vIndex, 2] := ReceiptFunctionButton[vCol].HelpKeyword;
          vParam[vIndex, 3] := ReceiptFunctionButton[vCol].Caption;
          vParam[vIndex, 4] := ColorToString(ReceiptFunctionButton[vCol].Color);
          vParam[vIndex, 5] := ColorToString(ReceiptFunctionButton[vCol].Appearance.Font.Color);
          vParam[vIndex, 6] := Ifthen(fsBold in ReceiptFunctionButton[vCol].Appearance.Font.Style,'1','0');
          vParam[vIndex, 7] := IntToStr(vCol);
          vParam[vIndex, 8] := IntToStr(ReceiptFunctionButton[vCol].Appearance.Font.Size);
          Inc(vIndex);
        end;
    end;
  end;

  if isDesignChanged then
  begin
    vPosPanelOrder := '0000';
    vCount := 0;
    for vIndex := 1 to 4 do
    begin
      if TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Picture.Graphic = nil then
        vPosPanelOrder[vIndex] := '0'
      else
      begin
        vPosPanelOrder[vIndex] := IntToStr(TcxImage(FindComponent(Format('DesignImage%d',[vIndex]))).Tag+1)[1];
        if (TcxCurrencyEdit(FindComponent(Format('Image%dWidthEdit',[vIndex]))).EditValue = 0) then
          Inc(vCount);
      end;
    end;

    if vCount > 1 then
    begin
      MsgBox('화면폭이 0 인값이 2개이상이면 안됩니다');
      Exit;
    end;

    vCode := 500;
    vParam[vIndex, 0] := IntToStr(vCode);
    vParam[vIndex, 1] := GetOnlyNumber(DisplayXEdit.Text);
    vParam[vIndex, 2] := GetOnlyNumber(DisplayYEdit.Text);
    vParam[vIndex, 3] := vPosPanelOrder;
    vParam[vIndex, 4] := PosPanelHeightEdit.Text;
    vParam[vIndex, 5] := Image1WidthEdit.Text;
    vParam[vIndex, 6] := Image2WidthEdit.Text;
    vParam[vIndex, 7] := Image3WidthEdit.Text;
    vParam[vIndex, 8] := Image4WidthEdit.Text;
    vParam[vIndex, 9] := GridFontSizeSpinEdit.Text;
    vParam[vIndex,10] := GridRowHeightSpinEdit.Text;
    vParam[vIndex,11] := TitleCaptionEdit.Text;
    vParam[vIndex,12] := TitleTypeEdit.Text;
    vParam[vIndex,13] := TitleNameEdit.Text;
    vParam[vIndex,14] := TitleQtyEdit.Text;
    vParam[vIndex,15] := TitlePriceEdit.Text;
    vParam[vIndex,16] := TitleAmountEdit.Text;
    vParam[vIndex,17] := TitleDcEdit.Text;
    vParam[vIndex,18] := DualGridFontSizeSpinEdit.Text;
    vParam[vIndex,19] := DualGridRowHeightSpinEdit.Text;
    vParam[vIndex,20] := IntToStr(PosStyleComboBox.ItemIndex);

  end;

  vKind := IntToStr(87+ConditionToolBarComboBox.ItemIndex);

  try
    if Tag = 0 then
    begin
      if isPluChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_KIND  =:P2 '
                 +'   and CD_CODE in (''001'',''002'');',
                 [HeadStoreCode,
                  StoreCode,
                  vKind],false);

      if isOrderAcctButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_KIND  =:P2 '
                 +'   and CD_CODE between ''100'' and ''199''; ',
                 [HeadStoreCode,
                  StoreCode,
                  vKind],false);

      if isOrderFunctionButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_KIND  =:P2 '
                 +'   and CD_CODE between ''200'' and ''299'';',
                 [HeadStoreCode,
                  StoreCode,
                  vKind],false);

      if isTableFunctionButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_KIND  =:P2 '
                 +'   and CD_CODE between ''300'' and ''399''; ',
                 [HeadStoreCode,
                  StoreCode,
                  vKind],false);


      if isReceiptFunctionButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_KIND  =:P2 '
                 +'   and CD_CODE between ''400'' and ''499''; ',
                 [HeadStoreCode,
                  StoreCode,
                  vKind],false);

      if isDesignChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_KIND  =:P2 '
                 +'   and CD_CODE = ''500''; ',
                 [HeadStoreCode,
                  StoreCode,
                  vKind],false);

      for vIndex := 0 to 199 do
      begin
        if vParam[vIndex,0] = EmptyStr then Continue;
        ExecQuery('insert into MS_CODE(CD_HEAD, '
                 +'                    CD_STORE, '
                 +'                    CD_KIND, '
                 +'                    CD_CODE, '
                 +'                    NM_CODE1, '
                 +'                    NM_CODE2, '
                 +'                    NM_CODE3, '
                 +'                    NM_CODE4, '
                 +'                    NM_CODE5, '
                 +'                    NM_CODE6, '
                 +'                    NM_CODE7, '        //Row
                 +'                    NM_CODE8, '
                 +'                    NM_CODE9, '
                 +'                    NM_CODE10, '
                 +'                    NM_CODE11, '
                 +'                    NM_CODE12, '
                 +'                    NM_CODE13, '
                 +'                    NM_CODE14, '
                 +'                    NM_CODE15, '
                 +'                    NM_CODE16, '
                 +'                    NM_CODE17, '
                 +'                    NM_CODE18, '
                 +'                    NM_CODE19, '
                 +'                    NM_CODE20) '        //Col
                 +'             values(:P0, '
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
                 +'                    :P14, '
                 +'                    :P15, '
                 +'                    :P16, '
                 +'                    :P17, '
                 +'                    :P18, '
                 +'                    :P19, '
                 +'                    :P20, '
                 +'                    :P21, '
                 +'                    :P22, '
                 +'                    :P23);',
                 [HeadStoreCode,
                  StoreCode,
                  vKind,
                  vParam[vIndex,0],
                  vParam[vIndex,1],
                  vParam[vIndex,2],
                  vParam[vIndex,3],
                  vParam[vIndex,4],
                  vParam[vIndex,5],
                  vParam[vIndex,6],
                  vParam[vIndex,7],
                  vParam[vIndex,8],
                  vParam[vIndex,9],
                  vParam[vIndex,10],
                  vParam[vIndex,11],
                  vParam[vIndex,12],
                  vParam[vIndex,13],
                  vParam[vIndex,14],
                  vParam[vIndex,15],
                  vParam[vIndex,16],
                  vParam[vIndex,17],
                  vParam[vIndex,18],
                  vParam[vIndex,19],
                  vParam[vIndex,20]],false);
      end;

      if not vAllChanged and isPluChanged and AskBox('이미 등록된 PLU에 색상도 변경하시겠습니까?') then
      begin
        ExecQuery('update MS_SMALL '
                 +'   set COLOR    =:P3'
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and COLOR    =:P2 '
                 +'   and CD_GUBUN not in (''98'',''99'');',
                 [HeadStoreCode,
                  StoreCode,
                  PluMenuColorPanel.Hint,
                  ColorToString(PluMenuColorPanel.Color)],false);
      end;

      if PluClassColorPanel.Tag = 1 then
        ExecQuery('update MS_LARGE '
                 +'   set COLOR    =:P2'
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and CD_GUBUN not in (''98'',''99'');',
                 [HeadStoreCode,
                  StoreCode,
                  ColorToString(PluClassColorPanel.Color)],false);
    end
    else
    begin
      if isPluChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_KIND  =:P1 '
                 +'   and CD_CODE in (''001'',''002'');',
                 [HeadStoreCode,
                  vKind],false);

      if isOrderAcctButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_KIND  =:P1 '
                 +'   and CD_CODE between ''100'' and ''199''; ',
                 [HeadStoreCode,
                  vKind],false);

      if isOrderFunctionButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_KIND  =:P1 '
                 +'   and CD_CODE between ''200'' and ''299'';',
                 [HeadStoreCode,
                  vKind],false);

      if isTableFunctionButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_KIND  =:P1 '
                 +'   and CD_CODE between ''300'' and ''399''; ',
                 [HeadStoreCode,
                  vKind],false);


      if isReceiptFunctionButtonChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_KIND  =:P1 '
                 +'   and CD_CODE between ''400'' and ''499''; ',
                 [HeadStoreCode,
                  vKind],false);

      if isDesignChanged then
        ExecQuery('delete from MS_CODE '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_KIND  =:P1 '
                 +'   and CD_CODE = ''500''; ',
                 [HeadStoreCode,
                  vKind],false);

      for vIndex := 0 to 199 do
      begin
        if vParam[vIndex,0] = EmptyStr then Continue;
        for vIndex2 := 0 to WorkStoreList.Count-1 do
          ExecQuery('insert into MS_CODE(CD_HEAD, '
                   +'                    CD_STORE, '
                   +'                    CD_KIND, '
                   +'                    CD_CODE, '
                   +'                    NM_CODE1, '
                   +'                    NM_CODE2, '
                   +'                    NM_CODE3, '
                   +'                    NM_CODE4, '
                   +'                    NM_CODE5, '
                   +'                    NM_CODE6, '
                   +'                    NM_CODE7, '        //Row
                   +'                    NM_CODE8, '
                   +'                    NM_CODE9, '
                   +'                    NM_CODE10, '
                   +'                    NM_CODE11, '
                   +'                    NM_CODE12, '
                   +'                    NM_CODE13, '
                   +'                    NM_CODE14, '
                   +'                    NM_CODE15, '
                   +'                    NM_CODE16, '
                   +'                    NM_CODE17, '
                   +'                    NM_CODE18, '
                   +'                    NM_CODE19) '        //Col
                   +'             values(:P0, '
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
                   +'                    :P14, '
                   +'                    :P15, '
                   +'                    :P16, '
                   +'                    :P17, '
                   +'                    :P18, '
                   +'                    :P19, '
                   +'                    :P20, '
                   +'                    :P21, '
                   +'                    :P22);',
                   [HeadStoreCode,
                    CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 0),
                    vKind,
                    vParam[vIndex,0],
                    vParam[vIndex,1],
                    vParam[vIndex,2],
                    vParam[vIndex,3],
                    vParam[vIndex,4],
                    vParam[vIndex,5],
                    vParam[vIndex,6],
                    vParam[vIndex,7],
                    vParam[vIndex,8],
                    vParam[vIndex,9],
                    vParam[vIndex,10],
                    vParam[vIndex,11],
                    vParam[vIndex,12],
                    vParam[vIndex,13],
                    vParam[vIndex,14],
                    vParam[vIndex,15],
                    vParam[vIndex,16],
                    vParam[vIndex,17],
                    vParam[vIndex,18],
                    vParam[vIndex,19]],false);
      end;

      if PluClassColorPanel.Tag = 1 then
        ExecQuery('update MS_LARGE '
                 +'   set COLOR    =:P1'
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_GUBUN not in (''98'',''99'');',
                 [HeadStoreCode,
                  ColorToString(PluClassColorPanel.Color)],false);
    end;

    Result := ExecQuery('',
                       [],true);
    if Result then
    begin
      isPluChanged                 := false;
      isDesignChanged              := false;
      isOrderAcctButtonChanged     := false;
      isOrderFunctionButtonChanged := false;
      isTableFunctionButtonChanged := false;
      isReceiptFunctionButtonChanged := false;
      ExtremeMainForm.PosSendMessage;
    end;
  except
    on E: Exception do begin
    ErrBox(E.Message);
    end;
  end;
end;

procedure TSystemPosDesignForm.EditPropertiesChange(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if Sender = ClassPLUTypeComboBox then
  begin
    PluClassXEdit.Enabled := ClassPLUTypeComboBox.ItemIndex <> 1;
    PluClassYEdit.Enabled := ClassPLUTypeComboBox.ItemIndex <> 1;
  end
  else if Sender = OrderAcctFontNameEdit then
  begin
    for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
      if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Name := OrderAcctFontNameEdit.Text;
      end;
  end
  else if Sender = OrderFunctionFontNameEdit then
  begin
    for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
      if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Name := OrderFunctionFontNameEdit.Text;
      end;
  end
  else if Sender = OrderFunctionRoundEdit then
  begin
    for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
      if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Rounding := Trunc(OrderFunctionRoundEdit.Value);
      end;
  end
  else if Sender = ReceiptFunctionFontNameEdit then
  begin
    for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
      if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Name := ReceiptFunctionFontNameEdit.Text;
      end;
  end
  else if Sender = OrderAcctFontSizeEdit then
  begin
    for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
      if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size := Trunc(OrderAcctFontSizeEdit.Value);
      end;
  end
  else if Sender = OrderAcctRoundEdit then
  begin
    for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
      if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Rounding := Trunc(OrderAcctRoundEdit.Value);
      end;
  end

  else if Sender = OrderFunctionFontSizeEdit then
  begin
    for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
      if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size := Trunc(OrderFunctionFontSizeEdit.Value);
      end;
  end
  else if Sender = ReceiptFunctionFontSizeEdit then
  begin
    for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
      if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size := Trunc(ReceiptFunctionFontSizeEdit.Value);
      end;
  end
  else if Sender = ReceiptFunctionRoundEdit then
  begin
    for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
      if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Rounding := Trunc(ReceiptFunctionRoundEdit.Value);
      end;
  end

  else if Sender = OrderAcctFontBoldCheckBox then
  begin
    for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
      if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        if OrderAcctFontBoldCheckBox.Checked then
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [fsBold]
        else
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [];
      end;
  end
  else if Sender = OrderFunctionFontBoldCheckBox then
  begin
    for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
      if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        if OrderFunctionFontBoldCheckBox.Checked then
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [fsBold]
        else
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [];
      end;
  end
  else if Sender = TableFunctionFontSizeEdit then
  begin
    for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
      if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size := Trunc(TableFunctionFontSizeEdit.Value);
      end;
  end
  else if Sender = TableFunctionRoundEdit then
  begin
    for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
      if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Rounding := Trunc(TableFunctionRoundEdit.Value);
      end;
  end
  else if Sender = TableFunctionFontBoldCheckBox then
  begin
    for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
      if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        if TableFunctionFontBoldCheckBox.Checked then
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [fsBold]
        else
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [];
      end;
  end
  else if Sender = ReceiptFunctionFontBoldCheckBox then
  begin
    for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
      if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
      begin
        if ReceiptFunctionFontBoldCheckBox.Checked then
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [fsBold]
        else
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Style := [];
      end;
  end
  else if Sender = OrderAcctShadowCheckBox then
  begin
    for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
      if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Shadow := OrderAcctShadowCheckBox.Checked;
  end
  else if Sender = OrderFunctionShadowCheckBox then
  begin
    for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
      if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Shadow := OrderFunctionShadowCheckBox.Checked;
  end
  else if Sender = TableFunctionShadowCheckBox then
  begin
    for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
      if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Shadow := TableFunctionShadowCheckBox.Checked;
  end
  else if Sender = ReceiptFunctionShadowCheckBox then
  begin
    for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
      if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Shadow := ReceiptFunctionShadowCheckBox.Checked;
  end;


  isChanged := true;
  case ButtonDesignPageControl.ActivePageIndex of
    0,6 : isDesignChanged              := true;
    1 : isPluChanged                   := true;
    2 : isOrderAcctButtonChanged       := true;
    3 : isOrderFunctionButtonChanged   := true;
    4 : isReceiptFunctionButtonChanged := true;
    5 : isTableFunctionButtonChanged   := true;
  end;

end;

procedure TSystemPosDesignForm.FunctionKeyDialogCancelButtonClick(
  Sender: TObject);
begin
  inherited;
  // 이렇게 코딩하면 Access Violation 에러가 뜨는데 왜 그런지 몰라서 그냥 포커스를 밖으로 빼는 것으로 수정
  FunctionKeyDialogPanel.Visible := false;
//  FunctionKeyFontSizeEdit.SetFocus;
end;

procedure TSystemPosDesignForm.FunctionKeyDialogDeleteButtonClick(
  Sender: TObject);
begin
  inherited;
  FunctionKeyDialogFunctionEdit.Text := EmptyStr;
  FunctionKeyDialogTextEdit.Text     := EmptyStr;
  FunctionKeyDialogTextEdit.Hint     := EmptyStr;
end;

procedure TSystemPosDesignForm.FunctionKeyDialogOKButtonClick(Sender: TObject);
  function LineFeed(aValue: String): String;
  var vData : TStringList;
      vIndex :Integer;
  begin
    try
      Result := EmptyStr;
      vData := TStringList.Create;
      Split(aValue, '|', vData);
      for vIndex := 0 to vData.Count-1 do
         Result := Result + vData[vIndex] + Ifthen(vIndex < vData.Count-1, #13#10,'');

      if Result = EmptyStr then
        Result := aValue;
    finally
      vData.Free;
    end;
  end;
var
  vIndex: Integer;
begin
  inherited;
  FunctionKeyDialogPanel.Visible := false;
  case ButtonDesignPageControl.ActivePageIndex of
    2 :
    begin
      // 현재 선택한 기능을 연결된 버튼에 준다
      for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
        if (OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton) and
           ((OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Name = FunctionKeyDialogPanel.Hint) then
        begin
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Caption                := LineFeed(FunctionKeyDialogTextEdit.Text);
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).HelpKeyword            := FunctionKeyDialogFunctionEdit.Text;
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Hint                   := FunctionKeyDialogTextEdit.Hint;
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color                  := FunctionKeyButtonColorPanel.Color;
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color  := FunctionKeyFontColorPanel.Color;
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size   := FunctionKeyFontSizeEdit.Value;
          isChanged            := true;
          break;
        end;

      ShowPosModeAcct;
      OrderAcctFontSizeEdit.SetFocus;
      isOrderAcctButtonChanged       := true;
    end;
    3 :
    begin
      // 현재 선택한 기능을 연결된 버튼에 준다
      for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
        if (OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton) and
           ((OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Name = FunctionKeyDialogPanel.Hint) then
        begin
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Caption                 := LineFeed(FunctionKeyDialogTextEdit.Text);
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).HelpKeyword             := FunctionKeyDialogFunctionEdit.Text;
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Hint                    := FunctionKeyDialogTextEdit.Hint;
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color                   := FunctionKeyButtonColorPanel.Color;
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color   := FunctionKeyFontColorPanel.Color;
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size    := FunctionKeyFontSizeEdit.Value;
          isChanged            := true;
          break;
        end;

      ShowPosMode;
      OrderFunctionFontSizeEdit.SetFocus;
      isOrderFunctionButtonChanged       := true;
    end;
    4 :
    begin
      // 현재 선택한 기능을 연결된 버튼에 준다
      for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
        if (ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton) and
           ((ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Name = FunctionKeyDialogPanel.Hint) then
        begin
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Caption               := LineFeed(FunctionKeyDialogTextEdit.Text);
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).HelpKeyword           := FunctionKeyDialogFunctionEdit.Text;
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Hint                  := FunctionKeyDialogTextEdit.Hint;
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color                 := FunctionKeyButtonColorPanel.Color;
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color := FunctionKeyFontColorPanel.Color;
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size  := FunctionKeyFontSizeEdit.Value;
          isChanged            := true;
          break;
        end;

      ReceiptFunctionFontSizeEdit.SetFocus;
      isReceiptFunctionButtonChanged       := true;
    end;
    5 :
    begin
      // 현재 선택한 기능을 연결된 버튼에 준다
      for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
        if (TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton) and
           ((TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Name = FunctionKeyDialogPanel.Hint) then
        begin
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Caption              := LineFeed(FunctionKeyDialogTextEdit.Text);
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).HelpKeyword           := FunctionKeyDialogFunctionEdit.Text;
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Hint                  := FunctionKeyDialogTextEdit.Hint;
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color                 := FunctionKeyButtonColorPanel.Color;
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color := FunctionKeyFontColorPanel.Color;
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Size  := FunctionKeyFontSizeEdit.Value;
          isChanged            := true;
          break;
        end;

      TableFunctionFontSizeEdit.SetFocus;
      isTableFunctionButtonChanged       := true;
    end;

  end;
end;

procedure TSystemPosDesignForm.FunctionKeyDialogSplitButtonClick(
  Sender: TObject);
var
  vStr  : string;
  vIndex: Integer;
begin
  inherited;

  // 문구에 구분자를 넣는다
  vStr   := FunctionKeyDialogTextEdit.Text;
  vIndex := FunctionKeyDialogTextEdit.SelStart+1;
  Insert(FunctionKeyDialogSplitButton.Caption, vStr, vIndex);
  FunctionKeyDialogTextEdit.Text := vStr;
  FunctionKeyDialogTextEdit.SetFocus;
  FunctionKeyDialogTextEdit.SelStart := vIndex;
end;

procedure TSystemPosDesignForm.FunctionKeyPopupBackColorClick(Sender: TObject);
begin
  inherited;
  FunctionKeyColorDialog.Color := (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Color;
  if FunctionKeyColorDialog.Execute then
  begin
    (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Color  := FunctionKeyColorDialog.Color;
    isChanged            := true;
    case ButtonDesignPageControl.ActivePageIndex of
      2 : isOrderAcctButtonChanged       := true;
      3 : isOrderFunctionButtonChanged   := true;
      4 : isReceiptFunctionButtonChanged := true;
      5 : isTableFunctionButtonChanged   := true;
    end;
  end;

end;

procedure TSystemPosDesignForm.FunctionKeyPopupColorCopyClick(Sender: TObject);
begin
  inherited;

  FunctionKeyBackColorClipboard := (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Color;
  FunctionKeyForeColorClipboard := (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Appearance.Font.Color;
end;

procedure TSystemPosDesignForm.FunctionKeyPopupColorPasteClick(Sender: TObject);
begin
  inherited;
  (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Color     := FunctionKeyBackColorClipboard;
  (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Appearance.Font.Color    := FunctionKeyForeColorClipboard;
  isChanged            := true;
  case ButtonDesignPageControl.ActivePageIndex of
    2 : isOrderAcctButtonChanged       := true;
    3 : isOrderFunctionButtonChanged   := true;
    4 : isReceiptFunctionButtonChanged := true;
    5 : isTableFunctionButtonChanged   := true;
  end;
end;

procedure TSystemPosDesignForm.FunctionKeyPopupDeleteClick(Sender: TObject);
begin
  inherited;
  if FunctionKeyPopup.PopupComponent is TPosButton then
  begin
    (FunctionKeyPopup.PopupComponent as TPosButton).Caption := EmptyStr;
    (FunctionKeyPopup.PopupComponent as TPosButton).Temp1 := EmptyStr;
    (FunctionKeyPopup.PopupComponent as TPosButton).Temp2 := EmptyStr;
    (FunctionKeyPopup.PopupComponent as TPosButton).Refresh;
  end
  else
  begin
    (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Caption     := EmptyStr;
    (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).HelpKeyword := EmptyStr;
    (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Hint        := EmptyStr;
  end;
  isChanged            := true;
  case ButtonDesignPageControl.ActivePageIndex of
    2 : begin
          isOrderAcctButtonChanged       := true;
          ShowPosModeAcct;
        end;
    3 : begin
          isOrderFunctionButtonChanged   := true;
          ShowPosMode;
        end;
    4 : isReceiptFunctionButtonChanged := true;
    5 : isTableFunctionButtonChanged   := true;
  end;
end;

procedure TSystemPosDesignForm.FunctionKeyPopupForeColorClick(Sender: TObject);
begin
  inherited;
  FunctionKeyColorDialog.Color := (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Appearance.Font.Color;
  if FunctionKeyColorDialog.Execute then
  begin
    (FunctionKeyPopup.PopupComponent as TAdvSmoothButton).Appearance.Font.Color := FunctionKeyColorDialog.Color;
    isChanged            := true;
    case ButtonDesignPageControl.ActivePageIndex of
      2 : isOrderAcctButtonChanged       := true;
      3 : isOrderFunctionButtonChanged   := true;
      4 : isReceiptFunctionButtonChanged := true;
      5 : isTableFunctionButtonChanged   := true;
    end;
  end;

end;

procedure TSystemPosDesignForm.FunctionListBoxClick(Sender: TObject);
var
  vCode    : PStrPointer;
  vIndex   : Integer;
begin
  inherited;
  // 새로 선택한 기능 값을 설정한다
  for vIndex := 0 to FunctionListBox.Count-1 do
  begin
    if FunctionListBox.Selected[vIndex] then
    begin
      FunctionKeyDialogTextEdit.Hint     := PStrPointer(FunctionListBox.Items.Objects[FunctionListBox.ItemIndex]).Data;
      FunctionKeyDialogFunctionEdit.Text := FunctionListBox.Items.Strings[vIndex];
      FunctionKeyDialogTextEdit.Text     := FunctionListBox.Items.Strings[vIndex];
      FunctionKeyDialogTextEdit.SetFocus;
      Break;
    end;
  end;
end;

//주문화면 결제버튼 생성
procedure TSystemPosDesignForm.OrderAcctCreateButtonClick(Sender: TObject);
var
  vOldCode, vOldName, vOldText: array of array of string;
  vOldBColor, vOldFColor: array of array of TColor;
  vRow, vCol: Integer;
begin
  inherited;

  // 기존 기능 백업
  if Assigned(OrderAcctButton) and (Length(OrderAcctButton) > 0) then
  begin
    SetLength(vOldCode,   Length(OrderAcctButton));
    SetLength(vOldName,   Length(OrderAcctButton));
    SetLength(vOldText,   Length(OrderAcctButton));
    SetLength(vOldBColor, Length(OrderAcctButton));
    SetLength(vOldFColor, Length(OrderAcctButton));
    for vRow := Low(OrderAcctButton) to High(OrderAcctButton) do
      if Assigned(OrderAcctButton[vRow]) and (Length(OrderAcctButton[vRow]) > 0) then
      begin
        SetLength(vOldCode[vRow],   Length(OrderAcctButton[vRow]));
        SetLength(vOldName[vRow],   Length(OrderAcctButton[vRow]));
        SetLength(vOldText[vRow],   Length(OrderAcctButton[vRow]));
        SetLength(vOldBColor[vRow], Length(OrderAcctButton[vRow]));
        SetLength(vOldFColor[vRow], Length(OrderAcctButton[vRow]));
        for vCol := Low(OrderAcctButton[vRow]) to High(OrderAcctButton[vRow]) do
        begin
          vOldCode[vRow, vCol]   := OrderAcctButton[vRow, vCol].Hint;
          vOldName[vRow, vCol]   := OrderAcctButton[vRow, vCol].HelpKeyword;
          vOldText[vRow, vCol]   := OrderAcctButton[vRow, vCol].Caption;
          vOldBColor[vRow, vCol] := OrderAcctButton[vRow, vCol].Color;
          vOldFColor[vRow, vCol] := OrderAcctButton[vRow, vCol].Appearance.Font.Color;
        end;
      end;
  end;

  // 버튼을 새로 만든다
  if CreateOrderAcctButton(true) then
    // 백업한 기능을 불러온다
    if Assigned(OrderAcctButton) and (Length(OrderAcctButton) > 0) then
      for vRow := Low(OrderAcctButton) to High(OrderAcctButton) do
        if Assigned(OrderAcctButton[vRow]) and (Length(OrderAcctButton[vRow]) > 0) then
          for vCol := Low(OrderAcctButton[vRow]) to High(OrderAcctButton[vRow]) do
            if (Length(vOldCode) > vRow) and (Length(vOldCode[vRow]) > vCol) then
            begin
              OrderAcctButton[vRow, vCol].Hint                  := vOldCode[vRow, vCol];
              OrderAcctButton[vRow, vCol].HelpKeyword           := vOldName[vRow, vCol];
              OrderAcctButton[vRow, vCol].Color                 := vOldBColor[vRow, vCol];
              OrderAcctButton[vRow, vCol].Appearance.Font.Color := vOldFColor[vRow, vCol];
              OrderAcctButton[vRow, vCol].Caption               := vOldText[vRow, vCol];
            end;

end;

procedure TSystemPosDesignForm.OrderAcctFontNameComboBoxDblClick(
  Sender: TObject);
begin
  inherited;
  if DesignFontDialog.Execute then
    (Sender as TcxFontNameComboBox).FontName := DesignFontDialog.Font.Name;
end;

procedure TSystemPosDesignForm.OrderAcctFontNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var vIndex :Integer;
begin
  inherited;
  if Sender = PluClassFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := PluClassFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(PluClassFontSizeEdit.Value);
    DesignFontDialog.Font.Color := PluClassFontColorPanel.Color;
    if PluClassFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      PluClassFontNameEdit.Text        := DesignFontDialog.Font.Name;
      PluClassFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      PluClassFontColorPanel.Color     := DesignFontDialog.Font.Color;
      PluClassFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                         := true;
      isPluChanged                      := true;
    end;
  end
  else if Sender = PluMenuFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := PluMenuFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(PluMenuFontSizeEdit.Value);
    DesignFontDialog.Font.Color := PluMenuFontColorPanel.Color;
    if PluMenuFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      PluMenuFontNameEdit.Text        := DesignFontDialog.Font.Name;
      PluMenuFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      PluMenuFontColorPanel.Color     := DesignFontDialog.Font.Color;
      PluMenuFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                         := true;
      isPluChanged                      := true;
    end;
  end
  else if Sender = PluMenuPriceFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := PluMenuPriceFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(PluMenuPriceFontSizeEdit.Value);
    DesignFontDialog.Font.Color := PluMenuPriceFontColorPanel.Color;
    if PluMenuPriceFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      PluMenuPriceFontNameEdit.Text        := DesignFontDialog.Font.Name;
      PluMenuPriceFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      PluMenuPriceFontColorPanel.Color     := DesignFontDialog.Font.Color;
      PluMenuPriceFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                         := true;
      isPluChanged                      := true;
    end;
  end
  else if Sender = OrderAcctFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := OrderAcctFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(OrderAcctFontSizeEdit.Value);
    DesignFontDialog.Font.Color := OrderAcctFontColorPanel.Color;
    if OrderAcctFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      OrderAcctFontNameEdit.Text        := DesignFontDialog.Font.Name;
      OrderAcctFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      OrderAcctFontColorPanel.Color     := DesignFontDialog.Font.Color;
      OrderAcctFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                         := true;
      isOrderAcctButtonChanged          := true;

      for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
        if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font := DesignFontDialog.Font;
        end;
    end;
  end
  else if Sender = OrderFunctionFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := OrderFunctionFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(OrderFunctionFontSizeEdit.Value);
    DesignFontDialog.Font.Color := OrderFunctionFontColorPanel.Color;
    if OrderFunctionFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      OrderFunctionFontNameEdit.Text        := DesignFontDialog.Font.Name;
      OrderFunctionFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      OrderFunctionFontColorPanel.Color     := DesignFontDialog.Font.Color;
      OrderFunctionFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                         := true;
      isOrderFunctionButtonChanged          := true;

      for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
        if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font := DesignFontDialog.Font;
    end;
  end
  else if Sender = ReceiptFunctionFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := ReceiptFunctionFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(ReceiptFunctionFontSizeEdit.Value);
    DesignFontDialog.Font.Color := ReceiptFunctionFontColorPanel.Color;
    if ReceiptFunctionFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      ReceiptFunctionFontNameEdit.Text        := DesignFontDialog.Font.Name;
      ReceiptFunctionFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      ReceiptFunctionFontColorPanel.Color     := DesignFontDialog.Font.Color;
      ReceiptFunctionFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                         := true;
      isReceiptFunctionButtonChanged          := true;

      for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
        if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font := DesignFontDialog.Font;
        end;
    end;
  end
  else if Sender = TableFunctionFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := TableFunctionFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(TableFunctionFontSizeEdit.Value);
    DesignFontDialog.Font.Color := TableFunctionFontColorPanel.Color;
    if TableFunctionFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      TableFunctionFontNameEdit.Text        := DesignFontDialog.Font.Name;
      TableFunctionFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      TableFunctionFontColorPanel.Color     := DesignFontDialog.Font.Color;
      TableFunctionFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                         := true;
      isTableFunctionButtonChanged          := true;

      for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
        if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font := DesignFontDialog.Font;
        end;
    end;
  end
  else if Sender = FloorFontNameEdit then
  begin
    DesignFontDialog.Font.Name  := FloorFontNameEdit.Text;
    DesignFontDialog.Font.Size  := Trunc(FloorFontSizeEdit.Value);
    DesignFontDialog.Font.Color := FloorFontColorPanel.Color;
    if FloorFontBoldCheckBox.Checked then
      DesignFontDialog.Font.Style := [fsBold];
    if DesignFontDialog.Execute then
    begin
      FloorFontNameEdit.Text        := DesignFontDialog.Font.Name;
      FloorFontSizeEdit.Value       := DesignFontDialog.Font.Size;
      FloorFontColorPanel.Color     := DesignFontDialog.Font.Color;
      FloorFontBoldCheckBox.Checked := fsBold in DesignFontDialog.Font.Style;
      isChanged                     := true;
      isTableFunctionButtonChanged  := true;
    end;
  end

end;

//주문화면 기능버튼 생성
procedure TSystemPosDesignForm.OrderFunctionCreateButtonClick(Sender: TObject);
var
  vOldCode, vOldName, vOldText: array of array of string;
  vOldBColor, vOldFColor: array of array of TColor;
  vRow, vCol: Integer;
begin
  inherited;

  // 기존 기능 백업
  if Assigned(OrderFunctionButton) and (Length(OrderFunctionButton) > 0) then
  begin
    SetLength(vOldCode,   Length(OrderFunctionButton));
    SetLength(vOldName,   Length(OrderFunctionButton));
    SetLength(vOldText,   Length(OrderFunctionButton));
    SetLength(vOldBColor, Length(OrderFunctionButton));
    SetLength(vOldFColor, Length(OrderFunctionButton));
    for vRow := Low(OrderFunctionButton) to High(OrderFunctionButton) do
      if Assigned(OrderFunctionButton[vRow]) and (Length(OrderFunctionButton[vRow]) > 0) then
      begin
        SetLength(vOldCode[vRow],   Length(OrderFunctionButton[vRow]));
        SetLength(vOldName[vRow],   Length(OrderFunctionButton[vRow]));
        SetLength(vOldText[vRow],   Length(OrderFunctionButton[vRow]));
        SetLength(vOldBColor[vRow], Length(OrderFunctionButton[vRow]));
        SetLength(vOldFColor[vRow], Length(OrderFunctionButton[vRow]));
        for vCol := Low(OrderFunctionButton[vRow]) to High(OrderFunctionButton[vRow]) do
        begin
          vOldCode[vRow, vCol]   := OrderFunctionButton[vRow, vCol].Hint;
          vOldName[vRow, vCol]   := OrderFunctionButton[vRow, vCol].HelpKeyword;
          vOldText[vRow, vCol]   := OrderFunctionButton[vRow, vCol].Caption;
          vOldBColor[vRow, vCol] := OrderFunctionButton[vRow, vCol].Color;
          vOldFColor[vRow, vCol] := OrderFunctionButton[vRow, vCol].Appearance.Font.Color;
        end;
      end;
  end;

  // 버튼을 새로 만든다
  if CreateOrderFunctionButton(true) then
    // 백업한 기능을 불러온다
    if Assigned(OrderFunctionButton) and (Length(OrderFunctionButton) > 0) then
      for vRow := Low(OrderFunctionButton) to High(OrderFunctionButton) do
        if Assigned(OrderFunctionButton[vRow]) and (Length(OrderFunctionButton[vRow]) > 0) then
          for vCol := Low(OrderFunctionButton[vRow]) to High(OrderFunctionButton[vRow]) do
            if (Length(vOldCode) > vRow) and (Length(vOldCode[vRow]) > vCol) then
            begin
              OrderFunctionButton[vRow, vCol].Hint                  := vOldCode[vRow, vCol];
              OrderFunctionButton[vRow, vCol].HelpKeyword           := vOldName[vRow, vCol];
              OrderFunctionButton[vRow, vCol].Color                 := vOldBColor[vRow, vCol];
              OrderFunctionButton[vRow, vCol].Appearance.Font.Color := vOldFColor[vRow, vCol];
              OrderFunctionButton[vRow, vCol].Caption               := vOldText[vRow, vCol];
            end;
end;

procedure TSystemPosDesignForm.PluClassColorPanelClick(Sender: TObject);
var vIndex :Integer;
    vColor :TColor;
begin
  inherited;
  FunctionKeyColorDialog.Color := (Sender as TPanel).Color;
  if FunctionKeyColorDialog.Execute then
  begin
    (Sender as TPanel).Color := FunctionKeyColorDialog.Color;
    (Sender as TPanel).Tag   := 1;
    vColor := FunctionKeyColorDialog.Color;
    isChanged         := true;
    case ButtonDesignPageControl.ActivePageIndex of
      1 : isPluChanged                   := true;
      2 : isOrderAcctButtonChanged       := true;
      3 : isOrderFunctionButtonChanged   := true;
      4 : isReceiptFunctionButtonChanged := true;
      5 : isTableFunctionButtonChanged   := true;
    end;
    if Sender = OrderAcctColorPanel then
    begin
      for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
        if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color  := vColor;
        end;
    end
    else if Sender = OrderAcctBorderColorPanel then
    begin
      for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
        if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).BevelColor  := vColor;
        end;
    end
    else if Sender = OrderAcctFontColorPanel then
    begin
      for vIndex := 0 to OrderAcctButtonPanel.ControlCount-1 do
        if OrderAcctButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (OrderAcctButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color := vColor;
        end;
    end
    else if Sender = OrderFunctionColorPanel then
    begin
      for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
        if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color := vColor;
        end;
    end
    else if Sender = OrderFunctionBorderColorPanel then
    begin
      for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
        if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).BevelColor := vColor;
        end;
    end
    else if Sender = OrderFunctionFontColorPanel then
    begin
      for vIndex := 0 to OrderFunctionButtonPanel.ControlCount-1 do
        if OrderFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (OrderFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color := vColor;
        end;
    end
    else if Sender = ReceiptFunctionColorPanel then
    begin
      for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
        if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color := vColor;
        end;
    end
    else if Sender = ReceiptFunctionBorderColorPanel then
    begin
      for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
        if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).BevelColor := vColor;
        end;
    end
    else if Sender = ReceiptFunctionFontColorPanel then
    begin
      for vIndex := 0 to ReceiptFunctionButtonPanel.ControlCount-1 do
        if ReceiptFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (ReceiptFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color := vColor;
        end;
    end
    else if Sender = TableFunctionColorPanel then
    begin
      for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
        if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Color := vColor;
        end;
    end
    else if Sender = TableFunctionBorderColorPanel then
    begin
      for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
        if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).BevelColor := vColor;
        end;
    end
    else if Sender = TableFunctionFontColorPanel then
    begin
      for vIndex := 0 to TableFunctionButtonPanel.ControlCount-1 do
        if TableFunctionButtonPanel.Controls[vIndex] is TAdvSmoothButton then
        begin
          (TableFunctionButtonPanel.Controls[vIndex] as TAdvSmoothButton).Appearance.Font.Color := vColor;
        end;
    end;
  end;
end;

procedure TSystemPosDesignForm.PosPanel1ImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) and (Sender is TImage) then
    TImage(Sender).BeginDrag(false);
end;


procedure TSystemPosDesignForm.ReceiptCreateButtonClick(Sender: TObject);
var
  vOldCode, vOldName, vOldText: array of string;
  vOldBColor, vOldFColor: array of TColor;
  vIndex: Integer;
begin
  inherited;
  if ReceiptFunctionButtonCountEdit.Value = 0 then
  begin
    for vIndex := Low(ReceiptFunctionButton) to High(ReceiptFunctionButton) do
    begin
      ReceiptFunctionButton[vIndex].Free;
      ReceiptFunctionButton[vIndex] := nil;
    end;
    SetLength(ReceiptFunctionButton,0);
    isReceiptFunctionButtonChanged := true;
    Exit;
  end;

  // 기존 기능 백업
  if Assigned(ReceiptFunctionButton) and (Length(ReceiptFunctionButton) > 0) then
  begin
    SetLength(vOldCode,   Length(ReceiptFunctionButton));
    SetLength(vOldName,   Length(ReceiptFunctionButton));
    SetLength(vOldText,   Length(ReceiptFunctionButton));
    SetLength(vOldBColor, Length(ReceiptFunctionButton));
    SetLength(vOldFColor, Length(ReceiptFunctionButton));
    for vIndex := Low(ReceiptFunctionButton) to High(ReceiptFunctionButton) do
      if Assigned(ReceiptFunctionButton) and (Length(ReceiptFunctionButton) > 0) then
      begin
        vOldCode[vIndex]   := ReceiptFunctionButton[vIndex].Hint;
        vOldName[vIndex]   := ReceiptFunctionButton[vIndex].HelpKeyword;
        vOldText[vIndex]   := ReceiptFunctionButton[vIndex].Caption;
        vOldBColor[vIndex] := ReceiptFunctionButton[vIndex].Color;
        vOldFColor[vIndex] := ReceiptFunctionButton[vIndex].Appearance.Font.Color;
      end;
  end;

  // 버튼을 새로 만든다
  if CreateReceiptFunctionButton(true) then
    // 백업한 기능을 불러온다
    if Assigned(ReceiptFunctionButton) and (Length(ReceiptFunctionButton) > 0) then
      for vIndex := Low(ReceiptFunctionButton) to High(ReceiptFunctionButton) do
        if (Length(vOldCode) > vIndex) then
        begin
          ReceiptFunctionButton[vIndex].Hint        := vOldCode[vIndex];
          ReceiptFunctionButton[vIndex].HelpKeyword := vOldName[vIndex];
          ReceiptFunctionButton[vIndex].Color       := vOldBColor[vIndex];
          ReceiptFunctionButton[vIndex].Appearance.Font.Size   := ReceiptFunctionFontSizeEdit.Value;
          ReceiptFunctionButton[vIndex].Appearance.Font.Color  := vOldFColor[vIndex];
          if ReceiptFunctionFontBoldCheckBox.Checked then
            ReceiptFunctionButton[vIndex].Appearance.Font.Style  := [fsBold]
          else
            ReceiptFunctionButton[vIndex].Appearance.Font.Style  := [];
          ReceiptFunctionButton[vIndex].Caption     := vOldText[vIndex];
        end;
end;


procedure TSystemPosDesignForm.OrderAcctButtonClick(Sender: TObject);
const
  FunctionKey: array[0..11, 0..1] of string = (
                  ('00', '계산완료'),
                  ('01', '신용카드'),
                  ('02', '복합결제'),
                  ('03', '현금영수증'),
                  ('04', '수표'),
                  ('05', '포인트'),
                  ('06', '외상결제'),
                  ('07', '상품권'),
                  ('08', '계좌입금'),
                  ('10', '결제취소'),
                  ('11', '선결제'),
                  ('12', '간편결제')
                );
                //추가시 결제 09 사용
var
  vIndex   : Integer;
  vCode    : PStrPointer;
begin
  FunctionListBox.Items.Clear;
  for vIndex := 0 to High(FunctionKey) do
  begin
    New(vCode);
    vCode^.Data           := FunctionKey[vIndex, 0];
    FunctionListBox.Items.AddObject(FunctionKey[vIndex,1], TObject(vCode));
  end;

  // 기능 대화상자를 보여준다
  FunctionKeyDialogPanel.Left    := (ButtonDesignPageControl.Width  - FunctionKeyDialogPanel.Width ) div 2 + Left;
  FunctionKeyDialogPanel.Top     := (ButtonDesignPageControl.Height - FunctionKeyDialogPanel.Height) div 2 + Top;
  FunctionKeyDialogPanel.Visible := true;
  FunctionKeyDialogPanel.Hint    := TAdvSmoothButton(Sender).Name; // 어떤 버튼이 호출했는지 저장해둔다
  FunctionKeyButtonColorPanel.Color := TAdvSmoothButton(Sender).Color;
  FunctionKeyFontColorPanel.Color   := TAdvSmoothButton(Sender).Appearance.Font.Color;
  FunctionKeyFontSizeEdit.Value     := TAdvSmoothButton(Sender).Appearance.Font.Size;
  FunctionKeyDialogPanel.BringToFront;
  FunctionListBox.SetFocus;

  // 기존에 지정한 기능을 표시한다
  if TAdvSmoothButton(Sender).Caption <> '' then
  begin
    FunctionKeyDialogFunctionEdit.Text := TAdvSmoothButton(Sender).HelpKeyword;
    FunctionKeyDialogTextEdit.Text     := Replace(TAdvSmoothButton(Sender).Caption, #13, FunctionKeyDialogSplitButton.Caption);
    FunctionKeyDialogTextEdit.Hint     := TAdvSmoothButton(Sender).Hint;
  end
  else
    FunctionKeyDialogDeleteButton.Click;
end;

procedure TSystemPosDesignForm.OrderFunctionButtonClick(Sender: TObject);
const
  FunctionKey: array[0..51, 0..1] of string = (
                  ('00', '수량추가'),
                  ('01', '수량빼기'),
                  ('02', '수량변경'),
                  ('03', '지정취소'),
                  ('04', '전체취소'),
                  ('05', '할인'),
                  ('06', '직전출력'),
                  ('07', '포장'),
                  ('08', '서비스'),
                  ('09', '바코드'),
                  ('10', '고객정보'),
                  ('11', '회원조회'),
                  ('12', '주방메모'),
                  ('13', '담당자'),
                  ('14', '보류복원'),
                  ('15', '주문서재출력'),
                  ('16', '회원등록'),
                  ('17', '돈통열기'),
                  ('18', '곱빼기'),
                  ('19', '영수증관리'),
                  ('20', '봉사료'),
                  ('21', '선결제'),
                  ('22', '메뉴번호'),
                  ('23', '상품조회'),
                  ('24', '벨호출'),
                  ('25', '반품'),
                  ('26', '테이블메모'),
                  ('27', '대기표'),
                  ('28', '메뉴수정'),
                  ('29', '쿠폰사용'),
                  ('30', '배달주문'),
                  ('31', '단가변경'),
                  ('32', '더치페이'),
                  ('33', '예약'),
                  ('34', '다중모드해제'),
                  ('35', '스템프사용'),
                  ('36', '메뉴조회'),
                  ('37', '주문'),
                  ('38', '결제취소'),
                  ('39', '중간계산서'),
                  ('40', '렛츠오더'),
                  ('41', '계산완료'),
                  ('42', '신용카드'),
                  ('43', '복합결제'),
                  ('44', '렛츠오더싱크'),
                  ('45', '닫기'),
                  ('46', '배달주문'),
                  ('47', '전화번호입력'),
                  ('48', '당일재고'),
                  ('49', '전체서비스'),
                  ('50', '전체포장'),
                  ('51', '현금영수증')
                  );
var
  vIndex   : Integer;
  vCode    : PStrPointer;
begin
  FunctionListBox.Items.Clear;
  for vIndex := 0 to High(FunctionKey) do
  begin
    New(vCode);
    vCode^.Data           := FunctionKey[vIndex, 0];
    FunctionListBox.Items.AddObject(FunctionKey[vIndex,1], TObject(vCode));
  end;

  // 기능 대화상자를 보여준다
  FunctionKeyDialogPanel.Left    := (ButtonDesignPageControl.Width  - FunctionKeyDialogPanel.Width ) div 2 + Left;
  FunctionKeyDialogPanel.Top     := (ButtonDesignPageControl.Height - FunctionKeyDialogPanel.Height) div 2 + Top;
  FunctionKeyDialogPanel.Visible := true;
  FunctionKeyDialogPanel.Hint    := TAdvSmoothButton(Sender).Name; // 어떤 버튼이 호출했는지 저장해둔다
  FunctionKeyButtonColorPanel.Color := TAdvSmoothButton(Sender).Color;
  FunctionKeyFontColorPanel.Color   := TAdvSmoothButton(Sender).Appearance.Font.Color;
  FunctionKeyFontSizeEdit.Value     := TAdvSmoothButton(Sender).Appearance.Font.Size;
  FunctionKeyDialogPanel.BringToFront;
  FunctionListBox.SetFocus;

  // 기존에 지정한 기능을 표시한다
  if TAdvSmoothButton(Sender).Caption <> '' then
  begin
    FunctionKeyDialogFunctionEdit.Text := TAdvSmoothButton(Sender).HelpKeyword;
    FunctionKeyDialogTextEdit.Text     := Replace(TAdvSmoothButton(Sender).Caption, #13, FunctionKeyDialogSplitButton.Caption);
    FunctionKeyDialogTextEdit.Hint     := TAdvSmoothButton(Sender).Hint;
  end
  else
    FunctionKeyDialogDeleteButton.Click;
end;

procedure TSystemPosDesignForm.ReceiptFunctionButtonClick(Sender: TObject);
const
  FunctionKey: array[0..9, 0..1] of string = (
                  ('00', '영수증조회'),
                  ('01', '간이영수증'),
                  ('02', '카드조회'),
                  ('03', '포인트적립'),
                  ('04', '결제변경'),
                  ('05', '영수증재출력'),
                  ('06', '현금영수증'),
                  ('07', '결제취소'),
                  ('08', '판매전환'),
                  ('09', '포스변경')
                );
var
  vIndex   : Integer;
  vCode    : PStrPointer;
begin
  FunctionListBox.Items.Clear;
  for vIndex := 0 to High(FunctionKey) do
  begin
    New(vCode);
    vCode^.Data           := FunctionKey[vIndex, 0];
    FunctionListBox.Items.AddObject(FunctionKey[vIndex,1], TObject(vCode));
  end;

  // 기능 대화상자를 보여준다
  FunctionKeyDialogPanel.Left    := (ButtonDesignPageControl.Width  - FunctionKeyDialogPanel.Width ) div 2 + Left;
  FunctionKeyDialogPanel.Top     := (ButtonDesignPageControl.Height - FunctionKeyDialogPanel.Height) div 2 + Top;
  FunctionKeyDialogPanel.Visible := true;
  FunctionKeyDialogPanel.Hint    := TAdvSmoothButton(Sender).Name; // 어떤 버튼이 호출했는지 저장해둔다
  FunctionKeyButtonColorPanel.Color := TAdvSmoothButton(Sender).Color;
  FunctionKeyFontColorPanel.Color   := TAdvSmoothButton(Sender).Appearance.Font.Color;
  FunctionKeyFontSizeEdit.Value     := TAdvSmoothButton(Sender).Appearance.Font.Size;
  FunctionKeyDialogPanel.BringToFront;
  FunctionListBox.SetFocus;

  // 기존에 지정한 기능을 표시한다
  if TAdvSmoothButton(Sender).Caption <> '' then
  begin
    FunctionKeyDialogFunctionEdit.Text := TAdvSmoothButton(Sender).HelpKeyword;
    FunctionKeyDialogTextEdit.Text     := Replace(TAdvSmoothButton(Sender).Caption, #13, FunctionKeyDialogSplitButton.Caption);
    FunctionKeyDialogTextEdit.Hint     := TAdvSmoothButton(Sender).Hint;
  end
  else
    FunctionKeyDialogDeleteButton.Click;
end;

procedure TSystemPosDesignForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ConditionToolBarComboBox.Enabled := not aChanged;
end;

procedure TSystemPosDesignForm.ShowPosMode;
var vRow, vCol :Integer;
begin
  for vRow := Low(OrderFunctionButton) to High(OrderFunctionButton) do
    for vCol := Low(OrderFunctionButton[vRow]) to High(OrderFunctionButton[vRow]) do
    begin
      OrderFunctionButton[vRow][vCol].Width   := OrderFunctionWidth ;
      OrderFunctionButton[vRow][vCol].Height  := OrderFunctionHeight;
      OrderFunctionButton[vRow][vCol].Tag   := 0;
    end;

  //버튼 합치기(가로)
  for vRow := Low(OrderFunctionButton) to High(OrderFunctionButton) do
    for vCol := Low(OrderFunctionButton[vRow]) to High(OrderFunctionButton[vRow])-1 do
    begin
      if (OrderFunctionButton[vRow][vCol].HelpKeyword = '') or (OrderFunctionButton[vRow][vCol].Tag = 1) then Continue;

      //다음버튼과 기능이 같을때
      if (OrderFunctionButton[vRow][vCol].HelpKeyword = OrderFunctionButton[vRow][vCol+1].HelpKeyword) then
      begin
        OrderFunctionButton[vRow][vCol].Width  := OrderFunctionWidth * 2 ;
        OrderFunctionButton[vRow][vCol+1].Tag    :=1;
        if vRow < High(OrderFunctionButton) then
        begin
          if (OrderFunctionButton[vRow][vCol].HelpKeyword = OrderFunctionButton[vRow+1][vCol].HelpKeyword) and (OrderFunctionButton[vRow+1][vCol].HelpKeyword = OrderFunctionButton[vRow+1][vCol+1].HelpKeyword) then
          begin
            OrderFunctionButton[vRow][vCol].Appearance.Layout  := blPictureTop;
            OrderFunctionButton[vRow][vCol].Height  := OrderFunctionHeight * 2 + 2 ;
            OrderFunctionButton[vRow][vCol].Tag     := 1;
            OrderFunctionButton[vRow+1][vCol].Tag   := 1;
            OrderFunctionButton[vRow+1][vCol+1].Tag := 1;
          end
        end;
        OrderFunctionButton[vRow][vCol].BringToFront;
        Continue;
      end;
    end;


  //버튼 합치기(세로)
  for vRow := Low(OrderFunctionButton) to High(OrderFunctionButton)-1 do
    for vCol := Low(OrderFunctionButton[vRow]) to High(OrderFunctionButton[vRow]) do
  begin
    if (OrderFunctionButton[vRow][vCol].HelpKeyword = '') or (OrderFunctionButton[vRow][vCol].Tag = 1) then Continue;

    //다음버튼과 기능이 같을때
    if Assigned(OrderFunctionButton[vRow+1, vCol]) and (OrderFunctionButton[vRow][vCol].HelpKeyword = OrderFunctionButton[vRow+1][vCol].HelpKeyword) then
    begin
      OrderFunctionButton[vRow][vCol].Appearance.Layout  := blPictureTop;
      OrderFunctionButton[vRow][vCol].Height  := OrderFunctionHeight * 2 + 2 ;
      OrderFunctionButton[vRow+1][vCol].Tag   :=1;
      OrderFunctionButton[vRow][vCol].BringToFront;
      Continue;
    end;
  end;
end;

procedure TSystemPosDesignForm.ShowPosModeAcct;
var vRow, vCol :Integer;
begin
  for vRow := Low(OrderAcctButton) to High(OrderAcctButton) do
    for vCol := Low(OrderAcctButton[vRow]) to High(OrderAcctButton[vRow]) do
    begin
      OrderAcctButton[vRow][vCol].Width   := OrderAcctionWidth ;
      OrderAcctButton[vRow][vCol].Height  := OrderAcctionHeight;
      OrderAcctButton[vRow][vCol].Tag   := 0;
    end;

  //버튼 합치기
  for vRow := Low(OrderAcctButton) to High(OrderAcctButton) do
    for vCol := Low(OrderAcctButton[vRow]) to High(OrderAcctButton[vRow])-1 do
  begin
    if (OrderAcctButton[vRow][vCol].HelpKeyword = '') or (OrderAcctButton[vRow][vCol].HelpKeyword = 'XX') or (OrderAcctButton[vRow][vCol].Tag = 1) then Continue;

    //다음버튼과 기능이 같을때
    if (OrderAcctButton[vRow][vCol].HelpKeyword = OrderAcctButton[vRow][vCol+1].HelpKeyword) then
    begin
      OrderAcctButton[vRow][vCol].Width  := OrderAcctButton[vRow][vCol].Width * 2 ;
      OrderAcctButton[vRow][vCol+1].Tag    :=1;
      if vRow < High(OrderAcctButton) then
      begin
        if (OrderAcctButton[vRow][vCol].Hint = OrderAcctButton[vRow+1][vCol].HelpKeyword) and (OrderAcctButton[vRow+1][vCol].HelpKeyword = OrderAcctButton[vRow+1][vCol+1].HelpKeyword) then
        begin
          OrderAcctButton[vRow][vCol].Appearance.Layout  := blPictureTop;;
          OrderAcctButton[vRow][vCol].Height  := OrderAcctButton[vRow][vCol].Height * 2 ;
          OrderAcctButton[vRow][vCol].Tag     := 1;
          OrderAcctButton[vRow+1][vCol].Tag   := 1;
          OrderAcctButton[vRow+1][vCol+1].Tag := 1;
        end
      end;
      OrderAcctButton[vRow][vCol].BringToFront;
      Continue;
    end;
  end;

  //버튼 합치기(세로)
  for vRow := Low(OrderAcctButton) to High(OrderAcctButton)-1 do
    for vCol := Low(OrderAcctButton[vRow]) to High(OrderAcctButton[vRow]) do
  begin
    if (OrderAcctButton[vRow][vCol].HelpKeyword = '') or (OrderAcctButton[vRow][vCol].HelpKeyword = 'XX') or (OrderAcctButton[vRow][vCol].Tag = 1) then Continue;

    //다음버튼과 기능이 같을때
    if Assigned(OrderAcctButton[vRow+1][vCol]) and (OrderAcctButton[vRow][vCol].HelpKeyword = OrderAcctButton[vRow+1][vCol].HelpKeyword) then
    begin
      OrderAcctButton[vRow][vCol].Appearance.Layout  :=  blPictureTop;;
      OrderAcctButton[vRow][vCol].Height  := OrderAcctButton[vRow][vCol].Height * 2 ;
      OrderAcctButton[vRow+1][vCol].Tag   :=1;
      OrderAcctButton[vRow][vCol].BringToFront;
      Continue;
    end;
  end;

end;

procedure TSystemPosDesignForm.TableCreateButtonClick(Sender: TObject);
var
  vOldCode, vOldName, vOldText: array of string;
  vOldBColor, vOldFColor: array of TColor;
  vIndex: Integer;
begin
  inherited;
  if TableFunctionButtonCountEdit.Value = 0 then
  begin
    for vIndex := Low(TableFunctionButton) to High(TableFunctionButton) do
    begin
      TableFunctionButton[vIndex].Free;
      TableFunctionButton[vIndex] := nil;
    end;
    SetLength(TableFunctionButton,0);
    isTableFunctionButtonChanged := true;
    Exit;
  end;

  // 기존 기능 백업
  if Assigned(TableFunctionButton) and (Length(TableFunctionButton) > 0) then
  begin
    SetLength(vOldCode,   Length(TableFunctionButton));
    SetLength(vOldName,   Length(TableFunctionButton));
    SetLength(vOldText,   Length(TableFunctionButton));
    SetLength(vOldBColor, Length(TableFunctionButton));
    SetLength(vOldFColor, Length(TableFunctionButton));
    for vIndex := Low(TableFunctionButton) to High(TableFunctionButton) do
      if Assigned(TableFunctionButton) and (Length(TableFunctionButton) > 0) then
      begin
        vOldCode[vIndex]   := TableFunctionButton[vIndex].Hint;
        vOldName[vIndex]   := TableFunctionButton[vIndex].HelpKeyword;
        vOldText[vIndex]   := TableFunctionButton[vIndex].Caption;
        vOldBColor[vIndex] := TableFunctionButton[vIndex].Color;
        vOldFColor[vIndex] := TableFunctionButton[vIndex].Appearance.Font.Color;
      end;
  end;

  // 버튼을 새로 만든다
  if CreateTableFunctionButton(true) then
    // 백업한 기능을 불러온다
    if Assigned(TableFunctionButton) and (Length(TableFunctionButton) > 0) then
      for vIndex := Low(TableFunctionButton) to High(TableFunctionButton) do
        if (Length(vOldCode) > vIndex) then
        begin
          TableFunctionButton[vIndex].Hint        := vOldCode[vIndex];
          TableFunctionButton[vIndex].HelpKeyword := vOldName[vIndex];
          TableFunctionButton[vIndex].Color       := vOldBColor[vIndex];
          TableFunctionButton[vIndex].Appearance.Font.Size   := TableFunctionFontSizeEdit.Value;
          TableFunctionButton[vIndex].Appearance.Font.Color  := vOldFColor[vIndex];
          if TableFunctionFontBoldCheckBox.Checked then
            TableFunctionButton[vIndex].Appearance.Font.Style  := [fsBold]
          else
            TableFunctionButton[vIndex].Appearance.Font.Style  := [];
          TableFunctionButton[vIndex].Caption     := vOldText[vIndex];
        end;

  TableButtonHeightEdit.Value := 0;
end;

procedure TSystemPosDesignForm.TableFunctionButtonClick(Sender: TObject);
const
  FunctionKey: array[0..29, 0..1] of string = (
                  ('00', '좌석이동'),
                  ('01', '좌석합석'),
                  ('02', '그룹지정'),
                  ('03', '그룹해제'),
                  ('04', '메뉴이동'),
                  ('05', '예약'),
                  ('06', '재인쇄'),
                  ('07', '배달'),
                  ('08', '돈통열기'),
                  ('09', '영수증관리'),
                  ('10', '출납부'),
                  ('11', '출퇴근'),
                  ('12', '직전출력'),
                  ('13', 'Take Out'),
                  ('14', '대기표'),
                  ('15', '더치페이'),
                  ('16', '테이블정리'),
                  ('17', '메뉴추가'),
                  ('18', '메뉴수정'),
                  ('19', '렛츠오더'),
                  ('20', '선결제내역'),
                  ('21', '태블릿관리'),
                  ('22', '호출내역'),
                  ('23', '주문이력'),
                  ('24', '배달주문'),
                  ('25', '배민'),
                  ('26', '쿠팡이츠'),
                  ('27', '요기요'),
                  ('28', '품절관리'),
                  ('29', '당일재고')
                );
var
  vIndex   : Integer;
  vCode    : PStrPointer;
begin
  FunctionListBox.Items.Clear;
  for vIndex := 0 to High(FunctionKey) do
  begin
    New(vCode);
    vCode^.Data           := FunctionKey[vIndex, 0];
    FunctionListBox.Items.AddObject(FunctionKey[vIndex,1], TObject(vCode));
  end;

  // 기능 대화상자를 보여준다
  FunctionKeyDialogPanel.Left    := (ButtonDesignPageControl.Width  - FunctionKeyDialogPanel.Width ) div 2 + Left;
  FunctionKeyDialogPanel.Top     := (ButtonDesignPageControl.Height - FunctionKeyDialogPanel.Height) div 2 + Top;
  FunctionKeyDialogPanel.Visible := true;
  FunctionKeyDialogPanel.Hint    := TAdvSmoothButton(Sender).Name; // 어떤 버튼이 호출했는지 저장해둔다
  FunctionKeyButtonColorPanel.Color := TAdvSmoothButton(Sender).Color;
  FunctionKeyFontColorPanel.Color   := TAdvSmoothButton(Sender).Appearance.Font.Color;
  FunctionKeyFontSizeEdit.Value     := TAdvSmoothButton(Sender).Appearance.Font.Size;
  FunctionKeyDialogPanel.BringToFront;
  FunctionListBox.SetFocus;

  // 기존에 지정한 기능을 표시한다
  if TAdvSmoothButton(Sender).Caption <> '' then
  begin
    FunctionKeyDialogFunctionEdit.Text := TAdvSmoothButton(Sender).HelpKeyword;
    FunctionKeyDialogTextEdit.Text     := Replace(TAdvSmoothButton(Sender).Caption, #13, FunctionKeyDialogSplitButton.Caption);
    FunctionKeyDialogTextEdit.Hint     := TAdvSmoothButton(Sender).Hint;
  end
  else
    FunctionKeyDialogDeleteButton.Click;
end;

end.
