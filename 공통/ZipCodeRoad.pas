unit ZipCodeRoad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  TZipCodeRoadForm = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZipCodeRoadForm: TZipCodeRoadForm;

implementation

{$R *.dfm}

procedure TZipCodeRoadForm.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.epost.go.kr/search/zipcode/search5.jsp?key=road');
end;

end.
