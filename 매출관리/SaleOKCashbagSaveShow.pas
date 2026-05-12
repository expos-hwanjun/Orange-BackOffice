// OK캐쉬백 적립 조회 (완료)

unit SaleOKCashbagSaveShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, ExtCtrls, cxContainer, Uni,
  DB, MemDS, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  cxCurrencyEdit, AdvToolBarStylers, StdCtrls, cxRadioGroup, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TSaleOKCashbagSaveShowForm = class(TInheritShowForm)
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewBillNo: TcxGridColumn;
    GridTableViewDsSale: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewSavePoint: TcxGridColumn;
    GridTableViewApprovalNo: TcxGridColumn;
    GridTableViewChainplFee: TcxGridColumn;
    GridTableViewApprovalDate: TcxGridColumn;
    GridTableViewDsType: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleOKCashbagSaveShowForm: TSaleOKCashbagSaveShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSaleOKCashbagSaveShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매출관리/OK캐쉬백%20적립조회/OK캐쉬백%20적립조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TSaleOKCashbagSaveShowForm.FormShow(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 카드번호에서 키보드를 누를 때
procedure TSaleOKCashbagSaveShowForm.ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TSaleOKCashbagSaveShowForm.DoSearch:Boolean;
begin
  inherited;
  try
    OpenQuery('select   dbo.StoDW(YMD_SALE) as YMD_SALE, '
            +'         NO_POS, '
            +'         NO_RCP, '
            +'         case DS_TYPE when ''S'' then ''적립'' when ''U'' then ''사용'' end DS_TYPE, '
            +'         case DS_TRD  when ''0'' then ''승인'' when ''B'' then ''취소'' else '''' end as DS_SALE, '
            +'         NO_CARD, '
            +'         case DS_TRD when ''0'' then AMT_APPROVAL when ''1'' then AMT_APPROVAL * -1 end AMT_APPROVAL, '
            +'         PNT_OCCUR, '
            +'         NO_APPROVAL, '
            +'         case DS_TRD when ''0'' then CHAINPL_FEE when ''1'' then CHAINPL_FEE * -1 end CHAINPL_FEE, '
            +'         dbo.StoDW(TRD_DATE) as YMD_APPROVAL '
            +'from     SL_CASHBAG '
            +'where    CD_STORE = :P0 '
            +'  and    YMD_SALE between :P1 and :P2 '
            +'order by CD_STORE, YMD_SALE, NO_POS, NO_RCP',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarEdit.Text]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    FinishQuery;
  end;
end;

end.
