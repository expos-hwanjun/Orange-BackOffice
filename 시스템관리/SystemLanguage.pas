unit SystemLanguage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, dxmdaset, Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers,
  cxClasses, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, Vcl.StdCtrls, cxCurrencyEdit, StrUtils,
  REST.Types, REST.Client, System.JSON, System.Hash, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  TSystemLanguageForm = class(TInheritGridEditForm)
    MenuNameLabel: TLabel;
    EnglishEdit: TcxTextEdit;
    Label8: TLabel;
    JapanseEdit: TcxTextEdit;
    VietnamensEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    KoreanEdit: TcxTextEdit;
    GridTableViewKorean: TcxGridColumn;
    ChianensEdit: TcxTextEdit;
    Label3: TLabel;
    ThaiEdit: TcxTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    IndoEdit: TcxTextEdit;
    GridTableViewEnglish: TcxGridColumn;
    GridTableViewChina: TcxGridColumn;
    GridTableViewJapan: TcxGridColumn;
    GridTableViewVietnam: TcxGridColumn;
    GridTableViewThai: TcxGridColumn;
    GridTableViewIndo: TcxGridColumn;
    Label6: TLabel;
    FrenchEdit: TcxTextEdit;
    Label7: TLabel;
    GermanEdit: TcxTextEdit;
    GridTableViewFrench: TcxGridColumn;
    GridTableViewGerman: TcxGridColumn;
    AutoRegButton: TAdvGlowButton;
    Label9: TLabel;
    ChianensBEdit: TcxTextEdit;
    GridTableViewChinaB: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure AutoRegButtonClick(Sender: TObject);
  private
    function  GetPaPago(aText:String):String;  //en, cha, jpn
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
    function  DoNew: Boolean; override;                        // 저장
  end;

var
  SystemLanguageForm: TSystemLanguageForm;

implementation
uses
  Common, DBModule, ProxyCheck, Help, Main;

{$R *.dfm}

{ TSystemLanguageForm }
procedure TSystemLanguageForm.FormCreate(Sender: TObject);
var vCode : PStrPointer;
begin
  inherited;
  ConditionToolBarComboBox.Properties.Items.Clear;
  New(vCode);
  vCode^.Data := 'en';
  ConditionToolBarComboBox.Properties.Items.AddObject('영어', TObject(vCode));
  New(vCode);
  vCode^.Data := 'zh-CN';
  ConditionToolBarComboBox.Properties.Items.AddObject('중국어', TObject(vCode));
  New(vCode);
  vCode^.Data := 'ja';
  ConditionToolBarComboBox.Properties.Items.AddObject('일본어', TObject(vCode));
  New(vCode);
  vCode^.Data := 'vi';
  ConditionToolBarComboBox.Properties.Items.AddObject('베트남어', TObject(vCode));
  New(vCode);
  vCode^.Data := 'th';
  ConditionToolBarComboBox.Properties.Items.AddObject('태국어', TObject(vCode));
  New(vCode);
  vCode^.Data := 'fr';
  ConditionToolBarComboBox.Properties.Items.AddObject('프랑스어', TObject(vCode));
  New(vCode);
  vCode^.Data := 'de';
  ConditionToolBarComboBox.Properties.Items.AddObject('독일어', TObject(vCode));
  ConditionToolBarComboBox.ItemIndex := 0;
end;

procedure TSystemLanguageForm.AutoRegButtonClick(Sender: TObject);
var vTemp, vSQL, vColum :String;
label TRADITION;
begin
  inherited;
  if not AskBox(Format('모든 메뉴명을 %s로 번역합니다',[ConditionToolBarComboBox.Text])) then Exit;

  if GetStrPointerData(ConditionToolBarComboBox) = 'en' then
    vColum := 'ENGLISH'
  else if GetStrPointerData(ConditionToolBarComboBox) = 'zh-CN' then
    vColum := 'CHINESE_SIMPLE'
  else if GetStrPointerData(ConditionToolBarComboBox) = 'ja' then
    vColum := 'JAPANESE'
  else if GetStrPointerData(ConditionToolBarComboBox) = 'vi' then
    vColum := 'VIETNAMESE'
  else if GetStrPointerData(ConditionToolBarComboBox) = 'th' then
    vColum := 'THAI'
  else if GetStrPointerData(ConditionToolBarComboBox) = 'fr' then
    vColum := 'FRENCH'
  else if GetStrPointerData(ConditionToolBarComboBox) = 'de' then
    vColum := 'GERMAN';

TRADITION:
  vSQL := '';
  if Tag = 0 then
  begin
    OpenQuery('select t.NM_MENU '
             +'  from (select NM_MENU_SHORT as NM_MENU '
             +'          from MS_MENU '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'         group by NM_MENU_SHORT '
             +'        union all '
             +'        select MENU_INFO '
             +'          from MS_MENU_IMAGE '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'         group by MENU_INFO '
             +'        union all '
             +'        select NM_COURSE '
             +'          from MS_COURSE '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'         group by NM_COURSE '
             +'        union all '
             +'        select NM_MENU_COURSE '
             +'          from MS_COURSE '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'         group by NM_MENU_COURSE '
             +'        union all '
             +'        select NM_CODE1 '
             +'          from MS_CODE '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'           and CD_KIND  = ''26'' '         //서비스 문구
             +'         group by NM_CODE1 '
             +'        union all '
             +'        select NM_LARGE '
             +'          from MS_LARGE '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'           and CD_GUBUN = ''99'' '        // 분류명
             +'         group by NM_LARGE '
             +'        union all '
             +'        select SHOPPING_CART '
             +'          from MS_STORE_ETC '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_STORE = :P1 '
             +'        ) as t '
             +' where t.NM_MENU not in (select KOREAN '
             +'                           from MS_LANGUAGES '
             +'                          where CD_HEAD  =:P0 '
             +'                            and CD_STORE =:P1 '
             +Format('and Ifnull(%s,'''') <> '''') ',[vColum]),
             [HeadStoreCode,
              StoreCode]);

    try
      Screen.Cursor := crSQLWait;
      ShowMsg('번역 중입니다... 잠시만 기다려주세요');
      while not Query.Eof do
      begin
        vTemp := GetPaPago(Query.Fields[0].AsString);
        if Trim(vTemp) <> '' then
        begin
          ExecQuery(Format('insert into MS_LANGUAGES(CD_HEAD, CD_STORE, KOREAN, %s) values (:P0,:P1,:P2,:P3) ON DUPLICATE KEY UPDATE %s = :P3;',[vColum,vColum]),
                   [HeadStoreCode,
                    Ifthen((GetStoreOption(1)<>'0') or (Tag = 1), StandardStore, StoreCode),
                    Query.Fields[0].AsString,
                    vTemp],true);
          if GridTableView.DataController.FilteredIndexByRecordIndex[GridTableView.DataController.FindRecordIndexByText(0, GridTableViewKorean.Index, Query.Fields[0].AsString, false, false, true)] < 0 then
          begin
            GridTableView.DataController.AppendRecord;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewKorean.Index] := Query.Fields[0].AsString;
          end;
        end;
        Query.Next;
      end;
      Query.Close;

      ExecQuery('update MS_LANGUAGES inner join '
               +'       (select t.NM_MENU '
               +'         from (select NM_MENU_SHORT as NM_MENU '
               +'                 from MS_MENU '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by NM_MENU_SHORT '
               +'               union all '
               +'               select MENU_INFO '
               +'                 from MS_MENU_IMAGE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by MENU_INFO '
               +'               union all '
               +'               select NM_COURSE '
               +'                 from MS_COURSE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by NM_COURSE '
               +'               union all '
               +'               select NM_MENU_COURSE '
               +'                 from MS_COURSE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by NM_MENU_COURSE '
               +'               union all '
               +'               select NM_CODE1 '
               +'                 from MS_CODE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                  and CD_KIND  = ''26'' '         //서비스 문구
               +'                group by NM_CODE1 '
               +'               union all '
               +'               select NM_LARGE '
               +'                 from MS_LARGE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                  and CD_GUBUN = ''99'' '        // 분류명
               +'                group by NM_LARGE '
               +'               union all '
               +'               select SHOPPING_CART '
               +'                 from MS_STORE_ETC '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'               ) as t'
               +'        ) as m on m.NM_MENU = MS_LANGUAGES.KOREAN '
               +'   set MS_LANGUAGES.DS_TEXT = ''M'' '
               +' where MS_LANGUAGES.CD_HEAD  =:P0 '
               +'   and MS_LANGUAGES.CD_STORE =:P1; ',
               [HeadStoreCode,
                StoreCode],true);


      ShowMsg('');
      Application.ProcessMessages;
    finally
      Screen.Cursor := crDefault;
    end;
    if vColum = 'CHINESE_SIMPLE' then
    begin
      vColum := 'CHINESE_TRADITION';
      goto TRADITION;
    end;

    if GetStoreOption(9) = '1' then
    begin
      LetsOrderSync('language');
      ExecQuery('delete from LETSORDER_SYNC '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and NM_TABLE = ''MS_LANGUAGES''; '
               +'delete from LETSORDER_DELETE '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and NM_TABLE = ''MS_LANGUAGES''; ',
               [HeadStoreCode,
                StoreCode],true);
    end;
  end
  else if Tag = 1 then
  begin
    OpenQuery('select t.NM_MENU '
             +'  from (select NM_MENU_SHORT as NM_MENU '
             +'          from MS_MENU '
             +'         where CD_HEAD  = :P0 '
             +'         group by NM_MENU_SHORT '
             +'        union all '
             +'        select MENU_INFO '
             +'          from MS_MENU_IMAGE '
             +'         where CD_HEAD  = :P0 '
             +'         group by MENU_INFO '
             +'        union all '
             +'        select NM_COURSE '
             +'          from MS_COURSE '
             +'         where CD_HEAD  = :P0 '
             +'         group by NM_COURSE '
             +'        union all '
             +'        select NM_MENU_COURSE '
             +'          from MS_COURSE '
             +'         where CD_HEAD  = :P0 '
             +'         group by NM_MENU_COURSE '
             +'        union all '
             +'        select NM_CODE1 '
             +'          from MS_CODE '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_KIND  = ''26'' '         //서비스 문구
             +'         group by NM_CODE1 '
             +'        union all '
             +'        select NM_LARGE '
             +'          from MS_LARGE '
             +'         where CD_HEAD  = :P0 '
             +'           and CD_GUBUN = ''99'' '        // 분류명
             +'         group by NM_LARGE '
             +'        ) as t '
             +' where t.NM_MENU not in (select KOREAN '
             +'                           from MS_LANGUAGES '
             +'                          where CD_HEAD  =:P0 '
             +'                            and CD_STORE =:P1 '
             +Format('and Ifnull(%s,'''') <> '''') ',[vColum]),
             [HeadStoreCode,
              StandardStore]);

    try
      Screen.Cursor := crSQLWait;
      ShowMsg('번역 중입니다... 잠시만 기다려주세요');
      while not Query.Eof do
      begin
        vTemp := GetPaPago(Query.Fields[0].AsString);
        if Trim(vTemp) <> '' then
        begin
          ExecQuery(Format('insert into MS_LANGUAGES(CD_HEAD, CD_STORE, KOREAN, %s) '// values (:P0,:P1,:P2,:P3) ON DUPLICATE KEY UPDATE %s = :P3;',[vColum,vColum]),
                          +'                  select CD_HEAD, '
                          +'                         CD_STORE, '
                          +'                         ''%s'', '
                          +'                         ''%s'' '
                          +'                    from MS_STORE '
                          +'                   where CD_HEAD =''%s'' '
                          +'on duplicate key update %s = ''%s'' ',[vColum,Query.Fields[0].AsString,HeadStoreCode,vTemp,vColum,vTemp]),
                          [],true);
          if GridTableView.DataController.FilteredIndexByRecordIndex[GridTableView.DataController.FindRecordIndexByText(0, GridTableViewKorean.Index, Query.Fields[0].AsString, false, false, true)] < 0 then
          begin
            GridTableView.DataController.AppendRecord;
            GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, GridTableViewKorean.Index] := Query.Fields[0].AsString;
          end;
        end;
        Query.Next;
      end;
      Query.Close;

      ExecQuery('update MS_LANGUAGES inner join '
               +'       (select t.NM_MENU '
               +'         from (select NM_MENU_SHORT as NM_MENU '
               +'                 from MS_MENU '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by NM_MENU_SHORT '
               +'               union all '
               +'               select MENU_INFO '
               +'                 from MS_MENU_IMAGE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by MENU_INFO '
               +'               union all '
               +'               select NM_COURSE '
               +'                 from MS_COURSE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by NM_COURSE '
               +'               union all '
               +'               select NM_MENU_COURSE '
               +'                 from MS_COURSE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                group by NM_MENU_COURSE '
               +'               union all '
               +'               select NM_CODE1 '
               +'                 from MS_CODE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                  and CD_KIND  = ''26'' '         //서비스 문구
               +'                group by NM_CODE1 '
               +'               union all '
               +'               select NM_LARGE '
               +'                 from MS_LARGE '
               +'                where CD_HEAD  = :P0 '
               +'                  and CD_STORE = :P1 '
               +'                  and CD_GUBUN = ''99'' '        // 분류명
               +'                group by NM_LARGE '
               +'               ) as t'
               +'        ) as m on m.NM_MENU = MS_LANGUAGES.KOREAN '
               +'   set MS_LANGUAGES.DS_TEXT = ''M'' '
               +' where MS_LANGUAGES.CD_HEAD  =:P0;',
               [HeadStoreCode,
                StandardStore],true);


      ShowMsg('');
      Application.ProcessMessages;
    finally
      Screen.Cursor := crDefault;
    end;
    if vColum = 'CHINESE_SIMPLE' then
    begin
      vColum := 'CHINESE_TRADITION';
      goto TRADITION;
    end;
  end;

  ButtonToolBarSearchButtonClick(nil);
end;

function TSystemLanguageForm.DoDelete: Boolean;
begin
  Result := ExecQuery('delete from MS_LANGUAGES '
                     +' where CD_HEAD =:P0 '
                     +'   and CD_STORE=:P1 '
                     +'   and KOREAN  =:P2;',
                     [HeadStoreCode,
                      Ifthen((GetStoreOption(1)<>'0') or (Tag = 1), StandardStore, StoreCode),
                      GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewKorean.Index]],true);
end;

procedure TSystemLanguageForm.DoGridLink;
begin
  inherited;
  KoreanEdit.Properties.ReadOnly := true;
  KoreanEdit.Text            := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewKorean.Index];
  EnglishEdit.Text           := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewEnglish.Index];
  ChianensEdit.Text          := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewChina.Index];
  JapanseEdit.Text           := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewJapan.Index];
  VietnamensEdit.Text        := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewVietnam.Index];
  ThaiEdit.Text              := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewThai.Index];
  IndoEdit.Text              := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewIndo.Index];
  FrenchEdit.Text            := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewFrench.Index];
  GermanEdit.Text            := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewGerman.Index];
  ChianensBEdit.Text         := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewChinaB.Index];
end;

function TSystemLanguageForm.DoNew: Boolean;
begin
  MainPanel.Enabled := true;
  KoreanEdit.Properties.ReadOnly := false;
  KoreanEdit.SetFocus;
end;

function TSystemLanguageForm.DoSave: Boolean;
begin
  if isNew then
  begin
    if Tag = 0 then
      ExecQuery('insert into MS_LANGUAGES(CD_HEAD, '
               +'                         CD_STORE, '
               +'                         KOREAN, '
               +'                         ENGLISH, '
               +'                         CHINESE_SIMPLE, '
               +'                         JAPANESE, '
               +'                         VIETNAMESE, '
               +'                         THAI, '
               +'                         INDONESIAN, '
               +'                         FRENCH, '
               +'                         GERMAN, '
               +'                         CHINESE_TRADITION) '
               +'                 values(:P0, '
               +'                        :P1, '
               +'                        :P2, '
               +'                        :P3, '
               +'                        :P4, '
               +'                        :P5, '
               +'                        :P6, '
               +'                        :P7, '
               +'                        :P8, '
               +'                        :P9, '
               +'                        :P10, '
               +'                        :P11) '
               +'on duplicate key update '
               +'       ENGLISH           = :P3, '
               +'       CHINESE_SIMPLE    = :P4, '
               +'       JAPANESE          = :P5, '
               +'       VIETNAMESE        = :P6, '
               +'       THAI              = :P7, '
               +'       INDONESIAN        = :P8, '
               +'       FRENCH            = :P9, '
               +'       GERMAN            = :P10, '
               +'       CHINESE_TRADITION = :P11;',
               [HeadStoreCode,
                Ifthen(Tag = 1, StandardStore, StoreCode),
                KoreanEdit.Text,
                EnglishEdit.Text,
                ChianensEdit.Text,
                JapanseEdit.Text,
                VietnamensEdit.Text,
                ThaiEdit.Text,
                IndoEdit.Text,
                FrenchEdit.Text,
                GermanEdit.Text,
                ChianensBEdit.Text],true)
    else
      ExecQuery('insert into MS_LANGUAGES(CD_HEAD, '
               +'                         CD_STORE, '
               +'                         KOREAN, '
               +'                         ENGLISH, '
               +'                         CHINESE_SIMPLE, '
               +'                         JAPANESE, '
               +'                         VIETNAMESE, '
               +'                         THAI, '
               +'                         INDONESIAN, '
               +'                         FRENCH, '
               +'                         GERMAN, '
               +'                         CHINESE_TRADITION) '
               +'                 select  CD_HEAD, '
               +'                         CD_STORE, '
               +'                        :P1, '
               +'                        :P2, '
               +'                        :P3, '
               +'                        :P4, '
               +'                        :P5, '
               +'                        :P6, '
               +'                        :P7, '
               +'                        :P8, '
               +'                        :P9, '
               +'                        :P10 '
               +'                   from MS_STORE '
               +'                  where CD_HEAD = :P0 '
               +'on duplicate key update '
               +'       ENGLISH           = :P2, '
               +'       CHINESE_SIMPLE    = :P3, '
               +'       JAPANESE          = :P4, '
               +'       VIETNAMESE        = :P5, '
               +'       THAI              = :P6, '
               +'       INDONESIAN        = :P7, '
               +'       FRENCH            = :P8, '
               +'       GERMAN            = :P9, '
               +'       CHINESE_TRADITION = :P10;',
               [HeadStoreCode,
                KoreanEdit.Text,
                EnglishEdit.Text,
                ChianensEdit.Text,
                JapanseEdit.Text,
                VietnamensEdit.Text,
                ThaiEdit.Text,
                IndoEdit.Text,
                FrenchEdit.Text,
                GermanEdit.Text,
                ChianensBEdit.Text],true);
  end
  else
  begin
    if Tag = 0 then
      Result := ExecQuery('update MS_LANGUAGES '
                         +'   set ENGLISH           = :P3, '
                         +'       CHINESE_SIMPLE    = :P4, '
                         +'       JAPANESE          = :P5, '
                         +'       VIETNAMESE        = :P6, '
                         +'       THAI              = :P7, '
                         +'       INDONESIAN        = :P8, '
                         +'       FRENCH            = :P9, '
                         +'       GERMAN            = :P10, '
                         +'       CHINESE_TRADITION = :P11 '
                         +' where CD_HEAD  =:P0 '
                         +'   and CD_STORE =:P1 '
                         +'   and KOREAN   =:P2;',
                         [HeadStoreCode,
                          Ifthen(Tag = 1, StandardStore, StoreCode),
                          KoreanEdit.Text,
                          EnglishEdit.Text,
                          ChianensEdit.Text,
                          JapanseEdit.Text,
                          VietnamensEdit.Text,
                          ThaiEdit.Text,
                          IndoEdit.Text,
                          FrenchEdit.Text,
                          GermanEdit.Text,
                          ChianensBEdit.Text],true)
    else
      ExecQuery('insert into MS_LANGUAGES(CD_HEAD, '
               +'                         CD_STORE, '
               +'                         KOREAN, '
               +'                         ENGLISH, '
               +'                         CHINESE_SIMPLE, '
               +'                         JAPANESE, '
               +'                         VIETNAMESE, '
               +'                         THAI, '
               +'                         INDONESIAN, '
               +'                         FRENCH, '
               +'                         GERMAN, '
               +'                         CHINESE_TRADITION) '
               +'                 select  CD_HEAD, '
               +'                         CD_STORE, '
               +'                        :P1, '
               +'                        :P2, '
               +'                        :P3, '
               +'                        :P4, '
               +'                        :P5, '
               +'                        :P6, '
               +'                        :P7, '
               +'                        :P8, '
               +'                        :P9, '
               +'                        :P10 '
               +'                   from MS_STORE '
               +'                  where CD_HEAD = :P0 '
               +'on duplicate key update '
               +'       ENGLISH           = :P2, '
               +'       CHINESE_SIMPLE    = :P3, '
               +'       JAPANESE          = :P4, '
               +'       VIETNAMESE        = :P5, '
               +'       THAI              = :P6, '
               +'       INDONESIAN        = :P7, '
               +'       FRENCH            = :P8, '
               +'       GERMAN            = :P9, '
               +'       CHINESE_TRADITION = :P10;',
               [HeadStoreCode,
                KoreanEdit.Text,
                EnglishEdit.Text,
                ChianensEdit.Text,
                JapanseEdit.Text,
                VietnamensEdit.Text,
                ThaiEdit.Text,
                IndoEdit.Text,
                FrenchEdit.Text,
                GermanEdit.Text,
                ChianensBEdit.Text],true);
  end;
end;

function TSystemLanguageForm.DoSearch: Boolean;
begin
  Result := OpenQueryEx('select KOREAN, '
                       +'       ENGLISH, '
                       +'       CHINESE_SIMPLE, '
                       +'       JAPANESE, '
                       +'       VIETNAMESE, '
                       +'       THAI, '
                       +'       INDONESIAN, '
                       +'       FRENCH, '
                       +'       GERMAN, '
                       +'       CHINESE_TRADITION '
                       +'  from MS_LANGUAGES '
                       +' where CD_HEAD    =:P0 '
                       +'   and CD_STORE   =:P1 '
                       +'   and KOREAN Like :P2 '
                       +' order by KOREAN ',
                       [HeadStoreCode,
                        Ifthen(Tag = 1, StandardStore, StoreCode),
                        '%'+ConditionToolBarEdit.Text+'%'],GridTableView);
end;

function TSystemLanguageForm.GetPaPago(aText: String): String;
var vRestClient   :TRestClient;
    vRestRequest  :TRestRequest;
    vRESTResponse :TRESTResponse;
    vJSONObject   :TJSONObject;
    vJsonArray    :TJSONArray;
    vJsonData     : TJSONValue;
    vParam        :TStringList;
    vData, vSQL, vSQL2, vTemp         :String;
begin
  Result := '';
  if Trim(aText) = '' then Exit;

  try
    BlockInput(false);
    vRestClient                := TRestClient.Create(nil);
    vRestRequest               := TRestRequest.Create(nil);
    vRESTResponse              := TRESTResponse.Create(vRestRequest);
    vRestRequest.Client        := vRestClient;
    vRestRequest.Response      := vRESTResponse;
    vRestClient.BaseURL        := 'https://papago.apigw.ntruss.com/nmt/v1/translation';
    vRestClient.ContentType    := 'application/x-www-form-urlencoded; charset=UTF-8;';
    vRestRequest.Accept        := 'application/json';
    vRestRequest.AcceptCharset := 'UTF-8';
    vRestRequest.Method        := TRESTRequestMethod.rmPOST;
    vRestRequest.Params.AddHeader('X-NCP-APIGW-API-KEY-ID', 'suozss7cpc');
    vRestRequest.Params.AddHeader('X-NCP-APIGW-API-KEY','2XYN1guq9qFUykHJXIbdMMsFgnNEn3MWjBqgnEjX');


    vJSONObject    := TJSONObject.Create;
    vJSONObject.AddPair('source',    TJSONString.Create('ko'));
    vJSONObject.AddPair('target',    TJSONString.Create(GetStrPointerData(ConditionToolBarComboBox)));

    vJSONObject.AddPair('text',      TJSONString.Create(aText));
    vRESTRequest.AddBody(vJSONObject.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
    try
      vRESTRequest.Execute;
    except
      Result := '';
      Exit;
    end;

    if vRestRequest.Response.StatusCode <> 200 then
      Exit;

    vData := vRESTResponse.Content;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('message').ToJson;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    vData := vJSONObject.GetValue('result').ToJson;
    vJSONObject := TJSONObject.ParseJSONValue( vData ) as TJSONObject;
    Result := vJSONObject.GetValue('translatedText').Value;

    FreeAndNil(vJSONObject);
  finally
    vRestClient.Disconnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;

end;

end.
