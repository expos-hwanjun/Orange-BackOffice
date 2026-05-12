unit SaleTableOrderShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.ExtCtrls, Data.DB, dxmdaset, cxStyles, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, PosButton, AdvSmoothButton, GDIPFill;

type
  TSaleTableOrderShowForm = class(TInheritForm)
    TablePanel: TPanel;
  private
    procedure TableCreate;
    procedure SetOrderMenu;
  public
    { Public declarations }
  end;

var
  SaleTableOrderShowForm: TSaleTableOrderShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TSaleTableOrderShowForm }

procedure TSaleTableOrderShowForm.SetOrderMenu;
  function GetTable(aTableNo:Integer):TPosButton;
  var vIndex :Integer;
  begin
    Result := nil;
    for vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and
         ( (Components[vIndex] as TPosButton).Parent = TablePanel ) and
         ( (Components[vIndex] as TPosButton).Number.Number = aTableNo ) then
      begin
        Result := (Components[vIndex] as TPosButton);
        Break;
      end;
    end;
  end;
var vTable :TPosButton;
begin
  try
    OpenQuery('select NO_TABLE, '
             +'       AMT_ORDER, '
             +'       COME_TIME '
             +'  from SL_ORDER_H '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +' order by NO_TABLE ',
             [HeadStoreCode,
              StoreCode]);
    while not Query.Eof do
    begin
      vTable := GetTable(Query.FieldByName('NO_TABLE').AsInteger);
      if vTable <> nil then
      begin
        vTable.Caption := FormatFloat(',0원',Query.FieldByName('AMT_ORDER').AsInteger);
        vTable.Number.RightString := FormatDateTime('[hh:nn]',Query.FieldByName('COME_TIME').AsDateTime);
      end;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
end;

procedure TSaleTableOrderShowForm.TableCreate;
  procedure TableButtonDelete;
  var vIndex :Integer;
  label go;
  begin
    go:
    For vIndex := 0 to ComponentCount-1 do
    begin
      if (Components[vIndex] is TPosButton) and
         ( (Components[vIndex] as TPosButton).Parent = TablePanel ) then
      begin
        (Components[vIndex] as TPosButton).Free;
        Goto go;
      end;

      if (Components[vIndex] is TAdvSmoothButton) and
         ( (Components[vIndex] as TAdvSmoothButton).Parent = TablePanel ) then
      begin
        (Components[vIndex] as TAdvSmoothButton).Free;
        Goto go;
      end;

    end;
  end;
var vTableButton :TPosButton;
    vImageButton :TAdvSmoothButton;
    vChairCount :Integer;
    vWidth, vHeight :Integer;
    vPath :String;
    vNumberSize,
    vCaptionSize,
    vAmountSize,
    vBottomSize :Integer;
    vNormalColor :TColor;
begin
  //기존 테이블 버튼 모두삭제
  TableButtonDelete;
  vPath := ExtractFilePath(Application.ExeName);

  try
    OpenQuery('select NM_CODE2, '
             +'       NM_CODE3, '
             +'       NM_CODE4, '
             +'       NM_CODE5, '
             +'       NM_CODE7 '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =''03'' '
             +'   and CD_CODE = :P2 '
             +'   and DS_STATUS=0 '
             +' order by CD_CODE',
             [HeadStoreCode,
              StoreCode,
              GetStrPointerData(ConditionToolBarComboBox)]);

    if not Query.Eof then
    begin
      vNumberSize   := Query.FieldByName('NM_CODE2').AsInteger;
      vCaptionSize  := Query.FieldByName('NM_CODE3').AsInteger;
      vAmountSize   := Query.FieldByName('NM_CODE4').AsInteger;
      vBottomSize   := Query.FieldByName('NM_CODE5').AsInteger;
      vNormalColor  := StringToColor(Query.FieldByName('NM_CODE2').AsString);
    end;
  finally
    Query.Close;
  end;


  //저장된 테이블 내역 불러오기
  try
    OpenQuery('select SEQ, '
             +'       NO_TOP, '
             +'       NO_LEFT, '
             +'       NO_HEIGHT, '
             +'       NO_WIDTH, '
             +'       NO_TABLE, '
             +'       COLOR, '
             +'       NUMBER_COLOR, '
             +'       FONT_COLOR, '
             +'       BORDER_COLOR, '
             +'       NO_TABLE_GROUP, '
             +'       NM_TABLE, '
             +'       DT_CHANGE, '
             +'       TABLE_STYLE, '
             +'       YN_PACKING, '
             +'       CHAIR_COUNT '
             +'  from MS_TABLE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_FLOOR =:P2 '
             +' order by NO_TABLE ',
             [HeadStoreCode,
              StoreCode,
              GetStrPointerData(ConditionToolBarComboBox)]);
  except
    on E: Exception do
    begin
      Exit;
    end;
  end;

  while not Query.Eof do
  begin
    vTableButton := TPosButton.Create(Self);
    with vTableButton do
    begin
      if Query.FieldByName('SEQ').AsInteger = 0 then
        Name             := Format('Table%d',[Query.FieldByName('NO_TABLE').AsInteger])
      else
        Name             := Format('Wall%d',[Query.FieldByName('SEQ').AsInteger]);

      Parent           := TablePanel;
      Style := bsRound;

      if GetOption(25) = '1' then
      begin
        Number.NumberString := Query.FieldByName('NM_TABLE').AsString;
        Number.TempString   := Query.FieldByName('NM_TABLE').AsString;

        if Number.NumberString = '' then
        begin
          Number.NumberString := Query.FieldByName('NO_TABLE').AsString;
          Number.TempString   := Query.FieldByName('NO_TABLE').AsString;
        end;
      end
      else
      begin
        Number.NumberString := Query.FieldByName('NO_TABLE').AsString;
        Number.TempString   := Query.FieldByName('NO_TABLE').AsString;
      end;

      Tag                 := 0;
      Top                 := Query.FieldByName('NO_TOP').AsInteger;
      Left                := Query.FieldByName('NO_LEFT').AsInteger;
      Height              := Query.FieldByName('NO_HEIGHT').AsInteger;
      Width               := Query.FieldByName('NO_WIDTH').AsInteger;
      //그룹이 지정되 있을때
      if Query.FieldByName('NO_TABLE_GROUP').AsInteger > 0 then
      begin
        if (Query.FieldByName('NO_TABLE').AsInteger = Query.FieldByName('NO_TABLE_GROUP').AsInteger) then
          Bottom.CenterString := 'G-M'
        else
          Bottom.CenterString      := 'G-'+ Query.FieldByName('NO_TABLE_GROUP').AsString
      end
      else
      begin
        Bottom.CenterString      := '';
      end;

      Temp4           := Query.FieldByName('YN_PACKING').AsString;
      vChairCount     := StrToIntDef(Query.FieldByName('CHAIR_COUNT').AsString,0);
      ShowAccelChar       := False;

      BorderColor         := StringToColorDef(Query.FieldByName('BORDER_COLOR').AsString, clNone);
      Font.Size           := vCaptionSize;
      Number.Font.Name    := '맑은 고딕';
      Number.Font.Color   := StringToColorDef(Query.FieldByName('FONT_COLOR').AsString, clWhite);
      Number.Font.Size    := vNumberSize;

      Bottom.Font.Name    := '맑은 고딕';
      Bottom.Font.Color   := Number.Font.Color;
      Bottom.Font.Size    := vBottomSize;

      Amount.Font.Name    := '맑은 고딕';
      Amount.Font.Color   := Number.Font.Color;
      Amount.Font.Size    := vAmountSize;
      Amount.Font.Style   := [fsBold];

      Menu.Font.Name      := '맑은 고딕';
      Menu.Font.Size      := vCaptionSize;
      Menu.Font.Color     := Number.Font.Color;

      Font                := Amount.Font;

      Temp5 := ColorToString(Number.Font.Color);

      //테이블
      if Query.FieldByName('SEQ').AsInteger = 0 then
      begin
        Number.Height       := Trunc(Number.Font.Size * 2.3)+2;
        Bottom.Height       := Bottom.Font.Size * 2;
//        Onclick             := TableButtonClick;
        Color               := $00D7D7D7;
        BorderInnerColor    := clNone;
        Cursor              := crHandPoint;
      end
      else //벽
      begin
        Color               := StringToColorDef(Query.FieldByName('COLOR').AsString, vNormalColor);
        Font.Color          := Number.Font.Color;
        Number.ShowColor    := False;
        Number.NumberString := '';
        Caption             := Query.FieldByName('NM_TABLE').AsString;
        Cursor              := crNo;
      end;

      Number.Number       := Query.FieldByName('NO_TABLE').AsInteger;
//      Number.Font.Style   := [fsBold];
      Number.Color        := vNormalColor;
      if (Query.FieldByName('SEQ').AsInteger = 0) and FileExists(vPath+'DLL\Table.png') then
      begin
        vImageButton  := TAdvSmoothButton.Create(Self);
        vImageButton.Parent  := TablePanel;
        vImageButton.Name    := Format('TableImageButton%d',[Number.Number]);

        if Query.FieldByName('TABLE_STYLE').AsString = 'C' then
        begin
          if FileExists(Format('%s\DLL\CircleTable_%d.png',[vPath, vChairCount])) then
            vImageButton.Picture.LoadFromFile(Format('%s\DLL\CircleTable_%d.png',[vPath, vChairCount]))
          else if FileExists('DLL\CircleTable.png') then
            vImageButton.Picture.LoadFromFile(vPath+'DLL\CircleTable.png')
          else
            vImageButton.Picture.LoadFromFile(vPath+'DLL\Table.png');

          vImageButton.Appearance.Rounding := 50;
        end
        else
        begin
          vImageButton.Appearance.Rounding := 10;
          if FileExists(Format('%s\DLL\Table_%d.png',[vPath, vChairCount])) then
            vImageButton.Picture.LoadFromFile(Format('%s\DLL\Table_%d.png',[vPath, vChairCount]))
          else
            vImageButton.Picture.LoadFromFile(vPath+'DLL\Table.png');
        end;

        vImageButton.Top       := Query.FieldByName('NO_TOP').AsInteger;
        vImageButton.Left      := Query.FieldByName('NO_LEFT').AsInteger;
        vImageButton.Height    := Query.FieldByName('NO_HEIGHT').AsInteger;
        vImageButton.Width     := Query.FieldByName('NO_WIDTH').AsInteger;

        //원형테이블일때는 가로 세로 중 작은 거에 1/2
        if vImageButton.Appearance.Rounding = 50 then
        begin
          if vImageButton.Height < vImageButton.Width then
            vImageButton.Appearance.Rounding := (vImageButton.Height-16) div 2
          else
            vImageButton.Appearance.Rounding := (vImageButton.Width-16) div 2;
        end;


        vImageButton.Tag       := Number.Number;
        vImageButton.Hint      := Number.TempString;
        vImageButton.Color     := vNormalColor;
        vImageButton.Bevel     := false;
        vImageButton.Shadow    := true;
        vImageButton.ClickDelay := true;
        vImageButton.AllowTimer := true;
//        vImageButton.Appearance.SimpleLayout     := true;
          vImageButton.Appearance.GlowPercentage := 10;

        vImageButton.Appearance.Font.Name        := '맑은고딕';
        vImageButton.Appearance.Font.Color       := clBlack;
        vImageButton.Appearance.Layout           := TGDIPButtonLayout.blNone;
        vImageButton.Appearance.PictureAlignment := taCenter;
        vImageButton.Appearance.SimpleLayout     := true;
        vImageButton.Status.Visible := true;
        vImageButton.Status.Appearance.Font.Size        := Font.Size;
        vImageButton.Status.Appearance.Fill.Color       := clWhite;
        vImageButton.Status.Appearance.Fill.ColorTo     := clWhite;
        vImageButton.Status.Appearance.Fill.BorderColor := clBlack;
        vImageButton.Status.Caption := Number.NumberString;
        vImageButton.Caption  := Number.NumberString;
        vImageButton.ClickDelay := false;
        vImageButton.RepeatInterval := 0;
        vImageButton.Cursor  := crHandPoint;
        Temp7 := 'Y';                                //Temp7 이미지테이블 사용여부
      end
      else
        Temp7 := 'N';
      Temp8 := 'Y';
    end;
    Query.Next;
  end;
  Query.Close;
end;

end.
