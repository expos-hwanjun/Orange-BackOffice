// 발주 검수/매입 (완료)

unit BuyOrderBuy;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritShow2, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, ImgList, Menus, cxContainer,
  UniProvider, SQLServerUniProvider, DBAccess, Uni, MemDS, cxGridLevel,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGrid, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, AdvToolBar, AdvGlowButton,
  cxCurrencyEdit, ExtCtrls, AdvToolBarStylers, StdCtrls, cxRadioGroup,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, dxPScxGrid6Lnk;

type
  TBuyOrderBuyForm = class(TInheritShow2Form)
    GridDBTableViewOrderDate: TcxGridDBColumn;
    GridDBTableViewOrderNo: TcxGridDBColumn;
    GridDBTableViewCompanyName: TcxGridDBColumn;
    GridDBTableViewBuyDate: TcxGridDBColumn;
    GridDBTableViewBuyNo: TcxGridDBColumn;
    GridDBTableViewBuyAmt: TcxGridDBColumn;
    GridDBTableViewOrderAmt: TcxGridDBColumn;
    GridSubDBTableViewGoodsCode: TcxGridDBColumn;
    GridSubDBTableViewGoodsName: TcxGridDBColumn;
    GridSubDBTableViewGoodsSpec: TcxGridDBColumn;
    GridSubDBTableViewOrderQty: TcxGridDBColumn;
    GridSubDBTableViewOrderPrice: TcxGridDBColumn;
    GridSubDBTableViewNetAmt: TcxGridDBColumn;
    GridSubDBTableViewVatAmt: TcxGridDBColumn;
    GridSubDBTableViewAmt: TcxGridDBColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    function DoSearch:Boolean; override;
  end;

var
  BuyOrderBuyForm: TBuyOrderBuyForm;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TBuyOrderBuyForm.FormCreate(Sender: TObject);
begin
  inherited;

  DefaultDate := ddLastWeek;
  ConditionToolBarComboBox.ItemIndex := 0;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TBuyOrderBuyForm.FormShow(Sender: TObject);
begin
  inherited;

  ButtonToolBarSeparator2.Width := 10;

//  ButtonToolBarSearchButton.Click;
end;
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TBuyOrderBuyForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회
function TBuyOrderBuyForm.DoSearch:Boolean;
begin
  SetQuery('select   dbo.StoD(a.YMD_ORDER) as YMD_ORDER, '
          +'         a.NO_ORDER, '
          +'         b.NM_TRDPL, '
          +'         a.AMT_ORDER, '
          +'         dbo.StoD(SubString(a.NO_BUY_REF,1,8)) as YMD_BUY, '
          +'         SubString(a.NO_BUY_REF,9,4) as NO_BUY, '
          +'         Isnull((select AMT_BUY from SL_BUY_H where CD_STORE = a.CD_STORE and YMD_BUY = Left(a.NO_BUY_REF,8) and NO_BUY = Right(a.NO_BUY_REF,4)),0) as AMT_BUY, '
          +'         a.CD_STORE + a.YMD_ORDER + a.NO_ORDER as LINK '
          +'from     SL_ORDER_H as a inner join '
          +'         MS_TRD     as b on a.CD_STORE = b.CD_STORE and a.CD_TRDPL = b.CD_TRDPL '
          +'where    a.CD_STORE = :P0 '
          +'  and    a.YMD_ORDER between :P1 and :P2 '
          +'  and    ((:P3 = 0 and a.NO_BUY_REF is null) or (:P3 = 1 and a.NO_BUY_REF is not null) or (:P3 = 2)) '
          +'order by a.CD_STORE, a.YMD_ORDER, a.NO_ORDER',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date),
            ConditionToolBarComboBox.ItemIndex]);
  SetQuery('select   a.CD_GOODS, '
          +'         b.NM_GOODS, '
          +'         b.NM_SPEC, '
          +'         a.QTY_ORDER, '
          +'         a.PR_ORDER, '
          +'         a.AMT_DUTY + a.AMT_DUTYFREE as AMT_NET, '
          +'         a.AMT_TAX, '
          +'         a.AMT_ORDER, '
          +'         a.CD_STORE + a.YMD_ORDER + a.NO_ORDER as LINK '
          +'from     SL_ORDER_D as a inner join '
          +'         MS_GOODS   as b on a.CD_STORE = b.CD_STORE and a.CD_GOODS = b.CD_GOODS '
          +'where    a.CD_STORE = :P0 '
          +'  and    a.YMD_ORDER between :P1 and :P2 '
          +'order by a.CD_STORE, a.YMD_ORDER, a.NO_ORDER',
           [StoreCode,
            DtoS(ConditionToolBarFromDateEdit.Date),
            DtoS(ConditionToolBarToDateEdit.Date)],
            1);
  inherited;
  Result := GridDBTableView.DataController.RowCount > 0;
end;

end.
