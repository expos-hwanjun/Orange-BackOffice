unit OrderModify;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, StrUtils,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  ExtCtrls, AdvSplitter, cxCurrencyEdit, AdvToolBarStylers, StdCtrls,
  cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, cxImageComboBox, dxPSCore, dxPScxCommon,
  frxClass, Math, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TOrderModifyForm = class(TInheritShow2Form)
    ListGrid: TcxGrid;
    ListGridTableView: TcxGridTableView;
    ListGridTableViewOrderDate: TcxGridColumn;
    ListGridLevel: TcxGridLevel;
    GridSplitter: TAdvSplitter;
    GridDBTableViewOrderNo: TcxGridDBColumn;
    GridDBTableViewStoreName: TcxGridDBColumn;
    GridDBTableViewNetAmt: TcxGridDBColumn;
    GridDBTableViewVatAmt: TcxGridDBColumn;
    GridDBTableViewBuyAmt: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewOrderUnit: TcxGridDBColumn;
    GridSubDBTableViewOrderQty: TcxGridDBColumn;
    GridSubDBTableViewOrderPrice: TcxGridDBColumn;
    GridSubDBTableViewOrderAmt: TcxGridDBColumn;
    GridDBTableViewRemark: TcxGridDBColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarSeparator3: TAdvToolBarSeparator;
    GridDBTableViewBuyDate: TcxGridDBColumn;
    GridDBTableViewUserName: TcxGridDBColumn;
    GridDBTableViewStatus: TcxGridDBColumn;
    ImageList1: TImageList;
    GridSubDBTableViewSeq: TcxGridDBColumn;
    FastReportSaleDataSet: TfrxUserDataSet;
    FastReportDataSet: TfrxUserDataSet;
    FastReport: TfrxReport;
    GridDBTableViewInsertDate: TcxGridDBColumn;
    GridDBTableViewChangeDate: TcxGridDBColumn;
    GridDBTableViewChangeUser: TcxGridDBColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridDBTableViewCompare: TcxGridDBColumn;
    ListGridTableViewYmdOrder: TcxGridColumn;
    GridSubDBTableViewNetAmt: TcxGridDBColumn;
    GridSubDBTableViewTaxAmt: TcxGridDBColumn;
    GridDBTableViewDsOrder: TcxGridDBColumn;
    GridDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewColumn2: TcxGridDBColumn;
    GridDBTableViewColumn3: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  OrderModifyForm: TOrderModifyForm;



implementation

uses
  Common, DBModule, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TOrderModifyForm.FormActivate(Sender: TObject);
var vIndex, vIndex1 :Integer;
begin
  inherited;
  //매입등록에서 수정 후에 액티브 됐을때
  if (FormParam[0] = 'OrderOrder') or (FormParam[0] = 'HeadOrder') then
  begin
    vIndex  := ListGridTableView.DataController.FocusedRecordIndex;
    vIndex1 := GridDBTableView.DataController.FocusedRecordIndex;
    isLoading := true;
    DoSearch;
    isLoading := false;
    ListGridTableView.DataController.FocusedRecordIndex := vIndex;
    GridDBTableView.DataController.FocusedRecordIndex   := vIndex1;
  end;
end;

procedure TOrderModifyForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmExcel;
  DefaultDate := ddToday;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TOrderModifyForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // 단축키 처리를 한다
  case Key of
    VK_F4 : ButtonToolBarDeleteButton.Click;
    VK_F5 : ButtonToolBarSaveButton.Click;
  end;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TOrderModifyForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TOrderModifyForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var
  vOrderDate, vOrderNo: string;
begin
  if not ButtonToolBarDeleteButton.Visible or not ButtonToolBarDeleteButton.Enabled then
    Exit;

  inherited;

  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('삭제할 발주서를 선택하십시오.');
    Exit;
  end;

  vOrderDate := GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyDate.Index]);
  vOrderNo  := String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index]);


  if not AskBox(vOrderNo+' 발주서를 삭제하시겠습니까?') then
    Exit;

  // 삭제한다
  try
    // 매입 디테일 테이블을 삭제한다
    ExecQuery('delete from OL_ORDER_D '
             +' where CD_HEAD   =:P0 '
             +'   and YMD_ORDER =:P1 '
             +'   and NO_ORDER  =:P2;',
              [HeadStoreCode,
               vOrderDate,
               vOrderNo],
               false);

    // 매입 마스터 테이블을 삭제한다
    ExecQuery('delete from OL_ORDER_H '
             +' where CD_HEAD    = :P0 '
             +'   and YMD_ORDER  = :P1 '
             +'   and NO_ORDER   = :P2;',
              [HeadStoreCode,
               vOrderDate,
               vOrderNo],
               false);

    if ExecQuery('', [], true) then
    begin
    // 선택된 레코드를 삭제한다
      GridDBTableView.DataController.DeleteFocused;
      ShowMsg('발주서를 삭제했습니다.');
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;
procedure TOrderModifyForm.ButtonToolBarPrintButtonPopupMenuPrintClick(
  Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 수정 버튼
procedure TOrderModifyForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;
  if (Tag = 0) and (Copy(HelpKeyword,3,1) = '0') then
  begin
    MsgBox('수정 권한이 없습니다');
    Exit;
  end;

  inherited;

  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('수정할 발주서를 선택하십시오.');
    Exit;
  end;

  //#####
  FormParam[0] := LeftStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyDate.Index],10)+
                  GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOrderNo.Index];

  if not SetWorkingTable('I','O',GetOnlyNumber(FormParam[0])) then
  begin
    FormParam[0] := '';
    Exit;
  end;



  if Tag = 0 then
  begin
    if ExtremeMainForm.CheckFormShow('OrderOrder') then
    begin
      FormParam[0] := '';
      MsgBox('작업중인 발주서가 있습니다');
    end
    else
      ExtremeMainForm.RunProgram('OrderOrder');
  end
  else
  begin
    if ExtremeMainForm.CheckFormShow('HeadOrder') then
    begin
      FormParam[0] := '';
      MsgBox('작업중인 발주서가 있습니다');
    end
    else
      ExtremeMainForm.RunProgram('HeadOrder');
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 날짜목록 그리드 다른 레코드를 선택할 때
procedure TOrderModifyForm.ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vDate: string;
begin
  inherited;

  if isLoading then Exit;

  try
    // 선택한 날짜에 해당하는 자료들만 매입 그리드에서 필터링해서 보여준다
    if ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewOrderDate.Index] <> null then
      vDate := ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewYmdOrder.Index];


    // 매입 마스터 쿼리를 열어 그리드에 보여준다
    OpenQuery('select   a.NO_ORDER, '
             +'         case a.DS_ORDER when ''S'' then ''매장발주'' when ''H'' then ''긴급발주'' end as DS_ORDER, '
             +'         case when d.ORDER_REF is not null then ''S'' else a.DS_STATUS end DS_STATUS, '
             +'         d.AMT_SALE, '
             +'         b.NM_STORE, '
             +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
             +'         a.AMT_TAX, '
             +'         a.AMT_ORDER , '
             +'         c.NM_SAWON as NM_SAWON_INSERT, '
             +'         StoD(YMD_REQUEST) as YMD_REQUEST, '
             +'         StoD(YMD_DELIVERY) as YMD_DELIVERY, '
             +'         a.ORDER_REMARK, '
             +'         a.DT_INSERT, '
             +'         a.DT_CHANGE, '
             +'         e.NM_SAWON as NM_SAWON_CHG, '
             +'         StoD(a.YMD_ORDER) as YMD_ORDER, '
             +'         ConCat(a.YMD_ORDER,a.NO_ORDER) as LINK, '
             +'         ConCat(b.NM_STORE,Cast(a.AMT_ORDER as Char)) as COMPARE '
             +'  from   OL_ORDER_H as a left outer join '
             +'         MS_STORE   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE left outer join '
             +'         MS_SAWON   as c on a.CD_HEAD = c.CD_HEAD and c.CD_STORE = :P2 and a.CD_SAWON_INSERT = c.CD_SAWON left outer join '
             +'         MS_SAWON   as e on a.CD_HEAD = e.CD_HEAD and e.CD_STORE = :P2 and a.CD_SAWON_CHG    = e.CD_SAWON left outer join '
             +'        (select CD_STORE, '
             +'                ORDER_REF, '
             +'                SUM(AMT_SALE) as AMT_SALE '
             +'           from OL_SALE_H '
             +'          where CD_HEAD  =:P0 '
             +'            and YMD_SALE >= :P1 '
             +'          group by CD_STORE, ORDER_REF) as d on d.CD_STORE = a.CD_STORE and Left(d.ORDER_REF,8) = a.YMD_ORDER and Right(d.ORDER_REF,4) = a.NO_ORDER '
             +' where   a.CD_HEAD    =:P0 '
             +'   and   a.YMD_ORDER  =:P1 '
             +Ifthen(Tag=0, Format('and a.CD_STORE = ''%s'' ',[StoreCode]),'')
             +' order by a.YMD_ORDER, a.NO_ORDER',
              [HeadStoreCode,
               vDate,
               Ifthen(Tag=0,StoreCode,StandardStore)]);
    //중복비교용
    GridDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, MemData);
    GridDBTableView.DataController.DataSource := DataSource;
  finally
    FinishQuery;
  end;
  try
    if GridDBTableView.DataController.RecordCount > 0 then
    begin
      // 매입 디테일 쿼리를 열어 그리드에 보여준다
      OpenQuery('select   a.SEQ, '
               +'         a.CD_GOODS, '
               +'         b.NM_GOODS, '
               +'         b.NM_UNIT, '
               +'         a.QTY_ORDER, '
               +'         a.PR_ORDER, '
               +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
               +'         a.AMT_TAX, '
               +'         a.AMT_ORDER, '
               +'         ConCat(a.YMD_ORDER,a.NO_ORDER) as LINK '
               +'  from   OL_ORDER_D as a left outer join '
               +'         MS_GOODS   as b on a.CD_HEAD = b.CD_HEAD and a.CD_GOODS = b.CD_GOODS  '
               +' where   a.CD_HEAD   = :P0 '
               +'   and   a.YMD_ORDER = :P1 '
               +' order by a.YMD_ORDER, a.NO_ORDER, a.SEQ',
                [HeadStoreCode,
                 vDate]);
      GridSubDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, GridSubDBTableView, SubMemData);
      GridSubDBTableView.DataController.DataSource := SubDataSource;
    end;
  finally
    FinishQuery;
  end;
end;

//------------------------------------------------------------------------------
// 매입 그리드 다른 레코드를 선택할 때
procedure TOrderModifyForm.GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  try
    ButtonToolBarDeleteButton.Enabled := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index] = 'O';
    ButtonToolBarSaveButton.Enabled   := ButtonToolBarDeleteButton.Enabled;
  except
  end;
end;

procedure TOrderModifyForm.GridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TOrderModifyForm.DoSearch:Boolean;
begin
//  inherited;
  GridDBTableView.DataController.RecordCount    := 0;
  GridSubDBTableView.DataController.RecordCount := 0;
  isLoading := true;

  try
    // 날짜목록 쿼리를 열어 그리드에 보여준다
    OpenQuery('select StoDW(YMD_ORDER) as YMD_ORDER, YMD_ORDER as YMD_ORDER1 '
             +'  from OL_ORDER_H '
             +' where CD_HEAD  =:P0 '
             +'   and YMD_ORDER  between :P1 and :P2 '
             +Ifthen(Tag=0, Format('and CD_STORE = ''%s'' ',[StoreCode]),'')
             +' group by YMD_ORDER '
             +' order by YMD_ORDER ',
              [HeadStoreCode,
               DtoS(ConditionToolBarFromDateEdit.CurrentDate),
               DtoS(ConditionToolBarToDateEdit.CurrentDate)]);
    Result := DM.ReadQuery(Query, ListGridTableView);
  finally
    FinishQuery;
    isLoading := false;
  end;

  if ListGridTableView.DataController.RecordCount > 0 then
  begin
    ListGrid.SetFocus;
    ListGridTableView.DataController.FocusedRecordIndex := 0;
  end;
end;

end.
