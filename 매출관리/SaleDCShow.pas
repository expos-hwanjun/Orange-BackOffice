unit SaleDCShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, cxContainer, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, StrUtils, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, MaskUtils,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, VirtualTable, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TSaleDCShowForm = class(TInheritShowForm)
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableViewSaleDate: TcxGridColumn;
    GridTableViewDcName: TcxGridColumn;
    GridTableViewDcCount: TcxGridColumn;
    GridTableViewDcAmt: TcxGridColumn;
    GridTableView1SaleDate: TcxGridColumn;
    GridTableView1DcName: TcxGridColumn;
    GridTableView1DcAmt: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1DcTarget: TcxGridColumn;
    GridTableView1ReceiptNo: TcxGridColumn;
    SawonToolBarComboBox: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    isSelected :Boolean;
  protected
    function DoSearch:Boolean; override;
  end;

var
  SaleDCShowForm: TSaleDCShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TSaleDCShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex  :Integer;
    vTotAmt :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  if Grid.ActiveLevel = GridLevel then
  begin
    vPrintData := rptSizeBoth + rptAlignCenter + '할인내역'+#13;
    vPrintData := vPrintData +  rptLF;
    vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
    vPrintData := vPrintData +  '매 장 명 : '+Common.StoreName+#13;
    vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  ' 매출일자   '+rptpStr+'   할인종류   '+rptpStr+'  건수  할인금액'+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vTotAmt := 0;
    with GridTableView do
    begin
      For vIndex := 0 to DataController.RecordCount-1 do
      begin
        vPrintData := vPrintData + Rpad(LeftStr(DataController.Values[vIndex, GridTableViewSaleDate.Index],10),11,' ')
                                 + RPad(CopyStr(DataController.Values[vIndex, GridTableViewDcName.Index],1,17),17+PrintBlank,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableViewDcCount.Index]),4,' ')
                                 + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableViewDcAmt.Index]),10,' ')+#13;
        vTotAmt := vTotAmt + DataController.Values[vIndex, 3];
      end;
    end;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptCharBold;
    vPrintData := vPrintData +  rptpStr+'      합   계     '+rptpStr+LPad(FormatFloat('#,0',vTotAmt), 24,' ')+#13;
    vPrintData := vPrintData +  rptOneLine+#13;
    vPrintData := vPrintData +  rptSizeNormal;
    vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
    vPrintData := vPrintData +  rptLF;
  end
  else
  begin
    if GridLevel1.Tag = 0 then
    begin
      vPrintData := rptSizeBoth + rptAlignCenter + '상세할인내역'+#13;
      vPrintData := vPrintData +  rptLF;
      vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
      vPrintData := vPrintData +  '매 장 명 : '+Common.StoreName+#13;
      vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData +  '  매출일자     '+rptpStr+'   할인종류   '+rptpStr+'   할인금액'+#13;
      vPrintData := vPrintData +  rptOneLine+#13;
      vTotAmt := 0;
      with GridTableView1 do
      begin
        For vIndex := 0 to DataController.RecordCount-1 do
        begin
          vPrintData := vPrintData + DataController.Values[vIndex, GridTableView1SaleDate.Index]+' '
                                   + rptpStr
                                   + RPad(CopyStr(DataController.Values[vIndex, GridTableView1DcName.Index],1,18),18+PrintBlank,' ')
                                   + rptpStr
                                   + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableView1DcAmt.Index]),9,' ')+#13;
          vTotAmt := vTotAmt + DataController.Values[vIndex, GridTableView1DcAmt.Index];
        end;
      end;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData +  rptCharBold;
      vPrintData := vPrintData +  rptpStr+'      합   계     '+rptpStr+LPad(FormatFloat('#,0',vTotAmt), 24,' ')+#13;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData +  rptSizeNormal;
      vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
      vPrintData := vPrintData +  rptLF;

    end
    else
    begin
      vPrintData := rptSizeBoth + rptAlignCenter + '할인상세내역'+#13;
      vPrintData := vPrintData +  rptLF;
      vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
      vPrintData := vPrintData +  '매 장 명 : '+Common.StoreName+#13;
      vPrintData := vPrintData +  '할 인 명 : '+GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDcName.Index]+#13;
      vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData +  '   판매영수증   '+rptpStr+'   할인금액 '+rptpStr+'    매출대상  '+#13;
      vPrintData := vPrintData +  rptOneLine+#13;
      vTotAmt := 0;
      with GridTableView1 do
      begin
        For vIndex := 0 to DataController.RecordCount-1 do
        begin
          vPrintData := vPrintData + Rpad(DataController.Values[vIndex, GridTableView1ReceiptNo.Index],16,' ')
                                   + rptpStr
                                   + LPad(FormatFloat('#,0', DataController.Values[vIndex, GridTableView1DcAmt.Index]),11,' ')
                                   + rptpStr
                                   + ' '
                                   + CopyStr(DataController.Values[vIndex, GridTableView1DcTarget.Index],1,12)+#13;
          vTotAmt := vTotAmt + DataController.Values[vIndex, GridTableView1DcAmt.Index];
        end;
      end;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData +  rptCharBold;
      vPrintData := vPrintData +  rptpStr+'      합   계     '+rptpStr+LPad(FormatFloat('#,0',vTotAmt), 24,' ')+#13;
      vPrintData := vPrintData +  rptOneLine+#13;
      vPrintData := vPrintData +  rptSizeNormal;
      vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
      vPrintData := vPrintData +  rptLF;
    end;

  end;

  PrintPrinter(vPrintData);
end;

function TSaleDCShowForm.DoSearch:Boolean;
var vConditionDc,  vConditionSawon :String;
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    vConditionSawon := GetStrPointerData(SawonToolBarComboBox);
    vConditionSawon := Ifthen(vConditionSawon='','', ' and CD_SAWON = '''+vConditionSawon+''' ');
    OpenQuery('select StoDW(YMD_SALE) as YMD_SALE, '
             +'       NM_DC, '
             +'       COUNT(NM_DC) as QTY_DC, '
             +'       SUM(AMT_DC)  as AMT_DC '
             +'  from  '
             +'     ( '
             +'     select YMD_SALE, '
             +'          ''영수증 임의할인'' as NM_DC, '
             +'          DC_RECEIPT as AMT_DC '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V'' '
             +'        and DC_RECEIPT <> 0 ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''메뉴 임의할인'' ,  '
             +'            DC_MENU  '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V'' ' + vConditionSawon
             +'        and DC_MENU <> 0  '
             +'     union all '
             +'     select a.YMD_SALE, '
             +'            b.NM_CODE1 as NM_DC, '
             +'            a.DC_CODE  as AMT_DC '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'a inner join')
             +'            MS_CODE   b  on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.CD_CODE = b.CD_CODE and b.CD_KIND = ''07'' '
             +'      where a.CD_HEAD  =:P0 '
             +'        and a.CD_STORE =:P1 '
             +'        and a.YMD_SALE between :P2 and :P3 '
             +'        and a.DS_SALE <> ''V'' ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''회원 할인'' , '
             +'          DC_MEMBER  '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V''  '
             +'        and DC_MEMBER <> 0 ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''포인트 할인'' ,  '
             +'          DC_POINT '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V'' '
             +'        and DC_POINT <> 0 ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'            ''행사 할인'' ,  '
             +'            DC_SPC  '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V'' '
             +'        and DC_SPC <> 0 ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'            ''쿠폰 할인'' ,  '
             +'            DC_COUPON  '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V'' '
             +'        and DC_COUPON <> 0 ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''절사 할인'' , '
             +'          DC_CUT '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V''  '
             +'        and DC_CUT <> 0  ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''부가세 할인'' , '
             +'          DC_VAT '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V''  '
             +'        and DC_VAT <> 0  ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''스템프 할인'' , '
             +'          DC_STAMP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V''  '
             +'        and DC_STAMP <> 0  ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''TaxFree 할인'' , '
             +'          DC_TAXFREE '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V''  '
             +'        and DC_TAXFREE <> 0  ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''유플러스 할인'' , '
             +'          DC_UPLUS '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V''  '
             +'        and DC_UPLUS <> 0  ' + vConditionSawon
             +'     union all '
             +'     select YMD_SALE, '
             +'          ''카카오 할인'' , '
             +'          DC_KAKAO '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, '')
             +'      where CD_HEAD  =:P0 '
             +'        and CD_STORE =:P1 '
             +'        and YMD_SALE between :P2 and :P3 '
             +'        and DS_SALE <> ''V''  '
             +'        and DC_KAKAO <> 0  ' + vConditionSawon
             +'     ) t '
             +'   group by YMD_SALE, NM_DC '
             +'   order by 1,2',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;
  end
  else
  begin
    if isSelected then
    begin
      vConditionDc    := Format('where NM_DC = ''%s'' ', [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewDcName.Index]]);
      GridLevel1.Tag  := 1;
    end
    else
    begin
      vConditionDc    := EmptyStr;
      GridLevel1.Tag  := 0;
    end;

    vConditionSawon := GetStrPointerData(SawonToolBarComboBox);
    vConditionSawon := Ifthen(vConditionSawon = '', '', Ifthen(vConditionDc='', Format('where CD_SAWON = ''%s'' ',[vConditionSawon]), Format(' and CD_SAWON = ''%s'' ',[vConditionSawon])));
    OpenQuery('select StoDW(YMD_SALE) as YMD_SALE, '
             +'       NM_DC, '
             +'       AMT_DC, '
             +'       NM_MEMBER, '
             +'       NM_SAWON, '
             +'       NO_RCP '
             +'  from '
             +'     ( '
             +'     select h.YMD_SALE, '
             +'            ''영수증 임의할인'' as NM_DC, '
             +'            h.DC_RECEIPT as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V'' '
             +'        and h.DC_RECEIPT <> 0 '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''메뉴 임의할인'' as NM_DC ,  '
             +'            h.DC_MENU as AMT_DC , '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V'' '
             +'        and h.DC_MENU <> 0  '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            c.NM_CODE1 as NM_DC, '
             +'            h.DC_CODE  as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON left outer join '
             +'            MS_CODE   c  on h.CD_STORE = c.CD_STORE and h.CD_CODE   = c.CD_CODE and c.CD_KIND = ''07'' '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_CODE <> 0 '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''회원 할인'' as NM_DC , '
             +'            h.DC_MEMBER as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_MEMBER <> 0 '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''포인트 할인'' as NM_DC , '
             +'            h.DC_POINT as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V'' '
             +'        and h.DC_POINT <> 0 '
             +'     union all  '
             +'     select h.YMD_SALE, '
             +'            ''행사 할인'' as NM_DC ,  '
             +'            h.DC_SPC as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_SPC <> 0  '
             +'     union all  '
             +'     select h.YMD_SALE, '
             +'            ''쿠폰 할인'' as NM_DC ,  '
             +'            h.DC_COUPON as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_COUPON <> 0  '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''절사 할인'' as NM_DC , '
             +'            h.DC_CUT as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_CUT <> 0  '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''부가세 할인'' as NM_DC , '
             +'            h.DC_VAT as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_VAT <> 0  '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''스템프 할인'' as NM_DC , '
             +'            h.DC_STAMP as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_STAMP <> 0  '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''TaxFree 할인'' as NM_DC , '
             +'            h.DC_TAXFREE as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_TAXFREE <> 0  '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''유플러스 할인'' as NM_DC , '
             +'            h.DC_UPLUS as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_UPLUS <> 0  '
             +'     union all '
             +'     select h.YMD_SALE, '
             +'            ''카카오 할인'' as NM_DC , '
             +'            h.DC_KAKAO as AMT_DC, '
             +'            case when Ifnull(h.CD_MEMBER,'''') = '''' then ''일반'' '
             +'                 else ConCat(''회원('',m.NM_MEMBER,'')'') '
             +'            end as NM_MEMBER, '
             +'            s.CD_SAWON, '
             +'            s.NM_SAWON, '
             +'            ConCat(h.YMD_SALE,''-'',h.NO_POS,''-'',h.NO_RCP) as NO_RCP '
             +'       from  '+GetPartitionTable('SL_SALE_H', ConditionToolBarFromDateEdit.Date, ConditionToolBarToDateEdit.Date, 'h left outer join')
             +'            MS_MEMBER m  on m.CD_HEAD = h.CD_HEAD and m.CD_STORE = :P4 and m.CD_MEMBER = h.CD_MEMBER left outer join  '
             +'            MS_SAWON  s  on s.CD_HEAD = h.CD_HEAD and s.CD_STORE = h.CD_STORE and s.CD_SAWON  = h.CD_SAWON '
             +'      where h.CD_HEAD = :P0 '
             +'        and h.CD_STORE =:P1 '
             +'        and h.YMD_SALE between :P2 and :P3 '
             +'        and h.DS_SALE <> ''V''  '
             +'        and h.DC_KAKAO <> 0  '
             +'     ) t '
             +vConditionDc
             +vConditionSawon
             +'order by 1,2,6',
            [HeadStoreCode,
             StoreCode,
             DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date),
             Ifthen(GetStoreOption(5)='1',StandardStore, StoreCode)]);
    isSelected := false;
    DM.ReadQuery(Query, GridTableView1);
    Result := GridTableView1.DataController.RecordCount > 0;
  end;
end;

procedure TSaleDCShowForm.FormCreate(Sender: TObject);
var
  vCodeData: PStrPointer;
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddToday;
  isSelected  := false;

  // 사원(계산원) 목록을 불러와 조건 콤보박스에 넣는다
  New(vCodeData);
  vCodeData^.Data := EmptyStr;
  SawonToolBarComboBox.Properties.Items.AddObject('[전체 계산원]',  TObject(vCodeData));
  OpenQuery('select   CD_SAWON, '
           +'         ConCat(NM_SAWON,''('',Ifnull(NM_RANK,''''),'')'') as NM_SAWON '
           +'from     MS_SAWON '
           +'where    CD_HEAD   =:P0 '
           +'  and    CD_STORE  =:P1 '
           +'  and    YN_USE = ''Y'' '
           +'order by NM_SAWON',
            [HeadStoreCode,
             StoreCode]);
  try
    while not Query.Eof do
    begin
      New(vCodeData);
      vCodeData^.Data := Query.Fields[0].AsString;
      SawonToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCodeData));
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  SawonToolBarComboBox.ItemIndex     := 0;
  ConditionToolBarComboBox.ItemIndex := 0;
end;

procedure TSaleDCShowForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  isSelected       := true;
  DoSearch;
end;

end.
