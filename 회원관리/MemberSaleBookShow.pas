unit MemberSaleBookShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Data.DB, cxDBData, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers,
  cxClasses, DBAccess, Uni, MemDS, cxGridLevel, cxGridDBTableView,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, MaskUtils, cxButtonEdit, DateUtils, cxCurrencyEdit,
  dxmdaset, frxClass, frxExportImage, StrUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  frxExportBaseDialog, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TReportMaster = record
    YMD_SALE     : string;
    SALE_DETAIL  : string;
    AMT_SALE,
    AMT_TRUST,
    AMT_COLLECT,
    AMT_DC,
    AMT_BALANCE: Currency;
  end;

  TReportDetail = record
    YMD_SALE,
    CD_MENU,
    NM_MENU,
    NM_SPEC      : string;
    QTY_SALE,
    PR_SALE,
    AMT_SALE: Currency;
  end;
type
  TMemberSaleBookShowForm = class(TInheritShow2Form)
    GridDBTableViewSaleDate: TcxGridDBColumn;
    GridDBTableViewSaleDetails: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewTrustAmt: TcxGridDBColumn;
    GridDBTableViewCollectAmt: TcxGridDBColumn;
    GridDBTableViewBalanceAmt: TcxGridDBColumn;
    ConditionToolBarMemberNameLabel: TcxLabel;
    ConditionToolBarMemberEdit: TcxButtonEdit;
    GridSubDBTableViewMenuCode: TcxGridDBColumn;
    GridSubDBTableViewMenuName: TcxGridDBColumn;
    GridSubDBTableViewSpec: TcxGridDBColumn;
    GridSubDBTableViewSaleQty: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewLink: TcxGridDBColumn;
    GridSubDBTableViewSalePrice: TcxGridDBColumn;
    FastReport: TfrxReport;
    GridDBTableViewDcAmt: TcxGridDBColumn;
    FastReportMasterDataSet: TfrxUserDataSet;
    FastReportDetailDataSet: TfrxUserDataSet;
    frxTIFFExport: TfrxTIFFExport;
    procedure ConditionToolBarMemberEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionToolBarMemberEditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarMemberEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FastReportMasterDataSetCheckEOF(Sender: TObject;
      var Eof: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FastReportDetailDataSetCheckEOF(Sender: TObject;
      var Eof: Boolean);
    procedure FastReportMasterDataSetFirst(Sender: TObject);
    procedure FastReportMasterDataSetNext(Sender: TObject);
    procedure FastReportMasterDataSetPrior(Sender: TObject);
    procedure FastReportDetailDataSetFirst(Sender: TObject);
    procedure FastReportDetailDataSetNext(Sender: TObject);
    procedure FastReportDetailDataSetPrior(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
    procedure FastReportMasterDataSetGetValue(const VarName: string;
      var Value: Variant);
    procedure FastReportDetailDataSetGetValue(const VarName: string;
      var Value: Variant);
    procedure ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuTIFClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuExcelClick(Sender: TObject);
  private
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
    ReportMaster,
    ReportDetail: TList;
    MasterNo: Integer;
    DetailNo: Integer;
    function  SearchMember(aMember: string = ''): string;
    procedure GetPrintData;
    procedure Print(aPrint:Integer);
  protected
    function  DoSearch:Boolean; override;
  end;

var
  MemberSaleBookShowForm: TMemberSaleBookShowForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

{ TMemberSaleBookShowForm }
procedure TMemberSaleBookShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmAll;//pmPrintPreviewTif;
  DefaultDate := ddNowMonth;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet    := MemData;
  SubDataSource.DataSet := SubMemData;

  ReportMaster         := TList.Create;
  ReportDetail         := TList.Create;
end;

procedure TMemberSaleBookShowForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
  Sender: TObject);
begin
//  inherited;
end;

procedure TMemberSaleBookShowForm.ButtonToolBarPrintButtonPopupMenuPreviewClick(
  Sender: TObject);
begin
//  inherited;
  Print(1);
end;

procedure TMemberSaleBookShowForm.ButtonToolBarPrintButtonPopupMenuPrintClick(
  Sender: TObject);
begin
//  inherited;
  Print(0);
end;

procedure TMemberSaleBookShowForm.ButtonToolBarPrintButtonPopupMenuTIFClick(
  Sender: TObject);
begin
//  inherited;
  Print(2);
end;

procedure TMemberSaleBookShowForm.ConditionToolBarMemberEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
   SearchMember(ConditionToolBarMemberEdit.Text);
end;

procedure TMemberSaleBookShowForm.ConditionToolBarMemberEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (Sender = ConditionToolBarMemberEdit) and (ConditionToolBarMemberNameLabel.Caption <> EmptyStr) and
          ((GetOnlyNumber(ConditionToolBarMemberEdit.EditingText) <> ConditionToolBarMemberEdit.EditingText) or (Length(ConditionToolBarMemberEdit.EditingText) <> 10)) then
  begin
    ConditionToolBarMemberNameLabel.Caption := EmptyStr;
  end;
end;

procedure TMemberSaleBookShowForm.ConditionToolBarMemberEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vCode, vName :String;
begin
  inherited;
  if DisplayValue <> EmptyStr then
    try
      OpenQuery('select   CD_MEMBER, '
               +'         NM_MEMBER, '
               +'         NO_CARD, '
               +'         GetPhoneNo(AES_Decrypt(TEL_MOBILE, 71483)) as NO_TEL '
               +'  from   MS_MEMBER '
               +' where   CD_HEAD  =:P0 '
               +'   and   CD_STORE =:P1 '
               +'   and   (CD_MEMBER = :P2 or NM_MEMBER like ConCat(''%'',:P2,''%'')) '
               +'   and   DS_STATUS = ''0'' '
               +' order by CD_STORE, CD_MEMBER',
                [HeadStoreCode,
                 Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                 DisplayValue]);
      if not Query.Eof then
      begin
        // 일단 첫번째 값을 받아 놓는다
        vCode           := Query.Fields[0].AsString;
        vName           := Query.Fields[1].AsString;
        ReportSubTitle := Format('회   원 : %s-%s ', [vCode,vName]);
        // 쿼리 다음 줄로 이동해 본다
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue              := vCode;
          ConditionToolBarMemberNameLabel.Caption := vName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
        begin
          DisplayValue := SearchMember(DisplayValue);
        end;
      end
      else
      begin
        ErrorText := Format('''%s'' 조건에 맞는 회원이 없습니다', [DisplayValue]);
        DisplayValue := EmptyStr;
        Error     := true;
      end;
    finally
      FinishQuery;
    end;
end;


function TMemberSaleBookShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vTotalAmt :Currency;
begin
  if ConditionToolBarMemberEdit.Text = EmptyStr then
  begin
    MsgBox('회원을 선택하십시오.');
    Result := true;
    Exit;
  end;

  Screen.Cursor := crSQLWait;

  // 임시테이블 지우기
  ExecQuery('delete from TEMP_SALE '
           +' where CD_HEAD     =:P0 '
           +'   and CD_STORE    =:P1 '
           +'   and MAC_ADDRESS =:P2; ',
           [HeadStoreCode,
            StoreCode,
            GetMacAddress],false);

  ExecQuery('insert into TEMP_SALE(CD_HEAD,CD_STORE, MAC_ADDRESS, YMD_SALE, CD_MENU, PR_SALE, SEQ, QTY_SALE, AMT_SALE) '
           +'select CD_HEAD, '
           +'       CD_STORE, '
           +'       :P5, '
           +'       YMD_SALE, '
           +'       CD_MENU, '
           +'       PR_SALE, '
           +'       @ROWNUM:=@ROWNUM+1, '
           +'       Sum(QTY_SALE) as QTY_SALE, '
           +'       Sum(AMT_SALE-DC_TOT) as AMT_SALE '
           +'  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')+', (SELECT @rownum:=0) as a'
           +' where CD_HEAD   =:P0 '
           +'   and CD_STORE  =:P1 '
           +'   and CD_MEMBER =:P2 '
           +'   and YMD_SALE between :P3 and :P4 '
           +'   and DS_SALE <> ''V'' '
           +' group by CD_HEAD, CD_STORE, YMD_SALE, CD_MENU, PR_SALE; ',
           [HeadStoreCode,
            StoreCode,
            ConditionToolBarMemberEdit.Text,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            GetMacAddress],true);


  OpenQuery('select 1 as SEQ, '
          +'       '''' as YMD_SALE, '
          +'       ''이월금액'' as SALE_DETAIL, '
          +'       0 as AMT_SALE, '
          +'       0 as AMT_TRUST, '
          +'       0 as AMT_COLLECT, '
          +'       0 as AMT_DC, '
          +'       Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_SALE,0) - Ifnull(AMT_PAYIN,0)) as AMT_BALANCE, '
          +'       '''' as LINK '
          +'from  (select  AMT_BASE, '
          +'               0 as AMT_SALE, '
          +'               0 as AMT_PAYIN '
          +'         from  SL_BOOKS_MONTH '
          +'        where  CD_HEAD  = :P0 '
          +'          and  CD_STORE = :P1 '
          +'          and  CD_CLOSE = ''20'' '
          +'          and  CD_CODE  =:P4 '
          +'          and  YM_CLOSE = Left(:P2,6) '
          +'       union all '
          +'       select  0 as AMT_BASE, '
          +'               Sum(AMT_TRUST) as AMT_SALE, '
          +'               0 as AMT_PAYIN '
          +'         from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
          +'        where  CD_HEAD   =:P0 '
          +'          and  CD_STORE  =:P1 '
          +'          and  CD_MEMBER =:P4 '
          +'          and  DS_SALE   <> ''V'' '
          +'          and  YMD_SALE between ConCat(Left(:P2,6),''01'') and :P5 '
          +'          and  AMT_TRUST <> 0 '
          +'       union all '
          +'       select  0 as AMT_BASE, '
          +'               0 as AMT_SALE, '
          +'               Sum(AMT_PAYIN+AMT_DC) as AMT_PAYIN '
          +'         from  SL_ACCT '
          +'        where  CD_HEAD   =:P0 '
          +'          and  CD_STORE  =:P1 '
          +'          and  YMD_OCCUR between ConCat(Left(:P2,6),''01'') and :P5 '
          +'          and  CD_MEMBER =:P4 '
          +'          ) as t '
          +'union all '
          +'select 3, '
          +'       StoD(a.YMD_SALE) as YMD_SALE, '
          +'       ConCat(d.NM_MENU,'' 외 '', Cast(c.CNT_MENU-1 as Char) ,''건''), '
          +'       a.AMT_SALE, '
          +'       a.AMT_TRUST, '
          +'       0, '
          +'       0, '
          +'       0, '
          +'       a.YMD_SALE as LINK '
          +'  from (select YMD_SALE, '
          +'               SUM(AMT_SALE) as AMT_SALE, '
          +'               SUM(AMT_TRUST) as AMT_TRUST '
          +'          from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
          +'         where CD_HEAD   =:P0 '
          +'           and CD_STORE  =:P1 '
          +'           and CD_MEMBER =:P4 '
          +'           and YMD_SALE between :P2 and :P3 '
          +'           and  DS_SALE   <> ''V'' '
          +'         group by YMD_SALE ) a left outer join '
          +'       (select YMD_SALE, '
          +'               Min(CD_MENU) as CD_MENU '
          +'          from TEMP_SALE '
          +'         where CD_HEAD  =:P0 '
          +'           and CD_STORE =:P1 '
          +'           and MAC_ADDRESS = :P6 '
          +'         group by YMD_SALE) b on b.YMD_SALE = a.YMD_SALE left outer join '
          +'       (select YMD_SALE, '
          +'               Count(CD_MENU) as CNT_MENU '
          +'          from TEMP_SALE '
          +'         where CD_HEAD  =:P0 '
          +'           and CD_STORE =:P1 '
          +'           and MAC_ADDRESS = :P6 '
          +'         group by YMD_SALE) c on c.YMD_SALE = a.YMD_SALE left outer join '
          +'       MS_MENU d on  d.CD_HEAD =:P0 and d.CD_STORE = :P1 and d.CD_MENU = b.CD_MENU '
          +'union all '
          +'select   2 as SEQ, '
          +'         StoD(YMD_OCCUR), '
          +'         ''결제금액'' as NM_MENU, '
          +'         0 as AMT_SALE, '
          +'         0 as AMT_TRUST, '
          +'         Sum(AMT_PAYIN) as AMT_COLLECT, '
          +'         Sum(AMT_DC) as AMT_DC, '
          +'         0 as AMT_BALANCE, '
          +'         '''' as LINK '
          +'  from   SL_ACCT '
          +' where   CD_HEAD   =:P0 '
          +'   and   CD_STORE  =:P1 '
          +'   and   CD_MEMBER =:P4 '
          +'and      YMD_OCCUR between :P2 and :P3 '
          +'group by YMD_OCCUR '
          +'order by 2,1 ',
          [HeadStoreCode,
           StoreCode,
           DtoS(ConditionToolBarFromDateEdit.Date),
           DtoS(ConditionToolBarToDateEdit.Date),
           ConditionToolBarMemberEdit.Text,
           DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
           GetMacAddress]);

  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;
  Result := GridDBTableView.DataController.RecordCount > 0;

  if not Result then Exit;

  OpenQuery('select d.YMD_SALE, '
           +'       d.CD_MENU, '
           +'       Max(g.NM_MENU) as NM_MENU, '
           +'       Max(g.NM_SPEC) as NM_SPEC, '
           +'       SUM(d.QTY_SALE) as QTY_SALE, '
           +'       d.PR_SALE, '
           +'       SUM(d.AMT_SALE) as AMT_SALE, '
           +'       d.YMD_SALE as LINK '
           +'  from TEMP_SALE d inner join '
           +'       MS_MENU   g on g.CD_HEAD  = d.CD_HEAD '
           +'                  and g.CD_STORE = d.CD_STORE '
           +'                  and g.CD_MENU  = d.CD_MENU '
           +' where d.CD_HEAD  =:P0 '
           +'   and d.CD_STORE =:P1 '
           +'   and d.MAC_ADDRESS = :P2 '
           +' group by d.YMD_SALE, d.CD_MENU, d.PR_SALE '
           +' order by 1,2 ',
           [HeadStoreCode,
            StoreCode,
            GetMacAddress]);
      GridSubDBTableView.DataController.DataSource := nil;
      DM.ReadQuery(Query, nil, SubMemData);
      GridSubDBTableView.DataController.DataSource := SubDataSource;


  try
    GridDBTableView.DataController.BeginUpdate;
    vTotalAmt := 0;
    for vIndex := 0 to GridDBTableView.DataController.RecordCount-1 do
    begin
      if GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleDetails.Index] = '이월금액' then
        vTotalAmt := GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index]
      else if GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleDetails.Index] = '결제금액' then
      begin
        GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index] := vTotalAmt - GridDBTableView.DataController.Values[vIndex, GridDBTableViewCollectAmt.Index] - GridDBTableView.DataController.Values[vIndex, GridDBTableViewDcAmt.Index];
        vTotalAmt := GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index];
      end
      else
      begin
        GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index] := vTotalAmt + GridDBTableView.DataController.Values[vIndex, GridDBTableViewTrustAmt.Index];
        vTotalAmt := GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index];
      end;
    end;
  finally
    GridDBTableView.DataController.EndUpdate;
  end;
end;

procedure TMemberSaleBookShowForm.FastReportDetailDataSetCheckEOF(
  Sender: TObject; var Eof: Boolean);
begin
  inherited;
  Eof := DetailNo >= ReportDetail.Count;
end;

procedure TMemberSaleBookShowForm.FastReportMasterDataSetGetValue(
  const VarName: string; var Value: Variant);
begin
  inherited;
  if VarName = 'YMD_SALE' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).YMD_SALE
  else if VarName = 'SALE_DETAIL' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).SALE_DETAIL
  else if VarName = 'AMT_SALE' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).AMT_SALE
  else if VarName = 'AMT_TRUST' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).AMT_TRUST
  else if VarName = 'AMT_COLLECT' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).AMT_COLLECT
  else if VarName = 'AMT_DC' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).AMT_DC
  else if VarName = 'AMT_BALANCE' then
    Value := TReportMaster(ReportMaster.Items[MasterNo]^).AMT_BALANCE;
end;

procedure TMemberSaleBookShowForm.FastReportDetailDataSetGetValue(
  const VarName: string; var Value: Variant);
begin
  inherited;
  if VarName = 'YMD_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).YMD_SALE
  else if VarName = 'CD_MENU' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).CD_MENU
  else if VarName = 'NM_MENU' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).NM_MENU
  else if VarName = 'NM_SPEC' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).NM_SPEC
  else if VarName = 'QTY_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).QTY_SALE
  else if VarName = 'PR_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).PR_SALE
  else if VarName = 'AMT_SALE' then
    Value := TReportDetail(ReportDetail.Items[DetailNo]^).AMT_SALE;

end;

procedure TMemberSaleBookShowForm.FastReportDetailDataSetFirst(
  Sender: TObject);
begin
  inherited;
  DetailNo := 0;
  while (not FastReportDetailDataSet.Eof) and ((TReportDetail(ReportDetail.Items[DetailNo]^).YMD_SALE <> TReportMaster(ReportMaster.Items[MasterNo]^).YMD_SALE) or (TReportMaster(ReportMaster.Items[MasterNo]^).SALE_DETAIL = '결제금액')) do
    Inc(DetailNo);
end;

procedure TMemberSaleBookShowForm.FastReportDetailDataSetNext(Sender: TObject);
begin
  inherited;
  Inc(DetailNo);
  while (not FastReportDetailDataSet.Eof) and ((TReportDetail(ReportDetail.Items[DetailNo]^).YMD_SALE <> TReportMaster(ReportMaster.Items[MasterNo]^).YMD_SALE) or (TReportMaster(ReportMaster.Items[MasterNo]^).SALE_DETAIL = '결제금액')) do
    Inc(DetailNo);
end;

procedure TMemberSaleBookShowForm.FastReportDetailDataSetPrior(
  Sender: TObject);
begin
  inherited;
  Dec(DetailNo);
  while (not FastReportDetailDataSet.Eof) and ((TReportDetail(ReportDetail.Items[DetailNo]^).YMD_SALE <> TReportMaster(ReportMaster.Items[MasterNo]^).YMD_SALE) or (TReportMaster(ReportMaster.Items[MasterNo]^).SALE_DETAIL = '결제금액')) do
    Dec(DetailNo);
end;

procedure TMemberSaleBookShowForm.FastReportMasterDataSetCheckEOF(
  Sender: TObject; var Eof: Boolean);
begin
  inherited;
  Eof := MasterNo >= ReportMaster.Count;
end;

procedure TMemberSaleBookShowForm.FastReportMasterDataSetFirst(
  Sender: TObject);
begin
  inherited;
  MasterNo := 0;
end;

procedure TMemberSaleBookShowForm.FastReportMasterDataSetNext(Sender: TObject);
begin
  inherited;
  Inc(MasterNo);
end;

procedure TMemberSaleBookShowForm.FastReportMasterDataSetPrior(
  Sender: TObject);
begin
  inherited;
  Dec(MasterNo);
end;


procedure TMemberSaleBookShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  ReportMaster.Free;
  ReportDetail.Free;
end;

procedure TMemberSaleBookShowForm.GetPrintData;
var vIndex :Integer;
  vReportMaster  : ^TReportMaster;
  vReportDetail  : ^TReportDetail;

begin
  ReportMaster.Clear;
  for vIndex := 0 to GridDBTableView.DataController.RecordCount-1 do
  begin
    New(vReportMaster);
    with vReportMaster^ do
    begin
      YMD_SALE    := GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleDate.Index];
      SALE_DETAIL := GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleDetails.Index];
      AMT_SALE    := GridDBTableView.DataController.Values[vIndex, GridDBTableViewSaleAmt.Index];
      AMT_TRUST   := GridDBTableView.DataController.Values[vIndex, GridDBTableViewTrustAmt.Index];
      AMT_COLLECT := GridDBTableView.DataController.Values[vIndex, GridDBTableViewCollectAmt.Index];
      AMT_DC      := GridDBTableView.DataController.Values[vIndex, GridDBTableViewDcAmt.Index];
      AMT_BALANCE := GridDBTableView.DataController.Values[vIndex, GridDBTableViewBalanceAmt.Index];
    end;
    ReportMaster.Add(vReportMaster);
  end;

  ReportDetail.Clear;
  try
    OpenQuery('select d.YMD_SALE, '
             +'       d.CD_MENU, '
             +'       Max(g.NM_MENU) as NM_MENU, '
             +'       Max(g.NM_SPEC) as NM_SPEC, '
             +'       SUM(d.QTY_SALE) as QTY_SALE, '
             +'       d.PR_SALE, '
             +'       SUM(d.AMT_SALE) as AMT_SALE, '
             +'       d.YMD_SALE as LINK '
             +'  from TEMP_SALE d inner join '
             +'       MS_MENU   g on g.CD_HEAD  = d.CD_HEAD '
             +'                  and g.CD_STORE = d.CD_STORE '
             +'                  and g.CD_MENU  = d.CD_MENU '
             +' where d.CD_HEAD  =:P0 '
             +'   and d.CD_STORE =:P1 '
             +'   and d.MAC_ADDRESS = :P2 '
             +' group by d.YMD_SALE, d.CD_MENU, d.PR_SALE '
             +' order by 1,2 ',
             [HeadStoreCode,
              StoreCode,
              GetMacAddress]);
    while not Query.Eof do
    begin
      New(vReportDetail);
      with vReportDetail^ do
      begin
        YMD_SALE    := Query.FieldByName('YMD_SALE').AsString;
        CD_MENU     := Query.FieldByName('CD_MENU').AsString;
        NM_MENU     := Query.FieldByName('NM_MENU').AsString;
        NM_SPEC     := Query.FieldByName('NM_SPEC').AsString;
        QTY_SALE    := Query.FieldByName('QTY_SALE').AsCurrency;
        PR_SALE     := Query.FieldByName('PR_SALE').AsCurrency;
        AMT_SALE    := Query.FieldByName('AMT_SALE').AsCurrency;
      end;
      ReportDetail.Add(vReportDetail);
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TMemberSaleBookShowForm.GridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridDBTableViewSaleDetails.Index] = '이월금액' then
    AStyle := StyleFontBlue
  else if ARecord.Values[GridDBTableViewSaleDetails.Index] = '결제금액' then
    AStyle := StyleFontRed;
end;

procedure TMemberSaleBookShowForm.Print(aPrint: Integer);
var
  vMemo : TfrxMemoView;
begin
  if GridDBTableView.DataController.RecordCount = 0 then
  begin
    MsgBox('출력 할 내용이 없습니다');
    Exit;
  end;
  GetPrintData;

  // 출력일시
  vMemo := TfrxMemoView(FastReport.FindObject('PrintTime'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := '출력일시 : '+FormatDateTime(fmtDateTime, Now);

  // 매장명
  vMemo := TfrxMemoView(FastReport.FindObject('StoreNameLabel'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Replace(Replace(StoreName,'[','('),']',')');


  // 매출처
  vMemo := TfrxMemoView(FastReport.FindObject('StoreNameMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := ReportSubTitle;

  // 공급처
  vMemo := TfrxMemoView(FastReport.FindObject('ProviderNameMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Format('공 급 자 : %s  【대표:%s (%s)】', [StoreName, BossName, BusinessNumber]);

  // 조회기간
  vMemo := TfrxMemoView(FastReport.FindObject('DateMemo'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := Format('조회기간 : %s ~ %s', [FormatMaskText('!9999-99-99;0;',DtoS(ConditionToolBarFromDateEdit.Date)), FormatMaskText('!9999-99-99;0;',DtoS(ConditionToolBarToDateEdit.Date))]);

  // 누계금액
  vMemo := TfrxMemoView(FastReport.FindObject('TotalAmt'));
  if Assigned(vMemo) then
    vMemo.Memo.Text := FormatFloat(',0', GridDBTableView.DataController.Values[GridDBTableView.DataController.RecordCount-1, GridDBTableViewBalanceAmt.Index]);


  case aPrint of
    0 :
    begin
      FastReport.PrepareReport();
      FastReport.Print;
    end;
    1 : FastReport.ShowReport;
    2 :
    begin
      FastReport.PrepareReport();
      if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\회원거래원장') then
        ForceDirectories(ExtractFilePath(Application.ExeName)+'\회원거래원장');
      frxTIFFExport.DefaultPath := ExtractFilePath(Application.ExeName)+'\회원거래원장';
      frxTIFFExport.FileName    := Format('%s(%s~%s)',[ConditionToolBarMemberNameLabel.Caption,
                                                       DtoS(ConditionToolBarFromDateEdit.Date),
                                                       DtoS(ConditionToolBarToDateEdit.Date)]);
      FastReport.Export(frxTIFFExport);
    end;
  end;
end;

function TMemberSaleBookShowForm.SearchMember(aMember: string): string;
begin
  Result := EmptyStr;
  with THelpForm.Create(Self) do
    try
      Caption                    := '회원 조회';
      GridTableViewCode.Caption  := '회원번호';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '회원이름';
      GridTableViewName1.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '카드번호';
      GridTableViewName2.Width   := 110;
      GridTableViewName2.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      GridTableViewName3.Caption := '휴대전화';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;

      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER, '
                   +'         NO_CARD, '
                   +'         GetPhoneNo(AES_Decrypt(TEL_MOBILE, 71483)) as NO_TEL '
                   +'  from   MS_MEMBER '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and  (CD_MEMBER = :P2 or NM_MEMBER like ConCat(''%'',:P2,''%'')) '
                   +'   and   DS_STATUS = 0 '
                   +'order by CD_MEMBER';
      IsMemberSearch := True;
      IsAutoSearch   := True;
      if ShowModal = mrOK then
      begin
        ConditionToolBarMemberEdit.Text           := Code;
        ConditionToolBarMemberNameLabel.Caption   := Names[0];
        ReportSubTitle := Format('회   원 : %s-%s ', [Code, Names[0]]);
        Result         := Code;
      end;
    finally
      Free;
    end;
end;

end.
