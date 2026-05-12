unit MemberPaySaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, cxTextEdit,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxButtonEdit, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, StrUtils,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxGridBandedTableView, MaskUtils,
  cxCheckComboBox, frxClass, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, cxCheckBox, System.ImageList, dxmdaset;

type
  TReportData = record
    YMD_SALE     : string;
    NO_RECEIPT   : string;
    DS_SALE      : string;
    NO_CARD      : string;
    NM_CARD      : string;
    NO_APPROVAL  : string;
    AMT_CASHRCP,
    AMT_CARD,
    AMT_NET,
    AMT_TAX,
    AMT_DUTYFREE,
    AMT_SALE : Currency;
  end;

type
  TMemberPaySaleShowForm = class(TInheritShowForm)
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewReceiptNo: TcxGridColumn;
    GridTableViewDsSale: TcxGridColumn;
    GridTableViewCashRcpAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewApprovalNo: TcxGridColumn;
    GridTableViewNetAmt: TcxGridColumn;
    GridTableViewTaxAmt: TcxGridColumn;
    GridTableViewDutyfreeAmt: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCardName: TcxGridColumn;
    ConditionToolBarCompanyEdit: TcxButtonEdit;
    ConditionToolBarComapnyNameLabel: TcxLabel;
    GridLevel1: TcxGridLevel;
    GridBandedTableView1: TcxGridBandedTableView;
    GridBandedTableView1Column1: TcxGridBandedColumn;
    GridBandedTableView1Column3: TcxGridBandedColumn;
    GridBandedTableView1Column4: TcxGridBandedColumn;
    GridBandedTableView1Column5: TcxGridBandedColumn;
    GridBandedTableView1Column6: TcxGridBandedColumn;
    GridBandedTableView1Column7: TcxGridBandedColumn;
    GridBandedTableView1Column8: TcxGridBandedColumn;
    GridBandedTableView1Column9: TcxGridBandedColumn;
    GridBandedTableView1Column10: TcxGridBandedColumn;
    GridBandedTableView1Column11: TcxGridBandedColumn;
    GridBandedTableView1Column12: TcxGridBandedColumn;
    GridBandedTableView1Column13: TcxGridBandedColumn;
    GridBandedTableView1Column14: TcxGridBandedColumn;
    GridBandedTableView1Column15: TcxGridBandedColumn;
    GridBandedTableView1Column16: TcxGridBandedColumn;
    GridBandedTableView1Column17: TcxGridBandedColumn;
    GridBandedTableView1Column18: TcxGridBandedColumn;
    GridBandedTableView1Column19: TcxGridBandedColumn;
    GridBandedTableView1Column20: TcxGridBandedColumn;
    GridBandedTableView1Column2: TcxGridBandedColumn;
    GridBandedTableView1Column21: TcxGridBandedColumn;
    GridBandedTableView1Column22: TcxGridBandedColumn;
    GridBandedTableView1Column23: TcxGridBandedColumn;
    FastReport: TfrxReport;
    FastReportDataSet: TfrxUserDataSet;
    ButtonToolBarPrintButtonPopupMenuFormat: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarCompanyEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionToolBarCompanyEditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarCompanyEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuFormatClick(Sender: TObject);
    procedure FastReportDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FastReportDataSetNewGetValue(Sender: TObject;
      const VarName: string; var Value: Variant);
  private
    ReportData: TList;
    MemberBusinessInfo :String;
    function  SearchMember(aMember: string = ''): string;
  protected
    function  DoSearch:Boolean; override;
    procedure DoPrint; override;
    procedure DoPreview; override;
  end;

var
  MemberPaySaleShowForm: TMemberPaySaleShowForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

procedure TMemberPaySaleShowForm.FastReportDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  Eof :=  FastReportDataSet.RecNo >= ReportData.Count;
end;

procedure TMemberPaySaleShowForm.FastReportDataSetNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
begin
  inherited;
  if VarName = 'YMD_SALE' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).YMD_SALE
  else if VarName = 'NO_RECEIPT' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).NO_RECEIPT
  else if VarName = 'DS_SALE' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).DS_SALE
  else if VarName = 'NO_CARD' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).NO_CARD
  else if VarName = 'NM_CARD' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).NM_CARD
  else if VarName = 'NO_APPROVAL' then
  begin
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).NO_APPROVAL;
    Value := LeftStr(Value, Length(Value)-3)+'***';
  end
  else if VarName = 'AMT_CASHRCP' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).AMT_CASHRCP
  else if VarName = 'AMT_CARD' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).AMT_CARD
  else if VarName = 'AMT_DUTYFREE' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).AMT_DUTYFREE
  else if VarName = 'AMT_NET' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).AMT_NET
  else if VarName = 'AMT_TAX' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).AMT_TAX
  else if VarName = 'AMT_SALE' then
    Value := TReportData(ReportData.Items[FastReportDataSet.RecNo]^).AMT_SALE;
end;

procedure TMemberPaySaleShowForm.FormCreate(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
  ReportData  := TList.Create;

  dxComponentPrinter1Link1.ReportFootnotes.Text := '※ 부가가치세법 시행령(06.02.09)으로 신용카드, 현금영수증 구매분에 대해서는 세금계산서 및 계산서 발행이 불가합니다.';
  dxComponentPrinter1Link1.ReportFootnotes.Font.Size := 9;
  dxComponentPrinter1Link1.ReportFootnotes.Font.Name := '맑은고딕';
  dxComponentPrinter1Link1.ReportFootnotes.TextAlignX := taLeft;
end;

procedure TMemberPaySaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  ReportData.Free;
end;

procedure TMemberPaySaleShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ButtonToolBarPrintButtonPopupMenuFormat.Enabled := Grid.ActiveLevel = GridLevel;
end;



function TMemberPaySaleShowForm.SearchMember(aMember: string): string;
begin
  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := '회원번호';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '회원이름';
      GridTableViewName1.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '카드번호';
      GridTableViewName2.Width   := 110;
      GridTableViewName3.Visible := true;
      GridTableViewName3.Caption := '전화번호';
      GridTableViewName3.Width   := 100;
      SearchText := aMember;
      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER, '
                   +'         NO_CARD, '
                   +'         AES_Decrypt(TEL_MOBILE, 71483) '
                   +'from     MS_MEMBER  '
                   +'where    CD_HEAD   = :P0 '
                   +'  and    CD_STORE  = :P1 '
                   +'  and   (CD_MEMBER like ConCat(''%'',:P2,''%'') or NM_MEMBER like ConCat(''%'',:P2,''%'')) '
                   +'  and    DS_STATUS = ''0'' '
                   +'order by NM_MEMBER';
      if SearchText <> EmptyStr then IsAutoSearch := True;

      if ShowModal = mrOK then
      begin
        ConditionToolBarCompanyEdit.Text         := Code;
        ConditionToolBarComapnyNameLabel.Caption := Names[0];
//        MemberBusinessInfo                       := Format('대표자 : %s (%-12.12s)',[Names[6], Names[5]]);
//        ReportSubTitle := Format('회  원 : %s-%s  [대표:%s (%-12.12s)]        공급자 : %s    [대표:%s (%s)] ', [Code, Format('%-30.30s',[Names[0]]), Names[6], Format('%-12.12s',[Names[5]]), StoreName, BossName, BusinessNumber]);
        Result    := Code;
      end;
    finally
      Free;
    end;
end;

procedure TMemberPaySaleShowForm.ConditionToolBarCompanyEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchMember(ConditionToolBarCompanyEdit.Text);
end;

procedure TMemberPaySaleShowForm.ConditionToolBarCompanyEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (Sender = ConditionToolBarCompanyEdit) and (ConditionToolBarComapnyNameLabel.Caption <> EmptyStr) and
          ((GetOnlyNumber(ConditionToolBarCompanyEdit.EditingText) <> ConditionToolBarCompanyEdit.EditingText) or (Length(ConditionToolBarCompanyEdit.EditingText) <> 10)) then
  begin
    ConditionToolBarComapnyNameLabel.Caption := EmptyStr;
  end;
end;

procedure TMemberPaySaleShowForm.ConditionToolBarCompanyEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vCode, vName, vBussinesNumber :String;
begin
  inherited;
  if DisplayValue <> EmptyStr then
    try
      OpenQuery('select   CD_MEMBER, '
               +'         NM_MEMBER, '
               +'         NO_JUMIN, '
               +'         NO_CARD '
               +'from     MS_MEMBER '
               +'where    CD_HEAD   =:P0 '
               +'  and    CD_STORE = :P1 '
               +'  and   (CD_MEMBER =:P2 or NM_MEMBER like ConCat(''%'',:P2,''%'')) '
               +'  and    DS_STATUS = ''0'' '
               +'order by CD_STORE, CD_MEMBER',
                [HeadStoreCode,
                 Ifthen(GetOption(257)='0', StoreCode,'0000'),
                 DisplayValue]);
      if not Query.Eof then
      begin
        // 일단 첫번째 값을 받아 놓는다
        vCode           := Query.Fields[0].AsString;
        vName           := Query.Fields[1].AsString;
        vBussinesNumber := Format('대표자 : %s (%-12.12s)',[ Query.Fields[1].AsString, Query.Fields[2].AsString]);
        ReportSubTitle := Format('회  원 : %s-%s  [대표:%s (%-12.12s)]        공급자 : %s    [대표:%s (%s)] ', [vCode, Format('%-30.30s',[vName]), Format('%-12.12s',[Query.Fields[3].AsString]), Query.Fields[2].AsString, StoreName, BossName, BusinessNumber]);
        // 쿼리 다음 줄로 이동해 본다
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue              := vCode;
          ConditionToolBarComapnyNameLabel.Caption := vName;
          MemberBusinessInfo        := vBussinesNumber;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
        begin
          DisplayValue := SearchMember(DisplayValue);
        end;
      end;
    finally
      FinishQuery;
    end;
end;

procedure TMemberPaySaleShowForm.DoPreview;
begin
  inherited;
end;

procedure TMemberPaySaleShowForm.DoPrint;
begin
  inherited;
end;

function TMemberPaySaleShowForm.DoSearch: Boolean;
begin
  if ConditionToolBarCompanyEdit.Text = EmptyStr then
  begin
    MsgBox('조회할 회원을 입력하십시오.');
    ConditionToolBarCompanyEdit.SetFocus;
    Result := true;
    Exit;
  end;
  if Grid.ActiveLevel = GridLevel then
  begin
    ReportTitle := '신용카드/현금영수증 구매내역';
    OpenQuery('select   StoDW(s.YMD_SALE) as YMD_SALE, '
             +'         ''판매'' as DS_SALE, '
             +'         ConCat(s.NO_POS,''-'',s.NO_RCP) as NO_RCP, '
             +'         GetCardNo(s.NO_CARD,''N'') as NO_CARD, '
             +'         0 as AMT_CASHRCP, '
             +'         case s.DS_TRD when ''C'' then -s.AMT_APPROVAL           else s.AMT_APPROVAL           end as AMT_CARD, '
             +'         round(DivFlt(case s.DS_TRD when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end,h.AMT_SALE) * (h.AMT_SALE-h.AMT_TAX-h.AMT_DUTYFREE),0) as AMT_NET, '
             +'         round(DivFlt(case s.DS_TRD when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end,h.AMT_SALE) * h.AMT_TAX,0) as AMT_TAX, '
             +'         round(DivFlt(case s.DS_TRD when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end,h.AMT_SALE) * h.AMT_DUTYFREE,0) as AMT_FREE, '
             +'         case s.DS_TRD when ''C'' then -s.AMT_APPROVAL           else s.AMT_APPROVAL           end as AMT_TOTAL, '
             +'         case when s.TYPE_TRD = ''O'' then ''카드단말기'' else s.NO_APPROVAL end as NO_APPROVAL, '
             +'         s.NM_CARDPL '
             +'  from '+GetPartitionTable('SL_CARD', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 's inner join')
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
             +'                      on s.CD_HEAD  = h.CD_HEAD '
             +'                     and s.CD_STORE = h.CD_STORE '
             +'                     and s.YMD_SALE = h.YMD_SALE '
             +'                     and s.NO_POS   = h.NO_POS '
             +'                     and s.NO_RCP   = h.NO_RCP '
             +' where   s.CD_HEAD  = :P0 '
             +'   and   s.CD_STORE = :P1 '
             +'   and   s.YMD_SALE between :P2 and :P3 '
             +'   and   h.CD_MEMBER = :P4 '
             +' union all '
             +' select   StoDW(s.YMD_SALE) as YMD_SALE, '
             +'          ''판매'' as DS_SALE, '
             +'          ConCat(s.NO_POS,''-'',s.NO_RCP) as NO_RCP, '
             +'          GetCardNo(s.NO_CARD,''N'') as NO_CARD, '
             +'          case s.DS_TRD when ''C'' then -s.AMT_APPROVAL           else s.AMT_APPROVAL           end as AMT_CASHRCP, '
             +'          0, '
             +'          round(DivFlt(case s.DS_TRD when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end, h.AMT_SALE) * (h.AMT_SALE-h.AMT_TAX-h.AMT_DUTYFREE),0) as AMT_NET, '
             +'          round(DivFlt(case s.DS_TRD when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end, h.AMT_SALE) * h.AMT_TAX,0) as AMT_TAX, '
             +'          round(DivFlt(case s.DS_TRD when ''C'' then -s.AMT_APPROVAL else s.AMT_APPROVAL end, h.AMT_SALE) * h.AMT_DUTYFREE,0) as AMT_FREE, '
             +'          case s.DS_TRD when ''C'' then -s.AMT_APPROVAL           else s.AMT_APPROVAL           end as AMT_TOTAL, '
             +'          s.NO_APPROVAL, '
             +'          '''' '
             +' from     SL_CASH   s  inner join '
             +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'                       on s.CD_HEAD  = h.CD_HEAD '
             +'                      and s.CD_STORE = h.CD_STORE '
             +'                      and s.YMD_SALE = h.YMD_SALE '
             +'                      and s.NO_POS   = h.NO_POS '
             +'                      and s.NO_RCP   = h.NO_RCP '
             +' where    s.CD_HEAD  =:P0 '
             +'   and    s.CD_STORE =:P1 '
             +'   and    s.YMD_SALE between :P1 and :P3 '
             +'   and    h.CD_MEMBER = :P4 '
             +'order by 1 desc ',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               ConditionToolBarCompanyEdit.Text]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else
  begin
    ReportTitle := '결제수단별 구매내역';
    OpenQuery('select StoD(YMD_SALE) as YMD_SALE, '
             +'       SUM(AMT_SALE)     as AMT_SALE, '
             +'       SUM(AMT_DUTYFREE) as AMT_DUTYFREE, '
             +'       SUM(AMT_DUTY+AMT_TAX) - DivInt(SUM(AMT_DUTY+AMT_TAX), 11) as AMT_NET, '
             +'       DivInt(SUM(AMT_DUTY+AMT_TAX), 11) as AMT_TAX, '
             +'       SUM(Ceil( DivFlt(AMT_DUTYFREE, AMT_SALE) * (AMT_CASH+AMT_BANK+AMT_CHECK-AMT_CASHRCP))) as AMT_CASH_DUTYFREE, '
             +'       SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * (AMT_CASH+AMT_BANK+AMT_CHECK-AMT_CASHRCP))) - DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * (AMT_CASH+AMT_BANK+AMT_CHECK-AMT_CASHRCP))),11) as AMT_CASH_NET, '
             +'       DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * (AMT_CASH+AMT_CHECK-AMT_CASHRCP))),11) as AMT_CASH_TAX, '
             +'       SUM(Ceil( DivFlt(AMT_DUTYFREE, AMT_SALE) * AMT_CARD)) as AMT_CARD_DUTYFREE, '
             +'       SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_CARD)) - DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_CARD)),11) as AMT_CARD_NET, '
             +'       DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_CARD)),11) as AMT_CARD_TAX, '
             +'       SUM(Ceil( DivFlt(AMT_DUTYFREE, AMT_SALE) * AMT_CASHRCP)) as AMT_CASHRCP_DUTYFREE, '
             +'       SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_CASHRCP)) - DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_CASHRCP)),11) as AMT_CASHRCP_NET, '
             +'       DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_CASHRCP)),11) as AMT_CASHRCP_TAX, '
             +'       SUM(Ceil( DivFlt(AMT_DUTYFREE, AMT_SALE) * AMT_GIFT)) as AMT_GIFT_DUTYFREE, '
             +'       SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_GIFT)) - DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_GIFT)),11) as AMT_GIFT_NET, '
             +'       DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_GIFT)),11) as AMT_GIFT_TAX, '
             +'       SUM(Ceil( DivFlt(AMT_DUTYFREE, AMT_SALE)                     * AMT_TRUST)) as AMT_TRUST_DUTYFREE, '
             +'       SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_TRUST)) - DivInt(SUM(Ceil(DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_TRUST)),11) as AMT_TRUST_NET, '
             +'       DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * AMT_TRUST)),11) as AMT_TRUST_TAX, '
             +'       SUM(Ceil( DivFlt(AMT_DUTYFREE, AMT_SALE) * (AMT_SALE-AMT_CASH-AMT_BANK-AMT_CHECK-AMT_GIFT-AMT_CARD-AMT_TRUST))) as AMT_ETC_DUTYFREE, '
             +'       SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * (AMT_SALE-AMT_CASH-AMT_BANK-AMT_CHECK-AMT_GIFT-AMT_CARD-AMT_TRUST)))  '
             +'       - DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * (AMT_SALE-AMT_CASH-AMT_BANK-AMT_CHECK-AMT_GIFT-AMT_CARD-AMT_TRUST))),11) as AMT_ETC_NET, '
             +'       DivInt(SUM(Ceil( DivFlt(AMT_DUTY+AMT_TAX, AMT_SALE) * (AMT_SALE-AMT_CASH-AMT_BANK-AMT_CHECK-AMT_GIFT-AMT_CARD-AMT_TRUST))),11) as AMT_ETC_TAX '
             +'  from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and YMD_SALE Between :P2 and :P3 '
             +'   and CD_MEMBER =:P4 '
             +' group by YMD_SALE',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarCompanyEdit.Text]);
     Result := DM.ReadQuery(Query, GridBandedTableView1);
  end;
end;


procedure TMemberPaySaleShowForm.ButtonToolBarPrintButtonPopupMenuFormatClick(Sender: TObject);
var
  vMemo: TfrxMemoView;
  vIndex         : Integer;
  vReportData  : ^TReportData;
  vPicture: TfrxPictureView;
begin
  inherited;
  ReportData.Clear;
  vIndex := 0;
  for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
  begin
    New(vReportData);
    with vReportData^ do
    begin
      YMD_SALE       := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index];
      NO_RECEIPT     := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewReceiptNo.Index];
      DS_SALE        := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewDsSale.Index];
      AMT_CASHRCP    := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCashRcpAmt.Index];
      AMT_CARD       := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCardAmt.Index];
      NO_CARD        := NVL(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCardNo.Index],'');
      NM_CARD        := NVL(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCardName.Index],'');
      NO_APPROVAL    := NVL(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewApprovalNo.Index],'');
      AMT_NET        := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewNetAmt.Index];
      AMT_TAX        := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewTaxAmt.Index];
      AMT_DUTYFREE   := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewDutyfreeAmt.Index];
      AMT_SALE       := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index];
    end;
    ReportData.Add(vReportData);
  end;

  OpenQuery('select GetBusinessNo(NO_BIZER) as NO_BIZER, '
           +'       ConCat(ADDR1,'' '',ADDR2) as ADDR, '
           +'       NM_JONGMOK, '
           +'       NM_UPTAE, '
           +'       NM_BOSS, '
           +'       TEL_OFFICE, '
           +'       TEL_FAX '
           +'  from MS_STORE '
           +' where CD_HEAD =:P0 '
           +'   and CD_STORE =:P1 ',
           [HeadStoreCode,
            StoreCode]);
  try
    vPicture := TfrxPictureView(FastReport.FindObject('SignPicture'));
    if Assigned(vPicture) then
      vPicture.Picture.Assign(StoreSignImage);

    vMemo := TfrxMemoView(FastReport.FindObject('StoreNameMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := StoreName;
    vMemo := TfrxMemoView(FastReport.FindObject('StoreBizNoMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := Query.FieldByName('NO_BIZER').AsString;
    vMemo := TfrxMemoView(FastReport.FindObject('StoreAddressMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := Query.FieldByName('ADDR').AsString;
    vMemo := TfrxMemoView(FastReport.FindObject('StoreBossMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := Query.FieldByName('NM_BOSS').AsString;
    vMemo := TfrxMemoView(FastReport.FindObject('StoreUptaeMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := Query.FieldByName('NM_UPTAE').AsString;
    vMemo := TfrxMemoView(FastReport.FindObject('StoreJongMokMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := Query.FieldByName('NM_JONGMOK').AsString;
    vMemo := TfrxMemoView(FastReport.FindObject('StoreTelNoMemo'));
    if Assigned(vMemo) then
      vMemo.Memo.Text := Format('Tel. %s    Fax. %s',[GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString), GetPhoneNo(Query.FieldByName('TEL_FAX').AsString)]);

  finally
    Query.Close;
  end;
  vMemo := TfrxMemoView(FastReport.FindObject('PrintTime'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '출력일시 : '+FormatDateTime(fmtDateTime, Now);

  vMemo := TfrxMemoView(FastReport.FindObject('StoreNameLabel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := StoreName;

  vMemo := TfrxMemoView(FastReport.FindObject('MemberNameMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Format('회원: ［%s］%s  %s',[ConditionToolBarCompanyEdit.Text,
                                                                ConditionToolBarComapnyNameLabel.Caption,
                                                                MemberBusinessInfo]);

  vMemo := TfrxMemoView(FastReport.FindObject('SaleReceiptNoMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Format('구매기간 : %s ~ %s',[ConditionToolBarFromDateEdit.Text,
                                                    ConditionToolBarToDateEdit.Text]);

  FastReport.ShowReport;
end;

end.
