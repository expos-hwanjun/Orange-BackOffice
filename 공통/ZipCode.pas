// 우편번호 조회 (F)

unit ZipCode;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer,
  cxTextEdit, cxLookAndFeels, cxLookAndFeelPainters, StrUtils;

type
  TZipCodeForm = class(TForm)
    DongLabel: TLabel;
    DongEdit: TcxTextEdit;
    SearchButton: TButton;
    OKButton: TButton;
    CloseButton: TButton;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewZipCode: TcxGridColumn;
    GridTableViewState: TcxGridColumn;
    GridTableViewCity: TcxGridColumn;
    GridTableViewDong: TcxGridColumn;
    GridTableViewAddress: TcxGridColumn;
    GridLevel: TcxGridLevel;

    procedure DongEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure GridTableViewDblClick(Sender: TObject);
    procedure GridTableViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);

  public
    Zip, Addr, Addr2: string;
  end;



implementation

uses
  DBModule, Common;

{$R *.dfm}

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 동 이름 입력창에서 키보드를 누를 때
procedure TZipCodeForm.DongEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : SearchButton.Click;
    VK_Escape : CloseButton.Click;
  end;
end;

procedure TZipCodeForm.FormShow(Sender: TObject);
begin
  //신주소사용
  if GetOption(315) = '1' then
  begin
    DongLabel.Caption := '도로명/읍/면/동';
    GridTableViewState.Caption   := '주  소';
    GridTableViewCity.Caption    := '도로명';
    GridTableViewDong.Caption    := '동';
    GridTableViewAddress.Caption := '건물명';
  end
  else
  begin
    DongLabel.Caption := '동 이름';
    GridTableViewState.Caption   := '시/도';
    GridTableViewCity.Caption    := '시/군/구';
    GridTableViewDong.Caption    := '동/읍/면';
    GridTableViewAddress.Caption := '상세 번지';
  end;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 그리드를 더블클릭할 때
procedure TZipCodeForm.GridTableViewDblClick(Sender: TObject);
begin
  OKButton.Click;
end;
//------------------------------------------------------------------------------
// 그리드에서 키보드를 누를 때
procedure TZipCodeForm.GridTableViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : OKButton.Click;
    VK_Escape : CloseButton.Click;
  end;
end;
//------------------------------------------------------------------------------
// 그리드에 포커스가 들어올 때
procedure TZipCodeForm.GridEnter(Sender: TObject);
begin
  // 그리드에 내용이 있는데 선택된 레코드가 없다면 선택한다
  if (GridTableView.DataController.RecordCount > 0) and (GridTableView.DataController.FocusedRecordIndex < 0) then
    GridTableView.DataController.FocusedRecordIndex := 0;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TZipCodeForm.SearchButtonClick(Sender: TObject);
begin
  // 동 이름을 입력했는지 확인한다
  if Trim(DongEdit.Text) = EmptyStr then
    DongEdit.SetFocus
  // 조회
  else
    try
      Screen.Cursor := crHourGlass;
      if GetOption(315) = '1' then
      begin
        DM.OpenQuery('select NO_POST, '
                    +'       NM_CITYDO, '
                    +'       NM_CITYGU + case when NM_TOWN is not null then '' ''+NM_TOWN else '''' end, '
                    +'       NM_DORO, '
                    +'       NM_DONG, '
                    +'       NM_BUILDING '
                    +'  from MS_POST_DORO '
                    +' where NM_DORO like ''%''+:P0+''%'' or NM_DONG like ''%''+:P0+''%'' or NM_TOWN like ''%''+:P0+''%'' or NM_BUILDING like ''%''+:P0+''%'' '
                    +' order by NO_POST ',
                    [Trim(DongEdit.Text)]);
      end
      else
      begin
        DM.OpenQuery('select NO_POST, '
                    +'       NM_CITYDO, '
                    +'       NM_GUGUN, '
                    +'       NM_DONG, '
                    +'       NM_BUNGI '
                    +'from   MS_POST '
                    +'where  NM_DONG like ''%''+:P0+''%'' '
                    +'order by NO_POST',
                    [Trim(DongEdit.Text)]);
      end;
      GridTableView.BeginUpdate;
      GridTableView.DataController.RecordCount := 0;
      try
        while not DM.Query.Eof do
        begin
          GridTableView.DataController.AppendRecord;
          if GetOption(315) = '1' then
          begin
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewZipCode.Index] := LeftStr(DM.Query.Fields[0].AsString,3)+'-'+RightStr(DM.Query.Fields[0].AsString,3);  //우편번호
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewState.Index  ] := DM.Query.Fields[1].AsString + Ifthen(DM.Query.Fields[2].AsString <> '', ' '+DM.Query.Fields[2].AsString,'');  //시도
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewCity.Index   ] := DM.Query.Fields[2].AsString;  //구
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDong.Index   ] := DM.Query.Fields[3].AsString;  //동
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewAddress.Index] := DM.Query.Fields[4].AsString;  //번지
            GridTableView.DataController.Post;
          end
          else
          begin
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewZipCode.Index] := DM.Query.Fields[0].AsString;  //우편번호
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewState.Index  ] := DM.Query.Fields[1].AsString;  //시도
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewCity.Index   ] := DM.Query.Fields[2].AsString;  //구
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewDong.Index   ] := DM.Query.Fields[3].AsString;  //동
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewAddress.Index] := DM.Query.Fields[4].AsString;  //번지
            GridTableView.DataController.Post;
          end;
          DM.Query.Next;
        end;
      except
      end;
      OKButton.Enabled := GridTableView.DataController.RecordCount > 0;
      if GridTableView.DataController.RecordCount > 0 then
      begin
        Grid.SetFocus;
        GridTableView.DataController.FocusedRecordIndex := 0;
      end;
    finally
      DM.FinishQuery;
      GridTableView.EndUpdate;
      Screen.Cursor := crDefault;
    end;
end;
//------------------------------------------------------------------------------
// 확인 버튼
procedure TZipCodeForm.OKButtonClick(Sender: TObject);
begin
  if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
  begin
    Zip  := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewZipCode.Index];
    if GetOption(315) = '1' then
    begin
      Addr := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewState.Index]+ ' '+
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCity.Index]+
                Ifthen(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDong.Index] <> EmptyStr, Format('(%s)',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDong.Index]]),'');

      Addr2 :=GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewAddress.Index];
    end
    else
    begin
      Addr := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewState.Index]+ ' '+
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCity.Index]+ ' '+
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDong.Index];
      Addr2 := EmptyStr;
    end;
    ModalResult := mrOK;
  end;
end;
//------------------------------------------------------------------------------
// 취소 버튼
procedure TZipCodeForm.CloseButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
