// 실사 등록 (완료)

unit StockSurveyBatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, StdCtrls, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, tmsXLSAdapter, cxGridExportLink, ShellAPI,
  Vcl.Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers,  dxPSCore, dxPScxCommon,
  cxCheckBox, Vcl.ImgList, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockSurveyBatchForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSurveyQty: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridLevel: TcxGridLevel;
    ButtonToolBarPrintButton: TAdvGlowMenuButton;
    ButtonToolBarPrintButtonPopupMenu: TPopupMenu;
    ButtonToolBarPrintButtonPopupMenuPreview: TMenuItem;
    ButtonToolBarPrintButtonPopupMenuExcel: TMenuItem;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    GridTableViewGoodsType: TcxGridColumn;
    ButtonToolBarPrintButtonImageList: TImageList;
    GridTableViewRowState: TcxGridColumn;
    Del_Timer: TTimer;
    cxLabel1: TcxLabel;
    GridTableViewDeviceNo: TcxGridColumn;
    ButtonToolBarCancelButton: TAdvGlowButton;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;

    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarExcelButtonClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuExcelClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewGoodsCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Del_TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridTableViewCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);

  private
    LinkRowIndex :Integer;
    procedure ButtonEnable(aValue:Boolean);
  protected
    function DoSearch:Boolean; override;
    function DoSave: Boolean; override;
    function DoDelete: Boolean; override;
  end;

var
  StockSurveyBatchForm: TStockSurveyBatchForm;

implementation

uses
  Common, DBModule, ExcelLoad, Main, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TStockSurveyBatchForm.FormCreate(Sender: TObject);
begin
  inherited;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;

procedure TStockSurveyBatchForm.FormShow(Sender: TObject);
var
  vCompanyCode: PStrPointer;
begin
  inherited;
  // 콤보박스에 거래처 없음 추가
  New(vCompanyCode);
  vCompanyCode^.Data := EmptyStr;
  ConditionToolBarComboBox.Properties.Items.AddObject('( 전체 )', TObject(vCompanyCode));
  New(vCompanyCode);
  vCompanyCode^.Data := '000000';
  ConditionToolBarComboBox.Properties.Items.AddObject('(거래처없음)', TObject(vCompanyCode));

  // 거래처 테이블에서 거래처 목록 불러와서 콤보박스에 추가
  OpenQuery('select CD_TRDPL, '
           +'       NM_TRDPL '
           +'  from MS_TRD '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and DS_TRDPL = ''B'' '
           +' order by NM_TRDPL',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCompanyCode);
      vCompanyCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCompanyCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarComboBox.ItemIndex := 0;

  ConditionToolBarFromDateEdit.Date := now;
end;

procedure TStockSurveyBatchForm.GridTableViewCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := true;
end;

procedure TStockSurveyBatchForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate
  else if ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] = EmptyStr then
    ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsInsert;

  ButtonEnable(false);
end;

procedure TStockSurveyBatchForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsType.Index] = 'W' then
  begin
    TcxCustomCurrencyEditProperties(GridTableViewSurveyQty.Properties).DecimalPlaces := 2;
    TcxCustomCurrencyEditProperties(GridTableViewSurveyQty.Properties).EditFormat    := ',0.##';
  end
  else
  begin
    TcxCustomCurrencyEditProperties(GridTableViewSurveyQty.Properties).DecimalPlaces := 0;
    TcxCustomCurrencyEditProperties(GridTableViewSurveyQty.Properties).EditFormat    := ',0';
  end;
end;

procedure TStockSurveyBatchForm.GridTableViewGoodsCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;

end;


//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockSurveyBatchForm.DoSearch: Boolean;
var
  vCompanyCode: String;
  vWhere:String;
begin
  Result := false;

  vCompanyCode := GetStrPointerData(ConditionToolBarComboBox);
  if vCompanyCode = EmptyStr then
    vWhere := ''
  else if vCompanyCode = '000000' then
    vWhere := '  and    ifnull(a.CD_TRDPL, '''') = '''''
  else
    vWhere := '  and    ifnull(a.CD_TRDPL, '''') = '''+vCompanyCode+'''';


  OpenQuery('select   a.CD_MENU as CD_GOODS, '
           +'         a.NM_MENU, '
           +'         a.NM_SPEC, '
           +'         t.QTY_STOCK, '
           +'         a.PR_BUY, '
           +'         a.PR_SALE, '
           +'         ''00'' as NO_POS, '
           +'         a.DS_MENU_TYPE, '
           +'         ''rsNormal'' as ROW_STATE '
           +'  from   MS_MENU       as a left outer join '
           +'        (select CD_GOODS, '
           +'                Sum(Ifnull(QTY_BASE,0)+Ifnull(QTY_STOCK,0)) as QTY_STOCK '
           +'           from '
           +'                (select CD_GOODS, '
           +'                        Ifnull(QTY_BASE,0) as QTY_BASE, '
           +'                        0 as QTY_STOCK '
           +'                   from SL_STOCK_MONTH  '
           +'                  where CD_HEAD  =:P0 '
           +'                    and CD_STORE =:P1 '
           +'                    and YM_STOCK =Left(:P2, 6) '
           +'                 union all '
           +'                 select CD_GOODS, '
           +'                        0, '
           +'                        Sum(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) '
           +'                   from SL_STOCK_DAY '
           +'                  where CD_HEAD  =:P0 '
           +'                    and CD_STORE =:P1 '
           +'                    and YMD_STOCK between ConCat(Left(:P2,6),''01'') and :P2 '
           +'                  group by CD_GOODS '
           +'                 ) as t '
           +'           group by CD_GOODS '
           +'         ) as t on t.CD_GOODS = a.CD_MENU '
           +' where   a.CD_HEAD  =:P0 '
           +'   and   a.CD_STORE =:P1 '
           + vWhere
           +'   and   a.YN_USE = ''Y'' '
           +'   and   a.DS_STOCK = ''1'' '
           +'order by a.CD_MENU',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
  ButtonToolBarPrintButton.Enabled := Result;

  Grid.SetFocus;
  if GridTableView.DataController.RecordCount > 0 then
  begin
    GridTableView.Controller.FocusedRecordIndex := 0;
    GridTableView.Controller.FocusedColumnIndex := GridTableViewSurveyQty.Index;
  end;
  ButtonEnable(false);
end;
//------------------------------------------------------------------------------
// 저장
procedure TStockSurveyBatchForm.ButtonEnable(aValue: Boolean);
begin
  if aValue then
  begin
    ConditionToolBarFromDateEdit.Enabled := true;
    ButtonToolBarDeleteButton.Enabled    := false;
    ButtonToolBarSaveButton.Enabled      := false;
    ButtonToolBarPrintButton.Enabled     := false;
    ButtonToolBarCancelButton.Enabled    := false;
    GridTableView.DataController.RecordCount := 0;
    ConditionToolBarComboBox.ItemIndex   := 0;
  end
  else
  begin
    ConditionToolBarFromDateEdit.Enabled := false;
    ButtonToolBarCancelButton.Enabled    := true;
  end;
end;

procedure TStockSurveyBatchForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재작업을 취소하시겠습니까?') then Exit;

  ButtonEnable(true);
end;

procedure TStockSurveyBatchForm.ButtonToolBarExcelButtonClick(Sender: TObject);
var
  vName      : array of string;
  vNotNull   : array of Boolean;
  vRemark    : array of string;
  vIndex     : Integer;
  vRecordIndex  : Integer;
  vXLSAdapter: TXLSAdapter;
  vXLSFile   : TXLSFile;
begin
  inherited;
  // Excel 필드 연결 폼을 보여준다
  with TExcelLoadForm.Create(self) do
    try
      Screen.Cursor := crSQLWait;
      SetLength(vName,    2);
      SetLength(vNotNull, 2);
      SetLength(vRemark,  2);
      vName[0] := '상품코드';
      vName[1] := '실사재고';

      if SetColumn(vName, vNotNull, vRemark) then
        if ShowModal = mrOK then
        begin
          // 엑셀 파일을 읽어 그리드에 넣는다
          vXLSAdapter := TXLSAdapter.Create(self);
          vXLSFile    := TXLSFile.Create(vXLSAdapter);
          vXLSFile.Connect;
          vXLSFile.OpenFile(ExcelFileEdit.Text);
          try
            isLoading := true;
            GridTableView.BeginUpdate;
            GridTableView.DataController.RecordCount := 0;

            vIndex := 2;

            while True do
            begin
              if string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]) = '' then
                Break
              else
              begin
                try
                  OpenQuery('select NM_MENU, '
                           +'       NM_SPEC, '
                           +'       DS_MENU_TYPE, '
                           +'       PR_BUY, '
                           +'       PR_SALE '
                           +'  from MS_MENU '
                           +' where CD_HEAD  =:P0 '
                           +'   and CD_STORE =:P1 '
                           +'   and CD_MENU  =:P2 '
                           +'   and DS_STOCK =''1'' '
                           +'   and YN_USE   =''Y'' ',
                           [HeadStoreCode,
                            StoreCode,
                            String(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex])]);

                  vRecordIndex := GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]), false, false, true);
                  if vRecordIndex >= 0 then
                  begin
                    GridTableView.DataController.Values[vRecordIndex, GridTableViewSurveyQty.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSurveyQty.Index] + vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex];
                  end
                  else
                  begin
                    GridTableView.DataController.AppendRecord;

                    if Query.Eof then
                    begin
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]     := string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]);
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]     := '[상품코드오류]';
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSurveyQty.Index]     := vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex];
                      Inc(vIndex);
                    end
                    else
                    begin
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]     := string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]);
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]     := Query.Fields[0].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsSpec.Index]     := Query.Fields[1].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsType.Index]     := Query.Fields[2].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyPrice.Index]      := Query.Fields[3].AsCurrency;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePrice.Index]     := Query.Fields[4].AsCurrency;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDeviceNo.Index ]     := '00';
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSurveyQty.Index]     := vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex];
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewRowState.Index ]     := rsInsert;
                    end;
                  end;
                  GridTableView.DataController.Post;
                except
                  ErrBox('엑셀 파일을 불러올 수 없습니다.'#13'엑셀 칼럼을 잘못 지정했거나, 엑셀 파일에 잘못된 값이 들어 있는 것 같습니다.');
                  Exit;
                end;
              end;
              Inc(vIndex);
              ExtremeMainForm.StatusBar.Panels[1].Text := IntToStr(vIndex);
              Application.ProcessMessages;
            end;

          finally
            vXLSFile.Disconnect;
            vXLSFile.Free;
            vXLSAdapter.Free;

            isLoading := false;
            isChanged := true;
            GridTableView.EndUpdate;
            Query.Close;
            ButtonEnable(false);
          end;
        end;
    finally
      Free;
      Screen.Cursor := crDefault;
    end;
end;

procedure TStockSurveyBatchForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
  Sender: TObject);
var
  vFileName: string;
begin
  if not ButtonToolBarPrintButtonPopupMenuExcel.Visible or not ButtonToolBarPrintButtonPopupMenuExcel.Enabled then
    Exit;

  inherited;

  if Grid.ActiveView.DataController.RecordCount = 0 then
    ShowMsg(msgNoPrintData)
  else
  begin
    try
      Screen.Cursor := crHourGlass;

      if not DirectoryExists(ExtractFilePath(Application.ExeName)+dirExcel) then
        ForceDirectories(ExtractFilePath(Application.ExeName)+dirExcel);
      vFileName := ExtractFilePath(Application.ExeName)+dirExcel + Replace(Caption,'/','_')+' '+FormatDateTime(fmtDateShort, Date)+'.xls';
      ExportGridToExcel(vFileName, Grid, false, true, false);
    finally
      Screen.Cursor := crDefault;
    end;

    ShellExecute(0, 'open', PChar(vFileName), nil, nil, SW_SHOW);
  end;
end;

procedure TStockSurveyBatchForm.ButtonToolBarPrintButtonPopupMenuPreviewClick(
  Sender: TObject);
begin
  inherited;
  dxComponentPrinter.Preview;
end;

procedure TStockSurveyBatchForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then DoSearch;

end;

procedure TStockSurveyBatchForm.Del_TimerTimer(Sender: TObject);
begin
  inherited;
  Del_Timer.Enabled := false;
  GridTableView.Controller.FocusedRecordIndex := LinkRowIndex;
  Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
  MsgBox('이미 등록된 상품입니다');
end;

function TStockSurveyBatchForm.DoDelete: Boolean;
var vRowIndex, vIndex :Integer;
begin
  if GridTableView.Controller.IsNewItemRowFocused then
  begin
    GridTableView.DataController.Cancel;
    isChanged := true;
  end;

  if GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index] = rsInsert then
    GridTableView.DataController.DeleteFocused
  else
  begin
    //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
    vRowIndex := GridTableView.DataController.GetFocusedRecordIndex;
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsDelete;
    GridTableView.DataController.AppendRecord;
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := GridTableView.DataController.Values[vRowIndex, vIndex];
    GridTableView.DataController.DeleteRecord(vRowIndex);
    isChanged := true;
  end;
  Result := true;
end;

function TStockSurveyBatchForm.DoSave: Boolean;
var
  vWork   : Integer;  //0:추가, 1:수정, 2:실사일자 다른거 수정
  vIndex,
  vPos  : Integer;
  vCount  : Integer;
  vSQLText: string;
  vGoods  : String;
  vStockQty :Integer;
  vStockGoodsList,
  vStockQtyList: TStringList;
begin
  Result := false;

  if CheckMonthClose('S', DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    ErrBox('월 마감이 된 월에는 실사 확정을 할 수 없습니다.');
    Exit;
  end;

  if not CheckMonthClose('S', DtoS(IncMonth(ConditionToolBarFromDateEdit.Date,-1))) then
  begin
    MsgBox('지난 달 ''월 마감''을 하지 않았습니다.');
    Exit;
  end;

  vWork  := 0;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if GridTableView.DataController.Values[vIndex, GridTableViewSurveyQty.Index] <> null then
    begin
      vWork := 1;
      break;
    end;

  if vWork = 0 then
  begin
    ErrBox('등록한 자료가 없습니다.');
    Exit;
  end;

  //같은달에 실사내역이 있는지 체크하다
  vGoods := '';
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if (GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal) or
       (GridTableView.DataController.Values[vIndex, GridTableViewGoodsName.Index] = '[상품코드오류]')  then Continue;

    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsUpdate then
      vGoods := vGoods + Format('''%s'',',[GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]]);
  end;

  if vGoods <> '' then
    vGoods := Format('and s.CD_GOODS in (%s) ',[LeftStr(vGoods, Length(vGoods)-1)]);

  //속도 향샹을 위해 실사재고에 현재고를 한번에 구한다
  vStockGoodsList := TStringList.Create;
  vStockQtyList   := TStringList.Create;
  try
    OpenQuery('select t.CD_GOODS, Ifnull(t.QTY_STOCK,0) '
	           +'   from (select CD_GOODS, '
             +'                Sum(Ifnull(QTY_BASE,0)+Ifnull(QTY_STOCK,0) -Ifnull(QTY_ADJ,0)) as QTY_STOCK '
             +'           from '
             +'                (select CD_GOODS, '
             +'                        Ifnull(QTY_BASE,0) as QTY_BASE, '
             +'                        0 as QTY_STOCK, '
             +'                        0 as QTY_ADJ '
             +'                   from SL_STOCK_MONTH  '
             +'                  where CD_HEAD  =:P0 '
             +'                    and CD_STORE =:P1 '
             +Replace(vGoods, 's.','')
             +'                    and YM_STOCK =Left(:P2, 6) '
             +'                 union all '
             +'                 select CD_GOODS, '
             +'                        0, '
             +'                        Sum(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ), '
             +'                        0 '
             +'                   from SL_STOCK_DAY '
             +'                  where CD_HEAD  =:P0 '
             +'                    and CD_STORE =:P1 '
             +'                    and YMD_STOCK between ConCat(Left(:P2,6),''01'') and :P2 '
             +Replace(vGoods, 's.','')
             +'                  group by CD_GOODS '
             +'                 union all '
             +'                 select CD_GOODS, '
             +'                        0, '
             +'                        0, '
             +'                        QTY_SETTLE '
             +'                   from SL_SILSA '
             +'                  where CD_HEAD  =:P0 '
             +'                    and CD_STORE =:P1 '
             +'                    and YM_SILSA = Left(:P2,6) '
             +'                    and YMD_SILSA = :P2 '
             +Replace(vGoods, 's.','')
             +'                 ) as t '
             +'           group by CD_GOODS '
             +'         ) as t ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date)]);
    while not Query.Eof do
    begin
      vStockGoodsList.Add(Query.Fields[0].AsString);
      vStockQtyList.Add(Query.Fields[1].AsString);
      Query.Next;
    end;
  finally
    Query.Close;
  end;

  // 저장
  try

    TempSQL := '';
    ExecQuery('delete '
             +'  from SL_SILSA '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YM_SILSA =LEFT(:P2,6) '
              +Replace(vGoods, 's.','')+';',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date)],false);

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;
      if (GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] <> rsUpdate) then Continue;
      vPos := vStockGoodsList.IndexOf(GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]);
      if vPos >= 0 then
        vStockQty := StrToIntDef(vStockQtyList.Strings[vPos],0)
      else
        vStockQty := 0;

      ExecQuery('insert into SL_SILSA(CD_HEAD, '
		           +'                     CD_STORE, '
               +'                     YM_SILSA, '
               +'                     CD_GOODS, '
               +'                     YMD_SILSA, '
               +'                     QTY_STOCK, '
               +'                     QTY_SILSA, '
               +'                     QTY_SETTLE, '
               +'                     PR_BUY, '
               +'                     PR_SALE, '
               +'                     YN_SILSA, '
               +'                     CD_SAWON_CHG, '
               +'                     DT_CHANGE) '
               +'             values(:P0, '
               +'                    :P1, '
               +'                    :P2, '
               +'                    :P3, '
               +'                    :P4, '
               +'                    :P5, '
               +'                    :P6, '
               +'                    :P6-:P5, '
               +'                    :P7, '
               +'                    :P8, '
               +'                    ''Y'', '
               +'                    :P9, '
               +'                    NOW());',
               [HeadStoreCode,
                StoreCode,
                LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6),
                GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                DtoS(ConditionToolBarFromDateEdit.Date),
                vStockQty,
                Trunc(GridTableView.DataController.Values[vIndex, GridTableViewSurveyQty.Index]),
                GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index],
                GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index],
                UserCode],false);

      ExecQuery('update MS_MENU_ETC '
               +'   set YMD_SILSA =:P3 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MENU  =:P2;',
               [HeadStoreCode,
                StoreCode,
                GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                DtoS(ConditionToolBarFromDateEdit.Date)],false);
    end;

    Result := ExecQuery(TempSQL, [], true);
    GridTableView.DataController.RecordCount := 0;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
  vStockGoodsList.Free;
  vStockQtyList.Free;
end;

end.
