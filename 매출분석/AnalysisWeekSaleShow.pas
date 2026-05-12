unit AnalysisWeekSaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, cxProgressBar, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, AdvOfficeTabSet, ImgList, Menus,
  AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer, Uni, DB,
  MemDS, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  StdCtrls, clisted, StrUtils, Math, cxButtonEdit, cxCheckComboBox, cxCheckBox,
  cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSPrVwRibbon, DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisWeekSaleShowForm = class(TInheritShowForm)
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedSaleQtyColum: TcxGridBandedColumn;
    GridBandedSaleAmtColum: TcxGridBandedColumn;
    GridBandedTableView1MenuName: TcxGridBandedColumn;
    GridBandedSaleQty1Colum: TcxGridBandedColumn;
    GridBandedSaleRate1Colum: TcxGridBandedColumn;
    GridBandedSaleAmt1Colum: TcxGridBandedColumn;
    GridBandedSaleQty2Colum: TcxGridBandedColumn;
    GridBandedSaleRate2Colum: TcxGridBandedColumn;
    GridBandedSaleAmt2Colum: TcxGridBandedColumn;
    GridBandedSaleQty3Colum: TcxGridBandedColumn;
    GridBandedSaleRate3Colum: TcxGridBandedColumn;
    GridBandedSaleAmt3Colum: TcxGridBandedColumn;
    GridBandedSaleQty4Colum: TcxGridBandedColumn;
    GridBandedSaleRate4Colum: TcxGridBandedColumn;
    GridBandedSaleAmt4Colum: TcxGridBandedColumn;
    GridBandedSaleQty5Colum: TcxGridBandedColumn;
    GridBandedSaleRate5Colum: TcxGridBandedColumn;
    GridBandedSaleAmt5Colum: TcxGridBandedColumn;
    GridBandedSaleQty6Colum: TcxGridBandedColumn;
    GridBandedSaleRate6Colum: TcxGridBandedColumn;
    GridBandedSaleAmt6Colum: TcxGridBandedColumn;
    GridBandedSaleRateColum: TcxGridBandedColumn;
    GridBandedTableView1Class: TcxGridBandedColumn;
    procedure ConditionTabSetChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisWeekSaleShowForm: TAnalysisWeekSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TAnalysisWeekSaleShowForm.ConditionTabSetChange(Sender: TObject);
begin
  inherited;
  DoSearch;
end;

function TAnalysisWeekSaleShowForm.DoSearch:Boolean;
var vIndex :Integer;
begin
  inherited;
  OpenQuery('select Ifnull(c.NM_CLASS,''[미지정]'') as NM_CLASS, '
           +'       t.CD_MENU, '
           +'       Max(t.NM_MENU) as NM_MENU, '
           +'       SUM(t.AMT_SALE_TOT) as AMT_SALE_TOT, '
           +'       SUM(t.QTY_SALE_SUN) as QTY_SALE_SUN, '
           +'       SUM(t.QTY_SALE_MON) as QTY_SALE_MON, '
           +'       SUM(t.QTY_SALE_TUE) as QTY_SALE_TUE, '
           +'       SUM(t.QTY_SALE_WED) as QTY_SALE_WED, '
           +'       SUM(t.QTY_SALE_THU) as QTY_SALE_THU, '
           +'       SUM(t.QTY_SALE_FRI) as QTY_SALE_FRI, '
           +'       SUM(t.QTY_SALE_SAT) as QTY_SALE_SAT, '
           +'       SUM(t.AMT_SALE_SUN) as AMT_SALE_SUN, '
           +'       SUM(t.AMT_SALE_MON) as AMT_SALE_MON, '
           +'       SUM(t.AMT_SALE_TUE) as AMT_SALE_TUE, '
           +'       SUM(t.AMT_SALE_WED) as AMT_SALE_WED, '
           +'       SUM(t.AMT_SALE_THU) as AMT_SALE_THU, '
           +'       SUM(t.AMT_SALE_FRI) as AMT_SALE_FRI, '
           +'       SUM(t.AMT_SALE_SAT) as AMT_SALE_SAT,  '
           +'       Round(DivFlt(SUM(t.AMT_SALE_SUN), SUM(t.AMT_SALE_TOT)) * 100,2) as  RATE_SALE_SUN, '
           +'       Round(DivFlt(SUM(t.AMT_SALE_MON), SUM(t.AMT_SALE_TOT)) * 100,2) as  RATE_SALE_MON, '
           +'       Round(DivFlt(SUM(t.AMT_SALE_TUE), SUM(t.AMT_SALE_TOT)) * 100,2) as  RATE_SALE_TUE, '
           +'       Round(DivFlt(SUM(t.AMT_SALE_WED), SUM(t.AMT_SALE_TOT)) * 100,2) as  RATE_SALE_WED, '
           +'       Round(DivFlt(SUM(t.AMT_SALE_THU), SUM(t.AMT_SALE_TOT)) * 100,2) as  RATE_SALE_THU, '
           +'       Round(DivFlt(SUM(t.AMT_SALE_FRI), SUM(t.AMT_SALE_TOT)) * 100,2) as  RATE_SALE_FRI, '
           +'       Round(DivFlt(SUM(t.AMT_SALE_SAT), SUM(t.AMT_SALE_TOT)) * 100,2) as  RATE_SALE_SAT  '
           +'  from  '
           +'       ( '
           +'        select Left(m.CD_CLASS,2) as CD_CLASS, '
           +'               d.CD_MENU, '
           +'               m.NM_MENU, '
           +'               sum(d.AMT_SALE-d.DC_TOT) as AMT_SALE_TOT, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''1'' then sum(d.QTY_SALE) else 0 end as QTY_SALE_SUN, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''2'' then sum(d.QTY_SALE) else 0 end as QTY_SALE_MON, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''3'' then sum(d.QTY_SALE) else 0 end as QTY_SALE_TUE, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''4'' then sum(d.QTY_SALE) else 0 end as QTY_SALE_WED, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''5'' then sum(d.QTY_SALE) else 0 end as QTY_SALE_THU, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''6'' then sum(d.QTY_SALE) else 0 end as QTY_SALE_FRI, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''7'' then sum(d.QTY_SALE) else 0 end as QTY_SALE_SAT, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''1'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_SUN, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''2'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_MON, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''3'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_TUE, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''4'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_WED, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''5'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_THU, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''6'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_FRI, '
           +'               case when DAYOFWEEK(d.YMD_SALE) = ''7'' then sum(d.AMT_SALE-d.DC_TOT) else 0 end as AMT_SALE_SAT  '
           +'          from SL_SALE_D_SUM d left outer join  '
           +'               MS_MENU       m on d.CD_HEAD = m.CD_HEAD and d.CD_STORE = m.CD_STORE and d.CD_MENU = m.CD_MENU '
           +'         where d.CD_HEAD  =:P0 '
           +'           and d.CD_STORE =:P1 '
           +'           and d.YMD_SALE between :P2 and :P3'
           +'         group by d.YMD_SALE, d.CD_MENU, m.NM_MENU '
           +'      ) as t left outer join '
           +'      MS_MENU_CLASS as c on c.CD_HEAD =:P0 and c.CD_STORE = :P1 and c.CD_CLASS = t.CD_CLASS '
           +'  group by t.CD_MENU '
           +' order by c.CD_CLASS, t.AMT_SALE_TOT DESC ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridBandedTableView1);
  if not Result then Exit;

  DM.GroupGridTable(GridBandedTableView1,
                    GridBandedTableView1Class.Index,
                    GridBandedTableView1MenuName.Index,
                      ' [ 소 계 ] ',
                   [GridBandedSaleAmtColum.Index,
                    GridBandedSaleAmt1Colum.Index,
                    GridBandedSaleAmt2Colum.Index,
                    GridBandedSaleAmt3Colum.Index,
                    GridBandedSaleAmt4Colum.Index,
                    GridBandedSaleAmt5Colum.Index,
                    GridBandedSaleAmt6Colum.Index,
                    GridBandedSaleQtyColum.Index,
                    GridBandedSaleQty1Colum.Index,
                    GridBandedSaleQty2Colum.Index,
                    GridBandedSaleQty3Colum.Index,
                    GridBandedSaleQty4Colum.Index,
                    GridBandedSaleQty5Colum.Index,
                    GridBandedSaleQty6Colum.Index]);
end;

procedure TAnalysisWeekSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TAnalysisWeekSaleShowForm.GridBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if (ARecord.Values[GridBandedTableView1MenuName.Index] = ' [ 소 계 ] ')
    or (ARecord.Values[GridBandedTableView1MenuName.Index] = ' [ 합 계 ] ') then
    AStyle := StyleFontBlackBold;

end;

end.
