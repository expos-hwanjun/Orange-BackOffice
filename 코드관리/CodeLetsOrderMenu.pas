unit CodeLetsOrderMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxImage, cxGridTableView, cxGridCustomTableView, cxGridCardView,
  cxGridCustomLayoutView, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView, cxGrid,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvSplitter, cxCurrencyEdit, Vcl.Menus, PNGImage, ToolPanels,
  System.ImageList, Vcl.ImgList, Vcl.ExtDlgs, Math, StrUtils, cxMemo,
  REST.Client, REST.Types, System.JSON, IniFiles, IPPeerClient,
  Data.Bind.Components, Data.Bind.ObjectScope, IdHTTP, System.IOUtils,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMultiPartFormData, ShellAPI,
  Vcl.OleCtrls, SHDocVw, AdvPanel, WebImage, Vcl.StdCtrls, cxButtons,
  System.Net.HttpClient, Vcl.Buttons, cxGroupBox, dxDateRanges,
  dxScrollbarAnnotations, cxImageList, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvOfficePager, AdvOfficePagerStylers, ActiveX, AdvScrollControl,
  AdvRichEditorBase, AdvRichEditor, dxShellDialogs;

type
  TcxGridDataControllerAccess = class (TcxGridDataController);

type
  TCodeLetsOrderMenuForm = class(TInheritGridEditForm)
    cvGrid: TcxGrid;
    GridCardView: TcxGridCardView;
    GridCardViewImage: TcxGridCardViewRow;
    GridCardViewMenuCode: TcxGridCardViewRow;
    GridCardViewMenuName: TcxGridCardViewRow;
    GridCardViewSalePrice: TcxGridCardViewRow;
    GridCardViewFileName: TcxGridCardViewRow;
    GridLevel1: TcxGridLevel;
    GridTableViewClassCode: TcxGridColumn;
    GridTableViewClassName: TcxGridColumn;
    GridTableViewPosition: TcxGridColumn;
    PopupMenu: TPopupMenu;
    AdvToolBar1: TAdvToolBar;
    UpButton: TAdvGlowButton;
    DownButton: TAdvGlowButton;
    MoveSaveButton: TAdvGlowButton;
    GridCardViewPosition: TcxGridCardViewRow;
    GridCardViewMenuInfo: TcxGridCardViewRow;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    MenuDeleteItem: TMenuItem;
    ClassPopupMenu: TPopupMenu;
    ClassAddItem: TMenuItem;
    ClassDeleteItem: TMenuItem;
    ClassRenameItem: TMenuItem;
    MenuAddItem: TMenuItem;
    N1: TMenuItem;
    MenuUpItem: TMenuItem;
    MenuDownItem: TMenuItem;
    N2: TMenuItem;
    ClassUpItem: TMenuItem;
    ClassDownItem: TMenuItem;
    SelectLabel: TcxLabel;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    GridCardViewYnUse: TcxGridCardViewRow;
    WebSearchButton: TAdvGlowButton;
    PopupPanel: TAdvPanel;
    ImageLoadButton: TAdvGlowButton;
    ImageDeleteButton: TAdvGlowButton;
    MenuInfoPanel: TAdvPanel;
    MenuInfoMemo: TcxMemo;
    MenuInfoOKButton: TAdvGlowButton;
    ConditionAutoButton: TAdvGlowButton;
    ConditionRestoreButton: TAdvGlowButton;
    MenuImage: TcxImage;
    ImageCloseButton: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ImageList: TcxImageList;
    GridCardViewLetsOrderImageURL: TcxGridCardViewRow;
    IdSSLIOHandlerSocketOpenSSL2: TIdSSLIOHandlerSocketOpenSSL;
    PictureLoadDialog: TdxOpenFileDialog;
    LetsOrderApplyButton: TAdvGlowButton;
    procedure PopupMenuPopup(Sender: TObject);
    procedure GridCardViewImagePropertiesPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImageLoadButtonClick(Sender: TObject);
    procedure ImageDeleteButtonClick(Sender: TObject);
    procedure UpButtonClick(Sender: TObject);
    procedure DownButtonClick(Sender: TObject);
    procedure MoveSaveButtonClick(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure cvGridEnter(Sender: TObject);
    procedure cvGridExit(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure MenuInfoOKButtonClick(Sender: TObject);
    procedure GridCardViewMenuInfoPropertiesPopup(Sender: TObject);
    procedure MenuDeleteItemClick(Sender: TObject);
    procedure ClassAddItemClick(Sender: TObject);
    procedure ClassDeleteItemClick(Sender: TObject);
    procedure ClassRenameItemClick(Sender: TObject);
    procedure MenuAddItemClick(Sender: TObject);
    procedure GridCardViewStylesGetCardBorderStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AStyle: TcxStyle);
    procedure WebSearchButtonClick(Sender: TObject);
    procedure ImageCloseButtonClick(Sender: TObject);
    procedure ConditionAutoButtonClick(Sender: TObject);
    procedure ConditionRestoreButtonClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LetsOrderApplyButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FocusedGrid: TcxGrid;
    procedure MoveRow(aUp:Boolean);
    procedure SetMenuImage(aImageURL, aMenuCode:String);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoNew: Boolean; override;
    function  DoSave: Boolean; override;                        // 저장
    procedure SetChanged(aChanged: Boolean); override;
  end;

var
  CodeLetsOrderMenuForm: TCodeLetsOrderMenuForm;

implementation
uses  Common, DBModule, Help, Main;
{$R *.dfm}

{ TCodeMobieCategoryForm }
function TCodeLetsOrderMenuForm.DoSearch: Boolean;
begin
  OpenQuery('select NO_POSITION, '
           +'       CD_LARGE, '
           +'       NM_LARGE '
           +'  from MS_LARGE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_GUBUN =:P2 '
           +' order by NO_POSITION ',
           [HeadStoreCode,
            Ifthen(Tag=0, StoreCode, StandardStore),
            GetStrPointerData(ConditionToolBarComboBox)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TCodeLetsOrderMenuForm.DownButtonClick(Sender: TObject);
begin
  inherited;
  MoveRow(false);
end;

procedure TCodeLetsOrderMenuForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if LetsOrderApplyButton.Hint = '미적용' then
    LetsOrderApplyButtonClick(nil);
end;

procedure TCodeLetsOrderMenuForm.FormCreate(Sender: TObject);
var vIndex :Integer;
    vCode: PStrPointer;
begin
  inherited;
  New(vCode);
  vCode^.Data := '99';
  ConditionToolBarComboBox.Properties.Items.AddObject('테이블주문', TObject(vCode));
  New(vCode);
  vCode^.Data := '98';
  ConditionToolBarComboBox.Properties.Items.AddObject('포장주문', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;

  PopupPanel.Visible := false;
  MenuInfoPanel.Visible := false;
  GridTableView.PopupMenu := ClassPopupMenu;

  if Tag = 1 then
    SetWorkStoreList;
end;

procedure TCodeLetsOrderMenuForm.FormShow(Sender: TObject);
begin
  inherited;
  ButtonToolBarSearchButtonClick(ButtonToolBarSearchButton);
end;

procedure TCodeLetsOrderMenuForm.GridCardViewImagePropertiesPopup(
  Sender: TObject);
begin
  inherited;
  SetMenuImage(GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewLetsOrderImageURL.Index], GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewFileName.Index])
end;

procedure TCodeLetsOrderMenuForm.GridCardViewMenuInfoPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  MenuInfoMemo.Text := NVL(GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewMenuInfo.Index],'');
end;

procedure TCodeLetsOrderMenuForm.GridCardViewStylesGetCardBorderStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridCardViewYnUse.Index] <> 'Y' then
    AStyle := StyleFontRed;
end;

procedure TCodeLetsOrderMenuForm.ImageCloseButtonClick(Sender: TObject);
begin
  inherited;
  TcxPopupEdit(GridCardView.Controller.EditingController.Edit).DroppedDown := false;
end;

procedure TCodeLetsOrderMenuForm.ImageDeleteButtonClick(Sender: TObject);
var vFileName:String;
begin
  inherited;
  if not AskBox('이미지를 삭제하시겠습니까?') then Exit;

  vFileName := GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewFileName.Index];
  ImageDeleteButton.Enabled := false;

  if LetsOrderImageDelete(vFileName, 'menu') then
    MenuImage.Picture.Graphic := nil
  else
  begin
    ImageDeleteButton.Enabled := true;
    Exit;
  end;

  GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewFileName.Index] := '';
  GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewLetsOrderImageURL.Index] := '';
  GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewImage.Index]     := '';

  ExecQuery('update MS_MENU_IMAGE '
           +'   set IMG_SELFORDER     = '''', '
           +'       IMG_LETSORDER     = '''', '
           +'       IMG_LETSORDER_URL = '''', '
           +'       DT_CHANGE         = Now() '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_MENU  =:P2;'
           +'update MS_MENU '
           +'   set DT_CHANGE = Now() '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_MENU  =:P2;',
           [HeadStoreCode,
            Ifthen(Tag=0, StoreCode, StandardStore),
            GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewMenuCode.Index]], true);
end;

procedure TCodeLetsOrderMenuForm.ImageLoadButtonClick(Sender: TObject);
var vHttp: TIdHTTP;
    vURL,
    vFolder,
    vFileName,
    vResult    :String;
    vParams : TIdMultiPartFormDataStream;
    vFiles: TSearchRec;
    vImage :TImage;
    vResponseStream: TStringStream;
    vGUID : TGUID;
    vImageURL :String;
begin
  inherited;
  if not FileExists('libeay32.dll') then
    FileDownLoad('libeay32.dll');

  if not FileExists('ssleay32.dll') then
    FileDownLoad('ssleay32.dll');

  PictureLoadDialog.Filter := '그림 파일(*.jpg)|*.jpg|그림화일(*.jpeg)|*.jpeg)';

  if PictureLoadDialog.Execute then
  begin
    FindFirst(PictureLoadDialog.FileName,faArchive,vFiles);

    vFileName := GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewMenuCode.Index]+'.jpg';
    vImageURL := LetsOrderImageUpload(PictureLoadDialog.FileName, vFileName, 'menu');
    LetsOrderImageInvalidate;

    if (vResult= '{"message":"Completed uploading image"}') or (vImageURL <> '') then
    begin
      ExecQuery('insert into MS_MENU_IMAGE(CD_HEAD, '
               +'                          CD_STORE, '
               +'                          CD_MENU, '
               +'                          IMG_LETSORDER, '
               +'                          IMG_LETSORDER_URL, '
               +'                          DT_CHANGE, '
               +'                          DT_INSERT) '
               +'                  values(:P0, '
               +'                         :P1, '
               +'                         :P2, '
               +'                         :P3, '
               +'                         :P4, '
               +'                          NOW(), '
               +'                          NOW()) '
               +'ON DUPLICATE KEY UPDATE '
               +'       IMG_LETSORDER     =:P3, '
               +'       IMG_LETSORDER_URL =:P4, '
               +'       DT_CHANGE         = NOW();'
               +'update MS_MENU '                          //메뉴마스터에도 변경일시를 바꿔줘야한다
               +'   set DT_CHANGE = NOW() '
               +' where CD_HEAD = :P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MENU  =:P2;',
               [HeadStoreCode,
                StoreCode,
                GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewMenuCode.Index],
                vFileName,
                vImageURL], true);

      GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewFileName.Index] := vFileName;
      GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewLetsOrderImageURL.Index] := vImageURL;
      GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewImage.Index]     := vFileName;

      ShowMsg('업로드가 정상처리 되었습니다');
      TcxPopupEdit(GridCardView.Controller.EditingController.Edit).DroppedDown := false;
    end;
  end;
end;



procedure TCodeLetsOrderMenuForm.MenuAddItemClick(Sender: TObject);
begin
  inherited;
  ButtonToolBarNewButtonClick(nil);
end;

procedure TCodeLetsOrderMenuForm.MenuDeleteItemClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  vIndex := GridCardView.DataController.GetFocusedRecordIndex;
  GridCardView.DataController.DeleteRecord(GridCardView.DataController.GetFocusedRecordIndex);
  if vIndex < GridCardView.DataController.RecordCount then
    GridCardView.Controller.FocusedRecordIndex := vIndex
  else if GridCardView.DataController.RecordCount > 0 then
    GridCardView.Controller.FocusedRecordIndex := vIndex - 1;
  isChanged := true;
end;

procedure TCodeLetsOrderMenuForm.MenuInfoOKButtonClick(Sender: TObject);
begin
  inherited;
  if Tag = 0 then
    ExecQuery('insert into MS_MENU_IMAGE(CD_HEAD, '
             +'                          CD_STORE, '
             +'                          CD_MENU, '
             +'                          MENU_INFO, '
             +'                          DT_CHANGE, '
             +'                          DT_INSERT) '
             +'                  values(:P0, '
             +'                         :P1, '
             +'                         :P2, '
             +'                         :P3, '
             +'                          NOW(), '
             +'                          NOW()) '
             +'ON DUPLICATE KEY UPDATE '
             +'       MENU_INFO         =:P3, '
             +'       DT_CHANGE         = NOW(); ',
             [HeadStoreCode,
              StoreCode,
              GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewMenuCode.Index],
              MenuInfoMemo.Text],true)
  else
    ExecQuery('insert into MS_MENU_IMAGE(CD_HEAD, '
             +'                          CD_STORE, '
             +'                          CD_MENU, '
             +'                          MENU_INFO, '
             +'                          DT_CHANGE, '
             +'                          DT_INSERT) '
             +'select CD_HEAD, '
             +'       CD_STORE, '
             +'       :P1, '
             +'       :P2, '
             +'       NOW(), '
             +'       NOW() '
             +'  from MS_STORE '
             +' where CD_HEAD = :P0 '
             +'ON DUPLICATE KEY UPDATE '
             +'       MENU_INFO         =:P2, '
             +'       DT_CHANGE         = NOW(); ',
             [HeadStoreCode,
              GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewMenuCode.Index],
              MenuInfoMemo.Text],true);
  GridCardView.DataController.Values[GridCardView.DataController.GetFocusedRecordIndex, GridCardViewMenuInfo.Index] := MenuInfoMemo.Text;
  TcxPopupEdit(GridCardView.Controller.EditingController.Edit).DroppedDown := false;
end;

procedure TCodeLetsOrderMenuForm.MoveRow(aUp: Boolean);
var
  vCurIndex, vNewIndex, vTempIndex, vIndex: integer;
begin
  if FocusedGrid = Grid then
  begin
    if GridTableView.DataController.RecordCount = 0 then Exit;

    vCurIndex := GridTableView.DataController.FocusedRecordIndex;
    if vCurIndex < 0 then Exit;

    if aUp and (vCurIndex = 0) then Exit;
    if not aUp and (vCurIndex = GridTableView.DataController.RecordCount-1) then Exit;
    vTempIndex := Ifthen(aUp, vCurIndex -1, vCurIndex +1);

    GridTableView.Controller.ClearSelection;
    with TcxGridDataControllerAccess(GridTableView.DataController) do
    begin
      BeginUpdate;
      try
        if vCurIndex < vTempIndex then
          inc(vTempIndex);
        vNewIndex := InsertRecord(vTempIndex);
        if vCurIndex > vNewIndex then
          inc(vCurIndex);
        CopyRecord(vCurIndex, vNewIndex);
        if vCurIndex < vNewIndex then
          dec(vNewIndex);
         DeleteRecord(vCurIndex);
      finally
        for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
          GridTableView.DataController.Values[vIndex, GridTableViewPosition.Index] := vIndex+1;

        FocusedRecordIndex := vNewIndex;
        EndUpdate;
      end;
    end;
    GridTableView.DataController.FocusedRecordIndex := vNewIndex;
    MoveSaveButton.Enabled := true;
    Grid.SetFocus;
  end
  else if FocusedGrid = cvGrid then
  begin
    if GridCardView.DataController.RecordCount = 0 then Exit;

    vCurIndex := GridCardView.DataController.FocusedRecordIndex;
    if vCurIndex < 0 then Exit;

    if aUp and (vCurIndex = 0) then Exit;
    if not aUp and (vCurIndex = GridCardView.DataController.RecordCount-1) then Exit;
    vTempIndex := Ifthen(aUp, vCurIndex -1, vCurIndex +1);

    GridCardView.Controller.ClearSelection;
    with TcxGridDataControllerAccess(GridCardView.DataController) do
    begin
      BeginUpdate;
      try
        if vCurIndex < vTempIndex then
          inc(vTempIndex);
        vNewIndex := InsertRecord(vTempIndex);
        if vCurIndex > vNewIndex then
          inc(vCurIndex);
        CopyRecord(vCurIndex, vNewIndex);
        if vCurIndex < vNewIndex then
          dec(vNewIndex);
         DeleteRecord(vCurIndex);
      finally
        for vIndex := 0 to GridCardView.DataController.RecordCount-1 do
          GridCardView.DataController.Values[vIndex, GridCardViewPosition.Index] := vIndex+1;

        FocusedRecordIndex := vNewIndex;
        EndUpdate;
      end;
    end;
    GridCardView.DataController.FocusedRecordIndex := vNewIndex;
    MoveSaveButton.Enabled := true;
    isChanged := true;
    cvGrid.SetFocus;
  end;
end;

procedure TCodeLetsOrderMenuForm.MoveSaveButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    ExecQuery('update MS_LARGE '
             +'   set NO_POSITION = :P3, '
             +'       DT_CHANGE   = Now() '
             +' where CD_HEAD  =:P0 '
             +Format(' and  CD_STORE =''%s'' ',[Ifthen(Tag=0, StoreCode, StandardStore)])
             +'   and CD_GUBUN =:P1 '
             +'   and CD_LARGE =:P2;',
             [HeadStoreCode,
              GetStrPointerData(ConditionToolBarComboBox),
              GridTableView.DataController.Values[vIndex, GridTableViewClassCode.Index],
              vIndex + 1],false);
  end;
  if ExecQuery('',[],true) then
  begin
    LetsOrderSync('category');
    ExecQuery('delete from LETSORDER_SYNC '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and NM_TABLE in (''MS_LARGE'',''MS_SMALL''); '
              +'delete from LETSORDER_DELETE '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and NM_TABLE in (''MS_PLU_M'',''MS_PLU_D''); ',
             [HeadStoreCode,
              StoreCode],true);
  end;
  MoveSaveButton.Enabled := false;
end;

procedure TCodeLetsOrderMenuForm.PopupMenuPopup(Sender: TObject);
begin
  inherited;
  if GridCardView.DataController.GetFocusedRecordIndex < 0 then Exit;
end;

procedure TCodeLetsOrderMenuForm.SetChanged(aChanged: Boolean);
begin
  inherited;
  ButtonToolBarNewButton.Enabled   := true;
end;

procedure TCodeLetsOrderMenuForm.SetMenuImage(aImageURL, aMenuCode: String);
var vRestClient         :TRestClient;
    vRestRequest        :TRestRequest;
    vRESTResponse       :TRESTResponse;

    vJSONObject         :TJSONObject;
    vJsonArray          :TJSONArray;
    vJsonValue          :TJSONValue;
    vData,
    vURL, vImgUrl   :String;
    vIndex :Integer;

   vHttpClient: THttpClient;
   vMemStream: TMemoryStream;
   vStream   : TStream;
   vFolder   : String;
begin
  if aMenuCode = '' then
  begin
    MenuImage.Picture.Graphic := nil;
    ImageDeleteButton.Enabled := false;
    Exit;
  end;

  vFolder := Format('%s\Image\LetsOrder\%s\%s\',[Folder,HeadStoreCode,StoreCode]);
  if not DirectoryExists(vFolder) then
    ForceDirectories(vFolder);

  if aImageURL <> '' then
  begin
    vMemStream :=TMemoryStream.Create;
    try
      vHttpClient:=THttpClient.Create;
      try
        vHttpClient.Get(aImageURL, vMemStream);
      finally
        FreeAndNil(vHttpClient);
      end;
      vMemStream.SaveToFile(vFolder+aMenuCode);
      try
        MenuImage.Picture.LoadFromFile(vFolder+aMenuCode);
      except
        ErrBox('이미지화일 형식이 올바르지 않습니다');
        Exit;
      end;
    finally
      FreeAndNil(vMemStream);
    end;
    ImageDeleteButton.Enabled := true;
  end
  else
    ImageDeleteButton.Enabled := false;
end;

procedure TCodeLetsOrderMenuForm.UpButtonClick(Sender: TObject);
begin
  inherited;
  MoveRow(true);
end;

procedure TCodeLetsOrderMenuForm.WebSearchButtonClick(Sender: TObject);
var vURL :String;
begin
  inherited;
  vURL := 'http://www.allproductkorea.or.kr/products/search';
  if ShellExecute(self.WindowHandle,'open','chrome.exe', PWideChar(vURL), nil, SW_SHOW) < 0 then
    ShellExecute(self.WindowHandle,'open','msedge.exe', PWideChar(vURL), nil, SW_SHOW);
end;

procedure TCodeLetsOrderMenuForm.DoGridLink;
var
  vValue: Ansistring;
  vPicture: TPicture;
begin
  inherited;
  OpenQuery('select a.CD_MENU, '
           +'       b.NM_MENU_SHORT, '
           +'       b.PR_SALE, '
           +'       a.NO_POSITION, '
           +'       c.MENU_INFO, '
           +'       c.IMG_SELFORDER, '
           +'       c.IMG_LETSORDER, '
           +'       c.IMG_LETSORDER_URL, '
           +'       b.YN_USE '
           +'  from MS_SMALL as a left outer join '
           +'       MS_MENU  as b on b.CD_HEAD  = a.CD_HEAD '
           +'                    and b.CD_STORE = a.CD_STORE '
           +'                    and b.CD_MENU  = a.CD_MENU left outer join '
           +'       MS_MENU_IMAGE as c on c.CD_HEAD  = a.CD_HEAD '
           +'                         and c.CD_STORE = a.CD_STORE '
           +'                         and c.CD_MENU  = a.CD_MENU '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and a.CD_GUBUN =:P2 '
           +'   and a.CD_LARGE =:P3 ',
           [HeadStoreCode,
            Ifthen(Tag=0, StoreCode, StandardStore),
            GetStrPointerData(ConditionToolBarComboBox),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewClassCode.Index]]);

  GridCardView.DataController.BeginUpdate;
  GridCardView.DataController.RecordCount := 0;
  while not Query.Eof do
  begin
    GridCardView.DataController.AppendRecord;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewMenuCode.Index]  := Query.FieldByName('CD_MENU').AsString;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewMenuName.Index]  := Query.FieldByName('NM_MENU_SHORT').AsString;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewSalePrice.Index] := Query.FieldByName('PR_SALE').AsInteger;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewMenuInfo.Index]  := Query.FieldByName('MENU_INFO').AsString;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewPosition.Index]  := Query.FieldByName('NO_POSITION').AsInteger;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewFileName.Index]  := Query.FieldByName('IMG_LETSORDER').AsString;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewImage.Index]     := Query.FieldByName('IMG_LETSORDER').AsString;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewLetsOrderImageURL.Index]  := Query.FieldByName('IMG_LETSORDER_URL').AsString;
    GridCardView.DataController.Values[GridCardView.DataController.RecordCount-1, GridCardViewYnUse.Index]     := Query.FieldByName('YN_USE').AsString;
    Query.Next;
  end;
  Query.Close;
  GridCardView.DataController.EndUpdate;
  if Self.Showing then
    cvGrid.SetFocus;
end;

function TCodeLetsOrderMenuForm.DoNew: Boolean;
  function GetClassCode:String;
  var vIndex :Integer;
  begin
    Result := '01';
    for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
    begin
      if Result < GridTableView.DataController.Values[vIndex, GridTableViewClassCode.Index] then
        Result := GridTableView.DataController.Values[vIndex, GridTableViewClassCode.Index];
    end;
  end;
var vTemp :String;
    vCode :String;
begin
  BlockInput(false);
  if GridTableView.DataController.RecordCount = 0 then
    GridCardView.DataController.RecordCount := 0;

  if InputQuery('분류명을 입력하세요','분류명',vTemp) then
  begin
    if GridTableView.DataController.RecordCount = 0 then
      vCode := '01'
    else
    begin
      vCode := GetClassCode;
      vCode := FormatFloat('00',StrToIntDef(vCode,0)+1);
    end;

    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewClassName.Index] := vTemp;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewClassCode.Index] := vCode;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewPosition.Index]  := GridTableView.DataController.RecordCount;
    GridTableView.Controller.FocusedRecordIndex := GridTableView.DataController.RecordCount-1;

    if Tag = 0 then
      Result := ExecQuery('insert into MS_LARGE(CD_HEAD, '
                         +'                     CD_STORE, '
                         +'                     CD_GUBUN, '
                         +'                     CD_LARGE, '
                         +'                     NO_POSITION, '
                         +'                     NM_LARGE, '
                         +'                     CD_SAWON_CHG) '
                         +'             values (:P0, '
                         +'                     :P1, '
                         +'                     :P2, '
                         +'                     :P3, '
                         +'                     :P4, '
                         +'                     :P5, '
                         +'                     :P6) '
                         +' ON DUPLICATE KEY UPDATE NO_POSITION  =:P4, '
                         +'                         NM_LARGE     =:P5, '
                         +'                         CD_SAWON_CHG =:P6;  ',
                        [HeadStoreCode,
                         StoreCode,
                         GetStrPointerData(ConditionToolBarComboBox),
                         vCode,
                         GridTableView.DataController.RecordCount,
                         vTemp,
                         UserCode])
    else
      Result := ExecQuery('insert into MS_LARGE(CD_HEAD, '
                         +'                     CD_STORE, '
                         +'                     CD_GUBUN, '
                         +'                     CD_LARGE, '
                         +'                     NO_POSITION, '
                         +'                     NM_LARGE, '
                         +'                     CD_SAWON_CHG) '
                         +'select CD_HEAD, '
                         +'       CD_STORE, '
                         +'       :P1, '
                         +'       :P2, '
                         +'       :P3, '
                         +'       :P4, '
                         +'       :P5 '
                         +'  from MS_STORE      '
                         +' where CD_HEAD = :P0 '
                         +' ON DUPLICATE KEY UPDATE NO_POSITION  =:P3, '
                         +'                         NM_LARGE     =:P4, '
                         +'                         CD_SAWON_CHG =:P5;  ',
                        [HeadStoreCode,
                         GetStrPointerData(ConditionToolBarComboBox),
                         vCode,
                         GridTableView.DataController.RecordCount,
                         vTemp,
                         UserCode]);
  end;
end;

procedure TCodeLetsOrderMenuForm.ButtonToolBarDeleteButtonClick(
  Sender: TObject);
var vIndex :Integer;
begin
  if FocusedGrid = Grid then
    inherited
  else if FocusedGrid = cvGrid then
  begin
    if GridCardView.DataController.GetFocusedRecordIndex < 0 then Exit;

    vIndex := GridCardView.DataController.GetFocusedRecordIndex;
    GridCardView.DataController.DeleteRecord(GridCardView.DataController.GetFocusedRecordIndex);
    if vIndex < GridCardView.DataController.RecordCount then
      GridCardView.Controller.FocusedRecordIndex := vIndex
    else if GridCardView.DataController.RecordCount > 0 then
      GridCardView.Controller.FocusedRecordIndex := vIndex - 1;
    isChanged := true;
  end;
end;

procedure TCodeLetsOrderMenuForm.GridEnter(Sender: TObject);
begin
  inherited;
  FocusedGrid := TcxGrid(Sender);
  ButtonToolBarNewButton.Caption  := '분류추가';
  SelectLabel.Caption             := ' [ 분류 ] ';
  ButtonToolBarNewButton.Enabled  := true;
  GridTableView.Styles.Background := StyleFocused;
  GridTableView.Styles.Content    := StyleFocused;
  MoveSaveButton.Visible          := true;
end;

procedure TCodeLetsOrderMenuForm.GridExit(Sender: TObject);
begin
  inherited;
  FocusedGrid := nil;
  GridTableView.Styles.Background := StyleOdd;
  GridTableView.Styles.Content    := StyleOdd;
  MoveSaveButton.Visible          := false;
end;

procedure TCodeLetsOrderMenuForm.ButtonToolBarNewButtonClick(Sender: TObject);
var vIndex, vRow :Integer;
begin
  if FocusedGrid = Grid then
  begin
    inherited;
    isChanged := false;
  end
  else
  begin
    with THelpForm.Create(Self) do
    try
      Caption := '메뉴 조회';
      GridTableViewCode.Caption  := '분류';
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Options.Filtering := true;
      GridTableViewCode.Options.Sorting   := true;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption  := '메뉴코드';
      GridTableViewName1.Width    := 80;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '메뉴이름';
      GridTableViewName2.Width   := 210;
      GridTableViewName3.Caption := '단가';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;
      GridTableView.OptionsSelection.MultiSelect := true;

      SQLText    := 'select    b.NM_CLASS, '
                   +'          a.CD_MENU, '                                //1
                   +'          a.NM_MENU_SHORT, '                                //2
                   +'          a.PR_SALE, '                                //3
                   +'          c.IMG_LETSORDER, '                          //4
                   +'          c.IMG_LETSORDER_URL, '                      //5
                   +'          c.IMG_MENUINFO, '                           //6
                   +'          c.IMG_SELFORDER '                           //7
                   +' from     MS_MENU       as a left outer join  '
                   +'          MS_MENU_CLASS as b on b.CD_HEAD  = a.CD_HEAD '
                   +'                            and b.CD_STORE = a.CD_STORE '
                   +'                            and b.CD_CLASS = Left(a.CD_CLASS,2) left outer join '
                   +'          MS_MENU_IMAGE as c on c.CD_HEAD  = a.CD_HEAD '
                   +'                            and c.CD_STORE = a.CD_STORE '
                   +'                            and c.CD_MENU  = a.CD_MENU '
                   +'where     a.CD_HEAD  =:P0 '
                   +Format('  and  a.CD_STORE =''%s'' ',[Ifthen(Tag=0, StoreCode, StandardStore)])
                   +'  and     (a.CD_MENU like ConCat(:P2,''%'') or a.NM_MENU like ConCat(''%'',:P2,''%'') ) '
                   +'  and     a.YN_USE   = ''Y'' '
                   +'  and     a.PR_SALE > 0 '
                   +'  and     a.DS_MENU_TYPE in (''N'',''C'',''S'') '
                   +'order by  a.CD_MENU';

      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Self.GridCardView.DataController.BeginFullUpdate;
        for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        begin
          vRow := GridCardView.DataController.FilteredIndexByRecordIndex[GridCardView.DataController.FindRecordIndexByText(0, GridCardViewMenuCode.Index, GridTableView.Controller.SelectedRecords[vIndex].Values[1], false, false, true)];
          if (vRow >= 0) and not AskBox('이미 등록된 메뉴입니다'#13'등록하시겠습니까?') then Continue;
          Self.GridCardView.DataController.AppendRecord;
          Self.GridCardView.Controller.FocusedRecordIndex := Self.GridCardView.DataController.RecordCount-1;
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewMenuCode.Index]  := GridTableView.Controller.SelectedRecords[vIndex].Values[1];
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewMenuName.Index]  := GridTableView.Controller.SelectedRecords[vIndex].Values[2];
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewSalePrice.Index] := GridTableView.Controller.SelectedRecords[vIndex].Values[3];
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewPosition.Index]  := Self.GridCardView.DataController.RecordCount;
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewFileName.Index]           := GridTableView.Controller.SelectedRecords[vIndex].Values[4];
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewImage.Index]              := GridTableView.Controller.SelectedRecords[vIndex].Values[4];
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewLetsOrderImageURL.Index]  := GridTableView.Controller.SelectedRecords[vIndex].Values[5];
          Self.GridCardView.DataController.Values[Self.GridCardView.DataController.RecordCount-1, Self.GridCardViewMenuInfo.Index]           := GridTableView.Controller.SelectedRecords[vIndex].Values[6];
        end;
        Self.GridCardView.Controller.FocusedRecordIndex := Self.GridCardView.DataController.RecordCount-1;
        Self.GridCardView.DataController.EndFullUpdate;
      end;
      isChanged := true;
    finally
      Free;
    end;
  end;
end;

procedure TCodeLetsOrderMenuForm.ClassAddItemClick(Sender: TObject);
begin
  inherited;
  ButtonToolBarNewButtonClick(nil);
end;

procedure TCodeLetsOrderMenuForm.ClassDeleteItemClick(Sender: TObject);
begin
  inherited;
  ButtonToolBarDeleteButtonClick(nil);
end;

procedure TCodeLetsOrderMenuForm.ClassRenameItemClick(Sender: TObject);
var vTemp :String;
begin
  inherited;
  if InputQuery('분류명을 입력하세요','분류명',vTemp) then
  begin
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewClassName.Index] := vTemp;

    ExecQuery('update MS_LARGE '
             +'   set NM_LARGE     =:P4, '
             +'       CD_SAWON_CHG =:P5 '
             +' where CD_HEAD  =:P0 '
             +Ifthen(Tag=0,' and CD_STORE =:P1 ','')
             +'   and CD_GUBUN =:P2 '
             +'   and CD_LARGE =:P3 ',
            [HeadStoreCode,
             StoreCode,
             GetStrPointerData(ConditionToolBarComboBox),
             GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewClassCode.Index],
             vTemp,
             UserCode]);
  end;
end;

procedure TCodeLetsOrderMenuForm.ConditionAutoButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재 등록 된 포스 PLU 기준으로 '+#13+'렛츠오더 메뉴를 등록하시겠습니까?') then Exit;

  try
    ExecQuery('delete from MS_LARGE '
             +' where CD_HEAD =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN =''99'';'
             +'delete from MS_SMALL '
             +' where CD_HEAD =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN =''99'';',
             [HeadStoreCode,
              StoreCode],false,RestDBURL);

    if ExecQuery('insert into MS_LARGE(CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE,  NO_POSITION, COLOR, CD_SAWON_CHG) '
                +'              select CD_HEAD, CD_STORE, ''99'', CD_LARGE, Replace(NM_LARGE,''|'',''''),  NO_POSITION, COLOR, :P2 '
                +'                from MS_LARGE '
                +'               where CD_HEAD  =:P0 '
                +'                 and CD_STORE =:P1 '
                +'                 and CD_GUBUN = ''01''; '
                +'insert into MS_SMALL(CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, CD_MENU, NM_VIEW,  NO_POSITION,  COLOR, CD_SAWON_CHG) '
                +'              select CD_HEAD, CD_STORE, ''99'', CD_LARGE, CD_MENU, Replace(NM_VIEW,''|'',''''), NO_POSITION,  COLOR, :P2 '
                +'                from MS_SMALL '
                +'               where CD_HEAD  =:P0 '
                +'                 and CD_STORE =:P1 '
                +'                 and CD_GUBUN = ''01''; ',
                [HeadStoreCode,
                 StoreCode,
                 UserCode],true, RestDBURL) then
      DoSearch;
  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      ShowMsg('저장하지 못했습니다', false, 5);
      ErrBox(E.Message);
      Exit;
    end;
  end;
end;

procedure TCodeLetsOrderMenuForm.ConditionRestoreButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('하루 전 데이터로 복원하시겠습니까?') then Exit;

  try
    OpenQuery('select Count(*) '
             +'  from MS_LARGE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_GUBUN in (''98'',''99'')',
             [HeadStoreCode,
              StoreCode],false,RestDBURL);
    if not Query.Fields[0].AsInteger = 0 then
    begin
      MsgBox('복원 할 데이터가 없습니다');
      Exit;
    end;
  finally
    Query.Close;
  end;

  ExecQuery('delete from MS_LARGE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_GUBUN in (''98'',''99'');'
           +'insert into MS_LARGE (CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE) '
           +' select CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NM_LARGE, NO_POSITION, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE '
           +'  from MS_LARGE_BACKUP '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_GUBUN in (''98'',''99'');'
           +'delete from MS_SMALL '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_GUBUN in (''98'',''99'');'
           +'insert into MS_SMALL (CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE) '
           +'select CD_HEAD, CD_STORE, CD_GUBUN, CD_LARGE, NO_POSITION, CD_MENU, NM_VIEW, COLOR, COLOR_HEX, YN_BLOCKING, CD_SAWON_CHG, DT_CHANGE '
           +'  from MS_SMALL_BACKUP '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_GUBUN in (''98'',''99'');',
           [HeadStoreCode,
            StoreCode],true,RestDBURL);

  DoSearch;
end;

procedure TCodeLetsOrderMenuForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
//  inherited;
  ClearGrid;
  isChanged := false;
  if DoSearch then
  begin
    GridTableView.Controller.FocusedRecordIndex := GridTableView.DataController.RecordCount-1;
    DoGridLink;
  end
  else
    ButtonToolBarNewButton.Enabled := false;
end;

procedure TCodeLetsOrderMenuForm.cvGridEnter(Sender: TObject);
begin
  inherited;
  FocusedGrid := TcxGrid(Sender);
  ButtonToolBarNewButton.Caption  := '메뉴추가';
  SelectLabel.Caption             := ' [ 메뉴 ] ';
  ButtonToolBarNewButton.Enabled  := true;
  GridCardView.Styles.Background := StyleFocused;
end;

procedure TCodeLetsOrderMenuForm.cvGridExit(Sender: TObject);
begin
  inherited;
  FocusedGrid := nil;
  GridCardView.Styles.Background := StyleOdd;
end;

function TCodeLetsOrderMenuForm.DoDelete: Boolean;
begin
  ExecQuery('update MS_LARGE '
           +'   set NO_POSITION = NO_POSITION - 1 '
           +' where CD_HEAD  =:P0 '
             +Ifthen(Tag=0,' and CD_STORE =:P1 ','')
           +'   and CD_GUBUN =:P2 '
           +'   and NO_POSITION > :P3;',
           [HeadStoreCode,
            StoreCode,
            GetStrPointerData(ConditionToolBarComboBox),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPosition.Index]], false,RestDBURL);

  ExecQuery('delete from MS_SMALL '
           +' where CD_HEAD  =:P0 '
           +Ifthen(Tag=0,' and CD_STORE =:P1 ','')
           +'   and CD_GUBUN =:P2 '
           +'   and CD_LARGE =:P3;',
           [HeadStoreCode,
            StoreCode,
            GetStrPointerData(ConditionToolBarComboBox),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewClassCode.Index]], false,RestDBURL);

  Result := ExecQuery('delete from MS_LARGE '
                     +' where CD_HEAD  =:P0 '
                     +Ifthen(Tag=0,' and CD_STORE =:P1 ','')
                     +'   and CD_GUBUN =:P2 '
                     +'   and CD_LARGE =:P3;',
                     [HeadStoreCode,
                      StoreCode,
                      GetStrPointerData(ConditionToolBarComboBox),
                      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewClassCode.Index]], true,RestDBURL);
end;


function TCodeLetsOrderMenuForm.DoSave: Boolean;
var vIndex, vIndex1, vRecordIndex :Integer;
    vSQL   :String;
begin
  if (Tag=1) and (HeadStoreCode = '00000000') then
  begin
    MsgBox('저장할 수 없는 본사입니다');
    Exit;
  end;

  if PrevRow = -1 then
    vRecordIndex := GridTableView.DataController.GetFocusedRecordIndex
  else
    vRecordIndex := PrevRow;

  ExecQuery('delete from MS_SMALL '
           +' where CD_HEAD  =:P0 '
           +Ifthen(Tag=0,' and CD_STORE =:P1 ','')
           +'   and CD_GUBUN =:P2 '
           +'   and CD_LARGE =:P3;',
           [HeadStoreCode,
            StoreCode,
            GetStrPointerData(ConditionToolBarComboBox),
            GridTableView.DataController.Values[vRecordIndex, GridTableViewClassCode.Index]], false);

  vSQL := '';
  if Tag = 0 then
  begin
    for vIndex := 0 to GridCardView.DataController.RecordCount-1 do
      vSQL := vSQL + Format('(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s''),',
                           [HeadStoreCode,
                            StoreCode,
                            GetStrPointerData(ConditionToolBarComboBox),
                            GridTableView.DataController.Values[vRecordIndex, GridTableViewClassCode.Index],
                            GridCardView.DataController.Values[vIndex, GridCardViewMenuCode.Index],
                            GridCardView.DataController.Values[vIndex, GridCardViewMenuName.Index],
                            vIndex + 1,
                            UserCode]);
  end
  else
  begin
    for vIndex := 0 to WorkStoreList.Count-1 do
    begin
      for vIndex1 := 0 to GridCardView.DataController.RecordCount-1 do
        vSQL := vSQL + Format('(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %d, ''%s''),',
                             [HeadStoreCode,
                              CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                              GetStrPointerData(ConditionToolBarComboBox),
                              GridTableView.DataController.Values[vRecordIndex, GridTableViewClassCode.Index],
                              GridCardView.DataController.Values[vIndex1, GridCardViewMenuCode.Index],
                              GridCardView.DataController.Values[vIndex1, GridCardViewMenuName.Index],
                              vIndex1 + 1,
                              UserCode]);
    end;
  end;


  if vSQL <> '' then
    vSQL := 'insert into MS_SMALL(CD_HEAD, '
           +'                     CD_STORE, '
           +'                     CD_GUBUN, '
           +'                     CD_LARGE, '
           +'                     CD_MENU, '
           +'                     NM_VIEW, '
           +'                     NO_POSITION, '
           +'                     CD_SAWON_CHG) '
           +'             values'+ LeftStr(vSQL, Length(vSQL)-1)+';';
  if ExecQuery(vSQL, [], true, RestDBURL) then
  begin
    isChanged := false;
    Result    := true;
    LetsOrderApplyButton.Hint := '미적용';
  end;
end;

procedure TCodeLetsOrderMenuForm.LetsOrderApplyButtonClick(Sender: TObject);
begin
  inherited;
  if LetsOrderSync('category') then
  begin
    ExecQuery('delete from LETSORDER_SYNC '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and NM_TABLE in (''MS_LARGE'',''MS_SMALL''); '
             +'delete from LETSORDER_DELETE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and NM_TABLE in (''MS_PLU_M'',''MS_PLU_D''); ',
            [HeadStoreCode,
             StoreCode],true, RestDBURL);
    LetsOrderApplyButton.Hint := '';
    if Sender <> nil then
      MsgBox('적용이 완료 됐습니다');
  end;

end;



end.
