unit SystemStoreAuth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, Menus, StdCtrls, cxButtons, ExtCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, AdvToolBar, AdvToolBarStylers, DBAccess, Uni, DB,
  MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton;

type
  TSystemStoreAuthForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    GridTableViewSawonCode: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    Panel3: TPanel;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    FromGridTableView: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxGrid2: TcxGrid;
    ToGridTableView: TcxGridTableView;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    Panel4: TPanel;
    AddButton: TcxButton;
    DelButton: TcxButton;
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // Á¶È¸
    function  DoSave:Boolean; override;
  end;

var
  SystemStoreAuthForm: TSystemStoreAuthForm;

implementation
uses Common;
{$R *.dfm}

{ TSystemStoreAuthForm }

procedure TSystemStoreAuthForm.AddButtonClick(Sender: TObject);
begin
  inherited;
  if FromGridTableView.DataController.GetFocusedRecordIndex >= 0 then
  begin
    ToGridTableView.DataController.Edit;
    ToGridTableView.DataController.AppendRecord;
    ToGridTableView.DataController.Values[ToGridTableView.DataController.RowCount-1, 0] := FromGridTableView.DataController.Values[FromGridTableView.DataController.GetFocusedRecordIndex, 0];
    ToGridTableView.DataController.Values[ToGridTableView.DataController.RowCount-1, 1] := FromGridTableView.DataController.Values[FromGridTableView.DataController.GetFocusedRecordIndex, 1];
    FromGridTableView.DataController.DeleteRecord(FromGridTableView.DataController.GetFocusedRecordIndex);
    ToGridTableView.DataController.Post;
    isChanged := true;
  end;
end;

procedure TSystemStoreAuthForm.DelButtonClick(Sender: TObject);
begin
  inherited;
  if ToGridTableView.DataController.GetFocusedRecordIndex >= 0 then
  begin
    FromGridTableView.DataController.Edit;
    FromGridTableView.DataController.AppendRecord;
    FromGridTableView.DataController.Values[FromGridTableView.DataController.RowCount-1, 0] := ToGridTableView.DataController.Values[ToGridTableView.DataController.GetFocusedRecordIndex, 0];
    FromGridTableView.DataController.Values[FromGridTableView.DataController.RowCount-1, 1] := ToGridTableView.DataController.Values[ToGridTableView.DataController.GetFocusedRecordIndex, 1];
    ToGridTableView.DataController.DeleteRecord(ToGridTableView.DataController.GetFocusedRecordIndex);
    FromGridTableView.DataController.Post;
    isChanged := true;
  end;
end;

function TSystemStoreAuthForm.DoSave: Boolean;
var vIndex :Integer;
begin
  try
    BeginTrans;

    ExecQuery('delete from MS_SAWON_AUTH '
             +'where CD_SAWON =:P0',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonCode.Index],
              false]);

    for vIndex := 0 to ToGridTableView.DataController.RowCount - 1 do
      ExecQuery('insert into MS_SAWON_AUTH(CD_SAWON, CD_STORE, CD_SAWON_CHG, DT_CHANGE) '
               +'                   values(:P0, :P1, :P2, getdate() )',
               [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonCode.Index],
                ToGridTableView.DataController.Values[vIndex, 0],
                UserCode,
                false]);
    CommitTrans;
    Result := true;
  except
    on E: Exception do
    begin
      RollbackTrans;;
      ErrBox(E.Message);
      Result := false;
    end;
  end;

end;

function TSystemStoreAuthForm.DoSearch: Boolean;
begin
  OpenQuery('select CD_SAWON, NM_SAWON '
           +'from   MS_SAWON '
           +'order by CD_SAWON ',[]);
  ReadQuery(GridTableView);
  if GridTableView.DataController.RowCount > 0 then
    GridTableView.DataController.FocusedRecordIndex := 0;
end;

procedure TSystemStoreAuthForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

  OpenQuery('select CD_STORE, NM_STORE '
           +'from   MS_STORE '
           +'where  CD_STORE not in (select CD_STORE from MS_SAWON_AUTH where CD_SAWON=:P0)',
           [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonCode.Index]]);
  ReadQuery(FromGridTableView);

  OpenQuery('select m.CD_STORE, s.NM_STORE '
           +'from   MS_SAWON_AUTH m inner join '
           +'       MS_STORE s on m.CD_STORE = s.CD_STORE '
           +'where  m.CD_SAWON =:P0 '
           +'order by m.CD_STORE ',
           [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSawonCode.Index]]);
  ReadQuery(ToGridTableView);
end;

end.
