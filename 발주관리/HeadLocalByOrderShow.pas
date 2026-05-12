unit HeadLocalByOrderShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls,
  AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, Vcl.StdCtrls, cxRadioGroup,
  cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton,
  cxSpinEdit, cxCurrencyEdit, AdvSplitter, SHDocVw, StrUtils, cxButtonEdit;

type
  THeadLocalByOrderShowForm = class(TInheritShowForm)
    YeadSpinEdit: TcxSpinEdit;
    GridTableViewYear: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewColumn5: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    GridTableViewColumn7: TcxGridColumn;
    GridTableViewColumn8: TcxGridColumn;
    GridTableViewColumn9: TcxGridColumn;
    GridTableViewColumn10: TcxGridColumn;
    GridTableViewColumn11: TcxGridColumn;
    GridTableViewColumn1: TcxGridColumn;
    GridTableViewColumn12: TcxGridColumn;
    GridTableViewColumn13: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
  private
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadLocalByOrderShowForm: THeadLocalByOrderShowForm;

implementation
uses
  Common, DBModule;

{$R *.dfm}

{ TOrderMonthByShowForm }

function THeadLocalByOrderShowForm.DoSearch: Boolean;
begin
  OpenQuery('select c.NM_CODE1 as LOCAL, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0101'') and ConCat(:P1,''0131'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_JAN, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0201'') and ConCat(:P1,''0231'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_FEB, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0301'') and ConCat(:P1,''0331'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_MAR, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0401'') and ConCat(:P1,''0431'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_APR, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0501'') and ConCat(:P1,''0531'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_MAY, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0601'') and ConCat(:P1,''0631'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_JUN, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0701'') and ConCat(:P1,''0731'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_JUL, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0801'') and ConCat(:P1,''0831'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_AUG, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''0901'') and ConCat(:P1,''0931'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_SEP, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''1001'') and ConCat(:P1,''1031'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_OCT, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''1101'') and ConCat(:P1,''1131'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_NOV, '
           +'       Ifnull(case when a.YMD_SALE between ConCat(:P1,''1201'') and ConCat(:P1,''1231'') then Sum(a.AMT_SALE) else 0 end,0) as AMT_DEC, '
           +'       Ifnull(Sum(a.AMT_SALE),0) as AMT_TOT '
           +'  from OL_SALE_H a inner join '
           +'       MS_STORE  b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = a.CD_STORE inner join '
           +'       MS_CODE   c on c.CD_HEAD = b.CD_HEAD and c.CD_KIND = ''01'' and c.CD_CODE = b.CD_LOCAL '
           +' where a.CD_HEAD = :P0 '
           +'   and a.YMD_SALE between ConCat(:P1,''0101'') and ConCat(:P1,''1231'') '
           +' group by b.CD_LOCAL ',
           [HeadStoreCode,
            YeadSpinEdit.Text]);

  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure THeadLocalByOrderShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
  YeadSpinEdit.Text := FormatDateTime('yyyy',Now());
end;

end.
