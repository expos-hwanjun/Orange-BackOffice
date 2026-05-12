unit StoreCommonCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter, Vcl.StdCtrls,
  Math;

type
  TStoreCommonCodeForm = class(TInheritGridEditForm)
    GridTableViewCode: TcxGridColumn;
    GridTableViewName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableView1: TcxGridTableView;
    GridTableView1APIKeyID: TcxGridColumn;
    Notebook: TNotebook;
    CodeLabel: TLabel;
    Label1: TLabel;
    PosUseLabel: TLabel;
    CodeEdit: TcxTextEdit;
    CodeName1Edit: TcxTextEdit;
    StatusComboBox: TcxComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    APIKeyIDEdit: TcxTextEdit;
    APIKeyEdit: TcxTextEdit;
    APIStatusComboBox: TcxComboBox;
    Label5: TLabel;
    WebURLEdit: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure GridTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    PartnerCode :String;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StoreCommonCodeForm: TStoreCommonCodeForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TStoreCodeForm }
procedure TStoreCommonCodeForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '05';
  ConditionToolBarComboBox.Properties.Items.AddObject('VAN사', TObject(vCode));
  New(vCode);
  vCode^.Data := '01';
  ConditionToolBarComboBox.Properties.Items.AddObject('지역', TObject(vCode));
  New(vCode);
  vCode^.Data := '02';
  ConditionToolBarComboBox.Properties.Items.AddObject('담당자', TObject(vCode));
  New(vCode);
  vCode^.Data := '03';
  ConditionToolBarComboBox.Properties.Items.AddObject('업종', TObject(vCode));
  New(vCode);
  vCode^.Data := '04';
  ConditionToolBarComboBox.Properties.Items.AddObject('매장규모', TObject(vCode));
  if UserLevel = 'E' then
  begin
    New(vCode);
    vCode^.Data := '99';
    ConditionToolBarComboBox.Properties.Items.AddObject('카카오채널', TObject(vCode));
  end;
  ConditionToolBarComboBox.ItemIndex := 0;
end;

procedure TStoreCommonCodeForm.FormShow(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select CD_PARTNER, '
             +'       NM_PARTNER, '
             +'       DISCERN '
             +'  from PARTNER '
             +' where CD_PARTNER = (select CD_PARTNER '
             +'                       from USER_MASTER '
             +'                      where ID_USER =:P0) ',
             [UserCode],false,RestBaseURL);
    if not Query.Eof then
    begin
      PartnerCode   := Query.Fields[0].AsString;
    end;
  finally
    FinishQuery;
  end;
  Notebook.ActivePage := 'Code';
end;

procedure TStoreCommonCodeForm.GridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  OpenQuery('select API_KEY_ID, '
           +'       API_KEY, '
           +'       API_WEB_URL, '
           +'       DS_STATUS '
           +'  from KMS_API_KEY '
           +' where API_KEY_ID = :P0 ',
           [GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, 0]],false,jsonSMSDBURL);

  if not Query.Eof then
  begin
    APIKeyIDEdit.Text := Query.Fields[0].AsString;
    APIKeyEdit.Text   := Query.Fields[1].AsString;
    WebURLEdit.Text   := Query.Fields[2].AsString;
    APIStatusComboBox.ItemIndex := StoI(Query.Fields[3].AsString);
    Query.Close;
    MainPanel.Enabled := true;
    APIKeyIDEdit.Enabled := false;
    isChanged := false;
  end;
end;

function TStoreCommonCodeForm.DoSearch: Boolean;
begin
  if GetStrPointerData(ConditionToolBarComboBox) = '99' then
  begin
    GridLevel.GridView  := GridTableView1;
    Notebook.ActivePage := 'KaKao';
    OpenQuery('select API_KEY_ID '
             +'  from KMS_API_KEY '
             +' order by API_KEY_ID',
             [],false,jsonSMSDBURL);

    Result := DM.ReadQuery(Query, GridTableView1);
  end
  else
  begin
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1, '
             +'       DS_STATUS '
             +'  from CODE '
             +' where CD_PARTNER = :P0 '
             +'   and DS_CODE    = :P1 '
             +'   and NM_CODE1 like Concat(''%'',:P2,''%'') '
             +'   and DS_STATUS = ''0'' '
             +' order by CD_CODE ',
             [PartnerCode,
              GetStrPointerData(ConditionToolBarComboBox),
              ConditionToolBarEdit.Text],false,RestBaseURL);
    Result := DM.ReadQuery(Query, GridTableView);
  end;
end;

procedure TStoreCommonCodeForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if GetStrPointerData(ConditionToolBarComboBox) = '99' then
  begin
    GridLevel.GridView  := GridTableView1;
    Notebook.ActivePage := 'KaKao';
  end
  else
  begin
    GridLevel.GridView  := GridTableView;
    Notebook.ActivePage := 'Code';
  end;
end;

function TStoreCommonCodeForm.DoDelete: Boolean;
begin
  if GetStrPointerData(ConditionToolBarComboBox) = '99' then
  begin
    Result := ExecQuery('delete from KMS_API_KEY '
                       +' where API_KEY_ID = :P0;',
                       [GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, 0]],true,jsonSMSDBURL);
  end
  else
  begin
    Result := ExecQuery('delete from CODE '
                       +' where CD_PARTNER = :P0 '
                       +'   and DS_CODE    = :P1 '
                       +'   and CD_CODE    = :P2;',
                       [PartnerCode,
                        GetStrPointerData(ConditionToolBarComboBox),
                        GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCode.Index]],true,RestBaseURL);
  end;
end;

procedure TStoreCommonCodeForm.DoGridLink;
begin
  inherited;
  CodeEdit.Text       := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCode.Index];
  CodeName1Edit.Text  := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewName.Index];
  StatusComboBox.Text := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index];
end;

function TStoreCommonCodeForm.DoNew: Boolean;
begin
  if GetStrPointerData(ConditionToolBarComboBox) <> '99' then
  begin
    try
      OpenQuery('select Max(CD_CODE) as CODE '
               +'  from CODE '
               +' where CD_PARTNER = :P0 '
               +'   and DS_CODE    = :P1 ',
             [PartnerCode,
              GetStrPointerData(ConditionToolBarComboBox)],false,RestBaseURL);
      CodeEdit.Text := LPad(IntToStr(StoI(Query.Fields[0].AsString)+1), 3, '0');
      CodeName1Edit.SetFocus;
      Result := true;
    finally
      FinishQuery;
    end;
  end
  else
  begin
    MainPanel.Enabled := true;
    APIKeyIDEdit.Enabled := true;
    Result := true;
  end;
end;

function TStoreCommonCodeForm.DoSave: Boolean;
begin
  if GetStrPointerData(ConditionToolBarComboBox) <> '99' then
  begin
    if Trim(CodeName1Edit.Text) = '' then
    begin
      MsgBox('코드명을 입력하세요');
      CodeName1Edit.SetFocus;
      Exit;
    end;

    Result := ExecQuery('insert into CODE(CD_PARTNER, '
                       +'                 DS_CODE, '
                       +'                 CD_CODE, '
                       +'                 NM_CODE1, '
                       +'                 DS_STATUS) '
                       +'         values(:P0, '
                       +'                :P1, '
                       +'                :P2, '
                       +'                :P3, '
                       +'                :P4) '
                       +'on duplicate key update NM_CODE1 = :P3, '
                       +'                        DS_STATUS =:P4;',
                       [PartnerCode,
                        GetStrPointerData(ConditionToolBarComboBox),
                        CodeEdit.Text,
                        CodeName1Edit.Text,
                        IntToStr(StatusComboBox.ItemIndex)],true,RestBaseURL);

    if Result then
      if isNew then
      begin
        SetLength(NewData, 3);
        NewData[0] := CodeEdit.Text;
        NewData[1] := CodeName1Edit.Text;
        NewData[2] := IntToStr(StatusComboBox.ItemIndex);
      end
      else
        GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewName.Index] := CodeName1Edit.Text;
  end
  else
  begin
    if Trim(APIKeyIDEdit.Text) = '' then
    begin
      MsgBox('API KEY ID를 입력하세요');
      APIKeyIDEdit.SetFocus;
      Exit;
    end;

    if Trim(APIKeyEdit.Text) = '' then
    begin
      MsgBox('API KEY를 입력하세요');
      APIKeyEdit.SetFocus;
      Exit;
    end;

    if Trim(WebURLEdit.Text) = '' then
    begin
      MsgBox('WEB URL를 입력하세요');
      WebURLEdit.SetFocus;
      Exit;
    end;

    Result := ExecQuery('insert into KMS_API_KEY(API_KEY_ID, '
                       +'                        API_KEY, '
                       +'                        API_WEB_URL, '
                       +'                        DS_STATUS, '
                       +'                        DS_GROUP, '
                       +'                        DS_FORCE_MMS, '
                       +'                        CD_CUSTOMER) '
                       +'                values(:P0, '
                       +'                       :P1, '
                       +'                       :P2, '
                       +'                       :P3, '
                       +'                       ''Y'', '
                       +'                       ''N'', '
                       +'                       ''EXTREME'') '
                       +'on duplicate key update API_KEY     =:P1, '
                       +'                        API_WEB_URL =:P2, '
                       +'                        DS_STATUS   =:P3;',
                       [APIKeyIDEdit.Text,
                        APIKeyEdit.Text,
                        WebURLEdit.Text,
                        IntToStr(APIStatusComboBox.ItemIndex)],true,jsonSMSDBURL);

    if Result then
      if isNew then
      begin
        SetLength(NewData, 1);
        NewData[0] := APIKeyIDEdit.Text;
      end
      else
        GridTableView1.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView1.DataController.RecordCount-1), PrevRow, GridTableView1.DataController.FocusedRecordIndex), GridTableView1APIKeyID.Index] := APIKeyIDEdit.Text;

  end;
end;




end.
