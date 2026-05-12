unit ReserveEmpWorkShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, Menus, AdvToolBar,
  AdvToolBarStylers, ExtCtrls, cxContainer, Uni, MemDS, ImgList,
  cxGridLevel, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxImage, cxGridCardView, cxGridDBCardView, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxGridCustomLayoutView, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TReserveEmpWorkShowForm = class(TInheritShow2Form)
    GridDBTableViewEmpCode: TcxGridDBColumn;
    GridDBTableViewEmpName: TcxGridDBColumn;
    GridDBTableViewTimeCode: TcxGridDBColumn;
    GridDBTableViewTimeIn: TcxGridDBColumn;
    GridDBTableViewTimeOut: TcxGridDBColumn;
    GridDBTableViewImageIn: TcxGridDBColumn;
    GridDBTableViewImageOut: TcxGridDBColumn;
    GridDBTableViewPosNo: TcxGridDBColumn;
    GridDBCardView: TcxGridDBCardView;
    GridDBCardViewImageIn: TcxGridDBCardViewRow;
    GridDBCardViewImageOut: TcxGridDBCardViewRow;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarSeparator3: TAdvToolBarSeparator;
    ConditionToolBarTimeCodeLabel: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  ReserveEmpWorkShowForm: TReserveEmpWorkShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

//------------------------------------------------------------------------------
// 폼생성
procedure TReserveEmpWorkShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date   := SToD(FormParam[1]);
    FormParam[0] := EmptyStr;
    ConditionToolBarEdit.Text := FormParam[2];
    Exec_Timer.Enabled := True;
  end;
end;

procedure TReserveEmpWorkShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  HelpURL     := 'BackOffice/예약&근태&출납/출퇴근조회/출퇴근조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // 시급 콤보박스 세팅
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
  ConditionToolBarComboBox.Properties.Items.AddObject('[지정안함]', TObject(vCode));
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

//------------------------------------------------------------------------------
// 조회
function TReserveEmpWorkShowForm.DoSearch:Boolean;
begin
  inherited;
  OpenQuery('select a.CD_SAWON, '
           +'       b.NM_SAWON, '
           +'       Date_Format(a.SETTLE_IN, ''%Y-%m-%d %H:%i'')  as TIME_IN, '
           +'       Date_Format(a.SETTLE_OUT, ''%Y-%m-%d %H:%i'') as TIME_OUT, '
           +'       a.NO_POS, '
           +'       case when a.IMG_IN  ='''' then '''' else ''(사진 있음)'' end IMAGE_IN, '
           +'       case when a.IMG_OUT ='''' then '''' else ''(사진 있음)'' end IMAGE_OUT, '
           +'       c.NM_CODE1 AS NM_PAY, '
           +'       ConCat(a.CD_SAWON,Date_Format(a.SETTLE_IN, ''%Y-%m-%d %H:%i'')) AS LINK '
           +'  from SL_SAWONWORK a Left outer join '
           +'       MS_SAWON     b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_SAWON = b.CD_SAWON left outer join '
           +'       MS_CODE      c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.CD_TIME  = c.CD_CODE and c.CD_KIND = ''10'' '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and Date_Format(a.SETTLE_IN, ''%Y%m%d'') between :P2 and :P3 '
           +'   and (a.CD_SAWON =:P4 OR b.NM_SAWON LIKE ConCat(''%'',:P4,''%'')) '
           +'order by a.CD_SAWON, a.SETTLE_IN ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text]);

  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  OpenQuery('select IMG_IN,  '
           +'       IMG_OUT, '
           +'       ConCat(CD_SAWON,Date_Format(SETTLE_IN, ''%Y-%m-%d %H:%i'')) as LINK '
           +'  from SL_SAWONWORK  '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and Date_Format(SETTLE_IN, ''%Y%m%d'') between :P2 and :P3 '
           +' order by CD_SAWON, SETTLE_IN ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);

  GridDBCardView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, SubMemData);
  GridDBCardView.DataController.DataSource := SubDataSource;

  ButtonToolBarSaveButton.Enabled := GridDBTableView.DataController.RecordCount > 0;
  Result := GridDBTableView.DataController.RecordCount > 0;
end;

procedure TReserveEmpWorkShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

//------------------------------------------------------------------------------
// 시급수정
procedure TReserveEmpWorkShowForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var
  vIndex    :Integer;
begin
  inherited;

  if not AskBox(Format('시급을 "%s"으로 변경하시겠습니까?',[ConditionToolBarComboBox.Text])) then Exit;

  try
    for vIndex := 0 to GridDBTableView.DataController.FilteredRecordCount-1 do
    begin
      ExecQuery('update SL_SAWONWORK '
               +'   set CD_TIME =:P4 '
               +' where CD_HEAD =:P0 '
               +'   and CD_STORE=:P1 '
               +'   and CD_SAWON=:P2 '
               +'   and Date_Format(SETTLE_IN, ''%Y-%m-%d %H:%i'')=:P3; ',
                 [HeadStoreCode,
                  StoreCode,
                  GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vIndex], GridDBTableViewEmpCode.Index],
                  GridDBTableView.DataController.Values[GridDBTableView.DataController.FilteredRecordIndex[vIndex], GridDBTableViewTimeIn.Index],
                  GetStrPointerData(ConditionToolBarComboBox)],
                  false);
    end;
    ExecQuery(TempSQL, [], true);
    DoSearch;
    MsgBox('변경이 완료되었습니다.');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
