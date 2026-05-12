unit HeadNotice;

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
  dxmdaset;

type
  THeadNoticeForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    GridTableViewColumn5: TcxGridColumn;
    GridLevel1: TcxGridLevel;
    GridTableView1: TcxGridTableView;
    GridTableView1Column1: TcxGridColumn;
    GridTableView1Column2: TcxGridColumn;
    GridTableView1Column3: TcxGridColumn;
    GridTableView1Column4: TcxGridColumn;
    GridTableView1Column5: TcxGridColumn;
    GridTableView1Column6: TcxGridColumn;
    GridTableView1Column7: TcxGridColumn;
    GridTableView1Column8: TcxGridColumn;
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  protected
    function  DoSearch:Boolean; override;
  end;

var
  HeadNoticeForm: THeadNoticeForm;

implementation
uses HeadNoticePopup, Common, DBModule, HeadNoticeShow;
{$R *.dfm}

procedure THeadNoticeForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  inherited;
  if (GridTableView.DataController.RecordCount = 0) or (GridTableView.DataController.GetFocusedRecordIndex < 0) then Exit;
  if not AskBox('공지사항을 삭제하시겠습니까?') then Exit;

  ExecQuery('delete from MS_NOTICE'
           +'      where CD_HEAD =:P0 '
           +'        and CD_STORE=:P1 '
           +'        and SEQ     =:P2;',
           [HeadStorecode,
            StandardStore,
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0]],
            false);

  ExecQuery('delete from MS_NOTICE_READ '
           +'      where CD_HEAD =:P0 '
           +'        and CD_STORE=:P1 '
           +'        and SEQ     =:P2;',
           [HeadStorecode,
            StandardStore,
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0]],
            true);

  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
end;

procedure THeadNoticeForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  with THeadNoticePopupForm.Create(Self) do
  try
    if ShowModal = mrOK then
      DoSearch;
  finally
    Free
  end;
end;

procedure THeadNoticeForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;
  if (GridTableView.DataController.RecordCount = 0) or (GridTableView.DataController.GetFocusedRecordIndex < 0) then Exit;


  with THeadNoticePopupForm.Create(Self) do
  try
    FIsNew := false;
    FSeq   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0];
    ShowModal;
  finally
    Free
  end;
end;

function THeadNoticeForm.DoSearch: Boolean;
begin
  if Grid.ActiveLevel = GridLevel then
  begin
    OpenQuery('select SEQ, '
             +'       case when YN_HOT = ''Y'' then ConCat(NOTICE_TITLE,'' NEW'') else NOTICE_TITLE end as NOTICE_TITLE, '
             +'       CD_SAWON_CHG, '
             +'       DT_INSERT, '
             +'       CD_STORE, '
             +'       SHOWN_COUNT '
             +'  from MS_NOTICE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +' order by YN_HOT, SEQ desc ',
             [HeadStoreCode,
              StandardStore]);

    Result := DM.ReadQuery(Query, GridTableView);
    ButtonToolBarDeleteButton.Enabled := false;
    ButtonToolBarSaveButton.Enabled   := false;
  end
  else
  begin
    OpenQuery('select b.NM_STORE as READ_STORE, '
             +'       case when a.DS_READ = ''B'' then ''B/O'' else ''POS'' end as DS_READ, '
             +'       a.CD_SAWON, '
             +'       a.NO_POS, '
             +'       a.YN_STOP, '
             +'       a.MAC_ADDRESS, '
             +'       a.IP_ADDRESS, '
             +'       a.DT_READ '
             +'  from MS_NOTICE_READ a left outer join '
             +'       MS_STORE       b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE_READ '
             +' where a.CD_HEAD  =:P0 '
             +'   and a.CD_STORE =:P1 '
             +'   and a.SEQ      =:P2 '
             +' order by SEQ1 desc ',
             [HeadStoreCode,
              StandardStore,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, 0]]);

    DM.ReadQuery(Query, GridTableView1);
  end;
end;

procedure THeadNoticeForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Grid.ActiveLevel := GridLevel1;
  DoSearch;
end;

procedure THeadNoticeForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := true;
  ButtonToolBarSaveButton.Enabled   := true;
end;

end.
