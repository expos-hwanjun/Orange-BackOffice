// 기념일 조회 (New완료)

unit MemberAnniversaryShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, ImgList, Menus, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxButtonEdit, cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvToolBar, AdvGlowButton, ExtCtrls, AdvToolBarStylers, StdCtrls, cxRadioGroup,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, StrUtils,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  DBAccess, dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxNavigator, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TMemberAnniversaryShowForm = class(TInheritShowForm)
    GridTableViewMemberNo: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewMemberType: TcxGridColumn;
    GridTableViewBirthday: TcxGridColumn;
    GridTableViewWeddingDate: TcxGridColumn;
    GridTableViewMobileNo: TcxGridColumn;
    GridTableViewEMail: TcxGridColumn;
    GridTableViewAddress: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberAnniversaryShowForm: TMemberAnniversaryShowForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberAnniversaryShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpUrL     := 'BackOffice/회원관리/기념일%20조회/기념일%20조회.htm';
  PrintMode   := pmPreview;
  DefaultDate := ddToday;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 날짜에서 키보드를 누를 때
procedure TMemberAnniversaryShowForm.ConditionToolBarToDateEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TMemberAnniversaryShowForm.DoSearch:Boolean;
begin
  inherited;
  OpenQuery('select   a.CD_MEMBER, '
           +'         Max(a.NM_MEMBER) as NM_MEMBER, '
           +'         b.NM_CODE1, '
           +'         a.NO_CARD, '
           +'         case when Length(GetOnlyNumber(a.YMD_BIRTH)) = 8 then ConCat(StoD(a.YMD_BIRTH),case when a.YN_LUNAR = ''Y'' then ''(음)'' else ''(양)'' end) else a.YMD_BIRTH end as YMD_BIRTH, '
           +'         StoD(a.YMD_MARRI) as YMD_MARRI, '
           +'         GetPhoneNo(AES_Decrypt(a.TEL_MOBILE, 71483)) as TEL_MOBILE, '
           +'         a.NM_EMAIL, '
           +'         ConCat(a.ADDR1,'' '',a.ADDR2) as ADDR '
           +'from     MS_MEMBER as a left outer join '
           +'         MS_CODE   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.DS_MEMBER = b.CD_CODE and b.CD_KIND = ''05'' left outer join '
           +'        (select   CD_MEMBER '
           +'           from   MS_MEMBER '
           +'          where   CD_HEAD  = :P0 '
           +'            and   CD_STORE = :P1 '
           +'            and   YN_LUNAR = ''N'' '
           +'            and   Length(GetOnlyNumber(YMD_BIRTH)) = 8 '
           +'            and   SubString(YMD_BIRTH,5,4) between :P2 and :P3) as t1 on a.CD_MEMBER = t1.CD_MEMBER left outer join '
           +'        (select   CD_MEMBER '
           +'           from   MS_MEMBER '
           +'          where   CD_HEAD  = :P0 '
           +'            and   CD_STORE = :P1 '
           +'            and   YN_LUNAR = ''Y'' '
           +'            and   Length(GetOnlyNumber(YMD_BIRTH)) = 8 '
           +'            and   SubString(LunarToSolar_F(YMD_BIRTH,0),5,4) between :P2 and :P3) as t2 on a.CD_MEMBER = t2.CD_MEMBER left outer join '
           +'        (select   CD_MEMBER '
           +'           from   MS_MEMBER '
           +'          where   CD_HEAD  = :P0 '
           +'            and   CD_STORE = :P1 '
           +'            and   Length(GetOnlyNumber(YMD_MARRI)) = 8 '
           +'            and   SubString(YMD_MARRI,5,4) between :P2 and :P3) as t3 on a.CD_MEMBER = t3.CD_MEMBER '
           +' where   a.CD_HEAD   = :P0 '
           +'   and   a.CD_STORE  = :P1 '
           +Ifthen(GetStoreOption(5)='0', '', Format('and CD_STORE_JOIN =''%s'' ',[StoreCode]))
           +'   and   a.DS_STATUS = ''0'' '
           +'   and   (a.CD_MEMBER = t1.CD_MEMBER or a.CD_MEMBER = t2.CD_MEMBER or a.CD_MEMBER = t3.CD_MEMBER) '
           +' group by a.CD_MEMBER, b.NM_CODE1, a.NO_CARD, a.YN_LUNAR, a.YMD_BIRTH, a.YMD_MARRI, a.TEL_MOBILE, a.NM_EMAIL, a.ADDR1, a.ADDR2 ',
           [HeadStoreCode,
            Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
            Copy(DtoS(ConditionToolBarFromDateEdit.Date), 5, 4),
            Copy(DtoS(ConditionToolBarToDateEdit.Date),   5, 4)]);

    Result := DM.ReadQuery(Query, GridTableView);
end;

end.
