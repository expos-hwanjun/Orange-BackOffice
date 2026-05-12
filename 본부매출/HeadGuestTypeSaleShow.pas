// 객층별 매출 조회 (완료)

unit HeadGuestTypeSaleShow;



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
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  THeadGuestTypeSaleShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewSaleDate: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewNoneCnt: TcxGridBandedColumn;
    GridBandedTableViewNoneAmt: TcxGridBandedColumn;
    GridBandedTableViewNoneRate: TcxGridBandedColumn;
    GridLevel1: TcxGridLevel;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView1Column2: TcxGridBandedColumn;
    GridBandedTableView1NoneCnt: TcxGridBandedColumn;
    GridBandedTableView1NoneAmt: TcxGridBandedColumn;
    GridBandedTableView1NoneRate: TcxGridBandedColumn;

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
  HeadGuestTypeSaleShowForm: THeadGuestTypeSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure THeadGuestTypeSaleShowForm.FormCreate(Sender: TObject);
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
             StandardStore]);
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


      //시간대별 매출 칼럼
      GridBandedTableView1.Bands.Add;
      GridBandedTableView1.Bands[GridBandedTableView1.Bands.Count-1].Caption := Query.Fields[1].AsString;
      // 건수
      vColumn := GridBandedTableView1.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableView1NoneCnt.Caption;
        DataBinding.FieldName     := 'CNT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableView1NoneCnt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableView1NoneCnt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableView1NoneCnt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableView1NoneCnt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableView1NoneCnt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableView1NoneCnt.HeaderAlignmentHorz;
        Width                     := GridBandedTableView1NoneCnt.Width;
        Position.BandIndex        := GridBandedTableView1.Bands.Count-1;
        Position.ColIndex         := GridBandedTableView1NoneCnt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableView1NoneCnt.Position.RowIndex;
      end;
      GridBandedTableView1.DataController.Summary.FooterSummaryItems.Add;
      TcxGridTableSummaryItem(GridBandedTableView1.DataController.Summary.FooterSummaryItems[GridBandedTableView1.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 금액
      vColumn := GridBandedTableView1.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableView1NoneAmt.Caption;
        DataBinding.FieldName     := 'AMT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableView1NoneAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableView1NoneAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableView1NoneAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableView1NoneAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableView1NoneAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableView1NoneAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableView1NoneAmt.Width;
        Position.BandIndex        := GridBandedTableView1.Bands.Count-1;
        Position.ColIndex         := GridBandedTableView1NoneAmt.Position.ColIndex;
        Position.RowIndex         := GridBandedTableView1NoneAmt.Position.RowIndex;
      end;
      GridBandedTableView1.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView1.DataController.Summary.FooterSummaryItems[GridBandedTableView1.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView1.DataController.Summary.FooterSummaryItems[2].Format;
      GridBandedTableView1.DataController.Summary.FooterSummaryItems[GridBandedTableView1.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView1.DataController.Summary.FooterSummaryItems[2].Kind;
      TcxGridTableSummaryItem(GridBandedTableView1.DataController.Summary.FooterSummaryItems[GridBandedTableView1.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 점유율
      vColumn := GridBandedTableView1.CreateColumn;
      with vColumn do
      begin
        Caption                   := GridBandedTableView1NoneRate.Caption;
        DataBinding.FieldName     := 'RT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableView1NoneRate.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableView1NoneRate.PropertiesClassName;
        TcxCustomProgressBarProperties(Properties).BarStyle       := TcxCustomProgressBarProperties(GridBandedTableView1NoneRate.Properties).BarStyle;
        TcxCustomProgressBarProperties(Properties).BeginColor     := TcxCustomProgressBarProperties(GridBandedTableView1NoneRate.Properties).BeginColor;
        TcxCustomProgressBarProperties(Properties).EndColor       := TcxCustomProgressBarProperties(GridBandedTableView1NoneRate.Properties).EndColor;
        TcxCustomProgressBarProperties(Properties).SolidTextColor := TcxCustomProgressBarProperties(GridBandedTableView1NoneRate.Properties).SolidTextColor;
        FooterAlignmentHorz       := GridBandedTableView1NoneRate.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableView1NoneRate.HeaderAlignmentHorz;
        Options.Filtering         := GridBandedTableView1NoneRate.Options.Filtering;
        Width                     := GridBandedTableView1NoneRate.Width;
        Position.BandIndex        := GridBandedTableView1.Bands.Count-1;
        Position.ColIndex         := GridBandedTableView1NoneRate.Position.ColIndex;
        Position.RowIndex         := GridBandedTableView1NoneRate.Position.RowIndex;
      end;
      GridBandedTableView1.DataController.Summary.FooterSummaryItems.Add;
      TcxGridTableSummaryItem(GridBandedTableView1.DataController.Summary.FooterSummaryItems[GridBandedTableView1.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure THeadGuestTypeSaleShowForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure THeadGuestTypeSaleShowForm.FormDestroy(Sender: TObject);
begin
  GuestTypeList.Free;

  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure THeadGuestTypeSaleShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function THeadGuestTypeSaleShowForm.DoSearch:Boolean;
var
  vSQL  : string;
  vIndex: Integer;
begin
//  inherited;
  vSQL := EmptyStr;
  if Grid.ActiveLevel = GridLevel then
  begin
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
             +'  from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +' where   CD_HEAD  =:P0 '
             +'   and   YMD_SALE between :P1 and :P2 '
             +'   and   DS_SALE  <> ''V'' '
             +' group by YMD_SALE',
              [HeadStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedTableView);

    // 푸터 점유율을 구한다
    if (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> null) and
       (GridBandedTableView.DataController.Summary.FooterSummaryValues[0] <> 0) then
    begin
      GridBandedTableView.DataController.Summary.FooterSummaryValues[3] := FormatFloat('0.0%', RoundNumber(GridBandedTableView.DataController.Summary.FooterSummaryValues[2] * 100 / GridBandedTableView.DataController.Summary.FooterSummaryValues[0], 0.1));
      for vIndex := 1 to GridBandedTableView.Bands.Count-1 do
        if (GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex*3-1] <> null) then
          GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex*3] := FormatFloat('0.0%', RoundNumber(GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex*3-1] * 100 / GridBandedTableView.DataController.Summary.FooterSummaryValues[0], 0.1))
        else
          GridBandedTableView.DataController.Summary.FooterSummaryValues[vIndex*3] := EmptyStr;
    end;
  end
  else
  begin
    for vIndex := 0 to GuestTypeList.Count-1 do
      if GuestTypeList[vIndex] <> EmptyStr then
        vSQL := vSQL
              +'Sum(case when s.CD_CUSTOMER = '''+GuestTypeList[vIndex]+''' then s.CNT_PERSON else 0 end) as CNT_'+GuestTypeList[vIndex]+', '
              +'Sum(case when s.CD_CUSTOMER = '''+GuestTypeList[vIndex]+''' then s.AMT_SALE else 0 end) as AMT_'+GuestTypeList[vIndex]+', '
              +'Ifnull(case when Sum(s.AMT_SALE) = 0 then 0 else Round(Sum(case when s.CD_CUSTOMER = '''+GuestTypeList[vIndex]+''' then s.AMT_SALE else 0 end) * 100 / Sum(s.AMT_SALE), 0) end,0) as RT_'+GuestTypeList[vIndex]+', ';

    OpenQuery('select t.NM_CODE1 as TIME_ZONE, '
             +'       Sum(case when s.CD_CUSTOMER = '''' then s.CNT_PERSON  else 0 end) as CNT_NONE, '
             +'       Sum(case when s.CD_CUSTOMER = '''' then s.AMT_SALE else 0 end) as AMT_NONE, '
             +'       Ifnull(case when Sum(s.AMT_SALE) = 0 then 0 else Round(Sum(case when s.CD_CUSTOMER = '''' then s.AMT_SALE else 0 end) * 100 / Sum(s.AMT_SALE), 0) end,0) as RT_NONE, '
             +vSQL
             +'         Sum(s.AMT_SALE) as AMT_SALE '
             +'  from MS_CODE as t left outer join '
             +'      (select CD_TIME, '
             +'              CD_CUSTOMER, '
             +'              Sum(CNT_PERSON) as CNT_PERSON, '
             +'              SUM(AMT_SALE) as AMT_SALE '
             +'         from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'        where CD_HEAD =:P0 '
             +'          and YMD_SALE between :P2 and :P3 '
             +'          and DS_SALE <> ''V'' '
             +'        group by CD_TIME, CD_CUSTOMER '
             +'      ) as s on t.CD_CODE = s.CD_TIME '
             +' where t.CD_HEAD  =:P0 '
             +'   and t.CD_STORE =:P1 '
             +'   and t.CD_KIND  =''15'' '
             +'   and t.DS_STATUS = ''0'' '
             +' group by t.NM_CODE1 ',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedTableView1);

    // 푸터 점유율을 구한다
    if (GridBandedTableView1.DataController.Summary.FooterSummaryValues[0] <> null) and
       (GridBandedTableView1.DataController.Summary.FooterSummaryValues[0] <> 0) then
    begin
      GridBandedTableView1.DataController.Summary.FooterSummaryValues[3] := FormatFloat('0.0%', RoundNumber(GridBandedTableView1.DataController.Summary.FooterSummaryValues[2] * 100 / GridBandedTableView1.DataController.Summary.FooterSummaryValues[0], 0.1));

      for vIndex := 1 to GridBandedTableView1.Bands.Count-1 do
        if (GridBandedTableView1.DataController.Summary.FooterSummaryValues[vIndex*3-1] <> null) then
          GridBandedTableView1.DataController.Summary.FooterSummaryValues[vIndex*3] := FormatFloat('0.0%', RoundNumber(GridBandedTableView1.DataController.Summary.FooterSummaryValues[vIndex*3-1] * 100 / GridBandedTableView1.DataController.Summary.FooterSummaryValues[0], 0.1))
        else
          GridBandedTableView1.DataController.Summary.FooterSummaryValues[vIndex*3] := EmptyStr;
    end;
  end;
end;

end.
