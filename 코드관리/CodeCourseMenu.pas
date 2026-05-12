unit CodeCourseMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  cxCurrencyEdit, StrUtils, cxButtonEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, dxColorEdit,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  AdvPanel, Math, System.ImageList, Vcl.ImgList, dxDateRanges,
  dxScrollbarAnnotations, cxImageList, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePager, AdvOfficePagerStylers;

type TSelectMode = (smNone, smCourse, smMenu);

type
  TcxGridDataControllerAccess = class (TcxGridDataController);

type
  TCodeCourseMenuForm = class(TInheritGridEditForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    AdvSplitter1: TAdvSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Grid2: TcxGrid;
    GridTableView2: TcxGridTableView;
    GridTableView2MenuCode: TcxGridColumn;
    GridTableView2MenuName: TcxGridColumn;
    GridTableView2SalePrice: TcxGridColumn;
    GridTableView2Default: TcxGridColumn;
    GridTableView2Color: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1CourseName: TcxGridColumn;
    GridTableView1Count: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    GridTableView1CourseSeq: TcxGridColumn;
    StyleBackGroundFocused: TcxStyle;
    GridTableView1ChooseType: TcxGridColumn;
    UpDownPanel: TAdvPanel;
    UpButton: TAdvGlowButton;
    DownButton: TAdvGlowButton;
    GridTableViewPopupMenu: TPopupMenu;
    GridTableViewPopupMenuCopy: TMenuItem;
    GridTableViewPopupMenuPaste: TMenuItem;
    ImageList: TcxImageList;
    UpDown2Panel: TAdvPanel;
    Up2Button: TAdvGlowButton;
    Down2Button: TAdvGlowButton;
    GridTableView2Seq: TcxGridColumn;
    procedure GridTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridEnter(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure UpButtonClick(Sender: TObject);
    procedure DownButtonClick(Sender: TObject);
    procedure GridTableViewPopupMenuCopyClick(Sender: TObject);
    procedure GridTableViewPopupMenuPasteClick(Sender: TObject);
    procedure GridTableViewPopupMenuPopup(Sender: TObject);
    procedure Up2ButtonClick(Sender: TObject);
    procedure Down2ButtonClick(Sender: TObject);
    procedure GridTableView2FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    FSelectMode: TSelectMode;
    CourseRecordIndex,
    MenuRecordIndex :Integer;
    PLUDefaultColor :TColor;
    FocusedGrid: TcxGrid;
    CopyMenuCode :String;
    procedure  MoveRow(aUp:Boolean);
    procedure  MoveRow2(aUp:Boolean);
    procedure  SetSelectMode(AValue:TSelectMode);
    property   SelectMode :TSelectMode read FSelectMode write SetSelectMode;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoSave: Boolean; override;
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  CodeCourseMenuForm: TCodeCourseMenuForm;

implementation
uses
  Common, Help, DBModule, Main;
{$R *.dfm}

{ TCodeCourseMenuForm }
function TCodeCourseMenuForm.DoSave: Boolean;
  function CheckDupCourseName(aIndex:Integer; aName:String):Boolean;
  var vIndex :Integer;
  begin
    Result := false;
    for vIndex := aIndex to GridTableView1.DataController.RecordCount-1 do
    begin
      if GridTableView1.DataController.Values[vIndex,GridTableView1CourseName.Index] = aName then
      begin
        Result := true;
        Break;
      end;
    end;
  end;
var vIndex, vSeq :Integer;
    vCourseName : String;
    vDup :Boolean;
    vDsChoose,
    vSQL :String;
begin
  vDup := false;
  GridTableView1.DataController.PostEditingData;
  GridTableView2.DataController.PostEditingData;
  for vIndex := 0 to GridTableView1.DataController.RecordCount-2 do
  begin
    if CheckDupCourseName(vIndex+1, GridTableView1.DataController.Values[vIndex,GridTableView1CourseName.Index]) then
    begin
      vDup := true;
      MsgBox('같은 코스명이 있습니다'#13'코스명을 다르게 지정하세요');
      Break;
    end;
  end;
  if vDup then Exit;

  if (GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1ChooseType.Index]='체크박스')
    and (GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1Count.Index] > GridTableView2.DataController.RecordCount) then
    GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1Count.Index] := GridTableView2.DataController.RecordCount;


  try
    ExecQuery('delete from MS_COURSE '
             +' where CD_HEAD    =:P0 '
             +'   and CD_STORE   =:P1 '
             +'   and CD_MENU    =:P2 '
             +'   and COURSE_SEQ =:P3;',
             [HeadStoreCode,
              StoreCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex,GridTableViewMenuCode.Index],
              GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex,GridTableView1CourseSeq.Index]],false);
    vSeq := 1;
    vSQL := '';
    for vIndex := 0 to GridTableView2.DataController.RecordCount-1 do
    begin
      if GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1ChooseType.Index]='라디오' then
        vDsChoose := 'R'
      else if GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1ChooseType.Index]='체크박스' then
        vDsChoose := 'C'
      else if GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1ChooseType.Index]='수량' then
        vDsChoose := 'Q';

      vSQL := vSQL + Format('(''%s'',''%s'',''%s'',%s, %s,''%s'', %s,''%s'',''%s'',''%s'',''%s'',''%s'',''%s''),',
               [HeadStoreCode,
                StoreCode,
                GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex,GridTableViewMenuCode.Index],
                GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex,GridTableView1CourseSeq.Index],
                IntToStr(vSeq),
                GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex,GridTableView1CourseName.Index],
                GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex,GridTableView1Count.Index],
                GridTableView2.DataController.Values[vIndex, GridTableView2MenuCode.Index],
                GridTableView2.DataController.Values[vIndex, GridTableView2MenuName.Index],
                Ifthen(GridTableView2.DataController.Values[vIndex, GridTableView2Default.Index]='N.선택','N','Y'),
                ColorToString(GridTableView2.DataController.Values[vIndex, GridTableView2Color.Index]),
                TColorToHex(GridTableView2.DataController.Values[vIndex, GridTableView2Color.Index]),
                vDsChoose]);
      Inc(vSeq);
    end;

    if vSQL <> '' then
    begin
      vSQL := 'insert into MS_COURSE(CD_HEAD, '
             +'                      CD_STORE, '
             +'                      CD_MENU, '
             +'                      COURSE_SEQ, '
             +'                      SEQ, '
             +'                      NM_COURSE, '
             +'                      CNT_CHOOSE, '
             +'                      CD_MENU_COURSE, '
             +'                      NM_MENU_COURSE, '
             +'                      YN_DEFAULT, '
             +'                      COLOR, '
             +'                      COLOR_HEX, '
             +'                      DS_CHOOSE) values '+LeftStr(vSQL,Length(vSQL)-1)+';';
      TempSQL := TempSQL + vSQL;
    end;
    Result := ExecQuery(TempSQL,[],true);
    ExtremeMainForm.PosSendMessage;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

function TCodeCourseMenuForm.DoSearch: Boolean;
begin
  Result := false;
  GridTableView1.DataController.RecordCount := 0;
  GridTableView2.DataController.RecordCount := 0;
  OpenQuery('select CD_MENU, '
           +'       NM_MENU '
           +'  from MS_MENU  '
           +' where CD_HEAD      =:P0 '
           +'   and CD_STORE     =:P1 '
           +'   and DS_MENU_TYPE =''C'' '
           +'   and YN_USE       =''Y'' '
           +' order by CD_MENU',
            [HeadStoreCode,
             StoreCode]);
  try
    Result := DM.ReadQuery(Query, GridTableView);
    isLoading := false;
    if Result then
    begin
      GridTableView.DataController.FocusedRecordIndex := 0;
      MainPanel.Enabled := true;
      Grid1.SetFocus;
    end;
  finally
    FinishQuery;
  end;
end;


procedure TCodeCourseMenuForm.Down2ButtonClick(Sender: TObject);
begin
  inherited;
  MoveRow2(false);
end;

procedure TCodeCourseMenuForm.DownButtonClick(Sender: TObject);
begin
  inherited;
  MoveRow(false);
end;

procedure TCodeCourseMenuForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  isChanged := true;
end;

procedure TCodeCourseMenuForm.FormShow(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select NM_CODE3 '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''87'' '
             +'   and CD_CODE  =''002'' ',
             [HeadStoreCode,
              StoreCode]);
    if not Query.Eof then
      PLUDefaultColor      := StringToColor(Query.FieldByName('NM_CODE3').AsString);
  finally
    Query.Close;
  end;
  CopyMenuCode := '';
end;

procedure TCodeCourseMenuForm.GridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if isLoading then Exit;

  OpenQuery('select a.CD_MENU_COURSE, '
           +'       a.NM_MENU_COURSE, '
           +'       b.PR_SALE, '
           +'       case a.YN_DEFAULT when ''N'' then ''N.선택'' else ''Y.기본'' end as YN_DEFAULT, '
           +'       a.COLOR, '
           +'       a.SEQ '
           +'  from MS_COURSE a inner join '
           +'       MS_MENU   b on a.CD_HEAD  = b.CD_HEAD '
           +'                  and a.CD_STORE = b.CD_STORE '
           +'                  and a.CD_MENU_COURSE = b.CD_MENU '
           +' where a.CD_HEAD     =:P0 '
           +'   and a.CD_STORE    =:P1 '
           +'   and a.CD_MENU     =:P2 '
           +'   and a.COURSE_SEQ  =:P3 '
           +'   and a.SEQ        <> -1 '
           +'  order by a.SEQ ',
            [HeadStoreCode,
             StoreCode,
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],
             GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1CourseSeq.Index]]);
  if DM.ReadQuery(Query, GridTableView2) then
  begin
    Query.Close;
    GridTableView2.DataController.FocusedRecordIndex := 0;
  end;

  UpButton.Enabled   := GridTableView1.DataController.GetFocusedRecordIndex > 0;
  DownButton.Enabled := GridTableView1.DataController.GetFocusedRecordIndex < GridTableView1.DataController.RecordCount-1;
end;

procedure TCodeCourseMenuForm.GridTableView2FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
 SelectMode := smMenu;
end;

procedure TCodeCourseMenuForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
//  inherited;
  DoGridLink;
end;

procedure TCodeCourseMenuForm.GridTableViewPopupMenuCopyClick(Sender: TObject);
begin
  inherited;
  CopyMenuCode := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index];
  if CopyMenuCode <> '' then
    GridTableView.OptionsSelection.MultiSelect := true;
end;

procedure TCodeCourseMenuForm.GridTableViewPopupMenuPasteClick(Sender: TObject);
var
  vIndex: Integer;
  vGoods, vSQL :String;
  vGoodsList :TStringList;
begin
  inherited;
  vGoods := '';
  vGoodsList := TStringList.Create;
  for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
  begin
    vGoods := vGoods + Format('''%s'',',[GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewMenuCode.Index]]);
    vGoodsList.Add(GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewMenuCode.Index]);
  end;

  if vGoods = '' then Exit;

  vGoods := Format('(%s);',[LeftStr(vGoods, Length(vGoods)-1)]);

  ExecQuery('delete from MS_COURSE '
           +' where CD_HEAD    =:P0 '
           +'   and CD_STORE   =:P1 '
           +'   and CD_MENU    in '+ vGoods,
           [HeadStoreCode,
            StoreCode],false);

  OpenQuery('select CD_HEAD, '
           +'       CD_STORE, '
           +'       CD_MENU, '
           +'       COURSE_SEQ, '
           +'       SEQ, '
           +'       NM_COURSE, '
           +'       CNT_CHOOSE, '
           +'       CD_MENU_COURSE, '
           +'       NM_MENU_COURSE, '
           +'       YN_DEFAULT, '
           +'       COLOR, '
           +'       COLOR_HEX, '
           +'       DS_CHOOSE '
           +'  from MS_COURSE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_MENU  =:P2 ',
           [HeadStoreCode,
            StoreCode,
            CopyMenuCode]);

  vSQL := '';
  for vIndex := 0 to vGoodsList.Count-1 do
  begin
    Query.First;
    while not Query.Eof do
    begin
      vSQL := vSQL + Format('(''%s'',''%s'',''%s'',%s, %s,''%s'', %s,''%s'',''%s'',''%s'',''%s'',''%s'',''%s''),',
                           [HeadStoreCode,
                            StoreCode,
                            vGoodsList.Strings[vIndex],
                            Query.FieldByName('COURSE_SEQ').AsString,
                            Query.FieldByName('SEQ').AsString,
                            Query.FieldByName('NM_COURSE').AsString,
                            Query.FieldByName('CNT_CHOOSE').AsString,
                            Query.FieldByName('CD_MENU_COURSE').AsString,
                            Query.FieldByName('NM_MENU_COURSE').AsString,
                            Query.FieldByName('YN_DEFAULT').AsString,
                            Query.FieldByName('COLOR').AsString,
                            Query.FieldByName('COLOR_HEX').AsString,
                            Query.FieldByName('DS_CHOOSE').AsString]);
      Query.Next;
    end;
  end;
  Query.Close;

  if ExecQuery('insert into MS_COURSE(CD_HEAD, '
           +'                      CD_STORE, '
           +'                      CD_MENU, '
           +'                      COURSE_SEQ, '
           +'                      SEQ, '
           +'                      NM_COURSE, '
           +'                      CNT_CHOOSE, '
           +'                      CD_MENU_COURSE, '
           +'                      NM_MENU_COURSE, '
           +'                      YN_DEFAULT, '
           +'                      COLOR, '
           +'                      COLOR_HEX, '
           +'                      DS_CHOOSE) values '
           +LeftStr(vSQL, Length(vSQL)-1)+';',
           [],true) then
  begin
    CopyMenuCode := '';
    GridTableView.OptionsSelection.MultiSelect := false;
    DoGridLink;
  end;
end;

procedure TCodeCourseMenuForm.GridTableViewPopupMenuPopup(Sender: TObject);
begin
  inherited;
  GridTableViewPopupMenuCopy.Enabled := GridTableView.Controller.SelectedRecordCount = 1;
  GridTableViewPopupMenuPaste.Enabled := CopyMenuCode <> '';

end;

procedure TCodeCourseMenuForm.MoveRow(aUp: Boolean);
var
  vCurIndex, vNewIndex, vTempIndex, vIndex: integer;
  vCurSeq :Integer;
begin
  if GridTableView1.DataController.RecordCount = 0 then Exit;

  vCurIndex := GridTableView1.DataController.FocusedRecordIndex;
  vCurSeq   := GridTableView1.DataController.Values[vCurIndex, GridTableView1CourseSeq.Index];

  if vCurIndex < 0 then Exit;

  if aUp and (vCurIndex = 0) then Exit;
  if not aUp and (vCurIndex = GridTableView1.DataController.RecordCount-1) then Exit;
  vTempIndex := Ifthen(aUp, vCurIndex -1, vCurIndex +1);

  GridTableView1.Controller.ClearSelection;
  with TcxGridDataControllerAccess(GridTableView1.DataController) do
  begin
    BeginUpdate;
    try
      if vCurIndex < vTempIndex then
        inc(vTempIndex);
      vNewIndex := InsertRecord(vTempIndex);
      if vCurIndex > vNewIndex then
        inc(vCurIndex);
      CopyRecord(vCurIndex, vNewIndex);
      if vCurIndex < vNewIndex then
        dec(vNewIndex);
       DeleteRecord(vCurIndex);
    finally
      FocusedRecordIndex := vNewIndex;
      EndUpdate;
    end;
  end;

  ExecQuery('update MS_COURSE '
           +'   set COURSE_SEQ = 99 '
           +' where CD_HEAD     =:P0 '
           +'   and CD_STORE    =:P1 '
           +'   and CD_MENU     =:P2 '
           +'   and COURSE_SEQ  =:P3+:P4;',
           [HeadStoreCode,
            StoreCode,
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],
            vCurSeq,
            Ifthen(aUp,-1,1)],false);
  ExecQuery('update MS_COURSE '
           +'   set COURSE_SEQ = :P3+:P4 '
           +' where CD_HEAD     =:P0 '
           +'   and CD_STORE    =:P1 '
           +'   and CD_MENU     =:P2 '
           +'   and COURSE_SEQ  =:P3;',
           [HeadStoreCode,
            StoreCode,
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],
            vCurSeq,
            Ifthen(aUp,-1,1)],false);

  ExecQuery('update MS_COURSE '
           +'   set COURSE_SEQ = :P3 '
           +' where CD_HEAD     =:P0 '
           +'   and CD_STORE    =:P1 '
           +'   and CD_MENU     =:P2 '
           +'   and COURSE_SEQ  =99;',
           [HeadStoreCode,
            StoreCode,
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],
            vCurSeq],true);

  DoGridLink;
  GridTableView1.DataController.FocusedRecordIndex := vNewIndex;
  Grid1.SetFocus;
end;

procedure TCodeCourseMenuForm.MoveRow2(aUp: Boolean);
var
  vCurIndex, vNewIndex, vTempIndex, vIndex: integer;
  vCurSeq :Integer;
begin
  if GridTableView2.DataController.RecordCount = 0 then Exit;

  vCurIndex := GridTableView2.DataController.FocusedRecordIndex;
  vCurSeq   := GridTableView2.DataController.Values[vCurIndex, GridTableView2Seq.Index];

  if vCurIndex < 0 then Exit;

  if aUp and (vCurIndex = 0) then Exit;
  if not aUp and (vCurIndex = GridTableView2.DataController.RecordCount-1) then Exit;
  vTempIndex := Ifthen(aUp, vCurIndex -1, vCurIndex +1);

  GridTableView2.Controller.ClearSelection;
  with TcxGridDataControllerAccess(GridTableView2.DataController) do
  begin
    BeginUpdate;
    try
      if vCurIndex < vTempIndex then
        inc(vTempIndex);
      vNewIndex := InsertRecord(vTempIndex);
      if vCurIndex > vNewIndex then
        inc(vCurIndex);
      CopyRecord(vCurIndex, vNewIndex);
      if vCurIndex < vNewIndex then
        dec(vNewIndex);
       DeleteRecord(vCurIndex);
    finally
      FocusedRecordIndex := vNewIndex;
      EndUpdate;
    end;
  end;
  GridTableView2.DataController.FocusedRecordIndex := vNewIndex;
  Grid2.SetFocus;
  isChanged := true;
end;

procedure TCodeCourseMenuForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  if SelectMode = smNone then
  begin
    ButtonToolBarNewButton.Enabled      := false;
    ButtonToolBarDeleteButton.Enabled   := false;
  end
  else
    ButtonToolBarNewButton.Enabled      := true;

  UpButton.Enabled   := not isChanged and (GridTableView1.DataController.RecordCount > 1);
  DownButton.Enabled := not isChanged and (GridTableView1.DataController.RecordCount > 1);
end;

procedure TCodeCourseMenuForm.SetSelectMode(AValue: TSelectMode);
begin
  FSelectMode := AValue;
  case FSelectMode of
    smNone :
      begin
        GridTableView1.Styles.Background := nil;
        GridTableView2.Styles.Background := nil;
        ButtonToolBarNewButton.Enabled      := false;
        ButtonToolBarDeleteButton.Enabled   := false;
      end;
    smCourse :
      begin
        GridTableView1.Styles.Background := StyleBackGroundFocused;
        GridTableView2.Styles.Background := nil;
        ButtonToolBarNewButton.Enabled      := true;
        ButtonToolBarDeleteButton.Enabled   := GridTableView1.DataController.GetFocusedRecordIndex >= 0;
        Grid2.Enabled := GridTableView1.DataController.GetFocusedRecordIndex >= 0;
      end;
    smMenu :
      begin
        GridTableView1.Styles.Background := nil;
        GridTableView2.Styles.Background := StyleBackGroundFocused;
        ButtonToolBarNewButton.Enabled      := true;
        ButtonToolBarDeleteButton.Enabled   := GridTableView2.DataController.GetFocusedRecordIndex >= 0;
      end;
  end;
  isChanged := false;
end;

procedure TCodeCourseMenuForm.Up2ButtonClick(Sender: TObject);
begin
  inherited;
  MoveRow2(true);
end;

procedure TCodeCourseMenuForm.UpButtonClick(Sender: TObject);
begin
  inherited;
  MoveRow(true);
end;

procedure TCodeCourseMenuForm.GridEnter(Sender: TObject);
begin
  inherited;
  if Sender = Grid then
  begin
    SelectMode          := smNone;
    UpDownPanel.Enabled := false;
    UpDown2Panel.Enabled := false;
  end
  else if Sender = Grid1 then
  begin
    SelectMode := smCourse;
    UpDownPanel.Enabled := true;
    UpDown2Panel.Enabled := false;
  end
  else if Sender = Grid2 then
  begin
    SelectMode := smMenu;
    UpDownPanel.Enabled := false;
    UpDown2Panel.Enabled := true;
  end;
end;

procedure TCodeCourseMenuForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
//  inherited;
  case SelectMode of
    smCourse :
      begin
        if GridTableView1.DataController.GetFocusedRecordIndex < 0 then Exit;
        if not AskBox('선택한 단계를 삭제하시겠습니까'+#13+'단계가 삭제되면 해당 메뉴도 삭제됩니다') then Exit;
        ExecQuery('delete from MS_COURSE '
                 +' where CD_HEAD     =:P0 '
                 +'   and CD_STORE    =:P1 '
                 +'   and CD_MENU     =:P2 '
                 +'   and COURSE_SEQ  =:P3;',
                 [HeadStoreCode,
                  StoreCode,
                  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],
                  GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1CourseSeq.Index]], true);

        isLoading := true;
        GridTableView1.DataController.DeleteRecord(GridTableView1.DataController.GetFocusedRecordIndex);
        isLoading := false;
        GridTableView2.DataController.RecordCount := 0;
        if GridTableView1.DataController.RecordCount > 0 then
          GridTableView1.Controller.FocusedRowIndex := GridTableView1.DataController.RecordCount-1;
        if GridTableView1.DataController.RecordCount = 0 then
          Grid2.Enabled := false;
        isChanged := false;
      end;
    smMenu :
      begin
        if GridTableView2.DataController.GetFocusedRecordIndex < 0 then Exit;
        if not AskBox('선택한 메뉴를 삭제하시겠습니까') then Exit;
        GridTableView2.DataController.DeleteRecord(GridTableView2.DataController.GetFocusedRecordIndex);
        if GridTableView2.DataController.RecordCount > 0 then
          GridTableView2.Controller.FocusedRowIndex := GridTableView2.DataController.RecordCount-1;
        isChanged := true;
      end;
  end;
end;

procedure TCodeCourseMenuForm.ButtonToolBarNewButtonClick(Sender: TObject);
  function GetCourseSeq:Integer;
  var vIndex :Integer;
  begin
    Result := 0;
    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
      if GridTableView1.DataController.Values[vIndex, GridTableView1CourseSeq.Index] > Result then
        Result := GridTableView1.DataController.Values[vIndex, GridTableView1CourseSeq.Index];
  end;
var
  vIndex, vIndex1  : Integer;
  vSeq :Integer;
begin
  if SelectMode = smCourse then
  begin
    if isChanged then
      if not AskBox('저장되지 않은 내역이 있습니다'#13'계속하시겠습니까?') then Exit;
    GridTableView1.DataController.AppendRecord;
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1CourseName.Index] := IntToStr(GridTableView1.DataController.RecordCount);
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1Count.Index]      := 1;
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1CourseSeq.Index]  := GetCourseSeq+1;
    GridTableView1.DataController.FocusedRecordIndex := GridTableView1.DataController.RecordCount-1;
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, GridTableView1ChooseType.Index] := '라디오';
    isChanged := true;
    Grid2.Enabled := true;
    GridTableView2.DataController.RecordCount := 0;
  end
  else if SelectMode = smMenu then
  begin
    if GridTableView.DataController.RecordCount = 0 then Exit;

    // 상품 바코드를 조회한다
    with THelpForm.Create(Self) do
      try
        Caption                    := '메뉴 조회';
        GridTableViewCode.Caption  := '메뉴코드';
        GridTableViewCode.Width    := 110;
        GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
        GridTableViewName1.Caption := '메뉴명';
        GridTableViewName1.Width   := 170;
        GridTableViewName2.Caption := '판매단가';
        GridTableViewName2.Width   := 70;
        GridTableViewName2.Visible := true;
        GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
        GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
        TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
        TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

        GridTableView.OptionsSelection.MultiSelect := true;

        SQLText    := 'select   CD_MENU, '
                     +'         NM_MENU, '
                     +'         PR_SALE '
                     +'from     MS_MENU '
                     +'where    CD_HEAD  =:P0 '
                     +'  and    CD_STORE =:P1 '
                     +'  and   (CD_MENU like ConCat(:P2,''%'') '
                     +'      or NM_MENU like ConCat(''%'',:P2,''%'') or NM_MENU_SHORT like ConCat(''%'',:P2,''%'')) '
                     +'  and    DS_MENU_TYPE in (''N'', ''I'') '
                     +'  and    YN_USE   = ''Y'' '
                     +'  and    CD_MENU <> '''+Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]+''' '
                     +'order by CD_MENU';
        IsAutoSearch := True;
        if ShowModal = mrOK then
        begin
          Self.GridTableView1.DataController.BeginUpdate;
          for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
          begin
            vIndex1 := GridTableView2.DataController.FilteredIndexByRecordIndex[GridTableView2.DataController.FindRecordIndexByText(0, GridTableView2MenuCode.Index, GridTableView.Controller.SelectedRecords[vIndex].Values[0], false, false, true)];
            if vIndex1 >= 0 then Continue;

            Self.GridTableView2.DataController.AppendRecord;
            Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.RecordCount-1, Self.GridTableView2MenuCode.Index  ] := GridTableView.Controller.SelectedRecords[vIndex].Values[0];
            Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.RecordCount-1, Self.GridTableView2MenuName.Index  ] := GridTableView.Controller.SelectedRecords[vIndex].Values[1];
            Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.RecordCount-1, Self.GridTableView2SalePrice.Index ] := GridTableView.Controller.SelectedRecords[vIndex].Values[2];
            Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.RecordCount-1, Self.GridTableView2Default.Index   ] := 'N.선택';
            Self.GridTableView2.DataController.Values[Self.GridTableView2.DataController.RecordCount-1, Self.GridTableView2Color.Index     ] := PLUDefaultColor;
          end;
          Self.GridTableView1.DataController.EndUpdate;
          isChanged := true;
        end;
    finally
      Free;
    end;
  end;
end;

procedure TCodeCourseMenuForm.DoGridLink;
begin
  inherited;
  if isLoading then Exit;

  OpenQuery('select distinct NM_COURSE, '
           +'       CNT_CHOOSE, '
           +'       COURSE_SEQ, '
           +'       case DS_CHOOSE when ''R'' then ''라디오'' when ''C'' then ''체크박스'' when ''Q'' then ''수량'' end as DS_CHOOSE '
           +'  from MS_COURSE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_MENU  =:P2 '
           +' order by COURSE_SEQ ',
            [HeadStoreCode,
             StoreCode,
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);
  isLoading := true;
  GridTableView2.DataController.RecordCount := 0;
  if DM.ReadQuery(Query, GridTableView1) then
  begin
    Query.Close;
    isLoading := false;
    GridTableView1.DataController.FocusedRecordIndex := 0;
  end
  else isLoading := false;
end;

end.
