unit SaleTicketShow;

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
  dxPScxExtEditorProducers, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, StrUtils, AdvGlowButton, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleTicketShowForm = class(TInheritShowForm)
    GridTableViewTicketNo: TcxGridColumn;
    GridTableViewReceiptNo: TcxGridColumn;
    GridTableViewMenuName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    GridTableViewIssueDate: TcxGridColumn;
    GridTableViewUseDate: TcxGridColumn;
    GridTableViewChangeDate: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStatusStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleTicketShowForm: TSaleTicketShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

function TSaleTicketShowForm.DoSearch: Boolean;
begin
  OpenQuery('select a.NO_TICKET, '
           +'       ConCat(a.YMD_SALE,''-'',a.NO_POS,''-'',a.NO_RCP) as NO_RECEIPT, '
           +'       b.NM_MENU, '
           +'       case a.DS_STATUS when ''0'' then ''발행'' when ''1'' then ''사용'' when ''2'' then ''반품'' end as DS_STATUS, '
           +'       a.DT_INSERT, '
           +'       a.DT_USE, '
           +'       a.DT_CHANGE '
           +'  from SL_SALE_TICKET  a inner join '
           +'       MS_MENU      as b on b.CD_HEAD  = a.CD_HEAD '
           +'                        and b.CD_STORE = a.CD_STORE '
           +'                        and b.CD_MENU  = a.CD_MENU '
           +' where a.CD_HEAD  =:P0 '
           +'   and a.CD_STORE =:P1 '
           +'   and a.YMD_SALE between :P2 and :P3 '
           +Ifthen(ConditionToolBarEdit.Text <> EmptyStr, Format('and a.NO_TICKET = ''%s'' ',[ConditionToolBarEdit.Text]),'')
           +' order by a.NO_TICKET ',
           [HeadStoreCode,
            StoreCode,
            Ifthen(ConditionToolBarEdit.Text=EmptyStr, DtoS(ConditionToolBarFromDateEdit.Date), LeftStr(ConditionToolBarEdit.Text,8)),
            Ifthen(ConditionToolBarEdit.Text=EmptyStr, DtoS(ConditionToolBarToDateEdit.Date), LeftStr(ConditionToolBarEdit.Text,8))]);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TSaleTicketShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TSaleTicketShowForm.GridTableViewStatusStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[AItem.Index] = '반품' then
    AStyle := StyleFontRed
  else if ARecord.Values[AItem.Index] = '사용' then
    AStyle := StyleFontBlue;
end;

end.
