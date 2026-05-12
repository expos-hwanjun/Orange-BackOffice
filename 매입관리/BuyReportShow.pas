// 매입 일보

unit BuyReportShow;



interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  AdvToolBar, AdvToolBarStylers, Vcl.ExtCtrls, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxGridBandedTableView, cxCurrencyEdit, frxClass;

type
  TBuyReportShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewCompanyCode: TcxGridBandedColumn;
    GridBandedTableViewCompanyName: TcxGridBandedColumn;
    GridBandedTableViewBuyNo: TcxGridBandedColumn;
    GridBandedTableViewNetAmt: TcxGridBandedColumn;
    GridBandedTableViewVatAmt: TcxGridBandedColumn;
    GridBandedTableViewCashAmt: TcxGridBandedColumn;
    GridBandedTableViewCreditAmt: TcxGridBandedColumn;
    GridBandedTableViewBuyAmt: TcxGridBandedColumn;
    FastReport: TfrxReport;
    FastReportDataSet: TfrxUserDataSet;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FastReportDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);

  private
    procedure Print(aPrint: Boolean = true);

  protected
    function  DoSearch:Boolean; override;
    procedure DoPrint; override;
    procedure DoPreview; override;
  end;

var
  BuyReportShowForm: TBuyReportShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyReportShowForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TBuyReportShowForm.ConditionToolBarFromDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TBuyReportShowForm.DoSearch: Boolean;
begin
//inherited;
  ConditionToolBarFromDateEdit.PostEditValue;
  Result := false;
  if OpenQuery('select   b.CD_TRDPL, '
              +'         t.NM_TRDPL, '
              +'         b.YMD_BUY + ''-'' + b.NO_BUY  as NO_BUY, '
              +'         b.AMT_DUTY + b.AMT_DUTYFREE as AMT_DUTY, '
              +'         b.AMT_TAX, '
              +'         b.AMT_BUY, '
              +'         b.AMT_CASH, '
              +'         b.AMT_TRUST '
              +'from     SL_BUY_H as b inner join '
              +'         MS_TRD   as t on b.CD_STORE = t.CD_STORE and b.CD_TRDPL = t.CD_TRDPL '
              +'where    b.CD_STORE = :P0 '
              +'  and    b.YMD_BUY  = :P1 '
              +'order by b.CD_STORE, b.YMD_BUY, b.NO_BUY',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date)]) then
    Result := DM.ReadQuery(Query, GridBandedTableView);
end;
//------------------------------------------------------------------------------
// 출력
procedure TBuyReportShowForm.DoPrint;
begin
//inherited;
  Print;
end;
//------------------------------------------------------------------------------
// 미리보기
procedure TBuyReportShowForm.DoPreview;
begin
//inherited;
  Print(false);
end;
//------------------------------------------------------------------------------
// 실제 출력
procedure TBuyReportShowForm.Print(aPrint: Boolean);
var
  vMemo: TfrxMemoView;
begin
  vMemo := TfrxMemoView(FastReport.FindObject('StoreNameMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := StoreName;
  vMemo := TfrxMemoView(FastReport.FindObject('DateMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatDateTime('yyyy-mm-dd(ddd)', ConditionToolBarFromDateEdit.Date);

  // 출력
  if aPrint then
    FastReport.Print
  else
    FastReport.ShowReport;
end;
//------------------------------------------------------------------------------
// 매입일보 출력 데이터 얻기
procedure TBuyReportShowForm.FastReportDataSetNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to GridBandedTableView.ColumnCount-1 do
    if VarName = GridBandedTableView.Columns[vIndex].DataBinding.FieldName then
    begin
      if GridBandedTableView.DataController.RecordCount > FastReportDataSet.RecNo then
        Value := GridBandedTableView.DataController.Values[FastReportDataSet.RecNo, vIndex]
      else
        Value := null;
      Break;
    end;
end;
//------------------------------------------------------------------------------
// 매입일보 출력 EOF
procedure TBuyReportShowForm.FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  inherited;

  if GridBandedTableView.DataController.RecordCount <= 35 then
    Eof := FastReportDataSet.RecNo >= 35
  else if GridBandedTableView.DataController.RecordCount <= 40 then
    Eof := FastReportDataSet.RecNo >= 40
  else if GridBandedTableView.DataController.RecordCount <= 83 then
    Eof := FastReportDataSet.RecNo >= 83
  else
    Eof := FastReportDataSet.RecNo >= 131;
end;

end.
