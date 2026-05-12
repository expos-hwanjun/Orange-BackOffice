unit StoreSmsChargeShow;

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
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit;

type
  TStoreSmsChargeShowForm = class(TInheritShowForm)
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
    GridTableViewColumn12: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // 조회
  end;

var
  StoreSmsChargeShowForm: TStoreSmsChargeShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStoreSmsChargeShowForm }

function TStoreSmsChargeShowForm.DoSearch: Boolean;
begin
  OpenQuery('select a.CD_CUSTOMER, '
           +'       b.NM_CUSTOMER, '
           +'       StoD(a.YMD_CHARGE) as YMD_CHARGE, '
           +'       case b.DS_CUSTOMER when ''O'' then ''CloudOrange'' when ''E'' then ''ERP'' when ''M'' then ''Mart'' when ''T'' then ''Themark'' when ''S'' then ''Sauna'' end DS_PROGRAM, '
           +'       case when a.DS_CHARGE = ''A'' then ''계좌입금'' else ''프로그램충전'' end DS_CHARGE, '
           +'       a.AMT_CHARGE, '
           +'       a.AMT_RECEIVE, '
           +'       a.DC_RATE, '
           +'       a.NOTE as REMARK, '
           +'       a.USER_ID, '
           +'       a.DT_INSERT '
           +'  from SMS_CHARGE   as a inner join '
           +'       SMS_CUSTOMER as b on b.CD_CUSTOMER = a.CD_CUSTOMER  '
           +' where a.YMD_CHARGE between :P0 and :P1 '
           +' order by a.YMD_CHARGE, a.SEQ ',
           [DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)],false,jsonSMSDBURL);
  Result := DM.ReadQuery(Query, GridTableView);

end;

procedure TStoreSmsChargeShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
end;

end.
