unit HeadBalanceBooksShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit, DateUtils;

type
  THeadBalanceBooksShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadBalanceBooksShowForm: THeadBalanceBooksShowForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

{ THeadBalanceBooksShowForm }

function THeadBalanceBooksShowForm.DoSearch: Boolean;
begin
  OpenQuery('select a.CD_STORE, '
           +'       a.NM_STORE, '
           +'       GetPhoneNo(a.TEL_MOBILE) as TEL_MOBILE, '
           +'       Ifnull(g.AMT_ORDER_LIMIT,0) as AMT_ORDER_LIMIT, '
           +'       Ifnull(b.AMT_BASE,0) + Ifnull(c.AMT_SALE,0) - Ifnull(d.AMT_GET,0) as AMT_BASE, '
           +'       Ifnull(e.AMT_SALE,0) as AMT_SALE, '
           +'       Ifnull(e.AMT_RETURN,0) as AMT_RETURN, '
           +'       Ifnull(f.AMT_DC,0) as AMT_DC, '
           +'       Ifnull(f.AMT_GET,0) as AMT_GET, '
           +'       Ifnull(b.AMT_BASE,0) + Ifnull(c.AMT_SALE,0) - Ifnull(d.AMT_GET,0) + Ifnull(e.AMT_SALE,0) + Ifnull(e.AMT_RETURN,0) - Ifnull(f.AMT_DC,0) -Ifnull(f.AMT_GET,0)  as AMT_BALANCE, '
           +'       Ifnull(g.AMT_ORDER_LIMIT,0) - Ifnull(b.AMT_BASE,0) + Ifnull(c.AMT_SALE,0) - Ifnull(d.AMT_GET,0) - Ifnull(e.AMT_SALE,0) + Ifnull(e.AMT_RETURN,0) - Ifnull(f.AMT_DC,0) -Ifnull(f.AMT_GET,0) - Ifnull(h.AMT_ORDER,0) as AMT_CREDIT '
           +'  from MS_STORE as a left outer join '
           +'       (select  CD_CODE as CD_STORE, '
           +'                AMT_BASE '
           +'          from  SL_BOOKS_MONTH  '
           +'         where  CD_HEAD  = :P0 '
           +'           and  CD_STORE = ''00000000'' '
           +'           and  CD_CLOSE = '''+varOrderClose+''' '
           +'           and  YM_CLOSE = Left(:P1,6) '
           +'        ) as b on b.CD_STORE = a.CD_STORE left outer join '
           +'       (select  CD_STORE, '
           +'               Sum(AMT_SALE) as AMT_SALE '
           +'         from  OL_SALE_H  '
           +'        where  CD_HEAD   =:P0 '
           +'          and  YMD_SALE between ConCat(Left(:P1,6),''01'') and :P4 '
           +'        group by CD_STORE '
           +'       ) as c on c.CD_STORE = a.CD_STORE left outer join '
           +'      (select  CD_MEMBER as  CD_STORE, '
           +'               Sum(AMT_PAYIN+AMT_DC) as AMT_GET '
           +'         from  SL_ACCT  '
           +'        where  CD_HEAD   =:P0 '
           +'          and  CD_STORE  =''00000000'' '
           +'          and  YMD_OCCUR between ConCat(Left(:P1,6),''01'') and :P4 '
           +'          and  CD_ACCT = '''+varGetCode+''''
           +'       ) as d on d.CD_STORE = a.CD_STORE left outer join '
           +'       (select  CD_STORE, '
           +'               Sum(case when DS_SALE = ''S'' then AMT_SALE else 0 end) as AMT_SALE, '
           +'               Sum(case when DS_SALE = ''R'' then Abs(AMT_SALE) else 0 end) as AMT_RETURN '
           +'         from  OL_SALE_H  '
           +'        where  CD_HEAD   =:P0 '
           +'          and  YMD_SALE between ConCat(Left(:P1,6),''01'') and :P2 '
           +'        group by CD_STORE '
           +'       ) as e on e.CD_STORE = a.CD_STORE left outer join '
           +'      (select  CD_MEMBER as  CD_STORE, '
           +'               Sum(AMT_PAYIN) as AMT_GET, '
           +'               Sum(AMT_DC) as AMT_DC '
           +'         from  SL_ACCT  '
           +'        where  CD_HEAD   =:P0 '
           +'          and  CD_STORE  =''00000000'' '
           +'          and  YMD_OCCUR between ConCat(Left(:P1,6),''01'') and :P2 '
           +'          and  CD_ACCT = '''+varGetCode+''''
           +'       ) as f on f.CD_STORE = a.CD_STORE left outer join '
           +'       MS_STORE_ETC as g on g.CD_HEAD = a.CD_HEAD and g.CD_STORE = a.CD_STORE left outer join '
           +'      (select   a.CD_STORE , '
           +'                Sum((Ifnull(b.QTY_CONFIRM, b.QTY_ORDER) - Ifnull(b.QTY_SALE,0)) * b.PR_ORDER) as AMT_ORDER '  //발주-출고 수량을 여신에 포함
           +'         from   OL_ORDER_H a inner join '
           +'                OL_ORDER_D b on b.CD_HEAD   = a.CD_HEAD '
           +'                            and b.CD_STORE  = a.CD_STORE '
           +'                            and b.YMD_ORDER = a.YMD_ORDER '
           +'                            and b.NO_ORDER  = a.NO_ORDER '
           +'        where   a.CD_HEAD   =:P0 '
           +'          and   a.DS_STATUS <> ''D'' '
           +'        group by a.CD_STORE '
           +'       ) as h on h.CD_STORE = a.CD_STORE '
           +' where a.CD_HEAD =:P0 '
           +'   AND a.CD_STORE <> ''00000000'' '
           +'   and a.NM_STORE like ConCat(''%'',:P3,''%'') '
           +' order by a.CD_STORE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text,
            DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1))]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadBalanceBooksShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
end;

end.
