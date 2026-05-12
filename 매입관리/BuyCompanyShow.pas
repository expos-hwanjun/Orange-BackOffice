// 거래처 조회 (New완료)

unit BuyCompanyShow;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridCustomTableView, cxGridTableView, ImgList, Menus,
  cxContainer, UniProvider, SQLServerUniProvider, Uni, DB, MemDS,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar,
  AdvGlowButton, ExtCtrls, AdvToolBarStylers, StdCtrls, cxRadioGroup,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, Math, StrUtils,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset;

type
  TBuyCompanyShowForm = class(TInheritShowForm)
    GridTableViewCompanyCode: TcxGridColumn;
    GridTableViewCompanyName: TcxGridColumn;
    GridTableViewBossName: TcxGridColumn;
    GridTableViewBizNo: TcxGridColumn;
    GridTableViewUptae: TcxGridColumn;
    GridTableViewJongmok: TcxGridColumn;
    GridTableViewDamdang: TcxGridColumn;
    GridTableViewDamdangTelNo: TcxGridColumn;
    GridTableViewTelNo: TcxGridColumn;
    GridTableViewFaxNo: TcxGridColumn;
    GridTableViewAddress: TcxGridColumn;
    GridTableViewEMail: TcxGridColumn;
    GridTableViewRemark: TcxGridColumn;
    GridTableViewDsTax: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);

  protected
    function DoSearch:Boolean; override;
  end;

var
  BuyCompanyShowForm: TBuyCompanyShowForm;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyCompanyShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/매입관리/매입처조회/매입처조회.htm';
  PrintMode := pmPreviewExcel;

  ConditionToolBarEditLabel.Hint := ConditionToolBarEdit.Hint;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TBuyCompanyShowForm.FormShow(Sender: TObject);
begin
  inherited;

//  ButtonToolBarSearchButton.Click;
end;

procedure TBuyCompanyShowForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord = nil then Exit;

  if ARecord.Values[GridTableViewStatus.Index] = '중지' then
    AStyle := StyleFontRed;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 거래처에서 키보드를 누를 때
procedure TBuyCompanyShowForm.ConditionToolBarEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_Return then
    ButtonToolBarSearchButton.Click;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TBuyCompanyShowForm.DoSearch:Boolean;
begin
  SetQuery('select   CD_TRDPL, '
          +'         NM_TRDPL, '
          +'         NM_BOSS, '
          +'         NO_BIZER, '
          +'         NM_UPTAE, '
          +'         NM_JONGMOK, '
          +'         NM_DAMDANG, '
          +'         TEL_MOBILE, '
          +'         TEL_OFFICE, '
          +'         TEL_FAX, '
          +'         ConCat(ADDR1,'' '',ADDR2) as ADDR, '
          +'         NM_EMAIL, '
          +'         REMARK, '
          +'         case DS_TAX when ''0'' then ''면세'' when ''1'' then ''과세(포함)'' when ''2'' then ''과세(별도)'' end as DS_TAX, '
          +'         case DS_STATUS when ''0'' then ''정상'' when ''1'' then ''중지'' end as DS_STATUS '
          +'  from   MS_TRD '
          +' where   CD_HEAD  = :P0 '
          +'   and   CD_STORE = :P1 '
          +'   and   DS_TRDPL = ''B'' '
          +'   and   (CD_TRDPL = :P2 '
          +'      or NM_TRDPL like ConCat(''%'',:P2,''%'') '
          +'      or TEL_MOBILE like ConCat(''%'',:P2)) '
          +'  and    DS_TRDPL = '+Ifthen(Tag=0, '''B'' ', '''S'' ')
          +'order by CD_TRDPL',
           [HeadStoreCode,
            StoreCode,
            ConditionToolBarEdit.Text]);
  inherited;
  Result := GridTableView.DataController.RecordCount > 0;
end;

end.
