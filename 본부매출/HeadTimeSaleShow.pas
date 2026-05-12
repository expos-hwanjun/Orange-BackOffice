unit HeadTimeSaleShow;

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
  cxCurrencyEdit, cxGridBandedTableView, cxGridCustomTableView, cxGridTableView,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager,
  AdvOfficePagerStylers;

type
  THeadTimeSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridBandedLocalView: TcxGridBandedTableView;
    GridBandedLocalViewColumn1: TcxGridBandedColumn;
    GridBandedLocalViewSaleAmt: TcxGridBandedColumn;
    GridBandedLocalViewCustomerCnt: TcxGridBandedColumn;
    GridBandedSaleZoneView: TcxGridBandedTableView;
    GridBandedSaleZoneViewColumn1: TcxGridBandedColumn;
    GridBandedSaleZoneViewSaleAmt: TcxGridBandedColumn;
    GridBandedSaleZoneViewCustomerCnt: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    LocalList,
    SaleZoneList: TStringList;
    isFirst :Boolean;
    procedure SetColums;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadTimeSaleShowForm: THeadTimeSaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ THeadTimeSaleShowForm }



procedure THeadTimeSaleShowForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LocalList.Free;
  SaleZoneList.Free;
end;

procedure THeadTimeSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
  LocalList    := TStringList.Create;
  SaleZoneList := TStringList.Create;
  isFirst := true;
end;

procedure THeadTimeSaleShowForm.SetColums;
var
  vColumn: TcxGridBandedColumn;
begin
  OpenQuery('select  CD_KIND, '
           +'        CD_CODE, '
           +'        NM_CODE1 '
           +'  from  MS_CODE '
           +' where  CD_HEAD   = :P0 '
           +'   and  CD_STORE  = :P1 '
           +'   and  CD_KIND   in (''01'',''03'') '
           +'   and  DS_STATUS = ''0'' '
           +'  order by CD_KIND, CD_CODE',
            [HeadStoreCode,
             StandardStore]);
  try
    while not Query.Eof do
    begin
      if Query.Fields[0].AsString = '01' then
      begin
        LocalList.Add(Query.Fields[1].AsString);

        GridBandedLocalView.Bands.Add;
        GridBandedLocalView.Bands[GridBandedLocalView.Bands.Count-1].Caption := Query.Fields[2].AsString;
        // 금액
        vColumn := GridBandedLocalView.CreateColumn;
        with vColumn do
        begin
          Caption                   := GridBandedLocalViewSaleAmt.Caption;
          DataBinding.FieldName     := 'AMT_'+Query.Fields[1].AsString;
          DataBinding.ValueType     := GridBandedLocalViewSaleAmt.DataBinding.ValueType;
          PropertiesClassName       := GridBandedLocalViewSaleAmt.PropertiesClassName;
          Properties.Alignment.Horz := GridBandedLocalViewSaleAmt.Properties.Alignment.Horz;
          TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedLocalViewSaleAmt.Properties).DisplayFormat;
          FooterAlignmentHorz       := GridBandedLocalViewSaleAmt.FooterAlignmentHorz;
          HeaderAlignmentHorz       := GridBandedLocalViewSaleAmt.HeaderAlignmentHorz;
          Width                     := GridBandedLocalViewSaleAmt.Width;
          Position.BandIndex        := GridBandedLocalView.Bands.Count-1;
          Position.ColIndex         := GridBandedLocalViewSaleAmt.Position.ColIndex;
          Position.RowIndex         := GridBandedLocalViewSaleAmt.Position.RowIndex;
          Tag                       := 98;
        end;
        GridBandedLocalView.DataController.Summary.FooterSummaryItems.Add;
        GridBandedLocalView.DataController.Summary.FooterSummaryItems[GridBandedLocalView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedLocalView.DataController.Summary.FooterSummaryItems[0].Format;
        GridBandedLocalView.DataController.Summary.FooterSummaryItems[GridBandedLocalView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedLocalView.DataController.Summary.FooterSummaryItems[0].Kind;
        TcxGridTableSummaryItem(GridBandedLocalView.DataController.Summary.FooterSummaryItems[GridBandedLocalView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
        // 객수
        vColumn := GridBandedLocalView.CreateColumn;
        with vColumn do
        begin
          Caption                   := GridBandedLocalViewCustomerCnt.Caption;
          DataBinding.FieldName     := 'CNT_'+Query.Fields[1].AsString;
          DataBinding.ValueType     := GridBandedLocalViewCustomerCnt.DataBinding.ValueType;
          PropertiesClassName       := GridBandedLocalViewCustomerCnt.PropertiesClassName;
          Properties.Alignment.Horz := GridBandedLocalViewCustomerCnt.Properties.Alignment.Horz;
          TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedLocalViewCustomerCnt.Properties).DisplayFormat;
          FooterAlignmentHorz       := GridBandedLocalViewCustomerCnt.FooterAlignmentHorz;
          HeaderAlignmentHorz       := GridBandedLocalViewCustomerCnt.HeaderAlignmentHorz;
          Width                     := GridBandedLocalViewCustomerCnt.Width;
          Position.BandIndex        := GridBandedLocalView.Bands.Count-1;
          Position.ColIndex         := GridBandedLocalViewCustomerCnt.Position.ColIndex;
          Position.RowIndex         := GridBandedLocalViewCustomerCnt.Position.RowIndex;
        end;
        GridBandedLocalView.DataController.Summary.FooterSummaryItems.Add;
        GridBandedLocalView.DataController.Summary.FooterSummaryItems[GridBandedLocalView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedLocalView.DataController.Summary.FooterSummaryItems[1].Format;
        GridBandedLocalView.DataController.Summary.FooterSummaryItems[GridBandedLocalView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedLocalView.DataController.Summary.FooterSummaryItems[1].Kind;
        TcxGridTableSummaryItem(GridBandedLocalView.DataController.Summary.FooterSummaryItems[GridBandedLocalView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      end
      else
      begin
        SaleZoneList.Add(Query.Fields[1].AsString);

        GridBandedSaleZoneView.Bands.Add;
        GridBandedSaleZoneView.Bands[GridBandedSaleZoneView.Bands.Count-1].Caption := Query.Fields[2].AsString;
        // 금액
        vColumn := GridBandedSaleZoneView.CreateColumn;
        with vColumn do
        begin
          Caption                   := GridBandedSaleZoneViewSaleAmt.Caption;
          DataBinding.FieldName     := 'AMT_'+Query.Fields[1].AsString;
          DataBinding.ValueType     := GridBandedSaleZoneViewSaleAmt.DataBinding.ValueType;
          PropertiesClassName       := GridBandedSaleZoneViewSaleAmt.PropertiesClassName;
          Properties.Alignment.Horz := GridBandedSaleZoneViewSaleAmt.Properties.Alignment.Horz;
          TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedSaleZoneViewSaleAmt.Properties).DisplayFormat;
          FooterAlignmentHorz       := GridBandedSaleZoneViewSaleAmt.FooterAlignmentHorz;
          HeaderAlignmentHorz       := GridBandedSaleZoneViewSaleAmt.HeaderAlignmentHorz;
          Width                     := GridBandedSaleZoneViewSaleAmt.Width;
          Position.BandIndex        := GridBandedSaleZoneView.Bands.Count-1;
          Position.ColIndex         := GridBandedSaleZoneViewSaleAmt.Position.ColIndex;
          Position.RowIndex         := GridBandedSaleZoneViewSaleAmt.Position.RowIndex;
          Tag                       := 98;
        end;
        GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Add;
        GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[0].Format;
        GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[0].Kind;
        TcxGridTableSummaryItem(GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
        // 객수
        vColumn := GridBandedSaleZoneView.CreateColumn;
        with vColumn do
        begin
          Caption                   := GridBandedSaleZoneViewCustomerCnt.Caption;
          DataBinding.FieldName     := 'CNT_'+Query.Fields[1].AsString;
          DataBinding.ValueType     := GridBandedSaleZoneViewCustomerCnt.DataBinding.ValueType;
          PropertiesClassName       := GridBandedSaleZoneViewCustomerCnt.PropertiesClassName;
          Properties.Alignment.Horz := GridBandedSaleZoneViewCustomerCnt.Properties.Alignment.Horz;
          TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedSaleZoneViewCustomerCnt.Properties).DisplayFormat;
          FooterAlignmentHorz       := GridBandedSaleZoneViewCustomerCnt.FooterAlignmentHorz;
          HeaderAlignmentHorz       := GridBandedSaleZoneViewCustomerCnt.HeaderAlignmentHorz;
          Width                     := GridBandedSaleZoneViewCustomerCnt.Width;
          Position.BandIndex        := GridBandedSaleZoneView.Bands.Count-1;
          Position.ColIndex         := GridBandedSaleZoneViewCustomerCnt.Position.ColIndex;
          Position.RowIndex         := GridBandedSaleZoneViewCustomerCnt.Position.RowIndex;
        end;
        GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Add;
        GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[1].Format;
        GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[1].Kind;
        TcxGridTableSummaryItem(GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems[GridBandedSaleZoneView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      end;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  isFirst := false;
end;

function THeadTimeSaleShowForm.DoSearch: Boolean;
var
  vSQL      : string;
  vIndex    : Integer;
begin
  if isFirst then
     SetColums;

  if Grid.ActiveLevel = GridLevel then
  begin
    ReportSubTitle := '지역별 매출';
    vSQL := EmptyStr;
    for vIndex := 0 to LocalList.Count-1 do
      if LocalList[vIndex] <> EmptyStr then
        vSQL := vSQL
              +'Sum(case when t2.CD_LOCAL = '''+LocalList[vIndex]+''' then t2.AMT_SALE else 0 end) as AMT_'+LocalList[vIndex]+', '
              +'Sum(case when t2.CD_LOCAL = '''+LocalList[vIndex]+''' then t2.CNT_CUST else 0 end) as CNT_'+LocalList[vIndex]+', ';


    OpenQuery('select  Max(t1.NM_CODE1) as TIME_ZONE, '
             +'        Ifnull(Sum(t2.AMT_SALE),0) as AMT_SALE, '
             +'        Ifnull(Sum(t2.CNT_CUST),0) as CNT_CUST, '
             +'        case when Ifnull(Sum(t2.CNT_CUST),0) = 0 then 0 else Round(Sum(t2.AMT_SALE) / Sum(t2.CNT_CUST), 0) end as AMT_CUST, '
             +vSQL
             +'         0 as RATE '
             +'  from  MS_CODE as t1 left outer join '
             +'       (select b.CD_LOCAL, '
             +'               a.CD_TIME, '
             +'               Sum(a.AMT_SALE) as AMT_SALE, '
             +'               Sum(a.CNT_PERSON) as CNT_CUST '
             +'         from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'               MS_STORE   b on b.CD_HEAD  = a.CD_HEAD '
             +'                           and b.CD_STORE = a.CD_STORE '
             +'        where  a.CD_HEAD  = :P0 '
             +'          and  a.YMD_SALE between :P2 and :P3 '
             +'          and  a.DS_SALE <> ''V'' '
             +'        group by b.CD_LOCAL, a.CD_TIME) as t2 on t2.CD_TIME = t1.CD_CODE '
             +' where t1.CD_HEAD   =:P0 '
             +'   and t1.CD_STORE  =:P1 '
             +'   and t1.CD_KIND   =''15'' '
             +'   and t1.DS_STATUS =''0'' '
             +' group by t1.CD_CODE '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDAteEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedLocalView);
  end
  else
  begin
    ReportSubTitle := '상권별 매출';
    vSQL := EmptyStr;
    for vIndex := 0 to SaleZoneList.Count-1 do
      if SaleZoneList[vIndex] <> EmptyStr then
        vSQL := vSQL
              +'Sum(case when t2.CD_SALEZONE = '''+SaleZoneList[vIndex]+''' then t2.AMT_SALE else 0 end) as AMT_'+SaleZoneList[vIndex]+', '
              +'Sum(case when t2.CD_SALEZONE = '''+SaleZoneList[vIndex]+''' then t2.CNT_CUST else 0 end) as CNT_'+SaleZoneList[vIndex]+', ';


    OpenQuery('select  Max(t1.NM_CODE1) as TIME_ZONE, '
             +'        Ifnull(Sum(t2.AMT_SALE),0) as AMT_SALE, '
             +'        Ifnull(Sum(t2.CNT_CUST),0) as CNT_CUST, '
             +'        case when Ifnull(Sum(t2.CNT_CUST),0) = 0 then 0 else Round(Sum(t2.AMT_SALE) / Sum(t2.CNT_CUST), 0) end as AMT_CUST, '
             +vSQL
             +'         0 as RATE '
             +'  from  MS_CODE as t1 left outer join '
             +'       (select b.CD_SALEZONE, '
             +'               a.CD_TIME, '
             +'               Sum(a.AMT_SALE) as AMT_SALE, '
             +'               Sum(a.CNT_PERSON) as CNT_CUST '
             +'         from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'               MS_STORE   b on b.CD_HEAD  = a.CD_HEAD '
             +'                           and b.CD_STORE = a.CD_STORE '
             +'        where  a.CD_HEAD  = :P0 '
             +'          and  a.YMD_SALE between :P2 and :P3 '
             +'          and  a.DS_SALE <> ''V'' '
             +'        group by b.CD_SALEZONE, a.CD_TIME) as t2 on t2.CD_TIME = t1.CD_CODE '
             +' where t1.CD_HEAD   =:P0 '
             +'   and t1.CD_STORE  =:P1 '
             +'   and t1.CD_KIND   =''15'' '
             +'   and t1.DS_STATUS =''0'' '
             +' group by t1.CD_CODE '
             +' order by t1.CD_CODE ',
            [HeadStoreCode,
             StandardStore,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDAteEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedSaleZoneView);
  end;

end;

end.
