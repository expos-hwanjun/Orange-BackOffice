unit CodeScalePLU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CodePLU, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxLabel,
  cxCurrencyEdit, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  DBAccess, Uni, Data.DB, MemDS, Vcl.Buttons, OXSpeedButton, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid,
  cxButtons, cxCheckBox, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvSplitter;

type
  TCodeScalePLUForm = class(TCodePLUForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodeScalePLUForm: TCodeScalePLUForm;

implementation

{$R *.dfm}

procedure TCodeScalePLUForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL := 'BackOffice/内靛包府/11.历匡PLU包府/历匡PLU包府.htm';
end;

end.
