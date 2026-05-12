unit HeadNoticeShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, Vcl.ComCtrls,
  cxClasses, Vcl.ExtCtrls, cxLabel, DB, AdvScrollControl, AdvRichEditorBase,
  AdvRichEditor, cxHeader;

type
  THeadNoticeShowForm = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    Shape1: TShape;
    EditStyleController: TcxEditStyleController;
    Shape2: TShape;
    cxLabel4: TcxLabel;
    TitleLabel: TcxLabel;
    UserNameLabel: TcxLabel;
    WriteDateLabel: TcxLabel;
    NoticesEdit: TAdvRichEditor;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FSeq   :Integer;
  end;

var
  HeadNoticeShowForm: THeadNoticeShowForm;

implementation
uses DBModule, Common;
{$R *.dfm}

procedure THeadNoticeShowForm.FormShow(Sender: TObject);
var vStream :TStream;
begin
  vStream := TMemoryStream.Create;
  DM.OpenQuery('select a.NOTICE_TITLE, '
              +'       a.NOTICE_TEXT, '
              +'       b.NM_SAWON, '
              +'       a.DT_INSERT '
              +'  from MS_NOTICE  a left outer join '
              +'       MS_SAWON   b on a.CD_HEAD  = b.CD_HEAD '
              +'                   and a.CD_STORE = b.CD_STORE '
              +'                   and a.CD_SAWON_CHG = b.CD_SAWON '
              +' where a.CD_HEAD  =:P0 '
              +'   and a.CD_STORE =:P1 '
              +'   and a.SEQ      =:P2',
              [HeadStoreCode,
               StandardStore,
               FSeq]);

  TitleLabel.Caption         := DM.Query.FieldByName('NOTICE_TITLE').AsString;
  UserNameLabel.Caption      := DM.Query.FieldByName('NM_SAWON').AsString;
  WriteDateLabel.Caption     := DM.Query.FieldByName('DT_INSERT').AsString;
  vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('NOTICE_TEXT'), bmRead);
  NoticesEdit.LoadFromStream(vStream);
  DM.Query.Close;
end;

end.
