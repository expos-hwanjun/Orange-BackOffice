unit StorePartnerNoticePopup;

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
  TStorePartnerNoticePopupForm = class(TForm)
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
    AdvRichEditorEditToolBar1: TAdvRichEditorEditToolBar;
    StatusCheckBox: TcxCheckBox;
    SolutionLabel: TLabel;
    SolutionComboBox: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure AllCheckBoxPropertiesChange(Sender: TObject);
  private
    BackItemList    :TStringList;
    function  GetCheckListBox(aList:TStringList; aText:String):Integer;
    function CurrText: TTextAttributes;
    procedure SetEditRect;
  public
    FSolution    :String;
    FStatus      :String;
    FIsNew       :Boolean;
    FSeq         :Integer;
  end;

var
  StorePartnerNoticePopupForm: TStorePartnerNoticePopupForm;

implementation
uses DBModule, Common;
{$R *.dfm}


procedure TStorePartnerNoticePopupForm.FormShow(Sender: TObject);
var vStream :TStream;
  vCode : PStrPointer;
begin
  SolutionComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'O';
  SolutionComboBox.Properties.Items.AddObject('Orange', TObject(vCode));
  New(vCode);
  vCode^.Data := 'S';
  SolutionComboBox.Properties.Items.AddObject('Sauna', TObject(vCode));
  SolutionComboBox.ItemIndex := 0;

  if FIsNew and (Ifthen(PartnerCode='','0000',PartnerCode)='0000') then
  begin
    SolutionLabel.Visible    := true;
    SolutionComboBox.Visible := true;
  end;

  StatusCheckBox.Checked      := FStatus = '°øÁö';

  if not FIsNew then
  begin
    SolutionComboBox.ItemIndex := GetStrPointerIndex(SolutionComboBox, FSolution);
    SolutionComboBox.Enabled   := false;
    vStream := TMemoryStream.Create;
    DM.OpenQuery('select NOTICE_TITLE, '
                +'       NOTICE_DATA, '
                +'       VERSION '
                +'  from PARTNER_NOTICE '
                +' where DS_SOLUTION  =:P0 '
                +'   and CD_PARTNER   =:P1 '
                +'   and SEQ          =:P2',
                [FSolution,
                 Ifthen(PartnerCode='','0000',PartnerCode),
                 FSeq],false,RestBaseURL);
    Editor.Clear;

    TitleEdit.Text                := DM.Query.FieldByName('NOTICE_TITLE').AsString;

    vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('NOTICE_DATA'), bmRead);
    Editor.LoadFromStream(vStream);
    DM.Query.Close;
  end
  else
  begin
    SolutionComboBox.ItemIndex := 0;
    SolutionComboBox.Enabled   := true;
    Editor.Clear;
  end;

  TitleEdit.SetFocus;
end;

function TStorePartnerNoticePopupForm.GetCheckListBox(aList: TStringList;
  aText: String): Integer;
begin
end;

procedure TStorePartnerNoticePopupForm.AllCheckBoxPropertiesChange(Sender: TObject);
var vIndex :Integer;
begin
end;

procedure TStorePartnerNoticePopupForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

function TStorePartnerNoticePopupForm.CurrText: TTextAttributes;
begin
end;



procedure TStorePartnerNoticePopupForm.SetEditRect;
begin
end;

procedure TStorePartnerNoticePopupForm.SaveButtonClick(Sender: TObject);
var vStream :TMemoryStream;
begin
  if FisNew then
  begin
    DM.OpenQuery('select Ifnull(Max(SEQ),0)+1 '
                +'  from PARTNER_NOTICE '
                +' where DS_SOLUTION =:P0 '
                +'   and CD_PARTNER  =:P1 ',
                [GetStrPointerData(SolutionComboBox),
                 Ifthen(PartnerCode='','0000',PartnerCode)],false,RestBaseURL);
    FSeq := DM.Query.Fields[0].AsInteger;
    DM.Query.Close;
  end;

  try
    vStream := TMemoryStream.Create;

    Editor.SaveToStream(vStream);
    DM.ExecQuery('insert into PARTNER_NOTICE(DS_SOLUTION, '
                +'                           CD_PARTNER, '
                +'                           SEQ, '
                +'                           NOTICE_TITLE, '
                +'                           NOTICE_DATA, '
                +'                           ID_USER, '
                +'                           YN_USE, '
                +'                           DT_INSERT) '
                +'                    VALUES(:P0, '
                +'                           :P1, '
                +'                           :P2, '
                +'                           :P3, '
                +'                           :P4, '
                +'                           :P5, '
                +'                           :P6, '
                +'                           Now() )'
                +'  ON DUPLICATE KEY UPDATE  NOTICE_TITLE     =:P3, '
                +'                           NOTICE_DATA      =:P4, '
                +'                           ID_USER          =:P5, '
                +'                           YN_USE           =:P6; ',
                [GetStrPointerData(SolutionComboBox),
                 Ifthen(PartnerCode='','0000',PartnerCode),
                 FSeq,
                 TitleEdit.Text,
                 EncodeBase64(vStream.Memory, vStream.Size),
                 UserCode,
                 Ifthen(StatusCheckBox.Checked,'Y','N')],true,RestBaseURL);
    ModalResult := mrOK;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
