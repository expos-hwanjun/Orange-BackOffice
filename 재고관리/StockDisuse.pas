// 재고 폐기 (완료)

unit StockDisuse;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, AdvToolBarStylers,
  cxLookAndFeels, cxLookAndFeelPainters, DBAccess, tmsXLSAdapter, cxCheckBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockDisuseForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewDisuseQty: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewRemainQty: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    ButtonToolBarExcelButton: TAdvGlowButton;
    cxLabel1: TcxLabel;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    Del_Timer: TTimer;
    ButtonToolBarCancelButton: TAdvGlowButton;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewDisuseQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ButtonToolBarExcelButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewGoodsCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure Del_TimerTimer(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    IsExcelLoad  :Boolean;
    LinkRowIndex :Integer;
    function  SearchGoods(aGoods: string = ''):String;
  protected
    function DoSearch:Boolean; override;
    function DoSave: Boolean; override;
    function DoDelete:Boolean; override;
  end;

var
  StockDisuseForm: TStockDisuseForm;



implementation

uses
  Common, DBModule, ExcelLoad, Main, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockDisuseForm.FormCreate(Sender: TObject);
begin
  inherited;
  IsExcelLoad := false;
  DefaultDate := ddToday;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
  ConditionToolBarEditLabel.Visible := Tag = 0;
  ConditionToolBarComboBox.Visible  := Tag = 0;
end;
procedure TStockDisuseForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

end;

//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TStockDisuseForm.FormShow(Sender: TObject);
var
  vCompanyCode: PStrPointer;
begin
  inherited;

  // 콤보박스에 거래처 없음 추가
  New(vCompanyCode);
  vCompanyCode^.Data := EmptyStr;
  ConditionToolBarComboBox.Properties.Items.AddObject('[전체]', TObject(vCompanyCode));

  // 거래처 테이블에서 거래처 목록 불러와서 콤보박스에 추가
  OpenQuery('select CD_TRDPL, '
           +'       NM_TRDPL '
           +'  from MS_TRD '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_TRDPL in (''B'',''M'') '
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
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 폐기 수량을 검증할 때
procedure TStockDisuseForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  //조회를 안하고 신규를 바로 입력했을때
  if ConditionToolBarFromDateEdit.Enabled then
  begin
    ConditionToolBarFromDateEdit.Enabled := false;
    ButtonToolBarSearchButton.Enabled    := false;
    ButtonToolBarCancelButton.Enabled    := true;
  end;

  if ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.GetFocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
end;

procedure TStockDisuseForm.GridTableViewDisuseQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStockQty.Index] <> null) and
     (DisplayValue <> null) then
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRemainQty.Index] := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStockQty.Index] - DisplayValue;
end;

procedure TStockDisuseForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  if AFocusedRecord = nil then
    ButtonToolBarDeleteButton.Enabled := false
  else
    ButtonToolBarDeleteButton.Enabled := AFocusedRecord.Index >= 0;
end;

procedure TStockDisuseForm.GridTableViewGoodsCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SearchGoods <> EmptyStr then
    Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
end;

procedure TStockDisuseForm.GridTableViewGoodsCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vIndex :Integer;
begin
  inherited;
  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    if (GetOnlyNumber(DisplayValue) = DisplayValue) and (Length(DisplayValue) >= 7) then
    begin
      try
        OpenQuery('select  b.CD_MENU as CD_GOODS, '
                 +'        b.NM_MENU as NM_GOODS, '
                 +'        b.NM_SPEC, '
                 +'        s.QTY_STOCK, '
                 +'        b.PR_BUY, '
                 +'        b.PR_SALE '
                 +'from    MS_MENU  as b  left outer join '
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
                 +'         ) as s on s.CD_GOODS = b.CD_MENU left outer join '
                 +' where b.CD_HEAD  =:P0 '
                 +'   and b.CD_STORE =:P1 '
                 +'   and b.CD_MENU  =:P3 '
                 +'   and b.DS_STOCK = ''1'' '
                 +' order by b.CD_MENU',
                  [HeadStoreCode,
                   StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   DisplayValue]);
        if Query.RecordCount = 1 then
        begin
          vIndex := GridTableView.DataController.FilteredIndexByRecordIndex[GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Query.FieldByName('CD_GOODS').AsString, false, false, true)];
          if vIndex >= 0 then
          begin
            GridTableView.ViewData.Records[vIndex].Selected := not GridTableView.ViewData.Records[vIndex].Selected and GridTableView.ViewData.Records[vIndex].IsData;
            GridTableView.DataController.Cancel;
            LinkRowIndex := vIndex;
            Del_Timer.Enabled := true;
            Exit;
          end;

          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index     ] := Query.FieldByName('CD_GOODS').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsName.Index     ] := Query.FieldByName('NM_GOODS').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsSpec.Index     ] := Query.FieldByName('NM_SPEC').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBuyPrice.Index      ] := Query.FieldByName('PR_BUY').AsCurrency;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSalePrice.Index     ] := Query.FieldByName('PR_SALE').AsCurrency;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStockQty.Index      ] := Query.FieldByName('QTY_STOCK').AsCurrency;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDisuseQty.Index     ] := 0;
          GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewRowState.Index      ] := rsInsert;
//          GridTableView.Controller.FocusedColumnIndex := Self.GridTableViewDisuseQty.Index;
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

function TStockDisuseForm.SearchGoods(aGoods: string): String;
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
      GridTableViewName2.Caption := GridTableViewGoodsSpec.Caption;
      GridTableViewName3.Width   := 70;
      GridTableViewName3.Caption := '매입단가';
      GridTableViewName3.Width   := 70;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;
      GridTableViewName4.Caption := '판매단가';
      GridTableViewName4.Width   := 70;
      GridTableViewName4.Visible := true;
      GridTableViewName4.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName4.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName4.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName4.Properties).ReadOnly      := true;

      SearchText := aGoods;

      SQLText    := 'select   CD_MENU, '
                   +'         NM_MENU, '
                   +'         NM_SPEC, '
                   +'         PR_BUY, '
                   +'         PR_SALE '
                   +'  from   MS_MENU '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and  (CD_MENU = :P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
                   +'   and   DS_STOCK = ''1'' '
                   +'order by CD_MENU';

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

        OpenQuery('select  Ifnull(s.QTY_STOCK,0) as QTY_STOCK '
                 +'from    MS_MENU  as b  left outer join '
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
                 +'         ) as s on s.CD_GOODS = b.CD_MENU  '
                 +'where b.CD_HEAD  =:P0 '
                 +'  and b.CD_STORE =:P1 '
                 +'  and b.CD_MENU  =:P3 '
                 +'  and b.DS_STOCK = ''1'' '
                 +'order by b.CD_MENU',
                  [HeadStoreCode,
                   StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   Code]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewGoodsCode.Index     ] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewGoodsName.Index     ] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewGoodsSpec.Index     ] := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewBuyPrice.Index      ] := StoF(Names[2]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewSalePrice.Index     ] := StoF(Names[3]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewStockQty.Index      ] := Query.Fields[0].AsCurrency;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewDisuseQty.Index     ] := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, Self.GridTableViewRowState.Index      ] := rsInsert;
//        Self.GridTableView.Controller.FocusedItemIndex := Self.GridTableViewDisuseQty.Index;
        isChanged := true;
      end;
    finally
      FinishQuery;
      Free;
    end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockDisuseForm.DoSearch: Boolean;
var
  vCompanyCode: String;
  vWhere :String;
begin
  Result := false;

  if ConditionToolBarComboBox.ItemIndex < 0 then
  begin
    ErrBox('거래처를 먼저 선택하십시오.');
    Exit;
  end;

  // 폐기일자가 포함된 월 마감이 되었는지 확인한다
  if CheckMonthClose('S', DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    ErrBox(FormatDateTime('yyyy-mm', ConditionToolBarFromDateEdit.Date)+'월은 마감이 되어 재고 폐기를 할 수 없습니다.');
    Exit;
  end;

  // 거래처 상품들을 조회한다
  try
    vCompanyCode := GetStrPointerData(ConditionToolBarComboBox);
    if vCompanyCode <> EmptyStr then
      vWhere := Format('and Ifnull(b.CD_TRDPL, '''') = ''%s'' ',[vCompanyCode])
    else
      vWhere := EmptyStr;

    OpenQuery('select   a.CD_GOODS, '
             +'         b.NM_MENU as NM_GOODS, '
             +'         b.NM_SPEC, '
             +'         ifnull(c.QTY_STOCK,0) + ifnull(a.QTY_DISUSE, 0) as QTY_STOCK, '
             +Ifthen(IsExcelLoad, 'd.QTY_DISUSE, ',' a.QTY_DISUSE, ')
             +'         case when a.QTY_DISUSE is null then null else ifnull(c.QTY_STOCK,0) end as QTY_REMAIN, '
             +'         a.REMARK, '
             +'         b.PR_BUY, '
             +'         b.PR_SALE, '
             +'         ''rsNormal'' as ROW_STATE '
             +'from    SL_DISUSE as a  inner join '
             +'        MS_MENU   as b  on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_GOODS left outer join '
             +'        (select   CD_GOODS, '
             +'                  Sum(QTY_STOCK) as QTY_STOCK '
             +'         from    (select   CD_GOODS, '
             +'                           QTY_BASE as QTY_STOCK '
             +'                    from   SL_STOCK_MONTH  '
             +'                   where   CD_HEAD  =:P0 '
             +'                     and   CD_STORE =:P1 '
             +'                     and   YM_STOCK = Left(:P2, 6) '
             +'                     and   QTY_BASE <> 0 '
             +'                  union all '
             +'                  select   CD_GOODS, '
             +'                           Sum(QTY_BUY) as QTY_STOCK '
             +'                  from     SL_BUY_D  '
             +'                   where   CD_HEAD  =:P0 '
             +'                     and   CD_STORE =:P1 '
             +'                     and   YMD_BUY between ConCat(Left(:P2,6),''01'') and :P2 '
             +'                  group by CD_GOODS '
             +'                  union all '
             +'                  select   CD_MENU as CD_GOODS, '
             +'                           - Sum(QTY_SALE) as QTY_STOCK '
             +'                  from     SL_SALE_D_SUM  '
             +'                   where   CD_HEAD  =:P0 '
             +'                     and   CD_STORE =:P1 '
             +'                     and   YMD_SALE between ConCat(Left(:P2,6),''01'') and :P2 '
             +'                  group by CD_MENU '
             +'                  union all '
             +'                  select   CD_GOODS, '
             +'                           - Sum(QTY_DISUSE) as QTY_STOCK '
             +'                    from   SL_DISUSE  '
             +'                   where   CD_HEAD  =:P0 '
             +'                     and   CD_STORE =:P1 '
             +'                     and   YMD_DISUSE between ConCat(Left(:P2,6),''01'') and :P2 '
             +'                  group by CD_GOODS '
             +'                  union all '
             +'                  select   CD_GOODS, '
             +'                           - Sum(QTY_SETTLE) as QTY_STOCK '
             +'                  from     SL_SILSA  '
             +'                   where   CD_HEAD  =:P0 '
             +'                     and   CD_STORE =:P1 '
             +'                     and   YM_SILSA = Left(:P2, 6) '
             +'                     and   Date_Format(DT_CHANGE, ''%Y%m%d'') between ConCat(Left(:P2, 6),''01'') and :P2 '
             +'                    and    QTY_SETTLE is not null '
             +'                  group by CD_GOODS ) as k '
             +'         group by CD_GOODS) as c on c.CD_GOODS = a.CD_GOODS '
             +Ifthen(IsExcelLoad, ' inner join TEMP_STOCK as c on t.CD_HEAD = b.CD_HEAD and t.CD_STORE = b.CD_STORE and t.CD_GOODS = b.CD_MENU ', '')
             +'where a.CD_HEAD    =:P0 '
             +'  and a.CD_STORE   =:P1 '
             +'  and a.YMD_DISUSE =:P2 '
             +'  and b.DS_STOCK   = ''1'' '
             +'  and (b.CD_MENU =:P3 or b.NM_MENU like ConCat(''%'',:P2,''%'')) '
             +Ifthen(not IsExcelLoad, vWhere,'')
             +'order by a.CD_GOODS',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               ConditionToolBarEdit.Text]);
    Result := DM.ReadQuery(Query, GridTableView);

    Grid.SetFocus;
    if GridTableView.DataController.RecordCount > 0 then
    begin
      GridTableView.Controller.FocusedRecordIndex := 0;
      GridTableView.Controller.FocusedColumnIndex := GridTableViewDisuseQty.Index;
    end;
    ConditionToolBarFromDateEdit.Enabled := false;
    ButtonToolBarSearchButton.Enabled    := false;
    ButtonToolBarCancelButton.Enabled    := true;
  except
  end;
end;
//------------------------------------------------------------------------------
// 저장
procedure TStockDisuseForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  ConditionToolBarFromDateEdit.Enabled := True;
  ButtonToolBarSearchButton.Enabled    := True;
  ButtonToolBarCancelButton.Enabled    := false;
  ButtonToolBarDeleteButton.Enabled    := false;
  GridTableView.DataController.Cancel;
  isChanged := false;
  GridTableView.DataController.RecordCount := 0;
end;

procedure TStockDisuseForm.ButtonToolBarExcelButtonClick(Sender: TObject);
var
  vName      : array of string;
  vNotNull   : array of Boolean;
  vRemark    : array of string;
  vIndex     : Integer;
  vXLSAdapter: TXLSAdapter;
  vXLSFile   : TXLSFile;
begin
  inherited;
  // 폐기일자가 포함된 월 마감이 되었는지 확인한다
  if CheckMonthClose('S',DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    ErrBox(FormatDateTime('yyyy-mm', ConditionToolBarFromDateEdit.Date)+'월은 마감이 되어 재고 폐기를 할 수 없습니다.');
    Exit;
  end;

  // 임시테이블 지우기
  ExecQuery('delete from TEMP_STOCK '
           +' where CD_HEAD =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and MAC_ADDRESS =:P2;',
            [HeadStoreCode,
             StoreCode],
             false);

  // Excel 필드 연결 폼을 보여준다
  with TExcelLoadForm.Create(self) do
    try
      Screen.Cursor := crSQLWait;
      SetLength(vName,    2);
      SetLength(vNotNull, 2);
      SetLength(vRemark,  2);
      vName[0] := '상품코드';
      vName[1] := Ifthen(Tag=0,'폐기수량','폐기금액');


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

            vIndex := 2;
            while True do
            begin
              if string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]) = '' then
                Break
              else
              begin
                try
                  ExecQuery('insert into TEMP_STOCK(CD_HEAD, '
                           +'                       CD_STORE, '
                           +'                       MAC_ADDRESS, '
                           +'                       CD_GOODS, '
                           +'                       QTY_STOCK) '
                           +'               values(:P0, :P1, :P2, :P3, :P4);',
                           [HeadStoreCode,
                            StoreCode,
                            GetMacAddress,
                            String(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]),
                            Integer(vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex])],false);

                except
                  ErrBox('엑셀 파일을 불러올 수 없습니다.'#13'엑셀 칼럼을 잘못 지정했거나, 엑셀 파일에 잘못된 값이 들어 있는 것 같습니다.');
                  Exit;
                end;
              end;
              Inc(vIndex);
              ExtremeMainForm.StatusBar.Panels[1].Text := IntToStr(vIndex);
              Application.ProcessMessages;
            end;
            ExecQuery(TempSQL, [], true);
          finally
            vXLSFile.Disconnect;
            vXLSFile.Free;
            vXLSAdapter.Free;

            isLoading := false;
            Query.Close;
            IsExcelLoad := True;
            DoSearch;
            IsExcelLoad := false;
            isChanged := true;
          end;
        end;
    finally
      Free;
      Screen.Cursor := crDefault;
    end;
end;

procedure TStockDisuseForm.Del_TimerTimer(Sender: TObject);
begin
  inherited;
  Del_Timer.Enabled := false;
  GridTableView.Controller.FocusedRecordIndex := LinkRowIndex;
  Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
  MsgBox('이미 등록된 상품입니다');
end;

function TStockDisuseForm.DoDelete: Boolean;
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

function TStockDisuseForm.DoSave: Boolean;
var
  vNull   : Boolean;
  vIndex  : Integer;
  vSQLText: string;
begin
  Result := false;

  vNull  := true;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if GridTableView.DataController.Values[vIndex, GridTableViewDisuseQty.Index] <> null then
    begin
      vNull := false;
      break;
    end;

  if vNull then
  begin
    ErrBox('등록한 자료가 없습니다.');
    Exit;
  end;

  // 저장
  try

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

      //폐기일자 이후에 실사내역이 있는지 체크한다
      OpenQuery('select Date_Format(Min(DT_CHANGE), ''%Y%m%d'') '
               +'  from SL_SILSA '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_GOODS =:P2 '
               +'   and YM_SILSA =:P3 '
               +'   and Date_Format(DT_CHANGE, ''%Y%m%d'') >= :P4 ',
                [HeadStoreCode,
                 StoreCode,
                 GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                 LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6),
                 DtoS(ConditionToolBarFromDateEdit.Date)]);
      try
        if not Query.Eof and (Query.Fields[0].AsString <> EmptyStr) then
        begin
          raise Exception.Create(Format('%s 상품이 %s 일에 실사내역이 있어 저장 할 수 없습니다',[GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                                                                                                 Query.Fields[0].AsString]));
          Break;
        end;
      finally
        FinishQuery;
      end;

      if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
      begin
        ExecQuery('delete SL_DISUSE '
                 +' where CD_HEAD    = :P0 '
                 +'   and CD_STORE   = :P1 '
                 +'   and YMD_DISUSE = :P2 '
                 +'   and CD_GOODS   = :P3;',
                  [HeadStoreCode,
                   StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]],
                   false);
        Continue;
      end
      else if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert then
      begin
        ExecQuery('insert into SL_DISUSE(CD_HEAD, CD_STORE, YMD_DISUSE, CD_GOODS, QTY_DISUSE, PR_BUY, PR_SALE, REMARK, CD_SAWON_CHG, DT_CHANGE) '
                 +'              values (:P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, Now()) '
                 +'on duplicate key update QTY_DISUSE = :P4, '
                 +'                        DT_CHANGE  = Now(), '
                 +'                        CD_SAWON_CHG =:P8;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewDisuseQty.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewRemark.Index],
                  UserCode],
                  false);
      end
      else if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsUpdate then
      begin
        ExecQuery('update SL_DISUSE '
                 +'   set QTY_DISUSE   = :P4, '
                 +'       PR_BUY       = :P5, '
                 +'       PR_SALE      = :P6, '
                 +'       REMARK       = :P7, '
                 +'       CD_SAWON_CHG = :P8, '
                 +'       DT_CHANGE    = Now() '
                 +' where CD_HEAD    = :P0 '
                 +'   and CD_STORE   = :P1 '
                 +'   and YMD_DISUSE = :P2 '
                 +'   and CD_GOODS   = :P3;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewDisuseQty.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index],
                  GridTableView.DataController.Values[vIndex, GridTableViewRemark.Index],
                  UserCode],
                  false);
      end;

    end;

    Result := ExecQuery(TempSQL, [], true);
    GridTableView.DataController.RecordCount := 0;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
