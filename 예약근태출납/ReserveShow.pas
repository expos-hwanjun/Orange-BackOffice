unit ReserveShow;

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
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TReserveShowForm = class(TInheritShowForm)
    GridTableViewBookingNo: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewTable: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // 조회
  end;

var
  ReserveShowForm: TReserveShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TReserveShowForm }
procedure TReserveShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TReserveShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vTable :String;
begin
  try
    OpenQuery('select a.NO_BOOKING, '
             +'       a.NM_NAME, '
             +'       a.CD_MEMBER, '
             +'       GetPhoneNo(a.NO_TEL) as NO_TEL, '
             +'       a.DT_BOOKING, '
             +'       b.NM_SAWON as NM_DAMDANG, '
             +'       a.CNT_PERSON, '
             +'       a.AMT_BOOKING, '
             +'       a.REMARK, '
             +'       case when a.YN_SALE = ''Y'' then ''방문'' else ''미방문'' end as STATUS '
             +'  from SL_BOOKING a left outer join '
             +'       MS_SAWON   b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE =b.CD_STORE and a.CD_DAMDANG = b.CD_SAWON  '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and Date_Format(a.DT_BOOKING, ''%Y%m%d'') between :P2 and :P3 ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, GridTableView);
  finally
    FinishQuery;
  end;

  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    try
      OpenQuery('select b.NM_TABLE '
               +'  from SL_BOOKING_TABLE a inner join '
               +'       MS_TABLE      as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.NO_TABLE = a.NO_TABLE '
               +' where a.CD_HEAD  =:P0 '
               +'   and a.CD_STORE =:P1 '
               +'   and a.NO_BOOKING =:P2 '
               +' order by a.NO_TABLE ',
               [HeadStoreCode,
                StoreCode,
                GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewBookingNo.Index])]);
      vTable := EmptyStr;
      while not Query.Eof do
      begin
        vTable := vTable + Query.Fields[0].AsString + ',';
        Query.Next;
      end;
      vTable := LeftStr(vTable, Length(vTable)-1);
      GridTableView.DataController.Values[vIndex, GridTableViewTable.Index] := ' '+vTable;
    finally
      FinishQuery;
    end;
  end;
end;



end.
