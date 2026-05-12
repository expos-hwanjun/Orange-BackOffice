// 실사 준비 (완료)

unit MemberRank;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inherit, Menus, UniProvider, SQLServerUniProvider, DBAccess, Uni, DB,
  cxGraphics, cxButtonEdit, cxDropDownEdit, cxContainer, cxEdit, StdCtrls,
  ExtCtrls, MemDS, cxLabel, cxControls, cxTextEdit, cxMaskEdit, cxCalendar,
  AdvGlowButton, AdvToolBar, StrUtils, AdvToolBarStylers, cxStyles,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, cxButtons, cxRadioGroup,
  cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, DateUtils, Math, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TMemberRankForm = class(TInheritForm)
    GridPanel: TGridPanel;
    RankPanel: TPanel;
    Label8: TLabel;
    CountLabel: TcxLabel;
    LastChangeLabel: TcxLabel;
    PriodLabel: TcxLabel;
    BeginDateEdit: TcxDateEdit;
    TermLabel: TcxLabel;
    EndDateEdit: TcxDateEdit;
    RankchangeButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure RankchangeButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ExistCode :String;      //등급조정 제외
  end;

var
  MemberRankForm: TMemberRankForm;



implementation

uses
  Common, DBModule;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberRankForm.FormCreate(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 등급조정 버튼
procedure TMemberRankForm.FormShow(Sender: TObject);
var vOption :Integer;
begin
  inherited;
  try
    OpenQuery('select Date_Format(DT_MEMBER_RANK, ''%Y-%m-%d'') '
             +'  from MS_STORE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1',
             [HeadStoreCode,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);

    LastChangeLabel.Caption := '최종 변경일자 : '+ Query.Fields[0].AsString;
  finally
    FinishQuery;
  end;
  vOption := Ifthen(GetStoreOption(5)='0',StoI(GetOption(31)),StoI(GetHeadOption(31)));
  case vOption of
    0:
    begin
      EndDateEdit.Date   := IncDay(Now(), -1);
      BeginDateEdit.Date := EndDateEdit.Date;
    end;
    1:
    begin
      EndDateEdit.Date   := IncDay(Now(), -1);
      BeginDateEdit.Date := IncDay(IncMonth(EndDateEdit.Date, -1),1);
    end;
    2 :
    begin
      EndDateEdit.Date   := IncDay(Now(), -1);
      BeginDateEdit.Date := IncDay(IncMonth(EndDateEdit.Date, -3),1);
    end;
    3 :
    begin
      EndDateEdit.Date   := IncDay(Now(), -1);
      BeginDateEdit.Date := IncDay(IncMonth(EndDateEdit.Date, -6),1);
    end;
    4 :
    begin
      EndDateEdit.Date   := IncDay(Now(), -1);
      BeginDateEdit.Date := IncDay(IncMonth(EndDateEdit.Date, -12),1);
    end;
  end;
end;

procedure TMemberRankForm.RankchangeButtonClick(Sender: TObject);
var
  vClass:  Array of Array of String;
  vIndex,
  vRow,
  vCount,
  vVisitCount: Integer;
  vSaleAmt :Integer;
begin
  inherited;
  if not AskBox('회원등급을 조정하시겠습니까?') then Exit;

  try
    ExistCode := '';

    OpenQuery('select CD_CODE '
             +'  from MS_CODE '
             +'where  CD_HEAD   =:P0 '
             +'  and  CD_STORE  =:P1 '
             +'   and CD_KIND   =''05'' '
             +'   and DS_STATUS = ''0'' '
             +'   and NM_CODE18 =''1'' '
             +'order by CD_CODE ',
             [HeadStoreCode,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    while not Query.Eof do
    begin
      ExistCode := ExistCode + Format('''%s'',',[Query.Fields[0].AsString]);
      Query.Next;
    end;
    Query.Close;


    OpenQuery('select CD_CODE, '
             +'       NM_CODE3,'
             +'       NM_CODE4 '
             +'from   MS_CODE '
             +'where  CD_HEAD  =:P0 '
             +'  and  CD_STORE =:P1 '
             +'  and  CD_KIND = ''05'' '
             +'  and  DS_STATUS = ''0'' '
             +'   and NM_CODE18 = ''0'' '
             +'order by CD_CODE ',
             [HeadStoreCode,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    SetLength(vClass, Query.RecordCount, 4);
    vIndex := 0;
    while not Query.Eof do
    begin
      vClass[vIndex, 0] := Query.Fields[0].AsString;
      vClass[vIndex, 1] := Query.Fields[1].AsString;      //구매금액
      vClass[vIndex, 2] := Query.Fields[2].AsString;      //구매건수
      vClass[vIndex, 3] := '';  //변경할 회원코드 저장

      Inc(vIndex);
      Query.Next;
    end;
  finally
    FinishQuery;
  end;

  try
    try
      if ExistCode <> '' then
        ExistCode := Format('and a.DS_MEMBER not in (%s) ',[LeftStr(ExistCode, Length(ExistCode)-1)]);

      if GetStoreOption(5)='0' then
        OpenQuery('select a.CD_MEMBER, '
                 +'       Ifnull(b.AMT_SALE,0) as AMT_SALE, '
                 +'       a.DS_MEMBER, '
                 +'       Ifnull(b.CNT_SALE,0) as CNT_SALE '
                 +'  from MS_MEMBER as a left outer join '
                 +'      (select CD_MEMBER, '
                 +'              Sum(AMT_SALE) as AMT_SALE, '
                 +'              Sum(case when AMT_SALE >= 0 then 1 else -1 end) as CNT_SALE '
                 +'         from  '+GetPartitionTable('SL_SALE_H', BeginDateEdit.CurrentDate,BeginDateEdit.CurrentDate, '')
                 +'        where CD_HEAD  =:P0 '
                 +'          and CD_STORE =:P1 '
                 +'          and YMD_SALE Between :P2 and :P3 '
                 +'          and CD_MEMBER <> '''' '
                 +'        group by CD_MEMBER '
                 +'       ) as b on b.CD_MEMBER = a.CD_MEMBER '
                 +' where a.CD_HEAD   =:P0 '
                 +'   and a.CD_STORE  =:P1 '
                 +'   and a.DS_STATUS = ''0 '' '
                 +ExistCode,
                 [HeadStoreCode,
                  StoreCode,
                  DtoS(BeginDateEdit.CurrentDate),
                  DtoS(BeginDateEdit.CurrentDate)])
      else
        OpenQuery('select a.CD_MEMBER, '
                 +'       Ifnull(b.AMT_SALE,0) as AMT_SALE, '
                 +'       a.DS_MEMBER, '
                 +'       Ifnull(b.CNT_SALE,0) as CNT_SALE '
                 +'  from MS_MEMBER as a  left outer join '
                 +'      (select CD_MEMBER, '
                 +'              Sum(AMT_SALE) as AMT_SALE, '
                 +'              Sum(case when AMT_SALE >= 0 then 1 else -1 end) as CNT_SALE '
                 +'         from  '+GetPartitionTable('SL_SALE_H', BeginDateEdit.CurrentDate,BeginDateEdit.CurrentDate, '')
                 +'        where CD_HEAD = :P0 '
                 +'          and YMD_SALE Between :P2 and :P3 '
                 +'          and CD_MEMBER <> '''' '
                 +'        group by CD_MEMBER '
                 +'       ) as b on b.CD_MEMBER = a.CD_MEMBER '
                 +' where a.CD_HEAD   =:P0 '
                 +'   and a.CD_STORE  =:P1 '
                 +'   and a.DS_STATUS = ''0 '' '
                 +ExistCode,
                 [HeadStoreCode,
                  StandardStore,
                  DtoS(BeginDateEdit.CurrentDate),
                  DtoS(EndDateEdit.CurrentDate)]);


      vCount := 0;
      if not Query.Eof then
        CountLabel.Caption := '0 / '+IntToStr(Query.RecordCount);
      while not Query.Eof do
      begin
        for vIndex := High(vClass) downto 0 do
        begin
          vSaleAmt := Query.Fields[1].AsInteger;
          vVisitCount := Query.Fields[3].AsInteger;
          if    ((StrToIntDef(vClass[vIndex,1],0) = 0) or  (vSaleAmt    >= StrToIntDef(vClass[vIndex,1],0)) )     //구매금액
            and ((StrToIntDef(vClass[vIndex,2],0) = 0) or  (vVisitCount >= StrToIntDef(vClass[vIndex,2],0)) ) then     //구매건
          begin
            if (vClass[vIndex,0] <> Query.Fields[2].AsString) then                                               //현재 등급
              vClass[vIndex, 3] := vClass[vIndex, 3] + Format('''%s'',',[Query.Fields[0].AsString]);
            Break;
          end;
        end;
        Inc(vCount);
        CountLabel.Caption := IntToStr(vCount)+' / '+IntToStr(Query.RecordCount);
        Application.ProcessMessages;
        Query.Next;
      end;
      Query.Close;

      TempSQL := '';
      for vIndex := High(vClass) downto 0 do
      begin
        if vClass[vIndex, 3] = '' then Continue;
        vClass[vIndex, 3] := Format(' and CD_MEMBER in (%s);',[LeftStr(vClass[vIndex, 3],Length(vClass[vIndex, 3])-1)]);
        TempSQL := TempSQL + Format('update MS_MEMBER '
                                   +'   set DS_MEMBER =''%s'', '
                                   +'       DT_CHANGE = NOW() '
                                   +' where CD_HEAD = ''%s'' '
                                   +'   and CD_STORE  =''%s'' '
                                   +vClass[vIndex, 3],
                                   [vClass[vIndex,0],
                                    HeadStoreCode,
                                    Ifthen(GetStoreOption(5)='0', StoreCode,StandardStore)]);

      end;

      if not ExecQuery('update MS_STORE '
                      +'   set DT_MEMBER_RANK = Now() '
                      +' where CD_HEAD  =:P0 '
                      +'   and CD_STORE =:P1;',
                      [HeadStoreCode,
                       Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)],true) then Exit;

      MsgBox('회원구분 조정이 완료되었습니다.');
      LastChangeLabel.Caption := '최종 변경일자 : '+ FormatDateTime('yyyy-mm-dd',now());
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
      end;
    end;
  finally
    FinishQuery;
  end;
end;
end.
