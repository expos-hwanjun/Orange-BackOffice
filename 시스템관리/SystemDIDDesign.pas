unit SystemDIDDesign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ExtCtrls,
  cxStyles, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB,
  MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, cxFontNameComboBox, cxSpinEdit, Vcl.StdCtrls, cxGroupBox,
  cxPCdxBarPopupMenu, cxPC, Vcl.ComCtrls, dxCore, cxDateUtils, dxBarBuiltInMenu,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  StrUtils, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxGrid, idMultiPartFormData, cxCheckBox,
  dxCustomTileControl, dxTileControl, Math;

type
  TSystemDIDDesignForm = class(TInheritEditForm)
    ColorDialog: TColorDialog;
    Label1: TLabel;
    cxPageControl1: TcxPageControl;
    DesignTabSheet: TcxTabSheet;
    Label163: TLabel;
    Label164: TLabel;
    KioskFontColorLabel: TLabel;
    Label27: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Template1BasePanel: TPanel;
    MsgLabel: TLabel;
    Template1HorSpinEdit: TcxSpinEdit;
    Template1VerSpinEdit: TcxSpinEdit;
    Template1BaseColorPanel: TPanel;
    CallListGroupBox: TcxGroupBox;
    FontGroupBox: TcxGroupBox;
    Label177: TLabel;
    Label2: TLabel;
    ListFontSizeSpinEdit: TcxSpinEdit;
    ListFontColorPanel: TPanel;
    CallGroupBox: TcxGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    LastRateSpinEdit: TcxSpinEdit;
    cxGroupBox5: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LastFontSizeSpinEdit: TcxSpinEdit;
    LastFontColorPanel: TPanel;
    MsgGroupBox: TcxGroupBox;
    Label6: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    cxGroupBox7: TcxGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    MsgFontSizeSpinEdit: TcxSpinEdit;
    MsgFontColorPanel: TPanel;
    MsgEdit: TcxTextEdit;
    MsgRateSpinEdit: TcxSpinEdit;
    Template1TimeSpinEdit: TcxSpinEdit;
    FontNameComboBox: TcxFontNameComboBox;
    cxGroupBox2: TcxGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ADRateSpinEdit: TcxSpinEdit;
    ADChangeSpinEdit: TcxSpinEdit;
    ADTabSheet: TcxTabSheet;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridLevel: TcxGridLevel;
    AddButton: TAdvGlowButton;
    DeleteButton: TAdvGlowButton;
    OpenDialog: TOpenDialog;
    CallWaveCheckBox: TcxCheckBox;
    DesignTileControl: TdxTileControl;
    TileControlGroup: TdxTileControlGroup;
    TileControlItem1: TdxTileControlItem;
    TileControlItem2: TdxTileControlItem;
    Label12: TLabel;
    ADPosComboBox: TcxComboBox;
    Label13: TLabel;
    ListColorPanel: TPanel;
    Label14: TLabel;
    LastColorPanel: TPanel;
    Label15: TLabel;
    MsgColorPanel: TPanel;
    DualADTabSheet: TcxTabSheet;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    DualAddButton: TAdvGlowButton;
    DualDeleteButton: TAdvGlowButton;
    DualCheckBox: TcxCheckBox;
    Grid2: TcxGrid;
    GridTableView2: TcxGridTableView;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    GridLevel2: TcxGridLevel;
    ThridDeleteButton: TAdvGlowButton;
    ThridAddButton: TAdvGlowButton;
    ThridCheckBox: TcxCheckBox;
    Label16: TLabel;
    DIDTypeComboBox: TcxComboBox;
    CallLabel: TLabel;
    CallXLabel: TLabel;
    CallXSpinEdit: TcxSpinEdit;
    CallYSpinEdit: TcxSpinEdit;
    procedure Template1BaseColorPanelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ADTabSheetShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure DualADTabSheetShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
  private
    procedure GetDesign;
  protected
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  SystemDIDDesignForm: TSystemDIDDesignForm;

implementation
uses
  Common, DBModule, Help, Main;

{$R *.dfm}

{ TSystemDIDDesignForm }

procedure TSystemDIDDesignForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '001';
  ConditionToolBarComboBox.Properties.Items.AddObject('01', TObject(vCode));
  New(vCode);
  vCode^.Data := '002';
  ConditionToolBarComboBox.Properties.Items.AddObject('02', TObject(vCode));
  New(vCode);
  vCode^.Data := '003';
  ConditionToolBarComboBox.Properties.Items.AddObject('03', TObject(vCode));
  New(vCode);
  vCode^.Data := '004';
  ConditionToolBarComboBox.Properties.Items.AddObject('04', TObject(vCode));
  New(vCode);
  vCode^.Data := '005';
  ConditionToolBarComboBox.Properties.Items.AddObject('05', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;
end;

procedure TSystemDIDDesignForm.FormShow(Sender: TObject);
begin
  inherited;
  GetDesign;
  EditPropertiesChange(DIDTypeComboBox);
end;

procedure TSystemDIDDesignForm.GetDesign;
var vKind :String;
    vIndex :Integer;
begin
  OpenQuery('select CD_CODE, '
           +'       NM_CODE1, '      //1 Left
           +'       NM_CODE2, '      //2 Top
           +'       NM_CODE3, '      //3 Width
           +'       NM_CODE4, '      //4 Height
           +'       NM_CODE5, '      //5 Visible
           +'       NM_CODE6, '      //6 Color
           +'       NM_CODE7, '       //7 FontSize
           +'       NM_CODE8, '       //8
           +'       NM_CODE9, '       //9
           +'       NM_CODE10, '      //10
           +'       NM_CODE11, '      //11
           +'       NM_CODE12, '      //12
           +'       NM_CODE13, '      //13
           +'       NM_CODE14, '      //14
           +'       NM_CODE15, '      //15
           +'       NM_CODE16, '      //16
           +'       NM_CODE17, '       //17
           +'       NM_CODE18, '        //18
           +'       NM_CODE19, '
           +'       NM_CODE20, '
           +'       NM_CODE21, '
           +'       NM_CODE22, '
           +'       NM_CODE23, '
           +'       NM_CODE24, '
           +'       NM_CODE25, '
           +'       NM_CODE26, '
           +'       NM_CODE27 '
           +'  from MS_CODE '
           +' where CD_HEAD    =:P0 '
           +'   and CD_STORE   =:P1 '
           +'   and CD_KIND    =''71'' '
           +'   and CD_CODE    =:P2 '
           +' order by CD_CODE',
           [HeadStoreCode,
            StoreCode,
            GetStrPointerData(ConditionToolBarComboBox)]);
  if not Query.Eof then
  begin
      Template1HorSpinEdit.Value         := StrToIntDef(Query.Fields[1].AsString,3);
      Template1VerSpinEdit.Value         := StrToIntDef(Query.Fields[2].AsString,3);
      Template1BaseColorPanel.Color      := HexToTColor(Query.Fields[3].AsString);
      FontNameComboBox.FontName          := Query.Fields[4].AsString;
      ListFontSizeSpinEdit.Text          := Query.Fields[5].AsString;
      ListFontColorPanel.Color           := HexToTColor(Query.Fields[6].AsString);
      LastFontSizeSpinEdit.Text          := Query.Fields[7].AsString;
      LastFontColorPanel.Color           := HexToTColor(Query.Fields[8].AsString);
      LastRateSpinEdit.Value             := StrToIntDef(Query.Fields[9].AsString,30);
      MsgFontSizeSpinEdit.Text           := Query.Fields[10].AsString;
      MsgFontColorPanel.Color            := HexToTColor(Query.Fields[11].AsString);
      MsgRateSpinEdit.Value              := StrToIntDef(Query.Fields[12].AsString,0);
      MsgEdit.Text                       := Query.Fields[13].AsString;
      Template1TimeSpinEdit.Value        := StrToIntDef(Query.Fields[14].AsString,0);
      CallWaveCheckBox.Checked           := Query.Fields[15].AsString = '1';
      ADRateSpinEdit.Value               := StrToIntDef(Query.Fields[16].AsString,0);
      ADChangeSpinEdit.Value             := StrToIntDef(Query.Fields[17].AsString,0);
      if Query.Fields[18].AsString = 'R' then
        TileControlGroup.Items[0].Move(TileControlGroup,1);
      ADPosComboBox.ItemIndex            := Ifthen(Query.Fields[19].AsString='R',0,1);
      ListColorPanel.Color               := HexToTColor(Query.Fields[20].AsString);
      LastColorPanel.Color               := HexToTColor(Query.Fields[21].AsString);
      MsgColorPanel.Color                := HexToTColor(Query.Fields[22].AsString);
      DualCheckBox.Checked               := Query.Fields[23].AsString = 'Y';
      ThridCheckBox.Checked              := Query.Fields[24].AsString = 'Y';
      DIDTypeComboBox.ItemIndex          := StrToIntDef(Query.Fields[25].AsString,0);
      CallXSpinEdit.Value                := StrToIntDef(Query.Fields[26].AsString,1);
      CallYSpinEdit.Value                := StrToIntDef(Query.Fields[27].AsString,1);
      MsgLabel.Caption := MsgEdit.Text;
  end;
  Query.Close;
end;


procedure TSystemDIDDesignForm.Template1BaseColorPanelClick(Sender: TObject);
begin
  inherited;
  ColorDialog.Color := (Sender as TPanel).Color;
  if ColorDialog.Execute then
  begin
    (Sender as TPanel).Color := ColorDialog.Color;
    isChanged                := true;
  end;
end;

procedure TSystemDIDDesignForm.AddButtonClick(Sender: TObject);
var Files: TSearchRec;
    vIndex : Integer;
    vHttp: TIdHTTP;
    vParams: TIdMultiPartFormDataStream;
    vResponse: string;
    vURL :String;
    vExist :Boolean;
    vCode  :String;
begin

  if not OpenDialog.Execute then exit;

  FindFirst(OpenDialog.FileName,faArchive,Files);
  if Length(AnsiString(Files.Name)) <> Length(Files.Name)  then
  begin
    MsgBox('영문 화일명만 가능합니다');
    Exit;
  end;

  vExist := false;
  if Sender = AddButton then
  begin
    vCode := '72';
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, 1] = Files.Name then
      begin
        vExist := true;
        MsgBox('이미 등록된 화일입니다');
        Break;
      end;
    end;
  end
  else if Sender = DualAddButton then
  begin
    vCode := '73';
    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    begin
      if GridTableView1.DataController.Values[vIndex, 1] = Files.Name then
      begin
        vExist := true;
        MsgBox('이미 등록된 화일입니다');
        Break;
      end;
    end;
  end
  else if Sender = ThridAddButton then
  begin
    vCode := '74';
    for vIndex := 0 to GridTableView2.DataController.RecordCount-1 do
    begin
      if GridTableView2.DataController.Values[vIndex, 1] = Files.Name then
      begin
        vExist := true;
        MsgBox('이미 등록된 화일입니다');
        Break;
      end;
    end;
  end;

  if vExist then Exit;

  try
    vHttp   := TIdHTTP.Create;
    vParams := TIdMultiPartFormDataStream.Create;
    vURL    := GetHttpURL+'Action_FileUp';

    try
      Screen.Cursor := crArrow;
      if Tag = 0 then
        vHttp.Request.CustomHeaders.AddValue('COMP_ID',Format('%s/%s',[HeadStoreCode,StoreCode]))
      else
        vHttp.Request.CustomHeaders.AddValue('COMP_ID',HeadStoreCode);
      vHttp.Request.CustomHeaders.AddValue('JOB_GBN','U');
      vParams.AddFile('0', OpenDialog.FileName);
      vResponse := vHttp.Post(vURL, vParams);
      if vResponse <> 'OK' then
      begin
        Screen.Cursor := crDefault;
        ErrBox('화일전송실패!!!'#13+ vResponse);
        Exit;
      end;
    except
      on E:Exception do
      begin
        Screen.Cursor := crDefault;
        ErrBox(E.Classname + ': '+ E.Message);
      end;
    end;
  finally
    vHttp.Disconnect;
    Screen.Cursor := crDefault;
    vParams.Free;
    vHttp.Free;
  end;

  if vCode = '72' then
  begin
    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := IntToStr(GridTableView.DataController.RecordCount);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := Files.Name;
    GridTableView.DataController.PostEditingData;
  end
  else if vCode = '73' then
  begin
    GridTableView1.DataController.AppendRecord;
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, 0] := IntToStr(GridTableView1.DataController.RecordCount);
    GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, 1] := Files.Name;
    GridTableView1.DataController.PostEditingData;
  end
  else if vCode = '74' then
  begin
    GridTableView2.DataController.AppendRecord;
    GridTableView2.DataController.Values[GridTableView2.DataController.RecordCount-1, 0] := IntToStr(GridTableView2.DataController.RecordCount);
    GridTableView2.DataController.Values[GridTableView2.DataController.RecordCount-1, 1] := Files.Name;
    GridTableView2.DataController.PostEditingData;
  end;

  ExecQuery('insert into MS_CODE(CD_HEAD, '
           +'                    CD_STORE, '
           +'                    CD_KIND, '
           +'                    CD_CODE, '
           +'                    NM_CODE1) '
           +'             values(:P0, '
           +'                    :P1, '
           +'                    :P3, '
           +'                    (select LPad((Cast(Ifnull(Max(CD_CODE),''0'') as int) + 1),3,''0'')   '
           +'                       from MS_CODE as s '
           +'                      where CD_HEAD =:P0 '
           +'                        and CD_STORE =:P1 '
           +'                        and CD_KIND  =:P3), '
           +'                    :P2);',
           [HeadStoreCode,
            StoreCode,
            Files.Name,
            vCode],true);
end;

procedure TSystemDIDDesignForm.ADTabSheetShow(Sender: TObject);
begin
  inherited;
  OpenQuery('select Cast(CD_CODE as INT) as SEQ,  NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  =''72'' ',
           [HeadStoreCode,
            StoreCode]);

  DM.ReadQuery(Query, GridTableView);
end;

procedure TSystemDIDDesignForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
//  inherited;
  GetDesign;
  EditPropertiesChange(DIDTypeComboBox);
end;

procedure TSystemDIDDesignForm.DeleteButtonClick(Sender: TObject);
var vIdHTTP     : TIdHTTP;
    vRequest : TStringStream;
    vResponse :String;
    vFileName :String;
begin
  inherited;
  if Sender = DeleteButton then
  begin
    if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

    vFileName := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 1],'');

    ExecQuery('delete from MS_CODE '
            +' where CD_HEAD  =:P0 '
            +'   and CD_STORE =:P1 '
            +'   and CD_KIND  =''72'' '
            +'   and NM_CODE1 = :P2;',
            [HeadStoreCode,
             StoreCode,
             vFileName],true);

    GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
  end
  else if Sender = DualDeleteButton then
  begin
    if GridTableView1.DataController.GetFocusedRecordIndex < 0 then Exit;

    vFileName := NVL(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, 1],'');

    ExecQuery('delete from MS_CODE '
            +' where CD_HEAD  =:P0 '
            +'   and CD_STORE =:P1 '
            +'   and CD_KIND  =''73'' '
            +'   and NM_CODE1 = :P2;',
            [HeadStoreCode,
             StoreCode,
             vFileName],true);

    GridTableView1.DataController.DeleteRecord(GridTableView1.DataController.GetFocusedRecordIndex);
  end
  else if Sender = ThridDeleteButton then
  begin
    if GridTableView2.DataController.GetFocusedRecordIndex < 0 then Exit;

    vFileName := NVL(GridTableView2.DataController.Values[GridTableView2.DataController.GetFocusedRecordIndex, 1],'');

    ExecQuery('delete from MS_CODE '
            +' where CD_HEAD  =:P0 '
            +'   and CD_STORE =:P1 '
            +'   and CD_KIND  =''74'' '
            +'   and NM_CODE1 = :P2;',
            [HeadStoreCode,
             StoreCode,
             vFileName],true);

    GridTableView2.DataController.DeleteRecord(GridTableView2.DataController.GetFocusedRecordIndex);
  end;

  vIdHTTP  := TIdHTTP.Create;
  vRequest := TStringStream.Create;
  try
    vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID', Format('%s/%s',[HeadStoreCode,StoreCode]));

    vIdHTTP.Request.CustomHeaders.AddValue('FILE_NAME', vFileName);
    vIdHTTP.Request.CustomHeaders.AddValue('JOB_GBN','R');
    vIdHTTP.Post(GetHttpURL+'Action_FileDown', vRequest );
    vResponse := IntToStr(vIdHTTP.ResponseCode);
  finally
    vIdHTTP.Disconnect;
    vIdHTTP.Free;
    vRequest.Free;
  end;

end;

function TSystemDIDDesignForm.DoSave: Boolean;
var vIndex :Integer;
    vSQL, vKind  :String;
begin
  result := false;
  try
    ExecQuery('delete from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =:P2 '
             +'   and CD_CODE  =:P3;',
             [HeadStoreCode,
              StoreCode,
              '71',
              GetStrPointerData(ConditionToolBarComboBox)],false);

    vSQL := '';
    vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'');',
                          [HeadStoreCode,
                           StoreCode,
                           '71',
                           GetStrPointerData(ConditionToolBarComboBox),
                           Template1HorSpinEdit.Text,                         //1
                           Template1VerSpinEdit.Text,                         //2
                           TColorToHex(Template1BaseColorPanel.Color),        //3
                           FontNameComboBox.FontName,                         //4
                           ListFontSizeSpinEdit.Text,                         //5
                           TColorToHex(ListFontColorPanel.Color),             //6
                           LastFontSizeSpinEdit.Text,                         //7
                           TColorToHex(LastFontColorPanel.Color),             //8
                           LastRateSpinEdit.Text,                             //9
                           MsgFontSizeSpinEdit.Text,                          //10
                           TColorToHex(MsgFontColorPanel.Color),              //11
                           MsgRateSpinEdit.Text,                              //12
                           MsgEdit.Text,                                      //13
                           Template1TimeSpinEdit.Text,                        //14
                           Ifthen(CallWaveCheckBox.Checked,'1','0'),          //15
                           ADRateSpinEdit.Text,                               //16
                           ADChangeSpinEdit.Text,                             //17
                           Ifthen(TileControlGroup.Items[0].TileItem.Tag=0,'L','R'),//18
                           Ifthen(ADPosComboBox.ItemIndex=0,'R','L'),         //19
                           TColorToHex(ListColorPanel.Color),                 //20
                           TColorToHex(LastColorPanel.Color),                 //21
                           TColorToHex(MsgColorPanel.Color),                  //22
                           Ifthen(DualCheckBox.Checked,'Y','N'),              //23
                           Ifthen(ThridCheckBox.Checked,'Y','N'),
                           IntToStr(DIDTypeComboBox.ItemIndex),
                           CallXSpinEdit.Text,
                           CallYSpinEdit.Text ]);          //24


    vSQL := 'insert into MS_CODE(CD_HEAD, '    //:P0
           +'                    CD_STORE, '   //:P1,
           +'                    CD_KIND, '    //:P2,
           +'                    CD_CODE, '    //:P3,
           +'                    NM_CODE1, '   //:P4,
           +'                    NM_CODE2, '   //:P5,
           +'                    NM_CODE3, '   //:P6,
           +'                    NM_CODE4, '   //:P7,
           +'                    NM_CODE5, '   //:P8,
           +'                    NM_CODE6, '   //:P9,
           +'                    NM_CODE7, '   //:P10,
           +'                    NM_CODE8, '   //:P11
           +'                    NM_CODE9, '   //:P12
           +'                    NM_CODE10, '  //:P13
           +'                    NM_CODE11, '  //:P14
           +'                    NM_CODE12, '  //:P15
           +'                    NM_CODE13, '  //:P16
           +'                    NM_CODE14, '
           +'                    NM_CODE15, '
           +'                    NM_CODE16, '
           +'                    NM_CODE17, '
           +'                    NM_CODE18, '
           +'                    NM_CODE19, '
           +'                    NM_CODE20, '
           +'                    NM_CODE21, '
           +'                    NM_CODE22, '
           +'                    NM_CODE23, '
           +'                    NM_CODE24, '
           +'                    NM_CODE25, '
           +'                    NM_CODE26, '
           +'                    NM_CODE27) values '
           + vSQL;

    Result := ExecQuery(vSQL, [], true);
    ShowMsg('저장 했습니다.');
    isChanged := false;
    ButtonToolbarSaveButton.Enabled := false;
  except
    on E: Exception do
    begin
      ErrBox(Format('저장하지 못했습니다.'#13'%s', [E.Message]));
    end;
  end
end;
procedure TSystemDIDDesignForm.DualADTabSheetShow(Sender: TObject);
begin
  inherited;
  OpenQuery('select Cast(CD_CODE as INT) as SEQ,  NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  =''73'' ',
           [HeadStoreCode,
            StoreCode]);
  DM.ReadQuery(Query, GridTableView1);

  OpenQuery('select Cast(CD_CODE as INT) as SEQ,  NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  =''74'' ',
           [HeadStoreCode,
            StoreCode]);
  DM.ReadQuery(Query, GridTableView2);
end;

procedure TSystemDIDDesignForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = DIDTypeComboBox then
  begin
    if DIDTypeComboBox.ItemIndex = 0 then
    begin
      CallLabel.Caption         := '호출번호';
      CallGroupBox.Caption      := '호출번호';
      CallXSpinEdit.Value       := 1;
      CallYSpinEdit.Value       := 1;
      CallXSpinEdit.Enabled     := false;
      CallYSpinEdit.Enabled     := false;
      MsgGroupBox.Visible       := true;
      ADRateSpinEdit.Enabled    := true;
      ADChangeSpinEdit.Enabled  := true;
      LastRateSpinEdit.Enabled  := true;
    end
    else
    begin
      CallGroupBox.Caption      := '조리중 번호';
      CallLabel.Caption         := '조리중 리스트 표시';
      CallXSpinEdit.Enabled     := true;
      CallYSpinEdit.Enabled     := true;
      MsgGroupBox.Visible       := false;
      ADRateSpinEdit.Enabled    := false;
      ADChangeSpinEdit.Enabled  := false;
      LastRateSpinEdit.Enabled  := false;
    end;
  end
  else if Sender = MsgEdit then
    MsgLabel.Caption := MsgEdit.Text;

end;

end.
