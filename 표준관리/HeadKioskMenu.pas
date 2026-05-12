unit HeadKioskMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HeadMenuMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxCurrencyEdit, cxTextEdit, Vcl.Menus, IPPeerClient,
  Vcl.ExtDlgs, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  AdvOfficeButtons, AdvPanel, cxImage, cxCheckBox, cxButtonEdit, Vcl.StdCtrls,
  cxButtons, cxSpinEdit, cxCheckListBox, AdvGroupBox, cxTreeView,
  AdvOfficePager, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, Math, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers,
  cxCustomListBox;

type
  THeadKioskMenuForm = class(THeadMenuMasterForm)
    ImagePage: TAdvOfficePage;
    KioskImageLoadButton: TAdvGlowButton;
    KioskImageDeleteButton: TAdvGlowButton;
    KioskImageSizeLabel: TcxLabel;
    ImagePanel: TAdvPanel;
    MenuImage: TcxImage;
    procedure KioskImageLoadButtonClick(Sender: TObject);
    procedure KioskImageDeleteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    KioskConfig       :Array[1..17] of Integer;
    MenuFont :TFont;
    procedure SetKioskImage;
  protected
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoSave:Boolean;  override;
  end;

var
  HeadKioskMenuForm: THeadKioskMenuForm;

implementation
uses Common, DBModule;

{$R *.dfm}

procedure THeadKioskMenuForm.DoGridLink;
var vPath :String;
    vMenuAling,
    vPriceAlign :String;
begin
  inherited;
  vPath := Format('%s\%s',[HeadStoreCode, StandardStore]);
  OpenQuery('select IMG_MENU, '
           +'       IMG_FILESIZE '
           +'  from MS_MENU_IMAGE '
           +' where CD_HEAD =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and CD_MENU  =:P2 ',
           [HeadStoreCode,
            StandardStore,
            MenuCodeEdit.Text]);
  if not Query.Eof and (Query.FieldByName('IMG_MENU').AsString <> '') then
  begin
    if not FileExists(Format('%sKiosk\%s\%s',[Folder, vPath,  Query.FieldByName('IMG_MENU').AsString]))
      or (GetFileSize(Format('%sKiosk\%s\%s',[Folder, vPath,  Query.FieldByName('IMG_MENU').AsString])) <> Query.FieldByName('IMG_FILESIZE').AsInteger) then
      ImageDownLoad(vPath, Query.FieldByName('IMG_MENU').AsString, 'Kiosk\'+vPath );

    if FileExists(Format('%sKiosk\%s\%s',[Folder, vPath, Query.FieldByName('IMG_MENU').AsString])) then
    begin
      if Query.FieldByName('IMG_FILESIZE').AsInteger = 0 then
        ExecQuery('update MS_MENU_IMAGE '
                 +'   set IMG_FILESIZE = :P2 '
                 +' where CD_HEAD      =:P0 '
                 +'   and CD_MENU      =:P1;',
                 [HeadStoreCode,
                  MenuCodeEdit.Text,
                  GetFileSize(Format('%sKiosk\%s\%s',[Folder, vPath, Query.FieldByName('IMG_MENU').AsString]))],true);

      MenuImage.Picture.LoadFromFile(Format('%sKiosk\%s\%s',[Folder, vPath, Query.FieldByName('IMG_MENU').AsString]));
      MenuImage.Properties.Caption := '';
    end
    else
    begin
      MenuImage.Picture.Graphic := nil;
      MenuImage.Properties.Caption := 'No Image';
    end;
  end
  else
  begin
    MenuImage.Picture.Graphic := nil;
    MenuImage.Properties.Caption := 'No Image';
  end;

  MenuImage.Tag := 0;
  case KioskConfig[11] of
    0 : vMenuAling := 'left';
    1 : vMenuAling := 'center';
    2 : vMenuAling := 'right';
  end;

  case KioskConfig[12] of
    0 : vPriceAlign := 'left';
    1 : vPriceAlign := 'center';
    2 : vPriceAlign := 'right';
  end;

  if KioskConfig[14] = 0 then
  begin
    ImagePanel.Text := Format('<FONT  size="%d" face="%s"><P align="%s"></P>%s<BR><P   align="%s"><B>%s</B></P></FONT>',
                             [MenuFont.Size,
                              MenuFont.Name,
                              vMenuAling,
                              MenuNameEdit.Text,
                              vPriceAlign,
                              FormatFloat(',0원',PriceSaleEdit.Value)]);
  end
  else
  begin
    ImagePanel.Text := Format('<FONT  size="%d" face="%s"><P align="%s"></P>%s<BR><BR><P   align="%s"><B>%s</B></P></FONT>',
                             [MenuFont.Size,
                              MenuFont.Name,
                              vMenuAling,
                              MenuNameEdit.Text,
                              vPriceAlign,
                              FormatFloat(',0원',PriceSaleEdit.Value)]);
  end;

end;

function THeadKioskMenuForm.DoSave: Boolean;
var vPath, vImageName  :String;
    vIndex :Integer;
begin
  inherited;
  if MenuImage.Tag = 0 then Exit;

  vPath      := Format('%s\%s',[HeadStoreCode, StandardStore]);
  vImageName := MenuCodeEdit.Text+'.png';
  if MenuImage.Picture.Graphic = nil then
  begin
    ImageDelete(vPath, MenuCodeEdit.Text+'.png');
    ExecQuery('update MS_MENU_IMAGE '
             +'   set IMG_MENU  = '''', '
             +'       DT_CHANGE = Now() '
             +' where CD_HEAD   =:P0 '
             +'   and CD_MENU   =:P1;',
             [HeadStoreCode,
              MenuCodeEdit.Text],true);
  end
  else
  begin
    if not DirectoryExists(Format('%sKiosk\%s\',[Folder, vPath])) then
      ForceDirectories(Format('%sKiosk\%s\',[Folder, vPath]));

    MenuImage.Picture.SaveToFile(Format('%sKiosk\%s\%s',[Folder, vPath, vImageName]));
    ImageUpLoad(vPath, Format('%sKiosk\%s\%s',[Folder, vPath, vImageName]));
    for vIndex := 0 to WorkStoreList.Count-1 do
    begin
      ExecQuery('insert into MS_MENU_IMAGE(CD_HEAD, CD_STORE, CD_MENU, IMG_MENU, IMG_FILESIZE, DT_CHANGE) '
               +'                   values(:P0, :P1, :P2, ConCat(:P2,''.png''), :P3, Now()) '
               +'on duplicate key update  IMG_MENU     = ConCat(:P2,''.png''), '
               +'                         IMG_FILESIZE = :P3, '
               +'                         DT_CHANGE    = Now() ;',
               [HeadStoreCode,
                CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0),
                MenuCodeEdit.Text,
                GetFileSize(Format('%sKiosk\%s\%s',[Folder, vPath, vImageName]))],false);
    end;
    ExecQuery('',[],true);
  end;
  MenuImage.Tag := 0;
  isChanged := false;

end;

procedure THeadKioskMenuForm.FormShow(Sender: TObject);
begin
  inherited;
  SetKioskImage;
  SetWorkStoreList;
end;

procedure THeadKioskMenuForm.KioskImageDeleteButtonClick(Sender: TObject);
begin
  inherited;
  MenuImage.Picture := nil;
  MenuImage.Tag     := 1;
  MenuImage.Properties.Caption := 'No Image';
  isChanged := true;
end;

procedure THeadKioskMenuForm.KioskImageLoadButtonClick(Sender: TObject);
var vImage :TcxImage;
begin
  inherited;
  if PictureLoadDialog.Execute then
  begin
    try
      vImage := TcxImage.Create(Self);
      vImage.Align  := alClient;
      vImage.Picture.LoadFromFile(PictureLoadDialog.FileName);

      if (vImage.Picture.Width > 300) and (vImage.Picture.Height > 300) then
      begin
        MsgBox('이미지는 최대 300 * 300 입니다');
        Exit;
      end;
      MenuImage.Picture.LoadFromFile(PictureLoadDialog.FileName);
      MenuImage.Tag := 1;
      MenuImage.Properties.Caption := '';
      isChanged := true;
    finally
      vImage.Free;
    end;
  end;
end;

procedure THeadKioskMenuForm.SetKioskImage;
var vIndex :Integer;
    vHeight,
    vWidth,
    vX, vX1,
    vY, vY1 :Integer;
begin
  MenuFont := TFont.Create;
  try
    DM.OpenQuery('select CD_CODE, '
                +'       NM_CODE1, '
                +'       NM_CODE2, '
                +'       NM_CODE3, '
                +'       NM_CODE4, '
                +'       NM_CODE5, '
                +'       NM_CODE6, '
                +'       NM_CODE7, '
                +'       NM_CODE8, '
                +'       NM_CODE9, '
                +'       NM_CODE10, '
                +'       NM_CODE11, '
                +'       NM_CODE12, '
                +'       NM_CODE13, '
                +'       NM_CODE14 '
                +'  from MS_CODE '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and CD_KIND  =''84'' '
                +'   and CD_CODE in (''001'',''003'') ',
                [HeadStoreCode,
                 StandardStore]);
    while not DM.Query.Eof do
    begin
      vIndex := StoI(DM.Query.Fields[0].AsString);
      case vIndex of
        1 :
        begin
          KioskConfig[2]    := StrToIntDef(DM.Query.Fields[3].AsString,3);     //분류PLU 갯수
          KioskConfig[3]    := StrToIntDef(DM.Query.Fields[4].AsString,4);     //메뉴PLU X
          KioskConfig[4]    := StrToIntDef(DM.Query.Fields[5].AsString,5);     //메뉴PLU Y
          KioskConfig[5]    := StrToIntDef(DM.Query.Fields[6].AsString,10);    //주문메뉴 표시갯수
          KioskConfig[6]    := StrToIntDef(DM.Query.Fields[7].AsString,0);     //PLU 한줄사용여부
          KioskConfig[7]    := StrToIntDef(DM.Query.Fields[8].AsString,0);     //영수증출력여부
          KioskConfig[8]    := StrToIntDef(DM.Query.Fields[9].AsString,0);     //PLU 단가표시
          KioskConfig[9]    := StrToIntDef(DM.Query.Fields[10].AsString,0);    //PLU 메뉴명표시
          KioskConfig[10]   := StrToIntDef(DM.Query.Fields[11].AsString,10);   //PLU 간격
          KioskConfig[11]   := StrToIntDef(DM.Query.Fields[12].AsString,10);   //PLU 간격
          KioskConfig[12]   := StrToIntDef(DM.Query.Fields[13].AsString,10);   //PLU 간격
        end;
        3 :
        begin
          KioskConfig[16]                              := StoI(DM.Query.Fields[3].AsString);
          KioskConfig[17]                              := StoI(DM.Query.Fields[4].AsString);

          MenuFont.Name                  := DM.Query.Fields[6].AsString;
          MenuFont.Color                 := StringToColorDef(DM.Query.Fields[7].AsString, $004D9900);
          MenuFont.Size                  := StoI(DM.Query.Fields[8].AsString);
          MenuFont.Style                 := [fsBold];
        end;
      end;
      DM.Query.Next;
    end;
  finally
    DM.FinishQuery;
  end;

  vX := KioskConfig[3];
  vY := KioskConfig[4];

  vX := Ifthen(vX < 1, 1, vX);
  vY := Ifthen(vY < 1, 1, vY);

  vWidth  := KioskConfig[16]  div vX - (KioskConfig[10] div 2);
  vHeight := KioskConfig[17] div vY - (KioskConfig[10] div 2);

  ImagePanel.Width  := vWidth;
  ImagePanel.Height := vHeight;

  MenuImage.Width  := vWidth;
  MenuImage.Height := vHeight - KioskConfig[8];
  MenuImage.Left   := 0;


  KioskImageLoadButton.Top := ImagePanel.Top + ImagePanel.Height + 10;
  KioskImageDeleteButton.Top  := ImagePanel.Top + ImagePanel.Height + 10;
  KioskImageDeleteButton.Left := ImagePanel.Left + vWidth -  KioskImageDeleteButton.Width;

  KioskImageSizeLabel.Top     := KioskImageLoadButton.Top + 40;
  KioskImageSizeLabel.Caption := Format('이미지 크기 [ %d X %d ]',[MenuImage.Width, MenuImage.Height]);
end;

end.
