unit HeadStoreMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxGridCustomTableView, cxGridTableView, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, cxCurrencyEdit, StrUtils, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  THeadStoreMenuForm = class(TInheritGridEditForm)
    GridTableViewStoreCode: TcxGridColumn;
    GridTableViewStoreName: TcxGridColumn;
    Grid1: TcxGrid;
    GridTableView1: TcxGridTableView;
    cxGridColumn2: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Type: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    procedure GridTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
  end;

var
  HeadStoreMenuForm: THeadStoreMenuForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ THeadStoreMenuForm }
function THeadStoreMenuForm.DoSearch: Boolean;
begin
  if ConditionToolBarEdit.Text = '' then
    OpenQuery('select CD_STORE, '
             +'       NM_STORE '
             +'  from MS_STORE  '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE <> :P1 '
             +'   and YN_USE = ''Y'' '
             +' order by CD_STORE ',
             [HeadStoreCode,
              StandardStore])
  else
    OpenQuery('select a.CD_STORE, '
             +'       a.NM_STORE '
             +'  from MS_STORE a inner join  '
             +'      (select CD_STORE '
             +'         from MS_MENU '
             +'        where CD_HEAD =:P0 '
             +'          and NM_MENU like ConCat(''%'',:P2,''%'') '
             +'          and YN_USE = ''Y'' '
             +'        group by CD_STORE) as b on b.CD_STORE = a.CD_STORE '
             +' where a.CD_HEAD  = :P0 '
             +'   and a.CD_STORE <> :P1 '
             +'   and a.YN_USE = ''Y'' '
             +' order by a.CD_STORE ',
             [HeadStoreCode,
              StandardStore,
              ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadStoreMenuForm.GridTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableView1Type.Index] = '매장메뉴' then
    AStyle := StyleFontRed;
end;

procedure THeadStoreMenuForm.DoGridLink;
begin
  inherited;
  OpenQuery('select CD_MENU, '
           +'       NM_MENU, '
           +'       PR_SALE, '
           +'       case when (ifnull(CD_MENU_HEAD,'''') <> '''') or (Left(OPTIONS,1) = ''1'') then ''본사메뉴'' else ''매장메뉴'' end as DS_TYPE, '
           +'       DT_INSERT '
           +'  from MS_MENU '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and YN_USE   =''Y'' '
           +Ifthen(ConditionToolBarEdit.Text <> '', Format(' and NM_MENU like ConCat(''%%'',''%s'',''%%'') ',[ConditionToolBarEdit.Text]), '')
           +' order by CD_MENU ',
           [HeadStoreCode,
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index]]);
  DM.ReadQuery(Query, GridTableView1);
  MainPanel.Enabled := true;
end;



end.
