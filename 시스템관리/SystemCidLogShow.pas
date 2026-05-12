unit SystemCidLogShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset;

type
  TSystemCidLogShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  SystemCidLogShowForm: TSystemCidLogShowForm;

implementation
uses
  Common, DBModule;
{$R *.dfm}

{ TSaleCidLogShowForm }

function TSystemCidLogShowForm.DoSearch: Boolean;
begin
  OpenQuery('select GetPhoneNo(NO_TEL) as NO_TEL, '
           +'       DT_CALL, '
           +'       NO_LINE '
           +'  from SL_CID_LOG '
           +' where CD_STORE =:P0 '
           +'   and Convert(Varchar(8), DT_CALL, 112)  between :P1 and :P2 '
           +'   and NO_TEL like ''%'' + :P3 '
           +' order by SEQ',
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             ConditionToolBarEdit.Text]);
  DM.ReadQuery(Query, GridTableView);
  Result := GridTableView.DataController.RecordCount > 0;
end;

procedure TSystemCidLogShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/시스템관리/CID로그조회/CID로그조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

end.
