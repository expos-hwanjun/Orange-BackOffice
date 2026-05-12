unit HeadSaleReadyByStoreShow;

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
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxGridCustomTableView,
  cxGridTableView, cxButtonEdit, dxPSCore, dxPScxCommon, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, cxGridLevel, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxRadioGroup, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton;

type
  THeadSaleReadyByStoreShowForm = class(TInheritShowForm)
    ConditionToolBarStoreCodeEdit: TcxButtonEdit;
    ConditionToolBarStoreNameLabel: TcxLabel;
    GridTableViewLogisticsName: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    GridTableViewColumn3: TcxGridColumn;
    GridTableViewColumn4: TcxGridColumn;
    GridTableViewSaleQty: TcxGridColumn;
    GridTableViewColumn6: TcxGridColumn;
    procedure EditPropertiesChange(Sender: TObject);
    procedure ConditionToolBarStoreCodeEditPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    function  SearchStore(aStore: string = ''): string;
  protected
    function DoSearch:Boolean; override;
  end;

var
  HeadSaleReadyByStoreShowForm: THeadSaleReadyByStoreShowForm;

implementation
uses
  Common, DBModule, Help;

{$R *.dfm}

{ THeadSaleReadyByStoreShowForm }

procedure THeadSaleReadyByStoreShowForm.ConditionToolBarStoreCodeEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchStore(ConditionToolBarStoreCodeEdit.Text);
end;

function THeadSaleReadyByStoreShowForm.DoSearch: Boolean;
begin
  if ConditionToolBarStoreCodeEdit.Text = '' then
  begin
    MsgBox('조회 할 매장을 선택하세요');
    Exit;
  end;

  OpenQuery('select g.CD_LOGISTICS, '
           +'       Max(s.NM_TRDPL) AS NM_LOGISTICS, '
           +'       d.CD_GOODS, '
           +'       Max(g.NM_GOODS) as NM_GOODS, '
           +'       Max(k.NM_CODE1) as NM_KEEP, '
           +'       Max(g.NM_UNIT) as NM_UNIT, '
           +'       Sum(d.QTY_CONFIRM) as QTY_SALE '
           +'  from OL_ORDER_D as d INNER join '
           +'       OL_ORDER_H as h ON h.CD_HEAD = d.CD_HEAD AND h.YMD_ORDER = d.YMD_ORDER and h.NO_ORDER = d.NO_ORDER and h.DS_STATUS in (''O'',''C'') INNER join '
           +'       MS_GOODS   as g ON g.CD_HEAD = d.CD_HEAD AND g.CD_STORE  = :P4 AND g.CD_GOODS = d.CD_GOODS INNER join '
           +'       MS_TRD     as s ON s.CD_HEAD = d.CD_HEAD AND s.CD_STORE  = :P4 and s.CD_TRDPL = g.CD_LOGISTICS left outer join '
           +'       MS_CODE    as k on k.CD_HEAD = d.CD_HEAD and k.CD_STORE  = :P4 and k.CD_KIND = ''07'' and k.CD_CODE = g.CD_KEEP '
           +' where d.CD_HEAD = :P0 '
           +'   and d.YMD_ORDER between :P1 and :P2 '
//           +'   and d.YMD_ORDER between DATE_FORMAT(ADDDATE(CAST(:P1 AS DATETIME), INTERVAL -1 WEEK), ''%Y%m%d'') and :P1 '
           +'   and g.CD_STORE = :P3 '
           +' group by g.CD_LOGISTICS, d.CD_GOODS '
           +' order by g.CD_LOGISTICS, d.CD_GOODS ',
           [HeadStoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarStoreCodeEdit.Text,
            StandardStore]);
  Result := DM.ReadQuery(Query, GridTableView);
  if Result then
  begin
    DM.GroupGridTable(GridTableView,
                      GridTableViewLogisticsName.Index,
                      GridTableViewLogisticsName.Index,
                      ' [ 소 계 ] ',
                     [GridTableViewSaleQty.Index]);
    GridTableView.OptionsView.Footer := false;
  end;
end;

procedure THeadSaleReadyByStoreShowForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = ConditionToolBarStoreCodeEdit) and (ConditionToolBarStoreCodeEdit.Text <> ConditionToolBarStoreCodeEdit.TextHint) then
  begin
    ConditionToolBarStoreCodeEdit.TextHint  := EmptyStr;
    ConditionToolBarStoreNameLabel.Caption  := EmptyStr;
    ClearGrid;
  end;
  isChanged := false;
end;

procedure THeadSaleReadyByStoreShowForm.EditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var vCode, vName :String;
begin
  inherited;
  if DisplayValue <> '' then
  begin
    try
      OpenQuery('select   CD_STORE, '
               +'         NM_STORE '
               +'from     MS_STORE '
               +'where    CD_HEAD   = :P0 '
               +'  and   (CD_STORE  = :P1 '
               +'      or NM_STORE like ConCat(''%'',:P1,''%'')) '
               +'  and    YN_USE = ''Y'' ',
               [HeadStoreCode,
                DisplayValue]);
      if not Query.Eof then
      begin
        vCode := Query.Fields[0].AsString;
        vName := Query.Fields[1].AsString;
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue              := vCode;
          ConditionToolBarStoreNameLabel.Caption := vName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
        begin
          Query.Close;
          DisplayValue := SearchStore(DisplayValue);
        end;
      end
      else
      begin
        ErrorText := Format('''%s'' 조건에 맞는 매장이 없습니다', [DisplayValue]);
        DisplayValue := EmptyStr;
        Error     := true;
      end;
    finally
      FinishQuery;
    end;
  end;
  isChanged := false;
end;

procedure THeadSaleReadyByStoreShowForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrintMode   := pmPreviewExcel;
end;

function THeadSaleReadyByStoreShowForm.SearchStore(aStore: string): string;
begin
  Result := EmptyStr;

  with THelpForm.Create(Self) do
    try
      Caption := '매장 조회';
      GridTableViewCode.Caption  := '매장코드';
      GridTableViewCode.Width    := 100;
      GridTableViewName1.Caption := '매장명';
      GridTableViewName1.Width   := 310;
      GridTableViewName2.Caption := '대표자';
      GridTableViewName2.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName3.Caption := '사업자번호';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      SQLText    := 'select   CD_STORE, '
                   +'         NM_STORE, '
                   +'         NM_BOSS, '
                   +'         GetBusinessNo(NO_BIZER) '
                   +'from     MS_STORE '
                   +'where    CD_HEAD   = :P0 '
                   +'  and    CD_STORE  <> ''00000000'' '
                   +'  and   (CD_STORE  = :P2 '
                   +'      or NM_STORE like ConCat(''%'',:P2,''%'')) '
                   +'  and    YN_USE = ''Y'' '
                   +'order by CD_STORE';

      if SearchText <> EmptyStr then IsAutoSearch := True;
      if ShowModal = mrOK then
      begin
        ConditionToolBarStoreCodeEdit.Text     := Code;
        ConditionToolBarStoreCodeEdit.TextHint := Code;
        ConditionToolBarStoreNameLabel.Caption := Names[0];
        Result    := Code;
      end;
    finally
      Free;
    end;
end;

end.
