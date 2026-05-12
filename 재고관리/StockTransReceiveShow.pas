// 재고 수관 조회/확정

unit StockTransReceiveShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels, StrUtils,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSCore, dxPScxCommon, Menus, ImgList, AdvToolBar,
  AdvToolBarStylers, ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls,
  cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvOfficeTabSet, cxCurrencyEdit, cxMemo, dxPSPrVwRibbon,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TStockTransReceiveShowForm = class(TInheritShowForm)
    ConditionTabSet: TAdvOfficeTabSet;
    GridDetailLevel: TcxGridLevel;
    GridDetailTableView: TcxGridTableView;
    ConditionToolBarStoreLabel: TcxLabel;
    ConditionToolBarStoreComboBox: TcxComboBox;
    GridTableViewSendStoreCode: TcxGridColumn;
    GridTableViewSendStoreName: TcxGridColumn;
    GridTableViewTransDate: TcxGridColumn;
    GridTableViewTransNo: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewStatusName: TcxGridColumn;
    GridTableViewTransAmt: TcxGridColumn;
    GridTableViewReceiveEmpNo: TcxGridColumn;
    GridTableViewReceiveEmpName: TcxGridColumn;
    GridTableViewReceiveDateTime: TcxGridColumn;
    GridTableViewReceiveRemark: TcxGridColumn;
    GridTableViewSendEmpNo: TcxGridColumn;
    GridTableViewSendEmpName: TcxGridColumn;
    GridTableViewSendDateTime: TcxGridColumn;
    GridTableViewSendRemark: TcxGridColumn;
    GridDetailTableViewGoodsCode: TcxGridColumn;
    GridDetailTableViewGoodsName: TcxGridColumn;
    GridDetailTableViewGoodsSpec: TcxGridColumn;
    GridDetailTableViewBuyPrice: TcxGridColumn;
    GridDetailTableViewTransQty: TcxGridColumn;
    GridDetailTableViewTransAmt: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ReceivePanel: TPanel;
    ReceiveEmpLabel: TLabel;
    ReceiveCommentLabel: TLabel;
    ReceiveOKButton: TAdvGlowButton;
    ReceiveCancelButton: TAdvGlowButton;
    ReceiveEmpComboBox: TcxComboBox;
    ReceiveCommentMemo: TcxMemo;
    ReceivePasswordLabel: TLabel;
    ReceivePasswordEdit: TcxTextEdit;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    GridDetailTableViewDemandQty: TcxGridColumn;
    GridDetailTableViewTransNetAmt: TcxGridColumn;
    GridDetailTableViewTransDutyFreeAmt: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure ConditionTabSetChange(Sender: TObject);
    procedure GridDetailTableViewCustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ReceivePanelExit(Sender: TObject);
    procedure ReceiveCancelButtonClick(Sender: TObject);
    procedure ReceiveOKButtonClick(Sender: TObject);
    procedure ReceiveEmpComboBoxPropertiesChange(Sender: TObject);

  private
    CurrentTransInfo: string;

    function DoSearchDetail: Boolean;

  protected
    function DoSearch: Boolean; override;
  end;

var
  StockTransReceiveShowForm: TStockTransReceiveShowForm;



implementation

uses
  Common, DBModule, StockTransSend;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockTransReceiveShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;

  // 이관 매장 목록을 불러온다
  New(vCode);
  vCode^.Data := EmptyStr;
  ConditionToolBarStoreComboBox.Properties.Items.AddObject('[모든 매장]', TObject(vCode));
  OpenQuery('select   CD_STORE, '
           +'         NM_STORE '
           +'from     MS_STORE '
           +'where    CD_STORE not in (''0000'', :P0) '
           +'  and    DS_STATUS = ''0'' '
           +'order by CD_STORE',
            [StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarStoreComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ConditionToolBarStoreComboBox.ItemIndex := 0;

  // 조회조건을 지정한다
  New(vCode);
  vCode^.Data := Format('''%s'',''%s'',''%s''', [TransSend, TransRefuse, TransReceive]);
  ConditionToolBarComboBox.Properties.Items.AddObject('[모든 전표]', TObject(vCode));
  New(vCode);
  vCode^.Data := Format('''%s''', [TransSend]);
  ConditionToolBarComboBox.Properties.Items.AddObject('수관 요청 중', TObject(vCode));
  New(vCode);
  vCode^.Data := Format('''%s''', [TransReceive]);
  ConditionToolBarComboBox.Properties.Items.AddObject(TransReceiveName, TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;

  // 기본값을 지정한다
  DefaultDate := ddLastWeek;
  PrintMode   := pmPreviewExcel;

  // 사원 목록을 불러온다
  OpenQuery('select   CD_SAWON, '
           +'         NM_SAWON, '
           +'         EMP_WORK '
           +'from     MS_SAWON '
           +'where    CD_STORE = :P0 '
           +'  and    CD_SAWON <> ''master'' '
           +'  and    YN_USE   = ''Y'' '
           +'order by CD_SAWON',
            [StoreCode]);
  try
    while not Query.Eof do
    begin
      if (Length(Query.Fields[2].AsString) >= 10) and
         (CharInSet(Query.Fields[2].AsString[10], ['1','3','5','7'])) and       // 후방 권한이 있고
         (Query.Fields[2].AsString[2] = '1') then                               // 매입/발주 권한이 있을 때
      begin
        New(vCode);
        vCode^.Data := Query.Fields[0].AsString;
        ReceiveEmpComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
  ReceiveEmpComboBox.ItemIndex := -1;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TStockTransReceiveShowForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F4 : ButtonToolBarDeleteButton.Click;
    VK_F5 : ButtonToolBarSaveButton.Click;
  end;

  inherited;
end;
//------------------------------------------------------------------------------
// 폼 크기를 변경할 때
procedure TStockTransReceiveShowForm.FormResize(Sender: TObject);
begin
  inherited;

  // 시간 패널 위치를 수정한다
  ReceivePanel.Top  := (Grid.Height - ReceivePanel.Height) div 2 + Grid.Top;
  ReceivePanel.Left := (Grid.Width  - ReceivePanel.Width ) div 2 + Grid.Left;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 수관확정 버튼
procedure TStockTransReceiveShowForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var
  vSendStoreCode, vTransDate, vTransNo: string;
  vIndex: Integer;
begin
  if not (Sender is TAdvGlowButton) or
     not (Sender as TAdvGlowButton).Visible or
     not (Sender as TAdvGlowButton).Enabled then
    Exit;

  inherited;

  if (GridTableView.DataController.RecordCount = 0) or
     (GridTableView.DataController.GetFocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index] = EmptyStr) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDate.Index]     = EmptyStr) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNo.Index]       = EmptyStr) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index]        = TransReceive) then
  begin
    ErrBox(Format('%s할 전표를 선택하지 않았습니다.', [IfThen(Sender = ButtonToolBarDeleteButton, TransRefuseName, TransReceiveName)]));
    ConditionTabSet.ActiveTabIndex := 0;
    Exit;
  end;

  vSendStoreCode := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index];
  vTransDate     := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDate.Index]);
  vTransNo       := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNo.Index];

  // 수관 확정/거절이 가능한지 조회한다
  OpenQuery('select   DS_STATUS '
           +'from     SL_TRANS_H '
           +'where    CD_STORE  = :P0 '
           +'  and    YMD_TRANS = :P1 '
           +'  and    NO_TRANS  = :P2',
            [vSendStoreCode,
             vTransDate,
             vTransNo]);
  try
    if Query.Fields[0].AsString = TransReceive then
    begin
      ErrBox(Format('이미 %s한 전표입니다.', [TransReceiveName]));
      FinishQuery;
      Exit;
    end
    else if Query.Fields[0].AsString = TransCancel then
    begin
      ErrBox(Format('이관 매장에서 %s한 전표입니다.', [TransCancelName]));
      FinishQuery;
      Exit;
    end
    else if Query.Fields[0].AsString = TransRefuse then
    begin
      if Sender = ButtonToolBarDeleteButton then
      begin
        ErrBox(Format('이미 %s한 전표입니다.', [TransRefuseName]));
        FinishQuery;
        Exit;
      end
      else if not AskBox(Format('%s을 했는데 이관 매장에서 내용을 수정하지 않았습니다.'#13'%s하시겠습니까?', [TransRefuseName, TransReceiveName])) then
      begin
        FinishQuery;
        Exit;
      end;
    end;
  finally
    FinishQuery;
  end;

  // 수관 확인 패널을 보여준다
  ReceivePanel.Visible := true;
  ReceiveCommentMemo.Clear;
  // 수관인지 거절인지 지정한다
  if Sender = ButtonToolBarDeleteButton then
  begin
    ReceivePanel.Tag            := 1;
    ReceiveEmpLabel.Caption     := '거절사원';
    ReceiveCommentLabel.Caption := '거절사유';
    ReceivePanel.Color          := $0088AEFF;
  end
  else
  begin
    ReceivePanel.Tag            := 0;
    ReceiveEmpLabel.Caption     := '수관사원';
    ReceiveCommentLabel.Caption := '비　　고';
    ReceivePanel.Color          := self.Color;
  end;
  // 수관사원을 로그인한 사원으로 일단 지정한다
  ReceiveEmpComboBox.ItemIndex := -1;
  for vIndex := 0 to ReceiveEmpComboBox.Properties.Items.Count-1 do
    if PStrPointer(ReceiveEmpComboBox.Properties.Items.Objects[vIndex])^.Data = UserCode then
    begin
      ReceiveEmpComboBox.ItemIndex := vIndex;
      Break;
    end;
  ReceiveEmpComboBox.SetFocus;
end;

//==============================================================================
// 그리드
//------------------------------------------------------------------------------
// 목록 그리드를 더블클릭할 때
procedure TStockTransReceiveShowForm.GridTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  // 상세 목록을 보여줄 수 있게 탭을 변경한다
  if (GridTableView.DataController.RecordCount > 0) and
     (GridTableView.DataController.GetFocusedRecordIndex >= 0) and
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNo.Index] <> EmptyStr) then
    ConditionTabSet.ActiveTabIndex := 1;
end;
//------------------------------------------------------------------------------
// 상세 그리드를 그릴 때
procedure TStockTransReceiveShowForm.GridDetailTableViewCustomDrawPartBackground(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;

  // 위쪽 GroupByBox에 현재 전표 정보를 보여준다
  if AViewInfo is TcxGridGroupByBoxViewInfo then
  begin
    AViewInfo.Text        := CurrentTransInfo;
    ACanvas.FillRect(AViewInfo.Bounds, AViewInfo.Params.Color);
    ACanvas.Font.Style    := ACanvas.Font.Style + [fsBold];
    AViewInfo.Params.Font := ACanvas.Font;
    ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.TextBounds,0, True);
    ADone                 := True;
  end;
end;
//------------------------------------------------------------------------------
// 그리드 상단 탭을 바꿀 때
procedure TStockTransReceiveShowForm.ConditionTabSetChange(Sender: TObject);
begin
  inherited;

  if not isLoading then
    if ConditionTabSet.ActiveTabIndex = 0 then
      Grid.ActiveLevel := GridLevel
    else if ConditionTabSet.ActiveTabIndex = 1 then
    begin
      // 상세 조회
      if DoSearchDetail then
      begin
        // 상세 조회를 잘 했으면 수관확정/거절 버튼을 활성화한다
        ButtonToolBarSaveButton.Enabled   := (GridTableView.DataController.GetFocusedRecordIndex >= 0) and
                                             (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index] <> TransReceive);
        ButtonToolBarDeleteButton.Enabled := ButtonToolBarSaveButton.Enabled;
      end;
    end;
end;

//==============================================================================
// 수관확정 확인 패널
//------------------------------------------------------------------------------
// 입력창에서 포커스가 나갈 때
procedure TStockTransReceiveShowForm.ReceivePanelExit(Sender: TObject);
begin
  inherited;

  ReceivePanel.Visible := (GetActiveControl = ReceiveEmpComboBox) or
                          (GetActiveControl = ReceivePasswordEdit) or
                          (GetActiveControl = ReceiveCommentMemo) or
                          (GetActiveControl = ReceiveOKButton);
end;
//------------------------------------------------------------------------------
// 수관사원을 수정할 때
procedure TStockTransReceiveShowForm.ReceiveEmpComboBoxPropertiesChange(Sender: TObject);
begin
  inherited;

  if ReceiveEmpComboBox.ItemIndex >= 0 then
  begin
    ReceivePasswordEdit.Visible  := PStrPointer(ReceiveEmpComboBox.Properties.Items.Objects[ReceiveEmpComboBox.ItemIndex])^.Data <> UserCode;
    ReceivePasswordLabel.Visible := ReceivePasswordEdit.Visible;
    if ReceivePasswordEdit.Visible then
      ReceivePasswordEdit.SetFocus
    else
      ReceiveCommentMemo.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
// 수관 확정 버튼
procedure TStockTransReceiveShowForm.ReceiveOKButtonClick(Sender: TObject);
var
  vSendStoreCode, vTransDate, vTransNo, vReceiveEmpNo: string;
begin
  inherited;

  // 사원 선택했는지 확인
  if ReceiveEmpComboBox.ItemIndex < 0 then
  begin
    ErrBox(ReceiveEmpLabel.Caption+msgMustInput);
    ReceiveEmpComboBox.SetFocus;
    Exit;
  end;

  vSendStoreCode := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index];
  vTransDate     := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDate.Index]);
  vTransNo       := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNo.Index];
  vReceiveEmpNo  := PStrPointer(ReceiveEmpComboBox.Properties.Items.Objects[ReceiveEmpComboBox.ItemIndex])^.Data;

  // 비밀번호 확인
  if ReceivePasswordEdit.Visible then
  begin
    OpenQuery('select   NO_PASSWORD '
             +'from     MS_SAWON '
             +'where    CD_STORE = :P0 '
             +'  and    CD_SAWON = :P1 '
             +'  and    YN_USE   = ''Y''',
              [StoreCode,
               vReceiveEmpNo]);
    try
      if Decrypt(Query.Fields[0].AsString, _CryptKey) <> ReceivePasswordEdit.Text then
      begin
        ErrBox(ReceivePasswordLabel.Caption+msgMustInput);
        ReceivePasswordEdit.SetFocus;
        Exit;
      end;
    finally
      FinishQuery;
    end;
  end;

  // 수관 확정/거절
  BeginTrans;
  try
    ExecQuery('update  SL_TRANS_H '
             +'set     DS_STATUS      = :P3, '
             +Format(' CD_SAWON_%s    = :P4, ',       [IfThen(ReceivePanel.Tag = 1, 'REFUSE', 'RECEIVE')])
             +Format(' NO_DEVICE_%s   = :P5, ',       [IfThen(ReceivePanel.Tag = 1, 'REFUSE', 'RECEIVE')])
             +Format(' DT_%s          = GetDate(), ', [IfThen(ReceivePanel.Tag = 1, 'REFUSE', 'RECEIVE')])
             +'        REMARK_RECEIVE = :P6 '
             +'where   CD_STORE       = :P0 '
             +'  and   YMD_TRANS      = :P1 '
             +'  and   NO_TRANS       = :P2',
              [vSendStoreCode,
               vTransDate,
               vTransNo,
               IfThen(ReceivePanel.Tag = 1, TransRefuse, TransReceive),
               vReceiveEmpNo,
               '00',
               ReceiveCommentMemo.Lines.Text],
               false);
    ExecQuery('update SL_TRANS_D '
             +'set    DS_STATUS = :P3 '
             +'where  CD_STORE  = :P0 '
             +'  and  YMD_TRANS = :P1 '
             +'  and  NO_TRANS  = :P2',
              [vSendStoreCode,
               vTransDate,
               vTransNo,
               IfThen(ReceivePanel.Tag = 1, TransRefuse, TransReceive)],
               false);

    // 내가 받은 확인용 메시지를 지운다
    ExecQuery('delete from MS_CODE '
             +'where  CD_STORE = :P0 '
             +'  and  CD_KIND  = ''61'' '
             +'  and  CD_CODE  = ''001''',
              [StoreCode],
               false);

    CommitTrans;

    // 수관 거절 시
    if ReceivePanel.Tag = 1 then
    begin
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index]          := TransRefuse;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatusName.Index]      := TransRefuseName;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewReceiveRemark.Index]   := ReceiveCommentMemo.Lines.Text;
    end
    // 수관 확정 시
    else
    begin
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index]          := TransReceive;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatusName.Index]      := TransReceiveName;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewReceiveEmpNo.Index]    := vReceiveEmpNo;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewReceiveEmpName.Index]  := ReceiveEmpComboBox.Text;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewReceiveDateTime.Index] := Now;
      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewReceiveRemark.Index]   := ReceiveCommentMemo.Lines.Text;
    end;
    ReceivePanel.Visible            := false;
    ButtonToolBarSaveButton.Enabled := false;

    MsgBox(Format('%s일 %s번 전표를'#13'''%s''했습니다.', [String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDate.Index]), vTransNo, IfThen(ReceivePanel.Tag = 1, TransRefuseName, TransReceiveName)]));
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;
end;
//------------------------------------------------------------------------------
// 수관 확정 취소 버튼
procedure TStockTransReceiveShowForm.ReceiveCancelButtonClick(Sender: TObject);
begin
  inherited;

  ReceiveEmpComboBox.ItemIndex := -1;
  ReceivePasswordEdit.Clear;
  ReceiveCommentMemo.Clear;
  ReceivePanel.Visible := false;
  Grid.SetFocus;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockTransReceiveShowForm.DoSearch: Boolean;
begin
  isLoading := true;
  try
    ConditionTabSet.ActiveTabIndex := 0;
    Grid.ActiveLevel               := GridLevel;

    OpenQuery('select   t.CD_STORE as CD_STORE_SEND, '
             +'         s.NM_STORE as NM_STORE_SEND, '
             +'         dbo.StoDW(t.YMD_TRANS) as YMD_TRANS, '
             +'         t.NO_TRANS, '
             +'         t.DS_STATUS, '
             +'         case t.DS_STATUS when '''+TransReceive+''' then '''+TransReceiveName+''' when '''+TransRefuse+''' then '''+TransRefuseName+''' when '''+TransSend+''' then '''+TransSendName+''' else ''이관 요청 중'' end as NM_STATUS, '
             +'         t.AMT_TRANS, '
             +'         t.CD_SAWON_RECEIVE, '
             +'         s2.NM_SAWON as NM_SAWON_RECEIVE, '
             +'         t.DT_RECEIVE, '
             +'         t.REMARK_RECEIVE, '
             +'         t.CD_SAWON_SEND, '
             +'         s1.NM_SAWON as NM_SAWON_SEND, '
             +'         t.DT_SEND, '
             +'         t.REMARK '
             +'from     SL_TRANS_H as t  (nolock) inner join '
             +'         MS_STORE   as s  (nolock) on t.CD_STORE = s.CD_STORE inner join '
             +'         MS_SAWON   as s1 (nolock) on t.CD_STORE = s1.CD_STORE and t.CD_SAWON_SEND = s1.CD_SAWON left outer join '
             +'         MS_SAWON   as s2 (nolock) on t.CD_STORE_RECEIVE = s2.CD_STORE and t.CD_SAWON_RECEIVE = s2.CD_SAWON '
             +'where    t.CD_STORE_RECEIVE = :P0 '
             +'  and    t.YMD_TRANS between :P1 and :P2 '
             +'  and    (:P3 = '''' or t.CD_STORE  = :P3) '
             +'  and    t.NO_SEND_LINK is null '
             +Format(' and t.DS_STATUS in (%s) ', [PStrPointer(ConditionToolBarComboBox.Properties.Items.Objects[ConditionToolBarComboBox.ItemIndex])^.Data])
             +'order by t.CD_STORE, t.YMD_TRANS, t.NO_TRANS',
             [StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              PStrPointer(ConditionToolBarStoreComboBox.Properties.Items.Objects[ConditionToolBarStoreComboBox.ItemIndex])^.Data]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    isLoading := false;
  end;
end;
//------------------------------------------------------------------------------
// 상세 조회
function TStockTransReceiveShowForm.DoSearchDetail: Boolean;
begin
  Result := false;

  if (GridTableView.DataController.RecordCount = 0) or
     (GridTableView.DataController.GetFocusedRecordIndex < 0) or
     (GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNo.Index] = EmptyStr) then
  begin
    ErrBox('수관 전표를 선택하지 않았습니다.');
    ConditionTabSet.ActiveTabIndex := 0;
    Exit;
  end;

  isLoading := true;
  try
    CurrentTransInfo := Format('이관일자 : %s,  이관번호 : %s', [String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDate.Index]), String(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNo.Index])]);

    ConditionTabSet.ActiveTabIndex := 1;
    Grid.ActiveLevel               := GridDetailLevel;

    OpenQuery('select   t.CD_GOODS, '
             +'         g.NM_GOODS, '
             +'         g.NM_SPEC, '
             +'         t.PR_BUY, '
             +'         t.QTY_DEMAND, '
             +'         t.QTY_TRANS, '
             +'         t.AMT_TRANS, '
             +'         case when g.DS_TAX = ''1'' then t.AMT_TRANS else 0 end AMT_NET, '
             +'         case when g.DS_TAX = ''0'' then t.AMT_TRANS else 0 end AMT_DUTYFREE '
             +'from     SL_TRANS_D as t (nolock) inner join '
             +'         MS_GOODS   as g (nolock) on t.CD_STORE = g.CD_STORE and t.CD_GOODS = g.CD_GOODS '
             +'where    t.CD_STORE  = :P0 '
             +'  and    t.YMD_TRANS = :P1 '
             +'  and    t.NO_TRANS  = :P2 '
             +'order by t.SEQ',
             [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSendStoreCode.Index],
              GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransDate.Index]),
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewTransNo.Index]]);
    Result := DM.ReadQuery(Query, GridDetailTableView);
  finally
    isLoading := false;
  end;
end;

end.
