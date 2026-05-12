unit SystemLocalASPPWD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Password, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxTextEdit, Vcl.ExtCtrls, Data.DB, MemDS, DBAccess, Uni;

type
  TSystemLocalASPPWDForm = class(TPasswordForm)
    Label1: TLabel;
    CustomerNoLabel: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SystemLocalASPPWDForm: TSystemLocalASPPWDForm;

implementation
uses Common;
{$R *.dfm}

procedure TSystemLocalASPPWDForm.FormShow(Sender: TObject);
begin
  inherited;
  CustomerNoLabel.Caption := Format('°í°´¹øÈ£ : %s',[StoreCode]);
end;

end.
