unit StoreCustomerLicenseShow;

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
  cxCurrencyEdit;

type
  TStoreCustomerLicenseShowForm = class(TInheritShowForm)
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
    procedure FormCreate(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override;                      // 조회
  public
    { Public declarations }
  end;

var
  StoreCustomerLicenseShowForm: TStoreCustomerLicenseShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStoreCustomerLicenseShowForm }
procedure TStoreCustomerLicenseShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
end;

function TStoreCustomerLicenseShowForm.DoSearch: Boolean;
begin
  OpenQuery('select StoD(a.YMD_PAY) as YMD_PAY, '
           +'       a.CD_CUSTOMER, '
           +'       b.NM_CUSTOMER, '
           +'       case when a.DS_PAY = ''B'' then ''계좌입금'' else ''프로그램'' end as DS_PAY, '
           +'       a.AMT_PAY, '
           +'       a.MONTH_COUNT, '
           +'       b.AMT_ASP, '
           +'       a.REMARK, '
           +'       a.ID_USER, '
           +'       a.DT_INSERT '
           +'  from CUSTOMER_PAY  as a inner join '
           +'       CUSTOMER      as b on b.CD_CUSTOMER = a.CD_CUSTOMER '
           +' where a.YMD_PAY between :P0 and :P1 '
           +'   and (a.CD_CUSTOMER =:P2 or b.NM_CUSTOMER like ConCat(''%'',:P2,''%'')) '
           +' order by a.YMD_PAY, a.DT_INSERT ',
           [DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;
end.
