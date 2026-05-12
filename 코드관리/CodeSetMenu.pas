unit CodeSetMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, dxColorEdit, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeSetMenuForm = class(TInheritGridEditForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1MenuCode: TcxGridColumn;
    GridTableView1MenuName: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1SalePrice: TcxGridColumn;
    GridTableView1Qty: TcxGridColumn;
    GridTableView1Seq: TcxGridColumn;
    GridTableView1Color: TcxGridColumn;
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
  private
    TableName :String;
    PLUDefaultColor :TColor;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  CodeSetMenuForm: TCodeSetMenuForm;

implementation
uses
  Common, Help, DBModule, Main;
{$R *.dfm}

{ TCodeSetMenuForm }
function TCodeSetMenuForm.DoSearch: Boolean;
begin
  Result := false;
  GridTableView1.DataController.RecordCount := 0;
  OpenQuery('select   CD_MENU, '
           +'         NM_MENU '
           +'from     MS_MENU '
           +'where    CD_HEAD      =:P0 '
           +'  and    CD_STORE     =:P1 '
           +'  and    DS_MENU_TYPE =:P2 '
           +'  and    YN_USE       =''Y'' '
           +'order by CD_MENU',
            [HeadStoreCode,
             StoreCode,
             Ifthen(GetStrPointerData(ConditionToolBarComboBox)='I','N', GetStrPointerData(ConditionToolBarComboBox))]);
  try
    Result            := DM.ReadQuery(Query, GridTableView);
    GridPanel.Enabled := Result;
    Grid.Enabled      := Result;
    if Result then
      GridTableView.DataController.FocusedRecordIndex := 0;
  finally
    FinishQuery;
  end;
end;

procedure TCodeSetMenuForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  isChanged := true;
end;

procedure TCodeSetMenuForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  // 메뉴구분
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'S';
  ConditionToolBarComboBox.Properties.Items.AddObject('세트', TObject(vCode));
  New(vCode);
  vCode^.Data := 'O';
  ConditionToolBarComboBox.Properties.Items.AddObject('오픈세트', TObject(vCode));
  New(vCode);
  vCode^.Data := 'P';
  ConditionToolBarComboBox.Properties.Items.AddObject('그룹메뉴', TObject(vCode));
  if GetOption(57) = '1' then
  begin
    New(vCode);
    vCode^.Data := 'I';
    ConditionToolBarComboBox.Properties.Items.AddObject('아이템', TObject(vCode));
  end;
  ConditionToolBarComboBox.ItemIndex := 0;
  TableName := ' MS_MENU_SET ';
end;

procedure TCodeSetMenuForm.FormShow(Sender: TObject);
begin
  inherited;
  try
    OpenQuery('select NM_CODE3 '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = ''87'' '
             +'   and CD_CODE  =''002'' ',
             [HeadStoreCode,
              StoreCode]);
    if not Query.Eof then
      PLUDefaultColor      := StringToColor(Query.FieldByName('NM_CODE3').AsString);
  finally
    Query.Close;
  end;
end;

procedure TCodeSetMenuForm.DoGridLink;
begin
  inherited;
  if TableName = '' then
    TableName := ' MS_MENU_SET ';
  isLoading := true;
  if GetStrPointerData(ConditionToolBarComboBox) <> 'I' then
    OpenQuery('select   a.CD_MENU_SET as CD_MENU, '
             +'         b.NM_MENU, '
             +'         b.PR_SALE, '
             +'         a.QTY_SET, '
             +'         a.SEQ '
             +Ifthen(TableName <> ' MS_MENU_SET ',',a.COLOR ','')
             +'   from '+TableName+' as a inner join '
             +'         MS_MENU b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_MENU_SET = b.CD_MENU '
             +'where    a.CD_HEAD  =:P0 '
             +'  and    a.CD_STORE =:P1 '
             +'  and    a.CD_MENU  =:P2 '
             +'order by a.SEQ',
              [HeadStoreCode,
               StoreCode,
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]])
  else
    OpenQuery('select   a.CD_ITEM as CD_MENU, '
             +'         b.NM_MENU, '
             +'         b.PR_SALE, '
             +'         a.SEQ '
             +'   from  MS_MENU_ITEM as a inner join '
             +'         MS_MENU b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_ITEM = b.CD_MENU '
             +'where    a.CD_HEAD  =:P0 '
             +'  and    a.CD_STORE =:P1 '
             +'  and    a.CD_MENU  =:P2 '
             +'order by a.SEQ',
              [HeadStoreCode,
               StoreCode,
               GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);

  MainPanel.Enabled := DM.ReadQuery(Query, GridTableView1);
  isLoading := false;
end;

procedure TCodeSetMenuForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  GridTableView1.DataController.DeleteRecord(GridTableView1.DataController.GetFocusedRecordIndex);
  isChanged := true;
end;

procedure TCodeSetMenuForm.ButtonToolBarNewButtonClick(Sender: TObject);
var
  vIndex, vIndex1  : Integer;
  vSeq :Integer;
begin
  if GridTableView.DataController.RecordCount = 0 then Exit;

  vSeq := 0;
  for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
  begin
    if GridTableView1.DataController.Values[vIndex, GridTableView1Seq.Index] > vSeq then
      vSeq := GridTableView1.DataController.Values[vIndex, GridTableView1Seq.Index];
  end;


  // 상품 바코드를 조회한다
  with THelpForm.Create(Self) do
    try
      Caption                    := '메뉴 조회';
      GridTableViewCode.Caption  := GridTableView1MenuCode.Caption;
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := GridTableView1MenuName.Caption;
      GridTableViewName1.Width   := 170;
      GridTableViewName2.Caption := '판매단가';
      GridTableViewName2.Width   := 70;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

      GridTableView.OptionsSelection.MultiSelect := true;

      SQLText    := 'select   CD_MENU, '
                   +'         NM_MENU, '
                   +'         PR_SALE '
                   +'from     MS_MENU '
                   +'where    CD_HEAD  =:P0 '
                   +'  and    CD_STORE =:P1 '
                   +'  and   (CD_MENU like ConCat(:P2,''%'') '
                   +'      or NM_MENU like ConCat(''%'',:P2,''%'') or NM_MENU_SHORT like ConCat(''%'',:P2,''%'')) '
                   +Ifthen(GetStrPointerData(ConditionToolBarComboBox) = 'I','and DS_MENU_TYPE = ''I'' ', '  and DS_MENU_TYPE in (''N'', ''I'') ')
                   +'  and    YN_USE   = ''Y'' '
                   +'  and    CD_MENU <> '''+Self.GridTableView.DataController.Values[Self.GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]+''' '
                   +'order by CD_STORE, CD_MENU';
      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Self.GridTableView1.DataController.BeginUpdate;
        for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
        begin
          vIndex1 := GridTableView1.DataController.FilteredIndexByRecordIndex[GridTableView1.DataController.FindRecordIndexByText(0, GridTableView1MenuCode.Index, GridTableView.Controller.SelectedRecords[vIndex].Values[0], false, false, true)];
          if vIndex1 >= 0 then Continue;

          Inc(vSeq);
          Self.GridTableView1.DataController.AppendRecord;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1MenuCode.Index  ] := GridTableView.Controller.SelectedRecords[vIndex].Values[0];
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1MenuName.Index  ] := GridTableView.Controller.SelectedRecords[vIndex].Values[1];
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1SalePrice.Index ] := GridTableView.Controller.SelectedRecords[vIndex].Values[2];
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1Qty.Index       ] := 1;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1Seq.Index       ] := vSeq;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1Color.Index     ] := PLUDefaultColor;
        end;
        Self.GridTableView1.DataController.EndUpdate;
        isChanged := true;
        ButtonToolBarNewButton.Enabled := true;
        MainPanel.Enabled := true;
      end;
    finally
      Free;
    end;
end;


procedure TCodeSetMenuForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  GridTableView.DataController.RecordCount  := 0;
  if GetStrPointerData(ConditionToolBarComboBox) = 'S' then
    TableName := ' MS_MENU_SET '
  else if GetStrPointerData(ConditionToolBarComboBox) = 'O' then
    TableName := ' MS_MENU_OPEN '
  else if GetStrPointerData(ConditionToolBarComboBox) = 'P' then
    TableName := ' MS_MENU_GROUP '
  else if GetStrPointerData(ConditionToolBarComboBox) = 'I' then
    TableName := ' MS_MENU_ITEM ';

  GridTableView1Color.Visible := (GetStrPointerData(ConditionToolBarComboBox) = 'O') or (GetStrPointerData(ConditionToolBarComboBox) = 'P');
  GridTableView1Qty.Visible   := (GetStrPointerData(ConditionToolBarComboBox) = 'I') or (GetStrPointerData(ConditionToolBarComboBox) = 'S');

  DoSearch;
end;                        

function TCodeSetMenuForm.DoSave: Boolean;
var vRow, vIndex : Integer;
    vSQL :String;
begin
  if PrevRow < 0 then
    vRow := GridTableView.DataController.GetFocusedRecordIndex
  else
    vRow := PrevRow;
  result := false;
  try
    ExecQuery('delete from '+TableName
               +'where  CD_HEAD  =:P0 '
               +'  and  CD_STORE =:P1 '
               +'  and  CD_MENU  =:P2;',
                [HeadStoreCode,
                 StoreCode,
                 GridTableView.DataController.Values[vRow, GridTableViewMenuCode.Index]],
                 false);
    vSQL := '';
    for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
    begin
      if GetStrPointerData(ConditionToolBarComboBox) = 'I' then
        vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'', %d, Now()),',
                             [HeadStoreCode,
                              StoreCode,
                              GridTableView.DataController.Values[vRow, GridTableViewMenuCode.Index],
                              GridTableView1.DataController.Values[vIndex, GridTableView1MenuCode.Index],
                              Trunc(GridTableView1.DataController.Values[vIndex, GridTableView1Seq.Index])])

      else if GetStrPointerData(ConditionToolBarComboBox) = 'S' then
        vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',%d, %d, ''%s'',Now()),',
                             [HeadStoreCode,
                              StoreCode,
                              GridTableView.DataController.Values[vRow, GridTableViewMenuCode.Index],
                              GridTableView1.DataController.Values[vIndex, GridTableView1MenuCode.Index],
                              Trunc(GridTableView1.DataController.Values[vIndex, GridTableView1Qty.Index]),
                              Trunc(GridTableView1.DataController.Values[vIndex, GridTableView1Seq.Index]),
                              UserCode])
      else
        vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''%s'',%d, %d, ''%s'',''%s'',''%s'',Now()),',
                             [HeadStoreCode,
                              StoreCode,
                              GridTableView.DataController.Values[vRow, GridTableViewMenuCode.Index],
                              GridTableView1.DataController.Values[vIndex, GridTableView1MenuCode.Index],
                              Trunc(GridTableView1.DataController.Values[vIndex, GridTableView1Qty.Index]),
                              Trunc(GridTableView1.DataController.Values[vIndex, GridTableView1Seq.Index]),
                              UserCode,
                              ColorToString(GridTableView1.DataController.Values[vIndex, GridTableView1Color.Index]),
                              TColorToHex(GridTableView1.DataController.Values[vIndex, GridTableView1Color.Index])]);
    end;
    if vSQL <> '' then
    begin
      if GetStrPointerData(ConditionToolBarComboBox) = 'I' then
        vSQL := 'insert into MS_MENU_ITEM(CD_HEAD, CD_STORE, CD_MENU, CD_ITEM, SEQ, DT_CHANGE) values '+LeftStr(vSQL,Length(vSQL)-1)+';'
      else if GetStrPointerData(ConditionToolBarComboBox) = 'S' then
        vSQL := 'insert into MS_MENU_SET(CD_HEAD, CD_STORE, CD_MENU, CD_MENU_SET, QTY_SET, SEQ, CD_SAWON_CHG,  DT_CHANGE) values '+LeftStr(vSQL,Length(vSQL)-1)+';'
      else if GetStrPointerData(ConditionToolBarComboBox) = 'P' then
        vSQL := 'insert into MS_MENU_GROUP(CD_HEAD, CD_STORE, CD_MENU, CD_MENU_SET, QTY_SET, SEQ, CD_SAWON_CHG, COLOR, COLOR_HEX, DT_CHANGE) values '+LeftStr(vSQL,Length(vSQL)-1)+';'
      else if GetStrPointerData(ConditionToolBarComboBox) = 'O' then
        vSQL := 'insert into MS_MENU_OPEN(CD_HEAD, CD_STORE, CD_MENU, CD_MENU_SET, QTY_SET, SEQ, CD_SAWON_CHG, COLOR, COLOR_HEX, DT_CHANGE) values '+LeftStr(vSQL,Length(vSQL)-1)+';';
    end;

    Result := ExecQuery(vSQL, [], true);
    ExtremeMainForm.PosSendMessage;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

end.
