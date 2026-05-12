// 마스터 디테일 조회 상속폼 (F)

unit InheritShow2;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow, ImgList, Menus, UniProvider, SQLServerUniProvider,
  Uni, DB, MemDS, dxmdaset, ShellAPI, ExtCtrls, StdCtrls, cxGraphics,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridDBTableView, AdvToolBar, AdvToolBarStylers, cxContainer, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxGridExportLink, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, DBAccess,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxNavigator, System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TInheritShow2Form = class(TInheritShowForm)
    GridDBTableView: TcxGridDBTableView;
    GridSubLevel: TcxGridLevel;
    GridSubDBTableView: TcxGridDBTableView;
    DataSource: TDataSource;
    SubDataSource: TDataSource;

    procedure ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
    procedure ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  protected
    MemData    : TdxMemData;
    SubMemData : TdxMemData;
    function DoSearch:Boolean; override;
    procedure ClearGrid; override;
  end;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 팝업메뉴
//------------------------------------------------------------------------------
// 출력 팝업메뉴
procedure TInheritShow2Form.ButtonToolBarPrintButtonPopupMenuPrintClick(Sender: TObject);
begin
  if not ButtonToolBarPrintButtonPopupMenuPrint.Visible or not ButtonToolBarPrintButtonPopupMenuPrint.Enabled then
    Exit;

//inherited;

  if Grid.ActiveView.DataController.RecordCount = 0 then
    MsgBox(msgNoPrintData)
  else
    DoPrint;
end;
procedure TInheritShow2Form.ClearGrid;
begin
  GridSubDBTableView.DataController.DataSource := nil;
  GridDBTableView.DataController.DataSource := nil;
end;

//------------------------------------------------------------------------------
// 미리보기 팝업메뉴
procedure TInheritShow2Form.ButtonToolBarPrintButtonPopupMenuPreviewClick(Sender: TObject);
begin
  if not ButtonToolBarPrintButtonPopupMenuPreview.Visible or not ButtonToolBarPrintButtonPopupMenuPreview.Enabled then
    Exit;

//inherited;

  if Grid.ActiveView.DataController.RecordCount = 0 then
    MsgBox(msgNoPrintData)
  else
    DoPreview;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TInheritShow2Form.DoSearch:Boolean;
begin
  Result := false;
  try
    Screen.Cursor := crHourGlass;
    ShowMsg('자료를 불러오고 있습니다.', false, -1);
    // 마스터 쿼리를 열어 그리드에 보여준다
    if (SQLs <> nil) and (High(SQLs) >= 0) and (SQLs[0] <> EmptyStr) and (not Query.Active) then
    begin
      OpenQuery(SQLs[0], Params[0]);
      GridDBTableView.DataController.DataSource := nil;
      if DM.ReadQuery(Query, GridDBTableView, MemData) then // 마스터도 쓰레드로 열고 싶었지만 Canvas does not allow drawing 에러가 발생할 때가 있어서 그냥 읽기로 함
      begin
        GridDBTableView.DataController.DataSource := DataSource;
        // 디테일 쿼리를 열어 그리드에 보여준다(쓰레드)
        if (SQLs <> nil) and (High(SQLs) >= 1) and (SQLs[1] <> EmptyStr) and (not Query.Active) then
        begin
          Result := OpenQuery(SQLs[1], Params[1]);
          GridSubDBTableView.DataController.DataSource := nil;
          DM.ReadQuery(Query, GridSubDBTableView, SubMemData);
          GridSubDBTableView.DataController.DataSource := SubDataSource;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TInheritShow2Form.FormCreate(Sender: TObject);
begin
  inherited;
  MemData    := TdxMemData.Create(Self);
  SubMemData := TdxMemData.Create(Self);
  DataSource.DataSet := MemData;
  SubDataSource.DataSet := SubMemData;
end;

end.
