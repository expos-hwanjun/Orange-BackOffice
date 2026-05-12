unit HeadSalePayShow;

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
  AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, StrUtils;

type
  THeadSalePayShowForm = class(TInheritShowForm)
    GridTableViewStoreName: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewCashRcpAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewGiftAmt: TcxGridColumn;
    GridTableViewPointAmt: TcxGridColumn;
    GridTableViewTrustAmt: TcxGridColumn;
    GridTableViewBankAmt: TcxGridColumn;
    GridTableViewEtcAmt: TcxGridColumn;
    GridTableViewStoreCode: TcxGridColumn;
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
    GridTableView1Column10: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadSalePayShowForm: THeadSalePayShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ THeadSalePayShowForm }
procedure THeadSalePayShowForm.FormCreate(Sender: TObject);
var
  vCode  :PStrPointer;
begin
  inherited;
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;

  OpenQuery('select CD_STORE,  '
           +'       NM_STORE_SHORT '
           +'  from MS_STORE '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE <> :P1 '
           +'   and YN_USE = ''Y'' '
           +' order by CD_STORE ',
           [HeadStoreCode,
            StandardStore]);
  try
    ConditionToolBarComboBox.Properties.Items.Clear;
    New(vCode);
    vCode^.Data := '';
    ConditionToolBarComboBox.Properties.Items.AddObject('전매장', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    ConditionToolBarComboBox.ItemIndex := 0;
    Query.Close;
  end;

end;

procedure THeadSalePayShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
    GridLevel1.Caption := Format('[%s] 일자별 매출 ',[GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreName.Index]])
  else
    GridLevel1.Caption := ' 일자별 매출 ';
end;

procedure THeadSalePayShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

function THeadSalePayShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vDestStoreCode  :String;
begin
  inherited;
  SetWorkStoreList;
  if Tag = 0 then
  begin
    if Grid.ActiveLevel = GridLevel then
    begin
      vDestStoreCode := '';
      for vIndex := 1 to WorkStoreList.Count-1 do
        vDestStoreCode := vDestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);

      if vDestStoreCode = '' then Exit;
      vDestStoreCode := Format(' in (%s) ',[LeftStr(vDestStoreCode, Length(vDestStoreCode)-1)]);

      OpenQuery('select s.NM_STORE_SHORT, '
               +'       h.AMT_SALE, '
               +'       h.AMT_CASH, '
               +'       h.AMT_CASHRCP, '
               +'       h.AMT_CARD, '
               +'       h.AMT_GIFT, '
               +'       h.AMT_TRUST, '
               +'       h.AMT_BANK, '
               +'       h.AMT_POINT, '
               +'       h.AMT_ETC, '
               +'       s.CD_STORE '
               +'  from MS_STORE as s left outer join '
               +'       (select CD_STORE, '
               +'               Sum(AMT_SALE) as AMT_SALE, '
               +'               Sum(AMT_CASH) as AMT_CASH, '
               +'               Sum(AMT_CASHRCP) as AMT_CASHRCP, '
               +'               Sum(AMT_CARD) as AMT_CARD, '
               +'               Sum(AMT_GIFT) as AMT_GIFT, '
               +'               Sum(AMT_TRUST) as AMT_TRUST, '
               +'               Sum(AMT_BANK)  as AMT_BANK, '
               +'               Sum(AMT_POINT+DC_POINT)  as AMT_POINT, '
               +'               Sum(AMT_ETC)  as AMT_ETC '
               +'        from   SL_SALE_H_SUM  '
               +'        where  CD_HEAD  =:P0 '
               +'          and  CD_STORE '+vDestStoreCode
               +'          and  YMD_SALE between :P1 and :P2 '
               +'         group by CD_STORE ) as h on h.CD_STORE = s.CD_STORE '
               +' where s.CD_HEAD =:P0 '
               +'   and s.CD_STORE '+vDestStoreCode
               +'   and s.YN_USE = ''Y'' '
               +' order by 2 desc ',
                [HeadStoreCode,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);

      Result := DM.ReadQuery(Query, GridTableView);
    end
    else if GridTableView.DataController.GetFocusedRecordIndex >= 0 then
    begin
      OpenQuery('select StoDW(YMD_SALE) as YMD_SALE, '
               +'       Sum(AMT_SALE) as AMT_SALE, '
               +'       Sum(AMT_CASH) as AMT_CASH, '
               +'       Sum(AMT_CASHRCP) as AMT_CASHRCP, '
               +'       Sum(AMT_CARD) as AMT_CARD, '
               +'       Sum(AMT_GIFT) as AMT_GIFT, '
               +'       Sum(AMT_TRUST) as AMT_TRUST, '
               +'       Sum(AMT_BANK)  as AMT_BANK, '
               +'       Sum(AMT_POINT+DC_POINT)  as AMT_POINT, '
               +'       Sum(AMT_ETC)  as AMT_ETC '
               +'  from SL_SALE_H_SUM  '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and YMD_SALE between :P2 and :P3 '
               +'  group by YMD_SALE '
               +' order by 1 ',
                [HeadStoreCode,
                 GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStoreCode.Index],
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)]);
      Result := DM.ReadQuery(Query, GridTableView1);
    end;
  end
  else
  begin
    if GetStrPointerData(ConditionToolBarComboBox) = '' then
    begin
      vDestStoreCode := '';
      for vIndex := 1 to WorkStoreList.Count-1 do
        vDestStoreCode := vDestStoreCode + Format('''%s'',',[CopyPos(WorkStoreList.Strings[vIndex], splitColumn, 0)]);

      if vDestStoreCode = '' then Exit;
      vDestStoreCode := Format(' in (%s) ',[LeftStr(vDestStoreCode, Length(vDestStoreCode)-1)]);
    end
    else
      vDestStoreCode := Format(' in (''%s'') ',[GetStrPointerData(ConditionToolBarComboBox)]);

    OpenQuery('select StoDW(YMD_SALE) as YMD_SALE, '
             +'       Sum(AMT_SALE) as AMT_SALE, '
             +'       Sum(AMT_CASH) as AMT_CASH, '
             +'       Sum(AMT_CASHRCP) as AMT_CASHRCP, '
             +'       Sum(AMT_CARD) as AMT_CARD, '
             +'       Sum(AMT_GIFT) as AMT_GIFT, '
             +'       Sum(AMT_TRUST) as AMT_TRUST, '
             +'       Sum(AMT_BANK)  as AMT_BANK, '
             +'       Sum(AMT_POINT+DC_POINT)  as AMT_POINT, '
             +'       Sum(AMT_ETC)  as AMT_ETC '
             +'  from SL_SALE_H_SUM  '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE '+vDestStoreCode
             +'   and YMD_SALE between :P1 and :P2 '
             +' group by YMD_SALE '
             +' order by 1 ',
              [HeadStoreCode,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date)]);

    Result := DM.ReadQuery(Query, GridTableView);
  end;
end;



end.
