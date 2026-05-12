unit SystemDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inherit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, Menus, cxCustomData,
  cxFilter, cxData, cxDataStorage, StdCtrls, cxRadioGroup, cxGroupBox, cxMemo,
  cxPC, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxButtons,
  cxClasses, cxGridLevel, cxGrid, ExtCtrls, AdvToolBar, AdvToolBarStylers,
  DBAccess, Uni, DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, CPortCtl, CPort, cxCheckBox, SBPosButton,
  cxCurrencyEdit, Math, StrUtils;

type
  TSystemDeliveryForm = class(TInheritForm)
    DeliveryPanel: TPanel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    DeliveryNoEdit: TcxTextEdit;
    DeliveryTimeEdit: TcxTextEdit;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Grid1: TcxGrid;
    HistoryGridTableView: TcxGridTableView;
    HistoryGridTableViewColumn1: TcxGridColumn;
    HistoryGridTableViewColumn2: TcxGridColumn;
    HistoryGridTableViewColumn3: TcxGridColumn;
    Grid1Level1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    RemarkMemo: TcxMemo;
    CustomerNameEdit: TcxTextEdit;
    MobileTelephoneEdit: TcxTextEdit;
    HomeTelephoneEdit: TcxTextEdit;
    MemberSearchButton: TcxButton;
    MemberCodeEdit: TcxTextEdit;
    EtcTelephoneEdit: TcxTextEdit;
    Etc1TelephoneEdit: TcxTextEdit;
    Grid: TcxGrid;
    DeliveryGridTableView: TcxGridTableView;
    DeliveryGridTableViewDeliveryNo: TcxGridColumn;
    DeliveryGridTableViewCustomer: TcxGridColumn;
    DeliveryGridTableViewTelNo: TcxGridColumn;
    DeliveryGridTableViewStatus: TcxGridColumn;
    OutGridTableView: TcxGridTableView;
    OutGridTableViewSeq: TcxGridColumn;
    OutGridTableViewTeNo: TcxGridColumn;
    OutGridTableViewCustomer: TcxGridColumn;
    OutGridTableViewCallTime: TcxGridColumn;
    LogGridTableView: TcxGridTableView;
    LogGridTableViewColumn1: TcxGridColumn;
    LogGridTableViewColumn2: TcxGridColumn;
    LogGridTableViewColumn3: TcxGridColumn;
    LogGridTableViewColumn4: TcxGridColumn;
    LogGridTableViewColumn5: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    GridLevel3: TcxGridLevel;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSearchButton: TAdvGlowButton;
    CIDComPort: TComPort;
    ComLed1: TComLed;
    ComPortPortComboBox: TcxComboBox;
    ComportOpenButton: TcxButton;
    cxCheckBox1: TcxCheckBox;
    CidLine1Button: TSBPosButton;
    CidLine2Button: TSBPosButton;
    CidLine3Button: TSBPosButton;
    CidLine4Button: TSBPosButton;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarCancelButton: TAdvGlowButton;
    LinkRcpButton: TcxButton;
    cxLabel10: TcxLabel;
    AddressMemo: TcxMemo;
    StepEdit: TcxTextEdit;
    SearchButton: TcxButton;
    MemberSaveButton: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ComportOpenButtonClick(Sender: TObject);
    procedure CIDComPortRxChar(Sender: TObject; Count: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure DeliveryGridTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure MemberSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarCancelButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure MobileTelephoneEditExit(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
  private
    CidData  :String;
    CidTimer :TTimer;
    isNew    :Boolean;
    procedure CidTimerTimer(Sender: TObject);
    procedure GetNewPhone(aLine, aPhoneNo:String);
    procedure GetDeliveryHistory;
  protected
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  SystemDeliveryForm: TSystemDeliveryForm;

implementation
uses Common, Help;
{$R *.dfm}
procedure TSystemDeliveryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if cxCheckBox1.Checked then
    SetIniFile('MAIN','DeliveryTab',True);
end;

procedure TSystemDeliveryForm.FormCreate(Sender: TObject);

begin
  inherited;
  try
    ComPortPortComboBox.ItemIndex := 0;
    if GetIniFile('MAIN','CID',-1) >= 0 then
      ComPortPortComboBox.ItemIndex :=  GetIniFile('MAIN','CID',-1);
    cxCheckBox1.Checked := GetIniFile('MAIN','DeliveryTab',False);
    if cxCheckBox1.Checked then
      cxPageControl1.ActivePageIndex := 1;
  except
  end;
  CidTimer         := TTimer.Create(Self);
  CidTimer.Enabled := false;
  CidTimer.OnTimer := CidTimerTimer;
end;

procedure TSystemDeliveryForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//CID 포트 오픈버튼 클릭
procedure TSystemDeliveryForm.ComportOpenButtonClick(Sender: TObject);
var vTemp    : String;
    vGetTime : Cardinal;
    IsCheck  : Boolean;
begin
  inherited;
  try
    CIDComPort.Port      := ComPortPortComboBox.Text;
    CIDComPort.Connected := True;
  except
    ErrBox(ComPortPortComboBox.Text+'포트를 열 수 없습니다.');
    Exit;
  end;

  vTemp := GetRegistry(HKEY_LOCAL_MACHINE, regExtremePOS+msgExtremeERP, regDelivery, EmptyStr);
  vTemp := Decrypt(vTemp, 123);
  if vTemp = CustomerNo + ComPortPortComboBox.Text then Exit;

  if not CIDComPort.Connected then Exit;
  CidData := EmptyStr;
  CidComPort.WriteStr(#2+' P                  '+#3);
  vGetTime := GetTickCount;
  IsCheck  := False;
  while vGetTime + 1000 > GetTickCount do
  begin
    Application.ProcessMessages;
    if (Length(CidData) > 0) and (POS('EPOS', CidData) > 0) then
    begin
      IsCheck := True;
      Break;
    end;
  end;
  if not IsCheck then
  begin
    MsgBox('CID 장비가 프로그램과'+#13+'호환되지 않습니다.'+#13#13+'설치점에 문의 바랍니다.');
    SetRegistry(HKEY_LOCAL_MACHINE, regExtremePOS+msgExtremeERP, regDelivery, '');
    CidComPort.Close;
  end
  else
  //정상장비로 체크시에는 레지스트리에 고객번호와 같이 체크됐음을 기록한다
  begin
    vTemp := Encrypt(CustomerNo + ComPortPortComboBox.Text, 123);
    SetRegistry(HKEY_LOCAL_MACHINE, regExtremePOS+msgExtremeERP, regDelivery, vTemp);
  end;
  CidData := EmptyStr;
end;


//조회버튼 클릭 시
procedure TSystemDeliveryForm.SearchButtonClick(Sender: TObject);
begin
  inherited;
  //회원인지 체크
  try
    OpenQuery('select Top 1 CD_MEMBER, '
             +'       NM_MEMBER, '
             +'       TEL_MOBIL, '
             +'       TEL_HOME, '
             +'       ADDR1 +'' ''+ADDR2 as ADDRESS '
             +'from   MS_MEMBER '
             +'where  CD_STORE =:P0 '
             +'  and  (Replace(TEL_MOBIL,''-'','''') =:P1 or Replace(TEL_HOME,''-'','''') =:P1 or Replace(TEL_JOB,''-'','''') =:P1 )',
             [Ifthen(GetOption(257)='0', StoreCode, '0000'),
              Copy(CidData,4,12)]);
    if not Query.Eof then
    begin
      CustomerNameEdit.Text    := Query.Fields[1].AsString;
      MemberCodeEdit.Text      := Query.Fields[0].AsString;
      MobileTelephoneEdit.Text := GetPhoneNo(Query.Fields[2].AsString);
      HomeTelephoneEdit.Text   := GetPhoneNo(Query.Fields[3].AsString);
      AddressMemo.Text         := Query.Fields[4].AsString;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  //매출처인지 체크
  try
    OpenQuery('select Top 1 CD_TRDPL, '
             +'       NM_TRDPL, '
             +'       TEL_DAMDANG, '
             +'       TEL_OFFICE, '
             +'       ADDR1 +'' ''+ADDR2 as ADDRESS '
             +'from   MS_TRD '
             +'where  CD_STORE =:P0 '
             +'  and  (Replace(TEL_DAMDANG,''-'','''') =:P1 or Replace(TEL_OFFICE,''-'','''') =:P1 )',
             [StoreCode,
              Copy(CidData,4,12)]);
    if not Query.Eof then
    begin
      CustomerNameEdit.Text    := Query.Fields[1].AsString;
      MemberCodeEdit.Text      := Query.Fields[0].AsString;
      MobileTelephoneEdit.Text := GetPhoneNo(Query.Fields[2].AsString);
      HomeTelephoneEdit.Text   := GetPhoneNo(Query.Fields[3].AsString);
      AddressMemo.Text         := Query.Fields[4].AsString;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  //배달이력 체크
  try
    OpenQuery('select Top 1 '
             +'       NM_NAME '
             +'       NO_TEL1, '
             +'       NO_TEL2, '
             +'       NO_TEL3, '
             +'       NO_TEL4, '
             +'       ADDR1 +'' ''+ADDR2 as ADDRESS '
             +'from   SL_DELIVERY '
             +'where  CD_STORE =:P0 '
             +'  and  (NO_TEL1 =:P1 or NO_TEL2 =:P1 or NO_TEL3 =:P1 or NO_TEL4 =:P1) '
             +'order by YMD_DELIVERY DESC ',
             [StoreCode,
              Copy(CidData,4,12)]);
    if not Query.Eof then
    begin
      CustomerNameEdit.Text    := Query.Fields[0].AsString;
      MobileTelephoneEdit.Text := GetPhoneNo(Query.Fields[1].AsString);
      HomeTelephoneEdit.Text   := GetPhoneNo(Query.Fields[2].AsString);
      EtcTelephoneEdit.Text    := GetPhoneNo(Query.Fields[3].AsString);
      Etc1TelephoneEdit.Text   := GetPhoneNo(Query.Fields[4].AsString);
      AddressMemo.Text         := Query.Fields[5].AsString;
    end;
  finally
    FinishQuery;
  end;

end;

procedure TSystemDeliveryForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarSearchButton.Enabled := not isChanged;
  ButtonToolBarNewButton.Enabled    := not isChanged;
  ButtonToolBarSaveButton.Enabled   := isChanged;
  ButtonToolBarCancelButton.Enabled := isChanged;
  GridLevel2.Visible := not isChanged;
  GridLevel3.Visible := not isChanged;
  if isChanged then Grid.ActiveLevel := GridLevel1;
end;

//신규버튼 클릭 시
procedure TSystemDeliveryForm.ButtonToolBarCancelButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재 작업 중인 내역을 취소하시겠습니까?') then Exit;
  isNew     := false;
  isChanged := false;
  ClearEdit;
  DeliveryGridTableViewFocusedRecordChanged(nil, nil, nil, false);
end;

procedure TSystemDeliveryForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  isChanged := true;
  isNew     := true;
  try
    OpenQuery('select dbo.LPad(Isnull(Max(NO_DELIVERY),''0'')+1,4,''0'') '
             +'from   SL_DELIVERY '
             +'where  CD_STORE     =:P0 '
             +'  and  YMD_DELIVERY = Convert(Varchar(8), GetDate(), 120) ',
             [StoreCode]);
    DeliveryNoEdit.Text   := FormatDateTime('yyyymmdd',now)+'-'+Query.Fields[0].AsString;
    DeliveryTimeEdit.Text := FormatDateTime(fmtTimeLong, now);
  finally
    FinishQuery;
  end;
  LinkRcpButton.Caption := '';
  DeliveryPanel.Enabled := true;
  Grid.ActiveLevel := GridLevel1;
  CustomerNameEdit.SetFocus;
end;

//저장버튼 클릭 시
procedure TSystemDeliveryForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vDeliveryNo :String;
begin
  inherited;
  if Trim(CustomerNameEdit.Text) = EmptyStr then
  begin
    MsgBox('고객이름을 입력하십시오.');
    if DeliveryPanel.Enabled then
      CustomerNameEdit.SetFocus;
  end;

  if (Trim(MobileTelephoneEdit.Text) = EmptyStr) and (Trim(HomeTelephoneEdit.Text) = EmptyStr) and (Trim(EtcTelephoneEdit.Text) = EmptyStr) and (Trim(Etc1TelephoneEdit.Text) = EmptyStr) then
  begin
    MsgBox('연락처를 입력하십시오.');
    if DeliveryPanel.Enabled then
      MobileTelephoneEdit.SetFocus;
  end;

  if (Trim(AddressMemo.Text) = EmptyStr) then
  begin
    MsgBox('주소를 입력하십시오.');
    if DeliveryPanel.Enabled then
      AddressMemo.SetFocus;
  end;

  if isNew then
  begin
    try
      OpenQuery('select dbo.LPad(Isnull(Max(NO_DELIVERY),0)+1,4,''0'') '
               +'from   SL_DELIVERY '
               +'where  CD_STORE     =:P0 '
               +'  and  YMD_DELIVERY = Convert(varchar(8), getdate(), 120) ',
               [StoreCode]);
      vDeliveryNo := Query.Fields[0].AsString;
    finally
      FinishQuery;
    end;

    ExecQuery('insert into SL_DELIVERY '
                       +'( '
                       +'  CD_STORE, '                 //:P0,
                       +'  YMD_DELIVERY, '             //:P1,
                       +'  NO_DELIVERY, '              //:P2,
                       +'  DS_STEP, '
                       +'  DT_ORDER, '
                       +'  NM_NAME, '                  //:P3
                       +'  CD_MEMBER, '                //:P4,
                       +'  NO_TEL1, '                  //:P5
                       +'  NO_TEL2, '                  //:P6
                       +'  NO_TEL3, '                  //:P7
                       +'  NO_TEL4, '                  //:P8
                       +'  ADDRESS1, '                 //:P9
                       +'  REMARK, '                   //:P10
                       +'  CD_SAWON_ORDER, '           //:P11
                       +'  ORDER_REMARK, '             //:P12
                       +'  NO_POS_ORDER, '             //:P13
                       +'  DS_TRANS '
                       +') values ( '
                       +':P0, '
                       +':P1, '
                       +':P2, '
                       +'''1'', '
                       +'GetDate(), '
                       +':P3, '
                       +':P4, '
                       +':P5, '
                       +':P6, '
                       +':P7, '
                       +':P8, '
                       +':P9, '
                       +':P10, '
                       +':P11, '
                       +':P12, '
                       +':P13, '
                       +'0 )',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        vDeliveryNo,
                        CustomerNameEdit.Text,
                        MemberCodeEdit.Text,
                        Replace(MobileTelephoneEdit.Text,'-',''),
                        Replace(HomeTelephoneEdit.Text,'-',''),
                        Replace(EtcTelephoneEdit.Text,'-',''),
                        Replace(Etc1TelephoneEdit.Text,'-',''),
                        AddressMemo.Text,
                        RemarkMemo.Text,
                        UserCode,
                        '',
                        '00'], True);

    //그리드에 추가한다
    DeliveryGridTableView.DataController.AppendRecord;
    DeliveryGridTableView.DataController.Values[DeliveryGridTableView.DataController.RowCount-1, 0] := DtoS(ConditionToolBarFromDateEdit.Date);
    DeliveryGridTableView.DataController.Values[DeliveryGridTableView.DataController.RowCount-1, 1] := CustomerNameEdit.Text;
    DeliveryGridTableView.DataController.Values[DeliveryGridTableView.DataController.RowCount-1, 2] := MobileTelephoneEdit.Text;
    DeliveryGridTableView.DataController.Values[DeliveryGridTableView.DataController.RowCount-1, 3] := '주문';
  end
  else
  begin
    ExecQuery('update SL_DELIVERY set '
             +'       NM_NAME   =:P3, '
             +'       CD_MEMBER =:P4, '
             +'       NO_TEL1   =:P5, '
             +'       NO_TEL2   =:P6, '
             +'       NO_TEL3   =:P7, '
             +'       NO_TEL4   =:P8, '
             +'       ADDRESS1  =:P9, '
             +'       REMARK    =:P10 '
             +'where CD_STORE     =:P0 '
             +'  and YMD_DELIVERY =:P1 '
             +'  and NO_DELIVERY  =:P2 ',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              RightStr(DeliveryNoEdit.Text,4),
              CustomerNameEdit.Text,
              MemberCodeEdit.Text,
              Replace(MobileTelephoneEdit.Text,'-',''),
              Replace(HomeTelephoneEdit.Text,'-',''),
              Replace(EtcTelephoneEdit.Text,'-',''),
              Replace(Etc1TelephoneEdit.Text,'-',''),
              AddressMemo.Text,
              RemarkMemo.Text], True);

    DeliveryGridTableView.DataController.Values[DeliveryGridTableView.DataController.GetFocusedRecordIndex, 1] := CustomerNameEdit.Text;
    DeliveryGridTableView.DataController.Values[DeliveryGridTableView.DataController.GetFocusedRecordIndex, 2] := MobileTelephoneEdit.Text;
  end;


end;

//조회버튼 클릭 시
procedure TSystemDeliveryForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;
  OpenQuery('select NO_DELIVERY, '
           +'       NM_NAME, '
           +'       NO_TEL1, '
           +'       DS_STEP '
           +'from   SL_DELIVERY '
           +'where  CD_STORE     =:P0 '
           +'  and  YMD_DELIVERY =:P1 ',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date)]);
  ReadQuery(DeliveryGridTableView);
end;

//컴포트에서 값이 들어왔을때
procedure TSystemDeliveryForm.CIDComPortRxChar(Sender: TObject; Count: Integer);
var
  TempBuff : AnsiString;
begin
  inherited;
  TComPort(Sender).ReadStr(TempBuff, Count);
  CidData := CidData + TempBuff;

  if POS('P', CidData) > 0 then
  begin
    if POS('EPOS', CidData) = 0 then
      CidData := '';
    Exit;
  end;

  if (Pos(#3, CidData) > 0) then
  begin
    CidData := StringReplace(CidData,#2,'',[rfReplaceAll]);
    CidData := StringReplace(CidData,#3,'',[rfReplaceAll]);
    if Copy(CidData,2,1) = 'E' then
    begin
      CidData := '';
      TSBPosButton(FindComponent('CidLine'+Copy(CidData, 2, 1)+'Button')).Color.Face := clSilver;
    end
    else
    begin
      //1:회선, 2:구분(S:수화기들었을때, E:끊겼을때, C:전화가 왔을때
      CidData := Trim(CidData);

      if CidData[3] <> 'S' then
      begin
        TSBPosButton(FindComponent('CidLine'+Copy(CidData, 2, 1)+'Button')).Caption.Add( GetPhoneNo(Copy(CidData, 4, 12)), '');
        TSBPosButton(FindComponent('CidLine'+Copy(CidData, 2, 1)+'Button')).Caption.Add( GetPhoneNo(Copy(CidData, 4, 12)), '');
        TSBPosButton(FindComponent('CidLine'+Copy(CidData, 2, 1)+'Button')).Caption.Add( GetPhoneNo(Copy(CidData, 4, 12)), '');
        TSBPosButton(FindComponent('CidLine'+Copy(CidData, 2, 1)+'Button')).Color.Face := clBlue;
      end;

//      FCidTimer.Enabled := True;
//      FCidTimeOut       := False;
      //전화가 끊긴 상태에서 수화기를 들었을때를 체크하기 위함
//      FCidTimeOutTimer.Enabled := True;
//      FCidBuff := '';
    end;
  end;
end;

procedure TSystemDeliveryForm.CidTimerTimer(Sender: TObject);
var vRow:Integer;
begin
  CidTimer.Enabled := false;
  GetNewPhone(Copy(CidData, 2, 1), Copy(CidData, 4, 12));
  //CID Log와 부재중 리스트에 추가
  try
    ExecQuery('insert into SL_CID_LOG(CD_STORE, NO_TEL, DT_CALL, NO_LINE) '
             +'                values(:P0, :P1, GetDate(), :P2) ',
             [StoreCode,
              Copy(CidData, 4, 12),
              StrToIntDef(Copy(CidData, 2, 1),1)],
              true);
  except
  end;

  //기존 부재중에 존재하면 기존 부재중을 삭제한다
  vRow := OutGridTableView.DataController.FindRecordIndexByText(0, OutGridTableViewTeNo.Index, GetPhoneNo( Copy(CidData, 4, 12) ), false, false, true);
  if vRow >= 0 then
    OutGridTableView.DataController.DeleteRecord(vRow);

  //부재중 그리드에 추가한다
  OutGridTableView.DataController.AppendRecord;
  OutGridTableView.DataController.Values[OutGridTableView.DataController.RowCount-1, OutGridTableViewSeq.Index]      := OutGridTableView.DataController.RowCount;
  OutGridTableView.DataController.Values[OutGridTableView.DataController.RowCount-1, OutGridTableViewTeNo.Index]     := GetPhoneNo( Copy(CidData, 4, 12) );
  OutGridTableView.DataController.Values[OutGridTableView.DataController.RowCount-1, OutGridTableViewCustomer.Index] := TSBPosButton(FindComponent('CidLine'+Copy(CidData, 2, 1)+'Button')).Bottom.RightString;
  OutGridTableView.DataController.Values[OutGridTableView.DataController.RowCount-1, OutGridTableViewCallTime.Index] := FormatDateTime(fmtDateTimeLong, now());
end;



//신규전화가 왔을 때 배달버튼에 고객정보 표시
procedure TSystemDeliveryForm.GetNewPhone(aLine, aPhoneNo: String);
begin
  TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Caption.Clear;
  TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Caption.Add(GetPhoneNo(aPhoneNo),'');
  TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Temp1      := EmptyStr;
  TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Color.Face := $00FF8000;

  //회원인지 체크
  try
    OpenQuery('select Top 1 CD_MEMBER, NM_MEMBER '
             +'from   MS_MEMBER '
             +'where  CD_STORE =:P0 '
             +'  and  (Replace(TEL_MOBIL,''-'','''') =:P1 or Replace(TEL_HOME,''-'','''') =:P1 or Replace(TEL_JOB,''-'','''') =:P1 )',
             [Ifthen(GetOption(257)='0', StoreCode, '0000'),
              Copy(CidData,4,12)]);
    if not Query.Eof then
    begin
      TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Bottom.RightString := Query.Fields[1].AsString;
      TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Temp1              := Query.Fields[0].AsString;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  //매출처인지 체크
  try
    OpenQuery('select Top 1 CD_TRDPL, '
             +'       NM_TRDPL '
             +'from   MS_TRD '
             +'where  CD_STORE =:P0 '
             +'  and  (Replace(TEL_DAMDANG,''-'','''') =:P1 or Replace(TEL_OFFICE,''-'','''') =:P1 )',
             [StoreCode,
              Copy(CidData,4,12)]);
    if not Query.Eof then
    begin
      TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Bottom.RightString := Query.Fields[1].AsString;
      TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Temp1              := Query.Fields[0].AsString;
      Exit;
    end;
  finally
    FinishQuery;
  end;


  //배달이력이 있는지 체크
  try
    OpenQuery('select Top 1 NM_NAME '
             +'from   SL_DELIVERY '
             +'where  CD_STORE =:P0 '
             +'  and  (Replace(NO_TEL1,''-'','''') =:P1 or Replace(NO_TEL2,''-'','''') =:P1 or Replace(NO_TEL3,''-'','''') =:P1 or Replace(NO_TEL4,''-'','''') =:P1 )',
             [StoreCode,
              Copy(CidData,4,12)]);
    if not Query.Eof then
    begin
      TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Bottom.RightString := Query.Fields[0].AsString;
      Exit;
    end;
  finally
    FinishQuery;
  end;

  TSBPosButton(FindComponent('CidLine'+aLine+'Button')).Bottom.RightString := '신규고객';
end;

//회원조회버튼 클릭 시
procedure TSystemDeliveryForm.MemberSearchButtonClick(Sender: TObject);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := '회원번호';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '회원이름';
      GridTableViewName1.Width   := 320;

      SearchText := '';
      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER, '
                   +'         TEL_MOBIL, '
                   +'         TEL_HOME '
                   +'from     MS_MEMBER  '
                   +'where    CD_STORE  = :P0 '
                   +'  and   (CD_MEMBER =:P1 or NM_MEMBER like ''%''+:P1+''%'' or NO_JUMIN like ''%''+:P1+''%'' or NO_CARD like :P1 or TEL_MOBIL like ''%''+:P1 or TEL_HOME like ''%''+:P1 or TEL_JOB like ''%''+:P1) '
                   +'  and    DS_STATUS = ''0'' '
                   +'union all '
                   +'select   CD_TRDPL, '
                   +'         NM_TRDPL, '
                   +'         TEL_DAMDANG, '
                   +'         TEL_OFFICE '
                   +'from     MS_TRD '
                   +'where    CD_STORE = '''+StoreCode+''''
                   +'  and    (CD_TRDPL = :P1 or NM_TRDPL like ''%''+:P1+''%'' or NO_CARD =:P1 or TEL_DAMDANG like ''%''+:P1 or TEL_OFFICE like ''%''+:P1) '
                   +'  and    DS_STATUS = ''0'' '
                   +'order by 2 ';
      StoreCode := Ifthen(GetOption(257)='0', StoreCode,'0000');
      if ShowModal = mrOK then
      begin
        MemberCodeEdit.Text      := Code;
        CustomerNameEdit.Text    := Names[0];
        MobileTelephoneEdit.Text := GetPhoneNo(Names[1]);
        HomeTelephoneEdit.Text   := GetPhoneNo(Names[2]);
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

procedure TSystemDeliveryForm.MobileTelephoneEditExit(Sender: TObject);
begin
  inherited;
  (Sender as TcxTextEdit).Text := GetPhoneNo((Sender as TcxTextEdit).Text);
end;


//배달그리드에 Row 변경시
procedure TSystemDeliveryForm.DeliveryGridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if DeliveryGridTableView.DataController.RowCount = 0 then
  begin
    DeliveryPanel.Enabled := false;
    Exit;
  end;

  try
    OpenQuery('select * '
             +'from   SL_DELIVERY '
             +'where  CD_STORE     =:P0 '
             +'  and  YMD_DELIVERY = Convert(Varchar(8), GetDate(), 120) '
             +'  and  NO_DELIVERY  =:P1 ',
             [StoreCode,
              DeliveryGridTableView.DataController.Values[DeliveryGridTableView.DataController.GetFocusedRecordIndex, DeliveryGridTableViewDeliveryNo.Index]]);

    if not Query.Eof then
    begin
      DeliveryPanel.Enabled    := true;
      DeliveryNoEdit.Text      := Query.FieldByName('YMD_DELIVERY').AsString + '-' + Query.FieldByName('NO_DELIVERY').AsString;
      DeliveryTimeEdit.Text    := FormatDateTime(fmtDateTimeLong, Query.FieldByName('DT_ORDER').AsDateTime);
      CustomerNameEdit.Text    := Query.FieldByName('NM_NAME').AsString;
      MemberCodeEdit.Text      := Query.FieldByName('CD_MEMBER').AsString;
      MobileTelephoneEdit.Text := GetPhoneNo(Query.FieldByName('NO_TEL1').AsString);
      HomeTelephoneEdit.Text   := GetPhoneNo(Query.FieldByName('NO_TEL2').AsString);
      EtcTelephoneEdit.Text    := GetPhoneNo(Query.FieldByName('NO_TEL3').AsString);
      Etc1TelephoneEdit.Text   := GetPhoneNo(Query.FieldByName('NO_TEL4').AsString);
      AddressMemo.Text         := Query.FieldByName('ADDRESS1').AsString;
    end
    else DeliveryPanel.Enabled := false;
  finally
    FinishQuery;
  end;
  GetDeliveryHistory;
end;

//배달이력 조회
procedure TSystemDeliveryForm.GetDeliveryHistory;
begin
  try
    OpenQuery('select top 30 '
             +'       dbo.StoD(d.YMD_DELIVERY) as YMD_DELIVERY, '
             +'       h.AMT_SALE, '
             +'       case h.AMT_SALE when h.AMT_CASH+h.AMT_CASHRCP+h.AMT_CHECK then ''현금'' '
             +'                       when h.AMT_CARD then ''카드'' '
             +'                       when h.AMT_TRUST then ''외상'' '
             +'       else ''기타'' end as DS_ACCT '
             +'from   SL_DELIVERY d left outer join '
             +'       SL_SALE_H   h on h.CD_STORE = d.CD_STORE and h.NO_DELIVERY = d.YMD_DELIVERY+d.NO_DELIVERY and h.DS_SALE <> ''V'' '
             +'where  h.CD_STORE = :P0 '
             +'  and  (    (d.NO_TEL1 = :P1 or d.NO_TEL1 = :P2 or d.NO_TEL1 = :P3 or d.NO_TEL1 = :P4) '
             +'         or (d.NO_TEL2 = :P1 or d.NO_TEL2 = :P2 or d.NO_TEL2 = :P3 or d.NO_TEL2 = :P4) '
             +'         or (d.NO_TEL3 = :P1 or d.NO_TEL3 = :P2 or d.NO_TEL3 = :P3 or d.NO_TEL3 = :P4) '
             +'         or (d.NO_TEL4 = :P1 or d.NO_TEL4 = :P2 or d.NO_TEL4 = :P3 or d.NO_TEL4 = :P4) '
             +'        ) '
             +'order by d.YMD_DELIVERY desc',
             [StoreCode,
              Replace(MobileTelephoneEdit.Text,'-',''),
              Replace(HomeTelephoneEdit.Text,'-',''),
              Replace(EtcTelephoneEdit.Text,'-',''),
              Replace(Etc1TelephoneEdit.Text,'-','')]);
     ReadQuery(HistoryGridTableView);
  finally
    FinishQuery;
  end;
end;
end.
