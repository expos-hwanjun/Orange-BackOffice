unit MemberDamdangSaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxCurrencyEdit, cxLabel, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, StrUtils, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TMemberDamdangSaleShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTAbleView1Column8: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    GridTableView1Column10: TcxGridColumn;
    GridTableView1Column11: TcxGridColumn;
    GridTableView1Column12: TcxGridColumn;
    GridTableView1Column13: TcxGridColumn;
    GridTableView1Column14: TcxGridColumn;
    GridTableView1Column15: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberDamdangSaleShowForm: TMemberDamdangSaleShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TMemberDamdangSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
  ConditionToolBarComboBox.Properties.Items.Add( FormatDateTime('yyyy',now()) );
  ConditionToolBarComboBox.ItemIndex := 0;
end;


procedure TMemberDamdangSaleShowForm.GridActiveTabChanged(
  Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    ConditionToolBarDateLabel.Visible    := true;
    ConditionToolBarFromDateEdit.Visible := true;
    ConditionToolBarDateToLabel.Visible  := true;
    ConditionToolBarToDateEdit.Visible   := true;
    ConditionToolbarTodayRadioButton.Visible := true;
    ConditionToolbarWeekRadioButton.Visible  := true;
    ConditionToolbarMonthRadioButton.Visible := true;

    ConditionToolBarEditLabel.Visible := false;
    ConditionToolBarComboBox.Visible  := false;
  end
  else
  begin
    ConditionToolBarDateLabel.Visible    := false;
    ConditionToolBarFromDateEdit.Visible := false;
    ConditionToolBarDateToLabel.Visible  := false;
    ConditionToolBarToDateEdit.Visible   := false;
    ConditionToolbarTodayRadioButton.Visible := false;
    ConditionToolbarWeekRadioButton.Visible  := false;
    ConditionToolbarMonthRadioButton.Visible := false;

    ConditionToolBarEditLabel.Visible := true;
    ConditionToolBarComboBox.Visible  := true;
  end;
end;

function TMemberDamdangSaleShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select t.CD_DAMDANG, '
             +'       t.NM_SAWON, '
             +'       t.NM_TEAM, '
             +'       Sum(t.AMT_SALE) as AMT_SALE, '
             +'       dbo.GetProfitRate(Sum(t.AMT_BUY), Sum(t.AMT_SALE)) as RT_PROFIT, '
             +'       Sum(t.AMT_SALE-t.AMT_BUY) as AMT_PROFIT '
             +'  from '
             +'       ( select isnull(b.CD_DAMDANG,'''') as CD_DAMDANG, '
             +'                Max(Isnull(c.NM_SAWON,''[미지정]'')) as NM_SAWON, '
             +'                (select t2.NM_CODE1 '
             +'                   from MS_SAWON t1 inner join '
             +'                        MS_CODE t2 on t1.CD_STORE = t2.CD_STORE and t1.CD_TEAM = t2.CD_CODE and t2.CD_KIND = ''03'' '
             +'                  where t1.CD_STORE = :P0 '
             +'                    and t1.CD_SAWON = b.CD_DAMDANG) as NM_TEAM, '
             +'                Sum(a.AMT_SALE) as AMT_SALE, '
             +'                Sum(a.AMT_BUY) as AMT_BUY '
             +'         from   SL_SALE_H a left outer join '
             +'                MS_MEMBER b on b.CD_STORE = :P3 and a.CD_MEMBER = b.CD_MEMBER left outer join '
             +'                MS_SAWON  c on b.CD_STORE = c.CD_STORE and b.CD_DAMDANG = c.CD_SAWON '
             +'         where  a.CD_STORE =:P0 '
             +'           and  a.YMD_SALE between :P1 and :P2 '
             +'           and  a.DS_SALE <> ''V'' '
             +'         group by b.CD_DAMDANG '
             +'         )  t '
             +'group by t.CD_DAMDANG, '
             +'         t.NM_SAWON, '
             +'         t.NM_TEAM '
             +'order by 1',
             [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                Ifthen(GetOption(257)='0', StoreCode,'0000')]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else
  begin
    OpenQuery('select isnull((select t2.NM_CODE1 '
             +'          from MS_SAWON t1 inner join '
             +'               MS_CODE t2 on t1.CD_STORE = t2.CD_STORE and t1.CD_TEAM = t2.CD_CODE and t2.CD_KIND = ''03'' '
             +'         where t1.CD_STORE = :P0 '
             +'           and t1.CD_SAWON = t.CD_DAMDANG), ''[미지정]'') as NM_TEAM, '
             +'        isnull(t.NM_SAWON,''[미지정]'') as NM_SAWON, '
             +'        SUM(AMT_SALE_TOT) as AMT_SALE_TOT, '
             +'        SUM(AMT_SALE_01) as AMT_SALE_01,   '
             +'        SUM(AMT_SALE_02) as AMT_SALE_02,   '
             +'        SUM(AMT_SALE_03) as AMT_SALE_03,   '
             +'        SUM(AMT_SALE_04) as AMT_SALE_04,   '
             +'        SUM(AMT_SALE_05) as AMT_SALE_05,   '
             +'        SUM(AMT_SALE_06) as AMT_SALE_06,   '
             +'        SUM(AMT_SALE_07) as AMT_SALE_07,   '
             +'        SUM(AMT_SALE_08) as AMT_SALE_08,   '
             +'        SUM(AMT_SALE_09) as AMT_SALE_09,   '
             +'        SUM(AMT_SALE_10) as AMT_SALE_10,   '
             +'        SUM(AMT_SALE_11) as AMT_SALE_11,   '
             +'        SUM(AMT_SALE_12) as AMT_SALE_12    '
             +' from  '
             +' 	( '
             +' 	select Isnull(b.CD_DAMDANG, '''') as CD_DAMDANG, '
             +'          Isnull(c.NM_SAWON, '''') as NM_SAWON, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''01'' then a.AMT_SALE else 0 end AMT_SALE_01, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''02'' then a.AMT_SALE else 0 end AMT_SALE_02, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''03'' then a.AMT_SALE else 0 end AMT_SALE_03, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''04'' then a.AMT_SALE else 0 end AMT_SALE_04, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''05'' then a.AMT_SALE else 0 end AMT_SALE_05, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''06'' then a.AMT_SALE else 0 end AMT_SALE_06, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''07'' then a.AMT_SALE else 0 end AMT_SALE_07, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''08'' then a.AMT_SALE else 0 end AMT_SALE_08, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''09'' then a.AMT_SALE else 0 end AMT_SALE_09, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''10'' then a.AMT_SALE else 0 end AMT_SALE_10, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''11'' then a.AMT_SALE else 0 end AMT_SALE_11, '
             +'   		   case Substring(a.YMD_SALE,5,2) when ''12'' then a.AMT_SALE else 0 end AMT_SALE_12, '
             +'   		   a.AMT_SALE as AMT_SALE_TOT '
             +'   	from SL_SALE_H a left outer join '
             +'   		   MS_MEMBER b on b.CD_STORE = :P2 and a.CD_MEMBER = b.CD_MEMBER left outer join '
             +'   		   MS_SAWON c on b.CD_STORE = c.CD_STORE and b.CD_DAMDANG = c.CD_SAWON '
             +'   	where  a.CD_STORE = :P0 '
             +'   	  and  a.YMD_SALE like :P1+''%'' '
             +'   	  and  a.DS_SALE <> ''V'' '
             +'   	) as t '
             +' group by t.CD_DAMDANG, t.NM_SAWON	',
             [StoreCode,
              ConditionToolBarComboBox.Text,
              Ifthen(GetOption(257)='0', StoreCode,'0000')]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end;
end;


end.
