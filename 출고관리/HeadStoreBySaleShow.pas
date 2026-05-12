unit HeadStoreBySaleShow;

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
  THeadStoreBySaleShowForm = class(TInheritShowForm)
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewTaxAmt: TcxGridColumn;
    GridTableViewDutyfreeAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewStoreCode: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    GridTableView1Column10: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadStoreBySaleShowForm: THeadStoreBySaleShowForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

procedure THeadStoreBySaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
end;



function THeadStoreBySaleShowForm.DoSearch: Boolean;
begin
  OpenQuery('select Max(b.NM_STORE) as NM_STORE, '
           +'       Sum(a.AMT_DUTY) as AMT_NET, '
           +'       Sum(a.AMT_TAX) as AMT_TAX, '
           +'       Sum(a.AMT_DUTYFREE) as AMT_DUTYFREE, '
           +'       Sum(a.AMT_SALE) as AMT_SALE, '
           +'       Sum(a.AMT_SALE - a.AMT_BUY) as AMT_PROFIT, '
           +'       GetProfitRate(Sum(a.AMT_BUY),  Sum(a.AMT_SALE)) as RATE_PROFIT, '
           +'       a.CD_STORE '
           +'  from OL_SALE_H  a inner join '
           +'       MS_STORE   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE between :P1 and :P2 '
           +' group by a.CD_STORE '
           +' order by a.CD_STORE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);

end;

procedure THeadStoreBySaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  OpenQuery('select StoDW(a.YMD_SALE) as YMD_SALE, '
           +'       a.NO_SALE, '
           +'       b.NM_TRDPL as NM_LOGISTICS, '
           +'       a.AMT_DUTY as AMT_NET, '
           +'       a.AMT_TAX, '
           +'       a.AMT_DUTYFREE, '
           +'       a.AMT_SALE, '
           +'       a.AMT_SALE - a.AMT_BUY as AMT_PROFIT, '
           +'       GetProfitRate(a.AMT_BUY,  a.AMT_SALE) as RATE_PROFIT, '
           +'       a.ORDER_REF, '
           +'       a.DT_INSERT '
           +'  from OL_SALE_H as a inner join  '
           +'       MS_TRD    as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = ''00000000'' and b.CD_TRDPL = a.CD_LOGISTICS '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE between :P1 and :P2 '
           +'   and a.CD_STORE     = :P3 '
           +' order by a.YMD_SALE, a.NO_SALE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index]]);
  DM.ReadQuery(Query, GridTableView1);
end;
end.
