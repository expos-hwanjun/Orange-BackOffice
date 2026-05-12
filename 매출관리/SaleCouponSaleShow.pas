unit SaleCouponSaleShow;

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
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleCouponSaleShowForm = class(TInheritShowForm)
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewCouponNo: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableViewReceiptNo: TcxGridColumn;
    GridTableViewMember: TcxGridColumn;
    GridTableViewMobileNo: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewUseDate: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleCouponSaleShowForm: TSaleCouponSaleShowForm;

implementation
uses Common, DBModule, ProxyCheck;
{$R *.dfm}

{ TSaleCouponSaleShowForm }
procedure TSaleCouponSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

function TSaleCouponSaleShowForm.DoSearch: Boolean;
begin
  OpenQuery('select StoDW(c.YMD_SALE) as YMD_SALE, '
           +'       c.NO_COUPON, '
           +'       case c.DS_COUPON  when ''0'' then ''ÀÚÃ¼ÄíÆù'' when ''1'' then ''ÅëÇÕÄíÆù'' end as DS_COUPON, '
           +'       c.AMT_DC, '
           +'       ConCat(c.NO_POS,''-'',c.NO_RCP) as NO_RCP, '
           +'       case when Length(h.CD_MEMBER) = 10 then ConCat(h.CD_MEMBER,''-'',Ifnull(m.NM_MEMBER,'''')) else '''' end MEMBER, '
           +'       AES_Decrypt(m.TEL_MOBILE, 71483) as TEL_MOBILE, '
           +'       h.AMT_SALE, '
           +'       h.DT_SALE '
           +'  from SL_SALE_COUPON c inner join '
           +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'h')
           +'                      on h.CD_HEAD  = c.CD_HEAD '
           +'                     and h.CD_STORE = c.CD_STORE '
           +'                     and h.YMD_SALE = c.YMD_SALE '
           +'                     and h.NO_POS   = c.NO_POS '
           +'                     and h.NO_RCP   = c.NO_RCP left outer join '
           +'       MS_MEMBER as m on m.CD_HEAD  = h.CD_HEAD '
           +'                     and m.CD_STORE = :P4 '
           +'                     and m.CD_MEMBER = h.CD_MEMBER '
           +' where c.CD_HEAD  =:P0 '
           +'   and c.CD_STORE =:P1 '
           +'   and c.YMD_SALE between :P2 and :P3 '
           +' order by c.YMD_SALE, c.NO_POS, c.NO_RCP ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
  Result := DM.ReadQuery(Query, GridTableView);
end;



end.
