unit StoreCustomerLicense;

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
  TStoreCustomerLicenseForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewCustomerCode: TcxGridColumn;
    GridTableViewCustomerName: TcxGridColumn;
    GridTableViewMonth: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    GridTableViewRowState: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewPayAmt: TcxGridColumn;
    GridTableViewAspAmt: TcxGridColumn;
    GridTableViewInsertDate: TcxGridColumn;
    GridTableViewUpdateDate: TcxGridColumn;
    GridTableViewUser: TcxGridColumn;
    GridTableViewPayType: TcxGridColumn;
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
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    LinkRowIndex :Integer;
    function SearchCustomer(aSearch:String=''):String;
  protected
    function DoSearch:Boolean; override;
    function DoSave: Boolean; override;
    function DoDelete:Boolean; override;
  end;

var
  StoreCustomerLicenseForm: TStoreCustomerLicenseForm;

implementation
uses Common, DBModule, Help;

{$R *.dfm}

function TStoreCustomerLicenseForm.DoDelete: Boolean;
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

function TStoreCustomerLicenseForm.DoSave: Boolean;
var vIndex :Integer;
begin
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsNormal then Continue;

    if GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsDelete then
    begin
      ExecQuery('delete from CUSTOMER_PAY '
               +' where CD_CUSTOMER =:P0 '
               +'   and YMD_PAY     =:P1;',
               [GridTableView.DataController.Values[vIndex, GridTableViewCustomerCode.Index],
                DtoS(ConditionToolBarFromDateEdit.Date)],
                false,RestBaseURL);
    end
    else
    begin
      ExecQuery(Ifthen(GridTableView.DataController.Values[vIndex, GridTableViewRowState.Index] = rsInsert,
                'insert into CUSTOMER_PAY(CD_CUSTOMER, YMD_PAY, AMT_PAY, REMARK, ID_USER, DS_PAY) '
               +'            values (:P0, '
               +'                    :P1, '
               +'                    :P2, '
               +'                    :P3, '
               +'                    :P4, '
               +'                    ''P'');',
                ' update CUSTOMER_PAY '
               +'    set AMT_PAY       = :P2, '
               +'        REMARK        = :P3, '
               +'        ID_USER       = :P4 '
               +'  where CD_CUSTOMER   =:P0 '
               +'    and YMD_PAY       =:P1;'),
              [GridTableView.DataController.Values[vIndex, GridTableViewCustomerCode.Index],
               DtoS(ConditionToolBarFromDateEdit.Date),
               NVL(GridTableView.DataController.Values[vIndex, GridTableViewPayAmt.Index],0),
               Nvl(GridTableView.DataController.Values[vIndex, GridTableViewRemark.Index], ''),
               UserCode],
               false,RestBaseURL);
    end;
  end;
  Result := ExecQuery(TempSQL, [], true);
  if Result then
  begin
    GridTableView.DataController.RecordCount := 0;
    GridTableView.DataController.EndUpdateFields;
  end;
end;

function TStoreCustomerLicenseForm.DoSearch: Boolean;
begin
  OpenQuery('select a.CD_CUSTOMER, '
           +'       b.NM_CUSTOMER, '
           +'       case when a.DS_PAY = ''B'' then ''계좌입금'' else ''프로그램'' end as DS_PAY, '
           +'       a.AMT_PAY, '
           +'       a.MONTH_COUNT, '
           +'       b.AMT_ASP, '
           +'       a.REMARK, '
           +'       a.ID_USER, '
           +'       a.DT_INSERT, '
           +'       a.DT_CHANGE, '
           +'       ''rsNormal'' as ROW_STATE '
           +'  from CUSTOMER_PAY  as a inner join '
           +'       CUSTOMER      as b on b.CD_CUSTOMER = a.CD_CUSTOMER '
           +' where a.YMD_PAY = :P0 '
           +' order by a.DT_INSERT ',
           [DtoS(ConditionToolBarFromDateEdit.Date)],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStoreCustomerLicenseForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  GridTableView.Controller.FocusedRecordIndex := LinkRowIndex;
end;

procedure TStoreCustomerLicenseForm.FormCreate(Sender: TObject);
begin
  inherited;
  DefaultDate := ddToday;
  GridTableViewRowState.DataBinding.AddToFilter(nil, foNotEqual, rsDelete);
  GridTableView.DataController.Filter.Active := true;
  isChanged := false;
end;

procedure TStoreCustomerLicenseForm.GridTableViewCustomerCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vIndex :Integer;
begin
  inherited;
  // 상품코드를 검증한다
  if DisplayValue <> EmptyStr then
  begin
    if DisplayValue <> '' then
    begin
      try
      OpenQuery('select CD_CUSTOMER, '
               +'       NM_CUSTOMER, '
               +'       AMT_ASP '
               +'  from CUSTOMER  '
               +' where (CD_CUSTOMER =:P0 or NM_CUSTOMER  like ConCat(''%'',:P0,''%'')) '
               +'   and ((DS_CUSTOMER = ''O'' and Length(CD_CUSTOMER) = 8) ) '
               +'   and DS_STATUS = ''0'' '
               +'   and DS_LICENSE = ''S'' '
               +'order by CD_CUSTOMER',
              [DisplayValue],false,RestBaseURL);
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
          DisplayValue := Query.FieldByName('CD_CUSTOMER').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCustomerCode.Index] := Query.FieldByName('CD_CUSTOMER').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewCustomerName.Index] := Query.FieldByName('NM_CUSTOMER').AsString;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewAspAmt.Index]       := Query.FieldByName('AMT_ASP').AsInteger;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewRowState.Index]     := rsInsert;
          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewPayAmt.Index]       := 0;
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

procedure TStoreCustomerLicenseForm.GridTableViewDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if not isLoading then
    isChanged := true;
end;

procedure TStoreCustomerLicenseForm.GridTableViewDataControllerBeforePost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  if ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] = rsNormal then
    ADataController.Values[ADataController.FocusedRecordIndex, GridTableViewRowState.Index] := rsUpdate;
end;

procedure TStoreCustomerLicenseForm.GridTableViewDataControllerDataChanged(
  Sender: TObject);
begin
  inherited;
  isChanged := true;
end;

procedure TStoreCustomerLicenseForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then
    ButtonToolBarDeleteButton.Enabled := false
  else
    ButtonToolBarDeleteButton.Enabled := not AFocusedRecord.IsNewItemRecord;
end;

procedure TStoreCustomerLicenseForm.GridTableViewGoodsCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SearchCustomer <> EmptyStr then
    Keybd_Event(VK_RETURN,VK_RETURN, 0, 0);
end;

function TStoreCustomerLicenseForm.SearchCustomer(aSearch: String):String;
begin
  Result := '';
  with THelpForm.Create(Self) do
    try
      Caption                    := '매장 조회';
      GridTableViewCode.Caption  := '매장 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '매장 이름';
      GridTableViewName1.Width   := 320;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '협력사';
      GridTableViewName4.Width   := 250;
      jsonHelpURL := RestBaseURL;

      SQLText    := 'select a.CD_CUSTOMER, '
                   +'       a.NM_CUSTOMER, '
                   +'       b.NM_PARTNER as PARTNER, '
                   +'       a.AMT_ASP '
                   +'  from CUSTOMER a left outer join '
                   +'       PARTNER  b on b.CD_PARTNER = a.CD_PARTNER '
                   +' where (a.CD_CUSTOMER =:P2 or a.NM_CUSTOMER  like ConCat(''%'',:P2,''%'')) '
                   +'   and ((a.DS_CUSTOMER = ''O'' and Length(a.CD_CUSTOMER) = 8)) '
                   +'   and a.DS_STATUS = ''0'' '
                   +'   and a.DS_LICENSE = ''S'' '
                   +'order by a.CD_CUSTOMER';
      SearchText := aSearch;
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewCustomerCode.Index] := Code;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewCustomerName.Index] := Names[0];
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewAspAmt.Index]       := StoI(Names[2]);
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewRowState.Index]     := rsInsert;
        Self.GridTableView.DataController.Values[Self.GridTableView.DataController.FocusedRecordIndex, Self.GridTableViewPayAmt.Index]    := 0;
        if aSearch = '' then
          Self.GridTableView.Controller.FocusedColumn := Self.GridTableViewPayAmt;
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

end.
