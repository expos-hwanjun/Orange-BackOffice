unit BuyCompanyCreditShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, Math, StrUtils, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TBuyCompanyCreditShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  BuyCompanyCreditShowForm: TBuyCompanyCreditShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TBuyCompanyCreditShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/매입관리/매입처%20미지급금%20지급조회/매입처%20미지급금%20지급조회.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TBuyCompanyCreditShowForm.DoSearch: Boolean;
begin
  OpenQuery('select   StoDW(a.YMD_OCCUR) as YMD_RECEIVE, '
           +'         a.CD_TRDPL, '
           +'         t.NM_TRDPL, '
           +'         t.NO_BIZER, '
           +'         a.AMT_REMAIN, '
           +'         a.AMT_OUT as AMT_RECEIVE, '
           +'         a.AMT_DC, '
           +'         a.AMT_REMAIN - a.AMT_OUT - a.AMT_DC as AMT_BALANCE, '
           +'         a.REMARK '
           +'  from   SL_ACCT  as a inner join '
           +'         MS_TRD   as t on a.CD_HEAD  = t.CD_HEAD '
           +'                      and a.CD_STORE = t.CD_STORE '
           +'                      and a.CD_TRDPL = t.CD_TRDPL '
           +' where   a.CD_HEAD   =:P0 '
           +'   and   a.CD_STORE  =:P1 '
           +'   and   a.YMD_OCCUR between :P2 and :P3 '
           +'   and   a.CD_ACCT   = :P4 '
           +'   and   (t.CD_TRDPL =:P5 or t.NM_TRDPL like ConCat(''%'',:P5,''%'')) '
           + Ifthen(Self.Tag=0, 'and t.DS_TRDPL = ''B'' ', 'and t.DS_TRDPL in (''R'',''C'',''E'') ')
           +' order by a.YMD_OCCUR, a.NO_ACCT',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             CreditOut,
             ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;


end.
