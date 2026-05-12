// 외상 매출/회수 내역 조회 (완료)

//##### 탭 형태로 수정

unit MemberCreditShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  cxCurrencyEdit, ExtCtrls, AdvToolBarStylers, StdCtrls, cxRadioGroup,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, StrUtils,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPScxGrid6Lnk, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer;

type
  TMemberCreditShowForm = class(TInheritShow2Form)
    GridSubSubLevel: TcxGridLevel;
    GridSubSubDBTableView: TcxGridDBTableView;
    GridDBTableViewMemberNo: TcxGridDBColumn;
    GridDBTableViewMemberName: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewCreditAmt: TcxGridDBColumn;
    GridDBTableViewDCAmt: TcxGridDBColumn;
    GridDBTableViewGetAmt: TcxGridDBColumn;
    GridDBTableViewRemainAmt: TcxGridDBColumn;
    SubSubMemData: TdxMemData;
    SubSubDataSource: TDataSource;
    GridSubSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubSubDBTableViewSalePrice: TcxGridDBColumn;
    GridSubSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewSaleDate: TcxGridDBColumn;
    GridSubDBTableViewType: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewCreditAmt: TcxGridDBColumn;
    GridSubDBTableViewDCAmt: TcxGridDBColumn;
    GridSubDBTableViewGetAmt: TcxGridDBColumn;
    GridSubDBTableViewRemark: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberCreditShowForm: TMemberCreditShowForm;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberCreditShowForm.FormCreate(Sender: TObject);
begin
  inherited;

  PrintMode   := pmPreviewExcel;
  DefaultDate := ddLastMonth;

  ConditionToolBarEditLabel.Hint := ConditionToolBarEdit.Hint;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 조회조건에서 키보드를 누를 때
procedure TMemberCreditShowForm.ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TMemberCreditShowForm.DoSearch:Boolean;
begin
//inherited;

  OpenQuery('select   a.CD_MEMBER, '
           +'         Max(b.NM_MEMBER) as NM_MEMBER, '
           +'         Sum(a.AMT_SALE)  as AMT_SALE, '
           +'         Sum(a.AMT_TRUST) as AMT_TRUST, '
           +'         Sum(a.AMT_DC)    as AMT_DC, '
           +'         Sum(a.AMT_PAYIN) as AMT_PAYIN, '
           +'         Sum(a.AMT_TRUST - a.AMT_PAYIN - a.AMT_DC) as AMT_REMAIN '
           +'from    (select   CD_STORE, '
           +'                  CD_MEMBER, '
           +'                  Sum(AMT_SALE)  as AMT_SALE, '
           +'                  Sum(AMT_TRUST) as AMT_TRUST, '
           +'                  0 as AMT_DC, '
           +'                  0 as AMT_PAYIN '
           +'         from     SL_SALE_H '
           +'         where    CD_MEMBER <> '''' '
           +'         group by CD_STORE, CD_MEMBER '
           +'         union all '
           +'         select   CD_STORE, '
           +'                  CD_MEMBER, '
           +'                  0 as AMT_SALE, '
           +'                  0 as AMT_TRUST, '
           +'                  Sum(AMT_DC)    as AMT_DC, '
           +'                  Sum(AMT_PAYIN) as AMT_PAYIN '
           +'         from     SL_ACCT '
           +'         where    CD_MEMBER is not null '
           +'         group by CD_STORE, CD_MEMBER) as a inner join '
           +'         MS_MEMBER as b on b.CD_STORE = :P2 and a.CD_MEMBER = b.CD_MEMBER '
           +'where    a.CD_STORE = :P0 '
           +'  and   (a.CD_MEMBER like ''%''+:P1+''%'' or b.NM_MEMBER like ''%''+:P1+''%'' or b.NO_CARD like ''%''+:P1+''%'' or b.NO_JUMIN like ''%''+:P1+''%'' or b.TEL_HOME like ''%''+:P1+''%'' or b.TEL_MOBIL like ''%''+:P1+''%'' or b.TEL_JOB like ''%''+:P1+''%'') '
           +'group by a.CD_MEMBER',
            [StoreCode,
             ConditionToolBarEdit.Text,
             Ifthen(GetOption(257)='0', StoreCode,'0000')]);
  GridDBTableView.DataController.DataSource := nil;
  ReadQuery(nil, MemData, false);
  GridDBTableView.DataController.DataSource := DataSource;
  Result := GridDBTableView.DataController.RowCount > 0;

  OpenQuery('select   a.CD_MEMBER, '
           +'         dbo.StoDW(a.YMD_SALE) as YMD_SALE, '
           +'         a.TYPE, '
           +'         a.AMT_SALE, '
           +'         a.AMT_TRUST, '
           +'         a.AMT_DC, '
           +'         a.AMT_PAYIN, '
           +'         a.REMARK, '
           +'         a.LINK '
           +'from    (select   CD_MEMBER, '
           +'                  YMD_SALE, '
           +'                  1 as SEQ, '
           +'                  case DS_SALE when ''S'' then ''판매'' when ''B'' then ''반품'' end as TYPE, '
           +'                  AMT_SALE, '
           +'                  AMT_TRUST, '
           +'                  0 as AMT_DC, '
           +'                  0 as AMT_PAYIN, '
           +'                  '''' as REMARK, '
           +'                  YMD_SALE + NO_POS + NO_RCP as LINK '
           +'         from     SL_SALE_H '
           +'         where    CD_STORE = :P0 '
           +'           and    YMD_SALE between :P1 and :P2 '
           +'           and    DS_SALE   <> ''V'' '
           +'           and    CD_MEMBER <> '''' '
           +'         union all '
           +'         select   CD_MEMBER, '
           +'                  YMD_OCCUR as YMD_SALE, '
           +'                  2 as SEQ, '
           +'                  ''회수'' as TYPE, '
           +'                  0 as AMT_SALE, '
           +'                  0 as AMT_TRUST, '
           +'                  AMT_DC, '
           +'                  AMT_PAYIN, '
           +'                  case REMARK when null then '''' else REMARK+'' '' end + dbo.GetCommonName(CD_STORE, ''27'', CD_BANK) as REMARK, '
           +'                  '''' as LINK '
           +'         from     SL_ACCT '
           +'         where    CD_STORE = :P0 '
           +'           and    YMD_OCCUR between :P1 and :P2 '
           +'           and    CD_MEMBER is not null '
           +'         union all '
           +'         select   CD_MEMBER, '
           +'                  '''' as YMD_SALE, '
           +'                  0 as SEQ, '
           +'                  ''이월'' as TYPE, '
           +'                  Sum(AMT_SALE)  as AMT_SALE, '
           +'                  Sum(AMT_TRUST) as AMT_TRUST, '
           +'                  Sum(AMT_DC)    as AMT_DC, '
           +'                  Sum(AMT_PAYIN) as AMT_PAYIN, '
           +'                  '''' as REMARK, '
           +'                  '''' as LINK '
           +'         from    (select   CD_MEMBER, '
           +'                           Sum(AMT_SALE)  as AMT_SALE, '
           +'                           Sum(AMT_TRUST) as AMT_TRUST, '
           +'                           0 as AMT_DC, '
           +'                           0 as AMT_PAYIN '
           +'                  from     SL_SALE_H as c '
           +'                  where    CD_STORE  = :P0 '
           +'                    and    YMD_SALE  < :P1 '
           +'                    and    DS_SALE   <> ''V'' '
           +'                    and    CD_MEMBER <> '''' '
           +'                  group by CD_STORE, CD_MEMBER '
           +'                  union all '
           +'                  select   CD_MEMBER, '
           +'                           0 as AMT_SALE, '
           +'                           0 as AMT_TRUST, '
           +'                           Sum(AMT_DC)    as AMT_DC, '
           +'                           Sum(AMT_PAYIN) as AMT_PAYIN '
           +'                  from     SL_ACCT as d '
           +'                  where    CD_STORE  = :P0 '
           +'                    and    YMD_OCCUR < :P1 '
           +'                    and    CD_MEMBER is not null '
           +'                  group by CD_MEMBER) as e '
           +'         group by CD_MEMBER) as a inner join '
           +'         MS_MEMBER as b on a.CD_MEMBER = b.CD_MEMBER '
           +'where    b.CD_STORE = :P4 '
           +'  and   (a.CD_MEMBER like ''%''+:P3+''%'' or b.NM_MEMBER like ''%''+:P3+''%'' or b.NO_CARD like ''%''+:P3+''%'' or b.NO_JUMIN like ''%''+:P3+''%'' or b.TEL_HOME like ''%''+:P3+''%'' or b.TEL_MOBIL like ''%''+:P3+''%'' or b.TEL_JOB like ''%''+:P3+''%'') '
           +'order by a.CD_MEMBER, a.YMD_SALE, a.SEQ',
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             ConditionToolBarEdit.Text,
             Ifthen(GetOption(257)='0', StoreCode,'0000')]);
  GridSubDBTableView.DataController.DataSource := nil;
  ReadQuery(nil, SubMemData, false);
  GridSubDBTableView.DataController.DataSource := SubDataSource;
  OpenQuery('select   a.CD_GOODS, '
           +'         g.NM_GOODS, '
           +'         g.NM_SPEC, '
           +'         a.PR_SALE, '
           +'         a.QTY_SALE, '
           +'         a.AMT_SALE - a.DC_TOT as AMT_SALE, '
           +'         a.YMD_SALE + a.NO_POS + a.NO_RCP as LINK '
           +'from     SL_SALE_D as a inner join '
           +'         SL_SALE_H as b on a.CD_STORE = b.CD_STORE and a.YMD_SALE  = b.YMD_SALE and a.NO_POS = b.NO_POS and a.NO_RCP = b.NO_RCP inner join '
           +'         MS_MEMBER as c on c.CD_STORE = :P4 and b.CD_MEMBER = c.CD_MEMBER inner join '
           +'         MS_GOODS  as g on a.CD_STORE = g.CD_STORE and a.CD_GOODS  = g.CD_GOODS '
           +'where    a.CD_STORE  = :P0 '
           +'  and    a.YMD_SALE between :P1 and :P2 '
           +'  and    b.DS_SALE   <> ''V'' '
           +'  and    b.CD_MEMBER <> '''' '
           +'  and   (b.CD_MEMBER like ''%''+:P3+''%'' or c.NM_MEMBER like ''%''+:P3+''%'' or c.NO_CARD like ''%''+:P3+''%'' or c.NO_JUMIN like ''%''+:P3+''%'' or c.TEL_HOME like ''%''+:P3+''%'' or c.TEL_MOBIL like ''%''+:P3+''%'' or c.TEL_JOB like ''%''+:P3+''%'') '
           +'order by a.YMD_SALE, a.NO_POS, a.NO_RCP, a.SEQ',
            [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             ConditionToolBarEdit.Text,
             Ifthen(GetOption(257)='0', StoreCode,'0000')]);
  GridSubSubDBTableView.DataController.DataSource := nil;
  ReadQuery(nil, SubSubMemData, false);
  GridSubSubDBTableView.DataController.DataSource := SubSubDataSource;
end;

end.
