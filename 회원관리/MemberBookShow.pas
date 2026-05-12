// 거래처 원장 (New완료)

//##### 조건에 거래처 선택하는거 수정
//##### 날짜 조건에 이번달, 지난달 등 조건 추가

unit MemberBookShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, StrUtils,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  cxCurrencyEdit, ExtCtrls, AdvToolBarStylers, StdCtrls, CheckLst, AdvPanel,
  cxRadioGroup, OleCtrls,SHDocVw,
  AdvOfficeTabSet, AdvSplitter, Math, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  DateUtils, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, 
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxCheckBox, MaskUtils, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSetStylers, AdvOfficePager,
  AdvOfficePagerStylers;

type
  TMemberBookShowForm = class(TInheritShowForm)
    ChartPanel: TPanel;
    BookGridLevel: TcxGridLevel;
    BookGridTableView: TcxGridTableView;
    ConditionTabSet: TAdvOfficeTabSet;
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewBuyAmt: TcxGridColumn;
    GridTableViewCreditAmt: TcxGridColumn;
    GridTableViewPayAmt: TcxGridColumn;
    GridTableViewRemainAmt: TcxGridColumn;
    BookGridTableViewDate: TcxGridColumn;
    BookGridTableViewType: TcxGridColumn;
    BookGridTableViewSaleAmt: TcxGridColumn;
    BookGridTableViewDCAmt: TcxGridColumn;
    BookGridTableViewCreditAmt: TcxGridColumn;
    BookGridTableViewPayAmt: TcxGridColumn;
    BookGridTableViewRemainAmt: TcxGridColumn;
    BookGridTableViewRemark: TcxGridColumn;
    CommentLabel: TLabel;
    Splitter: TAdvSplitter;
    GridTableViewBeforeAmt: TcxGridColumn;
    GoodsGridLevel: TcxGridLevel;
    GoodsGridTableView: TcxGridTableView;
    GoodsGridTableViewColumn1: TcxGridColumn;
    GoodsGridTableViewColumn2: TcxGridColumn;
    GoodsGridTableViewColumn4: TcxGridColumn;
    GoodsGridTableViewColumn6: TcxGridColumn;
    GoodsGridTableViewColumn7: TcxGridColumn;
    GoodsGridTableViewColumn8: TcxGridColumn;
    GoodsGridTableViewColumn9: TcxGridColumn;
    ConditionMemberCodeEdit: TcxButtonEdit;
    ConditionMemberNameLabel: TcxLabel;
    GridTableViewMemberType: TcxGridColumn;
    ConditionCheckBox: TcxCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure ConditionTabSetChange(Sender: TObject);
    procedure BookGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BookGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ConditionMemberCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ConditionMemberCodeEditPropertiesChange(Sender: TObject);
    procedure ConditionMemberCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);

  private
    FusionChart: TWebBrowser;
    isSelect :Boolean;
    MemberInfo :String;
    function  SearchMember(aMember: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberBookShowForm: TMemberBookShowForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberBookShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
  isSelect           := false;
end;

procedure TMemberBookShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure TMemberBookShowForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 조회조건에서 키보드를 누를 때
procedure TMemberBookShowForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 조건 탭을 바꿀 때
procedure TMemberBookShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

procedure TMemberBookShowForm.ConditionMemberCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  ConditionMemberCodeEdit.Clear;
  if SearchMember(ConditionMemberCodeEdit.Text) <> EmptyStr then DoSearch;
end;

procedure TMemberBookShowForm.ConditionMemberCodeEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (Length(ConditionMemberCodeEdit.Text) <> 10) or (GetOnlyNumber(ConditionMemberCodeEdit.Text) <> ConditionMemberCodeEdit.Text) then
    ConditionMemberNameLabel.Caption := EmptyStr;
end;

procedure TMemberBookShowForm.ConditionMemberCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue = EmptyStr then Exit;
  DisplayValue := SearchMember(DisplayValue);
  if Length(DisplayValue) = 10 then DoSearch;
end;

procedure TMemberBookShowForm.ConditionTabSetChange(Sender: TObject);
begin
  inherited;
  // 그리드의 레벨을 바꿔서 보여준다
  case ConditionTabSet.ActiveTabIndex of
    0 : // 회원 외상 내역
        begin
          Grid.ActiveLevel   := GridLevel;
          ChartPanel.Visible := true;
          Splitter.Visible   := true;
        end;
    1 : // 회원원장
        begin
          Grid.ActiveLevel   := BookGridLevel;
          Splitter.Visible   := false;
          ChartPanel.Visible := false;
        end;
    2 :
        begin
          Grid.ActiveLevel   := GoodsGridLevel;
          Splitter.Visible   := false;
          ChartPanel.Visible := false;
        end;
  end;

end;
//------------------------------------------------------------------------------
// 그리드에서 더블클릭했을때
procedure TMemberBookShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ButtonToolBarPrintButtonPopupMenuReceipt.Enabled := ALevel = BookGridLevel;

end;

procedure TMemberBookShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  // 연결된 거래처 원장을 보여준다
  isSelect := true;
//  ConditionMemberCodeEdit.Text     := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberCode.Index];
//  ConditionMemberNameLabel.Caption := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberName.Index];

  ConditionTabSet.ActiveTabIndex := 1;
  DoSearch;
end;

function TMemberBookShowForm.SearchMember(aMember: string): string;
begin
  Result := EmptyStr;
  // 회원을 조회한다
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

      SearchText := aMember;
      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER, '
                   +'         NO_CARD, '
                   +'         GetPhoneNo(AES_Decrypt(TEL_MOBILE, 71483)) as NO_TEL '
                   +'  from   MS_MEMBER '
                   +' where   CD_HEAD    = :P0 '
                   +'   and   CD_STORE   = :P1 '
                   +'   and   (CD_MEMBER = :P2 or NM_MEMBER like ConCat(''%'',:P2,''%'')) '
                   +Ifthen(GetStoreOption(5)='0','',Format('and CD_STORE_JOIN =''%s'' ',[StoreCode]))
                   +'   and    DS_STATUS = 0 '
                   +'order by CD_STORE, CD_MEMBER';
      IsAutoSearch   := true; // 폼 띄우면서 자동 검색
      IsMemberSearch := true;
      if ShowModal = mrOK then
      begin
        Result := Code;
        ConditionMemberCodeEdit.Text     := Code;
        ConditionMemberNameLabel.Caption := Names[0];
      end
    finally
      Free;
    end;
end;

//------------------------------------------------------------------------------
// 그리드 내용을 표시할 때
procedure TMemberBookShowForm.BookGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var vTemp :String;
begin
  inherited;
  vTemp := BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewType.Index];
  if (vTemp = '이월') or (vTemp = '결제') then Exit;

  isSelect := true;
//  ConditionToolBarFromDateEdit.Text := BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewDate.Index];
//  ConditionToolBarToDateEdit.Text   := BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewDate.Index];
  ConditionTabSet.ActiveTabIndex    := 2;
  DoSearch;
end;

procedure TMemberBookShowForm.BookGridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if BookGridTableView.DataController.RecordCount = 0 then Exit;

  if (AItem <> nil) and (AItem.Index = BookGridTableViewType.Index) then
    if ARecord.Values[BookGridTableViewType.Index] = '이월' then
      AStyle := StyleFontBlue
    else if ARecord.Values[BookGridTableViewType.Index] = '결제' then
      AStyle := StyleFontRed
end;

procedure TMemberBookShowForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TMemberBookShowForm.DoSearch:Boolean;
var
  vIndex    : Integer;
  vChartXml : string;
  vRemainAmt: Currency;
begin
inherited;
  Result := false;
  CommentLabel.Visible := ConditionToolBarToDateEdit.CurrentDate < Date;

  // 그리드의 레벨을 바꿔서 보여준다
  case ConditionTabSet.ActiveTabIndex of
    0 : // 회원 미수 내역
        begin
          OpenQuery('select   a.CD_MEMBER, '
                   +'         Max(b.NM_MEMBER)     as NM_MEMBER, '
                   +'         Max(c.NM_CODE1)     as DS_MEMBER, '
                   +'         Sum(AMT_BEFORE)     as AMT_BEFORE, '
                   +'         Sum(a.AMT_SALE)       as AMT_SALE, '
                   +'         Sum(AMT_TRUST)      as AMT_TRUST, '
                   +'         Sum(AMT_RECEIVE)        as AMT_RECEIVE, '
                   +'         Sum(AMT_BEFORE + AMT_TRUST - AMT_RECEIVE ) as AMT_REMAIN '
                   +'  from  (select CD_MEMBER, '
                   +'                Sum(Ifnull(AMT_BASE,0) + Ifnull(AMT_TRUST,0) - Ifnull(AMT_RECEIVE,0)) as AMT_BEFORE, '
                   +'                0 as AMT_SALE, '
                   +'                0 as AMT_TRUST, '
                   +'                0 as AMT_RECEIVE '
                   +'         from '
                   +'              (select CD_CODE as CD_MEMBER, '
                   +'                      AMT_BASE, '
                   +'                      0 as AMT_SALE, '
                   +'                      0 as AMT_TRUST, '
                   +'                      0 as AMT_RECEIVE '
                   +'                from  SL_BOOKS_MONTH '
                   +'               where  CD_HEAD  =:P0 '
                   +'                 and  CD_STORE =:P1 '
                   +'                 and  YM_CLOSE = Left(:P2,6) '
                   +'                 and  CD_CLOSE = ''20'' '
                   +'                 and  CD_CODE <> '''' '
                   +'               union all '
                   +'               select CD_MEMBER, '
                   +'                      0, '
                   +'                      0, '
                   //01일까지 조회이면 월 기초 미지급만 사용
                   +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0, ',' sum(AMT_TRUST), ')
                   +'                      0 '
                   +'               from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,IncDay(ConditionToolBarFromDateEdit.Date,-1), '')
                   +'               where  CD_HEAD  =:P0 '
                   +'                 and  CD_STORE =:P1 '
                   +'                 and  YMD_SALE between ConCat(Left(:P2,6),''01'') and :P4 '
                   +'                 and  AMT_TRUST <> 0 '
                   +'                 and  DS_SALE <> ''V'' '
                   +'               group by CD_MEMBER '
                   +'               union all '
                   +'               select CD_MEMBER, '
                   +'                      0, '
                   +'                      0, '
                   +'                      0, '
                   //01일까지 조회이면 월 기초 미지급만 사용
                   +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0 ',' Sum(AMT_PAYIN + AMT_DC) ')
                   +'               from   SL_ACCT '
                   +'               where  CD_HEAD  =:P0 '
                   +'                 and  CD_STORE =:P1 '
                   +'                 and  YMD_OCCUR between ConCat(Left(:P2,6),''01'') and :P4 '
                   +'                 and  CD_MEMBER <> '''' '
                   +'               group by CD_MEMBER '
                   +'             ) t '
                   +'         group by CD_MEMBER '
                   +'         union all '
                   +'         select   CD_MEMBER, '                                      // 매출 기간내금액
                   +'                  0                   as AMT_BEFORE, '
                   +'                  Sum(AMT_SALE)       as AMT_SALE, '
                   +'                  Sum(AMT_TRUST)      as AMT_TRUST, '
                   +'                  0                   as AMT_RECEIVE '
                   +'          from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
                   +'         where    CD_HEAD  =:P0 '
                   +'           and    CD_STORE =:P1 '
                   +'           and    YMD_SALE  between :P2 and :P3 '
                   +'           and    DS_SALE <> ''V'' '
                   +'         group by CD_STORE, CD_MEMBER '
                   +'         union all '
                   +'         select   CD_MEMBER, '                                      // 지급 기간내금액
                   +'                  0            as AMT_BASE, '
                   +'                  0            as AMT_SALE, '
                   +'                  0            as AMT_TRUST, '
                   +'                  Sum(AMT_PAYIN+AMT_DC) as AMT_RECEIVE '
                   +'         from     SL_ACCT '
                   +'         where    CD_HEAD  =:P0 '
                   +'           and    CD_STORE =:P1 '
                   +'           and    YMD_OCCUR between :P2 and :P3 '
                   +'         group by CD_MEMBER) as a inner join '
                   +'         MS_MEMBER as b on b.CD_HEAD = :P0 and b.CD_STORE = :P6 and b.CD_MEMBER = a.CD_MEMBER '+Ifthen(GetStoreOption(5)='1', 'and b.CD_STORE_JOIN = :P1','')+' left outer join '
                   +'         MS_CODE   as c on c.CD_HEAD = :P0 and c.CD_STORE = :P6 and c.CD_CODE   = b.DS_MEMBER and c.CD_KIND = ''05'' '
                   +'where (b.CD_MEMBER =:P5 or b.NM_MEMBER like ConCat(''%'',:P5,''%'')) '
                   +'group by a.CD_MEMBER '
                   + ifthen(ConditionCheckBox.Checked, 'having Ifnull(Sum(AMT_BEFORE + AMT_TRUST - AMT_RECEIVE ),0) <> 0 ',''),
                    [HeadStoreCode,
                     StoreCode,
                     DtoS(ConditionToolBarFromDateEdit.Date),
                     DtoS(ConditionToolBarToDateEdit.Date),
                     DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)),
                     ConditionMemberCodeEdit.Text,
                     Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
          DM.ReadQuery(Query, GridTableView);
          Result := GridTableView.DataController.RecordCount > 0;


          // 미지급금 차트 표시
          vChartXml := '<chart caption='''+ConditionTabSet.AdvOfficeTabs.Items[0].Caption+''' formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
                      +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
                      +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

          for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
          begin
            if GridTableView.DataController.Values[vIndex,GridTableViewRemainAmt.Index] = 0 then Continue;

            if vIndex > 30 then
              break;
            vChartXml := vChartXml + '<set label="'+GridTableView.DataController.Values[vIndex, GridTableViewMemberName.Index]+'" value="'+FloatToStr(GridTableView.DataController.Values[vIndex,GridTableViewRemainAmt.Index])+'" />';
          end;
          vChartXml   := vChartXml + '</chart>';
          ShowChart(FusionChart, 'FusionChart', 'column3d', vChartXml);
        end;
    1 : // 거래처 원장
        begin
          if not isSelect and (ConditionMemberCodeEdit.Text = EmptyStr) then
          begin
            MsgBox('조회 할 회원을 선택하십시오.');
            result := true;
            Exit;
          end;

          if isSelect then
            ReportSubTitle := Format('회원 : %s-%s',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberCode.Index],
                                                     GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberName.Index]])
          else
            ReportSubTitle := Format('회원 : %s-%s',[ConditionMemberCodeEdit.Text,
                                                     ConditionMemberNameLabel.Caption]);

          MemberInfo := ReportSubTitle;

          OpenQuery('select   ''''     as YMD_SALE, '
                   +'         ''0''    as SEQ, '
                   +'         ''이월'' as DS_TYPE, '
                   +'         0        as AMT_SALE, '
                   +'         0        as AMT_TRUST, '
                   +'         0        as AMT_DC, '
                   +'         0        as AMT_RECEIVE, '
                   +'         Sum(Ifnull(AMT_BASE,0)+Ifnull(AMT_TRUST,0)-Ifnull(AMT_RECEIVE,0))  as AMT_REMAIN, '
                   +'         ''''                as REMARK, '
                   +'         Now() '
                   +'  from  (select Ifnull(AMT_BASE,0) as AMT_BASE, '
                   +'                0 as AMT_SALE, '
                   +'                0 as AMT_TRUST, '
                   +'                0 as AMT_RECEIVE '
                   +'          from  SL_BOOKS_MONTH  '
                   +'         where  CD_HEAD  =:P0 '
                   +'           and  CD_STORE =:P1 '
                   +'           and  YM_CLOSE = Left(:P3,6) '
                   +'           and  CD_CLOSE = ''20'' '
                   +'           and  CD_CODE  = :P2 '
                   +'         union all '
                   +'         select 0, '
                   +'                SUM(AMT_SALE), '
                   //01일까지 조회이면 월 기초 미지급만 사용
                   +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0, ',' sum(Ifnull(AMT_TRUST,0)), ')
                   +'                0 '
                   +'          from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,IncDay(ConditionToolBarFromDateEdit.Date,-1), '')
                   +'         where  CD_HEAD  =:P0 '
                   +'           and  CD_STORE =:P1 '
                   +'           and  YMD_SALE between ConCat(Left(:P3,6),''01'') and :P5 '
                   +'           and  CD_MEMBER = :P2 '
                   +'           and  DS_SALE <> ''V'' '
                   +'           and  AMT_TRUST <> 0 '
                   +'         union all '
                   +'         select 0, '
                   +'                0, '
                   +'                0, '
                   //01일까지 조회이면 월 기초 미지급만 사용
                   +Ifthen(RightStr(DtoS(ConditionToolBarFromDateEdit.Date),2) = '01', '0 ',' Sum(Ifnull(AMT_PAYIN,0) + Ifnull(AMT_DC,0)) ')
                   +'          from  SL_ACCT '
                   +'         where  CD_HEAD  =:P0 '
                   +'           and  CD_STORE =:P1 '
                   +'           and  YMD_OCCUR between ConCat(Left(:P3,6),''01'') and :P5 '
                   +'           and  CD_MEMBER =:P2 '
                   +'  ) t '
                   +'union all '
                   +'select   StoDW(YMD_SALE) as YMD_SALE, '
                   +'         ''1'' as SEQ, '
                   +'         case DS_SALE when ''S'' then ''판매'' when ''B'' then ''반품'' end as DS_TYPE, '
                   +'         AMT_SALE, '
                   +'         AMT_TRUST, '
                   +'         0 as AMT_DC, '
                   +'         0 as AMT_RECEIVE, '
                   +'         0 as AMT_REMAIN, '
                   +'         ConCat(NO_POS,''-'',NO_RCP) as REMARK, '
                   +'         DT_SALE '
                   +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, '')
                   +' where   CD_HEAD   = :P0 '
                   +'   and   CD_STORE  = :P1 '
                   +'   and   CD_MEMBER = :P2 '
                   +'   and   YMD_SALE between :P3 and :P4 '
                   +'   and   DS_SALE <> ''V'' '
                   +'union all '
                   +'select   StoDW(YMD_OCCUR) as YMD_SALE, '
                   +'         ''1''    as SEQ, '
                   +'         ''결제'' as DS_TYPE, '
                   +'         0        as AMT_SALE, '
                   +'         0        as AMT_TRUST, '
                   +'         AMT_DC, '
                   +'         AMT_PAYIN  as AMT_RECEIVE, '
                   +'         0        as AMT_REMAIN, '
                   +'         REMARK, '
                   +'         DT_INSERT '
                   +'  from   SL_ACCT '
                   +' where   CD_HEAD   = :P0 '
                   +'   and   CD_STORE  = :P1 '
                   +'   and   CD_MEMBER = :P2 '
                   +'   and   YMD_OCCUR between :P3 and :P4 '
                   +'order by 2,1,10 ',
                  [HeadStoreCode,
                   StoreCode,
                   Ifthen(isSelect, NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMemberCode.Index],''), ConditionMemberCodeEdit.Text),
                   DtoS(ConditionToolBarFromDateEdit.Date),
                   DtoS(ConditionToolBarToDateEdit.Date),
                   DtoS(IncDay(ConditionToolBarFromDateEdit.Date,-1)) ]);
          Result :=DM.ReadQuery(Query, BookGridTableView);
          isSelect := false;
          // 미지급잔액을 계산해서 그리드에 넣어준다
          vRemainAmt := 0;
          for vIndex := 0 to BookGridTableView.DataController.RecordCount-1 do
          begin
            vRemainAmt := vRemainAmt
                        + Ifthen(vIndex=0,Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewRemainAmt.Index],0.0),0)
                        + Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewCreditAmt.Index],        0)
                        - Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewDcAmt.Index],        0)
                        - Nvl(BookGridTableView.DataController.Values[vIndex, BookGridTableViewPayAmt.Index],        0);
            BookGridTableView.DataController.Values[vIndex, BookGridTableViewRemainAmt.Index] := vRemainAmt;
          end;
          // 미지급금액 푸터 표시 (그리드 내용 Sum 아니고 미지급계산한 마지막 금액 넣으면 됨)
          if BookGridTableView.DataController.RecordCount > 0 then
            BookGridTableView.DataController.Summary.FooterSummaryValues[7] := FormatFloat(fmtComma, vRemainAmt)
          else
            BookGridTableView.DataController.Summary.FooterSummaryValues[7] := 0;
        end;
    2 :
        begin
          if not isSelect and (ConditionMemberCodeEdit.Text = EmptyStr) then
          begin
            MsgBox('조회 할 회원을 선택하십시오.');
            result := true;
            Exit;
          end;

          ReportSubTitle := EmptyStr;
          if isSelect then
            OpenQuery('select d.CD_MENU, '
                     +'       Max(m.NM_MENU) as NM_MENU, '
                     +'       Sum(d.QTY_SALE) as QTY_SALE, '
                     +'       Sum(d.AMT_SALE) as AMT_SALE, '
                     +'       Sum(d.AMT_SALE-d.DC_TOT-d.AMT_VAT) as AMT_NET, '
                     +'       Sum(d.AMT_VAT) as AMT_VAT, '
                     +'       Sum(d.DC_TOT) as DC_TOT '
                     +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
                     +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
                     +'                   on d.CD_HEAD  = h.CD_HEAD '
                     +'                  and d.CD_STORE = h.CD_STORE '
                     +'                  and d.YMD_SALE = h.YMD_SALE '
                     +'                  and d.NO_POS   = h.NO_POS '
                     +'                  and d.NO_RCP   = h.NO_RCP '
                     +'                  and h.DS_SALE <> ''V'' inner join '
                     +'       MS_MENU   m on d.CD_HEAD  = m.CD_HEAD '
                     +'                  and d.CD_STORE = m.CD_STORE '
                     +'                  and d.CD_MENU  = m.CD_MENU '
                     +' where d.CD_HEAD  =:P0 '
                     +'   and d.CD_STORE =:P1 '
                     +'   and d.YMD_SALE =:P2 '
                     +'   and d.NO_POS   =:P3 '
                     +'   and d.NO_RCP   =:P4 '
                     +' group by d.CD_MENU '
                     +' order by d.CD_MENU ',
                    [HeadStoreCode,
                     StoreCode,
                     GetOnlyNumber(NVL(BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewDate.Index],'')),
                     LeftStr(BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewRemark.Index],2),
                     RightStr(BookGridTableView.DataController.Values[BookGridTableView.DataController.GetFocusedRecordIndex, BookGridTableViewRemark.Index],4)])
          else
            OpenQuery('select d.CD_MENU, '
                     +'       Max(m.NM_MENU) as NM_MENU, '
                     +'       Sum(d.QTY_SALE) as QTY_SALE, '
                     +'       Sum(d.AMT_SALE) as AMT_SALE, '
                     +'       Sum(d.AMT_SALE-d.DC_TOT-d.AMT_VAT) as AMT_NET, '
                     +'       Sum(d.AMT_VAT) as AMT_VAT, '
                     +'       Sum(d.DC_TOT) as DC_TOT '
                     +'  from  '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'd inner join')
                     +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'h')
                     +'                   on d.CD_HEAD  = h.CD_HEAD '
                     +'                  and d.CD_STORE = h.CD_STORE '
                     +'                  and d.YMD_SALE = h.YMD_SALE '
                     +'                  and d.NO_POS   = h.NO_POS '
                     +'                  and d.NO_RCP   = h.NO_RCP '
                     +'                  and h.CD_MEMBER = :P4 '
                     +'                  and h.DS_SALE <> ''V'' inner join '
                     +'       MS_MENU   m on d.CD_STORE = m.CD_STORE and d.CD_MENU = m.CD_MENU '
                     +' where d.CD_HEAD  =:P0 '
                     +'   and d.CD_STORE =:P1 '
                     +'   and d.YMD_SALE between :P2 and :P3 '
                     +' group by d.CD_MENU '
                     +' order by d.CD_MENU ',
                    [HeadStoreCode,
                     StoreCode,
                     DtoS(ConditionToolBarFromDateEdit.Date),
                     DtoS(ConditionToolBarToDateEdit.Date),
                     ConditionMemberCodeEdit.Text]);

          Result := DM.ReadQuery(Query, GoodsGridTableView);
          isSelect := false;
        end;
  end;

end;

procedure TMemberBookShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  if ConditionTabSet.ActiveTabIndex = 0 then
  begin
    MsgBox('외상원장에서 출력이 가능합니다');
    Exit;
  end;

  if BookGridTableView.DataController.RecordCount = 0 then
  begin
    MsgBox('출력 할 자료가 없습니다');
    Exit;
  end;
  vPrintData := rptSizeBoth + rptAlignCenter + '회원외상원장'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  MemberInfo+ #13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'    일 자      구분       금액        잔액'+rptpStr+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with BookGridTableView do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    vPrintData := vPrintData +rptpStr + LPad(DataController.Values[vIndex, BookGridTableViewDate.Index],14,' ') + ' ' +
                                        Ifthen(DataController.Values[vIndex, BookGridTableViewType.Index]='이월금액', '이월', DataController.Values[vIndex, BookGridTableViewType.Index]);
    if (DataController.Values[vIndex, BookGridTableViewType.Index] = '판매') or (DataController.Values[vIndex, BookGridTableViewType.Index] = '반품') then
    begin
      vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, BookGridTableViewCreditAmt.Index]), 11, ' ');
      vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, BookGridTableViewRemainAmt.Index]), 12, ' ') +#13;
    end
    else if DataController.Values[vIndex, BookGridTableViewType.Index] = '결제' then
    begin
      vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, BookGridTableViewPayAmt.Index]), 11, ' ');
      vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, BookGridTableViewRemainAmt.Index]), 12, ' ') +#13;
    end
    else
      vPrintData := vPrintData + LPad(FormatFloat('#,0', DataController.Values[vIndex, BookGridTableViewRemainAmt.Index]), 23, ' ') +#13;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

end.
