unit StoreSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxContainer,
  cxEdit, cxListBox, AdvGlassButton, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxLabel, AdvGlowButton, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  cxTextEdit, Vcl.ExtCtrls;

type
  TStoreSelectForm = class(TForm)
    SearchLabel: TLabel;
    SearchEdit: TcxTextEdit;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewCode: TcxGridColumn;
    GridTableViewName1: TcxGridColumn;
    GridTableViewName2: TcxGridColumn;
    GridTableViewName3: TcxGridColumn;
    GridTableViewName4: TcxGridColumn;
    GridTableViewName5: TcxGridColumn;
    GridTableViewName6: TcxGridColumn;
    GridTableViewName7: TcxGridColumn;
    GridTableViewName8: TcxGridColumn;
    GridTableViewName9: TcxGridColumn;
    GridTableViewName10: TcxGridColumn;
    GridTableViewName11: TcxGridColumn;
    GridTableViewName12: TcxGridColumn;
    GridTableViewName13: TcxGridColumn;
    GridTableViewName14: TcxGridColumn;
    GridTableViewName15: TcxGridColumn;
    GridTableViewName16: TcxGridColumn;
    GridTableViewName17: TcxGridColumn;
    GridTableViewName18: TcxGridColumn;
    GridTableViewName19: TcxGridColumn;
    GridTableViewName20: TcxGridColumn;
    GridLevel: TcxGridLevel;
    OKButton: TAdvGlowButton;
    CancelButton: TAdvGlowButton;
    SearchButton: TAdvGlowButton;
    cxStyleRepository1: TcxStyleRepository;
    FooterStyle: TcxStyle;
    CustomerButton: TAdvGlowButton;
    HeaderStyle: TcxStyle;
    Shape1: TShape;
    Label1: TLabel;
    StyleFontBlue: TcxStyle;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridEnter(Sender: TObject);
    procedure GridTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CustomerButtonClick(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    procedure CreateFlatRoundRgn;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
  public
    QuerySQL  :String;
    isPartnerCheck,
    isStoreChange,
    isAutoSearch :Boolean;
    SelectHeadCode,
    SelectStoreCode,
    SelectStoreName :String;
    Code :String;
    Names: array of string;
  end;

var
  StoreSelectForm: TStoreSelectForm;

implementation
uses Common, DBModule;
{$R *.dfm}
procedure ExcludeRectRgn(var Rgn: HRGN; LeftRect, TopRect, RightRect, BottomRect: Integer);
var
  RgnEx: HRGN;
begin
  RgnEx := CreateRectRgn(LeftRect, TopRect, RightRect, BottomRect);
  CombineRgn(Rgn, Rgn, RgnEx, RGN_OR);
  DeleteObject(RgnEx);
end;


procedure TStoreSelectForm.FormCreate(Sender: TObject);
begin
  CreateFlatRoundRgn;
  SetLength(Names, GridTableView.ColumnCount-1);
  QuerySQL  := '';
  if isLogOut then
    CustomerButton.Enabled := false;

  isStoreChange := false;
  isAutoSearch  := true;
end;

procedure TStoreSelectForm.FormShow(Sender: TObject);
var
  vIndex: Integer;
  vSize : Integer;
begin
  // 칼럼 폭에 맞춰 폼 크기를 조정한다
  vSize := 20;
  for vIndex := 0 to GridTableView.ColumnCount-1 do
    if GridTableView.Columns[vIndex].Visible then
      vSize := vSize + GridTableView.Columns[vIndex].Width;
  if vSize < 430 then
    vSize := 430;
  ClientWidth := vSize + 10;

  CreateFlatRoundRgn;

  if not isAutoSearch then
  begin
    SearchEdit.SetFocus;
    Exit;
  end;

  if isPartnerCheck then
  begin
    SearchButton.Click;
    Exit;
  end;
  GridTableView.DataController.RecordCount := 0;
  GridTableView.DataController.BeginUpdate;
  for vIndex := 0 to StoreList.Count-1 do
  begin
    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := CopyPos(StoreList.Strings[vIndex],splitColumn,0);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := CopyPos(StoreList.Strings[vIndex],splitColumn,1);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 2] := CopyPos(StoreList.Strings[vIndex],splitColumn,2);
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 3] := CopyPos(StoreList.Strings[vIndex],splitColumn,3);
  end;
  GridTableView.DataController.EndUpdate;
end;


procedure TStoreSelectForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TStoreSelectForm.CreateFlatRoundRgn;
const
  CORNER_SIZE = 6;
var
  Rgn: HRGN;
begin
  with BoundsRect do
  begin
    Rgn := CreateRoundRectRgn(0, 0, Right - Left + 1, Bottom - Top + 1, CORNER_SIZE, CORNER_SIZE);
    // exclude left-bottom corner
    ExcludeRectRgn(Rgn, 0, Bottom - Top - CORNER_SIZE div 2, CORNER_SIZE div 2, Bottom - Top + 1);
    // exclude right-bottom corner
    ExcludeRectRgn(Rgn, Right - Left - CORNER_SIZE div 2, Bottom - Top - CORNER_SIZE div 2, Right - Left , Bottom - Top);
  end;
  // the operating system owns the region, delete the Rgn only SetWindowRgn fails
  if SetWindowRgn(Handle, Rgn, True) = 0 then
    DeleteObject(Rgn);
end;

procedure TStoreSelectForm.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP;
    WindowClass.Style := WindowClass.Style or CS_DROPSHADOW;
  end;
end;

procedure TStoreSelectForm.CustomerButtonClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;


procedure TStoreSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if SearchEdit.Focused and (Key = VK_RETURN) then
    SearchButtonClick(nil);
end;


procedure TStoreSelectForm.GridEnter(Sender: TObject);
begin
  // 그리드에 내용이 있는데 선택된 레코드가 없다면 선택한다
  if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.FocusedRecordIndex < 0) then
    GridTableView.DataController.FocusedRecordIndex := 0;
end;

procedure TStoreSelectForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  OKButton.Click;
end;

procedure TStoreSelectForm.GridTableViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Return : OKButton.Click;
    VK_Escape : CancelButton.Click;
  end;
end;

procedure TStoreSelectForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if ((GridTableViewCode.Caption = '협력사') and (ARecord.Values[GridTableViewName5.Index] = '본사'))
    or ((GridTableViewCode.Caption = '아이디') and (ARecord.Values[GridTableViewName4.Index] = '본사'))  then
    AStyle := StyleFontBlue;

end;

procedure TStoreSelectForm.OKButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  if GridTableView.DataController.GetFocusedRecordIndex < 0 then
  begin
    MsgBox('매장을 선택하세요');
    Exit;
  end;
  if isPartnerCheck then
  begin
    if GridTableView.DataController.FocusedRecordIndex >= 0 then
    begin
      Code := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCode.Index];
      for vIndex := 1 to GridTableView.ColumnCount-1 do
        if GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex] <> null then
          Names[vIndex-1] := string(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, vIndex])
        else
          Names[vIndex-1] := EmptyStr;
      ModalResult := mrOK;
    end;
    Exit;
  end;

  if StoreCode = GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0] then
  begin
    Close;
  end
  else
  begin
    if isStoreChange then
    begin
      try
        DM.OpenQuery('select CD_STORE '
                    +'  from MS_STORE '
                    +' where CD_HEAD  =:P0 '
                    +'   and CD_STORE =:P1 ',
                    [HeadStoreCode,
                     GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0]]);
         if DM.Query.Eof then
         begin
           MsgBox('매장정보가 없어 변경할 수 없습니다');
           Exit;
         end;
      finally
        DM.Query.Close;
      end;
      StoreCode   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0];
      StoreName   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 1];
    end;

    SelectStoreCode   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0];
    SelectStoreName   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 1];
    SelectHeadCode    := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 2];

    ModalResult := mrOK;
  end;
end;

procedure TStoreSelectForm.SearchButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  if isPartnerCheck then
  begin
    try
      DM.OpenQuery(QuerySQL,
                  [SearchEdit.Text], false, RestBaseURL);

      GridTableView.BeginUpdate;
      GridTableView.DataController.RecordCount := 0;
      try
        while not DM.Query.Eof do
        begin
          GridTableView.DataController.AppendRecord;
          GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewCode.Index] := DM.Query.Fields[0].AsString;
          for vIndex := 1 to GridTableView.ColumnCount-1 do
            if DM.Query.Fields.Count > vIndex then
              GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := DM.Query.Fields[vIndex].AsString
            else
              GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := EmptyStr;
          GridTableView.DataController.Post;
          DM.Query.Next;
        end;
      except
      end;
      OKButton.Enabled     := GridTableView.DataController.RecordCount > 0;
      GridTableView.EndUpdate;
      if GridTableView.DataController.RecordCount > 0 then
      begin
        if Showing and Grid.Visible and Grid.Enabled then
          Grid.SetFocus;
        GridTableView.Controller.FocusedRowIndex := 0;
      end;
    finally
      DM.Query.Close;
    end;
  end
  else
  begin
    GridTableView.DataController.RecordCount := 0;
    GridTableView.DataController.BeginUpdate;
    for vIndex := 0 to StoreList.Count-1 do
    begin
      if (SearchEdit.Text = '') or (Pos(SearchEdit.Text, StoreList.Strings[vIndex]) > 0) then
      begin
        GridTableView.DataController.AppendRecord;
        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := CopyPos(StoreList.Strings[vIndex],splitColumn,0);
        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 1] := CopyPos(StoreList.Strings[vIndex],splitColumn,1);
        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 2] := CopyPos(StoreList.Strings[vIndex],splitColumn,2);
      end;
    end;
    GridTableView.DataController.EndUpdate;
    if GridTableView.DataController.RecordCount > 0 then
    begin
      SearchEdit.Clear;
      Grid.SetFocus;
      GridTableView.Controller.FocusedRowIndex := 0;
    end;
  end;
end;

procedure TStoreSelectForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;

  if (Msg.Result = HTCLIENT) then
    Msg.Result := HTCAPTION;

end;

end.
