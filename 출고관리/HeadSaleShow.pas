unit HeadSaleShow;

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
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridDBTableView, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, cxCurrencyEdit, frxClass;

type
  THeadSaleShowForm = class(TInheritShow2Form)
    ListGrid: TcxGrid;
    ListGridTableView: TcxGridTableView;
    ListGridTableViewSaleDate: TcxGridColumn;
    ListGridTableViewYmdOrder: TcxGridColumn;
    ListGridLevel: TcxGridLevel;
    GridSplitter: TAdvSplitter;
    GridDBTableViewStoreName: TcxGridDBColumn;
    GridDBTableViewLogistics: TcxGridDBColumn;
    GridDBTableViewSaleNo: TcxGridDBColumn;
    GridDBTableViewNetAmt: TcxGridDBColumn;
    GridDBTableViewTaxAmt: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewSaleDate: TcxGridDBColumn;
    GridDBTableViewSaleUser: TcxGridDBColumn;
    GridDBTableViewLink: TcxGridDBColumn;
    GridSubDBTableViewSeq: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewUnit: TcxGridDBColumn;
    GridSubDBTableViewOrderQty: TcxGridDBColumn;
    GridSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubDBTableViewSalePrice: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewLink: TcxGridDBColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    GridDBTableViewStatus: TcxGridDBColumn;
    GridDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewProfitAmt: TcxGridDBColumn;
    GridDBTableViewProfitRate: TcxGridDBColumn;
    GridSubDBTableViewProfitAmt: TcxGridDBColumn;
    GridSubDBTableViewProfitRate: TcxGridDBColumn;
    FastReport: TfrxReport;
    FastReportSaleDataSet: TfrxUserDataSet;
    FastReportDataSet: TfrxUserDataSet;
    GridTableView1: TcxGridTableView;
    GridDBTableViewOrderNo: TcxGridDBColumn;
    GridDBTableViewConfirmDate: TcxGridDBColumn;
    GridDBTableViewOrderDate: TcxGridDBColumn;
    procedure GridSubDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
    procedure ListGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure FastReportSaleDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportSaleDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
  private
    RecordCount :Integer;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadSaleShowForm: THeadSaleShowForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

procedure THeadSaleShowForm.FastReportDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportDataSet.RecNo >= GridTableView.DataController.RecordCount;
end;

procedure THeadSaleShowForm.FastReportDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.ColumnCount-1 do
    if GridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := GridTableView.DataController.Values[FastReportDataSet.RecNo, vIndex];
      break;
    end;
end;

procedure THeadSaleShowForm.FastReportSaleDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView1.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := (FastReportSaleDataSet.RecNo >= RecordCount);
end;

procedure THeadSaleShowForm.FastReportSaleDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
  vTemp : AnsiString;
begin
  inherited;
  for vIndex := 0 to GridTableView1.ColumnCount-1 do
    if GridTableView1.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      if (FastReportSaleDataSet.RecNo < GridTableView1.DataController.RecordCount) then
      begin
        if GridTableView1.Columns[vIndex].DataBinding.FieldName = 'SEQ' then
          Value := FormatFloat('###', GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
       else if (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'AMT_SALE') or
           (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'AMT_NET') or
           (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'QTY_SALE') or
           (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'AMT_VAT')  then
          Value := FormatFloat('#,0',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
        else if (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'PR_SALE') then
          Value := FormatFloat('#,#',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
        else if (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'QTY_BOX') then
          Value := FormatFloat('#,#',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
        else if (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'QTY_SALE') then
        begin
          Value := FormatFloat('#,0.##',GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex]);
        end
        else
        begin
          Value := Trim(NVL(GridTableView1.DataController.Values[FastReportSaleDataSet.RecNo, vIndex],''));
        end;
      end
      else
        if (FastReportSaleDataSet.RecNo = GridTableView1.DataController.RecordCount) and (GridTableView1.Columns[vIndex].DataBinding.FieldName = 'NM_GOODS') then
          Value := '         -  이하여백  -  '
        else
          Value := '';
      break;
    end;
end;

procedure THeadSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure THeadSaleShowForm.GridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then Exit;

  ButtonToolBarDeleteButton.Enabled := AFocusedRecord.Values[GridDBTableViewStatus.Index] = '출고';
end;

procedure THeadSaleShowForm.GridSubDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridSubDBTableViewOrderQty.Index] <> ARecord.Values[GridSubDBTableViewSaleQty.Index] then
    AStyle := StyleFontRed;
end;

procedure THeadSaleShowForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('출고서를 삭제하시겠습니까?') then Exit;

  ExecQuery('delete from OL_SALE_H '
           +' where CD_HEAD  =:P0 '
           +'   and YMD_SALE =:P1 '
           +'   and NO_SALE  =:P2;',
           [HeadStoreCode,
            GetOnlyNumber(ListGridTableView.DataController.Values[ListGridTableView.DataController.GetFocusedRecordIndex, ListGridTableViewSaleDate.Index]),
            GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleNo.Index]],false);

  ExecQuery('delete from OL_SALE_D '
           +' where CD_HEAD  =:P0 '
           +'   and YMD_SALE =:P1 '
           +'   and NO_SALE  =:P2;',
           [HeadStoreCode,
            GetOnlyNumber(ListGridTableView.DataController.Values[ListGridTableView.DataController.GetFocusedRecordIndex, ListGridTableViewSaleDate.Index]),
            GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleNo.Index]],false);

  if ExecQuery('update OL_ORDER_D '
              +'   set QTY_SALE = 0, '
              +'       SALE_REF = null, '
              +'       DT_SALE  = null '
              +' where CD_HEAD  =:P0 '
              +'   and SALE_REF =ConCat(:P1,:P2);',
              [HeadStoreCode,
               GetOnlyNumber(ListGridTableView.DataController.Values[ListGridTableView.DataController.GetFocusedRecordIndex, ListGridTableViewSaleDate.Index]),
               GridDBTableView.DataController.Values[GridDBTableView.DataController.GetFocusedRecordIndex, GridDBTableViewSaleNo.Index]],true) then
  begin
    GridDBTableView.DataController.DeleteRecord(GridDBTableView.DataController.GetFocusedRecordIndex);
  end;

end;

function THeadSaleShowForm.DoSearch: Boolean;
begin
  OpenQuery('select StoD(a.YMD_SALE) as YMD_SALE '
           +'  from OL_SALE_H a left outer join '
           +'       MS_STORE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE between :P1 and :P2 '
           +'   and b.NM_STORE like ConCat(''%'',:P3,''%'') '
           +' group by a.YMD_SALE '
           +' order by a.YMD_SALE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, ListGridTableView);
  if Result then
    ListGridTableView.Controller.FocusedRowIndex := 0;
end;

procedure THeadSaleShowForm.ListGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then
  begin
    GridDBTableView.DataController.DataSource    := nil;
    GridSubDBTableView.DataController.DataSource := nil;
    Exit;
  end;
  OpenQuery('select a.NO_SALE, '
           +'       case a.DS_STATUS when ''D'' then ''출고'' when ''B'' then ''입고'' end as DS_STATUS, '
           +'       b.NM_STORE, '
           +'       c.NM_TRDPL as NM_LOGISTICS, '
           +'       a.AMT_DUTY as AMT_NET, '
           +'       a.AMT_DUTYFREE, '
           +'       a.AMT_TAX, '
           +'       a.AMT_SALE, '
           +'       a.AMT_SALE - a.AMT_BUY as AMT_PROFIT, '
           +'       GetProfitRate(a.AMT_BUY,  a.AMT_SALE) as RATE_PROFIT, '
           +'       d.DT_INSERT as DT_ORDER, '
           +'       a.ORDER_REF, '
           +'       d.DT_CONFIRM, '
           +'       e.NM_SAWON as ORDER_CONFRIM_USER, '
           +'       a.DT_INSERT as DT_SALE, '
           +'       f.NM_SAWON as SALE_USER '
           +'  from OL_SALE_H  a inner join '
           +'       MS_STORE   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE inner join '
           +'       MS_TRD     c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = ''00000000'' and c.CD_TRDPL = a.CD_LOGISTICS left outer join '
           +'       OL_ORDER_H d on d.CD_HEAD = a.CD_HEAD and d.CD_STORE = a.CD_STORE   and d.YMD_ORDER = Left(a.ORDER_REF,8) and d.NO_ORDER = Right(a.ORDER_REF,4) left outer join '
           +'       MS_SAWON   e on e.CD_HEAD = d.CD_HEAD and e.CD_STORE  = d.CD_STORE and e.CD_SAWON = d.CD_SAWON_CONFIRM left outer join '
           +'       MS_SAWON   f on f.CD_HEAD = a.CD_HEAD and f.CD_STORE  = ''00000000'' and f.CD_SAWON = a.CD_SAWON  '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE =:P1 '
           +'   and a.DS_SALE  =''S'' '
           +'   and b.NM_STORE like ConCat(''%'',:P2,''%'') '
           +' order by a.NO_SALE ',
           [HeadStoreCode,
            GetOnlyNumber(AFocusedRecord.Values[ListGridTableViewSaleDate.Index]),
            ConditionToolBarEdit.Text]);

  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  OpenQuery('select a.SEQ, '
           +'       a.CD_GOODS, '
           +'       b.NM_GOODS, '
           +'       b.NM_UNIT, '
           +'       a.QTY_ORDER, '
           +'       a.QTY_SALE, '
           +'       a.PR_SALE, '
           +'       a.AMT_SALE, '
           +'       a.AMT_SALE - a.AMT_BUY as AMT_PROFIT, '
           +'       GetProfitRate(a.AMT_BUY,  a.AMT_SALE) as RATE_PROFIT, '
           +'       a.NO_SALE '
           +'  from OL_SALE_D  a inner join '
           +'       MS_GOODS   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = ''00000000'' and b.CD_GOODS = a.CD_GOODS left outer join '
           +'       MS_STORE   c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE  '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE =:P1 '
           +'   and c.NM_STORE like ConCat(''%'',:P2,''%'') '
           +' order by a.NO_SALE, a.SEQ ',
           [HeadStoreCode,
            GetOnlyNumber(AFocusedRecord.Values[ListGridTableViewSaleDate.Index]),
            ConditionToolBarEdit.Text]);

  GridSubDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, GridSubDBTableView, SubMemData);
  GridSubDBTableView.DataController.DataSource := SubDataSource;
end;


end.
