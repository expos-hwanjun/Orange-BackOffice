unit StoreSaleShow;

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
  cxGridCustomTableView, cxGridTableView, dxPSCore, dxPScxCommon, Vcl.Menus,
  System.ImageList, Vcl.ImgList, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, StrUtils, Math, cxCurrencyEdit, DateUtils,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TStoreSaleShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewStoreCode: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewCardAmt: TcxGridColumn;
    GridTableViewCashAmt: TcxGridColumn;
    GridTableViewEtcAmt: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override;                      // 조회
    { Public declarations }
  end;

var
  StoreSaleShowForm: TStoreSaleShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStoreSaleShowForm }
procedure TStoreSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
end;

function TStoreSaleShowForm.DoSearch: Boolean;
var vTemp, vTemp1, vTemp2 :String;
    vIndex, vRow :Integer;
    vServerList :TStringList;
begin
  if DaysBetween(ConditionToolBarToDateEdit.Date, ConditionToolBarFromDateEdit.Date) > 31 then
  begin
    ErrBox('조회기간은 최대 1개월입니다');
    Exit;
  end;


  try
    OpenQuery('select c.NM_PARTNER, '
             +'       b.NM_COMPANY, '
             +'       a.CD_CUSTOMER, '
             +'       a.NM_CUSTOMER, '
             +'       a.STIPULATE_COUNT, '
             +'       StoD(a.STIPULATE_TO) as STIPULATE_TO '
             +'  from CUSTOMER a inner join '
             +'       COMPANY  b on b.CD_COMPANY = a.CD_COMPANY inner join '
             +'       PARTNER  c on c.CD_PARTNER = a.CD_PARTNER '
             +' where a.NM_CUSTOMER like ConCat(''%'',:P0,''%'') '
             +'   and a.DS_STATUS in (''0'',''D'') '
             +'   and a.DS_CUSTOMER = ''O'' '
             +'   and b.ID_SERVER not in (''9999'',''9998'') '
             +'   and a.CD_PARTNER <> ''0026'' '
             +GetStrPointerData(ConditionToolBarComboBox)
             +Ifthen(UserLevel='P',Format(' and a.CD_PARTNER = (select CD_PARTNER '
                                         +'                       from USER_MASTER '
                                         +'                      where ID_USER =''%s'') ',[UserCode]),'')
             +' order by a.CD_CUSTOMER ',
             [ConditionToolBarEdit.Text],false,RestBaseURL);

    Result := DM.ReadQuery(Query, GridTableView);
    vTemp := '';
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
      vTemp := vTemp + Format('''%s'',',[GridTableView.DataController.Values[vIndex, GridTableViewStoreCode.Index]]);

    if vTemp <> '' then
    begin
      vServerList := TStringList.Create;
      vServerList.Clear;
      vTemp1 := Format(' where a.CD_STORE in (%s)',[LeftStr(vTemp, Length(vTemp)-1)]);
      vTemp2 := Format(' where CD_STORE in (%s)',[LeftStr(vTemp, Length(vTemp)-1)]);

      OpenQuery('select a.HTTPS_DOMAIN, '
               +'       case when c.SERVICE_TYPE = ''S'' then a.HTTPS_PORT else a.HTTPS_PORT_DIST end HTTPS_PORT, '
               +'       case when c.SERVICE_TYPE = ''S'' then '''' else c.NM_DATABASE end NM_DATABASE '
               +'  from SERVER_LIST   a inner join '
               +'       COMPANY       b on b.ID_SERVER = a.ID_SERVER inner join '
               +'       DATABASE_LIST c on  c.ID_SERVER = b.ID_SERVER and c.DB_SEQ = b.DB_SEQ '
               +' where a.ID_SERVER = 9999 '
               +'   and a.DS_SERVER  = ''O'' ',
               [],false,RestBaseURL);

      while not Query.Eof do
      begin
        vServerList.Add(Format('https://%s:%s/Orange/|%s',[Query.FieldByName('HTTPS_DOMAIN').AsString,
                                                           Query.FieldByName('HTTPS_PORT').AsString,
                                                           Query.FieldByName('NM_DATABASE').AsString]));
        Query.Next;
      end;
      Query.Close;

      for vIndex := 0 to vServerList.Count-1 do
      begin
        OpenQuery('select a.CD_HEAD, '
                 +'       a.CD_STORE, '
                 +'       Sum(Ifnull(a.AMT_SALE,0)) as AMT_SALE, '
                 +'       Sum(Ifnull(a.AMT_CARD,0)) as AMT_CARD, '
                 +'       Sum(Ifnull(a.AMT_CASH,0)) as AMT_CASH, '
                 +'       Sum(Ifnull(a.AMT_SALE,0)-Ifnull(a.AMT_CARD,0)-Ifnull(a.AMT_CASH,0)) as AMT_ETC, '
                 +'       Sum(Ifnull(a.CNT_CUSTOMER,0)) as CNT_CUSTOMER '
                 +'  from SL_SALE_H_SUM a left outer join '
                 +vTemp1
                 +' and a.YMD_SALE between :P0 and :P1 '
                 +' group by a.CD_HEAD, a.CD_STORE ',
                 [DtoS(ConditionToolBarFromDateEdit.Date),
                  DtoS(ConditionToolBarToDateEdit.Date)],false,vServerList.Strings[vIndex]);

        GridTableView.DataController.BeginUpdate;
        while not Query.Eof do
        begin
          vRow := GridTableView.DataController.FilteredIndexByRecordIndex[GridTableView.DataController.FindRecordIndexByText(0, GridTableViewStoreCode.Index, Query.FieldByName('CD_STORE').AsString, false, false, true)];
          if vRow >= 0 then
          begin
            GridTableView.DataController.Values[vRow, GridTableViewSaleAmt.Index]      := Query.FieldByName('AMT_SALE').AsCurrency;
            GridTableView.DataController.Values[vRow, GridTableViewCardAmt.Index]      := Query.FieldByName('AMT_CARD').AsCurrency;
            GridTableView.DataController.Values[vRow, GridTableViewCashAmt.Index]      := Query.FieldByName('AMT_CASH').AsCurrency;
            GridTableView.DataController.Values[vRow, GridTableViewEtcAmt.Index]       := Query.FieldByName('AMT_ETC').AsCurrency;
          end;
          Query.Next;
        end;
        GridTableView.DataController.EndUpdate;
      end;

    end;
  finally
    Query.Close;
  end;
end;


end.
