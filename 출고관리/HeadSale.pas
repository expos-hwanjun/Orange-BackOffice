unit HeadSale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLabel, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, Vcl.ExtCtrls, AdvSplitter, dxPSCore,
  dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxImageComboBox, cxMemo, AdvPanel, StrUtils,
  dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadSaleForm = class(TInheritShowForm)
    GridSplitter: TAdvSplitter;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1GoodsCode: TcxGridColumn;
    GridTableView1YmdOrder: TcxGridColumn;
    GridTableView1GoodsName: TcxGridColumn;
    GridTableView1OrderUnit: TcxGridColumn;
    GridTableView1OrderPrice: TcxGridColumn;
    GridTableView1OrderAmt: TcxGridColumn;
    GridTableView1OrderQty: TcxGridColumn;
    GridTableView1SaleQty: TcxGridColumn;
    Grid1Level: TcxGridLevel;
    GridTableViewLogisticsName: TcxGridColumn;
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    ButtonToolBarSaleButton: TAdvGlowButton;
    ImageList1: TImageList;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewTaxAmt: TcxGridColumn;
    ConfirmPanel: TAdvPanel;
    ReceiveEmpLabel: TLabel;
    ReceivePasswordLabel: TLabel;
    Label1: TLabel;
    SaleOKButton: TAdvGlowButton;
    ConfirmCancelButton: TAdvGlowButton;
    ConfirmPasswordEdit: TcxTextEdit;
    SaleDateEdit: TcxDateEdit;
    UserIDEdit: TcxTextEdit;
    GridTableViewStoreCode: TcxGridColumn;
    GridTableViewLogisticsCode: TcxGridColumn;
    GridTableViewDutyFreeAmt: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    GridTableView1Seq: TcxGridColumn;
    GridTableViewOrderDate: TcxGridColumn;
    GridTableViewOrderNo: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewProfitRate: TcxGridColumn;
    GridTableView1BuyAmt: TcxGridColumn;
    GridTableView1ProfitRate: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSaleButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SaleOKButtonClick(Sender: TObject);
    procedure ConfirmCancelButtonClick(Sender: TObject);
    procedure GridTableView1ConfirmQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConfirmPasswordEditKeyPress(Sender: TObject; var Key: Char);
  private
    procedure ButtonEnable(aStatus:String);
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadSaleForm: THeadSaleForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

{ TOrderConfirmForm }
procedure THeadSaleForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  OpenQuery('select CD_TRDPL, '
           +'       NM_TRDPL '
           +'  from MS_TRD '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_TRDPL =''L'' '
           +'   and DS_STATUS =''0'' '
           +' order by CD_TRDPL ',
           [HeadStoreCode,
            StandardStore]);
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'and g.CD_LOGISTICS <> '''' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := Format('and g.CD_LOGISTICS = ''%s'' ',[Query.FieldByName('CD_TRDPL').AsString]);
    ConditionToolBarComboBox.Properties.Items.AddObject(Query.FieldByName('NM_TRDPL').AsString, TObject(vCode));
    Query.Next;
  end;
  Query.Close;
  ConditionToolBarComboBox.ItemIndex := 0;
end;

function THeadSaleForm.DoSearch: Boolean;
begin
  OpenQuery('select StoD(d.YMD_ORDER) as YMD_ORDER, '
           +'       d.NO_ORDER, '
           +'       g.CD_LOGISTICS, '
           +'       Max(t.NM_TRDPL) as NM_LOGISTICS, '
           +'       StoDW(h.YMD_REQUEST) as YMD_REQUEST, '
           +'       StoDW(h.YMD_DELIVERY) as YMD_DELIVERY, '
           +'       h.CD_STORE, '
           +'       Max(s.NM_STORE) AS NM_STORE, '
           +'       SUM(d.PR_ORDER * d.QTY_CONFIRM) AS AMT_ORDER, '
           +'       Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END) - divint(Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END),11) AMT_NET, '
           +'       divint(Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END),11) as AMT_TAX, '
           +'       Sum(case when g.DS_TAX = ''0'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END) AS AMT_DUTYFREE, '
           +'       SUM(g.PR_SALE * d.QTY_CONFIRM) AS AMT_SALE, '
           +'       SUM(g.PR_BUY * d.QTY_CONFIRM) AS AMT_BUY, '
           +'       GetProfitRate(SUM(g.PR_BUY * d.QTY_CONFIRM), SUM(d.PR_ORDER * d.QTY_CONFIRM)) as RATE_PROFIT '
           +'  from OL_ORDER_D as d INNER join '
           +'       OL_ORDER_H as h ON h.CD_HEAD = d.CD_HEAD AND h.YMD_ORDER = d.YMD_ORDER and h.NO_ORDER = d.NO_ORDER and h.DS_STATUS = ''C'' INNER join '
           +'       MS_GOODS   as g ON g.CD_HEAD = d.CD_HEAD AND g.CD_STORE  = :P3 AND g.CD_GOODS = d.CD_GOODS INNER join '
           +'       MS_STORE   as s ON s.CD_HEAD = d.CD_HEAD AND s.CD_STORE  = h.CD_STORE inner join '
           +'       MS_TRD     as t ON t.CD_HEAD = d.CD_HEAD AND t.CD_STORE  = :P3 AND t.CD_TRDPL = g.CD_LOGISTICS '
           +' where d.CD_HEAD = :P0 '
           +'   and d.YMD_ORDER between :P1 and :P2 '
           +'   and (d.QTY_CONFIRM - Ifnull(d.QTY_SALE,0)) > 0 '
           +GetStrPointerData(ConditionToolBarComboBox)
           +' group by d.YMD_ORDER, d.NO_ORDER, g.CD_LOGISTICS, h.CD_STORE '
           +' order by d.YMD_ORDER, h.CD_STORE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            StandardStore]);
  Result := DM.ReadQuery(Query, GridTableView);
  if Result then
    GridTableView.Controller.FocusedRowIndex := 0;
end;


procedure THeadSaleForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then
  begin
    GridTableView1.DataController.RecordCount := 0;
    ButtonToolBarSaleButton.Enabled := false;
    Exit;
  end;
  OpenQuery('select ROW_NUMBER() OVER () as SEQ, '
           +'       d.CD_GOODS, '
           +'       g.NM_GOODS, '
           +'       g.NM_UNIT, '
           +'       SUM(d.QTY_ORDER) AS QTY_ORDER, '
           +'       SUM(d.QTY_CONFIRM) AS QTY_CONFIRM, '
           +'       d.PR_ORDER, '
           +'       Sum(d.QTY_CONFIRM * d.PR_ORDER) AS AMT_ORDER, '
           +'       Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END) - divint(Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END),11) AMT_NET, '
           +'       divint(Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END),11) as AMT_TAX, '
           +'       Sum(case when g.DS_TAX = ''0'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END) as AMT_DUTYFREE, '
           +'       SUM(g.PR_BUY * d.QTY_CONFIRM) AS AMT_BUY, '
           +'       GetProfitRate(SUM(g.PR_BUY * d.QTY_CONFIRM), SUM(d.PR_ORDER * d.QTY_CONFIRM)) as RATE_PROFIT '
           +'  from OL_ORDER_D as d inner join '
           +'       MS_GOODS   as g on g.CD_HEAD   = d.CD_HEAD '
           +'                      and g.CD_STORE  = :P5 '
           +'                      and g.CD_GOODS  = d.CD_GOODS '
           +' where d.CD_HEAD      = :P0 '
           +'   and d.YMD_ORDER    = :P1 '
           +'   and d.NO_ORDER     = :P2 '
           +'   and d.CD_STORE     = :P3 '
           +'   and g.CD_LOGISTICS = :P4 '
           +'   and d.QTY_CONFIRM  > 0 '
           +'   and Ifnull(d.QTY_SALE,0) = 0 '
           +' group by d.CD_GOODS, d.PR_ORDER ',
           [HeadStoreCode,
            GetOnlyNumber(AFocusedRecord.Values[GridTableViewOrderDate.Index]),
            AFocusedRecord.Values[GridTableViewOrderNo.Index],
            AFocusedRecord.Values[GridTableViewStoreCode.Index],
            AFocusedRecord.Values[GridTableViewLogisticsCode.Index],
            StandardStore]);
  DM.ReadQuery(Query, GridTableView1);

  ButtonToolBarSaleButton.Enabled := true;
end;


procedure THeadSaleForm.ButtonEnable(aStatus:String);
begin
  if aStatus = '발주확정' then
  begin
    ButtonToolBarSaleButton.Enabled := false;
  end
  else if aStatus = '발주' then
  begin
    ButtonToolBarSaleButton.Enabled := true;
  end
  else
  begin
    ButtonToolBarSaleButton.Enabled := false;
  end

end;

procedure THeadSaleForm.ButtonToolBarSaleButtonClick(Sender: TObject);
begin
  inherited;
  SaleDateEdit.Date        := Now();
  Grid.Enabled             := false;
  Grid1.Enabled            := false;
  ToolBarDockPanel.Enabled := false;
  SaleDateEdit.Date        := Now();
  UserIDEdit.Text          := UserCode;
  ConfirmPanel.Visible     := true;
  ConfirmPasswordEdit.SetFocus;
end;

procedure THeadSaleForm.ConfirmCancelButtonClick(Sender: TObject);
begin
  inherited;
  Grid.Enabled             := true;
  Grid1.Enabled            := true;
  ToolBarDockPanel.Enabled := true;
  ConfirmPanel.Visible     := false;
end;

procedure THeadSaleForm.ConfirmPasswordEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    SaleOKButtonClick(nil);
end;

procedure THeadSaleForm.SaleOKButtonClick(Sender: TObject);
var vIndex :Integer;
    vInsertSQL,
    vSaleNo :String;
begin
  inherited;
  if ConfirmPasswordEdit.Text <> UserPWD then
  begin
    MsgBox(Format('%s 사용자의 비밀번호가 올바르지 않습니다',[UserName]));
    Exit;
  end;

  if GridTableView.Controller.SelectedRowCount > 1 then
  begin
    OpenQuery('select Max(NO_SALE) '
             +'  from OL_SALE_H '
             +' where CD_HEAD  =:P0 '
             +'   and YMD_SALE =:P1 ',
             [HeadStoreCode,
              DtoS(SaleDateEdit.Date)]);
    if Query.Fields[0].AsString = '' then
      vSaleNo := '0000'
    else
      vSaleNo := Query.Fields[0].AsString;
    Query.Close;

    try
      for vIndex := 0 to GridTableView.Controller.SelectedRowCount - 1 do
      begin
        vSaleNo := FormatFloat('0000', StrToInt(vSaleNo)+1);
        ExecQuery('insert into OL_SALE_H(CD_HEAD, '
                 +'                      YMD_SALE, '
                 +'                      NO_SALE, '
                 +'                      CD_STORE, '
                 +'                      CD_LOGISTICS, '
                 +'                      AMT_DUTY, '
                 +'                      AMT_TAX, '
                 +'                      AMT_DUTYFREE, '
                 +'                      AMT_SALE, '
                 +'                      AMT_BUY, '
                 +'                      CD_SAWON, '
                 +'                      ORDER_REF, '
                 +'                      DT_INSERT, '
                 +'                      DT_CHANGE) '
                 +'              select d.CD_HEAD, '
                 +'                     :P4, '
                 +'                     :P5, '
                 +'                     :P2, '
                 +'                     :P3, '
                 +'                     Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END) - divint(Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END),11) AMT_DUTY, '
                 +'                     divint(Sum(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END),11) as AMT_TAX, '
                 +'                     Sum(case when g.DS_TAX = ''0'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END) AS AMT_DUTYFREE, '
                 +'                     Sum(d.QTY_CONFIRM * d.PR_ORDER) AS AMT_ORDER, '
                 +'                     Sum(d.QTY_CONFIRM * g.PR_BUY) AS AMT_BUY, '
                 +'                     :P6, '
                 +'                     ConCat(d.YMD_ORDER,d.NO_ORDER), '
                 +'                     Now(), '
                 +'                     Now() '
                 +'                from OL_ORDER_D as d inner join '
                 +'                     MS_GOODS   as g ON g.CD_HEAD = d.CD_HEAD and g.CD_STORE  = :P7 AND g.CD_GOODS = d.CD_GOODS '
                 +'               where d.CD_HEAD      = :P0 '
                 +'                 and d.YMD_ORDER    = :P1 '
                 +'                 and d.CD_STORE     = :P2 '
                 +'                 and g.CD_LOGISTICS = :P3 '
                 +'                 and d.QTY_CONFIRM  > 0 '
                 +'                 and Ifnull(d.QTY_SALE,0) = 0 '
                 +'               group by d.CD_HEAD, d.YMD_ORDER;',
                 [HeadStoreCode,
                  GetOnlyNumber(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrderDate.Index]),
                  GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStoreCode.Index],
                  GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewLogisticsCode.Index],
                  DtoS(SaleDateEdit.Date),
                  vSaleNo,
                  UserCode,
                  StandardStore],false);

        ExecQuery('insert into OL_SALE_D(CD_HEAD, '
                 +'                      YMD_SALE, '
                 +'                      NO_SALE, '
                 +'                      SEQ, '
                 +'                      DS_SALE, '
                 +'                      CD_LOGISTICS, '
                 +'                      CD_STORE, '
                 +'                      CD_GOODS, '
                 +'                      QTY_ORDER, '
                 +'                      QTY_SALE, '
                 +'                      PR_SALE, '
                 +'                      AMT_TAX, '
                 +'                      AMT_SALE, '
                 +'                      AMT_BUY, '
                 +'                      DS_TAX) '
                 +'              select d.CD_HEAD, '
                 +'                     :P4, '
                 +'                     :P5, '
                 +'                     ROW_NUMBER() OVER () as SEQ, '
                 +'                     ''S'', '
                 +'                     g.CD_LOGISTICS, '
                 +'                     d.CD_STORE, '
                 +'                     d.CD_GOODS, '
                 +'                     d.QTY_ORDER, '
                 +'                     d.QTY_CONFIRM, '
                 +'                     d.PR_ORDER, '
                 +'                     divint(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END,11) as AMT_TAX, '
                 +'                     d.QTY_CONFIRM * d.PR_ORDER as AMT_ORDER, '
                 +'                     d.QTY_CONFIRM * g.PR_BUY as AMT_BUY, '
                 +'                     g.DS_TAX '
                 +'                from OL_ORDER_D as d inner join '
                 +'                     MS_GOODS   as g on g.CD_HEAD = d.CD_HEAD and g.CD_STORE  = :P6 AND g.CD_GOODS = d.CD_GOODS '
                 +'               where d.CD_HEAD      = :P0 '
                 +'                 and d.YMD_ORDER    = :P1 '
                 +'                 and d.CD_STORE     = :P2 '
                 +'                 and g.CD_LOGISTICS = :P3 '
                 +'                 and d.QTY_CONFIRM  > 0 '
                 +'                 and Ifnull(d.QTY_SALE,0) = 0 '
                 +'               group by d.CD_HEAD, d.YMD_ORDER, d.CD_GOODS;',
                 [HeadStoreCode,
                  GetOnlyNumber(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrderDate.Index]),
                  GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStoreCode.Index],
                  GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewLogisticsCode.Index],
                  DtoS(SaleDateEdit.Date),
                  vSaleNo,
                  StandardStore],false);

        if ExecQuery('update OL_ORDER_D inner join '
                    +'       OL_ORDER_H as h on h.CD_HEAD   = OL_ORDER_D.CD_HEAD '
                    +'                      and h.CD_STORE  = OL_ORDER_D.CD_STORE '
                    +'                      and h.YMD_ORDER = OL_ORDER_D.YMD_ORDER '
                    +'                      and h.NO_ORDER  = OL_ORDER_D.NO_ORDER '
                    +'                      and h.DS_STATUS = ''C'' inner join '
                    +'       MS_GOODS   as g on g.CD_HEAD   = OL_ORDER_D.CD_HEAD '
                    +'                      and g.CD_STORE  = :P4 '
                    +'                      and g.CD_GOODS  = OL_ORDER_D.CD_GOODS '
                    +'                      and g.CD_LOGISTICS =:P3 '
                    +'   set OL_ORDER_D.QTY_SALE = OL_ORDER_D.QTY_CONFIRM, '
                    +'       OL_ORDER_D.SALE_REF = :P5, '
                    +'       OL_ORDER_D.DT_SALE  = Now() '
                    +' where OL_ORDER_D.CD_HEAD   =:P0 '
                    +'   and OL_ORDER_D.YMD_ORDER =:P1 '
                    +'   and OL_ORDER_D.CD_STORE  =:P2 '
                    +'   and OL_ORDER_D.QTY_CONFIRM > 0 '
                    +'   and Ifnull(OL_ORDER_D.QTY_SALE,0)= 0;',
                    [HeadStoreCode,
                     GetOnlyNumber(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrderDate.Index]),
                     GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewStoreCode.Index],
                     GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewLogisticsCode.Index],
                     StandardStore,
                     DtoS(SaleDateEdit.Date)+vSaleNo],true) then
          GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewRowState.Index] := rsDelete;
      end;
    finally
      for vIndex := GridTableView.DataController.RecordCount-1 to 0 do
        if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
          GridTableView.DataController.DeleteRecord(vIndex);
      ButtonToolBarSaleButton.Enabled := false;
      ConfirmCancelButtonClick(nil);
    end;
  end
  else
  begin
    OpenQuery('select Max(NO_SALE) '
             +'  from OL_SALE_H '
             +' where CD_HEAD  =:P0 '
             +'   and YMD_SALE =:P1 ',
             [HeadStoreCode,
              DtoS(SaleDateEdit.Date)]);
    if Query.Fields[0].AsString = '' then
      vSaleNo := '0001'
    else
      vSaleNo := FormatFloat('0000', Query.Fields[0].AsInteger+1);
    Query.Close;

    ExecQuery('insert into OL_SALE_H(CD_HEAD, '
             +'                      YMD_SALE, '
             +'                      NO_SALE, '
             +'                      CD_STORE, '
             +'                      CD_LOGISTICS, '
             +'                      AMT_DUTY, '
             +'                      AMT_TAX, '
             +'                      AMT_DUTYFREE, '
             +'                      AMT_SALE, '
             +'                      AMT_BUY, '
             +'                      CD_SAWON, '
             +'                      ORDER_REF, '
             +'                      DT_INSERT, '
             +'                      DT_CHANGE) '
             +'               values(:P0, '
             +'                      :P1, '
             +'                      :P2, '
             +'                      :P3, '
             +'                      :P4, '
             +'                      :P5, '
             +'                      :P6, '
             +'                      :P7, '
             +'                      :P8, '
             +'                      :P9, '
             +'                      :P10, '
             +'                      ConCat(:P11,:P12), '
             +'                      Now(), '
             +'                      Now());',
             [HeadStoreCode,
              DtoS(SaleDateEdit.Date),
              vSaleNo,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLogisticsCode.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewNetAmt.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTaxAmt.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDutyfreeAmt.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSaleAmt.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyAmt.Index],
              UserCode,
              GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index]],false);

    ExecQuery('insert into OL_SALE_D(CD_HEAD, '
             +'                      YMD_SALE, '
             +'                      NO_SALE, '
             +'                      SEQ, '
             +'                      DS_SALE, '
             +'                      CD_LOGISTICS, '
             +'                      CD_STORE, '
             +'                      CD_GOODS, '
             +'                      QTY_ORDER, '
             +'                      QTY_SALE, '
             +'                      PR_SALE, '
             +'                      AMT_TAX, '
             +'                      AMT_SALE, '
             +'                      AMT_BUY) '
             +'              select d.CD_HEAD, '
             +'                     :P5, '
             +'                     :P6, '
             +'                     ROW_NUMBER() OVER () as SEQ, '
             +'                     ''S'', '
             +'                     g.CD_LOGISTICS, '
             +'                     d.CD_STORE, '
             +'                     d.CD_GOODS, '
             +'                     d.QTY_ORDER, '
             +'                     d.QTY_CONFIRM, '
             +'                     d.PR_ORDER, '
             +'                     divint(case when g.DS_TAX = ''1'' then d.PR_ORDER * d.QTY_CONFIRM ELSE 0 END,11) as AMT_TAX, '
             +'                     d.QTY_CONFIRM * d.PR_ORDER as AMT_ORDER, '
             +'                     d.QTY_CONFIRM * g.PR_BUY as AMT_BUY '
             +'                from OL_ORDER_D as d INNER JOIN '
             +'                     MS_GOODS   as g ON g.CD_HEAD = d.CD_HEAD and g.CD_STORE  = :P7 AND g.CD_GOODS = d.CD_GOODS '
             +'               where d.CD_HEAD     =  :P0 '
             +'                 and d.YMD_ORDER    = :P1 '
             +'                 and d.NO_ORDER     = :P2 '
             +'                 and d.CD_STORE     = :P3 '
             +'                 and g.CD_LOGISTICS = :P4 '
             +'                 and d.QTY_CONFIRM  > 0 '
             +'                 and Ifnull(d.QTY_SALE,0) = 0;',
             [HeadStoreCode,
              GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index],
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLogisticsCode.Index],
              DtoS(SaleDateEdit.Date),
              vSaleNo,
              StandardStore],false);

        if ExecQuery('update OL_ORDER_D inner join '
                    +'       MS_GOODS   as g on g.CD_HEAD      = OL_ORDER_D.CD_HEAD '
                    +'                      and g.CD_STORE     = :P5 '
                    +'                      and g.CD_GOODS     = OL_ORDER_D.CD_GOODS '
                    +'                      and g.CD_LOGISTICS =:P4 '
                    +'   set OL_ORDER_D.QTY_SALE = OL_ORDER_D.QTY_CONFIRM, '
                    +'       OL_ORDER_D.SALE_REF = :P6, '
                    +'       OL_ORDER_D.DT_SALE  = Now() '
                    +' where OL_ORDER_D.CD_HEAD   =:P0 '
                    +'   and OL_ORDER_D.YMD_ORDER =:P1 '
                    +'   and OL_ORDER_D.NO_ORDER  =:P2 '
                    +'   and OL_ORDER_D.CD_STORE  =:P3 '
                    +'   and OL_ORDER_D.QTY_CONFIRM > 0 '
                    +'   and Ifnull(OL_ORDER_D.QTY_SALE,0) = 0;',
                    [HeadStoreCode,
                     GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
                     GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index],
                     GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index],
                     GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewLogisticsCode.Index],
                     StandardStore,
                     DtoS(SaleDateEdit.Date)+vSaleNo],true) then

    begin
      ButtonToolBarSaleButton.Enabled := false;
      GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
      ConfirmCancelButtonClick(nil);
    end;
  end;
end;

procedure THeadSaleForm.FormResize(Sender: TObject);
begin
  inherited;
  ConfirmPanel.Top  := (Grid.Height - ConfirmPanel.Height) div 2 + Grid.Top;
  ConfirmPanel.Left := (Grid.Width  - ConfirmPanel.Width ) div 2 + Grid.Left;
end;

procedure THeadSaleForm.GridTableView1ConfirmQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableView1OrderQty.Index] < Integer(DisplayValue)  then
  begin
    Error := true;
    ErrorText := '출고수량이 발주수량보다 클수 없습니다';
  end;
end;

end.
