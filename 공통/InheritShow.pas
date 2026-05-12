// 조회 상속폼 (F)

unit InheritShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inherit, UniProvider, ShellAPI, SQLServerUniProvider, Uni,
  DB, MemDS, ImgList, Menus, Common, ExtCtrls, StdCtrls, DateUtils, cxGraphics,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxRadioGroup, AdvToolBar, AdvToolBarStylers,
  cxContainer, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  AdvGlowButton, cxGridExportLink, cxCalendar, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, StrUtils, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, dxmdaset, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TInheritShowForm = class(TInheritForm)
    ButtonToolBarSearchButton: TAdvGlowButton;
    ButtonToolBarSeparator1: TAdvToolBarSeparator;
    ButtonToolBarPrintButton: TAdvGlowMenuButton;
    ButtonToolBarSeparator2: TAdvToolBarSeparator;
    ButtonToolBarPrintButtonPopupMenu: TPopupMenu;
    ButtonToolBarPrintButtonPopupMenuPrint: TMenuItem;
    ButtonToolBarPrintButtonPopupMenuPreview: TMenuItem;
    ButtonToolBarPrintButtonPopupMenuExcel: TMenuItem;
    ButtonToolBarPrintButtonImageList: TImageList;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    ConditionToolbarMonthRadioButton: TcxRadioButton;
    ConditionToolbarTodayRadioButton: TcxRadioButton;
    ConditionToolbarWeekRadioButton: TcxRadioButton;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    ButtonToolBarPrintButtonPopupMenuTIF: TMenuItem;
    ButtonToolBarPrintButtonPopupMenuReceipt: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuExcelClick(Sender: TObject);
    procedure ConditionToolbarPeriodRadioButtonClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuTIFClick(Sender: TObject);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);

  protected
    PrintMode: TPrintMode;
    SQLs     : array of string;
    Params   : array of array of Variant;
    ReportTitle,
    ReportSubTitle,
    ReportFixtitle: string;
    isSelected :Boolean;

    procedure SetQuery(aSQL: string; aParam: array of Variant; aSQLNo: Integer = 0);
    function  DoSearch:Boolean; virtual;
    procedure DoPrint; virtual;
    procedure DoPreview; virtual;
    procedure DoTIF; virtual;
  end;



implementation

uses
  DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TInheritShowForm.FormShow(Sender: TObject);
begin
  inherited;
  ReportSubTitle := Caption;
  isSelected := false;
  dxComponentPrinter1Link1.ReportTitle.Font.Size := 9;
  dxComponentPrinter1Link1.ReportTitle.Font.Name := '맑은고딕';
  dxComponentPrinter1Link1.ReportTitle.TextAlignX := taLeft;

  ReportSubTitle := EmptyStr;

  // 출력 메뉴를 활성화 한다
  ButtonToolBarPrintButtonPopupMenuPrint.Visible   := PrintMode in [pmAll, pmPrint,   pmPrintPreview, pmPrintExcel,   pmPrintPreviewExcel, pmPrintPreviewTif];
  ButtonToolBarPrintButtonPopupMenuPreview.Visible := PrintMode in [pmAll, pmPreview, pmPrintPreview, pmPreviewExcel, pmPrintPreviewExcel, pmPrintPreviewTif];
  ButtonToolBarPrintButtonPopupMenuExcel.Visible   := PrintMode in [pmAll, pmExcel,   pmPrintExcel,   pmPreviewExcel, pmPrintPreviewExcel];
  ButtonToolBarPrintButtonPopupMenuTIF.Visible     := PrintMode in [pmAll, pmPrintPreviewTif];
  ButtonToolBarPrintButton.Visible                 := ButtonToolBarPrintButtonPopupMenuPrint.Visible   or
                                                      ButtonToolBarPrintButtonPopupMenuPreview.Visible or
                                                      ButtonToolBarPrintButtonPopupMenuExcel.Visible   or
                                                      ButtonToolBarPrintButtonPopupMenuTIF.Visible;
  if not ButtonToolBarPrintButton.Visible then
    ButtonToolBarSeparator2.Width := 0;

end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TInheritShowForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F2 : ButtonToolBarSearchButton.Click;
    VK_F6 : ButtonToolBarPrintButton.Click;
  end;
end;

procedure TInheritShowForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 기간 라디오버튼을 누를 때
procedure TInheritShowForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) and (ConditionToolBarEdit.Text <> EmptyStr) then
  begin
    if not DoSearch then
    begin
      MsgBox(msgNoSearchData);
      ConditionToolBarEdit.Setfocus;
    end;
  end;
end;

procedure TInheritShowForm.ConditionToolbarPeriodRadioButtonClick(Sender: TObject);
begin
  inherited;

  if Sender = ConditionToolbarTodayRadioButton then
  begin
    ConditionToolBarFromDateEdit.Date := Date;
    ConditionToolBarToDateEdit.Date   := Date;
  end
  else if Sender = ConditionToolbarWeekRadioButton then
  begin
    ConditionToolBarFromDateEdit.Date := StartOfTheWeek(Date);
    ConditionToolBarToDateEdit.Date   := Date;
  end
  else if Sender = ConditionToolbarMonthRadioButton then
  begin
    ConditionToolBarFromDateEdit.Date := StartOfTheMonth(Date);
    ConditionToolBarToDateEdit.Date   := Date;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TInheritShowForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSearchButton.Visible or not ButtonToolBarSearchButton.Enabled then
    Exit;

  inherited;
  if not IsDebuggerPresent then
    BlockInput(true);
  if not DoSearch then
    MsgBox(msgNoSearchData);
  BlockInput(false);
end;
//------------------------------------------------------------------------------
// 출력 버튼
procedure TInheritShowForm.ButtonToolBarPrintButtonClick(Sender: TObject);
begin
  if not ButtonToolBarPrintButton.Visible or not ButtonToolBarPrintButton.Enabled then
    Exit;

  inherited;

  // 출력, 엑셀, 미리보기 중 활성화된 메뉴를 실행시킨다
  if ButtonToolBarPrintButtonPopupMenuPrint.Visible and ButtonToolBarPrintButtonPopupMenuPrint.Enabled then
    ButtonToolBarPrintButtonPopupMenuPrint.Click
  else if ButtonToolBarPrintButtonPopupMenuExcel.Visible and ButtonToolBarPrintButtonPopupMenuExcel.Enabled then
    ButtonToolBarPrintButtonPopupMenuExcel.Click
  else if ButtonToolBarPrintButtonPopupMenuPreview.Visible and ButtonToolBarPrintButtonPopupMenuPreview.Enabled then
    ButtonToolBarPrintButtonPopupMenuPreview.Click;
end;
//------------------------------------------------------------------------------
// 출력 팝업메뉴
procedure TInheritShowForm.ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
begin
  if not ButtonToolBarPrintButtonPopupMenuPrint.Visible or not ButtonToolBarPrintButtonPopupMenuPrint.Enabled then
    Exit;

  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  inherited;

  dxComponentPrinter1Link1.PrinterPage.PageHeader.CenterTitle.Clear;
  dxComponentPrinter1Link1.PrinterPage.PageHeader.CenterTitle.Add(Caption);
  if Grid.ActiveView.DataController.RecordCount = 0 then
    MsgBox(msgNoPrintData)
  else
    DoPrint;
end;
procedure TInheritShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 미리보기 팝업메뉴
procedure TInheritShowForm.ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
begin
  if not ButtonToolBarPrintButtonPopupMenuPreview.Visible or not ButtonToolBarPrintButtonPopupMenuPreview.Enabled then
    Exit;

  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;

  inherited;
  dxComponentPrinter1Link1.PrinterPage.PageHeader.CenterTitle.Clear;
  dxComponentPrinter1Link1.PrinterPage.PageHeader.CenterTitle.Add(Caption);
  if Grid.ActiveView.DataController.RecordCount = 0 then
    MsgBox(msgNoPrintData)
  else
    DoPreview;
end;
//------------------------------------------------------------------------------
// 엑셀 팝업메뉴
procedure TInheritShowForm.ButtonToolBarPrintButtonPopupMenuExcelClick(Sender: TObject);
var
  vFileName: string;
begin
  if not ButtonToolBarPrintButtonPopupMenuExcel.Visible or not ButtonToolBarPrintButtonPopupMenuExcel.Enabled then
    Exit;

  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  inherited;

  if Grid.ActiveView.DataController.RecordCount = 0 then
    ShowMsg(msgNoPrintData)
  else
  begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+dirExcel) then
      ForceDirectories(ExtractFilePath(Application.ExeName)+dirExcel);
    vFileName := ExtractFilePath(Application.ExeName)+dirExcel + Replace(Caption,'/','_')+' '+FormatDateTime(fmtDateShort, Date)+'.xls';
    ExportGridToExcel(vFileName, Grid, false, true, false);
    ShellExecute(0, 'open', PChar(vFileName), nil, nil, SW_SHOW);
  end;
end;
//------------------------------------------------------------------------------
// TIF 이미지 팝업메뉴
procedure TInheritShowForm.ButtonToolBarPrintButtonPopupMenuTIFClick(Sender: TObject);
begin
  inherited;

  DoTif;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 쿼리 지정
procedure TInheritShowForm.SetQuery(aSQL: string; aParam: array of Variant; aSQLNo: Integer = 0);
var
  vIndex: Integer;
begin
  // 메모리 공간을 다시 할당한다
  if (SQLs = nil) or (High(SQLs) < aSQLNo) then
  begin
    SetLength(SQLs,   aSQLNo+1);
    SetLength(Params, aSQLNo+1);
  end;

  // 쿼리와 파라미터를 할당한다
  SQLs[aSQLNo] := aSQL;
  SetLength(Params[aSQLNo], High(aParam)+1);
  for vIndex := Low(aParam) to High(aParam) do
    Params[aSQLNo][vIndex] := aParam[vIndex];
end;
//------------------------------------------------------------------------------
// 조회
function TInheritShowForm.DoSearch: Boolean;
begin
  Result := false;
  ConditionToolBarFromDateEdit.Date := ConditionToolBarFromDateEdit.EditingValue;
  ConditionToolBarToDateEdit.Date   := ConditionToolBarToDateEdit.EditingValue;


  // 메인 쿼리를 열어 그리드에 보여준다
  if (SQLs <> nil) and (High(SQLs) >= 0) and (SQLs[0] <> EmptyStr) and (not Query.Active) then
    if OpenQuery(SQLs[0], Params[0]) then
      Result := DM.ReadQuery(Query, GridTableView);
end;
//------------------------------------------------------------------------------
// 출력
procedure TInheritShowForm.DoPrint;
begin
  if (ConditionToolBarFromDateEdit.Visible) or (ConditionToolBarToDateEdit.Visible) or (ReportSubTitle <> EmptyStr) then
  begin
    if ReportFixTitle = EmptyStr then
    begin
      if ReportSubTitle <> EmptyStr then
        dxComponentPrinter1Link1.ReportTitleText := ReportSubTitle +#13;
      if ConditionToolBarFromDateEdit.Visible then
        dxComponentPrinter1Link1.ReportTitleText := Ifthen(ReportSubTitle <> EmptyStr, dxComponentPrinter1Link1.ReportTitleText, EmptyStr) + ConditionToolBarDateLabel.Caption+' : '+ConditionToolBarFromDateEdit.Text + Ifthen(ConditionToolBarToDateEdit.Visible,' ~ '+ConditionToolBarToDateEdit.Text);
    end
    else
      dxComponentPrinter1Link1.ReportTitleText := ReportFixTitle;
  end;
  dxComponentPrinter.Print(false, nil, dxComponentPrinter1Link1);
end;
//------------------------------------------------------------------------------
// 미리보기
procedure TInheritShowForm.DoPreview;
begin
  if (ConditionToolBarFromDateEdit.Visible) or (ConditionToolBarToDateEdit.Visible) or (ReportSubTitle <> EmptyStr) then
  begin
    if ReportFixTitle = EmptyStr then
    begin
      if ReportSubTitle <> EmptyStr then
        dxComponentPrinter1Link1.ReportTitleText := ReportSubTitle +#13;
      if ConditionToolBarFromDateEdit.Visible then
        dxComponentPrinter1Link1.ReportTitleText := Ifthen(ReportSubTitle <> EmptyStr, dxComponentPrinter1Link1.ReportTitleText, EmptyStr) + ConditionToolBarDateLabel.Caption+' : '+ConditionToolBarFromDateEdit.Text + Ifthen(ConditionToolBarToDateEdit.Visible,' ~ '+ConditionToolBarToDateEdit.Text);
    end
    else
      dxComponentPrinter1Link1.ReportTitleText := ReportFixTitle;
  end;
  dxComponentPrinter1Link1.PrinterPage.PageFooter.RightTitle.Clear;
  dxComponentPrinter1Link1.PrinterPage.PageFooter.RightTitle.Add(Format('%s / %s',[StoreName, UserName]));
  dxComponentPrinter.Preview;
end;
//------------------------------------------------------------------------------
// TIF 출력
procedure TInheritShowForm.DoTIF;
begin
//
end;

procedure TInheritShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  FormParam[0] := EmptyStr;
end;

end.
