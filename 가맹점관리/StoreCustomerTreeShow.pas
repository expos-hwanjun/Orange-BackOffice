unit StoreCustomerTreeShow;

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
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxGridCustomTableView,
  cxGridTableView, Vcl.ExtCtrls, AdvSplitter, cxTreeView, dxPSCore,
  dxPScxCommon, Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, StrUtils, cxCurrencyEdit, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TStoreCustomerTreeShowForm = class(TInheritShowForm)
    TreeView: TcxTreeView;
    GridSplitter: TAdvSplitter;
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
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1DsUser: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    GridTableViewColumn13: TcxGridColumn;
    GridTableViewColumn14: TcxGridColumn;
    procedure FormShow(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewDblClick(Sender: TObject);
    procedure TreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    procedure StoreGridView(aCode:String);
    procedure SetUserGridView(aCode:String);
  public
    { Public declarations }
  end;

var
  StoreCustomerTreeShowForm: TStoreCustomerTreeShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TStoreCustomerTreeShowForm.FormCreate(Sender: TObject);
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

procedure TStoreCustomerTreeShowForm.FormShow(Sender: TObject);
var
  vPartnerCode: PStrPointer;
  vTreeNode : TTreeNode;
begin
  inherited;
  if Tag = 0 then
    OpenQuery('select  CD_PARTNER, '
             +'        NM_PARTNER '
             +'  from  PARTNER '
             +' where  YN_USE = ''Y'' '
             +' order  by CD_PARTNER ',
              [''],false,RestBaseURL)
  else
    OpenQuery('select  CD_PARTNER_SUB, '
             +'        NM_PARTNER '
             +'  from  PARTNER_SUB '
             +' where  YN_USE = ''Y'' '
             +' order  by CD_PARTNER_SUB ',
              [PartnerCode],false,RestBaseURL);

  try
    while not Query.Eof do
    begin
      New(vPartnerCode);
      vPartnerCode^.Data := Query.Fields[0].AsString;
      vTreeNode        := TreeView.Items.AddObject(nil, Query.Fields[1].AsString, vPartnerCode);
      vTreeNode.HasChildren := true;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;

procedure TStoreCustomerTreeShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if Grid.ActiveLevel = GridLevel1 then
  begin
  end;

end;

procedure TStoreCustomerTreeShowForm.GridTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableView1DsUser.Index] = '본사' then
    AStyle := StyleFontBlue;
end;

procedure TStoreCustomerTreeShowForm.TreeViewChange(Sender: TObject;
  Node: TTreeNode);
var
  vPartnerData: PStrPointer;
  vPartnerName: string;
  vTreeNode : TTreeNode;
begin
  inherited;
  // 선택된 노드가 있고 자식이 없는 노드라면
  vTreeNode := TreeView.Selected;
  vPartnerData              := vTreeNode.Data;
  if (vTreeNode <> nil) then
  begin
    StoreGridView(vPartnerData^.Data);
    SetUserGridView(vPartnerData^.Data);
  end;
end;

procedure TStoreCustomerTreeShowForm.TreeViewDblClick(Sender: TObject);
var
  vPartnerData: PStrPointer;
  vPartnerName: string;
  vTreeNode : TTreeNode;
begin
  inherited;

  // 선택된 노드가 있고 자식이 없는 노드라면
  vTreeNode := (Sender as TcxTreeView).Selected;

  //상품정보의 상품분류 검색버튼을 클릭했을경우
  if (vTreeNode <> nil) then
  begin
    vPartnerData              := vTreeNode.Data;
    vPartnerName              := vTreeNode.Text;
    while vTreeNode.Parent <> nil do
    begin
      vTreeNode  := vTreeNode.Parent;
      vPartnerName := vTreeNode.Text+' - '+vPartnerName;
    end;
  end;
end;

procedure TStoreCustomerTreeShowForm.TreeViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  vPartnerData, vPartnerCode: PStrPointer;
  vTreeNode: TTreeNode;
begin
  inherited;
  // 현재 노드의 자식이 있다고 하면서 실제로는 자식이 없는 경우에는 새로 쿼리를 해 본다(최초 확장 시)
  if Node.HasChildren and (Node.Count = 0) then
  begin
    vPartnerData := Node.Data;
    if Tag = 0 then
      OpenQuery('select   CD_COMPANY, '
               +'         NM_COMPANY '
               +'  from   COMPANY '
               +' where   CD_PARTNER = :P0 '
               +'   and   YN_USE = ''Y'' ',
                [vPartnerData^.Data],false,RestBaseURL)
    else
      OpenQuery('select   CD_COMPANY, '
               +'         NM_COMPANY '
               +'  from   COMPANY '
               +' where   CD_PARTNER = :P0 '
               +'   and   CD_PARTNER = :P1 '
               +'   and   YN_USE = ''Y'' ',
                [PartnerCode,
                 vPartnerData^.Data],false,RestBaseURL);
    try
      while not Query.Eof do
      begin
        New(vPartnerCode);
        vPartnerCode^.Data := vPartnerData^.Data + Query.Fields[0].AsString;
        vTreeNode        := (Sender as TcxCustomInnerTreeView).Items.AddChildObject(Node, Query.Fields[1].AsString, vPartnerCode);
        vTreeNode.HasChildren := false;
        Query.Next;
      end;
      Node.HasChildren := Node.Count > 0;
      AllowExpansion   := Node.HasChildren;
    finally
      FinishQuery;
    end;
  end;
end;

procedure TStoreCustomerTreeShowForm.SetUserGridView(aCode:String);
var vWhere :String;
begin
  if Tag = 0 then
  begin
    if Length(aCode) = 4 then
      vWhere := Format(' where Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER = ''%s'' ',[aCode])
    else
      vWhere := Format(' where Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER = ''%s'' and a.CD_COMPANY = ''%s'' ',[LeftStr(aCode,4), RightStr(aCode,8)]);

    OpenQuery('select c.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       case a.DS_CUSTOMER when ''O'' then ''오렌지'' when ''E'' then ''ERP'' when ''M'' then ''유통'' when ''S'' then ''사우나'' end DS_SOLUTION, '
             +'       d.ID_USER, '
             +'       d.NM_USER, '
             +'       d.PW_USER, '
             +'       case d.USER_LEVEL when ''C'' then ''본사'' when ''S'' then ''매장'' end DS_USER, '
             +'       case d.DS_STATUS  when ''0'' then ''정상'' when ''1'' then ''중지'' end DS_STATUS '
             +' from  CUSTOMER as    a left outer join '
             +'       USER_CUSTOMER  d on d.CD_COMPANY = a.CD_COMPANY and d.CD_CUSTOMER = a.CD_CUSTOMER inner join '
             +'       COMPANY        c on c.CD_COMPANY = a.CD_COMPANY and c.YN_USE = ''Y'' '
             +vWhere
             +GetStrPointerData(ConditionToolBarComboBox),
             [],false,RestBaseURL);
  end
  else
  begin
    if Length(aCode) = 4 then
      vWhere := Format(' and Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER_SUB = ''%s'' ',[aCode])
    else
      vWhere := Format(' and Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER_SUB = ''%s'' and a.CD_COMPANY = ''%s'' ',[LeftStr(aCode,4), RightStr(aCode,8)]);

    OpenQuery('select c.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       case a.DS_CUSTOMER when ''O'' then ''오렌지'' when ''E'' then ''ERP'' when ''M'' then ''유통'' when ''S'' then ''사우나'' end DS_SOLUTION, '
             +'       d.ID_USER, '
             +'       d.NM_USER, '
             +'       d.PW_USER, '
             +'       case d.USER_LEVEL when ''C'' then ''본사'' when ''S'' then ''매장'' end DS_USER, '
             +'       case d.DS_STATUS  when ''0'' then ''정상'' when ''1'' then ''중지'' end DS_STATUS '
             +' from  CUSTOMER as    a left outer join '
             +'       USER_CUSTOMER  d on d.CD_COMPANY = a.CD_COMPANY and d.CD_CUSTOMER = a.CD_CUSTOMER inner join '
             +'       COMPANY        c on c.CD_COMPANY = a.CD_COMPANY and c.YN_USE = ''Y'' '
             +vWhere
             +GetStrPointerData(ConditionToolBarComboBox),
             [],false,RestBaseURL);

  end;
  DM.ReadQuery(Query, GridTableView1);

end;

procedure TStoreCustomerTreeShowForm.StoreGridView(aCode: String);
var vWhere :String;
begin
  if Tag = 0 then
  begin
    if Length(aCode) = 4 then
      vWhere := Format(' where Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER = ''%s'' ',[aCode])
    else
      vWhere := Format(' where Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER = ''%s'' and a.CD_COMPANY = ''%s'' ',[LeftStr(aCode,4), RightStr(aCode,8)]);

    OpenQuery('select c.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       case a.DS_CUSTOMER when ''O'' then ''오렌지'' when ''E'' then ''ERP'' when ''M'' then ''유통'' when ''S'' then ''사우나'' when ''T'' then ''테마파크'' end DS_SOLUTION, '
             +'       a.ALLOW_POS, '
             +'       a.ALLOW_KIOSK, '
             +'       a.ALLOW_TABLET + Ifnull(q.QR_TABLET,0) as ALLOW_TABLET, '
             +'       StoD(a.YMD_SETUP) as YMD_SETUP, '
             +'       case when Substring(a.OPTIONS,9,1) = ''1'' then ''Y'' end DS_LETSORDER, '
             +'       GetPhoneNo(a.TEL_MOBILE) as TEL_MOBILE, '
             +'       ConCat(a.ADDR1,a.ADDR2) as ADDR, '
             +'       d.NM_CODE1 as NM_LOCAL, '
             +'       e.NM_CODE1 as NM_MANAGER, '
             +'       f.NM_CODE1 as UPJONG, '
             +'       g.NM_CODE1 as STORE_SIZE, '
             +'       h.NM_CODE1 as VAN, '
             +'       a.AMT_ASP, '
             +'       case a.DS_VAN when ''I'' then ''IC인증'' when ''V'' then ''가상단말기'' when ''C'' then ''단말기연동'' end DS_VAN, '
             +'       case a.DS_STATUS when ''0'' then ''정상'' when ''1'' then ''해지'' when ''D'' then ''데모'' when ''E'' then ''데모만료'' when ''R'' then ''해지요청''  end DS_STATUS '
             +' from  CUSTOMER as a left outer join '
             +'       CODE     d on d.CD_PARTNER = a.CD_PARTNER and d.DS_CODE = ''01'' and d.CD_CODE = a.CD_LOCAL left outer join '
             +'       CODE     e on e.CD_PARTNER = a.CD_PARTNER and e.DS_CODE = ''02'' and e.CD_CODE = a.CD_MANAGER left outer join '
             +'       CODE     f on f.CD_PARTNER = a.CD_PARTNER and f.DS_CODE = ''03'' and f.CD_CODE = a.CD_UPJONG left outer join '
             +'       CODE     g on g.CD_PARTNER = a.CD_PARTNER and g.DS_CODE = ''04'' and g.CD_CODE = a.CD_STORESIZE left outer join '
             +'       CODE     h on h.CD_PARTNER = a.CD_PARTNER and h.DS_CODE = ''05'' and h.CD_CODE = a.CD_VAN inner join '
             +'       COMPANY  c on c.CD_COMPANY = a.CD_COMPANY left outer join '
             +'      (select CD_CUSTOMER, '
             +'              Count(QR_CODE) as QR_TABLET '
             +'         from CUSTOMER_TABLET '
             +'        where YN_USE = ''Y'' '
             +'        group by CD_CUSTOMER) as q on q.CD_CUSTOMER = a.CD_CUSTOMER '
             +vWhere
             +GetStrPointerData(ConditionToolBarComboBox),
             [],false,RestBaseURL);
  end
  else
  begin
    if Length(aCode) = 4 then
      vWhere := Format(' and Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER_SUB = ''%s'' ',[aCode])
    else
      vWhere := Format(' and Length(a.CD_CUSTOMER) = 8 and a.DS_CUSTOMER in (''O'',''E'',''M'',''S'') and a.CD_PARTNER_SUB = ''%s'' and a.CD_COMPANY = ''%s'' ',[LeftStr(aCode,4), RightStr(aCode,8)]);

    OpenQuery('select c.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       case a.DS_CUSTOMER when ''O'' then ''오렌지'' when ''E'' then ''ERP'' when ''M'' then ''유통'' when ''S'' then ''사우나'' when ''T'' then ''테마파크'' end DS_SOLUTION, '
             +'       a.ALLOW_POS, '
             +'       a.ALLOW_KIOSK, '
             +'       a.ALLOW_TABLET + Ifnull(q.QR_TABLET,0) as ALLOW_TABLET, '
             +'       case when Substring(a.OPTIONS,9,1) = ''1'' then ''Y'' end DS_LETSORDER, '
             +'       StoD(a.YMD_SETUP) as YMD_SETUP, '
             +'       GetPhoneNo(a.TEL_MOBILE) as TEL_MOBILE, '
             +'       ConCat(a.ADDR1,a.ADDR2) as ADDR, '
             +'       d.NM_CODE1 as NM_LOCAL, '
             +'       e.NM_CODE1 as NM_MANAGER, '
             +'       f.NM_CODE1 as UPJONG, '
             +'       g.NM_CODE1 as STORE_SIZE, '
             +'       h.NM_CODE1 as VAN, '
             +'       a.AMT_ASP, '
             +'       case a.DS_VAN when ''I'' then ''IC인증'' when ''V'' then ''가상단말기'' when ''C'' then ''단말기연동'' end DS_VAN, '
             +'       case a.DS_STATUS when ''0'' then ''정상'' when ''1'' then ''해지'' when ''D'' then ''데모'' when ''E'' then ''데모만료'' when ''R'' then ''해지요청''  end DS_STATUS '
             +' from  CUSTOMER as a left outer join '
             +'       CODE     d on d.CD_PARTNER = a.CD_PARTNER and d.DS_CODE = ''01'' and d.CD_CODE = a.CD_LOCAL left outer join '
             +'       CODE     e on e.CD_PARTNER = a.CD_PARTNER and e.DS_CODE = ''02'' and e.CD_CODE = a.CD_MANAGER left outer join '
             +'       CODE     f on f.CD_PARTNER = a.CD_PARTNER and f.DS_CODE = ''03'' and f.CD_CODE = a.CD_UPJONG left outer join '
             +'       CODE     g on g.CD_PARTNER = a.CD_PARTNER and g.DS_CODE = ''04'' and g.CD_CODE = a.CD_STORESIZE left outer join '
             +'       CODE     h on h.CD_PARTNER = a.CD_PARTNER and h.DS_CODE = ''05'' and h.CD_CODE = a.CD_VAN inner join '
             +'       COMPANY  c on c.CD_COMPANY = a.CD_COMPANY left outer join '
             +'      (select CD_CUSTOMER, '
             +'              Count(QR_CODE) as QR_TABLET '
             +'         from CUSTOMER_TABLET '
             +'        where YN_USE = ''Y'' '
             +'        group by CD_CUSTOMER) as q on q.CD_CUSTOMER = a.CD_CUSTOMER '
             +' where a.CD_PARTNER =:P0 '
             +vWhere
             +GetStrPointerData(ConditionToolBarComboBox),
             [PartnerCode],false,RestBaseURL);
  end;
  DM.ReadQuery(Query, GridTableView);
end;

end.
