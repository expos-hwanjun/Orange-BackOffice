unit CloseTaxReportShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxSkinsdxBarPainter,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxmdaset, dxPSCore,
  dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton;

type
  TCloseTaxReportShowForm = class(TInheritShow2Form)
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
    { Public declarations }
  end;

var
  CloseTaxReportShowForm: TCloseTaxReportShowForm;

implementation
uses Common;
{$R *.dfm}

{ TCloseTaxReportShowForm }

function TCloseTaxReportShowForm.DoSearch: Boolean;
var nCol, nRow, vCnt, vDutyAmt, vVatAmt, vTipAmt, vTotAmt :Integer;
    vCnt1, vDutyAmt1, vVatAmt1, vTipAmt1, vTotAmt1 :Integer;
    vCardFee : Double;
    vTemp    : String;
begin
  vCnt := 0; vDutyAmt := 0; vVatAmt := 0; vTipAmt := 0; vTotAmt := 0;
  vCnt1 := 0; vDutyAmt1 := 0; vVatAmt1 := 0; vTipAmt1 := 0; vTotAmt1 := 0;

  Query.Close;
  Query.SQL.Text :='SELECT CASE WHEN A.NM_CARD_BUY <> '''' THEN A.NM_CARD_BUY ELSE (SELECT TOP 1 NM_CODE1 FROM MS_CODE WHERE CD_STORE = A.CD_STORE AND CD_KIND = ''06'' AND NM_CODE2 = A.NO_CHAINPL) END AS NM_CARD_BUY, '
                  +'       SUM(CASE WHEN A.DS_TRD = ''1''  THEN 1 ELSE -1 END )  AS CNT_TOTAL, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''1'' THEN ISNULL(A.AMT_APPROVAL-A.AMT_VAT,0) ELSE ISNULL(A.AMT_APPROVAL-A.AMT_VAT,0) * -1 END, 0)) AS AMT_DUTY, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''1'' THEN ISNULL(A.AMT_VAT,0) ELSE ISNULL(A.AMT_VAT,0) * -1 END, 0)) AS AMT_TAX, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''1'' THEN ISNULL(A.AMT_APPROVAL,0) ELSE ISNULL(A.AMT_APPROVAL,0) * -1 END, 0)) AS AMT_TOTAL, '
                  +'       '''' as BIGO '
                  +'  FROM SL_CARD A (nolock) inner join '
                  +'       SL_SALE_H B (nolock) on A.CD_STORE   = B.CD_STORE AND A.YMD_SALE   = B.YMD_SALE AND A.NO_POS     = B.NO_POS AND A.NO_RCP = B.NO_RCP '
                  +' WHERE A.CD_STORE   =:P0 '
                  +'   AND CONVERT(VARCHAR(8), B.DT_SALE, 112) BETWEEN :P1 AND :P2 '
                  +'   AND A.CD_TRDPL = '''' '
                  +' GROUP BY A.CD_STORE, A.NO_CHAINPL, A.NM_CARD_BUY '
                  +'UNION ALL '
                  +'SELECT ''[ 소계 ]'', '
                  +'       SUM(CASE WHEN A.DS_TRD = ''1''  THEN 1 ELSE -1 END )  AS CNT_TOTAL, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''1'' THEN ISNULL(A.AMT_APPROVAL-A.AMT_VAT,0) ELSE ISNULL(A.AMT_APPROVAL-A.AMT_VAT,0) * -1 END, 0)) AS AMT_DUTY, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''1'' THEN ISNULL(A.AMT_VAT,0) ELSE ISNULL(A.AMT_VAT,0) * -1 END, 0)) AS AMT_TAX, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''1'' THEN ISNULL(A.AMT_APPROVAL,0) ELSE ISNULL(A.AMT_APPROVAL,0) * -1 END, 0)) AS AMT_TOTAL, '
                  +'       '''' '
                  +'  FROM SL_CARD A (nolock) inner join '
                  +'       SL_SALE_H B (nolock) on A.CD_STORE   = B.CD_STORE AND A.YMD_SALE   = B.YMD_SALE AND A.NO_POS     = B.NO_POS AND A.NO_RCP = B.NO_RCP '
                  +' WHERE A.CD_STORE   =:P0 '
                  +'   AND CONVERT(VARCHAR(8), B.DT_SALE, 112) BETWEEN :P1 AND :P2 '
                  +'   AND A.CD_TRDPL = '''' '
                  +' GROUP BY A.CD_STORE '
                  +'UNION ALL '
                  +'SELECT ''현금영수증'', '
                  +'       SUM(CASE WHEN A.DS_TRD = ''0''  THEN 1 ELSE -1 END )  AS CNT_TOTAL,  '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''0'' THEN ISNULL(A.AMT_APPROVAL-A.AMT_VAT,0) ELSE ISNULL(A.AMT_APPROVAL-A.AMT_VAT,0) * -1 END, 0)) AS AMT_DUTY, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''0'' THEN ISNULL(A.AMT_VAT,0) ELSE ISNULL(A.AMT_VAT,0) * -1 END, 0)) AS AMT_TAX, '
                  +'       SUM(ISNULL(CASE A.DS_TRD WHEN ''0'' THEN ISNULL(A.AMT_APPROVAL,0) ELSE ISNULL(A.AMT_APPROVAL,0) * -1 END, 0)) AS AMT_TOTAL,  '
                  +'       '''' '
                  +'  FROM SL_CASH A inner join '
                  +'       SL_SALE_H B (nolock) on A.CD_STORE   = B.CD_STORE AND A.YMD_SALE   = B.YMD_SALE AND A.NO_POS     = B.NO_POS AND A.NO_RCP = B.NO_RCP '
                  +' WHERE A.CD_STORE   =:P0 '
                  +'   AND CONVERT(VARCHAR(8), B.DT_SALE, 112) BETWEEN :P1 AND :P2 '
                  +'   AND A.CD_TRDPL = '''' '
                  +' GROUP BY A.CD_STORE '
                  +'UNION ALL '
                  +' SELECT ''현금'', '
                  +'       COUNT(NO_RCP)  AS CNT_TOTAL, '
                  +'       SUM(AMT_DUTY)  AS AMT_DUTY, '
                  +'       SUM(AMT_TAX)   AS AMT_TAX, '
                  +'       SUM(AMT_CASH+AMT_CHECK) AS AMT_TOTAL, '
                  +'       ''복합결제(카드+현금) 영수증금액을 제외한 현금금액''  '
                  +'  FROM SL_SALE_H (nolock) '
                  +' WHERE DS_SALE   <> ''V''  '
                  +'   AND AMT_CARD    = 0 '
                  +'   AND AMT_CASHRCP = 0 '
                  +'   AND CD_STORE    =:P0 '
                  +'   AND CONVERT(VARCHAR(8), DT_SALE, 112) BETWEEN :P1 AND :P2  '
                  +' GROUP BY CD_STORE ';
{
   Parameters[0].Value  := Common.StoreCode;
  ADOQuery1.Parameters[1].Value  := FFromDate;;
  ADOQuery1.Parameters[2].Value  := FToDate;
  ADOQuery1.Parameters[3].Value  := vTemp;
  ADOQuery1.Parameters[4].Value  := Common.StoreCode;
  ADOQuery1.Parameters[5].Value  := FFromDate;;
  ADOQuery1.Parameters[6].Value  := FToDate;
  ADOQuery1.Parameters[7].Value  := vTemp;
  ADOQuery1.Parameters[8].Value  := Common.StoreCode;
  ADOQuery1.Parameters[9].Value  := FFromDate;;
  ADOQuery1.Parameters[10].Value := FToDate;
  ADOQuery1.Parameters[11].Value := vTemp;
  ADOQuery1.Parameters[12].Value := Common.StoreCode;
  ADOQuery1.Parameters[13].Value := FFromDate;;
  ADOQuery1.Parameters[14].Value := FToDate;
  ADOQuery1.Open;

  gvGridView.DataController.DataSource := nil;
  dxMemData1.Close;
  dxMemData1.Active := True;
  while not ADOQuery1.Eof do
  begin
     dxMemData1.Append;


     dxMemData1.Fields[1].AsVariant := ADOQuery1.Fields[0].AsString;
     dxMemData1.Fields[2].AsVariant := ADOQuery1.Fields[1].AsInteger;
     dxMemData1.Fields[3].AsVariant := ADOQuery1.Fields[2].AsInteger;
     dxMemData1.Fields[4].AsVariant := ADOQuery1.Fields[3].AsInteger;
     dxMemData1.Fields[5].AsVariant := ADOQuery1.Fields[4].AsInteger;
     dxMemData1.Fields[6].AsVariant := ADOQuery1.Fields[5].AsInteger;
     dxMemData1.Fields[7].AsVariant := ADOQuery1.Fields[6].AsString;

     if (ADOQuery1.Fields[0].AsString = '[ 소계 ]') or (ADOQuery1.Fields[0].AsString = '현금영수증') or (ADOQuery1.Fields[0].AsString = '현금') then
     begin
       vCnt     := vCnt     +  ADOQuery1.Fields[1].AsInteger;
       vDutyAmt := vDutyAmt +  ADOQuery1.Fields[2].AsInteger;
       vVatAmt  := vVatAmt  +  ADOQuery1.Fields[3].AsInteger;
       vTipAmt  := vTipAmt  +  ADOQuery1.Fields[4].AsInteger;
       vTotAmt  := vTotAmt  +  ADOQuery1.Fields[5].AsInteger;
     end;

     if (ADOQuery1.Fields[0].AsString = '현금영수증') or (ADOQuery1.Fields[0].AsString = '현금') then
     begin
       vCnt1     := vCnt1     +  ADOQuery1.Fields[1].AsInteger;
       vDutyAmt1 := vDutyAmt1 +  ADOQuery1.Fields[2].AsInteger;
       vVatAmt1  := vVatAmt1  +  ADOQuery1.Fields[3].AsInteger;
       vTipAmt1  := vTipAmt1  +  ADOQuery1.Fields[4].AsInteger;
       vTotAmt1  := vTotAmt1  +  ADOQuery1.Fields[5].AsInteger;
     end;
     ADOQuery1.Next;
  end;

  dxMemData1.Append;
  dxMemData1.Fields[1].AsVariant := '[ 소계 ]';
  dxMemData1.Fields[2].AsVariant := vCnt1;
  dxMemData1.Fields[3].AsVariant := vDutyAmt1;
  dxMemData1.Fields[4].AsVariant := vVatAmt1;
  dxMemData1.Fields[5].AsVariant := vTipAmt1;
  dxMemData1.Fields[6].AsVariant := vTotAmt1;

  dxMemData1.Append;
  dxMemData1.Fields[1].AsVariant := '[ 합계 ]';
  dxMemData1.Fields[2].AsVariant := vCnt;
  dxMemData1.Fields[3].AsVariant := vDutyAmt;
  dxMemData1.Fields[4].AsVariant := vVatAmt;
  dxMemData1.Fields[5].AsVariant := vTipAmt;
  dxMemData1.Fields[6].AsVariant := vTotAmt;

  dxMemData1.Refresh;
  gvGridView.DataController.DataSource := DataSource1;
  Result := dxMemData1.RecordCount > 0;
}
end;

end.
