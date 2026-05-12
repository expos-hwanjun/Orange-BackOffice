// 엑셀 칼럼 연결 (F)

unit ExcelLoad;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, ExtCtrls, tmsXLSAdapter, cxGraphics, cxDropDownEdit, Math,
  cxLookAndFeels;

type
  TExcelLoadForm = class(TForm)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    MainPanel: TPanel;
    ExcelFileCaptionLabel: TLabel;
    ExcelFileEdit: TEdit;
    ColumnGroupBox: TGroupBox;
    ExcelFileOpenDialog: TOpenDialog;

    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);

  private
    ColumnLabel: array of TLabel;
    RemarkLabel: array of TLabel;
    ExcelFileName :String;
  public
    ColumnComboBox: array of TcxComboBox;

    function SetColumn(aName: array of string; aNotNull: array of Boolean; aRemark: array of string; aFileName: string = ''): Boolean;
  end;

var
  ExcelLoadForm: TExcelLoadForm;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 확인 버튼
procedure TExcelLoadForm.OKButtonClick(Sender: TObject);
var
  vIndex: Integer;
  vTemp : String;
begin
  for vIndex := Low(ColumnComboBox) to High(ColumnComboBox) do
    if (ColumnComboBox[vIndex].Tag = 1) and (ColumnComboBox[vIndex].ItemIndex <= 0) then
    begin
      ErrBox(Format('%s은(는) 반드시 선택해야 합니다.', [ColumnLabel[vIndex].Caption]));
      ColumnComboBox[vIndex].SetFocus;
      Exit;
    end;

  vTemp := '';
  for vIndex := Low(ColumnComboBox) to High(ColumnComboBox) do
    vTemp := vTemp + IntToStr(ColumnComboBox[vIndex].ItemIndex) + '|';

  SetIniFile('Excel', ExcelFileName, vTemp);
  ModalResult := mrOK;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure TExcelLoadForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 칼럼 세팅
function TExcelLoadForm.SetColumn(aName: array of string; aNotNull: array of Boolean; aRemark: array of string; aFileName: string): Boolean;
var
  vXLSAdapter: TXLSAdapter;
  vXLSFile   : TXLSFile;
  vIndex     : Integer;
  vMaxLeft   : Integer;
  vTemp      : String;
begin
  Result := false;

  if High(aName) = 0 then
    Exit;

  // 불러올 엑셀 파일을 선택한다
  if aFileName <> EmptyStr then
    ExcelFileEdit.Text := aFileName
  else if ExcelFileOpenDialog.Execute then
    ExcelFileEdit.Text := ExcelFileOpenDialog.FileName;
  if (ExcelFileEdit.Text = EmptyStr) or (not FileExists(ExcelFileEdit.Text)) then
    Exit;

  ExcelFileName := ExtractFileName(ExcelFileOpenDialog.FileName);
  // 칼럼에 해당하는 컴포넌트들을 생성한다
  SetLength(ColumnLabel,    High(aName)+1);
  SetLength(ColumnComboBox, High(aName)+1);
  SetLength(RemarkLabel,    High(aName)+1);
  vMaxLeft := 75;
  for vIndex := Low(aName) to High(aName) do
  begin
    if vIndex < 15 then
    begin
      ColumnLabel[vIndex] := TLabel.Create(ColumnGroupBox);
      with ColumnLabel[vIndex] do
      begin
        Parent  := ColumnGroupBox;
        Left    := 15;
        Top     := vIndex * 30 + 28;
        Caption := aName[vIndex];
        if aNotNull[vIndex] then
          Font.Style := [fsBold];
        if vMaxLeft < Left + Width + 10 then
          vMaxLeft := Left + Width + 10;
      end;

      ColumnComboBox[vIndex] := TcxComboBox.Create(ColumnGroupBox);
      with ColumnComboBox[vIndex] do
      begin
        Parent  := ColumnGroupBox;
        Left    := 125;
        Top     := vIndex * 30 + 25;
        Tag     := IfThen(aNotNull[vIndex], 1, 0);
        Properties.Items.Add('[연결 안 함]');
        Properties.DropDownListStyle  := lsFixedList;
        Style.BorderStyle             := ebsFlat;
        Style.Color                   := clWindow;
        Style.LookAndFeel.Kind        := lfOffice11;
        Style.LookAndFeel.NativeStyle := true;
        StyleFocused.BorderStyle      := ebsFlat;
        StyleFocused.Color            := $0080FFFF;
      end;

      RemarkLabel[vIndex] := TLabel.Create(ColumnGroupBox);
      with RemarkLabel[vIndex] do
      begin
        Parent  := ColumnGroupBox;
        Left    := 250;
        Top     := vIndex * 30 + 28;
        Caption := aRemark[vIndex];
      end;
    end
    else
    begin
      ColumnLabel[vIndex] := TLabel.Create(ColumnGroupBox);
      with ColumnLabel[vIndex] do
      begin
        Parent  := ColumnGroupBox;
        Left    := 310;
        Top     := (vIndex-15) * 30 + 28;
        Caption := aName[vIndex];
        if aNotNull[vIndex] then
          Font.Style := [fsBold];
        if vMaxLeft < Left + Width + 10 then
          vMaxLeft := Left + Width + 10;
      end;

      ColumnComboBox[vIndex] := TcxComboBox.Create(ColumnGroupBox);
      with ColumnComboBox[vIndex] do
      begin
        Parent  := ColumnGroupBox;
        Left    := 425;
        Top     := (vIndex-15) * 30 + 25;
        Tag     := IfThen(aNotNull[vIndex], 1, 0);
        Properties.Items.Add('[연결 안 함]');
        Properties.DropDownListStyle  := lsFixedList;
        Style.BorderStyle             := ebsFlat;
        Style.Color                   := clWindow;
        Style.LookAndFeel.Kind        := lfOffice11;
        Style.LookAndFeel.NativeStyle := true;
        StyleFocused.BorderStyle      := ebsFlat;
        StyleFocused.Color            := $0080FFFF;
      end;

      RemarkLabel[vIndex] := TLabel.Create(ColumnGroupBox);
      with RemarkLabel[vIndex] do
      begin
        Parent  := ColumnGroupBox;
        Left    := 545;
        Top     := (vIndex-15) * 30 + 28;
        Caption := aRemark[vIndex];
      end;
    end;

  end;
  if High(aName) < 15 then
  begin
    if vMaxLeft > 75 then
      for vIndex := Low(aName) to High(aName) do
        ColumnComboBox[vIndex].Left := vMaxLeft;
    ColumnGroupBox.Height := ColumnComboBox[High(aName)].Top + ColumnComboBox[High(aName)].Height + 15;
    ClientHeight := ColumnGroupBox.Height + 91;
  end
  else
  begin
    ColumnGroupBox.Height := ColumnComboBox[14].Top + ColumnComboBox[14].Height + 15;
    ClientHeight := ColumnGroupBox.Height + 91;
    ClientWidth := 545 + 60;
  end;

  // 콤보박스에 엑셀에서 읽은 칼럼들을 넣어준다
  vXLSAdapter := TXLSAdapter.Create(self);
  vXLSFile    := TXLSFile.Create(vXLSAdapter);
  vXLSFile.Connect;
  try
    vXLSFile.OpenFile(ExcelFileEdit.Text);
  except
    ErrBox('파일이 깨졌거나, 엑셀 호환 파일이 아닙니다.');
    Exit;
  end;
  try
    vIndex := 1;
    while True do
    begin
      if vXLSFile.CellValue[1, vIndex] = '' then
        Break
      else
        ColumnComboBox[0].Properties.Items.Add(vXLSFile.CellValue[1, vindex]);
      Inc(vIndex);
    end;
    for vIndex := Low(aName)+1 to High(aName) do
      ColumnComboBox[vIndex].Properties.Items.Assign(ColumnComboBox[0].Properties.Items);
    for vIndex := Low(aName) to High(aName) do
      ColumnComboBox[vIndex].ItemIndex := 0;
  finally
    vXLSFile.Disconnect;
    vXLSFile.Free;
    vXLSAdapter.Free;
  end;

  //이전에 같은화일이름로 매핑했던적이 있는데 체크
  vTemp := GetIniFile('Excel', ExcelFileName, '');
  if vTemp <> '' then
  begin
    for vIndex := Low(ColumnComboBox) to High(ColumnComboBox) do
    begin
      ColumnComboBox[vIndex].ItemIndex :=  StrToIntDef(CopyPos(vTemp, '|', vIndex),-1);
      if ColumnComboBox[vIndex].ItemIndex > 0 then
        ColumnComboBox[vIndex].Style.Font.Color := clBlue;
    end;
  end;

  Result := true;
end;

end.
