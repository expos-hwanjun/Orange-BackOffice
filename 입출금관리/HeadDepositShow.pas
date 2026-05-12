unit HeadDepositShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit;

type
  THeadDepositShowForm = class(TInheritShowForm)
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
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewColumn12: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadDepositShowForm: THeadDepositShowForm;

implementation
uses
  Common, DBModule, Main;

{$R *.dfm}

procedure THeadDepositShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
end;


function THeadDepositShowForm.DoSearch: Boolean;
begin
  OpenQuery('select   StoD(a.YMD_OCCUR) as YMD_OCCUR, '
           +'         a.NO_ACCT, '
           +'         a.CD_MEMBER as CD_STORE, '
           +'         b.NM_STORE, '
           +'         case a.DS_ACCT when ''0'' then ''현금'' when ''1'' then ''카드''  when ''2'' then ''계좌'' when ''3'' then ''기타'' end as DS_GET, '
           +'         a.AMT_PAYIN  as AMT_GET_REAL, '
           +'         a.AMT_DC, '
           +'         a.AMT_PAYIN+a.AMT_DC  as AMT_GET, '
           +'         a.AMT_NET, '
           +'         a.AMT_DUTYFREE, '
           +'         a.AMT_REMAIN, '
           +'         a.REMARK '
           +'  from   SL_ACCT  as a inner join '
           +'         MS_STORE as b on a.CD_HEAD = b.CD_HEAD and a.CD_MEMBER = b.CD_STORE  '
           +' where   a.CD_HEAD   =:P0 '
           +'   and   a.CD_STORE  =''00000000'' '
           +'   and   a.YMD_OCCUR between :P1 and :P2 '
           +'   and   a.CD_ACCT   = :P3 '
           +'   and   b.NM_STORE like ConCat(''%'',:P4,''%'') '
           +' order by a.YMD_OCCUR, a.NO_ACCT',
            [HeadStoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             varGetCode,
             ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;



end.
