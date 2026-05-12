unit MemberReceiveShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, StrUtils,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TMemberReceiveShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberReceiveShowForm: TMemberReceiveShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TMemberReceiveShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
end;

function TMemberReceiveShowForm.DoSearch: Boolean;
begin
  OpenQuery('select   StoDW(a.YMD_OCCUR) as YMD_RECEIVE, '
           +'         a.CD_MEMBER, '
           +'         t.NM_MEMBER, '
           +'         a.AMT_REMAIN, '
           +'         a.AMT_PAYIN as AMT_RECEIVE, '
           +'         a.AMT_DC, '
           +'         a.AMT_PAYIN+a.AMT_DC as AMT_TOTAL, '
           +'         a.AMT_REMAIN - a.AMT_PAYIN - a.AMT_DC as AMT_BALANCE, '
           +'         case a.DS_ACCT when ''0'' then ''현금'' when ''1'' then ''카드'' when ''2'' then ''현금영수증'' when ''3'' then ''통장'' end as DS_ACCT, '
           +'         a.REMARK '
           +'  from   SL_ACCT  as a inner join '
           +'         MS_MEMBER  as t on t.CD_HEAD   = a.CD_HEAD '
           +'                        and t.CD_STORE  = :P5 '
           +'                        and a.CD_MEMBER = t.CD_MEMBER '
           +' where   a.CD_HEAD  =:P0 '
           +'   and   a.CD_STORE =:P1 '
           +'   and   a.YMD_OCCUR between :P2 and :P3 '
           +'   and   Length(a.CD_MEMBER)= 10 '
           +'  and    (t.CD_MEMBER =:P4 or t.NM_MEMBER like ConCat(''%'',:P4,''%'')) '
           +'order by a.YMD_OCCUR, a.NO_ACCT',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             ConditionToolBarEdit.Text,
             Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;


end.
