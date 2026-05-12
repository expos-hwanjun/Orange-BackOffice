// 공통 코드 관리 (F)

unit HeadCode;

{
  01 : 지역
  02 : 주방프린터
  03 : 상권
  04 : 상품분류
  05 : 회원 구분
  06 : 발주제약
  07 : 보관방법
  12 : 포인트적립코드
  13 : 포인트사용코드
  15 : 시간대코드
  16 : 주방메모코드



  81 : 고객주문서하단문구
  82 : 배달수기주문서
  83 : 테이블그룹색생
  84 : (01)키오스크 디자인
  85 : (02)키오스크 디자인
  86 : DID 템플릿1 디자인
  87 : DID 템플릿2 디자인
  88 : DID 템플릿2 디자인

  88 : 주차권 하단문구 (예정)
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxControls, Math, StrUtils,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  StdCtrls, ExtCtrls, cxButtonEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvToolBar, AdvSplitter, cxLookAndFeelPainters,
  cxMemo, cxSpinEdit, cxTimeEdit, cxGroupBox, cxCurrencyEdit, AdvToolBarStylers,
  cxLookAndFeels, DBAccess, AdvGroupBox, AdvOfficePager, cxCheckListBox,
  cxCheckBox, Vcl.Menus, cxButtons, SBPosButton, Vcl.ComCtrls, TreeList,
  cxFontNameComboBox, JPEG, Vcl.ExtDlgs, Vcl.CheckLst, cxImage, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, PosButton, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, EncdDecd, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, AdvSmoothToggleButton,
  Vcl.Buttons, AdvSmoothButton, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePagerStylers;

type
  THeadCodeForm = class(TInheritGridEditForm)
    MenuScrollBox: TScrollBox;
    GridTableViewCode: TcxGridColumn;
    GridTableViewName: TcxGridColumn;
    CodeLabel: TLabel;
    CodeEdit: TcxTextEdit;
    Notebook: TNotebook;
    POSNoLabel: TLabel;
    LocalNameEdit: TcxTextEdit;
    MemberTypeNameLabel: TLabel;
    MemberTypeNameEdit: TcxTextEdit;
    MemberTypeUseLabel: TLabel;
    MemberTypeUseComboBox: TcxComboBox;
    GuestTypeNameLabel: TLabel;
    GuestTypeUseLabel: TLabel;
    SaleZoneNameEdit: TcxTextEdit;
    SaleZoneUseComboBox: TcxComboBox;
    TimeZoneLabel: TLabel;
    TimeZoneUseLabel: TLabel;
    TimeZoneEdit: TcxMaskEdit;
    TimeZoneUseComboBox: TcxComboBox;
    TimeZoneAutoGroupBox: TcxGroupBox;
    TimeZoneAutoLabel: TLabel;
    TimeZoneAutoStartTimeEdit: TcxTimeEdit;
    TimeZoneAutoIntervalEdit: TcxSpinEdit;
    PointSaveNameLabel: TLabel;
    PointSaveLabel: TLabel;
    PointSaveUseLabel: TLabel;
    PointSavePointLabel: TLabel;
    PointSaveNameEdit: TcxTextEdit;
    PointSaveEdit: TcxCurrencyEdit;
    PointSaveUseComboBox: TcxComboBox;
    PointUseNameLabel: TLabel;
    PointUseLabel: TLabel;
    PointUsePointLabel: TLabel;
    PointUseUseLabel: TLabel;
    PointUseNameEdit: TcxTextEdit;
    PointUseEdit: TcxCurrencyEdit;
    PointUseUseComboBox: TcxComboBox;
    PointSaveSaleComboBox: TcxComboBox;
    PointSaveSaleLabel: TLabel;
    PointUseSaleLabel: TLabel;
    PointUseSaleComboBox: TcxComboBox;
    GridTableViewDsStatus: TcxGridColumn;
    PosUseLabel: TLabel;
    LocalUseComboBox: TcxComboBox;
    Label9: TLabel;
    KitchenNameEdit: TcxTextEdit;
    Label11: TLabel;
    KitchenUseComboBox: TcxComboBox;
    Label31: TLabel;
    MemberDcRateEdit: TcxCurrencyEdit;
    Label32: TLabel;
    PointGroupBox: TAdvGroupBox;
    Label33: TLabel;
    MemberCashAmountEdit: TcxCurrencyEdit;
    MemberCashPointEdit: TcxSpinEdit;
    Label34: TLabel;
    MemberCardPointEdit: TcxSpinEdit;
    MemberCardAmountEdit: TcxCurrencyEdit;
    Label35: TLabel;
    MemberCashRcpPointEdit: TcxSpinEdit;
    MemberCashRcpAmountEdit: TcxCurrencyEdit;
    KitchenMemoNameLabel: TLabel;
    Label54: TLabel;
    KitchenMemoNameEdit: TcxTextEdit;
    KitchenMemoUseComboBox: TcxComboBox;
    OpenPictureDialog: TOpenPictureDialog;
    Label1: TLabel;
    MemberGiftAmountEdit: TcxCurrencyEdit;
    MemberGiftPointEdit: TcxSpinEdit;
    Label4: TLabel;
    MemberTrustAmountEdit: TcxCurrencyEdit;
    MemberTrustPointEdit: TcxSpinEdit;
    Label5: TLabel;
    MemberPointAmountEdit: TcxCurrencyEdit;
    MemberPointPointEdit: TcxSpinEdit;
    Label28: TLabel;
    MemberTypeComboBox: TcxComboBox;
    AdvGroupBox1: TAdvGroupBox;
    Label2: TLabel;
    Label47: TLabel;
    Label29: TLabel;
    Label50: TLabel;
    MemberTypeSaleAmtEdit: TcxCurrencyEdit;
    MemberSaleCountEdit: TcxSpinEdit;
    MemberClassNotChangeCheckBox: TcxCheckBox;
    Label6: TLabel;
    OrderLimitNameEdit: TcxTextEdit;
    Label7: TLabel;
    OrderLimitUseComboBox: TcxComboBox;
    WeeklyGroupBox: TcxGroupBox;
    MonCheckBox: TcxCheckBox;
    TueCheckBox: TcxCheckBox;
    WedCheckBox: TcxCheckBox;
    ThuCheckBox: TcxCheckBox;
    FriCheckBox: TcxCheckBox;
    SatCheckBox: TcxCheckBox;
    SunCheckBox: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    OrderTimeFromEdit: TcxTimeEdit;
    OrderTimeToEdit: TcxTimeEdit;
    DCTimeLabel: TLabel;
    OrderLimitButton: TAdvSmoothToggleButton;
    AdvSmoothToggleButton2: TAdvSmoothToggleButton;
    AdvSmoothToggleButton3: TAdvSmoothToggleButton;
    AdvSmoothToggleButton4: TAdvSmoothToggleButton;
    KitchenButton: TAdvSmoothToggleButton;
    PointUseButton: TAdvSmoothToggleButton;
    PointAddButton: TAdvSmoothToggleButton;
    MemberTypeButton: TAdvSmoothToggleButton;
    AdvSmoothToggleButton9: TAdvSmoothToggleButton;
    StoreLocalButton: TAdvSmoothToggleButton;
    KeepButton: TAdvSmoothToggleButton;
    Label3: TLabel;
    GoodsClassNameEdit: TcxTextEdit;
    Label8: TLabel;
    GoodsClassUseComboBox: TcxComboBox;
    Label10: TLabel;
    KeepNameEdit: TcxTextEdit;
    Label12: TLabel;
    KeepUseComboBox: TcxComboBox;
    PointAddTypeLabel: TLabel;
    SelectAllButton: TAdvSmoothButton;
    TimeZoneAutoButton: TAdvSmoothButton;

    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure TimeZoneAutoButtonClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure StoreLocalButtonClick(Sender: TObject);
    procedure SelectAllButtonClick(Sender: TObject);

  private
    SelectedIndex, BeforeIndex: Integer;
    PosMacAddres :String;
    VanCode      :String;
    procedure SetFocus(aIndex:Integer);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  HeadCodeForm: THeadCodeForm;



implementation

uses
  Common, DBModule, ProxyCheck, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure THeadCodeForm.FormCreate(Sender: TObject);
begin
  inherited;
  //메뉴별로 포인트적립시에는 안보이게 한다
  PointGroupBox.Visible := GetHeadOption(258) = '0';
  if not PointGroupBox.Visible then
  begin
    MemberTypeUseLabel.Top    := PointGroupBox.Top;
    MemberTypeUseComboBox.Top := PointGroupBox.Top-2;
    PointAddTypeLabel.Visible := true;
  end;

  MemberTypeButton.Visible := GetStoreOption(5) = '1';
  PointAddButton.Visible   := GetStoreOption(5) = '1';
  PointUseButton.Visible   := GetStoreOption(5) = '1';

  if GetStoreOption(8) = '0' then
  begin
    OrderLimitButton.Visible := false;
    KeepButton.Visible       := false;
  end;
end;

procedure THeadCodeForm.FormShow(Sender: TObject);
var
  vCode  :PStrPointer;
  vIndex :Integer;
begin
  inherited;
  isChanged := false;
  SetWorkStoreList;

  // 기본적으로 첫 번째 버튼을 누른다
  StoreLocalButton.Click;
end;

procedure THeadCodeForm.GridTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color  := clHighlightText;
  end;
//  inherited;
end;

procedure THeadCodeForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[2] = '1' then
    AStyle := StyleFontRed;
end;

procedure THeadCodeForm.SelectAllButtonClick(Sender: TObject);
begin
  inherited;
  SelectAllButton.Tag := Ifthen(SelectAllButton.Tag = 0, 1, 0);
  MonCheckBox.Checked := SelectAllButton.Tag = 1;
  TueCheckBox.Checked := SelectAllButton.Tag = 1;
  WedCheckBox.Checked := SelectAllButton.Tag = 1;
  ThuCheckBox.Checked := SelectAllButton.Tag = 1;
  FriCheckBox.Checked := SelectAllButton.Tag = 1;
  SatCheckBox.Checked := SelectAllButton.Tag = 1;
  SunCheckBox.Checked := SelectAllButton.Tag = 1;
end;

procedure THeadCodeForm.SetFocus(aIndex: Integer);
var vIndex :Integer;
begin
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TcxTextEdit) and (TcxTextEdit(Components[vIndex]).Parent = TWinControl(NoteBook.Pages[aIndex]) )
       and (TcxTextEdit(Components[vIndex]).TabOrder = 0) then
    begin
      TcxTextEdit(Components[vIndex]).SetFocus;
      Break;
    end;
end;

procedure THeadCodeForm.StoreLocalButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  // 변경된 자료가 있을 때는 저장부터 한다
  if isChanged then
  begin
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  // 모든 버튼 활성화
  for vIndex := 0 to ComponentCount-1 do
    if (Components[vIndex] is TAdvGlowButton) and (TAdvSmoothToggleButton(Components[vIndex]).Parent = MenuScrollBox) then
      TAdvSmoothToggleButton(Components[vIndex]).Down := false;
  // 현재 누른 버튼 비활성화
  TAdvSmoothToggleButton(Sender).Down := true;

  SelectedIndex := (Sender as TAdvSmoothToggleButton).Tag;

//  NoteBook.PageIndex := SelectedIndex-1;
  NoteBook.ActivePage := (Sender as TAdvSmoothToggleButton).Hint;
  ClearEdit;
  GridTableView.DataController.RecordCount := 0;
  ButtonToolBarSearchButton.Click;

  if GridTableView.DataController.RecordCount = 0 then
    MainPanel.Enabled := False;
  BeforeIndex := SelectedIndex;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 내용을 변경할 때
procedure THeadCodeForm.EditPropertiesChange(Sender: TObject);
var
  vLength: Integer;
  vCode  :PStrPointer;
  vTemp  :String;
begin
  inherited;
if Sender = MemberTypeComboBox then
  begin
    MemberDcRateEdit.Enabled := MemberTypeComboBox.ItemIndex = 0;
    PointGroupBox.Enabled    := MemberTypeComboBox.ItemIndex = 1;
  end;

  isChanged := true;
end;
//------------------------------------------------------------------------------
// 입력창 내용을 검증할 때
procedure THeadCodeForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vChanged: Boolean;
begin
  inherited;

  // 코드
  if (Sender = CodeEdit) and (Length(DisplayValue) <> 3) then
  begin
    vChanged     := isChanged;
    DisplayValue := LPad(DisplayValue, 3, '0');
    if not vChanged then
      isChanged  := false;
  end;
end;
//------------------------------------------------------------------------------
// 시간대 자동생성 버튼
procedure THeadCodeForm.TimeZoneAutoButtonClick(Sender: TObject);
var
  vTime   : TTime;
  vCode   : Integer;
  vTimeStr: string;
begin
  inherited;

  try
    // 인터벌을 30분 간격으로 수정
    if (TimeZoneAutoIntervalEdit.Value mod 30) <> 0 then
      TimeZoneAutoIntervalEdit.Value := TimeZoneAutoIntervalEdit.Value div 30 * 30;

    // 기존 자료 지우기
    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =''15'';',
              [HeadStoreCode,
              StandardStore],
               false);

    // 신규로 자료 입력
    vTime := TimeZoneAutoStartTimeEdit.Time;
    vCode := 1;
    while True do
    begin
      vTimeStr := FormatDateTime('hh:nn ~ ', vTime)+FormatDateTime('hh:nn', vTime+((1/(24*60*60))*(60*TimeZoneAutoIntervalEdit.Value)));
      ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, DS_STATUS, CD_SAWON_CHG, DT_CHANGE) '
               +'            values (:P0, :P1, ''15'', :P2, :P3, ''0'', :P4, Now()); ',
                [HeadStoreCode,
                StandardStore,
                 LPad(IntToStr(vCode), 3, '0'),
                 vTimeStr,
                 UserCode],
                 false);
      vTime := vTime + ((1/(24*60*60))*(60*TimeZoneAutoIntervalEdit.Value));
      Inc(vCode);
      if vCode > (24*60 div TimeZoneAutoIntervalEdit.Value) then
        Break;
    end;

    ExecQuery(TempSQL, [], true);

    // 입력한 자료 새로 조회
    ButtonToolBarSearchButton.Click;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function THeadCodeForm.DoSearch: Boolean;
begin
  OpenQuery('select CD_CODE, '
           +'       NM_CODE1, '
           +'       DS_STATUS '
           +'  from MS_CODE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and CD_KIND  = :P2 '
           +' order by CD_CODE',
            [HeadStoreCode,
             StandardStore,
             FormatFloat('00', SelectedIndex)]);
  DM.ReadQuery(Query, GridTableView);
  Result := true;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure THeadCodeForm.DoGridLink;
var
  vStream    : TStream;
  vJPG       : TJPEGImage;
  vIndex     : Integer;
  vCode      : PStrPointer;
begin
  inherited;

  CodeEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index];
  CodeEdit.Properties.ReadOnly := not isNew;

  OpenQuery('select   DS_STATUS, '
           +'         NM_CODE1,  NM_CODE2,  NM_CODE3,  NM_CODE4,  NM_CODE5,  NM_CODE6,  NM_CODE7,  NM_CODE8,  NM_CODE9,  NM_CODE10, '
           +'         NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, NM_CODE19, NM_CODE20, '
           +'         NM_CODE21, NM_CODE22, NM_CODE23, NM_CODE24, NM_CODE25, NM_CODE26, NM_CODE27, NM_CODE28, NM_CODE29, NM_CODE30, '
           +'         NM_CODE31, NM_CODE32, NM_CODE33, NM_CODE34, NM_CODE35, NM_CODE36, NM_CODE37, NM_CODE38, NM_CODE39, NM_CODE40, '
           +'         IMAGEDATA '
           +'from     MS_CODE '
           +'where    CD_HEAD  = :P0 '
           +'  and    CD_STORE = :P1 '
           +'  and    CD_KIND  = :P2 '
           +'  and    CD_CODE  = :P3',
            [HeadStoreCode,
            StandardStore,
             FormatFloat('00', SelectedIndex),
             CodeEdit.Text]);
  try
    case SelectedIndex of
       1 : // 지역
       begin
         LocalNameEdit.Text                    := Query.Fields[ 1].AsString;
         LocalUseComboBox.ItemIndex            := StoI(Query.Fields[ 0].AsString);
       end;
       2 : // 주방프린터
       begin
         KitchenNameEdit.Text                    := Query.Fields[ 1].AsString;
         KitchenUseComboBox.ItemIndex            := StoI(Query.Fields[ 0].AsString);
       end;
       3 : //상권
       begin
         SaleZoneNameEdit.Text                := Query.Fields[ 1].AsString;
         SaleZoneUseComboBox.ItemIndex        := StoI(Query.Fields[ 0].AsString);
       end;
       4 : //상품분류
       begin
         GoodsClassNameEdit.Text                := Query.Fields[ 1].AsString;
         GoodsClassUseComboBox.ItemIndex        := StoI(Query.Fields[ 0].AsString);
       end;
       5 : //회원구분
       begin
         MemberTypeNameEdit.Text               := Query.Fields[ 1].AsString;
         MemberDcRateEdit.Value                := StrToFloatDef(Query.Fields[2].AsString, 0);
         MemberTypeSaleAmtEdit.Value           := StrToIntDef(Query.Fields[3].AsString, 0);
         MemberSaleCountEdit.Value             := StrToIntDef(Query.Fields[4].AsString, 0);
         MemberCashAmountEdit.Value            := StrToIntDef(Query.Fields[5].AsString, 0);
         MemberCashPointEdit.Value             := StrToIntDef(Query.Fields[6].AsString, 0);
         MemberCardAmountEdit.Value            := StrToIntDef(Query.Fields[7].AsString, 0);
         MemberCardPointEdit.Value             := StrToIntDef(Query.Fields[8].AsString, 0);
         MemberCashRcpAmountEdit.Value         := StrToIntDef(Query.Fields[9].AsString, 0);
         MemberCashRcpPointEdit.Value          := StrToIntDef(Query.Fields[10].AsString, 0);
         MemberGiftAmountEdit.Value            := StrToIntDef(Query.Fields[11].AsString, 0);
         MemberGiftPointEdit.Value             := StrToIntDef(Query.Fields[12].AsString, 0);
         MemberTrustAmountEdit.Value           := StrToIntDef(Query.Fields[13].AsString, 0);
         MemberTrustPointEdit.Value            := StrToIntDef(Query.Fields[14].AsString, 0);
         MemberPointAmountEdit.Value           := StrToIntDef(Query.Fields[15].AsString, 0);
         MemberPointPointEdit.Value            := StrToIntDef(Query.Fields[16].AsString, 0);
         MemberTypeComboBox.ItemIndex          := StrToIntDef(Query.Fields[17].AsString, 0);
         MemberClassNotChangeCheckBox.Checked  := Query.Fields[18].AsString = '1';
         MemberTypeUseComboBox.ItemIndex       := StoI(Query.Fields[ 0].AsString);
       end;
       6 : //발주제약
       begin
         OrderLimitNameEdit.Text                := Query.Fields[ 1].AsString;
         SunCheckBox.Checked                    := Copy(Query.Fields[2].AsString,1,1) = '1';
         MonCheckBox.Checked                    := Copy(Query.Fields[2].AsString,2,1) = '1';
         TueCheckBox.Checked                    := Copy(Query.Fields[2].AsString,3,1) = '1';
         WedCheckBox.Checked                    := Copy(Query.Fields[2].AsString,4,1) = '1';
         ThuCheckBox.Checked                    := Copy(Query.Fields[2].AsString,5,1) = '1';
         FriCheckBox.Checked                    := Copy(Query.Fields[2].AsString,6,1) = '1';
         SatCheckBox.Checked                    := Copy(Query.Fields[2].AsString,7,1) = '1';
         OrderTimeFromEdit.Time                  := StoT(Query.Fields[3].AsString);
         OrderTimeToEdit.Time                    := StoT(Query.Fields[4].AsString);
         OrderLimitUseComboBox.ItemIndex        := StoI(Query.Fields[ 0].AsString);
       end;

       12 : // 포인트 적립
        begin
          PointSaveNameEdit.Text                 := Query.Fields[ 1].AsString;
          PointSaveEdit.Value                    := StoF(Query.Fields[ 2].AsString);
          PointSaveSaleComboBox.ItemIndex        := StoI(Query.Fields[ 3].AsString);
          PointSaveUseComboBox.ItemIndex         := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and PointSaveNameEdit.Enabled then
            PointSaveNameEdit.SetFocus;
        end;
       13 : // 포인트 사용
        begin
          PointUseNameEdit.Text                  := Query.Fields[ 1].AsString;
          PointUseEdit.Value                     := StoF(Query.Fields[ 2].AsString);
          PointUseUseComboBox.ItemIndex          := StoI(Query.Fields[ 0].AsString);
          PointUseSaleComboBox.ItemIndex         := StoI(Query.Fields[ 3].AsString);
          if MainPanel.Enabled and PointUseNameEdit.Enabled then
            PointUseNameEdit.SetFocus;
        end;
       15 : // 시간대
        begin
          TimeZoneEdit.Text                      := Query.Fields[ 1].AsString;
          TimeZoneUseComboBox.ItemIndex          := StoI(Query.Fields[ 0].AsString);
          if MainPanel.Enabled and TimeZoneEdit.Enabled then
            TimeZoneEdit.SetFocus;
        end;
       16 : //주방메모
        begin
          KitchenMemoNameEdit.Text               := Query.Fields[ 1].AsString;
          KitchenMemoUseComboBox.ItemIndex       := StoI(Query.Fields[ 0].AsString);
        end;
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 신규
function THeadCodeForm.DoNew: Boolean;
var
  vKind  :string;
  vIndex :Integer;
  vCode      : PStrPointer;
begin
  vKind := FormatFloat('00', SelectedIndex);
  OpenQuery('select Max(CD_CODE) as CODE '
           +'  from MS_CODE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and CD_KIND  = :P2',
            [HeadStoreCode,
             StandardStore,
             vKind]);
  try
    CodeEdit.Text := LPad(IntToStr(StoI(Query.Fields[0].AsString)+1), 3, '0');
  finally
    FinishQuery;
  end;

  MainPanel.Enabled := True;

  // 코드 수동 입력
  if not CheckOption(2) and (SelectedIndex <> 1) then
    CodeEdit.SetFocus;

  CodeEdit.Properties.ReadOnly  := false;
  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function THeadCodeForm.DoDelete: Boolean;
const
  msgDontDelete = '프로그램에서 사용하는 코드이므로 삭제할 수 없습니다.';
  msgUseCode    = '사용내역이 있어 삭제할 수 없습니다';
begin
  Result := false;

  if not AskBox('공통 코드는 다른 프로그램에서 사용했을 가능성이 높으므로 삭제하지 말고, ''사용여부''를 [사용 안 함]으로 선택하는 것이 좋습니다.'#13#13+'그래도 삭제하시겠습니까?') then
    Exit;

  case SelectedIndex of
     2 :
      begin
        try
          DM.OpenQuery('select count(*) '
                      +'  from MS_MENU '
                      +' where CD_HEAD  =:P0 '
                      +'   and CD_STORE =:P1 '
                      +'   and CD_PRINTER like ConCat(''%'',:P2,''%'') ',
                      [HeadStoreCode,
                       StandardStore,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
     5 : //회원구분
      begin
        try
          DM.OpenQuery('select count(*) '
                      +'  from MS_MEMBER '
                      +' where CD_HEAD   =:P0 '
                      +'   and CD_STORE  =:P1 '
                      +'   and DS_MEMBER =:P2 ',
                      [HeadStoreCode,
                      StandardStore,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
    12,13 : // 포인트 적립/사용
      begin
        try
          DM.OpenQuery('select count(*) '
                      +'  from SL_POINT '
                      +' where CD_HEAD  =:P0 '
                      +'   and CD_STORE =:P1 '
                      +'   and CD_CODE  =:P2 ',
                      [HeadStoreCode,
                      StandardStore,
                       CodeEdit.Text]);
          if DM.Query.Fields[0].AsInteger > 0 then
          begin
            ErrBox(msgUseCode);
            Exit;
          end;
        finally
          DM.FinishQuery;
        end;
      end;
  end;

  Result := ExecQuery('delete from MS_CODE '
                     +' where CD_HEAD  =:P0 '
                     +'   and CD_STORE =:P1 '
                     +'   and CD_KIND  =:P2 '
                     +'   and CD_CODE  =:P3;',
                      [HeadStoreCode,
                      StandardStore,
                       LPad(IntToStr(SelectedIndex), 2, '0'),
                       GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index]]);
end;
//------------------------------------------------------------------------------
// 저장
function THeadCodeForm.DoSave: Boolean;
const
  SQL            = 'select   CD_CODE '
                  +' from    MS_CODE '
                  +'where    CD_HEAD   = :P0 '
                  +'  and    CD_STORE  = :P1 '
                  +'  and    CD_KIND   = :P2 '
                  +'  and    DS_STATUS = ''0'' ';
  SQL_CODE       = '  and    CD_CODE   = :P3 ';
  SQL_NAME1      = '  and    NM_CODE1  = :P3 ';
  SQL_NAME2      = '  and    NM_CODE2  = :P5 ';
  msgDontSave    = '프로그램에서 사용되는 코드이므로 입력할 수 없습니다.';
  msgDontLocalIP = 'POS가 2대 이상일 때는 127.0.0.1 IP를 사용할 수 없습니다.';
var
  vKind: string;
  vList: TStringList;
  vProxyCheck:Boolean;
  vTemp, vTemp1:String;
  vIndex:Integer;
  vStream    : TMemoryStream;
  vJPG       : TJPEGImage;
  vCode6, vCode14 : String;
  vTID1, vTID2 :String;
  vSQL, vP8, vP9, vP10, vP11 :String;
begin
  Result      := false;
  vProxyCheck := false;
  vKind  := LPad(IntToStr(SelectedIndex), 2, '0');

  // 필수 입력 자료 확인
  if Trim(CodeEdit.Text) = EmptyStr then
  begin
    ErrBox(Replace(CodeEdit.Text, '　', '')+msgMustInput);
    if MainPanel.Enabled and CodeEdit.Enabled then
      CodeEdit.SetFocus;
    Exit;
  end
  // 자료 중복 검사
  else if isNew and
          OpenQuery(SQL+SQL_CODE,
                   [HeadStoreCode,
                   StandardStore, vKind, CodeEdit.Text],
                    true) then
  begin
    ErrBox('이미 사용 중인 코드입니다.');
    if MainPanel.Enabled and CodeEdit.Enabled then
      CodeEdit.SetFocus;
    Exit;
  end;

  case SelectedIndex of
      1  :
      begin
        if Trim(LocalNameEdit.Text) = '' then
        begin
           MsgBox('지역명을 입력하세요');
           KitchenNameEdit.SetFocus;
           Exit;
        end;
      end;
      2  :
      begin
        if Trim(KitchenNameEdit.Text) = '' then
        begin
           MsgBox('주방명을 입력하세요');
           KitchenNameEdit.SetFocus;
           Exit;
        end;
      end;
      3 :
      begin
        if Trim(SaleZoneNameEdit.Text) = '' then
        begin
           MsgBox('상권명을 입력하세요');
           SaleZoneNameEdit.SetFocus;
           Exit;
        end;
      end;
      4 :
      begin
        if Trim(GoodsClassNameEdit.Text) = '' then
        begin
           MsgBox('분류명을 입력하세요');
           GoodsClassNameEdit.SetFocus;
           Exit;
        end;
      end;
     5 : // 회원 구분
      if Trim(MemberTypeNameEdit.Text) = '' then
      begin
        ErrBox(MemberTypeNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and MemberTypeNameEdit.Enabled then
          MemberTypeNameEdit.SetFocus;
        Exit;
      end;
     6 : //발주제약
      begin
        if Trim(OrderLimitNameEdit.Text) = '' then
        begin
           MsgBox('발주제약명을 입력하세요');
           OrderLimitNameEdit.SetFocus;
           Exit;
        end;

        if not MonCheckBox.Checked and
          not TueCheckBox.Checked and
          not WedCheckBox.Checked and
          not ThuCheckBox.Checked and
          not FriCheckBox.Checked and
          not SatCheckBox.Checked and
          not SunCheckBox.Checked then
        begin
          ErrBox('발주가능 요일을 하나 이상 선택하십시오');
          Exit;
        end;
      end;
     7 : // 보관방법
      if Trim(KeepNameEdit.Text) = '' then
      begin
        ErrBox('보관방법을 입력하세요');
        Exit;
      end;
    12 : // 포인트 적립
      if Trim(PointSaveNameEdit.Text) = EmptyStr then
      begin
        ErrBox(PointSaveNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and PointSaveNameEdit.Enabled then
          PointSaveNameEdit.SetFocus;
        Exit;
      end;
    13 : // 포인트 사용
      if Trim(PointUseNameEdit.Text) = EmptyStr then
      begin
        ErrBox(PointUseNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and PointUseNameEdit.Enabled then
          PointUseNameEdit.SetFocus;
        Exit;
      end;
    15 : // 시간대
      if Trim(TimeZoneEdit.Text) = EmptyStr then
      begin
        ErrBox(TimeZoneLabel.Caption+msgMustInput);
        if MainPanel.Enabled and TimeZoneEdit.Enabled then
          TimeZoneEdit.SetFocus;
        Exit;
      end;
    16 : // 주방메모
      if Trim(KitchenMemoNameEdit.Text) = EmptyStr then
      begin
        ErrBox(KitchenMemoNameLabel.Caption+msgMustInput);
        if MainPanel.Enabled and KitchenMemoNameEdit.Enabled then
          KitchenMemoNameEdit.SetFocus;
        Exit;
      end;
  end;


  // 저장
  try
    case SelectedIndex  of
       1 :  //지역
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6;',
                   [HeadStoreCode,                                                      //p0
                    StandardStore,                                                      //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    LocalNameEdit.Text,                                                 //p4        //NM_CODE1
                    UserCode,                                                           //p6
                    IntToStr(LocalUseComboBox.ItemIndex)],false);                      //p7

        end;
       2 :  //주방프린터
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6;',
                   [HeadStoreCode,                                                      //p0
                    StandardStore,                                                      //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    KitchenNameEdit.Text,                                               //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(KitchenUseComboBox.ItemIndex)],false);                      //p6
          for vIndex := 0 to WorkStoreList.Count-1 do
            ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                     +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                     +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                     +'                        CD_SAWON_CHG =:P5, '
                     +'                        DS_STATUS    =:P6;',
                     [HeadStoreCode,                                                      //p0
                      CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),                 //p1
                      LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                      CodeEdit.Text,                                                      //p3
                      KitchenNameEdit.Text,                                               //p4        //NM_CODE1
                      UserCode,                                                           //p5
                      IntToStr(KitchenUseComboBox.ItemIndex)],false);                      //p6

        end;
       3 :  //상권
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6;',
                   [HeadStoreCode,                                                      //p0
                    StandardStore,                                                      //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    SaleZoneNameEdit.Text,                                              //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(SaleZoneUseComboBox.ItemIndex)],false);                      //p6

        end;
       4 :  //상품분류
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6;',
                   [HeadStoreCode,                                                      //p0
                    StandardStore,                                                      //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    GoodsClassNameEdit.Text,                                              //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(GoodsClassUseComboBox.ItemIndex)],false);                      //p6

        end;
       5: // 회원 구분
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, NM_CODE9, NM_CODE10, '
                   +'                    NM_CODE11, NM_CODE12, NM_CODE13, NM_CODE14, NM_CODE15, NM_CODE16, NM_CODE17, NM_CODE18, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9,:P10,:P11,:P12,:P13,:P14,:P15,:P16,:P17,:P18,:P19,:P20,:P21,:P22,:P23) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        NM_CODE5     =:P8, '
                   +'                        NM_CODE6     =:P9, '
                   +'                        NM_CODE7     =:P10, '
                   +'                        NM_CODE8     =:P11, '
                   +'                        NM_CODE9     =:P12, '
                   +'                        NM_CODE10    =:P13, '
                   +'                        NM_CODE11    =:P14, '
                   +'                        NM_CODE12    =:P15, '
                   +'                        NM_CODE13    =:P16, '
                   +'                        NM_CODE14    =:P17, '
                   +'                        NM_CODE15    =:P18, '
                   +'                        NM_CODE16    =:P19, '
                   +'                        NM_CODE17    =:P20, '
                   +'                        NM_CODE18    =:P21, '
                   +'                        CD_SAWON_CHG =:P22, '
                   +'                        DS_STATUS    =:P23;',
                   [HeadStoreCode,                                                      //p0
                    StandardStore,                                                      //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    MemberTypeNameEdit.Text,                                            //p4        //NM_CODE1
                    FloatToStr(MemberDcRateEdit.EditValue),                             //p5
                    IntToStr(MemberTypeSaleAmtEdit.EditValue),                        //p6
                    IntToStr(MemberSaleCountEdit.EditValue),                          //p7
                    IntToStr(MemberCashAmountEdit.EditValue),                           //p8
                    IntToStr(MemberCashPointEdit.EditValue),                            //p9
                    IntToStr(MemberCardAmountEdit.EditValue),                           //p10
                    IntToStr(MemberCardPointEdit.EditValue),                            //p11
                    IntToStr(MemberCashRcpAmountEdit.EditValue),                        //p12
                    IntToStr(MemberCashRcpPointEdit.EditValue),                         //p13
                    IntToStr(MemberGiftAmountEdit.EditValue),                           //p14
                    IntToStr(MemberGiftPointEdit.EditValue),                            //p15
                    IntToStr(MemberTrustAmountEdit.EditValue),                          //p16
                    IntToStr(MemberTrustPointEdit.EditValue),                           //p17
                    IntToStr(MemberPointAmountEdit.EditValue),                          //p18
                    IntToStr(MemberPointPointEdit.EditValue),                           //p19
                    IntToStr(MemberTypeComboBox.ItemIndex),                             //p20
                    Ifthen(MemberClassNotChangeCheckBox.Checked,'1','0'),               //p21
                    UserCode,                                                           //p22
                    IntToStr(MemberTypeUseComboBox.ItemIndex)],false);                   //p23
        end;
       6 :  //발주제약
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,  NM_CODE3, NM_CODE4, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8,:P9) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        NM_CODE4     =:P7, '
                   +'                        CD_SAWON_CHG =:P8, '
                   +'                        DS_STATUS    =:P9;',
                   [HeadStoreCode,                                                      //p0
                    StandardStore,                                                      //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    OrderLimitNameEdit.Text,                                            //p4        //NM_CODE1
                    IfThen(SunCheckBox.Checked, '1', '0')+IfThen(MonCheckBox.Checked, '1', '0')+IfThen(TueCheckBox.Checked, '1', '0')+IfThen(WedCheckBox.Checked, '1', '0')+IfThen(ThuCheckBox.Checked, '1', '0')+IfThen(FriCheckBox.Checked, '1', '0')+IfThen(SatCheckBox.Checked, '1', '0'),  //P5
                    FormatDateTime(fmtTime, OrderTimeFromEdit.Time),                    //p6
                    FormatDateTime(fmtTime, OrderTimeToEdit.Time),                      //p7
                    UserCode,                                                           //p8
                    IntToStr(OrderLimitUseComboBox.ItemIndex)],false);                  //p9

        end;
       7 :  //보관방법
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6;',
                   [HeadStoreCode,                                                      //p0
                    StandardStore,                                                      //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    KeepNameEdit.Text,                                                  //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(KeepUseComboBox.ItemIndex)],false);                        //p6

        end;
      12 : // 포인트 적립
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        CD_SAWON_CHG =:P7, '
                   +'                        DS_STATUS    =:P8; ',
                   [HeadStoreCode,                                                      //p0
                   StandardStore,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    PointSaveNameEdit.Text,                                             //p4        //NM_CODE1
                    FloatToStr(PointSaveEdit.Value),                                    //p5        //NM_CODE2
                    IntToStr(PointSaveSaleComboBox.ItemIndex),                          //p6        //NM_CODE3
                    UserCode,                                                           //p7
                    IntToStr(PointSaveUseComboBox.ItemIndex)],false);                    //p8
        end;
      13 : // 포인트 사용
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2,NM_CODE3, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6,:P7,:P8) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        NM_CODE2     =:P5, '
                   +'                        NM_CODE3     =:P6, '
                   +'                        CD_SAWON_CHG =:P7, '
                   +'                        DS_STATUS    =:P8; ',
                   [HeadStoreCode,                                                      //p0
                   StandardStore,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    PointUseNameEdit.Text,                                              //p4        //NM_CODE1
                    FloatToStr(PointUseEdit.Value),                                     //p5        //NM_CODE2
                    IntToStr(PointUseSaleComboBox.ItemIndex),                           //p6        //NM_CODE3
                    UserCode,                                                           //p7
                    IntToStr(PointSaveUseComboBox.ItemIndex)],false);                    //p8
        end;
      15 : // 시간대
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                   StandardStore,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    TimeZoneEdit.Text,                                                  //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(TimeZoneUseComboBox.ItemIndex)],false);                     //p6
        end;
      16 : // 주방메모
        begin
          ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                   +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                   +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                   +'                        CD_SAWON_CHG =:P5, '
                   +'                        DS_STATUS    =:P6; ',
                   [HeadStoreCode,                                                      //p0
                   StandardStore,                                                          //p1
                    LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                    CodeEdit.Text,                                                      //p3
                    KitchenMemoNameEdit.Text,                                           //p4        //NM_CODE1
                    UserCode,                                                           //p5
                    IntToStr(KitchenMemoUseComboBox.ItemIndex)],false);                  //p6

          for vIndex := 0 to WorkStoreList.Count-1 do
            ExecQuery('insert into MS_CODE(CD_HEAD, CD_STORE, CD_KIND, CD_CODE, NM_CODE1, CD_SAWON_CHG, DS_STATUS)'
                     +'             values(:P0,:P1,:P2,:P3,:P4,:P5,:P6) '
                     +'ON DUPLICATE KEY UPDATE NM_CODE1     =:P4, '
                     +'                        CD_SAWON_CHG =:P5, '
                     +'                        DS_STATUS    =:P6; ',
                     [HeadStoreCode,                                                      //p0
                      CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),                 //p1
                      LPad(IntToStr(SelectedIndex), 2, '0'),                              //p2
                      CodeEdit.Text,                                                      //p3
                      KitchenMemoNameEdit.Text,                                           //p4        //NM_CODE1
                      UserCode,                                                           //p5
                      IntToStr(KitchenMemoUseComboBox.ItemIndex)],false);                  //p6

        end;
    end;

    Result := ExecQuery('',[],true);
    if not Result then Exit;


    // 그리드 수정
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := CodeEdit.Text;
      case SelectedIndex  of
         1   : NewData[1] := LocalNameEdit.Text;
         2   : NewData[1] := KitchenNameEdit.Text;
         3   : NewData[1] := SaleZoneNameEdit.Text;
         5   : NewData[1] := MemberTypeNameEdit.Text;
        12   : NewData[1] := PointSaveNameEdit.Text;
        13   : NewData[1] := PointUseNameEdit.Text;
        15   : NewData[1] := TimeZoneEdit.Text;
        16   : NewData[1] := KitchenMemoNameEdit.Text;
      end;
    end
    else
    begin
      case SelectedIndex of
         1   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := LocalNameEdit.Text;
         2   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := KitchenNameEdit.Text;
         3   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := SaleZoneNameEdit.Text;
         5   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := MemberTypeNameEdit.Text;
        12   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := PointSaveNameEdit.Text;
        13   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := PointUseNameEdit.Text;
        15   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := TimeZoneEdit.Text;
        16   : GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := KitchenMemoNameEdit.Text;
      end;
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
