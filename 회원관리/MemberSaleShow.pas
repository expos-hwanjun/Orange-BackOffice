unit MemberSaleShow;

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
  TMemberSaleShowForm = class(TInheritShowForm)
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
    GridTableViewAddStamp: TcxGridColumn;
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
    isSelected :Boolean;
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  MemberSaleShowForm: TMemberSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TMemberSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TMemberSaleShowForm.FormActivate(Sender: TObject);
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

procedure TMemberSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
  isSelected  := false;
end;

procedure TMemberSaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
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
    ButtonToolBarSearchButton.Enabled := true;
    if GridTableView1.DataController.RecordCount = 0 then Exit;
    if GridTableView1.DataController.FocusedRecordIndex < 0 then Exit;
    DoSearch;
  end;
end;

procedure TMemberSaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView1.DataController.RecordCount = 0 then Exit;
  if GridTableView1.DataController.FocusedRecordIndex < 0 then Exit;
  Grid.ActiveLevel := GridLevel2;
  isSelected := true;
  DoSearch;
  isSelected := false;
end;

procedure TMemberSaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView.DataController.FocusedRecordIndex < 0 then Exit;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure TMemberSaleShowForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
  Sender: TObject);
var vMobilNo :Boolean;
begin
  vMobilNo := GridTableViewMobileNo.Visible;
  GridTableViewMobileNo.Visible := false;
  inherited;
  GridTableViewMobileNo.Visible := vMobilNo;
end;

function TMemberSaleShowForm.DoSearch:Boolean;
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
             +'         Sum(a.SAVE_STAMP) as SAVE_STAMP, '
             +'         Sum(a.USE_STAMP) as USE_STAMP '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'         MS_MEMBER as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = :P5 and a.CD_MEMBER = b.CD_MEMBER left outer join '
             +'         MS_CODE   as c on b.CD_HEAD = c.CD_HEAD and b.CD_STORE = c.CD_STORE and b.DS_MEMBER = c.CD_CODE and c.CD_KIND = ''05'' '
             +' where   a.CD_HEAD  =:P0 '
             +'   and   a.CD_STORE =:P1 '
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
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarEdit.Text,
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridTableView);

    GridTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if Length(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index]) = 13 then
        GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index] := LeftStr(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index],4)+'****'+RightStr(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index],5);
    GridTableView.DataController.EndUpdate;
  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select   StoDW(YMD_SALE) as YMD_SALE, '
             +'         NO_POS, '
             +'         NO_RCP, '
             +'         case DS_SALE when ''S'' then ''판매'' when ''B'' then ''반품'' end as DS_SALE, '
             +'         AMT_SALE, '
             +'         AMT_TRUST, '
             +'         case when AMT_CARD = 0 and AMT_CHECK = 0 and AMT_TRUST = 0 and AMT_GIFT = 0 and AMT_CASHRCP = 0 and  AMT_CASH <> 0                                          then ''현금'' '
             +'              when AMT_CARD <>0 and AMT_CHECK = 0 and AMT_TRUST = 0 and AMT_GIFT = 0 and AMT_CASHRCP = 0 and  (AMT_CASH = 0 or Abs(AMT_SALE) < Abs(AMT_CARD))    then ''신용카드'' '
             +'              when AMT_CARD = 0 and AMT_CHECK <>0 and AMT_TRUST = 0 and AMT_GIFT = 0 and AMT_CASHRCP = 0 and  (AMT_CASH = 0 or Abs(AMT_SALE) < Abs(AMT_CHECK))   then ''수표'' '
             +'              when AMT_CARD = 0 and AMT_CHECK = 0 and AMT_TRUST <>0 and AMT_GIFT = 0 and AMT_CASHRCP = 0 and  (AMT_CASH = 0 or Abs(AMT_SALE) < Abs(AMT_TRUST))   then ''외상'' '
             +'              when AMT_CARD = 0 and AMT_CHECK = 0 and AMT_TRUST = 0 and AMT_GIFT <> 0 and AMT_CASHRCP = 0 and  (AMT_CASH = 0 or Abs(AMT_SALE) < Abs(AMT_GIFT))    then ''상품권'' '
             +'              when AMT_CARD = 0 and (AMT_CHECK + AMT_CASH) = AMT_CASHRCP and AMT_CASHRCP <> 0  then ''현금영수증'' '
             +'              else ''복합'' end as DS_ACCT, '
             +'         DC_MEMBER, '
             +'         PNT_OCCUR, '
             +'         PNT_USE, '
             +'         SAVE_STAMP, '
             +'         USE_STAMP, '
             +'         DT_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +' where   CD_HEAD  =:P0 '
             +'  and    CD_STORE =:P1 '
             +'   and   YMD_SALE   between :P2 AND :P3 '
             + Replace(vCondititon,'a.','')
             +'  and    DS_SALE   <> ''V'' '
             +'  and    CD_MEMBER  = :P4 '
             +'order by YMD_SALE, CD_MEMBER',
              [HeadStorecode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberCode.Index]]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    if isSelected then
      OpenQuery('select  d.CD_MENU, '
               +'        g.NM_MENU, '
               +'        g.NM_SPEC, '
               +'        d.QTY_SALE, '
               +'        case when g.DS_MENU_TYPE = ''W'' then DivFlt(d.AMT_SALE, DivFlt(d.QTY_SALE,100)) else d.PR_SALE end as PR_SALE, '
               +'        d.DC_TOT, '
               +'        d.AMT_SALE - d.DC_TOT  as AMT_SALE '
               +'  from  '+GetPartitionTable('SL_SALE_D', StoD(GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index])),'d left outer join ')
               +'        MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
               +' where  d.CD_HEAD    = :P0 '
               +'   and  d.CD_STORE   = :P1 '
               +'   and  d.YMD_SALE   = :P2 '
               +'   and  d.NO_POS     = :P3 '
               +'   and  d.NO_RCP     = :P4 '
               +' order by d.SEQ',
                [HeadStoreCode,
                 StoreCode,
                 GetOnlyNumber(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1SaleDate.Index]),
                 GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1PosNo.Index],
                 GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1RcpNo.Index]])
    else
      OpenQuery('select  d.CD_MENU, '
               +'        Max(g.NM_MENU) as NM_MENU, '
               +'        Max(g.NM_SPEC) as NM_SPEC, '
               +'        Sum(d.QTY_SALE) as QTY_SALE, '
               +'        0 as PR_SALE, '
               +'        Sum(d.DC_TOT) as DC_TOT, '
               +'        Sum(d.AMT_SALE - d.DC_TOT)  as AMT_SALE '
               +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd left outer join')
               +'        MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU '
               +' where  d.CD_HEAD    = :P0 '
               +'   and  d.CD_STORE   = :P1 '
               +'   and  d.YMD_SALE   between :P2 and :P3 '
               +'   and  d.CD_MEMBER  = :P4 '
               +' group by d.CD_MENU '
               +' order by d.CD_MENU',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberCode.Index]]);

    Result := DM.ReadQuery(Query, GridTableView2);
  end;
end;

end.