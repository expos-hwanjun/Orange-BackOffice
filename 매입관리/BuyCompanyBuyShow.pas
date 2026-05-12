unit BuyCompanyBuyShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer,
  Uni, DB, MemDS, ImgList, Menus, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TBuyCompanyBuyShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableViewTrdCode: TcxGridColumn;
    GridTableViewTrdName: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableView1: TcxGridTableView;
    GridTableView1BuyDate: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView2: TcxGridTableView;
    GridTableView2Column1: TcxGridColumn;
    GridTableView2Column2: TcxGridColumn;
    GridTableView2Column3: TcxGridColumn;
    GridTableView2Column4: TcxGridColumn;
    GridTableView2Column5: TcxGridColumn;
    GridTableView2Column6: TcxGridColumn;
    GridTableView2Column7: TcxGridColumn;
    GridTableView2Column8: TcxGridColumn;
    GridTableView1BuyNo: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableView1Column1: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  BuyCompanyBuyShowForm: TBuyCompanyBuyShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TBuyCompanyBuyShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매입관리/매입처별%20매입조회/매입처별%20매입조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TBuyCompanyBuyShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if ALevel = GridLevel then
  begin
    ButtonToolBarSearchButton.Enabled := true;
  end
  else if ALevel = GridLevel1 then
  begin
    ButtonToolBarSearchButton.Enabled := false;
    if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;
    if GridTableView.DataController.RecordCount <= 0 then
    begin
      GridLevel1.Caption := ' 전표별 매입내역 ';
      GridTableView1.DataController.RecordCount := 0;
      Exit;
    end;
    GridLevel1.Caption := '['+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTrdName.Index ] + '] 전표별 매입내역 ';
    DoSearch;
  end
  else if ALevel = GridLevel2 then
  begin
    ButtonToolBarSearchButton.Enabled := false;
    if GridTableView1.DataController.GetFocusedRecordIndex < 0 then Exit;
    if GridTableView1.DataController.RecordCount <= 0 then
    begin
      GridLevel2.Caption := ' 상품별 매입내역 ';
      GridTableView2.DataController.RecordCount := 0;
      Exit;
    end;
    GridLevel2.Caption := '['+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableView1BuyDate.Index ]
                          +'-'+ GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableView1BuyNo.Index ] + '] 상품 매입내역 ';
    DoSearch;
  end;
end;

procedure TBuyCompanyBuyShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView1.DataController.GetFocusedRecordIndex < 0 then Exit;
  if GridTableView1.DataController.RecordCount <= 0 then
  begin
    GridLevel2.Caption := ' 전표별 매입 ';
    GridTableView2.DataController.RecordCount := 0;
    Exit;
  end;

  Grid.ActiveLevel := GridLevel2;
  GridLevel2.Caption := '['+GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1BuyDate.Index ]
                       +'-'+ GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1BuyNo.Index ] + '] 상품 매입내역 ';
  DoSearch;
end;

procedure TBuyCompanyBuyShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;
  if GridTableView.DataController.RecordCount <= 0 then
  begin
    GridLevel1.Caption := ' 전표별 매입 ';
    GridTableView1.DataController.RecordCount := 0;
    Exit;
  end;

  Grid.ActiveLevel := GridLevel1;
  GridLevel1.Caption := '['+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTrdName.Index ] + '] 전표별 매입내역 ';
  DoSearch;
end;

function TBuyCompanyBuyShowForm.DoSearch:Boolean;
begin
  inherited;
  Result := false;

  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select t.CD_TRDPL, '
             +'	     	Max(t.NM_TRDPL) as NM_TRDPL, '
             +'       Max(t.NO_BIZER) as NO_BIZER, '
             +'	     	SUM(Ifnull(h.AMT_BUY,0)) as AMT_BUY, '
             +'	     	SUM(Ifnull(h.AMT_DUTY,0) + Ifnull(h.AMT_DUTYFREE,0)) as AMT_DUTY, '
             +'	     	SUM(Ifnull(h.AMT_TAX,0)) as AMT_TAX '
             +'from	  MS_TRD t left outer join '
             +'		    SL_BUY_H h on t.CD_HEAD  = h.CD_HEAD '
             +'                 and t.CD_STORE = h.CD_STORE '
             +'                 and t.CD_TRDPL = h.CD_TRDPL '
             +'                 and h.YMD_BUY between :P2 and :P3 '
             +'where	t.CD_HEAD  = :P0 '
             +'  and  t.CD_STORE = :P1 '
             +'  and  (t.CD_TRDPL =:P4 or t.NM_TRDPL like ConCat(''%'',:P4,''%'')) '
             +'group by t.CD_TRDPL '
             +'having  SUM(Ifnull(h.AMT_BUY,0)) <> 0 '
             +'order by t.CD_TRDPL ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    if GridTableView.DataController.GetFocusedRecordIndex < 0 then
      Exit;
    OpenQuery('select StoDW(YMD_BUY) as YMD_BUY, '
             +'	     	NO_BUY, '
             +'       case when DS_BUY in (''B'',''R'') then ''매입'' else ''반품'' end DS_BUY, '
             +'	     	AMT_BUY, '
             +'	     	AMT_DUTY+AMT_DUTYFREE as AMT_NET, '
             +'	     	AMT_TAX, '
             +'       AMT_CASH '
             +'  from SL_BUY_H '
             +' where	CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_BUY between :P2 and :P3 '
             +'   and CD_TRDPL = :P4 '
             +' order by YMD_BUY, NO_BUY ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTrdCode.Index]]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end
  else
  begin
    OpenQuery('select d.CD_GOODS, '
             +'	    	m.NM_MENU as NM_GOODS, '
             +'	    	m.NM_SPEC, '
             +'       d.QTY_BUY, '
             +'       d.PR_BUY, '
             +'	    	AMT_BUY, '
             +'	    	AMT_DUTY+AMT_DUTYFREE as AMT_NET, '
             +'	    	AMT_TAX '
             +'  from SL_BUY_D d inner join '
             +'       MS_MENU  m on d.CD_HEAD = m.CD_HEAD and d.CD_STORE = m.CD_STORE and d.CD_GOODS = m.CD_MENU '
             +' where	d.CD_HEAD  =:P0 '
             +'   and d.CD_STORE =:P1 '
             +'   and d.YMD_BUY  =:P2 '
             +'   and d.NO_BUY   =:P3 '
             +' order by d.SEQ ',
              [HeadStoreCode,
               StoreCode,
               GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1BuyDate.Index]),
               GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1BuyNo.Index]]);
    DM.ReadQuery(Query, GridTableView2);
    Result := GridTableView2.DataController.RecordCount > 0;
  end;
end;



end.
