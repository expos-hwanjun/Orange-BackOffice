unit HeadLogisticsBySaleShow;

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
  THeadLogisticsBySaleShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableViewLogisticsCode: TcxGridColumn;
    GridLevel2: TcxGridLevel;
    GridTableView2: TcxGridTableView;
    GridTableView2Column1: TcxGridColumn;
    GridTableView2Column2: TcxGridColumn;
    GridTableView2Column3: TcxGridColumn;
    GridTableView2Column4: TcxGridColumn;
    GridTableView2Column5: TcxGridColumn;
    GridTableView2Column6: TcxGridColumn;
    GridTableView2Column8: TcxGridColumn;
    GridTableView1StoreCode: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadLogisticsBySaleShowForm: THeadLogisticsBySaleShowForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

procedure THeadLogisticsBySaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
end;


function THeadLogisticsBySaleShowForm.DoSearch: Boolean;
begin
  OpenQuery('select Max(b.NM_TRDPL) as NM_LOGISTICS, '
           +'       Sum(a.AMT_DUTY) as AMT_NET, '
           +'       Sum(a.AMT_TAX) as AMT_TAX, '
           +'       Sum(a.AMT_DUTYFREE) as AMT_DUTYFREE, '
           +'       Sum(a.AMT_SALE) as AMT_SALE, '
           +'       a.CD_LOGISTICS '
           +'  from OL_SALE_H  a inner join '
           +'       MS_TRD     b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = ''00000000'' and b.CD_TRDPL = a.CD_LOGISTICS '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE between :P1 and :P2 '
           +' group by a.CD_LOGISTICS '
           +' order by a.CD_LOGISTICS ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;




procedure THeadLogisticsBySaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  OpenQuery('select Max(b.NM_STORE) as NM_STORE, '
           +'       Sum(a.AMT_DUTY) as AMT_NET, '
           +'       Sum(a.AMT_TAX) as AMT_TAX, '
           +'       Sum(a.AMT_DUTYFREE) as AMT_DUTYFREE, '
           +'       Sum(a.AMT_SALE) as AMT_SALE, '
           +'       a.CD_STORE '
           +'  from OL_SALE_H  a inner join '
           +'       MS_STORE   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE between :P1 and :P2 '
           +'   and a.CD_LOGISTICS = :P3 '
           +' group by a.CD_STORE '
           +' order by a.CD_STORE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLogisticsCode.Index]]);

  DM.ReadQuery(Query, GridTableView1);
  Grid.ActiveLevel := GridLevel1;
end;

procedure THeadLogisticsBySaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  OpenQuery('select StoDW(YMD_SALE) as YMD_SALE, '
           +'       NO_SALE, '
           +'       AMT_DUTY as AMT_NET, '
           +'       AMT_TAX, '
           +'       AMT_DUTYFREE, '
           +'       AMT_SALE, '
           +'       ORDER_REF, '
           +'       DT_INSERT '
           +'  from OL_SALE_H   '
           +' where CD_HEAD  =:P0 '
           +'   and YMD_SALE between :P1 and :P2 '
           +'   and CD_LOGISTICS = :P3 '
           +'   and CD_STORE     = :P4 '
           +' order by YMD_SALE, NO_SALE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLogisticsCode.Index],
            GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1StoreCode.Index]]);

  DM.ReadQuery(Query, GridTableView2);
  Grid.ActiveLevel := GridLevel2;
end;

end.
