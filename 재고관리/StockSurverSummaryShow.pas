unit StockSurverSummaryShow;

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
  dxPScxExtEditorProducers, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  cxGridBandedTableView, cxButtonEdit, AdvPanel, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockSurverSummaryShowForm = class(TInheritShowForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSpec: TcxGridColumn;
    GridTableViewBaseQty: TcxGridColumn;
    GridTableViewBuyQty: TcxGridColumn;
    GridTableViewTransInQty: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewTransOutQty: TcxGridColumn;
    GridTableViewDisuseQty: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewSurveyQty: TcxGridColumn;
    GridTableViewSettleQty: TcxGridColumn;
    GridTableViewLackQty: TcxGridColumn;
    GridTableViewLackAmt: TcxGridColumn;
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewGoodsCode: TcxGridBandedColumn;
    GridBandedTableViewGoodsName: TcxGridBandedColumn;
    GridBandedTableViewSpec: TcxGridBandedColumn;
    GridBandedTableViewBaseQty: TcxGridBandedColumn;
    GridBandedTableViewBuyQty: TcxGridBandedColumn;
    GridBandedTableViewReturnQty: TcxGridBandedColumn;
    GridBandedTableViewSaleQty: TcxGridBandedColumn;
    GridBandedTableViewDisuseQty: TcxGridBandedColumn;
    GridBandedTableViewStockQty: TcxGridBandedColumn;
    GridBandedTableViewSurveyQty: TcxGridBandedColumn;
    GridBandedTableViewLackQty: TcxGridBandedColumn;
    GridBandedTableViewLackAmt: TcxGridBandedColumn;
    GridBandedTableViewSurveyDate: TcxGridBandedColumn;
    ConditionPanel: TAdvPanel;
    CompanyLabel: TLabel;
    CompanyCodeEdit: TcxButtonEdit;
    CompanyNameEdit: TcxTextEdit;
    GoodsClassLabel: TLabel;
    ClassComboBox: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CompanyCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure CompanyCodeEditPropertiesChange(Sender: TObject);
  private
    function SearchCompany(aCompany:String):string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  StockSurverSummaryShowForm: TStockSurverSummaryShowForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

{ TStockSurverSummaryShowForm }

procedure TStockSurverSummaryShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TStockSurverSummaryShowForm.FormShow(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  //분류정보
  try
    OpenQuery('select CD_CLASS, '
             +'       NM_CLASS '
             +'  from MS_MENU_CLASS '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and Length(CD_CLASS) = 2 '
             +' order by CD_CLASS ',
             [HeadStoreCode,
              StoreCode]);
    ClassComboBox.Properties.Items.Clear;
    New(vCode);
    vCode.Data := EmptyStr;
    ClassComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode.Data := Query.Fields[0].AsString;
      ClassComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    ClassComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;
end;

function TStockSurverSummaryShowForm.SearchCompany(aCompany: String): string;
begin
  Result := EmptyStr;
  // 거래처를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := Replace(CompanyLabel.Caption)+' 조회';
      GridTableViewCode.Caption  := Replace(CompanyLabel.Caption)+' 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := Replace(CompanyLabel.Caption)+' 이름';
      GridTableViewName1.Width   := 320;

      SearchText := aCompany;
      SQLText    := 'select   CD_TRDPL, '
                   +'         NM_TRDPL '
                   +'  from   MS_TRD '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and  (CD_TRDPL =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                   +'   and   DS_TRDPL = ''B'''
                   +'   and   DS_STATUS = 0 '
                   +' order by CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result               := Code;
        CompanyCodeEdit.Text := Code;
        CompanyNameEdit.Text := Names[0];
      end;
    finally
      Free;
    end;
end;

procedure TStockSurverSummaryShowForm.CompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchCompany('');
end;

procedure TStockSurverSummaryShowForm.CompanyCodeEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if Length(CompanyCodeEdit.Text) <> 6 then
    CompanyNameEdit.Clear;
end;

procedure TStockSurverSummaryShowForm.CompanyCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := SearchCompany(DisplayValue);
end;

function TStockSurverSummaryShowForm.DoSearch: Boolean;
var vWhere, vWhere1, vWhere2 :String;
begin
  if FormatDateTime('yyyymm', ConditionToolBarFromDateEdit.Date) <> FormatDateTime('yyyymm', ConditionToolBarToDateEdit.Date) then
  begin
    MsgBox('조회기간이 같은 월이어야합니다');
    Result := true;
    Exit;
  end;

  if CompanyCodeEdit.Text <> EmptyStr then
    vWhere := Format('and g.CD_TRDPL = ''%s'' ', [CompanyCodeEdit.Text])
  else
    vWhere := EmptyStr;

  if GetStrPointerData(ClassComboBox)  <> EmptyStr then
    vWhere1 := Format('and Left(g.CD_CLASS,2) = ''%s'' ', [GetStrPointerData(ClassComboBox)])
  else
    vWhere1 := EmptyStr;

  OpenQuery('select t.CD_GOODS, '
           +'       Max(t.NM_MENU)    as NM_GOODS, '
           +'       Max(t.NM_SPEC)    as NM_SPEC, '
           +'       Sum(t.QTY_BASE)   as QTY_BASE, '
           +'       Sum(t.QTY_BUY)    as QTY_BUY, '
           +'       Sum(t.QTY_RETURN) as QTY_RETURN, '
           +'       Sum(t.QTY_SALE)   as QTY_SALE, '
           +'       Sum(t.QTY_DISUSE) as QTY_DISUSE, '
           +'       Sum(t.QTY_STOCK)  as QTY_STOCK, '
           +'       Sum(t.QTY_SURVEY) as QTY_SURVEY, '
           +'       Sum(t.QTY_LACK)   as QTY_LACK, '
           +'       Sum(t.AMT_LACK)   as AMT_LACK, '
           +'       t.YMD_SURVEY '
           +'  from '
           +'      (select s.CD_GOODS, '
           +'              g.NM_MENU, '
           +'              g.NM_SPEC, '
           +'              Ifnull(b.QTY_BASE,0)      as QTY_BASE, '
           +'              Ifnull(t.QTY_BUY,0)       as QTY_BUY, '
           +'              Ifnull(t.QTY_RETURN,0)    as QTY_RETURN, '
           +'              Ifnull(t.QTY_SALE,0)      as QTY_SALE, '
           +'              Ifnull(t.QTY_DISUSE,0)    as QTY_DISUSE, '
           +'              Ifnull(s.QTY_STOCK,0)     as QTY_STOCK, '
           +'              Ifnull(s.QTY_SILSA,0)     as QTY_SURVEY, '
           +'              Ifnull(s.QTY_SETTLE,0)    as QTY_LACK, '
           +'              g.PR_BUY * s.QTY_SETTLE as AMT_LACK, '
           +'              StoD(s.YMD_SILSA) as YMD_SURVEY '
           +'       from   SL_SILSA s left outer join '
           +'              MS_MENU  g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_MENU left outer join '
           //       이월
           +'              (select CD_GOODS, '
           +'                      QTY_BASE '
           +'                 from SL_STOCK_MONTH '
           +'                where CD_HEAD  =:P0 '
           +'                  and CD_STORE =:P1 '
           +'                  and YM_STOCK =Left(:P2,6) '
           +'               ) as b on b.CD_GOODS = s.CD_GOODS left outer join '
           +'             (select CD_GOODS, '
           +'                     SUM(QTY_BUY) as QTY_BUY, '
           +'                     SUM(QTY_RETURN) as QTY_RETURN, '
           +'                     SUM(QTY_SALE) as QTY_SALE, '
           +'                     SUM(QTY_DISUSE) as QTY_DISUSE '
           +'                from SL_STOCK_DAY '
           +'               where CD_HEAD  =:P0 '
           +'                 and CD_STORE =:P1 '
           +'                 and YMD_STOCK between :P2 and :P3 '
           +'               group by CD_GOODS ) as t on t.CD_GOODS = s.CD_GOODS '
           +'       where  s.CD_HEAD  =:P0 '
           +'         and  s.CD_STORE =:P1 '
           +'         and  s.YM_SILSA   = Left(:P2,6) '
           +'         and  s.YMD_SILSA between :P2 and :P3 '
           +'         and  (g.CD_MENU =:P4 or g.NM_MENU like ConCat(''%'',:P4,''%'')) '
           +vWhere
           +vWhere1
           +'     ) t '
           +' group by t.CD_GOODS, t.YMD_SURVEY '
           +' order by 1 ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridBandedTableView);
end;

end.
