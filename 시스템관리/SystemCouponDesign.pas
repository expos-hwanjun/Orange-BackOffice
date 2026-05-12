// 프라이스태그는 MS_PRINT_H/D의 DS_PRINT가 0이고
// 티켓에서는 DS_PRINT를 1로 쓴다

unit SystemCouponDesign;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxControls, cxLookAndFeels, Math,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, AdvToolBar,
  AdvToolBarStylers, ExtCtrls, DBAccess, Uni, DB, MemDS, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, Menus,
  cxCheckBox, StdCtrls, cxButtons, cxButtonEdit, GIFImg, cxGroupBox,
  cxCurrencyEdit, cxClasses, dxGDIPlusClasses, StrUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TSystemCouponDesignForm = class(TInheritEditForm)
    MainPanel: TPanel;
    SizeLabel: TLabel;
    DirectionLabel: TLabel;
    TicketTypeLabel: TLabel;
    SizeHeightMMLabel: TLabel;
    RollbackLabel: TLabel;
    RollbackMMLabel: TLabel;
    SizeWidthEdit: TcxCurrencyEdit;
    SizeHeightEdit: TcxCurrencyEdit;
    RollbackEdit: TcxCurrencyEdit;
    DesignGroupBox: TcxGroupBox;
    DesignCommentLabel: TLabel;
    DesignLocationTopLabel: TLabel;
    DesignLocationTopMMLabel: TLabel;
    DesignLocationLeftLabel: TLabel;
    DesignLocationLeftMMLabel: TLabel;
    DesignLocationLabel: TLabel;
    DesignTextLabel: TLabel;
    DesignAlignmentLabel: TLabel;
    DesignTextCommentLabel: TLabel;
    DesignPanel: TPanel;
    DesignLocationTopEdit: TcxCurrencyEdit;
    DesignLocationLeftEdit: TcxCurrencyEdit;
    DesignTextEdit: TcxTextEdit;
    DesignCouponButton: TcxButton;
    DesignLabelButton: TcxButton;
    DesignDeleteButton: TButton;
    DesignAlignmentComboBox: TcxComboBox;
    TicketTypeComboBox: TcxComboBox;
    CutComboBox: TcxComboBox;
    SizeWidthMMLabel: TLabel;
    DesignPopupMenu: TPopupMenu;
    DesignPopupDcAmt: TMenuItem;
    DesignPopupUsePeriod: TMenuItem;
    DesignPopupBarCode: TMenuItem;
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
    GapSizeLabel: TLabel;
    GapSizeEdit: TcxCurrencyEdit;
    GapSizeMMLabel: TLabel;
    CutLengthLabel: TLabel;
    CutLengthEdit: TcxCurrencyEdit;
    CutLengthMMLabel: TLabel;
    CutLabel: TLabel;
    ButtonToolBarNewButton: TAdvGlowButton;
    DirectionCheckBox: TcxCheckBox;
    DegreeCheckBox: TcxCheckBox;
    CommentLabel: TLabel;
    DesignBarcode: TImage;
    DesignUsePeriod: TcxLabel;
    DesignDcAmt: TcxLabel;
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
    DesignPopupIssueDate: TMenuItem;
    DesignIssueDate: TcxLabel;
    DesignPopupReceiptNo: TMenuItem;
    DesignReceiptNo: TcxLabel;
    N1: TMenuItem;
    DesignMenuName: TcxLabel;
    DesignFontLabel: TLabel;
    DesignFontSizeLabel: TLabel;
    DesignFontSizeEdit: TcxCurrencyEdit;
    DesignFontBoldCheckBox: TcxCheckBox;
    DesignFontEnlargeLabel: TLabel;
    DesignFontEnlargeXCheckBox: TcxCheckBox;
    DesignFontEnlargeYCheckBox: TcxCheckBox;
    DesignFontComboBox: TcxComboBox;

    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure DesignPopupMenuPopup(Sender: TObject);
    procedure DesignPopupClick(Sender: TObject);
    procedure DesignPanelObjectClick(Sender: TObject);
    procedure DesignPanelObjectMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DesignPanelObjectMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DesignPanelObjectMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DesignDeleteButtonClick(Sender: TObject);
    procedure DesignEditPropertiesChange(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure DesignCouponButtonClick(Sender: TObject);
    procedure PrinterComboBoxPropertiesCloseUp(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);

  private
    fSelectedControl: TControl;
    MouseDowned     : Boolean;
    MouseOldX,
    MouseOldY       : Integer;

    procedure ClearTemplate;
    procedure ShowImage(aImage: TImage; aSelected: Boolean = true);

    procedure SetSelectedControl(aControl: TControl);
    property  SelectedControl: TControl read fSelectedControl write SetSelectedControl;

  protected
    function  DoSearch: Boolean; override;    // 조회
    function  DoNew: Boolean;                 // 신규
    function  DoDelete: Boolean; override;    // 삭제
    function  DoSave: Boolean; override;      // 저장
  end;

var
  SystemCouponDesignForm: TSystemCouponDesignForm;



implementation

uses
  Common, Main;

const
  mm2pt          = 4;
  FixedFontSize  = 10;
  prnBixolon     = '1';
  fmtVar         = '%s';
  msgPrice       = '5,000';

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSystemCouponDesignForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  isLoading := true;
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '1';
  ConditionToolBarComboBox.Properties.Items.AddObject('쿠폰', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  ConditionToolBarComboBox.Properties.Items.AddObject('티켓(식권)', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;
  isLoading := false;

  DoSearch;
end;
procedure TSystemCouponDesignForm.PrinterComboBoxPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 입력창 값을 변경할 때
procedure TSystemCouponDesignForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;

  // 프린터 기종, 티켓용지 종류
  if (Sender = TicketTypeComboBox) then
  begin

    RollbackEdit.Enabled       := true;
    GapSizeEdit.Enabled        := true;
    CutLengthEdit.Enabled      := true;
    CommentLabel.Caption       := EmptyStr;
    // Bixolon 프린터이고 블랙마크를 선택했으면 상세 설정을 못하게 수정
    if (TicketTypeComboBox.ItemIndex = 1) then
    begin
      RollbackEdit.Enabled     := false;
      GapSizeEdit.Enabled      := false;
      CommentLabel.Caption     := '프린터 아래 ''딥스위치''를 반드시 다음과 같이 조정하십시오.'#13'SW1-5 : Off, SW1-6 : Off, SW2-3 : On';
    end;
  end

  // 태그 크기
  else if Sender = SizeWidthEdit then
    DesignPanel.Width  := Trunc(SizeWidthEdit.Value  * mm2pt)
  else if Sender = SizeHeightEdit then
    DesignPanel.Height := Trunc(SizeHeightEdit.Value * mm2pt)
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 신규 버튼
procedure TSystemCouponDesignForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;

  if isChanged then
  begin
    if AskBox('변경된 자료를 저장 하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  DoNew;
  isChanged := true;
end;

//==============================================================================
// 디자인 패널
//------------------------------------------------------------------------------
// 디자인 팝업 메뉴를 보여줄 때
procedure TSystemCouponDesignForm.DesignPopupMenuPopup(Sender: TObject);
var
  vIndex: Integer;
begin
  // 팝업을 호출한 버튼과 연관된 메뉴만 보이게 한다
  for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
    if DesignPopupMenu.PopupComponent = DesignLabelButton then
      DesignPopupMenu.Items[vIndex].Visible := DesignPopupMenu.Items[vIndex].Tag >= 70
    else
      DesignPopupMenu.Items[vIndex].Visible := DesignPopupMenu.Items[vIndex].Tag < 30;

  inherited;
end;
procedure TSystemCouponDesignForm.DesignCouponButtonClick(Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 디자인 팝업 메뉴를 선택했을 때
procedure TSystemCouponDesignForm.DesignPopupClick(Sender: TObject);
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
      Break;
    end;
end;
//------------------------------------------------------------------------------
// 디자인 패널 객체를 선택할 때
procedure TSystemCouponDesignForm.DesignPanelObjectClick(Sender: TObject);
begin
  inherited;
  if isLoading then Exit;

  if Sender is TControl then
    SelectedControl := TControl(Sender);
end;
//------------------------------------------------------------------------------
// 디자인 패널 객체에서 마우스를 누를 때
procedure TSystemCouponDesignForm.DesignPanelObjectMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;
//------------------------------------------------------------------------------
// 디자인 패널 객체에서 마우스를 움직일 때
procedure TSystemCouponDesignForm.DesignPanelObjectMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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
procedure TSystemCouponDesignForm.DesignPanelObjectMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
procedure TSystemCouponDesignForm.DesignEditPropertiesChange(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if Assigned(SelectedControl) and (not isLoading) then
  begin
    isChanged := true;
    // 위치
    if Sender = DesignLocationTopEdit then
      SelectedControl.Top  := Trunc(DesignLocationTopEdit.Value  * mm2pt)
    else if Sender = DesignLocationLeftEdit then
      SelectedControl.Left := Trunc(DesignLocationLeftEdit.Value * mm2pt)
    // 글꼴, 글꼴 크기
    else if (Sender = DesignFontComboBox) or (Sender = DesignFontSizeEdit) then
    begin
      // 레이블
      if SelectedControl is TcxLabel then
      begin
        TcxLabel(SelectedControl).HelpContext   := Trunc(DesignFontSizeEdit.Value);  // 크기
        TcxLabel(SelectedControl).Style.Font.Size   := Trunc(DesignFontSizeEdit.Value) * 3;  // 1mm가 대략 글꼴3 포인트 정도 되지 않을까?
        if DesignFontEnlargeYCheckBox.Checked then
          TcxLabel(SelectedControl).Style.Font.Size := TcxLabel(SelectedControl).Style.Font.Size * 2;
      end
      // 바코드
      else
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
      TcxLabel(SelectedControl).HelpKeyword := IntToStr((IfThen(DesignFontEnlargeXCheckBox.Checked, 1, 0) + IfThen(DesignFontEnlargeYCheckBox.Checked, 2, 0))) +
                                                IntToStr(DesignAlignmentComboBox.ItemIndex);
      if (Sender = DesignFontEnlargeXCheckBox) or (Sender = DesignFontEnlargeYCheckBox) then
      begin
        TcxLabel(SelectedControl).Style.Font.Size   := TcxLabel(SelectedControl).HelpContext * 3;  // 1mm가 대략 글꼴3 포인트 정도 되지 않을까?
        if DesignFontEnlargeYCheckBox.Checked then
          TcxLabel(SelectedControl).Style.Font.Size := TcxLabel(SelectedControl).Style.Font.Size * 2;
      end;
    end
    // 문구, 포맷
    else if (Sender = DesignTextEdit) and (SelectedControl is TcxLabel) then
    begin
      TcxLabel(SelectedControl).Hint := DesignTextEdit.Text;
      // 사용자 문구
      if SelectedControl.Tag div 10 in [7, 8] then
        TcxLabel(SelectedControl).Caption := DesignTextEdit.Text
      // 포맷 스트링
      else if SelectedControl = DesignDcAmt then
        DesignDcAmt.Caption       := Format(DesignDcAmt.Hint,       [msgPrice])
      else if SelectedControl = DesignUsePeriod then
        DesignUsePeriod.Caption   := Format(DesignUsePeriod.Hint,   [FormatDateTime(fmtDate, Date)])
    end
    else if (Sender = DesignTextEdit) and (SelectedControl is TImage) then
      SelectedControl.Hint := DesignTextEdit.Text;
  end;
end;
//------------------------------------------------------------------------------
// 선택한 객체 삭제 버튼
procedure TSystemCouponDesignForm.DesignDeleteButtonClick(Sender: TObject);
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
    SelectedControl := nil;
    isChanged       := true;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSystemCouponDesignForm.DoSearch: Boolean;
var
  vIndex: Integer;
  vTemp : Integer;
begin
  // 연결된 양식 상세 내역을 불러온다
  if ConditionToolBarComboBox.ItemIndex >= 0 then
  begin
    DesignCouponButton.Caption := Format('%s정보',[ConditionToolBarComboBox.Text]);

    // 양식 마스터
    isLoading     := true;
    try
      OpenQuery('select   CD_TEMPLATE, '        // 프린터 기종
               +'         TAG_WIDTH, '                // 티켓 폭
               +'         TAG_HEIGHT, '               // 티켓 높이
               +'         DIRECTION, '                // 출력방향 및 회전
               +'         MARGIN_TOP, '               // 갭 크기 또는 블랙마크 두께
               +'         MARGIN_LEFT, '              // 절단선과 기준(블랙마크 등) 사이 거리
               +'         TAG_MARGIN_RIGHT, '         // 티켓용지(10단위) + 절단방식(1단위)
               +'         TAG_MARGIN_BOTTOM, '        // 되감기
               +'         YN_USE '                    // 낱장발권(N:사용안함, Y:낱장발권, C:통합발권(추가))
               +'  from   MS_PRINT_H '
               +' where   CD_HEAD  = :P0 '
               +'   and   CD_STORE = :P1 '
               +'   and   DS_PRINT = :P2 '
               +' limit 1 ',
                [HeadStoreCode,
                 StoreCode,
                 GetStrPointerData(ConditionToolBarComboBox)]);
      if not Query.Eof then
      begin
        // 용지 크기
        SizeWidthEdit.Value          := Query.Fields[1].AsInteger;
        DesignPanel.Width            := Trunc(SizeWidthEdit.Value  * mm2pt);
        SizeHeightEdit.Value         := Query.Fields[2].AsInteger;
        DesignPanel.Height           := Trunc(SizeHeightEdit.Value * mm2pt);

        // 기존 양식을 지운다
        ClearTemplate;

        // 출력방향
        DirectionCheckBox.Checked    := Query.Fields[3].AsInteger in [1, 3];
        DegreeCheckBox.Checked       := Query.Fields[3].AsInteger in [2, 3];
        // 갭 크기
        GapSizeEdit.Value            := Query.Fields[4].AsInteger;
        // 절단 거리
        CutLengthEdit.Value          := Query.Fields[5].AsInteger;
        // 티켓 용지
        TicketTypeComboBox.ItemIndex := Query.Fields[6].AsInteger div 10;
        // 절단 방식
        CutComboBox.ItemIndex        := Query.Fields[6].AsInteger mod 10;
        // 되감기
        RollbackEdit.Value           := Query.Fields[7].AsInteger;
      end
      else
        ClearTemplate;
    finally
      FinishQuery;
    end;
    // 양식 디테일
    try
      OpenQuery('select   CD_OBJECT, '                // 객체구분번호
               +'         OBJECT_TOP, '               // 객체 위쪽위치
               +'         OBJECT_LEFT, '              // 객체 왼쪽위치
               +'         FONT_NAME, '                // 글꼴(사용 안 함)
               +'         FONT_SIZE, '                // 글꼴크기(mm) / 바코드높이(mm)
               +'         FONT_STYLE, '               // 일반:0, 굵게:1
               +'         FONT_COLOR, '               // 확대안함:0, 가로확대:1, 세로확대:2, 가로세로확대:3
               +'         FONT_ALIGN, '               // 왼쪽정렬:0, 오른쪽정렬:1, (가운데정렬:2)
               +'         OBJECT_TEXT '               // 문구,포맷
               +'  from   MS_PRINT_D '
               +' where   CD_HEAD  = :P0 '
               +'   and   CD_STORE = :P1 '
               +'   and   DS_PRINT = :P2 ',
                [HeadStoreCode,
                 StoreCode,
                 GetStrPointerData(ConditionToolBarComboBox)]);
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
              TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size   := 11;  // 1mm가 대략 글꼴3 포인트 정도 되지 않을까?

              if Query.Fields[5].AsInteger = 0 then                                            // 굵게
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style  := []
              else
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style  := [fsBold];

              TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword      := Query.Fields[6].AsString + Query.Fields[7].AsString;  // 가로세로확대(10자리) + 정렬(1자리)
              if Query.Fields[6].AsString <> '0' then
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size * 2;

              DesignPanel.Controls[vIndex].Hint                  := Query.Fields[8].AsString;  // 문구포맷
              if DesignPanel.Controls[vIndex].Tag div 10 in [7, 8] then                        // 사용자 문구는 포맷이 그대로 문구
              begin
                TcxLabel(DesignPanel.Controls[vIndex]).Caption    := DesignPanel.Controls[vIndex].Hint;
                TcxLabel(DesignPanel.Controls[vIndex]).Hint       := DesignPanel.Controls[vIndex].Hint;
              end;

              vTemp := StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10;
              if vTemp in [1,3] then
              begin
                TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size   := TcxLabel(DesignPanel.Controls[vIndex]).HelpContext * 3;  // 1mm가 대략 글꼴3 포인트 정도 되지 않을까?
                if vTemp in [2,3] then
                  TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size := TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size * 2;
              end;
            end

            // 그림일 때 처리
            else if DesignPanel.Controls[vIndex] is TImage then
            begin
              DesignPanel.Controls[vIndex].HelpContext           := Query.Fields[4].AsInteger;  // 크기
              DesignPanel.Controls[vIndex].Hint                  := Query.Fields[8].AsString;   // 문구
            end;
          end;
        // 디자인 팝업메뉴에서 Tag가 템플릿 번호와 같은 것에 체크한다
        for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
          if DesignPopupMenu.Items[vIndex].Tag = Query.Fields[0].AsInteger then
            DesignPopupMenu.Items[vIndex].Checked := true;
        Query.Next;
      end;
      DesignDcAmt.Caption        := Format(DesignDcAmt.Hint,       [msgPrice]);
    finally
      FinishQuery;
      isLoading := false;
    end;
    Result    := true;
    isChanged := false;
  end;
end;
//------------------------------------------------------------------------------
// 신규
function TSystemCouponDesignForm.DoNew: Boolean;
begin
  // 출력양식을 선택하지 않는다
  if ConditionToolBarComboBox.ItemIndex >= 0 then
    ConditionToolBarComboBox.ItemIndex := -1;
  // 양식을 초기화한다
  ClearTemplate;
  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function TSystemCouponDesignForm.DoDelete: Boolean;
begin
  Result := false;

  if ConditionToolBarComboBox.ItemIndex >= 0 then
    if AskBox(Format('''%s'' %s을 삭제 하시겠습니까?', [ConditionToolBarComboBox.Text, ConditionToolBarEditLabel.Caption])) then
    begin
      // 출력양식을 DB에서 삭제한다
      if ExecQuery('update MS_PRINT_H '
                  +'   set YN_USE       = ''N'', '
                  +'       CD_SAWON_CHG = :P3 '
                  +'       DT_CHANGE    = Now() '
                  +' where CD_HEAD  = :P0 '
                  +'   and CD_STORE = :P1 '
                  +'   and DS_PRINT = :P2; ',
                  [HeadStoreCode,
                   StoreCode,
                   GetStrPointerData(ConditionToolBarComboBox),
                   UserCode]) then
      begin
        // 출력양식 콤보박스 아이템을 삭제한다
        ConditionToolBarComboBox.Properties.Items.Delete(ConditionToolBarComboBox.ItemIndex);
        // 출력양식 신규 처리를 한다
        ButtonToolBarNewButton.Click;
        ShowMsg('삭제 했습니다.');
        Result := true;
      end
      else
        ErrBox('삭제하지 못했습니다.');
    end;
end;
//------------------------------------------------------------------------------
// 저장
function TSystemCouponDesignForm.DoSave: Boolean;
var
  vCode        : PStrPointer;
  vTemplateName: string;
  vTemplateCode: Integer;
  vIndex       : Integer;
begin
  Result := false;


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

  try
    // 기존 자료를 지운다
    ExecQuery('delete from MS_PRINT_H '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and DS_PRINT = :P2;',
              [HeadStoreCode,
               StoreCode,
               GetStrPointerData(ConditionToolBarComboBox)],
               false);
    ExecQuery('delete from MS_PRINT_D '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and DS_PRINT =:P2; ',
              [HeadStoreCode,
               StoreCode,
               GetStrPointerData(ConditionToolBarComboBox)],
               false);

    // 새로운 자료를 입력한다
    ExecQuery('insert into MS_PRINT_H(CD_HEAD, CD_STORE, DS_PRINT, CD_TEMPLATE, NM_TEMPLATE, CD_PRINTER, TAG_WIDTH, TAG_HEIGHT, DIRECTION, MARGIN_TOP, MARGIN_LEFT, TAG_MARGIN_RIGHT, TAG_MARGIN_BOTTOM, YN_USE, CD_SAWON_CHG, DT_CHANGE) '
             +'               values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12, 0, :P12, Now()); ',
              [HeadStoreCode,
               StoreCode,
               GetStrPointerData(ConditionToolBarComboBox),
               '001',
               '',
               '0',
               Trunc(SizeWidthEdit.Value),
               Trunc(SizeHeightEdit.Value),
               IfThen(DirectionCheckBox.Checked, 1, 0) + IfThen(DegreeCheckBox.Checked, 2, 0),
               Trunc(GapSizeEdit.Value),
               Trunc(CutLengthEdit.Value),
               TicketTypeComboBox.ItemIndex * 10 + CutComboBox.ItemIndex,
               Trunc(RollbackEdit.Value),
               UserCode],
               false);
    for vIndex := 0 to DesignPanel.ControlCount-1 do
      if (DesignPanel.Controls[vIndex].Tag > 0) and (DesignPanel.Controls[vIndex].Visible) then
        ExecQuery('insert into MS_PRINT_D(CD_HEAD, CD_STORE, DS_PRINT, CD_TEMPLATE, CD_OBJECT, OBJECT_TOP, OBJECT_LEFT, FONT_NAME, FONT_SIZE, FONT_STYLE, FONT_COLOR, FONT_ALIGN, OBJECT_TEXT) '
                 +'               values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12); ',
                  [HeadStoreCode,
                   StoreCode,
                   GetStrPointerData(ConditionToolBarComboBox),
                   '001',
                   DesignPanel.Controls[vIndex].Tag,
                   Trunc(DesignPanel.Controls[vIndex].Top  / mm2pt),
                   Trunc(DesignPanel.Controls[vIndex].Left / mm2pt),
                   EmptyStr,   // FONT_NAME 사용안함
                   DesignPanel.Controls[vIndex].HelpContext,
                   IfThen((DesignPanel.Controls[vIndex] is TcxLabel) and (fsBold in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style), 1, 0),
//                   IfThen(DesignPanel.Controls[vIndex] is TcxLabel, StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword), 0),
//                   IfThen(DesignPanel.Controls[vIndex] is TcxLabel, IfThen(fsBold in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $01, 0) + IfThen(fsItalic in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $02, 0) + IfThen(fsUnderline in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $04, 0) + IfThen(fsStrikeOut in TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style, $08, 0), 0),
                   IfThen(DesignPanel.Controls[vIndex] is TcxLabel, StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) div 10, 0),
                   IfThen(DesignPanel.Controls[vIndex] is TcxLabel, StoI(TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword) mod 10, 0),
                   DesignPanel.Controls[vIndex].Hint],
                   false);

    Result := ExecQuery(TempSQL, [], true);
    ShowMsg('저장 했습니다.');
    ResetEditProperties;

    isChanged := false;
    ButtonToolbarSaveButton.Enabled := false;

    // 신규일 때 콤보박스에 추가
    if ConditionToolBarComboBox.ItemIndex < 0 then
    begin
      New(vCode);
      vCode^.Data := IntToStr(vTemplateCode);
      ConditionToolBarComboBox.Properties.Items.AddObject(vTemplateName, TObject(vCode));
      ConditionToolBarComboBox.ItemIndex := ConditionToolBarComboBox.Properties.Items.Count-1;
    end;
  except
    on E: Exception do
    begin
      ErrBox(Format('저장하지 못했습니다.'#13'%s', [E.Message]));
    end;
  end;
end;
//------------------------------------------------------------------------------
// 양식 초기화
procedure TSystemCouponDesignForm.ClearTemplate;
var
  vIndex: Integer;
begin
  isChanged := false;
  isLoading := true;
  try
    // 디자인 세부 초기화
    DesignLocationTopEdit.Value        := 0;
    DesignLocationLeftEdit.Value       := 0;
    DesignTextEdit.Text                := EmptyStr;
    DesignFontComboBox.Properties.Items.Clear;
    DesignFontComboBox.Properties.Items.Add('기본 글꼴');
    DesignFontComboBox.ItemIndex       := 0;
    DesignFontSizeEdit.Value           := 3;
    DesignFontBoldCheckBox.Checked     := false;
    DesignFontEnlargeXCheckBox.Checked := false;
    DesignFontEnlargeYCheckBox.Checked := false;
    DesignAlignmentComboBox.ItemIndex  := 0;

    // 팝업메뉴 초기화
    for vIndex := 0 to DesignPopupMenu.Items.Count-1 do
      DesignPopupMenu.Items[vIndex].Checked := false;
    // 디자인 초기화
    DesignUsePeriod.Hint              := fmtVar + ' ~ ' + fmtVar;
    DesignDcAmt.Hint                   := fmtVar+'원';
    DesignBarcode.HelpContext          := 10;

    for vIndex := 0 to DesignPanel.ControlCount-1 do
    begin
      // 사용자 문구 초기화
      if (DesignPanel.Controls[vIndex].Tag div 10 = 7) and (DesignPanel.Controls[vIndex] is TcxLabel) then
      begin
        TcxLabel(DesignPanel.Controls[vIndex]).Caption := DesignLabelButton.Caption + ' ' + IntToStr(DesignPanel.Controls[vIndex].Tag-70);
        TcxLabel(DesignPanel.Controls[vIndex]).Hint    := TcxLabel(DesignPanel.Controls[vIndex]).Caption;
      end;
      // 각 객체 위치를 티켓 가운데로
      DesignPanel.Controls[vIndex].Top  := (DesignPanel.Height - DesignPanel.Controls[vIndex].Height) div 2;
      DesignPanel.Controls[vIndex].Left := (DesignPanel.Width  - DesignPanel.Controls[vIndex].Width)  div 2;
      // 레이블 글꼴 등 초기화
      if DesignPanel.Controls[vIndex] is TcxLabel then
      begin
        TcxLabel(DesignPanel.Controls[vIndex]).HelpContext   := 3;
        TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Size     := 3 * 3;  // 1mm가 대략 글꼴3 포인트 정도 되지 않을까?
        TcxLabel(DesignPanel.Controls[vIndex]).Style.Font.Style    := [];
        TcxLabel(DesignPanel.Controls[vIndex]).HelpKeyword         := '0';
      end;
      // 모든 객체 숨기기
      DesignPanel.Controls[vIndex].Visible := false;
    end;
    SelectedControl := nil;
    ResetEditProperties;
  finally
    isChanged := false;
    isLoading := false;
  end;
end;
procedure TSystemCouponDesignForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if isLoading then Exit;
  DoSearch;
end;

//------------------------------------------------------------------------------
// 디자인 객체 선택
procedure TSystemCouponDesignForm.SetSelectedControl(aControl: TControl);
begin
  if fSelectedControl = aControl then
    Exit;

  isLoading := true;
  try
    DesignLocationTopEdit.Value        := 0;
    DesignLocationTopEdit.Enabled      := false;
    DesignLocationLeftEdit.Value       := 0;
    DesignLocationLeftEdit.Enabled     := false;
    DesignTextEdit.Text                := EmptyStr;
    DesignTextEdit.Properties.ReadOnly := false;
    DesignTextEdit.Enabled             := false;
    DesignTextCommentLabel.Visible     := false;
    DesignFontComboBox.ItemIndex       := 0;
    DesignFontComboBox.Enabled         := false;
    DesignFontSizeEdit.Value           := 3;
    DesignFontSizeEdit.Enabled         := false;
    DesignFontBoldCheckBox.Checked     := false;
    DesignFontBoldCheckBox.Enabled     := false;
    DesignFontEnlargeXCheckBox.Checked := false;
    DesignFontEnlargeXCheckBox.Enabled := false;
    DesignFontEnlargeYCheckBox.Checked := false;
    DesignFontEnlargeYCheckBox.Enabled := false;
    DesignAlignmentComboBox.ItemIndex  := 0;
    DesignAlignmentComboBox.Enabled    := false;

    // 기존에 선택된 객체를 해제한다
    if Assigned(fSelectedControl) then
      if fSelectedControl is TcxLabel then
      begin
        TcxLabel(fSelectedControl).Style.Color       := DesignPanel.Color;
        TcxLabel(fSelectedControl).Transparent := true;
      end
      else if fSelectedControl is TImage then
        ShowImage(TImage(fSelectedControl), false);

    // 새 객체를 선택한다
    fSelectedControl := aControl;
    // 선택 객체에 따라 디자인 가능하게 활성화 시킨다
    if Assigned(fSelectedControl) then
    begin
      DesignLocationTopEdit.Value    := Trunc(fSelectedControl.Top  / mm2pt);
      DesignLocationTopEdit.Enabled  := true;
      DesignLocationLeftEdit.Value   := Trunc(fSelectedControl.Left / mm2pt);
      DesignLocationLeftEdit.Enabled := true;

      // 레이블
      if fSelectedControl is TcxLabel then
      begin
        TcxLabel(fSelectedControl).Style.Color   := EditStyleController.StyleFocused.Color;
        TcxLabel(fSelectedControl).Transparent   := false;
        DesignTextEdit.Text                      := fSelectedControl.Hint;
        if (fSelectedControl.Tag div 10) <> 7 then
          DesignTextCommentLabel.Visible         := true;
        DesignTextEdit.Enabled                   := true;
        DesignFontComboBox.ItemIndex           := 0;
        DesignFontComboBox.Enabled             := true;
        DesignFontSizeEdit.Properties.MinValue := 2;
        DesignFontSizeEdit.Properties.MaxValue := 100;
        DesignFontSizeEdit.Value               := 9;
        DesignFontSizeEdit.Enabled             := false;
        DesignFontBoldCheckBox.Checked         := TcxLabel(fSelectedControl).Style.Font.Style = [fsBold];
        DesignFontBoldCheckBox.Enabled         := true;
        DesignFontEnlargeXCheckBox.Checked     := (StoI(TcxLabel(fSelectedControl).HelpKeyword) div 10) in [1, 3];
        DesignFontEnlargeXCheckBox.Enabled     := true;
        DesignFontEnlargeYCheckBox.Checked     := (StoI(TcxLabel(fSelectedControl).HelpKeyword) div 10) in [2, 3];
        DesignFontEnlargeYCheckBox.Enabled     := true;
        DesignAlignmentComboBox.ItemIndex      := StoI(TcxLabel(fSelectedControl).HelpKeyword) mod 10;
        DesignAlignmentComboBox.Enabled        := true;
      end
      // 이미지
      else if fSelectedControl is TImage then
      begin
        ShowImage(TImage(fSelectedControl), true);
        DesignFontSizeEdit.Properties.MinValue := 5;
        DesignFontSizeEdit.Properties.MaxValue := 50;
        DesignFontSizeEdit.Value               := fSelectedControl.HelpContext;
        DesignFontSizeEdit.Enabled             := true;
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
procedure TSystemCouponDesignForm.ShowImage(aImage: TImage; aSelected: Boolean);
var
  vBitmap: TBitmap;
begin
  // 선택된 이미지는 이미지 파일에 테두리를 그려서 보여준다
  vBitmap := TBitmap.Create;
  vBitmap.Assign(aImage.Picture.Graphic);
  vBitmap.Canvas.Brush.Style := bsClear;
  if aSelected then
    vBitmap.Canvas.Pen.Color := clRed
  else
    vBitmap.Canvas.Pen.Color := clWhite;
  vBitmap.Canvas.Pen.Width   := 2;
  vBitmap.Canvas.Rectangle(1, 1, vBitmap.Width, vBitmap.Height);
  aImage.Picture.Bitmap.Assign(vBitmap);
  vBitmap.Free;
  aImage.Repaint;
end;

end.
