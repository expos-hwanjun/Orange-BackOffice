unit MemberSMSRejectShow;

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
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxMemo,
  dxmdaset, MaskUtils, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TMemberSMSRejectShowForm = class(TInheritShowForm)
    GridTableViewRejectDate: TcxGridColumn;
    GridTableViewTelNo: TcxGridColumn;
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewLastSendDate: TcxGridColumn;
    GridTableViewMessageText: TcxGridColumn;
    GridTableViewNewsYN: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    PopUpMemo: TcxMemo;
    GridTableViewVisitDate: TcxGridColumn;
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridTableViewMessageTextPropertiesPopup(Sender: TObject);
  private
  protected
    function DoSearch: Boolean; override; // 조회
  end;

var
  MemberSMSRejectShowForm: TMemberSMSRejectShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TMemberSMSRejectShowForm }
procedure TMemberSMSRejectShowForm.ButtonToolBarSaveButtonClick(
  Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if not AskBox('회원정보에 수신거부를 반영하시겠습니까?') then Exit;

  try
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if NVL(GridTableView.DataController.Values[vIndex, GridTableViewMemberCode.Index],'') = '' then Continue;

      ExecQuery('update MS_MEMBER '
               +'   set YN_NEWS    = ''N'', '
               +'       YMD_REJECT = Date_Format(Now(), ''%Y%m%d'') '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MEMBER =:P2; ',
               [HeadStoreCode,
                Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewMemberCode.Index])],
                false);
    end;
    ExecQuery(TempSQL, [], true);
    MsgBox('수신거부가 정상 반영되었습니다');
    GridTableView.DataController.RecordCount := 0;
  except
    on E: Exception do
    begin
      MsgBox(E.Message);
      Exit;
    end;
  end;
end;

function TMemberSMSRejectShowForm.DoSearch: Boolean;
begin
end;



procedure TMemberSMSRejectShowForm.GridTableViewMessageTextPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  PopUpMemo.Text := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMessageText.Index];
end;

end.
