// 사용자 관리 (F)

// EMP_WORK[ 1] : 주문
//         [ 2] : 정산
//         [ 3] : 홀서빙
//         [ 4] : 배달
//         [ 5] : 마감(계산원,포스) (0, 1계산원마감, 2 :포스마감만, 3:둘다)
//         [ 6] : 환경설정
//         [ 7] : 돈통열기
//         [ 8] : 주문취소
//         [ 9] : 포인트적립/사용
//         [10] : 결제취소,결제변경

unit SystemEmp;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxContainer, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxControls, Math, StrUtils,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  StdCtrls, ExtCtrls, cxButtonEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvToolBar, AdvSplitter, AdvToolBarStylers,
  cxCheckBox, cxLookAndFeelPainters, cxGroupBox, cxLookAndFeels, AdvOfficePager,
  DBAccess, cxRadioGroup, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePagerStylers;

type
  TSystemEmpForm = class(TInheritGridEditForm)
    GridTableViewUserCode: TcxGridColumn;
    GridTableViewUserName: TcxGridColumn;
    GridTableViewUseYN: TcxGridColumn;
    UserCodeLabel: TLabel;
    UserNameLabel: TLabel;
    EnterDateLabel: TLabel;
    AddrLabel: TLabel;
    TelNoLabel: TLabel;
    UserGradeLabel: TLabel;
    MobileNoLabel: TLabel;
    UseYNLabel: TLabel;
    EMailLabel: TLabel;
    RankLabel: TLabel;
    RetireDateLabel: TLabel;
    PasswordCommentLabel: TLabel;
    WorkLabel: TLabel;
    Label2: TLabel;
    OfficeNoLabel: TLabel;
    WorkGroupBox: TcxGroupBox;
    Task1CheckBox: TcxCheckBox;
    Task2CheckBox: TcxCheckBox;
    Task3CheckBox: TcxCheckBox;
    Task4CheckBox: TcxCheckBox;
    Task5CheckBox: TcxCheckBox;
    Task6CheckBox: TcxCheckBox;
    Task7CheckBox: TcxCheckBox;
    Task8CheckBox: TcxCheckBox;
    Task9CheckBox: TcxCheckBox;
    Task10CheckBox: TcxCheckBox;
    UserCodeEdit: TcxTextEdit;
    UserNameEdit: TcxTextEdit;
    MobileNoEdit: TcxTextEdit;
    TelNoEdit: TcxTextEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    EnterDateEdit: TcxDateEdit;
    UserGradeComboBox: TcxComboBox;
    UseYNComboBox: TcxComboBox;
    EMailEdit: TcxTextEdit;
    RankEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    PasswordChangeButton: TButton;
    RetireDateEdit: TcxDateEdit;
    TimePayComboBox: TcxComboBox;
    OfficeNoEdit: TcxTextEdit;
    GridTableViewPower: TcxGridColumn;

    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure PasswordChangeButtonClick(Sender: TObject);
    procedure StoreGridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  SystemEmpForm: TSystemEmpForm;



implementation

uses
  Common, UnitZipPopup, Password, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSystemEmpForm.FormShow(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;

  // 관리자가 아니면 신규 버튼은 사용할 수 없음
  if (UserGrade <> userGradeMaster) then
    ButtonToolBarNewButton.Enabled := false;

  isLoading                 := true;

  try
    // 사원권한 콤보박스 세팅
    OpenQuery('select  CD_CODE, '
             +'        NM_CODE1 '
             +'  from  MS_CODE '
             +' where  CD_HEAD   = :P0 '
             +'   and  CD_STORE  = :P1 '
             +'   and  CD_KIND   = ''17'' '
             +'   and  DS_STATUS = ''0'' '
             +' order by CD_CODE ',
             [HeadStoreCode,
              StoreCode]);
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      UserGradeComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    UserGradeComboBox.ItemIndex := UserGradeComboBox.Properties.Items.Count-1;
    FinishQuery;

    // 시급 콤보박스 세팅
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD   = :P0 '
             +'   and CD_STORE  = :P1 '
             +'   and CD_KIND   = ''10'' '
             +'   and DS_STATUS = ''0'' '
             +' order by CD_CODE ',
              [HeadStoreCode,
               StoreCode]);
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      TimePayComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    TimePayComboBox.ItemIndex := TimePayComboBox.Properties.Items.Count-1;
  finally
    FinishQuery;
    isLoading := false;
    isChanged := false;
  end;

  // 조회를 한다
//  ButtonToolBarSearchButton.Click;
end;

procedure TSystemEmpForm.GridTableViewCustomDrawCell(
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

procedure TSystemEmpForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[2] = 'N' then
    AStyle := StyleFontRed;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TSystemEmpForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;

  // 사용여부
  if Sender = UseYNComboBox then
  begin
    RetireDateEdit.Visible  := UseYNComboBox.ItemIndex = 1;
    RetireDateLabel.Visible := RetireDateEdit.Visible;
    if RetireDateEdit.Visible then
      RetireDateEdit.Date := Date
    else
      RetireDateEdit.Date := 0;
  end
  // 우편번호를 수정할 때 주소를 지운다
  else if (Sender = ZipCodeEdit) and (Addr1Edit.Text <> EmptyStr) then
    Addr1Edit.Clear;
end;
//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TSystemEmpForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  // 사원번호를 짧게 입력하면 앞을 0으로 채운다
  if (Sender = UserCodeEdit) and
     (not UserCodeEdit.Properties.ReadOnly) and
     (Length(DisplayValue) < UserCodeEdit.Properties.MaxLength) then
    DisplayValue := LPad(DisplayValue, UserCodeEdit.Properties.MaxLength, '0')

  // 전화번호를 체계에 맞게 고친다
  else if (Sender = MobileNoEdit) or (Sender = TelNoEdit) or (Sender = OfficeNoEdit) then
    DisplayValue := GetPhoneNo(DisplayValue)
end;
//------------------------------------------------------------------------------
// 주소(우편번호) 입력창 버튼을 누를 때
procedure TSystemEmpForm.ZipCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  vZipNo, vRoadAddr, vJibunAddr: string;
begin
  inherited;
  if TFrmZipPopup.Execute(vZipNo, vRoadAddr, vJibunAddr) then
  begin
    ZipCodeEdit.Text := vZipNo;
    Addr1Edit.Text := vRoadAddr;
    Addr2Edit.Text := '';
    Addr2Edit.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
// 비밀번호 변경/초기화 버튼
procedure TSystemEmpForm.PasswordChangeButtonClick(Sender: TObject);
begin
  inherited;

  // 본인이면 비밀번호 변경
  if UserCode = UserCodeEdit.Text then
  begin
    with TPasswordForm.Create(self) do
      try
        UserCode := UserCodeEdit.Text;
        UserPass := UserCodeEdit.Hint;
        if ShowModal = mrOK then
        begin
          UserCodeEdit.Hint := UserPass;
          MsgBox(Format('%s을 했습니다.', [PasswordChangeButton.Caption]));
        end;
      finally
        Free;
      end;
  end

  // 다른 사람이면 비밀번호 초기화
  else if AskBox(Format('%s를 하시겠습니까?'#13'암호는 %s로 변경되고'#13'해당 사용자가 다음 번 로그인할 때 수정해야 합니다.', [PasswordChangeButton.Caption, UserCodeLabel.Caption])) then
    if ExecQuery('update MS_SAWON '
                +'   set NO_PASSWORD = :P3, '
                +'       CD_SAWON_CHG= :P4, '
                +'       DT_CHANGE   = Now() '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and CD_SAWON =:P2',
                 [HeadStoreCode,
                  StoreCode,
                  UserCodeEdit.Text,
                  Encrypt(UserCodeEdit.Text, _CryptKey),
                  UserCode]) then
      ShowMsg(Format('%s을 했습니다.', [PasswordChangeButton.Caption]));
end;
procedure TSystemEmpForm.StoreGridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
var
  vIndex, vFocus: Integer;
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSystemEmpForm.DoSearch: Boolean;
var vWhere :String;
begin
  Result := false;
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := EmptyStr;
    1 : vWhere := 'and YN_USE = ''Y'' ';
    2 : vWhere := 'and YN_USE = ''N'' ';
  end;
  try
    OpenQuery('select   CD_SAWON, '
             +'         NM_SAWON, '
             +'         case when DS_SAWON = ''P'' then ''POS'' else ''B/O'' end DS_SAWON, '
             +'         YN_USE '
             +'  from   MS_SAWON '
             +' where   CD_HEAD  =:P0 '
             +'   and   CD_STORE =:P1 '
             +vWhere
             +'   and (CD_SAWON = :P2 or NM_SAWON like ConCat(''%'',:P2,''%'')) '
             +'   and YN_HEADUSER = ''N'' '
             +' order by CD_SAWON',
              [HeadStoreCode,
               StoreCode,
               ConditionToolBarEdit.Text]);
    Result := DM.ReadQuery(Query, GridTableView);
  except
  end;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TSystemEmpForm.DoGridLink;
begin
  inherited;

  // 회원정보
  OpenQuery('select   NO_PASSWORD, '
           +'         NM_SAWON, '
           +'         TEL_HOME, '
           +'         TEL_MOBILE, '
           +'         TEL_OFFICE, '
           +'         NO_POST, '
           +'         ADDR1, '
           +'         ADDR2, '
           +'         NM_EMAIL, '
           +'         YMD_ENTRANCE, '
           +'         YMD_LEAVE, '
           +'         NM_RANK, '
           +'         YN_USE, '
           +'         EMP_WORK, '
           +'         CD_GRADE, '
           +'         CD_TIME_PAY, '
           +'         DS_SAWON '
           +'  from   MS_SAWON '
           +' where   CD_HEAD  =:P0 '
           +'   and   CD_STORE =:P1 '
           +'   and   CD_SAWON =:P2 '
           +' order by CD_SAWON',
           [HeadStoreCode,
            StoreCode,
             GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserCode.Index]]);
  try
    if not Query.Eof then
    begin
      UserCodeEdit.Text              := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserCode.Index];
      UserCodeEdit.Hint              := Decrypt(Query.Fields[ 0].AsString, _CryptKey);
      UserNameEdit.Text              := Query.Fields[ 1].AsString;
      TelNoEdit.Text                 := Query.Fields[ 2].AsString;
      MobileNoEdit.Text              := Query.Fields[ 3].AsString;
      OfficeNoEdit.Text              := Query.Fields[ 4].AsString;
      ZipCodeEdit.Text               := Query.Fields[ 5].AsString;
      Addr1Edit.Text                 := Query.Fields[ 6].AsString;
      Addr2Edit.Text                 := Query.Fields[ 7].AsString;
      EMailEdit.Text                 := Query.Fields[ 8].AsString;
      EnterDateEdit.Date             := StoD(Query.Fields[ 9].AsString);
      RetireDateEdit.Date            := StoD(Query.Fields[10].AsString);
      RankEdit.Text                  := Query.Fields[11].AsString;
      UseYNComboBox.ItemIndex        := IfThen(Query.Fields[12].AsString = 'Y', 0, 1);
      RetireDateEdit.Visible         := UseYNComboBox.ItemIndex = 1;
      RetireDateLabel.Visible        := RetireDateEdit.Visible;
      if not RetireDateEdit.Visible then
        RetireDateEdit.Date          := 0;
      if Length(Query.Fields[13].AsString) >= 10 then
      begin
        Task1CheckBox.Checked   := Query.Fields[13].AsString[1] = '1';
        Task2CheckBox.Checked   := Query.Fields[13].AsString[2] = '1';
        Task3CheckBox.Checked   := Query.Fields[13].AsString[3] = '1';
        Task4CheckBox.Checked   := Query.Fields[13].AsString[4] = '1';
        Task5CheckBox.Checked   := Query.Fields[13].AsString[5] = '1';
        Task6CheckBox.Checked   := Query.Fields[13].AsString[6] = '1';
        Task7CheckBox.Checked   := Query.Fields[13].AsString[7] = '1';
        Task8CheckBox.Checked   := Query.Fields[13].AsString[8] = '1';
        Task9CheckBox.Checked   := Query.Fields[13].AsString[9] = '1';
        Task10CheckBox.Checked  := Query.Fields[13].AsString[10] = '1';
      end
      else
      begin
        Task1CheckBox.Checked   := false;
        Task2CheckBox.Checked   := false;
        Task3CheckBox.Checked   := false;
        Task4CheckBox.Checked   := false;
        Task5CheckBox.Checked   := false;
        Task6CheckBox.Checked   := false;
        Task7CheckBox.Checked   := false;
        Task8CheckBox.Checked   := false;
        Task9CheckBox.Checked   := false;
        Task10CheckBox.Checked  := false;
      end;
      UserGradeComboBox.ItemIndex := GetStrPointerIndex(UserGradeComboBox, Query.Fields[14].AsString);
      TimePayComboBox.ItemIndex   := GetStrPointerIndex(TimePayComboBox, Query.Fields[15].AsString);
      UserGradeComboBox.Enabled   := (Query.Fields[16].AsString = 'B') and (UserGrade = userGradeMaster);
    end;
  finally
    FinishQuery;
  end;

  // 사번은 못 고치게 막는다
  UserCodeEdit.Properties.ReadOnly  := true;
  UserCodeEdit.TabStop              := false;
  UserCodeEdit.Style.Color          := clrDisabled;
  UserCodeEdit.StyleFocused.Color   := clrDisabled;

  // 본인인지 아닌지에 따라 비밀번호 변경 여부 수정
  PasswordChangeButton.Visible      := true;  // 기존 자료일 때는 비밀번호 관련 수정 가능
  PasswordCommentLabel.Visible      := not PasswordChangeButton.Visible;
  if UserCode = UserCodeEdit.Text then
    PasswordChangeButton.Caption    := '비밀번호 변경'
  else
    PasswordChangeButton.Caption    := '비밀번호 초기화';
end;
//------------------------------------------------------------------------------
// 신규
function TSystemEmpForm.DoNew: Boolean;
var
  vUserCode: string;
  vIndex   : Integer;
begin
  inherited;

  isLoading                 := true;
  try
    OpenQuery('select Max(CD_SAWON) as CODE '
             +'  from MS_SAWON '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_SAWON <> ''999999'''
             +'   and isnumeric(CD_SAWON) = 1',
              [HeadStoreCode,
               StoreCode]);
    try
      if not Query.Eof then
        UserCodeEdit.Text :=  LPad(IntToStr(StoI(Query.Fields[0].AsString)+1), 6, '0')
      else
        UserCodeEdit.Text := Copy(FormatDateTime('yyyy',Now()),3,2)+'0001';
      if MainPanel.Enabled and UserNameEdit.Enabled then
        UserNameEdit.SetFocus;
    finally
      FinishQuery;
    end;
    UserCodeEdit.Properties.ReadOnly := false;
    UserCodeEdit.TabStop             := true;
    UserCodeEdit.Style.Color         := clWindow;
    UserCodeEdit.StyleFocused.Color  := clrFocused;

    for vIndex := 1 to 10 do
      TcxCheckBox(FindComponent(Format('Task%dCheckBox',[vIndex]))).Checked   := true;

    EnterDateEdit.Date            := Date;
    UserGradeComboBox.ItemIndex   := UserGradeComboBox.Properties.Items.Count-1;
    PasswordChangeButton.Visible  := false; // 신규일 때는 비밀번호 관련 수정 못함
    PasswordCommentLabel.Visible  := not PasswordChangeButton.Visible;
    Result := true;
  finally
    isLoading := false;
  end;
end;
//------------------------------------------------------------------------------
// 삭제
function TSystemEmpForm.DoDelete: Boolean;
begin
  Result := false;
  if GridTableView.DataController.FocusedRecordIndex < 0 then
    Exit;

  // POS 판매 실적 조회 (매입 등 다른 작업은 했어도 그냥 삭제할 수 있게 허용)
  OpenQuery('select YMD_SALE '
           +'  from SL_SALE_H '
           +' where CD_HEAD  =:P0 '
           +'  and  CD_STORE =:P1 '
           +'   and CD_SAWON =:P2 '
           +' limit 1 ',
           [HeadStoreCode,
            StoreCode,
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserCode.Index]]);
  try
    if not Query.Eof and (Query.Fields[0].AsString <> EmptyStr) then
    begin
      ErrBox(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewUserName.Index]+' 님은 POS에서 판매한 자료가 있어 삭제할 수 없습니다.');
      FinishQuery;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  // POS 판매 실적이 없는 사원은 삭제
  try
    ExecQuery('delete from MS_SAWON '
             +' where  CD_HEAD  =:P0 '
             +'   and  CD_STORE =:P1 '
             +'   and  CD_SAWON =:P2;',
              [HeadStoreCode,
               StoreCode,
               UserCodeEdit.Text]);

    Result := True;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
      Result := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TSystemEmpForm.DoSave: Boolean;
var
  vEmpWork        : string;
  vIndex          : Integer;
begin
  Result := false;

  if isNew then
  begin
    // 사원번호를 입력하지 않았으면 에러
    if Trim(UserCodeEdit.Text) = EmptyStr then
    begin
      ErrBox(UserCodeLabel.Caption+msgMustInput);
      if MainPanel.Enabled and UserCodeEdit.Enabled then
        UserCodeEdit.SetFocus;
      Exit;
    end
    // 이미 등록된 사원번호를 다시 등록하려고 하면 에러
    else
    begin
      OpenQuery('select CD_SAWON '
               +'  from MS_SAWON '
               +' where CD_HEAD  =:P0 '
               +'  and  CD_STORE =:P1 '
               +'   and CD_SAWON =:P2 '
               +' limit 1 ',
               [HeadStoreCode,
                StoreCode,
                UserCodeEdit.Text]);
      try
        if (not Query.Eof) and (Query.Fields[0].AsString <> EmptyStr) then
        begin
          ErrBox(Format('이미 사용 중인 %s입니다.', [UserCodeLabel.Caption]));
          if MainPanel.Enabled and UserCodeEdit.Enabled then
            UserCodeEdit.SetFocus;
          UserCodeEdit.SelectAll;
          FinishQuery;
          Exit;
        end;
      finally
        FinishQuery;
      end;
    end;
  end;

  // 사원이름을 입력하지 않았으면 에러
  if Trim(UserNameEdit.Text) = EmptyStr then
  begin
    ErrBox(UserNameLabel.Caption+msgMustInput);
    if MainPanel.Enabled and UserNameEdit.Enabled then
      UserNameEdit.SetFocus;
    Exit;
  end;

  // 사원 옵션
  vEmpWork := RPad(EmptyStr, 10, '0');
  if Task1CheckBox.Checked then
    vEmpWork[1] := '1';
  if Task2CheckBox.Checked then
    vEmpWork[2] := '1';
  if Task3CheckBox.Checked then
    vEmpWork[3] := '1';
  if Task4CheckBox.Checked then
    vEmpWork[4] := '1';
  if Task5CheckBox.Checked then
    vEmpWork[5] := '1';
  if Task6CheckBox.Checked then
    vEmpWork[6] := '1';
  if Task7CheckBox.Checked then
    vEmpWork[7] := '1';
  if Task8CheckBox.Checked then
    vEmpWork[8] := '1';
  if Task9CheckBox.Checked then
    vEmpWork[9] := '1';
  if Task10CheckBox.Checked then
    vEmpWork[10] := '1';

  //사용권한을 변경 시 관리자 1명도 없으면 안되서 미리 체크한다
  if not isNew
    and (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPower.Index] <> 'POS')
    and (GetStrPointerData(UserGradeComboBox) <> userGradeMaster) then
  begin
    try
      OpenQuery('select CD_SAWON '
               +'  from MS_SAWON '
               +' where CD_HEAD =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_SAWON <> :P2 '
               +'   and CD_GRADE =:P3 ',
               [HeadStoreCode,
                StoreCode,
                UserCodeEdit.Text,
                userGradeMaster]);
      if Query.Eof then
      begin
        MsgBox('사용자그룹을 변경하면 [관리자그룹] 사용자가 없습니다');
        Exit;
      end;
    finally
      FinishQuery;
    end;
  end;


  try
    ExecQuery('insert into MS_SAWON(CD_HEAD, '
             +'                    CD_STORE, '
             +'                    CD_SAWON, '
             +'                    NM_SAWON, '
             +'                    DS_SAWON, '
             +'                    NO_PASSWORD, '
             +'                    YMD_ENTRANCE, '
             +'                    YMD_LEAVE, '
             +'                    NM_RANK, '
             +'                    YN_USE, '
             +'                    TEL_HOME, '
             +'                    TEL_MOBILE, '
             +'                    TEL_OFFICE, '
             +'                    NO_POST, '
             +'                    ADDR1, '
             +'                    ADDR2, '
             +'                    NM_EMAIL, '
             +'                    EMP_WORK, '
             +'                    CD_TIME_PAY, '
             +'                    CD_GRADE, '
             +'                    CD_SAWON_CHG, '
             +'                    DT_CHANGE) '
             +'           values (:P0, '                                 // CD_HEAD
             +'                   :P1, '                                 // CD_STORE
             +'                   :P2, '                                 // CD_SAWON
             +'                   :P3, '                                 // NM_SAWON
             +'                   ''P'', '
             +'                   :P4, '                                 // NO_PASSWORD
             +'                   :P5, '                                 // YMD_ENTRANCE
             +'                   :P6, '                                 // YMD_LEAVE
             +'                   :P7, '                                 // NM_RANK
             +'                   :P8, '                                 // YN_USE
             +'                   :P9, '                                 // TEL_HOME
             +'                   :P10, '                                // TEL_MOBILE
             +'                   :P11, '                                // TEL_OFFICE
             +'                   :P12, '                                // NO_POST
             +'                   :P13, '                                // ADDR1
             +'                   :P14, '                                // ADDR2
             +'                   :P15, '                                // NM_EMAIL
             +'                   :P16, '                                // EMP_WORK
             +'                   :P17, '                                // CD_TIME_PAY
             +'                   :P18, '                                // CD_GRADE
             +'                   :P19, '                                // CD_SAWON_CHG
             +'                   Now()) '                               // DT_CHANGE
             +'ON DUPLICATE KEY UPDATE NM_SAWON     = :P3, '
             +'                        YMD_ENTRANCE = :P5, '
             +'                        YMD_LEAVE    = :P6, '
             +'                        NM_RANK      = :P7, '
             +'                        YN_USE       = :P8, '
             +'                        TEL_HOME     = :P9, '
             +'                        TEL_MOBILE   = :P10, '
             +'                        TEL_OFFICE   = :P11, '
             +'                        NO_POST      = :P12, '
             +'                        ADDR1        = :P13, '
             +'                        ADDR2        = :P14, '
             +'                        NM_EMAIL     = :P15, '
             +'                        EMP_WORK     = :P16, '
             +'                        CD_TIME_PAY  = :P17, '
             +'                        CD_GRADE     = :P18, '
             +'                        CD_SAWON_CHG = :P19, '
             +'                        DT_CHANGE    = Now(); ',
              [HeadStoreCode,
               StoreCode,                                                                 // CD_STORE
               UserCodeEdit.Text,                                                         // CD_SAWON
               UserNameEdit.Text,                                                         // NM_SAWON
               Encrypt(UserCodeEdit.Text, _CryptKey),                                     // NO_PASSWORD
               DtoS(EnterDateEdit.Date),                                                  // YMD_ENTRANCE
               IfThen(RetireDateEdit.CurrentDate = 0, EmptyStr, DtoS(RetireDateEdit.CurrentDate)),      // YMD_LEAVE
               RankEdit.Text,                                                             // NM_RANK
               IfThen(UseYNComboBox.ItemIndex = 0, 'Y', 'N'),                             // YN_USE
               TelNoEdit.Text,                                                            // TEL_HOME
               MobileNoEdit.Text,                                                         // TEL_MOBIL
               OfficeNoEdit.Text,                                                         // TEL_OFFICE
               ZipCodeEdit.Text,                                                          // NO_POST
               Addr1Edit.Text,                                                            // ADDR1
               Addr2Edit.Text,                                                            // ADDR2
               EMailEdit.Text,                                                            // NM_EMAIL
               vEmpWork,                                                                  // EMP_WORK
               GetStrPointerData(TimePayComboBox),
               GetStrPointerData(UserGradeComboBox),
               UserCode],
               true);

    Result := True;

  if Result then
    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := UserCodeEdit.Text;
      NewData[1] := UserNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewUserName.Index] := UserNameEdit.Text;

  except
    on E: Exception do
    begin
      ErrBox(E.Message);
      Result := false;
    end;
  end;
end;

end.
