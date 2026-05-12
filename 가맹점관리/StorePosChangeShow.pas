unit StorePosChangeShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwRibbon, dxPSPrVwAdv,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxExtEditorProducers, dxPScxEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager, AdvOfficePagerStylers,
  Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, cxCurrencyEdit, StrUtils;

type
  TStorePosChangeShowForm = class(TInheritShowForm)
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  StorePosChangeShowForm: TStorePosChangeShowForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStorePosChangeShowForm }
procedure TStorePosChangeShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  DefaultDate := ddMonthFirst;
end;

function TStorePosChangeShowForm.DoSearch: Boolean;
begin
  OpenQuery('select d.NM_PARTNER, '
           +'       c.NM_COMPANY, '
           +'       a.CD_CUSTOMER, '
           +'       b.NM_CUSTOMER, '
           +'       case b.DS_CUSTOMER when ''O'' then ''Orange'' '
           +'                          when ''E'' then ''ERP'' '
           +'                          when ''M'' then ''Mart'' '
           +'                          when ''S'' then ''Sauna'' end DS_SOLUTION, '
           +'       a.ALLOW_POS    - a.POS_ORG as ALLOW_POS, '
           +'       a.ALLOW_KIOSK  - a.KIOSK_ORG as ALLOW_KIOSK, '
           +'       a.ALLOW_TABLET - a.TABLET_ORG as ALLOW_TABLET, '
           +'       a.DT_INSERT '
           +'  from CUSTOMER_POSCHANGE a inner join '
           +'       CUSTOMER        as b on b.CD_COMPANY = a.CD_COMPANY '
           +'                           and b.CD_CUSTOMER = a.CD_CUSTOMER inner join '
           +'       COMPANY         as c on c.CD_COMPANY  = b.CD_COMPANY inner join '
           +'       PARTNER         as d on d.CD_PARTNER  = b.CD_PARTNER '
           +Ifthen(UserLevel='P',Format(' and d.CD_PARTNER = (select CD_PARTNER '
                                       +'                       from USER_MASTER '
                                       +'                      where ID_USER =''%s'') ',[UserCode]),'')
           +' where a.YMD_CHANGE between :P0 and :P1 '
           +' order by a.DT_INSERT ',
            [DtoS(ConditionToolBarFromDateEdit.Date),
             DtoS(ConditionToolBarToDateEdit.Date)],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;



end.
