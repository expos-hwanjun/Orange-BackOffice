unit StockNotSurveyConfirm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxMaskEdit, cxCurrencyEdit,
  cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers,
  cxClasses, DBAccess, Uni, Data.DB, MemDS, cxTextEdit, cxDropDownEdit,
  cxCalendar, AdvGlowButton, cxButtonEdit, StrUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockNotSurveyConfirmForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewGoodsSpec: TcxGridColumn;
    GridTableViewStockQty: TcxGridColumn;
    GridTableViewLossQty: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewSurveyQty: TcxGridColumn;
    ConditionToolBarButtonEdit: TcxButtonEdit;
    ConditionToolBaComboBox: TcxComboBox;
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
  private
    function SearchCompany(aValue:String):String;
  protected
    function DoSearch:Boolean; override;
    function DoDelete: Boolean; override;                      // 삭제
    function DoSave:Boolean; override;
  end;

var
  StockNotSurveyConfirmForm: TStockNotSurveyConfirmForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}
procedure TStockNotSurveyConfirmForm.FormCreate(Sender: TObject);
var vCode : PStrPointer;
begin
  inherited;
  try
    OpenQuery('select CD_CLASS, '
             +'       NM_CLASS '
             +'  from MS_MENU_CLASS '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and Length(CD_CLASS) = 2 '
             +' order by CD_CLASS ',
             [HeadStoreCode,
              StoreCode]);
    ConditionToolBaComboBox.Properties.Items.Clear;
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBaComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    ConditionToolBaComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;
end;

procedure TStockNotSurveyConfirmForm.ButtonToolBarSearchButtonClick(
  Sender: TObject);
begin
  inherited;
  isChanged := GridTableView.DataController.RecordCount > 0;
end;

procedure TStockNotSurveyConfirmForm.ConditionToolBarButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchCompany('');
end;

procedure TStockNotSurveyConfirmForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  case ConditionToolBarComboBox.ItemIndex of
    0 :
    begin
      ConditionToolBarButtonEdit.Visible := false;
      ConditionToolBarEdit.Visible       := false;
      ConditionToolBaComboBox.Visible    := false;
    end;
    1 :
    begin
      ConditionToolBarButtonEdit.Visible := false;
      ConditionToolBarEdit.Visible       := false;
      ConditionToolBaComboBox.Visible    := true;
    end;
    2 :
    begin
      ConditionToolBarButtonEdit.Visible := true;
      ConditionToolBarEdit.Visible       := true;
      ConditionToolBaComboBox.Visible    := false;
    end;
  end;
end;

function TStockNotSurveyConfirmForm.DoDelete: Boolean;
var vIndex :Integer;
begin
  Result := false;
  if not AskBox('해당상품을 제외하시겠습니까?') then Exit;
  GridTableView.DataController.BeginUpdate;
  for vIndex := GridTableView.Controller.SelectedRowCount - 1 downto 0 do
    GridTableView.DataController.DeleteRecord(GridTableView.Controller.SelectedRows[vIndex].Index);
  GridTableView.Controller.ClearSelection;
  GridTableView.DataController.EndUpdate;
  Result := true;
end;

function TStockNotSurveyConfirmForm.DoSearch: Boolean;
var vWhere :String;
begin
  vWhere := EmptyStr;
  if (ConditionToolBarComboBox.ItemIndex = 1) and (GetStrPointerData(ConditionToolBaComboBox) <> '') then
    vWhere := Format(' and Left(a.CD_CLASS,2) = ''%s'' ', [GetStrPointerData(ConditionToolBaComboBox)])
  else if (ConditionToolBarComboBox.ItemIndex = 2) and (ConditionToolBarButtonEdit.Text <> '') then
    vWhere := Format(' and a.CD_TRDPL = ''%s'' ',[ConditionToolBarButtonEdit.Text]);

  OpenQuery('select   a.CD_MENU, '
           +'         a.NM_MENU, '
           +'         a.NM_SPEC, '
           +'         Ifnull(t.QTY_STOCK,0) as QTY_STOCK, '
           +'         0 as QTY_SURVEY, '
           +'         -Ifnull(t.QTY_STOCK,0) as QTY_ADJ '
           +'from     MS_MENU as a left outer join '
           +'        (select CD_GOODS, '
           +'                Sum(Ifnull(QTY_BASE,0)+Ifnull(QTY_STOCK,0)) as QTY_STOCK '
           +'           from '
           +'                (select CD_GOODS, '
           +'                        Ifnull(QTY_BASE,0) as QTY_BASE, '
           +'                        0 as QTY_STOCK '
           +'                   from SL_STOCK_MONTH  '
           +'                  where CD_HEAD  =:P0 '
           +'                    and CD_STORE =:P1 '
           +'                    and YM_STOCK =Left(:P2, 6) '
           +'                 union all '
           +'                 select CD_GOODS, '
           +'                        0, '
           +'                        Sum(QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) '
           +'                   from SL_STOCK_DAY '
           +'                  where CD_HEAD  =:P0 '
           +'                    and CD_STORE =:P1 '
           +'                    and YMD_STOCK between ConCat(Left(:P2,6),''01'') and :P2 '
           +'                  group by CD_GOODS '
           +'                 ) as t '
           +'           group by CD_GOODS '
           +'         ) as t on t.CD_GOODS = a.CD_MENU left outer join '
           +'         (select  CD_GOODS '
           +'            from  SL_SILSA '
           +'           where  CD_HEAD  =:P0 '
           +'             and  CD_STORE =:P1 '
           +'             and  YM_SILSA = Left(:P2, 6)) as d on d.CD_GOODS = a.CD_MENU '
           +'where    a.CD_HEAD  = :P0 '
           +'  and    a.CD_STORE = :P1 '
           +'  and    a.DS_STOCK = ''1'' '
           +vWhere
           +'  and    d.CD_GOODS is null ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

function TStockNotSurveyConfirmForm.DoSave: Boolean;
var vIndex :Integer;
    vCode  :String;
begin
  if CheckMonthClose('S', DtoS(ConditionToolBarFromDateEdit.Date)) then
  begin
    ErrBox('월 마감이 된 월에는 실사 확정을 할 수 없습니다.');
    Exit;
  end;

  if not CheckMonthClose('S', DtoS(IncMonth(ConditionToolBarFromDateEdit.Date,-1))) then
  begin
    MsgBox('지난 달 ''월 마감''을 하지 않았습니다.');
    Exit;
  end;


  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    vCode := vCode + Format(' ''%s'',',[GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index]]);
  vCode := '   and a.CD_MENU in ('+LeftStr(vCode, Length(vCode)-1)+')';

  try
    ExecQuery('insert into SL_SILSA(CD_HEAD, CD_STORE, YM_SILSA, CD_GOODS, QTY_STOCK, QTY_SILSA, QTY_SETTLE, PR_BUY, PR_SALE, CD_SAWON_CHG, DT_CHANGE, YMD_SILSA) '
             +'select   a.CD_HEAD, '
             +'         a.CD_STORE, '
             +'         Left(:P2, 6) as YM_SILSA, '
             +'         a.CD_MENU, '
             +'         Ifnull(t.QTY_STOCK,0) as QTY_STOCK, '
             +'         0, '
             +'         - Ifnull(t.QTY_STOCK,0), '
             +'         a.PR_BUY, '
             +'         a.PR_SALE, '
             +'         :P3 as CD_SAWON_CHG, '
             +'         Now() as DT_CHANGE, '
             +'         :P2 '
             +'from     MS_MENU as a inner join '
             +'        (select CD_GOODS, '
             +'                Sum(Ifnull(QTY_BASE,0)+Ifnull(QTY_STOCK,0)) as QTY_STOCK '
             +'           from '
             +'                (select CD_GOODS, '
             +'                        Ifnull(QTY_BASE,0) as QTY_BASE, '
             +'                        0 as QTY_STOCK '
             +'                   from SL_STOCK_MONTH  '
             +'                  where CD_HEAD  =:P0 '
             +'                    and CD_STORE =:P1 '
             +'                    and YM_STOCK =Left(:P2, 6) '
             +'                 union all '
             +'                 select CD_GOODS, '
             +'                        0, '
             +'                        Sum((QTY_BUY+QTY_RETURN-QTY_SALE-QTY_DISUSE+QTY_ADJ) '
             +'                   from SL_STOCK_DAY '
             +'                  where CD_HEAD  =:P0 '
             +'                    and CD_STORE =:P1 '
             +'                    and YMD_STOCK between ConCat(Left(:P2,6),''01'') and :P2 '
             +'                    and b.YN_USE = ''Y'' '
             +'                  group by CD_GOODS '
             +'                 ) as t '
             +'           group by CD_GOODS '
             +'         ) as t on t.CD_GOODS = a.CD_MENU '
             +' where   a.CD_HEAD  =:P0 '
             +'   and   a.CD_STORE =:P1 '
             +'   and   a.DS_STOCK =''1'' '
             +vCode+';',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               UserCode],
               true);
    Result := true;
    MsgBox('저장이 완료되었습니다');
    GridTableView.DataController.RecordCount := 0;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TStockNotSurveyConfirmForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  DisplayValue := SearchCompany(DisplayValue);
end;

function TStockNotSurveyConfirmForm.SearchCompany(aValue:String): String;
begin
  // 거래처를 조회한다
  with THelpForm.Create(Self) do
    try
      GridTableView.OptionsSelection.MultiSelect := True;
      Caption                    := '거래처 조회';
      GridTableViewCode.Caption  := '거래처 코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '거래처 이름';
      GridTableViewName1.Width   := 320;

      //SearchText := ConditionGoodsCompanyCodeEdit.Text;
      SQLText    := 'select   CD_TRDPL, '
                   +'         NM_TRDPL '
                   +'  from   MS_TRD '
                   +' where   CD_HEAD  =:P0 '
                   +'   and   CD_STORE =:P1 '
                   +'   and  (CD_TRDPL =:P2 or NM_TRDPL like ConCat(''%'',:P2,''%'')) '
                   +'   and   DS_TRDPL = ''B'' '
                   +'   and   DS_STATUS = 0 '
                   +' order by CD_TRDPL';
      IsAutoSearch := true; // 폼 띄우면서 자동 검색
      if ShowModal = mrOK then
      begin
        Result := Code;
        ConditionToolBarButtonEdit.Text := Code;
        ConditionToolBarEdit.Text       := Names[0];
      end;
    finally
      Free;
    end;
end;

end.
