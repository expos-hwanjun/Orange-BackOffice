unit BuyCompanyGoodsBuyShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxButtonEdit, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TBuyCompanyGoodsBuyShowForm = class(TInheritShowForm)
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSpec: TcxGridColumn;
    GridTableViewBuyQty: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1BuyDate: TcxGridColumn;
    GridTableView1GoodsCode: TcxGridColumn;
    GridTableView1GoodsName: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1BuyQty: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    cxLabel1: TcxLabel;
    ConditionCompanyCodeEdit: TcxButtonEdit;
    ConditionCompanyNameLabel: TcxLabel;
    procedure ConditionCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionCompanyCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    function  SearchCompany(aCompany: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  BuyCompanyGoodsBuyShowForm: TBuyCompanyGoodsBuyShowForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

procedure TBuyCompanyGoodsBuyShowForm.ConditionCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  ConditionCompanyCodeEdit.Clear;
  SearchCompany(ConditionCompanyCodeEdit.Text);
end;

procedure TBuyCompanyGoodsBuyShowForm.ConditionCompanyCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  DisplayValue := SearchCompany(DisplayValue);
end;

function TBuyCompanyGoodsBuyShowForm.DoSearch: Boolean;
begin
  if ConditionCompanyCodeEdit.Text = EmptyStr then
  begin
    Result := True;
    MsgBox('매입처를 선택하십시오.');
    ConditionCompanyCodeEdit.SetFocus;
    Exit;
  end;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select d.CD_GOODS , '
             +'       Max(g.NM_MENU) as NM_GOODS, '
             +'       Max(g.NM_SPEC) as NM_SPEC, '
             +'       SUM(d.QTY_BUY) as QTY_BUY, '
             +'       d.PR_BUY, '
             +'       SUM(d.AMT_BUY) as AMT_BUY '
             +'  from SL_BUY_H h inner join '
             +'       SL_BUY_D d  on h.CD_HEAD = d.CD_HEAD and h.CD_STORE = d.CD_STORE and h.YMD_BUY  = d.YMD_BUY and h.NO_BUY = d.NO_BUY inner join '
             +'       MS_MENU  g  on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_MENU and (g.CD_MENU =:P5 or g.NM_MENU like ConCat(''%'',:P5,''%'')) '
             +' where h.CD_HEAD  =:P0 '
             +'   and h.CD_STORE =:P1 '
             +'   and h.CD_TRDPL =:P2 '
             +'   and h.YMD_BUY between :P3 and :P4 '
             +' group by d.CD_GOODS, d.PR_BUY '
             +' order by d.CD_GOODS ',
             [HeadStoreCode,
              StoreCode,
              ConditionCompanyCodeEdit.Text,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarEdit.Text]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;
  end
  else
  begin
    OpenQuery('select StoD(h.YMD_BUY) as YMD_BUY, '
             +'       d.CD_GOODS , '
             +'       Max(g.NM_MENU) as NM_GOODS, '
             +'       Max(g.NM_SPEC) as NM_SPEC, '
             +'       SUM(d.QTY_BUY) as QTY_BUY, '
             +'       Max(d.PR_BUY) as PR_BUY, '
             +'       SUM(d.AMT_BUY) as AMT_BUY '
             +'from   SL_BUY_H h inner join '
             +'       SL_BUY_D d  on h.CD_HEAD = d.CD_HEAD and h.CD_STORE = d.CD_STORE and h.YMD_BUY = d.YMD_BUY and h.NO_BUY = d.NO_BUY inner join '
             +'       MS_MENU  g  on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_MENU and (g.CD_MENU =:P5 or g.NM_MENU like ConCat(''%'',:P5,''%'')) '
             +' where h.CD_HEAD  =:P0 '
             +'   and h.CD_STORE =:P1 '
             +'   and h.CD_TRDPL =:P2 '
             +'   and h.YMD_BUY between :P3 and :P4 '
             +'group by h.YMD_BUY, d.CD_GOODS '
             +'order by d.CD_GOODS ',
             [HeadStoreCode,
              StoreCode,
              ConditionCompanyCodeEdit.Text,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarEdit.Text]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end;
end;

procedure TBuyCompanyGoodsBuyShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매입관리/매입처별%20상품매입조회/매입처별%20상품매입조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TBuyCompanyGoodsBuyShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.FocusedRecordIndex >= 0) then
  begin
    ConditionToolBarEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsCode.Index];
    Grid.ActiveLevel := GridLevel1;
    DoSearch;
  end;
end;

function TBuyCompanyGoodsBuyShowForm.SearchCompany(aCompany: string): string;
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
                   +' where   CD_HEAD  = :P0 '
                   +'   and   CD_STORE = :P1 '
                   +'   and   DS_TRDPL = ''B'' '
                   +'   and  (CD_TRDPL =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                   +'   and   DS_STATUS = 0 '
                   +'order by CD_STORE, CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result := Code;
        ConditionCompanyCodeEdit.Text     := Code;
        ConditionCompanyNameLabel.Caption := Names[0];
        ConditionToolBarEdit.SetFocus;
      end
    finally
      Free;
    end;
end;

end.
