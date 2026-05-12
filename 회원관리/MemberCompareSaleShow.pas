// 회원:일반 매출 비교 조회 (New완료)

unit MemberCompareSaleShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, ImgList, Menus, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, AdvToolBar, AdvGlowButton, AdvToolBarStylers,
  StdCtrls, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxLabel, cxCurrencyEdit, cxProgressBar, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, ExtCtrls, cxContainer, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TMemberCompareSaleShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewSaleDate: TcxGridBandedColumn;
    GridBandedTableViewMemberQty: TcxGridBandedColumn;
    GridBandedTableViewMemberAmt: TcxGridBandedColumn;
    GridBandedTableViewMemberPrice: TcxGridBandedColumn;
    GridBandedTableViewMemberRate: TcxGridBandedColumn;
    GridBandedTableViewNormalQty: TcxGridBandedColumn;
    GridBandedTableViewNormalAmt: TcxGridBandedColumn;
    GridBandedTableViewNormalPrice: TcxGridBandedColumn;
    GridBandedTableViewNormalRate: TcxGridBandedColumn;
    GridBandedTableViewTotalQty: TcxGridBandedColumn;
    GridBandedTableViewTotalAmt: TcxGridBandedColumn;
    GridBandedTableViewTotalPrice: TcxGridBandedColumn;
    GridBandedTableViewColumn1: TcxGridBandedColumn;
    GridBandedTableViewColumn2: TcxGridBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberCompareSaleShowForm: TMemberCompareSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberCompareSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TMemberCompareSaleShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TMemberCompareSaleShowForm.DoSearch:Boolean;
begin
//inherited;

  OpenQuery('select   StoDW(YMD_SALE) as YMD_SALE, '
           +'         CNT_MEMBER, '
           +'         AMT_MEMBER, '
           +'         PNT_OCCUR, '
           +'         PNT_USE, '
           +'         case when CNT_MEMBER = 0 then 0 else DivFlt(AMT_MEMBER,CNT_MEMBER)      end as PR_MEMBER, '
           +'         case when AMT_TOTAL  = 0 then 0 else DivFlt(AMT_MEMBER,AMT_TOTAL) * 100 end as RT_MEMBER, '
           +'         CNT_NORMAL, '
           +'         AMT_NORMAL, '
           +'         case when CNT_NORMAL = 0 then 0 else DivFlt(AMT_NORMAL,CNT_NORMAL)              end as PR_NORMAL, '
           +'         case when AMT_TOTAL  = 0 then 0 else 100 - (DivFlt(AMT_MEMBER, AMT_TOTAL) * 100) end as RT_NORMAL, '
           +'         CNT_TOTAL, '
           +'         AMT_TOTAL, '
           +'         case when CNT_TOTAL  = 0 then 0 else DivFlt(AMT_TOTAL,CNT_TOTAL)  end as PR_TOTAL '
           +'from    (select   YMD_SALE, '
           +'                  Sum(case when Ifnull(CD_MEMBER,'''') = '''' then 0 else CNT_PERSON end) as CNT_MEMBER, '
           +'                  Sum(case when Ifnull(CD_MEMBER,'''') = '''' then 0 else AMT_SALE end) as AMT_MEMBER, '
           +'                  Sum(case when Ifnull(CD_MEMBER,'''') = '''' then CNT_PERSON else 0   end) as CNT_NORMAL, '
           +'                  Sum(case when Ifnull(CD_MEMBER,'''') = '''' then AMT_SALE else 0 end) as AMT_NORMAL, '
           +'                  Sum(PNT_OCCUR)  as PNT_OCCUR, '
           +'                  Sum(DC_POINT)   as  PNT_USE, '
           +'                  Sum(CNT_PERSON) as CNT_TOTAL, '
           +'                  Sum(AMT_SALE)   as AMT_TOTAL '
           +'          from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
           +'         where    CD_HEAD  =:P0 '
           +'           and    CD_STORE =:P1 '
           +'           and    YMD_SALE between :P2 and :P3 '
           +'           and    DS_SALE <> ''V'' '
           +'         group by YMD_SALE) as a',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridBandedTableView);
end;

end.
