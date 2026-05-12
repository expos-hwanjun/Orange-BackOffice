unit StockSurveyShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon,
  Menus, ImgList, AdvToolBar, AdvToolBarStylers, ExtCtrls,
  Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TStockSurveyShowForm = class(TInheritShowForm)
    GridTableViewSurveyDate: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  StockSurveyShowForm: TStockSurveyShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TStockSurveyShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL   := 'BackOffice/재고관리/재고실사조회/재고실사조회.htm';
  PrintMode := pmPreviewExcel;
  DefaultDate := ddToday;
end;

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 조회조건에서 엔터키를 눌렀을때
procedure TStockSurveyShowForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then Exit;

  if (ConditionToolBarFromDateEdit.Date <> ConditionToolBarToDateEdit.Date) then
  begin
    MsgBox('확정취소할 때는 조회일자가 같아야합니다');
    Exit;
  end;

  if CheckMonthClose('S',DtoS(ConditionToolBarFromDateEdit.Date)) then
    Exit;

  if not AskBox(Format('%s 일자의 실사를 삭제하시겠습니까?',[ConditionToolBarFromDateEdit.Text])) then Exit;
  try
    ExecQuery('update SL_SILSA_TEMP '
             +'   set YN_CONFIRM = ''N'' '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and YM_SILSA  =Left(:P2,6) '
             +'   and YMD_SILSA =:P2; ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date)],false);

    ExecQuery('delete '
             +'  from SL_SILSA '
             +' where CD_HEAD   =:P0 '
             +'   and CD_STORE  =:P1 '
             +'   and YM_SILSA  =Left(:P2,6) '
             +'   and YMD_SILSA =:P2;',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date)],true);

    GridTableView.DataController.RecordCount := 0;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TStockSurveyShowForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TStockSurveyShowForm.DoSearch: Boolean;
begin
  OpenQuery('select s.YMD_SILSA, '
           +'       t.NM_TRDPL, '
           +'       s.CD_GOODS, '
           +'       g.NM_MENU as NM_GOODS, '
           +'       g.NM_SPEC, '
           +'       s.QTY_STOCK, '
           +'       s.QTY_SILSA, '
           +'       s.QTY_SETTLE, '
           +'       g.PR_BUY  * s.QTY_SILSA as AMT_BUY, '
           +'       g.PR_SALE * s.QTY_SILSA as AMT_SALE '
           +'  from SL_SILSA s inner join '
           +'       MS_MENU  g on s.CD_HEAD = g.CD_HEAD and s.CD_STORE = g.CD_STORE and s.CD_GOODS = g.CD_MENU left outer join '
           +'       MS_TRD   t on g.CD_HEAD = t.CD_HEAD and g.CD_STORE = t.CD_STORE and g.CD_TRDPL = t.CD_TRDPL '
           +' where s.CD_HEAD  =:P0 '
           +'   and s.CD_STORE =:P1 '
           +'   and s.YM_SILSA   = Left(:P2,6) '
           +'   and s.YMD_SILSA between :P2 and :P3 '
           +'   and (g.CD_MENU =:P4 or g.NM_MENU like ConCat(''%'',:P4,''%'')) '
           +' order by g.CD_MENU ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;
end.
