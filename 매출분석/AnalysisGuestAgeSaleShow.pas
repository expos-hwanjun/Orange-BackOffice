// 객층별 매출 조회 (완료)

unit AnalysisGuestAgeSaleShow;



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
  TAnalysisGuestAgeSaleShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewSaleDate: TcxGridBandedColumn;
    GridBandedTableViewSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewNoneCount: TcxGridBandedColumn;
    GridBandedTableViewNoneSaleAmt: TcxGridBandedColumn;
    GridBandedTableViewRate: TcxGridBandedColumn;

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
  AnalysisGuestAgeSaleShowForm: TAnalysisGuestAgeSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TAnalysisGuestAgeSaleShowForm.FormCreate(Sender: TObject);
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
           +'   and   CD_KIND   = ''14'' '
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
        Caption                   := '고객수';
        DataBinding.FieldName     := 'CNT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewSaleAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewSaleAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewSaleAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewSaleAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewSaleAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewSaleAmt.HeaderAlignmentHorz;
        Width                     := 50;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := 0;
        Position.RowIndex         := GridBandedTableViewSaleAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[1].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 금액
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := '금액';
        DataBinding.FieldName     := 'AMT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     := GridBandedTableViewSaleAmt.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewSaleAmt.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewSaleAmt.Properties.Alignment.Horz;
        TcxCustomCurrencyEditProperties(Properties).DisplayFormat := TcxCustomCurrencyEditProperties(GridBandedTableViewSaleAmt.Properties).DisplayFormat;
        FooterAlignmentHorz       := GridBandedTableViewSaleAmt.FooterAlignmentHorz;
        HeaderAlignmentHorz       := GridBandedTableViewSaleAmt.HeaderAlignmentHorz;
        Width                     := GridBandedTableViewSaleAmt.Width-20;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := 1;
        Position.RowIndex         := GridBandedTableViewSaleAmt.Position.RowIndex;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[2].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[2].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
      // 점유율
      vColumn := GridBandedTableView.CreateColumn;
      with vColumn do
      begin
        Caption                   := '점유율';
        DataBinding.FieldName     := 'RT_'+Query.Fields[0].AsString;
        DataBinding.ValueType     :=  GridBandedTableViewRate.DataBinding.ValueType;
        PropertiesClassName       := GridBandedTableViewRate.PropertiesClassName;
        Properties.Alignment.Horz := GridBandedTableViewRate.Properties.Alignment.Horz;
        TcxCustomProgressBarProperties(Properties).BarStyle       := cxbsGradient;
        TcxCustomProgressBarProperties(Properties).BeginColor     := clSkyBlue;
        TcxCustomProgressBarProperties(Properties).EndColor       := clBlue;
        TcxCustomProgressBarProperties(Properties).SolidTextColor := true;
        HeaderAlignmentHorz       := taCenter;
        Options.Filtering         := false;
        Width                     := 50;
        Position.BandIndex        := GridBandedTableView.Bands.Count-1;
        Position.ColIndex         := 2;
        Position.RowIndex         := 0;
        FooterAlignmentHorz       := taRightJustify;
      end;
      GridBandedTableView.DataController.Summary.FooterSummaryItems.Add;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridBandedTableView.DataController.Summary.FooterSummaryItems[3].Format;
      GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := GridBandedTableView.DataController.Summary.FooterSummaryItems[3].Kind;
      TcxGridTableSummaryItem(GridBandedTableView.DataController.Summary.FooterSummaryItems[GridBandedTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;

      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TAnalysisGuestAgeSaleShowForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼을 없앨 때
procedure TAnalysisGuestAgeSaleShowForm.FormDestroy(Sender: TObject);
begin
  GuestTypeList.Free;

  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TAnalysisGuestAgeSaleShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TAnalysisGuestAgeSaleShowForm.DoSearch:Boolean;
var
  vRow,
  vCol,
  vIndex: Integer;
  vSQL :String;
begin
  inherited;
  vSQL := EmptyStr;
  for vIndex := 0 to GuestTypeList.Count-1 do
    if GuestTypeList[vIndex] <> EmptyStr then
      vSQL := vSQL
            +Format('0 as CNT_%s,',[GuestTypeList[vIndex]])
            +Format('0 as AMT_%s,',[GuestTypeList[vIndex]]);

  OpenQuery('select StoDW(t.YMD_SALE) as YMD_SALE, '
           +vSQL
           +'       SUM(CNT_PERSON) as CNT_PERSON, '
           +'       SUM(t.AMT_SALE) as AMT_SALE, '
           +'       s.AMT_SALE as AMT_SALE_TOT '
           +' from ( '
           +'	    	select h.YMD_SALE, '
           +'          		 h.NO_POS, '
           +'	    		     h.NO_RCP, '
           +'	    			   ''000'' as CD_AGE, '
           +'	    			   h.CNT_PERSON - Ifnull(a.CNT_PERSON,0) as CNT_PERSON, '
           +'	    			   case when h.CNT_PERSON - Ifnull(a.CNT_PERSON,0) = 1 then h.AMT_SALE else 0 end AMT_SALE '
           +'         from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'h left outer join')
           +'	    		    (select YMD_SALE, '
           +'	    					      NO_POS, '
           +'	    					      NO_RCP, '
           +'	    					      SUM(CNT_PERSON) as CNT_PERSON '
           +'	    			     from SL_SALE_AGE '
           +'	    			    where CD_HEAD  =:P0 '
           +'                 and CD_STORE =:P1 '
           +'	    				    and YMD_SALE Between :P2 and :P3 '
           +'	    			    group by YMD_SALE, NO_POS, NO_RCP '
           +'	    		     ) a on a.YMD_SALE = h.YMD_SALE and a.NO_POS = h.NO_POS and a.NO_RCP = h.NO_RCP '
           +'	    	 where h.CD_HEAD  =:P0 '
           +'          and h.CD_STORE =:P1 '
           +'	    	   and h.YMD_SALE Between :P2 and :P3 '
           +'          and h.DS_SALE <> ''V'' '
           +'	    	) t inner join '
           +'  	   (select YMD_SALE, '
           +'  			       SUM(AMT_SALE) as AMT_SALE '
           +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
           +'  		 where CD_HEAD  =:P0 '
           +'        and CD_STORE =:P1 '
           +'  		   and YMD_SALE Between :P2 and :P3 '
           +'  		   and DS_SALE  <> ''V'' '
           +'  		 group by YMD_SALE '
           +'  	    ) s on s.YMD_SALE = t.YMD_SALE '
           +'group by t.YMD_SALE, t.CD_AGE, s.AMT_SALE '
           +'order by 1 ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result :=   DM.ReadQuery(Query, GridBandedTableView);

  OpenQuery('select StoDW(t.YMD_SALE) as YMD_SALE, '
           +'       t.CD_AGE, '
           +'       SUM(t.CNT_PERSON) AS CNT_PERSON, '
           +'       SUM(t.AMT_SALE) AS AMT_SALE '
           +'  from (select h.YMD_SALE, '
           +'	    	 	      a.CD_AGE, '
           +'	    	 	      a.CNT_PERSON, '
           +'	    	 	      DivFlt(h.AMT_SALE, h.CNT_PERSON) * a.CNT_PERSON as AMT_SALE '
           +'          from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'h left outer join')
           +'	    	 	     (select YMD_SALE, '
           +'	    	 			         NO_POS, '
           +'	    	 			         NO_RCP, '
           +'	    	 			         CD_AGE, '
           +'	    	 			         SUM(CNT_PERSON) as CNT_PERSON '
           +'	    	 		      from SL_SALE_AGE '
           +'	    	 		     where CD_HEAD  =:P0 '
           +'                     and CD_STORE =:P1 '
           +'	    	 		       and YMD_SALE BETWEEN :P2 AND :P3 '
           +'	    	 	        group by YMD_SALE, NO_POS, NO_RCP, CD_AGE '
           +'	    	 	      ) a on a.YMD_SALE = h.YMD_SALE and a.NO_POS = h.NO_POS and a.NO_RCP = h.NO_RCP '
           +'	         where  h.CD_HEAD  =:P0 '
           +'             and  h.CD_STORE =:P1 '
           +'	           and  h.YMD_SALE BETWEEN :P2 AND :P3 '
           +'	           and h.DS_SALE <> ''V'' '
           +'       ) AS t '
           +' group by t.YMD_SALE, t.CD_AGE ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);

  GridBandedTableView.DataController.BeginUpdate;
  while not Query.Eof do
  begin
    vRow := GridBandedTableView.DataController.FindRecordIndexByText(0, GridBandedTableViewSaleDate.Index, Query.Fields[0].AsString, false, false, true);
    for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
    begin
      if GridBandedTableView.Columns[vIndex].DataBinding.FieldName = 'CNT_'+Query.Fields[1].AsString then
        GridBandedTableView.DataController.Values[vRow, vIndex] := Query.Fields[2].AsCurrency
      else if GridBandedTableView.Columns[vIndex].DataBinding.FieldName = 'AMT_'+Query.Fields[1].AsString then
        GridBandedTableView.DataController.Values[vRow, vIndex] := Query.Fields[3].AsCurrency;
    end;
    Query.Next;
  end;
  GridBandedTableView.DataController.EndUpdate;
  Query.Close;


  GridBandedTableView.DataController.BeginUpdate;
  for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
  begin
    vCol := 4;
    while vCol < GridBandedTableView.ColumnCount do
    begin
      if GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index] = 0 then
        GridBandedTableView.DataController.Values[vIndex, vCol] := 0
      else
        GridBandedTableView.DataController.Values[vIndex, vCol] := RoundNumber(NVL(GridBandedTableView.DataController.Values[vIndex, vCol-1],0) / GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewSaleAmt.Index] * 100, 0.01);
      Inc(vCol, 3);
    end;
  end;
  GridBandedTableView.DataController.EndUpdate;

  GridBandedTableView.DataController.BeginUpdate;
  vCol := 3;
  while vCol < GridBandedTableView.ColumnCount do
  begin
    //점유율 푸터
    if NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[0],0) = 0 then
      GridBandedTableView.DataController.Summary.FooterSummaryValues[vCol] := 0
    else
      GridBandedTableView.DataController.Summary.FooterSummaryValues[vCol] := RoundNumber(NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[vCol-1],0) / NVL(GridBandedTableView.DataController.Summary.FooterSummaryValues[0],0) * 100, 0.01);
    Inc(vCol, 3);
  end;
  GridBandedTableView.DataController.EndUpdate;
end;

end.
