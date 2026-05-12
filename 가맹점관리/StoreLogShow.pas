unit StoreLogShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxTimeEdit;

type
  TStoreLogShowForm = class(TInheritShowForm)
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
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  StoreLogShowForm: TStoreLogShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStoreLogShowForm }

function TStoreLogShowForm.DoSearch: Boolean;
begin
  OpenQuery('select b.NM_COMPANY, '
           +'       ConCat(a.CD_CUSTOMER,''-'',c.NM_CUSTOMER) as STORE, '
           +'       StoD(a.YMD_LOG) as YMD_LOG, '
           +'       a.NO_POS, '
           +'       a.FORM_NAME, '
           +'       a.ACTION_NAME, '
           +'       a.ACTION_TEXT, '
           +'       a.LOG_TEXT, '
           +'       a.DT_INSERT, '
           +'       a.VERSION '
           +'  from LOG      as a inner join '
           +'       COMPANY  as b on b.CD_COMPANY = a.CD_COMPANY inner join '
           +'       CUSTOMER as c on c.CD_COMPANY = a.CD_COMPANY and c.CD_CUSTOMER = a.CD_CUSTOMER '
           +' where a.YMD_LOG between :P0 and :P1 '
           +'   and (a.CD_CUSTOMER =:P2 or c.NM_CUSTOMER like ConCat(''%'',:P2,''%'')) '
           +' order by a.IDX ',
           [DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

end.
