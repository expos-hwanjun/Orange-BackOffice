unit CloseAspOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxButtonEdit, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar,
  AdvGlowButton, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, cxGroupBox;

type
  TCloseAspOrderForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridTableViewSpec: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewOrderPrice: TcxGridColumn;
    GridTableViewOrderQty: TcxGridColumn;
    GridLevel: TcxGridLevel;
    GridTableViewClassName: TcxGridColumn;
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
    function DoSave: Boolean; override;
  end;

var
  CloseAspOrderForm: TCloseAspOrderForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TOrderOrderForm }

function TCloseAspOrderForm.DoSave: Boolean;
var vIndex :Integer;
begin
  try
    BeginTrans;
    ExecQuery('delete MS_ORDER_DEFAULT',
              [], false);

    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index] = 0 then Continue;

      ExecQuery('insert into MS_ORDER_DEFAULT(CD_GOODS, QTY_ORDER) values(:P0, :P1)',
               [GridTableView.DataController.Values[vIndex, GridTableViewGoodsCode.Index],
                GridTableView.DataController.Values[vIndex, GridTableViewOrderQty.Index]],false);
    end;
    CommitTrans;
    Result := true;
  except
    on E: Exception do
    begin
      RollbackTrans;
      ErrBox(E.Message);
    end;
  end;

end;

function TCloseAspOrderForm.DoSearch: Boolean;
begin
  OpenQuery('select a.NM_CLASS, '
           +'       a.CD_GOODS, '
           +'       a.NM_GOODS, '
           +'       a.NM_UNIT, '
           +'       a.PR_ORDER, '
           +'       isnull(b.QTY_ORDER, 0) as QTY_ORDER '
           +'  from MS_GOODS         a left outer join '
           +'       MS_ORDER_DEFAULT b on a.CD_GOODS = b.CD_GOODS '
           +' order by a.CD_GOODS ',
            []);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TCloseAspOrderForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/마감관련/ASP기준발주등록/ASP기준발주등록.htm';
end;

procedure TCloseAspOrderForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewOrderQty.Index] > 0 then
    AStyle := StyleFontRed;
end;

end.
