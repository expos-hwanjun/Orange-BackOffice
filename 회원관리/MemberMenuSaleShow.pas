unit MemberMenuSaleShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, DB, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxCurrencyEdit, cxButtonEdit, StrUtils, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, MaskUtils, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxNavigator, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TMemberMenuSaleShowForm = class(TInheritShowForm)
    ConditionToolBarMemberEdit: TcxButtonEdit;
    GridTableViewGoodsCode: TcxGridColumn;
    GridTableViewGoodsName: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    ConditionToolBarMemberNameLabel: TcxLabel;
    GridTableViewSaleDate: TcxGridColumn;
    procedure ConditionToolBarButtonEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ConditionToolBarButtonEditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
    SearchDate  :String;
    function  SearchMember(aCompany: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberMenuSaleShowForm: TMemberMenuSaleShowForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

procedure TMemberMenuSaleShowForm.ButtonToolBarSearchButtonClick(
  Sender: TObject);
begin
  SearchDate  := EmptyStr;
  inherited;

end;

procedure TMemberMenuSaleShowForm.ConditionToolBarButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  if SearchMember(ConditionToolBarMemberEdit.Text) <> EmptyStr then
    DoSearch;
end;

procedure TMemberMenuSaleShowForm.ConditionToolBarButtonEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (Sender = ConditionToolBarMemberEdit) and (ConditionToolBarMemberNameLabel.Caption <> EmptyStr) and
          ((GetOnlyNumber(ConditionToolBarMemberEdit.EditingText) <> ConditionToolBarMemberEdit.EditingText) or (Length(ConditionToolBarMemberEdit.EditingText) <> 10)) then
  begin
    ConditionToolBarMemberNameLabel.Caption := EmptyStr;
  end;
end;

procedure TMemberMenuSaleShowForm.ConditionToolBarButtonEditPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var vCode, vName :String;
begin
  inherited;
  if DisplayValue <> EmptyStr then
    try
      OpenQuery('select  CD_MEMBER, '
               +'        NM_MEMBER '
               +'  from  MS_MEMBER '
               +' where  CD_HEAD  =:P0 '
               +'   and  CD_STORE =:P1 '
               +'   and (CD_MEMBER = :P2 or NM_MEMBER like ConCat(''%'',:P2,''%'')) '
               +'   and  DS_STATUS = ''0'' '
               +' order by CD_MEMBER',
                [HeadStoreCode,
                 Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                 DisplayValue]);
      if not Query.Eof then
      begin
        // 일단 첫번째 값을 받아 놓는다
        vCode           := Query.Fields[0].AsString;
        vName           := Query.Fields[1].AsString;
        // 쿼리 다음 줄로 이동해 본다
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue              := vCode;
          ConditionToolBarMemberNameLabel.Caption := vName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
        begin
          DisplayValue := SearchMember(DisplayValue);
        end;
      end;
    finally
      FinishQuery;
    end;
end;

function TMemberMenuSaleShowForm.DoSearch: Boolean;
begin
  Result := false;
  ReportSubTitle := '회   원 : '+ConditionToolBarMemberNameLabel.Caption;
  if ConditionToolBarMemberEdit.Text = EmptyStr then
  begin
    MsgBox('조회할 회원을 선택하십시오.');
    Result := true;
    Exit;
  end;

  OpenQuery('select StoDW(h.YMD_SALE) as YMD_SALE, '
           +'       d.CD_MENU, '
           +'       Max(g.NM_MENU) as NM_MENU, '
           +'       Sum(d.QTY_SALE) as QTY_SALE, '
           +'       SUM(d.AMT_SALE-d.DC_TOT) as AMT_SALE '
           +'  from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h inner join')
           +GetPartitionTable('SL_SALE_D', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'd')
           +'                   on h.CD_HEAD   = d.CD_HEAD '
           +'                  and h.CD_STORE  = d.CD_STORE '
           +'                  and h.YMD_SALE  = d.YMD_SALE '
           +'                  and h.NO_POS    = d.NO_POS '
           +'                  and h.NO_RCP    = d.NO_RCP left outer join '
           +'       MS_MENU   g on d.CD_HEAD   = d.CD_HEAD '
           +'                  and d.CD_STORE  = g.CD_STORE '
           +'                  and d.CD_MENU   = g.CD_MENU inner join '
           +'       MS_MEMBER t on t.CD_HEAD   = h.CD_HEAD '
           +'                  and t.CD_STORE  = :P5 '
           +'                  and h.CD_MEMBER = t.CD_MEMBER '
           +' where h.CD_HEAD  =:P0 '
           +'   and h.CD_STORE =:P1 '
           +'   and h.YMD_SALE between :P2 and :P3 '
           +'   and h.DS_SALE <> ''V'' '
           +'   and h.CD_MEMBER =:P4  '
           +' group by h.YMD_SALE, d.CD_MENU, d.PR_SALE '
           +' order by h.YMD_SALE, d.CD_MENU ',
           [HeadStoreCode,
            StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarMemberEdit.Text,
            Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
  Result := DM.ReadQuery(Query, GridTableView);
  if Result then
  begin
    DM.GroupGridTable(GridTableView,
                      GridTableViewSaleDate.Index,
                      GridTableViewGoodsName.Index,
                      ' [ 소 계 ] ',
                     [GridTableViewSaleQty.Index,
                      GridTableViewSaleAmt.Index]);

    GridTableView.DataController.FocusedRecordIndex := 0;
  end;
end;

procedure TMemberMenuSaleShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TMemberMenuSaleShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //매출속보에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarFromDateEdit.Date := SToD(FormParam[0]);
    ConditionToolBarToDateEdit.Date := SToD(FormParam[0]);
    FormParam[0] := EmptyStr;
    ConditionToolBarMemberEdit.Text := FormParam[1];
    ConditionToolBarMemberNameLabel.Caption := FormParam[2];
    Exec_Timer.Enabled := True;
  end;
end;

procedure TMemberMenuSaleShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/회원관리/회원별%20메뉴%20매출조회/회원별%20메뉴%20매출조회.htm';
  PrintMode   := pmPrintPreviewExcel;
  DefaultDate := ddToday;
end;

procedure TMemberMenuSaleShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewGoodsName.Index] = ' [ 소 계 ] ' then
    AStyle := StyleFontRed
  else if ARecord.Values[GridTableViewGoodsName.Index] = ' [ 합 계 ] ' then
    AStyle := StyleFontRedBold;
end;

function TMemberMenuSaleShowForm.SearchMember(aCompany: string): string;
begin
  Result := EmptyStr;

  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := '회원번호';
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := '회원이름';
      GridTableViewName1.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '카드번호';
      GridTableViewName2.Width   := 110;
      GridTableViewName2.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      GridTableViewName3.Caption := '휴대전화';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;

      SQLText    := 'select   CD_MEMBER, '
                   +'         NM_MEMBER '
                   +'         NO_CARD, '
                   +'         GetPhoneNo(AES_Decrypt(TEL_MOBILE, 71483)) as NO_TEL '
                   +'  from   MS_MEMBER '
                   +' where   CD_HEAD   =:P0 '
                   +'   and   CD_STORE  =:P1 '
                   +'   and  (CD_MEMBER =:P2 or NM_MEMBER like ConCat(''%'',:P2,''%'')) '
                   +'   and   DS_STATUS = ''0'' '
                   +' order by CD_MEMBER';

      isMemberSearch := true;
      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        ConditionToolBarMemberEdit.Text   := Code;
        ConditionToolBarMemberNameLabel.Caption   := Names[0];
        Result    := Code;
      end;
    finally
      Free;
    end;
end;

procedure TMemberMenuSaleShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex     :Integer;
    vSaleDate  :String;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  vSaleDate  := EmptyStr;
  vPrintData := rptSizeBoth + rptAlignCenter + '회원 메뉴 매출내역'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '회    원 : '+Format('%s (%s)',[ConditionToolBarMemberNameLabel.Caption, ConditionToolBarMemberEdit.Text])+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'       메뉴명       '+rptpStr+'       수량       금액'+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    if (vSaleDate <> DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index]) and (NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index],'') <> '') then
    begin

      vPrintData := vPrintData + rptAlignCenter + Format('[ %s ]', [DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index]])+rptAlignLeft+#13;
      vSaleDate  := NVL(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleDate.Index],'');
    end;
    vPrintData := vPrintData + RPad(CopyStr(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewGoodsName.Index] ,1,16+(PrintBlank div 2)),27+PrintBlank,' ')
                             + LPad(DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleQty.Index], 4, ' ')
                             + LPad(FormatFloat('#,0',DataController.Values[DataController.FilteredRecordIndex[vIndex], GridTableViewSaleAmt.Index]),11, ' ')+#13;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF + rptLF;
  PrintPrinter(vPrintData);
end;
end.
