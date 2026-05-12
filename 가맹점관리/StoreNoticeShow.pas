unit StoreNoticeShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, Vcl.ComCtrls,
  cxClasses, Vcl.ExtCtrls, cxLabel, DB, AdvScrollControl, AdvRichEditorBase,
  AdvRichEditor, cxHeader, StrUtils;

type
  TStoreNoticeShowForm = class(TForm)
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
    NoticeTargetLabel: TcxLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FSolution :String;
    FSeq   :Integer;
  end;

var
  StoreNoticeShowForm: TStoreNoticeShowForm;

implementation
uses DBModule, Common;
{$R *.dfm}

procedure TStoreNoticeShowForm.FormShow(Sender: TObject);
var vStream :TStream;
begin
  try
    vStream := TMemoryStream.Create;
    DM.OpenQuery('select NOTICE_TITLE, '
                +'       NOTICE_DATA, '
                +'       ID_USER, '
                +'       DT_INSERT '
                +'  from UPDATE_NOTICE   '
                +' where DS_SOLUTION =:P0 '
                +'   and SEQ         =:P1',
                [FSolution,
                 FSeq],false,RestBaseURL);

    TitleLabel.Caption         := DM.Query.FieldByName('NOTICE_TITLE').AsString;
    WriteDateLabel.Caption     := DM.Query.FieldByName('DT_INSERT').AsString;
    UserNameLabel.Caption      := DM.Query.FieldByName('ID_USER').AsString;

    vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('NOTICE_DATA'), bmRead);
    NoticesEdit.LoadFromStream(vStream);
    DM.Query.Close;
  finally
    vStream.Free;
  end;
end;

end.
