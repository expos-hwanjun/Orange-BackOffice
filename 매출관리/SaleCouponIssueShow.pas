unit SaleCouponIssueShow;

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
  dxPScxExtEditorProducers, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleCouponIssueShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleCouponIssueShowForm: TSaleCouponIssueShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TSaleCouponSaleShowForm }

function TSaleCouponIssueShowForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := EmptyStr;
    1 : vWhere := 'and DS_STATUS = ''1'' ';
    2 : vWhere := 'and DS_STATUS = ''0'' ';
    3 : vWhere := 'and DS_STATUS = ''2'' ';
  end;
  OpenQuery('select NO_COUPON, '
           +'       StoD(YMD_ISSUE) as YMD_ISSUE, '
           +'       AMT_DC, '
           +'       AMT_SALE_MIN, '
           +'       ConCat(StoD(YMD_FROM),''~'',StoD(YMD_TO)) as YMD_USE, '
           +'       case DS_STATUS when ''0'' then ''미사용'' when ''1'' then ''사용'' when ''2'' then ''취소'' end as DS_STATUS, '
           +'       RCP_ISSUE, '
           +'       RCP_SALE '
           +'  from MS_COUPON '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and YMD_ISSUE between :P2 and :P3 '
           +vWhere
           +'   and NO_COUPON like ConCat(''%'',:P4) '
           +' order by NO_COUPON ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarEdit.Text]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TSaleCouponIssueShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

end.
