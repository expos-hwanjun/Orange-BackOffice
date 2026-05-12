unit StoreNotice;

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
  dxmdaset, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TStoreNoticeForm = class(TInheritShowForm)
    GridTableViewSeq: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    ButtonToolBarNewButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    GridTableViewSolutionName: TcxGridColumn;
    GridTableViewSolutionCode: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
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
  private
    { Private declarations }
  protected
    function  DoSearch:Boolean; override;
  end;

var
  StoreNoticeForm: TStoreNoticeForm;

implementation
uses StoreNoticePopup, StoreNoticeShow, Common, DBModule;
{$R *.dfm}

procedure TStoreNoticeForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  inherited;
  if (GridTableView.DataController.RecordCount = 0) or (GridTableView.DataController.GetFocusedRecordIndex < 0) then Exit;
  if not AskBox('공지사항을 삭제하시겠습니까?') then Exit;

  ExecQuery('delete from UPDATE_NOTICE'
           +'      where DS_SOLUTION =:P0 '
           +'        and SEQ         =:P1;',
           [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSolutionCode.Index],
            GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSeq.Index]],
            true,RestBaseURL);

  GridTableView.DataController.DeleteRecord(GridTableView.DataController.GetFocusedRecordIndex);
end;

procedure TStoreNoticeForm.ButtonToolBarNewButtonClick(Sender: TObject);
begin
  inherited;
  with TStoreNoticePopupForm.Create(Self) do
  try
    if ShowModal = mrOK then
      DoSearch;
  finally
    Free
  end;
end;

procedure TStoreNoticeForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;
  if (GridTableView.DataController.RecordCount = 0) or (GridTableView.DataController.GetFocusedRecordIndex < 0) then Exit;


  with TStoreNoticePopupForm.Create(Self) do
  try
    FIsNew := false;
    FSolution   := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSolutionCode.Index];
    FSeq        := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewSeq.Index];
    ShowModal;
  finally
    Free
  end;
end;

function TStoreNoticeForm.DoSearch: Boolean;
begin
  OpenQuery('select case a.DS_SOLUTION when ''O'' then ''Orange'' when ''E'' then ''ERP'' when ''M'' then ''Mart'' when ''T'' then ''ThemePark'' end SOLUTION, '
           +'       a.SEQ, '
           +'       a.NOTICE_TITLE, '
           +'       a.VERSION, '
           +'       b.NM_USER, '
           +'       a.DT_INSERT, '
           +'       a.DS_SOLUTION '
           +'  from UPDATE_NOTICE a inner join '
           +'       USER_MASTER   b on b.ID_USER = a.ID_USER '
           +GetStrPointerData(ConditionToolBarComboBox)
           +' order by a.DT_INSERT desc ',
           [],false,RestBaseURL);

  Result := DM.ReadQuery(Query, GridTableView);
  ButtonToolBarDeleteButton.Enabled := false;
  ButtonToolBarSaveButton.Enabled   := false;
end;

procedure TStoreNoticeForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := '';;
  ConditionToolBarComboBox.Properties.Items.AddObject('전체', TObject(vCode));
  New(vCode);
  vCode^.Data := ' where a.DS_SOLUTION = ''O'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('오렌지', TObject(vCode));
  New(vCode);
  vCode^.Data := ' where a.DS_SOLUTION = ''E'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('ERP', TObject(vCode));
  New(vCode);
  vCode^.Data := ' where a.DS_SOLUTION = ''M'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('유통', TObject(vCode));
  New(vCode);
  vCode^.Data := ' where a.DS_SOLUTION = ''T'' ';;
  ConditionToolBarComboBox.Properties.Items.AddObject('테마파크', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;

  if UserLevel <> 'E' then
  begin
    ButtonToolBarNewButton.Visible    := false;
    ButtonToolBarDeleteButton.Visible := false;
    ButtonToolBarSaveButton.Visible   := false;
  end;
end;

procedure TStoreNoticeForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  with TStoreNoticeShowForm.Create(Self) do
  try
    FSolution := Copy(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSolutionName.Index],1,1);
    FSeq   := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index];
    ShowModal;
  finally
    Free
  end;
end;

procedure TStoreNoticeForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarDeleteButton.Enabled := true;
  ButtonToolBarSaveButton.Enabled   := true;
end;

end.
