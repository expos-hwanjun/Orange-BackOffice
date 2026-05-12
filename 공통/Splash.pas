// ½ºÇÃ·¡½Ã Æû (F)

unit Splash;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Jpeg, dxGDIPlusClasses, Vcl.StdCtrls, Vcl.WinXCtrls;

type
  TSplashForm = class(TForm)
    MessageLabel: TLabel;
    ActivityIndicator: TActivityIndicator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;



implementation

{$R *.dfm}
end.
