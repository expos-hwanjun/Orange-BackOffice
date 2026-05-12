unit MemberInvoiceShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, Menus, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  cxContainer, DBAccess, Uni, DB, MemDS, ImgList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TMemberInvoiceShowForm = class(TInheritShowForm)
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewDate: TcxGridBandedColumn;
    GridBandedTableViewTaxNo: TcxGridBandedColumn;
    GridBandedTableViewTaxType: TcxGridBandedColumn;
    GridBandedTableViewColumn4: TcxGridBandedColumn;
    GridBandedTableViewColumn5: TcxGridBandedColumn;
    GridBandedTableViewColumn6: TcxGridBandedColumn;
    GridBandedTableViewColumn7: TcxGridBandedColumn;
    GridBandedTableViewColumn8: TcxGridBandedColumn;
    GridBandedTableViewColumn9: TcxGridBandedColumn;
    GridBandedTableViewColumn10: TcxGridBandedColumn;
    GridBandedTableViewColumn11: TcxGridBandedColumn;
    GridBandedTableViewColumn12: TcxGridBandedColumn;
    GridBandedTableViewColumn13: TcxGridBandedColumn;
    GridBandedTableViewStatus: TcxGridBandedColumn;
    GridBandedTableViewColumn15: TcxGridBandedColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    procedure GridBandedTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure DoSearch; override;
  end;

var
  MemberInvoiceShowForm: TMemberInvoiceShowForm;

implementation
uses Common;
{$R *.dfm}

{ TMemberInvoiceShowForm }
procedure TMemberInvoiceShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmExcel;
end;

procedure TMemberInvoiceShowForm.ButtonToolBarDeleteButtonClick(
  Sender: TObject);
var vConditionSql,
    vConditionWhere :String;
begin
  inherited;
  if not AskBox(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewTaxType.Index]+'를 폐기하시겠습니까?') then
     Exit;

  try
    BeginTrans;
    ExecQuery('update SL_TAX set DS_STATUS = ''1'' '
             +' where CD_STORE =:P0 '
             +'   and YMD_TAX  =:P1 '
             +'   and NO_TAX   =:P2',
             [StoreCode,
              GetOnlyNumber(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewDate.Index]),
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewTaxNo.Index]],
              false);

    if GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewTaxType.Index] = '세금계산서' then
    begin
      vConditionSql   := 'NO_TAX_REF = '''' ';
      vConditionWhere := 'and NO_TAX_REF =:P1 ';
    end
    else
    begin
      vConditionSql   := 'NO_NOTAX_REF = '''' ';
      vConditionWhere := 'and NO_NOTAX_REF =:P1 ';
    end;

    ExecQuery('update SL_SALE_H set '+ vConditionSql
             +' where CD_STORE =:P0 '
             +vConditionWhere,
             [StoreCode,
              GetOnlyNumber(GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewDate.Index])+
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewTaxNo.Index]],
              false);
    CommitTrans;
    GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewStatus.Index] := '폐기';
    ButtonToolBarDeleteButton.Enabled := false;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
      RollbackTrans;
    end;
  end;
end;

procedure TMemberInvoiceShowForm.DoSearch;
var vCondition :String;
begin
  inherited;
  case ConditionToolBarComboBox.ItemIndex of
    0 : vCondition := EmptyStr;
    1 : vCondition := 'and DS_TAX = ''0'' ';
    2 : vCondition := 'and DS_TAX = ''1'' ';
  end;
  OpenQuery('select dbo.StoD(YMD_TAX) as YMD_TAX,'
           +'       NO_TAX, '
           +'       case DS_TAX when ''0'' then ''세금계산서'' when ''1'' then ''계산서'' end as DS_TAX, '
           +'       case DS_STATUS when ''0'' then ''정상'' when ''1'' then ''폐기'' end as DS_STATUS, '
           +'       case DS_INVOICE when ''0'' then ''영수'' when ''1'' then ''청구'' end as DS_INVOICE, '
           +'       CD_MEMBER, '
           +'       NM_MEMBER, '
           +'       AMT_DUTY as AMT_NET, '
           +'       AMT_TAX, '
           +'       AMT_TOT, '
           +'       NO_BIZER, '
           +'       NM_BOSS, '
           +'       NM_UPTAE, '
           +'       NM_JONGMOK, '
           +'       ADDR as ADDRESS '
           +'  from SL_TAX '
           +' where CD_STORE =:P0 '
           +'   and YMD_TAX between :P1 and :P2 '
           + vCondition
           +' order by YMD_TAX, NO_TAX ',
             [StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  ReadQuery(GridBandedTableView);
end;



procedure TMemberInvoiceShowForm.GridBandedTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord = nil then Exit;
  ButtonToolBarDeleteButton.Enabled := GridBandedTableView.DataController.Values[AFocusedRecord.Index, GridBandedTableViewStatus.Index] = '정상';
end;

end.
