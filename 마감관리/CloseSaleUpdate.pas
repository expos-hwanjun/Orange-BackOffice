unit CloseSaleUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Inherit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxStyles, AdvToolBar, AdvToolBarStylers, cxClasses, DBAccess,
  Uni, Data.DB, MemDS, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, StrUtils, Vcl.Menus, cxButtons, cxGroupBox,
  cxCheckGroup, cxRadioGroup, cxButtonEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TCloseSaleUpdateForm = class(TInheritForm)
    GridPanel: TGridPanel;
    CalculatePanel: TPanel;
    LastCloseMonthCaptionLabel: TLabel;
    CloseMonthCaptionLabel: TLabel;
    FromDateEdit: TcxDateEdit;
    ToDateEdit: TcxDateEdit;
    UpdateCheckGroup: TcxCheckGroup;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    SaleUpdateButton: TAdvGlowButton;
    procedure SaleUpdateButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  CloseSaleUpdateForm: TCloseSaleUpdateForm;

implementation
uses Common, DBModule, Help;
{$R *.dfm}
procedure TCloseSaleUpdateForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if (Sender = FromDateEdit) and (FromDateEdit.Date > ToDateEdit.Date) then
    ToDateEdit.Date := FromDateEdit.Date
  else if (Sender = ToDateEdit) and (FromDateEdit.Date > ToDateEdit.Date) then
    FromDateEdit.Date := ToDateEdit.Date;

  isChanged := false;
end;

procedure TCloseSaleUpdateForm.FormCreate(Sender: TObject);
begin
  inherited;
  FromDateEdit.Date := now;
  ToDateEdit.Date   := now;
  UpdateCheckGroup.States[0] := cbsChecked;
  UpdateCheckGroup.States[1] := cbsChecked;
end;

procedure TCloseSaleUpdateForm.SaleUpdateButtonClick(Sender: TObject);
begin
  inherited;

  if (AskBox('매출을 갱신하시겠습니까?')) then
  begin
    ShowMsg('매출갱신 중입니다...');
    try
      Screen.Cursor := crHourGlass;

      // 이익율
      if UpdateCheckGroup.States[0] = cbsChecked then
      begin
        ExecQuery('update SL_SALE_D inner join '
                 +'       MS_MENU  g on SL_SALE_D.CD_HEAD = g.CD_HEAD and SL_SALE_D.CD_STORE = g.CD_STORE and SL_SALE_D.CD_MENU = g.CD_MENU left outer join '
                 +'       MS_SPC_D e on SL_SALE_D.CD_HEAD = e.CD_HEAD and SL_SALE_D.CD_STORE = e.CD_STORE and SL_SALE_D.NO_SPC  = e.NO_SPC and SL_SALE_D.CD_MENU = e.CD_MENU '
                 +'   set SL_SALE_D.AMT_BUY = case when Ifnull(SL_SALE_D.NO_SPC,'''') = '''' then case when (g.PR_BUY = 0) and (g.PR_SALE_PROFIT = 100) then 0 '
                 +'                                                                          when (g.PR_BUY = 0) and (g.PR_SALE_PROFIT = 0) then SL_SALE_D.AMT_SALE - SL_SALE_D.DC_TOT '
                 +'                                                                          when (g.PR_BUY = 0) and (g.PR_SALE_PROFIT > 0) then Round((SL_SALE_D.AMT_SALE - SL_SALE_D.DC_TOT) - ((SL_SALE_D.AMT_SALE - SL_SALE_D.DC_TOT) * DivFlt(g.PR_SALE_PROFIT,100)),2) '
                 +'                                                                     else (g.PR_BUY * SL_SALE_D.QTY_SALE) - SL_SALE_D.DC_TOT end '
                 +'                      when Ifnull(SL_SALE_D.NO_SPC,'''') <> '''' then case when e.DC_RATE = 100 then 0 '
                 +'                                                                       when e.DC_RATE = 0 then SL_SALE_D.AMT_SALE - SL_SALE_D.DC_TOT '
                 +'                                                             when e.DC_RATE > 0 then Round((SL_SALE_D.AMT_SALE - SL_SALE_D.DC_TOT) - ((SL_SALE_D.AMT_SALE - SL_SALE_D.DC_TOT) * DivFlt(e.DC_RATE,100)),2) end '
                 +'                 end '
                 +' where SL_SALE_D.CD_HEAD  = :P0 '
                 +'   and SL_SALE_D.CD_STORE = :P1 '
                 +'   and SL_SALE_D.YMD_SALE Between :P2 and :P3;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(FromDateEdit.CurrentDate),
                  DtoS(ToDateEdit.CurrentDate)], false);

        ExecQuery('update SL_SALE_H inner join '
                 +'      (select YMD_SALE, '
                 +'              NO_POS, '
                 +'              NO_RCP, '
                 +'              SUM(AMT_BUY) as AMT_BUY '
                 +'         from SL_SALE_D '
                 +'        where CD_HEAD  =:P0 '
                 +'          and CD_STORE =:P1 '
                 +'          and YMD_SALE Between :P2 and :P3 '
                 +'        group by YMD_SALE, NO_POS, NO_RCP) d on d.YMD_SALE = SL_SALE_H.YMD_SALE '
                 +'                                            and d.NO_POS   = SL_SALE_H.NO_POS '
                 +'                                            and d.NO_RCP   = SL_SALE_H.NO_RCP '
                 +'   set SL_SALE_H.AMT_BUY = d.AMT_BUY '
                 +' where SL_SALE_H.CD_HEAD  =:P0 '
                 +'   and SL_SALE_H.CD_STORE =:P1;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(FromDateEdit.CurrentDate),
                  DtoS(ToDateEdit.CurrentDate)], false);


        ExecQuery('update SL_SALE_H_SUM inner join '
                 +'      (select YMD_SALE, '
                 +' 				      Sum(AMT_SALE)     as AMT_SALE, '
                 +' 				      Sum(AMT_BUY)      as AMT_BUY, '
                 +' 				      Sum(AMT_CASH)     as AMT_CASH, '
                 +' 				      Sum(AMT_CHECK)    as AMT_CHECK, '
                 +' 				      Sum(AMT_CASHRCP)  as AMT_CASHRCP, '
                 +' 				      Sum(AMT_CARD)     as AMT_CARD, '
                 +' 				      Sum(AMT_TRUST)    as AMT_TRUST, '
                 +' 				      Sum(AMT_GIFT)     as AMT_GIFT, '
                 +' 				      Sum(AMT_BANK)     as AMT_BANK, '
                 +' 				      Sum(AMT_ETC)      as AMT_ETC, '
                 +' 				      Sum(AMT_POINT)    as AMT_POINT, '
                 +' 				      Sum(DC_TOT)       as DC_TOT, '
                 +' 				      Sum(AMT_DUTY)     as AMT_DUTY, '
                 +' 				      Sum(AMT_DUTYFREE) as AMT_DUTYFREE, '
                 +' 				      Sum(AMT_TAX)      as AMT_TAX, '
                 +' 				      SUM(AMT_SERVICE)  as AMT_SERVICE, '
                 +' 				      Sum(AMT_CASHTIP+AMT_CARDTIP) as AMT_TIP, '
                 +' 				      SUM(CNT_PERSON)   as CNT_PERSON, '
                 +' 				      Sum(case when IfNull(NO_DELIVERY,'''') = '''' then 0 else 1        end) as CNT_DELIVERY, '
                 +' 				      Sum(case when IfNull(NO_DELIVERY,'''') = '''' then 0 else AMT_SALE end) as AMT_DELIVERY '
                 +'         from  '+GetPartitionTable('SL_SALE_H', FromDateEdit.CurrentDate,ToDateEdit.CurrentDate, '')
                 +'        where DS_SALE <> ''V'' '
                 +'          and CD_HEAD  =:P0 '
                 +'          and CD_STORE =:P1 '
                 +'          and YMD_SALE Between :P2 and :P3 '
                 +'        group by YMD_SALE) as h on SL_SALE_H_SUM.YMD_SALE = h.YMD_SALE '
                 +'   set SL_SALE_H_SUM.AMT_SALE     = h.AMT_SALE, '
                 +'  	   SL_SALE_H_SUM.AMT_BUY      = h.AMT_BUY, '
                 +'  	   SL_SALE_H_SUM.AMT_CASH     = h.AMT_CASH, '
                 +'  	   SL_SALE_H_SUM.AMT_CHECK    = h.AMT_CHECK, '
                 +'  	   SL_SALE_H_SUM.AMT_CASHRCP  = h.AMT_CASHRCP, '
                 +'  	   SL_SALE_H_SUM.AMT_CARD     = h.AMT_CARD, '
                 +'  	   SL_SALE_H_SUM.AMT_TRUST    = h.AMT_TRUST, '
                 +'  	   SL_SALE_H_SUM.AMT_GIFT     = h.AMT_GIFT, '
                 +'  	   SL_SALE_H_SUM.AMT_BANK     = h.AMT_BANK, '
                 +'  	   SL_SALE_H_SUM.AMT_ETC      = h.AMT_ETC, '
                 +'  	   SL_SALE_H_SUM.AMT_POINT    = h.AMT_POINT, '
                 +'  	   SL_SALE_H_SUM.DC_TOT       = h.DC_TOT, '
                 +'  	   SL_SALE_H_SUM.AMT_DUTY     = h.AMT_DUTY, '
                 +'  	   SL_SALE_H_SUM.AMT_DUTYFREE = h.AMT_DUTYFREE, '
                 +'  	   SL_SALE_H_SUM.AMT_TAX      = h.AMT_TAX, '
                 +'  	   SL_SALE_H_SUM.AMT_SERVICE  = h.AMT_SERVICE, '
                 +'  	   SL_SALE_H_SUM.AMT_TIP      = h.AMT_TIP, '
                 +'  	   SL_SALE_H_SUM.CNT_DELIVERY = h.CNT_DELIVERY, '
                 +'  	   SL_SALE_H_SUM.AMT_DELIVERY = h.AMT_DELIVERY, '
                 +'  	   SL_SALE_H_SUM.CNT_CUSTOMER = h.CNT_PERSON '
                 +' where SL_SALE_H_SUM.CD_HEAD  =:P0 '
                 +'   and SL_SALE_H_SUM.CD_STORE =:P1;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(FromDateEdit.CurrentDate),
                  DtoS(ToDateEdit.CurrentDate)],false);

        ExecQuery('update SL_SALE_D_SUM inner join '
                 +'      (select YMD_SALE, '
                 +'              CD_MENU, '
                 +'				       Sum(QTY_SALE) as QTY_SALE, '
                 +'				       Sum(AMT_SALE) as AMT_SALE, '
                 +'				       Sum(AMT_BUY)  as AMT_BUY, '
                 +'				       Sum(DC_TOT)   as DC_TOT, '
                 +'				       Sum(AMT_VAT)  as AMT_VAT, '
                 +'				       Sum(case when IfNull(NO_SPC,'''') = '''' then 0 else AMT_SALE end) as AMT_EVENT, '
                 +'              Sum(case when DS_MENU_TYPE = ''W'' then PR_SERVICE else PR_SERVICE * QTY_SALE end ) as AMT_SERVICE, '
                 +'              Sum(PR_TIP * QTY_SALE) as AMT_TIP '
                 +'        from '+GetPartitionTable('SL_SALE_D', FromDateEdit.CurrentDate, ToDateEdit.CurrentDate, '')
                 +'       where  DS_SALE <> ''V'' '
                 +'         and  CD_HEAD  =:P0 '
                 +'         and  CD_STORE =:P1 '
                 +'         and  YMD_SALE Between :P2 and :P3 '
                 +'       group by YMD_SALE, CD_MENU) as h on SL_SALE_D_SUM.YMD_SALE = h.YMD_SALE and SL_SALE_D_SUM.CD_MENU = h.CD_MENU '
                 +'   set SL_SALE_D_SUM.QTY_SALE    = h.QTY_SALE, '
                 +'		    SL_SALE_D_SUM.AMT_SALE    = h.AMT_SALE, '
                 +'		    SL_SALE_D_SUM.AMT_BUY     = h.AMT_BUY, '
                 +'		    SL_SALE_D_SUM.DC_TOT      = h.DC_TOT, '
                 +'		    SL_SALE_D_SUM.AMT_VAT     = h.AMT_VAT, '
                 +'		    SL_SALE_D_SUM.AMT_EVENT   = h.AMT_EVENT, '
                 +'       SL_SALE_D_SUM.AMT_SERVICE = h.AMT_SERVICE, '
                 +'       SL_SALE_D_SUM.AMT_TIP     = h.AMT_TIP '
                 +' where SL_SALE_D_SUM.CD_HEAD  =:P0 '
                 +'   and SL_SALE_D_SUM.CD_STORE =:P1;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(FromDateEdit.CurrentDate),
                  DtoS(ToDateEdit.CurrentDate)],false);

        ExecQuery('update SL_SALE_H_SUM inner join '
                 +'       (select YMD_SALE, '
                 +'		 		        Sum(AMT_EVENT) as AMT_EVENT '
                 +'          from SL_SALE_D_SUM '
                 +'         where CD_HEAD  =:P0 '
                 +'           and CD_STORE =:P1 '
                 +'           and YMD_SALE Between :P2 and :P3 '
                 +'         group by YMD_SALE '
                 +'        ) as h on SL_SALE_H_SUM.YMD_SALE = h.YMD_SALE '
                 +'   set SL_SALE_H_SUM.AMT_EVENT = h.AMT_EVENT '
                 +' where SL_SALE_H_SUM.CD_HEAD  =:P0 '
                 +'   and SL_SALE_H_SUM.CD_STORE =:P1;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(FromDateEdit.CurrentDate),
                  DtoS(ToDateEdit.CurrentDate)],false);
      end;

      //시간대별 매출
      if UpdateCheckGroup.States[1] = cbsChecked then
        ExecQuery('update SL_SALE_H '
                 +'   set CD_TIME = GetBetweenTime(CD_HEAD, CD_STORE, DT_SALE) '
                 +' where CD_HEAD  =:P0 '
                 +'   and CD_STORE =:P1 '
                 +'   and YMD_SALE Between :P2 and :P3;',
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(FromDateEdit.CurrentDate),
                  DtoS(ToDateEdit.CurrentDate)], true);

      Screen.Cursor := crDefault;
      MsgBox('매출 갱신이 끝났습니다.');
    except
        on E: Exception do
        begin
          ErrBox(E.Message);
        end;
    end;
    Screen.Cursor := crDefault;
  end;
  isChanged := false;
end;

end.
