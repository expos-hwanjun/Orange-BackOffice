// 데이터베이스 백업 (F)

unit SystemDBBackup;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, Menus, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxControls, cxTextEdit, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, AdvOfficePager, cxLookAndFeelPainters, cxGroupBox, StdCtrls,
  cxRadioGroup, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, Math,
  cxCheckBox, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, StrUtils,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, ExtCtrls,
  AdvToolBarStylers, cxLookAndFeels, DBAccess, DAScript, UniScript, AdvPanel,
  cxSpinEdit, cxCheckGroup, ShellAPi, Registry, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  Vcl.ComCtrls, cxMemo, cxRichEdit, dxCore, cxDateUtils, cxNavigator, IdHTTP,
  dxmdaset;

type
  TSystemDBBackupForm = class(TInheritEditForm)
    Pager: TAdvOfficePager;
    BackupPager: TAdvOfficePage;
    DeletePager: TAdvOfficePage;
    PagerBackupBackupGroupBox: TcxGroupBox;
    PagerBackupRestoreGroupBox: TcxGroupBox;
    PagerBackupShrinkGroupBox: TcxGroupBox;
    PagerBackupRestoreLabel: TLabel;
    PagerBackupShrinkLabel: TLabel;
    PagerBackupBackupButton: TButton;
    PagerBackupRestoreButton: TButton;
    PagerBackupShrinkButton: TButton;
    PagerBackupBackupFileEdit: TcxTextEdit;
    PagerBackupBackupFileLabel: TLabel;
    PagerTableDeleteRadioGroup: TcxRadioGroup;
    OpenDialog: TOpenDialog;
    PagerBackupBackupFolderLabel: TLabel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    ASPBackupRestoreButton: TButton;
    Label2: TLabel;
    BackupCheckBox: TcxCheckBox;
    BuyCheckBox: TcxCheckBox;
    PointCheckBox: TcxCheckBox;
    Script: TUniScript;
    Label11: TLabel;
    ReceiptDeletePager: TAdvOfficePage;
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    GridTableViewDeleteYN: TcxGridColumn;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewPosNo: TcxGridColumn;
    GridTableViewRcpNo: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewCashRcpAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewTrustAmt: TcxGridColumn;
    GridTableViewTarget: TcxGridColumn;
    GridTableViewPayType: TcxGridColumn;
    GridTableViewGiftAmt: TcxGridColumn;
    GridTableViewOkcAmt: TcxGridColumn;
    GridTableViewPointAmt: TcxGridColumn;
    GridTableViewBankAmt: TcxGridColumn;
    GridTableViewCloseNo: TcxGridColumn;
    cxGroupBox3: TcxGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    IndexRebuildButton: TButton;
    cxGroupBox4: TcxGroupBox;
    TableOrderDeleteButton: TButton;
    DeliveryOrderDeleteButton: TButton;
    RestoreCheckGroup: TcxCheckGroup;
    BcpDownLoadButton: TButton;
    Label14: TLabel;
    BackupDateEdit: TcxDateEdit;
    IdFTP: TIdFTP;
    BcpRestoreButton: TButton;
    BcpMemo: TcxMemo;
    StoredProc: TUniStoredProc;
    procedure PagerBackupBackupButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PagerBackupShrinkButtonClick(Sender: TObject);
    procedure PagerBackupRestoreButtonClick(Sender: TObject);
    procedure PagerChange(Sender: TObject);
    procedure PagerTableDeleteRadioGroupPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PagerPosDeleteGridViewDeleteRatePropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PagerMoveBackUpButtonClick(Sender: TObject);
    procedure ScriptError(Sender: TObject; E: Exception; SQL: string;
      var Action: TErrorAction);
    procedure GridTableViewDeleteYNHeaderClick(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDeleteYNPropertiesEditValueChanged(Sender: TObject);
    procedure GridTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure IndexRebuildButtonClick(Sender: TObject);
    procedure TableOrderDeleteButtonClick(Sender: TObject);
    procedure DeliveryOrderDeleteButtonClick(Sender: TObject);
    procedure BcpDownLoadButtonClick(Sender: TObject);

  private
    ErrMsg       :String;
    isError      :Boolean;
    ScriptIndex: Integer;
    BackupFolder :String;
    ClickCount   :Integer;
    SQLVersion   :String;
    procedure ButtonEnable;
    function  GetBCPPath: string;
  protected
    function DoSearch: Boolean; override; // 조회
    function DoDelete: Boolean; override; // 삭제
  end;

var
  SystemDBBackupForm: TSystemDBBackupForm;



implementation

uses
  Common, DBModule, Service, ProxyCheck;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TSystemDBBackupForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/시스템관리/데이터베이스%20관리/데이터베이스%20관리.htm';
  DefaultDate           := ddLastMonth;
  Pager.ActivePageIndex := 0;
  isError               := false;
  ClickCount            := 0;
  BackupDateEdit.Date   := now;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TSystemDBBackupForm.FormShow(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  // 백업 파일과 폴더를 지정한다
  if BackupFolder = EmptyStr then
    try
      // 서버에서 DB가 설치된 폴더를 알아낸다
      DM.OpenQuery('select   filename '
                  +'from     sysfiles '
                  +'where    fileid = 1',
                   []);
      BackupFolder := ExtractFileDir(DM.Query.Fields[0].AsString);
      if (BackupFolder <> EmptyStr) and (BackupFolder[Length(BackupFolder)] <> '\') then
        BackupFolder := BackupFolder + '\';
    finally
      DM.FinishQuery;
    end;

  if BackupFolder = EmptyStr then
    BackupFolder := Folder;
  // 원격 서버 자료를 백업할 때를 대비해 Backup 폴더는 안만들고 DB폴더에 그냥 백업한다
  PagerBackupBackupFolderLabel.Caption := '※ 백업 폴더는 '+BackupFolder+'입니다.';
  PagerBackupBackupFileEdit.Text := FormatDateTime(fmtDateShort, Date)+'.bak';

  for vIndex := 0 to RestoreCheckGroup.Properties.Items.Count-1 do
    RestoreCheckGroup.States[vIndex] := cbsChecked;

  Pager.ActivePageIndex      := 0;
end;

procedure TSystemDBBackupForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
var
  vTotalAmt : Currency;
  vIndex, vCount: Integer;
begin
  inherited;
  vTotalAmt := 0;
  for vIndex := 0 to ADataController.FilteredRecordCount-1 do
    if ADataController.Values[ADataController.FilteredRecordIndex[vIndex], 0] then
      vTotalAmt := vTotalAmt + ADataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index];

  ConditionToolBarEdit.Text :=Format('%s(%s)',[FormatFloat(',0', vTotalAmt), FormatFloat(',0.00%',RoundNumber((vTotalAmt / NVL(ADataController.Summary.FooterSummaryValues[0],1))*100, 0.01))]) ;
end;

procedure TSystemDBBackupForm.GridTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var
  vIndex, vCount: Integer;
begin
  inherited;
  vCount    := 0;
  for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
    if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], 0] then
      Inc(vCount);
  GridTableView.DataController.Summary.FooterSummaryValues[9] := String(Format('%d/%d',[vCount, GridTableView.DataController.FilteredRecordCount]));
end;

procedure TSystemDBBackupForm.GridTableViewDeleteYNHeaderClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  GridTableView.DataController.BeginFullUpdate;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableViewDeleteYN.Tag = 0 then
      GridTableView.DataController.Values[vIndex, GridTableViewDeleteYN.Index] := True
    else
      GridTableView.DataController.Values[vIndex, GridTableViewDeleteYN.Index] := False;
  end;
  GridTableView.DataController.EndFullUpdate;
  GridTableView.DataController.Post;
  GridTableViewDataControllerAfterPost(GridTableView.DataController);
  GridTableViewDeleteYN.Tag := Ifthen(GridTableViewDeleteYN.Tag=0,1,0);
end;

procedure TSystemDBBackupForm.GridTableViewDeleteYNPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  GridTableView.DataController.Post;
end;

procedure TSystemDBBackupForm.IndexRebuildButtonClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crSQLWait;
    DM.Script.SQL.Text := 'IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[SL_SALE_D]'') AND name = N''PK_SL_SALE_D'') '
                         +' ALTER INDEX [PK_SL_SALE_D] ON [dbo].[SL_SALE_D] REBUILD';
    DM.Script.Execute;

    DM.Script.SQL.Text := 'IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[SL_SALE_D_SUM]'') AND name = N''PK_SL_SALE_D_SUM'') '
                         +' ALTER INDEX [PK_SL_SALE_D_SUM] ON [dbo].[SL_SALE_D_SUM] REBUILD';
    DM.Script.Execute;

    DM.Script.SQL.Text := 'IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[SL_SALE_H]'') AND name = N''PK_SL_SALE_H'') '
                         +' ALTER INDEX [PK_SL_SALE_H] ON [dbo].[SL_SALE_H] REBUILD';
    DM.Script.Execute;

    DM.Script.SQL.Text := 'IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[SL_DELIVERY]'') AND name = N''PK_SL_DELIVERY'') '
                         +' ALTER INDEX [PK_SL_DELIVERY] ON [dbo].[SL_DELIVERY] REBUILD';
    DM.Script.Execute;

    DM.Script.SQL.Text := 'IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].[SL_STOCK_MONTH]'') AND name = N''PK_SL_STOCK_MONTH'') '
                         +' ALTER INDEX [PK_SL_STOCK_MONTH] ON [dbo].[SL_STOCK_MONTH] REBUILD';
    DM.Script.Execute;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
      Exit;
    end;
  end;
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TSystemDBBackupForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vPassword: string;
  vTemp,
  vJuminNo,
  vJuminName : string;
begin
  inherited;

  // 히든 탭 등을 보여준다
  if Shift = [ssCtrl] then
    if (Key = Ord('I')) and (PasswordBox('암호를 입력하십시오.', vPassword)) and (vPassword = 'dbinit') and (PagerTableDeleteRadioGroup.Properties.Items.Count = 2) then
    begin
      PagerTableDeleteRadioGroup.Properties.Items.Add;
      PagerTableDeleteRadioGroup.Properties.Items[2].Caption := ' DB 초기화';
      Pager.ActivePageIndex := 1;
    end;

  if (Shift = [ssCtrl,ssAlt]) and (Key = Ord('D')) then
  begin
    if ClickCount = 3 then
    begin
      ClickCount := 0;
      //ASP 사용매장
//      if (GetOption(244) ='0') then Exit;
      vTemp      := Replace(GetCertInfo('Q'+#28+CustomerNo+#28),#3,'');
      vJuminNo   := CopyPos(vTemp,#28,0);
      vJuminName := CopyPos(vTemp,#28,1);

      if vJuminNo = EmptyStr then Exit;

      with TProxyCheckForm.Create(self) do
        try
          if ShowModal <> mrOK then
            Exit;
        finally
          Free;
        end;

      if (PasswordBox(vJuminName+'님의 주민번호를 입력하세요', vPassword)) and (vPassword = vJuminNo) then
      begin
        ReceiptDeletePager.TabVisible := true;
        Pager.ActivePageIndex := 3;
      end;
    end
    else ClickCount := ClickCount + 1;
  end;
end;

//==============================================================================
// 탭 페이지
//------------------------------------------------------------------------------
// 페이지를 바꿀 때
procedure TSystemDBBackupForm.PagerChange(Sender: TObject);
begin
  inherited;
  ConditionToolBarEditLabel.Visible := false;
  ConditionToolBarEdit.Visible      := false;
  case Pager.ActivePageIndex of
    0 : // 백업
        begin
          ButtonToolBarSearchButton.Enabled := false;
          ButtonToolBarDeleteButton.Enabled := false;
        end;
    1 : // 테이블별 삭제
        begin
          ButtonToolBarSearchButton.Enabled := false;
          ButtonToolBarDeleteButton.Enabled := true;
        end;
    3 : // 건별 삭제
        begin
          ButtonToolBarSearchButton.Enabled := true;
          ButtonToolBarDeleteButton.Enabled := true;
          ConditionToolBarEditLabel.Visible := true;
          ConditionToolBarEdit.Visible      := true;
        end;
  end;
end;

procedure TSystemDBBackupForm.PagerMoveBackUpButtonClick(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 백업 탭
//------------------------------------------------------------------------------
// DB 백업 버튼
procedure TSystemDBBackupForm.PagerBackupBackupButtonClick(Sender: TObject);
var
  vBackupFile: string;
begin
  inherited;

  if Trim(PagerBackupBackupFileEdit.Text) = EmptyStr then
    ErrBox(PagerBackupBackupFileLabel.Caption+msgMustInput)
  else
  begin
    // 기존 백업 파일이 있으면 지운다
    vBackupFile := BackupFolder + PagerBackupBackupFileEdit.Text;
//    if FileExists(vBackupFile) then
//      DeleteFile(vBackupFile);

    DM.ConnectDB;
    try
      // 스크립트를 실행한다
      DM.Script.SQL.Text := 'use [master]';
      DM.Script.Execute;
      case ProgramName of
        pnOrange    : DM.Script.SQL.Text := 'backup database [' + DM.Connection.Database + '] to disk = '''+vBackupFile+''' with format, init, name = N''Orange    -전체 데이터베이스 백업'', skip, NoRewind, NoUnload, stats = 10';
      end;
      DM.Script.Execute;
      DM.Script.SQL.Text := Format('use [%s]', [DM.Connection.Database]);;
      DM.Script.Execute;
      MsgBox('DB 백업을 완료했습니다.');
    except
      on E: Exception do
      begin
        ErrBox('DB 백업을 하지 못했습니다.'#13+E.Message);
        Exit;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
// DB 복원 버튼
procedure TSystemDBBackupForm.PagerBackupRestoreButtonClick(Sender: TObject);
var
  vRestoreFile: string;
  vBackupFile : string;
begin
  inherited;

  MsgBox('모든 프로그램(POS, 관리 프로그램 및 데몬)을 종료해야 합니다.'#13'다른 POS의 프로그램도 모두 종료해야 합니다.');

  OpenDialog.Filter := '백업 파일|*.bak';
  if not OpenDialog.Execute then
    Exit;
  vRestoreFile := OpenDialog.FileName;

  if not AskBox('DB 복원을 하면 현재 데이터가 모두 삭제됩니다.'#13'정말 DB 복원을 하시겠습니까?') then
    Exit;

  DM.ConnectDB;
  try
    // 기존 자료를 일단 백업한다
    vBackupFile := BackupFolder + DM.Connection.Database + FormatDateTime(fmtDateShort, Date)+'(BeforeRestore).bak';
    DM.Script.SQL.Text := 'use [master]';
    DM.Script.Execute;
    DM.Script.SQL.Text := Format('backup database [%s] to disk = N''%s'' with NoFormat, init, name = N''%s-전체 데이터베이스 백업'', skip, NoRewind, NoUnload, stats = 10',[DM.Connection.Database, vBackupFile,DM.Connection.Database]);
    DM.Script.Execute;

    // 복원을 한다
    DM.Script.SQL.Text := Format('restore database [%s] from disk = N''%s'' with file = 1, NoUnload, replace, stats = 10',[DM.Connection.Database, vRestoreFile]);
    DM.Script.Execute;

    MsgBox('DB 복원이 완료되었습니다.'#13'프로그램을 다시 시작해야 합니다.'#13'지금 프로그램을 종료합니다.');
    Application.Terminate;
  except
    on E: Exception do
    begin
      ErrBox('DB 복원을 하지 못했습니다.'#13+E.Message);
      Exit;
    end;
  end;
end;
//------------------------------------------------------------------------------
// DB 축소 버튼
procedure TSystemDBBackupForm.PagerBackupShrinkButtonClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crSQLWait;
  DM.ConnectDB;
  try
    Script.SQL.Text := Format('ALTER DATABASE %s SET SINGLE_USER WITH ROLLBACK IMMEDIATE',[DM.Connection.Database]);
    Script.Execute;

    Script.SQL.Text := Format('dbcc checkdb(''%s'', REPAIR_ALLOW_DATA_LOSS)',[DM.Connection.Database]);
    Script.Execute;

    Script.SQL.Text := Format('ALTER DATABASE %s SET MULTI_USER',[DM.Connection.Database]);
    Script.Execute;

    MsgBox('DB를 복구작업을 완료했습니다.');
  except
    on E: Exception do
    begin
      Script.SQL.Text := Format('ALTER DATABASE %s SET MULTI_USER',[DM.Connection.Database]);
      Script.Execute;
      ErrBox('DB를 복구작업을 완료하지 못했습니다.'#13+E.Message);
    end;
  end;
  Screen.Cursor := crDefault;
end;

//==============================================================================
// 테이블별 삭제 탭
//------------------------------------------------------------------------------
// 데이터 삭제 라디오그룹
procedure TSystemDBBackupForm.PagerTableDeleteRadioGroupPropertiesChange(Sender: TObject);
begin
  inherited;
  case PagerTableDeleteRadioGroup.ItemIndex of
    0 :
    begin
      PointCheckBox.Checked := false;
      BuyCheckBox.Checked   := false;
      PointCheckBox.Enabled := true;
      BuyCheckBox.Enabled   := true;
    end;
    1 :
    begin
      PointCheckBox.Checked := true;
      BuyCheckBox.Checked   := false;
      PointCheckBox.Enabled := false;
      BuyCheckBox.Enabled   := true;
    end;
    2 :
    begin
      PointCheckBox.Checked := true;
      BuyCheckBox.Checked   := true;
      PointCheckBox.Enabled := false;
      BuyCheckBox.Enabled   := false;
    end;
  end;
end;

procedure TSystemDBBackupForm.ScriptError(Sender: TObject; E: Exception;
  SQL: string; var Action: TErrorAction);
begin
  inherited;
  ErrMsg  := E.Message;
  isError := True;
end;

procedure TSystemDBBackupForm.TableOrderDeleteButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재 테이블에 주문내역을 삭제하시겠습니까?.') then
    Exit;

  if not AskBox('삭제 된 자료는 복구할 수 없습니다.'+#13+'정말 삭제하시겠습니까?') then
    Exit;

  try
    BeginTrans;
    ExecQuery('delete SL_ORDER_H   where DS_ORDER = ''T'' ',[], false);
    ExecQuery('delete SL_ORDER_D   where DS_ORDER = ''T'' ',[], false);
    ExecQuery('delete SL_ORDER_C   where DS_ORDER = ''T'' ',[], false);
    ExecQuery('delete SL_ORDER_PRT where DS_ORDER = ''T'' ',[], false);
    ExecQuery('delete SL_ORDER_KDS where DS_ORDER = ''T'' ',[], false);

    ExecQuery('insert into DELETE_LOG(DELETE_DATE, DS_TYPE) '
             +'               values(GetDate(), -1)',
             [], false);
    CommitTrans;
    MsgBox('자료가 삭제되었습니다.');
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox('작업을 완료하지 못했습니다.'#13+E.Message);
      Exit;
    end;
  end;
end;

procedure TSystemDBBackupForm.PagerPosDeleteGridViewDeleteRatePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// 삭제 버튼
function TSystemDBBackupForm.DoDelete: Boolean;
var
  vIndex,
  vCount : Integer;
  vSaleDate,
  vPosNo,
  vRcpNo :String;
  vSaleAmt :Currency;
  vCloseNo :Integer;
begin
  inherited;

  Result := false;

  if not AskBox('삭제된 자료는 복구할 수 없습니다.'+#13+'정말 삭제하시겠습니까?') then
    Exit;

  if Pager.ActivePageIndex = 1 then
  begin
    if (PagerTableDeleteRadioGroup.ItemIndex = 1) and not AskBox('설정한 기간에 상관없이 모든 매출 자료가 삭제됩니다.'+#13+'삭제하시겠습니까?') then
      Exit;

    if (PagerTableDeleteRadioGroup.ItemIndex = 2) and not AskBox('각종 코드 및 매출 자료를 모두 삭제합니다.'+#13+'삭제하시겠습니까?') then
      Exit;

    if PointCheckBox.Checked and not AskBox('회원포인트/스템프가 모두  삭제됩니다.'+#13+'삭제하시겠습니까?') then
      Exit;


    DM.ConnectDB;
    ShowMsg('데이터를 삭제 중 입니다', false);
    Screen.Cursor := crSQLWait;
    try
      DM.BeginTrans;

      DM.ExecQuery('insert into DELETE_LOG(DELETE_DATE, DS_TYPE) VALUES(GETDATE(), :P0)',
                   [PagerTableDeleteRadioGroup.ItemIndex], false);

      case PagerTableDeleteRadioGroup.ItemIndex of
        0 : //매출관련 데이터 (설정기간)
        begin
          DM.ExecQuery('delete SL_SALE_H where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SALE_D where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SALE_C where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SALE_PRT where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SALE_AGE where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SALE_COUPON where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SALE_H_SUM where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SALE_D_SUM where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_CARD where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_CASH where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_KTPOINT where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_CASHBAG where CD_STORE =:P0 and YMD_SALE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_DELIVERY where CD_STORE =:P0 and YMD_DELIVERY Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_POSCLOSE where CD_STORE =:P0 and YMD_CLOSE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_CASHIER_MGM where CD_STORE =:P0 and YMD_CLOSE Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          DM.ExecQuery('delete SL_SAWONWORK where CD_STORE =:P0 and Convert(Varchar(8), SETTLE_IN, 112) Between :P1 and :P2',
                       [StoreCode,
                        DtoS(ConditionToolBarFromDateEdit.Date),
                        DtoS(ConditionToolBarToDateEdit.Date)], false);
          //매입, 발주 삭제
          if BuyCheckBox.Checked then
          begin
            DM.ExecQuery('delete SL_BUY_H where CD_STORE =:P0 and YMD_BUY Between :P1 and :P2',
                         [StoreCode,
                          DtoS(ConditionToolBarFromDateEdit.Date),
                          DtoS(ConditionToolBarToDateEdit.Date)], false);
            DM.ExecQuery('delete SL_BUY_D where CD_STORE =:P0 and YMD_BUY Between :P1 and :P2',
                         [StoreCode,
                          DtoS(ConditionToolBarFromDateEdit.Date),
                          DtoS(ConditionToolBarToDateEdit.Date)], false);
          end;

          //포인트 삭제
          if PointCheckBox.Checked then
          begin
            DM.ExecQuery('delete SL_PNT_OCCUR where CD_STORE =:P0 and YMD_OCCUR Between :P1 and :P2',
                         [StoreCode,
                          DtoS(ConditionToolBarFromDateEdit.Date),
                          DtoS(ConditionToolBarToDateEdit.Date)], false);
            DM.ExecQuery('delete SL_PNT_PAY where CD_STORE =:P0 and YMD_PAY Between :P1 and :P2',
                         [StoreCode,
                          DtoS(ConditionToolBarFromDateEdit.Date),
                          DtoS(ConditionToolBarToDateEdit.Date)], false);
            DM.ExecQuery('update MS_MEMBER '
                        +'   set SAVE_STAMP  = 0, '
                        +'       USE_STAMP   = 0, '
                        +'       TOTAL_STAMP = 0 '
                        +' where CD_STORE =:P0 ',
                        [StoreCode],false);
          end;
        end;
        1,2 : //매출관련 데이터
        begin
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_H ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_H_HIST ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_D ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_C ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_COUPON ',
                       [StoreCode], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_H_SUM ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_D_SUM ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_NO ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_PRT ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_AGE ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SALE_COUPON ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_CARD ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_CASH ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_CASHBAG ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_KTPOINT ',
                       [StoreCode], false);
          DM.ExecQuery('TRUNCATE TABLE SL_DELIVERY ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_POSCLOSE ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_CASHIER_MGM ',
                       [], false);
          DM.ExecQuery('delete SL_ACCT where CD_STORE =:P0 and Isnull(CD_TRDPL,'''') ='''' and Isnull(CD_MEMBER,'''') ='''' ',
                       [StoreCode], false);
          DM.ExecQuery('TRUNCATE TABLE SL_DISUSE ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SILSA ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SILSA_TEMP ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_STOCK_MONTH ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_BOOKS_MONTH ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_CLOSE_MONTH ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_MEAT_STOCK ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_TRD_DAY ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SAWONWORK ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_CASHBOX ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_HT ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_SMS ',
                       [], false);
          DM.ExecQuery('TRUNCATE TABLE SL_INTEGRITY ',
                       [], false);
          //매입, 발주 삭제
          if BuyCheckBox.Checked then
          begin
            DM.ExecQuery('TRUNCATE TABLE SL_BUY_H ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_BUY_D ',
                         [], false);
          end;
          //포인트 삭제
          if PointCheckBox.Checked then
          begin
            DM.ExecQuery('TRUNCATE TABLE SL_PNT_OCCUR ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_PNT_PAY ',
                         [StoreCode], false);
            DM.ExecQuery('update MS_MEMBER set OCCUR_POINT=0, USE_POINT=0, TOTAL_POINT=0 where CD_STORE =:P0',
                         [StoreCode], false);
          end
          else if PagerTableDeleteRadioGroup.ItemIndex = 1 then
          begin
            DM.ExecQuery('TRUNCATE TABLE SL_PNT_OCCUR',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_PNT_PAY',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_PNT_OCCUR_DEL',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_PNT_PAY_DEL ',
                         [], false);
          end;

          //DB 초기화
          if PagerTableDeleteRadioGroup.ItemIndex = 2 then
          begin
            DM.ExecQuery('TRUNCATE TABLE MS_MENU ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MENU_CLASS ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MENU_DC ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MENU_OPEN ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MENU_ITEM ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MENU_SET ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MENU_GROUP ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_COURSE ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_DELIVERY_ADDR ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_DISSECTION ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MENU_HIST ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_PRINT_H ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_PRINT_D ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_PRINT_TEMP ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_LARGE ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_SMALL ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MEMBER ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_MEMBER_HIST ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_SPC_H ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_SPC_D ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_EVENT ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_COUPON ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_SCALE_LARGE ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_SCALE_SMALL ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_KIOSK_LARGE ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_KIOSK_SMALL ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_KIOSK_TABLE ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_KDS_H ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_KDS_D ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_TRD ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE MS_TABLE ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_BOOKING ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_BOOKING_TABLE ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_BOOKING_MENU ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_CID_LOG ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_KEEPING ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_PARKING ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_ORDER_H ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_ORDER_D ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_ORDER_PRT ',
                         [], false);
            DM.ExecQuery('TRUNCATE TABLE SL_ORDER_LOG ',
                         [], false);
            DM.ExecQuery('delete MS_SAWON	where CD_STORE =:P0 and CD_SAWON <> ''master'' ',
                         [StoreCode], false);
            DM.ExecQuery('insert into MS_SAWON(CD_STORE, CD_SAWON, NM_SAWON, NO_PASSWORD, CD_GRADE, CD_TIME_PAY, EMP_WORK, YN_USE) '
                        +'              values(''0001'',''999999'',''초기사용자'',''3B'',''001'',''000'',''1111111111'', ''Y'') ',
                         [], false);
            DM.ExecQuery('delete MS_CODE where CD_STORE =:P0 and CD_KIND not in (''15'',''80'') ',
                         [StoreCode], false);
            DM.ExecQuery('insert into MS_CODE (CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE7, DS_STATUS) '
                        +'             values (''0001'',''01'',''001'',''01'',''127.0.0.1'',''0'',''1'',''0'',''0'') ',
                         [], false);
            DM.ExecQuery('insert into MS_CODE (CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, NM_CODE4, NM_CODE5, NM_CODE6, NM_CODE7, NM_CODE8, DS_STATUS) '
                        +'             values (''0001'',''03'',''001'',''1층'',''9'',''9'',''10'',''9'',''5'',''18'',''3'',''0'') ',
                         [], false);
            DM.ExecQuery('insert into MS_CODE (CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3, DS_STATUS) '
                        +'             values (''0001'',''11'',''003'',''거래처 외상매입금 지급'',''1'',''3'',''0'') ',
                         [], false);
            DM.ExecQuery('insert into MS_CODE (CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3,DS_STATUS) '
                        +'             values (''0001'',''11'',''001'',''회원 외상입금'',''0'',''1'',''0'') ',
                         [], false);
            DM.ExecQuery('insert into MS_CODE (CD_STORE, CD_KIND, CD_CODE, NM_CODE1, NM_CODE2, NM_CODE3,DS_STATUS) '
                        +'             values (''0001'',''11'',''002'',''현금매입'',''1'',''2'',''0'') ',
                         [], false);
            DM.ExecQuery('insert into MS_CODE (CD_STORE, CD_KIND, CD_CODE, NM_CODE1, DS_STATUS) '
                        +'             values (''0001'',''17'',''001'',''관리자'',''0'') ',
                         [], false);

          end;
        end;
      end;
      DM.CommitTrans;
      Result := true;
      MsgBox('자료가 삭제되었습니다.');
    except
      on E: Exception do
      begin
        DM.RollbackTrans;
        ErrBox('자료를 삭제하지 못했습니다.'#13+E.Message);
      end;
    end;
    Screen.Cursor := crDefault;
  end
  //건별삭제
  else if Pager.ActivePageIndex = 3 then
  begin
    vCount       := 0;
    for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
      if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], 0] then
        Inc(vCount);

    if (vCount = 0) and (GetOnlyNumber(ConditionToolBarEdit.Text)=ConditionToolBarEdit.Text) and (StoI(ConditionToolBarEdit.Text) > 0) then
    begin
      vSaleDate := '';
      vPosNo    := '';
      try
        BeginTrans;
        Screen.Cursor := crSQLWait;
        for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
        begin
          if (vSaleDate = GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index]))
            and (vPosNo = GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewPosNo.Index]) then Continue;

          vSaleDate   := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index]);
          vPosNo      := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewPosNo.Index];
          try
            OpenQuery('select Sum(AMT_SALE) '
                     +'  from SL_SALE_H (nolock) '
                     +' where CD_STORE		 =:P0 '
                     +'   and YMD_SALE		 =:P1 '
                     +'   and NO_POS		   =:P2 '
                     +'   and DS_SALE	   	 =''S'' '
                     +'   and AMT_SALE		 =AMT_CASH '
                     +'   and CD_MEMBER	   ='''' '
                     +'   and AMT_CASHRCP =0 '
                     +'   and AMT_SALE    > 0 ',
                     [StoreCode,
                      vSaleDate,
                      vPosNo]);
            vSaleAmt := Query.Fields[0].AsCurrency;
          finally
            FinishQuery;
          end;
          vSaleAmt := RoundNumber(StoI(ConditionToolBarEdit.Text) / 100 * vSaleAmt,1);
          StoredProc.Close;
          StoredProc.ParamByName('@CD_STORE').AsString      := StoreCode;
          StoredProc.ParamByName('@YMD_SALE').AsString      := vSaleDate;
          StoredProc.ParamByName('@NO_POS').AsString        := vPosNo;
          StoredProc.ParamByName('@AMT_CONTROL').AsCurrency := vSaleAmt;
          StoredProc.ParamByName('@AMT_APPLY').AsCurrency := 0;
          StoredProc.Execute;
        end;
        CommitTrans;
        Result := True;
        DoSearch;
      except
        on E: Exception do
        begin
          DM.RollbackTrans;
          ErrBox('자료를 삭제하지 못했습니다.'#13+E.Message);
        end;
      end;
      Screen.Cursor := crDefault;
      Exit;
    end;

    if vCount = 0 then
    begin
      MsgBox('삭제 할 영수증을 선택하세요');
      Exit;
    end;

    try
      BeginTrans;
      Screen.Cursor := crSQLWait;
      for vIndex := GridTableView.DataController.FilteredRecordCount-1 downto 0 do
      begin
        if not GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], 0] then Continue;

        vSaleDate   := GetOnlyNumber(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index]);
        vPosNo      := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewPosNo.Index];
        vRcpNo      := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewRcpNo.Index];
        vCloseNo    := GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewCloseNo.Index];

        //마감데이터 맞추기
        if vCloseNo > 0 then
          ExecQuery('update SL_CASHIER_MGM set SL_CASHIER_MGM.AMT_SALE    = SL_CASHIER_MGM.AMT_SALE    - h.AMT_SALE, '
                   +'                          SL_CASHIER_MGM.AMT_CASH    = SL_CASHIER_MGM.AMT_CASH    - h.AMT_CASH, '
                   +'                          SL_CASHIER_MGM.AMT_CHECK   = SL_CASHIER_MGM.AMT_CHECK   - h.AMT_CHECK, '
                   +'                          SL_CASHIER_MGM.AMT_CARD    = SL_CASHIER_MGM.AMT_CARD    - h.AMT_CARD, '
                   +'                          SL_CASHIER_MGM.AMT_CASHRCP = SL_CASHIER_MGM.AMT_CASHRCP - h.AMT_CASHRCP, '
                   +'                          SL_CASHIER_MGM.AMT_TRUST   = SL_CASHIER_MGM.AMT_TRUST   - h.AMT_TRUST, '
                   +'                          SL_CASHIER_MGM.AMT_GIFT    = SL_CASHIER_MGM.AMT_GIFT    - h.AMT_GIFT, '
                   +'                          SL_CASHIER_MGM.AMT_ZEROPAY = SL_CASHIER_MGM.AMT_ZEROPAY - h.AMT_ZEROPAY, '
                   +'                          SL_CASHIER_MGM.AMT_POINT   = SL_CASHIER_MGM.AMT_POINT   - h.AMT_POINT, '
                   +'                          SL_CASHIER_MGM.AMT_BANK    = SL_CASHIER_MGM.AMT_BANK    - h.AMT_BANK, '
                   +'                          SL_CASHIER_MGM.AMT_ETC     = SL_CASHIER_MGM.AMT_ETC     - h.AMT_ETC, '
                   +'                          SL_CASHIER_MGM.AMT_SERVICE = SL_CASHIER_MGM.AMT_SERVICE - h.AMT_SERVICE, '
                   +'                          SL_CASHIER_MGM.DC_RECEIPT  = SL_CASHIER_MGM.DC_RECEIPT  - h.DC_RECEIPT, '
                   +'                          SL_CASHIER_MGM.DC_MEMBER   = SL_CASHIER_MGM.DC_MEMBER   - h.DC_MEMBER, '
                   +'                          SL_CASHIER_MGM.DC_COUPON   = SL_CASHIER_MGM.DC_COUPON   - h.DC_COUPON, '
                   +'                          SL_CASHIER_MGM.DC_MENU     = SL_CASHIER_MGM.DC_MENU     - h.DC_MENU, '
                   +'                          SL_CASHIER_MGM.DC_CODE     = SL_CASHIER_MGM.DC_CODE     - h.DC_CODE, '
                   +'                          SL_CASHIER_MGM.DC_ENURI    = SL_CASHIER_MGM.DC_ENURI    - h.DC_ENURI, '
                   +'                          SL_CASHIER_MGM.DC_CUT      = SL_CASHIER_MGM.DC_CUT      - h.DC_CUT, '
                   +'                          SL_CASHIER_MGM.DC_VAT      = SL_CASHIER_MGM.DC_VAT      - h.DC_VAT, '
                   +'                          SL_CASHIER_MGM.DC_POINT    = SL_CASHIER_MGM.DC_POINT    - h.DC_POINT, '
                   +'                          SL_CASHIER_MGM.DC_KBANK    = SL_CASHIER_MGM.DC_KBANK    - h.DC_KBANK, '
                   +'                          SL_CASHIER_MGM.DC_MCARD    = SL_CASHIER_MGM.DC_MCARD    - h.DC_MCARD, '
                   +'                          SL_CASHIER_MGM.DC_KT       = SL_CASHIER_MGM.DC_KT       - h.DC_KT, '
                   +'                          SL_CASHIER_MGM.DC_TAXFREE  = SL_CASHIER_MGM.DC_TAXFREE  - h.DC_TAXFREE, '
                   +'                          SL_CASHIER_MGM.DC_STAMP    = SL_CASHIER_MGM.DC_STAMP    - h.DC_STAMP, '
                   +'                          SL_CASHIER_MGM.DC_UPLUS    = SL_CASHIER_MGM.DC_UPLUS    - h.DC_UPLUS, '
                   +'                          SL_CASHIER_MGM.CNT_CARD    = SL_CASHIER_MGM.CNT_CARD    - case when h.AMT_CARD    <> 0 then 1 else 0 end, '
                   +'                          SL_CASHIER_MGM.CNT_CUSTOMER= SL_CASHIER_MGM.CNT_CUSTOMER-1, '
                   +'                          SL_CASHIER_MGM.RCP_END     = dbo.LPad(Convert(Int, h.NO_RCP)-1,4,''0'') '
                   +' from SL_CASHIER_MGM inner join '
                   +'      SL_SALE_H h on h.CD_STORE = SL_CASHIER_MGM.CD_STORE '
                   +'                 and h.YMD_SALE = SL_CASHIER_MGM.YMD_CLOSE '
                   +'                 and h.NO_POS   = SL_CASHIER_MGM.NO_POS '
                   +'                 and h.CD_SAWON = SL_CASHIER_MGM.CD_SAWON '
                   +'                 and h.NO_CLOSE = SL_CASHIER_MGM.SEQ '
                   +'where h.CD_STORE =:P0 '
                   +'  and h.YMD_SALE =:P1 '
                   +'  and h.NO_POS   =:P2 '
                   +'  and h.NO_RCP   =:P3 ',
                   [StoreCode,
                    vSaleDate,
                    vPosNo,
                    vRcpNo], false);

        if vCloseNo > 0 then
          ExecQuery('update SL_POSCLOSE set SL_POSCLOSE.AMT_SALE    = SL_POSCLOSE.AMT_SALE    - h.AMT_SALE, '
                   +'                       SL_POSCLOSE.AMT_CASH    = SL_POSCLOSE.AMT_CASH    - h.AMT_CASH, '
                   +'                       SL_POSCLOSE.AMT_CHECK   = SL_POSCLOSE.AMT_CHECK   - h.AMT_CHECK, '
                   +'                       SL_POSCLOSE.AMT_CARD    = SL_POSCLOSE.AMT_CARD    - h.AMT_CARD, '
                   +'                       SL_POSCLOSE.AMT_CASHRCP = SL_POSCLOSE.AMT_CASHRCP - h.AMT_CASHRCP, '
                   +'                       SL_POSCLOSE.AMT_TRUST   = SL_POSCLOSE.AMT_TRUST   - h.AMT_TRUST, '
                   +'                       SL_POSCLOSE.AMT_GIFT    = SL_POSCLOSE.AMT_GIFT    - h.AMT_GIFT, '
                   +'                       SL_POSCLOSE.AMT_ZEROPAY = SL_POSCLOSE.AMT_ZEROPAY - h.AMT_ZEROPAY, '
                   +'                       SL_POSCLOSE.AMT_POINT   = SL_POSCLOSE.AMT_POINT   - h.AMT_POINT, '
                   +'                       SL_POSCLOSE.AMT_BANK    = SL_POSCLOSE.AMT_BANK    - h.AMT_BANK, '
                   +'                       SL_POSCLOSE.AMT_ETC     = SL_POSCLOSE.AMT_ETC     - h.AMT_ETC, '
                   +'                       SL_POSCLOSE.AMT_SERVICE = SL_POSCLOSE.AMT_SERVICE - h.AMT_SERVICE, '
                   +'                       SL_POSCLOSE.DC_RECEIPT  = SL_POSCLOSE.DC_RECEIPT  - h.DC_RECEIPT, '
                   +'                       SL_POSCLOSE.DC_MEMBER   = SL_POSCLOSE.DC_MEMBER   - h.DC_MEMBER, '
                   +'                       SL_POSCLOSE.DC_MENU     = SL_POSCLOSE.DC_MENU     - h.DC_MENU, '
                   +'                       SL_POSCLOSE.DC_CODE     = SL_POSCLOSE.DC_CODE     - h.DC_CODE, '
                   +'                       SL_POSCLOSE.DC_ENURI    = SL_POSCLOSE.DC_ENURI    - h.DC_ENURI, '
                   +'                       SL_POSCLOSE.DC_CUT      = SL_POSCLOSE.DC_CUT      - h.DC_CUT, '
                   +'                       SL_POSCLOSE.DC_VAT      = SL_POSCLOSE.DC_VAT      - h.DC_VAT, '
                   +'                       SL_POSCLOSE.DC_POINT    = SL_POSCLOSE.DC_POINT    - h.DC_POINT, '
                   +'                       SL_POSCLOSE.DC_KBANK    = SL_POSCLOSE.DC_KBANK    - h.DC_KBANK, '
                   +'                       SL_POSCLOSE.DC_MCARD    = SL_POSCLOSE.DC_MCARD    - h.DC_MCARD, '
                   +'                       SL_POSCLOSE.DC_KT       = SL_POSCLOSE.DC_KT       - h.DC_KT, '
                   +'                       SL_POSCLOSE.DC_COUPON   = SL_POSCLOSE.DC_COUPON   - h.DC_COUPON, '
                   +'                       SL_POSCLOSE.DC_TAXFREE  = SL_POSCLOSE.DC_TAXFREE  - h.DC_TAXFREE, '
                   +'                       SL_POSCLOSE.DC_STAMP    = SL_POSCLOSE.DC_STAMP    - h.DC_STAMP, '
                   +'                       SL_POSCLOSE.DC_UPLUS    = SL_POSCLOSE.DC_UPLUS    - h.DC_UPLUS, '
                   +'                       SL_POSCLOSE.CNT_CARD    = SL_POSCLOSE.CNT_CARD    - case when h.AMT_CARD    <> 0 then 1 else 0 end, '
                   +'                       SL_POSCLOSE.CNT_CUSTOMER= SL_POSCLOSE.CNT_CUSTOMER-1 '
                   +' from SL_POSCLOSE inner join '
                   +'      SL_SALE_H h on h.CD_STORE = SL_POSCLOSE.CD_STORE '
                   +'                 and h.YMD_SALE = SL_POSCLOSE.YMD_CLOSE '
                   +'                 and h.NO_POS   = SL_POSCLOSE.NO_POS '
                   +'where h.CD_STORE =:P0 '
                   +'  and h.YMD_SALE =:P1 '
                   +'  and h.NO_POS   =:P2 '
                   +'  and h.NO_RCP   =:P3 ',
                   [StoreCode,
                    vSaleDate,
                    vPosNo,
                    vRcpNo], false);

        // 영수증 삭제
        ExecQuery('delete SL_SALE_H '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_SALE_D '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_SALE_S '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_SALE_PRT '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_SALE_AGE '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_SALE_COUPON '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_SALE_IMAGE '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_CARD '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_CASH '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('delete SL_PNT_OCCUR '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_OCCUR  =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and LINK       =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vSaleDate+vPosNo+vRcpNo], false);

        ExecQuery('delete SL_PNT_PAY '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_PAY    =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and LINK       =:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vSaleDate+vPosNo+vRcpNo], false);

        // 영수증 번호 당기기
        ExecQuery('update SL_SALE_H set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_SALE_D set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_SALE_S set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_SALE_PRT set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_SALE_AGE set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_SALE_COUPON set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_SALE_IMAGE set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_CARD set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_CASH set NO_RCP = dbo.LPad(Convert(Int, NO_RCP)-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_SALE   =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and NO_RCP     >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_PNT_OCCUR set LINK = YMD_OCCUR+NO_POS+dbo.LPad(Convert(Int, Right(LINK,4))-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_OCCUR  =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and Right(LINK,4) >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);

        ExecQuery('update SL_PNT_PAY set LINK = YMD_PAY+NO_POS+dbo.LPad(Convert(Int, Right(LINK,4))-1,4,''0'') '
                 +' where CD_STORE   =:P0 '
                 +'   and YMD_PAY    =:P1 '
                 +'   and NO_POS     =:P2 '
                 +'   and Right(LINK,4) >:P3 ',
                 [StoreCode,
                  vSaleDate,
                  vPosNo,
                  vRcpNo], false);
      end;
      ExecQuery('insert into delete_log(delete_date, ds_type) values(GetDate(), :P0)',
                [GridTableView.DataController.FilteredRecordCount], false);

      CommitTrans;
      Result := True;
      DoSearch;
    except
      on E: Exception do
      begin
        DM.RollbackTrans;
        ErrBox('자료를 삭제하지 못했습니다.'#13+E.Message);
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;
function TSystemDBBackupForm.DoSearch: Boolean;
var vWhere :String;
begin
  OpenQuery('select 0 as YN_CHK, '
           +'       YMD_SALE, '
           +'       NO_POS, '
           +'       NO_RCP, '
           +'       case when CD_MEMBER ='''' then ''비회원'' else ''회원'' end as DS_TARGET, '
           +'       case when AMT_SALE = AMT_CASHRCP   and AMT_CASHRCP <> 0  then ''현금영수증'' '
           +'            when AMT_SALE = AMT_CASH      and AMT_CASH    <> 0  then ''현금'' '
           +'            when AMT_SALE = AMT_CARD      and AMT_CARD    <> 0  then ''신용카드'' '
           +'            when AMT_SALE = AMT_TRUST     and AMT_TRUST   <> 0  then ''외상'' '
           +'            when AMT_SALE = AMT_GIFT      and AMT_GIFT    <> 0  then ''상품권'' '
           +'            when AMT_SALE = AMT_BANK      and AMT_BANK    <> 0  then ''계좌이체'' '
           +'            when AMT_SALE = AMT_ZEROPAY   and AMT_ZEROPAY <> 0  then ''제로페이'' '
           +'            when AMT_SALE = AMT_POINT     and AMT_POINT   <> 0  then ''포인트'' '
           +'            else ''복합'' end as DS_PAY, '
           +'       AMT_SALE, '
           +'       AMT_CASH+AMT_CHECK as AMT_CASH, '
           +'       AMT_CASHRCP, '
           +'       AMT_CARD, '
           +'       AMT_TRUST, '
           +'       AMT_GIFT, '
           +'       AMT_ZEROPAY, '
           +'       AMT_POINT, '
           +'       AMT_BANK, '
           +'       Isnull(NO_CLOSE,0) as NO_CLOSE '
           +'  from SL_SALE_H '
           +' where CD_STORE =:P0 '
           +'   and YMD_SALE between :P1 and :P2 '
           +'   and DS_SALE <> ''V'' ',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)]);
  DM.ReadQuery(Query, GridTableView);
  GridTableViewDataControllerAfterPost(GridTableView.DataController);
end;

procedure TSystemDBBackupForm.BcpDownLoadButtonClick(Sender: TObject);
  function GetBackupFileDownLoad:String;
  var vFileList :TStringList;
      vIndex    :Integer;
      isDown    :Boolean;
  begin
    inherited;
    Result := EmptyStr;
    vFileList := TStringList.Create;
    idFTP.host := bcpFTP;
    idFTP.Port := 6021;
    idFTP.Username := 'bcpdnuser';
    idFTP.Password := 'bcpdnpass';
    try
      idFTP.Connect;
      try
        idFTP.ChangeDir(DtoS(BackupDateEdit.Date));
      except
        idFTP.Disconnect;
        MsgBox(Format('%s일자의 백업화일이 없습니다',[BackupDateEdit.Text]));
        Exit;
      end;
      idFTP.List(vFileList, CustomerNo+'*.*', true);


      isDown := false;
      for vIndex := 0 to vFileList.Count -1 do
      begin
        if Pos(CustomerNo, vFileList.Strings[vIndex]) > 0 then
        begin
          idFTP.Get(Copy(vFileList.Strings[vIndex],Pos(CustomerNo, vFileList.Strings[vIndex]),28), Copy(vFileList.Strings[vIndex],Pos(CustomerNo, vFileList.Strings[vIndex]),28), true);
          isDown := true;
          Result := Copy(vFileList.Strings[vIndex],Pos(CustomerNo, vFileList.Strings[vIndex]),28);
          Break;
        end;
      end;
      if not isDown then
        MsgBox(Format('%s일자의 백업화일이 없습니다',[BackupDateEdit.Text]));
    except on e:Exception do
      Application.MessageBox(PChar(e.Message),'FTP 접속오류',MB_ICONERROR OR MB_OK);
    end;

    if idFTP.Connected then
     idFTP.Disconnect;
  end;

  function GetBcpTable(aTableName:String):String;
  var vPath   :String;
      vFormat :Boolean;
  begin
    vPath   := ExtractFilePath(Application.ExeName)+'Bcp\';
    vFormat := FileExists(Format('%s%s.xml',[vPath, aTableName]));
    if vFormat then
    begin
      Result := Format('ExtremeFood.dbo.%s IN "%s%s.bcp" -T -f%s%s.xml',[aTableName ,vPath, aTableName, vPath,aTableName]);
      BcpMemo.Lines.Add(Result);
    end
    else
    begin
      Result := Format('ExtremeFood.dbo.%s IN "%s%s.bcp" -c -T',[aTableName,vPath, aTableName]);
    end;
  end;
var vIndex, vSeq, vCount, vRet :Integer;
    vPath  :String;
    vTempSQL:String;
    vSQL,
    vDeleteFile  :TStringList;
    vRestoreFile:String;
    vFiles : TSearchRec;
    vBackDBVersion,
    vDBVersion :String;
    vBcpExeFilePath :String;
    vResult :String;
begin
  inherited;

  if not isDBServer then
  begin
    Application.MessageBox(PChar('DB가 설치된 PC 또는 POS에서만 복원이 가능합니다!!!'),
                                PChar('ExtremePOS'),
                                MB_ICONWARNING);
    Exit;
  end;

  vCount := 0;
  for vIndex := 0 to RestoreCheckGroup.Properties.Items.Count-1 do
  begin
    if RestoreCheckGroup.States[vIndex] = cbsChecked then
    begin
      Inc(vCount);
      Break;
    end;
  end;

  if vCount = 0 then
  begin
    MsgBox('복원 할 항목이 없습니다');
    Exit;
  end;
  with TProxyCheckForm.Create(self) do
    try
      if ShowModal <> mrOK then
        Exit;
    finally
      Free;
    end;

  if Sender = BcpDownLoadButton then
  begin
    vRestoreFile :=GetBackupFileDownLoad;
    if vRestoreFile = EmptyStr then Exit;
    vBackDBVersion := Copy(vRestoreFile,8,8);
    vRestoreFile := ExtractFilePath(Application.ExeName)+vRestoreFile;
  end
  else
  begin
    OpenDialog.Filter := '백업 파일|*.7z';
    if not OpenDialog.Execute then
      Exit;
    vRestoreFile := OpenDialog.FileName;
    vBackDBVersion := Copy(RightStr(vRestoreFile,28),8,8);
  end;

  vPath := ExtractFilePath(Application.ExeName)+'Bcp\';

  //디렉토리가 없으면 생성
  if Not DirectoryExists(vPath) then
    ForceDirectories(vPath);

  //BCP 폴더에 있는 화일삭제
  vRet := FindFirst(Format('%s*.*',[vPath]), faAnyfile, vFiles);
  try
    while vRet = 0 do
    begin
      DeleteFile(PChar(vPath+vFiles.Name));
      vRet := FindNext(vFiles);
    end;
  finally
    FindClose(vFiles);
  end;

  //압축풀기
  //7za x -y -o"D:\My Program\ExtremeFood\Bin" "AO1485(20170905)_20180820.7z"
  ExecuteProgram('', '7za.exe', Format('x -y -o"%s" "%s" ',[vPath, vRestoreFile]), true);

  //백업 DB버젼과 현재 DB버젼을 비교한다(포멧백업을 안했을때)
  try
    OpenQuery('select   Top 1 VERSION '
             +'from     MS_VERSION '
             +'order by SEQ desc',
                 []);
    vDBVersion := Query.Fields[0].AsString;
  finally
    FinishQuery;
  end;

  if not FileExists(vPath+'MS_CODE.xml') and (vDBVersion <> vBackDBVersion) then
  begin
    MsgBox('백업 DB버젼과 같아야 복원이 가능합니다'+#13+Format('백업[%s], 현재[%s]',[vBackDBVersion, vDBVersion]));
    Exit;
  end;

  vBcpExeFilePath := GetBCPPath;

  //MS_SQL 버젼
  try
    OpenQuery('SELECT SERVERPROPERTY(''productversion'')',
                 []);
    SQLVersion := Query.Fields[0].AsString;
    SQLVersion := LeftStr(SQLVersion, Pos('.',SQLVersion)+1);
  finally
    FinishQuery;
  end;

  Screen.Cursor := crHourGlass;
  try
    vDeleteFile := TStringList.Create;
//    BeginTrans;
    //공통코드
    if RestoreCheckGroup.States[0] = cbsChecked then
    begin
      if FileExists(vPath+'MS_CODE.bcp') then
      begin
        ExecQuery('truncate table MS_CODE',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_CODE')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_CODE)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_CODE'), true);
      end;
    end;
    //테이블정보
    if RestoreCheckGroup.States[1] = cbsChecked then
    begin
      if FileExists(vPath+'MS_TABLE.bcp') then
      begin
        ExecQuery('truncate table SL_ORDER_H',[],true);
        ExecQuery('truncate table SL_ORDER_D',[],true);
        ExecQuery('truncate table SL_ORDER_C',[],true);
        ExecQuery('truncate table SL_ORDER_PRT',[],true);
        ExecQuery('truncate table SL_ORDER_LOG',[],true);
        ExecQuery('truncate table MS_TABLE',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_TABLE')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_TABLE)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_TABLE'), true);
      end;
    end;
    //메뉴정보
    if RestoreCheckGroup.States[2] = cbsChecked then
    begin
      if FileExists(vPath+'MS_MENU.bcp') then
      begin
        ExecQuery('truncate table MS_MENU',[],true);
        ExecQuery('truncate table MS_MENU_CLASS',[],true);
        ExecQuery('truncate table MS_MENU_HIST',[],true);
        ExecQuery('truncate table MS_COURSE',[],true);
        ExecQuery('truncate table MS_MENU_SET',[],true);
        ExecQuery('truncate table MS_MENU_OPEN',[],true);
        ExecQuery('truncate table MS_MENU_DC',[],true);
        ExecQuery('truncate table MS_MENU_MEMO',[],true);
        ExecQuery('truncate table MS_MENU_GROUP',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MENU')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_MENU)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MENU'), true);

        if FileExists(vPath+'MS_MENU_CLASS.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MENU_CLASS')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_MENU_CLASS)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MENU_CLASS'), true);
        end;

        if FileExists(vPath+'MS_COURSE.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_COURSE')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_COURSE)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_COURSE'), true);
        end;

        if FileExists(vPath+'MS_MENU_SET.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MENU_SET')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_MENU_SET)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MENU_SET'), true);
        end;

        if FileExists(vPath+'MS_MENU_OPEN.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MENU_OPEN')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_MENU_OPEN)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MENU_OPEN'), true);
        end;

        if FileExists(vPath+'MS_MENU_DC.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MENU_DC')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_MENU_DC)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MENU_DC'), true);
        end;

        if FileExists(vPath+'MS_MENU_MEMO.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MENU_MEMO')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_MENU_MEMO)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MENU_MEMO'), true);
        end;

        if FileExists(vPath+'MS_MENU_GROUP.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MENU_GROUP')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_MENU_GROUP)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MENU_GROUP'), true);
        end;
      end;
    end;
    //PLU정보
    if RestoreCheckGroup.States[3] = cbsChecked then
    begin
      if FileExists(vPath+'MS_LARGE.bcp') then
      begin
        ExecQuery('truncate table MS_LARGE',[],true);
        ExecQuery('truncate table MS_SMALL',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_LARGE')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_LARGE)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_LARGE'), true);
        if FileExists(vPath+'MS_SMALL.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_SMALL')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_SMALL)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_SMALL'), true);
        end;
      end;

      if FileExists(vPath+'MS_KIOSK_LARGE.bcp') then
      begin
        ExecQuery('truncate table MS_KIOSK_LARGE',[],true);
        ExecQuery('truncate table MS_KIOSK_SMALL',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_KIOSK_LARGE')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_KIOSK_LARGE)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_KIOSK_LARGE'), true);
        if FileExists(vPath+'MS_KIOSK_SMALL.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_KIOSK_SMALL')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_KIOSK_SMALL)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_KIOSK_SMALL'), true);
        end;
      end;
    end;
    //매장정보
    if RestoreCheckGroup.States[4] = cbsChecked then
    begin
      if FileExists(vPath+'MS_STORE.bcp') then
      begin
        ExecQuery('truncate table MS_STORE',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_STORE')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_STORE)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_STORE'), true);
      end;
    end;
    //회원정보
    if RestoreCheckGroup.States[5] = cbsChecked then
    begin
      if FileExists(vPath+'MS_MEMBER.bcp') then
      begin
        ExecQuery('truncate table MS_MEMBER',[],true);
        ExecQuery('truncate table SL_PNT_OCCUR',[],true);
        ExecQuery('truncate table TEMP_TRUST',[],true);
        ExecQuery('delete from SL_ACCT where len(CD_MEMBER)=10 ',[],false);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_MEMBER')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_MEMBER)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_MEMBER'), true);

        //기초포인트
        OpenQuery('select CD_MEMBER, '
                 +'       TOTAL_POINT '
                 +'  from MS_MEMBER '
                 +' where CD_STORE =:P0 '
                 +'   and TOTAL_POINT <> 0 ',
                 [StoreCode]);

        vTempSQL := EmptyStr;
        vSeq     := 1;
        vCount   := 1;
        vSQL     := TStringList.Create;
        while not Query.Eof do
        begin
          vTempSQL := vTempSQL + Ifthen(vTempSQL <> '', ' union all ', '')+
                                   Format('select ''%s'', ''%s'', %d, ''%s'', ''001'', %d, ''기초 포인트(백업데이터 복원)'', ''%s'', GetDate(), 0 ',
                                          [StoreCode,
                                           FormatDateTime('yyyymmdd',Now),
                                           vSeq,
                                           Query.Fields[0].AsString,
                                           Query.Fields[1].AsInteger,
                                           UserCode]);
          Inc(vCount);
          Inc(vSeq);
          if vCount > 500 then
          begin
             vSQL.Add(vTempSQL);
             vTempSQL := EmptySTr;
             vCount   := 0;
          end;
          Query.Next;
        end;
        Query.Close;
        if vTempSQL <> EmptySTr then
          vSQL.Add(vTempSQL);

        for vIndex := 0 to vSQL.Count-1 do
        begin
          SQL.SQL.Text := 'insert into SL_PNT_OCCUR(CD_STORE, YMD_OCCUR, SEQ, CD_MEMBER, CD_CODE, PNT_CASH, REMARK, CD_SAWON_CHG, DT_CHANGE, DS_TRANS) '
                         +vSQL.Strings[vIndex];
          SQL.Execute;
        end;

        //기초스템프
        OpenQuery('select CD_MEMBER, '
                 +'       TOTAL_STAMP '
                 +'  from MS_MEMBER '
                 +' where CD_STORE =:P0 '
                 +'   and TOTAL_STAMP <> 0 ',
                 [StoreCode]);

        vTempSQL := EmptyStr;
        vCount   := 1;
        vSQL     := TStringList.Create;
        while not Query.Eof do
        begin
          vTempSQL := vTempSQL + Ifthen(vTempSQL <> '', ' union all ', '')+
                                   Format('select ''%s'', ''%s'', %d, ''%s'', ''000'', %d, ''기초 스템프(백업데이터 복원)'', ''%s'', GetDate(), 0 ',
                                          [StoreCode,
                                           FormatDateTime('yyyymmdd',Now),
                                           vSeq,
                                           Query.Fields[0].AsString,
                                           Query.Fields[1].AsInteger,
                                           UserCode]);
          Inc(vCount);
          Inc(vSeq);
          if vCount > 500 then
          begin
             vSQL.Add(vTempSQL);
             vTempSQL := EmptySTr;
             vCount   := 0;
          end;
          Query.Next;
        end;
        Query.Close;
        if vTempSQL <> EmptySTr then
          vSQL.Add(vTempSQL);

        for vIndex := 0 to vSQL.Count-1 do
        begin
          SQL.SQL.Text := 'insert into SL_PNT_OCCUR(CD_STORE, YMD_OCCUR, SEQ, CD_MEMBER, CD_CODE, AMT_EXIST, REMARK, CD_SAWON_CHG, DT_CHANGE, DS_TRANS) '
                         +vSQL.Strings[vIndex];
          SQL.Execute;
        end;


        //적립포인트 저장으로 2배된 포인트를 반드로 한다
        ExecQuery('update MS_MEMBER '
                 +'   set OCCUR_POINT = dbo.DivInt(OCCUR_POINT,2), '
                 +'       TOTAL_POINT = dbo.DivInt(TOTAL_POINT,2) ',
                 [],true);

        //기초미수
        if FileExists(vPath+'TEMP_TRUST.bcp') then
        begin
          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', Format('ExtremeFood.dbo.%s IN "%s%s.bcp" -c -T',['TEMP_TRUST',vPath, 'TEMP_TRUST']), true);
          try
            OpenQuery('select   IsNull(Max(NO_ACCT),0)+1 as NO_ACCT '
                     +'from     SL_ACCT '
                     +'where    CD_STORE  = :P0 '
                     +'  and    YMD_OCCUR = :P1',
                     [StoreCode,
                      DtoS(Date)]);
            vSeq := Query.Fields[0].AsInteger;
          finally
            FinishQuery;
          end;

          OpenQuery('select CD_MEMBER, '
                   +'       AMT_TRUST '
                   +'  from TEMP_TRUST '
                   +' where CD_STORE =:P0 '
                   +'   and AMT_TRUST <> 0 ',
                   [StoreCode]);

          vTempSQL := EmptyStr;
          vSeq     := 1;
          vCount   := 1;
          vSQL.Clear;
          while not Query.Eof do
          begin
            vTempSQL := vTempSQL + Ifthen(vTempSQL <> '', ' union all ', '')+
                                     Format('select ''%s'', ''%s'', ''%s'', ''0'', ''%s'', ''%s'', %d, ''%s'' , GetDate(), GetDate(), ''기초미수'' ',
                                            [StoreCode,
                                             DtoS(Date),
                                             FormatFloat('000', vSeq),
                                             CreditIn,
                                             Query.Fields[0].AsString,
                                             Query.Fields[1].AsInteger*-1,
                                             UserCode]);

            Inc(vCount);
            Inc(vSeq);
            if vCount > 500 then
            begin
               vSQL.Add(vTempSQL);
               vTempSQL := EmptySTr;
               vCount   := 0;
            end;
            Query.Next;
          end;
          Query.Close;
          if vTempSQL <> EmptySTr then
            vSQL.Add(vTempSQL);

          for vIndex := 0 to vSQL.Count-1 do
          begin
            SQL.SQL.Text := 'insert into SL_ACCT(CD_STORE, YMD_OCCUR, NO_ACCT, DS_ACCT, CD_ACCT, CD_MEMBER, AMT_PAYIN, CD_SAWON_CHG, DT_CHANGE, DT_INSERT, REMARK) '
                           +vSQL.Strings[vIndex];
            SQL.Execute;
          end;
        end;
      end;
    end;
    //주방모니터
    if RestoreCheckGroup.States[6] = cbsChecked then
    begin
      if FileExists(vPath+'MS_KDS_H.bcp') then
      begin
        ExecQuery('delete from MS_KDS_H',[],true);
        ExecQuery('delete from MS_KDS_D',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_KDS_H')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_KDS_H)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_KDS_H'), true);
        if FileExists(vPath+'MS_KDS_D.bcp') then
        begin
          vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_KDS_D')]), vBcpExeFilePath);
          LogSave('BCP 복원(MS_KDS_D)', vResult);
//          ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_KDS_D'), true);
        end;
      end;
    end;
    //사원정보
    if RestoreCheckGroup.States[7] = cbsChecked then
    begin
      if FileExists(vPath+'MS_SAWON.bcp') then
      begin
        ExecQuery('delete from MS_SAWON',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('MS_SAWON')]), vBcpExeFilePath);
        LogSave('BCP 복원(MS_SAWON)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('MS_SAWON'), true);
      end;
    end;

    //킵핑
    if RestoreCheckGroup.States[8] = cbsChecked then
    begin
      if FileExists(vPath+'SL_KEEPING.bcp') then
      begin
        ExecQuery('delete from SL_KEEPING',[],true);
        vResult := GetDosOutput(Format('bcp %s',[GetBcpTable('SL_KEEPING')]), vBcpExeFilePath);
        LogSave('BCP 복원(SL_KEEPING)', vResult);
//        ExecuteProgram(vBcpExeFilePath, 'bcp.exe', GetBcpTable('SL_KEEPING'), true);
      end;
    end;

    Screen.Cursor := crDefault;
    MsgBox('복원을 완료하였습니다');
  except
    on E: Exception do
    begin
//      RollBackTrans;
      Screen.Cursor := crDefault;
      MsgBox(E.Message);
    end;
  end;
end;

procedure TSystemDBBackupForm.DeliveryOrderDeleteButtonClick(Sender: TObject);
begin
  inherited;
  if not AskBox('현재 배달 주문 중인 내역을 삭제하시겠습니까?.') then
    Exit;

  if not AskBox('삭제된 자료는 복구할 수 없습니다.'+#13+'정말 삭제하시겠습니까?') then
    Exit;

  try
    BeginTrans;
    ExecQuery('delete SL_ORDER_H   where DS_ORDER = ''D'' ',[], false);
    ExecQuery('delete SL_ORDER_D   where DS_ORDER = ''D'' ',[], false);
    ExecQuery('delete SL_ORDER_C   where DS_ORDER = ''D'' ',[], false);
    ExecQuery('delete SL_ORDER_PRT where DS_ORDER = ''D'' ',[], false);
    ExecQuery('delete SL_ORDER_KDS where DS_ORDER = ''D'' ',[], false);
    ExecQuery('delete SL_DELIVERY where DS_STEP not in (''A'',''R'',''C'') ',[], false);

    ExecQuery('insert into DELETE_LOG(DELETE_DATE, DS_TYPE) '
             +'               values(GetDate(), -2)',
             [], false);
    CommitTrans;
    MsgBox('자료가 삭제되었습니다.');
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox('작업을 완료하지 못했습니다.'#13+E.Message);
      Exit;
    end;
  end;

end;

procedure TSystemDBBackupForm.ButtonEnable;
var
  vIndex: Integer;
begin
  case Pager.ActivePageIndex of
    0 : // 백업
        begin
          ButtonToolBarSearchButton.Enabled := false;
          ButtonToolBarDeleteButton.Enabled := false;
        end;
    1 : // 테이블별 삭제
        begin
          ButtonToolBarSearchButton.Enabled := false;
          ButtonToolBarDeleteButton.Enabled := true;
        end;
    3 : // 건별 삭제
        begin
          ButtonToolBarSearchButton.Enabled := true;
          ButtonToolBarDeleteButton.Enabled := true;
        end;
  end;
end;

function TSystemDBBackupForm.GetBCPPath: string;
var
  vSQLVersion: string;
  vI         : Integer;
  v64Bit     : Boolean;
begin
  Result := EmptyStr;

  // Sql Server 버전을 알아낸다
  vSQLVersion := EmptyStr;
  OpenQuery('select @@VERSION ', []);
  try
    if not Query.Eof then
      vSQLVersion := Query.Fields[0].AsString;
  finally
    FinishQuery;
  end;

  // bcp.exe 패스를 리턴한다
  if vSQLVersion <> EmptyStr then
  begin
    vI     := StrToInt(Copy(vSQLVersion, POS('-',vSQLVersion)+2, POS('.',vSQLVersion)-POS('-',vSQLVersion)-2)+'0');
    //SQL 2014일때
    if vI = 120 then
      Result := 'C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\110\Tools\Binn\'
    else
    begin
      v64Bit := Pos('(X64)', UpperCase(vSQLVersion)) > 0;
      if v64Bit then
      begin
        Result := Format('C:\Program Files\Microsoft SQL Server\%d\Tools\Binn\',[vI]);
        if not FileExists(Result+'bcp.exe') then
          Result := Format('C:\Program Files (x86)\Microsoft SQL Server\%d\Tools\Binn\',[vI]);
      end
      else
        Result := Format('C:\Program Files\Microsoft SQL Server\%d\Tools\Binn\',[vI]);
    end;
  end;
end;

end.
