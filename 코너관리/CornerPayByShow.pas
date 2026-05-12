unit CornerPayByShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, cxContainer, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxGridBandedTableView, cxCurrencyEdit,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSPrVwRibbon, DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, MaskUtils,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCornerPayByShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1CornerName: TcxGridBandedColumn;
    GridBandedTableView1Column3: TcxGridBandedColumn;
    GridBandedTableView1SaleAmt: TcxGridBandedColumn;
    GridBandedTableView1Column5: TcxGridBandedColumn;
    GridBandedTableView1CashAmt: TcxGridBandedColumn;
    GridBandedTableView1Column7: TcxGridBandedColumn;
    GridBandedTableView1Column8: TcxGridBandedColumn;
    GridBandedTableView1CardAmt1: TcxGridBandedColumn;
    GridBandedTableView1Column10: TcxGridBandedColumn;
    GridBandedTableView1Column11: TcxGridBandedColumn;
    GridBandedTableView1CashReceipt1: TcxGridBandedColumn;
    GridBandedTableView1Column13: TcxGridBandedColumn;
    GridBandedTableView1Column14: TcxGridBandedColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridBandedTableView1CashReceipt2: TcxGridBandedColumn;
    GridBandedTableView1CardAmt2: TcxGridBandedColumn;
    GridBandedTableView2: TcxGridBandedTableView;
    GridBandedTableView2Column1: TcxGridBandedColumn;
    GridBandedTableView2Column2: TcxGridBandedColumn;
    GridBandedTableView2Column3: TcxGridBandedColumn;
    GridBandedTableView2Column4: TcxGridBandedColumn;
    GridBandedTableView2Column5: TcxGridBandedColumn;
    GridBandedTableView2Column6: TcxGridBandedColumn;
    GridBandedTableView2Column7: TcxGridBandedColumn;
    GridBandedTableView2Column8: TcxGridBandedColumn;
    GridBandedTableView2Column9: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
    FPay : String;
  protected
    function DoSearch:Boolean; override;
  end;

var
  CornerPayByShowForm: TCornerPayByShowForm;



implementation

uses
  Common, DBModule, Main;

{$R *.dfm}

function TCornerPayByShowForm.DoSearch:Boolean;
begin
  inherited;
  try
    OpenQuery('select Max(YMD_SALE) '
             +'  from SL_TRD_DAY '
             +' where CD_HEAD = :P0 '
             +'   and CD_STORE =:P1 '
             +' order by YMD_SALE desc',
              [HeadStoreCode,
               StoreCode]);
    if not Query.Eof then
    begin
      if Query.Fields[0].AsString < DtoS(ConditionToolBarToDateEdit.Date) then
      begin
        MsgBox('수수료 재계산 후 다시 조회하십시오.'#13'최종 재계산일자( '+ Query.Fields[0].AsString+' )');
        Result := True;
        ExtremeMainForm.RunProgram('CornerCommissionShow');
        Exit;
      end;
    end
    else
    begin
      MsgBox('수수료 재계산 후 다시 조회하십시오.');
      Result := True;
      ExtremeMainForm.RunProgram('CornerCommissionShow');
      Exit;
    end;
  finally
    FinishQuery;
  end;

  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   Max(t.NM_TRDPL) as NM_TRDPL, '
             +'         Max(a.RATE_SALE_FEE)                   as RATE_FEE, '
             +'         Sum(a.AMT_SALE)                        as AMT_SALE, '
             +'         Sum(a.AMT_SALE_FEE)                    as AMT_FEE, '
             +'         Sum(a.AMT_CASH)                        as AMT_CASH, '
             +'         Max(a.RATE_CASH_FEE)                   as RATE_FEE_CASH, '
             +'         Sum(a.AMT_CASH_FEE)                    as AMT_CASH_FEE, '
             +'         Sum(a.AMT_CARD_VAN)                    as AMT_CARD, '
             +'         Sum(a.AMT_CARD - a.AMT_CARD_VAN)       as AMT_CARD_MART, '
             +'         Max(a.RATE_CARD_FEE)                   as RATE_FEE_CARD, '
             +'         Sum(a.AMT_CARD_FEE)                    as AMT_CARD_FEE, '
             +'         Sum(a.AMT_CASHRCP_VAN)                 as AMT_CASHRCP, '
             +'         Sum(a.AMT_CASHRCP - a.AMT_CASHRCP_VAN) as AMT_CASHRCP_MART, '
             +'         Max(a.RATE_CASHRCP_FEE)                as RATE_FEE_CASHRCP, '
             +'         Sum(a.AMT_CASHRCP_FEE)                 as AMT_CASHRCP_FEE '
             +'  from   SL_TRD_DAY as a inner join '
             +'         MS_TRD     as t on a.CD_HEAD = t.CD_HEAD and a.CD_STORE = t.CD_STORE and a.CD_TRDPL = t.CD_TRDPL and t.DS_TRDPL = ''C'' '
             +' where   a.CD_HEAD  =:P0 '
             +'   and   a.CD_STORE =:P1 '
             +'   and   a.YMD_SALE between :P2 and :P3 '
             +'group by t.CD_TRDPL',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridBandedTableView1);
  end
  else
  begin
    OpenQuery('select   StoDW(YMD_SALE) as YMD_SALE, '
             +'         AMT_SALE, '
             +'         AMT_CASH, '
             +'         AMT_CASH_FEE, '
             +'         AMT_CARD, '
             +'         AMT_CARD_FEE, '
             +'         AMT_CASHRCP, '
             +'         AMT_CASHRCP_FEE, '
             +'         AMT_SALE_FEE + AMT_CASH_FEE + AMT_CASHRCP_FEE + AMT_CARD_FEE as AMT_FEE '
             +'  from   SL_TRD_DAY '
             +' where   CD_HEAD  =:P0 '
             +'   and   CD_STORE =:P1 '
             +'   and   YMD_SALE between :P2 and :P3 '
             +'   and   CD_TRDPL = :P4 ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               GetStrPointerData(ConditionToolBarComboBox)]);
    Result := DM.ReadQuery(Query, GridBandedTableView2);
  end;
end;

procedure TCornerPayByShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  HelpURL     := 'BackOffice/코너관리/코너%20결제수단별%20매출조회/코너%20결제수단별%20매출조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 거래처 목록을 불러온다
  OpenQuery('select  CD_TRDPL, '
           +'        NM_TRDPL  '
           +'  from  MS_TRD '
           +' where  CD_HEAD  =:P0 '
           +'   and  CD_STORE =:P1 '
           +'   and  DS_TRDPL in (''R'',''C'') '
           +' order by NM_TRDPL',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarComboBox.ItemIndex := 0;

end;

procedure TCornerPayByShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ConditionToolBarEditLabel.Visible := Grid.ActiveLevel = GridLevel1;
  ConditionToolBarComboBox.Visible  := Grid.ActiveLevel = GridLevel1;
end;

procedure TCornerPayByShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  vPrintData := rptSizeBoth + rptAlignCenter + '코너 결제수단별 매출'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridBandedTableView1 do
  begin
    for vIndex := 0 to DataController.FilteredRecordCount-1 do
    begin
      vPrintData := vPrintData + rptAlignLeft;
      vPrintData := vPrintData + Format('     코 너 명 : %s ', [DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableView1CornerName.Index]]) + #13;
      vPrintData := vPrintData + rptAlignLeft;
      vPrintData := vPrintData + Format('     매출금액 :  %s 원 ', [LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableView1SaleAmt.Index]),12,' ')]) + #13;
      vPrintData := vPrintData + Format('         현금 :  %s 원 ', [LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableView1CashAmt.Index]),12,' ')]) + #13;
      vPrintData := vPrintData + Format('   현금영수증 :  %s 원 ', [LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableView1CashReceipt1.Index]+DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableView1CashReceipt2.Index]),12,' ')]) + #13;
      vPrintData := vPrintData + Format('     신용카드 :  %s 원 ', [LPad(FormatFloat('#,0', DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableView1CardAmt1.Index]+DataController.Values[DataController.FilteredRecordIndex[vIndex], GridBandedTableView1CardAmt2.Index]),12,' ')]) + #13;
      if vIndex < DataController.RecordCount-1 then
        vPrintData := vPrintData +  rptOneLine+#13;
    end;
  end;
  vPrintData := vPrintData +  rptTwoLine;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;


end.

