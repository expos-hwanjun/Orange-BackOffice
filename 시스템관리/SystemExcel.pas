// Excel 불러오기 (완료)

//##### 제약조건 처리(글자수제한, 상품코드체크, Y/N체크 등) 모든 조건 여기서 처리해야 함

unit SystemExcel;
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
  TSystemExcelForm = class(TInheritEditForm)
    Grid: TcxGrid;
    GridTableView: TcxGridTableView;
    GridLevel: TcxGridLevel;
    ConditionComboBox: TcxComboBox;
    Connection: TUniConnection;
    LocalQuery: TUniQuery;
    procedure FormCreate(Sender: TObject);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesEditValueChanged(Sender: TObject);
  private
  protected
    function  DoSearch: Boolean; override;  // 조회
    function  DoSave  : Boolean; override;  // 저장
  end;

var
  SystemExcelForm: TSystemExcelForm;



implementation

uses
  Common, ExcelLoad, DBModule, ProxyCheck;

{$R *.dfm}

procedure TSystemExcelForm.FormCreate(Sender: TObject);
begin
  inherited;
end;

//==============================================================================
// 조회창
//------------------------------------------------------------------------------
// 상품마스터 등록 시만 등록 조건을 표시한다
procedure TSystemExcelForm.ConditionToolBarComboBoxPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  ConditionComboBox.Visible   := false;
  if ConditionToolBarComboBox.ItemIndex = 0 then
  begin
    ConditionComboBox.Properties.Items.Clear;
    ConditionComboBox.Properties.Items.Add('기존메뉴를 모두 삭제한 후 자료 추가');
    ConditionComboBox.Properties.Items.Add('기존에 없는 신규메뉴만 추가');
    ConditionComboBox.ItemIndex := 0;
    ConditionComboBox.Visible   := true;
  end
  else if ConditionToolBarComboBox.ItemIndex = 3 then      //회원
  begin
    ConditionComboBox.Properties.Items.Clear;
    ConditionComboBox.Properties.Items.Add('기존자료를 모두 삭제한 후 자료 추가');
    ConditionComboBox.Properties.Items.Add('기존에 없는 신규회원만 추가');
    ConditionComboBox.Properties.Items.Add('신규회원은 추가 기존회원은 변경');
    ConditionComboBox.ItemIndex := 0;
    ConditionComboBox.Visible   := true;
  end;
end;
//------------------------------------------------------------------------------
// 조회 버튼
procedure TSystemExcelForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  inherited;

  // 불러온 자료가 있으면 변경된 자료가 있는 것으로 본다
  isChanged := GridTableView.DataController.RecordCount > 0;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 조회 버튼
function TSystemExcelForm.DoSearch: Boolean;
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
  vStoreCode :String;
  vSQL :String;
begin
  Result := false;
  // 입력하지 않은 조건 확인
  if ConditionToolBarComboBox.ItemIndex = -1 then
  begin
    ErrBox(ConditionToolBarEditLabel.Caption+msgMustInput);
    Exit;
  end;

  with TProxyCheckForm.Create(self) do
    try
      if ShowModal <> mrOK then
        Exit;
    finally
      Free;
    end;

  try
    GridTableView.DataController.RecordCount := 0;
    GridTableView.ClearItems;

    // 기본 칼럼 생성
    case ConditionToolBarComboBox.ItemIndex of
      0 : // 메뉴마스터
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
            GridTableView.Columns[GridTableView.ColumnCount-1].DataBinding.FieldName := '0:면세,1:포함,2:별도';
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
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '기초재고수량';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 90;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
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
                      StoreCode,
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

      2 : // 거래처
          begin
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '매입처코드';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 6;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Editing := false;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.Columns[GridTableView.ColumnCount-1].FooterAlignmentHorz := taRightJustify;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '매입처이름';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 30;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '사업자번호';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 12;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '대표자';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 20;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '업태';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 30;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '종목';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 30;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '전화번호';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 13;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '팩스번호';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 13;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '담당자';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 40;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '담당자전화';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 13;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '주소(읍면동까지)';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 40;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '주소(번지,건물)';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 40;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := 'E-Mail';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 150;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 40;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '외상매입금';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                       := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                 := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                         := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
          end;
      3 : // 회원
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
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '전화번호';                                           //4
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 100;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 13;
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
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '비고';                                             //10
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 200;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 500;
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
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '외상여부(Y/N)';                                  //15
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := -1;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '문자수신(Y/N)';                                  //16
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 70;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := -1;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '동의일자';                                       //17
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 10;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '최종방문일';                                     //18
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].Tag     := 10;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '총방문횟수';                                    //19
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;                                                                                   //20
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '총구매금액';
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '포인트';                                        //21
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '스탬프';                                       //22
            GridTableView.Columns[GridTableView.ColumnCount-1].Width   := 80;
            GridTableView.Columns[GridTableView.ColumnCount-1].PropertiesClassName                                        := 'TcxCurrencyEditProperties';
            GridTableView.Columns[GridTableView.ColumnCount-1].Properties.Alignment.Horz                                  := taRightJustify;
            GridTableView.Columns[GridTableView.ColumnCount-1].Options.Filtering                                          := false;
            TcxCustomCurrencyEditProperties(GridTableView.Columns[GridTableView.ColumnCount-1].Properties).DisplayFormat  := fmtComma;
            GridTableView.Columns[GridTableView.ColumnCount-1].HeaderAlignmentHorz := taCenter;
            GridTableView.CreateColumn;
            GridTableView.Columns[GridTableView.ColumnCount-1].Caption := '외상미수금';                                   //23
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
                      if (GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol]=EmptyStr) or ((GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] <> '') and not (UpperCase(GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol])[1] in ['N','W','O','G','S','C','I'])) then
                        GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := 'N';
                    end
                  //회원코드
                    else if (ConditionToolBarComboBox.ItemIndex = 3) and (vCol = 0) then
                      GridTableView.DataController.Values[GridTableView.DataController.RecordCount-1, vCol] := LPad(vXLSFile.CellValue[vIndex, ColumnComboBox[vCol].ItemIndex], 10, '0');
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
function TSystemExcelForm.DoSave: Boolean;
const
  fmtEmptyRecord = '%s이(가) 없는 레코드가 있습니다.';
var
  vRow, vCol  : Integer;
  vExists,
  vStockExists: Boolean;
  vDate, vBill: string;
  vSeq        : Integer;
  vBaseMonth  : string;
  vIsCount    : Boolean;
  vUpdateCount,
  vInsertCount,
  vErrorCount : Integer;
  vResult     : Integer;
  vStringList :TStringList;
  vIndex :Integer;
  vAcctNo :Integer;
  vMemberExist,
  vGoodsExist :Boolean;
  vCount : Integer;
  vInsertSQL :String;
  vMember    :String;
  vTax       :String;
  vMemberList :TStringList;
  vMenuList   :TStringList;
  vSQLList  :TStringList;
  vSQLList1 :TStringList;
  vUpdateSQL :TStringList;
  vTempSQL    :String;
  vTempSQL1   :String;
  vSQLEtc     :String;
  vDeleteMemberCode :String;
begin
  vUpdateSQL   := TStringList.Create;
  Result       := false;
  with TProxyCheckForm.Create(self) do
    try
      if ShowModal <> mrOK then
        Exit;
    finally
      Free;
    end;


  vGoodsExist  := false;
  vMemberExist := false;
  vDeleteMemberCode := '';
  if (ConditionToolBarComboBox.ItemIndex = -1) or (GridTableView.ColumnCount = 0) then
  begin
    ErrBox(ConditionToolBarEditLabel.Caption+msgMustInput);
    Exit;
  end;

  vDate      := DtoS(Date);

  // 매입처, 회원 등을 등록할 때 출납테이블 순번을 구한다
  if (ConditionToolBarComboBox.ItemIndex in [2, 3]) then
  begin
    try
      OpenQuery('select Ifnull(Max(NO_ACCT),0)+1 as NO_ACCT '
               +'  from SL_ACCT '
               +' where CD_HEAD   = :P0 '
               +'   and CD_STORE  = :P0 '
               +'   and YMD_OCCUR = :P1 '
               +'   and NO_POS    = ''00'' ',
               [HeadStoreCode,
                StoreCode,
                vDate]);
      if not Query.Eof then
        vAcctNo := Query.Fields[0].AsInteger
      else
        vAcctNo := 1;
    finally
      FinishQuery;
    end;
  end
  else
    vAcctNo := 0;

  //포인트 적립 순번
  OpenQuery('select IfNull(Max(SEQ),0) as SEQ '
           +'  from SL_POINT '
           +' where CD_HEAD   = :P0 '
           +'   and CD_STORE  = :P1 '
           +'   and YMD_OCCUR = :P2 '
           +'   and NO_POS    = ''00'' ',
            [HeadStoreCode,
             StoreCode,
             vDate]);
  try
    if Query.Eof then
      vSeq := 0
    else
      vSeq := Query.Fields[0].AsInteger;
  finally
    FinishQuery;
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

        2 : // 매입처
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
              GridTableView.DataController.Values[vRow, 0] := '1'+RightStr(GridTableView.DataController.Values[vRow, 0], 5);
            end;

        3 : // 회원
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
    if ConditionToolBarComboBox.ItemIndex = 0 then
    begin
      if not AskBox(Format('%s 하시겠습니까?', [ConditionComboBox.Properties.Items[ConditionComboBox.ItemIndex]])) then
        Exit
      else
        vResult := mrYes;

      if ConditionComboBox.ItemIndex = 0 then
      begin
        vResult := Application.MessageBox(PChar(Format('%s 하시겠습니까?'#13'''아니요''를 누르면 기존에 등록되지 않은 자료만 새로 저장합니다.', [ConditionComboBox.Properties.Items[0]])), PChar(Caption), MB_YESNOCANCEL+MB_ICONQUESTION);
        if vResult = mrCancel then
          Exit
        else if vResult = mrYes then
          if not AskBox(Format('정말 %s 자료를 모두 지우시겠습니까?', [ConditionToolBarComboBox.Text])) then
            Exit;
      end;
    end;

    //회원일때 기존자료 모두 지운다고 했을때 매출내역이 있는지 체크한다
    if (ConditionToolBarComboBox.ItemIndex = 3) and (ConditionComboBox.ItemIndex = 0) then
    begin
      if (ConditionComboBox.ItemIndex = 0) and not AskBox('현재 회원 자료를 모두 지우시겠습니까?') then
        Exit
      else
        vResult := mrYes;

      try
        OpenQuery('select count(*) '
                 +'  from SL_SALE_H '
                 +' where CD_HEAD   =:P0 '
                 +'   and CD_STORE  =:P1 '
                 +'   and CD_MEMBER <> '''' ',
                 [HeadStoreCode,
                  StoreCode]);
        if Query.Fields[0].AsInteger > 0 then
        begin
          if not AskBox('회원매출 내역이 있습니다'#13'계속 하시겠습니까?') then
            Exit;
        end;
      finally
        FinishQuery;
      end;
    end;

    Screen.Cursor := crHourGlass;

    // 기존 자료를 삭제한다
    if vResult = mrYes  then
      case ConditionToolBarComboBox.ItemIndex of
        0 : // 상품마스터
            if  (ConditionComboBox.ItemIndex = 0) then
            begin
              ExecQuery('delete from MS_MENU '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from MS_MENU_HIST '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from MS_MENU_SET '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from MS_COURSE '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from MS_MENU_MEMO '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from MS_MENU_OPEN '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from SL_STOCK_MONTH '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from MS_SMALL '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
            end;
        1 : // 상품분류
            begin
              ExecQuery('delete from MS_MENU_CLASS '
                       +' where CD_HEAD  =:P0 '
                       +'   and CD_STORE =:P1;',
                        [HeadStoreCode,
                         StoreCode], false);
            end;
        2 : // 매입처
            begin
              ExecQuery('delete from MS_TRD '
                       +' where CD_HEAD  = :P0 '
                       +'   and CD_STORE = :P1 '
                       +'   and DS_TRDPL = ''B''; ',
                        [HeadStoreCode,
                         StoreCode], false);
              ExecQuery('delete from SL_ACCT '
                       +' where CD_HEAD  = :P0 '
                       +'   and CD_STORE = :P1 '
                       +'   and CD_ACCT  = :P2 '
                       +'   and REMARK   = ''기초미지급''; ',
                        [HeadStoreCode,
                         StoreCode,
                         CreditOut], false);
            end;
        3 : // 회원
            begin
              if ConditionComboBox.ItemIndex = 0 then
              begin
                ExecQuery('delete from SL_POINT '
                         +' where CD_HEAD  =:P0 '
                         +'   and CD_STORE =:P1;',
                         [HeadStoreCode,
                          StoreCode], false);

                ExecQuery('delete from MS_MEMBER '
                         +' where CD_HEAD  =:P0 '
                         +'   and CD_STORE =:P1;',
                         [HeadStoreCode,
                          StoreCode], false);

                ExecQuery('delete from MS_MEMBER_ETC '
                         +' where CD_HEAD  =:P0 '
                         +'   and CD_STORE =:P1;',
                         [HeadStoreCode,
                          StoreCode], false);

                ExecQuery('delete from MS_MEMBER_HIST '
                         +' where CD_HEAD  =:P0 '
                         +'   and CD_STORE =:P1;',
                         [HeadStoreCode,
                          StoreCode], false);

                ExecQuery('delete from SL_ACCT '
                         +' where CD_HEAD  = :P0 '
                         +'   and CD_STORE = :P1 '
                         +'   and CD_ACCT  = :P2 '
                         +'   and REMARK   = ''기초미수'' '
                         +'   and Length(CD_MEMBER) = 10; ',
                         [HeadStoreCode,
                          StoreCode,
                          CreditIn], true);
              end;
            end;
      end;

    vExists      := false;
    vStockExists := false;
    vUpdateCount := 0;
    vInsertCount := 0;
    vErrorCount  := 0;

    if (ConditionToolBarComboBox.ItemIndex = 0) and (ConditionComboBox.ItemIndex = 1) then
    begin
      vMenuList := TStringList.Create;
      OpenQuery('select CD_MENU '
               +'  from MS_MENU '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 ',
               [HeadStoreCode,
                StoreCode]);
      vMenuList.Clear;
      while not Query.Eof do
      begin
        vMenuList.Add(Query.Fields[0].AsString);
        Query.Next;
      end;
      Query.Close
    end;

    //회원 기존회원 삭제하지 않음
    if (ConditionToolBarComboBox.ItemIndex = 3) and (ConditionComboBox.ItemIndex <> 0) then
    begin
      vMemberList := TStringList.Create;
      OpenQuery('select CD_MEMBER '
               +'  from MS_MEMBER '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 ',
               [HeadStoreCode,
                StoreCode]);
      vMemberList.Clear;
      while not Query.Eof do
      begin
        vMemberList.Add(Query.Fields[0].AsString);
        Query.Next;
      end;
      Query.Close
    end;

    vTempSQL := '';
    vSQLEtc  := '';

    vSQLList    := TStringList.Create;
    vSQLList1   := TStringList.Create;

    vSQLList.Clear;
    vSQLList1.Clear;

    for vRow := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      vIsCount := True;
      ShowMsg(FormatFloat(fmtComma, vRow)+' 건 처리 중...', false, 5);
      try
        case ConditionToolBarComboBox.ItemIndex of
          0 : //메뉴 작업
          begin
            if (ConditionComboBox.ItemIndex = 1) and (vMenuList.IndexOf(Trim(GridTableView.DataController.Values[vRow, 0])) >= 0) then
              Continue;

            //메뉴 최대 개수 체크
            if (ConditionComboBox.ItemIndex = 0) and (vRow > AllowMenuCount) then
              Continue;

            vTempSQL := vTempSQL + Format('(''%s'',''%s'',''%s'',''%s'', Left(''%s'',60), ''%s'',''%s'', %d, %d, ''%s'',''%s'',''%s'',''EXL'',''EXL'', %s, ''%s''),',
                                      [HeadStoreCode,                                                 //CD_HEAD
                                       StoreCode,                                                     //CD_STORE
                                       Trim(GridTableView.DataController.Values[vRow, 0]),            //CD_MENU
                                       Replace(Trim(GridTableView.DataController.Values[vRow, 1]),'''','＇'),            //NM_MENU
                                       Replace(Trim(GridTableView.DataController.Values[vRow, 1]),'''','＇'),            //NM_MENU_SHORT
                                       Trim(GridTableView.DataController.Values[vRow, 2]),            //NM_SPEC
                                       UpperCase(GridTableView.DataController.Values[vRow, 3]),       //DS_MENU_TYPE
                                       NVL(GridTableView.DataController.Values[vRow, 4],0),           //PR_BUY
                                       NVL(GridTableView.DataController.Values[vRow, 5],0),           //PR_SALE
                                       NVL(GridTableView.DataController.Values[vRow, 6],'1'),         //DS_TAX
                                       NVL(GridTableView.DataController.Values[vRow, 7],''),          //CD_CLASS
                                       NVL(GridTableView.DataController.Values[vRow, 8],''),          //CD_TRDPL
                                       FloatToStr(CalcSaleProfitRate(NVL(GridTableView.DataController.Values[vRow, 4],0), NVL(GridTableView.DataController.Values[vRow, 5],0))),  //PR_SALE_PROFIT
                                       NVL(GridTableView.DataController.Values[vRow, 10],'')]);                                                                             //CD_PRINTER

          end;
          1 : //상품분류
          begin
            vTempSQL := vTempSQL + Format('(''%s'',''%s'',''%s'',''%s'', NOW() ),',
                                      [HeadStoreCode,                                                 //CD_HEAD
                                       StoreCode,                                                     //CD_STORE
                                       Trim(GridTableView.DataController.Values[vRow, 0]),            //분류코드
                                       NVL(GridTableView.DataController.Values[vRow, 1],'')])         //분류명
          end;
          2 : //매입처
          begin
            vTempSQL := vTempSQL + Format('(''%s'',''%s'',LPad(''%s'',6,''0''),''%s'', ''B'', ''%s'', ''%s'',''%s'', ''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',0, NOW(),''%s''),',
                                      [HeadStoreCode,                                                 //CD_HEAD
                                       StoreCode,                                                     //CD_STORE
                                       Trim(GridTableView.DataController.Values[vRow, 0]),            //CD_TRDPL
                                       Trim(GridTableView.DataController.Values[vRow, 1]),            //NM_TRDPL
                                       Trim(GridTableView.DataController.Values[vRow, 2]),            //사업자번호
                                       Trim(GridTableView.DataController.Values[vRow, 3]),            //대표자
                                       NVL(GridTableView.DataController.Values[vRow, 4],''),          //업태
                                       NVL(GridTableView.DataController.Values[vRow, 5],''),          //종목
                                       NVL(GridTableView.DataController.Values[vRow, 6],''),          //사무실전화
                                       NVL(GridTableView.DataController.Values[vRow, 7],'1'),         //팩스전화
                                       NVL(GridTableView.DataController.Values[vRow, 8],''),          //담당자
                                       GetOnlyNumber(GridTableView.DataController.Values[vRow, 9]),   //휴대전화
                                       NVL(GridTableView.DataController.Values[vRow, 10],''),         //주소1
                                       NVL(GridTableView.DataController.Values[vRow, 11],''),         //주소2
                                       NVL(GridTableView.DataController.Values[vRow, 12],''),         //이베일
                                       UserCode]);
          end;
          3 : //회원
          begin
            if (ConditionComboBox.ItemIndex = 1) and (vMemberList.IndexOf(Trim(GridTableView.DataController.Values[vRow, 0])) >= 0) then
              Continue;

            vSQLList.Add(Format('(''%s'',''%s'',''%s'',''%s'', GetChosung(''%s''), ''%s'', AES_Encrypt(''%s'',71483), AES_Encrypt(''%s'',71483), ''%s'', ''%s'','
                               +'''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'', '
                               +' AES_Encrypt(Right(''%s'',4),71483), AES_Encrypt(Right(''%s'',4),71483),''%s'',''%s'', ''%s'', NOW(), ''0'', ''EXL'', ''EXL'',''%s'' ),',
                               [HeadStoreCode,                                                                         //CD_HEAD
                                StoreCode,                                                                             //CD_STORE
                                CopyStr(Trim(GridTableView.DataController.Values[vRow,  0]), 1, 10),                   // 회원번호
                                CopyStr(NVL(GridTableView.DataController.Values[vRow,  1],''), 1, 40),                 // 회원이름
                                CopyStr(NVL(GridTableView.DataController.Values[vRow,  1],''), 1, 40),                 // 초성
                                CopyStr(GridTableView.DataController.Values[vRow,  2], 1,  3),                         // DS_MEMBER
                                GetOnlyNumber(GridTableView.DataController.Values[vRow,  3]),                          // 휴대전화
                                GetOnlyNumber(GridTableView.DataController.Values[vRow,  4]),                          // 집전화
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
                                CopyStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow,  4],'')), 1, 13),
                                NVL(GridTableView.DataController.Values[vRow,  16],'N'),                               //문자수신
                                LeftStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow, 17],'')), 8),      // 수신동의일자
                                UserCode,
                                StoreCode]));

            vSQLList1.Add(Format('(''%s'',''%s'',''%s'',''%s'',%d, %d, ''%s''),',
                                [HeadStoreCode,
                                 StoreCode,
                                 CopyStr(Trim(GridTableView.DataController.Values[vRow,  0]), 1, 10),
                                 LeftStr(GetOnlyNumber(NVL(GridTableView.DataController.Values[vRow, 18],'')), 8),
                                 NVL(GridTableView.DataController.Values[vRow,  19],0),
                                 NVL(GridTableView.DataController.Values[vRow,  20],0),
                                 IfThen(NVL(GridTableView.DataController.Values[vRow,  15],'') = 'Y', 'Y', 'N')]));

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
      // 기초재고가 있는지 확인한다
      if not vStockExists and
         ((ConditionToolBarComboBox.ItemIndex = 0) and (GridTableView.DataController.Values[vRow, 9] <> 0)) then
        vStockExists := true;
      // 거래처 기초외상 또는 회원 포인트 등이 있는지 확인한다
      if not vExists and
         (((ConditionToolBarComboBox.ItemIndex = 2) and (Nvl(GridTableView.DataController.Values[vRow, 2],0) <> 0)) or
          ((ConditionToolBarComboBox.ItemIndex = 3) and ((Nvl(GridTableView.DataController.Values[vRow, 21],0) <> 0) or (Nvl(GridTableView.DataController.Values[vRow, 22],0) <> 0) or (Nvl(GridTableView.DataController.Values[vRow, 23],0) <> 0)))) then
        vExists := true;
    end;

    if (vTempSQL <> '') or (vSQLList.Count > 0) then
    begin
      case ConditionToolBarComboBox.ItemIndex of
        0 :
        begin
          // Format('(''%s'',''%s'',''%s'',''%s'', Left(''%s'',50), ''%s'',''%s'', %d, %d, ''%s'',''%s'',''%s'',''EXL'',''EXL'', %s, ''%s''), '
          vTempSQL := 'insert into MS_MENU(CD_HEAD, CD_STORE, CD_MENU, NM_MENU, NM_MENU_SHORT, NM_SPEC, DS_MENU_TYPE, PR_BUY, PR_SALE, DS_TAX, CD_CLASS, CD_TRDPL,  PRG_INSERT, PRG_CHANGE, PR_SALE_PROFIT, CD_PRINTER) values '
                    +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

        end;
        1 :
        begin
          vTempSQL := 'insert into MS_MENU_CLASS(CD_HEAD, CD_STORE, CD_CLASS, NM_CLASS, DT_CHANGE) values '
                    +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

        end;
        2 :
        begin
//                                   Format('(''%s'',''%s'',LPad(''%s'',6,''0''),''%s'', ''B'', ''%s'', ''%s'',''%s'', ''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',''%s'',0, NOW(),''%s''), '
          vTempSQL := 'insert into MS_TRD(CD_HEAD, CD_STORE, CD_TRDPL, NM_TRDPL, DS_TRDPL, NO_BIZER, NM_BOSS, NM_UPTAE, NM_JONGMOK, TEL_OFFICE, TEL_FAX, NM_DAMDANG, TEL_MOBILE, ADDR1, ADDR2, NM_EMAIL, DS_STATUS, DT_CHANGE, CD_SAWON_CHG) values  '
                    +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';
        end;
        3 :
        begin
          vCount := 0;
          ExecQuery(Format('delete from MS_MEMBER_ETC where CD_HEAD =''%s'' and CD_STORE =''%s'' and CD_MEMBER in (%s);',[HeadStoreCode, StoreCode, LeftStr(vDeleteMemberCode, Length(vDeleteMemberCode)-1)]),
                   [],true);
          for vIndex := 0 to vSQLList.Count-1 do
          begin
            vTempSQL  := vTempSQL  + vSQLList.Strings[vIndex];
            vTempSQL1 := vTempSQL1 + vSQLList1.Strings[vIndex];
            Inc(vCount);
            if vCount > 100 then
            begin
              vTempSQL := 'insert into MS_MEMBER(CD_HEAD, CD_STORE, CD_MEMBER, NM_MEMBER, CHOSUNG, DS_MEMBER, TEL_MOBILE, TEL_HOME, NO_CARD, NO_CASHRCP, '
                        +'                       ADDR1, ADDR2, DS_SEX, NO_JUMIN, YMD_BIRTH, YN_LUNAR, YMD_ISU, NM_EMAIL, '
                        +'                       TEL_MOBILE_SHORT, TEL_HOME_SHORT, YN_NEWS, YMD_AGREE, CD_SAWON_CHG, DT_CHANGE, DS_STATUS, PRG_INSERT, PRG_CHANGE, CD_STORE_JOIN) values  '
                        +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

              vTempSQL1 := 'insert into MS_MEMBER_ETC(CD_HEAD, CD_STORE, CD_MEMBER, YMD_VISIT, CNT_VISIT, AMT_SALE, YN_TRUST) values '
                        +LeftStr(vTempSQL1, Length(vTempSQL1)-1)+';';

              ExecQuery(vTempSQL+vTempSQL1, [], true);
              vCount    := 0;
              vTempSQL  := '';
              vTempSQL1 := '';
            end;
          end;

          if vTempSQL <> '' then
          begin
            vTempSQL := 'insert into MS_MEMBER(CD_HEAD, CD_STORE, CD_MEMBER, NM_MEMBER, CHOSUNG, DS_MEMBER, TEL_MOBILE, TEL_HOME, NO_CARD, NO_CASHRCP, '
                      +'                       ADDR1, ADDR2, DS_SEX, NO_JUMIN, YMD_BIRTH, YN_LUNAR, YMD_ISU, NM_EMAIL, '
                      +'                       TEL_MOBILE_SHORT, TEL_HOME_SHORT, YN_NEWS, YMD_AGREE, CD_SAWON_CHG, DT_CHANGE, DS_STATUS, PRG_INSERT, PRG_CHANGE, CD_STORE_JOIN) values  '
                      +LeftStr(vTempSQL, Length(vTempSQL)-1)+';';

            vTempSQL1 := 'insert into MS_MEMBER_ETC(CD_HEAD, CD_STORE, CD_MEMBER, YMD_VISIT, CNT_VISIT, AMT_SALE, YN_TRUST) values '
                      +LeftStr(vTempSQL1, Length(vTempSQL1)-1)+';';

            ExecQuery(vTempSQL+vTempSQL1, [], true);
            vTempSQL  := '';
            vTempSQL1 := '';
          end;
        end;
      end;

      if vTempSQL <> '' then
        ExecQuery(vTempSQL, [], false);
      if vSQLEtc <> '' then
      begin
        ExecQuery(vSQLEtc, [], false);
      end;
    end;


    // 기초재고를 저장할 수 있는지 확인한다
    if vStockExists then
    begin
      // 월 마감 테이블에 마감이 한 건이라도 있으면 기초 재고 반영을 안한다
      if OpenQuery('select CD_GOODS '
                  +'  from SL_STOCK_MONTH '
                  +' where CD_HEAD  = :P0 '
                  +'   and CD_STORE = :P1 '
                  +'   and YN_CLOSE = ''Y'' '
                  +' limit 1 ',
                   [HeadStoreCode,
                    StoreCode],
                    true) then
      begin
        ErrBox('월 마감이 된 자료가 있어서 기초 재고를 반영할 수 없습니다.');
        vStockExists := false;
      end;
      // 월 마감 테이블에 자료가 있다면 재고 년월을 알아낸다
      OpenQuery('select Min(YM_STOCK) as YM_STOCK '
               +'  from SL_STOCK_MONTH '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1',
                [HeadStoreCode,
                 StoreCode]);
      try
        if Query.Eof or (Query.Fields[0].AsString = EmptyStr) then
          vBaseMonth := EmptyStr
        else
          vBaseMonth := Query.Fields[0].AsString;
      finally
        FinishQuery;
      end;
      // 월 마감 테이블에 자료가 없다면 기초재고를 만든다
      if vBaseMonth = EmptyStr then
      begin
        vBaseMonth := FormatDateTime(fmtDateYM, Date);
        ExecQuery('insert into SL_STOCK_MONTH(CD_HEAD, CD_STORE, YM_STOCK, CD_GOODS) '
                 +'select  CD_HEAD, '
                 +'        CD_STORE, '
                 +'        :P2 as YM_STOCK, '
                 +'        CD_MENU '
                 +'  from  MS_MENU '
                 +' where  CD_HEAD  = :P0 '
                 +'   and  CD_STORE = :P1 '
                 +'   and  DS_STOCK = ''1''; ',
                  [HeadStoreCode,
                   StoreCode,
                   vBaseMonth],
                   false);
      end;
    end;

    vSQLList.Clear;
    vTempSQL := '';
    vTempSQL1 := '';
    // 거래처 기초외상 또는 회원 포인트 등을 저장한다
    if vStockExists or vExists then
    begin
      for vRow := 0 to GridTableView.DataController.RecordCount-1 do
        // 기초재고
        if (ConditionToolBarComboBox.ItemIndex = 0) and (GridTableView.DataController.Values[vRow, 9] <> 0) then
        begin
          vTempSQL := vTempSQL + Format('(''%s'', ''%s'', ''%s'', ''%s'', %s, %s, %s),',
                                       [HeadStoreCode,
                                        StoreCode,
                                        vBaseMonth,
                                        Trim(GridTableView.DataController.Values[vRow, 0]),
                                        FloatToStr(GridTableView.DataController.Values[vRow, 9]),
                                        FloatToStr(GridTableView.DataController.Values[vRow, 9] * GridTableView.DataController.Values[vRow, 4]),
                                        FloatToStr(GridTableView.DataController.Values[vRow, 9] * GridTableView.DataController.Values[vRow, 5])]);


        end
        // 매입처 외상매입금
        else if (ConditionToolBarComboBox.ItemIndex = 2) and (GridTableView.DataController.Values[vRow, 2] <> 0) then
        begin
          vTempSQL := vTempSQL + Format('(''%s'', ''%s'', ''%s'', ''00'', ''%s'', ''0'', ''%s'', %d, ''%s'',  Now(), Now(), ''기초미지급''),',
                                        [HeadStoreCode,
                                         StoreCode,
                                         vDate,
                                         FormatFloat('000', vAcctNo),
                                         CreditOut,
                                         LPad(Trim(GridTableView.DataController.Values[vRow, 0]),6,'0'),
                                         GridTableView.DataController.Values[vRow, 2]*-1,
                                         UserCode]);
          Inc(vAcctNo);
        end
        // 회원
        else if (ConditionToolBarComboBox.ItemIndex = 3) and ((GridTableView.DataController.Values[vRow, 21] > 0) or (GridTableView.DataController.Values[vRow, 22] > 0)) then
        begin
          //회원포인트
          if  (GridTableView.DataController.Values[vRow, 21] > 0) or (GridTableView.DataController.Values[vRow, 22] > 0) then
          begin
            Inc(vSeq);
                                   //'(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS,  SEQ, CD_MEMBER, CD_CODE, PNT_CASH, PNT_ADD, STAMP_ADD, REMARK, CD_SAWON_CHG, DT_CHANGE) values '+LeftStr(vTempSQL, Length(vTempSQL)-1)+';',[], false);
            vSQLList.Add(Format('(''%s'', ''%s'', ''%s'',  ''00'', %d, ''%s'', ''001'', %d,  %d, %d, ''기초 이관'', ''%s'', Now()),',
                               [HeadStoreCode,
                                StoreCode,
                                vDate,
                                vSeq,
                                Lpad(Trim(GridTableView.DataController.Values[vRow,  0]),10,'0'),   //CD_MEMBER
                                NVL(GridTableView.DataController.Values[vRow, 21],0),               //PNT_CASH
                                NVL(GridTableView.DataController.Values[vRow, 21],0),               //PNT_ADD
                                NVL(GridTableView.DataController.Values[vRow, 22],0),               //STAMP_ADD
                                UserCode]));
          end;

          //외상미수금
          if (GridTableView.DataController.Values[vRow, 23] <> 0) then
          begin
            vTempSQL1 := vTempSQL1 + Format('(''%s'', ''%s'', ''%s'', ''00'', ''%s'', ''0'', ''%s'', ''%s'', %d, ''%s'', Now(), Now(), ''기초미수''),',
                                            [HeadStoreCode,
                                             StoreCode,
                                             vDate,
                                             FormatFloat('000', vAcctNo),
                                             CreditIn,
                                             LPad(Trim(GridTableView.DataController.Values[vRow,  0]),10,'0'),
                                             NVL(GridTableView.DataController.Values[vRow, 23],0)*-1,
                                             UserCode]);

            Inc(vAcctNo);
          end;
        end;
    end;

    if (vTempSQL <> '') and (ConditionToolBarComboBox.ItemIndex = 0) then
      ExecQuery('insert into SL_STOCK_MONTH(CD_HEAD, CD_STORE, YM_STOCK, CD_GOODS, QTY_BASE, AMT_BASE, AMT_BASE_SALE) values '+LeftStr(vTempSQL, Length(vTempSQL)-1)+';',[], false);
    if (vTempSQL <> '') and (ConditionToolBarComboBox.ItemIndex = 2) then
      ExecQuery('insert into SL_ACCT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, NO_ACCT, DS_ACCT, CD_ACCT, CD_TRDPL, AMT_OUT, CD_SAWON_CHG, DT_CHANGE, DT_INSERT, REMARK) values '+LeftStr(vTempSQL, Length(vTempSQL)-1)+';',[], false);
    if (vSQLList.Count > 0) and (ConditionToolBarComboBox.ItemIndex = 3) then
    begin
      vCount := 0;
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
    begin
      GridTableView.DataController.RecordCount := 0;
      MsgBox('저장이 완료되었습니다');
    end;

  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      ErrBox(E.Message);
    end;
  end;
end;

end.
