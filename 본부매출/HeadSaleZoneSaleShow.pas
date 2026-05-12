unit HeadSaleZoneSaleShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HeadLocalSaleShow, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxCurrencyEdit, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, AdvPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, AdvSplitter;

type
  THeadSaleZoneSaleShowForm = class(THeadLocalSaleShowForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeadSaleZoneSaleShowForm: THeadSaleZoneSaleShowForm;

implementation

{$R *.dfm}

end.
