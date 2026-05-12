unit StoreSubPartner;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritGridEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxButtonEdit, cxMaskEdit, Vcl.StdCtrls, Data.DB, dxmdaset,
  Vcl.ExtCtrls, AdvToolBar, AdvToolBarStylers, cxClasses, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, cxTextEdit,
  cxDropDownEdit, cxLabel, cxCalendar, AdvGlowButton, AdvSplitter, cxMemo, Math,
  StrUtils, dxDateRanges, dxScrollbarAnnotations,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, AdvPanel, AdvOfficePager,
  AdvOfficePagerStylers;

type
  TStoreSubPartnerForm = class(TInheritGridEditForm)
    GoodsCodeLabel: TLabel;
    GoodsNameLabel: TLabel;
    CEONameLabel: TLabel;
    IDNoLabel: TLabel;
    TelNoLabel: TLabel;
    AddrLabel: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PartnerCodeEdit: TcxTextEdit;
    PartnerNameEdit: TcxTextEdit;
    CEONameEdit: TcxTextEdit;
    BizNoEdit: TcxMaskEdit;
    OfficeTelEdit: TcxTextEdit;
    ZipCodeEdit: TcxButtonEdit;
    Addr1Edit: TcxTextEdit;
    Addr2Edit: TcxTextEdit;
    DamdangNameEdit: TcxTextEdit;
    DamdangMobileEdit: TcxTextEdit;
    CeoMobileTelEdit: TcxTextEdit;
    FaxTelEdit: TcxTextEdit;
    EmailEdit: TcxTextEdit;
    Label9: TLabel;
    RemarkMemo: TcxMemo;
    UseYNLabel: TLabel;
    UseYNComboBox: TcxComboBox;
    EnterDateLabel: TLabel;
    RetireDateLabel: TLabel;
    EnterDateEdit: TcxDateEdit;
    RetireDateEdit: TcxDateEdit;
    GridTableViewPartnerCode: TcxGridColumn;
    GridTableViewColumn2: TcxGridColumn;
    procedure ZipCodeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPropertiesChange(Sender: TObject);
    procedure CeoMobileTelEditExit(Sender: TObject);
  private
    { Private declarations }
  protected
    function  DoSearch: Boolean; override;                      // 조회
    procedure DoGridLink; override;                             // 사용자 선택 시 연결 자료 오픈
    function  DoNew: Boolean; override;                         // 신규
    function  DoDelete: Boolean; override;                      // 삭제
    function  DoSave: Boolean; override;                        // 저장
  end;

var
  StoreSubPartnerForm: TStoreSubPartnerForm;

implementation
uses Common, DBModule, UnitZipPopup, Help;

{$R *.dfm}

{ TStoreSubPartnerForm }

procedure TStoreSubPartnerForm.CeoMobileTelEditExit(Sender: TObject);
begin
  inherited;
  (Sender as TcxTextEdit).Text := GetPhoneNo((Sender as TcxTextEdit).Text);
end;

function TStoreSubPartnerForm.DoDelete: Boolean;
begin
  Result := ExecQuery('delete from PARTNER_SUB '
                     +' where CD_PARTNER     = :P0; '
                     +'   and CD_PARTNER_SUB =:P1;',
                     [PartnerCode,
                      PartnerCodeEdit.Text],true,RestBaseURL);
end;

procedure TStoreSubPartnerForm.DoGridLink;
begin
  inherited;
  try
    OpenQuery('select CD_PARTNER, '
             +'       NM_PARTNER, '
             +'       BIZ_NO, '
             +'       CEO_NAME, '
             +'       TEL_OFFICE, '
             +'       TEL_MOBILE, '
             +'       TEL_FAX, '
             +'       NO_POST, '
             +'       ADDR1, '
             +'       ADDR2, '
             +'       EMAIL, '
             +'       NM_DAMDANG, '
             +'       TEL_DAMDANG, '
             +'       REMARK, '
             +'       CONTRACT_BEGIN, '
             +'       CONTRACT_END, '
             +'       YN_USE '
             +'  from PARTNER_SUB '
             +' where CD_PARTNER     = :P0 '
             +'   and CD_PARTNER_SUB = :P1 ',
             [PartnerCode,
              GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewPartnerCode.Index]],false,RestBaseURL);

    if not Query.Eof then
    begin
      PartnerCodeEdit.Text    := Query.FieldByName('CD_PARTNER').AsString;
      PartnerNameEdit.Text    := Query.FieldByName('NM_PARTNER').AsString;
      BizNoEdit.Text          := Query.FieldByName('BIZ_NO').AsString;
      CEONameEdit.Text        := Query.FieldByName('CEO_NAME').AsString;
      OfficeTelEdit.Text      := GetPhoneNo(Query.FieldByName('TEL_OFFICE').AsString);
      CeoMobileTelEdit.Text   := GetPhoneNo(Query.FieldByName('TEL_MOBILE').AsString);
      FaxTelEdit.Text         := GetPhoneNo(Query.FieldByName('TEL_FAX').AsString);
      ZipCodeEdit.Text        := Query.FieldByName('NO_POST').AsString;
      Addr1Edit.Text          := Query.FieldByName('ADDR1').AsString;
      Addr2Edit.Text          := Query.FieldByName('ADDR2').AsString;
      EMailEdit.Text          := Query.FieldByName('EMAIL').AsString;
      RemarkMemo.Text         := Query.FieldByName('REMARK').AsString;
      DamdangNameEdit.Text    := Query.FieldByName('NM_DAMDANG').AsString;
      DamdangMobileEdit.Text  := GetPhoneNo(Query.FieldByName('TEL_DAMDANG').AsString);
      EnterDateEdit.Date      := StoD(Query.FieldByName('CONTRACT_BEGIN').AsString);
      RetireDateEdit.Date     := StoD(Query.FieldByName('CONTRACT_END').AsString);
      UseYNComboBox.ItemIndex := Ifthen(Query.FieldByName('YN_USE').AsString='Y',0,1);
      RetireDateEdit.Visible  := UseYNComboBox.ItemIndex = 1;
      RetireDateLabel.Visible := RetireDateEdit.Visible;
      if not RetireDateEdit.Visible then
        RetireDateEdit.Date          := 0;
    end;
  finally
    FinishQuery;
  end;

end;

function TStoreSubPartnerForm.DoNew: Boolean;
begin
  OpenQuery('select LPad(Ifnull(Max(CD_PARTNER_SUB),0)+1,4,''0'') '
           +'  from PARTNER_SUB '
           +' where CD_PARTNER =:P0 ',
           [PartnerCode],false,RestBaseURL);
  PartnerCodeEdit.Text := Query.Fields[0].AsString;
  Query.Close;
  RetireDateEdit.Date := Now();
  PartnerNameEdit.SetFocus;
  Result := true;
end;

function TStoreSubPartnerForm.DoSave: Boolean;
begin
  Result := false;

  if PartnerNameEdit.Text='' then
  begin
    MsgBox('대리점명을 입력해야합니다');
    Exit;
  end;

  Result := ExecQuery(Ifthen(isNew,'insert into PARTNER_SUB(CD_PARTNER, '
                                  +'                        CD_PARTNER_SUB, '
                                  +'                        NM_PARTNER, '
                                  +'                        BIZ_NO, '
                                  +'                        CEO_NAME, '
                                  +'                        TEL_OFFICE, '
                                  +'                        TEL_MOBILE, '
                                  +'                        TEL_FAX, '
                                  +'                        NO_POST, '
                                  +'                        ADDR1, '
                                  +'                        ADDR2, '
                                  +'                        EMAIL, '
                                  +'                        NM_DAMDANG, '
                                  +'                        TEL_DAMDANG, '
                                  +'                        REMARK, '
                                  +'                        CONTRACT_BEGIN, '
                                  +'                        CONTRACT_END, '
                                  +'                        YN_USE) '
                                  +'             values(:P0, '
                                  +'                    :P1, '
                                  +'                    :P2, '
                                  +'                    :P3, '
                                  +'                    :P4, '
                                  +'                    :P5, '
                                  +'                    :P6, '
                                  +'                    :P7, '
                                  +'                    :P8, '
                                  +'                    :P9, '
                                  +'                    :P10, '
                                  +'                    :P11, '
                                  +'                    :P12, '
                                  +'                    :P13, '
                                  +'                    :P14, '
                                  +'                    :P15, '
                                  +'                    :P16, '
                                  +'                    :P17);',
                                   'update PARTNER_SUB '
                                  +'   set NM_PARTNER     =:P2, '
                                  +'       BIZ_NO         =:P3, '
                                  +'       CEO_NAME       =:P4, '
                                  +'       TEL_OFFICE     =:P5, '
                                  +'       TEL_MOBILE     =:P6, '
                                  +'       TEL_FAX        =:P7, '
                                  +'       NO_POST        =:P8, '
                                  +'       ADDR1          =:P9, '
                                  +'       ADDR2          =:P10, '
                                  +'       EMAIL          =:P11, '
                                  +'       NM_DAMDANG     =:P12, '
                                  +'       TEL_DAMDANG    =:P13, '
                                  +'       REMARK         =:P14, '
                                  +'       CONTRACT_BEGIN =:P15, '
                                  +'       CONTRACT_END   =:P16, '
                                  +'       YN_USE         =:P17 '
                                  +' where CD_PARTNER     =:P0 '
                                  +'   and CD_PARTNER_SUB =:P1;'),
                                  [PartnerCode,
                                   PartnerCodeEdit.Text,
                                   PartnerNameEdit.Text,
                                   BizNoEdit.Text,
                                   CEONameEdit.Text,
                                   OfficeTelEdit.Text,
                                   CeoMobileTelEdit.Text,
                                   FaxTelEdit.Text,
                                   ZipCodeEdit.Text,
                                   Addr1Edit.Text,
                                   Addr2Edit.Text,
                                   EMailEdit.Text,
                                   DamdangNameEdit.Text,
                                   DamdangMobileEdit.Text,
                                   RemarkMemo.Text,
                                   DtoS(EnterDateEdit.Date),
                                   IfThen(RetireDateEdit.Date = 0, EmptyStr, DtoS(RetireDateEdit.Date)),
                                   Ifthen(UseYNComboBox.ItemIndex=0,'Y','N')],true,RestBaseURL);

end;

function TStoreSubPartnerForm.DoSearch: Boolean;
var vWhere :String;
begin
  case ConditionToolBarComboBox.ItemIndex of
    0 : vWhere := ' and YN_USE = ''Y'' ';
    1 : vWhere := ' and YN_USE = ''N'' ';
    2 : vWhere := '';
  end;
  OpenQuery('select CD_PARTNER, '
           +'       NM_PARTNER, '
           +'       YN_USE '
           +'  from PARTNER_SUB  '
           +' where CD_PARTNER  = :P0 '
           +'   and NM_PARTNER like ConCat(''%'',:P1,''%'') '
           +vWhere
           +' order by CD_PARTNER ',
           [PartnerCode,
            ConditionToolBarEdit.Text],false,RestBaseURL);
  Result := DM.ReadQuery(Query, GridTableView);
end;

procedure TStoreSubPartnerForm.EditPropertiesChange(Sender: TObject);
begin
  inherited;
  if Sender = UseYNComboBox then
  begin
    RetireDateEdit.Visible  := UseYNComboBox.ItemIndex = 1;
    RetireDateLabel.Visible := RetireDateEdit.Visible;
    if RetireDateEdit.Visible then
      RetireDateEdit.Date := Date
    else
      RetireDateEdit.Date := 0;
  end;
end;

procedure TStoreSubPartnerForm.ZipCodeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  vZipNo, vRoadAddr, vJibunAddr: string;
begin
  inherited;
  if TFrmZipPopup.Execute(vZipNo, vRoadAddr, vJibunAddr) then
  begin
    ZipCodeEdit.Text := vZipNo;
    Addr1Edit.Text := vRoadAddr;
    Addr2Edit.Text := '';
    Addr2Edit.SetFocus;
  end;
end;

end.
