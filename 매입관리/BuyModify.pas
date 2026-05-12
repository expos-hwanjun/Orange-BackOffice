// 매입 정정 (완료)

//##### 매입수정 버튼 시 매입창 띄우는 부분 수정...

unit BuyModify;



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
  cxDateUtils, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TBuyModifyForm = class(TInheritShow2Form)
    ListGrid: TcxGrid;
    ListGridTableView: TcxGridTableView;
    ListGridTableViewBuyDate: TcxGridColumn;
    ListGridLevel: TcxGridLevel;
    GridSplitter: TAdvSplitter;
    GridDBTableViewBuyNo: TcxGridDBColumn;
    GridDBTableViewCompanyName: TcxGridDBColumn;
    GridDBTableViewNetAmt: TcxGridDBColumn;
    GridDBTableViewVatAmt: TcxGridDBColumn;
    GridDBTableViewBuyAmt: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubDBTableViewBuyQty: TcxGridDBColumn;
    GridSubDBTableViewBuyPrice: TcxGridDBColumn;
    GridSubDBTableViewBuyAmt: TcxGridDBColumn;
    GridDBTableViewRemark: TcxGridDBColumn;
    GridDBTableViewCashAmt: TcxGridDBColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarSeparator3: TAdvToolBarSeparator;
    GridDBTableViewBuyDate: TcxGridDBColumn;
    GridDBTableViewUserName: TcxGridDBColumn;
    GridDBTableViewStatus: TcxGridDBColumn;
    ImageList1: TImageList;
    GridSubDBTableViewSeq: TcxGridDBColumn;
    ButtonToolBarCancelButton: TAdvGlowButton;
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
    ListGridTableViewYmdBuy: TcxGridColumn;
    GridSubDBTableViewNetAmt: TcxGridDBColumn;
    GridSubDBTableViewTaxAmt: TcxGridDBColumn;
    GridDBTableViewDsBuy: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
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
  BuyModifyForm: TBuyModifyForm;



implementation

uses
  Common, DBModule, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyModifyForm.FormActivate(Sender: TObject);
var vIndex, vIndex1 :Integer;
begin
  inherited;
  //매입등록에서 수정 후에 액티브 됐을때
  if FormParam[0] = 'BuyBuy' then
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

procedure TBuyModifyForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmExcel;
  DefaultDate := ddToday;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TBuyModifyForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
procedure TBuyModifyForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TBuyModifyForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if AskBox('잠금을 해제하시겠습니까?') then
  begin
    ExecQuery('update SL_BUY_H '
             +'   set DS_STATUS =''B'' '
             +' where CD_HEAD =:P0 '
             +'   and CD_STORE=:P1 '
             +'   and YMD_BUY =:P2 '
             +'   and NO_BUY  =:P3;',
              [HeadStoreCode,
               StoreCode,
               GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyDate.Index]),
               GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyNo.Index]],
               true);
    GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index] := 'B';
    ButtonToolBarDeleteButton.Enabled := True;
    ButtonToolBarSaveButton.Enabled   := ButtonToolBarDeleteButton.Enabled;
    ButtonToolBarCancelButton.Enabled := false;
  end;
end;

procedure TBuyModifyForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var
  vBuyDate, vBuySeq, vAcctKey: string;
begin
  if not ButtonToolBarDeleteButton.Visible or not ButtonToolBarDeleteButton.Enabled then
    Exit;

  if Copy(HelpKeyword,4,1) = '0' then
  begin
    MsgBox('삭제 권한이 없습니다');
    Exit;
  end;
  inherited;

  if not CheckSurvey('') then
  begin
    ErrBox('실사 내역이 있어 매입 자료를 삭제할 수 없습니다');
    Exit;
  end;

  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('삭제할 매입 자료를 선택하십시오.');
    Exit;
  end;

  vBuyDate := GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyDate.Index]);
  vBuySeq  := String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyNo.Index]);

  if CheckMonthClose('S',vBuyDate) then
    Exit;

  DM.OpenQuery('select   Count(*) '
              +'  from   SL_BUY_D  '
              +' where   CD_HEAD   =:P0 '
              +'   and   CD_STORE  =:P1 '
              +'   and   YMD_BUY   =:P2 '
              +'   and   NO_BUY    =:P3 '
              +'   and   CD_GOODS in (select CD_GOODS '
              +'                        from SL_SILSA '
              +'                       where CD_HEAD   =:P0 '
              +'                         and CD_STORE  =:P1 '
              +'                         and YM_SILSA  =Left(:P2,6) '
              +'                         and YMD_SILSA >=:P2) ',
            [HeadStoreCode,
             StoreCode,
             vBuyDate,
             vBuySeq]);
  try
    if DM.Query.Fields[0].AsInteger > 0 then
    begin
      ErrBox('삭제할려는 매입일자 이후에 실사내역이 있어'#13'매입전표를 삭제할 수 없습니다');
      Exit;
    end;
  finally
    DM.FinishQuery;
  end;

  if not AskBox(vBuySeq+'전표 매입 자료를 삭제하시겠습니까?') then
    Exit;

  // 삭제한다
  try
    // 현금 결제 시 연결된 출납전표를 확인한다
    OpenQuery('select NO_ACCT_REF '
             +'  from SL_BUY_H '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_BUY  =:P2 '
             +'   and NO_BUY   =:P3',
              [HeadStoreCode,
               StoreCode,
               vBuyDate,
               vBuySeq]);
    try
      if not Query.Eof then
        vAcctKey := Query.Fields[0].AsString
      else
        vAcctKey := '';
    finally
      FinishQuery;
    end;

    // 매입 디테일 테이블을 삭제한다
    ExecQuery('delete from SL_BUY_D '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_BUY  =:P2 '
             +'   and NO_BUY   =:P3;',
              [HeadStoreCode,
               StoreCode,
               vBuyDate,
               vBuySeq],
               false);

    // 매입 마스터 테이블을 삭제한다
    ExecQuery('delete from SL_BUY_H '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YMD_BUY  = :P2 '
             +'   and NO_BUY   = :P3;',
              [HeadStoreCode,
               StoreCode,
               vBuyDate,
               vBuySeq],
               false);
    // 현금일 때는 입출금 계정 테이블을 삭제한다
    if Length(vAcctKey) = 13 then
      ExecQuery('delete from SL_ACCT '
               +' where CD_HEAD   = :P0 '
               +'   and CD_STORE  = :P1 '
               +'   and YMD_OCCUR = :P2 '
               +'   and NO_POS    = :P3 '
               +'   and NO_ACCT   = :P4;',
                [HeadStoreCode,
                 StoreCode,
                 Copy(vAcctKey,  1, 8),
                 Copy(vAcctKey,  9, 2),
                 Copy(vAcctKey, 11, 3)],
                 false);
    if ExecQuery('', [], true) then
    begin
    // 선택된 레코드를 삭제한다
      GridDBTableView.DataController.DeleteFocused;
      ShowMsg('매입 자료를 삭제했습니다.');
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;
procedure TBuyModifyForm.ButtonToolBarPrintButtonPopupMenuPrintClick(
  Sender: TObject);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 수정 버튼
procedure TBuyModifyForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vTemp :String;
begin
  vTemp := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewDsBuy.Index];
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;
  if Copy(HelpKeyword,3,1) = '0' then
  begin
    MsgBox('수정 권한이 없습니다');
    Exit;
  end;

  inherited;

  // 현재 선택된 줄이 있는지 확인한다
  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
  begin
    ErrBox('수정할 매입 자료를 선택하십시오.');
    Exit;
  end;


  //#####
  FormParam[0] := LeftStr(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyDate.Index],10)+
                  GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyNo.Index];
  ExtremeMainForm.RunProgram('BuyBuy');

end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 날짜목록 그리드 다른 레코드를 선택할 때
procedure TBuyModifyForm.ListGridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vDate: string;
begin
  inherited;

  if isLoading then Exit;

  try
    // 선택한 날짜에 해당하는 자료들만 매입 그리드에서 필터링해서 보여준다
    if ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewBuyDate.Index] <> null then
      vDate := ListGridTableView.DataController.Values[ListGridTableView.DataController.FocusedRecordIndex, ListGridTableViewYmdBuy.Index];


    // 매입 마스터 쿼리를 열어 그리드에 보여준다
    OpenQuery('select   a.NO_BUY, '
             +'         case Ifnull(a.DS_BUY, ''B'') when ''B'' then ''매입'' when ''R'' then ''반품'' end as DS_BUY, '
             +'         case when Ifnull(d.YN_CLOSE,''N'') = ''Y'' then ''M'' else a.DS_STATUS end as DS_STATUS, '
             +'         b.NM_TRDPL, '
             +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
             +'         a.AMT_TAX, '
             +'         a.AMT_BUY , '
             +'         a.AMT_CASH, '
             +'         c.NM_SAWON as NM_SAWON_INSERT, '
             +'         a.REMARK, '
             +'         a.DT_INSERT, '
             +'         a.DT_CHANGE, '
             +'         e.NM_SAWON as NM_SAWON_CHG, '
             +'         StoD(a.YMD_BUY) as YMD_BUY, '
             +'         ConCat(a.YMD_BUY,a.NO_BUY) as LINK, '
             +'         ConCat(b.NM_TRDPL,Cast(a.AMT_BUY as Char)) as COMPARE '
             +'  from   SL_BUY_H as a left outer join '
             +'         MS_TRD   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_TRDPL = b.CD_TRDPL left outer join '
             +'         MS_SAWON as c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_SAWON_INSERT = c.CD_SAWON left outer join '
             +'         (select YM_STOCK, YN_CLOSE '
             +'            from SL_STOCK_MONTH '
             +'           where CD_HEAD  =:P0 '
             +'             and CD_STORE =:P1 '
             +'             and YM_STOCK = Left(:P2,6) '
             +'           group by YM_STOCK, YN_CLOSE) as d on Left(a.YMD_BUY,6) = d.YM_STOCK left outer join '
             +'         MS_SAWON as e on a.CD_HEAD = e.CD_HEAD and a.CD_STORE = e.CD_STORE and a.CD_SAWON_CHG = e.CD_SAWON '
             +' where   a.CD_HEAD  =:P0 '
             +'   and   a.CD_STORE =:P1 '
             +'   and   a.YMD_BUY  =:P2 '
             +' order by a.CD_STORE, a.YMD_BUY, a.NO_BUY',
              [HeadStoreCode,
               StoreCode,
               vDate]);
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
               +'         b.NM_MENU as NM_GOODS, '
               +'         b.NM_SPEC, '
               +'         a.QTY_BUY, '
               +'         a.PR_BUY, '
               +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
               +'         a.AMT_TAX, '
               +'         a.AMT_BUY, '
               +'         ConCat(a.YMD_BUY,a.NO_BUY) as LINK '
               +'  from   SL_BUY_D as a left outer join '
               +'         MS_MENU  as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_MENU  '
               +' where   a.CD_HEAD  = :P0 '
               +'   and   a.CD_STORE = :P1 '
               +'   and   a.YMD_BUY  = :P2 '
               +' order by a.YMD_BUY, a.NO_BUY, a.SEQ',
                [HeadStoreCode,
                 StoreCode,
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
procedure TBuyModifyForm.GridDBTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;

  try
    ButtonToolBarCancelButton.Enabled := GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index] = 'L';
    ButtonToolBarDeleteButton.Enabled := (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewBuyNo.Index] <> null) and (NVL(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index],'B') = 'B');
    ButtonToolBarSaveButton.Enabled   := ButtonToolBarDeleteButton.Enabled;
  except
  end;
end;

procedure TBuyModifyForm.GridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  function GetFilteredSort:Boolean;
  var vIndex :Integer;
  begin
    result := false;
    for vIndex := 0 to GridDBTableView.ColumnCount-1 do
    begin
      if (GridDBTableView.Columns[vIndex].Filtered) or (GridDBTableView.Columns[vIndex].SortIndex >= 0) then
      begin
        result := true;
        Break;
      end;
    end;
  end;
begin
  inherited;
  if GridDBTableView.DataController.RecordCount = 0 then Exit;

  if not GetFilteredSort and (ARecord <> nil) and (AItem <> nil) and
     (GridDBTableView.DataController.RecordCount > 0) and (ARecord.Index >= 0) and
     (ARecord.Values[GridDBTableViewCompare.Index] <> null) and
     (GridDBTableView.DataController.FindRecordIndexByText(Ifthen(ARecord.Index = GridDBTableView.DataController.RecordCount-1, 0, ARecord.Index+1), GridDBTableViewCompare.Index, ARecord.Values[GridDBTableViewCompare.Index], false, true, true) <> ARecord.Index) then
    AStyle := StyleFontRed;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TBuyModifyForm.DoSearch:Boolean;
begin
//  inherited;
  GridDBTableView.DataController.RecordCount    := 0;
  GridSubDBTableView.DataController.RecordCount := 0;
  isLoading := true;

  try
    // 날짜목록 쿼리를 열어 그리드에 보여준다
    OpenQuery('select StoDW(YMD_BUY) as YMD_BUY, YMD_BUY as YMD_BUY1 '
             +'  from SL_BUY_H '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_BUY  between :P2 and :P3 '
             +' group by CD_STORE, YMD_BUY '
             +' order by YMD_BUY ',
              [HeadStoreCode,
               StoreCode,
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
