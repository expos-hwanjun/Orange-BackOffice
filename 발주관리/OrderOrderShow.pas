unit OrderOrderShow;

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
  cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit, cxImageComboBox;

type
  TOrderOrderShowForm = class(TInheritShow2Form)
    GridDBTableViewColumn1: TcxGridDBColumn;
    GridDBTableViewColumn2: TcxGridDBColumn;
    GridDBTableViewColumn3: TcxGridDBColumn;
    GridDBTableViewColumn4: TcxGridDBColumn;
    GridDBTableViewColumn5: TcxGridDBColumn;
    GridDBTableViewColumn6: TcxGridDBColumn;
    GridDBTableViewColumn7: TcxGridDBColumn;
    GridDBTableViewColumn8: TcxGridDBColumn;
    GridDBTableViewColumn9: TcxGridDBColumn;
    GridSubDBTableViewColumn1: TcxGridDBColumn;
    GridSubDBTableViewColumn2: TcxGridDBColumn;
    GridSubDBTableViewColumn3: TcxGridDBColumn;
    GridSubDBTableViewColumn4: TcxGridDBColumn;
    GridSubDBTableViewColumn5: TcxGridDBColumn;
    GridSubDBTableViewColumn6: TcxGridDBColumn;
    GridSubDBTableViewColumn7: TcxGridDBColumn;
    GridDBTableViewColumn10: TcxGridDBColumn;
    GridDBTableViewColumn11: TcxGridDBColumn;
    GridDBTableViewColumn12: TcxGridDBColumn;
    GridSubDBTableViewColumn8: TcxGridDBColumn;
    ImageList1: TImageList;
    GridDBTableViewColumn13: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  OrderOrderShowForm: TOrderOrderShowForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

{ TOrderOrderShowForm }
procedure TOrderOrderShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TOrderOrderShowForm.DoSearch: Boolean;
begin
  inherited;
  OpenQuery('select  StoD(a.YMD_ORDER) as YMD_ORDER, '
           +'        a.NO_ORDER, '
           +'        case a.DS_ORDER when ''S'' then ''매장발주'' when ''H'' then ''긴급발주'' end as DS_ORDER, '
           +'        case when b.ORDER_REF is not null then ''S'' else a.DS_STATUS end DS_STATUS, '
           +'        b.AMT_SALE, '
           +'        a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
           +'        a.AMT_TAX, '
           +'        a.AMT_ORDER , '
           +'        StoD(a.YMD_DELIVERY) as YMD_DELIVERY, '
           +'        a.ORDER_REMARK, '
           +'        a.DT_CONFIRM, '
           +'        a.DT_INSERT, '
           +'        a.DT_CHANGE, '
           +'        ConCat(a.YMD_ORDER,a.NO_ORDER) as LINK '
           +'  from  OL_ORDER_H a left outer join '
           +'       (select CD_STORE, '
           +'               ORDER_REF, '
           +'               SUM(AMT_SALE) as AMT_SALE '
           +'          from OL_SALE_H '
           +'         where CD_HEAD  =:P0 '
           +'           and YMD_SALE >= :P1 '
           +'         group by CD_STORE, ORDER_REF) as b on b.CD_STORE = a.CD_STORE and Left(b.ORDER_REF,8) = a.YMD_ORDER and Right(b.ORDER_REF,4) = a.NO_ORDER '
           +' where  a.CD_HEAD    =:P0 '
           +'   and  a.YMD_ORDER  between :P1 and :P2 '
           +'   and  a.CD_STORE   =:P3 '
           +' order by YMD_ORDER, NO_ORDER',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             StoreCode]);
  GridDBTableView.DataController.DataSource := nil;
  Result := DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;

  OpenQuery('select   a.SEQ, '
           +'         a.CD_GOODS, '
           +'         b.NM_GOODS, '
           +'         b.NM_UNIT, '
           +'         a.QTY_ORDER, '
           +'         a.QTY_ORDER as QTY_CONFIRM, '
           +'         a.PR_ORDER, '
           +'         a.AMT_ORDER, '
           +'         c.NM_TRDPL as NM_LOGISTICS, '
           +'         ConCat(a.YMD_ORDER,a.NO_ORDER) as LINK '
           +'  from   OL_ORDER_D as a left outer join '
           +'         MS_GOODS   as b on a.CD_HEAD = b.CD_HEAD and b.CD_STORE = :P4 and a.CD_GOODS = b.CD_GOODS left outer join '
           +'         MS_TRD     as c on c.CD_HEAD = a.CD_HEAD and c.CD_STORE = :P4 and c.CD_TRDPL = b.CD_LOGISTICS '
           +' where   a.CD_HEAD   = :P0 '
           +'   and   a.YMD_ORDER between :P1 and :P2 '
           +'   and   a.CD_STORE  = :P3 '
           +' order by a.YMD_ORDER, a.NO_ORDER, a.SEQ',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             StoreCode,
             StandardStore]);
  GridSubDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, SubMemData);
  GridSubDBTableView.DataController.DataSource := SubDataSource;
end;


end.
