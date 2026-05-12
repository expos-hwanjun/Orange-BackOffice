// 적정재고 미달 상품 조회 (완료)

//##### 발주 버튼 관련 재개발, 프로그램간 자료전송 등

unit StockLowStockShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, ExtCtrls, AdvToolBarStylers,
  cxCheckBox, StrUtils, StdCtrls, cxRadioGroup, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockLowStockShowForm = class(TInheritShowForm)
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewSafetyQty: TcxGridColumn;
    GridTableViewLessQty: TcxGridColumn;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewOrderQty: TcxGridColumn;
    ConditionCompanyCodeEdit: TcxButtonEdit;
    ConditionCompanyNameLabel: TcxLabel;

    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure ConditionCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionCompanyCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EditPropertiesChange(Sender: TObject);

  private
    function  SearchCompany(aCompany: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  StockLowStockShowForm: TStockLowStockShowForm;



implementation

uses
  Common, DBModule, Main, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockLowStockShowForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode := pmPreviewExcel;
end;
function TStockLowStockShowForm.SearchCompany(aCompany: string): string;
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
                   +' order by  CD_TRDPL';
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

//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TStockLowStockShowForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
procedure TStockLowStockShowForm.ConditionCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  ConditionCompanyCodeEdit.Clear;
  SearchCompany(ConditionCompanyCodeEdit.Text);
end;

procedure TStockLowStockShowForm.ConditionCompanyCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := SearchCompany(DisplayValue);
end;

function TStockLowStockShowForm.DoSearch:Boolean;
var vWhere :String;
begin
  inherited;
  if ConditionCompanyCodeEdit.Text <> EmptyStr then
  begin
    vWhere := Format(' inner join '
                    +' MS_TRD as t on a.CD_HEAD  = t.CD_HEAD '
                    +'            and a.CD_STORE = t.CD_STORE '
                    +'            and a.CD_TRDPL = t.CD_TRDPL '
                    +'            and t.CD_TRDPL = ''%s'' ',[ConditionCompanyCodeEdit.Text]);
    ReportSubTitle := Format('거래처 : %s [%s] ',[ConditionCompanyNameLabel.Caption, ConditionCompanyCodeEdit.Text]);
  end
  else
  begin
    vWhere := ' left outer join '
             +' MS_TRD as t on a.CD_HEAD  = t.CD_HEAD '
             +'            and a.CD_STORE = t.CD_STORE '
             +'            and a.CD_TRDPL = t.CD_TRDPL ';
    ReportSubTitle := '거래처 : [전체] ';
  end;

  OpenQuery('select  a.CD_TRDPL, '
          +'         t.NM_TRDPL, '
          +'         a.CD_MENU as CD_GOODS, '
          +'         a.NM_MENU as NM_GOODS, '
          +'         a.NM_SPEC, '
          +'         s.QTY_STOCK, '
          +'         a.QTY_SAFETY, '
          +'         s.QTY_STOCK - a.QTY_SAFETY as QTY_LESS, '
          +'         a.QTY_ORDER '
          +'from     MS_MENU as a inner join '
          +'        (select CD_GOODS, '
          +'                Sum(Ifnull(QTY_BASE,0)+Ifnull(QTY_STOCK,0)) as QTY_STOCK '
          +'           from '
          +'                (select CD_GOODS, '
          +'                        Ifnull(QTY_BASE,0) as QTY_BASE, '
          +'                        0 as QTY_STOCK '
          +'                   from SL_STOCK_MONTH  '
          +'                  where CD_HEAD  =:P0 '
          +'                    and CD_STORE =:P1 '
          +'                    and YM_STOCK =Left(:P2, 6) '
          +'                 union all '
          +'                 select CD_GOODS, '
          +'                        0, '
          +'                        Sum(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) '
          +'                   from SL_STOCK_DAY '
          +'                  where CD_HEAD  =:P0 '
          +'                    and CD_STORE =:P1 '
          +'                    and YMD_STOCK between ConCat(Left(:P2,6),''01'') and :P2 '
          +'                  group by CD_GOODS '
          +'                 ) as t '
          +'           group by CD_GOODS '
          +'         ) as s on s.CD_GOODS = a.CD_MENU '
          +vWhere
          +' where   a.CD_HEAD    = :P0 '
          +'   and   a.CD_STORE   = :P1 '
          +'   and   a.DS_STOCK   = ''1'' '
          +'   and   a.YN_USE     = ''Y'' '
          +'   and   a.QTY_SAFETY > s.QTY_STOCK '
          +'   and   a.QTY_SAFETY > 0 '
          +' order by a.CD_MENU',
           [HeadStoreCode,
            StoreCode,
            FormatDateTime(fmtDateShort, Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStockLowStockShowForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = ConditionCompanyCodeEdit then
  begin
    if Length(ConditionCompanyCodeEdit.Text) <> 6 then
      ConditionCompanyNameLabel.Caption := EmptyStr;
  end;
  isChanged := false;
end;

end.
