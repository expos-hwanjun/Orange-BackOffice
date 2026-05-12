unit BuyOrderBuyShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon,
  Menus, ImgList, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxPSPrVwRibbon,
  dxSkinsdxBarPainter, DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TBuyOrderBuyShowForm = class(TInheritShowForm)
    GridTableViewOrderDate: TcxGridColumn;
    GridTableViewOrderNo: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewOrderAmt: TcxGridColumn;
    GridTableViewBuyDate: TcxGridColumn;
    GridTableViewBuyNo: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
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
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  BuyOrderBuyShowForm: TBuyOrderBuyShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TBuyOrderBuyShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddLastWeek;
  PrintMode   := pmPreviewExcel;
  ConditionToolBarComboBox.ItemIndex := 0;
end;

procedure TBuyOrderBuyShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ButtonToolBarSearchButton.Enabled := Grid.ActiveLevel = GridLevel;
end;

procedure TBuyOrderBuyShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

function TBuyOrderBuyShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   dbo.StoD(a.YMD_ORDER) as YMD_ORDER, '
            +'         a.NO_ORDER, '
            +'         b.NM_TRDPL, '
            +'         a.AMT_ORDER, '
            +'         dbo.StoD(SubString(a.NO_BUY_REF,1,8)) as YMD_BUY, '
            +'         SubString(a.NO_BUY_REF,9,4) as NO_BUY, '
            +'         Isnull(c.AMT_BUY,0) as AMT_BUY, '
            +'         a.NO_BUY_REF '
            +'from     SL_ORDER_H as a inner join '
            +'         MS_TRD     as b on a.CD_STORE = b.CD_STORE and a.CD_TRDPL = b.CD_TRDPL left outer join '
             +'        SL_BUY_H   as c on a.CD_STORE = c.CD_STORE and Left(a.NO_BUY_REF,8) = c.YMD_BUY and Right(a.NO_BUY_REF,4) = c.NO_BUY '
            +'where    a.CD_STORE = :P0 '
            +'  and    a.YMD_ORDER between :P1 and :P2 '
            +'  and    ((:P3 = 0 and a.NO_BUY_REF is null) or (:P3 = 1 and a.NO_BUY_REF is not null) or (:P3 = 2)) '
            +'order by a.CD_STORE, a.YMD_ORDER, a.NO_ORDER',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarComboBox.ItemIndex]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else
  begin
    OpenQuery('select   a.CD_GOODS, '
             +'         b.NM_GOODS, '
             +'         b.NM_SPEC, '
             +'         a.QTY_ORDER, '
             +'         a.PR_ORDER, '
             +'         a.AMT_ORDER, '
             +'         c.QTY_BUY, '
             +'         c.PR_BUY, '
             +'         c.AMT_BUY '
             +'from     SL_ORDER_D as a inner join '
             +'         MS_GOODS   as b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS left outer join '
             +'         SL_BUY_D   as c on a.CD_STORE = c.CD_STORE and a.CD_GOODS = c.CD_GOODS and c.YMD_BUY =:P3 and c.NO_BUY =:P4 '
             +'where    a.CD_STORE = :P0 '
             +'  and    a.YMD_ORDER =:P1 '
             +'  and    a.NO_ORDER  =:P2 '
             +'order by a.CD_STORE, a.YMD_ORDER, a.NO_ORDER',
              [StoreCode,
               GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderDate.Index]),
               GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderNo.Index],
               NVL(GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyDate.Index]),''),
               NVL(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyNo.Index],'') ]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end;
end;

end.
