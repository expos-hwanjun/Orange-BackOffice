unit SaleLetsOrderSaleShow;

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
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  StrUtils, cxCurrencyEdit, MaskUtils, cxMemo;

type
  TSaleLetsOrderSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewRcpNo: TcxGridColumn;
    GridTableViewCustName: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewAddr: TcxGridColumn;
    GridTableViewReceiveTel: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewDeliveryMemo: TcxGridColumn;
    GridTableViewOrderDate: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    GridTableViewCancelWhy: TcxGridColumn;
    GridTableViewDsDelivery: TcxGridColumn;
    GridTableViewStoreMemo: TcxGridColumn;
    PopUpMemo: TcxMemo;
    ButtonToolBarSave2Button: TAdvGlowButton;
    GridTableViewRowState: TcxGridColumn;
    GridTableViewPost: TcxGridColumn;
    ButtonPopupMenu: TPopupMenu;
    ConfirmItem: TMenuItem;
    DeliveryItem: TMenuItem;
    CancelItem: TMenuItem;
    FinishItem: TMenuItem;
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewStoreMemoPropertiesPopup(Sender: TObject);
    procedure GridTableViewStoreMemoPropertiesCloseUp(Sender: TObject);
    procedure ButtonToolBarSave2ButtonClick(Sender: TObject);
    procedure GridTableViewDeliveryMemoPropertiesPopup(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ConfirmItemClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
  private
    isSelected : Boolean;
    procedure DoReceiptPrint(aRecordNo:Integer);
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleLetsOrderSaleShowForm: TSaleLetsOrderSaleShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ TInheritShowForm1 }
procedure TSaleLetsOrderSaleShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'and c.DS_STATUS = ''O'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('주문', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and c.DS_STATUS = ''C'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('주문확정', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and c.DS_STATUS = ''D'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('배송', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and c.DS_STATUS = ''R'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('취소요청', TObject(vCode));
  New(vCode);
  vCode^.Data := 'and c.DS_STATUS = ''A'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('취소완료', TObject(vCode));
  New(vCode);
  vCode^.Data := EmptyStr;
  ConditionToolBarComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;

  isSelected := false;
end;

procedure TSaleLetsOrderSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;
  DoReceiptPrint(GridTableView.DataController.GetFocusedRecordIndex);
end;

procedure TSaleLetsOrderSaleShowForm.ButtonToolBarSave2ButtonClick(
  Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = 'rsNormal' then Continue;

    ExecQuery('update SL_SALE_LETSORDER '
             +'   set STORE_MEMO =:P5 '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_SALE =:P2 '
             +'   and NO_POS   =:P3 '
             +'   and NO_RCP   =:P4;',
             [HeadStoreCode,
              StoreCode,
              GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewSaleDate.Index]),
              LeftStr(GridTableView.DataController.Values[vIndex, GridTableViewRcpNo.Index],2),
              RightStr(GridTableView.DataController.Values[vIndex, GridTableViewRcpNo.Index],4),
              GridTableView.DataController.Values[vIndex, GridTableViewStoreMemo.Index]],false);
  end;

  if TempSQL <> '' then
  begin
    if ExecQuery('',[],true) then
    begin
      for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
        GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] := 'rsNormal';

      ButtonToolBarSave2Button.Enabled := false;
    end;
  end;

end;

procedure TSaleLetsOrderSaleShowForm.ButtonToolBarSaveButtonClick(
  Sender: TObject);
var  vPoint: TPoint;
begin
  inherited;
  vPoint := ClientToScreen(Point(ButtonToolBar.Left + ButtonToolBarSaveButton.Left+ 2, ButtonToolBarSaveButton.Top + 2));
  SetCursorPos(vPoint.X, vPoint.Y);
  ButtonPopupMenu.Popup(vPoint.X, vPoint.Y);
end;

procedure TSaleLetsOrderSaleShowForm.ConfirmItemClick(Sender: TObject);
var vIndex :Integer;
    vStatus :String;
begin
  inherited;

  if GridTableView.DataController.GetFocusedRecordIndex < 0 then
  begin
    MsgBox(Format('%s할 주문을 선택하세요',[ButtonToolBarSaveButton.Caption]));
    Exit;
  end;

  if not AskBox(Format('%s 처리 하시겠습니까?',[(Sender as TMenuItem).Caption])) then
    Exit;

  if (Sender as TMenuItem).Hint = 'C' then
    vStatus := 'DS_STATUS = ''C'', DT_CONFIRM = Now() '
  else if (Sender as TMenuItem).Hint = 'A' then
    vStatus := 'DS_STATUS = ''A'', DT_CANCEL = Now() '
  else if (Sender as TMenuItem).Hint = 'D' then
    vStatus := 'DS_STATUS = ''D'', DT_DELIVERY_BEGIN = Now() '
  else if (Sender as TMenuItem).Hint = 'F' then
    vStatus := 'DS_STATUS = ''F'', DT_DELIVERY = Now() ';


  with GridTableView do
  begin
    if ((Sender as TMenuItem).Hint = 'C') and (DataController.Values[DataController.GetFocusedRecordIndex, GridTableViewAddr.Index] = '') then
    begin
      MsgBox('배송지를 입력 후 확정이 가능합니다.');
      Exit;
    end;

    if ExecQuery('update SL_SALE_LETSORDER '
               +'   set '+vStatus
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and YMD_SALE =:P2 '
               +'   and NO_POS   =:P3 '
               +'   and NO_RCP   =:P4;',
               [HeadStoreCode,
                StoreCode,
                GetOnlyNumber(DataController.Values[DataController.GetFocusedRecordIndex, GridTableViewSaleDate.Index]),
                LeftStr(DataController.Values[DataController.GetFocusedRecordIndex, GridTableViewRcpNo.Index],2),
                RightStr(DataController.Values[DataController.GetFocusedRecordIndex, GridTableViewRcpNo.Index],4)],true) then
    begin
      if (Sender as TMenuItem).Hint = 'C' then
        DoReceiptPrint(DataController.GetFocusedRecordIndex)
      //취소완료이면 영수증도 취소처리한다
      else if (Sender as TMenuItem).Hint = 'A' then
      begin
        ExecQuery('insert into SL_CARD(CD_HEAD, '
                 +'                    CD_STORE, '
                 +'             			 YMD_SALE, '
                 +'             			 NO_POS, '
                 +'                    NO_RCP, '
                 +'             			 SEQ, '
                 +'                    DS_CARD, '
                 +'             			 DS_TRD, '
                 +'                    TYPE_TRD, '
                 +'                    PG_TID, '
                 +'                    NO_APPROVAL, '
                 +'             			 NO_CARD, '
                 +'             			 AMT_APPROVAL, '
                 +'             			 AMT_TIP, '
                 +'             			 AMT_VAT, '
                 +'             			 TERM_HALBU, '
                 +'             			 TRD_DATE, '
                 +'             			 TRD_TIME, '
                 +'             			 NM_CARDPL) '
                 +'            select  CD_HEAD, '
                 +'                    CD_STORE, '
                 +'             			 YMD_SALE, '
                 +'             			 NO_POS, '
                 +'             			 NO_RCP, '
                 +'             	     2, '
                 +'                  	 DS_CARD, '
                 +'             			 ''C'', '
                 +'                    TYPE_TRD, '
                 +'                    PG_TID, '
                 +'             			 NO_APPROVAL, '
                 +'             			 NO_CARD, '
                 +'             			 AMT_APPROVAL*-1, '
                 +'             			 AMT_TIP, '
                 +'             			 AMT_VAT*-1, '
                 +'             			 TERM_HALBU, '
                 +'             			 TRD_DATE, '
                 +'             			 TRD_TIME, '
                 +'                    NM_CARDPL '
                 +'              from  SL_CARD '
                 +'             where  CD_HEAD  =:P0 '
                 +'               and  CD_STORE =:P1 '
                 +'               and  YMD_SALE =:P2 '
                 +'               and  NO_POS   =:P3 '
                 +'               and  NO_RCP   =:P4;'
                 +'update SL_SALE_H '
                 +'   set DS_SALE = ''V'' '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and YMD_SALE =:P2 '
                 +'   and NO_POS   =:P3 '
                 +'   and NO_RCP   =:P4;'
                 +'update SL_SALE_D '
                 +'   set DS_SALE = ''V'' '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and YMD_SALE =:P2 '
                 +'   and NO_POS   =:P3 '
                 +'   and NO_RCP   =:P4;',
                 [HeadStoreCode,
                  StoreCode,
                  GetOnlyNumber(DataController.Values[DataController.GetFocusedRecordIndex, GridTableViewSaleDate.Index]),
                  LeftStr(DataController.Values[DataController.GetFocusedRecordIndex, GridTableViewRcpNo.Index],2),
                  RightStr(DataController.Values[DataController.GetFocusedRecordIndex, GridTableViewRcpNo.Index],4)],true);
      end;

      DataController.DeleteRecord(DataController.GetFocusedRecordIndex);
    end;
  end;
end;

procedure TSaleLetsOrderSaleShowForm.DoReceiptPrint(aRecordNo: Integer);
var vPrintData :String;
    vTotAmt, vIndex      :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;

  vTotAmt := 0;
  vPrintData := rptSizeBoth + rptAlignCenter + '렛츠오더 주문내역'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  with GridTableView do
  begin
    vPrintData := vPrintData + Format('주문번호 : %s-%s ',[GetOnlyNumber(DataController.Values[aRecordNo, GridTableViewSaleDate.Index]),
                                                           DataController.Values[aRecordNo, GridTableViewRcpNo.Index]])+#13;
    vPrintData := vPrintData + '주문일시 : '+ DataController.Values[aRecordNo, GridTableViewOrderDate.Index]+#13;
    vPrintData := vPrintData + Format('주 문 자 : %s ',[DataController.Values[aRecordNo, GridTableViewCustName.Index]])+#13;
    vPrintData := vPrintData + rptSizeHeight + Format('연 락 처 : %s ',[GetPhoneNo(DataController.Values[aRecordNo, GridTableViewReceiveTel.Index])])+#13
                                             + DataController.Values[aRecordNo, GridTableViewAddr.Index]+rptSizeNormal+ #13;
    if NVL(DataController.Values[aRecordNo, GridTableViewDeliveryMemo.Index],'') <> '' then
    begin
       vPrintData := vPrintData + '- 요청사항 -'+#13
                                + DataController.Values[aRecordNo, GridTableViewDeliveryMemo.Index]+#13;
    end;

    vPrintData := vPrintData +  rptOneLine+#13;
    OpenQuery('select a.CD_MENU, '
             +'       b.NM_MENU, '
             +'       a.QTY_SALE, '
             +'       a.PR_SALE, '
             +'       a.AMT_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'       MS_MENU   as b on b.CD_HEAD  = a.CD_HEAD '
             +'                     and b.CD_STORE = a.CD_STORE '
             +'                     and b.CD_MENU  = a.CD_MENU '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE =:P2 '
             +'   and a.NO_POS   =:P3 '
             +'   and a.NO_RCP   =:P4 '
             +' order by a.SEQ ',
             [HeadStoreCode,
              StoreCode,
              GetOnlyNumber(DataController.Values[aRecordNo, GridTableViewSaleDate.Index]),
              LeftStr(DataController.Values[aRecordNo, GridTableViewRcpNo.Index],2),
              RightStr(DataController.Values[aRecordNo, GridTableViewRcpNo.Index],4)]);
    vIndex := 1;
    while not Query.Eof do
    begin
      vTotAmt := vTotAmt + Query.FieldByName('AMT_SALE').AsInteger;
      vPrintData := vPrintData + Format('%-2.2s%-14.14s%s',[IntToStr(vIndex), Query.FieldByName('CD_MENU').AsString, Query.FieldByName('NM_MENU').AsString]) +#13
                               + Format('%20.20s%10.10s%12.12s',
                                       [Query.FieldByName('QTY_SALE').AsString,
                                        FormatFloat(',0',Query.FieldByName('PR_SALE').AsInteger),
                                        FormatFloat(',0',Query.FieldByName('AMT_SALE').AsInteger)])+#13;
      Inc(vIndex);
      Query.Next;
    end;
    Query.Close;

    vPrintData := vPrintData + rptOneLine+#13;
    vPrintData := vPrintData + rptSizeHeight+Format('         [ 주문금액 ]%20.20s',[FormatFloat(',0원',vTotAmt)])+#13;
    vPrintData := vPrintData + rptSizeNormal;
  end;

  PrintPrinter(vPrintData);
  PrintPrinter(vPrintData);
end;

function TSaleLetsOrderSaleShowForm.DoSearch: Boolean;
var vIndex, vSaleAmt :Integer;
begin
  ButtonToolBarSaveButton.Enabled := false;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select StoD(YMD_SALE) as YMD_SALE, '
             +'       ConCat(NO_POS,''-'',NO_RCP) as NO_RCP, '
             +'       case DS_STATUS when ''O'' then ''주문''     when ''C'' then ''주문확정'' when ''R'' then ''취소요청'' '
             +'                      when ''A'' then ''취소완료'' when ''D'' then ''배송''     when ''F'' then ''배송완료'' '
             +'                      when ''B'' then ''반품'' end as DS_STATUS, '
             +'       NM_CUST, '
             +'       AMT_SALE, '
             +'       GetPhoneNo(TEL_MOBILE) as TEL_MOBILE, '
             +'       GetPhoneNo(TEL_RECEIVE) as TEL_RECEIVE, '
             +'       NO_POST, '
             +'       ADDRESS, '
             +'       DELIVERY_MEMO, '
             +'       DELIVERY_CANCEL_MEMO, '
             +'       STORE_MEMO, '
             +'       case DS_DELIVERY when ''1'' then ''포장'' when ''2'' then ''배달'' when ''4'' then ''택배'' end DS_DELIVERY, '
             +'       Date_Format(DT_ORDER, ''%Y-%m-%d %H:%i'') as DT_ORDER, '
             +'       case when DT_CONFIRM is null then '''' else Date_Format(DT_CONFIRM, ''%Y-%m-%d %H:%i'') end as DT_CONFIRM, '
             +'       ''rsNormal'' as ROW_STATE, '
             +'       case when DT_CANCEL_REQ is null then '''' else Date_Format(DT_CANCEL_REQ, ''%Y-%m-%d %H:%i'') end as DT_CANCEL_REQ '
             +'  from SL_SALE_LETSORDER '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_SALE between :P2 and :P3 '
             +Replace(GetStrPointerData(ConditionToolBarComboBox),'c.','')
             +' order by YMD_SALE, NO_POS, NO_RCP ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
    vSaleAmt := 0;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewStatus.Index] <> '취소완료' then
        vSaleAmt := vSaleAmt + GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index];
    end;

   GridTableView.DataController.Summary.FooterSummaryValues[0] := vSaleAmt;

    ButtonToolBarSave2Button.Enabled := false;
   if (GetStrPointerData(ConditionToolBarComboBox) <> '') and Result then
      ButtonToolBarSaveButton.Enabled := true;
  end
  else
  begin
    OpenQuery('select a.CD_MENU, '
             +'       Max(b.NM_MENU) as NM_MENU, '
             +'       Sum(a.QTY_SALE) as QTY_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'       MS_MENU   as b on b.CD_HEAD  = a.CD_HEAD '
             +'                     and b.CD_STORE = a.CD_STORE '
             +'                     and b.CD_MENU  = a.CD_MENU inner join '
             +'       SL_SALE_LETSORDER as c on c.CD_HEAD = a.CD_HEAD '
             +'                             and c.CD_STORE = a.CD_STORE '
             +'                             and c.YMD_SALE = a.YMD_SALE '
             +'                             and c.NO_POS   = a.NO_POS '
             +'                             and c.NO_RCP   = a.NO_RCP '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +GetStrPointerData(ConditionToolBarComboBox)
             +' group by a.CD_MENU ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);

    Result := DM.ReadQuery(Query, GridTableView1);
  end;
end;

procedure TSaleLetsOrderSaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel <> GridLevel1 then Exit;

  if isSelected then
  begin
    OpenQuery('select a.CD_MENU, '
             +'       b.NM_MENU, '
             +'       a.QTY_SALE, '
             +'       a.PR_SALE, '
             +'       a.AMT_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'       MS_MENU   as b on b.CD_HEAD  = a.CD_HEAD '
             +'                     and b.CD_STORE = a.CD_STORE '
             +'                     and b.CD_MENU  = a.CD_MENU '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE =:P2 '
             +'   and a.NO_POS   =:P3 '
             +'   and a.NO_RCP   =:P4 '
             +' order by a.SEQ ',
             [HeadStoreCode,
              StoreCode,
              GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSaleDate.Index]),
              LeftStr(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRcpNo.Index],2),
              RightStr(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRcpNo.Index],4)]);
    DM.ReadQuery(Query, GridTableView1);
  end;
end;

procedure TSaleLetsOrderSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  isSelected := true;
  Grid.ActiveLevel := GridLevel1;
  isSelected := false;
end;

procedure TSaleLetsOrderSaleShowForm.GridTableViewDeliveryMemoPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  PopUpMemo.Properties.ReadOnly := true;
  PopUpMemo.Text := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDeliveryMemo.Index],'');
end;

procedure TSaleLetsOrderSaleShowForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ConfirmItem.Enabled  := false;
  DeliveryItem.Enabled := false;
  CancelItem.Enabled   := false;
  FinishItem.Enabled   := false;
  ButtonToolBarPrintButton.Enabled := false;
  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index] = '주문' then
  begin
    ConfirmItem.Enabled  := true;
    CancelItem.Enabled   := true;
  end
  else if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index] = '주문확정' then
  begin
    ButtonToolBarPrintButton.Enabled := true;
    DeliveryItem.Enabled  := true;
    CancelItem.Enabled    := true;
  end
  else if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index] = '배송' then
  begin
    ButtonToolBarPrintButton.Enabled := true;
    CancelItem.Enabled   := true;
    FinishItem.Enabled   := true;
  end
  else if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index] = '취소요청' then
  begin
    CancelItem.Enabled   := true;
  end;
end;

procedure TSaleLetsOrderSaleShowForm.GridTableViewStoreMemoPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  ButtonToolBarSave2Button.Enabled := true;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreMemo.Index] := PopUpMemo.Text;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := 'rsUpdate';
end;

procedure TSaleLetsOrderSaleShowForm.GridTableViewStoreMemoPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  PopUpMemo.Properties.ReadOnly := false;
  PopUpMemo.Text := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreMemo.Index],'');

end;

procedure TSaleLetsOrderSaleShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewStatus.Index] = '취소요청' then
    AStyle := StyleFontRed
  else if ARecord.Values[GridTableViewStatus.Index] = '취소완료' then
    AStyle := StyleFontGray;
end;

end.
