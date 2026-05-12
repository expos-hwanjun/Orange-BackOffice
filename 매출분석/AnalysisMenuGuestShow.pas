unit AnalysisMenuGuestShow;

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
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxGridBandedTableView, cxProgressBar, cxCurrencyEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TAnalysisMenuGuestShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    AgeTableView: TcxGridBandedTableView;
    AgeTableViewMenuCode: TcxGridBandedColumn;
    AgeTableViewColumn2: TcxGridBandedColumn;
    AgeTableViewColumn3: TcxGridBandedColumn;
    CustTableView: TcxGridBandedTableView;
    CustTableViewMenuCode: TcxGridBandedColumn;
    CustTableViewColumn2: TcxGridBandedColumn;
    CustTableViewColumn3: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  AnalysisMenuGuestShowForm: TAnalysisMenuGuestShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TAnalysisMenuGuestShowForm.FormCreate(Sender: TObject);
var
  vColumn: TcxGridBandedColumn;
  vCol   : Integer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;

  // ø¨∑…¥Î∫∞ ∞¥√˛ ƒÆ∑≥ º¬∆√
  OpenQuery('select   CD_CODE, '
           +'         NM_CODE1 '
           +'  from   MS_CODE '
           +' where   CD_HEAD   =:P0 '
           +'   and   CD_STORE  =:P1 '
           +'   and   CD_KIND   = ''04'' '
           +'   and   DS_STATUS = ''0'' '
           +' order by CD_CODE',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      AgeTableView.Bands.Add;
      AgeTableView.Bands[AgeTableView.Bands.Count-1].Caption := Query.Fields[1].AsString;

      DM.Query.Close;
      DM.OpenQuery('select   CD_CODE, '
                  +'         NM_CODE1 '
                  +'  from   MS_CODE '
                  +' where   CD_HEAD   =:P0 '
                  +'   and   CD_STORE  =:P1 '
                  +'   and   CD_KIND   = ''14'' '
                  +'   and   DS_STATUS = ''0'' '
                  +' order by CD_CODE',
                  [HeadStoreCode,
                   StoreCode]);
      vCol := 0;
      while not DM.Query.Eof do
      begin
        vColumn := AgeTableView.CreateColumn;
        with vColumn do
        begin
          Caption                   := DM.Query.Fields[1].AsString;
          Name                      := 'AGERATE_'+Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.FieldName     := Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.ValueType     := 'Currency';
          PropertiesClassName       := 'TcxProgressBarProperties';
          TcxCustomProgressBarProperties(Properties).BarStyle       := cxbsGradient;
          TcxCustomProgressBarProperties(Properties).BeginColor     := clSkyBlue;
          TcxCustomProgressBarProperties(Properties).EndColor       := clBlue;
          TcxCustomProgressBarProperties(Properties).SolidTextColor := true;
          HeaderAlignmentHorz       := taCenter;
          Options.Filtering         := false;
          Width                     := 50;
          Position.BandIndex        := AgeTableView.Bands.Count-1;
          Position.ColIndex         := vCol;
          Position.RowIndex         := 0;
        end;
        Inc(vCol);

        vColumn := AgeTableView.CreateColumn;
        with vColumn do
        begin
          Caption                   := DM.Query.Fields[1].AsString;
          Name                      := 'AGEAMT_'+Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.FieldName     := Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.ValueType     := 'Currency';
          PropertiesClassName       := 'TcxCurrencyEditProperties';
          HeaderAlignmentHorz       := taCenter;
          Options.Filtering         := false;
          Width                     := 90;
          Position.BandIndex        := AgeTableView.Bands.Count-1;
          Position.ColIndex         := vCol;
          Position.RowIndex         := 0;
          Visible                   := false;
        end;
        Inc(vCol);

        DM.Query.Next;
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  // ∞¥√˛∫∞ ∞¥√˛ ƒÆ∑≥ º¬∆√
  OpenQuery('select   CD_CODE, '
           +'         NM_CODE1 '
           +'  from   MS_CODE '
           +' where   CD_HEAD   =:P0 '
           +'   and   CD_STORE  =:P1 '
           +'   and   CD_KIND   = ''14'' '
           +'   and   DS_STATUS = ''0'' '
           +' order by CD_CODE',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      CustTableView.Bands.Add;
      CustTableView.Bands[CustTableView.Bands.Count-1].Caption := Query.Fields[1].AsString;

      DM.Query.Close;
      DM.OpenQuery('select   CD_CODE, '
                  +'         NM_CODE1 '
                  +'  from   MS_CODE '
                  +' where   CD_HEAD   =:P0 '
                  +'   and   CD_STORE  =:P1 '
                  +'   and   CD_KIND   = ''04'' '
                  +'   and   DS_STATUS = ''0'' '
                  +' order by CD_CODE',
                  [HeadStoreCode,
                   StoreCode]);
      vCol := 0;
      while not DM.Query.Eof do
      begin
        vColumn := CustTableView.CreateColumn;
        with vColumn do
        begin
          Caption                   := DM.Query.Fields[1].AsString;
          Name                      := 'CUSTRATE_'+Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.FieldName     := Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.ValueType     := 'Currency';
          PropertiesClassName       := 'TcxProgressBarProperties';
          TcxCustomProgressBarProperties(Properties).BarStyle       := cxbsGradient;
          TcxCustomProgressBarProperties(Properties).BeginColor     := clSkyBlue;
          TcxCustomProgressBarProperties(Properties).EndColor       := clBlue;
          TcxCustomProgressBarProperties(Properties).SolidTextColor := true;
          HeaderAlignmentHorz       := taCenter;
          Options.Filtering         := false;
          Width                     := 50;
          Position.BandIndex        := CustTableView.Bands.Count-1;
          Position.ColIndex         := vCol;
          Position.RowIndex         := 0;
          Tag                       := 0;
        end;
        Inc(vCol);

        vColumn := CustTableView.CreateColumn;
        with vColumn do
        begin
          Caption                   := DM.Query.Fields[1].AsString;
          Name                      := 'CUSTAMT_'+Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.FieldName     := Query.Fields[0].AsString + DM.Query.Fields[0].AsString;
          DataBinding.ValueType     := 'Currency';
          PropertiesClassName       := 'TcxCurrencyEditProperties';
          HeaderAlignmentHorz       := taCenter;
          Options.Filtering         := false;
          Width                     := 90;
          Position.BandIndex        := CustTableView.Bands.Count-1;
          Position.ColIndex         := vCol;
          Position.RowIndex         := 0;
          Visible                   := false;
        end;
        Inc(vCol);

        DM.Query.Next;
      end;
      Query.Next;
    end;
  finally
    FinishQuery;
  end;
end;


function TAnalysisMenuGuestShowForm.DoSearch: Boolean;
var vIndex :Integer;
    vRow   :Integer;
    vCol   :Integer;
begin
  if (IncMonth(ConditionToolBarToDateEdit.Date,-1) > ConditionToolBarFromDateEdit.Date) then
  begin
    MsgBox('√÷¥Î ¡∂»∏±‚∞£¿∫ 1∞≥ø˘¿‘¥œ¥Ÿ');
    Exit;
  end;

  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select a.CD_MENU, '
             +'       Max(b.NM_MENU) as NM_MENU, '
             +'       Sum(a.AMT_SALE-a.DC_TOT) as AMT_SALE '
             +'  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'       MS_MENU   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'   and a.DS_SALE <> ''V'' '
             +' group by a.CD_MENU '
             +' order by a.CD_MENU ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, AgeTableView);

    try
      OpenQuery('select d.CD_MENU, '
               +'       a.CD_AGE, '
               +'       h.CD_CUSTOMER, '
               +'       DivFlt(SUM(d.AMT_SALE-d.DC_TOT), c.CNT_CUST) as AMT_SALE '
               +'  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
               +'                     on h.CD_HEAD  = d.CD_HEAD '
               +'                    and h.CD_STORE = d.CD_STORE '
               +'                    and h.YMD_SALE = d.YMD_SALE '
               +'                    and h.NO_POS   = d.NO_POS '
               +'                    and h.NO_RCP   = d.NO_RCP inner join '
               +'       SL_SALE_AGE a on a.CD_HEAD  = h.CD_HEAD '
               +'                    and a.CD_STORE = h.CD_STORE '
               +'                    and a.YMD_SALE = h.YMD_SALE '
               +'                    and a.NO_POS   = h.NO_POS '
               +'                    and a.NO_RCP   = h.NO_RCP '
               +'                    and a.CNT_PERSON > 0 inner join '
               +'       (select YMD_SALE, '
               +'               NO_POS, '
               +'               NO_RCP, '
               +'               Count(*) as CNT_CUST '
               +'          from SL_SALE_AGE '
               +'         where CD_HEAD  =:P0 '
               +'           and CD_STORE =:P1 '
               +'           and YMD_SALE between :P2 and :P3 '
               +'           and CNT_PERSON <> 0 '
               +'         group by YMD_SALE, NO_POS, NO_RCP ) as c on c.YMD_SALE = h.YMD_SALE and c.NO_POS = h.NO_POS and c.NO_RCP = h.NO_RCP '
               +' where d.CD_HEAD  =:P0 '
               +'   and d.CD_STORE =:P1 '
               +'   and d.YMD_SALE between :P2 and :P3 '
               +'   and d.DS_SALE <> ''V'' '
               +' group by d.CD_MENU, a.CD_AGE, h.CD_CUSTOMER, c.CNT_CUST ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)]);
      AgeTableView.DataController.BeginUpdate;
      while not Query.Eof do
      begin
        vRow := AgeTableView.DataController.FindRecordIndexByText(0, AgeTableViewMenuCode.Index, Query.Fields[0].AsString, false, false, true);
        for vIndex := 0 to AgeTableView.ColumnCount-1 do
        begin
          if AgeTableView.Columns[vIndex].Name = 'AGEAMT_'+(Query.Fields[2].AsString + Query.Fields[1].AsString) then
          begin
            AgeTableView.DataController.Values[vRow, vIndex] := Nvl(AgeTableView.DataController.Values[vRow, vIndex],0) + Query.Fields[3].AsInteger;
            Break;
          end;
        end;
        Query.Next;
      end;

      for vIndex := 0 to AgeTableView.DataController.RecordCount-1 do
      begin
        for vCol := 3 to AgeTableView.ColumnCount-2 do
        begin
          if AgeTableView.DataController.Values[vIndex, 2] = 0 then
            AgeTableView.DataController.Values[vIndex, vCol] := 0
          else
            AgeTableView.DataController.Values[vIndex, vCol] := RoundNumber(NVL(AgeTableView.DataController.Values[vIndex, vCol+1],0) / AgeTableView.DataController.Values[vIndex, 2] * 100, 0.01);
        end;
      end;

      AgeTableView.DataController.EndUpdate;
    finally
      FinishQuery;
    end;
  end
  else
  begin
    OpenQuery('select a.CD_MENU, '
             +'       Max(b.NM_MENU) as NM_MENU, '
             +'       Sum(a.AMT_SALE-a.DC_TOT) as AMT_SALE '
             +'  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'       MS_MENU   b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE and b.CD_MENU = a.CD_MENU '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.YMD_SALE between :P2 and :P3 '
             +'   and a.DS_SALE <> ''V'' '
             +' group by a.CD_MENU '
             +' order by a.CD_MENU ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date)]);
    Result := DM.ReadQuery(Query, CustTableView);

    try
      OpenQuery('select d.CD_MENU, '
               +'       h.CD_CUSTOMER, '
               +'       a.CD_AGE, '
               +'       DivFlt(SUM(d.AMT_SALE-d.DC_TOT), c.CNT_CUST) as AMT_SALE '
               +'  from '+GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd inner join')
               +GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h')
               +'                     on h.CD_HEAD  = d.CD_HEAD '
               +'                    and h.CD_STORE = d.CD_STORE '
               +'                    and h.YMD_SALE = d.YMD_SALE '
               +'                    and h.NO_POS   = d.NO_POS '
               +'                    and h.NO_RCP   = d.NO_RCP inner join '
               +'       SL_SALE_AGE a on a.CD_HEAD  = h.CD_HEAD '
               +'                    and a.CD_STORE = h.CD_STORE '
               +'                    and a.YMD_SALE = h.YMD_SALE '
               +'                    and a.NO_POS   = h.NO_POS '
               +'                    and a.NO_RCP   = h.NO_RCP '
               +'                    and a.CNT_PERSON > 0 inner join '
               +'       (select YMD_SALE, '
               +'               NO_POS, '
               +'               NO_RCP, '
               +'               Count(*) as CNT_CUST '
               +'          from SL_SALE_AGE '
               +'         where CD_HEAD  =:P0 '
               +'           and CD_STORE =:P1 '
               +'           and YMD_SALE between :P2 and :P3 '
               +'           and CNT_PERSON > 0 '
               +'         group by YMD_SALE, NO_POS, NO_RCP ) as c on c.YMD_SALE = h.YMD_SALE and c.NO_POS = h.NO_POS and c.NO_RCP = h.NO_RCP '
               +' where d.CD_HEAD  =:P0 '
               +'   and d.CD_STORE =:P1 '
               +'   and d.YMD_SALE between :P2 and :P3 '
               +'   and d.DS_SALE <> ''V'' '
               +' group by d.CD_MENU, a.CD_AGE, h.CD_CUSTOMER, c.CNT_CUST ',
               [HeadStoreCode,
                StoreCode,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date)]);
      CustTableView.DataController.BeginUpdate;
      while not Query.Eof do
      begin
        vRow := CustTableView.DataController.FindRecordIndexByText(0, CustTableViewMenuCode.Index, Query.Fields[0].AsString, false, false, true);
        for vIndex := 0 to CustTableView.ColumnCount-1 do
        begin
          if CustTableView.Columns[vIndex].Name = 'CUSTAMT_'+(Query.Fields[2].AsString + Query.Fields[1].AsString) then
          begin
            CustTableView.DataController.Values[vRow, vIndex] := Nvl(CustTableView.DataController.Values[vRow, vIndex],0) + Query.Fields[3].AsInteger;
            Break;
          end;
        end;
        Query.Next;
      end;

      for vIndex := 0 to CustTableView.DataController.RecordCount-1 do
      begin
        for vCol := 3 to CustTableView.ColumnCount-2 do
        begin
          if CustTableView.DataController.Values[vIndex, 2] = 0 then
            CustTableView.DataController.Values[vIndex, vCol] := 0
          else
            CustTableView.DataController.Values[vIndex, vCol] := RoundNumber(NVL(CustTableView.DataController.Values[vIndex, vCol+1],0) / CustTableView.DataController.Values[vIndex, 2] * 100, 0.01);
        end;
      end;
      CustTableView.DataController.EndUpdate;
    finally
      FinishQuery;
    end;
  end;
end;
end.
