unit HeadClassSaleExShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxPSCore,
  dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  frxClass;

type
  TReportMaster = record
    NM_CLASS      : string;
    QTY_SALE,
    AMT_SALE: Currency;
  end;

  TReportDetail = record
    NM_CLASS,
    CD_STORE,
    NM_STORE      : string;
    QTY_SALE,
    AMT_SALE: Currency;
  end;

  TReport2Master = record
    CD_STORE,
    NM_STORE      : string;
    AMT_SALE: Currency;
  end;

  TReport2Detail = record
    NM_CLASS      : string;
    QTY_SALE,
    AMT_SALE: Currency;
  end;

  TReport3Master = record
    NM_CLASS      : string;
    QTY_SALE,
    AMT_SALE: Currency;
  end;

  TReport3Detail = record
    CD_MENU,
    NM_MENU      : string;
    QTY_SALE,
    AMT_SALE: Currency;
  end;



type
  THeadClassSaleExShowForm = class(TInheritShow2Form)
    GridDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewColumn2: TcxGridDBColumn;
    GridDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    StoreTableView: TcxGridDBTableView;
    GridLevel2: TcxGridLevel;
    StoreSubTableView: TcxGridDBTableView;
    StoreTableViewColumn1: TcxGridDBColumn;
    StoreTableViewColumn3: TcxGridDBColumn;
    StoreTableViewColumn4: TcxGridDBColumn;
    StoreTableViewColumn5: TcxGridDBColumn;
    StoreSubTableViewColumn2: TcxGridDBColumn;
    StoreSubTableViewColumn3: TcxGridDBColumn;
    StoreSubTableViewColumn4: TcxGridDBColumn;
    GridLevel3: TcxGridLevel;
    GridLevel4: TcxGridLevel;
    MenuTableView: TcxGridDBTableView;
    MenuSubTableView: TcxGridDBTableView;
    MenuTableViewColumn2: TcxGridDBColumn;
    MenuTableViewColumn3: TcxGridDBColumn;
    MenuTableViewColumn4: TcxGridDBColumn;
    MenuSubTableViewColumn1: TcxGridDBColumn;
    MenuSubTableViewColumn2: TcxGridDBColumn;
    MenuSubTableViewColumn3: TcxGridDBColumn;
    MenuSubTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    StoreDataSource: TDataSource;
    StoreSubDataSource: TDataSource;
    MenuDataSource: TDataSource;
    MenuSubDataSource: TDataSource;
    FastReport: TfrxReport;
    FastReportMasterDataSet: TfrxUserDataSet;
    FastReportDetailDataSet: TfrxUserDataSet;
    frxReport1: TfrxReport;
    frxUserDataSet1: TfrxUserDataSet;
    frxUserDataSet2: TfrxUserDataSet;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure FastReportMasterDataSetCheckEOF(Sender: TObject;
      var Eof: Boolean);
    procedure FastReportMasterDataSetFirst(Sender: TObject);
    procedure FastReportMasterDataSetGetValue(const VarName: string;
      var Value: Variant);
    procedure FastReportMasterDataSetNext(Sender: TObject);
    procedure FastReportMasterDataSetPrior(Sender: TObject);
    procedure FastReportDetailDataSetCheckEOF(Sender: TObject;
      var Eof: Boolean);
    procedure FastReportDetailDataSetFirst(Sender: TObject);
    procedure FastReportDetailDataSetGetValue(const VarName: string;
      var Value: Variant);
  private
    ReportMaster,
    ReportDetail: TList;
    MasterNo: Integer;
    DetailNo: Integer;

    StoreMemData,
    StoreSubMemData,
    MenuMemData,
    MenuSubMemData : TdxMemData;
    procedure GetPrintData;
    procedure Print(aPrint:Integer);
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  HeadClassSaleExShowForm: THeadClassSaleExShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}
procedure THeadClassSaleExShowForm.FastReportDetailDataSetCheckEOF(
  Sender: TObject; var Eof: Boolean);
begin
  inherited;
  Eof := DetailNo >= ReportDetail.Count;
end;

procedure THeadClassSaleExShowForm.FastReportDetailDataSetFirst(
  Sender: TObject);
begin
  inherited;
  DetailNo := 0;
  while (not FastReportDetailDataSet.Eof) and ((TReportDetail(ReportDetail.Items[DetailNo]^).NM_CLASS <> TReportMaster(ReportMaster.Items[MasterNo]^).NM_CLASS) ) do
    Inc(DetailNo);

end;

procedure THeadClassSaleExShowForm.FastReportDetailDataSetGetValue(
  const VarName: string; var Value: Variant);
begin
  inherited;
  if VarName = 'CD_STORE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).CD_STORE
  else if VarName = 'NM_STORE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).NM_STORE
  else if VarName = 'QTY_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).QTY_SALE
  else if VarName = 'AMT_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).AMT_SALE;
end;

procedure THeadClassSaleExShowForm.FastReportMasterDataSetCheckEOF(
  Sender: TObject; var Eof: Boolean);
begin
  inherited;
  Eof := MasterNo >= ReportMaster.Count;
end;

procedure THeadClassSaleExShowForm.FastReportMasterDataSetFirst(
  Sender: TObject);
begin
  inherited;
  MasterNo := 0;
end;

procedure THeadClassSaleExShowForm.FastReportMasterDataSetGetValue(
  const VarName: string; var Value: Variant);
begin
  inherited;
  if VarName = 'NM_CLASS' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).NM_CLASS
  else if VarName = 'QTY_SALE' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).QTY_SALE
  else if VarName = 'AMT_SALE' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).AMT_SALE;

end;

procedure THeadClassSaleExShowForm.FastReportMasterDataSetNext(Sender: TObject);
begin
  inherited;
  Inc(MasterNo);
end;

procedure THeadClassSaleExShowForm.FastReportMasterDataSetPrior(
  Sender: TObject);
begin
  inherited;
  Dec(MasterNo);
end;

procedure THeadClassSaleExShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
  StoreMemData                := TdxMemData.Create(Self);
  StoreDataSource.DataSet     := StoreMemData;
  StoreSubMemData             := TdxMemData.Create(Self);
  StoreSubDataSource.DataSet  := StoreSubMemData;
  MenuMemData                 := TdxMemData.Create(Self);
  MenuDataSource.DataSet      := MenuMemData;
  MenuSubMemData              := TdxMemData.Create(Self);
  MenuSubDataSource.DataSet   := MenuSubMemData;
end;

procedure THeadClassSaleExShowForm.GetPrintData;
begin

end;

procedure THeadClassSaleExShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
    ReportSubTitle := '분류별 매장매출'
  else if Grid.ActiveLevel = GridLevel1 then
    ReportSubTitle := '매장별 분류매출'
  else if Grid.ActiveLevel = GridLevel3 then
    ReportSubTitle := '분류별 메뉴매출';
end;

procedure THeadClassSaleExShowForm.Print(aPrint: Integer);
begin

end;

procedure THeadClassSaleExShowForm.ClearGrid;
begin
  inherited;
  isLoading := true;
  GridSubDBTableView.DataController.DataSource := nil;
  StoreSubTableView.DataController.DataSource := nil;
  MenuSubTableView.DataController.DataSource := nil;
  GridDBTableView.DataController.DataSource := nil;
  StoreTableView.DataController.DataSource := nil;
  MenuTableView.DataController.DataSource := nil;
end;

function THeadClassSaleExShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    ReportSubTitle := '분류별 매장매출';
    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'  from  (select   Left(Ifnull(g.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'         from     SL_SALE_D_SUM  as d inner join '
               +'                  MS_MENU        as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                     and g.CD_STORE = :P1 '
               +'                                     and d.CD_MENU  = g.CD_MENU left outer join '
               +'                  MS_MENU_CLASS  as c on d.CD_HEAD  = c.CD_HEAD '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(g.CD_CLASS,2) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'         where    d.CD_HEAD  =:P0 '
               +'           and    d.YMD_SALE between :P2 and :P3 '
               +'         group by Left(Ifnull(g.CD_CLASS,''''),2)) as a '
               +' order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
    else
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'from    (select   Left(Ifnull(m.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(s.QTY_SALE) as QTY_SALE, '
               +'                  Sum(s.AMT_SALE - s.DC_TOT) as AMT_SALE '
               +'         from    (select g.CD_MENU_HEAD, '
               +'                         d.QTY_SALE, '
               +'                         d.DC_TOT, '
               +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
               +'                         d.AMT_BUY '
               +'                    from SL_SALE_D_SUM  as d inner join '
               +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
               +'                                            and g.CD_STORE = d.CD_STORE '
               +'                                            and d.CD_MENU  = g.CD_MENU '
               +'                   where d.CD_HEAD  =:P0 '
               +'                     and d.YMD_SALE between :P2 and :P3 '
               +'                  ) as s left outer join '
               +'                  MS_MENU        as m on m.CD_HEAD  = :P0 '
               +'                                     and m.CD_STORE = :P1 '
               +'                                     and m.CD_MENU  = s.CD_MENU_HEAD left outer join '
               +'                  MS_MENU_CLASS  as c on c.CD_HEAD  = :P0 '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(m.CD_CLASS,2) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'         group by Left(Ifnull(m.CD_CLASS,''''),2)) as a '
               +'order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    GridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MemData);
    GridDBTableView.DataController.DataSource := DataSource;

    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         a.CD_STORE, '
               +'         b.NM_STORE, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'  from  (select   Left(Ifnull(g.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  d.CD_STORE, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'         from     SL_SALE_D_SUM  as d inner join '
               +'                  MS_MENU        as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                     and g.CD_STORE = :P1 '
               +'                                     and d.CD_MENU  = g.CD_MENU  '
               +'         where    d.CD_HEAD  =:P0 '
               +'           and    d.YMD_SALE between :P2 and :P3 '
               +'         group by Left(Ifnull(g.CD_CLASS,''''),2), d.CD_STORE) as a inner join '
               +'         MS_STORE as b on b.CD_HEAD =:P0 and b.CD_STORE = a.CD_STORE '
               +' order by a.CD_CLASS, a.CD_STORE',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
    else
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         a.CD_STORE, '
               +'         b.NM_STORE, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'from    (select   Left(Ifnull(m.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  s.CD_STORE, '
               +'                  Sum(s.QTY_SALE) as QTY_SALE, '
               +'                  Sum(s.AMT_SALE) as AMT_SALE '
               +'         from    (select d.CD_STORE, '
               +'                         g.CD_MENU_HEAD, '
               +'                         d.QTY_SALE, '
               +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE '
               +'                    from SL_SALE_D_SUM  as d inner join '
               +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
               +'                                            and g.CD_STORE = d.CD_STORE '
               +'                                            and d.CD_MENU  = g.CD_MENU '
               +'                   where d.CD_HEAD  =:P0 '
               +'                     and d.YMD_SALE between :P2 and :P3 '
               +'                  ) as s inner join '
               +'                  MS_MENU        as m on m.CD_HEAD  = :P0 '
               +'                                     and m.CD_STORE = :P1 '
               +'                                     and m.CD_MENU  = s.CD_MENU_HEAD  '
               +'         group by Left(Ifnull(m.CD_CLASS,''''),2), s.CD_STORE) as a inner join '
               +'         MS_STORE as b on b.CD_HEAD =:P0 and b.CD_STORE = a.CD_STORE '
               +'order by a.CD_CLASS, a.CD_STORE',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;

  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    ReportSubTitle := '매장별 분류매출';
    OpenQuery('select     c.NM_CODE1 as NM_LOCAL, '
               +'         a.CD_STORE, '
               +'         b.NM_STORE, '
               +'         a.AMT_SALE, '
               +'         a.CD_STORE as LINK '
               +'  from  (select  CD_STORE, '
               +'                 Sum(AMT_SALE - DC_TOT) as AMT_SALE '
               +'           from  SL_SALE_D_SUM '
               +'          where  CD_HEAD  =:P0 '
               +'            and  YMD_SALE between :P2 and :P3 '
               +'         group by CD_STORE) as a inner join '
               +'         MS_STORE as b on b.CD_HEAD  = :P0 '
               +'                      and b.CD_STORE = a.CD_STORE left outer join '
               +'         MS_CODE  as c on c.CD_HEAD  = b.CD_HEAD '
               +'                      and c.CD_STORE = :P1 '
               +'                      and c.CD_KIND  = ''01'' '
               +'                      and c.CD_CODE  = b.CD_LOCAL '
               +' order by a.CD_STORE',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

    StoreTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, StoreMemData);
    StoreTableView.DataController.DataSource := StoreDataSource;

    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   a.CD_STORE as LINK, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'  from  (select   d.CD_STORE, '
               +'                  Left(Ifnull(g.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'         from     SL_SALE_D_SUM  as d inner join '
               +'                  MS_MENU        as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                     and g.CD_STORE = :P1 '
               +'                                     and d.CD_MENU  = g.CD_MENU left outer join '
               +'                  MS_MENU_CLASS  as c on d.CD_HEAD  = c.CD_HEAD '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(g.CD_CLASS,2) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'         where    d.CD_HEAD  =:P0 '
               +'           and    d.YMD_SALE between :P2 and :P3 '
               +'         group by d.CD_STORE, Left(Ifnull(g.CD_CLASS,''''),2)) as a '
               +' order by a.CD_STORE, a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
      else
        OpenQuery('select   a.CD_STORE as LINK, '
                 +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
                 +'         a.QTY_SALE, '
                 +'         a.AMT_SALE '
                 +'from    (select   s.CD_STORE, '
                 +'                  Left(Ifnull(m.CD_CLASS,''''),2) as CD_CLASS, '
                 +'                  Max(c.NM_CLASS)    as NM_CLASS, '
                 +'                  Sum(s.QTY_SALE) as QTY_SALE, '
                 +'                  Sum(s.AMT_SALE) as AMT_SALE '
                 +'         from    (select d.CD_STORE, '
                 +'                         g.CD_MENU_HEAD, '
                 +'                         d.QTY_SALE, '
                 +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE '
                 +'                    from SL_SALE_D_SUM  as d inner join '
                 +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
                 +'                                            and g.CD_STORE = d.CD_STORE '
                 +'                                            and d.CD_MENU  = g.CD_MENU '
                 +'                   where d.CD_HEAD  =:P0 '
                 +'                     and d.YMD_SALE between :P2 and :P3 '
                 +'                  ) as s left outer join '
                 +'                  MS_MENU        as m on m.CD_HEAD  = :P0 '
                 +'                                     and m.CD_STORE = :P1 '
                 +'                                     and m.CD_MENU  = s.CD_MENU_HEAD inner join '
                 +'                  MS_MENU_CLASS  as c on c.CD_HEAD  = :P0 '
                 +'                                     and c.CD_STORE = :P1 '
                 +'                                     and Left(m.CD_CLASS,2) = c.CD_CLASS '
                 +'                                     and c.CD_CLASS <> '''' '
                 +'         group by s.CD_STORE, Left(Ifnull(m.CD_CLASS,''''),2)) as a '
                 +'order by a.CD_STORE, a.CD_CLASS',
                  [HeadStoreCode,
                   StandardStore,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   DtoS(ConditionToolBarToDateEdit.Date)]);


    StoreSubTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, StoreSubMemData);
    StoreSubTableView.DataController.DataSource := StoreSubDataSource;
  end
  else if Grid.ActiveLevel = GridLevel3 then
  begin
    ReportSubTitle := '분류별 메뉴매출';
    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'  from  (select   Left(Ifnull(g.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'         from     SL_SALE_D_SUM  as d inner join '
               +'                  MS_MENU        as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                     and g.CD_STORE = :P1 '
               +'                                     and d.CD_MENU  = g.CD_MENU left outer join '
               +'                  MS_MENU_CLASS  as c on d.CD_HEAD  = c.CD_HEAD '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(g.CD_CLASS,2) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'         where    d.CD_HEAD  =:P0 '
               +'           and    d.YMD_SALE between :P2 and :P3 '
               +'         group by Left(Ifnull(g.CD_CLASS,''''),2)) as a '
               +' order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
    else
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         case when (Ifnull(a.NM_CLASS,'''') = '''') and (Ifnull(a.CD_CLASS,'''') = '''') then ''(분류 미지정)'' else ConCat(a.CD_CLASS,'' - '',Ifnull(a.NM_CLASS,'''')) end as NM_CLASS, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'from    (select   Left(Ifnull(m.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  Max(c.NM_CLASS)    as NM_CLASS, '
               +'                  Sum(s.QTY_SALE) as QTY_SALE, '
               +'                  Sum(s.AMT_SALE - s.DC_TOT) as AMT_SALE '
               +'         from    (select g.CD_MENU_HEAD, '
               +'                         d.QTY_SALE, '
               +'                         d.DC_TOT, '
               +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
               +'                         d.AMT_BUY '
               +'                    from SL_SALE_D_SUM  as d inner join '
               +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
               +'                                            and g.CD_STORE = d.CD_STORE '
               +'                                            and d.CD_MENU  = g.CD_MENU '
               +'                   where d.CD_HEAD  =:P0 '
               +'                     and d.YMD_SALE between :P2 and :P3 '
               +'                  ) as s left outer join '
               +'                  MS_MENU        as m on m.CD_HEAD  = :P0 '
               +'                                     and m.CD_STORE = :P1 '
               +'                                     and m.CD_MENU  = s.CD_MENU_HEAD left outer join '
               +'                  MS_MENU_CLASS  as c on c.CD_HEAD  = :P0 '
               +'                                     and c.CD_STORE = :P1 '
               +'                                     and Left(m.CD_CLASS,2) = c.CD_CLASS '
               +'                                     and c.CD_CLASS <> '''' '
               +'         group by Left(Ifnull(m.CD_CLASS,''''),2)) as a '
               +'order by a.CD_CLASS',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);

    MenuTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MenuMemData);
    MenuTableView.DataController.DataSource := MenuDataSource;


    if GetChainHeadOption(2) = '1' then
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         a.CD_MENU, '
               +'         a.NM_MENU, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'  from  (select   Left(Ifnull(g.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  g.CD_MENU, '
               +'                  Max(g.NM_MENU) as NM_MENU, '
               +'                  Sum(d.QTY_SALE) as QTY_SALE, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'         from     SL_SALE_D_SUM  as d inner join '
               +'                  MS_MENU        as g on d.CD_HEAD  = g.CD_HEAD '
               +'                                     and g.CD_STORE = :P1 '
               +'                                     and d.CD_MENU  = g.CD_MENU '
               +'         where    d.CD_HEAD  =:P0 '
               +'           and    d.YMD_SALE between :P2 and :P3 '
               +'         group by Left(Ifnull(g.CD_CLASS,''''),2), g.CD_MENU) as a '
               +' order by a.CD_CLASS, a.CD_MENU',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
    else
      OpenQuery('select   a.CD_CLASS as LINK, '
               +'         a.CD_MENU, '
               +'         a.NM_MENU, '
               +'         a.QTY_SALE, '
               +'         a.AMT_SALE '
               +'from    (select   Left(Ifnull(m.CD_CLASS,''''),2) as CD_CLASS, '
               +'                  m.CD_MENU, '
               +'                  Max(m.NM_MENU)    as NM_MENU, '
               +'                  Sum(s.QTY_SALE) as QTY_SALE, '
               +'                  Sum(s.AMT_SALE - s.DC_TOT) as AMT_SALE '
               +'         from    (select g.CD_MENU_HEAD, '
               +'                         d.QTY_SALE, '
               +'                         d.DC_TOT, '
               +'                         d.AMT_SALE - d.DC_TOT as AMT_SALE, '
               +'                         d.AMT_BUY '
               +'                    from SL_SALE_D_SUM  as d inner join '
               +'                         MS_MENU        as g on g.CD_HEAD  = d.CD_HEAD '
               +'                                            and g.CD_STORE = d.CD_STORE '
               +'                                            and d.CD_MENU  = g.CD_MENU '
               +'                   where d.CD_HEAD  =:P0 '
               +'                     and d.YMD_SALE between :P2 and :P3 '
               +'                  ) as s inner join '
               +'                  MS_MENU        as m on m.CD_HEAD  = :P0 '
               +'                                     and m.CD_STORE = :P1 '
               +'                                     and m.CD_MENU  = s.CD_MENU_HEAD '
               +'         group by Left(Ifnull(m.CD_CLASS,''''),2), m.CD_MENU) as a '
               +'order by a.CD_CLASS, a.CD_MENU',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

    MenuSubTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MenuSubMemData);
    MenuSubTableView.DataController.DataSource := MenuSubDataSource;
  end;
end;


end.
