// 객층별 매출 조회 (완료)

unit AnalysisGuestTypeSaleShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, ExtCtrls, cxContainer, Uni,
  DB, MemDS, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  cxCurrencyEdit, cxGridBandedTableView, cxProgressBar, AdvToolBarStylers,
  StdCtrls, cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, DBAccess, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, dxSkinsCore,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TAnalysisGuestTypeSaleShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewSaleDate: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewNoneCnt: TcxGridBandedColumn;
    GridBandedTableViewNoneAmt: TcxGridBandedColumn;
    GridBandedTableViewNoneRate: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    GuestTypeList: TStringList;

  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisGuestTypeSaleShowForm: TAnalysisGuestTypeSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TAnalysisGuestTypeSaleShowForm.FormCreate(Sender: TObject);
var
  vColumn: TcxGridBandedColumn;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 공통코드에 등록된 객층을 그리드에 추가한다
  GuestTypeList := TStringList.Create;
  OpenQuery('select   CD_CODE, '
           +'         NM_CODE1 '
           +'  from   MS_CODE '
           +' where   CD_HEAD   = :P0 '
           +'   and   CD_STORE  = :P1 '
           +'   and   CD_KIND   = ''04'' '
           +'   and   DS_STATUS = ''0'' '
           +' order by CD_CODE',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      GuestTypeList.Add(Query.Fields[0].AsString);

      GridBandedTableView.Bands.Add;
      GridBandedTableView.Bands[GridBandedTableView.Bands.Count-1].Caption := Query.Fields[1].AsString;
      // 건수
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewNoneCnt.Caption;
        DataBinding.FieldName     := 'CNT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewNoneCnt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewNoneCnt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewNoneCnt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewNoneCnt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewNoneCnt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewNoneCnt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewNoneCnt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewNoneCnt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewNoneCnt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 금액
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewNoneAmt.Caption;
        DataBinding.FieldName     := 'AMT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewNoneAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewNoneAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewNoneAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewNoneAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewNoneAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewNoneAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewNoneAmt.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewNoneAmt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewNoneAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[2].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[2].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 점유율
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableViewNoneRate.Caption;
        DataBinding.FieldName     := 'RT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewNoneRate.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewNoneRate.PropertiesClassName;
        TcxCustomProgressBarProperties(Properties).BarStyle       := TcxCustomProgressBarProperties(GridBandedTableViewNoneRate.Properties).BarStyle;
        TcxCustomProgressBarProperties(Properties).BeginColor     := TcxCustomProgressBarProperties(GridBandedTableViewNoneRate.Properties).BeginColor;
        TcxCustomProgressBarProperties(Properties).EndColor       := TcxCustomProgressBarProperties(GridBandedTableViewNoneRate.Properties).EndColor;
        TcxCustomProgressBarProperties(Properties).SolidTextColor := TcxCustomProgressBarProperties(GridBandedTableViewNoneRate.Properties).SolidTextColor;
        FooterAlignmentHorz       := GridBandedTableViewNoneRate.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewNoneRate.HeaderAlignmentHorz;
        Options.Filtering         := GridBandedTableViewNoneRate.Options.Filtering;
        Width                     := GridBandedTableViewNoneRate.Width;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := GridBandedTableViewNoneRate.Position.ColIndex;
        Position.RowIndex         := GridBandedTableViewNoneRate.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TAnalysisGuestTypeSaleShowForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TAnalysisGuestTypeSaleShowForm.FormDestroy(Sender: TObject);
begin
  GuestTypeList.Free;

  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TAnalysisGuestTypeSaleShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TAnalysisGuestTypeSaleShowForm.DoSearch:Boolean;
var
  vSQL  : string;
  vIndex: Integer;
begin
//  inherited;

  vSQL := EmptyStr;
  for vIndex := 0 to GuestTypeList.Count-1 do
    if GuestTypeList[vIndex] <> EmptyStr then
      vSQL := vSQL
            +'Sum(case when CD_CUSTOMER = '''+GuestTypeList[vIndex]+''' then CNT_PERSON else 0 end) as CNT_'+GuestTypeList[vIndex]+', '
            +'Sum(case when CD_CUSTOMER = '''+GuestTypeList[vIndex]+''' then AMT_SALE else 0 end) as AMT_'+GuestTypeList[vIndex]+', '
            +'case when Sum(AMT_SALE) = 0 then 0 else Round(Sum(case when CD_CUSTOMER = '''+GuestTypeList[vIndex]+''' then AMT_SALE else 0 end) * 100 / Sum(AMT_SALE), 0) end as RT_'+GuestTypeList[vIndex]+', ';

  OpenQuery('select   StoDW(YMD_SALE) as YMD_SALE, '
           +'         Sum(case when CD_CUSTOMER = '''' then CNT_PERSON  else 0 end) as CNT_NONE, '
           +'         Sum(case when CD_CUSTOMER = '''' then AMT_SALE else 0 end) as AMT_NONE, '
           +'         case when Sum(AMT_SALE) = 0 then 0 else Round(Sum(case when CD_CUSTOMER = '''' then AMT_SALE else 0 end) * 100 / Sum(AMT_SALE), 0) end as RT_NONE, '
           +vSQL
           +'         Sum(AMT_SALE) as AMT_SALE '
           +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
           +' where   CD_HEAD  =:P0 '
           +'   and   CD_STORE =:P1 '
           +'   and   YMD_SALE between :P2 and :P3 '
           +'   and   DS_SALE  <> ''V'' '
           +' group by CD_STORE, YMD_SALE',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  DM.ReadQuery(Query, GridBandedTableView);
  Result := GridBandedTableView.DataController.RecordCount > 0;

  // 푸터 점유율을 구한다
  if (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> null) and
     (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> 0) then
    for vIndex := 1 to GridBandedTableView.Bands.Count-1 do
      if (GridTableView.DataController.Summary.FooterSummaryValues[vIndex*3-1] <> null) then
        GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex*3] := FormatFloat('0.0%', RoundNumber(GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex*3-1] * 100 / GridBandedTableView.DataController.Summary.FooterSummaryValues[0], 0.1))
      else
        GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex*3] := EmptyStr;
end;

end.
