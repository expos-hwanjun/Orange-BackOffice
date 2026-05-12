unit SystemProgramLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, cxMemo;

type
  TSystemProgramLogForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  SystemProgramLogForm: TSystemProgramLogForm;

implementation
uses Common, DbModule;
{$R *.dfm}

{ TSystemProgramLogShowForm }

function TSystemProgramLogForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select a.PROGRAM_ID, '
             +'       a.PROGRAM_NAME, '
             +'       ConCat(c.NM_SAWON,''('',a.CD_SAWON,'')'') as CD_SAWON, '
             +'       a.DT_CHANGE, '
             +'       a.IP_ADDRESS, '
             +'       a.MAC_ADDRESS, '
             +'       a.VERSION '
             +'  from PROGRAM_LOG a inner join '
             +'       MS_SAWON    c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_SAWON = c.CD_SAWON '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and Date_Format(a.DT_CHANGE, ''%Y%m%d'') between :P2 and :P3 '
             +' order by a.DT_CHANGE ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else
  begin
    try
      OpenQuery('select StoD(YMD_LOG) as YMD_LOG, '
               +'       DS_LOG, '
               +'       NO_POS, '
               +'       FORM_NAME, '
               +'       ACTION_NAME, '
               +'       LOG_TEXT, '
               +'       VERSION, '
               +'       DT_INSERT '
               +'  from LOG '
               +' where CD_COMPANY  =:P0 '
               +'   and CD_CUSTOMER =:P1 '
               +'   and YMD_LOG between :P2 and :P3 '
               +'   and LOG_TEXT like ConCat(''%'',:P4,''%'') '
               +' order by DT_INSERT ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text], false, RestBaseURL);
      Result := DM.ReadQuery(Query, GridTableView1);
    finally
    end;
  end;

end;

procedure TSystemProgramLogForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = Ord('L')) then
    Grid.RootLevelOptions.DetailTabsPosition := dtpTop;
end;

end.
