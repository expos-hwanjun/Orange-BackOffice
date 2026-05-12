unit ReserveBooking;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Vcl.StdCtrls, StrUtils,
  cxGridCustomTableView, cxGridTableView, Vcl.ExtCtrls, AdvToolBar, DateUtils,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, Vcl.Menus, cxButtons, cxMemo,
  cxCurrencyEdit, cxSpinEdit, cxTimeEdit, AdvOfficePager, cxButtonEdit,
  Math, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, cxGroupBox,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePagerStylers;

type
  TReserveBookingForm = class(TInheritGridEditForm)
    GridTableViewBookingNo: TcxGridColumn;
    GridTableViewName: TcxGridColumn;
    MenuCodeLabel: TLabel;
    BookingNoEdit: TcxTextEdit;
    Label1: TLabel;
    BookingNameEdit: TcxTextEdit;
    Label2: TLabel;
    TelNoEdit: TcxTextEdit;
    Label3: TLabel;
    BookingDateEdit: TcxDateEdit;
    BookingTimeEdit: TcxTimeEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CustomerCountEdit: TcxCurrencyEdit;
    BookingAmountEdit: TcxCurrencyEdit;
    Label8: TLabel;
    BookingTableEdit: TcxTextEdit;
    Label11: TLabel;
    RemarkMemo: TcxMemo;
    MemberButton: TcxButton;
    Label12: TLabel;
    MemberCodeEdit: TcxTextEdit;
    BookingButton: TcxButton;
    Label13: TLabel;
    ReservePager: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    Grid1: TcxGrid;
    ReserveGridTableView: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    ReserveGridTableViewColumn1: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    Grid2: TcxGrid;
    MenuGridTableView: TcxGridTableView;
    MenuGridTableViewMenuCode: TcxGridColumn;
    MenuGridTableViewMenuName: TcxGridColumn;
    MenuGridTableViewMenuQty: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    MenuButton: TcxButton;
    AdvOfficePage1: TAdvOfficePage;
    Grid3: TcxGrid;
    TableGridTableView: TcxGridTableView;
    TableGridTableViewTableName: TcxGridColumn;
    cxGridLevel3: TcxGridLevel;
    TableButton: TcxButton;
    TableGridTableViewTableNo: TcxGridColumn;
    GridTableViewBookingDate: TcxGridColumn;
    TableGridTableViewFloor: TcxGridColumn;
    Label14: TLabel;
    StatusEdit: TcxTextEdit;
    procedure BookingButtonClick(Sender: TObject);
    procedure MemberButtonClick(Sender: TObject);
    procedure TableButtonClick(Sender: TObject);
    procedure MenuButtonClick(Sender: TObject);
    procedure TelNoEditExit(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuGridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  ReserveBookingForm: TReserveBookingForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

{ TReserveBookingForm }
procedure TReserveBookingForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/예약&근태&출납/예약등록/예약등록.htm';
  ReservePager.ActivePageIndex := 0;
end;

function TReserveBookingForm.DoNew: Boolean;
var vIndex :Integer;
begin
  ReservePager.ActivePageIndex := 0;
  BookingNoEdit.Clear;
  BookingDateEdit.Date := now();
  BookingTimeEdit.Time := now();
  ReserveGridTableView.DataController.RecordCount := 0;
  MenuGridTableView.DataController.RecordCount    := 0;
  TableGridTableView.DataController.RecordCount   := 0;
  OpenQuery('select  Ifnull(Max(NO_BOOKING), ConCat(Date_Format(Now(),''%Y%m%d''),''000'')) '
           +'  from SL_BOOKING '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and Left(NO_BOOKING,8) = Date_Format(NOW(),''%Y%m%d'') ',
           [HeadStoreCode,
            StoreCode]);
  vIndex := StrToInt(RightStr(Query.Fields[0].AsString,3));
  BookingNoEdit.Text := LeftStr(Query.Fields[0].AsString,8) + FormatFloat('000', vIndex + 1);
  Query.Close;
  BookingNameEdit.SetFocus;
  Result := true;
end;

function TReserveBookingForm.DoSearch: Boolean;
var vTemp :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vTemp := 'N';
    1 : vTemp := 'Y';
    2 : vTemp := '';
  end;
  try
    OpenQuery('select NO_BOOKING, '
             +'       NM_NAME, '
             +'       DT_BOOKING '
             +'  from SL_BOOKING '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and Date_Format(DT_BOOKING,''%Y%m%d'') Between :P2 and :P3 '
             +'   and YN_SALE like ConCat(:P4 ,''%'') ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              vTemp]);
    Result := not Query.Eof;
    if Result then
      DM.ReadQuery(Query, GridTableView)
    else
      GridTableView.DataController.RecordCount := 0;
  finally
    FinishQuery;
  end;
end;

procedure TReserveBookingForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
end;

//////////////////////////////////////////////////////////////////
//회원조회
procedure TReserveBookingForm.MemberButtonClick(Sender: TObject);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := '회원코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '회원이름';
      GridTableViewName1.Width   := 320;

      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER, '
                   +'         AES_Decrypt(TEL_MOBILE, 71483) '
                   +'  from   MS_MEMBER  '
                   +' where   CD_HEAD   =:P0 '
                   +'   and   CD_STORE  =:P1 '
                   +'   and  (CD_MEMBER =:P2 '
                   +'      or NM_MEMBER like ConCat(''%'',:P2,''%'') '
                   +'      or NO_CARD = :P2 '
                   +'      or AES_Decrypt(TEL_MOBILE, 71483) like ConCat(''%'',:P2))  '
                   +'   and DS_STATUS = ''0'' '
                   +' order by NM_MEMBER';
      IsMemberSearch := True;
      if SearchText <> EmptyStr then IsAutoSearch := True;

      if ShowModal = mrOK then
      begin
        MemberCodeEdit.Text     := Code;
        BookingNameEdit.Text    := Names[0];
        TelNoEdit.Text          := GetPhoneNo(Names[1]);
        if TelNoEdit.Text = EmptyStr then
          TelNoEdit.SetFocus
        else
          BookingDateEdit.SetFocus;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

//////////////////////////////////////////////////////////////////
//메뉴조회
procedure TReserveBookingForm.MenuButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption := '메뉴 조회';
      GridTableViewCode.Caption  := '메뉴코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '메뉴이름';
      GridTableViewName1.Width   := 320;
      GridTableViewName2.Caption := '판매단가';
      GridTableViewName2.Width   := 70;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;
      SQLText    := 'select   CD_MENU, '
                   +'         NM_MENU, '
                   +'         PR_SALE '
                   +'  from   MS_MENU  '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and   NM_MENU like ConCat(''%'',:P2,''%'') '
                   +'   and   DS_MENU_TYPE in (''N'',''C'',''S'') '
                   +'   and   YN_USE = ''Y'' '
                   +' order by NM_MENU';
      IsAutoSearch := True;
      GridTableView.OptionsSelection.MultiSelect := true;

      if ShowModal = mrOK then
      begin
        MenuGridTableView.DataController.RecordCount := 0;
        for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        begin
          MenuGridTableView.DataController.AppendRecord;
          MenuGridTableView.DataController.Values[MenuGridTableView.DataController.RecordCount-1, 0] := GridTableView.Controller.SelectedRecords[vIndex].Values[0];
          MenuGridTableView.DataController.Values[MenuGridTableView.DataController.RecordCount-1, 1] := GridTableView.Controller.SelectedRecords[vIndex].Values[1];
          MenuGridTableView.DataController.Values[MenuGridTableView.DataController.RecordCount-1, 2] := 1;
        end;
        ReservePager.ActivePageIndex := 1;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

procedure TReserveBookingForm.MenuGridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  isChanged := true;
end;

//////////////////////////////////////////////////////////////////
//예약현황조회
procedure TReserveBookingForm.BookingButtonClick(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select NO_BOOKING, '
             +'       Date_Format(DT_BOOKING, ''%H:%i'') as BOOKING_TIME, '
             +'       Ifnull(CNT_PERSON, 0) as CNT_PERSON '
             +'  from SL_BOOKING  '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and Date_Format(DT_BOOKING, ''%Y%m%d'') =:P2 ',
             [HeadStoreCode,
              StoreCode,
              DtoS(BookingDateEdit.Date)]);
    DM.ReadQuery(Query, ReserveGridTableView);
    ReservePager.ActivePageIndex := 0;
  finally
    FinishQuery;
  end;
end;

//////////////////////////////////////////////////////////////////
//담당자조회
function TReserveBookingForm.DoDelete: Boolean;
begin
  result := false;
  if StatusEdit.Text = '방문' then
  begin
    MsgBox('방문한 예약은 삭제할 수 없습니다');
    Exit;
  end;
  try
    Result := ExecQuery('delete from SL_BOOKING '
                       +' where CD_HEAD    =:P0 '
                       +'   and CD_STORE   =:P1 '
                       +'   and NO_BOOKING =:P2; '
                       +'delete from SL_BOOKING_MENU '
                       +' where CD_HEAD    =:P0 '
                       +'   and CD_STORE   =:P1 '
                       +'   and NO_BOOKING =:P2; '
                       +'delete from SL_BOOKING_TABLE '
                       +' where CD_HEAD    =:P0 '
                       +'   and CD_STORE   =:P1 '
                       +'   and NO_BOOKING =:P2; ',
                       [HeadStoreCode,
                        StoreCode,
                        BookingNoEdit.Text]);
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TReserveBookingForm.DoGridLink;
var vIndex :Integer;
begin
  inherited;
  try
    OpenQuery('select CD_MEMBER, '
             +'       GetPhoneNo(NO_TEL) as NO_TEL, '
             +'       Date_Format(DT_BOOKING, ''%Y-%m-%d'') as BOOKING_DATE, '
             +'       Date_Format(DT_BOOKING, ''%H:%i'') as BOOKING_TIME, '
             +'       NO_TABLE, '
             +'       CNT_PERSON, '
             +'       AMT_BOOKING, '
             +'       REMARK, '
             +'       YN_SALE '
             +'  from SL_BOOKING '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and NO_BOOKING =:P2 ',
             [HeadStoreCode,
              StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBookingNo.Index]]);

    BookingNoEdit.Text      := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBookingNo.Index];
    BookingNameEdit.Text    := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewName.Index];
    MemberCodeEdit.Text     := Query.FieldByName('CD_MEMBER').AsString;
    TelNoEdit.Text          := Query.FieldByName('NO_TEL').AsString;
    BookingDateEdit.Text    := Query.FieldByName('BOOKING_DATE').AsString;
    BookingTimeEdit.Text    := Query.FieldByName('BOOKING_TIME').AsString;
    CustomerCountEdit.Value := Query.FieldByName('CNT_PERSON').AsInteger;
    BookingAmountEdit.Value := Query.FieldByName('AMT_BOOKING').AsInteger;
    RemarkMemo.Text         := Query.FieldByName('REMARK').AsString;
    StatusEdit.Text         := Ifthen(Query.FieldByName('YN_SALE').AsString='Y', '방문','미방문');
    //예약현황
    Query.Close;
    OpenQuery('select NO_BOOKING, '
             +'       Date_Format(DT_BOOKING, ''%H:%i'') as BOOKING_TIME, '
             +'       Ifnull(CNT_PERSON, 0) as CNT_PERSON '
             +'  from SL_BOOKING  '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and Date_Format(DT_BOOKING, ''%Y%m%d'') =:P2 ',
             [HeadStoreCode,
              StoreCode,
              FormatDateTime(fmtDateShort, BookingDateEdit.Date)]);
    DM.ReadQuery(Query, ReserveGridTableView);

    //예약메뉴
    Query.Close;
    OpenQuery('select a.CD_MENU, '
             +'       b.NM_MENU, '
             +'       a.QTY_MENU '
             +'  from SL_BOOKING_MENU a left outer join '
             +'       MS_MENU         b  on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU '
             +' where a.CD_HEAD    =:P0 '
             +'   and a.CD_STORE   =:P1 '
             +'   and a.NO_BOOKING =:P2 '
             +' order by a.CD_MENU ',
             [HeadStoreCode,
              StoreCode,
              BookingNoEdit.Text]);
    DM.ReadQuery(Query, MenuGridTableView);
    //예약테이블
    Query.Close;
    OpenQuery('select c.NM_CODE1 as NM_FLOOR, '
             +'       b.NM_TABLE, '
             +'       a.NO_TABLE '
             +'  from SL_BOOKING_TABLE a inner join '
             +'       MS_TABLE         b on a.CD_HEAD = b.CD_HEAD  and a.CD_STORE = b.CD_STORE and a.NO_TABLE = b.NO_TABLE left outer join '
             +'       MS_CODE          c on c.CD_HEAD = b.CD_HEAD  and c.CD_STORE = b.CD_STORE and c.CD_KIND = ''03'' and c.CD_CODE = b.CD_FLOOR '
             +' where a.CD_HEAD    =:P0 '
             +'   and a.CD_STORE   =:P1 '
             +'   and a.NO_BOOKING =:P2 '
             +' order by a.NO_TABLE ',
             [HeadStoreCode,
              StoreCode,
              BookingNoEdit.Text]);
    DM.ReadQuery(Query, TableGridTableView);
    BookingTableEdit.Clear;
    for vIndex := 0 to TableGridTableView.DataController.RecordCount-1 do
      BookingTableEdit.Text := BookingTableEdit.Text + TableGridTableView.DataController.Values[vIndex, TableGridTableViewTableName.Index] + ',';
    BookingTableEdit.Text := LeftStr(BookingTableEdit.Text, Length(BookingTableEdit.Text)-1);
  finally
    FinishQuery;
  end;
end;


function TReserveBookingForm.DoSave: Boolean;
var vIndex :Integer;
    vMemo  :String;
begin
  result := false;
  if TelNoEdit.Text = EmptyStr then
  begin
    ErrBox('연락처를 입력하세요');
    TelNoEdit.SetFocus;
    Exit;
  end;

  if TelNoEdit.Text = EmptyStr then
  begin
    ErrBox('연락처를 입력하세요');
    TelNoEdit.SetFocus;
    Exit;
  end;

  try
    //예약번호를 구한다
    if isNew then
    begin
      OpenQuery('select  Ifnull(Max(NO_BOOKING), ConCat(Date_Format(Now(),''%Y%m%d''),''000'')) '
               +'  from SL_BOOKING '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and Left(NO_BOOKING,8) = Date_Format(NOW(),''%Y%m%d'') ',
               [HeadStoreCode,
                StoreCode]);

      vIndex := StrToInt(RightStr(Query.Fields[0].AsString,3));
      BookingNoEdit.Text := LeftStr(Query.Fields[0].AsString,8) + FormatFloat('000', vIndex + 1);
      Query.Close;
    end;

    try
      OpenQuery('select BOOKING_SMS_MEMO '
               +'  from MS_STORE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 ',
               [HeadStoreCode,
                StoreCode]);
      vMemo := Query.Fields[0].AsString;
    finally
      FinishQuery;
    end;

    if StrToDateTime(FormatDateTime(fmtDate, BookingDateEdit.Date) + ' '+FormatDateTime(fmtTime, BookingTimeEdit.Time)) < IncMinute(Now(), 10) then
    begin
      ErrBox('예약시간이 최소 10분 이후이여야합니다');
      Exit;
    end;

    ExecQuery('insert into SL_BOOKING(CD_HEAD, '
             +'                       CD_STORE, '
             +'                       NO_BOOKING, '
             +'                       CD_MEMBER, '
             +'                       NM_NAME, '
             +'                       NO_TEL, '
             +'                       DT_BOOKING, '
             +'                       CNT_PERSON, '
             +'                       AMT_BOOKING, '
             +'                       REMARK, '
             +'                       NO_POS) '
             +'                VALUES(:P0, '
             +'                       :P1, '
             +'                       :P2, '
             +'                       :P3, '
             +'                       :P4, '
             +'                       :P5, '
             +'                       Cast(:P6 as DateTime), '
             +'                       :P7, '
             +'                       :P8, '
             +'                       :P9, '
             +'                       ''00'') '
             +' ON DUPLICATE KEY UPDATE CD_MEMBER   =:P3, '
             +'                         NM_NAME     =:P4, '
             +'                         NO_TEL      =:P5, '
             +'                         DT_BOOKING  =Cast(:P6 as DateTime), '
             +'                         CNT_PERSON  =:P7, '
             +'                         AMT_BOOKING =:P8, '
             +'                         REMARK      =:P9; ',
             [HeadStoreCode,
              StoreCode,
              BookingNoEdit.Text,
              MemberCodeEdit.Text,
              BookingNameEdit.Text,
              GetOnlyNumber(TelNoEdit.Text),
              FormatDateTime(fmtDate, BookingDateEdit.Date) + ' '+FormatDateTime(fmtTime, BookingTimeEdit.Time),
              CustomerCountEdit.EditingValue,
              BookingAmountEdit.EditingValue,
              RemarkMemo.Text], false);

    //예약메뉴 저장
    ExecQuery('delete from SL_BOOKING_MENU '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and NO_BOOKING =:P2;',
             [HeadStoreCode,
              StoreCode,
              BookingNoEdit.Text], false);
    for vIndex := 0 to MenuGridTableView.DataController.RecordCount-1 do
    begin
      if MenuGridTableView.DataController.Values[vIndex, MenuGridTableViewMenuQty.Index] = 0 then Continue;

      ExecQuery('insert into SL_BOOKING_MENU(CD_HEAD, '
               +'                            CD_STORE, '
               +'                            NO_BOOKING, '
               +'                            CD_MENU, '
               +'                            QTY_MENU) '
               +'                     values(:P0, '
               +'                            :P1, '
               +'                            :P2, '
               +'                            :P3, '
               +'                            :P4);',
               [HeadStoreCode,
                StoreCode,
                BookingNoEdit.Text,
                MenuGridTableView.DataController.Values[vIndex, MenuGridTableViewMenuCode.Index],
                MenuGridTableView.DataController.Values[vIndex, MenuGridTableViewMenuQty.Index]], false);
    end;
    //예약테이블 저장
    ExecQuery('delete from SL_BOOKING_TABLE '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and NO_BOOKING =:P2; ',
             [HeadStoreCode,
              StoreCode,
              BookingNoEdit.Text], false);
    for vIndex := 0 to TableGridTableView.DataController.RecordCount-1 do
    begin
      ExecQuery('insert into SL_BOOKING_TABLE(CD_HEAD, '
               +'                            CD_STORE, '
               +'                            NO_BOOKING, '
               +'                            NO_TABLE) '
               +'                     values(:P0, '
               +'                            :P1, '
               +'                            :P2, '
               +'                            :P3);',
               [HeadStoreCode,
                StoreCode,
                BookingNoEdit.Text,
                TableGridTableView.DataController.Values[vIndex, TableGridTableViewTableNo.Index]], false);
    end;
    Result := ExecQuery(TempSQL, [] ,true);

    if isNew then
    begin
      SetLength(NewData, 2);
      NewData[0] := BookingNoEdit.Text;
      NewData[1] := BookingNameEdit.Text;
    end
    else
      GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := BookingNameEdit.Text;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TReserveBookingForm.SetChanged(aChanged: Boolean);
begin
  inherited;

end;

procedure TReserveBookingForm.TableButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption := '테이블 조회';
      GridTableViewCode.Caption  := '층';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '테이블';
      GridTableViewName1.Width   := 320;

      SQLText    := 'select   b.NM_CODE1, '
                   +'         a.NM_TABLE, '
                   +'         a.NO_TABLE '
                   +'  from   MS_TABLE a inner join '
                   +'         MS_CODE  b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_FLOOR = b.CD_CODE and b.CD_KIND = ''03'' '
                   +' where   a.CD_HEAD  =:P0 '
                   +'   and   a.CD_STORE =:P1 '
                   +'   and   a.NO_TABLE  > 0 '
                   +'   and   b.NM_CODE1 like ConCat(''%'',:P2,''%'') '
                   +' order by a.CD_STORE, a.NO_TABLE';
      IsAutoSearch := True;
      GridTableView.OptionsSelection.MultiSelect := true;

      if ShowModal = mrOK then
      begin
        BookingTableEdit.Clear;
        TableGridTableView.DataController.RecordCount := 0;
        for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        begin
          TableGridTableView.DataController.AppendRecord;
          TableGridTableView.DataController.Values[TableGridTableView.DataController.RecordCount-1, 0] := GridTableView.Controller.SelectedRecords[vIndex].Values[0];
          TableGridTableView.DataController.Values[TableGridTableView.DataController.RecordCount-1, 1] := GridTableView.Controller.SelectedRecords[vIndex].Values[1];
          TableGridTableView.DataController.Values[TableGridTableView.DataController.RecordCount-1, 2] := StoI(GridTableView.Controller.SelectedRecords[vIndex].Values[2]);
          BookingTableEdit.Text := BookingTableEdit.Text + GridTableView.Controller.SelectedRecords[vIndex].Values[1] + ',';
        end;
        BookingTableEdit.Text := LeftStr(BookingTableEdit.Text, Length(BookingTableEdit.Text)-1);
        isChanged := true;
        ReservePager.ActivePageIndex := 2;
      end;
    finally
      Free;
    end;
end;

procedure TReserveBookingForm.TelNoEditExit(Sender: TObject);
begin
  inherited;
  TelNoEdit.Text := GetPhoneNo(TelNoEdit.Text);
end;

end.
