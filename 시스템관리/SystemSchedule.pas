// 캘린더 매출 조회 (완료)

unit SystemSchedule;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, ExtCtrls, cxContainer, cxEdit, Uni,
  DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, Math,
  cxCalendar, AdvGlowButton, AdvToolBar, DateUtils, StrUtils,
  AdvToolBarStylers, cxCheckBox, Menus, TodoList, Planner,
  StdCtrls, cxButtons, cxMemo, ImgList, cxLookAndFeelPainters, cxStyles,
  cxLookAndFeels, DBAccess, cxClasses, Vcl.ComCtrls, dxCore, cxDateUtils,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TSystemScheduleForm = class(TInheritEditForm)
    SunLabel: TcxLabel;
    MonLabel: TcxLabel;
    TueLabel: TcxLabel;
    WedLabel: TcxLabel;
    ThuLabel: TcxLabel;
    FriLabel: TcxLabel;
    SatLabel: TcxLabel;
    PopupMenu: TPopupMenu;
    pmDelete: TMenuItem;
    pmEdit: TMenuItem;
    pmAdd: TMenuItem;
    cxLabel3: TcxLabel;
    ImageList: TImageList;
    SchedulePanel: TPanel;
    TitletEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    ScheduleMemo: TcxMemo;
    cxLabel2: TcxLabel;
    SaveButton: TcxButton;
    CancelButton: TcxButton;
    ScheduleDateLabel: TcxLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pmAddClick(Sender: TObject);
    procedure pmDeleteClick(
      Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ConditionToolBarFromDateEditPropertiesEditValueChanged(
      Sender: TObject);
    procedure pmEditClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);

  private
    DateButton: array[0..5] of array[0..6] of TTodoList;
    WeekCount : Integer;
    WorkTodoItem : TTodoItem;
    WorkTodoList : TTodoList;

    procedure SetScheduleWorkMode(aValue:Boolean=True);
    procedure TodoListDblClick(Sender: TObject);
  protected
    function DoSearch: Boolean; override;
  end;

var
  SystemScheduleForm: TSystemScheduleForm;



implementation

uses
  Common, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSystemScheduleForm.FormCreate(Sender: TObject);
var
  vRow, vCol: Integer;
begin
  inherited;
  HelpURL := 'BackOffice/시스템관리/일정관리/일정관리.htm';
  // 날짜 버튼을 만든다
  for vRow := Low(DateButton) to High(DateButton) do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
    begin
      DateButton[vRow, vCol] := TTodoList.Create(self);
      DateButton[vRow, vCol].Parent               := self;
      DateButton[vRow, vCol].HeaderFont.Name      := self.Font.Name;
      DateButton[vRow, vCol].HeaderFont.Size      := self.Font.Size;
      DateButton[vRow, vCol].Font.Name            := self.Font.Name;
      DateButton[vRow, vCol].Font.Size            := self.Font.Size;
      DateButton[vRow, vCol].Columns.Delete(2);
      DateButton[vRow, vCol].Columns.Delete(1);
      DateButton[vRow, vCol].HeaderActiveColor    := $0094E6FB;
      DateButton[vRow, vCol].HeaderActiveColorTo  := $001595EE;
      DateButton[vRow, vCol].HeaderColor          := $0094E6FB;
      DateButton[vRow, vCol].HeaderColorTo        := $001595EE;
      DateButton[vRow, vCol].ShowSelection        := True;
      DateButton[vRow, vCol].HeaderFont.Size      := 9;
      DateButton[vRow, vCol].HeaderHeight         := 20;
      DateButton[vRow, vCol].GridLines            := glsNone;
      DateButton[vRow, vCol].AutoInsertItem       := False;
      DateButton[vRow, vCol].AutoDeleteItem       := False;
//      DateButton[vRow, vCol].Columns[0].Alignment := taCenter;
      DateButton[vRow, vCol].Columns[0].Caption   := '';
      DateButton[vRow, vCol].Columns[0].TodoData  := tdProject;
      DateButton[vRow, vCol].Columns[0].Editable  := False;
      DateButton[vRow, vCol].Columns[0].Font.Name := self.Font.Name;
      DateButton[vRow, vCol].Columns[0].Font.Size := self.Font.Size;
      DateButton[vRow, vCol].PopupMenu            := PopupMenu;
      DateButton[vRow, vCol].OnDblClick           := TodoListDblClick
    end;
  WeekCount := High(DateButton);
end;

//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSystemScheduleForm.FormShow(Sender: TObject);
begin
  inherited;
//  DoSearch;
end;


procedure TSystemScheduleForm.pmAddClick(Sender: TObject);
begin
  inherited;
  WorkTodoList := TTodoList(PopupMenu.PopupComponent);
  SchedulePanel.Visible := True;
  SchedulePanel.BringToFront;
  ScheduleDateLabel.Caption := FormatDateTime('yyyy"년" m"월" ', ConditionToolBarFromDateEdit.Date)+IntToStr(WorkTodoList.Tag)+'일';
  SchedulePanel.Tag := 0; //추가
  SetScheduleWorkMode(True);
  TitletEdit.Clear;
  ScheduleMemo.Clear;
  TitletEdit.SetFocus;
end;

procedure TSystemScheduleForm.PopupMenuPopup(Sender: TObject);
var vTodoList : TTodoList;
begin
  inherited;
  vTodoList := TTodoList(PopupMenu.PopupComponent);
  pmDelete.Visible := vTodoList.Selected <> nil;
  pmEdit.Visible   := vTodoList.Selected <> nil;
end;

procedure TSystemScheduleForm.pmDeleteClick(
  Sender: TObject);
var vTodoList : TTodoList;
begin
  inherited;

  vTodoList := TTodoList(PopupMenu.PopupComponent);
  ExecQuery('delete from SL_SCHEDULE '
           +'      where CD_HEAD      =:P0 '
           +'        and CD_STORE     =:P1 '
           +'        and CD_SAWON     =:P2 '
           +'        and YMD_SCHEDULE =:P3 '
           +'        and NO_SCHEDULE  =:P4; ',
           [HeadStoreCode,
            StoreCode,
            UserCode,
            LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+FormatFloat('00',vTodoList.Tag),
            StrToInt(vTodoList.Selected.Subject)
            ]);
  vTodoList.Items.Delete(vTodoList.Selected.Index);
end;

procedure TSystemScheduleForm.pmEditClick(Sender: TObject);
begin
  inherited;
  WorkTodoList := TTodoList(PopupMenu.PopupComponent);
  if WorkTodoList.Selected.Subject = '' then Exit;

  SchedulePanel.Visible := True;
  SchedulePanel.BringToFront;
  ScheduleDateLabel.Caption := FormatDateTime('yyyy"년" m"월" ', ConditionToolBarFromDateEdit.Date)+IntToStr(WorkTodoList.Tag)+'일';
  SchedulePanel.Tag := StrToInt(WorkTodoList.Selected.Subject); //수정
  TitletEdit.Text   := WorkTodoList.Selected.Project;
  ScheduleMemo.Text := WorkTodoList.Selected.Resource;
  SetScheduleWorkMode(True);
  ScheduleMemo.SetFocus;
end;

//------------------------------------------------------------------------------
// 폼 크기를 변경할 때
procedure TSystemScheduleForm.FormResize(Sender: TObject);
var
  vRow, vCol, vWidth, vHeight, vTop: Integer;
begin
  inherited;

  // 제목 레이블 크기를 조정한다
  vWidth := (ClientWidth - 6 - 16) div 7;
  for vCol := 0 to ComponentCount-1 do
    if (Components[vCol] is TcxLabel) and (TcxLabel(Components[vCol]).Parent = self) then
    begin
      TcxLabel(Components[vCol]).Width := vWidth;
      TcxLabel(Components[vCol]).Left  := (TcxLabel(Components[vCol]).Tag - 1) * (vWidth + 2) + 3;
      TcxLabel(Components[vCol]).Top   := ToolBarDockPanel.Top + ToolBarDockPanel.Height + 3;
    end;

  // 날짜 버튼 크기를 조정한다
  vHeight := (ClientHeight - SunLabel.Top - SunLabel.Height - 6 - (WeekCount-1)*2) div WeekCount;
  vTop    := SunLabel.Top + SunLabel.Height - vHeight;
  if Assigned(DateButton[0, 0]) and (DateButton[0, 0] <> nil) then
  begin
    for vRow := Low(DateButton) to High(DateButton) do
      if DateButton[vRow, 0].Visible then
      begin
        Inc(vTop, vHeight + 2);
        for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
        begin
          DateButton[vRow, vCol].Width  := vWidth;
          DateButton[vRow, vCol].Left   := vCol * (vWidth + 2) + 3;
          DateButton[vRow, vCol].Height := vHeight;
          DateButton[vRow, vCol].Top    := vTop;
        end;
      end;
  end;

  SchedulePanel.Left := Trunc(Self.Width / 2 - SchedulePanel.Width / 2);
  SchedulePanel.Top  := Trunc(Self.Height / 2 - SchedulePanel.Height / 2);
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TSystemScheduleForm.FormDestroy(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TSystemScheduleForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  SchedulePanel.Visible := False;
  SetScheduleWorkMode(False);
end;

procedure TSystemScheduleForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

procedure TSystemScheduleForm.ConditionToolBarFromDateEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  DoSearch;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSystemScheduleForm.DoSearch: Boolean;
var
  vStartWeekDay, vLastMonthEndDay, vThisMonthEndDay, vThisMonthStartWeekday, vThisMonthEndWeekday: Integer;
  vRow, vCol: Integer;
  vIndex    : Integer;
  vButton   : TTodoList;
  vTodoItem : TTodoItem;
  vStartMonthDate :TDateTime;
  vTextCount : Integer;
  vSQL :String;
begin
  vTextCount := DateButton[0, 0].Width div 6 - (DateButton[0, 0].Width div 20);
  if vTextCount <= 0 then
    vTextCount := 10;

  // 지난 달의 말일을 구한다
  vLastMonthEndDay       := DayOf(EndOfTheMonth(IncMonth(ConditionToolBarFromDateEdit.Date, -1)));
  // 이번 달의 말일을 구한다
  vThisMonthEndDay       := DayOf(EndOfTheMonth(ConditionToolBarFromDateEdit.Date));
  // 첫주의 첫번째 날(일)을 구한다
  if DayOfTheWeek(StartOfTheMonth(ConditionToolBarFromDateEdit.Date)) = 1 then // 이번달 첫날이 월요일이면 무조건 전달 마지막날
    vStartWeekDay          := vLastMonthEndDay
  else // 이번달 첫날이 월요일이 아니면 그 주의 첫날-1 (델파이가 첫날을 일요일이 아닌 월요일로 구하므로)
    vStartWeekDay          := DayOf(StartOfTheWeek(StartOfTheMonth(ConditionToolBarFromDateEdit.Date) + IfThen(DayOfTheWeek(StartOfTheMonth(ConditionToolBarFromDateEdit.Date)) = 7, 1, 0))) - 1;
  // 이번 달의 첫날 요일을 구한다
  vThisMonthStartWeekday := IfThen(DayOfTheWeek(StartOfTheMonth(ConditionToolBarFromDateEdit.Date)) = 7, 0, DayOfTheWeek(StartOfTheMonth(ConditionToolBarFromDateEdit.Date)));
  // 이번 달의 마지막날 요일을 구한다
  vThisMonthEndWeekday   := IfThen(DayOfTheWeek(EndOfTheMonth(ConditionToolBarFromDateEdit.Date)) = 7, 0, DayOfTheWeek(EndOfTheMonth(ConditionToolBarFromDateEdit.Date)));

  // 날짜 버튼에 날짜를 표시한다
  for vRow := Low(DateButton) to High(DateButton) do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
    begin
      DateButton[vRow, vCol].Visible := true;
      DateButton[vRow, vCol].Color   := clWhite;
      DateButton[vRow, vCol].Items.Clear;
      // 지난달 뒷날짜 표시(이번달 1일이 화요일일 경우 일,월요일에 해당하는 이전달 날짜 표시)
      if (vRow = 0) and (vStartWeekDay > 1) and (vStartWeekDay+vCol <= vLastMonthEndDay) then
      begin
        DateButton[vRow, vCol].Enabled                     := False;
        DateButton[vRow, vCol].Columns.Items[0].Caption    := ' '+IntToStr(vStartWeekDay+vCol);
        DateButton[vRow, vCol].Columns.Items[0].Font.Color := clGray;
        DateButton[vRow, vCol].HeaderActiveColor           := $00EAEAEA;
        DateButton[vRow, vCol].HeaderActiveColorTo         := $00EAEAEA;
        DateButton[vRow, vCol].HeaderColor                 := $00EAEAEA;
        DateButton[vRow, vCol].HeaderColorTo               := $00EAEAEA;
        DateButton[vRow, vCol].PopupMenu                   := nil;
        DateButton[vRow, vCol].Tag                         := 0;
      end
      // 이번달 날짜들 표시
      else if vRow*7+vCol+1-vThisMonthStartWeekday <= vThisMonthEndDay then
      begin
        DateButton[vRow, vCol].Enabled                  := True;
        DateButton[vRow, vCol].Columns.Items[0].Caption := ' '+IntToStr(vRow*7+vCol+1-vThisMonthStartWeekday);
        DateButton[vRow, vCol].HeaderActiveColor        := $00FFEEE1;
        DateButton[vRow, vCol].HeaderActiveColorTo      := $00FFC79D;
        DateButton[vRow, vCol].HeaderColor              := $00FFEEE1;
        DateButton[vRow, vCol].HeaderColorTo            := $00FFC79D;
        DateButton[vRow, vCol].PopupMenu                := PopupMenu;
        DateButton[vRow, vCol].Tag                      := vRow*7+vCol+1-vThisMonthStartWeekday;

        // 날짜가 조회 날짜면 색깔을 바꾼다
        if DateButton[vRow, vCol].Tag = StrToInt(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2)) then
          DateButton[vRow, vCol].Color        := clGradientActiveCaption;
      end
      // 화면을 벗어나는 버튼 숨기기(이번달이 총 4주일 경우 5, 6주에 해당하는 버튼 숨기기)
      else if (vCol-vThisMonthEndWeekday <= 0) or (not DateButton[vRow, 0].Visible) then
      begin
        DateButton[vRow, vCol].Visible             := false;
      end
      // 다음달 시작날짜 표시(이번달 말일이 목요일일 경우 금,토요일에 해당하는 다음날 날짜 표시)
      else
      begin
        DateButton[vRow, vCol].Enabled                     := False;
        DateButton[vRow, vCol].Columns.Items[0].Caption    := ' '+IntToStr(vCol-vThisMonthEndWeekday);
        DateButton[vRow, vCol].Columns.Items[0].Font.Color := clGray;
        DateButton[vRow, vCol].HeaderActiveColor           := $00EAEAEA;
        DateButton[vRow, vCol].HeaderActiveColorTo         := $00EAEAEA;
        DateButton[vRow, vCol].HeaderColor                 := $00EAEAEA;
        DateButton[vRow, vCol].HeaderColorTo               := $00EAEAEA;
        DateButton[vRow, vCol].PopupMenu                   := nil;
        DateButton[vRow, vCol].Tag                         := 0;
      end;
    end;

  ExecQuery('delete from DateDummyTable '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1; ',
           [HeadStoreCode,
            StoreCode],false);

  vStartMonthDate := StartOfTheMonth(ConditionToolBarFromDateEdit.Date);

  vSQL := '';
  for vIndex := 0 to vThisMonthEndDay do
    vSQL := vSQL + Format('(''%s'',''%s'',%d, ''%s''),',[HeadStoreCode, StoreCode, vIndex, FormatDateTime(fmtDateShort, IncDay(vStartMonthDate,vIndex))]);

  vSQL := LeftStr(vSQL, Length(vSQL)-1);

  vSQL := 'insert into DateDummyTable (CD_HEAD, CD_STORE, IDX, DummyDate) values '+vSQL+';';
  ExecQuery(TempSQL+vSQL,[],true);

  // 일정을 조회한다
  OpenQuery('select a.DummyDate, '
           +'  		  Ifnull(b.NO_SCHEDULE,'''') as NO_SCHEDULE, '
           +'  		  b.TITLE_SCHEDULE, '
           +'  		  b.TXT_SCHEDULE, '
           +'       Ifnull(d.CNT_BOOKING,0) as CNT_BOOKING, '
           +'  		  Ifnull(c.CNT_BIRTH,0)   as CNT_BIRTH, '
           +Ifthen(GetOption(222) = '0', '  Ifnull(e.AMT_SALE,0) ', '0 ')+ ' as AMT_SALE '
           +'	 from DateDummyTable a left outer join '
           +'  	    SL_SCHEDULE    b on b.CD_HEAD =a.CD_HEAD and b.CD_STORE  =a.CD_STORE and b.CD_SAWON =:P2 and a.DummyDate = b.YMD_SCHEDULE left outer join '
           +'  	    (select t1.YMD_BIRTH, '
           +'  			        Count(*) as CNT_BIRTH '
           +'  		     from (select case when a.yn_lunar = ''Y'' then b.Solar_Date else a.ymd_birth end YMD_BIRTH '
           +'  				         from MS_MEMBER a left outer join '
           +'  					            LUNARTOSOLAR b on b.Lunar_Date = a.YMD_BIRTH '
           +'  				        where CD_HEAD  =:P0 '
           +'                   and CD_STORE =:P1) t1 '
           +'         where substring(t1.YMD_BIRTH,5,4) between substring(:P2,5,4) and substring(:P3,5,4) '
           +'         group by t1.YMD_BIRTH ) c on a.DummyDate = c.ymd_birth left outer join '
           +'       (select Date_Format(DT_BOOKING, ''%Y%m%d'') as YMD_BOOKING, '
           +'               count(*) as CNT_BOOKING '
           +'          from SL_BOOKING '
           +'         where CD_HEAD  =:P0 '
           +'           and CD_STORE =:P1 '
           +'           and YN_SALE = ''N'' '
           +'         group by Date_Format(DT_BOOKING, ''%Y%m%d'') ) as d on a.DummyDate = d.YMD_BOOKING  '
           +Ifthen(GetOption(222) = '0', 'left outer join '
           +'  	  	(select YMD_SALE, '
           +'               sum(AMT_SALE) as AMT_SALE '
           +'          from SL_SALE_H_SUM '
           +'         where CD_HEAD  =:P0 '
           +'           and CD_STORE =:P1 '
           +'           and YMD_SALE between :P3 and :P4 '
           +'         group by YMD_SALE ) as e on a.DummyDate = e.YMD_SALE ','')
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +' order by a.DummyDate ',
            [HeadStoreCode,
             StoreCode,
             UserCode,
             DtoS(StartOfTheMonth(ConditionToolBarFromDateEdit.Date)),
             DtoS(EndOfTheMonth(ConditionToolBarFromDateEdit.Date))]);

  try
    while not Query.Eof do
    begin
      // 날짜에 해당하는 버튼을 찾는다
      vButton := nil;
      for vRow := Low(DateButton) to High(DateButton) do
      begin
        if vButton <> nil then
          Break;
        for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
          if DateButton[vRow, vCol].Tag  = StrToInt(RightStr(Query.Fields[0].AsString,2)) then
          begin
            vButton := DateButton[vRow, vCol];
            break;
          end;
      end;
      if (vButton <> nil) and (LeftStr(Query.Fields[0].AsString,6) = LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)) then
      begin
        if (Query.Fields[6].AsInteger <> 0) and (GetOption(222) = '0') then
        begin
          vTodoItem := TTodoItem.Create(vButton.Items);
          vTodoItem.Subject := '';
          vTodoItem.Project := ' 매출'+LPad(FormatFloat(fmtComma, Query.Fields[6].AsInteger), vTextCount)+' 원';
        end;
        if StoI(Query.Fields[4].AsString) > 0 then
        begin
          vTodoItem := TTodoItem.Create(vButton.Items);
          vTodoItem.Subject := '';
          vTodoItem.Project := ' 예약'+LPad(FormatFloat(fmtComma, StoI(Query.Fields[4].AsString)), vTextCount)+' 명';
        end;
        if StoI(Query.Fields[5].AsString) > 0 then
        begin
          vTodoItem := TTodoItem.Create(vButton.Items);
          vTodoItem.Subject := '';
          vTodoItem.Project := ' 생일'+LPad(FormatFloat(fmtComma, StoI(Query.Fields[5].AsString)), vTextCount)+' 명';
        end;
        if Query.Fields[1].AsString <> '' then
        begin
          vTodoItem := TTodoItem.Create(vButton.Items);
          vTodoItem.Subject := Query.Fields[1].AsString;    //번호
          vTodoItem.Project := ' ['+Query.Fields[2].AsString+']';    //타이틀
          vTodoItem.Resource:= Query.Fields[3].AsString;    //일정내용
        end;
      end;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  WeekCount := IfThen(not DateButton[5, 0].Visible, 5, 6);
  FormResize(self);

  Result := true;
end;
procedure TSystemScheduleForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 버튼에 매출 내용 표시
procedure TSystemScheduleForm.SaveButtonClick(Sender: TObject);
var vMaxSeq :Integer;
begin
  inherited;
  if Trim(TitletEdit.Text) = '' then
  begin
    ErrBox('일정제목을 입력하십시오.');
    TitletEdit.SetFocus;
    Exit;
  end;


  //신규일정일때
  if SchedulePanel.Tag = 0 then
  begin
    WorkTodoItem := TTodoItem.Create(WorkTodoList.Items);
    WorkTodoItem.Project  := TitletEdit.Text;
    WorkTodoItem.Resource := ScheduleMemo.Text;
    SchedulePanel.Visible := False;
    SetScheduleWorkMode(False);

    try
      OpenQuery('select Ifnull(max(NO_SCHEDULE),0)+1 '
               +'  from SL_SCHEDULE '
               +' where CD_HEAD      =:P0'
               +'   and CD_STORE     =:P1 '
               +'   and CD_SAWON     =:P2 '
               +'   and YMD_SCHEDULE =:P3 ',
               [HeadStoreCode,
                StoreCode,
                UserCode,
                LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+FormatFloat('00',WorkTodoList.Tag)]);
      vMaxSeq := Query.Fields[0].AsInteger;
    finally
      FinishQuery;
    end;

    ExecQuery('insert into SL_SCHEDULE(CD_HEAD, '
             +'                        CD_STORE, '
             +'                        CD_SAWON, '
             +'                        YMD_SCHEDULE, '
             +'                        NO_SCHEDULE, '
             +'                        TITLE_SCHEDULE, '
             +'                        TXT_SCHEDULE, '
             +'                        DT_INSERT) '
             +'                 VALUES(:P0, :P1, :P2, :P3, :P4, :P5, :P6, Now()); ',
             [HeadStoreCode,
              StoreCode,
              UserCode,
              LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+FormatFloat('00',WorkTodoList.Tag),
              vMaxSeq,
              TitletEdit.Text,
              ScheduleMemo.Text
              ]);
    WorkTodoItem.Subject := IntToStr(vMaxSeq);
  end
  //수정일때
  else
  begin
    WorkTodoList.Selected.Project  := TitletEdit.Text;
    WorkTodoList.Selected.Resource := ScheduleMemo.Text;
    SchedulePanel.Visible := False;
    SetScheduleWorkMode(False);
    ExecQuery('update SL_SCHEDULE '
             +'   set TITLE_SCHEDULE =:P5, '
             +'       TXT_SCHEDULE   =:P6, '
             +'       DT_INSERT      =Now() '
             +' where CD_HEAD      =:P0 '
             +'   and CD_STORE     =:P1 '
             +'   and CD_SAWON     =:P2 '
             +'   and YMD_SCHEDULE =:P3 '
             +'   and NO_SCHEDULE  =:P4;',
             [HeadStoreCode,
              StoreCode,
              UserCode,
              LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+FormatFloat('00',WorkTodoList.Tag),
              SchedulePanel.Tag,
              TitletEdit.Text,
              ScheduleMemo.Text
              ]);
  end;
end;

procedure TSystemScheduleForm.SetScheduleWorkMode(aValue: Boolean);
var
  vRow, vCol: Integer;
begin
  ConditionToolBar.Enabled := not aValue;
  ButtonToolBar.Enabled    := not aValue;

  for vRow := Low(DateButton) to High(DateButton) do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
      DateButton[vRow, vCol].Enabled := not aValue;
end;


procedure TSystemScheduleForm.TodoListDblClick(Sender: TObject);
begin
  if (Sender as  TTodoList).Selected <> nil then
  begin
    PopupMenu.PopupComponent := (Sender as  TTodoList);
    pmEditClick(nil);
  end;
end;

end.
