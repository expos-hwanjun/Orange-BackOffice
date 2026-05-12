unit CloseCashierShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer, Uni, DB,
  MemDS, ImgList, Menus, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, DBAccess, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk;

type
  TCloseCashierShowForm = class(TInheritShowForm)
    GridTableViewCloseDate: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewCashierNo: TcxGridColumn;
    GridTableViewCashierName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewReserveAmt: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewReturnAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewCustomerCount: TcxGridColumn;
    GridTableViewCloseDateTime: TcxGridColumn;
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  CloseCashierShowForm: TCloseCashierShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TCloseCashierShowForm.DoSearch:Boolean;
begin
  Result := false;
  try
    OpenQuery('select   dbo.StoD(a.YMD_CLOSE) as YMD_CLOSE, '
             +'         a.NO_POS, '
             +'         a.CD_SAWON, '
             +'         b.NM_SAWON, '
             +'         case when a.YN_CLOSE = ''Y'' then ''마감'' when a.YN_TEMP_CLOSE = ''Y'' then ''가마감'' end as DS_STATUS, '
             +'         a.AMT_READY, '
             +'         a.AMT_MID, '
             +'         a.AMT_CASH + a.AMT_CHECK + a.AMT_CASHRCP as AMT_CASH, '
             +'         a.AMT_LACK, '
             +'         a.AMT_SALE, '
             +'         a.AMT_VOID, '
             +'         a.AMT_BANPUM, '
             +'         a.DC_SPC+a.DC_GOODS+a.DC_COUPON+a.DC_CMS+a.DC_MEMBER+a.DC_RECEIPT+a.DC_ENURI+a.DC_CUT as AMT_DC, '
             +'         a.CNT_CUSTOMER, '
             +'         a.DT_CHANGE '
             +'from     SL_CASHIER_MGM as a inner join '
             +'         MS_SAWON as b on a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON '
             +'where    a.CD_STORE  = :P0 '
             +'  and    a.YMD_CLOSE between :P1 and :P2 '
             +'order by a.NO_POS, a.CD_SAWON',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RowCount > 0;
  except
  end;
end;

//------------------------------------------------------------------------------
// 그리드 스타일 적용
procedure TCloseCashierShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TCloseCashierShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  inherited;
  // 마감은 빨간색, 가마감은 파란색으로 표시
  if (AItem <> nil) and (AItem.Index = GridTableViewStatus.Index) then
    if ARecord.Values[GridTableViewStatus.Index] = '마감' then
      AStyle := StyleFontRed
    else
      AStyle := StyleFontBlue;
end;

end.
