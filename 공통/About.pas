// About (F)

unit About;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ShellAPI, Menus, AdvOfficePager,
  cxLookAndFeelPainters, cxGraphics, cxSpinEdit, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, cxLookAndFeels,
  StrUtils, Math, MaskUtils;

type
  TAboutForm = class(TForm)
    ExtremeImageShape: TShape;
    VersionLabel: TLabel;
    CopyrightLabel: TLabel;
    ExtremeImage: TImage;
    CustNoLabel: TLabel;
    CustomerLabel: TLabel;
    LicenseDateLabel: TLabel;
    URLLabel: TLabel;
    ProductNameLabel: TLabel;
    FileVersionLabel: TLabel;
    ProductLabel: TLabel;
    procedure FormClick(Sender: TObject);
    procedure URLLabelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
  end;



implementation

uses
  Common;

{$R *.dfm}

//------------------------------------------------------------------------------
// 폼을 클릭할 때(각종 Label 등에도 모두 연결)
procedure TAboutForm.FormClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------
// URL 레이블을 클릭할 때
procedure TAboutForm.FormShow(Sender: TObject);
begin
  CustomerLabel.Caption    := Format('%s (P-%d,K-%d,M-%d)',[StoreCode, AllowPos, AllowKiosk,AllowMenuCount]);
  FileVersionLabel.Caption := Format('File Version  %s',[GetFileVersion]);
end;

procedure TAboutForm.URLLabelClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', PChar(URLLabel.Caption), '', '', SW_SHOW);
end;

end.
