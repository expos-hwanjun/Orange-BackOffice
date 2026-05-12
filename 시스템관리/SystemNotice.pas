unit SystemNotice;

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
  TSystemNoticeForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    procedure GridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    { Private declarations }
  protected
    function  DoSearch:Boolean; override;
  end;

var
  SystemNoticeForm: TSystemNoticeForm;

implementation
uses Common, DBModule, SystemNoticeShow;
{$R *.dfm}

function TSystemNoticeForm.DoSearch: Boolean;
begin
  OpenQuery('select SEQ, '
           +'       NOTICE_TITLE, '
           +'       ConCat(StoD(YMD_FROM),''~'',StoD(YMD_TO)) as NOTICE_RANGE, '
           +'       CD_SAWON_CHG, '
           +'       DT_INSERT '
           +'  from MS_NOTICE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and DS_NOTICE in (''A'',''B'') '
           +'   and (ifnull(CD_STORE_NOTICE,'''') = '''' or CD_STORE_NOTICE like :P2) '
           +' order by YN_HOT, SEQ desc ',
           [HeadStoreCode,
            StandardStore,
            '%'+StoreCode+'%']);

  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TSystemNoticeForm.Exec_TimerTimer(Sender: TObject);
begin
  inherited;
  Exec_Timer.Enabled := false;
  DoSearch;
end;

procedure TSystemNoticeForm.GridTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  with TSystemNoticeShowForm.Create(Self) do
  try
    FSeq   := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, 0];
    ShowModal;
  finally
    Free
  end;
end;

procedure TSystemNoticeForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if RightStr(ARecord.Values[2],10) < FormatDateTime('yyyy-mm-dd',Now()) then
    AStyle := StyleFontGray;
end;

end.
