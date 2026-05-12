// 캘린더 매출 조회 (완료)

unit HeadSaleCalendarShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, ExtCtrls, cxContainer, cxEdit, Uni,
  DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, Math,
  cxCalendar, AdvGlowButton, AdvToolBar, DateUtils, StrUtils, AdvToolBarStylers,
  cxCheckBox, Menus, cxStyles, cxLookAndFeels, cxLookAndFeelPainters,
  DBAccess, cxClasses, PosButton, cxImage, frxPreview, JPEG, Vcl.ComCtrls,
  dxCore, cxDateUtils, frxClass, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  THeadSaleCalendarShowForm = class(TInheritEditForm)
    ReportPanel: TPanel;
    Sun2Label: TcxLabel;
    Mon2Label: TcxLabel;
    Tue2Label: TcxLabel;
    Wed2Label: TcxLabel;
    Thu2Label: TcxLabel;
    Fri2Label: TcxLabel;
    Sat2Label: TcxLabel;
    Sum2Label: TcxLabel;
    SunLabel: TcxLabel;
    MonLabel: TcxLabel;
    TueLabel: TcxLabel;
    WedLabel: TcxLabel;
    ThuLabel: TcxLabel;
    FriLabel: TcxLabel;
    SatLabel: TcxLabel;
    SumLabel: TcxLabel;
    FastReport: TfrxReport;
    FastReportDataSet: TfrxUserDataSet;
    ButtonToolBarPrintButton: TAdvGlowMenuButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarPrintButtonClick(Sender: TObject);

  private
    DateButton: array[0..6] of array[0..7] of TPosButton;
    ReportButton: array[0..6] of array[0..7] of TPosButton;
    WeekCount : Integer;

    procedure ShowText;
    procedure ButtonDblClick(Sender: TObject);

  protected
    function DoSearch: Boolean; override;
  end;

var
  HeadSaleCalendarShowForm: THeadSaleCalendarShowForm;



implementation

uses
  Common, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure THeadSaleCalendarShowForm.FormCreate(Sender: TObject);
var
  vRow, vCol: Integer;
begin
  inherited;
  // 날짜 버튼을 만든다
  for vRow := Low(DateButton) to High(DateButton) do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
    begin
      DateButton[vRow, vCol] := TPosButton.Create(self);
      DateButton[vRow, vCol].Parent             := self;
      DateButton[vRow, vCol].Number.Font.Name   := '맑은 고딕';
      DateButton[vRow, vCol].Number.Font.Size   := 10;
      DateButton[vRow, vCol].Number.Font.Style  := [fsBold];
      DateButton[vRow, vCol].Menu.Font.Name     := '맑은 고딕';
      DateButton[vRow, vCol].Menu.Font.Size     := 9;
      DateButton[vRow, vCol].Amount.Font.Size   := 1;
      DateButton[vRow, vCol].Color              := IfThen((vCol = 7) and (vRow = 6), $00FFD277, IfThen((vCol = 7) or (vRow = 6), $00FFE7B3, clWhite));
      DateButton[vRow, vCol].Bottom.Font.Name   := '맑은 고딕';
      DateButton[vRow, vCol].Bottom.Font.Size   := 9;
      DateButton[vRow, vCol].BorderColor        := clBlack;
      DateButton[vRow, vCol].BorderStyle        := pbsSingle;
    end;

  // 출력용 날짜 버튼을 만든다
  for vRow := Low(ReportButton) to High(ReportButton) do
    for vCol := Low(ReportButton[vRow]) to High(ReportButton[vRow]) do
    begin
      ReportButton[vRow, vCol] := TPosButton.Create(self);
      ReportButton[vRow, vCol].Parent             := ReportPanel;
      ReportButton[vRow, vCol].Number.Font.Name   := '맑은 고딕';
      ReportButton[vRow, vCol].Number.Font.Size   := 8;
      ReportButton[vRow, vCol].Number.Font.Style  := [fsBold];
      ReportButton[vRow, vCol].Menu.Font.Name     := '맑은 고딕';
      ReportButton[vRow, vCol].Menu.Font.Size     := 8;
      ReportButton[vRow, vCol].Amount.Font.Size   := 1;
      ReportButton[vRow, vCol].Color              := IfThen((vCol = 7) and (vRow = 6), $00FFD277, IfThen((vCol = 7) or (vRow = 6), $00FFE7B3, clWhite));
      ReportButton[vRow, vCol].Bottom.Font.Name   := '맑은 고딕';
      ReportButton[vRow, vCol].Bottom.Font.Size   := 8;
      ReportButton[vRow, vCol].BorderColor        := clBlack;
      ReportButton[vRow, vCol].BorderStyle        := pbsSingle;
    end;

  WeekCount := High(DateButton)+1;
end;

procedure THeadSaleCalendarShowForm.ButtonDblClick(Sender: TObject);
begin
  inherited;
  //영업일보 실행
  if FormParam[0]<>'00000000' then
  begin
    FormParam[0] := TPosButton(Sender).Temp8;
    ExtremeMainForm.RunProgram('CloseReportShow');
  end;
end;

//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure THeadSaleCalendarShowForm.FormShow(Sender: TObject);
begin
  inherited;

  // 조회 날짜 조건을 불러온다

//  ButtonToolBarSearchButton.Click;
end;

//------------------------------------------------------------------------------
// 폼 크기를 변경할 때
procedure THeadSaleCalendarShowForm.FormResize(Sender: TObject);
var
  vRow, vCol, vWidth, vHeight, vTop: Integer;
begin
  inherited;

  // 제목 레이블 크기를 조정한다
  vWidth := (ClientWidth - 6 - 16) div 8;
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
          DateButton[vRow, vCol].Number.Height := Trunc(vHeight * 0.15);
          DateButton[vRow, vCol].Width         := vWidth;
          DateButton[vRow, vCol].Left          := vCol * (vWidth + 2) + 3;
          DateButton[vRow, vCol].Height        := vHeight;
          DateButton[vRow, vCol].Top           := vTop;
          DateButton[vRow, vCol].Bottom.Height := Trunc(vHeight * 0.15);
        end;
      end;
    // 매출 내용을 다시 표시한다
    ShowText;
  end;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure THeadSaleCalendarShowForm.FormDestroy(Sender: TObject);
var
  vRow, vCol: Integer;
begin
  // 날짜 버튼을 없앤다
  for vRow := High(DateButton) downto Low(DateButton) do
    for vCol := High(DateButton[vRow]) downto Low(DateButton[vRow]) do
    begin
      DateButton[vRow, vCol].Free;
      DateButton[vRow, vCol] := nil;
    end;

  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure THeadSaleCalendarShowForm.ButtonToolBarPrintButtonClick(Sender: TObject);
  function Control2Bitmap(Control_: TWinControl): TBitmap;
  begin
    Result := TBitmap.Create;
    with Result do begin
      Height := Control_.Height;
      Width  := Control_.Width;
      Canvas.Handle := CreateDC(nil, nil, nil, nil);
      Canvas.Lock;
      Control_.PaintTo(Canvas.Handle, 0, 0);
      Canvas.Unlock;
      DeleteDC(Canvas.Handle);
    end;
  end;
var
  vJPG     : TJPEGImage;
  vScreenBmp: TBitmap;
  vSaveBmp: TBitmap;
  vScreenHandle: THandle;
  vImage  :TImage;
  vRow, vCol, vWidth, vHeight, vTop: Integer;
  vPicture: TfrxPictureView;
  vMemo: TfrxMemoView;
begin
  inherited;
  for vRow := Low(ReportButton) to High(ReportButton)-1 do
    for vCol := Low(ReportButton[vRow]) to High(ReportButton[vRow])-1 do
      ReportButton[vRow, vCol].Visible := false;

  for vRow := Low(DateButton) to High(DateButton)-1 do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow])-1 do
      ReportButton[vRow, vCol].Visible := DateButton[vRow, vCol].Visible;

  // 제목 레이블 크기를 조정한다
  vWidth := (ReportPanel.Width - 6 - 16) div 8;
  for vCol := 0 to ComponentCount-1 do
    if (Components[vCol] is TcxLabel) and (TcxLabel(Components[vCol]).Parent = ReportPanel) then
    begin
      TcxLabel(Components[vCol]).Width := vWidth;
      TcxLabel(Components[vCol]).Left  := (TcxLabel(Components[vCol]).Tag - 1) * (vWidth + 2) + 3;
      TcxLabel(Components[vCol]).Top   := 3;
    end;

  // 날짜 버튼 크기를 조정한다
  vHeight := (ReportPanel.Height - Sun2Label.Top - Sun2Label.Height - 6 - (WeekCount-1)*2) div WeekCount;
  vTop    := Sun2Label.Top + Sun2Label.Height - vHeight;
  if Assigned(ReportButton[0, 0]) and (ReportButton[0, 0] <> nil) then
  begin
    for vRow := Low(ReportButton) to High(ReportButton) do
      if ReportButton[vRow, 0].Visible then
      begin
        Inc(vTop, vHeight + 2);
        for vCol := Low(ReportButton[vRow]) to High(ReportButton[vRow]) do
        begin
          ReportButton[vRow, vCol].Number.Height := Trunc(vHeight * 0.15);
          ReportButton[vRow, vCol].Width         := vWidth;
          ReportButton[vRow, vCol].Left          := vCol * (vWidth + 2) + 3;
          ReportButton[vRow, vCol].Height        := vHeight;
          ReportButton[vRow, vCol].Top           := vTop;
          ReportButton[vRow, vCol].Bottom.Height := Trunc(vHeight * 0.15);
        end;
      end;

    for vRow := Low(DateButton) to High(DateButton) do
      for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
      begin
        ReportButton[vRow, vCol].Visible             := DateButton[vRow, vCol].Visible;
        ReportButton[vRow, vCol].Number.NumberString := DateButton[vRow, vCol].Number.NumberString;
        ReportButton[vRow, vCol].Number.RightString  := DateButton[vRow, vCol].Number.RightString;
        ReportButton[vRow, vCol].Menu.Name           := DateButton[vRow, vCol].Menu.Name;
        ReportButton[vRow, vCol].Menu.Qty            := DateButton[vRow, vCol].Menu.Qty;
        ReportButton[vRow, vCol].Bottom.LeftString   := DateButton[vRow, vCol].Bottom.LeftString;
        ReportButton[vRow, vCol].Bottom.RightString  := DateButton[vRow, vCol].Bottom.RightString;
        ReportButton[vRow, vCol].Color               := DateButton[vRow, vCol].Color;
        ReportButton[vRow, vCol].Menu.Qty            := DateButton[vRow, vCol].Menu.Qty;
        ReportButton[vRow, vCol].Bottom.Height       := Trunc(vHeight * 0.15);
      end;

    // 매출 내용을 다시 표시한다
//    ShowText;
  end;
  try
    vImage := TImage.Create(nil);
    vScreenBmp := TBitmap.Create;
    vScreenBmp := Control2Bitmap(ReportPanel);

    vJPG     := TJPEGImage.Create;
    vImage.Picture.Bitmap.Assign(vScreenBmp);
    vJPG.Assign(vImage.Picture.Graphic);
    vJPG.SaveToFile(Folder+'CalenderForm.jpg');

    vMemo  := TfrxMemoView(FastReport.FindObject('MonthMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := FormatDateTime('yyyy년 mm월 캘린더매출',ConditionToolBarFromDateEdit.Date);

    vMemo  := TfrxMemoView(FastReport.FindObject('CompanyNameMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := HeadStoreName;

    vPicture := TfrxPictureView(FastReport.FindObject('CalenderPicture'));
    if Assigned(vPicture) then
      vPicture.Picture.Assign(vJPG);

    FastReport.Tag := 0;
    FastReport.PrepareReport(false);
    FastReport.ShowReport;
  finally
    vImage.Free;
    vScreenBmp.Free;
    vJPG.Free;
  end;

end;

procedure THeadSaleCalendarShowForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function THeadSaleCalendarShowForm.DoSearch: Boolean;
var
  vStartWeekDay, vLastMonthEndDay, vThisMonthEndDay, vThisMonthStartWeekday, vThisMonthEndWeekday: Integer;
  vRow, vCol: Integer;
  vMaxSaleAmt, vMinSaleAmt: Currency;
  vButton, vMaxButton, vMinButton: TPosButton;
begin
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
  for vRow := Low(DateButton) to High(DateButton)-1 do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow])-1 do
    begin
      DateButton[vRow, vCol].Visible             := true;
      DateButton[vRow, vCol].Color               := clWhite;
      DateButton[vRow, vCol].Temp1               := EmptyStr;
      DateButton[vRow, vCol].Temp2               := EmptyStr;
      DateButton[vRow, vCol].Temp3               := EmptyStr;
      DateButton[vRow, vCol].Temp4               := EmptyStr;
      DateButton[vRow, vCol].Temp5               := EmptyStr;
      DateButton[vRow, vCol].Temp6               := EmptyStr;
      DateButton[vRow, vCol].Temp7               := EmptyStr;
      DateButton[vRow, vCol].Temp8               := EmptyStr;
      DateButton[vRow, vCol].Temp9               := EmptyStr;
      DateButton[vRow, vCol].Number.CenterString := EmptyStr;
      DateButton[vRow, vCol].Number.RightString  := EmptyStr;
      DateButton[vRow, vCol].Number.ShowNumber   := true;

      // 지난달 뒷날짜 표시(이번달 1일이 화요일일 경우 일,월요일에 해당하는 이전달 날짜 표시)
      if (vRow = 0) and (vStartWeekDay > 1) and (vStartWeekDay+vCol <= vLastMonthEndDay) then
      begin
        DateButton[vRow, vCol].Number.Number       := vStartWeekDay+vCol;
        DateButton[vRow, vCol].Number.Font.Color   := clGray;
        DateButton[vRow, vCol].Menu.Font.Color     := clGray;
        DateButton[vRow, vCol].Hint                := Copy(DtoS(IncMonth(ConditionToolBarFromDateEdit.Date,-1)),1,6) + FormatFloat('00', DateButton[vRow, vCol].Number.Number);
      end
      // 이번달 날짜들 표시
      else if vRow*7+vCol+1-vThisMonthStartWeekday <= vThisMonthEndDay then
      begin
        DateButton[vRow, vCol].Number.Number       := vRow*7+vCol+1-vThisMonthStartWeekday;
        DateButton[vRow, vCol].Number.Font.Color   := IfThen(vCol = 0, clRed, IfThen(vCol = 6, clBlue, clBlack));
        DateButton[vRow, vCol].Menu.Font.Color     := clBlack;
        DateButton[vRow, vCol].Hint                := Copy(DtoS(ConditionToolBarFromDateEdit.Date),1,6) + FormatFloat('00', DateButton[vRow, vCol].Number.Number);

        // 날짜가 조회 날짜면 색깔을 바꾼다
        if DateButton[vRow, vCol].Hint = DtoS(ConditionToolBarFromDateEdit.Date) then
          DateButton[vRow, vCol].Color        := $00CAF3BC;
      end
      // 화면을 벗어나는 버튼 숨기기(이번달이 총 4주일 경우 5, 6주에 해당하는 버튼 숨기기)
      else if (vCol-vThisMonthEndWeekday <= 0) or (not DateButton[vRow, 0].Visible) then
      begin
        DateButton[vRow, vCol].Visible             := false;
        DateButton[vRow, vCol].Hint                := EmptyStr;
      end
      // 다음달 시작날짜 표시(이번달 말일이 목요일일 경우 금,토요일에 해당하는 다음날 날짜 표시)
      else
      begin
        DateButton[vRow, vCol].Number.Number       := vCol-vThisMonthEndWeekday;
        DateButton[vRow, vCol].Number.Font.Color   := clGray;
        DateButton[vRow, vCol].Menu.Font.Color     := clGray;
        DateButton[vRow, vCol].Hint                := Copy(DtoS(IncMonth(ConditionToolBarFromDateEdit.Date,1)),1,6) + FormatFloat('00', DateButton[vRow, vCol].Number.Number);
      end;
    end;
  DateButton[4, 7].Visible := DateButton[4, 0].Visible;
  DateButton[5, 7].Visible := DateButton[5, 0].Visible;
  WeekCount := IfThen(not DateButton[4, 0].Visible, 5, IfThen(not DateButton[5, 0].Visible, 6, 7));
  FormResize(self);


  // 매출을 조회한다
  OpenQuery('select a.YMD_SALE, '
           +'       a.DAY, '
           +'       a.CNT_PERSON, '
           +'       a.AMT_SALE, '
           +'       a.AMT_CASH, '
           +'       a.AMT_CARD, '
           +'       a.AMT_AVG, '
           +'       Ifnull(b.AMT_ACCT,0) as AMT_ACCT,  '
           +'       a.STORE_COUNT, '
           +'       a.AMT_DELIVERY '
           +'  from (select a.YMD_SALE, '
           +'               SUBSTRING(a.YMD_SALE,7,2) as DAY, '
           +'               SUM(Ifnull(a.CNT_CUSTOMER,1)) as CNT_PERSON, '
           +'               Count(a.CD_STORE) as STORE_COUNT, '
           +'               IFNULL(SUM(a.AMT_SALE),0) as AMT_SALE, '
           +'               IFNULL(SUM(a.AMT_DELIVERY),0) as AMT_DELIVERY, '
           +'               AVG(a.AMT_SALE) as AMT_AVG, '
           +'               IFNULL(SUM(a.AMT_CASH+a.AMT_CHECK+a.AMT_BANK),0) as AMT_CASH, '
           +'               IFNULL(SUM(a.AMT_CARD),0) as AMT_CARD '
           +'          from SL_SALE_H_SUM a '
           +'         where a.CD_HEAD  = :P0 '
           +'           and a.YMD_SALE between :P1 and :P2 '
           +'        group by a.YMD_SALE ) as a left outer join '
           +'       (select YMD_OCCUR, '
           +'               IFNULL(SUM(AMT_PAYIN-AMT_OUT),0) as AMT_ACCT '
           +'          from SL_ACCT '
           +'         where CD_HEAD  = :P0 '
           +'           and DS_ACCT = ''0'' '
           +'           and YMD_OCCUR between :P1 and :P2 '
           +'         group by YMD_OCCUR '
           +'       ) b on a.YMD_SALE = b.YMD_OCCUR '
           +'order by 1 ',
            [HeadStoreCode,
             Copy(DtoS(IncMonth(ConditionToolBarFromDateEdit.CurrentDate,-1)),1,6)+'23',
             Copy(DtoS(IncMonth(ConditionToolBarFromDateEdit.CurrentDate   )),1,6)+'06']);
  try
    vMaxSaleAmt := 0;
    vMinSaleAmt := 0;
    vMaxButton  := nil;
    vMinButton  := nil;

    while not Query.Eof do
    begin
      // 날짜에 해당하는 버튼을 찾는다
      vButton := nil;
      for vRow := Low(DateButton) to High(DateButton)-1 do
        for vCol := Low(DateButton[vRow]) to High(DateButton[vRow])-1 do
          if DateButton[vRow, vCol].Hint = Query.Fields[0].AsString then
          begin
            vButton := DateButton[vRow, vCol];
            vButton.OnDblClick := ButtonDblClick;
            vButton.Temp8 := vButton.Hint;
            break;
          end;
      if vButton <> nil then
      begin
        // 최대 최소 매출 날짜를 구한다
        if vMaxSaleAmt < Query.Fields[3].AsCurrency then
        begin
          vMaxSaleAmt := Query.Fields[3].AsCurrency;
          vMaxButton  := vButton;
        end;
        if vMinSaleAmt > Query.Fields[3].AsCurrency then
        begin
          vMinSaleAmt := Query.Fields[3].AsCurrency;
          vMinButton  := vButton;
        end;

        // 각 날짜별 매출을 구한다
        vButton.Temp1 := Query.Fields[2].AsString;
        vButton.Temp2 := Query.Fields[3].AsString;
        vButton.Temp3 := Query.Fields[4].AsString;
        vButton.Temp4 := Query.Fields[5].AsString;
        vButton.Temp5 := Query.Fields[6].AsString;
        vButton.Temp6 := Query.Fields[7].AsString;
        vButton.Temp8 := Query.Fields[8].AsString;
        vButton.Temp9 := Query.Fields[9].AsString;
      end;
      Query.Next;
    end;

    // 최대 최소 매출 날짜에 표시를 한다
    if vMaxButton <> nil then
      vMaxButton.Number.CenterString := '▲';
    if vMinButton <> nil then
      vMinButton.Number.CenterString := '▼';
  finally
    FinishQuery;
  end;

  // 주, 요일 합계를 구한다
  for vRow := Low(DateButton) to High(DateButton)-1 do
  begin
    DateButton[vRow, High(DateButton[vRow])].Temp1 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp2 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp3 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp4 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp5 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp6 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp7 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp8 := EmptyStr;
    DateButton[vRow, High(DateButton[vRow])].Temp9 := EmptyStr;
  end;

  for vCol := Low(DateButton[0]) to High(DateButton[0]) do
  begin
    DateButton[High(DateButton), vCol].Temp1       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp2       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp3       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp4       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp5       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp6       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp7       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp8       := EmptyStr;
    DateButton[High(DateButton), vCol].Temp9       := EmptyStr;
  end;

  for vRow := Low(DateButton) to High(DateButton)-1 do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow])-1 do
    begin
      if Copy(DtoS(ConditionToolBarFromDateEdit.CurrentDate),1,6) = LeftStr(DateButton[vRow, vCol].Hint,6) then
      begin
        DateButton[vRow, High(DateButton[vRow])].Temp1 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp1) + StoF(DateButton[vRow, vCol].Temp1));
        DateButton[vRow, High(DateButton[vRow])].Temp2 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp2) + StoF(DateButton[vRow, vCol].Temp2));
        DateButton[vRow, High(DateButton[vRow])].Temp3 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp3) + StoF(DateButton[vRow, vCol].Temp3));
        DateButton[vRow, High(DateButton[vRow])].Temp4 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp4) + StoF(DateButton[vRow, vCol].Temp4));
        DateButton[vRow, High(DateButton[vRow])].Temp5 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp5) + StoF(DateButton[vRow, vCol].Temp5));
        DateButton[vRow, High(DateButton[vRow])].Temp6 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp6) + StoF(DateButton[vRow, vCol].Temp6));
        DateButton[vRow, High(DateButton[vRow])].Temp7 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp7) + Ifthen(DateButton[vRow, vCol].Temp2=EmptyStr,0,1) );
        DateButton[vRow, High(DateButton[vRow])].Temp9 := FloatToStr(StoF(DateButton[vRow, High(DateButton[vRow])].Temp9) + StoF(DateButton[vRow, vCol].Temp9));

        DateButton[High(DateButton), vCol].Temp1       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp1)       + StoF(DateButton[vRow, vCol].Temp1));
        DateButton[High(DateButton), vCol].Temp2       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp2)       + StoF(DateButton[vRow, vCol].Temp2));
        DateButton[High(DateButton), vCol].Temp3       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp3)       + StoF(DateButton[vRow, vCol].Temp3));
        DateButton[High(DateButton), vCol].Temp4       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp4)       + StoF(DateButton[vRow, vCol].Temp4));
        DateButton[High(DateButton), vCol].Temp5       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp5)       + StoF(DateButton[vRow, vCol].Temp5));
        DateButton[High(DateButton), vCol].Temp6       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp6)       + StoF(DateButton[vRow, vCol].Temp6));
        DateButton[High(DateButton), vCol].Temp7       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp7)       + Ifthen(DateButton[vRow, vCol].Temp2=EmptyStr,0,1) );
        DateButton[High(DateButton), vCol].Temp9       := FloatToStr(StoF(DateButton[High(DateButton), vCol].Temp9)       + StoF(DateButton[vRow, vCol].Temp9));
      end;
    end;

  for vCol := Low(DateButton[0]) to High(DateButton[0])-1 do
  begin
    DateButton[High(DateButton), High(DateButton[vRow])].Temp1 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp1) + StoF(DateButton[High(DateButton), vCol].Temp1));
    DateButton[High(DateButton), High(DateButton[vRow])].Temp2 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp2) + StoF(DateButton[High(DateButton), vCol].Temp2));
    DateButton[High(DateButton), High(DateButton[vRow])].Temp3 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp3) + StoF(DateButton[High(DateButton), vCol].Temp3));
    DateButton[High(DateButton), High(DateButton[vRow])].Temp4 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp4) + StoF(DateButton[High(DateButton), vCol].Temp4));
    DateButton[High(DateButton), High(DateButton[vRow])].Temp5 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp5) + StoF(DateButton[High(DateButton), vCol].Temp5));
    DateButton[High(DateButton), High(DateButton[vRow])].Temp6 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp6) + StoF(DateButton[High(DateButton), vCol].Temp6));
    DateButton[High(DateButton), High(DateButton[vRow])].Temp7 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp7) + StoF(DateButton[High(DateButton), vCol].Temp7));
    DateButton[High(DateButton), High(DateButton[vRow])].Temp9 := FloatToStr(StoF(DateButton[High(DateButton), High(DateButton[vRow])].Temp9) + StoF(DateButton[High(DateButton), vCol].Temp9));
  end;

  ShowText;

  Result := true;

end;
//------------------------------------------------------------------------------
// 버튼에 매출 내용 표시
procedure THeadSaleCalendarShowForm.ShowText;
var
  vRow, vCol, vTextCount: Integer;
  vProfitRate :String;
begin
  vTextCount := DateButton[0, 0].Width div 6 - 7;
  if vTextCount <= 0 then
    vTextCount := 10;

  // 날짜별 매출을 버튼에 표시한다
  for vRow := Low(DateButton) to High(DateButton) do
    for vCol := Low(DateButton[vRow]) to High(DateButton[vRow]) do
      if DateButton[vRow, vCol].Temp1 <> EmptyStr then
      begin
        if (vRow = High(DateButton)) or (vCol = High(DateButton[vRow])) then
          DateButton[vRow, vCol].Number.RightString := DateButton[vRow, vCol].Temp1+'명'
        else
          DateButton[vRow, vCol].Number.RightString := Format('(%s)%s',[DateButton[vRow, vCol].Temp8, DateButton[vRow, vCol].Temp1+'명']);
        DateButton[vRow, vCol].Menu.Name   := '매출'+#13+
                                              '현금'+#13+
                                              '카드'+#13+
                                              '배달';
//                                              ifthen((vRow = High(DateButton)) or (vCol = High(DateButton[vRow])),'', '평균'+#13)+
//                                              ifthen((vRow = High(DateButton)) or (vCol = High(DateButton[vRow])),'[평균]','');

        DateButton[vRow, vCol].Menu.Qty   := FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp2))+#13+
                                             FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp3))+#13+
                                             FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp4))+#13+
                                             FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp9));//+#13+
//                                             ifthen((vRow = High(DateButton)) or (vCol = High(DateButton[vRow])),'',FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp5))+#13)+
//                                             ifthen((vRow = High(DateButton)) or (vCol = High(DateButton[vRow])),FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp2) / Ifthen(StoF(DateButton[vRow, vCol].Temp7)=0,1,StoF(DateButton[vRow, vCol].Temp7)) ),'');

        DateButton[vRow, vCol].Bottom.LeftString := ' 평균';
        if (vRow = High(DateButton)) or (vCol = High(DateButton[vRow])) then
          DateButton[vRow, vCol].Bottom.RightString:= FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp2) / Ifthen(StoF(DateButton[vRow, vCol].Temp7)=0,1,StoF(DateButton[vRow, vCol].Temp7)))
        else
          DateButton[vRow, vCol].Bottom.RightString:= FormatFloat(fmtComma, StoF(DateButton[vRow, vCol].Temp5));

      end
      else
      begin
        DateButton[vRow, vCol].Number.RightString := EmptyStr;
        DateButton[vRow, vCol].Menu.Name          := EmptyStr;
        DateButton[vRow, vCol].Menu.Qty           := EmptyStr;
        DateButton[vRow, vCol].Bottom.LeftString  := EmptyStr;
        DateButton[vRow, vCol].Bottom.RightString := EmptyStr;
      end;
end;

end.
