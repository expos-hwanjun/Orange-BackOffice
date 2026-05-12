unit ReserveEmpWorkPayShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, Menus, AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer,
  Uni, DB, MemDS, ImgList, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPScxPageControlProducer, dxPScxEditorProducers,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxExtEditorProducers, MaskUtils, StrUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TReserveEmpWorkPayShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewSawonName: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewWorkTime: TcxGridColumn;
    GridTableViewPayAmt: TcxGridColumn;
    cxLabel1: TcxLabel;
    GridTableViewHour: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  ReserveEmpWorkPayShowForm: TReserveEmpWorkPayShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TReserveEmpWorkPayShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  New(vCode);
  vCode^.Data := '5';
  ConditionToolBarComboBox.Properties.Items.AddObject('5분', TObject(vCode));
  New(vCode);
  vCode^.Data := '10';
  ConditionToolBarComboBox.Properties.Items.AddObject('10분', TObject(vCode));
  New(vCode);
  vCode^.Data := '30';
  ConditionToolBarComboBox.Properties.Items.AddObject('30분', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 2;
end;

function TReserveEmpWorkPayShowForm.DoSearch:Boolean;
var
    vCode  : PStrPointer;
    vTime  : String;
begin
  inherited;
  // 시급단위
  if ConditionToolBarComboBox.ItemIndex >= 0 then
    vTime      := GetStrPointerData(ConditionToolBarComboBox)
  else
    vTime := '1';

  OpenQuery('select StoDW(Date_Format(a.SETTLE_IN, ''%Y%m%d'')) as YMD_WORK, '
           +'       a.CD_SAWON, '
           +'       b.NM_SAWON, '
           +'       c.NM_CODE1 as NM_TIME, '
           +'  	    Date_Format(a.SETTLE_IN, ''%Y-%m-%d %H:%i'')	AS TIME_IN, '
           +'  	    Date_Format(a.SETTLE_OUT, ''%Y-%m-%d %H:%i'')	AS TIME_OUT, '
           +'       ConCat(Cast(DivInt(TIMESTAMPDIFF(minute, a.SETTLE_IN, a.SETTLE_OUT),60) as Char) ,''시간'', '
           +'              Cast(TIMESTAMPDIFF(minute, a.SETTLE_IN, a.SETTLE_OUT) % 60 as Char) ,''분'') AS WORK_TIME, '
           +'       Round(DivFlt((TIMESTAMPDIFF(minute, a.SETTLE_IN, a.SETTLE_OUT) - TIMESTAMPDIFF(minute, a.SETTLE_IN, a.SETTLE_OUT) % 60 % :P4), 60)  *  Ifnull(Cast(GetOnlyNumber(c.NM_CODE2) as int),0), -1) as AMT_PAY, '
           +'       TIMESTAMPDIFF(minute, a.SETTLE_IN, a.SETTLE_OUT) as WORK_HOUR '
           +'  from SL_SAWONWORK a inner join '
           +'       MS_SAWON as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON left outer join '
           +'       MS_CODE  as c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_TIME  = c.CD_CODE and c.CD_KIND = ''10'' '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and Date_Format(a.SETTLE_IN, ''%Y%m%d'') between :P2 and :P3 '
           +'   and Ifnull(a.SETTLE_OUT,'''') <> '''' '
           +'   and (b.CD_SAWON = :P5 or b.NM_SAWON like ConCat(''%'',:P5,''%'')) '
           +' order by a.SETTLE_IN, a.CD_SAWON',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             StrToInt(vTime),
             ConditionToolBarEdit.Text]);
  DM.ReadQuery(Query, GridTableView);
  GridTableView.DataController.Summary.FooterSummaryValues[3] :=Format('%d시%d분',[NVL(GridTableView.DataController.Summary.FooterSummaryValues[2],0) div 60, NVL(GridTableView.DataController.Summary.FooterSummaryValues[2],0) mod 60]);
  Result := GridTableView.DataController.RecordCount > 0;
end;

procedure TReserveEmpWorkPayShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex :Integer;
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  vPrintData := rptSizeBoth + rptAlignCenter + '시급내역'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+Common.StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+' 근무일자    사원명      근무시간 시급금액'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;

  with GridTableView do
  begin
    For vIndex := 0 to DataController.FilteredRecordCount-1 do
    begin
      vPrintData := vPrintData + rptpStr+LeftStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], 0],10)+' '
                               + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSawonName.Index], 1, 12),12,' ')
                               + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewWorkTime.Index],10,' ')
                               + LPad(FormatFloat('#,0', NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewPayAmt.Index],0)),9,' ')+#13;
    end;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptCharBold;
  vPrintData := vPrintData +  rptpStr+'      합   계     '+LPad(FormatFloat('#,0',GridTableView.DataController.Summary.FooterSummaryValues[1]), 24,' ') + #13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

end.
