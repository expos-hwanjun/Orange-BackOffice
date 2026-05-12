// 회원 조회 (완료)

unit HeadMemberShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, cxCurrencyEdit, ExtCtrls, AdvToolBarStylers,
  StdCtrls, cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  StrUtils, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  THeadMemberShowForm = class(TInheritShowForm)
    GridTableViewMemberNo: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewGender: TcxGridColumn;
    GridTableViewMemberType: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewJoinDate: TcxGridColumn;
    GridTableViewBirthday: TcxGridColumn;
    GridTableViewWeddingDate: TcxGridColumn;
    GridTableViewVisitDate: TcxGridColumn;
    GridTableViewSaleAmt: TcxGridColumn;
    GridTableViewVisitCount: TcxGridColumn;
    GridTableViewTelNo: TcxGridColumn;
    GridTableViewMobileNo: TcxGridColumn;
    GridTableViewAddress: TcxGridColumn;
    GridTableViewCreditYN: TcxGridColumn;
    GridTableViewEMail: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    GridTableViewLeaveYN: TcxGridColumn;
    GridTableViewCashRcpNo: TcxGridColumn;
    GridTableViewPoint: TcxGridColumn;
    GridTableViewNewsYN: TcxGridColumn;
    GridTableViewTotalStamp: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuExcelClick(Sender: TObject);
    procedure ConditionToolBarEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);

  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadMemberShowForm: THeadMemberShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure THeadMemberShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode := pmPrintPreviewExcel;
  ConditionToolBarEditLabel.Hint := ConditionToolBarEdit.Hint;

end;

procedure THeadMemberShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewLeaveYN.Index] = '탈퇴' then
    AStyle := StyleFontRed;

end;

procedure THeadMemberShowForm.ButtonToolBarPrintButtonPopupMenuExcelClick(
  Sender: TObject);
var vMobilNo, vTelNo, vPoint :Boolean;
begin
  vMobilNo := GridTableViewMobileNo.Visible;
  vTelNo   := GridTableViewTelNo.Visible;
  vPoint   := GridTableViewPoint.Visible;
  GridTableViewMobileNo.Visible := false;
  GridTableViewTelNo.Visible    := false;
  GridTableViewPoint.Visible    := false;
  inherited;
  GridTableViewMobileNo.Visible := vMobilNo;
  GridTableViewTelNo.Visible    := vTelNo;
  GridTableViewPoint.Visible    := vPoint;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 이름에서 키보드를 누를 때
procedure THeadMemberShowForm.ConditionToolBarEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function THeadMemberShowForm.DoSearch:Boolean;
var vIndex :Integer;
begin
  inherited;
  OpenQuery('select   a.CD_MEMBER, '
           +'         a.NM_MEMBER, '
           +'         d.NM_STORE, '
           +'         case a.DS_SEX when ''1'' then ''여자'' else ''남자'' end as DS_SEX, '
           +'         c.NM_CODE1 as MEMBER_TYPE, '
           +'         a.NO_CARD, '
           +'         StoD(a.YMD_ISU)    as YMD_ISU, '
           +'         case when Length(a.YMD_BIRTH) = 8 then ConCat(StoD(a.YMD_BIRTH),case when a.YN_LUNAR = ''Y'' then ''(음)'' else ''(양)'' end) end as YMD_BIRTH, '
           +'         StoD(a.YMD_MARRI)  as YMD_MARRI, '
           +'         StoD(f.YMD_VISIT) as YMD_VISIT, '
           +'         f.AMT_SALE, '
           +'         f.CNT_VISIT, '
           +'         b.TOTAL_POINT, '
           +'         b.TOTAL_STAMP, '
           +'         GetPhoneNo(AES_Decrypt(a.TEL_HOME, 71483)) as TEL_HOME, '
           +'         GetPhoneNo(AES_Decrypt(a.TEL_MOBILE, 71483)) as TEL_MOBILE, '
           +'         ConCat(a.ADDR1,'' '',a.ADDR2) as ADDR, '
           +'         case a.YN_TRUST when ''Y'' then ''가능'' else ''불가'' end as YN_TRUST, '
           +'         a.NM_EMAIL, '
           +'         a.REMARK, '
           +'         a.NO_CASHRCP, '
           +'         case when a.YN_NEWS = ''Y'' then ''수신'' else ''수신안함'' end YN_NEWS, '
           +'         case a.DS_STATUS when ''1'' then ''탈퇴'' else ''정상''  end as DS_STATUS '
           +'  from   MS_MEMBER as a inner join '
           +'         MS_MEMBER_ETC as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and b.CD_MEMBER = a.CD_MEMBER left outer join '
           +'         MS_CODE       as c on a.CD_HEAD = c.CD_HEAD and a.CD_STORE = c.CD_STORE and a.DS_MEMBER = c.CD_CODE and c.CD_KIND = ''05'' left outer join '
           +'         MS_STORE      as d on a.CD_HEAD = d.CD_HEAD and a.CD_STORE_JOIN = d.CD_STORE inner join '
           +'        (select CD_MEMBER, '
           +'                Max(YMD_VISIT) as YMD_VISIT, '
           +'                Sum(CNT_VISIT) as CNT_VISIT, '
           +'                Sum(AMT_SALE)  as AMT_SALE '
           +'           from MS_MEMBER_ETC '
           +'          where CD_HEAD  =:P0  '
           +'          group by CD_MEMBER) as f on f.CD_MEMBER = a.CD_MEMBER  '
           +' where   a.CD_HEAD  =:P0 '
           +'   and   a.CD_STORE =:P1 '
           +'   and  (a.CD_MEMBER = :P2 '
           +'          or a.NM_MEMBER like ConCat(''%'',:P2,''%'') '
           +'          or a.NO_CARD = :P2 '
           +'          or (:P2 <> '''' and AES_Decrypt(a.TEL_MOBILE, 71483) =:P2 '
           +'                           or AES_Decrypt(a.TEL_MOBILE_SHORT, 71483) )) ',
           [HeadStoreCode,
            StandardStore,
            ConditionToolBarEdit.Text]);
    DM.ReadQuery(Query, GridTableView);
    Result := GridTableView.DataController.RecordCount > 0;

  GridTableView.DataController.BeginUpdate;
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    if Length(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index]) = 13 then
      GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index] := LeftStr(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index],4)+'****'+RightStr(GridTableView.DataController.Values[vIndex, GridTableViewMobileNo.Index],5);

  GridTableView.DataController.EndUpdate;

end;

end.
