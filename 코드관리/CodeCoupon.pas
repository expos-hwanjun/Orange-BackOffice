unit CodeCoupon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxTextEdit,
  cxGridCustomTableView, cxGridTableView, cxCurrencyEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGrid, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, Math, StrUtils,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, cxGroupBox, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, cxMemo, cxButtonEdit, AdvPanel, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeCouponForm = class(TInheritGridEditForm)
    CouponNoLabel: TLabel;
    CouponNameLabel: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label23: TLabel;
    CountLabel: TLabel;
    CouponNoEdit: TcxTextEdit;
    CouponNameEdit: TcxTextEdit;
    CouponDateFromEdit: TcxDateEdit;
    CouponDateToEdit: TcxDateEdit;
    CountEdit: TcxCurrencyEdit;
    Label4: TLabel;
    DcAmtEdit: TcxCurrencyEdit;
    Label7: TLabel;
    GridTableViewCouponNo: TcxGridColumn;
    GridTableViewCouponName: TcxGridColumn;
    IssueRcpNoEdit: TcxMaskEdit;
    SaleRcpNoEdit: TcxMaskEdit;
    Label2: TLabel;
    StatusComboBox: TcxComboBox;
    Label3: TLabel;
    TypeComboBox: TcxComboBox;
    Label6: TLabel;
    RatePercentLabel: TcxLabel;
    GridTableViewStatus: TcxGridColumn;
    cxLabel1: TcxLabel;
    ConditionToolBarStatusComboBox: TcxComboBox;
    Label8: TLabel;
    RemarkMemo: TcxMemo;
    Label9: TLabel;
    SaleAmtEdit: TcxCurrencyEdit;
    Label10: TLabel;
    TargetComboBox: TcxComboBox;
    MemberLabel: TLabel;
    MemberCodeEdit: TcxButtonEdit;
    MemberNameEdit: TcxTextEdit;
    Label11: TLabel;
    MaxDcAmtEdit: TcxCurrencyEdit;
    Label12: TLabel;
    Label13: TLabel;
    MenuCodeEdit: TcxButtonEdit;
    MenuNameEdit: TcxTextEdit;
    CouponNoCreateButton: TAdvGlowButton;
    AutoCreateButton: TAdvGlowButton;
    CouponNumberPanel: TAdvPanel;
    CouponNumberMemo: TcxMemo;
    procedure FormShow(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure CouponNoCreateButtonClick(Sender: TObject);
    procedure MemberCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure MenuCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AutoCreateButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuPopup(Sender: TObject);
    procedure mnuKaKaoSendAdd(Sender: TObject);
    procedure mnuKaKaoSendDel(Sender: TObject);
  private
    function  SearchMember(aMember: string = ''): string;
    function  SearchMenu(aMenu: string = ''): string;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 그리드 연결 자료 표시
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  CodeCouponForm: TCodeCouponForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

{ TInheritGridEditForm1 }
procedure TCodeCouponForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
  vPopMenuItem: TMenuItem;
  vIndex: Integer;
begin
  inherited;
  TypeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'A';
  TypeComboBox.Properties.Items.AddObject('현금쿠폰', TObject(vCode));
  New(vCode);
  vCode^.Data := 'R';
  TypeComboBox.Properties.Items.AddObject('할인쿠폰', TObject(vCode));

  TargetComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'A';
  TargetComboBox.Properties.Items.AddObject('제한없음', TObject(vCode));
  New(vCode);
  vCode^.Data := 'M';
  TargetComboBox.Properties.Items.AddObject('회원', TObject(vCode));

  StatusComboBox.Properties.Items.Clear;
  ConditionToolBarStatusComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionToolBarStatusComboBox.Properties.Items.AddObject('전체', TObject(vCode));

  New(vCode);
  vCode^.Data := 'K';
  StatusComboBox.Properties.Items.AddObject('발송대기', TObject(vCode));
  ConditionToolBarStatusComboBox.Properties.Items.AddObject('발송대기', TObject(vCode));
  New(vCode);
  vCode^.Data := '0';
  StatusComboBox.Properties.Items.AddObject('미사용', TObject(vCode));
  ConditionToolBarStatusComboBox.Properties.Items.AddObject('미사용', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  StatusComboBox.Properties.Items.AddObject('사용', TObject(vCode));
  ConditionToolBarStatusComboBox.Properties.Items.AddObject('사용', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  StatusComboBox.Properties.Items.AddObject('폐기', TObject(vCode));
  ConditionToolBarStatusComboBox.Properties.Items.AddObject('폐기', TObject(vCode));
  ConditionToolBarStatusComboBox.ItemIndex := 0;

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);
  vPopMenuItem.Caption   := '항목 선택';

  for vIndex := 0 to TPopupMenu(GridTableView.PopupMenu).Items.Count - 1 do
    TPopupMenu(GridTableView.PopupMenu).Items[0].SetParentComponent(vPopMenuItem);
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);
  TPopupMenu(GridTableView.PopupMenu).OnPopup := mnuPopup;

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);   //1
  vPopMenuItem.Caption   := '-';
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);   //2
  vPopMenuItem.Caption   := '카카오쿠폰 발송추가';
  vPopMenuItem.OnClick   := mnuKaKaoSendAdd;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);   //2
  vPopMenuItem.Caption   := '카카오쿠폰 발송삭제';
  vPopMenuItem.OnClick   := mnuKaKaoSendDel;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  isChanged := false;
end;

procedure TCodeCouponForm.FormShow(Sender: TObject);
begin
  inherited;
  CouponNoEdit.Properties.MaxLength := CouponLen;
end;

procedure TCodeCouponForm.GridTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color  := clHighlightText;
  end;
end;

procedure TCodeCouponForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewStatus.Index] = '사용' then
    AStyle := StyleFontBlue
  else if ARecord.Values[GridTableViewStatus.Index] = '폐기' then
    AStyle := StyleFontRed;
end;

procedure TCodeCouponForm.MemberCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  SearchMember;
end;

procedure TCodeCouponForm.MenuCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  SearchMenu;
end;

procedure TCodeCouponForm.mnuPopup(Sender: TObject);
begin
 TPopupMenu(GridTableView.PopupMenu).Items[0].Enabled := not isChanged;
end;

procedure TCodeCouponForm.mnuKaKaoSendAdd(Sender: TObject);
var vIndex :Integer;
    vSQL   :String;
begin
  vSQL := '';
  for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
  begin
    if GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStatus.Index] <> '미사용' then
      Continue;

    vSQL := vSQL + Format('''%s'',',[GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewCouponNo.Index]]);
  end;
  if vSQL = '' then Exit;

  vSQL := Format('(%s);',[LeftStr(vSQL, Length(vSQL)-1)]);

  if ExecQuery('update MS_COUPON '
           +'   set DS_STATUS       = ''K'', '
           +'       DT_SEND_REQUEST = Now() '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and NO_COUPON in '+vSQL,
           [HeadStoreCode,
            StoreCode],True) then
  begin
    GridTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
    begin
      if GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStatus.Index] = '미사용' then
        GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStatus.Index] := '발송대기';
    end;
    GridTableView.DataController.EndUpdate;
  end;
end;

procedure TCodeCouponForm.mnuKaKaoSendDel(Sender: TObject);
var vIndex :Integer;
    vSQL   :String;
begin
  vSQL := '';
  for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
  begin
    if GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStatus.Index] <> '발송대기' then
      Continue;

    vSQL := vSQL + Format('''%s'',',[GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewCouponNo.Index]]);
  end;
  if vSQL = '' then Exit;

  vSQL := Format('(%s);',[LeftStr(vSQL, Length(vSQL)-1)]);

  if ExecQuery('update MS_COUPON '
              +'   set DS_STATUS       = ''0'', '
              +'       DT_SEND_REQUEST = null '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and NO_COUPON in '+vSQL,
              [HeadStoreCode,
               StoreCode],True) then
  begin
    GridTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
    begin
      if GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStatus.Index] = '발송대기' then
        GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStatus.Index] := '미사용';
    end;
    GridTableView.DataController.EndUpdate;

  end;
end;

function TCodeCouponForm.SearchMember(aMember: string): string;
begin
  Result := EmptyStr;
  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := '회원코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '회원이름';
      GridTableViewName1.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '카드번호';
      GridTableViewName2.Width   := 110;
      GridTableViewName2.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      GridTableViewName3.Caption := '휴대전화';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;

      SQLText    := 'select   a.CD_MEMBER, '
                   +'         a.NM_MEMBER, '
                   +'         a.NO_CARD, '
                   +'         GetPhoneNo(AES_Decrypt(a.TEL_MOBILE, 71483)) as NO_TEL, '
                   +'         a.DS_MEMBER, '
                   +'         b.NM_CODE1 '
                   +'  from   MS_MEMBER as a inner join '
                   +'         MS_CODE   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.DS_MEMBER = b.CD_CODE '
                   +' where   a.CD_HEAD  =:P0 '
                   +'   and   a.CD_STORE =:P1 '
                   +'   and  (a.CD_MEMBER = :P2 '
                   +'      or a.NM_MEMBER like ConCat(''%'',:P2,''%'') '
                   +'      or a.NO_CARD   =:P2 '
                   +'      or AES_Decrypt(a.TEL_MOBILE, 71483) = :P2 '
                   +'      or AES_Decrypt(a.TEL_MOBILE_SHORT, 71483) = :P2) '
                   +Ifthen(GetStoreOption(5)='0','',Format('and a.CD_STORE_JOIN =''%s'' ',[StoreCode]))
                   +'   and  a.DS_STATUS = ''0'' '
                   +'   and  b.CD_KIND   = ''05'' '
                   +' order by a.NM_MEMBER';
      IsMemberSearch := True;
      if SearchText <> EmptyStr then IsAutoSearch := True;

      if ShowModal = mrOK then
      begin
        MemberCodeEdit.Text     := Code;
        MemberNameEdit.Text     := Names[0];
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
    end;

end;

function TCodeCouponForm.SearchMenu(aMenu: string): string;
begin
  Result := EmptyStr;
  with THelpForm.Create(Self) do
    try
      Caption := '메뉴 조회';
      GridTableViewCode.Caption  := '메뉴코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '메뉴명';
      GridTableViewName1.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '단가';
      GridTableViewName2.Width   := 110;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;

      SQLText    := 'select   CD_MENU, '
                   +'         NM_MENU, '
                   +'         PR_SALE '
                   +'  from   MS_MENU '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and  (CD_MENU = :P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
                   +'   and  YN_USE = ''Y'' '
                   +' order by CD_MENU';
      if SearchText <> EmptyStr then IsAutoSearch := True;

      if ShowModal = mrOK then
      begin
        MenuCodeEdit.Text     := Code;
        MenuCodeEdit.Hint     := Code;
        MenuNameEdit.Text     := Names[0];
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
    end;

end;

procedure TCodeCouponForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  GridTableView.OptionsSelection.MultiSelect := not isChanged;
end;

procedure TCodeCouponForm.AutoCreateButtonClick(Sender: TObject);
var vIndex :Integer;
    vCouponNo :Integer;
begin
  inherited;
  if CouponNoEdit.Text = '' then
  begin
    MsgBox('시작쿠폰번호를 입력해야합니다');
    if CouponNoEdit.Enabled then
      CouponNoEdit.SetFocus;
    Exit;
  end;

  vCouponNo := StrToInt(RightStr(CouponNoEdit.Text,4));
  CouponNumberMemo.Clear;
  CouponNumberPanel.Visible := true;
  for vIndex := 1 to CountEdit.EditingValue-1 do
    CouponNumberMemo.Lines.Add(LeftStr(CouponNoEdit.Text, Length(CouponNoEdit.Text)-4) +  FormatFloat('0000',vCouponNo+vIndex));
end;

procedure TCodeCouponForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  if Trim(CouponPrefix) = EmptyStr then
  begin
    MsgBox('환경설정에서 쿠폰 프리픽스를 설정해야 합니다');
    Exit;
  end;
  inherited;
end;

procedure TCodeCouponForm.CouponNoCreateButtonClick(Sender: TObject);
begin
  inherited;
  CouponNoEdit.Enabled := true;
  CouponNoEdit.SetFocus;
end;

function TCodeCouponForm.DoDelete: Boolean;
begin
  try
    ExecQuery('delete from MS_COUPON '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and NO_COUPON =:P2;',
             [HeadStoreCode,
              StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCouponNo.Index]], true);

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      ErrBox(E.Message);
    end;
  end;
end;

procedure TCodeCouponForm.DoGridLink;
begin
  inherited;
//  isLoading := true;
  CouponNoEdit.Properties.ReadOnly := true;
  CountEdit.Enabled                := false;
  CountEdit.Value                  := 1;
  try
    OpenQuery('select a.NO_COUPON, '
             +'       a.NM_COUPON, '
             +'       StoD(a.YMD_FROM) as YMD_FROM, '
             +'       StoD(a.YMD_TO) as YMD_TO, '
             +'       a.RCP_ISSUE, '
             +'       a.RCP_SALE, '
             +'       a.COUPON_TYPE, '
             +'       a.AMT_DC, '
             +'       a.AMT_SALE_MIN, '
             +'       a.AMT_DC_MAX, '
             +'       a.DS_TARGET, '
             +'       a.CD_MEMBER, '
             +'       b.NM_MEMBER, '
             +'       a.CD_MENU, '
             +'       c.NM_MENU, '
             +'       a.REMARK, '
             +'       a.DT_SEND, '
             +'       a.DS_STATUS '
             +'  from MS_COUPON a left outer join '
             +'       MS_MEMBER b on b.CD_HEAD = a.CD_HEAD '+Ifthen(GetStoreOption(5)='0','and b.CD_STORE = ''%s'' ',Format('and b.CD_STORE_JOIN =''%s'' ',[StoreCode]))+' and b.CD_MEMBER = a.CD_MEMBER left outer join '
             +'       MS_MENU   c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.CD_MENU   = a.CD_MENU '
             +' where a.CD_HEAD   =:P0 '
             +'   and a.CD_STORE  =:P1 '
             +'   and a.NO_COUPON =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCouponNo.Index]]);
    if not Query.Eof then
    begin
      CouponNoEdit.Text       := Query.FieldByName('NO_COUPON').AsString;
      CouponNameEdit.Text     := Query.FieldByName('NM_COUPON').AsString;
      CouponDateFromEdit.Text := Query.FieldByName('YMD_FROM').AsString;
      CouponDateToEdit.Text   := Query.FieldByName('YMD_TO').AsString;
      IssueRcpNoEdit.Text     := Query.FieldByName('RCP_ISSUE').AsString;
      SaleRcpNoEdit.Text      := RightStr(Query.FieldByName('RCP_SALE').AsString,14);
      TypeComboBox.ItemIndex  := GetStrPointerIndex(TypeComboBox, Query.FieldByName('COUPON_TYPE').AsString);
      SaleAmtEdit.Value       := Query.FieldByName('AMT_SALE_MIN').AsCurrency;
      MaxDcAmtEdit.Value      := Query.FieldByName('AMT_DC_MAX').AsCurrency;
      TargetComboBox.ItemIndex  := GetStrPointerIndex(TargetComboBox, Query.FieldByName('DS_TARGET').AsString);
      MemberCodeEdit.Text     := Query.FieldByName('CD_MEMBER').AsString;
      MemberNameEdit.Text     := Query.FieldByName('NM_MEMBER').AsString;
      DcAmtEdit.Value         := Query.FieldByName('AMT_DC').AsCurrency;
      MenuCodeEdit.Text       := Query.FieldByName('CD_MENU').AsString;
      MenuCodeEdit.Hint       := Query.FieldByName('CD_MENU').AsString;
      MenuNameEdit.Text       := Query.FieldByName('NM_MENU').AsString;
      StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox,  Query.FieldByName('DS_STATUS').AsString);
      ButtonToolBarDeleteButton.Enabled := (Query.FieldByName('RCP_ISSUE').AsString = EmptyStr) and (Query.FieldByName('RCP_SALE').AsString = EmptyStr);
      TypeComboBox.Enabled    := (Query.FieldByName('RCP_ISSUE').AsString = EmptyStr) and (Query.FieldByName('RCP_SALE').AsString = EmptyStr);
      DcAmtEdit.Enabled       := TypeComboBox.Enabled;
      RemarkMemo.Text         := Query.FieldByName('REMARK').AsString;
      StatusComboBox.Enabled  := (Query.FieldByName('DS_STATUS').AsString = '0') and (Query.FieldByName('DT_SEND').AsString = '');
      CouponNoCreateButton.Enabled := false;
      CouponNumberMemo.Lines.Clear;
      CouponNumberPanel.Visible := false;
      AutoCreateButton.Enabled := false;
    end;
  finally
    FinishQuery;
//    isLoading := false;
  end;
end;

function TCodeCouponForm.DoNew: Boolean;
var vIndex :Integer;
    vTemp :String;
begin
  for vIndex := 6 to CouponLen-1 do
    vTemp := vTemp + '0';

  CouponNoEdit.Properties.ReadOnly := false;
  CountEdit.Enabled               := true;
  CountEdit.Value                 := 1;
  CouponDateFromEdit.Text         := '';
  CouponDateToEdit.Text           := '';
  try
    OpenQuery('select Max(NO_COUPON) '
             +'  from MS_COUPON '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and Length(NO_COUPON) = :P2 ',
             [HeadStoreCode,
              StoreCode,
              CouponLen]);
    if not Query.Eof and (CouponLen = Length(Query.Fields[0].AsString)) then
      CouponNoEdit.Text := LeftStr(Query.Fields[0].AsString, Length(Query.Fields[0].AsString)-2) + FormatFloat('00', StrToInt(RightStr(Query.Fields[0].AsString,2))+1)
    else
      CouponNoEdit.Text := CouponPrefix + FormatDateTime('yyyy', now()) + FormatFloat(vTemp,1);
  finally
    FinishQuery;
  end;
  CouponNoCreateButton.Enabled := true;
  AutoCreateButton.Enabled     := true;
  CountEdit.Enabled    := true;
  CouponNoEdit.Enabled := GetOption(2) = '0';
  CouponNumberMemo.Lines.Clear;
  CouponNumberPanel.Visible := false;
  TypeComboBox.Enabled := true;
  DcAmtEdit.Enabled    := true;
  CouponNameEdit.SetFocus;
  Result := true;
end;

function TCodeCouponForm.DoSave: Boolean;
var vIndex, vIndex1 :Integer;
    vSQL :String;
begin
  if CouponNoEdit.Text = EmptyStr then
  begin
    MsgBox(CouponNoLabel.Caption+msgMustInput);
    CouponNoEdit.SetFocus;
    Exit;
  end;

  if Length(CouponNoEdit.Text) <> CouponLen then
  begin
    MsgBox(Format('쿠폰번호는 %d 자리이어야 합니다',[CouponLen]));
    Exit;
  end;

  try
    if isNew then
    begin
      if CouponNumberPanel.Visible and (CouponNumberMemo.Lines.Count > 0) then
      begin
        vSQL := '';
        CouponNumberMemo.Lines.Insert(0, CouponNoEdit.Text);
        for vIndex := 0 to CouponNumberMemo.Lines.Count-1 do
        begin
          if Length(CouponNumberMemo.Lines.Strings[vIndex]) <> Length(CouponNoEdit.Text) then
            Continue;

          vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''0'',''%s'',%s, %s, %s,''%s'',''%s'',''%s'',''%s'',''%s'',''0'',Now()),',
                               [HeadStoreCode,
                                StoreCode,
                                CouponNumberMemo.Lines.Strings[vIndex],
                                CouponNameEdit.Text,
                                FormatDateTime('yyyymmdd',now),
                                Ifthen(CouponDateFromEdit.Date=0,'',DtoS(CouponDateFromEdit.Date)),
                                Ifthen(CouponDateToEdit.Date=0,'',DtoS(CouponDateToEdit.Date)),
                                GetStrPointerData(TypeComboBox),
                                FloatToStr(DcAmtEdit.Value),
                                FloatToStr(SaleAmtEdit.Value),
                                FloatToStr(MaxDcAmtEdit.Value),
                                GetStrPointerData(TargetComboBox),
                                MemberCodeEdit.Text,
                                MenuCodeEdit.Text,
                                UserCode,
                                RemarkMemo.Text]);
        end;

        vSQL :=  'insert into MS_COUPON(CD_HEAD, '
                 +'                      CD_STORE, '
                 +'                      NO_COUPON, '
                 +'                      NM_COUPON, '
                 +'                      YMD_ISSUE, '
                 +'                      YMD_FROM, '
                 +'                      YMD_TO, '
                 +'                      DS_COUPON, '
                 +'                      COUPON_TYPE, '
                 +'                      AMT_DC, '
                 +'                      AMT_SALE_MIN, '
                 +'                      AMT_DC_MAX, '
                 +'                      DS_TARGET, '
                 +'                      CD_MEMBER, '
                 +'                      CD_MENU, '
                 +'                      CD_SAWON_CHG, '
                 +'                      REMARK, '
                 +'                      DS_STATUS, '
                 +'                      DT_CHANGE) '
                 +'               values '+ LeftStr(vSQL,Length(vSQL)-1)+';';
        Result := ExecQuery(vSQL, [], true);
      end
      else
        Result := ExecQuery('insert into MS_COUPON(CD_HEAD, '
                           +'                      CD_STORE, '
                           +'                      NO_COUPON, '
                           +'                      NM_COUPON, '
                           +'                      YMD_ISSUE, '
                           +'                      YMD_FROM, '
                           +'                      YMD_TO, '
                           +'                      DS_COUPON, '
                           +'                      COUPON_TYPE, '
                           +'                      AMT_DC, '
                           +'                      AMT_SALE_MIN, '
                           +'                      AMT_DC_MAX, '
                           +'                      DS_TARGET, '
                           +'                      CD_MEMBER, '
                           +'                      CD_MENU, '
                           +'                      CD_SAWON_CHG, '
                           +'                      REMARK, '
                           +'                      DS_STATUS, '
                           +'                      DT_CHANGE) '
                           +'             values (:P0, '
                           +'                     :P1, '
                           +'                     :P2, '
                           +'                     :P3, '
                           +'                     :P4, '
                           +'                     :P5, '
                           +'                     :P6, '
                           +'                     ''0'', '    //DS_COUPON, 0:매장발행쿠폰, 1:본사발행쿠폰'
                           +'                     :P7, '
                           +'                     :P8, '
                           +'                     :P9, '
                           +'                     :P10, '
                           +'                     :P11, '
                           +'                     :P12, '
                           +'                     :P13, '
                           +'                     :P14, '
                           +'                     :P15, '
                           +'                     ''0'', '
                           +'                     NOW());',
                           [HeadStoreCode,
                            StoreCode,
                            CouponNoEdit.Text,
                            CouponNameEdit.Text,
                            FormatDateTime('yyyymmdd',now),
                            Ifthen(CouponDateFromEdit.Date=0,'',DtoS(CouponDateFromEdit.Date)),
                            Ifthen(CouponDateToEdit.Date=0,'',DtoS(CouponDateToEdit.Date)),
                            GetStrPointerData(TypeComboBox),
                            DcAmtEdit.Value,
                            SaleAmtEdit.Value,
                            MaxDcAmtEdit.Value,
                            GetStrPointerData(TargetComboBox),
                            MemberCodeEdit.Text,
                            MenuCodeEdit.Text,
                            UserCode,
                            RemarkMemo.Text], true);
    end
    else
    begin
      Result := ExecQuery('update MS_COUPON '
                         +'   set NM_COUPON    =:P3, '
                         +'       YMD_FROM     =:P4, '
                         +'       YMD_TO       =:P5, '
                         +'       COUPON_TYPE  =:P6, '
                         +'       AMT_DC       =:P7, '
                         +'       AMT_SALE_MIN =:P8, '
                         +'       AMT_DC_MAX   =:P9, '
                         +'       DS_TARGET     =:P10, '
                         +'       CD_MEMBER    =:P11, '
                         +'       CD_MENU      =:P12, '
                         +'       CD_SAWON_CHG =:P13, '
                         +'       DS_STATUS    =:P14, '
                         +'       REMARK       =:P15, '
                         +'       DT_CHANGE    =Now() '
                         +'where CD_HEAD   =:P0 '
                         +'  and CD_STORE  =:P1 '
                         +'  and NO_COUPON =:P2;',
                         [HeadStoreCode,
                          StoreCode,
                          CouponNoEdit.Text,
                          CouponNameEdit.Text,
                          Ifthen(CouponDateFromEdit.Date=0,'',DtoS(CouponDateFromEdit.Date)),
                          Ifthen(CouponDateToEdit.Date=0,'',DtoS(CouponDateToEdit.Date)),
                          GetStrPointerData(TypeComboBox),
                          DcAmtEdit.Value,
                          SaleAmtEdit.Value,
                          MaxDcAmtEdit.Value,
                          GetStrPointerData(TargetComboBox),
                          MemberCodeEdit.Text,
                          MenuCodeEdit.Text,
                          UserCode,
                          GetStrPointerData(StatusComboBox),
                          RemarkMemo.Text], true);
    end;
    if not Result then Exit;

    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := CouponNoEdit.Text;
      NewData[1] := CouponNameEdit.Text;
    end
    else if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
    begin
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.GetFocusedRecordIndex), GridTableViewCouponName.Index]    := CouponNameEdit.Text;
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

function TCodeCouponForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := EmptyStr;
    1 : vWhere := 'and Ifnull(RCP_ISSUE,'''') = '''' ';
    2 : vWhere := 'and Ifnull(RCP_ISSUE,'''') <> '''' ';
  end;

  if GetStrPointerData(ConditionToolBarStatusComboBox) <> '' then
    vWhere := vWhere + Format('and DS_STATUS = ''%s'' ',[GetStrPointerData(ConditionToolBarStatusComboBox)]);

  OpenQuery('select NO_COUPON, '
           +'       NM_COUPON, '
           +'       case DS_STATUS  when ''K'' then ''발송대기'' when  ''0'' then ConCat(''미사용'',case when DT_SEND is not null then ''(발송)'' else '''' end) when ''1'' then ''사용'' when ''2'' then ''폐기'' end as DS_STATUS'
           +'  from MS_COUPON '
           +' where CD_HEAD   =:P0 '
           +'   and CD_STORE  =:P1 '
           +vWhere
           +'   and (NO_COUPON like ConCat(''%'',:P2) or NO_COUPON like ConCat(:P2,''%'')) ',
           [HeadStoreCode,
            StoreCode,
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TCodeCouponForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
//  if isLoading then Exit;
  if Sender = TypeComboBox then
  begin
    if GetStrPointerData(TypeComboBox) = 'R' then
    begin
      DcAmtEdit.Properties.MaxValue      := 100;
      DcAmtEdit.Properties.AssignedValues.MaxValue := true;
      RatePercentLabel.Caption           := '%';
      MaxDcAmtEdit.Enabled               := true;
    end
    else
    begin
      DcAmtEdit.Properties.MaxValue      := 0;
      DcAmtEdit.Properties.AssignedValues.MaxValue := false;
      RatePercentLabel.Caption           := '원';
      MaxDcAmtEdit.Enabled               := false;
    end;
  end
  else if Sender = TargetComboBox then
  begin
    MemberCodeEdit.Enabled := GetStrPointerData(TargetComboBox) = 'M';
    if GetStrPointerData(TargetComboBox) = 'A' then
      MemberCodeEdit.Clear;
  end
  else if (Sender = MemberCodeEdit) and (MemberNameEdit.Text <> EmptyStr) and
     ((GetOnlyNumber(MemberCodeEdit.Text) <> MemberCodeEdit.Text) or (Length(MemberCodeEdit.Text) <> 10)) then
  begin
    MemberNameEdit.Clear;
  end
  else if (Sender = MenuCodeEdit) and (MenuNameEdit.Text <> EmptyStr) and ((MenuCodeEdit.Text <> MenuCodeEdit.Hint)) then
  begin
    MenuNameEdit.Clear;
    MenuCodeEdit.Hint := '';
  end;

end;

procedure TCodeCouponForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var vMemberCode,  vMemberName :String;
begin
  inherited;
  if Sender = CouponNoEdit then
  begin
    CountEdit.Value   := 1;
    if (CouponLen <> Length(DisplayValue)) or (LeftStr(DisplayValue,6) <> CouponPrefix+FormatDateTime('yyyy', now)) then
      CountEdit.Enabled := false;
  end
  else if (Sender = MemberCodeEdit) and (MemberNameEdit.Text = EmptyStr) then
  begin
    OpenQuery('select   a.CD_MEMBER, '
             +'         a.NM_MEMBER  '
             +'  from   MS_MEMBER as a inner join '
             +'         MS_CODE   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.DS_MEMBER = b.CD_CODE '
             +' where   a.CD_HEAD   =:P0 '
             +'   and   a.CD_STORE  =:P1 '
             +'   and   (a.CD_MEMBER =:P2 '
             +'      or a.NM_MEMBER like ConCat(''%'',:P2,''%'') '
             +'      or a.NO_CARD   =:P2 '
             +'      or AES_Decrypt(a.TEL_MOBILE,71483) =:P2 '
             +'      or AES_Decrypt(a.TEL_MOBILE_SHORT,71483) =:P2) '
             +'  and    a.DS_STATUS = ''0'' '
             +Ifthen(GetStoreOption(5)='0','',Format('and a.CD_STORE_JOIN =''%s'' ',[StoreCode]))
             +'  and    b.CD_KIND   = ''05''',
              [HeadStoreCode,
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
               DisplayValue]);

    try
      if not Query.Eof then
      begin
        // 일단 첫번째 값을 받아 놓는다
        vMemberCode       := Query.Fields[0].AsString;
        vMemberName     := Query.Fields[1].AsString;
        // 쿼리 다음 줄로 이동해 본다
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue            := vMemberCode;
          MemberNameEdit.Text     := vMemberName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
          DisplayValue := SearchMember(DisplayValue);
      end
      else
      begin
        Error     := true;
        ErrorText := MemberLabel.Caption+msgMustInput;
      end;
    finally
      FinishQuery;
    end;
  end
  else if (Sender = MenuCodeEdit) and (MenuNameEdit.Text = EmptyStr) then
  begin
    OpenQuery('select   CD_MENU, '
             +'         NM_MENU, '
             +'         PR_SALE '
             +'  from   MS_MENU '
             +' where   CD_HEAD  =:P0 '
             +'   and   CD_STORE =:P1 '
             +'   and  (CD_MENU = :P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
             +'   and  YN_USE = ''Y'' '
             +' order by CD_MENU',
              [HeadStoreCode,
               StoreCode,
               DisplayValue]);

    try
      if not Query.Eof then
      begin
        // 일단 첫번째 값을 받아 놓는다
        vMemberCode       := Query.Fields[0].AsString;
        vMemberName       := Query.Fields[1].AsString;
        // 쿼리 다음 줄로 이동해 본다
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue          := vMemberCode;
          MenuCodeEdit.Hint     := vMemberCode;
          MenuNameEdit.Text     := vMemberName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
          DisplayValue := SearchMenu(DisplayValue);
      end
      else
      begin
        Error     := true;
        ErrorText := '메뉴'+msgMustInput;
      end;
    finally
      FinishQuery;
    end;
  end;
end;

end.
