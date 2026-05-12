unit StockSurveyPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxButtonEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockSurveyPrintForm = class(TInheritShowForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSpec: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewSurveyQty: TcxGridColumn;
    ConditionCompanyNameLabel: TcxLabel;
    ConditionCompanyCodeEdit: TcxButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure ConditionCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionCompanyCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
    function  SearchCompany(aCompany: string = ''): string;
  protected
    function  DoSearch: Boolean; override; // 조회
  public
    { Public declarations }
  end;

var
  StockSurveyPrintForm: TStockSurveyPrintForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

{ TStockSurveyPrintForm }

procedure TStockSurveyPrintForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  vPrintData := rptSizeBoth + rptAlignCenter + '재고실사표'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  if ConditionCompanyNameLabel.Caption <> '' then
    vPrintData := vPrintData +  '매입처: '+ConditionCompanyNameLabel.Caption+#13;

  vPrintData := vPrintData +  rptOneLine+#13;
  if PrintBlank = 0 then
    vPrintData := vPrintData +  '  상품코드       상품명      현재고  실사'+#13
//                               123456789012345678901234567890123456789012345678
  else
    vPrintData := vPrintData +  '  상품코드          상품명         현재고  실사'+#13;
//                               123456789012123456789012345678901234512345678901
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    if PrintBlank = 0 then
      vPrintData := vPrintData + RPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsCode.Index], 13, ' ')
                               + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsName.Index] ,1,17),17,' ')
                               + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewStockQty.Index], 5, ' ')+#13
    else
      vPrintData := vPrintData + RPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsCode.Index], 13, ' ')
                               + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsName.Index] ,1,23),23,' ')
                               + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewStockQty.Index], 5, ' ')+#13;

  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

procedure TStockSurveyPrintForm.ConditionCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  ConditionCompanyCodeEdit.Clear;
  SearchCompany(ConditionCompanyCodeEdit.Text);
end;

procedure TStockSurveyPrintForm.ConditionCompanyCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := SearchCompany(DisplayValue);
end;

function TStockSurveyPrintForm.DoSearch: Boolean;
var vWhere :String;
begin
  if ConditionCompanyCodeEdit.Text <> EmptyStr then
  begin
    vWhere := Format(' and g.CD_TRDPL = ''%s'' ',[ConditionCompanyCodeEdit.Text]);
    ReportSubTitle := Format('거래처 : %s [%s] ',[ConditionCompanyNameLabel.Caption, ConditionCompanyCodeEdit.Text]);
  end
  else
  begin
    vWhere := EmptyStr;
    ReportSubTitle := '거래처 : [전체] ';
  end;

  OpenQuery('select g.CD_MENU as CD_GOODS, '
           +'       g.NM_MENU as NM_GOODS, '
           +'       g.NM_SPEC, '
           +'       Ifnull(t.QTY_STOCK,0) as QTY_STOCK '
           +'  from MS_MENU g left outer join '
           +'       (select CD_GOODS, '
           +'               Sum(Ifnull(QTY_BASE,0)+Ifnull(QTY_STOCK,0)) as QTY_STOCK '
           +'          from '
           +'               (select CD_GOODS, '
           +'                       Ifnull(QTY_BASE,0) as QTY_BASE, '
           +'                       0 as QTY_STOCK '
           +'                  from SL_STOCK_MONTH  '
           +'                 where CD_HEAD  =:P0 '
           +'                   and CD_STORE =:P1 '
           +'                   and YM_STOCK =Left(:P2, 6) '
           +'                union all '
           +'                select CD_GOODS, '
           +'                       0, '
           +'                       Sum(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) '
           +'                  from SL_STOCK_DAY '
           +'                 where CD_HEAD  =:P0 '
           +'                   and CD_STORE =:P1 '
           +'                   and YMD_STOCK between ConCat(Left(:P2,6),''01'') and :P2 '
           +'                 group by CD_GOODS '
           +'                ) as t '
           +'          group by CD_GOODS '
           +'        ) as t on t.CD_GOODS = g.CD_MENU '
           +' where g.CD_HEAD  =:P0 '
           +'   and g.CD_STORE =:P1 '
           +'   and g.DS_STOCK   = ''1'' '
           +'   and g.YN_USE     = ''Y'' '
           +vWhere,
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStockSurveyPrintForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = ConditionCompanyCodeEdit then
  begin
    if Length(ConditionCompanyCodeEdit.Text) <> 6 then
      ConditionCompanyNameLabel.Caption := EmptyStr;
  end;
  isChanged := false;
end;

procedure TStockSurveyPrintForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode := pmPreviewExcel;
end;

function TStockSurveyPrintForm.SearchCompany(aCompany: string): string;
begin
  Result := EmptyStr;

  // 거래처를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := '매입처 조회';
      GridTableViewCode.Caption  := '매입처 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '매입처 이름';
      GridTableViewName1.Width   := 320;

      SearchText := aCompany;
      SQLText    := 'select   CD_TRDPL, '
                   +'         NM_TRDPL '
                   +'  from   MS_TRD '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and  (CD_TRDPL =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                   +'   and   DS_TRDPL = ''B'' '
                   +'   and   DS_STATUS = ''0'' '
                   +'order by CD_STORE, CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result := Code;
        ConditionCompanyCodeEdit.Text     := Code;
        ConditionCompanyNameLabel.Caption := Names[0];
      end
    finally
      Free;
    end;
end;

end.
