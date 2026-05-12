unit HeadMemberVisitShow;

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
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, DateUtils;

type
  THeadMemberVisitShowForm = class(TInheritShowForm)
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewTotalVisit: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    SelColum,
    FieldList: String;
    procedure SetColum;
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  HeadMemberVisitShowForm: THeadMemberVisitShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ THeadMemberVisitShowForm }

procedure THeadMemberVisitShowForm.ClearGrid;
var vIndex :Integer;
begin
  inherited;
  for vIndex := GridTableView.ColumnCount-1 downto 2 do
    GridTableView.Columns[vIndex].Free;
end;

function THeadMemberVisitShowForm.DoSearch: Boolean;
begin
  SetColum;
  OpenQuery('select '+ SelColum+ ' from (select b.NM_STORE, '
           +FieldList
           +'       a.CNT  '
           +'  from (select  CD_STORE, '
           +'                YMD_SALE, '
           +'                COUNT(CD_MEMBER) AS CNT '
           +'           from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
           +'          where CD_HEAD = :P0 '
           +'            and YMD_SALE Between :P1 and :P2 '
           +'            and CD_MEMBER <> '''' '
           +'          group by CD_STORE, YMD_SALE) a inner join '
           +'       MS_STORE  b ON b.CD_HEAD  = :P0 '
           +'                  and b.CD_STORE = a.CD_STORE '
           +' group by b.NM_STORE, a.YMD_SALE) as a '
           +'group by a.NM_STORE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadMemberVisitShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode := pmPrintPreviewExcel;
end;

procedure THeadMemberVisitShowForm.SetColum;
var vIndex,
    vCount :Integer;
    vColumn: TcxGridColumn;
begin
  GridTableView.DataController.RecordCount := 0;
  for vIndex := GridTableView.ColumnCount-1 downto 2 do
    GridTableView.Columns[vIndex].Free;

  vCount := DaysBetween(ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date);
  FieldList := '';
  SelColum  := '';
  for vIndex := 0 to vCount do
  begin
    FieldList := FieldList + Format('case when a.YMD_SALE = ''%s'' then a.CNT else 0 end as CNT_%s, ',[FormatDateTime('yyyymmdd', IncDay(ConditionToolBarFromDateEdit.Date, vIndex)),
                                                                                                       FormatDateTime('yyyymmdd', IncDay(ConditionToolBarFromDateEdit.Date, vIndex))]);
    SelColum := SelColum + Format('sum(CNT_%s) as CNT_%s, ',[FormatDateTime('yyyymmdd', IncDay(ConditionToolBarFromDateEdit.Date, vIndex)),
                                                             FormatDateTime('yyyymmdd', IncDay(ConditionToolBarFromDateEdit.Date, vIndex))]);
    vColumn := GridTableView.CreateColumn;
    with vColumn do
    begin
      Caption := FormatDateTime('mm-dd',IncDay(ConditionToolBarFromDateEdit.Date, vIndex));
      DataBinding.FieldName := 'CNT_'+FormatDateTime('yyyymmdd', IncDay(ConditionToolBarFromDateEdit.Date, vIndex));
      DataBinding.ValueType := 'Currency';
      Width   := 60;
      PropertiesClassName                                        := 'TcxCurrencyEditProperties';
      Properties.Alignment.Horz                                  := taRightJustify;
      Options.Filtering                                          := false;
      TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := '#,0';
      TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DecimalPlaces  :=0;
      HeaderAlignmentHorz := taCenter;
      FooterAlignmentHorz := taRightJustify;
    end;
    GridTableView.DataController.Summary.FooterSummaryItems.Add;
    GridTableView.DataController.Summary.FooterSummaryItems[GridTableView.DataController.Summary.FooterSummaryItems.Count-1].Format := GridTableView.DataController.Summary.FooterSummaryItems[0].Format;
    GridTableView.DataController.Summary.FooterSummaryItems[GridTableView.DataController.Summary.FooterSummaryItems.Count-1].Kind   := skSum;
    TcxGridTableSummaryItem(GridTableView.DataController.Summary.FooterSummaryItems[GridTableView.DataController.Summary.FooterSummaryItems.Count-1]).Column := vColumn;
  end;

  SelColum := 'a.NM_STORE, '+SelColum+' Sum(a.CNT) as CNT_TOTAL ';
end;

end.
