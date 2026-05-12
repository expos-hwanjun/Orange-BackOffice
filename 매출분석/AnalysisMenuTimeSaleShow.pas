unit AnalysisMenuTimeSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit, cxButtonEdit, cxProgressBar, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisMenuTimeSaleShowForm = class(TInheritShowForm)
    GridTableViewTimeZone: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    ConditionToolBarButtonEdit: TcxButtonEdit;
    GridTableViewRate: TcxGridColumn;
    procedure ConditionToolBarButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionToolBarButtonEditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarButtonEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    function  SearchGoods(aGoods: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisMenuTimeSaleShowForm: TAnalysisMenuTimeSaleShowForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

procedure TAnalysisMenuTimeSaleShowForm.ConditionToolBarButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SearchGoods(ConditionToolBarButtonEdit.Text) <> EmptyStr then
  begin
    DoSearch;
  end;
end;

procedure TAnalysisMenuTimeSaleShowForm.ConditionToolBarButtonEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (Sender = ConditionToolBarButtonEdit) and (ConditionToolBarEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(ConditionToolBarButtonEdit.EditingText) <> ConditionToolBarButtonEdit.EditingText) or (ConditionToolBarButtonEdit.Text = EmptyStr) ) then
  begin
    ConditionToolBarEdit.Clear;
  end;
end;

procedure TAnalysisMenuTimeSaleShowForm.ConditionToolBarButtonEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vCode, vName :String;
begin
  inherited;
  if DisplayValue <> EmptyStr then
    try
      OpenQuery('select   CD_MENU, '
               +'         NM_MENU '
               +'from     MS_MENU '
               +'where    CD_HEAD  =:P0 '
               +'  and    CD_STORE =:P1 '
               +'  and   (CD_MENU=:P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
               +'  and    YN_USE = ''Y'' '
               +'order by NM_MENU',
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
          ConditionToolBarEdit.Text       := vName;
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

function TAnalysisMenuTimeSaleShowForm.DoSearch: Boolean;
var vIndex :Integer;
begin
  if ConditionToolBarButtonEdit.Text = EmptyStr then
  begin
    MsgBox('조회 할 메뉴를 선택하세요');
    Exit;
  end;
  OpenQuery('select t.NM_CODE1 as TIME_ZONE, '
           +'       Ifnull(s.QTY_SALE, 0) as QTY_SALE, '
           +'       Ifnull(s.AMT_SALE, 0) as AMT_SALE '
           +'  from MS_CODE t left outer join '
           +'      (select h.CD_TIME, '
           +'              d.CD_MENU, '
           +'              SUM(d.QTY_SALE) as QTY_SALE, '
           +'              SUM(d.AMT_SALE-d.DC_TOT) as AMT_SALE '
           +'        from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h inner join')
           +GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd')
           +'                          on d.CD_HEAD  = h.CD_HEAD '
           +'                         and d.CD_STORE = h.CD_STORE '
           +'                         and d.YMD_SALE = h.YMD_SALE '
           +'                         and d.NO_POS   = h.NO_POS '
           +'                         and d.NO_RCP   = h.NO_RCP '
           +'        where h.CD_HEAD  =:P0 '
           +'          and h.CD_STORE =:P1 '
           +'          and h.YMD_SALE between :P2 and :P3 '
           +'          and h.DS_SALE <> ''V'' '
           +'          and d.CD_MENU =:P4 '
           +'        group by h.CD_TIME, d.CD_MENU '
           +'        ) as s on s.CD_TIME = t.CD_CODE left outer join '
           +'        MS_MENU as m on m.CD_HEAD = t.CD_HEAD and m.CD_STORE = t.CD_STORE and m.CD_MENU = s.CD_MENU '
           +' where t.CD_HEAD   =:P0 '
           +'   and t.CD_STORE  =:P1 '
           +'   and t.CD_KIND   = ''15'' '
           +'   and t.DS_STATUS = ''0'' '
           +' order by t.CD_CODE, s.AMT_SALE desc ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarButtonEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);

  if (GridTableView.DataController.Summary.FooterSummaryValues[1] <> null) and
     (GridTableView.DataController.Summary.FooterSummaryValues[1] <> 0) then
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] <> null then
        GridTableView.DataController.Values[vIndex, GridTableViewRate.Index] := RoundNumber(GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] * 100 / GridTableView.DataController.Summary.FooterSummaryValues[1]);

end;

procedure TAnalysisMenuTimeSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TAnalysisMenuTimeSaleShowForm.SearchGoods(aGoods: string): string;
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
      SQLText    := 'select CD_MENU, '
                   +'       NM_MENU '
                   +'  from MS_MENU '
                   +' where CD_HEAD  =:P0 '
                   +'   and CD_STORE =:P1 '
                   +'   and (CD_MENU =:P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
                   +'   and YN_USE = ''Y'' '
                   +' order by NM_MENU';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        ConditionToolBarButtonEdit.Text   := Code;
        ConditionToolBarEdit.Text   := Names[0];
        Result    := Code;
      end;
    finally
      Free;
    end;
end;

end.
