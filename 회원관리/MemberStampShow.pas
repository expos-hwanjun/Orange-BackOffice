unit MemberStampShow;

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
  TMemberStampShowForm = class(TInheritShowForm)
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
    GridTableView1MenuName: TcxGridColumn;
    GridTableView1Stamp: TcxGridColumn;
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
    procedure GridTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    MemberInfo :String;
  protected
    function DoSearch:Boolean; override;
  public
    { Public declarations }
  end;

var
  MemberStampShowForm: TMemberStampShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TMemberStampShowForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
  Sender: TObject);
var vMobilNo :Boolean;
begin
  vMobilNo := GridBandedTableViewMobileNo.Visible;
  GridBandedTableViewMobileNo.Visible := false;
  inherited;
  GridBandedTableViewMobileNo.Visible := vMobilNo;
end;

procedure TMemberStampShowForm.ButtonToolBarPrintButtonPopupMenuReceiptClick(
  Sender: TObject);
var vPrintData :String;
    vIndex      :Integer;
begin
  inherited;
  if GridTableView1.DataController.RecordCount = 0 then
  begin
    MsgBox('출력 할 자료가 없습니다');
    Exit;
  end;
  vPrintData := rptSizeBoth + rptAlignCenter + '스템프 적립/사용'+#13;
  vPrintData := vPrintData +  rptLF;
  vPrintData := vPrintData +  rptSizeNormal + rptAlignLeft;
  vPrintData := vPrintData +  '매 장 명 : '+StoreName+#13;
  vPrintData := vPrintData +  '조회기간 : '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarFromDateEdit.Date)) +' ~ '+FormatMaskText('!0000년90월90일;0; ',DtoS(ConditionToolBarToDateEdit.Date))+#13;
  vPrintData := vPrintData +  MemberInfo+ #13;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +  rptpStr+'   일 자   구분      메뉴명         스템프'+rptpStr+#13;
  vPrintData := vPrintData +  rptpStr+'   일 자   구분   포인트       사유       '+rptpStr+#13;
  vPrintData := vPrintData +  rptOneLine+#13;
  with GridTableView1 do
  For vIndex := 0 to DataController.FilteredRecordCount-1 do
  begin
    vPrintData := vPrintData +rptpStr + Format('%s %s %18.18s %-3.3s',[LeftStr(DataController.Values[vIndex, GridTableView1Date.Index],10),
                                                                       DataController.Values[vIndex, GridTableView1Type.Index],
                                                                       DataController.Values[vIndex, GridTableView1MenuName.Index],
                                                                       FormatFloat('#,0',DataController.Values[vIndex, GridTableView1Stamp.Index])])+#13;
  end;
  vPrintData := vPrintData +  rptOneLine+#13;
  vPrintData := vPrintData +rptpStr + Format('잔여스템프 %14.14s',[FormatFloat('#,0',GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewPoint.Index])])+#13;
  vPrintData := vPrintData +  rptSizeNormal;
  vPrintData := vPrintData +  '출력일시 : '+ FormatDateTime(fmtDateTimeLong,now)+#13;
  vPrintData := vPrintData +  rptLF;
  PrintPrinter(vPrintData);
end;

function TMemberStampShowForm.DoSearch:Boolean;
var vIndex :Integer;
begin
  inherited;
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select   m.CD_MEMBER, '
             +'         m.NM_MEMBER as NM_MEMBER, '
             +'         c.NM_CODE1  as DS_MEMBER, '
             +'         m.NO_CARD   as NO_CARD, '
             +'         GetPhoneNo(AES_Decrypt(m.TEL_MOBILE, 71483)) as TEL_MOBILE, '
             +'         Ifnull(s.SAVE_STAMP,0)  as SAVE_STAMP_TERM, '
             +'         Ifnull(s.USE_STAMP,0)   as USE_STAMP_TERM, '
             +'         Ifnull(s.SAVE_STAMP,0) - Ifnull(s.USE_STAMP,0)  as TOTAL_STAMP_TERM, '
             +'         d.OCCUR_STAMP, '
             +'         d.USE_STAMP, '
             +'         d.TOTAL_STAMP as TOTAL_STAMP '
             +'  from  MS_MEMBER m left outer join'
             +'        (select   CD_MEMBER, '
             +'                  Sum(STAMP_ADD) as SAVE_STAMP, '
             +'                  Sum(STAMP_USE) as USE_STAMP '
             +'           from   SL_POINT  '
             +'          where   CD_HEAD  =:P0 '
             +'            and   CD_STORE =:P1 '
             +'            and   YMD_OCCUR between :P3 and :P4 '
             +'         group by CD_MEMBER ) as s on s.CD_MEMBER = m.CD_MEMBER left outer join '
             +'         MS_CODE       as c on c.CD_HEAD  = m.CD_HEAD '
             +'                           and c.CD_STORE = m.CD_STORE '
             +'                           and c.CD_CODE  = m.DS_MEMBER '
             +'                           and c.CD_KIND  = ''05'' left outer join '
             +'         MS_MEMBER_ETC as d on d.CD_HEAD  = m.CD_HEAD '
             +'                           and d.CD_STORE = :P5 '
             +'                           and d.CD_MEMBER = m.CD_MEMBER '
             +' where m.CD_HEAD  =:P0 '
             +'   and m.CD_STORE =:P5 '
             +'   and (m.CD_MEMBER =:P2 '
             +'     or m.NO_CARD   =:P2 '
             +'     or AES_Decrypt(m.TEL_MOBILE, 71483) = :P2 '
             +'     or AES_Decrypt(m.TEL_MOBILE_SHORT, 71483) = :P2 '
             +'     or m.NM_MEMBER like ConCat(''%'',:P2,''%'')) '
             +'   and m.DS_STATUS = ''0'' '
             +Ifthen(GetStoreOption(5)='0','',Format('and m.CD_STORE_JOIN = ''%s'' ',[StoreCode]))
             +Ifthen(VisitCheckBox.Checked, ' and (Ifnull(s.SAVE_STAMP,0) > 0 or Ifnull(s.USE_STAMP,0) > 0) ',''),
              [HeadStoreCode,
               StoreCode,
               ConditionToolBarEdit.Text,
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridBandedTableView);
    ButtonToolBarPrintButtonPopupMenuReceipt.Enabled := false;

    GridBandedTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridBandedTableView.DataController.RecordCount-1 do
      if Length(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index]) = 13 then
        GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index] := LeftStr(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index],4)+'****'+RightStr(GridBandedTableView.DataController.Values[vIndex, GridBandedTableViewMobileNo.Index],5);
    GridBandedTableView.DataController.EndUpdate;
  end
  else
  begin
    if GridBandedTableView.DataController.GetFocusedRecordIndex < 0 then Exit;

    ReportSubTitle := Format('회원 : %s-%s',[GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewMemberCode.Index],
                                             GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewMemberName.Index]]);

    MemberInfo := ReportSubTitle;

    OpenQuery('select   StoDW(a.YMD_OCCUR) as YMD_OCCUR, '
             +'         a.TYPE, '
             +'         a.REASON, '
             +'         a.STAMP, '
             +'         a.REMARK, '
             +'         a.LINK '
             +'from    (select   '''' as YMD_OCCUR, '
             +'                  ''이월'' as TYPE, '
             +'                  '''' as REASON, '
             +'                  0 as SEQ, '
             +'                  AMT_BASE as STAMP, '
             +'                  '''' as REMARK, '
             +'                  '''' as LINK '
             +'           from   SL_BOOKS_MONTH'
             +'          where   CD_HEAD   =:P0 '
             +'            and   CD_STORE  =:P1 '
             +'            and   CD_CODE   =:P2 '
             +'            and   YM_CLOSE  =Left(:P3,6) '
             +'            and   CD_CLOSE = ''40'' '
             +'         union all '
             +'         select   a.YMD_OCCUR, '
             +'                  ''적립'' as TYPE, '
             +'                  Ifnull(b.NM_CODE1,''상품 구입'') as REASON, '
             +'                  a.SEQ, '
             +'                  a.STAMP_ADD as STAMP, '
             +'                  a.REMARK, '
             +'                  a.RCP_LINK as LINK '
             +'           from   SL_POINT     as a left outer join '
             +'                  MS_CODE      as b on b.CD_HEAD  = a.CD_HEAD '
             +'                                   and b.CD_STORE = :P5 '
             +'                                   and a.CD_CODE  = b.CD_CODE '
             +'                                   and b.CD_KIND  = ''12'' '
             +'          where   a.CD_HEAD   =:P0 '
             +'            and   a.CD_STORE  =:P1 '
             +'            and   a.CD_MEMBER =:P2 '
             +'            and   a.YMD_OCCUR between :P3 and :P4 '
             +'            and   a.STAMP_ADD <> 0'
             +'         union all '
             +'         select   a.YMD_OCCUR, '
             +'                  ''사용'' as TYPE, '
             +'                  Ifnull(b.NM_CODE1,''상품 결제'') as REASON, '
             +'                  a.SEQ, '
             +'                  -a.STAMP_USE as STAMP, '
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
             +'            and   a.STAMP_USE <> 0 ) as a '
             +'order by a.YMD_OCCUR, a.LINK',
              [HeadStoreCode,
               StoreCode,
               GridBandedTableView.DataController.Values[GridBandedTableView.DataController.GetFocusedRecordIndex, GridBandedTableViewMemberCode.Index],
               DtoS(ConditionToolBarFromDateEdit.Date),
               DtoS(ConditionToolBarToDateEdit.Date),
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);

    Result := DM.ReadQuery(Query, GridTableView1);
    ButtonToolBarPrintButtonPopupMenuReceipt.Enabled := true;
  end;
end;

procedure TMemberStampShowForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := False;
  DoSearch;
end;

procedure TMemberStampShowForm.FormActivate(Sender: TObject);
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

procedure TMemberStampShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/회원관리/회원별%20포인트조회/회원별%20스템프조회.htm';
  PrintMode   := pmPreviewExcel;
end;

procedure TMemberStampShowForm.GridBandedTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure TMemberStampShowForm.GridTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableView1Stamp.Index] < 0 then
    AStyle := StyleFontRed;
end;

end.
