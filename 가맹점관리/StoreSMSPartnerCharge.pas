unit StoreSMSCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, IPPeerClient, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxButtonEdit, cxCurrencyEdit, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxDropDownEdit,
  cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, Math, StrUtils;

type
  TStoreSMSChargeForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewCustomerCode: TcxGridColumn;
    GridTableViewCustomerName: TcxGridColumn;
    GridTableViewChargeAmt: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewProgram: TcxGridColumn;
    GridTableViewReceiveAmt: TcxGridColumn;
    GridTableViewDcRate: TcxGridColumn;
    GridTableViewChargeType: TcxGridColumn;
    GridTableViewSeq: TcxGridColumn;
    GridTableViewInsertDate: TcxGridColumn;
    GridTableViewUpdateDate: TcxGridColumn;
    GridTableViewUser: TcxGridColumn;
    procedure GridTableViewGoodsCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerBeforePost(
      ADataController: TcxCustomDataController);
    procedure GridTableViewDataControllerDataChanged(Sender: TObject);
    procedure GridTableViewCustomerCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Exec_TimerTimer(Sender: TObject);
  private
    TempJsonURL :String;
    LinkRowIndex :Integer;
    function SearchCustomer(aSearch:String=''):String;
  protected
    function DoSearch:Boolean; override;
    function DoSave: Boolean; override;
    function DoDelete:Boolean; override;
  end;

var
  StoreSMSChargeForm: TStoreSMSChargeForm;

implementation
uses Common, DBModule, Help;

{$R *.dfm}

function TStoreSMSChargeForm.DoDelete: Boolean;
var vIndex :Integer;
    vRowIndex :Integer;
begin
  // 선택한 레코드를 삭제한다
  try
    //신규로 입력한 레코드는 삭제한다
    if GridTableView.DataController.Values[GridTableView.Controller.FocusedRecordIndex, GridTableViewRowState.Index] = rsInsert then
      GridTableView.DataController.DeleteFocused
    else
    begin
      //불로온 레코드는 마지막레코드로 옮기고 State만 변경한다
      vRowIndex := GridTableView.Controller.FocusedRecordIndex;
      GridTableView.DataController.Values[GridTableView.Controller.FocusedRecordIndex, GridTableViewRowState.Index] := rsDelete;
      GridTableView.DataController.AppendRecord;
      for vIndex := 0 to GridTableView.ColumnCount-1 do
        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vIndex] := GridTableView.DataController.Values[vRowIndex, vIndex];
      GridTableView.DataController.DeleteRecord(vRowIndex);
    end;
    isChanged := true;
    Result := true;
  except
    Result := false;
  end;
end;

function TStoreSMSChargeForm.DoSave: Boolean;
var vIndex :Integer;
begin
  jsonDBURL := jsonSMSDBURL;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
    begin
      ExecQuery('delete from SMS_CHARGE '
               +' where CD_CUSTOMER =:P0 '
               +'   and YMD_CHARGE  =:P1 '
               +'   and SEQ         =:P2;',
               [GridTableView.DataController.Values[vIndex, GridTableViewCustomerCode.Index],
                DtoS(ConditionToolBarFromDateEdit.Date),
                GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index]],
                False);
    end
    else
    begin
      ExecQuery(Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert,
                'insert into SMS_CHARGE(CD_CUSTOMER, YMD_CHARGE, SEQ, DS_CHARGE, AMT_RECEIVE, USER_ID, NOTE) '
               +'            values (:P0, '
               +'                    :P1, '
               +'                    (select Ifnull(Max(SEQ),0)+1 '
               +'                       from SMS_CHARGE as s '
               +'                      where CD_CUSTOMER =:P0 '
               +'                        and YMD_CHARGE  =:P1), '
               +'                    :P3, '
               +'                    :P4, '
               +'                    :P5, '
               +'                    :P6);',
                ' update SMS_CHARGE '
               +'    set AMT_RECEIVE   = :P4, '
               +'        USER_ID       = :P5, '
               +'        NOTE          = :P6 '
               +'  where CD_CUSTOMER   =:P0 '
               +'    and YMD_CHARGE    =:P1 '
               +'    and SEQ           =:P2;'),
              [GridTableView.DataController.Values[vIndex, GridTableViewCustomerCode.Index],
               DtoS(ConditionToolBarFromDateEdit.Date),
               GridTableView.DataController.Values[vIndex, GridTableViewSeq.Index],
               'P',
               NVL(GridTableView.DataController.Values[vIndex, GridTableViewReceiveAmt.Index],0),
               UserCode,
               Nvl(GridTableView.DataController.Values[vIndex, GridTableViewRemark.Index], '')],
               false);
    end;
  end;
  Result := ExecQuery(TempSQL, [], true);
  if Result then
  begin
    GridTableView.DataController.RecordCount := 0;
    GridTableView.DataController.EndUpdateFields;
  end;
end;

function TStoreSMSChargeForm.DoSearch: Boolean;
begin
  jsonDBURL := jsonSMSDBURL;
  try
    OpenQuery('select a.CD_CUSTOMER, '
             +'       b.NM_CUSTOMER, '
             +'       a.SEQ, '
             +'       case b.DS_CUSTOMER when ''O'' then ''CloudOrange'' when ''E'' then ''ERP'' when ''M'' then ''Mart'' when ''T'' then ''Themark'' end DS_PROGRAM, '
             +'       case when a.DS_CHARGE = ''A'' then ''계좌입금'' else ''프로그램충전'' end DS_CHARGE, '
             +'       a.AMT_CHARGE, '
             +'       a.AMT_RECEIVE, '
             +'       a.DC_RATE, '
             +'       a.NOTE as REMARK, '
             +'       a.USER_ID, '
             +'       a.DT_INSERT, '
             +'       a.DT_CHANGE, '
             +'       ''rsNormal'' as ROW_STATE '
             +'  from SMS_CHARGE   as a inner join '
             +'       SMS_CUSTOMER as b on b.CD_CUSTOMER = a.CD_CUSTOMER '
             +' where a.YMD_CHARGE = :P0 '
             +' order by a.SEQ ',
             [DtoS(ConditionToolBarFromDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    jsonDBURL := jsonOrgDBURL;
  end;
end;

procedure TStoreSMSChargeForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  GridTableView.Controller.FocusedRecordIndex := LinkRowIndex;
end;

procedure TStoreSMSChargeForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
end;

procedure TStoreSMSChargeForm.GridTableViewCustomerCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vIndex :Integer;
begin
  inherited;
  // 상품코드를 검증한다
  jsonDBURL := jsonBaseURL;
  if DisplayValue <> EmptyStr then
  begin
    if DisplayValue <> '' then
    begin
      try
      OpenQuery('select a.CD_CUSTOMER, '
               +'       a.NM_CUSTOMER, '
               +'       case a.DS_CUSTOMER when ''O'' then ''CloudOrange'' when ''E'' then ''ERP'' when ''M'' then ''Mart'' when ''T'' then ''Themark'' end DS_PROGRAM, '
               +'       ConCat(a.CD_PARTNER,''-'',b.NM_PARTNER) as PARTNER '
               +'  from CUSTOMER a left outer join '
               +'       PARTNER  b on b.CD_PARTNER = a.CD_PARTNER '
               +' where (a.CD_CUSTOMER =:P0 or a.NM_CUSTOMER  like ConCat(''%'',:P0,''%'')) '
               +'   and ((a.DS_CUSTOMER = ''O'' and Length(a.CD_CUSTOMER) = 8) or a.DS_CUSTOMER in (''E'',''M'',''T'')) '
               +'   and a.DS_STATUS = ''0'' '
               +'order by a.CD_CUSTOMER',
              [DisplayValue]);
        if Query.RecordCount = 1 then
        begin
          vIndex := GridTableView.DataController.FilteredIndexByRecordIndex[GridTableView.DataController.FindRecordIndexByText(0, GridTableViewCustomerCode.Index, Query.FieldByName('CD_CUSTOMER').AsString, false, false, true)];
          if vIndex >= 0 then
          begin
            GridTableView.ViewData.Records[vIndex].Selected := not GridTableView.ViewData.Records[vIndex].Selected and GridTableView.ViewData.Records[vIndex].IsData;
            GridTableView.DataController.Cancel;
            LinkRowIndex := vIndex;
            Exec_Timer.Enabled := true;
            Exit;
          end;

          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCustomerCode.Index] := Query.FieldByName('CD_CUSTOMER').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCustomerName.Index] := Query.FieldByName('NM_CUSTOMER').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewProgram.Index]      := Query.FieldByName('DS_PROGRAM').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewRowState.Index]     := rsInsert;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewChargeAmt.Index]    := 0;
          isChanged := true;
          Exit;
        end;
      finally
        FinishQuery;
      end;

      DisplayValue := SearchCustomer(DisplayValue);
      if DisplayValue = EmptyStr then
      begin
        ErrorText := EmptyStr;
        Error := True;
        Keybd_Event(VK_ESCAPE,VK_ESCAPE, 0, 0);
      end;
    end
    else
    begin
      DisplayValue := SearchCustomer(DisplayValue);
      if DisplayValue = EmptyStr then
      begin
        ErrorText := EmptyStr;
        Error := True;
        Keybd_Event(VK_ESCAPE,VK_ESCAPE, 0, 0);
      end;
    end;
  end;

end;

procedure TStoreSMSChargeForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if not isLoading then
    isChanged := true;
end;

procedure TStoreSMSChargeForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
end;

procedure TStoreSMSChargeForm.GridTableViewDataControllerDataChanged(
  Sender: TObject);
begin
  inherited;
  isChanged := true;
end;

procedure TStoreSMSChargeForm.GridTableViewGoodsCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SearchCustomer <> EmptyStr then
    Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
end;

function TStoreSMSChargeForm.SearchCustomer(aSearch: String):String;
begin
  Result := '';
  jsonDBURL := jsonBaseURL;
  with THelpForm.Create(Self) do
    try
      Caption                    := '매장 조회';
      GridTableViewCode.Caption  := '매장 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '매장 이름';
      GridTableViewName1.Width   := 320;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '솔루션';
      GridTableViewName2.Width   := 100;
      GridTableViewName3.Visible := true;
      GridTableViewName3.Caption := '협력사';
      GridTableViewName3.Width   := 200;

      SQLText    := 'select a.CD_CUSTOMER, '
                   +'       a.NM_CUSTOMER, '
                   +'       case a.DS_CUSTOMER when ''O'' then ''CloudOrange'' when ''E'' then ''ERP'' when ''M'' then ''Mart'' when ''T'' then ''Themark'' end DS_PROGRAM, '
                   +'       ConCat(a.CD_PARTNER,''-'',b.NM_PARTNER) as PARTNER '
                   +'  from CUSTOMER a left outer join '
                   +'       PARTNER  b on b.CD_PARTNER = a.CD_PARTNER '
                   +' where (a.CD_CUSTOMER =:P2 or a.NM_CUSTOMER  like ConCat(''%'',:P2,''%'')) '
                   +'   and ((a.DS_CUSTOMER = ''O'' and Length(a.CD_CUSTOMER) = 8) or a.DS_CUSTOMER in (''E'',''M'',''T'')) '
                   +'   and a.DS_STATUS = ''0'' '
                   +'order by a.CD_CUSTOMER';
      SearchText := aSearch;
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewCustomerCode.Index] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewCustomerName.Index] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewProgram.Index]      := Names[1];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewRowState.Index]     := rsInsert;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewChargeAmt.Index]    := 0;
        if aSearch = '' then
          Self.GridTableView.Controller.FocusedColumn := Self.GridTableViewReceiveAmt;
        isChanged := true;
      end;
    finally
      Free;
      jsonDBURL := TempJsonURL;
    end;
end;

end.
