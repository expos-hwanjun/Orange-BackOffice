// 거래처 원장 (New완료)

//##### 조건에 거래처 선택하는거 수정
//##### 날짜 조건에 이번달, 지난달 등 조건 추가

unit BuyCompanyBookShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, StrUtils,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  cxCurrencyEdit, ExtCtrls, AdvToolBarStylers, StdCtrls, CheckLst, AdvPanel,
  cxRadioGroup, OleCtrls,
  AdvOfficeTabSet, AdvSplitter, Math, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  DateUtils, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, SHDocVw,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxMemo, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSetStylers, AdvOfficePager,
  AdvOfficePagerStylers;

type
  TBuyCompanyBookShowForm = class(TInheritShowForm)
    ChartPanel: TPanel;
    BookGridLevel: TcxGridLevel;
    BookGridTableView: TcxGridTableView;
    ConditionTabSet: TAdvOfficeTabSet;
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewDCAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewCreditAmt: TcxGridColumn;
    GridTableViewPayAmt: TcxGridColumn;
    GridTableViewRemainAmt: TcxGridColumn;
    BookGridTableViewDate: TcxGridColumn;
    BookGridTableViewType: TcxGridColumn;
    BookGridTableViewBuyAmt: TcxGridColumn;
    BookGridTableViewDCAmt: TcxGridColumn;
    BookGridTableViewCashAmt: TcxGridColumn;
    BookGridTableViewCreditAmt: TcxGridColumn;
    BookGridTableViewPayAmt: TcxGridColumn;
    BookGridTableViewRemainAmt: TcxGridColumn;
    BookGridTableViewRemark: TcxGridColumn;
    CommentLabel: TLabel;
    Splitter: TAdvSplitter;
    GridTableViewBeforeAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewBizNo: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    PayPanel: TPanel;
    ReceiveEmpLabel: TLabel;
    ReceiveCommentLabel: TLabel;
    ReceivePasswordLabel: TLabel;
    PayOKButton: TAdvGlowButton;
    PayCancelButton: TAdvGlowButton;
    PayCommentMemo: TcxMemo;
    Label1: TLabel;
    RemainAmtEdit: TcxCurrencyEdit;
    PayDateEdit: TcxDateEdit;
    PayAmtEdit: TcxCurrencyEdit;
    Label2: TLabel;
    DcAmtEdit: TcxCurrencyEdit;
    Label3: TLabel;
    TotalAmtEdit: TcxCurrencyEdit;
    Label4: TLabel;
    BalanceAmtEdit: TcxCurrencyEdit;
    GoodsGridLevel: TcxGridLevel;
    GoodsGridTableView: TcxGridTableView;
    GoodsGridTableViewGoodCode: TcxGridColumn;
    GoodsGridTableViewGoodsName: TcxGridColumn;
    GoodsGridTableViewSpec: TcxGridColumn;
    GoodsGridTableViewBuyQty: TcxGridColumn;
    GoodsGridTableViewBuyPrice: TcxGridColumn;
    GoodsGridTableViewNetAmt: TcxGridColumn;
    GoodsGridTableViewVatAmt: TcxGridColumn;
    GoodsGridTableViewBuyAmt: TcxGridColumn;
    GoodsGridTableViewSeq: TcxGridColumn;
    GoodsGridTableViewBuyNo: TcxGridColumn;
    GoodsGridTableViewSeq1: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionTabSetChange(Sender: TObject);
    procedure BookGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure GoodsGridTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure GoodsGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormResize(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure PayOKButtonClick(Sender: TObject);
    procedure PayCancelButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure PayAmtEditPropertiesChange(Sender: TObject);
    procedure DcAmtEditPropertiesChange(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BookGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);

  private
    FusionChart: TWebBrowser;
  protected
    function  DoSearch:Boolean; override;
    procedure DoPreview; override;
  end;

var
  BuyCompanyBookShowForm: TBuyCompanyBookShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyCompanyBookShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매입관리/매입처%20미지급금%20잔액조회/매입처%20미지급금%20잔액조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;

procedure TBuyCompanyBookShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure TBuyCompanyBookShowForm.FormResize(Sender: TObject);
begin
  inherited;
  PayPanel.Top  := (Grid.Height - PayPanel.Height) div 2 + Grid.Top;
  PayPanel.Left := (Grid.Width  - PayPanel.Width ) div 2 + Grid.Left;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 조회조건에서 키보드를 누를 때
procedure TBuyCompanyBookShowForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 조건 탭을 바꿀 때
procedure TBuyCompanyBookShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

procedure TBuyCompanyBookShowForm.ConditionTabSetChange(Sender: TObject);
const
  msgBook = ' 거래처 원장';
var
  vIndex    : Integer;
  vRemainAmt: Currency;
begin
  inherited;
  ButtonToolBarSaveButton.Enabled := false;
  // 그리드의 레벨을 바꿔서 보여준다
  case ConditionTabSet.ActiveTabIndex of
    0 : // 거래처 미지급 내역
        begin
//          ReportTitle        := '매입처별 미지급 내역';
          Grid.ActiveLevel   := GridLevel;
          ChartPanel.Visible := true;
          Splitter.Visible   := true;
          ConditionTabSet.AdvOfficeTabs.Items[1].Caption := msgBook;
          ConditionTabSet.AdvOfficeTabs.Items[2].Caption := ' 매입내역 ';
          ButtonToolBarSaveButton.Enabled := GridTableView.DataController.GetFocusedRecordIndex >= 0;
        end;
    1 : // 거래처 원장
        begin
          Grid.ActiveLevel   := BookGridLevel;
          Splitter.Visible   := false;
          ChartPanel.Visible := false;
          // 조회
          if GridTableView.DataController.FocusedRecordIndex >= 0 then
          begin
            ConditionTabSet.AdvOfficeTabs.Items[1].Caption := ' '''+GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index]+''''+msgBook;
            ReportSubTitle := ConditionTabSet.AdvOfficeTabs.Items[1].Caption;

            OpenQuery('select   ''''     as YMD_BUY, '
                     +'         ''0''    as SEQ, '
                     +'         ''이월'' as DS_TYPE, '
                     +'         0        as AMT_BUY, '
                     +'         0        as AMT_DC, '
                     +'         0        as AMT_CASH, '
                     +'         0        as AMT_TRUST, '
                     +'         0        as AMT_PAY, '
                     +'         Sum(Ifnull(AMT_BASE,0)+Ifnull(AMT_BUY,0)-Ifnull(AMT_PAY,0))  as AMT_REMAIN, '
                     +'         ''''                as REMARK, '
                     +'         Now() '
                     +'  from  (select Ifnull(AMT_BASE,0) as AMT_BASE, '
                     +'                0 as AMT_BUY, '
                     +'                0 as AMT_PAY '
                     +'         from   SL_BOOKS_MONTH '
                     +'         where  CD_HEAD  = :P0 '
                     +'           and  CD_STORE = :P1 '
                     +'           and  YM_CLOSE = Left(:P3,6) '
                     +'           and  CD_CLOSE = ''10'' '
                     +'           and  CD_CODE  = :P2 '
                     +'         union all '
                     +'         select 0, '
                     //01일까지 조회이면 월 기초 미지급만 사용
                     +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0, ',' sum(Ifnull(AMT_TRUST,0)), ')
                     +'                0 '
                     +'         from   SL_BUY_H '
                     +'         where  CD_HEAD  =:P0 '
                     +'           and  CD_STORE =:P1 '
                     +'           and  YMD_BUY between Left(:P3,6)+''01'' and :P5 '
                     +'           and  CD_TRDPL = :P2 '
                     +'           and  AMT_TRUST <> 0 '
                     +'         union all '
                     +'         select 0, '
                     +'                0, '
                     //01일까지 조회이면 월 기초 미지급만 사용
                     +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0 ',' Sum(Ifnull(AMT_OUT,0) + Ifnull(AMT_DC,0)) ')
                     +'         from   SL_ACCT '
                     +'         where  CD_HEAD  =:P0 '
                     +'           and  CD_STORE =:P1 '
                     +'           and  YMD_OCCUR between Left(:P3,6)+''01'' and :P5 '
                     +'           and  CD_ACCT ='''+CreditOut+''''
                     +'           and  CD_TRDPL =:P2 '
                     +'  ) t '
                     +'union all '
                     +'select   StoDW(YMD_BUY) as YMD_BUY, '
                     +'         ''1'' as SEQ, '
                     +'         ''매입'' as DS_TYPE, '
                     +'         AMT_BUY, '
                     +'         AMT_DC, '
                     +'         AMT_CASH, '
                     +'         AMT_TRUST, '
                     +'         0 as AMT_PAY, '
                     +'         0 as AMT_REMAIN, '
                     +'         '''' as REMARK, '
                     +'         DT_INSERT '
                     +'from     SL_BUY_H '
                     +'where    CD_HEAD  =:P0 '
                     +'  and    CD_STORE =:P1 '
                     +'  and    CD_TRDPL =:P2 '
                     +'  and    YMD_BUY between :P3 and :P4 '
                     +'union all '
                     +'select   StoDW(YMD_OCCUR) as YMD_BUY, '
                     +'         ''1''    as SEQ, '
                     +'         ''지급'' as DS_TYPE, '
                     +'         0        as AMT_BUY, '
                     +'         AMT_DC, '
                     +'         0        as AMT_CASH, '
                     +'         0        as AMT_TRUST, '
                     +'         AMT_OUT+AMT_DC  as AMT_PAY, '
                     +'         0        as AMT_REMAIN, '
                     +'         REMARK, '
                     +'         DT_INSERT '
                     +'from     SL_ACCT  '
                     +'where    CD_HEAD  =:P0 '
                     +'  and    CD_STORE =:P1 '
                     +'  and    CD_TRDPL =:P2 '
                     +'  and    CD_ACCT ='''+CreditOut+''''
                     +'  and    YMD_OCCUR between :P3 and :P4 '
                     +'order by 1, 11 ',
                      [HeadStoreCode,
                       StoreCode,
                       GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index],
                       DtoS(ConditionToolBarFromDateEdit.Date),
                       DtoS(ConditionToolBarToDateEdit.Date),
                       DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)) ]);
            DM.ReadQuery(Query, BookGridTableView);
            // 미지급잔액을 계산해서 그리드에 넣어준다
            vRemainAmt := 0;
            for vIndex := 0 to BookGridTableView.DataController.RecordCount-1 do
            begin
              vRemainAmt := vRemainAmt
                          + Ifthen(vIndex=0,Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewRemainAmt.Index],0.0),0)
                          + Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewCreditAmt.Index],        0)
                          - Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewPayAmt.Index],        0);
              BookGridTableView.DataController.Values[vIndex, BookGridTableViewRemainAmt.Index] := vRemainAmt;
            end;
            // 미지급금액 푸터 표시 (그리드 내용 Sum 아니고 미지급계산한 마지막 금액 넣으면 됨)
            if BookGridTableView.DataController.RecordCount > 0 then
              BookGridTableView.DataController.Summary.FooterSummaryValues[7] := FormatFloat(fmtComma, vRemainAmt)
            else
              BookGridTableView.DataController.Summary.FooterSummaryValues[7] := 0;
          end;
        end;
    2 :
        begin
          Grid.ActiveLevel   := GoodsGridLevel;
          Splitter.Visible   := false;
          ChartPanel.Visible := false;
          if (BookGridTableView.DataController.FocusedRecordIndex >= 0) and (BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewType.Index] <> '이월')  and (BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewType.Index] <> '지급') then
          begin
            ConditionTabSet.AdvOfficeTabs.Items[2].Caption := ' '''+BookGridTableView.DataController.Values[BookGridTableView.DataController.FocusedRecordIndex, BookGridTableViewDate.Index]+''' 매입내역';
            ReportSubTitle := '매 입 처 : '+GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyName.Index]+#13+'매입일자 : '+BookGridTableView.DataController.Values[BookGridTableView.DataController.FocusedRecordIndex, BookGridTableViewDate.Index];
            OpenQuery('select 1 as SEQ, '
                     +'       d.NO_BUY, '
                     +'       d.CD_GOODS, '
                     +'	    	m.NM_MENU as NM_GOODS, '
                     +'	    	m.NM_SPEC, '
                     +'       d.QTY_BUY, '
                     +'       d.PR_BUY, '
                     +'	    	d.AMT_BUY, '
                     +'	    	d.AMT_DUTY+d.AMT_DUTYFREE as AMT_NET, '
                     +'	    	d.AMT_TAX, '
                     +'       d.NO_BUY as NO_SEQ '
                     +'  from	SL_BUY_D d inner join '
                     +'       SL_BUY_H h on d.CD_HEAD  = h.CD_HEAD '
                     +'                 and d.CD_STORE = h.CD_STORE '
                     +'                 and d.YMD_BUY  = h.YMD_BUY '
                     +'                 and d.NO_BUY   = h.NO_BUY '
                     +'                 and h.CD_TRDPL = :P3 inner join '
                     +'       MS_MENU  m on d.CD_HEAD  = m.CD_HEAD '
                     +'                 and d.CD_STORE = m.CD_STORE '
                     +'                 and d.CD_GOODS = m.CD_MENU '
                     +' where	d.CD_HEAD  =:P0 '
                     +'   and d.CD_STORE =:P1 '
                     +'   and d.YMD_BUY  =:P2 '
                     +'union  all '
                     +'select 2 as SEQ, '
                     +'       '''', '
                     +'       '''' as CD_GOODS, '
                     +'       ''  [ 매입 합계 ]'' as NM_GOODS, '
                     +'       '''' as NM_SPEC, '
                     +'       0 as QTY_BUY, '
                     +'       0 as PR_BUY, '
                     +'       AMT_BUY, '
                     +'       AMT_DUTY+AMT_DUTYFREE as AMT_NET, '
                     +'       AMT_TAX, '
                     +'       NO_BUY as NO_SEQ '
                     +'  from SL_BUY_H '
                     +' where CD_HEAD  = :P0 '
                     +'   and CD_STORE = :P1 '
                     +'   and YMD_BUY  = :P2 '
                     +'   and CD_TRDPL = :P3 '
                     +'order by 11, 1 ',
                      [HeadStoreCode,
                       StoreCode,
                       GetOnlyNumber(BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewDate.Index]),
                       GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCompanyCode.Index]]);
            DM.ReadQuery(Query, GoodsGridTableView);
          end;
        end;
  end;
end;
//------------------------------------------------------------------------------
// 그리드에서 더블클릭했을때
procedure TBuyCompanyBookShowForm.GoodsGridTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var vIndex :Integer;
begin
  inherited;
  GoodsGridTableView.DataController.Summary.FooterSummaryValues[0] := 0;
  GoodsGridTableView.DataController.Summary.FooterSummaryValues[1] := 0;
  try
    GoodsGridTableView.DataController.BeginUpdate;
    for vIndex := 0 to GoodsGridTableView.DataController.RecordCount - 1 do
      if GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewSeq.Index] = 2 then
      begin
        GoodsGridTableView.DataController.Summary.FooterSummaryValues[0] := GoodsGridTableView.DataController.Summary.FooterSummaryValues[0] + GoodsGridTableView.DataController.Values[vIndex, GoodsGridTableViewBuyAmt.Index];
      end;
  finally
    GoodsGridTableView.DataController.EndUpdate;
  end;
end;

procedure TBuyCompanyBookShowForm.GoodsGridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var vTemp :String;
begin
  inherited;
  if GoodsGridTableView.DataController.RecordCount = 0 then Exit;

  vTemp := Replace(NVL(ARecord.Values[GoodsGridTableViewGoodsName.Index],''),' ','');
  if (AItem <> nil) and (vTemp = '[매입합계]') then
    AStyle := StyleFontBlackBold
  else if (AItem <> nil) and ( (vTemp = '[반품합계]') or (vTemp = '[공병반환]')) then
    AStyle := StyleFontRedBold;
end;

procedure TBuyCompanyBookShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  // 연결된 거래처 원장을 보여준다
  if GridTableView.DataController.FocusedRecordIndex >= 0 then
    ConditionTabSet.ActiveTabIndex := 1;
end;

procedure TBuyCompanyBookShowForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarSaveButton.Enabled := ConditionTabSet.ActiveTabIndex = 0;
end;

procedure TBuyCompanyBookShowForm.PayAmtEditPropertiesChange(Sender: TObject);
begin
  inherited;
  TotalAmtEdit.Value   := DcAmtEdit.Value + PayAmtEdit.Value;
  BalanceAmtEdit.Value := RemainAmtEdit.Value - TotalAmtEdit.Value;
end;

procedure TBuyCompanyBookShowForm.PayCancelButtonClick(Sender: TObject);
begin
  inherited;
  PayPanel.Visible         := false;
  ConditionTabSet.Enabled  := true;
  Grid.Enabled             := true;
  ToolBarDockPanel.Enabled := true;
end;

procedure TBuyCompanyBookShowForm.PayOKButtonClick(Sender: TObject);
begin
  inherited;
  if TotalAmtEdit.Value = 0 then
  begin
    ErrBox('지급금액을 입력하세요');
    Exit;
  end;

  // 월마감여부 체크
  if CheckMonthClose('M', DtoS(PayDateEdit.Date)) then
    Exit;

  try
    ExecQuery('insert into SL_ACCT (CD_HEAD, '
             +'                     CD_STORE, '
             +'                     YMD_OCCUR, '
             +'                     NO_POS, '
             +'                     NO_ACCT, '
             +'                     DS_ACCT, '
             +'                     CD_ACCT, '
             +'                     AMT_OUT, '
             +'                     AMT_DC, '
             +'                     CD_BANK, '
             +'                     CD_TRDPL, '
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
             +'                     '''', '
             +'                     :P6, '
             +'                     :P7, '
             +'                     Now(), '
             +'                     :P8, '
             +'                     :P9, '
             +'                     Now());',
             [HeadStoreCode,
              StoreCode,
              DtoS(PayDateEdit.Date),
              CreditOut,
              PayAmtEdit.Value,
              DcAmtEdit.Value,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCompanyCode.Index],
              PayCommentMemo.Text,
              UserCode,
              RemainAmtEdit.Value],true);

    DoSearch;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
  PayPanel.Visible         := false;
  ConditionTabSet.Enabled  := true;
  Grid.Enabled             := true;
  ToolBarDockPanel.Enabled := true;
end;

//------------------------------------------------------------------------------
// 그리드 내용을 표시할 때
procedure TBuyCompanyBookShowForm.BookGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  // 연결된 거래처 원장을 보여준다
  if (BookGridTableView.DataController.FocusedRecordIndex >= 0) and (BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewType.Index] <> '이월')  and (BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewType.Index] <> '지급') then
    ConditionTabSet.ActiveTabIndex := 2;
end;

procedure TBuyCompanyBookShowForm.BookGridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if BookGridTableView.DataController.RecordCount = 0 then Exit;

  if (AItem <> nil) and (AItem.Index = BookGridTableViewType.Index) then
    if ARecord.Values[BookGridTableViewType.Index] = '이월' then
      AStyle := StyleFontBlue
    else if ARecord.Values[BookGridTableViewType.Index] = '지급' then
      AStyle := StyleFontGray
    else if ARecord.Values[BookGridTableViewType.Index] = '반품' then
      AStyle := StyleFontRed;
end;

procedure TBuyCompanyBookShowForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then
  begin
    MsgBox('지급할 거래처를 선택하세요');
    Exit;
  end;

  PayPanel.Visible         := true;
  ConditionTabSet.Enabled  := false;
  Grid.Enabled             := false;
  ToolBarDockPanel.Enabled := false;

  PayDateEdit.Date     := now;
  RemainAmtEdit.Value  := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRemainAmt.Index];
  BalanceAmtEdit.Value := RemainAmtEdit.Value;
  PayAmtEdit.Value     := 0;
  DcAmtEdit.Value      := 0;
  PayCommentMemo.Clear;
  PayAmtEdit.SetFocus;
end;

procedure TBuyCompanyBookShowForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
procedure TBuyCompanyBookShowForm.DcAmtEditPropertiesChange(Sender: TObject);
begin
  inherited;
  TotalAmtEdit.Value   := DcAmtEdit.Value + PayAmtEdit.Value;
  BalanceAmtEdit.Value := RemainAmtEdit.Value - TotalAmtEdit.Value;
end;

procedure TBuyCompanyBookShowForm.DoPreview;
begin
  if Grid.ActiveLevel = GoodsGridLevel then
  begin
    ConditionToolBarFromDateEdit.Visible := false;
    ConditionToolBarToDateEdit.Visible   := false;
  end;
  inherited;
  if Grid.ActiveLevel = GoodsGridLevel then
  begin
    ConditionToolBarFromDateEdit.Visible := true;
    ConditionToolBarToDateEdit.Visible   := true;
  end;
end;

function TBuyCompanyBookShowForm.DoSearch:Boolean;
var
  vIndex    : Integer;
  vChartXml : string;
begin
  inherited;

  CommentLabel.Visible := ConditionToolBarToDateEdit.Date < Date;

  ConditionTabSet.ActiveTabIndex := 0;

  OpenQuery('select   a.CD_TRDPL, '
           +'         Max(a.NM_TRDPL) as NM_TRDPL, '
           +'         Max(a.NO_BIZER) as NO_BIZER, '
           +'         Sum(Ifnull(b.AMT_BEFORE,0))     as AMT_BEFORE, '
           +'         Sum(Ifnull(b.AMT_BUY,0))        as AMT_BUY, '
           +'         Sum(Ifnull(b.AMT_RETURN,0))     as AMT_RETURN, '
           +'         Sum(Ifnull(b.AMT_SALE,0))       as AMT_SALE, '
           +'         Sum(Ifnull(b.AMT_DC,0))         as AMT_DC, '
           +'         Sum(Ifnull(b.AMT_CASH,0))       as AMT_CASH, '
           +'         Sum(Ifnull(b.AMT_TRUST,0))      as AMT_TRUST, '
           +'         Sum(Ifnull(b.AMT_PAY,0))        as AMT_PAY, '
           +'         Sum(Ifnull(b.AMT_BEFORE,0) + Ifnull(b.AMT_TRUST,0) - Ifnull(b.AMT_PAY,0) ) as AMT_REMAIN '
           +'from     MS_TRD as a left outer join '
           +'        (select CD_TRDPL, '
           +'                Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_BUY,0) - Ifnull(AMT_PAY,0)) as AMT_BEFORE, '
           +'                0 as AMT_BUY, '
           +'                0 as AMT_RETURN, '
           +'                0 as AMT_SALE, '
           +'                0 as AMT_DC, '
           +'                0 as AMT_CASH, '
           +'                0 as AMT_TRUST, '
           +'                0 as AMT_PAY '
           +'         from '
           +'              (select CD_CODE as CD_TRDPL, '
           +'                      AMT_BASE, '
           +'                      0 as AMT_BUY, '
           +'                      0 as AMT_PAY '
           +'               from   SL_BOOKS_MONTH '
           +'               where  CD_HEAD  =:P0 '
           +'                 and  CD_STORE =:P1 '
           +'                 and  YM_CLOSE = Left(:P2,6) '
           +'                 and  CD_CLOSE = ''10'' '
           +'                 and  CD_CODE <> '''' '
           +'               union all '
           +'               select CD_TRDPL, '
           +'                      0, '
           //01일까지 조회이면 월 기초 미지급만 사용
           +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0, ',' sum(AMT_TRUST), ')
           +'                      0 '
           +'               from   SL_BUY_H '
           +'               where  CD_HEAD  =:P0 '
           +'                 and  CD_STORE =:P1 '
           +'                 and  YMD_BUY between ConCat(Left(:P2,6),''01'') and :P4 '
           +'                 and  AMT_TRUST <> 0 '
           +'               group by CD_TRDPL '
           +'               union all '
           +'               select CD_TRDPL, '
           +'                      0, '
           +'                      0, '
           //01일까지 조회이면 월 기초 미지급만 사용
           +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0 ',' Sum(AMT_OUT + AMT_DC) ')
           +'               from   SL_ACCT '
           +'               where  CD_HEAD  =:P0 '
           +'                 and  CD_STORE =:P1 '
           +'                 and  YMD_OCCUR between ConCat(Left(:P2,6),''01'') and :P4 '
           +'                 and  CD_TRDPL <> '''' '
           +'                 and  CD_ACCT = '''+CreditOut+''''
           +'               group by CD_TRDPL '
           +'             ) t '
           +'         group by CD_TRDPL '
           +'         union all '
           +'         select   CD_TRDPL, '                                      // 매입 기간내금액
           +'                  0                   as AMT_BEFORE, '
           +'                  Sum(AMT_BUY)        as AMT_BUY, '
           +'                  0                   as AMT_RETURN, '
           +'                  0                   as AMT_SALE, '
           +'                  Sum(AMT_DC)         as AMT_DC, '
           +'                  Sum(AMT_CASH)       as AMT_CASH, '
           +'                  Sum(AMT_TRUST)      as AMT_TRUST, '
           +'                  0                   as AMT_PAY '
           +'         from     SL_BUY_H '
           +'         where    CD_HEAD  =:P0 '
           +'           and    CD_STORE =:P1 '
           +'           and    YMD_BUY  between :P2 and :P3 '
           +'           and    DS_BUY = ''B'' '
           +'         group by CD_STORE, CD_TRDPL '
           +'         union all '
           +'         select   CD_TRDPL, '                                      // 반품 기간내금액
           +'                  0                   as AMT_BEFORE, '
           +'                  0                   as AMT_BUY, '
           +'                  Sum(AMT_BUY)        as AMT_RETURN, '
           +'                  0                   as AMT_SALE, '
           +'                  Sum(AMT_DC)         as AMT_DC, '
           +'                  Sum(AMT_CASH)       as AMT_CASH, '
           +'                  Sum(AMT_TRUST)      as AMT_TRUST, '
           +'                  0                   as AMT_PAY '
           +'         from     SL_BUY_H '
           +'         where    CD_HEAD  =:P0 '
           +'           and    CD_STORE =:P1 '
           +'           and    YMD_BUY  between :P2 and :P3 '
           +'           and    DS_BUY = ''R'' '
           +'         group by CD_STORE, CD_TRDPL '
           +'         union all '
           +'         select   t.CD_TRDPL, '                                      // 판매 기간내금액
           +'                  0                   as AMT_BEFORE, '
           +'                  0                   as AMT_BUY, '
           +'                  0                   as AMT_RETURN, '
           +'                  Sum(d.AMT_SALE-d.DC_TOT) as AMT_SALE, '
           +'                  0                   as AMT_DC, '
           +'                  0                   as AMT_CASH, '
           +'                  0                   as AMT_TRUST, '
           +'                  0                   as AMT_PAY '
           +'         from     SL_SALE_D_SUM d  inner join '
           +'                  MS_MENU       g on d.CD_HEAD = g.CD_HEAD and d.CD_STORE = g.CD_STORE and d.CD_MENU = g.CD_MENU inner join'
           +'                  MS_TRD        t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
           +'         where    d.CD_HEAD  =:P0 '
           +'           and    d.CD_STORE =:P1 '
           +'           and    d.YMD_SALE  between :P2 and :P3 '
           +'         group by d.CD_STORE, t.CD_TRDPL '
           +'         union all '
           +'         select   CD_TRDPL, '                                      // 지급 기간내금액
           +'                  0            as AMT_BEFORE, '
           +'                  0            as AMT_BUY, '
           +'                  0            as AMT_RETURN, '
           +'                  0            as AMT_SALE, '
           +'                  0            as AMT_DC, '
           +'                  0            as AMT_CASH, '
           +'                  0            as AMT_TRUST, '
           +'                  Sum(AMT_OUT+AMT_DC) as AMT_PAY '
           +'         from     SL_ACCT '
           +'         where    CD_HEAD  =:P0 '
           +'           and    CD_STORE =:P1 '
           +'           and    YMD_OCCUR between :P2 and :P3 '
           +'           and    CD_ACCT = '''+CreditOut+''''
           +'         group by CD_TRDPL) as b on a.CD_TRDPL = b.CD_TRDPL '
           +' where   a.CD_HEAD  =:P0 '
           +'   and   a.CD_STORE =:P1 '
           +'   and   a.DS_TRDPL =''B'' '
           +'   and   (a.CD_TRDPL =:P5 or a.NM_TRDPL like ConCat(''%'',:P5,''%'')) '
           +'group by a.CD_TRDPL',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
             ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);

  // 미지급금 차트 표시
  vChartXml := '<chart caption='''+ConditionTabSet.AdvOfficeTabs.Items[0].Caption+''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if vIndex > 30 then
      break;
    vChartXml := vChartXml + '<set label="'+GridTableView.DataController.Values[vIndex, GridTableViewCompanyName.Index]+'" value="'+FloatToStr(GridTableView.DataController.Values[vIndex,GridTableViewRemainAmt.Index])+'" />';
  end;
  vChartXml   := vChartXml + '</chart>';
  ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
end;

end.
