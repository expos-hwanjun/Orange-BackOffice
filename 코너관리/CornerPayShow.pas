// 임대 매장별 입금 조회 (New완료)

unit CornerPayShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, cxContainer, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit, cxGridBandedTableView, StdCtrls, cxRadioGroup, cxProgressBar,
  StrUtils, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSPrVwRibbon,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCornerPayShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewSaleDate: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewMartSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewMartCardAmt: TcxGridBandedColumn;
    GridBandedTableViewMartCashReceiptAmt: TcxGridBandedColumn;
    GridBandedTableViewMartEtcAmt: TcxGridBandedColumn;
    GridBandedTableViewRentAmt: TcxGridBandedColumn;
    GridBandedTableViewMartRate: TcxGridBandedColumn;
    GridBandedTableViewMartCompanyAmt: TcxGridBandedColumn;
    GridBandedTableViewVatAmt: TcxGridBandedColumn;
    GridBandedTableViewFreeAmt: TcxGridBandedColumn;
    GridBandedTableViewNetAmt: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    CompanyList: TStringList;

  protected
    function DoSearch:Boolean; override;
  end;

var
  CornerPayShowForm: TCornerPayShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCornerPayShowForm.FormCreate(Sender: TObject);
var
  vColumn: TcxGridBandedColumn;
begin
  HelpURL := 'BackOffice/코너관리/직영,코너%20매출조회/직영,코너%20매출조회.htm';
  // 임대업장 목록을 불러온다
  CompanyList := TStringList.Create;
  OpenQuery('select  CD_TRDPL, '
           +'        NM_TRDPL '
           +'  from  MS_TRD '
           +' where  CD_HEAD   =:P0 '
           +'   and  CD_STORE  =:P1 '
           +'   and  DS_TRDPL  = ''C'' '
           +'   and  DS_STATUS = 0 '
           +' order by CD_TRDPL',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      CompanyList.Add(Query.Fields[0].AsString);

      GridBandedTableView.Bands.Add;
      GridBandedTableView.Bands[GridBandedTableView.Bands.Count-1].Caption := Query.Fields[1].AsString;
      // 판매금액
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewMartSaleAmt.Caption;
        DataBinding.FieldName     := 'AMT_SALE_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewMartSaleAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewMartSaleAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewMartSaleAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewMartSaleAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewMartSaleAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewMartSaleAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewMartSaleAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewMartSaleAmt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewMartSaleAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 신용카드
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewMartCardAmt.Caption;
        DataBinding.FieldName     := 'AMT_CARD_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewMartCardAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewMartCardAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewMartCardAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewMartCardAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewMartCardAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewMartCardAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewMartCardAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewMartCardAmt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewMartCardAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[2].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[2].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 현금영수증
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewMartCashReceiptAmt.Caption;
        DataBinding.FieldName     := 'AMT_CASH_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewMartCashReceiptAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewMartCashReceiptAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewMartCashReceiptAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewMartCashReceiptAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewMartCashReceiptAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewMartCashReceiptAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewMartCashReceiptAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewMartCashReceiptAmt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewMartCashReceiptAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[3].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[3].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
{      // 수수료
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := '수수료';
        DataBinding.FieldName     := 'AMT_FEE_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewMartEtcAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewMartEtcAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewMartEtcAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewMartEtcAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewMartEtcAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewMartEtcAmt.HeaderAlignmentHorz;
        Width                     := 65;//GridBandedTableViewMartEtcAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewMartEtcAmt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewMartEtcAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[4].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[4].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      // 지급할 금액
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := '지급할 금액';
        DataBinding.FieldName     := 'AMT_REM_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewMartEtcAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewMartEtcAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewMartEtcAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewMartEtcAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewMartEtcAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewMartEtcAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewMartEtcAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewMartEtcAmt.Position.ColIndex+1;
        Position.RowIndex         := GridBandedTableViewMartEtcAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[4].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[4].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
}

      // 마트결제 금액
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := '직영 결제';
        DataBinding.FieldName     := 'AMT_MART_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewMartEtcAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewMartEtcAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewMartEtcAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewMartEtcAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewMartEtcAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewMartEtcAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewMartEtcAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewMartEtcAmt.Position.ColIndex+1;
        Position.RowIndex         := GridBandedTableViewMartEtcAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[4].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[4].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TCornerPayShowForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TCornerPayShowForm.FormDestroy(Sender: TObject);
begin
  CompanyList.Free;

  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TCornerPayShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TCornerPayShowForm.DoSearch:Boolean;
var
  vSQLRent, vSQLSum, vSQLSale, vSQLCard, vSQLCash, vSQLTrd: string;
  vIndex: Integer;
begin
//  inherited;

  vSQLRent := EmptyStr;
  vSQLSum  := EmptyStr;
  vSQLSale := EmptyStr;
  vSQLCard := EmptyStr;
  vSQLCash := EmptyStr;
  vSQLTrd  := EmptyStr;
  for vIndex := 0 to CompanyList.Count-1 do
    if CompanyList[vIndex] <> EmptyStr then
    begin
      vSQLTrd  := vSQLTrd  + Ifthen(vSQLTrd  <> EmptyStr, '+', '') + ' AMT_SALE_'+CompanyList[vIndex]+' - AMT_CARD_'+CompanyList[vIndex]+' - AMT_CASH_'+CompanyList[vIndex]+' ';
      vSQLRent := vSQLRent + Ifthen(vSQLRent <> EmptyStr, '+', '') + ' AMT_CARD_'+CompanyList[vIndex]+' + AMT_CASH_'+CompanyList[vIndex]+' ';

      vSQLSum  := vSQLSum
                +' Sum(AMT_SALE_'+CompanyList[vIndex]+') as AMT_SALE_'+CompanyList[vIndex]+', '
                +' Sum(AMT_CARD_'+CompanyList[vIndex]+') as AMT_CARD_'+CompanyList[vIndex]+', '
                +' Sum(AMT_CASH_'+CompanyList[vIndex]+') as AMT_CASH_'+CompanyList[vIndex]+', '
                +' Sum(AMT_SALE_'+CompanyList[vIndex]+' - AMT_CARD_'+CompanyList[vIndex]+' - AMT_CASH_'+CompanyList[vIndex]+') as AMT_MART_'+CompanyList[vIndex]+', ';
      vSQLSale := vSQLSale
                +' Sum(case when Ifnull(t.CD_TRDPL,'''') = '''+CompanyList[vIndex]+''' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_'+CompanyList[vIndex]+', '
                +' 0 as AMT_CARD_'+CompanyList[vIndex]+', '
                +' 0 as AMT_CASH_'+CompanyList[vIndex]+', ';
      vSQLCard := vSQLCard
                +' 0 as AMT_SALE_'+CompanyList[vIndex]+', '
                +' Sum(case when Ifnull(CD_CORNER,'''') = '''+CompanyList[vIndex]+''' then case when Ifnull(DS_TRD,''A'') = ''A'' then Ifnull(AMT_APPROVAL,0) else -Abs(Ifnull(AMT_APPROVAL,0)) end else 0 end) as AMT_CARD_'+CompanyList[vIndex]+', '
                +' 0 as AMT_CASH_'+CompanyList[vIndex]+', ';
      vSQLCash := vSQLCash
                +' 0 as AMT_SALE_'+CompanyList[vIndex]+', '
                +' 0 as AMT_CARD_'+CompanyList[vIndex]+', '
                +' Sum(case when Ifnull(CD_CORNER,'''') = '''+CompanyList[vIndex]+''' then case when Ifnull(DS_TRD,''A'') = ''A'' then Ifnull(AMT_APPROVAL,0) else -Abs(Ifnull(AMT_APPROVAL,0)) end else 0 end) as AMT_CASH_'+CompanyList[vIndex]+', ';
    end;

  OpenQuery('select   Sum(AMT_SALE)       as AMT_SALE, '
           +Ifthen(vSQLTrd <> '', 'Sum('+vSQLTrd+')    as AMT_TRD, ','0 as AMT_TRD, ')  // 대행결제 (임대업장 결제를 대신해준 것, 현금+현영+카드 등 다 포함)
           +Ifthen(vSQLTrd <> '', 'Sum('+vSQLRent+')   as AMT_RENT, ',' 0 as AMT_RENT, ')
           +Ifthen(vSQLTrd <> '', 'Sum('+vSQLRent+') / Sum(AMT_SALE) * 100 as RATE_MART, ','0 as RATE_MART, ')
           +'         Sum(AMT_SALE_MART)  as AMT_SALE_MART, '
           +'         Sum(AMT_CARD_MART)  as AMT_CARD_MART, '
           +'         Sum(AMT_CASH_MART)  as AMT_CASH_MART, '
           +'         Sum(AMT_SALE_MART - AMT_CARD_MART - AMT_CASH_MART) as AMT_ETC_MART, '
           +'         Sum(AMT_SALE_MART-AMT_FREE_MART) - DivInt(Sum(AMT_SALE_MART-AMT_FREE_MART), 11) as AMT_NET_MART, '
           +'         DivInt(Sum(AMT_SALE_MART-AMT_FREE_MART), 11) as AMT_VAT_MART, '
           +'         Sum(AMT_FREE_MART)  as AMT_FREE_MART, '
           +vSQLSum
           +'         StoDW(YMD_SALE) as YMD_SALE '
           +'from    (select   Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE, '
           +'                  Sum(case when Ifnull(t.CD_TRDPL,'''') = '''' then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_SALE_MART, '
           +'                  Sum(case when Ifnull(t.CD_TRDPL,'''') = '''' then d.AMT_VAT else 0 end) as AMT_VAT_MART, '
           +'                  Sum(case when (Ifnull(t.CD_TRDPL,'''') = '''') and (d.AMT_VAT = 0) then d.AMT_SALE - d.DC_TOT else 0 end) as AMT_FREE_MART, '
           +'                  0 as AMT_CARD_MART, '
           +'                  0 as AMT_CASH_MART, '
           +vSQLSale
           +'                  d.YMD_SALE '
           +'         from     SL_SALE_D as d inner join '
           +'                  MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU   = g.CD_MENU left outer join '
           +'                  MS_TRD    as t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_CORNER = t.CD_TRDPL and t.DS_TRDPL = ''C'' '
           +'         where    d.CD_HEAD  =:P0 '
           +'           and    d.CD_STORE =:P1 '
           +'           and    d.YMD_SALE between :P2 and :P3 '
           +'           and    d.DS_SALE  <> ''V'' '
           +'         group by d.YMD_SALE '
           +'         union all '
           +'         select   0 as AMT_SALE, '
           +'                  0 as AMT_SALE_MART, '
           +'                  0 as AMT_VAT_MART, '
           +'                  0 as AMT_NET_MART, '
           +'                  Sum(case when Ifnull(CD_CORNER,'''') = '''' then case when Ifnull(DS_TRD,''A'') = ''A'' then Ifnull(AMT_APPROVAL,0) else -Abs(Ifnull(AMT_APPROVAL,0)) end else 0 end) as AMT_CARD_MART, '
           +'                  0 as AMT_CASH_MART, '
           +vSQLCard
           +'                  YMD_SALE '
           +'         from     SL_CARD '
           +'         where    CD_HEAD  =:P0 '
           +'           and    CD_STORE =:P1 '
           +'           and    YMD_SALE between :P2 and :P3 '
           +'         group by YMD_SALE '
           +'         union all '
           +'         select   0 as AMT_SALE, '
           +'                  0 as AMT_SALE_MART, '
           +'                  0 as AMT_VAT_MART, '
           +'                  0 as AMT_NET_MART, '
           +'                  0 as AMT_CARD_MART, '
           +'                  Sum(case when Ifnull(CD_CORNER,'''') = '''' then case when Ifnull(DS_TRD,''A'') = ''A'' then Ifnull(AMT_APPROVAL,0) else -Abs(Ifnull(AMT_APPROVAL,0)) end else 0 end) as AMT_CASH_MART, '
           +vSQLCash
           +'                  YMD_SALE '
           +'         from     SL_CASH '
           +'         where    CD_HEAD  =:P0 '
           +'           and    CD_STORE =:P1 '
           +'           and    YMD_SALE between :P2 and :P3 '
           +'         group by YMD_SALE) as a '
           +'group by YMD_SALE '
           +'order by YMD_SALE ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  DM.ReadQuery(Query, GridBandedTableView);
  Result := GridBandedTableView.DataController.RecordCount > 0;
end;

end.
