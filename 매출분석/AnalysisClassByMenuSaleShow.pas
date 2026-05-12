unit AnalysisClassByMenuSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxLabel, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList,
  Vcl.ImgList, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, DateUtils;

type
  TAnalysisClassByMenuSaleShowForm = class(TInheritShow2Form)
    GridDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewColumn2: TcxGridDBColumn;
    GridDBTableViewColumn3: TcxGridDBColumn;
    GridDBTableViewColumn4: TcxGridDBColumn;
    GridDBTableViewColumn5: TcxGridDBColumn;
    GridDBTableViewColumn6: TcxGridDBColumn;
    GridDBTableViewColumn7: TcxGridDBColumn;
    GridDBTableViewColumn8: TcxGridDBColumn;
    GridDBTableViewColumn9: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    GridSubDBTableViewColumn7: TcxGridDBColumn;
    GridSubDBTableViewColumn8: TcxGridDBColumn;
    GridSubDBTableViewLink: TcxGridDBColumn;
    GridDBTableViewColumn10: TcxGridDBColumn;
    GridDBTableViewLink: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisClassByMenuSaleShowForm: TAnalysisClassByMenuSaleShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ TSaleMenuMonthSaleShowForm }

function TAnalysisClassByMenuSaleShowForm.DoSearch: Boolean;
begin
  if GetCompanyOption(2) = '1' then
  begin
    if Tag = 0 then
    begin
      SetQuery('select   c.NM_CLASS, '
              +'         d.CD_MENU, '
              +'         g.NM_MENU, '
              +'         d.QTY_SALE, '
              +'         d.AMT_TOT, '
              +'         d.AMT_SERVICE, '
              +'         d.AMT_DC, '
              +'         d.AMT_SALE, '
              +'         d.AMT_VAT, '
              +'         d.AMT_SOON, '
              +'         g.CD_MENU as LINK '
              +'from     MS_MENU       as g inner join '
              +'        (select CD_MENU, '
              +'                Sum(QTY_SALE) as QTY_SALE, '
              +'                Sum(AMT_SALE+AMT_SERVICE) as AMT_TOT, '
              +'                Sum(AMT_SERVICE) as AMT_SERVICE, '
              +'                Sum(DC_TOT)   as AMT_DC, '
              +'                Sum(AMT_SALE - DC_TOT) as AMT_SALE, '
              +'                Sum(AMT_VAT) as AMT_VAT, '
              +'                Sum(AMT_SALE - DC_TOT - AMT_VAT) as AMT_SOON '
              +'           from SL_SALE_D_SUM '
              +'          where CD_HEAD  =:P0 '
              +'            and CD_STORE =:P1 '
              +'            and YMD_SALE between :P2 and :P3 '
              +'          group by CD_MENU '
              +'         ) as d on d.CD_MENU = g.CD_MENU left outer join '
              +'         MS_MENU_CLASS as c on c.CD_HEAD  = g.CD_HEAD '
              +'                           and c.CD_STORE = g.CD_STORE '
              +'                           and c.CD_CLASS = left(g.CD_CLASS,2) '
              +'where    g.CD_HEAD  =:P0 '
              +'  and    g.CD_STORE =:P1 '
              +'  and   (g.CD_MENU like ConCat(:P4,''%'') or g.NM_MENU like ConCat(''%'',:P4,''%'') ) '
              +'order by g.CD_MENU',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);

      SetQuery('select CD_MENU, '
              +'       ConCat(Left(YMD_SALE,4),''-'',SubStr(YMD_SALE,5,2)) as YM_SALE, '
              +'       Sum(QTY_SALE) as QTY_SALE, '
              +'       Sum(AMT_SALE+AMT_SERVICE) as AMT_TOT, '
              +'       Sum(AMT_SERVICE) as AMT_SERVICE, '
              +'       Sum(DC_TOT)   as AMT_DC, '
              +'       Sum(AMT_SALE - DC_TOT) as AMT_SALE, '
              +'       Sum(AMT_VAT) as AMT_VAT, '
              +'       Sum(AMT_SALE - DC_TOT - AMT_VAT) as AMT_SOON, '
              +'       CD_MENU as LINK '
              +'  from SL_SALE_D_SUM '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and YMD_SALE between :P2 and :P3 '
              +' group by CD_MENU, Left(YMD_SALE,6) '
              +' order by 1,2 ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)],1);
    end
    else
    begin
      SetQuery('select   c.NM_CLASS, '
              +'         d.CD_MENU, '
              +'         g.NM_MENU, '
              +'         d.QTY_SALE, '
              +'         d.AMT_TOT, '
              +'         d.AMT_SERVICE, '
              +'         d.AMT_DC, '
              +'         d.AMT_SALE, '
              +'         d.AMT_VAT, '
              +'         d.AMT_SOON, '
              +'         g.CD_MENU as LINK '
              +'from     MS_MENU       as g inner join '
              +'        (select CD_MENU, '
              +'                Sum(QTY_SALE) as QTY_SALE, '
              +'                Sum(AMT_SALE+AMT_SERVICE) as AMT_TOT, '
              +'                Sum(AMT_SERVICE) as AMT_SERVICE, '
              +'                Sum(DC_TOT)   as AMT_DC, '
              +'                Sum(AMT_SALE - DC_TOT) as AMT_SALE, '
              +'                Sum(AMT_VAT) as AMT_VAT, '
              +'                Sum(AMT_SALE - DC_TOT - AMT_VAT) as AMT_SOON '
              +'           from SL_SALE_D_SUM '
              +'          where CD_HEAD  =:P0 '
              +'            and YMD_SALE between :P2 and :P3 '
              +'          group by CD_MENU '
              +'         ) as d on d.CD_MENU = g.CD_MENU left outer join '
              +'         MS_MENU_CLASS as c on c.CD_HEAD  = g.CD_HEAD '
              +'                           and c.CD_STORE = g.CD_STORE '
              +'                           and c.CD_CLASS = left(g.CD_CLASS,2) '
              +'where    g.CD_HEAD  =:P0 '
              +'  and    g.CD_STORE =:P1 '
              +'  and   (g.CD_MENU like ConCat(:P4,''%'') or g.NM_MENU like ConCat(''%'',:P4,''%'') ) '
              +'order by g.CD_MENU',
               [HeadStoreCode,
                StandardStore,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);

      SetQuery('select CD_MENU, '
              +'       ConCat(Left(YMD_SALE,4),''-'',SubStr(YMD_SALE,5,2)) as YM_SALE, '
              +'       Sum(QTY_SALE) as QTY_SALE, '
              +'       Sum(AMT_SALE+AMT_SERVICE) as AMT_TOT, '
              +'       Sum(AMT_SERVICE) as AMT_SERVICE, '
              +'       Sum(DC_TOT)   as AMT_DC, '
              +'       Sum(AMT_SALE - DC_TOT) as AMT_SALE, '
              +'       Sum(AMT_VAT) as AMT_VAT, '
              +'       Sum(AMT_SALE - DC_TOT - AMT_VAT) as AMT_SOON, '
              +'       CD_MENU as LINK '
              +'  from SL_SALE_D_SUM '
              +' where CD_HEAD  =:P0 '
              +'   and YMD_SALE between :P1 and :P2 '
              +' group by CD_MENU, Left(YMD_SALE,6) '
              +' order by 1,2 ',
               [HeadStoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)],1);
    end;
  end
  else
  begin
    if Tag = 0 then
    begin
      SetQuery('select   c.NM_CLASS, '
              +'         d.CD_MENU, '
              +'         g.NM_MENU, '
              +'         d.QTY_SALE, '
              +'         d.AMT_TOT, '
              +'         d.AMT_SERVICE, '
              +'         d.AMT_DC, '
              +'         d.AMT_SALE, '
              +'         d.AMT_VAT, '
              +'         d.AMT_SOON, '
              +'         g.CD_MENU as LINK '
              +'from     MS_MENU       as g inner join '
              +'        (select b.CD_MENU_HEAD as CD_MENU, '
              +'                Sum(a.QTY_SALE) as QTY_SALE, '
              +'                Sum(a.AMT_SALE+a.AMT_SERVICE) as AMT_TOT, '
              +'                Sum(a.AMT_SERVICE) as AMT_SERVICE, '
              +'                Sum(a.DC_TOT)   as AMT_DC, '
              +'                Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE, '
              +'                Sum(a.AMT_VAT) as AMT_VAT, '
              +'                Sum(a.AMT_SALE - a.DC_TOT - a.AMT_VAT) as AMT_SOON '
              +'           from SL_SALE_D_SUM as a inner join  '
              +'                MS_MENU       as b on b.CD_HEAD  = a.CD_HEAD '
              +'                                  and b.CD_STORE = a.CD_STORE '
              +'                                  and b.CD_MENU  = a.CD_MENU '
              +'          where a.CD_HEAD  =:P0 '
              +'            and a.CD_STORE =:P1 '
              +'            and a.YMD_SALE between :P2 and :P3 '
              +'          group by b.CD_MENU_HEAD '
              +'         ) as d on d.CD_MENU = g.CD_MENU left outer join '
              +'         MS_MENU_CLASS as c on c.CD_HEAD  = g.CD_HEAD '
              +'                           and c.CD_STORE = g.CD_STORE '
              +'                           and c.CD_CLASS = left(g.CD_CLASS,2) '
              +'where    g.CD_HEAD  =:P0 '
              +'  and    g.CD_STORE =:P1 '
              +'  and   (g.CD_MENU like ConCat(:P4,''%'') or g.NM_MENU like ConCat(''%'',:P4,''%'') ) '
              +'order by g.CD_MENU',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);

      SetQuery('select b.CD_MENU_HEAD as CD_MENU, '
              +'       ConCat(Left(a.YMD_SALE,4),''-'',SubStr(a.YMD_SALE,5,2)) as YM_SALE, '
              +'       Sum(a.QTY_SALE) as QTY_SALE, '
              +'       Sum(a.AMT_SALE+a.AMT_SERVICE) as AMT_TOT, '
              +'       Sum(a.AMT_SERVICE) as AMT_SERVICE, '
              +'       Sum(a.DC_TOT)   as AMT_DC, '
              +'       Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE, '
              +'       Sum(a.AMT_VAT) as AMT_VAT, '
              +'       Sum(a.AMT_SALE - a.DC_TOT - a.AMT_VAT) as AMT_SOON, '
              +'       b.CD_MENU_HEAD as LINK '
              +'  from SL_SALE_D_SUM as a inner join  '
              +'       MS_MENU       as b on b.CD_HEAD  = a.CD_HEAD '
              +'                         and b.CD_STORE = a.CD_STORE '
              +'                         and b.CD_MENU  = a.CD_MENU '
              +' where a.CD_HEAD  =:P0 '
              +'   and a.CD_STORE =:P1 '
              +'   and a.YMD_SALE between :P2 and :P3 '
              +' group by b.CD_MENU_HEAD, Left(a.YMD_SALE,6) '
              +' order by 1,2 ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)],1);
    end
    else
    begin
      SetQuery('select   c.NM_CLASS, '
              +'         d.CD_MENU, '
              +'         g.NM_MENU, '
              +'         d.QTY_SALE, '
              +'         d.AMT_TOT, '
              +'         d.AMT_SERVICE, '
              +'         d.AMT_DC, '
              +'         d.AMT_SALE, '
              +'         d.AMT_VAT, '
              +'         d.AMT_SOON, '
              +'         g.CD_MENU as LINK '
              +'from     MS_MENU       as g inner join '
              +'        (select b.CD_MENU_HEAD as CD_MENU, '
              +'                Sum(a.QTY_SALE) as QTY_SALE, '
              +'                Sum(a.AMT_SALE+a.AMT_SERVICE) as AMT_TOT, '
              +'                Sum(a.AMT_SERVICE) as AMT_SERVICE, '
              +'                Sum(a.DC_TOT)   as AMT_DC, '
              +'                Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE, '
              +'                Sum(a.AMT_VAT) as AMT_VAT, '
              +'                Sum(a.AMT_SALE - a.DC_TOT - a.AMT_VAT) as AMT_SOON '
              +'           from SL_SALE_D_SUM as a inner join  '
              +'                MS_MENU       as b on b.CD_HEAD  = a.CD_HEAD '
              +'                                  and b.CD_STORE = a.CD_STORE '
              +'                                  and b.CD_MENU  = a.CD_MENU '
              +'          where a.CD_HEAD  =:P0 '
              +'            and a.YMD_SALE between :P2 and :P3 '
              +'          group by b.CD_MENU_HEAD '
              +'         ) as d on d.CD_MENU = g.CD_MENU left outer join '
              +'         MS_MENU_CLASS as c on c.CD_HEAD  = g.CD_HEAD '
              +'                           and c.CD_STORE = g.CD_STORE '
              +'                           and c.CD_CLASS = left(g.CD_CLASS,2) '
              +'where    g.CD_HEAD  =:P0 '
              +'  and    g.CD_STORE =:P1 '
              +'  and   (g.CD_MENU like ConCat(:P4,''%'') or g.NM_MENU like ConCat(''%'',:P4,''%'') ) '
              +'order by g.CD_MENU',
               [HeadStoreCode,
                StandardStore,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);

      SetQuery('select b.CD_MENU_HEAD as CD_MENU, '
              +'       ConCat(Left(a.YMD_SALE,4),''-'',SubStr(a.YMD_SALE,5,2)) as YM_SALE, '
              +'       Sum(a.QTY_SALE) as QTY_SALE, '
              +'       Sum(a.AMT_SALE+a.AMT_SERVICE) as AMT_TOT, '
              +'       Sum(a.AMT_SERVICE) as AMT_SERVICE, '
              +'       Sum(a.DC_TOT)   as AMT_DC, '
              +'       Sum(a.AMT_SALE - a.DC_TOT) as AMT_SALE, '
              +'       Sum(a.AMT_VAT) as AMT_VAT, '
              +'       Sum(a.AMT_SALE - a.DC_TOT - a.AMT_VAT) as AMT_SOON, '
              +'       b.CD_MENU_HEAD as LINK '
              +'  from SL_SALE_D_SUM as a inner join  '
              +'       MS_MENU       as b on b.CD_HEAD  = a.CD_HEAD '
              +'                         and b.CD_STORE = a.CD_STORE '
              +'                         and b.CD_MENU  = a.CD_MENU '
              +' where a.CD_HEAD  =:P0 '
              +'   and a.YMD_SALE between :P1 and :P2 '
              +' group by b.CD_MENU_HEAD, Left(a.YMD_SALE,6) '
              +' order by 1,2 ',
               [HeadStoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)],1);
    end;
  end;
  inherited;

  Result := GridDBTableView.DataController.RecordCount > 0;
end;

procedure TAnalysisClassByMenuSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
end;

procedure TAnalysisClassByMenuSaleShowForm.FormShow(Sender: TObject);
begin
  inherited;
  ConditionToolBarFromDateEdit.Date := IncYear(Now(),-1);
end;

end.
