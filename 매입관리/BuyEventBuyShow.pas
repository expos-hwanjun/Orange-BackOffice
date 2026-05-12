unit BuyEventBuyShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  Menus, ImgList, AdvToolBar, AdvToolBarStylers, ExtCtrls, Uni, DB,
  MemDS, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, StrUtils, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPScxEditorProducers,
  dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxExtEditorProducers;

type
  TBuyEventBuyShowForm = class(TInheritShowForm)
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableViewColumn12: TcxGridColumn;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  BuyEventBuyShowForm: TBuyEventBuyShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TBuyEventBuyShowForm.FormCreate(Sender: TObject);
var
  vCodeData : PStrPointer;
  vEventName :String;
begin
  inherited;

  PrintMode   := pmPreviewExcel;
  DefaultDate := ddLastMonth;

  // 행사 목록을 불러와 조건 콤보박스에 넣는다
  New(vCodeData);
  vCodeData^.Data := EmptyStr;
  ConditionToolBarComboBox.Properties.Items.AddObject('[전제 행사]',  TObject(vCodeData));
  OpenQuery('select   NO_SPC, '
           +'         NM_SPC, '
           +'         DT_FROM, '
           +'         DT_TO, '
           +'         YN_USE '
           +'from     MS_SPC_H '
           +'where    CD_STORE  = :P0 '
           +'  and    YN_USE = ''Y'' '
           +'  and    DS_SPC in ('''+valGoodsDCType+''','''+valClassDCType+''','''+valCompanyDCType+''') '
           +'order by NO_SPC, NM_SPC',
            [StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCodeData);
      vCodeData^.Data := Query.Fields[0].AsString;
      if FormatDateTime('yyyymmdd', now()) > Query.Fields[3].AsString  then
        vEventName := Query.Fields[1].AsString+' [종료행사]'
      else if FormatDateTime('yyyymmdd', now()) < Query.Fields[2].AsString  then
        vEventName := Query.Fields[1].AsString+' [예정행사]'
      else if Query.Fields[4].AsString = 'N' then
        vEventName := Query.Fields[1].AsString+' [취소행사]'
      else
        vEventName := Query.Fields[1].AsString+' [진행행사]';

      ConditionToolBarComboBox.Properties.Items.AddObject(vEventName, TObject(vCodeData));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarComboBox.ItemIndex := 0;
end;

function TBuyEventBuyShowForm.DoSearch:Boolean;
var vCode :String;
begin
  inherited;
  vCode := PStrPointer(ConditionToolBarComboBox.Properties.Items.Objects[ConditionToolBarComboBox.ItemIndex]).Data;
  if Grid.ActiveLevel = GridLevel then
  begin
    if vCode = EmptyStr then
    begin
      OpenQuery('select t.NM_TRDPL, '
               +'       b.CD_GOODS, '
               +'       g.NM_GOODS, '
               +'       g.NM_SPEC, '
               +'       b.QTY_BUY, '
               +'       b.PR_BUY, '
               +'       b.AMT_DUTY + b.AMT_DUTYFREE as AMT_NET, '
               +'       b.AMT_TAX, '
               +'       b.AMT_BUY '
               +'  from SL_BUY_D b inner join '
               +'       MS_GOODS g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and (g.CD_GOODS like ''%''+:P3+''%'' or g.NM_GOODS like ''%''+:P3+''%'' or g.NM_GOODS_SHORT like ''%''+:P3+''%'') inner join '
               +'       MS_TRD   t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
               +' where b.CD_STORE = :P0 '
               +'   and b.YMD_BUY between :P1 and :P2 '
               +'   and b.NO_SPC <> '''' '
               +' order by t.NM_TRDPL, b.CD_GOODS ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);
      DM.ReadQuery(Query, GridTableView);
    end
    else
    begin
      OpenQuery('select t.NM_TRDPL, '
               +'       b.CD_GOODS, '
               +'       g.NM_GOODS, '
               +'       g.NM_SPEC, '
               +'       b.QTY_BUY, '
               +'       b.PR_BUY, '
               +'       b.AMT_DUTY + b.AMT_DUTYFREE as AMT_NET, '
               +'       b.AMT_TAX, '
               +'       b.AMT_BUY '
               +'  from SL_BUY_D b inner join '
               +'       MS_GOODS g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and (g.CD_GOODS like ''%''+:P3+''%'' or g.NM_GOODS like ''%''+:P3+''%'' or g.NM_GOODS_SHORT like ''%''+:P3+''%'') inner join '
               +'       MS_TRD   t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
               +' where b.CD_STORE = :P0 '
               +'   and b.YMD_BUY between :P1 and :P2 '
               +ifThen(vCode=EmptyStr, ' and b.NO_SPC <> '''' ', 'and b.NO_SPC = '''+vCode+''' ')
               +' order by t.NM_TRDPL, b.CD_GOODS ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);
      DM.ReadQuery(Query, GridTableView);
    end;
    Result := GridTableView.DataController.RecordCount > 0;
  end
  else
  begin
    if vCode = EmptyStr then
    begin
      OpenQuery('select dbo.StoDW(b.YMD_BUY) as YMD_BUY, '
               +'       Max(t.NM_TRDPL) as NM_TRDPL, '
               +'       Max(b.CD_GOODS) as CD_GOODS, '
               +'       Max(g.NM_GOODS) as NM_GOODS, '
               +'       Max(g.NM_SPEC) as NM_SPEC, '
               +'       Sum(b.QTY_BUY)  as QTY_BUY, '
               +'       b.PR_BUY, '
               +'       Sum(b.AMT_DUTY + b.AMT_DUTYFREE) as AMT_NET, '
               +'       Sum(b.AMT_TAX) as AMT_TAX, '
               +'       Sum(b.AMT_BUY) as AMT_BUY '
               +'  from SL_BUY_D b inner join '
               +'       MS_GOODS g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and (g.CD_GOODS like ''%''+:P3+''%'' or g.NM_GOODS like ''%''+:P3+''%'' or g.NM_GOODS_SHORT like ''%''+:P3+''%'') inner join '
               +'       MS_TRD   t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
               +' where b.CD_STORE = :P0 '
               +'   and b.NO_SPC <> '''' '
               +'   and b.YMD_BUY between :P1 and :P2 '
               +' group by b.YMD_BUY, t.CD_TRDPL, b.PR_BUY '
               +' order by 1,2 ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);
      DM.ReadQuery(Query, GridTableView1);
    end
    else
    begin
      OpenQuery('select dbo.StoDW(b.YMD_BUY) as YMD_BUY, '
               +'       Max(t.NM_TRDPL) as NM_TRDPL, '
               +'       Max(b.CD_GOODS) as CD_GOODS, '
               +'       Max(g.NM_GOODS) as NM_GOODS, '
               +'       Max(g.NM_SPEC) as NM_SPEC, '
               +'       Sum(b.QTY_BUY)  as QTY_BUY, '
               +'       b.PR_BUY, '
               +'       Sum(b.AMT_DUTY + b.AMT_DUTYFREE) as AMT_NET, '
               +'       Sum(b.AMT_TAX) as AMT_TAX, '
               +'       Sum(b.AMT_BUY) as AMT_BUY '
               +'  from SL_BUY_D b inner join '
               +'       MS_GOODS g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS and (g.CD_GOODS like ''%''+:P3+''%'' or g.NM_GOODS like ''%''+:P3+''%'' or g.NM_GOODS_SHORT like ''%''+:P3+''%'') inner join '
               +'       MS_TRD   t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
               +' where b.CD_STORE = :P0 '
               +'   and b.YMD_BUY between :P1 and :P2 '
               +'   and b.NO_SPC <> '''' '
               +'   and b.NO_SPC = '''+vCode+''' '
               +' group by b.YMD_BUY, t.CD_TRDPL, b.PR_BUY '
               +' order by 1,2 ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                ConditionToolBarEdit.Text]);
      DM.ReadQuery(Query, GridTableView1);
    end;
    Result := GridTableView1.DataController.RecordCount > 0;
  end;

end;
end.
