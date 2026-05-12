unit HeadNoticePopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.OleCtrls, SHDocVw, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ExtCtrls, Vcl.ImgList,
  cxSpinEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxFontNameComboBox,
  Vcl.ToolWin, cxGroupBox, cxRadioGroup, cxCheckComboBox, cxLabel, cxCalendar,
  cxClasses, cxCheckBox, Menus, cxButtons, DB, StrUtils, dxCore, cxDateUtils,
  System.ImageList, EncdDecd, cxMemo, cxRichEdit, cxImage, Vcl.ExtDlgs, PNGImage,
  AdvScrollControl, AdvRichEditorBase, AdvRichEditor, AdvCustomComponent,
  cxCheckListBox, AdvToolBar, AdvToolBarExt, AdvRichEditorToolBar, AdvGlowButton,
  cxCustomListBox;

type
  THeadNoticePopupForm = class(TForm)
    ToolbarImages: TImageList;
    Timer1: TTimer;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    TitleEdit: TcxTextEdit;
    cxLabel3: TcxLabel;
    FromDateEdit: TcxDateEdit;
    ToDateEdit: TcxDateEdit;
    ConditionToolBarDateToLabel: TcxLabel;
    EditStyleController: TcxEditStyleController;
    cxGroupBox1: TcxGroupBox;
    PosCheckBox: TcxCheckBox;
    BSCheckBox: TcxCheckBox;
    PictureLoadDialog: TOpenPictureDialog;
    Editor: TAdvRichEditor;
    AdvRichEditorFormatToolBar1: TAdvRichEditorFormatToolBar;
    CloseButton: TAdvGlowButton;
    SaveButton: TAdvGlowButton;
    StorePopupEdit: TcxPopupEdit;
    StoreCheckListBox: TcxCheckListBox;
    AllCheckBox: TcxCheckBox;
    UnCheckBox: TcxCheckBox;
    NoticeEndCheckBox: TcxCheckBox;
    HotNewsCheckBox: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AllCheckBoxPropertiesChange(Sender: TObject);
  private
    BackItemList    :TStringList;
    function  GetCheckListBox(aList:TStringList; aText:String):Integer;
    function CurrText: TTextAttributes;
    procedure SetEditRect;
  public
    FIsNew   : Boolean;
    FSeq     : Integer;
  end;

var
  HeadNoticePopupForm: THeadNoticePopupForm;

implementation
uses DBModule, Common;
{$R *.dfm}


procedure THeadNoticePopupForm.FormShow(Sender: TObject);
var vStream :TStream;
    vCount,
    vIndex  :Integer;
begin
  FromDateEdit.Date := Now();
  ToDateEdit.Date   := Now();
  BackItemList := TStringList.Create;
  try
    DM.OpenQuery('select CD_STORE, NM_STORE '
                +'  from MS_STORE '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE <> :P1 '
                +' order by CD_STORE',
                [HeadStoreCode,
                 StandardStore]);

    StoreCheckListBox.Clear;
    BackItemList.Clear;
    while not DM.Query.Eof do
    begin
      StoreCheckListBox.Items.Add;
      StoreCheckListBox.Items[StoreCheckListBox.Count-1].Text := DM.Query.FieldByName('NM_STORE').AsString;
      BackItemList.Add(DM.Query.FieldByName('CD_STORE').AsString);
      DM.Query.Next;
    end;
  finally
    DM.Query.Close;
  end;

  if not FIsNew then
  begin
    vStream := TMemoryStream.Create;
    DM.OpenQuery('select YMD_FROM, '
                +'       YMD_TO, '
                +'       DS_SHOW, '
                +'       DS_NOTICE, '
                +'       NOTICE_TITLE, '
                +'       NOTICE_TEXT, '
                +'       CD_STORE_NOTICE, '
                +'       YN_SHOW, '
                +'       YN_HOT '
                +'  from MS_NOTICE '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and SEQ      =:P2',
                [HeadStoreCode,
                 StandardStore,
                 FSeq]);
    Editor.Clear;

    TitleEdit.Text                := DM.Query.FieldByName('NOTICE_TITLE').AsString;
    vCount := 0;
    for vIndex := 0 to StoreCheckListBox.Items.Count-1 do
    begin
      if Pos(BackItemList.Strings[vIndex], DM.Query.FieldByName('CD_STORE_NOTICE').AsString) > 0 then
      begin
        StoreCheckListBox.Items[vIndex].Checked := true;
        Inc(vCount);
      end;
    end;

    AllCheckBox.Checked := vCount = StoreCheckListBox.Items.Count;
    FromDateEdit.Date   := StoD(DM.Query.FieldByName('YMD_FROM').AsString);
    ToDateEdit.Date     := StoD(DM.Query.FieldByName('YMD_TO').AsString);
    UnCheckBox.Checked  := DM.Query.FieldByName('DS_SHOW').AsString = 'U';
    PosCheckBox.Checked := (DM.Query.FieldByName('DS_NOTICE').AsString = 'P') or (DM.Query.FieldByName('DS_NOTICE').AsString = 'A');
    BSCheckBox.Checked  := (DM.Query.FieldByName('DS_NOTICE').AsString = 'B') or (DM.Query.FieldByName('DS_NOTICE').AsString = 'A');
    NoticeEndCheckBox.Checked := DM.Query.FieldByName('DS_NOTICE').AsString = 'N';
    HotNewsCheckBox.Checked := DM.Query.FieldByName('YN_HOT').AsString = 'Y';
    vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('NOTICE_TEXT'), bmRead);
    Editor.LoadFromStream(vStream);
    DM.Query.Close;
  end
  else
  begin
    Editor.Clear;
    DM.OpenQuery('select Ifnull(Max(SEQ),0)+1 '
                +'  from MS_NOTICE '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 ',
                [HeadStoreCode,
                 StandardStore]);
    FSeq := DM.Query.Fields[0].AsInteger;
    DM.Query.Close;
  end;

  TitleEdit.SetFocus;
end;

function THeadNoticePopupForm.GetCheckListBox(aList: TStringList;
  aText: String): Integer;
var vIndex :Integer;
begin
  Result := -1;
  for vIndex := 0 to aList.Count-1 do
    if aList.Strings[vIndex] = aText then
    begin
      Result := vIndex;
      Break;
    end;
end;

procedure THeadNoticePopupForm.AllCheckBoxPropertiesChange(Sender: TObject);
var vIndex :Integer;
begin
  for vIndex := 0 to StoreCheckListBox.Items.Count-1 do
    StoreCheckListBox.Items[vIndex].Checked := AllCheckBox.Checked;
end;

procedure THeadNoticePopupForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

function THeadNoticePopupForm.CurrText: TTextAttributes;
begin
end;



procedure THeadNoticePopupForm.FormCreate(Sender: TObject);
begin
  FIsNew := true;
end;

procedure THeadNoticePopupForm.SetEditRect;
begin
end;

procedure THeadNoticePopupForm.SaveButtonClick(Sender: TObject);
var vStream :TMemoryStream;
    vDsNotice :String;
    vStore: String;
    vIndex :Integer;
begin
  try
    vStream := TMemoryStream.Create;

    if PosCheckBox.Checked and not BSCheckBox.Checked then
      vDsNotice := 'P'
    else if not PosCheckBox.Checked and BSCheckBox.Checked then
      vDsNotice := 'B'
    else if PosCheckBox.Checked and BSCheckBox.Checked then
      vDsNotice := 'A'
    else
      vDsNotice := '0';

   vStore := '';
    for vIndex := 0 to StoreCheckListBox.Items.Count-1 do
    begin
      if StoreCheckListBox.Items[vIndex].Checked then
        vStore := vStore + Format('%s,',[BackItemList.Strings[vIndex]]);
    end;

    vStore := LeftStr(vStore, Length(vStore)-1);;

    Editor.SaveToStream(vStream);
    DM.ExecQuery('insert into MS_NOTICE(CD_HEAD, '
                +'                      CD_STORE, '
                +'                      SEQ, '
                +'                      DS_SHOW, '
                +'                      NOTICE_TITLE, '
                +'                      CD_STORE_NOTICE, '
                +'                      YMD_FROM, '
                +'                      YMD_TO, '
                +'                      DS_NOTICE, '
                +'                      NOTICE_TEXT,'
                +'                      YN_SHOW, '
                +'                      YN_HOT, '
                +'                      CD_SAWON_CHG, '
                +'                      DT_INSERT) '
                +'               VALUES(:P0, '
                +'                      :P1, '
                +'                      :P2, '
                +'                      :P3, '
                +'                      :P4, '
                +'                      :P5, '
                +'                      :P6, '
                +'                      :P7, '
                +'                      :P8, '
                +'                      :P9, '
                +'                      :P10, '
                +'                      :P11, '
                +'                      :P12, '
                +'                      Now() )'
                +' ON DUPLICATE KEY UPDATE  DS_SHOW          =:P3, '
                +'                          NOTICE_TITLE     =:P4, '
                +'                          CD_STORE_NOTICE  =:P5, '
                +'                          YMD_FROM         =:P6, '
                +'                          YMD_TO           =:P7, '
                +'                          DS_NOTICE        =:P8, '
                +'                          NOTICE_TEXT      =:P9, '
                +'                          YN_SHOW          =:P10, '
                +'                          YN_HOT           =:P11, '
                +'                          CD_SAWON_CHG     =:P12;',
                [HeadStoreCode,
                 StandardStore,
                 FSeq,
                 Ifthen(UnCheckBox.Checked,'U','R'),
                 TitleEdit.Text,
                 vStore,
                 DtoS(FromDateEdit.Date),
                 DtoS(ToDateEdit.Date),
                 vDsNotice,
                 EncodeBase64(vStream.Memory, vStream.Size),
                 Ifthen(NoticeEndCheckBox.Checked, 'N','Y'),
                 Ifthen(HotNewsCheckBox.Checked, 'Y','N'),
                 UserName],true);
    ModalResult := mrOK;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
