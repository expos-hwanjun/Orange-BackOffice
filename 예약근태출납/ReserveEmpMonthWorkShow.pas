unit ReserveEmpMonthWorkShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  Menus, AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer, Uni,
  DB, MemDS, ImgList, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, DateUtils, Math, StrUtils,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TReserveEmpMonthWorkShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewDay1: TcxGridColumn;
    GridTableViewDay2: TcxGridColumn;
    GridTableViewDay3: TcxGridColumn;
    GridTableViewDay4: TcxGridColumn;
    GridTableViewDay5: TcxGridColumn;
    GridTableViewDay6: TcxGridColumn;
    GridTableViewDay7: TcxGridColumn;
    GridTableViewDay8: TcxGridColumn;
    GridTableViewDay9: TcxGridColumn;
    GridTableViewDay10: TcxGridColumn;
    GridTableViewDay11: TcxGridColumn;
    GridTableViewDay12: TcxGridColumn;
    GridTableViewDay13: TcxGridColumn;
    GridTableViewDay14: TcxGridColumn;
    GridTableViewDay15: TcxGridColumn;
    GridTableViewDay16: TcxGridColumn;
    GridTableViewDay17: TcxGridColumn;
    GridTableViewDay18: TcxGridColumn;
    GridTableViewDay19: TcxGridColumn;
    GridTableViewDay20: TcxGridColumn;
    GridTableViewDay21: TcxGridColumn;
    GridTableViewDay22: TcxGridColumn;
    GridTableViewDay23: TcxGridColumn;
    GridTableViewDay24: TcxGridColumn;
    GridTableViewDay25: TcxGridColumn;
    GridTableViewDay26: TcxGridColumn;
    GridTableViewDay27: TcxGridColumn;
    GridTableViewDay28: TcxGridColumn;
    GridTableViewDay29: TcxGridColumn;
    GridTableViewDay30: TcxGridColumn;
    GridTableViewDay31: TcxGridColumn;
    GridTableViewSawonCode: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  ReserveEmpMonthWorkShowForm: TReserveEmpMonthWorkShowForm;



implementation

uses
  Common, DBModule, Main;

{$R *.dfm}

procedure TReserveEmpMonthWorkShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  HelpURL     := 'BackOffice/예약&근태&출납/월%20출퇴근조회/월%20출퇴근조회.htm';
  PrintMode   := pmPreviewExcel;

  // 부서 콤보박스 세팅
  OpenQuery('select   CD_CODE, '
           +'         NM_CODE1 '
           +'  from   MS_CODE '
           +' where   CD_HEAD  =:P0 '
           +'   and   CD_STORE =:P1 '
           +'   and   CD_KIND  = ''10'''
           +'   and   DS_STATUS = ''0'' ',
            [HeadStoreCode,
             StoreCode]);

  New(vCode);
  vCode^.Data := EmptyStr;
  ConditionToolBarComboBox.Properties.Items.AddObject('[ 전체 ]', TObject(vCode));

  while not Query.Eof do
  begin
    New(vCode);
    vCode^.Data := Query.Fields[0].AsString;
    ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
    Query.Next;
  end;
  ConditionToolBarComboBox.ItemIndex := 0;
  FinishQuery;
end;

procedure TReserveEmpMonthWorkShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //상품분류별 매출조회 실행
  FormParam[0] := LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+'01';
  FormParam[1] := LeftStr(DtoS(ConditionToolBarFromDateEdit.Date),6)+FormatDateTime('dd',EndOfTheMonth(ConditionToolBarFromDateEdit.Date));
  FormParam[2] := Sender.DataController.Values[Sender.Controller.FocusedRecordIndex, GridTableViewSawonCode.Index];
  ExtremeMainForm.RunProgram('CloseEmpWorkShow');
end;

function TReserveEmpMonthWorkShowForm.DoSearch:Boolean;
var vIndex      :Integer;
    vCol        :Integer;
    vMonthDay   :Integer;
    vSqlText    :String;
    vSqlTotText :String;
begin
  Result := false;
  try
    vMonthDay := StrToInt(FormatDateTime('dd',EndOfTheMonth(ConditionToolBarFromDateEdit.Date)));
  except
    ErrBox('조회할 월을 다시 입력하십시오.');
    Exit;
  end;

  for vIndex := 3 to 33 do
  begin
    GridTableView.Columns[vIndex].Visible       := False;
    GridTableView.Columns[vIndex].Styles.Header := nil;
  end;
  for vIndex := 0 to  vMonthDay - 1 do
  begin
    GridTableView.Columns[vIndex+3].Visible := True;
    case DayOfWeek(StrToDate(FormatDateTime('yyyy-mm',ConditionToolBarFromDateEdit.Date) +FormatFloat('-00', vIndex+1))) of
      1 : GridTableView.Columns[vIndex+3].Styles.Header := StyleFontRed;  //일요일
      7 : GridTableView.Columns[vIndex+3].Styles.Header := StyleFontBlue; //토요일
    end;
  end;

  vSqlText := 'select NM_SAWON, Count(NM_SAWON) as DAY_WORK,  ';
  for vIndex := 1 to vMonthDay do
    vSqlTotText := vSqlTotText + ' ifnull(WORK_TIME_'+IntToStr(vIndex)+',0)' + Ifthen(vIndex < vMonthDay, '+ ','');

  vSqlText := vSqlText + ' ConCat(Cast(DivInt(Sum('+vSqlTotText+'),60) as char),'':'', Cast(SUM('+vSqlTotText+') % 60 as char),'''') as WORK_TOT,';
  for vIndex := 1 to vMonthDay do
    vSqlText := vSqlText + ' ConCat(Cast(DivInt(Sum(WORK_TIME_'+IntToStr(vIndex)+'),60) as char),'':'', LPad(SUM(WORK_TIME_'+IntToStr(vIndex)+') % 60,2,''0''),'''') as DAY_'+IntToStr(vIndex)+Ifthen(vIndex < vMonthDay, ', ','');

  vSqlText := vSqlText + ' ,CD_SAWON from ( select CD_SAWON, NM_SAWON, ';
  for vIndex := 1 to vMonthDay do
    vSqlText := vSqlText + ' case when WORK_DATE ='+IntToStr(vIndex)+' then WORK_TIME end as WORK_TIME_'+IntToStr(vIndex)+ Ifthen(vIndex < vMonthDay, ', ','');

  vSqlText := vSqlText + ' from ( select s.CD_SAWON, '
                       + '               m.NM_SAWON, '
                       + '               Cast(Date_Format(s.SETTLE_IN,''%d'') as int) as WORK_DATE, '
                       + '               TIMESTAMPDIFF(minute, s.SETTLE_IN, s.SETTLE_OUT) as WORK_TIME '
                       + '          from SL_SAWONWORK s left outer join '
                       + '               MS_SAWON as m on s.CD_HEAD = m.CD_HEAD and s.CD_STORE = m.CD_STORE and s.CD_SAWON = m.CD_SAWON '
                       + '         where s.CD_HEAD  =:P0 '
                       +'            and s.CD_STORE =:P1 '
                       + '           and Date_Format(s.SETTLE_IN, ''%Y%m'') = :P2 '
                       + '           and ifnull(s.SETTLE_OUT,'''') <> '''' '
                       + Ifthen(GetStrPointerData(ConditionToolBarComboBox) <> EmptyStr, 'and m.CD_TIME_PAY ='''+GetStrPointerData(ConditionToolBarComboBox)+'''', '')+') as a '
                       + ' ) as t '
                       + 'group by NM_SAWON, CD_SAWON ';

  OpenQuery(vSqlText,
            [HeadStoreCode,
             StoreCode,
             FormatDateTime('yyyymm',ConditionToolBarFromDateEdit.Date)]);
  DM.ReadQuery(Query, GridTableView);
  Result := GridTableView.DataController.RecordCount > 0;

  GridTableView.BeginUpdate;
  // 푸터 값을 계산한다
  for vIndex := 0 to 30 do
    GridTableView.DataController.Summary.FooterSummaryValues[vIndex] := 0;

  for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
    for vCol := 3 to 33 do
      if NVL(GridTableView.DataController.Values[vIndex, vCol],'') <> EmptyStr then
         GridTableView.DataController.Summary.FooterSummaryValues[vCol-3] := GridTableView.DataController.Summary.FooterSummaryValues[vCol-3] + 1;
  GridTableView.EndUpdate;
end;
end.
