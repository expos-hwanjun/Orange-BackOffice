unit StoreHoliday;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxMaskEdit, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGridLevel, cxGrid, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxDropDownEdit, cxLabel, cxCalendar,
  AdvGlowButton, StrUtils;

type
  TStoreHolidayForm = class(TInheritEditForm)
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewHoliday: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    ConditionToolBarYearEdit: TcxMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewHolidayPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override; // 조회
    function  DoDelete: Boolean; override; // 삭제
    function  DoSave  : Boolean; override; // 저장
  end;

var
  StoreHolidayForm: TStoreHolidayForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ TStoreHoildayForm }
procedure TStoreHolidayForm.FormCreate(Sender: TObject);
begin
  inherited;
  ConditionToolBarYearEdit.Text := FormatDateTime('yyyy', Now());
end;

procedure TStoreHolidayForm.FormShow(Sender: TObject);
begin
  inherited;
  DoSearch;
end;

procedure TStoreHolidayForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  isChanged := true;
end;

procedure TStoreHolidayForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  isChanged := true;
end;

procedure TStoreHolidayForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := true;
end;

procedure TStoreHolidayForm.GridTableViewHolidayPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  isChanged := true;
end;

function TStoreHolidayForm.DoSearch: Boolean;
begin
  OpenQuery('select Right(StoD(HOLIDAY),5) as HOLIDAY, '
           +'       REMARK '
           +'  from MS_HOLIDAY '
           +' where YEAR = :P0 '
           +' order by HOLIDAY ',
           [ConditionToolBarYearEdit.Text], false, RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

function TStoreHolidayForm.DoDelete: Boolean;
begin
  GridTableView.DataController.DeleteFocused;
  isChanged := true;
end;

function TStoreHolidayForm.DoSave: Boolean;
var vIndex :Integer;
    vSQL, vTempSQL, vURL   :String;
begin
  ExecQuery('delete from MS_HOLIDAY '
           +' where YEAR = :P0; ',
           [ConditionToolBarYearEdit.Text], false, RestBaseURL);

  vSQL := '';
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    vSQL := vSQL + Format('(''%s'',''%s%s'',''%s''),',[ConditionToolBarYearEdit.Text,
                                                       ConditionToolBarYearEdit.Text,
                                                       GetOnlyNumber(GridTableView.DataController.Values[vIndex, 0]),
                                                       GridTableView.DataController.Values[vIndex, 1]]);

  if vSQL <> '' then
    vSQL := 'insert into MS_HOLIDAY(YEAR, HOLIDAY, REMARK) values '
           +LeftStr(vSQL, Length(vSQL)-1)+';';

  vTempSQL := TempSQL + vSQL;
  Result := ExecQuery(vSQL, [], true, RestBaseURL);

  OpenQuery('select a.HTTPS_DOMAIN, '
           +'       a.HTTPS_PORT, '
           +'       c.NM_DATABASE '
           +'  from SERVER_LIST   a inner join '
           +'       COMPANY       b on b.ID_SERVER = a.ID_SERVER inner join '
           +'       DATABASE_LIST c on c.ID_SERVER = b.ID_SERVER and c.DB_SEQ = b.DB_SEQ '
           +' where a.DS_SERVER  =''O'' '
           +' group by a.HTTPS_DOMAIN, a.HTTPS_PORT, c.NM_DATABASE ',
           [], false, RestBaseURL);
  while not Query.Eof do
  begin
    vURL := Format('https://%s:%s/Orange/|%s',[Query.FieldByName('HTTPS_DOMAIN').AsString,
                                               Query.FieldByName('HTTPS_PORT').AsString,
                                               Query.FieldByName('NM_DATABASE').AsString]);

    ExecQuery(vTempSQL, [], true, vURL);
    Query.Next;
  end;
  Query.Close;
end;


end.
