unit HeadOrderConfirm;

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
  cxCalendar, AdvGlowButton, cxImageComboBox, cxMemo, AdvPanel, StrUtils, DateUtils,
  dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadOrderConfirmForm = class(TInheritShowForm)
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
    GridTableView1ConfirmQty: TcxGridColumn;
    GridTableView1Logistics: TcxGridColumn;
    Grid1Level: TcxGridLevel;
    GridTableViewOrderDate: TcxGridColumn;
    GridTableViewOrderNo: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewOrderStatus: TcxGridColumn;
    GridTableViewOrderType: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    ButtonToolBarConfirmButton: TAdvGlowButton;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;
    ImageList1: TImageList;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewInsertDate: TcxGridColumn;
    GridTableViewChangeDate: TcxGridColumn;
    ConfirmPanel: TAdvPanel;
    ReceiveEmpLabel: TLabel;
    ReceivePasswordLabel: TLabel;
    Label1: TLabel;
    ConfirmOKButton: TAdvGlowButton;
    ConfirmCancelButton: TAdvGlowButton;
    ConfirmPasswordEdit: TcxTextEdit;
    DeliveryDateEdit: TcxDateEdit;
    UserIDEdit: TcxTextEdit;
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarConfirmButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ConfirmOKButtonClick(Sender: TObject);
    procedure ConfirmCancelButtonClick(Sender: TObject);
    procedure GridTableView1ConfirmQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ConfirmPasswordEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewOrderTypeStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    procedure ButtonEnable(aStatus:String);
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadOrderConfirmForm: THeadOrderConfirmForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

{ TOrderConfirmForm }
procedure THeadOrderConfirmForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionToolBarComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and a.DS_STATUS = ''O'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('발주', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and a.DS_STATUS = ''C'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('발주확정', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and a.DS_STATUS = ''D'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('발주삭제', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and c.YMD_SALE is null ';
  ConditionToolBarComboBox.Properties.Items.AddObject('출고완료', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;
end;

procedure THeadOrderConfirmForm.ButtonEnable(aStatus:String);
begin
  if aStatus = 'C' then
  begin
    ButtonToolBarConfirmButton.Enabled := false;
    ButtonToolBarCancelButton.Enabled  := true;
    ButtonToolBarDeleteButton.Enabled  := false;
  end
  else if aStatus = 'O' then
  begin
    ButtonToolBarConfirmButton.Enabled := true;
    ButtonToolBarCancelButton.Enabled  := false;
    ButtonToolBarDeleteButton.Enabled  := true;
  end
  else
  begin
    ButtonToolBarConfirmButton.Enabled := false;
    ButtonToolBarCancelButton.Enabled  := false;
    ButtonToolBarDeleteButton.Enabled  := false;
  end

end;

procedure THeadOrderConfirmForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('발주확정을 취소하시겠습니까?') then Exit;

  ExecQuery('update OL_ORDER_H '
           +'   set DS_STATUS    = ''O'', '
           +'       YMD_DELIVERY = '''', '
           +'       DT_CONFIRM   = null, '
           +'       CD_SAWON_CONFIRM ='''' '
           +' where CD_HEAD   =:P0 '
           +'   and YMD_ORDER =:P1 '
           +'   and NO_ORDER  =:P2;',
           [HeadStoreCode,
            GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index],
            DtoS(DeliveryDateEdit.Date)],false);

  if  ExecQuery('update OL_ORDER_D '
               +'   set QTY_CONFIRM = null '
               +' where CD_HEAD   =:P0 '
               +'   and YMD_ORDER =:P1 '
               +'   and NO_ORDER  =:P2;',
               [HeadStoreCode,
                GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
                GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index]],true) then
  begin
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderStatus.Index] := 'O';
    ButtonEnable(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderStatus.Index]);
  end;
end;

procedure THeadOrderConfirmForm.ButtonToolBarConfirmButtonClick(Sender: TObject);
begin
  inherited;
  DeliveryDateEdit.Date    := IncDay(Now(),1);
  Grid.Enabled             := false;
  Grid1.Enabled            := false;
  ToolBarDockPanel.Enabled := false;
  UserIDEdit.Text          := UserCode;
  ConfirmPanel.Visible     := true;
  ConfirmPasswordEdit.SetFocus;
end;

procedure THeadOrderConfirmForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('발주를 삭제하시겠습니까?') then Exit;
  if ExecQuery('update OL_ORDER_H '
              +'   set DS_STATUS    = ''D'' '
              +' where CD_HEAD   =:P0 '
              +'   and YMD_ORDER =:P1 '
              +'   and NO_ORDER  =:P2;',
              [HeadStoreCode,
               GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index]],true) then
  begin
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderStatus.Index] := 'D';
    ButtonEnable(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderStatus.Index]);
  end;
end;

procedure THeadOrderConfirmForm.ConfirmCancelButtonClick(Sender: TObject);
begin
  inherited;
  Grid.Enabled             := true;
  Grid1.Enabled            := true;
  ToolBarDockPanel.Enabled := true;
  ConfirmPanel.Visible     := false;
end;

procedure THeadOrderConfirmForm.ConfirmOKButtonClick(Sender: TObject);
var vIndex :Integer;
    vOrderNo :String;
begin
  inherited;
  if ConfirmPasswordEdit.Text <> UserPWD then
  begin
    MsgBox(Format('%s 사용자의 비밀번호가 올바르지 않습니다',[UserName]));
    Exit;
  end;

  if GridTableView.Controller.SelectedRowCount > 1 then
  begin
    vOrderNo := '';
    for vIndex := 0 to GridTableView.Controller.SelectedRowCount - 1 do
      vOrderNo := vOrderNo + Format('''%s'',',[GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrderNo.Index]]);

    vOrderNo := Format('and NO_ORDER in (%s);',[LeftStr(vOrderNo, Length(vOrderNo)-1)]);

    ExecQuery('update OL_ORDER_H '
             +'   set DS_STATUS    = ''C'', '
             +'       YMD_DELIVERY =:P2, '
             +'       DT_CONFIRM   = Now(), '
             +'       CD_SAWON_CONFIRM =:P3 '
             +' where CD_HEAD   =:P0 '
             +'   and YMD_ORDER =:P1 '
             +vOrderNo,
             [HeadStoreCode,
              GetOnlyNumber(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrderDate.Index]),
              DtoS(DeliveryDateEdit.Date),
              UserCode],false);

    ExecQuery('update OL_ORDER_D '
             +'   set QTY_CONFIRM = QTY_ORDER '
             +' where CD_HEAD   =:P0 '
             +'   and YMD_ORDER =:P1 '
             +vOrderNo,
             [HeadStoreCode,
              GetOnlyNumber(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrderDate.Index])],false);
  end
  else
  begin
    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    begin
      if GridTableView1.DataController.Values[vIndex, GridTableView1OrderQty.Index] < GridTableView1.DataController.Values[vIndex, GridTableView1ConfirmQty.Index] then
      begin
        MsgBox('발주수량보다 확정수량이 큰 상품이 있습니다');
        Break;
        Exit;
      end;
    end;


    ExecQuery('update OL_ORDER_H '
             +'   set DS_STATUS    = ''C'', '
             +'       YMD_DELIVERY =:P3, '
             +'       DT_CONFIRM   = Now(), '
             +'       CD_SAWON_CONFIRM =:P4 '
             +' where CD_HEAD   =:P0 '
             +'   and YMD_ORDER =:P1 '
             +'   and NO_ORDER  =:P2;',
             [HeadStoreCode,
              GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index],
              DtoS(DeliveryDateEdit.Date),
              UserCode],false);

    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    begin
      if GridTableView1.DataController.Values[vIndex, GridTableView1ConfirmQty.Index] = 0 then Continue;

      ExecQuery('update OL_ORDER_D '
               +'   set QTY_CONFIRM = :P4 '
               +' where CD_HEAD   =:P0 '
               +'   and YMD_ORDER =:P1 '
               +'   and NO_ORDER  =:P2 '
               +'   and CD_GOODS  =:P3;',
               [HeadStoreCode,
                GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderDate.Index]),
                GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderNo.Index],
                GridTableView1.DataController.Values[vIndex, GridTableView1GoodsCode.Index],
                GridTableView1.DataController.Values[vIndex, GridTableView1ConfirmQty.Index]],false);
    end;
  end;
  if ExecQuery('',[],true) then
  begin
    for vIndex := 0 to GridTableView.Controller.SelectedRowCount - 1 do
      GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrderStatus.Index] := 'C';

    GridTableView.Controller.ClearSelection;
    ButtonEnable('발주확정');
    ConfirmCancelButton.Click;
  end;
end;

procedure THeadOrderConfirmForm.ConfirmPasswordEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    ConfirmOKButtonClick(nil);
end;

function THeadOrderConfirmForm.DoSearch: Boolean;
begin
  OpenQuery('select   StoD(a.YMD_ORDER) as YMD_ORDER, '
           +'         a.NO_ORDER, '
           +'         case a.DS_ORDER when ''S'' then ''매장발주'' when ''H'' then ''긴급발주'' end as DS_ORDER, '
           +'         case when c.ORDER_REF is not null then ''S'' else a.DS_STATUS end DS_STATUS, '
           +'         b.NM_STORE, '
           +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
           +'         a.AMT_TAX, '
           +'         a.AMT_ORDER , '
           +'         StoD(YMD_REQUEST) as YMD_REQUEST, '
           +'         StoD(YMD_DELIVERY) as YMD_DELIVERY, '
           +'         a.ORDER_REMARK, '
           +'         a.DT_INSERT, '
           +'         a.DT_CHANGE '
           +'  from   OL_ORDER_H as a left outer join '
           +'         MS_STORE   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE left outer join '
           +'        (select CD_STORE, '
           +'                ORDER_REF '
           +'           from OL_SALE_H '
           +'          where CD_HEAD  =:P0 '
           +'            and YMD_SALE >= :P1 '
           +'          group by CD_STORE, ORDER_REF) as c on c.CD_STORE = a.CD_STORE and Left(c.ORDER_REF,8) = a.YMD_ORDER and Right(c.ORDER_REF,4) = a.NO_ORDER '
           +' where   a.CD_HEAD    =:P0 '
           +'   and   a.YMD_ORDER  between :P1 and :P2 '
           +GetStrPointerData(ConditionToolBarComboBox)
           +' order by a.YMD_ORDER, a.NO_ORDER',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
  //발주만 조회 조건일때 다중선택이 되도록 한다
  if Result and (GetStrPointerData(ConditionToolBarComboBox) = 'and a.DS_STATUS = ''O'' ') then
    GridTableView.OptionsSelection.MultiSelect := true
  else
    GridTableView.OptionsSelection.MultiSelect := false;

  if Result then
    GridTableView.Controller.FocusedRowIndex := 0;
end;


procedure THeadOrderConfirmForm.FormResize(Sender: TObject);
begin
  inherited;
  ConfirmPanel.Top  := (Grid.Height - ConfirmPanel.Height) div 2 + Grid.Top;
  ConfirmPanel.Left := (Grid.Width  - ConfirmPanel.Width ) div 2 + Grid.Left;
end;

procedure THeadOrderConfirmForm.GridTableView1ConfirmQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1OrderQty.Index] < Integer(DisplayValue)  then
  begin
    Error := true;
    ErrorText := '확정수량이 발주수량보다 클수 없습니다';
  end;
end;

procedure THeadOrderConfirmForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var vSQL :String;
begin
  inherited;
  if AFocusedRecord = nil then
  begin
    GridTableView1.DataController.RecordCount := 0;
    Exit;
  end;

  if AFocusedRecord.Values[GridTableViewOrderStatus.Index] = 'O' then
  begin
    vSQL := 'a.QTY_ORDER as QTY_CONFIRM, ';
    GridTableView1ConfirmQty.Options.Focusing := true;
  end
  else
  begin
    vSQL := 'a.QTY_CONFIRM, ';
    GridTableView1ConfirmQty.Options.Focusing := false;
  end;

  OpenQuery('select   a.SEQ, '
           +'         a.CD_GOODS, '
           +'         b.NM_GOODS, '
           +'         b.NM_UNIT, '
           +'         a.QTY_ORDER, '
           +vSQL
           +'         a.PR_ORDER, '
           +'         a.AMT_ORDER, '
           +'         c.NM_TRDPL as NM_LOGISTICS '
           +'  from   OL_ORDER_D as a left outer join '
           +'         MS_GOODS   as b on a.CD_HEAD = b.CD_HEAD and b.CD_STORE = :P3 and a.CD_GOODS = b.CD_GOODS left outer join '
           +'         MS_TRD     as c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = :P3 and c.CD_TRDPL = b.CD_LOGISTICS '
           +' where   a.CD_HEAD   = :P0 '
           +'   and   a.YMD_ORDER = :P1 '
           +'   and   a.NO_ORDER  = :P2 '
           +' order by a.SEQ',
            [HeadStoreCode,
             GetOnlyNumber(AFocusedRecord.Values[GridTableViewOrderDate.Index]),
             AFocusedRecord.Values[GridTableViewOrderNo.Index],
             StandardStore]);
  DM.ReadQuery(Query, GridTableView1);

  ButtonEnable(AFocusedRecord.Values[GridTableViewOrderStatus.Index]);
end;

procedure THeadOrderConfirmForm.GridTableViewOrderTypeStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[AItem.Index] = '긴급발주' then
    AStyle := StyleFontRed;
end;

procedure THeadOrderConfirmForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewOrderStatus.Index] = 'D' then
    AStyle := StyleFontGray
  else if ARecord.Values[GridTableViewOrderStatus.Index] = 'C' then
    AStyle := StyleFontBlue;
end;

end.
