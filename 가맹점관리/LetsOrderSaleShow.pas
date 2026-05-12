unit LetsOrderSaleShow;

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
  cxCurrencyEdit, StrUtils, Uni, DBAccess, MemDS, cxGridBandedTableView;

type
  TLetsOrderSaleShowForm = class(TInheritShowForm)
    GridTableViewStoreCode: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewOrderAmt: TcxGridColumn;
    GridTableViewLetsOrderAmt: TcxGridColumn;
    GridTableViewDsTrd: TcxGridColumn;
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewPartnerName: TcxGridBandedColumn;
    GridBandedTableViewTotCnt: TcxGridBandedColumn;
    GridBandedTableViewTotAmt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderRate: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderTotAmt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderPayRate: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderPayAmt: TcxGridBandedColumn;
    GridBandedTableViewStoreName: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderOrderAmt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderOrderRate: TcxGridBandedColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridBandedTableViewLetsOrderTotCnt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderPayCnt: TcxGridBandedColumn;
    GridBandedTableViewLetsOrderOrderCnt: TcxGridBandedColumn;
    GridBandedTableViewJsonURL: TcxGridBandedColumn;
    GridBandedTableViewStoreCode: TcxGridBandedColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridBandedTableViewHeadStoreCode: TcxGridBandedColumn;
    GridBandedTableViewType: TcxGridBandedColumn;
    GridBandedTableViewSeq: TcxGridBandedColumn;
    GridBandedTableViewTableCount: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridBandedTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridBandedTableViewTypeStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  LetsOrderSaleShowForm: TLetsOrderSaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TLetsOrderSaleShowForm }
procedure TLetsOrderSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddMonthFirst;
  PrintMode   := pmPreviewExcel;
  if UserLevel='P' then
    GridBandedTableViewPartnerName.Caption := '자대리점';
end;

function TLetsOrderSaleShowForm.DoSearch: Boolean;
var vServerList :TStringList;
    vPartnerList:TStringList;
    vIndex, vIndex2, vSeq :Integer;
    vStore :String;
begin
  OpenQuery('select a.ID_SERVER, '
           +'       a.HTTPS_DOMAIN, '
           +'       case when b.SERVICE_TYPE = ''S'' then a.HTTPS_PORT else a.HTTPS_PORT_DIST end HTTPS_PORT, '
           +'       case when b.SERVICE_TYPE = ''S'' then '''' else b.NM_DATABASE end NM_DATABASE '
           +'  from SERVER_LIST   a inner join '
           +'       DATABASE_LIST b on b.ID_SERVER = a.ID_SERVER '
           +' where a.DS_SERVER  = ''O'' ',
           [],false,RestBaseURL);

  vServerList := TStringList.Create;
  while not Query.Eof do
  begin
    vServerList.Add(Format('%shttps://%s:%s/Orange/|%s',[Query.FieldByName('ID_SERVER').AsString,
                                                         Query.FieldByName('HTTPS_DOMAIN').AsString,
                                                         Query.FieldByName('HTTPS_PORT').AsString,
                                                         Query.FieldByName('NM_DATABASE').AsString]));
    Query.Next;
  end;
  Query.Close;


  vPartnerList := TStringList.Create;
  GridBandedTableView.BeginUpdate;
  GridBandedTableView.DataController.RecordCount := 0;
  vSeq := 1;
  for vIndex := 0 to vServerList.Count-1 do
  begin
    OpenQuery('select a.CD_CUSTOMER, '
             +Ifthen(UserLevel='P','d.NM_PARTNER ','c.NM_PARTNER ')
             +'  from CUSTOMER    as a inner join '
             +'       COMPANY     as b on b.CD_COMPANY = a.CD_COMPANY inner join '
             +'       PARTNER     as c on c.CD_PARTNER = a.CD_PARTNER left outer join '
             +'       PARTNER_SUB as d on d.CD_PARTNER = c.CD_PARTNER and d.CD_PARTNER_SUB = a.CD_PARTNER_SUB '
             +' where b.ID_SERVER =:P0 '
             +'   and a.DS_CUSTOMER = ''O'' '
             +'   and b.ID_SERVER not in (''9999'',''9998'') '
             +'   and a.CD_PARTNER <> ''0026'' '
             +'   and a.CD_CUSTOMER <> ''AA000022'' '
             +Ifthen(UserLevel='P',Format(' and c.CD_PARTNER = ''%s'' ',[PartnerCode]),'')
             +'   and Substring(a.OPTIONS,9,1) = ''1'' ',
             [LeftStr(vServerList.Strings[vIndex],4)],false,RestBaseURL);
    vStore := '';
    vPartnerList.Clear;
    while not Query.Eof do
    begin
      vStore := vStore + Format('''%s'',',[Query.Fields[0].AsString]);
      vPartnerList.Add(Format('%s%s',[Query.Fields[0].AsString, Query.Fields[1].AsString]));
      Query.Next;
    end;
    Query.Close;

    if vStore <> '' then
    begin
      vStore := Format('a.CD_STORE in (%s) ',[LeftStr(vStore, Length(vStore)-1)]);
      OpenQuery('select a.CD_HEAD, '
               +'       a.CD_STORE, '
               +'       Max(b.NM_STORE) as NM_STORE, '
               +'       case SubString(Max(b.OPTIONS),94,1) when ''0'' then ''TakeOut'' when ''1'' then ''TakeOut'' when ''2'' then ''선후불'' when ''3'' then ''주문전용'' when ''4'' then ''주문후결제'' end DS_LETSORDER, '
               +'       Max(c.CNT_TABLE) as CNT_TABLE, '
               +'       Sum(a.AMT_SALE) as AMT_TOT, '
               +'       Count(a.YMD_SALE) as CNT_TOT, '
               +'       Sum(case when (a.YN_LETSORDER = ''Y'') or (a.AMT_LETSORDER <> 0) then case when a.DS_SALE = ''S'' then 1 else -1 end else 0 end) as CNT_LETSORDER, '            //결제+주문건수
               +'       Sum(case when (a.YN_LETSORDER = ''Y'') or (a.AMT_LETSORDER <> 0) then a.AMT_SALE else 0 end) as AMT_LETSORDER, '   //결제+주문금액
               +'       Sum(case when a.AMT_LETSORDER <> 0 then case when a.DS_SALE = ''S'' then 1 else -1 end else 0 end) as CNT_PAY, '                                                //결제건수
               +'       Sum(a.AMT_LETSORDER) as AMT_PAY, '                                                                                //결제금액
               +'       Sum(case when (a.YN_LETSORDER = ''Y'') and (SubString(b.OPTIONS,94,1) in (''2'',''3'')) then case when a.DS_SALE = ''S'' then 1 else -1 end else 0 end) as CNT_ORDER, '                    //주문건수
               +'       Sum(case when (a.YN_LETSORDER = ''Y'') and (SubString(b.OPTIONS,94,1) in (''2'',''3'')) then a.AMT_SALE-a.AMT_LETSORDER else 0 end) as AMT_ORDER '
               +'  from '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
               +'       MS_STORE  as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE left outer join '
               +'       (select CD_HEAD, '
               +'               CD_STORE, '
               +'               Count(NO_TABLE) as CNT_TABLE '
               +'          from MS_TABLE '
               +'         where SEQ = 0 '
               +'         group by CD_HEAD, CD_STORE) as c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = a.CD_STORE '
               +' where '+vStore
               +'   and a.DS_SALE <> ''V'' '
               +'   and a.YMD_SALE between :P0 and :P1 '
               +' group by a.CD_STORE',
               [DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)],false,RightStr(vServerList.Strings[vIndex], Length(vServerList.Strings[vIndex])-4));

      while not Query.Eof do
      begin
        GridBandedTableView.DataController.AppendRecord;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewSeq.Index]               := IntToStr(vSeq);
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewHeadStoreCode.Index]     := Query.FieldByName('CD_HEAD').AsString;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewStoreCode.Index]         := Query.FieldByName('CD_STORE').AsString;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewStoreName.Index]         := Query.FieldByName('NM_STORE').AsString;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewType.Index]              := Query.FieldByName('DS_LETSORDER').AsString;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTableCount.Index]        := Query.FieldByName('CNT_TABLE').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTotCnt.Index]            := Query.FieldByName('CNT_TOT').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTotAmt.Index]            := Query.FieldByName('AMT_TOT').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderTotCnt.Index]   := Query.FieldByName('CNT_LETSORDER').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderTotAmt.Index]   := Query.FieldByName('AMT_LETSORDER').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderPayCnt.Index]   := Query.FieldByName('CNT_PAY').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderPayAmt.Index]   := Query.FieldByName('AMT_PAY').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderOrderCnt.Index] := Query.FieldByName('CNT_ORDER').AsCurrency;
        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderOrderAmt.Index] := Query.FieldByName('AMT_ORDER').AsCurrency;
        if Query.FieldByName('AMT_TOT').AsCurrency <> 0 then
        begin
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderRate.Index]      := Query.FieldByName('AMT_LETSORDER').AsCurrency / Query.FieldByName('AMT_TOT').AsCurrency * 100;
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderPayRate.Index]   := Query.FieldByName('AMT_PAY').AsCurrency       / Query.FieldByName('AMT_TOT').AsCurrency * 100;
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderOrderRate.Index] := Query.FieldByName('AMT_ORDER').AsCurrency     / Query.FieldByName('AMT_TOT').AsCurrency * 100;
        end
        else
        begin
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderRate.Index]      := 0;
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderPayRate.Index]   := 0;
          GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderOrderRate.Index] := 0;
        end;

        GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewJsonURL.Index]           := RightStr(vServerList.Strings[vIndex], Length(vServerList.Strings[vIndex])-4);

        for vIndex2 := 0 to vPartnerList.Count do
        begin
          if LeftStr(vPartnerList.Strings[vIndex2],8) = Query.FieldByName('CD_STORE').AsString then
          begin
            GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewPartnerName.Index] := RightStr(vPartnerList.Strings[vIndex2], Length(vPartnerList.Strings[vIndex2])-8);
            Break;
          end;
        end;
        Inc(vSeq);
        Query.Next;
      end;
      Query.Close;
    end;
  end;

  OpenQuery('select ''00000000'' as CD_HEAD, '
           +'       a.CD_STORE, '
           +'       Max(b.NM_STORE) as NM_STORE, '
           +'       ''온라인'' as DS_LETSORDER, '
           +'       0 as AMT_TOT, '
           +'       0 as CNT_TOT, '
           +'       0 as CNT_LETSORDER, '
           +'       0 as AMT_LETSORDER, '
           +'       Count(a.YMD_PG) as CNT_PAY, '
           +'       Sum(a.PG_AMT) as AMT_PAY, '
           +'       0 as CNT_ORDER, '
           +'       0 as AMT_ORDER '
           +'  from SL_PG as a inner join '
           +'       MS_STORE as b on b.CD_STORE = a.CD_STORE '
           +' where a.YMD_PG between :P0 and :P1 '
           +'   and a.DS_STATUS = ''A'' '
           +' group by a.CD_STORE ',
           [DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)],false, 'http://39.120.147.84:19009/WebErp/|AA0163_ERP');

  while not Query.Eof do
  begin
    GridBandedTableView.DataController.AppendRecord;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewSeq.Index]               := IntToStr(vSeq);
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewHeadStoreCode.Index]     := Query.FieldByName('CD_HEAD').AsString;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewStoreCode.Index]         := Query.FieldByName('CD_STORE').AsString;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewStoreName.Index]         := Query.FieldByName('NM_STORE').AsString;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewType.Index]              := Query.FieldByName('DS_LETSORDER').AsString;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTotCnt.Index]            := Query.FieldByName('CNT_TOT').AsCurrency;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewTotAmt.Index]            := Query.FieldByName('AMT_TOT').AsCurrency;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderTotCnt.Index]   := Query.FieldByName('CNT_LETSORDER').AsCurrency;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderTotAmt.Index]   := Query.FieldByName('AMT_LETSORDER').AsCurrency;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderPayCnt.Index]   := Query.FieldByName('CNT_PAY').AsCurrency;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderPayAmt.Index]   := Query.FieldByName('AMT_PAY').AsCurrency;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderOrderCnt.Index] := Query.FieldByName('CNT_ORDER').AsCurrency;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewLetsOrderOrderAmt.Index] := Query.FieldByName('AMT_ORDER').AsCurrency;

    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.RecordCount-1, GridBandedTableViewJsonURL.Index]           := '';
    Inc(vSeq);
    Query.Next;
  end;
  Query.Close;

  GridBandedTableView.EndUpdate;
  Result := GridBandedTableView.DataController.RecordCount > 0;
end;



procedure TLetsOrderSaleShowForm.GridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var vURL :String;
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
    vURL := GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewJsonURL.Index];
  if vURL = '' then
  begin
    GridTableView.DataController.RecordCount := 0;
    Exit;
  end;
  OpenQuery('select  StoDW(YMD_SALE) as YMD_SALE, '
          +'         NO_POS, '
          +'         NO_RCP, '
          +'         case DS_TRD when ''C'' then ''취소'' else ''승인'' end as DS_TRD, '
          +'         case TYPE_TRD when ''0'' then ''신용카드'' when ''S'' then ''신용카드'' when ''4'' then ''계좌이체'' end as TYPE_TRD, '
          +'         NO_CARD, '
          +'         case DS_TRD when ''C'' then -AMT_APPROVAL else AMT_APPROVAL         end as AMT_APPROVAL, '
          +'         AMT_CANCEL, '
          +'         NO_APPROVAL, '
          +'         case when Cast(GetOnlyNumber(TERM_HALBU) as int) < 2 then ''일시불'' else ConCat(TERM_HALBU,''개월'') end as TERM_HALBU, '
          +'         NM_CARDPL, '
          +'         ConCat(StoD(TRD_DATE),'' '',case when Length(TRD_TIME)=4 then ConCat(Left(TRD_TIME,2),'':'',Right(TRD_TIME,2)) else '''' end) as APPROVAL_DATE '
          +'  from   SL_CARD  '
          +' where   CD_HEAD  =:P0 '
          +'   and   CD_STORE =:P1 '
          +'   and   YMD_SALE between :P2 and :P3 '
          +'   and   DS_CARD = ''P'' '
          +'order by YMD_SALE, NO_POS, NO_RCP, SEQ',
           [GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewHeadStoreCode.Index],
            GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStoreCode.Index],
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)],false,vURL);
  DM.ReadQuery(Query, GridTableView, nil);
end;

procedure TLetsOrderSaleShowForm.GridBandedTableViewTypeStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridBandedTableViewType.Index] = '주문전용' then
    AStyle := StyleFontRed;
end;

procedure TLetsOrderSaleShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewDsTrd.Index] = '취소' then
    AStyle := StyleFontRed;
end;

end.
