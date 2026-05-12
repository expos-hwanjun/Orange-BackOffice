unit HeadMenuLink;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxCurrencyEdit, cxButtonEdit, cxGridCustomTableView,
  cxGridTableView, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView, cxGrid,
  cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  cxDBData, cxGridDBTableView, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager,
  AdvOfficePagerStylers;

type
  THeadMenuLinkForm = class(TInheritGridEditForm)
    GridTableViewMenuCode: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewSalePrice: TcxGridColumn;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    GridTableView1StoreCode: TcxGridColumn;
    GridTableView1StoreName: TcxGridColumn;
    GridTableView1SalePrice: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    GridTableView1MenuCode: TcxGridColumn;
    GridTableView1MenuName: TcxGridColumn;
    GridTableView1RowState: TcxGridColumn;
    GridTableView1OrgMenuCode: TcxGridColumn;
    procedure GridTableView1MenuCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridTableView1MenuCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure GridTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridTableView1CanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
  private
    function  SearchMenu(aType,aMenuCode: string): string;    // A이 Append
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  HeadMenuLinkForm: THeadMenuLinkForm;

implementation
uses Common, DBModule, Help;

{$R *.dfm}

{ THeadMenuLinkForm }

procedure THeadMenuLinkForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  SearchMenu('A','');
end;

procedure THeadMenuLinkForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;
  ButtonToolBarNewButton.Enabled := false;
end;

procedure THeadMenuLinkForm.DoGridLink;
begin
  inherited;
  OpenQuery('select a.CD_STORE, '
           +'       a.NM_STORE, '
           +'       b.CD_MENU, '
           +'       b.NM_MENU, '
           +'       b.PR_SALE, '
           +'       b.CD_MENU as CD_MENU_ORG, '
           +'       ''rsNormal'' as ROW_STATE '
           +'  from MS_STORE as a left outer join '
           +'       MS_MENU  as b on b.CD_HEAD  = a.CD_HEAD '
           +'                    and b.CD_STORE = a.CD_STORE '
           +'                    and b.CD_MENU_HEAD = :P2 '
           +' where a.CD_HEAD    =:P0 '
           +'   and a.CD_STORE <> :P1 '
           +'   and a.YN_USE     =''Y'' '
           +' order by a.CD_STORE ',
           [HeadStoreCode,
            StandardStore,
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]]);

  DM.ReadQuery(Query, GridTableView1);
end;

function THeadMenuLinkForm.DoSave: Boolean;
var vIndex :Integer;
begin
  for vIndex := 0 to GridTableView1.DataController.RecordCount-1 do
  begin
    if GridTableView1.DataController.Values[vIndex, GridTableView1RowState.Index] = rsNormal then
      Continue;

    if NVL(GridTableView1.DataController.Values[vIndex, GridTableView1MenuCode.Index],'') <> '' then
      ExecQuery('update MS_MENU '
               +'   set CD_MENU_HEAD =:P3 '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MENU  =:P2;',
               [HeadStoreCode,
                GridTableView1.DataController.Values[vIndex, GridTableView1StoreCode.Index],
                GridTableView1.DataController.Values[vIndex, GridTableView1MenuCode.Index],
                GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]],false)
    else
      ExecQuery('update MS_MENU '
               +'   set CD_MENU_HEAD ='''' '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MENU  =:P2;',
               [HeadStoreCode,
                GridTableView1.DataController.Values[vIndex, GridTableView1StoreCode.Index],
                GridTableView1.DataController.Values[vIndex, GridTableView1OrgMenuCode.Index]],false);

  end;

  if TempSQL <> '' then
    Result := ExecQuery('',[],true)
  else
    Result := True;
end;

function THeadMenuLinkForm.DoSearch: Boolean;
begin
  if ConditionToolBarComboBox.ItemIndex = 0 then
    OpenQuery('select CD_MENU, '
             +'       NM_MENU, '
             +'       YN_USE '
             +'  from MS_MENU '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and (CD_MENU = :P2 or NM_MENU like ConCat(''%'',:P2,''%'')) '
             +'   and YN_USE   =''Y'' '
             +' order by CD_MENU ',
             [HeadStoreCode,
              StandardStore,
              ConditionToolBarEdit.Text])
  else
    OpenQuery('select a.CD_MENU, '
             +'       a.NM_MENU, '
             +'       a.YN_USE '
             +'  from MS_MENU as a inner join '
             +'       MS_MENU as b on b.CD_HEAD   = a.CD_HEAD '
             +'                   and b.CD_STORE <> :P1 '
             +'                   and Ifnull(b.CD_MENU_HEAD,'''') = '''' '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE = :P1 '
             +'   and (a.CD_MENU = :P2 or a.NM_MENU like ConCat(''%'',:P2,''%'')) '
             +'   and a.YN_USE   =''Y'' '
             +' group by a.CD_MENU '
             +' order by a.CD_MENU ',
             [HeadStoreCode,
              StandardStore,
              ConditionToolBarEdit.Text]);
  Result :=  DM.ReadQuery(Query, GridTableView);
end;

procedure THeadMenuLinkForm.GridTableView1CanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  ButtonToolBarNewButton.Enabled := true;
end;

procedure THeadMenuLinkForm.GridTableView1MenuCodePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchMenu('N','');
end;

procedure THeadMenuLinkForm.GridTableView1MenuCodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue = '' then
  begin
    GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1MenuCode.Index]         := '';
    GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1MenuName.Index]         := '';
    GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1SalePrice.Index]        := 0;
    GridTableView1.DataController.Values[GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1RowState.Index]         := rsUpdate;
    isChanged := true;
  end
  else
    SearchMenu('N',DisplayValue);
end;

procedure THeadMenuLinkForm.GridTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if NVL(ARecord.Values[GridTableView1MenuCode.Index],'') = '' then
    AStyle := styleFontRed;

end;

procedure THeadMenuLinkForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarNewButton.Enabled := false;
end;

function THeadMenuLinkForm.SearchMenu(aType,aMenuCode: string): string;
var vIndex :Integer;
begin
  Result := EmptyStr;

  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '매장메뉴 조회';
      GridTableViewCode.Caption  := '메뉴코드';
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := '메뉴명';
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := '판매단가';
      GridTableViewName2.Width   := 100;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName2.Properties).ReadOnly      := true;

      SearchText := aMenuCode;
      SQLText    := 'select CD_MENU, '
                   +'       NM_MENU, '
                   +'       PR_SALE '
                   +'  from MS_MENU '
                   +' where CD_HEAD  =:P0 '
                   +Format('   and CD_STORE =''%s'' ',[Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1StoreCode.Index]])
                   +'   and NM_MENU like ConCat(''%'',:P2,''%'') '
                   +'order by  CD_MENU';

      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Result := Code;
        if aType = 'A' then
        begin
          Self.GridTableView1.DataController.AppendRecord;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1StoreCode.Index]        := Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1StoreCode.Index];
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1StoreName.Index]        := Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1StoreName.Index];
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1MenuCode.Index]         := Code;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1MenuName.Index]         := Names[0];
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1OrgMenuCode.Index]      := Code;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1SalePrice.Index]        := StrToInt(Names[1]);
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.RecordCount-1, Self.GridTableView1RowState.Index]         := rsUpdate;
        end
        else
        begin
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1MenuCode.Index]         := Code;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1MenuName.Index]         := Names[0];
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1SalePrice.Index]        := StrToInt(Names[1]);
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1OrgMenuCode.Index]      := Code;
          Self.GridTableView1.DataController.Values[Self.GridTableView1.DataController.GetFocusedRecordIndex, Self.GridTableView1RowState.Index]         := rsUpdate;
        end;
        isChanged := true;
      end
      else
         Self.GridTableView.Controller.FocusedColumn := Self.GridTableView1MenuCode;
    finally
      Free;
    end;
end;

end.
