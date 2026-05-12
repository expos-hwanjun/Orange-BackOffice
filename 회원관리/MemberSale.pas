unit MemberSale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxStyles, Menus, cxLookAndFeelPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxGridCustomTableView,
  cxGridTableView, cxControls, cxGridCustomView, cxCheckBox, StdCtrls,
  cxButtons, cxCurrencyEdit, cxButtonEdit, cxMemo, ExtCtrls, cxClasses,
  cxGridLevel, cxGrid, AdvToolBar, AdvToolBarStylers, cxContainer, DBAccess,
  Uni, DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, StrUtils, cxLookAndFeels, Math, DateUtils, frxClass,
  AdvOfficeButtons, frxExportImage, ImgList;

type
  TMemberSaleForm = class(TInheritEditForm)
    MainPanel: TPanel;
    SaleDateLabel: TLabel;
    CompanyCodeLabel: TLabel;
    CommentLabel: TLabel;
    BuyTotalAmtLabel: TLabel;
    DCAmtLabel: TLabel;
    BuyAmtLabel: TLabel;
    CompanyNameEdit: TcxTextEdit;
    CommentMemo: TcxMemo;
    ReceiptNoEdit: TcxTextEdit;
    CompanyCodeEdit: TcxButtonEdit;
    SaleTotalAmtEdit: TcxCurrencyEdit;
    DCAmtEdit: TcxCurrencyEdit;
    SaleAmtEdit: TcxCurrencyEdit;
    SaleTypeEdit: TcxTextEdit;
    Label1: TLabel;
    CashAmtEdit: TcxCurrencyEdit;
    Label2: TLabel;
    TrustAmtEdit: TcxCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    NetTotalAmtEdit: TcxCurrencyEdit;
    TaxTotalAmtEdit: TcxCurrencyEdit;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;
    PosNoEdit: TcxTextEdit;
    Label5: TLabel;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewSeq: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewTotAmt: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridTableViewBottlePrice: TcxGridColumn;
    GridTableViewBottleAmt: TcxGridColumn;
    GridTableViewReceiptDc: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewVatAmt: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewSaleProfit: TcxGridColumn;
    GridTableViewEventCode: TcxGridColumn;
    GridTableViewEventName: TcxGridColumn;
    GridTableViewEventPrice: TcxGridColumn;
    GridTableViewEventDcAmt: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GoodsPanel: TPanel;
    GoodsCodeEdit: TcxTextEdit;
    Label7: TLabel;
    GoodsSearchButton: TcxButton;
    GoodsDeleteButton: TcxButton;
    SaleHistoryButton: TcxButton;
    GridTableMasterView: TcxGridTableView;
    GridTableDetailView: TcxGridTableView;
    GridTableMasterViewColumn1: TcxGridColumn;
    GridTableMasterViewColumn2: TcxGridColumn;
    GridTableMasterViewColumn3: TcxGridColumn;
    GridTableMasterViewColumn4: TcxGridColumn;
    GridTableMasterViewColumn5: TcxGridColumn;
    GridTableMasterViewColumn6: TcxGridColumn;
    GridTableMasterViewColumn7: TcxGridColumn;
    GridTableMasterViewColumn8: TcxGridColumn;
    GridTableMasterViewColumn9: TcxGridColumn;
    GridTableMasterViewColumn10: TcxGridColumn;
    GridTableMasterViewColumn11: TcxGridColumn;
    GridTableMasterViewColumn13: TcxGridColumn;
    GridTableDetailViewColumn1: TcxGridColumn;
    GridTableDetailViewColumn2: TcxGridColumn;
    GridTableDetailViewColumn3: TcxGridColumn;
    GridTableDetailViewColumn5: TcxGridColumn;
    GridTableDetailViewColumn6: TcxGridColumn;
    GridTableDetailViewColumn7: TcxGridColumn;
    Label8: TLabel;
    MasterSalePriceEdit: TcxCurrencyEdit;
    Label9: TLabel;
    SalePriceAEdit: TcxCurrencyEdit;
    SalePriceBEdit: TcxCurrencyEdit;
    SalePriceCEdit: TcxCurrencyEdit;
    SalePriceDEdit: TcxCurrencyEdit;
    SalePriceEEdit: TcxCurrencyEdit;
    Label10: TLabel;
    LastSalePriceEdit: TcxCurrencyEdit;
    LastSaleDateLabel: TLabel;
    GridTableViewMasterSalePrice: TcxGridColumn;
    GridTableViewSalePriceA: TcxGridColumn;
    GridTableViewSalePriceB: TcxGridColumn;
    GridTableViewSalePriceC: TcxGridColumn;
    GridTableViewSalePriceD: TcxGridColumn;
    GridTableViewSalePriceE: TcxGridColumn;
    GridTableViewLastSalePrice: TcxGridColumn;
    GridTableViewLastSaleDate: TcxGridColumn;
    DefaultFocusCheckBox: TcxCheckBox;
    Label11: TLabel;
    CreditAmtEdit: TcxCurrencyEdit;
    GridTableViewBuyAmt: TcxGridColumn;
    AllCancelButton: TcxButton;
    MasterBuyPriceEdit: TcxCurrencyEdit;
    GridTableViewYNPoint: TcxGridColumn;
    GridTableViewYNDc: TcxGridColumn;
    GridTableDetailViewColumn4: TcxGridColumn;
    GridTableMasterViewColumn14: TcxGridColumn;
    GridTableMasterViewColumn15: TcxGridColumn;
    FastReportDataSet: TfrxUserDataSet;
    GridTableMasterViewColumn16: TcxGridColumn;
    GridTableMasterViewColumn17: TcxGridColumn;
    GridTableMasterViewColumn18: TcxGridColumn;
    GridTableMasterViewColumn12: TcxGridColumn;
    GridTableViewDcPrice: TcxGridColumn;
    FastReport: TfrxReport;
    FastReportSaleDataSet: TfrxUserDataSet;
    Label6: TLabel;
    CardAmtEdit: TcxCurrencyEdit;
    GridTableDetailViewNepumQty: TcxGridColumn;
    Label12: TLabel;
    RemainEdit: TcxCurrencyEdit;
    CompanyRankEdit: TcxTextEdit;
    StockSearchButton: TcxButton;
    GridTableMasterViewColumn19: TcxGridColumn;
    Label13: TLabel;
    procedure FormShow(Sender: TObject);
    procedure GridTableViewSaleQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewSalePricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure FormCreate(Sender: TObject);
    procedure CompanyCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure GridTableViewGoodsCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GoodsDeleteButtonClick(Sender: TObject);
    procedure GoodsCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure CompanyCodeEditPropertiesChange(Sender: TObject);
    procedure GoodsSearchButtonClick(Sender: TObject);
    procedure SaleHistoryButtonClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure FastReportSaleDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportSaleDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
    procedure GridTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridTableViewEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure CompanyCodeEditKeyPress(Sender: TObject; var Key: Char);
    procedure AllCancelButtonClick(Sender: TObject);
    procedure GridTableViewDcPricePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure StockSearchButtonClick(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
  private
    isNew       :Boolean;
    InsertDate  :String;
    DutyFreeAmt :Currency;
    CutDcAmt    :Integer;
    GoodsDcAmt  :Integer;    //단품할인금액
    ProfitAmt   :Currency;
    RecordCount :Integer;
    isTrust     :Boolean;    //외상가능여부
    isEvent     :Boolean;    //행사적용여부
    CompanyLimit:Integer;    //외상한도
    PointExist   :Integer;   //포인트제외금액
    BackupData  :array[0..2] of array of Variant;
    procedure CalcAmts;
    function  SearchGoods(aGoods: string = ''; aQty:Integer=1): string;
    function  SearchCompany(aCompany: string = ''): string;
    procedure AllotDc;
    function  GetEvent(aGoods: string):Boolean;
    function  CheckClose:Boolean;
    procedure Print;
    procedure CompanyCreditAmt;
    function  GetMemberTrust:Boolean;
  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSearch: Boolean; override;
    function  DoSave  : Boolean; override;
  public
    { Public declarations }
  end;

var
  MemberSaleForm: TMemberSaleForm;

implementation
uses Common, Help, DBModule;
{$R *.dfm}

{ TMemberSaleForm }
procedure TMemberSaleForm.FormCreate(Sender: TObject);
begin
  inherited;
  isNew := false;
  //매출처 판매시 판매단가에 수수점 사용여부
  if GetOption(260) = '1' then
  begin
    TcxCustomCurrencyEditProperties(GridTableViewSalePrice.Properties).DisplayFormat := ',0.00';
    TcxCustomCurrencyEditProperties(GridTableViewSalePrice.Properties).DecimalPlaces := 2;
  end;
end;

procedure TMemberSaleForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // 그리드 OnKeyDown 이벤트는 Enter키 입력이 되지 않아서 폼에서 처리한다
  case Key of
    VK_F3 : if ButtonToolBarNewButton.Enabled then ButtonToolBarNewButton.Click;
    VK_F7 : if ButtonToolBarCancelButton.Enabled then ButtonToolBarCancelButton.Click;
    VK_F8 : if GoodsSearchButton.Enabled then GoodsSearchButton.Click;
    VK_F9 : if GoodsDeleteButton.Enabled then GoodsDeleteButton.Click;
    VK_F10: if AllCancelButton.Enabled then AllCancelButton.Click;
  end;
end;

procedure TMemberSaleForm.FormShow(Sender: TObject);
begin
  inherited;
  //회원매출관리에서 실행시켰을때
  //##### 이벤트 처리
  if Length(FormParam[0]) = 16 then
  begin
    isLoading := true;
    ConditionToolBarFromDateEdit.Text  := LeftStr(FormParam[0],10);
    PosNoEdit.Text     := Copy(FormParam[0],11,2);
    ReceiptNoEdit.Text := RightStr(FormParam[0],4);
    DoSearch;
    ButtonToolBarSearchButton.Visible := False;
    FormParam[0] := EmptyStr;
    isNew := false;
    isLoading := false;
  end
  else
    ButtonToolBarNewButton.Click;
end;

function TMemberSaleForm.DoSearch: Boolean;
begin
  Result := false;
  if CheckClose then
    Exit;

  try
    isLoading := true;
    OpenQuery('select   dbo.StoD(a.YMD_SALE) as YMD_SALE, '
             +'         a.NO_POS+''-''+a.NO_RCP as RECEIPT, '
             +'         case a.DS_SALE when ''S'' then ''판매'' when ''B'' then ''반품'' when ''V'' then ''취소'' end as DS_SALE, '
             +'         a.CD_MEMBER, '
             +'         b.NM_MEMBER, '
             +'         a.AMT_SALE + a.DC_TOT as AMT_TOT, '
             +'         a.DC_TOT, '
             +'         a.AMT_SALE, '
             +'         a.AMT_TRUST, '
             +'         a.AMT_CASH, '
             +'         a.AMT_CARD, '
             +'         a.DC_RECEIPT, '
             +'         b.YN_TRUST, '
             +'         b.AMT_TRUST_LIMIT, '
             +'         Convert(varchar(16), a.DT_SALE, 120) as DT_SALE, '
             +'         b.DS_PRICE, '
             +'         b.YN_BACKOFFICE_EVENT '
             +'from     SL_SALE_H as a inner join '
             +'         MS_MEMBER as b on b.CD_STORE =:P4 and a.CD_MEMBER = b.CD_MEMBER '
             +'where    a.CD_STORE = :P0 '
             +'  and    a.YMD_SALE = :P1 '
             +'  and    a.NO_POS   = :P2 '
             +'  and    a.NO_RCP   = :P3 ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               PosNoEdit.Text,
               ReceiptNoEdit.Text,
               Ifthen(GetOption(257)='0', StoreCode, HeadStoreCode)]);
    try
      // 조회 결과 없는 매입 전표이면 전표번호를 지우고 신규로 처리한다
      if Query.Eof then
      begin
        ConditionToolBarEdit.Text := EmptyStr;
        ShowMsg('판매 전표가 없습니다.', true);
      end
      else
      // 있는 매입 전표이면 정보를 표시한다
      begin
//        ConditionToolBarFromDateEdit.Text           := Query.Fields[0].AsString;
//        ReceiptNoEdit.Text          := Query.Fields[1].AsString;
        SaleTypeEdit.Text           := Query.Fields[2].AsString;
        CompanyCodeEdit.Text        := Query.Fields[3].AsString;
        CompanyNameEdit.Text        := Query.Fields[4].AsString;
        SaleTotalAmtEdit.Value      := Query.Fields[5].AsCurrency;
        DCAmtEdit.Value             := Query.Fields[6].AsCurrency;
        SaleAmtEdit.Value           := Query.Fields[7].AsCurrency;
        TrustAmtEdit.Value          := Query.Fields[8].AsCurrency;
        CashAmtEdit.Value           := Query.Fields[9].AsCurrency;
        CardAmtEdit.Value           := Query.Fields[10].AsCurrency;
        isTrust                     := Query.Fields[12].AsString = 'Y';
        CompanyLimit                := Query.Fields[13].AsInteger;
        InsertDate                  := Query.Fields[14].AsString;
        CompanyCodeEdit.Tag         := StrToIntDef(Query.Fields[15].AsString,0);
        isEvent                     := Query.Fields[16].AsString = 'Y';
        ConditionToolBarFromDateEdit.Enabled        := False;
        CompanyCodeEdit.Enabled     := false;
        MainPanel.Enabled           := true;
        GoodsPanel.Enabled          := true;
      end;
    finally
      FinishQuery;
    end;

    //행사상품일때는 상품할인에 행사단가를 넣는다
    OpenQuery('select   a.SEQ, '
             +'         a.CD_GOODS, '
             +'         b.NM_GOODS, '
             +'         b.NM_SPEC, '
             +'         a.QTY_SALE, '
             +'         a.PR_SALE, '
             +'         a.AMT_SALE, '
             +'         a.AMT_SALE - a.DC_GOODS - a.DC_SPC as AMT_SALE_REAL, '
             +'         case when a.NO_SPC <> '''' then a.DC_SPC else a.DC_GOODS end as DC_GOODS, '
             +'         dbo.GetBottleSalePrice(b.CD_STORE, b.CD_GOODS) as PR_SALE_BOTTLE, '
             +'         b.DS_TAX, '
             +'         b.PR_BUY, '
             +'         b.PR_SALE_PROFIT, '
             +'         a.NO_SPC, '
             +'         d.NM_SPC, '
             +'         a.PR_SALE - Isnull(e.PR_SALE,0) as PR_SALE_SPC, '
             +'         case when a.NO_SPC = '''' then a.DC_GOODS / a.QTY_SALE else a.DC_SPC / a.QTY_SALE end as DC_PRICE, '
             +'         case when a.NO_SPC = '''' then a.DC_GOODS else a.DC_SPC end as DC_GOODS, '
             +'         a.DC_RECEIPT, '
             +'         a.AMT_BOTTLE, '
             +'         b.PR_SALE as PR_SALE_M, '
             +'         b.PR_SALE_TRD1, '
             +'         b.PR_SALE_TRD2, '
             +'         b.PR_SALE_TRD3, '
             +'         b.PR_SALE_TRD4, '
             +'         b.PR_SALE_TRD5, '
             +'         b.PR_SALE_TRD1, '
             +'         a.AMT_VAT, '
             +'         a.AMT_BUY, '
             +'         Isnull(l.PR_SALE,0) as PR_SALE_LAST, '
             +'         Isnull(l.YMD_SALE,'''') as YMD_SALE_LAST, '
             +'         b.YN_POINT, '
             +'         b.YN_DC, '
             +'         case when Isnull(b.YN_LINK, ''N'') = ''Y'' then b.CD_GOODS_L else b.CD_GOODS end as CD_GOODS_L '
             +'from     SL_SALE_D as a inner join '
             +'         MS_GOODS  as b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS left outer join '
             +'         MS_GOODS  as c on b.CD_STORE = c.CD_STORE and b.CD_BOTTLE = c.CD_GOODS left outer join '
             +'         MS_SPC_H  as d on a.CD_STORE = d.CD_STORE and a.NO_SPC    = d.NO_SPC left outer join '
             +'         MS_SPC_D  as e on a.CD_STORE = e.CD_STORE and a.NO_SPC    = e.NO_SPC and a.CD_GOODS = e.CD_GOODS left outer join '
             +'         MS_GOODS_TRD as l on b.CD_STORE = l.CD_STORE and b.CD_GOODS = l.CD_GOODS and l.CD_TRDPL = '''+CompanyCodeEdit.Text+''' '
             +'where    a.CD_STORE = :P0 '
             +'  and    a.YMD_SALE = :P1 '
             +'  and    a.NO_POS   = :P2 '
             +'  and    a.NO_RCP   = :P3 ',
              [StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               PosNoEdit.Text,
               ReceiptNoEdit.Text]);
    DM.ReadQuery(Query, GridTableView);
    result := true;
  finally
    isLoading := false;
    GridTableView.Controller.FocusedRecordIndex := 0;
    CalcAmts;
    CompanyCreditAmt;
  end;
end;

function TMemberSaleForm.DoSave: Boolean;
var vIndex,
    vSeq    :Integer;
    vCashPoint, vTrustPoint, vCardPoint,
    vPointExist:Currency;
begin
  Result := false;

  if CompanyCodeEdit.Text = EmptyStr then
  begin
    ErrBox('회원'+msgMustInput);
    Exit;
  end;
  if GridTableView.DataController.RecordCount = 0 then
  begin
    ErrBox('판매 상품이 없습니다.');
    Exit;
  end;
  if not GetMemberTrust and (TrustAmtEdit.Value > 0) then
  begin
    ErrBox('외상을 할 수 없는 회원입니다.');
    Exit;
  end;
  if (CashAmtEdit.Value + TrustAmtEdit.Value + CardAmtEdit.Value) <> SaleAmtEdit.Value then
  begin
    ErrBox('판매금액과 결제금액이 다릅니다.');
    CashAmtEdit.SetFocus;
    Exit;
  end;

  //외상한도 체크
  if TrustAmtEdit.Value > 0 then
  begin
    try
      OpenQuery('select Isnull(t2.AMT_BASE,0) + SUM(t3.AMT_TRUST) - SUM(t4.AMT_PAYIN-t4.AMT_DC) as AMT_MISU '
               +' from MS_MEMBER t1 left outer join '
               +'      SL_BOOKS_MONTH t2 on t2.CD_STORE =:P0 and t1.CD_MEMBER = t2.CD_CODE   and t2.CD_CLOSE = ''20'' and t2.ym_close = Convert(varchar(6), getdate(), 112)+''01''  left outer join '
               +'      SL_SALE_H      t3 on t3.CD_STORE =:P0 and t1.CD_MEMBER = t3.CD_MEMBER and t3.YMD_SALE  between Convert(varchar(6), getdate(), 112)+''01'' and Convert(varchar(6), getdate(), 112)+''31'' and t3.DS_SALE <> ''V'' left outer join '
               +'      SL_ACCT        t4 on t3.CD_STORE =:P0 and t1.CD_MEMBER = t4.CD_MEMBER and t4.YMD_OCCUR between Convert(varchar(6), getdate(), 112)+''01'' and Convert(varchar(6), getdate(), 112)+''31'' '
               +'where t1.CD_STORE = :P2 '
               +'  and t1.CD_MEMBER = :P1 '
               +'group by t2.AMT_BASE ',
               [StoreCode,
                CompanyCodeEdit.Text,
                Ifthen(GetOption(257)='0', StoreCode, HeadStoreCode)]);

      if (CompanyLimit > 0) and ((Query.Fields[0].AsCurrency + TrustAmtEdit.Value)  > CompanyLimit) then
      begin
        ErrBox('외상한도를 초과합니다.');
        Exit;
      end;
    finally
      FinishQuery;
    end;
  end;

  // 마감 되었으면 저장 못 함
  if CheckClose then
    Exit;

  try
    BeginTrans;
    GridTableView.DataController.PostEditingData;
    if isNew then
    begin
      try
        OpenQuery('select dbo.LPad( Isnull(Max(NO_RCP),''0'')+1, 4, ''0'') '
                 +'from   SL_SALE_H '
                 +'where  CD_STORE = :P0 '
                 +'  and  YMD_SALE = :P1 '
                 +'  and  NO_POS   = :P2 ',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  PosNoEdit.Text]);
        ReceiptNoEdit.Text := Query.Fields[0].AsString;
      finally
        FinishQuery;
      end;
    end;

    //포인트계산
    try
      OpenQuery('select Isnull(a.NM_CODE4,0), '    //0 현금
               +'       Isnull(a.NM_CODE5,0), '    //1
               +'       Isnull(a.NM_CODE8,0), '    //2 카드
               +'       Isnull(a.NM_CODE9,0), '    //3
               +'       Isnull(a.NM_CODE12,0), '   //4 외상
               +'       Isnull(a.NM_CODE13,0) '    //5
               +'from   MS_CODE   a inner join '
               +'       MS_MEMBER b on b.CD_STORE =:P2 and a.CD_CODE = b.DS_MEMBER  '
               +'where  a.CD_STORE = :P0 '
               +'  and  b.CD_MEMBER = :P1 '
               +'  and  a.CD_KIND  = ''05'' ',
               [StoreCode,
                CompanyCodeEdit.Text,
                Ifthen(GetOption(257)='0', StoreCode, HeadStoreCode)]);

      vTrustPoint := 0;
      vCardPoint  := 0;
      vCashPoint  := 0;
      vPointExist := PointExist;
      if not Query.Eof then
      begin
        if (StrToIntDef(Query.Fields[0].AsString,0) > 0) and (CashAmtEdit.Value <> 0) then
        begin
          if (CashAmtEdit.Value >= vPointExist) then
          begin
            vCashPoint := Trunc((CashAmtEdit.Value - vPointExist) / StrToIntDef(Query.Fields[0].AsString,0)) * StrToIntDef(Query.Fields[1].AsString,0);
            vPointExist := vPointExist - CashAmtEdit.Value;
            if vPointExist < 0 then vPointExist := 0;
          end
          else
          begin
            vCashPoint := 0;
            vPointExist := vPointExist - CashAmtEdit.Value;
            if vPointExist < 0 then vPointExist := 0;
          end;
        end;

        if (StrToIntDef(Query.Fields[4].AsString,0) > 0) and (TrustAmtEdit.Value <> 0) then
        begin
          if (TrustAmtEdit.Value >= vPointExist) then
          begin
            vTrustPoint := Trunc((TrustAmtEdit.Value - vPointExist) / StrToIntDef(Query.Fields[4].AsString,0)) * StrToIntDef(Query.Fields[5].AsString,0);
            vPointExist := vPointExist - TrustAmtEdit.Value;
            if vPointExist < 0 then vPointExist := 0;
          end
          else
          begin
            vTrustPoint := 0;
            vPointExist := vPointExist - TrustAmtEdit.Value;
            if vPointExist < 0 then vPointExist := 0;
          end;
        end;

        if (StrToIntDef(Query.Fields[2].AsString,0) > 0) and (CardAmtEdit.Value <> 0) then
        begin
          if (CardAmtEdit.Value >= vPointExist) then
          begin
            vCardPoint := Trunc((CardAmtEdit.Value - vPointExist) / StrToIntDef(Query.Fields[2].AsString,0)) * StrToIntDef(Query.Fields[3].AsString,0);
//            vPointExist := vPointExist - CardAmtEdit.Value;
//            if vPointExist < 0 then vPointExist := 0;
          end
          else
          begin
            vCardPoint := 0;
//            vPointExist := vPointExist - CardAmtEdit.Value;
//            if vPointExist < 0 then vPointExist := 0;
          end;
        end;
      end;
    finally
      FinishQuery;
    end;

    //##### vPointExist의 용도가 뭐냐고????

    ExecQuery(ifThen(isNew, 'insert into SL_SALE_H(CD_STORE, '
             +'                                    YMD_SALE, '
             +'                                    NO_POS, '
             +'                                    NO_RCP, '
             +'                                    DS_SALE, '
             +'                                    CD_MEMBER, '
             +'                                    AMT_SALE, '
             +'                                    AMT_BUY, '
             +'                                    AMT_CASH, '
             +'                                    AMT_TRUST, '
             +'                                    AMT_CARD, '
             +'                                    DC_SPC, '
             +'                                    DC_GOODS, '
             +'                                    DC_RECEIPT, '
             +'                                    DC_CUT, '
             +'                                    AMT_DUTYFREE, '
             +'                                    AMT_DUTY, '
             +'                                    AMT_TAX, '
             +'                                    AMT_BOTTLE, '
             +'                                    PNT_OCCUR, '
             +'                                    NO_CLOSE, '
             +'                                    CD_SAWON,  '
             +'                                    DT_SALE, '
             +'                                    REMARK '
             +'                                    ) '
             +'                            VALUES (:P0, '
             +'                                    :P1, '
             +'                                    :P2, '
             +'                                    :P3, '
             +'                                    ''S'', '
             +'                                    :P4, '
             +'                                    :P5, '
             +'                                    :P6, '
             +'                                    :P7, '
             +'                                    :P8, '
             +'                                    :P9, '
             +'                                    :P10, '
             +'                                    :P11, '
             +'                                    :P12, '
             +'                                    :P13, '
             +'                                    :P14, '
             +'                                    :P15, '
             +'                                    :P16, '
             +'                                    :P17, '
             +'                                    :P18, '
             +'                                    0, '
             +'                                    :P19, '
             +'                                    GetDate(), '
             +'                                    :P20 '
             +'                                    ) ',
              'update SL_SALE_H set CD_MEMBER    =:P4, '
             +'                     AMT_SALE     =:P5, '
             +'                     AMT_BUY      =:P6, '
             +'                     AMT_CASH     =:P7, '
             +'                     AMT_TRUST    =:P8, '
             +'                     AMT_CARD     =:P9, '
             +'                     DC_SPC       =:P10, '
             +'                     DC_GOODS     =:P11, '
             +'                     DC_RECEIPT   =:P12, '
             +'                     DC_CUT       =:P13, '
             +'                     AMT_DUTYFREE =:P14,'
             +'                     AMT_DUTY     =:P15,'
             +'                     AMT_TAX      =:P16,'
             +'                     AMT_BOTTLE   =:P17,'
             +'                     PNT_OCCUR    =:P18,'
             +'                     CD_SAWON     =:P19, '
             +'                     REMARK       =:P20, '
             +'                     DT_CHANGE    = GetDate() '
             +' where CD_STORE =:P0 '
             +'   and YMD_SALE =:P1 '
             +'   and NO_POS   =:P2 '
             +'   and NO_RCP   =:P3 '),
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              PosNoEdit.Text,
              ReceiptNoEdit.Text,
              CompanyCodeEdit.Text,
              SaleAmtEdit.Value,       //:P5
              ProfitAmt,                                                  //:P6
              CashAmtEdit.Value,  //:P7
              TrustAmtEdit.Value, //:P8
              CardAmtEdit.Value,  //:P9
              GridTableView.DataController.Summary.FooterSummaryValues[3],//:P10
              GoodsDcAmt-GridTableView.DataController.Summary.FooterSummaryValues[3],  //:P11
              DCAmtEdit.Value - CutDcAmt - GoodsDcAmt,    //:P12
              CutDcAmt,                                                                         //:P13
              DutyFreeAmt,                                                                      //:P14
              NetTotalAmtEdit.Value-DutyFreeAmt,                                                //:P15
              TaxTotalAmtEdit.Value,                                                            //:P16
              GridTableView.DataController.Summary.FooterSummaryValues[4],                      //P17
              vCashPoint + vCardPoint + vTrustPoint,                                                                           //P18
              UserCode,                                                                      //:P19
              CommentMemo.Text],
              false);

    // 카드 저장
    if CardAmtEdit.Value <> 0 then
    begin
      // 업데이트일 때는 기존 자료를 지운다
      if not isNew then
        ExecQuery('delete SL_CARD '
                 +' where CD_STORE =:P0 '
                 +'   and YMD_SALE =:P1 '
                 +'   and NO_POS   =:P2 '
                 +'   and NO_RCP   =:P3 ',
                 [StoreCode,
                  DtoS(ConditionToolBarFromDateEdit.Date),
                  PosNoEdit.Text,
                  ReceiptNoEdit.Text],
                  false);
      // 카드 정보 신규 저장
      ExecQuery('insert into SL_CARD '
               +'( '
               +'  CD_STORE, YMD_SALE, NO_POS, NO_RCP, SEQ, DS_TRD, AMT_APPROVAL, AMT_TAX, CD_SAWON, NO_APPROVAL, TYPE_TRD, TERM_HALBU, TRD_DATE '
               +') values ( '
               +'  :P0, :P1, :P2, :P3, 1, ''1'', :P4, :P5, :P6, ''카드단말기'', ''O'',''00'', :P1 '
               +')',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                PosNoEdit.Text,
                ReceiptNoEdit.Text,
                Trunc(CardAmtEdit.Value),
                IfThen(SaleAmtEdit.Value = 0, 0, Trunc(CardAmtEdit.Value * TaxTotalAmtEdit.Value / SaleAmtEdit.Value)),
                UserCode],
                false);
    end;


    if not isNew then
    begin
      ExecQuery('delete SL_SALE_D '
               +' where CD_STORE =:P0 '
               +'   and YMD_SALE =:P1 '
               +'   and NO_POS   =:P2 '
               +'   and NO_RCP   =:P3 ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                PosNoEdit.Text,
                ReceiptNoEdit.Text],
                false);
      InsertDate := FormatDateTime('yyyy-mm-dd hh:nn', Now());

      //포인트 삭제
      ExecQuery('delete from SL_PNT_OCCUR '
               +'where LINK  =:P0 ',
               [StoreCode +
                DtoS(ConditionToolBarFromDateEdit.Date) +
                PosNoEdit.Text +
                ReceiptNoEdit.Text],
                false);
    end;

    //포인트적립
    if (vCashPoint + vCardPoint + vTrustPoint) > 0 then
    begin
      OpenQuery('select   IsNull(Max(SEQ),0)+1 as SEQ '
               +'from     SL_PNT_OCCUR '
               +'where    CD_STORE  = :P0 '
               +'  and    YMD_OCCUR = :P1',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date)]);
      try
        if not Query.Eof then
          vSeq := Query.Fields[0].AsInteger
        else
          vSeq := 1;
      finally
        FinishQuery;
      end;

      ExecQuery('insert into SL_PNT_OCCUR '
               +'( '
               +'  CD_STORE, YMD_OCCUR, SEQ, CD_MEMBER, CD_CODE, AMT_CASH, PNT_CASH, AMT_CASHRCP, PNT_CASHRCP, AMT_CARD, PNT_CARD, AMT_TRUST, PNT_TRUST, AMT_GIFT, PNT_GIFT, AMT_OKC, PNT_OKC, AMT_TMONEY, PNT_TMONEY, REMARK, LINK, CD_SAWON_CHG, DT_CHANGE, DS_TRANS '
               +') values ( '
               +'  :P0, :P1, :P2, :P3, :P4, :P5, :P6, 0, 0, :P7, :P8, :P9, :P10, 0, 0, 0, 0, 0, 0, 0, :P11, :P12, GetDate(), 0 '
               +')',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                vSeq,
                CompanyCodeEdit.Text,
                '001',
                CashAmtEdit.Value,  //:P5
                vCashPoint,                    //:P6
                CardAmtEdit.Value,  //:P7
                vCardPoint,                    //:P8
                TrustAmtEdit.Value, //:P9
                vTrustPoint,                   //:P10
                StoreCode+DtoS(ConditionToolBarFromDateEdit.Date)+PosNoEdit.Text+ReceiptNoEdit.Text,
                UserCode],
                false);
    end;

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      ExecQuery('insert into SL_SALE_D (CD_STORE, '
               +'                       YMD_SALE, '
               +'                       NO_POS, '
               +'                       NO_RCP, '
               +'                       SEQ, '
               +'                       DS_SALE, '
               +'                       CD_GOODS, '
               +'                       QTY_SALE, '
               +'                       PR_SALE, '
               +'                       DC_GOODS, '
               +'                       DC_RECEIPT, '
               +'                       DC_SPC, '
               +'                       NO_SPC, '
               +'                       DS_TAX, '
               +'                       AMT_BOTTLE, '
               +'                       AMT_VAT, '
               +'                       AMT_BUY) '
               +'              VALUES(  :P0, '
               +'                       :P1, '
               +'                       :P2, '
               +'                       :P3, '
               +'                       :P4, '
               +'                       :P5, '
               +'                       :P6, '
               +'                       :P7, '
               +'                       :P8, '
               +'                       :P9, '
               +'                       :P10, '
               +'                       :P11, '
               +'                       :P12, '
               +'                       :P13, '
               +'                       :P14, '
               +'                       :P15, '
               +'                       :P16) ',
               [StoreCode,                                                                        //CD_STORE, '
                DtoS(ConditionToolBarFromDateEdit.Date),                                                          //YMD_SALE, '
                PosNoEdit.Text,                                                                   //NO_POS, '
                ReceiptNoEdit.Text,                                                               //NO_RCP, '
                vIndex+1,                                                                         //SEQ, '
                'S',                                                                              //DS_SALE, '
                GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],        //CD_GOODS, '
                GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index],          //QTY_SALE, '
                GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index],        //PR_SALE, '
                Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewEventCode.Index] = EmptyStr, GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index], 0),        //DC_GOODS,
                GridTableView.DataController.Values[vIndex, GridTableViewReceiptDc.Index],        //DC_RECEIPT,
                Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewEventCode.Index] = EmptyStr, 0, GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index]),        //DC_SPC,
                GridTableView.DataController.Values[vIndex, GridTableViewEventCode.Index],        //NO_SPC,
                GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index],            //DS_TAX, '
                GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewBottlePrice.Index], //AMT_BOTTLE,
                GridTableView.DataController.Values[vIndex, GridTableViewVatAmt.Index],            //AMT_VAT, '
                GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index]], //AMT_BUY) '
                false);


        if GridTableView.DataController.Values[vIndex, GridTableViewEventCode.Index] = EmptyStr then
        begin
          ExecQuery('update MS_GOODS_TRD set PR_SALE      = :P3, '
                   +'                        YMD_SALE     = :P4, '
                   +'                        PR_SALE_OLD  = PR_SALE, '
                   +'                        YMD_SALE_OLD = YMD_SALE '
                   +'where CD_STORE =:P0 '
                   +'  and CD_GOODS =:P1 '
                   +'  and CD_TRDPL =:P2 ',
                   'insert into MS_GOODS_TRD(CD_STORE, '
                   +'                         CD_GOODS, '
                   +'                         CD_TRDPL, '
                   +'                         PR_SALE, '
                   +'                         YMD_SALE) '
                   +'                  values(:P0, '
                   +'                         :P1, '
                   +'                         :P2, '
                   +'                         :P3, '
                   +'                         :P4) ',
                   [StoreCode,
                    GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                    CompanyCodeEdit.Text,
                    GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index]- GridTableView.DataController.Values[vIndex, GridTableViewDcPrice.Index],
                    DtoS(ConditionToolBarFromDateEdit.Date)],
                    false);
        end;
      end;
      CommitTrans;
      result    := true;
      isChanged := false;
      GoodsPanel.Enabled := false;
      if StoI(GetOption(261)) > 0 then Print;
      if not isNew then Close
      else Exec_Timer.Enabled := true;
    except
      on E: Exception do
      begin
        RollbackTrans;
        ErrBox(E.Message);
      end;
    end;
end;

procedure TMemberSaleForm.EditPropertiesChange(Sender: TObject);
var
  vValue: Double;
begin
  inherited;

  if GetActiveControl = CashAmtEdit then
  begin
    repeat
      vValue := CashAmtEdit.EditingValue + TrustAmtEdit.Value + CardAmtEdit.Value - SaleAmtEdit.Value;
      if TrustAmtEdit.Value >= vValue then
        TrustAmtEdit.Value := TrustAmtEdit.Value - vValue
      else if TrustAmtEdit.Value > 0 then
        TrustAmtEdit.Value := 0
      else if CardAmtEdit.Value >= vValue then
        CardAmtEdit.Value := CardAmtEdit.Value - vValue
      else if CardAmtEdit.Value > 0 then
        CardAmtEdit.Value := 0
    until (vValue <= 0) or ((TrustAmtEdit.Value = 0) and (CardAmtEdit.Value = 0));
  end
  else if GetActiveControl = TrustAmtEdit then
  begin
    repeat
      vValue := CashAmtEdit.Value + TrustAmtEdit.EditingValue + CardAmtEdit.Value - SaleAmtEdit.Value;
      if CashAmtEdit.Value >= vValue then
        CashAmtEdit.Value := CashAmtEdit.Value - vValue
      else if CashAmtEdit.Value > 0 then
        CashAmtEdit.Value := 0
      else if CardAmtEdit.Value >= vValue then
        CardAmtEdit.Value := CardAmtEdit.Value - vValue
      else if CardAmtEdit.Value > 0 then
        CardAmtEdit.Value := 0
    until (vValue <= 0) or ((CashAmtEdit.Value = 0) and (CardAmtEdit.Value = 0));
  end
  else if GetActiveControl = CardAmtEdit then
  begin
    repeat
      vValue := CashAmtEdit.Value + TrustAmtEdit.Value + CardAmtEdit.EditingValue - SaleAmtEdit.Value;
      if CashAmtEdit.Value >= vValue then
        CashAmtEdit.Value := CashAmtEdit.Value - vValue
      else if CashAmtEdit.Value > 0 then
        CashAmtEdit.Value := 0
      else if TrustAmtEdit.Value >= vValue then
        TrustAmtEdit.Value := TrustAmtEdit.Value - vValue
      else if TrustAmtEdit.Value > 0 then
        TrustAmtEdit.Value := 0
    until (vValue <= 0) or ((CashAmtEdit.Value = 0) and (TrustAmtEdit.Value = 0));
  end;

  RemainEdit.Value  := CreditAmtEdit.Value + TrustAmtEdit.Value;
end;

procedure TMemberSaleForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  ButtonToolBarNewButton.Click;
end;

function TMemberSaleForm.GetMemberTrust: Boolean;
begin
  try
    OpenQuery('select YN_TRUST '
             +'  from MS_MEMBER '
             +' where CD_STORE =:P0 '
             +'   and CD_MEMBER =:P1 ',
             [Ifthen(GetOption(257)='0', StoreCode, HeadStoreCode),
              CompanyCodeEdit.Text]);
    result := Query.Fields[0].AsString = 'Y';
  finally
    FinishQuery;
  end;
end;

function TMemberSaleForm.GetEvent(aGoods: string): Boolean;
begin
  result := false;
  if not isEvent then Exit;

  OpenQuery('select top 1 * '
           +'  from ( '
           +'       select d.CD_GOODS, '
           +'            g.PR_SALE, '
           +'            d.PR_SALE as PR_SALE_SPC, '
           +'            case when d.PR_SALE = 0 then 0 else Round(100 - d.PR_BUY / d.PR_SALE * 100, 2) end as RATE_PROFIT, '
           +'            g.PR_BUY, '
           +'            d.PR_BUY as PR_BUY_SPC, '
           +'            h.NO_SPC, '
           +'            h.NM_SPC '
           +'         from MS_SPC_D d inner join '
           +'            MS_GOODS g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_GOODS inner join '
           +'            MS_SPC_H h on d.CD_STORE = h.CD_STORE and d.DS_SPC = h.DS_SPC and d.NO_SPC = h.NO_SPC '
           +'        where d.CD_STORE = :P0 '
           +'          and d.DS_SPC   = '''+valGoodsDCType+''' '
           +'          and CONVERT(VARCHAR(8), getdate(),112) between h.DT_FROM and h.DT_TO '
           +'          and h.YN_USE = ''Y'' '
           +'       union all '
           +'       select g.CD_GOODS, '
           +'            g.PR_SALE, '
           +'            g.PR_SALE - (d.RT_SALE / 100) * g.PR_SALE, '
           +'            0, '
           +'            g.PR_BUY, '
           +'            g.PR_BUY - (d.RT_BUY / 100) * g.PR_BUY, '
           +'            h.NO_SPC, '
           +'            h.NM_SPC '
           +'         from MS_SPC_D d inner join '
           +'            MS_GOODS g on d.CD_STORE = g.CD_STORE and g.CD_CLASS like d.CD_GOODS +''%'' inner join '
           +'            MS_SPC_H h on d.CD_STORE = h.CD_STORE and d.DS_SPC = h.DS_SPC and d.NO_SPC = h.NO_SPC '
           +'        where d.CD_STORE = :P0 '
           +'          and d.DS_SPC   = '''+valClassDCType+''' '
           +'          and CONVERT(VARCHAR(8), getdate(),112) between h.DT_FROM and h.DT_TO '
           +'          and h.YN_USE = ''Y'' '
           +'       union all '
           +'       select g.CD_GOODS, '
           +'            g.PR_SALE, '
           +'            g.PR_SALE - (d.RT_SALE / 100) * g.PR_SALE, '
           +'            0, '
           +'            g.PR_BUY, '
           +'            g.PR_BUY - (d.RT_BUY / 100) * g.PR_BUY, '
           +'            h.NO_SPC, '
           +'            h.NM_SPC  '
           +'         from MS_SPC_D d inner join '
           +'            MS_GOODS g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_TRDPL inner join '
           +'            MS_SPC_H h on d.CD_STORE = h.CD_STORE and d.DS_SPC = h.DS_SPC and d.NO_SPC = h.NO_SPC '
           +'        where d.CD_STORE = :P0 '
           +'          and d.DS_SPC   = '''+valCompanyDCType+''' '
           +'          and CONVERT(VARCHAR(8), getdate(),112) between h.DT_FROM and h.DT_TO '
           +'          and h.YN_USE = ''Y'' '
           +'          ) t '
           +'  where CD_GOODS = :P1 ',
            [StoreCode,
             aGoods]);
  try
    if not Query.Eof then
    begin
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewEventCode.Index]  := Query.FieldByName('NO_SPC').AsString;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewEventName.Index]  := Query.FieldByName('NM_SPC').AsString;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewEventPrice.Index] := Query.FieldByName('PR_SALE').AsCurrency - Query.FieldByName('PR_SALE_SPC').AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDcPrice.Index]    := Query.FieldByName('PR_SALE').AsCurrency - Query.FieldByName('PR_SALE_SPC').AsCurrency;

      //행사매가가 있을때는 행사판가-행사매가로 판매원가를 구한다
      if Query.FieldByName('PR_BUY_SPC').AsCurrency > 0 then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index] := Query.FieldByName('PR_BUY_SPC').AsCurrency
      //행사이익율로 판매원가를 구한다
      else if Query.FieldByName('RATE_PROFIT').AsCurrency > 0 then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index] := Query.FieldByName('PR_SALE_SPC').AsCurrency - (Query.FieldByName('PR_SALE_SPC').AsCurrency / 100 * Query.FieldByName('RATE_PROFIT').AsCurrency)
      //상품마스터에 매입단가 0이면서 이익율이 있을 때 는 상품마스터의 이익율로 판매원가를 구한다
      else if (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index] = 0) and
               (GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSaleProfit.Index] > 0) then
        GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index] := Query.FieldByName('PR_SALE_SPC').AsCurrency - (Query.FieldByName('PR_SALE_SPC').AsCurrency / 100 * GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSaleProfit.Index]);

      result := true;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TMemberSaleForm.GoodsCodeEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if SearchGoods(DisplayValue) <> EmptyStr then
    DisplayValue := ''
  else
  begin
    DisplayValue := EmptyStr;
    GoodsCodeEdit.SetFocus;
  end;
end;

procedure TMemberSaleForm.GoodsDeleteButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if AskBox('상품을 삭제하시겠습니까?') then
  begin
    vIndex := GridTableView.DataController.GetFocusedRecordIndex;
    GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
    if GridTableView.DataController.RecordCount > 0 then
      GridTableView.Controller.FocusedRecordIndex := Ifthen(vIndex=0, vIndex, vIndex-1)
    else
      SaleHistoryButton.Enabled := true;

    for vIndex := vIndex to GridTableView.DataController.RecordCount - 1 do
      GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index] := vIndex + 1;

    isChanged := true;
    CalcAmts;
  end;
end;

procedure TMemberSaleForm.GoodsSearchButtonClick(Sender: TObject);
begin
  inherited;
  if SearchGoods(GoodsCodeEdit.Text) <> EmptyStr then
    GoodsCodeEdit.Clear;
end;

//상품찾기 버튼 클릭 시
procedure TMemberSaleForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
var vIndex :Integer;
begin
  inherited;
  if not isLoading then isChanged := true;
  CalcAmts;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewSaleQty.Index] = 0 then
  begin
    vIndex := ADataController.FocusedRecordIndex;
    ADataController.DeleteRecord(ADataController.FocusedRecordIndex);

    for vIndex := vIndex to ADataController.RecordCount - 2 do
      ADataController.Values[vIndex, GridTableViewSeq.Index] := vIndex + 1;
  end;
  SaleHistoryButton.Enabled := ADataController.RecordCount = 0;
  GoodsCodeEdit.SetFocus;
end;

procedure TMemberSaleForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
var
  vIndex: Integer;
begin
  inherited;
  if ADataController.NewItemRowFocused then
  begin
    // 새 레코드 입력 중인데 입력하지 않은 값이 있다면
    if (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewGoodsName.Index], EmptyStr) = EmptyStr) or
       (Nvl(ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewSaleQty.Index],    0)        = 0) then
    begin
      // 기존에 입력된 값을 저장해 놓는다
      SetLength(BackupData[0], GridTableView.ColumnCount);
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
          if AskBox(Format('%s(%s) 상품은 이미 판매 등록이 되어 있습니다.'#13'기존 판매에 수량을 추가하시겠습니까?'#13'''아니요''를 누르면 지금 입력한 값이 취소됩니다.', [String(ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsName.Index]), String(ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewGoodsCode.Index])])) then
          begin
            if (ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewSaleQty.Index] < 0) then
              ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewSaleQty.Index] := -ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewSaleQty.Index];
            ADataController.Values[vIndex, GridTableViewSaleQty.Index] := ADataController.Values[vIndex, GridTableViewSaleQty.Index] + ADataController.Values[ADataController.NewItemRecordIndex, GridTableViewSaleQty.Index];
            CalcAmts;
          end;
          // Post를 취소한다
          ADataController.Cancel;
          break;
        end;
  end;

end;


//그리드에서 상품할인단가 입력 시
procedure TMemberSaleForm.GridTableViewDcPricePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if Abs(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSalePrice.Index]) < DisplayValue then
  begin
    ErrorText := '할인금액이 너무 큽니다.';
    Error     := True;
  end
  else
  begin
    GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDcPrice.Index] := DisplayValue;
    CalcAmts;
  end;
end;

procedure TMemberSaleForm.GridTableViewEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) and GridTableView.Focused and GridTableViewSaleQty.Focused and (not GridTableViewDcPrice.Visible or not GridTableViewDcPrice.Options.Focusing) then
  begin
    GridTableView.DataController.Post;
    GoodsCodeEdit.SetFocus;
  end
  else if (Key = VK_RETURN) and GridTableView.Focused and GridTableViewDcPrice.Focused then
  begin
    GridTableView.DataController.Post;
    GoodsCodeEdit.SetFocus;
  end;
end;

procedure TMemberSaleForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  // 행사상품은 상품할인을 못하게 막는다
  if AFocusedRecord <> nil then
  begin
    GridTableViewDcPrice.Options.Focusing    := (NVL(AFocusedRecord.Values[GridTableViewEventCode.Index],'') = EmptyStr) and (NVL(AFocusedRecord.Values[GridTableViewYnDc.Index],'N') = 'Y') ;
    GridTableViewSalePrice.Options.Focusing  := NVL(AFocusedRecord.Values[GridTableViewEventCode.Index],'') = EmptyStr;
  end;

  GoodsDeleteButton.Enabled :=  (AFocusedRecord <> nil);
  StockSearchButton.Enabled :=  (AFocusedRecord <> nil);
  StockSearchButton.Caption := '재고조회';

  if AFocusedRecord <> nil then
  begin
    MasterSalePriceEdit.Value := NVL(AFocusedRecord.Values[GridTableViewMasterSalePrice.Index],0);
    MasterBuyPriceEdit.Value  := NVL(AFocusedRecord.Values[GridTableViewBuyPrice.Index],0);
    SalePriceAEdit.Value      := NVL(AFocusedRecord.Values[GridTableViewSalePriceA.Index],0);
    SalePriceBEdit.Value      := NVL(AFocusedRecord.Values[GridTableViewSalePriceB.Index],0);
    SalePriceCEdit.Value      := NVL(AFocusedRecord.Values[GridTableViewSalePriceC.Index],0);
    SalePriceDEdit.Value      := NVL(AFocusedRecord.Values[GridTableViewSalePriceD.Index],0);
    SalePriceEEdit.Value      := NVL(AFocusedRecord.Values[GridTableViewSalePriceE.Index],0);
    LastSalePriceEdit.Value   := NVL(AFocusedRecord.Values[GridTableViewLastSalePrice.Index],0);
    LastSaleDateLabel.Caption := NVL(AFocusedRecord.Values[GridTableViewLastSaleDate.Index],'');
  end
  else
  begin
    MasterSalePriceEdit.Value := 0;
    MasterBuyPriceEdit.Value  := 0;
    SalePriceAEdit.Value      := 0;
    SalePriceBEdit.Value      := 0;
    SalePriceCEdit.Value      := 0;
    SalePriceDEdit.Value      := 0;
    SalePriceEEdit.Value      := 0;
    LastSalePriceEdit.Value   := 0;
    LastSaleDateLabel.Caption := EmptyStr;
  end;
end;

//그리드에서 상품조회버튼 클릭 시
procedure TMemberSaleForm.GridTableViewGoodsCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsCode.Index] <> null then
    SearchGoods(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsCode.Index])
  else
    SearchGoods;
end;

procedure TMemberSaleForm.GridTableViewGoodsCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  vIndex     : Integer;
  vSql       : String;
begin
  inherited;
  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    case CompanyCodeEdit.Tag of
      0 : vSql := ' g.PR_SALE ';
      1 : vSql := ' g.PR_SALE_TRD1 ';
      2 : vSql := ' g.PR_SALE_TRD2 ';
      3 : vSql := ' g.PR_SALE_TRD3 ';
      4 : vSql := ' g.PR_SALE_TRD4 ';
      5 : vSql := ' g.PR_SALE_TRD5 ';
      9 : vSql := ' Isnull(t.PR_SALE,0)  ';
    end;

    OpenQuery('select   g.CD_GOODS, '
             +'         g.NM_GOODS + '' '' + g.NM_SPEC as NM_GOODS, '
             +'         g.DS_TAX, '
             +vSql +' as PR_SALE, '
             +'         isnull(m.PR_SALE,0) as PR_SALE_BOTTLE, '
             +'         g.PR_BUY, '
             +'         g.PR_SALE_PROFIT '
             +'from     MS_GOODS g left outer join '
             +'         MS_GOODS m on g.CD_STORE = m.CD_STORE and g.CD_BOTTLE = m.CD_GOODS left outer join '
             +'         MS_GOODS_TRD t on g.CD_STORE = t.CD_STORE and g.CD_GOODS = t.CD_GOODS and t.CD_TRDPL =:P2 '
             +'where    g.CD_STORE  = :P0 '
             +'  and   (g.CD_GOODS like ''%''+:P1+''%'' or g.NM_GOODS like ''%''+:P1+''%'' or g.NM_GOODS_SHORT like ''%''+:P1+''%'') '
             +'  and    g.YN_USE    = ''Y''',
             [StoreCode,
              DisplayValue,
              CompanyCodeEdit.Text]);

    if Query.RecordCount = 1 then
    begin
      vIndex := Self.GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Query.FieldByName('CD_GOODS').AsString, false, false, true)];
      if vIndex >= 0 then
      begin
        FinishQuery;
        Self.GridTableView.ViewData.Records[vIndex].Selected := not Self.GridTableView.ViewData.Records[vIndex].Selected and Self.GridTableView.ViewData.Records[vIndex].IsData;
        //신규작업을 취소한다
        if GridTableView.Controller.IsNewItemRowFocused then
          GridTableView.DataController.Cancel;
        Self.GridTableView.Controller.FocusedRecordIndex     := vIndex;
        Self.Grid.SetFocus;
        Exit;
      end;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsCode.Index]  := Query.FieldByName('CD_GOODS').AsString;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsName.Index]  := Query.FieldByName('NM_GOODS').AsString;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSaleQty.Index]    := 0;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSalePrice.Index]  := Query.FieldByName('PR_SALE').AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewTotAmt.Index]     := 0;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDcAmt.Index]      := 0;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSaleAmt.Index]    := 0;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewDsTax.Index]      := Query.FieldByName('DS_TAX').AsString;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBottlePrice.Index]:= Query.FieldByName('PR_SALE_BOTTLE').AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewBuyPrice.Index]   := Query.FieldByName('PR_BUY').AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSaleProfit.Index] := Query.FieldByName('PR_SALE_PROFIT').AsCurrency;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewEventCode.Index]  := EmptyStr;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewReceiptDc.Index]  := 0;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewNetAmt.Index]     := 0;
      GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewVatAmt.Index]     := 0;
      FinishQuery;
      GetEvent(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewGoodsCode.Index]);
    end
    else
    begin
      FinishQuery;
      DisplayValue := SearchGoods(DisplayValue);
    end;
  end;
end;

procedure TMemberSaleForm.GridTableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
end;

//그리드에서 판매단가 수정 시
procedure TMemberSaleForm.GridTableViewSalePricePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSalePrice.Index] := DisplayValue;
  CalcAmts;
end;

//그리드에서 판매수량 수정 시
procedure TMemberSaleForm.GridTableViewSaleQtyPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSaleQty.Index] := DisplayValue;
  CalcAmts;
end;

procedure TMemberSaleForm.CompanyCodeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and (CompanyCodeEdit.Text = EmptyStr) then
  begin
    if SearchCompany(CompanyCodeEdit.Text) = EmptyStr then
    begin
      GoodsPanel.Enabled     := False;
      CompanyCodeEdit.Clear;
      CompanyNameEdit.Clear;
      CompanyCodeEdit.SetFocus;
    end;
  end;
  inherited;
end;

procedure TMemberSaleForm.CompanyCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if SearchCompany(CompanyCodeEdit.Text) <> EmptyStr then
  begin
    SaleHistoryButton.Enabled := true;
    GoodsPanel.Enabled        := true;
    Grid.Enabled := true;
    GoodsCodeEdit.SetFocus;
  end;
end;

procedure TMemberSaleForm.CompanyCodeEditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = CompanyCodeEdit) and (CompanyNameEdit.Text <> EmptyStr) and
          ((GetOnlyNumber(CompanyCodeEdit.EditingText) <> CompanyCodeEdit.EditingText) or (Length(CompanyCodeEdit.EditingText) <> 6)) then
  begin
    CompanyNameEdit.Text := EmptyStr;
    SaleHistoryButton.Enabled := false;
    GoodsPanel.Enabled        := false;
    GridTableView.DataController.RecordCount := 0;
    Grid.Enabled              := false;
    CompanyCreditAmt;
  end;
end;

procedure TMemberSaleForm.CompanyCodeEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  DisplayValue := SearchCompany(DisplayValue);
  if DisplayValue = EmptyStr then
    CompanyCodeEdit.SetFocus
  else
    GoodsCodeEdit.SetFocus;
end;

procedure TMemberSaleForm.CompanyCreditAmt;
begin
  if CompanyCodeEdit.Text = EmptyStr then
  begin
    CreditAmtEdit.Value := 0;
    Exit;
  end;

  OpenQuery('select   Sum(AMT_BASE + AMT_SALE - AMT_PAYIN) as AMT_REMAIN '
           +'from    (select   AMT_BASE, '
           +'                  0 as AMT_SALE, '
           +'                  0 as AMT_PAYIN '
           +'         from     SL_BOOKS_MONTH '
           +'         where    CD_STORE =:P0 '
           +'         and      CD_CLOSE = ''20'' '
           +'         and      CD_CODE  =:P1 '
           +'         and      YM_CLOSE = Convert(Varchar(6), getdate(), 112) '
           +'         union all '
           +'         select   0 as AMT_BASE, '
           +'                  Sum(AMT_TRUST) as AMT_SALE, '
           +'                  0 as AMT_PAYIN '
           +'         from     SL_SALE_H '
           +'         where    CD_STORE =:P0 '
           +'         and      CD_MEMBER =:P1 '
           +'         and      YMD_SALE >= Convert(Varchar(6), getdate(), 112)+''01'' '
           +'         and      DS_SALE <> ''V'' '
           +'         and      AMT_TRUST <> 0 '
           +'         union all '
           +'         select   0 as AMT_BASE, '
           +'                  0 as AMT_SALE, '
           +'                  Sum(AMT_PAYIN+AMT_DC) as AMT_PAYIN '
           +'         from     SL_ACCT '
           +'         where    CD_STORE =:P0 '
           +'         and      CD_MEMBER =:P1 '
           +'         and      YMD_OCCUR >= Convert(Varchar(6), getdate(), 112)+''01'' '
           +'         ) as t ',
            [StoreCode,
             CompanyCodeEdit.Text]);
  try
    if not Query.Eof then
    begin
      CreditAmtEdit.Value := Query.Fields[0].AsCurrency;
    end
    else CreditAmtEdit.Value := 0;
  finally
    FinishQuery;
  end;

  RemainEdit.Value  := CreditAmtEdit.Value + TrustAmtEdit.Value;

  case CompanyCodeEdit.Tag of
    0 : CompanyRankEdit.Text := '일반판매단가';
    1 : CompanyRankEdit.Text := 'A등급';
    2 : CompanyRankEdit.Text := 'B등급';
    3 : CompanyRankEdit.Text := 'C등급';
    4 : CompanyRankEdit.Text := 'D등급';
    5 : CompanyRankEdit.Text := 'E등급';
    9 : CompanyRankEdit.Text := '최종판매단가';
  end;
end;

function TMemberSaleForm.SearchGoods(aGoods: string;aQty:Integer): string;
var
  vIndex  : Integer;
  vSql    : String;
  vWhere  : String;
begin
  case CompanyCodeEdit.Tag of
    0 : vSql := ' g.PR_SALE ';
    1 : vSql := ' g.PR_SALE_TRD1 ';
    2 : vSql := ' g.PR_SALE_TRD2 ';
    3 : vSql := ' g.PR_SALE_TRD3 ';
    4 : vSql := ' g.PR_SALE_TRD4 ';
    5 : vSql := ' g.PR_SALE_TRD5 ';
    9 : vSql := ' Isnull(l.PR_SALE,0)  ';
  end;

  if GetOnlyNumber(aGoods) = aGoods then
    vWhere := ''
  else
    vWhere := 'and Isnull(g.YN_LINK,''N'') = ''N'' ';

  OpenQuery('select   case when Isnull(g.YN_LINK, ''N'') = ''Y'' then g.CD_GOODS_L else g.CD_GOODS end as CD_GOODS, '
           +'         g.NM_GOODS + '' '' + g.NM_SPEC as NM_GOODS, '
           +'         g.DS_TAX, '
           +vSql +' as PR_SALE, '
           +'         dbo.GetBottleSalePrice(g.CD_STORE, g.CD_GOODS) as PR_SALE_BOTTLE, '
           +'         g.PR_BUY, '
           +'         g.PR_SALE_PROFIT, '
           +'         g.PR_SALE as PR_SALE_M, '
           +'         g.PR_SALE_TRD1, '
           +'         g.PR_SALE_TRD2, '
           +'         g.PR_SALE_TRD3, '
           +'         g.PR_SALE_TRD4, '
           +'         g.PR_SALE_TRD5, '
           +'         Isnull(l.PR_SALE,0) as PR_SALE_LAST, '
           +'         Isnull(dbo.StoD(l.YMD_SALE),'''') as YMD_SALE_LAST, '
           +'         g.YN_POINT, '
           +'         g.YN_DC '
           +'from     MS_GOODS g left outer join '
           +'         MS_GOODS m on g.CD_STORE = m.CD_STORE and g.CD_BOTTLE = m.CD_GOODS left outer join '
           +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL =:P2 '
           +'where    g.CD_STORE  = :P0 '
           +'  and   (g.CD_GOODS like ''%''+:P1+''%'' or g.NM_GOODS like ''%''+:P1+''%'' or g.NM_GOODS_SHORT like ''%''+:P1+''%'') '
           +vWhere
           +'  and    g.YN_USE    = ''Y''',
           [StoreCode,
            aGoods,
            CompanyCodeEdit.Text]);
  if Query.RecordCount = 1 then
  begin
    Result := Query.FieldByName('CD_GOODS').AsString;
    vIndex := Self.GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Result, false, false, true)];
    if vIndex >= 0 then
    begin
      GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] + 1;
      CalcAmts;
      GridTableView.Controller.FocusedRecordIndex := vIndex;
      GoodsCodeEdit.SetFocus;
      FinishQuery;
      Exit;
    end;
    GridTableView.DataController.AppendRecord;
    GridTableView.Controller.FocusedRecordIndex := GridTableView.DataController.RecordCount-1;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSeq.Index  ]           := GridTableView.DataController.RecordCount;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]       := Query.FieldByName('CD_GOODS').AsString;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsName.Index]       := Query.FieldByName('NM_GOODS').AsString;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSaleQty.Index]         := aQty;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePrice.Index]       := NVL(Query.FieldByName('PR_SALE').AsCurrency,0);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewTotAmt.Index]          := 0;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDcPrice.Index]         := 0;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDcAmt.Index]           := 0;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSaleAmt.Index]         := 0;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDsTax.Index]           := Query.FieldByName('DS_TAX').AsString;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBottlePrice.Index]     := NVL(Query.FieldByName('PR_SALE_BOTTLE').AsCurrency,0);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewBuyPrice.Index]        := NVL(Query.FieldByName('PR_BUY').AsCurrency,0);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSaleProfit.Index]      := NVL(Query.FieldByName('PR_SALE_PROFIT').AsCurrency,0);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewEventCode.Index]       := EmptyStr;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewReceiptDc.Index]       := 0;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewNetAmt.Index]          := 0;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewVatAmt.Index]          := 0;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewMasterSalePrice.Index] := Query.FieldByName('PR_SALE_M').AsCurrency;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePriceA.Index]      := Query.FieldByName('PR_SALE_TRD1').AsCurrency;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePriceB.Index]      := Query.FieldByName('PR_SALE_TRD2').AsCurrency;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePriceC.Index]      := Query.FieldByName('PR_SALE_TRD3').AsCurrency;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePriceD.Index]      := Query.FieldByName('PR_SALE_TRD4').AsCurrency;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePriceE.Index]      := Query.FieldByName('PR_SALE_TRD5').AsCurrency;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewLastSalePrice.Index]   := Query.FieldByName('PR_SALE_LAST').AsCurrency;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewLastSaleDate.Index]    := Query.FieldByName('YMD_SALE_LAST').AsString;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewYnPoint.Index]         := Query.FieldByName('YN_POINT').AsString;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewYnDc.Index]            := Query.FieldByName('YN_DC').AsString;

    MasterSalePriceEdit.Value := NVL(Query.FieldByName('PR_SALE_M').AsCurrency,0);
    SalePriceAEdit.Value      := NVL(Query.FieldByName('PR_SALE_TRD1').AsCurrency,0);
    SalePriceBEdit.Value      := NVL(Query.FieldByName('PR_SALE_TRD2').AsCurrency,0);
    SalePriceCEdit.Value      := NVL(Query.FieldByName('PR_SALE_TRD3').AsCurrency,0);
    SalePriceDEdit.Value      := NVL(Query.FieldByName('PR_SALE_TRD4').AsCurrency,0);
    SalePriceEEdit.Value      := NVL(Query.FieldByName('PR_SALE_TRD5').AsCurrency,0);
    LastSalePriceEdit.Value   := NVL(Query.FieldByName('PR_SALE_LAST').AsCurrency,0);
    LastSaleDateLabel.Caption := NVL(Query.FieldByName('YMD_SALE_LAST').AsString,'');
    MasterBuyPriceEdit.Value  := NVL(Query.FieldByName('PR_BUY').AsCurrency,0);

    FinishQuery;
    GetEvent(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewGoodsCode.Index]);
    GridTableViewDcPrice.Options.Focusing     := NVL(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewEventCode.Index],'') = EmptyStr;
    CalcAmts;
    Grid.SetFocus;
    GridTableView.DataController.Post;
    if GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePrice.Index] = 0 then
      GridTableView.Controller.FocusedColumnIndex := GridTableViewSalePrice.Index
    else
      GridTableView.Controller.FocusedColumnIndex := GridTableViewSaleQty.Index;
    isChanged := true;
    SaleHistoryButton.Enabled := false;
    CompanyCodeEdit.Enabled   := false;
    if DefaultFocusCheckBox.Checked and (GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSalePrice.Index]) then GoodsCodeEdit.SetFocus;
  end
  else
  begin
    FinishQuery;
    // 상품 바코드를 조회한다
    with THelpForm.Create(Self) do
      try
        Caption                    := '상품 조회';
        GridTableViewCode.Caption  := GridTableViewGoodsCode.Caption;
        GridTableViewCode.Width    := 110;
        GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
        GridTableViewName1.Caption := GridTableViewGoodsName.Caption;
        GridTableViewName1.Width   := 170;
        GridTableViewName2.Caption := '매입단가';
        GridTableViewName2.Width   := 70;
        GridTableViewName2.Visible := true;
        GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
        GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
        TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
        TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;
        GridTableViewName3.Caption := '판매단가';
        GridTableViewName3.Width   := 70;
        GridTableViewName3.Visible := true;
        GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
        GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
        TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
        TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;

        SearchText := aGoods;
        SQLText    := 'select   case when Isnull(g.YN_LINK, ''N'') = ''Y'' then g.CD_GOODS_L else g.CD_GOODS end as CD_GOODS, '
                     +'         g.NM_GOODS +'' ''+ g.NM_SPEC as NM_GOODS, '
                     +'         g.PR_BUY, '
                     +vSql +' as PR_SALE, '
                     +'         g.NM_SPEC as NM_SPEC, '    //3
                     +'         g.DS_TAX, '     //4
                     +'         m.PR_SALE as PR_SALE_BOTTLE, '  //5
                     +'         g.PR_BUY, '
                     +'         g.PR_SALE_PROFIT, '
                     +'         g.PR_SALE as PR_SALE_M, '
                     +'         g.PR_SALE_TRD1, '
                     +'         g.PR_SALE_TRD2, '
                     +'         g.PR_SALE_TRD3, '
                     +'         g.PR_SALE_TRD4, '
                     +'         g.PR_SALE_TRD5, '
                     +'         Isnull(l.PR_SALE,0) as PR_SALE_LAST, '
                     +'         Isnull(dbo.StoD(l.YMD_SALE),'''') as YMD_SALE_LAST, '
                     +'         g.YN_POINT, '
                     +'         g.YN_DC '
                     +'from     MS_GOODS g left outer join '
                     +'         MS_GOODS m on g.CD_STORE = m.CD_STORE and g.CD_BOTTLE = m.CD_GOODS left outer join '
                     +'         MS_GOODS_TRD l on g.CD_STORE = l.CD_STORE and g.CD_GOODS = l.CD_GOODS and l.CD_TRDPL ='''+CompanyCodeEdit.Text+''' '
                     +'where    g.CD_STORE = :P0 '
                     +'  and   (g.CD_GOODS like :P1+''%'' or g.NM_GOODS like ''%''+:P1+''%'' or g.NM_GOODS_SHORT like ''%''+:P1+''%'' ) '
                     +'  and    g.YN_USE   = ''Y'' '
                     +'  and    Isnull(g.YN_LINK,''N'') =''N'' '
                     +'order by g.CD_STORE, g.CD_GOODS';
        if SearchText <> EmptyStr then IsAutoSearch := True;
        if ShowModal = mrOK then
        begin
          Result := Code;
          vIndex := Self.GridTableView.DataController.FilteredIndexByRecordIndex[Self.GridTableView.DataController.FindRecordIndexByText(0, GridTableViewGoodsCode.Index, Result, false, false, true)];
          if vIndex >= 0 then
          begin
            Self.GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] := Self.GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] + 1;
            CalcAmts;
            Self.GridTableView.Controller.FocusedRecordIndex := vIndex;
            GoodsCodeEdit.SetFocus;
            Exit;
          end;
          Self.GridTableView.DataController.AppendRecord;
          Self.GridTableView.Controller.FocusedRecordIndex := Self.GridTableView.DataController.RecordCount-1;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSeq.Index  ]       := Self.GridTableView.DataController.RecordCount;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index  ] := Code;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsName.Index  ] := Names[0];
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSaleQty.Index    ] := aQty;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSalePrice.Index  ] := StoF(Names[2]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewTotAmt.Index     ] := 0;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewDCPrice.Index    ] := 0;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewDCAmt.Index      ] := 0;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSaleAmt.Index    ] := 0;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewDsTax.Index      ] := Names[4];
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBottlePrice.Index] := StoF(Names[5]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewBuyPrice.Index]    := StoF(Names[6]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSaleProfit.Index]  := StoF(Names[7]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewEventCode.Index]   := EmptyStr;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewReceiptDc.Index]   := 0;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewNetAmt.Index]      := 0;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewVatAmt.Index]      := 0;
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewMasterSalePrice.Index] := StoF(Names[8]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSalePriceA.Index]      := StoF(Names[9]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSalePriceB.Index]      := StoF(Names[10]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSalePriceC.Index]      := StoF(Names[11]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSalePriceD.Index]      := StoF(Names[12]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewSalePriceE.Index]      := StoF(Names[13]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewLastSalePrice.Index]   := StoF(Names[14]);
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewLastSaleDate.Index]    := Names[15];
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewYnPoint.Index]         := Names[16];
          Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewYnDc.Index]            := Names[17];

          MasterSalePriceEdit.Value := StoF(Names[8]);
          SalePriceAEdit.Value      := StoF(Names[9]);
          SalePriceBEdit.Value      := StoF(Names[10]);
          SalePriceCEdit.Value      := StoF(Names[11]);
          SalePriceDEdit.Value      := StoF(Names[12]);
          SalePriceEEdit.Value      := StoF(Names[13]);
          LastSalePriceEdit.Value   := StoF(Names[14]);
          LastSaleDateLabel.Caption := Names[15];
          MasterBuyPriceEdit.Value  :=  StoF(Names[1]);

          GetEvent(Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, Self.GridTableViewGoodsCode.Index]);
          GridTableViewDcPrice.Options.Focusing     := NVL(Self.GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, GridTableViewEventCode.Index],'') = EmptyStr;
          CalcAmts;
          Self.Grid.SetFocus;
          Self.GridTableView.DataController.Post;
          if StoF(Names[2]) = 0 then
            Self.GridTableView.Controller.FocusedColumnIndex := Self.GridTableViewSalePrice.Index
          else
            Self.GridTableView.Controller.FocusedColumnIndex := Self.GridTableViewSaleQty.Index;
          SaleHistoryButton.Enabled := false;
          CompanyCodeEdit.Enabled   := false;
          isChanged := true;
          if DefaultFocusCheckBox.Checked and (StoF(Names[2]) > 0) then GoodsCodeEdit.SetFocus;
        end;
      finally
        Free;
      end;
  end;
end;


procedure TMemberSaleForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarNewButton.Enabled    := not isChanged;
  ButtonToolBarCancelButton.Enabled := isChanged;
end;

procedure TMemberSaleForm.StockSearchButtonClick(Sender: TObject);
var vGoodsCode :String;
begin
  inherited;
  try
    OpenQuery('select CD_GOODS_T '
             +'  from MS_GOODS (nolock) '
             +' where CD_STORE =:P0 '
             +'   and CD_GOODS =:P1 ',
             [StoreCode,
              String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index])]);
    vGoodsCode := Query.Fields[0].AsString;
  finally
    FinishQuery;
  end;

  if vGoodsCode = EmptyStr then
  begin
    MsgBox('재고를 관리하지 않는 상품입니다');
    Exit;
  end;

  try
    OpenQuery('select dbo.GetStockCount(:P0, :P1, '''') ',
              [StoreCode,
               vGoodsCode ]);
    if not Query.Eof then
      StockSearchButton.Caption := FormatFloat('#,0',Query.Fields[0].AsFloat)
    else
      StockSearchButton.Caption := '0';
  finally
    FinishQuery;
  end;
end;

procedure TMemberSaleForm.SaleHistoryButtonClick(Sender: TObject);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '최근 구매내역  조회';
      GridTableViewCode.Caption  := SaleDateLabel.Caption;
      GridTableViewCode.Width    := 95;
      GridTableViewCode.Properties.Alignment.Horz  := taCenter;
      GridTableViewName1.Caption := '영수증번호';
      GridTableViewName1.Width   := 70;
      GridTableViewName1.PropertiesClassName       := 'TcxLabelProperties';
      GridTableViewName1.Properties.Alignment.Horz  := taCenter;
      GridTableViewName2.Caption := '구매금액';
      GridTableViewName2.Width   := 95;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;
      GridTableViewName3.Caption := '상품수';
      GridTableViewName3.Width   := 45;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;
      GridTableViewName4.Caption  := '구매일시';
      GridTableViewName4.Width    := 150;
      GridTableViewName4.PropertiesClassName       := 'TcxLabelProperties';
      GridTableViewName4.Properties.Alignment.Horz  := taCenter;
      GridTableViewName4.Visible := true;

      Grid.Top := 5;
      Grid.Height := 295;

      IsAutoSearch :=true;
      SQLText    := 'select top 20 '
                   +'       dbo.StoDW(h.YMD_SALE) as YMD_SALE, '
                   +'       h.NO_POS+''-''+h.NO_RCP as NO_RCP, '
                   +'       h.AMT_SALE, '
                   +'       (select MAX(seq) '
                   +'        from SL_SALE_D '
                   +'        where CD_STORE = h.CD_STORE '
                   +'          and YMD_SALE = h.YMD_SALE '
                   +'          and NO_POS    = h.NO_POS '
                   +'          and NO_RCP    = h.NO_RCP) as CNT_SALE, '
                   +'        h.DT_SALE '
                   +' from  SL_SALE_H h '
                   +' where h.CD_STORE = :P0 '
                   +'   and h.DS_SALE  = ''S'' '
                   +'   and h.CD_MEMBER = '''+CompanyCodeEdit.Text+''''
                   +' order by h.YMD_SALE desc';
      if ShowModal = mrOK then
      begin
        try
          DM.OpenQuery('select CD_GOODS, '
                      +'       QTY_SALE '
                      +'from  SL_SALE_D '
                      +'where CD_STORE =:P0 '
                      +'  and YMD_SALE =:P1 '
                      +'  and NO_POS   =:P2 '
                      +'  and NO_RCP   =:P3 ',
                      [StoreCode,
                       GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0]),
                       LeftStr(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 1],2),
                       RightStr(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 1],4)]);
           while not DM.Query.Eof do
           begin
             SearchGoods(DM.Query.Fields[0].AsString, DM.Query.Fields[1].AsInteger);
             DM.Query.Next;
           end;
           isChanged := true;
        finally
          DM.FinishQuery;
          SaleHistoryButton.Enabled := false;
        end;
      end;
    finally
      Free;
    end;
end;

function TMemberSaleForm.SearchCompany(aCompany: string): string;
var vCode, vName, vPrice :String;
begin
  Result := EmptyStr;
  try
    OpenQuery('select   CD_MEMBER, '
             +'         NM_MEMBER, '
             +'         DS_PRICE, '
             +'         YN_TRUST, '
             +'         AMT_TRUST_LIMIT, '
             +'         YN_BACKOFFICE_EVENT '
             +'from     MS_MEMBER '
             +'where    CD_STORE = :P0 '
             +'  and   (CD_MEMBER like ''%''+:P1 or NM_MEMBER like ''%''+:P1+''%'' or dbo.Decrypt(TEL_MOBIL, 5869,29486,4921) like ''%''+:P1 ) '
             +'  and    DS_STATUS = ''0'' '
             +'  and    MEMBER_TYPE  = ''T'' '
             +'order by CD_STORE, CD_MEMBER',
              [Ifthen(GetOption(257)='0', StoreCode, HeadStoreCode),
               aCompany]);
    if Query.RecordCount = 1 then
    begin
      SaleHistoryButton.Enabled := true;
      GoodsPanel.Enabled        := true;
      // 일단 첫번째 값을 받아 놓는다
      vCode           := Query.Fields[0].AsString;
      vName           := Query.Fields[1].AsString;
      vPrice          := Query.Fields[2].AsString;
      isTrust         := Query.Fields[3].AsString = 'Y';
      CompanyLimit    := Query.Fields[4].AsInteger;
      isEvent         := Query.Fields[5].AsString = 'Y';
      // 쿼리 다음 줄로 이동해 본다
      Query.Next;
      // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
      if Query.Eof then
      begin
        Result                   := vCode;
        Grid.Enabled             := true;
        CompanyCodeEdit.Text     := vCode;
        CompanyNameEdit.Text     := vName;
        CompanyCodeEdit.Tag      := StrToIntDef(vPrice,0);
        ConditionToolBarFromDateEdit.Enabled     := False;
        GoodsCodeEdit.SetFocus;
      end
    end
    else
    begin
      FinishQuery;;
      with THelpForm.Create(Self) do
        try
          Caption := '매출처 조회';
          GridTableViewCode.Caption  := '매출처코드';
          GridTableViewCode.Width    := 80;
          GridTableViewName1.Caption := '매출처이름';
          GridTableViewName1.Width   := 150;
          GridTableViewName2.Visible := true;
          GridTableViewName2.Caption := '주소';
          GridTableViewName2.Width   := 280;
          GridTableViewName3.Visible := true;
          GridTableViewName3.Caption := '전화번호';
          GridTableViewName3.Width   := 100;
          GridTableViewName4.Visible := true;
          GridTableViewName4.Caption := '대표자';
          GridTableViewName4.Width   := 70;

          SearchText := aCompany;
          SQLText    := 'select   CD_MEMBER, '
                       +'         NM_MEMBER, '
                       +'         ADDR1+'' ''+ADDR2,'
                       +'         dbo.GetPhoneNo(dbo.Decrypt(TEL_MOBIL, 5869,29486,4921)) as TEL_MOBIL, '
                       +'         NM_BOSS, '
                       +'         DS_PRICE, '
                       +'         YN_TRUST, '
                       +'         AMT_TRUST_LIMIT, '
                       +'         YN_BACKOFFICE_EVENT '
                       +'from     MS_MEMBER '
                       +'where    CD_STORE = '''+Ifthen(GetOption(257)='0', StoreCode, HeadStoreCode)+''''
                       +'  and   (CD_MEMBER like :P1+''%'' or NM_MEMBER like ''%''+:P1+''%'' or dbo.Decrypt(TEL_MOBIL,5869,29486,4921) like ''%''+:P1 ) '
                       +'  and    DS_STATUS = ''0'' '
                       +'  and    MEMBER_TYPE = ''T'' '
                       +'order by CD_STORE, CD_MEMBER';
          IsAutoSearch := true; // 폼 띄우면서 자동 검색
          if ShowModal = mrOK then
          begin
            CompanyCodeEdit.Text   := Code;
            CompanyNameEdit.Text   := Names[0];
            CompanyCodeEdit.Tag    := StrToIntDef(Names[4],1);
            isTrust                := Names[5] = 'Y';
            CompanyLimit           := StrToIntDef(Names[6],0);
            isEvent                := Names[7] = 'Y';
            GoodsPanel.Enabled     := True;
            ConditionToolBarFromDateEdit.Enabled   := False;
            Result    := Code;
          end;
        finally
          Free;
        end;
    end;
  finally
    FinishQuery;;
    CompanyCreditAmt;
  end;
end;

procedure TMemberSaleForm.AllCancelButtonClick(Sender: TObject);
begin
  inherited;
  GridTableView.DataController.RecordCount := 0;
  CalcAmts;
end;

procedure TMemberSaleForm.AllotDc;
var vApplyAmt,
    vTotalAmt,
    vTotalDcAmt,
    vCurDcAmt:Currency;
    vIndex :Integer;
begin
  vTotalAmt   := SaleTotalAmtEdit.Value - GoodsDcAmt;
  vTotalDcAmt := DCAmtEdit.Value - GoodsDcAmt;
  vApplyAmt   := 0;
  for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
     GridTableView.DataController.Values[vIndex, GridTableViewReceiptDc.Index] := 0;

  for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
  begin
     vCurDcAmt := (GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index]) / Ifthen(vTotalAmt=0,1,vTotalAmt) * vTotalDcAmt;
     //이번에 할인 할 금액이 전체할인금액보다 작으면
     if ((vApplyAmt+vCurDcAmt) <= vTotalDcAmt) and (vIndex < (GridTableView.DataController.RecordCount-1))  then
     begin
       GridTableView.DataController.Values[vIndex, GridTableViewReceiptDc.Index] := vCurDcAmt;
       vApplyAmt := vApplyAmt + vCurDcAmt;
     end
     else
     begin
       GridTableView.DataController.Values[vIndex, GridTableViewReceiptDc.Index] := vTotalDcAmt - vApplyAmt;
       Break;
     end;
  end;
end;

procedure TMemberSaleForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재 작업을 취소하시겠습니까?') then Exit;

  ConditionToolBarFromDateEdit.Tag := 99;
  ClearEdit;
  ConditionToolBarFromDateEdit.Tag := 0;
  GridTableView.DataController.RecordCount     := 0;
  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
  GridTableView.DataController.Cancel;
  GridTableView.Controller.NewItemRecordFocused := false;
  MainPanel.Enabled         := false;
  SaleHistoryButton.Enabled := false;
  GoodsPanel.Enabled        := false;
  isNew                     := false;
  ConditionToolBarFromDateEdit.Enabled := true;
end;

procedure TMemberSaleForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;

  if LowerCase(UserCode)= userMaster then
  begin
    ErrBox('master 사용자로는 판매를 할 수 없습니다.');
    Exit;
  end;

  ConditionToolBarFromDateEdit.Tag := 99;
  ClearEdit;
  ConditionToolBarFromDateEdit.Tag := 0;
  GridTableView.DataController.RecordCount := 0;
  SaleHistoryButton.Enabled := false;
  isNew := true;
  CompanyCodeEdit.Enabled := true;
  PosNoEdit.Text := '00';
  isLoading := True;
  //판매중인 일자를 구한다
  try
{
    // 매출처판매에시 마감을 사용 할 경우
    if CheckOption(265) then
    begin
      try
        if OpenQuery('select Max(YMD_SALE) '
                    +'from   SL_SALE_H  '
                    +'where  CD_STORE  = :P0 '
                    +'  and  NO_POS    = :P1 '
                    +'  and  YMD_SALE not in (select YMD_CLOSE from SL_CASHIER_MGM where CD_STORE=:P0 and NO_POS = :P1) ',
                    [StoreCode,
                     PosNoEdit.Text]) then
        begin
          if Query.Fields[0].AsString <> '' then
          begin
            ConditionToolBarFromDateEdit.Date    := StoD(Query.Fields[0].AsString);
            ConditionToolBarFromDateEdit.Enabled := False;
            Exit;
          end;
        end;
      finally
        FinishQuery;
      end;

      ConditionToolBarFromDateEdit.Enabled := True;
      try
        if OpenQuery('select Max(YMD_SALE) '
                    +'from   SL_SALE_H '
                    +'where  CD_STORE  =:P0 '
                    +'  and  NO_POS    =:P1 ',
                    [StoreCode,
                     PosNoEdit.Text]) then
        begin
          if Query.Fields[0].AsString <> '' then
          begin
            if Now() > IncDay(StoD(Query.Fields[0].AsString),1) then
              ConditionToolBarFromDateEdit.Date := now()
            else
              ConditionToolBarFromDateEdit.Date    := IncDay(StoD(Query.Fields[0].AsString),1)
          end
          else
            ConditionToolBarFromDateEdit.Date := now();
        end
        else ConditionToolBarFromDateEdit.Date := now();
      finally
        FinishQuery;
      end;
    end
    else
    begin
      ConditionToolBarFromDateEdit.Date    := now();
      ConditionToolBarFromDateEdit.Enabled := True;
    end;
}
    //영수증번호를 채번한다
    try
      OpenQuery('select dbo.LPad( Isnull(Max(NO_RCP),''0'')+1, 4, ''0'') '
               +'from   SL_SALE_H '
               +'where  CD_STORE =:P0 '
               +'  and  YMD_SALE =:P1 '
               +'  and  NO_POS   =:P2 ',
               [StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                PosNoEdit.Text]);
      ReceiptNoEdit.Text := Query.Fields[0].AsString;
    finally
      FinishQuery;
    end;
  finally
    isLoading := false;
    // 마감 되었으면 신규 못 함
    if CheckClose then
    begin
      ConditionToolBarFromDateEdit.Tag := 99;
      ClearEdit;
      ConditionToolBarFromDateEdit.Tag := 0;
      GridTableView.DataController.RecordCount     := 0;
      GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
      GridTableView.DataController.Cancel;
      GridTableView.Controller.NewItemRecordFocused := false;
      MainPanel.Enabled         := false;
      SaleHistoryButton.Enabled := false;
      GoodsPanel.Enabled        := false;
      isNew                     := false;
    end
    else
    begin
      MainPanel.Enabled       := true;
      CompanyCodeEdit.Enabled := true;
      CompanyCodeEdit.SetFocus;
      isChanged := true;
    end;
  end;
end;

procedure TMemberSaleForm.CalcAmts;
  function GetCutDc(AValue:Double):Integer;
  begin
    Result := 0;
    case StrToIntDef(Options[167],0) of
      0 : Result := StrToInt( FormatFloat('#0', (FloorNumber(AValue - (Int(AValue * 0.1) * 10)))));
      1 :
      begin
        if aValue > 10 then
          Result := StrToInt( RightStr( FormatFloat('#0.##',AValue), 2) )
        else
          Result := 0;
      end;
      2 :
      begin
        if aValue > 50 then
          Result := StrToInt( RightStr( FormatFloat('#0.##',AValue), 3) )
        else
          Result := 0;
      end;
      3 :
      begin
        if aValue > 100 then
          Result := StrToInt( RightStr( FormatFloat('#0.##',AValue), 4) )
        else
          Result := 0;
      end;
    end;
  end;
var vIndex:Integer;
    vNetAmt:Currency;
begin
  if isLoading then Exit;
  try
    GridTableView.DataController.BeginUpdate;
    isLoading    := true;
    //NewRow에서 Post 이후에 여기에 왔을때
    if (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGoodsCode.Index] = null) then Exit;

    vNetAmt      := 0;
    GoodsDcAmt   := 0;
    ProfitAmt    := 0;
    DutyFreeAmt  := 0;
    PointExist   := 0;
    if GridTableView.Controller.IsNewItemRowFocused then
      vIndex := -1
    else
      vIndex := 0;

    SaleTotalAmtEdit.Value := 0;
    for vIndex := vIndex to GridTableView.DataController.RecordCount-1 do
    begin
      if (GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index] = null) then Exit;

      GridTableView.DataController.Values[vIndex, GridTableViewTotAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index];
      //판매금액이 0원이면 할인금액을 0원 처리한다
      if GridTableView.DataController.Values[vIndex, GridTableViewTotAmt.Index] = 0 then
        GridTableView.DataController.Values[vIndex, GridTableViewDcPrice.Index] := 0;

      //할인합계금액
      if NVL(GridTableView.DataController.Values[vIndex, GridTableViewEventCode.Index],'') <> EmptyStr then
      begin
        //행사할인 계산
        GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index]      := NVL(GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewEventPrice.Index],0);
        GridTableView.DataController.Values[vIndex, GridTableViewEventDcAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewEventPrice.Index];
        GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index]    := (GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index]) - GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index];
        GoodsDcAmt := GoodsDcAmt + GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index];
      end
      else
      begin
        //단품할인
        GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index]      := NVL(GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewDcPrice.Index],0);
        GoodsDcAmt := GoodsDcAmt + GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index] ;
        GridTableView.DataController.Values[vIndex, GridTableViewEventDcAmt.Index] := 0;
        GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index]    := (GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index]) - GridTableView.DataController.Values[vIndex, GridTableViewDcAmt.Index];
      end;

      //합계금액
      SaleTotalAmtEdit.Value := SaleTotalAmtEdit.Value + GridTableView.DataController.Values[vIndex, GridTableViewTotAmt.Index];
      //공병금액
      GridTableView.DataController.Values[vIndex, GridTableViewBottleAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index] * GridTableView.DataController.Values[vIndex, GridTableViewBottlePrice.Index];

      //부가세계산
      if GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index] = '1' then
      begin
        GridTableView.DataController.Values[vIndex, GridTableViewVatAmt.Index] := Trunc(GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] / 11);
        GridTableView.DataController.Values[vIndex, GridTableViewNetAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewVatAmt.Index];
      end
      else
      begin
        GridTableView.DataController.Values[vIndex, GridTableViewVatAmt.Index] := 0;
        GridTableView.DataController.Values[vIndex, GridTableViewNetAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index];
      end;

      case StrToIntDef(GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index],1) of
           //면세 (판매금액 - 영수증할인배분금액)
        0 : DutyFreeAmt := DutyFreeAmt + GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewReceiptDc.Index];
        1 ://과세일때는(판매금액 - 영수증할인배분금액 - 공병금액)
        begin
          DutyFreeAmt := DutyFreeAmt + GridTableView.DataController.Values[vIndex, GridTableViewBottleAmt.Index];
          vNetAmt  := vNetAmt  + GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] - GridTableView.DataController.Values[vIndex, GridTableViewReceiptDc.Index]-GridTableView.DataController.Values[vIndex, GridTableViewBottleAmt.Index];
        end;
      end;

        //매입금액 계산
        //매입단가 0, 이익률 100 일때는 0원
      if (GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] = 0) and (GridTableView.DataController.Values[vIndex, GridTableViewSaleProfit.Index] = 100) then
        GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := 0
        //매입단가 0, 이익률 0 일때는 판매단가
      else if (GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] = 0) and (GridTableView.DataController.Values[vIndex, GridTableViewSaleProfit.Index] = 0) then
        GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index] * GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index]
        //매입단가 0이면서 이익률이 있을때는 이익률에 따라 매입금액 계산
      else if (GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] = 0) and (GridTableView.DataController.Values[vIndex, GridTableViewSaleProfit.Index] > 0) then
        GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] - (GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index] * (GridTableView.DataController.Values[vIndex, GridTableViewSaleProfit.Index] / 100))
      else
        GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index] := GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index] * GridTableView.DataController.Values[vIndex, GridTableViewSaleQty.Index];

      // 포인트적립 제외상품
      if GridTableView.DataController.Values[vIndex, GridTableViewYnPoint.Index] = 'N' then
        PointExist := PointExist + GridTableView.DataController.Values[vIndex, GridTableViewSaleAmt.Index];

      ProfitAmt := ProfitAmt + GridTableView.DataController.Values[vIndex, GridTableViewBuyAmt.Index];
    end;
    TaxTotalAmtEdit.Value := Trunc(vNetAmt / 11);
    NetTotalAmtEdit.Value := vNetAmt + DutyFreeAmt - TaxTotalAmtEdit.Value;

    //합계금액
//    SaleTotalAmtEdit.Value := NVL(GridTableView.DataController.Summary.FooterSummaryValues[1],0.0);

    //단차할인금액
    CutDcAmt := GetCutDc(SaleTotalAmtEdit.Value);

    //할인금액 계산
    DCAmtEdit.Value   := CutDcAmt + GoodsDcAmt;
    SaleAmtEdit.Value := SaleTotalAmtEdit.Value - DCAmtEdit.Value;

    //할인금액 배분
    AllotDc;
    //판매금액을 기본 외상금액에 입력한다
    CashAmtEdit.Value  := 0;
    TrustAmtEdit.Value := SaleAmtEdit.Value;
    RemainEdit.Value  := CreditAmtEdit.Value + TrustAmtEdit.Value;
    CardAmtEdit.Value  := 0;
    isChanged := true;
  finally
    isLoading := false;
    GridTableView.DataController.EndUpdate;
  end;
end;


function TMemberSaleForm.CheckClose: Boolean;
begin
  Result := false;

  try
    if OpenQuery('select YMD_CLOSE '
                +'from   SL_CASHIER_MGM '
                +'where  CD_STORE  =:P0 '
                +'  and  YMD_CLOSE =:P1 '
                +'  and  NO_POS    =:P2 '
                +'  and  CD_SAWON  =:P3 '
                +'  and  YN_CLOSE  =''Y'' ',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 PosNoEdit.Text,
                 UserCode]) then
    begin
      ErrBox('이미 계산원 마감이 완료된 날짜입니다.');
      Result := true;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  try
    if OpenQuery('select DS_STATUS '
                +'from   SL_POSCLOSE '
                +'where  CD_STORE  =:P0 '
                +'  and  YMD_CLOSE =:P1 '
                +'  and  NO_POS    =:P2 ',
                [StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 PosNoEdit.Text]) then
    begin
      if Query.Fields[0].AsString = 'Y' then
      begin
        ErrBox('이미 POS 마감이 완료된 날짜입니다.');
        Result := true;
        Exit;
      end;
    end;
  finally
    FinishQuery;
  end;

  try
    if OpenQuery('select TOP 1 YM_STOCK '
                +'from   SL_STOCK_MONTH '
                +'where  CD_STORE  =:P0 '
                +'  and  YM_STOCK  =:P1 '
                +'  and  YN_CLOSE  =''Y'' ',
                [StoreCode,
                 LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)]) then
    begin
      ErrBox('월 마감이 완료된 날짜입니다.');
      Result := true;
      Exit;
    end;
  finally
    FinishQuery;
  end;

{  if (IncDay(Now(),-3) > ConditionToolBarFromDateEdit.Date) or (IncDay(Now(),3) < ConditionToolBarFromDateEdit.Date) then
  begin
    ErrBox('오늘보다 사흘 이상 다르게 판매할 수 없습니다.');
    Result := true;
    Exit;
  end;
}
end;

procedure TMemberSaleForm.FastReportDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableMasterView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportDataSet.RecNo >= GridTableMasterView.DataController.RecordCount;
end;

procedure TMemberSaleForm.FastReportDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;

  for vIndex := 0 to GridTableMasterView.ColumnCount-1 do
    if GridTableMasterView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := GridTableMasterView.DataController.Values[FastReportDataSet.RecNo, vIndex];
      break;
    end;
end;
procedure TMemberSaleForm.FastReportSaleDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableDetailView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportSaleDataSet.RecNo >= RecordCount;
end;

procedure TMemberSaleForm.FastReportSaleDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
  for vIndex := 0 to GridTableDetailView.ColumnCount-1 do
    if GridTableDetailView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      if FastReportSaleDataSet.RecNo < GridTableDetailView.DataController.RecordCount then
      begin
        if (GridTableDetailView.Columns[vIndex].DataBinding.FieldName = 'SEQ') or
           (GridTableDetailView.Columns[vIndex].DataBinding.FieldName = 'AMT_SALE') or
           (GridTableDetailView.Columns[vIndex].DataBinding.FieldName = 'AMT_DC') then
          Value := FormatFloat('#,0',GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
        else if (GridTableDetailView.Columns[vIndex].DataBinding.FieldName = 'QTY_SALE') then
        begin
          if (((Ord(GetOption(268)) - Ord('A')) and 4) = 4) and
             (NVL(GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, GridTableDetailViewNepumQty.Index],0) > 1) and
             (GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex] mod NVL(GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, GridTableDetailViewNepumQty.Index],0) = 0)  then
            Value := '('+ FormatFloat('#0',GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex] div NVL(GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, GridTableDetailViewNepumQty.Index],0)) +')'+FormatFloat('#,0.#',GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
          else
            Value := FormatFloat('#,0.#',GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex]);
        end
        else if (GridTableDetailView.Columns[vIndex].DataBinding.FieldName = 'PR_SALE') then
          Value := FormatFloat('#,0.#',GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex])
        else
        begin
          Value := GridTableDetailView.DataController.Values[FastReportSaleDataSet.RecNo, vIndex]
        end;
      end
      else
        if (FastReportSaleDataSet.RecNo = GridTableDetailView.DataController.RecordCount) and (GridTableDetailView.Columns[vIndex].DataBinding.FieldName = 'NM_GOODS') then
          Value := '         -  이하여백  -  '
        else
          Value := '';
      break;
    end;
end;

procedure TMemberSaleForm.Print;
  function GetValueHan(Value: Extended): String;
  var
     s: String;
     i, iDiv, iMod: Integer;
     Flag: Boolean;
  const
        M1: Array[0..9] of String= ('','일','이','삼','사','오','육','칠','팔','구');
        M2: Array[0..3] of String =('','십','백','천');
        M3: Array[0..3] of String =('','만','억','조');
  begin
    s := FloatToStr(Abs(Value));
    if pos('.', s) > 0 then s := Copy(s, 1, pos('.',s)-1);

    Flag := False;
    Result := '';
    for i := 1 to Length(s) do
    begin
      iDiv := (Length(s)-i) div 4;
      iMod := (Length(s)-i) mod 4;

      if StrToInt(s[i]) <> 0 then
      begin
        Flag := True;
        Result := Result + M1[StrToInt(s[i])] + M2[iMod];
      end;
      if (iMod = 0) and Flag then
      begin
        Flag := False;
        Result := Result + M3[iDiv];
      end;
    end;
  end;
var
  vMemo: TfrxMemoView;
  vPicture: TfrxPictureView;
  vSaleDate :String;
  vIndex: Double;
begin
  try
    OpenQuery('select Convert(Varchar(19), DT_SALE, 120) '
             +'from   SL_SALE_H '
             +'where  CD_STORE =:P0 '
             +'  and  YMD_SALE =:P1 '
             +'  and  NO_POS   =:P2 '
             +'  and  NO_RCP   =:P3 ',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              PosNoEdit.Text,
              ReceiptNoEdit.Text
              ]);
    vSaleDate := Query.Fields[0].AsString;
  finally
    FinishQuery;
  end;

  OpenQuery('SELECT  ''전표번호 : ''+b.YMD_SALE+''-''+b.NO_POS+''-''+b.NO_RCP as NO_RCP, '
+'        a.NM_STORE, '
           +'        a.NO_BIZER, '
           +'        a.NM_BOSS, '
           +'        a.ADDR1+'' ''+a.ADDR2 as ADDRESS, '
           +'        a.TEL_OFFICE + ''  FAX ''+a.TEL_FAX AS TEL_OFFICE, '
           +'        c.NM_MEMBER +'' 귀하'' as NM_TRDPL, '
           +'        (b.AMT_DUTY + b.AMT_TAX) - Convert(Int, (b.AMT_DUTY + b.AMT_TAX) / 11)  as AMT_NET, '                                   //과세금액
           +'        Convert(Int, (b.AMT_DUTY + b.AMT_TAX) / 11) as AMT_TAX, '                                               //부가세
           +'        b.AMT_SALE, '
           +'        b.AMT_SALE - b.AMT_TRUST as AMT_PAY, '
           +'        ISNULL(c.AMT_MISU,0) + b.AMT_TRUST as AMT_MISU, '
           +'        c.TEL_OFFICE as TEL_OFFICE_TRD, '
           +'        c.COMPANY_ADDRESS, '
           +'        a.BILL_REMARK + case when IsNull(a.BILL_REMARK,'''') = '''' then '''' else Char(13) end + b.REMARK as BILL_REMARK, '
           +'        b.AMT_SALE+b.DC_TOT as AMT_SALE_TOT, '                     //합계금액
           +'        b.DC_TOT as AMT_DC, '                                      //할인금액
           +'        b.AMT_DUTYFREE '
           +'  FROM  MS_STORE a inner join '
           +'        SL_SALE_H b on a.CD_STORE = b.CD_STORE and b.YMD_SALE = :P1 and b.NO_POS = :P2 and b.NO_RCP = :P3 inner join '
           +'        (select t1.CD_MEMBER, '
           +'                t1.NM_MEMBER, '
           +'                dbo.Decrypt(t1.TEL_JOB, 5869,29486,4921) as TEL_OFFICE, '
           +'                t1.ADDR1 +'' ''+t1.ADDR2 as COMPANY_ADDRESS, '
           +'                Isnull(t2.AMT_BASE,0)+Isnull(t3.AMT_TRUST,0)-isnull(t4.AMT_MISU,0) as AMT_MISU '
           +'           from MS_MEMBER      t1 left outer join '
           +'                SL_BOOKS_MONTH t2 on t2.CD_STORE =:P0 and t1.CD_MEMBER = t2.CD_CODE and t2.CD_CLOSE = ''20'' and t2.CD_CODE <> '''' and t2.ym_close = LEFT(:P1,6)  left outer join '
           +'                (select CD_STORE, '
           +'                        CD_MEMBER, '
           +'                        Sum(AMT_TRUST) as AMT_TRUST  '
           +'                   from SL_SALE_H  '
           +'                  where DS_SALE <> ''V'' '
           +'                    and CD_MEMBER <> '''' '
           +'                    and YMD_SALE between LEFT(:P1,6)+''01'' and :P1 and DS_SALE <> ''V'' and Convert(varchar(19), DT_SALE, 120) < :P4 '
           +'                  group by CD_STORE, CD_MEMBER '
           +'                ) t3 on t3.CD_STORE =:P0 and t1.CD_MEMBER = t3.CD_MEMBER left outer join '
           +'                (select CD_STORE, '
           +'                        CD_MEMBER, '
           +'                        SUM(isnull(AMT_PAYIN,0)+isnull(AMT_DC,0)) as AMT_MISU '
           +'                   from SL_ACCT '
           +'                  where YMD_OCCUR between LEFT(:P1,6)+''01'' and :P1 and Convert(varchar(19), DT_INSERT, 120) < :P4 '
           +'                  group by CD_STORE, CD_MEMBER '
           +'                 ) t4 on t4.CD_STORE =:P0 and t1.CD_MEMBER = t4.CD_MEMBER '
           +'          where t1.CD_STORE = :P5 '
           +'         ) c on b.CD_MEMBER = c.CD_MEMBER '
           +' WHERE  a.CD_STORE =:P0',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            PosNoEdit.Text,
            ReceiptNoEdit.Text,
            vSaleDate,
            Ifthen(GetOption(257)='0', StoreCode, HeadStoreCode)]);
  DM.ReadQuery(Query, GridTableMasterView);
  if GridTableMasterView.DataController.RecordCount > 0 then
  begin
    GridTableMasterView.DataController.Values[0, GridTableMasterViewColumn19.Index] := IfThen(ConditionToolBarComboBox.ItemIndex=1, '견   적   서', '거 래 명 세 서');
    GridTableMasterView.DataController.Post;
  end;


  OpenQuery('SELECT  a.SEQ, '
           +'        case when a.AMT_VAT = 0 then ''*'' else '''' end + a.CD_GOODS as CD_GOODS, '
           +Ifthen(((Ord(GetOption(262)) - Ord('A')) and 2) <> 2, ' b.NM_GOODS +'' ''+ b.NM_SPEC as NM_GOODS, ', 'b.NM_GOODS as NM_GOODS, ')
           +'        b.NM_SPEC, '
           +'        a.QTY_SALE, '
           +'        a.PR_SALE, '
           +'        a.AMT_SALE, ' //판매금액
           +'        a.DC_TOT as AMT_DC '
           +Ifthen(((Ord(GetOption(268)) - Ord('A')) and 4) <> 4,'',', (select  TOP 1 QTY_NEPUM '
                                                                 +'     from  MS_GOODS '
                                                                 +'    where  CD_STORE   = b.CD_STORE '
                                                                 +'      and  CD_GOODS_T = b.CD_GOODS  '
                                                                 +'      and  QTY_NEPUM  > 1 '
                                                                 +'    order by QTY_NEPUM ) as QTY_NEPUM ')
           +'  FROM SL_SALE_D a inner join '
           +'       MS_GOODS  b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
           +' WHERE a.CD_STORE =:P0 '
           +'   AND a.YMD_SALE =:P1 '
           +'   AND a.NO_POS   =:P2 '
           +'   AND a.NO_RCP   =:P3 '
           +' ORDER BY a.SEQ ',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            PosNoEdit.Text,
            ReceiptNoEdit.Text]);
  DM.ReadQuery(Query, GridTableDetailView);

  RecordCount := GridTableDetailView.DataController.RecordCount;
  // 1페이지
  if RecordCount <= 29 then RecordCount := 29
  else
  begin
    RecordCount := ((RecordCount - 29) div 40) * 40 + 29 + Ifthen(((RecordCount - 29) mod 40)=0,0,40);
  end;

  // 날짜
  vMemo := TfrxMemoView(FastReport.FindObject('SaleDate'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatDateTime('yyyy"년 "mm"월 "dd"일"', ConditionToolBarFromDateEdit.Date);

  // 서명이미지
  vPicture := TfrxPictureView(FastReport.FindObject('SignPicture'));
  if Assigned(vPicture) then
    vPicture.Picture.Assign(StoreSignImage);


  // 출력일시
  vMemo := TfrxMemoView(FastReport.FindObject('PrintTime'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '출력일시 : '+FormatDateTime(fmtDateTime, Now);

  // 규격
  if (((Ord(GetOption(262)) - Ord('A')) and 2) = 2) then
  begin
    vIndex := 0;
    vMemo  := TfrxMemoView(FastReport.FindObject('SpecLabel'));
    if Assigned(vMemo) and not vMemo.Visible then
    begin
      vMemo.Visible   := true;
      vIndex          := vMemo.Width;
    end;
    vMemo  := TfrxMemoView(FastReport.FindObject('GoodsNameLabel'));
    if Assigned(vMemo) then
    begin
      vMemo.Memo.Text := '상품이름';
      vMemo.Width     := vMemo.Width - vIndex;
    end;
    vMemo  := TfrxMemoView(FastReport.FindObject('SpecData'));
    if Assigned(vMemo) and not vMemo.Visible then
    begin
      vMemo.Visible   := true;
      vIndex          := vMemo.Width;
    end;
    vMemo  := TfrxMemoView(FastReport.FindObject('GoodsNameData'));
    if Assigned(vMemo) then
      vMemo.Width     := vMemo.Width - vIndex;
  end;

  // 할인금액
  if (((Ord(GetOption(262)) - Ord('A')) and 8) = 8) then
  begin
    vIndex := 0;
    vMemo  := TfrxMemoView(FastReport.FindObject('Memo3'));
    if Assigned(vMemo) and vMemo.Visible then
    begin
      vMemo.Visible := false;
      vIndex        := vMemo.Width;
    end;
    if vIndex > 0 then
    begin
      vMemo := TfrxMemoView(FastReport.FindObject('Memo24'));
      if Assigned(vMemo) then
        vMemo.Visible := false;
      vMemo := TfrxMemoView(FastReport.FindObject('GoodsNameLabel'));
      if Assigned(vMemo) then
        vMemo.Width   := vMemo.Width + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('GoodsNameData'));
      if Assigned(vMemo) then
        vMemo.Width   := vMemo.Width + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SpecLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SpecData'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('Memo28'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SalePlanAmtLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SaleVatAmtCaptionLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SalePlanRateLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SalePlanAmtCaptionLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
      vMemo := TfrxMemoView(FastReport.FindObject('SaleCustomerAmtLabel'));
      if Assigned(vMemo) then
        vMemo.Left    := vMemo.Left  + vIndex;
    end;
  end;

  // 합계금액
  vMemo := TfrxMemoView(FastReport.FindObject('SaleAmoutText'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := GetValueHan(SaleAmtEdit.Value)+'원정';
  vMemo := TfrxMemoView(FastReport.FindObject('SaleAmt'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '( ￦'+FormatFloat('#,0',SaleAmtEdit.Value)+' )';

  //출력매수
  FastReport.PrintOptions.Copies := StoI(GetOption(261));

  // 미수내역
  if ((Ord(GetOption(262)) - Ord('A')) and 1) <> 1 then
  begin
    vMemo := TfrxMemoView(FastReport.FindObject('MisuAmt'));
    if Assigned(vMemo) then vMemo.Visible := true;
  end
  else
  begin
    vMemo := TfrxMemoView(FastReport.FindObject('MisuAmt'));
    if Assigned(vMemo) then vMemo.Visible := false;
  end;

  //하단문구
  vMemo := TfrxMemoView(FastReport.FindObject('RemarkTelMemo'));
  if Assigned(vMemo) then
    vMemo.Visible := CharInSet(GetOption(263), ['1','3','5','7']);
  vMemo := TfrxMemoView(FastReport.FindObject('RemarkAddressMemo'));
  if Assigned(vMemo) then
  begin
    vMemo.Visible := CharInSet(GetOption(263), ['2','3','6','7']);
    vMemo.Top     := IfThen(CharInSet(GetOption(263), ['2','6']), 6, 29);
  end;
  vMemo := TfrxMemoView(FastReport.FindObject('RemarkMemo'));
  if Assigned(vMemo) then
  begin
    vMemo.Visible := GetOption(263) >= '4';
    vMemo.Top     := IfThen(GetOption(263)='4',  6, IfThen(GetOption(263)='7', 51, 29));
    vMemo.Height  := IfThen(GetOption(263)='4', 86, IfThen(GetOption(263)='7', 40, 63));
  end;

  // 출력
  if GetOption(264)='1' then
    FastReport.ShowReport
  else
    FastReport.Print;
end;


end.

