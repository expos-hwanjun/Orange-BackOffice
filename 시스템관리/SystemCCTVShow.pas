unit SystemCCTVShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxSpinEdit, cxCurrencyEdit, AdvPanel, Vcl.OleCtrls,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, DateUtils, Common, AxVEC_TLB,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxNavigator, cxGroupBox;

type
  TPlayThread = class(TThread)
  private
    fForm: TForm;
  protected
    starttime, stoptime : int64;
    procedure Execute; override;
  public
    constructor Create(Astarttime, Astoptime : int64);
    destructor Destroy; override;
  end;

  TSystemCCTVShowForm = class(TInheritGridEditForm)
    DetailSearchPanel: TAdvPanel;
    ConditionToolBarAcctTypeLabel: TcxLabel;
    ConditionToolBarAcctTypeComboBox: TcxComboBox;
    cxLabel2: TcxLabel;
    ConditionToolBarSaleTypeComboBox: TcxComboBox;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewRcpNo: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewSaleTime: TcxGridColumn;
    GridTableViewSaleType: TcxGridColumn;
    Save_Timer: TTimer;
    GridTableView1: TcxGridTableView;
    GridTableView1CancelTime: TcxGridColumn;
    GridTableView1OrderTime: TcxGridColumn;
    GridTableView1Menu: TcxGridColumn;
    GridTableView1Qty: TcxGridColumn;
    GridTableView1Table: TcxGridColumn;
    GridTableView1PosNo: TcxGridColumn;
    GridTableView1Sawon: TcxGridColumn;
    GridTableView1Channel: TcxGridColumn;
    DetailPanel: TPanel;
    ControlPanel: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ConditionSearchDateEdit: TcxDateEdit;
    MinuteSpinEdit: TcxSpinEdit;
    PlayButton: TcxButton;
    LiveButton: TcxButton;
    TimeSyncButton: TcxButton;
    LiveStopButton: TcxButton;
    FastButton: TcxButton;
    StopButton: TcxButton;
    LoginInButton: TcxButton;
    PwdEdit: TcxTextEdit;
    UserIDEdit: TcxTextEdit;
    VecPortEdit: TcxCurrencyEdit;
    VecIPEdit: TcxTextEdit;
    Label2: TLabel;
    Label110: TLabel;
    Label109: TLabel;
    GridTableViewChangeTime: TcxGridColumn;
    Show22Button: TcxButton;
    Show33Button: TcxButton;
    Show44Button: TcxButton;
    PauseButton: TcxButton;
    SlowButton: TcxButton;
    AxVEC: TAxVECForm;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure ConditionToolBarSaleTypeComboBoxPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoginInButtonClick(Sender: TObject);
    procedure LogOutButtonClick(Sender: TObject);
    procedure LiveButtonClick(Sender: TObject);
    procedure LiveStopButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure FastButtonClick(Sender: TObject);
    procedure TimeSyncButtonClick(Sender: TObject);
    procedure PlayButtonClick(Sender: TObject);
    procedure Show22ButtonClick(Sender: TObject);
    procedure Show33ButtonClick(Sender: TObject);
    procedure Show44ButtonClick(Sender: TObject);
    procedure PauseButtonClick(Sender: TObject);
    procedure SlowButtonClick(Sender: TObject);
  private
    isLicense :Boolean;
    procedure PlayBack(aDate:TDateTime);
    procedure Proc_PLAY(var Message:TMessage); message WM_USER_CCTV;
  protected
    function DoSearch:Boolean; override;
  public
    function DateTimeMerge(date : TDateTime; time : TDateTime ) : TDateTime;
  end;

var
  SystemCCTVShowForm: TSystemCCTVShowForm;

implementation
uses DBModule;
{$R *.dfm}

procedure TSystemCCTVShowForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SetIniFile('CCTV', 'IP',VecIPEdit.Text);
  SetIniFile('CCTV', 'PORT', StrToInt(VecPortEdit.Text));
  SetIniFile('CCTV', 'USER', UserIDEdit.Text);
  SetIniFile('CCTV', 'PWD',  PwdEdit.Text);
  SetIniFile('CCTV', 'MINUTE',  MinuteSpinEdit.Text);
  SetIniFile('CCTV', 'GRID', GridPanel.Width);
end;

procedure TSystemCCTVShowForm.FormCreate(Sender: TObject);
var
  vCode  :PStrPointer;
  vIndex :Integer;
begin
  inherited;
  HelpURL := 'BackOffice/시스템관리/CCTV조회/CCTV조회.htm';
  //CCTV 인증을 받았는지 여부
  isLicense := true;//(HexToBin(LicenseProram[6])[1] = '1') or isDemo;

  isLoading := true;
  // 포스
  OpenQuery('select NM_CODE1, '
           +'       NM_CODE31 '
           +'  from MS_CODE '
           +' where CD_STORE  =:P0 '
           +'   and CD_KIND   = ''01'' '
           +'   and DS_STATUS = ''0'' '
           +'  order by CD_CODE',
            [StoreCode]);
  try
    ConditionToolBarComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := EmptyStr;
    ConditionToolBarComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[1].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[0].AsString, TObject(vCode));
      Query.Next;
    end;
    ConditionToolBarComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;

  ConditionSearchDateEdit.Date := Now();

  VecIPEdit.Text                    := GetIniFile('CCTV', 'IP','');
  VecPortEdit.Value                 := GetIniFile('CCTV', 'PORT',8000);
  UserIDEdit.Text                   := GetIniFile('CCTV', 'USER','admin');
  PwdEdit.Text                      := GetIniFile('CCTV', 'PWD','12345');
  MinuteSpinEdit.Text               := GetIniFile('CCTV', 'MINUTE',  '3');
  GridPanel.Width                   := GetIniFile('CCTV', 'GRID', 340);
  isLoading := false;

  PlayButton.Enabled := isLicense;
  LiveButton.Enabled := isLicense;
  AxVEC.SetScreenXY(2, 2);
  if not isLicense then
  begin
    DetailSearchPanel.Caption.Text := '장비 등록이 되지 않은 매장입니다';
    DetailPanel.Enabled            := false;
  end;
end;

procedure TSystemCCTVShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not ControlPanel.Enabled then
  begin
    ErrBox('로그인을 먼저 해야합니다');
    Exit;
  end;
  ConditionSearchDateEdit.Date := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewChangeTime.Index];
  LiveStopButton.Click;
  PlayButtonClick(nil);
end;

procedure TSystemCCTVShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewSaleType.Index] = '취소' then
    AStyle := StyleFontRed
  else if ARecord.Values[GridTableViewSaleType.Index] = '반품' then
    AStyle := StyleFontBlue;
end;

//초기화버튼
procedure TSystemCCTVShowForm.LiveButtonClick(Sender: TObject);
begin
  inherited;
  AxVEC.PlayStop;
  AxVEC.LiveStop();
	AxVEC.Live();
  PlayButton.Enabled  := true;
  StopButton.Enabled  := false;
  FastButton.Enabled  := false;
  PauseButton.Enabled := false;
  SlowButton.Enabled  := false;
end;

procedure TSystemCCTVShowForm.LiveStopButtonClick(Sender: TObject);
begin
  inherited;
	AxVEC.LiveStop();
end;

procedure TSystemCCTVShowForm.LoginInButtonClick(Sender: TObject);
var
  vResult : integer;
  vIndex  : Integer;
begin
  AxVEC.Add(1, '0000', '', VecIPEdit.Text, VecPortEdit.Text, UserIDEdit.Text, PwdEdit.Text);
  AxVEC.SetScreenXY(2,2);
  AxVEC.Login('0000');
  ControlPanel.Enabled  := true;
  LoginInButton.Enabled := false;
  for vIndex := 1 to 16 do
    AxVEC.Map('0000', vIndex, vIndex);
  LiveButton.Click;
end;

procedure TSystemCCTVShowForm.LogOutButtonClick(Sender: TObject);
var vResult :Integer;
begin
  inherited;
end;

procedure TSystemCCTVShowForm.FastButtonClick(Sender: TObject);
begin
  inherited;
  AxVEC.PlayFaster();
end;

procedure TSystemCCTVShowForm.ConditionToolBarSaleTypeComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ConditionToolBarEditLabel.Visible        := ConditionToolBarSaleTypeComboBox.ItemIndex < 7;
  ConditionToolBarComboBox.Visible         := ConditionToolBarSaleTypeComboBox.ItemIndex < 7;
  ConditionToolBarAcctTypeLabel.Visible    := ConditionToolBarSaleTypeComboBox.ItemIndex < 7;
  ConditionToolBarAcctTypeComboBox.Visible := ConditionToolBarSaleTypeComboBox.ItemIndex < 7;
  if ConditionToolBarSaleTypeComboBox.ItemIndex < 7 then
    GridLevel.GridView := GridTableView
  else
    GridLevel.GridView := GridTableView1;
end;

function TSystemCCTVShowForm.DateTimeMerge(date, time: TDateTime): TDateTime;
var
	tyear : word;
  tmonth : word;
  tday : word;
  thour : word;
  tmin : word;
  tsec : word;
	tmsec : word;
begin
	DecodeDate(date, tyear, tmonth, tday);
	DecodeTime(time, thour, tmin, tsec, tmsec);

	DateTimeMerge := EncodeDateTime(tyear,tmonth,tday,thour,tmin,tsec, 0);
end;

function TSystemCCTVShowForm.DoSearch: Boolean;
var vWhere :String;
begin
  if ConditionToolBarComboBox.ItemIndex > 0 then
    vWhere := Format('and a.NO_POS =''%s'' ',[ConditionToolBarComboBox.Text]);

  case ConditionToolBarAcctTypeComboBox.ItemIndex of
    1 : vWhere := vWhere + 'and a.AMT_CASH > 0 ';
    2 : vWhere := vWhere + 'and a.AMT_CARD > 0 ';
    3 : vWhere := vWhere + 'and a.AMT_CASHRCP > 0 ';
    4 : vWhere := vWhere + 'and a.DC_POINT > 0 ';
  end;

  case ConditionToolBarSaleTypeComboBox.ItemIndex of
    1 : vWhere := vWhere + 'and a.DS_SALE = ''S'' ';
    2 : vWhere := vWhere + 'and a.DS_SALE = ''V'' ';
    3 : vWhere := vWhere + 'and a.DS_SALE = ''B'' ';
    4 : vWhere := vWhere + 'and 0 < (select Count(*) '
                          +'           from SL_SALE_H_HIST '
                          +'          where CD_STORE =a.CD_STORE '
                          +'            and YMD_SALE =a.YMD_SALE '
                          +'            and NO_POS   =a.NO_POS '
                          +'            and NO_RCP   =a.NO_RCP '
                          +'            and DS_GUBUN =''C'') ';
    5 : vWhere := vWhere + 'and 0 < (select Count(*) '
                          +'           from SL_SALE_H_HIST '
                          +'          where CD_STORE =a.CD_STORE '
                          +'            and YMD_SALE =a.YMD_SALE '
                          +'            and NO_POS   =a.NO_POS '
                          +'            and NO_RCP   =a.NO_RCP '
                          +'            and DS_GUBUN =''H'') ';
    6 : vWhere := vWhere + 'and 0 < (select Count(*) '
                          +'           from SL_SALE_H_HIST '
                          +'          where CD_STORE =a.CD_STORE '
                          +'            and YMD_SALE =a.YMD_SALE '
                          +'            and NO_POS   =a.NO_POS '
                          +'            and NO_RCP   =a.NO_RCP '
                          +'            and DS_GUBUN =''P'') ';
  end;

  if ConditionToolBarSaleTypeComboBox.ItemIndex < 7 then
  begin
    OpenQuery('select dbo.StoDW(a.YMD_SALE) as YMD_SALE, '
             +'       a.NO_POS, '
             +'       a.NO_RCP, '
             +'       a.AMT_SALE, '
             +'       case a.DS_SALE when ''S'' then ''판매'' when ''V'' then ''취소'' when ''B'' then ''반품'' end as DS_SALE, '
             +'       a.DT_SALE, '
             +'       a.DT_CHANGE '
             +'  from SL_SALE_H a '
             +' where a.CD_STORE =:P0 '
             +'   and a.YMD_SALE between :P1 and :P2 '
             +vWhere
             +' order by a.YMD_SALE, a.NO_POS, a.NO_RCP ',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else //주문취소
  begin
    OpenQuery('select a.CD_MENU, '
             +'       b.NM_MENU, '
             +'       dbo.StoD(a.DT_ORDER)+''(''+Convert(Varchar(9), DATEDIFF(n, Convert(DateTime,  dbo.StoD(DT_ORDER)), Convert(DateTime,  dbo.StoD(DT_CANCEL))))+'')'' as DT_ORDER, '
             +'       dbo.StoD(a.DT_CANCEL) as DT_CANCEL, '
             +'       dbo.GetTableName(a.CD_STORE, a.NO_TABLE) as NM_TABLE, '
             +'       a.QTY_CANCEL, '
             +'       c.NM_SAWON, '
             +'       a.NO_POS, '
             +'       d.NM_CODE31 as NO_CHANNEL '
             +'  from SL_SALE_C a left outer join '
             +'       MS_MENU   b on a.CD_STORE = b.CD_STORE and a.CD_MENU = b.CD_MENU left outer join '
             +'       MS_SAWON  c on a.CD_STORE = c.CD_STORE and a.CD_SAWON = c.CD_SAWON left outer join '
             +'       MS_CODE   d on a.CD_STORE = d.CD_STORE and a.NO_POS   = d.NM_CODE1 and d.CD_KIND = ''01'' '
             +' where a.CD_STORE = :P0 '
             +'   and a.YMD_SALE between :P1 and :P2 '
             +'   and a.DT_ORDER <> '''' '
             +'order by a.DT_CANCEL ',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);  
    Result := DM.ReadQuery(Query, GridTableView1);
  end;
  MainPanel.Enabled := true;
end;
procedure TSystemCCTVShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  if not isLicense then Exit;

  LiveStopButton.Click;
  Sleep(1000);
  PlayButtonClick(nil);
  Self.Show;
end;

procedure TSystemCCTVShowForm.PauseButtonClick(Sender: TObject);
begin
  inherited;
  AxVEC.PlayPause();
end;

procedure TSystemCCTVShowForm.PlayBack(aDate: TDateTime);
begin
end;
procedure TSystemCCTVShowForm.PlayButtonClick(Sender: TObject);
var
  vStart64, vStop64 : int64;
  vIndex :Integer;
begin
  LiveStopButton.Click;

  AxVEC.PlayStop;
  AxVEC.LiveStop();

  AxVEC.MapClear;
  for vIndex := 1 to 16 do
  	AxVEC.Map('0000', vIndex, vIndex);

  if Sender = nil then
   	vStart64  := DateTimeToUnix(IncMinute(ConditionSearchDateEdit.Date,  -StrToInt(MinuteSpinEdit.Text)))
  else
    vStart64 := DateTimeToUnix(ConditionSearchDateEdit.Date);
	vStop64  := DateTimeToUnix(IncMinute(ConditionSearchDateEdit.Date,  StrToInt(MinuteSpinEdit.Text)));

  SystemCCTVShowForm := self;
  TPlayThread.Create(vStart64, vStop64);
  PlayButton.Enabled := false;
  StopButton.Enabled := true;
  FastButton.Enabled  := true;
  PauseButton.Enabled := true;
  SlowButton.Enabled  := true;
end;

procedure TSystemCCTVShowForm.Proc_PLAY(var Message: TMessage);
begin
  self.Show;
  Self.Activate;
  if not ControlPanel.Enabled then
    LoginInButton.Click;

  ConditionSearchDateEdit.Date := CCTVDate;
  Exec_Timer.Enabled := true;
end;

procedure TSystemCCTVShowForm.Show22ButtonClick(Sender: TObject);
begin
  inherited;
  AxVEC.SetScreenXY(2,2);
end;

procedure TSystemCCTVShowForm.Show33ButtonClick(Sender: TObject);
begin
  inherited;
  AxVEC.SetScreenXY(3,3);
end;

procedure TSystemCCTVShowForm.Show44ButtonClick(Sender: TObject);
begin
  inherited;
  AxVEC.SetScreenXY(4,4);
end;

procedure TSystemCCTVShowForm.SlowButtonClick(Sender: TObject);
begin
  inherited;
  AxVEC.PlaySlower();
end;

procedure TSystemCCTVShowForm.StopButtonClick(Sender: TObject);
var vResult :Integer;
begin
  inherited;
	AxVEC.PlayStop();
  PlayButton.Enabled  := true;
  StopButton.Enabled  := false;
  FastButton.Enabled  := false;
  PauseButton.Enabled := false;
  SlowButton.Enabled  := false;
end;

procedure TSystemCCTVShowForm.TimeSyncButtonClick(Sender: TObject);
var vTime64 :Int64;
    vResult :Integer;
begin
  inherited;
	vTime64 := DateTimeToUnix(Now());

	AxVEC.SetTime(vTime64);
end;

constructor TPlayThread.Create(Astarttime, Astoptime : int64);
begin
  inherited Create( False );
  starttime := Astarttime;
  stoptime  := Astoptime ;
  FreeOnTerminate := True;
end;

procedure TPlayThread.Execute;
begin
  inherited;
  SystemCCTVShowForm.AxVEC.Play(starttime,stoptime);
end;

destructor TPlayThread.Destroy;
begin
  //
  inherited;
end;

end.
