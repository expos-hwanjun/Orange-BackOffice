unit SaleKeepingShow;

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
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton;

type
  TSaleKeepingShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleKeepingShowForm: TSaleKeepingShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ TSaleKeepingShowForm }

function TSaleKeepingShowForm.DoSearch: Boolean;
begin
  OpenQuery('select dbo.StoD(a.YMD_KEEP) as YMD_KEEP, '
           +'       a.NO_KEEP, '
           +'       case a.DS_STATUS when ''0'' then ''킵핑'' when ''1'' then ''판매'' when ''2'' then ''폐기'' end as DS_STATUS, '
           +'       a.CUST_NAME, '
           +'       a.CD_MEMBER, '
           +'       dbo.FormatTelePhone(a.TEL_MOBIL) as TEL_MOBIL, '
           +'       d.NM_MENU, '
           +'       b.NM_SAWON, '
           +'       Convert(Varchar(10), sale_date, 120) as YMD_SALE, '
           +'       c.NM_SAWON as NM_DAMDANG, '
           +'       a.REMARK '
           +'  from SL_KEEPING a left outer join '
           +'       MS_SAWON   b on a.CD_STORE = b.CD_STORE and a.KEEP_SAWON = b.CD_SAWON left outer join '
           +'       MS_SAWON   c on a.CD_STORE = c.CD_SAWON and a.SALE_SAWON = c.CD_SAWON left outer join '
           +'       MS_MENU    d on a.CD_STORE = d.CD_STORE and a.CD_MENU    = d.CD_MENU '
           +' where a.CD_STORE =:P0 '
           +'   and a.YMD_KEEP between :P1 and :P2 '
           +' order by a.YMD_KEEP, a.NO_KEEP ',
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TSaleKeepingShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매출관리/킵핑내역%20조회/킵핑내역%20조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

end.
