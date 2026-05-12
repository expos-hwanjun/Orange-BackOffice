unit CodeAutoCoupon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxSpinEdit, cxTimeEdit,
  Vcl.StdCtrls, cxGroupBox, cxCheckBox, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  DBAccess, Uni, Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGrid,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvSplitter, StrUtils, Math, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  dxmdaset, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager,
  AdvOfficePagerStylers;

type
  TCodeAutoCouponForm = class(TInheritGridEditForm)
    GridTableViewCode: TcxGridColumn;
    GridTableViewName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    SaleAmtLabel: TLabel;
    DCTimeLabel: TLabel;
    EventDateLabel: TcxLabel;
    EventFromDateEdit: TcxDateEdit;
    cxLabel3: TcxLabel;
    EventToDateEdit: TcxDateEdit;
    SaleFromAmtEdit: TcxCurrencyEdit;
    PointCheckBox: TcxCheckBox;
    UseDateLabel: TcxLabel;
    UseFromDateEdit: TcxDateEdit;
    cxLabel5: TcxLabel;
    UseToDateEdit: TcxDateEdit;
    WeeklyGroupBox: TcxGroupBox;
    WeeklyMonCheckBox: TcxCheckBox;
    WeeklyTueCheckBox: TcxCheckBox;
    WeeklyWedCheckBox: TcxCheckBox;
    WeeklyThuCheckBox: TcxCheckBox;
    WeeklyFriCheckBox: TcxCheckBox;
    WeeklySatCheckBox: TcxCheckBox;
    WeeklySunCheckBox: TcxCheckBox;
    TimeFromEdit: TcxTimeEdit;
    TimeToEdit: TcxTimeEdit;
    AllTimeCheckBox: TcxCheckBox;
    DCCodeLabel: TLabel;
    DCNameLabel: TLabel;
    EventCodeEdit: TcxCurrencyEdit;
    EventNameEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    UseComboBox: TcxComboBox;
    cxLabel6: TcxLabel;
    SaleToAmtEdit: TcxCurrencyEdit;
    MemberCheckBox: TcxCheckBox;
    DcAmtEdit: TcxCurrencyEdit;
    TypeComboBox: TcxComboBox;
    RatePercentLabel: TcxLabel;
    Label1: TLabel;
    CouponWeeklySelectAllButton: TAdvGlowButton;
    procedure EditPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure CouponWeeklySelectAllButtonClick(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 그리드 연결 자료 표시
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  CodeAutoCouponForm: TCodeAutoCouponForm;

implementation
uses Common, DBModule;
{$R *.dfm}
procedure TCodeAutoCouponForm.FormCreate(Sender: TObject);
begin
  inherited;
end;

{ TSystemCouponSetupForm }
function TCodeAutoCouponForm.DoSearch: Boolean;
begin
  OpenQuery('select NO_EVENT, '
           +'       NM_EVENT '
           +'  from MS_EVENT '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_EVENT =''0'' '
           +' order by NO_EVENT ',
           [HeadStoreCode,
            StoreCode]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TCodeAutoCouponForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if isLoading then Exit;

  if Sender = EventFromDateEdit then
  begin
    if EventFromDateEdit.Date > EventToDateEdit.Date then
      EventToDateEdit.Date := EventFromDateEdit.Date;
  end
  else if Sender = EventToDateEdit then
  begin
    if EventToDateEdit.Date < EventFromDateEdit.Date then
      EventFromDateEdit.Date := EventToDateEdit.Date;
  end
  else if Sender =AllTimeCheckBox then
  begin
    if AllTimeCheckBox.Checked then
    begin
      TimeFromEdit.EditValue := '오전 12:00:00';
      TimeToEdit.EditValue   := '오전 12:00:00';
      TimeFromEdit.Enabled   := false;
      TimeToEdit.Enabled     := false;
    end
    else
    begin
      TimeFromEdit.Enabled   := true;
      TimeToEdit.Enabled     := true;
    end;
  end
  else if Sender = UseFromDateEdit then
  begin
    if UseFromDateEdit.Date > UseToDateEdit.Date then
      UseToDateEdit.Date := UseFromDateEdit.Date;
  end
  else if Sender = UseToDateEdit then
  begin
    if UseToDateEdit.Date < UseFromDateEdit.Date then
      UseFromDateEdit.Date := UseToDateEdit.Date;
  end
  else if Sender = TypeComboBox then
  begin
    if TypeComboBox.ItemIndex = 1 then
    begin
      DcAmtEdit.Properties.MaxValue      := 100;
      DcAmtEdit.Properties.AssignedValues.MaxValue := true;
      RatePercentLabel.Caption           := '%';
    end
    else
    begin
      DcAmtEdit.Properties.MaxValue      := 0;
      DcAmtEdit.Properties.AssignedValues.MaxValue := false;
      RatePercentLabel.Caption           := '원';
    end;
  end;
end;

procedure TCodeAutoCouponForm.DoGridLink;
var vDcAmt :Currency;
begin
  inherited;
  isLoading := true;
  try
    OpenQuery('select NO_EVENT, '
             +'       NM_EVENT, '
             +'       YMD_FROM, '
             +'       YMD_TO, '
             +'       TIME_FROM, '
             +'       TIME_TO, '
             +'       WEEKLY, '
             +'       AMT_SALE_FROM, '
             +'       AMT_SALE_TO, '
             +'       StoD(YMD_USE_FROM) as YMD_USE_FROM, '
             +'       StoD(YMD_USE_TO) as YMD_USE_TO, '
             +'       AMT_DC, '
             +'       YN_USE, '
             +'       YN_POINT, '
             +'       YN_MEMBER, '
             +'       COUPON_TYPE '
             +'  from MS_EVENT '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and NO_EVENT =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCode.Index]]);

    EventCodeEdit.Text     := Query.FieldByName('NO_EVENT').AsString;
    EventNameEdit.Text     := Query.FieldByName('NM_EVENT').AsString;
    EventFromDateEdit.Date := StoD(Query.FieldByName('YMD_FROM').AsString);
    EventToDateEdit.Date   := StoD(Query.FieldByName('YMD_TO').AsString);
    TimeFromEdit.Time      := StoT(Query.FieldByName('TIME_FROM').AsString);
    TimeToEdit.Time        := StoT(Ifthen(Query.FieldByName('TIME_TO').AsString='24:00','00:00',Query.FieldByName('TIME_TO').AsString));
    if (TimeFromEdit.EditValue = '오전 12:00:00') and (TimeToEdit.EditValue= '오전 12:00:00') then
    begin
      TimeFromEdit.Enabled    := false;
      TimeToEdit.Enabled      := false;
      AllTimeCheckBox.Checked := true;
    end;
    WeeklyMonCheckBox.Checked    := Copy(Query.FieldByName('WEEKLY').AsString,1,1) = '1';
    WeeklyTueCheckBox.Checked    := Copy(Query.FieldByName('WEEKLY').AsString,2,1) = '1';
    WeeklyWedCheckBox.Checked    := Copy(Query.FieldByName('WEEKLY').AsString,3,1) = '1';
    WeeklyThuCheckBox.Checked    := Copy(Query.FieldByName('WEEKLY').AsString,4,1) = '1';
    WeeklyFriCheckBox.Checked    := Copy(Query.FieldByName('WEEKLY').AsString,5,1) = '1';
    WeeklySatCheckBox.Checked    := Copy(Query.FieldByName('WEEKLY').AsString,6,1) = '1';
    WeeklySunCheckBox.Checked    := Copy(Query.FieldByName('WEEKLY').AsString,7,1) = '1';

    SaleFromAmtEdit.Value   := Query.FieldByName('AMT_SALE_FROM').AsCurrency;
    SaleToAmtEdit.Value     := Query.FieldByName('AMT_SALE_TO').AsCurrency;
    vDcAmt                  := Query.FieldByName('AMT_DC').AsCurrency;
    PointCheckBox.Checked   := Query.FieldByName('YN_POINT').AsString = 'Y';
    MemberCheckBox.Checked  := Query.FieldByName('YN_MEMBER').AsString = 'Y';
    UseFromDateEdit.Text    := Query.FieldByName('YMD_USE_FROM').AsString;
    UseToDateEdit.Text      := Query.FieldByName('YMD_USE_TO').AsString;
    UseComboBox.ItemIndex   := Ifthen(Query.FieldByName('YN_USE').AsString = 'Y',0,1);
    TypeComboBox.ItemIndex  := Ifthen(Query.FieldByName('COUPON_TYPE').AsString='A',0,1);
  finally
    Query.Close;
    isLoading := false;
    EditPropertiesChange(TypeComboBox);
    DcAmtEdit.Value := vDcAmt;
  end;
end;

function TCodeAutoCouponForm.DoNew: Boolean;
begin
  isLoading := true;
  try
    OpenQuery('select Ifnull(Max(NO_EVENT),0) '
             +'  from MS_EVENT '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [HeadStoreCode,
              StoreCode]);
    EventCodeEdit.Text := FormatFloat('00000', Query.Fields[0].AsInteger+1);
  finally
    Query.Close;
  end;

  EventFromDateEdit.Date      := Date;
  EventToDateEdit.Date        := Date;
  TimeFromEdit.Time           := EncodeTime(0,0,0,0);
  TimeToEdit.Time             := EncodeTime(0,0,0,0);
  WeeklyMonCheckBox.Checked  := true;
  WeeklyTueCheckBox.Checked  := true;
  WeeklyWedCheckBox.Checked  := true;
  WeeklyThuCheckBox.Checked  := true;
  WeeklyFriCheckBox.Checked  := true;
  WeeklySatCheckBox.Checked  := true;
  WeeklySunCheckBox.Checked  := true;

  UseFromDateEdit.Date       := Date;
  UseToDateEdit.Date         := Date;
  isLoading := false;
  Result    := true;
  EventNameEdit.SetFocus;
end;

procedure TCodeAutoCouponForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  if Trim(CouponPrefix) = EmptyStr then
  begin
    MsgBox('환경설정에서 쿠폰 프리픽스를 설정해야 합니다');
    Exit;
  end;
  inherited;

end;

procedure TCodeAutoCouponForm.CouponWeeklySelectAllButtonClick(Sender: TObject);
begin
  inherited;
  WeeklySunCheckBox.Checked    := true;
  WeeklyMonCheckBox.Checked    := true;
  WeeklyTueCheckBox.Checked    := true;
  WeeklyWedCheckBox.Checked    := true;
  WeeklyThuCheckBox.Checked    := true;
  WeeklyFriCheckBox.Checked    := true;
  WeeklySatCheckBox.Checked    := true;
end;

function TCodeAutoCouponForm.DoDelete: Boolean;
begin
  Result := ExecQuery('delete from MS_EVENT '
                     +'where  CD_HEAD  = :P0 '
                     +'  and  CD_STORE = :P1 '
                     +'  and  NO_EVENT = :P2;',
                      [HeadStoreCode,
                       StoreCode,
                       EventCodeEdit.Text],
                       true);
end;

function TCodeAutoCouponForm.DoSave: Boolean;
begin
  if Trim(CouponPrefix) = EmptyStr then
  begin
    MsgBox('환경설정에서 쿠폰 프리픽스를 설정해야 합니다');
    Exit;
  end;

  if EventFromDateEdit.Text = EmptyStr then
  begin
    ErrBox(EventDateLabel.Caption+msgMustInput);
    if MainPanel.Enabled and EventFromDateEdit.Enabled then
      EventFromDateEdit.SetFocus;
    Exit;
  end
  else if (EventToDateEdit.Text = EmptyStr) or (EventToDateEdit.Date < EventFromDateEdit.Date) then
  begin
    ErrBox(EventDateLabel.Caption+msgMustInput);
    if MainPanel.Enabled and EventToDateEdit.Enabled then
      EventToDateEdit.SetFocus;
    Exit;
  end
  // 적용요일
  else if not WeeklyMonCheckBox.Checked and
          not WeeklyTueCheckBox.Checked and
          not WeeklyWedCheckBox.Checked and
          not WeeklyThuCheckBox.Checked and
          not WeeklyFriCheckBox.Checked and
          not WeeklySatCheckBox.Checked and
          not WeeklySunCheckBox.Checked then
  begin
    ErrBox(Format('%s을 하나 이상 선택하십시오.', [Trim(WeeklyGroupBox.Caption)]));
    if MainPanel.Enabled and WeeklyMonCheckBox.Enabled then
      WeeklyMonCheckBox.SetFocus;
    Exit;
  end
  else if UseFromDateEdit.Text = EmptyStr then
  begin
    ErrBox(UseDateLabel.Caption+msgMustInput);
    if MainPanel.Enabled and UseFromDateEdit.Enabled then
      UseFromDateEdit.SetFocus;
    Exit;
  end
  else if (UseToDateEdit.Text = EmptyStr) or (UseToDateEdit.Date < UseFromDateEdit.Date) then
  begin
    ErrBox(UseDateLabel.Caption+msgMustInput);
    if MainPanel.Enabled and UseToDateEdit.Enabled then
      UseToDateEdit.SetFocus;
    Exit;
  end
  else if (SaleFromAmtEdit.Value = 0) or (SaleToAmtEdit.Value = 0) then
  begin
    ErrBox(SaleAmtLabel.Caption+msgMustInput);
    if MainPanel.Enabled and (SaleFromAmtEdit.Value = 0) then
      SaleFromAmtEdit.SetFocus
    else if MainPanel.Enabled and (SaleToAmtEdit.Value = 0) then
      SaleToAmtEdit.SetFocus;
    Exit;
  end
  else if SaleFromAmtEdit.Value > SaleToAmtEdit.Value then
  begin
    ErrBox(SaleAmtLabel.Caption+'을 정확히 입력하세요');
    if MainPanel.Enabled and (SaleToAmtEdit.Value = 0) then
      SaleToAmtEdit.SetFocus;
    Exit;
  end
  else if DcAmtEdit.Value = 0 then
  begin
    ErrBox('쿠폰금액을 '+msgMustInput);
    if MainPanel.Enabled and DcAmtEdit.Enabled then
      DcAmtEdit.SetFocus;
    Exit;
  end;

  try
    ExecQuery('insert into MS_EVENT(CD_HEAD, '
             +'                     CD_STORE, '
             +'                     NO_EVENT, '
             +'                     NM_EVENT, '
             +'                     DS_EVENT, '
             +'                     YMD_FROM, '
             +'                     YMD_TO, '
             +'                     TIME_FROM, '
             +'                     TIME_TO, '
             +'                     WEEKLY, '
             +'                     AMT_SALE_FROM, '
             +'                     AMT_SALE_TO, '
             +'                     YMD_USE_FROM, '
             +'                     YMD_USE_TO, '
             +'                     COUPON_TYPE, '
             +'                     AMT_DC, '
             +'                     YN_POINT, '
             +'                     YN_MEMBER, '
             +'                     YN_USE) '
             +'              values(:P0, '
             +'                     :P1, '
             +'                     :P2, '
             +'                     :P3, '
             +'                     ''0'', '
             +'                     :P4, '
             +'                     :P5, '
             +'                     :P6, '
             +'                     :P7, '
             +'                     :P8, '
             +'                     :P9, '
             +'                     :P10, '
             +'                     :P11, '
             +'                     :P12, '
             +'                     :P13, '
             +'                     :P14, '
             +'                     :P15, '
             +'                     :P16, '
             +'                     :P17) '
             +' ON DUPLICATE KEY UPDATE NM_EVENT      =:P3, '
             +'                         YMD_FROM      =:P4, '
             +'                         YMD_TO        =:P5, '
             +'                         TIME_FROM     =:P6, '
             +'                         TIME_TO       =:P7, '
             +'                         WEEKLY        =:P8, '
             +'                         AMT_SALE_FROM =:P9, '
             +'                         AMT_SALE_TO   =:P10, '
             +'                         YMD_USE_FROM  =:P11, '
             +'                         YMD_USE_TO    =:P12, '
             +'                         COUPON_TYPE   =:P13, '
             +'                         AMT_DC        =:P14, '
             +'                         YN_POINT      =:P15, '
             +'                         YN_MEMBER     =:P16, '
             +'                         YN_USE        =:P17;',
            [HeadStoreCode,
             StoreCode,
             EventCodeEdit.Text,
             EventNameEdit.Text,
             DtoS(EventFromDateEdit.Date),
             DtoS(EventToDateEdit.Date),
             FormatDateTime(fmtTime, TimeFromEdit.Time),
             Ifthen(FormatDateTime(fmtTime, TimeToEdit.Time)='00:00','24:00',FormatDateTime(fmtTime, TimeToEdit.Time)),
             IfThen(WeeklyMonCheckBox.Checked, '1', '0')+IfThen(WeeklyTueCheckBox.Checked, '1', '0')+IfThen(WeeklyWedCheckBox.Checked, '1', '0')+IfThen(WeeklyThuCheckBox.Checked, '1', '0')+IfThen(WeeklyFriCheckBox.Checked, '1', '0')+IfThen(WeeklySatCheckBox.Checked, '1', '0')+IfThen(WeeklySunCheckBox.Checked, '1', '0'),
             SaleFromAmtEdit.Value,
             SaleToAmtEdit.Value,
             Ifthen(UseFromDateEdit.Date=0,'',DtoS(UseFromDateEdit.Date)),
             Ifthen(UseToDateEdit.Date=0,'',DtoS(UseToDateEdit.Date)),
             Ifthen(TypeComboBox.ItemIndex=0,'A','R'),
             DcAmtEdit.Value,
             Ifthen(PointCheckBox.Checked, 'Y','N'),
             Ifthen(MemberCheckBox.Checked, 'Y','N'),
             Ifthen(UseComboBox.ItemIndex=0,'Y','N')], true);
    if isNew then
    begin
      SetLength(NewData, 3);
      NewData[0] := EventCodeEdit.Text;
      NewData[1] := EventNameEdit.Text;
      NewData[2] := 'Y';
    end
    else if GridTableView.DataController.FocusedRecordIndex >= 0 then
    begin
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index]    := EventNameEdit.Text;
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewStatus.Index]  := Ifthen(UseComboBox.ItemIndex=0,'Y','N');
    end;
    Result := true;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;



end.
