unit SystemExcelEx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Uni, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, Clipbrd, StrUtils, AdvPanel,
  AdvGlassButton, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, dxmdaset, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  TSystemExcelExForm = class(TInheritShowForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridTableViewBuyPrice: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    GridTableViewSeq: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    LineAddButton: TAdvGlassButton;
    GridTableViewDBMenuCode: TcxGridColumn;
    PopupImageList: TImageList;
    LineCountEdit: TcxCurrencyEdit;
    GridTableViewDup: TcxGridColumn;
    procedure LineAddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
  private
    MenuCode :String;
    procedure mnuPopup(Sender: TObject);
    procedure mnuPasteClick(Sender :TObject);
    procedure mnuCellDeleteClick(Sender :TObject);
    procedure mnuClassSelectClick(Sender :TObject);
    procedure mnuCompanySelectClick(Sender :TObject);
    procedure mnuTaxChangeClick(Sender :TObject);
    procedure DoGoodsSelect;
  public
    { Public declarations }
  end;

var
  SystemExcelExForm: TSystemExcelExForm;

implementation
uses
  Common, DBModule, ProxyCheck, Help;

{$R *.dfm}

procedure TSystemExcelExForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  try
    GridTableView.DataController.BeginUpdate;
    GridTableView.Controller.DeleteSelection;

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index] := vIndex + 1;
  finally
    GridTableView.DataController.EndUpdate;
  end;
end;

procedure TSystemExcelExForm.FormCreate(Sender: TObject);
var
  vPopMenuItem: TMenuItem;
  vIndex :Integer;
  vCode : PStrPointer;
begin
  inherited;
  //그리드 팝업 메뉴 설정
  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);
  TPopupMenu(GridTableView.PopupMenu).Images := PopupImageList;
  vPopMenuItem.Caption   := '항목 선택';
  vPopMenuItem.ImageIndex := 0;

  for vIndex := 0 to TPopupMenu(GridTableView.PopupMenu).Items.Count - 1 do
    TPopupMenu(GridTableView.PopupMenu).Items[0].SetParentComponent(vPopMenuItem);
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);   //2
  vPopMenuItem.Caption   := '붙여넣기';
  vPopMenuItem.OnClick   := mnuPasteClick;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);
  vPopMenuItem.ImageIndex := 1;

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);   //2
  vPopMenuItem.Caption   := '셀값삭제';
  vPopMenuItem.OnClick   := mnuCellDeleteClick;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);
  vPopMenuItem.ImageIndex := 2;


  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);   //2
  vPopMenuItem.Caption   := '-';
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);

  vPopMenuItem := TMenuItem.Create(GridTableView.PopupMenu);   //2
  vPopMenuItem.Caption   := '과면세 변경';
  vPopMenuItem.OnClick   := mnuTaxChangeClick;
  TPopupMenu(GridTableView.PopupMenu).Items.Add(vPopMenuItem);
  vPopMenuItem.ImageIndex := 3;
end;

procedure TSystemExcelExForm.mnuPasteClick(Sender: TObject);
var
  vClipboard: string;
  vRowList, vColList: TStringList;
  vRow, vCol, vIndex, vRowIndex :Integer;
  vRecord, vColIndex :Integer;
begin
  inherited;
  if CharCnt(Clipboard.AsText,#13) < 2 then Exit;
  if GridTableView.Controller.FocusedColumn = GridTableViewSeq then Exit;

  MenuCode := '';
  vRecord := GridTableView.Controller.FocusedRecordIndex;
  vColIndex  := GridTableView.Controller.FocusedColumn.Index;

  try
    vRowList      := TStringList.Create;
    vColList      := TStringList.Create;

    vClipboard := Clipboard.AsText;
    Clipboard.AsText := '';

    Split(vClipboard, #13, vRowList);
    GridTableView.DataController.BeginUpdate;
    for vRow := 0 to vRowList.Count-1 do
    begin
      vRowList[vRow] := Replace(vRowList[vRow],#$A, '');
      Split(vRowList[vRow], #9, vColList);
      for vCol := 0 to vColList.Count-1 do
      begin
        if vRecord+vRow >= GridTableView.DataController.RecordCount then
        begin
          GridTableView.DataController.AppendRecord;
          GridTableView.DataController.Values[vRecord+vRow, GridTableViewSeq.Index] := GridTableView.DataController.RecordCount;
          vRowIndex := GridTableView.DataController.RecordCount-1;
        end
        else
          vRowIndex := vRecord+vRow;

        if vColIndex+vCol = GridTableViewMenuCode.Index then
        begin
          if GetOnlyNumber(vColList.Strings[vCol]) = Replace(vColList.Strings[vCol],' ','') then
            GridTableView.DataController.Values[vRowIndex, vColIndex+vCol] := GetOnlyNumber(vColList.Strings[vCol]);
        end
        else if (vColIndex+vCol = GridTableViewDsTax.Index) and ((vColList.Strings[vCol] = '1') or (vColList.Strings[vCol] = '0')) then
          GridTableView.DataController.Values[vRowIndex, vColIndex+vCol] := Ifthen(vColList.Strings[vCol]='0','면세','과세');

        if (vColIndex+vCol = GridTableViewMenuCode.Index) and (GetOnlyNumber(vColList.Strings[vCol]) = vColList.Strings[vCol]) then
          MenuCode := MenuCode + Format('''%s'',',[GetOnlyNumber(vColList.Strings[vCol])]);
      end;
    end;


    GridTableView.DataController.EndUpdate;
  finally
    vRowList.Free;
    vColList.Free;
  end;

  //상품코드가 변경되었으면 있는 상품인지 체크한다
  if MenuCode <> '' then
  begin
    DoGoodsSelect;
    ButtonToolBarSaveButton.Enabled := true;
  end;

  //마지막에 빈라인추가
  if NVL(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewMenuCode.Index],'') <> '' then
  begin
    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSeq.Index] := GridTableView.DataController.RecordCount;
  end;
end;

procedure TSystemExcelExForm.mnuCellDeleteClick(Sender: TObject);
var vRow, vCol :Integer;
begin
  for vRow := 0 to GridTableView.Controller.SelectedRowCount - 1 do
    for vCol := 0 to GridTableView.Controller.SelectedColumnCount - 1 do
    begin
        GridTableView.Controller.SelectedRows[vRow].Values[GridTableView.Controller.SelectedColumns[vCol].Index] := null;
    end;
end;

procedure TSystemExcelExForm.mnuPopup(Sender: TObject);
begin
  TPopupMenu(GridTableView.PopupMenu).Items[4].Enabled := false;
end;



procedure TSystemExcelExForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = Ord('V')) then
    mnuPasteClick(nil);
end;

procedure TSystemExcelExForm.FormShow(Sender: TObject);
begin
  inherited;
  ConditionToolBar.Visible := true;
  GridTableView.DataController.AppendRecord;
  GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSeq.Index] := GridTableView.DataController.RecordCount;
end;

procedure TSystemExcelExForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if NVL(ARecord.Values[GridTableViewDBMenuCode.Index],'') <> '' then
    AStyle := StyleFontBlue;

  if NVL(ARecord.Values[GridTableViewDup.Index],'N') = 'Y' then
    AStyle := StyleFontRed;
end;



procedure TSystemExcelExForm.DoGoodsSelect;
var vIndex :Integer;
begin
  try
    MenuCode := Format('and a.CD_MENU in (%s) ',[LeftStr(MenuCode, Length(MenuCode)-1)]);
    OpenQuery('select CD_MENU, '
             +'       NM_MENU, '
             +'       DS_TAX, '
             +'       PR_BUY, '
             +'       PR_SALE '
             +'  from MS_MENU '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +MenuCode,
             [HeadStoreCode,
              StoreCode]);

      while not Query.Eof do
      begin
        vIndex := GridTableView.DataController.FindRecordIndexByText(0, GridTableViewMenuCode.Index, Query.FieldByName('CD_MENU').AsString, false, false, true);
        if vIndex >= 0 then
        begin
          GridTableView.DataController.Values[vIndex, GridTableViewDBMenuCode.Index] := Query.FieldByName('CD_MENU').AsString;
          GridTableView.DataController.Values[vIndex, GridTableViewMenuName.Index]    := Query.FieldByName('NM_MENU').AsString;
          GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index]       := Query.FieldByName('DS_TAX').AsString;
          GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index]    := Query.FieldByName('PR_BUY').AsCurrency;
          GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index]   := Query.FieldByName('PR_SALE').AsCurrency;
        end;
        Query.Next;
      end;
  finally
    FinishQuery;
  end;
end;

procedure TSystemExcelExForm.LineAddButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  GridTableView.DataController.BeginUpdate;
  for vIndex := 0 to Trunc(LineCountEdit.Value)-1 do
  begin
    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSeq.Index] := GridTableView.DataController.RecordCount;
  end;
  GridTableView.DataController.EndUpdate;
end;



procedure TSystemExcelExForm.mnuClassSelectClick(Sender: TObject);
begin
  inherited;
end;

procedure TSystemExcelExForm.mnuCompanySelectClick(Sender: TObject);
begin
end;

procedure TSystemExcelExForm.mnuTaxChangeClick(Sender: TObject);
var vResult :String;
    vIndex :Integer;
begin
  if not InputBox('과면세 값을 입력하세요(과세-> 1, 면세-> 0)', vResult, 1, false, true) then Exit;

  GridTableView.DataController.BeginUpdate;
  for vIndex := 0 to GridTableView.Controller.SelectedRowCount - 1 do
    GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewDsTax.Index] := Ifthen(vResult='1','과세','면세');
  GridTableView.DataController.EndUpdate;
end;

procedure TSystemExcelExForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vIndex, vCol, vIndex2, vCount :Integer;
    vSQL :String;
begin
  inherited;
  if not AskBox('메뉴를 저장하시겠습니까?') then Exit;

  for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
  begin
    vCount := 0;
    for vIndex2 := vIndex + 1 to GridTableView.DataController.RecordCount - 1 do
      if GridTableView.DataController.Values[vIndex, GridTableViewMenuCode.Index] = GridTableView.DataController.Values[vIndex2, GridTableViewMenuCode.Index] then
      begin
        GridTableView.DataController.Values[vIndex2, GridTableViewDup.Index] := 'Y';
        Inc(vCount);
      end;
  end;

  if (vCount > 0) and not AskBox('동일메뉴가 있습니다'#13'동일메뉴는 무시하고 저장하시겠습니까?') then Exit;

  try
    for vIndex := 0 to GridTableView.DataController.RecordCount - 1 do
    begin
      if NVL(GridTableView.DataController.Values[vIndex, GridTableViewMenuCode.Index],'') = '' then Continue;
      if NVL(GridTableView.DataController.Values[vIndex, GridTableViewDup.Index],'N') = 'Y' then Continue;

      if NVL(GridTableView.DataController.Values[vIndex, GridTableViewDBMenuCode.Index],'') = '' then
      begin
        ExecQuery('insert into MS_MENU(CD_HEAD, '
                 +'                    CD_STORE, '
                 +'                    CD_MENU, '
                 +'                    NM_MENU, '
                 +'                    NM_MENU_SHORT, '
                 +'                    PR_BUY, '
                 +'                    PR_SALE, '
                 +'                    DS_TAX, '
                 +'                    DS_MENU_TYPE, '
                 +'                    YN_USE, '
                 +'                    DT_INSERT, '
                 +'                    DT_CHANGE,  '
                 +'                    PRG_INSERT, '
                 +'                    PRG_CHG) '
                 +'            values(:P0, '
                 +'                   :P1, '
                 +'                   :P2, '
                 +'                   :P3, '
                 +'                   :P3, '
                 +'                   :P4, '
                 +'                   :P5, '
                 +'                   :P6, '
                 +'                   ''N'', '
                 +'                   ''Y'', '
                 +'                   NOW(), '
                 +'                   NOW(), '
                 +'                   ''EXL'', '
                 +'                   ''EXL'');',
                 [HeadStoreCode,
                  StoreCode,
                  Trim(GridTableView.DataController.Values[vIndex, GridTableViewMenuCode.Index]),
                  Replace(Replace(Replace(Trim(GridTableView.DataController.Values[vIndex, GridTableViewMenuName.Index]),#13,''),#10,''),'''',''),
                  NVL(GridTableView.DataController.Values[vIndex, GridTableViewBuyPrice.Index],0.0),       //매입단가
                  NVL(GridTableView.DataController.Values[vIndex, GridTableViewSalePrice.Index],0.0),       //매입단가
                  IfThen(NVL(GridTableView.DataController.Values[vIndex, GridTableViewDsTax.Index],'면세') <> '면세', '1', '0')],false);
      end
      else
      begin
        vSQL := '';
        for vCol := 1 to GridTableView.ColumnCount-1 do
        begin
          case vCol of
            //상품이름
            2 : if NVL(GridTableView.DataController.Values[vIndex, vCol],'') <> '' then
                begin
                  vSQL := vSQL + Format('%s = ''%s'', ',[GridTableView.Columns[vCol].DataBinding.FieldName, Replace(Replace(Trim(GridTableView.DataController.Values[vIndex, vCol]),#13,''),#10,'')]);
                  vSQL := vSQL + Format('%s = ''%s'', ',['NM_MENU_SHORT', Replace(Replace(Trim(GridTableView.DataController.Values[vIndex, vCol]),#13,''),#10,'')]);
                end;
            //과면세
            3 : if NVL(GridTableView.DataController.Values[vIndex, vCol],'') <> '' then
                  vSQL := vSQL + Format('%s = ''%s'',',[GridTableView.Columns[vCol].DataBinding.FieldName, Ifthen(NVL(GridTableView.DataController.Values[vIndex, vCol],'')='과세','1','0')]);
            //매입단가
            4 : if GridTableView.DataController.Values[vIndex, vCol] <> null then
                  vSQL := vSQL + Format('%s = %f,',[GridTableView.Columns[vCol].DataBinding.FieldName, NVL(GridTableView.DataController.Values[vIndex, vCol],0.0)]);
            //판매단가
            5 : if GridTableView.DataController.Values[vIndex, vCol] <> null then
                  vSQL := vSQL + Format('%s = %f,',[GridTableView.Columns[vCol].DataBinding.FieldName, NVL(GridTableView.DataController.Values[vIndex, vCol],0.0)]);
          end;
        end;
        vSQL := vSQL + ' CD_SAWON_CHG = :P3, PRG_CHG = ''EXL'', DT_CHANGE = NOW() '
                     +'  where CD_HEAD = :P0 '
                     +'    and CD_STORE =:P1 '
                     +'    and CD_GOODS =:P2;';

        ExecQuery('update MS_MENU '
                 +'   set '+vSQL,
                 [HeadStoreCode,
                  StoreCode,
                  GridTableView.DataController.Values[vIndex, 1],
                  UserCode],false);
      end;
    end;
    ExecQuery(TempSQL,[],true);
    MsgBox('저장이 완료되었습니다');
    GridTableView.DataController.RecordCount := 0;
    GridTableView.DataController.AppendRecord;
    GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewSeq.Index] := GridTableView.DataController.RecordCount;
    ButtonToolBarSaveButton.Enabled := false;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;

end;

end.
