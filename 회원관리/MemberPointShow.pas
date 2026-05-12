unit MemberPointShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, AdvToolBar, AdvToolBarStylers, ExtCtrls, cxContainer,
  Uni, DB, MemDS, ImgList, Menus, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  cxGridBandedTableView, StrUtils, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxCheckBox, MaskUtils,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, System.ImageList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TMemberPointShowForm = class(TInheritShowForm)
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Date: TcxGridColumn;
    GridTableView1Type: TcxGridColumn;
    GridTableView1Reson: TcxGridColumn;
    GridTableView1Point: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridBandedTableView: TcxGridBandedTableView;
    GridBandedTableViewMemberCode: TcxGridBandedColumn;
    GridBandedTableViewMemberName: TcxGridBandedColumn;
    GridBandedTableViewMemberClass: TcxGridBandedColumn;
    GridBandedTableViewCardNo: TcxGridBandedColumn;
    GridBandedTableViewMobileNo: TcxGridBandedColumn;
    GridBandedTableViewColumn6: TcxGridBandedColumn;
    GridBandedTableViewColumn7: TcxGridBandedColumn;
    GridBandedTableViewColumn8: TcxGridBandedColumn;
    GridBandedTableViewPoint: TcxGridBandedColumn;
    VisitCheckBox: TcxCheckBox;
    GridLevel2: TcxGridLevel;
    GridTableView2: TcxGridTableView;
    GridTableView2MemberCode: TcxGridColumn;
    GridTableView2MemberName: TcxGridColumn;
    GridTableView2AddDate: TcxGridColumn;
    GridTableView2Reson: TcxGridColumn;
    GridTableView2Point: TcxGridColumn;
    GridTableView2Remark: TcxGridColumn;
    GridTableView2ReceiptNo: TcxGridColumn;
    GridBandedTableViewColumn1: TcxGridBandedColumn;
    GridBandedTableViewColumn2: TcxGridBandedColumn;
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridBandedTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ButtonToolBarPrintButtonPopupMenuExcelClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuReceiptClick(Sender: TObject);
  private
    MemberInfo :String;
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  MemberPointShowForm: TMemberPointShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TMemberPointShowForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
  Sender: TObject);
var vMobilNo :Boolean;
begin
  vMobilNo := GridBandedTableViewMobileNo.Visible;
  GridBandedTableViewMobileNo.Visible := false;
  inherited;
  GridBandedTableViewMobileNo.Visible := vMobilNo;
end;

procedure TMemberPointShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  if Copy(HelpKeyword,1,1) = '0' then
  begin
    MsgBox('출력 권한이 없습니다');
    Exit;
  end;
  if GridTableView1.DataController.RecordCount = 0 then
  begin
    MsgBox('출력 할 자료가 없습니다');
    Exit;
  end;
  vPrintData := rptSizeBoth + rptAlignCenter + '포인트 적립/사용'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  MemberInfo+ #13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'   일 자   구분   포인트       사유       '+rptpStr+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView1 do
  for vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    vPrintData := vPrintData +rptpStr + Format('%s %s %9.9s %-12.12s',[LeftStr(DataController.Values[vIndex, GridTableView1Date.Index],10),
                                                                       DataController.Values[vIndex, GridTableView1Type.Index],
                                                                       FormatFloat('#,0',DataController.Values[vIndex, GridTableView1Point.Index]),
                                                                       DataController.Values[vIndex, GridTableView1Reson.Index]])+#13;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +rptpStr + Format('잔여포인트 %14.14s',[FormatFloat('#,0',GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewPoint.Index])])+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

function TMemberPointShowForm.DoSearch:Boolean;
var vIndex :Integer;
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    if GetStoreOption(5)='0' then
      OpenQuery('select   m.CD_MEMBER, '
               +'         m.NM_MEMBER, '
               +'         c.NM_CODE1 as DS_MEMBER, '
               +'         m.NO_CARD, '
               +'         GetPhoneNo(AES_Decrypt(m.TEL_MOBILE, 71483)) as TEL_MOBILE, '
               +'         Ifnull(p.PNT_OCCUR,0) as PNT_OCCUR_TERM, '
               +'         Ifnull(p.PNT_USE,0)   as PNT_USE_TERM, '
               +'         Ifnull(p.PNT_OCCUR,0)-Ifnull(p.PNT_USE,0) as PNT_TOTAL_TERM, '
               +'         d.OCCUR_POINT, '
               +'         d.USE_POINT, '
               +'         d.TOTAL_POINT '
               +'  from   MS_MEMBER m left outer join'
               +'        (select   CD_MEMBER, '
               +'                  Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as PNT_OCCUR, '
               +'                  Sum(PNT_USE)   as PNT_USE '
               +'           from   SL_POINT  '
               +'          where   CD_HEAD  =:P0 '
               +'            and   CD_STORE =:P1 '
               +'            and   YMD_OCCUR between :P3 and :P4 '
               +'         group by CD_MEMBER ) as p on p.CD_MEMBER = m.CD_MEMBER left outer join '
               +'         MS_CODE       as c on c.CD_HEAD  = m.CD_HEAD '
               +'                           and c.CD_STORE = m.CD_STORE '
               +'                           and c.CD_CODE  = m.DS_MEMBER '
               +'                           and c.CD_KIND  = ''05'' left outer join '
               +'         MS_MEMBER_ETC as d on d.CD_HEAD   = m.CD_HEAD '
               +'                           and d.CD_STORE  = m.CD_STORE '
               +'                           and d.CD_MEMBER = m.CD_MEMBER '
               +' where m.CD_HEAD  =:P0 '
               +'   and m.CD_STORE =:P1 '
               +'   and (m.CD_MEMBER =:P2 '
               +'     or m.NO_CARD   =:P2 '
               +'     or AES_Decrypt(m.TEL_MOBILE, 71483) = :P2 '
               +'     or AES_Decrypt(m.TEL_MOBILE_SHORT, 71483) = :P2 '
               +'     or m.NM_MEMBER like ConCat(''%'',:P2,''%'')) '
               +'   and m.DS_STATUS = ''0'' ',
                [HeadStoreCode,
                 StoreCode,
                 ConditionToolBarEdit.Text,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date)])
    else
      OpenQuery('select   m.CD_MEMBER, '
               +'         m.NM_MEMBER, '
               +'         c.NM_CODE1 as DS_MEMBER, '
               +'         m.NO_CARD, '
               +'         GetPhoneNo(AES_Decrypt(m.TEL_MOBILE, 71483)) as TEL_MOBILE, '
               +'         Ifnull(p.PNT_OCCUR,0) as PNT_OCCUR_TERM, '
               +'         Ifnull(p.PNT_USE,0)   as PNT_USE_TERM, '
               +'         Ifnull(p.PNT_OCCUR,0)-Ifnull(p.PNT_USE,0) as PNT_TOTAL_TERM, '
               +'         d.OCCUR_POINT, '
               +'         d.USE_POINT, '
               +'         d.TOTAL_POINT '
               +'  from   MS_MEMBER m left outer join'
               +'        (select   CD_MEMBER, '
               +'                  Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as PNT_OCCUR, '
               +'                  Sum(PNT_USE)   as PNT_USE '
               +'           from   SL_POINT  '
               +'          where   CD_HEAD  =:P0 '
               +'            and   CD_STORE =:P5 '
               +'            and   YMD_OCCUR between :P3 and :P4 '
               +'         group by CD_MEMBER ) as p on p.CD_MEMBER = m.CD_MEMBER left outer join '
               +'         MS_CODE       as c on c.CD_HEAD  = m.CD_HEAD '
               +'                           and c.CD_STORE = m.CD_STORE '
               +'                           and c.CD_CODE  = m.DS_MEMBER '
               +'                           and c.CD_KIND  = ''05'' left outer join '
               +'         MS_MEMBER_ETC as d on d.CD_HEAD   = m.CD_HEAD '
               +'                           and d.CD_STORE  = m.CD_STORE '
               +'                           and d.CD_MEMBER = m.CD_MEMBER '
               +' where m.CD_HEAD  =:P0 '
               +'   and m.CD_STORE =:P1 '
               +'   and m.CD_STORE_JOIN = :P5 '
               +'   and (m.CD_MEMBER =:P2 '
               +'     or m.NO_CARD   =:P2 '
               +'     or AES_Decrypt(m.TEL_MOBILE, 71483) = :P2 '
               +'     or AES_Decrypt(m.TEL_MOBILE_SHORT, 71483) = :P2 '
               +'     or m.NM_MEMBER like ConCat(''%'',:P2,''%'')) '
               +'   and m.DS_STATUS = ''0'' ',
                [HeadStoreCode,
                 StandardStore,
                 ConditionToolBarEdit.Text,
                 DtoS(ConditionToolBarFromDateEdit.Date),
                 DtoS(ConditionToolBarToDateEdit.Date),
                 StoreCode]);
    Result := DM.ReadQuery(Query, GridBandedTableView);
    ButtonToolBarPrintButtonPopupMenuReceipt.Enabled := false;
    GridBandedTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
      if Length(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index]) = 13 then
        GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index] := LeftStr(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index],4)+'****'+RightStr(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index],5);
    GridBandedTableView.DataController.EndUpdate;

  end
  else if Grid.ActiveLevel = GridLevel1 then
  begin
    if GridBandedTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

    ReportSubTitle := Format('회원 : %s-%s',[GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewMemberCode.Index],
                                             GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewMemberName.Index]]);

    MemberInfo := ReportSubTitle;

    OpenQuery('select   StoDW(d.YMD_OCCUR) as YMD_OCCUR, '
             +'         d.TYPE, '
             +'         d.REASON, '
             +'         d.PNT, '
             +'         d.REMARK, '
             +'         case when d.LINK <> '''' then ConCat(Substring(d.LINK,1,8),''-'',Substring(d.LINK,9,2),''-'',Substring(d.LINK,11,4)) end LINK '
             +'from    (select   '''' as YMD_OCCUR, '
             +'                  ''이월'' as TYPE, '
             +'                  '''' as REASON, '
             +'                  0 as SEQ, '
             +'                  AMT_BASE as PNT, '
             +'                  '''' as REMARK, '
             +'                  '''' as LINK '
             +'           from   SL_BOOKS_MONTH'
             +'          where   CD_HEAD   =:P0 '
             +'            and   CD_STORE  =:P1 '
             +'            and   CD_CODE   =:P2 '
             +'            and   YM_CLOSE  =Left(:P3,6) '
             +'            and   CD_CLOSE = ''30'' '
             +'         union all '
             +'         select   a.YMD_OCCUR, '
             +'                  ''적립'' as TYPE, '
             +'                  Ifnull(b.NM_CODE1,''상품 구입'') as REASON, '
             +'                  a.SEQ, '
             +'                  a.PNT_CASH + a.PNT_CASHRCP + a.PNT_CARD + a.PNT_GIFT + a.PNT_TRUST + a.PNT_POINT as PNT, '
             +'                  a.REMARK, '
             +'                  a.RCP_LINK as LINK '
             +'           from   SL_POINT     as a left outer join '
             +'                  MS_CODE      as b on b.CD_HEAD  = a.CD_HEAD '
             +'                                   and b.CD_STORE = :P5 '
             +'                                   and a.CD_CODE  = b.CD_CODE '
             +'                                   and b.CD_KIND  = ''12''  '
             +'          where   a.CD_HEAD   =:P0 '
             +'            and   a.CD_STORE  =:P1 '
             +'            and   a.CD_MEMBER =:P2 '
             +'            and   a.YMD_OCCUR between :P3 and :P4 '
             +'            and   (a.PNT_CASH + a.PNT_CASHRCP + a.PNT_CARD + a.PNT_GIFT + a.PNT_TRUST + a.PNT_POINT) <> 0 '
             +'         union all '
             +'         select   a.YMD_OCCUR, '
             +'                  ''사용'' as TYPE, '
             +'                  Ifnull(b.NM_CODE1,''상품 결제'') as REASON, '
             +'                  a.SEQ, '
             +'                  -a.PNT_USE as PNT, '
             +'                  a.REMARK, '
             +'                  a.RCP_LINK as LINK '
             +'           from   SL_POINT   as a left outer join '
             +'                  MS_CODE    as b on b.CD_HEAD  = a.CD_HEAD '
             +'                                 and b.CD_STORE = :P5 '
             +'                                 and a.CD_CODE  = b.CD_CODE '
             +'                                 and b.CD_KIND  = ''13'' '
             +'          where   a.CD_HEAD   =:P0 '
             +'            and   a.CD_STORE  =:P1 '
             +'            and   a.CD_MEMBER =:P2'
             +'            and   a.YMD_OCCUR between :P3 and :P4 '
             +'            and   a.PNT_USE <> 0) as d  '
             +' order by  YMD_OCCUR, TYPE, SEQ',
             [HeadStoreCode,
              StoreCode,
              GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewMemberCode.Index],
              DtoS(ConditionToolBarFromDateEdit.Date),
              DtoS(ConditionToolBarToDateEdit.Date),
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);

    Result := DM.ReadQuery(Query, GridTableView1);
    ButtonToolBarPrintButtonPopupMenuReceipt.Enabled := true;
  end
  else if Grid.ActiveLevel = GridLevel2 then
  begin
    ReportSubTitle := '적립사유별 적립내역';

    MemberInfo := ReportSubTitle;

    OpenQuery('select   a.CD_MEMBER, '
             +'         c.NM_MEMBER, '
             +'         StoDW(a.YMD_OCCUR) as YMD_OCCUR, '
             +'         ''적립'' as TYPE, '
             +'         Ifnull(b.NM_CODE1,''상품 구입'') as REASON, '
             +'         a.SEQ, '
             +'         a.PNT_CASH + a.PNT_CASHRCP + a.PNT_CARD + a.PNT_GIFT + a.PNT_TRUST + a.PNT_POINT as POINT, '
             +'         a.REMARK, '
             +'         a.RCP_LINK as LINK '
             +'  from   SL_POINT   as a left outer join '
             +'         MS_CODE    as b on b.CD_HEAD  = a.CD_HEAD '
             +'                        and b.CD_STORE = :P5 '
             +'                        and a.CD_CODE  = b.CD_CODE '
             +'                        and b.CD_KIND  = ''12'' inner join '
             +'         MS_MEMBER  as c on c.CD_HEAD  = a.CD_HEAD '
             +'                        and c.CD_STORE = :P5 '
             +'                        and c.CD_MEMBER = a.CD_MEMBER '
             +'  where  a.CD_HEAD   =:P0 '
             +'    and  a.CD_STORE  =:P1 '
             +'    and (c.CD_MEMBER =:P2 or c.NO_CARD =:P2 or AES_Decrypt(c.TEL_MOBILE, 71483) = :P2 or AES_Decrypt(c.TEL_MOBILE_SHORT, 71483) = :P2 or c.NM_MEMBER like ConCat(''%'',:P2,''%'')) '
             +'    and  a.YMD_OCCUR between :P3 and :P4 '
             +' order by a.YMD_OCCUR ',
              [HeadStoreCode,
               StoreCode,
               ConditionToolBarEdit.Text,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);

    Result := DM.ReadQuery(Query, GridTableView2);
    ButtonToolBarPrintButtonPopupMenuReceipt.Enabled := true;
  end;
end;

procedure TMemberPointShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TMemberPointShowForm.FormActivate(Sender: TObject);
begin
  inherited;
  //회원관리에서 실행으로 넘어왔을경우 자동조회
  if FormParam[0] <> EmptyStr then
  begin
    ConditionToolBarEdit.Text := FormParam[0];
    FormParam[0] := EmptyStr;
    Exec_Timer.Enabled := True;
  end;
end;

procedure TMemberPointShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/회원관리/회원별%20포인트조회/회원별%20포인트조회.htm';
  PrintMode   := pmPreviewExcel;
end;

procedure TMemberPointShowForm.GridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

end.
