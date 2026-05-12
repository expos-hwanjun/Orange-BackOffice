unit CloseParkingTicketShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers, MaskUtils,
  dxPScxExtEditorProducers, cxLabel, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset;

type
  TCloseParkingTicketShowForm = class(TInheritShowForm)
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewCount: TcxGridColumn;
    GridTableViewTime: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  CloseParkingTicketShowForm: TCloseParkingTicketShowForm;

implementation
uses
   Common, DBModule;
{$R *.dfm}

{ TCloseParkingTicketShowForm }
//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCloseParkingTicketShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TCloseParkingTicketShowForm.DoSearch: Boolean;
begin
  try
    OpenQuery('select StoDW(YMD_SALE) as YMD_SALE, '
             +'       SEQ, '
             +'       TOT_MINUTE '
             +'  from SL_PARKING '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_SALE between :P2 and :P3 '
             +' order by YMD_SALE ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    FinishQuery;
  end;
end;

//==============================================================================
// 영수증프린터 출력
//------------------------------------------------------------------------------
procedure TCloseParkingTicketShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex  :Integer;
begin
  inherited;
  vPrintData := rptSizeBoth + rptAlignCenter + '주차증 발행내역'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+Common.StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'    발행일자 '+rptpStr+'           건수      시간(분)'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
      vPrintData := vPrintData + rptpStr+'   '+RPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index] ,11,' ')+rptpStr+'   '
                               + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewCount.Index]),10, ' ')
                               + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewTime.Index]),14, ' ')+#13;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptCharBold;
  vPrintData := vPrintData +  rptpStr+'      합   계  '+LPad(GridTableView.DataController.Summary.FooterSummaryValues[0],10,' ')+'건'
                                                       +LPad(GridTableView.DataController.Summary.FooterSummaryValues[1],12,' ')+'분';
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  Common.PrintPrinter(vPrintData);

  PrintPrinter(vPrintData);
end;

end.
