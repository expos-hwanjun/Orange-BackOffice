unit CodeTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  Vcl.ExtCtrls, cxStyles, AdvToolBar, AdvToolBarStylers,
  cxClasses, DBAccess, Uni, Data.DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, Menus, Vcl.StdCtrls, cxButtons,
  cxSpinEdit, cxGroupBox, cxRadioGroup, cxListBox, Contnrs, StrUtils,
  Vcl.ActnMan, Vcl.ActnColorMaps, cxSplitter, jpeg, Math, CPort, CPortCtl,
  Vcl.ComCtrls, dxCore, cxDateUtils, PosButton, AdvGlassButton, dxmdaset,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  ToolPanels, Vcl.Buttons, Registry, AdvOfficePager, dxBarBuiltInMenu, cxPC,
  Vcl.WinXCtrls, System.ImageList, Vcl.ImgList, cxImageList, cxCustomListBox,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePagerStylers,
  nrclasses, nrcomm;

type
  TTableButton = ^TableButton;
  TableButton = record
    Style        : String;
    ChairCount   : Integer;
    Left         : Integer;
    Top          : Integer;
    Height       : Integer;
    Width        : Integer;
    Number       : Integer;
    FontSize     : Integer;
    Seq          : Integer;
    Amount       : String;
    TableType    : String;  //T-테이블, W-벽
    Color        : TColor;
    NumberColor  : TColor;
    FontColor    : TColor;
    BottomFontColor  : TColor;
    BorderColor  : TColor;
    WallColor    : TColor;    //벽일때 색상
    NoColor      : String;
    FontNoColor  : String;
    BorderNoColor: String;
    Name         : String;
    Packing      : String;
    Group        : String;
    LetsOrderURL : String;
    Tablet       : String;
    Options      : String;
    RFID         : String;
    Status       : String;    //Temp8 (New, Load)
  end;

type
  TCodeTableForm = class(TInheritEditForm)
    MainPanel: TPanel;
    cxLabel1: TcxLabel;
    ButtonPopupMenu: TPopupMenu;
    TableNameItem: TMenuItem;
    OrderColorItem: TMenuItem;
    MenuItem3: TMenuItem;
    ColorCopyItem: TMenuItem;
    ColorPasteItem: TMenuItem;
    MenuItem4: TMenuItem;
    SizeCopyItem: TMenuItem;
    SizeTopPasteItem: TMenuItem;
    SizeLeftPasteItem: TMenuItem;
    MenuItem5: TMenuItem;
    ControlPanel: TPanel;
    FloorGroupBox: TcxGroupBox;
    FloorListBox: TcxListBox;
    cxGroupBox2: TcxGroupBox;
    HorizontalEdit: TcxSpinEdit;
    cxLabel7: TcxLabel;
    VertialEdit: TcxSpinEdit;
    TypeRadioGroup: TcxRadioGroup;
    ColorDialog: TColorDialog;
    cxSplitter1: TcxSplitter;
    PackingTableItem: TMenuItem;
    LeftAlignButton: TcxButton;
    RightAlignButton: TcxButton;
    TopAlignButton: TcxButton;
    BottomAlignButton: TcxButton;
    VerSpaceButton: TcxButton;
    HorSpaceButton: TcxButton;
    ColorAlignButton: TcxButton;
    SizeAlignButton: TcxButton;
    TablePanel: TScrollBox;
    MainShape: TShape;
    ColorPanel: TAdvToolPanel;
    Shape1: TShape;
    ColorButton: TPosButton;
    OkButton: TAdvGlowButton;
    CancelButton: TAdvGlowButton;
    ChairCount: TMenuItem;
    TableStyle: TMenuItem;
    ZoomOutButton: TAdvGlowButton;
    ZoomInButton: TAdvGlowButton;
    CreateButton: TAdvGlowButton;
    AddButton: TAdvGlowButton;
    SelectedDeleteButton: TAdvGlowButton;
    AllDeleteButton: TAdvGlowButton;
    GroupButton: TAdvGlowButton;
    UnGroupButton: TAdvGlowButton;
    NumberColorButton: TAdvGlowButton;
    ColorSetButton: TAdvGlowButton;
    FontColorButton: TAdvGlowButton;
    BorderColorButton: TAdvGlowButton;
    RemarkLabel: TcxLabel;
    NoOrderColorItem: TMenuItem;
    BottomColorButton: TAdvGlowButton;
    DefaultPager: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    DefaultButton: TPosButton;
    OrderDefaultButton: TPosButton;
    Remark2Label: TcxLabel;
    TableNoChangeItem: TMenuItem;
    ImageList: TcxImageList;
    SortData: TdxMemData;
    SortDataIndex: TIntegerField;
    TabletNoneItem: TMenuItem;
    TabletBorkenItem: TMenuItem;
    TableDeleteItem: TMenuItem;
    TableKeyItem: TMenuItem;
    nrComPort: TnrComm;
    ComPortOpenButton: TAdvGlassButton;
    VanData: TdxMemData;
    VanDataTableNo: TIntegerField;
    VanDataSerialNo: TStringField;
    VanDataTID: TStringField;
    SortDatatop: TIntegerField;
    SortDataleft: TIntegerField;
    SortDatatableno: TIntegerField;
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure TableNameItemClick(Sender: TObject);
    procedure OrderColorItemClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ColorCopyItemClick(Sender: TObject);
    procedure ColorPasteItemClick(Sender: TObject);
    procedure SizeCopyItemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure DefaultButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SizeTopPasteItemClick(Sender: TObject);
    procedure SizeLeftPasteItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonPopupMenuPopup(Sender: TObject);
    procedure ColorSetButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FloorListBoxClick(Sender: TObject);
    procedure LeftAlignButtonClick(Sender: TObject);
    procedure RightAlignButtonClick(Sender: TObject);
    procedure TopAlignButtonClick(Sender: TObject);
    procedure BottomAlignButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SizeAlignButtonClick(Sender: TObject);
    procedure ColorAlignButtonClick(Sender: TObject);
    procedure VerSpaceButtonClick(Sender: TObject);
    procedure HorSpaceButtonClick(Sender: TObject);
    procedure PackingTableItemClick(Sender: TObject);
    procedure GroupButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure NewButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure SelectedDeleteButtonClick(Sender: TObject);
    procedure AllDeleteButtonClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure ChairCountClick(Sender: TObject);
    procedure TableStyleClick(Sender: TObject);
    procedure ZoomInButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure LetsOrderURLItemClick(Sender: TObject);
    procedure TableNoChangeItemClick(Sender: TObject);
    procedure TableDeleteItemClick(Sender: TObject);
    procedure ComPortOpenButtonClick(Sender: TObject);
    procedure nrComPortAfterReceive(Com: TObject; Buffer: Pointer;
      Received: Cardinal);
    procedure TableKeyItemClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure TabletNoneItemClick(Sender: TObject);
    procedure TabletBorkenItemClick(Sender: TObject);
  private
    CurrentButton  : TPosButton;
    CopyButton     : TPosButton;
    TableNumber    : Integer;
    FloorSEQ       : Integer;
    TableNamePK    : Integer;          //테이블과 벽 상관없이 증가

    SelectButton   : Array of TPosButton;
    isFirstSelect  : Boolean;
    isShift        : Boolean;      //쉬프트키가 눌린상태인지
    isDefaultButton :Boolean;

    inReposition   : Boolean;
    isMultiSelect  : Boolean;
    isWaitFloor    :Boolean;
    NodePositioning: Boolean;
    oldPos: TPoint;
    Nodes: TObjectList;
    CurrentNodeControl: TControl;
    ReadData :String;
    MouseButton: TMouseButton;
    RFReadData :String;
    procedure ButtonAutoCreate;
    procedure ButtonCreate(AValue:TTableButton; aClick:Boolean=true);
    procedure TableButtonClick(Sender: TObject);
    procedure SetPopupMenu;
    procedure FreePopupMenu;
    procedure SetPoupMenuItem(aValue :Boolean);
    function  GetFloorCode:String;
    procedure ButtonAllClear;
    function  GetTableMaxNumber:Integer;
    function  GetFloorMaxSEQ:Integer;
    procedure SetControl(aButton:TPosButton);
    procedure SelectButtonClear;


    procedure CreateNodes;
    procedure PositionNodes(AroundControl: TControl);
    procedure SetNodesVisible(Visible: Boolean);
    procedure NodeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure NodeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure NodeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  protected
    function  DoSave: Boolean; override;                        // 저장
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  CodeTableForm: TCodeTableForm;

implementation
uses Common, Main, Help, DBModule;
{$R *.dfm}

{ TCodeTableForm }

procedure TCodeTableForm.FormCreate(Sender: TObject);
var vIndex :Integer;
    vWidth,
    vHeight,
    vFloorWidth,
    vFloorHeight,
    vBottomHeight :Integer;
    vBottomMode  : Boolean;
begin
  inherited;
  ColorPanel.Visible := false;
  CopyButton  := TPosButton.Create(Self);
  isDefaultButton := false;

  SetLength(SelectButton, 30);

  for vIndex := 0 to High(SelectButton) do
    SelectButton[vIndex] := TPosButton.Create(nil);


  vWidth       := 1024;
  vHeight      := 768;
  vFloorWidth  := 124;
  vFloorHeight := 65;

  try
    OpenQuery('select CD_CODE, NM_CODE1, NM_CODE2, NM_CODE9, NM_CODE10, NM_CODE8, NM_CODE17 '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =''87'' '
             +'   and CD_CODE  in (''300'',''500'') '
             +' order by CD_CODE ',
             [HeadStoreCode,
              StoreCode]);
    while not Query.Eof do
    begin
      if Query.FieldByName('CD_CODE').AsString = '300' then
      begin
        vFloorWidth  := StrToIntDef(Query.FieldByName('NM_CODE10').AsString,124);
        vFloorHeight := StrToIntDef(Query.FieldByName('NM_CODE9').AsString,65);
        if Query.FieldByName('NM_CODE17').AsString =  '1' then
        begin
          vBottomHeight := StrToIntDef(Query.FieldByName('NM_CODE8').AsString,65);
          if vBottomHeight = 0 then
            vBottomHeight := 65;
        end
        else
          vBottomHeight := 0;
      end
      else if Query.FieldByName('CD_CODE').AsString = '500' then
      begin
        vWidth  := StrToIntDef(Query.FieldByName('NM_CODE1').AsString,1024);
        vHeight := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,768);
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  //층을 사용하지 않으면서 기능버튼을 하단에 표시
  if (vBottomHeight > 0) and (GetOption(58)='1') then
     vFloorWidth := 0;

  TablePanel.Width      := vWidth - vFloorWidth - 15;
  if vBottomHeight = 0 then
    TablePanel.Height     := vHeight - 110
  else
    TablePanel.Height     := vHeight - 61 - vBottomHeight;

  RemarkLabel.Top  := TablePanel.Top + TablePanel.Height + 10;
  Remark2Label.Top := RemarkLabel.Top + 30;

  TableNameItem.Visible := GetOption(25)= '1';

  isShift := false;
  TableNamePK := 0;
  if isDebugMode then
    FormStyle := fsMDIChild;
end;

procedure TCodeTableForm.ColorSetButtonClick(Sender: TObject);
begin
  inherited;
  if Sender = ColorSetButton then
    ColorDialog.Color := ColorButton.Color
  else if Sender = NumberColorButton then
    ColorDialog.Color := ColorButton.Number.Color
  else if Sender = FontColorButton then
    ColorDialog.Color := ColorButton.Menu.Font.Color
  else if Sender = BorderColorButton then
    ColorDialog.Color := ColorButton.BorderColor
  else if Sender = BottomColorButton then
    ColorDialog.Color := ColorButton.Bottom.Font.Color;

  if ColorDialog.Execute then
  begin
    if Sender = ColorSetButton then
      ColorButton.Color := ColorDialog.Color
    else if Sender = NumberColorButton then
      ColorButton.Number.Color := ColorDialog.Color
    else if Sender = FontColorButton then
    begin
      ColorButton.Font.Color        := ColorDialog.Color;
      ColorButton.Number.Font.Color := ColorDialog.Color;
      ColorButton.Menu.Font.Color   := ColorDialog.Color;
      ColorButton.Amount.Font.Color := ColorDialog.Color;
    end
    else if Sender = BorderColorButton then
      ColorButton.BorderColor := ColorDialog.Color
    else if Sender = BottomColorButton then
      ColorButton.Bottom.Font.Color := ColorDialog.Color;
    ColorButton.Refresh;
    ColorButton.Update;
  end;
end;

procedure TCodeTableForm.ComPortOpenButtonClick(Sender: TObject);
begin
  inherited;
  if (GetStrPointerData(ConditionToolBarComboBox) = '') or (GetStrPointerData(ConditionToolBarComboBox) = '0')  then
  begin
    MsgBox('포트를 지정하세요');
    Exit;
  end;

  try
    if nrComPort.Active then
    begin
      nrComPort.Active := false;
      ComPortOpenButton.Enabled := true;
      Exit;
    end;

    nrComPort.ComPortNo := StrToInt(GetStrPointerData(ConditionToolBarComboBox));
    nrComPort.BaudRate := 9600;
    nrComPort.Active := true;
    ComPortOpenButton.Enabled := false;
  except
    ErrBox(Format('포트[%s] 실패',[ConditionToolBarComboBox.Text]));
  end;
end;

procedure TCodeTableForm.FloorListBoxClick(Sender: TObject);
var vJpg         :TJPEGImage;
    vStream      :TStream;
    vTablebutton :TTableButton;
begin
  inherited;
  if isLoading then Exit;

  //강제로 이벤트를 발생시킨게 아니면
  if Sender <> nil then
  begin
    TableNumber :=  GetTableMaxNumber-1;
    FloorSEQ    :=  GetFloorMaxSEQ-1;
  end;

  //기존 테이블 버튼 모두삭제
  ButtonAllClear;

  //저장된 테이블 내역 불러오기
  try
    OpenQuery('select a.TABLE_STYLE, '
             +'       a.CD_FLOOR, '
             +'       a.SEQ, '
             +'       a.CHAIR_COUNT, '
             +'       a.NO_TOP, '
             +'       a.NO_LEFT, '
             +'       a.NO_HEIGHT, '
             +'       a.NO_WIDTH, '
             +'       a.NO_TABLE, '
             +'       a.NM_TABLE, '
             +'       a.LETSORDER_URL, '
             +'	      ifnull(a.COLOR,         ''$00C08000'') as COLOR, '
             +'	      ifnull(a.NUMBER_COLOR,  ''$00865A00'') as NUMBER_COLOR, '
             +'	      ifnull(a.FONT_COLOR,    ''clWhite'')   as FONT_COLOR, '
             +'	      ifnull(a.BOTTOM_COLOR,  ''clWhite'')   as BOTTOM_COLOR, '
             +'	      ifnull(a.BORDER_COLOR,  ''$00C08000'')   as BORDER_COLOR, '
             +'	      ifnull(a.COLOR_HEX,     ''$00C08000'') as NOCOLOR, '
             +'	      ifnull(a.FONT_COLOR_HEX,     ''$00C08000'') as FONT_NOCOLOR, '
             +'	      ifnull(a.BORDER_COLOR_HEX,     ''$00C08000'') as BORDER_NOCOLOR, '
             +'       a.YN_PACKING, '
             +'       a.YN_TABLET, '
             +'       a.CD_GROUP, '
             +'       c.NM_CODE2 as FONT_SIZE, '
             +'       c.NM_CODE3, '                                  //주문시 Font.Size
             +'       c.NM_CODE4, '                                  //주문시 Amount.Font.Size
             +'       c.NM_CODE5, '                                  //주문시 Bottom.Font.Size
             +'       c.NM_CODE7, '                                  //미주문 Color
             +'       c.NM_CODE8, '                                  //미주문 BorderColor
             +'       c.NM_CODE9, '                                  //미주문 Font Color
             +'       c.NM_CODE10 as ORDER_FONT_SIZE, '              //미주문 Number Font Size
             +'       c.NM_CODE11, '                                 //주문시 Color
             +'       c.NM_CODE12, '                                 //주문시 BorderColor
             +'       c.NM_CODE13, '                                 //주문시 Font Color
             +'       c.NM_CODE14, '                                 //미주문시 Number.Color
             +'       c.NM_CODE15, '                                 //미주문시 Number.Font.Color
             +'       c.NM_CODE16, '                                 //미주문시 Menu.Font.Color
             +'       c.NM_CODE17, '                                 //미주문시 Amount.Font.Color
             +'       c.NM_CODE18, '                                 //미주문시 Bottom.Font.Color
             +'       c.NM_CODE20, '                                 //렛츠오더 전용여부
             +'       a.OPTIONS, '                                   //1:태블릿 미설치(Y/N), 2:태블릿 고장(Y/N)
             +'       a.NO_RFID '
             +'  from MS_TABLE a left outer join '
             +'       MS_CODE  b on b.CD_HEAD  = a.CD_HEAD '
             +'                 and b.CD_STORE = a.CD_STORE '
             +'                 and b.CD_CODE  = a.CD_GROUP '
             +'                 and b.CD_KIND  = ''25'' inner join '
             +'       MS_CODE  c on c.CD_HEAD  = a.CD_HEAD '
             +'                 and c.CD_STORE = a.CD_STORE '
             +'                 and c.CD_KIND  = ''03'' '
             +'                 and c.CD_CODE  = a.CD_FLOOR '
             +' where a.CD_HEAD = :P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.CD_FLOOR =:P2 '
             +' order by a.NO_TABLE ',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode]);

    DefaultButton.Tag            := 0;
    OrderDefaultButton.Tag       := 0;
    TableNamePK                  := 0;
    while not Query.Eof do
    begin
      New(vTableButton);
      vTableButton^.ChairCount := StrToIntDef(Query.FieldByName('CHAIR_COUNT').AsString,0);
      vTableButton^.Style  := Query.FieldByName('TABLE_STYLE').AsString;
      vTableButton^.Top    := Query.FieldByName('NO_TOP').AsInteger;
      vTableButton^.Left   := Query.FieldByName('NO_LEFT').AsInteger;
      vTableButton^.Height := Query.FieldByName('NO_HEIGHT').AsInteger;
      vTableButton^.Width  := Query.FieldByName('NO_WIDTH').AsInteger;
      vTableButton^.Number := Query.FieldByName('NO_TABLE').AsInteger;
      vTableButton^.Name   := Query.FieldByName('NM_TABLE').AsString;
      if Query.FieldByName('YN_TABLET').AsString = 'N' then
        vTableButton^.Amount := '미설치'
      else if Query.FieldByName('YN_TABLET').AsString = 'B' then
        vTableButton^.Amount := '고장'
      else
        vTableButton^.Amount := '';
      vTableButton^.FontSize := Query.FieldByName('FONT_SIZE').AsInteger;
      vTableButton^.LetsOrderURL := Query.FieldByName('LETSORDER_URL').AsString;

      if Query.FieldByName('COLOR').AsString <> '' then
        vTableButton^.Color        := StringToColorDef(Query.FieldByName('COLOR').AsString, clSkyBlue)
      else
        vTableButton^.Color        := StringToColorDef(Query.FieldByName('NM_CODE11').AsString, clSkyBlue);

      if Query.FieldByName('NUMBER_COLOR').AsString <> '' then
        vTableButton^.NumberColor  := StringToColorDef(Query.FieldByName('NUMBER_COLOR').AsString, clSkyBlue)
      else
        vTableButton^.NumberColor  := StringToColorDef(Query.FieldByName('NM_CODE14').AsString, clSkyBlue);

      if Query.FieldByName('FONT_COLOR').AsString <> '' then
        vTableButton^.FontColor     := StringToColorDef(Query.FieldByName('FONT_COLOR').AsString, clWhite)
      else
        vTableButton^.FontColor     := StringToColorDef(Query.FieldByName('NM_CODE13').AsString, clWhite);

      if Query.FieldByName('BOTTOM_COLOR').AsString <> '' then
        vTableButton^.BottomFontColor     := StringToColorDef(Query.FieldByName('BOTTOM_COLOR').AsString, clWhite)
      else
        vTableButton^.BottomFontColor     := StringToColorDef(Query.FieldByName('NM_CODE18').AsString, clWhite);

      if Query.FieldByName('BORDER_COLOR').AsString <> '' then
        vTableButton^.BorderColor     := StringToColorDef(Query.FieldByName('BORDER_COLOR').AsString, clWhite)
      else
        vTableButton^.BorderColor     := StringToColorDef(Query.FieldByName('NM_CODE12').AsString, clWhite);

      vTableButton^.NoColor      := Query.FieldByName('NOCOLOR').AsString;
      vTableButton^.FontNoColor      := Query.FieldByName('FONT_NOCOLOR').AsString;
      vTableButton^.BorderNoColor      := Query.FieldByName('BORDER_NOCOLOR').AsString;

      vTableButton^.Packing       := Query.FieldByName('YN_PACKING').AsString;

      vTableButton^.Seq           := Query.FieldByName('SEQ').AsInteger;
      vTableButton^.Group         := Query.FieldByName('CD_GROUP').AsString;
      vTableButton^.RFID          := Query.FieldByName('NO_RFID').AsString;
      vTableButton^.Options       := Query.FieldByName('OPTIONS').AsString;
      vTableButton^.Status        := 'Load';

      if Query.FieldByName('SEQ').AsInteger = 0 then
        vTableButton.TableType := 'T'                     // 테이블일때
      else
        vTableButton.TableType := 'W';                     // 벽일때

      if (DefaultButton.Tag = 0) then
      begin
        DefaultButton.Number.Font.Size := StrToIntDef(Query.FieldByName('FONT_SIZE').AsString,8);
        DefaultButton.Color            := StringToColorDef(Query.FieldByName('NM_CODE7').AsString, clSkyBlue);
        DefaultButton.BorderColor      := StringToColorDef(Query.FieldByName('NM_CODE8').AsString, clNone);
        DefaultButton.Font.Color       := StringToColorDef(Query.FieldByName('NM_CODE9').AsString, clWhite);
        DefaultButton.Tag := 1;
      end;

      isWaitFloor := Query.FieldByName('NM_CODE20').AsString = 'Y';

      if (OrderDefaultButton.Tag = 0) then
      begin
        OrderDefaultButton.Font.Size          := StrToIntDef(Query.FieldByName('NM_CODE3').AsString,10);
        OrderDefaultButton.Amount.Font.Size   := StrToIntDef(Query.FieldByName('NM_CODE4').AsString,12);
        OrderDefaultButton.Bottom.Font.Size   := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,8);
        OrderDefaultButton.Color              := StringToColorDef(Query.FieldByName('NM_CODE11').AsString, clSkyBlue);
        OrderDefaultButton.BorderColor        := StringToColorDef(Query.FieldByName('NM_CODE12').AsString, clNone);
        OrderDefaultButton.Font.Color         := StringToColorDef(Query.FieldByName('NM_CODE13').AsString, clWhite);
        OrderDefaultButton.Number.Color       := StringToColorDef(Query.FieldByName('NM_CODE14').AsString, clWhite);
        OrderDefaultButton.Number.Font.Color  := StringToColorDef(Query.FieldByName('NM_CODE15').AsString, clWhite);
        OrderDefaultButton.Menu.Font.Color    := StringToColorDef(Query.FieldByName('NM_CODE16').AsString, clWhite);
        OrderDefaultButton.Amount.Font.Color  := StringToColorDef(Query.FieldByName('NM_CODE17').AsString, clWhite);
        OrderDefaultButton.Bottom.Font.Color  := StringToColorDef(Query.FieldByName('NM_CODE18').AsString, clWhite);

        OrderDefaultButton.Tag := 1;
      end;
      ButtonCreate(vTableButton, false);
      Query.Next;
    end;
  finally
    Query.Close;
  end;

  //층에 버튼이 없을때
  if DefaultButton.Tag = 0 then
  begin
    OpenQuery('select NM_CODE2, '
             +'       NM_CODE3, '
             +'       NM_CODE4, '
             +'       NM_CODE5, '
             +'       NM_CODE7, '
             +'       NM_CODE8, '
             +'       NM_CODE9 '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =''03'' '
             +'   and CD_CODE  =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode]);
    if not Query.Eof then
    begin
      DefaultButton.Number.Font.Size := StrToIntDef(Query.FieldByName('NM_CODE2').AsString,8);
      DefaultButton.Font.Size        := StrToIntDef(Query.FieldByName('NM_CODE3').AsString,10);
      DefaultButton.Amount.Font.Size := StrToIntDef(Query.FieldByName('NM_CODE4').AsString,12);
      DefaultButton.Bottom.Font.Size := StrToIntDef(Query.FieldByName('NM_CODE5').AsString,8);
      DefaultButton.Color       := StringToColorDef(Query.FieldByName('NM_CODE7').AsString, clSkyBlue);
      DefaultButton.BorderColor := StringToColorDef(Query.FieldByName('NM_CODE8').AsString, clNone);
      DefaultButton.Font.Color  := StringToColorDef(Query.FieldByName('NM_CODE9').AsString, clWhite);
    end;
    Query.Close;
  end;
  TableNumber := GetTableMaxNumber;
  FloorSEQ    := GetFloorMaxSEQ;
  SetNodesVisible(False);
  isChanged := false;
end;

procedure TCodeTableForm.ButtonAutoCreate;
var vIndex,
    vIndex1,
    vHeight,
    vWidth  :Integer;
    vTableButton :TTableButton;
begin
  vWidth  := TablePanel.Width  div HorizontalEdit.Value - (HorizontalEdit.Value-1) ;
  vHeight := TablePanel.Height div VertialEdit.Value - (VertialEdit.Value-1);

  For vIndex := 0 to VertialEdit.Value-1 do
  begin
    For vIndex1 := 0 to HorizontalEdit.Value-1 do
    begin
      with TPosButton.Create(Self) do
      begin
        Parent              := TablePanel;
        Height              := vHeight;
        Width               := vWidth;
        Left                := 3 + (vIndex1  * vWidth)  + (vIndex1 * 3);
        Top                 := 3 + (vIndex   * vHeight) + (vIndex  * 3);
        TableNamePK         := TableNamePK + 1;
        TableNumber         := TableNumber + 1;
        Number.Number       := TableNumber;
        Number.Font.Size    := DefaultButton.Number.Font.Size;
        Number.Font.Name    := '맑은 고딕';
        Number.Height       := Trunc(Height * 0.2);
        Style               := bsRound;

        Font.Size           := 12;
        Font.Name           := '맑은 고딕';
        Font.Color          := OrderDefaultButton.Font.Color;
        OnMouseDown         := ControlMouseDown;
        OnMouseMove         := ControlMouseMove;
        OnMouseUp           := ControlMouseUp;

        Amount.Caption      := '';
        Tag                 := 0;
        Color               := OrderDefaultButton.Color;                                   //주문시
        BorderColor         := OrderDefaultButton.BorderColor;                             //주문시
        BorderInnerColor    := clNone;                                                //주문시

        Number.Color        := OrderDefaultButton.Number.Color;
        Number.Font.Color   := OrderDefaultButton.Number.Font.Color;
        Menu.Font.Color     := OrderDefaultButton.Menu.Font.Color;
        Amount.Font.Color   := OrderDefaultButton.Amount.Font.Color;
        Bottom.Font.Color   := OrderDefaultButton.Bottom.Font.Color;

        Temp8       := 'New';
        Bottom.RightString  := '';
        Name := Format('Table%d',[TableNamePK]);
        Number.ShowNumber := true;
        Temp1 := IntToStr(TableNumber);
        if GetOption(25) = '1' then // 테이블 명으로 사용
          Caption:= Temp1;

        Temp2               := ColorToString(DefaultButton.Number.Color);        //미문시 Number 색상
        Temp3               := ColorToString(DefaultButton.Color);               //미주문시 색상
        Number.NumberString := IntToStr(TableNumber);
        Bottom.CenterString := '';
        Bottom.LeftString   := '';
        Bottom.Font.Size    := DefaultButton.Bottom.Font.Size;
        Bottom.Font.Name    := '맑은 고딕';
        Hint                := Format('%-30.30',['N']);
        Onclick             := TableButtonClick;
        PopupMenu := ButtonPopupMenu;
      end;
    end;
  end;
end;

procedure TCodeTableForm.ButtonAllClear;
var vIndex :Integer;
label go;
begin
  go:
  For vIndex := 0 to MainPanel.Parent.ComponentCount-1 do
  begin
    if (Components[vIndex] is TPosButton) then
    begin
       if ((Components[vIndex] as TPosButton).Name = 'OrderDefaultButton') or ((Components[vIndex] as TPosButton).Name = 'DefaultButton')  or ((Components[vIndex] as TPosButton).Name = 'ColorButton') then Continue;
      (Components[vIndex] as TPosButton).Free;
      Goto go;
    end;
  end;

  SetNodesVisible(false);
end;

procedure TCodeTableForm.ButtonCreate(aValue: TTableButton; aClick:Boolean);
var
  vTableButton : TPosButton;
begin
  TableNamePK := TableNamePK + 1;
  vTableButton := TPosButton.Create(Self);
  with vTableButton do
  begin
     Parent            := TablePanel;
     Number.CenterString := Ifthen(aValue^.ChairCount=0,'',IntToStr(aValue^.ChairCount)+'명');
     if aValue^.Style = 'C' then
       Bottom.CenterString := '원형'
     else
       Bottom.CenterString := '';
     Top               := aValue^.Top;
     Left              := aValue^.Left;
     Height            := aValue^.Height;
     Width             := aValue^.Width;
     Number.Number     := aValue^.Number;
     Number.Font.Size  := DefaultButton.Font.Size;
     Number.Font.Name  := '맑은 고딕';
     Number.RightString  := aValue^.Amount;
     Amount.Font.Size  := DefaultButton.Amount.Font.Size;
     Number.Height     := Trunc(aValue^.Height * 0.2);
     Bottom.Height     := Trunc(aValue^.Height * 0.15);
     Number.Font.Size  := DefaultButton.Number.Font.Size;
     Bottom.Font.Size  := DefaultButton.Bottom.Font.Size;
     Bottom.Font.Name  := '맑은 고딕';

     Onclick           := TableButtonClick;
     Font.Size         := DefaultButton.Font.Size+2;
     Font.Name         := '맑은 고딕';
     Font.Color        := aValue^.FontColor;
     OnMouseDown       := ControlMouseDown;
     OnMouseMove       := ControlMouseMove;
     OnMouseUp         := ControlMouseUp;

     if aValue^.TableType = 'T' then
     begin
       Style            := bsRound;
       BorderStyle      := pbsSingle;
       if aValue^.Name = '' then
         Temp1 := IntToStr(aValue^.Number)
       else
         Temp1 := aValue^.Name;
       if GetOption(25) = '1' then // 테이블 명으로 사용
       begin
         vTableButton.Caption           := Temp1;
         vTableButton.Number.ShowNumber := GetStoreOption(9) = '1';
       end
       else
         vTableButton.Number.ShowNumber := true;
       if aValue.ChairCount > 0 then
         vTableButton.Number.CenterString := Format('%d명',[aValue.ChairCount]);
     end
     else
     begin
       Style             := bsRect;
       BorderStyle       := pbsNone;
       Temp1             := aValue^.Name;
       Number.ShowNumber := false;
       Caption           := Temp1
     end;
     Name              := Format('Table%d',[TableNamePK]);

     //테이블 색상지정
     Color               := aValue^.Color;
     BorderColor         := aValue^.BorderColor;
     Number.Color        := aValue^.NumberColor;
     Temp2               := ColorToString(aValue^.NumberColor);
     Temp3               := aValue^.NoColor;
     Temp4               := aValue^.FontNoColor;
     Temp5               := aValue^.BorderNoColor;
     BorderInnerColor    := clNone;
     Bottom.LeftString   := '';
     Number.Font.Color   := aValue^.FontColor;
     Menu.Font.Color     := aValue^.FontColor;
     Amount.Font.Color   := aValue^.FontColor;
     Bottom.Font.Color   := aValue^.BottomFontColor;
     Temp7               := '';
     Temp8               := aValue^.Status;
     Temp9               := ColorToString(aValue^.Color);
     Temp10              := aValue^.LetsOrderURL;
     Amount.Caption      := aValue^.RFID;
     Hint                := aValue^.Options;
     Selected            := false;
     if aValue^.Packing='Y' then
       Bottom.RightString  := '포장';

     if isWaitFloor and (Temp10 <> '') then
       Bottom.RightString  := 'QR';

     Bottom.LeftString   := aValue^.Group;
     //벽일때
     if Number.Number = 0 then
     begin
       Bottom.Height       := 0;
       Bottom.CenterString := '';
     end;

     PopupMenu           := ButtonPopupMenu;
  end;
  if aClick then
    TableButtonClick(vTableButton);
end;

procedure TCodeTableForm.ButtonPopupMenuPopup(Sender: TObject);
begin
  inherited;
  if not isMultiSelect and (CurrentButton <>  TPosButton(ButtonPopupMenu.PopupComponent)) then
    CurrentButton   := TPosButton(ButtonPopupMenu.PopupComponent);

  TabletBorkenItem.Visible := GetStoreOption(9) = '1';
  TabletNoneItem.Visible   := GetStoreOption(9) = '1';

  if ButtonPopupMenu.PopupComponent is TPosButton then
  begin
    TableNameItem.Enabled      := not isMultiSelect;
    TableNoChangeItem.Enabled  := not isMultiSelect and (TPosButton(ButtonPopupMenu.PopupComponent).Number.Number > 0);
    ColorCopyItem.Enabled      := not isMultiSelect;
    SizeCopyItem.Enabled       := not isMultiSelect;
    ColorPasteItem.Enabled     := not isMultiSelect;
    SizeTopPasteItem.Enabled   := not isMultiSelect;
    SizeLeftPasteItem.Enabled  := not isMultiSelect;
    PackingTableItem.Enabled   := not isMultiSelect;
    TableKeyItem.Enabled       := not isMultiSelect;
    OrderColorItem.Enabled     := true;
    NoOrderColorItem.Enabled   := true;
    TableDeleteItem.Enabled    := not isMultiSelect;
    ChairCount.Enabled         := TPosButton(ButtonPopupMenu.PopupComponent).Number.Number > 0;
    TableStyle.Enabled         := TPosButton(ButtonPopupMenu.PopupComponent).Number.Number > 0;
    PackingTableItem.Enabled   := TPosButton(ButtonPopupMenu.PopupComponent).Number.Number > 0;
    TabletNoneItem.Enabled     := TPosButton(ButtonPopupMenu.PopupComponent).Number.Number > 0;;
    TabletBorkenItem.Enabled   := TPosButton(ButtonPopupMenu.PopupComponent).Number.Number > 0;;

    if isMultiSelect and (MouseButton = mbRight) then Exit;
    TableButtonClick(TPosButton(ButtonPopupMenu.PopupComponent));
  end
  else
  begin
    TableDeleteItem.Enabled    := false;
    ChairCount.Enabled         := false;
    TableStyle.Enabled         := false;
    OrderColorItem.Enabled     := false;
    ColorPasteItem.Enabled     := false;
    NoOrderColorItem.Enabled     := false;
    TableNameItem.Enabled      := false;
    TableNoChangeItem.Enabled  := false;
    ColorCopyItem.Enabled      := false;
    SizeCopyItem.Enabled       := false;
    ColorPasteItem.Enabled     := false;
    SizeTopPasteItem.Enabled   := false;
    SizeLeftPasteItem.Enabled  := false;
    PackingTableItem.Enabled   := false;
    TabletNoneItem.Enabled     := false;
    TabletBorkenItem.Enabled   := false;
    TableKeyItem.Enabled       := false;
    Exit;
  end;
end;

procedure TCodeTableForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if ZoomInButton.Tag > 0 then
  begin
    while ZoomInButton.Tag > 0 do
      ZoomInButtonClick(ZoomOutButton);
  end
  else if ZoomOutButton.Tag > 0 then
  begin
    while ZoomOutButton.Tag > 0 do
      ZoomInButtonClick(ZoomInButton);
  end;

  SetNodesVisible(False);
  DoSave;
  isChanged := false;
end;

procedure TCodeTableForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  SetPopupMenu;
  ColorPanel.Visible     := False;
  isDefaultButton        := False;
  SetPoupMenuItem(true);
  TablePanel.BringToFront;
end;

procedure TCodeTableForm.ChairCountClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if CurrentButton = nil then Exit;

  if InputQuery('좌석수 입력', '좌석수를 입력하세요', vTemp) then
  begin
    (CurrentButton as TPosButton).Number.CenterString := vTemp+'명';
    (CurrentButton as TPosButton).Refresh;
  end
  else Exit;

  SetPopupMenu;
  isChanged := true;
end;

procedure TCodeTableForm.CloseButtonClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TCodeTableForm.ColorCopyItemClick(Sender: TObject);
begin
  inherited;
  CopyButton := CurrentButton;
  ColorPasteItem.Enabled     := True;
  SizeTopPasteItem.Enabled   := false;
  SizeLeftPasteItem.Enabled  := false;
end;

procedure TCodeTableForm.ColorPasteItemClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if isMultiSelect then
  begin
    for vIndex := 0 to High(SelectButton) do
    begin
      if SelectButton[vIndex] is TPosButton then
      begin
        if not TPosButton(SelectButton[vIndex]).Selected then Continue;
        TPosButton(SelectButton[vIndex]).Color             := CopyButton.Font.Color;
        TPosButton(SelectButton[vIndex]).Font.Color        := CopyButton.Color;
        TPosButton(SelectButton[vIndex]).Color             := CopyButton.Color;
        TPosButton(SelectButton[vIndex]).BorderColor       := CopyButton.BorderColor;
        TPosButton(SelectButton[vIndex]).Number.Color      := CopyButton.Number.Color;
        TPosButton(SelectButton[vIndex]).Number.Font.Color := CopyButton.Number.Font.Color;
        TPosButton(SelectButton[vIndex]).Menu.Font.Color   := CopyButton.Menu.Font.Color;
        TPosButton(SelectButton[vIndex]).Amount.Font.Color := CopyButton.Amount.Font.Color;
        TPosButton(SelectButton[vIndex]).Bottom.Font.Color := CopyButton.Bottom.Font.Color;
        TPosButton(SelectButton[vIndex]).Temp2 := CopyButton.Temp2;
        TPosButton(SelectButton[vIndex]).Temp3 := CopyButton.Temp3;
        TPosButton(SelectButton[vIndex]).Temp4 := CopyButton.Temp4;
        TPosButton(SelectButton[vIndex]).Temp5 := CopyButton.Temp5;
        TPosButton(SelectButton[vIndex]).Temp6 := CopyButton.Temp6;
        TPosButton(SelectButton[vIndex]).Repaint;
      end;
    end;

  end
  else
  begin
    CurrentButton.Color             := CopyButton.Color;
    CurrentButton.Font.Color        := CopyButton.Font.Color;
    CurrentButton.BorderColor       := CopyButton.BorderColor;
    CurrentButton.Number.Color      := CopyButton.Number.Color;
    CurrentButton.Number.Font.Color := CopyButton.Number.Font.Color;
    CurrentButton.Menu.Font.Color   := CopyButton.Menu.Font.Color;
    CurrentButton.Amount.Font.Color := CopyButton.Amount.Font.Color;
    CurrentButton.Bottom.Font.Color := CopyButton.Bottom.Font.Color;
    CurrentButton.Temp2 := CopyButton.Temp2;
    CurrentButton.Temp3 := CopyButton.Temp3;
    CurrentButton.Temp4 := CopyButton.Temp4;
    CurrentButton.Temp5 := CopyButton.Temp5;
    CurrentButton.Temp6 := CopyButton.Temp6;
    CurrentButton.Repaint;
  end;
  isChanged := true;
end;

procedure TCodeTableForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ComPortOpenButton.Enabled := true;
end;

procedure TCodeTableForm.ControlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TControl) then
  begin
    MouseButton := Button;
    if isMultiSelect and (Button = mbRight) then Exit;

    inReposition:=True;
    GetCursorPos(oldPos);
    PositionNodes(TControl(Sender));
  end;
end;

procedure TCodeTableForm.ControlMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos: TPoint;
  frmPoint : TPoint;
begin
  if inReposition then
  begin
    with TControl(Sender) do
    begin
      GetCursorPos(newPos);
      Screen.Cursor := crSize;
      Left   := Left - oldPos.X + newPos.X;
      Top    := Top - oldPos.Y + newPos.Y;
      oldPos := newPos;
    end;
    PositionNodes(TControl(Sender));
    isChanged := True;
  end;
end;

procedure TCodeTableForm.ControlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if isMultiSelect and (Button = mbRight) then Exit;
  if inReposition then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    inReposition := False;
  end;
end;

constructor TCodeTableForm.Create(AOwner: TComponent);
begin
  inherited;
  Nodes := TObjectList.Create(False);
  CreateNodes;
end;

procedure TCodeTableForm.CreateButtonClick(Sender: TObject);
  function GetButtonCount:Integer;
  var vIndex :Integer;
  begin
    Result := 0;
    For vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel) then
      begin
        Result := Result + 1;
      end;
    end;
  end;
begin
  inherited;
  if GetButtonCount > 0 then
  begin
    MsgBox('전체삭제를 하고 다시 생성하세요');
    Exit;
  end;
  HorizontalEdit.PostEditValue;
  VertialEdit.PostEditValue;

  TableNumber := GetTableMaxNumber;
  FloorSEQ    := GetFloorMaxSEQ;
  ButtonAutoCreate;
  isChanged := true;
end;

procedure TCodeTableForm.CreateNodes;
var
  vNode: Integer;
  vPanel: TPanel;
begin
  for vNode := 0 to 7 do
  begin
    vPanel := TPanel.Create(Self);
    Nodes.Add(vPanel);
    with vPanel do
    begin
      BevelOuter := bvNone;
      Color   := clBlack;
      Name    := 'Node' + IntToStr(vNode);
      Width   := 5;
      Height  := 5;
      Parent  := Self;
      Visible := False;

      case vNode of
        0,4: Cursor := crSizeNWSE;
        1,5: Cursor := crSizeNS;
        2,6: Cursor := crSizeNESW;
        3,7: Cursor := crSizeWE;
      end;
      OnMouseDown := NodeMouseDown;
      OnMouseMove := NodeMouseMove;
      OnMouseUp   := NodeMouseUp;
    end;
  end;
end;

procedure TCodeTableForm.DefaultButtonClick(Sender: TObject);
var vPoint:TPoint;
begin
  inherited;
  CurrentButton := (Sender as TPosButton);
  CopyButton    := DefaultButton;
  isDefaultButton := true;
  SetPoupMenuItem(false);
  OrderColorItemClick(Sender);
end;

destructor TCodeTableForm.Destroy;
begin
  Nodes.Free;
  inherited;
end;

function TCodeTableForm.DoSave: Boolean;
var vIndex,
    vSeq :Integer;
    vTemp, vSQL, vColor, vTablet, vTid, vSerialNo :String;
begin
  SelectButtonClear;

  try
    ExecQuery('update MS_CODE '
             +'   set NM_CODE7  = :P3, '
             +'       NM_CODE8  = :P4, '
             +'       NM_CODE9  = :P5, '     //10은 미주문시 테이블번호 폰트 크기
             +'       NM_CODE11 = :P6, '
             +'       NM_CODE12 = :P7, '
             +'       NM_CODE13 = :P8, '
             +'       NM_CODE14 = :P9, '
             +'       NM_CODE15 = :P10, '
             +'       NM_CODE16 = :P11, '
             +'       NM_CODE17 = :P12, '
             +'       NM_CODE18 = :P13 '
             +' where CD_HEAD   = :P0 '
             +'   and CD_STORE  = :P1 '
             +'   and CD_KIND   =''03'' '
             +'   and CD_CODE   = :P2;',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode,                                                  //2
              ColorToString(DefaultButton.Color),                            //3
              ColorToString(DefaultButton.BorderColor),                      //4
              ColorToString(DefaultButton.Font.Color),                       //5
              ColorToString(OrderDefaultButton.Color),                       //6
              ColorToString(OrderDefaultButton.BorderColor),                 //7
              ColorToString(OrderDefaultButton.Font.Color),                  //8
              ColorToString(OrderDefaultButton.Number.Color),                //9
              ColorToString(OrderDefaultButton.Number.Font.Color),           //10
              ColorToString(OrderDefaultButton.Menu.Font.Color),             //11
              ColorToString(OrderDefaultButton.Amount.Font.Color),           //12
              ColorToString(OrderDefaultButton.Bottom.Font.Color)],false);   //13

    ExecQuery('delete from MS_TABLE_TEMP '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_FLOOR =:P2;',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode],false);

    vSQL := '';
    vSeq := FloorSEQ;
    For vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and  ((Components[vIndex] as TPosButton).Parent = TablePanel) then
      begin
        if (Components[vIndex] as TPosButton).Number.Number = 0 then
          Inc(vSeq);

        if (Components[vIndex] as TPosButton).Bottom.RightString='포장' then
          vTemp := 'Y'
        else
          vTemp := 'N';

        //미주문시 테이블 색상과 Font 색상이 같을때
        if (Components[vIndex] as TPosButton).Temp3 = (Components[vIndex] as TPosButton).Temp4 then
          vColor := 'clBlack'
        else
          vColor := (Components[vIndex] as TPosButton).Temp4;

        if (Components[vIndex] as TPosButton).Number.RightString = '고장' then
          vTablet := 'B'
        else if (Components[vIndex] as TPosButton).Number.RightString = '미설치' then
          vTablet := 'N'
        else
          vTablet := 'Y';

        if not VanData.Eof and VanData.Locate('TableNo', (Components[vIndex] as TPosButton).Number.Number, [loCaseInsensitive] ) then
        begin
          vTid      := VanData.FieldByName('TID').AsString;
          vSerialNo := VanData.FieldByName('SerialNo').AsString;
        end
        else
        begin
          vTid      := '';
          vSerialNo := '';
        end;


        vSQL := vSQL + Format('(''%s'',''%s'',%d,%d,''%s'',%d,%d,%d,%d,%d,'
                               +' ''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'','
                               +' ''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s''),',
                               [HeadStoreCode,
                                StoreCode,
                                (Components[vIndex] as TPosButton).Number.Number,
                                Ifthen((Components[vIndex] as TPosButton).Number.Number > 0,0,vSeq),
                                GetFloorCode,                                                                                                 //CD_FLOOR
                                StrToIntDef(GetOnlyNumber((Components[vIndex] as TPosButton).Number.CenterString),0),                         //CHAIR_COUNT
                                Ifthen((Components[vIndex] as TPosButton).Left < 0, 0, (Components[vIndex] as TPosButton).Left),              //NO_LEFT, '
                                Ifthen((Components[vIndex] as TPosButton).Top < 0, 0,  (Components[vIndex] as TPosButton).Top),               //NO_TOP, '
                                Ifthen((Components[vIndex] as TPosButton).Height < 0, 0, (Components[vIndex] as TPosButton).Height),          //NO_HEIGHT, '
                                Ifthen((Components[vIndex] as TPosButton).Width < 0, 0, (Components[vIndex] as TPosButton).Width),            //NO_WIDTH, '
                                (Components[vIndex] as TPosButton).Temp1,                                                                     //NM_TABLE
                                ColorToString((Components[vIndex] as TPosButton).Color),                                                      //COLOR, '
                                ColorToString((Components[vIndex] as TPosButton).Number.Color),                                               //NUMBER_COLOR, '
                                ColorToString((Components[vIndex] as TPosButton).Menu.Font.Color),                                            //FONT_COLOR, '
                                ColorToString((Components[vIndex] as TPosButton).Bottom.Font.Color),                                          //BOTTOM_COLOR, '
                                ColorToString((Components[vIndex] as TPosButton).BorderColor),                                                //BORDER_COLOR, '
                                (Components[vIndex] as TPosButton).Temp3,                                                                                                       //COLOR_HEX, '
                                TColorToHex((Components[vIndex] as TPosButton).Number.Color),                                                 //NUMBER_COLOR_HEX, '
                                vColor,                                                                                                       //FONT_COLOR_HEX, '
                                (Components[vIndex] as TPosButton).Temp5,                                                                     //BORDER_COLOR_HEX, '
                                vTemp,                                                                                                        //YN_PACKING, '
                                vTablet,                                                                                                      //YN_TABLET
                                (Components[vIndex] as TPosButton).Bottom.LeftString,                                                         //CD_GROUP, '
                                Ifthen((Components[vIndex] as TPosButton).Bottom.CenterString='원형','C','R'),                                //TABLE_STYLE
                                (Components[vIndex] as TPosButton).Temp10,
                                (Components[vIndex] as TPosButton).Amount.Caption,
                                (Components[vIndex] as TPosButton).Hint,
                                vTid,
                                vSerialNo]);
      end;
    end;

    vSQL := 'insert into MS_TABLE_TEMP(CD_HEAD, '
           +'                          CD_STORE, '
           +'                          NO_TABLE, '
           +'                          SEQ, '
           +'                          CD_FLOOR, '
           +'                          CHAIR_COUNT, '
           +'                          NO_LEFT, '
           +'                          NO_TOP, '
           +'                          NO_HEIGHT, '
           +'                          NO_WIDTH, '
           +'                          NM_TABLE, '
           +'                          COLOR, '
           +'                          NUMBER_COLOR, '
           +'                          FONT_COLOR, '
           +'                          BOTTOM_COLOR, '
           +'                          BORDER_COLOR, '
           +'                          COLOR_HEX, '
           +'                          NUMBER_COLOR_HEX, '
           +'                          FONT_COLOR_HEX, '
           +'                          BORDER_COLOR_HEX, '
           +'                          YN_PACKING, '
           +'                          YN_TABLET, '
           +'                          CD_GROUP, '
           +'                          TABLE_STYLE, '
           +'                          LETSORDER_URL, '
           +'                          NO_RFID, '
           +'                          OPTIONS, '
           +'                          VAN_TID, '
           +'                          VAN_SERIAL) values '
           +LeftStr(vSQL,Length(vSQL)-1)+';';

    vSQL := vSQL + Format('update MS_TABLE_TEMP inner join '
                         +'       MS_TABLE as t on t.CD_HEAD  = MS_TABLE_TEMP.CD_HEAD '
                         +'                    and t.CD_STORE = MS_TABLE_TEMP.CD_STORE '
                         +'                    and t.CD_FLOOR = MS_TABLE_TEMP.CD_FLOOR '
                         +'                    and t.NO_TABLE = MS_TABLE_TEMP.NO_TABLE '
                         +'   set MS_TABLE_TEMP.VAN_TID    = t.VAN_TID, '
                         +'       MS_TABLE_TEMP.VAN_SERIAL = t.VAN_SERIAL '
                         +' where MS_TABLE_TEMP.CD_HEAD  =''%s'' '
                         +'   and MS_TABLE_TEMP.CD_STORE =''%s'' '
                         +'   and MS_TABLE_TEMP.CD_FLOOR =''%s'';',
                         [HeadStoreCode,
                          StoreCode,
                          GetFloorCode]);

    ExecQuery(vSQL,[],false);


    ExecQuery('delete d '
             +'  from MS_TABLE d inner join '
             +'      (select NO_TABLE, SEQ '
             +'         from MS_TABLE '
             +'        where not exists (select * '
             +'                           from MS_TABLE_TEMP '
             +'                          where MS_TABLE.CD_HEAD  = MS_TABLE_TEMP.CD_HEAD '
             +'        	                  and MS_TABLE.CD_STORE = MS_TABLE_TEMP.CD_STORE '
             +'        	               		and MS_TABLE.NO_TABLE = MS_TABLE_TEMP.NO_TABLE '
             +'        	               		and MS_TABLE.SEQ      = MS_TABLE_TEMP.SEQ '
             +'        	               		and MS_TABLE.CD_FLOOR = MS_TABLE_TEMP.CD_FLOOR ) '
             +'          and CD_HEAD  = :P0 '
             +'          and CD_STORE = :P1 '
             +'          and CD_FLOOR = :P2) as e on e.NO_TABLE = d.NO_TABLE and e.SEQ = d.SEQ '
             +'        where d.CD_HEAD  = :P0 '
             +'          and d.CD_STORE = :P1 '
             +'          and d.CD_FLOOR = :P2 '
             +'          and d.NO_TABLE not in (select NO_TABLE '
             +'                                   from SL_ORDER_H '
             +'                                  where CD_HEAD  =:P0 '
             +'                                    and CD_STORE =:P1 '
             +'                                    and DS_ORDER =''T'');',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode],false);

    ExecQuery('insert into MS_TABLE(CD_HEAD, '
             +'                    CD_STORE, '
             +'                    NO_TABLE, '
             +'                    SEQ, '
             +'                    CD_FLOOR, '
             +'                    CHAIR_COUNT, '
             +'                    NO_LEFT, '
             +'                    NO_TOP, '
             +'                    NO_HEIGHT, '
             +'                    NO_WIDTH, '
             +'                    NM_TABLE, '
             +'                    COLOR, '
             +'                    NUMBER_COLOR, '
             +'                    FONT_COLOR, '
             +'                    BOTTOM_COLOR, '
             +'                    BORDER_COLOR, '
             +'                    COLOR_HEX, '
             +'                    NUMBER_COLOR_HEX, '
             +'                    FONT_COLOR_HEX, '
             +'                    BORDER_COLOR_HEX, '
             +'                    YN_PACKING, '
             +'                    YN_TABLET, '
             +'                    CD_GROUP, '
             +'                    TABLE_STYLE, '
             +'                    LETSORDER_URL, '
             +'                    NO_RFID, '
             +'                    OPTIONS, '
             +'                    VAN_TID, '
             +'                    VAN_SERIAL, '
             +'                    RUSTDESK_ID) '
             +'           select   CD_HEAD, '
             +'                    CD_STORE, '
             +'                    NO_TABLE, '
             +'                    SEQ, '
             +'                    CD_FLOOR, '
             +'                    CHAIR_COUNT, '
             +'                    NO_LEFT, '
             +'                    NO_TOP, '
             +'                    NO_HEIGHT, '
             +'                    NO_WIDTH, '
             +'                    NM_TABLE, '
             +'                    COLOR, '
             +'                    NUMBER_COLOR, '
             +'                    FONT_COLOR, '
             +'                    BOTTOM_COLOR, '
             +'                    BORDER_COLOR, '
             +'                    COLOR_HEX, '
             +'                    NUMBER_COLOR_HEX, '
             +'                    FONT_COLOR_HEX, '
             +'                    BORDER_COLOR_HEX, '
             +'                    YN_PACKING, '
             +'                    YN_TABLET, '
             +'                    CD_GROUP, '
             +'                    TABLE_STYLE, '
             +'                    LETSORDER_URL, '
             +'                    NO_RFID, '
             +'                    OPTIONS, '
             +'                    VAN_TID, '
             +'                    VAN_SERIAL, '
             +'                    RUSTDESK_ID '
             +'               from (select CD_HEAD, '
             +'                            CD_STORE, '
             +'                            NO_TABLE, '
             +'                            SEQ, '
             +'                            CD_FLOOR, '
             +'                            CHAIR_COUNT, '
             +'                            NO_LEFT, '
             +'                            NO_TOP, '
             +'                            NO_HEIGHT, '
             +'                            NO_WIDTH, '
             +'                            NM_TABLE, '
             +'                            COLOR, '
             +'                            NUMBER_COLOR, '
             +'                            FONT_COLOR, '
             +'                            BOTTOM_COLOR, '
             +'                            BORDER_COLOR, '
             +'                            COLOR_HEX, '
             +'                            NUMBER_COLOR_HEX, '
             +'                            FONT_COLOR_HEX, '
             +'                            BORDER_COLOR_HEX, '
             +'                            YN_PACKING, '
             +'                            YN_TABLET, '
             +'                            CD_GROUP, '
             +'                            TABLE_STYLE, '
             +'                            LETSORDER_URL, '
             +'                            NO_RFID, '
             +'                            OPTIONS, '
             +'                            VAN_TID, '
             +'                            VAN_SERIAL, '
             +'                            RUSTDESK_ID '
             +'                       from MS_TABLE_TEMP '
             +'                      where CD_HEAD  =:P0 '
             +'                        and CD_STORE =:P1 '
             +'                        and CD_FLOOR =:P2 ) as t '
             +' ON DUPLICATE KEY UPDATE CHAIR_COUNT       = t.CHAIR_COUNT, '
             +'                         NO_LEFT           = t.NO_LEFT, '
             +'                         NO_TOP            = t.NO_TOP, '
             +'                         NO_HEIGHT         = t.NO_HEIGHT, '
             +'                         NO_WIDTH          = t.NO_WIDTH, '
             +'                         NM_TABLE          = t.NM_TABLE, '
             +'                         COLOR             = t.COLOR, '
             +'                         NUMBER_COLOR      = t.NUMBER_COLOR, '
             +'                         FONT_COLOR        = t.FONT_COLOR, '
             +'                         BOTTOM_COLOR      = t.BOTTOM_COLOR, '
             +'                         BORDER_COLOR      = t.BORDER_COLOR, '
             +'                         COLOR_HEX         = t.COLOR_HEX, '
             +'                         NUMBER_COLOR_HEX  = t.NUMBER_COLOR_HEX, '
             +'                         FONT_COLOR_HEX    = t.FONT_COLOR_HEX, '
             +'                         BORDER_COLOR_HEX  = t.BORDER_COLOR_HEX, '
             +'                         YN_PACKING        = t.YN_PACKING, '
             +'                         YN_TABLET         = t.YN_TABLET, '
             +'                         CD_GROUP          = t.CD_GROUP, '
             +'                         TABLE_STYLE       = t.TABLE_STYLE, '
             +'                         LETSORDER_URL     = t.LETSORDER_URL, '
             +'                         NO_RFID           = t.NO_RFID, '
             +'                         OPTIONS           = t.OPTIONS, '
             +'                         VAN_TID           = t.VAN_TID, '
             +'                         VAN_SERIAL        = t.VAN_SERIAL, '
             +'                         RUSTDESK_ID       = t.RUSTDESK_ID;',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode],false);

    Result := ExecQuery('delete from MS_TABLE_TEMP '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1 '
                       +'   and CD_FLOOR =:P2;',
                       [HeadStoreCode,
                        StoreCode,
                        GetFloorCode],true);

    ExtremeMainForm.PosSendMessage;
  except
    on E: Exception do begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TCodeTableForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  Sleep(100);
  isLoading := false;
  FloorListBox.ItemIndex := 0;
  if FloorListBox.Items.Count = 0 then
  begin
    ControlPanel.Enabled := false;
    FloorListBox.Enabled := false;
  end
  else
    FloorListBoxClick(FloorListBox);
  isChanged   := False;
  Application.ProcessMessages;
end;

procedure TCodeTableForm.OkButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if isMultiSelect then
  begin
    for vIndex := 0 to High(SelectButton) do
    begin
      if SelectButton[vIndex] is TPosButton then
      begin
        if not TPosButton(SelectButton[vIndex]).Selected then Continue;
        if ColorPanel.Tag = 2 then
        begin
          TPosButton(SelectButton[vIndex]).Temp3               := ColorToString(ColorButton.Color);
          TPosButton(SelectButton[vIndex]).Temp4               := ColorToString(ColorButton.Font.Color);
          TPosButton(SelectButton[vIndex]).Temp5               := ColorToString(ColorButton.BorderColor);
          TPosButton(SelectButton[vIndex]).Refresh;
        end
        else
        begin
          TPosButton(SelectButton[vIndex]).Color               := ColorButton.Color;
          TPosButton(SelectButton[vIndex]).BorderColor         := ColorButton.BorderColor;
          TPosButton(SelectButton[vIndex]).Number.Color        := ColorButton.Number.Color;
          TPosButton(SelectButton[vIndex]).Number.Font.Color   := ColorButton.Number.Font.Color;
          TPosButton(SelectButton[vIndex]).Menu.Font.Color     := ColorButton.Menu.Font.Color;
          TPosButton(SelectButton[vIndex]).Amount.Font.Color   := ColorButton.Amount.Font.Color;
          TPosButton(SelectButton[vIndex]).Bottom.Font.Color   := ColorButton.Bottom.Font.Color;
          TPosButton(SelectButton[vIndex]).Temp9               := ColorToString(ColorButton.Color);
          TPosButton(SelectButton[vIndex]).Refresh;
        end;
      end;
    end;
  end
  else
  begin
    //미주문시 색상 변경시(테이블지정)
    if ColorPanel.Tag = 2 then
    begin
      (CurrentButton as TPosButton).Temp3               := ColorToString(ColorButton.Color);
      (CurrentButton as TPosButton).Temp4               := ColorToString(ColorButton.Font.Color);
      (CurrentButton as TPosButton).Temp5               := ColorToString(ColorButton.BorderColor);
      (CurrentButton as TPosButton).Refresh;
    end
    else if ColorPanel.Tag = 0 then
    begin
      (CurrentButton as TPosButton).Color               := ColorButton.Color;
      (CurrentButton as TPosButton).BorderColor         := ColorButton.BorderColor;
      (CurrentButton as TPosButton).Font.Color          := ColorButton.Font.Color;
      (CurrentButton as TPosButton).Number.Color        := ColorButton.Number.Color;
      (CurrentButton as TPosButton).Number.Font.Color   := ColorButton.Number.Font.Color;
      (CurrentButton as TPosButton).Menu.Font.Color     := ColorButton.Menu.Font.Color;
      (CurrentButton as TPosButton).Amount.Font.Color   := ColorButton.Amount.Font.Color;
      (CurrentButton as TPosButton).Bottom.Font.Color   := ColorButton.Bottom.Font.Color;
      (CurrentButton as TPosButton).Temp9               := ColorToString(ColorButton.Color);
      (CurrentButton as TPosButton).Refresh;
      if isDefaultButton then
        For vIndex := 0 to ComponentCount-1 do
          if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel) then
          begin
            if CopyButton.Color <> ColorButton.Color then
              (Components[vIndex] as TPosButton).Color               := ColorButton.Color;
            if CopyButton.BorderColor <> ColorButton.BorderColor then
              (Components[vIndex] as TPosButton).BorderColor         := ColorButton.BorderColor;
            if CopyButton.Font.Color <> ColorButton.Font.Color then
              (Components[vIndex] as TPosButton).Font.Color          := ColorButton.Font.Color;
            if CopyButton.Number.Color <> ColorButton.Number.Color then
              (Components[vIndex] as TPosButton).Number.Color        := ColorButton.Number.Color;
            if CopyButton.Number.Font.Color <> ColorButton.Number.Font.Color then
              (Components[vIndex] as TPosButton).Number.Font.Color   := ColorButton.Number.Font.Color;
            if CopyButton.Menu.Font.Color <> ColorButton.Menu.Font.Color then
              (Components[vIndex] as TPosButton).Menu.Font.Color     := ColorButton.Menu.Font.Color;
            if CopyButton.Amount.Font.Color <> ColorButton.Amount.Font.Color then
              (Components[vIndex] as TPosButton).Amount.Font.Color   := ColorButton.Amount.Font.Color;
            if CopyButton.Bottom.Font.Color <> ColorButton.Bottom.Font.Color then
              (Components[vIndex] as TPosButton).Bottom.Font.Color   := ColorButton.Bottom.Font.Color;
            if CopyButton.Color <> ColorButton.Color then
              (Components[vIndex] as TPosButton).Temp9               := ColorToString(ColorButton.Color);
            (Components[vIndex] as TPosButton).Refresh;
          end;
    end;
  end;

  //미주문시 색상 변경시
  if ColorPanel.Tag = 1 then
  begin
    For vIndex := 0 to ComponentCount-1 do
      if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel) then
      begin
        (Components[vIndex] as TPosButton).Temp3      := ColorToString(ColorButton.Color);
        (Components[vIndex] as TPosButton).Temp4      := ColorToString(ColorButton.Font.Color);
        (Components[vIndex] as TPosButton).Temp5      := ColorToString(ColorButton.BorderColor);
      end;

    DefaultButton.Color               := ColorButton.Color;
    DefaultButton.BorderColor         := ColorButton.BorderColor;
    DefaultButton.Font.Color          := ColorButton.Font.Color;
    DefaultButton.Refresh;
    DefaultButton.Temp3               := ColorToString(ColorButton.Color);
    DefaultButton.Temp4               := ColorToString(ColorButton.Font.Color);
    DefaultButton.Temp5               := ColorToString(ColorButton.BorderColor);
  end;

  ColorPanel.Visible  := False;
  isDefaultButton     := False;
  TablePanel.BringToFront;
  SetPopupMenu;
  SetPoupMenuItem(true);
  isChanged        := True;
end;



procedure TCodeTableForm.SetControl(aButton: TPosButton);
var vIndex : Integer;
    vSelIndex :Integer;
    vColor : String;
begin
  if not isMultiSelect then Exit;

  if not aButton.Selected then
    aButton.Selected := true
  else
    aButton.Selected := false;
  aButton.Repaint;

  vSelIndex := -1;
  for vIndex := 0 to High(SelectButton) do
  begin
    if (SelectButton[vIndex] is TPosButton) then
    begin
      if (not TPosButton(SelectButton[vIndex]).Selected) and (aButton.Name = TPosButton(SelectButton[vIndex]).Name) then
      begin
        vSelIndex := vIndex;
        Break;
      end;
    end;
  end;

  //선택을 안한 테이블일때
  if vSelIndex < 0 then
  begin
    for vIndex := 0 to High(SelectButton) do
    begin
      if not TPosButton(SelectButton[vIndex]).Selected then
      begin
         SelectButton[vIndex] := aButton;
         Break;
      end;
    end;
  end
  else  //이미 선택을 한테이블일때 선택해제
  begin
    SelectButton[vSelIndex] := aButton;
  end;
end;

procedure TCodeTableForm.SetNodesVisible(Visible: Boolean);
var
  vIndex: Integer;
begin
  for vIndex := 0 to 7 do
    TControl(Nodes.Items[vIndex]).Visible := Visible;
end;

procedure TCodeTableForm.SetPopupMenu;
var vIndex :Integer;
begin
  For vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel)  then
    begin
      TPosButton(Components[vIndex]).PopupMenu := ButtonPopupMenu;
      TPosButton(Components[vIndex]).OnClick   := TableButtonClick;
    end;
end;

procedure TCodeTableForm.SetPoupMenuItem(aValue: Boolean);
begin
  TableNameItem.Visible      := aValue;
  ColorCopyItem.Visible      := aValue;
  ColorPasteItem.Visible     := aValue;
  SizeCopyItem.Visible       := aValue;
  SizeTopPasteItem.Visible   := aValue;
  SizeLeftPasteItem.Visible  := aValue;
  PackingTableItem.Visible   := aValue;
  MenuItem3.Visible          := aValue;
  MenuItem4.Visible          := aValue;
  MenuItem5.Visible          := aValue;
end;

procedure TCodeTableForm.SizeCopyItemClick(Sender: TObject);
begin
  inherited;
  CopyButton := CurrentButton;
  TablePanel.BringToFront;
  CopyButton.Height        := (CurrentButton as TPosButton).Height;
  CopyButton.Width         := (CurrentButton as TPosButton).Width;
  CopyButton.Top           := (CurrentButton as TPosButton).Top;
  CopyButton.Left          := (CurrentButton as TPosButton).Left;
  ColorPasteItem.Enabled   := false;
  SizeTopPasteItem.Enabled   := True;
  SizeLeftPasteItem.Enabled  := True;
end;

procedure TCodeTableForm.SizeLeftPasteItemClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if isMultiSelect then
  begin
    for vIndex := 0 to High(SelectButton) do
    begin
      if SelectButton[vIndex] is TPosButton then
      begin
        if not TPosButton(SelectButton[vIndex]).Selected then Continue;
        TPosButton(SelectButton[vIndex]).Left     := CopyButton.Left;
        TPosButton(SelectButton[vIndex]).Height   := CopyButton.Height;
        TPosButton(SelectButton[vIndex]).Width    := CopyButton.Width;
      end;
    end;
  end
  else
  begin
    (CurrentButton as TPosButton).Left     := CopyButton.Left;
    (CurrentButton as TPosButton).Height   := CopyButton.Height;
    (CurrentButton as TPosButton).Width    := CopyButton.Width;
    PositionNodes(TControl(CurrentButton));
  end;
end;

procedure TCodeTableForm.SizeTopPasteItemClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if isMultiSelect then
  begin
    for vIndex := 0 to High(SelectButton) do
    begin
      if SelectButton[vIndex] is TPosButton then
      begin
        if not TPosButton(SelectButton[vIndex]).Selected then Continue;
        TPosButton(SelectButton[vIndex]).Top      := CopyButton.Top;
        TPosButton(SelectButton[vIndex]).Height   := CopyButton.Height;
        TPosButton(SelectButton[vIndex]).Width    := CopyButton.Width;
      end;
    end;
  end
  else
  begin
    (CurrentButton as TPosButton).Top      := CopyButton.Top;
    (CurrentButton as TPosButton).Height   := CopyButton.Height;
    (CurrentButton as TPosButton).Width    := CopyButton.Width;
    PositionNodes(TControl(CurrentButton));
  end;
end;

procedure TCodeTableForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  procedure SetButton(aType,aValue:Integer);
  var vIndex :Integer;
  begin
    for vIndex := 0 to High(SelectButton) do
      if SelectButton[vIndex] is TPosButton then
      begin
        if TPosButton(SelectButton[vIndex]).Selected then
        begin
          case aType of
            1 : TPosButton(SelectButton[vIndex]).Left := TPosButton(SelectButton[vIndex]).Left + aValue;
            2 : TPosButton(SelectButton[vIndex]).Top  := TPosButton(SelectButton[vIndex]).Top  + aValue;
            3 :
            begin
              if TPosButton(SelectButton[vIndex]).Width > 10 then
                TPosButton(SelectButton[vIndex]).Width := TPosButton(SelectButton[vIndex]).Width + aValue;
            end;
            4 :
            begin
              if TPosButton(SelectButton[vIndex]).Height > 10 then
                TPosButton(SelectButton[vIndex]).Height := TPosButton(SelectButton[vIndex]).Height + aValue;
            end;
          end;
        end;
      end;
  end;

  function GetSelectCount:Integer;
  var vIndex :Integer;
  begin
    Result := 0;
    for vIndex := 0 to High(SelectButton) do
    begin
      if SelectButton[vIndex] is TPosButton then
      begin
        if not TPosButton(SelectButton[vIndex]).Selected then Continue;
        Result := Result + 1;
      end;
    end;
  end;
var vIndex, vIndex2, vLeft, vTop : Integer;
    vButton :TPosButton;
begin
//  inherited;
  if Shift = [ssCtrl, ssShift] then
  begin
    if (CurrentButton = nil) and (GetSelectCount = 0) then Exit;
    if not isMultiSelect and (CurrentButton <> nil) then
    begin
      case Key of
        VK_LEFT  : (CurrentButton as TPosButton).Left := (CurrentButton as TPosButton).Left - 5;
        VK_RIGHT : (CurrentButton as TPosButton).Left := (CurrentButton as TPosButton).Left + 5;
        VK_UP    : (CurrentButton as TPosButton).Top  := (CurrentButton as TPosButton).Top  - 5;
        VK_DOWN  : (CurrentButton as TPosButton).Top  := (CurrentButton as TPosButton).Top  + 5;
      end;
    end
    else
    begin
      case Key of
        VK_LEFT  : SetButton(1, -5);
        VK_RIGHT : SetButton(1,  5);
        VK_UP    : SetButton(2, -5);
        VK_DOWN  : SetButton(2,  5);
      end;
    end;
    isChanged := true;
    Key := 0;
    PositionNodes(TControl(CurrentButton));
  end
  else if Shift = [ssCtrl] then
  begin
    //전체선택
    if (Key = Ord('a')) or (Key = Ord('A')) then
    begin
      SelectButtonClear;
      vIndex2 := 0;

      For vIndex := 0 to ComponentCount-1 do
        if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel) then //and ((Components[vIndex] as TPosButton).BorderStyle = pbsSingle) then
        begin
          isMultiSelect := true;
          isShift       := true;
          (Components[vIndex] as TPosButton).selected := true;
          SelectButton[vIndex2] := (Components[vIndex] as TPosButton);
          Inc(vIndex2);
        end;
    end
    else if CurrentButton <> nil  then

    begin
      if (not isMultiSelect or (GetSelectCount = 0)) then
      begin
        case Key of
          VK_LEFT  : (CurrentButton as TPosButton).Left := (CurrentButton as TPosButton).Left - 1;
          VK_RIGHT : (CurrentButton as TPosButton).Left := (CurrentButton as TPosButton).Left + 1;
          VK_UP    : (CurrentButton as TPosButton).Top  := (CurrentButton as TPosButton).Top  - 1;
          VK_DOWN  : (CurrentButton as TPosButton).Top  := (CurrentButton as TPosButton).Top  + 1;
        end;
      end
      else
      begin
        case Key of
          VK_LEFT  : SetButton(1, -1);
          VK_RIGHT : SetButton(1,  1);
          VK_UP    : SetButton(2, -1);
          VK_DOWN  : SetButton(2,  1);
        end;
      end;

      PositionNodes(TControl(CurrentButton));
      isChanged := true;
    end;
    Key := 0;
  end
  else if Shift = [ssShift] then
  begin
    if (not isMultiSelect or (GetSelectCount = 0)) and (Key in [VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN]) then
    begin
      case Key of
        VK_LEFT  : if (CurrentButton as TPosButton).Width > 10 then (CurrentButton as TPosButton).Width  := (CurrentButton as TPosButton).Width - 1;
        VK_RIGHT : (CurrentButton as TPosButton).Width  := (CurrentButton as TPosButton).Width + 1;
        VK_UP    : if (CurrentButton as TPosButton).Height > 10 then (CurrentButton as TPosButton).Height := (CurrentButton as TPosButton).Height  - 1;
        VK_DOWN  : (CurrentButton as TPosButton).Height := (CurrentButton as TPosButton).Height  + 1;
      end;
    end
    else
    begin

      if not isMultiSelect then
      begin
        SelectButtonClear;
        isFirstSelect := true;
      end;

      isMultiSelect := true;

      isShift       := true;
      if (CurrentButton = nil) and (GetSelectCount = 0) then Exit;
      if not isMultiSelect and (CurrentButton <> nil) then
      begin
        case Key of
          VK_LEFT  : if (CurrentButton as TPosButton).Width > 10 then (CurrentButton as TPosButton).Width  := (CurrentButton as TPosButton).Width - 1;
          VK_RIGHT : (CurrentButton as TPosButton).Width  := (CurrentButton as TPosButton).Width + 1;
          VK_UP    : if (CurrentButton as TPosButton).Height > 10 then (CurrentButton as TPosButton).Height := (CurrentButton as TPosButton).Height  - 1;
          VK_DOWN  : (CurrentButton as TPosButton).Height := (CurrentButton as TPosButton).Height  + 1;
        end;
      end
      else
      begin
        case Key of
          VK_LEFT  : SetButton(3, -1);
          VK_RIGHT : SetButton(3,  1);
          VK_UP    : SetButton(4, -1);
          VK_DOWN  : SetButton(4,  1);
        end;
      end;
    end;
    PositionNodes(TControl(CurrentButton));
    isChanged := true;
    Key := 0;
  end
  else if not isMultiSelect and ((CurrentButton as TPosButton) <> nil) then
  begin
    vButton := nil;
    case Key of
      VK_LEFT  :
      begin
        vLeft   := -1;
        For vIndex := 0 to ComponentCount-1 do
          if (Components[vIndex] is TPosButton) and  ((Components[vIndex] as TPosButton).Parent = TablePanel) then
          begin
            if ((CurrentButton as TPosButton).Number.Number = (Components[vIndex] as TPosButton).Number.Number)
              or ((CurrentButton as TPosButton).Left <= (Components[vIndex] as TPosButton).Left) then Continue;

            if (Components[vIndex] as TPosButton).Left > vLeft then
            begin
              vLeft   := (Components[vIndex] as TPosButton).Left;
              vButton := (Components[vIndex] as TPosButton);
            end;
          end;

        if vButton <> nil then
        begin
          CurrentButton := vButton;
          PositionNodes(TControl(vButton));
        end;
      end;
      VK_RIGHT :
      begin
        vLeft   := 9999;
        For vIndex := 0 to ComponentCount-1 do
          if (Components[vIndex] is TPosButton) and  ((Components[vIndex] as TPosButton).Parent = TablePanel) then
          begin
            if ((CurrentButton as TPosButton).Number.Number = (Components[vIndex] as TPosButton).Number.Number)
              or ((CurrentButton as TPosButton).Left >= (Components[vIndex] as TPosButton).Left) then Continue;

            if (Components[vIndex] as TPosButton).Left < vLeft then
            begin
              vLeft   := (Components[vIndex] as TPosButton).Left;
              vButton := (Components[vIndex] as TPosButton);
            end;
          end;

        if vButton <> nil then
        begin
          CurrentButton := vButton;
          PositionNodes(TControl(vButton));
        end;
      end;
      VK_UP    :
      begin
        vTop   := -1;
        For vIndex := 0 to ComponentCount-1 do
          if (Components[vIndex] is TPosButton) and  ((Components[vIndex] as TPosButton).Parent = TablePanel) then
          begin
            if ((CurrentButton as TPosButton).Number.Number = (Components[vIndex] as TPosButton).Number.Number)
              or ((CurrentButton as TPosButton).Top <= (Components[vIndex] as TPosButton).Top) then Continue;

            if (Components[vIndex] as TPosButton).Top > vTop then
            begin
              vTop   := (Components[vIndex] as TPosButton).Top;
              vButton := (Components[vIndex] as TPosButton);
            end;
          end;

        if vButton <> nil then
        begin
          CurrentButton := vButton;
          PositionNodes(TControl(vButton));
        end;
      end;
      VK_DOWN  :
      begin
        vTop   := 9999;
        For vIndex := 0 to ComponentCount-1 do
          if (Components[vIndex] is TPosButton) and  ((Components[vIndex] as TPosButton).Parent = TablePanel) then
          begin
            if ((CurrentButton as TPosButton).Number.Number = (Components[vIndex] as TPosButton).Number.Number)
              or ((CurrentButton as TPosButton).Top >= (Components[vIndex] as TPosButton).Top) then Continue;

            if (Components[vIndex] as TPosButton).Top < vTop then
            begin
              vTop   := (Components[vIndex] as TPosButton).Top;
              vButton := (Components[vIndex] as TPosButton);
            end;
          end;

        if vButton <> nil then
        begin
          CurrentButton := vButton;
          PositionNodes(TControl(vButton));
        end;
      end;
    end;
  end;

  if Key = VK_ESCAPE then
  begin
    SelectButtonClear;
    CurrentButton := nil;
    SetNodesVisible(false);
  end;
end;

procedure TCodeTableForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SHIFT then
    isShift := false;
end;

procedure TCodeTableForm.FormResize(Sender: TObject);
begin
  inherited;
  ColorPanel.Left := Trunc(TablePanel.Width / 2  - ColorPanel.Width / 2);
  ColorPanel.Top  := Trunc(TablePanel.Height / 2 - ColorPanel.Height / 2);
end;

procedure TCodeTableForm.FormShow(Sender: TObject);
var
  vCode     : PStrPointer;
begin
  inherited;
  isLoading := true;
  DefaultButton.BorderInnerColor := clNone;
  ColorButton.BorderInnerColor    := clNone;
  TableNumber     := 0;
  //층 코드 불러와서 그리드에 보이기
  OpenQuery('select CD_CODE, '
           +'       NM_CODE1 '
           +'  from MS_CODE '
           +' where Cd_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  = ''03'' '
           +' order by CD_CODE ',
           [HeadStoreCode,
            StoreCode]);
  FloorListBox.Items.Clear;
  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := Query.Fields[0].AsString;
    FloorListBox.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
    Query.Next;
  end;
  Query.Close;
  TableNumber :=  GetTableMaxNumber-1;

  //렛츠오더 사용시
  if GetStoreOption(9) = '1' then
  begin
  //층 코드 불러와서 그리드에 보이기
    OpenQuery('select NO_TABLE, '
             +'       VAN_SERIAL, '
             +'       VAN_TID '
             +'  from MS_TABLE '
             +' where Cd_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and SEQ      =0 '
             +' order by NO_TABLE ',
             [HeadStoreCode,
              StoreCode]);
    VanData.Close;
    VanData.Open;
    while not Query.Eof do
    begin
      VanData.Append;
      VanData.FieldByName('TableNo').AsInteger := Query.FieldByName('NO_TABLE').AsInteger;
      VanData.FieldByName('SerialNo').AsString := Query.FieldByName('VAN_SERIAL').AsString;
      VanData.FieldByName('TID').AsString      := Query.FieldByName('VAN_TID').AsString;
      Query.Next;
    end;
    Query.Close;
  end;

  SetComPortList(ConditionToolBarComboBox,'사용안함');
  Exec_Timer.Enabled := true;
end;

procedure TCodeTableForm.FreePopupMenu;
var vIndex :Integer;
begin
  For vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel)  then
    begin
      TPosButton(Components[vIndex]).PopupMenu := nil;
      TPosButton(Components[vIndex]).OnClick   := nil;
    end;
end;

function TCodeTableForm.GetFloorCode: String;
begin
  Result := PStrPointer(FloorListBox.Items.Objects[FloorListBox.ItemIndex]).Data; ;
end;

function TCodeTableForm.GetTableMaxNumber: Integer;
begin
  try
    OpenQuery('select ifnull(Max(NO_TABLE), 0) '
             +'  from MS_TABLE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [HeadStoreCode,
              StoreCode]);

    Result := Query.Fields[0].AsInteger;
  finally
    Query.Close;
  end;
end;

procedure TCodeTableForm.GroupButtonClick(Sender: TObject);
var vIndex :Integer;
    vGroupCode :String;
    vCode :String;
    vSelected :Boolean;
begin
  inherited;
  vCode := EmptyStr;
  vSelected := false;
  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        vCode := vCode + Format('%d,',[TPosButton(SelectButton[vIndex]).Number.Number]);
        vSelected := true;
      end;
    end;

  if not vSelected and (CurrentButton = nil) then
  begin
    MsgBox('작업할 테이블을 선택하세요');
    Exit;
  end
  else if (vCode = EmptyStr) and (CurrentButton <> nil) then
    vCode := Format('%d,',[CurrentButton.Number.Number]);


  vGroupCode := EmptyStr;
  if Sender = GroupButton then
  begin
    with THelpForm.Create(Self) do
      try
        Caption := '프린터그룹 조회';
        GridTableViewCode.Caption  := '코드';
        GridTableViewCode.Width    := 100;
        GridTableViewName1.Caption := '그룹명';
        GridTableViewName1.Width   := 320;

        SQLText    := 'select   CD_CODE, '
                     +'         NM_CODE1 '
                     +'from     MS_CODE  '
                     +'where    CD_HEAD   = :P0 '
                     +'  and    CD_STORE  = :P1 '
                     +'  and    CD_KIND   = ''25'' '
                     +'  and    NM_CODE1 like ConCat(''%'',:P2,''%'') '
                     +'  and    DS_STATUS = ''0'' '
                     +'order by CD_CODE ';
        IsAutoSearch := True;

        if ShowModal = mrOK then
          vGroupCode     := Code
        else
          Exit;
      finally
        Free;
      end;
   end
   else if not AskBox('프린터 그룹에서 삭제하시겠습니까?') then Exit;

   vCode := '   and NO_TABLE in ('+LeftStr(vCode, Length(vCode)-1)+');';
   try
     ExecQuery('update MS_TABLE '
              +'   set CD_GROUP     = :P2, '
              +'       CD_SAWON_CHG = :P3, '
              +'       DT_CHANGE = Now() '
              +' where CD_HEAD  = :P0 '
              +'   and CD_STORE = :P1 '
              +vCode,
              [HeadStoreCode,
               StoreCode,
               vGroupCode,
               UserCode],true);

    for vIndex := 0 to High(SelectButton) do
      if SelectButton[vIndex] is TPosButton then
        if TPosButton(SelectButton[vIndex]) is TPosButton then
        begin
          if TPosButton(SelectButton[vIndex]).Selected then
            TPosButton(SelectButton[vIndex]).Bottom.LeftString := vGroupCode;
        end;

    if not vSelected then
      CurrentButton.Bottom.LeftString := vGroupCode;
   except
     on E: Exception do
     begin
       ErrBox(E.Message);
     end;
   end;
end;

function TCodeTableForm.GetFloorMaxSEQ:Integer;
begin
  try
    OpenQuery('select Max(ifnull(SEQ, 0) ) '
             +'  from MS_TABLE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and NO_TABLE =0 ',
             [HeadStoreCode,
              StoreCode]);
    if not Query.Eof then
      Result := Query.Fields[0].AsInteger
    else
      Result := 0;
  finally
    Query.Close;
  end;
end;

procedure TCodeTableForm.NewButtonClick(Sender: TObject);
  function CheckButton(aTop, aLeft:Integer):Boolean;
  var vIndex :Integer;
  begin
    Result := False;
    For vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel) and
         ((Components[vIndex] as TPosButton).Top = aTop) and ((Components[vIndex] as TPosButton).Left = aLeft) then
      begin
         Result := True;
      end;
    end;
  end;
var vTop, vLeft :Integer;
    vTableButton :TTableButton;
begin
  inherited;
  New(vTableButton);
  vTop := 20; vLeft := 20;
  while CheckButton(vTop, vLeft) do
  begin
    vTop  := vTop + 20;
    vLeft := vLeft + 20;
  end;

  vTableButton^.Top           := vTop;
  vTableButton^.Left          := vLeft;
  vTableButton^.Height        := 70;
  vTableButton^.Width         := 100;
  vTableButton^.TableType     := Ifthen(TypeRadioGroup.ItemIndex = 0, 'T','W');
  vTableButton^.Color         := DefaultButton.Color;
  vTableButton^.NumberColor   := DefaultButton.Number.Font.Color;
  vTableButton^.FontColor     := DefaultButton.Menu.Font.Color;
  TableNumber := Ifthen(TableNumber < 0, 0, TableNumber);
  vTableButton^.ChairCount    := 4;
  if TypeRadioGroup.ItemIndex = 0 then
  begin
    TableNumber          := TableNumber + 1;
    vTableButton^.Number := TableNumber;
    vTableButton^.TableType := 'T';
  end
  else
  begin
    vTableButton^.TableType     := 'W';
    vTableButton^.Number        := 0;
    vTableButton^.Name          := '벽';
    vTableButton^.Color         := $00400000;
    vTableButton^.NumberColor   := $00400000;
  end;

  ButtonCreate(vTableButton);
  isChanged         := True;
  SetNodesVisible(True);
  PositionNodes(TControl(CurrentButton));
end;

procedure TCodeTableForm.NodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if isMultiSelect then Exit;

  if (Sender is TControl) then
  begin
    NodePositioning := True;
    GetCursorPos(oldPos);
  end;
end;

procedure TCodeTableForm.NodeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  minWidth  = 20;
  minHeight = 20;
var
  newPos: TPoint;
  frmPoint : TPoint;
  OldRect: TRect;
  AdjL,AdjR,AdjT,AdjB: Boolean;
begin
  if NodePositioning  then
  begin
    begin
      with TWinControl(Sender) do
      begin
        GetCursorPos(newPos);
        with CurrentNodeControl do
        begin //resize
          frmPoint := CurrentNodeControl.Parent.ScreenToClient(Mouse.CursorPos);
          OldRect := CurrentNodeControl.BoundsRect;
          AdjL := False;
          AdjR := False;
          AdjT := False;
          AdjB := False;
          case Nodes.IndexOf(TWinControl(Sender)) of
            0: begin
                 AdjL := True;
                 AdjT := True;
               end;
            1: begin
                 AdjT := True;
               end;
            2: begin
                 AdjR := True;
                 AdjT := True;
               end;
            3: begin
                 AdjR := True;
               end;
            4: begin
                 AdjR := True;
                 AdjB := True;
               end;
            5: begin
                 AdjB := True;
               end;
            6: begin
                 AdjL := True;
                 AdjB := True;
               end;
            7: begin
                 AdjL := True;
               end;
          end;

          if AdjL then
            OldRect.Left := frmPoint.X;
          if AdjR then
            OldRect.Right := frmPoint.X;
          if AdjT then
            OldRect.Top := frmPoint.Y;
          if AdjB then
            OldRect.Bottom := frmPoint.Y;
          SetBounds(OldRect.Left,OldRect.Top,OldRect.Right - OldRect.Left,OldRect.Bottom - OldRect.Top);
        end;
        Left := Left - oldPos.X + newPos.X;
        Top := Top - oldPos.Y + newPos.Y;
        oldPos := newPos;
        TWinControl(Sender).Repaint;
      end;
    end;
    PositionNodes(CurrentNodeControl);
  end;
end;

procedure TCodeTableForm.NodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if NodePositioning then
  begin
    if Sender is TPosButton then
    begin
      (Sender as TPosButton).Refresh;
      (Sender as TPosButton).Repaint;
    end;

    Screen.Cursor := crDefault;
    ReleaseCapture;
    NodePositioning := False;
  end;
end;

procedure TCodeTableForm.nrComPortAfterReceive(Com: TObject; Buffer: Pointer;
  Received: Cardinal);
  function CheckRFID:Boolean;
  begin
    try
      OpenQuery('select * '
               +'  from MS_TABLE '
               +' where CD_HEAD  = :P0 '
               +'   and CD_STORE = :P1 '
               +'   and NO_RFID  = :P2 ',
               [HeadStoreCode,
                StoreCode,
                RFReadData]);

      if not Query.Eof then
      begin
        MsgBox(Format('이미 %s 에 등록이 된 테이블키입니다', [IfThen(GetOption(25) = '1', Query.FieldByName('NM_TABLE').AsString, Query.FieldByName('NO_TABLE').AsString)]));
        Result := False;
      end
      else
      begin
        Result := True;
        Query.Close;
        ExecQuery('update MS_TABLE '
                 +'   set NO_RFID  =:P3 '
                 +' where CD_STORE =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and NO_TABLE =:P2;',
                 [HeadStoreCode,
                  StoreCode,
                  (CurrentButton as TPosButton).Number.Number,
                  RFReadData],true);
        (CurrentButton as TPosButton).Amount.Caption := RFReadData;
      end;
    finally
      FinishQuery;
    end;
  end;
var vIndex:integer;
    TempBuff : AnsiString;
    vStr :String;
begin
  for vIndex := 0 to Received - 1 do
    TempBuff := TempBuff + PAnsiChar(Buffer)[vIndex];

  RFReadData := RFReadData + TempBuff;
  if (Pos(#13, RFReadData) > 0) or (Pos(#3, RFReadData) > 0) then
  begin
    try
      if CurrentButton = nil then Exit;

      if (CurrentButton as TPosButton).Tag > 0 then Exit;

      vStr := RFReadData;
      RFReadData := '';
      For vIndex:=1 to Length(vStr) do
      begin
         Case vStr[vIndex] of
           #48..#57, #65..#90, #61: RFReadData := RFReadData + vStr[vIndex];
         end;
      end;

      if not CheckRFID then Exit;

    finally
      RFReadData := '';
    end;
  end;
end;

procedure TCodeTableForm.OrderColorItemClick(Sender: TObject);
begin
  inherited;
  if (Sender = DefaultButton) or (Sender = NoOrderColorItem) then
  begin
    ColorPanel.Caption   := '미주문 시 테이블';
    NumberColorButton.Visible := false;
    ColorButton.Number.ShowNumber := false;
    ColorButton.Number.ShowColor  := false;
    ColorButton.Number.NumberString := '';
    ColorButton.Caption           := '1-1';
    ColorButton.Menu.Name         := '';
    ColorButton.Menu.Qty          := '';
    ColorButton.Amount.Caption    := '';
    ColorButton.Bottom.LeftString := '';
    BottomColorButton.Visible     := false;
    if (Sender = DefaultButton) then
    begin
      ColorPanel.Tag              := 1;
      ColorButton.Color           := CurrentButton.Color;
      ColorButton.Font.Color      := CurrentButton.Font.Color;
      ColorButton.BorderColor     := CurrentButton.BorderColor;
    end
    else
      ColorPanel.Tag                := 2;
  end
  else if (Sender = OrderDefaultButton) or  (Sender = OrderColorItem) then
  begin
    ColorPanel.Caption   := '주문 시 테이블';
    NumberColorButton.Visible := true;
    ColorButton.Number.ShowNumber := true;
    ColorButton.Number.ShowColor  := true;
    BottomColorButton.Visible     := true;
    ColorButton.Number.NumberString := 'VIP';
    ColorButton.Caption           := '';
    ColorButton.Menu.Name         := '아메리카노';
    ColorButton.Menu.Qty          := '3';

    ColorButton.Amount.Caption    := '[ 10,000원 ]';
    ColorButton.Bottom.LeftString := '2명';
    ColorPanel.Tag                := 0;
  end;

  if (CurrentButton = nil) and not isMultiSelect then Exit;
  FreePopupMenu;
  try
    if (CurrentButton <> nil) and (Sender = NoOrderColorItem) then
    begin
      ColorButton.Color              := StringToColorDef((CurrentButton as TPosButton).Temp3, (CurrentButton as TPosButton).Color);
      ColorButton.Font.Color         := StringToColorDef((CurrentButton as TPosButton).Temp4, (CurrentButton as TPosButton).Font.Color);
      ColorButton.BorderColor        := StringToColorDef((CurrentButton as TPosButton).Temp5, (CurrentButton as TPosButton).BorderColor);
    end
    else if (CurrentButton <> nil) then
    begin
      if isMultiSelect then
        ColorButton.Color              := StringToColor(TPosButton(SelectButton[0]).Temp9)
      else
        ColorButton.Color              := (CurrentButton as TPosButton).Color;
      ColorButton.BorderColor        := (CurrentButton as TPosButton).BorderColor;
      ColorButton.Font.Color         := (CurrentButton as TPosButton).Font.Color;
      ColorButton.Number.Color       := (CurrentButton as TPosButton).Number.Color;
      ColorButton.Number.Font.Color  := (CurrentButton as TPosButton).Number.Font.Color;
      ColorButton.Menu.Font.Color    := (CurrentButton as TPosButton).Menu.Font.Color;
      ColorButton.Amount.Font.Color  := (CurrentButton as TPosButton).Amount.Font.Color;
      ColorButton.Bottom.Font.Color  := (CurrentButton as TPosButton).Bottom.Font.Color;
    end;

    ColorPanel.Visible    := True;
    ColorPanel.BringToFront;
  except
  end;
end;

procedure TCodeTableForm.PackingTableItemClick(Sender: TObject);
var vIndex :Integer;
    vTemp :String;
begin
  inherited;
  if CurrentButton = nil then Exit;

  vTemp := '포장';

  if isMultiSelect then
  begin
    for vIndex := 0 to High(SelectButton) do
    begin
      if SelectButton[vIndex] is TPosButton then
      begin
        if not TPosButton(SelectButton[vIndex]).Selected then Continue;
        if TPosButton(SelectButton[vIndex]).Bottom.RightString = EmptyStr then
          TPosButton(SelectButton[vIndex]).Bottom.RightString := vTemp
        else
          TPosButton(SelectButton[vIndex]).Bottom.RightString := EmptyStr;
      end;
    end;
  end
  else
  begin
    if CurrentButton.Bottom.RightString = EmptyStr then
      CurrentButton.Bottom.RightString := vTemp
    else
      CurrentButton.Bottom.RightString := EmptyStr;
    CurrentButton.Refresh;
  end;
end;

procedure TCodeTableForm.PositionNodes(AroundControl: TControl);
var
  Node,T,L,CT,CL,FR,FB,FT,FL: Integer;
  TopLeft: TPoint;
begin
  CurrentNodeControl := nil;
  for Node := 0 to 7 do
  begin
    with AroundControl do
    begin
      CL := (Width div 2) + Left -2;
      CT := (Height div 2) + Top -2;
      FR := Left + Width - 2;
      FB := Top + Height - 2;
      FT := Top - 2;
      FL := Left - 2;
      case Node of
        0: begin
             T := FT;
             L := FL;
           end;
        1: begin
             T := FT;
             L := CL;
           end;
        2: begin
             T := FT;
             L := FR;
           end;
        3: begin
             T := CT;
             L := FR;
           end;
        4: begin
             T := FB;
             L := FR;
           end;
        5: begin
             T := FB;
             L := CL;
           end;
        6: begin
             T := FB;
             L := FL;
           end;
        7: begin
             T := CT;
             L := FL;
           end;
        else
          T := 0;
          L := 0;
      end;
      TopLeft := Parent.ClientToScreen(Point(L,T));
    end;
    with TPanel(Nodes[Node]) do
    begin
      TopLeft := Parent.ScreenToClient(TopLeft);
      Top := TopLeft.Y;
      Left := TopLeft.X;
    end;
  end;
  CurrentNodeControl := AroundControl;
  SetNodesVisible(True);
end;

procedure TCodeTableForm.TableButtonClick(Sender: TObject);
var visChanged : Boolean;
begin
  if not isShift and isMultiSelect then
    SelectButtonClear;

  if (MouseButton = mbRight) then
    Exit;

  if not isMultiSelect then
  begin
    visChanged := isChanged;
    //버튼이 선택되면 현재버튼을 삭제를 위해서 저장해놓는다
    SetPopupMenu;

    if Sender = nil  then Exit;
    (Sender as TPosButton).BringToFront;
    if CurrentButton = (Sender as TPosButton) then Exit;
    if ColorPanel.Visible then Exit;
    CurrentButton   := Sender as TPosButton;
  end
  else
  begin
    SetNodesVisible(false);
    if isFirstSelect then
    begin
      if CurrentButton <> nil then
        SetControl(CurrentButton);
      isFirstSelect := false;
    end;

    if Sender <> nil  then
      SetControl(Sender as TPosButton);
  end;
  isChanged       := visChanged;
  Self.ActiveControl := nil;
end;

procedure TCodeTableForm.TableDeleteItemClick(Sender: TObject);
var vNumber,
    vIndex  :Integer;
begin
  inherited;
  if ButtonPopupMenu.PopupComponent is TPosButton then
  begin
    SelectButtonClear;

    if TPosButton(ButtonPopupMenu.PopupComponent).Tag = 1 then
    begin
      TPosButton(ButtonPopupMenu.PopupComponent).Free;
      isChanged := True;
      TablePanel.SetFocus;
      Exit;
    end;

    TPosButton(ButtonPopupMenu.PopupComponent).Free;
    TablePanel.SetFocus;

    if TPosButton(ButtonPopupMenu.PopupComponent).Temp8 = 'Load' then
    begin
      if not ExecQuery('delete from MS_TABLE '
                      +' where CD_HEAD  =:P0 '
                      +'   and CD_STORE =:P1 '
                      +'   and NO_TABLE =:P2;',
                      [HeadStoreCode,
                       StoreCode,
                       TPosButton(ButtonPopupMenu.PopupComponent).Number.Number],true) then Exit;

      SetNodesVisible(false);
    end
    else SetNodesVisible(false);

    isChanged := true;
  end;
end;

procedure TCodeTableForm.TableKeyItemClick(Sender: TObject);
begin
  inherited;
  if CurrentButton = nil then Exit;

  if not AskBox('테이블키를 삭제 하시겠습니까?') then Exit;

  ExecQuery('update MS_TABLE '
           +'   set NO_RFID  ='''' '
           +' where CD_STORE =:P0 '
           +'   and NO_TABLE =:P1;',
           [StoreCode,
            (CurrentButton as TPosButton).Number.Number],true);
  (CurrentButton as TPosButton).Amount.Caption := '';
end;

procedure TCodeTableForm.TableNameItemClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if CurrentButton = nil then Exit;

  if InputQuery('테이블명 입력', '테이블명을 입력하세요.', vTemp) then
  begin
    (CurrentButton as TPosButton).Temp1   := vTemp;
//    (CurrentButton as TPosButton).Number.RightString := vTemp;
    (CurrentButton as TPosButton).Caption := vTemp;
    (CurrentButton as TPosButton).Refresh;
  end
  else Exit;

  SetPopupMenu;
  isChanged := true;
end;

procedure TCodeTableForm.TableNoChangeItemClick(Sender: TObject);
  function CheckButton(aNumber:Integer):Boolean;
  var vIndex :Integer;
  begin
    Result := False;
    For vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel) and
         ((Components[vIndex] as TPosButton).Number.Number = aNumber)  then
      begin
         Result := True;
      end;
    end;
  end;
var
  vTemp: string;
begin
  inherited;
  if CurrentButton = nil then Exit;

  if InputQuery('테이블번호 입력', '테이블번호를 입력하세요.', vTemp) then
  begin
    if (vTemp <> '') and (GetOnlyNumber(vTemp) <> vTemp) then
    begin
      MsgBox('테이블번호를 정확히 입력하세요');
      Exit;
    end;

    if (CurrentButton as TPosButton).Number.Number = StrToInt(vTemp) then Exit;

    if CheckButton(StrToInt(vTemp)) then
    begin
      MsgBox('이미 등록된 테이블번호입니다');
      Exit;
    end;

    //다른층에 등록되어 있는지 체크한다
    try
      OpenQuery('select NO_TABLE '
               +'  from MS_TABLE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and NO_TABLE =:P2 '
               +'   and CD_FLOOR <>:P3 ',
               [HeadStoreCode,
                StoreCode,
                StrToInt(vTemp),
                GetFloorCode]);
      if not Query.Eof then
      begin
        MsgBox('다른 층에 등록 테이블번호입니다');
        Exit;
      end;
    finally
      Query.Close;
    end;

    if not AskBox(Format('%d -> %s 로 테이블번호를 변경하시겠습니까?',[(CurrentButton as TPosButton).Number.Number, vTemp])) then Exit;

    (CurrentButton as TPosButton).Number.Number  := StrToInt(vTemp);
    (CurrentButton as TPosButton).Caption := vTemp;
    (CurrentButton as TPosButton).Refresh;
  end
  else Exit;

  SetPopupMenu;
  isChanged := true;
end;

procedure TCodeTableForm.TableStyleClick(Sender: TObject);
begin
  inherited;
  if CurrentButton = nil then Exit;

  if (CurrentButton as TPosButton).Bottom.CenterString = '' then
  begin
    (CurrentButton as TPosButton).Bottom.CenterString := '원형';
    (CurrentButton as TPosButton).Height := (CurrentButton as TPosButton).Width;
  end
  else
    (CurrentButton as TPosButton).Bottom.CenterString := '';
  SetPopupMenu;
  isChanged := true;
end;

procedure TCodeTableForm.TabletBorkenItemClick(Sender: TObject);
begin
  inherited;
  if CurrentButton = nil then Exit;
  (CurrentButton as TPosButton).Number.RightString := '고장';
  (CurrentButton as TPosButton).Refresh;
end;

procedure TCodeTableForm.TabletNoneItemClick(Sender: TObject);
begin
  inherited;
  if CurrentButton = nil then Exit;
  (CurrentButton as TPosButton).Number.RightString := '미설치';
  (CurrentButton as TPosButton).Refresh;
end;

procedure TCodeTableForm.SelectButtonClear;
var vIndex :Integer;
begin
  for vIndex := 0 to High(SelectButton) do
  begin
    if SelectButton[vIndex] is TPosButton then
      (SelectButton[vIndex] as TPosButton).selected := false;
  end;
  isMultiSelect  := false;
  isFirstSelect  := false;
end;

procedure TCodeTableForm.SelectedDeleteButtonClick(Sender: TObject);
var vNumber,
    vIndex  :Integer;
begin
  inherited;
  SelectButtonClear;
  //선택된 버튼이 없을때
  if CurrentButton = nil then Exit;

  //지울려는 버튼의 Number값 저장
  vNumber := (CurrentButton as TPosButton).Number.Number;

  if (CurrentButton as TPosButton).Tag = 1 then
  begin
    (CurrentButton as TPosButton).Free;
    isChanged := True;
    TablePanel.SetFocus;
    Exit;
  end;

  (CurrentButton as TPosButton).Free;
  TablePanel.SetFocus;


  if (CurrentButton as TPosButton).Temp8 = 'Load' then
  begin
    if not ExecQuery('delete from MS_TABLE '
                    +' where CD_HEAD  =:P0 '
                    +'   and CD_STORE =:P1 '
                    +'   and NO_TABLE =:P2;',
                    [HeadStoreCode,
                     StoreCode,
                     vNumber],true) then Exit;

    SetNodesVisible(false);
  end
  else SetNodesVisible(false);

  isChanged := true;
  CurrentButton := nil;
end;

procedure TCodeTableForm.LeftAlignButtonClick(Sender: TObject);
var vLeft,
    vIndex :Integer;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;
  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        vLeft := TPosButton(SelectButton[vIndex]).Left;
        Break;
      end;
    end;

  for vIndex := 0 to High(SelectButton) do
  begin
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        TPosButton(SelectButton[vIndex]).Left := vLeft;
        TPosButton(SelectButton[vIndex]).BringToFront;
      end;
    end;
  end;
  isChanged := true;
end;


procedure TCodeTableForm.LetsOrderURLItemClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if CurrentButton = nil then Exit;
  vTemp := (CurrentButton as TPosButton).Temp10;
  if InputQuery('렛츠오더 URL', '렛츠오더 URL을 입력하세요.', vTemp) then
  begin
    (CurrentButton as TPosButton).Temp10   := vTemp;
    if vTemp = '' then
     (CurrentButton as TPosButton).Bottom.RightString := ''
    else
     (CurrentButton as TPosButton).Bottom.RightString := 'QR';

    (CurrentButton as TPosButton).Refresh;
  end
  else Exit;

  SetPopupMenu;
  isChanged := true;
end;

procedure TCodeTableForm.TopAlignButtonClick(Sender: TObject);
var vTop,
    vIndex :Integer;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;

  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        vTop := TPosButton(SelectButton[vIndex]).Top;
        Break;
      end;
    end;

  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        TPosButton(SelectButton[vIndex]).Top := vTop;
        TPosButton(SelectButton[vIndex]).BringToFront;
      end;
    end;
  isChanged := true;
end;


procedure TCodeTableForm.RightAlignButtonClick(Sender: TObject);
var vRight,
    vIndex :Integer;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;
  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        vRight := TPosButton(SelectButton[vIndex]).Left+TPosButton(SelectButton[vIndex]).Width;
        Break;
      end;
    end;

  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        TPosButton(SelectButton[vIndex]).Left := vRight - TPosButton(SelectButton[vIndex]).Width;
        TPosButton(SelectButton[vIndex]).BringToFront;
      end;
    end;
  isChanged := true;
end;

procedure TCodeTableForm.AddButtonClick(Sender: TObject);
  function CheckButton(aTop, aLeft:Integer):Boolean;
  var vIndex :Integer;
  begin
    Result := False;
    For vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and ((Components[vIndex] as TPosButton).Parent = TablePanel) and
         ((Components[vIndex] as TPosButton).Top = aTop) and ((Components[vIndex] as TPosButton).Left = aLeft) then
      begin
         Result := True;
      end;
    end;
  end;
var vTop, vLeft :Integer;
    vTableButton :TTableButton;
begin
  inherited;
  AddButton.Enabled := false;
  try
    New(vTableButton);
    vTop := 20; vLeft := 20;
    while CheckButton(vTop, vLeft) do
    begin
      vTop  := vTop + 20;
      vLeft := vLeft + 20;
    end;

    vTableButton^.Top           := vTop;
    vTableButton^.Left          := vLeft;
    vTableButton^.Height        := 70;
    vTableButton^.Width         := 100;
    vTableButton^.TableType     := Ifthen(TypeRadioGroup.ItemIndex=0,'T','W');
    vTableButton^.Color         := OrderDefaultButton.Color;
    vTableButton^.NumberColor   := OrderDefaultButton.Number.Color;
    vTableButton^.FontColor     := OrderDefaultButton.Menu.Font.Color;
    vTableButton^.BottomFontColor := OrderDefaultButton.Bottom.Font.Color;


    vTableButton^.Status        := 'New';
    TableNumber := Ifthen(TableNumber < 0, 0, TableNumber);
    if TypeRadioGroup.ItemIndex = 0 then
    begin
      TableNumber          := TableNumber + 1;
      vTableButton^.Number := TableNumber;
      vTableButton^.TableType    := 'T';
    end
    else
    begin
      vTableButton^.TableType     := 'W';
      vTableButton^.Number        := 0;
      vTableButton^.Name          := '벽';
      vTableButton^.Color         := $00400000;
      vTableButton^.NumberColor   := $00400000;
    end;

    vTableButton^.NoColor               := ColorToString(DefaultButton.Color);
    vTableButton^.FontNoColor           := ColorToString(DefaultButton.Font.Color);
    vTableButton^.BorderNoColor         := ColorToString(DefaultButton.BorderColor);
    vTableButton^.Options               := Format('%-30.30',['N']);

    ButtonCreate(vTableButton);
    isChanged         := True;
    SetNodesVisible(True);
    PositionNodes(TControl(CurrentButton));
  finally
    AddButton.Enabled := True;
  end;
end;

procedure TCodeTableForm.AllDeleteButtonClick(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select a.NO_TABLE '
             +'  from SL_ORDER_H as a inner join '
             +'       MS_TABLE   as b on b.CD_HEAD  = a.CD_HEAD '
             +'                      and b.CD_STORE = a.CD_STORE '
             +'                      and b.NO_TABLE = a.NO_TABLE '
             +'                      and b.CD_FLOOR = :P2 '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.DS_ORDER =''T'' '
             +' limit 1 ',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode]);
    if not Query.Eof then
    begin
      MsgBox('주문 중인 테이블이 있습니다'#13'주문내역이 있을때는 삭제할 수 없습니다');
      Exit;
    end;
  finally
    FinishQuery;
  end;

  try
    ExecQuery('delete from MS_TABLE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_FLOOR =:P2;',
             [HeadStoreCode,
              StoreCode,
              GetFloorCode]);
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
      Exit;
    end;
  end;

  ButtonAllClear;
  SelectButtonClear;
  CurrentButton := nil;
  TableNumber   := GetTableMaxNumber;
  TableNamePK   := 0;
  FloorSEQ      := GetFloorMaxSEQ;
  isChanged     := false;
end;

procedure TCodeTableForm.BottomAlignButtonClick(Sender: TObject);
var vBottom,
    vIndex :Integer;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;
  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        vBottom := TPosButton(SelectButton[vIndex]).Top+TPosButton(SelectButton[vIndex]).Height;
        Break;
      end;
    end;

  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        TPosButton(SelectButton[vIndex]).Top := vBottom - TPosButton(SelectButton[vIndex]).Height;
        TPosButton(SelectButton[vIndex]).BringToFront;
      end;
    end;
  isChanged := true;
end;

procedure TCodeTableForm.SizeAlignButtonClick(Sender: TObject);
var vSelIndex,
    vIndex :Integer;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;
  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        vSelIndex := vIndex;
        Break;
      end;
    end;

  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        TPosButton(SelectButton[vIndex]).Height := TPosButton(SelectButton[vSelIndex]).Height;
        TPosButton(SelectButton[vIndex]).Width  := TPosButton(SelectButton[vSelIndex]).Width;
        TPosButton(SelectButton[vIndex]).BringToFront;
      end;
    end;
  isChanged := true;
end;

procedure TCodeTableForm.ColorAlignButtonClick(Sender: TObject);
var vSelIndex,
    vIndex :Integer;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;
  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        vSelIndex := vIndex;
        Break;
      end;
    end;

  for vIndex := 0 to High(SelectButton) do
    if SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        TPosButton(SelectButton[vIndex]).Color               := TPosButton(SelectButton[vSelIndex]).Color;
        TPosButton(SelectButton[vIndex]).BorderColor         := TPosButton(SelectButton[vSelIndex]).BorderColor;
        TPosButton(SelectButton[vIndex]).Number.Font.Color   := TPosButton(SelectButton[vSelIndex]).Number.Font.Color;
        TPosButton(SelectButton[vIndex]).Menu.Font.Color     := TPosButton(SelectButton[vSelIndex]).Menu.Font.Color;
        TPosButton(SelectButton[vIndex]).Amount.Font.Color   := TPosButton(SelectButton[vSelIndex]).Amount.Font.Color;
        TPosButton(SelectButton[vIndex]).Bottom.Font.Color   := TPosButton(SelectButton[vSelIndex]).Bottom.Font.Color;
        TPosButton(SelectButton[vIndex]).Temp2               := TPosButton(SelectButton[vSelIndex]).Temp2;
        TPosButton(SelectButton[vIndex]).Temp3               := TPosButton(SelectButton[vSelIndex]).Temp3;
        TPosButton(SelectButton[vIndex]).Temp4               := TPosButton(SelectButton[vSelIndex]).Temp4;
        TPosButton(SelectButton[vIndex]).Temp5               := TPosButton(SelectButton[vSelIndex]).Temp5;
        TPosButton(SelectButton[vIndex]).Temp6               := TPosButton(SelectButton[vSelIndex]).Temp6;
        TPosButton(SelectButton[vIndex]).Repaint;
        TPosButton(SelectButton[vIndex]).BringToFront;
      end;
    end;
  isChanged := true;
end;

procedure TCodeTableForm.VerSpaceButtonClick(Sender: TObject);
var vTop, vBottom, vIndex :Integer;
    vGap: Double;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;

  SortData.Close;
  SortData.SortedField := 'top';
  SortData.open;
  for vIndex := 0 to High(SelectButton) do
    if  SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        if SortData.Locate('tableno', Integer(TPosButton(SelectButton[vIndex]).Number.Number),[loCaseInsensitive]) then Continue;

        SortData.Append;
        SortData.FieldByName('Index').AsInteger  := vIndex;
        SortData.FieldByName('top').AsInteger    := TPosButton(SelectButton[vIndex]).Top;
        SortData.FieldByName('tableno').AsInteger    := TPosButton(SelectButton[vIndex]).Number.Number;
      end;
    end;

  SortData.First;

  while not SortData.Eof do
  begin
    if SortData.RecNo = 1 then
      vTop := SortData.FieldByName('top').AsInteger
    else if SortData.RecNo = SortData.RecordCount then
      vBottom := SortData.FieldByName('top').AsInteger;
    SortData.Next;
  end;

  vGap := (vBottom - vTop) / (SortData.RecordCount-1);
  SortData.First;
  vIndex := 1;
  while not SortData.Eof do
  begin
    if (SortData.RecNo = 1) or (SortData.RecNo = SortData.RecordCount) then
      SortData.Next
    else
    begin
      TPosButton(SelectButton[SortData.FieldByName('index').AsInteger]).Top := Round(vTop + vGap * vIndex);
      Inc(vIndex);
      SortData.Next;
    end;
  end;
  SortData.Close;
end;

procedure TCodeTableForm.ZoomInButtonClick(Sender: TObject);
begin
  inherited;
  if Sender = ZoomInButton then
  begin
    if ZoomInButton.Tag > 3 then
    begin
      MsgBox('더이상 확대할 수 없습니다');
      Exit;
    end;    TablePanel.ScaleBy(110, 100);
    ZoomInButton.Tag   := ZoomInButton.Tag + 1;
    ZoomOutButton.Tag := ZoomOutButton.Tag - 1;
  end
  else
  begin
    if ZoomOutButton.Tag > 3 then
    begin
      MsgBox('더이상 축소할 수 없습니다');
      Exit;
    end;
    TablePanel.ScaleBy(91, 100);
    ZoomOutButton.Tag := ZoomOutButton.Tag + 1;
    ZoomInButton.Tag  :=  ZoomInButton.Tag - 1;
  end;
end;

procedure TCodeTableForm.HorSpaceButtonClick(Sender: TObject);
var vTop, vBottom, vIndex :Integer;
    vGap: Double;
begin
  inherited;
  if High(SelectButton) = 0 then Exit;

  SortData.Close;
  SortData.SortedField := 'left';
  SortData.open;
  for vIndex := 0 to High(SelectButton) do
    if  SelectButton[vIndex] is TPosButton then
    begin
      if TPosButton(SelectButton[vIndex]).Selected then
      begin
        if SortData.Locate('tableno', Integer(TPosButton(SelectButton[vIndex]).Number.Number),[loCaseInsensitive]) then Continue;
        SortData.Append;
        SortData.FieldByName('Index').AsInteger  := vIndex;
        SortData.FieldByName('left').AsInteger   := TPosButton(SelectButton[vIndex]).Left;
        SortData.FieldByName('tableno').AsInteger    := TPosButton(SelectButton[vIndex]).Number.Number;
      end;
    end;

  SortData.First;

  while not SortData.Eof do
  begin
    if SortData.RecNo = 1 then
      vTop := SortData.FieldByName('left').AsInteger
    else if SortData.RecNo = SortData.RecordCount then
      vBottom := SortData.FieldByName('left').AsInteger;
    SortData.Next;
  end;

  vGap := (vBottom - vTop) / (SortData.RecordCount-1);
  SortData.First;
  vIndex := 1;
  while not SortData.Eof do
  begin
    if (SortData.RecNo = 1) or (SortData.RecNo = SortData.RecordCount) then
      SortData.Next
    else
    begin
      TPosButton(SelectButton[SortData.FieldByName('index').AsInteger]).left := Round(vTop + vGap * vIndex);
      Inc(vIndex);
      SortData.Next;
    end;
  end;
  SortData.Close;
end;
end.
