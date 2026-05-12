unit StoreSMSCountShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLabel, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton;

type
  TStoreSMSCountShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  StoreSMSCountShowForm: TStoreSMSCountShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStoreSMSCountShowForm }

function TStoreSMSCountShowForm.DoSearch: Boolean;
begin
  OpenQuery('select a.CD_CUSTOMER, '
           +'       b.NM_CUSTOMER, '
           +'       case b.DS_CUSTOMER when ''O'' then ''CloudOrange'' when ''E'' then ''ERP'' when ''M'' then ''Mart'' when ''T'' then ''Themark'' end DS_PROGRAM, '
           +'       a.AMT_CHARGE, '
           +'       a.AMT_USE, '
           +'       a.AMT_FAILURE, '
           +'       a.AMT_CHARGE - a.AMT_USE + a.AMT_FAILURE as AMT_REST '
           +'  from SMS_COUNT   as a inner join '
           +'       SMS_CUSTOMER as b on b.CD_CUSTOMER = a.CD_CUSTOMER '
           +' where a.CD_CUSTOMER = :P0 or b.NM_CUSTOMER like ConCat(''%'',:P0,''%'') '
           +' order by a.CD_CUSTOMER ',
           [ConditionToolBarEdit.Text],false,jsonSMSDBURL);
  Result := DM.ReadQuery(Query, GridTableView);

end;

procedure TStoreSMSCountShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
end;

end.
