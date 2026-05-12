unit StoreScript;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, IPPeerClient, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxLabel, cxMaskEdit, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxTextEdit, cxDropDownEdit,
  cxCalendar, AdvGlowButton, StrUtils;

type
  TStoreScriptForm = class(TInheritForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewColumn2: TcxGridColumn;
    GridLevel: TcxGridLevel;
    ScriptMemo: TcxMemo;
    ButtonToolBarSearchButton: TAdvGlowButton;
    OpenDialog: TOpenDialog;
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetScriptList;
  public
    { Public declarations }
  end;

var
  StoreScriptForm: TStoreScriptForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TStoreScriptForm.ButtonToolBarSearchButtonClick(Sender: TObject);
var vDsScript  :String;
begin
  inherited;
  if not OpenDialog.Execute then Exit;
  ScriptMemo.Lines.LoadFromFile(OpenDialog.FileName);
  if not AskBox('스크립트를 업로드 하시겠습니까?') then Exit;

  DM.ExecQuery('insert into POS_SCRIPT(DB_VERSION, '
              +'                       DS_SCRIPT, '
              +'                       FILE_NAME, '
              +'                       DT_CHANGE) '
              +'               values((select cast(ifnull(MAX(s.DB_VERSION), Date_Format(NOW(),''%Y%m%d0''))+1 AS CHAR) '
              +'                         from POS_SCRIPT as s '
              +'                        where DS_SCRIPT = ''C'' '
              +'                          and left(s.DB_VERSION,8) = Date_Format(NOW(),''%Y%m%d'')), '
              +'                        ''C'', '
              +'                        :P0, '
              +'                         NOW());',
              [RightStr(OpenDialog.FileName,13)],true,RestBaseURL);
  SetScriptList;
end;

procedure TStoreScriptForm.FormShow(Sender: TObject);
begin
  inherited;
  SetScriptList;
end;

procedure TStoreScriptForm.SetScriptList;
begin
  inherited;
  DM.OpenQuery('select DB_VERSION '
              +'  from POS_SCRIPT '
              +' where DS_SCRIPT = ''C'' '
              +' order by DB_VERSION ',
              [],false,RestBaseURL);
  DM.ReadQuery(DM.Query, GridTableView);
end;

end.
