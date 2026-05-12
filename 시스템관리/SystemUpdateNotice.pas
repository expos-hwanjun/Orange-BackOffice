unit SystemUpdateNotice;

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
  dxmdaset, StrUtils, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TSystemUpdateNoticeForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Exec_TimerTimer(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch:Boolean; override;
  end;

var
  SystemUpdateNoticeForm: TSystemUpdateNoticeForm;

implementation
uses Common, DBModule, SystemUpdateNoticeShow;
{$R *.dfm}

function TSystemUpdateNoticeForm.DoSearch: Boolean;
begin
  OpenQuery('select SEQ, '
           +'       NOTICE_TITLE, '
           +'       DT_INSERT '
           +'  from UPDATE_NOTICE '
           +' where DS_SOLUTION  =:P0 '
           +'   and DS_STATUS    =''S'' '
           +' order by SEQ desc ',
           ['O'],false, RestBaseURL);

  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TSystemUpdateNoticeForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  DoSearch;
end;

procedure TSystemUpdateNoticeForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  with TSystemUpdateNoticeShowForm.Create(Self) do
  try
    FSeq   := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, 0];
    ShowModal;
  finally
    Free
  end;
end;

end.
