unit OrderMonthByShow;

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
  cxSpinEdit, cxCurrencyEdit, AdvSplitter, SHDocVw, StrUtils, cxButtonEdit;

type
  TOrderMonthByShowForm = class(TInheritShowForm)
    YeadSpinEdit: TcxSpinEdit;
    GridTableViewYear: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn12: TcxGridColumn;
    PosSplitter: TAdvSplitter;
    ChartPanel: TPanel;
    StoreCodeEdit: TcxButtonEdit;
    StoreNameEdit: TcxTextEdit;
    GridTableViewColumn13: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
    procedure StoreCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure StoreCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure StoreCodeEditPropertiesChange(Sender: TObject);
  private
    FusionChart: TWebBrowser;
    function  SearchStore(aStore: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  OrderMonthByShowForm: TOrderMonthByShowForm;

implementation
uses
  Common, DBModule, Help;

{$R *.dfm}

{ TOrderMonthByShowForm }

procedure TOrderMonthByShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'OrderChart', 'mscombi3d', FusionChart.Hint);
end;

function TOrderMonthByShowForm.DoSearch: Boolean;
var vWhere :String;
    vChart01,
    vChart02,
    vChart03,
    vChartXml :String;
    vIndex    :Integer;
    vSaleAmt1,
    vSaleAmt2 :Integer;
begin
  if Tag = 0 then
    vWhere := Format(' and CD_STORE = ''%s'' ',[StoreCode])
  else if StoreCodeEdit.Text <> '' then
    vWhere := Format(' and CD_STORE = ''%s'' ',[StoreCodeEdit.Text])
  else
    vWhere := '';

  OpenQuery('select :P2 as YEAR, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0101'') and ConCat(:P2,''0131'') then Sum(AMT_SALE) else 0 end,0) as AMT_JAN, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0201'') and ConCat(:P2,''0231'') then Sum(AMT_SALE) else 0 end,0) as AMT_FEB, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0301'') and ConCat(:P2,''0331'') then Sum(AMT_SALE) else 0 end,0) as AMT_MAR, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0401'') and ConCat(:P2,''0431'') then Sum(AMT_SALE) else 0 end,0) as AMT_APR, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0501'') and ConCat(:P2,''0531'') then Sum(AMT_SALE) else 0 end,0) as AMT_MAY, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0601'') and ConCat(:P2,''0631'') then Sum(AMT_SALE) else 0 end,0) as AMT_JUN, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0701'') and ConCat(:P2,''0731'') then Sum(AMT_SALE) else 0 end,0) as AMT_JUL, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0801'') and ConCat(:P2,''0831'') then Sum(AMT_SALE) else 0 end,0) as AMT_AUG, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''0901'') and ConCat(:P2,''0931'') then Sum(AMT_SALE) else 0 end,0) as AMT_SEP, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''1001'') and ConCat(:P2,''1031'') then Sum(AMT_SALE) else 0 end,0) as AMT_OCT, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''1101'') and ConCat(:P2,''1131'') then Sum(AMT_SALE) else 0 end,0) as AMT_NOV, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P2,''1201'') and ConCat(:P2,''1231'') then Sum(AMT_SALE) else 0 end,0) as AMT_DEC, '
           +'       Ifnull(Sum(AMT_SALE),0) as AMT_TOT '
           +'  from OL_SALE_H '
           +' where CD_HEAD = :P0 '
           +vWhere
           +'   and YMD_SALE between ConCat(:P2,''0101'') and ConCat(:P2,''1231'') '
           +'union all '
           +'select :P1 as YEAR, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0101'') and ConCat(:P1,''0131'') then Sum(AMT_SALE) else 0 end,0) as AMT_JAN, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0201'') and ConCat(:P1,''0231'') then Sum(AMT_SALE) else 0 end,0) as AMT_FEB, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0301'') and ConCat(:P1,''0331'') then Sum(AMT_SALE) else 0 end,0) as AMT_MAR, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0401'') and ConCat(:P1,''0431'') then Sum(AMT_SALE) else 0 end,0) as AMT_APR, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0501'') and ConCat(:P1,''0531'') then Sum(AMT_SALE) else 0 end,0) as AMT_MAY, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0601'') and ConCat(:P1,''0631'') then Sum(AMT_SALE) else 0 end,0) as AMT_JUN, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0701'') and ConCat(:P1,''0731'') then Sum(AMT_SALE) else 0 end,0) as AMT_JUL, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0801'') and ConCat(:P1,''0831'') then Sum(AMT_SALE) else 0 end,0) as AMT_AUG, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''0901'') and ConCat(:P1,''0931'') then Sum(AMT_SALE) else 0 end,0) as AMT_SEP, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''1001'') and ConCat(:P1,''1031'') then Sum(AMT_SALE) else 0 end,0) as AMT_OCT, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''1101'') and ConCat(:P1,''1131'') then Sum(AMT_SALE) else 0 end,0) as AMT_NOV, '
           +'       Ifnull(case when YMD_SALE between ConCat(:P1,''1201'') and ConCat(:P1,''1231'') then Sum(AMT_SALE) else 0 end,0) as AMT_DEC, '
           +'       Ifnull(Sum(AMT_SALE),0) as AMT_TOT '
           +'  from OL_SALE_H '
           +' where CD_HEAD = :P0 '
           +vWhere
           +'   and YMD_SALE between ConCat(:P1,''0101'') and ConCat(:P1,''1231'') ',
           [HeadStoreCode,
            YeadSpinEdit.Text,
            FormatFloat('0000',YeadSpinEdit.Value-1)]);

  Result := DM.ReadQuery(Query, GridTableView);

    // 챠트로 표시
  vChartXml := '<chart rotateNames="0" baseFont="맑은 고딕" baseFontSize="11" outCnvBaseFont="맑은 고딕" outCnvBaseFontSize="12" palette="2" caption="전년대비 발주현황" '
               +'palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
               +'	showValues="1" divLineDecimalPrecision="1" limitsDecimalPrecision="1" PYAxisName="금액" SYAxisName="" formatNumberScale="0" SYAxisCaption="">';
  vChart01 := ' <categories>  ';
  vChart02 := Format(' <dataset seriesName="%s년" renderAs="Line" parentYAxis="S">  ',[FormatFloat('0000',YeadSpinEdit.Value-1)]);
  vChart03 := Format(' <dataset seriesName="%s년" renderAs="Bar"  parentYAxis="S">  ',[YeadSpinEdit.Text]);

  vSaleAmt1  := 0;
  vSaleAmt2 := 0;
  for vIndex := 1 to 12 do
  begin
    vChart01 := vChart01 + Format('  <category label="%s" />  ',[GridTableView.Columns[vIndex].Caption]);
    vSaleAmt1 := NVL(GridTableView.DataController.Values[0, vIndex],0);
    vSaleAmt2 := NVL(GridTableView.DataController.Values[1, vIndex],0);

    vChart02 := vChart02 + Format('  <set value="%d" />  ',[vSaleAmt1]);
    vChart03 := vChart03 + Format('  <set value="%d" />  ',[vSaleAmt2]);
  end;

//  vChart01 := vChart01 +  Format(' <category label="%s" />  ',[FormatDateTime('yyyy/mm/dd',now())]) + ' </categories>  ';
  vChart01 := vChart01 +  ' </categories>  ';
  vChart02 := vChart02 +  Format(' <set value="%s" />  ',[FormatFloat(',0',GridTableView.DataController.Values[0, 12])])  + ' </dataset> ';
  vChart03 := vChart03 +  Format(' <set value="%s" />  ',[FormatFloat(',0',GridTableView.DataController.Values[0, 12])]) +  ' </dataset> ';

  vChartXml := vChartXml + vChart01 + vChart03 + vChart02 + '</chart>';;

  ShowChart(FusionChart, 'OrderChart', 'mscombi3d', vChartXml);
end;

procedure TOrderMonthByShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  YeadSpinEdit.Text := FormatDateTime('yyyy',Now());

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;

procedure TOrderMonthByShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

function TOrderMonthByShowForm.SearchStore(aStore: string): string;
begin
  Result := EmptyStr;

  // 거래처 조회 폼을 보여준다
  with THelpForm.Create(Self) do
    try
      Caption := '매장 조회';
      GridTableViewCode.Caption  := '매장 코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '매장 이름';
      GridTableViewName1.Width   := 340;

      SearchText := aStore;
      SQLText    := 'select    CD_STORE, '
                   +'          NM_STORE '
                   +' from     MS_STORE '
                   +' where    CD_HEAD   =:P0 '
                   +'   and    CD_STORE  <> ''00000000'' '
                   +'   and   (CD_STORE  =:P2 or NM_STORE like ConCat(''%'',:P2,''%'')) '
                   +'   and    YN_USE = ''Y'' '
                   +' order by CD_STORE ';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result                 := Code;
        StoreCodeEdit.Text     := Code;
        StoreCodeEdit.TextHint := Code;
        StoreNameEdit.Text     := Names[0];
      end;
    finally
      Free;
    end;

end;

procedure TOrderMonthByShowForm.StoreCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if StoreCodeEdit.Text <> EmptyStr then
    StoreCodeEdit.Text := SearchStore(StoreCodeEdit.Text)
  else
    StoreCodeEdit.Text := SearchStore;
end;

procedure TOrderMonthByShowForm.StoreCodeEditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = StoreCodeEdit) and (StoreCodeEdit.Text <> StoreCodeEdit.TextHint) then
  begin
    StoreNameEdit.Text := EmptyStr;
    GridTableView.DataController.RecordCount := 0;
  end;
end;

procedure TOrderMonthByShowForm.StoreCodeEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vCode, vName  : string;
begin
  inherited;
  if Sender = StoreCodeEdit then
  begin
    if DisplayValue <> EmptyStr then
      try
        OpenQuery('select CD_STORE, '
                 +'       NM_STORE '
                 +'  from MS_STORE  '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE <> :P1 '
                 +'   and (CD_STORE =:P2 or NM_STORE like ConCat(''%'',:P2,''%'')) '
                 +'   and DS_STATUS = ''0'' '
                 +' order by CD_STORE',
                 [HeadStoreCode,
                  StandardStore,
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
            StoreCodeEdit.Text       := vCode;
            DisplayValue             := vCode;
            StoreNameEdit.Text       := vName;
          end
          // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
          else
          begin
            FinishQuery;
            DisplayValue := SearchStore(DisplayValue);
          end;
        end
        else
        begin
          ErrorText := Replace(ConditionToolBarEditLabel.Caption)+msgMustInput;
          Error     := true;
          Exit;
        end;
      finally
        FinishQuery;
      end;
  end;

end;

end.
