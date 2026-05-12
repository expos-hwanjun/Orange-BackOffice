unit StoreMartStore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers,
  cxClasses, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, cxCurrencyEdit, cxGroupBox, cxMemo,
  cxSpinEdit, cxButtonEdit, Vcl.StdCtrls, AdvOfficePager, StrUtils, DateUtils,
  Math, dxBarBuiltInMenu, cxPC, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePagerStylers,
  REST.Client, System.JSON, REST.Types, Winapi.TlHelp32, Winapi.ActiveX;

type
  TStoreMartStoreForm = class(TInheritGridEditForm)
    GridTableViewCode: TcxGridColumn;
    GridTableViewName: TcxGridColumn;
    GridTableViewPartner: TcxGridColumn;
    ToolBarCompanyCodeEdit: TcxButtonEdit;
    ToolBarCompanyNameLabel: TcxLabel;
    GridTableViewSolution: TcxGridColumn;
    GridTableViewCompany: TcxGridColumn;
    cxPageControl1: TcxPageControl;
    StoreInfoOfficePager: TcxTabSheet;
    GoodsCodeLabel: TLabel;
    GoodsNameLabel: TLabel;
    MenuClassLabel: TLabel;
    CEONameLabel: TLabel;
    IDNoLabel: TLabel;
    OfficeTelLabel: TLabel;
    AddrLabel: TLabel;
    PosAllowLabel: TLabel;
    UseYNLabel: TLabel;
    RemarkLabel: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    DemoEndLabel: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    KioskAllowLabel: TLabel;
    CustomerCodeEdit: TcxTextEdit;
    CustomerNameEdit: TcxTextEdit;
    PartnerNameEdit: TcxTextEdit;
    CEONameEdit: TcxTextEdit;
    BizNoEdit: TcxMaskEdit;
    OfficeTelEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    PosCountEdit: TcxSpinEdit;
    StatusComboBox: TcxComboBox;
    RemarkMemo: TcxMemo;
    MobileTelEdit: TcxTextEdit;
    PartnerCodeEdit: TcxButtonEdit;
    SetupDateEdit: TcxDateEdit;
    cxGroupBox1: TcxGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    VanComboBox: TcxComboBox;
    VanTypeComboBox: TcxComboBox;
    LocalComboBox: TcxComboBox;
    SizeComboBox: TcxComboBox;
    StoreCodeEdit: TcxTextEdit;
    SmsRemainEdit: TcxCurrencyEdit;
    CompanyNameEdit: TcxTextEdit;
    CompanyCodeEdit: TcxButtonEdit;
    ProgramComboBox: TcxComboBox;
    AppLicenseEdit: TcxSpinEdit;
    KioskCountEdit: TcxSpinEdit;
    HistoryPage: TcxTabSheet;
    cxGrid1: TcxGrid;
    HistoryGridTableView: TcxGridTableView;
    HistoryGridTableViewHistoryDate: TcxGridColumn;
    HistoryGridTableViewWorkType: TcxGridColumn;
    HistoryGridTableViewColumn17: TcxGridColumn;
    HistoryGridTableViewStoreName: TcxGridColumn;
    HistoryGridTableViewColumn1: TcxGridColumn;
    HistoryGridTableViewColumn2: TcxGridColumn;
    HistoryGridTableViewColumn3: TcxGridColumn;
    HistoryGridTableViewColumn4: TcxGridColumn;
    HistoryGridTableViewColumn5: TcxGridColumn;
    HistoryGridTableViewColumn6: TcxGridColumn;
    HistoryGridTableViewColumn7: TcxGridColumn;
    HistoryGridTableViewColumn11: TcxGridColumn;
    HistoryGridTableViewColumn12: TcxGridColumn;
    HistoryGridTableViewColumn13: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    EtcPage: TcxTabSheet;
    DBLinkGroupBox: TcxGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    DBLinkLabel: TLabel;
    DBLink2Label: TLabel;
    DBLink2PosLabel: TLabel;
    DBLinkPosLabel: TLabel;
    Label17: TLabel;
    DBIPEdit: TcxTextEdit;
    DBNameEdit: TcxTextEdit;
    DBPortEdit: TcxTextEdit;
    UserEdit: TcxTextEdit;
    UserPassEdit: TcxTextEdit;
    SyncPosPortEdit: TcxTextEdit;
    OKButton: TAdvGlowButton;
    DBPosLinkMemo: TcxMemo;
    DBLinkMemo: TcxMemo;
    RestPortEdit: TcxCurrencyEdit;
    RestAPIEdit: TcxTextEdit;
    RustDeskTabSheet: TcxTabSheet;
    cxGrid2: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1PosNo: TcxGridColumn;
    GridTableView1Device: TcxGridColumn;
    GridTableView1RustDeskID: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    CreateLetsOrderButton: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure PartnerCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OKButtonClick(Sender: TObject);
    procedure ToolBarCompanyCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EtcPagexShow(Sender: TObject);
    procedure ToolBarCompanyCodeEditPropertiesChange(Sender: TObject);
    procedure ProgramComboBoxPropertiesChange(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure RustDeskTabSheetShow(Sender: TObject);
    procedure GridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure CreateLetsOrderButtonClick(Sender: TObject);
  private
    CompanyCode,
    PartnerCode,
    PartnerName,
    PartnerPrefix,
    SolutionType,
    NewStore :String;
    procedure SetSolutionComboBox(aGubun:String);
    function  SetDataBase:String;
    procedure RustDeskShow;
    procedure SetLetOrderStore(aHeadStore, aStoreCode, aStoreName: String);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  StoreMartStoreForm: TStoreMartStoreForm;

implementation
uses Common, DBModule, UnitZipPopup, Help;

{$R *.dfm}

{ TStoreMartStoreForm }
procedure TStoreMartStoreForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  isLoading := true;
  cxPageControl1.ActivePageIndex := 0;



  ProgramComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'M';;
  ProgramComboBox.Properties.Items.AddObject('유통', TObject(vCode));
  New(vCode);
  vCode^.Data := 'E';;
  ProgramComboBox.Properties.Items.AddObject('ERP', TObject(vCode));
  New(vCode);
  vCode^.Data := 'T';;
  ProgramComboBox.Properties.Items.AddObject('테마파크', TObject(vCode));
  New(vCode);
  vCode^.Data := 'S';;
  ProgramComboBox.Properties.Items.AddObject('사우나', TObject(vCode));

  VanTypeComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';;

  New(vCode);
  vCode^.Data := 'I';;
  VanTypeComboBox.Properties.Items.AddObject('IC인증', TObject(vCode));
  New(vCode);
  vCode^.Data := 'V';;
  VanTypeComboBox.Properties.Items.AddObject('가상단말기', TObject(vCode));
  New(vCode);
  vCode^.Data := 'C';;
  VanTypeComboBox.Properties.Items.AddObject('단말기연동', TObject(vCode));

  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''0'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('인증완료', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''1'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('해지', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''2'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('일시중지', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''D'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('데모', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''E'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('데모종료', TObject(vCode));
  New(vCode);
  vCode^.Data := '';
  ConditionToolBarComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;

  StatusComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  StatusComboBox.Properties.Items.AddObject('정상', TObject(vCode));
  New(vCode);
  vCode^.Data := '1';
  StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
  New(vCode);
  vCode^.Data := '2';
  StatusComboBox.Properties.Items.AddObject('일시중지', TObject(vCode));
  New(vCode);
  vCode^.Data := 'D';
  StatusComboBox.Properties.Items.AddObject('데모', TObject(vCode));

  //협력사 권한일때는 협력사고정
  StandaloneCode := '00000000';
  if UserLevel = 'P' then
  begin
    try
      OpenQuery('select CD_PARTNER, '
               +'       NM_PARTNER, '
               +'       DISCERN, '
               +'       YN_NEWSTORE, '
               +'       CD_STANDALONE '
               +'  from PARTNER '
               +' where CD_PARTNER = (select CD_PARTNER '
               +'                       from USER_MASTER '
               +'                      where ID_USER =:P0) ',
               [UserCode],false,RestBaseURL);
      if not Query.Eof then
      begin
        PartnerCode   := Query.Fields[0].AsString;
        PartnerName   := Query.Fields[1].AsString;
        PartnerPrefix := Query.Fields[2].AsString;
        NewStore      := Query.Fields[3].AsString;
        StandaloneCode := Query.Fields[4].AsString;
      end;
    finally
      FinishQuery;
    end;
    AppLicenseEdit.Enabled := false;
  end
  else
  begin
    PartnerCode   := '0001';
    PartnerName   := '익스트림포스';
    PartnerPrefix := 'AA';
    NewStore      := 'Y';
    StandaloneCode := '';
    AppLicenseEdit.Enabled := true;
    SyncPosPortEdit.Properties.ReadOnly := false;
    DBPortEdit.Properties.ReadOnly      := false;
  end;
  isChanged := false;
  isLoading := false;
end;

procedure TStoreMartStoreForm.GridTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if Trim(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1RustDeskID.Index]) = '' then
  begin
    MsgBox('원격정보가 없습니다');
    Exit;
  end;
  if not AskBox('원격제어를 하시겠습니까?') then Exit;
  if not RunningProgram('rustdesk.exe') then
  begin
    if not FileExists(ExtractFileName(Application.ExeName)+'RustDesk.exe') then
      FileDownLoad('RustDesk.exe', ExtractFileName(Application.ExeName));
    GetDosOutput('rustdesk.exe --silent-install', ExtractFileName(Application.ExeName));
    while not RunningProgram('rustdesk.exe') do
      Application.ProcessMessages;
  end;

  ExecuteProgram('C:\Program Files\RustDesk\','rustdesk.exe', Format('--connect %s --password exPos15444171',[GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, GridTableView1RustDeskID.Index]]),true);

end;

procedure TStoreMartStoreForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewSolution.Index] = 'ERP' then
    AStyle := StyleFontBlue;

end;

procedure TStoreMartStoreForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  //사우나                                                      //Format('http://%s:18099/Orange/',[DBIPEdit.Text])
  if GetStrPointerData(ProgramComboBox) = 'S' then
  begin
    DBPosLinkMemo.Text := Encrypt(Format('%s|%s|%S|%S',
                                        [CompanyCodeEdit.Text,
                                         CustomerCodeEdit.Text,
                                         Format('http://%s:18099/Orange/',[DBIPEdit.Text]),
                                         StoreCodeEdit.Text]),2843);

    DBLinkMemo.Text := Encrypt(Format('%s|%s|%S|%S',
                                        [CompanyCodeEdit.Text,
                                         CustomerCodeEdit.Text,
                                         Format('http://%s:18099/Orange/',[DBIPEdit.Text]),
                                         StoreCodeEdit.Text]),2843);
  end
  else
  begin
    DBPosLinkMemo.Text := Encrypt(Format('%s|%s|%s|%s|%s|%s|%s|%s|',
                                     [DBIPEdit.Text,
                                      DBNameEdit.Text,
                                      DBPortEdit.Text,
                                      UserEdit.Text,
                                      UserPassEdit.Text,
                                      SyncPosPortEdit.Text,
                                      StoreCodeEdit.Text,
                                      CustomerCodeEdit.Text]),2843);
    DBLinkMemo.Text := Encrypt(Format('%s|%s|%s|%s|%s|%s|%s|%s|',
                                      [DBIPEdit.Text,
                                       DBNameEdit.Text,
                                       DBPortEdit.Text,
                                       UserEdit.Text,
                                       UserPassEdit.Text,
                                       SyncPosPortEdit.Text,
                                       Ifthen(SolutionType = 'EF','',StoreCodeEdit.Text),
                                       CustomerCodeEdit.Text]),2843);
  end;

  isChanged := true;
end;

procedure TStoreMartStoreForm.PartnerCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '협력사조회';
      GridTableViewCode.Caption  := '협력사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '협력사 이름';
      GridTableViewName1.Width   := 320;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_PARTNER, '
                   +'       NM_PARTNER, '
                   +'       DISCERN '
                   +'  from PARTNER '
                   +' where NM_PARTNER  like ConCat(''%'',:P2,''%'') '
                   +'   and YN_USE = ''Y'' '
                   +'order by CD_PARTNER';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        PartnerCodeEdit.Text     := Code;
        PartnerCodeEdit.TextHint := Names[0];
        PartnerNameEdit.Text     := Names[0];
        PartnerNameEdit.Hint     := Names[1];
        isChanged := true;

        if isNew then
        begin
          OpenQuery('select Ifnull(Max(CD_CUSTOMER),0) '
                   +'  from CUSTOMER '
                   +' where Left(CD_CUSTOMER,2) = :P0 '
                   +'   and Length(CD_CUSTOMER) = 8 ',
                   [PartnerNameEdit.Hint],false,RestBaseURL);

          if Query.Fields[0].AsString = '0' then
            CustomerCodeEdit.Text := PartnerNameEdit.Hint + '000001'
          else
            CustomerCodeEdit.Text := PartnerNameEdit.Hint + FormatFloat('000000', StrToInt(Copy(Query.Fields[0].AsString,3,6))+1);
          CustomerCodeEdit.TextHint := CustomerCodeEdit.Text;
          Query.Close;

          CustomerNameEdit.SetFocus;
        end;
      end;
    finally
      Free;
    end;

end;

procedure TStoreMartStoreForm.ProgramComboBoxPropertiesChange(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  if ToolBarCompanyNameLabel.Hint <>'MS' then Exit;

  if isLoading then Exit;

  if (GetStrPointerData(ProgramComboBox) = 'M') or (GetStrPointerData(ProgramComboBox) = 'E') then
  begin
    CompanyCodeEdit.Enabled        := false;

    DBLinkPosLabel.Visible  := false;
    DBLink2Label.Visible    := false;
    DBLink2PosLabel.Visible := false;
    DBLinkMemo.Visible     := false;
  end
  else if GetStrPointerData(ProgramComboBox) = 'S' then
  begin
    DBLinkPosLabel.Visible   := true;
    DBLink2Label.Visible     := false;
    DBLink2PosLabel.Visible  := false;
    DBPosLinkMemo.Visible    := true;
    DBLinkMemo.Visible       := false;
  end
  else
  begin
    StoreCodeEdit.Properties.ReadOnly := false;
    ToolBarCompanyCodeEdit.Enabled    := true;
    CompanyCodeEdit.Enabled           := true;
    DBLinkPosLabel.Visible            := true;
    DBLink2Label.Visible              := true;
    DBLink2PosLabel.Visible           := true;
    DBLinkMemo.Visible                := true;
  end;
end;

procedure TStoreMartStoreForm.RustDeskShow;
var vURL :String;
begin
  vURL := SetDataBase;
  DM.OpenQuery('select NM_CODE1  as NO_POS, '
              +'       NM_CODE4  as DEVICE, '
              +'       GetOnlyNumber(NM_CODE21) as RUSTDESK_ID '
              +'  from MS_CODE '
              +' where CD_STORE =:P0 '
              +'   and CD_KIND  =''01'' ',
              [StoreCodeEdit.Text], false, vURL);
  DM.ReadQuery(DM.Query, GridTableView1);
end;

procedure TStoreMartStoreForm.RustDeskTabSheetShow(Sender: TObject);
begin
  inherited;
  RustDeskShow;
end;

procedure TStoreMartStoreForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ToolBarCompanyCodeEdit.Enabled := not isChanged;
end;

function TStoreMartStoreForm.SetDataBase:String;
var vURL :String;
begin
  try
    OpenQuery('select DB_NAME, '
             +'       DB_IP, '
             +'       DB_PORT, '
             +'       DB_USER_ID, '
             +'       DB_USER_PWD, '
             +'       SYNCPOS_PORT, '
             +'       REST_PORT, '
             +'       REST_API '
             +'  from COMPANY '
             +' where CD_COMPANY =:P0 ',
             [CompanyCodeEdit.Text],false,RestBaseURL);
    if not Query.Eof then
    begin
      DBIPEdit.Text        := Query.FieldByName('DB_IP').AsString;
      UserEdit.Text        := Query.FieldByName('DB_USER_ID').AsString;
      UserPassEdit.Text    := Query.FieldByName('DB_USER_PWD').AsString;
      DBPortEdit.Text      := Query.FieldByName('DB_PORT').AsString;
      SyncPosPortEdit.Text := Query.FieldByName('SYNCPOS_PORT').AsString;
      DBNameEdit.Text      := Query.FieldByName('DB_NAME').AsString;
      RestPortEdit.Text    := Query.FieldByName('REST_PORT').AsString;
      RestAPIEdit.Text     := Query.FieldByName('REST_API').AsString;
      vURL                 := Format('http://%s:%s/%s/|',[DBIPEdit.Text,Query.FieldByName('REST_PORT').AsString,Query.FieldByName('REST_API').AsString]);
      Result                 := Format('http://%s:%s/%s/|%s',[DBIPEdit.Text,Query.FieldByName('REST_PORT').AsString,Query.FieldByName('REST_API').AsString,DBNameEdit.Text]);
    end;
    Query.Close;

    if isNew then
    begin
      DM.OpenQuery('select Ifnull(Max(CD_STORE),0) '
               +'  from MS_STORE ',
                DBNameEdit.Text,
               [],false,vURL);

      if not DM.Query.Eof then
        StoreCodeEdit.Text := FormatFloat('0000',DM.Query.Fields[0].AsInteger + 1)
      else
        StoreCodeEdit.Text := '0001';
      DM.Query.Close;
    end;
  finally
    Query.Close;
  end;
end;

procedure TStoreMartStoreForm.SetLetOrderStore(aHeadStore, aStoreCode, aStoreName: String);
var vRestClient   :TRestClient;
    vRestRequest  :TRestRequest;
    vRESTResponse :TRESTResponse;
    vJSONDetailArray    :TJSONArray;
    vDataObject,
    vJSONObject   :TJSONObject;
    vGUID : TGUID;
    vURL, vData, vToken :String;
    vTemp :String;
begin
  vToken := LetsOrderAuth(aHeadStore);
  if vToken = '' then Exit;
  vToken := 'Bearer '+Replace(vToken,'"','');
  vURL := GetLetsOrderURL(aHeadStore);
  vURL := Format('%s/s2s/groups/%s/stores/%s/store',[vURL,aHeadStore,LowerCase(aStoreCode)]);

  try
    BlockInput(false);
    vRestClient                := TRestClient.Create(nil);
    vRestRequest               := TRestRequest.Create(nil);
    vRESTResponse              := TRESTResponse.Create(vRestRequest);
    vRestRequest.Client        := vRestClient;
    vRestRequest.Response      := vRESTResponse;
    vRestClient.BaseURL        := vURL;
    vRESTClient.Accept         := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRestRequest.Method        := TRESTRequestMethod.rmPOST;
    CoCreateGuid(vGUID);
    vRestRequest.Params.AddHeader('X-Message-Id', GUIDToString(vGUID));
    vRestRequest.Params.AddHeader('Authorization', vToken);
    vRestRequest.URLAlreadyEncoded := true;

    vDataObject    := TJSONObject.Create;
    vDataObject.AddPair('headquarter_name',    TJSONString.Create('mart'));
    vDataObject.AddPair('store_name',    TJSONString.Create(aStoreName));
    vDataObject.AddPair('business_introduce',    TJSONString.Create(''));
    vDataObject.AddPair('business_hours',    TJSONString.Create(''));
    vDataObject.AddPair('holiday',    TJSONString.Create(''));
    vDataObject.AddPair('break_time',    TJSONString.Create('00:00~00:00'));
    vDataObject.AddPair('owner_name',    TJSONString.Create(CEONameEdit.Text));
    vDataObject.AddPair('business_number',    TJSONString.Create(GetOnlyNumber(BizNoEdit.Text)));
    vDataObject.AddPair('business_type',    TJSONString.Create(''));
    vDataObject.AddPair('business_item',    TJSONString.Create(''));
    vDataObject.AddPair('zip_code',    TJSONString.Create(''));
    vDataObject.AddPair('address_line1',    TJSONString.Create(Addr1Edit.Text));
    vDataObject.AddPair('address_line2',    TJSONString.Create(Addr2Edit.Text));
    vDataObject.AddPair('email',    TJSONString.Create(''));
    vDataObject.AddPair('mobile_phone_number',    TJSONString.Create(GetOnlyNumber(MobileTelEdit.Text)));
    vDataObject.AddPair('store_phone_number',    TJSONString.Create(GetOnlyNumber(OfficeTelEdit.Text)));
    vDataObject.AddPair('store_options',    TJSONString.Create('1100000001002000010000111000000000100010001000001001011001000101000010100110110100400101000002040030202011310101100110000200'));
    vDataObject.AddPair('origin_information',    TJSONString.Create(''));
    vDataObject.AddPair('required_menu',    TJSONString.Create(''));
    vDataObject.AddPair('store_message',    TJSONString.Create(''));
    vDataObject.AddPair('store_status',    TJSONString.Create('O'));
    vDataObject.AddPair('pg_mid',    TJSONString.Create(''));
    vDataObject.AddPair('pg_midkey',    TJSONString.Create(''));
    vJSONDetailArray    := TJSONArray.Create;
    vJSONDetailArray.Add(vDataObject);


    vJSONObject    := TJSONObject.Create;
    vJSONObject.AddPair('store',      vJSONDetailArray);
    vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    vTemp := vJSONObject.ToJSON;
    try
      vRESTRequest.Execute;
    except
      Exit;
    end;

    if vRestRequest.Response.StatusCode = 200 then
    begin
      MsgBox('정상 처리되었습니다');
      Exit;
    end;

    vData := vRESTResponse.Content;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('error').ToJson;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('message').ToJson;
//    ErrBox('LetsOrder 매장삭제 오류'+#13+vData);
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

procedure TStoreMartStoreForm.SetSolutionComboBox(aGubun: String);
var
  vCode : PStrPointer;
begin
  isLoading := true;
  ProgramComboBox.Properties.Items.Clear;
  if aGubun = 'MS' then
  begin
    New(vCode);
    vCode^.Data := 'M';
    ProgramComboBox.Properties.Items.AddObject('유통', TObject(vCode));
    New(vCode);
    vCode^.Data := 'T';
    ProgramComboBox.Properties.Items.AddObject('테마파크', TObject(vCode));
    ProgramComboBox.ItemIndex := 0;
  end;
  //ERP 단독
  if aGubun = 'ES' then
  begin
    New(vCode);
    vCode^.Data := 'E';
    ProgramComboBox.Properties.Items.AddObject('ERP', TObject(vCode));
    ProgramComboBox.ItemIndex := 0;
  end;
  if aGubun = 'EF' then
  begin
    New(vCode);
    vCode^.Data := 'E';
    ProgramComboBox.Properties.Items.AddObject('ERP', TObject(vCode));
    ProgramComboBox.ItemIndex := 0;
  end;
  if aGubun = 'SS' then
  begin
    New(vCode);
    vCode^.Data := 'S';;
    ProgramComboBox.Properties.Items.AddObject('사우나', TObject(vCode));
    ProgramComboBox.ItemIndex := 0;
  end;
  if aGubun = 'TF' then
  begin
    New(vCode);
    vCode^.Data := 'T';
    ProgramComboBox.Properties.Items.AddObject('테마파크', TObject(vCode));
    ProgramComboBox.ItemIndex := 0;
  end;

  SolutionType := aGubun;
end;

procedure TStoreMartStoreForm.ToolBarCompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '본사조회';
      GridTableViewCode.Caption  := '본사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '본사 이름';
      GridTableViewName1.Width   := 320;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '솔루션';
      GridTableViewName2.Width   := 100;
      GridTableViewName2.PropertiesClassName       := 'TcxLabelProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;

      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_COMPANY, '
                   +'       NM_COMPANY, '
                   +'       case DS_COMPANY when ''MS'' then ''Cloud Mart'' when ''EF'' then ''ERP Chain'' when ''SS'' then ''Cloud Sauna'' when ''TF'' then ''테마파크'' when ''ES'' then ''Cloud ERP'' end DS_COMPANY, '
                   +'       DS_COMPANY as DS_SOLOUTION '
                   +'  from COMPANY '
                   +' where NM_COMPANY  like ConCat(''%'',:P2,''%'') '
                   +'   and DS_COMPANY in (''MS'',''EF'',''SS'',''TF'',''ES'') '
                   +Ifthen(UserLevel='P',Format(' and (CD_PARTNER = ''%s'' or DS_COMPANY = ''SS'') ',[PartnerCode]),'')
                   +'   and YN_USE = ''Y'' '
                   +'order by CD_COMPANY';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        ToolBarCompanyCodeEdit.Text     := Code;
        ToolBarCompanyCodeEdit.TextHint := Code;
        ToolBarCompanyNameLabel.Caption := Names[0];
        ToolBarCompanyNameLabel.Hint    := Names[2];

        isLoading := true;
        isLoading := false;
        isChanged := false;
        Self.ButtonToolBarNewButton.Visible := true;
        Self.ButtonToolBar.Refresh;
      end;
    finally
      Free;
    end;

  SetSolutionComboBox(ToolBarCompanyNameLabel.Hint);
end;

procedure TStoreMartStoreForm.ToolBarCompanyCodeEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if ToolBarCompanyCodeEdit.Text <> ToolBarCompanyCodeEdit.TextHint then
  begin
    ToolBarCompanyNameLabel.Clear;
    ToolBarCompanyCodeEdit.TextHint := '';
    ToolBarCompanyNameLabel.Hint    := '';
    ClearGrid;
    Self.ButtonToolBarNewButton.Visible := false;
    Self.ButtonToolBar.Refresh;
  end;
end;

procedure TStoreMartStoreForm.ZipCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  vZipNo, vRoadAddr, vJibunAddr: string;
begin
  inherited;
  if TFrmZipPopup.Execute(vZipNo, vRoadAddr, vJibunAddr) then
  begin
    ZipCodeEdit.Text := vZipNo;
    Addr1Edit.Text := vRoadAddr;
    Addr2Edit.Text := '';
    Addr2Edit.SetFocus;
  end;
end;

procedure TStoreMartStoreForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  if ToolBarCompanyCodeEdit.Text = '' then
  begin
    MsgBox('본사를 먼저 선택해야합니다.');
    Exit;
  end;

  inherited;
end;

procedure TStoreMartStoreForm.CompanyCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with THelpForm.Create(Self) do
    try
      Caption                    := '본사조회';
      GridTableViewCode.Caption  := '본사 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '본사 이름';
      GridTableViewName1.Width   := 320;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select CD_COMPANY, '
                   +'       NM_COMPANY, '
                   +'       DS_COMPANY '
                   +'  from COMPANY '
                   +' where NM_COMPANY  like ConCat(''%'',:P2,''%'') '
                   +Ifthen(UserLevel='E' ,'   and DS_COMPANY in (''ES'',''EF'',''MS'',''ES'') ', 'and DS_COMPANY in (''MS'',''ES'')')
                   +Ifthen(UserLevel='P',Format(' and CD_PARTNER = ''%s'' ',[PartnerCode]),'')
                   +'   and YN_USE = ''Y'' '
                   +'order by CD_COMPANY';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        CompanyCodeEdit.Text    := Code;
        CompanyNameEdit.Text    := Names[0];
        CompanyCodeEdit.TextHint:= Names[0];
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

procedure TStoreMartStoreForm.CreateLetsOrderButtonClick(Sender: TObject);
begin
  inherited;
  SetLetOrderStore('00000000',LowerCase(CustomerCodeEdit.Text), CustomerNameEdit.Text);
end;

function TStoreMartStoreForm.DoDelete: Boolean;
begin
  Result := ExecQuery('delete from CUSTOMER '
                     +' where CD_CUSTOMER = :P0;',
                     [CustomerCodeEdit.Text],true,RestBaseURL);
end;

procedure TStoreMartStoreForm.DoGridLink;
var
  vCode : PStrPointer;
  vStatus, vLocal, vUpjong, vSize, vVan :String;
  vIndex : Integer;
begin
  inherited;
  try
    OpenQuery('select a.CD_COMPANY, '
             +'       b.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       a.DS_CUSTOMER, '
             +'       a.CD_PARTNER, '
             +'       c.NM_PARTNER, '
             +'       a.CD_STORE, '
             +'       a.BIZ_NO, '
             +'       a.CEO_NAME, '
             +'       a.TEL_OFFICE, '
             +'       a.TEL_MOBILE, '
             +'       a.POST, '
             +'       a.ADDR1, '
             +'       a.ADDR2, '
             +'       a.ALLOW_POS, '
             +'       a.ALLOW_KIOSK, '
             +'       a.OPTIONS, '
             +'       a.POS_DEVICE, '
             +'       a.REMARK, '
             +'       a.DS_STATUS, '
             +'       a.YMD_SETUP, '
             +'       a.DS_LICENSE, '
             +'       a.CD_LOCAL, '
             +'       a.CD_MANAGER, '
             +'       a.CD_UPJONG, '
             +'       a.CD_STORESIZE, '
             +'       a.CD_VAN, '
             +'       a.DS_VAN, '
             +'       a.AMT_ASP, '
             +'       StoD(a.YMD_PAYEND) as YMD_PAYEND, '
             +'       a.STIPULATE_FROM, '
             +'       a.STIPULATE_TO, '
             +'       a.STIPULATE_COUNT, '
             +'       a.RENTAL_FEE, '
             +'       a.POS_VERSION, '
             +'       a.TR_VERSION, '
             +'       a.YN_POSUPDATE, '
             +'       b.OPTIONS as HEAD_OPTIONS, '
             +'       a.DB_LINK, '
             +'       a.DB_POSLINK, '
             +'       a.DB_IP, '
             +'       b.DB_USER_ID, '
             +'       b.DB_USER_PWD, '
             +'       b.DB_PORT, '
             +'       b.DB_NAME, '
             +'       b.SYNCPOS_PORT, '
             +'       b.DS_COMPANY, '
             +'       d.ERP_POSNO, '
             +'       b.REST_PORT, '
             +'       b.REST_API '
             +'  from CUSTOMER a left outer join '
             +'       COMPANY  b on b.CD_COMPANY   = a.CD_COMPANY left outer join '
             +'       PARTNER  c on c.CD_PARTNER   = a.CD_PARTNER left outer join '
             +'       CUSTOMER d on d.CD_CUSTOMER  = a.LETSORDER_STORE '
             +' where a.CD_CUSTOMER = :P0 ',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCode.Index]],false,RestBaseURL);

    if not Query.Eof then
    begin
      StoreCodeEdit.Enabled   := false;
      ProgramComboBox.Enabled := isNew;
      EtcPage.TabVisible := true;
      CompanyCodeEdit.Text    := Query.FieldByName('CD_COMPANY').AsString;
      CompanyNameEdit.Text    := Query.FieldByName('NM_COMPANY').AsString;

      PartnerCodeEdit.Text    := Query.FieldByName('CD_PARTNER').AsString;
      PartnerNameEdit.Text    := Query.FieldByName('NM_PARTNER').AsString;

      CustomerCodeEdit.Text    := Query.FieldByName('CD_CUSTOMER').AsString;
      CustomerNameEdit.Text    := Query.FieldByName('NM_CUSTOMER').AsString;
      ProgramComboBox.ItemIndex := GetStrPointerIndex(ProgramComboBox, Query.FieldByName('DS_CUSTOMER').AsString);
      StoreCodeEdit.Text       := Query.FieldByName('CD_STORE').AsString;
      BizNoEdit.Text           := Query.FieldByName('BIZ_NO').AsString;
      CEONameEdit.Text         := Query.FieldByName('CEO_NAME').AsString;
      OfficeTelEdit.Text       := GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString);
      MobileTelEdit.Text       := GetPhoneNo(Query.FieldByName('TEL_MOBILE').AsString);
      ZipCodeEdit.Text         := Query.FieldByName('POST').AsString;
      Addr1Edit.Text           := Query.FieldByName('ADDR1').AsString;
      Addr2Edit.Text           := Query.FieldByName('ADDR2').AsString;
      PosCountEdit.Value       := Query.FieldByName('ALLOW_POS').AsInteger;
      PosCountEdit.Tag         := Query.FieldByName('ALLOW_POS').AsInteger;
      KioskCountEdit.Value     := Query.FieldByName('ALLOW_KIOSK').AsInteger;
      KioskCountEdit.Tag       := Query.FieldByName('ALLOW_KIOSK').AsInteger;

      PosCountEdit.EditModified     := false;
      KioskCountEdit.EditModified   := false;

      VanTypeComboBox.ItemIndex := GetStrPointerIndex(VanTypeComboBox, Query.FieldByName('DS_VAN').AsString);
      vLocal   := Query.FieldByName('CD_LOCAL').AsString;
      vUpjong  := Query.FieldByName('CD_UPJONG').AsString;
      vSize    := Query.FieldByName('CD_STORESIZE').AsString;
      vVan     := Query.FieldByName('CD_VAN').AsString;

      RemarkMemo.Text          := Query.FieldByName('REMARK').AsString;
      vStatus                  := Query.FieldByName('DS_STATUS').AsString;
      PartnerCodeEdit.Text     := Query.FieldByName('CD_PARTNER').AsString;
      PartnerCodeEdit.TextHint := Query.FieldByName('CD_PARTNER').AsString;
      PartnerNameEdit.Text     := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPartner.Index];
      if Query.FieldByName('YMD_SETUP').AsString = '' then
        SetupDateEdit.Text       := EmptyStr
      else
        SetupDateEdit.Date       := StoD(Query.FieldByName('YMD_SETUP').AsString);
      SetupDateEdit.Enabled := false;
      CompanyCode             := Query.FieldByName('CD_COMPANY').AsString;
      DBPosLinkMemo.Text      := Query.FieldByName('DB_POSLINK').AsString;
      DBLinkMemo.Text         := Query.FieldByName('DB_LINK').AsString;
      DBIPEdit.Text           := Query.FieldByName('DB_IP').AsString;
      DBNameEdit.Text         := Query.FieldByName('DB_NAME').AsString;
      DBPortEdit.Text         := Query.FieldByName('DB_PORT').AsString;
      UserEdit.Text           := Query.FieldByName('DB_USER_ID').AsString;
      UserPassEdit.Text       := Query.FieldByName('DB_USER_PWD').AsString;
      SyncPosPortEdit.Text    := Query.FieldByName('SYNCPOS_PORT').AsString;
      SolutionType            := Query.FieldByName('DS_COMPANY').AsString;
      RestPortEdit.Text       := Query.FieldByName('REST_PORT').AsString;
      RestAPIEdit.Text        := Query.FieldByName('REST_API').AsString;

      if SyncPosPortEdit.Text = '' then
        SyncPosPortEdit.Text := '9911';
      StatusComboBox.EditModified := false;
    end;
  finally
    Query.Close;
  end;

  //데모일때는 상태를 변경할 수 있다
  DemoEndLabel.Visible := false;
  if vStatus = 'D' then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('인증완료', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
    New(vCode);
    vCode^.Data := 'D';
    StatusComboBox.Properties.Items.AddObject('데모', TObject(vCode));
    DemoEndLabel.Visible :=true;
    DemoEndLabel.Caption := Format(' 데모종료 - %s ',[FormatDateTime('yyyy년-mm월-dd일',IncDay(SetupDateEdit.CurrentDate,15))]);
  end
  else if vStatus = 'E' then
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('인증완료', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
    New(vCode);
    vCode^.Data := 'E';
    StatusComboBox.Properties.Items.AddObject('데모종료', TObject(vCode));
  end
  else
  begin
    StatusComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '0';
    StatusComboBox.Properties.Items.AddObject('인증완료', TObject(vCode));
    New(vCode);
    vCode^.Data := '1';
    StatusComboBox.Properties.Items.AddObject('해지', TObject(vCode));
    New(vCode);
    vCode^.Data := '2';
    StatusComboBox.Properties.Items.AddObject('일시중지', TObject(vCode));
    New(vCode);
    vCode^.Data := 'E';
    StatusComboBox.Properties.Items.AddObject('데모종료', TObject(vCode));

    //해지상태일때는 익스트림포스에서만 상태를 변경 할 수있다
    if (vStatus = '1') or (vStatus = '2') then
      StatusComboBox.Enabled := UserLevel = 'E';

    StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox, vStatus);
  end;

  StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox, vStatus);

  try
    OpenQuery('select AMT_CHARGE - AMT_USE + AMT_FAILURE '
             +'  from SMS_COUNT '
             +' where CD_CUSTOMER = :P0 ',
             [CustomerCodeEdit.Text],false,jsonSMSDBURL);
    if not Query.Eof then
      SmsRemainEdit.Value := Query.Fields[0].AsInteger
    else
      SmsRemainEdit.Value := 0;
  finally
    Query.Close;
  end;

  try
    OpenQuery('select LICENSE_CNT '
             +'  from MS_CUSTOMER '
             +' where CD_CUSTOMER = :P0 ',
             [CustomerCodeEdit.Text],false,jsonERPASPURL);
    if not Query.Eof then
      AppLicenseEdit.Value := Query.Fields[0].AsInteger
    else
      AppLicenseEdit.Value := 0;
    AppLicenseEdit.EditModified := false;
  finally
    Query.Close;
  end;

  if RustDeskTabSheet.Showing then
    RustDeskShow;
  isChanged := false;
end;

function TStoreMartStoreForm.DoNew: Boolean;
var
  vCode : PStrPointer;
  vJsonURL :String;
begin
  cxPageControl1.ActivePageIndex := 0;
  PartnerCodeEdit.Enabled := true;
  StoreCodeEdit.Enabled   := true;
  StatusComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '0';
  StatusComboBox.Properties.Items.AddObject('인증완료', TObject(vCode));
  New(vCode);
  vCode^.Data := 'D';
  StatusComboBox.Properties.Items.AddObject('데모', TObject(vCode));


  StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox, '0');
  SetupDateEdit.Date       := Now();
  SetupDateEdit.Enabled    := true;
  StoreCodeEdit.Text       :='0001';
  PartnerCodeEdit.SetFocus;

  //협력사권한일때
  PartnerCodeEdit.Text        := PartnerCode;
  PartnerNameEdit.Text        := PartnerName;
  PartnerNameEdit.Hint        := PartnerPrefix;
  if UserLevel = 'P' then
  begin
    PartnerCodeEdit.Text        := PartnerCode;
    PartnerNameEdit.Text        := PartnerName;
    PartnerNameEdit.Hint        := PartnerPrefix;

    PartnerCodeEdit.Enabled := false;
  end;

  if PartnerPrefix <> '' then
  begin
    OpenQuery('select Ifnull(Max(CD_CUSTOMER),0) '
             +'  from CUSTOMER '
             +' where Left(CD_CUSTOMER,2) = :P0 '
             +'   and Length(CD_CUSTOMER)= 8 ',
             [PartnerPrefix],false,RestBaseURL);

    if Query.Fields[0].AsString = '0' then
      CustomerCodeEdit.Text := PartnerPrefix + '000001'
    else
      CustomerCodeEdit.Text := PartnerPrefix + FormatFloat('000000', StrToInt(Copy(Query.Fields[0].AsString,3,6))+1);

    PartnerNameEdit.Hint := PartnerPrefix;
    Query.Close;
  end;

  CompanyCodeEdit.Text     :=  ToolBarCompanyCodeEdit.Text;
  CompanyNameEdit.Text     :=  ToolBarCompanyNameLabel.Caption;
  CompanyCodeEdit.TextHint := ToolBarCompanyNameLabel.Caption;

  if ToolBarCompanyNameLabel.Hint = 'MS' then
    ProgramComboBox.Enabled := true;
  SetSolutionComboBox(ToolBarCompanyNameLabel.Hint);

  SetDataBase;
  EtcPage.TabVisible := false;
  CustomerNameEdit.SetFocus;
  Result := true;
end;

function TStoreMartStoreForm.DoSave: Boolean;
var vOption :String;
    vCompanyCode,
    vURL :String;
begin
  Result := false;

  if PartnerCodeEdit.Text='' then
  begin
    MsgBox('협력사를 지정해야합니다');
    Exit;
  end;

  if Length(StoreCodeEdit.Text) <> 4 then
  begin
    MsgBox('매장코드를 정확히 입력하세요');
    StoreCodeEdit.SetFocus;
    Exit;
  end;

  if (PosCountEdit.Value = 0) and not AskBox('포스수량이 0개 입니다'#13'저장하시겠습니까?')  then
    Exit;

  try
    if isNew then
    begin
      if GetStrPointerData(ProgramComboBox) = 'M' then
      begin
        try
          OpenQuery('select NM_CUSTOMER '
                   +'  from CUSTOMER '
                   +' where DS_CUSTOMER <> ''O'' '
                   +'   and CD_PARTNER = :P0 '
                   +'   and CD_STORE   = :P1 ',
                   [PartnerCode,
                    StoreCodeEdit.Text],false,RestBaseURL);

          if not Query.Eof then
          begin
            MsgBox(Format('[%s]는 %s 매장에 등록된 매장코드입니다',[StoreCodeEdit.Text, Query.Fields[0].AsString]));
            Exit;
          end;
        finally
          Query.Close;
        end;

      end;

      OpenQuery('select Ifnull(Max(CD_CUSTOMER),0) '
               +'  from CUSTOMER '
               +' where Left(CD_CUSTOMER,2) = :P0 '
               +'   and Length(CD_CUSTOMER)= 8 ',
               [PartnerNameEdit.Hint],false,RestBaseURL);

      if Query.Fields[0].AsString = '0' then
        CustomerCodeEdit.Text := PartnerNameEdit.Hint + '000001'
      else
        CustomerCodeEdit.Text := PartnerNameEdit.Hint + FormatFloat('000000', StrToInt(Copy(Query.Fields[0].AsString,3,6))+1);
      Query.Close;
    end;

    vCompanyCode := CompanyCodeEdit.Text;
    vURL := Format('http://%s:%s/%s/',[DBIPEdit.Text,RestPortEdit.Text,RestAPIEdit.Text]);

    Result := ExecQuery(Ifthen(isNew,'insert into CUSTOMER(CD_CUSTOMER, '
                                    +'                     NM_CUSTOMER, '
                                    +'                     DS_CUSTOMER, '
                                    +'                     CD_COMPANY, '
                                    +'                     CD_PARTNER, '
                                    +'                     BIZ_NO, '
                                    +'                     CEO_NAME, '
                                    +'                     POST, '
                                    +'                     ADDR1, '
                                    +'                     ADDR2, '
                                    +'                     TEL_OFFICE, '
                                    +'                     TEL_MOBILE, '
                                    +'                     ALLOW_POS, '
                                    +'                     ALLOW_KIOSK, '
                                    +'                     OPTIONS, '
                                    +'                     REMARK, '
                                    +'                     YMD_SETUP, '
                                    +'                     DS_LICENSE, '
                                    +'                     AMT_ASP, '
                                    +'                     CD_LOCAL, '
                                    +'                     CD_MANAGER, '
                                    +'                     CD_UPJONG, '
                                    +'                     CD_STORESIZE, '
                                    +'                     CD_VAN, '
                                    +'                     DS_VAN, '
                                    +'                     POS_DEVICE, '
                                    +'                     STIPULATE_FROM, '
                                    +'                     STIPULATE_TO, '
                                    +'                     STIPULATE_COUNT, '
                                    +'                     RENTAL_FEE, '
                                    +'                     DS_STATUS, '
                                    +'                     YN_POSUPDATE, '
                                    +'                     ID_USER, '
                                    +'                     DB_POSLINK, '
                                    +'                     DB_LINK, '
                                    +'                     JSON_URL, '
                                    +'                     DB_IP, '
                                    +'                     USER_ID, '
                                    +'                     USER_PWD, '
                                    +'                     DB_PORT, '
                                    +'                     DB_NAME, '
                                    +'                     CD_STORE, '
                                    +'                     SYNCPOS_PORT, '
                                    +'                     DB_TYPE) '
                                    +'              values(:P0, '
                                    +'                     :P1, '
                                    +'                     :P2, '
                                    +'                     :P3, '
                                    +'                     :P4, '
                                    +'                     :P5, '
                                    +'                     :P6, '
                                    +'                     :P7, '
                                    +'                     :P8, '
                                    +'                     :P9, '
                                    +'                     :P10, '
                                    +'                     :P11, '
                                    +'                     :P12, '
                                    +'                     :P13, '
                                    +'                     :P14, '
                                    +'                     :P15, '
                                    +'                     :P16, '
                                    +'                     :P17, '
                                    +'                     :P18, '
                                    +'                     :P19, '
                                    +'                     :P20, '
                                    +'                     :P21, '
                                    +'                     :P22, '
                                    +'                     :P23, '
                                    +'                     :P24, '
                                    +'                     :P25, '
                                    +'                     :P26, '
                                    +'                     :P27, '
                                    +'                     :P28, '
                                    +'                     :P29, '
                                    +'                     :P30, '
                                    +'                     :P31, '
                                    +'                     :P32, '
                                    +'                     :P33, '
                                    +'                     :P34, '
                                    +'                     :P35, '
                                    +'                     :P36, '
                                    +'                     :P37, '
                                    +'                     :P38, '
                                    +'                     :P39, '
                                    +'                     :P40, '
                                    +'                     :P41, '
                                    +'                     :P42, '
                                    +'                     ''M'');',
                                     'update CUSTOMER '
                                    +'   set NM_CUSTOMER      =:P1, '
                                    +'       CD_PARTNER       =:P4, '
                                    +'       BIZ_NO           =:P5, '
                                    +'       CEO_NAME         =:P6, '
                                    +'       POST             =:P7, '
                                    +'       ADDR1            =:P8, '
                                    +'       ADDR2            =:P9, '
                                    +'       TEL_OFFICE       =:P10, '
                                    +'       TEL_MOBILE       =:P11, '
                                    +'       ALLOW_POS        =:P12, '
                                    +'       ALLOW_KIOSK      =:P13, '
                                    +'       OPTIONS          =:P14, '
                                    +'       REMARK           =:P15, '
                                    +'       YMD_SETUP        =:P16, '
                                    +'       DS_LICENSE       =:P17, '
                                    +'       AMT_ASP          =:P18, '
                                    +'       CD_LOCAL         =:P19, '
                                    +'       CD_MANAGER       =:P20, '
                                    +'       CD_UPJONG        =:P21, '
                                    +'       CD_STORESIZE     =:P22, '
                                    +'       CD_VAN           =:P23, '
                                    +'       DS_VAN           =:P24, '
                                    +'       POS_DEVICE       =:P25, '
                                    +'       STIPULATE_FROM   =:P26, '
                                    +'       STIPULATE_TO     =:P27, '
                                    +'       STIPULATE_COUNT  =:P28, '
                                    +'       RENTAL_FEE       =:P29, '
                                    +'       DS_STATUS        =:P30, '
                                    +'       YN_POSUPDATE     =:P31, '
                                    +'       ID_USER          =:P32, '
                                    +'       DB_POSLINK       =:P33, '
                                    +'       DB_LINK          =:P34, '
//                                    +'       JSON_URL         =:P35, '                         '
                                    +'       DB_IP            =:P36, '
                                    +'       USER_ID          =:P37, '
                                    +'       USER_PWD         =:P38, '
                                    +'       DB_PORT          =:P39, '
                                    +'       DB_NAME          =:P40, '
                                    +'       CD_STORE         =:P41, '
                                    +'       SYNCPOS_PORT     =:P42, '
                                    +'       YN_UPDATE        =''Y'' '
                                    +' where CD_CUSTOMER =:P0;'),
                                    [CustomerCodeEdit.Text,
                                     CustomerNameEdit.Text,
                                     GetStrPointerData(ProgramComboBox),
                                     vCompanyCode,
                                     PartnerCodeEdit.Text,
                                     BizNoEdit.Text,
                                     CEONameEdit.Text,
                                     ZipCodeEdit.Text,
                                     Addr1Edit.Text,
                                     Addr2Edit.Text,
                                     GetOnlyNumber(OfficeTelEdit.Text),
                                     GetOnlyNumber(MobileTelEdit.Text),
                                     PosCountEdit.EditingValue,
                                     KioskCountEdit.EditingValue,
                                     vOption,
                                     RemarkMemo.Text,
                                     Ifthen(SetupDateEdit.Text ='','',DtoS(SetupDateEdit.CurrentDate)),
                                     '',
                                     0,
                                     GetStrPointerData(LocalComboBox),
                                     '',
                                     '',
                                     GetStrPointerData(SizeComboBox),
                                     GetStrPointerData(VanComboBox),
                                     GetStrPointerData(VanTypeComboBox),
                                     '',
                                     '',
                                     '',
                                     0,
                                     0,
                                     GetStrPointerData(StatusComboBox),
                                     'N',
                                     UserCode,
                                     DBPosLinkMemo.Text,
                                     DBLinkMemo.Text,
                                     Format('http://%s:%s/%s/',[DBIPEdit.Text,RestPortEdit.Text,RestAPIEdit.Text]),
                                     DBIPEdit.Text,
                                     UserEdit.Text,
                                     UserPassEdit.Text,
                                     DBPortEdit.Text,
                                     DBNameEdit.Text,
                                     StoreCodeEdit.Text,
                                     SyncPosPortEdit.Text],true,RestBaseURL);

    if Result then
    begin
      if isNew then
      begin
        SetLength(NewData, 4);
        NewData[0] := CustomerCodeEdit.Text;
        NewData[1] := CustomerNameEdit.Text;
        NewData[2] := StatusComboBox.Text;
        NewData[3] := PartnerNameEdit.Text;
      end
      else
        GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := CustomerNameEdit.Text;

      if AppLicenseEdit.EditModified then
        ExecQuery('update MS_CUSTOMER '
                 +'   set LICENSE_CNT = :P1 '
                 +' where CD_CUSTOMER = :P0; ',
                [CustomerCodeEdit.Text,
                 AppLicenseEdit.EditingValue],true,jsonERPASPURL);

      if isNew then
      begin
        DM.ExecProcedure(Format('CALL STORE_COPY(''%s'', ''%s'', ?) ',
                               [StoreCodeEdit.Text,
                                CustomerCodeEdit.Text]),vURL+'|'+DBNameEdit.Text);
        DM.ExecQuery('update MS_STORE '
                   +'    set NM_STORE   =:P1, '
                   +Ifthen(GetStrPointerData(ProgramComboBox)='S','CD_CUSTOMER =:P2 ', 'CUSTOMERNO =:P2 ')
                   +'  where CD_STORE =:P0;',
                   [StoreCodeEdit.Text,
                    CustomerNameEdit.Text,
                    CustomerCodeEdit.Text],True,vURL+'|'+DBNameEdit.Text);
      end;
    end;
  finally
    Query.Close;
  end;

end;

function TStoreMartStoreForm.DoSearch: Boolean;
var vWhere :String;
begin
  OpenQuery('select a.CD_CUSTOMER, '
           +'       a.NM_CUSTOMER, '
           +'       case a.DS_STATUS when ''0'' then ''인증완료'' when ''1'' then ''해지'' when ''2'' then ''일시중지'' when ''D'' then ''데모'' when ''E'' then ''데모만료'' end DS_STATUS, '
           +'       b.NM_PARTNER, '
           +'       case a.DS_CUSTOMER when ''E'' then ''ERP'' when ''M'' then ''유통'' when ''S'' then ''사우나'' when ''T'' then ''ThemePark'' end DS_CUSTOMER, '
           +'       c.NM_COMPANY '
           +'  from CUSTOMER a left outer join '
           +'       PARTNER  b on b.CD_PARTNER = a.CD_PARTNER left outer join '
           +'       COMPANY  c on c.CD_COMPANY = a.CD_COMPANY '
           +' where (a.CD_CUSTOMER  = :P0 '
           +'    or a.NM_CUSTOMER like ConCat(''%'',:P0,''%'')) '
           +'   and Length(a.CD_CUSTOMER) = 8 '
           +'   and c.DS_COMPANY in (''MS'',''EF'',''SS'',''TF'',''ES'') '
           +GetStrPointerData(ConditionToolBarComboBox)
           +Ifthen(UserLevel='P',Format(' and a.CD_PARTNER = ''%s'' ',[PartnerCode]),'')
           +Ifthen(ToolBarCompanyCodeEdit.Text <> '', Format('and a.CD_COMPANY = ''%s'' ',[ToolBarCompanyCodeEdit.Text]))
           +' order by a.CD_COMPANY, a.CD_PARTNER ',
           [ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
  isChanged := false;
end;

procedure TStoreMartStoreForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = PartnerCodeEdit then
  begin
    if PartnerCodeEdit.Text <> PartnerCodeEdit.TextHint then
    begin
      PartnerCodeEdit.TextHint := '';
      PartnerNameEdit.Clear;
    end;
  end
  else if Sender = CompanyCodeEdit then
  begin
    if CompanyCodeEdit.Text <> CompanyCodeEdit.TextHint then
    begin
      CompanyCodeEdit.TextHint := '';
      CompanyNameEdit.Clear;
    end;
  end;
end;

procedure TStoreMartStoreForm.EtcPagexShow(Sender: TObject);
begin
  inherited;
  if (UserEdit.Text = '') then
  begin
    UserEdit.Text     := Format('usr_%s',[LowerCase(CustomerCodeEdit.Text)]);
    UserPassEdit.Text := Format('usr%s',[LowerCase(CustomerCodeEdit.Text)]);
  end;
end;

end.
