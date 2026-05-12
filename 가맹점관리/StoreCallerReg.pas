unit StoreCallerReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxGridCustomTableView, cxGridTableView, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridCustomView, cxGrid, cxTextEdit, cxDropDownEdit, cxLabel, cxMaskEdit,
  cxCalendar, AdvGlowButton, AdvSplitter, cxMemo, cxGroupBox, Vcl.StdCtrls,
  cxCheckBox, PNGImage, cxImage, AdvPanel, Math, StrUtils, AdvOfficePager,
  dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvOfficePagerStylers;

type
  TStoreCallerRegForm = class(TInheritGridEditForm)
    GridTableViewCustomerCode: TcxGridColumn;
    GridTableViewCustomerName: TcxGridColumn;
    GridTableViewStatus: TcxGridColumn;
    ImagePanel: TAdvPanel;
    BizImage: TcxImage;
    AdvOfficePager: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    HistoryPager: TAdvOfficePage;
    GoodsCodeLabel: TLabel;
    GoodsNameLabel: TLabel;
    IDNoLabel: TLabel;
    OfficeTelLabel: TLabel;
    CEONameLabel: TLabel;
    UseYNLabel: TLabel;
    RemarkLabel: TLabel;
    StoreCeoNameLabel: TLabel;
    StoreBizNoLabel: TLabel;
    StoreTelNoLabel: TLabel;
    CustomerCodeEdit: TcxTextEdit;
    CustomerNameEdit: TcxTextEdit;
    BizNoEdit: TcxMaskEdit;
    TelNoEdit: TcxTextEdit;
    CEONameEdit: TcxTextEdit;
    HeadChangeGroupBox: TcxGroupBox;
    BizImgButton: TAdvGlowButton;
    CertiButton: TAdvGlowButton;
    EmploymentButton: TAdvGlowButton;
    StatusComboBox: TcxComboBox;
    RemarkMemo: TcxMemo;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxGrid1: TcxGrid;
    HistoryGridTableView: TcxGridTableView;
    HistoryGridTableViewHistoryDate: TcxGridColumn;
    HistoryGridTableViewWorkType: TcxGridColumn;
    HistoryGridTableViewColumn1: TcxGridColumn;
    HistoryGridTableViewColumn2: TcxGridColumn;
    HistoryGridTableViewColumn3: TcxGridColumn;
    HistoryGridTableViewColumn4: TcxGridColumn;
    HistoryGridTableViewBizImg: TcxGridColumn;
    HistoryGridTableViewCertiImg: TcxGridColumn;
    HistoryGridTableViewEmpImg: TcxGridColumn;
    HistoryGridTableViewColumn12: TcxGridColumn;
    HistoryGridTableViewColumn13: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    procedure BizImgButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridTableViewStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure HistoryPagerShow(Sender: TObject);
    procedure HistoryGridTableViewBizImgPropertiesPopup(Sender: TObject);
    procedure HistoryGridTableViewCertiImgPropertiesPopup(Sender: TObject);
    procedure HistoryGridTableViewEmpImgPropertiesPopup(Sender: TObject);
  private
    procedure SetLog;
    procedure ShowImage(aName, aTitle:String; aIndex:Integer);
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StoreCallerRegForm: TStoreCallerRegForm;

implementation
uses Common, DBModule;

{$R *.dfm}

{ TStoreCallerRegForm }
function TStoreCallerRegForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := ' and a.DS_STATUS = ''0'' ';
    1 : vWhere := ' and a.DS_STATUS = ''1'' ';
    2 : vWhere := ' and a.DS_STATUS = ''2'' ';
    3 : vWhere := ' and a.DS_STATUS = ''3'' ';
    4 : vWhere := ' and (a.DS_STATUS =''2'') and ((b.BIZ_NO <> a.BIZ_NO) or (b.CEO_NAME <> a.CEO_NAME)) ';
    5 : vWhere := '';
  end;
  OpenQuery('select a.CD_CUSTOMER, '
           +'       b.NM_CUSTOMER, '
           +'       case when (a.DS_STATUS =''2'') and ((b.BIZ_NO <> a.BIZ_NO) or (b.CEO_NAME <> a.CEO_NAME)) then ''4'' else a.DS_STATUS end DS_STATUS '
           +'  from CUSTOMER_CALLER_REG a inner join '
           +'       CUSTOMER            b on b.CD_CUSTOMER = a.CD_CUSTOMER '
           +' where (b.NM_CUSTOMER like ConCat(''%'',:P0,''%'') or b.CD_CUSTOMER =:P0) '
           +'   and b.DS_STATUS = ''0'' '

           +vWhere
           +' order by a.CD_CUSTOMER ',
           [ConditionToolBarEdit.Text],false, RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStoreCallerRegForm.FormCreate(Sender: TObject);
begin
  inherited;
  ImagePanel.Top  := Self.Height div 2 - ImagePanel.Height div 2;
  ImagePanel.Left := Self.Width  div 2 - ImagePanel.Width div 2;
  AdvOfficePager.ActivePageIndex := 0;
end;

procedure TStoreCallerRegForm.GridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord.Values[GridTableViewStatus.Index] = '4' then
    AStyle := StyleFontRed;
end;

procedure TStoreCallerRegForm.HistoryGridTableViewBizImgPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  ShowImage('BIZ_IMG', '사업자등록증', HistoryGridTableViewBizImg.Index);
end;


procedure TStoreCallerRegForm.HistoryGridTableViewCertiImgPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  ShowImage('CERTI_IMG', '통신이용증명원', HistoryGridTableViewCertiImg.Index);
end;

procedure TStoreCallerRegForm.HistoryGridTableViewEmpImgPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  ShowImage('EMPLOYMENT_IMG', '재직증명서', HistoryGridTableViewEmpImg.Index);
end;

procedure TStoreCallerRegForm.ShowImage(aName, aTitle: String; aIndex:Integer);
var
  vStream    : TStream;
  vPNG       : TPNGImage;
  vImgName   : String;
begin
  inherited;
  if HistoryGridTableView.DataController.Values[HistoryGridTableView.DataController.GetFocusedRecordIndex, aIndex] = 'N' then Exit;

  try
    vImgName := aName;
    ImagePanel.Caption.Text := Format('<FONT color="#FFFFFF"  size="11" face="맑은 고딕"><P align="center">%s</P></FONT>',[aTitle]);
    OpenQuery('select CD_CUSTOMER, '+vImgName
             +'  from CUSTOMER_CALLER_REG_HIST '
             +' where CD_CUSTOMER =:P0 '
             +'   and Date_Format(DT_HIST, ''%Y-%m-%d %H:%i:%s'')  =:P1 ',
             [CustomerCodeEdit.Text,
              HistoryGridTableView.DataController.Values[HistoryGridTableView.DataController.GetFocusedRecordIndex, HistoryGridTableViewHistoryDate.Index] ],false,RestBaseURL);

    if not Query.Eof and (Query.FieldByName(vImgName).AsString <> '') then
    begin
      vStream := Query.CreateBLOBStream(Query.FieldByName(aName), bmRead);
      vPNG    := TPNGImage.Create;
      try
        vPNG.LoadFromStream(vStream);
        BizImage.Picture.Assign(vPNG);
        ImagePanel.Visible := true;
      finally
        vStream.Free;
        vPNG.Free;
      end;
    end
    else
    begin
      BizImage.Picture := nil;
    end;
  finally
    Query.Close;
  end;
end;


procedure TStoreCallerRegForm.HistoryPagerShow(Sender: TObject);
begin
  inherited;
  SetLog;
end;

procedure TStoreCallerRegForm.SetLog;
begin
  OpenQuery('select Date_Format(DT_HIST, ''%Y-%m-%d %H:%i:%s'') as DT_HIST, '
           +'       DS_HIST, '
           +'       case DS_STATUS when ''0'' then ''요청'' when ''1'' then ''보류'' when ''2'' then ''등록완료'' when ''3'' then ''중지'' end as DS_STATUS, '
           +'       CEO_NAME, '
           +'       GetBusinessNo(BIZ_NO) as BIZ_NO, '
           +'       GetPhoneNo(TEL_NO) as TEL_NO, '
           +'       case when BIZ_IMG   is null then ''N'' else ''이미지'' end as BIZ_IMG, '
           +'       case when CERTI_IMG is null then ''N'' else ''이미지'' end as CERTI_IMG, '
           +'       case when EMPLOYMENT_IMG is null then ''N'' else ''이미지'' end as EMPLOYMENT_IMG, '
           +'       REMARK, '
           +'       ID_USER'
           +'  from CUSTOMER_CALLER_REG_HIST '
           +' where CD_CUSTOMER =:P0 '
           +' order by DT_HIST desc ',
           [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCustomerCode.Index]],false, RestBaseURL);
  DM.ReadQuery(Query, HistoryGridTableView);
end;

procedure TStoreCallerRegForm.DoGridLink;
begin
  inherited;
  OpenQuery('select a.CEO_NAME, '
           +'       GetBusinessNo(a.BIZ_NO) as BIZ_NO, '
           +'       a.TEL_NO, '
           +'       a.DS_STATUS, '
           +'       case when a.BIZ_IMG   is null then ''N'' else ''Y'' end as BIZ_IMG, '
           +'       case when a.CERTI_IMG is null then ''N'' else ''Y'' end as CERTI_IMG, '
           +'       case when a.EMPLOYMENT_IMG is null then ''N'' else ''Y'' end as EMPLOYMENT_IMG, '
           +'       a.REMARK, '
           +'       GetBusinessNo(b.BIZ_NO) as STORE_BIZNO, '
           +'       b.CEO_NAME as STORE_CEONAME, '
           +'       b.TEL_OFFICE, '
           +'       b.TEL_MOBILE '
           +'  from CUSTOMER_CALLER_REG a inner join '
           +'       CUSTOMER            b on b.CD_CUSTOMER = a.CD_CUSTOMER '
           +' where a.CD_CUSTOMER =:P0 ',
           [GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCustomerCode.Index]],false, RestBaseURL);
  if not Query.Eof then
  begin
    CustomerCodeEdit.Text     := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCustomerCode.Index];
    CustomerNameEdit.Text     := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewCustomerName.Index];
    CEONameEdit.Text          := Query.FieldByName('CEO_NAME').AsString;
    BizNoEdit.Text            := Query.FieldByName('BIZ_NO').AsString;
    TelNoEdit.Text            := GetPhoneNo(Query.FieldByName('TEL_NO').AsString);
    BizImgButton.Enabled      := Query.FieldByName('BIZ_IMG').AsString = 'Y';
    CertiButton.Enabled       := Query.FieldByName('CERTI_IMG').AsString = 'Y';
    EmploymentButton.Enabled  := Query.FieldByName('EMPLOYMENT_IMG').AsString = 'Y';
    RemarkMemo.Text           := Query.FieldByName('REMARK').AsString;
    StatusComboBox.ItemIndex  := Query.FieldByName('DS_STATUS').AsInteger;
    StoreCeoNameLabel.Caption := Format('( %s )',[Query.FieldByName('STORE_CEONAME').AsString]);
    StoreBizNoLabel.Caption   := Format('( %s )',[Query.FieldByName('STORE_BIZNO').AsString]);
    StoreTelNoLabel.Caption   := Format('( %s,%s )',[GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString), GetPhoneNo(Query.FieldByName('TEL_MOBILE').AsString)]);
  end;
  Query.Close;
  ImagePanel.Visible := false;

  if HistoryPager.Showing then
    SetLog;
end;

function TStoreCallerRegForm.DoSave: Boolean;
begin
  Result := ExecQuery('update CUSTOMER_CALLER_REG '
                     +'   set DS_STATUS   =:P1, '
                     +'       REMARK      =:P2, '
                     +'       ID_USER     =:P3, '
                     +'       DT_CHANGE   = Now() '
                     +' where CD_CUSTOMER =:P0;',
                     [CustomerCodeEdit.Text,
                      IntToStr(StatusComboBox.ItemIndex),
                      RemarkMemo.Text,
                      UserCode],true,RestBaseURL);

  if Result then
  begin
    ExecQuery('update SMS_CUSTOMER '
             +'   set CALLBACK    =:P1, '
             +'       CB_SAUP_NO  =:P2 '
             +' where CD_CUSTOMER =:P0;',
             [CustomerCodeEdit.Text,
              IfThen(StatusComboBox.ItemIndex=2,GetOnlyNumber(TelNoEdit.Text),''),
              GetOnlyNumber(BizNoEdit.Text)],true,RestBaseURL);
  end;
end;

procedure TStoreCallerRegForm.BizImgButtonClick(Sender: TObject);
var
  vStream    : TStream;
  vPNG       : TPNGImage;
  vImgName   : String;
begin
  inherited;
  try
    vImgName := (Sender as TAdvGlowButton).Hint;
    case (Sender as TAdvGlowButton).Tag of
      0 : ImagePanel.Caption.Text := '<FONT color="#FFFFFF"  size="11" face="맑은 고딕"><P align="center">사업자등록증</P></FONT>';
      1 : ImagePanel.Caption.Text := '<FONT color="#FFFFFF"  size="11" face="맑은 고딕"><P align="center">통신이용증명원</P></FONT>';
      2 : ImagePanel.Caption.Text := '<FONT color="#FFFFFF"  size="11" face="맑은 고딕"><P align="center">재직증명서</P></FONT>';
    end;

    OpenQuery('select CD_CUSTOMER, '+vImgName
             +'  from CUSTOMER_CALLER_REG '
             +' where CD_CUSTOMER =:P0 ',
             [CustomerCodeEdit.Text,
              vImgName],false,RestBaseURL);

    if not Query.Eof and (Query.FieldByName(vImgName).AsString <> '') then
    begin
      vStream := Query.CreateBLOBStream(Query.FieldByName(vImgName), bmRead);
      vPNG    := TPNGImage.Create;
      try
        vPNG.LoadFromStream(vStream);
        BizImage.Picture.Assign(vPNG);
        ImagePanel.Visible := true;
      finally
        vStream.Free;
        vPNG.Free;
      end;
    end
    else
    begin
      BizImage.Picture := nil;
    end;
  finally
    Query.Close;
  end;
end;

function TStoreCallerRegForm.DoDelete: Boolean;
begin

end;

end.
