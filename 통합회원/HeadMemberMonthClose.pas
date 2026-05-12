// 월 마감 (New완료)

unit HeadMemberMonthClose;



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
  THeadMemberMonthCloseForm = class(TInheritEditForm)
    GridPanel: TGridPanel;
    ClosePanel: TPanel;
    MisuGroupBox: TcxGroupBox;
    Label1: TLabel;
    MisuLastCloseMonthLabel: TLabel;
    MisuCloseMonthCaptionLabel: TLabel;
    CloseMonthComboBox: TcxComboBox;
    PointCloseButton: TcxButton;
    CloseCancelButton: TcxButton;
    CommentLabel: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PointCloseButtonClick(Sender: TObject);
    procedure CloseCancelButtonClick(Sender: TObject);
    procedure MisuCloseMonthComboBoxPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure ReadCloseData;
    procedure MisuClose;
  end;

var
  HeadMemberMonthCloseForm: THeadMemberMonthCloseForm;

implementation

uses
  Common, DBModule;

{$R *.dfm}
//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure THeadMemberMonthCloseForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  isChanged := false;
  inherited;
end;

procedure THeadMemberMonthCloseForm.FormCreate(Sender: TObject);
begin
  inherited;
  ReadCloseData;
end;

procedure THeadMemberMonthCloseForm.FormShow(Sender: TObject);
begin
  inherited;

end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 마감년월 콤보박스를 고칠 때


procedure THeadMemberMonthCloseForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 마감 정보 읽기
procedure THeadMemberMonthCloseForm.ReadCloseData;
const
  msgYear  = '년 ';
  msgMonth = '월';
var
  vDate: string;
  vLastYear, vLastMonth, vThisYear, vThisMonth, vDay: Word;
  vYearIndex, vMonthIndex: Integer;
begin
  MisuLastCloseMonthLabel.Caption := EmptyStr;
  CloseMonthComboBox.Properties.Items.Clear;

  // 최종 마감월을 불러온다
  OpenQuery('select Max(YM_CLOSE) as YM_CLOSE '
           +'  from SL_CLOSE_MONTH '
           +' where CD_HEAD  = :P0 '
           +'   and CD_STORE = :P1 '
           +'   and DS_CLOSE = :P2 ',
            [HeadStoreCode,
             StandardStore,
             'M']);

  if Query.Fields[0].AsString = '' then
  begin
    Query.Close;
    OpenQuery('select StoD(Min(YMD_OCCUR)) as YM_CLOSE '
             +'  from SL_POINT '
             +' where CD_HEAD  = :P0 ',
              [HeadStoreCode]);
    if Query.Fields[0].AsString <> '' then
      vDate := FormatDateTime('yyyymm', IncMonth(StrToDate(Query.Fields[0].AsString),-1));
  end
  else
    vDate := Query.Fields[0].AsString;

  try

    if Length(vDate) = 6 then
    begin
      try
        // 최종마감월을 표시한다
        vLastYear  := StoI(Copy(vDate, 1, 4));
        vLastMonth := StoI(Copy(vDate, 5, 2));

        MisuLastCloseMonthLabel.Caption := IntToStr(vLastYear)+msgYear+FormatFloat('00', vLastMonth)+msgMonth;

        // 마감월 콤보박스를 생성한다(최종마감월 다음 달부터 이번 달까지)
        DecodeDate(Date, vThisYear, vThisMonth, vDay);
        for vYearIndex := vLastYear to vThisYear do
          if (vYearIndex = vLastYear) and (vYearIndex = vThisYear) then
            for vMonthIndex := vLastMonth to vThisMonth do
              CloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
          else if vYearIndex = vLastYear then
            for vMonthIndex := vLastMonth to 12 do
              CloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
          else if vYearIndex = vThisYear then
            for vMonthIndex := 1 to vThisMonth do
              CloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth)
          else
            for vMonthIndex := 1 to 12 do
              CloseMonthComboBox.Properties.Items.Add(IntToStr(vYearIndex)+msgYear+FormatFloat('00', vMonthIndex)+msgMonth);

        if CloseMonthComboBox.Properties.Items.Count > 1 then
          CloseMonthComboBox.ItemIndex := 1
        else if CloseMonthComboBox.Properties.Items.Count > 0 then
          CloseMonthComboBox.ItemIndex := 0;
      except
      end;
    end;
  finally
    FinishQuery;
  end;

  if MisuLastCloseMonthLabel.Caption = EmptyStr then
  begin
    CloseMonthComboBox.Properties.Items.Add(FormatDateTime('yyyy년mm월',IncMonth(Now(),-1)));
    CloseMonthComboBox.ItemIndex := 0;
  end;
end;


procedure THeadMemberMonthCloseForm.MisuClose;
var vMonth, vNextMonth:String;
begin
  if CloseMonthComboBox.ItemIndex < 0 then
    Exit;

  // 이번 달과 다음 달을 구한다
  vMonth := GetOnlyNumber(CloseMonthComboBox.Text);
  if Length(vMonth) <> 6 then
    Exit;
  if Copy(vMonth, 5, 2) = '12' then
    vNextMonth := IntToStr(StoI(Copy(vMonth, 1, 4))+1) + '01'
  else
    vNextMonth := Copy(vMonth, 1, 4) + FormatFloat('00', StoI(Copy(vMonth, 5, 2))+1);

  if not AskBox(Format('%s년%s월', [LeftStr(vMonth,4), RightStr(vMonth,2)])+' 마감을 하시겠습니까?') then Exit;

  try
    ShowMsg('월 마감 중입니다. 잠시 기다리십시오.', false, -1);
    Screen.Cursor := crHourGlass;
    // 기존 거래처, 회원 마감이 있으면 취소한다
    ExecQuery('update SL_BOOKS_MONTH '
             +'  set  AMT_CLOSE = 0 '
             +'where  CD_HEAD  = :P0 '
             +'  and  CD_STORE = :P1 '
             +'  and  YM_CLOSE = :P2;',
              [HeadStoreCode,
               StandardStore,
               vMonth],
               false);

    // 회원 포인트 마감
    ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
             +'select   CD_HEAD, '
             +'         CD_STORE, '
             +'         :P2 as YM_CLOSE, '
             +'         ''30'' as CD_CLOSE, '
             +'         CD_MEMBER '
             +'  from   MS_MEMBER '
             +' where   CD_HEAD   =:P0 '
             +'   and   CD_STORE  =:P1 '
             +'   and   CD_MEMBER not in (select  CD_CODE '
             +'                             from  SL_BOOKS_MONTH '
             +'                            where  CD_HEAD   =:P0 '
             +'                              and  CD_STORE = :P1 '
             +'                              and  YM_CLOSE = :P2 '
             +'                              and  CD_CLOSE = :P3);',
              [HeadStoreCode,
               StandardStore,
               vMonth,
               varPointClose],
               false);

    // 회원 포인트 합계를 넣어준다
    ExecQuery('update   SL_BOOKS_MONTH inner join '
             +'        (select   m.CD_STORE, '
             +'                  m.CD_MEMBER, '
             +'                  Ifnull(c.AMT_BASE, 0) + Ifnull(s.POINT_ADD, 0) - Ifnull(s.POINT_USE, 0) as AMT_CLOSE, '
             +'                  Ifnull(c.AMT_BASE2, 0) + Ifnull(s.POINT_ADD, 0) as AMT_CLOSE2, '
             +'                  Ifnull(c.AMT_BASE3, 0) + Ifnull(s.POINT_USE, 0) as AMT_CLOSE3 '
             +'         from     MS_MEMBER as m left outer join '
             +'                 (select   CD_CODE as CD_MEMBER, '
             +'                           Sum(AMT_BASE)  as AMT_BASE, '
             +'                           Sum(AMT_BASE2) as AMT_BASE2, '
             +'                           Sum(AMT_BASE3) as AMT_BASE3 '
             +'                  from     SL_BOOKS_MONTH '
             +'                  where    CD_HEAD  =:P0 '
             +'                    and    CD_STORE =:P1 '
             +'                    and    CD_CLOSE =:P4 '
             +'                    and    YM_CLOSE =:P2 '
             +'                  group by CD_CODE ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
             +'                 (select   CD_MEMBER, '
             +'                           Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as POINT_ADD, '
             +'                           Sum(PNT_USE) as POINT_USE '
             +'                  from     SL_POINT '
             +'                  where    CD_HEAD =:P0 '
             +'                    and    YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
             +'                  group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
             +'         where    m.CD_HEAD  =:P0 '
             +'           and    m.CD_STORE =:P1) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_MEMBER '
             +'set      SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
             +'         SL_BOOKS_MONTH.AMT_CLOSE2   = Ifnull(x.AMT_CLOSE2,0), '
             +'         SL_BOOKS_MONTH.AMT_CLOSE3   = Ifnull(x.AMT_CLOSE3,0), '
             +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
             +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
             +'where    SL_BOOKS_MONTH.CD_HEAD  = :P0 '
             +'  and    SL_BOOKS_MONTH.CD_STORE = :P1 '
             +'  and    SL_BOOKS_MONTH.YM_CLOSE = :P2 '
             +'  and    SL_BOOKS_MONTH.CD_CLOSE = :P4;',
              [HeadStoreCode,
               StandardStore,
               vMonth,
               UserCode,
               varPointClose],
               false);

    // 회원 스템프 마감
    ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE) '
             +'select   CD_HEAD, '
             +'         CD_STORE, '
             +'         :P2 as YM_CLOSE, '
             +'         ''40'' as CD_CLOSE, '
             +'         CD_MEMBER '
             +'  from   MS_MEMBER '
             +' where   CD_HEAD   =:P0 '
             +'   and   CD_STORE  =:P1 '
             +'   and   CD_MEMBER not in (select  CD_CODE '
             +'                             from  SL_BOOKS_MONTH '
             +'                            where  CD_HEAD   =:P0 '
             +'                              and  CD_STORE = :P1 '
             +'                              and  YM_CLOSE = :P2 '
             +'                              and  CD_CLOSE = :P3);',
              [HeadStoreCode,
               StandardStore,
               vMonth,
               varStampClose],
               false);

    // 회원 스템프 합계를 넣어준다
    ExecQuery('update  SL_BOOKS_MONTH inner join '
             +'        (select   m.CD_STORE, '
             +'                  m.CD_MEMBER, '
             +'                  Ifnull(c.AMT_BASE, 0)  + Ifnull(s.STAMP_ADD, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE, '
             +'                  Ifnull(c.AMT_BASE2, 0) + Ifnull(s.STAMP_ADD, 0) as AMT_CLOSE2, '
             +'                  Ifnull(c.AMT_BASE3, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE3 '
             +'         from     MS_MEMBER as m left outer join '
             +'                 (select   CD_CODE as CD_MEMBER, '
             +'                           Sum(AMT_BASE)  as AMT_BASE, '
             +'                           Sum(AMT_BASE2) as AMT_BASE2, '
             +'                           Sum(AMT_BASE3) as AMT_BASE3 '
             +'                    from   SL_BOOKS_MONTH '
             +'                   where   CD_HEAD  =:P0 '
             +'                     and   CD_STORE =:P1 '
             +'                     and   CD_CLOSE =:P4 '
             +'                     and   YM_CLOSE = :P2 '
             +'                  group by CD_CODE ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
             +'                 (select   CD_MEMBER, '
             +'                           Sum(STAMP_ADD) as STAMP_ADD, '
             +'                           Sum(STAMP_USE) as STAMP_USE '
             +'                    from   SL_POINT '
             +'                   where   CD_HEAD  =:P0 '
             +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
             +'                   group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
             +'         where    m.CD_HEAD  =:P0 '
             +'           and    m.CD_STORE =:P1) as x on SL_BOOKS_MONTH.CD_CODE = x.CD_MEMBER '
             +'  set    SL_BOOKS_MONTH.AMT_CLOSE    = Ifnull(x.AMT_CLOSE,0), '
             +'         SL_BOOKS_MONTH.AMT_CLOSE2   = Ifnull(x.AMT_CLOSE2,0), '
             +'         SL_BOOKS_MONTH.AMT_CLOSE3   = Ifnull(x.AMT_CLOSE3,0), '
             +'         SL_BOOKS_MONTH.CD_SAWON_CHG = :P3, '
             +'         SL_BOOKS_MONTH.DT_CHANGE    = Now() '
             +'where    SL_BOOKS_MONTH.CD_HEAD  = :P0 '
             +'  and    SL_BOOKS_MONTH.CD_STORE = :P1 '
             +'  and    SL_BOOKS_MONTH.YM_CLOSE = :P2 '
             +'  and    SL_BOOKS_MONTH.CD_CLOSE = :P4;',
              [HeadStoreCode,
               StandardStore,
               vMonth,
               UserCode,
               varStampClose],
               false);

    // 자료가 없는 것들은 지운다
    ExecQuery('delete from SL_BOOKS_MONTH '
             +'where  CD_HEAD   = :P0 '
             +'  and  CD_STORE  = :P1 '
             +'  and  YM_CLOSE  = :P2 '
             +'  and  AMT_BASE  = 0 '
             +'  and  AMT_CLOSE = 0;',
              [HeadStoreCode,
               StandardStore,
               vMonth],
               false);

    // 다음달에 기초자료를 지운다
    ExecQuery('delete from SL_BOOKS_MONTH '
             +'where  CD_HEAD   = :P0 '
             +'  and  CD_STORE  = :P1 '
             +'  and  YM_CLOSE  = :P2;',
              [HeadStoreCode,
               StandardStore,
               vNextMonth],
               false);

    // 다음 달 기초 자료를 만든다
    ExecQuery('insert into SL_BOOKS_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, CD_CLOSE, CD_CODE, AMT_BASE, AMT_BASE2, AMT_BASE3, AMT_CLOSE, AMT_CLOSE2, AMT_CLOSE3, CD_SAWON_CHG, DT_CHANGE) '
             +'select   CD_HEAD, '
             +'         CD_STORE, '
             +'         :P3 as YM_CLOSE, '
             +'         CD_CLOSE, '
             +'         CD_CODE, '
             +'         AMT_CLOSE, '
             +'         AMT_CLOSE2, '
             +'         AMT_CLOSE3, '
             +'         0, '
             +'         0, '
             +'         0, '
             +'         :P4 as CD_SAWON_CHG, '
             +'         Now() '
             +'  from   SL_BOOKS_MONTH '
             +'  where  CD_HEAD   = :P0 '
             +'    and  CD_STORE  = :P1 '
             +'    and  YM_CLOSE  = :P2;',
              [HeadStoreCode,
               StandardStore,
               vMonth,
               vNextMonth,
               UserCode],
               false);

    //최근 월마감이면 회원정보(MS_MEMBER_ETC -> AMT_TRUST, 에 반영한다)     외상은 매장별로 관리한다
    if FormatDateTime('yyyymm',Now()) >= vNextMonth then
    begin
      ExecQuery('update MS_MEMBER_ETC inner join '
               +'       (select   m.CD_STORE, '
               +'                 m.CD_MEMBER, '
               +'                 Ifnull(c.AMT_BASE, 0) + Ifnull(s.POINT_ADD, 0) - + Ifnull(s.POINT_USE, 0) as AMT_CLOSE, '
               +'                 Ifnull(c.AMT_BASE2, 0) + Ifnull(s.POINT_ADD, 0) as AMT_CLOSE2, '
               +'                 Ifnull(c.AMT_BASE3, 0) + Ifnull(s.POINT_USE, 0) as AMT_CLOSE3 '
               +'          from   MS_MEMBER as m left outer join '
               +'                 (select   CD_CODE as CD_MEMBER, '
               +'                           Sum(AMT_BASE)  as AMT_BASE, '
               +'                           Sum(AMT_BASE2) as AMT_BASE2, '
               +'                           Sum(AMT_BASE3) as AMT_BASE3 '
               +'                   from    SL_BOOKS_MONTH '
               +'                  where    CD_HEAD  = :P0 '
               +'                    and    CD_STORE = :P1 '
               +'                    and    YM_CLOSE = :P2 '
               +'                    and    CD_CLOSE = :P3'
               +'                  group by CD_CODE ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
               +'                 (select   CD_MEMBER, '
               +'                           Sum(PNT_CASH + PNT_CASHRCP + PNT_CARD + PNT_GIFT + PNT_TRUST + PNT_POINT) as POINT_ADD, '
               +'                           Sum(PNT_USE) as POINT_USE '
               +'                    from   SL_POINT '
               +'                   where   CD_HEAD  =:P0 '
               +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
               +'                   group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
               +'         where    m.CD_HEAD  =:P0 '
               +'           and    m.CD_STORE =:P1) as x on MS_MEMBER_ETC.CD_MEMBER = x.CD_MEMBER '
               +'set     MS_MEMBER_ETC.TOTAL_POINT  = Ifnull(x.AMT_CLOSE,0), '
               +'        MS_MEMBER_ETC.OCCUR_POINT  = Ifnull(x.AMT_CLOSE3,0), '
               +'        MS_MEMBER_ETC.USE_POINT    = Ifnull(x.AMT_CLOSE3,0) '
               +'where   MS_MEMBER_ETC.CD_HEAD  = :P0 '
               +'  and   MS_MEMBER_ETC.CD_STORE = :P1;',
              [HeadStoreCode,
               StandardStore,
               vNextMonth,
               varPointClose],
               false);

      ExecQuery('update MS_MEMBER_ETC inner join '
               +'       (select   m.CD_STORE, '
               +'                 m.CD_MEMBER, '
               +'                 Ifnull(c.AMT_BASE, 0)  + Ifnull(s.STAMP_ADD, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE, '
               +'                 Ifnull(c.AMT_BASE2, 0) + Ifnull(s.STAMP_ADD, 0) as AMT_CLOSE2, '
               +'                 Ifnull(c.AMT_BASE3, 0) + Ifnull(s.STAMP_USE, 0) as AMT_CLOSE3 '
               +'          from   MS_MEMBER as m left outer join '
               +'                 (select   CD_CODE as CD_MEMBER, '
               +'                           Sum(AMT_BASE) as AMT_BASE, '
               +'                           Sum(AMT_BASE2) as AMT_BASE2, '
               +'                           Sum(AMT_BASE3) as AMT_BASE3 '
               +'                    from   SL_BOOKS_MONTH '
               +'                   where   CD_HEAD  = :P0 '
               +'                     and   CD_STORE = :P1 '
               +'                     and   YM_CLOSE = :P2 '
               +'                     and   CD_CLOSE = :P3 '
               +'                   group by CD_CODE ) c on  m.CD_MEMBER = c.CD_MEMBER left outer join '
               +'                 (select   CD_MEMBER, '
               +'                           Sum(STAMP_ADD) as STAMP_ADD, '
               +'                           Sum(STAMP_USE) as STAMP_USE '
               +'                    from   SL_POINT '
               +'                   where   CD_HEAD  =:P0 '
               +'                     and   YMD_OCCUR Between ConCat(:P2,''01'') and ConCat(:P2,''31'') '
               +'                  group by CD_MEMBER) as s on  m.CD_MEMBER = s.CD_MEMBER  '
               +'         where    m.CD_HEAD  =:P0 '
               +'           and    m.CD_STORE =:P1) as x on MS_MEMBER_ETC.CD_MEMBER = x.CD_MEMBER '
               +'set     MS_MEMBER_ETC.TOTAL_STAMP  = Ifnull(x.AMT_CLOSE,0), '
               +'        MS_MEMBER_ETC.OCCUR_STAMP  = Ifnull(x.AMT_CLOSE2,0), '
               +'        MS_MEMBER_ETC.USE_STAMP    = Ifnull(x.AMT_CLOSE3,0) '
               +'where   MS_MEMBER_ETC.CD_HEAD  = :P0 '
               +'  and   MS_MEMBER_ETC.CD_STORE = :P1;',
              [HeadStoreCode,
               StandardStore,
               vNextMonth,
               varStampClose],
               false);
    end;


    ExecQuery('delete from SL_CLOSE_MONTH '
             +'where  CD_HEAD   =:P0 '
             +'  and  CD_STORE = :P1 '
             +'  and  YM_CLOSE  =:P2 '
             +'  and  DS_CLOSE = ''M'';',
              [HeadStoreCode,
               StandardStore,
               vMonth],
               false);

    ExecQuery('insert into SL_CLOSE_MONTH(CD_HEAD, CD_STORE, YM_CLOSE, DS_CLOSE, CD_SAWON_CHG, DT_INSERT) '
             +'                    values(:P0, :P1, :P2, ''M'', :P3, Now());',
             [HeadStoreCode,
              StandardStore,
              vMonth,
              UserCode],
              true);
    ReadCloseData;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure THeadMemberMonthCloseForm.PointCloseButtonClick(Sender: TObject);
begin
  inherited;
  MisuClose;
end;

procedure THeadMemberMonthCloseForm.CloseCancelButtonClick(Sender: TObject);
var
  vNextMonth: string;
begin
  if CloseMonthComboBox.ItemIndex < 0 then
    Exit;

  if not AskBox(Format('%s', [CloseMonthComboBox.Text])+' 마감을 하시겠습니까?') then Exit;

  vNextMonth := GetOnlyNumber(CloseMonthComboBox.Text);
  if Length(vNextMonth) <> 6 then
    Exit;
  if Copy(vNextMonth, 5, 2) = '12' then
    vNextMonth := IntToStr(StoI(Copy(vNextMonth, 1, 4))+1) + '01'
  else
    vNextMonth := Copy(vNextMonth, 1, 4) + FormatFloat('00', StoI(Copy(vNextMonth, 5, 2))+1);

  try
    // 다음 달 거래처, 회원 마감 자료를 삭제한다
    ExecQuery('delete from SL_BOOKS_MONTH '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_CLOSE = :P2; ',
              [HeadStoreCode,
               StandardStore,
               vNextMonth],
               false);
    // 이번 달 거래처, 회원 마감 자료를 삭제한다
    ExecQuery('update SL_BOOKS_MONTH '
             +'   set AMT_CLOSE = 0 '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_CLOSE = :P2; ',
              [HeadStoreCode,
               StandardStore,
               GetOnlyNumber(CloseMonthComboBox.Text)],
               false);

    ExecQuery('delete from SL_CLOSE_MONTH '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and YM_CLOSE = :P2 '
             +'   and DS_CLOSE =''M'';',
             [HeadStoreCode,
              StandardStore,
              GetOnlyNumber(CloseMonthComboBox.Text)],
              true);

    MsgBox('마감을 취소했습니다.');
    ReadCloseData;
  except
    on E: Exception do
    begin
      ErrBox(E.Message);
    end;
  end;
end;

procedure THeadMemberMonthCloseForm.MisuCloseMonthComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  PointCloseButton.Enabled  := false;
  CloseCancelButton.Enabled := false;

  // 마감년월 콤보박스에 한 줄만 있다면
  if CloseMonthComboBox.Properties.Items.Count = 1 then
  begin
    // 기초재고 생성일 때는 마감
    if MisuLastCloseMonthLabel.Caption = EmptyStr then
      PointCloseButton.Enabled := true
    // 이번달 마감이 끝났을 때는 마감취소
    else
      CloseCancelButton.Enabled := true;
  end
  // 마감 끝난 달에는 마감취소
  else if CloseMonthComboBox.ItemIndex = 0 then
    CloseCancelButton.Enabled := true
  // 마감 안 끝난 첫 번째 달에는 마감
  else if CloseMonthComboBox.ItemIndex = 1 then
    PointCloseButton.Enabled := true;
end;


end.
