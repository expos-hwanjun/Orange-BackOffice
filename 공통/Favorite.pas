// 즐겨찾기 추가 (F)

unit Favorite;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList, dxGDIPlusClasses, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, System.ImageList, DB, EncdDecd;

type
  TFavoriteForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    NameEdit: TcxTextEdit;
    ImageListView: TListView;
    ImageList: TImageList;
    NameLabel: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    aFormName :String;
  end;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TFavoriteForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Query.Close;
end;

procedure TFavoriteForm.FormShow(Sender: TObject);
var
  vPNG   : TdxPNGImage;
  vStream: TStream;
  vIndex : Integer;
begin
  try
    ImageListView.ViewStyle := vsReport;
    if not DM.ReadServerICon then Exit;
    vIndex := 0;
    while not DM.Query.Eof do
    begin
      Inc(vIndex);
      vPNG    := TdxPNGImage.Create;
      vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('ICON'), bmRead);
      try
        vPNG.LoadFromStream(vStream);
        ImageList.AddMasked(vPNG.GetAsBitmap, clBlack);
        ImageListView.Items.Add;
        ImageListView.Items[ImageListView.Items.Count-1].Caption    := FormatFloat('000', vIndex);
        ImageListView.Items[ImageListView.Items.Count-1].ImageIndex := vIndex-1;
      finally
        vStream.Free;
        vPNG.Free;
      end;
      DM.Query.Next;
    end;
    ImageListView.ViewStyle := vsIcon; // 처음부터 Icon으로 해 놓으면 화면을 벗어날 때 정렬이 엉망이 돼 Report에서 Icon으로 바꾸게 했다
  finally
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 확인 버튼
procedure TFavoriteForm.OKButtonClick(Sender: TObject);
var vStream :TStream;
    vMemStream :TMemoryStream;
  vPNG   : TdxPNGImage;
begin
  try
    if (UserLevel = 'E') or  (UserLevel = 'P') then
    begin
      if ImageListView.SelCount > 0 then
      begin
        DM.Query.RecNo := ImageListView.Selected.ImageIndex+1;
        vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('ICON'), bmRead);
        vMemStream := TMemoryStream.Create;
        vPNG    := TdxPNGImage.Create;
        vPNG.LoadFromStream(vStream);
        vPNG.SaveToStream(vMemStream);
        // DB에 저장한다
        DM.ExecQuery('insert into USER_FAVORITE(ID_USER, ACT_CODE, SEQ, CAPTION, ICON, DT_CHANGE) '
                    +'                   values(:P0, '
                    +'                          :P1, '
                    +'                         (select Ifnull(Max(SEQ),0)+1 '
                    +'                            from  USER_FAVORITE as s '
                    +'                           where ID_USER  =:P0 ), '
                    +'                          :P2, '
                    +'                          :P3, '
                    +'                          NOW()) '
                    +'ON DUPLICATE KEY UPDATE  CAPTION = :P2, '
                    +'                         ICON    = :P3; ',
                     [UserCode, aFormName, NameEdit.Text, EncodeBase64(vMemStream.Memory, vMemStream.Size)],true, RestBaseURL);
      end
      else
      begin
        DM.ExecQuery('insert into USER_FAVORITE (ID_USER, ACT_CODE, SEQ, CAPTION, DT_CHANGE) '
                    +'                   values(:P0, '
                    +'                          :P1, '
                    +'                         (select Ifnull(Max(SEQ),0)+1 '
                    +'                            from  USER_FAVORITE as s '
                    +'                           where ID_USER  =:P0), '
                    +'                          :P2, '
                    +'                          NOW()) '
                    +' ON DUPLICATE KEY UPDATE  CAPTION = :P2; ',
                     [UserCode, aFormName, NameEdit.Text],true, RestBaseURL);

      end;

    end
    else
    begin
      if ImageListView.SelCount > 0 then
      begin
        DM.Query.RecNo := ImageListView.Selected.ImageIndex+1;
        vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('ICON'), bmRead);
        vMemStream := TMemoryStream.Create;
        vPNG    := TdxPNGImage.Create;
        vPNG.LoadFromStream(vStream);
        vPNG.SaveToStream(vMemStream);
        // DB에 저장한다
        DM.ExecQuery('insert into MS_SAWON_FAV (CD_HEAD, CD_STORE, CD_SAWON, ACT_CODE, SEQ, CAPTION, ICON, DT_CHANGE) '
                    +'                   values(:P0, '
                    +'                          :P1, '
                    +'                          :P2, '
                    +'                          :P3, '
                    +'                         (select Ifnull(Max(SEQ),0)+1 '
                    +'                            from  MS_SAWON_FAV as s '
                    +'                           where CD_HEAD  =:P0 '
                    +'                             and CD_STORE =:P1 '
                    +'                             and CD_SAWON =:P2), '
                    +'                          :P4, '
                    +'                          :P5, '
                    +'                          NOW()) '
                    +'ON DUPLICATE KEY UPDATE  CAPTION = :P4, '
                    +'                         ICON    = :P5; ',
                     [HeadStoreCode, StoreCode, UserCode, aFormName, NameEdit.Text, EncodeBase64(vMemStream.Memory, vMemStream.Size)],true);
      end
      else
      begin
        DM.ExecQuery('insert into MS_SAWON_FAV (CD_HEAD, CD_STORE, CD_SAWON, ACT_CODE, SEQ, CAPTION, DT_CHANGE) '
                    +'                   values(:P0, '
                    +'                          :P1, '
                    +'                          :P2, '
                    +'                          :P3, '
                    +'                         (select Ifnull(Max(SEQ),0)+1 '
                    +'                            from  MS_SAWON_FAV as s '
                    +'                           where CD_HEAD  =:P0 '
                    +'                             and CD_STORE =:P1 '
                    +'                             and CD_SAWON =:P2), '
                    +'                          :P4, '
                    +'                          NOW()) '
                    +' ON DUPLICATE KEY UPDATE  CAPTION = :P4; ',
                     [HeadStoreCode, StoreCode, UserCode, aFormName, NameEdit.Text],true);

      end;
    end;
    ModalResult := mrOK;
  finally
    if Assigned(vStream) then
      vStream.Free;
  end;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure TFavoriteForm.CancelButtonClick(Sender: TObject);
begin
  DM.Query.Close;
  Close;
end;

end.
