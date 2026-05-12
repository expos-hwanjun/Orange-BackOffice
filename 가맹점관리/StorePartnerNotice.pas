unit StorePartnerNotice;

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
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, Vcl.ImgList,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess, Uni,
  Data.DB, MemDS, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IPPeerClient,
  System.ImageList, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  dxmdaset, StrUtils;

type
  TStorePartnerNoticeForm = class(TInheritShowForm)
    GridTableViewSeq: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    GridTableViewSolution: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function  DoSearch:Boolean; override;
  end;

var
  StorePartnerNoticeForm: TStorePartnerNoticeForm;

implementation
uses StorePartnerNoticePopup, StorePartnerNoticeShow, Common, DBModule;
{$R *.dfm}

procedure TStorePartnerNoticeForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  inherited;
  if (GridTableView.DataController.RecordCount = 0) or (GridTableView.DataController.GetFocusedRecordIndex < 0) then Exit;
  if not AskBox('공지사항을 삭제하시겠습니까?') then Exit;

  ExecQuery('delete from PARTNER_NOTICE'
           +'      where DS_SOLUTION =:P0 '
           +'        and CD_PARTNER  =:P1 '
           +'        and SEQ         =:P2;',
           [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSolution.Index],
            Ifthen(PartnerCode='','0000',PartnerCode),
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSeq.Index]],
            true);

  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
end;

procedure TStorePartnerNoticeForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  with TStorePartnerNoticePopupForm.Create(Self) do
  try
    FIsNew := true;
    if ShowModal = mrOK then
      DoSearch;
  finally
    Free
  end;
end;

procedure TStorePartnerNoticeForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;
  if (GridTableView.DataController.RecordCount = 0) or (GridTableView.DataController.GetFocusedRecordIndex < 0) then Exit;


  with TStorePartnerNoticePopupForm.Create(Self) do
  try
    FIsNew := false;
    FSolution    := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSolution.Index];
    FSeq         := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSeq.Index];
    FStatus      := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewStatus.Index];
    ShowModal;
  finally
    Free
  end;
end;

function TStorePartnerNoticeForm.DoSearch: Boolean;
begin
  OpenQuery('select a.SEQ, '
           +'       a.NOTICE_TITLE, '
           +'       b.NM_USER, '
           +'       a.DT_INSERT, '
           +'       case when a.YN_USE = ''Y'' then ''공지'' else ''중지'' end DS_STATUS, '
           +'       a.DS_SOLUTION '
           +'  from PARTNER_NOTICE a inner join '
           +'       USER_MASTER   b on b.ID_USER = a.ID_USER '
           +' where a.CD_PARTNER =:P0 '
           +' order by a.SEQ desc ',
           [Ifthen(PartnerCode='','0000',PartnerCode)],false, RestBaseURL);

  Result := DM.ReadQuery(Query, GridTableView);
  ButtonToolBarDeleteButton.Enabled := false;
  ButtonToolBarSaveButton.Enabled   := false;
end;

procedure TStorePartnerNoticeForm.FormCreate(Sender: TObject);
begin
  if UserLevel = 'E' then
  begin
    GridTableViewSolution.Tag := 98;
    GridTableViewSolution.Visible := true;
  end;
  inherited;
end;

procedure TStorePartnerNoticeForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  with TStorePartnerNoticeShowForm.Create(Self) do
  try
    FSolution    := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSolution.Index];
    FSeq         := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index];
    ShowModal;
  finally
    Free
  end;
end;

procedure TStorePartnerNoticeForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := true;
  ButtonToolBarSaveButton.Enabled   := true;
end;

procedure TStorePartnerNoticeForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewStatus.Index] = '중지' then
    AStyle := StyleFontRed;
end;

end.
