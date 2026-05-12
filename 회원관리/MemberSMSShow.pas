unit MemberSMSShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DB, cxDBData, cxTextEdit, cxCurrencyEdit, dxmdaset,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, dxPSCore,
  dxPScxCommon, Menus, ImgList, AdvToolBar, AdvToolBarStylers,
  ExtCtrls, DBAccess, Uni, MemDS, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, cxRadioGroup, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, MaskUtils, StrUtils, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  Math, cxMemo, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxNavigator, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, System.ImageList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TMemberSMSShowForm = class(TInheritShowForm)
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    GridDBTableView2: TcxGridDBTableView;
    GridDBTableView1RequestDate: TcxGridDBColumn;
    GridDBTableView1CallBackNo: TcxGridDBColumn;
    GridDBTableView1SendDate: TcxGridDBColumn;
    GridDBTableView1Message: TcxGridDBColumn;
    GridDBTableView1SmsCount: TcxGridDBColumn;
    GridDBTableView1LmsCount: TcxGridDBColumn;
    GridDBTableView1UseCount: TcxGridDBColumn;
    GridDBTableView1Seq: TcxGridDBColumn;
    DataSource: TDataSource;
    SubDataSource: TDataSource;
    GridDBTableView2MobileTel: TcxGridDBColumn;
    GridDBTableView2Column2: TcxGridDBColumn;
    GridDBTableView2Column3: TcxGridDBColumn;
    GridDBTableView2Column4: TcxGridDBColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ConditonToolBarSmsButton: TAdvGlowButton;
    ButtonToolBarNotReceiveButton: TAdvGlowButton;
    GridDBTableView1FailCount: TcxGridDBColumn;
    GridDBTableView1State: TcxGridDBColumn;
    PopUpMemo: TcxMemo;
    procedure GridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonToolBarNotReceiveButtonClick(Sender: TObject);
    procedure GridDBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure GridDBTableView1MessagePropertiesPopup(Sender: TObject);
  private
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
  protected
    function DoSearch: Boolean; override; // 조회
  end;

var
  MemberSMSShowForm: TMemberSMSShowForm;

implementation
uses Common;
{$R *.dfm}

{ TMemberSMSShowForm }
procedure TMemberSMSShowForm.FormShow(Sender: TObject);
var  vField :TField;
     vIndex :Integer;
begin
  inherited;
  MemData.Fields.Clear;
  for vIndex := 0 to GridDBTableView1.ColumnCount-1 do
  begin
    case vIndex of
      0..3,8,9 :
      begin
        vField  := TStringField.Create(MemData);
        if vIndex = 3 then
          vField.Size := 1500
        else
          vField.Size := 100;
      end;
      4..7 : vField  := TCurrencyField.Create(MemData);
    end;
    vField.FieldName := GridDBTableView1.Columns[vIndex].DataBinding.FieldName;
    vField.DataSet   := MemData;
  end;

  SubMemData.Fields.Clear;
  for vIndex := 0 to GridDBTableView2.ColumnCount-1 do
  begin
    vField           := TStringField.Create(SubMemData);
    vField.FieldName := GridDBTableView2.Columns[vIndex].DataBinding.FieldName;
    vField.Size      := 100;
    vField.DataSet   := SubMemData;
  end;
end;

procedure TMemberSMSShowForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var
  vResult :String;
  vReturn :Boolean;
label loop;
begin
  if GridTableView.Controller.SelectedRecordCount > 1 then
  begin
    MsgBox('삭제는 한건씩 해야합니다');
    Exit;
  end;
end;


procedure TMemberSMSShowForm.ButtonToolBarNotReceiveButtonClick(
  Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if GridDBTableView2.Controller.SelectedRecordCount = 0 then
  begin
    MsgBox('수신거부를 할 전화번호를 선택하세요');
    Exit;
  end;

  try
    for vIndex := 0 to GridDBTableView2.Controller.SelectedRecordCount-1 do
    begin
      ExecQuery('update MS_MEMBER '
               +'   set YN_NEWS = ''N'' '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and AES_Decrypt(TEL_MOBILE, 71483) =:P2; ',
               [HeadStoreCode,
                Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                GetOnlyNumber(GridDBTableView2.Controller.SelectedRecords[vIndex].Values[GridDBTableView2MobileTel.Index])], false);
    end;
    ExecQuery(TempSQL, [], true);
    MsgBox(msgSaved);
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

function TMemberSMSShowForm.DoSearch: Boolean;
begin
end;

procedure TMemberSMSShowForm.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := (Grid.ActiveLevel = GridLevel) and (GridDBTableView1.DataController.GetFocusedRecordIndex >= 0);
  ButtonToolBarSaveButton.Enabled   := (Grid.ActiveLevel = GridLevel) and (GridDBTableView1.DataController.GetFocusedRecordIndex >= 0);
end;

procedure TMemberSMSShowForm.GridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure TMemberSMSShowForm.GridDBTableView1MessagePropertiesPopup(
  Sender: TObject);
begin
  inherited;
  PopupMemo.Text := GridDBTableView1.DataController.Values[GridDBTableView1.DataController.GetFocusedRecordIndex, GridDBTableView1Message.Index];
end;

procedure TMemberSMSShowForm.GridDBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridDBTableView1State.Index] = 'Y' then
    AStyle := StyleFontRed;
end;

procedure TMemberSMSShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL    := 'BackOffice/회원관리/문자%20발송조회/문자%20발송조회.htm';
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet := MemData;
  SubDataSource.DataSet := SubMemData;
end;



end.
