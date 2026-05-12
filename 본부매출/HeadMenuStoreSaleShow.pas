unit HeadMenuStoreSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridDBTableView, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit, StrUtils, frxClass,
  frxExportBaseDialog, frxExportImage, MaskUtils;

type
  TReportMaster = record
    CD_MENU     : string;
    NM_MENU     : string;
    QTY_SALE,
    AMT_SALE: Currency;
  end;

  TReportDetail = record
    CD_MENU,
    CD_STORE,
    NM_STORE      : string;
    QTY_SALE,
    AMT_SALE: Currency;
  end;

type
  THeadMenuStoreSaleShowForm = class(TInheritShow2Form)
    GridDBTableViewMenuCode: TcxGridDBColumn;
    GridDBTableViewMenuName: TcxGridDBColumn;
    GridDBTableViewSaleQty: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridDBTableViewMenuType: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    FastReport: TfrxReport;
    FastReportMasterDataSet: TfrxUserDataSet;
    FastReportDetailDataSet: TfrxUserDataSet;
    frxTIFFExport: TfrxTIFFExport;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FastReportMasterDataSetCheckEOF(Sender: TObject;
      var Eof: Boolean);
    procedure FastReportMasterDataSetFirst(Sender: TObject);
    procedure FastReportMasterDataSetGetValue(const VarName: string;
      var Value: Variant);
    procedure FastReportMasterDataSetNext(Sender: TObject);
    procedure FastReportMasterDataSetPrior(Sender: TObject);
    procedure FastReportDetailDataSetCheckEOF(Sender: TObject;
      var Eof: Boolean);
    procedure FastReportDetailDataSetFirst(Sender: TObject);
    procedure FastReportDetailDataSetGetValue(const VarName: string;
      var Value: Variant);
    procedure FastReportDetailDataSetNext(Sender: TObject);
    procedure FastReportDetailDataSetPrior(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
  private
    ReportMaster,
    ReportDetail: TList;
    MasterNo: Integer;
    DetailNo: Integer;
    DestStoreCode :String;
    procedure GetPrintData;
    procedure Print(aPrint:Integer);
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  HeadMenuStoreSaleShowForm: THeadMenuStoreSaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}
procedure THeadMenuStoreSaleShowForm.FastReportDetailDataSetCheckEOF(
  Sender: TObject; var Eof: Boolean);
begin
  inherited;
  Eof := DetailNo >= ReportDetail.Count;
end;

procedure THeadMenuStoreSaleShowForm.FastReportDetailDataSetFirst(
  Sender: TObject);
begin
  inherited;
  DetailNo := 0;
  while (not FastReportDetailDataSet.Eof) and ((TReportDetail(ReportDetail.Items[DetailNo]^).CD_MENU <> TReportMaster(ReportMaster.Items[MasterNo]^).CD_MENU) ) do
    Inc(DetailNo);

end;

procedure THeadMenuStoreSaleShowForm.FastReportDetailDataSetGetValue(
  const VarName: string; var Value: Variant);
begin
  inherited;
  if VarName = 'CD_MENU' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).CD_MENU
  else if VarName = 'CD_STORE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).CD_STORE
  else if VarName = 'NM_STORE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).NM_STORE
  else if VarName = 'QTY_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).QTY_SALE
  else if VarName = 'AMT_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).AMT_SALE;

end;

procedure THeadMenuStoreSaleShowForm.FastReportDetailDataSetNext(
  Sender: TObject);
begin
  inherited;
  Inc(DetailNo);
  while (not FastReportDetailDataSet.Eof) and ((TReportDetail(ReportDetail.Items[DetailNo]^).CD_MENU <> TReportMaster(ReportMaster.Items[MasterNo]^).CD_MENU)) do
    Inc(DetailNo);
end;

procedure THeadMenuStoreSaleShowForm.FastReportDetailDataSetPrior(
  Sender: TObject);
begin
  inherited;
  Dec(DetailNo);
  while (not FastReportDetailDataSet.Eof) and ((TReportDetail(ReportDetail.Items[DetailNo]^).CD_MENU <> TReportMaster(ReportMaster.Items[MasterNo]^).CD_MENU)) do
    Dec(DetailNo);
end;

procedure THeadMenuStoreSaleShowForm.FastReportMasterDataSetCheckEOF(
  Sender: TObject; var Eof: Boolean);
begin
  inherited;
  Eof := MasterNo >= ReportMaster.Count;
end;

procedure THeadMenuStoreSaleShowForm.FastReportMasterDataSetFirst(
  Sender: TObject);
begin
  inherited;
  MasterNo := 0;
end;

procedure THeadMenuStoreSaleShowForm.FastReportMasterDataSetGetValue(
  const VarName: string; var Value: Variant);
begin
  inherited;
  if VarName = 'CD_MENU' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).CD_MENU
  else if VarName = 'NM_MENU' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).NM_MENU
  else if VarName = 'QTY_SALE' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).QTY_SALE
  else if VarName = 'AMT_SALE' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).AMT_SALE;
end;

procedure THeadMenuStoreSaleShowForm.FastReportMasterDataSetNext(
  Sender: TObject);
begin
  inherited;
  Inc(MasterNo);
end;

procedure THeadMenuStoreSaleShowForm.FastReportMasterDataSetPrior(
  Sender: TObject);
begin
  inherited;
  Dec(MasterNo);
end;

procedure THeadMenuStoreSaleShowForm.FormCreate(Sender: TObject);
var
  vCode  :PStrPointer;
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
  ReportMaster         := TList.Create;
  ReportDetail         := TList.Create;

  OpenQuery('select CD_STORE,  '
           +'       NM_STORE '
           +'  from MS_STORE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE <> :P1 '
           +'   and YN_USE = ''Y'' '
           +' order by CD_STORE ',
           [HeadStoreCode,
            StandardStore]);
  try
    ConditionToolBarComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '';
    ConditionToolBarComboBox.Properties.Items.AddObject('전매장', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    ConditionToolBarComboBox.ItemIndex := 0;
    Query.Close;
  end;
end;

procedure THeadMenuStoreSaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  ReportMaster.Free;
  ReportDetail.Free;
end;

procedure THeadMenuStoreSaleShowForm.GetPrintData;
var vIndex :Integer;
  vReportMaster  : ^TReportMaster;
  vReportDetail  : ^TReportDetail;

begin
  ReportMaster.Clear;
  for vIndex := 0 to GridDBTableView.DataController.RecordCount-1 do
  begin
    New(vReportMaster);
    with vReportMaster^ do
    begin
      CD_MENU     := GridDBTableView.DataController.Values[vIndex, GridDBTableViewMenuCode.Index];
      NM_MENU     := GridDBTableView.DataController.Values[vIndex, GridDBTableViewMenuName.Index];
      QTY_SALE    := GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleQty.Index];
      AMT_SALE    := GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleAmt.Index];
    end;
    ReportMaster.Add(vReportMaster);
  end;

  ReportDetail.Clear;
  try
    OpenQuery('select d.CD_MENU, '
             +'       d.CD_STORE, '
             +'       Max(m.NM_STORE) as NM_STORE, '
             +'       SUM(d.QTY_SALE) as QTY_SALE, '
             +'       SUM(d.AMT_SALE) as AMT_SALE '
             +'  from SL_SALE_D_SUM d inner join '
             +'       MS_STORE      m  on m.CD_HEAD  = d.CD_HEAD '
             +'                       and m.CD_STORE = d.CD_STORE '
             +' where d.CD_HEAD     =:P0 '
             +'   and d.CD_STORE '+ DestStoreCode
             +'   and d.YMD_SALE between :P1 and :P2 '
             +' group by d.CD_MENU, d.CD_STORE '
             +' order by d.CD_MENU, d.CD_STORE ',
             [HeadStoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    while not Query.Eof do
    begin
      New(vReportDetail);
      with vReportDetail^ do
      begin
        CD_MENU     := Query.FieldByName('CD_MENU').AsString;
        CD_STORE    := Query.FieldByName('CD_STORE').AsString;
        NM_STORE    := Query.FieldByName('NM_STORE').AsString;
        QTY_SALE    := Query.FieldByName('QTY_SALE').AsCurrency;
        AMT_SALE    := Query.FieldByName('AMT_SALE').AsCurrency;
      end;
      ReportDetail.Add(vReportDetail);
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;

procedure THeadMenuStoreSaleShowForm.Print(aPrint: Integer);
var
  vMemo : TfrxMemoView;
begin
  if GridDBTableView.DataController.RecordCount = 0 then
  begin
    MsgBox('출력 할 내용이 없습니다');
    Exit;
  end;
  GetPrintData;


  // 출력일시
  vMemo := TfrxMemoView(FastReport.FindObject('PrintTime'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '출력일시 : '+FormatDateTime(fmtDateTime, Now);

  // 매장명
  vMemo := TfrxMemoView(FastReport.FindObject('StoreNameLabel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Replace(Replace(HeadStoreName,'[','【'),']','】');

  // 조회기간
  vMemo := TfrxMemoView(FastReport.FindObject('DateMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Format('조회기간 : %s ~ %s (%s)', [FormatMaskText('!9999-99-99;0;',DtoS(ConditionToolBarFromDateEdit.Date)), FormatMaskText('!9999-99-99;0;',DtoS(ConditionToolBarToDateEdit.Date)),ReportTitle]);


  case aPrint of
    0 :
    begin
      FastReport.PrepareReport();
      FastReport.Print;
    end;
    1 : FastReport.ShowReport;
  end;
end;

procedure THeadMenuStoreSaleShowForm.ButtonToolBarPrintButtonPopupMenuPreviewClick(
  Sender: TObject);
begin
//  inherited;
  Print(1);
end;

procedure THeadMenuStoreSaleShowForm.ButtonToolBarPrintButtonPopupMenuPrintClick(
  Sender: TObject);
begin
//  inherited;
  Print(0);
end;

procedure THeadMenuStoreSaleShowForm.ClearGrid;
begin
  inherited;
  GridSubDBTableView.DataController.DataSource  := nil;
  GridDBTableView.DataController.DataSource := nil;
end;

function THeadMenuStoreSaleShowForm.DoSearch: Boolean;
var vIndex :Integer;
begin
  SetWorkStoreList;
  if GetStrPointerData(ConditionToolBarComboBox) = '' then
  begin
    DestStoreCode := '';
    for vIndex := 1 to WorkStoreList.Count-1 do
      DestStoreCode := DestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);

    if DestStoreCode = '' then Exit;
    DestStoreCode := Format(' in (%s) ',[LeftStr(DestStoreCode, Length(DestStoreCode)-1)]);
  end
  else
    DestStoreCode := Format(' in (''%s'') ',[GetStrPointerData(ConditionToolBarComboBox)]);

  if GetChainHeadOption(2) = '1' then
    OpenQuery('select   d.CD_MENU, '
             +'         Max(c.NM_CLASS) as NM_CLASS, '
             +'         Max(g.NM_MENU) as NM_MENU, '
             +'         GetQty(Max(g.DS_MENU_TYPE), Sum(d.QTY_SALE)) as QTY_SALE, '
             +'         Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
             +'  from   SL_SALE_D_SUM as d inner join '
             +'         MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
             +'                           and g.CD_STORE =:P1 '
             +'                           and d.CD_MENU  = g.CD_MENU left outer join '
             +'         MS_MENU_CLASS as c on c.CD_HEAD  = d.CD_HEAD '
             +'                           and c.CD_STORE = :P1 '
             +'                           and c.CD_CLASS = Left(g.CD_CLASS,2) '
             +' where   d.CD_HEAD  =:P0 '
             +'   and   d.CD_STORE '+DestStoreCode
             +'   and   d.YMD_SALE between :P2 and :P3 '
             +'   and  (d.CD_MENU like ConCat(:P4,''%'') or g.NM_MENU like ConCat(''%'',:P4,''%'') ) '
             +' group by d.CD_MENU '
             +' having Sum(d.QTY_SALE) <> 0 '
             +' order by d.CD_MENU',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text])
  else
    OpenQuery('select   h.CD_MENU, '
             +'         c.NM_CLASS, '
             +'         h.NM_MENU, '
             +'         s.QTY_SALE, '
             +'         s.AMT_SALE '
             +'  from   MS_MENU as h inner join '
             +'        ( '
             +'          select   g.CD_MENU_HEAD, '
             +'                   GetQty(Max(g.DS_MENU_TYPE), Sum(d.QTY_SALE)) as QTY_SALE, '
             +'                   Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
             +'            from   SL_SALE_D_SUM as d inner join '
             +'                   MS_MENU       as g on d.CD_HEAD  = g.CD_HEAD '
             +'                                     and g.CD_STORE = d.CD_STORE '
             +'                                     and d.CD_MENU  = g.CD_MENU '
             +'           where   d.CD_HEAD  =:P0 '
             +'             and   d.CD_STORE '+ DestStoreCode
             +'             and   d.YMD_SALE between :P2 and :P3 '
             +'           group by g.CD_MENU_HEAD '
             +'           having Sum(d.QTY_SALE) <> 0 '
             +'         ) as s on s.CD_MENU_HEAD = h.CD_MENU left outer join '
             +'         MS_MENU_CLASS as c on c.CD_HEAD  = h.CD_HEAD '
             +'                           and c.CD_STORE = :P1 '
             +'                           and c.CD_CLASS = Left(h.CD_CLASS,2) '
             +' where   h.CD_HEAD  =:P0 '
             +'   and   h.CD_STORE =:P1 '
             +'   and  (h.CD_MENU like ConCat(:P4,''%'') or h.NM_MENU like ConCat(''%'',:P4,''%'') ) '
             +' order by h.CD_MENU',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text]);
  GridDBTableView.DataController.DataSource := nil;
  Result := DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  if GetStrPointerData(ConditionToolBarComboBox) = '' then
    ReportTitle := '전매장'
  else
    ReportTitle := ConditionToolBarComboBox.Text;



  if GetStrPointerData(ConditionToolBarComboBox) = '' then
  begin
    if GetChainHeadOption(2) = '1' then
      OpenQuery('select  a.CD_MENU, '
               +'        a.CD_STORE, '
               +'        b.NM_STORE, '
               +'        a.QTY_SALE, '
               +'        a.AMT_SALE '
               +'  from ('
               +'        select  d.CD_STORE, '
               +'                d.CD_MENU, '
               +'                GetQty(Max(m.DS_MENU_TYPE), Sum(d.QTY_SALE)) as QTY_SALE, '
               +'                Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'         from   SL_SALE_D_SUM as d inner join '
               +'                MS_MENU       as m on m.CD_HEAD  = d.CD_HEAD '
               +'                                  and m.CD_STORE = :P1 '
               +'                                  and m.CD_MENU  = d.CD_MENU '
               +'        where   d.CD_HEAD  =:P0 '
               +'          and   d.CD_STORE '+DestStoreCode
               +'          and   d.YMD_SALE between :P2 and :P3 '
               +'          and  (d.CD_MENU like ConCat(:P4,''%'') or m.NM_MENU like ConCat(''%'',:P4,''%'') ) '
               +'        group by d.CD_STORE, d.CD_MENU '
               +'        ) as a inner join '
               +'        MS_STORE as b on b.CD_HEAD  = :P0 '
               +'                     and b.CD_STORE = a.CD_STORE '
               +' order by a.CD_MENU, b.CD_STORE ',
                [HeadStoreCode,
                 StandardStore,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ConditionToolBarEdit.Text])
    else
      OpenQuery('select  a.CD_MENU, '
               +'        a.CD_STORE, '
               +'        b.NM_STORE, '
               +'        a.QTY_SALE, '
               +'        a.AMT_SALE '
               +'  from ('
               +'        select  d.CD_STORE, '
               +'                m.CD_MENU_HEAD as CD_MENU, '
               +'                GetQty(Max(m.DS_MENU_TYPE), Sum(d.QTY_SALE)) as QTY_SALE, '
               +'                Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'         from   SL_SALE_D_SUM as d inner join '
               +'                MS_MENU       as m on m.CD_HEAD  = d.CD_HEAD '
               +'                                  and m.CD_STORE = d.CD_STORE '
               +'                                  and m.CD_MENU  = d.CD_MENU '
               +'        where   d.CD_HEAD  =:P0 '
               +'          and   d.CD_STORE '+ DestStoreCode
               +'          and   d.YMD_SALE between :P1 and :P2 '
               +'          and  (d.CD_MENU like ConCat(:P3,''%'') or m.NM_MENU like ConCat(''%'',:P3,''%'') ) '
               +'        group by d.CD_STORE, m.CD_MENU_HEAD '
               +'        ) as a inner join '
               +'        MS_STORE as b on b.CD_HEAD  = :P0 '
               +'                     and b.CD_STORE = a.CD_STORE '
               +' order by a.CD_MENU, b.CD_STORE ',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 ConditionToolBarEdit.Text]);


    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;
    GridSubLevel.Visible := true;
  end
  else
    GridSubLevel.Visible := false;

end;

end.
