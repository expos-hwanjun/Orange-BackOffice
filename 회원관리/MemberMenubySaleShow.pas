unit MemberMenubySaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit, cxButtonEdit, StrUtils, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TMemberMenuBySaleShowForm = class(TInheritShowForm)
    ConditionToolBarButtonEdit: TcxButtonEdit;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewTaxAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridLevel2: TcxGridLevel;
    GridTableView2: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView2Column1: TcxGridColumn;
    GridTableView2Column2: TcxGridColumn;
    GridTableView2Column3: TcxGridColumn;
    GridTableView2Column4: TcxGridColumn;
    GridTableView2Column6: TcxGridColumn;
    GridTableView2SalePrice: TcxGridColumn;
    GridTableView2Column8: TcxGridColumn;
    GridTableView2Column9: TcxGridColumn;
    GridTableView2Column10: TcxGridColumn;
    ConditionGoodsNameLabel: TcxLabel;
    procedure ConditionToolBarButtonEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionToolBarButtonEditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
  private
    SearchMember :String;
    SearchDate  :String;
    function  SearchGoods(aGoods: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberMenuBySaleShowForm: TMemberMenuBySaleShowForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

procedure TMemberMenuBySaleShowForm.ButtonToolBarSearchButtonClick(
  Sender: TObject);
begin
  SearchMember := EmptyStr;
  SearchDate    := EmptyStr;
  inherited;

end;

procedure TMemberMenuBySaleShowForm.ConditionToolBarButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SearchGoods(ConditionToolBarButtonEdit.Text) <> EmptyStr then
  begin
    DoSearch;
  end;
end;

procedure TMemberMenuBySaleShowForm.ConditionToolBarButtonEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (Sender = ConditionToolBarButtonEdit) and (ConditionGoodsNameLabel.Caption <> EmptyStr) and
          ((GetOnlyNumber(ConditionToolBarButtonEdit.EditingText) <> ConditionToolBarButtonEdit.EditingText) or (ConditionToolBarButtonEdit.Text = EmptyStr) ) then
  begin
    ConditionGoodsNameLabel.Caption := EmptyStr;
  end;
end;

procedure TMemberMenuBySaleShowForm.ConditionToolBarButtonEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vCode, vName :String;
begin
  inherited;
  if DisplayValue <> EmptyStr then
    try
      OpenQuery('select   CD_MENU, '
               +'         NM_MENU '
               +'  from   MS_MENU '
               +' where   CD_HEAD  =:P0 '
               +'   and   CD_STORE =:P1 '
               +'   and  (CD_MENU = :P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
               +'   and   YN_USE = ''Y'' '
               +' order by NM_MENU',
                [HeadStoreCode,
                 StoreCode,
                 DisplayValue]);
      if not Query.Eof then
      begin
        // 일단 첫번째 값을 받아 놓는다
        vCode           := Query.Fields[0].AsString;
        vName           := Query.Fields[1].AsString;
        // 쿼리 다음 줄로 이동해 본다
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue                    := vCode;
          ConditionGoodsNameLabel.Caption := vName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
        begin
          DisplayValue := SearchGoods(DisplayValue);
        end;
      end
      else DisplayValue := SearchGoods(DisplayValue);
    finally
      FinishQuery;
    end;
end;

function TMemberMenuBySaleShowForm.DoSearch: Boolean;
begin
  Result := false;
  if ConditionToolBarButtonEdit.Text = EmptyStr then
  begin
    MsgBox('조회 할 메뉴를 입력하십시오.');
    Result := true;
    Exit;
  end;
  ReportSubTitle := '조회메뉴 : '+ConditionGoodsNameLabel.Caption+'['+ConditionToolBarButtonEdit.Text+']';
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select t.CD_MEMBER, '
             +'       Max(t.NM_MEMBER) as NM_MEMBER, '
             +'       Sum(d.QTY_SALE) as QTY_SALE, '
             +'       SUM(d.AMT_SALE-d.DC_TOT-d.AMT_VAT) as AMT_NET, '
             +'       SUM(d.AMT_VAT) as AMT_TAX, '
             +'       Sum(d.AMT_BUY)  as AMT_BUY, '
             +'       SUM(d.AMT_SALE-d.DC_TOT) as AMT_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
             +'                   on h.CD_HEAD  = d.CD_HEAD '
             +'                  and h.CD_STORE = d.CD_STORE '
             +'                  and h.YMD_SALE = d.YMD_SALE '
             +'                  and h.NO_POS   = d.NO_POS '
             +'                  and h.NO_RCP   = d.NO_RCP inner join '
             +'       MS_MEMBER t on t.CD_HEAD  = h.CD_HEAD '
             +'                  and t.CD_STORE = :P5 '
             +'                  and h.CD_MEMBER = t.CD_MEMBER '
             +' where h.CD_HEAD  =:P0 '
             +'   and h.CD_STORE =:P1 '
             +'   and h.YMD_SALE between :P2 and :P3 '
             +'   and h.DS_SALE <> ''V'' '
             +'   and d.CD_MENU =:P4  '
             +' group by t.CD_MEMBER '
             +' order by t.CD_MEMBER ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarButtonEdit.Text,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridTableView);

    // 푸터 이익률을 구한다
    if (GridTableView.DataController.Summary.FooterSummaryValues[2] <> null) and
       (GridTableView.DataController.Summary.FooterSummaryValues[7] <> 0) then
      GridTableView.DataController.Summary.FooterSummaryValues[6] := FormatFloat('0.00%', CalcSaleProfitRate(GridTableView.DataController.Summary.FooterSummaryValues[7],GridTableView.DataController.Summary.FooterSummaryValues[2]))
    else
      GridTableView.DataController.Summary.FooterSummaryValues[6] := EmptyStr;

  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    OpenQuery('select StoDW(d.YMD_SALE) as YMD_SALE, '
             +'       t.CD_MEMBER, '
             +'       Max(t.NM_MEMBER) as NM_MEMBER, '
             +'       Sum(d.QTY_SALE) as QTY_SALE, '
             +'       SUM(d.AMT_SALE-d.DC_TOT-d.AMT_VAT) as AMT_NET, '
             +'       SUM(d.AMT_VAT) as AMT_TAX, '
             +'       SUM(d.AMT_SALE-d.DC_TOT) as AMT_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
             +'                   on h.CD_HEAD  = d.CD_HEAD '
             +'                  and h.CD_STORE = d.CD_STORE '
             +'                  and h.YMD_SALE = d.YMD_SALE '
             +'                  and h.NO_POS   = d.NO_POS '
             +'                  and h.NO_RCP   = d.NO_RCP inner join '
             +'       MS_MEMBER t on t.CD_HEAD  = h.CD_HEAD '
             +'                  and t.CD_STORE = :P5 '
             +'                  and h.CD_MEMBER = t.CD_MEMBER '
             +' where h.CD_HEAD  =:P0 '
             +'   and h.CD_STORE =:P1 '
             +'   and h.YMD_SALE between :P2 and :P3 '
             +'   and h.DS_SALE <> ''V'' '
             +'   and d.CD_MENU =:P4  '
             +Ifthen(SearchMember <> EmptyStr, ' and h.CD_MEMBER = '''+SearchMember+''' ', '')
             +' group by d.YMD_SALE, t.CD_MEMBER '
             +' order by d.YMD_SALE, t.CD_MEMBER ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarButtonEdit.Text,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridTableView1);
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    if SearchDate <> EmptyStr then
    begin
      ConditionToolBarFromDateEdit.Text := SearchDate;
      ConditionToolBarToDateEdit.Text   := SearchDate;
    end;
    OpenQuery('select StoDW(d.YMD_SALE) as YMD_SALE, '
             +'       ConCat(d.NO_POS,''-'',d.NO_RCP) as NO_RCP, '
             +'       t.CD_MEMBER, '
             +'       t.NM_MEMBER as NM_MEMBER, '
             +'       d.QTY_SALE, '
             +'       case when g.DS_MENU_TYPE = ''W'' then DivFlt(d.AMT_SALE, DivFlt(d.QTY_SALE,100)) else d.PR_SALE end as PR_SALE, '
             +'       d.AMT_SALE-d.DC_TOT-d.AMT_VAT as AMT_NET, '
             +'       d.AMT_VAT as AMT_TAX, '
             +'       d.AMT_SALE-d.DC_TOT as AMT_SALE '
             +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
             +'                   on h.CD_HEAD  = d.CD_HEAD '
             +'                  and h.CD_STORE = d.CD_STORE '
             +'                  and h.YMD_SALE = d.YMD_SALE '
             +'                  and h.NO_POS   = d.NO_POS '
             +'                  and h.NO_RCP   = d.NO_RCP inner join '
             +'       MS_MEMBER t on t.CD_HEAD  = h.CD_HEAD '
             +'                  and t.CD_STORE = :P5'
             +'                  and h.CD_MEMBER = t.CD_MEMBER left outer join '
             +'       MS_MENU   g on g.CD_HEAD  = h.CD_HEAD '
             +'                  and g.CD_STORE = h.CD_STORE '
             +'                  and g.CD_MENU  = d.CD_MENU '
             +' where h.CD_HEAD  =:P0 '
             +'   and h.CD_STORE =:P1 '
             +'   and h.YMD_SALE between :P2 and :P3 '
             +'   and h.DS_SALE <> ''V'' '
             +'   and d.CD_MENU =:P4  '
             +Ifthen(SearchMember <> EmptyStr, ' and h.CD_MEMBER = '''+SearchMember+''' ', '')
             +' order by d.YMD_SALE, h.NO_POS, h.NO_RCP, t.CD_MEMBER ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarButtonEdit.Text,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridTableView2);
  end;
end;

procedure TMemberMenuBySaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TMemberMenuBySaleShowForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SearchDate := LeftStr(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, 0],10);
  Grid.ActiveLevel := GridLevel2;
  DoSearch;
end;

procedure TMemberMenuBySaleShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SearchMember   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index];
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

function TMemberMenuBySaleShowForm.SearchGoods(aGoods: string): string;
begin
  Result := EmptyStr;

  with THelpForm.Create(Self) do
    try
      Caption := '메뉴 조회';
      GridTableViewCode.Caption  := '메뉴코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '메뉴이름';
      GridTableViewName1.Width   := 310;

      SearchText := aGoods;
      SQLText    := 'select   CD_MENU, '
                   +'         NM_MENU '
                   +'  from   MS_MENU '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and  (CD_MENU=:P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
                   +'   and   YN_USE = ''Y'' '
                   +' order by NM_MENU';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        ConditionToolBarButtonEdit.Text   := Code;
        ConditionGoodsNameLabel.Caption   := Names[0];
        ConditionGoodsNameLabel.Refresh;
        Result    := Code;
      end;
    finally
      Free;
    end;
end;

end.
