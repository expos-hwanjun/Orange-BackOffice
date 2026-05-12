// 실사 등록 (완료)

unit StockSurvey;

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
  TStockSurveyForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSurveyQty: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridLevel: TcxGridLevel;
    ButtonToolBarExcelButton: TAdvGlowButton;
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
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Del_TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);

  private
    LinkRowIndex :Integer;
    function  SearchGoods(aGoods: string = ''):String;
    procedure ButtonEnable(aValue:Boolean);
  protected
    function DoSearch:Boolean; override;
    function DoSave: Boolean; override;
    function DoDelete: Boolean; override;
  end;

var
  StockSurveyForm: TStockSurveyForm;



implementation

uses
  Common, DBModule, ExcelLoad, Main, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TStockSurveyForm.FormCreate(Sender: TObject);
begin
  inherited;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;

procedure TStockSurveyForm.FormShow(Sender: TObject);
begin
  inherited;
  ConditionToolBarFromDateEdit.Date := now;
end;

procedure TStockSurveyForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;

  ButtonEnable(false);
end;

procedure TStockSurveyForm.GridTableViewFocusedRecordChanged(
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

procedure TStockSurveyForm.GridTableViewGoodsCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SearchGoods <> EmptyStr then
    Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
end;

procedure TStockSurveyForm.GridTableViewGoodsCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vIndex :Integer;
begin
  inherited;
  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    if (GetOnlyNumber(DisplayValue) = DisplayValue) and (Length(DisplayValue) >= 7) then // and (Length(DisplayValue) in [8, 13, 7, 12, 14]) then
    begin
      try
      OpenQuery('select   CD_MENU, '
               +'         NM_MENU, '
               +'         NM_SPEC, '
               +'         PR_BUY, '
               +'         PR_SALE, '
               +'         DS_MENU_TYPE '
               +'  from   MS_MENU       '
               +' where   CD_HEAD  =:P0 '
               +'   and   CD_STORE =:P1 '
               +'   and   CD_MENU  =:P2 '
               +'   and   DS_STOCK = ''1'' '
               +' order by CD_MENU',
                [HeadStoreCode,
                 StoreCode,
                 DisplayValue]);
        if Query.RecordCount = 1 then
        begin
          vIndex := GridTableView.DataController.FilteredIndexByRecordIndex[GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Query.FieldByName('CD_MENU').AsString, false, false, true)];
          if vIndex >= 0 then
          begin
            GridTableView.ViewData.Records[vIndex].Selected := not GridTableView.ViewData.Records[vIndex].Selected and GridTableView.ViewData.Records[vIndex].IsData;
            GridTableView.DataController.Cancel;
            LinkRowIndex := vIndex;
            Del_Timer.Enabled := true;
            Exit;
          end;

          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index] := Query.FieldByName('CD_MENU').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsName.Index] := Query.FieldByName('NM_MENU').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsSpec.Index] := Query.FieldByName('NM_SPEC').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSurveyQty.Index] := 0;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsType.Index] := Query.FieldByName('DS_MENU_TYPE').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index]  := Query.FieldByName('PR_BUY').AsCurrency;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSalePrice.Index] := Query.FieldByName('PR_SALE').AsCurrency;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDeviceNo.Index ] := '00';
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index ] := rsInsert;
          isChanged := true;
          Exit;
        end;
      finally
        FinishQuery;
      end;

      DisplayValue := SearchGoods(DisplayValue);
      if DisplayValue = EmptyStr then
      begin
        ErrorText := EmptyStr;
        Error := True;
        Keybd_Event(VK_ESCAPE,VK_ESCAPE, 0, 0);
      end;
    end
    else
    begin
      DisplayValue := SearchGoods(DisplayValue);
      if DisplayValue = EmptyStr then
      begin
        ErrorText := EmptyStr;
        Error := True;
        Keybd_Event(VK_ESCAPE,VK_ESCAPE, 0, 0);
      end;
    end;
  end;
end;

function TStockSurveyForm.SearchGoods(aGoods: string): String;
var
  vIndex  : Integer;
  vSaleAmt: string;
begin
  result := EmptyStr;
  // 상품 바코드를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := '상품 조회';
      GridTableViewCode.Caption  := GridTableViewGoodsCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := GridTableViewGoodsName.Caption;
      GridTableViewName1.Width   := 170;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := GridTableViewGoodsSpec.Caption;
      GridTableViewName2.Width   := 70;

      SearchText := aGoods;

      SQLText:= 'select   CD_MENU, '
               +'         NM_MENU, '
               +'         NM_SPEC, '
               +'         DS_MENU_TYPE, '
               +'         PR_BUY, '
               +'         PR_SALE '
               +'  from   MS_MENU       '
               +' where   CD_HEAD  =:P0 '
               +'   and   CD_STORE =:P1 '
               +'   and   (CD_MENU = :P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
               +'   and   DS_STOCK = ''1'' '
               +' order by CD_MENU';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        vIndex := Self.GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, Self.GridTableViewGoodsCode.Index, Code, false, false, true)];
        if vIndex >= 0 then
        begin
          GridTableView.ViewData.Records[vIndex].Selected := not GridTableView.ViewData.Records[vIndex].Selected and GridTableView.ViewData.Records[vIndex].IsData;
          GridTableView.DataController.Cancel;
          LinkRowIndex := vIndex;
          Del_Timer.Enabled := true;
          Exit;
        end;
        result := Code;

        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsName.Index] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsSpec.Index] := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSurveyQty.Index] := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsType.Index] := Names[2];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index]  := StrToFloat(Names[3]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsType.Index] := StrToFloat(Names[4]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDeviceNo.Index ] := '00';
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index ] := rsInsert;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockSurveyForm.DoSearch: Boolean;
begin
end;
//------------------------------------------------------------------------------
// 저장
procedure TStockSurveyForm.ButtonEnable(aValue: Boolean);
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

procedure TStockSurveyForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재작업을 취소하시겠습니까?') then Exit;

  ButtonEnable(true);
end;

procedure TStockSurveyForm.ButtonToolBarExcelButtonClick(Sender: TObject);
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
  if GridTableView.DataController.RecordCount > 0 then
  begin
    if not AskBox('저장되지 않은 실사내역은 모두 취소됩니다'#13'계속하시겠습니까?') then
      Exit;
  end;

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
                           +'   and DS_STOCK =''1'' ',
                           [HeadStoreCode,
                            StoreCode,
                            String(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex])]);


                  if not Query.Eof and (GridTableView.DataController.RecordCount > 0) then
                    vRecordIndex := GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]), false, false, true)
                  else
                    vRecordIndex := -1;

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
                  on E: Exception do
                  begin
                    ErrBox(E.Message);
                    Exit;
                  end;
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

procedure TStockSurveyForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
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

procedure TStockSurveyForm.ButtonToolBarPrintButtonPopupMenuPreviewClick(
  Sender: TObject);
begin
  inherited;
  dxComponentPrinter.Preview;
end;

procedure TStockSurveyForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then DoSearch;

end;

procedure TStockSurveyForm.Del_TimerTimer(Sender: TObject);
begin
  inherited;
  Del_Timer.Enabled := false;
  GridTableView.Controller.FocusedRecordIndex := LinkRowIndex;
  Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
  MsgBox('이미 등록된 상품입니다');
end;

function TStockSurveyForm.DoDelete: Boolean;
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

function TStockSurveyForm.DoSave: Boolean;
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
  vSQL :String;
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

    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then
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
    vSQL    := '';
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
      if (GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] <> rsInsert) then Continue;

      vPos := vStockGoodsList.IndexOf(GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]);
      if vPos >= 0 then
        vStockQty := StrToIntDef(vStockQtyList.Strings[vPos],0)
      else
        vStockQty := 0;

      vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',%s, %s, %s, %s, %s,''Y'',''%s'',NOW()),',
                           [HeadStoreCode,
                            StoreCode,
                            LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6),
                            GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                            DtoS(ConditionToolBarFromDateEdit.Date),
                            FloatToStr(vStockQty),
                            FloatToStr(Trunc(GridTableView.DataController.Values[vIndex, GridTableViewSurveyQty.Index])),
                            FloatToStr(Trunc(GridTableView.DataController.Values[vIndex, GridTableViewSurveyQty.Index])
                                     - vStockQty),
                            FloatToStr(NVL(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index],0)),
                            FloatToStr(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index],0)),
                            UserCode]);

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

    if vSQL <> '' then
    begin
      vSQL := 'insert into SL_SILSA(CD_HEAD, '
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
             +' values '+LeftStr(vSQL, Length(vSQL)-1)+';';
      ExecQuery(vSQL, [], false);
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
