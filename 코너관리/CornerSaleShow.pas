unit CornerSaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, StdCtrls, CheckLst, ExtCtrls,
  AdvPanel, cxButtonEdit, cxGridCustomTableView, cxGridTableView, AdvToolBar,
  AdvToolBarStylers, cxContainer, Uni, DB, MemDS, ImgList, Menus,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils,
  cxGridBandedTableView, cxMemo, Math, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCornerSaleShowForm = class(TInheritShowForm)
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableView2: TcxGridTableView;
    GridTableViewColumn7: TcxGridColumn;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView1Column2: TcxGridBandedColumn;
    GridBandedTableView1Column3: TcxGridBandedColumn;
    GridBandedTableView1Column4: TcxGridBandedColumn;
    GridBandedTableView1Column5: TcxGridBandedColumn;
    GridBandedTableView1Column6: TcxGridBandedColumn;
    GridBandedTableView1Column7: TcxGridBandedColumn;
    GridBandedTableView1Column8: TcxGridBandedColumn;
    GridBandedTableView1Column9: TcxGridBandedColumn;
    GridBandedTableView1Column10: TcxGridBandedColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  CornerSaleShowForm: TCornerSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCornerSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TCornerSaleShowForm.DoSearch:Boolean;
begin
  OpenQuery('select ConCat(Left(t3.YMD_SALE,4),''년 '',SubString(t3.YMD_SALE,5,2),''월'') as YM_SALE, '
           +'       t1.CD_TRDPL, '
           +'       Max(t1.NM_TRDPL) as NM_TRDPL, '
           +'       SUM(Ifnull(t3.AMT_SALE,0)) as AMT_SALE, '
           +'       SUM(Ifnull(t3.AMT_CARD_VAN,0)) as AMT_CARD_VAN, '
           +'       SUM(Ifnull(t3.AMT_SALE_FEE,0) + Ifnull(t3.AMT_CASH_FEE,0) + Ifnull(t3.AMT_CASHRCP_FEE,0) + Ifnull(t3.AMT_CARD_FEE,0) + Ifnull(t3.AMT_POINT_FEE,0) ) as AMT_SALE_FEE, '
           +'       SUM(Ifnull(t3.AMT_POINT_OCCUR_FEE,0)) as AMT_POINT_OCCUR_FEE, '
           +'       SUM(Ifnull(t3.AMT_SALE,0)) - '
           +'       SUM(Ifnull(t3.AMT_SALE_FEE,0) + Ifnull(t3.AMT_CASH_FEE,0) + Ifnull(t3.AMT_CASHRCP_FEE,0) + Ifnull(t3.AMT_CARD_FEE,0)) - '
           +'       SUM(Ifnull(t3.AMT_CARD_VAN,0)) - '
           +'       SUM(Ifnull(t3.AMT_POINT_OCCUR_FEE,0)) as AMT_TOT_FEE, '
           +'       Sum(Ifnull(t3.AMT_CARD,0) - Ifnull(t3.AMT_CARD_VAN,0)) as AMT_CARD_MART '
           +'  from MS_TRD t1 inner join '
           +'       SL_TRD_DAY t3 on t1.CD_HEAD  = t3.CD_HEAD '
           +'                    and t1.CD_STORE = t3.CD_STORE '
           +'                    and t1.CD_TRDPL = t3.CD_TRDPL '
           +'                    and t3.YMD_SALE between :P2 and :P3 '
           +' where t1.CD_HEAD  = :P0 '
           +'   and t1.CD_STORE = :P1 '
           +'   and t1.DS_TRDPL = ''C'' '
           +'group by ConCat(Left(t3.YMD_SALE,4),''년 '',SubString(t3.YMD_SALE,5,2),''월''), t1.CD_TRDPL ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  DM.ReadQuery(Query, GridTableView);

  Result := GridTableView.DataController.RecordCount > 0;
end;

procedure TCornerSaleShowForm.FormShow(Sender: TObject);
begin
  inherited;
  OpenQuery('select StoDW(Max(YMD_SALE)) '
           +'  from SL_TRD_DAY '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +' order by YMD_SALE desc',
            [HeadStoreCode,
             StoreCode]);
  if not Query.Eof then
    ConditionToolBarEditLabel.Caption := ' ※ 수수료 재계산 최종일자 : '+Query.Fields[0].AsString
  else
    ConditionToolBarEditLabel.Caption := ' ※ 수수료 재계산 최종일자 : 없음 ';
  FinishQuery;
end;

end.
