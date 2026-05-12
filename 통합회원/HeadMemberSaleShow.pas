unit HeadMemberSaleShow;

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
  StrUtils, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  THeadMemberSaleShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView2: TcxGridTableView;
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewMemberClass: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewMobileNo: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewMembrerDc: TcxGridColumn;
    GridTableViewOccurPoint: TcxGridColumn;
    GridTableViewUsePoint: TcxGridColumn;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1PosNo: TcxGridColumn;
    GridTableView1RcpNo: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    GridTableView2Column1: TcxGridColumn;
    GridTableView2Column2: TcxGridColumn;
    GridTableView2Column3: TcxGridColumn;
    GridTableView2Column4: TcxGridColumn;
    GridTableView2Column5: TcxGridColumn;
    GridTableView2Column8: TcxGridColumn;
    GridTableView2Column9: TcxGridColumn;
    GridTableViewTrustAmt: TcxGridColumn;
    GridTableView1Column1: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableView1RealDate: TcxGridColumn;
    GridTableViewBankAmt: TcxGridColumn;
    GridTableView1StoreName: TcxGridColumn;
    GridTableViewOccurStamp: TcxGridColumn;
    GridTableViewUseStamp: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuExcelClick(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  HeadMemberSaleShowForm: THeadMemberSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}
procedure THeadMemberSaleShowForm.FormCreate(Sender: TObject);
var vIndex :Integer;
    vCode : PStrPointer;
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddMonthFirst;
  SetWorkStoreList;

  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';
  ConditionToolBarComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));

  for vIndex := 1 to WorkStoreList.Count-1 do
  begin
    New(vCode);
    vCode^.Data := CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0);
    ConditionToolBarComboBox.Properties.Items.AddObject(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 1), TObject(vCode));
  end;
  ConditionToolBarComboBox.ItemIndex := 0;
end;

procedure THeadMemberSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure THeadMemberSaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //회원관리에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarEdit.Text := FormParam[0];
    FormParam[0] := EmptyStr;
    Exec_Timer.Enabled := True;
  end;
end;



procedure THeadMemberSaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    ButtonToolBarSearchButton.Enabled := True;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    ButtonToolBarSearchButton.Enabled := false;
    if GridTableView.DataController.RecordCount = 0 then Exit;
    if GridTableView.DataController.FocusedRecordIndex < 0 then Exit;
    DoSearch;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    ButtonToolBarSearchButton.Enabled := false;
    if GridTableView1.DataController.RecordCount = 0 then Exit;
    if GridTableView1.DataController.FocusedRecordIndex < 0 then Exit;
    DoSearch;
  end;
end;

procedure THeadMemberSaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView1.DataController.RecordCount = 0 then Exit;
  if GridTableView1.DataController.FocusedRecordIndex < 0 then Exit;
  Grid.ActiveLevel := GridLevel2;
  DoSearch;
end;

procedure THeadMemberSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;
  if GridTableView.DataController.FocusedRecordIndex < 0 then Exit;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure THeadMemberSaleShowForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
  Sender: TObject);
var vMobilNo :Boolean;
begin
  vMobilNo := GridTableViewMobileNo.Visible;
  GridTableViewMobileNo.Visible := false;
  inherited;
  GridTableViewMobileNo.Visible := vMobilNo;
end;

function THeadMemberSaleShowForm.DoSearch:Boolean;
var vCondititon :String;
    vIndex :Integer;
begin
  inherited;
  Result := false;
  case ConditionToolBarComboBox.ItemIndex of
    0 : vCondititon := EmptyStr;
    1 : vCondititon := 'and a.AMT_CASH+a.AMT_CHECK <> 0 ';
    2 : vCondititon := 'and a.AMT_CARD <> 0 ';
    3 : vCondititon := 'and a.AMT_TRUST <> 0 ';
  end;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select  a.CD_MEMBER, '
             +'         Max(b.NM_MEMBER) as NM_MEMBER, '
             +'         Max(c.NM_CODE1)  as DS_MEMBER, '
             +'         Max(b.NO_CARD)   as NO_CARD, '
             +'         Max(GetPhoneNo(AES_Decrypt(b.TEL_MOBILE, 71483))) as TEL_MOBILE, '
             +'         Sum(a.AMT_SALE)  as AMT_SALE, '
             +'         Sum(a.AMT_CASH+a.AMT_CHECK)  as AMT_CASH, '
             +'         Sum(a.AMT_CARD)  as AMT_CARD, '
             +'         Sum(a.AMT_TRUST)  as AMT_TRUST, '
             +'         Sum(a.AMT_BANK)  as AMT_BANK, '
             +'         Sum(a.DC_MEMBER) as DC_MEMBER, '
             +'         Sum(a.PNT_OCCUR) as PNT_OCCUR, '
             +'         Sum(a.PNT_USE)  as PNT_USE, '
             +'         Sum(a.SAVE_STAMP)  as SAVE_STAMP, '
             +'         Sum(a.USE_STAMP)  as USE_STAMP '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'         MS_MEMBER as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = :P1 and b.CD_MEMBER = a.CD_MEMBER left outer join '
             +'         MS_CODE   as c on c.CD_HEAD = b.CD_HEAD and c.CD_STORE = :P1 and b.DS_MEMBER = c.CD_CODE and c.CD_KIND = ''05'' '
             +' where   a.CD_HEAD  =:P0 '
              +Ifthen(GetStrPointerData(ConditionToolBarComboBox)<>'', Format(' and a.CD_STORE = ''%s'' ',[GetStrPointerData(ConditionToolBarComboBox)]),'')
             +'   and   a.YMD_SALE  between :P2 and :P3 '
             +'   and   a.DS_SALE  <> ''V'' '
             +   vCondititon
             +'  and   (b.CD_MEMBER = :P4'
             +'      or b.NM_MEMBER like ConCat(''%'',:P4,''%'') '
             +'      or b.NO_CARD = :P4 '
             +'      or AES_Decrypt(b.TEL_MOBILE, 71483) = :P4 '
             +'      or AES_Decrypt(b.TEL_MOBILE_SHORT, 71483) = :P4) '
             +'group by a.CD_MEMBER',
              [HeadStoreCode,
               StandardStore,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;

    GridTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if Length(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index]) = 13 then
        GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index] := LeftStr(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index],4)+'****'+RightStr(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index],5);

    GridTableView.DataController.EndUpdate;

  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select   b.NM_STORE, '
             +'         StoDW(a.YMD_SALE) as YMD_SALE, '
             +'         a.NO_POS, '
             +'         a.NO_RCP, '
             +'         case a.DS_SALE when ''S'' then ''판매'' when ''B'' then ''반품'' end as DS_SALE, '
             +'         a.AMT_SALE, '
             +'         a.AMT_TRUST, '
             +'         case when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT  = 0 and a.AMT_CASHRCP = 0 and a.AMT_CASH <> 0                                          then ''현금'' '
             +'              when a.AMT_CARD <>0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT  = 0 and a.AMT_CASHRCP = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_CARD))    then ''신용카드'' '
             +'              when a.AMT_CARD = 0 and a.AMT_CHECK <>0 and a.AMT_TRUST = 0 and a.AMT_GIFT  = 0 and a.AMT_CASHRCP = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_CHECK))   then ''수표'' '
             +'              when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST <>0 and a.AMT_GIFT  = 0 and a.AMT_CASHRCP = 0 and (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_TRUST))   then ''외상'' '
             +'              when a.AMT_CARD = 0 and a.AMT_CHECK = 0 and a.AMT_TRUST = 0 and a.AMT_GIFT <> 0 and a.AMT_CASHRCP = 0 and  (a.AMT_CASH = 0 or Abs(a.AMT_SALE) < Abs(a.AMT_GIFT))    then ''상품권'' '
             +'              when a.AMT_CARD = 0 and (a.AMT_CHECK + a.AMT_CASH) = a.AMT_CASHRCP and a.AMT_CASHRCP <> 0  then ''현금영수증'' '
             +'              else ''복합'' end as DS_ACCT, '
             +'         a.DC_MEMBER, '
             +'         a.PNT_OCCUR, '
             +'         a.PNT_USE, '
             +'         a.SAVE_STAMP, '
             +'         a.USE_STAMP, '
             +'         a.DT_SALE '
             +'   from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'         MS_STORE as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +' where   a.CD_HEAD  =:P0 '
             +Ifthen(GetStrPointerData(ConditionToolBarComboBox)<>'', Format(' and a.CD_STORE = ''%s'' ',[GetStrPointerData(ConditionToolBarComboBox)]),'')
             +'   and   a.YMD_SALE   between :P1 AND :P2 '
             + Replace(vCondititon,'a.','')
             +'  and    a.DS_SALE   <> ''V'' '
             +'  and    a.CD_MEMBER  = :P3 '
             +'order by a.YMD_SALE, a.CD_STORE ',
              [HeadStorecode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberCode.Index]]);
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    OpenQuery('select  d.CD_MENU, '
             +'        g.NM_MENU, '
             +'        g.NM_SPEC, '
             +'        d.QTY_SALE, '
             +'        case when g.DS_MENU_TYPE = ''W'' then DivFlt(d.AMT_SALE, DivFlt(d.QTY_SALE,100)) else d.PR_SALE end as PR_SALE, '
             +'        d.DC_TOT, '
             +'        d.AMT_SALE - d.DC_TOT  as AMT_SALE '
             +'  from '+GetPartitionTable('SL_SALE_D', StoD(GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index])), 'd left outer join')
             +'        MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
             +' where  d.CD_HEAD    = :P0 '
             +Ifthen(GetStrPointerData(ConditionToolBarComboBox)<>'', Format(' and d.CD_STORE = ''%s'' ',[GetStrPointerData(ConditionToolBarComboBox)]),'')
             +'   and  d.YMD_SALE   = :P1 '
             +'   and  d.NO_POS     = :P2 '
             +'   and  d.NO_RCP     = :P3 '
             +' order by d.SEQ',
              [HeadStoreCode,
               GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index]),
               GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1PosNo.Index],
               GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1RcpNo.Index]]);
    DM.ReadQuery(Query, GridTableView2);
    Result := GridTableView2.DataController.RecordCount > 0;
  end;
end;

end.