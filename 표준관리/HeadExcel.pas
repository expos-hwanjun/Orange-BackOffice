// Excel 불러오기 (완료)

//##### 제약조건 처리(글자수제한, 상품코드체크, Y/N체크 등) 모든 조건 여기서 처리해야 함

unit HeadExcel;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InheritEdit, cxGraphics, cxContainer, cxEdit, UniProvider, StrUtils,
  SQLServerUniProvider, Uni, DB, MemDS, cxButtonEdit, cxDropDownEdit,
  cxLabel, cxControls, cxTextEdit, cxMaskEdit, cxCalendar, AdvGlowButton, Math,
  AdvToolBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, tmsXLSAdapter, cxCurrencyEdit, ExtCtrls,
  AdvToolBarStylers, cxLookAndFeels, cxLookAndFeelPainters, DBAccess,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, dxmdaset, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, cxCheckBox, dxDateRanges,
  dxScrollbarAnnotations, AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel,
  AdvOfficePager, AdvOfficePagerStylers;

type
  THeadExcelForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    ConditionComboBox: TcxComboBox;
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    MenuLength :Integer;
    MenuPrefix :String;
  protected
    function  DoSearch: Boolean; override;  // 조회
    function  DoSave  : Boolean; override;  // 저장
  end;

var
  HeadExcelForm: THeadExcelForm;



implementation

uses
  Common, ExcelLoad, DBModule, ProxyCheck;

{$R *.dfm}

procedure THeadExcelForm.FormCreate(Sender: TObject);
begin
  inherited;

  try
    OpenQuery('select SELFMENU_LEN, '
             +'       SELFMENU_PREFIX '
             +'  from MS_STORE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 ',
             [HeadStoreCode,
              StandardStore]);
    if not Query.Eof then
    begin
      MenuLength := Query.FieldByName('SELFMENU_LEN').AsInteger;
      MenuPrefix := Query.FieldByName('SELFMENU_PREFIX').AsString;
    end;
  finally
    FinishQuery;
  end;
end;

procedure THeadExcelForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 상품마스터 등록 시만 등록 조건을 표시한다
procedure THeadExcelForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ConditionComboBox.Visible := ConditionToolBarComboBox.ItemIndex = 2;
end;

procedure THeadExcelForm.ConditionToolBarComboBoxPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
end;
//------------------------------------------------------------------------------
// 조회 버튼
procedure THeadExcelForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  with TProxyCheckForm.Create(self) do
    try
      isExtremePosCheck := true;
      if ShowModal <> mrOK then
        Exit;
    finally
      Free;
    end;

  inherited;

  // 불러온 자료가 있으면 변경된 자료가 있는 것으로 본다
  isChanged := GridTableView.DataController.RecordCount > 0;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회 버튼
function THeadExcelForm.DoSearch: Boolean;
var
  vName      : array of string;
  vNotNull   : array of Boolean;
  vRemark    : array of string;
  vIndex     : Integer;
  vXLSAdapter: TXLSAdapter;
  vXLSFile   : TXLSFile;
  vCol       : Integer;
  vColIndex  : Integer;
  vGoodsCode : String;
  vErrGoodsCount :Integer;
  vStringList :TStringList;
  vCompCode,
  vURL    :String;
begin
  Result := false;
  // 입력하지 않은 조건 확인
  if ConditionToolBarComboBox.ItemIndex = -1 then
  begin
    ErrBox(ConditionToolBarEditLabel.Caption+msgMustInput);
    Exit;
  end;

  try
    GridTableView.DataController.RecordCount := 0;
    GridTableView.ClearItems;

    // 기본 칼럼 생성
    case ConditionToolBarComboBox.ItemIndex of
      0 : // 상품마스터
          begin
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '메뉴코드';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 14; // 칼럼 크기
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Editing := false;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.Columns[GridTableView.ColumnCount-1].FooterAlignmentHorz := taRightJustify;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '메뉴이름';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '규격';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 30;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '메뉴구분';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 60;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 1;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.Columns[GridTableView.ColumnCount-1].DataBinding.FieldName := 'N:일반,W:저울,G:싯가,S:세트,C:코스,P:그룹';
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '매입단가';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '판매단가';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '과세';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 60;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 1;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz   := taCenter;
            GridTableView.Columns[GridTableView.ColumnCount-1].DataBinding.FieldName := '0:면세,1:포함';
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '분류코드';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 90;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 8;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '매입처코드';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 6;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '주방프린터';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;

            // 상품코드가 없을 때 자체코드를 생성한다
            OpenQuery('select CD_MENU '
                     +'  from MS_MENU '
                     +' where CD_HEAD         = :P0 '
                     +'   and CD_STORE        = :P1 '
                     +'   and Left(CD_MENU,2) = :P2 '
                     +'   and Length(CD_MENU) = :P3 '
                     +' order by CD_MENU desc '
                     +' limit 1 ',
                     [HeadStoreCode,
                      StandardStore,
                      SelfGoodsPrefix,
                      SelfGoodsLength]);
            if  not Query.Eof then
              vGoodsCode := Query.Fields[0].AsString
            else
              vGoodsCode := EmptyStr;

            FinishQuery;
            if vGoodsCode = EmptyStr then
              vGoodsCode := RPad(SelfGoodsPrefix, SelfGoodsLength, '0');
            vGoodsCode := GetBarcode(RPad(FloatToStr(StoF(Copy(vGoodsCode, 1, SelfGoodsLength-1))+1), SelfGoodsLength, '0'));
          end;

      1 : // 상품분류
          begin
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '분류코드';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 8;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Editing := false;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.Columns[GridTableView.ColumnCount-1].FooterAlignmentHorz := taRightJustify;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '분류이름';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 200;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 30;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
          end;
      2 : // 회원
          begin
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '회원번호';                                           //0
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 10;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Editing := false;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.Columns[GridTableView.ColumnCount-1].FooterAlignmentHorz := taRightJustify;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '회원이름';                                            //1
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 20;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;                                                                                          //2
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '회원구분';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 3;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '휴대폰번호';                                          //3
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 13;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '가입매장';                                           //4
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 8;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '카드번호';                                           //5
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 20;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '식별번호';                                           //6
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 20;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '주소(읍면동까지)';                                   //7
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 60;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;                                                                                         //8
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '주소(번지,건물)';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 60;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '남자(Y/N)';                                          //9
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := -1;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '주민번호';                                          //10
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 14;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '생년월일';                                         //11
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 8;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '양력(Y/N)';                                        //12
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := -1;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '가입일';                                         //13
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 10;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := 'E-Mail';                                         //14
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 40;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '문자수신(Y/N)';                                  //15
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := -1;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '동의일자';                                       //16
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 10;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '최종방문일';                                     //17
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 10;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '총방문횟수';                                    //18
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;                                                                                   //19
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '총구매금액';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '포인트';                                        //20
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '스탬프';                                       //21
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
          end;
    end;
  except
  end;
  TcxGridTableSummaryItem(GridTableView.DataController.Summary.FooterSummaryItems[0]).Column := GridTableView.Columns[0];


  BlockInput(false);
  vErrGoodsCount := 0;
  // Excel 필드 연결 폼을 보여준다
  with TExcelLoadForm.Create(self) do
    try
      SetLength(vName,    GridTableView.ColumnCount);
      SetLength(vNotNull, GridTableView.ColumnCount);
      SetLength(vRemark,  GridTableView.ColumnCount);
      for vIndex := 0 to GridTableView.ColumnCount-1 do
      begin
        vName[vIndex]    := GridTableView.Columns[vIndex].Caption;
        vNotNull[vIndex] := vIndex < 2;
        vRemark[vIndex]  := GridTableView.Columns[vIndex].DataBinding.FieldName;
      end;

      if SetColumn(vName, vNotNull, vRemark) then
        if ShowModal = mrOK then
        begin
          // 엑셀 파일을 읽어 그리드에 넣는다
          vXLSAdapter := TXLSAdapter.Create(self);
          vXLSFile    := TXLSFile.Create(vXLSAdapter);
          vXLSFile.Connect;
          vXLSFile.OpenFile(ExcelFileEdit.Text);
          try
            isLoading := true;
            GridTableView.BeginUpdate;
            GridTableView.DataController.RecordCount := 0;

            vIndex := 2;
            while True do
            begin
              if Trim(string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex])) = '' then
                Break
              else if (ConditionToolBarComboBox.ItemIndex = 0) and (Length(Trim(string(vXLSFile.CellValue[vIndex, ColumnComboBox[0].ItemIndex]))) < 4) then
              begin
                Inc(vIndex);
                Inc(vErrGoodsCount);
                Continue;
              end
              else
              begin
                vColIndex := 0;
                try
                  GridTableView.DataController.AppendRecord;
                  for vCol := 0 to GridTableView.ColumnCount-1 do
                  begin
                    vColIndex := vCol;  // 예외처리용
                    if ColumnComboBox[vCol].ItemIndex > 0 then
                    begin
                      if GridTableView.Columns[vCol].Tag > 0 then      // string (Length)
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol]   := CopyStr(vXLSFile.CellValue[vIndex, ColumnComboBox[vCol].ItemIndex], 1, GridTableView.Columns[vCol].Tag)
                      else if GridTableView.Columns[vCol].Tag < 0 then // Boolean (Y/N)
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol]   := IfThen(UpperCase(vXLSFile.CellValue[vIndex, ColumnComboBox[vCol].ItemIndex]) = 'N', 'N', 'Y')
                      else                                             // Integer
                        try
                          GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := Ifthen(vXLSFile.CellValue[vIndex, ColumnComboBox[vCol].ItemIndex] = null, 0, Integer(vXLSFile.CellValue[vIndex, ColumnComboBox[vCol].ItemIndex]));
                        except
                          GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := 0;
                        end;
                    end
                    else if GridTableView.Columns[vCol].Tag = 0 then
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := 0
                    else
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := EmptyStr;
                    //자체상품일때 체크비트를 붙인다
                    if (ConditionToolBarComboBox.ItemIndex = 0) and (vCol = 0) and (GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] = '00000000') then
                    begin
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := vGoodsCode;
                      vGoodsCode := GetBarcode(RPad(FloatToStr(StoF(Copy(vGoodsCode, 1, SelfGoodsLength-1))+1), SelfGoodsLength, '0'));
                    end
                    //상품불러오기에서 저울상품일때
                    else if (ConditionToolBarComboBox.ItemIndex = 0) and (vCol = 3) and (GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] = 'W') then
                    begin
                      //프리픽스가 같이 있을때
                      if Length(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0]) = ScaleCodeLength+2 then
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := RightStr(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0],4)
                        //프리픽스가 없을때
                      else if Length(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0]) = ScaleCodeLength then
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0] := GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, 0]
                      else
                      begin
                        GridTableView.DataController.DeleteRecord(GridTableView.DataController.RecordCount-1);
                        Inc(vErrGoodsCount);
                      end;
                    end
                    //메뉴구분
                    else if (ConditionToolBarComboBox.ItemIndex = 0) and (vCol = 3) then
                    begin
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := UpperCase(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol]);
                      if (GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol]=EmptyStr) or ((GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] <> '') and not (UpperCase(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol])[1] in ['N','W','O','G','S','C','I','P'])) then
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := 'N';
                    end
                    else if (ConditionToolBarComboBox.ItemIndex = 2) and (vCol = 0) then
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := LPad(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol], 10,'0');

                  end;
                  GridTableView.DataController.Post;
                except
                  ErrBox('엑셀 파일을 불러올 수 없습니다.'#13'엑셀 칼럼을 잘못 지정했거나, 엑셀 파일에 잘못된 값이 들어 있는 것 같습니다.'#13#13
                        +'에러 줄(레코드) : '+IntToStr(vIndex)+#13
                        +'에러 칸(칼럼) : '+GridTableView.Columns[vColIndex].Caption);
                  Exit;
                end;
              end;
              Inc(vIndex);
            end;

            Result := GridTableView.DataController.RecordCount > 0;
          finally
            vXLSFile.Disconnect;
            vXLSFile.Free;
            vXLSAdapter.Free;

            isLoading := false;
            GridTableView.EndUpdate;
            if Result and (vErrGoodsCount > 0) then
              MsgBox(Format('자리수가 맞지 않는 메뉴 %s 개가 제외되었습니다',[IntToStr(vErrGoodsCount)]));
          end;
        end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------
// 저장 버튼
function THeadExcelForm.DoSave: Boolean;
const
  fmtEmptyRecord = '%s이(가) 없는 레코드가 있습니다.';
var
  vRow, vCol  : Integer;
  vExists: Boolean;
  vDate : string;
  vSeq        : Integer;
  vStringList :TStringList;
  vIndex, vIndex2 :Integer;
  vCount : Integer;
  vSQLList  :TStringList;
  vSQLList1 :TStringList;
  vTempSQL    :String;
  vTempSQL1   :String;
  vSQLEtc     :String;
  vDeleteMemberCode :String;
  vMenuList :TStringList;
begin
  Result       := false;
  SetWorkStoreList;

  if (ConditionToolBarComboBox.ItemIndex = -1) or (GridTableView.ColumnCount = 0) then
  begin
    ErrBox(ConditionToolBarEditLabel.Caption+msgMustInput);
    Exit;
  end;

  vDate      := DtoS(Date);
  vMenuList := TStringList.Create;
  if ConditionToolBarComboBox.ItemIndex = 0 then
  begin
    OpenQuery('select CD_STORE, CD_MENU '
             +'  from MS_MENU '
             +' where CD_HEAD   = :P0 ',
              [HeadStoreCode]);
    try
      vMenuList.Clear;
      while not Query.Eof do
      begin
        vMenuList.Add(Format('%s-%s',[Query.Fields[0].AsString, Query.Fields[1].AsString]));
        Query.Next;
      end;
    finally
      FinishQuery;
    end;
  end;

  //포인트 적립 순번
  if ConditionToolBarComboBox.ItemIndex = 2 then
  begin
    OpenQuery('select IfNull(Max(SEQ),0) as SEQ '
             +'  from SL_POINT '
             +' where CD_HEAD   = :P0 '
             +'   and CD_STORE  = :P1 '
             +'   and YMD_OCCUR = :P2 '
             +'   and NO_POS    = ''00'' ',
              [HeadStoreCode,
               StandardStore,
               vDate]);
    try
      if Query.Eof then
        vSeq := 0
      else
        vSeq := Query.Fields[0].AsInteger;
    finally
      FinishQuery;
    end;
  end;

  // 기본값을 넣어주고 에러를 체크한다
  GridTableView.BeginUpdate;
  try
    for vRow := 0 to GridTableView.DataController.RecordCount-1 do
      case ConditionToolBarComboBox.ItemIndex of
        0 : // 상품마스터
            begin
              if GridTableView.DataController.Values[vRow, 0] = null then
              begin
                ErrBox(Format(fmtEmptyRecord, [GridTableView.Columns[0].Caption]));
                Exit;
              end;
              if GridTableView.DataController.Values[vRow, 1] = null then
              begin
                ErrBox(Format(fmtEmptyRecord, [GridTableView.Columns[1].Caption]));
                Exit;
              end;
              // 메뉴구분
              if (Nvl(GridTableView.DataController.Values[vRow, 3], EmptyStr) = EmptyStr) then
                GridTableView.DataController.Values[vRow, 3] := 'N';
              // 과세
              if (GridTableView.DataController.Values[vRow, 6] = null) or ((GridTableView.DataController.Values[vRow, 6] <> '0') and (GridTableView.DataController.Values[vRow, 6] <> '1') and (GridTableView.DataController.Values[vRow, 6] <> '2')) then
                GridTableView.DataController.Values[vRow, 6] := '1';
            end;

        1 : // 상품분류
            begin
              if GridTableView.DataController.Values[vRow, 0] = null then
              begin
                ErrBox(Format(fmtEmptyRecord, [GridTableView.Columns[0].Caption]));
                Exit;
              end;
              if GridTableView.DataController.Values[vRow, 1] = null then
              begin
                ErrBox(Format(fmtEmptyRecord, [GridTableView.Columns[1].Caption]));
                Exit;
              end;
            end;

        2 : // 회원
            begin
              if GridTableView.DataController.Values[vRow, 0] = null then
              begin
                ErrBox(Format(fmtEmptyRecord, [GridTableView.Columns[0].Caption]));
                Exit;
              end;
              if GridTableView.DataController.Values[vRow, 1] = null then
              begin
                ErrBox(Format(fmtEmptyRecord, [GridTableView.Columns[1].Caption]));
                Exit;
              end;
              // 회원구분
              if (Nvl(GridTableView.DataController.Values[vRow, 2], EmptyStr) = EmptyStr) then
                GridTableView.DataController.Values[vRow, 2] := '001';
            end;
      end;
  finally
    GridTableView.EndUpdate;
  end;

  // DB에 저장한다
  try
    if ConditionToolBarComboBox.ItemIndex in [0,1] then
    begin
      if not AskBox(Format('정말 %s 자료를 모두 지우시겠습니까?', [ConditionToolBarComboBox.Text])) then
        Exit;
    end;

    //회원일때 기존자료 모두 지운다고 했을때 매출내역이 있는지 체크한다
    if (ConditionToolBarComboBox.ItemIndex = 2) then
    begin

      if (ConditionComboBox.ItemIndex = 0) and not AskBox('현재 회원 자료를 모두 지우시겠습니까?') then
      begin
        try
          OpenQuery('select exists(select *'
                   +'                from SL_SALE_H '
                   +'               where CD_HEAD   =:P0 '
                   +'                 and CD_MEMBER <>'''') ',
                   [HeadStoreCode]);

          if Query.Fields[0].AsInteger > 0 then
          begin
            if not AskBox('회원매출이 있습니다'#13'그래도 삭제하시겠습니까?') then
            Exit;
          end;
        finally
          FinishQuery;
        end;
      end
      else if (ConditionComboBox.ItemIndex <> 0) then
        Exit;

      if ConditionComboBox.ItemIndex = 1 then
      begin
        try
          OpenQuery('select CD_MEMBER '
                   +'  from MS_MEMBER '
                   +' where CD_HEAD   =:P0 '
                   +'   and CD_STORE  =:P1 ',
                   [HeadStoreCode,
                    StandardStore]);

          GridTableView.DataController.BeginUpdate;
          while not Query.Eof do
          begin
            for vRow := GridTableView.DataController.RecordCount-1 downto 0 do
            begin
              if GridTableView.DataController.Values[vRow, 0] = Query.Fields[0].AsString then
                GridTableView.DataController.DeleteRecord(vRow);
            end;
            Query.Next;
          end;
          GridTableView.DataController.EndUpdate;
        finally
          FinishQuery;
        end;
      end;
    end;

    Screen.Cursor := crHourGlass;

    // 기존 자료를 삭제한다
    case ConditionToolBarComboBox.ItemIndex of
      0 : // 상품마스터
          begin
            ExecQuery('delete from MS_MENU '
                     +' where CD_HEAD  =:P0 '
                     +'   and Length(CD_MENU)  =:P1 '
                     +'   and Left(CD_MENU,2)  =:P2;',
                      [HeadStoreCode,
                       MenuLength,
                       MenuPrefix], false);
            ExecQuery('delete from MS_MENU_HIST '
                     +' where CD_HEAD  =:P0 '
                     +'   and Length(CD_MENU)  =:P1 '
                     +'   and Left(CD_MENU,2)  =:P2;',
                      [HeadStoreCode,
                       MenuLength,
                       MenuPrefix], false);
            ExecQuery('delete from MS_MENU_SET '
                     +' where CD_HEAD  =:P0 '
                     +'   and Length(CD_MENU)  =:P1 '
                     +'   and Left(CD_MENU,2)  =:P2;',
                      [HeadStoreCode,
                       MenuLength,
                       MenuPrefix], false);
            ExecQuery('delete from MS_COURSE '
                     +' where CD_HEAD  =:P0 '
                     +'   and Length(CD_MENU)  =:P1 '
                     +'   and Left(CD_MENU,2)  =:P2;',
                      [HeadStoreCode,
                       MenuLength,
                       MenuPrefix], false);
            ExecQuery('delete from MS_MENU_MEMO '
                     +' where CD_HEAD  =:P0 '
                     +'   and Length(CD_MENU)  =:P1 '
                     +'   and Left(CD_MENU,2)  =:P2;',
                      [HeadStoreCode,
                       MenuLength,
                       MenuPrefix], false);
            ExecQuery('delete from MS_MENU_OPEN '
                     +' where CD_HEAD  =:P0 '
                     +'   and Length(CD_MENU)  =:P1 '
                     +'   and Left(CD_MENU,2)  =:P2;',
                      [HeadStoreCode,
                       MenuLength,
                       MenuPrefix], false);
            ExecQuery('delete from SL_STOCK_MONTH '
                     +' where CD_HEAD  =:P0;',
                      [HeadStoreCode], false);
            ExecQuery('delete from MS_SMALL '
                     +' where CD_HEAD  =:P0 '
                     +'   and Length(CD_MENU)  =:P1 '
                     +'   and Left(CD_MENU,2)  =:P2;',
                      [HeadStoreCode,
                       MenuLength,
                       MenuPrefix], true);
          end;
      1 : // 상품분류
          begin
            ExecQuery('delete from MS_MENU_CLASS '
                     +' where CD_HEAD  =:P0; ',
                      [HeadStoreCode], true);
          end;
      2 : // 회원
          begin
            if ConditionComboBox.ItemIndex = 0 then
            begin
              ExecQuery('delete from SL_POINT '
                       +' where CD_HEAD  =:P0;',
//                       +'   and CD_STORE =:P1;',
                       [HeadStoreCode,
                        StandardStore], false);

              ExecQuery('delete from MS_MEMBER '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                       [HeadStoreCode,
                        StandardStore], false);

              ExecQuery('delete from MS_MEMBER_ETC '
                       +' where CD_HEAD  =:P0;',
//                       +'   and CD_STORE =:P1;',
                       [HeadStoreCode,
                        StandardStore], false);

              ExecQuery('delete from MS_MEMBER_HIST '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                       [HeadStoreCode,
                        StandardStore], true);

//              ExecQuery('delete from SL_ACCT '
//                       +' where CD_HEAD  = :P0 '
//                       +'   and CD_STORE = :P1 '
//                       +'   and CD_ACCT  = :P2 '
//                       +'   and REMARK   = ''기초미수'' '
//                       +'   and Length(CD_MEMBER) = 10; ',
//                       [HeadStoreCode,
//                        StandardStore,
//                        CreditIn], false);
            end;
          end;
    end;

    vExists      := false;
    vTempSQL := '';
    vSQLEtc  := '';

    vSQLList    := TStringList.Create;
    vSQLList1   := TStringList.Create;

    vSQLList.Clear;
    vSQLList1.Clear;

    for vRow := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      ShowMsg(FormatFloat(fmtComma, vRow)+' 건 처리 중...', false, 5);
      try
        case ConditionToolBarComboBox.ItemIndex of
          0 : //메뉴 작업
          begin
            for vIndex2 := 0 to WorkStoreList.Count-1 do
            begin
              if vMenuList.IndexOf(Format('%s-%s',[CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 0), Trim(GridTableView.DataController.Values[vRow, 0])])) >= 0 then Continue;

              if Copy(CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 2),2,1) = '0' then Continue;
              vTempSQL := vTempSQL + Format('(''%s'',''%s'',''%s'',''%s'', Left(''%s'',60), ''%s'',''%s'', %d, %d, ''%s'',''%s'',''%s'',''EXL'',''EXL'', %s, ''%s'',''%s''),',
                                        [HeadStoreCode,                                                 //CD_HEAD
                                         CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 0),            //CD_STORE
                                         Trim(GridTableView.DataController.Values[vRow, 0]),            //CD_MENU
                                         Trim(GridTableView.DataController.Values[vRow, 1]),            //NM_MENU
                                         Trim(GridTableView.DataController.Values[vRow, 1]),            //NM_MENU_SHORT
                                         Trim(GridTableView.DataController.Values[vRow, 2]),            //NM_SPEC
                                         UpperCase(GridTableView.DataController.Values[vRow, 3]),       //DS_MENU_TYPE
                                         NVL(GridTableView.DataController.Values[vRow, 4],0),           //PR_BUY
                                         NVL(GridTableView.DataController.Values[vRow, 5],0),           //PR_SALE
                                         NVL(GridTableView.DataController.Values[vRow, 6],'1'),         //DS_TAX
                                         NVL(GridTableView.DataController.Values[vRow, 7],''),          //CD_CLASS
                                         NVL(GridTableView.DataController.Values[vRow, 8],''),          //CD_TRDPL
                                         FloatToStr(CalcSaleProfitRate(NVL(GridTableView.DataController.Values[vRow, 4],0), NVL(GridTableView.DataController.Values[vRow, 5],0))),  //PR_SALE_PROFIT
                                         NVL(GridTableView.DataController.Values[vRow, 9],''),           //CD_PRINTER
                                         Rpad('11',20,'0')]);                                            //OPTIONS
            end;
          end;
          1 : //상품분류
          begin
            for vIndex2 := 0 to WorkStoreList.Count-1 do
            begin
              if Copy(CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 2),2,1) = '0' then Continue;
              vTempSQL := vTempSQL + Format('(''%s'',''%s'',''%s'',''%s'', NOW() ),',
                                        [HeadStoreCode,                                                 //CD_HEAD
                                         CopyPos(WorkStoreList.Strings[vIndex2], splitColumn, 0),            //CD_STORE
                                         Trim(GridTableView.DataController.Values[vRow, 0]),            //분류코드
                                         NVL(GridTableView.DataController.Values[vRow, 1],'')])   //분류명
            end;
          end;
          2 : //회원
          begin
            vSQLList.Add(Format('(''%s'',''%s'',LPad(''%s'',10,''0''),''%s'', GetChosung(''%s''), ''%s'', AES_Encrypt(''%s'',71483), ''%s'', ''%s'', ''%s'','
                                +'''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''N'', '
                                +' AES_Encrypt(Right(''%s'',4),71483), ''%s'',''%s'', ''%s'', NOW(), ''0'', ''EXL'', ''EXL'' ),',
                               [HeadStoreCode,                                                                         //CD_HEAD
                                StandardStore,                                                                          //CD_STORE
                                CopyStr(Trim(GridTableView.DataController.Values[vRow,  0]), 1, 10),                   // 회원번호
                                CopyStr(NVL(GridTableView.DataController.Values[vRow,  1],''), 1, 40),                 // 회원이름
                                CopyStr(NVL(GridTableView.DataController.Values[vRow,  1],''), 1, 40),                 // 초성
                                CopyStr(GridTableView.DataController.Values[vRow,  2], 1,  3),                         // DS_MEMBER
                                GetOnlyNumber(GridTableView.DataController.Values[vRow,  3]),                          // 휴대전화
                                GetOnlyNumber(GridTableView.DataController.Values[vRow,  4]),                          // 가입매장
                                GetOnlyNumber(GridTableView.DataController.Values[vRow,  5]),                          // 카드번호
                                GetOnlyNumber(GridTableView.DataController.Values[vRow,  6]),                          // 식별번호
                                CopyStr(NVL(GridTableView.DataController.Values[vRow, 7],''), 1, 60),                  // 주소1
                                CopyStr(NVL(GridTableView.DataController.Values[vRow, 8],''), 1, 60),                  // 주소2
                                IfThen(NVL(GridTableView.DataController.Values[vRow,  9],'') = 'N', '1', '0'),         // 성별
                                CopyStr(NVL(GridTableView.DataController.Values[vRow, 10],''), 1, 14),                 // 주민번호
                                LeftStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow, 11],'')),  8),     // 생일
                                IfThen(NVL(GridTableView.DataController.Values[vRow,  12],'') = 'N', 'Y', 'N'),        // 음/양
                                LeftStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow, 13],'')), 8),      // 가입일자
                                CopyStr(NVL(GridTableView.DataController.Values[vRow, 14],''), 1, 40),                 // 이메일
                                CopyStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow,  3],'')), 1, 13),  // 휴대전화
                                NVL(GridTableView.DataController.Values[vRow,  15],'N'),                                //문자수신
                                LeftStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow, 16],'')), 8),      // 수신동의일자
                                UserCode]));

            vSQLList1.Add(Format('(''%s'',''%s'',''%s'',''%s'',%d, %d),',
                                [HeadStoreCode,
                                 StandardStore,
                                 CopyStr(Trim(GridTableView.DataController.Values[vRow,  0]), 1, 10),             //회원코드
                                 LeftStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow, 17],'')), 8), //최종방문일
                                 NVL(GridTableView.DataController.Values[vRow,  18],0),         //총방문휘수
                                 NVL(GridTableView.DataController.Values[vRow,  19],0)]));       //총구매금액
            vDeleteMemberCode := vDeleteMemberCode + Format('''%s'',',[CopyStr(Trim(GridTableView.DataController.Values[vRow,  0]), 1, 10)]);
          end;
        end;
      except
        on E: Exception do
          begin
            ErrBox(E.Message);
            raise;
          end;
      end;
      // 회원 포인트 등이 있는지 확인한다
      if(ConditionToolBarComboBox.ItemIndex = 2) and ((Nvl(GridTableView.DataController.Values[vRow, 20],0) <> 0) or (Nvl(GridTableView.DataController.Values[vRow, 21],0) <> 0)) then
        vExists := true;
    end;

    if (vTempSQL <> '') or (vSQLList.Count > 0) then
    begin
      case ConditionToolBarComboBox.ItemIndex of
        0 :
        begin
          // Format('(''%s'',''%s'',''%s'',''%s'', Left(''%s'',50), ''%s'',''%s'', %d, %d, ''%s'',''%s'',''%s'',''EXL'',''EXL'', %s, ''%s''), '
          vTempSQL := 'insert into MS_MENU(CD_HEAD, CD_STORE, CD_MENU, NM_MENU, NM_MENU_SHORT, NM_SPEC, DS_MENU_TYPE, PR_BUY, PR_SALE, DS_TAX, CD_CLASS, CD_TRDPL,  PRG_INSERT, PRG_CHANGE, PR_SALE_PROFIT, CD_PRINTER, OPTIONS) values '
                    +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

        end;
        1 :
        begin
          vTempSQL := 'insert into MS_MENU_CLASS(CD_HEAD, CD_STORE, CD_CLASS, NM_CLASS, DT_CHANGE) values '
                    +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

        end;
        2 :
        begin
          vCount := 0;
          ExecQuery(Format('delete from MS_MEMBER_ETC where CD_HEAD =''%s'' and CD_STORE =''%s'' and CD_MEMBER in (%s);',[HeadStoreCode, StandardStore, LeftStr(vDeleteMemberCode, Length(vDeleteMemberCode)-1)]),
                   [],true);

          for vIndex := 0 to vSQLList.Count-1 do
          begin
            vTempSQL  := vTempSQL  + vSQLList.Strings[vIndex];
            vTempSQL1 := vTempSQL1 + vSQLList1.Strings[vIndex];
            Inc(vCount);

            if vCount > 100 then
            begin
              vTempSQL := 'insert into MS_MEMBER(CD_HEAD, CD_STORE, CD_MEMBER, NM_MEMBER, CHOSUNG, DS_MEMBER, TEL_MOBILE, CD_STORE_JOIN, NO_CARD, NO_CASHRCP, '
                        +'                       ADDR1, ADDR2, DS_SEX, NO_JUMIN, YMD_BIRTH, YN_LUNAR, YMD_ISU, NM_EMAIL, YN_TRUST, '
                        +'                       TEL_MOBILE_SHORT, YN_NEWS, YMD_AGREE, CD_SAWON_CHG, DT_CHANGE, DS_STATUS, PRG_INSERT, PRG_CHANGE) values  '
                        +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

              vTempSQL1 := 'insert into MS_MEMBER_ETC(CD_HEAD, CD_STORE, CD_MEMBER, YMD_VISIT, CNT_VISIT, AMT_SALE) values '
                          +LeftStr(vTempSQL1, Length(vTempSQL1)-1)+';';
              ExecQuery(vTempSQL+vTempSQL1, [], true);
              vCount    := 0;
              vTempSQL  := '';
              vTempSQL1 := '';
            end;
          end;

          if vTempSQL <> '' then
          begin
            vTempSQL := 'insert into MS_MEMBER(CD_HEAD, CD_STORE, CD_MEMBER, NM_MEMBER, CHOSUNG, DS_MEMBER, TEL_MOBILE, CD_STORE_JOIN, NO_CARD, NO_CASHRCP, '
                      +'                       ADDR1, ADDR2, DS_SEX, NO_JUMIN, YMD_BIRTH, YN_LUNAR, YMD_ISU, NM_EMAIL, YN_TRUST, '
                      +'                       TEL_MOBILE_SHORT, YN_NEWS, YMD_AGREE, CD_SAWON_CHG, DT_CHANGE, DS_STATUS, PRG_INSERT, PRG_CHANGE) values  '
                      +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

            vTempSQL1 := 'insert into MS_MEMBER_ETC(CD_HEAD, CD_STORE, CD_MEMBER, YMD_VISIT, CNT_VISIT, AMT_SALE) values '
                        +LeftStr(vTempSQL1, Length(vTempSQL1)-1)+';';
            ExecQuery(vTempSQL+vTempSQL1, [], true);
            vCount    := 0;
            vTempSQL  := '';
            vTempSQL1 := '';
          end;

        end;
      end;

      if vTempSQL <> '' then
        ExecQuery(vTempSQL, [], false);
    end;


    vSQLList.Clear;
    // 거래처 기초외상 또는 회원 포인트 등을 저장한다
    if vExists then
    begin
      for vRow := 0 to GridTableView.DataController.RecordCount-1 do
        if (ConditionToolBarComboBox.ItemIndex = 2) and ((GridTableView.DataController.Values[vRow, 20] > 0) or (GridTableView.DataController.Values[vRow, 21] > 0)) then
        begin
          //회원포인트
          if  (GridTableView.DataController.Values[vRow, 20] > 0) or (GridTableView.DataController.Values[vRow, 21] > 0) then
          begin
            Inc(vSeq);
            vSQLList.Add(Format('(''%s'', ''%s'', ''%s'',  ''00'', %d, ''%s'', ''001'', %d, %d,  %d, ''기초 이관'', ''%s'', Now()),',
                               [HeadStoreCode,
                                StandardStore,
                                vDate,
                                vSeq,
                                Lpad(Trim(GridTableView.DataController.Values[vRow,  0]),10,'0'),
                                NVL(GridTableView.DataController.Values[vRow, 20],0),
                                NVL(GridTableView.DataController.Values[vRow, 20],0),
                                NVL(GridTableView.DataController.Values[vRow, 21],0),
                                UserCode]));
          end;
        end;
    end;

    if (vSQLList.Count > 0) and (ConditionToolBarComboBox.ItemIndex = 2) then
    begin
      for vIndex := 0 to vSQLList.Count-1 do
      begin
        vTempSQL := vTempSQL + vSQLList.Strings[vIndex];
        Inc(vCount);
        if vCount > 100 then
        begin
          Result := ExecQuery('insert into SL_POINT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS,  SEQ, CD_MEMBER, CD_CODE, PNT_CASH, PNT_ADD, STAMP_ADD, REMARK, CD_SAWON_CHG, DT_CHANGE) values '
                   +LeftStr(vTempSQL, Length(vTempSQL)-1)+';',[], true);
          vTempSQL := '';
          vCount   := 0;
        end;
      end;
      if vTempSQL <> '' then
      begin
        Result := ExecQuery('insert into SL_POINT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS,  SEQ, CD_MEMBER, CD_CODE, PNT_CASH, PNT_ADD, STAMP_ADD, REMARK, CD_SAWON_CHG, DT_CHANGE) values '
                 +LeftStr(vTempSQL, Length(vTempSQL)-1)+';',[], true);
        vTempSQL := '';
        vCount   := 0;
      end;
    end;

    Screen.Cursor := crDefault;
    if TempSQL <> '' then
      Result := ExecQuery(TempSQL, [], true);

    if Result then
      MsgBox('저장이 완료되었습니다');

  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      ErrBox(E.Message);
    end;
  end;
end;

end.
