unit HeadCoupon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
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
  THeadCouponForm = class(TInheritGridEditForm)
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
    GridTableViewCouponNo: TcxGridColumn;
    GridTableViewCouponName: TcxGridColumn;
    Label2: TLabel;
    StatusComboBox: TcxComboBox;
    Label6: TLabel;
    RatePercentLabel: TcxLabel;
    GridTableViewStatus: TcxGridColumn;
    Label8: TLabel;
    RemarkMemo: TcxMemo;
    SaleAmtEdit: TcxCurrencyEdit;
    Label7: TLabel;
    TargetComboBox: TcxComboBox;
    MemberLabel: TLabel;
    MemberCodeEdit: TcxButtonEdit;
    MemberNameEdit: TcxTextEdit;
    Label10: TLabel;
    TypeComboBox: TcxComboBox;
    Label9: TLabel;
    MaxDcAmtEdit: TcxCurrencyEdit;
    Label3: TLabel;
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
  private
    CouponPrefix :String;
    CouponLen    :Integer;
    function  SearchMember(aMember: string = ''): string;
    function  SearchMenu(aMenu: string = ''): string;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 그리드 연결 자료 표시
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    { Public declarations }
  end;

var
  HeadCouponForm: THeadCouponForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

{ TInheritGridEditForm1 }
procedure THeadCouponForm.FormShow(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select COUPON_PREFIX, '
             +'       COUPON_LEN '
             +'  from MS_STORE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 ',
             [HeadStoreCode,
              StandardStore]);
    if not Query.Eof then
    begin
      CouponPrefix  := Query.Fields[0].AsString;
      CouponLen     := Query.Fields[1].AsInteger;
    end;
  finally
    FinishQuery;
  end;

  CouponNoEdit.Properties.MaxLength := CouponLen;
  MemberCodeEdit.Enabled := GetStoreOption(5) = '1';
end;

procedure THeadCouponForm.GridTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.Font.Color  := clHighlightText;
  end;
end;

procedure THeadCouponForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewStatus.Index] = '사용' then
    AStyle := StyleFontBlue
  else if ARecord.Values[GridTableViewStatus.Index] = '폐기' then
    AStyle := StyleFontRed;
end;

procedure THeadCouponForm.MemberCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  SearchMember;
end;

procedure THeadCouponForm.MenuCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  SearchMenu;
end;

function THeadCouponForm.SearchMember(aMember: string): string;
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

function THeadCouponForm.SearchMenu(aMenu: string): string;
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
                   +'   and   CD_STORE =''00000000'' '
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

procedure THeadCouponForm.AutoCreateButtonClick(Sender: TObject);
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

procedure THeadCouponForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  if Trim(CouponPrefix) = EmptyStr then
  begin
    MsgBox('환경설정에서 쿠폰 프리픽스를 설정해야 합니다');
    Exit;
  end;
  inherited;
end;

procedure THeadCouponForm.CouponNoCreateButtonClick(Sender: TObject);
begin
  inherited;
  CouponNoEdit.Enabled := true;
  CouponNoEdit.SetFocus;
end;

function THeadCouponForm.DoDelete: Boolean;
begin
  try
    ExecQuery('delete from MS_COUPON '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and NO_COUPON =:P2;',
             [HeadStoreCode,
              StandardStore,
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

procedure THeadCouponForm.DoGridLink;
begin
  inherited;
  isLoading := true;
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
             +'       a.DS_STATUS '
             +'  from MS_COUPON a left outer join '
             +'       MS_MEMBER b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MEMBER = a.CD_MEMBER left outer join '
             +'       MS_MENU   c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE and c.CD_MENU   = a.CD_MENU '
             +' where a.CD_HEAD   =:P0 '
             +'   and a.CD_STORE  =:P1 '
             +'   and a.NO_COUPON =:P2 ',
             [HeadStoreCode,
              StandardStore,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCouponNo.Index]]);
    if not Query.Eof then
    begin
      CouponNoEdit.Text       := Query.FieldByName('NO_COUPON').AsString;
      CouponNameEdit.Text     := Query.FieldByName('NM_COUPON').AsString;
      CouponDateFromEdit.Text := Query.FieldByName('YMD_FROM').AsString;
      CouponDateToEdit.Text   := Query.FieldByName('YMD_TO').AsString;
      TypeComboBox.ItemIndex  := Ifthen(Query.FieldByName('COUPON_TYPE').AsString='A',0,1);
      EditPropertiesChange(TypeComboBox);
      DcAmtEdit.Value         := Query.FieldByName('AMT_DC').AsCurrency;
      SaleAmtEdit.Value       := Query.FieldByName('AMT_SALE_MIN').AsCurrency;
      MaxDcAmtEdit.Value      := Query.FieldByName('AMT_DC_MAX').AsCurrency;
      TargetComboBox.ItemIndex  := Ifthen(Query.FieldByName('DS_TARGET').AsString='A',0,1);
      MemberCodeEdit.Text     := Query.FieldByName('CD_MEMBER').AsString;
      MemberNameEdit.Text     := Query.FieldByName('NM_MEMBER').AsString;
      MenuCodeEdit.Text       := Query.FieldByName('CD_MENU').AsString;
      MenuCodeEdit.Hint       := Query.FieldByName('CD_MENU').AsString;
      MenuNameEdit.Text       := Query.FieldByName('NM_MENU').AsString;
      StatusComboBox.ItemIndex := Query.FieldByName('DS_STATUS').AsInteger;
      DcAmtEdit.Enabled       := TypeComboBox.Enabled;
      RemarkMemo.Text         := Query.FieldByName('REMARK').AsString;
      StatusComboBox.Enabled  := StatusComboBox.ItemIndex <> 1;
      CouponNoCreateButton.Enabled := false;
      CouponNumberMemo.Lines.Clear;
      CouponNumberPanel.Visible := false;
    end;
  finally
    FinishQuery;
    isLoading := false;
  end;
end;

function THeadCouponForm.DoNew: Boolean;
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
              StandardStore,
              CouponLen]);
    if CouponLen = Length(Query.Fields[0].AsString) then
      CouponNoEdit.Text := LeftStr(Query.Fields[0].AsString, Length(Query.Fields[0].AsString)-2) + FormatFloat('00', StrToInt(RightStr(Query.Fields[0].AsString,2))+1)
    else
      CouponNoEdit.Text := CouponPrefix + FormatDateTime('yyyy', now()) + FormatFloat(vTemp, 1);
  finally
    FinishQuery;
  end;
  CouponNoCreateButton.Enabled := true;
  CountEdit.Enabled    := true;
  CouponNoEdit.Enabled := GetOption(2) = '0';
  CouponNumberMemo.Lines.Clear;
  CouponNumberPanel.Visible := false;
  TypeComboBox.Enabled := true;
  DcAmtEdit.Enabled    := true;
  CouponNameEdit.SetFocus;
  Result := true;
end;

function THeadCouponForm.DoSave: Boolean;
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

          vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''1'',''%s'',%s, %s, %s,''%s'',''%s'',''%s'',''%s'',''%s'',''0'',Now()),',
                               [HeadStoreCode,
                                StandardStore,
                                CouponNumberMemo.Lines.Strings[vIndex],
                                CouponNameEdit.Text,
                                FormatDateTime('yyyymmdd',now),
                                Ifthen(CouponDateFromEdit.Date=0,'',DtoS(CouponDateFromEdit.Date)),
                                Ifthen(CouponDateToEdit.Date=0,'',DtoS(CouponDateToEdit.Date)),
                                Ifthen(TypeComboBox.ItemIndex=0,'A','R'),
                                FloatToStr(DcAmtEdit.Value),
                                FloatToStr(SaleAmtEdit.Value),
                                FloatToStr(MaxDcAmtEdit.Value),
                                Ifthen(TargetComboBox.ItemIndex=0,'A','M'),
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
                           +'                     ''1'', '
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
                            StandardStore,
                            CouponNoEdit.Text,
                            CouponNameEdit.Text,
                            FormatDateTime('yyyymmdd',now),
                            Ifthen(CouponDateFromEdit.Date=0,'',DtoS(CouponDateFromEdit.Date)),
                            Ifthen(CouponDateToEdit.Date=0,'',DtoS(CouponDateToEdit.Date)),
                            Ifthen(TypeComboBox.ItemIndex=0,'A','R'),
                            DcAmtEdit.Value,
                            SaleAmtEdit.Value,
                            MaxDcAmtEdit.Value,
                            Ifthen(TargetComboBox.ItemIndex=0,'A','M'),
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
                          StandardStore,
                          CouponNoEdit.Text,
                          CouponNameEdit.Text,
                          Ifthen(CouponDateFromEdit.Date=0,'',DtoS(CouponDateFromEdit.Date)),
                          Ifthen(CouponDateToEdit.Date=0,'',DtoS(CouponDateToEdit.Date)),
                          Ifthen(TypeComboBox.ItemIndex=0,'A','R'),
                          DcAmtEdit.Value,
                          SaleAmtEdit.Value,
                          MaxDcAmtEdit.Value,
                          Ifthen(TargetComboBox.ItemIndex=0,'A','M'),
                          MemberCodeEdit.Text,
                          MenuCodeEdit.Text,
                          UserCode,
                          IntToStr(StatusComboBox.ItemIndex),
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

function THeadCouponForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    1 : vWhere := vWhere + 'and DS_STATUS = ''0'' ';
    2 : vWhere := vWhere + 'and DS_STATUS = ''1'' ';
    3 : vWhere := vWhere + 'and DS_STATUS = ''2'' ';
  end;

  OpenQuery('select NO_COUPON, '
           +'       NM_COUPON, '
           +'       case DS_STATUS  when  ''0'' then ''미사용'' when ''1'' then ''사용'' when ''2'' then ''폐기'' end as DS_STATUS'
           +'  from MS_COUPON '
           +' where CD_HEAD   =:P0 '
           +'   and CD_STORE  =:P1 '
           +vWhere
           +'   and (NO_COUPON like ConCat(''%'',:P2) or NO_COUPON like ConCat(:P2,''%'')) ',
           [HeadStoreCode,
            StandardStore,
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadCouponForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if isLoading then Exit;
  if Sender = TypeComboBox then
  begin
    if TypeComboBox.ItemIndex = 1 then
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
    MemberCodeEdit.Enabled := TargetComboBox.ItemIndex = 1;
    if TargetComboBox.ItemIndex = 0 then
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

procedure THeadCouponForm.EditPropertiesValidate(Sender: TObject;
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
             +'  and    b.CD_KIND   = ''05''',
              [HeadStoreCode,
               StandardStore,
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
               StandardStore,
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
