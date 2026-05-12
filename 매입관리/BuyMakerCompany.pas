// 제조업체 관리 (New완료)

unit BuyMakerCompany;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BuyCompany, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLabel, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxMemo, StdCtrls, cxCheckBox,
  cxCurrencyEdit, cxMaskEdit, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls,
  cxButtonEdit, cxDropDownEdit, cxCalendar, AdvGlowButton, AdvToolBar,
  AdvSplitter, AdvToolBarStylers, cxLookAndFeels, cxLookAndFeelPainters,
  DBAccess;

type
  TBuyMakerCompanyForm = class(TBuyCompanyForm)
    procedure FormCreate(Sender: TObject);
  end;

var
  BuyMakerCompanyForm: TBuyMakerCompanyForm;



implementation

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyMakerCompanyForm.FormCreate(Sender: TObject);
begin
  inherited;

  // 제조업체로 지정
  Tag := 8;

end;

end.
