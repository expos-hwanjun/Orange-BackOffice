 /// <summary>
    /// 문자 발송 전화 목록
    /// </summary>
    /// <param name="data"><para>문자 발송 전화번호 문자열</para>
    ///                    <para>  전화번호1 #9 발송상태1 | 전화번호2 #9 발송상태2 | ... (레코드구분자 |, 필드구분자 #9)</para>
    ///                    <para></para>
    ///                    <para>[발송상태 설명]</para>
    ///                    <para>  0:발송 대기 중</para>
    ///                    <para>  1:발송 성공</para>
    ///                    <para>  2:영구 오류(결번, 번호이동, 해지 등)</para>
    ///                    <para>  3:일시 오류(전화 꺼짐, 통화권 이탈, 일시 중지, 외국여행(로밍 미신청) 등)</para>
    ///                    <para>  4:미지원 단말기(LMS/MMS 수신 안 되는 단말기, Callback URL 지원 안 하는 단말기, 기타 구형 단말기 등)</para>
    ///                    <para>  5:고객수신거부/스팸처리</para>
    ///                    <para>  6:전화번호 포맷 오류(2번과 차이는 2번은 정상 전화번호인데 해지된 것이고 6번은 비정상 전화번호임)</para>
    ///                    <para>  7:익스트림포스 문제(충전 잔여 건수 부족 등)</para>
    ///                    <para>  8:이통사 장애</para>
    ///                    <para>  9:기타(타임아웃, 데이콤 장애 등)</para>
    ///                    <para>  (2, 6번은 전화번호를 지우거나 최신 정보로 업데이트를 해야 함)</para>
    ///                    <para>  (3, 4, 5번은 고치든 말든 알아서 하고)</para></param>
    /// <param name="output">성공이지만 아직 받을 자료가 남았을 때 "", 성공이고 모든 자료 조회가 끝났을 때 "총 조회건수", 실패 시 "에러메시지"</param>
    /// <param name="firstRow">시작 레코드 번호(처음에는 0을 보내고 응답값이 -1이면 끝, 양수이면 이 함수를 다시 호출하여 리턴된 firstRow값을 다시 보낸다)</param>
    /// <param name="custID">매장번호(AA0001) 또는 회사번호(000001)</param>
    /// <param name="sendDate">발송날짜(yyyymmdd)</param>
    /// <returns>성공 여부</returns>
//    [WebMethod]
//    public bool smsSendPhoneList(out string data, out string output, ref int firstRow, string custID, string sendDate)
unit MemberSMSSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, SHDocVw, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, AdvSplitter;

type
  TMemberSMSSaleShowForm = class(TInheritShowForm)
    GridTableViewSendDate: TcxGridColumn;
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewVisitCount: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewOccurPoint: TcxGridColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ChartPanel: TPanel;
    GridTableViewTelNo: TcxGridColumn;
    PosSplitter: TAdvSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChartPanelResize(Sender: TObject);
  private
    FusionChart: TWebBrowser;
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberSMSSaleShowForm: TMemberSMSSaleShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TAnalysisSMSSaleShowForm }
procedure TMemberSMSSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/회원관리/문자%20발송%20효율조회/문자%20발송%20효율조회.htm';
  PrintMode   := pmPreview;
  DefaultDate := ddToday;
  // 차트를 만든다
  FusionChart       := TWebBrowser.Create(Self);
  TWinControl(FusionChart).Parent := ChartPanel;
  FusionChart.Align := alClient;
end;

procedure TMemberSMSSaleShowForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FusionChart.Free;
end;

procedure TMemberSMSSaleShowForm.ButtonToolBarDeleteButtonClick(
  Sender: TObject);
var vIndex :Integer;
    vCode :String;
begin
  inherited;
  if GridTableView.Controller.SelectedRecordCount = 0 then
  begin
    MsgBox('수신거부할 회원을 선택하세요');
    Exit;
  end;

  for vIndex := 0 to GridTableView.Controller.SelectedRecordCount -1 do
    vCode := vCode + Format('''%s'',',[String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewMemberCode.Index])]);

  try
    ExecQuery('update MS_MEMBER '
             +'   set YN_NEWS      = ''N'', '
             +'       YMD_REJECT   = Date_Format(Now(), ''%Y%m%d''), '
             +'       DT_CHANGE    = Now(), '
             +'       CD_SAWON_CHG =:P2 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE  =:P1 '
             +'   and CD_MEMBER in ('+LeftStr(vCode, Length(vCode)-1)+');',
             [HeadStoreCode,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
              UserCode]);
    ShowMsg(msgSaved);
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TMemberSMSSaleShowForm.ChartPanelResize(Sender: TObject);
begin
  inherited;
  if Assigned(FusionChart) and (FusionChart.Hint <> '') then
    ShowChart(FusionChart, 'FusionChart', 'column3d', FusionChart.Hint);
end;

function TMemberSMSSaleShowForm.DoSearch: Boolean;
var
 vChartXml,
 vChart01,
 vChart02,
 vChart03,
 vChart04 : String;
begin
  OpenQuery('select StoD(a.YMD_SEND) as YMD_SEND, '
           +'       b.CD_MEMBER, '
           +'       b.NM_MEMBER, '
           +'       GetPhoneNo(AES_Decrypt(a.TEL_MOBILE, 71483)) as TEL_MOBILE, '
           +'       case a.STATUS when ''0'' then  ''발송 대기 중'''
           +'                     when ''1'' then  ''발송 성공'' '
           +'                     when ''2'' then  ''결번, 번호이동, 해지 등'' '
           +'                     when ''3'' then  ''일시 오류(전화 꺼짐, 통화권 이탈, 일시 중지, 외국여행(로밍 미신청) 등'' '
           +'                     when ''4'' then  ''미지원 단말기(LMS/MMS 수신 안 되는 단말기, Callback URL 지원 안 하는 단말기, 기타 구형 단말기 등'' '
           +'                     when ''5'' then  ''고객수신거부/스팸처리'' '
           +'                     when ''6'' then  ''전화번호 포맷 오류(2번과 차이는 2번은 정상 전화번호인데 해지된 것이고 6번은 비정상 전화번호임)'' '
           +'                     when ''7'' then  ''충전 잔여 건수 부족'' '
           +'                     when ''8'' then  ''이통사 장애'' '
           +'                     when ''9'' then  ''기타(타임아웃, 데이콤 장애 등)'' '
           +'       end as STATUS, '
           +'       c.CNT_VISIT, '
           +'       c.AMT_SALE, '
           +'       c.PNT_OCCUR '
           +'  from SL_SMS a inner join '
           +'       MS_MEMBER b on a.CD_HEAD = b.CD_HEAD and b.CD_STORE =:P4 and a.TEL_MOBILE = GetPhoneNo(AES_Decrypt(b.TEL_MOBILE, 71483)) left outer join '
           +'       (select CD_MEMBER, '
           +'               Count(YMD_SALE) as CNT_VISIT, '
           +'               Sum(AMT_SALE)   as AMT_SALE, '
           +'               Sum(PNT_OCCUR)  as PNT_OCCUR '
           +'          from SL_SALE_H '
           +'         where CD_HEAD  =:P0 '
           +'           and CD_STORE =:P1 '
           +'           and YMD_SALE Between :P2 and :P3 '
           +'           and Length(CD_MEMBER) = 10 '
           +'           and DS_SALE <> ''V'' '
           +'         group by CD_MEMBER) c on b.CD_MEMBER= c.CD_MEMBER '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and a.YMD_SEND Between :P2 and :P3 '
           +' order by b.CD_MEMBER ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
  Result := DM.ReadQuery(Query, GridTableView);

  // 챠트로 표시
  vChartXml := '<chart caption=''문자발송 대비 매출효과'' subCaption="(단위:원)" xAxisName="일   자" PYAxisName="판매금액" SYAxisName="문자발송(K천건)" '
              +'formatNumberScale=''0'' decimalPrecision=''0'' palettecolors=''FF0000, 008ED6, F6BD0F, 588526, 008E8E, 8BBA00, A186BE, AFD8F8, FF8E46, D64646, 8E468E, B3AA00'' '
              +'basefont=''맑은 고딕'' captionfontsize=''14'' subcaptionfontsize=''14'' subcaptionfontbold=''0'' placevaluesinside=''1'' rotatevalues=''1'' '
              +'showshadow=''0'' divlinecolor=''#999999'' divlinedashed=''1'' divlinethickness=''1'' divlinedashlen=''1'' divlinegaplen=''1'' canvasbgcolor=''#ffffff''>';

  //vChartXml :=' <chart  rotateNames="0" numberPrefix="" baseFont="굴림" baseFontSize="11" outCnvBaseFont="굴림" outCnvBaseFontSize="12" palette="2" '
  //           +'caption="문자발송 대비 매출효과" subCaption="(단위:원)" xAxisName="일   자" showValues="0" divLineDecimalPrecision="1" limitsDecimalPrecision="1" PYAxisName="판매금액" SYAxisName="문자발송(K천건)" numberPrefix="$" formatNumberScale="0">';
	vChart01 := '  <categories>  ';
	vChart02 := '  <dataset seriesName="매출금액" renderAs="Line" parentYAxis="P">  ';
	vChart03 := '  <dataset seriesName="회원매출" renderAs="Area" parentYAxis="P">  ';
	vChart04 := '  <dataset seriesName="문자발송" renderAs="Bar" parentYAxis="S">  ';

  try
    OpenQuery('select a.YMD_SALE, '
             +'       a.AMT_SALE, '
             +'       b.AMT_SALE as AMT_MEMBER, '
             +'       Ifnull(c.CNT_SEND,0) as CNT_SEND '
             +'  from SL_SALE_H_SUM a left outer join '
             +'      (select YMD_SALE, '
             +'              SUM(AMT_SALE) as AMT_SALE '
             +'         from SL_SALE_H '
             +'        where CD_HEAD  =:P0 '
             +'          and CD_STORE =:P1 '
             +'          and YMD_SALE Between :P2 and :P3 '
             +'          and CD_MEMBER <> '''' '
             +'          and DS_SALE <> ''V'' '
             +'        group by YMD_SALE) b on b.YMD_SALE = a.YMD_SALE left outer join '
             +'      (select YMD_SEND, '
             +'              COUNT(TEL_MOBILE) as CNT_SEND '
             +'         from SL_SMS '
             +'        where CD_HEAD  =:P0 '
             +'          and CD_STORE =:P1 '
             +'          and YMD_SEND Between :P2 and :P3 '
             +'        group by YMD_SEND) c on c.YMD_SEND = a.YMD_SALE '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE Between :P2 and :P3 '
             +' order by a.YMD_SALE ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    while not Query.Eof do
    begin
      vChart01 := vChart01 + Format('  <category label="%d일" />  ',[StoI(RightStr(Query.Fields[0].AsString,2))]);
      vChart02 := vChart02 + Format('  <set value="%d" />  ',[Query.Fields[1].AsInteger]);
      vChart03 := vChart03 + Format('  <set value="%d" />  ',[Query.Fields[2].AsInteger]);
      vChart04 := vChart04 + Format('  <set value="%d" />  ',[Query.Fields[3].AsInteger]);
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  vChart01 := vChart01 + '  </categories>  ';
  vChart02 := vChart02 + '  </dataset>  ';
  vChart03 := vChart03 + '  </dataset>  ';
  vChart04 := vChart04 + '  </dataset>  ';

  vChartXml := vChartXml + vChart01 + vChart02 + vChart03 + vChart04;

  vChartXml := vChartXml + '</chart>';
  ShowChart(FusionChart, 'FusionChart', 'mscombidy2d', vChartXml);
end;


end.
