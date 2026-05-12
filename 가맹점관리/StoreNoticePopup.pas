unit StoreNoticePopup;

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
  cxCheckListBox, AdvToolBar, AdvToolBarExt, AdvRichEditorToolBar, AdvGlowButton;

type
  TStoreNoticePopupForm = class(TForm)
    ToolbarImages: TImageList;
    Timer1: TTimer;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    TitleEdit: TcxTextEdit;
    EditStyleController: TcxEditStyleController;
    PictureLoadDialog: TOpenPictureDialog;
    Editor: TAdvRichEditor;
    AdvRichEditorFormatToolBar1: TAdvRichEditorFormatToolBar;
    CloseButton: TAdvGlowButton;
    SaveButton: TAdvGlowButton;
    cxLabel2: TcxLabel;
    SolutionComboBox: TcxComboBox;
    cxLabel3: TcxLabel;
    VersionEdit: TcxTextEdit;
    StatusComboBox: TcxComboBox;
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
    FSolution :String;
    FIsNew   : Boolean;
    FSeq     : Integer;
  end;

var
  StoreNoticePopupForm: TStoreNoticePopupForm;

implementation
uses DBModule, Common;
{$R *.dfm}


procedure TStoreNoticePopupForm.FormShow(Sender: TObject);
var vStream :TStream;
begin
  if not FIsNew then
  begin
    vStream := TMemoryStream.Create;
    DM.OpenQuery('select NOTICE_TITLE, '
                +'       NOTICE_DATA, '
                +'       VERSION, '
                +'       DS_STATUS '
                +'  from UPDATE_NOTICE '
                +' where DS_SOLUTION  =:P0 '
                +'   and SEQ          =:P1',
                [FSolution,
                 FSeq],false,RestBaseURL);
    Editor.Clear;

    TitleEdit.Text                := DM.Query.FieldByName('NOTICE_TITLE').AsString;
    VersionEdit.Text              := DM.Query.FieldByName('VERSION').AsString;
    StatusComboBox.ItemIndex := GetStrPointerIndex(StatusComboBox, DM.Query.FieldByName('DS_STATUS').AsString);

    vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('NOTICE_DATA'), bmRead);
    Editor.LoadFromStream(vStream);
    DM.Query.Close;
    SolutionComboBox.ItemIndex := GetStrPointerIndex(SolutionComboBox, FSolution);
    SolutionComboBox.Enabled := false;
  end
  else
  begin
    Editor.Clear;
    SolutionComboBox.Enabled := true;
  end;

  TitleEdit.SetFocus;
end;

function TStoreNoticePopupForm.GetCheckListBox(aList: TStringList;
  aText: String): Integer;
begin
end;

procedure TStoreNoticePopupForm.AllCheckBoxPropertiesChange(Sender: TObject);
var vIndex :Integer;
begin
end;

procedure TStoreNoticePopupForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

function TStoreNoticePopupForm.CurrText: TTextAttributes;
begin
end;



procedure TStoreNoticePopupForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  FIsNew := true;
  New(vCode);
  vCode^.Data := 'O';
  SolutionComboBox.Properties.Items.AddObject('Orange', TObject(vCode));
  New(vCode);
  vCode^.Data := 'E';
  SolutionComboBox.Properties.Items.AddObject('ERP', TObject(vCode));
  New(vCode);
  vCode^.Data := 'M';
  SolutionComboBox.Properties.Items.AddObject('MART', TObject(vCode));
  New(vCode);
  vCode^.Data := 'T';
  SolutionComboBox.Properties.Items.AddObject('ThemePark', TObject(vCode));

  StatusComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'S';
  StatusComboBox.Properties.Items.AddObject('공지', TObject(vCode));
  New(vCode);
  vCode^.Data := 'W';
  StatusComboBox.Properties.Items.AddObject('작업중', TObject(vCode));
  New(vCode);
  vCode^.Data := 'P';
  StatusComboBox.Properties.Items.AddObject('중지', TObject(vCode));
  StatusComboBox.ItemIndex := 0;
end;

procedure TStoreNoticePopupForm.SetEditRect;
begin
end;

procedure TStoreNoticePopupForm.SaveButtonClick(Sender: TObject);
var vStream :TMemoryStream;
begin
  if FisNew then
  begin
    DM.OpenQuery('select Ifnull(Max(SEQ),0)+1 '
                +'  from UPDATE_NOTICE '
                +' where DS_SOLUTION  =:P0 ',
                [GetStrPointerData(SolutionComboBox)],false,RestBaseURL);
    FSeq := DM.Query.Fields[0].AsInteger;
    DM.Query.Close;
  end;

  try
    vStream := TMemoryStream.Create;

    Editor.SaveToStream(vStream);
    DM.ExecQuery('insert into UPDATE_NOTICE(DS_SOLUTION, '
                +'                          SEQ, '
                +'                          NOTICE_TITLE, '
                +'                          NOTICE_DATA, '
                +'                          ID_USER, '
                +'                          VERSION, '
                +'                          DS_STATUS, '
                +'                          DT_INSERT) '
                +'                   VALUES(:P0, '
                +'                          :P1, '
                +'                          :P2, '
                +'                          :P3, '
                +'                          :P4, '
                +'                          :P5, '
                +'                          :P6, '
                +'                          Now() )'
                +' ON DUPLICATE KEY UPDATE  NOTICE_TITLE     =:P2, '
                +'                          NOTICE_DATA      =:P3, '
                +'                          ID_USER          =:P4, '
                +'                          VERSION          =:P5, '
                +'                          DS_STATUS        =:P6, '
                +'                          DT_INSERT        =Now();',
                [GetStrPointerData(SolutionComboBox),
                 FSeq,
                 TitleEdit.Text,
                 EncodeBase64(vStream.Memory, vStream.Size),
                 UserCode,
                 VersionEdit.Text,
                 GetStrPointerData(StatusComboBox)],true,RestBaseURL);

    ModalResult := mrOK;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
