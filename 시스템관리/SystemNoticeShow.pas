unit SystemNoticeShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, Vcl.ComCtrls,
  cxClasses, Vcl.ExtCtrls, cxLabel, DB, AdvScrollControl, AdvRichEditorBase,
  AdvRichEditor, cxHeader;

type
  TSystemNoticeShowForm = class(TForm)
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
    NoticeRangeLabel: TcxLabel;
    NoticeTargetLabel: TcxLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FSeq   :Integer;
  end;

var
  SystemNoticeShowForm: TSystemNoticeShowForm;

implementation
uses DBModule, Common;
{$R *.dfm}

procedure TSystemNoticeShowForm.FormShow(Sender: TObject);
var vStream :TStream;
begin
  vStream := TMemoryStream.Create;
  DM.OpenQuery('select NOTICE_TITLE, '
              +'       NOTICE_TEXT, '
              +'       CD_SAWON_CHG, '
              +'       DT_INSERT, '
              +'       StoDW(YMD_FROM) as YMD_FROM, '
              +'       StoDW(YMD_TO) as YMD_TO, '
              +'       DS_NOTICE '
              +'  from MS_NOTICE   '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and SEQ      =:P2',
              [HeadStoreCode,
               StandardStore,
               FSeq]);

  TitleLabel.Caption         := DM.Query.FieldByName('NOTICE_TITLE').AsString;
  UserNameLabel.Caption      := DM.Query.FieldByName('CD_SAWON_CHG').AsString;
  WriteDateLabel.Caption     := DM.Query.FieldByName('DT_INSERT').AsString;
  NoticeRangeLabel.Caption   := Format('%s ~ %s',[DM.Query.FieldByName('YMD_FROM').AsString, DM.Query.FieldByName('YMD_TO').AsString]);
  if DM.Query.FieldByName('DS_NOTICE').AsString = 'A' then
    NoticeTargetLabel.Caption  := '관리프로그램/포스'
  else if DM.Query.FieldByName('DS_NOTICE').AsString = 'B' then
    NoticeTargetLabel.Caption  := '관리프로그램'
  else if DM.Query.FieldByName('DS_NOTICE').AsString = 'P' then
    NoticeTargetLabel.Caption  := '포스';

  vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('NOTICE_TEXT'), bmRead);
  NoticesEdit.LoadFromStream(vStream);
  DM.Query.Close;
end;

end.
