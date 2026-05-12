unit SaleReceiptChangeShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow2, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Data.DB, cxDBData, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers,
  cxClasses, DBAccess, Uni, MemDS, cxGridLevel, cxGridDBTableView,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, dxmdaset, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, StrUtils;

type
  TSaleReceiptChangeShowForm = class(TInheritShow2Form)
    GridDBTableViewSaleDate: TcxGridDBColumn;
    GridDBTableViewPosNo: TcxGridDBColumn;
    GridDBTableViewRcpNo: TcxGridDBColumn;
    GridDBTableViewDsSale: TcxGridDBColumn;
    GridDBTableViewSaleAmt: TcxGridDBColumn;
    GridDBTableViewCashAmt: TcxGridDBColumn;
    GridDBTableViewCashRcpAmt: TcxGridDBColumn;
    GridDBTableViewCardAmt: TcxGridDBColumn;
    GridDBTableViewTrustAmt: TcxGridDBColumn;
    GridDBTableViewGiftAmt: TcxGridDBColumn;
    GridDBTableViewDcAmt: TcxGridDBColumn;
    GridDBTableViewServiceAmt: TcxGridDBColumn;
    GridDBTableViewMember: TcxGridDBColumn;
    GridDBTableViewPointAdd: TcxGridDBColumn;
    GridDBTableViewPointDc: TcxGridDBColumn;
    GridSubDBTableViewHistDate: TcxGridDBColumn;
    GridSubDBTableViewGubun: TcxGridDBColumn;
    GridSubDBTableViewSaleAmt: TcxGridDBColumn;
    GridSubDBTableViewCashAmt: TcxGridDBColumn;
    GridSubDBTableViewCashRcpAmt: TcxGridDBColumn;
    GridSubDBTableViewCardAmt: TcxGridDBColumn;
    GridSubDBTableViewTrustAmt: TcxGridDBColumn;
    GridSubDBTableViewGiftAmt: TcxGridDBColumn;
    GridSubDBTableViewDcAmt: TcxGridDBColumn;
    GridSubDBTableViewServiceAmt: TcxGridDBColumn;
    GridSubDBTableViewMember: TcxGridDBColumn;
    GridSubDBTableViewPointAdd: TcxGridDBColumn;
    GridSubDBTableViewPointDc: TcxGridDBColumn;
    GridDBTableViewChangeTime: TcxGridDBColumn;
    GridSubDBTableViewChannelNo: TcxGridDBColumn;
    GridDBTableViewBankAmt: TcxGridDBColumn;
    GridSubDBTableViewBankAmt: TcxGridDBColumn;
    GridDBTableViewLetsOrderAmt: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
  protected
    function  DoSearch:Boolean; override;
  end;

var
  SaleReceiptChangeShowForm: TSaleReceiptChangeShowForm;

implementation
uses
  Common, DBModule, Main;
{$R *.dfm}

{ TSaleReceiptChangeShowForm }

function TSaleReceiptChangeShowForm.DoSearch: Boolean;
begin
  OpenQuery('select StoD(h.YMD_SALE) as YMD_SALE, '
           +'       h.NO_POS, '
           +'       h.NO_RCP, '
           +'       case h.DS_SALE when ''S'' then ''정상'' '
           +'                      when ''V'' then ''취소'' '
           +'                      when ''B'' then ''반품'' '
           +'       end as DS_SALE, '
           +'       h.AMT_SALE, '
           +'       h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP as AMT_CASH, '
           +'       h.AMT_CASHRCP, '
           +'       h.AMT_CARD, '
           +'       h.AMT_LETSORDER, '
           +'       h.AMT_TRUST, '
           +'       h.AMT_GIFT, '
           +'       h.AMT_BANK, '
           +'       h.AMT_SERVICE, '
           +'       h.DC_TOT, '
           +'       ConCat(m.NM_MEMBER,''('',h.CD_MEMBER,'')'') as NM_MEMBER, '
           +'       h.PNT_OCCUR, '
           +'       h.DC_POINT, '
           +'       Ifnull(h.DT_CHANGE, DT_SALE) as DT_CHANGE, '
           +'       ConCat(h.YMD_SALE,h.NO_POS,h.NO_RCP) as LINK '
           +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date,ConditionToolBarToDateEdit.Date, 'h left outer join')
           +'       MS_MEMBER m on h.CD_HEAD   = m.CD_HEAD '
           +'                  and m.CD_STORE  = :P4 '
           +'                  and h.CD_MEMBER = m.CD_MEMBER inner join '
           +'      (select YMD_SALE, '
           +'              NO_POS, '
           +'              NO_RCP, '
           +'              Count(*) CNT_RCP '
           +'         from SL_SALE_H_HIST '
           +'        where CD_HEAD  = :P0 '
           +'          and CD_STORE = :P1 '
           +'          and YMD_SALE between :P2 and :P3 '
           +'        group by YMD_SALE, NO_POS, NO_RCP '
           +'        having CNT_RCP > 1) as c on c.YMD_SALE = h.YMD_SALE and c.NO_POS = h.NO_POS and c.NO_RCP = h.NO_RCP  '
           +' where h.CD_HEAD  =:P0 '
           +'   and h.CD_STORE =:P1 '
           +'   and h.YMD_SALE between :P2 and :P3 '
           +' order by h.YMD_SALE, h.NO_POS, h.NO_RCP ',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
  GridDBTableView.DataController.DataSource := nil;
  DM.ReadQuery(Query, nil, MemData);
  GridDBTableView.DataController.DataSource := DataSource;
  Result := GridDBTableView.DataController.RecordCount > 0;

  if GridDBTableView.DataController.RecordCount > 0 then
  begin
    // 판매 디테일 쿼리를 열어 그리드에 보여준다
    OpenQuery('select h.DT_HIST, '
             +'       case h.DS_SALE  when ''S'' then ''판매'' '
             +'                       when ''V'' then ''취소'' '
             +'                       when ''C'' then ''결제변경'' '
             +'                       when ''P'' then ''포인트적립'' '
             +'                       when ''M'' then ''선결제'' '
             +'                       when ''B'' then ''반품'' '
             +'                       when ''H'' then ''현금영수증'' '
             +'       end as DS_SALE, '
             +'       h.AMT_SALE, '
             +'       h.AMT_CASH+h.AMT_CHECK-h.AMT_CASHRCP as AMT_CASH, '
             +'       h.AMT_CASHRCP, '
             +'       h.AMT_CARD, '
             +'       h.AMT_LETSORDER, '
             +'       h.AMT_TRUST, '
             +'       h.AMT_GIFT, '
             +'       h.AMT_BANK, '
             +'       h.AMT_SERVICE, '
             +'       h.DC_TOT, '
             +'       ConCat(m.NM_MEMBER,''('',h.CD_MEMBER,'')'') as NM_MEMBER, '
             +'       h.PNT_OCCUR, '
             +'       h.DC_POINT, '
             +'       ConCat(h.YMD_SALE,h.NO_POS,h.NO_RCP) as LINK '
             +'  from SL_SALE_H_HIST h left outer join '
             +'       MS_MEMBER      m on h.CD_HEAD   = m.CD_HEAD '
             +'                       and m.CD_STORE  = :P4 '
             +'                       and h.CD_MEMBER = m.CD_MEMBER '
             +' where h.CD_HEAD  =:P0 '
             +'   and h.CD_STORE =:P1 '
             +'   and h.YMD_SALE between :P2 and :P3 '
             +' order by h.YMD_SALE, h.NO_POS, h.NO_RCP, h.DT_HIST desc',
              [HeadStoreCode,
               StoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    GridSubDBTableView.DataController.DataSource := nil;
    DM.ReadQuery(Query, nil, SubMemData);
    GridSubDBTableView.DataController.DataSource := SubDataSource;
  end;
end;

procedure TSaleReceiptChangeShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet := MemData;
  SubDataSource.DataSet := SubMemData;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
end;

end.
