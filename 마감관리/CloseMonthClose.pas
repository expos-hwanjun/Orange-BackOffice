// 월 마감 (New완료)

unit CloseMonthClose;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, DateUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxLabel, cxControls, cxMaskEdit, cxCalendar, AdvGlowButton,
  AdvToolBar, cxSpinEdit, StdCtrls, ExtCtrls, AdvToolBarStylers, cxStyles,
  cxLookAndFeels, cxLookAndFeelPainters, StrUtils, DBAccess, cxClasses,
  Vcl.Menus, cxCheckBox, cxButtons, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TCloseMonthCloseForm = class(TInheritEditForm)
    GridPanel: TGridPanel;
    ClosePanel: TPanel;
    StockGroupBox: TcxGroupBox;
    LastCloseMonthCaptionLabel: TLabel;
    StockLastCloseMonthLabel: TLabel;
    CloseMonthCaptionLabel: TLabel;
    StockCloseMonthComboBox: TcxComboBox;
    MisuGroupBox: TcxGroupBox;
    Label1: TLabel;
    MisuLastCloseMonthLabel: TLabel;
    MisuCloseMonthCaptionLabel: TLabel;
    MisuCloseMonthComboBox: TcxComboBox;
    CommentLabel: TLabel;
    Label2: TLabel;
    StockCloseButton: TAdvGlowButton;
    StockCloseCancelButton: TAdvGlowButton;
    MisuCloseButton: TAdvGlowButton;
    MisuCloseCancelButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MisuCloseButtonClick(Sender: TObject);
    procedure MisuCloseCancelButtonClick(Sender: TObject);
    procedure MisuCloseMonthComboBoxPropertiesChange(Sender: TObject);
    procedure StockCloseButtonClick(Sender: TObject);
    procedure StockCloseCancelButtonClick(Sender: TObject);
    procedure StockCloseMonthComboBoxPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure ReadCloseData(aWork:String);  //aWork:S-재고, M-미수
    procedure MisuClose;
    function  StockClose:Boolean;
    function  CheckStockClose(aMonth:String):Boolean;
  end;

var
  CloseMonthCloseForm: TCloseMonthCloseForm;

implementation

uses
  Common, DBModule;

{$R *.dfm}
//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TCloseMonthCloseForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  isChanged := false;
  inherited;
end;

procedure TCloseMonthCloseForm.FormCreate(Sender: TObject);
begin
  inherited;
  ReadCloseData('S');
  ReadCloseData('M');
end;

procedure TCloseMonthCloseForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 마감년월 콤보박스를 고칠 때


procedure TCloseMonthCloseForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 마감 정보 읽기
procedure TCloseMonthCloseForm.ReadCloseData(aWork:String);
const
  msgYear  = '년 ';
  msgMonth = '월';
var
  vDate: string;
  vLastYear, vLastMonth, vThisYear, vThisMonth, vDay: Word;
  vYearIndex, vMonthIndex: Integer;
begin
  if aWork = 'S' then
  begin
    StockLastCloseMonthLabel.Caption := EmptyStr;
    StockCloseMonthComboBox.Properties.Items.Clear;
  end
  else
  begin
    MisuLastCloseMonthLabel.Caption := EmptyStr;
    MisuCloseMonthComboBox.Properties.Items.Clear;

    if StockLastCloseMonthLabel.Caption = EmptyStr then
    begin
      MisuGroupBox.Enabled := false;
      Exit;
    end;
  end;

  vDate := '';
  // 최종 마감월을 불러온다
  OpenQuery('select Max(YM_CLOSE) as YM_CLOSE '
           +'  from SL_CLOSE_MONTH '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and DS_CLOSE = :P2 ',
            [HeadStoreCode,
             StoreCode,
             aWork]);
  try
    if not Query.Eof then
      vDate := Query.Fields[0].AsString
    else
      vDate := '';

    if Length(vDate) = 6 then
    begin
      try
        // 최종마감월을 표시한다
        vLastYear  := StoI(Copy(vDate, 1, 4));
        vLastMonth := StoI(Copy(vDate, 5, 2));

        if aWork = 'S' then
        begin
          StockLastCloseMonthLabel.Caption := IntToStr(vLastYear)+msgYear+FormatFloat('00', vLastMonth)+msgMonth;

          // 마감월 콤보박스를 생성한다(최종마감월 다음 달부터 이번 달까지)
          DecodeDate(Date, vThisYear, vThisMonth, vDay);
          for vYearIndex := vLastYear to vThisYear do
            if (vYearIndex = vLastYear) and (vYearIndex = vThisYear) then
              for vMonthIndex := vLastMonth to vThisMonth do
                StockCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
            else if vYearIndex = vLastYear then
              for vMonthIndex := vLastMonth to 12 do
                StockCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
            else if vYearIndex = vThisYear then
              for vMonthIndex := 1 to vThisMonth do
                StockCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
            else
              for vMonthIndex := 1 to 12 do
                StockCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth);

          if StockCloseMonthComboBox.Properties.Items.Count > 1 then
            StockCloseMonthComboBox.ItemIndex := 1
          else if StockCloseMonthComboBox.Properties.Items.Count > 0 then
            StockCloseMonthComboBox.ItemIndex := 0;
        end
        else
        begin
          MisuLastCloseMonthLabel.Caption := IntToStr(vLastYear)+msgYear+FormatFloat('00', vLastMonth)+msgMonth;

          // 마감월 콤보박스를 생성한다(최종마감월 다음 달부터 이번 달까지)
          DecodeDate(Date, vThisYear, vThisMonth, vDay);
          for vYearIndex := vLastYear to vThisYear do
            if (vYearIndex = vLastYear) and (vYearIndex = vThisYear) then
              for vMonthIndex := vLastMonth to vThisMonth do
                MisuCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
            else if vYearIndex = vLastYear then
              for vMonthIndex := vLastMonth to 12 do
                MisuCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
            else if vYearIndex = vThisYear then
              for vMonthIndex := 1 to vThisMonth do
                MisuCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
            else
              for vMonthIndex := 1 to 12 do
                MisuCloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth);

          if MisuCloseMonthComboBox.Properties.Items.Count > 1 then
            MisuCloseMonthComboBox.ItemIndex := 1
          else if MisuCloseMonthComboBox.Properties.Items.Count > 0 then
            MisuCloseMonthComboBox.ItemIndex := 0;
        end;
      except
      end;
    end;
  finally
    FinishQuery;
  end;

  // 최종마감월이 없을 때(처음 마감하는 것일 때)는 최초 매입/판매월 마감을 한다
  if aWork = 'S' then
  begin
    if StockLastCloseMonthLabel.Caption = EmptyStr then
    begin
      OpenQuery('select YMD_SALE '
               +' from( '
               +'      select   Min(YMD_SALE) as YMD_SALE '
               +'        from   SL_SALE_H_SUM '
               +'       where   CD_HEAD  = :P0 '
               +'         and   CD_STORE = :P1 '
               +'      union all '
               +'      select   Min(YMD_BUY) '
               +'        from   SL_BUY_H '
               +'       where   CD_HEAD  = :P0 '
               +'         and   CD_STORE = :P1 '
               +'     ) a '
               +' limit 1 ',
                [HeadStoreCode,
                 StoreCode]);
      try
        if not Query.eof then
          vDate := Query.Fields[0].AsString;
        // 최초 매입/판매월이 없으면 이번 달
        if Length(vDate) <> 8 then
          vDate := FormatDateTime(fmtDateShort, Date);
        StockCloseMonthComboBox.Properties.Items.Add(Copy(vDate, 1, 4)+msgYear+Copy(vDate, 5, 2)+msgMonth);
        StockCloseMonthComboBox.ItemIndex := 0;
      finally
        FinishQuery;
      end;
    end;
    //최초 미수마감은 기초재고가 생성이 된 이후에 할 수 있게한다
    if MisuGroupBox.Enabled = false then
      ReadCloseData('M');
    MisuGroupBox.Enabled := StockCloseMonthComboBox.Properties.Items.Count > 0;
  end
  else
  //미수마감을 처음하는거면 재고마감 정보를 가져온다
  begin
    if MisuLastCloseMonthLabel.Caption = EmptyStr then
    begin
      // 최종 마감월을 불러온다
      try
        OpenQuery('select   Min(YM_CLOSE) as YM_CLOSE '
                 +'from     SL_CLOSE_MONTH '
                 +'where    CD_HEAD  = :P0 '
                 +'  and    CD_STORE = :P1 '
                 +'  and    DS_CLOSE = ''S'' ',
                  [HeadStoreCode,
                   StoreCode]);
        if not Query.Eof then
          vDate := Query.Fields[0].AsString
        else
          vDate := '';
        MisuCloseMonthComboBox.Properties.Items.Add(Copy(vDate, 1, 4)+msgYear+Copy(vDate, 5, 2)+msgMonth);
        MisuCloseMonthComboBox.ItemIndex := 0;
      finally
        FinishQuery;
      end;
    end;
  end;
end;


procedure TCloseMonthCloseForm.MisuClose;
var vMonth, vNextMonth:String;
begin
  if MisuCloseMonthComboBox.ItemIndex < 0 then
    Exit;

  // 이번 달과 다음 달을 구한다
  vMonth := GetOnlyNumber(MisuCloseMonthComboBox.Text);
  if Length(vMonth) <> 6 then
    Exit;
  if Copy(vMonth, 5, 2) = '12' then
    vNextMonth := IntToStr(StoI(Copy(vMonth, 1, 4))+1) + '01'
  else
    vNextMonth := Copy(vMonth, 1, 4) + FormatFloat('00', StoI(Copy(vMonth, 5, 2))+1);

  if not AskBox(Format('%s년%s월', [LeftStr(vMonth,4), RightStr(vMonth,2)])+' 미수마감을 하시겠습니까?') then Exit;

  if  DM.ExecProcedure(Format('CALL MONTH_CLOSE(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ?) ',
                             [HeadStoreCode,
                              StoreCode,
                              vMonth,
                              vNextMonth,
                              UserCode]),RestDBURL) then
    ReadCloseData('M');
  Exit;

//  try
//    ShowMsg('월 마감 중입니다. 잠시 기다리십시오.', false, -1);
//    Screen.Cursor := crHourGlass;
//        // 기존 거래처, 회원 마감이 있으면 취소한다
//    ExecQuery('update SL_BOOKS_MONTH '
//             +'   set AMT_CLOSE = 0 '
//             +' where CD_HEAD  = :P0 '
//             +'   and CD_STORE = :P1 '
//             +'   and YM_CLOSE = :P2;',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth],
//               false);
//
//    // 거래처 마감(외상 미지급금 합계 구하기)
//    // 마감 테이블에 이번 달에 없는 거래처를 무조건 넣어준다
//    ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
//             +'select   CD_HEAD, '
//             +'         CD_STORE, '
//             +'         :P2 as YM_CLOSE, '
//             +'         :P3 as CD_CLOSE, '
//             +'         CD_TRDPL '
//             +'  from   MS_TRD '
//             +' where   CD_HEAD   = :P0 '
//             +'   and   CD_STORE  = :P1 '
//             +'   and   DS_TRDPL  = ''B'' '
//             +'   and   CD_TRDPL not in (select CD_CODE '
//             +'                            from SL_BOOKS_MONTH '
//             +'                           where CD_HEAD  = :P0 '
//             +'                             and CD_STORE = :P1 '
//             +'                             and YM_CLOSE = :P2 '
//             +'                             and CD_CLOSE = :P3);',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth,
//               varBuyClose],
//               false);
//    // 매입처, 임대매장 미지급 합계를 넣어준다
//    ExecQuery('update   SL_BOOKS_MONTH inner join '
//             +'        (select   t.CD_TRDPL, '
//             +'                  Ifnull(c.AMT_BASE, 0) + Ifnull(b.AMT_TRUST, 0) - Ifnull(a.AMT_OUT, 0) as AMT_CLOSE '
//             +'         from     MS_TRD as t left outer join '
//             +'                 (select   CD_CODE as CD_TRDPL, '
//             +'                           Sum(AMT_BASE) as AMT_BASE '
//             +'                  from     SL_BOOKS_MONTH '
//             +'                  where    CD_HEAD  =:P0 '
//             +'                    and    CD_STORE =:P1 '
//             +'                    and    CD_CLOSE =:P4 '
//             +'                    and    YM_CLOSE =:P2 '
//             +'                  group by CD_CODE ) c on t.CD_TRDPL = c.CD_TRDPL left outer join '
//             +'                 (select   CD_TRDPL, '
//             +'                           Sum(AMT_TRUST) as AMT_TRUST '
//             +'                  from     SL_BUY_H '
//             +'                  where    CD_HEAD  =:P0 '
//             +'                    and    CD_STORE =:P1 '
//             +'                    and    YMD_BUY  Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//             +'                  group by CD_TRDPL) as b on t.CD_TRDPL = b.CD_TRDPL left outer join '
//             +'                 (select   CD_TRDPL, '
//             +'                           Sum(AMT_OUT + AMT_DC) as AMT_OUT '
//             +'                  from     SL_ACCT '
//             +'                  where    CD_HEAD  =:P0 '
//             +'                    and    CD_STORE =:P1 '
//             +'                    and    YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//             +'                    and    CD_TRDPL is not null '
//             +'                    and    CD_ACCT = '''+CreditOut+''''
//             +'                  group by CD_TRDPL) as a on t.CD_TRDPL = a.CD_TRDPL '
//             +'         where    t.CD_HEAD  = :P0 '
//             +'           and    t.CD_STORE = :P1 '
//             +'           and    t.DS_TRDPL  = ''B'' ) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_TRDPL '
//             +'   set   SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
//             +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
//             +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
//             +' where   SL_BOOKS_MONTH.CD_HEAD  = :P0 '
//             +'   and   SL_BOOKS_MONTH.CD_STORE = :P1 '
//             +'   and   SL_BOOKS_MONTH.YM_CLOSE = :P2 '
//             +'   and   SL_BOOKS_MONTH.CD_CLOSE = :P4;',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth,
//               UserCode,
//               varBuyClose],
//               false);
//
//    // 회원 마감(외상 미수금 합계 구하기)을 한다
//    // 마감 테이블에 이번 달에 없는 회원을 무조건 넣어준다
//    ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
//             +'select   CD_HEAD, '
//             +'         :P1 as CD_STORE, '
//             +'         :P2 as YM_CLOSE, '
//             +'         :P3 as CD_CLOSE, '
//             +'         CD_MEMBER '
//             +'  from   MS_MEMBER '
//             +' where   CD_HEAD   =:P0 '
//             +'   and   CD_STORE  =:P4 '
//             +'   and   CD_MEMBER not in (select  CD_CODE '
//             +'                             from  SL_BOOKS_MONTH '
//             +'                            where  CD_HEAD   =:P0 '
//             +'                              and  CD_STORE = :P1 '
//             +'                              and  YM_CLOSE = :P2 '
//             +'                              and  CD_CLOSE = :P3);',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth,
//               varMemberTrustClose,
//               Ifthen(GetHeadConfig(5)='0',StoreCode,StandardStore)],
//               false);
//
//    // 회원 미수 합계를 넣어준다
//    ExecQuery('update   SL_BOOKS_MONTH inner join '
//             +'        (select   m.CD_STORE, '
//             +'                  m.CD_MEMBER, '
//             +'                  Ifnull(c.AMT_BASE, 0) + Ifnull(s.AMT_TRUST, 0) - Ifnull(a.AMT_PAYIN, 0) as AMT_CLOSE '
//             +'         from     MS_MEMBER as m left outer join '
//             +'                 (select   CD_CODE as CD_MEMBER, '
//             +'                           Sum(AMT_BASE) as AMT_BASE '
//             +'                  from     SL_BOOKS_MONTH '
//             +'                  where    CD_HEAD  =:P0 '
//             +'                    and    CD_STORE =:P1 '
//             +'                    and    CD_CLOSE =:P4 '
//             +'                    and    YM_CLOSE =:P2 '
//             +'                  group by CD_CODE ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
//             +'                 (select   CD_MEMBER, '
//             +'                           Sum(AMT_TRUST) as AMT_TRUST '
//             +'                  from     SL_SALE_H '
//             +'                  where    CD_HEAD =:P0 '
//             +'                    and    CD_STORE =:P1 '
//             +'                    and    DS_SALE  <> ''V'' '
//             +'                    and    YMD_SALE Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//             +'                    and    CD_MEMBER <> '''' '
//             +'                  group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER left outer join '
//             +'                 (select   CD_MEMBER, '
//             +'                           Sum(AMT_PAYIN + AMT_DC) as AMT_PAYIN '
//             +'                  from     SL_ACCT '
//             +'                  where    CD_HEAD =:P0 '
//             +'                    and    CD_STORE =:P1 '
//             +'                    and    YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//             +'                    and    CD_MEMBER is not null '
//             +'                    and    CD_ACCT = '''+CreditIn+''''
//             +'                  group by CD_MEMBER) as a on m.CD_MEMBER = a.CD_MEMBER '
//             +'         where    m.CD_HEAD  =:P0 '
//             +'           and    m.CD_STORE =:P5) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_MEMBER '
//             +'set      SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
//             +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
//             +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
//             +'where    SL_BOOKS_MONTH.CD_HEAD  = :P0 '
//             +'  and    SL_BOOKS_MONTH.CD_STORE = :P1 '
//             +'  and    SL_BOOKS_MONTH.YM_CLOSE = :P2 '
//             +'  and    SL_BOOKS_MONTH.CD_CLOSE = :P4;',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth,
//               UserCode,
//               varMemberTrustClose,
//               Ifthen(GetHeadConfig(5)='0',StoreCode,StandardStore)],
//               false);
//
//    // 회원 포인트 마감
//    if GetHeadConfig(5) = '0' then
//    begin
//      ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
//               +'select   CD_HEAD, '
//               +'         CD_STORE, '
//               +'         :P2 as YM_CLOSE, '
//               +'         :P3 as CD_CLOSE, '
//               +'         CD_MEMBER '
//               +'  from   MS_MEMBER '
//               +' where   CD_HEAD   =:P0 '
//               +'   and   CD_STORE  =:P1 '
//               +'   and   CD_MEMBER not in (select  CD_CODE '
//               +'                             from  SL_BOOKS_MONTH '
//               +'                            where  CD_HEAD   =:P0 '
//               +'                              and  CD_STORE = :P1 '
//               +'                              and  YM_CLOSE = :P2 '
//               +'                              and  CD_CLOSE = :P3 );',
//                [HeadStoreCode,
//                 StoreCode,
//                 vMonth,
//                 varPointClose],
//                 false);
//
//      // 회원 포인트 합계를 넣어준다
//      ExecQuery('update   SL_BOOKS_MONTH inner join '
//               +'        (select   m.CD_STORE, '
//               +'                  m.CD_MEMBER, '
//               +'                  Ifnull(c.AMT_BASE, 0) + Ifnull(s.POINT_ADD, 0) - Ifnull(s.POINT_USE, 0) as AMT_CLOSE, '
//               +'                  Ifnull(c.AMT_BASE2, 0) + Ifnull(s.POINT_ADD, 0) as AMT_CLOSE2, '
//               +'                  Ifnull(c.AMT_BASE3, 0) + Ifnull(s.POINT_USE, 0) as AMT_CLOSE3 '
//               +'         from     MS_MEMBER as m left outer join '
//               +'                 (select   CD_CODE as CD_MEMBER, '
//               +'                           AMT_BASE, '
//               +'                           AMT_BASE2, '
//               +'                           AMT_BASE3 '
//               +'                  from     SL_BOOKS_MONTH '
//               +'                  where    CD_HEAD  = :P0 '
//               +'                    and    CD_STORE = :P1 '
//               +'                    and    CD_CLOSE = :P4 '
//               +'                    and    YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
//               +'                 (select   CD_MEMBER, '
//               +'                           Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as POINT_ADD, '
//               +'                           Sum(PNT_USE) as POINT_USE '
//               +'                  from     SL_POINT '
//               +'                  where    CD_HEAD =:P0 '
//               +'                    and    CD_STORE =:P1 '
//               +'                    and    YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//               +'                  group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
//               +'         where    m.CD_HEAD  =:P0 '
//               +'           and    m.CD_STORE =:P1) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_MEMBER '
//               +'set      SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
//               +'         SL_BOOKS_MONTH.AMT_CLOSE2   = Ifnull(x.AMT_CLOSE2,0), '
//               +'         SL_BOOKS_MONTH.AMT_CLOSE3   = Ifnull(x.AMT_CLOSE3,0), '
//               +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
//               +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
//               +'where    SL_BOOKS_MONTH.CD_HEAD  = :P0 '
//               +'  and    SL_BOOKS_MONTH.CD_STORE = :P1 '
//               +'  and    SL_BOOKS_MONTH.YM_CLOSE = :P2 '
//               +'  and    SL_BOOKS_MONTH.CD_CLOSE = :P4;',
//                [HeadStoreCode,
//                 StoreCode,
//                 vMonth,
//                 UserCode,
//                 varPointClose],
//                 false);
//
//      // 회원 스템프 마감
//      ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
//               +'select   CD_HEAD, '
//               +'         CD_STORE, '
//               +'         :P2 as YM_CLOSE, '
//               +'         :P3 as CD_CLOSE, '
//               +'         CD_MEMBER '
//               +'  from   MS_MEMBER '
//               +' where   CD_HEAD   =:P0 '
//               +'   and   CD_STORE  =:P1 '
//               +'   and   CD_MEMBER not in (select  CD_CODE '
//               +'                             from  SL_BOOKS_MONTH '
//               +'                            where  CD_HEAD   =:P0 '
//               +'                              and  CD_STORE = :P1 '
//               +'                              and  YM_CLOSE = :P2 '
//               +'                              and  CD_CLOSE = :P3);',
//                [HeadStoreCode,
//                 StoreCode,
//                 vMonth,
//                 varStampClose],
//                 false);
//
//      // 회원 스템프 합계를 넣어준다
//      ExecQuery('update  SL_BOOKS_MONTH inner join '
//               +'        (select   m.CD_STORE, '
//               +'                  m.CD_MEMBER, '
//               +'                  Ifnull(c.AMT_BASE, 0)  + Ifnull(s.STAMP_ADD, 0) - Ifnull(s.STAMP_USE, 0) as AMT_CLOSE, '
//               +'                  Ifnull(c.AMT_BASE2, 0) + Ifnull(s.STAMP_ADD, 0) as AMT_CLOSE2, '
//               +'                  Ifnull(c.AMT_BASE3, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE3 '
//               +'         from     MS_MEMBER as m left outer join '
//               +'                 (select   CD_CODE as CD_MEMBER, '
//               +'                           AMT_BASE, '
//               +'                           AMT_BASE2, '
//               +'                           AMT_BASE3 '
//               +'                    from   SL_BOOKS_MONTH '
//               +'                   where   CD_HEAD  = :P0 '
//               +'                     and   CD_STORE = :P1 '
//               +'                     and   CD_CLOSE = :P4'
//               +'                     and   YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
//               +'                 (select   CD_MEMBER, '
//               +'                           Sum(STAMP_ADD) as STAMP_ADD, '
//               +'                           Sum(STAMP_USE) as STAMP_USE '
//               +'                    from   SL_POINT '
//               +'                   where   CD_HEAD  =:P0 '
//               +'                     and   CD_STORE =:P1 '
//               +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//               +'                   group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
//               +'         where    m.CD_HEAD  =:P0 '
//               +'           and    m.CD_STORE =:P1) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_MEMBER '
//               +'  set    SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
//               +'         SL_BOOKS_MONTH.AMT_CLOSE2   = Ifnull(x.AMT_CLOSE2,0), '
//               +'         SL_BOOKS_MONTH.AMT_CLOSE3   = Ifnull(x.AMT_CLOSE3,0), '
//               +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
//               +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
//               +'where    SL_BOOKS_MONTH.CD_HEAD  = :P0 '
//               +'  and    SL_BOOKS_MONTH.CD_STORE = :P1 '
//               +'  and    SL_BOOKS_MONTH.YM_CLOSE = :P2 '
//               +'  and    SL_BOOKS_MONTH.CD_CLOSE = :P4;',
//                [HeadStoreCode,
//                 StoreCode,
//                 vMonth,
//                 UserCode,
//                 varStampClose],
//                 false);
//    end;
//
//    // 자료가 없는 것들은 지운다
//{    ExecQuery('delete from SL_BOOKS_MONTH '
//             +'where  CD_HEAD   = :P0 '
//             +'  and  CD_STORE  = :P1 '
//             +'  and  YM_CLOSE  = :P2 '
//             +'  and  AMT_BASE  = 0 '
//             +'  and  AMT_CLOSE = 0;',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth],
//               false);
//}
//    // 다음달에 기초자료를 지운다
//    ExecQuery('delete from SL_BOOKS_MONTH '
//             +'where  CD_HEAD   = :P0 '
//             +'  and  CD_STORE  = :P1 '
//             +'  and  YM_CLOSE  = :P2;',
//              [HeadStoreCode,
//               StoreCode,
//               vNextMonth],
//               false);
//
//    // 다음 달 기초 자료를 만든다
//    ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE, AMT_BASE, AMT_BASE2, AMT_BASE3, AMT_CLOSE, AMT_CLOSE2, AMT_CLOSE3, CD_SAWON_CHG, DT_CHANGE) '
//             +'select   CD_HEAD, '
//             +'         CD_STORE, '
//             +'         :P3 as YM_CLOSE, '
//             +'         CD_CLOSE, '
//             +'         CD_CODE, '
//             +'         AMT_CLOSE, '
//             +'         AMT_CLOSE2, '
//             +'         AMT_CLOSE3, '
//             +'         0, '
//             +'         0, '
//             +'         0, '
//             +'         :P4 as CD_SAWON_CHG, '
//             +'         Now() '
//             +'  from   SL_BOOKS_MONTH '
//             +'  where  CD_HEAD   = :P0 '
//             +'    and  CD_STORE  = :P1 '
//             +'    and  YM_CLOSE  = :P2;',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth,
//               vNextMonth,
//               UserCode],
//               false);
//
//    //최근 월마감이면 회원정보(MS_MEMBER_ETC -> AMT_TRUST, 에 반영한다)     외상은 매장별로 관리한다
//    if FormatDateTime('yyyymm',Now()) >= vNextMonth then
//    begin
//      ExecQuery('update MS_MEMBER_ETC inner join '
//               +'       (select   m.CD_STORE, '
//               +'                 m.CD_MEMBER, '
//               +'                 Ifnull(c.AMT_BASE, 0) + Ifnull(s.AMT_TRUST, 0) - Ifnull(a.AMT_PAYIN, 0) as AMT_CLOSE '
//               +'        from     MS_MEMBER as m left outer join '
//               +'                (select   CD_CODE as CD_MEMBER, '
//               +'                          AMT_BASE '
//               +'                 from     SL_BOOKS_MONTH '
//               +'                 where    CD_HEAD  = :P0 '
//               +'                   and    CD_STORE = :P1 '
//               +'                   and    CD_CLOSE = :P3 '
//               +'                   and    YM_CLOSE = :P2 ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
//               +'                (select   CD_MEMBER, '
//               +'                          Sum(AMT_TRUST) as AMT_TRUST '
//               +'                 from     SL_SALE_H '
//               +'                 where    CD_HEAD  =:P0 '
//               +'                   and    CD_STORE =:P1 '
//               +'                   and    DS_SALE  <> ''V'' '
//               +'                   and    YMD_SALE Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//               +'                   and    CD_MEMBER <> '''' '
//               +'                 group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER left outer join '
//               +'                (select   CD_MEMBER, '
//               +'                          Sum(AMT_PAYIN + AMT_DC) as AMT_PAYIN '
//               +'                 from     SL_ACCT '
//               +'                 where    CD_HEAD  =:P0 '
//               +'                   and    CD_STORE =:P1 '
//               +'                   and    YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//               +'                   and    CD_MEMBER is not null '
//               +'                   and    CD_ACCT = '''+CreditIn+''''
//               +'                 group by CD_MEMBER) as a on m.CD_MEMBER = a.CD_MEMBER '
//               +'        where    m.CD_HEAD  =:P0 '
//               +'          and    m.CD_STORE =:P4) as x on MS_MEMBER_ETC.CD_MEMBER = x.CD_MEMBER '
//               +'set     MS_MEMBER_ETC.AMT_TRUST    = Ifnull(x.AMT_CLOSE,0) '
//               +'where   MS_MEMBER_ETC.CD_HEAD  = :P0 '
//               +'  and   MS_MEMBER_ETC.CD_STORE = :P1;',
//              [HeadStoreCode,
//               StoreCode,
//               vNextMonth,
//               varMemberTrustClose,
//               Ifthen(GetHeadConfig(5)='0',StoreCode,StandardStore)],
//               false);
//
//      //통합회원을 사용안할때 통합회원을 사용하면 통합회원 월마감에서 처리한다
//      if GetHeadConfig(5)='0' then
//      begin
//        ExecQuery('update MS_MEMBER_ETC inner join '
//                 +'       (select   m.CD_STORE, '
//                 +'                 m.CD_MEMBER, '
//                 +'                 Ifnull(c.AMT_BASE, 0) + Ifnull(s.POINT_ADD, 0) - Ifnull(s.POINT_USE, 0) as AMT_CLOSE, '
//                 +'                 Ifnull(c.AMT_BASE2, 0) + Ifnull(s.POINT_ADD, 0) as AMT_CLOSE2, '
//                 +'                 Ifnull(c.AMT_BASE3, 0) + Ifnull(s.POINT_USE, 0) as AMT_CLOSE3 '
//                 +'          from   MS_MEMBER as m left outer join '
//                 +'                 (select   CD_CODE as CD_MEMBER, '
//                 +'                           AMT_BASE, '
//                 +'                           AMT_BASE2, '
//                 +'                           AMT_BASE3 '
//                 +'                   from    SL_BOOKS_MONTH '
//                 +'                  where    CD_HEAD  = :P0 '
//                 +'                    and    CD_STORE = :P1 '
//                 +'                    and    CD_CLOSE = :P3 '
//                 +'                    and    YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
//                 +'                 (select   CD_MEMBER, '
//                 +'                           Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as POINT_ADD, '
//                 +'                           Sum(PNT_USE) as POINT_USE '
//                 +'                    from   SL_POINT '
//                 +'                   where   CD_HEAD  =:P0 '
//                 +'                     and   CD_STORE =:P1 '
//                 +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//                 +'                   group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
//                 +'         where    m.CD_HEAD  =:P0 '
//                 +'           and    m.CD_STORE =:P1) as x on MS_MEMBER_ETC.CD_MEMBER = x.CD_MEMBER '
//                 +'   set  MS_MEMBER_ETC.TOTAL_POINT  = Ifnull(x.AMT_CLOSE,0), '
//                 +'        MS_MEMBER_ETC.OCCUR_POINT  = Ifnull(x.AMT_CLOSE3,0), '
//                 +'        MS_MEMBER_ETC.USE_POINT    = Ifnull(x.AMT_CLOSE3,0) '
//                 +' where  MS_MEMBER_ETC.CD_HEAD  = :P0 '
//                 +'   and  MS_MEMBER_ETC.CD_STORE = :P1;',
//                [HeadStoreCode,
//                 StoreCode,
//                 vNextMonth,
//                 varPointClose],
//                 false);
//
//        ExecQuery('update MS_MEMBER_ETC inner join '
//                 +'       (select   m.CD_STORE, '
//                 +'                 m.CD_MEMBER, '
//                 +'                 Ifnull(c.AMT_BASE, 0)  + Ifnull(s.STAMP_ADD, 0) - Ifnull(s.STAMP_USE, 0) as AMT_CLOSE, '
//                 +'                 Ifnull(c.AMT_BASE2, 0) + Ifnull(s.STAMP_ADD, 0) as AMT_CLOSE2, '
//                 +'                 Ifnull(c.AMT_BASE3, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE3 '
//                 +'          from   MS_MEMBER as m left outer join '
//                 +'                 (select   CD_CODE as CD_MEMBER, '
//                 +'                           AMT_BASE, '
//                 +'                           AMT_BASE2, '
//                 +'                           AMT_BASE3 '
//                 +'                    from   SL_BOOKS_MONTH '
//                 +'                   where   CD_HEAD  = :P0 '
//                 +'                     and   CD_STORE = :P1 '
//                 +'                     and   CD_CLOSE = :P3 '
//                 +'                     and   YM_CLOSE = :P2  ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
//                 +'                 (select   CD_MEMBER, '
//                 +'                           Sum(STAMP_ADD) as STAMP_ADD, '
//                 +'                           Sum(STAMP_USE) as STAMP_USE '
//                 +'                    from   SL_POINT '
//                 +'                   where   CD_HEAD  =:P0 '
//                 +'                     and   CD_STORE =:P1 '
//                 +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
//                 +'                  group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
//                 +'         where    m.CD_HEAD  =:P0 '
//                 +'           and    m.CD_STORE =:P1) as x on MS_MEMBER_ETC.CD_MEMBER = x.CD_MEMBER '
//                 +'set     MS_MEMBER_ETC.TOTAL_STAMP  = Ifnull(x.AMT_CLOSE,0), '
//                 +'        MS_MEMBER_ETC.OCCUR_STAMP  = Ifnull(x.AMT_CLOSE2,0), '
//                 +'        MS_MEMBER_ETC.USE_STAMP    = Ifnull(x.AMT_CLOSE3,0) '
//                 +'where   MS_MEMBER_ETC.CD_HEAD  = :P0 '
//                 +'  and   MS_MEMBER_ETC.CD_STORE = :P1;',
//                [HeadStoreCode,
//                 StoreCode,
//                 vNextMonth,
//                 varStampClose],
//                 false);
//      end;
//    end;
//
//
//    ExecQuery('delete from SL_CLOSE_MONTH '
//             +'where  CD_HEAD   =:P0 '
//             +'  and  CD_STORE = :P1 '
//             +'  and  YM_CLOSE  =:P2 '
//             +'  and  DS_CLOSE = ''M'';',
//              [HeadStoreCode,
//               StoreCode,
//               vMonth],
//               false);
//
//    ExecQuery('insert into SL_CLOSE_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, DS_CLOSE, CD_SAWON_CHG, DT_INSERT) '
//             +'                    values(:P0, :P1, :P2, ''M'', :P3, Now()); ',
//             [HeadStoreCode,
//              StoreCode,
//              vMonth,
//              UserCode],
//              true);
//    ReadCloseData('M');
//  except
//    on E: Exception do
//    begin
//      ErrBox(E.Message);
//    end;
//  end;
//  Screen.Cursor := crDefault;
end;

procedure TCloseMonthCloseForm.MisuCloseButtonClick(Sender: TObject);
begin
  inherited;
  MisuClose;
end;

procedure TCloseMonthCloseForm.MisuCloseCancelButtonClick(Sender: TObject);
var
  vNextMonth, vMinMonth: string;
begin
  if MisuCloseMonthComboBox.ItemIndex < 0 then
    Exit;

  if not AskBox(Format('%s', [MisuCloseMonthComboBox.Text])+' 미수마감을 취소 하시겠습니까?') then Exit;

  vNextMonth := GetOnlyNumber(MisuCloseMonthComboBox.Text);
  if Length(vNextMonth) <> 6 then
    Exit;
  if Copy(vNextMonth, 5, 2) = '12' then
    vNextMonth := IntToStr(StoI(Copy(vNextMonth, 1, 4))+1) + '01'
  else
    vNextMonth := Copy(vNextMonth, 1, 4) + FormatFloat('00', StoI(Copy(vNextMonth, 5, 2))+1);

  try
    //최초 마감이면 삭제하지 않는다
//    OpenQuery('select Min(YM_CLOSE) '
//             +'  from SL_BOOKS_MONTH '
//             +' where CD_HEAD  = :P0 '
//             +'   and CD_STORE = :P1 ',
//              [HeadStoreCode,
//               StoreCode]);
//
//    vMinMonth := Query.Fields[0].AsString;
//    Query.Close;
//
//
//    if (vMinMonth = GetOnlyNumber(MisuCloseMonthComboBox.Text)) then
//    begin
//      MsgBox('최초마감은 취소할 수 없습니다');
//      Exit;
//    end;


    // 다음 달 거래처, 회원 마감 자료를 삭제한다
    ExecQuery('delete from SL_BOOKS_MONTH '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_CLOSE = :P2; ',
              [HeadStoreCode,
               StoreCode,
               vNextMonth],
               false);

    // 이번 달 거래처, 회원 마감 자료를 삭제한다
    ExecQuery('update SL_BOOKS_MONTH '
             +'   set AMT_CLOSE = 0, '
             +'       AMT_CLOSE2 =0, '
             +'       AMT_CLOSE3 =0 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_CLOSE = :P2; ',
              [HeadStoreCode,
               StoreCode,
               GetOnlyNumber(MisuCloseMonthComboBox.Text)],
               false);

    ExecQuery('delete from SL_CLOSE_MONTH '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_CLOSE = :P2 '
             +'   and DS_CLOSE =''M'' ',
             [HeadStoreCode,
              StoreCode,
              GetOnlyNumber(MisuCloseMonthComboBox.Text)],
              true);

    MsgBox('미수마감을 취소했습니다.');
    ReadCloseData('M');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TCloseMonthCloseForm.MisuCloseMonthComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  MisuCloseButton.Enabled       := false;
  MisuCloseCancelButton.Enabled := false;

  // 마감년월 콤보박스에 한 줄만 있다면
  if MisuCloseMonthComboBox.Properties.Items.Count = 1 then
  begin
    // 기초재고 생성일 때는 마감
    if MisuLastCloseMonthLabel.Caption = EmptyStr then
      MisuCloseButton.Enabled := true
    // 이번달 마감이 끝났을 때는 마감취소
    else
      MisuCloseCancelButton.Enabled := true;
  end
  // 마감 끝난 달에는 마감취소
  else if MisuCloseMonthComboBox.ItemIndex = 0 then
    MisuCloseCancelButton.Enabled := true
  // 마감 안 끝난 첫 번째 달에는 마감
  else if MisuCloseMonthComboBox.ItemIndex = 1 then
    MisuCloseButton.Enabled := true;
end;

function TCloseMonthCloseForm.StockClose:Boolean;
var
  vMonth, vNextMonth: string;
begin
  result := false;
  if StockCloseMonthComboBox.ItemIndex < 0 then
    Exit;

  // 이번 달과 다음 달을 구한다
  vMonth := GetOnlyNumber(StockCloseMonthComboBox.Text);
  if Length(vMonth) <> 6 then
    Exit;
  if Copy(vMonth, 5, 2) = '12' then
    vNextMonth := IntToStr(StoI(Copy(vMonth, 1, 4))+1) + '01'
  else
    vNextMonth := Copy(vMonth, 1, 4) + FormatFloat('00', StoI(Copy(vMonth, 5, 2))+1);

  if not AskBox(Format('%s년%s월', [LeftStr(vMonth,4), RightStr(vMonth,2)])+' 마감을 하시겠습니까?') then Exit;

  if not CheckStockClose(vMonth) then Exit;

  try
    ShowMsg('월 마감 중입니다. 잠시 기다리십시오.', false, -1);
    Screen.Cursor := crHourGlass;

    // 월재고 테이블에 마감할 월에 등록되지 않은 상품들을 일단 등록한다
    ExecQuery('insert into SL_STOCK_MONTH(CD_HEAD, CD_STORE, YM_STOCK, CD_GOODS) '
             +'select   CD_HEAD, '
             +'         CD_STORE, '
             +'         :P2       as YM_STOCK, '
             +'         CD_MENU '
             +'  from   MS_MENU  '
             +' where   CD_HEAD  = :P0 '
             +'   and   CD_STORE = :P1 '
             +'   and   DS_STOCK = ''1'' '
             +'   and   CD_MENU not in (select CD_GOODS '
             +'                           from SL_STOCK_MONTH '
             +'                          where CD_HEAD  = :P0 '
             +'                            and CD_STORE = :P1 '
             +'                            and YM_STOCK = :P2 );',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    // 매입 테이블을 근거로 매입 수량을 구한다
    ExecQuery('update SL_STOCK_MONTH inner join '
             +'      (select   d.CD_HEAD, '
             +'                d.CD_STORE, '
             +'                Left(d.YMD_BUY, 6) as YM_STOCK, '
             +'                d.CD_GOODS, '
             +'                Sum(d.QTY_BUY) as QTY_BUY, '
             +'                case when (Max(g.DS_MENU_TYPE) in (''N'',''G'',''I'') and Max(g.QTY_UNIT) > 1) or (Max(g.DS_MENU_TYPE) = ''W'') then Sum(d.QTY_BUY) * 1000 / 100 else Sum(d.QTY_BUY) end * Max(g.PR_BUY) as AMT_BUY, '
             +'                case when (Max(g.DS_MENU_TYPE) in (''N'',''G'',''I'') and Max(g.QTY_UNIT) > 1) or (Max(g.DS_MENU_TYPE) = ''W'') then Sum(d.QTY_BUY) * 1000 / 100 else Sum(d.QTY_BUY) end * Max(g.PR_SALE) as AMT_BUY_SALE '
             +'       from     SL_BUY_D  d inner join '
             +'                MS_MENU   g on d.CD_STORE = g.CD_STORE and d.CD_GOODS = g.CD_MENU and g.DS_STOCK = ''1'' '
             +'       where    d.CD_HEAD  =:P0 '
             +'         and    d.CD_STORE =:P1 '
             +'         and    d.YMD_BUY like ConCat(:P2,''%'') '
             +'       group by d.CD_HEAD, d.CD_STORE, Left(d.YMD_BUY, 6), d.CD_GOODS) as b on b.CD_HEAD  = SL_STOCK_MONTH.CD_HEAD '
             +'                                                                           and b.CD_STORE = SL_STOCK_MONTH.CD_STORE '
             +'                                                                           and b.YM_STOCK = SL_STOCK_MONTH.YM_STOCK '
             +'                                                                           and b.CD_GOODS = SL_STOCK_MONTH.CD_GOODS '
             +'set    SL_STOCK_MONTH.QTY_BUY      = Ifnull(b.QTY_BUY,0), '
             +'       SL_STOCK_MONTH.AMT_BUY      = Ifnull(b.AMT_BUY,0), '
             +'       SL_STOCK_MONTH.AMT_BUY_SALE = Ifnull(b.AMT_BUY_SALE,0) '
             +'where  SL_STOCK_MONTH.CD_HEAD  = :P0 '
             +'  and  SL_STOCK_MONTH.CD_STORE = :P1 '
             +'  and  SL_STOCK_MONTH.YM_STOCK = :P2;',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    // 판매 테이블을 근거로 매출 수량을 구한다
    ExecQuery('update SL_STOCK_MONTH inner join '
             +'      (select   Left(d.YMD_SALE, 6) as YM_STOCK, '
             +'                d.CD_MENU, '
             +'                case when g.DS_MENU_TYPE = ''W'' then Sum(d.QTY_SALE) / 1000 '
             +'                     else case when g.DS_MENU_TYPE in (''N'',''G'') and Sum(d.QTY_SALE) > 1 then Sum(d.QTY_SALE) * g.QTY_UNIT / 1000 '
             +'                               else Sum(d.QTY_SALE) end '
             +'                end as QTY_SALE, '
             +'                case when (Max(g.DS_MENU_TYPE) in (''N'',''G'',''I'') and Max(g.QTY_UNIT) > 1) or (Max(g.DS_MENU_TYPE) = ''W'') then Sum(d.QTY_SALE) * 1000 / 100 else Sum(d.QTY_SALE) end * Max(g.PR_BUY) as AMT_SALE, '
             +'                Sum(d.AMT_SALE - d.DC_TOT) as AMT_SALE_SALE '
             +'         from   SL_SALE_D d inner join '
             +'                MS_MENU   g on d.CD_HEAD  = g.CD_HEAD '
             +'                           and d.CD_STORE = g.CD_STORE '
             +'                           and d.CD_MENU  = g.CD_MENU '
             +'                           and g.DS_STOCK = ''1'' '
             +'         where  d.CD_HEAD  =:P0 '
             +'           and  d.CD_STORE =:P1 '
             +'           and  d.YMD_SALE like ConCat(:P2,''%'') '
             +'           and  d.DS_SALE <> ''V'' '
             +'         group by Left(d.YMD_SALE, 6), d.CD_MENU) as s on s.YM_STOCK = SL_STOCK_MONTH.YM_STOCK '
             +'                                                      and s.CD_MENU  = SL_STOCK_MONTH.CD_GOODS '
             +'set    SL_STOCK_MONTH.QTY_SALE      = Ifnull(s.QTY_SALE,0), '
             +'       SL_STOCK_MONTH.AMT_SALE      = Ifnull(s.AMT_SALE,0), '
             +'       SL_STOCK_MONTH.AMT_SALE_SALE = Ifnull(s.AMT_SALE_SALE,0) '
             +'where  SL_STOCK_MONTH.CD_HEAD  =:P0 '
             +'  and  SL_STOCK_MONTH.CD_STORE =:P1 '
             +'  and  SL_STOCK_MONTH.YM_STOCK =:P2; ',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    // 부메뉴 판매 테이블을 근거로 매출 수량을 구한다
    ExecQuery('update SL_STOCK_MONTH inner join '
             +'      (select   Left(d.YMD_SALE, 6) as YM_STOCK, '
             +'                d.CD_MENU, '
             +'                case when g.DS_MENU_TYPE = ''W'' then Sum(d.QTY_SALE) / 1000 '
             +'                     else case when g.DS_MENU_TYPE in (''N'',''G'') and Sum(d.QTY_SALE) > 1 then Sum(d.QTY_SALE) * g.QTY_UNIT / 1000 '
             +'                               else Sum(d.QTY_SALE) end '
             +'                end as QTY_SALE, '
             +'                case when (Max(g.DS_MENU_TYPE) in (''N'',''G'',''I'') and Max(g.QTY_UNIT) > 1) or (Max(g.DS_MENU_TYPE) = ''W'') then Sum(d.QTY_SALE) * 1000 / 100 else Sum(d.QTY_SALE) end * Max(g.PR_BUY) as AMT_SALE, '
             +'                Sum(d.PR_SALE * d.QTY_SALE) as AMT_SALE_SALE '
             +'       from     SL_SALE_S d inner join '
             +'                MS_MENU   g on d.CD_HEAD  = g.CD_HEAD '
             +'                           and d.CD_STORE = g.CD_STORE '
             +'                           and d.CD_MENU  = g.CD_MENU '
             +'                           and g.DS_STOCK = ''1'''
             +'       where    d.CD_HEAD  =:P0 '
             +'         and    d.CD_STORE =:P1 '
             +'         and    d.YMD_SALE like ConCat(:P2,''%'') '
             +'       group by Left(d.YMD_SALE, 6), d.CD_MENU) as s on s.YM_STOCK = SL_STOCK_MONTH.YM_STOCK '
             +'                                                    and s.CD_MENU  = SL_STOCK_MONTH.CD_GOODS '
             +'set    SL_STOCK_MONTH.QTY_SALE      = SL_STOCK_MONTH.QTY_SALE + Ifnull(s.QTY_SALE,0), '
             +'       SL_STOCK_MONTH.AMT_SALE      = SL_STOCK_MONTH.AMT_SALE + Ifnull(s.AMT_SALE,0), '
             +'       SL_STOCK_MONTH.AMT_SALE_SALE = SL_STOCK_MONTH.AMT_SALE_SALE + Ifnull(s.AMT_SALE_SALE,0) '
             +'where  SL_STOCK_MONTH.CD_HEAD  = :P0 '
             +'  and  SL_STOCK_MONTH.CD_STORE = :P1 '
             +'  and  SL_STOCK_MONTH.YM_STOCK = :P2; ',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    // 폐기 테이블을 근거로 폐기 수량을 구한다
    ExecQuery('update SL_STOCK_MONTH inner join '
             +'      (select   Left(d.YMD_DISUSE, 6) as YM_STOCK, '
             +'                d.CD_GOODS, '
             +'                Sum(d.QTY_DISUSE) as QTY_DISUSE, '
             +'                case when (Max(g.DS_MENU_TYPE) in (''N'',''G'',''I'') and Max(g.QTY_UNIT) > 1) or (Max(g.DS_MENU_TYPE) = ''W'') then Sum(d.QTY_DISUSE) * 1000 / 100 else Sum(d.QTY_DISUSE) end * Max(g.PR_BUY)  as AMT_DISUSE, '
             +'                case when (Max(g.DS_MENU_TYPE) in (''N'',''G'',''I'') and Max(g.QTY_UNIT) > 1) or (Max(g.DS_MENU_TYPE) = ''W'') then Sum(d.QTY_DISUSE) * 1000 / 100 else Sum(d.QTY_DISUSE) end * Max(g.PR_SALE) as AMT_DISUSE_SALE '
             +'       from     SL_DISUSE as d inner join '
             +'                MS_MENU   as g on d.CD_HEAD  = g.CD_HEAD '
             +'                              and d.CD_STORE = g.CD_STORE '
             +'                              and d.CD_GOODS = g.CD_MENU '
             +'                              and g.DS_STOCK = ''1'''
             +'       where    d.CD_HEAD  =:P0 '
             +'         and    d.CD_STORE =:P1 '
             +'         and    d.YMD_DISUSE like ConCat(:P1,''%'') '
             +'       group by Left(d.YMD_DISUSE, 6), d.CD_GOODS) as s on s.YM_STOCK = SL_STOCK_MONTH.YM_STOCK '
             +'                                                       and s.CD_GOODS = SL_STOCK_MONTH.CD_GOODS '
             +'set    SL_STOCK_MONTH.QTY_DISUSE      = Ifnull(s.QTY_DISUSE,0), '
             +'       SL_STOCK_MONTH.AMT_DISUSE      = Ifnull(s.AMT_DISUSE,0), '
             +'       SL_STOCK_MONTH.AMT_DISUSE_SALE = Ifnull(s.AMT_DISUSE_SALE,0) '
             +'where  SL_STOCK_MONTH.CD_HEAD  = :P0 '
             +'  and  SL_STOCK_MONTH.CD_STORE = :P1 '
             +'  and  SL_STOCK_MONTH.YM_STOCK = :P2;',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    // 실사 테이블을 근거로 ADJ 관련 항목들을 구한다
    ExecQuery('update SL_STOCK_MONTH inner join '
             +'      (select   s.YM_SILSA as YM_STOCK, '
             +'                s.CD_GOODS, '
             +'                s.QTY_SILSA, '
             +'                s.QTY_SETTLE as QTY_ADJ, '
             +'                case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then s.QTY_SETTLE * 1000 / 100 else s.QTY_SETTLE end *  g.PR_BUY  as AMT_ADJ, '
             +'                case when (g.DS_MENU_TYPE in (''N'',''G'',''I'') and g.QTY_UNIT > 1) or (g.DS_MENU_TYPE = ''W'') then s.QTY_SETTLE * 1000 / 100 else s.QTY_SETTLE end *  g.PR_SALE as AMT_ADJ_SALE '
             +'       from     SL_SILSA as s inner join '
             +'                MS_MENU   as g on s.CD_HEAD  = g.CD_HEAD '
             +'                              and s.CD_STORE = g.CD_STORE '
             +'                              and s.CD_GOODS = g.CD_MENU '
             +'                              and g.DS_STOCK = ''1'''
             +'       where    s.CD_HEAD  = :P0 '
             +'         and    s.CD_STORE = :P1 '
             +'         and    s.YM_SILSA = :P2 '
             +'         and    s.QTY_SETTLE is not null) as a on a.YM_STOCK = SL_STOCK_MONTH.YM_STOCK '
             +'                                              and a.CD_GOODS = SL_STOCK_MONTH.CD_GOODS '
             +'set    SL_STOCK_MONTH.QTY_SILSA    = Ifnull(a.QTY_SILSA,0), '
             +'       SL_STOCK_MONTH.QTY_ADJ      = Ifnull(a.QTY_ADJ,0), '
             +'       SL_STOCK_MONTH.AMT_ADJ      = Ifnull(a.AMT_ADJ,0), '
             +'       SL_STOCK_MONTH.AMT_ADJ_SALE = Ifnull(a.AMT_ADJ_SALE,0) '
             +'where  SL_STOCK_MONTH.CD_HEAD  = :P0 '
             +'  and  SL_STOCK_MONTH.CD_STORE = :P1 '
             +'  and  SL_STOCK_MONTH.YM_STOCK = :P2; ',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    ExecQuery('update SL_STOCK_MONTH '
             +'set    QTY_STOCK       = QTY_BASE + QTY_BUY - QTY_SALE - QTY_DISUSE + QTY_ADJ, '
             +'       AMT_STOCK       = AMT_BASE + AMT_BUY - AMT_SALE - AMT_DISUSE + AMT_ADJ, '
             +'       AMT_STOCK_SALE  = AMT_BASE_SALE + AMT_BUY_SALE - AMT_SALE_SALE - AMT_DISUSE_SALE + AMT_ADJ_SALE '
             +'where  CD_HEAD  = :P0 '
             +'  and  CD_STORE = :P1 '
             +'  and  YM_STOCK = :P2; ',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    // 재고 테이블에서 이번 달에 아무 거래도 없던 상품들을 지운다
    ExecQuery('delete from SL_STOCK_MONTH '
             +'where  CD_HEAD    = :P0 '
             +'  and  CD_STORE   = :P1 '
             +'  and  YM_STOCK   = :P2 '
             +'  and  QTY_BASE   = 0 '
             +'  and  QTY_BUY    = 0 '
             +'  and  QTY_SALE   = 0 '
             +'  and  QTY_DISUSE = 0 '
             +'  and  QTY_SILSA  = 0 '
             +'  and  QTY_ADJ    = 0;',
             [HeadStoreCode,
              StoreCode,
              vMonth],
              false);
{
    // 실사 임시 테이블에서 실사한 내용을 지운다(마감을 해서 이번 달 실사한 내용은 의미가 없다)
    ExecQuery('delete d '
             +'  from SL_SILSA_TEMP as d inner join '
             +'       SL_SILSA      as j on j.CD_HEAD  = d.CD_HEAD '
             +'                         and j.CD_STORE = d.CD_STORE '
             +'                         and j.YM_SILSA = d.YM_SILSA '
             +'                         and j.CD_GOODS = d.CD_GOODS  '
             +' where d.CD_HEAD  = :P0 '
             +'   and d.CD_STORE = :P1 '
             +'   and d.YM_SILSA = :P2 '
             +'   and d.QTY_SILSA is null;',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);
    // 실사 테이블에서 QTY_SILSA가 널인 자료들을 지운다
    ExecQuery('delete from SL_SILSA '
             +'where  CD_HEAD  = :P0 '
             +'  and  CD_STORE = :P1 '
             +'  and  YM_SILSA = :P2 '
             +'  and  QTY_SILSA is null; ',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);
}
    // 다음 달 기초 재고를 만든다
    ExecQuery('delete from SL_STOCK_MONTH '
             +'where  CD_HEAD  = :P0 '
             +'  and  CD_STORE = :P1 '
             +'  and  YM_STOCK = :P2;',
              [HeadStoreCode,
               StoreCode,
               vNextMonth],
               false);

    ExecQuery('insert into SL_STOCK_MONTH(CD_HEAD, CD_STORE, YM_STOCK, CD_GOODS) '
             +'select   CD_HEAD, '
             +'         CD_STORE, '
             +'         :P2, '
             +'         CD_MENU '
             +'  from   MS_MENU  '
             +' where   CD_HEAD  =:P0 '
             +'   and   CD_STORE =:P1;',
              [HeadStoreCode,
               StoreCode,
               vNextMonth],
               false);

    // 이번 달 재고를 다음 달 기초 재고로 넘긴다
    ExecQuery('update SL_STOCK_MONTH inner join '
             +'      (select   CD_GOODS, '
             +'                QTY_STOCK, '
             +'                AMT_STOCK, '
             +'                AMT_STOCK_SALE '
             +'       from     SL_STOCK_MONTH '
             +'       where    CD_HEAD  = :P0 '
             +'         and    CD_STORE = :P1 '
             +'         and    YM_STOCK = :P2) as s on SL_STOCK_MONTH.CD_GOODS = s.CD_GOODS '
             +'  set  SL_STOCK_MONTH.QTY_BASE      = Ifnull(s.QTY_STOCK,0), '
             +'       SL_STOCK_MONTH.AMT_BASE      = Ifnull(s.AMT_STOCK,0), '
             +'       SL_STOCK_MONTH.AMT_BASE_SALE = Ifnull(s.AMT_STOCK_SALE,0) '
             +'where  SL_STOCK_MONTH.CD_HEAD  =:P0 '
             +'  and  SL_STOCK_MONTH.CD_STORE =:P1 '
             +'  and  SL_STOCK_MONTH.YM_STOCK =:P3;',
              [HeadStoreCode,
               StoreCode,
               vMonth,
               vNextMonth],
               false);

    // 이번 달을 마감된 상태로 표시한다
    ExecQuery('update SL_STOCK_MONTH '
             +'   set YN_CLOSE = ''Y'' '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_STOCK = :P2;',
              [HeadStoreCode,
               StoreCode,
               vMonth],
               false);

    if not ExecQuery('insert into SL_CLOSE_MONTH(CD_HEAD, '
                    +'                           CD_STORE, '
                    +'                           YM_CLOSE, '
                    +'                           DS_CLOSE, '
                    +'                           CD_SAWON_CHG, '
                    +'                           DT_INSERT) '
                    +'                   values(:P0, '
                    +'                          :P1, '
                    +'                          :P2, '
                    +'                          ''S'', '
                    +'                          :P3, '
                    +'                          Now()) '
                    +' on duplicate key update DS_CLOSE  = ''S'', '
                    +'                         DT_INSERT = Now(); ',
                   [HeadStoreCode,
                    StoreCode,
                    vMonth,
                    UserCode],true) then Exit;

    ReadCloseData('S');
    result := true;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TCloseMonthCloseForm.StockCloseButtonClick(Sender: TObject);
begin
  inherited;
  StockClose;
end;

procedure TCloseMonthCloseForm.StockCloseCancelButtonClick(Sender: TObject);
var
  vNextMonth: string;
begin
  if not AskBox(Format('%s', [StockCloseMonthComboBox.Text])+' 재고마감을 취소하시겠습니까?') then Exit;
  if StockCloseMonthComboBox.ItemIndex < 0 then
    Exit;

  vNextMonth := GetOnlyNumber(StockCloseMonthComboBox.Text);
  if Length(vNextMonth) <> 6 then
    Exit;
  if Copy(vNextMonth, 5, 2) = '12' then
    vNextMonth := IntToStr(StoI(Copy(vNextMonth, 1, 4))+1) + '01'
  else
    vNextMonth := Copy(vNextMonth, 1, 4) + FormatFloat('00', StoI(Copy(vNextMonth, 5, 2))+1);

  try
    // 마감 취소(다음 달 이월 재고 데이터 삭제)를 한다
    ExecQuery('delete from SL_STOCK_MONTH '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_STOCK = :P2;',
              [HeadStoreCode,
               StoreCode,
               vNextMonth],
               false);
    // 이번 달 마감을 안된 상태로 표시한다
    ExecQuery('update SL_STOCK_MONTH '
             +'   set YN_CLOSE        = ''N'', '
             +'       QTY_BUY         = 0, '
             +'       AMT_BUY         = 0, '
             +'       AMT_BUY_SALE    = 0, '
             +'       QTY_SALE        = 0, '
             +'       AMT_SALE        = 0, '
             +'       AMT_SALE_SALE   = 0, '
             +'       QTY_DISUSE      = 0, '
             +'       AMT_DISUSE      = 0, '
             +'       AMT_DISUSE_SALE = 0, '
             +'       QTY_SILSA       = null, '
             +'       QTY_ADJ         = 0, '
             +'       AMT_ADJ         = 0, '
             +'       AMT_ADJ_SALE    = 0 '
             + 'where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_STOCK = :P2;',
              [HeadStoreCode,
               StoreCode,
               GetOnlyNumber(StockCloseMonthComboBox.Text)],
               false);

    ExecQuery('delete from SL_CLOSE_MONTH '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YM_CLOSE =:P2 '
             +'   and DS_CLOSE =''S'';',
             [HeadStoreCode,
              StoreCode,
              GetOnlyNumber(StockCloseMonthComboBox.Text)],
              true);

    MsgBox('재고마감을 취소했습니다.');
    ReadCloseData('S');
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure TCloseMonthCloseForm.StockCloseMonthComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  StockCloseButton.Enabled       := false;
  StockCloseCancelButton.Enabled := false;

  // 마감년월 콤보박스에 한 줄만 있다면
  if StockCloseMonthComboBox.Properties.Items.Count = 1 then
  begin
    // 기초재고 생성일 때는 마감
    if StockLastCloseMonthLabel.Caption = EmptyStr then
      StockCloseButton.Enabled := true
    // 이번달 마감이 끝났을 때는 마감취소
    else
      StockCloseCancelButton.Enabled := true;
  end
  // 마감 끝난 달에는 마감취소
  else if StockCloseMonthComboBox.ItemIndex = 0 then
    StockCloseCancelButton.Enabled := true
  // 마감 안 끝난 첫 번째 달에는 마감
  else if StockCloseMonthComboBox.ItemIndex = 1 then
    StockCloseButton.Enabled := true;
end;

function TCloseMonthCloseForm.CheckStockClose(aMonth: String): Boolean;
begin
  Result := false;
  // 최종 마감월이 없을 때는 첫 판매 달의 기초재고를 0으로 만들어 준다
  if StockLastCloseMonthLabel.Caption = EmptyStr then
  begin
    MsgBox(Format('%s 기초 재고를 생성합니다.', [StockCloseMonthComboBox.Text]));

    ExecQuery('insert into SL_STOCK_MONTH(CD_HEAD, CD_STORE, YM_STOCK, CD_GOODS) '
             +'select   g.CD_HEAD, '
             +'         g.CD_STORE, '
             +'         :P2       as YM_STOCK, '
             +'         g.CD_MENU '
             +'  from   MS_MENU  as g '
             +' where   g.CD_HEAD  = :P0 '
             +'   and   g.CD_STORE = :P1 '
             +'   and   g.CD_MENU not in (select   CD_GOODS '
             +'                              from   SL_STOCK_MONTH '
             +'                             where   CD_HEAD  = :P0 '
             +'                               and   CD_STORE = :P1 '
             +'                               and   YM_STOCK = :P2);',
              [HeadStoreCode,
               StoreCode,
               aMonth],false);

        ExecQuery('insert into SL_CLOSE_MONTH (CD_HEAD, CD_STORE, YM_CLOSE, DS_CLOSE, CD_SAWON_CHG) '
                 +'                     Values(:P0, :P1, :P2, ''S'', :P3);',
                 [HeadStoreCode,
                  StoreCode,
                  FormatDateTime('yyyymm', IncMonth(StoD(aMonth+'01'), -1)),
                  UserCode],
                  true);

      MsgBox('기초 재고 생성을 완료했습니다.');
      ReadCloseData('S');
  end
  // 최종 마감월이 있을 때는 이번 달 마감을 한다
  else
  begin
    // 이번 달 마감을 하는데 아직 말일이 되지 않았으면 확인을 한다
    if (aMonth = FormatDateTime('yyyymm', Date)) and
       (Trunc(EndOfTheMonth(Date)) <> Date) and
       (not AskBox('아직 말일이 되지 않았습니다.'#13'이번 달 마감을 하시겠습니까?')) then
      Exit;

    // 마감할 달에 판매는 했지만 POS 마감을 하지 않은 날짜가 있는지 확인한다
    OpenQuery('select  StoDW(YMD_CLOSE), '
             +'        NO_POS '
             +'  from  SL_POSCLOSE '
             +' where  CD_HEAD   =:P0 '
             +'   and  CD_STORE  =:P1 '
             +'   and  DS_STATUS = ''O'' '
             +'   and  YMD_CLOSE like ConCat(:P1,''%'') '
             +' order by YMD_CLOSE, NO_POS '
             +' limit 1 ',
              [HeadStoreCode,
               StoreCode,
               aMonth]);
    try
      if not Query.Eof then
      begin
        ErrBox(Format('%s일 %s번 POS 마감을 하지 않았습니다.', [Query.Fields[0].AsString, Query.Fields[1].AsString]));
        Exit;
      end;
    finally
      FinishQuery;
    end;
  end;
  Result := True;
end;

end.
