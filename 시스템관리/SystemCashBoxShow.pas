unit SystemCashBoxShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxTextEdit, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TSystemCashBoxShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // 조회
  end;

var
  SystemCashBoxShowForm: TSystemCashBoxShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TSystemCashBoxShowForm }

procedure TSystemCashBoxShowForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
begin
  inherited;
  HelpURL     := 'BackOffice/시스템관리/금전함사용로그/금전함사용로그.htm';
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  try
    OpenQuery('select CD_SAWON, '
             +'       NM_SAWON '
             +'  from MS_SAWON '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YN_USE   = ''Y'' '
             +' order by CD_SAWON ',
             [HeadStoreCode,
              StoreCode]);
    New(vCode);
    vCode^.Data := '%';
    ConditionToolBarComboBox.Properties.Items.AddObject('[전체]', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
    ConditionToolBarComboBox.ItemIndex := 0;
  finally
    FinishQuery;
  end;
end;

function TSystemCashBoxShowForm.DoSearch: Boolean;
begin
  OpenQuery('select StoD(a.YMD_REAL) as YMD_REAL, '
           +'       a.SEQ, '
           +'       StoD(a.YMD_SALE) as YMD_SALE, '
           +'       a.NO_POS, '
           +'       a.NO_RCP, '
           +'       b.NM_SAWON, '
           +'       a.DT_CHANGE '
           +'  from SL_CASHBOX a inner join '
           +'       MS_SAWON   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_SAWON = a.CD_SAWON '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and a.YMD_REAL between :P2 and :P3 '
           +'   and a.CD_SAWON like :P4 ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            GetStrPointerData(ConditionToolBarComboBox)]);
  Result := DM.ReadQuery(Query, GridTableView, nil);
end;



end.
