unit CornerCommissionShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, StdCtrls, CheckLst, ExtCtrls,
  AdvPanel, cxButtonEdit, cxGridCustomTableView, cxGridTableView, AdvToolBar,
  AdvToolBarStylers, cxContainer, Uni, DB, MemDS, ImgList, Menus,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils,
  cxGridBandedTableView, cxMemo, Math, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCornerCommissionShowForm = class(TInheritShowForm)
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1DsType: TcxGridColumn;
    GridTableView1SaleAmt: TcxGridColumn;
    GridTableView1SaleFeeAmt: TcxGridColumn;
    GridTableView1PointOccur: TcxGridColumn;
    GridTableView1PayAmt: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView2: TcxGridTableView;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableView1Remain: TcxGridColumn;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView1Column2: TcxGridBandedColumn;
    GridBandedTableView1Column3: TcxGridBandedColumn;
    GridBandedTableView1Column4: TcxGridBandedColumn;
    GridBandedTableView1Column5: TcxGridBandedColumn;
    GridBandedTableView1Column6: TcxGridBandedColumn;
    GridBandedTableView1Column7: TcxGridBandedColumn;
    GridBandedTableView1Column8: TcxGridBandedColumn;
    GridBandedTableView1Column9: TcxGridBandedColumn;
    GridBandedTableView1Column10: TcxGridBandedColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableView1CardVanAmt: TcxGridColumn;
    GridTableView1TotAmt: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    ButtonToolBarPayButton: TAdvGlowButton;
    PayPanel: TPanel;
    ReceiveEmpLabel: TLabel;
    ReceiveCommentLabel: TLabel;
    ReceivePasswordLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PayOKButton: TAdvGlowButton;
    PayCancelButton: TAdvGlowButton;
    PayCommentMemo: TcxMemo;
    RemainAmtEdit: TcxCurrencyEdit;
    PayDateEdit: TcxDateEdit;
    PayAmtEdit: TcxCurrencyEdit;
    DcAmtEdit: TcxCurrencyEdit;
    TotalAmtEdit: TcxCurrencyEdit;
    BalanceAmtEdit: TcxCurrencyEdit;
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormShow(Sender: TObject);
    procedure GridResize(Sender: TObject);
    procedure PayCancelButtonClick(Sender: TObject);
    procedure PayOKButtonClick(Sender: TObject);
    procedure ButtonToolBarPayButtonClick(Sender: TObject);
    procedure PayAmtEditPropertiesChange(Sender: TObject);
    procedure DcAmtEditPropertiesChange(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    LastDate,
    FromDate,
    ToDate   :String;
    isAuto   :Boolean;
    procedure SetLastDate;
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  CornerCommissionShowForm: TCornerCommissionShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCornerCommissionShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/코너관리/코너%20미지급금%20잔액조회/코너%20미지급금%20잔액조회.htm';
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
  isAuto      := false;
end;

procedure TCornerCommissionShowForm.DcAmtEditPropertiesChange(Sender: TObject);
begin
  inherited;
  TotalAmtEdit.Value   := DcAmtEdit.Value + PayAmtEdit.Value;
  BalanceAmtEdit.Value := RemainAmtEdit.Value - TotalAmtEdit.Value;
end;

function TCornerCommissionShowForm.DoSearch:Boolean;
const
  msgBook = ' 미지급 원장';
var
  vIndex    : Integer;
  vRemainAmt: Currency;
begin
  Result := false;
  if Grid.ActiveLevel = GridLevel then
  begin
    //수수료 재계산 최종일자가 조회일자보다 작을때는 자동으로 계산해준다
    if DtoS(ConditionToolBarToDateEdit.Date) >= LastDate then
    begin
      isAuto := true;
      ButtonToolBarSaveButtonClick(nil);
      isAuto := false;
    end;

    OpenQuery('select t1.CD_TRDPL, '
             +'       Max(t1.NM_TRDPL) as NM_TRDPL, '
             +'       Ifnull(t2.AMT_CARRYOVER,0) as AMT_CARRYOVER, '
             +'       SUM(Ifnull(t3.AMT_SALE,0)) as AMT_SALE, '
             +'       SUM(Ifnull(t3.AMT_CARD_VAN,0)) as AMT_CARD_VAN, '
             +'       SUM(Ifnull(t3.AMT_SALE_FEE,0) + Ifnull(t3.AMT_CASH_FEE,0) + Ifnull(t3.AMT_CASHRCP_FEE,0) + Ifnull(t3.AMT_CARD_FEE,0)) as AMT_SALE_FEE, '
             +'       SUM(Ifnull(t3.AMT_POINT_OCCUR_FEE,0)) as AMT_POINT_OCCUR_FEE, '
             +'       SUM(Ifnull(t3.AMT_SALE,0)) - '
             +'       SUM(Ifnull(t3.AMT_SALE_FEE,0) + Ifnull(t3.AMT_CASH_FEE,0) + Ifnull(t3.AMT_CASHRCP_FEE,0) + Ifnull(t3.AMT_CARD_FEE,0)) - '
             +'       SUM(Ifnull(t3.AMT_CARD_VAN,0)) - '
             +'       SUM(Ifnull(t3.AMT_POINT_OCCUR_FEE,0)) as AMT_TOT_FEE, '
             +'       Ifnull(t4.AMT_OUT,0) as AMT_PAY, '
             +'       Ifnull(t2.AMT_CARRYOVER,0) + '
             +'       SUM(Ifnull(t3.AMT_SALE,0)) - '
             +'       SUM(Ifnull(t3.AMT_CARD_VAN,0)) - '
             +'       SUM(Ifnull(t3.AMT_SALE_FEE,0) + Ifnull(t3.AMT_CASH_FEE,0) + Ifnull(t3.AMT_CASHRCP_FEE,0) + Ifnull(t3.AMT_CARD_FEE,0)) - '
             +'       SUM(Ifnull(t3.AMT_POINT_OCCUR_FEE,0)) + '
             +'       Ifnull(t4.AMT_OUT,0) as AMT_REMAIN, '
             +'       Sum(Ifnull(t3.AMT_CARD,0) - Ifnull(t3.AMT_CARD_VAN,0)) as AMT_CARD_MART '
             +'  from MS_TRD t1 left outer join '
             +'       (select a.CD_TRDPL, '
             +'               SUM(a.AMT_SALE-a.AMT_PAY) as AMT_CARRYOVER  '
             +'          from '
             +'             ( '
             +'              select CD_TRDPL, '
             +'                     SUM(AMT_SALE-AMT_SALE_FEE - AMT_CASH_FEE - AMT_CASHRCP_FEE - AMT_CARD_FEE -AMT_POINT_OCCUR_FEE+AMT_CARD_VAN) AS AMT_SALE, '
             +'                     0 AS AMT_PAY '
             +'                from SL_TRD_DAY '
             +'               where CD_HEAD  =:P0 '
             +'                 and CD_STORE =:P1 '
             +'                 and YMD_SALE < :P2 '
             +'               group by CD_TRDPL '
             +'              union all '
             +'              select CD_TRDPL, '
             +'                     0, '
             +'                     SUM(AMT_OUT) '
             +'                from SL_ACCT '
             +'               where CD_HEAD  =:P0 '
             +'                 and CD_STORE =:P1 '
             +'                 and YMD_OCCUR < :P2 '
             +'                 and CD_TRDPL <> '''' '
             +'               group by CD_TRDPL '
             +'              ) a '
             +'       group by CD_TRDPL  '
             +'   ) t2 on t1.CD_TRDPL = t2.CD_TRDPL left outer join  '
             +'   SL_TRD_DAY t3 on t1.CD_HEAD = t3.CD_HEAD and t1.CD_STORE = t3.CD_STORE and t1.CD_TRDPL = t3.CD_TRDPL and t3.YMD_SALE between :P2 and :P3 left outer join'
             +'   (select   CD_TRDPL, '
             +'             Sum(AMT_OUT+AMT_DC) as AMT_OUT '
             +'      from   SL_ACCT '
             +'     where   CD_HEAD  =:P0 '
             +'       and   CD_STORE =:P1 '
             +'       and   YMD_OCCUR between :P2 and :P3 '
             +'    group by CD_TRDPL) as t4 on t1.CD_TRDPL = t4.CD_TRDPL '
             +' where t1.CD_HEAD  = :P0 '
             +'   AND t1.CD_STORE = :P1 '
             +'   and t1.DS_TRDPL = ''C'' '
             +'group by t1.CD_TRDPL, t2.AMT_CARRYOVER, t4.AMT_OUT ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
      DM.ReadQuery(Query, GridTableView);

      // 수수료 재계산 버튼을 활성화 한다
      ButtonToolBarSaveButton.Enabled := GridTableView.DataController.RecordCount > 0;
      Result := GridTableView.DataController.RecordCount > 0;
  end
  else
  begin
    // 조회
    if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
    begin
      GridLevel1.Caption := ' '''+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyName.Index]+''''+msgBook;

      OpenQuery('select '''' as YMD_OCCUR, '
               +'       0  as SEQ, '
               +'       ''이월'' as DS_TYPE, '
               +'       0 as AMT_SALE, '
               +'       0 as AMT_CARD_VAN, '
               +'       0 as AMT_SALE_FEE, '
               +'       0 as AMT_POINT_OCCUR_FEE, '
               +'       0 as AMT_TOT, '
               +'       0 as AMT_PAY, '
               +'       Ifnull(SUM(AMT_SALE - AMT_PAY),0) as AMT_REMAIN, '
               +'       '''' as REMARK, '
               +'       0 as AMT_CARD_MART '
               +'  from '
               +'       ( '
               +'         select CD_TRDPL, '
               +'                SUM(AMT_SALE-AMT_CARD_VAN-AMT_SALE_FEE - AMT_CASH_FEE - AMT_CASHRCP_FEE - AMT_CARD_FEE -AMT_POINT_OCCUR_FEE) AS AMT_SALE, '
               +'                0 AS AMT_PAY '
               +'           from SL_TRD_DAY '
               +'          where CD_HEAD  = :P0 '
               +'            and CD_STORE = :P1 '
               +'            and YMD_SALE < :P2 '
               +'            and CD_TRDPL = :P4  '
               +'          group by CD_TRDPL '
               +'          union all '
               +'         select CD_TRDPL, '
               +'                0, '
               +'                SUM(AMT_OUT) '
               +'           from SL_ACCT '
               +'          where CD_HEAD  = :P0 '
               +'            and CD_STORE = :P1 '
               +'            and YMD_OCCUR < :P2 '
               +'            and CD_TRDPL = :P3 '
               +'          group by CD_TRDPL '
               +'       ) a '
               +'union all  '
               +'select StoDW(YMD_SALE), '
               +'       1, '
               +'       ''판매'', '
               +'       Ifnull(AMT_SALE,0), '
               +'       Ifnull(AMT_CARD_VAN,0), '
               +'       Ifnull(AMT_SALE_FEE + AMT_CASH_FEE + AMT_CASHRCP_FEE + AMT_CARD_FEE, 0), '
               +'       Ifnull(AMT_POINT_OCCUR_FEE,0), '
               +'       Ifnull(AMT_SALE,0)-Ifnull(AMT_CARD_VAN,0)-Ifnull(AMT_SALE_FEE + AMT_CASH_FEE + AMT_CASHRCP_FEE + AMT_CARD_FEE ,0)-Ifnull(AMT_POINT_OCCUR_FEE,0), '
               +'       0, '
               +'       0, '
               +'       '''',  '
               +'       Ifnull(AMT_CARD,0) - Ifnull(AMT_CARD_VAN,0) '
               +'  from SL_TRD_DAY '
               +' where CD_HEAD  = :P0 '
               +'   and CD_STORE = :P1 '
               +'   and CD_TRDPL = :P4 '
               +'   and YMD_SALE between :P2 and :P3 '
               +'union all '
               +'select StoDW(YMD_OCCUR), '
               +'       2, '
               +'       ''지급'', '
               +'       0, '
               +'       0, '
               +'       0, '
               +'       0, '
               +'       0, '
               +'       Ifnull(AMT_OUT+AMT_DC,0), '
               +'       0, '
               +'       REMARK, '
               +'       0 '
               +'  from SL_ACCT '
               +' where CD_HEAD  = :P0 '
               +'   and CD_STORE = :P1 '
               +'   and CD_TRDPL = :P4 '
               +'   and YMD_OCCUR between :P2 and :P3 '
               +'order by YMD_OCCUR, SEQ ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyCode.Index]]);
      DM.ReadQuery(Query, GridTableView1);
      // 미지급잔액을 계산해서 그리드에 넣어준다
      vRemainAmt := 0;
      for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
      begin
        vRemainAmt := Currency(vRemainAmt)
                    + Ifthen(vIndex=0,Nvl(Currency(GridTableView1.DataController.Values[vIndex, GridTableView1Remain.Index]),0.0),0)
                    + Nvl(Currency(GridTableView1.DataController.Values[vIndex, GridTableView1TotAmt.Index]), 0.0)
                    - Nvl(Currency(GridTableView1.DataController.Values[vIndex, GridTableView1PayAmt.Index]), 0.0);
        GridTableView1.DataController.Values[vIndex, GridTableView1Remain.Index] := vRemainAmt;
      end;
    end;
  end;
end;




//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TCornerCommissionShowForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // 단축키 처리를 한다
  case Key of
    VK_F5 : ButtonToolBarSaveButton.Click;
    VK_F7 : ButtonToolBarPayButton.Click;
  end;
end;

procedure TCornerCommissionShowForm.FormShow(Sender: TObject);
begin
  inherited;
  SetLastDate;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 선택 레코드를 변경할 때
procedure TCornerCommissionShowForm.GridActiveTabChanged(
  Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel1 then
  begin
    ButtonToolBarPayButton.Enabled := false;
    if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;
    if GridTableView.DataController.RecordCount <= 0 then
    begin
      GridLevel1.Caption := '코너별 원장  ';
      GridTableView1.DataController.RecordCount := 0;
      Exit;
    end;
    GridLevel1.Caption := '['+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyName.Index ] + '] 일자별 매출조회 ';
    DoSearch;
  end
  else
  begin
    GridLevel1.Caption := ' 코너별 원장  ';
    ButtonToolBarPayButton.Enabled := GridTableView.DataController.GetFocusedRecordIndex >= 0;
  end;
end;

procedure TCornerCommissionShowForm.GridResize(Sender: TObject);
begin
  inherited;
  PayPanel.Top  := (Grid.Height - PayPanel.Height) div 2 + Grid.Top;
  PayPanel.Left := (Grid.Width  - PayPanel.Width ) div 2 + Grid.Left;
end;

procedure TCornerCommissionShowForm.GridTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridTableView1.DataController.RecordCount = 0 then Exit;

  if (AItem <> nil) and (AItem.Index = GridTableView1DsType.Index) and (ARecord.Values[GridTableView1DsType.Index] = '지급') then
     AStyle := StyleFontRed;
end;

procedure TCornerCommissionShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;
  if GridTableView.DataController.RecordCount <= 0 then
  begin
    GridLevel1.Caption := ' 코너별 원장  ';
    GridTableView1.DataController.RecordCount := 0;
    Exit;
  end;

  Grid.ActiveLevel := GridLevel1;
  GridLevel1.Caption := '['+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyName.Index ] + '] 일자별 매출조회 ';
  DoSearch;
end;

procedure TCornerCommissionShowForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarPayButton.Enabled := (AFocusedRecord <> nil) and GridLevel.Active;
end;

procedure TCornerCommissionShowForm.PayAmtEditPropertiesChange(Sender: TObject);
begin
  inherited;
  TotalAmtEdit.Value   := DcAmtEdit.Value + PayAmtEdit.Value;
  BalanceAmtEdit.Value := RemainAmtEdit.Value - TotalAmtEdit.Value;
end;

procedure TCornerCommissionShowForm.PayCancelButtonClick(Sender: TObject);
begin
  inherited;
  PayPanel.Visible         := false;
  Grid.Enabled             := true;
  ToolBarDockPanel.Enabled := true;
end;

procedure TCornerCommissionShowForm.PayOKButtonClick(Sender: TObject);
begin
  inherited;
  if TotalAmtEdit.Value = 0 then
  begin
    ErrBox('지급금액을 입력하세요');
    Exit;
  end;

  // 월마감여부 체크
  if CheckMonthClose('M',DtoS(PayDateEdit.Date)) then
    Exit;

  try
    ExecQuery('insert into SL_ACCT (CD_HEAD, '
             +'                     CD_STORE, '
             +'                     YMD_OCCUR, '
             +'                     NO_POS, '
             +'                     NO_ACCT, '
             +'                     DS_ACCT, '
             +'                     CD_ACCT, '     //3
             +'                     AMT_OUT, '     //4
             +'                     AMT_DC, '      //5
             +'                     CD_TRDPL, '    //6
             +'                     REMARK, '
             +'                     DT_CHANGE, '
             +'                     CD_SAWON_CHG, '
             +'                     AMT_REMAIN, '
             +'                     DT_INSERT) '
             +'              values(:P0, '
             +'                     :P1, '
             +'                     :P2, '
             +'                     ''00'', '
             +'                     (select LPad(Ifnull(Max(NO_ACCT),0)+1,3,''0'') '
             +'                       from SL_ACCT as s '
             +'                      where CD_HEAD   = :P0 '
             +'                        and CD_STORE  = :P1 '
             +'                        and YMD_OCCUR = :P2 '
             +'                        and NO_POS    = ''00'') , '
             +'                     ''0'', '
             +'                     :P3, '
             +'                     :P4, '
             +'                     :P5, '
             +'                     :P6, '
             +'                     :P7, '
             +'                     Now(), '
             +'                     :P8, '
             +'                     :P9, '
             +'                     Now()); ',
             [HeadStoreCode,
              StoreCode,
              DtoS(PayDateEdit.Date),
              CreditOut,
              PayAmtEdit.Value,
              DcAmtEdit.Value,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyCode.Index],
              PayCommentMemo.Text,
              UserCode,
              RemainAmtEdit.Value], true);

    DoSearch;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
  PayPanel.Visible         := false;
  Grid.Enabled             := true;
  ToolBarDockPanel.Enabled := true;
end;

procedure TCornerCommissionShowForm.SetLastDate;
begin
  LastDate := EmptyStr;
  try
    OpenQuery('select StoDW(YMD_SALE) '
             +'  from SL_TRD_DAY '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'  order by YMD_SALE desc '
             +' limit 1 ',
             [HeadStoreCode,
              StoreCode]);
    if not Query.Eof then
    begin
      ConditionToolBarEditLabel.Caption := ' ※ 수수료 재계산 최종일자 : '+Query.Fields[0].AsString;
      LastDate := Query.Fields[0].AsString;
    end
    else
      ConditionToolBarEditLabel.Caption := ' ※ 수수료 재계산 최종일자 : 없음 ';
  finally
    FinishQuery;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 수수료 재계산 버튼
procedure TCornerCommissionShowForm.ButtonToolBarPayButtonClick(Sender: TObject);
begin
  inherited;
  PayPanel.Visible         := true;
  Grid.Enabled             := false;
  ToolBarDockPanel.Enabled := false;

  PayDateEdit.Date     := now;
  RemainAmtEdit.Value  := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewColumn8.Index];
  BalanceAmtEdit.Value := RemainAmtEdit.Value;
  PayAmtEdit.Value     := 0;
  DcAmtEdit.Value      := 0;
  PayCommentMemo.Clear;
  PayAmtEdit.SetFocus;
end;

procedure TCornerCommissionShowForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vRentTrd :String;
    vIndex   :Integer;
begin
  inherited;
 if (Sender <> nil) and (GridTableView.DataController.RecordCount = 0) then
    Exit;

  inherited;

  if isAuto then
  begin
    FromDate := LastDate;
    ToDate   := DtoS(ConditionToolBarToDateEdit.Date);
  end
  else
  begin
    FromDate := DtoS(ConditionToolBarFromDateEdit.Date);
    ToDate   := DtoS(ConditionToolBarToDateEdit.Date);
  end;

  if (Sender = nil) or (AskBox('코너 수수료가 현재 수수료율로 재계산됩니다.'#13'수수료를 재계산하시겠습니까?')) then
  begin
    ShowMsg('수수료를 재계산 중입니다...');

    if Sender = nil then
    begin
      try
        OpenQuery('select CD_TRDPL '
                 +'  from MS_TRD '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and DS_TRDPL = ''C'' ',
                 [HeadStoreCode,
                  StoreCode]);
        while not Query.Eof do
        begin
          vRentTrd := vRentTrd + IfThen(vRentTrd = EmptyStr, EmptyStr, ', ') + ''''+Query.Fields[0].AsString +'''';
          Query.Next;
        end;
      finally
        FinishQuery;
      end;
      if vRentTrd = EmptyStr then Exit;
    end
    else
      for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
        vRentTrd := vRentTrd + IfThen(vRentTrd = EmptyStr, EmptyStr, ', ') + ''''+GridTableView.DataController.Values[vIndex, GridTableViewCompanyCode.Index] +'''';

    vRentTrd := '('+vRentTrd+')';

    try
      Screen.Cursor := crSQLWait;

      // 임시테이블 지우기
      ExecQuery('delete from TEMP_FEE '
               +' where CD_HEAD     =:P0 '
               +'   and CD_STORE    =:P1 '
               +'   and MAC_ADDRESS =:P2;',
               [HeadStoreCode,
                StoreCode,
                GetMacAddress],false);
      // 임시테이블 만들기 (임대업장별 판매금액 구하기)
      ExecQuery('insert into TEMP_FEE(CD_HEAD, '
               +'                     CD_STORE, '
               +'                     MAC_ADDRESS, '
               +'                     YMD_SALE, '
               +'                     NO_POS, '
               +'                     NO_RCP, '
               +'                     CD_TRDPL, '
               +'                     AMT_SALE, '
               +'                     RATE_FEE, '
               +'                     AMT_FEE, '
               +'                     POINT_OCCUR_AVAIL) '
               +' select  d.CD_HEAD, '
               +'         d.CD_STORE, '
               +'         :P4, '
               +'         d.YMD_SALE, '
               +'         d.NO_POS, '
               +'         d.NO_RCP, '
               +'         t.CD_TRDPL, '
               +'         Sum(case when g.CD_CORNER = t.CD_TRDPL then d.AMT_SALE-d.DC_TOT else 0 end) as AMT_SALE, '             // 임대 판매금액
               +'         Sum(case when g.CD_CORNER = t.CD_TRDPL then t.RATE_FEE else 0 end)  as RATE_FEE, '             // 임대 기본 수수료율
               +'         Sum(case when g.CD_CORNER = t.CD_TRDPL then Ceil((d.AMT_SALE - d.DC_TOT) * (t.RATE_FEE / 100)) else 0 end) as AMT_FEE, '  // 임대 기본 수수료
               +'         Sum(case when g.CD_CORNER = t.CD_TRDPL then case when g.YN_POINT = ''Y'' then d.AMT_SALE - d.DC_TOT else 0 end else 0 end) as POINT_OCCUR_AVAIL '  // 영수증 포인트 적립가능한 상품 판매액(업장별)
               +'  from   '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
               +'         MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU left outer join '
               +'         MS_TRD    as t on d.CD_HEAD = t.CD_HEAD and d.CD_STORE = t.CD_STORE and t.DS_TRDPL = ''C'' '
               +' where   d.CD_HEAD  =:P0 '
               +'   and   d.CD_STORE =:P1 '
               +'   and   d.YMD_SALE between :P2 and :P3 '
               +'   and   d.DS_SALE <> ''V'' '
               +' group by d.CD_HEAD, d.CD_STORE, d.YMD_SALE, d.NO_POS, d.NO_RCP, t.CD_TRDPL;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate,
                 GetMacAddress],
                 false);

      // 임시테이블에 임대업장 카드금액 업데이트
      ExecQuery('update  TEMP_FEE inner join '
               +'        (select   YMD_SALE, '
               +'                  NO_POS, '
               +'                  NO_RCP, '
               +'                  CD_CORNER, '
               +'                  Sum(case when DS_TRD = ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_APPROVAL '
               +'           from   '+GetPartitionTable('SL_CARD', StoD(FromDate), StoD(ToDate),'')
               +'          where   CD_HEAD  =:P0 '
               +'            and   CD_STORE =:P1 '
               +'            and   YMD_SALE between :P2 and :P3 '
               +'            and   CD_CORNER <> '''' '
               +'          group by YMD_SALE, NO_POS, NO_RCP, CD_CORNER) as a on TEMP_FEE.YMD_SALE  = a.YMD_SALE '
               +'                                                            and TEMP_FEE.NO_POS    = a.NO_POS '
               +'                                                            and TEMP_FEE.NO_RCP    = a.NO_RCP '
               +'                                                            and TEMP_FEE.CD_TRDPL  = a.CD_CORNER '
               +'   set  TEMP_FEE.AMT_CARD = a.AMT_APPROVAL '
               +' where  TEMP_FEE.CD_HEAD  =:P0 '
               +'   and  TEMP_FEE.CD_STORE =:P1 '
               +'   and  TEMP_FEE.MAC_ADDRESS =:P4;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate,
                 GetMacAddress],
                 false);

      // 임시테이블에 직영 카드금액 업데이트
      ExecQuery('update  TEMP_FEE inner join '
               +'        (select   YMD_SALE, '
               +'                  NO_POS, '
               +'                  NO_RCP, '
               +'                  CD_CORNER, '
               +'                  Sum(case when DS_TRD = ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_APPROVAL '
               +'           from   '+GetPartitionTable('SL_CARD', StoD(FromDate), StoD(ToDate),'')
               +'          where   CD_HEAD  =:P0 '
               +'            and   CD_STORE =:P1 '
               +'            and   YMD_SALE between :P2 and :P3 '
               +'            and   CD_CORNER = '''' '
               +'          group by YMD_SALE, NO_POS, NO_RCP, CD_CORNER) as a on TEMP_FEE.YMD_SALE  = a.YMD_SALE '
               +'                                                            and TEMP_FEE.NO_POS    = a.NO_POS '
               +'                                                            and TEMP_FEE.NO_RCP    = a.NO_RCP '
               +'                                                            and TEMP_FEE.CD_TRDPL  = a.CD_CORNER '
               +'   set  TEMP_FEE.AMT_CARD_MART = a.AMT_APPROVAL '
               +' where  TEMP_FEE.CD_HEAD  =:P0 '
               +'   and  TEMP_FEE.CD_STORE =:P1 '
               +'   and  TEMP_FEE.MAC_ADDRESS =:P4;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate,
                 GetMacAddress],
                 false);

      // 임시테이블에 임대업장 현금영수증금액 업데이트
      ExecQuery('update  TEMP_FEE inner join '
               +'        (select   YMD_SALE, '
               +'                  NO_POS, '
               +'                  NO_RCP, '
               +'                  CD_CORNER, '
               +'                  Sum(case when DS_TRD = ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_APPROVAL '
               +'           from   SL_CASH '
               +'          where   CD_HEAD  =:P0 '
               +'            and   CD_STORE =:P1 '
               +'            and   YMD_SALE between :P2 and :P3 '
               +'            and   CD_CORNER <> '''' '
               +'          group by YMD_SALE, NO_POS, NO_RCP, CD_CORNER) as a on TEMP_FEE.YMD_SALE  = a.YMD_SALE '
               +'                                                            and TEMP_FEE.NO_POS    = a.NO_POS '
               +'                                                            and TEMP_FEE.NO_RCP    = a.NO_RCP '
               +'                                                            and TEMP_FEE.CD_TRDPL  = a.CD_CORNER '
               +'   set  TEMP_FEE.AMT_CASHRCP = a.AMT_APPROVAL '
               +' where  TEMP_FEE.CD_HEAD  =:P0 '
               +'   and  TEMP_FEE.CD_STORE =:P1 '
               +'   and  TEMP_FEE.MAC_ADDRESS =:P4;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate,
                 GetMacAddress],
                 false);

      // 임시테이블에 직영 현금영수증금액 업데이트
      ExecQuery('update  TEMP_FEE inner join '
               +'        (select   YMD_SALE, '
               +'                  NO_POS, '
               +'                  NO_RCP, '
               +'                  CD_CORNER, '
               +'                  Sum(case when DS_TRD = ''A'' then AMT_APPROVAL else -AMT_APPROVAL end) as AMT_APPROVAL '
               +'           from   SL_CASH '
               +'          where   CD_HEAD  =:P0 '
               +'            and   CD_STORE =:P1 '
               +'            and   YMD_SALE between :P2 and :P3 '
               +'            and   CD_CORNER = '''' '
               +'          group by YMD_SALE, NO_POS, NO_RCP, CD_CORNER) as a on TEMP_FEE.YMD_SALE  = a.YMD_SALE '
               +'                                                            and TEMP_FEE.NO_POS    = a.NO_POS '
               +'                                                            and TEMP_FEE.NO_RCP    = a.NO_RCP '
               +'                                                            and TEMP_FEE.CD_TRDPL  = a.CD_CORNER '
               +'   set  TEMP_FEE.AMT_CASHRCP_MART = a.AMT_APPROVAL '
               +' where  TEMP_FEE.CD_HEAD  =:P0 '
               +'   and  TEMP_FEE.CD_STORE =:P1 '
               +'   and  TEMP_FEE.MAC_ADDRESS =:P4;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate,
                 GetMacAddress],
                 false);

      // 임시테이블에 직영 현금,수표,외상,상품권,OK캐쉬백 결제금액 업데이트
      ExecQuery('update  TEMP_FEE  inner join '
               +'        SL_SALE_H as h on TEMP_FEE.CD_HEAD  = h.CD_HEAD '
               +'                      and TEMP_FEE.CD_STORE = h.CD_STORE '
               +'                      and TEMP_FEE.YMD_SALE = h.YMD_SALE '
               +'                      and TEMP_FEE.NO_POS   = h.NO_POS '
               +'                      and TEMP_FEE.NO_RCP   = h.NO_RCP'
               +'   set  TEMP_FEE.AMT_SALE_TOT    = h.AMT_SALE, '
               +'        TEMP_FEE.AMT_CASH_TOT    = h.AMT_CASH + h.AMT_CHECK + h.AMT_GIFT + h.AMT_TRUST - h.AMT_CASHRCP + h.AMT_BANK + h.AMT_POINT, '
               +'        TEMP_FEE.POINT_OCCUR_TOT = h.PNT_OCCUR '
               +' where  TEMP_FEE.CD_HEAD  =:P0 '
               +'   and  TEMP_FEE.CD_STORE =:P1 '
               +'   and  TEMP_FEE.MAC_ADDRESS =:P2;',
                [HeadStoreCode,
                 StoreCode,
                 GetMacAddress],
                 false);

      // 임시테이블에 직영 판매금액 업데이트
      ExecQuery('update  TEMP_FEE inner join '
               +'        (select   d.YMD_SALE, '
               +'                  d.NO_POS, '
               +'                  d.NO_RCP, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'           from   '+GetPartitionTable('SL_SALE_D', StoD(FromDate), StoD(ToDate), 'd inner join')
               +'                  MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU inner join '
               +'                  MS_TRD    as t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_CORNER = t.CD_TRDPL and t.DS_TRDPL = ''C'' '
               +'          where   d.CD_HEAD  =:P0 '
               +'            and   d.CD_STORE =:P1 '
               +'            and   d.YMD_SALE between :P2 and :P3 '
               +'            and    d.DS_SALE <> ''V'' '
               +'         group by d.YMD_SALE, d.NO_POS, d.NO_RCP) as a on TEMP_FEE.YMD_SALE = a.YMD_SALE '
               +'                                                      and TEMP_FEE.NO_POS   = a.NO_POS '
               +'                                                      and TEMP_FEE.NO_RCP   = a.NO_RCP '
               +'   set  TEMP_FEE.AMT_SALE_MART = AMT_SALE_TOT - a.AMT_SALE '
               +' where  TEMP_FEE.CD_HEAD  =:P0 '
               +'   and  TEMP_FEE.CD_STORE =:P1 '
               +'   and  TEMP_FEE.MAC_ADDRESS =:P4;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate,
                 GetMacAddress],
                 false);
      // 임시테이블에서 수수료를 계산할 판매금액을 다시 구한다
      // 임대에서 카드,현금영수증 결제를 하지 않았으면 임대판매금액 기준, 결제를 했으면 수수료는 없다
      // 임대에서 카드,현금영수증 결제를 하지 않았으면 전체금액은 전체판매금액에서 다중결제된 내역을 뺀 나머지 금액이다
      // 수수료 기준 : 임대카드,현영이 없을 때는 임대판매금액
      // 총매출 기준 : 임대카드,현영이 없을 때는, 직영카드,현영이 직영매출보다 크면(직영으로 결제했다는 뜻이므로) 직영카드,현영금액, 직영카드,현영이 직영매출보다 작거나 같으면(다른 임대에서 대신 결제해줬다는 뜻이므로) 임대판매금액
      ExecQuery('update  TEMP_FEE '
               +'   set  AMT_FOR_FEE     = case when AMT_CARD + AMT_CASHRCP = 0 then AMT_SALE else 0 end, '
               +'        AMT_FOR_FEE_TOT = case when AMT_CARD + AMT_CASHRCP = 0 then '
               +'                                case when AMT_SALE_TOT = AMT_CARD_MART + AMT_CASHRCP_MART + AMT_CASH_TOT  then AMT_SALE_TOT '
               +'                                     when Abs(AMT_CARD_MART + AMT_CASHRCP_MART) > Abs(AMT_SALE_MART) then AMT_CARD_MART + AMT_CASHRCP_MART + AMT_CASH_TOT '
               +'                                     else AMT_SALE end '
               +'                                else 0 end '
               +' where  CD_HEAD  =:P0 '
               +'   and  CD_STORE =:P1 '
               +'   and  MAC_ADDRESS =:P2;',
                [HeadStoreCode,
                 StoreCode,
                 GetMacAddress],
                 false);
      // 임시테이블에서 임대업장 결제를 결제수단별로 분배한다
      ExecQuery('update TEMP_FEE '
               +'   set AMT_CARD_TRD    = AMT_SALE * (AMT_CARD_MART    / case when AMT_FOR_FEE_TOT = 0 then 1 else AMT_FOR_FEE_TOT end), '
               +'       AMT_CASHRCP_TRD = AMT_SALE * (AMT_CASHRCP_MART / case when AMT_FOR_FEE_TOT = 0 then 1 else AMT_FOR_FEE_TOT end), '
               +'       AMT_CASH_TRD    = AMT_SALE * (AMT_CASH_TOT     / case when AMT_FOR_FEE_TOT = 0 then 1 else AMT_FOR_FEE_TOT end)  '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and MAC_ADDRESS =:P2 '
               +'   and AMT_FOR_FEE_TOT <> 0;',
               [HeadStoreCode,
                StoreCode,
                GetMacAddress],
                false);
      // 포인트 적립 가능한 모든 상품 매출을 구한다
      ExecQuery('update  TEMP_FEE inner join '
               +'        (select   d.YMD_SALE, '
               +'                  d.NO_POS, '
               +'                  d.NO_RCP, '
               +'                  Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE '
               +'           from   '+GetPartitionTable('SL_SALE_D', StoD(FromDate), StoD(ToDate), 'd inner join')
               +'                  MS_MENU   as g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU and g.YN_POINT = ''Y'' '
               +'          where   d.CD_HEAD  =:P0 '
               +'            and   d.CD_STORE =:P1 '
               +'            and   d.YMD_SALE between :P2 and :P3 '
               +'           and    d.DS_SALE <> ''V'' '
               +'         group by d.YMD_SALE, d.NO_POS, d.NO_RCP) as a on TEMP_FEE.YMD_SALE = a.YMD_SALE '
               +'                                                      and TEMP_FEE.NO_POS   = a.NO_POS '
               +'                                                      and TEMP_FEE.NO_RCP   = a.NO_RCP '
               +'   set  TEMP_FEE.POINT_OCCUR_AVAIL_TOT = a.AMT_SALE '
               +' where  TEMP_FEE.CD_HEAD  =:P0 '
               +'   and  TEMP_FEE.CD_STORE =:P1 '
               +'   and  TEMP_FEE.MAC_ADDRESS =:P4;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate,
                 GetMacAddress],
                 false);

      // 임시테이블 결제수단별 수수료계산
      ExecQuery('update   TEMP_FEE inner join '
               +'         MS_TRD as t on TEMP_FEE.CD_HEAD = t.CD_HEAD and TEMP_FEE.CD_STORE = t.CD_STORE and TEMP_FEE.CD_TRDPL = t.CD_TRDPL '
               +'   set   TEMP_FEE.RATE_CARD_FEE    = t.RATE_FEE_CARD, '
               +'         TEMP_FEE.AMT_CARD_FEE     = Ceil(AMT_CARD_TRD    * t.RATE_FEE_CARD    / 100), '
               +'         TEMP_FEE.RATE_CASHRCP_FEE = t.RATE_FEE_CASHRCP, '
               +'         TEMP_FEE.AMT_CASHRCP_FEE  = Ceil(AMT_CASHRCP_TRD * t.RATE_FEE_CASHRCP / 100), '
               +'         TEMP_FEE.RATE_CASH_FEE    = t.RATE_FEE_CASH, '
               +'         TEMP_FEE.AMT_CASH_FEE     = Ceil(AMT_CASH_TRD    * t.RATE_FEE_CASH    / 100), '
//한코너에 금액을 포인트할인으로 전부하면 문제가 되나 해결책이 복잡하고 발생비율이 낮아서 그냥 이대로 처리함
               +'         TEMP_FEE.POINT_OCCUR      = case when POINT_OCCUR_AVAIL_TOT = 0 then 0 else Ceil(POINT_OCCUR_TOT * POINT_OCCUR_AVAIL / POINT_OCCUR_AVAIL_TOT) end '
               +' where TEMP_FEE.CD_HEAD  =:P0 '
               +'   and TEMP_FEE.CD_STORE =:P1 '
               +'   and TEMP_FEE.MAC_ADDRESS =:P2;',
               [HeadStoreCode,
                StoreCode,
                GetMacAddress],
                false);


      // 기존 임대업장별 판매금액, 수수료 등을 모아놓은 테이블 내용 삭제
      ExecQuery('delete from SL_TRD_DAY '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and YMD_SALE between :P2 and :P3;',
                [HeadStoreCode,
                 StoreCode,
                 FromDate,
                 ToDate],
                 false);

      // 임대업장별 판매금액, 수수료 등을 새로 계산
      ExecQuery('insert into SL_TRD_DAY(CD_HEAD, '
               +'                       CD_STORE, '
               +'                       YMD_SALE, '
               +'                       CD_TRDPL, '
               +'                       AMT_SALE, '
               +'                       RATE_SALE_FEE, '
               +'                       AMT_SALE_FEE, '
               +'                       AMT_CASH, '
               +'                       RATE_CASH_FEE, '
               +'                       AMT_CASH_FEE, '
               +'                       AMT_CASHRCP, '
               +'                       RATE_CASHRCP_FEE, '
               +'                       AMT_CASHRCP_FEE, '
               +'                       AMT_CARD, '
               +'                       RATE_CARD_FEE, '
               +'                       AMT_CARD_FEE, '
               +'                       AMT_POINT_OCCUR_FEE, '
               +'                       AMT_CARD_VAN, '
               +'                       AMT_CASHRCP_VAN) '
               +'select   CD_HEAD, '
               +'         CD_STORE, '
               +'         YMD_SALE, '
               +'         CD_TRDPL, '
               +'         Sum(AMT_SALE), '
               +'         Max(RATE_FEE), '
               +'         Sum(AMT_FEE), '
               +'         Sum(AMT_CASH_TRD), '
               +'         Max(RATE_CASH_FEE), '
               +'         Sum(AMT_CASH_FEE), '
               +'         Sum(AMT_CASHRCP + AMT_CASHRCP_TRD), '
               +'         Max(RATE_CASHRCP_FEE), '
               +'         Sum(AMT_CASHRCP_FEE), '
               +'         Sum(AMT_CARD + AMT_CARD_TRD), '
               +'         Max(RATE_CARD_FEE), '
               +'         Sum(AMT_CARD_FEE), '
               +'         Sum(POINT_OCCUR), '
               +'         Sum(AMT_CARD), '
               +'         Sum(AMT_CASHRCP) '
               +'  from   TEMP_FEE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and MAC_ADDRESS =:P2 '
               +' group by CD_HEAD, CD_STORE, YMD_SALE, CD_TRDPL;',
               [HeadStoreCode,
                StoreCode,
                GetMacAddress],
                false);

      // 임시테이블 지우기
      ExecQuery('delete from TEMP_FEE '
               +' where CD_HEAD     =:P0 '
               +'   and CD_STORE    =:P1 '
               +'   and MAC_ADDRESS =:P2;',
               [HeadStoreCode,
                StoreCode,
                GetMacAddress],true);

      Screen.Cursor := crDefault;
      if Sender <> nil then
      begin
        MsgBox('수수료 재계산이 끝났습니다.');
//        ButtonToolBarSearchButtonClick(ButtonToolBarSearchButton);
      end;
      SetLastDate;
    except
        on E: Exception do
        begin
          ErrBox(E.Message);
        end;
    end;
  end;
end;


end.
