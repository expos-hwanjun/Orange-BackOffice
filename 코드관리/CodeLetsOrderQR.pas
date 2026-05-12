unit CodeLetsOrderQR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxGridCustomTableView, cxGridTableView, Data.DB,
  dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvSplitter, DelphiZXingQRCode, Vcl.StdCtrls, Vcl.Menus,
  frxClass, cxCheckBox, cxButtons, cxButtonEdit, cxCurrencyEdit,
  dxGDIPlusClasses, cxImage, cxGroupBox, Math, cxSpinEdit, AdvPanel, StrUtils,
  MemDS, DBAccess, Uni, frxBarcode2D, frxBarcode, cxRadioGroup, System.NetEncoding,
  dxBarBuiltInMenu, cxPC, Vcl.ExtDlgs, cxScrollBox, frxExportBaseDialog,
  frxExportPDF, ShellAPI, cxGridExportLink, System.JSON, REST.Types, REST.Client,
  PNGImage, dxDateRanges, dxScrollbarAnnotations, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvOfficePager, AdvOfficePagerStylers;

type
  TCodeLetsOrderQRForm = class(TInheritGridEditForm)
    GridTableViewQRCode: TcxGridColumn;
    DesignFontDialog: TFontDialog;
    DesignPopupMenu: TPopupMenu;
    DesignPopupLabel1: TMenuItem;
    DesignPopupLabel2: TMenuItem;
    DesignPopupLabel3: TMenuItem;
    DesignPopupLabel4: TMenuItem;
    DesignPopupLabel5: TMenuItem;
    ButtonToolBarPrintButton: TAdvGlowButton;
    PrintPopupMenu: TPopupMenu;
    PreviewPrintMenuItem: TMenuItem;
    PDFSaveMenuItem: TMenuItem;
    QRMemData: TdxMemData;
    QRMemDataQR_IMAGE: TBCDField;
    FastReportUserDataSet: TfrxUserDataSet;
    FastReport: TfrxReport;
    FastReportBarCodeObject: TfrxBarCodeObject;
    Label1: TLabel;
    QRSizeEdit: TcxCurrencyEdit;
    QRPageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    QRPanel: TAdvPanel;
    PaintBox: TPaintBox;
    PNGSaveButton: TAdvGlowButton;
    A4PaperCheckBox: TcxCheckBox;
    cxScrollBox1: TcxScrollBox;
    DesignPanel: TAdvPanel;
    DesignBackImage: TcxImage;
    ImageLoadButton: TAdvGlowButton;
    PictureLoadDialog: TOpenPictureDialog;
    QRBarcode: TAdvPanel;
    Label3: TLabel;
    ColumSpinEdit: TcxSpinEdit;
    Label2: TLabel;
    DirectionComboBox: TcxComboBox;
    TemplateWidthSpinEdit: TcxSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    TemplateHeightSpinEdit: TcxSpinEdit;
    frxPDFExport: TfrxPDFExport;
    ExcelSaveMenuItem: TMenuItem;
    Label6: TLabel;
    URLEdit: TcxTextEdit;
    GridTableViewTableName: TcxGridColumn;
    TableNoMemo: TAdvPanel;
    Label7: TLabel;
    TableNoSizeEdit: TcxSpinEdit;
    GridTableViewTableNo: TcxGridColumn;
    GridTableViewURL: TcxGridColumn;
    ReCreateButton: TAdvGlowButton;
    procedure PaintBoxPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure FastReportUserDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure PNGSaveButtonClick(Sender: TObject);
    procedure ImageLoadButtonClick(Sender: TObject);
    procedure QRBarcodeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure QRBarcodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure QRBarcodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FastReportUserDataSetGetValue(const VarName: string;
      var Value: Variant);
    procedure TemplateWidthSpinEditPropertiesChange(Sender: TObject);
    procedure TemplateHeightSpinEditPropertiesChange(Sender: TObject);
    procedure DesignPanelCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QRSizeEditPropertiesChange(Sender: TObject);
    procedure PDFSaveMenuItemClick(Sender: TObject);
    procedure PreviewPrintMenuItemClick(Sender: TObject);
    procedure ExcelSaveMenuItemClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure URLEditKeyPress(Sender: TObject; var Key: Char);
    procedure GridTableViewURLPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ReCreateButtonClick(Sender: TObject);
  private
    QRCodeBitmap: TBitmap;
    MouseDowned     : Boolean;
    MouseOldX,
    MouseOldY       : Integer;
    isChange        : Boolean;
    QRURL           : String;
    procedure QRUpdate(aQRCode:String);
    procedure DoPrint(aPrint:String);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    function  DoDelete: Boolean; override;
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
  end;

var
  CodeLetsOrderQRForm: TCodeLetsOrderQRForm;

implementation
uses
  DBModule, Common, Main;

const
  fmtPrice      = '%p';
  fmtDateFrom   = '%f';
  fmtDateTo     = '%t';
  fmtUnit       = '%u';
  fmtDCRate     = '%r';
  valSalePrice  = '15,000';
  valEventPrice = '10,000';
  valDateFrom   = '2010-01-01';
  valDateTo     = '2020-12-31';
  valUnit       = '100g';
  valUnitPrice  = '2,500';
  valDCRate     = '33%';
  FixedFontName = '돋움체';
  DefFontName   = '기본 글꼴';
  FixedFontSize = 10;
  mm2pt         = 4;     // mm를 화면용 포인트로 바꾸는 비율
  mm2dot        = 8;     // mm를 프린터용 도트로 바꾸는 비율
  prnNormal     = '0';

{$R *.dfm}

procedure TCodeLetsOrderQRForm.FastReportUserDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportUserDataSet.RecNo >= GridTableView.DataController.RecordCount;
end;


procedure TCodeLetsOrderQRForm.FastReportUserDataSetGetValue(const VarName: string;
  var Value: Variant);
var
  vIndex: Integer;
begin
  inherited;
  for vIndex := 0 to GridTableView.ColumnCount-1 do
    if GridTableView.Columns[vIndex].DataBinding.FieldName = VarName then
    begin
      Value := GridTableView.DataController.Values[FastReportUserDataSet.RecNo, vIndex];
      break;
    end
end;

procedure TCodeLetsOrderQRForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  DefaultDate     := ddToday;
  QRCodeBitmap    := TBitmap.Create;
  OpenQuery('select b.LETSORDER_URL_NEW '
           +'  from COMPANY     as a inner join '
           +'       SERVER_LIST as b on b.ID_SERVER = a.ID_SERVER '
           +' where a.CD_COMPANY  =:P0 ',
           [HeadStoreCode],false,RestBaseURL);

  if not Query.Eof then
  begin
    QRURL := Query.Fields[0].AsString +'/%s';
    QRURL := Replace(QRURL,'api-qa','qa-qr');
    QRURL := Replace(QRURL,'api-op','qr');
    QRURL := Replace(QRURL,'api/v1','store');
  end;
  Query.Close;
end;

procedure TCodeLetsOrderQRForm.ButtonToolBarNewButtonClick(Sender: TObject);
var vIndex, vSeq :Integer;
    vSQL, vURL   :String;
    vQRCode :String;
    vGuid : TGUID;
begin
//  inherited;
  for vIndex := 0 to GridTableView.DataController.RowCount-1 do
  begin
    if NVL(GridTableView.DataController.Values[vIndex, GridTableViewQRCode.Index],'') <> '' then Continue;
    CreateGUID(vGuid);
    vQRCode := LowerCase(GUIDToString(vGuid));
    vQRCode := Copy(vQRCode, 2, Length(vQRCode)-2);
    GridTableView.DataController.Values[vIndex, GridTableViewQRCode.Index]     := String(vQRCode);
    GridTableView.DataController.Values[vIndex, GridTableViewURL.Index]        := Format(QRURL, [String(vQRCode)]);
    isChanged := true;
  end;
end;

procedure TCodeLetsOrderQRForm.ButtonToolBarSaveButtonClick(Sender: TObject);
var vIndex :Integer;
    vSQL   :String;
begin
  vSQL := '';
  for vIndex := 0 to GridTableView.DataController.RowCount-1 do
  begin
    if GridTableView.DataController.Values[vIndex, GridTableViewTableNo.Index] = 0 then
    begin
      vSQL := vSQL + Format('update MS_STORE_ETC set PACKING_QR = ''%S'' where CD_HEAD = ''%s'' and CD_STORE = ''%s''; ',
                           [GridTableView.DataController.Values[vIndex, GridTableViewQRCode.Index],
                            HeadStoreCode,
                            StoreCode]);
    end
    else
      vSQL := vSQL + Format('update MS_TABLE set LETSORDER_URL =''%s'', DT_CHANGE = Now() where CD_HEAD = ''%s'' and CD_STORE = ''%s'' and NO_TABLE = %s;',
                           [GridTableView.DataController.Values[vIndex, GridTableViewQRCode.Index],
                            HeadStoreCode,
                            StoreCode,
                            GridTableView.DataController.Values[vIndex, GridTableViewTableNo.Index]]);
  end;

  if vSQL <> '' then
  begin
    if ExecQuery(vSQL, [], true, RestDBURL) then
    begin
      MsgBox('정상 저장되었습니다');
      isChanged := false;
    end;
  end;
end;

procedure TCodeLetsOrderQRForm.DesignPanelCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  if not isChange then Exit;

  TemplateWidthSpinEdit.Value  := DesignPanel.Width - 2;
  TemplateHeightSpinEdit.Value := DesignPanel.Height - 2;
end;

function TCodeLetsOrderQRForm.DoDelete: Boolean;
var vIndex :Integer;
begin
  for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
    GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewQRCode.Index] := '';
end;

procedure TCodeLetsOrderQRForm.DoGridLink;
begin
//  inherited;
  URLEdit.Text := NVL(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewURL.Index],'');
  QRUpdate(URLEdit.Text);
end;

procedure TCodeLetsOrderQRForm.DoPrint(aPrint: String);
var
  vPage : TfrxReportPage;
  vBand : TfrxMasterData;
  vMemo : TfrxMemoView;
  vImage: TfrxPictureView;
  vQR  : TfrxBarCode2DView;
  vIndex: Integer;
  vWidth,
  vHeight : Integer;
begin
  vPage := TfrxReportPage(FastReport.FindObject('Page'));
  if DirectionComboBox.ItemIndex = 1 then
  begin
    vPage.Orientation := TPrinterOrientation.poLandscape;
    vPage.PaperWidth    := 297;
    vPage.PaperHeight   := 210;
  end
  else
  begin
    vPage.Orientation := TPrinterOrientation.poPortrait;
    vPage.PaperWidth    := 210;
    vPage.PaperHeight   := 297;
  end;
  vPage.LeftMargin    := 1;
  vPage.RightMargin   := 1;
  vPage.TopMargin     := 1;
  vPage.BottomMargin  := 0;

  vBand := TfrxMasterData(FastReport.FindObject('Band'));
  vBand.Width         := vPage.PaperWidth   * fr01cm;
  vBand.ColumnGap     := 0;
  vBand.ColumnWidth   := DesignBackImage.Width;
  vBand.Height        := DesignBackImage.Height;

  vPage.Columns      := ColumSpinEdit.Value;

// 각 객체 위치 및 내용, 표시여부 등 지정
for vIndex := 0 to DesignPanel.ControlCount-1 do
  if DesignPanel.Controls[vIndex] = QRBarcode then
  begin
    vQR := TfrxBarCode2DView(FastReport.FindObject(DesignPanel.Controls[vIndex].Name));
    if Assigned(vQR) then
    begin
      vQR.Visible        := DesignPanel.Controls[vIndex].Visible;
      vQR.Printable      := vQR.Visible;
      vQR.Left           := DesignPanel.Controls[vIndex].Left - vPage.LeftMargin;
      vQR.Top            := DesignPanel.Controls[vIndex].Top - vPage.TopMargin;
      vQR.Zoom           := QRSizeEdit.Value;
    end;
  end
  else if DesignPanel.Controls[vIndex] = TableNoMemo then
  begin
    vMemo := TfrxMemoView(FastReport.FindObject(DesignPanel.Controls[vIndex].Name));
    if Assigned(vMemo) then
    begin
      vMemo.Visible        := DesignPanel.Controls[vIndex].Visible;
      vMemo.Printable      := vMemo.Visible;
      vMemo.Left           := DesignPanel.Controls[vIndex].Left - vPage.LeftMargin;
      vMemo.Top            := DesignPanel.Controls[vIndex].Top - vPage.TopMargin;
      vMemo.Font.Size      := TableNoSizeEdit.Value;
    end;
  end

  // 그림
  else if DesignPanel.Controls[vIndex] is TcxImage then
  begin
    vImage := TfrxPictureView(FastReport.FindObject(DesignPanel.Controls[vIndex].Name));
    if Assigned(vImage) then
    begin
      vImage.Visible      := DesignPanel.Controls[vIndex].Visible;
      vImage.Printable    := vImage.Visible;
      vImage.TagStr       := DesignPanel.Controls[vIndex].Hint;
      vImage.Left         := 0;//DesignPanel.Controls[vIndex].Left / mm2pt * fr01cm;
      vImage.Top          := 0;//DesignPanel.Controls[vIndex].Top  / mm2pt * fr01cm;
      vImage.Width        := DesignBackImage.Width ;
      vImage.Height       := DesignBackImage.Height;
    end;
  end;

  FastReport.PrepareReport;
  if aPrint = 'PDF' then
  begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'QR') then
      ForceDirectories(ExtractFilePath(Application.ExeName)+'QR');
    frxPDFExport.DefaultPath := ExtractFilePath(Application.ExeName)+'QR';
    frxPDFExport.FileName    := Format('%s(%d).pdf',[FormatDateTime('yyymmdd',Now()),GridTableView.DataController.RecordCount]);
    FastReport.Export(frxPDFExport);
  end
  else
    FastReport.ShowReport;
end;

function TCodeLetsOrderQRForm.DoSearch: Boolean;
var vIndex :Integer;
begin
  OpenQuery('select 0 as NO_TABLE, '
           +'       ''포장'' as NM_TABLE, '
           +'       PACKING_QR as LETSORDER_URL '
           +'  from MS_STORE_ETC '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'union all '
           +'select NO_TABLE, '
           +'       NM_TABLE, '
           +'       LETSORDER_URL '
           +'  from MS_TABLE '
           +' where CD_HEAD  =:P0 '
           +'   and CD_STORE =:P1 '
           +'   and SEQ = 0 '
           +'   and YN_PACKING = ''N'' ',
           [HeadStoreCode,
            StoreCode]);
  Result := DM.ReadQuery(Query, GridTableView);
  for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
  begin
    if NVL(GridTableView.DataController.Values[vIndex, GridTableViewQRCode.Index],'') <> '' then
      GridTableView.DataController.Values[vIndex, GridTableViewURL.Index] := Format(QRURL, [GridTableView.DataController.Values[vIndex, GridTableViewQRCode.Index]]);
  end;
end;

procedure TCodeLetsOrderQRForm.EditPropertiesChange(Sender: TObject);
begin
  GridTableView.DataController.RecordCount := 0;
  isChanged := false;
end;

procedure TCodeLetsOrderQRForm.ExcelSaveMenuItemClick(Sender: TObject);
var vFileName :String;
begin
  inherited;
  if Grid.ActiveView.DataController.RecordCount = 0 then
    ShowMsg(msgNoPrintData)
  else
  begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+dirExcel) then
      ForceDirectories(ExtractFilePath(Application.ExeName)+dirExcel);
    vFileName := ExtractFilePath(Application.ExeName)+'QR\' +FormatDateTime(fmtDateShort, Date)+'.xls';
    ExportGridToExcel(vFileName, Grid, false, true, false);
    ShellExecute(0, 'open', PChar(vFileName), nil, nil, SW_SHOW);
  end;

end;

procedure TCodeLetsOrderQRForm.FormDestroy(Sender: TObject);
begin
  inherited;
  QRCodeBitmap.Free;
end;

procedure TCodeLetsOrderQRForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_LEFT  : QRBarcode.Left := QRBarcode.Left - 1;
      VK_RIGHT : QRBarcode.Left := QRBarcode.Left + 1;
      VK_UP    : QRBarcode.Top  := QRBarcode.Top  - 1;
      VK_DOWN  : QRBarcode.Top  := QRBarcode.Top  + 1;
    end;
    Key := 0;
  end
end;

procedure TCodeLetsOrderQRForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
//  inherited;
  DoGridLink;
end;

procedure TCodeLetsOrderQRForm.GridTableViewURLPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index] := Copy(String(DisplayValue), Pos('store',String(DisplayValue))+6, 100);
  URLEdit.Text := String(DisplayValue);
  QRUpdate(URLEdit.Text);
  isChanged := true;
end;

procedure TCodeLetsOrderQRForm.ImageLoadButtonClick(Sender: TObject);
var vHeight, vWidth :Integer;
begin
  inherited;
  if PictureLoadDialog.Execute then
  begin
    with TPicture.Create do
    try
      LoadFromFile(PictureLoadDialog.FileName);
      vHeight := Height;
      vWidth  := Width;
    finally
      Free;
    end;
    DesignPanel.Width  := vWidth+2;
    DesignPanel.Height := vHeight+2;
    TemplateWidthSpinEdit.Value  := DesignBackImage.Width - 2;
    TemplateHeightSpinEdit.Value := DesignBackImage.Height - 2;

    DesignBackImage.Picture.LoadFromFile(PictureLoadDialog.FileName);
    DesignBackImage.Hint := PictureLoadDialog.FileName;
  end;
end;

procedure TCodeLetsOrderQRForm.QRBarcodeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;

procedure TCodeLetsOrderQRForm.QRBarcodeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
  end;
end;

procedure TCodeLetsOrderQRForm.QRBarcodeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := false;
end;

procedure TCodeLetsOrderQRForm.QRSizeEditPropertiesChange(Sender: TObject);
begin
  inherited;
  QRBarcode.Width  := Trunc(QRSizeEdit.Value * 133);
  QRBarcode.Height := Trunc(QRSizeEdit.Value * 133);
end;

procedure TCodeLetsOrderQRForm.PaintBoxPaint(Sender: TObject);
var
  Scale: Double;
begin
  PaintBox.Canvas.Brush.Color := clWhite;
  PaintBox.Canvas.FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (PaintBox.Width < PaintBox.Height) then
    begin
      Scale := PaintBox.Width / QRCodeBitmap.Width;
    end else
    begin
      Scale := PaintBox.Height / QRCodeBitmap.Height;
    end;
    PaintBox.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width), Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;

procedure TCodeLetsOrderQRForm.PDFSaveMenuItemClick(Sender: TObject);
begin
  inherited;
  DoPrint('PDF');
end;

procedure TCodeLetsOrderQRForm.PNGSaveButtonClick(Sender: TObject);
var vBmp :TBitmap;
    vIndex :Integer;
    vStream :TStream;
    vPNG    :TPNGImage;
begin
  inherited;
  if not DirectoryExists(Folder+'QR') then
    ForceDirectories(Folder+'QR');

  try
    vBmp := TBitmap.Create;
    for vIndex := 0 to GridTableView.Controller.SelectedRecordCount-1 do
    begin
      QRUpdate(GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewURL.Index]);
      vBmp.Width  := PaintBox.Width;
      vBmp.Height := PaintBox.Height;
      bitblt(vBmp.Canvas.Handle,0,0,PaintBox.Width,PaintBox.Height,
                Self.PaintBox.Canvas.Handle,0,0,SrcCopy);
      vBmp.SaveToFile(Format('%s\%s.bmp',[Folder+'QR', GridTableView.Controller.SelectedRecords[vIndex].Values[GridTableViewTableName.Index]]));
    end;
  finally
    vBmp.Free;
  end;
end;

procedure TCodeLetsOrderQRForm.PreviewPrintMenuItemClick(Sender: TObject);
begin
  inherited;
  DoPrint('PRINT');
end;

procedure TCodeLetsOrderQRForm.TemplateHeightSpinEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  isChange := false;
  DesignPanel.Height := TemplateHeightSpinEdit.Value + 2;
  isChange := true;
end;

procedure TCodeLetsOrderQRForm.TemplateWidthSpinEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  isChange := false;
  DesignPanel.Width := TemplateWidthSpinEdit.Value + 2;
  isChange := true;
end;

procedure TCodeLetsOrderQRForm.URLEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewURL.Index]    := URLEdit.Text;
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index] := Copy(String(URLEdit.Text), Pos('store',String(URLEdit.Text))+6, 100);
    QRUpdate(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index]);
    isChanged := true;
    Key := #0;
  end;
end;

procedure TCodeLetsOrderQRForm.QRUpdate(aQRCode:String);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
//      0 'Auto'
//      1 'Numeric'
//      2 'Alphanumeric'
//      3 'ISO-8859-1'
//      4 'UTF-8 without BOM'
//      5 'UTF-8 with BOM')

    QRCode.Data      := aQRCode;
    QRCode.Encoding  := TQRCodeEncoding(0);
    QRCode.QuietZone := 4;
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
  PaintBox.Repaint;
end;

procedure TCodeLetsOrderQRForm.ReCreateButtonClick(Sender: TObject);
var vQRCode :String;
    vGuid : TGUID;
begin
  inherited;
  CreateGUID(vGuid);
  vQRCode := LowerCase(GUIDToString(vGuid));
  vQRCode := Copy(vQRCode, 2, Length(vQRCode)-2);
  URLEdit.Text := Format(QRURL, [String(vQRCode)]);
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index]     := String(vQRCode);
  GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewURL.Index]        := Format(QRURL, [String(vQRCode)]);
  isChanged := true;
end;

end.
