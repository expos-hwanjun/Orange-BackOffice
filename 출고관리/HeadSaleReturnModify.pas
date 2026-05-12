unit HeadSaleReturnModify;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridDBTableView, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit;

type
  THeadSaleReturnModifyForm = class(TInheritShow2Form)
    GridDBTableViewSaleDate: TcxGridDBColumn;
    GridDBTableViewSaleNo: TcxGridDBColumn;
    GridDBTableViewStoreName: TcxGridDBColumn;
    GridDBTableViewColumn4: TcxGridDBColumn;
    GridDBTableViewColumn5: TcxGridDBColumn;
    GridDBTableViewColumn6: TcxGridDBColumn;
    GridDBTableViewColumn7: TcxGridDBColumn;
    GridDBTableViewColumn8: TcxGridDBColumn;
    GridDBTableViewColumn9: TcxGridDBColumn;
    GridDBTableViewColumn10: TcxGridDBColumn;
    GridDBTableViewColumn11: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    GridSubDBTableViewColumn7: TcxGridDBColumn;
    GridSubDBTableViewColumn8: TcxGridDBColumn;
    GridSubDBTableViewColumn9: TcxGridDBColumn;
    GridSubDBTableViewColumn10: TcxGridDBColumn;
    GridSubDBTableViewColumn11: TcxGridDBColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;

var
  HeadSaleReturnModifyForm: THeadSaleReturnModifyForm;

implementation
uses Common, DBModule;

{$R *.dfm}

procedure THeadSaleReturnModifyForm.ButtonToolBarDeleteButtonClick(
  Sender: TObject);
var
  vSaleDate, vSaleNo: string;
begin
  inherited;
  if not AskBox('출고 반품을 삭제하시겠습닊?') then Exit;
  vSaleDate := GetOnlyNumber(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleDate.Index]);
  vSaleNo   := String(GridDBTableView.DataController.Values[GridDBTableView.DataController.FocusedRecordIndex, GridDBTableViewSaleNo.Index]);
  try
    // 매입 디테일 테이블을 삭제한다
    ExecQuery('delete from OL_SALE_D '
             +' where CD_HEAD   =:P0 '
             +'   and YMD_SALE  =:P1 '
             +'   and NO_SALE   =:P2;',
              [HeadStoreCode,
               vSaleDate,
               vSaleNo],
               false);

    // 매입 마스터 테이블을 삭제한다
    ExecQuery('delete from OL_SALE_H '
             +' where CD_HEAD    = :P0 '
             +'   and YMD_SALE   = :P1 '
             +'   and NO_SALE    = :P2;',
              [HeadStoreCode,
               vSaleDate,
               vSaleNo],
               false);

    if ExecQuery('', [], true) then
    begin
    // 선택된 레코드를 삭제한다
      GridDBTableView.DataController.DeleteFocused;
      ShowMsg('출고반품을 삭제했습니다.');
    end;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure THeadSaleReturnModifyForm.ClearGrid;
begin
  inherited;
  GridDBTableView.DataController.DataSource  := nil;
  GridSubDBTableView.DataController.DataSource := nil;
end;

function THeadSaleReturnModifyForm.DoSearch: Boolean;
begin
  inherited;
  OpenQuery('select StoDW(a.YMD_SALE) as YMD_SALE, '
           +'       a.NO_SALE, '
           +'       b.NM_STORE, '
           +'       c.NM_TRDPL as NM_LOGISTICS, '
           +'       a.AMT_DUTY as AMT_NET, '
           +'       a.AMT_TAX, '
           +'       a.AMT_DUTYFREE, '
           +'       a.AMT_SALE, '
           +'       a.DT_INSERT, '
           +'       a.DT_CHANGE, '
           +'       f.NM_SAWON, '
           +'       ConCat(a.YMD_SALE,a.NO_SALE) as LINK '
           +'  from OL_SALE_H  a inner join '
           +'       MS_STORE   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE inner join '
           +'       MS_TRD     c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = ''00000000'' and c.CD_TRDPL = a.CD_LOGISTICS left outer join '
           +'       MS_SAWON   f on f.CD_HEAD = a.CD_HEAD and f.CD_STORE  = ''00000000'' and f.CD_SAWON = a.CD_SAWON  '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.YMD_SALE between :P1 and :P2 '
           +'   and a.DS_SALE  =''R'' '
           +'   and b.NM_STORE like ConCat(''%'',:P3,''%'') '
           +' order by a.NO_SALE ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text]);

  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  OpenQuery('select   a.SEQ, '
           +'         a.CD_GOODS, '
           +'         b.NM_GOODS, '
           +'         b.NM_UNIT, '
           +'         a.QTY_SALE, '
           +'         a.PR_SALE, '
           +'         a.PR_SALE * a.QTY_SALE as AMT_NET, '
           +'         a.AMT_TAX, '
           +'         case when a.DS_TAX = ''0'' then a.AMT_SALE else 0 end AMT_DUTYFREE, '
           +'         a.AMT_SALE, '
           +'         ConCat(a.YMD_SALE,a.NO_SALE) as LINK '
           +'  from   OL_SALE_D as a left outer join '
           +'         MS_GOODS   as b on a.CD_HEAD = b.CD_HEAD and b.CD_STORE = ''00000000'' and a.CD_GOODS = b.CD_GOODS  '
           +' where   a.CD_HEAD   = :P0 '
           +'   and   a.YMD_SALE  between :P1 and :P2 '
           +'   and   a.DS_SALE   = ''R'' '
           +' order by a.YMD_SALE, a.NO_SALE, a.SEQ',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
  GridSubDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, GridSubDBTableView, SubMemData);
  GridSubDBTableView.DataController.DataSource := SubDataSource;
end;

procedure THeadSaleReturnModifyForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddLastMonth;
end;

end.
