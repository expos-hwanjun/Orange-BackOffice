unit CodeBaeminMenuLink;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter,
  cxButtonEdit, Vcl.StdCtrls, cxCurrencyEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeBaeminMenuLinkForm = class(TInheritGridEditForm)
    GridTableViewBaeminMenu: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewMenuCode: TcxGridColumn;
    BaeminMenueEdit: TcxTextEdit;
    DCTimeLabel: TLabel;
    Label1: TLabel;
    MenuCodeEdit: TcxButtonEdit;
    MenuNameEdit: TcxTextEdit;
    GridTableViewOrgMenuCode: TcxGridColumn;
    procedure MenuCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure MenuCodeEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure MenuCodeEditPropertiesChange(Sender: TObject);
    procedure GridTableViewCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
  private
    function  SearchMenu(aMenu: string = ''): string;
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  CodeBaeminMenuLinkForm: TCodeBaeminMenuLinkForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}

{ TCodeBaeminMenuLinkForm }

procedure TCodeBaeminMenuLinkForm.ButtonToolBarDeleteButtonClick(
  Sender: TObject);
begin
//  inherited;
  if not AskBox('선택하신 내역을 삭제하시겠습니까?') then Exit;
  DoDelete;
end;

function TCodeBaeminMenuLinkForm.DoDelete: Boolean;
var vCode :String;
    vIndex :Integer;
begin
  if isMultiMode then
  begin
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
    begin
      ExecQuery('delete '
               +'  from MS_MENU_BAEMIN '
               +' where CD_HEAD   =:P0 '
               +'   and CD_STORE  =:P1 '
               +'   and NM_BAEMIN =:P2 '
               +'   and CD_MENU   =:P3;',
               [HeadStoreCode,
                StoreCode,
                String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewBaeminMenu.Index]),
                String(GridTableView.Controller.SelectedRows[vIndex].Values[GridTableViewOrgMenuCode.Index])],false);

    end;
    Result := ExecQuery('',[],true);
    if Result then
      GridTableView.Controller.DeleteSelection;
  end
  else
  begin
    Result := ExecQuery('delete '
                       +'  from MS_MENU_BAEMIN '
                       +' where CD_HEAD   =:P0 '
                       +'   and CD_STORE  =:P1 '
                       +'   and NM_BAEMIN =:P2 '
                       +'   and CD_MENU   =:P3;',
                       [HeadStoreCode,
                        StoreCode,
                        BaeminMenueEdit.Text,
                        NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewOrgMenuCode.Index],'')],true);
    if Result then
      GridTableView.Controller.DeleteSelection;
  end;
end;

procedure TCodeBaeminMenuLinkForm.DoGridLink;
begin
  inherited;
  BaeminMenueEdit.Text := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBaeminMenu.Index],'');
  MenuCodeEdit.Text    := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index],'');
  MenuNameEdit.Text    := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuName.Index],'');
end;

function TCodeBaeminMenuLinkForm.DoSave: Boolean;
begin
  Result := false;
  if BaeminMenueEdit.Text = '' then
  begin
    MsgBox('매장메뉴를 선택하세요');
    Exit;
  end;

  ExecQuery('update MS_MENU_BAEMIN '
           +'   set CD_MENU   =:P3 '
           +' where CD_HEAD   =:P0 '
           +'   and CD_STORE  =:P1 '
           +'   and NM_BAEMIN =:P2;',
           [HeadStoreCode,
            StoreCode,
            BaeminMenueEdit.Text,
            MenuCodeEdit.Text]);

  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewBaeminMenu.Index] := BaeminMenueEdit.Text;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuCode.Index]   := MenuCodeEdit.Text;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMenuName.Index]   := MenuNameEdit.Text;
  Result := true;
end;

function TCodeBaeminMenuLinkForm.DoSearch: Boolean;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0: OpenQuery('select NM_BAEMIN, '
                +'       CD_MENU as CD_MENU_ORG '
                +'  from MS_MENU_BAEMIN  '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and Left(CD_MENU,2) = ''XX'' ',
                [HeadStoreCode,
                 StoreCode]);

    1: OpenQuery('select a.NM_BAEMIN, '
                +'       b.NM_MENU, '
                +'       b.CD_MENU, '
                +'       a.CD_MENU as CD_MENU_ORG '
                +'  from MS_MENU_BAEMIN a left outer join '
                +'       MS_MENU        b on b.CD_HEAD  = a.CD_HEAD '
                +'                       and b.CD_STORE = a.CD_STORE '
                +'                       and b.CD_MENU  = a.CD_MENU '
                +' where a.CD_HEAD  =:P0 '
                +'   and a.CD_STORE =:P1 '
                +' order by a.NM_BAEMIN ',
                [HeadStoreCode,
                 StoreCode]);

    2: OpenQuery('select a.NM_BAEMIN, '
                +'       b.NM_MENU, '
                +'       b.CD_MENU, '
                +'       a.CD_MENU as CD_MENU_ORG '
                +'  from MS_MENU_BAEMIN a inner join '
                +'       MS_MENU        b on b.CD_HEAD  = a.CD_HEAD '
                +'                       and b.CD_STORE = a.CD_STORE '
                +'                       and b.CD_MENU  = a.CD_MENU '
                +' where a.CD_HEAD  =:P0 '
                +'   and a.CD_STORE =:P1 '
                +' order by a.NM_BAEMIN ',
                [HeadStoreCode,
                 StoreCode]);
  end;
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TCodeBaeminMenuLinkForm.GridTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  if isMultiMode then
  begin
    MainPanel.Enabled := false;
    isChanged         := false;
  end
  else
    MainPanel.Enabled := true;
end;

procedure TCodeBaeminMenuLinkForm.MenuCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchMenu('');
end;

procedure TCodeBaeminMenuLinkForm.MenuCodeEditPropertiesChange(Sender: TObject);
begin
  inherited;
  if MenuCodeEdit.Text <> MenuNameEdit.Hint then
    MenuNameEdit.Clear;
end;

procedure TCodeBaeminMenuLinkForm.MenuCodeEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vTemp :String;
begin
  inherited;
  DisplayValue := SearchMenu(DisplayValue);
end;

function TCodeBaeminMenuLinkForm.SearchMenu(aMenu: string): string;
var vIndex :Integer;
    vQty   :Integer;
begin
  Result := EmptyStr;

  // 상품코드 조회 폼을 불러온다
  with THelpForm.Create(Self) do
    try
      Caption := '메뉴 조회';
      GridTableViewCode.Caption  := '메뉴코드';
      GridTableViewCode.Width    := 110;
      GridTableViewCode.Properties.Alignment.Horz  := taLeftJustify;
      GridTableViewName1.Caption := '메뉴명';
      GridTableViewName1.Width   := 210;
      GridTableViewName2.Caption := '구분';
      GridTableViewName2.Width   := 70;
      GridTableViewName2.Visible := true;
      GridTableViewName2.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;

      GridTableViewName3.Caption := '판매단가';
      GridTableViewName3.Width   := 100;
      GridTableViewName2.Visible := true;
      GridTableViewName3.PropertiesClassName       := 'TcxCurrencyEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taRightJustify;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).DisplayFormat := fmtComma;
      TcxCustomCurrencyEditProperties(GridTableViewName3.Properties).ReadOnly      := true;

      SearchText := aMenu;
      SQLText    := 'select CD_MENU, '                                //0
                   +'       NM_MENU, '
                   +'       case DS_MENU_TYPE when ''N'' then ''일반'' when ''I'' then ''아이템'' when ''C'' then ''코스'' when ''S'' then ''세트'' when ''G'' then ''싯가'' when ''O'' then ''오픈세트'' end, '
                   +'       PR_SALE '                                             //1
                   +'  from MS_MENU  '
                   + 'where CD_HEAD   =:P0 '
                   +'   and CD_STORE  =:P1 '
                   +'   and (CD_MENU like ConCat(:P2,''%'') or NM_MENU like ConCat(''%'',:P2,''%'') ) '
                   +'   and YN_USE   = ''Y'' '
                   +' order by  CD_MENU';

      IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        Result := Code;
        MenuCodeEdit.Text := Code;
        MenuNameEdit.Hint := Code;
        MenuNameEdit.Text := Names[0];
        isChanged := true;
      end;
    finally
      Free;
    end;
end;

end.
