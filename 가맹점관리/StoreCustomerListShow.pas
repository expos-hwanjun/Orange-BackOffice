unit StoreCustomerListShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, IPPeerClient, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  StrUtils, Math, cxCurrencyEdit, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager,
  AdvOfficePagerStylers;

type
  TStoreCustomerListShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewColumn12: TcxGridColumn;
    GridTableViewColumn13: TcxGridColumn;
    GridTableViewColumn14: TcxGridColumn;
    GridTableViewColumn15: TcxGridColumn;
    GridTableViewColumn16: TcxGridColumn;
    GridTableViewColumn17: TcxGridColumn;
    GridTableViewColumn18: TcxGridColumn;
    GridTableViewColumn19: TcxGridColumn;
    GridTableViewColumn20: TcxGridColumn;
    GridTableViewColumn21: TcxGridColumn;
    GridTableViewColumn22: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override;                      // 조회
  public
    { Public declarations }
  end;

var
  StoreCustomerListShowForm: TStoreCustomerListShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStoreCustomerListShowForm }

function TStoreCustomerListShowForm.DoSearch: Boolean;
begin
  OpenQuery('select c.NM_PARTNER, '
           +'       i.NM_PARTNER as SUB_PARTNER, '
           +'       b.NM_COMPANY, '
           +'       a.CD_CUSTOMER, '
           +'       a.NM_CUSTOMER, '
           +'       a.ALLOW_POS, '
           +'       a.ALLOW_KIOSK, '
           +'       a.ALLOW_TABLET, '
           +'       StoD(a.YMD_SETUP) as YMD_SETUP, '
           +'       GetPhoneNo(a.TEL_MOBILE) as TEL_MOBILE, '
           +'       ConCat(a.ADDR1,a.ADDR2) as ADDR, '
           +'       case a.DS_LICENSE when ''P'' then ''협력사'' when ''C'' then ''매장'' end as DS_LICENSE, '
           +'       a.AMT_ASP, '
           +'       StoD(a.YMD_PAYEND) as YMD_PAYEND, '
           +'       d.NM_CODE1 as NM_LOCAL, '
           +'       e.NM_CODE1 as NM_MANAGER, '
           +'       f.NM_CODE1 as UPJONG, '
           +'       g.NM_CODE1 as STORE_SIZE, '
           +'       h.NM_CODE1 as VAN, '
           +'       ConCat(StoD(a.STIPULATE_FROM),''~'',StoD(a.STIPULATE_TO)) as STIPULATE_DATE, '
           +'       a.STIPULATE_COUNT, '
           +'       a.RENTAL_FEE, '
           +'       case a.DS_VAN when ''I'' then ''IC인증'' when ''V'' then ''가상단말기'' when ''C'' then ''단말기연동'' end DS_VAN, '
           +'       case a.DS_STATUS when ''0'' then ''정상'' when ''1'' then ''해지'' when ''D'' then ''데모'' when ''E'' then ''데모만료'' when ''R'' then ''해지요청''  end DS_STATUS '
           +'  from CUSTOMER a inner join '
           +'       COMPANY  b on b.CD_COMPANY = a.CD_COMPANY inner join '
           +'       PARTNER  c on c.CD_PARTNER = a.CD_PARTNER left outer join '
           +'       CODE     d on d.CD_PARTNER = a.CD_PARTNER and d.DS_CODE = ''01'' and d.CD_CODE = a.CD_LOCAL left outer join '
           +'       CODE     e on e.CD_PARTNER = a.CD_PARTNER and e.DS_CODE = ''02'' and e.CD_CODE = a.CD_MANAGER left outer join '
           +'       CODE     f on f.CD_PARTNER = a.CD_PARTNER and f.DS_CODE = ''03'' and f.CD_CODE = a.CD_UPJONG left outer join '
           +'       CODE     g on g.CD_PARTNER = a.CD_PARTNER and g.DS_CODE = ''04'' and g.CD_CODE = a.CD_STORESIZE left outer join '
           +'       CODE     h on h.CD_PARTNER = a.CD_PARTNER and h.DS_CODE = ''05'' and h.CD_CODE = a.CD_VAN left outer join '
           +'       PARTNER_SUB  i on g.CD_PARTNER = a.CD_PARTNER and i.CD_PARTNER_SUB = a.CD_PARTNER_SUB  '
           +' where a.NM_CUSTOMER like ConCat(''%'',:P0,''%'') '
           +GetStrPointerData(ConditionToolBarComboBox)
           +Ifthen(UserLevel='P',Format(' and a.CD_PARTNER = (select CD_PARTNER '
                                       +'                       from USER_MASTER '
                                       +'                      where ID_USER =''%s'') ',[UserCode]),'')
           +' order by a.CD_CUSTOMER ',
           [ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStoreCustomerListShowForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''0'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('정상', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''D'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('데모', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''E'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('데모종료', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''R'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('해지요청', TObject(vCode));
  New(vCode);
  vCode^.Data := ' and a.DS_STATUS = ''1'' ';
  ConditionToolBarComboBox.Properties.Items.AddObject('해지', TObject(vCode));
  New(vCode);
  vCode^.Data := '';
  ConditionToolBarComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;
end;

end.
