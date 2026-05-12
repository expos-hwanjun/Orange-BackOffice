// 발주 (완료)

//##### 매입과 동일하게 옵션처리
//##### 발주서 출력 추가해야 함
//##### 다른 프로그램과 통신
//##### 발주요청 불러오기

unit BuyOrder;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, Math,
  cxCurrencyEdit, cxSpinEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxCheckBox,
  cxMemo, ExtCtrls, AdvToolBarStylers, tmsXLSAdapter, cxLookAndFeels,
  cxLookAndFeelPainters, frxClass,
  AdvOfficeButtons, frxExportImage, dxSkinscxPCPainter, DBAccess;

type
  TBuyOrderForm = class(TInheritEditForm)
    MainPanel: TPanel;
    CompanyCodeLabel: TLabel;
    CommentLabel: TLabel;
    CompanyNameEdit: TcxTextEdit;
    CommentMemo: TcxMemo;
    StatusEdit: TcxTextEdit;
    CompanyCodeEdit: TcxButtonEdit;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewStockSafetyQty: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewOrderQty: TcxGridColumn;
    GridTableViewOrderPrice: TcxGridColumn;
    GridTableViewOrderBottleAmt: TcxGridColumn;
    GridTableViewOrderAmt: TcxGridColumn;
    GridTableViewOrderBottlePrice: TcxGridColumn;
    GridTableViewTaxYN: TcxGridColumn;
    GridTableViewOrderNetAmt: TcxGridColumn;
    GridTableViewOrderNotAmt: TcxGridColumn;
    GridTableViewOrderVatAmt: TcxGridColumn;
    GridTableViewMasterBuyPrice: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridDeleteButton: TButton;
    ExcelLoadButton: TButton;
    GoodsBatchButton: TButton;
    ButtonToolBarNewButton: TAdvGlowButton;
    GridTableViewMasterSalePrice: TcxGridColumn;
    OrderAmtLabel: TLabel;
    OrderAmtEdit: TcxCurrencyEdit;
    UserNameLabel: TLabel;
    RequestLoadButton: TButton;
    GridTableViewNew: TcxGridColumn;
    DamdangNameEdit: TcxTextEdit;
    ConditionToolBarOrderNoEdit: TcxButtonEdit;
    ButtonToolBarCancelButton: TAdvGlowButton;
    FastReport: TfrxReport;
    FastReportOrderDataSet: TfrxUserDataSet;
    DeliveryPlaceEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    DamdangTelEdit: TcxTextEdit;
    GridTableViewSeq: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewRequestLoaded: TcxGridColumn;
    GridTableViewRequestDate: TcxGridColumn;
    GridTableViewRequestDsOrder: TcxGridColumn;
    TifFilePrintCheckBox: TcxCheckBox;
    frxTIFFExport1: TfrxTIFFExport;
    HeadOrderButton: TButton;
    OrderTypeEdit: TcxTextEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure GridTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewOrderQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewOrderPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewOrderAmtPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridDeleteButtonClick(Sender: TObject);
    procedure ExcelLoadButtonClick(Sender: TObject);
    procedure GoodsBatchButtonClick(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure RequestLoadButtonClick(Sender: TObject);
    procedure UpdateSalePriceCheckBoxPropertiesChange(Sender: TObject);
    procedure ConditionToolBarOrderNoEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionToolBarOrderNoEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure FastReportOrderDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportOrderDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure DamdangTelEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure HeadOrderButtonClick(Sender: TObject);

  private
    BackupData: array of Variant;
    RecordCount :Integer;
    CompanyTax  :String;
    procedure DisabledCompanyCode;
    function  SearchCompany(aCompany: string = ''): string;
    function  SearchGoods(aGoods: string = ''): string;
    procedure CalcAmts(aAllRows: Boolean = false);
    procedure OrderLowStockInsert;
    procedure Print;
    procedure SetOrderType;
  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSearch: Boolean; override;
    function  DoSave  : Boolean; override;
  end;

var
  BuyOrderForm: TBuyOrderForm;



implementation

uses
  Common, DBModule, Help, ExcelLoad, GoodsBatchHelp, Main;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyOrderForm.FastReportOrderDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportOrderDataSet.RecNo >= RecordCount;
end;

procedure TBuyOrderForm.FastReportOrderDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.ColumnCount-1 do
    if GridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      if FastReportOrderDataSet.RecNo < GridTableView.DataController.RecordCount then
      begin
        if (GridTableView.Columns[vIndex].DataBinding.FieldName = 'SEQ') or
           (GridTableView.Columns[vIndex].DataBinding.FieldName = 'QTY_ORDER') or
           (GridTableView.Columns[vIndex].DataBinding.FieldName = 'PR_ORDER') or
           (GridTableView.Columns[vIndex].DataBinding.FieldName = 'AMT_DUTY') then
          Value := FormatFloat('#,0',GridTableView.DataController.Values[FastReportOrderDataSet.RecNo, vIndex])
        else
        begin
          Value := GridTableView.DataController.Values[FastReportOrderDataSet.RecNo, vIndex]
        end;
      end
      else
        if (FastReportOrderDataSet.RecNo = GridTableView.DataController.RecordCount) and (GridTableView.Columns[vIndex].DataBinding.FieldName = 'NM_GOODS') then
          Value := '         -  이하여백  -  '
        else
          Value := '';
      break;
    end;
end;

procedure TBuyOrderForm.FormCreate(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TBuyOrderForm.FormShow(Sender: TObject);
begin
  inherited;
  //발주정정에서 실행시켰을때
  //##### 이벤트 처리
  if Length(FormParam[0]) = 14 then
  begin
    ConditionToolBarFromDateEdit.Date := StoD(LeftStr(FormParam[0],10));
    ConditionToolBarOrderNoEdit.Text  := RightStr(FormParam[0],4);
    ButtonToolBarSearchButton.Click;
    ButtonToolBarSearchButton.Visible := False;
    ButtonToolBarNewButton.Visible    := False;
    ConditionToolBarOrderNoEdit.Properties.ReadOnly  := True;
    ConditionToolBarFromDateEdit.Properties.ReadOnly := True;
    FormParam[0] := EmptyStr;
    isChanged    := true;
  end
  else
    ButtonToolBarNewButton.Click;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TBuyOrderForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DOWN,
    VK_UP   :
      if GridTableView.Controller.IsNewItemRowFocused then
      begin
        Key := 0;
        Exit;
      end;
  end;

  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 발주번호에서 키보드를 누를 때
procedure TBuyOrderForm.ConditionToolBarOrderNoEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

procedure TBuyOrderForm.ConditionToolBarOrderNoEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption := '발주 조회';
      GridTableViewCode.Caption  := '발주일자';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption  := '발주번호';
      GridTableViewName1.Width    := 60;
      GridTableViewName1.PropertiesClassName       := 'TcxLabelProperties';
      GridTableViewName1.Properties.Alignment.Horz := taCenter;
      GridTableViewName2.Caption := '거래처이름';
      GridTableViewName2.Width   := 250;
      GridTableViewName2.Visible := true;
      GridTableViewName3.Caption := '발주금액';
      GridTableViewName3.Width   := 80;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;


      SearchText := '';
      SQLText    := 'select   dbo.StoD(YMD_ORDER) as YMD_ORDER, '
                   +'         b.NO_ORDER, '
                   +'         t.NM_TRDPL, '
                   +'         b.AMT_ORDER '
                   +'from     SL_ORDER_H b inner join '
                   +'         MS_TRD   t on b.CD_STORE = t.CD_STORE and b.CD_TRDPL = t.CD_TRDPL '
                   +'where    b.CD_STORE   =:P0 '
                   +'  and    Isnull(b.NO_BUY_REF,'''') = '''' '
                   +'  and    b.YMD_ORDER = '''+DtoS(ConditionToolBarFromDateEdit.Date)+''' '
                   +'order by b.CD_STORE, b.NO_ORDER';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        ConditionToolBarOrderNoEdit.Text := Names[0];
        DoSearch;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TBuyOrderForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  if isChanged then
  begin
    PlayWave('SaveChanged');
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  inherited;
end;
//------------------------------------------------------------------------------
// 신규 버튼
procedure TBuyOrderForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if AskBox('현재 작업을 모두 취소하시겠습니까?') then
  begin
    isChanged := false;
    GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
    GridTableView.DataController.Cancel;
    GridTableView.Controller.NewItemRecordFocused := false;
    ConditionToolBarFromDateEdit.Date := now;
    ButtonToolBarNewButton.Click;
  end;
end;

procedure TBuyOrderForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  if not ButtonToolBarNewButton.Visible or not ButtonToolBarNewButton.Enabled then
    Exit;

  inherited;

  if isChanged then
  begin
    PlayWave('SaveChanged');
    if AskBox('변경된 자료를 저장하시겠습니까?') then
      ButtonToolBarSaveButton.Click;
  end;

  ClearEdit;
  StatusEdit.Text   := '발주 등록';
  StatusEdit.Tag    := 0;
  OrderTypeEdit.Tag := 0;
  SetOrderType;
  ConditionToolBarOrderNoEdit.Clear;
  OrderTypeEdit.Clear;
  HeadOrderButton.Visible := true;
  OrderTypeEdit.Visible   := false;
  CompanyCodeEdit.TabStop                        := true;
  CompanyCodeEdit.Properties.ReadOnly            := false;
  CompanyCodeEdit.Style.Color                    := clWindow;
  CompanyCodeEdit.Properties.Buttons[0].Enabled  := true;
  if MainPanel.Enabled and CompanyCodeEdit.Enabled then
    CompanyCodeEdit.SetFocus;
  GridTableView.DataController.RecordCount       := 0;

  ShowMsg('신규 발주를 입력합니다.');

  MainPanel.Enabled := true;
  Grid.Enabled      := MainPanel.Enabled;
  isChanged         := false;

  if CompanyCodeEdit.Enabled then
    CompanyCodeEdit.SetFocus
  else
    DeliveryPlaceEdit.SetFocus;
end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 마스터 변경 - 판매단가 체크박스
procedure TBuyOrderForm.UpdateSalePriceCheckBoxPropertiesChange(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TBuyOrderForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  // 거래처코드
  if (Sender = CompanyCodeEdit) and (CompanyNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(CompanyCodeEdit.EditingText) <> CompanyCodeEdit.EditingText) or (Length(CompanyCodeEdit.EditingText) <> 6)) then
  begin
    CompanyNameEdit.Text := EmptyStr;
    GridTableView.DataController.RecordCount := 0;
    Grid.Enabled         := false;
  end;
end;
//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TBuyOrderForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vCode : Array[0..6] of String;
begin
  inherited;

  // 거래처
  if Sender = CompanyCodeEdit then
    if DisplayValue <> EmptyStr then
      try
        OpenQuery('select     t.CD_TRDPL, '
                   +'         t.NM_TRDPL, '
                   +'         s.NM_SAWON, '
                   +'         s.TEL_OFFICE, '
                   +'         t.DS_PRICE, '
                   +'         t.DS_DUTYFREE, '
                   +'         t.DS_ORDER '
                   +'from     MS_TRD t left outer join '
                   +'         MS_SAWON s on t.CD_STORE = s.CD_STORE and t.CD_DAMDANG = s.CD_SAWON '
                   +'where    t.CD_STORE  = :P0 '
                   +'  and   (t.CD_TRDPL like ''%''+:P1+''%'' or t.NM_TRDPL like ''%''+:P1+''%'') '
                   +'  and    t.DS_TRDPL  = ''B'' '
                   +'  and    t.DS_STATUS = 0 '
                   +Ifthen(Tag=1,'  and    Isnull(t.CD_STORE_LINK,'''') = '''' ', '')
                   +'order by t.CD_STORE, t.CD_TRDPL',
                  [StoreCode,
                   DisplayValue]);
        if not Query.Eof then
        begin
          // 일단 첫번째 값을 받아 놓는다
          vCode[0] := Query.Fields[0].AsString;
          vCode[1] := Query.Fields[1].AsString;
          vCode[2] := Query.Fields[2].AsString;
          vCode[3] := Query.Fields[3].AsString;
          vCode[4] := Query.Fields[4].AsString;
          vCode[5] := Query.Fields[5].AsString;
          vCode[6] := Query.Fields[6].AsString;
          // 쿼리 다음 줄로 이동해 본다
          Query.Next;
          // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
          if Query.Eof then
          begin
            Grid.Enabled         := true;
            DisplayValue         := vCode[0];
            CompanyNameEdit.Text := vCode[1];
            DamdangNameEdit.Text := vCode[2];
            DamdangTelEdit.Text  := vCode[3];
            CompanyNameEdit.Tag  := StrToIntDef(vCode[4],0);
            CompanyTax           := vCode[5];
            OrderTypeEdit.Tag    := StrToIntDef(vCode[6],0);
            SetOrderType;
          end
          // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
          else
          begin
            DisplayValue := SearchCompany(DisplayValue);
            if DisplayValue <> EmptyStr then
              Grid.Enabled := true;
          end;
          HeadOrderButton.Visible := false;
          OrderTypeEdit.Visible   := true;
        end
        else
        begin
          ErrorText := Replace(CompanyCodeLabel.Caption)+msgMustInput;
          Error     := true;
        end;
      finally
        FinishQuery;
      end;
end;
//------------------------------------------------------------------------------
// 거래처 입력창 버튼을 누를 때
procedure TBuyOrderForm.CompanyCodeEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  // 거래처를 조회한다
  if CompanyCodeEdit.Text <> EmptyStr then
    CompanyCodeEdit.Text := SearchCompany(CompanyCodeEdit.Text)
  else
    CompanyCodeEdit.Text := SearchCompany;

  if CompanyNameEdit.Text <> EmptyStr then
  begin
    HeadOrderButton.Visible := false;
    OrderTypeEdit.Visible   := true;
    if MainPanel.Enabled and CommentMemo.Enabled then
      DeliveryPlaceEdit.SetFocus;
    Grid.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
// 발주요청 불러오기 버튼
procedure TBuyOrderForm.RequestLoadButtonClick(Sender: TObject);
begin
  inherited;
  // 요청 목록 도움말창을 보여준다
  with THelpForm.Create(Self) do
    try
      Caption := '발주 요청 조회';
      GridTableViewCode.Caption  := '일 자';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '구분';
      GridTableViewName1.Width   := 80;
      GridTableViewName2.Caption := '거래처';
      GridTableViewName2.Width   := 200;
      GridTableViewName2.Visible := true;
      GridTableViewName3.Caption := '상품수';
      GridTableViewName3.Width   := 70;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;
      GridTableViewName4.Caption := '발주금액';
      GridTableViewName4.Width   := 80;
      GridTableViewName4.Visible := true;
      GridTableViewName4.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName4.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName4.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName4.Properties).ReadOnly      := true;
      DeleteButton.Visible := true;

      SQLText := 'select   CONVERT(Varchar(10), r.DT_CHANGE, 120) as YMD_REQUEST, '
                +'         case r.DS_ORDER when ''2'' then ''PDA요청'' when ''3'' then ''적정재고미달'' when ''4'' then ''품절예정'' when ''5'' then ''판매예정'' end as NM_ORDER, '
                +'         Max(IsNull(t.NM_TRDPL,''(거래처 미지정)'')) as NM_TRDPL, '
                +'         Count(*) as CNT_REQUEST, '
                +'         Sum(r.QTY_REQUEST * r.PR_BUY) as AMT_REQUEST, '
                +'         r.DS_ORDER, '
                +'         IsNull(g.CD_TRDPL,'''') as CD_TRDPL '
                +'from     SL_ORDER_REQUEST as r inner join '
                +'         MS_GOODS         as g on r.CD_STORE = g.CD_STORE and r.CD_GOODS = g.CD_GOODS left outer join '
                +'         MS_TRD           as t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL and t.NM_TRDPL like ''%''+:P1+''%'' '
                +'where    r.CD_STORE = :P0 '
                +'  and    r.DS_ORDER in (''2'',''3'',''4'',''5'') '
                +'group by r.DS_ORDER, CONVERT(Varchar(10), r.DT_CHANGE, 120), IsNull(g.CD_TRDPL,'''') '
                +'order by r.DS_ORDER, CONVERT(Varchar(10), r.DT_CHANGE, 120), IsNull(g.CD_TRDPL,'''')';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        // 거래처가 기존과 같은지 확인
        if (Self.CompanyCodeEdit.Text <> Names[5]) then // (not Self.CompanyCodeEdit.TabStop)
        begin
          if (Self.CompanyCodeEdit.Text = EmptyStr) or not AskBox(Format('거래처(%s)가 이미 지정한 거래처와 다릅니다.'#13'그냥 %s 거래처로 매입하시겠습니까?', [Names[1], Self.CompanyNameEdit.Text])) then
          begin
            Self.CompanyCodeEdit.Text := Names[5];
            Self.CompanyNameEdit.Text := Names[1];
          end ;
        end;

        //등록된 상품이 없으면 매입일자를 변경한다
        if GridTableView.DataController.RowCount = 0 then
          ConditionToolBarFromDateEdit.Text := Code;

        //발주할때는 연결상품이면 원래상품으로 발주한다
        OpenQuery('select   r.CD_GOODS, '
                 +'         g.NM_GOODS, '
                 +'         g.NM_SPEC, '
                 +'         g.QTY_SAFETY, '
                 +'         s.QTY_STOCK, '
                 +'         r.QTY_REQUEST, '
                 +'         case when r.PR_BUY <> 0 then r.PR_BUY else case '''+IntToStr(CompanyCodeEdit.Tag)+''' when ''0'' then g.PR_BUY when ''9'' then isnull(l.PR_BUY, g.PR_BUY) end end as PR_ORDER, '
                 +'         g.PR_BUY as PR_ORDER_M, '
                 +'         g.PR_SALE, '
                 +'         case when IsNull(g.CD_BOTTLE,'''') = '''' then 0 else dbo.GetBottleBuyPrice(g.CD_STORE, g.CD_GOODS) end as PR_BOTTLE, '
                 +'         g.DS_TAX '
                 +'from     SL_ORDER_REQUEST r inner join '
                 +'         MS_GOODS as g on r.CD_STORE =g.CD_STORE and  r.CD_GOODS = g.CD_GOODS and IsNull(g.CD_TRDPL,'''') = :P2 left outer join '
                 +'        (select   CD_STORE, '
                 +'                  CD_GOODS, '
                 +'                  Sum(QTY_STOCK) as QTY_STOCK '
                 +'         from    (select   CD_STORE, '
                 +'                           CD_GOODS, '
                 +'                           QTY_BASE as QTY_STOCK '
                 +'                  from     SL_STOCK_MONTH '
                 +'                  where    CD_STORE = :P0 '
                 +'                    and    YM_STOCK = Left(Convert(varchar, GetDate(), 112), 6) '
                 +'                    and    QTY_BASE <> 0 '
                 +'                  union all '
                 +'                  select   b.CD_STORE, '
                 +'                           g.CD_GOODS_T as CD_GOODS, '
                 +'                           Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                 +'                  from     SL_BUY_D as b inner join '
                 +'                           MS_GOODS as g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS '
                 +'                  where    b.CD_STORE = :P0 '
                 +'                    and    b.YMD_BUY like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                 +'                  group by b.CD_STORE, g.CD_GOODS_T '
                 +'                  union all '
                 +'                  select   s.CD_STORE, '
                 +'                           g.CD_GOODS_T as CD_GOODS, '
                 +'                           - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                 +'                  from     SL_SALE_D as s inner join '
                 +'                           MS_GOODS  as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
                 +'                  where    s.CD_STORE = :P0 '
                 +'                    and    s.YMD_SALE like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                 +'                    and    s.DS_SALE <> ''V'' '
                 +'                  group by s.CD_STORE, g.CD_GOODS_T '
                 +'                  union all '
                 +'                  select   d.CD_STORE, '
                 +'                           g.CD_GOODS_T as CD_GOODS, '
                 +'                           - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                 +'                  from     SL_DISUSE as d inner join '
                 +'                           MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
                 +'                  where    d.CD_STORE = :P0 '
                 +'                    and    d.YMD_DISUSE like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                 +'                  group by d.CD_STORE, g.CD_GOODS_T '
                 +'                  union all '
                 +'                  select   s.CD_STORE, '
                 +'                           g.CD_GOODS_T as CD_GOODS, '
                 +'                           Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                 +'                  from     SL_SILSA as s inner join '
                 +'                           MS_GOODS as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
                 +'                  where    s.CD_STORE = :P0 '
                 +'                    and    s.YM_SILSA = Left(Convert(varchar, GetDate(), 112), 6) '
                 +'                    and    s.QTY_SETTLE is not null '
                 +'                  group by s.CD_STORE, g.CD_GOODS_T) as k '
                 +'         group by CD_STORE, CD_GOODS) as s on g.CD_STORE = s.CD_STORE and g.CD_GOODS = s.CD_GOODS left outer join '
                 +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL ='''+CompanyCodeEdit.Text+''' '
                 +'where    r.CD_STORE  = :P0 '
                 +'  and    r.DS_ORDER  = :P1 '
                 +'  and    Convert(varchar(10), r.DT_CHANGE, 120) = :P3 '
                 +'order by r.DT_CHANGE ',
                 [StoreCode,
                  Names[4],
                  Names[5],
                  Code]);
        try
          Self.GridTableView.DataController.RecordCount := 0;
          Self.GridTableView.BeginUpdate;
          while not Query.Eof do
          begin
            Self.GridTableView.DataController.AppendRecord;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index]        := Query.Fields[0].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsName.Index]        := Query.Fields[1].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsSpec.Index]        := Query.Fields[2].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewStockSafetyQty.Index]   := Query.Fields[3].AsInteger;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewStockQty.Index]         := Query.Fields[4].AsInteger;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderQty.Index]         := Query.Fields[5].AsInteger;

            if (CompanyTax <> 'T') or (Query.Fields[10].AsString = '0') then // 매입단가가 부가세 포함이거나 면세 상품일 때
            begin
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderPrice.Index]        := Query.Fields[6].AsCurrency
            end
            else // 매입 단가가 공급가일 때
            begin
              Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderPrice.Index]        := CeilNumber(Query.Fields[6].AsCurrency / TaxRate)
            end;

            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewMasterBuyPrice.Index]   := Query.Fields[7].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewMasterSalePrice.Index]  := Query.Fields[8].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderBottlePrice.Index] := Query.Fields[9].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTaxYN.Index]            := Query.Fields[10].AsString;

            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderAmt.Index]         := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderBottleAmt.Index]   := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderNotAmt.Index]      := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderNetAmt.Index]      := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderVatAmt.Index]      := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewNew.Index]              := false;

            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewRequestLoaded.Index]    := true;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewRequestDate.Index]      := Code;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewRequestDsOrder.Index]   := Names[4];
            Query.Next;
            isChanged := true;
          end;
        finally
          FinishQuery;
          CalcAmts(true);
          DisabledCompanyCode;
          Self.GridTableView.EndUpdate;
        end;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 엑셀 불러오기 버튼
procedure TBuyOrderForm.ExcelLoadButtonClick(Sender: TObject);
var
  vXLSAdapter: TXLSAdapter;
  vXLSFile   : TXLSFile;
  vIndex     : Integer;
begin
  inherited;

  if CompanyNameEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(CompanyCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    Exit;
  end
  // 기존 등록된 자료가 있을 경우 확인
  else if (GridTableView.DataController.RecordCount > 0) and
          (not AskBox(Format('이미 등록된 발주 자료가 있습니다.'#13'무시하고 %s를 하시겠습니까?', [ExcelLoadButton.Caption]))) then
    Exit;

  // 엑셀 칼럼지정 폼을 띄운다
  with TExcelLoadForm.Create(self) do
    try
      if SetColumn([GridTableViewGoodsCode.Caption, GridTableViewOrderQty.Caption, GridTableViewOrderPrice.Caption], [true, true, false]) then
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
              if string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]) = EmptyStr then
                break
              else
              begin
                OpenQuery('select   case when Isnull(g.YN_LINK, ''N'') = ''Y'' then g.CD_GOODS_L else g.CD_GOODS end as CD_GOODS, '
                         +'         g.NM_GOODS, '
                         +'         g.QTY_SAFETY, '
                         +'         dbo.GetStockCount(g.CD_STORE, g.CD_GOODS_T, '''') as QTY_STOCK, '
                         +'         case '''+IntToStr(CompanyCodeEdit.Tag)+''' when ''0'' then g.PR_BUY when ''9'' then isnull(l.PR_BUY, g.PR_BUY) end as PR_ORDER, '
                         +'         g.PR_BUY as PR_ORDER_M, '
                         +'         g.PR_SALE, '
                         +'         g.PR_SALE as PR_SALE_M, '
                         +'         dbo.GetBottleBuyPrice(g.CD_STORE, g.CD_GOODS) as PR_BOTTLE, '
                         +'         g.DS_TAX, '
                         +'         g.NM_SPEC '
                         +'from     MS_GOODS g left outer join '
                         +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL =:P2 '
                         +'where    g.CD_STORE  = :P0 '
                         +'  and    g.CD_GOODS  = :P1 '
                         +'  and    g.DS_GOODS <> ''B'' '
                         +'  and    g.YN_USE    = ''Y''',
                         [StoreCode,
                          string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]),
                          CompanyCodeEdit.Text]);
                try
                  try
                    if not Query.Eof then
                    begin
                      GridTableView.DataController.AppendRecord;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]        := Query.Fields[0].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]        := Query.Fields[1].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsSpec.Index]        := Query.Fields[10].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewStockSafetyQty.Index]   := Query.Fields[2].AsInteger;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewStockQty.Index]         := Query.Fields[3].AsInteger;
                      if ColumnComboBox[2].ItemIndex > 0 then
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index]     := vXLSFile.CellValue[vIndex, ColumnComboBox[2].ItemIndex]
                      else
                      begin
                        if (CompanyTax <> 'T') or (Query.Fields[9].AsString = '0') then // 매입단가가 부가세 포함이거나 면세 상품일 때
                          GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index]      := Query.Fields[4].AsCurrency
                        else // 매입 단가가 공급가일 때
                          GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index]      := CeilNumber(Query.Fields[4].AsCurrency / TaxRate);
                      end;

                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewMasterBuyPrice.Index]   := Query.Fields[5].AsCurrency;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewMasterSalePrice.Index]  := Query.Fields[7].AsCurrency;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderBottlePrice.Index] := Query.Fields[8].AsCurrency;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTaxYN.Index]            := Query.Fields[9].AsString;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderQty.Index]         := Abs(vXLSFile.CellValue[vIndex, ColumnComboBox[1].ItemIndex]);

                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderAmt.Index]         := 0;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderBottleAmt.Index]   := 0;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderNotAmt.Index]      := 0;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderNetAmt.Index]      := 0;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderVatAmt.Index]      := 0;
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewNew.Index]              := false;
                    end;
                  except
                    ErrBox(Format('엑셀 파일을 불러올 수 없습니다.'#13'엑셀 칼럼을 잘못 지정했거나, 엑셀 파일에 잘못된 값이 들어 있는 것 같습니다.'#13#13'에러 줄(레코드) : %d', [vIndex]));
                    Break;
                  end;
                finally
                  FinishQuery;
                end;
              end;
              Inc(vIndex);
            end;
          finally
            vXLSFile.Disconnect;
            vXLSFile.Free;
            vXLSAdapter.Free;
            isLoading := false;
            GridTableView.EndUpdate;
          end;
        end;
    finally
      Free;
      FinishQuery;
      CalcAmts(true);
      DisabledCompanyCode;
    end;
end;
//------------------------------------------------------------------------------
// 상품 일괄등록 버튼
procedure TBuyOrderForm.GoodsBatchButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  inherited;

  if CompanyNameEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(CompanyCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    Exit;
  end;

  with TGoodsBatchHelpForm.Create(Self) do
    try
      WorkType    := 3;  //발주(상품일괄)
      CompanyCode := CompanyCodeEdit.Text;
      GridTableViewBuyQty.Caption                := Self.GridTableViewOrderQty.Caption;
      GridTableView.OptionsSelection.MultiSelect := false;

      SQLText := 'select   g.CD_GOODS, '
                +'         g.NM_GOODS+'' ''+g.NM_SPEC as NM_GOODS, '
                +'         t.NM_TRDPL, '
                +'         '''' as NM_SPC, '
                +'         case '''+IntToStr(CompanyCodeEdit.Tag)+''' when ''0'' then g.PR_BUY when ''9'' then isnull(l.PR_BUY, g.PR_BUY) end as PR_BUY, '
                +'         g.PR_SALE, '
                +'         g.PR_BUY as PR_BUY_M, '
                +'         g.PR_SALE as PR_SALE_M, '
                +'         ''00'' as NO_DEVICE_CHG '
                +'from     MS_GOODS g left outer join '
                +'         MS_TRD   t on g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL left outer join '
                +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL ='''+CompanyCodeEdit.Text+''' '
                +'where    g.CD_STORE =:P0 '
                +'  and    Isnull(g.YN_LINK,''N'') = ''N'' ';


      if ShowModal = mrOK then
        for vIndex := 0 to AddGridTableView.DataController.RecordCount-1 do
        begin
          // 그리드에 이미 등록되어 있는 상품코드면 무시하고 넘어간다
          if Self.GridTableView.DataController.FindRecordIndexByText(0, Self.GridTableViewGoodsCode.Index, AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index], false, false, true) >= 0 then
            Continue;
          // 매입 수량이 없으면 다음으로 넘어간다
          if Nvl(AddGridTableView.DataController.Values[vIndex, AddGridTableViewBuyQty.Index], 0) = 0 then
            Continue;

          OpenQuery('select   g.CD_GOODS, '
                   +'         g.NM_GOODS, '
                   +'         g.QTY_SAFETY, '
                   +'         dbo.GetStockCount(g.CD_STORE, g.CD_GOODS_T, '''') as QTY_STOCK, '
                   +'         case '''+IntToStr(CompanyCodeEdit.Tag)+''' when ''0'' then g.PR_BUY when ''9'' then isnull(l.PR_BUY, g.PR_BUY) end as PR_ORDER, '
                   +'         g.PR_BUY as PR_ORDER_M, '
                   +'         g.PR_SALE, '
                   +'         g.PR_SALE as PR_SALE_M, '
                   +'         dbo.GetBottleBuyPrice(g.CD_STORE, g.CD_GOODS) as PR_BOTTLE, '
                   +'         g.DS_TAX, '
                   +'         g.NM_SPEC  '
                   +'from     MS_GOODS g left outer join '
                   +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL =:P2 '
                   +'where    g.CD_STORE  = :P0 '
                   +'  and    g.CD_GOODS  = :P1 '
                   +'  and    g.DS_GOODS <> ''B'' '
                   +'  and    g.YN_USE    = ''Y''',
                   [StoreCode,
                    AddGridTableView.DataController.Values[vIndex, AddGridTableViewGoodsCode.Index],
                    CompanyCodeEdit.Text]);
          try
            Self.GridTableView.DataController.AppendRecord;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index]        := Query.Fields[0].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsName.Index]        := Query.Fields[1].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsSpec.Index]        := Query.Fields[10].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewStockSafetyQty.Index]   := Query.Fields[2].AsInteger;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewStockQty.Index]         := Query.Fields[3].AsInteger;

            if (CompanyTax <> 'T') or (Query.Fields[9].AsString = '0') then // 매입단가가 부가세 포함이거나 면세 상품일 때
            begin
              if NVL(AddGridTableView.DataController.Values[vIndex, AddGridTableViewWorkBuyPrice.Index],0.0) = 0 then
                Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderPrice.Index]        := Query.Fields[4].AsCurrency
              else
                Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderPrice.Index]        := AddGridTableView.DataController.Values[vIndex, AddGridTableViewWorkBuyPrice.Index]
            end
            else // 매입 단가가 공급가일 때
            begin
              if NVL(AddGridTableView.DataController.Values[vIndex, AddGridTableViewWorkBuyPrice.Index],0.0) = 0 then
                Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderPrice.Index]        := CeilNumber(Query.Fields[4].AsCurrency / TaxRate)
              else
                Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderPrice.Index]        := CeilNumber(AddGridTableView.DataController.Values[vIndex, AddGridTableViewWorkBuyPrice.Index] / TaxRate);
            end;

            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewMasterBuyPrice.Index]   := Query.Fields[5].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewMasterSalePrice.Index]  := Query.Fields[7].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderBottlePrice.Index] := Query.Fields[8].AsCurrency;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTaxYN.Index]            := Query.Fields[9].AsString;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderQty.Index]         := Abs(Nvl(AddGridTableView.DataController.Values[vIndex, GridTableViewBuyQty.Index], 0));

            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderAmt.Index]         := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderBottleAmt.Index]   := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderNotAmt.Index]      := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderNetAmt.Index]      := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewOrderVatAmt.Index]      := 0;
            Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewNew.Index]              := false;
          finally
            FinishQuery;
          end;
        end;
    finally
      Free;
      FinishQuery;
      // 각 금액 계산
      CalcAmts(true);
      DisabledCompanyCode;
      isChanged := true;
    end;
end;
//------------------------------------------------------------------------------
// 그리드 값을 적용하기 전
procedure TBuyOrderForm.GridTableViewDataControllerBeforePost(ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;

  if ADataController.NewItemRowFocused then
  begin
    // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
    if (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
       (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewOrderQty.Index],  0)        = 0) then
    begin
      // 기존에 입력된 값을 저장해 놓는다
      SetLength(BackupData, GridTableView.ColumnCount);
      for vIndex := 0 to GridTableView.ColumnCount-1 do
        BackupData[vIndex] := ADataController.Values[-1, vIndex];
      // Post를 취소한다
      ADataController.Cancel;
    end

    // 새로 추가한 상품과 동일한 상품을 미리 불러놓았다면 해당 상품 목록을 지운다
    else
      for vIndex := ADataController.RecordCount-1 downto 0 do
        if ADataController.Values[vIndex, GridTableViewGoodsCode.Index] = ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsCode.Index] then
        begin
          if AskBox(Format('%s(%s) 상품은 이미 발주 등록이 되어 있습니다.'#13'기존 발주에 수량을 추가하시겠습니까?'#13'''아니요''를 누르면 지금 입력한 값이 취소됩니다.', [String(ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsName.Index]), String(ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsCode.Index])])) then
          begin
            ADataController.Values[vIndex, GridTableViewOrderQty.Index] := ADataController.Values[vIndex, GridTableViewOrderQty.Index] + ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewOrderQty.Index];
            CalcAmts;
          end;
          // Post를 취소한다
          ADataController.Cancel;
          break;
        end;
  end;
end;
//------------------------------------------------------------------------------
// 그리드에 값이 적용된 후
procedure TBuyOrderForm.GridTableViewDataControllerAfterPost(ADataController: TcxCustomDataController);
begin
  inherited;

  DisabledCompanyCode;
  if not isLoading then
    isChanged := true;
end;
//------------------------------------------------------------------------------
// 그리드 선택 레코드를 변경할 때
procedure TBuyOrderForm.GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  vIndex: Integer;
begin
  inherited;

  // 신규 상태에서 비 정상적으로 다른 레코드를 선택했다면 다시 신규 상태로 만든다
  if ((APrevFocusedRecord = nil) or (APrevFocusedRecord.Index = GridTableView.DataController.NewItemRecordIndex)) and
     (Assigned(BackupData)) and (High(BackupData) = GridTableView.ColumnCount-1) then
  begin
    // 새 레코드에 기존에 입력된 값을 강제로 다시 넣는다
    GridTableView.DataController.NewItemRowFocused := true;
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] := BackupData[vIndex];
  end;
  SetLength(BackupData, 0);
  BackupData := nil;

  // 신규 입력일 때만 상품코드를 입력할 수 있게 한다
  GridTableViewGoodsCode.Options.Editing  := GridTableView.Controller.IsNewItemRowFocused;
  GridTableViewGoodsCode.Options.Focusing := GridTableViewGoodsCode.Options.Editing;
  // 기존 값일 때만 입력 내용을 삭제할 수 있다
  GridDeleteButton.Enabled                := not GridTableView.Controller.IsNewItemRowFocused;
  // 신상품이냐 여부에 따라 상품이름을 입력할 수 있게 한다
  GridTableViewGoodsName.Options.Editing  := Nvl(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewNew.Index], false);
  GridTableViewGoodsName.Options.Focusing := GridTableViewGoodsName.Options.Editing;
end;
//------------------------------------------------------------------------------
// 상품코드 도움말 버튼을 누를 때
procedure TBuyOrderForm.GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchGoods;
end;
//------------------------------------------------------------------------------
// 상품코드를 검증할 때
procedure TBuyOrderForm.GridTableViewGoodsCodePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vIndex      : Integer;
  vGoodsCode,
  vGoodsName,
  vGoodsSpec,
  vVatYN      : string;
  vStockSafetyQty,
  vStockQty   : Integer;
  vOrderPrice,
  vMasterBuyPrice,
  vMasterSalePrice,
  vBottlePrice: Currency;
begin
  inherited;

  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    if (GetOnlyNumber(DisplayValue) = DisplayValue) and (Length(DisplayValue) in [8, 13, 7, 12, 14]) then
    begin
      // 상품마스터에서 해당 상품을 찾아본다
      OpenQuery('select   case when Isnull(g.YN_LINK, ''N'') = ''Y'' then g.CD_GOODS_L else g.CD_GOODS end as CD_GOODS, '
               +'         g.NM_GOODS, '
               +'         g.NM_SPEC,  '
               +'         g.QTY_SAFETY, '
               +'         dbo.GetStockCount(g.CD_STORE, g.CD_GOODS_T, '''') as QTY_STOCK, '
               +'         case '''+IntToStr(CompanyCodeEdit.Tag)+''' when ''0'' then g.PR_BUY when ''9'' then isnull(l.PR_BUY, g.PR_BUY) end as PR_ORDER, '
               +'         g.PR_BUY as PR_ORDER_M, '
               +'         g.PR_SALE, '
               +'         dbo.GetBottleBuyPrice(g.CD_STORE, g.CD_GOODS) as PR_BOTTLE, '
               +'         DS_TAX '
               +'from     MS_GOODS g left outer join '
               +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL = :P2 '
               +'where    g.CD_STORE = :P0 '
               +'  and   (g.CD_GOODS like ''%''+:P1+''%'' or g.NM_GOODS like ''%''+:P1+''%'' or g.NM_GOODS_SHORT like ''%''+:P1+''%'') '
               +'  and    g.DS_GOODS <> ''B'' '
               +'  and    g.YN_USE   = ''Y''',
               [StoreCode,
                DisplayValue,
                CompanyCodeEdit.Text]);
      isLoading := true;
      try
        if not Query.Eof then
        begin
          // 첫 레코드를 읽어놓는다
          vGoodsCode        := Query.Fields[0].AsString;
          vGoodsName        := Query.Fields[1].AsString;
          vGoodsSpec        := Query.Fields[2].AsString;
          vStockSafetyQty   := Query.Fields[3].AsInteger;
          vStockQty         := Query.Fields[4].AsInteger;
          vOrderPrice       := Query.Fields[5].AsCurrency;
          vMasterBuyPrice   := Query.Fields[6].AsCurrency;
          vMasterSalePrice  := Query.Fields[7].AsCurrency;
          vBottlePrice      := Query.Fields[8].AsCurrency;
          vVatYN            := Query.Fields[9].AsString;
          // 다음 줄로 이동해 검색한 레코드가 여러 건인지 확인한다
          Query.Next;
          // 검색한 레코드가 한 건이라면 바로 적용한다
          if Query.Eof then
          begin
            DisplayValue := vGoodsCode;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index]        := vGoodsName;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsSpec.Index]        := vGoodsSpec;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStockSafetyQty.Index]   := vStockSafetyQty;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewStockQty.Index]         := vStockQty;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderPrice.Index]       := vOrderPrice;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMasterBuyPrice.Index]   := vMasterBuyPrice;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMasterSalePrice.Index]  := vMasterSalePrice;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderBottlePrice.Index] := vBottlePrice;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTaxYN.Index]            := vVatYN;

            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderQty.Index]         := 0;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderAmt.Index]         := 0;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderBottleAmt.Index]   := 0;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderNotAmt.Index]      := 0;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderNetAmt.Index]      := 0;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderVatAmt.Index]      := 0;
            GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewNew.Index]              := false;
            // 각 금액 계산
            CalcAmts;
            DisabledCompanyCode;
            Exit;
          end
          // 검색한 레코드가 여러 건이면 검색을 한다
          else
          begin
            DisplayValue := SearchGoods(DisplayValue);
            GridTableView.Controller.FocusedItemIndex := GridTableViewGoodsCode.Index;
            if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index] <> EmptyStr then
              Exit;
          end;
        end;
      finally
        isLoading := false;
        FinishQuery;
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

      GridTableView.Controller.FocusedItemIndex := GridTableViewGoodsCode.Index;
      if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index] <> EmptyStr then
      begin
        GridTableViewGoodsName.Options.Editing   := false;
        GridTableViewGoodsName.Options.Focusing  := GridTableViewGoodsName.Options.Editing;
        GridTableViewOrderPrice.Options.Editing  := true;
        GridTableViewOrderPrice.Options.Focusing := GridTableViewOrderPrice.Options.Editing;
        Exit;
      end;
    end;
  end
  // 상품코드를 입력하지 않았으면 모든 값을 지운다
  else
    for vIndex := 0 to GridTableView.ColumnCount-1 do
      if (GridTableView.Columns[vIndex].DataBinding.ValueType = 'Integer') or
         (GridTableView.Columns[vIndex].DataBinding.ValueType = 'Currency') then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] := 0
      else
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] := EmptyStr;
end;
//------------------------------------------------------------------------------
// 발주수량을 검증할 때
procedure TBuyOrderForm.GridTableViewOrderQtyPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if Nvl(DisplayValue, 0) = 0 then
    Error := true
  else
  begin
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderQty.Index] := DisplayValue;
    // 금액 재계산
    CalcAmts;
  end;
end;
procedure TBuyOrderForm.HeadOrderButtonClick(Sender: TObject);
var vDisplyValue :Variant;
    vErrorText   :TCaption;
    vError       :Boolean;
begin
  inherited;
  vDisplyValue         := '000000';
  CompanyCodeEdit.Text := vDisplyValue;
  EditPropertiesValidate(CompanyCodeEdit, vDisplyValue, vErrorText, vError);
  HeadOrderButton.Visible := false;
  OrderTypeEdit.Visible   := true;
  isChanged := true;
  DeliveryPlaceEdit.SetFocus;
end;

//------------------------------------------------------------------------------
// 발주단가를 검증할 때
procedure TBuyOrderForm.GridTableViewOrderPricePropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderPrice.Index] := DisplayValue;
  // 금액 재계산
  CalcAmts;
end;
//------------------------------------------------------------------------------
// 발주금액을 검증할 때
procedure TBuyOrderForm.GridTableViewOrderAmtPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  // 금액 기준으로 매입단가 역산
  GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewOrderPrice.Index] := RoundNumber(DisplayValue / GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrderQty.Index], 0.01);
  // 금액 재계산
  CalcAmts;
end;
//------------------------------------------------------------------------------
// 그리드 푸터를 새로 계산할 때
procedure TBuyOrderForm.GridTableViewDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
begin
  inherited;

  // 합계금액을 새로 구한다
  if (Showing) and (GridTableView.DataController.Summary.FooterSummaryItems.Count > 1) then
    OrderAmtEdit.Value := Nvl(GridTableView.DataController.Summary.FooterSummaryValues[1], 0.0);
end;
//------------------------------------------------------------------------------
// 그리드 삭제 버튼
procedure TBuyOrderForm.GridDeleteButtonClick(Sender: TObject);
begin
  inherited;

  if GridTableView.Controller.IsNewItemRowFocused then
  begin
    GridTableView.DataController.Cancel;
    isChanged := true;
  end
  else if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.FocusedRecordIndex >= 0) then
  begin
    GridTableView.DataController.DeleteFocused;
    isChanged := true;
  end;
  DisabledCompanyCode;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 거래처 코드 비활성화
procedure TBuyOrderForm.DamdangTelEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  DisplayValue := GetPhoneNo(DisplayValue);
end;

procedure TBuyOrderForm.DisabledCompanyCode;
begin
  if not CompanyNameEdit.Properties.ReadOnly then
    isChanged := false;

  // 그리드에 값이 입력되면 거래처 코드 등을 수정하지 못하게 막는다
  CompanyCodeEdit.TabStop             := CompanyNameEdit.Text = EmptyStr;
  CompanyNameEdit.Properties.ReadOnly := not CompanyCodeEdit.TabStop;
  if CompanyCodeEdit.TabStop then
    CompanyCodeEdit.Style.Color       := clWindow
  else
    CompanyCodeEdit.Style.Color       := clrDisabled;
  CompanyCodeEdit.Properties.Buttons[0].Enabled := CompanyCodeEdit.TabStop;
end;
//------------------------------------------------------------------------------
// 금액 등 재계산
procedure TBuyOrderForm.CalcAmts(aAllRows: Boolean);
var
  vIndex: Integer;
  vBuyQty: Currency;
begin
  for vIndex := IfThen(aAllRows, 0, GridTableView.DataController.FocusedRecordIndex) to IfThen(aAllRows, GridTableView.DataController.RecordCount-1, GridTableView.DataController.FocusedRecordIndex) do
  begin

    vBuyQty := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index], 0.0);

    if (CompanyTax <> 'T') or (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewTaxYN.Index], '1') = '0') then // 매입단가가 부가세 포함이거나 면세 상품일 때
      GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]          := RoundNumber(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderPrice.Index], 0.0) * vBuyQty )
    else // 매입 단가가 공급가일 때
      GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]          := RoundNumber(Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderPrice.Index], 0.0) * TaxRate * vBuyQty);
    // 공병금액 (공병단가 * (매입수량 - 덤수량))
    GridTableView.DataController.Values[vIndex, GridTableViewOrderBottleAmt.Index]      := Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderBottlePrice.Index], 0) * vBuyQty;
    // 면세금액
    GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index]         := IfThen(GridTableView.DataController.Values[vIndex, GridTableViewTaxYN.Index] = '1', 0, Currency(GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index]));


    // 부가세를 먼저 계산한다
    if GridTableView.DataController.Values[vIndex, GridTableViewTaxYN.Index] = '1' then
    begin
      //부가세(매입금액-공병금액 / 11)
      GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index]  := Trunc((GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewOrderBottleAmt.Index]) / 11);
      GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index]  := GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index];
    end
    else
    begin
      GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index]  := 0;
      GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index]  := GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index];
    end;
  end;
end;
//------------------------------------------------------------------------------
// 거래처 조회
function TBuyOrderForm.SearchCompany(aCompany: string): string;
begin
  Result := EmptyStr;

  // 거래처 조회 폼을 보여준다
  with THelpForm.Create(Self) do
    try
      Caption := '거래처 조회';
      GridTableViewCode.Caption  := '거래처 코드';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '거래처 이름';
      GridTableViewName1.Width   := 340;

      SearchText := aCompany;
      SQLText    := 'select   t.CD_TRDPL, '
                   +'         t.NM_TRDPL, '
                   +'         s.NM_SAWON, '
                   +'         s.TEL_OFFICE, '
                   +'         t.DS_PRICE, '
                   +'         t.DS_DUTYFREE, '
                   +'         t.DS_ORDER '
                   +'from     MS_TRD t left outer join '
                   +'         MS_SAWON s on t.CD_STORE = s.CD_STORE and t.CD_DAMDANG = s.CD_SAWON '
                   +'where    t.CD_STORE  = :P0 '
                   +'  and   (t.CD_TRDPL like ''%''+:P1+''%'' or t.NM_TRDPL like ''%''+:P1+''%'') '
                   +'  and    t.DS_TRDPL  = ''B'' '
                   +'  and    t.DS_STATUS = 0 '
                   +'order by t.CD_STORE, t.CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result               := Code;
        CompanyNameEdit.Text := Names[0];
        DamdangNameEdit.Text := Names[1];
        DamdangTelEdit.Text  := Names[2];
        CompanyNameEdit.Tag  := StrToIntDef(Names[3],0);
        CompanyTax           := Names[4];
        OrderTypeEdit.Tag    := StrToIntDef(Names[5],0);
        SetOrderType;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 상품 조회
function TBuyOrderForm.SearchGoods(aGoods: string): string;
var vSQL   :String;
begin
  Result := EmptyStr;

  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '상품 조회';
      GridTableViewCode.Caption  := Self.GridTableViewGoodsCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := Self.GridTableViewGoodsName.Caption;
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := Self.GridTableViewGoodsSpec.Caption;
      GridTableViewName2.Width   := 60;
      GridTableViewName3.Caption := Self.GridTableViewOrderPrice.Caption;
      GridTableViewName3.Width   := 100;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;

      //검색어가 모두 숫자이면 링크바코드도 조회한다
      if GetOnlyNumber(aGoods) = aGoods then
        vSQL := ''
      else
        vSQL := ' and Isnull(g.YN_LINK, ''N'') = ''N'' ';

      SearchText := aGoods;
      SQLText    := 'select   g.CD_GOODS, '
                   +'         g.NM_GOODS+'' ''+g.NM_SPEC as NM_GOODS_FULL, '
                   +'         g.NM_SPEC,  '
                   +'         case '''+IntToStr(CompanyCodeEdit.Tag)+''' when ''0'' then g.PR_BUY when ''9'' then isnull(l.PR_BUY, g.PR_BUY) end as PR_ORDER, '
                   +'         g.QTY_SAFETY, '
                   +'         s.QTY_STOCK, '
                   +'         g.PR_BUY as PR_ORDER_M, '
                   +'         g.PR_SALE, '
                   +'         case when IsNull(g.CD_BOTTLE,'''') = '''' then 0 else IsNull(o.PR_BUY, 0) end as PR_BOTTLE, '
                   +'         g.DS_TAX, '
                   +'         g.NM_GOODS, '
                   +'         case when Isnull(g.YN_LINK, ''N'') = ''Y'' then g.CD_GOODS_L else g.CD_GOODS end as CD_GOODS_LINK '
                   +'from     MS_GOODS as g left outer join '
                   +'        (select   CD_STORE, '
                   +'                  CD_GOODS, '
                   +'                  Sum(QTY_STOCK) as QTY_STOCK '
                   +'         from    (select   CD_STORE, '
                   +'                           CD_GOODS, '
                   +'                           QTY_BASE as QTY_STOCK '
                   +'                  from     SL_STOCK_MONTH '
                   +'                  where    CD_STORE = :P0 '
                   +'                    and    YM_STOCK = Left(Convert(varchar, GetDate(), 112), 6) '
                   +'                    and    QTY_BASE <> 0 '
                   +'                  union all '
                   +'                  select   b.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_BUY_D as b inner join '
                   +'                           MS_GOODS as g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS '
                   +'                  where    b.CD_STORE = :P0 '
                   +'                    and    b.YMD_BUY like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                  group by b.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   s.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_SALE_D as s inner join '
                   +'                           MS_GOODS  as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
                   +'                  where    s.CD_STORE = :P0 '
                   +'                    and    s.YMD_SALE like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                    and    s.DS_SALE <> ''V'' '
                   +'                  group by s.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   d.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_DISUSE as d inner join '
                   +'                           MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
                   +'                  where    d.CD_STORE = :P0 '
                   +'                    and    d.YMD_DISUSE like Left(Convert(varchar, GetDate(), 112), 6) + ''%'' '
                   +'                  group by d.CD_STORE, g.CD_GOODS_T '
                   +'                  union all '
                   +'                  select   s.CD_STORE, '
                   +'                           g.CD_GOODS_T as CD_GOODS, '
                   +'                           Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
                   +'                  from     SL_SILSA as s inner join '
                   +'                           MS_GOODS as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
                   +'                  where    s.CD_STORE = :P0 '
                   +'                    and    s.YM_SILSA = Left(Convert(varchar, GetDate(), 112), 6) '
                   +'                    and    s.QTY_SETTLE is not null '
                   +'                  group by s.CD_STORE, g.CD_GOODS_T) as k '
                   +'         group by CD_STORE, CD_GOODS) as s on g.CD_STORE = s.CD_STORE and g.CD_GOODS = s.CD_GOODS left outer join '
                   +'         MS_GOODS as  o on g.CD_STORE = o.CD_STORE and g.CD_BOTTLE = o.CD_GOODS and o.DS_GOODS = ''B'' left outer join '
                   +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL ='''+CompanyCodeEdit.Text+''' '
                   +'where    g.CD_STORE  = :P0 '
                   +'  and   (g.CD_GOODS like ''%''+:P1+''%'' or g.NM_GOODS like ''%''+:P1+''%'' or g.NM_GOODS_SHORT like ''%''+:P1+''%'') '
                   +'  and    g.DS_GOODS <> ''B'' '
                   +'  and    g.YN_USE    = ''Y'' '
                   +'order by g.CD_STORE, g.CD_GOODS';
      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Result := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsCode.Index]        := Names[10];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsName.Index]        := Names[9];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewGoodsSpec.Index]        := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewStockSafetyQty.Index]   := StoI(Names[3]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewStockQty.Index]         := StoI(Names[4]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderPrice.Index]       := StoF(Names[2]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewMasterBuyPrice.Index]   := StoF(Names[5]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewMasterSalePrice.Index]  := StoF(Names[6]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderBottlePrice.Index] := StoF(Names[7]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewTaxYN.Index]            := Names[8];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderQty.Index]         := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderAmt.Index]         := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderBottleAmt.Index]   := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderNotAmt.Index]      := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderNetAmt.Index]      := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewOrderVatAmt.Index]      := 0;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewNew.Index]              := false;
        Self.GridTableView.Controller.FocusedItemIndex := Self.GridTableViewOrderQty.Index;
        DisabledCompanyCode;
      end
      else
        Self.GridTableView.Controller.FocusedItemIndex := Self.GridTableViewGoodsCode.Index;
    finally
      Free;
    end;
end;
procedure TBuyOrderForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ConditionToolBarOrderNoEdit.Enabled := not isChanged;
  ButtonToolBarSearchButton.Enabled   := not isChanged;
  ButtonToolBarNewButton.Enabled      := not isChanged;
  ButtonToolBarCancelButton.Enabled   := ButtonToolBarSaveButton.Enabled;
  RequestLoadButton.Enabled           := not isChanged;
end;

procedure TBuyOrderForm.SetOrderType;
begin
  case OrderTypeEdit.Tag of
    0 : OrderTypeEdit.Text := '매입처 오프라인 발주';
    1 : OrderTypeEdit.Text := '매입처 오라인 발주';
    2 : OrderTypeEdit.Text := '본사 발주';
  end;
end;

//------------------------------------------------------------------------------
// 조회
function TBuyOrderForm.DoSearch: Boolean;
begin
  ClearEdit;

  // 전표번호를 잘 입력했는지 확인한다
  if (GetOnlyNumber(ConditionToolBarOrderNoEdit.Text) <> ConditionToolBarOrderNoEdit.Text) or
     (StoI(ConditionToolBarOrderNoEdit.Text) <= 0) then
    ConditionToolBarOrderNoEdit.Text := EmptyStr;

  // 발주번호를 입력했다면 기존 자료를 불러온다
  if ConditionToolBarOrderNoEdit.Text <> EmptyStr then
  begin
    ConditionToolBarOrderNoEdit.Text := LPad(ConditionToolBarOrderNoEdit.Text, 4, '0');
    OpenQuery('select   o.DS_ORDER, '
             +'         o.CD_TRDPL, '
             +'         t.NM_TRDPL, '
             +'         o.REMARK, '
             +'         o.AMT_ORDER, '
             +'         o.NO_BUY_REF, '
             +'         o.NM_DAMDANG, '
             +'         o.TEL_DAMDANG, '
             +'         o.DELIVERY_PLACE, '
             +'         t.DS_PRICE, '
             +'         t.DS_DUTYFREE, '
             +'         o.DS_STEP '
             +'from     SL_ORDER_H as o inner join '
             +'         MS_TRD     as t on o.CD_STORE = t.CD_STORE and o.CD_TRDPL = t.CD_TRDPL '
             +'where    o.CD_STORE  = :P0 '
             +'  and    o.YMD_ORDER = :P1 '
             +'  and    o.NO_ORDER  = :P2',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               ConditionToolBarOrderNoEdit.Text]);
    try
      // 조회 결과 없는 발주 전표이면 전표번호를 지우고 신규로 처리한다
      if Query.Eof then
      begin
        ConditionToolBarOrderNoEdit.Text := EmptyStr;
        ShowMsg('발주 전표가 없습니다.', true);
      end
      else
      // 있는 발주 전표이면 정보를 표시한다
      begin
        OrderTypeEdit.Tag := StoI(Query.Fields[0].AsString);
        SetOrderType;
        case StoI(Query.Fields[11].AsString) of
          0 : StatusEdit.Text := '발주 등록';
          1 : StatusEdit.Text := '발주 확정';
          2 : StatusEdit.Text := '발주 취소';
          3 : StatusEdit.Text := '출고 등록';
          4 : StatusEdit.Text := '매입 완료';
        end;
        StatusEdit.Tag := StoI(Query.Fields[11].AsString);
        HeadOrderButton.Visible := false;
        OrderTypeEdit.Visible   := true;
//        StatusEdit.Tag              := IfThen(Query.Fields[11].AsString = EmptyStr, 1, 2);
//        StatusEdit.Text             := IfThen(StatusEdit.Tag = 1, '발주 완료', '매입 완료');
        CompanyCodeEdit.Text        := Query.Fields[1].AsString;
        CompanyNameEdit.Text        := Query.Fields[2].AsString;

        CommentMemo.Text            := Query.Fields[3].AsString;
        OrderAmtEdit.Value          := Query.Fields[4].AsCurrency;
        DamdangNameEdit.Text        := Query.Fields[6].AsString;
        DamdangTelEdit.Text         := GetPhoneNo(Query.Fields[7].AsString);
        DeliveryPlaceEdit.Text      := Query.Fields[8].AsString;
        CompanyCodeEdit.Tag         := StrToIntDef(Query.Fields[9].AsString,0);
        CompanyTax                  := Query.Fields[10].AsString;
      end;
    finally
      FinishQuery;
    end;

    // 상세 내역을 불러온다
    if ConditionToolBarOrderNoEdit.Text <> EmptyStr then
    begin
      GridTableView.DataController.RecordCount := 0;
      OpenQuery('select   o.CD_GOODS, '
               +'         g.NM_GOODS, '
               +'         g.NM_SPEC, '
               +'         g.QTY_SAFETY, '
               +'         s.QTY_STOCK, '
               +'         o.QTY_ORDER, '
               +'         o.PR_ORDER, '
               +'         g.PR_BUY as PR_ORDER_M, '
               +'         o.AMT_ORDER, '
               +'         o.PR_SALE, '
               +'         g.PR_SALE as PR_SALE_M, '
               +'         o.AMT_BOTTLE / o.QTY_ORDER as PR_BOTTLE, '
               +'         o.AMT_BOTTLE, '
               +'         o.AMT_DUTY, '
               +'         o.AMT_DUTYFREE, '
               +'         o.AMT_TAX, '
               +'         g.DS_TAX, '
               +'         o.SEQ '
               +'from     SL_ORDER_D as o inner join '
               +'         MS_GOODS   as g on o.CD_STORE = g.CD_STORE and o.CD_GOODS = g.CD_GOODS left outer join '
               +'        (select   CD_STORE, '
               +'                  CD_GOODS, '
               +'                  Sum(QTY_STOCK) as QTY_STOCK '
               +'         from    (select   CD_STORE, '
               +'                           CD_GOODS, '
               +'                           QTY_BASE as QTY_STOCK '
               +'                  from     SL_STOCK_MONTH '
               +'                  where    CD_STORE = :P0 '
               +'                    and    YM_STOCK = Left(:P1, 6) '
               +'                    and    QTY_BASE <> 0 '
               +'                  union all '
               +'                  select   b.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           Sum(b.QTY_BUY * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_BUY_D as b inner join '
               +'                           MS_GOODS as g on b.CD_STORE = g.CD_STORE and b.CD_GOODS = g.CD_GOODS '
               +'                  where    b.CD_STORE = :P0 '
               +'                    and    b.YMD_BUY between Left(:P1, 6) + ''01'' and :P1 '
               +'                  group by b.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   s.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           - Sum(s.QTY_SALE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_SALE_D as s inner join '
               +'                           MS_GOODS  as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
               +'                  where    s.CD_STORE = :P0 '
               +'                    and    s.YMD_SALE between Left(:P1, 6) + ''01'' and :P1 '
               +'                    and    s.DS_SALE <> ''V'' '
               +'                  group by s.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   d.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           - Sum(d.QTY_DISUSE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_DISUSE as d inner join '
               +'                           MS_GOODS  as g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS '
               +'                  where    d.CD_STORE = :P0 '
               +'                    and    d.YMD_DISUSE between Left(:P1, 6) + ''01'' and :P1 '
               +'                  group by d.CD_STORE, g.CD_GOODS_T '
               +'                  union all '
               +'                  select   s.CD_STORE, '
               +'                           g.CD_GOODS_T as CD_GOODS, '
               +'                           - Sum(s.QTY_SETTLE * case when g.QTY_NEPUM = 0 then 1 else g.QTY_NEPUM end) as QTY_STOCK '
               +'                  from     SL_SILSA as s inner join '
               +'                           MS_GOODS as g on s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_GOODS '
               +'                  where    s.CD_STORE = :P0 '
               +'                    and    s.YM_SILSA = Left(:P1, 6) '
               +'                    and    Convert(varchar, s.DT_CHANGE, 112) between Left(:P1, 6) + ''01'' and :P1 '
               +'                    and    s.QTY_SETTLE is not null '
               +'                  group by s.CD_STORE, g.CD_GOODS_T) as k '
               +'         group by CD_STORE, CD_GOODS) as s on o.CD_STORE = s.CD_STORE and o.CD_GOODS = s.CD_GOODS '
               +'where    o.CD_STORE  = :P0 '
               +'  and    o.YMD_ORDER = :P1 '
               +'  and    o.NO_ORDER  = :P2 '
               +'order by o.CD_STORE, o.YMD_ORDER, o.NO_ORDER, o.SEQ, o.CD_GOODS',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 ConditionToolBarOrderNoEdit.Text]);
      DM.ReadQuery(Query, GridTableView);
    end;

    DisabledCompanyCode;
    if Grid.Visible and Grid.Enabled then
      Grid.SetFocus;
  end;

  // 발주번호를 입력하지 않으면 신규 상태로 처리한다
  if ConditionToolBarOrderNoEdit.Text = EmptyStr then
    ButtonToolBarNewButton.Click;

  //##### 적정재고현황에서 넘어왔을때 상품 자동입력 처리
  OrderLowStockInsert;

  Result := true;
end;
//------------------------------------------------------------------------------
// 저장
function TBuyOrderForm.DoSave: Boolean;
var
  vIndex     : Integer;
  vExist     : Boolean;
  vOrderNo   : string;
  vNet, vNot, vVat, vBottle, vSum: Currency;
begin
  Result := false;

  // 발주확정,매입 완료
  if StatusEdit.Tag in [1,3,4] then
  begin
    ErrBox(Format('%s 전표는 저장할 수 없습니다.', [StatusEdit.Text]));
    Exit;
  end
  // 발주 취소
  else if StatusEdit.Tag = 2 then
  begin
    if not AskBox(Format('%s 전표입니다.'#13'수정하시겠습니까?', [StatusEdit.Text])) then
      Exit;
  end
  // 발주일자
  else if ConditionToolBarFromDateEdit.Date < Date then
  begin
    if not AskBox(Format('%s가 오늘 날짜보다 이릅니다.'#13'그대로 적용하시겠습니까?', [ConditionToolBarDateLabel.Caption])) then
      Exit;
  end
  // 거래처
  else if CompanyNameEdit.Text = EmptyStr then
  begin
    ErrBox(Replace(CompanyCodeLabel.Caption)+msgMustInput);
    if MainPanel.Enabled and CompanyCodeEdit.Enabled then
      CompanyCodeEdit.SetFocus;
    Exit;
  end;

  // 입력 중이던 자료 포스트
  GridTableView.DataController.Post;
  // 발주 목록을 뒤져서 발주 수량이 입력 되었는지 확인한다
  if GridTableView.DataController.RecordCount = 0 then
    vExist := false
  else
  begin
    vExist := true;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      if (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
         (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],  0)        = 0) then
      begin
        vExist := false;
        break;
      end;
  end;
  if not vExist then
  begin
    ErrBox('발주할 목록을 정상적으로 입력하지 않았거나, 발주 수량을 입력하지 않았습니다.');
    FinishQuery;
    Exit;
  end;


  // 발주 저장
  BeginTrans;
  try
    // 발주 번호를 불러온다
    if (ConditionToolBarOrderNoEdit.Text = EmptyStr) then
    begin
      OpenQuery('select   Max(NO_ORDER) as NO_ORDER '
               +'from     SL_ORDER_H '
               +'where    CD_STORE  = :P0 '
               +'  and    YMD_ORDER = :P1',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date)]);
      try
        vOrderNo := FormatFloat('0000', StoI(Query.Fields[0].AsString)+1);
      finally
        FinishQuery;
      end;
    end
    // 기존 발주자료 수정
    else
    begin
      vOrderNo := LPad(ConditionToolBarOrderNoEdit.Text, 4, '0');
      // 기존 자료를 삭제한다
      ExecQuery('delete from SL_ORDER_H '
               +'where  CD_STORE  = :P0 '
               +'  and  YMD_ORDER = :P1 '
               +'  and  NO_ORDER  = :P2',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vOrderNo],
                 false);
      ExecQuery('delete from SL_ORDER_D '
               +'where  CD_STORE  = :P0 '
               +'  and  YMD_ORDER = :P1 '
               +'  and  NO_ORDER  = :P2',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vOrderNo],
                 false);
    end;

    // 디테일을 저장한다
    vNet    := 0;
    vNot    := 0;
    vVat    := 0;
    vBottle := 0;
    vSum    := 0;
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      ExecQuery('insert into SL_ORDER_D '
               +'( '
               +'  CD_STORE, YMD_ORDER, NO_ORDER, SEQ, CD_GOODS, PR_ORDER, QTY_ORDER, AMT_DUTY, AMT_TAX, AMT_DUTYFREE, AMT_BOTTLE, PR_SALE '
               +') values ( '
               +'  :P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11 '
               +')',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 vOrderNo,
                 vIndex+1,
                 GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewOrderPrice.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewOrderBottleAmt.Index],
                 GridTableView.DataController.Values[vIndex, GridTableViewMasterSalePrice.Index]],
                 false);
      vNet    := vNet    + (Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNetAmt.Index], 0.0) - Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0));
      vNot    := vNot    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderNotAmt.Index], 0.0);
      vVat    := vVat    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderVatAmt.Index], 0.0);
      vBottle := vBottle + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderBottleAmt.Index], 0.0);
      vSum    := vSum    + Nvl(GridTableView.DataController.Values[vIndex, GridTableViewOrderAmt.Index], 0.0);

      GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index] := vIndex+1;

      // 발주요청자료를 불러온 것일 때는 발주요청 원래 자료를 지운다
      if Nvl(GridTableView.DataController.Values[vIndex, GridTableViewRequestLoaded.Index], false) then
        ExecQuery('delete from SL_ORDER_REQUEST '
                 +'where  CD_STORE = :P0 '
                 +'  and  DS_ORDER = :P1 '
                 +'  and  CONVERT(VARCHAR(10), DT_CHANGE, 120) = :P2 '
                 +'  and  CD_GOODS = :P3',
                  [StoreCode,
                   Nvl(GridTableView.DataController.Values[vIndex, GridTableViewRequestDsOrder.Index], EmptyStr),
                   Nvl(GridTableView.DataController.Values[vIndex, GridTableViewRequestDate.Index], EmptyStr),
                   Nvl(GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],   EmptyStr)],
                   false);
    end;
    // 마스터를 저장한다
    ExecQuery('insert into SL_ORDER_H '
             +'( '
             +'  CD_STORE, YMD_ORDER, NO_ORDER, DS_ORDER, DS_STEP, CD_TRDPL, AMT_DUTY, AMT_TAX, AMT_DUTYFREE, AMT_BOTTLE, REMARK, CD_SAWON_CHG, DELIVERY_PLACE, NM_DAMDANG, TEL_DAMDANG, DT_CHANGE, DS_TRANS '
             +') values ( '
             +'  :P0, :P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9, :P10, :P11, :P12, :P13, :P14, GetDate(), 0 '
             +')',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               vOrderNo,
               IntToStr(OrderTypeEdit.Tag),
               IntToStr(StatusEdit.Tag),
               CompanyCodeEdit.Text,
               vNet,
               vVat,
               vNot,
               vBottle,
               CommentMemo.Text,
               UserCode,
               DeliveryPlaceEdit.Text,
               DamdangNameEdit.Text,
               DamdangTelEdit.Text],
               false);

    CommitTrans;

    isChanged := false;
    StatusEdit.Text := '발주 완료';
    ConditionToolBarOrderNoEdit.Text := vOrderNo;

    if AskBox('발주서를 출력하시겠습니까?') then Print;

    // 매입정정에서 넘어왔을 때는 폼을 닫는다
    if not ButtonToolBarNewButton.Visible then
    begin
      Close;
      FormParam[0] := 'BuyOrder';
      ExtremeMainForm.RunProgram('BuyOrderModify');
    end
    // 매입폼에서 불러왔을 때는 자동으로 신규 버튼을 눌러 화면을 지운다 별걸 다 요구한다... 짜증...
    else
      ButtonToolBarNewButton.Click;

    Result := true;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;



//적정재고현황에서 넘어왔을때 상품 자동입력 처리
procedure TBuyOrderForm.OrderLowStockInsert;
var
  vGoodsList: TStringList;
  vQtyList  : TStringList;
  vIndex    : Integer;
begin
  inherited;

  //########
  if FormParam[2] <> EmptyStr then
  begin
    CompanyCodeEdit.Text := FormParam[0];
    FormParam[0] := EmptyStr;
    CompanyNameEdit.Text := FormParam[1];
    FormParam[1] := EmptyStr;

    vGoodsList := TStringList.Create;
    ExtractStrings([','], [#0], PWideChar(FormParam[2]), vGoodsList);
    FormParam[2] := EmptyStr;

    vQtyList   := TStringList.Create;
    ExtractStrings([','], [#0], PWideChar(FormParam[3]), vQtyList);
    FormParam[3] := EmptyStr;

    for vIndex := 0 to vGoodsList.Count - 1 do
    begin
      OpenQuery('select   CD_GOODS, '
               +'         NM_GOODS, '
               +'         NM_SPEC, '
               +'         QTY_SAFETY, '
               +'         QTY_ORDER_UNIT, '
               +'         dbo.GetStockCount(CD_STORE, CD_GOODST, '''') as QTY_STOCK, '
               +'         PR_BUY, '
               +'         dbo.GetBottleBuyPrice(CD_STORE, CD_GOODS) as PR_BOTTLE, '
               +'         DS_TAX, '
               +'         PR_SALE '
               +'from     MS_GOODS '
               +'where    CD_STORE = :P0 '
               +'  and    CD_GOODS = :P1 '
               +'  and    YN_USE   = ''Y''',
               [StoreCode,
                vGoodsList[vIndex]]);
      try
        try
          if not Query.Eof then
          begin
            GridTableView.DataController.AppendRecord;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]        := Query.Fields[0].AsString;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]        := Query.Fields[1].AsString;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewStockSafetyQty.Index]   := Query.Fields[3].AsInteger;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewStockQty.Index]         := Query.Fields[5].AsInteger;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index]       := Query.Fields[6].AsCurrency;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderBottlePrice.Index]  := Query.Fields[7].AsCurrency;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTaxYN.Index]             := IfThen(Query.Fields[8].AsString = '0', 'N', 'Y');
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewMasterSalePrice.Index]   := Query.Fields[9].AsCurrency;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderQty.Index]          := vQtyList[vIndex];
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderBottleAmt.Index]    := GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderQty.Index] * Query.Fields[7].AsCurrency;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderAmt.Index]          := GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderQty.Index] * GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index];
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderNotAmt.Index]       := GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderQty.Index] * IfThen(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTaxYN.Index] = 'Y', 0, GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index]);
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderNetAmt.Index]       := GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderQty.Index] * IfThen(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTaxYN.Index] = 'N', 0, CeilNumber(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderPrice.Index] / TaxRate));
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderVatAmt.Index]       := IfThen(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTaxYN.Index] = 'N', 0, GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderAmt.Index] - GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewOrderNetAmt.Index]);
//            GridTableView.DataController.Post;
          end;
        except
          ErrBox('상품을 읽지못하였습니다.');
          Break;
        end;
      finally
        FinishQuery;
      end;
    end;
  end;
end;

procedure TBuyOrderForm.Print;
var
  vMemo : TfrxMemoView;
  vPicture: TfrxPictureView;
  vTitle: TfrxReportTitle;
  vIndex: Integer;
begin
  // 발주번호
  vMemo := TfrxMemoView(FastReport.FindObject('OrderNo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '발주번호 : '+DtoS(ConditionToolBarFromDateEdit.Date)+'-'+ConditionToolBarOrderNoEdit.Text;

  vPicture := TfrxPictureView(FastReport.FindObject('SignPicture'));
  if Assigned(vPicture) then
    vPicture.Picture.Assign(StoreSignImage);

  // 날짜
  vMemo := TfrxMemoView(FastReport.FindObject('OrderDate'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatDateTime('yyyy"년 "mm"월 "dd"일"', ConditionToolBarFromDateEdit.Date);

  //거래처
  vMemo := TfrxMemoView(FastReport.FindObject('CompanyName'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '수신 : '+CompanyNameEdit.Text;

  // 발주금액
  vMemo := TfrxMemoView(FastReport.FindObject('OrderAmt'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := LPad(FormatFloat('#,0',OrderAmtEdit.Value),20)+' 원';

  // 비고
  vMemo := TfrxMemoView(FastReport.FindObject('Remark'));
  if Assigned(vMemo) then
  begin
    vMemo.Memo.Text := CommentMemo.Text;
    vMemo.Height    := CommentMemo.Lines.Count * 16;
  end;
  vTitle := TfrxReportTitle(FastReport.FindObject('ReportTitle'));
  if Assigned(vTitle) then
    vTitle.Height := 179 + CommentMemo.Lines.Count * 16;

  // 비고 줄 수에 따라 디테일 레코드 수 결정
  RecordCount := GridTableView.DataController.RowCount;
  vIndex      := 31 - (CommentMemo.Lines.Count * 2 div 3);
  // 1페이지
  if RecordCount <= vIndex then
    RecordCount := vIndex
  // 2페이지부터
  else
    RecordCount := ((RecordCount - vIndex) div 40) * 40 + vIndex + Ifthen(((RecordCount - vIndex) mod 40)=0,0,40);

  // 발주처
  vMemo := TfrxMemoView(FastReport.FindObject('StoreName'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := StoreName;

  // 납품장소
  vMemo := TfrxMemoView(FastReport.FindObject('DeliveryPlace'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := DeliveryPlaceEdit.Text;

  //담당자
  vMemo := TfrxMemoView(FastReport.FindObject('DamdangName'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := DamdangNameEdit.Text;

  //연락처
  vMemo := TfrxMemoView(FastReport.FindObject('DamdangTel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := DamdangTelEdit.Text;

  // 발주금액
  vMemo := TfrxMemoView(FastReport.FindObject('TotalAmt'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatFloat('#,0',OrderAmtEdit.Value);

  // 출력일시
  vMemo := TfrxMemoView(FastReport.FindObject('PrintTime'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '출력일시 : '+FormatDateTime(fmtDateTime, Now);

  FastReport.ShowReport;
  if TifFilePrintCheckBox.Checked then
  begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'발주서') then
      ForceDirectories(ExtractFilePath(Application.ExeName)+'발주서');
    frxTIFFExport1.DefaultPath := ExtractFilePath(Application.ExeName)+'발주서';
    frxTIFFExport1.FileName    := CompanyNameEdit.Text
                                  +'('+Replace(ConditionToolBarFromDateEdit.Text,'-','')+'-'+
                                       ConditionToolBarOrderNoEdit.Text+')';
    FastReport.Export(frxTIFFExport1);
  end;
  // 출력
//  if aPrint then
//    FastReport.Print
//  else

end;

end.
