unit StoreQRPrint;

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
  TStoreQRPrintForm = class(TInheritGridEditForm)
    GridTableViewQRCode: TcxGridColumn;
    DesignFontDialog: TFontDialog;
    DesignPopupMenu: TPopupMenu;
    DesignPopupLabel1: TMenuItem;
    DesignPopupLabel2: TMenuItem;
    DesignPopupLabel3: TMenuItem;
    DesignPopupLabel4: TMenuItem;
    DesignPopupLabel5: TMenuItem;
    ButtonToolBarPrintButton: TAdvGlowButton;
    QRCreatePanel: TAdvPanel;
    SaveButton: TAdvGlowButton;
    CancelButton: TAdvGlowButton;
    PrintPopupMenu: TPopupMenu;
    PreviewPrintMenuItem: TMenuItem;
    PDFSaveMenuItem: TMenuItem;
    QRMemData: TdxMemData;
    QRMemDataQR_IMAGE: TBCDField;
    FastReportUserDataSet: TfrxUserDataSet;
    FastReport: TfrxReport;
    FastReportBarCodeObject: TfrxBarCodeObject;
    GridTableViewNo: TcxGridColumn;
    Label1: TLabel;
    QRSizeEdit: TcxCurrencyEdit;
    Label18: TLabel;
    CreateQtyEdit: TcxSpinEdit;
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
    GridTableViewPopupMenu: TPopupMenu;
    GridTableViewPopupMenuGoodsDelete: TMenuItem;
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
    TableNoMemo: TAdvPanel;
    Label7: TLabel;
    TableNoSizeEdit: TcxSpinEdit;
    procedure PaintBoxPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonToolBarNewButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FastReportUserDataSetCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure PNGSaveButtonClick(Sender: TObject);
    procedure ImageLoadButtonClick(Sender: TObject);
    procedure QRBarcodeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure QRBarcodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure QRBarcodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridTableViewPopupMenuGoodsDeleteClick(Sender: TObject);
    procedure FastReportUserDataSetGetValue(const VarName: string;
      var Value: Variant);
    procedure CreateQtyEditKeyPress(Sender: TObject; var Key: Char);
    procedure TemplateWidthSpinEditPropertiesChange(Sender: TObject);
    procedure TemplateHeightSpinEditPropertiesChange(Sender: TObject);
    procedure DesignPanelCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QRSizeEditPropertiesChange(Sender: TObject);
    procedure PDFSaveMenuItemClick(Sender: TObject);
    procedure PreviewPrintMenuItemClick(Sender: TObject);
    procedure ExcelSaveMenuItemClick(Sender: TObject);
    procedure GridTableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure EditPropertiesChange(Sender: TObject);
    procedure URLEditKeyPress(Sender: TObject; var Key: Char);
    procedure SaveButtonClick(Sender: TObject);
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
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
  end;

var
  StoreQRPrintForm: TStoreQRPrintForm;

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
  OP_QRURL      = 'https://letsorder.co.kr/store/%s';
  DEV_QRURL     = 'https://dev.letsorder.co.kr/store/%s';
  QA_QRURL      = 'https://qa.letsorder.co.kr/store/%s';

{$R *.dfm}

procedure TStoreQRPrintForm.FastReportUserDataSetCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  if GridTableView.DataController.RecordCount = 0 then
    Eof := true
  else
    Eof := FastReportUserDataSet.RecNo >= GridTableView.DataController.RecordCount;
end;


procedure TStoreQRPrintForm.FastReportUserDataSetGetValue(const VarName: string;
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

procedure TStoreQRPrintForm.FormCreate(Sender: TObject);
var
  vCode : PStrPointer;
begin
  inherited;
  DefaultDate     := ddToday;
  QRCodeBitmap    := TBitmap.Create;
  QRURL           := OP_QRURL;
end;

procedure TStoreQRPrintForm.ButtonToolBarNewButtonClick(Sender: TObject);
var vIndex, vSeq :Integer;
    vSQL, vURL   :String;
    vQRCode :String;
    vGuid : TGUID;
begin
//  inherited;
  //대기 QR 생성시
  ButtonToolBarSaveButton.Enabled := false;
  QRCreatePanel.Visible    := true;
  CreateQtyEdit.SetFocus;
  MainPanel.Enabled        := false;
  Grid.Enabled             := false;
  ToolBarDockPanel.Enabled := false;
end;

procedure TStoreQRPrintForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  QRCreatePanel.Visible    := false;
  MainPanel.Enabled        := true;
  Grid.Enabled             := true;
  ToolBarDockPanel.Enabled := true;
end;

procedure TStoreQRPrintForm.CreateQtyEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    SaveButton.Click;
end;

procedure TStoreQRPrintForm.DesignPanelCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  if not isChange then Exit;

  TemplateWidthSpinEdit.Value  := DesignPanel.Width - 2;
  TemplateHeightSpinEdit.Value := DesignPanel.Height - 2;
end;

procedure TStoreQRPrintForm.DoGridLink;
begin
  inherited;
  QRUpdate(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index]);
  URLEdit.Text := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index];
end;

procedure TStoreQRPrintForm.DoPrint(aPrint: String);
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

function TStoreQRPrintForm.DoSearch: Boolean;
begin
end;

procedure TStoreQRPrintForm.EditPropertiesChange(Sender: TObject);
begin
  GridTableView.DataController.RecordCount := 0;
  isChanged := false;
end;

procedure TStoreQRPrintForm.ExcelSaveMenuItemClick(Sender: TObject);
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

procedure TStoreQRPrintForm.FormDestroy(Sender: TObject);
begin
  inherited;
  QRCodeBitmap.Free;
end;

procedure TStoreQRPrintForm.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TStoreQRPrintForm.FormResize(Sender: TObject);
begin
  inherited;
  QRCreatePanel.Left := MainPanel.Width  div 2 + (QRCreatePanel.Width div 2);
  QRCreatePanel.Top  := MainPanel.Height div 2 + (QRCreatePanel.Height div 2) ;
end;

procedure TStoreQRPrintForm.GridTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ButtonToolBarSaveButton.Enabled := ConditionToolBarComboBox.ItemIndex >= 1;
end;

procedure TStoreQRPrintForm.GridTableViewPopupMenuGoodsDeleteClick(
  Sender: TObject);
begin
  inherited;
  GridTableView.Controller.DeleteSelection;
end;

procedure TStoreQRPrintForm.ImageLoadButtonClick(Sender: TObject);
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

procedure TStoreQRPrintForm.QRBarcodeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := true;
  MouseOldX   := X;
  MouseOldY   := Y;
end;

procedure TStoreQRPrintForm.QRBarcodeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if MouseDowned then
  begin
    TControl(Sender).Left := TControl(Sender).Left + X - MouseOldX;
    TControl(Sender).Top  := TControl(Sender).Top  + Y - MouseOldY;
  end;
end;

procedure TStoreQRPrintForm.QRBarcodeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDowned := false;
end;

procedure TStoreQRPrintForm.QRSizeEditPropertiesChange(Sender: TObject);
begin
  inherited;
  QRBarcode.Width  := Trunc(QRSizeEdit.Value * 133);
  QRBarcode.Height := Trunc(QRSizeEdit.Value * 133);
end;

procedure TStoreQRPrintForm.PaintBoxPaint(Sender: TObject);
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

procedure TStoreQRPrintForm.PDFSaveMenuItemClick(Sender: TObject);
begin
  inherited;
  DoPrint('PDF');
end;

procedure TStoreQRPrintForm.PNGSaveButtonClick(Sender: TObject);
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
      QRUpdate(GridTableView.Controller.SelectedRecords[vIndex].Values[1]);
      vBmp.Width  := PaintBox.Width;
      vBmp.Height := PaintBox.Height;
      bitblt(vBmp.Canvas.Handle,0,0,PaintBox.Width,PaintBox.Height,
                Self.PaintBox.Canvas.Handle,0,0,SrcCopy);
      vBmp.SaveToFile(Format('%s\%s.bmp',[Folder+'QR', GridTableView.Controller.SelectedRecords[vIndex].Values[0]]));
    end;
  finally
    vBmp.Free;
  end;
end;

procedure TStoreQRPrintForm.PreviewPrintMenuItemClick(Sender: TObject);
begin
  inherited;
  DoPrint('PRINT');
end;

procedure TStoreQRPrintForm.TemplateHeightSpinEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  isChange := false;
  DesignPanel.Height := TemplateHeightSpinEdit.Value + 2;
  isChange := true;
end;

procedure TStoreQRPrintForm.TemplateWidthSpinEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  isChange := false;
  DesignPanel.Width := TemplateWidthSpinEdit.Value + 2;
  isChange := true;
end;

procedure TStoreQRPrintForm.URLEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index] := URLEdit.Text;
    QRUpdate(GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewQRCode.Index]);
    Key := #0;
  end;
end;

procedure TStoreQRPrintForm.QRUpdate(aQRCode:String);
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

procedure TStoreQRPrintForm.SaveButtonClick(Sender: TObject);
var vIndex  :Integer;
    vQRCode :String;
    vGuid : TGUID;
begin
  inherited;
  QRURL := 'https://qr.letsorder.kr/store/%s';
  GridTableView.DataController.BeginUpdate;
  for vIndex := 1 to CreateQtyEdit.EditingValue do
  begin
    GridTableView.DataController.AppendRecord;
    CreateGUID(vGuid);
    vQRCode := LowerCase(GUIDToString(vGuid));
    vQRCode := Copy(vQRCode, 2, Length(vQRCode)-2);
    vQRCode := Format(QRURL,[vQRCode]);

    GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, GridTableViewNo.Index]         := IntToStr(GridTableView.DataController.RecordCount);
    GridTableView.DataController.Values[Self.GridTableView.DataController.RecordCount-1, GridTableViewQRCode.Index]     := String(vQRCode);
  end;
  GridTableView.DataController.EndUpdate;

  QRCreatePanel.Visible    := false;
  MainPanel.Enabled        := true;
  Grid.Enabled             := true;
  ToolBarDockPanel.Enabled := true;
end;

end.
