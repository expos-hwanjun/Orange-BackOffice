{*
 분류
   Number.NumberString - 분류가 지정됐을때 분류코드(지정되지 않았을때는 공백)
   Temp1 - 분류코드
   Temp2 - 분류별도 색상(없으면 분류기본색상)
   Temp3 - 블로킹(Y/N)


 메뉴
   Temp1 - 메뉴코드
   Temp2 - 메뉴별도 색상(없으면 분류기본색상)
   Temp3 - 블로킹(Y/N)
*}


unit HeadPLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  cxGroupBox, Vcl.Buttons, cxCurrencyEdit, cxCheckBox, StrUtils,
  JPEG, Vcl.StdCtrls, Vcl.Menus, cxButtons, IdTCPClient, IdGlobal, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, PosButton, Math, IdBaseComponent, IdComponent, IdTCPConnection,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, dxBarBuiltInMenu, AdvSmoothToggleButton, AdvPanel,
  AdvScrollBox, cxPC, cxImage, PNGImage, Vcl.ExtDlgs, dxGDIPlusClasses,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePager, AdvOfficePagerStylers;

  {이전다음 버튼 대상 분류, 메뉴}
type TSelectMode = ( smClass, smMenu, smMoveing, smMove);

type
  TKioskButtonList = record
    GroupBox       :TAdvPanel;
    MenuImage      :TcxImage;
    MenuCode       :String;
    MenuName       :TcxLabel;
    Price          :TcxLabel;
    SaveButton     :TAdvGlowButton;
    MenuBlock      :String;
    FileSize       :Integer;       //이미지화일 크기
  end;

type
  THeadPLUForm = class(TInheritGridEditForm)
    ConditionTollBarAutoSelectCheckBox: TcxCheckBox;
    ContitionToolBarMenuCheckBox: TcxCheckBox;
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    ConditonPLUComboBox: TcxComboBox;
    ColorPopupMenu: TPopupMenu;
    ColorChangeMenuItem: TMenuItem;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewKitchen: TcxGridColumn;
    Query1: TUniQuery;
    Panel1: TPanel;
    ClassComboBox: TcxComboBox;
    Label7: TLabel;
    Label8: TLabel;
    SearchConditionEdit: TcxTextEdit;
    Query2: TUniQuery;
    GridTableViewClassCode: TcxGridColumn;
    GridTableViewShortName: TcxGridColumn;
    EmptyMenuItem: TMenuItem;
    DeleteMenuItem: TMenuItem;
    Delete2MenuItem: TMenuItem;
    ColorDialog: TColorDialog;
    ColorCopyMenuItem: TMenuItem;
    ColorPasteMenuItem: TMenuItem;
    BlockingMenuItem: TMenuItem;
    SelectMenuNameLabel: TcxLabel;
    PluPageControl: TcxPageControl;
    PluTab: TcxTabSheet;
    KioskTab: TcxTabSheet;
    ClassHeaderPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    ClassNameEdit: TcxTextEdit;
    ClassPageEdit: TcxCurrencyEdit;
    ClassLineFeedButton: TAdvGlowButton;
    ClassMoveButton: TAdvGlowButton;
    ClassPanel: TPanel;
    MenuHeaderPanel: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MenuNameEdit: TcxTextEdit;
    MenuPageEdit: TcxCurrencyEdit;
    LineFeedButton: TAdvGlowButton;
    MenuPanel: TPanel;
    KioskPanel: TAdvScrollBox;
    KioskPLUMenuPanel: TAdvScrollBox;
    KioskPLUClassPanel: TAdvPanel;
    KioskClassPriorButton: TAdvSmoothToggleButton;
    KioskClassNextButton: TAdvSmoothToggleButton;
    KioskMenuNextButton: TAdvSmoothToggleButton;
    KioskMenuPriorButton: TAdvSmoothToggleButton;
    ImageCollection: TcxImageCollection;
    ImageCollectionItem3: TcxImageCollectionItem;
    PictureLoadDialog: TOpenPictureDialog;
    procedure FormShow(Sender: TObject);
    procedure MenuNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure ClassNameEditPropertiesChange(Sender: TObject);
    procedure ClassPanelClick(Sender: TObject);
    procedure MenuPanelClick(Sender: TObject);
    procedure LineFeedButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ClassMoveButtonClick(Sender: TObject);
    procedure ClassComboBoxPropertiesChange(Sender: TObject);
    procedure SearchConditionEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ClassLineFeedButtonClick(Sender: TObject);
    procedure EmptyMenuItemClick(Sender: TObject);
    procedure DeleteMenuItemClick(Sender: TObject);
    procedure Delete2MenuItemClick(Sender: TObject);
    procedure ColorPopupMenuPopup(Sender: TObject);
    procedure ColorChangeMenuItemClick(Sender: TObject);
    procedure ColorCopyMenuItemClick(Sender: TObject);
    procedure ColorPasteMenuItemClick(Sender: TObject);
    procedure BlockingMenuItemClick(Sender: TObject);
    procedure SelectMenuNameLabelClick(Sender: TObject);
    procedure GridTableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ConditonPLUComboBoxPropertiesChange(Sender: TObject);
    procedure KioskTabShow(Sender: TObject);
    procedure KioskClassPriorButtonClick(Sender: TObject);
  private
    DestStoreCode  :String;
    ClassDefaultColor,                       //기본설정값
    ClassBorderColor,
    ClassDefaultDownColor,
    MenuDefaultColor,
    MenuBorderColor :TColor;
    ClassDefaultFont,
    MenuDefaultFont : TFont;
    ClassDefaultDownFontColor :TColor;

    PluClassX,
    PluClassY      : Integer;
    PluClassData   : TList;
    PluClassButton :Array of TPosButton;

    PluMenuX,
    PluMenuY      :Integer;
    PluMenuData   : TList;
    PluMenuButton :Array of TPosButton;


    FSelectMode: TSelectMode;
    ClassButton :TPosButton;
    MenuButton  :TPosButton;
    ClassCodeList :TStringList;
    ColorClipboard : TColor;

    isDelete     :Boolean;
    ClassCode,
    MenuCode    :String;

    FGridSelect  :Boolean;
    isPageWork    :Boolean;
    FromPOS       :Integer;   //옮길위치

    LargeTable  :String;
    SmallTable  :String;

    KioskClassBlock,
    KioskClassCode :String;
    KioskConfig       :Array[1..17] of Integer;

    KioskClassTotalPage,
    KioskTotalPage,
    KioskMenuCount:Integer;

    KioskClassDownColor : TColor;
    KioskClassCount,
    FKioskClassPage: Integer;
    FKioskPage: Integer;

    KioskButtonList : Array of TKioskButtonList;

    procedure  GetDesign;
    procedure  SetGridMenu;
    procedure  SetPLUClass;                             //분류버튼을 설정한다
    procedure  SetPLUMenu(Sender: TObject);
    procedure  SaveClass;
    function   SaveMenu:Boolean;
    function   LineFeed(aValue:String):String;
    procedure  SaveColor;

    procedure  PluClassButtonCreate;
    procedure  PluClassButtonClick(Sender: TObject);
    procedure  PluClassPrevButtonClick(Sender :TObject);

    procedure  PluMenuButtonCreate;
    procedure  PluMenuButtonClick(Sender: TObject);
    procedure  PluMenuPrevButtonClick(Sender :TObject);
    procedure  PluMenuButtonClear;
    procedure  ShowPosMode;

    procedure  KioskClassPLUCreate;
    procedure  KioskMenuPLUCreate;
    procedure  SetKioskClassPage(AValue :Integer);
    procedure  SetKioskPage(AValue :Integer);
    procedure  KioskSetClassPLU;
    procedure  KioskSetMenuPLU;

    procedure  KioskClassClick(Sender: TObject);
    procedure  KioskMenuClick(Sender: TObject);
    procedure  SaveImageClick(Sender: TObject);

    property   KioskClassPage :Integer        read FKioskClassPage    write SetKioskClassPage;
    property   KioskPage :Integer             read FKioskPage         write SetKioskPage;

  protected
    function   DoSearch: Boolean; override;                      // 조회
    function   DoSave:Boolean;  override;
    procedure  SetSelectMode(AValue:TSelectMode);
    property   SelectMode :TSelectMode read FSelectMode write SetSelectMode;
    procedure  SetChanged(aChanged: Boolean); override;
    procedure  SetGridSelect(AValue:Boolean);
    property   GridSelect :Boolean read FGridSelect write SetGridSelect;
  end;

var
  HeadPLUForm: THeadPLUForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TCodePLUForm }
procedure THeadPLUForm.FormCreate(Sender: TObject);
begin
  inherited;
  ClassDefaultFont := TFont.Create;
  MenuDefaultFont  := TFont.Create;
  PluPageControl.ActivePageIndex := 0;
end;

procedure THeadPLUForm.FormShow(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if (GetChainHeadOption(2) = '0') then
    Exit;

  SetWorkStoreList;

  DestStoreCode := '';
  SetWorkStoreList;
  for vIndex := 0 to WorkStoreList.Count-1 do
  begin
    if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),Ifthen(Tag=0,2,6),1) = '0' then Continue;
    DestStoreCode := DestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);
  end;
  DestStoreCode := Format(' in (%s) ',[LeftStr(DestStoreCode, Length(DestStoreCode)-1)]);


  try
    DM.OpenQuery('select CD_CODE, '
                +'       NM_CODE1, '
                +'       NM_CODE2, '
                +'       NM_CODE3, '
                +'       NM_CODE4, '
                +'       NM_CODE5, '
                +'       NM_CODE6, '
                +'       NM_CODE7, '
                +'       NM_CODE8, '
                +'       NM_CODE9, '
                +'       NM_CODE10, '
                +'       NM_CODE11, '
                +'       NM_CODE12, '
                +'       NM_CODE13, '
                +'       NM_CODE14 '
                +'  from MS_CODE '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and CD_KIND  =''84'' ',
                [HeadStoreCode,
                 StandardStore]);
    while not DM.Query.Eof do
    begin
      vIndex := StoI(DM.Query.Fields[0].AsString);
      case vIndex of
        1 :
        begin
          KioskPanel.Width  := DM.Query.Fields[1].AsInteger;
          KioskPanel.Height := DM.Query.Fields[2].AsInteger;
          KioskConfig[2]    := StrToIntDef(DM.Query.Fields[3].AsString,3);     //분류PLU 갯수
          KioskConfig[3]    := StrToIntDef(DM.Query.Fields[4].AsString,4);     //메뉴PLU X
          KioskConfig[4]    := StrToIntDef(DM.Query.Fields[5].AsString,5);     //메뉴PLU Y
          KioskConfig[5]    := StrToIntDef(DM.Query.Fields[6].AsString,10);    //주문메뉴 표시갯수
          KioskConfig[6]    := StrToIntDef(DM.Query.Fields[7].AsString,0);     //PLU 한줄사용여부
          KioskConfig[7]    := StrToIntDef(DM.Query.Fields[8].AsString,0);     //영수증출력여부
          KioskConfig[8]    := StrToIntDef(DM.Query.Fields[9].AsString,0);     //PLU 단가표시
          KioskConfig[9]    := StrToIntDef(DM.Query.Fields[10].AsString,0);    //PLU 메뉴명표시
          KioskConfig[10]   := StrToIntDef(DM.Query.Fields[11].AsString,10);   //PLU 간격
          KioskConfig[11]   := StrToIntDef(DM.Query.Fields[12].AsString,0);    //메뉴명 정렬(0:L, 1:C, 2:R)
          KioskConfig[12]   := StrToIntDef(DM.Query.Fields[13].AsString,0);    //단가 정렬(0:L, 1:C, 2:R)
          KioskConfig[13]   := StrToIntDef(DM.Query.Fields[14].AsString,0);    //기능버튼 아이콘 정렬(0:L, 1:C, 2:R)

          KioskClassCount := Ifthen(KioskConfig[2]=0,1,KioskConfig[2]);
          KioskMenuCount  := KioskConfig[3] * KioskConfig[4];
          if KioskMenuCount = 0 then
            KioskMenuCount := 1;
        end;
        2 :
        begin
          KioskPLUClassPanel.Left                      := 6;
          KioskPLUClassPanel.Top                       := 5;
          KioskPLUClassPanel.Tag                       := StoI(DM.Query.Fields[2].AsString);
          KioskPLUClassPanel.Width                     := StoI(DM.Query.Fields[3].AsString);
          KioskPLUClassPanel.Height                    := StoI(DM.Query.Fields[4].AsString);
          KioskPLUClassPanel.Visible                   := DM.Query.Fields[5].AsString = '0';
          KioskPLUClassPanel.Font.Name                 := DM.Query.Fields[6].AsString;
          KioskPLUClassPanel.Font.Color                := StringToColorDef(DM.Query.Fields[7].AsString, $004D9900);
          KioskPLUClassPanel.Font.Size                 := StoI(DM.Query.Fields[8].AsString);
          KioskPLUClassPanel.Color                     := StringToColorDef(DM.Query.Fields[9].AsString,  $004D9900);
          KioskClassDownColor                          := StringToColorDef(DM.Query.Fields[10].AsString, $004D9900);
          if GetHeadOption(458) = '1' then  //blue
          begin
            KioskPLUClassPanel.StatusBar.Color        := clWhite;
            KioskPLUClassPanel.StatusBar.ColorTo      := $00D26900;
            KioskPLUClassPanel.Font.Color             := clBlack;
            KioskPLUClassPanel.CollapsColor           := clWhite;
          end
          else if GetHeadOption(458) = '2' then  //Black
          begin
            KioskPLUClassPanel.StatusBar.Color        := clWhite;
            KioskPLUClassPanel.StatusBar.ColorTo      := clBlack;
            KioskPLUClassPanel.Font.Color             := clBlack;
            KioskPLUClassPanel.CollapsColor           := clWhite;
          end
          else if GetHeadOption(458) = '3' then  //Black
          begin
            KioskPLUClassPanel.StatusBar.Color        := clWhite;
            KioskPLUClassPanel.StatusBar.ColorTo      := $000000CC;
            KioskPLUClassPanel.Font.Color             := clBlack;
            KioskPLUClassPanel.CollapsColor           := clWhite;
          end;
        end;
        3 :
        begin
          KioskPLUMenuPanel.Left                       := 6;
          KioskPLUMenuPanel.Top                        := KioskPLUClassPanel.Height + 10;
          KioskPLUMenuPanel.Width                      := StoI(DM.Query.Fields[3].AsString);
          KioskPLUMenuPanel.Height                     := StoI(DM.Query.Fields[4].AsString);
          KioskPLUMenuPanel.Visible                    := DM.Query.Fields[5].AsString = '0';
          KioskConfig[16]                              := KioskPLUMenuPanel.Width;
          KioskConfig[17]                              := KioskPLUMenuPanel.Height;
          KioskPLUMenuPanel.Font.Name                  := DM.Query.Fields[6].AsString;
          KioskPLUMenuPanel.Font.Color                 := StringToColorDef(DM.Query.Fields[7].AsString, $004D9900);
          KioskPLUMenuPanel.Font.Size                  := StoI(DM.Query.Fields[8].AsString);
          if DM.Query.Fields[12].AsString  = '1' then
            KioskPLUMenuPanel.Font.Style                 := [fsBold]
          else
            KioskPLUMenuPanel.Font.Style                 := [];
        end;
        14 : //메뉴 《
        begin
          KioskMenuPriorButton.Left                := StoI(DM.Query.Fields[1].AsString);
          KioskMenuPriorButton.Top                 := StoI(DM.Query.Fields[2].AsString);
          KioskMenuPriorButton.Width               := StoI(DM.Query.Fields[3].AsString);
          KioskMenuPriorButton.Height              := StoI(DM.Query.Fields[4].AsString);
          KioskMenuPriorButton.Visible             := DM.Query.Fields[5].AsString = '0';
          KioskMenuPriorButton.Top                 := KioskPLUMenuPanel.Top + KioskPLUMenuPanel.Height + 5;
          KioskMenuPriorButton.OnClick             := KioskClassPriorButtonClick;

          if GetHeadOption(458) = '0' then
          begin
            KioskMenuPriorButton.BorderColor               := KioskMenuPriorButton.Color;
            KioskMenuPriorButton.BorderInnerColor          := KioskMenuPriorButton.Color;
            KioskMenuPriorButton.Appearance.Font.Color     := StringToColorDef(DM.Query.FieldByName('NM_CODE7').AsString, $004D9900);
          end
          else if GetHeadOption(458) = '1' then  //blue
          begin
            KioskMenuPriorButton.BorderColor               := $00D26900;
            KioskMenuPriorButton.BorderInnerColor          := clWhite;
            KioskMenuPriorButton.ColorDisabled             := clWhite;
            KioskMenuPriorButton.Appearance.Font.Color     := $00D26900;
          end
          else if GetHeadOption(458) = '2' then  //Black
          begin
            KioskMenuPriorButton.BorderColor               := clBlack;
            KioskMenuPriorButton.BorderInnerColor          := clWhite;
            KioskMenuPriorButton.ColorDisabled             := clWhite;
            KioskMenuPriorButton.Appearance.Font.Color     := clBlack;
          end
          else if GetHeadOption(458) = '3' then  //Red
          begin
            KioskMenuPriorButton.BorderColor               := $000000CC;
            KioskMenuPriorButton.BorderInnerColor          := clWhite;
            KioskMenuPriorButton.Appearance.Font.Color     := $000000CC;
            KioskMenuPriorButton.ColorDisabled             := clWhite;
          end;
        end;
        15 : //메뉴 《
        begin
          KioskMenuNextButton.Left                := StoI(DM.Query.Fields[1].AsString);
          KioskMenuNextButton.Top                 := StoI(DM.Query.Fields[2].AsString);
          KioskMenuNextButton.Width               := StoI(DM.Query.Fields[3].AsString);
          KioskMenuNextButton.Height              := StoI(DM.Query.Fields[4].AsString);
          KioskMenuNextButton.Visible             := DM.Query.Fields[5].AsString = '0';
          KioskMenuNextButton.Top                 := KioskPLUMenuPanel.Top + KioskPLUMenuPanel.Height + 5;
          KioskMenuNextButton.OnClick             := KioskClassPriorButtonClick;
          if GetHeadOption(458) = '0' then
          begin
            KioskMenuNextButton.BorderColor               := KioskMenuNextButton.Color;
            KioskMenuNextButton.BorderInnerColor          := KioskMenuNextButton.Color;
            KioskMenuNextButton.Appearance.Font.Color     := StringToColorDef(DM.Query.FieldByName('NM_CODE7').AsString, $004D9900);
            KioskMenuNextButton.ColorDisabled             := clWhite;
          end
          else if GetHeadOption(458) = '1' then  //blue
          begin
            KioskMenuNextButton.BorderColor               := $00D26900;
            KioskMenuNextButton.BorderInnerColor          := clWhite;
            KioskMenuNextButton.ColorDisabled             := clWhite;
            KioskMenuNextButton.Appearance.Font.Color     := $00D26900;
          end
          else if GetHeadOption(458) = '2' then  //Black
          begin
            KioskMenuNextButton.BorderColor               := clBlack;
            KioskMenuNextButton.BorderInnerColor          := clWhite;
            KioskMenuNextButton.ColorDisabled             := clWhite;
            KioskMenuNextButton.Appearance.Font.Color     := clBlack;
          end
          else if GetHeadOption(458) = '3' then  //Red
          begin
            KioskMenuNextButton.BorderColor               := $000000CC;
            KioskMenuNextButton.BorderInnerColor          := clWhite;
            KioskMenuNextButton.ColorDisabled             := clWhite;
            KioskMenuNextButton.Appearance.Font.Color     := $000000CC;
          end;

        end;
         17 : //분류 《
        begin
          KioskClassPriorButton.Left               := 6;
          KioskClassPriorButton.Top                := 5;
          KioskClassPriorButton.Height             := KioskPLUClassPanel.Height;
          KioskClassPriorButton.Width              := StoI(DM.Query.Fields[3].AsString);
          KioskClassPriorButton.Visible            := DM.Query.FieldByName('NM_CODE5').AsString = '0';
          KioskClassPriorButton.Appearance.Font.Name  := DM.Query.FieldByName('NM_CODE6').AsString;
          KioskClassPriorButton.Appearance.Font.Size  := StoI(DM.Query.FieldByName('NM_CODE8').AsString);

          if GetHeadOption(458) = '0' then
          begin
            KioskClassPriorButton.BorderColor               := KioskClassPriorButton.Color;
            KioskClassPriorButton.BorderInnerColor          := KioskClassPriorButton.Color;
            KioskClassPriorButton.Appearance.Font.Color     := StringToColorDef(DM.Query.FieldByName('NM_CODE7').AsString, $004D9900);
          end
          else if GetHeadOption(458) = '1' then  //blue
          begin
            KioskClassPriorButton.BorderColor               := $00D26900;
            KioskClassPriorButton.BorderInnerColor          := clWhite;
            KioskClassPriorButton.Appearance.Font.Color     := $00D26900;
            KioskClassPriorButton.ColorDisabled             := clWhite;
          end
          else if GetHeadOption(458) = '2' then  //Black
          begin
            KioskClassPriorButton.BorderColor               := clBlack;
            KioskClassPriorButton.BorderInnerColor          := clWhite;
            KioskClassPriorButton.Appearance.Font.Color     := clBlack;
            KioskClassPriorButton.ColorDisabled             := clWhite;
          end
          else if GetHeadOption(458) = '3' then  //Red
          begin
            KioskClassPriorButton.BorderColor               := $000000CC;
            KioskClassPriorButton.BorderInnerColor          := clWhite;
            KioskClassPriorButton.Appearance.Font.Color     := $000000CC;
            KioskClassPriorButton.ColorDisabled             := clWhite;
          end;
        end;
        18 : //분류 >
        begin
          KioskClassNextButton.Left               := KioskClassPriorButton.Left + KioskClassPriorButton.Width + 3;
          KioskClassNextButton.Top                := 5;
          KioskClassNextButton.Height             := KioskPLUClassPanel.Height;
          KioskClassNextButton.Width              := StoI(DM.Query.Fields[3].AsString);
          KioskClassNextButton.Visible            := DM.Query.FieldByName('NM_CODE5').AsString = '0';
          KioskClassNextButton.Appearance.Font.Name   := DM.Query.FieldByName('NM_CODE6').AsString;
          KioskClassNextButton.Appearance.Font.Size   := StoI(DM.Query.FieldByName('NM_CODE8').AsString);
          if GetHeadOption(458) = '0' then
          begin
            KioskClassNextButton.Appearance.Font.Color     := StringToColorDef(DM.Query.FieldByName('NM_CODE7').AsString, $004D9900);
            KioskClassNextButton.BorderColor               := KioskClassNextButton.Color;
            KioskClassNextButton.BorderInnerColor          := KioskClassNextButton.Color;
          end
          else if GetHeadOption(458) = '1' then  //blue
          begin
            KioskClassNextButton.BorderColor               := $00D26900;
            KioskClassNextButton.BorderInnerColor          := clWhite;
            KioskClassNextButton.Appearance.Font.Color     := $00D26900;
            KioskClassNextButton.ColorDisabled             := clWhite;
          end
          else if GetHeadOption(458) = '2' then  //Black
          begin
            KioskClassNextButton.BorderColor               := clBlack;
            KioskClassNextButton.BorderInnerColor          := clWhite;
            KioskClassNextButton.Appearance.Font.Color     := clBlack;
            KioskClassNextButton.ColorDisabled             := clWhite;
          end
          else if GetHeadOption(458) = '3' then  //Red
          begin
            KioskClassNextButton.BorderColor               := $000000CC;
            KioskClassNextButton.BorderInnerColor          := clWhite;
            KioskClassNextButton.Appearance.Font.Color     := $000000CC;
            KioskClassNextButton.ColorDisabled             := clWhite;
          end;
        end;
      end;
      DM.Query.Next;
    end;
  finally
    DM.FinishQuery;
  end;

  KioskClassCount := Ifthen(KioskConfig[2]=0,1,KioskConfig[2]);
  KioskMenuCount  := KioskConfig[3] * KioskConfig[4];

  DM.OpenQuery('select Max(NO_POSITION) '
              +'  from MS_KIOSK_LARGE '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE	=:P1 '
              +'	 and CD_GUBUN	=:P2 ',
              [HeadStoreCode,
               StandardStore,
               '01']);
  if not DM.Query.Eof then
  begin
    KioskClassTotalPage := DM.Query.Fields[0].AsInteger div KioskClassCount;
    if DM.Query.Fields[0].AsInteger mod KioskClassCount > 0 then
      KioskClassTotalPage := KioskClassTotalPage + 1;
    DM.Query.Close;
  end;

  if KioskClassPriorButton.Visible then
    KioskPLUClassPanel.Left := KioskClassPriorButton.Width + 3;


  KioskClassPLUCreate;
  KioskMenuPLUCreate;
  GetDesign;
  KioskClassPage := 1;
  if KioskMenuCount = 0 then
    KioskMenuCount := 1;

  DoSearch;
end;

procedure THeadPLUForm.GetDesign;
  procedure ButtonFree;
  var vIndex :Integer;
  label go;
  begin
    go:
    for vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and
         ( ((Components[vIndex] as TPosButton).Parent = ClassPanel )
          or ((Components[vIndex] as TPosButton).Parent = MenuPanel ) ) then
      begin
        (Components[vIndex] as TPosButton).Free;
        Goto go;
      end;
    end;
  end;
var
  vClassCode: PStrPointer;
  vIndex    : Integer;
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
              StandardStore]);
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
        MenuHeaderPanel.Top       := ClassPanel.Top + ClassPanel.Height + 10;
        MenuPanel.Top             := MenuHeaderPanel.Top + MenuHeaderPanel.Height + 10;
        MenuPanel.Width           := ClassPanel.Width;
        ClassHeaderPanel.Width    := ClassPanel.Width;
        MenuHeaderPanel.Width     := ClassPanel.Width;
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



  case Tag of
    0 :
    begin
      LargeTable := 'MS_LARGE';
      SmallTable := 'MS_SMALL';
    end;
    1 :
    begin
      LargeTable := 'MS_KIOSK_LARGE';
      SmallTable := 'MS_KIOSK_SMALL';

      OpenQuery('select NM_CODE3, '
               +'       NM_CODE4, '
               +'       NM_CODE5 '
               +'  from MS_CODE '
               +' where CD_HEAD  = :P0 '
               +'   and CD_STORE = :P1 '
               +'   and CD_KIND  = ''84'' '
               +' order by CD_CODE ',
               [HeadStoreCode,
                StandardStore]);
      if not Query.Eof then
      begin
        PluClassX   := StrToIntDef(Query.FieldByName('NM_CODE3').AsString,5);
        PluClassY   := 1;
        PluMenuX    := StrToIntDef(Query.FieldByName('NM_CODE4').AsString,5);
        PluMenuY    := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,5);
      end;
      Query.Close;
    end;
  end;
  OpenQuery('select CD_CLASS, '
           +'       NM_CLASS '
           +'  from MS_MENU_CLASS '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and Length(CD_CLASS) = 2 '
           +' order by CD_CLASS',
            [HeadStoreCode,
             StandardStore]);
  try
    New(vClassCode);
    vClassCode^.Data := '%';
    ClassComboBox.Properties.Items.AddObject('전체', TObject(vClassCode));

    while not Query.Eof do
    begin
      New(vClassCode);
      vClassCode^.Data := Query.Fields[0].AsString+'%';
      ClassComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vClassCode));
      Query.Next;
    end;
  finally
    Query.Close;
    ClassComboBox.ItemIndex := 0;
    MainPanel.Enabled := false;
  end;


  GridSelect    := false;
  isPageWork    := false;
  if not Assigned(ClassCodeList) then
    ClassCodeList := TStringList.Create;

  ButtonFree;
  PluClassButtonCreate;
  PluMenuButtonCreate;
end;

procedure THeadPLUForm.GridTableViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var vIndex :Integer;
begin
  inherited;
  for vIndex := Low(PluMenuButton) to High(PluMenuButton) do
    PluMenuButton[vIndex].Enabled := true;

  GridSelect := true;
end;


procedure THeadPLUForm.ColorChangeMenuItemClick(Sender: TObject);
var vPosition :Integer;
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
  begin
    TPosButton(ColorPopupMenu.PopupComponent).Color := ColorDialog.Color;
    TPosButton(ColorPopupMenu.PopupComponent).Temp2 := ColorToString(ColorDialog.Color);
  end;
  SaveColor;
end;

function THeadPLUForm.DoSearch: Boolean;
begin
  if (GetChainHeadOption(2) = '0') then
  begin
    MsgBox('표준메뉴를 사용하는 매장만 사용할 수 있습니다');
    Exit;
  end;

  ClassPageEdit.Value := 1;
  SetPLUClass;
  PluClassButtonClick(TPosButton(FindComponent('ClassButton0')));
  SetGridMenu;
  Result := true;
  GridSelect := false;
end;

procedure THeadPLUForm.EmptyMenuItemClick(Sender: TObject);
var vPosition :Integer;
begin
  inherited;
  if ClassButton <> nil then
  begin
    vPosition := (MenuPageEdit.EditValue-1) * ((PluMenuX * PluMenuY)-1) + TPosButton(ColorPopupMenu.PopupComponent).Tag + 1;

    try
      ExecQuery('update '+SmallTable
               +'   set NO_POSITION = NO_POSITION + 1 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_GUBUN =:P1 '
               +'   and CD_LARGE =:P2 '
               +'   and NO_POSITION >= :P3 '
               +' order by NO_POSITION desc; ',
               [HeadStoreCode,
                ConditonPLUComboBox.Text,
                ClassCode,
                vPosition]);
      SetPLUMenu(ClassButton);
    except
      on E: Exception do begin
      ErrBox(E.Message);
      end;
    end;
  end;
end;

procedure THeadPLUForm.BlockingMenuItemClick(Sender: TObject);
begin
  inherited;
  if Copy(TPosButton(ColorPopupMenu.PopupComponent).Name, 1, 11) = 'ClassButton' then
  begin
    TPosButton(ColorPopupMenu.PopupComponent).Number.NumberString := TPosButton(ColorPopupMenu.PopupComponent).Temp1;
    TPosButton(ColorPopupMenu.PopupComponent).Caption := '[블로킹]';
    TPosButton(ColorPopupMenu.PopupComponent).Temp3   := 'Y';
    ClassButton := TPosButton(ColorPopupMenu.PopupComponent);
    ClassCode := (ClassButton as TPosButton).Temp1;
    SaveClass;
  end
  else
  begin
    TPosButton(ColorPopupMenu.PopupComponent).Caption := '[블로킹]';
    TPosButton(ColorPopupMenu.PopupComponent).Temp3   := 'Y';
    MenuButton := TPosButton(ColorPopupMenu.PopupComponent);
    SaveMenu;
  end;
end;

procedure THeadPLUForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var vCode: String;
    vIndex,
    vPosition  : Integer;
begin
  inherited;
  vCode      := (ClassButton as TPosButton).Temp1;
  case SelectMode of
    smClass :
      begin
        if not AskBox('분류를 삭제하겠습니까?') then Exit;
        if not AskBox('하위메뉴도 같이 삭제됩니다'+#13+'삭제하시겠습니까?')  then Exit;

        ExecQuery('delete from '+LargeTable
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_GUBUN =:P1 '
                 +'   and CD_LARGE =:P2; '
                 +'delete from '+SmallTable
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_GUBUN =:P1 '
                 +'   and CD_LARGE =:P2; ',
                 [HeadStoreCode,
                  ConditonPLUComboBox.Text,
                  vCode],true);

        SetPLUClass;
        SetGridMenu;
        isDelete := ClassNameEdit.Text <> '';
      end;
    smMenu :
      begin
        vPosition := (MenuPageEdit.EditValue-1) * ((PluMenuX * PluMenuY)-1) + (MenuButton as TPosButton).Tag + 1;

        if not AskBox('PLU 메뉴를 삭제하겠습니까?') then Exit;

        ExecQuery('delete from '+SmallTable
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_GUBUN =:P1 '
                 +'   and CD_LARGE =:P2 '
                 +'   and NO_POSITION  =:P3; ',
                 [HeadStoreCode,
                  ConditonPLUComboBox.Text,
                  vCode,
                  vPosition],true);

        SetPLUMenu(ClassButton);
        SetGridMenu;
        isDelete := MenuNameEdit.Text <> '';
        GridSelect := false;
      end;
  end;
end;

procedure THeadPLUForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  GetDesign;
  inherited;
end;

procedure THeadPLUForm.ClassComboBoxPropertiesChange(Sender: TObject);
begin
  inherited;
  SetGridMenu;
end;

procedure THeadPLUForm.ClassLineFeedButtonClick(Sender: TObject);
begin
  inherited;
  if ClassNameEdit.Enabled and (ClassNameEdit.SelStart > 1) then
  begin
    ClassNameEdit.Text := Copy(ClassNameEdit.Text,1,ClassNameEdit.SelStart)+'|'+Copy(ClassNameEdit.Text,ClassNameEdit.SelStart+1, Length(ClassNameEdit.Text)-ClassNameEdit.SelStart);
    (ClassButton as TPosButton).Temp10  := ClassNameEdit.Text;
    (ClassButton as TPosButton).Caption := LineFeed(ClassNameEdit.Text);
    SaveClass;
  end;
end;

procedure THeadPLUForm.ClassMoveButtonClick(Sender: TObject);
begin
  inherited;
  if (ClassCode <> EmptyStr) and (SelectMode = smClass) and (SelectMode <> smMove) then
  begin
    if ClassPageEdit.EditValue = 1 then
      FromPos := (ClassButton as TPosButton).Tag + 1
    else
      FromPos    := ((ClassPageEdit.EditValue-1) * PluClassX * PluClassY) +  (ClassButton as TPosButton).Tag;
    SelectMode := smMove;
    SetPLUClass;
    ShowMsg('[위치이동] PLU 위치를 선택하세요', false, 5);
  end
  else
  begin
    ShowMsg('[위치이동] 작업이 취소되었습니다', false, 5);
    SelectMode := smClass;
    Exit;
    ClassCode := (ClassButton as TPosButton).Temp1;
    SetPLUClass;
    (ClassButton as TPosButton).Color      := ClassDefaultDownColor;
    (ClassButton as TPosButton).Font.Color := ClassDefaultDownFontColor;
  end;
end;

procedure THeadPLUForm.ClassNameEditPropertiesChange(Sender: TObject);
begin
  inherited;
  isChanged := true;
end;

procedure THeadPLUForm.ClassPanelClick(Sender: TObject);
begin
  inherited;
  SelectMode := smClass;
end;

procedure THeadPLUForm.ColorCopyMenuItemClick(Sender: TObject);
begin
  inherited;
  ColorClipboard := (ColorPopupMenu.PopupComponent as TPosButton).Color;
end;

procedure THeadPLUForm.ColorPasteMenuItemClick(Sender: TObject);
begin
  inherited;
  (ColorPopupMenu.PopupComponent as TPosButton).Color := ColorClipboard;
  SaveColor;
end;

procedure THeadPLUForm.ColorPopupMenuPopup(Sender: TObject);
begin
  inherited;
  EmptyMenuItem.Visible       := Copy(TPosButton(ColorPopupMenu.PopupComponent).Name, 1, 11) <> 'ClassButton';
  Delete2MenuItem.Visible     := Copy(TPosButton(ColorPopupMenu.PopupComponent).Name, 1, 11) <> 'ClassButton';
  DeleteMenuItem.Enabled      := true;
  if Copy(TPosButton(ColorPopupMenu.PopupComponent).Name, 1, 11) = 'ClassButton' then
    BlockingMenuItem.Enabled    := TPosButton(ColorPopupMenu.PopupComponent).Number.NumberString = ''
  else
    BlockingMenuItem.Enabled    := TPosButton(ColorPopupMenu.PopupComponent).Temp1 = '';

  ColorChangeMenuItem.Enabled := (TPosButton(ColorPopupMenu.PopupComponent).Temp3 = 'N') = (Tag < 2);
  ColorCopyMenuItem.Enabled   := ColorChangeMenuItem.Enabled;
  ColorPasteMenuItem.Enabled  := ColorChangeMenuItem.Enabled;
end;

procedure THeadPLUForm.ConditonPLUComboBoxPropertiesChange(Sender: TObject);
begin
  inherited;
  GetDesign;
  DoSearch;
end;

procedure THeadPLUForm.Delete2MenuItemClick(Sender: TObject);
var vIndex, vPosition :Integer;
begin
  inherited;
  if ClassButton <> nil then
  begin
     vPosition := (MenuPageEdit.EditValue-1) * ((PluMenuX * PluMenuY)-1) + TPosButton(ColorPopupMenu.PopupComponent).Tag + 1;

    try
      ExecQuery('delete from '+SmallTable
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_GUBUN =:P1 '
               +'   and CD_LARGE =:P2 '
               +'   and NO_POSITION = :P3; ',
               [HeadStoreCode,
                ConditonPLUComboBox.Text,
                ClassCode,
                vPosition], false);

      ExecQuery('update '+SmallTable
               +'   set NO_POSITION = NO_POSITION - 1 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE '+DestStoreCode
               +'   and CD_GUBUN =:P1 '
               +'   and CD_LARGE =:P2 '
               +'   and NO_POSITION > :P3; ',
               [HeadStoreCode,
                ConditonPLUComboBox.Text,
                ClassCode,
                vPosition], true);
      SetPLUMenu(ClassButton);
    except
      on E: Exception do begin
      ErrBox(E.Message);
      end;
    end;
  end;
end;

procedure THeadPLUForm.DeleteMenuItemClick(Sender: TObject);
begin
  inherited;
  if Copy(TPosButton(ColorPopupMenu.PopupComponent).Name, 1, 11) = 'ClassButton' then
  begin
    ClassButton := TPosButton(ColorPopupMenu.PopupComponent);
    SelectMode := smClass;
    ButtonToolBarDeleteButtonClick(ClassButton);
  end
  else
  begin
    MenuButton := TPosButton(ColorPopupMenu.PopupComponent);
    SelectMode := smMenu;
    ButtonToolBarDeleteButtonClick(MenuButton);
  end;
end;

function THeadPLUForm.DoSave: Boolean;
begin
  case SelectMode of
    smClass : SaveClass;
    smMenu  : SaveMenu;
  end;
end;

procedure THeadPLUForm.LineFeedButtonClick(Sender: TObject);
begin
  inherited;
  if MenuNameEdit.Enabled and (MenuNameEdit.SelStart > 1) then
  begin
    MenuNameEdit.Text := Copy(MenuNameEdit.Text,1,MenuNameEdit.SelStart)+'|'+Copy(MenuNameEdit.Text,MenuNameEdit.SelStart+1, Length(MenuNameEdit.Text)-MenuNameEdit.SelStart);
    (MenuButton as TPosButton).Temp10  := MenuNameEdit.Text;
    (MenuButton as TPosButton).Caption := LineFeed(MenuNameEdit.Text);

    SaveMenu;
  end;
end;

procedure THeadPLUForm.MenuNameEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key <> #13 then Exit;

  if Sender = MenuNameEdit then
  begin
    (MenuButton as TPosButton).Caption            := LineFeed(MenuNameEdit.Text);
    SaveMenu;
  end
  else
  begin
    (ClassButton as TPosButton).Caption             := LineFeed(ClassNameEdit.Text);
    (ClassButton as TPosButton).Number.NumberString := (ClassButton as TPosButton).Temp1;
    SaveClass;
  end;
end;

procedure THeadPLUForm.MenuPanelClick(Sender: TObject);
begin
  inherited;
  SelectMode := smMenu;
end;

procedure THeadPLUForm.PluClassButtonCreate;
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
        Left        := (vX * vWidth);// + (vX * 2);
        Top         := (vY * vHeight) + (vY * 2);
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

procedure THeadPLUForm.PluClassButtonClick(Sender: TObject);
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
      if (PluClassButton[I].Temp2 <> '') and (Tag = 0) then
        PluClassButton[I].Color := StringToColor(PluClassButton[I].Temp2)
      else
        PluClassButton[I].Color      := ClassDefaultColor;
      PluClassButton[I].Font       := ClassDefaultFont
    end;

    (Sender as TPosButton).Color      := ClassDefaultDownColor;
    (Sender as TPosButton).Font.Color := ClassDefaultDownFontColor;

    case SelectMode of
      smMoveing :
      begin
        SelectMode := smMove;
        Exit;
      end;
      smMove :
      begin
        if isPageWork then Exit;
        Screen.Cursor := crHourGlass;
        Self.Enabled  := false;

        vPos       := FromPOS;
        if ClassPageEdit.EditValue = 1 then
          vPos1 := (Sender as TPosButton).Tag + 1
        else
          vPos1      := (ClassPageEdit.EditValue-1) * (PluClassX * PluClassY) + (Sender as TPosButton).Tag;
        vFromCode  := ClassCode;
        vToCode    := (Sender as TPosButton).Temp1;

        if vFromCode = vToCode then
        begin
          SelectMode := smClass;
          Exit;
        end;

        TempSQL := '';
        ExecQuery('delete from '+LargeTable
                 +' where CD_HEAD     =:P0 '
                 +'   and CD_STORE    '+DestStoreCode
                 +'   and CD_GUBUN    =:P1 '
                 +'   and CD_LARGE    =:P2; ',
                 [HeadStoreCode,
                  ConditonPLUComboBox.Text,
                  vToCode],false);

        ExecQuery('update '+LargeTable
                 +'   set CD_LARGE    =:P3, '
                 +'       NO_POSITION =:P4 '
                 +' where CD_HEAD     =:P0 '
                 +'   and CD_STORE    '+DestStoreCode
                 +'   and CD_GUBUN    =:P1 '
                 +'   and CD_LARGE    =:P2; ',
                 [HeadStoreCode,
                  ConditonPLUComboBox.Text,
                  vFromCode,
                  vToCode,
                  vPos1],false);

        ExecQuery('delete from '+SmallTable
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE '+DestStoreCode
                 +'   and CD_GUBUN =:P1 '
                 +'   and CD_LARGE =:P2; ',
                 [HeadStoreCode,
                  ConditonPLUComboBox.Text,
                  vToCode],false);

        if not ExecQuery('update '+SmallTable
                        +'   set CD_LARGE    =:P3 '
                        +' where CD_HEAD     =:P0 '
                        +'   and CD_STORE    '+DestStoreCode
                        +'   and CD_GUBUN    =:P1 '
                        +'   and CD_LARGE    =:P2; ',
                        [HeadStoreCode,
                         ConditonPLUComboBox.Text,
                         vFromCode,
                         vToCode],true) then Exit;

        ClassButton.Color := ClassDefaultColor;
        ClassButton.Temp2 := '';
        ShowMsg('', false, 1);
        SelectMode := smClass;
        SetPLUClass;
        PluClassButtonClick(Sender as TPosButton);
        Exit;
      end;
      else ClassButton := Sender as TPosButton;
    end;

    ClassCode  := (ClassButton as TPosButton).Temp1;
    For I := Low(PluClassButton) to High(PluClassButton) do
      PluClassButton[I].Enabled := True;

    ClassNameEdit.Text := (Sender as TPosButton).Caption;

    //PLU 메뉴버튼을 셋팅한다
    MenuPageEdit.Value := 1;
    TPosButton(FindComponent('MenuPrevButton')).Enabled := false;
    SetPLUMenu(Sender);

  //  if ClassNameEdit.Enabled then ClassNameEdit.SetFocus;
    MenuPanel.Enabled := ((ClassButton as TPosButton).Number.NumberString <> '') and ((ClassButton as TPosButton).Temp3 = 'N');
    isDelete          := (ClassButton as TPosButton).Number.NumberString <> '';
    SelectMode := smClass;
    isDelete   := True;
    isChanged  := false;
  finally
    Screen.Cursor := crDefault;
    Self.Enabled  := true;
  end;
end;

procedure THeadPLUForm.PluClassPrevButtonClick(Sender: TObject);
var vIndex, vBegin :Integer;
begin
  if Sender = TPosButton(FindComponent('ClassNextButton'))  then
    ClassPageEdit.Value := ClassPageEdit.Value + 1
  else ClassPageEdit.Value := ClassPageEdit.Value - 1;

  TPosButton(FindComponent('ClassPrevButton')).Enabled     := ClassPageEdit.Value > 1 ;

  isPageWork := true;
  ClassButton := TPosButton(FindComponent('ClassButton0'));
  SetPLUClass;
  PluClassButtonClick(TPosButton(FindComponent('ClassButton0')));
  isPageWork := false;
end;

procedure THeadPLUForm.PluMenuButtonCreate;
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
        Left        := (vX * vWidth);// + (vX * 2);
        Top         := (vY * vHeight) + (vY * 2);
        Caption     := EmptyStr;
        Color       := MenuDefaultColor;
        BorderColor := MenuBorderColor;
        BorderStyle := pbsSingle;
        BorderInnerColor := clNone;
        Font        := MenuDefaultFont;
        Font.Style  := [fsBold];
        if GetHeadOption(247) = '1' then      // 메뉴번호 기능을 사용합니다.
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

procedure THeadPLUForm.PluMenuButtonClear;
var vIndex :Integer;
begin
  for vIndex := Low(PluMenuButton) to High(PluMenuButton) do
  begin
    PluMenuButton[vIndex].Number.NumberString := EmptyStr;
    PluMenuButton[vIndex].Enabled             := True;
    PluMenuButton[vIndex].Caption             := IntToStr(PluMenuButton[vIndex].Tag+1);
    PluMenuButton[vIndex].Color               := MenuDefaultColor;
    PluMenuButton[vIndex].BorderColor         := MenuBorderColor;
    PluMenuButton[vIndex].Temp1               := '';
    PluMenuButton[vIndex].Temp2               := '';
    PluMenuButton[vIndex].Temp3               := 'N';
    PluMenuButton[vIndex].Bottom.RightString  := '';
    PluMenuButton[vIndex].Bottom.LeftString   := '';
    PluMenuButton[vIndex].Number.RightString  := '';
  end;
end;

procedure THeadPLUForm.PluMenuButtonClick(Sender: TObject);
  function CheckBefSelected:Boolean;
  var vIndex :Integer;
  begin
    Result := False;
    For vIndex := Low(PluMenuButton) to High(PluMenuButton) do
    if PluMenuButton[vIndex].Enabled = True then
    begin
      Result := True;
      Break;
    end;
  end;
var vBeforeRow :Integer;
begin
  inherited;
  (Sender as TPosButton).BorderColor := clRed;
  if MenuButton <> nil then
    MenuButton.BorderColor := MenuBorderColor;
  MenuButton := (Sender as TPosButton);

  if (Sender as TPosButton).Temp3 = 'Y' then Exit;
  try
    MainPanel.Enabled := False;
    //그리드에서 메뉴선택 후 메뉴버튼 눌렀을때
    if (GridTableView.Controller.FocusedRecordIndex >= 0)  then
    begin
      if GridSelect then
      begin
        (Sender as TPosButton).Temp1 := GridTableView.Controller.SelectedRecords[0].DisplayTexts[0];
        MenuNameEdit.Text := GridTableView.Controller.SelectedRecords[0].DisplayTexts[1];
        if SaveMenu then
        begin
          (MenuButton as TPosButton).Temp10  := MenuNameEdit.Text;
          (MenuButton as TPosButton).Caption := LineFeed(MenuNameEdit.Text);
          (MenuButton as TPosButton).Bottom.RightString := FormatFloat('#,0', GridTableView.Controller.SelectedRecords[0].Values[2])+' ';
          if not ContitionToolBarMenuCheckBox.Checked then
            GridTableView.DataController.DeleteFocused;
        end
        else
          (Sender as TPosButton).Temp1 := '';

        GridSelect := False;
      end;
    end
    //설정이 안된메뉴버튼을 눌렀을때
    else
    begin
      if (Sender as TPosButton).Temp1 = '' then
      begin
        if not CheckBefSelected then
          MenuNameEdit.Enabled := False;
        Exit;
      end;
    end;
    MenuNameEdit.Enabled := True;
    MenuNameEdit.Enabled := ((MenuButton as TPosButton).Temp1 <> '');
    MenuNameEdit.Text    := (MenuButton as TPosButton).Temp10;
    ShowPosMode;
    SelectMode      := smMenu;
    isDelete        := (MenuButton as TPosButton).Temp1 <> '';
    isChanged       := false;
    if (ConditionTollBarAutoSelectCheckBox.Checked) and (GridTableView.DataController.RecordCount > 0) then
      GridSelect := True;
  finally
    MainPanel.Enabled := True;
  end;

end;

procedure THeadPLUForm.PluMenuPrevButtonClick(Sender: TObject);
var vGridSelected :Boolean;
begin
  inherited;
  if Sender = TPosButton(FindComponent('MenuNextButton')) then
    MenuPageEdit.Value  := MenuPageEdit.Value  + 1
  else
    MenuPageEdit.Value  := MenuPageEdit.Value  - 1;
  SetPLUMenu( ClassButton );
  vGridSelected := GridSelect;
  GridSelect := False;
  PluMenuButtonClick(TPosButton(FindComponent('MenuButton1')));
  GridSelect := vGridSelected;
  TPosButton(FindComponent('MenuPrevButton')).Enabled  := MenuPageEdit.Value  > 1;
  isDelete   := False;
  isChanged  := False;
end;

procedure THeadPLUForm.SaveClass;
var vCode, vSQL : String;
    vIndex,
    vPosition  : Integer;
    vPage :Integer;
begin
  vPosition      := (ClassPageEdit.EditValue-1) * ((PluClassX * PluClassY)-1) + (ClassButton as TPosButton).Tag + 1;

  if vPosition > 99 then
  begin
    vPage := ClassPageEdit.EditValue-1;
    MsgBox(Format('최대 %d 페이까지 가능합니다',[vPage]));
    Exit;
  end;
  vCode    := FormatFloat('00', vPosition);


  ExecQuery('delete from '+LargeTable
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE '+DestStoreCode
           +'   and CD_GUBUN =:P1 '
           +'   and CD_LARGE =:P2;',
           [HeadStoreCode,
            ConditonPLUComboBox.Text,
            ClassCode], false);

  vSQL := '';
  for vIndex := 0 to WorkStoreList.Count-1 do
  begin
    if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2), Ifthen(Tag=0,2,6),1) = '0' then Continue;

    vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',%d,''%s'',''%s'',''%s'',''%s'',''%s''),',
                          [HeadStoreCode,
                           CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                           ConditonPLUComboBox.Text,
                           vCode,
                           vPosition,
                           Ifthen((ClassButton as TPosButton).Temp3 = 'Y','[블로킹]', ClassNameEdit.Text),
                           (ClassButton as TPosButton).Temp2,
                           TColorToHex((ClassButton as TPosButton).Color),
                           (ClassButton as TPosButton).Temp3,
                           UserCode]);
  end;


  if vSQL <> '' then
    vSQL := 'insert into '+LargeTable+'(CD_HEAD,CD_STORE,CD_GUBUN,CD_LARGE,NO_POSITION,NM_LARGE,COLOR,COLOR_HEX,YN_BLOCKING,CD_SAWON_CHG) values '+LeftStr(vSQL,Length(vSQL)-1)+';';

  ExecQuery(vSQL,[],true);

  (ClassButton as TPosButton).Temp1   :=  vCode;
  (ClassButton as TPosButton).Caption :=  Ifthen((ClassButton as TPosButton).Temp3 = 'Y', '[블로킹]', LineFeed(ClassNameEdit.Text));
  (ClassButton as TPosButton).Number.NumberString := vCode;

  ClassCode         := vCode;
  MenuPanel.Enabled := True;
  isChanged         := false;
end;

procedure THeadPLUForm.SaveColor;
var vIndex, vPosition :Integer;
begin
  if LeftStr(TPosButton(ColorPopupMenu.PopupComponent).Name, 11) = 'ClassButton' then
  begin
    ExecQuery('update '+LargeTable
             +'   set COLOR      =:P3, '
             +'       COLOR_HEX  =:P4, '
             +'       DT_CHANGE  = Now() '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   '+DestStoreCode
             +'   and CD_GUBUN   =:P1 '
             +'   and CD_LARGE   =:P2;',
             [HeadStoreCode,
              ConditonPLUComboBox.Text,
              TPosButton(ColorPopupMenu.PopupComponent).Temp1,
              ColorToString(TPosButton(ColorPopupMenu.PopupComponent).Color),
              TColorToHex(TPosButton(ColorPopupMenu.PopupComponent).Color)],true);

    TPosButton(ColorPopupMenu.PopupComponent).Temp2 := ColorToString(TPosButton(ColorPopupMenu.PopupComponent).Color);
    PluClassButtonClick(TPosButton(ColorPopupMenu.PopupComponent));
  end
  else
  begin
    vPosition := (MenuPageEdit.EditValue-1) * ((PluMenuX * PluMenuY)-1) + TPosButton(ColorPopupMenu.PopupComponent).Tag + 1;

    ExecQuery('update '+SmallTable
             +'   set COLOR       = :P4, '
             +'       COLOR_HEX   = :P5, '
             +'       DT_CHANGE   = Now() '
             +' where CD_HEAD     =:P0 '
             +'   and CD_STORE '+DestStoreCode
             +'   and CD_GUBUN    =:P1 '
             +'   and CD_LARGE    =:P2 '
             +'   and NO_POSITION =:P3;',
             [HeadStoreCode,
              ConditonPLUComboBox.Text,
              ClassCode,
              vPosition,
              ColorToString(TPosButton(ColorPopupMenu.PopupComponent).Color),
              TColorToHex(TPosButton(ColorPopupMenu.PopupComponent).Color)],true);
  end;
end;

function THeadPLUForm.SaveMenu:Boolean;
var vIndex,
    vPosition : Integer;
    vSQL :String;
begin
  Result := False;
  vPosition := (MenuPageEdit.EditValue-1) * ((PluMenuX * PluMenuY)-1) + (MenuButton as TPosButton).Tag + 1;

  try
    ExecQuery('delete from '+SmallTable
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE '+DestStoreCode
             +'   and CD_GUBUN =:P1 '
             +'   and CD_LARGE =:P2 '
             +'   and NO_POSITION =:P3; ',
             [HeadStoreCode,
              ConditonPLUComboBox.Text,
              ClassCode,
              vPosition], false);
    vSQL := '';
    for vIndex := 0 to WorkStoreList.Count-1 do
    begin
      if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),Ifthen(Tag=0,2,6),1) = '0' then Continue;

      vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',%d,''%s'',''%s'',''%s'',''%s''),',
                           [HeadStoreCode,
                            CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                            ConditonPLUComboBox.Text,
                            ClassCode,
                            Ifthen((MenuButton as TPosButton).Temp3 ='Y','BLOCKING', (MenuButton as TPosButton).Temp1),
                            Ifthen((MenuButton as TPosButton).Temp3='Y','[블로킹]', MenuNameEdit.Text),
                            vPosition,
                            (MenuButton as TPosButton).Temp2,
                            TColorToHex((MenuButton as TPosButton).Color),
                            (MenuButton as TPosButton).Temp3,
                            UserCode]);
    end;
    vSQL := 'insert into '+SmallTable+'(CD_HEAD,CD_STORE,CD_GUBUN,CD_LARGE,CD_MENU,NM_VIEW,NO_POSITION,COLOR,COLOR_HEX,YN_BLOCKING,CD_SAWON_CHG) values '+LeftStr(vSQL,Length(vSQL)-1)+';';

    Result := ExecQuery(vSQL,[],true);
    isChanged     := false;
    GridSelect    := False;
  except
    on E: Exception do begin
    ErrBox(E.Message);
    end;
  end;
end;

procedure THeadPLUForm.SearchConditionEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    SetGridMenu;
end;

procedure THeadPLUForm.SelectMenuNameLabelClick(Sender: TObject);
begin
  inherited;
  GridSelect := false;
end;

procedure THeadPLUForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarSearchButton.Enabled := true;
  ButtonToolBarSaveButton.Enabled   := aChanged;
  ButtonToolBarDeleteButton.Enabled := isDelete;
end;

procedure THeadPLUForm.SetGridMenu;
var vClassPage : Integer;
    vMenuPage  : Integer;
    vWhere     : String;
begin
  try
    vClassPage := ClassPageEdit.EditValue;
    vMenuPage  := MenuPageEdit.EditValue;

    if Tag = 1 then
    begin
      // 전체를 그룹메뉴로 사용합니다
      if GetHeadOption(428) = '1' then
        vWhere := ' and a.DS_MENU_TYPE = ''P'' '
      else
        vWhere := ' and a.DS_MENU_TYPE in(''N'',''C'',''P'',''S'') '
    end
    else
      vWhere := '';

    OpenQuery('select a.CD_MENU, '
             +'       a.NM_MENU, '
             +'       a.PR_SALE '
             +'  from MS_MENU a '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.CD_CLASS like :P2 '
             +'   and a.YN_USE   =''Y'' '
             +vWhere
             +'   and a.DS_MENU_TYPE <> ''I'' '
             +Ifthen(SearchConditionEdit.Text=EmptyStr,'', ' and ( a.CD_MENU =:P4 or a.NM_MENU like ConCat(''%'',:P4,''%'')) ')
             +Ifthen(ContitionToolBarMenuCheckBox.Checked,'','and a.CD_MENU not in (select CD_MENU from '+SmallTable+' where CD_HEAD = a.CD_HEAD and CD_STORE = a.CD_STORE and CD_GUBUN =:P3 group by CD_MENU) ')
             +' order by CD_MENU ',
             [HeadStoreCode,
              StandardStore,
              GetStrPointerData(ClassComboBox),
              ConditonPLUComboBox.Text,
              SearchConditionEdit.Text]);
    DM.ReadQuery(Query, GridTableView);
    ClassPageEdit.EditValue := vClassPage;
    MenuPageEdit.EditValue  := vMenuPage;
  finally
    FinishQuery;
    MainPanel.Enabled := true;
    Grid.Enabled      := true;
  end;
end;

procedure THeadPLUForm.SetGridSelect(AValue: Boolean);
begin
  FGridSelect := aValue;
  if FGridSelect then
  begin
    SelectMenuNameLabel.Caption := '☞ '+ GridTableView.Controller.SelectedRecords[0].DisplayTexts[1];
  end
  else
  begin
    SelectMenuNameLabel.Caption := '';
  end;
end;

///////////////////////////////////////////////////////////
/////////////////////// KISOSK ////////////////////////////
///////////////////////////////////////////////////////////
procedure THeadPLUForm.SaveImageClick(Sender: TObject);
var vPath, vFileName :String;
    vIndex :Integer;
begin
  vPath     := Format('%s\%s',[HeadStoreCode, StandardStore]);
  vFileName := KioskButtonList[(Sender as TAdvGlowButton).Tag].MenuCode+'.png' ;

  if not DirectoryExists(Format('%sKiosk\%s',[Folder, vPath])) then
    ForceDirectories(Format('%sKiosk\%s',[Folder, vPath]));

  KioskButtonList[(Sender as TAdvGlowButton).Tag].MenuImage.Picture.SaveToFile(Format('%sKiosk\%s\%s',[Folder, vPath, vFileName]));
  if ImageUpLoad(vPath, Format('%sKiosk\%s\%s',[Folder, vPath, vFileName])) then
  begin
    for vIndex := 0 to WorkStoreList.Count-1 do
    begin
      ExecQuery('insert into MS_MENU_IMAGE(CD_HEAD, '
               +'                          CD_STORE, '
               +'                          CD_MENU, '
               +'                          IMG_MENU, '
               +'                          IMG_STORE, '
               +'                          IMG_FILESIZE, '
               +'                          DT_CHANGE, '
               +'                          DT_INSERT) '
               +'                  values(:P0, '
               +'                         :P1, '
               +'                         :P2, '
               +'                         :P3, '
               +'                         '''', '
               +'                         :P4, '
               +'                         Now(), '
               +'                         NOW()) '
               +'ON DUPLICATE KEY UPDATE '
               +'       IMG_MENU          =:P3, '
               +'       IMG_STORE         ='''', '
               +'       IMG_FILESIZE      =:P4, '
               +'       DT_CHANGE         = NOW(); ',
               [HeadStoreCode,
                CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                KioskButtonList[(Sender as TAdvGlowButton).Tag].MenuCode,
                vFileName,
                GetFileSize(Format('%sKiosk\%s\%s',[Folder, vPath, vFileName]))],false);
    end;
    ExecQuery('',[],true);

    (Sender as TAdvGlowButton).Visible := false;
  end;

end;

procedure THeadPLUForm.SetKioskClassPage(AValue: Integer);
begin
  FKioskClassPage  := AValue;
  KioskSetClassPLU;
  KioskClassClick(nil);

  if KioskClassNextButton.Visible then
  begin
    KioskClassPriorButton.Enabled  := FKioskClassPage > 1;
    KioskClassNextButton.Enabled   := FKioskClassPage < KioskClassTotalPage;
  end;
end;

procedure THeadPLUForm.SetKioskPage(AValue: Integer);
begin
  FKioskPage  := AValue;
  KioskSetMenuPLU;

  if KioskMenuNextButton.Visible then
  begin
    KioskMenuPriorButton.Enabled := FKioskPage > 1;
    KioskMenuNextButton.Enabled := FKioskPage < KioskTotalPage;
  end;
end;

procedure THeadPLUForm.SetPLUClass;
var vIndex, vBegin, vEnd :Integer;
begin
  vBegin   := (ClassPageEdit.EditValue-1) * ((PluClassX * PluClassY)-1)+1;
  vEnd     := vBegin + PluClassX * PluClassY - 2;

  for vIndex := Low(PluClassButton) to High(PluClassButton) do
  begin
    PluClassButton[vIndex].Caption := IntToStr(TPosButton(FindComponent('ClassButton'+ IntToStr(vIndex))).Tag+1);
    PluClassButton[vIndex].Color   := ClassDefaultColor;
    PluClassButton[vIndex].Number.NumberString  := '';
    PluClassButton[vIndex].Temp1   := FormatFloat('00',vBegin+vIndex);
    PluClassButton[vIndex].Temp2   := '';
    PluClassButton[vIndex].Temp3   := 'N';
    PluClassButton[vIndex].Enabled := true;
  end;

  PluMenuButtonClear;
  try
    OpenQuery('select NO_POSITION, '
             +'       CD_LARGE, '
             +'       NM_LARGE, '
             +'       COLOR, '
             +'       YN_BLOCKING '
             +'  from '+LargeTable
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN =:P2 '
             +'   and NO_POSITION between :P3 and :P4 '
             +'  order by NO_POSITION ',
             [HeadStoreCode,
              StandardStore,
              ConditonPLUComboBox.Text,
              vBegin,
              vEnd]);

    while not Query.Eof do
    begin
      if ClassPageEdit.Value = 1 then
        vIndex := Query.FieldByName('NO_POSITION').AsInteger
      else
        vIndex := Query.FieldByName('NO_POSITION').AsInteger - vBegin + 1;

      PluClassButton[vIndex-1].Temp1   := Query.FieldByName('CD_LARGE').AsString;
      PluClassButton[vIndex-1].Caption := LineFeed(Query.FieldByName('NM_LARGE').AsString);
      PluClassButton[vIndex-1].Number.NumberString  := Query.FieldByName('CD_LARGE').AsString;
      PluClassButton[vIndex-1].Temp2   := Query.FieldByName('COLOR').AsString;
      PluClassButton[vIndex-1].Temp3   := Ifthen(Query.FieldByName('YN_BLOCKING').AsString='','N',Query.FieldByName('YN_BLOCKING').AsString);
      //분류에 지정된 색상이 별도로 있을때
      if (PluClassButton[vIndex-1].Temp2 <> '') and (Tag = 0) then
        PluClassButton[vIndex-1].Color := StringToColor(PluClassButton[vIndex-1].Temp2);

      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  MenuPageEdit.Value := 1;
end;

procedure THeadPLUForm.SetPLUMenu(Sender: TObject);
var vIndex, vBegin, vEnd :Integer;
begin
  vBegin   := (MenuPageEdit.EditValue-1) * ((PluMenuX * PluMenuY)-1)+1;
  vEnd     := vBegin + PluMenuX * PluMenuY - 2;

  MenuNameEdit.Text := '';
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
             +'  from '+SmallTable+' a left outer join '
             +'       MS_MENU  b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU '
             +' where a.CD_HEAD   = :P0 '
             +'   and a.CD_STORE  = :P1 '
             +'   and a.CD_GUBUN  = :P2 '
             +'   and a.CD_LARGE  = :P3 '
             +'   and a.NO_POSITION between :P4 and :P5 '
             +'order by a.NO_POSITION  ',
             [HeadStoreCode,
              StandardStore,
              ConditonPLUComboBox.Text,
              ClassCode,
              vBegin,
              vEnd]);
    while not Query.Eof do
    begin
      if MenuPageEdit.Value = 1 then
        vIndex := Query.FieldByName('NO_POSITION').AsInteger
      else
        vIndex := Query.FieldByName('NO_POSITION').AsInteger - vBegin + 1;

      if Query.FieldByName('YN_BLOCKING').AsString <> 'Y' then
      begin
        PluMenuButton[vIndex-1].Temp1   := Query.FieldByName('CD_MENU').AsString;
        PluMenuButton[vIndex-1].Temp10  := Query.FieldByName('NM_VIEW').AsString;
        PluMenuButton[vIndex-1].Caption := LineFeed(Query.FieldByName('NM_VIEW').AsString);
        PluMenuButton[vIndex-1].Bottom.RightString := FormatFloat(',0', Query.FieldByName('PR_SALE').AsInteger);
        if (Query.FieldByName('COLOR').AsString <> '') and (Tag = 0) then
        begin
          PluMenuButton[vIndex-1].Color   := StringToColor(Query.FieldByName('COLOR').AsString);
          PluMenuButton[vIndex-1].Temp2   := Query.FieldByName('COLOR').AsString;        //저장시 사용
        end
        else
          PluMenuButton[vIndex-1].Temp2 := ColorToString(MenuDefaultColor);
        PluMenuButton[vIndex-1].Bottom.LeftString  := Query.FieldByName('CD_PRINTER').AsString;
        PluMenuButton[vIndex-1].Temp3 := 'N';
      end
      else
      begin
        PluMenuButton[vIndex-1].Caption := '[블로킹]';
        PluMenuButton[vIndex-1].Temp3 := Query.FieldByName('YN_BLOCKING').AsString;
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ShowPosMode;

  MenuPanel.Enabled := (Sender as TPosButton).Temp1 <> '';
  isDelete          := (Sender as TPosButton).Temp1 <> '';
  isChanged         := False;
end;

procedure THeadPLUForm.SetSelectMode(AValue: TSelectMode);
var vIndex :Integer;
begin
  FSelectMode := AValue;
  case FSelectMode of
    smClass :
    begin
      ClassMoveButton.Caption := '위치 이동';
      ClassPanel.Color := clYellow;
      MenuPanel.Color  := clWhite;
      For vIndex := Low(PluMenuButton) to High(PluMenuButton) do
        PluMenuButton[vIndex].Enabled := True;

      MenuNameEdit.Clear;

      isDelete             := ClassNameEdit.Text <> '';
      MenuNameEdit.Enabled := False;
      isChanged            := False;
      ClassMoveButton.Enabled := ClassCode <> '';
    end;
    smMenu :
    begin
      ClassMoveButton.Caption := '위치 이동';
      MenuPanel.Enabled := true;
      ClassPanel.Color  := clWhite;
      MenuPanel.Color   := clYellow;
      ClassMoveButton.Enabled := false;
    end;
    smMove, smMoveing :
    begin
      MenuPanel.Enabled := false;
      ClassPanel.Color  := clYellow;
      MenuPanel.Color   := clWhite;
      ClassMoveButton.Enabled := true;
      ClassMoveButton.Caption := '위치 지정';
    end;
  end;
end;

procedure THeadPLUForm.ShowPosMode;
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

  function GetNextLine2Button(aX,aY, aMenuCode:String):Integer;
  var vIndex :Integer;
      vLine  :String;
  begin
    vLine := IntToStr(StrToInt(aY)+1);
    Result := -1;
    for vIndex := Low(PluMenuButton) to High(PluMenuButton)-1 do
    begin
      //다음라인과  같고
      if (vLine = PluMenuButton[vIndex].Temp4) and (aX = PluMenuButton[vIndex].Temp5) and (aMenuCode = PluMenuButton[vIndex].Temp1) then
      begin
        PluMenuButton[vIndex].Temp8 := 'M';
        Result := vIndex;
        Break;
      end;
    end;
  end;
var vIndex, vIndex1 :Integer;
begin
  if Tag = 2 then Exit;

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
    end
    else //세로 합치기
    begin
      vIndex1 := GetNextLine2Button(PluMenuButton[vIndex].Temp5, PluMenuButton[vIndex].Temp4, PluMenuButton[vIndex].Temp1);
      if vIndex1 > 0 then
      begin
        PluMenuButton[vIndex].Height    := PluMenuButton[vIndex].Height * 2 + 2;
        PluMenuButton[vIndex].Temp8  := 'M';
      end;
      PluMenuButton[vIndex].BringToFront;
      Continue;
    end;
  end;
end;

function THeadPLUForm.LineFeed(aValue: String): String;
var vData : TStringList;
    vIndex :Integer;
begin
  try
    Result := EmptyStr;
    vData := TStringList.Create;
    Split(aValue, '|', vData);
    for vIndex := 0 to vData.Count-1 do
       Result := Result + vData[vIndex] + Ifthen(vIndex < vData.Count-1, #13,'');

    if Result = EmptyStr then
      Result := aValue;
  finally
    vData.Free;
  end;
end;

procedure THeadPLUForm.KioskTabShow(Sender: TObject);
begin
  inherited;
  KioskClassCode := '01';
  KioskSetClassPLU;
  KioskClassPage := 1;
end;

procedure THeadPLUForm.KioskClassClick(Sender: TObject);
var vIndex     :Integer;
begin
  if (KioskConfig[2] > 0) and KioskPLUClassPanel.Visible then
  begin
    if Sender = nil then
    begin
      KioskClassCode  := TAdvSmoothToggleButton(FindComponent('obtn_KioskClass1')).Hint;
      KioskClassBlock := TAdvSmoothToggleButton(FindComponent('obtn_KioskClass1')).HelpKeyword;
      for vIndex := 1 to KioskConfig[2] do
      begin
        TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Down := false;
        TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Appearance.Font.Color := clBlack;
        if GetHeadOption(458) <> '0' then
        begin
          TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).BorderColor      := $006A6A6A;
          TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).BorderInnerColor := clWhite;
        end;
      end;
      TAdvSmoothToggleButton(FindComponent('obtn_KioskClass1')).Down := true;
      TAdvSmoothToggleButton(FindComponent('obtn_KioskClass1')).Appearance.Font.Color := clWhite;
      if GetHeadOption(458) <> '0' then
      begin
        TAdvSmoothToggleButton(FindComponent('obtn_KioskClass1')).BorderColor      := clNone;
        TAdvSmoothToggleButton(FindComponent('obtn_KioskClass1')).BorderInnerColor := clNone;
      end;
    end
    else
    begin
      for vIndex := 1 to KioskConfig[2] do
      begin
        TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Down := false;
        TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Appearance.Font.Color := clBlack;
        if GetHeadOption(458) <> '0' then
        begin
          TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).BorderColor      := $006A6A6A;
          TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).BorderInnerColor := clWhite;
        end;
      end;

      KioskClassCode := (Sender as TAdvSmoothToggleButton).Hint;
      KioskClassBlock := (Sender as TAdvSmoothToggleButton).HelpKeyword;
      (Sender as TAdvSmoothToggleButton).Down := true;
      (Sender as TAdvSmoothToggleButton).Appearance.Font.Color := clWhite;

      if GetHeadOption(458) <> '0' then
      begin
        (Sender as TAdvSmoothToggleButton).BorderColor      := clNone;
        (Sender as TAdvSmoothToggleButton).BorderInnerColor := clNone;
      end;
    end;
  end
  else
    KioskClassCode := '01';

  OpenQuery('select Max(NO_POSITION) '
           +'  from MS_KIOSK_SMALL '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_GUBUN =''01'' '
           +'   and CD_LARGE =:P2 ',
           [HeadStoreCode,
            StandardStore,
            KioskClassCode]);

  if not Query.Eof then
  begin
    if KioskMenuCount > 0 then
    begin
      KioskTotalPage := Query.Fields[0].AsInteger div Ifthen(KioskMenuCount=0,1,KioskMenuCount);
      if Query.Fields[0].AsInteger mod KioskMenuCount > 0 then
        KioskTotalPage := KioskTotalPage + 1;
      KioskPage  := 1;
    end
    else
      MsgBox('키오스크 디자인 정보가 없습니다');
    Query.Close;
  end
  else
  begin
    Query.Close;
    for vIndex := 0 to High(KioskButtonList) do
    begin
      KioskButtonList[vIndex].GroupBox.Text  := '';
      KioskButtonList[vIndex].MenuImage.Picture.Graphic := nil;
      KioskButtonList[vIndex].MenuImage.Visible := false;
      KioskButtonList[vIndex].MenuName.Caption := '';
      KioskButtonList[vIndex].Price.Caption    := '';
      KioskButtonList[vIndex].SaveButton.Visible := false;
      KioskButtonList[vIndex].MenuCode         := '';
    end;
  end;
end;

procedure THeadPLUForm.KioskClassPLUCreate;
var vIndex,
    vIndex1,
    vHeight,
    vWidth,
    vX,
    vCount,
    vGap,
    vLeftPos  :Integer;
    vPNG : TPNGImage;
begin
  if not KioskPLUClassPanel.Visible then Exit;
  vX := KioskConfig[2];
  vX := Ifthen(vX < 3, 3, vX);

  vWidth   := KioskPLUClassPanel.Width div vX - (KioskConfig[10] div 2);
  vHeight  := KioskPLUClassPanel.Height;

  vCount     := 1;
  vGap       := (KioskPLUClassPanel.Width - vWidth * vX) div (vX+1);
  vLeftPos   := KioskPLUClassPanel.Left+vGap;
  For vIndex := 0 to vX-1 do
  begin
    with TAdvSmoothToggleButton.Create(Self) do
    begin
      Parent       := KioskPanel;
      vLeftPos     := vLeftPos + vWidth + vGap;
      Left         := (vIndex  * vWidth)  + (vIndex * 1) + ((vIndex+1) * (KioskConfig[10] div 2)) + KioskPLUClassPanel.Left;
      Top          := KioskPLUClassPanel.Top;
      Height       := vHeight;
      Width        := vWidth;
      Name         := Format('obtn_KioskClass%d',[vCount]);
      Caption      := EmptyStr;
      Appearance.Font         := KioskPLUClassPanel.Font;
      Appearance.Font.Color   := KioskPLUClassPanel.Font.Color;
      Appearance.Font.Style   := KioskPLUClassPanel.Font.Style;
      Appearance.FocusColor   := clWhite;
      Appearance.SimpleLayout := true;
      Appearance.Spacing      := 1;
      Appearance.Rounding     := 5;
      BevelWidth              := 0;
      ShowFocus               := false;
      Tag          := vCount;
      OnClick      := KioskClassClick;
      Color                   := KioskPLUClassPanel.StatusBar.Color;
      ColorDown               := KioskPLUClassPanel.StatusBar.ColorTo;
      BorderColor             := KioskPLUClassPanel.StatusBar.Color;
      BorderInnerColor        := KioskPLUClassPanel.StatusBar.Color;
      Inc(vCount);
    end;
  end;
  KioskPLUClassPanel.Width   := 0;
  KioskClassNextButton.Left  := vLeftPos + 10;
end;

procedure THeadPLUForm.KioskClassPriorButtonClick(Sender: TObject);
begin
  inherited;
  if Sender = KioskClassPriorButton then
    KioskClassPage := KioskClassPage - 1
  else if Sender = KioskClassNextButton then
    KioskClassPage := KioskClassPage + 1
  else if Sender = KioskMenuPriorButton then
    KioskPage := KioskPage - 1
  else if Sender = KioskMenuNextButton then
    KioskPage := KioskPage + 1;
end;

procedure THeadPLUForm.KioskMenuClick(Sender: TObject);
var vIndex     :Integer;
    vImage     :TcxImage;
begin
  vIndex := (Sender as TcxImage).Tag;
  if PictureLoadDialog.Execute then
  begin
    try
      vImage := TcxImage.Create(Self);
      vImage.Align  := alClient;
      vImage.Picture.LoadFromFile(PictureLoadDialog.FileName);

      if (vImage.Picture.Width > 300) and (vImage.Picture.Height > 300) then
      begin
        MsgBox('이미지는 최대 300 * 300 입니다');
        Exit;
      end;
      KioskButtonList[vIndex].MenuImage.Picture.LoadFromFile(PictureLoadDialog.FileName);
      KioskButtonList[vIndex].MenuImage.Properties.Caption := '';
      KioskButtonList[vIndex].SaveButton.Visible := true;
    finally
      vImage.Free;
    end;
  end;
end;

procedure THeadPLUForm.KioskMenuPLUCreate;
var vIndex,
    vIndex1,
    vHeight,
    vWidth,
    vX, vX1,
    vY, vY1,
    vCount,
    vBottomMagin  :Integer;
begin
  if not KioskPLUMenuPanel.Visible then Exit;

  vX := KioskConfig[3];
  vY := KioskConfig[4];

  vX := Ifthen(vX < 1, 1, vX);
  vY := Ifthen(vY < 1, 1, vY);

  vWidth  := KioskPLUMenuPanel.Width  div vX - (KioskConfig[10] div 2);
  vHeight := KioskPLUMenuPanel.Height div vY - (KioskConfig[10] div 2);

  SetLength(KioskButtonList, KioskMenuCount);
  vCount := 0;
  For vIndex := 1 to vY do
  begin
    For vIndex1 := 1 to vX do
    begin
      KioskButtonList[vCount].GroupBox := TAdvPanel.Create(Self);
      KioskButtonList[vCount].GroupBox.Parent            := KioskPanel;
      KioskButtonList[vCount].GroupBox.Align             := alNone;
      KioskButtonList[vCount].GroupBox.BevelOuter        := bvNone;
      KioskButtonList[vCount].GroupBox.Color             := clWhite;
      KioskButtonList[vCount].GroupBox.BorderColor       := $00393939;
      KioskButtonList[vCount].GroupBox.TextVAlign        := tvaBottom;
//      if KioskConfig[7]  = 1 then
//        KioskButtonList[vCount].GroupBox.BorderWidth       := 1
//      else
        KioskButtonList[vCount].GroupBox.BorderWidth       := 0;

      KioskButtonList[vCount].GroupBox.Width             := vWidth;
      KioskButtonList[vCount].GroupBox.Height            := vHeight;
      KioskButtonList[vCount].GroupBox.Visible           := true;
      KioskButtonList[vCount].GroupBox.Top               := ((vIndex-1) * vHeight)  + (vIndex  * (KioskConfig[10] div 2)) + KioskPLUMenuPanel.Top;
      KioskButtonList[vCount].GroupBox.Left              := ((vIndex1-1) * vWidth)  + (vIndex1 * (KioskConfig[10] div 2)) + KioskPLUMenuPanel.Left;
      KioskButtonList[vCount].GroupBox.Name              := Format('obtn_KioskPlu%d',[vCount]);
      KioskButtonList[vCount].GroupBox.Visible           := true;

      KioskButtonList[vCount].MenuImage                  := TcxImage.Create(Self);
      KioskButtonList[vCount].MenuImage.Cursor           := crHandPoint;
      KioskButtonList[vCount].MenuImage.Parent           := KioskButtonList[vCount].GroupBox;
      KioskButtonList[vCount].MenuImage.Top              := 0;
      KioskButtonList[vCount].MenuImage.Left             := 0;
      KioskButtonList[vCount].MenuImage.Width            := vWidth;
      KioskButtonList[vCount].MenuImage.Height           := vHeight - KioskConfig[8];
      if KioskConfig[6] = 0 then
        KioskButtonList[vCount].MenuImage.Style.BorderStyle := ebsNone;
      KioskButtonList[vCount].MenuImage.Properties.FitMode := ifmStretch;
      KioskButtonList[vCount].MenuImage.Properties.GraphicClassName := 'TdxPNGImage';
      KioskButtonList[vCount].MenuImage.Visible          := true;
      KioskButtonList[vCount].MenuImage.Transparent      := true;
      KioskButtonList[vCount].MenuImage.Tag              := vCount;
      KioskButtonList[vCount].MenuImage.Hint             := '99';     //ClearEdit 에서 Tag를 0으로 바꾸지 않게
      KioskButtonList[vCount].MenuImage.OnClick          := KioskMenuClick;
      KioskButtonList[vCount].MenuImage.Properties.PopupMenuLayout.MenuItems := [];


      KioskButtonList[vCount].SaveButton := TAdvGlowButton.Create(Self);
      KioskButtonList[vCount].SaveButton.Parent           := KioskButtonList[vCount].GroupBox;
      KioskButtonList[vCount].SaveButton.Top              := 0;
      KioskButtonList[vCount].SaveButton.Left             := 0;
      KioskButtonList[vCount].SaveButton.Height           := 20;
      KioskButtonList[vCount].SaveButton.Width            := 50;
      KioskButtonList[vCount].SaveButton.Font.Size        := 9;
      KioskButtonList[vCount].SaveButton.Caption          := '저장';
      KioskButtonList[vCount].SaveButton.Visible          := false;
      KioskButtonList[vCount].SaveButton.Tag              := vCount;
      KioskButtonList[vCount].SaveButton.OnClick          := SaveImageClick;
      Inc(vCount);
    end;
  end;
  KioskPLUMenuPanel.Visible := false;
end;

procedure THeadPLUForm.KioskSetClassPLU;
  function SetCaption(aValue:String):String;
  var vCount :Integer;
  begin
    vCount := Length(aValue) - Length(WideString(aValue));
    Result := EmptyStr;
    for vCount := 1 to vCount*2 do
      Result := Result + ' ';

    Result := Result + aValue;
  end;
var vIndex :Integer;
begin
  if not KioskPLUClassPanel.Visible then Exit;

  OpenQuery('select CD_LARGE, '
           +'			  NM_LARGE, '
           +'			  NO_POSITION, '
           +'       YN_BLOCKING '
           +'	 from MS_KIOSK_LARGE '
           +' where CD_HEAD   =:P0 '
           +'   and CD_STORE	=:P1 '
           +'		and CD_GUBUN	=''01'' '
           +'   and NO_POSITION between :P2 and :P3 '
           +' order by NO_POSITION',
           [HeadStoreCode,
            StandardStore,
            (KioskClassPage-1)*KioskClassCount+1,
            (KioskClassPage-1)*KioskClassCount+KioskClassCount]);
  for vIndex := 1 to KioskClassCount do
  begin
    TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Caption := EmptyStr;
    TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Hint    := EmptyStr;
    TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).HelpKeyword := 'N';
  end;

  while not Query.Eof do
  begin
    vIndex := Query.FieldByName('NO_POSITION').AsInteger - (KioskClassPage-1)*KioskClassCount;
    TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Caption := LineFeed(Query.FieldByName('nm_large').AsString);
    TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).Hint    := Query.FieldByName('cd_large').AsString;
    TAdvSmoothToggleButton(FindComponent(Format('obtn_KioskClass%d',[vIndex]))).HelpKeyword:= Query.FieldByName('YN_BLOCKING').AsString;
    Query.Next;
  end;
  Query.Close;
end;

procedure THeadPLUForm.KioskSetMenuPLU;
var vIndex     :Integer;
    vPosition  :Integer;
    vMenuAling,
    vPriceAlign,
    vMenuName,
    vMenuPrice,
    vPath, vTemp  :String;
begin
  vPath := Format('%s\%s',[HeadStoreCode, StandardStore]);

  OpenQuery('select a.CD_MENU, '
           +'       a.NM_VIEW, '
           +'       b.PR_SALE, '
           +'       c.IMG_MENU, '
           +'       a.NO_POSITION, '
           +'       b.CONFIG, '
           +'       b.DS_MENU_TYPE, '
           +'       a.YN_BLOCKING, '
           +'       c.IMG_FILESIZE '
           +'  from MS_KIOSK_SMALL a inner join '
           +'       MS_MENU       as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU left outer join '
           +'       MS_MENU_IMAGE as c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.CD_MENU = a.CD_MENU '
           +' where a.CD_HEAD = :P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and a.CD_GUBUN =''01'' '
           +'   and a.CD_LARGE =:P2 '
           +'   and a.NO_POSITION between :P3 and :P4 '
           +' order by NO_POSITION ',
           [HeadStoreCode,
            StandardStore,
            KioskClassCode,
            (KioskPage-1)*KioskMenuCount+1,
            (KioskPage-1)*KioskMenuCount+KioskMenuCount]);

  for vIndex := 0 to High(KioskButtonList) do
  begin
    KioskButtonList[vIndex].MenuImage.Visible  := false;
    KioskButtonList[vIndex].MenuImage.Picture.Graphic := nil;
    KioskButtonList[vIndex].MenuName.Caption := '';
    KioskButtonList[vIndex].Price.Caption    := '';
    KioskButtonList[vIndex].SaveButton.Visible := false;
    KioskButtonList[vIndex].MenuCode         := '';
    KioskButtonList[vIndex].GroupBox.Text    := '';
  end;

  while not Query.Eof do
  begin
    vIndex      := Query.FieldByName('NO_POSITION').AsInteger - (KioskPage-1)*KioskMenuCount - 1;
    vMenuName   := Replace(Query.FieldByName('NM_VIEW').AsString,'|','<BR>');
    if Query.FieldByName('DS_MENU_TYPE').AsString = 'P' then
      vMenuPrice := ' '
    else
      vMenuPrice     := FormatFloat('#,0원', Query.FieldByName('PR_SALE').AsCurrency);

    KioskButtonList[vIndex].MenuBlock         := Query.FieldByName('YN_BLOCKING').AsString;
    KioskButtonList[vIndex].MenuCode          := Query.FieldByName('CD_MENU').AsString;
    KioskButtonList[vIndex].FileSize          := Query.FieldByName('IMG_FILESIZE').AsInteger;
    KioskButtonList[vIndex].MenuImage.Visible := true;
    if (Query.FieldByName('IMG_MENU').AsString <> '') then
    begin
      KioskButtonList[vIndex].MenuImage.Properties.Caption := '';

      if not FileExists(Format('%sKiosk\%s\%s',[Folder, vPath,  Query.FieldByName('IMG_MENU').AsString]))
        or (GetFileSize(Format('%sKiosk\%s\%s',[Folder, vPath,  Query.FieldByName('IMG_MENU').AsString])) <> KioskButtonList[vIndex].FileSize) then
        ImageDownLoad(vPath, Query.FieldByName('IMG_MENU').AsString, 'Kiosk\'+vPath);

      if FileExists(Format('%sKiosk\%s\%s',[Folder, vPath, Query.FieldByName('IMG_MENU').AsString])) then
      begin
        if KioskButtonList[vIndex].FileSize = 0 then
          ExecQuery('update MS_MENU_IMAGE '
                   +'   set IMG_FILESIZE = :P3 '
                   +' where CD_HEAD      =:P0 '
                   +'   and CD_STORE     =:P1 '
                   +'   and CD_MENU      =:P2;',
                   [HeadStoreCode,
                    StandardStore,
                    Query.FieldByName('CD_MENU').AsString,
                    GetFileSize(Format('%sKiosk\%s\%s',[Folder, vPath, Query.FieldByName('IMG_MENU').AsString]))],true);

        KioskButtonList[vIndex].MenuImage.Picture.LoadFromFile(Format('%sKiosk\%s\%s',[Folder, vPath, Query.FieldByName('IMG_MENU').AsString]));
      end
      else
        KioskButtonList[vIndex].MenuImage.Picture.Assign(ImageCollection.Items.Items[0].Picture.Graphic);;
    end
    else
    begin
      KioskButtonList[vIndex].MenuImage.Picture.Assign(ImageCollection.Items.Items[0].Picture.Graphic);;
    end;

    case KioskConfig[11] of
      0 : vMenuAling := 'left';
      1 : vMenuAling := 'center';
      2 : vMenuAling := 'right';
    end;
    case KioskConfig[12] of
      0 : vPriceAlign := 'left';
      1 : vPriceAlign := 'center';
      2 : vPriceAlign := 'right';
    end;

    if KioskConfig[14] = 0 then
    begin
      KioskButtonList[vIndex].GroupBox.Text := Format('<FONT  size="%d" face="%s"><P align="%s"></P>%s<BR><P   align="%s"><B>%s</B></P></FONT>',
                                                      [KioskPLUMenuPanel.Font.Size,
                                                       KioskPLUMenuPanel.Font.Name,
                                                       vMenuAling,
                                                       vMenuName,
                                                       vPriceAlign,
                                                       vMenuPrice]);
    end
    else
    begin
      KioskButtonList[vIndex].GroupBox.Text := Format('<FONT  size="%d" face="%s"><P align="%s"></P>%s<BR><BR><P   align="%s"><B>%s</B></P></FONT>',
                                                      [KioskPLUMenuPanel.Font.Size,
                                                       KioskPLUMenuPanel.Font.Name,
                                                       vMenuAling,
                                                       vMenuName,
                                                       vPriceAlign,
                                                       vMenuPrice]);
    end;

    Query.Next;
  end;
  Query.Close;
end;


end.
