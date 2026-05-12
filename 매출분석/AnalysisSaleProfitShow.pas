unit AnalysisSaleProfitShow;

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
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisSaleProfitShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewGuestCount: TcxGridColumn;
    GridTableViewGuestAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableViewProfitAmt: TcxGridColumn;
    GridTableView1: TcxGridTableView;
    GridTableView1MenuCode: TcxGridColumn;
    GridTableView1MenuName: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1ProfitRate: TcxGridColumn;
    GridTableView1ProfitAmt: TcxGridColumn;
    GridTableView2: TcxGridTableView;
    GridTableView2ClassCode: TcxGridColumn;
    GridTableView2ClassName: TcxGridColumn;
    GridTableView2SaleAmt: TcxGridColumn;
    GridTableView2ProfitRate: TcxGridColumn;
    GridTableView2ProfitAmt: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;
var
  AnalysisSaleProfitShowForm: TAnalysisSaleProfitShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TAnalysisSaleProfitShowForm }
procedure TAnalysisSaleProfitShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매출분석/매출이익조회/매출이익조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TAnalysisSaleProfitShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select StoD(YMD_SALE) as YMD_SALE, '
             +'       AMT_SALE, '
             +'       CNT_CUSTOMER, '
             +'       DivInt(AMT_SALE, CNT_CUSTOMER) as AMT_GUEST, '
             +'       GetProfitRate(AMT_BUY, AMT_SALE) as RT_PROFIT, '
             +'       AMT_SALE - AMT_BUY as AMT_PROFIT '
             +'  from SL_SALE_H_SUM '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_SALE between :P2 and :P3'
             +' order by YMD_SALE ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);

    Result := DM.ReadQuery(Query, GridTableView);
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select a.CD_MENU, '
             +'       Max(b.NM_MENU) as NM_MENU, '
             +'       Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE, '
             +'       Sum(a.AMT_SALE - a.DC_TOT - a.AMT_BUY) as AMT_PROFIT, '
             +'       GetProfitRate(Sum(a.AMT_BUY), Sum(a.AMT_SALE - a.DC_TOT)) as RT_PROFIT '
             +'  from SL_SALE_D_SUM a inner join '
             +'       MS_MENU       b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3'
             +' group by a.CD_MENU '
             +' order by a.CD_MENU ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);

    Result := DM.ReadQuery(Query, GridTableView1);
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    OpenQuery('select g.CD_CLASS, '
             +'       Max(g.NM_LARGE) as NM_CLASS, '
             +'       Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE,'
             +'       GetProfitRate(Sum(d.AMT_BUY), Sum(d.AMT_SALE - d.DC_TOT)) as RT_PROFIT, '
             +'       Sum(d.AMT_SALE - d.DC_TOT - d.AMT_BUY) as AMT_PROFIT '
             +' from  SL_SALE_D_SUM as d  left outer join '
             +'       (select g.CD_MENU, '
             +'               Left(g.CD_CLASS,2) as CD_CLASS, '
             +'               Ifnull(l.NM_CLASS,''메뉴분류 미지정'') as NM_LARGE '
             +'          from MS_MENU          g left outer join '
             +'               MS_MENU_CLASS as l on g.CD_HEAD  = l.CD_HEAD '
             +'                                 and g.CD_STORE = l.CD_STORE '
             +'                                 and Left(g.CD_CLASS,2) = l.CD_CLASS '
             +'                                 and Length(l.CD_CLASS)= 2 '
             +'        where g.CD_HEAD  =:P0 '
             +'          and g.CD_STORE =:P1 '
             +'        ) as g on d.CD_MENU = g.CD_MENU '
             +' where d.CD_HEAD  =:P0 '
             +'   and d.CD_STORE =:P1 '
             +'   and d.YMD_SALE between :P2 and :P3 '
             +' group by g.CD_CLASS '
             +' order by 1 ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);

    Result := DM.ReadQuery(Query, GridTableView2);
  end;
end;



end.
