// 회원 포인트 관리 (완료)

unit MemberPoint;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritGridEdit, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxLabel, cxCurrencyEdit, StdCtrls, Math,
  cxGridCustomTableView, cxGridTableView, cxContainer, UniProvider,
  SQLServerUniProvider, Uni, DB, MemDS, cxTextEdit, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls, cxButtonEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, AdvGlowButton, AdvToolBar, AdvSplitter,
  AdvToolBarStylers, cxLookAndFeels, cxLookAndFeelPainters, StrUtils, DBAccess,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TMemberPointForm = class(TInheritGridEditForm)
    GridTableViewMemberNo: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewType: TcxGridColumn;
    GridTableViewPoint: TcxGridColumn;
    TopPanel: TPanel;
    MemberLabel: TLabel;
    TypeLabel: TLabel;
    ReasonLabel: TLabel;
    CommentLabel: TLabel;
    MemberTypeLabel: TLabel;
    MemberNoEdit: TcxButtonEdit;
    MemberNameEdit: TcxTextEdit;
    TypeComboBox: TcxComboBox;
    SaveReasonComboBox: TcxComboBox;
    ReasonComboBox: TcxComboBox;
    MemberTypeNameEdit: TcxTextEdit;
    MemberTypeEdit: TcxTextEdit;
    SavePanel: TPanel;
    SaveCashLabel: TLabel;
    SavePointEdit: TcxCurrencyEdit;
    UsePanel: TPanel;
    UsePointLabel: TLabel;
    UsePointEdit: TcxCurrencyEdit;
    BottomPanel: TPanel;
    RemarkLabel: TLabel;
    RemarkEdit: TcxTextEdit;
    GridTableViewSeq: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewTelNo: TcxGridColumn;
    UseReasonComboBox: TcxComboBox;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPropertiesChange(Sender: TObject);
    procedure EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure MemberNoEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FormActivate(Sender: TObject);
    procedure Exec_TimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    CurrentPointTypeIndex: Integer;
    MemberCode :String;
    function  SearchMember(aMember: string = ''): string;

  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  MemberPointForm: TMemberPointForm;



implementation

uses
  Common, DBModule, Help;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TMemberPointForm.FormActivate(Sender: TObject);
begin
  inherited;
  //회원관리에서 실행으로 넘어왔을경우 자동조회
  if (FormParam[0] <> EmptyStr) then// and (FormParam[1] = EmptyStr) then
  begin
    ConditionToolBarEdit.Text := FormParam[0];
    MemberCode := ConditionToolBarEdit.Text;
    Exec_Timer.Enabled := True;
  end;
end;

procedure TMemberPointForm.FormCreate(Sender: TObject);
begin
  inherited;
  HelpURL     := 'BackOffice/회원관리/회원%20포인트적립,사용등록/회원%20포인트적립_사용등록.htm';
  DefaultDate := ddToday;
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TMemberPointForm.FormShow(Sender: TObject);
var
  vCode     : PStrPointer;
begin
  inherited;

  isLoading := true;
  try
    // 적립 사유 콤보박스 세팅
    try
      OpenQuery('select CD_CODE, '
               +'       NM_CODE1 '
               +'  from MS_CODE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_KIND = ''12'' '
               +' order by CD_CODE',
                [HeadStoreCode,
                 Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
      while not Query.Eof do
      begin
        New(vCode);
        vCode^.Data := Query.Fields[0].AsString;
        SaveReasonComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        Query.Next;
      end;
    finally
      FinishQuery;
    end;

    // 사용 사유 콤보박스 세팅
    try
      OpenQuery('select CD_CODE, '
               +'       NM_CODE1 '
               +'  from MS_CODE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_KIND = ''13'' '
               +' order by CD_CODE',
                [HeadStoreCode,
                 Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
      while not Query.Eof do
      begin
        New(vCode);
        vCode^.Data := Query.Fields[0].AsString;
        UseReasonComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
        Query.Next;
      end;
    finally
      FinishQuery;
    end;
    TypeComboBox.ItemIndex := 0;
    EditPropertiesChange(TypeComboBox);
  finally
    isLoading := false;
    isChanged := false;
  end;
end;

procedure TMemberPointForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

end;

//==============================================================================
// 입력창
//------------------------------------------------------------------------------
// 입력창 값을 수정할 때
procedure TMemberPointForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  // 회원번호
  if (Sender = MemberNoEdit) and (MemberNameEdit.Text <> EmptyStr) and
     ((GetOnlyNumber(MemberNoEdit.Text) <> MemberNoEdit.Text) or (Length(MemberNoEdit.Text) <> 10)) then
  begin
    MemberNameEdit.Clear;
    MemberTypeEdit.Clear;
    MemberTypeNameEdit.Clear;
  end

  // 적립/사용 구분
  else if Sender = TypeComboBox then
  begin
    SavePanel.Visible := TypeComboBox.ItemIndex = 0;
    UsePanel.Visible  := not SavePanel.Visible;

    ReasonComboBox.Properties.Items.Clear;
    if TypeComboBox.ItemIndex = 0 then
      ReasonComboBox.Properties.Items.AddStrings(SaveReasonComboBox.Properties.Items)
    else
      ReasonComboBox.Properties.Items.AddStrings(UseReasonComboBox.Properties.Items);
    if ReasonComboBox.Properties.Items.Count > 0 then
    begin
      ReasonComboBox.ItemIndex := 0;
      EditPropertiesChange(ReasonComboBox);
    end;
  end
  else if Sender = ReasonComboBox then
  begin
    try
      //사용
      if TypeComboBox.ItemIndex = 1 then
      begin
        DM.OpenQuery('select   NM_CODE2 '
                    +'  from   MS_CODE '
                    +' where   CD_HEAD  = :P0 '
                    +'   and   CD_STORE = :P1 '
                    +'   and   CD_KIND  = ''13'' '
                    +'   and   CD_CODE  = :P1',
                  [HeadStoreCode,
                   Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                   GetStrPointerData(ReasonComboBox)]);
        if not DM.Query.Eof then
        begin
          if DM.Query.Fields[0].AsInteger = 0 then
          begin
            UsePointEdit.Value := 0;
            UsePointEdit.Properties.AssignedValues.ReadOnly := false;
            UsePointEdit.Properties.ReadOnly := false;
          end
          else
          begin
            UsePointEdit.Value := DM.Query.Fields[0].AsInteger;
            UsePointEdit.Properties.AssignedValues.ReadOnly := true;
            UsePointEdit.Properties.ReadOnly := true;
          end;
        end;
      end
      //적립
      else if TypeComboBox.ItemIndex = 0 then
      begin
        DM.OpenQuery('select   NM_CODE2 '
                    +'  from   MS_CODE '
                    +' where   CD_HEAD  = :P0 '
                    +'   and   CD_STORE = :P1 '
                    +'   and   CD_KIND  = ''12'' '
                    +'   and   CD_CODE  = :P2',
                    [HeadStoreCode,
                     Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
                     GetStrPointerData(ReasonComboBox)]);
        if not DM.Query.Eof then
        begin
          if DM.Query.Fields[0].AsInteger = 0 then
          begin
            SavePointEdit.Value := 0;
            SavePointEdit.Properties.AssignedValues.ReadOnly := false;
            SavePointEdit.Properties.ReadOnly := false;
          end
          else
          begin
            SavePointEdit.Value := DM.Query.Fields[0].AsInteger;
            SavePointEdit.Properties.AssignedValues.ReadOnly := true;
            SavePointEdit.Properties.ReadOnly := true;
          end;
        end;
      end;
    finally
      DM.FinishQuery;
    end;
  end;
end;
//------------------------------------------------------------------------------
// 입력창 값을 검증할 때
procedure TMemberPointForm.EditPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  vMemberNo, vMemberName, vMemberType, vMemberTypeName: string;
begin
  inherited;

  // 회원이름 등을 불러온다
  if (Sender = MemberNoEdit) and (MemberNameEdit.Text = EmptyStr) then
  begin
    OpenQuery('select   a.CD_MEMBER, '
             +'         a.NM_MEMBER,  '
             +'         a.DS_MEMBER, '
             +'         b.NM_CODE1 '
             +'  from   MS_MEMBER as a inner join '
             +'         MS_CODE   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.DS_MEMBER = b.CD_CODE '
             +' where   a.CD_HEAD   =:P0 '
             +'   and   a.CD_STORE  =:P1 '
             +'   and   (a.CD_MEMBER =:P2 '
             +'      or a.NM_MEMBER like ConCat(''%'',:P2,''%'') '
             +'      or a.NO_CARD   =:P2 '
             +'      or AES_Decrypt(a.TEL_MOBILE,71483) =:P2 '
             +'      or AES_Decrypt(a.TEL_MOBILE_SHORT,71483) =:P2) '
             +'  and    a.DS_STATUS = ''0'' '
             +Ifthen(GetStoreOption(5)='0','',Format('and a.CD_STORE_JOIN =''%s'' ',[StoreCode]))
             +'  and    b.CD_KIND   = ''05''',
              [HeadStoreCode,
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
               DisplayValue]);

    try
      if not Query.Eof then
      begin
        // 일단 첫번째 값을 받아 놓는다
        vMemberNo       := Query.Fields[0].AsString;
        vMemberName     := Query.Fields[1].AsString;
        vMemberType     := Query.Fields[2].AsString;
        vMemberTypeName := Query.Fields[3].AsString;
        // 쿼리 다음 줄로 이동해 본다
        Query.Next;
        // 쿼리 다음 줄이 없으면 한 줄만 검색된 것이므로 검색 결과를 표시한다
        if Query.Eof then
        begin
          DisplayValue            := vMemberNo;
          MemberNameEdit.Text     := vMemberName;
          MemberTypeEdit.Text     := vMemberType;
          MemberTypeNameEdit.Text := vMemberTypeName;
        end
        // 쿼리 다음 줄이 있으면 조회 결과가 여러 건이므로 도움말 창을 보여준다
        else
          DisplayValue := SearchMember(DisplayValue);
      end
      else
      begin
        Error     := true;
        ErrorText := MemberLabel.Caption+msgMustInput;
      end;
    finally
      FinishQuery;
    end;
  end;
end;
procedure TMemberPointForm.Exec_TimerTimer(Sender: TObject);
var vDisplayValue : Variant;
    vErrorText    : TCaption;
    vError        : Boolean;
begin
  inherited;
  Exec_Timer.Enabled := False;
  if FormParam[0] = EmptyStr then
    ButtonToolBarSearchButton.Click
  else
  begin
    FormParam[0] := EmptyStr;
    MainPanel.Enabled := true;
    DoNew();
    isNew := true;
    vDisplayValue := MemberCode;
    vErrorText    := EmptyStr;
    vError        := false;
    EditPropertiesValidate(MemberNoEdit, vDisplayValue,vErrorText, vError);
    if FormParam[1] = 'A' then
      TypeComboBox.ItemIndex := 0
    else
      TypeComboBox.ItemIndex := 1;
    EditPropertiesChange(TypeComboBox);
    MemberNoEdit.Text := MemberCode;
    if FormParam[1] = 'A' then
      SavePointEdit.SetFocus
    else
      UsePointEdit.SetFocus;
    FormParam[0] := EmptyStr;
    FormParam[1] := EmptyStr;
  end;
end;

//------------------------------------------------------------------------------
// 회원번호 입력창 도움말 버튼을 누를 때
procedure TMemberPointForm.MemberNoEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  SearchMember;
end;

//------------------------------------------------------------------------------
// 회원 조회
function TMemberPointForm.SearchMember(aMember: string): string;
begin
  Result := EmptyStr;
  with THelpForm.Create(Self) do
    try
      Caption := '회원 조회';
      GridTableViewCode.Caption  := GridTableViewMemberNo.Caption;
      GridTableViewCode.Width    := 80;
      GridTableViewName1.Caption := GridTableViewMemberName.Caption;
      GridTableViewName1.Width   := 150;
      GridTableViewName2.Visible := true;
      GridTableViewName2.Caption := '카드번호';
      GridTableViewName2.Width   := 110;
      GridTableViewName2.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName2.Properties.Alignment.Horz := taCenter;
      GridTableViewName3.Visible := true;
      GridTableViewName3.Caption := '휴대전화';
      GridTableViewName3.Width   := 100;
      GridTableViewName3.PropertiesClassName       := 'TcxTextEditProperties';
      GridTableViewName3.Properties.Alignment.Horz := taCenter;

      SQLText    := 'select   a.CD_MEMBER, '
                   +'         a.NM_MEMBER, '
                   +'         a.NO_CARD, '
                   +'         GetPhoneNo(AES_Decrypt(a.TEL_MOBILE, 71483)) as NO_TEL, '
                   +'         a.DS_MEMBER, '
                   +'         b.NM_CODE1 '
                   +'  from   MS_MEMBER as a inner join '
                   +'         MS_CODE   as b on a.CD_HEAD = b.CD_HEAD and a.CD_STORE = b.CD_STORE and a.DS_MEMBER = b.CD_CODE '
                   +' where   a.CD_HEAD  =:P0 '
                   +Format(' and   a.CD_STORE =''%s'' ',[Ifthen(GetStoreOption(5)='0', StoreCode, StandardStore)])
                   +'   and  (a.CD_MEMBER = :P2 '
                   +'      or a.NM_MEMBER like ConCat(''%'',:P2,''%'') '
                   +'      or a.NO_CARD   =:P2 '
                   +'      or AES_Decrypt(a.TEL_MOBILE, 71483) = :P2 '
                   +'      or AES_Decrypt(a.TEL_MOBILE_SHORT, 71483) = :P2) '
                   +'   and  a.DS_STATUS = ''0'' '
                   +Ifthen(GetStoreOption(5)='0','',Format('and a.CD_STORE_JOIN = ''%s'' ',[StoreCode]))
                   +'   and  b.CD_KIND   = ''05'' '
                   +' order by a.NM_MEMBER';
      IsMemberSearch := True;
      if SearchText <> EmptyStr then IsAutoSearch := True;

      if ShowModal = mrOK then
      begin
        MemberNoEdit.Text       := Code;
        MemberNameEdit.Text     := Names[0];
        MemberTypeEdit.Text     := Names[3];
        MemberTypeNameEdit.Text := Names[4];
        EditPropertiesChange(TypeComboBox);
        if MainPanel.Enabled and TypeComboBox.Enabled then
          TypeComboBox.SetFocus;
        isChanged := true;
        Result    := Code;
      end;
    finally
      Free;
    end;
end;

//------------------------------------------------------------------------------
// 회원변경 시 포인트타입 셋팅
//------------------------------------------------------------------------------
// 조회
function TMemberPointForm.DoSearch: Boolean;
begin
  Result := false;

  try
    if Tag = 0 then
      OpenQuery('select   a.CD_MEMBER, '
               +'         b.NM_MEMBER as NM_MEMBER, '
               +'         a.TYPE, '
               +'         a.PNT_CASH - a.PNT_USE as PNT_TOTAL, '
               +'         a.SEQ, '
               +'         b.NO_CARD, '
               +'         GetPhoneNo(AES_Decrypt(b.TEL_MOBILE, 71483)) as NO_TEL '
               +'  from  (select CD_MEMBER, '
               +'                case when PNT_USE = 0 then ''적립'' else ''사용'' end as TYPE, '
               +'                SEQ, '
               +'                PNT_CASH, '
               +'                PNT_USE '
               +'          from  SL_POINT '
               +'         where  CD_HEAD   =:P0 '
               +'           and  CD_STORE  =:P1 '
               +'           and  YMD_OCCUR =:P2 '
               +'           and  NO_POS    =''00'' '
               +'           and  (PNT_CASH <> 0 or PNT_USE) ) as a inner join '
               +'         MS_MEMBER as b on b.CD_HEAD  =:P0 '
               +'                       and b.CD_STORE =:P4 '
               +'                       and a.CD_MEMBER = b.CD_MEMBER '
               +'                       and (b.CD_MEMBER =:P3 '
               +'                         or b.NM_MEMBER like ConCat(''%'',:P3,''%'') '
               +'                         or AES_Decrypt(b.TEL_MOBILE, 71483)=:P3 '
               +'                         or AES_Decrypt(b.TEL_MOBILE_SHORT, 71483)=:P3 '
               +'                         or b.NO_CARD =:P3)'
               +'order by a.CD_MEMBER, a.TYPE, a.SEQ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 ConditionToolBarEdit.Text,
                 Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)])
    else
      OpenQuery('select   a.CD_MEMBER, '
               +'         b.NM_MEMBER as NM_MEMBER, '
               +'         a.TYPE, '
               +'         a.STAMP_ADD - a.STAMP_USE as PNT_TOTAL, '
               +'         a.SEQ, '
               +'         b.NO_CARD, '
               +'         GetPhoneNo(AES_Decrypt(b.TEL_MOBILE, 71483)) as NO_TEL '
               +'  from  (select CD_MEMBER, '
               +'                case when STAMP_USE = 0 then ''적립'' else ''사용'' end as TYPE, '
               +'                SEQ, '
               +'                STAMP_ADD, '
               +'                STAMP_USE '
               +'          from  SL_POINT '
               +'         where  CD_HEAD   =:P0 '
               +'           and  CD_STORE  =:P1 '
               +'           and  YMD_OCCUR =:P2 '
               +'           and  NO_POS    =''00'' '
               +'           and  (STAMP_ADD <> 0 or STAMP_USE <> 0)) as a inner join '
               +'         MS_MEMBER as b on b.CD_HEAD  =:P0 '
               +'                       and b.CD_STORE =:P4 '
               +'                       and a.CD_MEMBER = b.CD_MEMBER '
               +'                       and (b.CD_MEMBER =:P3 '
               +'                         or b.NM_MEMBER like ConCat(''%'',:P3,''%'') '
               +'                         or AES_Decrypt(b.TEL_MOBILE, 71483)=:P3 '
               +'                         or AES_Decrypt(b.TEL_MOBILE_SHORT, 71483)=:P3 '
               +'                         or b.NO_CARD =:P3)'
               +'order by a.CD_MEMBER, a.TYPE, a.SEQ',
                [HeadStoreCode,
                 StoreCode,
                 DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                 ConditionToolBarEdit.Text,
                 Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
    Result := DM.ReadQuery(Query, GridTableView);
  except
  end;
end;
//------------------------------------------------------------------------------
// 그리드 연결 자료 표시
procedure TMemberPointForm.DoGridLink;
var
  vIndex     : Integer;
  vReasonType: PStrPointer;
begin
  inherited;

  // 현재 선택한 회원구분에 따라 적립률을 구하기 위해 적립률을 찾는다
  isLoading := true;
  try
    MemberNoEdit.Text                          := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberNo.Index];
    MemberNoEdit.TabStop                       := false;
    MemberNoEdit.Properties.ReadOnly           := true;
    MemberNoEdit.Style.Color                   := clrDisabled;
    MemberNoEdit.Properties.Buttons[0].Enabled := false;
    MemberNameEdit.Text                        := GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewMemberName.Index];
    TypeComboBox.ItemIndex                     := IfThen(GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewType.Index] = '적립', 0, 1);
    TypeComboBox.Enabled                       := false;

    try
      // 적립
      if TypeComboBox.ItemIndex = 0 then
      begin
        OpenQuery('select   b.DS_MEMBER, '       //0
                 +'         c.NM_CODE1, '        //1
                 +'         a.CD_CODE, '         //2
                 +Ifthen(Tag=0, 'a.PNT_CASH, ','a.STAMP_ADD as PNT_CASH, ') //3
                 +'         a.REMARK, '          //4
                 +'         a.NO_POS '
                 +'  from   SL_POINT as a inner join '
                 +'         MS_MEMBER    as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = :P4 and a.CD_MEMBER = b.CD_MEMBER left outer join '
                 +'         MS_CODE      as c on c.CD_HEAD = b.CD_HEAD and c.CD_STORE = :P4 and c.CD_CODE   = b.DS_MEMBER and c.CD_KIND = ''05'' '
                 +' where   a.CD_HEAD   = :P0 '
                 +'   and   a.CD_STORE  = :P1 '
                 +'   and   a.YMD_OCCUR = :P2 '
                 +'   and   a.NO_POS    = ''00'' '
                 +'   and   a.SEQ       = :P3 ',
                  [HeadStoreCode,
                   StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                   GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index],
                   Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);

        MemberTypeEdit.Text               := Query.Fields[ 0].AsString;
        MemberTypeNameEdit.Text           := Query.Fields[ 1].AsString;
        SaveReasonComboBox.ItemIndex      := GetStrPointerIndex(SaveReasonComboBox, Query.Fields[2].AsString);
        SavePointEdit.Value               := Query.Fields[ 3].AsCurrency;
        RemarkEdit.Text                   := Query.Fields[ 4].AsString;
      end

      // 사용
      else
      begin
        OpenQuery('select   b.DS_MEMBER, '
                 +'         c.NM_CODE1, '
                 +'         a.CD_CODE, '
                 +Ifthen(Tag=0,' a.PNT_USE, ','a.STAMP_USE as PNT_USE, ')
                 +'         a.REMARK, '
                 +'         a.NO_POS '
                 +'  from   SL_POINT as a inner join '
                 +'         MS_MEMBER  as b on b.CD_HEAD = a.CD_HEAD and b.CD_STORE = :P4 and a.CD_MEMBER = b.CD_MEMBER left outer join '
                 +'         MS_CODE    as c on c.CD_HEAD = b.CD_HEAD and c.CD_STORE = :P4 and c.CD_CODE   = b.DS_MEMBER  and c.CD_KIND = ''05'' '
                 +' where   a.CD_HEAD  = :P0 '
                 +'   and   a.CD_STORE = :P1 '
                 +'   and   a.YMD_OCCUR= :P2 '
                 +'   and   a.NO_POS   = ''00'' '
                 +'   and   a.SEQ      = :P3 ',
                  [HeadStoreCode,
                   StoreCode,
                   DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                   GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index],
                   Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore)]);
        if not Query.Eof then
        begin
          MemberTypeEdit.Text             := Query.Fields[0].AsString;
          MemberTypeNameEdit.Text         := Query.Fields[1].AsString;
          UseReasonComboBox.ItemIndex     := GetStrPointerIndex(UseReasonComboBox, Query.Fields[2].AsString);
          UsePointEdit.Value              := Query.Fields[3].AsInteger;
          RemarkEdit.Text                 := Query.Fields[4].AsString;
        end
        else
        begin
          MemberTypeEdit.Clear;
          MemberTypeNameEdit.Clear;
          UseReasonComboBox.ItemIndex     := 0;
          UsePointEdit.Value              := 0;
          RemarkEdit.Clear;
        end;
      end;
    finally
      FinishQuery;
    end;
  finally
    isLoading := false;
  end;
end;
//------------------------------------------------------------------------------
// 신규
function TMemberPointForm.DoNew: Boolean;
begin
  // 편집 불가하게 만들었던 컴포넌트들을 편집 가능하게 푼다
  MemberNoEdit.TabStop                       := true;
  MemberNoEdit.Properties.ReadOnly           := false;
  MemberNoEdit.Style.Color                   := clWindow;
  MemberNoEdit.Properties.Buttons[0].Enabled := true;
  TypeComboBox.Enabled                       := true;
  SavePointEdit.Enabled                      := true;

  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function TMemberPointForm.DoDelete: Boolean;
var vName :String;
begin
  Result := false;
  if CheckMonthClose('M', DtoS(ConditionToolBarFromDateEdit.CurrentDate)) then
  begin
    Result := false;
    Exit;
  end;

  if Tag = 0 then
    vName := '포인트'
  else
    vName := '스템프';

  if TypeComboBox.ItemIndex = 0 then
  begin
    ErrBox('적립내역은 삭제할 수 없습니다'+#13+'사용등록으로 처리해야합니다');
    Exit;
  end;

  if AskBox(MemberNameEdit.Text+'님의 '+vName+ TypeComboBox.Text+' 정보를 정말 삭제하시겠습니까?') then
  begin
    Result := ExecQuery('delete from SL_POINT '
                       +' where CD_HEAD   =:P0 '
                       +'   and CD_STORE  =:P1 '
                       +'   and YMD_OCCUR =:P2 '
                       +'   and NO_POS    =''00'' '
                       +'   and SEQ       =:P3;',
                        [HeadStoreCode,
                         StoreCode,
                         DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                         GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index]],
                         true);
  end;
end;
//------------------------------------------------------------------------------
// 저장
function TMemberPointForm.DoSave: Boolean;
var vSeq :Integer;
begin
  Result := false;

  if DtoS(ConditionToolBarFromDateEdit.CurrentDate) = EmptyStr then
  begin
    ErrBox(TypeComboBox.Text+'일자'+msgMustInput);
    Exit;
  end;

  if CheckMonthClose('M', DtoS(ConditionToolBarFromDateEdit.CurrentDate)) then
  begin
    Result := false;
    Exit;
  end;

  // 사유 입력 여부 확인
  if ReasonComboBox.ItemIndex < 0 then
  begin
    ErrBox(ReasonLabel.Caption+msgMustInput);
    if MainPanel.Enabled and ReasonComboBox.Enabled then
      ReasonComboBox.SetFocus;
    Exit;
  end;

  // 포인트 입력 여부 확인
  Result := ((TypeComboBox.ItemIndex = 0) and (SavePointEdit.Value <> 0)) or
            ((TypeComboBox.ItemIndex = 1) and (UsePointEdit.Value <> 0));
  if not Result then
  begin
    ErrBox(Ifthen(TypeComboBox.ItemIndex = 0, SaveCashLabel.Caption, UsePointLabel.Caption) +msgMustInput);
    if TypeComboBox.ItemIndex = 0 then
      SavePointEdit.SetFocus
    else
      UsePointEdit.SetFocus;
    Exit;
  end;

  if isNew then
  begin
    OpenQuery('select Ifnull(Max(SEQ),0)+1 '
             +'  from SL_POINT '
             +' where CD_HEAD   = :P0 '
             +'   and CD_STORE  = :P1 '
             +'   and YMD_OCCUR = :P2 '
             +'   and NO_POS    = ''00'' ',
             [HeadStoreCode,
              StoreCode,
              DtoS(ConditionToolBarFromDateEdit.CurrentDate)]);
    if Query.Eof then
      vSeq := 1
    else
      vSeq := Query.Fields[0].AsInteger;
    Query.Close;
  end;

  // 적립
  if TypeComboBox.ItemIndex = 0 then
  begin
    if isNew then
    begin
      if Tag = 0 then
        Result := ExecQuery('insert into SL_POINT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, SEQ, CD_MEMBER, CD_CODE, PNT_CASH, PNT_ADD, REMARK, RCP_LINK, CD_SAWON_CHG, DT_CHANGE) '
                           +'             values (:P0, '
                           +'                     :P1, '
                           +'                     :P2, '
                           +'                     ''00'', '
                           +'                     :P3, '
                           +'                     :P4, '
                           +'                     :P5, '
                           +'                     :P6, '
                           +'                     :P6, '
                           +'                     :P7, '
                           +'                     '''', '
                           +'                     :P8, '
                           +'                     Now()); ',
                            [HeadStoreCode,
                             StoreCode,
                             DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                             vSeq,
                             MemberNoEdit.Text,
                             GetStrPointerData(ReasonComboBox),
                             SavePointEdit.Value,
                             RemarkEdit.Text,
                             UserCode])
      else
        Result := ExecQuery('insert into SL_POINT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, SEQ, CD_MEMBER, CD_CODE, STAMP_ADD, REMARK, RCP_LINK, CD_SAWON_CHG, DT_CHANGE) '
                           +'             values (:P0, '
                           +'                     :P1, '
                           +'                     :P2, '
                           +'                     ''00'', '
                           +'                     :P3, '
                           +'                     :P4, '
                           +'                     :P5, '
                           +'                     :P6, '
                           +'                     :P7, '
                           +'                     '''', '
                           +'                     :P8, '
                           +'                     Now()); ',
                            [HeadStoreCode,
                             StoreCode,
                             DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                             vSeq,
                             MemberNoEdit.Text,
                             GetStrPointerData(ReasonComboBox),
                             SavePointEdit.Value,
                             RemarkEdit.Text,
                             UserCode]);

      if Result then
      begin
        SetLength(NewData, 5);
        NewData[0] := MemberNoEdit.Text;
        NewData[1] := MemberNameEdit.Text;
        NewData[2] := TypeComboBox.Text;
        NewData[3] := SavePointEdit.Value;
        NewData[4] := vSeq;
      end;
    end
    else
    begin
      Result := ExecQuery('update SL_POINT '
                         +'   set CD_MEMBER    = :P4, '
                         +'       CD_CODE      = :P5, '
                         +Ifthen(Tag=0, Format('%s = :P6, ',['PNT_CASH']),'')
                         +Format('%s = :P6, ',[Ifthen(Tag=0,'PNT_ADD','STAMP_ADD')])
                         +'       REMARK       = :P7, '
                         +'       CD_SAWON_CHG = :P8, '
                         +'       DT_CHANGE    = Now() '
                         +'where  CD_HEAD      = :P0 '
                         +'  and  CD_STORE     = :P1 '
                         +'  and  YMD_OCCUR    = :P2 '
                         +'  and  NO_POS       = ''00'' '
                         +'  and  SEQ          = :P3;',
                         [HeadStoreCode,
                          StoreCode,
                          DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index],
                          MemberNoEdit.Text,
                          GetStrPointerData(ReasonComboBox),
                          SavePointEdit.Value,
                          RemarkEdit.Text,
                          UserCode]);
      if Result then
        GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewPoint.Index] := SavePointEdit.Value;
    end;
  end

  // 사용
  else
  begin
    if isNew then
    begin
      Result := ExecQuery('insert into SL_POINT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, SEQ, CD_MEMBER, CD_CODE,'+Ifthen(Tag=0,'PNT_USE','STAMP_USE')+', REMARK, RCP_LINK, CD_SAWON_CHG, DT_CHANGE) '
                         +'               values (:P0, '
                         +'                       :P1, '
                         +'                       :P2, '
                         +'                       ''00'', '
                         +'                       :P3, '
                         +'                       :P4, '
                         +'                       :P5, '
                         +'                       :P6, '
                         +'                       :P7, '
                         +'                       '''', '
                         +'                       :P8, '
                         +'                        Now());',
                         [HeadStoreCode,
                          StoreCode,
                          DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                          vSeq,
                          MemberNoEdit.Text,
                          GetStrPointerData(ReasonComboBox),
                          UsePointEdit.Value,
                          RemarkEdit.Text,
                          UserCode]);
      if Result then
      begin
        SetLength(NewData, 5);
        NewData[0] := MemberNoEdit.Text;
        NewData[1] := MemberNameEdit.Text;
        NewData[2] := TypeComboBox.Text;
        NewData[3] := UsePointEdit.Value;
        NewData[4] := vSeq;
      end;
    end
    else
    begin
      Result := ExecQuery('update SL_POINT '
                         +'   set CD_MEMBER    = :P4, '
                         +'       CD_CODE      = :P5, '
                         +Format('%s = :P6, ',[Ifthen(Tag=0,'PNT_USE','STAMP_USE')])
                         +'       REMARK       = :P7, '
                         +'       CD_SAWON_CHG = :P8, '
                         +'       DT_CHANGE    = Now() '
                         +' where CD_HEAD      = :P0 '
                         +'   and CD_STORE     = :P1 '
                         +'   and YMD_OCCUR    = :P2 '
                         +'   and NO_POS       = ''00'' '
                         +'   and SEQ          = :P3;',
                         [HeadStoreCode,
                          StoreCode,
                          DtoS(ConditionToolBarFromDateEdit.CurrentDate),
                          GridTableView.DataController.Values[GridTableView.DataController.FocusedRecordIndex, GridTableViewSeq.Index],
                          MemberNoEdit.Text,
                          GetStrPointerData(UseReasonComboBox),
                          UsePointEdit.Value,
                          RemarkEdit.Text,
                          UserCode]);
      if Result then
        GridTableView.DataController.Values[IfThen((PrevRow >= 0) and (PrevRow <= GridTableView.DataController.RecordCount-1), PrevRow, GridTableView.DataController.FocusedRecordIndex), GridTableViewPoint.Index] := UsePointEdit.Value;
    end;
  end;
end;

end.
