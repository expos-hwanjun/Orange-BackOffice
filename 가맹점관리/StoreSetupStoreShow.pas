unit StoreSetupStoreShow;

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
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLabel, cxMemo,
  cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxCalendar, AdvGlowButton, StrUtils, cxCurrencyEdit;

type
  TStoreSetupStoreShowForm = class(TInheritShowForm)
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
    GridTableViewColumn13: TcxGridColumn;
    GridTableViewColumn14: TcxGridColumn;
    GridTableViewColumn15: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableView1Column9: TcxGridColumn;
    GridTableView1Column10: TcxGridColumn;
    GridTableView1Column11: TcxGridColumn;
    GridTableView1Column12: TcxGridColumn;
    GridTableView1Column13: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // 조회
  end;

var
  StoreSetupStoreShowForm: TStoreSetupStoreShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

function TStoreSetupStoreShowForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select StoD(a.YMD_SETUP) as YMD_SETUP, '
             +'       c.NM_PARTNER, '
             +'       i.NM_PARTNER as SUB_PARTNER, '
             +'       b.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       a.ALLOW_POS, '
             +'       a.ALLOW_KIOSK, '
             +'       e.NM_CODE1 as MANAGER, '
             +'       GetPhoneNo(a.TEL_MOBILE) as TEL_MOBILE, '
             +'       ConCat(a.ADDR1,a.ADDR2) as ADDR, '
             +'       h.NM_CODE1 as VAN, '
             +'       case when a.DS_STATUS = ''D'' then DATE_FORMAT(ADDDATE(a.YMD_SETUP, 15),''%Y-%m-%d'') else '''' end as DEMO_EXPIRE, '
             +'       case a.DS_STATUS when ''0'' then ''정상'' when ''D'' then ''데모'' when ''E'' then ''데모만료'' when ''R'' then ''해지요청''  end DS_STATUS '
             +'  from CUSTOMER a inner join '
             +'       COMPANY  b on b.CD_COMPANY = a.CD_COMPANY inner join '
             +'       PARTNER  c on c.CD_PARTNER = a.CD_PARTNER left outer join '
             +'       CODE     e on e.CD_PARTNER = a.CD_PARTNER and e.DS_CODE = ''02'' and e.CD_CODE = a.CD_MANAGER left outer join '
             +'       CODE     h on h.CD_PARTNER = a.CD_PARTNER and h.DS_CODE = ''05'' and h.CD_CODE = a.CD_VAN left outer join '
             +'       PARTNER_SUB  i on c.CD_PARTNER = a.CD_PARTNER and i.CD_PARTNER_SUB = a.CD_PARTNER_SUB  '
             +' where a.YMD_SETUP between :P0 and :P1 '
             +'   and a.NM_CUSTOMER like ConCat(''%'',:P2,''%'') '
             +'   and c.CD_PARTNER <> ''0026'' '
             +Ifthen(UserLevel='P',Format(' and a.CD_PARTNER = (select CD_PARTNER '
                                         +'                       from USER_MASTER '
                                         +'                      where ID_USER =''%s'') ',[UserCode]),'')
             +' order by a.CD_CUSTOMER ',
             [DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarEdit.Text],false,RestBaseURL);
    Result := DM.ReadQuery(Query, GridTableView);
  end
  else
  begin
    OpenQuery('select StoD(a.YMD_LICENSE) as YMD_LICENSE, '
             +'       c.NM_PARTNER, '
             +'       i.NM_PARTNER as SUB_PARTNER, '
             +'       b.NM_COMPANY, '
             +'       case a.DS_CUSTOMER when ''O'' then ''오렌지'' when ''E'' then ''ERP'' when ''M'' then ''유통'' when ''T'' then ''테마파크'' when ''S'' then ''스포츠센터'' end as DS_SOLUTION, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       a.ALLOW_POS, '
             +'       a.ALLOW_KIOSK, '
             +'       e.NM_CODE1 as MANAGER, '
             +'       GetPhoneNo(a.TEL_MOBILE) as TEL_MOBILE, '
             +'       StoD(a.YMD_SETUP) as YMD_SETUP, '
             +'       ConCat(a.ADDR1,a.ADDR2) as ADDR, '
             +'       h.NM_CODE1 as VAN, '
             +'       case a.DS_STATUS when ''0'' then ''정상'' when ''D'' then ''데모'' when ''E'' then ''데모만료'' when ''R'' then ''해지요청''  end DS_STATUS '
             +'  from CUSTOMER a inner join '
             +'       COMPANY  b on b.CD_COMPANY = a.CD_COMPANY inner join '
             +'       PARTNER  c on c.CD_PARTNER = a.CD_PARTNER left outer join '
             +'       CODE     e on e.CD_PARTNER = a.CD_PARTNER and e.DS_CODE = ''02'' and e.CD_CODE = a.CD_MANAGER left outer join '
             +'       CODE     h on h.CD_PARTNER = a.CD_PARTNER and h.DS_CODE = ''05'' and h.CD_CODE = a.CD_VAN left outer join '
             +'       PARTNER_SUB  i on c.CD_PARTNER = a.CD_PARTNER and i.CD_PARTNER_SUB = a.CD_PARTNER_SUB  '
             +' where a.YMD_LICENSE between :P0 and :P1 '
             +'   and a.NM_CUSTOMER like ConCat(''%'',:P2,''%'') '
             +'   and a.DS_STATUS in (''0'',''R'') '
             +'   and c.CD_PARTNER <> ''0026'' '
             +Ifthen(UserLevel='P',Format(' and a.CD_PARTNER = (select CD_PARTNER '
                                         +'                       from USER_MASTER '
                                         +'                      where ID_USER =''%s'') ',[UserCode]),'')
             +' order by a.CD_CUSTOMER ',
             [DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              ConditionToolBarEdit.Text],false,RestBaseURL);
    Result := DM.ReadQuery(Query, GridTableView1);
  end;


end;

procedure TStoreSetupStoreShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
end;

end.
