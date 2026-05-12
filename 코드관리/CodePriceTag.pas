// 가격표/바코드 출력 (완료)

// DS_PRINT = 0을 사용
// DS_PRINT = 1은 쿠폰 디자인으로 사용하므로 1은 사용하지 말것

//##### 목록 따로 저장

//##### 각종 프린터 지원
//##### 이미지 크기 지정

unit CodePriceTag;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  cxContainer, cxEdit, Uni, DB, MemDS, cxTextEdit, cxDropDownEdit,
  cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton, cxStyles, Math,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, AdvSplitter,
  cxCurrencyEdit, cxSpinEdit, StdCtrls, cxLookAndFeelPainters, cxGroupBox,
  cxFontNameComboBox, cxCheckBox, Buttons, Menus, cxButtons, StrUtils,
  cxButtonEdit, GIFImg, ExtDlgs, CPortCtl, CPort, cxLookAndFeels, Winsock,
  Common, DBAccess, frxBarcode, frxClass, dxGDIPlusClasses, cxImage,
  cxRadioGroup, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TPCXGraphic = class(TBitmap)
  public
    procedure LoadFromStream(Stream: TStream); override;
  end;
  TPCXRLE = class
  public
    procedure Decode(var aSource: Pointer; aTarget: Pointer; aPackedSize, aUnpackedSize: Integer);
  end;

type
  TCodePriceTagForm = class(TInheritGridEditForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsShortName: TcxGridColumn;
    GridTableViewPrintQty: TcxGridColumn;
    TemplateLabel: TLabel;
    TemplateComboBox: TcxComboBox;
    ButtonToolBarPrintButton: TAdvGlowButton;
    TemplateBevel: TBevel;
    PrinterLabel: TLabel;
    PrinterComboBox: TcxComboBox;
    TagSizeLabel: TLabel;
    DirectionLabel: TLabel;
    PageMarginLabel: TLabel;
    TagMarginLabel: TLabel;
    TagSizeWidthLabel: TLabel;
    TagSizeHeightLabel: TLabel;
    TagSizeWidthMMLabel: TLabel;
    TagSizeHeightMMLabel: TLabel;
    TagSizeWidthEdit: TcxCurrencyEdit;
    TagSizeHeightEdit: TcxCurrencyEdit;
    DirectionComboBox: TcxComboBox;
    PageMarginTopLabel: TLabel;
    PageMarginTopEdit: TcxCurrencyEdit;
    PageMarginTopMMLabel: TLabel;
    PageMarginLeftLabel: TLabel;
    PageMarginLeftEdit: TcxCurrencyEdit;
    PageMarginLeftMMLabel: TLabel;
    TagMarginRightLabel: TLabel;
    TagMarginRightEdit: TcxCurrencyEdit;
    TagMarginRightMMLabel: TLabel;
    TagMarginBottomLabel: TLabel;
    TagMarginBottomEdit: TcxCurrencyEdit;
    TagMarginBottomMMLabel: TLabel;
    DesignGroupBox: TcxGroupBox;
    DesignCommentLabel: TLabel;
    DesignPanel: TPanel;
    DesignLocationTopLabel: TLabel;
    DesignLocationTopEdit: TcxCurrencyEdit;
    DesignLocationTopMMLabel: TLabel;
    DesignLocationLeftLabel: TLabel;
    DesignLocationLeftEdit: TcxCurrencyEdit;
    DesignLocationLeftMMLabel: TLabel;
    DesignLocationLabel: TLabel;
    DesignFontLabel: TLabel;
    DesignFontSizeLabel: TLabel;
    DesignFontSizeEdit: TcxCurrencyEdit;
    DesignFontSizeUnitLabel: TLabel;
    DesignTextLabel: TLabel;
    DesignTextEdit: TcxButtonEdit;
    DesignGoodsNameButton: TcxButton;
    ConditionToolBarUserComboBox: TcxComboBox;
    ConditionToolBarDayEdit: TcxCurrencyEdit;
    DesignGoodsCodeButton: TcxButton;
    DesignGoodsPriceButton: TcxButton;
    DesignLabelButton: TcxButton;
    DesignPopupMenu: TPopupMenu;
    DesignPopupGoodsName: TMenuItem;
    DesignPopupGoodsShortName: TMenuItem;
    DesignDeleteButton: TButton;
    DesignImageButton: TcxButton;
    DesignPopupGoodsCode: TMenuItem;
    DesignPopupBarcode: TMenuItem;
    DesignPopupSalePrice: TMenuItem;
    DesignPopupLabel1: TMenuItem;
    DesignPopupLabel2: TMenuItem;
    DesignPopupLabel3: TMenuItem;
    DesignPopupLabel4: TMenuItem;
    DesignPopupLabel5: TMenuItem;
    DesignPopupLabel6: TMenuItem;
    DesignPopupLabel7: TMenuItem;
    DesignPopupLabel8: TMenuItem;
    DesignPopupLabel9: TMenuItem;
    DesignPopupLabel0: TMenuItem;
    DesignPopupBackImage: TMenuItem;
    DesignPopupImage2: TMenuItem;
    DesignPopupImage3: TMenuItem;
    DesignPopupImage1: TMenuItem;
    DesignOpenPictureDialog: TOpenPictureDialog;
    DesignFontDialog: TFontDialog;
    DesignFontEdit: TcxButtonEdit;
    DesignAlignmentLabel: TLabel;
    DesignAlignmentComboBox: TcxComboBox;
    DesignTextCommentLabel: TLabel;
    FastReportUserDataSet: TfrxUserDataSet;
    FastReportBarCodeObject: TfrxBarCodeObject;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewSalePriceName: TcxGridColumn;
    ComPort: TComPort;
    ConditionToolBarTypeLabel: TcxLabel;
    ConditionToolBarKeepComboBox: TcxComboBox;
    ComPortPortComboBox: TcxComboBox;
    ComPortBaudRateComboBox: TcxComboBox;
    PaperTypeComboBox: TcxComboBox;
    DesignFontBoldCheckBox: TcxCheckBox;
    ButtonToolBarDeleteMenuButton: TAdvGlowMenuButton;
    ButtonToolBarDeleteMenuButtonPopupMenu: TPopupMenu;
    ButtonToolBarSaveMenuButtonPopupMenu: TPopupMenu;
    ButtonToolBarDeleteMenuButtonPopupMenuAll: TMenuItem;
    ButtonToolBarDeleteMenuButtonPopupMenuCounted: TMenuItem;
    ButtonToolBarDeleteMenuButtonPopupMenuNoCounted: TMenuItem;
    ButtonToolBarDeleteMenuButtonPopupMenuSelected: TMenuItem;
    ButtonToolBarSaveMenuButtonPopupMenuSelected: TMenuItem;
    ButtonToolBarSaveMenuButtonPopupMenuAll: TMenuItem;
    ButtonToolBarSaveMenuButtonPopupMenuCounted: TMenuItem;
    ButtonToolBarSaveMenuButtonPopupMenuNoCounted: TMenuItem;
    GridTableViewPrintType: TcxGridColumn;
    GridTableViewUserNo: TcxGridColumn;
    GridTableViewInsertDate: TcxGridColumn;
    GridTableViewPopupMenu: TPopupMenu;
    GridTableViewPopupMenuAdd: TMenuItem;
    GridTableViewPopupMenuSub: TMenuItem;
    GridTableViewPopupMenuClear: TMenuItem;
    GridTableViewPopupMenuChange: TMenuItem;
    ConditionToolBarTemplateLabel: TcxLabel;
    ConditionToolBarTemplateComboBox: TcxComboBox;
    GridTableViewPopupMenuLine: TMenuItem;
    GridTableViewPopupMenuSelectAll: TMenuItem;
    GridTableViewPopupMenuDeselectAll: TMenuItem;
    GridTableViewPopupMenuInverseSelect: TMenuItem;
    GridTableViewPopupMenuGoodsDelete: TMenuItem;
    ButtonToolBarSaveMenuButton: TAdvGlowButton;
    GridSearchPanel: TPanel;
    TouchGridSearchLabel: TLabel;
    GridSearchEdit: TcxTextEdit;
    DesignFontEnlargeLabel: TLabel;
    DesignFontEnlargeYCheckBox: TcxCheckBox;
    DesignFontEnlargeXCheckBox: TcxCheckBox;
    DesignPopupGoodsSpec: TMenuItem;
    GridTableViewGoodsSpec: TcxGridColumn;
    DesignImage1: TcxImage;
    DesignImage2: TcxImage;
    DesignImage3: TcxImage;
    DesignBarcode: TcxImage;
    BlankImage: TcxImage;
    DesignGoodsName: TcxLabel;
    DesignGoodsSpec: TcxLabel;
    DesignGoodsShortName: TcxLabel;
    DesignGoodsCode: TcxLabel;
    DesignSalePrice: TcxLabel;
    DesignLabel1: TcxLabel;
    DesignLabel2: TcxLabel;
    DesignLabel3: TcxLabel;
    DesignLabel4: TcxLabel;
    DesignLabel5: TcxLabel;
    DesignLabel6: TcxLabel;
    DesignLabel7: TcxLabel;
    DesignLabel8: TcxLabel;
    DesignLabel9: TcxLabel;
    DesignLabel0: TcxLabel;
    DesignBackImage: TcxImage;
    OrientationComboBox: TcxComboBox;
    PreviewCheckBox: TcxCheckBox;
    DriverNameLabel: TLabel;
    DriverNameEdit: TcxTextEdit;
    PrintPopupMenu: TPopupMenu;
    PreviewPrintMenuItem: TMenuItem;
    PrintMenuItem: TMenuItem;
    ColumCountLabel: TLabel;
    ColumCountEdit: TcxSpinEdit;
    ColumMarginLabel: TLabel;
    ColumMarginEdit: TcxCurrencyEdit;
    ColumMarginMMLabel: TLabel;
    FastReport: TfrxReport;
    TemplateNewButton: TAdvGlowButton;
    TemplateDeleteButton: TAdvGlowButton;
    TemplateSaveButton: TAdvGlowButton;
    GridSearchButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure TemplateComboBoxPropertiesChange(Sender: TObject);
    procedure TemplateNewButtonClick(Sender: TObject);
    procedure TemplateDeleteButtonClick(Sender: TObject);
    procedure TemplateSaveButtonClick(Sender: TObject);
    procedure MainPanelResize(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DesignPopupMenuPopup(Sender: TObject);
    procedure DesignPopupClick(Sender: TObject);
    procedure DesignEditPropertiesChange(Sender: TObject);
    procedure DesignPanelObjectClick(Sender: TObject);
    procedure DesignDeleteButtonClick(Sender: TObject);
    procedure DesignTextEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure DesignPanelObjectMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DesignPanelObjectMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DesignPanelObjectMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DesignTextEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DesignFontEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FastReportUserDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportUserDataSetGetValue(const VarName: string; var Value: Variant);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarDeleteMenuButtonPopupMenuSelectedClick(Sender: TObject);
    procedure ButtonToolBarDeleteMenuButtonPopupMenuAllClick(Sender: TObject);
    procedure GridTableViewPopupMenuAddClick(Sender: TObject);
    procedure GridTableViewPopupMenuSubClick(Sender: TObject);
    procedure GridTableViewPopupMenuChangeClick(Sender: TObject);
    procedure GridTableViewPopupMenuClearClick(Sender: TObject);
    procedure GridTableViewPopupMenuSelectAllClick(Sender: TObject);
    procedure GridTableViewPopupMenuDeselectAllClick(Sender: TObject);
    procedure GridTableViewPopupMenuInverseSelectClick(Sender: TObject);
    procedure GridTableViewPopupMenuGoodsDeleteClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridSearchButtonClick(Sender: TObject);
    procedure GridSearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DesignImageButtonClick(Sender: TObject);
    procedure DesignGroupBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    fSelectedControl: TControl;
    MouseDowned     : Boolean;
    MouseOldX,
    MouseOldY       : Integer;
    LPTFile         : THandle;

    procedure ClearTemplate;
    procedure ShowImage(aImage: TcxImage; aSelected: Boolean = true);
    procedure PrintNormal(aPreview:Boolean=false);
    procedure PrintBixolon;
    procedure PrintTSC;
    procedure LPTPortInit;

    procedure SetSelectedControl(aControl: TControl);
    property  SelectedControl: TControl read fSelectedControl write SetSelectedControl;
    procedure Proc_PRINT(var Message:TMessage); message WM_USER_PRINT;
    procedure SetKeepComboBox;

  protected
    function  DoSearch: Boolean; override;                      // 조회
  end;

var
  CodePriceTagForm: TCodePriceTagForm;



implementation

uses
  DBModule, Help;

const
  fmtPrice      = '%p';
  fmtDateFrom   = '%f';
  fmtDateTo     = '%t';
  fmtUnit       = '%u';
  fmtDCRate     = '%r';
  valSalePrice  = '15,000';
  valEventPrice = '10,000';
  valDateFrom   = '2010-01-01';
  valDateTo     = '2020-12-31';
  valUnit       = '100g';
  valUnitPrice  = '2,500';
  valDCRate     = '33%';
  FixedFontName = '돋움체';
  DefFontName   = '기본 글꼴';
  FixedFontSize = 10;
  mm2pt         = 4;     // mm를 화면용 포인트로 바꾸는 비율
  mm2dot        = 8;     // mm를 프린터용 도트로 바꾸는 비율
  prnNormal     = '0';
  prnBixolon    = '1';
  prnTSC        = '2';
  prnUserSize   = '3';
  prnTEC        = '4';
  prnZebraZ4M   = '5';
  prnZebra      = '6';
  prnHoneywell  = '7';    //PC42t
{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCodePriceTagForm.FormCreate(Sender: TObject);
var
  vIndex: Integer;
  vCode : PStrPointer;
begin
  inherited;
  DefaultDate     := ddToday;
  SelectedControl := nil;

  //포트에 기본 LPT를 넣는다
  ComPortPortComboBox.Properties.Items.Add('LPT');
  for vIndex := 1 to 20 do
    ComPortPortComboBox.Properties.Items.Add('COM'+IntToStr(vIndex));

  SetKeepComboBox;

  ConditionToolBarTemplateComboBox.Properties.Items.Clear;
  // 전체 추가
  New(vCode);
  vCode^.Data := EmptyStr;
  ConditionToolBarTemplateComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
  // 양식 미지정 추가
  New(vCode);
  vCode^.Data := '0';
  ConditionToolBarTemplateComboBox.Properties.Items.AddObject('출력양식 지정 안함', TObject(vCode));
  // 양식 목록 추가
  try
    OpenQuery('select CD_TEMPLATE, '
             +'       NM_TEMPLATE '
             +'  from MS_PRINT_H '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and DS_PRINT = 0 '
             +'   and YN_USE   = ''Y'' '
             +' order by NM_TEMPLATE',
              [HeadStoreCode,
               StoreCode]);
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarTemplateComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarTemplateComboBox.ItemIndex := 0;


  // 사원목록 콤보박스 세팅
  New(vCode);
  vCode^.Data := EmptyStr;
  ConditionToolBarUserComboBox.Properties.Items.AddObject(ConditionToolBarComboBox.Properties.Items[0], TObject(vCode));
  try
    OpenQuery('select CD_SAWON, '
             +'       NM_SAWON '
             +'  from MS_SAWON '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YN_USE   =''Y'' '
             +' order by NM_SAWON',
              [HeadStoreCode,
               StoreCode]);
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarUserComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarUserComboBox.ItemIndex := 0;

  // 프린터 목록 콤보박스 세팅
  New(vCode);
  vCode^.Data := prnNormal;
  PrinterComboBox.Properties.Items.AddObject('일반 프린터 (A4용지)', TObject(vCode));
  New(vCode);
  vCode^.Data := prnUserSize;
  PrinterComboBox.Properties.Items.AddObject('일반 프린터 (사용자정의)', TObject(vCode));
  New(vCode);
  vCode^.Data := prnBixolon;
  PrinterComboBox.Properties.Items.AddObject('BIXOLON (SLP-D420 등)', TObject(vCode));
  New(vCode);
  vCode^.Data := prnTSC;
  PrinterComboBox.Properties.Items.AddObject('TSC (TTP-243 등)', TObject(vCode));
  New(vCode);
  vCode^.Data := prnHoneywell;
  PrinterComboBox.Properties.Items.AddObject('Honeywell (PC42t)', TObject(vCode));


  ConditionToolBarKeepComboBox.ItemIndex := 0;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TCodePriceTagForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // 단축키 처리를 한다
  case Key of
    VK_F4 : ButtonToolBarDeleteMenuButton.Click;
    VK_F5 : ButtonToolBarSaveMenuButton.Click;
    VK_F6 : ButtonToolBarPrintButton.Click;
  end;
end;
procedure TCodePriceTagForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 날짜 조건 콤보박스를 수정할 때
procedure TCodePriceTagForm.ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
begin
  inherited;

  // 조건에 따라 조회창을 보여준다
  case ConditionToolBarComboBox.ItemIndex of
    0 : begin
        ConditionToolBarFromDateEdit.Visible := false;
        ConditionToolBarDayEdit.Visible      := false;
        ConditionToolBarDateToLabel.Visible  := false;
        end;
    1 : begin
        ConditionToolBarFromDateEdit.Visible := true;
        ConditionToolBarDayEdit.Visible      := false;
        ConditionToolBarDateToLabel.Visible  := false;
        ConditionToolBarFromDateEdit.SetFocus;
        end;
    2 : begin
        ConditionToolBarFromDateEdit.Visible := false;
        ConditionToolBarDayEdit.Visible      := true;
        ConditionToolBarDateToLabel.Visible  := true;
        ConditionToolBarDayEdit.SetFocus;
        end;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 신규 버튼
procedure TCodePriceTagForm.ButtonToolBarPrintButtonClick(Sender: TObject);
var
  vExist: Boolean;
  vIndex: Integer;
  vCode : PStrPointer;
begin
  if not ButtonToolBarPrintButton.Visible or not ButtonToolBarPrintButton.Enabled then
    Exit;
//  inherited;
 // 출력 수량이 있는지 검사
  GridTableView.DataController.PostEditingData;
  if (GridTableView.DataController.Summary.FooterSummaryValues[1] = null) or (GridTableView.DataController.Summary.FooterSummaryValues[1] <= 0) then
  begin
    ErrBox(GridTableViewPrintQty.Caption+msgMustInput);
    Grid.SetFocus;
    Exit;
  end
  // 프린터 선택 검사
  else if PrinterComboBox.ItemIndex < 0 then
  begin
    ErrBox('프린터 기종을 선택하십시오.');
    PrinterComboBox.SetFocus;
    Exit;
  end;
  // 출력 객체 디자인이 있는지 검사
  vExist := false;
  for vIndex := 0 to DesignPanel.ControlCount-1 do
    if DesignPanel.Controls[vIndex].Visible then
    begin
      vExist := true;
      break;
    end;
  if not vExist then
  begin
    ErrBox(Format('%s에 추가한 객체가 없습니다.'#13'%s을 선택하거나 객체를 하나 이상 추가하십시오.', [Trim(DesignGroupBox.Caption), TemplateLabel.Caption]));
    Exit;
  end;
  // 시리얼포트 확인
  if ComPortPortComboBox.Visible and (ComPortPortComboBox.ItemIndex < 0) then
  begin
    ErrBox(TagMarginLabel.Caption+msgMustInput);
    if ComPortPortComboBox.Enabled then
      ComPortPortComboBox.SetFocus;
    Exit;
  end
  else if ComPortBaudRateComboBox.Visible and (ComPortBaudRateComboBox.ItemIndex < 0) then
  begin
    ErrBox(TagMarginLabel.Caption+msgMustInput);
    if ComPortBaudRateComboBox.Enabled then
      ComPortBaudRateComboBox.SetFocus;
    Exit;
  end;

  //Honeywell 프린터일때
  if (GetStrPointerData(PrinterComboBox) = prnHoneywell) and (DriverNameEdit.Text <> EmptyStr) and (DriverNameEdit.Hint <> '') then
    SetRegistryBin(HKEY_CURRENT_USER, 'Printers\DevModePerUser', DriverNameEdit.Text, DriverNameEdit.Hint);


  // 행사가격, 단위가격 등 정보를 업데이트한다
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if (GridTableView.DataController.Values[vIndex, GridTableViewPrintQty.Index] <> null) and (GridTableView.DataController.Values[vIndex, GridTableViewPrintQty.Index] > 0) then
    begin
      // 상품코드
      if GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index] = null then
        GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index] := EmptyStr;
      // 상품이름
      if GridTableView.DataController.Values[vIndex, GridTableViewGoodsName.Index] = null then
        GridTableView.DataController.Values[vIndex, GridTableViewGoodsName.Index] := EmptyStr;
      // 단축이름
      if GridTableView.DataController.Values[vIndex, GridTableViewGoodsShortName.Index] = null then
        GridTableView.DataController.Values[vIndex, GridTableViewGoodsShortName.Index] := EmptyStr;
      // 규격
      if GridTableView.DataController.Values[vIndex, GridTableViewGoodsSpec.Index] = null then
        GridTableView.DataController.Values[vIndex, GridTableViewGoodsSpec.Index] := EmptyStr;
      // 판매가격
      if (DesignSalePrice.Visible) and (DesignSalePrice.Hint <> EmptyStr) and
         (GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index] <> null) and (GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index] > 0) then
        GridTableView.DataController.Values[vIndex, GridTableViewSalePriceName.Index]         := Replace(DesignSalePrice.Hint, fmtPrice, FormatFloat(fmtComma, GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index]))
      else
        GridTableView.DataController.Values[vIndex, GridTableViewSalePriceName.Index]         := EmptyStr;
    end;


  vCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[PrinterComboBox.ItemIndex]);
  // 일반 프린터
  if (vCode^.Data = prnNormal) or (vCode^.Data = prnUserSize) or (vCode^.Data = prnHoneywell) then
  begin
    if not PreviewCheckBox.Checked and (DriverNameEdit.Text <> '')  then
       PrintNormal(false)
    else if Sender = PreviewPrintMenuItem then
       PrintNormal(true)
    else
      PrintNormal(false);
  end
  else if vCode^.Data = prnBixolon then
    PrintBixolon
  else if vCode^.Data = prnTSC then
    PrintTSC;

end;

//------------------------------------------------------------------------------
// 저장 버튼
procedure TCodePriceTagForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var
  vIndex,
  vSeq : Integer;
  vData: string;
begin
  inherited;

  if GridTableView.DataController.RecordCount = 0 then
  begin
    MsgBox('조회된 상품이 없습니다.');
    Exit;
  end;

  if GridTableView.Controller.SelectedRowCount = 0 then
  begin
    if not AskBox('조회된 전체상품을 저장하시겠습니까?') then
      Exit;
    GridTableView.Controller.SelectAllRecords;
  end;

  if not InputBox('저장할 보관 이름을 입력하십시오.', vData) or (vData = EmptyStr) then
    Exit;

  OpenQuery('select max(ifnull(DS_PRINT,0))+1 '
           +'  from MS_PRINT_TEMP '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_PRINT <> 999',
           [HeadStoreCode,
            StoreCode]);
  vSeq := Query.Fields[0].AsInteger;
  FinishQuery;

  try
    for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
      ExecQuery('insert into MS_PRINT_TEMP(CD_HEAD, '
               +'                          CD_STORE, '
               +'                          DS_PRINT, '
               +'                          CD_TEMPLATE, '
               +'                          CD_SAWON, '
               +'                          YMD_INSERT, '
               +'                          CD_GOODS, '
               +'                          QTY_PRINT, '
               +'                          NM_KEEP, '
               +'                          DT_INSERT) '
               +'                 values(:P0, '
               +'                        :P1, '
               +'                        :P2, '
               +'                        0, '
               +'                        :P3, '
               +'                        Date_Format(Now(), ''%Y%m%d''), '
               +'                        :P4, '
               +'                        :P5, '
               +'                        :P6, '
               +'                        Now());',
               [HeadStoreCode,
                StoreCode,
                vSeq,
                UserCode,
                GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewGoodsCode.Index],
                GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index],
                vData], false);

    ExecQuery(TempSQL, [], true);
    vIndex := ConditionToolBarKeepComboBox.ItemIndex;
    SetKeepComboBox;
    ConditionToolBarKeepComboBox.ItemIndex := vIndex;
    MsgBox('저장이 완료되었습니다.');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;
procedure TCodePriceTagForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 선택된 상품 삭제 버튼
procedure TCodePriceTagForm.ButtonToolBarDeleteMenuButtonPopupMenuSelectedClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if GridTableView.Controller.SelectedRecordCount > 0 then
  begin
    TempSQL := '';
    for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
      ExecQuery('delete from MS_PRINT_TEMP '
               +' where CD_HEAD    = :P1 '
               +'   and CD_STORE   = :P2 '
               +'   and DS_PRINT   = :P3 '
               +'   and CD_SAWON   = :P4 '
               +'   and YMD_INSERT = :P5 '
               +'   and CD_GOODS   = :P6;',
               [HeadStoreCode,
                StoreCode,
                GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintType.Index],
                GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewUserNo.Index],
                GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewInsertDate.Index],
                GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewGoodsCode.Index]],false);

    ExecQuery(TempSQL, [], true);
    GridTableView.Controller.DeleteSelection;
  end;
end;
//------------------------------------------------------------------------------
// 모두 삭제/매수를 입력한 상품 삭제/매수를 입력하지 않은 상품 삭제 버튼
procedure TCodePriceTagForm.ButtonToolBarDeleteMenuButtonPopupMenuAllClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;
  TempSQL := '';
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if ((Sender = ButtonToolBarDeleteMenuButtonPopupMenuAll)) or
       ((Sender = ButtonToolBarDeleteMenuButtonPopupMenuCounted)   and (GridTableView.DataController.Values[vIndex, GridTableViewPrintQty.Index] > 0)) or
       ((Sender = ButtonToolBarDeleteMenuButtonPopupMenuNoCounted) and (GridTableView.DataController.Values[vIndex, GridTableViewPrintQty.Index] = 0)) then
    begin
      ExecQuery('delete from MS_PRINT_TEMP '
               +' where CD_HEAD    = :P0 '
               +'   and CD_STORE   = :P1 '
               +'   and DS_PRINT   = :P2 '
               +'   and CD_SAWON   = :P3 '
               +'   and YMD_INSERT = :P4 '
               +'   and CD_GOODS   = :P5;',
               [HeadStoreCode,
                StoreCode,
                GridTableView.DataController.Values[vIndex, GridTableViewPrintType.Index],
                GridTableView.DataController.Values[vIndex, GridTableViewUserNo.Index],
                GridTableView.DataController.Values[vIndex, GridTableViewInsertDate.Index],
                GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]],false);
    end;
    ExecQuery(TempSQL, [], true);

  if Sender = ButtonToolBarDeleteMenuButtonPopupMenuAll then
    GridTableView.DataController.RecordCount := 0
  else
    for vIndex := GridTableView.DataController.RecordCount-1 downto 0 do
      if ((Sender = ButtonToolBarDeleteMenuButtonPopupMenuCounted)   and (GridTableView.DataController.Values[vIndex, GridTableViewPrintQty.Index] > 0)) or
         ((Sender = ButtonToolBarDeleteMenuButtonPopupMenuNoCounted) and (GridTableView.DataController.Values[vIndex, GridTableViewPrintQty.Index] = 0)) then
        GridTableView.DataController.DeleteRecord(vIndex);
end;

//==============================================================================
// 상품목록 그리드
//------------------------------------------------------------------------------
// 그리드 - 조회조건에서 키보드를 누를 때
procedure TCodePriceTagForm.GridSearchEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    GridSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 그리드 - 조회 버튼
procedure TCodePriceTagForm.GridSearchButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      GridTableView.OptionsSelection.MultiSelect := True;
      Caption                    := '상품 조회 (''Ctrl-클릭''으로 여러 건 선택 가능)';
      GridTableViewCode.Caption  := '상품 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '상품 이름';
      GridTableViewName1.Width   := 320;
      GridTableViewName2.Caption := '판매단가';
      GridTableViewName2.Width   := 70;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      GridTableViewName2.DataBinding.ValueType := 'Currency';
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

      SearchText := GridSearchEdit.Text;
      SQLText := 'select   CD_MENU as CD_GOODS, '              //0
                +'         NM_MENU as NM_GOODS, '              //1
                +'         PR_SALE, '                          //2
                +'         NM_MENU_SHORT as NM_GOODS_SHORT, '  //3
                +'         NM_SPEC '                           //4
                +'from     MS_MENU  '
                +'where    CD_HEAD  =:P0 '
                +'  and    CD_STORE =:P1 '
                +'  and   (CD_MENU like ConCat(:P2,''%'') or NM_MENU like ConCat(''%'',:P2,''%'') or NM_MENU_SHORT like ConCat(''%'',:P2,''%'')) '
                +'  and    YN_USE = ''Y'' '
                +'order by CD_MENU';
      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        for vIndex := 0 to GridTableView.Controller.SelectedRowCount - 1 do
        begin
          // 그리드에 이미 등록되어 있는 상품코드면 무시하고 넘어간다
          if Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index,GridTableView.Controller.SelectedRows[vIndex].Values[0], false, false, true) >= 0 then
            Continue;
          try
            Self.GridTableView.DataController.AppendRecord;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index]        := GridTableView.Controller.SelectedRows[vIndex].Values[0];
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsShortName.Index]   := GridTableView.Controller.SelectedRows[vIndex].Values[3];
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewPrintQty.Index]         := 1;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsName.Index]        := GridTableView.Controller.SelectedRows[vIndex].Values[1];
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsSpec.Index]        := GridTableView.Controller.SelectedRows[vIndex].Values[4];
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSalePrice.Index]        := StoI(GridTableView.Controller.SelectedRows[vIndex].Values[2]);
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewUserNo.Index]           := '';
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewInsertDate.Index]       := '';
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewPrintType.Index]        := 0;
          finally
            FinishQuery;
          end;
        end;
        GridSearchEdit.Clear;
        ButtonToolBarPrintButton.Enabled      := (NVL(Self.GridTableView.DataController.Summary.FooterSummaryValues[1],0) > 0);
        ButtonToolBarDeleteMenuButton.Enabled := Self.GridTableView.DataController.RecordCount > 0;
        ButtonToolBarSaveMenuButton.Enabled   := ButtonToolBarDeleteMenuButton.Enabled;
      end;
    finally
      Free;
      FinishQuery;
    end;
end;
//------------------------------------------------------------------------------
// 그리드 선택 줄 옮길 때
procedure TCodePriceTagForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  // 변경 자료 저장할지 물어보지 못하게 상속 제거
//  inherited;
end;
//------------------------------------------------------------------------------
// 그리드 - 매수 +1
procedure TCodePriceTagForm.GridTableViewPopupMenuAddClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if GridTableView.Controller.SelectedRecordCount > 0 then
  begin
    GridTableView.BeginUpdate;
    try
      for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
        GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index] := Nvl(GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index], 0)+1;
    finally
      GridTableView.EndUpdate;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 - 매수 -1
procedure TCodePriceTagForm.GridTableViewPopupMenuSubClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if GridTableView.Controller.SelectedRecordCount > 0 then
  begin
    GridTableView.BeginUpdate;
    try
      for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
        if Nvl(GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index], 0) > 0 then
          GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index] := Nvl(GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index], 0)-1;
    finally
      GridTableView.EndUpdate;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 그리스 - 매수 수정
procedure TCodePriceTagForm.GridTableViewPopupMenuChangeClick(Sender: TObject);
var
  vIndex: Integer;
  vValue: string;
begin
  inherited;

  if GridTableView.Controller.SelectedRecordCount > 0 then
    if InputBox('변경할 매수를 입력하십시오.', vValue, 3, false, true) then
      if StoI(vValue) >= 0 then
      begin
        GridTableView.BeginUpdate;
        try
          for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
            GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index] := StoI(vValue);
        finally
          GridTableView.EndUpdate;
        end;
      end;
end;
//------------------------------------------------------------------------------
// 그리드 - 출력 안 함
procedure TCodePriceTagForm.GridTableViewPopupMenuClearClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if GridTableView.Controller.SelectedRecordCount > 0 then
  begin
    GridTableView.BeginUpdate;
    try
      for vIndex := 0 to GridTableView.Controller.SelectedRowCount-1 do
        GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewPrintQty.Index] := 0;
    finally
      GridTableView.EndUpdate;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 - 모두 선택
procedure TCodePriceTagForm.GridTableViewPopupMenuSelectAllClick(Sender: TObject);
begin
  inherited;

  GridTableView.Controller.SelectAllRecords;
end;
//------------------------------------------------------------------------------
// 그리드 - 모두 선택 취소
procedure TCodePriceTagForm.GridTableViewPopupMenuDeselectAllClick(Sender: TObject);
begin
  inherited;

  GridTableView.Controller.ClearSelection;
end;
procedure TCodePriceTagForm.GridTableViewPopupMenuGoodsDeleteClick(
  Sender: TObject);
begin
  inherited;
  ButtonToolBarDeleteMenuButtonPopupMenuSelected.Click;
end;
//------------------------------------------------------------------------------
// 그리드 - 선택 영역 반전
procedure TCodePriceTagForm.GridTableViewPopupMenuInverseSelectClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if GridTableView.DataController.RecordCount > 0 then
  begin
    GridTableView.BeginUpdate;
    try
      for vIndex := 0 to GridTableView.ViewData.RecordCount-1 do
        GridTableView.ViewData.Records[vIndex].Selected := not GridTableView.ViewData.Records[vIndex].Selected and GridTableView.ViewData.Records[vIndex].IsData;
    finally
      GridTableView.EndUpdate;
    end;
  end;
end;

//==============================================================================
// 메인 패널
//------------------------------------------------------------------------------
// 메인 패널 크기가 변경될 때
procedure TCodePriceTagForm.MainPanelResize(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  // 디자인 버튼 크기를 재조정한다
  for vIndex := 0 to DesignGroupBox.ControlCount-1 do
    if DesignGroupBox.Controls[vIndex] is TcxButton then
    begin
      TcxButton(DesignGroupBox.Controls[vIndex]).Width := (DesignGroupBox.Width-30) div 5;
      TcxButton(DesignGroupBox.Controls[vIndex]).Left  := 15 + (TcxButton(DesignGroupBox.Controls[vIndex]).Tag-1) * TcxButton(DesignGroupBox.Controls[vIndex]).Width + 1;
    end;
end;
//------------------------------------------------------------------------------
// 출력양식 콤보박스를 수정할 때
procedure TCodePriceTagForm.TemplateComboBoxPropertiesChange(Sender: TObject);
var
  vTemplateCode, vPrinterCode: PStrPointer;
  vIndex: Integer;
begin
  inherited;

  vPrinterCode := nil;

  // 연결된 양식 상세 내역을 불러온다
  if TemplateComboBox.ItemIndex >= 0 then
  begin
    // 양식 마스터
    vTemplateCode := PStrPointer(TemplateComboBox.Properties.Items.Objects[TemplateComboBox.ItemIndex]);
    isLoading     := true;
    try
      OpenQuery('select   CD_PRINTER, '               // 0 - 프린터 기종
               +'         TAG_WIDTH, '                // 1 - 티켓 폭
               +'         TAG_HEIGHT, '               // 2 - 티켓 높이
               +'         DIRECTION, '                // 3 - 출력방향
               +'         MARGIN_TOP, '               // 4 - 용지 위여백     / 프린터 포트
               +'         MARGIN_LEFT, '              // 5 - 용지 왼쪽여백   / 프린터 BaudRate
               +'         TAG_MARGIN_RIGHT, '         // 6 - 태그 오른쪽여백 / 티켓용지(갭/블랙마크/연속지)
               +'         TAG_MARGIN_BOTTOM,'        // 7 - 태그 아래여백   / 되감기/갭크기/블랙마크여백
               +'         DS_PAPER, '                 // 8 용지방향
               +'         COLUM_COUNT, '              // 9 칼럼 수(사용자정의일때만)
               +'         COLUM_MARGIN,  '            //10 칼럼 마진
               +'         NM_DRIVER, '                //11 프린터드러이버명
               +'         REG_DATA, '                 //12 레지스트리 데이터
               +'         YN_PREVIEW '                //13 출력전 미리보기(사용자정의)
               +'from     MS_PRINT_H '
               +'where    CD_HEAD     =:P0 '
               +'  and    CD_STORE    =:P1 '
               +'  and    DS_PRINT    = 0 '
               +'  and    CD_TEMPLATE = :P2',
                [HeadStoreCode,
                 StoreCode,
                 StoI(vTemplateCode^.Data)]);
      if not Query.Eof then
      begin
        for vIndex := 0 to PrinterComboBox.Properties.Items.Count-1 do
        begin
          vPrinterCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[vIndex]);
          if vPrinterCode^.Data = Query.Fields[0].AsString then
          begin
            PrinterComboBox.ItemIndex := vIndex;
            Break;
          end;
        end;
        TagSizeWidthEdit.Value        := Query.Fields[1].AsInteger;
        DesignPanel.Width             := Trunc(TagSizeWidthEdit.Value  * mm2pt);
        TagSizeHeightEdit.Value       := Query.Fields[2].AsInteger;
        DesignPanel.Height            := Trunc(TagSizeHeightEdit.Value * mm2pt);

        // 기존 양식을 지운다
        ClearTemplate;
        isLoading := true;

        if DirectionComboBox.Properties.Items.Count > Query.Fields[3].AsInteger then
          DirectionComboBox.ItemIndex := Query.Fields[3].AsInteger;

        if GetStrPointerData(PrinterComboBox) = prnNormal then  // 일반프린터(A4)
        begin
          PageMarginTopEdit.Value     := Query.Fields[4].AsInteger;
          PageMarginLeftEdit.Value    := Query.Fields[5].AsInteger;
          TagMarginRightEdit.Value    := Query.Fields[6].AsInteger;
          TagMarginBottomEdit.Value   := Query.Fields[7].AsInteger;
          PageMarginTopEdit.Enabled   := true;
          PageMarginLeftEdit.Enabled  := true;
          TagMarginRightEdit.Enabled  := true;
          TagMarginBottomEdit.Enabled := true;
          PreviewCheckBox.Checked     := true;
        end
        else if GetStrPointerData(PrinterComboBox) = prnUserSize then  // 일반프린터(사용자정의)
        begin
          PageMarginTopEdit.Value     := 0;
          PageMarginLeftEdit.Value    := 0;
          TagMarginRightEdit.Value    := 0;
          TagMarginBottomEdit.Value   := 0;
          PageMarginTopEdit.Enabled   := false;
          PageMarginLeftEdit.Enabled  := false;
          TagMarginRightEdit.Enabled  := false;
          TagMarginBottomEdit.Enabled := false;
          ColumCountEdit.Value        := Query.Fields[9].AsInteger;
          ColumMarginEdit.Value       := Query.Fields[10].AsInteger;
          DriverNameEdit.Text         := Query.Fields[11].AsString;
          PreviewCheckBox.Checked     := Query.Fields[12].AsString = 'Y';
        end
        else if GetStrPointerData(PrinterComboBox) = prnHoneywell then  // Honeywell
        begin
          PageMarginTopEdit.Value     := 0;
          PageMarginLeftEdit.Value    := 0;
          TagMarginRightEdit.Value    := 0;
          TagMarginBottomEdit.Value   := 0;
          PageMarginTopEdit.Enabled   := false;
          PageMarginLeftEdit.Enabled  := false;
          TagMarginRightEdit.Enabled  := false;
          TagMarginBottomEdit.Enabled := false;
          ColumCountEdit.Value        := Query.Fields[9].AsInteger;
          ColumMarginEdit.Value       := Query.Fields[10].AsInteger;
          DriverNameEdit.Text         := Query.Fields[11].AsString;
          DriverNameEdit.Hint         := Query.Fields[12].AsString;
          PreviewCheckBox.Checked     := Query.Fields[12].AsString = 'Y';
        end
        else
        begin
          PageMarginTopEdit.Enabled   := true;
          PageMarginLeftEdit.Enabled  := true;
          TagMarginRightEdit.Enabled  := true;
          TagMarginBottomEdit.Enabled := true;
          vIndex := ComPortPortComboBox.Properties.Items.IndexOf('COM'+Query.Fields[4].AsString);
          if vIndex > 0 then
            ComPortPortComboBox.ItemIndex       := vIndex
          else
            ComPortPortComboBox.ItemIndex       := 0;
          if ComPortPortComboBox.ItemIndex > 0 then
          begin
            ComPortBaudRateComboBox.Enabled     := true;
            vIndex := ComPortBaudRateComboBox.Properties.Items.IndexOf(Query.Fields[5].AsString);
            if vIndex >= 0 then
              ComPortBaudRateComboBox.ItemIndex := vIndex
            else
              ComPortBaudRateComboBox.ItemIndex := 0;
          end
          else
            ComPortBaudRateComboBox.Enabled     := false;

          vIndex := Query.Fields[6].AsInteger;
          if (vIndex >= 0) and (vIndex < PaperTypeComboBox.Properties.Items.Count) then
            PaperTypeComboBox.ItemIndex := vIndex
          else
            PaperTypeComboBox.ItemIndex   := 0;
          PageMarginLeftEdit.Value        := Query.Fields[7].AsInteger;
          OrientationComboBox.ItemIndex   := StrToIntDef(Query.Fields[8].AsString, 0);
          PreviewCheckBox.Checked         := false;
        end;
      end;
    finally
      FinishQuery;
    end;

    // 양식 디테일
    try
      OpenQuery('select   CD_OBJECT, '                // 0 - 객체구분번호
               +'         OBJECT_TOP, '               // 1 - 객체 위쪽위치
               +'         OBJECT_LEFT, '              // 2 - 객체 왼쪽위치
               +'         FONT_NAME, '                // 3 - 글꼴(일반프린터일 때만)
               +'         FONT_SIZE, '                // 4 - 글꼴크기(point,mm) / 바코드높이(mm)
               +'         FONT_STYLE, '               // 5 - 일반:0, 굵게:1, (기울임:2, 밑줄:4, 취소선:8)
               +'         FONT_COLOR, '               // 6 - 확대안함:0, 가로확대:1, 세로확대:2, 가로세로확대:3
               +'         FONT_ALIGN, '               // 7 - 왼쪽정렬:0, 오른쪽정렬:1, (가운데정렬:2)
               +'         OBJECT_TEXT '               // 8 - 문구,포맷 / 그림파일경로
               +'from     MS_PRINT_D '
               +'where    CD_HEAD     =:P0 '
               +'  and    CD_STORE    =:P1 '
               +'  and    DS_PRINT    = 0 '
               +'  and    CD_TEMPLATE = :P2',
                [HeadStoreCode,
                 StoreCode,
                 StoI(vTemplateCode^.Data)]);
      while not Query.Eof do
      begin
        // 디자인 패널의 컨트롤들 중에서 Tag가 템플릿 번호와 같은 것을 찾는다
        for vIndex := 0 to DesignPanel.ControlCount-1 do
          if DesignPanel.Controls[vIndex].Tag = Query.Fields[0].AsInteger then
          begin
            DesignPanel.Controls[vIndex].Top     := Trunc(Query.Fields[1].AsInteger * mm2pt);
            DesignPanel.Controls[vIndex].Left    := Trunc(Query.Fields[2].AsInteger * mm2pt);
            DesignPanel.Controls[vIndex].Visible := true;

            // 레이블일 때 처리
            if DesignPanel.Controls[vIndex] is TcxLabel then
            begin
              // 글꼴
              TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Name     := Query.Fields[3].AsString;
              // 글꼴 크기
              TcxLabel(DesignPanel.Controls[vIndex]).HelpContext   := Query.Fields[4].AsInteger;
              if GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell] then         // 일반프린터
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size   := Query.Fields[4].AsInteger
              else
              begin
                if vPrinterCode^.Data = prnBixolon then     // Bixolon
                  TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size := Trunc(Query.Fields[4].AsInteger) * 3  // 1mm가 대략 글꼴3 포인트 정도 되지 않을까?
                else                                        // 기타 티켓프린터
                  TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size := FixedFontSize * Query.Fields[4].AsInteger;
                if Query.Fields[6].AsInteger in [2, 3] then
                  TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size * 2;
              end;
              // 글꼴 스타일(굵게, 기울임 등)
              TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style    := [];
              if (Query.Fields[5].AsInteger and $01) = $01 then
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsBold];
              if (Query.Fields[5].AsInteger and $02) = $02 then
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsItalic];
              if (Query.Fields[5].AsInteger and $04) = $04 then
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsUnderline];
              if (Query.Fields[5].AsInteger and $08) = $08 then
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsStrikeOut];
              // 글꼴 색
              if GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell] then         // 일반프린터
              begin
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Color  := Query.Fields[6].AsInteger;
                TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword := '0';
              end
              // 확대
              else                                          // 티켓프린터
                TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword    := IntToStr(Query.Fields[6].AsInteger * 10);  // 10의 자리를 확대의 의미로 사용
              // 정렬
              TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword      := IntToStr(StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) + Query.Fields[7].AsInteger);
              // 레이블은 텍스트 지정
              if DesignPanel.Controls[vIndex].Tag div 10 = 4 then
              begin
                TcxLabel(DesignPanel.Controls[vIndex]).Hint       := Query.Fields[8].AsString;
                TcxLabel(DesignPanel.Controls[vIndex]).Caption    := Query.Fields[8].AsString;
              end
              // 포맷이 필요한 경우 포맷 지정
              else if DesignPanel.Controls[vIndex].Tag div 10 = 3 then
              begin
                DesignPanel.Controls[vIndex].Hint               := Query.Fields[8].AsString;
                if DesignPanel.Controls[vIndex].Tag = 31 then
                  TcxLabel(DesignPanel.Controls[vIndex]).Caption  := Replace(DesignPanel.Controls[vIndex].Hint, fmtPrice, valSalePrice)
                else if DesignPanel.Controls[vIndex].Tag = 32 then
                  TcxLabel(DesignPanel.Controls[vIndex]).Caption  := Replace(DesignPanel.Controls[vIndex].Hint, fmtPrice, valEventPrice)
                else if DesignPanel.Controls[vIndex].Tag = 33 then
                  TcxLabel(DesignPanel.Controls[vIndex]).Caption  := Replace(Replace(DesignPanel.Controls[vIndex].Hint, fmtDateFrom, valDateFrom), fmtDateTo, valDateTo)
                else if DesignPanel.Controls[vIndex].Tag = 34 then
                  TcxLabel(DesignPanel.Controls[vIndex]).Caption  := Replace(Replace(DesignPanel.Controls[vIndex].Hint, fmtPrice, valUnitPrice), fmtUnit, valUnit)
                else if DesignPanel.Controls[vIndex].Tag = 35 then
                  TcxLabel(DesignPanel.Controls[vIndex]).Caption  := Replace(DesignPanel.Controls[vIndex].Hint, fmtDCRate, valDCRate);
              end;
            end

            // 바코드일 때 처리
            else if DesignPanel.Controls[vIndex] = DesignBarcode then
            begin
              DesignPanel.Controls[vIndex].HelpContext          := Query.Fields[4].AsInteger;  // 바코드 높이

              if GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell] then         // 일반프린터
              begin
                // 글꼴
                TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Name     := Query.Fields[3].AsString;
                // 글꼴 크기
                TcxImage(DesignPanel.Controls[vIndex]).HelpContext       := Query.Fields[4].AsInteger;
                TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Size   := Query.Fields[4].AsInteger;
                // 글꼴 스타일(굵게, 기울임 등)
                TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style    := [];
                if (Query.Fields[5].AsInteger and $01) = $01 then
                  TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsBold];
                if (Query.Fields[5].AsInteger and $02) = $02 then
                  TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsItalic];
                if (Query.Fields[5].AsInteger and $04) = $04 then
                  TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsUnderline];
                if (Query.Fields[5].AsInteger and $08) = $08 then
                  TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style  := TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style + [fsStrikeOut];
                // 글꼴 색
                TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Color  := Query.Fields[6].AsInteger;
              end;
            end

            // 그림일 때 처리
            else if DesignPanel.Controls[vIndex] is TcxImage then
            begin
              if FileExists(Query.Fields[8].AsString) then
              begin
                DesignPanel.Controls[vIndex].Hint               := Query.Fields[8].AsString;
                TcxImage(DesignPanel.Controls[vIndex]).Picture.LoadFromFile(DesignPanel.Controls[vIndex].Hint);
              end
              else
                DesignPanel.Controls[vIndex].Visible            := false;
            end;
          end;
        // 디자인 팝업메뉴에서 Tag가 템플릿 번호와 같은 것에 체크한다
        for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
          if DesignPopupMenu.Items[vIndex].Tag = Query.Fields[0].AsInteger then
            DesignPopupMenu.Items[vIndex].Checked := true;
        Query.Next;
      end;
    finally
      FinishQuery;
      isLoading := false;
    end;
  end;

  // 버튼을 활성화한다
  TemplateDeleteButton.Enabled := TemplateComboBox.ItemIndex >= 0;
  TemplateSaveButton.Enabled   := false;
end;
//------------------------------------------------------------------------------
// 출력양식 신규 버튼
procedure TCodePriceTagForm.TemplateNewButtonClick(Sender: TObject);
begin
  inherited;

  // 출력양식을 선택하지 않는다
  if TemplateComboBox.ItemIndex >= 0 then
    TemplateComboBox.ItemIndex := -1
  else
    TemplateComboBoxPropertiesChange(TemplateComboBox);
end;
//------------------------------------------------------------------------------
// 출력양식 삭제 버튼
procedure TCodePriceTagForm.TemplateDeleteButtonClick(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;

  if TemplateComboBox.ItemIndex >= 0 then
    if AskBox(Format('''%s'' %s을 %s하시겠습니까?', [TemplateComboBox.Text, TemplateLabel.Caption, TemplateDeleteButton.Caption])) then
    begin
      // 출력양식을 DB에서 삭제한다
      vCode := PStrPointer(TemplateComboBox.Properties.Items.Objects[TemplateComboBox.ItemIndex]);
      if ExecQuery('update MS_PRINT_H '
                  +'set    YN_USE       = ''N'', '
                  +'       CD_SAWON_CHG = :P3, '
                  +'       DT_CHANGE    = Now() '
                  +'where  CD_HEAD      =:P0 '
                  +'  and  CD_STORE     = :P1 '
                  +'  and  DS_PRINT     = 0 '
                  +'  and  CD_TEMPLATE  = :P2;',
                  [HeadStoreCode,
                   StoreCode,
                   StoI(vCode^.Data),
                   UserCode]) then
      begin
        // 조건도 다 삭제한다
        if ConditionToolBarTemplateComboBox.Properties.Items.Count = TemplateComboBox.Properties.Items.Count+2 then
          ConditionToolBarTemplateComboBox.Properties.Items.Delete(TemplateComboBox.ItemIndex+2);
        // 출력양식 콤보박스 아이템을 삭제한다
        TemplateComboBox.Properties.Items.Delete(TemplateComboBox.ItemIndex);
        // 출력양식 신규 처리를 한다
        TemplateNewButton.Click;
        ShowMsg(Format('%s 했습니다.', [TemplateDeleteButton.Caption]));
      end
      else
        ErrBox(Format('%s하지 못했습니다.', [TemplateDeleteButton.Caption]));
    end;
end;
//------------------------------------------------------------------------------
// 출력양식 저장 버튼
procedure TCodePriceTagForm.TemplateSaveButtonClick(Sender: TObject);
var
  vCode        : PStrPointer;
  vTemplateName: string;
  vTemplateCode: Integer;
  vIndex       : Integer;
begin
  inherited;

  // 입력 안 한 내용 있는지 확인
  if PrinterComboBox.ItemIndex < 0 then
  begin
    ErrBox(Replace(PrinterLabel.Caption)+msgMustInput);
    Exit;
  end;
  vTemplateCode := 0; // 입력 여부 확인용으로 임시 사용
  for vIndex := 0 to DesignPanel.ControlCount-1 do
    if DesignPanel.Controls[vIndex].Visible then
    begin
      vTemplateCode := 1;
      break;
    end;
  if vTemplateCode = 0 then
  begin
    ErrBox(Format('%s에 추가한 객체가 없습니다.'#13'객체를 하나 이상 추가하십시오.', [Trim(DesignGroupBox.Caption)]));
    Exit;
  end;

  // 기존 양식 저장 확인
  if TemplateComboBox.ItemIndex >= 0 then
  begin
    if not AskBox(Format('''%s'' %s을 %s하시겠습니까?', [TemplateComboBox.Text, TemplateLabel.Caption, TemplateSaveButton.Caption])) then
      Exit;
    vCode         := PStrPointer(TemplateComboBox.Properties.Items.Objects[TemplateComboBox.ItemIndex]);
    vTemplateName := TemplateComboBox.Text;
    vTemplateCode := StoI(vCode^.Data);
  end
  // 신규 양식 저장 이름 입력
  else if InputBox(Format('%s 이름을 입력하십시오.', [TemplateLabel.Caption]), vTemplateName, 30) then
  begin
    try
      OpenQuery('select   IfNull(Max(CD_TEMPLATE),0)+1 as CD_TEMPLATE '
               +'from     MS_PRINT_H '
               +'where    CD_HEAD  =:P0 '
               +'  and    CD_STORE =:P1 '
               +'  and    DS_PRINT = 0',
                [HeadStoreCode,
                 StoreCode]);
      vTemplateCode := Query.Fields[0].AsInteger;
    finally
      FinishQuery;
    end;
  end
  else
    Exit;

  try
    // 기존 자료를 지운다
    ExecQuery('delete from MS_PRINT_H '
             +'where  CD_HEAD     =:P0 '
             +'  and  CD_STORE    =:P1 '
             +'  and  DS_PRINT    = 0 '
             +'  and  CD_TEMPLATE = :P2;'
             +'delete from MS_PRINT_D '
             +'where  CD_HEAD     =:P0 '
             +'  and  CD_STORE    =:P1 '
             +'  and  DS_PRINT    = 0 '
             +'  and  CD_TEMPLATE = :P2;',
              [HeadStoreCode,
               StoreCode,
               vTemplateCode],
               false);

    // 새로운 자료를 입력한다
    vCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[PrinterComboBox.ItemIndex]);
    ExecQuery('insert into MS_PRINT_H( '
             +'  CD_HEAD, CD_STORE, DS_PRINT, CD_TEMPLATE, NM_TEMPLATE, CD_PRINTER, TAG_WIDTH, TAG_HEIGHT, DIRECTION, MARGIN_TOP, MARGIN_LEFT, TAG_MARGIN_RIGHT, TAG_MARGIN_BOTTOM, '
             +'  DS_PAPER, COLUM_COUNT, COLUM_MARGIN, NM_DRIVER, REG_DATA, YN_PREVIEW, YN_USE, CD_SAWON_CHG, DT_CHANGE) '
             +' values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12, :P13, :P14, :P15, :P16, :P17, :P18, ''Y'', :P19, Now()); ',
              [HeadStoreCode,
               StoreCode,
               0,
               vTemplateCode,
               vTemplateName,
               StoI(vCode^.Data),
               Trunc(TagSizeWidthEdit.Value),
               Trunc(TagSizeHeightEdit.Value),
               DirectionComboBox.ItemIndex,
               IfThen(GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell], Trunc(PageMarginTopEdit.Value),   StoI(GetOnlyNumber(ComPortPortComboBox.Text))),
               IfThen(GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell], Trunc(PageMarginLeftEdit.Value),  StoI(ComPortBaudRateComboBox.Text)),
               IfThen(GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell], Trunc(TagMarginRightEdit.Value),  PaperTypeComboBox.ItemIndex),
               IfThen(GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell], Trunc(TagMarginBottomEdit.Value), Trunc(PageMarginLeftEdit.Value)),
               OrientationComboBox.ItemIndex,
               ColumCountEdit.Value,
               Trunc(ColumMarginEdit.Value),
               DriverNameEdit.Text,
               DriverNameEdit.Hint,
               Ifthen(PreviewCheckBox.Checked,'Y','N'),
               UserCode],
               false);
    for vIndex := 0 to DesignPanel.ControlCount-1 do
      if (DesignPanel.Controls[vIndex].Tag > 0) and (DesignPanel.Controls[vIndex].Visible) then
      begin
        if (DesignPanel.Controls[vIndex] is TcxImage) and (GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell]) then
           ExecQuery('insert into MS_PRINT_D( '
                   +'  CD_HEAD, CD_STORE, DS_PRINT, CD_TEMPLATE, CD_OBJECT, OBJECT_TOP, OBJECT_LEFT, FONT_NAME, FONT_SIZE, FONT_STYLE, FONT_COLOR, FONT_ALIGN, OBJECT_TEXT) '
                   +' values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12);',
                    [HeadStoreCode,
                     StoreCode,
                     0,
                     vTemplateCode,
                     DesignPanel.Controls[vIndex].Tag,
                     Trunc(DesignPanel.Controls[vIndex].Top  / mm2pt),
                     Trunc(DesignPanel.Controls[vIndex].Left / mm2pt),
                     TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Name,
                     TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Size,
                     IfThen(fsBold in TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style, $01, 0) + IfThen(fsItalic in TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style, $02, 0) + IfThen(fsUnderline in TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style, $04, 0) + IfThen(fsStrikeOut in TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Style, $08, 0),
                     TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Color,
                     0,
                     DesignPanel.Controls[vIndex].Hint],
                     false)
        else
        begin
          ExecQuery('insert into MS_PRINT_D('
                   +'  CD_HEAD, CD_STORE, DS_PRINT, CD_TEMPLATE, CD_OBJECT, OBJECT_TOP, OBJECT_LEFT, FONT_NAME, FONT_SIZE, FONT_STYLE, FONT_COLOR, FONT_ALIGN, OBJECT_TEXT) '
                   +' values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12); ',
                    [HeadStoreCode,
                     StoreCode,
                     0,
                     vTemplateCode,
                     DesignPanel.Controls[vIndex].Tag,
                     Trunc(DesignPanel.Controls[vIndex].Top  / mm2pt),
                     Trunc(DesignPanel.Controls[vIndex].Left / mm2pt),
                     IfThen(DesignPanel.Controls[vIndex] is TcxLabel, TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Name, EmptyStr),
                     IfThen((DesignPanel.Controls[vIndex] is TcxLabel) and (GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell]), TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size, DesignPanel.Controls[vIndex].HelpContext),
                     IfThen(DesignPanel.Controls[vIndex] is TcxLabel, IfThen(fsBold in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $01, 0) + IfThen(fsItalic in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $02, 0) + IfThen(fsUnderline in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $04, 0) + IfThen(fsStrikeOut in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $08, 0), 0),
                     IfThen(DesignPanel.Controls[vIndex] is TcxLabel, IfThen(GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell], TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Color, StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10), 0),
                     IfThen(DesignPanel.Controls[vIndex] is TcxLabel, StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) mod 10, 0),
                     DesignPanel.Controls[vIndex].Hint],
                     false);
        end;
      end;
    ExecQuery(TempSQL, [], true);

    ShowMsg(Format('%s 했습니다.', [TemplateSaveButton.Caption]));
    ResetEditProperties;

    isChanged := false;
    TemplateSaveButton.Enabled := false;

    // 신규일 때 콤보박스에 추가
    if TemplateComboBox.ItemIndex < 0 then
    begin
      New(vCode);
      vCode^.Data := IntToStr(vTemplateCode);
      TemplateComboBox.Properties.Items.AddObject(vTemplateName, TObject(vCode));
      TemplateComboBox.ItemIndex := TemplateComboBox.Properties.Items.Count-1;
      // 조건들도 다 추가
      ConditionToolBarTemplateComboBox.Properties.Items.AddObject(vTemplateName, TObject(vCode));
    end;
  except
    on E: Exception do
    begin
      ErrBox(Format('%s하지 못했습니다.'#13'%s', [TemplateSaveButton.Caption, E.Message]));
    end;
  end;
end;
//------------------------------------------------------------------------------
// 입력값을 변경할 때
procedure TCodePriceTagForm.EditPropertiesChange(Sender: TObject);
var
  vIndex: Integer;
  vCode : PStrPointer;
begin
  inherited;

  // 저장 버튼을 활성화한다
  TemplateSaveButton.Enabled := true;

  // 프린터 콤보박스
  if Sender = PrinterComboBox then
  begin
    isLoading := true;
    DriverNameLabel.Left := TagSizeLabel.Left;
    DriverNameEdit.Left  := PrinterComboBox.Left;
    DriverNameLabel.Top  := 142;
    DriverNameEdit.Top   := 140;

    // A4 프린터에서만 되는 옵션을 활성화/비활성화 한다
    DirectionComboBox.Properties.Items.Clear;
    if GetStrPointerData(PrinterComboBox) = prnNormal then
    begin
      TagSizeLabel.Caption               := '태그크기';
      DirectionComboBox.Enabled          := true;
      DirectionComboBox.Properties.Items.Add('세로 방향');
      DirectionComboBox.Properties.Items.Add('가로 방향');
      PageMarginLabel.Caption            := '용지여백';
      TagMarginLabel.Caption             := '태그여백';
      PageMarginLeftLabel.Caption        := DesignLocationLeftLabel.Caption;
      DesignFontEdit.Enabled             := true;
      DesignFontEnlargeXCheckBox.Enabled := false;
      DesignFontEnlargeYCheckBox.Enabled := false;
      OrientationComboBox.Visible := true;
      DriverNameLabel.Visible := false;
      DriverNameEdit.Visible  := false;
      PreviewCheckBox.Visible := true;
      EditPropertiesChange(OrientationComboBox);
    end
    else if GetStrPointerData(PrinterComboBox) = prnUserSize then
    begin
      TagSizeLabel.Caption               := '용지크기';
      DirectionComboBox.Enabled          := false;
      DirectionComboBox.Properties.Items.Add('세로 방향');
      DirectionComboBox.Properties.Items.Add('가로 방향');
      PageMarginLabel.Caption            := '용지여백';
      TagMarginLabel.Caption             := '태그여백';
      PageMarginLefTLabel.Caption        := DesignLocationLefTLabel.Caption;
      DesignFontEdit.Enabled             := true;
      DesignFontEnlargeXCheckBox.Enabled := false;
      DesignFontEnlargeYCheckBox.Enabled := false;
      DesignPanel.Width  := Trunc(TagSizeWidthEdit.Value  * mm2pt);
      DesignPanel.Height := Trunc(TagSizeHeightEdit.Value * mm2pt);
      OrientationComboBox.Visible := false;
      DriverNameLabel.Visible := true;
      DriverNameEdit.Visible  := true;
      PreviewCheckBox.Visible := true;
    end
    else if GetStrPointerData(PrinterComboBox) = prnHoneywell then
    begin
      TagSizeLabel.Caption               := '용지크기';
      DirectionComboBox.Enabled          := false;
      DirectionComboBox.Properties.Items.Add('세로 방향');
      DirectionComboBox.Properties.Items.Add('가로 방향');
      PageMarginLabel.Caption            := '용지여백';
      TagMarginLabel.Caption             := '태그여백';
      PageMarginLefTLabel.Caption        := DesignLocationLefTLabel.Caption;
      DesignFontEdit.Enabled             := true;
      DesignFontEnlargeXCheckBox.Enabled := false;
      DesignFontEnlargeYCheckBox.Enabled := false;
      DesignPanel.Width  := Trunc(TagSizeWidthEdit.Value  * mm2pt);
      DesignPanel.Height := Trunc(TagSizeHeightEdit.Value * mm2pt);
      OrientationComboBox.Visible := false;
      DriverNameLabel.Visible := true;
      DriverNameEdit.Visible  := true;
      PreviewCheckBox.Visible := true;
    end
    else
    begin
      TagSizeLabel.Caption               := '태그크기';
      DirectionComboBox.Enabled          := true;
      DirectionComboBox.Properties.Items.Add('똑바로 출력');
      DirectionComboBox.Properties.Items.Add('뒤집어서 출력');
      PageMarginLabel.Caption            := '용지종류';
      TagMarginLabel.Caption             := '출력포트';
      DesignFontEdit.Enabled             := false;
      DesignFontEnlargeXCheckBox.Enabled := true;
      DesignFontEnlargeYCheckBox.Enabled := true;
      DesignPanel.Width  := Trunc(TagSizeWidthEdit.Value  * mm2pt);
      DesignPanel.Height := Trunc(TagSizeHeightEdit.Value * mm2pt);
      OrientationComboBox.Visible := false;
      DriverNameLabel.Visible     := false;
      DriverNameEdit.Visible      := false;
      PreviewCheckBox.Visible     := false;
    end;
    DirectionComboBox.ItemIndex       := 0;
    PageMarginTopEdit.Visible         := GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell];
    PageMarginTopLabel.Visible        := PageMarginTopEdit.Visible;
    PageMarginTopMMLabel.Visible      := PageMarginTopEdit.Visible;
    TagMarginRightEdit.Visible        := PageMarginTopEdit.Visible;
    TagMarginRightLabel.Visible       := PageMarginTopEdit.Visible;
    TagMarginRightMMLabel.Visible     := PageMarginTopEdit.Visible;
    TagMarginBottomEdit.Visible       := PageMarginTopEdit.Visible;
    TagMarginBottomLabel.Visible      := PageMarginTopEdit.Visible;
    TagMarginBottomMMLabel.Visible    := PageMarginTopEdit.Visible;
    PaperTypeComboBox.Visible         := not PageMarginTopEdit.Visible;
    PaperTypeComboBox.Left            := PageMarginTopLabel.Left;
    if PaperTypeComboBox.Properties.Items.Count > 0 then
      PaperTypeComboBox.ItemIndex     := 0;
    ComPortPortComboBox.Visible       := not PageMarginTopEdit.Visible;
    ComPortPortComboBox.Left          := TagMarginRightLabel.Left;
    if ComPortPortComboBox.Properties.Items.Count > 0 then
      ComPortPortComboBox.ItemIndex   := 0;
    ComPortBaudRateComboBox.Visible   := not PageMarginTopEdit.Visible;
    ComPortBaudRateComboBox.Left      := TagMarginBottomLabel.Left-5;
    ComPortBaudRateComboBox.ItemIndex := 0;
    DesignGoodsNameButton.Enabled     := PrinterComboBox.ItemIndex >= 0;
    DesignGoodsCodeButton.Enabled     := DesignGoodsNameButton.Enabled;
    DesignGoodsPriceButton.Enabled    := DesignGoodsNameButton.Enabled;
    DesignLabelButton.Enabled         := DesignGoodsNameButton.Enabled;
    DesignPopupBackImage.Enabled      := PageMarginTopEdit.Visible;

    ColumCountLabel.Visible           := GetStrPointerData(PrinterComboBox)[1] in [prnUserSize, prnHoneywell];
    ColumCountEdit.Visible            := ColumCountLabel.Visible;
    ColumMarginLabel.Visible          := ColumCountLabel.Visible;
    ColumMarginEdit.Visible           := ColumCountLabel.Visible;
    ColumMarginMMLabel.Visible        := ColumCountLabel.Visible;
    ColumMarginMMLabel.Visible        := ColumCountLabel.Visible;

    if GetStrPointerData(PrinterComboBox)[1] in [prnUserSize, prnHoneywell] then
    begin
      PageMarginTopEdit.Visible         := false;
      PageMarginTopLabel.Visible        := false;
      PageMarginTopMMLabel.Visible      := false;
      TagMarginRightEdit.Visible        := false;
      TagMarginRighTLabel.Visible       := false;
      TagMarginRightMMLabel.Visible     := false;
      TagMarginBottomEdit.Visible       := false;
      TagMarginBottomLabel.Visible      := false;
      TagMarginBottomMMLabel.Visible    := false;
      PageMarginLeftEdit.Visible        := false;
      PageMarginLefTLabel.Visible       := false;
      PageMarginLeftMMLabel.Visible     := false;
      PaperTypeComboBox.Visible         := false;
      DirectionLabel.Visible            := false;
      DirectionComboBox.Visible         := false;
      PageMarginLabel.Visible           := false;
      TagMarginLabel.Visible            := false;
    end
    else
    begin
      PageMarginLeftEdit.Visible        := true;
      PageMarginLefTLabel.Visible       := true;
      PageMarginLeftMMLabel.Visible     := true;
      DirectionLabel.Visible            := true;
      DirectionComboBox.Visible         := true;
      PageMarginLabel.Visible           := true;
      TagMarginLabel.Visible            := true;
    end;

//    isLoading := false;

    // Bixolon, TSC 프린터 글꼴 지정
    vCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[PrinterComboBox.ItemIndex]);

    DesignImageButton.Enabled         := vCode^.Data[1] in [prnNormal, prnUserSize, prnBixolon, prnHoneywell];
    ButtonToolBarPrintButton.DropDownButton := vCode^.Data[1] in [prnNormal,prnUserSize, prnHoneywell];
    ButtonToolBar.Refresh;
    if ButtonToolBarPrintButton.DropDownButton then
      ButtonToolBarPrintButton.Width := ButtonToolBarPrintButton.Width + 10;

    if vCode^.Data[1] in [prnBixolon, prnTSC] then
    begin
      DesignFontEdit.Text             := DefFontName;
      DesignFontEdit.Enabled          := false;
      if vCode^.Data = prnBixolon then
        PageMarginLeftLabel.Caption   := '되감기'
      else if vCode^.Data = prnTSC then
        PageMarginLeftLabel.Caption   := '크기';
      // 글꼴을 기본 글꼴로 수정한다
      for vIndex := 0 to DesignPanel.ControlCount-1 do
        if DesignPanel.Controls[vIndex] is TcxLabel then
        begin
          TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Name     := FixedFontName;
          TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style    := [];
          TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Color    := clBlack;
          if vCode^.Data = prnBixolon then
          begin
            TcxLabel(DesignPanel.Controls[vIndex]).HelpContext := 3;         // 3mm
            TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size   := 3 * 3;
          end
          else
          begin
            TcxLabel(DesignPanel.Controls[vIndex]).HelpContext := 1;
            TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size   := FixedFontSize;
          end;
        end;
    end;

    // 일반 프린터가 아니면 이미지를 없앤다
    if PrinterComboBox.ItemIndex > 1 then
    begin
      for vIndex := 0 to DesignPanel.ControlCount-1 do
        if (DesignPanel.Controls[vIndex] is TcxImage) and (DesignPanel.Controls[vIndex] <> DesignBarcode) then
        begin
          DesignPanel.Controls[vIndex].Visible := false;
          if DesignPanel.Controls[vIndex] = SelectedControl then
            SelectedControl := nil;
        end;
      for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
        if (DesignPopupMenu.Items[vIndex].Tag > 50) and (DesignPopupMenu.Items[vIndex].Tag < 60) then
          DesignPopupMenu.Items[vIndex].Checked := false;
    end;
  end

  // 태그 크기
  else if Sender = TagSizeWidthEdit then
    DesignPanel.Width  := Trunc(TagSizeWidthEdit.Value  * mm2pt)
  else if Sender = TagSizeHeightEdit then
    DesignPanel.Height := Trunc(TagSizeHeightEdit.Value * mm2pt)
  else if Sender = ComPortPortComboBox then
    ComPortBaudRateComboBox.Enabled := ComPortPortComboBox.ItemIndex > 0;
end;

//==============================================================================
// 디자인 패널
//------------------------------------------------------------------------------
// 디자인 팝업 메뉴를 보여줄 때
procedure TCodePriceTagForm.DesignPopupMenuPopup(Sender: TObject);
var
  vIndex: Integer;
begin
  // 팝업을 호출한 버튼과 연관된 메뉴만 보이게 한다
  for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
    DesignPopupMenu.Items[vIndex].Visible := DesignPopupMenu.Items[vIndex].Tag div 10 = DesignPopupMenu.PopupComponent.Tag;

  inherited;
end;
//------------------------------------------------------------------------------
// 디자인 팝업 메뉴를 선택했을 때
procedure TCodePriceTagForm.DesignPopupClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  // 체크되지 않았으면 체크
  if not TMenuItem(Sender).Checked then
    TMenuItem(Sender).Checked := true;

  // 관련된 객체를 보여주고 선택
  for vIndex := 0 to DesignPanel.ControlCount-1 do
    if DesignPanel.Controls[vIndex].Tag = TMenuItem(Sender).Tag then
    begin
      // 객체가 용지를 벗어났다면 용지 안으로 다시 정렬
      if (DesignPanel.Controls[vIndex].Left > DesignPanel.Width  - 5) or (DesignPanel.Controls[vIndex].Left < 0) then
        DesignPanel.Controls[vIndex].Left := (DesignPanel.Width  - DesignPanel.Controls[vIndex].Width)  div 2;
      if (DesignPanel.Controls[vIndex].Top  > DesignPanel.Height - 5) or (DesignPanel.Controls[vIndex].Top  < 0) then
        DesignPanel.Controls[vIndex].Top  := (DesignPanel.Height - DesignPanel.Controls[vIndex].Height) div 2;

      DesignPanel.Controls[vIndex].Visible := true;
      SelectedControl := DesignPanel.Controls[vIndex];
      break;
    end;
end;
//------------------------------------------------------------------------------
// 디자인 패널 객체를 선택할 때
procedure TCodePriceTagForm.DesignPanelObjectClick(Sender: TObject);
begin
  inherited;
  if Sender is TControl then
    SelectedControl := TControl(Sender);
end;
//------------------------------------------------------------------------------
// 디자인 패널 객체에서 마우스를 누를 때
procedure TCodePriceTagForm.DesignPanelObjectMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;
//------------------------------------------------------------------------------
// 디자인 패널 객체에서 마우스를 움직일 때
procedure TCodePriceTagForm.DesignPanelObjectMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
  end;
end;
//------------------------------------------------------------------------------
// 디자인 패널 객체에서 마우스를 뗄 때
procedure TCodePriceTagForm.DesignPanelObjectMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  MouseDowned := false;

  TControl(Sender).Top   := TControl(Sender).Top  + Y - MouseOldY;
  if TControl(Sender).Top + 20 >= DesignPanel.Height then
    TControl(Sender).Top := DesignPanel.Height - 20
  else if TControl(Sender).Top < IfThen(TControl(Sender).Height < 20, 0, 20 - TControl(Sender).Height) then
    TControl(Sender).Top := IfThen(TControl(Sender).Height < 20, 0, 20 - TControl(Sender).Height);
  DesignLocationTopEdit.Value := Trunc(TControl(Sender).Top / mm2pt);

  TControl(Sender).Left   := TControl(Sender).Left + X - MouseOldX;
  if TControl(Sender).Left + 20 > DesignPanel.Width then
    TControl(Sender).Left := DesignPanel.Width - 20
  else if TControl(Sender).Left < IfThen(TControl(Sender).Width < 20, 0, 20 - TControl(Sender).Width) then
    TControl(Sender).Left := IfThen(TControl(Sender).Width < 20, 0, 20 - TControl(Sender).Width);
  DesignLocationLeftEdit.Value := Trunc(TControl(Sender).Left / mm2pt);

  DesignPanel.Refresh;

  isChanged := true;
end;
//------------------------------------------------------------------------------
// 디자인 입력창 값을 수정할 때
procedure TCodePriceTagForm.DesignEditPropertiesChange(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;

  if Assigned(SelectedControl) and (not isLoading) then
  begin
    isChanged := true;
    TemplateSaveButton.Enabled := true;
    // 위치
    if Sender = DesignLocationTopEdit then
      SelectedControl.Top  := Trunc(DesignLocationTopEdit.Value  * mm2pt)
    else if Sender = DesignLocationLeftEdit then
      SelectedControl.Left := Trunc(DesignLocationLeftEdit.Value * mm2pt)
    // 글꼴 크기
    else if Sender = DesignFontSizeEdit then
    begin
      // 레이블 (일반 프린터가 아닐 때)
      if SelectedControl is TcxLabel then
      begin
        TcxLabel(SelectedControl).HelpContext   := Trunc(DesignFontSizeEdit.Value);
        if PrinterComboBox.ItemIndex > 1 then
        begin
          vCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[PrinterComboBox.ItemIndex]);
          if vCode^.Data = prnBixolon then      // Bixolon 프린터
            TcxLabel(SelectedControl).Style.Font.Size   := TcxLabel(SelectedControl).HelpContext * 3  // 1mm는 대략 3포인트쯤 되지 않을까?
          else if vCode^.Data = prnTSC then     // TSC 프린터
            TcxLabel(SelectedControl).Style.Font.Size   := TcxLabel(SelectedControl).HelpContext * FixedFontSize;
          // 세로확대 적용
          if DesignFontEnlargeYCheckBox.Checked then
            TcxLabel(SelectedControl).Style.Font.Size := TcxLabel(SelectedControl).Style.Font.Size * 2;
        end;
      end
      // 바코드
      else if SelectedControl.Tag = DesignBarcode.Tag then
        SelectedControl.HelpContext := Trunc(DesignFontSizeEdit.Value);
    end
    // 굵게
    else if (Sender = DesignFontBoldCheckBox) and (SelectedControl is TcxLabel) then
    begin
      if DesignFontBoldCheckBox.Checked then
        TcxLabel(SelectedControl).Style.Font.Style    := [fsBold]
      else
        TcxLabel(SelectedControl).Style.Font.Style    := [];
    end
    // 정렬, 확대
    else if ((Sender = DesignFontEnlargeXCheckBox) or (Sender = DesignFontEnlargeYCheckBox) or (Sender = DesignAlignmentComboBox)) and
            (SelectedControl is TcxLabel) then
    begin
      TcxLabel(SelectedControl).HelpKeyword := IntToStr((IfThen(DesignFontEnlargeXCheckBox.Checked, 1, 0) + IfThen(DesignFontEnlargeYCheckBox.Checked, 2, 0)) * 10 +
                                          DesignAlignmentComboBox.ItemIndex);
      if Sender = DesignFontEnlargeYCheckBox then
      begin
        vCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[PrinterComboBox.ItemIndex]);
        if vCode^.Data = prnBixolon then    // Bixolon 프린터
          TcxLabel(SelectedControl).Style.Font.Size := TcxLabel(SelectedControl).HelpContext * 3  // 1mm는 대략 3포인트쯤 되지 않을까?
        else if vCode^.Data = prnTSC then   // TSC 프린터
          TcxLabel(SelectedControl).Style.Font.Size := TcxLabel(SelectedControl).HelpContext * FixedFontSize;
        if DesignFontEnlargeYCheckBox.Checked then
          TcxLabel(SelectedControl).Style.Font.Size   := TcxLabel(SelectedControl).Style.Font.Size * 2;
      end;
    end
    // 문구, 포맷, 파일
    else if Sender = DesignTextEdit then
    begin
      // 레이블
      if SelectedControl.Tag div 10 = 4 then
      begin
        TcxLabel(SelectedControl).Caption := DesignTextEdit.Text;
        TcxLabel(SelectedControl).Hint    := DesignTextEdit.Text;
      end
      // 포맷 스트링
      else if SelectedControl.Tag div 10 = 3 then
      begin
        TcxLabel(SelectedControl).Hint      := DesignTextEdit.Text;
        if SelectedControl.Tag = 31 then
          TcxLabel(SelectedControl).Caption := Replace(DesignTextEdit.Text, fmtPrice, valSalePrice);
      end
      // 이미지
      else if SelectedControl is TcxImage then
      begin
        SelectedControl.Hint := DesignTextEdit.Text;
        ShowImage(TcxImage(SelectedControl));
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 이미지 파일 입력창에서 키보드를 누를 때
procedure TCodePriceTagForm.DesignTextEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // 이미지 파일 이름 입력 상태에서 Delete나 BackSpace를 누르면 이미지 파일 이름을 지운다
  if DesignTextEdit.Properties.ReadOnly and
     ((Key = VK_Delete) or (Key = VK_Back)) then
    DesignTextEdit.Clear;
end;
//------------------------------------------------------------------------------
// 이미지 파일 선택
procedure TCodePriceTagForm.DesignTextEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  vCode    : PStrPointer;
  vPCX     : TPCXGraphic;
  vBMP     : TBitmap;
  vFileName: string;
begin
  inherited;

  // 프린터에 따라 불러올 그림을 다르게 표시
  vCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[PrinterComboBox.ItemIndex]);
  if GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell] then
    DesignOpenPictureDialog.Filter := '모든 그림 파일|*.jpg;*.jpeg;*.bmp;*.png|JPEG 파일|*.jpg;*.jpeg|비트맵 파일|*.bmp|PNG 파일|*.png'
  else if vCode^.Data = prnBixolon then
    DesignOpenPictureDialog.Filter := 'PCX 파일|*.pcx'
  else if vCode^.Data = prnTSC then
    Exit
  else if vCode^.Data = prnTEC then
    Exit
  else if vCode^.Data = prnZebraZ4M then
    Exit
  else if vCode^.Data = prnZebra then
    Exit;

  // 그림 파일 불러오기 화면을 보여준다
  if DesignOpenPictureDialog.Execute then
  begin
    // 일반 프린터
    if (vCode^.Data = prnNormal) or (vCode^.Data = prnUserSize) then
      DesignTextEdit.Text := DesignOpenPictureDialog.FileName
    // BIXOLON
    else if vCode^.Data = prnBixolon then
    begin
      // PCX 파일을 불러온다
      vPCX := TPCXGraphic.Create;
      vBMP := TBitmap.Create;
      try
        vPCX.LoadFromFile(DesignOpenPictureDialog.FileName);
        // 크기를 반으로 줄여서 Bmp로 저장한다 (PCX 파일은 불러오지 못해서)
        vBMP.Assign(vPCX);
        vBMP.Width  := vPCX.Width  div 2;
        vBMP.Height := vPCX.Height div 2;
        vBMP.Canvas.StretchDraw(vBMP.Canvas.ClipRect, vPCX);
        vFileName   := ChangeFileExt(DesignOpenPictureDialog.FileName, '.bmp');
        vBMP.SaveToFile(vFileName);
        DesignTextEdit.Text := vFileName;
      finally
        vPCX.Free;
        vBMP.Free;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 글꼴 선택
procedure TCodePriceTagForm.DesignFontEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if Assigned(SelectedControl) and ((SelectedControl is TcxLabel) or ((SelectedControl is TcxImage) and ((SelectedControl as TcxImage).Tag = DesignBarcode.Tag))) then
  begin
    DesignFontDialog.Font := TcxLabel(SelectedControl).Style.Font;
    if DesignFontDialog.Execute then
    begin
      TcxLabel(SelectedControl).Style.Font := DesignFontDialog.Font;
      DesignFontEdit.Text          := DesignFontDialog.Font.Name;
      isChanged                    := true;
      TemplateSaveButton.Enabled   := true;
    end;
  end
  else if Assigned(SelectedControl) and (SelectedControl is TcxImage) then
  begin
    DesignFontDialog.Font := TcxImage(SelectedControl).Style.Font;
    if DesignFontDialog.Execute then
    begin
      TcxImage(SelectedControl).Style.Font := DesignFontDialog.Font;
      DesignFontEdit.Text                  := DesignFontDialog.Font.Name;
      isChanged                            := true;
      TemplateSaveButton.Enabled           := true;
    end;
  end;
end;
procedure TCodePriceTagForm.DesignGroupBoxMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := false;
end;

procedure TCodePriceTagForm.DesignImageButtonClick(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 선택한 객체 삭제 버튼
procedure TCodePriceTagForm.DesignDeleteButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if Assigned(SelectedControl) then
  begin
    SelectedControl.Visible := false;
    for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
      if DesignPopupMenu.Items[vIndex].Tag = SelectedControl.Tag then
      begin
        DesignPopupMenu.Items[vIndex].Checked := false;
        break;
      end;
    SelectedControl              := nil;
    isChanged                    := true;
    TemplateSaveButton.Enabled   := true;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TCodePriceTagForm.DoSearch: Boolean;
var
  vTemplateCode,
  vUserCode : PStrPointer;
  vKeepCode,
  vGoodsCode: string;
  vIndex    : Integer;
begin
  Result := false;
  try
    // 출력하기로 등록한 상품들 목록을 불러온다
    vTemplateCode := PStrPointer(ConditionToolBarTemplateComboBox.Properties.Items.Objects[ConditionToolBarTemplateComboBox.ItemIndex]);
    vKeepCode     := PStrPointer(ConditionToolBarKeepComboBox.Properties.Items.Objects[ConditionToolBarKeepComboBox.ItemIndex]).Data;
    vUserCode     := PStrPointer(ConditionToolBarUserComboBox.Properties.Items.Objects[ConditionToolBarUserComboBox.ItemIndex]);
    OpenQuery('select   a.CD_GOODS, '
             +'         b.NM_MENU_SHORT as NM_GOODS_SHORT, '
             +'         b.NM_SPEC, '
             +'         a.QTY_PRINT, '
             +'         b.NM_MENU as NM_GOODS, '
             +'         b.PR_SALE, '
             +'         a.DS_PRINT, '
             +'         a.CD_SAWON, '
             +'         a.YMD_INSERT '
             +'from     MS_PRINT_TEMP as a inner join '
             +'         MS_MENU       as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_MENU and b.YN_USE = ''Y'' '
             +'where    a.CD_HEAD  = :P0 '
             +'  and    a.CD_STORE = :P1 '
             + IfThen(vKeepCode ='', 'and a.DS_PRINT = 0 ', 'and a.DS_PRINT='+vKeepCode)
             +'  and   (:P2 = '''' or Cast(a.CD_TEMPLATE as Char) = :P2) '
             +'  and   (:P3 = '''' or a.CD_SAWON  = :P3) '
             +'  and   ((:P4 = 0 or :P5 = '''') '
             +'      or (:P4 = 1 and a.YMD_INSERT =  :P5) '
             +'      or (:P4 = 2 and a.YMD_INSERT >= :P5)) '
             +'order by a.DT_INSERT, a.CD_GOODS',
              [HeadStoreCode,
               StoreCode,
               vTemplateCode^.Data,
               vUserCode^.Data,
               ConditionToolBarComboBox.ItemIndex,
               IfThen(ConditionToolBarComboBox.ItemIndex = 1, DtoS(ConditionToolBarFromDateEdit.Date), IfThen(ConditionToolBarComboBox.ItemIndex = 2, DtoS(Date-(ConditionToolBarDayEdit.Value-1)), EmptyStr))]);
    Result := not Query.Eof;
    if Result then
      DM.ReadQuery(Query, GridTableView)
    else
    begin
      FinishQuery;
      GridTableView.DataController.RecordCount := 0;
    end;

    // 템플릿 콤보박스 세팅
    TemplateComboBox.Properties.Items.Clear;
    // 조회조건의 양식을 무조건 다 넣음
    TemplateComboBox.Properties.Items.Assign(ConditionToolBarTemplateComboBox.Properties.Items);
    // 전체와 양식없음을 지움
    if TemplateComboBox.Properties.Items.Count > 0 then
      TemplateComboBox.Properties.Items.Delete(0);
    if TemplateComboBox.Properties.Items.Count > 0 then
      TemplateComboBox.Properties.Items.Delete(0);

    TemplateNewButton.Click;

    // 템플릿을 조건에서 지정했으면 그 템플릿 강제 지정
    if ConditionToolBarTemplateComboBox.ItemIndex > 1 then
      TemplateComboBox.ItemIndex := ConditionToolBarTemplateComboBox.ItemIndex-2
    else
      TemplateComboBox.ItemIndex := 0;

    ButtonToolBarPrintButton.Enabled      := (GridTableView.DataController.Summary.FooterSummaryValues[1] <> null) and (GridTableView.DataController.Summary.FooterSummaryValues[1] > 0);
    ButtonToolBarDeleteMenuButton.Enabled := GridTableView.DataController.RecordCount > 0;
    ButtonToolBarSaveMenuButton.Enabled       := ButtonToolBarDeleteMenuButton.Enabled;

    GridSearchPanel.Visible := True;
    Result := true;
  except
  end;
end;
//------------------------------------------------------------------------------
// 양식 초기화
procedure TCodePriceTagForm.ClearTemplate;
const
  valWon         = '원';

var
  vIndex: Integer;
begin
  isChanged := false;
  isLoading := true;
  try
    DirectionComboBox.ItemIndex         := 0;
    PageMarginTopEdit.Value             := 15;
    PageMarginLeftEdit.Value            := 15;
    TagMarginRightEdit.Value            := 5;
    TagMarginBottomEdit.Value           := 5;

    for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
      DesignPopupMenu.Items[vIndex].Checked := false;
    DesignLocationTopEdit.Value         := 0;
    DesignLocationLeftEdit.Value        := 0;
    DesignTextEdit.Text                 := EmptyStr;
    if GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell] then
      DesignFontEdit.Text               := Font.Name
    else
      DesignFontEdit.Text               := DefFontName;
    if GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell] then
      DesignFontSizeEdit.Value          := FixedFontSize
    else
      DesignFontSizeEdit.Value          := 3;  // 3mm
    DesignFontDialog.Font               := Font;
    DesignFontBoldCheckBox.Checked      := false;
    DesignFontEnlargeXCheckBox.Checked  := false;
    DesignFontEnlargeYCheckBox.Checked  := false;

    DesignSalePrice.Hint                := fmtPrice+valWon;
    DesignSalePrice.Caption             := valSalePrice+valWon;

    for vIndex := 0 to DesignPanel.ControlCount-1 do
    begin
      if (DesignPanel.Controls[vIndex].Tag div 10 = 4) and (DesignPanel.Controls[vIndex] is TcxLabel) then
      begin
        TcxLabel(DesignPanel.Controls[vIndex]).Caption := DesignLabelButton.Caption + IntToStr(DesignPanel.Controls[vIndex].Tag-40);
        TcxLabel(DesignPanel.Controls[vIndex]).Hint    := TcxLabel(DesignPanel.Controls[vIndex]).Caption;
      end
      else if (DesignPanel.Controls[vIndex].Tag div 10 = 5) and (DesignPanel.Controls[vIndex] is TcxImage) then
        DesignPanel.Controls[vIndex].Hint := EmptyStr;
      DesignPanel.Controls[vIndex].Top    := (DesignPanel.Height - DesignPanel.Controls[vIndex].Height) div 2;
      DesignPanel.Controls[vIndex].Left   := (DesignPanel.Width  - DesignPanel.Controls[vIndex].Width)  div 2;
      if DesignPanel.Controls[vIndex] is TcxLabel then
        TcxLabel(DesignPanel.Controls[vIndex]).Style.Font := Font;
      DesignPanel.Controls[vIndex].Visible := false;
    end;
    SelectedControl := nil;
    ResetEditProperties;
  finally
    isChanged := false;
    isLoading := false;
  end;
end;


procedure TCodePriceTagForm.SetKeepComboBox;
var
  vCode : PStrPointer;
begin
  ConditionToolBarKeepComboBox.Properties.Items.Clear;

  try
    OpenQuery('select DS_PRINT, NM_KEEP '
             +'  from MS_PRINT_TEMP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and DS_PRINT > 0 '
             +'   and NM_KEEP <> '''' '
             +' group by DS_PRINT, NM_KEEP',
             [HeadStoreCode,
              StoreCode]);

    New(vCode);
    vCode^.Data := '';
    ConditionToolBarKeepComboBox.Properties.Items.AddObject('[지정안함]', TObject(vCode));

    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarKeepComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 디자인 객체 선택
procedure TCodePriceTagForm.SetSelectedControl(aControl: TControl);
var
  vCode: PStrPointer;
begin
  if fSelectedControl = aControl then
    Exit;

  isLoading := true;
  try
    DesignLocationTopEdit.Value         := 0;
    DesignLocationTopEdit.Enabled       := false;
    DesignLocationLeftEdit.Value        := 0;
    DesignLocationLeftEdit.Enabled      := false;
    DesignTextLabel.Caption             := '문구';
    DesignTextEdit.Text                 := EmptyStr;
    DesignTextEdit.Properties.ReadOnly  := false;
    DesignTextEdit.Enabled              := false;
    DesignFontEdit.Text                 := EmptyStr;
    DesignFontEdit.Enabled              := false;
    DesignFontSizeLabel.Caption         := '크기';
    if GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell] then
      DesignFontSizeEdit.Value          := FixedFontSize
    else
      DesignFontSizeEdit.Value          := 3;
    DesignFontSizeEdit.Enabled          := false;
    DesignFontSizeUnitLabel.Caption     := 'pt';
    DesignFontDialog.Font               := Font;
    DesignFontBoldCheckBox.Checked      := false;
    DesignFontBoldCheckBox.Enabled      := false;
    DesignFontEnlargeXCheckBox.Checked  := false;
    DesignFontEnlargeXCheckBox.Enabled  := false;
    DesignFontEnlargeYCheckBox.Checked  := false;
    DesignFontEnlargeYCheckBox.Enabled  := false;
    DesignAlignmentComboBox.ItemIndex   := 0;
    DesignAlignmentComboBox.Enabled     := false;

    // 기존에 선택된 객체를 해제한다
    if Assigned(fSelectedControl) then
      if fSelectedControl is TcxLabel then
      begin
        TcxLabel(fSelectedControl).Style.Color := DesignPanel.Color;
        TcxLabel(fSelectedControl).Transparent := true;
      end
      else if (fSelectedControl is TcxImage) and (fSelectedControl.Tag <> DesignBackImage.Tag) then
        ShowImage(TcxImage(fSelectedControl), false);

    // 새 객체를 선택한다
    fSelectedControl := aControl;
    // 선택 객체에 따라 디자인 가능하게 활성화 시킨다
    if Assigned(fSelectedControl) then
    begin
      if fSelectedControl.Tag <> DesignBackImage.Tag then
        fSelectedControl.BringToFront;
      DesignLocationTopEdit.Value    := Trunc(fSelectedControl.Top  / mm2pt);
      DesignLocationLeftEdit.Value   := Trunc(fSelectedControl.Left / mm2pt);
      DesignLocationTopEdit.Enabled  := true;
      DesignLocationLeftEdit.Enabled := true;

      // 레이블
      if fSelectedControl is TcxLabel then
      begin
        TcxLabel(fSelectedControl).Style.Color         := EditStyleController.StyleFocused.Color;
        TcxLabel(fSelectedControl).Transparent         := false;
        if fSelectedControl.Tag div 10 = 3 then
          DesignTexTLabel.Caption                    := '포맷';
        if fSelectedControl.Tag div 10 = 4 then
        begin
          DesignTextEdit.Text                        := (fSelectedControl as TcxLabel).Caption;
          DesignTextEdit.Hint                        := (fSelectedControl as TcxLabel).Caption;
          DesignTextEdit.Enabled                     := true;
        end;
        DesignTextEdit.Properties.Buttons[0].Visible := false;
        if PrinterComboBox.ItemIndex = 0 then
          DesignFontEdit.Text                        := TcxLabel(fSelectedControl).Style.Font.Name
        else
          DesignFontEdit.Text                        := DefFontName;
        DesignFontBoldCheckBox.Checked               := TcxLabel(fSelectedControl).Style.Font.Style = [fsBold];
        DesignAlignmentComboBox.Enabled              := true;
        DesignAlignmentComboBox.ItemIndex            := StoI(TcxLabel(fSelectedControl).HelpKeyword) mod 10;
        vCode := PStrPointer(PrinterComboBox.Properties.Items.Objects[PrinterComboBox.ItemIndex]);
        // 일반 프린터
        if vCode^.Data[1] in [prnNormal,prnUserSize,prnHoneywell] then
        begin
          DesignFontEdit.Enabled                     := true;
          DesignFontSizeEdit.Value                   := TcxLabel(fSelectedControl).Style.Font.Size;
        end
        // Bixolon, TSC 프린터
        else if (vCode^.Data = prnBixolon) or (vCode^.Data = prnTSC) then
        begin
          DesignFontSizeEdit.Enabled                 := true;
          if vCode^.Data = prnBixolon then
          begin
            DesignFontSizeEdit.Properties.MinValue   := 2;
            DesignFontSizeEdit.Properties.MaxValue   := 100;
            DesignFontSizeUnitLabel.Caption          := 'mm';
          end
          else
          begin
            DesignFontSizeEdit.Properties.MinValue   := 1;
            DesignFontSizeEdit.Properties.MaxValue   := 4;
            DesignFontSizeUnitLabel.Caption          := '배';
          end;
          DesignFontSizeEdit.Value                   := TcxLabel(fSelectedControl).HelpContext;
          DesignFontBoldCheckBox.Enabled             := true;
          if vCode^.Data = prnTSC then
          begin
            DesignFontBoldCheckBox.Enabled           := false;
            DesignAlignmentComboBox.Enabled          := false;
          end;
          DesignFontEnlargeXCheckBox.Checked         := (StoI(TcxLabel(fSelectedControl).HelpKeyword) div 10) in [1, 3];
          DesignFontEnlargeXCheckBox.Enabled         := true;
          DesignFontEnlargeYCheckBox.Checked         := (StoI(TcxLabel(fSelectedControl).HelpKeyword) div 10) in [2, 3];
          DesignFontEnlargeYCheckBox.Enabled         := true;
        end;

        if fSelectedControl = DesignSalePrice then
        begin
          DesignTextCommentLabel.Caption := Format('판매가격:%s', [fmtPrice]);
          DesignTextEdit.Text  := '%p 원';
          DesignSalePrice.Hint := '%p 원';
        end
        else
          DesignTextCommentLabel.Caption := EmptyStr;
      end
      // 이미지
      else if fSelectedControl is TcxImage then
      begin
        DesignTextLabel.Caption                      := '파일';
        DesignTextEdit.Text                          := fSelectedControl.Hint;
        DesignTextEdit.Enabled                       := true;
        DesignTextEdit.Properties.Buttons[0].Visible := true;
        DesignTextEdit.Properties.ReadOnly           := true;
        if fSelectedControl.Tag = DesignBackImage.Tag then
        begin
          DesignLocationTopEdit.Enabled              := false;
          DesignLocationLeftEdit.Enabled             := false;
        end
        else if fSelectedControl.Tag = DesignBarcode.Tag then
        begin
          DesignFontEdit.Enabled                     := GetStrPointerData(PrinterComboBox)[1] in [prnNormal, prnUserSize, prnHoneywell];     //일반프린터일때는 바코드 폰트를 변경 할 수 있게한다
          if DesignFontEdit.Enabled then
            DesignFontEdit.Text                      := TcxImage(fSelectedControl).Style.Font.Name;
          DesignTextEdit.Enabled                     := false;
          DesignFontSizeEdit.Enabled                 := true;
          DesignFontSizeEdit.Properties.MinValue     := 3;
          DesignFontSizeEdit.Properties.MaxValue     := 50;
          if fSelectedControl.HelpContext = 0 then
            DesignFontSizeEdit.Value := 10
          else
            DesignFontSizeEdit.Value                 := fSelectedControl.HelpContext;
          DesignFontSizeLabel.Caption                := '높이';
          DesignFontSizeUnitLabel.Caption            := DesignLocationLeftMMLabel.Caption;
        end
        else
          ShowImage(TcxImage(fSelectedControl));
        DesignTextCommentLabel.Caption := EmptyStr;
      end;
      DesignDeleteButton.Enabled := true;
    end
    else
      DesignDeleteButton.Enabled := false;
  finally
    isLoading := false;
  end;
end;
//------------------------------------------------------------------------------
// 이미지 보여주기 (선택되었을 때 표시 등)
procedure TCodePriceTagForm.ShowImage(aImage: TcxImage; aSelected: Boolean);
var
  vBitmap: TBitmap;
begin
  if aImage <> DesignBarcode then
    // 연결된 이미지 파일이 없으면 빈 이미지를 표시한다
    if not FileExists(aImage.Hint) then
    begin
      aImage.Hint := EmptyStr;
      aImage.Picture.Assign(BlankImage.Picture);
    end
    // 연결된 이미지 파일이 있으면 해당 이미지를 불러온다
    else
      aImage.Picture.LoadFromFile(aImage.Hint);

  // 선택된 이미지는 이미지 파일에 테두리를 그려서 보여준다
  if aSelected and (aImage.Picture <> nil) then
  begin
    vBitmap := TBitmap.Create;
    vBitmap.Assign(aImage.Picture.Graphic);
    vBitmap.Canvas.Brush.Style := bsClear;
    vBitmap.Canvas.Pen.Color   := clBlack;
    vBitmap.Canvas.Pen.Width   := 2;
    vBitmap.Canvas.Rectangle(1, 1, vBitmap.Width, vBitmap.Height);
    aImage.Picture.Bitmap.Assign(vBitmap);
    vBitmap.Free;
    aImage.Repaint;
  end;
end;
//------------------------------------------------------------------------------
// 일반 프린터 출력
procedure TCodePriceTagForm.PrintNormal(aPreview:Boolean);
var
  vPage : TfrxReportPage;
  vBand : TfrxMasterData;
  vMemo : TfrxMemoView;
  vImage: TfrxPictureView;
  vBar  : TfrxBarCodeView;
  vIndex: Integer;
  vWidth,
  vHeight : Integer;
begin
  // 페이지 여백 지정 (여기는 mm 단위로 입력)
  vPage := TfrxReportPage(FastReport.FindObject('Page'));
  if DirectionComboBox.ItemIndex = 1 then
    vPage.Orientation := TPrinterOrientation.poLandscape
  else
    vPage.Orientation := TPrinterOrientation.poPortrait;
  vPage.TopMargin     := PageMarginTopEdit.Value;
  vPage.LeftMargin    := PageMarginLeftEdit.Value;

{  if GetStrPointerData(PrinterComboBox) = prnUserSize then
  begin
    vPage.PaperSize    := 0;
    vPage.PaperWidth   := TagSizeWidthEdit.EditValue;
    vPage.PaperHeight  := TagSizeHeightEdit.EditValue;
    vPage.LeftMargin   := 0;
    vPage.RightMargin  := 0;
    vPage.TopMargin    := 0;
    vPage.BottomMargin := 0;
  end;
}
  // 태그 크기 및 개수 지정 (여기부터는 point 단위로 입력)
  if GetStrPointerData(PrinterComboBox) = prnNormal then
  begin
    vPage.PaperWidth    := 210;
    vPage.PaperHeight   := 297;
    vBand := TfrxMasterData(FastReport.FindObject('Band'));
    vBand.Width         := vPage.PaperWidth   * fr01cm;
    vBand.ColumnGap     := TagMarginRightEdit.Value * fr01cm;
    vBand.Columns       := (IfThen(DirectionComboBox.ItemIndex = 0, 210, 297) - Trunc(PageMarginLeftEdit.Value) - 10) div Trunc(TagSizeWidthEdit.Value);
    vBand.ColumnWidth   := TagSizeWidthEdit.Value   * fr01cm;
    vBand.Height        := (TagSizeHeightEdit.Value + TagMarginBottomEdit.Value) * fr01cm;
  end
  else
  begin
    vPage.PaperSize     := 0;
    vPage.LeftMargin    := 0;
    vPage.RightMargin   := 0;
    vPage.TopMargin     := 0;
    vPage.BottomMargin  := 0;
    vPage.PaperWidth    := (TagSizeWidthEdit.Value * ColumCountEdit.Value) + (ColumCountEdit.Value-1)*ColumMarginEdit.Value;
    vPage.PaperHeight   := TagSizeHeightEdit.EditValue;
    vPage.Columns       := ColumCountEdit.Value;

    vBand := TfrxMasterData(FastReport.FindObject('Band'));
    vBand.ColumnGap     := ColumMarginEdit.Value * fr01cm;
    vBand.Height        := TagSizeHeightEdit.Value * fr01cm;
    vBand.Width         := vPage.PaperWidth   * fr01cm;
    vBand.ColumnWidth   := TagSizeWidthEdit.Value   * fr01cm;
    vBand.Left          := 0;
  end;

  // 각 객체 위치 및 내용, 표시여부 등 지정
  for vIndex := 0 to DesignPanel.ControlCount-1 do
    // 레이블
    if DesignPanel.Controls[vIndex] is TcxLabel then
    begin
      vMemo := TfrxMemoView(FastReport.FindObject(DesignPanel.Controls[vIndex].Name));
      if Assigned(vMemo) then
      begin
        vMemo.Visible       := DesignPanel.Controls[vIndex].Visible;
        vMemo.Printable     := vMemo.Visible;
        vMemo.Font          := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font;
        vMemo.Top           := DesignPanel.Controls[vIndex].Top    / mm2pt * fr01cm;
        vMemo.Height        := DesignPanel.Controls[vIndex].Height / mm2pt * fr01cm + 2;
        if TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword = '1' then // 오른쪽 정렬
        begin
          vMemo.Left        := 1;
          vMemo.Width       := (DesignPanel.Controls[vIndex].Left + DesignPanel.Controls[vIndex].Width) / mm2pt * fr01cm;
          vMemo.HAlign      := haRight;
        end
        else                                                 // 왼쪽 정렬
        begin
          vMemo.Left        := DesignPanel.Controls[vIndex].Left / mm2pt * fr01cm;
          vMemo.Width       := (TagSizeWidthEdit.Value * mm2pt - DesignPanel.Controls[vIndex].Left) / mm2pt * fr01cm;
          vMemo.HAlign      := haLeft;
        end;
        if DesignPanel.Controls[vIndex].Tag div 10 = 4 then  // 레이블
          vMemo.Memo.Text := DesignPanel.Controls[vIndex].Hint;
      end;
    end
    // 바코드
    else if DesignPanel.Controls[vIndex] = DesignBarcode then
    begin
      vBar := TfrxBarCodeView(FastReport.FindObject(DesignPanel.Controls[vIndex].Name));
      if Assigned(vBar) then
      begin
        vBar.Font.Size      := TcxImage(DesignPanel.Controls[vIndex]).Style.Font.Size;
        vBar.Visible        := DesignPanel.Controls[vIndex].Visible;
        vBar.Printable      := vBar.Visible;
        vBar.Left           := DesignPanel.Controls[vIndex].Left   / mm2pt * fr01cm;
        vBar.Top            := DesignPanel.Controls[vIndex].Top    / mm2pt * fr01cm;
        vBar.Height         := DesignPanel.Controls[vIndex].HelpContext * fr01cm;
      end;
    end
    // 그림
    else if DesignPanel.Controls[vIndex] is TcxImage then
    begin
      vImage := TfrxPictureView(FastReport.FindObject(DesignPanel.Controls[vIndex].Name));
      if Assigned(vImage) then
      begin
        vImage.Visible      := DesignPanel.Controls[vIndex].Visible;
        vImage.Printable    := vImage.Visible;
        vImage.TagStr       := DesignPanel.Controls[vIndex].Hint;
        vImage.Left         := DesignPanel.Controls[vIndex].Left / mm2pt * fr01cm;
        vImage.Top          := DesignPanel.Controls[vIndex].Top  / mm2pt * fr01cm;
        if DesignPanel.Controls[vIndex] = DesignBackImage then
        begin
          vImage.Width      := TagSizeWidthEdit.Value  * fr01cm;
          vImage.Height     := TagSizeHeightEdit.Value * fr01cm;
        end
        else
        begin
          if DesignPanel.Controls[vIndex].Left + DesignPanel.Controls[vIndex].Width  > DesignPanel.Width  then
          begin
            TcxImage(DesignPanel.Controls[vIndex]).AutoSize := false;
            DesignPanel.Controls[vIndex].Width  := DesignPanel.Width  - DesignPanel.Controls[vIndex].Left;
          end;
          if DesignPanel.Controls[vIndex].Top  + DesignPanel.Controls[vIndex].Height > DesignPanel.Height then
          begin
            TcxImage(DesignPanel.Controls[vIndex]).AutoSize := false;
            DesignPanel.Controls[vIndex].Height := DesignPanel.Height - DesignPanel.Controls[vIndex].Top;
          end;
          vImage.Width      := DesignPanel.Controls[vIndex].Width  / mm2pt * fr01cm;
          vImage.Height     := DesignPanel.Controls[vIndex].Height / mm2pt * fr01cm;
        end;
      end;
    end;

  // 푸터 제목
  vMemo := TfrxMemoView(FastReport.FindObject('ProgramNameLabel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Caption;

  FastReport.PrintOptions.Printer    := DriverNameEdit.Text;
  FastReport.PrintOptions.ShowDialog := (DriverNameEdit.Text = '') or PreviewCheckBox.Checked;

  // 미리보기
  if aPreview then
  begin
    FastReport.ShowReport;
  end
  else
  begin
    FastReport.PrepareReport();
    FastReport.Print;
  end;
end;
//------------------------------------------------------------------------------
// 일반 프린터 출력 데이터 끝 알아내기
procedure TCodePriceTagForm.FastReportUserDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  inherited;

  if GridTableView.DataController.Summary.FooterSummaryValues[1] = null then
    Eof := true
  else
    Eof := FastReportUserDataSet.RecNo >= GridTableView.DataController.Summary.FooterSummaryValues[1];
end;
//------------------------------------------------------------------------------
// 일반 프린터 출력 데이터 알아내기
procedure TCodePriceTagForm.FastReportUserDataSetGetValue(const VarName: string; var Value: Variant);
var
  vIndex, vRow: Integer;
begin
  inherited;

  // 현재 레코드를 지정한다 (출력 매수가 여러 장이면 여러 장 출력하게 하기 위해 루프 돌아감)
  vIndex := 0;
  for vRow := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    vIndex := vIndex + GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index];
    if vIndex > FastReportUserDataSet.RecNo then
      break;
  end;

  // 그리드에서 연결된 칼럼을 찾아 리포트에 값을 넘겨준다
  if      (VarName = GridTableViewGoodsCode.DataBinding.FieldName) and (DesignGoodsCode.Visible or DesignBarcode.Visible) then
    Value := GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index]
  else if (VarName = GridTableViewGoodsName.DataBinding.FieldName) and (DesignGoodsName.Visible) then
    Value := GridTableView.DataController.Values[vRow, GridTableViewGoodsName.Index]
  else if (VarName = GridTableViewGoodsShortName.DataBinding.FieldName) and (DesignGoodsShortName.Visible) then
    Value := GridTableView.DataController.Values[vRow, GridTableViewGoodsShortName.Index]
  else if (VarName = GridTableViewGoodsSpec.DataBinding.FieldName) and (DesignGoodsSpec.Visible) then
    Value := GridTableView.DataController.Values[vRow, GridTableViewGoodsSpec.Index]
  else if (VarName = GridTableViewSalePriceName.DataBinding.FieldName) and (DesignSalePrice.Visible) then
    Value := GridTableView.DataController.Values[vRow, GridTableViewSalePriceName.Index]
  else
    Value := EmptyStr;
end;
//------------------------------------------------------------------------------
// Bixolon (SRP-770 등) 출력
procedure TCodePriceTagForm.PrintBixolon;
  // 위치 계산
  function GetPos(aPixel: Integer): Integer;
  begin
    Result := Trunc(aPixel / mm2pt * mm2dot);
  end;
  // 크기 계산
  function GetSize(aSize: Integer; aEnlarge: Boolean): Integer;
  begin
    Result := aSize * mm2dot * IfThen(aEnlarge, 2, 1);
  end;
const
  fmtText    = 'V%d,%d,K,%d,%d,0,%s,N,N,0,%s,0,''%s'''#13;  // 가로위치,세로위치,(글꼴),폭,높이,(자간),굵기(N정상,B굵게),(역상),(기울임),(회전),정렬(L왼쪽,R오른쪽,C가운데),(쓰는방향),찍을문자열
  fmtBarcode = 'B1%d,%d,%d,%d,%d,%d,0,%d,''%s'''#13;        // 가로위치,세로위치,바코드종류,좁은바코드폭,넓은바코드폭,바코드높이,(회전),바코드숫자크기,바코드
  fmtImage   = 'IR%d,%d,''%s'''#13;                         // 가로위치,세로위치,그림이름(롬에 설치된)
var
  vRow,
  vCount,
  vIndex, vCol,
  vType        : Integer;
  vStr,
  vPrintData   : string;
  vPrintList   : TStringList;
  vBytesWritten: Cardinal;
  tPrn         : TextFile;
  vPrintCount  : integer;
begin
  // 지원하지 않는 속도 판단
  vType := -1;
  if ComPortPortComboBox.ItemIndex >= 1 then
  begin
    case StoI(ComPortBaudRateComboBox.Text) of
        9600 : vType := 0;
       19200 : vType := 1;
       38400 : vType := 2;
       57600 : vType := 3;
      115200 : vType := 4;
    end;
    if vType = -1 then
    begin
      ErrBox(Format('지원하지 않는 %s입니다.'#13'%d ~ %d 값을 지정하십시오.', [TagMarginLabel.Caption, 9600, 115200]));
      ComPortBaudRateComboBox.SetFocus;
      Exit;
    end;

    // 시리얼포트를 열어본다
    try
      ComPort.Port     := ComPortPortComboBox.Text;
      ComPort.BaudRate := StrToBaudRate(ComPortBaudRateComboBox.Text);
      ComPort.Open;
      ComPort.Close;
    except
      on E: Exception do
      begin
        ErrBox(Format('%s를 열 수 없습니다.'#13'%s', [TagMarginLabel.Caption, E.Message]));
        Exit;
      end;
    end;
  end;

  vPrintList := TStringList.Create;
  try
    // 버퍼 지우기
    vPrintData := 'CB'#13;
    // 인쇄 속도 지정 (SS 속도(0:2.5인치/s ~ 6:8인치/s)
    vPrintData := vPrintData + 'SS3'#13;
    // 인쇄 농도 지정 (SD 농도(0:옅음 ~ 20:짙음)
    vPrintData := vPrintData + 'SD10'#13;
    // 인쇄 방향 지정 (SO 방향(T:똑바로인쇄, B:거꾸로인쇄))
    vPrintData := vPrintData + Format('SO%s'#13, [IfThen(DirectionComboBox.ItemIndex = 1, 'B', 'T')]);
    // 속도 등 지정 (SP BaudRate(0:9600, 1:19200, 2:38400, 3:57600, 4:115200), 패러티(O,E,N), 데이터비트(7,8), 스톱비트(1,2))
    vPrintData := vPrintData + Format('SP%d,N,8,1'#13, [vType]);
    // 용지 종류 지정 (ST 종류(d:써멀, t:리본))
    vPrintData := vPrintData + 'STd'#13;
    // 블랙마크,연속 용지 되감기
    if PaperTypeComboBox.ItemIndex in [1, 2] then
      vPrintData := vPrintData + Format('SF1,%d'#13, [Trunc(PageMarginLeftEdit.Value * mm2dot)]);
    // 용지 길이 지정 (SL 용지 길이(도트), 용지사이 갭(도트), 용지타입[옵션](G:갭, C:연속지, B:블랙마크), 블랙마크와 절취선간 거리[옵션](도트)
    vPrintData := vPrintData + Format('SL%d,%d,%s'#13, [Trunc(TagSizeHeightEdit.Value * mm2dot), 30, IfThen(PaperTypeComboBox.ItemIndex = 0, 'G', IfThen(PaperTypeComboBox.ItemIndex = 1, 'B','C'))]);
    // 용지 폭 지정 (SW 용지 폭(도트))
    vPrintData := vPrintData + Format('SW%d'#13, [Trunc(TagSizeWidthEdit.Value * mm2dot)]);
    // 더블버퍼링 하지 않음
    vPrintData := vPrintData + 'SB0'#13;
    vPrintList.Add(vPrintData);
    vPrintData := EmptyStr;

    // 출력
    vCount := 1;
    for vRow := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      // 출력할 매수를 지정하지 않았으면 다음 레코드로 이동
      if GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index] < 1 then
        Continue;

//    ShowMsg(Format('%d / %d 매 출력 중...', [vCount, Integer(GridTableView.DataController.Summary.FooterSummaryValues[1])]));
      vCount := vCount + GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index];

      // 디자인 패널에 있는 모든 객체를 뒤져서
      for vIndex := 0 to DesignPanel.ControlCount-1 do
        if DesignPanel.Controls[vIndex].Visible then
          // 레이블이면
          if DesignPanel.Controls[vIndex] is TcxLabel then
          begin
            // 단독 레이블이면 해당 레이블 내역 그대로 출력
            if (DesignPanel.Controls[vIndex].Tag div 10 = 4) and (DesignPanel.Controls[vIndex].Hint <> EmptyStr) then
              vPrintData := vPrintData + Format(fmtText, [GetPos(DesignPanel.Controls[vIndex].Left + IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) mod 10) = 1, DesignPanel.Controls[vIndex].Width, 0)), // 가로위치
                                                          GetPos(DesignPanel.Controls[vIndex].Top),                                     // 세로위치
                                                          GetSize(TcxLabel(DesignPanel.Controls[vIndex]).HelpContext, (StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [1, 3]),  // 폭
                                                          GetSize(TcxLabel(DesignPanel.Controls[vIndex]).HelpContext, (StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [2, 3]),  // 높이
                                                          IfThen(TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style = [fsBold], 'B', 'N'), // 굵게
                                                          IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) mod 10) = 1, 'R', 'L'), // 정렬
                                                          DesignPanel.Controls[vIndex].Hint])                                           // 레이블 내용
            // DB와 연결된 레이블이면 그리드에서 찾아서 출력
            else
              for vCol := 0 to GridTableView.ColumnCount-1 do
                if (DesignPanel.Controls[vIndex].Tag = GridTableView.Columns[vCol].Tag) and (GridTableView.DataController.Values[vRow, vCol] <> EmptyStr) then
                begin
                  vPrintData := vPrintData + Format(fmtText, [GetPos(DesignPanel.Controls[vIndex].Left + IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) mod 10) = 1, DesignPanel.Controls[vIndex].Width, 0)), // 가로위치
                                                              GetPos(DesignPanel.Controls[vIndex].Top),                                     // 세로위치
                                                              GetSize(TcxLabel(DesignPanel.Controls[vIndex]).HelpContext, (StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [1, 3]),  // 폭
                                                              GetSize(TcxLabel(DesignPanel.Controls[vIndex]).HelpContext, (StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [2, 3]),  // 높이
                                                              IfThen(TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style = [fsBold], 'B', 'N'), // 굵게
                                                              IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) mod 10) = 1, 'R', 'L'), // 정렬
                                                              Replace(Replace(String(GridTableView.DataController.Values[vRow, vCol]),'\','＼'),'"','″')]);    // 레이블 내용
                  break;
                end;
          end
          // 그림이면
          else if DesignPanel.Controls[vIndex] is TcxImage then
          begin
            // 바코드
            if DesignPanel.Controls[vIndex] = DesignBarcode then
            begin
              if GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index] <> EmptyStr then
              begin
                if (GetBarcode(GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index]) = GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index]) then
                  case Length(GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index]) of
                     8 : vType := 8; // EAN8
                    13 : vType := 7; // EAN13
                     7 : vType := 6; // UPC-E
                    12 : vType := 5; // UPC-A
                    else vType := 1; // Code128
                  end
                else
                  vType := 1;
                vPrintData := vPrintData + Format(fmtBarcode, [GetPos(DesignPanel.Controls[vIndex].Left), // 바코드 가로위치
                                                               GetPos(DesignPanel.Controls[vIndex].Top),  // 바코드 세로위치
                                                               vType,                                     // 바코드 종류
                                                               2, 6,                                      // 바코드 좁은선 굵기, 넓은선 굵기
                                                               DesignBarcode.HelpContext * mm2dot,        // 바코드 높이
                                                               3,                                         // 바코드 아래 숫자 크기(1,3,5,7)
                                                               String(GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index])]);
              end;
            end
            // 일반그림
            else
            begin
              vStr := ChangeFileExt(ExtractFileName(DesignPanel.Controls[vIndex].Hint), EmptyStr);
              if vStr <> EmptyStr then
                vPrintData := vPrintData + Format(fmtImage, [GetPos(DesignPanel.Controls[vIndex].Left), // 그림 가로위치
                                                             GetPos(DesignPanel.Controls[vIndex].Top),  // 그림 세로위치
                                                             vStr]);                                    // 그림이름
            end;
          end;
      // 출력 (P 출력수량)
      vPrintData := vPrintData + Format('P%d'#13, [Integer(GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index])]);
      vPrintList.AddObject(vPrintData, TObject(Integer(GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index])));
      vPrintData := EmptyStr;
    end;

    vPrintCount := 0;

    // 시리얼일 때
    if ComPortPortComboBox.ItemIndex >= 1 then
    begin
      AssignFile(tPrn, ComPortPortComboBox.Text);
      rewrite(tPrn);
      try
        for vIndex := 0 to vPrintList.Count-1 do
        begin
          writeln(tPrn, vPrintList[vIndex]);
          vPrintCount := vPrintCount + Integer(vPrintList.Objects[vIndex]);
          //10장 이상 출력했으면 0.5초 쉰다
          if vPrintCount > 10 then
          begin
            Sleep(1000);
            vPrintCount := 0;
          end;
        end;
      finally
        closeFile(tPrn);
      end;
    end
    // LPT일 때
    else if ComPortPortComboBox.ItemIndex = 0 then
    begin
      LPTPortInit;
      for vIndex := 0 to vPrintList.Count-1 do
      begin
        WriteFile(LPTFile, PChar(vPrintList[vIndex])^, Length(vPrintList[vIndex]), vBytesWritten, nil);
        vPrintCount := vPrintCount + Integer(vPrintList.Objects[vIndex]);
        //10장 이상 출력했으면 0.5초 쉰다
        if vPrintCount > 10 then
        begin
          Sleep(1000);
          vPrintCount := 0;
        end;
      end;
      CloseHandle(LPTFile);
      if (Integer(vBytesWritten) < Length(vPrintData)) then
        raise Exception.Create('LPT 포트로 출력할 수 없습니다.');
    end;

    ShowMsg('출력 완료...');
  finally
    ComPort.Close;
    vPrintList.Free;
  end;
end;

//------------------------------------------------------------------------------
// TSC (TTP-243 등) 출력
procedure TCodePriceTagForm.PrintTSC;
  // 위치 계산
  function GetPos(aPixel: Integer): Integer;
  begin
    Result := Trunc(aPixel / mm2pt * mm2dot);
  end;
const
  fmtText    = 'TEXT %d,%d,"K",0,%d,%d,"%s"'#13;           // 가로위치,세로위치,(글꼴),(회전),가로확대(1~10),세로확대(1~10),찍을문자열
  fmtBarcode = 'BARCODE %d,%d,"%s",%d,1,0,%d,%d,"%s"'#13;  // 가로위치,세로위치,바코드종류,높이,(숫자표시여부),(회전),좁은바코드폭,넓은바코드폭,바코드
var
  vRow,
  vCount,
  vIndex, vCol,
  vType        : Integer;
  vPrintData   : string;
  vPrintList   : TStringList;
  vBytesWritten: Cardinal;
  vBarcodeType : string;
  tPrn         : TextFile;
  vPrintCount  : Integer;
begin
  // 지원하지 않는 속도 판단
  vType := -1;
  if ComPortPortComboBox.ItemIndex >= 1 then
  begin
    case StoI(ComPortBaudRateComboBox.Text) of
        9600 : vType := 96;
       19200 : vType := 19;
       38400 : vType := 38;
       57600 : vType := 57;
      115200 : vType := 115;
    end;
    if vType = -1 then
    begin
      ErrBox(Format('지원하지 않는 %s입니다.'#13'%d ~ %d 값을 지정하십시오.', [TagMarginLabel.Caption, 9600, 115200]));
      ComPortBaudRateComboBox.SetFocus;
      Exit;
    end;

    // 시리얼포트를 열어본다
    try
      ComPort.Port     := ComPortPortComboBox.Text;
      ComPort.BaudRate := StrToBaudRate(ComPortBaudRateComboBox.Text);
      ComPort.Open;
      ComPort.Close;
    except
      on E: Exception do
      begin
        ErrBox(Format('%s를 열 수 없습니다.'#13'%s', [TagMarginLabel.Caption, E.Message]));
        Exit;
      end;
    end;
  end;

  vPrintList := TStringList.Create;
  try
    vPrintData := EmptyStr;
    // 속도 등 지정 (SET COMx BaudRate(96:9600, 19:19200, 38:38400, 57:57600, 115:115200), 패러티(O,E,N), 데이터비트(7,8), 스톱비트(1,2))
    if ComPortPortComboBox.ItemIndex >= 1 then
      vPrintData := vPrintData + Format('SET %s %d,N,8,1'#13, [ComPortPortComboBox.Text, vType]);
    // 용지 크기 지정 (SIZE width mm,length mm)
    vPrintData := vPrintData + Format('SIZE %d mm,%d mm'#13, [Trunc(TagSizeWidthEdit.Value), Trunc(TagSizeHeightEdit.Value)]);
    // 용지 종류 지정
    if PaperTypeComboBox.ItemIndex = 0 then
      vPrintData := vPrintData + Format('GAP %d mm,0 mm'#13, [Trunc(PageMarginLeftEdit.Value)])
    else if PaperTypeComboBox.ItemIndex = 1 then
      vPrintData := vPrintData + Format('BLINE %d mm,0 mm'#13, [Trunc(PageMarginLeftEdit.Value)]);
    // 인쇄 농도 지정 (DENSITY (0:옅음 ~ 15:짙음))
    vPrintData := vPrintData + 'DENSITY 10'#13;
    // 인쇄 속도 지정 (SPEED (1.5,2,3))
    vPrintData := vPrintData + 'SPEED 3'#13;
    // 인쇄 방향 지정 (DIRECTION 방향(0,0:똑바로인쇄, 1,0:거꾸로인쇄))
    vPrintData := vPrintData + Format('DIRECTION %d,0'#13, [DirectionComboBox.ItemIndex]);
    // 여백 지정
    vPrintData := vPrintData + 'REFERENCE 0,0'#13;
    // 기타
    vPrintData := vPrintData + 'SET CUTTER OFF'#13;
    vPrintData := vPrintData + 'SET PEEL OFF'#13;
    // 언어
    vPrintData := vPrintData + 'CODEPAGE 437'#13;
    // 버퍼 지우기
    vPrintData := vPrintData + 'CLS'#13;
    vPrintList.Add(vPrintData);
    vPrintData := EmptyStr;

    // 출력
    vCount := 1;
    for vRow := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      // 출력할 매수를 지정하지 않았으면 다음 레코드로 이동
      if GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index] < 1 then
        Continue;

//    ShowMsg(Format('%d / %d 매 출력 중...', [vCount, Integer(GridTableView.DataController.Summary.FooterSummaryValues[1])]));
      vCount := vCount + GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index];

      // 디자인 패널에 있는 모든 객체를 뒤져서
      for vIndex := 0 to DesignPanel.ControlCount-1 do
        // 레이블이면
        if (DesignPanel.Controls[vIndex] is TcxLabel) and (DesignPanel.Controls[vIndex].Visible) then
        begin
          // 단독 레이블이면 해당 레이블 내역 그대로 출력
          if (DesignPanel.Controls[vIndex].Tag div 10 = 4) and (DesignPanel.Controls[vIndex].Hint <> EmptyStr) then
            vPrintData := vPrintData + Format(fmtText, [GetPos(DesignPanel.Controls[vIndex].Left),                          // 가로위치
                                                        GetPos(DesignPanel.Controls[vIndex].Top),                           // 세로위치
                                                        TcxLabel(DesignPanel.Controls[vIndex]).HelpContext * IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [1, 3], 2, 1),    // 가로확대
                                                        TcxLabel(DesignPanel.Controls[vIndex]).HelpContext * IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [2, 3], 2, 1),    // 세로확대
                                                        DesignPanel.Controls[vIndex].Hint])                                 // 레이블 내용
          // DB와 연결된 레이블이면 그리드에서 찾아서 출력
          else
            for vCol := 0 to GridTableView.ColumnCount-1 do
              if (DesignPanel.Controls[vIndex].Tag = GridTableView.Columns[vCol].Tag) and (GridTableView.DataController.Values[vRow, vCol] <> EmptyStr) then
              begin
                vPrintData := vPrintData + Format(fmtText, [GetPos(DesignPanel.Controls[vIndex].Left),                      // 가로위치
                                                            GetPos(DesignPanel.Controls[vIndex].Top),                       // 세로위치
                                                            TcxLabel(DesignPanel.Controls[vIndex]).HelpContext * IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [1, 3], 2, 1),  // 가로확대
                                                            TcxLabel(DesignPanel.Controls[vIndex]).HelpContext * IfThen((StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10) in [2, 3], 2, 1),  // 세로확대
                                                            Replace(Replace(String(GridTableView.DataController.Values[vRow, vCol]),'\','＼'),'"','″')]);    // 레이블 내용
                break;
              end;
        end
        // 그림이면
        else if (DesignPanel.Controls[vIndex] is TcxImage) and (DesignPanel.Controls[vIndex].Visible) then
        begin
          // 바코드
          if DesignPanel.Controls[vIndex] = DesignBarcode then
          begin
            if GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index] <> EmptyStr then
            begin
              if GetBarcode(GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index]) = GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index] then
                case Length(GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index]) of
                   8 : vBarcodeType := 'EAN8';  // EAN8
                  13 : vBarcodeType := 'EAN13'; // EAN13
                   7 : vBarcodeType := 'UPCE';  // UPC-E
                  12 : vBarcodeType := 'UPCA';  // UPC-A
                  else vBarcodeType := '128'; //Code128 '39';    // Code39
                end
              else
                vBarcodeType := '128';
              vPrintData := vPrintData + Format(fmtBarcode, [GetPos(DesignPanel.Controls[vIndex].Left), // 바코드 가로위치
                                                             GetPos(DesignPanel.Controls[vIndex].Top),  // 바코드 세로위치
                                                             vBarcodeType,                              // 바코드 종류
                                                             DesignBarcode.HelpContext * mm2dot,        // 바코드 높이
                                                             2, 6,                                      // 좁은 바코드 폭, 넓은 바코드 폭 (매뉴얼에 dot 단위라고 나와있으나 비율 같은 것인 듯)
                                                             String(GridTableView.DataController.Values[vRow, GridTableViewGoodsCode.Index])]);
            end;
          end;
        end;
      // 출력 (PRINT 벌,장)
      vPrintData := vPrintData + Format('PRINT -1,%d'#13'CLS'#13, [Integer(GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index])]);
      vPrintList.AddObject(vPrintData, TObject(Integer(GridTableView.DataController.Values[vRow, GridTableViewPrintQty.Index])));
      vPrintData := EmptyStr;
    end;
    // 출력 끝
    vPrintList.Add('EOP');
    vPrintCount := 0;

    // 시리얼일 때
    if ComPortPortComboBox.ItemIndex >= 1 then
    begin
      AssignFile(tPrn, ComPortPortComboBox.Text);
      rewrite(tPrn);
      try
        for vIndex := 0 to vPrintList.Count-1 do
        begin
          writeln(tPrn, vPrintList[vIndex]);
          vPrintCount := vPrintCount + Integer(vPrintList.Objects[vIndex]);
          //10장 이상 출력했으면 0.5초 쉰다
          if vPrintCount > 10 then
          begin
            Sleep(1000);
            vPrintCount := 0;
          end;
        end;
      finally
        closeFile(tPrn);
      end;
    end
    // LPT일 때
    else if ComPortPortComboBox.ItemIndex = 0 then
    begin
      LPTPortInit;
      for vIndex := 0 to vPrintList.Count-1 do
      begin
        WriteFile(LPTFile, PChar(vPrintList[vIndex])^, Length(vPrintList[vIndex]), vBytesWritten, nil);
        vPrintCount := vPrintCount + Integer(vPrintList.Objects[vIndex]);
        //10장 이상 출력했으면 0.5초 쉰다
        if vPrintCount > 10 then
        begin
          Sleep(1000);
          vPrintCount := 0;
        end;
      end;
      CloseHandle(LPTFile);
      if (Integer(vBytesWritten) < Length(vPrintData)) then
        raise Exception.Create('LPT 포트로 출력할 수 없습니다.');
    end;

    ShowMsg('출력 완료...');
  finally
    ComPort.Close;
    vPrintList.Free;
  end;
end;

//------------------------------------------------------------------------------
// LPT 포트 초기화
procedure TCodePriceTagForm.LPTPortInit;
var
 aTimeOut : TCommTimeouts;
begin
   LPTFile := CreateFile(PChar('LPT1'), GENERIC_WRITE, 0,nil,OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
   if GetCommTimeouts(LPTFile,aTimeOut) then
   begin
     aTimeOut.WriteTotalTimeoutMultiplier := 200;   // 200
     aTimeOut.WriteTotalTimeoutConstant   := 2000;   // 4000
     SetCommTimeouts(LPTFile,aTimeOut);
   end;
end;

procedure TCodePriceTagForm.Proc_PRINT(var Message: TMessage);
var
  vTemplateComboBoxItemIndexBackup: Integer;
begin
  ButtonToolBarPrintButton.Visible       := true;

  // 임시 보관함 값 새로 불러오기
  SetKeepComboBox;
  ConditionToolBarKeepComboBox.ItemIndex := ConditionToolBarKeepComboBox.Properties.Items.Count-1;

  // 기존 템플릿 백업
  vTemplateComboBoxItemIndexBackup       := TemplateComboBox.ItemIndex;

  // 조회
  DoSearch;

  // 기존 템플릿을 다시 불러오기
  if (vTemplateComboBoxItemIndexBackup >= 0) and (TemplateComboBox.Properties.Items.Count > vTemplateComboBoxItemIndexBackup) then
    TemplateComboBox.ItemIndex := vTemplateComboBoxItemIndexBackup
  else if TemplateComboBox.ItemIndex = -1 then
    TemplateComboBox.ItemIndex := 0;

  ButtonToolBarNewButtonClick(nil);
  ExecQuery('delete from MS_PRINT_TEMP '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_PRINT = 999; ',
            [HeadStoreCode,
             StoreCode], True);
end;


{ TPCXGraphic }

//==============================================================================
// PCX
//------------------------------------------------------------------------------
// PCX 불러오기
procedure TPCXGraphic.LoadFromStream(Stream: TStream);
type
  TRGB = packed record
   R, G, B: Byte;
  end;
  TPCXHeader = record
    FileID  : Byte;                    // $0A for PCX files, $CD for SCR files
    Version : Byte;                    // 0: version 2.5; 2: 2.8 with palette; 3: 2.8 w/o palette; 5: version 3
    Encoding: Byte;                    // 0: uncompressed; 1: RLE encoded
    BitsPerPixel: Byte;
    XMin,
    YMin,
    XMax,
    YMax,                              // coordinates of the corners of the image
    HRes,                              // horizontal resolution in dpi
    VRes: Word;                        // vertical resolution in dpi
    ColorMap: array[0..15] of TRGB;    // color table
    Reserved,
    ColorPlanes: Byte;                 // color planes (at most 4)
    BytesPerLine,                      // number of bytes of one line of one plane
    PaletteType: Word;                 // 1: color or b&w; 2: gray scale
    Fill: array[0..57] of Byte;
  end;
var
  Header: TPCXHeader;

  // creates the physical palette for the image,
  procedure MakePalette;
  var
    vPCXPalette: array[0..255] of TRGB;
    vPalette   : TMaxLogPalette;
    vhPalette  : HPALETTE;
    vIndex     : Integer;
    vOldPos    : Integer;
    vMarker    : Byte;
  begin
    vPalette.palVersion := $300;
    if (Header.Version <> 3) or (PixelFormat = pf1Bit) then
    begin
      case PixelFormat of
        pf1Bit:
          begin
            vPalette.palNumEntries          := 2;
            vPalette.palPalEntry[0].peRed   := 0;
            vPalette.palPalEntry[0].peGreen := 0;
            vPalette.palPalEntry[0].peBlue  := 0;
            vPalette.palPalEntry[0].peFlags := 0;
            vPalette.palPalEntry[1].peRed   := 255;
            vPalette.palPalEntry[1].peGreen := 255;
            vPalette.palPalEntry[1].peBlue  := 255;
            vPalette.palPalEntry[1].peFlags := 0;
          end;
        pf4Bit:
          with Header do
          begin
            vPalette.palNumEntries := 16;
            if paletteType = 2 then
            begin
              for vIndex := 0 to 15 do
              begin
                vPalette.palPalEntry[vIndex].peRed   := vIndex * 16;
                vPalette.palPalEntry[vIndex].peGreen := vIndex * 16;
                vPalette.palPalEntry[vIndex].peBlue  := vIndex * 16;
                vPalette.palPalEntry[vIndex].peFlags := 0;
              end;
            end
            else
            begin
              for vIndex := 0 to 15 do
              begin
                vPalette.palPalEntry[vIndex].peRed   := ColorMap[vIndex].R;
                vPalette.palPalEntry[vIndex].peGreen := ColorMap[vIndex].G;
                vPalette.palPalEntry[vIndex].peBlue  := ColorMap[vIndex].B;
                vPalette.palPalEntry[vIndex].peFlags := 0;
              end;
            end;
          end;
        pf8Bit:
          begin
            vPalette.palNumEntries := 256;
            vOldPos := Stream.Position;
            // 256 colors with 3 components plus one vMarker byte
            Stream.Position := Stream.Size - 769;
            Stream.Read(vMarker, 1);
            if vMarker <> $0C then
            begin
              // palette ID is wrong, perhaps gray scale?
              if Header.PaletteType = 2 then
              begin
                for vIndex := 0 to 255 do
                begin
                  vPalette.palPalEntry[vIndex].peRed   := vIndex;
                  vPalette.palPalEntry[vIndex].peGreen := vIndex;
                  vPalette.palPalEntry[vIndex].peBlue  := vIndex;
                  vPalette.palPalEntry[vIndex].peFlags := 0;
                end;
              end
              else
                Beep; // ignore palette
            end
            else
            begin
              Stream.Read(vPCXPalette[0], 768);
              for vIndex := 0 to 255 do
              begin
                vPalette.palPalEntry[vIndex].peRed   := vPCXPalette[vIndex].R;
                vPalette.palPalEntry[vIndex].peGreen := vPCXPalette[vIndex].G;
                vPalette.palPalEntry[vIndex].peBlue  := vPCXPalette[vIndex].B;
                vPalette.palPalEntry[vIndex].peFlags := 0;
              end;
            end;
            Stream.Position := vOldPos;
          end;
      end;
      vhPalette := CreatePalette(PLogPalette(@vPalette)^);
      if vhPalette <> 0 then
        Palette := vhPalette;
    end
    // version 2.8 without palette information, just use the system palette
    // 256 colors will not be correct with this assignment...
    else
      Palette := SystemPalette16;
  end;
var
  vPCXSize,
  vSize     : Cardinal;
  vDecodeBuffer,
  vRawBuffer: Pointer;
  vRun      : PByte;
  vPlane1,
  vPlane2,
  vPlane3,
  vPlane4   : PByte;
  vValue,
  vMask     : Byte;
  vDecoder  : TPCXRLE;
  vIndex,
  vIndex2   : Integer;
  vLine     : PByte;
  vIncrement: Cardinal;
begin
  Handle := 0;
  Stream.Read(Header, SizeOf(Header));
  vPCXSize := Stream.Size - Stream.Position;
  with Header do
  begin
    if not (FileID in [$0A, $CD]) then
      raise Exception.Create('PCX 또는 SCR 형식의 파일이 아닙니다.');

    case BitsPerPixel of
      1: // b&w or 16 colors
        case ColorPlanes of
          1: PixelFormat := pf1Bit;
          4: PixelFormat := pf4Bit;
        end;
      8: // 256 colors or true color
        case ColorPlanes of
          1: PixelFormat := pf8Bit;
          3: PixelFormat := pf24Bit;
        end;
    end;

    // if none of the above compbinations were found then we have a wrong pixel format here
    if PixelFormat = pfDevice then
      raise Exception.Create('PCX 픽셀 포맷이 잘못되었습니다.');
    // take 256 colors palette (plus an ID byte) into account
    if PixelFormat = pf8Bit then
      Dec(vPCXSize, 769);
    if PixelFormat <> pf24Bit then
      MakePalette;

    Width  := Header.XMax - Header.XMin + 1;
    Height := Header.YMax - Header.YMin + 1;

    // adjust alignment of vLine
    vIncrement := Header.ColorPlanes * Header.BytesPerLine;

    // buffer raw data
    GetMem(vRawBuffer, vPCXSize);
    Stream.ReadBuffer(vRawBuffer^, vPCXSize);
    if Encoding = 1 then
    begin
      vSize    := vIncrement * Cardinal(Height);
      GetMem(vDecodeBuffer, vSize);
      vDecoder := TPCXRLE.Create;
      vDecoder.Decode(vRawBuffer, vDecodeBuffer, vPCXSize, vSize);
      vDecoder.Free;
      FreeMem(vRawBuffer);
      vRawBuffer := vDecodeBuffer;
    end;
    vRun := vRawBuffer;

    for vIndex := 0 to Height - 1 do
    begin
      vLine := ScanLine[vIndex];
      case PixelFormat of
        pf1Bit: Move(vRun^, vLine^, Width div 8);
        pf8Bit: Move(vRun^, vLine^, Width);
        pf4Bit:
          begin
            // four bitplanes planes need to be combined
            vPlane1 := vRun;
            PChar(vPlane2) := PChar(vRun) + vIncrement div 4;
            PChar(vPlane3) := PChar(vRun) + 2 * (vIncrement div 4);
            PChar(vPlane4) := PChar(vRun) + 3 * (vIncrement div 4);
            // number of bytes to write
            vSize := vIncrement;
            vMask := 0;
            while vSize > 0 do
            begin
              vValue := 0;
              for vIndex2 := 0 to 1 do
              asm
                   MOV AL, [vValue]

                   MOV EDX, [vPlane4]             // take the 4 MSBs from the 4 runs and build a nibble
                   SHL BYTE PTR [EDX], 1         // read MSB and prepare next vRun at the same time
                   RCL AL, 1                     // MSB from previous shift is in CF -> move it to AL

                   MOV EDX, [vPlane3]             // now do the same with the other three runs
                   SHL BYTE PTR [EDX], 1
                   RCL AL, 1

                   MOV EDX, [vPlane2]
                   SHL BYTE PTR [EDX], 1
                   RCL AL, 1

                   MOV EDX, [vPlane1]
                   SHL BYTE PTR [EDX], 1
                   RCL AL, 1

                   MOV [vValue], AL
              end;
              vLine^ := vValue;
              Inc(vLine);
              Dec(vSize);

              // two runs above (to construct two nibbles -> one byte), now update marker
              // to know when to switch to next byte in the planes
              vMask := (vMask + 2) mod 8;
              if vMask = 0 then
              begin
                Inc(vPlane1);
                Inc(vPlane2);
                Inc(vPlane3);
                Inc(vPlane4);
              end;
            end;
          end;
        pf24Bit:
          begin
            // three planes of colors need to be combined
            vPlane1 := vRun;
            PChar(vPlane2) := PChar(vRun) + vIncrement div 3;
            PChar(vPlane3) := PChar(vRun) + 2 * (vIncrement div 3);
            vSize := Width;
            while vSize > 0 do
            begin
              vLine^ := vPlane3^; Inc(vLine); Inc(vPlane3);
              vLine^ := vPlane2^; Inc(vLine); Inc(vPlane2);
              vLine^ := vPlane1^; Inc(vLine); Inc(vPlane1);
              Dec(vSize);
            end;
          end;
      end;
      Inc(vRun, vIncrement);
    end;
    FreeMem(vRawBuffer);
  end;
end;
//------------------------------------------------------------------------------
// PCX 디코드
procedure TPCXRLE.Decode(var aSource: Pointer; aTarget: Pointer; aPackedSize, aUnpackedSize: Integer);
var
  vCount : Integer;
  vSource,
  vTarget: PByte;
begin
  vSource := aSource;
  vTarget := aTarget;
  while aUnpackedSize > 0 do
    if (vSource^ and $C0) = $C0 then
    begin
      vCount := vSource^ and $3F;
      Inc(vSource);
      if aUnpackedSize < vCount then
        vCount := aUnpackedSize;
      FillChar(vTarget^, vCount, vSource^);
      Inc(vSource);
      Inc(vTarget, vCount);
      Dec(aUnpackedSize, vCount);
    end
    else
    begin
      vTarget^ := vSource^;
      Inc(vSource);
      Inc(vTarget);
      Dec(aUnpackedSize);
    end;
end;

end.
