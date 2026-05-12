unit CloseCashierCloseShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxTextEdit, cxCurrencyEdit,
  cxLabel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxmdaset,
  dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxDropDownEdit,
  cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TCloseCashierCloseShowForm = class(TInheritShow2Form)
    GridDBTableViewCloseDate: TcxGridDBColumn;
    GridDBTableViewPosNo: TcxGridDBColumn;
    GridDBTableViewCashierNo: TcxGridDBColumn;
    GridDBTableViewCashierName: TcxGridDBColumn;
    GridDBTableViewStatus: TcxGridDBColumn;
    GridDBTableViewReadyAmt: TcxGridDBColumn;
    GridDBTableViewDepositAmt: TcxGridDBColumn;
    GridDBTableViewCashAmt: TcxGridDBColumn;
    GridDBTableViewOverShortAmt: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewVoidAmt: TcxGridDBColumn;
    GridDBTableViewReturnAmt: TcxGridDBColumn;
    GridDBTableViewCloseTime: TcxGridDBColumn;
    GridDBTableViewRemark: TcxGridDBColumn;
    GridDBTableViewTempClose: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    GridSubDBTableViewColumn7: TcxGridDBColumn;
    GridSubDBTableViewColumn8: TcxGridDBColumn;
    GridSubDBTableViewColumn9: TcxGridDBColumn;
    GridSubDBTableViewColumn10: TcxGridDBColumn;
    GridSubDBTableViewColumn11: TcxGridDBColumn;
    GridSubDBTableViewColumn12: TcxGridDBColumn;
    GridSubDBTableViewColumn13: TcxGridDBColumn;
    GridDBTableViewColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function  DoDelete: Boolean; // 삭제
  protected
    function  DoSearch:Boolean; override;
  end;
var
  CloseCashierCloseShowForm: TCloseCashierCloseShowForm;

implementation
uses Common;

const
  msgClose     = '마감';
  msgTempClose = '가마감';
  msgReserve   = '준비금';
  msgDeposit   = '중간출금';
{$R *.dfm}

{ TInheritShow2Form1 }
procedure TCloseCashierCloseShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
  PrintMode   := pmPrintPreviewExcel;
end;

procedure TCloseCashierCloseShowForm.GridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if GridDBTableView.DataController.RecordCount = 0 then Exit;

  // 마감은 빨간색, 가마감은 파란색으로 표시
  if (AItem <> nil) and (AItem.Index = GridDBTableViewStatus.Index) then
    if ARecord.Values[GridDBTableViewStatus.Index] = msgClose then
      AStyle := StyleFontRed
    else if ARecord.Values[GridDBTableViewStatus.Index] = msgTempClose then
      AStyle := StyleFontBlue;

  if (AItem <> nil) and (AItem.Index = GridDBTableViewOverShortAmt.Index) then
    if ARecord.Values[GridDBTableViewOverShortAmt.Index]  < 0 then
      AStyle := StyleFontRed;
end;

procedure TCloseCashierCloseShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

function TCloseCashierCloseShowForm.DoDelete: Boolean;
var vSeq :Integer;
begin
  Result := false;

  if GridDBTableView.DataController.FocusedRecordIndex < 0 then
    Exit;

  // 기존에 마감 상태가 아니면 취소
  if (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index] <> msgClose) and
     (GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index] <> msgTempClose) then
    Exit;

  // POS 마감을 했다면 계산원 마감 취소를 못하게 막는다
  if OpenQuery('select   NO_POS '
              +'from     SL_POSCLOSE '
              +'where    CD_HEAD   = :P0 '
              +'  and    CD_STORE  = :P1 '
              +'  and    YMD_CLOSE = :P2 '
              +'  and    NO_POS    = :P3 '
              +'  and    DS_STATUS = ''C'' ',
               [HeadStoreCode,
                StoreCode,
                GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCloseDate.Index]),
                GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index]],
                true) then
  begin
    ErrBox(Format('%s번 POS가 마감을 하여 계산원 마감을 취소할 수 없습니다.', [String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index])]));
    Exit;
  end;

  // 계산원 마감 취소를 한다
  try
    //마감취소 시 중간출금액을 삭제한다고 체크했을때
    if GetOption(103)='1' then
    begin
      OpenQuery('select   Ifnull(Max(LIST_SEQ),0)+1 as SEQ '
               +'from     SL_CASHIER_MGM_LIST '
               +'where    CD_HEAD   = :P0 '
               +'  and    CD_STORE  = :P1 '
               +'  and    YMD_CLOSE = :P2 '
               +'  and    NO_POS    = :P3 '
               +'  and    CD_SAWON  = :P4 '
               +'  and    SEQ       = 1 '
               +'  and    DS_CLOSE  = ''D''',
                [HeadStoreCode,
                 StoreCode,
                 GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCloseDate.Index]),
                 GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index],
                 GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCashierNo.Index]]);
      try
        if not Query.Eof then
          vSeq := Query.Fields[0].AsInteger
        else
          vSeq := 1;
      finally
        FinishQuery;
      end;

      ExecQuery('insert into SL_CASHIER_MGM_LIST( '
               +'  CD_HEAD, CD_STORE, YMD_CLOSE, NO_POS, CD_SAWON, SEQ, DS_CLOSE, LIST_SEQ, _CHECK, _50000, _10000, _5000, _1000, _500,_100, _50, _10, DT_CHANGE, DS_INSERT '
               +') '
               +' select  CD_HEAD, CD_STORE, YMD_CLOSE, NO_POS, CD_SAWON, SEQ, ''D'', :P5, _CHECK, _50000, _10000, _5000, _1000, _500,_100, _50, _10, Now(), ''B'' '
               +'   from  SL_CASHIER_MGM '
               +'  where  CD_HEAD   = :P0 '
               +'    and  CD_STORE  = :P1 '
               +'    and  YMD_CLOSE = :P2 '
               +'    and  NO_POS    = :P3 '
               +'    and  CD_SAWON  = :P4 '
               +'    and  SEQ       = 1;',
                [HeadStoreCode,
                 StoreCode,
                 GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCloseDate.Index]),
                 GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index],
                 GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCashierNo.Index],
                 vSeq],
                 false);
    end;

    Result := ExecQuery('update SL_CASHIER_MGM '
                       +'set    AMT_ACCT_IN   = 0, '
                       +'       AMT_ACCT_OUT  = 0, '
                       +Ifthen(GetOption(103)='1', ' AMT_MID_CASH=0, '
                                                  +' AMT_MID_CHECK=0, '
                                                  +' _CHECK =0, '
                                                  +' _50000 =0, '
                                                  +' _10000 =0, '
                                                  +' _5000  =0, '
                                                  +' _1000  =0, '
                                                  +' _500   =0, '
                                                  +' _100   =0, '
                                                  +' _50    =0, '
                                                  +' _10    =0, ','')
                       +'       AMT_SALE      = 0, '
                       +'       AMT_TAX       = 0, '
                       +'       AMT_CASH      = 0, '
                       +'       CNT_CARD      = 0, '
                       +'       AMT_CARD      = 0, '
                       +'       AMT_CHECK     = 0, '
                       +'       AMT_TRUST     = 0, '
                       +'       AMT_GIFT      = 0, '
                       +'       AMT_CASHRCP   = 0, '
                       +'       AMT_BANK      = 0, '
                       +'       DC_SPC        = 0, '
                       +'       DC_GOODS      = 0, '
                       +'       DC_COUPON     = 0, '
                       +'       DC_CMS        = 0, '
                       +'       DC_MEMBER     = 0, '
                       +'       DC_RECEIPT    = 0, '
                       +'       DC_STAMP      = 0, '
                       +'       DC_TAXFREE    = 0, '
                       +'       DC_UPLUS      = 0, '
                       +'       DC_KAKAO      = 0, '
                       +'       DC_CUT        = 0, '
                       +'       CNT_VOID      = 0, '
                       +'       AMT_VOID      = 0, '
                       +'       AMT_LACK      = 0, '
                       +'       AMT_BANPUM    = 0, '
                       +'       CNT_CUSTOMER  = 0, '
                       +'       AMT_AVERAGE   = 0, '
                       +'       RCP_BEGIN     = null, '
                       +'       RCP_END       = null, '
                       +'       YN_CLOSE      = ''N'', '
                       +'       DT_CHANGE     = Now(), '
                       +'       DC_POINT      = 0 '
                       +'where  CD_HEAD       = :P0 '
                       +'  and  CD_STORE      = :P1 '
                       +'  and  YMD_CLOSE     = :P2 '
                       +'  and  NO_POS        = :P3 '
                       +'  and  CD_SAWON      = :P4 '
                       +'  and  SEQ           = 1;',
                        [HeadStoreCode,
                         StoreCode,
                         GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCloseDate.Index]),
                         GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewPosNo.Index],
                         GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCashierNo.Index]],
                         true);
    if Result then
    begin
      GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCashAmt.Index]      := 0;
      GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewOverShortAmt.Index] := 0;
      GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleAmt.Index]      := 0;
      GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewVoidAmt.Index]      := 0;
      GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewReturnAmt.Index]    := 0;
      // 기존에 가마감이 되어 있는 상태였다면 마감으로 그리드 상태 변경
      if Nvl(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewTempClose.Index], EmptyStr) = 'Y' then
      begin
        GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index]     := msgTempClose;
        GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewTempClose.Index]  := EmptyStr;
      end
      // 기존에 가마감이 되어 있지 않은 상태였다면 준비금 등으로 그리드 변경
      else
      begin
        if GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewDepositAmt.Index] <> 0 then
          GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index]   := msgDeposit
        else
          GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewStatus.Index]   := msgReserve;
        GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewCloseTime.Index]  := null;
      end;
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

function TCloseCashierCloseShowForm.DoSearch: Boolean;
begin
  SetQuery('select   StoDW(a.YMD_CLOSE) as YMD_CLOSE, '
          +'         a.NO_POS, '
          +'         a.CD_SAWON, '
          +'         b.NM_SAWON, '
          +'         case a.DS_INSERT when ''P'' then ''POS'' when ''B'' then ''사무실'' end as DS_INSERT, '
          +'         a.AMT_READY, '
          +'         a.AMT_READY+ a.AMT_CASH + a.AMT_CHECK as AMT_CASH, '
          +'         a.AMT_MID, '
          +'         a.AMT_LACK, '
          +'         a.AMT_SALE, '
          +'         a.AMT_VOID, '
          +'         a.AMT_BANPUM, '
          +'         case when a.YN_CLOSE = ''Y'' then '''+msgClose+''' when a.YN_TEMP_CLOSE = ''Y'' then '''+msgTempClose+''' when a.AMT_MID <> 0 then '''+msgDeposit+''' when a.AMT_READY <> 0 then '''+msgReserve+''' end as DS_CLOSE, '
          +'         a.YN_TEMP_CLOSE, '
          +'         case when a.YN_CLOSE = ''Y'' or a.YN_TEMP_CLOSE = ''Y'' then a.DT_CHANGE end as DT_INSERT, '
          +'         a.REMARK, '
          +'         ConCat(a.YMD_CLOSE,a.NO_POS,a.CD_SAWON) as LINK '
          +'from     SL_CASHIER_MGM as a inner join '
          +'         MS_SAWON as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
          +'where    a.CD_HEAD   = :P0 '
          +'  and    a.CD_STORE  = :P1 '
          +'  and    a.YMD_CLOSE between :P2 and :P3 '
          +'order by a.YMD_CLOSE, a.NO_POS, a.CD_SAWON, a.DT_INSERT ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);

  SetQuery('select   DT_CHANGE, '
          +'         case DS_CLOSE when ''I'' then ''준비금'' when ''O'' then ''중간출금'' when ''C'' then ''계산원마감'' when ''D'' then ''마감취소'' end as DS_CLOSE, '
          +'         case DS_INSERT when ''P'' then ''POS'' when ''B'' then ''사무실'' end as DS_INSERT, '
          +'         _CHECK, '
          +'         _100000, '
          +'         _10000, '
          +'         _5000, '
          +'         _1000, '
          +'         _500, '
          +'         _100, '
          +'         _50, '
          +'         _10, '
          +'         AMT, '
          +'         ConCat(YMD_CLOSE,NO_POS,CD_SAWON) as LINK '
          +'from     SL_CASHIER_MGM_LIST '
          +'where    CD_HEAD   = :P0 '
          +'  and    CD_STORE  = :P1 '
          +'  and    YMD_CLOSE between :P2 and :P3 '
          +'  and    DS_CLOSE <> ''C'' '
          +'order by YMD_CLOSE, NO_POS, CD_SAWON, DT_CHANGE ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)],
            1);
  inherited;

  Result := GridDBTableView.DataController.RecordCount > 0;
end;



end.
