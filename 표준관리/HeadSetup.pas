unit HeadSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, cxStyles, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, cxTextEdit, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, dxBarBuiltInMenu,
  cxCurrencyEdit, cxCheckBox, cxButtonEdit, cxSpinEdit, Vcl.StdCtrls,
  cxGroupBox, cxPC, cxRadioGroup, StrUtils, Math, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxGrid, idMultiPartFormData, IdHTTP,
  AdvGlassButton, cxImage, AdvGroupBox, Vcl.ExtDlgs, PNGImage,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, cxCheckListBox, System.JSON, dxDateRanges, dxScrollbarAnnotations,
  cxCustomListBox, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  THeadSetupForm = class(TInheritEditForm)
    PageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Option057CheckBox: TcxCheckBox;
    Option083CheckBox: TcxCheckBox;
    Option164CheckBox: TcxCheckBox;
    Option247CheckBox: TcxCheckBox;
    Option307CheckBox: TcxCheckBox;
    Option019CheckBox: TcxCheckBox;
    Option020CheckBox: TcxCheckBox;
    Option026CheckBox: TcxCheckBox;
    Option258CheckBox: TcxCheckBox;
    Option251CheckBox: TcxCheckBox;
    Option254CheckBox: TcxCheckBox;
    Option337CheckBox: TcxCheckBox;
    Option079CheckBox: TcxCheckBox;
    cxGroupBox22: TcxGroupBox;
    Label168: TLabel;
    Option021CheckBox: TcxCheckBox;
    Option406ComboBox: TcxComboBox;
    cxGroupBox15: TcxGroupBox;
    Option156ComboBox: TcxComboBox;
    KioskTabSheet: TcxTabSheet;
    Option403CheckBox: TcxCheckBox;
    DesignFontDialog: TFontDialog;
    Label87: TLabel;
    Option248ComboBox: TcxComboBox;
    Option010CheckBox: TcxCheckBox;
    GoodsPrefixLabel: TLabel;
    GoodsLengthLabel: TLabel;
    MenuPrefixEdit: TcxCurrencyEdit;
    MenuLengthComboBox: TcxComboBox;
    OpenDialog: TOpenDialog;
    cxGroupBox20: TcxGroupBox;
    Label183: TLabel;
    Label184: TLabel;
    Option429SpinEdit: TcxSpinEdit;
    Option430SpinEdit: TcxSpinEdit;
    Option428CheckBox: TcxCheckBox;
    Label136: TLabel;
    CouponPrefixEdit: TcxMaskEdit;
    Label3: TLabel;
    CouponLengthEdit: TcxSpinEdit;
    SmsUserGroupBox: TcxGroupBox;
    AppIDLabel: TLabel;
    AppPWDLabel: TLabel;
    Label48: TLabel;
    AppIDEdit: TcxTextEdit;
    AppPWDEdit: TcxTextEdit;
    AppPWDConfirmEdit: TcxTextEdit;
    PictureLoadDialog: TOpenPictureDialog;
    Label56: TLabel;
    Option031ComboBox: TcxComboBox;
    AppIDDupCheckButton: TAdvGlowButton;
    AppUserSaveButton: TAdvGlowButton;
    Label1: TLabel;
    Label2: TLabel;
    GoodsPrefixEdit: TcxCurrencyEdit;
    GoodsLengthComboBox: TcxComboBox;
    LetsOrderTabSheet: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Label42: TLabel;
    Option001ComboBox: TcxComboBox;
    Option458ComboBox: TcxComboBox;
    Label198: TLabel;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    cxGroupBox25: TcxGroupBox;
    LanguageCheckListBox: TcxCheckListBox;
    Option457CheckBox: TcxCheckBox;
    StoreImageButton: TAdvGlowButton;
    TabletWaitImageGroupBox: TcxGroupBox;
    TableWaitImageLoadButton: TAdvGlowButton;
    TableWaitImageDeleteButton: TAdvGlowButton;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    Option485CheckBox: TcxCheckBox;
    KioskMainImageButton: TAdvGlowButton;
    cxGroupBox1: TcxGroupBox;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    GridLevel: TcxGridLevel;
    AddButton: TAdvGlowButton;
    DeleteButton: TAdvGlowButton;
    BarrierFreeWheelChairImageutton: TAdvGlowButton;
    BarrierFreeLowVisionImageutton: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure AppIDDupCheckButtonClick(Sender: TObject);
    procedure AppUserSaveButtonClick(Sender: TObject);
    procedure KioskTabSheetShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure LetsOrderTabSheetShow(Sender: TObject);
    procedure StoreImageButtonClick(Sender: TObject);
    procedure TableWaitImageLoadButtonClick(Sender: TObject);
    procedure GridTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TableWaitImageDeleteButtonClick(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure KioskMainImageButtonClick(Sender: TObject);
  private
    DestPluStoreCode  :String;
    Option :String;
    HeadStoreName :String;
  protected
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  HeadSetupForm: THeadSetupForm;

implementation
uses
  Common, DBModule, Help, UnitZipPopup, ProxyCheck;

{$R *.dfm}
procedure THeadSetupForm.FormShow(Sender: TObject);
  procedure SetCheckBoxComboBox(aIndex:Integer);
  var vIndex :Integer;
  begin
    For vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TcxCheckBox) and ( (Components[vIndex] as TcxCheckBox).Name = 'Option'+FormatFloat('000',aIndex)+'CheckBox' ) then
      begin
        (Components[vIndex] as TcxCheckBox).Checked := Option[aIndex] = '1';
        Break;
      end
      else if (Components[vIndex] is TcxComboBox) and ( (Components[vIndex] as TcxComboBox).Name = 'Option'+FormatFloat('000',aIndex)+'ComboBox' ) then
      begin
        (Components[vIndex] as TcxComboBox).ItemIndex := StrToIntDef(Option[aIndex],0);
        Break;
      end
      else if (Components[vIndex] is TcxSpinEdit) and ( (Components[vIndex] as TcxSpinEdit).Name = 'Option'+FormatFloat('000',aIndex)+'SpinEdit' ) then
      begin
        (Components[vIndex] as TcxSpinEdit).Value := StrToIntDef(Option[aIndex],0);

        if ((Components[vIndex] as TcxSpinEdit).Properties.AssignedValues.MinValue) and (Components[vIndex] as TcxSpinEdit).Value < (Components[vIndex] as TcxSpinEdit).Properties.MinValue then
          (Components[vIndex] as TcxSpinEdit).Value := (Components[vIndex] as TcxSpinEdit).Properties.MinValue
        else if ((Components[vIndex] as TcxSpinEdit).Properties.AssignedValues.MaxValue) and (Components[vIndex] as TcxSpinEdit).Value > (Components[vIndex] as TcxSpinEdit).Properties.MaxValue then
          (Components[vIndex] as TcxSpinEdit).Value := (Components[vIndex] as TcxSpinEdit).Properties.MaxValue;
        Break;
      end
      else if (Components[vIndex] is TcxRadioGroup) and ( (Components[vIndex] as TcxRadioGroup).Name = 'Option'+FormatFloat('000',aIndex)+'RadioGroup' ) then
      begin
        (Components[vIndex] as TcxRadioGroup).ItemIndex := StrToIntDef(Option[aIndex],0);
        Break;
      end;
    end;
  end;
var vIndex :Integer;
    vCode  :PStrPointer;
    vTemp : String;
begin
  inherited;
  DestPluStoreCode := '';
  SetWorkStoreList;

//  KioskTabSheet.TabVisible   := GetStoreOption(4) = '1';
  Option403CheckBox.Checked  := GetStoreOption(4) = '1';
  for vIndex := 0 to WorkStoreList.Count-1 do
  begin
    if Copy(CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 2),3,1) = '0' then Continue;
    DestPluStoreCode := DestPluStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);
  end;
  DestPluStoreCode := Format(' in (%s) ',[LeftStr(DestPluStoreCode, Length(DestPluStoreCode)-1)]);

  GoodsLengthComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '8';
  GoodsLengthComboBox.Properties.Items.AddObject('8', TObject(vCode));
  New(vCode);
  vCode^.Data := '13';
  GoodsLengthComboBox.Properties.Items.AddObject('13', TObject(vCode));

  PageControl.ActivePageIndex := 0;
  try
    OpenQuery('select a.NM_STORE, '
             +'       a.OPTIONS, '
             +'       a.SELFMENU_LEN, '
             +'       a.SELFMENU_PREFIX, '
             +'       a.SELFGOODS_LEN, '
             +'       a.SELFGOODS_PREFIX, '
             +'       a.COUPON_PREFIX, '
             +'       a.COUPON_LEN, '
             +'       b.KIOSK_LANGUAGE '
             +'  from MS_STORE a left outer join '
             +'       MS_STORE_ETC as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 ',
             [HeadStoreCode,
              StandardStore]);
    if not Query.Eof then
    begin
      HeadStoreName                  := Query.FieldByName('NM_STORE').AsString;
      Option                         := Query.FieldByName('OPTIONS').AsString;
      MenuLengthComboBox.ItemIndex   := GetStrPointerIndex(MenuLengthComboBox, Query.FieldByName('SELFMENU_LEN').AsString);
      MenuPrefixEdit.Text            := Query.FieldByName('SELFMENU_PREFIX').AsString;
      CouponPrefixEdit.Text          := Query.FieldByName('COUPON_PREFIX').AsString;
      CouponLengthEdit.Value         := StrToIntDef(Query.FieldByName('COUPON_LEN').AsString,13);
      GoodsLengthComboBox.ItemIndex  := GetStrPointerIndex(GoodsLengthComboBox, Query.FieldByName('SELFGOODS_LEN').AsString);
      GoodsPrefixEdit.Text           := Query.FieldByName('SELFGOODS_PREFIX').AsString;

      vTemp := Query.FieldByName('KIOSK_LANGUAGE').AsString;
      for vIndex := 0 to Length(Query.FieldByName('KIOSK_LANGUAGE').AsString)-1 do
      begin
        if Copy(Query.FieldByName('KIOSK_LANGUAGE').AsString,vIndex+1,1) = '1' then
          LanguageCheckListBox.Items.Items[vIndex].State := cbsChecked
        else
          LanguageCheckListBox.Items.Items[vIndex].State := cbsUnchecked;
      end;
    end
    else
    begin
      GoodsLengthComboBox.ItemIndex  := 0;
      GoodsPrefixEdit.Text           := '20';
    end;
    Option := RPad(Option,600,'0');
    for vIndex := 1 to Length(Option) do
      SetCheckBoxComboBox(vIndex);
  finally
    FinishQuery;
  end;


  //통합회원 사용시에만 문자발송 아이디를 생성한다
  SmsUserGroupBox.Visible := GetStoreOption(5) = '1';
  if GetStoreOption(5) = '1' then
  begin
    try
      OpenQuery('select APP_ID, '
               +'       Cast(AES_Decrypt(APP_PWD, 71483) as Char) as APP_PWD '
               +'  from MS_APP_USER '
               +' where CD_CUSTOMER = :P0 '
               +'   and CD_HEAD     = :P1 ',
               [StandardStore,
                HeadStoreCode],false, jsonSMSDBURL);
      if not Query.Eof then
      begin
        AppIDEdit.Text             := Query.FieldByName('APP_ID').AsString;
        AppIDEdit.Enabled          := false;
        AppPWDEdit.Text            := Query.FieldByName('APP_PWD').AsString;
        AppPWDConfirmEdit.Text     := Query.FieldByName('APP_PWD').AsString;
        AppIDDupCheckButton.Caption := '삭제';

        AppIDEdit.EditModified     := false;
        AppPWDEdit.EditModified    := false;
      end
      else
      begin
        AppIDEdit.Text         := '';
        AppIDEdit.Enabled      := true;
        AppPWDEdit.Clear;
        AppPWDConfirmEdit.Clear;
        AppIDEdit.EditModified := true;
        AppIDDupCheckButton.Caption := '중복체크';
      end;
    finally
      FinishQuery;
    end;
  end;

  ResetEditProperties;
  isLoading := false;
  isChanged := false;
end;


procedure THeadSetupForm.GridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  TableWaitImageDeleteButton.Enabled := true;
end;

procedure THeadSetupForm.KioskMainImageButtonClick(Sender: TObject);
var Files: TSearchRec;
    vIndex : Integer;
    vHttp: TIdHTTP;
    vParams: TIdMultiPartFormDataStream;
    vResponse: string;
    vFileName, vExt,
    vURL :String;
    vExist :Boolean;
    vImage :TImage;
begin
  PictureLoadDialog.Filter := '이미지|*.jpg|이미지|*.png';

  if not PictureLoadDialog.Execute then exit;

  vExt := RightStr(PictureLoadDialog.FileName,3);

  if Sender = KioskMainImageButton then
    vFileName := 'Order.'+vExt
  else if Sender = BarrierFreeWheelChairImageutton then
    vFileName := 'OrderWheelChair.'+vExt
  else if Sender = BarrierFreeLowVisionImageutton then
    vFileName := 'OrderLowVision.'+vExt;

  if FileExists(Folder+vFileName) then
    DeleteFile(Folder+vFileName);

  CopyFile(PWideChar(PictureLoadDialog.FileName), PWideChar(Folder+vFileName), true);

  try
    vHttp   := TIdHTTP.Create;
    vParams := TIdMultiPartFormDataStream.Create;
    vURL    := GetHttpURL+'Action_FileUp';

    try
      Screen.Cursor := crArrow;
      vHttp.Request.CustomHeaders.AddValue('COMP_ID',Format('%s',[HeadStoreCode]));
      vHttp.Request.CustomHeaders.AddValue('JOB_GBN','U');
      vParams.AddFile('0', Folder+vFileName);
      vResponse := vHttp.Post(vURL, vParams);
      if vResponse <> 'OK' then
      begin
        Screen.Cursor := crDefault;
        ErrBox('화일전송실패!!!'#13+ vResponse);
        Exit;
      end;
      DeleteFile(Folder+vFileName);
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

  if Sender = KioskMainImageButton then
    vFileName := 'Order.'+vExt
  else if Sender = BarrierFreeWheelChairImageutton then
    vFileName := 'OrderWheelChair.'+vExt
  else if Sender = BarrierFreeLowVisionImageutton then
    vFileName := 'OrderLowVision.'+vExt;

  ExecQuery('insert into MS_CODE(CD_HEAD, '
           +'                    CD_STORE, '
           +'                    CD_KIND, '
           +'                    CD_CODE, '
           +'                    NM_CODE1, '
           +'                    NM_CODE2) '
           +'             values(:P0, '
           +'                    :P1, '
           +'                    ''97'', '
           +'                    (select LPad((Cast(Ifnull(Max(CD_CODE),''0'') as int) + 1),3,''0'')   '
           +'                       from MS_CODE as s '
           +'                      where CD_HEAD =:P0 '
           +'                        and CD_STORE =:P1 '
           +'                        and CD_KIND  =''97''), '
           +'                    :P2,'
           +'                    ''HEAD'') '
           +'ON DUPLICATE KEY UPDATE DT_CHANGE = Now();',
           [HeadStoreCode,
            StandardStore,
            vFileName],true);
end;

procedure THeadSetupForm.KioskTabSheetShow(Sender: TObject);
begin
  inherited;
  OpenQuery('select Cast(CD_CODE as INT) as SEQ,  NM_CODE1 '
           +'  from MS_CODE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_KIND  =''97'' ',
           [HeadStoreCode,
            StandardStore]);

  DM.ReadQuery(Query, GridTableView);
end;

procedure THeadSetupForm.LetsOrderTabSheetShow(Sender: TObject);
var vIndex :Integer;
    vTemp  :String;
    vJsonObject : TJSONObject;
    vJsonArray  : TJSONArray;
    vJsonValue  : TJSONValue;
begin
  inherited;

  OpenQuery('select TABLET_WAITIMAGE '
           +'  from CUSTOMER '
           +' where CD_COMPANY  =:P0 '
           +'   and CD_CUSTOMER =:P1 ',
           [HeadStoreCode,
            StandardStore],false, RestBaseURL);

  GridTableView1.DataController.RecordCount := 0;
  if not Query.Eof then
  begin
    vTemp := Query.FieldByName('TABLET_WAITIMAGE').AsString;
    if vTemp <> '' then
    begin
      vJsonObject := TJSONObject.ParseJSONValue( vTemp ) as TJSONObject;
      vJsonArray  := TJsonArray( vJsonObject.Get('FILE').JsonValue );
      for vIndex := 0 to vJsonArray.Size-1 do
      begin
        vJsonValue := vJsonArray.Get(vIndex);
        GridTableView1.DataController.AppendRecord;
        GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, 0] := IntToStr(vIndex+1);
        GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, 1] := vJsonValue.GetValue<String>;
      end;
    end;
  end;
  Query.Close;
end;

procedure THeadSetupForm.StoreImageButtonClick(Sender: TObject);
var vHttp: TIdHTTP;
    vURL,
    vResult    :String;
    vParams : TIdMultiPartFormDataStream;
begin
  inherited;
  if not FileExists('libeay32.dll') then
    FileDownLoad('libeay32.dll');

  if not FileExists('ssleay32.dll') then
    FileDownLoad('ssleay32.dll');

  if PictureLoadDialog.Execute then
  begin
    OpenQuery('select ID_SERVER '
             +'  from COMPANY '
             +' where CD_COMPANY  =:P0 ',
             [HeadStoreCode],false,RestBaseURL);

    vURL := 'https://api.letsorder.co.kr/comm/image';
    if not Query.Eof then
    begin
      if Query.Fields[0].AsString = '9999' then
        vURL := 'https://api-dev.letsorder.co.kr/comm/image'
      else if Query.Fields[0].AsString = '9998' then
        vURL := 'https://api-qa.letsorder.co.kr/comm/image';
    end;
    Query.Close;

    try
      Screen.Cursor := crHourGlass;

      vHttp := TIdHTTP.Create;
      vParams := TIdMultiPartFormDataStream.Create;
      vParams.AddFormField('cd_head',HeadStoreCode);
      vParams.AddFormField('cd_store',StandardStore);
      vParams.AddFormField('nm_image','STORE_IMG.PNG');
      vParams.AddFormField('type','STORE');    //WATIN
      vParams.AddFile('file', PictureLoadDialog.FileName,'image/png');

      vHttp.IOHandler :=IdSSLIOHandlerSocketOpenSSL;
      vResult := vHTTP.Post(vURL, vParams);

      if vResult= '{"message":"Completed uploading image"}' then
      begin
        Screen.Cursor := crDefault;
        MsgBox('정상 업로드 되었습니다');
      end;
    finally
      Screen.Cursor := crDefault;
      vParams.Free;
      vHttp.Free;
    end;
  end;

end;

procedure THeadSetupForm.TableWaitImageDeleteButtonClick(Sender: TObject);
var vIdHTTP     : TIdHTTP;
    vRequest : TStringStream;
    vResponse :String;
    vFileName :String;
    vWaitImage, vURL, vDownURL :String;
    vIndex :Integer;
begin
  inherited;
  if GridTableView1.DataController.GetFocusedRecordIndex < 0 then Exit;

  vFileName := NVL(GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, 1],'');

  GridTableView1.DataController.DeleteRecord(GridTableView1.DataController.GetFocusedRecordIndex);

  vIdHTTP  := TIdHTTP.Create;
  vRequest := TStringStream.Create;
  vURL     := 'http://39.120.147.83:50280/Orange/Action_FileDown';
  vDownURL := 'https://xn--6j1b831b.kr/FTP/Tablet';

  try
    vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID', Format('Tablet/%s/%s',[HeadStoreCode, StandardStore]));
    vIdHTTP.Request.CustomHeaders.AddValue('FILE_NAME', vFileName);
    vIdHTTP.Request.CustomHeaders.AddValue('JOB_GBN','R');
    vIdHTTP.Post(vURL, vRequest );
    vResponse := IntToStr(vIdHTTP.ResponseCode);
  finally
    vIdHTTP.Disconnect;
    vIdHTTP.Free;
    vRequest.Free;
  end;

  vWaitImage := '';
  for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    vWaitImage := vWaitImage + Format('"%s",',[GridTableView1.DataController.Values[vIndex, 1]]);

  vWaitImage := Format('{"url":"%s","head":"%s","store":"%s","FILE":[%s]}',[vDownURL, HeadStoreCode, StandardStore, LeftStr(vWaitImage,Length(vWaitImage)-1)]);


  ExecQuery('update CUSTOMER '
           +'   set TABLET_WAITIMAGE =:P2 '
           +' where CD_COMPANY  =:P0 '
           +'   and CD_CUSTOMER =:P1;',
           [HeadStoreCode,
            StoreCode,
            vWaitImage],true, RestBaseURL);
end;

procedure THeadSetupForm.TableWaitImageLoadButtonClick(Sender: TObject);
var Files: TSearchRec;
    vIndex : Integer;
    vHttp: TIdHTTP;
    vParams: TIdMultiPartFormDataStream;
    vResponse: string;
    vURL, vDownURL :String;
    vExist :Boolean;
    vImage :TImage;
    vUpFileName,
    vFileName:String;
    vWaitImage :String;
begin
  OpenDialog.Filter := '이미지|*.jpg|동영상|*.avi';

  if not OpenDialog.Execute then exit;

  FindFirst(OpenDialog.FileName,faArchive,Files);
  if (RightStr(OpenDialog.FileName,3) = 'png') or (RightStr(OpenDialog.FileName,3) = 'jpg') then
    try
      vImage := TImage.Create(self);
      vImage.Picture.LoadFromFile(OpenDialog.FileName);
      if (vImage.Width > 1920) or (vImage.Height > 1080) then
      begin
        MsgBox('최대 이미지 크기는 최대 1024 * 768 입니다');
        Exit;
      end;
    finally
      vImage.Free;
    end;

  vFileName   := 'WaitImage'+FormatDateTime('_yymmddhhnnss',now())+  RightStr(Files.Name, 4);
  vUpFileName := Replace(OpenDialog.FileName, Files.Name, vFileName);
  CopyFile(PWideChar(OpenDialog.FileName), PWideChar(vUpFileName), true);

  try
    vHttp   := TIdHTTP.Create;
    vParams := TIdMultiPartFormDataStream.Create;
    vURL    := 'http://39.120.147.83:50280/Orange/Action_FileUp';

    vDownURL := 'https://xn--6j1b831b.kr/FTP/Tablet';

    try
      Screen.Cursor := crArrow;
      vHttp.Request.CustomHeaders.AddValue('COMP_ID',Format('Tablet/%s/%s',[HeadStoreCode,StandardStore]));
      vHttp.Request.CustomHeaders.AddValue('JOB_GBN','U');
      vParams.AddFile('0', vUpFileName);
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

  GridTableView1.DataController.AppendRecord;
  GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, 0] := IntToStr(GridTableView1.DataController.RecordCount);
  GridTableView1.DataController.Values[GridTableView1.DataController.RecordCount-1, 1] := vFileName;
  GridTableView1.DataController.PostEditingData;

  vWaitImage := '';
  for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    vWaitImage := vWaitImage + Format('"%s",',[GridTableView1.DataController.Values[vIndex, 1]]);

  vWaitImage := Format('{"url":"%s","head":"%s","store":"%s","FILE":[%s]}',[vDownURL, HeadStoreCode, StandardStore, LeftStr(vWaitImage,Length(vWaitImage)-1)]);

  ExecQuery('update CUSTOMER '
           +'   set TABLET_WAITIMAGE =:P1 '
           +' where CD_COMPANY  =:P0; ',
           [HeadStoreCode,
            vWaitImage],true, RestBaseURL);

end;

procedure THeadSetupForm.AddButtonClick(Sender: TObject);
var Files: TSearchRec;
    vIndex : Integer;
    vHttp: TIdHTTP;
    vParams: TIdMultiPartFormDataStream;
    vResponse: string;
    vURL :String;
    vExist :Boolean;
begin
  PictureLoadDialog.Filter := '이미지|*.jpg|이미지|*.png|동영상|*.avi';
  if not PictureLoadDialog.Execute then exit;

  FindFirst(PictureLoadDialog.FileName,faArchive,Files);

  if Length(AnsiString(Files.Name)) <> Length(Files.Name)  then
  begin
    MsgBox('영문 화일명만 가능합니다');
    Exit;
  end;

  vExist := false;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, 1] = Files.Name then
    begin
      vExist := true;
      MsgBox('이미 등록된 화일입니다');
      Break;
    end;
  end;

  if vExist then Exit;

  try
    vHttp   := TIdHTTP.Create;
    vParams := TIdMultiPartFormDataStream.Create;
    vURL    := GetHttpURL+'Action_FileUp';

    try
      Screen.Cursor := crArrow;
      vHttp.Request.CustomHeaders.AddValue('COMP_ID',HeadStoreCode);
      vHttp.Request.CustomHeaders.AddValue('JOB_GBN','U');
      vParams.AddFile('0', PictureLoadDialog.FileName);
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

  GridTableView.DataController.AppendRecord;
  GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := IntToStr(GridTableView.DataController.RecordCount);
  GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := Files.Name;
  GridTableView.DataController.PostEditingData;

  ExecQuery('insert into MS_CODE(CD_HEAD, '
           +'                    CD_STORE, '
           +'                    CD_KIND, '
           +'                    CD_CODE, '
           +'                    NM_CODE1, '
           +'                    NM_CODE2) '
           +'             values(:P0, '
           +'                    :P1, '
           +'                    ''97'', '
           +'                    (select LPad((Cast(Ifnull(Max(CD_CODE),''0'') as int) + 1),3,''0'')   '
           +'                       from MS_CODE as s '
           +'                      where CD_HEAD =:P0 '
           +'                        and CD_STORE =:P1 '
           +'                        and CD_KIND  =''97''), '
           +'                    :P2,'
           +'                    ''HEAD'') '
           +'ON DUPLICATE KEY UPDATE DT_CHANGE = Now();',
           [HeadStoreCode,
            StandardStore,
            Files.Name],true);
  ExecQuery('',[],true);
end;

procedure THeadSetupForm.AppIDDupCheckButtonClick(Sender: TObject);
begin
  inherited;
  if AppIDDupCheckButton.Caption = '중복체크' then
  begin
    if Length(AppIDEdit.Text) < 5 then
    begin
      MsgBox('최소 5자이상이어야 합니다');
      Exit;
    end;

    try
      OpenQuery('select APP_ID '
               +'  from MS_APP_USER '
               +' where APP_ID   = :P0 ',
               [AppIDEdit.Text],false, jsonSMSDBURL);
      if not Query.Eof then
      begin
        MsgBox('사용 중인 아이디입니다');
        Exit;
      end
      else
      begin
        MsgBox('사용 가능한 아이디입니다');
        AppIDEdit.Tag := 1;
        AppPWDEdit.SetFocus;
      end;
    finally
      FinishQuery;
    end;
  end
  else if AskBox('아이디를 삭제하시겠습니까?') then
  begin
    if ExecQuery('delete'
                +'  from MS_APP_USER '
                +' where APP_ID   = :P0 ',
                [AppIDEdit.Text],true,jsonSMSDBURL) then
    begin
      AppIDEdit.Enabled      := true;
      AppIDEdit.Clear;
      AppPWDEdit.Clear;
      AppPWDConfirmEdit.Clear;
      AppIDDupCheckButton.Caption := '중복체크';

      AppIDEdit.EditModified     := false;
      AppPWDEdit.EditModified    := false;
    end;
  end;
end;

procedure THeadSetupForm.AppUserSaveButtonClick(Sender: TObject);
var vResult : Boolean;
begin
  inherited;
  if AppIDEdit.Tag = 0 then
  begin
    MsgBox('아이디 중복체크를 해야합니다');
    AppIDEdit.SetFocus;
    Exit;
  end;
  if AppPWDEdit.EditModified and (AppPWDEdit.Text = '') then
  begin
    MsgBox('비밀번호를 입력해야합니다');
    AppPWDEdit.SetFocus;
    Exit;
  end;
  if AppPWDEdit.EditModified and (AppPWDEdit.Text <> AppPWDConfirmEdit.Text) then
  begin
    MsgBox('비밀번호가 일치하지 않습니다');
    AppPWDConfirmEdit.SetFocus;
    Exit;
  end;

  vResult :=ExecQuery('insert into MS_APP_USER(APP_ID, '
                     +'                        APP_PWD, '
                     +'                        NM_USER, '
                     +'                        CD_CUSTOMER, '
                     +'                        CD_HEAD, '
                     +'                        CD_SAWON_CHG, '
                     +'                        DT_INSERT, '
                     +'                        DT_CHANGE) '
                     +'                Values(:P0, '
                     +'                        AES_Encrypt(:P1,71483), '
                     +'                       :P2, '
                     +'                       :P3, '
                     +'                       :P4, '
                     +'                       :P5, '
                     +'                       NOW(), '
                     +'                       NOW()) '
                     +'ON DUPLICATE KEY UPDATE APP_PWD      =AES_Encrypt(:P1,71483), '
                     +'                        NM_USER      =:P2, '
                     +'                        CD_CUSTOMER  =:P3, '
                     +'                        CD_HEAD      =:P4, '
                     +'                        CD_SAWON_CHG =:P5, '
                     +'                        DT_CHANGE    =NOW() ',
                     [AppIDEdit.Text,
                      AppPWDEdit.Text,
                      HeadStoreName,
                      StandardStore,
                      HeadStoreCode,
                      UserCode],true,jsonSMSDBURL);

  if vResult then
  begin
    AppIDDupCheckButton.Caption := '삭제';
    AppIDEdit.Enabled           := false;
    MsgBox('저장되었습니다');
  end;
end;

procedure THeadSetupForm.DeleteButtonClick(Sender: TObject);
var vIdHTTP     : TIdHTTP;
    vRequest : TStringStream;
    vResponse :String;
    vFileName :String;
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

  vFileName := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 1],'');

  ExecQuery('delete from MS_CODE '
          +' where CD_HEAD  =:P0 '
          +'   and CD_KIND  =''97'' '
          +'   and NM_CODE1 = :P1;',
          [HeadStoreCode,
           vFileName],true);

  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);

  vIdHTTP  := TIdHTTP.Create;
  vRequest := TStringStream.Create;
  try
    vIdHTTP.Request.CustomHeaders.AddValue('COMP_ID',HeadStoreCode);
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

function THeadSetupForm.DoSave: Boolean;
  procedure SetCheckBoxComboBox(aIndex:Integer);
  var vIndex :Integer;
  begin
    For vIndex := 0 to ComponentCount-1 do
    begin
      //주문화면 메뉴분류는 예외
      if (Components[vIndex] is TcxCheckBox) and ( (Components[vIndex] as TcxCheckBox).Name = 'Option'+FormatFloat('000',aIndex)+'CheckBox' ) then
      begin
        Option[aIndex] := Ifthen((Components[vIndex] as TcxCheckBox).Checked,'1','0')[1];
        Break;
      end
      else if (Components[vIndex] is TcxComboBox) and ( (Components[vIndex] as TcxComboBox).Name = 'Option'+FormatFloat('000',aIndex)+'ComboBox' ) then
      begin
        Option[aIndex] := IntToStr((Components[vIndex] as TcxComboBox).ItemIndex)[1];
        Break;
      end
      else if (Components[vIndex] is TcxSpinEdit) and ( (Components[vIndex] as TcxSpinEdit).Name = 'Option'+FormatFloat('000',aIndex)+'SpinEdit' ) then
      begin
        Option[aIndex] := IntToStr((Components[vIndex] as TcxSpinEdit).Value)[1];
        Break;
      end
      else if (Components[vIndex] is TcxRadioGroup) and ( (Components[vIndex] as TcxRadioGroup).Name = 'Option'+FormatFloat('000',aIndex)+'RadioGroup' ) then
      begin
        Option[aIndex] := IntToStr((Components[vIndex] as TcxRadioGroup).ItemIndex)[1];
        Break;
      end;
    end;
  end;
var vIndex :Integer;
    vKind, vSQL :String;
    vFileName, vTemp :String;
begin
  with TProxyCheckForm.Create(self) do
    try
      if ShowModal <> mrOK then
        Exit;
    finally
      Free;
    end;

  Result := false;
  for vIndex := 1 to Length(Option) do
    SetCheckBoxComboBox(vIndex);

  vTemp := '';
  for vIndex := 0 to LanguageCheckListBox.Count-1 do
    vTemp := vTemp + Ifthen(LanguageCheckListBox.Items.Items[vIndex].State = cbsChecked, '1','0');


  ExecQuery('insert into MS_STORE(CD_HEAD, '
           +'                     CD_STORE, '
           +'                     OPTIONS, '
           +'                     SELFMENU_LEN, '
           +'                     SELFMENU_PREFIX, '
           +'                     SELFGOODS_LEN, '
           +'                     SELFGOODS_PREFIX, '
           +'                     COUPON_PREFIX, '
           +'                     COUPON_LEN) '
           +'           values(:P0, '
           +'                  :P1, '
           +'                  :P2, '
           +'                  :P3, '
           +'                  :P4, '
           +'                  :P5, '
           +'                  :P6, '
           +'                  :P7, '
           +'                  :P8) '
           +'ON DUPLICATE KEY UPDATE OPTIONS	        =:P2, '
           +'                        SELFMENU_LEN     =:P3, '
           +'                        SELFMENU_PREFIX  =:P4, '
           +'                        SELFGOODS_LEN    =:P5, '
           +'                        SELFGOODS_PREFIX =:P6, '
           +'                        COUPON_PREFIX    =:P7, '
           +'                        COUPON_LEN       =:P8;',
           [HeadStoreCode,
            StandardStore,
            Option,
            StrToIntDef(GetStrPointerData(MenuLengthComboBox),8),
            MenuPrefixEdit.Text,
            StrToIntDef(GetStrPointerData(GoodsLengthComboBox),8),
            GoodsPrefixEdit.Text,
            CouponPrefixEdit.Text,
            CouponLengthEdit.EditValue],false);

  ExecQuery('insert into MS_STORE_ETC(CD_HEAD, '
           +'                         CD_STORE, '
           +'                         KIOSK_LANGUAGE) '
           +'           values(:P0, '
           +'                  :P1, '
           +'                  :P2) '
           +'ON DUPLICATE KEY UPDATE KIOSK_LANGUAGE   =:P2;',
           [HeadStoreCode,
            StandardStore,
            vTemp],false);

  ExecQuery('update MS_STORE '
           +'   set OPTIONS           = StringPosReplace(OPTIONS,21,  :P2), '
           +'       OPTIONS           = StringPosReplace(OPTIONS,258, :P3), '
           +'       OPTIONS           = StringPosReplace(OPTIONS,403, :P4), '
           +'       OPTIONS           = StringPosReplace(OPTIONS,457, :P5), '
           +'       OPTIONS           = StringPosReplace(OPTIONS,428, :P6), '
           +'       OPTIONS           = StringPosReplace(OPTIONS,57,  :P7), '
           +'       OPTIONS           = StringPosReplace(OPTIONS,485, :P8), '
           +'       DT_CHANGE         = Now() '
           +' where CD_HEAD =:P0 '
           +'   and CD_STORE <> :P1;',
           [HeadStoreCode,
            StandardStore,
            Ifthen(Option021CheckBox.Checked,'1','0'),
            Ifthen(Option258CheckBox.Checked,'1','0'),
            Ifthen(Option403CheckBox.Checked,'1','0'),
            Ifthen(Option457CheckBox.Checked,'1','0')+IntToStr(Option458ComboBox.ItemIndex),
            Ifthen(Option428CheckBox.Checked,'1','0')+Option429SpinEdit.Text+Option430SpinEdit.Text,
            Ifthen(Option057CheckBox.Checked,'1','0'),
            Ifthen(Option485CheckBox.Checked,'1','0')],false);

  Result := ExecQuery('update MS_STORE_ETC '
                     +'   set KIOSK_LANGUAGE =:P2 '
                     +' where CD_HEAD    =:P0'
                     +'   and CD_STORE <> :P1;',
                     [HeadStoreCode,
                      StandardStore,
                      vTemp],true);

  if Result then
    HeadOptions := Option;
end;


procedure THeadSetupForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = AppIDEdit then
  begin
    AppIDEdit.Tag := 0;
  end;
end;

end.
